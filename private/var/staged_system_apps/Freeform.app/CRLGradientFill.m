@implementation CRLGradientFill

- (void)p_setOpacity:(double)a3
{
  self->mOpacity = a3;
}

- (void)p_setIsAdvancedGradient:(BOOL)a3
{
  self->mIsAdvancedGradient = a3;
}

- (CRLGradientFill)init
{
  CRLGradientFill *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CRLGradientFill;
  v2 = -[CRLGradientFill init](&v4, "init");
  if (v2)
  {
    v2->mStops = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v2->mShadingColorSpace = 2;
  }
  return v2;
}

- (CRLGradientFill)initWithGradientStops:(id)a3 type:(unint64_t)a4 opacity:(double)a5
{
  CRLGradientFill *v8;
  CRLGradientFill *v9;
  NSMutableArray *mStops;

  v8 = -[CRLGradientFill init](self, "init");
  v9 = v8;
  if (v8)
  {
    mStops = v8->mStops;
    if (mStops)
      -[NSMutableArray setArray:](mStops, "setArray:", a3);
    else
      v9->mStops = (NSMutableArray *)objc_msgSend(a3, "mutableCopy");
    v9->mType = a4;
    v9->mOpacity = a5;
    v9->mShadingColorSpace = 2;
  }
  return v9;
}

- (CRLGradientFill)initWithGradientStops:(id)a3 type:(unint64_t)a4
{
  return -[CRLGradientFill initWithGradientStops:type:opacity:](self, "initWithGradientStops:type:opacity:", a3, a4, 1.0);
}

- (CRLGradientFill)initWithStartColor:(id)a3 endColor:(id)a4 type:(unint64_t)a5
{
  _QWORD v9[2];

  v9[0] = +[CRLGradientFillStop gradientStopWithColor:fraction:](CRLGradientFillStop, "gradientStopWithColor:fraction:", a3, 0.0);
  v9[1] = +[CRLGradientFillStop gradientStopWithColor:fraction:](CRLGradientFillStop, "gradientStopWithColor:fraction:", a4, 1.0);
  return -[CRLGradientFill initWithGradientStops:type:](self, "initWithGradientStops:type:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v9, 2), a5);
}

- (void)dealloc
{
  objc_super v3;

  -[CRLGradientFill releaseShadingRef](self, "releaseShadingRef");
  v3.receiver = self;
  v3.super_class = (Class)CRLGradientFill;
  -[CRLGradientFill dealloc](&v3, "dealloc");
}

- (id)description
{
  Class v3;

  objc_opt_class(self, a2);
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>: type=%tu opacity=%f \n\tstops<%p>=%@"), NSStringFromClass(v3), self, self->mType, *(_QWORD *)&self->mOpacity, self->mStops, self->mStops);
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  v3 = sub_1000BC018((char *)&self->mType, 8, (uint64_t)-[NSArray hash](-[CRLGradientFill gradientStops](self, "gradientStops"), "hash"));
  v4 = sub_1000BC018((char *)&self->mOpacity, 8, v3);
  return sub_1000BC018((char *)&self->mIsAdvancedGradient, 1, v4);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v11;
  id v12;
  void *v13;
  double v14;
  double mOpacity;
  unsigned __int8 v16;
  uint64_t v18;
  uint64_t v19;

  if (a3 == self)
  {
    LOBYTE(v12) = 1;
  }
  else
  {
    v18 = v4;
    v19 = v3;
    objc_opt_class(CRLGradientFill, a2);
    v12 = sub_100221D0C(v11, a3);
    if (v12)
    {
      v13 = v12;
      if (objc_msgSend(v12, "gradientType") == (id)self->mType
        && ((objc_msgSend(v13, "opacity"), mOpacity = self->mOpacity, v14 == mOpacity)
         || vabdd_f64(v14, mOpacity) < fabs(mOpacity * 0.000000999999997)))
      {
        LODWORD(v12) = -[NSMutableArray isEqualToArray:](self->mStops, "isEqualToArray:", objc_msgSend(v13, "gradientStops", v6, v5, v18, v19, v7, v8));
        if ((_DWORD)v12)
        {
          v16 = objc_msgSend(v13, "isAdvancedGradient");
          LOBYTE(v12) = v16 ^ -[CRLGradientFill isAdvancedGradient](self, "isAdvancedGradient") ^ 1;
        }
      }
      else
      {
        LOBYTE(v12) = 0;
      }
    }
  }
  return (char)v12;
}

+ (void)sortStopsArray:(id)a3
{
  objc_msgSend(a3, "sortUsingFunction:context:", sub_1003CAA44, 0);
}

+ (id)linearGradientWithStartColor:(id)a3 endColor:(id)a4
{
  Class v6;

  objc_opt_class(a1, a2);
  return objc_msgSend([v6 alloc], "initWithStartColor:endColor:type:", a3, a4, 0);
}

+ (id)linearGradientWithGradientStops:(id)a3
{
  Class v4;

  objc_opt_class(a1, a2);
  return objc_msgSend([v4 alloc], "initWithGradientStops:type:", a3, 0);
}

+ (id)radialGradientWithStartColor:(id)a3 endColor:(id)a4
{
  Class v6;

  objc_opt_class(a1, a2);
  return objc_msgSend([v6 alloc], "initWithStartColor:endColor:type:", a3, a4, 1);
}

+ (id)radialGradientWithGradientStops:(id)a3
{
  Class v4;

  objc_opt_class(a1, a2);
  return objc_msgSend([v4 alloc], "initWithGradientStops:type:", a3, 1);
}

- (NSArray)gradientStops
{
  return &self->mStops->super;
}

- (CRLColor)firstColor
{
  return (CRLColor *)objc_msgSend(-[NSMutableArray firstObject](self->mStops, "firstObject"), "color");
}

- (CRLColor)lastColor
{
  return (CRLColor *)objc_msgSend(-[NSMutableArray lastObject](self->mStops, "lastObject"), "color");
}

- (CGShading)shadingRef
{
  CGShading *result;
  CRLGradientFill *v4;
  CGFunction *v5;
  uint64_t v6;
  CGColorSpace *v7;
  CGShading *Radial;
  CGFunctionCallbacks callbacks;
  CGFloat range[2];
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  CGFloat domain[3];
  CGPoint v18;
  CGPoint v19;
  CGPoint v20;
  CGPoint v21;

  result = self->mShadingRef;
  if (!result)
  {
    range[0] = 0.0;
    v11 = 0;
    v13 = 0;
    range[1] = 1.0;
    v12 = 0x3FF0000000000000;
    v14 = 0x3FF0000000000000;
    v15 = 0;
    v16 = 0x3FF0000000000000;
    *(_OWORD *)domain = xmmword_100EED720;
    *(_QWORD *)&callbacks.version = 0;
    callbacks.evaluate = (CGFunctionEvaluateCallback)sub_1003CA560;
    callbacks.releaseInfo = (CGFunctionReleaseInfoCallback)sub_1003CA600;
    v4 = (CRLGradientFill *)-[CRLGradientFill mutableCopy](self, "mutableCopy");
    if (v4 == self)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101259368);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E2D584();
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DF735C();
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLGradientFill shadingRef]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLGradientFill.m"), 245, 0, "Creating retain cycle between gradient and its shading ref");
    }
    v5 = CGFunctionCreate(v4, 1uLL, domain, 4uLL, range, &callbacks);
    if ((id)-[CRLGradientFill p_shadingColorSpace](self, "p_shadingColorSpace") == (id)1)
      v6 = sub_100011BA0();
    else
      v6 = sub_100011B24();
    v7 = (CGColorSpace *)v6;
    if (-[CRLGradientFill gradientType](self, "gradientType"))
    {
      v18.x = 0.0;
      v18.y = 0.0;
      v21.x = 0.0;
      v21.y = 0.0;
      Radial = CGShadingCreateRadial(v7, v18, 0.0, v21, 100.0, v5, 1, 1);
    }
    else
    {
      v20.x = 100.0;
      v19.x = 0.0;
      v19.y = 0.0;
      v20.y = 0.0;
      Radial = CGShadingCreateAxial(v7, v19, v20, v5, 1, 1);
    }
    self->mShadingRef = Radial;
    CGFunctionRelease(v5);
    return self->mShadingRef;
  }
  return result;
}

