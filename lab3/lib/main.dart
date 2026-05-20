import 'dart:async';
import 'dart:convert';

/// ======================================================
/// EXERCISE 1 - Product Model & Repository
/// ======================================================

class Product {
  final int id;
  final String name;
  final double price;

  Product(this.id, this.name, this.price);

  @override
  String toString() {
    return 'Product(id: $id, name: $name, price: $price)';
  }
}

class ProductRepository {
  // broadcast() cho phép nhiều listener cùng nghe stream
  final StreamController<Product> _controller =
      StreamController<Product>.broadcast();

  // Giả lập lấy dữ liệu async từ database/API
  Future<List<Product>> getAll() async {
    await Future.delayed(Duration(seconds: 1));

    return [
      Product(1, 'Laptop', 1200),
      Product(2, 'Mouse', 25),
    ];
  }

  // Stream realtime khi có sản phẩm mới
  Stream<Product> liveAdded() {
    return _controller.stream;
  }

  // Thêm sản phẩm mới vào stream
  void addProduct(Product product) {
    _controller.add(product);
  }

  void dispose() {
    _controller.close();
  }
}

/// ======================================================
/// EXERCISE 2 - User Repository with JSON
/// ======================================================

class User {
  final String name;
  final String email;

  User({required this.name, required this.email});

  // Factory constructor parse JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      email: json['email'],
    );
  }

  @override
  String toString() {
    return 'User(name: $name, email: $email)';
  }
}

class UserRepository {
  Future<List<User>> fetchUsers() async {
    await Future.delayed(Duration(seconds: 1));

    // Giả lập JSON từ API
    String jsonData = '''
    [
      {"name": "Alice", "email": "alice@gmail.com"},
      {"name": "Bob", "email": "bob@gmail.com"}
    ]
    ''';

    // Decode JSON
    List<dynamic> data = jsonDecode(jsonData);

    // Convert JSON -> User object
    return data.map((e) => User.fromJson(e)).toList();
  }
}

/// ======================================================
/// EXERCISE 3 - Async + Microtask Debugging
/// ======================================================

void microtaskExample() {
  print('\n=== Exercise 3 ===');

  print('Start');

  // Đưa vào microtask queue
  scheduleMicrotask(() {
    print('Microtask executed');
  });

  // Đưa vào event queue
  Future(() {
    print('Future event executed');
  });

  print('End');

  /*
    Expected order:

    Start
    End
    Microtask executed
    Future event executed

    Vì:
    - synchronous code chạy trước
    - microtask queue ưu tiên hơn event queue
  */
}

/// ======================================================
/// EXERCISE 4 - Stream Transformation
/// ======================================================

Future<void> streamTransformationExample() async {
  print('\n=== Exercise 4 ===');

  Stream<int> numberStream = Stream.fromIterable([1, 2, 3, 4, 5]);

  // Bình phương và lọc số chẵn
  Stream<int> resultStream = numberStream
      .map((number) => number * number)
      .where((square) => square % 2 == 0);

  await for (var value in resultStream) {
    print('Received: $value');
  }

  /*
    Squares:
    1,4,9,16,25

    Even:
    4,16
  */
}

/// ======================================================
/// EXERCISE 5 - Factory Constructors & Cache
/// ======================================================

class Settings {
  static final Settings _instance = Settings._internal();

  // Private constructor
  Settings._internal();

  // Factory constructor trả về cùng 1 object
  factory Settings() {
    return _instance;
  }
}

/// ======================================================
/// MAIN FUNCTION
/// ======================================================

Future<void> main() async {
  /// --------------------------------------------------
  /// Exercise 1
  /// --------------------------------------------------

  print('=== Exercise 1 ===');

  ProductRepository productRepo = ProductRepository();

  // Listen realtime stream
  productRepo.liveAdded().listen((product) {
    print('New Product Added: $product');
  });

  // Lấy danh sách sản phẩm
  List<Product> products = await productRepo.getAll();

  print('All Products:');
  for (var product in products) {
    print(product);
  }

  // Giả lập thêm realtime product
  productRepo.addProduct(Product(3, 'Keyboard', 45));

  await Future.delayed(Duration(seconds: 1));

  /// --------------------------------------------------
  /// Exercise 2
  /// --------------------------------------------------

  print('\n=== Exercise 2 ===');

  UserRepository userRepo = UserRepository();

  List<User> users = await userRepo.fetchUsers();

  for (var user in users) {
    print(user);
  }

  /// --------------------------------------------------
  /// Exercise 3
  /// --------------------------------------------------

  microtaskExample();

  // Delay để thấy rõ thứ tự output
  await Future.delayed(Duration(seconds: 1));

  /// --------------------------------------------------
  /// Exercise 4
  /// --------------------------------------------------

  await streamTransformationExample();

  /// --------------------------------------------------
  /// Exercise 5
  /// --------------------------------------------------

  print('\n=== Exercise 5 ===');

  Settings a = Settings();
  Settings b = Settings();

  print('Same instance: ${identical(a, b)}');

  /*
    Expected:
    true
  */

  productRepo.dispose();
}