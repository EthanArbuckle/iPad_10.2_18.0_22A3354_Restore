@implementation CRLAngleGradientFill

- (CRLAngleGradientFill)initWithGradientStops:(id)a3 type:(unint64_t)a4 opacity:(double)a5 angle:(double)a6 isAdvancedGradient:(BOOL)a7
{
  _BOOL8 v7;
  CRLAngleGradientFill *v9;
  CRLAngleGradientFill *v10;
  objc_super v12;

  v7 = a7;
  v12.receiver = self;
  v12.super_class = (Class)CRLAngleGradientFill;
  v9 = -[CRLGradientFill initWithGradientStops:type:opacity:](&v12, "initWithGradientStops:type:opacity:", a3, a4, a5);
  v10 = v9;
  if (v9)
  {
    v9->mAngle = a6;
    -[CRLGradientFill p_setIsAdvancedGradient:](v9, "p_setIsAdvancedGradient:", v7);
  }
  return v10;
}

- (CRLAngleGradientFill)initWithGradientStops:(id)a3 type:(unint64_t)a4 opacity:(double)a5 angle:(double)a6
{
  return -[CRLAngleGradientFill initWithGradientStops:type:opacity:angle:isAdvancedGradient:](self, "initWithGradientStops:type:opacity:angle:isAdvancedGradient:", a3, a4, 0, a5, a6);
}

- (CRLAngleGradientFill)initWithStartColor:(id)a3 endColor:(id)a4 type:(unint64_t)a5 angle:(double)a6
{
  CRLAngleGradientFill *result;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CRLAngleGradientFill;
  result = -[CRLGradientFill initWithStartColor:endColor:type:](&v8, "initWithStartColor:endColor:type:", a3, a4, a5);
  if (result)
    result->mAngle = a6;
  return result;
}

- (id)description
{
  Class v3;
  NSString *v4;
  unint64_t v5;
  uint64_t v6;

  objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = -[CRLGradientFill gradientType](self, "gradientType");
  -[CRLGradientFill opacity](self, "opacity");
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>: type=%tu opacity=%f angle=%f \n\tstops=%@"), v4, self, v5, v6, *(_QWORD *)&self->mAngle, -[CRLGradientFill gradientStops](self, "gradientStops"));
}

