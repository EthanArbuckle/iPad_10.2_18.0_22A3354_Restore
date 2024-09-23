@implementation PKShapeView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (PKShapeView)initWithFrame:(CGRect)a3
{
  PKShapeView *v3;
  id v4;
  CGColor *v5;
  uint64_t v6;
  CAShapeLayer *shapeLayer;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PKShapeView;
  v3 = -[PKShapeView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v5 = CGColorRetain((CGColorRef)objc_msgSend(v4, "CGColor"));

    -[PKShapeView layer](v3, "layer");
    v6 = objc_claimAutoreleasedReturnValue();
    shapeLayer = v3->_shapeLayer;
    v3->_shapeLayer = (CAShapeLayer *)v6;

    -[CAShapeLayer setFillColor:](v3->_shapeLayer, "setFillColor:", v5);
    -[CAShapeLayer setStrokeColor:](v3->_shapeLayer, "setStrokeColor:", v5);
    CGColorRelease(v5);
  }
  return v3;
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("path")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)PKShapeView;
    v5 = -[PKShapeView _shouldAnimatePropertyWithKey:](&v7, sel__shouldAnimatePropertyWithKey_, v4);
  }

  return v5;
}

- (CAShapeLayer)shapeLayer
{
  return self->_shapeLayer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shapeLayer, 0);
}

@end
