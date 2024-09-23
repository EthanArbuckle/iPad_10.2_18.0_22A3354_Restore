@implementation THWAdornmentWPStyleProvider

- (THWAdornmentWPStyleProvider)initWithStorage:(id)a3
{
  THWAdornmentWPStyleProvider *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)THWAdornmentWPStyleProvider;
  v4 = -[THWAdornmentWPStyleProvider init](&v6, "init");
  if (v4)
  {
    v4->_storage = (TSWPStorage *)a3;
    v4->_fontSize = 10.0;
    v4->_textAlignment = 0;
    v4->_fontName = 0;
    v4->_leftIndent = 0.0;
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWAdornmentWPStyleProvider;
  -[THWAdornmentWPStyleProvider dealloc](&v3, "dealloc");
}

- (id)p_textColor
{
  if (self->_useDarkAppearance)
    return +[TSUColor whiteColor](TSUColor, "whiteColor");
  else
    return +[TSUColor colorWithWhite:alpha:](TSUColor, "colorWithWhite:alpha:", 0.203921571, 1.0);
}

- (id)paragraphStyleAtParIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  id v7;
  double fontSize;
  NSString *fontName;
  uint64_t textAlignment;
  double leftIndent;
  double v12;
  double v13;
  id v14;
  id v15;

  v7 = +[TSSPropertyMap propertyMap](TSSPropertyMap, "propertyMap");
  fontSize = self->_fontSize;
  *(float *)&fontSize = fontSize;
  objc_msgSend(v7, "setFloatValue:forProperty:", 17, fontSize);
  fontName = self->_fontName;
  if (fontName)
    objc_msgSend(v7, "setObject:forProperty:", fontName, 16);
  objc_msgSend(v7, "setObject:forProperty:", -[THWAdornmentWPStyleProvider p_textColor](self, "p_textColor"), 18);
  textAlignment = self->_textAlignment;
  if ((_DWORD)textAlignment != 4)
    objc_msgSend(v7, "setIntValue:forProperty:", textAlignment, 86);
  leftIndent = self->_leftIndent;
  *(float *)&leftIndent = leftIndent;
  objc_msgSend(v7, "setFloatValue:forProperty:", 80, leftIndent);
  v12 = self->_leftIndent;
  *(float *)&v12 = v12;
  objc_msgSend(v7, "setFloatValue:forProperty:", 81, v12);
  LODWORD(v13) = 0;
  objc_msgSend(v7, "setFloatValue:forProperty:", 82, v13);
  objc_msgSend(v7, "setIntValue:forProperty:", 0, 102);
  v14 = objc_msgSend(objc_alloc((Class)TSWPLineSpacing), "initWithMode:amount:", 0, 1.1);
  objc_msgSend(v7, "setObject:forProperty:", v14, 85);

  v15 = objc_msgSend(+[TSWPStorageStyleProvider styleProviderForStorage:](TSWPStorageStyleProvider, "styleProviderForStorage:", self->_storage), "paragraphStyleAtParIndex:effectiveRange:", a3, a4);
  return objc_msgSend(objc_msgSend(v15, "stylesheet"), "variationOfStyle:propertyMap:", v15, v7);
}

- (id)modifiedCharacterStyle:(id)a3 atCharIndex:(unint64_t)a4
{
  id v6;
  double fontSize;
  NSString *fontName;

  v6 = +[TSSPropertyMap propertyMap](TSSPropertyMap, "propertyMap", a3, a4);
  objc_msgSend(v6, "setObject:forProperty:", -[THWAdornmentWPStyleProvider p_textColor](self, "p_textColor"), 18);
  fontSize = self->_fontSize;
  *(float *)&fontSize = fontSize;
  objc_msgSend(v6, "setFloatValue:forProperty:", 17, fontSize);
  fontName = self->_fontName;
  if (fontName)
    objc_msgSend(v6, "setObject:forProperty:", fontName, 16);
  return objc_msgSend(objc_msgSend(a3, "stylesheet"), "variationOfStyle:propertyMap:", a3, v6);
}

- (BOOL)shouldFilterTextSource:(id)a3
{
  return 0;
}

- (TSWPStorage)storage
{
  return self->_storage;
}

- (BOOL)useDarkAppearance
{
  return self->_useDarkAppearance;
}

- (void)setUseDarkAppearance:(BOOL)a3
{
  self->_useDarkAppearance = a3;
}

- (double)fontSize
{
  return self->_fontSize;
}

- (void)setFontSize:(double)a3
{
  self->_fontSize = a3;
}

- (NSString)fontName
{
  return self->_fontName;
}

- (void)setFontName:(id)a3
{
  self->_fontName = (NSString *)a3;
}

- (unsigned)textAlignment
{
  return self->_textAlignment;
}

- (void)setTextAlignment:(unsigned int)a3
{
  self->_textAlignment = a3;
}

- (double)leftIndent
{
  return self->_leftIndent;
}

- (void)setLeftIndent:(double)a3
{
  self->_leftIndent = a3;
}

@end
