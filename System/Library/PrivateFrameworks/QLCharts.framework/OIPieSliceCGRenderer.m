@implementation OIPieSliceCGRenderer

- (OIPieSliceCGRenderer)initWithChart:(__OIChart *)a3
{
  OIPieSliceCGRenderer *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)OIPieSliceCGRenderer;
  v4 = -[OIPieSliceCGRenderer init](&v6, sel_init);
  if (v4)
    -[OIPieSliceCGRenderer setChart:](v4, "setChart:", OILabelRetain(a3));
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  OIChartRelease(self->_chart);
  v3.receiver = self;
  v3.super_class = (Class)OIPieSliceCGRenderer;
  -[OIPieSliceCGRenderer dealloc](&v3, sel_dealloc);
}

- (void)renderPieSliceFromSeries:(__OISeries *)a3 radius:(double)a4 angle:(double)a5 newAngle:(double)a6 xOffset:(double)a7 yOffset:(double)a8 thickness:(double)a9
{
  CGContext *Type;
  CGColor *TextColor;
  CGColor *StrokeColor;
  double v20;
  double v21;
  __double2 v22;
  __double2 v23;
  CGColor *v24;
  double StrokeWidth;
  __double2 v26;
  CGFloat v27;
  CGFloat v28;
  CGColor *v29;
  double v30;
  __double2 v31;
  CGFloat v32;
  CGFloat v33;
  CGColor *v34;
  double v35;
  __double2 v36;
  double v37;

  Type = (CGContext *)OIAxisGetType((uint64_t)self->_chart);
  TextColor = (CGColor *)OILabelGetTextColor((uint64_t)a3);
  StrokeColor = (CGColor *)OILabelGetStrokeColor((uint64_t)a3);
  if (a5 >= -3.14159265 && a9 > 0.0 && (a6 < 0.0 || a5 > 3.14159265 || a5 < 0.0 || a6 > 3.14159265))
  {
    if (a5 >= 3.14159265 || a5 <= 0.0)
      v20 = a5;
    else
      v20 = 0.0;
    if (a6 >= -3.14159265)
      v21 = a6;
    else
      v21 = 3.14159265;
    v22 = __sincos_stret(v20);
    CGContextMoveToPoint(Type, a7 + a4 * v22.__cosval, a8 + a4 * v22.__sinval);
    CGContextAddArc(Type, a7, a8, a4, v20, v21, 1);
    v23 = __sincos_stret(v21);
    CGContextAddLineToPoint(Type, a7 + a4 * v23.__cosval, a8 + a4 * v23.__sinval - a9);
    CGContextAddArc(Type, a7, a8 - a9, a4, v21, v20, 0);
    if (TextColor)
    {
      v24 = OICreateDimmedColorFromColor(TextColor, 0.5);
      CGContextSetFillColorWithColor(Type, v24);
      CGContextFillPath(Type);
      CGColorRelease(v24);
    }
    if (StrokeColor)
    {
      CGContextSetStrokeColorWithColor(Type, StrokeColor);
      StrokeWidth = OILabelGetStrokeWidth((uint64_t)a3);
      CGContextSetLineWidth(Type, StrokeWidth);
      CGContextStrokePath(Type);
    }
  }
  if (a5 < -1.57079633 && a9 > 0.0)
  {
    v26 = __sincos_stret(a5);
    v27 = a7 + a4 * v26.__cosval;
    v28 = a8 + a4 * v26.__sinval;
    CGContextMoveToPoint(Type, v27, v28);
    CGContextAddLineToPoint(Type, v27, v28 - a9);
    CGContextAddLineToPoint(Type, a7, a8 - a9);
    CGContextAddLineToPoint(Type, a7, a8);
    if (TextColor)
    {
      v29 = OICreateDimmedColorFromColor(TextColor, 0.5);
      CGContextSetFillColorWithColor(Type, v29);
      CGContextFillPath(Type);
      CGColorRelease(v29);
    }
    if (StrokeColor)
    {
      CGContextSetStrokeColorWithColor(Type, StrokeColor);
      v30 = OILabelGetStrokeWidth((uint64_t)a3);
      CGContextSetLineWidth(Type, v30);
      CGContextStrokePath(Type);
    }
  }
  if (a6 > -1.57079633 && a9 > 0.0)
  {
    v31 = __sincos_stret(a6);
    v32 = a7 + a4 * v31.__cosval;
    v33 = a8 + a4 * v31.__sinval;
    CGContextMoveToPoint(Type, v32, v33);
    CGContextAddLineToPoint(Type, v32, v33 - a9);
    CGContextAddLineToPoint(Type, a7, a8 - a9);
    CGContextAddLineToPoint(Type, a7, a8);
    if (TextColor)
    {
      v34 = OICreateDimmedColorFromColor(TextColor, 0.5);
      CGContextSetFillColorWithColor(Type, v34);
      CGContextFillPath(Type);
      CGColorRelease(v34);
    }
    if (StrokeColor)
    {
      CGContextSetStrokeColorWithColor(Type, StrokeColor);
      v35 = OILabelGetStrokeWidth((uint64_t)a3);
      CGContextSetLineWidth(Type, v35);
      CGContextStrokePath(Type);
    }
  }
  CGContextMoveToPoint(Type, a7, floor(a8) + 0.5);
  v36 = __sincos_stret(a5);
  CGContextAddLineToPoint(Type, a7 + a4 * v36.__cosval, a8 + a4 * v36.__sinval);
  CGContextAddArc(Type, a7, a8, a4, a5, a6, 1);
  CGContextAddLineToPoint(Type, a7, a8);
  if (TextColor)
  {
    CGContextSetFillColorWithColor(Type, TextColor);
    CGContextFillPath(Type);
  }
  if (StrokeColor)
  {
    CGContextSetStrokeColorWithColor(Type, StrokeColor);
    v37 = OILabelGetStrokeWidth((uint64_t)a3);
    CGContextSetLineWidth(Type, v37);
    CGContextStrokePath(Type);
  }
}

- (__OIChart)chart
{
  return self->_chart;
}

- (void)setChart:(__OIChart *)a3
{
  self->_chart = a3;
}

@end
