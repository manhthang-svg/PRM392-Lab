void exercise1() {
  print("===== Exercise 1 =====");
  int age = 21;
  double height = 1.75;
  String name = "Thang";
  bool isStudent = true;
  print("Name: $name");
  print("Age: $age");
  print("Height: $height");
  print("Student: $isStudent");
  print("Age after 5 years: ${age + 5}");
  print("");
}

void exercise2() {
  print("===== Exercise 2 =====");

  // List
  List<int> numbers = [1, 2, 3, 4];

  print(numbers);

  // Indexing
  print(numbers[0]);

  // Add
  numbers.add(5);

  // Remove
  numbers.remove(2);

  print(numbers);

  // Operators
  int a = 10;
  int b = 5;

  print(a + b);
  print(a - b);
  print(a == b);
  print(a > b && b > 0);

  // Ternary operator
  String result = a > b ? "A bigger" : "B bigger";

  print(result);

  // Set
  Set<String> fruits = {"Apple", "Orange", "Apple"};

  print(fruits);

  // Map
  Map<String, int> scores = {"Math": 9, "English": 8};

  print(scores);

  print(scores["Math"]);

  print("");
}

int add(int a, int b) {
  return a + b;
}

int square(int x) => x * x;

void exercise3() {
  print("===== Exercise 3 =====");

  int score = 85;

  // if else
  if (score >= 80) {
    print("Excellent");
  } else {
    print("Average");
  }

  // switch
  String day = "Monday";

  switch (day) {
    case "Monday":
      print("Start working");
      break;

    case "Sunday":
      print("Relax");
      break;

    default:
      print("Normal day");
  }

  // for loop
  for (int i = 0; i < 3; i++) {
    print(i);
  }

  // for-in
  List<String> names = ["A", "B", "C"];

  for (String name in names) {
    print(name);
  }

  // forEach
  names.forEach((name) {
    print("Hello $name");
  });

  // Function
  print(add(5, 3));

  // Arrow function
  print(square(4));

  print("");
}

void exercise4() {
  print("===== Exercise 4 =====");

  Car car1 = Car("Toyota");

  car1.showInfo();

  Car car2 = Car.electric("Tesla");

  car2.showInfo();

  ElectricCar ec = ElectricCar("VinFast");

  ec.showInfo();

  print("");
}

class Car {
  String brand;

  // Constructor
  Car(this.brand);

  // Named constructor
  Car.electric(this.brand);

  void showInfo() {
    print("Car brand: $brand");
  }
}

class ElectricCar extends Car {
  ElectricCar(String brand) : super(brand);

  @override
  void showInfo() {
    print("Electric car brand: $brand");
  }
}

Future<void> exercise5() async {
  print("===== Exercise 5 =====");

  await loadData();

  // Null safety
  String? name;

  print(name ?? "No name");

  name = "Thang";

  print(name);

  // Stream
  Stream<int> numbers = Stream.periodic(Duration(seconds: 1), (x) => x).take(5);

  await for (int number in numbers) {
    print(number);
  }

  print("");
}

Future<void> loadData() async {
  print("Loading...");

  await Future.delayed(Duration(seconds: 2));

  print("Finished loading");
}

