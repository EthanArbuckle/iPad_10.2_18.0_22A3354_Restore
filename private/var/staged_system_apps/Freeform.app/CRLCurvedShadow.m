@implementation CRLCurvedShadow

+ (id)curvedShadowWithOffset:(double)a3 angle:(double)a4 radius:(double)a5 curve:(double)a6 opacity:(double)a7 color:(id)a8 enabled:(BOOL)a9
{
  _BOOL8 v9;
  id v16;
  id v17;

  v9 = a9;
  v16 = a8;
  v17 = objc_msgSend(objc_alloc((Class)a1), "initWithOffset:angle:radius:curve:opacity:color:enabled:", v16, v9, a3, a4, a5, a6, a7);

  return v17;
}

- (CRLCurvedShadow)initWithOffset:(double)a3 angle:(double)a4 radius:(double)a5 curve:(double)a6 opacity:(double)a7 color:(id)a8 enabled:(BOOL)a9
{
  _BOOL8 v9;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  double *v20;
  CRLCurvedShadow *v21;
  objc_super v23;

  v9 = a9;
  v16 = a8;
  if (!v16)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124BC58);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E17EAC();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124BC78);
    v17 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCurvedShadow initWithOffset:angle:radius:curve:opacity:color:enabled:]"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCurvedShadow.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v18, v19, 47, 0, "invalid nil value for '%{public}s'", "color");

  }
  v23.receiver = self;
  v23.super_class = (Class)CRLCurvedShadow;
  v20 = -[CRLShadow i_initWithOpacity:color:angle:offset:radius:enabled:](&v23, "i_initWithOpacity:color:angle:offset:radius:enabled:", v16, v9, a7, a4, a3, a5);
  v21 = (CRLCurvedShadow *)v20;
  if (v20)
    v20[7] = a6;

  return v21;
}

- (void)i_setCurve:(double)a3
{
  self->mCurve = a3;
}

- (id)description
{
  Class v3;
  NSString *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  unsigned int v15;
  __CFString *v16;
  __CFString *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;

  objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  -[CRLShadow angle](self, "angle");
  v7 = v6;
  -[CRLShadow offset](self, "offset");
  v9 = v8;
  -[CRLShadow radius](self, "radius");
  v11 = v10;
  -[CRLShadow opacity](self, "opacity");
  v13 = v12;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShadow color](self, "color"));
  v15 = -[CRLShadow isEnabled](self, "isEnabled");
  v16 = CFSTR("NO");
  if (v15)
    v16 = CFSTR("YES");
  v17 = v16;
  -[CRLCurvedShadow curve](self, "curve");
  v19 = v18;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShadow typeDescription](self, "typeDescription"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ %p: angle=%g offset=%g radius=%g opacity=%g color=%p enabled=%@  curve=%f type=%@>"), v5, self, v7, v9, v11, v13, v14, v17, v19, v20));

  return v21;
}

- (double)clampOffset:(double)a3
{
  float v3;

  v3 = a3;
  return roundf(v3);
}

- (unint64_t)shadowType
{
  return 3;
}

- (double)paddingForBlur
{
  return 40.0;
}

- (CGRect)expandedBoundsForRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  CGRect v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[CRLCurvedShadow paddingForCurveWithSize:](self, "paddingForCurveWithSize:", a3.size.width, a3.size.height);
  v9 = v8;
  -[CRLCurvedShadow paddingForBlur](self, "paddingForBlur");
  v11 = -v10;
  v12 = -v10 - v9;
  v13.origin.x = x;
  v13.origin.y = y;
  v13.size.width = width;
  v13.size.height = height;
  return CGRectInset(v13, v11, v12);
}

- (double)paddingForCurveWithSize:(CGSize)a3
{
  return a3.height * 0.3;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  CRLMutableCurvedShadow *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  CRLMutableCurvedShadow *v16;

  v4 = [CRLMutableCurvedShadow alloc];
  -[CRLShadow offset](self, "offset");
  v6 = v5;
  -[CRLShadow angle](self, "angle");
  v8 = v7;
  -[CRLShadow radius](self, "radius");
  v10 = v9;
  -[CRLCurvedShadow curve](self, "curve");
  v12 = v11;
  -[CRLShadow opacity](self, "opacity");
  v14 = v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShadow color](self, "color"));
  v16 = -[CRLCurvedShadow initWithOffset:angle:radius:curve:opacity:color:enabled:](v4, "initWithOffset:angle:radius:curve:opacity:color:enabled:", v15, -[CRLShadow isEnabled](self, "isEnabled"), v6, v8, v10, v12, v14);

  return v16;
}

