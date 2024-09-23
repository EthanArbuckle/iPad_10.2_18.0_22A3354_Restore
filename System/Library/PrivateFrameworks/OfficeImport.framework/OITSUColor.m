@implementation OITSUColor

- (CGColor)CGColor
{
  CGColorRef v2;

  v2 = CGColorRetain(self->mCGColor);
  return (CGColor *)CFAutorelease(v2);
}

+ (id)colorWithCGColor:(CGColor *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithCGColor:", a3);
}

+ (id)colorWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithRed:green:blue:alpha:", a3, a4, a5, a6);
}

+ (id)colorWithWhite:(double)a3 alpha:(double)a4
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithWhite:alpha:", a3, a4);
}

+ (id)colorWithHue:(double)a3 saturation:(double)a4 brightness:(double)a5 alpha:(double)a6
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithHue:saturation:brightness:alpha:", a3, a4, a5, a6);
}

+ (id)colorWithHue:(double)a3 saturation:(double)a4 brightness:(double)a5 alpha:(double)a6 targetRGBSpace:(unint64_t)a7
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithHue:saturation:brightness:alpha:targetRGBSpace:", a7, a3, a4, a5, a6);
}

+ (id)colorWithPatternImage:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPatternImage:", v4);

  return v5;
}

+ (id)colorWithHexString:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithHexString:", v4);

  return v5;
}

+ (id)colorWithUIColor:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithUIColor:", v4);

  return v5;
}

+ (id)randomColor
{
  CGColor *RandomRGB;
  void *v3;

  RandomRGB = TSUCGColorCreateRandomRGB();
  +[OITSUColor colorWithCGColor:](OITSUColor, "colorWithCGColor:", RandomRGB);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CGColorRelease(RandomRGB);
  return v3;
}

+ (id)clearColor
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithWhite:alpha:", 0.0, 0.0);
}

+ (id)blackColor
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithWhite:alpha:", 0.0, 1.0);
}

+ (id)whiteColor
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithWhite:alpha:", 1.0, 1.0);
}

+ (id)grayColor
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithWhite:alpha:", 0.5, 1.0);
}

+ (id)lightGrayColor
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithWhite:alpha:", 0.667, 1.0);
}

+ (id)redColor
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithRed:green:blue:alpha:", 1.0, 0.0, 0.0, 1.0);
}

+ (id)greenColor
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithRed:green:blue:alpha:", 0.0, 1.0, 0.0, 1.0);
}

+ (id)blueColor
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithRed:green:blue:alpha:", 0.0, 0.0, 1.0, 1.0);
}

+ (id)cyanColor
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithRed:green:blue:alpha:", 0.0, 1.0, 1.0, 1.0);
}

+ (id)yellowColor
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithRed:green:blue:alpha:", 1.0, 1.0, 0.0, 1.0);
}

+ (id)magentaColor
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithRed:green:blue:alpha:", 1.0, 0.0, 1.0, 1.0);
}

+ (id)orangeColor
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithRed:green:blue:alpha:", 1.0, 0.5, 0.0, 1.0);
}

+ (id)purpleColor
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithRed:green:blue:alpha:", 0.5, 0.0, 0.5, 1.0);
}

+ (id)brownColor
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithRed:green:blue:alpha:", 0.6, 0.4, 0.2, 1.0);
}

- (OITSUColor)initWithCGColor:(CGColor *)a3 colorSpace:(unint64_t)a4
{
  void *v7;
  void *v8;
  OITSUColor *v9;
  void *v10;
  void *v11;
  CGColorSpace *ColorSpace;
  CGColorSpaceModel Model;
  void *v14;
  void *v15;
  CGColorSpaceRef v16;
  const void *v17;
  const void *v18;
  const void *v19;
  void *v20;
  void *v21;
  CGColorSpaceRef v22;
  const void *v23;
  const void *v24;
  CGColorSpaceRef v25;
  const void *v26;
  const void *v27;
  CGColor *Copy;
  const CGFloat *Components;
  size_t NumberOfComponents;
  const CGFloat *v31;
  double *v32;
  double v33;
  float v34;
  CGColorSpace *v35;
  CGColorRef v36;
  CGColorSpace *v38;
  CGColorSpace *v39;
  uint64_t v40;
  objc_super v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  if (!a3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OITSUColor initWithCGColor:colorSpace:]");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUColor.m");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 150, 0, "invalid nil value for '%{public}s'", "CGColor");

    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  }
  v41.receiver = self;
  v41.super_class = (Class)OITSUColor;
  v9 = -[OITSUColor init](&v41, sel_init);
  if (v9)
  {
    if (CGColorGetPattern(a3))
    {
      if (a4 != 2)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OITSUColor initWithCGColor:colorSpace:]");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUColor.m");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 232, 0, "If the color has a pattern, its color space should be Unspecified");
LABEL_7:

        +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
      }
