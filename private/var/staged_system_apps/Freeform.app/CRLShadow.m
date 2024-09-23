@implementation CRLShadow

- (id)i_initWithOpacity:(double)a3 color:(id)a4 angle:(double)a5 offset:(double)a6 radius:(double)a7 enabled:(BOOL)a8
{
  id v14;
  void *v15;
  void *v16;
  void *v17;
  CRLShadow *v18;
  CRLShadow *v19;
  double v20;
  CRLColor *v21;
  CRLColor *mColor;
  double v23;
  double v24;
  double v25;
  objc_super v27;

  v14 = a4;
  if (!v14)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123AA88);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DFDD70();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123AAA8);
    v15 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShadow i_initWithOpacity:color:angle:offset:radius:enabled:]"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLShadow.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v16, v17, 44, 0, "invalid nil value for '%{public}s'", "color");

  }
  v27.receiver = self;
  v27.super_class = (Class)CRLShadow;
  v18 = -[CRLShadow init](&v27, "init");
  v19 = v18;
  if (v18)
  {
    -[CRLShadow clampOpacity:](v18, "clampOpacity:", a3);
    v19->mOpacity = v20;
    v21 = (CRLColor *)objc_msgSend(v14, "copy");
    mColor = v19->mColor;
    v19->mColor = v21;

    sub_1000618C4(a5);
    v19->mAngle = v23;
    -[CRLShadow clampOffset:](v19, "clampOffset:", a6);
    v19->mOffset = v24;
    v19->mEnabled = a8;
    -[CRLShadow clampRadius:](v19, "clampRadius:", a7);
    v19->mRadius = v25;
  }

  return v19;
}

+ (id)p_defaultShadowEnabled:(BOOL)a3
{
  _BOOL8 v3;
  CRLDropShadow *v4;
  void *v5;
  CRLDropShadow *v6;

  v3 = a3;
  v4 = [CRLDropShadow alloc];
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColor blackColor](CRLColor, "blackColor"));
  v6 = -[CRLDropShadow initWithAngle:offset:radius:opacity:color:enabled:](v4, "initWithAngle:offset:radius:opacity:color:enabled:", v5, v3, 90.0, 2.0, 3.0, 0.25);

  return v6;
}

+ (id)defaultShadow
{
  return _objc_msgSend(a1, "p_defaultShadowEnabled:", 1);
}

+ (id)defaultDisabledShadow
{
  return _objc_msgSend(a1, "p_defaultShadowEnabled:", 0);
}

+ (CRLShadow)shadowWithAngle:(double)a3 offset:(double)a4 radius:(double)a5 opacity:(double)a6 color:(id)a7 enabled:(BOOL)a8
{
  _BOOL8 v8;
  id v13;
  CRLDropShadow *v14;

  v8 = a8;
  v13 = a7;
  v14 = -[CRLDropShadow initWithAngle:offset:radius:opacity:color:enabled:]([CRLDropShadow alloc], "initWithAngle:offset:radius:opacity:color:enabled:", v13, v8, a3, a4, a5, a6);

  return (CRLShadow *)v14;
}

+ (CRLShadow)shadowWithNSShadow:(id)a3
{
  id v3;
  double v4;
  long double v5;
  double v6;
  long double v7;
  id v8;
  CGColor *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  CGColor *CopyWithAlpha;
  void *v18;
  void *v19;

  v3 = a3;
  objc_msgSend(v3, "shadowOffset");
  v5 = v4;
  v7 = v6;
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "shadowColor")));
  v9 = (CGColor *)objc_msgSend(v8, "CGColor");

  v10 = sub_1000618B4(v5, v7) * 57.2957795;
  v11 = sub_100061070(v5, v7);
  objc_msgSend(v3, "shadowBlurRadius");
  v13 = v12;

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColor colorWithCGColor:](CRLColor, "colorWithCGColor:", v9));
  objc_msgSend(v14, "alphaComponent");
  v16 = v15;
  CopyWithAlpha = CGColorCreateCopyWithAlpha(v9, 1.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColor colorWithCGColor:](CRLColor, "colorWithCGColor:", CopyWithAlpha));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[CRLShadow shadowWithAngle:offset:radius:opacity:color:enabled:](CRLShadow, "shadowWithAngle:offset:radius:opacity:color:enabled:", v18, 1, v10, v11, v13, v16));

  CGColorRelease(CopyWithAlpha);
  return (CRLShadow *)v19;
}

- (double)clampOffset:(double)a3
{
  return sub_1003C65EC(a3, -50.0, 50.0);
}

- (double)clampRadius:(double)a3
{
  return sub_1003C65EC((double)(int)a3, 0.0, 100.0);
}

