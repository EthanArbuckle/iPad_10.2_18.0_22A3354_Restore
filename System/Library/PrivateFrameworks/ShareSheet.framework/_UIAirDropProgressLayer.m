@implementation _UIAirDropProgressLayer

- (_UIAirDropProgressLayer)init
{
  _UIAirDropProgressLayer *v2;
  _UIAirDropProgressLayer *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIAirDropProgressLayer;
  v2 = -[_UIAirDropProgressLayer init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_oneFullRotation = 6.28318531;
    -[_UIAirDropProgressLayer setNeedsDisplayOnBoundsChange:](v2, "setNeedsDisplayOnBoundsChange:", 1);
    -[_UIAirDropProgressLayer setAllowsEdgeAntialiasing:](v3, "setAllowsEdgeAntialiasing:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIAirDropProgressLayer setProgressColor:](v3, "setProgressColor:", v4);

    objc_msgSend(MEMORY[0x1E0DC3658], "systemFillColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIAirDropProgressLayer setProgressBackgroundColor:](v3, "setProgressBackgroundColor:", v5);

    -[_UIAirDropProgressLayer setProgressLineWidth:](v3, "setProgressLineWidth:", 2.0);
    -[_UIAirDropProgressLayer setShowProgressTray:](v3, "setShowProgressTray:", 0);
  }
  return v3;
}

- (_UIAirDropProgressLayer)initWithLayer:(id)a3
{
  id v4;
  _UIAirDropProgressLayer *v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_UIAirDropProgressLayer;
  v5 = -[_UIAirDropProgressLayer initWithLayer:](&v12, sel_initWithLayer_, v4);
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5->_oneFullRotation = 6.28318531;
      v6 = v4;
      -[_UIAirDropProgressLayer setNeedsDisplayOnBoundsChange:](v5, "setNeedsDisplayOnBoundsChange:", objc_msgSend(v6, "needsDisplayOnBoundsChange"));
      -[_UIAirDropProgressLayer setAllowsEdgeAntialiasing:](v5, "setAllowsEdgeAntialiasing:", objc_msgSend(v6, "allowsEdgeAntialiasing"));
      objc_msgSend(v6, "progressColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIAirDropProgressLayer setProgressColor:](v5, "setProgressColor:", v7);

      objc_msgSend(v6, "progressBackgroundColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIAirDropProgressLayer setProgressBackgroundColor:](v5, "setProgressBackgroundColor:", v8);

      objc_msgSend(v6, "progressLineWidth");
      -[_UIAirDropProgressLayer setProgressLineWidth:](v5, "setProgressLineWidth:");
      -[_UIAirDropProgressLayer setShowProgressTray:](v5, "setShowProgressTray:", objc_msgSend(v6, "showProgressTray"));
      objc_msgSend(v6, "progress");
      v10 = v9;

      -[_UIAirDropProgressLayer setProgress:](v5, "setProgress:", v10);
    }
  }

  return v5;
}

+ (BOOL)needsDisplayForKey:(id)a3
{
  id v4;
  unsigned __int8 v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("progress")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS____UIAirDropProgressLayer;
    v5 = objc_msgSendSuper2(&v7, sel_needsDisplayForKey_, v4);
  }

  return v5;
}

- (void)drawInContext:(CGContext *)a3
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v9;
  double v10;
  CGFloat v11;
  CGFloat MidX;
  CGFloat MidY;
  double oneFullRotation;
  double v15;
  double v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;

  -[_UIAirDropProgressLayer bounds](self, "bounds");
  v18 = CGRectInset(v17, self->_progressLineWidth, self->_progressLineWidth);
  x = v18.origin.x;
  y = v18.origin.y;
  width = v18.size.width;
  height = v18.size.height;
  if (v18.size.width >= v18.size.height)
    v9 = v18.size.height;
  else
    v9 = v18.size.width;
  v10 = (v9 - self->_progressLineWidth * 0.5 + 1.0) * 0.5;
  v11 = x;
  MidX = CGRectGetMidX(v18);
  v19.origin.x = x;
  v19.origin.y = y;
  v19.size.width = width;
  v19.size.height = height;
  MidY = CGRectGetMidY(v19);
  oneFullRotation = self->_oneFullRotation;
  CGContextSetLineCap(a3, kCGLineCapButt);
  CGContextSetLineJoin(a3, kCGLineJoinMiter);
  CGContextSetLineWidth(a3, self->_progressLineWidth);
  if (self->_showProgressTray)
  {
    CGContextBeginPath(a3);
    CGContextAddArc(a3, MidX, MidY, v10, -1.57079633, oneFullRotation + -1.57079633, 0);
    CGContextSetStrokeColorWithColor(a3, -[UIColor CGColor](self->_progressBackgroundColor, "CGColor"));
    CGContextStrokePath(a3);
  }
  CGContextBeginPath(a3);
  v15 = self->_oneFullRotation;
  -[_UIAirDropProgressLayer progress](self, "progress");
  CGContextAddArc(a3, MidX, MidY, v10, -1.57079633, v15 * v16 + -1.57079633, 0);
  CGContextSetStrokeColorWithColor(a3, -[UIColor CGColor](self->_progressColor, "CGColor"));
  CGContextStrokePath(a3);
}

- (UIColor)progressColor
{
  return self->_progressColor;
}

- (void)setProgressColor:(id)a3
{
  objc_storeStrong((id *)&self->_progressColor, a3);
}

- (UIColor)progressBackgroundColor
{
  return self->_progressBackgroundColor;
}

- (void)setProgressBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_progressBackgroundColor, a3);
}

- (double)progressLineWidth
{
  return self->_progressLineWidth;
}

- (void)setProgressLineWidth:(double)a3
{
  self->_progressLineWidth = a3;
}

- (BOOL)showProgressTray
{
  return self->_showProgressTray;
}

- (void)setShowProgressTray:(BOOL)a3
{
  self->_showProgressTray = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressBackgroundColor, 0);
  objc_storeStrong((id *)&self->_progressColor, 0);
}

@end