- (unint64_t)hash
{
  double *p_mAngle;
  id v3;
  objc_super v5;

  p_mAngle = &self->mAngle;
  v5.receiver = self;
  v5.super_class = (Class)CRLAngleGradientFill;
  v3 = -[CRLGradientFill hash](&v5, "hash");
  return sub_1000BC018((char *)p_mAngle, 8, (uint64_t)v3);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  id v8;
  void *v9;
  double v10;
  double mAngle;
  objc_super v13;
  uint64_t v14;
  uint64_t v15;

  if (a3 == self)
  {
    LOBYTE(v8) = 1;
  }
  else
  {
    v14 = v3;
    v15 = v4;
    objc_opt_class(CRLAngleGradientFill, a2);
    v8 = sub_100221D0C(v7, a3);
    if (v8)
    {
      v9 = v8;
      v13.receiver = self;
      v13.super_class = (Class)CRLAngleGradientFill;
      LODWORD(v8) = -[CRLGradientFill isEqual:](&v13, "isEqual:", a3);
      if ((_DWORD)v8)
      {
        objc_msgSend(v9, "gradientAngle");
        mAngle = self->mAngle;
        LOBYTE(v8) = v10 == mAngle || vabdd_f64(v10, mAngle) < fabs(mAngle * 0.000000999999997);
      }
    }
  }
  return (char)v8;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  CRLMutableAngleGradientFill *v4;
  NSArray *v5;
  unint64_t v6;
  double v7;
  double v8;
  double v9;
  CRLMutableAngleGradientFill *v10;

  v4 = +[CRLMutableAngleGradientFill allocWithZone:](CRLMutableAngleGradientFill, "allocWithZone:", a3);
  v5 = -[CRLGradientFill gradientStops](self, "gradientStops");
  v6 = -[CRLGradientFill gradientType](self, "gradientType");
  -[CRLGradientFill opacity](self, "opacity");
  v8 = v7;
  -[CRLAngleGradientFill gradientAngle](self, "gradientAngle");
  v10 = -[CRLAngleGradientFill initWithGradientStops:type:opacity:angle:](v4, "initWithGradientStops:type:opacity:angle:", v5, v6, v8, v9);
  -[CRLGradientFill i_setAdvancedGradientFlag:](v10, "i_setAdvancedGradientFlag:", -[CRLGradientFill i_advancedGradientFlag](self, "i_advancedGradientFlag"));
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
  CGAffineTransform v19;
  CGAffineTransform v20;
  CGAffineTransform v21;
  CGRect v22;
  CGRect v23;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = CGRectGetWidth(a3) * 0.5;
  v22.origin.x = x;
  v22.origin.y = y;
  v22.size.width = width;
  v22.size.height = height;
  v9 = CGRectGetHeight(v22) * 0.5;
  v18 = CGPointZero.y;
  v23.origin.x = x;
  v23.origin.y = y;
  v23.size.width = width;
  v23.size.height = height;
  v10 = CGRectGetWidth(v23);
  memset(&v21, 0, sizeof(v21));
  v11 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&v20.a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&v20.c = v11;
  *(_OWORD *)&v20.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  CGAffineTransformTranslate(&v21, &v20, v8, v9);
  v19 = v21;
  CGAffineTransformRotate(&v20, &v19, -a4);
  v21 = v20;
  v19 = v20;
  CGAffineTransformTranslate(&v20, &v19, -v8, -v9);
  v21 = v20;
  v12 = v20.tx + v18 * v20.c + v20.a * CGPointZero.x;
  v13 = v20.ty + v18 * v20.d + v20.b * CGPointZero.x;
  if (v13 != v9)
  {
    v14 = v20.ty + v20.d * 0.0 + v20.b * v10;
    if (v14 == v9)
    {
      v12 = v20.tx + v20.c * 0.0 + v20.a * v10;
      v13 = v20.ty + v20.d * 0.0 + v20.b * v10;
    }
    else
    {
      if (vabdd_f64(v13, v9) >= vabdd_f64(v14, v9))
        v15 = v20.tx + v20.c * 0.0 + v20.a * v10;
      else
        v15 = v20.tx + v18 * v20.c + v20.a * CGPointZero.x;
      v12 = v8;
      v13 = v9;
      v8 = v15;
    }
  }
  return sub_10006108C(v12, v13, v8, v9);
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
    -[CRLAngleGradientFill p_shadingTransformForBounds:](self, "p_shadingTransformForBounds:");
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
  v8 = vaddq_f64(v7, vmlaq_n_f64(vmulq_n_f64(v6, CGPointZero.y), v5, CGPointZero.x));
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
    -[CRLAngleGradientFill p_shadingTransformForBounds:](self, "p_shadingTransformForBounds:");
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
  v12 = -[CRLGradientFill shadingRef](self, "shadingRef");
  CGContextSaveGState(a4);
  v30.origin.x = x;
  v30.origin.y = y;
  v30.size.width = width;
  v30.size.height = height;
  CGContextClipToRect(a4, v30);
  if (-[CRLGradientFill gradientType](self, "gradientType"))
  {
    if (self)
      -[CRLGradientFill centeredRadialTransformInRect:](self, "centeredRadialTransformInRect:", x, y, width, height);
    else
      memset(&v25, 0, sizeof(v25));
    CGContextConcatCTM(a4, &v25);
  }
  else
  {
    -[CRLAngleGradientFill p_bestGradientLengthForRect:atAngle:](self, "p_bestGradientLengthForRect:atAngle:", x, y, width, height, -a5);
    v14 = v13;
    v28 = 0.0;
    v29 = 0.0;
    v26 = 0.0;
    v27 = 0.0;
    sub_100061EF8(&v26, v13, -a5);
    sub_100061EF8(&v28, v14, 3.14159265 - a5);
    v15 = sub_100061400(x, y, width, height);
    v17 = v16;
    v18 = sub_1000603D0(v15, v16, v26);
    v20 = v19;
    v26 = v18;
    v27 = v19;
    v21 = sub_1000603D0(v15, v17, v28);
    v23 = v22;
    v28 = v21;
    v29 = v22;
    v24 = sub_10006108C(v21, v22, v18, v20);
    CGContextTranslateCTM(a4, v21, v23);
    CGContextRotateCTM(a4, -a5);
    CGContextScaleCTM(a4, v24 / 100.0, v24 / 100.0);
  }
  -[CRLGradientFill p_setAlpha:](self, "p_setAlpha:", a4, *(_OWORD *)&v25.a, *(_OWORD *)&v25.c, *(_OWORD *)&v25.tx);
  CGContextSetInterpolationQuality(a4, kCGInterpolationHigh);
  CGContextDrawShading(a4, v12);
  CGContextRestoreGState(a4);
}