LABEL_26:
      Copy = CGColorCreateCopy(a3);
      goto LABEL_27;
    }
    ColorSpace = CGColorGetColorSpace(a3);
    Model = CGColorSpaceGetModel(ColorSpace);
    if (a4)
    {
      if (a4 != 2)
      {
        if (a4 != 1)
          goto LABEL_26;
        if (Model != kCGColorSpaceModelRGB)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OITSUColor initWithCGColor:colorSpace:]");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUColor.m");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v15, 172, 0, "Color specified as P3 isn't even RGB!");

          +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
        }
        v16 = CGColorGetColorSpace(a3);
        v17 = (const void *)TSUSRGBColorSpace();
        if (!CFEqual(v16, v17))
        {
          v18 = (const void *)TSUP3ColorSpace();
          if (!CFEqual(v16, v18))
          {
            v19 = (const void *)TSUDeviceRGBColorSpace();
            if (!CFEqual(v16, v19))
            {
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OITSUColor initWithCGColor:colorSpace:]");
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUColor.m");
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 179, 0, "Color specified as P3 isn't P3, sRGB or Device RGB");
              a4 = 1;
              goto LABEL_7;
            }
          }
        }
        goto LABEL_25;
      }
      v25 = CGColorGetColorSpace(a3);
      v26 = (const void *)TSUSRGBColorSpace();
      if (!CFEqual(v25, v26))
      {
        v27 = (const void *)TSUP3ColorSpace();
        if (!CFEqual(v25, v27))
        {
          v38 = CGColorGetColorSpace(a3);
          if (CGColorSpaceGetModel(v38) == kCGColorSpaceModelRGB && CGColorSpaceIsWideGamutRGB(v38))
          {
            a4 = 1;
            v39 = (CGColorSpace *)TSUP3ColorSpace();
          }
          else
          {
            v39 = (CGColorSpace *)TSUSRGBColorSpace();
            a4 = 0;
          }
          Copy = CGColorCreateCopyByMatchingToColorSpace(v39, kCGRenderingIntentDefault, a3, 0);
          if (Copy)
          {
LABEL_27:
            v9->mCGColor = Copy;
            v9->mColorRGBSpace = a4;
            if (!CGColorGetPattern(Copy))
            {
              Components = CGColorGetComponents(v9->mCGColor);
              NumberOfComponents = CGColorGetNumberOfComponents(v9->mCGColor);
              v31 = (const CGFloat *)((char *)&v40 - ((8 * NumberOfComponents + 15) & 0xFFFFFFFFFFFFFFF0));
              if (NumberOfComponents)
              {
                v32 = (double *)((char *)&v40 - ((8 * NumberOfComponents + 15) & 0xFFFFFFFFFFFFFFF0));
                do
                {
                  v33 = *Components++;
                  v34 = v33;
                  *v32++ = v34;
                  --NumberOfComponents;
                }
                while (NumberOfComponents);
              }
              v35 = CGColorGetColorSpace(v9->mCGColor);
              v36 = CGColorCreate(v35, v31);
              CGColorRelease(v9->mCGColor);
              v9->mCGColor = v36;
            }
            return v9;
          }
          goto LABEL_26;
        }
LABEL_25:
        a4 = 1;
        goto LABEL_26;
      }
    }
    else
    {
      if (Model != kCGColorSpaceModelRGB)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OITSUColor initWithCGColor:colorSpace:]");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUColor.m");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v20, v21, 185, 0, "Color specified as sRGB isn't even RGB!");

        +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
      }
      v22 = CGColorGetColorSpace(a3);
      v23 = (const void *)TSUSRGBColorSpace();
      if (!CFEqual(v22, v23))
      {
        v24 = (const void *)TSUDeviceRGBColorSpace();
        if (!CFEqual(v22, v24))
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OITSUColor initWithCGColor:colorSpace:]");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUColor.m");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 189, 0, "Color specified as sRGB isn't sRGB or Device RGB");
          a4 = 0;
          goto LABEL_7;
        }
      }
    }
    a4 = 0;
    goto LABEL_26;
  }
  return v9;
}

- (OITSUColor)initWithCGColor:(CGColor *)a3
{
  return -[OITSUColor initWithCGColor:colorSpace:](self, "initWithCGColor:colorSpace:", a3, 2);
}

- (OITSUColor)initWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6
{
  return -[OITSUColor initWithRed:green:blue:alpha:colorSpace:](self, "initWithRed:green:blue:alpha:colorSpace:", 2, a3, a4, a5, a6);
}

- (OITSUColor)initWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6 colorSpace:(unint64_t)a7
{
  CGColorSpace *v13;
  CGColor *v14;
  OITSUColor *v15;
  CGFloat components[5];

  components[4] = *(CGFloat *)MEMORY[0x24BDAC8D0];
  if (!a7 || a7 == 2)
  {
    v13 = (CGColorSpace *)TSUSRGBColorSpace();
  }
  else if (a7 == 1)
  {
    v13 = (CGColorSpace *)TSUP3ColorSpace();
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
  v15 = -[OITSUColor initWithCGColor:colorSpace:](self, "initWithCGColor:colorSpace:", v14, a7);
  CGColorRelease(v14);
  return v15;
}

- (OITSUColor)initWithWhite:(double)a3 alpha:(double)a4
{
  return -[OITSUColor initWithRed:green:blue:alpha:](self, "initWithRed:green:blue:alpha:", a3, a3, a3, a4);
}

- (OITSUColor)initWithHue:(double)a3 saturation:(double)a4 brightness:(double)a5 alpha:(double)a6
{
  return -[OITSUColor initWithHue:saturation:brightness:alpha:targetRGBSpace:](self, "initWithHue:saturation:brightness:alpha:targetRGBSpace:", 2, a3, a4, a5, a6);
}

- (OITSUColor)initWithHue:(double)a3 saturation:(double)a4 brightness:(double)a5 alpha:(double)a6 targetRGBSpace:(unint64_t)a7
{
  CGColorSpace *v12;
  CGColor *v13;
  OITSUColor *v14;

  if (a7)
  {
    if (a7 == 1)
      v12 = (CGColorSpace *)TSUP3ColorSpace();
    else
      v12 = 0;
  }
  else
  {
    v12 = (CGColorSpace *)TSUSRGBColorSpace();
  }
  v13 = TSUCreateCGColorFromHSBInColorSpace(v12, a3, a4, a5, a6);
  v14 = -[OITSUColor initWithCGColor:](self, "initWithCGColor:", v13);
  CGColorRelease(v13);
  return v14;
}

- (OITSUColor)initWithPatternImage:(id)a3
{
  id v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGColor *PatternWithImageAndTransform;
  OITSUColor *v10;
  void *v11;
  void *v12;
  CGAffineTransform v14;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    memset(&v14, 0, sizeof(v14));
    objc_msgSend(v4, "scale");
    v7 = 1.0 / v6;
    objc_msgSend(v5, "scale");
    CGAffineTransformMakeScale(&v14, v7, 1.0 / v8);
    PatternWithImageAndTransform = TSUCGColorCreatePatternWithImageAndTransform((CGImage *)objc_msgSend(v5, "CGImage"), (__int128 *)&v14);
    v10 = -[OITSUColor initWithCGColor:](self, "initWithCGColor:", PatternWithImageAndTransform);
    CGColorRelease(PatternWithImageAndTransform);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OITSUColor initWithPatternImage:]");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUColor.m");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 337, 0, "invalid nil value for '%{public}s'", "patternImage");

    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
    v10 = 0;
  }

  return v10;
}

