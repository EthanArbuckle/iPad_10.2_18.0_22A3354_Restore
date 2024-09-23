@implementation _SUICRingLayer

- (_SUICRingLayer)init
{
  _SUICRingLayer *v2;
  _SUICRingLayer *v3;
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_SUICRingLayer;
  v2 = -[_SUICRingLayer init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    -[_SUICRingLayer setCustomLineWidth:](v2, "setCustomLineWidth:", 0.0);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[_SUICRingLayer setFillColor:](v3, "setFillColor:", objc_msgSend(v4, "CGColor"));

    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SUICRingLayer setRingColor:](v3, "setRingColor:", v5);

    -[_SUICRingLayer setStrokeEnd:](v3, "setStrokeEnd:", 1.0);
    -[_SUICRingLayer setLineCap:](v3, "setLineCap:", *MEMORY[0x1E0CD3030]);
  }
  return v3;
}

- (void)setRingColor:(id)a3
{
  id v4;

  v4 = objc_retainAutorelease((id)objc_msgSend(a3, "copy"));
  -[_SUICRingLayer setStrokeColor:](self, "setStrokeColor:", objc_msgSend(v4, "CGColor"));

}

- (UIColor)ringColor
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithCGColor:", -[_SUICRingLayer strokeColor](self, "strokeColor"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (UIColor *)v3;
}

- (void)setCustomLineWidth:(double)a3
{
  if (self->_customLineWidth != a3)
  {
    self->_customLineWidth = a3;
    -[_SUICRingLayer setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  id v16;
  objc_super v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v17.receiver = self;
  v17.super_class = (Class)_SUICRingLayer;
  -[_SUICRingLayer setFrame:](&v17, sel_setFrame_);
  -[_SUICRingLayer customLineWidth](self, "customLineWidth");
  if (v8 <= 0.0)
  {
    v18.origin.x = x;
    v18.origin.y = y;
    v18.size.width = width;
    v18.size.height = height;
    v10 = CGRectGetWidth(v18);
    v19.origin.x = x;
    v19.origin.y = y;
    v19.size.width = width;
    v19.size.height = height;
    v9 = round((v10 + CGRectGetHeight(v19)) * 0.5 * 0.05);
  }
  else
  {
    -[_SUICRingLayer customLineWidth](self, "customLineWidth");
  }
  -[_SUICRingLayer setLineWidth:](self, "setLineWidth:", v9);
  UIRectGetCenter();
  v12 = v11;
  v14 = v13;
  v20.origin.x = x;
  v20.origin.y = y;
  v20.size.width = width;
  v20.size.height = height;
  v15 = CGRectGetHeight(v20) * 0.5;
  v21.origin.x = x;
  v21.origin.y = y;
  v21.size.width = width;
  v21.size.height = height;
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, v12, v14, (v15 + CGRectGetWidth(v21) * 0.5) * 0.5, 4.71238898, 10.9955743);
  v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[_SUICRingLayer setPath:](self, "setPath:", objc_msgSend(v16, "CGPath"));

}

- (double)customLineWidth
{
  return self->_customLineWidth;
}

@end
