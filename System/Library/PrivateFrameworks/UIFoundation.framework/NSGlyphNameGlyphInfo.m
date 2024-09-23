@implementation NSGlyphNameGlyphInfo

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    objc_msgSend(a1, "setVersion:", 1);
}

- (NSGlyphNameGlyphInfo)initWithGlyphName:(id)a3 glyph:(unsigned int)a4 forFont:(id)a5 baseString:(id)a6
{
  NSGlyphNameGlyphInfo *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NSGlyphNameGlyphInfo;
  v7 = -[NSIdentityGlyphInfo initWithGlyph:forFont:baseString:](&v9, sel_initWithGlyph_forFont_baseString_, *(_QWORD *)&a4, a5, a6);
  v7->_name = (NSString *)a3;
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSGlyphNameGlyphInfo;
  -[NSIdentityGlyphInfo dealloc](&v3, sel_dealloc);
}

- (id)glyphName
{
  return self->_name;
}

- (void)encodeWithCoder:(id)a3
{
  int v5;
  NSString *name;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NSGlyphNameGlyphInfo;
  -[NSIdentityGlyphInfo encodeWithCoder:](&v7, sel_encodeWithCoder_);
  v5 = objc_msgSend(a3, "allowsKeyedCoding");
  name = self->_name;
  if (v5)
  {
    if (name)
      objc_msgSend(a3, "encodeObject:forKey:", name, CFSTR("NSGlyphName"));
  }
  else
  {
    objc_msgSend(a3, "encodeObject:", name);
  }
}

- (NSGlyphNameGlyphInfo)initWithCoder:(id)a3
{
  NSGlyphNameGlyphInfo *v5;
  uint64_t v6;
  uint64_t v7;
  NSGlyphNameGlyphInfo *v10;
  objc_super v11;
  objc_super v12;

  if (objc_msgSend(a3, "allowsKeyedCoding"))
  {
    v12.receiver = self;
    v12.super_class = (Class)NSGlyphNameGlyphInfo;
    return -[NSIdentityGlyphInfo initWithCoder:](&v12, sel_initWithCoder_, a3);
  }
  v6 = objc_msgSend(a3, "versionForClassName:", CFSTR("NSGlyphNameGlyphInfo"));
  v7 = objc_opt_class();
  if (v7 != objc_opt_class() || v6 != 0)
  {
    v11.receiver = self;
    v11.super_class = (Class)NSGlyphNameGlyphInfo;
    v5 = -[NSIdentityGlyphInfo initWithCoder:](&v11, sel_initWithCoder_, a3);
    v5->_name = (NSString *)(id)objc_msgSend(a3, "decodeObject");
    return v5;
  }
  v10 = +[NSGlyphInfo glyphInfoWithGlyph:forFont:baseString:](NSGlyphInfo, "glyphInfoWithGlyph:forFont:baseString:", 0, +[UIFont userFontOfSize:](NSFont, "userFontOfSize:", 0.0), &stru_1E260C7D0);

  return v10;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("glyph \"%@\", font %@, string \"%@\"), self->_name, self->super._font, self->super.super._baseString);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
