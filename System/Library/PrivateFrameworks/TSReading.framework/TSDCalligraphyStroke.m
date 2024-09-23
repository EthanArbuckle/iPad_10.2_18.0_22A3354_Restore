@implementation TSDCalligraphyStroke

- (TSDCalligraphyStroke)initWithColor:(id)a3 width:(double)a4 cap:(int)a5 join:(int)a6 pattern:(id)a7 miterLimit:(double)a8
{
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TSDCalligraphyStroke;
  return -[TSDSmartStroke initWithName:color:width:cap:join:pattern:miterLimit:](&v9, sel_initWithName_color_width_cap_join_pattern_miterLimit_, CFSTR("Calligraphy"), a3, *(_QWORD *)&a5, *(_QWORD *)&a6, a7, a4, a8);
}

+ (Class)mutableClass
{
  return (Class)objc_opt_class();
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  TSDMutableCalligraphyStroke *v4;
  TSUColor *v5;
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  TSDStrokePattern *v10;
  double v11;

  v4 = [TSDMutableCalligraphyStroke alloc];
  v5 = -[TSDStroke color](self, "color");
  -[TSDStroke width](self, "width");
  v7 = v6;
  v8 = -[TSDStroke cap](self, "cap");
  v9 = -[TSDStroke join](self, "join");
  v10 = -[TSDStroke pattern](self, "pattern");
  -[TSDStroke miterLimit](self, "miterLimit");
  return -[TSDCalligraphyStroke initWithColor:width:cap:join:pattern:miterLimit:](v4, "initWithColor:width:cap:join:pattern:miterLimit:", v5, v8, v9, v10, v7, v11);
}

- (double)angle
{
  return 45.0;
}

- (double)scale
{
  return 0.15;
}

- (BOOL)chisel
{
  return 0;
}

- (BOOL)canApplyToShapeRenderable
{
  return 1;
}

- (BOOL)prefersToApplyToShapeRenderableDuringManipulation
{
  return 0;
}

- (BOOL)drawsInOneStep
{
  return 0;
}

- (BOOL)drawsOutsideStrokeBounds
{
  return 0;
}

- (CGRect)p_superBoundsForPath:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  objc_super v7;
  CGRect result;

  v7.receiver = self;
  v7.super_class = (Class)TSDCalligraphyStroke;
  -[TSDStroke boundsForPath:](&v7, sel_boundsForPath_, a3);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)boundsForPath:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  v4 = (id)-[TSDCalligraphyStroke mutableCopy](self, "mutableCopy");
  objc_msgSend(v4, "setCap:", 2);
  objc_msgSend(v4, "setJoin:", 1);
  objc_msgSend(v4, "p_superBoundsForPath:", a3);
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (CGAffineTransform)transformInContext:(SEL)a3
{
  uint64_t v7;
  __int128 v8;
  double v9;
  double v10;
  double LayoutAngle;
  double v12;
  double v13;
  double v14;
  __int128 v15;
  CGAffineTransform *result;
  __int128 v17;
  double v18;
  __int128 v19;
  __int128 v20;
  CGAffineTransform v21;
  CGAffineTransform v22;
  CGAffineTransform v23;
  CGAffineTransform v24;
  CGAffineTransform v25;

  v7 = MEMORY[0x24BDBD8B8];
  v8 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&retstr->c = v8;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v7 + 32);
  CGContextGetCTM(&v25, a4);
  v9 = TSDTransformAngle(&v25.a);
  if (TSDCGContextGetIsReflection((uint64_t)a4))
    v10 = -v9;
  else
    v10 = v9;
  LayoutAngle = TSDCGContextGetLayoutAngle((uint64_t)a4);
  v12 = v10 - (LayoutAngle + TSDCGContextGetShadowedLayoutAngle((uint64_t)a4));
  -[TSDCalligraphyStroke angle](self, "angle");
  v14 = v13 - v12;
  if (-[TSDCalligraphyStroke chisel](self, "chisel"))
  {
    v15 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v21.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v21.c = v15;
    *(_OWORD *)&v21.tx = *(_OWORD *)&retstr->tx;
    return CGAffineTransformRotate(retstr, &v21, v14 * -3.14159265 / 180.0);
  }
  else
  {
    v17 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v24.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v24.c = v17;
    *(_OWORD *)&v24.tx = *(_OWORD *)&retstr->tx;
    -[TSDCalligraphyStroke scale](self, "scale");
    CGAffineTransformScale(retstr, &v24, 1.0, 1.0 / v18);
    v19 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v22.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v22.c = v19;
    *(_OWORD *)&v22.tx = *(_OWORD *)&retstr->tx;
    result = CGAffineTransformRotate(&v23, &v22, v14 * 3.14159265 / 180.0);
    v20 = *(_OWORD *)&v23.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v23.a;
    *(_OWORD *)&retstr->c = v20;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v23.tx;
  }
  return result;
}

