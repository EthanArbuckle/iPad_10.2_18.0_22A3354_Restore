@implementation TSWPEquationLayoutContext

- (TSWPEquationLayoutContext)initWithTextAttributes:(__CFDictionary *)a3 columnWidth:(double)a4
{
  TSWPEquationLayoutContext *v6;
  const __CTFont *Value;
  const __CTFont *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)TSWPEquationLayoutContext;
  v6 = -[TSWPEquationLayoutContext init](&v10, sel_init);
  if (v6)
  {
    Value = (const __CTFont *)CFDictionaryGetValue(a3, (const void *)*MEMORY[0x24BDC4C28]);
    if (Value)
    {
      v8 = Value;
      v6->_fontSize = CTFontGetSize(Value);
      v6->_fontName = (__CFString *)CTFontCopyPostScriptName(v8);
    }
    v6->_columnWidth = a4;
  }
  return v6;
}

- (void)dealloc
{
  __CFString *fontName;
  objc_super v4;

  fontName = self->_fontName;
  if (fontName)
    CFRelease(fontName);
  v4.receiver = self;
  v4.super_class = (Class)TSWPEquationLayoutContext;
  -[TSWPEquationLayoutContext dealloc](&v4, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;

  objc_opt_class();
  v4 = (void *)TSUDynamicCast();
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v4, "fontSize");
    if (v6 == self->_fontSize)
    {
      objc_msgSend(v5, "columnWidth");
      LOBYTE(v4) = v7 == self->_columnWidth;
    }
    else
    {
      LOBYTE(v4) = 0;
    }
  }
  return (char)v4;
}

- (double)baseFontSize
{
  return self->_fontSize;
}

- (__CFString)baseFontName
{
  return self->_fontName;
}

- (double)containerWidth
{
  return self->_columnWidth;
}

- (double)fontSize
{
  return self->_fontSize;
}

- (void)setFontSize:(double)a3
{
  self->_fontSize = a3;
}

- (double)columnWidth
{
  return self->_columnWidth;
}

- (void)setColumnWidth:(double)a3
{
  self->_columnWidth = a3;
}

@end