- (double)clampOpacity:(double)a3
{
  return sub_1003C65EC(a3, 0.0, 1.0);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return 0;
}

- (BOOL)isContactShadow
{
  return (id)-[CRLShadow shadowType](self, "shadowType") == (id)2;
}

- (BOOL)isDropShadow
{
  return (id)-[CRLShadow shadowType](self, "shadowType") == (id)1;
}

- (BOOL)isCurvedShadow
{
  return (id)-[CRLShadow shadowType](self, "shadowType") == (id)3;
}

- (BOOL)showForEditingText
{
  return 0;
}

- (unint64_t)shadowType
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
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
  unsigned int v21;
  void *v22;
  void *v23;
  unint64_t v24;
  id v25;
  BOOL v26;

  if (a3 != self)
  {
    v4 = a3;
    v6 = objc_opt_class(CRLShadow, v5);
    v7 = sub_100221D0C(v6, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

    if (v8)
    {
      -[CRLShadow angle](self, "angle");
      v10 = v9;
      objc_msgSend(v8, "angle");
      if (v10 == v11 || vabdd_f64(v10, v11) < fabs(v11 * 0.000000999999997))
      {
        -[CRLShadow offset](self, "offset");
        v13 = v12;
        objc_msgSend(v8, "offset");
        if (v13 == v14 || vabdd_f64(v13, v14) < fabs(v14 * 0.000000999999997))
        {
          -[CRLShadow radius](self, "radius");
          v16 = v15;
          objc_msgSend(v8, "radius");
          if (v16 == v17 || vabdd_f64(v16, v17) < fabs(v17 * 0.000000999999997))
          {
            -[CRLShadow opacity](self, "opacity");
            v19 = v18;
            objc_msgSend(v8, "opacity");
            if (v19 == v20 || vabdd_f64(v19, v20) < fabs(v20 * 0.000000999999997))
            {
              v21 = -[CRLShadow isEnabled](self, "isEnabled");
              if (v21 == objc_msgSend(v8, "isEnabled"))
              {
                v22 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShadow color](self, "color"));
                v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "color"));
                if ((objc_msgSend(v22, "isEqual:", v23) & 1) != 0)
                {
                  v24 = -[CRLShadow shadowType](self, "shadowType");
                  v25 = objc_msgSend(v8, "shadowType");

                  if ((id)v24 == v25)
                  {
                    v26 = 1;
LABEL_18:

                    return v26;
                  }
                }
                else
                {

                }
              }
            }
          }
        }
      }
    }
    v26 = 0;
    goto LABEL_18;
  }
  return 1;
}

- (unint64_t)hash
{
  return -[CRLColor hash](self->mColor, "hash");
}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  double mRadius;
  double mOpacity;
  CRLColor *mColor;
  const __CFString *v9;
  void *v10;
  void *v11;
  __int128 v13;

  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v13 = *(_OWORD *)&self->mAngle;
  mRadius = self->mRadius;
  mOpacity = self->mOpacity;
  mColor = self->mColor;
  if (self->mEnabled)
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShadow typeDescription](self, "typeDescription"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ %p: angle=%g offset=%g radius=%g opacity=%g color=%p enabled=%@ type=%@>"), v5, self, v13, *(_QWORD *)&mRadius, *(_QWORD *)&mOpacity, mColor, v9, v10));

  return v11;
}

- (NSString)typeDescription
{
  unint64_t v2;

  v2 = -[CRLShadow shadowType](self, "shadowType");
  if (v2 > 3)
    return 0;
  else
    return (NSString *)*(&off_10123AB88 + v2);
}

- (void)i_setColor:(id)a3
{
  CRLColor *v4;
  CRLColor *mColor;

  v4 = (CRLColor *)objc_msgSend(a3, "copy");
  mColor = self->mColor;
  self->mColor = v4;

}

- (void)i_setAngle:(double)a3
{
  self->mAngle = a3;
}

- (void)i_setOffset:(double)a3
{
  self->mOffset = a3;
}

- (void)i_setRadius:(double)a3
{
  self->mRadius = a3;
}

- (void)i_setOpacity:(double)a3
{
  self->mOpacity = a3;
}

- (void)i_setEnabled:(BOOL)a3
{
  self->mEnabled = a3;
}

- (CGPoint)offsetDelta
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGPoint result;

  v8 = 0.0;
  v9 = 0.0;
  -[CRLShadow offset](self, "offset");
  v4 = v3;
  -[CRLShadow angle](self, "angle");
  sub_100061EF8(&v8, v4, v5 * 0.0174532925);
  v6 = v8;
  v7 = v9;
  result.y = v7;
  result.x = v6;
  return result;
}

