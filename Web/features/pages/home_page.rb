class HomePage < SitePrism::Page
  set_url '/'

  element :input_search, 'input'
  element :search_button, "div[data-testid='search-icon']"
end
