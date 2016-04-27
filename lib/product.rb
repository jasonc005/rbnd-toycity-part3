class Product
  attr_reader :title

  @@products = []

  def initialize(options={})
    @title = options[:title]
    add_to_products
  end

  def self.all
    @@products
  end

  def self.find_by_title(to_find)
    @@products.find {|prod| prod.title == to_find}
  end

  private

  def add_to_products
    if @@products.map(&:title).include? @title
      raise DuplicateProductError, "#{@title} already exists."
    else
      @@products << self
    end
  end
end
