module ApiBaseHelper
  private_class_method def self.execute(url, request, request_body = nil)
    http = Net::HTTP.new(url.host, url.port)
    http.open_timeout = 120
    http.use_ssl = (url.scheme == 'https')
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request.body = request_body.to_json unless request_body.nil?

    retries = 1
    begin
      response = http.request(request)
    rescue Exception => e
      p e.message
      retry if (retries += 1) < 5
      raise e.message if retries == 5
    end

    response.body = JSON.parse(response.read_body) unless response.read_body.nil? || response.read_body.empty?

    response
  end

  def post(endpoint, request_body = nil)
    url = URI($base_url.to_s + endpoint)
    request = Net::HTTP::Post.new(url)
    send(:execute, url, request, request_body)
  end

  def get(endpoint, request_body = nil)
    url = URI($base_url.to_s + endpoint)
    request = Net::HTTP::Get.new(url)
    send(:execute, url, request, request_body)
  end

  def patch(endpoint, request_body = nil)
    url = URI($base_url.to_s + endpoint)
    request = Net::HTTP::Patch.new(url)
    send(:execute, url, request, request_body)
  end

  def delete(endpoint, request_body = nil)
    url = URI($base_url.to_s + endpoint)
    request = Net::HTTP::Delete.new(url)
    send(:execute, url, request, request_body)
  end

  def put(endpoint, request_body = nil)
    url = URI($base_url.to_s + endpoint)
    request = Net::HTTP::Put.new(url)
    send(:execute, url, request, request_body)
  end
end
