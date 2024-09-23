@implementation CRLTransformGradientFill

- (CRLTransformGradientFill)initWithStartColor:(id)a3 endColor:(id)a4 type:(unint64_t)a5
{
  CRLTransformGradientFill *v5;
  CRLTransformGradientFill *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CRLTransformGradientFill;
  v5 = -[CRLGradientFill initWithStartColor:endColor:type:](&v8, "initWithStartColor:endColor:type:", a3, a4, a5);
  v6 = v5;
  if (v5)
    -[CRLTransformGradientFill p_setDefaultValues](v5, "p_setDefaultValues");
  return v6;
}

- (CRLTransformGradientFill)initWithGradientStops:(id)a3 type:(unint64_t)a4
{
  CRLTransformGradientFill *v4;
  CRLTransformGradientFill *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CRLTransformGradientFill;
  v4 = -[CRLGradientFill initWithGradientStops:type:](&v7, "initWithGradientStops:type:", a3, a4);
  v5 = v4;
  if (v4)
    -[CRLTransformGradientFill p_setDefaultValues](v4, "p_setDefaultValues");
  return v5;
}

- (CRLTransformGradientFill)initWithGradient:(id)a3 inPath:(id)a4 andBounds:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v11;
  CRLTransformGradientFill *v12;
  uint64_t v13;
  id v14;
  double v15;
  double v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  objc_super v22;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v22.receiver = self;
  v22.super_class = (Class)CRLTransformGradientFill;
  v12 = -[CRLGradientFill initWithGradientStops:type:](&v22, "initWithGradientStops:type:", objc_msgSend(a3, "gradientStops"), objc_msgSend(a3, "gradientType"));
  if (v12)
  {
    objc_opt_class(CRLTransformGradientFill, v11);
    v14 = sub_100221D0C(v13, a3);
    if (v14)
    {
      objc_msgSend(v14, "baseNaturalSizeForBounds:", x, y, width, height);
      width = v15;
      height = v16;
    }
    v12->mBaseNaturalSize.width = width;
    v12->mBaseNaturalSize.height = height;
    objc_msgSend(a3, "startPointForPath:andBounds:", a4, sub_10005FDDC());
    v12->mStart.x = v17;
    v12->mStart.y = v18;
    objc_msgSend(a3, "endPointForPath:andBounds:", a4, sub_10005FDDC());
    v12->mEnd.x = v19;
    v12->mEnd.y = v20;
  }
  return v12;
}

- (CRLTransformGradientFill)initWithGradientStops:(id)a3 type:(unint64_t)a4 opacity:(double)a5 startPoint:(CGPoint)a6 endPoint:(CGPoint)a7 baseNaturalSize:(CGSize)a8 isAdvancedGradient:(BOOL)a9
{
  _BOOL8 v9;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v14;
  CGFloat v15;
  CRLTransformGradientFill *v16;
  CRLTransformGradientFill *v17;
  objc_super v19;

  v9 = a9;
  height = a8.height;
  width = a8.width;
  y = a7.y;
  x = a7.x;
  v14 = a6.y;
  v15 = a6.x;
  v19.receiver = self;
  v19.super_class = (Class)CRLTransformGradientFill;
  v16 = -[CRLGradientFill initWithGradientStops:type:opacity:](&v19, "initWithGradientStops:type:opacity:", a3, a4, a5);
  v17 = v16;
  if (v16)
  {
    v16->mBaseNaturalSize.width = width;
    v16->mBaseNaturalSize.height = height;
    v16->mStart.x = v15;
    v16->mStart.y = v14;
    v16->mEnd.x = x;
    v16->mEnd.y = y;
    -[CRLGradientFill p_setIsAdvancedGradient:](v16, "p_setIsAdvancedGradient:", v9);
  }
  return v17;
}

