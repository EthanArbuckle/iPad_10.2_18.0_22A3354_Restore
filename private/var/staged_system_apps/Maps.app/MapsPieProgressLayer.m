@implementation MapsPieProgressLayer

- (MapsPieProgressLayer)init
{
  MapsPieProgressLayer *v2;
  MapsPieProgressLayer *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MapsPieProgressLayer;
  v2 = -[MapsPieProgressLayer init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    -[MapsPieProgressLayer setNeedsDisplayOnBoundsChange:](v2, "setNeedsDisplayOnBoundsChange:", 1);
    -[MapsPieProgressLayer setAllowsEdgeAntialiasing:](v3, "setAllowsEdgeAntialiasing:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
    -[MapsPieProgressLayer setProgressColor:](v3, "setProgressColor:", v4);

    -[MapsPieProgressLayer setBorderLineWidth:](v3, "setBorderLineWidth:", 1.0);
  }
  return v3;
}

- (MapsPieProgressLayer)initWithLayer:(id)a3
{
  id v4;
  MapsPieProgressLayer *v5;
  uint64_t v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MapsPieProgressLayer;
  v5 = -[MapsPieProgressLayer initWithLayer:](&v12, "initWithLayer:", v4);
  if (v5)
  {
    v6 = objc_opt_class(MapsPieProgressLayer);
    if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
    {
      v7 = v4;
      -[MapsPieProgressLayer setNeedsDisplayOnBoundsChange:](v5, "setNeedsDisplayOnBoundsChange:", objc_msgSend(v7, "needsDisplayOnBoundsChange"));
      -[MapsPieProgressLayer setAllowsEdgeAntialiasing:](v5, "setAllowsEdgeAntialiasing:", objc_msgSend(v7, "allowsEdgeAntialiasing"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "progressColor"));
      -[MapsPieProgressLayer setProgressColor:](v5, "setProgressColor:", v8);

      objc_msgSend(v7, "borderLineWidth");
      -[MapsPieProgressLayer setBorderLineWidth:](v5, "setBorderLineWidth:");
      objc_msgSend(v7, "progress");
      v10 = v9;

      -[MapsPieProgressLayer setProgress:](v5, "setProgress:", v10);
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
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("borderLineWidth")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___MapsPieProgressLayer;
    v5 = objc_msgSendSuper2(&v7, "needsDisplayForKey:", v4);
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
  CGFloat v10;
  CGFloat v11;
  CGFloat MidX;
  CGFloat MidY;
  double v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;

  -[MapsPieProgressLayer bounds](self, "bounds");
  v16 = CGRectInset(v15, self->_borderLineWidth, self->_borderLineWidth);
  x = v16.origin.x;
  y = v16.origin.y;
  width = v16.size.width;
  height = v16.size.height;
  if (v16.size.width >= v16.size.height)
    v9 = v16.size.height;
  else
    v9 = v16.size.width;
  v10 = (v9 - self->_borderLineWidth * 0.5 + 1.0) * 0.5;
  v11 = x;
  MidX = CGRectGetMidX(v16);
  v17.origin.x = x;
  v17.origin.y = y;
  v17.size.width = width;
  v17.size.height = height;
  MidY = CGRectGetMidY(v17);
  CGContextSetLineCap(a3, kCGLineCapButt);
  CGContextSetLineJoin(a3, kCGLineJoinMiter);
  CGContextSetLineWidth(a3, self->_borderLineWidth);
  CGContextBeginPath(a3);
  CGContextAddArc(a3, MidX, MidY, v10, -1.57079633, 4.71238898, 0);
  CGContextSetStrokeColorWithColor(a3, -[UIColor CGColor](self->_progressColor, "CGColor"));
  CGContextStrokePath(a3);
  CGContextSetLineWidth(a3, v10);
  CGContextBeginPath(a3);
  -[MapsPieProgressLayer progress](self, "progress");
  CGContextAddArc(a3, MidX, MidY, v10 * 0.5, -1.57079633, v14 * 6.28318531 + -1.57079633, 0);
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

- (double)borderLineWidth
{
  return self->_borderLineWidth;
}

- (void)setBorderLineWidth:(double)a3
{
  self->_borderLineWidth = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressColor, 0);
}

@end
