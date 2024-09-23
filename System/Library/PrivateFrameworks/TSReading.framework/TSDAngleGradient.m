@implementation TSDAngleGradient

- (void)setFirstColor:(id)a3
{
  -[TSDAngleGradient setColorOfStopAtIndex:toColor:](self, "setColorOfStopAtIndex:toColor:", 0, a3);
}

- (void)setLastColor:(id)a3
{
  -[TSDAngleGradient setColorOfStopAtIndex:toColor:](self, "setColorOfStopAtIndex:toColor:", -[NSArray count](-[TSDGradient gradientStops](self, "gradientStops"), "count") - 1, a3);
}

- (TSDAngleGradient)initWithGradientStops:(id)a3 type:(unint64_t)a4 opacity:(double)a5 angle:(double)a6
{
  TSDAngleGradient *result;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TSDAngleGradient;
  result = -[TSDGradient initWithGradientStops:type:opacity:](&v8, sel_initWithGradientStops_type_opacity_, a3, a4, a5);
  if (result)
    result->mAngle = a6;
  return result;
}

- (TSDAngleGradient)initWithStartColor:(id)a3 endColor:(id)a4 type:(unint64_t)a5 angle:(double)a6
{
  TSDAngleGradient *result;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TSDAngleGradient;
  result = -[TSDGradient initWithStartColor:endColor:type:](&v8, sel_initWithStartColor_endColor_type_, a3, a4, a5);
  if (result)
    result->mAngle = a6;
  return result;
}

- (id)description
{
  void *v3;
  unint64_t v4;
  uint64_t v5;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = -[TSDGradient gradientType](self, "gradientType");
  -[TSDGradient opacity](self, "opacity");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("TSDAngleGradient<%p>: type=%lu opacity=%f angle=%f \n\tstops=%@"), self, v4, v5, *(_QWORD *)&self->mAngle, -[TSDGradient gradientStops](self, "gradientStops"));
}

- (unint64_t)hash
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSDAngleGradient;
  -[TSDGradient hash](&v3, sel_hash);
  return TSUHashWithSeed();
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  void *v8;
  double v9;
  objc_super v11;
  uint64_t v12;
  uint64_t v13;

  if (a3 == self)
  {
    LOBYTE(v7) = 1;
  }
  else
  {
    v12 = v3;
    v13 = v4;
    objc_opt_class();
    v7 = TSUDynamicCast();
    if (v7)
    {
      v8 = (void *)v7;
      v11.receiver = self;
      v11.super_class = (Class)TSDAngleGradient;
      LODWORD(v7) = -[TSDGradient isEqual:](&v11, sel_isEqual_, a3);
      if ((_DWORD)v7)
      {
        objc_msgSend(v8, "gradientAngle");
        LOBYTE(v7) = v9 == self->mAngle;
      }
    }
  }
  return v7;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  TSDMutableAngleGradient *v4;
  NSArray *v5;
  unint64_t v6;
  double v7;
  double v8;
  double v9;
  TSDMutableAngleGradient *v10;

  v4 = +[TSDMutableAngleGradient allocWithZone:](TSDMutableAngleGradient, "allocWithZone:", a3);
  v5 = -[TSDGradient gradientStops](self, "gradientStops");
  v6 = -[TSDGradient gradientType](self, "gradientType");
  -[TSDGradient opacity](self, "opacity");
  v8 = v7;
  -[TSDAngleGradient gradientAngle](self, "gradientAngle");
  v10 = -[TSDAngleGradient initWithGradientStops:type:opacity:angle:](v4, "initWithGradientStops:type:opacity:angle:", v5, v6, v8, v9);
  -[TSDGradient setIsAdvancedGradient:](v10, "setIsAdvancedGradient:", self->super.mIsAdvancedGradient);
  return v10;
}

- (double)gradientAngleInDegrees
{
  return self->mAngle * 57.2957795;
}