- (unint64_t)hash
{
  char *p_mStart;
  id v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v8;

  p_mStart = (char *)&self->mStart;
  v8.receiver = self;
  v8.super_class = (Class)CRLTransformGradientFill;
  v4 = -[CRLGradientFill hash](&v8, "hash");
  v5 = sub_1000BC018(p_mStart, 16, (uint64_t)v4);
  v6 = sub_1000BC018((char *)&self->mEnd, 16, v5);
  return sub_1000BC018((char *)&self->mBaseNaturalSize, 16, v6);
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CRLTransformGradientFill;
  -[CRLGradientFill dealloc](&v2, "dealloc");
}

- (id)description
{
  Class v3;
  NSString *v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSString *v8;
  NSString *v9;

  objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = -[CRLGradientFill gradientType](self, "gradientType");
  -[CRLGradientFill opacity](self, "opacity");
  v7 = v6;
  v8 = NSStringFromCGPoint(self->mStart);
  v9 = NSStringFromCGPoint(self->mEnd);
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>: type=%tu opacity=%f start=%@ end=%@ \n\tstops=%@ \n\tbase size=%@"), v4, self, v5, v7, v8, v9, -[CRLGradientFill gradientStops](self, "gradientStops"), NSStringFromCGSize(self->mBaseNaturalSize));
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  BOOL v12;
  double v13;
  double v14;
  BOOL v15;
  CGSize *p_mBaseNaturalSize;
  double v17;
  double v18;
  objc_super v20;
  uint64_t v21;
  uint64_t v22;

  if (a3 == self)
  {
    LOBYTE(v8) = 1;
  }
  else
  {
    v21 = v3;
    v22 = v4;
    objc_opt_class(CRLTransformGradientFill, a2);
    v8 = sub_100221D0C(v7, a3);
    if (v8)
    {
      v9 = v8;
      v20.receiver = self;
      v20.super_class = (Class)CRLTransformGradientFill;
      LODWORD(v8) = -[CRLGradientFill isEqual:](&v20, "isEqual:", a3);
      if ((_DWORD)v8)
      {
        objc_msgSend(v9, "startPoint");
        v12 = self->mStart.x == v11 && self->mStart.y == v10;
        if (v12 && ((objc_msgSend(v9, "endPoint"), self->mEnd.x == v14) ? (v15 = self->mEnd.y == v13) : (v15 = 0), v15))
        {
          p_mBaseNaturalSize = &self->mBaseNaturalSize;
          objc_msgSend(v9, "baseNaturalSize");
          LOBYTE(v8) = p_mBaseNaturalSize->height == v18 && p_mBaseNaturalSize->width == v17;
        }
        else
        {
          LOBYTE(v8) = 0;
        }
      }
    }
  }
  return (char)v8;
}

