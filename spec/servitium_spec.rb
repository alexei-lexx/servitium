RSpec.describe Servitium do
  it "has a version number" do
    expect(Servitium::VERSION).not_to be nil
  end

  context "when it is included into PingGoogle" do
    let(:ping_google) { instance_double(PingGoogle) }

    before do
      class PingGoogle
        include Servitium

        def call
          "ping google"
        end
      end

      allow(PingGoogle).to receive(:new).and_return(ping_google)
      allow(ping_google).to receive(:call)
    end

    context "and we call PingGoogle.call without arguments" do
      before do
        PingGoogle.call
      end

      it "calls PingGoogle.new without arguments" do
        expect(PingGoogle).to have_received(:new).with(no_args)
      end

      it "calls PingGoogle#call" do
        expect(ping_google).to have_received(:call).with(no_args)
      end
    end

    context "and we call PingGoogle.call with arguments" do
      before do
        class PingGoogle
          def initialize(host, timeout:)
            @host = host
            @timeout = timeout
          end
        end

        PingGoogle.call("google.com", timeout: 10)
      end

      it "calls PingGoogle.new with same arguments" do
        expect(PingGoogle).to have_received(:new).with("google.com", timeout: 10)
      end

      it "calls PingGoogle#call" do
        expect(ping_google).to have_received(:call).with(no_args)
      end
    end
  end
end
