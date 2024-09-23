@implementation TSDTransformGradient

- (TSDTransformGradient)initWithStartColor:(id)a3 endColor:(id)a4 type:(unint64_t)a5
{
  TSDTransformGradient *v5;
  TSDTransformGradient *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TSDTransformGradient;
  v5 = -[TSDGradient initWithStartColor:endColor:type:](&v8, sel_initWithStartColor_endColor_type_, a3, a4, a5);
  v6 = v5;
  if (v5)
    -[TSDTransformGradient p_setDefaultValues](v5, "p_setDefaultValues");
  return v6;
}

- (TSDTransformGradient)initWithGradientStops:(id)a3 type:(unint64_t)a4
{
  TSDTransformGradient *v4;
  TSDTransformGradient *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TSDTransformGradient;
  v4 = -[TSDGradient initWithGradientStops:type:](&v7, sel_initWithGradientStops_type_, a3, a4);
  v5 = v4;
  if (v4)
    -[TSDTransformGradient p_setDefaultValues](v4, "p_setDefaultValues");
  return v5;
}

- (TSDTransformGradient)initWithGradient:(id)a3 inPath:(id)a4 andBounds:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  TSDTransformGradient *v11;
  void *v12;
  double v13;
  double v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  objc_super v20;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v20.receiver = self;
  v20.super_class = (Class)TSDTransformGradient;
  v11 = -[TSDGradient initWithGradientStops:type:](&v20, sel_initWithGradientStops_type_, objc_msgSend(a3, "gradientStops"), objc_msgSend(a3, "gradientType"));
  if (v11)
  {
    objc_opt_class();
    v12 = (void *)TSUDynamicCast();
    if (v12)
    {
      objc_msgSend(v12, "baseNaturalSizeForBounds:", x, y, width, height);
      width = v13;
      height = v14;
    }
    v11->mBaseNaturalSize.width = width;
    v11->mBaseNaturalSize.height = height;
    objc_msgSend(a3, "startPointForPath:andBounds:", a4, TSDRectWithSize());
    v11->mStart.x = v15;
    v11->mStart.y = v16;
    objc_msgSend(a3, "endPointForPath:andBounds:", a4, TSDRectWithSize());
    v11->mEnd.x = v17;
    v11->mEnd.y = v18;
  }
  return v11;
}

- (unint64_t)hash
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSDTransformGradient;
  -[TSDGradient hash](&v3, sel_hash);
  TSUHashWithSeed();
  TSUHashWithSeed();
  return TSUHashWithSeed();
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)TSDTransformGradient;
  -[TSDGradient dealloc](&v2, sel_dealloc);
}

- (id)description
{
  void *v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSString *v7;
  NSString *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = -[TSDGradient gradientType](self, "gradientType");
  -[TSDGradient opacity](self, "opacity");
  v6 = v5;
  v7 = NSStringFromCGPoint(self->mStart);
  v8 = NSStringFromCGPoint(self->mEnd);
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("TSDTransformGradient<%p>: type=%lu opacity=%f start=%@ end=%@ \n\tstops=%@ \n\tbase size=%@"), self, v4, v6, v7, v8, -[TSDGradient gradientStops](self, "gradientStops"), NSStringFromCGSize(self->mBaseNaturalSize));
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  void *v8;
  double v9;
  double v10;
  BOOL v11;
  double v12;
  double v13;
  BOOL v14;
  CGSize *p_mBaseNaturalSize;
  double v16;
  double v17;
  objc_super v19;
  uint64_t v20;
  uint64_t v21;

  if (a3 == self)
  {
    LOBYTE(v7) = 1;
  }
  else
  {
    v20 = v3;
    v21 = v4;
    objc_opt_class();
    v7 = TSUDynamicCast();
    if (v7)
    {
      v8 = (void *)v7;
      v19.receiver = self;
      v19.super_class = (Class)TSDTransformGradient;
      LODWORD(v7) = -[TSDGradient isEqual:](&v19, sel_isEqual_, a3);
      if ((_DWORD)v7)
      {
        objc_msgSend(v8, "startPoint");
        v11 = self->mStart.x == v10 && self->mStart.y == v9;
        if (v11 && ((objc_msgSend(v8, "endPoint"), self->mEnd.x == v13) ? (v14 = self->mEnd.y == v12) : (v14 = 0), v14))
        {
          p_mBaseNaturalSize = &self->mBaseNaturalSize;
          objc_msgSend(v8, "baseNaturalSize");
          LOBYTE(v7) = p_mBaseNaturalSize->height == v17 && p_mBaseNaturalSize->width == v16;
        }
        else
        {
          LOBYTE(v7) = 0;
        }
      }
    }
  }
  return v7;
}