- (unint64_t)p_shadingColorSpace
{
  unint64_t result;

  result = self->mShadingColorSpace;
  if (result == 2)
  {
    result = -[CRLGradientFill p_isAnyStopP3](self, "p_isAnyStopP3");
    self->mShadingColorSpace = result;
  }
  return result;
}

- (void)releaseShadingRef
{
  CGShadingRelease(self->mShadingRef);
  self->mShadingRef = 0;
  self->mShadingColorSpace = 2;
}

- (id)p_newColorInShadingColorSpaceFromColor:(id)a3
{
  unint64_t v3;
  id v4;
  CRLColor *v5;
  id v7;
  int v8;
  NSObject *v9;
  CGColorSpace *v10;
  CGColor *CopyByMatchingToColorSpace;
  unsigned int v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint8_t buf[4];
  unsigned int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  id v26;
  __int16 v27;
  unint64_t v28;

  v3 = -[CRLGradientFill p_shadingColorSpace](self, "p_shadingColorSpace");
  v4 = objc_msgSend(a3, "colorRGBSpace");
  if (v3 == 2)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012593A8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E2D638();
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF735C();
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLGradientFill p_newColorInShadingColorSpaceFromColor:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLGradientFill.m"), 286, 0, "Shading color space should not be unspecified.", v14, v15);
    return a3;
  }
  v7 = v4;
  if (v4 != (id)2 && v4 != (id)v3)
  {
    if (v3 == 1)
    {
      if (v4)
      {
        v8 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_1012593E8);
        v9 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100E2D6EC(v8, v9);
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DF735C();
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLGradientFill p_newColorInShadingColorSpaceFromColor:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLGradientFill.m"), 299, 0, "expected equality between %{public}s and %{public}s", "originalColorSpace", "CRLColorRGBSpaceSRGB");
      }
      v10 = (CGColorSpace *)sub_100011BA0();
      CopyByMatchingToColorSpace = CGColorCreateCopyByMatchingToColorSpace(v10, kCGRenderingIntentDefault, (CGColorRef)objc_msgSend(a3, "CGColor"), 0);
      v5 = -[CRLColor initWithCGColor:colorSpace:]([CRLColor alloc], "initWithCGColor:colorSpace:", CopyByMatchingToColorSpace, 1);
      CGColorRelease(CopyByMatchingToColorSpace);
      return v5;
    }
    v12 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101259428);
    v13 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67110402;
      v18 = v12;
      v19 = 2082;
      v20 = "-[CRLGradientFill p_newColorInShadingColorSpaceFromColor:]";
      v21 = 2082;
      v22 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLGradientFill.m";
      v23 = 1024;
      v24 = 307;
      v25 = 2048;
      v26 = v7;
      v27 = 2048;
      v28 = v3;
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Unexpected combination of source (%zu) and destination (%zu) color spaces for gradient shading.", buf, 0x36u);
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101259448);
    }
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF735C();
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLGradientFill p_newColorInShadingColorSpaceFromColor:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLGradientFill.m"), 307, 0, "Unexpected combination of source (%zu) and destination (%zu) color spaces for gradient shading.", v7, v3);
    return a3;
  }
  return a3;
}