- (double)p_bestGradientLengthForRect:(CGRect)a3 atAngle:(double)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v8;
  double v9;
  double v10;
  __int128 v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v18;
  double v19;
  CGAffineTransform v20;
  CGAffineTransform v21;
  CGAffineTransform v22;
  CGRect v23;
  CGRect v24;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = CGRectGetWidth(a3) * 0.5;
  v23.origin.x = x;
  v23.origin.y = y;
  v23.size.width = width;
  v23.size.height = height;
  v9 = CGRectGetHeight(v23) * 0.5;
  v18 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  v19 = *MEMORY[0x24BDBEFB0];
  v24.origin.x = x;
  v24.origin.y = y;
  v24.size.width = width;
  v24.size.height = height;
  v10 = CGRectGetWidth(v24);
  memset(&v22, 0, sizeof(v22));
  v11 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  *(_OWORD *)&v21.a = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&v21.c = v11;
  *(_OWORD *)&v21.tx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  CGAffineTransformTranslate(&v22, &v21, v8, v9);
  v20 = v22;
  CGAffineTransformRotate(&v21, &v20, -a4);
  v22 = v21;
  v20 = v21;
  CGAffineTransformTranslate(&v21, &v20, -v8, -v9);
  v22 = v21;
  v12 = v21.tx + v18 * v21.c + v21.a * v19;
  v13 = v21.ty + v18 * v21.d + v21.b * v19;
  if (v13 != v9)
  {
    v14 = v21.ty + v21.d * 0.0 + v21.b * v10;
    if (v14 == v9)
    {
      v12 = v21.tx + v21.c * 0.0 + v21.a * v10;
      v13 = v21.ty + v21.d * 0.0 + v21.b * v10;
    }
    else
    {
      if (vabdd_f64(v13, v9) >= vabdd_f64(v14, v9))
        v15 = v21.tx + v21.c * 0.0 + v21.a * v10;
      else
        v15 = v21.tx + v18 * v21.c + v21.a * v19;
      v12 = v8;
      v13 = v9;
      v8 = v15;
    }
  }
  return TSDDistance(v12, v13, v8, v9);
}

