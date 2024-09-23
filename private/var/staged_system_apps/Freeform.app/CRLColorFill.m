@implementation CRLColorFill

+ (id)colorWithColor:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)a1), "initWithColor:", v4);

  return v5;
}

+ (id)colorWithCGColor:(CGColor *)a3
{
  return objc_msgSend(objc_alloc((Class)a1), "initWithCGColor:", a3);
}

+ (id)colorWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6
{
  return objc_msgSend(objc_alloc((Class)a1), "initWithRed:green:blue:alpha:", a3, a4, a5, a6);
}

+ (id)colorWithWhite:(double)a3 alpha:(double)a4
{
  return objc_msgSend(objc_alloc((Class)a1), "initWithWhite:alpha:", a3, a4);
}

+ (id)colorWithUIColor:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)a1), "initWithUIColor:", v4);

  return v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  CRLMutableColorFill *v4;
  void *v5;
  CRLMutableColorFill *v6;

  v4 = [CRLMutableColorFill alloc];
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLColorFill color](self, "color"));
  v6 = -[CRLColorFill initWithColor:](v4, "initWithColor:", v5);

  return v6;
}

+ (CRLColorFill)randomColor
{
  CGColor *v2;
  void *v3;

  v2 = sub_100011CA0();
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColorFill colorWithCGColor:](CRLColorFill, "colorWithCGColor:", v2));
  CGColorRelease(v2);
  return (CRLColorFill *)v3;
}

+ (CRLColorFill)clearColor
{
  CRLColorFill *v2;
  void *v3;
  CRLColorFill *v4;

  v2 = [CRLColorFill alloc];
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColor clearColor](CRLColor, "clearColor"));
  v4 = -[CRLColorFill initWithColor:](v2, "initWithColor:", v3);

  return v4;
}

+ (CRLColorFill)blackColor
{
  CRLColorFill *v2;
  void *v3;
  CRLColorFill *v4;

  v2 = [CRLColorFill alloc];
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColor blackColor](CRLColor, "blackColor"));
  v4 = -[CRLColorFill initWithColor:](v2, "initWithColor:", v3);

  return v4;
}

+ (CRLColorFill)whiteColor
{
  CRLColorFill *v2;
  void *v3;
  CRLColorFill *v4;

  v2 = [CRLColorFill alloc];
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColor whiteColor](CRLColor, "whiteColor"));
  v4 = -[CRLColorFill initWithColor:](v2, "initWithColor:", v3);

  return v4;
}

+ (CRLColorFill)grayColor
{
  CRLColorFill *v2;
  void *v3;
  CRLColorFill *v4;

  v2 = [CRLColorFill alloc];
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColor grayColor](CRLColor, "grayColor"));
  v4 = -[CRLColorFill initWithColor:](v2, "initWithColor:", v3);

  return v4;
}

+ (CRLColorFill)redColor
{
  CRLColorFill *v2;
  void *v3;
  CRLColorFill *v4;

  v2 = [CRLColorFill alloc];
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColor redColor](CRLColor, "redColor"));
  v4 = -[CRLColorFill initWithColor:](v2, "initWithColor:", v3);

  return v4;
}

+ (CRLColorFill)greenColor
{
  CRLColorFill *v2;
  void *v3;
  CRLColorFill *v4;

  v2 = [CRLColorFill alloc];
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColor greenColor](CRLColor, "greenColor"));
  v4 = -[CRLColorFill initWithColor:](v2, "initWithColor:", v3);

  return v4;
}

+ (CRLColorFill)blueColor
{
  CRLColorFill *v2;
  void *v3;
  CRLColorFill *v4;

  v2 = [CRLColorFill alloc];
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColor blueColor](CRLColor, "blueColor"));
  v4 = -[CRLColorFill initWithColor:](v2, "initWithColor:", v3);

  return v4;
}

+ (CRLColorFill)cyanColor
{
  CRLColorFill *v2;
  void *v3;
  CRLColorFill *v4;

  v2 = [CRLColorFill alloc];
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColor cyanColor](CRLColor, "cyanColor"));
  v4 = -[CRLColorFill initWithColor:](v2, "initWithColor:", v3);

  return v4;
}

+ (CRLColorFill)yellowColor
{
  CRLColorFill *v2;
  void *v3;
  CRLColorFill *v4;

  v2 = [CRLColorFill alloc];
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColor yellowColor](CRLColor, "yellowColor"));
  v4 = -[CRLColorFill initWithColor:](v2, "initWithColor:", v3);

  return v4;
}

+ (CRLColorFill)magentaColor
{
  CRLColorFill *v2;
  void *v3;
  CRLColorFill *v4;

  v2 = [CRLColorFill alloc];
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColor magentaColor](CRLColor, "magentaColor"));
  v4 = -[CRLColorFill initWithColor:](v2, "initWithColor:", v3);

  return v4;
}