- (BOOL)isAdvancedGradient
{
  if (self->mIsAdvancedGradient)
    return 1;
  else
    return -[CRLGradientFill isAdvancedGradientIgnoringFlag](self, "isAdvancedGradientIgnoringFlag");
}

- (BOOL)i_advancedGradientFlag
{
  return self->mIsAdvancedGradient;
}

- (void)i_setAdvancedGradientFlag:(BOOL)a3
{
  self->mIsAdvancedGradient = a3;
}

- (BOOL)isAdvancedGradientIgnoringFlag
{
  double v3;
  double v4;
  double v6;

  if (self->mType)
    return 1;
  if (-[NSMutableArray count](self->mStops, "count") != (id)2)
    return 1;
  objc_msgSend(-[NSMutableArray objectAtIndexedSubscript:](self->mStops, "objectAtIndexedSubscript:", 0), "fraction");
  if (v3 != 0.0)
    return 1;
  objc_msgSend(-[NSMutableArray objectAtIndexedSubscript:](self->mStops, "objectAtIndexedSubscript:", 0), "inflection");
  if (v4 != 0.5 && fabs(v4 + -0.5) >= 5.0e-11)
    return 1;
  objc_msgSend(-[NSMutableArray lastObject](self->mStops, "lastObject"), "fraction");
  return v6 != 1.0;
}

- (id)stopBeforeFraction:(double)a3
{
  double v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  double v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = sub_1003C65EC(a3, 0.0, 1.0);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = -[NSMutableArray reverseObjectEnumerator](self->mStops, "reverseObjectEnumerator", 0);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (!v6)
    return -[NSMutableArray firstObject](self->mStops, "firstObject");
  v7 = v6;
  v8 = *(_QWORD *)v14;
LABEL_3:
  v9 = 0;
  while (1)
  {
    if (*(_QWORD *)v14 != v8)
      objc_enumerationMutation(v5);
    v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v9);
    objc_msgSend(v10, "fraction");
    if (v11 <= v4)
      return v10;
    if (v7 == (id)++v9)
    {
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        goto LABEL_3;
      return -[NSMutableArray firstObject](self->mStops, "firstObject");
    }
  }
}

- (id)stopAfterFraction:(double)a3
{
  double v4;
  double v6;
  NSMutableArray *mStops;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  double v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = sub_1003C65EC(a3, 0.0, 1.0);
  if (v4 == 1.0)
    return -[NSMutableArray lastObject](self->mStops, "lastObject");
  v6 = v4;
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  mStops = self->mStops;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mStops, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (!v8)
    return -[NSMutableArray lastObject](self->mStops, "lastObject");
  v9 = v8;
  v10 = *(_QWORD *)v15;
LABEL_5:
  v11 = 0;
  while (1)
  {
    if (*(_QWORD *)v15 != v10)
      objc_enumerationMutation(mStops);
    v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v11);
    objc_msgSend(v12, "fraction");
    if (v13 > v6)
      return v12;
    if (v9 == (id)++v11)
    {
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mStops, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v9)
        goto LABEL_5;
      return -[NSMutableArray lastObject](self->mStops, "lastObject");
    }
  }
}

- (id)stopAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndexedSubscript:](self->mStops, "objectAtIndexedSubscript:", a3);
}