- (void)applyToContext:(CGContext *)a3 insideStroke:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSDCalligraphyStroke;
  -[TSDStroke applyToContext:insideStroke:](&v5, sel_applyToContext_insideStroke_, a3, a4);
  CGContextSetLineCap(a3, kCGLineCapRound);
  CGContextSetLineJoin(a3, kCGLineJoinRound);
}

- (void)paintPath:(CGPath *)a3 wantsInteriorStroke:(BOOL)a4 inContext:(CGContext *)a5 useFastDrawing:(BOOL)a6 parameterized:(BOOL)a7 shouldReverseDrawOrder:(BOOL)a8
{
  _BOOL8 v9;
  CGPath *v12;
  TSDBezierPath *v13;
  CGAffineTransform v14;
  CGAffineTransform transform;
  CGAffineTransform v16[2];

  v9 = a4;
  if (-[TSDStroke shouldRender](self, "shouldRender", a3, a4, a5, a6, a7, a8))
  {
    memset(&v16[1], 0, sizeof(CGAffineTransform));
    if (self)
      -[TSDCalligraphyStroke transformInContext:](self, "transformInContext:", a5);
    v16[0] = v16[1];
    v12 = TSDCreateTransformedPath(a3, v16);
    CGContextSaveGState(a5);
    -[TSDCalligraphyStroke applyToContext:insideStroke:](self, "applyToContext:insideStroke:", a5, v9);
    v14 = v16[1];
    CGAffineTransformInvert(&transform, &v14);
    CGContextConcatCTM(a5, &transform);
    if (-[TSDCalligraphyStroke chisel](self, "chisel"))
    {
      v13 = +[TSDBezierPath bezierPathWithCGPath:](TSDBezierPath, "bezierPathWithCGPath:", v12);
      -[TSDStroke width](self, "width");
      -[TSDBezierPath setLineWidth:](v13, "setLineWidth:");
      CGContextAddPath(a5, (CGPathRef)objc_msgSend(-[TSDBezierPath chisel](v13, "chisel"), "CGPath"));
      CGContextSetFillColorWithColor(a5, (CGColorRef)-[TSUColor CGColor](-[TSDStroke color](self, "color"), "CGColor"));
      CGContextFillPath(a5);
    }
    else
    {
      CGContextAddPath(a5, v12);
      CGContextStrokePath(a5);
    }
    CGPathRelease(v12);
    CGContextRestoreGState(a5);
  }
}

