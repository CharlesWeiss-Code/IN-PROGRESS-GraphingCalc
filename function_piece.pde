class polyP {
  float a;
  float b;
  String name;

  polyP deriv;

  polyP(float a, float b, String name) {
    this.a = a;
    this.b = b;
    this.name = name;
  }

  polyP(float b, String name) {
    this.a = 1;
    this.b = b;
    this.name = name;
  }


  public float func(float x) {
    return -a*pow(x, b);
  }

  public float derivFunc(float x) {
    return -deriv.a*pow(x, deriv.b);
  }

  public polyP derivative() {
    return new polyP(a*b, b-1, primeName());
  }

  public String primeName() {
    String result = "";
    for (char c : name.toCharArray()) {
      if (c == '(') {
        result += '∂';
      }
      result += c;
    }
    return result;
  }

  public void findPoints() {
    for (int i = -width/2; i < width/2; i++) {
      PVector v = new PVector(i, func(i));
      PVector dv = new PVector(i, derivFunc(i));
      evalFunc.add(v);
      evalDeriv.add(dv);
    }
  }

  public void analysis() {
    println("Function: Blue");
    println(name + "=" + a + "x^" +b);
    println(" ");
    println("Derivative: Red");
    println(deriv.name + "=" + deriv.a +"x^" +deriv.b);
  }


  public void show() {
    noFill();
    stroke(0, 0, 255);
    beginShape();
    for (PVector v : evalFunc) {
      vertex(v.x, v.y);
    }
    endShape();
    noFill();
    stroke(255, 0, 0);
    beginShape();
    for (PVector v : evalDeriv) {
      vertex(v.x, v.y);
    }
    endShape();
  }
}