- (BOOL)isEqualIgnoringTransform:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  id v8;
  void *v9;
  CGSize *p_mBaseNaturalSize;
  double v11;
  double v12;
  objc_super v14;
  uint64_t v15;
  uint64_t v16;

  if (a3 == self)
  {
    LOBYTE(v8) = 1;
  }
  else
  {
    v15 = v3;
    v16 = v4;
    objc_opt_class(CRLTransformGradientFill, a2);
    v8 = sub_100221D0C(v7, a3);
    if (v8)
    {
      v9 = v8;
      v14.receiver = self;
      v14.super_class = (Class)CRLTransformGradientFill;
      LODWORD(v8) = -[CRLGradientFill isEqual:](&v14, "isEqual:", a3);
      if ((_DWORD)v8)
      {
        p_mBaseNaturalSize = &self->mBaseNaturalSize;
        objc_msgSend(v9, "baseNaturalSize");
        LOBYTE(v8) = p_mBaseNaturalSize->height == v12 && p_mBaseNaturalSize->width == v11;
      }
    }
  }
  return (char)v8;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  CRLMutableTransformGradientFill *v4;
  NSArray *v5;
  unint64_t v6;
  CRLMutableTransformGradientFill *v7;

  v4 = +[CRLMutableTransformGradientFill allocWithZone:](CRLMutableTransformGradientFill, "allocWithZone:", a3);
  v5 = -[CRLGradientFill gradientStops](self, "gradientStops");
  v6 = -[CRLGradientFill gradientType](self, "gradientType");
  -[CRLGradientFill opacity](self, "opacity");
  v7 = -[CRLGradientFill initWithGradientStops:type:opacity:](v4, "initWithGradientStops:type:opacity:", v5, v6);
  -[CRLGradientFill i_setAdvancedGradientFlag:](v7, "i_setAdvancedGradientFlag:", -[CRLGradientFill i_advancedGradientFlag](self, "i_advancedGradientFlag"));
  -[CRLTransformGradientFill startPoint](self, "startPoint");
  -[CRLMutableTransformGradientFill setStartPoint:](v7, "setStartPoint:");
  -[CRLTransformGradientFill endPoint](self, "endPoint");
  -[CRLMutableTransformGradientFill setEndPoint:](v7, "setEndPoint:");
  -[CRLTransformGradientFill baseNaturalSize](self, "baseNaturalSize");
  -[CRLMutableTransformGradientFill setBaseNaturalSize:](v7, "setBaseNaturalSize:");
  return v7;
}

- (BOOL)isAdvancedGradientIgnoringFlag
{
  return 1;
}

- (CGPoint)normalizedPointForSize:(CGSize)a3 endPoint:(BOOL)a4
{
  _BOOL4 v4;
  double height;
  double width;
  double v8;
  double v9;
  double v10;
  double v11;
  float64x2_t v12;
  float64x2_t v13;
  float64x2_t v14;
  __int128 v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  float64x2_t v40;
  double v41;
  float64x2_t v42;
  float64x2_t v43;
  float64x2_t v44;
  float64x2_t v45;
  double v46;
  double v47;
  double v48;
  float64x2_t v49;
  double v50;
  double v51;
  float64x2_t v52;
  float64x2_t v53;
  float64x2_t v54;
  float64x2_t v55;
  float64x2_t v56;
  float64x2_t v57;
  CGAffineTransform v58;
  CGAffineTransform v59;
  CGAffineTransform v60;
  CGPoint result;

  v4 = a4;
  height = a3.height;
  width = a3.width;
  -[CRLTransformGradientFill startPoint](self, "startPoint");
  v46 = v9;
  v47 = v8;
  -[CRLTransformGradientFill endPoint](self, "endPoint");
  v50 = v11;
  v51 = v10;
  if (-[CRLGradientFill gradientType](self, "gradientType"))
  {
    if (self)
    {
      -[CRLTransformGradientFill transformForSize:](self, "transformForSize:", width, height);
      v12 = v55;
      v13 = v56;
      v14 = v57;
    }
    else
    {
      v14 = 0uLL;
      v12 = 0uLL;
      v13 = 0uLL;
    }
    v42 = vaddq_f64(v14, vmlaq_n_f64(vmulq_n_f64(v13, v46), v12, v47));
    if (self)
    {
      v49 = v42;
      -[CRLTransformGradientFill transformForSize:](self, "transformForSize:", width, height);
      v42 = v49;
      v43 = v52;
      v44 = v53;
      v45 = v54;
    }
    else
    {
      v45 = 0uLL;
      v43 = 0uLL;
      v44 = 0uLL;
    }
    v38 = v42.f64[1];
    v40 = vaddq_f64(v45, vmlaq_n_f64(vmulq_n_f64(v44, v50), v43, v51));
    v41 = v40.f64[1];
  }
  else
  {
    v15 = 0uLL;
    memset(&v60, 0, sizeof(v60));
    if (self)
    {
      -[CRLTransformGradientFill transformForSize:](self, "transformForSize:", width, height);
      v15 = 0uLL;
    }
    *(_OWORD *)&v59.c = v15;
    *(_OWORD *)&v59.tx = v15;
    *(_OWORD *)&v59.a = v15;
    v58 = v60;
    CGAffineTransformInvert(&v59, &v58);
    v16 = sub_1000603B8(v51, v50, v47);
    v58 = v59;
    v18 = sub_10006214C((float64x2_t *)&v58, v16, v17);
    v19 = v60.tx + v46 * v60.c + v60.a * v47;
    v20 = v60.ty + v46 * v60.d + v60.b * v47;
    v21 = v60.tx + v50 * v60.c + v60.a * v51;
    v22 = v60.ty + v50 * v60.d + v60.b * v51;
    v24 = sub_100060398(v18, v23);
    v26 = v25;
    v27 = sub_1000603B8(v21, v22, v19);
    v29 = sub_1000603C4(v24, v26, v27, v28);
    v30 = sub_1000603DC(v24, v26, v29);
    v32 = v31;
    v33 = sub_100061A8C(v19, v20, v21, v22, 0.5);
    v35 = v34;
    v36 = sub_1000603DC(v30, v32, -0.5);
    v48 = sub_1000603D0(v33, v35, v36);
    v38 = v37;
    v39 = sub_1000603DC(v30, v32, 0.5);
    v40.f64[0] = sub_1000603D0(v33, v35, v39);
    v42.f64[0] = v48;
  }
  if (!v4)
  {
    v40.f64[0] = v42.f64[0];
    v41 = v38;
  }
  result.x = v40.f64[0];
  result.y = v41;
  return result;
}