- (OITSUColor)initWithHexString:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  OITSUColor *v12;
  void *v13;
  void *v14;

  v4 = a3;
  if (objc_msgSend(v4, "rangeOfString:options:", CFSTR("#[\\dA-F]{6}"), 1024) || v5 != objc_msgSend(v4, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OITSUColor initWithHexString:]");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUColor.m");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 354, 0, "Invalid hex string: %@", v4);

    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
    v12 = 0;
  }
  else
  {
    objc_msgSend(v4, "substringWithRange:", 1, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = __32__OITSUColor_initWithHexString___block_invoke((uint64_t)v6, v6);

    objc_msgSend(v4, "substringWithRange:", 3, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = __32__OITSUColor_initWithHexString___block_invoke((uint64_t)v8, v8);

    objc_msgSend(v4, "substringWithRange:", 5, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = __32__OITSUColor_initWithHexString___block_invoke((uint64_t)v10, v10);

    v12 = -[OITSUColor initWithRed:green:blue:alpha:](self, "initWithRed:green:blue:alpha:", (float)((float)(unint64_t)v7 / 255.0), (float)((float)(unint64_t)v9 / 255.0), (float)((float)(unint64_t)v11 / 255.0), 1.0);
  }

  return v12;
}

uint64_t __32__OITSUColor_initWithHexString___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;

  v2 = a2;
  objc_msgSend(v2, "substringToIndex:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(CFSTR("0123456789ABCDEF"), "rangeOfString:", v3);
  objc_msgSend(v2, "substringFromIndex:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(CFSTR("0123456789ABCDEF"), "rangeOfString:", v5) + 16 * v4;
  return v6;
}

- (OITSUColor)initWithUIColor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  CGColor *v8;
  OITSUColor *v9;
  CGColorSpace *v10;
  CGColor *CopyByMatchingToColorSpace;
  CGColorSpace *v12;
  CGColor *v13;
  CGColorSpace *v14;
  CGColor *v15;
  void *v16;
  void *v17;
  CGColor *v18;
  OITSUColor *v19;

  v4 = a3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OITSUColor initWithUIColor:]");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUColor.m");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 373, 0, "invalid nil value for '%{public}s'", "uiColor");

    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  }
  v7 = objc_retainAutorelease(v4);
  v8 = (CGColor *)objc_msgSend(v7, "CGColor");
  if (CGColorGetPattern(v8))
  {
    v9 = -[OITSUColor initWithCGColor:](self, "initWithCGColor:", v8);
  }
  else
  {
    v10 = (CGColorSpace *)TSUP3ColorSpace();
    CopyByMatchingToColorSpace = CGColorCreateCopyByMatchingToColorSpace(v10, kCGRenderingIntentDefault, v8, 0);
    v12 = (CGColorSpace *)TSUSRGBColorSpace();
    v13 = CGColorCreateCopyByMatchingToColorSpace(v12, kCGRenderingIntentDefault, CopyByMatchingToColorSpace, 0);
    v14 = (CGColorSpace *)TSUP3ColorSpace();
    v15 = CGColorCreateCopyByMatchingToColorSpace(v14, kCGRenderingIntentDefault, v13, 0);
    +[OITSUColor colorWithCGColor:](OITSUColor, "colorWithCGColor:", CopyByMatchingToColorSpace);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[OITSUColor colorWithCGColor:](OITSUColor, "colorWithCGColor:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "isEqualWithTolerance:", v17))
      v18 = v13;
    else
      v18 = CopyByMatchingToColorSpace;
    v19 = -[OITSUColor initWithCGColor:](self, "initWithCGColor:", v18);
    CGColorRelease(CopyByMatchingToColorSpace);
    CGColorRelease(v13);
    CGColorRelease(v15);
    v9 = v19;

  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  CGColorRelease(self->mCGColor);
  v3.receiver = self;
  v3.super_class = (Class)OITSUColor;
  -[OITSUColor dealloc](&v3, sel_dealloc);
}

- (unint64_t)hash
{
  return 5;
}

- (BOOL)p_isEqualToColor:(id)a3 withTolerance:(double)a4
{
  id v6;
  void *v7;
  unint64_t mColorRGBSpace;
  CGColor *v9;
  uint64_t v10;
  CGColor *v11;
  uint64_t (**v12)(void *, CGColor *, CGColor *);
  CGColorSpace *ColorSpace;
  CGColorSpaceModel Model;
  CGColorSpace *v15;
  void *v16;
  void *v17;
  char v18;
  _QWORD aBlock[5];

  v6 = a3;
  v7 = v6;
  if (v6
    && (mColorRGBSpace = self->mColorRGBSpace, mColorRGBSpace == objc_msgSend(v6, "colorRGBSpace"))
    && objc_msgSend(v7, "CGColor"))
  {
    v9 = -[OITSUColor CGColor](self, "CGColor");
    v10 = objc_msgSend(v7, "CGColor");
    if (v9 == (CGColor *)v10)
    {
      v18 = 1;
    }
    else
    {
      v11 = (CGColor *)v10;
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 3221225472;
      aBlock[2] = __45__OITSUColor_p_isEqualToColor_withTolerance___block_invoke;
      aBlock[3] = &__block_descriptor_40_e31_B24__0__CGColor__8__CGColor__16l;
      *(double *)&aBlock[4] = a4;
      v12 = (uint64_t (**)(void *, CGColor *, CGColor *))_Block_copy(aBlock);
      ColorSpace = CGColorGetColorSpace(v9);
      Model = CGColorSpaceGetModel(ColorSpace);
      v15 = CGColorGetColorSpace(v11);
      if (Model != CGColorSpaceGetModel(v15))
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OITSUColor p_isEqualToColor:withTolerance:]");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUColor.m");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v16, v17, 488, 0, "TSUColors should always be RGB! Comparing two with different color models.");

        +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
      }
      if (CFEqual(ColorSpace, v15))
        v18 = v12[2](v12, v9, v11);
      else
        v18 = 0;

    }
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

