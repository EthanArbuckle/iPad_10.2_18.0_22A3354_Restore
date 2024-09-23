@implementation _UIHyperPinchGesture

- (_UIHyperPinchGesture)init
{
  _UIHyperInteractor *v3;
  double v4;
  _UIHyperConstantExtender *v5;
  double v6;
  _UIHyperPinchGesture *v7;

  v3 = -[_UIHyperInteractor initWithDimensions:]([_UIHyperInteractor alloc], "initWithDimensions:", 1);
  -[_UIHyperInteractor _minimumSpeed](v3, "_minimumSpeed");
  -[_UIHyperInteractor _setMinimumSpeed:](v3, "_setMinimumSpeed:", v4 / 100.0);
  v5 = -[_UIHyperConstantExtender initWithDimensions:]([_UIHyperConstantExtender alloc], "initWithDimensions:", 1);
  -[_UIHyperConstantExtender _maximumDistance](v5, "_maximumDistance");
  -[_UIHyperConstantExtender _setMaximumDistance:](v5, "_setMaximumDistance:", v6 / 100.0);
  -[_UIHyperInteractor _setExtender:](v3, "_setExtender:", v5);
  v7 = -[_UIHyperPinchGesture initWithInteractor:](self, "initWithInteractor:", v3);

  return v7;
}

- (_UIHyperPinchGesture)initWithInteractor:(id)a3
{
  _UIHyperPinchGesture *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIHyperPinchGesture;
  result = -[_UIHyperGesture initWithInteractor:](&v4, sel_initWithInteractor_, a3);
  if (result)
    result->__multiplier = 1.0;
  return result;
}

- (UIPinchGestureRecognizer)_pinchGestureRecognizer
{
  UIPinchGestureRecognizer *pinchGestureRecognizer;
  UIPinchGestureRecognizer *v4;

  pinchGestureRecognizer = self->__pinchGestureRecognizer;
  if (!pinchGestureRecognizer)
  {
    v4 = objc_alloc_init(UIPinchGestureRecognizer);
    -[_UIHyperPinchGesture _setPinchGestureRecognizer:](self, "_setPinchGestureRecognizer:", v4);

    pinchGestureRecognizer = self->__pinchGestureRecognizer;
  }
  return pinchGestureRecognizer;
}

- (void)_setPinchGestureRecognizer:(id)a3
{
  UIPinchGestureRecognizer **p_pinchGestureRecognizer;
  UIPinchGestureRecognizer *pinchGestureRecognizer;
  id v7;

  v7 = a3;
  p_pinchGestureRecognizer = &self->__pinchGestureRecognizer;
  pinchGestureRecognizer = self->__pinchGestureRecognizer;
  if (pinchGestureRecognizer)
    -[UIGestureRecognizer removeTarget:action:](pinchGestureRecognizer, "removeTarget:action:", self, sel__handleGesture_);
  objc_storeStrong((id *)&self->__pinchGestureRecognizer, a3);
  if (*p_pinchGestureRecognizer)
    -[UIGestureRecognizer addTarget:action:](*p_pinchGestureRecognizer, "addTarget:action:", self, sel__handleGesture_);

}

- (void)_getCurrentTranslation:(double *)a3
{
  void *v6;
  uint64_t v7;
  void *v8;
  double v9;
  long double v10;
  double v11;
  void *v12;

  -[_UIHyperGesture _interactor](self, "_interactor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "_dimensions");

  if (v7 != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIHyperGesture.m"), 217, CFSTR("_UIHyperPinchGesture must be used with an interactor of 1 dimension."));

  }
  -[_UIHyperPinchGesture _pinchGestureRecognizer](self, "_pinchGestureRecognizer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "scale");
  v10 = v9;

  -[_UIHyperPinchGesture _multiplier](self, "_multiplier");
  *a3 = log2(v10) * v11;
}

- (void)_getCurrentVelocity:(double *)a3
{
  void *v6;
  uint64_t v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  id v15;

  -[_UIHyperGesture _interactor](self, "_interactor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "_dimensions");

  if (v7 != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIHyperGesture.m"), 226, CFSTR("_UIHyperPinchGesture must be used with an interactor of 1 dimension."));

  }
  -[_UIHyperPinchGesture _pinchGestureRecognizer](self, "_pinchGestureRecognizer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "scale");
  v10 = v9;

  -[_UIHyperPinchGesture _multiplier](self, "_multiplier");
  v12 = v11 / (v10 * 0.693147181);
  -[_UIHyperPinchGesture _pinchGestureRecognizer](self, "_pinchGestureRecognizer");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "velocity");
  *a3 = v12 * v13;

}

- (double)_multiplier
{
  return self->__multiplier;
}

- (void)_setMultiplier:(double)a3
{
  self->__multiplier = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__pinchGestureRecognizer, 0);
}

@end