- (id)p_newColorAtFraction:(double)a3
{
  CRLColor *v4;
  id v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;

  if (a3 == 0.0)
  {
    v4 = -[CRLGradientFill firstColor](self, "firstColor");
    return v4;
  }
  if (a3 == 1.0)
  {
    v4 = -[CRLGradientFill lastColor](self, "lastColor");
    return v4;
  }
  v7 = -[CRLGradientFill stopBeforeFraction:](self, "stopBeforeFraction:", a3);
  v8 = -[CRLGradientFill stopAfterFraction:](self, "stopAfterFraction:", a3);
  if (v7 == v8)
  {
    v4 = (CRLColor *)objc_msgSend(v7, "color");
    return v4;
  }
  v9 = v8;
  objc_msgSend(v7, "fraction");
  v11 = v10;
  objc_msgSend(v9, "fraction");
  v13 = v12 - v11;
  v14 = 0.0;
  if (v13 > 0.001)
  {
    v15 = sub_1003C65EC((a3 - v11) / v13, 0.0, 1.0);
    objc_msgSend(v7, "inflection");
    v17 = sub_1003C65EC(v16, 0.0, 1.0);
    if (v15 >= v17)
    {
      v14 = 0.5;
      if (v17 != 1.0)
        v14 = (v15 - v17) / (1.0 - v17) * 0.5 + 0.5;
    }
    else
    {
      v14 = v15 / v17 * 0.5;
    }
  }
  return objc_msgSend(objc_msgSend(v7, "color"), "newBlendedColorWithFraction:ofColor:", objc_msgSend(v9, "color"), v14);
}

- (void)paintRect:(CGRect)a3 inContext:(CGContext *)a4
{
  unsigned int v5;
  NSObject *v6;
  uint64_t v7;
  Class v8;
  NSObject *v9;
  const char *v10;
  NSString *v11;
  NSString *v12;
  uint64_t v13;
  Class v14;
  uint64_t v15;
  Class v16;
  NSException *v17;
  uint8_t buf[4];
  unsigned int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  NSString *v27;

  v5 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101259468);
  v6 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    objc_opt_class(self, v7);
    *(_DWORD *)buf = 67110146;
    v19 = v5;
    v20 = 2082;
    v21 = "-[CRLGradientFill paintRect:inContext:]";
    v22 = 2082;
    v23 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLGradientFill.m";
    v24 = 1024;
    v25 = 421;
    v26 = 2114;
    v27 = NSStringFromClass(v8);
    _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101259488);
  }
  v9 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    v10 = +[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString");
    *(_DWORD *)buf = 67109378;
    v19 = v5;
    v20 = 2114;
    v21 = v10;
    _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
  }
  v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLGradientFill paintRect:inContext:]");
  v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLGradientFill.m");
  objc_opt_class(self, v13);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 421, 0, "Abstract method not overridden by %{public}@", NSStringFromClass(v14));
  objc_opt_class(self, v15);
  v17 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Abstract method not overridden by %@: %s"), NSStringFromClass(v16), "-[CRLGradientFill paintRect:inContext:]"), 0);
  objc_exception_throw(v17);
}

- (void)paintRect:(CGRect)a3 inContext:(CGContext *)a4 atAngle:(double)a5
{
  unsigned int v6;
  NSObject *v7;
  uint64_t v8;
  Class v9;
  NSObject *v10;
  const char *v11;
  NSString *v12;
  NSString *v13;
  uint64_t v14;
  Class v15;
  uint64_t v16;
  Class v17;
  NSException *v18;
  uint8_t buf[4];
  unsigned int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  NSString *v28;

  v6 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a5);
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_1012594A8);
  v7 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    objc_opt_class(self, v8);
    *(_DWORD *)buf = 67110146;
    v20 = v6;
    v21 = 2082;
    v22 = "-[CRLGradientFill paintRect:inContext:atAngle:]";
    v23 = 2082;
    v24 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLGradientFill.m";
    v25 = 1024;
    v26 = 425;
    v27 = 2114;
    v28 = NSStringFromClass(v9);
    _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012594C8);
  }
  v10 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    v11 = +[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString");
    *(_DWORD *)buf = 67109378;
    v20 = v6;
    v21 = 2114;
    v22 = v11;
    _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
  }
  v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLGradientFill paintRect:inContext:atAngle:]");
  v13 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLGradientFill.m");
  objc_opt_class(self, v14);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 425, 0, "Abstract method not overridden by %{public}@", NSStringFromClass(v15));
  objc_opt_class(self, v16);
  v18 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Abstract method not overridden by %@: %s"), NSStringFromClass(v17), "-[CRLGradientFill paintRect:inContext:atAngle:]"), 0);
  objc_exception_throw(v18);
}

