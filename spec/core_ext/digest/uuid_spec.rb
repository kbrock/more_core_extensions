describe Digest::UUID do
  context "clean_guid" do
    let(:expected) { '01234567-89ab-cdef-abcd-ef0123456789' }

    it "handles a valid lowercase guid as expected" do
      expect(described_class.clean_guid('01234567-89ab-cdef-abcd-ef0123456789')).to eq(expected)
    end

    it "handles a Microsoft-style guid as expected" do
      expect(described_class.clean_guid('{01234567-89ab-cdef-abcd-ef0123456789}')).to eq(expected)
    end

    it "handles a valid uppercase guid as expected" do
      expect(described_class.clean_guid('01234567-89AB-CDEF-abcd-ef0123456789')).to eq(expected)
    end

    it "handles a valid guid with an invalid structure as expected" do
      expect(described_class.clean_guid('01 23 45 67 89 AB CD EF-AB CD EF 01 23 45 67 89')).to eq(expected)
    end

    it "handles an explicit nil or blank string as expected" do
      expect(described_class.clean_guid(nil)).to be_nil
      expect(described_class.clean_guid('')).to be_nil
    end

    it "handles invalid guids as expected" do
      expect(described_class.clean_guid('sdkjfLSDLK')).to be_nil
      expect(described_class.clean_guid('sdkjfLSD-LKJF-8367-41df-FLKD209alkfd')).to be_nil
      expect(described_class.clean_guid('01234567-89AB-CDEF-abcd-efgggggggggg')).to be_nil
      expect(described_class.clean_guid('01234567-89AB-CDEF-abcd-ef0123456789a')).to be_nil
      expect(described_class.clean_guid('01234567-89AB-CDEF-abcd-ef012345678')).to be_nil
    end
  end
end
