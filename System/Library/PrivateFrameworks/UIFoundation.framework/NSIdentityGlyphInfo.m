@implementation NSIdentityGlyphInfo

+ (id)glyphInfoWithGlyph:(unsigned int)a3 forFont:(id)a4 baseString:(id)a5
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithGlyph:forFont:baseString:", *(_QWORD *)&a3, a4, a5);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    objc_msgSend(a1, "setVersion:", 1);
}

- (NSIdentityGlyphInfo)initWithGlyph:(unsigned int)a3 forFont:(id)a4 baseString:(id)a5
{
  NSIdentityGlyphInfo *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NSIdentityGlyphInfo;
  v7 = -[NSGlyphInfo initWithBaseString:](&v9, sel_initWithBaseString_, a5);
  v7->_font = (NSFont *)a4;
  v7->_glyph = a3;
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSIdentityGlyphInfo;
  -[NSGlyphInfo dealloc](&v3, sel_dealloc);
}

- (unsigned)_glyphForFont:(id)a3 baseString:(id)a4
{
  unsigned int result;

  result = objc_msgSend(a4, "isEqualToString:", self->super._baseString);
  if (result)
  {
    if ((objc_msgSend(a3, "isEqual:", self->_font) & 1) != 0)
      return self->_glyph;
    -[UIFont pointSize](self->_font, "pointSize");
    result = objc_msgSend((id)objc_msgSend(a3, "fontWithSize:"), "isEqual:", self->_font);
    if (result)
      return self->_glyph;
  }
  return result;
}

- (id)_font
{
  return self->_font;
}

- (unsigned)_glyph
{
  return self->_glyph;
}

- (unsigned)glyph
{
  return self->_glyph;
}

- (void)encodeWithCoder:(id)a3
{
  int v5;
  NSFont *font;
  uint64_t glyph;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NSIdentityGlyphInfo;
  -[NSGlyphInfo encodeWithCoder:](&v8, sel_encodeWithCoder_);
  v5 = objc_msgSend(a3, "allowsKeyedCoding");
  font = self->_font;
  if (v5)
  {
    if (font)
      objc_msgSend(a3, "encodeObject:forKey:", font, CFSTR("NSFont"));
    glyph = self->_glyph;
    if ((_DWORD)glyph)
      objc_msgSend(a3, "encodeInt32:forKey:", glyph, CFSTR("NSGlyph"));
  }
  else
  {
    objc_msgSend(a3, "encodeObject:", font);
    objc_msgSend(a3, "encodeValueOfObjCType:at:", "I", &self->_glyph);
  }
}

- (NSIdentityGlyphInfo)initWithCoder:(id)a3
{
  NSIdentityGlyphInfo *v5;
  uint64_t v6;
  uint64_t v7;
  NSIdentityGlyphInfo *v10;
  objc_super v11;
  objc_super v12;

  if (objc_msgSend(a3, "allowsKeyedCoding"))
  {
    v12.receiver = self;
    v12.super_class = (Class)NSIdentityGlyphInfo;
    return -[NSGlyphInfo initWithCoder:](&v12, sel_initWithCoder_, a3);
  }
  v6 = objc_msgSend(a3, "versionForClassName:", CFSTR("NSIdentityGlyphInfo"));
  v7 = objc_opt_class();
  if (v7 != objc_opt_class() || v6 != 0)
  {
    v11.receiver = self;
    v11.super_class = (Class)NSIdentityGlyphInfo;
    v5 = -[NSGlyphInfo initWithCoder:](&v11, sel_initWithCoder_, a3);
    v5->_font = (NSFont *)(id)objc_msgSend(a3, "decodeObject");
    objc_msgSend(a3, "decodeValueOfObjCType:at:size:", "I", &v5->_glyph, 4);
    return v5;
  }
  v10 = +[NSGlyphInfo glyphInfoWithGlyph:forFont:baseString:](NSGlyphInfo, "glyphInfoWithGlyph:forFont:baseString:", 0, +[UIFont userFontOfSize:](NSFont, "userFontOfSize:", 0.0), &stru_1E260C7D0);

  return v10;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("glyph 0x%04X, font %@, string \"%@\"), self->_glyph, self->_font, self->super._baseString);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