- (void)paintPath:(CGPath *)a3 inContext:(CGContext *)a4
{
  unsigned int v5;
  NSObject *v6;
  uint64_t v7;
  Class v8;
  NSObject *v9;
  const char *v10;
  NSString *v11;
  NSString *v12;
  uint64_t v13;
  Class v14;
  uint64_t v15;
  Class v16;
  NSException *v17;
  uint8_t buf[4];
  unsigned int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  NSString *v27;

  v5 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount", a3, a4);
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_1012594E8);
  v6 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    objc_opt_class(self, v7);
    *(_DWORD *)buf = 67110146;
    v19 = v5;
    v20 = 2082;
    v21 = "-[CRLGradientFill paintPath:inContext:]";
    v22 = 2082;
    v23 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLGradientFill.m";
    v24 = 1024;
    v25 = 429;
    v26 = 2114;
    v27 = NSStringFromClass(v8);
    _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101259508);
  }
  v9 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    v10 = +[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString");
    *(_DWORD *)buf = 67109378;
    v19 = v5;
    v20 = 2114;
    v21 = v10;
    _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
  }
  v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLGradientFill paintPath:inContext:]");
  v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLGradientFill.m");
  objc_opt_class(self, v13);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 429, 0, "Abstract method not overridden by %{public}@", NSStringFromClass(v14));
  objc_opt_class(self, v15);
  v17 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Abstract method not overridden by %@: %s"), NSStringFromClass(v16), "-[CRLGradientFill paintPath:inContext:]"), 0);
  objc_exception_throw(v17);
}

- (CGAffineTransform)centeredRadialTransformInRect:(SEL)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v9;
  double v10;
  CGFloat MidX;
  CGFloat MidY;
  __int128 v13;
  CGAffineTransform *result;
  __int128 v15;
  CGAffineTransform v16;
  CGAffineTransform t1;
  CGAffineTransform v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = CGRectGetWidth(a4);
  v19.origin.x = x;
  v19.origin.y = y;
  v19.size.width = width;
  v19.size.height = height;
  v10 = CGRectGetHeight(v19);
  *(_OWORD *)&retstr->a = 0u;
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  v20.origin.x = x;
  v20.origin.y = y;
  v20.size.width = width;
  v20.size.height = height;
  MidX = CGRectGetMidX(v20);
  v21.origin.x = x;
  v21.origin.y = y;
  v21.size.width = width;
  v21.size.height = height;
  MidY = CGRectGetMidY(v21);
  CGAffineTransformMakeTranslation(retstr, MidX, MidY);
  CGAffineTransformMakeScale(&t1, v9 * 0.00707106781, v10 * 0.00707106781);
  v13 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v16.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v16.c = v13;
  *(_OWORD *)&v16.tx = *(_OWORD *)&retstr->tx;
  result = CGAffineTransformConcat(&v18, &t1, &v16);
  v15 = *(_OWORD *)&v18.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v18.a;
  *(_OWORD *)&retstr->c = v15;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&v18.tx;
  return result;
}

- (BOOL)isOpaque
{
  double v3;
  NSArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  -[CRLGradientFill opacity](self, "opacity");
  if (v3 == 1.0)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v4 = -[CRLGradientFill gradientStops](self, "gradientStops", 0);
    v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v12;
LABEL_4:
      v8 = 0;
      while (1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = objc_msgSend(objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "color"), "isOpaque");
        if (!v9)
          break;
        if (v6 == (id)++v8)
        {
          v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
          LOBYTE(v9) = 1;
          if (v6)
            goto LABEL_4;
          return v9;
        }
      }
    }
    else
    {
      LOBYTE(v9) = 1;
    }
  }
  else
  {
    LOBYTE(v9) = 0;
  }
  return v9;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  CRLMutableGradientFill *v4;

  v4 = -[CRLGradientFill initWithGradientStops:type:opacity:](+[CRLMutableGradientFill allocWithZone:](CRLMutableGradientFill, "allocWithZone:", a3), "initWithGradientStops:type:opacity:", self->mStops, self->mType, self->mOpacity);
  -[CRLGradientFill i_setAdvancedGradientFlag:](v4, "i_setAdvancedGradientFlag:", -[CRLGradientFill i_advancedGradientFlag](self, "i_advancedGradientFlag"));
  return v4;
}

- (BOOL)hasAlpha
{
  id v2;
  id v3;
  id v4;

  v2 = -[NSMutableArray objectEnumerator](self->mStops, "objectEnumerator");
  do
  {
    v3 = objc_msgSend(v2, "nextObject");
    v4 = v3;
  }
  while (v3 && CGColorGetAlpha((CGColorRef)objc_msgSend(objc_msgSend(v3, "color"), "CGColor")) == 1.0);
  return v4 != 0;
}

- (BOOL)p_isAnyStopP3
{
  NSMutableArray *mStops;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  mStops = self->mStops;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mStops, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
LABEL_3:
    v6 = 0;
    while (1)
    {
      if (*(_QWORD *)v9 != v5)
        objc_enumerationMutation(mStops);
      v3 = objc_msgSend(objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6), "color"), "colorRGBSpace");
      if (v3 == (id)1)
        break;
      if (v4 == (id)++v6)
      {
        v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mStops, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
        v4 = v3;
        if (v3)
          goto LABEL_3;
        return (char)v3;
      }
    }
  }
  return (char)v3;
}

- (int64_t)fillType
{
  return 1;
}