- (id)newShadowClampedForSwatches
{
  double v3;
  double v4;
  double v5;
  double v6;
  CRLCurvedShadow *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  CRLCurvedShadow *v15;

  -[CRLCurvedShadow curve](self, "curve");
  v4 = sub_1003C65EC(v3, -0.07, 0.07);
  -[CRLShadow offset](self, "offset");
  v6 = sub_1003C65EC(v5, -15.0, 3.0);
  v7 = [CRLCurvedShadow alloc];
  -[CRLShadow angle](self, "angle");
  v9 = v8;
  -[CRLShadow radius](self, "radius");
  v11 = v10;
  -[CRLShadow opacity](self, "opacity");
  v13 = v12;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShadow color](self, "color"));
  v15 = -[CRLCurvedShadow initWithOffset:angle:radius:curve:opacity:color:enabled:](v7, "initWithOffset:angle:radius:curve:opacity:color:enabled:", v14, -[CRLShadow isEnabled](self, "isEnabled"), v6, v9, v11, v4, v13);

  return v15;
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
  BOOL v12;
  objc_super v14;

  if (a3 == self)
    return 1;
  v4 = a3;
  objc_opt_class(CRLCurvedShadow, v5);
  v7 = sub_100221D0C(v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if (v8
    && (v14.receiver = self,
        v14.super_class = (Class)CRLCurvedShadow,
        -[CRLShadow isEqual:](&v14, "isEqual:", v8)))
  {
    -[CRLCurvedShadow curve](self, "curve");
    v10 = v9;
    objc_msgSend(v8, "curve");
    v12 = v10 == v11 || vabdd_f64(v10, v11) < fabs(v11 * 0.000000999999997);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CRLCurvedShadow;
  return -[CRLShadow hash](&v3, "hash");
}

- (BOOL)showForEditingText
{
  return 0;
}

- (CGRect)shadowBoundsForRect:(CGRect)a3 additionalTransform:(CGAffineTransform *)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  __int128 v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  __int128 v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGFloat r1;
  CGAffineTransform v29;
  CGAffineTransform v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect result;
  CGRect v38;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (-[CRLShadow isEnabled](self, "isEnabled"))
  {
    v10 = *(_OWORD *)&a4->c;
    *(_OWORD *)&v29.a = *(_OWORD *)&a4->a;
    *(_OWORD *)&v29.c = v10;
    *(_OWORD *)&v29.tx = *(_OWORD *)&a4->tx;
    CGAffineTransformInvert(&v30, &v29);
    v31.origin.x = x;
    v31.origin.y = y;
    v31.size.width = width;
    v31.size.height = height;
    v32 = CGRectApplyAffineTransform(v31, &v30);
    -[CRLCurvedShadow expandedBoundsForRect:](self, "expandedBoundsForRect:", v32.origin.x, v32.origin.y, v32.size.width, v32.size.height);
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
    -[CRLShadow offsetDelta](self, "offsetDelta");
    r1 = height;
    v20 = v19;
    -[CRLShadow offsetDelta](self, "offsetDelta");
    v22 = v21;
    v33.origin.x = v12;
    v33.origin.y = v14;
    v33.size.width = v16;
    v33.size.height = v18;
    v34 = CGRectOffset(v33, v20, v22);
    v23 = *(_OWORD *)&a4->c;
    *(_OWORD *)&v29.a = *(_OWORD *)&a4->a;
    *(_OWORD *)&v29.c = v23;
    *(_OWORD *)&v29.tx = *(_OWORD *)&a4->tx;
    v38 = CGRectApplyAffineTransform(v34, &v29);
    v35.origin.x = x;
    v35.origin.y = y;
    v35.size.width = width;
    v35.size.height = r1;
    v36 = CGRectUnion(v35, v38);
    x = v36.origin.x;
    y = v36.origin.y;
    width = v36.size.width;
    height = v36.size.height;
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

- (CGRect)boundsInNaturalSpaceForRep:(id)a3
{
  void *v4;
  void *v5;
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
  CGRect result;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "styledLayout"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "geometryInRoot"));
  objc_msgSend(v5, "frame");
  v6 = sub_10005FDDC();
  v8 = v7;
  v10 = v9;
  v12 = v11;

  -[CRLCurvedShadow expandedBoundsForRect:](self, "expandedBoundsForRect:", v6, v8, v10, v12);
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (CGRect)boundsForRep:(id)a3
{
  void *v4;
  void *v5;
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
  CGRect result;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "styledLayout"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "geometryInRoot"));
  objc_msgSend(v5, "frame");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  -[CRLCurvedShadow expandedBoundsForRect:](self, "expandedBoundsForRect:", v7, v9, v11, v13);
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (CGImage)newShadowImageForRep:(id)a3 withSize:(CGSize)a4 drawSelector:(SEL)a5 unflipped:(BOOL)a6
{
  _BOOL4 v6;
  double height;
  double width;
  id v11;
  void *v12;
  double v13;
  CGImage *v14;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGContext *v24;
  CGContext *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  void *v38;
  void *v39;
  CGImage *Image;
  CGContext *v41;
  CGContext *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  CGAffineTransform v53;
  CGAffineTransform v54;
  CGAffineTransform transform;
  CGAffineTransform v56;
  _OWORD v57[4];

  v6 = a6;
  height = a4.height;
  width = a4.width;
  v11 = a3;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShadow color](self, "color"));
  -[CRLShadow opacity](self, "opacity");
  if (v13 == 0.0 || (objc_msgSend(v12, "alphaComponent"), v16 == 0.0) || width == 0.0 || height == 0.0)
  {
LABEL_2:
    v14 = -[CRLShadow i_newEmptyImage](self, "i_newEmptyImage");
    goto LABEL_3;
  }
  if (qword_1014152F0 != -1)
    dispatch_once(&qword_1014152F0, &stru_10124BC98);
  v17 = sub_100062E58(width, height, 1048576.0);
  v19 = v18;
  -[CRLCurvedShadow boundsForRep:](self, "boundsForRep:", v11);
  v21 = v20;
  v23 = v22;
  v24 = sub_10040FA64(11, v17, v19);
  if (!v24)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124BCB8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E17F40();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124BCD8);
    v34 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCurvedShadow newShadowImageForRep:withSize:drawSelector:unflipped:]"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCurvedShadow.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v35, v36, 217, 0, "Cannot render curved shadow, the size is too large for the CGContext to render. Returning an empty image instead.");

    goto LABEL_2;
  }
  v25 = v24;
  v52 = v12;
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "canvas"));
  v27 = objc_msgSend(v26, "isPrinting");
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "canvas"));
  v29 = objc_msgSend(v28, "isDrawingIntoPDF");
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "canvas"));
  objc_msgSend(v30, "contentsScale");
  sub_10040F974((uint64_t)v25, (uint64_t)v27, (uint64_t)v29, 1, 0, v31);

  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "layout"));
  v33 = v32;
  if (v32)
    objc_msgSend(v32, "transformInRoot");
  else
    memset(v57, 0, 48);
  v37 = sub_1000791B0(v57);
  sub_100410CB4((uint64_t)v25, v37);

  CGContextScaleCTM(v25, v17 / width, v17 / width);
  CGContextTranslateCTM(v25, -v21, -v23);
  memset(&v56, 0, sizeof(v56));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "styledLayout"));
  v39 = v38;
  v12 = v52;
  if (v38)
    objc_msgSend(v38, "transformInRoot");
  else
    memset(&v56, 0, sizeof(v56));

  transform = v56;
  CGContextConcatCTM(v25, &transform);
  objc_msgSend(v11, "performSelector:withObject:", a5, v25);
  Image = CGBitmapContextCreateImage(v25);
  CGContextRelease(v25);
  v41 = sub_10040FA64(3, v17, v19);
  if (!v41)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124BCF8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E17FC4();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124BD18);
    v46 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCurvedShadow newShadowImageForRep:withSize:drawSelector:unflipped:]"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCurvedShadow.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v47, v48, 249, 0, "Cannot render curved shadow, the size is too large for the CGContext to render. Returning empty image instead");

    CGImageRelease(Image);
    goto LABEL_2;
  }
  v42 = v41;
  if (v6)
  {
    memset(&transform, 0, sizeof(transform));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "layout"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "geometry"));
    v45 = v44;
    if (v44)
      objc_msgSend(v44, "transform");
    else
      memset(&transform, 0, sizeof(transform));

    if (sub_100060C0C(transform.a, transform.c, transform.b, transform.d) > 0.0)
    {
      v54.a = -1.0;
      v54.b = 0.0;
      v54.c = 0.0;
      v54.d = 1.0;
      v54.tx = v17;
      v54.ty = 0.0;
      CGContextConcatCTM(v42, &v54);
    }
    v53.b = 0.0;
    v53.c = 0.0;
    v53.a = 1.0;
    *(_OWORD *)&v53.d = xmmword_100EEE790;
    v53.ty = v19;
    CGContextConcatCTM(v42, &v53);
  }
  if (Image)
  {
    objc_msgSend((id)qword_1014152E8, "drawCurvedShadow:forImage:inContext:forUnscaledSize:withScaleFactor:", self, Image, v42, width, height, v17 / width);
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124BD38);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E18048();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124BD58);
    v49 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCurvedShadow newShadowImageForRep:withSize:drawSelector:unflipped:]"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCurvedShadow.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v50, v51, 265, 0, "invalid nil value for '%{public}s'", "imageWithoutShadow");

  }
  v14 = CGBitmapContextCreateImage(v42);
  CGContextRelease(v42);
  CGImageRelease(Image);
LABEL_3:

  return v14;
}

- (double)curve
{
  return self->mCurve;
}

@end
