class Customer {
  final String name;
  final String document;

  Customer({required this.name, required this.document});
}

class Product {
  final int code;
  final String name;
  final double price;
  final double discount;

  Product({
    required this.code,
    required this.name,
    required this.price,
    this.discount = 0,
  });

  get priceWithDiscount {
    return this.price - ((this.discount / 100) * this.price);
  }
}

class SaleItem {
  final Product product;
  final int quantity;
  double? _price;

  SaleItem({required this.product, this.quantity = 1});

  double get price {
    if (this._price == null) {
      this._price = this.product.priceWithDiscount;
    }

    return this._price as double;
  }

  set price(double price) {
    if (price > 0) this._price = price;
  }
}

class Sale {
  final Customer customer;
  final List<SaleItem> sales;

  Sale({required this.customer, this.sales = const []});

  factory Sale.makeThreeProductSale({
    required Customer customer,
    required SaleItem firstSaleItem,
    required SaleItem secondSaleItem,
    required SaleItem thirdSaleItem,
  }) {
    return new Sale(
      customer: customer,
      sales: [firstSaleItem, secondSaleItem, thirdSaleItem],
    );
  }

  double get totalValue {
    return this
        .sales
        .map((sale) => sale.price * sale.quantity)
        .reduce((t, a) => t + a);
  }
}

void main(List<String> args) {
  final customer = Customer(name: 'Victor', document: '066.863.939-32');

  final table = Product(
    code: 01,
    name: 'Table',
    price: 200.000,
    discount: 10.00,
  );
  final chair = Product(code: 02, name: 'Chair', price: 80.00);
  final jar = Product(code: 03, name: 'Jar', price: 36.90);

  final tableSaleItem = SaleItem(product: table);
  final chairSaleItem = SaleItem(product: chair);
  final jarSaleItem = SaleItem(product: jar);

  final mySale = Sale.makeThreeProductSale(
    customer: customer,
    firstSaleItem: tableSaleItem,
    secondSaleItem: chairSaleItem,
    thirdSaleItem: jarSaleItem,
  );

  print('Valor total da venda com 3 produtos: ${mySale.totalValue}');
}
