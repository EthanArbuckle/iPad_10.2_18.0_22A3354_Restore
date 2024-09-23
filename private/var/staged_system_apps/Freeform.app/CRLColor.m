@implementation CRLColor

+ (CRLColor)canvas_darkInsertSwatchBackgroundColor
{
  return +[CRLColor colorWithRed:green:blue:alpha:](CRLColor, "colorWithRed:green:blue:alpha:", 0.6, 0.6, 0.6, 1.0);
}

+ (CRLColor)canvas_darkTranslucentSwatchBackground
{
  return +[CRLColor colorWithRed:green:blue:alpha:](CRLColor, "colorWithRed:green:blue:alpha:", 0.301960784, 0.301960784, 0.301960784, 1.0);
}

- (CGColor)CGColor
{
  CGColorRef v2;

  v2 = CGColorRetain(self->mCGColor);
  return (CGColor *)CFAutorelease(v2);
}

+ (CRLColor)colorWithCGColor:(CGColor *)a3
{
  return (CRLColor *)objc_msgSend(objc_alloc((Class)a1), "initWithCGColor:", a3);
}

+ (CRLColor)colorWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6
{
  return (CRLColor *)objc_msgSend(objc_alloc((Class)a1), "initWithRed:green:blue:alpha:", a3, a4, a5, a6);
}

+ (CRLColor)colorWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6 targetRGBSpace:(unint64_t)a7
{
  return (CRLColor *)objc_msgSend(objc_alloc((Class)a1), "initWithRed:green:blue:alpha:colorSpace:", a7, a3, a4, a5, a6);
}

+ (CRLColor)colorWithR:(int)a3 G:(int)a4 B:(int)a5
{
  return (CRLColor *)objc_msgSend(a1, "colorWithRed:green:blue:alpha:", (double)a3 / 255.0, (double)a4 / 255.0, (double)a5 / 255.0, 1.0);
}

+ (CRLColor)colorWithWhite:(double)a3 alpha:(double)a4
{
  return (CRLColor *)objc_msgSend(objc_alloc((Class)a1), "initWithWhite:alpha:", a3, a4);
}

+ (CRLColor)colorWithHue:(double)a3 saturation:(double)a4 brightness:(double)a5 alpha:(double)a6
{
  return (CRLColor *)objc_msgSend(objc_alloc((Class)a1), "initWithHue:saturation:brightness:alpha:", a3, a4, a5, a6);
}

+ (CRLColor)colorWithHue:(double)a3 saturation:(double)a4 brightness:(double)a5 alpha:(double)a6 targetRGBSpace:(unint64_t)a7
{
  return (CRLColor *)objc_msgSend(objc_alloc((Class)a1), "initWithHue:saturation:brightness:alpha:targetRGBSpace:", a7, a3, a4, a5, a6);
}

+ (CRLColor)colorWithPatternImage:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)a1), "initWithPatternImage:", v4);

  return (CRLColor *)v5;
}

+ (CRLColor)colorWithHexString:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)a1), "initWithHexString:", v4);

  return (CRLColor *)v5;
}

+ (CRLColor)colorWithUIColor:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)a1), "initWithUIColor:", v4);

  return (CRLColor *)v5;
}

+ (id)colorNamed:(id)a3 fallbackColor:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorNamed:](UIColor, "colorNamed:", v5));
  if (v7)
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(+[CRLColor colorWithUIColor:](CRLColor, "colorWithUIColor:", v7));
  }
  else
  {
    v8 = v6;
    v9 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012535A8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E236F0((uint64_t)v5, v9);
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012535C8);
    v10 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLColor colorNamed:fallbackColor:]"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLColor.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 113, 0, "Catalog color (named %@) is missing.", v5);

  }
  return v8;
}

+ (CRLColor)randomColor
{
  CGColor *v2;
  void *v3;

  v2 = sub_100011CA0();
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColor colorWithCGColor:](CRLColor, "colorWithCGColor:", v2));
  CGColorRelease(v2);
  return (CRLColor *)v3;
}

+ (CRLColor)clearColor
{
  return (CRLColor *)objc_msgSend(objc_alloc((Class)a1), "initWithWhite:alpha:", 0.0, 0.0);
}

+ (CRLColor)blackColor
{
  return (CRLColor *)objc_msgSend(objc_alloc((Class)a1), "initWithWhite:alpha:", 0.0, 1.0);
}

+ (CRLColor)whiteColor
{
  return (CRLColor *)objc_msgSend(objc_alloc((Class)a1), "initWithWhite:alpha:", 1.0, 1.0);
}

+ (CRLColor)grayColor
{
  return (CRLColor *)objc_msgSend(objc_alloc((Class)a1), "initWithWhite:alpha:", 0.5, 1.0);
}

+ (CRLColor)lightGrayColor
{
  return (CRLColor *)objc_msgSend(objc_alloc((Class)a1), "initWithWhite:alpha:", 0.667, 1.0);
}

+ (CRLColor)redColor
{
  return (CRLColor *)objc_msgSend(objc_alloc((Class)a1), "initWithRed:green:blue:alpha:", 1.0, 0.0, 0.0, 1.0);
}

+ (CRLColor)greenColor
{
  return (CRLColor *)objc_msgSend(objc_alloc((Class)a1), "initWithRed:green:blue:alpha:", 0.0, 1.0, 0.0, 1.0);
}

+ (CRLColor)blueColor
{
  return (CRLColor *)objc_msgSend(objc_alloc((Class)a1), "initWithRed:green:blue:alpha:", 0.0, 0.0, 1.0, 1.0);
}

+ (CRLColor)cyanColor
{
  return (CRLColor *)objc_msgSend(objc_alloc((Class)a1), "initWithRed:green:blue:alpha:", 0.0, 1.0, 1.0, 1.0);
}

+ (CRLColor)yellowColor
{
  return (CRLColor *)objc_msgSend(objc_alloc((Class)a1), "initWithRed:green:blue:alpha:", 1.0, 1.0, 0.0, 1.0);
}

+ (CRLColor)magentaColor
{
  return (CRLColor *)objc_msgSend(objc_alloc((Class)a1), "initWithRed:green:blue:alpha:", 1.0, 0.0, 1.0, 1.0);
}

