@implementation TransitDirectionsColoredLine

- (TransitDirectionsColoredLine)initWithStyle:(unint64_t)a3
{
  TransitDirectionsColoredLine *result;

  result = -[TransitDirectionsColoredLine initWithFrame:](self, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  if (result)
    result->_style = a3;
  return result;
}

- (TransitDirectionsColoredLine)initWithFrame:(CGRect)a3
{
  TransitDirectionsColoredLine *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TransitDirectionsColoredLine;
  v3 = -[TransitDirectionsColoredLine initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[TransitDirectionsColoredLine setBackgroundColor:](v3, "setBackgroundColor:", v4);

    -[TransitDirectionsColoredLine setContentMode:](v3, "setContentMode:", 3);
  }
  return v3;
}

- (void)setLineColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_lineColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_lineColor, a3);
    -[TransitDirectionsColoredLine setNeedsDisplay](self, "setNeedsDisplay");
    v5 = v6;
  }

}

- (void)setStyle:(unint64_t)a3
{
  if (self->_style != a3)
  {
    self->_style = a3;
    -[TransitDirectionsColoredLine setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setOuterGapLength:(double)a3
{
  if (self->_outerGapLength != a3)
  {
    self->_outerGapLength = a3;
    -[TransitDirectionsColoredLine setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (double)innerGapLength
{
  double result;
  CGRect v3;

  result = self->_innerGapLength;
  if (result <= 0.0)
  {
    -[TransitDirectionsColoredLine bounds](self, "bounds");
    return CGRectGetWidth(v3);
  }
  return result;
}

- (void)setInnerGapLength:(double)a3
{
  if (self->_innerGapLength != a3)
  {
    self->_innerGapLength = a3;
    -[TransitDirectionsColoredLine setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (unint64_t)_maximumNumberOfDots:(double *)a3
{
  double Width;
  double v6;
  double v7;
  double v8;
  double v9;
  double Height;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  unint64_t v15;
  double v16;
  double v17;
  double v18;
  CGRect v20;
  CGRect v21;

  -[TransitDirectionsColoredLine bounds](self, "bounds");
  Width = CGRectGetWidth(v20);
  -[TransitDirectionsColoredLine innerGapLength](self, "innerGapLength");
  v7 = v6;
  -[TransitDirectionsColoredLine outerGapLength](self, "outerGapLength");
  v9 = v8;
  -[TransitDirectionsColoredLine bounds](self, "bounds");
  Height = CGRectGetHeight(v21);
  -[TransitDirectionsColoredLine outerGapLength](self, "outerGapLength");
  v12 = Height - v11;
  v13 = Width + v9;
  v14 = 0;
  while (v13 <= v12)
  {
    ++v14;
    v13 = Width + v7 + v13;
  }
  v15 = (v14 & 1) + v14;
  if (a3)
  {
    -[TransitDirectionsColoredLine outerGapLength](self, "outerGapLength");
    v17 = Width * (double)(v15 - 1) + v16 * 2.0;
    if (v15 != 1)
    {
      -[TransitDirectionsColoredLine innerGapLength](self, "innerGapLength");
      v17 = v17 + (double)v15 * v18;
    }
    *a3 = v17;
  }
  return v15 - 1;
}

- (void)drawRect:(CGRect)a3
{
  void *v4;
  unint64_t v5;
  double Width;
  CGContext *CurrentContext;
  double v8;
  double Height;
  double v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  CGContext *v14;
  double v15;
  CGFloat v16;
  CGContext *v17;
  double v18;
  CGFloat v19;
  CGLineCap v20;
  double v21;
  BOOL v22;
  CGLineCap v23;
  double v24;
  CGFloat MidY;
  double v26;
  objc_super v27;
  CGFloat lengths[2];
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;

  v27.receiver = self;
  v27.super_class = (Class)TransitDirectionsColoredLine;
  -[TransitDirectionsColoredLine drawRect:](&v27, "drawRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsColoredLine lineColor](self, "lineColor"));
  if (v4)
  {
    v5 = -[TransitDirectionsColoredLine style](self, "style");
    -[TransitDirectionsColoredLine bounds](self, "bounds");
    Width = CGRectGetWidth(v29);
    v26 = 0.0;
    if (v5 != 3 || -[TransitDirectionsColoredLine _maximumNumberOfDots:](self, "_maximumNumberOfDots:", &v26))
    {
      CurrentContext = UIGraphicsGetCurrentContext();
      -[TransitDirectionsColoredLine bounds](self, "bounds");
      CGContextClearRect(CurrentContext, v30);
      CGContextSetLineWidth(CurrentContext, Width);
      CGContextSetStrokeColorWithColor(CurrentContext, (CGColorRef)objc_msgSend(objc_retainAutorelease(v4), "CGColor"));
      v8 = Width * 0.5;
      -[TransitDirectionsColoredLine bounds](self, "bounds");
      Height = CGRectGetHeight(v31);
      if (v5)
      {
        if (v5 != 3)
        {
          v20 = v5 == 1;
          if (v5 == 1)
            v21 = Width * 0.5 + 0.0;
          else
            v21 = 0.0;
          v22 = v5 == 2;
          v23 = v5 == 2;
          if (v22)
            v24 = Height - Width * 0.5;
          else
            v24 = Height;
          -[TransitDirectionsColoredLine bounds](self, "bounds", *(_QWORD *)&v26);
          MidY = CGRectGetMidY(v33);
          CGContextSetLineCap(CurrentContext, v20);
          CGContextMoveToPoint(CurrentContext, v8, MidY);
          CGContextAddLineToPoint(CurrentContext, v8, v21);
          CGContextStrokePath(CurrentContext);
          CGContextSetLineCap(CurrentContext, v23);
          CGContextMoveToPoint(CurrentContext, v8, MidY);
          v17 = CurrentContext;
          v18 = v8;
          v19 = v24;
          goto LABEL_16;
        }
        -[TransitDirectionsColoredLine innerGapLength](self, "innerGapLength");
        v11 = Width + v10;
        -[TransitDirectionsColoredLine bounds](self, "bounds");
        v12 = (CGRectGetHeight(v32) - v26) * 0.5;
        v13 = v12 + 0.0;
        Height = Height - v12;
        lengths[0] = 0.0;
        lengths[1] = v11;
        CGContextSetLineDash(CurrentContext, v11 + Width * 0.5, lengths, 2uLL);
        CGContextSetLineCap(CurrentContext, kCGLineCapRound);
        v14 = CurrentContext;
        v15 = Width * 0.5;
        v16 = v13;
      }
      else
      {
        v16 = 0.0;
        v14 = CurrentContext;
        v15 = Width * 0.5;
      }
      CGContextMoveToPoint(v14, v15, v16);
      v17 = CurrentContext;
      v18 = Width * 0.5;
      v19 = Height;
LABEL_16:
      CGContextAddLineToPoint(v17, v18, v19);
      CGContextStrokePath(CurrentContext);
    }
  }

}

- (UIColor)lineColor
{
  return self->_lineColor;
}

- (double)outerGapLength
{
  return self->_outerGapLength;
}

- (unint64_t)style
{
  return self->_style;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lineColor, 0);
}

@end