BOOL __45__OITSUColor_p_isEqualToColor_withTolerance___block_invoke(uint64_t a1, CGColorRef color, CGColorRef color2)
{
  _BOOL8 result;
  double *Components;
  double *v8;
  size_t NumberOfComponents;
  void *v10;
  void *v11;

  if (*(double *)(a1 + 32) == 0.0)
    return CGColorEqualToColor(color, color2);
  Components = (double *)CGColorGetComponents(color);
  v8 = (double *)CGColorGetComponents(color2);
  NumberOfComponents = CGColorGetNumberOfComponents(color);
  if (NumberOfComponents != CGColorGetNumberOfComponents(color2))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OITSUColor p_isEqualToColor:withTolerance:]_block_invoke");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUColor.m");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 473, 0, "Color space dimension mismatch");

    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  }
  for (result = 1; NumberOfComponents; --NumberOfComponents)
    result = result && vabdd_f64(*Components++, *v8++) < *(double *)(a1 + 32);
  return result;
}

- (BOOL)isAlmostEqualToColor:(id)a3
{
  id v4;
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
  double v15;
  double v16;
  BOOL v17;

  v4 = a3;
  -[OITSUColor redComponent](self, "redComponent");
  v6 = v5;
  objc_msgSend(v4, "redComponent");
  if (vabdd_f64(v6, v7) >= 0.00999999978
    || (-[OITSUColor greenComponent](self, "greenComponent"),
        v9 = v8,
        objc_msgSend(v4, "greenComponent"),
        vabdd_f64(v9, v10) >= 0.00999999978)
    || (-[OITSUColor blueComponent](self, "blueComponent"),
        v12 = v11,
        objc_msgSend(v4, "blueComponent"),
        vabdd_f64(v12, v13) >= 0.00999999978))
  {
    v17 = 0;
  }
  else
  {
    -[OITSUColor alphaComponent](self, "alphaComponent");
    v15 = v14;
    objc_msgSend(v4, "alphaComponent");
    v17 = vabdd_f64(v15, v16) < 0.00999999978;
  }

  return v17;
}

- (BOOL)isEqualWithTolerance:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  v5 = objc_opt_class();
  TSUDynamicCast(v5, (uint64_t)v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(self) = -[OITSUColor p_isEqualToColor:withTolerance:](self, "p_isEqualToColor:withTolerance:", v6, 0.001953125);
  return (char)self;
}

- (double)p_rgbComponentWithIndex:(unsigned __int8)a3
{
  int v3;
  const CGFloat *Components;
  CGColorSpace *ColorSpace;
  CGColorSpaceModel Model;
  double result;

  v3 = a3;
  Components = CGColorGetComponents(-[OITSUColor CGColor](self, "CGColor"));
  ColorSpace = CGColorGetColorSpace(-[OITSUColor CGColor](self, "CGColor"));
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

- (double)redComponent
{
  double result;

  -[OITSUColor p_rgbComponentWithIndex:](self, "p_rgbComponentWithIndex:", 0);
  return result;
}

- (double)greenComponent
{
  double result;

  -[OITSUColor p_rgbComponentWithIndex:](self, "p_rgbComponentWithIndex:", 1);
  return result;
}

- (double)blueComponent
{
  double result;

  -[OITSUColor p_rgbComponentWithIndex:](self, "p_rgbComponentWithIndex:", 2);
  return result;
}

- (double)alphaComponent
{
  return CGColorGetAlpha(-[OITSUColor CGColor](self, "CGColor"));
}

- (void)getRGBAComponents:(double *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;

  if (a3)
  {
    -[OITSUColor redComponent](self, "redComponent");
    *(_QWORD *)a3 = v5;
    -[OITSUColor greenComponent](self, "greenComponent");
    *((_QWORD *)a3 + 1) = v6;
    -[OITSUColor blueComponent](self, "blueComponent");
    *((_QWORD *)a3 + 2) = v7;
    -[OITSUColor alphaComponent](self, "alphaComponent");
    *((_QWORD *)a3 + 3) = v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OITSUColor getRGBAComponents:]");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUColor.m");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 552, 0, "rgbaComponents is NULL!");

    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
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
  -[OITSUColor redComponent](self, "redComponent");
  v4 = v3;
  -[OITSUColor greenComponent](self, "greenComponent");
  v6 = v5;
  -[OITSUColor blueComponent](self, "blueComponent");
  TSURGBToHSB(&v11, (double *)&v10, (double *)&v9, v4, v6, v7);
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
  -[OITSUColor redComponent](self, "redComponent");
  v4 = v3;
  -[OITSUColor greenComponent](self, "greenComponent");
  v6 = v5;
  -[OITSUColor blueComponent](self, "blueComponent");
  TSURGBToHSB((double *)&v11, &v10, (double *)&v9, v4, v6, v7);
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
  -[OITSUColor redComponent](self, "redComponent");
  v4 = v3;
  -[OITSUColor greenComponent](self, "greenComponent");
  v6 = v5;
  -[OITSUColor blueComponent](self, "blueComponent");
  TSURGBToHSB((double *)&v11, (double *)&v10, &v9, v4, v6, v7);
  return v9;
}