- (void)p_setStartPoint:(CGPoint)a3
{
  self->mStart = a3;
}

- (void)p_setEndPoint:(CGPoint)a3
{
  self->mEnd = a3;
}

- (void)p_setBaseNaturalSize:(CGSize)a3
{
  if (a3.height <= 0.0)
    a3.height = 1.0;
  if (a3.width <= 0.0)
    a3.width = 1.0;
  self->mBaseNaturalSize = a3;
}

- (void)paintRect:(CGRect)a3 inContext:(CGContext *)a4
{
  double height;
  double width;
  double y;
  double x;
  CGShading *v10;
  CGFloat MidX;
  CGFloat MinY;
  CGFloat v13;
  CGFloat v14;
  CGAffineTransform v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = -[CRLGradientFill shadingRef](self, "shadingRef");
  CGContextSaveGState(a4);
  v16.origin.x = x;
  v16.origin.y = y;
  v16.size.width = width;
  v16.size.height = height;
  CGContextClipToRect(a4, v16);
  if (-[CRLGradientFill gradientType](self, "gradientType"))
  {
    if (self)
      -[CRLGradientFill centeredRadialTransformInRect:](self, "centeredRadialTransformInRect:", x, y, width, height);
    else
      memset(&v15, 0, sizeof(v15));
    CGContextConcatCTM(a4, &v15);
  }
  else
  {
    v17.origin.x = x;
    v17.origin.y = y;
    v17.size.width = width;
    v17.size.height = height;
    MidX = CGRectGetMidX(v17);
    v18.origin.x = x;
    v18.origin.y = y;
    v18.size.width = width;
    v18.size.height = height;
    MinY = CGRectGetMinY(v18);
    CGContextTranslateCTM(a4, MidX, MinY);
    v19.origin.x = x;
    v19.origin.y = y;
    v19.size.width = width;
    v19.size.height = height;
    v13 = CGRectGetWidth(v19) / 200.0;
    v20.origin.x = x;
    v20.origin.y = y;
    v20.size.width = width;
    v20.size.height = height;
    v14 = CGRectGetHeight(v20);
    CGContextScaleCTM(a4, v13, v14 / 100.0);
  }
  -[CRLGradientFill p_setAlpha:](self, "p_setAlpha:", a4, *(_OWORD *)&v15.a, *(_OWORD *)&v15.c, *(_OWORD *)&v15.tx);
  CGContextSetInterpolationQuality(a4, kCGInterpolationHigh);
  CGContextDrawShading(a4, v10);
  CGContextRestoreGState(a4);
}