- (CGPoint)startPointForPath:(id)a3 andBounds:(CGRect)a4
{
  double x;
  double y;
  CGPoint result;

  +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount", a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101259528);
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100E2D7E8();
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100DF735C();
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLGradientFill startPointForPath:andBounds:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLGradientFill.m"), 516, 0, "Subclasses should override.");
  x = CGPointZero.x;
  y = CGPointZero.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGPoint)endPointForPath:(id)a3 andBounds:(CGRect)a4
{
  double x;
  double y;
  CGPoint result;

  +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount", a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101259568);
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100E2D89C();
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100DF735C();
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLGradientFill endPointForPath:andBounds:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLGradientFill.m"), 521, 0, "Subclasses should override.");
  x = CGPointZero.x;
  y = CGPointZero.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)p_setAlpha:(CGContext *)a3
{
  CGFloat v4;

  -[CRLGradientFill opacity](self, "opacity");
  CGContextSetAlpha(a3, v4);
}

- (CGContext)p_beginBitmapWrapperContextInContext:(CGContext *)a3 returningIntegralBounds:(CGRect *)a4
{
  double x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGContext *v9;
  double v10;
  double v11;
  CGContext *v12;
  CGRect ClipBoundingBox;
  CGRect v15;
  CGRect v16;
  CGRect v17;

  if (!a3)
    return 0;
  ClipBoundingBox = CGContextGetClipBoundingBox(a3);
  x = ClipBoundingBox.origin.x;
  y = ClipBoundingBox.origin.y;
  width = ClipBoundingBox.size.width;
  height = ClipBoundingBox.size.height;
  v15 = CGRectIntegral(ClipBoundingBox);
  if (a4)
    *a4 = v15;
  v16.origin.x = sub_100060FD8(x, y, width, height, 1.0);
  v17 = CGRectIntegral(v16);
  v9 = 0;
  if (v17.size.width > 0.0 && v17.size.height > 0.0)
  {
    v10 = v17.origin.x;
    v11 = v17.origin.y;
    v12 = sub_10040FA64(3, v17.size.width, v17.size.height);
    v9 = v12;
    if (v12)
    {
      CGContextTranslateCTM(v12, -v10, -v11);
      CGContextScaleCTM(v9, 1.0, 1.0);
    }
  }
  return v9;
}

- (void)p_endBitmapWrapperContext:(CGContext *)a3 inContext:(CGContext *)a4 withIntegralBounds:(CGRect)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGImageRef Image;
  CGImage *v12;
  CGRect v13;

  if (a3)
  {
    if (a4)
    {
      height = a5.size.height;
      width = a5.size.width;
      y = a5.origin.y;
      x = a5.origin.x;
      Image = CGBitmapContextCreateImage(a3);
      if (Image)
      {
        v12 = Image;
        CGContextSaveGState(a4);
        v13.origin.x = x;
        v13.origin.y = y;
        v13.size.width = width;
        v13.size.height = height;
        CGContextDrawImage(a4, v13, v12);
        CGContextRestoreGState(a4);
        CGImageRelease(v12);
      }
    }
    CGContextRelease(a3);
  }
}

