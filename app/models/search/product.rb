class Search::Product < Search::Base
  ATTRIBUTES = %i(
    name
  )
  attr_accessor(*ATTRIBUTES)

  def matches
    t = ::Product.arel_table
    results = ::Product.all
    results = results.where(contains(t[:name], name)) if name.present?
  end
end
