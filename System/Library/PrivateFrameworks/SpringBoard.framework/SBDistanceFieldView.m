@implementation SBDistanceFieldView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4;
  char v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SBDistanceFieldView;
  if (-[SBDistanceFieldView _shouldAnimatePropertyWithKey:](&v7, sel__shouldAnimatePropertyWithKey_, v4)
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("foregroundColor")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("sharpness")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("offset"));
  }

  return v5;
}

- (NSString)renderMode
{
  void *v2;
  void *v3;

  -[SBDistanceFieldView layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "renderMode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setRenderMode:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SBDistanceFieldView layer](self, "layer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRenderMode:", v4);

}

- (BOOL)invertsShape
{
  void *v2;
  char v3;

  -[SBDistanceFieldView layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "invertsShape");

  return v3;
}

- (void)setInvertsShape:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[SBDistanceFieldView layer](self, "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInvertsShape:", v3);

}

- (CGColor)foregroundColor
{
  void *v2;
  CGColor *v3;

  -[SBDistanceFieldView layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (CGColor *)objc_msgSend(v2, "foregroundColor");

  return v3;
}

- (void)setForegroundColor:(CGColor *)a3
{
  id v4;

  -[SBDistanceFieldView layer](self, "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setForegroundColor:", a3);

}

- (double)offset
{
  void *v2;
  double v3;
  double v4;

  -[SBDistanceFieldView layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "offset");
  v4 = v3;

  return v4;
}

- (void)setOffset:(double)a3
{
  id v4;

  -[SBDistanceFieldView layer](self, "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOffset:", a3);

}

- (double)sharpness
{
  void *v2;
  double v3;
  double v4;

  -[SBDistanceFieldView layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sharpness");
  v4 = v3;

  return v4;
}

- (void)setSharpness:(double)a3
{
  id v4;

  -[SBDistanceFieldView layer](self, "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSharpness:", a3);

}

- (double)lineWidth
{
  void *v2;
  double v3;
  double v4;

  -[SBDistanceFieldView layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lineWidth");
  v4 = v3;

  return v4;
}

- (void)setLineWidth:(double)a3
{
  id v4;

  -[SBDistanceFieldView layer](self, "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLineWidth:", a3);

}

@end
