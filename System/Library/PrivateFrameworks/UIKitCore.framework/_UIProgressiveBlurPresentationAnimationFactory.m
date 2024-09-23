@implementation _UIProgressiveBlurPresentationAnimationFactory

- (_UIProgressiveBlurPresentationAnimationFactory)initWithCurve:(unint64_t)a3
{
  _UIProgressiveBlurPresentationAnimationFactory *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIProgressiveBlurPresentationAnimationFactory;
  result = -[_UIProgressiveBlurPresentationAnimationFactory init](&v5, sel_init);
  if (result)
    result->_curve = a3;
  return result;
}

- (id)_basicAnimationForView:(id)a3 withKeyPath:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", a4);
}

- (id)_timingFunctionForAnimationInView:(id)a3 withKeyPath:(id)a4
{
  unint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;

  v4 = -[_UIProgressiveBlurPresentationAnimationFactory curve](self, "curve", a3, a4);
  if (v4 == 1)
  {
    v9 = (void *)MEMORY[0x1E0CD27D0];
    LODWORD(v5) = 1040522936;
    LODWORD(v6) = 1052938076;
    LODWORD(v7) = 1043878380;
  }
  else
  {
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      return v10;
    }
    v9 = (void *)MEMORY[0x1E0CD27D0];
    LODWORD(v5) = 1051931443;
    LODWORD(v7) = 1043878380;
    LODWORD(v6) = 0;
  }
  LODWORD(v8) = 1.0;
  objc_msgSend(v9, "functionWithControlPoints::::", v5, v6, v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  return v10;
}

- (unint64_t)curve
{
  return self->_curve;
}

@end