+ (CRLColorFill)orangeColor
{
  CRLColorFill *v2;
  void *v3;
  CRLColorFill *v4;

  v2 = [CRLColorFill alloc];
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColor orangeColor](CRLColor, "orangeColor"));
  v4 = -[CRLColorFill initWithColor:](v2, "initWithColor:", v3);

  return v4;
}

+ (CRLColorFill)purpleColor
{
  CRLColorFill *v2;
  void *v3;
  CRLColorFill *v4;

  v2 = [CRLColorFill alloc];
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColor purpleColor](CRLColor, "purpleColor"));
  v4 = -[CRLColorFill initWithColor:](v2, "initWithColor:", v3);

  return v4;
}

+ (CRLColorFill)brownColor
{
  CRLColorFill *v2;
  void *v3;
  CRLColorFill *v4;

  v2 = [CRLColorFill alloc];
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColor brownColor](CRLColor, "brownColor"));
  v4 = -[CRLColorFill initWithColor:](v2, "initWithColor:", v3);

  return v4;
}

+ (NSArray)readableTypeIdentifiersForItemProvider
{
  return +[CRLColor readableTypeIdentifiersForItemProvider](CRLColor, "readableTypeIdentifiersForItemProvider");
}

+ (id)objectWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5
{
  void *v6;
  id v7;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColor objectWithItemProviderData:typeIdentifier:error:](CRLColor, "objectWithItemProviderData:typeIdentifier:error:", a3, a4, a5));
  if (v6)
    v7 = objc_msgSend(objc_alloc((Class)a1), "initWithColor:", v6);
  else
    v7 = 0;

  return v7;
}

- (CRLColorFill)initWithColor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  CRLColorFill *v8;
  CRLColor *v9;
  CRLColor *color;
  objc_super v12;

  v4 = a3;
  if (!v4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124D168);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E19BC8();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124D188);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLColorFill initWithColor:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLColorFill.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 145, 0, "invalid nil value for color");

  }
  v12.receiver = self;
  v12.super_class = (Class)CRLColorFill;
  v8 = -[CRLColorFill init](&v12, "init");
  if (v8)
  {
    v9 = (CRLColor *)objc_msgSend(v4, "copy");
    color = v8->_color;
    v8->_color = v9;

  }
  return v8;
}

- (CRLColorFill)initWithCGColor:(CGColor *)a3
{
  void *v4;
  CRLColorFill *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColor colorWithCGColor:](CRLColor, "colorWithCGColor:", a3));
  v5 = -[CRLColorFill initWithColor:](self, "initWithColor:", v4);

  return v5;
}

- (CRLColorFill)initWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6
{
  void *v7;
  CRLColorFill *v8;

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColor colorWithRed:green:blue:alpha:](CRLColor, "colorWithRed:green:blue:alpha:", a3, a4, a5, a6));
  v8 = -[CRLColorFill initWithColor:](self, "initWithColor:", v7);

  return v8;
}

- (CRLColorFill)initWithWhite:(double)a3 alpha:(double)a4
{
  void *v5;
  CRLColorFill *v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColor colorWithWhite:alpha:](CRLColor, "colorWithWhite:alpha:", a3, a4));
  v6 = -[CRLColorFill initWithColor:](self, "initWithColor:", v5);

  return v6;
}

- (CRLColorFill)initWithUIColor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CRLColorFill *v9;

  v4 = a3;
  if (!v4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124D1A8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E19C4C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124D1C8);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLColorFill initWithUIColor:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLColorFill.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 170, 0, "invalid nil value for '%{public}s'", "uiColor");

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColor colorWithUIColor:](CRLColor, "colorWithUIColor:", v4));
  v9 = -[CRLColorFill initWithColor:](self, "initWithColor:", v8);

  return v9;
}

- (void)i_setColor:(id)a3
{
  CRLColor *v4;
  CRLColor *color;

  v4 = (CRLColor *)objc_msgSend(a3, "copy");
  color = self->_color;
  self->_color = v4;

}

- (unint64_t)hash
{
  return -[CRLColor hash](self->_color, "hash");
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4;
  CRLColorFill *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;

  v5 = (CRLColorFill *)a3;
  if (self == v5)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class(CRLColorFill, v4);
    v7 = sub_100221D0C(v6, v5);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (v8)
    {
      v9 = (void *)v8;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLColorFill color](self, "color"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "color"));
      v12 = objc_msgSend(v10, "isEqual:", v11);

    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (UIColor)UIColor
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLColorFill color](self, "color"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "UIColor"));

  return (UIColor *)v3;
}

- (id)grayscaleColor
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLColorFill color](self, "color"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "grayscaleColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColorFill colorWithColor:](CRLColorFill, "colorWithColor:", v3));

  return v4;
}

- (id)invertedColor
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLColorFill color](self, "color"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "invertedColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColorFill colorWithColor:](CRLColorFill, "colorWithColor:", v3));

  return v4;
}