- (UIColor)UIColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x24BDF6950], "colorWithCGColor:", -[OITSUColor CGColor](self, "CGColor"));
}

- (id)grayscaleColor
{
  const CGFloat *Components;
  CGColorSpace *ColorSpace;
  CGColorSpaceModel Model;
  OITSUColor *v6;

  Components = CGColorGetComponents(-[OITSUColor CGColor](self, "CGColor"));
  ColorSpace = CGColorGetColorSpace(-[OITSUColor CGColor](self, "CGColor"));
  Model = CGColorSpaceGetModel(ColorSpace);
  if (Model)
  {
    if (Model == kCGColorSpaceModelRGB)
    {
      +[OITSUColor colorWithWhite:alpha:](OITSUColor, "colorWithWhite:alpha:", Components[1] * 0.59 + *Components * 0.3 + Components[2] * 0.11, Components[3]);
      v6 = (OITSUColor *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }
  }
  else
  {
    v6 = self;
  }
  return v6;
}

- (id)invertedColor
{
  void *v3;
  void *v4;
  const CGFloat *Components;

  if (CGColorGetNumberOfComponents(-[OITSUColor CGColor](self, "CGColor")) != 4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OITSUColor invertedColor]");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUColor.m");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v3, v4, 629, 0, "Wrong number of components while inverting color. %zi instead of 4", CGColorGetNumberOfComponents(-[OITSUColor CGColor](self, "CGColor")));

    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  }
  Components = CGColorGetComponents(-[OITSUColor CGColor](self, "CGColor"));
  return +[OITSUColor colorWithRed:green:blue:alpha:](OITSUColor, "colorWithRed:green:blue:alpha:", 1.0 - *Components, 1.0 - Components[1], 1.0 - Components[2], Components[3]);
}

- (OITSUColor)colorWithAlphaComponent:(double)a3
{
  CGColor *CopyWithAlpha;
  void *v4;

  CopyWithAlpha = CGColorCreateCopyWithAlpha(self->mCGColor, a3);
  +[OITSUColor colorWithCGColor:](OITSUColor, "colorWithCGColor:", CopyWithAlpha);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  CGColorRelease(CopyWithAlpha);
  return (OITSUColor *)v4;
}

- (double)luminance
{
  void *v3;
  void *v4;
  const CGFloat *Components;
  double result;

  if (CGColorGetNumberOfComponents(-[OITSUColor CGColor](self, "CGColor")) != 4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OITSUColor luminance]");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUColor.m");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v3, v4, 644, 0, "Wrong number of components to calculate luminance. %zi instead of 4", CGColorGetNumberOfComponents(-[OITSUColor CGColor](self, "CGColor")));

    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  }
  Components = CGColorGetComponents(-[OITSUColor CGColor](self, "CGColor"));
  result = fmax(Components[1] * 0.715200007 + *Components * 0.212599993 + Components[2] * 0.0722000003 * Components[3], 0.0);
  if (result > 1.0)
    return 1.0;
  return result;
}

- (BOOL)isOpaque
{
  return CGColorGetAlpha(-[OITSUColor CGColor](self, "CGColor")) == 1.0;
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
  -[OITSUColor redComponent](self, "redComponent");
  v4 = v3;
  -[OITSUColor greenComponent](self, "greenComponent");
  v6 = v5;
  -[OITSUColor blueComponent](self, "blueComponent");
  TSURGBToHSB((double *)&v11, &v9, &v10, v4, v6, v7);
  return v9 < 0.05 && v10 > 0.9;
}

- (BOOL)wantsHighContrastBackgroundForDarkMode:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v4 = a3;
  -[OITSUColor luminance](self, "luminance");
  v6 = v5;
  objc_msgSend(v4, "luminance");
  v8 = v7;

  return (v6 + 0.05) / (v8 + 0.05) < 1.3;
}

- (id)blendedColorWithFraction:(double)a3 ofColor:(id)a4
{
  return -[OITSUColor newBlendedColorWithFraction:ofColor:](self, "newBlendedColorWithFraction:ofColor:", a4, a3);
}