+ (id)keyPathsForValuesAffectingCRLColor
{
  return +[NSSet setWithObject:](NSSet, "setWithObject:", CFSTR("color"));
}

+ (BOOL)automaticallyNotifiesObserversOfCRLColor
{
  return 0;
}

- (void)applyToContext:(CGContext *)a3 viewScale:(double)a4
{
  -[CRLShadow applyToContext:viewScale:flipped:extraOffset:](self, "applyToContext:viewScale:flipped:extraOffset:", a3, 0, a4, CGSizeZero.width, CGSizeZero.height);
}

- (void)applyToContext:(CGContext *)a3 viewScale:(double)a4 flipped:(BOOL)a5
{
  -[CRLShadow applyToContext:viewScale:flipped:extraOffset:](self, "applyToContext:viewScale:flipped:extraOffset:", a3, a5, a4, CGSizeZero.width, CGSizeZero.height);
}

- (void)applyToContext:(CGContext *)a3 viewScale:(double)a4 flipped:(BOOL)a5 extraOffset:(CGSize)a6
{
  double height;
  double width;
  _BOOL4 v8;
  double v12;
  double v13;
  int v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  double v20;
  CGSize v21;
  CGFloat v22;
  CGFloat v23;
  void *v24;
  CGColor *v25;
  double v26;
  double v27;
  void *v28;
  CGFloat Alpha;
  CGColor *CopyWithAlpha;
  double v31;
  double v32;
  CGSize v33;
  CGSize v34;

  height = a6.height;
  width = a6.width;
  v8 = a5;
  if (-[CRLShadow isEnabled](self, "isEnabled"))
  {
    v31 = 0.0;
    v32 = 0.0;
    -[CRLShadow angle](self, "angle");
    if (v8)
      v13 = v12;
    else
      v13 = -v12;
    v14 = sub_1004120C4((uint64_t)a3);
    v15 = sub_1004121D0((uint64_t)a3);
    v16 = v15;
    if (v14)
    {
      width = sub_1000603DC(width, height, 1.0 / v15);
      height = v17;
      v16 = 1.0;
    }
    -[CRLShadow radius](self, "radius");
    v19 = v16 * (v18 * a4);
    -[CRLShadow offset](self, "offset");
    sub_100061EF8(&v31, v16 * (v20 * a4), v13 * 0.0174532925);
    v33.width = width;
    v33.height = height;
    v21 = CGContextConvertSizeToDeviceSpace(a3, v33);
    v22 = v31 + v21.width;
    v23 = v21.height + v32;
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShadow color](self, "color"));
    v25 = (CGColor *)objc_msgSend(v24, "CGColor");
    -[CRLShadow opacity](self, "opacity");
    v27 = v26;
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShadow color](self, "color"));
    Alpha = CGColorGetAlpha((CGColorRef)objc_msgSend(v28, "CGColor"));
    CopyWithAlpha = CGColorCreateCopyWithAlpha(v25, v27 * Alpha);

    v34.width = v22;
    v34.height = v23;
    CGContextSetShadowWithColor(a3, v34, v19, CopyWithAlpha);
    CGColorRelease(CopyWithAlpha);
  }
}

- (CGRect)boundsInNaturalSpaceForRep:(id)a3
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = CGRectZero.origin.x;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)boundsForRep:(id)a3
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = CGRectZero.origin.x;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGImage)newShadowImageForRep:(id)a3 withSize:(CGSize)a4 drawSelector:(SEL)a5 unflipped:(BOOL)a6
{
  return 0;
}

- (CGImage)i_newEmptyImage
{
  CGContext *v2;
  CGImage *Image;

  v2 = sub_10040FA64(3, 1.0, 1.0);
  Image = CGBitmapContextCreateImage(v2);
  CGContextRelease(v2);
  return Image;
}