- (void)paintRect:(CGRect)a3 inContext:(CGContext *)a4
{
  -[CRLAngleGradientFill paintRect:inContext:atAngle:](self, "paintRect:inContext:atAngle:", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, self->mAngle);
}

- (void)paintPath:(CGPath *)a3 naturalBounds:(CGRect)a4 inContext:(CGContext *)a5 isPDF:(BOOL)a6
{
  double height;
  double width;
  double y;
  double x;
  double v14;
  double v15;
  CGSize size;
  CGContext *v17;
  CGPoint origin;
  CGSize v19;
  CGRect ClipBoundingBox;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  CGContextSaveGState(a5);
  CGContextAddPath(a5, a3);
  CGContextClip(a5);
  ClipBoundingBox = CGContextGetClipBoundingBox(a5);
  v14 = ClipBoundingBox.size.width;
  v15 = ClipBoundingBox.size.height;
  if (sub_10006178C(ClipBoundingBox.origin.x, ClipBoundingBox.origin.y, ClipBoundingBox.size.width, ClipBoundingBox.size.height)&& v15 > 0.0&& v14 > 0.0)
  {
    if ((a6 || sub_100411FB8((uint64_t)a5)) && -[CRLGradientFill hasAlpha](self, "hasAlpha")
      || sub_100411DA0((uint64_t)a5))
    {
      size = CGRectZero.size;
      origin = CGRectZero.origin;
      v19 = size;
      v17 = -[CRLGradientFill p_beginBitmapWrapperContextInContext:returningIntegralBounds:](self, "p_beginBitmapWrapperContextInContext:returningIntegralBounds:", a5, &origin);
      if (v17)
        -[CRLAngleGradientFill p_paintPath:inContext:naturalBounds:](self, "p_paintPath:inContext:naturalBounds:", a3, v17, x, y, width, height);
      -[CRLGradientFill p_endBitmapWrapperContext:inContext:withIntegralBounds:](self, "p_endBitmapWrapperContext:inContext:withIntegralBounds:", v17, a5, origin, v19);
    }
    else
    {
      -[CRLAngleGradientFill p_paintPath:inContext:naturalBounds:](self, "p_paintPath:inContext:naturalBounds:", a3, a5, x, y, width, height);
    }
  }
  CGContextRestoreGState(a5);
}

- (void)paintPath:(CGPath *)a3 inContext:(CGContext *)a4
{
  CGRect PathBoundingBox;

  PathBoundingBox = CGPathGetPathBoundingBox(a3);
  -[CRLAngleGradientFill paintPath:naturalBounds:inContext:isPDF:](self, "paintPath:naturalBounds:inContext:isPDF:", a3, a4, 0, PathBoundingBox.origin.x, PathBoundingBox.origin.y, PathBoundingBox.size.width, PathBoundingBox.size.height);
}

