@implementation _UIHyperPanGesture

- (_UIHyperPanGesture)init
{
  return -[_UIHyperPanGesture initWithAxes:](self, "initWithAxes:", 3);
}

- (_UIHyperPanGesture)initWithAxes:(unint64_t)a3
{
  _UIHyperInteractor *v5;
  uint8x8_t v6;
  _UIHyperInteractor *v7;
  _UIHyperPanGesture *v8;

  v5 = [_UIHyperInteractor alloc];
  v6 = (uint8x8_t)vcnt_s8((int8x8_t)a3);
  v6.i16[0] = vaddlv_u8(v6);
  v7 = -[_UIHyperInteractor initWithDimensions:](v5, "initWithDimensions:", v6.u32[0]);
  v8 = -[_UIHyperPanGesture initWithInteractor:](self, "initWithInteractor:", v7);

  if (v8)
    -[_UIHyperPanGesture _setAxes:](v8, "_setAxes:", a3);
  return v8;
}

- (_UIHyperPanGesture)initWithInteractor:(id)a3
{
  _UIHyperPanGesture *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIHyperPanGesture;
  result = -[_UIHyperGesture initWithInteractor:](&v4, sel_initWithInteractor_, a3);
  if (result)
  {
    result->__axes = 3;
    result->__multiplier = 1.0;
  }
  return result;
}

- (UIPanGestureRecognizer)_panGestureRecognizer
{
  UIPanGestureRecognizer *panGestureRecognizer;
  UIPanGestureRecognizer *v4;

  panGestureRecognizer = self->__panGestureRecognizer;
  if (!panGestureRecognizer)
  {
    v4 = objc_alloc_init(UIPanGestureRecognizer);
    -[_UIHyperPanGesture _setPanGestureRecognizer:](self, "_setPanGestureRecognizer:", v4);

    panGestureRecognizer = self->__panGestureRecognizer;
  }
  return panGestureRecognizer;
}

- (void)_setPanGestureRecognizer:(id)a3
{
  UIPanGestureRecognizer **p_panGestureRecognizer;
  UIPanGestureRecognizer *panGestureRecognizer;
  id v7;

  v7 = a3;
  p_panGestureRecognizer = &self->__panGestureRecognizer;
  panGestureRecognizer = self->__panGestureRecognizer;
  if (panGestureRecognizer)
    -[UIGestureRecognizer removeTarget:action:](panGestureRecognizer, "removeTarget:action:", self, sel__handleGesture_);
  objc_storeStrong((id *)&self->__panGestureRecognizer, a3);
  if (*p_panGestureRecognizer)
    -[UIGestureRecognizer addTarget:action:](*p_panGestureRecognizer, "addTarget:action:", self, sel__handleGesture_);

}

- (void)_getCurrentTranslation:(double *)a3
{
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  unint64_t v11;
  double v12;
  double v13;
  void *v14;
  uint64_t v15;
  uint8x8_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;

  -[_UIHyperPanGesture _panGestureRecognizer](self, "_panGestureRecognizer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "translationInView:", 0);
  v8 = v7;
  v10 = v9;

  v11 = -[_UIHyperPanGesture _axes](self, "_axes");
  -[_UIHyperPanGesture _multiplier](self, "_multiplier");
  v13 = v12;
  -[_UIHyperGesture _interactor](self, "_interactor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "_dimensions");
  v16 = (uint8x8_t)vcnt_s8((int8x8_t)v11);
  v16.i16[0] = vaddlv_u8(v16);
  v17 = v16.u32[0];

  if (v15 == v17)
  {
    if ((v11 & 1) == 0)
      goto LABEL_3;
LABEL_6:
    *a3 = v8 * v13;
    v18 = 1;
    if ((v11 & 2) == 0)
      return;
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIHyperGesture.m"), 136, CFSTR("_UIHyperPanGesture must be used with an interactor of dimensionality compatible with axes (%lu)."), v11);

  if ((v11 & 1) != 0)
    goto LABEL_6;
LABEL_3:
  v18 = 0;
  if ((v11 & 2) != 0)
LABEL_7:
    a3[v18] = v10 * v13;
}

- (void)_getCurrentVelocity:(double *)a3
{
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  unint64_t v11;
  double v12;
  double v13;
  void *v14;
  uint64_t v15;
  uint8x8_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;

  -[_UIHyperPanGesture _panGestureRecognizer](self, "_panGestureRecognizer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "velocityInView:", 0);
  v8 = v7;
  v10 = v9;

  v11 = -[_UIHyperPanGesture _axes](self, "_axes");
  -[_UIHyperPanGesture _multiplier](self, "_multiplier");
  v13 = v12;
  -[_UIHyperGesture _interactor](self, "_interactor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "_dimensions");
  v16 = (uint8x8_t)vcnt_s8((int8x8_t)v11);
  v16.i16[0] = vaddlv_u8(v16);
  v17 = v16.u32[0];

  if (v15 == v17)
  {
    if ((v11 & 1) == 0)
      goto LABEL_3;
LABEL_6:
    *a3 = v8 * v13;
    v18 = 1;
    if ((v11 & 2) == 0)
      return;
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIHyperGesture.m"), 155, CFSTR("_UIHyperPanGesture must be used with an interactor of dimensionality compatible with axes (%lu)."), v11);

  if ((v11 & 1) != 0)
    goto LABEL_6;
LABEL_3:
  v18 = 0;
  if ((v11 & 2) != 0)
LABEL_7:
    a3[v18] = v10 * v13;
}

- (unint64_t)_axes
{
  return self->__axes;
}

- (void)_setAxes:(unint64_t)a3
{
  self->__axes = a3;
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
  objc_storeStrong((id *)&self->__panGestureRecognizer, 0);
}

@end
