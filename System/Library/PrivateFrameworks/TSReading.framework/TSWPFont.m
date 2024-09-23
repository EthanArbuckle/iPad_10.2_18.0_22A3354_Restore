@implementation TSWPFont

+ (id)fontWithName:(id)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithFontName:compatibilityName:", a3, 0);
}

+ (id)fontWithName:(id)a3 compatibilityName:(id)a4
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithFontName:compatibilityName:", a3, a4);
}

- (TSWPFont)initWithFontName:(id)a3
{
  return -[TSWPFont initWithFontName:compatibilityName:](self, "initWithFontName:compatibilityName:", a3, 0);
}

- (TSWPFont)initWithFontName:(id)a3 compatibilityName:(id)a4
{
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  TSWPFont *v11;
  TSWPFont *v12;
  objc_super v14;

  if (!a3)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPFont initWithFontName:compatibilityName:]");
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPFont.mm"), 51, CFSTR("invalid nil value for '%s'"), "fontName");
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v9 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPFont initWithFontName:compatibilityName:]");
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPFont.mm"), 52, CFSTR("Wrong class for fontName"));
  }
  v14.receiver = self;
  v14.super_class = (Class)TSWPFont;
  v11 = -[TSWPFont init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    if (a3)
    {
      -[TSWPFont setFontName:](v11, "setFontName:", a3);
      -[TSWPFont setCompatibilityName:](v12, "setCompatibilityName:", a4);
    }
    else
    {

      return 0;
    }
  }
  return v12;
}

- (TSWPFont)init
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPFont init]");
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPFont.mm"), 73, CFSTR("Failed to call designated initializer"));
  return 0;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSWPFont;
  -[TSWPFont dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[TSWPFont initWithFontName:compatibilityName:]([TSWPFont alloc], "initWithFontName:compatibilityName:", -[TSWPFont fontName](self, "fontName"), -[TSWPFont compatibilityName](self, "compatibilityName"));
}

- (unint64_t)hash
{
  unint64_t result;
  NSUInteger v4;

  result = self->_hash;
  if (!result)
  {
    v4 = -[NSString hash](-[TSWPFont fontName](self, "fontName"), "hash");
    result = -[NSString hash](-[TSWPFont compatibilityName](self, "compatibilityName"), "hash") + v4;
    self->_hash = result;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;

  objc_opt_class();
  v4 = TSUDynamicCast();
  if (v4)
  {
    v5 = (void *)v4;
    v6 = -[TSWPFont fontName](self, "fontName");
    v7 = objc_msgSend(v5, "fontName");
    if (!(v6 | v7) || (LODWORD(v4) = objc_msgSend((id)v6, "isEqual:", v7), (_DWORD)v4))
    {
      v8 = -[TSWPFont compatibilityName](self, "compatibilityName");
      v9 = objc_msgSend(v5, "compatibilityName");
      if (v8 | v9)
        LOBYTE(v4) = objc_msgSend((id)v8, "isEqual:", v9);
      else
        LOBYTE(v4) = 1;
    }
  }
  return v4;
}

- (NSString)compatibilityName
{
  if (-[NSString isEqualToString:](self->_compatibilityName, "isEqualToString:", objc_msgSend(+[TSWPFontCache sharedCache](TSWPFontCache, "sharedCache"), "displayNameForFontFamily:", -[TSWPFont familyName](self, "familyName"))))
  {
    return 0;
  }
  else
  {
    return self->_compatibilityName;
  }
}

- (NSString)displayName
{
  NSString *displayName;
  void *v4;
  uint64_t v5;
  NSString *v6;

  displayName = self->_displayName;
  if (!displayName)
  {
    displayName = (NSString *)objc_msgSend(+[TSWPFontCache sharedCache](TSWPFontCache, "sharedCache"), "displayNameForFontFamily:", -[TSWPFont familyName](self, "familyName"));
    if (!displayName)
    {
      v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPFont displayName]");
      objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPFont.mm"), 131, CFSTR("invalid nil value for '%s'"), "result");
    }
    v6 = -[TSWPFont compatibilityName](self, "compatibilityName");
    if (v6)
      displayName = (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", objc_msgSend((id)TSWPBundle(), "localizedStringForKey:value:table:", CFSTR("%@ (%@)"), &stru_24D82FEB0, CFSTR("TSText")), displayName, v6);
    self->_displayName = (NSString *)-[NSString copy](displayName, "copy");
  }
  return displayName;
}

- (NSString)familyName
{
  NSString *familyName;
  NSString *fontName;
  void *v5;
  uint64_t v6;
  const __CTFontDescriptor *v7;
  const __CTFontDescriptor *v8;
  NSString *v9;
  void *v10;
  uint64_t v11;
  const __CTFont *v12;
  void *v13;
  uint64_t v14;

  familyName = self->_familyName;
  if (familyName)
    return familyName;
  fontName = self->_fontName;
  if (!fontName)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPFont familyName]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPFont.mm"), 152, CFSTR("invalid nil value for '%s'"), "_fontName");
    fontName = self->_fontName;
    if (!fontName)
      return 0;
  }
  v7 = CTFontDescriptorCreateWithNameAndSize((CFStringRef)fontName, 0.0);
  if (!v7)
  {
    v10 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v11 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPFont familyName]");
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPFont.mm"), 156, CFSTR("invalid nil value for '%s'"), "desc");
    return 0;
  }
  v8 = v7;
  v9 = (NSString *)CTFontDescriptorCopyAttribute(v7, (CFStringRef)*MEMORY[0x24BDC4D08]);
  if (v9)
  {
    familyName = v9;
    self->_familyName = v9;
  }
  else
  {
    v12 = (const __CTFont *)TSWPCreateFontWithName((uint64_t)self->_fontName, 0.0);
    if (!v12)
    {
      v13 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v14 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPFont familyName]");
      objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPFont.mm"), 167, CFSTR("invalid nil value for '%s'"), "ctFont");
    }
    familyName = (NSString *)CTFontCopyFamilyName(v12);
    self->_familyName = familyName;
    self->_compatibilityName = (NSString *)-[NSString copy](self->_fontName, "copy");
    CFRelease(v12);
  }
  CFRelease(v8);
  return familyName;
}

+ (BOOL)isKeyValueProxyLeafType
{
  return 1;
}

- (NSString)fontName
{
  return self->_fontName;
}

- (void)setFontName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setCompatibilityName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

@end
