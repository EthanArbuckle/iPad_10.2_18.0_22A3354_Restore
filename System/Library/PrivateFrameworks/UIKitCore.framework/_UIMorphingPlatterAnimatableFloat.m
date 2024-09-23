@implementation _UIMorphingPlatterAnimatableFloat

- (void)setValue:(double)a3
{
  double v5;
  double v6;
  objc_super v7;

  -[UIViewFloatAnimatableProperty value](self, "value");
  if (vabdd_f64(a3, v5) > 2.22044605e-16)
  {
    -[UIViewFloatAnimatableProperty value](self, "value");
    self->_lastModelValueChangeWasPositive = v6 < a3;
    v7.receiver = self;
    v7.super_class = (Class)_UIMorphingPlatterAnimatableFloat;
    -[UIViewFloatAnimatableProperty setValue:](&v7, sel_setValue_, a3);
  }
}

- (BOOL)lastModelValueChangeWasPositive
{
  return self->_lastModelValueChangeWasPositive;
}

@end
