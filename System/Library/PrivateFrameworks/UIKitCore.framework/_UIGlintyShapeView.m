@implementation _UIGlintyShapeView

- (_UIGlintyShapeView)initWithFrame:(CGRect)a3
{
  _UIGlintyShapeView *v3;
  _UIGlintyShapeView *v4;
  void *v5;
  void *v6;
  void *v7;
  _UIGlintyShapeView *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_UIGlintyShapeView;
  v3 = -[UIView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[UIView layer](v3, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAllowsGroupOpacity:", 0);

    -[UIView layer](v4, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAllowsGroupBlending:", 0);

    -[UIView setOpaque:](v4, "setOpaque:", 0);
    +[UIColor clearColor](UIColor, "clearColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v4, "setBackgroundColor:", v7);

    v8 = v4;
  }

  return v4;
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)setPath:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;

  objc_storeStrong((id *)&self->_path, a3);
  v5 = objc_retainAutorelease(a3);
  v6 = objc_msgSend(v5, "CGPath");

  -[_UIGlintyShapeView shapeLayer](self, "shapeLayer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPath:", v6);

}

- (void)setFillColor:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;

  objc_storeStrong((id *)&self->_fillColor, a3);
  v5 = objc_retainAutorelease(a3);
  v6 = objc_msgSend(v5, "CGColor");

  -[_UIGlintyShapeView shapeLayer](self, "shapeLayer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFillColor:", v6);

}

- (void)setStrokeColor:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;

  objc_storeStrong((id *)&self->_strokeColor, a3);
  v5 = objc_retainAutorelease(a3);
  v6 = objc_msgSend(v5, "CGColor");

  -[_UIGlintyShapeView shapeLayer](self, "shapeLayer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setStrokeColor:", v6);

}

- (UIBezierPath)path
{
  return self->_path;
}

- (UIColor)fillColor
{
  return self->_fillColor;
}

- (UIColor)strokeColor
{
  return self->_strokeColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strokeColor, 0);
  objc_storeStrong((id *)&self->_fillColor, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

@end
