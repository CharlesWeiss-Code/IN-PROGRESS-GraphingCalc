polyP test;
ArrayList<PVector> evalFunc = new ArrayList<PVector>();
ArrayList<PVector> evalDeriv = new ArrayList<PVector>();
func f;
void setup() {
  size(600, 600);
  f = new func();
  f.analysis();
  //test = new polyP(.1, 3, "f(x)");
  //test.deriv = test.derivative();
  //test.findPoints();
  //test.analysis();
}

void draw() {
  translate(width/2, height/2);
  background(51);
  //test.show();
 // f.show();
}