+ (CRLColor)orangeColor
{
  return (CRLColor *)objc_msgSend(objc_alloc((Class)a1), "initWithRed:green:blue:alpha:", 1.0, 0.5, 0.0, 1.0);
}

+ (CRLColor)purpleColor
{
  return (CRLColor *)objc_msgSend(objc_alloc((Class)a1), "initWithRed:green:blue:alpha:", 0.5, 0.0, 0.5, 1.0);
}

+ (CRLColor)brownColor
{
  return (CRLColor *)objc_msgSend(objc_alloc((Class)a1), "initWithRed:green:blue:alpha:", 0.6, 0.4, 0.2, 1.0);
}

- (CRLColor)initWithCGColor:(CGColor *)a3 colorSpace:(unint64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  CRLColor *v10;
  void *v11;
  void *v12;
  void *v13;
  CGColorSpace *ColorSpace;
  CGColorSpaceModel Model;
  void *v16;
  void *v17;
  void *v18;
  CGColorSpaceRef v19;
  const void *v20;
  const void *v21;
  const void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  CGColorSpaceRef v27;
  const void *v28;
  const void *v29;
  void *v30;
  CGColorSpaceRef v31;
  const void *v32;
  const void *v33;
  CGColor *Copy;
  const CGFloat *Components;
  size_t NumberOfComponents;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  const CGFloat *v40;
  double *v41;
  double v42;
  float v43;
  CGColorSpace *v44;
  CGColorRef v45;
  CGColorSpace *v47;
  CGColorSpace *v48;
  uint64_t v49;
  objc_super v50;

  if (!a3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012535E8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E23A04();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101253608);
    v7 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLColor initWithCGColor:colorSpace:]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLColor.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 190, 0, "invalid nil value for '%{public}s'", "CGColor");

  }
  v50.receiver = self;
  v50.super_class = (Class)CRLColor;
  v10 = -[CRLColor init](&v50, "init");
  if (v10)
  {
    if (CGColorGetPattern(a3))
    {
      if (a4 != 2)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101253728);
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100E23984();
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101253748);
        v11 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DE7468(v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLColor initWithCGColor:colorSpace:]"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLColor.m"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 261, 0, "If the color has a pattern, its color space should be Unspecified");
LABEL_23:

      }
LABEL_74:
      Copy = CGColorCreateCopy(a3);
      goto LABEL_75;
    }
    ColorSpace = CGColorGetColorSpace(a3);
    Model = CGColorSpaceGetModel(ColorSpace);
    if (a4)
    {
      if (a4 != 2)
      {
        if (a4 != 1)
          goto LABEL_74;
        if (Model != kCGColorSpaceModelRGB)
        {
          +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_101253628);
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            sub_100E23804();
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_101253648);
          v16 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            sub_100DE7468(v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLColor initWithCGColor:colorSpace:]"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLColor.m"));
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v17, v18, 212, 0, "Color specified as P3 isn't even RGB!");

        }
        v19 = CGColorGetColorSpace(a3);
        v20 = (const void *)sub_100011B24();
        if (!CFEqual(v19, v20))
        {
          v21 = (const void *)sub_100011BA0();
          if (!CFEqual(v19, v21))
          {
            v22 = (const void *)sub_100011A10();
            if (!CFEqual(v19, v22))
            {
              +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
              if (qword_10147E370 != -1)
                dispatch_once(&qword_10147E370, &stru_101253668);
              if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
                sub_100E23784();
              if (qword_10147E370 != -1)
                dispatch_once(&qword_10147E370, &stru_101253688);
              v23 = off_1013D9070;
              if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
                sub_100DE7468(v23);
              v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLColor initWithCGColor:colorSpace:]"));
              v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLColor.m"));
              +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 217, 0, "Color specified as P3 isn't P3, sRGB or Device RGB");
              a4 = 1;
              goto LABEL_23;
            }
          }
        }
        goto LABEL_73;
      }
      v31 = CGColorGetColorSpace(a3);
      v32 = (const void *)sub_100011B24();
      if (!CFEqual(v31, v32))
      {
        v33 = (const void *)sub_100011BA0();
        if (!CFEqual(v31, v33))
        {
          v47 = CGColorGetColorSpace(a3);
          if (CGColorSpaceGetModel(v47) == kCGColorSpaceModelRGB && CGColorSpaceIsWideGamutRGB(v47))
          {
            a4 = 1;
            v48 = (CGColorSpace *)sub_100011BA0();
          }
          else
          {
            v48 = (CGColorSpace *)sub_100011B24();
            a4 = 0;
          }
          Copy = CGColorCreateCopyByMatchingToColorSpace(v48, kCGRenderingIntentDefault, a3, 0);
          if (Copy)
          {
LABEL_75:
            v10->mCGColor = Copy;
            v10->mColorRGBSpace = a4;
            if (!CGColorGetPattern(Copy))
            {
              Components = CGColorGetComponents(v10->mCGColor);
              NumberOfComponents = CGColorGetNumberOfComponents(v10->mCGColor);
              v37 = __chkstk_darwin(NumberOfComponents);
              v39 = (v38 + 15) & 0xFFFFFFFFFFFFFFF0;
              v40 = (const CGFloat *)((char *)&v49 - v39);
              if (v37)
              {
                v41 = (double *)((char *)&v49 - v39);
                do
                {
                  v42 = *Components++;
                  v43 = v42;
                  *v41++ = v43;
                  --v37;
                }
                while (v37);
              }
              v44 = CGColorGetColorSpace(v10->mCGColor);
              v45 = CGColorCreate(v44, v40);
              CGColorRelease(v10->mCGColor);
              v10->mCGColor = v45;
            }
            return v10;
          }
          goto LABEL_74;
        }
LABEL_73:
        a4 = 1;
        goto LABEL_74;
      }
    }
    else
    {
      if (Model != kCGColorSpaceModelRGB)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_1012536A8);
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100E23904();
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_1012536C8);
        v24 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DE7468(v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLColor initWithCGColor:colorSpace:]"));
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLColor.m"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v25, v26, 223, 0, "Color specified as sRGB isn't even RGB!");

      }
      v27 = CGColorGetColorSpace(a3);
      v28 = (const void *)sub_100011B24();
      if (!CFEqual(v27, v28))
      {
        v29 = (const void *)sub_100011A10();
        if (!CFEqual(v27, v29))
        {
          +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_1012536E8);
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            sub_100E23884();
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_101253708);
          v30 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            sub_100DE7468(v30);
          v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLColor initWithCGColor:colorSpace:]"));
          v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLColor.m"));
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 227, 0, "Color specified as sRGB isn't sRGB or Device RGB");
          a4 = 0;
          goto LABEL_23;
        }
      }
    }
    a4 = 0;
    goto LABEL_74;
  }
  return v10;
}