- (BOOL)isEqualIgnoringTransform:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  void *v8;
  CGSize *p_mBaseNaturalSize;
  double v10;
  double v11;
  objc_super v13;
  uint64_t v14;
  uint64_t v15;

  if (a3 == self)
  {
    LOBYTE(v7) = 1;
  }
  else
  {
    v14 = v3;
    v15 = v4;
    objc_opt_class();
    v7 = TSUDynamicCast();
    if (v7)
    {
      v8 = (void *)v7;
      v13.receiver = self;
      v13.super_class = (Class)TSDTransformGradient;
      LODWORD(v7) = -[TSDGradient isEqual:](&v13, sel_isEqual_, a3);
      if ((_DWORD)v7)
      {
        p_mBaseNaturalSize = &self->mBaseNaturalSize;
        objc_msgSend(v8, "baseNaturalSize");
        LOBYTE(v7) = p_mBaseNaturalSize->height == v11 && p_mBaseNaturalSize->width == v10;
      }
    }
  }
  return v7;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  TSDMutableTransformGradient *v4;
  NSArray *v5;
  unint64_t v6;
  TSDMutableTransformGradient *v7;

  v4 = +[TSDMutableTransformGradient allocWithZone:](TSDMutableTransformGradient, "allocWithZone:", a3);
  v5 = -[TSDGradient gradientStops](self, "gradientStops");
  v6 = -[TSDGradient gradientType](self, "gradientType");
  -[TSDGradient opacity](self, "opacity");
  v7 = -[TSDGradient initWithGradientStops:type:opacity:](v4, "initWithGradientStops:type:opacity:", v5, v6);
  -[TSDGradient setIsAdvancedGradient:](v7, "setIsAdvancedGradient:", self->super.mIsAdvancedGradient);
  -[TSDTransformGradient startPoint](self, "startPoint");
  -[TSDTransformGradient setStartPoint:](v7, "setStartPoint:");
  -[TSDTransformGradient endPoint](self, "endPoint");
  -[TSDTransformGradient setEndPoint:](v7, "setEndPoint:");
  -[TSDTransformGradient baseNaturalSize](self, "baseNaturalSize");
  -[TSDTransformGradient setBaseNaturalSize:](v7, "setBaseNaturalSize:");
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
  -[TSDTransformGradient startPoint](self, "startPoint");
  v46 = v9;
  v47 = v8;
  -[TSDTransformGradient endPoint](self, "endPoint");
  v50 = v11;
  v51 = v10;
  if (-[TSDGradient gradientType](self, "gradientType"))
  {
    if (self)
    {
      -[TSDTransformGradient transformForSize:](self, "transformForSize:", width, height);
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
      -[TSDTransformGradient transformForSize:](self, "transformForSize:", width, height);
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
      -[TSDTransformGradient transformForSize:](self, "transformForSize:", width, height);
      v15 = 0uLL;
    }
    *(_OWORD *)&v59.c = v15;
    *(_OWORD *)&v59.tx = v15;
    *(_OWORD *)&v59.a = v15;
    v58 = v60;
    CGAffineTransformInvert(&v59, &v58);
    v16 = TSDSubtractPoints(v51, v50, v47);
    v58 = v59;
    v18 = TSDDeltaApplyAffineTransform((float64x2_t *)&v58, v16, v17);
    v19 = v60.tx + v46 * v60.c + v60.a * v47;
    v20 = v60.ty + v46 * v60.d + v60.b * v47;
    v21 = v60.tx + v50 * v60.c + v60.a * v51;
    v22 = v60.ty + v50 * v60.d + v60.b * v51;
    v24 = TSDNormalizePoint(v18, v23);
    v26 = v25;
    v27 = TSDSubtractPoints(v21, v22, v19);
    v29 = TSDDotPoints(v24, v26, v27, v28);
    v30 = TSDMultiplyPointScalar(v24, v26, v29);
    v32 = v31;
    v33 = TSDMixPoints(v19, v20, v21, v22, 0.5);
    v35 = v34;
    v36 = TSDMultiplyPointScalar(v30, v32, -0.5);
    v48 = TSDAddPoints(v33, v35, v36);
    v38 = v37;
    v39 = TSDMultiplyPointScalar(v30, v32, 0.5);
    v40.f64[0] = TSDAddPoints(v33, v35, v39);
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

- (void)setBaseNaturalSize:(CGSize)a3
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
  v10 = -[TSDGradient shadingRef](self, "shadingRef");
  CGContextSaveGState(a4);
  v16.origin.x = x;
  v16.origin.y = y;
  v16.size.width = width;
  v16.size.height = height;
  CGContextClipToRect(a4, v16);
  if (-[TSDGradient gradientType](self, "gradientType"))
  {
    if (self)
      -[TSDGradient centeredRadialTransformInRect:](self, "centeredRadialTransformInRect:", x, y, width, height);
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
  -[TSDGradient p_setAlpha:](self, "p_setAlpha:", a4, *(_OWORD *)&v15.a, *(_OWORD *)&v15.c, *(_OWORD *)&v15.tx);
  CGContextSetInterpolationQuality(a4, kCGInterpolationHigh);
  CGContextDrawShading(a4, v10);
  CGContextRestoreGState(a4);
}

- (void)paintPath:(CGPath *)a3 inContext:(CGContext *)a4
{
  CGRect BoundingBox;

  BoundingBox = CGPathGetBoundingBox(a3);
  -[TSDTransformGradient paintPath:naturalBounds:inContext:isPDF:](self, "paintPath:naturalBounds:inContext:isPDF:", a3, a4, 0, BoundingBox.origin.x, BoundingBox.origin.y, BoundingBox.size.width, BoundingBox.size.height);
}

- (void)paintPath:(CGPath *)a3 naturalBounds:(CGRect)a4 inContext:(CGContext *)a5 isPDF:(BOOL)a6
{
  double height;
  double width;
  CGFloat y;
  CGFloat x;
  __int128 v14;
  CGContext *v15;
  __int128 v16;
  __int128 v17;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  CGContextSaveGState(a5);
  CGContextAddPath(a5, a3);
  CGContextClip(a5);
  CGContextTranslateCTM(a5, x, y);
  if ((a6 || TSDCGContextIsPDFContext((uint64_t)a5)) && -[TSDGradient hasAlpha](self, "hasAlpha")
    || TSDCGContextIsPrintContext((uint64_t)a5))
  {
    v14 = *(_OWORD *)(MEMORY[0x24BDBF090] + 16);
    v16 = *MEMORY[0x24BDBF090];
    v17 = v14;
    v15 = -[TSDGradient p_beginBitmapWrapperContextInContext:returningIntegralBounds:](self, "p_beginBitmapWrapperContextInContext:returningIntegralBounds:", a5, &v16);
    if (v15)
      -[TSDTransformGradient p_drawQuartzShadingInContext:withGradientNaturalSize:baseNaturalSize:start:end:](self, "p_drawQuartzShadingInContext:withGradientNaturalSize:baseNaturalSize:start:end:", v15, width, height, self->mBaseNaturalSize.width, self->mBaseNaturalSize.height, self->mStart.x, self->mStart.y, self->mEnd.x, self->mEnd.y);
    -[TSDGradient p_endBitmapWrapperContext:inContext:withIntegralBounds:](self, "p_endBitmapWrapperContext:inContext:withIntegralBounds:", v15, a5, v16, v17);
  }
  else
  {
    -[TSDTransformGradient p_drawQuartzShadingInContext:withGradientNaturalSize:baseNaturalSize:start:end:](self, "p_drawQuartzShadingInContext:withGradientNaturalSize:baseNaturalSize:start:end:", a5, width, height, self->mBaseNaturalSize.width, self->mBaseNaturalSize.height, self->mStart.x, self->mStart.y, self->mEnd.x, self->mEnd.y);
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

  -[TSDTransformGradient normalizedPointForSize:endPoint:](self, "normalizedPointForSize:endPoint:", 0, a4.size.width, a4.size.height);
  result.y = v5;
  result.x = v4;
  return result;
}

- (CGPoint)endPointForPath:(id)a3 andBounds:(CGRect)a4
{
  double v4;
  double v5;
  CGPoint result;

  -[TSDTransformGradient normalizedPointForSize:endPoint:](self, "normalizedPointForSize:endPoint:", 1, a4.size.width, a4.size.height);
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
  if (-[TSDGradient gradientType](self, "gradientType", a3.origin.x, a3.origin.y))
  {
    -[TSDTransformGradient baseNaturalSize](self, "baseNaturalSize");
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

  v2 = TSDAngleFromDelta(self->mEnd.x - self->mStart.x, self->mStart.y - self->mEnd.y);
  TSDNormalizeAngleInDegrees(v2 * 57.2957795);
  return result;
}

- (int64_t)mixingTypeWithObject:(id)a3
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __45__TSDTransformGradient_mixingTypeWithObject___block_invoke;
  v4[3] = &unk_24D82B868;
  v4[4] = a3;
  v4[5] = self;
  return TSDMixingTypeWithObject((unint64_t)self, (unint64_t)a3, (uint64_t)v4);
}

uint64_t __45__TSDTransformGradient_mixingTypeWithObject___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  BOOL v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;

  objc_opt_class();
  v2 = (void *)TSUDynamicCast();
  if (!v2)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDTransformGradient mixingTypeWithObject:]_block_invoke");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGradient.m"), 1588, CFSTR("nil object after cast"));
  }
  v5 = objc_msgSend(*(id *)(a1 + 40), "gradientType");
  if (v5 != objc_msgSend(v2, "gradientType"))
    return 1;
  v6 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "gradientStops"), "count");
  if (v6 != objc_msgSend((id)objc_msgSend(v2, "gradientStops"), "count"))
    return 2;
  objc_msgSend(*(id *)(a1 + 40), "startPoint");
  v8 = v7;
  v10 = v9;
  objc_msgSend(v2, "startPoint");
  if (v8 != v12 || v10 != v11)
    return 3;
  objc_msgSend(*(id *)(a1 + 40), "endPoint");
  v15 = v14;
  v17 = v16;
  objc_msgSend(v2, "endPoint");
  v20 = v15 == v19 && v17 == v18;
  if (v20
    && (objc_msgSend(*(id *)(a1 + 40), "baseNaturalSize"),
        v22 = v21,
        v24 = v23,
        objc_msgSend(v2, "baseNaturalSize"),
        v22 == v26)
    && v24 == v25)
  {
    return 4;
  }
  else
  {
    return 3;
  }
}