- (CGPoint)startPointForPath:(id)a3 andBounds:(CGRect)a4
{
  float64x2_t v5;
  float64x2_t v6;
  float64x2_t v7;
  float64x2_t v8;
  double v9;
  CGPoint result;

  objc_msgSend(a3, "bounds", a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  if (self)
  {
    -[TSDAngleGradient p_shadingTransformForBounds:](self, "p_shadingTransformForBounds:");
    v5 = 0u;
    v6 = 0u;
    v7 = 0u;
  }
  else
  {
    v7 = 0uLL;
    v5 = 0uLL;
    v6 = 0uLL;
  }
  v8 = vaddq_f64(v7, vmlaq_n_f64(vmulq_n_f64(v6, *(double *)(MEMORY[0x24BDBEFB0] + 8)), v5, *MEMORY[0x24BDBEFB0]));
  v9 = v8.f64[1];
  result.x = v8.f64[0];
  result.y = v9;
  return result;
}

- (CGPoint)endPointForPath:(id)a3 andBounds:(CGRect)a4
{
  float64x2_t v5;
  float64x2_t v6;
  float64x2_t v7;
  float64x2_t v8;
  double v9;
  CGPoint result;

  objc_msgSend(a3, "bounds", a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  if (self)
  {
    -[TSDAngleGradient p_shadingTransformForBounds:](self, "p_shadingTransformForBounds:");
    v5 = 0u;
    v6 = 0u;
    v7 = vmulq_f64((float64x2_t)0, (float64x2_t)0);
  }
  else
  {
    v6 = 0uLL;
    v5 = 0uLL;
    v7 = 0uLL;
  }
  v8 = vaddq_f64(v6, vmlaq_f64(v7, (float64x2_t)vdupq_n_s64(0x4059000000000000uLL), v5));
  v9 = v8.f64[1];
  result.x = v8.f64[0];
  result.y = v9;
  return result;
}

- (void)paintRect:(CGRect)a3 inContext:(CGContext *)a4 atAngle:(double)a5
{
  double height;
  double width;
  double y;
  double x;
  CGShading *v12;
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
  CGFloat v23;
  double v24;
  CGAffineTransform v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGRect v30;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v12 = -[TSDGradient shadingRef](self, "shadingRef");
  CGContextSaveGState(a4);
  v30.origin.x = x;
  v30.origin.y = y;
  v30.size.width = width;
  v30.size.height = height;
  CGContextClipToRect(a4, v30);
  if (-[TSDGradient gradientType](self, "gradientType"))
  {
    if (self)
      -[TSDGradient centeredRadialTransformInRect:](self, "centeredRadialTransformInRect:", x, y, width, height);
    else
      memset(&v25, 0, sizeof(v25));
    CGContextConcatCTM(a4, &v25);
  }
  else
  {
    -[TSDAngleGradient p_bestGradientLengthForRect:atAngle:](self, "p_bestGradientLengthForRect:atAngle:", x, y, width, height, -a5);
    v14 = v13;
    v28 = 0.0;
    v29 = 0.0;
    v26 = 0.0;
    v27 = 0.0;
    TSDOriginRotate(&v26, v13, -a5);
    TSDOriginRotate(&v28, v14, 3.14159265 - a5);
    v15 = TSDCenterOfRect(x, y, width, height);
    v17 = v16;
    v18 = TSDAddPoints(v15, v16, v26);
    v20 = v19;
    v26 = v18;
    v27 = v19;
    v21 = TSDAddPoints(v15, v17, v28);
    v23 = v22;
    v28 = v21;
    v29 = v22;
    v24 = TSDDistance(v21, v22, v18, v20);
    CGContextTranslateCTM(a4, v21, v23);
    CGContextRotateCTM(a4, -a5);
    CGContextScaleCTM(a4, v24 / 100.0, v24 / 100.0);
  }
  -[TSDGradient p_setAlpha:](self, "p_setAlpha:", a4, *(_OWORD *)&v25.a, *(_OWORD *)&v25.c, *(_OWORD *)&v25.tx);
  CGContextSetInterpolationQuality(a4, kCGInterpolationHigh);
  CGContextDrawShading(a4, v12);
  CGContextRestoreGState(a4);
}

- (void)paintRect:(CGRect)a3 inContext:(CGContext *)a4
{
  -[TSDAngleGradient paintRect:inContext:atAngle:](self, "paintRect:inContext:atAngle:", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, self->mAngle);
}

- (void)paintPath:(CGPath *)a3 naturalBounds:(CGRect)a4 inContext:(CGContext *)a5 isPDF:(BOOL)a6
{
  __int128 v10;
  CGContext *v11;
  __int128 v12;
  __int128 v13;

  CGContextSaveGState(a5);
  CGContextAddPath(a5, a3);
  CGContextClip(a5);
  if ((a6 || TSDCGContextIsPDFContext((uint64_t)a5)) && -[TSDGradient hasAlpha](self, "hasAlpha")
    || TSDCGContextIsPrintContext((uint64_t)a5))
  {
    v10 = *(_OWORD *)(MEMORY[0x24BDBF090] + 16);
    v12 = *MEMORY[0x24BDBF090];
    v13 = v10;
    v11 = -[TSDGradient p_beginBitmapWrapperContextInContext:returningIntegralBounds:](self, "p_beginBitmapWrapperContextInContext:returningIntegralBounds:", a5, &v12);
    if (v11)
      -[TSDAngleGradient p_paintPath:inContext:](self, "p_paintPath:inContext:", a3, v11);
    -[TSDGradient p_endBitmapWrapperContext:inContext:withIntegralBounds:](self, "p_endBitmapWrapperContext:inContext:withIntegralBounds:", v11, a5, v12, v13);
  }
  else
  {
    -[TSDAngleGradient p_paintPath:inContext:](self, "p_paintPath:inContext:", a3, a5);
  }
  CGContextRestoreGState(a5);
}

- (void)paintPath:(CGPath *)a3 inContext:(CGContext *)a4
{
  -[TSDAngleGradient paintPath:naturalBounds:inContext:isPDF:](self, "paintPath:naturalBounds:inContext:isPDF:", a3, a4, 0, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
}

- (CGAffineTransform)p_shadingTransformForBounds:(SEL)a3
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  uint64_t v10;
  unint64_t mType;
  CGFloat MidX;
  double MidY;
  double MaxX;
  double MaxY;
  __int128 v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGFloat v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  CGAffineTransform *result;
  double mAngle;
  __int128 v27;
  __int128 v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  CGFloat v45;
  __int128 v46;
  __int128 v47;
  CGFloat v48;
  __int128 v49;
  __int128 v50;
  CGFloat v51;
  CGFloat v52;
  CGFloat v53;
  CGFloat v54;
  CGFloat v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  CGAffineTransform t2;
  CGAffineTransform v64;
  CGAffineTransform t1;
  CGAffineTransform v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;

  v67 = CGRectInset(a4, -1.0, -1.0);
  x = v67.origin.x;
  y = v67.origin.y;
  width = v67.size.width;
  height = v67.size.height;
  v10 = MEMORY[0x24BDBD8B8];
  v61 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v62 = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&retstr->a = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&retstr->c = v61;
  v60 = *(_OWORD *)(v10 + 32);
  *(_OWORD *)&retstr->tx = v60;
  mType = self->super.mType;
  MidX = CGRectGetMidX(v67);
  v68.origin.x = x;
  v68.origin.y = y;
  v68.size.width = width;
  v68.size.height = height;
  MidY = CGRectGetMidY(v68);
  if (mType)
  {
    v69.origin.x = x;
    v69.origin.y = y;
    v69.size.width = width;
    v69.size.height = height;
    MaxX = CGRectGetMaxX(v69);
    v70.origin.x = x;
    v70.origin.y = y;
    v70.size.width = width;
    v70.size.height = height;
    MaxY = CGRectGetMaxY(v70);
    TSDTransformMakeFree(0, (uint64_t)&v66, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8), 100.0, 0.0, MidX, MidY, MaxX, MaxY);
    v16 = *(_OWORD *)&v66.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v66.a;
    *(_OWORD *)&retstr->c = v16;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v66.tx;
    v17 = TSDMixPoints(MidX, MidY, MaxX, MaxY, 0.5);
    v19 = v18;
    memset(&v66, 0, sizeof(v66));
    CGAffineTransformMakeRotation(&v66, 5.49778714 - self->mAngle);
    v20 = TSDMultiplyPointScalar(v17, v19, -1.0);
    t2 = v66;
    TSDTransformConvertForNewOrigin(&t2, &t1, v20, v21);
    v22 = *(_OWORD *)&t1.c;
    v66 = t1;
    v23 = *(_OWORD *)&t1.a;
    v24 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&t1.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&t1.c = v24;
    *(_OWORD *)&t1.tx = *(_OWORD *)&retstr->tx;
    *(_OWORD *)&t2.a = v23;
    *(_OWORD *)&t2.c = v22;
    *(_OWORD *)&t2.tx = *(_OWORD *)&v66.tx;
    return CGAffineTransformConcat(retstr, &t1, &t2);
  }
  else
  {
    *(_OWORD *)&v66.a = v62;
    *(_OWORD *)&v66.c = v61;
    *(_OWORD *)&v66.tx = v60;
    CGAffineTransformTranslate(retstr, &v66, MidX, MidY);
    mAngle = self->mAngle;
    v27 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&t1.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&t1.c = v27;
    *(_OWORD *)&t1.tx = *(_OWORD *)&retstr->tx;
    CGAffineTransformRotate(&v66, &t1, mAngle);
    v28 = *(_OWORD *)&v66.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v66.a;
    *(_OWORD *)&retstr->c = v28;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v66.tx;
    v29 = x;
    *(CGFloat *)&v28 = y;
    v30 = width;
    v31 = height;
    v32 = -CGRectGetMidX(*(CGRect *)((char *)&v28 - 8));
    v71.origin.x = x;
    v71.origin.y = y;
    v71.size.width = width;
    v71.size.height = height;
    v33 = CGRectGetMidY(v71);
    v34 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&t1.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&t1.c = v34;
    *(_OWORD *)&t1.tx = *(_OWORD *)&retstr->tx;
    CGAffineTransformTranslate(&v66, &t1, v32, -v33);
    v35 = *(_OWORD *)&v66.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v66.a;
    *(_OWORD *)&retstr->c = v35;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v66.tx;
    v36 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v66.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v66.c = v36;
    *(_OWORD *)&v66.tx = *(_OWORD *)&retstr->tx;
    v37 = x;
    *(CGFloat *)&v36 = y;
    v38 = width;
    v39 = height;
    v72 = CGRectApplyAffineTransform(*(CGRect *)((char *)&v36 - 8), &v66);
    v40 = v72.origin.x;
    v41 = v72.origin.y;
    v42 = v72.size.width;
    v43 = v72.size.height;
    *(_OWORD *)&retstr->a = v62;
    *(_OWORD *)&retstr->c = v61;
    *(_OWORD *)&retstr->tx = v60;
    v44 = CGRectGetMidX(v72);
    v73.origin.x = v40;
    v73.origin.y = v41;
    v73.size.width = v42;
    v73.size.height = v43;
    v45 = CGRectGetMidY(v73);
    v46 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&t1.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&t1.c = v46;
    *(_OWORD *)&t1.tx = *(_OWORD *)&retstr->tx;
    CGAffineTransformTranslate(&v66, &t1, v44, v45);
    v47 = *(_OWORD *)&v66.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v66.a;
    *(_OWORD *)&retstr->c = v47;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v66.tx;
    v48 = -self->mAngle;
    v49 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&t1.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&t1.c = v49;
    *(_OWORD *)&t1.tx = *(_OWORD *)&retstr->tx;
    CGAffineTransformRotate(&v66, &t1, v48);
    v50 = *(_OWORD *)&v66.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v66.a;
    *(_OWORD *)&retstr->c = v50;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v66.tx;
    v51 = v40;
    *(CGFloat *)&v50 = v41;
    v52 = v42;
    v53 = v43;
    v54 = CGRectGetWidth(*(CGRect *)((char *)&v50 - 8)) / 100.0;
    v74.origin.x = v40;
    v74.origin.y = v41;
    v74.size.width = v42;
    v74.size.height = v43;
    v55 = CGRectGetHeight(v74);
    v56 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&t1.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&t1.c = v56;
    *(_OWORD *)&t1.tx = *(_OWORD *)&retstr->tx;
    CGAffineTransformScale(&v66, &t1, v54, v55 / 100.0);
    v57 = *(_OWORD *)&v66.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v66.a;
    *(_OWORD *)&retstr->c = v57;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v66.tx;
    CGAffineTransformMakeTranslation(&v64, -50.0, 0.0);
    v58 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&t1.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&t1.c = v58;
    *(_OWORD *)&t1.tx = *(_OWORD *)&retstr->tx;
    result = CGAffineTransformConcat(&v66, &v64, &t1);
    v59 = *(_OWORD *)&v66.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v66.a;
    *(_OWORD *)&retstr->c = v59;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v66.tx;
  }
  return result;
}

- (void)p_paintPath:(CGPath *)a3 inContext:(CGContext *)a4
{
  CGShading *v6;
  CGAffineTransform v7;
  CGAffineTransform v8;
  CGRect PathBoundingBox;

  memset(&v8, 0, sizeof(v8));
  PathBoundingBox = CGPathGetPathBoundingBox(a3);
  if (self)
    -[TSDAngleGradient p_shadingTransformForBounds:](self, "p_shadingTransformForBounds:", PathBoundingBox.origin.x, PathBoundingBox.origin.y, PathBoundingBox.size.width, PathBoundingBox.size.height);
  else
    memset(&v8, 0, sizeof(v8));
  v7 = v8;
  CGContextConcatCTM(a4, &v7);
  CGContextSetInterpolationQuality(a4, kCGInterpolationHigh);
  v6 = -[TSDGradient shadingRef](self, "shadingRef");
  CGShadingRetain(v6);
  -[TSDGradient p_setAlpha:](self, "p_setAlpha:", a4);
  CGContextDrawShading(a4, v6);
  CGShadingRelease(v6);
}

- (int64_t)mixingTypeWithObject:(id)a3
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __41__TSDAngleGradient_mixingTypeWithObject___block_invoke;
  v4[3] = &unk_24D82B868;
  v4[4] = a3;
  v4[5] = self;
  return TSDMixingTypeWithObject((unint64_t)self, (unint64_t)a3, (uint64_t)v4);
}

