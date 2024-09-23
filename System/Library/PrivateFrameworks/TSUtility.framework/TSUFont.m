@implementation TSUFont

- (TSUFont)initWithCTFont:(__CTFont *)a3
{
  TSUFont *v4;
  id v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TSUFont;
  v4 = -[TSUFont init](&v8, sel_init);
  if (v4)
  {
    if (a3)
    {
      v4->_ctFont = (__CTFont *)CFRetain(a3);
    }
    else
    {
      v5 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
      v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUFont initWithCTFont:]");
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFont.m"), 32, CFSTR("can't create TSUFont without a CTFontRef"));

      return 0;
    }
  }
  return v4;
}

- (void)dealloc
{
  __CTFont *ctFont;
  objc_super v4;

  ctFont = self->_ctFont;
  if (ctFont)
  {
    CFRelease(ctFont);
    self->_ctFont = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)TSUFont;
  -[TSUFont dealloc](&v4, sel_dealloc);
}

+ (id)fontWithName:(id)a3 size:(double)a4
{
  id result;
  id v5;
  id v6;

  result = CTFontCreateWithName((CFStringRef)a3, a4, 0);
  if (result)
  {
    v5 = result;
    v6 = (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithCTFont:", result);
    CFRelease(v5);
    return v6;
  }
  return result;
}

+ (id)systemFontOfSize:(double)a3
{
  return +[TSUFont fontWithPlatformFont:](TSUFont, "fontWithPlatformFont:", objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:", a3));
}

+ (id)boldSystemFontOfSize:(double)a3
{
  return +[TSUFont fontWithPlatformFont:](TSUFont, "fontWithPlatformFont:", objc_msgSend(MEMORY[0x24BDF6A70], "boldSystemFontOfSize:", a3));
}

+ (id)italicSystemFontOfSize:(double)a3
{
  return +[TSUFont fontWithPlatformFont:](TSUFont, "fontWithPlatformFont:", objc_msgSend(MEMORY[0x24BDF6A70], "italicSystemFontOfSize:", a3));
}

+ (id)systemFontOfSize:(double)a3 weight:(double)a4
{
  return +[TSUFont fontWithPlatformFont:](TSUFont, "fontWithPlatformFont:", objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:weight:", a3, a4));
}

- (NSString)familyName
{
  return (NSString *)(id)CTFontCopyFamilyName(self->_ctFont);
}

- (NSString)fontName
{
  return (NSString *)(id)CTFontCopyPostScriptName(self->_ctFont);
}

- (double)pointSize
{
  return CTFontGetSize(self->_ctFont);
}

- (double)ascender
{
  return CTFontGetAscent(self->_ctFont);
}

- (double)descender
{
  return CTFontGetDescent(self->_ctFont);
}

- (double)capHeight
{
  return CTFontGetCapHeight(self->_ctFont);
}

- (double)xHeight
{
  return CTFontGetXHeight(self->_ctFont);
}

- (double)lineHeight
{
  double v3;
  double v4;
  double v5;

  -[TSUFont ascender](self, "ascender");
  v4 = v3;
  -[TSUFont descender](self, "descender");
  return v4 + v5;
}

- (TSUFont)fontWithSize:(double)a3
{
  TSUFont *result;
  TSUFont *v4;
  TSUFont *v5;

  result = (TSUFont *)CTFontCreateCopyWithAttributes(self->_ctFont, a3, 0, 0);
  if (result)
  {
    v4 = result;
    v5 = (TSUFont *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithCTFont:", result);
    CFRelease(v4);
    return v5;
  }
  return result;
}

- (TSUFont)fontWithScale:(double)a3
{
  TSUFont *v4;
  double v5;

  v4 = self;
  if (a3 != 1.0)
  {
    -[TSUFont pointSize](self, "pointSize");
    return -[TSUFont fontWithSize:](v4, "fontWithSize:", v5 * a3);
  }
  return self;
}

- (id)convertFontToBold:(BOOL)a3 italic:(BOOL)a4
{
  int v4;
  id result;
  id v6;
  TSUFont *v7;

  if (a3)
    v4 = 2;
  else
    v4 = 0;
  result = CTFontCreateCopyWithSymbolicTraits(self->_ctFont, 0.0, 0, v4 | a4, 3u);
  if (result)
  {
    v6 = result;
    v7 = -[TSUFont initWithCTFont:]([TSUFont alloc], "initWithCTFont:", result);
    CFRelease(v6);
    return v7;
  }
  return result;
}

- (__CTFont)CTFont
{
  return self->_ctFont;
}

+ (id)fontWithPlatformFont:(id)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithPlatformFont:", a3);
}

- (UIFont)platformFont
{
  return (UIFont *)-[TSUFont CTFont](self, "CTFont");
}

@end