- (id)newBlendedColorWithFraction:(double)a3 ofColor:(id)a4
{
  id v6;
  OITSUColor *v7;
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

  v6 = a4;
  v7 = [OITSUColor alloc];
  -[OITSUColor redComponent](self, "redComponent");
  v9 = v8;
  objc_msgSend(v6, "redComponent");
  v11 = TSUMix(v9, v10, a3);
  -[OITSUColor greenComponent](self, "greenComponent");
  v13 = v12;
  objc_msgSend(v6, "greenComponent");
  v15 = TSUMix(v13, v14, a3);
  -[OITSUColor blueComponent](self, "blueComponent");
  v17 = v16;
  objc_msgSend(v6, "blueComponent");
  v19 = TSUMix(v17, v18, a3);
  -[OITSUColor alphaComponent](self, "alphaComponent");
  v21 = v20;
  objc_msgSend(v6, "alphaComponent");
  v23 = v22;

  return -[OITSUColor initWithRed:green:blue:alpha:](v7, "initWithRed:green:blue:alpha:", v11, v15, v19, TSUMix(v21, v23, a3));
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

- (id)hexString
{
  void *v3;
  double v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  double v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[OITSUColor redComponent](self, "redComponent");
  v5 = (int)(v4 * 255.0);
  -[OITSUColor greenComponent](self, "greenComponent");
  v7 = (int)(v6 * 255.0);
  -[OITSUColor blueComponent](self, "blueComponent");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("#%02X%02X%02X"), v5, v7, (int)(v8 * 255.0));
}

- (unint64_t)colorRGBSpace
{
  return self->mColorRGBSpace;
}

- ($14D77461FF5D83CAEC4252578BA76F85)ttColor
{
  double v3;
  int v4;
  double v5;
  int v6;
  double v7;
  int v8;
  double v9;

  -[OITSUColor redComponent](self, "redComponent");
  v4 = (int)(v3 * 255.0);
  -[OITSUColor greenComponent](self, "greenComponent");
  v6 = (int)(v5 * 255.0);
  -[OITSUColor blueComponent](self, "blueComponent");
  v8 = (int)(v7 * 255.0);
  -[OITSUColor alphaComponent](self, "alphaComponent");
  return ($14D77461FF5D83CAEC4252578BA76F85)((v8 << 16) | ((int)(v9 * 255.0) << 24) | (v6 << 8) | v4);
}

- (id)newSolidColoredBitmap:(CGSize)a3
{
  return 0;
}

- (id)solidColoredPngImage
{
  return 0;
}

+ (id)colorWithBinaryRed:(int)a3 green:(int)a4 blue:(int)a5
{
  return (id)objc_msgSend(a1, "colorWithBinaryRed:green:blue:alpha:", *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, 1);
}

+ (id)colorWithBinaryRed:(int)a3 green:(int)a4 blue:(int)a5 alpha:(int)a6
{
  return +[OITSUColor colorWithCalibratedRed:green:blue:alpha:](OITSUColor, "colorWithCalibratedRed:green:blue:alpha:", (double)a3 / 255.0, (double)a4 / 255.0, (double)a5 / 255.0, (double)a6 / 255.0);
}

+ (id)colorWithCalibratedWhite:(double)a3 alpha:(double)a4
{
  return +[OITSUColor colorWithWhite:alpha:](OITSUColor, "colorWithWhite:alpha:", a3, a4);
}

+ (id)colorWithCalibratedHue:(double)a3 saturation:(double)a4 brightness:(double)a5 alpha:(double)a6
{
  CGColor *v6;
  OITSUColor *v7;

  v6 = TSUCreateCGColorFromHSB(a3, a4, a5, a6);
  v7 = +[OITSUColor colorWithCGColor:](OITSUColor, "colorWithCGColor:", v6);
  CGColorRelease(v6);
  return v7;
}

+ (id)colorWithCalibratedRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6
{
  return +[OITSUColor colorWithRed:green:blue:alpha:](OITSUColor, "colorWithRed:green:blue:alpha:", a3, a4, a5, a6);
}

+ (id)colorWithDeviceWhite:(double)a3 alpha:(double)a4
{
  return +[OITSUColor colorWithWhite:alpha:](OITSUColor, "colorWithWhite:alpha:", a3, a4);
}

+ (id)colorWithDeviceHue:(double)a3 saturation:(double)a4 brightness:(double)a5 alpha:(double)a6
{
  CGColor *v6;
  OITSUColor *v7;

  v6 = TSUCreateCGColorFromHSB(a3, a4, a5, a6);
  v7 = +[OITSUColor colorWithCGColor:](OITSUColor, "colorWithCGColor:", v6);
  CGColorRelease(v6);
  return v7;
}

+ (id)colorWithDeviceRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6
{
  return +[OITSUColor colorWithRed:green:blue:alpha:](OITSUColor, "colorWithRed:green:blue:alpha:", a3, a4, a5, a6);
}

+ (id)colorWithDeviceCyan:(double)a3 magenta:(double)a4 yellow:(double)a5 black:(double)a6 alpha:(double)a7
{
  CGColorSpace *v7;
  CGColor *v8;
  OITSUColor *v9;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v7 = (CGColorSpace *)TSUDeviceCMYKColorSpace();
  v8 = CGColorCreate(v7, &v11);
  v9 = +[OITSUColor colorWithCGColor:](OITSUColor, "colorWithCGColor:", v8, *(_QWORD *)&v11, *(_QWORD *)&v12, *(_QWORD *)&v13, *(_QWORD *)&v14, *(_QWORD *)&v15, v16);
  CGColorRelease(v8);
  return v9;
}

+ (id)colorWithCatalogName:(id)a3 colorName:(id)a4
{
  return 0;
}

- (void)getRed:(double *)a3 green:(double *)a4 blue:(double *)a5 alpha:(double *)a6
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if (a3)
  {
    -[OITSUColor redComponent](self, "redComponent");
    *(_QWORD *)a3 = v11;
  }
  if (a4)
  {
    -[OITSUColor greenComponent](self, "greenComponent");
    *(_QWORD *)a4 = v12;
  }
  if (a5)
  {
    -[OITSUColor blueComponent](self, "blueComponent");
    *(_QWORD *)a5 = v13;
  }
  if (a6)
  {
    -[OITSUColor alphaComponent](self, "alphaComponent");
    *(_QWORD *)a6 = v14;
  }
}

