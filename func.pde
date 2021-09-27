class func {
  ArrayList<polyP> pieces = new ArrayList<polyP>();
  ArrayList<polyP> derivPieces = new ArrayList<polyP>();

  ArrayList<PVector> vecs = new ArrayList<PVector>();
  ArrayList<PVector> derivVecs = new ArrayList<PVector>();

  func() {
    pieces.add(new polyP(.001, 3, "f(x)"));
    findDeriv();
    points();
  }

  public void findDeriv() {
    for (polyP p : pieces) {
      p.deriv = p.derivative();
      derivPieces.add(p.deriv);
    }
  }

  public void points() {
    for (int i = -width/2; i < width/2; i++) {
      float sum = 0;
      float derivSum = 0;
      for (polyP p : pieces) {
        sum+=p.func(i);
        derivSum+=p.derivFunc(i);
      }
      vecs.add(new PVector(i, sum));
      derivVecs.add(new PVector(i,derivSum));
    }
  }

  public void analysis() {
    for (polyP p : pieces) {
      p.analysis();
    }
  }

  public void show() {
    noFill();
    beginShape();
    stroke(0, 0, 255);
    for (PVector v : vecs) {
      vertex(v.x, v.y);
    }
    endShape();
    
    stroke(255,0,0);
    beginShape();
    for (PVector v : derivVecs) {
      vertex(v.x,v.y);
    }
    endShape();
  }
}