uint64_t __41__TSDAngleGradient_mixingTypeWithObject___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;

  objc_opt_class();
  v2 = (void *)TSUDynamicCast();
  if (!v2)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDAngleGradient mixingTypeWithObject:]_block_invoke");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGradient.m"), 1216, CFSTR("nil object after cast"));
  }
  v5 = objc_msgSend(*(id *)(a1 + 40), "gradientType");
  if (v5 != objc_msgSend(v2, "gradientType"))
    return 1;
  v6 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "gradientStops"), "count");
  if (v6 != objc_msgSend((id)objc_msgSend(v2, "gradientStops"), "count"))
    return 2;
  objc_msgSend(*(id *)(a1 + 40), "gradientAngle");
  v8 = v7;
  objc_msgSend(v2, "gradientAngle");
  if (v8 == v9)
    return 4;
  else
    return 3;
}

- (id)mixedObjectWithFraction:(double)a3 ofObject:(id)a4
{
  _QWORD v5[7];

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __53__TSDAngleGradient_mixedObjectWithFraction_ofObject___block_invoke;
  v5[3] = &unk_24D82B890;
  v5[4] = a4;
  v5[5] = self;
  *(double *)&v5[6] = a3;
  return (id)TSDMixingMixedObjectWithFraction(self, a4, (uint64_t)v5);
}

TSDAngleGradient *__53__TSDAngleGradient_mixedObjectWithFraction_ofObject___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  unint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

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
  objc_msgSend(*(id *)(a1 + 40), "opacity");
  v6 = v5;
  objc_msgSend(v2, "opacity");
  v8 = TSDMixFloats(v6, v7, *(double *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 40), "gradientAngle");
  v10 = v9;
  objc_msgSend(v2, "gradientAngle");
  return -[TSDAngleGradient initWithGradientStops:type:opacity:angle:]([TSDAngleGradient alloc], "initWithGradientStops:type:opacity:angle:", v3, objc_msgSend(*(id *)(a1 + 40), "gradientType"), v8, TSDMixFloats(v10, v11, *(double *)(a1 + 48)));
}

- (double)gradientAngle
{
  return self->mAngle;
}

- (void)setGradientAngle:(double)a3
{
  self->mAngle = a3;
}

@end