- (double)whiteComponent
{
  double *Components;
  CGColorSpace *ColorSpace;

  Components = (double *)CGColorGetComponents(-[OITSUColor CGColor](self, "CGColor"));
  ColorSpace = CGColorGetColorSpace(-[OITSUColor CGColor](self, "CGColor"));
  if (CGColorSpaceGetModel(ColorSpace))
    return NAN;
  else
    return *Components;
}

- (void)getWhite:(double *)a3 alpha:(double *)a4
{
  uint64_t v7;
  uint64_t v8;

  if (a3)
  {
    -[OITSUColor whiteComponent](self, "whiteComponent");
    *(_QWORD *)a3 = v7;
  }
  if (a4)
  {
    -[OITSUColor alphaComponent](self, "alphaComponent");
    *(_QWORD *)a4 = v8;
  }
}

- (double)p_cmykComponentWithIndex:(unsigned __int8)a3
{
  int v3;
  const CGFloat *Components;
  CGColorSpace *ColorSpace;

  v3 = a3;
  Components = CGColorGetComponents(-[OITSUColor CGColor](self, "CGColor"));
  ColorSpace = CGColorGetColorSpace(-[OITSUColor CGColor](self, "CGColor"));
  if (CGColorSpaceGetModel(ColorSpace) == kCGColorSpaceModelCMYK)
    return Components[v3];
  else
    return NAN;
}

- (double)cyanComponent
{
  double result;

  -[OITSUColor p_cmykComponentWithIndex:](self, "p_cmykComponentWithIndex:", 0);
  return result;
}

- (double)magentaComponent
{
  double result;

  -[OITSUColor p_cmykComponentWithIndex:](self, "p_cmykComponentWithIndex:", 1);
  return result;
}

- (double)yellowComponent
{
  double result;

  -[OITSUColor p_cmykComponentWithIndex:](self, "p_cmykComponentWithIndex:", 2);
  return result;
}

- (double)blackComponent
{
  double result;

  -[OITSUColor p_cmykComponentWithIndex:](self, "p_cmykComponentWithIndex:", 3);
  return result;
}

- (void)getCyan:(double *)a3 magenta:(double *)a4 yellow:(double *)a5 black:(double *)a6 alpha:(double *)a7
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  if (a3)
  {
    -[OITSUColor cyanComponent](self, "cyanComponent");
    *(_QWORD *)a3 = v13;
  }
  if (a4)
  {
    -[OITSUColor magentaComponent](self, "magentaComponent");
    *(_QWORD *)a4 = v14;
  }
  if (a5)
  {
    -[OITSUColor yellowComponent](self, "yellowComponent");
    *(_QWORD *)a5 = v15;
  }
  if (a6)
  {
    -[OITSUColor blackComponent](self, "blackComponent");
    *(_QWORD *)a6 = v16;
  }
  if (a7)
  {
    -[OITSUColor alphaComponent](self, "alphaComponent");
    *(_QWORD *)a7 = v17;
  }
}

- (CGColorSpace)CGColorSpace
{
  return CGColorGetColorSpace(-[OITSUColor CGColor](self, "CGColor"));
}

- (int)CGColorSpaceModel
{
  return CGColorSpaceGetModel(-[OITSUColor CGColorSpace](self, "CGColorSpace"));
}

- (id)copy
{
  return -[OITSUColor initWithCGColor:]([OITSUColor alloc], "initWithCGColor:", -[OITSUColor CGColor](self, "CGColor"));
}

- (unsigned)toBGR
{
  return -[OITSUColor ttColor](self, "ttColor") & 0xFFFFFF;
}

+ (id)colorWithBGR:(unsigned int)a3
{
  float v3;
  float v4;
  float v5;

  v3 = (double)a3 / 255.0;
  v4 = (double)BYTE1(a3) / 255.0;
  v5 = (double)BYTE2(a3) / 255.0;
  return +[OITSUColor colorWithCalibratedRed:green:blue:alpha:](OITSUColor, "colorWithCalibratedRed:green:blue:alpha:", v3, v4, v5, 1.0);
}

+ (id)colorWithSystemColorID:(int)a3
{
  unsigned int v3;

  if ((a3 - 1) > 0x23)
    v3 = 0;
  else
    v3 = dword_22A4BD690[a3 - 1];
  return (id)objc_msgSend(a1, "colorWithCalibratedRed:green:blue:alpha:", (double)HIWORD(v3) / 255.0, (double)BYTE1(v3) / 255.0, (double)v3 / 255.0, 1.0);
}

+ (id)stringForSystemColorID:(int)a3
{
  if (a3 > 0x25)
    return CFSTR("unknown");
  else
    return off_24F39CB30[a3];
}

+ (id)stringForColor:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(a3, "redComponent");
  v6 = v5;
  objc_msgSend(a3, "greenComponent");
  v8 = v7;
  objc_msgSend(a3, "blueComponent");
  v10 = v9;
  objc_msgSend(a3, "alphaComponent");
  return (id)objc_msgSend(v4, "stringWithFormat:", CFSTR("RGB (%g %g %g %g)"), v6, v8, v10, v11);
}

- (OITSUColor)colorWithTintValue:(double)a3
{
  id v5;

  if (!-[OITSUColor(TCColorAdditions) colorWithTintValue:]::whiteRGBColor)
  {
    -[OITSUColor(TCColorAdditions) colorWithTintValue:]::whiteRGBColor = +[OITSUColor colorWithCalibratedRed:green:blue:alpha:](OITSUColor, "colorWithCalibratedRed:green:blue:alpha:", 1.0, 1.0, 1.0, 1.0);
    v5 = (id)-[OITSUColor(TCColorAdditions) colorWithTintValue:]::whiteRGBColor;
  }
  return (OITSUColor *)-[OITSUColor blendedColorWithFraction:ofColor:](self, "blendedColorWithFraction:ofColor:", 1.0 - a3);
}