- (BOOL)isOpaque
{
  double v2;

  -[CRLColorFill opacity](self, "opacity");
  return v2 == 1.0;
}

- (BOOL)isClear
{
  double v2;

  -[CRLColorFill opacity](self, "opacity");
  return v2 == 0.0;
}

- (BOOL)isNearlyWhite
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLColorFill color](self, "color"));
  v3 = objc_msgSend(v2, "isNearlyWhite");

  return v3;
}

- (BOOL)requiresOutlineOnBackgroundWithAppearance:(unint64_t)a3
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLColorFill color](self, "color"));
  LOBYTE(a3) = objc_msgSend(v4, "requiresOutlineOnBackgroundWithAppearance:", a3);

  return a3;
}

- (BOOL)drawsInOneStep
{
  return 1;
}

- (void)paintRect:(CGRect)a3 inContext:(CGContext *)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[CRLColorFill color](self, "color"));
  objc_msgSend(v9, "paintRect:inContext:", a4, x, y, width, height);

}

- (void)paintPath:(CGPath *)a3 inContext:(CGContext *)a4
{
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[CRLColorFill color](self, "color"));
  objc_msgSend(v6, "paintPath:inContext:", a3, a4);

}

- (BOOL)canApplyToRenderable
{
  return 1;
}

- (void)applyToRenderable:(id)a3 withScale:(double)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  CGColor *v10;

  v5 = a3;
  if (!-[CRLColorFill canApplyToRenderable](self, "canApplyToRenderable"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124D1E8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E19CF8();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124D208);
    v6 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLColorFill applyToRenderable:withScale:]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLColorFill.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 259, 0, "Applying color fill with unsupported properties to CRLCanvasRenderable");

  }
  objc_msgSend(v5, "setContents:", 0);
  v9 = -[CRLColorFill isClear](self, "isClear");
  v10 = 0;
  if ((v9 & 1) == 0)
    v10 = -[CRLColorFill CGColor](self, "CGColor", 0);
  objc_msgSend(v5, "setBackgroundColor:", v10);

}

- (int64_t)fillType
{
  return 0;
}

- (double)p_hsbComponentWithIndex:(unint64_t)a3
{
  void *v4;
  void *v5;
  __int128 v7;
  __int128 v8;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLColorFill color](self, "color", 0, 0, 0, 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "UIColor"));
  objc_msgSend(v5, "getHue:saturation:brightness:alpha:", &v7, (char *)&v7 + 8, &v8, (char *)&v8 + 8);

  return *((double *)&v7 + a3);
}

- (CGColor)CGColor
{
  void *v2;
  CGColor *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLColorFill color](self, "color"));
  v3 = (CGColor *)objc_msgSend(v2, "CGColor");

  return v3;
}

- (double)opacity
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLColorFill color](self, "color"));
  objc_msgSend(v2, "alphaComponent");
  v4 = v3;

  return v4;
}

- (double)luminance
{
  const CGFloat *Components;
  double result;

  Components = CGColorGetComponents(-[CRLColorFill CGColor](self, "CGColor"));
  result = fmax(Components[1] * 0.715200007 + *Components * 0.212599993 + Components[2] * 0.0722000003 * Components[3], 0.0);
  if (result > 1.0)
    return 1.0;
  return result;
}

- (double)hue
{
  double result;

  -[CRLColorFill p_hsbComponentWithIndex:](self, "p_hsbComponentWithIndex:", 0);
  return result;
}

- (double)saturation
{
  double result;

  -[CRLColorFill p_hsbComponentWithIndex:](self, "p_hsbComponentWithIndex:", 1);
  return result;
}

- (double)brightness
{
  double result;

  -[CRLColorFill p_hsbComponentWithIndex:](self, "p_hsbComponentWithIndex:", 2);
  return result;
}

+ (id)keyPathsForValuesAffectingCGColor
{
  return +[NSSet setWithObject:](NSSet, "setWithObject:", CFSTR("color"));
}

+ (id)keyPathsForValuesAffectingOpacity
{
  return +[NSSet setWithObject:](NSSet, "setWithObject:", CFSTR("color"));
}

+ (id)keyPathsForValuesAffectingLuminance
{
  return +[NSSet setWithObject:](NSSet, "setWithObject:", CFSTR("color"));
}

+ (id)keyPathsForValuesAffectingHue
{
  return +[NSSet setWithObject:](NSSet, "setWithObject:", CFSTR("color"));
}

+ (id)keyPathsForValuesAffectingSaturation
{
  return +[NSSet setWithObject:](NSSet, "setWithObject:", CFSTR("color"));
}

+ (id)keyPathsForValuesAffectingBrightness
{
  return +[NSSet setWithObject:](NSSet, "setWithObject:", CFSTR("color"));
}

- (CRLColor)color
{
  return self->_color;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
}

@end