- (void)paintLineEnd:(id)a3 atPoint:(CGPoint)a4 atAngle:(double)a5 withScale:(double)a6 inContext:(CGContext *)a7 useFastDrawing:(BOOL)a8
{
  CGFloat y;
  CGFloat x;
  double v15;
  CGFloat v16;
  double v17;
  const CGPath *v18;
  CGPath *v19;
  CGFloat v20;
  CGAffineTransform v21;
  CGAffineTransform t1;
  CGAffineTransform v23;
  CGAffineTransform v24;
  CGAffineTransform v25;
  CGAffineTransform v26;
  CGAffineTransform v27;
  CGAffineTransform v28;
  CGAffineTransform v29;
  CGAffineTransform transform;
  CGAffineTransform v31;

  y = a4.y;
  x = a4.x;
  CGContextSaveGState(a7);
  -[TSDCalligraphyStroke applyToContext:insideStroke:](self, "applyToContext:insideStroke:", a7, 0);
  memset(&v31, 0, sizeof(v31));
  if (self)
    -[TSDCalligraphyStroke transformInContext:](self, "transformInContext:", a7);
  v29 = v31;
  CGAffineTransformInvert(&transform, &v29);
  CGContextConcatCTM(a7, &transform);
  memset(&v28, 0, sizeof(v28));
  CGAffineTransformMakeTranslation(&v28, x, y);
  v26 = v28;
  CGAffineTransformScale(&v27, &v26, a6, a6);
  v28 = v27;
  v25 = v27;
  CGAffineTransformRotate(&v27, &v25, a5);
  v28 = v27;
  v24 = v27;
  objc_msgSend(a3, "endPoint");
  v16 = -v15;
  objc_msgSend(a3, "endPoint");
  CGAffineTransformTranslate(&v27, &v24, v16, -v17);
  v28 = v27;
  v18 = (const CGPath *)objc_msgSend(a3, "path");
  t1 = v28;
  v21 = v31;
  CGAffineTransformConcat(&v23, &t1, &v21);
  v19 = TSDCreateTransformedPath(v18, &v23);
  CGContextAddPath(a7, v19);
  CGPathRelease(v19);
  if (objc_msgSend(a3, "isFilled"))
  {
    CGContextFillPath(a7);
  }
  else
  {
    -[TSDStroke width](self, "width");
    CGContextSetLineWidth(a7, v20);
    CGContextSetLineJoin(a7, (CGLineJoin)objc_msgSend(a3, "lineJoin"));
    CGContextStrokePath(a7);
  }
  CGContextRestoreGState(a7);
}

- (CGRect)boundsForLineEnd:(id)a3 atPoint:(CGPoint)a4 atAngle:(double)a5 withScale:(double)a6 transform:(CGAffineTransform *)a7
{
  __int128 v9;
  double v10;
  CGFloat x;
  double v12;
  CGFloat y;
  double v14;
  CGFloat width;
  double v16;
  CGFloat height;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  double v23;
  double v24;
  double v25;
  objc_super v26;
  _OWORD v27[3];
  CGRect v28;
  CGRect v29;
  CGRect result;

  v9 = *(_OWORD *)&a7->c;
  v27[0] = *(_OWORD *)&a7->a;
  v27[1] = v9;
  v27[2] = *(_OWORD *)&a7->tx;
  v26.receiver = self;
  v26.super_class = (Class)TSDCalligraphyStroke;
  -[TSDStroke boundsForLineEnd:atPoint:atAngle:withScale:transform:](&v26, sel_boundsForLineEnd_atPoint_atAngle_withScale_transform_, a3, v27, a4.x, a4.y, a5, a6);
  x = v10;
  y = v12;
  width = v14;
  height = v16;
  if ((objc_msgSend(a3, "isFilled") & 1) == 0)
  {
    -[TSDStroke width](self, "width");
    v19 = v18 * -0.5;
    -[TSDStroke width](self, "width");
    v21 = v20 * -0.5;
    v28.origin.x = x;
    v28.origin.y = y;
    v28.size.width = width;
    v28.size.height = height;
    v29 = CGRectInset(v28, v19, v21);
    x = v29.origin.x;
    y = v29.origin.y;
    width = v29.size.width;
    height = v29.size.height;
  }
  v22 = x;
  v23 = y;
  v24 = width;
  v25 = height;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (double)horizontalMarginForSwatch
{
  double v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TSDCalligraphyStroke;
  -[TSDStroke horizontalMarginForSwatch](&v4, sel_horizontalMarginForSwatch);
  return v2 + 3.0;
}

@end
