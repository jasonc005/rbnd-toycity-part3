class Product
  attr_reader :title, :price, :stock

  @@products = []

  #Initialize Product instances
  def initialize(options={})
    @title = options[:title]
    @price = options[:price]
    @stock = options[:stock] || 0
    add_to_products
  end

  #Returns array of all products
  def self.all
    @@products
  end

  #Returns Product object by given title
  def self.find_by_title(to_find)
    @@products.find {|prod| prod.title == to_find}
  end

  #Checks to see if a product is in stock
  def in_stock?
    if @stock <= 0
      false
    else
      true
    end
  end

  #Returns an array of all products in stock
  def self.in_stock
    products_in_stock = []
    @@products.each {|prod| products_in_stock << prod if prod.in_stock?}
    products_in_stock
  end

  private

  #Used in initialize to make sure product doesn't already exist
  def add_to_products
    if @@products.map(&:title).include? @title
      raise DuplicateProductError, "#{@title} already exists."
    else
      @@products << self
    end
  end
end
