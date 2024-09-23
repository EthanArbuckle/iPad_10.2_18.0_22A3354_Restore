@implementation _UICircleProgressLayer

- (_UICircleProgressLayer)init
{
  _UICircleProgressLayer *v2;
  _UICircleProgressLayer *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UICircleProgressLayer;
  v2 = -[_UICircleProgressLayer init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_oneFullRotation = 6.28318531;
    -[_UICircleProgressLayer setNeedsDisplayOnBoundsChange:](v2, "setNeedsDisplayOnBoundsChange:", 1);
    -[_UICircleProgressLayer setAllowsEdgeAntialiasing:](v3, "setAllowsEdgeAntialiasing:", 1);
    -[_UICircleProgressLayer setProgressStartPoint:](v3, "setProgressStartPoint:", 0);
    +[UIColor systemBlueColor](UIColor, "systemBlueColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UICircleProgressLayer setProgressColor:](v3, "setProgressColor:", v4);

    +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.78, 1.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UICircleProgressLayer setProgressBackgroundColor:](v3, "setProgressBackgroundColor:", v5);

    -[_UICircleProgressLayer setProgressLineWidth:](v3, "setProgressLineWidth:", 2.0);
    -[_UICircleProgressLayer setShowProgressTray:](v3, "setShowProgressTray:", 0);
  }
  return v3;
}

- (_UICircleProgressLayer)initWithLayer:(id)a3
{
  id v4;
  _UICircleProgressLayer *v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_UICircleProgressLayer;
  v5 = -[_UICircleProgressLayer initWithLayer:](&v12, sel_initWithLayer_, v4);
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5->_oneFullRotation = 6.28318531;
      v6 = v4;
      -[_UICircleProgressLayer setNeedsDisplayOnBoundsChange:](v5, "setNeedsDisplayOnBoundsChange:", objc_msgSend(v6, "needsDisplayOnBoundsChange"));
      -[_UICircleProgressLayer setAllowsEdgeAntialiasing:](v5, "setAllowsEdgeAntialiasing:", objc_msgSend(v6, "allowsEdgeAntialiasing"));
      -[_UICircleProgressLayer setProgressStartPoint:](v5, "setProgressStartPoint:", objc_msgSend(v6, "progressStartPoint"));
      objc_msgSend(v6, "progressColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UICircleProgressLayer setProgressColor:](v5, "setProgressColor:", v7);

      objc_msgSend(v6, "progressBackgroundColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UICircleProgressLayer setProgressBackgroundColor:](v5, "setProgressBackgroundColor:", v8);

      objc_msgSend(v6, "progressLineWidth");
      -[_UICircleProgressLayer setProgressLineWidth:](v5, "setProgressLineWidth:");
      -[_UICircleProgressLayer setShowProgressTray:](v5, "setShowProgressTray:", objc_msgSend(v6, "showProgressTray"));
      objc_msgSend(v6, "progress");
      v10 = v9;

      -[_UICircleProgressLayer setProgress:](v5, "setProgress:", v10);
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
    v7.super_class = (Class)&OBJC_METACLASS____UICircleProgressLayer;
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
  unint64_t v14;
  double v15;
  double oneFullRotation;
  double v17;
  double v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;

  -[_UICircleProgressLayer bounds](self, "bounds");
  v20 = CGRectInset(v19, self->_progressLineWidth, self->_progressLineWidth);
  x = v20.origin.x;
  y = v20.origin.y;
  width = v20.size.width;
  height = v20.size.height;
  if (v20.size.width >= v20.size.height)
    v9 = v20.size.height;
  else
    v9 = v20.size.width;
  v10 = v9 - self->_progressLineWidth * 0.5 + 1.0;
  v11 = y;
  MidX = CGRectGetMidX(v20);
  v21.origin.x = x;
  v21.origin.y = y;
  v21.size.width = width;
  v21.size.height = height;
  MidY = CGRectGetMidY(v21);
  v14 = self->_progressStartPoint - 1;
  if (v14 > 2)
    v15 = -1.57079633;
  else
    v15 = dbl_18667AA60[v14];
  oneFullRotation = self->_oneFullRotation;
  CGContextSetLineCap(a3, kCGLineCapButt);
  CGContextSetLineJoin(a3, kCGLineJoinMiter);
  CGContextSetLineWidth(a3, self->_progressLineWidth);
  if (self->_showProgressTray)
  {
    CGContextBeginPath(a3);
    CGContextAddArc(a3, MidX, MidY, v10 * 0.5, v15, v15 + oneFullRotation, 0);
    CGContextSetStrokeColorWithColor(a3, -[UIColor CGColor](self->_progressBackgroundColor, "CGColor"));
    CGContextStrokePath(a3);
  }
  CGContextBeginPath(a3);
  v17 = self->_oneFullRotation;
  -[_UICircleProgressLayer progress](self, "progress");
  CGContextAddArc(a3, MidX, MidY, v10 * 0.5, v15, v15 + v17 * v18, 0);
  CGContextSetStrokeColorWithColor(a3, -[UIColor CGColor](self->_progressColor, "CGColor"));
  CGContextStrokePath(a3);
}

- (int64_t)progressStartPoint
{
  return self->_progressStartPoint;
}

- (void)setProgressStartPoint:(int64_t)a3
{
  self->_progressStartPoint = a3;
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
