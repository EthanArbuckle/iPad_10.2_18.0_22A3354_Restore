@implementation TSWPLoadableFontInfo

- (void)dealloc
{
  objc_super v3;

  -[TSWPLoadableFontInfo setCgFont:](self, "setCgFont:", 0);
  v3.receiver = self;
  v3.super_class = (Class)TSWPLoadableFontInfo;
  -[TSWPLoadableFontInfo dealloc](&v3, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  int v5;

  if (a3 == self)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
    if (v5)
      LOBYTE(v5) = -[NSString isEqualToString:](-[TSWPLoadableFontInfo fontName](self, "fontName"), "isEqualToString:", objc_msgSend(a3, "fontName"));
  }
  return v5;
}

- (id)description
{
  const __CFString *v2;
  const __CFString *v3;

  v2 = CFSTR("yes");
  if (self->_obfuscated)
    v3 = CFSTR("yes");
  else
    v3 = CFSTR("no");
  if (!self->_attemptedLoad)
    v2 = CFSTR("no");
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<TSWPLoadableFontInfo groupUID=%@ name=%@ family=%@ obfuscated=%@ attemptedLoad=%@>"), self->_groupUID, self->_fontName, self->_fontFamily, v3, v2);
}

- (void)setCgFont:(CGFont *)a3
{
  CGFont *cgFont;
  CFErrorRef error;

  cgFont = self->_cgFont;
  if (cgFont != a3)
  {
    if (cgFont)
    {
      error = 0;
      CTFontManagerUnregisterGraphicsFont(cgFont, &error);
      CGFontRelease(self->_cgFont);
    }
    CGFontRetain(a3);
    self->_cgFont = a3;
  }
}

- (NSString)groupUID
{
  return self->_groupUID;
}

- (void)setGroupUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)fontPath
{
  return self->_fontPath;
}

- (void)setFontPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)fontName
{
  return self->_fontName;
}

- (void)setFontName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)fontFamily
{
  return self->_fontFamily;
}

- (void)setFontFamily:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (CGFont)cgFont
{
  return self->_cgFont;
}

- (BOOL)obfuscated
{
  return self->_obfuscated;
}

- (void)setObfuscated:(BOOL)a3
{
  self->_obfuscated = a3;
}

@end
