class InitializePages
  def home
    @home ||= HomePage.new
  end

  def search_result
    @search_result ||= SearchResultPage.new
  end
end
