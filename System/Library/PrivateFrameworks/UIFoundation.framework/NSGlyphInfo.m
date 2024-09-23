@implementation NSGlyphInfo

+ (NSGlyphInfo)glyphInfoWithGlyphName:(NSString *)glyphName forFont:(NSFont *)font baseString:(NSString *)string
{
  uint64_t v8;

  v8 = -[UIFont glyphWithName:](font, "glyphWithName:");
  if (-[UIFont glyphWithName:](font, "glyphWithName:", glyphName))
    return (NSGlyphInfo *)-[NSGlyphNameGlyphInfo initWithGlyphName:glyph:forFont:baseString:]([NSGlyphNameGlyphInfo alloc], "initWithGlyphName:glyph:forFont:baseString:", glyphName, v8, font, string);
  else
    return 0;
}

+ (NSGlyphInfo)glyphInfoWithCGGlyph:(CGGlyph)glyph forFont:(NSFont *)font baseString:(NSString *)string
{
  return (NSGlyphInfo *)objc_msgSend((id)objc_opt_class(), "glyphInfoWithGlyph:forFont:baseString:", glyph, font, string);
}

+ (NSGlyphInfo)glyphInfoWithGlyph:(NSGlyph)glyph forFont:(NSFont *)font baseString:(NSString *)string
{
  uint64_t v7;

  v7 = *(_QWORD *)&glyph;
  if (-[UIFont numberOfGlyphs](font, "numberOfGlyphs") <= glyph)
    return 0;
  else
    return (NSGlyphInfo *)+[NSIdentityGlyphInfo glyphInfoWithGlyph:forFont:baseString:](NSIdentityGlyphInfo, "glyphInfoWithGlyph:forFont:baseString:", v7, font, string);
}

+ (NSGlyphInfo)glyphInfoWithCharacterIdentifier:(NSUInteger)cid collection:(NSCharacterCollection)characterCollection baseString:(NSString *)string
{
  if (characterCollection < (NSAdobeJapan2CharacterCollection|NSAdobeGB1CharacterCollection)
    || characterCollection == 255)
  {
    return (NSGlyphInfo *)+[NSCIDGlyphInfo glyphInfoWithCharacterIdentifier:collection:baseString:](NSCIDGlyphInfo, "glyphInfoWithCharacterIdentifier:collection:baseString:", cid);
  }
  else
  {
    return 0;
  }
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __NSGlyphInfoClassObject = (uint64_t)a1;
    objc_msgSend(a1, "setVersion:", 1);
  }
}

- (NSGlyphInfo)initWithBaseString:(id)a3
{
  NSGlyphInfo *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NSGlyphInfo;
  v4 = -[NSGlyphInfo init](&v6, sel_init);
  v4->_baseString = (NSString *)objc_msgSend(a3, "copy");
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSGlyphInfo;
  -[NSGlyphInfo dealloc](&v3, sel_dealloc);
}

- (unsigned)_glyphForFont:(id)a3 baseString:(id)a4
{
  return 0;
}

- (id)_baseString
{
  return self->_baseString;
}

- (NSString)glyphName
{
  return 0;
}

- (NSUInteger)characterIdentifier
{
  return 0;
}

- (NSCharacterCollection)characterCollection
{
  return 0;
}

- (CGGlyph)glyphID
{
  return 0;
}

- (NSString)baseString
{
  return self->_baseString;
}

- (void)encodeWithCoder:(id)a3
{
  int v5;
  NSString *baseString;

  v5 = objc_msgSend(a3, "allowsKeyedCoding");
  baseString = self->_baseString;
  if (v5)
  {
    if (baseString)
      objc_msgSend(a3, "encodeObject:forKey:", baseString, CFSTR("NSString"));
  }
  else
  {
    objc_msgSend(a3, "encodeObject:", baseString);
  }
}

- (Class)classForKeyedArchiver
{
  return (Class)__NSGlyphInfoClassObject;
}

- (NSGlyphInfo)initWithCoder:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSGlyphInfo *v10;
  uint64_t v11;
  NSGlyphInfo *v12;
  unsigned int v14;
  uint64_t v15;

  if (!objc_msgSend(a3, "allowsKeyedCoding"))
  {
    if (objc_msgSend(a3, "versionForClassName:", CFSTR("NSGlyphInfo"))
      || (v11 = objc_opt_class(), v11 != objc_opt_class()))
    {
      self->_baseString = (NSString *)(id)objc_msgSend(a3, "decodeObject");
      v10 = self;
      goto LABEL_9;
    }
    goto LABEL_15;
  }
  v5 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSString"));
  if (!v5)
    goto LABEL_15;
  v6 = v5;
  v7 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSFont"));
  if (!v7)
  {
    v14 = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("NSCID_RO"));
    if (v14)
    {
      v10 = +[NSGlyphInfo glyphInfoWithCharacterIdentifier:collection:baseString:](NSGlyphInfo, "glyphInfoWithCharacterIdentifier:collection:baseString:", v14 & 0xFFFFFF, HIBYTE(v14), v6);
      goto LABEL_9;
    }
LABEL_15:

    return +[NSGlyphInfo glyphInfoWithGlyph:forFont:baseString:](NSGlyphInfo, "glyphInfoWithGlyph:forFont:baseString:", 0, +[UIFont userFontOfSize:](NSFont, "userFontOfSize:", 0.0), &stru_1E260C7D0);
  }
  v8 = v7;
  v9 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSGlyphName"));
  if (v9)
  {
    v10 = +[NSGlyphInfo glyphInfoWithGlyphName:forFont:baseString:](NSGlyphInfo, "glyphInfoWithGlyphName:forFont:baseString:", v9, v8, v6);
    goto LABEL_9;
  }
  v15 = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("NSGlyph"));
  if (!(_DWORD)v15)
    goto LABEL_15;
  v10 = +[NSGlyphInfo glyphInfoWithGlyph:forFont:baseString:](NSGlyphInfo, "glyphInfoWithGlyph:forFont:baseString:", v15, v8, v6);
LABEL_9:
  v12 = v10;

  if (v12)
    return v12;
  return +[NSGlyphInfo glyphInfoWithGlyph:forFont:baseString:](NSGlyphInfo, "glyphInfoWithGlyph:forFont:baseString:", 0, +[UIFont userFontOfSize:](NSFont, "userFontOfSize:", 0.0), &stru_1E260C7D0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
