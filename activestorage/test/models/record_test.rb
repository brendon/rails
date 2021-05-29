# frozen_string_literal: true

require "test_helper"

class ActiveStorage::RecordTest < ActiveSupport::TestCase

  def test_table_name_can_be_prefixed
    ActiveRecord::Base.table_name_prefix = "prefixed_"
    ActiveStorage::Blob.reset_table_name
    ActiveStorage::VariantRecord.reset_table_name
    ActiveStorage::Attachment.reset_table_name

    assert_equal "prefixed_active_storage_blobs", ActiveStorage::Blob.table_name
    assert_equal "prefixed_active_storage_variants", ActiveStorage::VariantRecord.table_name
    assert_equal "prefixed_active_storage_attachments", ActiveStorage::Attachment.table_name
  ensure
    ActiveRecord::Base.table_name_prefix = ""
    ActiveStorage::Blob.reset_table_name
    ActiveStorage::VariantRecord.reset_table_name
    ActiveStorage::Attachment.reset_table_name
  end

end