- (CRLColor)initWithCGColor:(CGColor *)a3
{
  return -[CRLColor initWithCGColor:colorSpace:](self, "initWithCGColor:colorSpace:", a3, 2);
}

- (CRLColor)initWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6
{
  return -[CRLColor initWithRed:green:blue:alpha:colorSpace:](self, "initWithRed:green:blue:alpha:colorSpace:", 2, a3, a4, a5, a6);
}

- (CRLColor)initWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6 colorSpace:(unint64_t)a7
{
  CGColorSpace *v13;
  CGColor *v14;
  CRLColor *v15;
  CGFloat components[4];

  if (!a7 || a7 == 2)
  {
    v13 = (CGColorSpace *)sub_100011B24();
  }
  else if (a7 == 1)
  {
    v13 = (CGColorSpace *)sub_100011BA0();
  }
  else
  {
    v13 = 0;
  }
  components[0] = a3;
  components[1] = a4;
  components[2] = a5;
  components[3] = a6;
  v14 = CGColorCreate(v13, components);
  v15 = -[CRLColor initWithCGColor:colorSpace:](self, "initWithCGColor:colorSpace:", v14, a7);
  CGColorRelease(v14);
  return v15;
}

- (CRLColor)initWithWhite:(double)a3 alpha:(double)a4
{
  return -[CRLColor initWithRed:green:blue:alpha:](self, "initWithRed:green:blue:alpha:", a3, a3, a3, a4);
}

- (CRLColor)initWithHue:(double)a3 saturation:(double)a4 brightness:(double)a5 alpha:(double)a6
{
  return -[CRLColor initWithHue:saturation:brightness:alpha:targetRGBSpace:](self, "initWithHue:saturation:brightness:alpha:targetRGBSpace:", 2, a3, a4, a5, a6);
}

- (CRLColor)initWithHue:(double)a3 saturation:(double)a4 brightness:(double)a5 alpha:(double)a6 targetRGBSpace:(unint64_t)a7
{
  CGColorSpace *v12;
  CGColor *v13;
  CRLColor *v14;

  if (a7)
  {
    if (a7 == 1)
      v12 = (CGColorSpace *)sub_100011BA0();
    else
      v12 = 0;
  }
  else
  {
    v12 = (CGColorSpace *)sub_100011B24();
  }
  v13 = sub_100012028(v12, a3, a4, a5, a6);
  v14 = -[CRLColor initWithCGColor:](self, "initWithCGColor:", v13);
  CGColorRelease(v13);
  return v14;
}

- (CRLColor)initWithCyan:(double)a3 magenta:(double)a4 yellow:(double)a5 black:(double)a6 alpha:(double)a7
{
  CGColorSpace *v8;
  CGColor *v9;
  CRLColor *v10;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v8 = (CGColorSpace *)sub_100011A6C();
  v9 = CGColorCreate(v8, &v12);
  v10 = -[CRLColor initWithCGColor:](self, "initWithCGColor:", v9, *(_QWORD *)&v12, *(_QWORD *)&v13, *(_QWORD *)&v14, *(_QWORD *)&v15, *(_QWORD *)&v16);
  CGColorRelease(v9);
  return v10;
}

- (CRLColor)initWithPatternImage:(id)a3
{
  id v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGColor *v9;
  CRLColor *v10;
  void *v11;
  void *v12;
  void *v13;
  CGAffineTransform v15;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    memset(&v15, 0, sizeof(v15));
    objc_msgSend(v4, "scale");
    v7 = 1.0 / v6;
    objc_msgSend(v5, "scale");
    CGAffineTransformMakeScale(&v15, v7, 1.0 / v8);
    v9 = sub_100011F94((CGImage *)objc_msgSend(v5, "CGImage"), (__int128 *)&v15);
    v10 = -[CRLColor initWithCGColor:](self, "initWithCGColor:", v9);
    CGColorRelease(v9);
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101253768);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E23A94();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101253788);
    v11 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLColor initWithPatternImage:]"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLColor.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 366, 0, "invalid nil value for '%{public}s'", "patternImage");

    v10 = 0;
  }

  return v10;
}

- (CRLColor)initWithHexString:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  char *v7;
  void *v8;
  char *v9;
  void *v10;
  char *v11;
  CRLColor *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "uppercaseString"));
  if (objc_msgSend(v4, "rangeOfString:options:", CFSTR("#[\\dA-F]{6}"), 1024) || v5 != objc_msgSend(v4, "length"))
  {
    v13 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012537A8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E23B24((uint64_t)v4, v13);
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012537C8);
    v14 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLColor initWithHexString:]"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLColor.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v16, 384, 0, "Invalid hex string: %@", v4);

    v12 = 0;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "substringWithRange:", 1, 2));
    v7 = sub_100341E54((uint64_t)v6, v6);

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "substringWithRange:", 3, 2));
    v9 = sub_100341E54((uint64_t)v8, v8);

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "substringWithRange:", 5, 2));
    v11 = sub_100341E54((uint64_t)v10, v10);

    v12 = -[CRLColor initWithRed:green:blue:alpha:](self, "initWithRed:green:blue:alpha:", (float)((float)(unint64_t)v7 / 255.0), (float)((float)(unint64_t)v9 / 255.0), (float)((float)(unint64_t)v11 / 255.0), 1.0);
  }

  return v12;
}