- (void)paintPath:(CGPath *)a3 inContext:(CGContext *)a4
{
  CGRect BoundingBox;

  BoundingBox = CGPathGetBoundingBox(a3);
  -[CRLTransformGradientFill paintPath:naturalBounds:inContext:isPDF:](self, "paintPath:naturalBounds:inContext:isPDF:", a3, a4, 0, BoundingBox.origin.x, BoundingBox.origin.y, BoundingBox.size.width, BoundingBox.size.height);
}

- (void)paintPath:(CGPath *)a3 naturalBounds:(CGRect)a4 inContext:(CGContext *)a5 isPDF:(BOOL)a6
{
  double height;
  double width;
  CGFloat y;
  CGFloat x;
  CGSize size;
  CGContext *v15;
  CGPoint origin;
  CGSize v17;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  CGContextSaveGState(a5);
  CGContextAddPath(a5, a3);
  CGContextClip(a5);
  CGContextTranslateCTM(a5, x, y);
  if ((a6 || sub_100411FB8((uint64_t)a5)) && -[CRLGradientFill hasAlpha](self, "hasAlpha")
    || sub_100411DA0((uint64_t)a5))
  {
    size = CGRectZero.size;
    origin = CGRectZero.origin;
    v17 = size;
    v15 = -[CRLGradientFill p_beginBitmapWrapperContextInContext:returningIntegralBounds:](self, "p_beginBitmapWrapperContextInContext:returningIntegralBounds:", a5, &origin);
    if (v15)
      -[CRLTransformGradientFill p_drawQuartzShadingInContext:withGradientNaturalSize:baseNaturalSize:start:end:](self, "p_drawQuartzShadingInContext:withGradientNaturalSize:baseNaturalSize:start:end:", v15, width, height, self->mBaseNaturalSize.width, self->mBaseNaturalSize.height, self->mStart.x, self->mStart.y, self->mEnd.x, self->mEnd.y);
    -[CRLGradientFill p_endBitmapWrapperContext:inContext:withIntegralBounds:](self, "p_endBitmapWrapperContext:inContext:withIntegralBounds:", v15, a5, origin, v17);
  }
  else
  {
    -[CRLTransformGradientFill p_drawQuartzShadingInContext:withGradientNaturalSize:baseNaturalSize:start:end:](self, "p_drawQuartzShadingInContext:withGradientNaturalSize:baseNaturalSize:start:end:", a5, width, height, self->mBaseNaturalSize.width, self->mBaseNaturalSize.height, self->mStart.x, self->mStart.y, self->mEnd.x, self->mEnd.y);
  }
  CGContextRestoreGState(a5);
}

- (CGAffineTransform)transformForSize:(SEL)a3
{
  return CGAffineTransformMakeScale(retstr, a4.width / self->mBaseNaturalSize.width, a4.height / self->mBaseNaturalSize.height);
}

- (CGPoint)startPointForPath:(id)a3 andBounds:(CGRect)a4
{
  double v4;
  double v5;
  CGPoint result;

  -[CRLTransformGradientFill normalizedPointForSize:endPoint:](self, "normalizedPointForSize:endPoint:", 0, a4.size.width, a4.size.height);
  result.y = v5;
  result.x = v4;
  return result;
}

- (CGPoint)endPointForPath:(id)a3 andBounds:(CGRect)a4
{
  double v4;
  double v5;
  CGPoint result;

  -[CRLTransformGradientFill normalizedPointForSize:endPoint:](self, "normalizedPointForSize:endPoint:", 1, a4.size.width, a4.size.height);
  result.y = v5;
  result.x = v4;
  return result;
}

