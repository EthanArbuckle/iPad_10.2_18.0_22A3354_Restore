@implementation TSWPFontCacheValue

+ (id)cacheValueWithCTFont:(__CTFont *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithCTFont:", a3);
}

- (TSWPFontCacheValue)initWithCTFont:(__CTFont *)a3
{
  TSWPFontCacheValue *v4;
  TSWPFontCacheValue *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TSWPFontCacheValue;
  v4 = -[TSWPFontCacheValue init](&v7, sel_init);
  v5 = v4;
  if (a3 && v4)
    v4->_ctFont = (__CTFont *)CFRetain(a3);
  return v5;
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
  v4.super_class = (Class)TSWPFontCacheValue;
  -[TSWPFontCacheValue dealloc](&v4, sel_dealloc);
}

- (__CTFont)ctFont
{
  return self->_ctFont;
}

@end
