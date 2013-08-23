Given /the following categories exist/  do |categories_table|
  categories_table.hashes.each do |category|
    Category.create! category
  end
    
end