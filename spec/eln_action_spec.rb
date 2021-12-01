describe Fastlane::Actions::ElnAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The eln plugin is working!")

      Fastlane::Actions::ElnAction.run(nil)
    end
  end
end
