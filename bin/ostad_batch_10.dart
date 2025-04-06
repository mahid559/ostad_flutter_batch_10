abstract class Vehicle {
  int _speed = 0;

  void move();

  void setSpeed(int speed) {
    _speed = speed;
  }
}


void main() {
  Car myCar = Car();

  myCar.setSpeed(80);

  myCar.move();
}