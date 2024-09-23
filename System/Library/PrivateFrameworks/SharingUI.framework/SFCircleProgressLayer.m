@implementation SFCircleProgressLayer

- (SFCircleProgressLayer)init
{
  SFCircleProgressLayer *v2;
  SFCircleProgressLayer *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SFCircleProgressLayer;
  v2 = -[SFCircleProgressLayer init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_oneFullRotation = 6.28318531;
    -[SFCircleProgressLayer setNeedsDisplayOnBoundsChange:](v2, "setNeedsDisplayOnBoundsChange:", 1);
    -[SFCircleProgressLayer setAllowsEdgeAntialiasing:](v3, "setAllowsEdgeAntialiasing:", 1);
    -[SFCircleProgressLayer setProgressStartPoint:](v3, "setProgressStartPoint:", 0);
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCircleProgressLayer setProgressColor:](v3, "setProgressColor:", v4);

    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "userInterfaceIdiom");

    if (v6 == 6)
      objc_msgSend(MEMORY[0x24BEBD4B8], "secondarySystemFillColor");
    else
      objc_msgSend(MEMORY[0x24BEBD4B8], "systemFillColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCircleProgressLayer setProgressBackgroundColor:](v3, "setProgressBackgroundColor:", v7);

    -[SFCircleProgressLayer setProgressLineWidth:](v3, "setProgressLineWidth:", 2.0);
    -[SFCircleProgressLayer setShowProgressTray:](v3, "setShowProgressTray:", 0);
  }
  return v3;
}

- (SFCircleProgressLayer)initWithLayer:(id)a3
{
  id v4;
  SFCircleProgressLayer *v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SFCircleProgressLayer;
  v5 = -[SFCircleProgressLayer initWithLayer:](&v12, sel_initWithLayer_, v4);
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5->_oneFullRotation = 6.28318531;
      v6 = v4;
      -[SFCircleProgressLayer setNeedsDisplayOnBoundsChange:](v5, "setNeedsDisplayOnBoundsChange:", objc_msgSend(v6, "needsDisplayOnBoundsChange"));
      -[SFCircleProgressLayer setAllowsEdgeAntialiasing:](v5, "setAllowsEdgeAntialiasing:", objc_msgSend(v6, "allowsEdgeAntialiasing"));
      -[SFCircleProgressLayer setProgressStartPoint:](v5, "setProgressStartPoint:", objc_msgSend(v6, "progressStartPoint"));
      objc_msgSend(v6, "progressColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFCircleProgressLayer setProgressColor:](v5, "setProgressColor:", v7);

      objc_msgSend(v6, "progressBackgroundColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFCircleProgressLayer setProgressBackgroundColor:](v5, "setProgressBackgroundColor:", v8);

      objc_msgSend(v6, "progressLineWidth");
      -[SFCircleProgressLayer setProgressLineWidth:](v5, "setProgressLineWidth:");
      -[SFCircleProgressLayer setUsesRoundedLineCap:](v5, "setUsesRoundedLineCap:", objc_msgSend(v6, "usesRoundedLineCap"));
      -[SFCircleProgressLayer setShowProgressTray:](v5, "setShowProgressTray:", objc_msgSend(v6, "showProgressTray"));
      objc_msgSend(v6, "progress");
      v10 = v9;

      -[SFCircleProgressLayer setProgress:](v5, "setProgress:", v10);
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
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("progress")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("progressLineWidth")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("showProgressTray")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("usesRoundedLineCap")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___SFCircleProgressLayer;
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
  CGLineJoin usesRoundedLineCap;
  double v18;
  double v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;

  -[SFCircleProgressLayer bounds](self, "bounds");
  v21 = CGRectInset(v20, self->_progressLineWidth, self->_progressLineWidth);
  x = v21.origin.x;
  y = v21.origin.y;
  width = v21.size.width;
  height = v21.size.height;
  if (v21.size.width >= v21.size.height)
    v9 = v21.size.height;
  else
    v9 = v21.size.width;
  v10 = v9 - self->_progressLineWidth * 0.5 + 1.0;
  v11 = y;
  MidX = CGRectGetMidX(v21);
  v22.origin.x = x;
  v22.origin.y = y;
  v22.size.width = width;
  v22.size.height = height;
  MidY = CGRectGetMidY(v22);
  v14 = self->_progressStartPoint - 1;
  if (v14 > 2)
    v15 = -1.57079633;
  else
    v15 = dbl_2127A2A10[v14];
  oneFullRotation = self->_oneFullRotation;
  usesRoundedLineCap = self->_usesRoundedLineCap;
  CGContextSetLineCap(a3, (CGLineCap)usesRoundedLineCap);
  CGContextSetLineJoin(a3, usesRoundedLineCap);
  CGContextSetLineWidth(a3, self->_progressLineWidth);
  if (self->_showProgressTray)
  {
    CGContextBeginPath(a3);
    CGContextAddArc(a3, MidX, MidY, v10 * 0.5, v15, v15 + oneFullRotation, 0);
    CGContextSetStrokeColorWithColor(a3, -[UIColor CGColor](self->_progressBackgroundColor, "CGColor"));
    CGContextStrokePath(a3);
  }
  CGContextBeginPath(a3);
  v18 = self->_oneFullRotation;
  -[SFCircleProgressLayer progress](self, "progress");
  CGContextAddArc(a3, MidX, MidY, v10 * 0.5, v15, v15 + v18 * v19, 0);
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

- (BOOL)usesRoundedLineCap
{
  return self->_usesRoundedLineCap;
}

- (void)setUsesRoundedLineCap:(BOOL)a3
{
  self->_usesRoundedLineCap = a3;
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
