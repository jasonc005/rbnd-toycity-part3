class Transaction
  attr_reader :product, :customer, :id

  @@id = 1
  @@transactions = []

  #Initializes a Transaction object
  def initialize(customer,product)
    @customer = customer
    @product = product
    @id = @@id
    @@transactions << self

    product.stock -= 1
    @@id += 1
  end

  #Returns all transactions
  def self.all
    @@transactions
  end

  #Finds and returns transaction by number
  def self.find(index)
    @@transactions.find {|trans| trans.id == index}
  end

  #Finds all Transactions by the customer involved
  def self.find_by_customer(customer)
    @@transactions.select {|trans| trans.customer.name == customer.name}
  end

  #Finds all Transactions by product involved
  def self.find_by_product(product)
    @@transactions.select {|trans| trans.product.title == product.title}
  end

end