- (CGRect)shadowBoundsForRect:(CGRect)a3 additionalTransform:(CGAffineTransform *)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  float64x2_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGFloat v23;
  double v24;
  double v25;
  double v26;
  double v27;
  float64x2_t v28[3];
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect result;
  CGRect v35;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (-[CRLShadow isEnabled](self, "isEnabled"))
  {
    -[CRLShadow radius](self, "radius");
    v11 = -v10;
    -[CRLShadow radius](self, "radius");
    v13 = -v12;
    v29.origin.x = x;
    v29.origin.y = y;
    v29.size.width = width;
    v29.size.height = height;
    v30 = CGRectInset(v29, v11, v13);
    v14 = v30.origin.x;
    v15 = v30.origin.y;
    v16 = v30.size.width;
    v17 = v30.size.height;
    -[CRLShadow offsetDelta](self, "offsetDelta");
    v18 = *(float64x2_t *)&a4->c;
    v28[0] = *(float64x2_t *)&a4->a;
    v28[1] = v18;
    v28[2] = *(float64x2_t *)&a4->tx;
    v21 = sub_10006214C(v28, v19, v20);
    v23 = v22;
    v31.origin.x = v14;
    v31.origin.y = v15;
    v31.size.width = v16;
    v31.size.height = v17;
    v35 = CGRectOffset(v31, v21, v23);
    v32.origin.x = x;
    v32.origin.y = y;
    v32.size.width = width;
    v32.size.height = height;
    v33 = CGRectUnion(v32, v35);
    x = v33.origin.x;
    y = v33.origin.y;
    width = v33.size.width;
    height = v33.size.height;
  }
  v24 = x;
  v25 = y;
  v26 = width;
  v27 = height;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (CGRect)shadowBoundsForRect:(CGRect)a3
{
  __int128 v3;
  double v4;
  double v5;
  double v6;
  double v7;
  _OWORD v8[3];
  CGRect result;

  v3 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v8[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  v8[1] = v3;
  v8[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
  -[CRLShadow shadowBoundsForRect:additionalTransform:](self, "shadowBoundsForRect:additionalTransform:", v8, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGRect)shadowBoundsForRect:(CGRect)a3 additionalAngle:(double)a4
{
  double height;
  double width;
  double y;
  double x;
  double v9;
  double v10;
  double v11;
  double v12;
  CGAffineTransform v13;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  CGAffineTransformMakeRotation(&v13, a4 * 0.0174532925);
  -[CRLShadow shadowBoundsForRect:additionalTransform:](self, "shadowBoundsForRect:additionalTransform:", &v13, x, y, width, height);
  result.size.height = v12;
  result.size.width = v11;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

+ (id)defaultShadowPresets
{
  void *v2;
  uint64_t v3;
  char v4;
  char v5;
  uint64_t *v6;
  double v7;
  double v8;
  int v9;
  void *v10;
  CRLDropShadow *v11;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v3 = 0;
  v4 = 1;
  do
  {
    v5 = v4;
    v6 = &qword_100EECBC0[8 * v3];
    v7 = *(double *)v6;
    v8 = *((double *)v6 + 1);
    v9 = *((_DWORD *)v6 + 4);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColor colorWithRed:green:blue:alpha:](CRLColor, "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 1.0));
    v11 = -[CRLDropShadow initWithAngle:offset:radius:opacity:color:enabled:]([CRLDropShadow alloc], "initWithAngle:offset:radius:opacity:color:enabled:", v10, 1, v7, v8, (double)v9, 0.5);
    objc_msgSend(v2, "addObject:", v11);

    v4 = 0;
    v3 = 1;
  }
  while ((v5 & 1) != 0);
  return v2;
}

- (NSShadow)NSShadow
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  CGColor *v12;
  double v13;
  double v14;
  CGFloat Alpha;
  CGColor *CopyWithAlpha;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  if (-[CRLShadow isEnabled](self, "isEnabled"))
  {
    v3 = objc_alloc_init((Class)NSShadow);
    -[CRLShadow angle](self, "angle");
    v5 = v4 * 0.0174532925;
    -[CRLShadow offset](self, "offset");
    v7 = v6;
    v8 = sub_100061F64(v5);
    v10 = v9;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShadow color](self, "color"));
    v12 = (CGColor *)objc_msgSend(v11, "CGColor");

    -[CRLShadow opacity](self, "opacity");
    v14 = v13;
    Alpha = CGColorGetAlpha(v12);
    CopyWithAlpha = CGColorCreateCopyWithAlpha(v12, v14 * Alpha);
    if (!CopyWithAlpha)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10123AAC8);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DFDE04();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10123AAE8);
      v17 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE87A4(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShadow NSShadow]"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLShadow.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v18, v19, 423, 0, "invalid nil value for '%{public}s'", "color");

    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithCGColor:](UIColor, "colorWithCGColor:", CopyWithAlpha));
    if (v20)
      objc_msgSend(v3, "setShadowColor:", v20);
    objc_msgSend(v3, "setShadowOffset:", sub_1000603DC(v8, v10, v7));
    -[CRLShadow radius](self, "radius");
    objc_msgSend(v3, "setShadowBlurRadius:");
    CGColorRelease(CopyWithAlpha);

  }
  else
  {
    v3 = 0;
  }
  return (NSShadow *)v3;
}

- (double)angle
{
  return self->mAngle;
}

- (double)offset
{
  return self->mOffset;
}

- (double)radius
{
  return self->mRadius;
}

- (double)opacity
{
  return self->mOpacity;
}

- (CRLColor)color
{
  return self->mColor;
}

- (BOOL)isEnabled
{
  return self->mEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mColor, 0);
}

@end
