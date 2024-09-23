@implementation CRLCalligraphyStroke

- (CRLCalligraphyStroke)initWithColor:(id)a3 width:(double)a4 cap:(unint64_t)a5 join:(unint64_t)a6 pattern:(id)a7 miterLimit:(double)a8
{
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CRLCalligraphyStroke;
  return -[CRLSmartStroke initWithName:color:width:cap:join:pattern:miterLimit:](&v9, "initWithName:color:width:cap:join:pattern:miterLimit:", CFSTR("Calligraphy"), a3, a5, a6, a7, a4, a8);
}

+ (Class)mutableClass
{
  return (Class)objc_opt_class(CRLMutableCalligraphyStroke, a2);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  CRLMutableCalligraphyStroke *v4;
  void *v5;
  double v6;
  double v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  double v11;
  CRLMutableCalligraphyStroke *v12;

  v4 = [CRLMutableCalligraphyStroke alloc];
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLStroke color](self, "color"));
  -[CRLStroke width](self, "width");
  v7 = v6;
  v8 = -[CRLStroke cap](self, "cap");
  v9 = -[CRLStroke join](self, "join");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLStroke pattern](self, "pattern"));
  -[CRLStroke miterLimit](self, "miterLimit");
  v12 = -[CRLCalligraphyStroke initWithColor:width:cap:join:pattern:miterLimit:](v4, "initWithColor:width:cap:join:pattern:miterLimit:", v5, v8, v9, v10, v7, v11);

  return v12;
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

- (CGAffineTransform)transformInContext:(SEL)a3
{
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  __int128 v13;
  CGAffineTransform *result;
  double v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  CGAffineTransform v21;
  CGAffineTransform v22;
  CGAffineTransform v23;

  v19 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v20 = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&retstr->c = v19;
  v18 = *(_OWORD *)&CGAffineTransformIdentity.tx;
  *(_OWORD *)&retstr->tx = v18;
  CGContextGetCTM(&v23, a4);
  v7 = sub_1000791B0(&v23);
  if (sub_100411714((uint64_t)a4))
    v8 = -v7;
  else
    v8 = v7;
  v9 = sub_100411C88((uint64_t)a4);
  v10 = v8 - (v9 + sub_1004115FC((uint64_t)a4));
  -[CRLCalligraphyStroke angle](self, "angle");
  v12 = v11 - v10;
  if (-[CRLCalligraphyStroke chisel](self, "chisel"))
  {
    v13 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v22.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v22.c = v13;
    *(_OWORD *)&v22.tx = *(_OWORD *)&retstr->tx;
    return CGAffineTransformRotate(retstr, &v22, v12 * -3.14159265 / 180.0);
  }
  else
  {
    -[CRLCalligraphyStroke scale](self, "scale");
    *(_OWORD *)&v22.a = v20;
    *(_OWORD *)&v22.c = v19;
    *(_OWORD *)&v22.tx = v18;
    CGAffineTransformScale(retstr, &v22, 1.0, 1.0 / v15);
    v16 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v21.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v21.c = v16;
    *(_OWORD *)&v21.tx = *(_OWORD *)&retstr->tx;
    result = CGAffineTransformRotate(&v22, &v21, v12 * 3.14159265 / 180.0);
    v17 = *(_OWORD *)&v22.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v22.a;
    *(_OWORD *)&retstr->c = v17;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v22.tx;
  }
  return result;
}

- (void)applyToContext:(CGContext *)a3 insideStroke:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRLCalligraphyStroke;
  -[CRLStroke applyToContext:insideStroke:](&v5, "applyToContext:insideStroke:", a3, a4);
  CGContextSetLineCap(a3, kCGLineCapRound);
  CGContextSetLineJoin(a3, kCGLineJoinRound);
}