- (CGAffineTransform)p_shadingTransformForBounds:(SEL)a3
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  unint64_t v10;
  CGFloat MidX;
  double MidY;
  double MaxX;
  double MaxY;
  __int128 v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGFloat v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  CGAffineTransform *result;
  double mAngle;
  __int128 v26;
  __int128 v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  __int128 v45;
  __int128 v46;
  CGFloat v47;
  __int128 v48;
  __int128 v49;
  CGFloat v50;
  CGFloat v51;
  CGFloat v52;
  CGFloat v53;
  CGFloat v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  CGAffineTransform t2;
  CGAffineTransform v63;
  CGAffineTransform t1;
  CGAffineTransform v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;

  v66 = CGRectInset(a4, -1.0, -1.0);
  x = v66.origin.x;
  y = v66.origin.y;
  width = v66.size.width;
  height = v66.size.height;
  v60 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v61 = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&retstr->c = v60;
  v59 = *(_OWORD *)&CGAffineTransformIdentity.tx;
  *(_OWORD *)&retstr->tx = v59;
  v10 = -[CRLGradientFill gradientType](self, "gradientType");
  v67.origin.x = x;
  v67.origin.y = y;
  v67.size.width = width;
  v67.size.height = height;
  MidX = CGRectGetMidX(v67);
  v68.origin.x = x;
  v68.origin.y = y;
  v68.size.width = width;
  v68.size.height = height;
  MidY = CGRectGetMidY(v68);
  if (v10)
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
    sub_10007979C(0, (uint64_t)&v65, CGPointZero.x, CGPointZero.y, 100.0, 0.0, MidX, MidY, MaxX, MaxY);
    v15 = *(_OWORD *)&v65.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v65.a;
    *(_OWORD *)&retstr->c = v15;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v65.tx;
    v16 = sub_100061A8C(MidX, MidY, MaxX, MaxY, 0.5);
    v18 = v17;
    memset(&v65, 0, sizeof(v65));
    CGAffineTransformMakeRotation(&v65, 5.49778714 - self->mAngle);
    v19 = sub_1000603DC(v16, v18, -1.0);
    t2 = v65;
    sub_1000796D4(&t2, &t1, v19, v20);
    v21 = *(_OWORD *)&t1.c;
    v65 = t1;
    v22 = *(_OWORD *)&t1.a;
    v23 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&t1.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&t1.c = v23;
    *(_OWORD *)&t1.tx = *(_OWORD *)&retstr->tx;
    *(_OWORD *)&t2.a = v22;
    *(_OWORD *)&t2.c = v21;
    *(_OWORD *)&t2.tx = *(_OWORD *)&v65.tx;
    return CGAffineTransformConcat(retstr, &t1, &t2);
  }
  else
  {
    *(_OWORD *)&v65.a = v61;
    *(_OWORD *)&v65.c = v60;
    *(_OWORD *)&v65.tx = v59;
    CGAffineTransformTranslate(retstr, &v65, MidX, MidY);
    mAngle = self->mAngle;
    v26 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&t1.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&t1.c = v26;
    *(_OWORD *)&t1.tx = *(_OWORD *)&retstr->tx;
    CGAffineTransformRotate(&v65, &t1, mAngle);
    v27 = *(_OWORD *)&v65.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v65.a;
    *(_OWORD *)&retstr->c = v27;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v65.tx;
    v28 = x;
    *(CGFloat *)&v27 = y;
    v29 = width;
    v30 = height;
    v31 = -CGRectGetMidX(*(CGRect *)((char *)&v27 - 8));
    v71.origin.x = x;
    v71.origin.y = y;
    v71.size.width = width;
    v71.size.height = height;
    v32 = CGRectGetMidY(v71);
    v33 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&t1.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&t1.c = v33;
    *(_OWORD *)&t1.tx = *(_OWORD *)&retstr->tx;
    CGAffineTransformTranslate(&v65, &t1, v31, -v32);
    v34 = *(_OWORD *)&v65.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v65.a;
    *(_OWORD *)&retstr->c = v34;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v65.tx;
    v35 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v65.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v65.c = v35;
    *(_OWORD *)&v65.tx = *(_OWORD *)&retstr->tx;
    v36 = x;
    *(CGFloat *)&v35 = y;
    v37 = width;
    v38 = height;
    v72 = CGRectApplyAffineTransform(*(CGRect *)((char *)&v35 - 8), &v65);
    v39 = v72.origin.x;
    v40 = v72.origin.y;
    v41 = v72.size.width;
    v42 = v72.size.height;
    *(_OWORD *)&retstr->a = v61;
    *(_OWORD *)&retstr->c = v60;
    *(_OWORD *)&retstr->tx = v59;
    v43 = CGRectGetMidX(v72);
    v73.origin.x = v39;
    v73.origin.y = v40;
    v73.size.width = v41;
    v73.size.height = v42;
    v44 = CGRectGetMidY(v73);
    v45 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&t1.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&t1.c = v45;
    *(_OWORD *)&t1.tx = *(_OWORD *)&retstr->tx;
    CGAffineTransformTranslate(&v65, &t1, v43, v44);
    v46 = *(_OWORD *)&v65.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v65.a;
    *(_OWORD *)&retstr->c = v46;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v65.tx;
    v47 = -self->mAngle;
    v48 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&t1.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&t1.c = v48;
    *(_OWORD *)&t1.tx = *(_OWORD *)&retstr->tx;
    CGAffineTransformRotate(&v65, &t1, v47);
    v49 = *(_OWORD *)&v65.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v65.a;
    *(_OWORD *)&retstr->c = v49;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v65.tx;
    v50 = v39;
    *(CGFloat *)&v49 = v40;
    v51 = v41;
    v52 = v42;
    v53 = CGRectGetWidth(*(CGRect *)((char *)&v49 - 8)) / 100.0;
    v74.origin.x = v39;
    v74.origin.y = v40;
    v74.size.width = v41;
    v74.size.height = v42;
    v54 = CGRectGetHeight(v74);
    v55 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&t1.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&t1.c = v55;
    *(_OWORD *)&t1.tx = *(_OWORD *)&retstr->tx;
    CGAffineTransformScale(&v65, &t1, v53, v54 / 100.0);
    v56 = *(_OWORD *)&v65.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v65.a;
    *(_OWORD *)&retstr->c = v56;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v65.tx;
    CGAffineTransformMakeTranslation(&v63, -50.0, 0.0);
    v57 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&t1.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&t1.c = v57;
    *(_OWORD *)&t1.tx = *(_OWORD *)&retstr->tx;
    result = CGAffineTransformConcat(&v65, &v63, &t1);
    v58 = *(_OWORD *)&v65.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v65.a;
    *(_OWORD *)&retstr->c = v58;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v65.tx;
  }
  return result;
}