- (void)p_setGradientStops:(id)a3
{
  NSMutableArray *v5;
  uint64_t v6;
  unsigned int v7;
  id v8;
  id v9;
  CGColorSpace *ColorSpace;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;

  if (self->mStops != a3)
  {
    v5 = +[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:");
    if (objc_msgSend(a3, "count"))
    {
      v6 = 0;
      v7 = 1;
      do
      {
        v8 = objc_msgSend(a3, "objectAtIndexedSubscript:", v6);
        v9 = objc_msgSend(v8, "color");
        ColorSpace = CGColorGetColorSpace((CGColorRef)objc_msgSend(v9, "CGColor"));
        if (CGColorSpaceGetModel(ColorSpace) != kCGColorSpaceModelRGB)
        {
          objc_msgSend(v9, "redComponent");
          v12 = v11;
          objc_msgSend(v9, "greenComponent");
          v14 = v13;
          objc_msgSend(v9, "blueComponent");
          v16 = v15;
          objc_msgSend(v9, "alphaComponent");
          -[NSMutableArray replaceObjectAtIndex:withObject:](v5, "replaceObjectAtIndex:withObject:", v6, objc_msgSend(v8, "gradientStopWithColor:", +[CRLColor colorWithRed:green:blue:alpha:](CRLColor, "colorWithRed:green:blue:alpha:", v12, v14, v16, v17)));
        }
        v6 = v7;
      }
      while ((unint64_t)objc_msgSend(a3, "count") > v7++);
    }
    -[NSMutableArray removeAllObjects](self->mStops, "removeAllObjects");
    -[NSMutableArray addObjectsFromArray:](self->mStops, "addObjectsFromArray:", v5);
    -[CRLGradientFill releaseShadingRef](self, "releaseShadingRef");
  }
}

- (void)p_insertGradientStop:(id)a3
{
  NSMutableArray *mStops;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  id v10;

  if (-[NSMutableArray count](self->mStops, "count"))
  {
    v7 = 0;
    v8 = &v7;
    v9 = 0x2020000000;
    v10 = 0;
    v10 = -[NSMutableArray count](self->mStops, "count");
    mStops = self->mStops;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1003CCCE0;
    v6[3] = &unk_1012595B0;
    v6[4] = a3;
    v6[5] = &v7;
    -[NSMutableArray enumerateObjectsUsingBlock:](mStops, "enumerateObjectsUsingBlock:", v6);
    -[NSMutableArray insertObject:atIndex:](self->mStops, "insertObject:atIndex:", a3, v8[3]);
    -[CRLGradientFill releaseShadingRef](self, "releaseShadingRef");
    _Block_object_dispose(&v7, 8);
  }
  else
  {
    -[NSMutableArray addObject:](self->mStops, "addObject:", a3);
  }
}

- (void)p_removeStop:(id)a3
{
  if ((unint64_t)-[NSMutableArray count](self->mStops, "count") < 3)
    +[NSException raise:format:](NSException, "raise:format:", NSGenericException, CFSTR("Attempted to remove too many gradient stops. Must have at least 2."));
  else
    -[NSMutableArray removeObject:](self->mStops, "removeObject:", a3);
  -[CRLGradientFill releaseShadingRef](self, "releaseShadingRef");
}

- (id)p_removeStopAtIndex:(unint64_t)a3
{
  id v5;

  if ((unint64_t)-[NSMutableArray count](self->mStops, "count") < 3)
    objc_exception_throw(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInvalidArgumentException, CFSTR("Attempted to remove too many gradient stops. Must have at least 2."), 0));
  v5 = -[NSMutableArray objectAtIndexedSubscript:](self->mStops, "objectAtIndexedSubscript:", a3);
  -[NSMutableArray removeObjectAtIndex:](self->mStops, "removeObjectAtIndex:", a3);
  -[CRLGradientFill releaseShadingRef](self, "releaseShadingRef");
  return v5;
}

- (id)p_insertStopAtFraction:(double)a3
{
  return -[CRLGradientFill p_insertStopAtFraction:withColor:](self, "p_insertStopAtFraction:withColor:", -[CRLGradientFill p_newColorAtFraction:](self, "p_newColorAtFraction:"), a3);
}

- (id)p_insertStopAtFraction:(double)a3 withColor:(id)a4
{
  id v5;

  v5 = +[CRLGradientFillStop gradientStopWithColor:fraction:](CRLGradientFillStop, "gradientStopWithColor:fraction:", a4, a3);
  -[CRLGradientFill p_insertGradientStop:](self, "p_insertGradientStop:", v5);
  -[CRLGradientFill releaseShadingRef](self, "releaseShadingRef");
  return v5;
}

- (void)p_reverseStopOrder
{
  char *v3;
  NSMutableArray *v4;
  char *i;
  unint64_t v6;
  char *v7;
  id v8;
  double v9;
  id v10;
  double v11;
  uint64_t v13;
  char *v14;
  id v15;
  double v16;
  char *j;
  CRLGradientFillStop *v18;

  v3 = (char *)-[NSMutableArray count](self->mStops, "count");
  v4 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", v3);
  if (v3)
  {
    for (i = 0; i != v3; ++i)
      -[NSMutableArray addObject:](v4, "addObject:", objc_msgSend(-[NSMutableArray objectAtIndexedSubscript:](self->mStops, "objectAtIndexedSubscript:", i), "mutableCopy"));
  }
  v6 = 1;
  v7 = v3 - 1;
  do
  {
    v8 = -[NSMutableArray objectAtIndexedSubscript:](v4, "objectAtIndexedSubscript:", v6 - 1);
    objc_msgSend(v8, "fraction");
    objc_msgSend(v8, "setFraction:", 1.0 - v9);
    if ((char *)(v6 - 1) != v7)
    {
      v10 = -[NSMutableArray objectAtIndexedSubscript:](v4, "objectAtIndexedSubscript:", v7);
      objc_msgSend(v10, "fraction");
      objc_msgSend(v10, "setFraction:", 1.0 - v11);
      -[NSMutableArray exchangeObjectAtIndex:withObjectAtIndex:](v4, "exchangeObjectAtIndex:withObjectAtIndex:", v6 - 1, v7);
    }
  }
  while (v6++ <= (unint64_t)--v7);
  if (v3 != (char *)1)
  {
    v13 = 0;
    v14 = v3 - 2;
    do
    {
      v15 = -[NSMutableArray objectAtIndexedSubscript:](v4, "objectAtIndexedSubscript:", v13);
      objc_msgSend(-[NSMutableArray objectAtIndexedSubscript:](self->mStops, "objectAtIndexedSubscript:", v14), "inflection");
      objc_msgSend(v15, "setInflection:", 1.0 - v16);
      ++v13;
      --v14;
    }
    while (v14 != (char *)-1);
  }
  objc_msgSend(-[NSMutableArray objectAtIndexedSubscript:](v4, "objectAtIndexedSubscript:", v3 - 1), "setInflection:", 0.5);
  if (v3)
  {
    for (j = 0; j != v3; ++j)
    {
      v18 = -[CRLGradientFillStop initWithGradientStop:]([CRLGradientFillStop alloc], "initWithGradientStop:", -[NSMutableArray objectAtIndexedSubscript:](v4, "objectAtIndexedSubscript:", j));
      -[NSMutableArray setObject:atIndexedSubscript:](self->mStops, "setObject:atIndexedSubscript:", v18, j);

    }
  }
  -[CRLGradientFill releaseShadingRef](self, "releaseShadingRef");
}

