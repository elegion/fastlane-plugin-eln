describe Fastlane::Helper::CertsHelper do
  describe '#run' do
    it "valid" do
      expect(Fastlane::Helper::CertsHelper.validate_provisions("some:value")).to eql([["some", "value"]])
      expect(Fastlane::Helper::CertsHelper.validate_provisions("some:value, some:value2")).to eql([["some", "value"], ["some", "value2"]])
      expect(Fastlane::Helper::CertsHelper.validate_provisions("some:value, some:   value2")).to eql([["some", "value"], ["some", "value2"]])
      expect(Fastlane::Helper::CertsHelper.validate_provisions("some spaced value   :value, some:   value2")).to eql([["some spaced value", "value"], ["some", "value2"]])
    end
    it "fails" do
      expect(Fastlane::UI).to receive(:error)
      Fastlane::Helper::CertsHelper.validate_provisions("some:value,some")
    end
  end
end