- (CRLColor)initWithUIColor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  CGColor *v9;
  CRLColor *v10;
  CGColorSpace *v11;
  CGColor *CopyByMatchingToColorSpace;
  CGColorSpace *v13;
  CGColor *v14;
  CGColorSpace *v15;
  CGColor *v16;
  void *v17;
  void *v18;
  CGColor *v19;
  CRLColor *v20;

  v4 = a3;
  if (!v4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012537E8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E23BB8();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101253808);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLColor initWithUIColor:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLColor.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 403, 0, "invalid nil value for '%{public}s'", "uiColor");

  }
  v8 = objc_retainAutorelease(v4);
  v9 = (CGColor *)objc_msgSend(v8, "CGColor");
  if (CGColorGetPattern(v9))
  {
    v10 = -[CRLColor initWithCGColor:](self, "initWithCGColor:", v9);
  }
  else
  {
    v11 = (CGColorSpace *)sub_100011BA0();
    CopyByMatchingToColorSpace = CGColorCreateCopyByMatchingToColorSpace(v11, kCGRenderingIntentDefault, v9, 0);
    v13 = (CGColorSpace *)sub_100011B24();
    v14 = CGColorCreateCopyByMatchingToColorSpace(v13, kCGRenderingIntentDefault, CopyByMatchingToColorSpace, 0);
    v15 = (CGColorSpace *)sub_100011BA0();
    v16 = CGColorCreateCopyByMatchingToColorSpace(v15, kCGRenderingIntentDefault, v14, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColor colorWithCGColor:](CRLColor, "colorWithCGColor:", CopyByMatchingToColorSpace));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColor colorWithCGColor:](CRLColor, "colorWithCGColor:", v16));
    if (objc_msgSend(v17, "isEqualWithTolerance:", v18))
      v19 = v14;
    else
      v19 = CopyByMatchingToColorSpace;
    v20 = -[CRLColor initWithCGColor:](self, "initWithCGColor:", v19);
    CGColorRelease(CopyByMatchingToColorSpace);
    CGColorRelease(v14);
    CGColorRelease(v16);
    v10 = v20;

  }
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  CGColorRelease(self->mCGColor);
  v3.receiver = self;
  v3.super_class = (Class)CRLColor;
  -[CRLColor dealloc](&v3, "dealloc");
}

- (unint64_t)hash
{
  return 5;
}

- (BOOL)isAlmostEqualToColor:(id)a3
{
  return -[CRLColor p_isEqualToColor:withTolerance:](self, "p_isEqualToColor:withTolerance:", a3, 0.00999999978);
}

- (BOOL)isEqualWithTolerance:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;

  v4 = a3;
  objc_opt_class(CRLColor, v5);
  v7 = sub_100221D0C(v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  LOBYTE(self) = -[CRLColor p_isEqualToColor:withTolerance:](self, "p_isEqualToColor:withTolerance:", v8, 0.001953125);
  return (char)self;
}

- (double)redComponent
{
  double result;

  -[CRLColor p_rgbComponentWithIndex:](self, "p_rgbComponentWithIndex:", 0);
  return result;
}

- (double)greenComponent
{
  double result;

  -[CRLColor p_rgbComponentWithIndex:](self, "p_rgbComponentWithIndex:", 1);
  return result;
}

- (double)blueComponent
{
  double result;

  -[CRLColor p_rgbComponentWithIndex:](self, "p_rgbComponentWithIndex:", 2);
  return result;
}

- (double)alphaComponent
{
  return CGColorGetAlpha(-[CRLColor CGColor](self, "CGColor"));
}

- (void)getRGBAComponents:(double *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  if (a3)
  {
    -[CRLColor redComponent](self, "redComponent");
    *(_QWORD *)a3 = v5;
    -[CRLColor greenComponent](self, "greenComponent");
    *((_QWORD *)a3 + 1) = v6;
    -[CRLColor blueComponent](self, "blueComponent");
    *((_QWORD *)a3 + 2) = v7;
    -[CRLColor alphaComponent](self, "alphaComponent");
    *((_QWORD *)a3 + 3) = v8;
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101253828);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E23C48();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101253848);
    v9 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLColor getRGBAComponents:]"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLColor.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 507, 0, "rgbaComponents is NULL!");

  }
}

- (double)hueComponent
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  uint64_t v9;
  uint64_t v10;
  double v11;

  v10 = 0;
  v11 = 0.0;
  v9 = 0;
  -[CRLColor redComponent](self, "redComponent");
  v4 = v3;
  -[CRLColor greenComponent](self, "greenComponent");
  v6 = v5;
  -[CRLColor blueComponent](self, "blueComponent");
  sub_100012190(&v11, (double *)&v10, (double *)&v9, v4, v6, v7);
  return v11;
}

- (double)saturationComponent
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  uint64_t v9;
  double v10;
  uint64_t v11;

  v10 = 0.0;
  v11 = 0;
  v9 = 0;
  -[CRLColor redComponent](self, "redComponent");
  v4 = v3;
  -[CRLColor greenComponent](self, "greenComponent");
  v6 = v5;
  -[CRLColor blueComponent](self, "blueComponent");
  sub_100012190((double *)&v11, &v10, (double *)&v9, v4, v6, v7);
  return v10;
}

- (double)brightnessComponent
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v9;
  uint64_t v10;
  uint64_t v11;

  v10 = 0;
  v11 = 0;
  v9 = 0.0;
  -[CRLColor redComponent](self, "redComponent");
  v4 = v3;
  -[CRLColor greenComponent](self, "greenComponent");
  v6 = v5;
  -[CRLColor blueComponent](self, "blueComponent");
  sub_100012190((double *)&v11, (double *)&v10, &v9, v4, v6, v7);
  return v9;
}

- (UIColor)UIColor
{
  return +[UIColor colorWithCGColor:](UIColor, "colorWithCGColor:", -[CRLColor CGColor](self, "CGColor"));
}

- (CIColor)CIColor
{
  id v3;
  void *v4;
  id v5;

  v3 = objc_alloc((Class)CIColor);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLColor UIColor](self, "UIColor"));
  v5 = objc_msgSend(v3, "initWithColor:", v4);

  return (CIColor *)v5;
}