- (void)p_evenlyDistributeStops
{
  id v3;
  NSMutableArray *mStops;
  id v5;
  id v6;
  double v7;
  uint64_t v8;
  double v9;
  void *i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v3 = -[NSMutableArray count](self->mStops, "count");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  mStops = self->mStops;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mStops, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 1.0 / (double)((unint64_t)v3 - 1);
    v8 = *(_QWORD *)v12;
    v9 = 0.0;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(mStops);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i), "setFraction:", v9);
        v9 = v7 + v9;
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mStops, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }
  -[CRLGradientFill releaseShadingRef](self, "releaseShadingRef");
}

- (void)p_setGradientType:(unint64_t)a3
{
  self->mType = a3;
  -[CRLGradientFill releaseShadingRef](self, "releaseShadingRef");
}

- (void)p_moveStopAtIndex:(unint64_t)a3 toFraction:(double)a4
{
  id v7;
  CRLGradientFillStop *v8;

  v7 = objc_msgSend(-[NSMutableArray objectAtIndexedSubscript:](self->mStops, "objectAtIndexedSubscript:"), "mutableCopy");
  objc_msgSend(v7, "setFraction:", a4);
  v8 = -[CRLGradientFillStop initWithGradientStop:]([CRLGradientFillStop alloc], "initWithGradientStop:", v7);
  -[NSMutableArray setObject:atIndexedSubscript:](self->mStops, "setObject:atIndexedSubscript:", v8, a3);

  -[CRLGradientFill releaseShadingRef](self, "releaseShadingRef");
}

- (void)p_swapStopAtIndex:(unint64_t)a3 withStopAtIndex:(unint64_t)a4
{
  id v7;
  CRLGradientFillStop *v8;
  CRLGradientFillStop *v9;

  v7 = objc_msgSend(-[NSMutableArray objectAtIndexedSubscript:](self->mStops, "objectAtIndexedSubscript:"), "mutableCopy");
  v8 = -[CRLGradientFillStop initWithGradientStop:]([CRLGradientFillStop alloc], "initWithGradientStop:", objc_msgSend(-[NSMutableArray objectAtIndexedSubscript:](self->mStops, "objectAtIndexedSubscript:", a4), "mutableCopy"));
  v9 = -[CRLGradientFillStop initWithGradientStop:]([CRLGradientFillStop alloc], "initWithGradientStop:", v7);
  -[NSMutableArray setObject:atIndexedSubscript:](self->mStops, "setObject:atIndexedSubscript:", v8, a3);
  -[NSMutableArray setObject:atIndexedSubscript:](self->mStops, "setObject:atIndexedSubscript:", v9, a4);

  -[CRLGradientFill releaseShadingRef](self, "releaseShadingRef");
}

- (void)p_setColorOfStopAtIndex:(unint64_t)a3 toColor:(id)a4
{
  id v7;
  CRLGradientFillStop *v8;

  v7 = objc_msgSend(-[NSMutableArray objectAtIndexedSubscript:](self->mStops, "objectAtIndexedSubscript:"), "mutableCopy");
  objc_msgSend(v7, "setColor:", a4);
  v8 = -[CRLGradientFillStop initWithGradientStop:]([CRLGradientFillStop alloc], "initWithGradientStop:", v7);
  -[NSMutableArray setObject:atIndexedSubscript:](self->mStops, "setObject:atIndexedSubscript:", v8, a3);

  -[CRLGradientFill releaseShadingRef](self, "releaseShadingRef");
}

- (void)p_setInflectionOfStopAtIndex:(unint64_t)a3 toInflection:(double)a4
{
  id v7;
  CRLGradientFillStop *v8;

  v7 = objc_msgSend(-[NSMutableArray objectAtIndexedSubscript:](self->mStops, "objectAtIndexedSubscript:"), "mutableCopy");
  objc_msgSend(v7, "setInflection:", a4);
  v8 = -[CRLGradientFillStop initWithGradientStop:]([CRLGradientFillStop alloc], "initWithGradientStop:", v7);
  -[NSMutableArray setObject:atIndexedSubscript:](self->mStops, "setObject:atIndexedSubscript:", v8, a3);

  -[CRLGradientFill releaseShadingRef](self, "releaseShadingRef");
}

- (unint64_t)gradientType
{
  return self->mType;
}

- (double)opacity
{
  return self->mOpacity;
}

@end