- (CGSize)baseNaturalSizeForBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  height = a3.size.height;
  width = a3.size.width;
  if (-[CRLGradientFill gradientType](self, "gradientType", a3.origin.x, a3.origin.y))
  {
    -[CRLTransformGradientFill baseNaturalSize](self, "baseNaturalSize");
    width = v6;
    height = v7;
  }
  v8 = width;
  v9 = height;
  result.height = v9;
  result.width = v8;
  return result;
}

- (double)gradientAngleInDegrees
{
  double v2;
  double result;

  v2 = sub_1000618B4(self->mEnd.x - self->mStart.x, self->mStart.y - self->mEnd.y);
  sub_1000618C4(v2 * 57.2957795);
  return result;
}

- (void)p_setDefaultValues
{
  CGPoint *p_mStart;
  double v4;
  double v5;
  double v6;
  double v7;
  CGFloat v8;

  p_mStart = &self->mStart;
  v4 = sub_1000630C4(50.0, 50.0);
  p_mStart->x = v4;
  p_mStart->y = v5;
  v6 = sub_1000603D0(v4, v5, 0.0);
  self->mEnd.x = sub_1000630C4(v6, v7);
  self->mEnd.y = v8;
  self->mBaseNaturalSize = (CGSize)vdupq_n_s64(0x4059000000000000uLL);
}

- (CGPoint)p_scalePoint:(CGPoint)a3 toShapeWithNaturalSize:(CGSize)a4
{
  double v4;
  double v5;
  CGPoint result;

  v4 = a3.x * a4.width / self->mBaseNaturalSize.width;
  v5 = a3.y * a4.height / self->mBaseNaturalSize.height;
  result.y = v5;
  result.x = v4;
  return result;
}

- (CGPoint)p_scalePoint:(CGPoint)a3 fromShapeWithNaturalSize:(CGSize)a4
{
  double v4;
  double v5;
  CGPoint result;

  v4 = a3.x * self->mBaseNaturalSize.width / a4.width;
  v5 = a3.y * self->mBaseNaturalSize.height / a4.height;
  result.y = v5;
  result.x = v4;
  return result;
}

- (void)p_drawQuartzShadingInContext:(CGContext *)a3 withGradientNaturalSize:(CGSize)a4 baseNaturalSize:(CGSize)a5 start:(CGPoint)a6 end:(CGPoint)a7
{
  double y;
  double x;
  CGFloat v9;
  CGFloat v10;
  double v13;
  long double v14;
  double v15;
  double v16;
  CGAffineTransform v17;

  y = a7.y;
  x = a7.x;
  v9 = a6.y;
  v10 = a6.x;
  if (self)
    -[CRLTransformGradientFill transformForSize:](self, "transformForSize:", a4.width, a4.height, a5.width, a5.height);
  else
    memset(&v17, 0, sizeof(v17));
  CGContextConcatCTM(a3, &v17);
  CGContextTranslateCTM(a3, v10, v9);
  v13 = sub_1000603B8(x, y, v10);
  v15 = sub_1000618B4(v13, v14);
  CGContextRotateCTM(a3, v15);
  v16 = sub_10006108C(v10, v9, x, y);
  CGContextScaleCTM(a3, v16 / 100.0, v16 / 100.0);
  -[CRLGradientFill p_setAlpha:](self, "p_setAlpha:", a3);
  CGContextSetInterpolationQuality(a3, kCGInterpolationHigh);
  CGContextDrawShading(a3, -[CRLGradientFill shadingRef](self, "shadingRef"));
}

- (CGPoint)startPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->mStart.x;
  y = self->mStart.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGPoint)endPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->mEnd.x;
  y = self->mEnd.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGSize)baseNaturalSize
{
  double width;
  double height;
  CGSize result;

  width = self->mBaseNaturalSize.width;
  height = self->mBaseNaturalSize.height;
  result.height = height;
  result.width = width;
  return result;
}

@end
