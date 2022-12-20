class Formula {
  static double add(double value1, double value2) {
    double result;
    result = value1 + value2;
    return result;
  }

  static double subtract(double value1, double value2) {
    double result;
    result = value1 - value2;
    return result;
  }

  static double multiply(double value1, double value2) {
    double result;
    result = value1 * value2;
    return result;
  }

  static double divide(double value1, double value2) {
    double result;
    result = value1 / value2;
    return result;
  }

  static double addPercentage(double value1, double value2) {
    double result;
    result = value1 + value2 / 100 * value1;
    return result;
  }

  static double subtractPercentage(double value1, double value2) {
    double result;
    result = value1 - value2 / 100 * value1;
    return result;
  }

  static double multiplyPercentage(double value1, double value2) {
    double result;
    result = value1 * value2 / 100;
    return result;
  }

  static double dividePercentage(double value1, double value2) {
    double result;
    result = value1 / value2 * 100;
    return result;
  }
}