- (void)paintPath:(CGPath *)a3 wantsInteriorStroke:(BOOL)a4 inContext:(CGContext *)a5 useFastDrawing:(BOOL)a6 parameterized:(BOOL)a7 shouldReverseDrawOrder:(BOOL)a8
{
  _BOOL8 v9;
  CGPath *v12;
  void *v13;
  id v14;
  const CGPath *v15;
  void *v16;
  CGAffineTransform v17;
  CGAffineTransform v18;
  CGAffineTransform v19;

  v9 = a4;
  if (-[CRLStroke shouldRender](self, "shouldRender", a3, a4, a5, a6, a7, a8))
  {
    memset(&v19, 0, sizeof(v19));
    -[CRLCalligraphyStroke transformInContext:](self, "transformInContext:", a5);
    v18 = v19;
    v12 = sub_1000C8414(a3, &v18);
    CGContextSaveGState(a5);
    -[CRLCalligraphyStroke applyToContext:insideStroke:](self, "applyToContext:insideStroke:", a5, v9);
    v18 = v19;
    CGAffineTransformInvert(&v17, &v18);
    CGContextConcatCTM(a5, &v17);
    if (-[CRLCalligraphyStroke chisel](self, "chisel"))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPathWithCGPath:](CRLBezierPath, "bezierPathWithCGPath:", v12));
      -[CRLStroke width](self, "width");
      objc_msgSend(v13, "setLineWidth:");
      v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "chisel")));
      v15 = (const CGPath *)objc_msgSend(v14, "CGPath");

      CGContextAddPath(a5, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLStroke color](self, "color"));
      CGContextSetFillColorWithColor(a5, (CGColorRef)objc_msgSend(v16, "CGColor"));

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
  id v14;
  double v15;
  CGFloat v16;
  double v17;
  id v18;
  const CGPath *v19;
  CGPath *v20;
  CGFloat v21;
  CGAffineTransform v22;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v25;
  CGAffineTransform transform;
  CGAffineTransform v27;

  y = a4.y;
  x = a4.x;
  v14 = a3;
  CGContextSaveGState(a7);
  -[CRLCalligraphyStroke applyToContext:insideStroke:](self, "applyToContext:insideStroke:", a7, 0);
  memset(&v27, 0, sizeof(v27));
  -[CRLCalligraphyStroke transformInContext:](self, "transformInContext:", a7);
  v25 = v27;
  CGAffineTransformInvert(&transform, &v25);
  CGContextConcatCTM(a7, &transform);
  memset(&v25, 0, sizeof(v25));
  CGAffineTransformMakeTranslation(&v25, x, y);
  t2 = v25;
  CGAffineTransformScale(&t1, &t2, a6, a6);
  v25 = t1;
  t2 = t1;
  CGAffineTransformRotate(&t1, &t2, a5);
  v25 = t1;
  objc_msgSend(v14, "endPoint");
  v16 = -v15;
  objc_msgSend(v14, "endPoint");
  t2 = v25;
  CGAffineTransformTranslate(&t1, &t2, v16, -v17);
  v25 = t1;
  v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "path")));
  v19 = (const CGPath *)objc_msgSend(v18, "CGPath");
  t1 = v25;
  t2 = v27;
  CGAffineTransformConcat(&v22, &t1, &t2);
  v20 = sub_1000C8414(v19, &v22);

  CGContextAddPath(a7, v20);
  CGPathRelease(v20);
  if (objc_msgSend(v14, "isFilled"))
  {
    CGContextFillPath(a7);
  }
  else
  {
    -[CRLStroke width](self, "width");
    CGContextSetLineWidth(a7, v21);
    CGContextSetLineJoin(a7, (CGLineJoin)objc_msgSend(v14, "lineJoin"));
    CGContextStrokePath(a7);
  }
  CGContextRestoreGState(a7);

}

- (CGRect)boundsForLineEnd:(id)a3 atPoint:(CGPoint)a4 atAngle:(double)a5 withScale:(double)a6 transform:(CGAffineTransform *)a7
{
  double y;
  double x;
  __int128 v12;
  id v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat width;
  double v20;
  CGFloat height;
  unsigned __int8 v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  double v28;
  double v29;
  double v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  objc_super v34;
  CGRect v35;
  CGRect v36;
  CGRect result;

  y = a4.y;
  x = a4.x;
  v34.receiver = self;
  v34.super_class = (Class)CRLCalligraphyStroke;
  v12 = *(_OWORD *)&a7->c;
  v31 = *(_OWORD *)&a7->a;
  v32 = v12;
  v33 = *(_OWORD *)&a7->tx;
  v13 = a3;
  -[CRLStroke boundsForLineEnd:atPoint:atAngle:withScale:transform:](&v34, "boundsForLineEnd:atPoint:atAngle:withScale:transform:", v13, &v31, x, y, a5, a6);
  v15 = v14;
  v17 = v16;
  width = v18;
  height = v20;
  v22 = objc_msgSend(v13, "isFilled", v31, v32, v33, v34.receiver, v34.super_class);

  if ((v22 & 1) == 0)
  {
    -[CRLStroke width](self, "width");
    v24 = v23 * -0.5;
    -[CRLStroke width](self, "width");
    v26 = v25 * -0.5;
    v35.origin.x = v15;
    v35.origin.y = v17;
    v35.size.width = width;
    v35.size.height = height;
    v36 = CGRectInset(v35, v24, v26);
    v15 = v36.origin.x;
    v17 = v36.origin.y;
    width = v36.size.width;
    height = v36.size.height;
  }
  v27 = v15;
  v28 = v17;
  v29 = width;
  v30 = height;
  result.size.height = v30;
  result.size.width = v29;
  result.origin.y = v28;
  result.origin.x = v27;
  return result;
}

- (double)horizontalMarginForSwatch
{
  double v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CRLCalligraphyStroke;
  -[CRLStroke horizontalMarginForSwatch](&v4, "horizontalMarginForSwatch");
  return v2 + 3.0;
}

@end