- (id)mixedObjectWithFraction:(double)a3 ofObject:(id)a4
{
  _QWORD v5[7];

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __57__TSDTransformGradient_mixedObjectWithFraction_ofObject___block_invoke;
  v5[3] = &unk_24D82B890;
  v5[4] = a4;
  v5[5] = self;
  *(double *)&v5[6] = a3;
  return (id)TSDMixingMixedObjectWithFraction(self, a4, (uint64_t)v5);
}

TSDMutableTransformGradient *__57__TSDTransformGradient_mixedObjectWithFraction_ofObject___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  unint64_t v4;
  TSDMutableTransformGradient *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
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

  objc_opt_class();
  v2 = (void *)TSUDynamicCast();
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "gradientStops"), "count"));
  if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "gradientStops"), "count"))
  {
    v4 = 0;
    do
    {
      objc_msgSend(v3, "addObject:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "gradientStops"), "objectAtIndex:", v4), "mixedObjectWithFraction:ofObject:", objc_msgSend((id)objc_msgSend(v2, "gradientStops"), "objectAtIndex:", v4), *(double *)(a1 + 48)));
      ++v4;
    }
    while (v4 < objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "gradientStops"), "count"));
  }
  v5 = -[TSDTransformGradient initWithGradientStops:type:]([TSDMutableTransformGradient alloc], "initWithGradientStops:type:", v3, objc_msgSend(*(id *)(a1 + 40), "gradientType"));
  objc_msgSend(*(id *)(a1 + 40), "opacity");
  v7 = v6;
  objc_msgSend(v2, "opacity");
  -[TSDGradient setOpacity:](v5, "setOpacity:", TSDMixFloats(v7, v8, *(double *)(a1 + 48)));
  objc_msgSend(*(id *)(a1 + 40), "startPoint");
  v10 = v9;
  v12 = v11;
  objc_msgSend(v2, "startPoint");
  -[TSDTransformGradient setStartPoint:](v5, "setStartPoint:", TSDMixPoints(v10, v12, v13, v14, *(double *)(a1 + 48)));
  objc_msgSend(*(id *)(a1 + 40), "endPoint");
  v16 = v15;
  v18 = v17;
  objc_msgSend(v2, "endPoint");
  -[TSDTransformGradient setEndPoint:](v5, "setEndPoint:", TSDMixPoints(v16, v18, v19, v20, *(double *)(a1 + 48)));
  objc_msgSend(*(id *)(a1 + 40), "baseNaturalSize");
  v22 = v21;
  v24 = v23;
  objc_msgSend(v2, "baseNaturalSize");
  -[TSDTransformGradient setBaseNaturalSize:](v5, "setBaseNaturalSize:", TSDMixSizes(v22, v24, v25, v26, *(double *)(a1 + 48)));
  return v5;
}

