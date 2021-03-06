# frozen_string_literal: true

require 'test_helper'

class SDKV3Test < Minitest::Test
  def test_upload_raises_no_s3
    with_config(s3_bucket: 'test.s3.bucket') do
      with_sdk_v3_loaded do |sdk|
        sdk.stub(:require, ->(_) { raise LoadError }) do
          assert_raises do
            sdk.upload(payload(identifier: 'identifier', to_cf: 'body'))
          end
        end
      end
    end
  end

  def test_upload_with_s3
    with_valid_upload do |sdk|
      SdkSupport.expect(:config, [], SdkSupport.double)
      SdkSupport.expect(:update, [region: Humidifier::AwsShim::REGION])

      arguments =
        [body: 'body', bucket: 'test.s3.bucket', key: 'identifier.json']
      SdkSupport.expect(:put_object, arguments)

      SdkSupport.expect(:presigned_url, [:get])
      sdk.upload(payload(identifier: 'identifier', to_cf: 'body'))
      SdkSupport.verify
    end
  end

  private

  def with_valid_upload
    with_config(s3_bucket: 'test.s3.bucket') do
      with_sdk_v3_loaded do |sdk|
        sdk.stub(:require, true) do
          yield sdk
        end
      end
    end
  end
end
