@implementation BKShapeView

+ (Class)layerClass
{
  return (Class)objc_opt_class(CAShapeLayer, a2);
}

- (BKShapeView)init
{
  BKShapeView *v2;
  void *v3;
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BKShapeView;
  v2 = -[BKShapeView init](&v6, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection bc_allAPITraits](UITraitCollection, "bc_allAPITraits"));
    v4 = -[BKShapeView registerForTraitChanges:withAction:](v2, "registerForTraitChanges:withAction:", v3, "_traitCollectionDidChange:previousTraitCollection:");

  }
  return v2;
}

- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[BKShapeView fillColor](self, "fillColor", a3, a4)));
  v6 = objc_msgSend(v5, "CGColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKShapeView layer](self, "layer"));
  objc_msgSend(v7, "setFillColor:", v6);

  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[BKShapeView strokeColor](self, "strokeColor")));
  v8 = objc_msgSend(v10, "CGColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKShapeView layer](self, "layer"));
  objc_msgSend(v9, "setStrokeColor:", v8);

}

- (UIBezierPath)path
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKShapeView layer](self, "layer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithCGPath:](UIBezierPath, "bezierPathWithCGPath:", objc_msgSend(v2, "path")));

  return (UIBezierPath *)v3;
}

- (void)setPath:(id)a3
{
  id v4;
  id v5;

  v4 = objc_msgSend(objc_retainAutorelease(a3), "CGPath");
  v5 = (id)objc_claimAutoreleasedReturnValue(-[BKShapeView layer](self, "layer"));
  objc_msgSend(v5, "setPath:", v4);

}

- (void)setFillColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;
  unsigned __int8 v7;
  CGColor *v8;
  void *v9;
  UIColor *v10;

  v5 = (UIColor *)a3;
  v6 = v5;
  if (self->_fillColor != v5)
  {
    v10 = v5;
    v7 = -[UIColor isEqual:](v5, "isEqual:");
    v6 = v10;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_fillColor, a3);
      v8 = -[UIColor CGColor](objc_retainAutorelease(v10), "CGColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKShapeView layer](self, "layer"));
      objc_msgSend(v9, "setFillColor:", v8);

      v6 = v10;
    }
  }

}

- (void)setStrokeColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;
  unsigned __int8 v7;
  CGColor *v8;
  void *v9;
  UIColor *v10;

  v5 = (UIColor *)a3;
  v6 = v5;
  if (self->_strokeColor != v5)
  {
    v10 = v5;
    v7 = -[UIColor isEqual:](v5, "isEqual:");
    v6 = v10;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_strokeColor, a3);
      v8 = -[UIColor CGColor](objc_retainAutorelease(v10), "CGColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKShapeView layer](self, "layer"));
      objc_msgSend(v9, "setStrokeColor:", v8);

      v6 = v10;
    }
  }

}

- (double)lineWidth
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKShapeView layer](self, "layer"));
  objc_msgSend(v2, "lineWidth");
  v4 = v3;

  return v4;
}

- (void)setLineWidth:(double)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[BKShapeView layer](self, "layer"));
  objc_msgSend(v4, "setLineWidth:", a3);

}

- (void)setFillColorUsesTintColor:(BOOL)a3
{
  self->_fillColorUsesTintColor = a3;
  -[BKShapeView _syncFillColor](self, "_syncFillColor");
}

- (void)setStrokeColorUsesTintColor:(BOOL)a3
{
  self->_strokeColorUsesTintColor = a3;
  -[BKShapeView _syncStrokeColor](self, "_syncStrokeColor");
}

- (void)setIgnoresTintColorAlpha:(BOOL)a3
{
  self->_ignoresTintColorAlpha = a3;
  -[BKShapeView _syncFillColor](self, "_syncFillColor");
  -[BKShapeView _syncStrokeColor](self, "_syncStrokeColor");
}

- (void)tintColorDidChange
{
  -[BKShapeView _syncFillColor](self, "_syncFillColor");
  -[BKShapeView _syncStrokeColor](self, "_syncStrokeColor");
}

- (id)_tintColorToUse
{
  unsigned int v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = -[BKShapeView ignoresTintColorAlpha](self, "ignoresTintColorAlpha");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKShapeView tintColor](self, "tintColor"));
  v5 = v4;
  if (v3)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "colorWithAlphaComponent:", 1.0));

    v5 = (void *)v6;
  }
  return v5;
}

- (void)_syncStrokeColor
{
  id v3;

  if (-[BKShapeView strokeColorUsesTintColor](self, "strokeColorUsesTintColor"))
  {
    v3 = (id)objc_claimAutoreleasedReturnValue(-[BKShapeView _tintColorToUse](self, "_tintColorToUse"));
    -[BKShapeView setStrokeColor:](self, "setStrokeColor:", v3);

  }
}

- (void)_syncFillColor
{
  id v3;

  if (-[BKShapeView fillColorUsesTintColor](self, "fillColorUsesTintColor"))
  {
    v3 = (id)objc_claimAutoreleasedReturnValue(-[BKShapeView _tintColorToUse](self, "_tintColorToUse"));
    -[BKShapeView setFillColor:](self, "setFillColor:", v3);

  }
}

- (UIColor)fillColor
{
  return self->_fillColor;
}

- (UIColor)strokeColor
{
  return self->_strokeColor;
}

- (BOOL)fillColorUsesTintColor
{
  return self->_fillColorUsesTintColor;
}

- (BOOL)strokeColorUsesTintColor
{
  return self->_strokeColorUsesTintColor;
}

- (BOOL)ignoresTintColorAlpha
{
  return self->_ignoresTintColorAlpha;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strokeColor, 0);
  objc_storeStrong((id *)&self->_fillColor, 0);
}

@end
