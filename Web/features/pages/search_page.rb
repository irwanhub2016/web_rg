class SearchResultPage < SitePrism::Page
  set_url '/'

  elements :course_title, "#main-scrollview h2[data-testid='course-title']"
  element :total_result, "#main-scrollview  span[data-testid='total-result']"
  element :total_item, "#main-scrollview p[data-testid='total-item']"
  elements :pagination, '#main-scrollview div[data-testid*= pagination-page]'
  element :spinner, :xpath, "//img[@alt='Small Spinner']"
  element :text_data_not_found, "#main-scrollview p[data-testid='empty-card-title'] span:nth-child(1)"
  element :seach_data, "#main-scrollview p[data-testid='empty-card-title'] span:nth-child(2)"
  element :select_filter, :xpath, "//div[text()='Pilih']"
  elements :filter_price, 'div[id*=select-12-option]'
end