- (CRLColor)grayscaleColor
{
  const CGFloat *Components;
  CGColorSpace *ColorSpace;
  CGColorSpaceModel Model;
  CRLColor *v6;
  void *v7;
  void *v8;
  void *v9;

  Components = CGColorGetComponents(-[CRLColor CGColor](self, "CGColor"));
  ColorSpace = CGColorGetColorSpace(-[CRLColor CGColor](self, "CGColor"));
  Model = CGColorSpaceGetModel(ColorSpace);
  if (Model)
  {
    if (Model == kCGColorSpaceModelRGB)
    {
      v6 = (CRLColor *)objc_claimAutoreleasedReturnValue(+[CRLColor colorWithWhite:alpha:](CRLColor, "colorWithWhite:alpha:", Components[1] * 0.59 + *Components * 0.3 + Components[2] * 0.11, Components[3]));
      if (v6)
        return v6;
    }
  }
  else
  {
    v6 = self;
    if (v6)
      return v6;
  }
  +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101253868);
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100E23CC8();
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101253888);
  v7 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100DE7468(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLColor grayscaleColor]"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLColor.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 578, 0, "invalid nil value for '%{public}s'", "grayscale");

  v6 = 0;
  return v6;
}

- (CRLColor)invertedColor
{
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const CGFloat *Components;

  if (CGColorGetNumberOfComponents(-[CRLColor CGColor](self, "CGColor")) != 4)
  {
    v3 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012538A8);
    v4 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E23D58(v4, (uint64_t)self, v3);
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012538C8);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLColor invertedColor]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLColor.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 583, 0, "Wrong number of components while inverting color. %zi instead of 4", CGColorGetNumberOfComponents(-[CRLColor CGColor](self, "CGColor")));

  }
  Components = CGColorGetComponents(-[CRLColor CGColor](self, "CGColor"));
  return (CRLColor *)(id)objc_claimAutoreleasedReturnValue(+[CRLColor colorWithRed:green:blue:alpha:](CRLColor, "colorWithRed:green:blue:alpha:", 1.0 - *Components, 1.0 - Components[1], 1.0 - Components[2], Components[3]));
}

- (CRLColor)colorWithAlphaComponent:(double)a3
{
  CGColor *CopyWithAlpha;
  void *v4;

  CopyWithAlpha = CGColorCreateCopyWithAlpha(self->mCGColor, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColor colorWithCGColor:](CRLColor, "colorWithCGColor:", CopyWithAlpha));
  CGColorRelease(CopyWithAlpha);
  return (CRLColor *)v4;
}

- (double)luminance
{
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const CGFloat *Components;
  double result;

  if (CGColorGetNumberOfComponents(-[CRLColor CGColor](self, "CGColor")) != 4)
  {
    v3 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012538E8);
    v4 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E23E08(v4, (uint64_t)self, v3);
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101253908);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLColor luminance]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLColor.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 598, 0, "Wrong number of components to calculate luminance. Got %zi instead of 4.", CGColorGetNumberOfComponents(-[CRLColor CGColor](self, "CGColor")));

  }
  Components = CGColorGetComponents(-[CRLColor CGColor](self, "CGColor"));
  result = fmax(Components[1] * 0.715200007 + *Components * 0.212599993 + Components[2] * 0.0722000003 * Components[3], 0.0);
  if (result > 1.0)
    return 1.0;
  return result;
}

- (double)relativeLuminance
{
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const CGFloat *Components;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;

  if (CGColorGetNumberOfComponents(-[CRLColor CGColor](self, "CGColor")) != 4)
  {
    v3 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101253928);
    v4 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E23EB8(v4, (uint64_t)self, v3);
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101253948);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLColor relativeLuminance]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLColor.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 608, 0, "Wrong number of components to calculate relative luminance. Got %zi instead of 4.", CGColorGetNumberOfComponents(-[CRLColor CGColor](self, "CGColor")));

  }
  Components = CGColorGetComponents(-[CRLColor CGColor](self, "CGColor"));
  v9 = *Components;
  v10 = Components[1];
  v11 = Components[2];
  if (*Components <= 0.03928)
    v12 = v9 / 12.92;
  else
    v12 = pow((v9 + 0.055) / 1.055, 2.4);
  if (v10 <= 0.03928)
    v13 = v10 / 12.92;
  else
    v13 = pow((v10 + 0.055) / 1.055, 2.4);
  if (v11 <= 0.03928)
    v14 = v11 / 12.92;
  else
    v14 = pow((v11 + 0.055) / 1.055, 2.4);
  return v13 * 0.7152 + v12 * 0.2126 + v14 * 0.0722;
}

- (BOOL)isOpaque
{
  return CGColorGetAlpha(-[CRLColor CGColor](self, "CGColor")) == 1.0;
}

- (BOOL)isClear
{
  return CGColorGetAlpha(-[CRLColor CGColor](self, "CGColor")) == 0.0;
}

- (BOOL)isNearlyWhite
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v9;
  double v10;
  uint64_t v11;

  v10 = 0.0;
  v11 = 0;
  v9 = 0.0;
  -[CRLColor redComponent](self, "redComponent");
  v4 = v3;
  -[CRLColor greenComponent](self, "greenComponent");
  v6 = v5;
  -[CRLColor blueComponent](self, "blueComponent");
  sub_100012190((double *)&v11, &v9, &v10, v4, v6, v7);
  return v9 < 0.1 && v10 > 0.9;
}

- (BOOL)requiresOutlineOnBackgroundWithAppearance:(unint64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v13;
  double v14;
  uint64_t v15;

  v14 = 0.0;
  v15 = 0;
  v13 = 0.0;
  -[CRLColor redComponent](self, "redComponent");
  v6 = v5;
  -[CRLColor greenComponent](self, "greenComponent");
  v8 = v7;
  -[CRLColor blueComponent](self, "blueComponent");
  v10 = sub_100012190((double *)&v15, &v13, &v14, v6, v8, v9);
  switch(a3)
  {
    case 1uLL:
      return v13 < 0.200000003 && v14 > 0.899999976;
    case 3uLL:
      return sub_10001250C(-[CRLColor CGColor](self, "CGColor", v10)) <= 0.300000012;
    case 2uLL:
      v11 = sub_10001250C(-[CRLColor CGColor](self, "CGColor", v10));
      return v11 <= 0.349999994 && v11 >= 0.0500000007;
    default:
      return 0;
  }
}

