require 'spec_helper'

describe GH::CustomLimit do
  before do
    subject.client_id     = 'foo'
    subject.client_secret = 'bar'
  end

  it 'adds client_id and client_secret to a request' do
    headers = {
      "User-Agent"     => "GH/0.11.2",
      "Accept"         => "application/vnd.github.v3+json,application/vnd.github.beta+json;q=0.5,application/json;q=0.1",
      "Accept-Charset" => "utf-8"
    }

    subject.
      should_receive(:http).
      with(:get, '/x?client_id=foo&client_secret=bar', headers).
      and_return(GH::Response.new)

    subject['/x']
  end
end