- (void)p_setDefaultValues
{
  CGPoint *p_mStart;
  double v4;
  double v5;
  CGFloat v6;

  p_mStart = &self->mStart;
  v4 = TSDRoundedPoint();
  p_mStart->x = v4;
  p_mStart->y = v5;
  TSDAddPoints(v4, v5, 0.0);
  self->mEnd.x = TSDRoundedPoint();
  self->mEnd.y = v6;
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
    -[TSDTransformGradient transformForSize:](self, "transformForSize:", a4.width, a4.height, a5.width, a5.height);
  else
    memset(&v17, 0, sizeof(v17));
  CGContextConcatCTM(a3, &v17);
  CGContextTranslateCTM(a3, v10, v9);
  v13 = TSDSubtractPoints(x, y, v10);
  v15 = TSDAngleFromDelta(v13, v14);
  CGContextRotateCTM(a3, v15);
  v16 = TSDDistance(v10, v9, x, y);
  CGContextScaleCTM(a3, v16 / 100.0, v16 / 100.0);
  -[TSDGradient p_setAlpha:](self, "p_setAlpha:", a3);
  CGContextSetInterpolationQuality(a3, kCGInterpolationHigh);
  CGContextDrawShading(a3, -[TSDGradient shadingRef](self, "shadingRef"));
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

- (void)setStartPoint:(CGPoint)a3
{
  self->mStart = a3;
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

- (void)setEndPoint:(CGPoint)a3
{
  self->mEnd = a3;
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