- (double)contrastRatioWithColor:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  v4 = a3;
  -[CRLColor relativeLuminance](self, "relativeLuminance");
  v6 = v5;
  objc_msgSend(v4, "relativeLuminance");
  v8 = v7;

  if (v8 >= v6)
    v9 = v8;
  else
    v9 = v6;
  if (v8 >= v6)
    v10 = v6;
  else
    v10 = v8;
  return (v9 + 0.05) / (v10 + 0.05);
}

- (BOOL)improvesContrastWhenDisplayedOverAlternateBackgroundColor:(id)a3 ratherThanStandardBackgroundColor:(id)a4 inScenario:(unint64_t)a5
{
  id v8;
  id v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  unsigned __int8 v22;

  v8 = a3;
  v9 = a4;
  if (a5 >= 4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101253968);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E23F68();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101253988);
    v12 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLColor improvesContrastWhenDisplayedOverAlternateBackgroundColor:ratherThanStandardBackgroundColor:inScenario:]"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLColor.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 708, 0, "Unhandled contrast scenario (%zu).", a5);

    v10 = 0.0;
    v11 = 0.0;
  }
  else
  {
    v10 = dbl_100EEF690[a5];
    v11 = dbl_100EEF6B0[a5];
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLColor colorByCompositingSourceOverDestinationColor:](self, "colorByCompositingSourceOverDestinationColor:", v9));
  objc_msgSend(v15, "contrastRatioWithColor:", v9);
  if (v16 >= v10)
  {
    v22 = 0;
  }
  else
  {
    v17 = v16;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRLColor colorByCompositingSourceOverDestinationColor:](self, "colorByCompositingSourceOverDestinationColor:", v8));
    objc_msgSend(v18, "contrastRatioWithColor:", v8);
    if (v19 <= v17)
    {
      v22 = 0;
    }
    else if (v19 >= v11)
    {
      v22 = 1;
    }
    else
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRLColor colorWithAlphaComponent:](self, "colorWithAlphaComponent:", 1.0));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "colorWithAlphaComponent:", 1.0));
      v22 = objc_msgSend(v20, "isAlmostEqualToColor:", v21);

    }
  }

  return v22;
}

- (id)blendedColorWithFraction:(double)a3 ofColor:(id)a4
{
  return -[CRLColor newBlendedColorWithFraction:ofColor:](self, "newBlendedColorWithFraction:ofColor:", a4, a3);
}

- (id)newBlendedColorWithFraction:(double)a3 ofColor:(id)a4
{
  id v6;
  void *v7;
  CRLColor *v8;
  id mColorRGBSpace;
  unint64_t v10;
  CRLColor *v11;
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
  double v27;
  CRLColor *v28;
  double v29;
  double v30;
  double v31;
  uint64_t v32;
  CRLColor *v33;
  CGColorSpace *v34;
  CGColor *CopyByMatchingToColorSpace;
  CRLColor *v36;
  CGColorSpace *v37;
  CGColor *v38;
  CRLColor *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  CRLColor *v55;
  CRLColor *v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;

  v6 = a4;
  v7 = v6;
  if (self->mColorRGBSpace == 2)
    goto LABEL_2;
  if (objc_msgSend(v6, "colorRGBSpace") == (id)2)
  {
    v8 = v7;
    goto LABEL_18;
  }
  mColorRGBSpace = (id)self->mColorRGBSpace;
  if (mColorRGBSpace == objc_msgSend(v7, "colorRGBSpace"))
  {
    v10 = self->mColorRGBSpace;
    if (v10 == 1)
    {
      v56 = [CRLColor alloc];
      -[CRLColor redComponent](self, "redComponent");
      v58 = v57;
      objc_msgSend(v7, "redComponent");
      v60 = sub_1003C660C(v58, v59, a3);
      -[CRLColor greenComponent](self, "greenComponent");
      v62 = v61;
      objc_msgSend(v7, "greenComponent");
      v64 = sub_1003C660C(v62, v63, a3);
      -[CRLColor blueComponent](self, "blueComponent");
      v66 = v65;
      objc_msgSend(v7, "blueComponent");
      v68 = sub_1003C660C(v66, v67, a3);
      -[CRLColor alphaComponent](self, "alphaComponent");
      v70 = v69;
      objc_msgSend(v7, "alphaComponent");
      v27 = sub_1003C660C(v70, v71, a3);
      v28 = v56;
      v29 = v60;
      v30 = v64;
      v31 = v68;
      v32 = 1;
    }
    else
    {
      if (v10)
      {
LABEL_2:
        v8 = self;
LABEL_18:
        v55 = v8;
        goto LABEL_19;
      }
      v11 = [CRLColor alloc];
      -[CRLColor redComponent](self, "redComponent");
      v13 = v12;
      objc_msgSend(v7, "redComponent");
      v15 = sub_1003C660C(v13, v14, a3);
      -[CRLColor greenComponent](self, "greenComponent");
      v17 = v16;
      objc_msgSend(v7, "greenComponent");
      v19 = sub_1003C660C(v17, v18, a3);
      -[CRLColor blueComponent](self, "blueComponent");
      v21 = v20;
      objc_msgSend(v7, "blueComponent");
      v23 = sub_1003C660C(v21, v22, a3);
      -[CRLColor alphaComponent](self, "alphaComponent");
      v25 = v24;
      objc_msgSend(v7, "alphaComponent");
      v27 = sub_1003C660C(v25, v26, a3);
      v28 = v11;
      v29 = v15;
      v30 = v19;
      v31 = v23;
      v32 = 0;
    }
    v8 = -[CRLColor initWithRed:green:blue:alpha:colorSpace:](v28, "initWithRed:green:blue:alpha:colorSpace:", v32, v29, v30, v31, v27);
    goto LABEL_18;
  }
  if ((id)-[CRLColor colorRGBSpace](self, "colorRGBSpace") == (id)1)
  {
    v33 = self;
  }
  else
  {
    v34 = (CGColorSpace *)sub_100011BA0();
    CopyByMatchingToColorSpace = CGColorCreateCopyByMatchingToColorSpace(v34, kCGRenderingIntentDefault, -[CRLColor CGColor](self, "CGColor"), 0);
    v33 = -[CRLColor initWithCGColor:colorSpace:]([CRLColor alloc], "initWithCGColor:colorSpace:", CopyByMatchingToColorSpace, 1);
    CGColorRelease(CopyByMatchingToColorSpace);
  }
  if (objc_msgSend(v7, "colorRGBSpace") == (id)1)
  {
    v36 = v7;
  }
  else
  {
    v37 = (CGColorSpace *)sub_100011BA0();
    v38 = CGColorCreateCopyByMatchingToColorSpace(v37, kCGRenderingIntentDefault, (CGColorRef)objc_msgSend(v7, "CGColor"), 0);
    v36 = -[CRLColor initWithCGColor:colorSpace:]([CRLColor alloc], "initWithCGColor:colorSpace:", v38, 1);
    CGColorRelease(v38);
  }
  v39 = [CRLColor alloc];
  -[CRLColor redComponent](v33, "redComponent");
  v41 = v40;
  -[CRLColor redComponent](v36, "redComponent");
  v43 = sub_1003C660C(v41, v42, a3);
  -[CRLColor greenComponent](v33, "greenComponent");
  v45 = v44;
  -[CRLColor greenComponent](v36, "greenComponent");
  v47 = sub_1003C660C(v45, v46, a3);
  -[CRLColor blueComponent](v33, "blueComponent");
  v49 = v48;
  -[CRLColor blueComponent](v36, "blueComponent");
  v51 = sub_1003C660C(v49, v50, a3);
  -[CRLColor alphaComponent](v33, "alphaComponent");
  v53 = v52;
  -[CRLColor alphaComponent](v36, "alphaComponent");
  v55 = -[CRLColor initWithRed:green:blue:alpha:colorSpace:](v39, "initWithRed:green:blue:alpha:colorSpace:", 1, v43, v47, v51, sub_1003C660C(v53, v54, a3));

LABEL_19:
  return v55;
}