- (OITSUColor)colorWithShadeValue:(double)a3
{
  id v5;

  if (!-[OITSUColor(TCColorAdditions) colorWithShadeValue:]::blackRGBColor)
  {
    -[OITSUColor(TCColorAdditions) colorWithShadeValue:]::blackRGBColor = +[OITSUColor colorWithCalibratedRed:green:blue:alpha:](OITSUColor, "colorWithCalibratedRed:green:blue:alpha:", 0.0, 0.0, 0.0, 1.0);
    v5 = (id)-[OITSUColor(TCColorAdditions) colorWithShadeValue:]::blackRGBColor;
  }
  return (OITSUColor *)-[OITSUColor blendedColorWithFraction:ofColor:](self, "blendedColorWithFraction:ofColor:", 1.0 - a3);
}

- (void)set
{
  CGContext *CurrentContext;

  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSetFillColorWithColor(CurrentContext, -[OITSUColor CGColor](self, "CGColor"));
  CGContextSetStrokeColorWithColor(CurrentContext, -[OITSUColor CGColor](self, "CGColor"));
}

+ (id)colorWithCsColour:(const CsColour *)a3
{
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;

  LOWORD(v3) = a3->var1;
  LOWORD(v4) = a3->var2;
  LOWORD(v5) = a3->var3;
  LOWORD(v6) = a3->var0;
  return +[OITSUColor colorWithCalibratedRed:green:blue:alpha:](OITSUColor, "colorWithCalibratedRed:green:blue:alpha:", (float)((float)v3 / 255.0), (float)((float)v4 / 255.0), (float)((float)v5 / 255.0), (float)((float)v6 / 255.0));
}

- (CsColour)csColour
{
  _WORD *v2;
  _WORD *v3;
  CsColour v4;

  v3 = v2;
  v4 = (CsColour)-[OITSUColor ttColor](self, "ttColor");
  *v3 = HIBYTE(*(_DWORD *)&v4.var0);
  v3[1] = LOBYTE(v4.var0);
  v3[2] = HIBYTE(v4.var0);
  v3[3] = LOBYTE(v4.var1);
  return v4;
}

+ (id)colorWithEshColor:(const EshColor *)a3
{
  double v4;
  double v5;

  v4 = (float)((float)EshColor::getRed((EshColor *)a3) / 255.0);
  v5 = (float)((float)EshColor::getGreen((EshColor *)a3) / 255.0);
  return +[OITSUColor colorWithCalibratedRed:green:blue:alpha:](OITSUColor, "colorWithCalibratedRed:green:blue:alpha:", v4, v5, (float)((float)EshColor::getBlue((EshColor *)a3) / 255.0), 1.0);
}

- (EshColor)eshColor
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  RGB *v5;
  uint64_t v6;
  uint64_t v7;

  v3 = v2;
  LODWORD(v7) = 0;
  v4 = (uint64_t)-[OITSUColor ttColor](self, "ttColor");
  v6 = EshColor::RGB::create(v4, SBYTE1(v4), SBYTE2(v4), (_BYTE *)&v7 + 4, v5);
  *v3 = v7;
  return (EshColor)v6;
}

+ (id)colorWithRGBBytes:(unsigned __int8)a3 green:(unsigned __int8)a4 blue:(unsigned __int8)a5
{
  return (id)objc_msgSend(a1, "colorWithCalibratedRed:green:blue:alpha:", (double)a3 / 255.0, (double)a4 / 255.0, (double)a5 / 255.0, 1.0);
}

- (void)getRGBBytes:(char *)a3 green:(char *)a4 blue:(char *)a5
{
  double v9;
  double v10;
  double v11;

  -[OITSUColor redComponent](self, "redComponent");
  *a3 = (int)(v9 * 255.0 + 0.5);
  -[OITSUColor greenComponent](self, "greenComponent");
  *a4 = (int)(v10 * 255.0 + 0.5);
  -[OITSUColor blueComponent](self, "blueComponent");
  *a5 = (int)(v11 * 255.0 + 0.5);
}

+ (id)colorWithBGRValue:(int64_t)a3
{
  float v3;
  float v4;
  float v5;

  v3 = (double)BYTE2(a3) / 255.0;
  v4 = (double)BYTE1(a3) / 255.0;
  v5 = (double)a3 / 255.0;
  return +[OITSUColor colorWithCalibratedRed:green:blue:alpha:](OITSUColor, "colorWithCalibratedRed:green:blue:alpha:", v5, v4, v3, 1.0);
}

+ (id)colorWithRGBValue:(int64_t)a3
{
  float v3;
  float v4;
  float v5;

  v3 = (double)BYTE2(a3) / 255.0;
  v4 = (double)BYTE1(a3) / 255.0;
  v5 = (double)a3 / 255.0;
  return +[OITSUColor colorWithCalibratedRed:green:blue:alpha:](OITSUColor, "colorWithCalibratedRed:green:blue:alpha:", v3, v4, v5, 1.0);
}

- (BOOL)isBlack
{
  double v3;
  double v4;
  double v5;
  double v6;

  -[OITSUColor redComponent](self, "redComponent");
  if (v3 != 0.0)
    return 0;
  -[OITSUColor greenComponent](self, "greenComponent");
  if (v4 != 0.0)
    return 0;
  -[OITSUColor blueComponent](self, "blueComponent");
  if (v5 != 0.0)
    return 0;
  -[OITSUColor alphaComponent](self, "alphaComponent");
  return v6 == 1.0;
}

@end
