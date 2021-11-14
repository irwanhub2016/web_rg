Then 'user able to get search data by {string} and {string}' do |param, value|
  response = ApiBaseHelper.get("#{@api_endpoint['search']}?#{param}=#{value}")
  expect(response.code.to_i).to eql 200
  expect(response.body['status']).to eql 'success'
end