- (id)colorByCompositingSourceOverDestinationColor:(id)a3
{
  id v4;
  double v5;
  CRLColor *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CRLColor *v13;
  double v15[3];
  double v16;
  double v17[3];
  double v18;

  v4 = a3;
  -[CRLColor alphaComponent](self, "alphaComponent");
  if (v5 == 1.0)
  {
    v6 = self;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLColor p_colorForComparingWithColor:](self, "p_colorForComparingWithColor:", v4));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "p_colorForComparingWithColor:", self));

    objc_msgSend(v7, "getRGBAComponents:", v17);
    objc_msgSend(v8, "getRGBAComponents:", v15);
    v9 = v18;
    v10 = v16;
    v11 = 1.0 - v18;
    v12 = v18 + v16 * (1.0 - v18);
    v13 = [CRLColor alloc];
    v6 = -[CRLColor initWithRed:green:blue:alpha:colorSpace:](v13, "initWithRed:green:blue:alpha:colorSpace:", objc_msgSend(v7, "colorRGBSpace"), (v11 * (v10 * v15[0]) + v17[0] * v9) / v12, (v11 * (v10 * v15[1]) + v17[1] * v9) / v12, (v11 * (v10 * v15[2]) + v17[2] * v9) / v12, v12);

    v4 = v8;
  }

  return v6;
}

- (void)paintRect:(CGRect)a3 inContext:(CGContext *)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  CGContextSaveGState(a4);
  CGContextSetFillColorWithColor(a4, self->mCGColor);
  v10.origin.x = x;
  v10.origin.y = y;
  v10.size.width = width;
  v10.size.height = height;
  CGContextFillRect(a4, v10);
  CGContextRestoreGState(a4);
}

- (void)paintPath:(CGPath *)a3 inContext:(CGContext *)a4
{
  CGContextSaveGState(a4);
  CGContextSetFillColorWithColor(a4, self->mCGColor);
  CGContextAddPath(a4, a3);
  CGContextFillPath(a4);
  CGContextRestoreGState(a4);
}

- (NSString)hexString
{
  double v3;
  uint64_t v4;
  double v5;
  uint64_t v6;
  double v7;

  -[CRLColor redComponent](self, "redComponent");
  v4 = (int)(v3 * 255.0);
  -[CRLColor greenComponent](self, "greenComponent");
  v6 = (int)(v5 * 255.0);
  -[CRLColor blueComponent](self, "blueComponent");
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("#%02X%02X%02X"), v4, v6, (int)(v7 * 255.0));
}

+ (NSArray)readableTypeIdentifiersForItemProvider
{
  return (NSArray *)+[UIColor readableTypeIdentifiersForItemProvider](UIColor, "readableTypeIdentifiersForItemProvider");
}

+ (id)objectWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5
{
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor objectWithItemProviderData:typeIdentifier:error:](UIColor, "objectWithItemProviderData:typeIdentifier:error:", a3, a4, a5));
  if (v5)
  {
    v6 = objc_retainAutorelease(v5);
    if (CGColorGetPattern((CGColorRef)objc_msgSend(v6, "CGColor")))
    {
      v7 = objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));

      v6 = (id)v7;
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColor colorWithUIColor:](CRLColor, "colorWithUIColor:", v6));
  }
  else
  {
    v6 = 0;
    v8 = 0;
  }

  return v8;
}

