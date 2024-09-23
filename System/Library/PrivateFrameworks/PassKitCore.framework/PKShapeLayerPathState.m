@implementation PKShapeLayerPathState

- (PKShapeLayerPathState)init
{
  return -[PKShapeLayerPathState initWithStrokeStartT0:strokeStartT1:strokeEndT0:strokeEndT1:](self, "initWithStrokeStartT0:strokeStartT1:strokeEndT0:strokeEndT1:", 0.0, 0.0, 0.0, 1.0);
}

- (PKShapeLayerPathState)initWithShapeLayer:(id)a3
{
  return -[PKShapeLayerPathState initWithShapeLayer:reverse:](self, "initWithShapeLayer:reverse:", a3, 0);
}

- (PKShapeLayerPathState)initWithShapeLayer:(id)a3 reverse:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "strokeStart");
  v8 = v7;
  objc_msgSend(v6, "strokeEnd");
  v10 = v9;

  if (v4)
    v11 = v10;
  else
    v11 = v8;
  return -[PKShapeLayerPathState initWithStrokeStartT0:strokeStartT1:strokeEndT0:strokeEndT1:](self, "initWithStrokeStartT0:strokeStartT1:strokeEndT0:strokeEndT1:", v11, v8, v11, v10);
}

- (PKShapeLayerPathState)initWithStrokeStart:(double)a3 strokeEnd:(double)a4
{
  return -[PKShapeLayerPathState initWithStrokeStartT0:strokeStartT1:strokeEndT0:strokeEndT1:](self, "initWithStrokeStartT0:strokeStartT1:strokeEndT0:strokeEndT1:", a3, a3, a3, a4);
}

- (PKShapeLayerPathState)initWithStrokeStartT0:(double)a3 strokeStartT1:(double)a4 strokeEndT0:(double)a5 strokeEndT1:(double)a6
{
  PKShapeLayerPathState *result;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PKShapeLayerPathState;
  result = -[PKShapeLayerPathState init](&v11, sel_init);
  if (result)
  {
    result->_strokeStartT0 = a3;
    result->_strokeStartT1 = a4;
    result->_strokeEndT0 = a5;
    result->_strokeEndT1 = a6;
  }
  return result;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PKShapeLayerPathState;
  -[PKShapeLayerPathState dealloc](&v2, sel_dealloc);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)PKShapeLayerPathState;
  -[PKShapeLayerPathState description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: (%f -> %f) (%f -> %f)"), v4, *(_QWORD *)&self->_strokeStartT0, *(_QWORD *)&self->_strokeStartT1, *(_QWORD *)&self->_strokeEndT0, *(_QWORD *)&self->_strokeEndT1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (double)strokeStartAtProgress:(double)a3
{
  double v3;
  double v4;

  v3 = 0.0;
  if (a3 >= 0.0)
    v3 = a3;
  if (a3 <= 1.0)
    v4 = v3;
  else
    v4 = 1.0;
  return v4 * self->_strokeStartT1 + (1.0 - v4) * self->_strokeStartT0;
}

- (double)strokeEndAtProgress:(double)a3
{
  double v3;
  double v4;

  v3 = 0.0;
  if (a3 >= 0.0)
    v3 = a3;
  if (a3 <= 1.0)
    v4 = v3;
  else
    v4 = 1.0;
  return v4 * self->_strokeEndT1 + (1.0 - v4) * self->_strokeEndT0;
}

- (void)setProgress:(double)a3 onShapeLayer:(id)a4
{
  -[PKShapeLayerPathState setProgress:onShapeLayer:withAnimationHandler:](self, "setProgress:onShapeLayer:withAnimationHandler:", a4, 0, 1.0);
}

- (void)setProgress:(double)a3 onShapeLayer:(id)a4 withAnimationHandler:(id)a5
{
  void (**v8)(id, id, const __CFString *, double, double);
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v19;

  v19 = a4;
  v8 = (void (**)(id, id, const __CFString *, double, double))a5;
  v9 = 0.0;
  if (a3 >= 0.0)
    v9 = a3;
  if (a3 <= 1.0)
    v10 = v9;
  else
    v10 = 1.0;
  objc_msgSend(v19, "strokeStart", 1.0, v9);
  v12 = v11;
  -[PKShapeLayerPathState strokeStartAtProgress:](self, "strokeStartAtProgress:", v10);
  v14 = v13;
  objc_msgSend(v19, "strokeEnd");
  v16 = v15;
  -[PKShapeLayerPathState strokeEndAtProgress:](self, "strokeEndAtProgress:", v10);
  v18 = v17;
  objc_msgSend(v19, "setStrokeStart:", v14);
  objc_msgSend(v19, "setStrokeEnd:", v18);
  if (v8)
  {
    if (v12 != v14)
      v8[2](v8, v19, CFSTR("strokeStart"), v12, v14);
    if (v16 != v18)
      v8[2](v8, v19, CFSTR("strokeEnd"), v16, v18);
  }

}

- (double)progressForShapeLayer:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v4 = a3;
  v5 = v4;
  v6 = 1.0;
  v7 = 1.0;
  if (self->_strokeStartT0 != self->_strokeStartT1)
  {
    objc_msgSend(v4, "strokeStart");
    v7 = fmax(fmin((v8 - self->_strokeStartT0) / (self->_strokeStartT1 - self->_strokeStartT0), 1.0), 0.0);
  }
  if (self->_strokeEndT0 != self->_strokeEndT1)
  {
    objc_msgSend(v5, "strokeEnd");
    v6 = fmax(fmin((v9 - self->_strokeEndT0) / (self->_strokeEndT1 - self->_strokeEndT0), 1.0), 0.0);
  }

  return fmin(v7, v6);
}

@end