- (void)p_paintPath:(CGPath *)a3 inContext:(CGContext *)a4 naturalBounds:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  CGShading *v12;
  CGAffineTransform v13[2];
  CGRect ClipBoundingBox;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  CGContextSaveGState(a4);
  CGContextAddPath(a4, a3);
  CGContextClip(a4);
  ClipBoundingBox = CGContextGetClipBoundingBox(a4);
  if (sub_10006178C(ClipBoundingBox.origin.x, ClipBoundingBox.origin.y, ClipBoundingBox.size.width, ClipBoundingBox.size.height))
  {
    memset(&v13[1], 0, sizeof(CGAffineTransform));
    if (self)
      -[CRLAngleGradientFill p_shadingTransformForBounds:](self, "p_shadingTransformForBounds:", x, y, width, height);
    v13[0] = v13[1];
    CGContextConcatCTM(a4, v13);
    CGContextSetInterpolationQuality(a4, kCGInterpolationHigh);
    v12 = -[CRLGradientFill shadingRef](self, "shadingRef");
    CGShadingRetain(v12);
    -[CRLGradientFill p_setAlpha:](self, "p_setAlpha:", a4);
    CGContextDrawShading(a4, v12);
    CGShadingRelease(v12);
  }
  CGContextRestoreGState(a4);
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