- (BOOL)p_isEqualToColor:(id)a3 withTolerance:(double)a4
{
  id v6;
  void *v7;
  id mColorRGBSpace;
  CGColor *v9;
  CGColor *v10;
  CGColor *v11;
  _QWORD *v12;
  CGColorSpace *ColorSpace;
  CGColorSpaceModel Model;
  CGColorSpace *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  _QWORD v21[5];

  v6 = a3;
  v7 = v6;
  if (v6
    && (mColorRGBSpace = (id)self->mColorRGBSpace, mColorRGBSpace == objc_msgSend(v6, "colorRGBSpace"))
    && objc_msgSend(v7, "CGColor"))
  {
    v9 = -[CRLColor CGColor](self, "CGColor");
    v10 = (CGColor *)objc_msgSend(v7, "CGColor");
    if (v9 == v10)
    {
      v19 = 1;
    }
    else
    {
      v11 = v10;
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_100343E3C;
      v21[3] = &unk_1012539E8;
      *(double *)&v21[4] = a4;
      v12 = objc_retainBlock(v21);
      ColorSpace = CGColorGetColorSpace(v9);
      Model = CGColorSpaceGetModel(ColorSpace);
      v15 = CGColorGetColorSpace(v11);
      if (Model != CGColorSpaceGetModel(v15))
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101253A08);
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100E24000();
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101253A28);
        v16 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DE7468(v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLColor p_isEqualToColor:withTolerance:]"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLColor.m"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v17, v18, 956, 0, "CRLColors should always be RGB! Comparing two with different color models.");

      }
      if (CFEqual(ColorSpace, v15))
        v19 = ((uint64_t (*)(_QWORD *, CGColor *, CGColor *))v12[2])(v12, v9, v11);
      else
        v19 = 0;

    }
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (double)p_rgbComponentWithIndex:(unsigned __int8)a3
{
  int v3;
  const CGFloat *Components;
  CGColorSpace *ColorSpace;
  CGColorSpaceModel Model;
  double result;

  v3 = a3;
  Components = CGColorGetComponents(-[CRLColor CGColor](self, "CGColor"));
  ColorSpace = CGColorGetColorSpace(-[CRLColor CGColor](self, "CGColor"));
  Model = CGColorSpaceGetModel(ColorSpace);
  if (Model == kCGColorSpaceModelMonochrome)
    return *Components;
  if (Model == kCGColorSpaceModelCMYK)
    return 1.0 - fmin(Components[3] + Components[v3] * (1.0 - Components[3]), 1.0);
  result = 0.0;
  if (Model == kCGColorSpaceModelRGB)
    return Components[v3];
  return result;
}

- (id)p_colorForComparingWithColor:(id)a3
{
  id v4;
  unint64_t v5;
  id v6;
  CRLColor *v7;
  CGColorSpace *v8;
  CGColor *CopyByMatchingToColorSpace;
  CRLColor *v10;

  v4 = a3;
  v5 = -[CRLColor colorRGBSpace](self, "colorRGBSpace");
  v6 = objc_msgSend(v4, "colorRGBSpace");

  v7 = self;
  if (!v5 && v6 == (id)1)
  {
    v8 = (CGColorSpace *)sub_100011BA0();
    CopyByMatchingToColorSpace = CGColorCreateCopyByMatchingToColorSpace(v8, kCGRenderingIntentDefault, v7->mCGColor, 0);
    v10 = -[CRLColor initWithCGColor:colorSpace:]([CRLColor alloc], "initWithCGColor:colorSpace:", CopyByMatchingToColorSpace, 1);

    CGColorRelease(CopyByMatchingToColorSpace);
    v7 = v10;
  }
  return v7;
}

- (BOOL)p_colorIsEqualToColor:(id)a3 inColorRGBSpace:(unint64_t)a4 withTolerance:(double)a5
{
  id v8;
  CRLColor *v9;
  CGColorSpace *v10;
  CGColor *CopyByMatchingToColorSpace;
  CRLColor *v12;
  CRLColor *v13;
  CRLColor *v14;
  CGColor *v15;
  unsigned __int8 v16;

  v8 = a3;
  v9 = self;
  v10 = (CGColorSpace *)sub_100344358(a4);
  if (-[CRLColor colorRGBSpace](v9, "colorRGBSpace") != a4)
  {
    CopyByMatchingToColorSpace = CGColorCreateCopyByMatchingToColorSpace(v10, kCGRenderingIntentDefault, v9->mCGColor, 0);
    v12 = -[CRLColor initWithCGColor:colorSpace:]([CRLColor alloc], "initWithCGColor:colorSpace:", CopyByMatchingToColorSpace, a4);

    CGColorRelease(CopyByMatchingToColorSpace);
    v9 = v12;
  }
  v13 = (CRLColor *)v8;
  v14 = v13;
  if (-[CRLColor colorRGBSpace](v13, "colorRGBSpace") != a4)
  {
    v15 = CGColorCreateCopyByMatchingToColorSpace(v10, kCGRenderingIntentDefault, -[CRLColor CGColor](v13, "CGColor"), 0);
    v14 = -[CRLColor initWithCGColor:colorSpace:]([CRLColor alloc], "initWithCGColor:colorSpace:", v15, a4);

    CGColorRelease(v15);
  }
  v16 = -[CRLColor p_isEqualToColor:withTolerance:](v9, "p_isEqualToColor:withTolerance:", v14, a5);

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;

  v4 = a3;
  if (CGColorGetPattern(-[CRLColor CGColor](self, "CGColor")))
    v5 = objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  else
    v5 = objc_claimAutoreleasedReturnValue(-[CRLColor UIColor](self, "UIColor"));
  v6 = (id)v5;
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("UIColor"));

}

- (CRLColor)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  void *v8;
  CRLColor *v9;

  v4 = a3;
  *(_QWORD *)&v6 = objc_opt_class(UIColor, v5).n128_u64[0];
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, CFSTR("UIColor"), v6));

  v9 = -[CRLColor initWithUIColor:](self, "initWithUIColor:", v8);
  return v9;
}

- (unint64_t)colorRGBSpace
{
  return self->mColorRGBSpace;
}

+ (CRLColor)pencilTrayBlueColor
{
  return (CRLColor *)sub_10064879C((uint64_t)a1, (uint64_t)a2, &qword_1013DDE08, (id *)&static CRLColor.pencilTrayBlue, (uint64_t)sub_100C63EF0);
}

+ (CRLColor)pencilTrayGreenColor
{
  return (CRLColor *)sub_10064879C((uint64_t)a1, (uint64_t)a2, &qword_1013DDE10, (id *)&static CRLColor.pencilTrayGreen, (uint64_t)sub_100C63FB8);
}

+ (CRLColor)pencilTrayYellowColor
{
  return (CRLColor *)sub_10064879C((uint64_t)a1, (uint64_t)a2, &qword_1013DDE18, (id *)&static CRLColor.pencilTrayYellow, (uint64_t)sub_100C6407C);
}

+ (CRLColor)pencilTrayRedColor
{
  return (CRLColor *)sub_10064879C((uint64_t)a1, (uint64_t)a2, &qword_1013DDE20, (id *)&static CRLColor.pencilTrayRed, (uint64_t)sub_100C64104);
}

@end
