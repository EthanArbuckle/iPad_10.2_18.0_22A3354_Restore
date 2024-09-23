@implementation TSWPHyperlinkField

- (void)setURL:(id)a3
{
  id v5;

  -[TSPObject willModify](self, "willModify");
  v5 = a3;

  self->_url = (NSURL *)a3;
}

+ (id)defaultFieldStyleIdentifier
{
  return CFSTR("character-style-hyperlink");
}

- (NSString)displayText
{
  NSString *result;
  TSWPStorage *v4;
  uint64_t v5;
  uint64_t v6;

  result = -[TSWPSmartField parentStorage](self, "parentStorage");
  if (result)
  {
    v4 = -[TSWPSmartField parentStorage](self, "parentStorage");
    v5 = -[TSWPSmartField range](self, "range");
    return (NSString *)-[TSWPStorage substringWithRange:](v4, "substringWithRange:", v5, v6);
  }
  return result;
}

+ (int)schemeFromURL:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;

  if (!a3)
    return 8;
  v4 = (void *)objc_msgSend((id)objc_msgSend(a3, "scheme"), "lowercaseString");
  if (v4)
  {
    v5 = v4;
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("http")) & 1) != 0
      || (objc_msgSend(v5, "isEqualToString:", CFSTR("https")) & 1) != 0)
    {
      return 0;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("file")) & 1) != 0
           || (objc_msgSend(v5, "isEqualToString:", CFSTR("keynote")) & 1) != 0)
    {
      return 1;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("mailto")) & 1) != 0)
    {
      return 2;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("tel")) & 1) != 0)
    {
      return 7;
    }
    else if (objc_msgSend(v5, "isEqualToString:", CFSTR("pages")))
    {
      return 4;
    }
    else
    {
      return 8;
    }
  }
  else
  {
    v7 = (void *)objc_msgSend(a3, "absoluteString");
    v6 = 8;
    if (v7)
    {
      v8 = v7;
      v9 = objc_msgSend(v7, "rangeOfString:", CFSTR("#")) ? 8 : 3;
      v10 = objc_msgSend(v8, "rangeOfString:", CFSTR("?slide="));
      v11 = objc_msgSend(v8, "rangeOfString:", CFSTR("?action=retreat"));
      v12 = !v10 || v11 == 0;
      v6 = v12 ? 5 : v9;
      if (!objc_msgSend(v8, "rangeOfString:", CFSTR("?action=exitpresentation")))
        return 6;
    }
  }
  return v6;
}

- (id)canonicalRepresentationURL
{
  unsigned int v3;

  v3 = -[TSWPHyperlinkField scheme](self, "scheme");
  if (v3 <= 7 && ((1 << v3) & 0x87) != 0)
    return -[TSWPHyperlinkField url](self, "url");
  else
    return 0;
}

+ (BOOL)schemeIsValidForURL:(id)a3
{
  void *v4;
  uint64_t v5;

  v4 = (void *)objc_msgSend(+[TSKApplicationDelegate sharedDelegate](TSKApplicationDelegate, "sharedDelegate"), "invalidURLSchemes");
  v5 = objc_msgSend((id)objc_msgSend(a3, "scheme"), "lowercaseString");
  if (v5)
    LOBYTE(v5) = objc_msgSend(v4, "member:", v5) == 0;
  return v5;
}

+ (BOOL)schemeIsValidForURLReference:(id)a3
{
  uint64_t v3;
  void *v4;
  char v5;

  v3 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", a3);
  if (v3)
  {
    v4 = (void *)v3;
    v5 = objc_msgSend((id)objc_opt_class(), "schemeIsValidForURL:", v3);

    LOBYTE(v3) = v5;
  }
  return v3;
}

+ (id)defaultURLFromDefaultsKey:(id)a3 defaultValue:(id)a4
{
  uint64_t v5;
  void *v6;
  id result;

  v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults"), "objectForKey:", a3);
  if (!v5)
    return (id)objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", a4);
  v6 = (void *)v5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return (id)objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", a4);
  if (!objc_msgSend(v6, "length"))
    return (id)objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", a4);
  result = (id)objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v6);
  if (!result)
    return (id)objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", a4);
  return result;
}

+ (id)defaultWebURL
{
  return (id)objc_msgSend(a1, "defaultURLFromDefaultsKey:defaultValue:", CFSTR("DefaultWebURL"), objc_msgSend((id)TSWPBundle(), "localizedStringForKey:value:table:", CFSTR("http://www.apple.com"), &stru_24D82FEB0, CFSTR("TSText")));
}

+ (id)defaultFileURL
{
  uint64_t v2;
  void *v3;

  v2 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults"), "objectForKey:", CFSTR("DefaultFileURL"));
  if (v2 && (v3 = (void *)v2, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && objc_msgSend(v3, "length"))
    return (id)objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v3);
  else
    return 0;
}

+ (id)defaultMailURL
{
  return (id)objc_msgSend(a1, "defaultURLFromDefaultsKey:defaultValue:", CFSTR("DefaultMailURL"), CFSTR("mailto:no_reply@apple.com"));
}

+ (id)urlReferenceFromURL:(id)a3
{
  __CFString *v4;
  __CFString *v5;
  const __CFString *v6;
  CFStringRef v7;
  CFStringRef v8;
  void *v9;

  if (!a3)
    return 0;
  if (!objc_msgSend(a3, "isFileURL"))
    return (id)objc_msgSend(a3, "absoluteString");
  v4 = (__CFString *)CFURLCopyFileSystemPath((CFURLRef)a3, kCFURLPOSIXPathStyle);
  if (v4
    && (v5 = v4,
        v6 = (const __CFString *)-[__CFString stringByAbbreviatingWithTildeInPath](v4, "stringByAbbreviatingWithTildeInPath"), CFRelease(v5), (v7 = CFURLCreateStringByAddingPercentEscapes(0, v6, 0, 0, 0x8000100u)) != 0))
  {
    v8 = v7;
    v9 = (void *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("file://%@"), v7);
    CFRelease(v8);
  }
  else
  {
    v9 = 0;
  }
  if (v9)
    return v9;
  else
    return CFSTR("file://");
}

+ (id)newURLFromURLReference:(id)a3
{
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  id result;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;

  if (!a3)
    return 0;
  if (!objc_msgSend(a3, "hasPrefix:", CFSTR("file://")))
  {
    result = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", a3);
    if (result)
      return result;
    v10 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v11 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSWPHyperlinkField newURLFromURLReference:]");
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPHyperlinkField.mm"), 394, CFSTR("Failed to create an NSURL from \"%@\"), a3);
    if (objc_msgSend(a3, "hasPrefix:", CFSTR("mailto:")))
    {
      v12 = +[TSWPHyperlinkField defaultMailURL](TSWPHyperlinkField, "defaultMailURL");
      return v12;
    }
    return 0;
  }
  v4 = (__CFString *)objc_msgSend(a3, "substringFromIndex:", objc_msgSend(CFSTR("file://"), "length"));
  if (!v4)
    goto LABEL_14;
  v5 = v4;
  if (!-[__CFString length](v4, "length"))
    goto LABEL_14;
  v6 = (__CFString *)CFURLCreateStringByReplacingPercentEscapes(0, v5, &stru_24D82FEB0);
  if (v6)
  {
    v7 = v6;
    v8 = (__CFString *)-[__CFString stringByExpandingTildeInPath](v6, "stringByExpandingTildeInPath");
    CFRelease(v7);
    if (!v8)
      goto LABEL_14;
LABEL_13:
    if (-[__CFString length](v8, "length"))
      goto LABEL_15;
    goto LABEL_14;
  }
  v8 = (__CFString *)-[__CFString stringByExpandingTildeInPath](v5, "stringByExpandingTildeInPath");
  if (v8)
    goto LABEL_13;
LABEL_14:
  v8 = CFSTR("/");
LABEL_15:
  result = (id)MEMORY[0x219A13DE0](0, v8, 0, 0, 0);
  if (!result)
  {
    v13 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v14 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSWPHyperlinkField newURLFromURLReference:]");
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPHyperlinkField.mm"), 384, CFSTR("Failed to create a CFURL from path \"%@\"), v8);
    v12 = +[TSWPHyperlinkField defaultFileURL](TSWPHyperlinkField, "defaultFileURL");
    return v12;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSWPHyperlinkField;
  -[TSWPSmartField dealloc](&v3, sel_dealloc);
}

- (TSWPHyperlinkField)initWithContext:(id)a3 url:(id)a4
{
  TSWPHyperlinkField *v5;
  TSWPHyperlinkField *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TSWPHyperlinkField;
  v5 = -[TSWPSmartField initWithContext:](&v8, sel_initWithContext_, a3);
  v6 = v5;
  if (v5)
    -[TSWPHyperlinkField setURL:](v5, "setURL:", a4);
  return v6;
}

- (id)copyWithContext:(id)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", -[TSWPHyperlinkField zone](self, "zone")), "initWithContext:url:", a3, self->_url);
}

- (void)adoptStylesheet:(id)a3 withMapper:(id)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TSWPHyperlinkField;
  -[TSWPSmartField adoptStylesheet:withMapper:](&v4, sel_adoptStylesheet_withMapper_, a3, a4);
}

- (int)elementKind
{
  return 512;
}

- (BOOL)allowsEditing
{
  return 0;
}

- (NSURL)url
{
  NSURL *result;
  uint64_t v4;
  uint64_t v5;

  result = self->_url;
  if (!result)
  {
    v4 = -[TSWPSmartField range](self, "range");
    if (v4 == 0x7FFFFFFFFFFFFFFFLL)
      return 0;
    else
      return (NSURL *)(id)objc_msgSend((id)objc_opt_class(), "newURLFromURLReference:", -[TSWPStorage substringWithRange:](-[TSWPSmartField parentStorage](self, "parentStorage"), "substringWithRange:", v4, v5));
  }
  return result;
}

- (id)urlReference
{
  uint64_t v4;
  uint64_t v5;

  if (self->_url)
    return (id)objc_msgSend((id)objc_opt_class(), "urlReferenceFromURL:", self->_url);
  v4 = -[TSWPSmartField range](self, "range");
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  else
    return -[TSWPStorage substringWithRange:](-[TSWPSmartField parentStorage](self, "parentStorage"), "substringWithRange:", v4, v5);
}

- (void)setURLReference:(id)a3
{
  uint64_t v4;
  id v5;

  v4 = objc_msgSend((id)objc_opt_class(), "newURLFromURLReference:", a3);
  if (v4)
  {
    v5 = (id)v4;
    -[TSWPHyperlinkField setURL:](self, "setURL:", v4);

  }
}

- (int)scheme
{
  return objc_msgSend((id)objc_opt_class(), "schemeFromURL:", -[TSWPHyperlinkField url](self, "url"));
}

- (id)urlPrefix
{
  NSString *v2;
  NSString *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v2 = -[NSURL absoluteString](-[TSWPHyperlinkField url](self, "url"), "absoluteString");
  if (v2
    && (v3 = v2,
        v4 = -[NSString length](v2, "length"),
        (v5 = -[NSString findIndexOfCharacter:range:](v3, "findIndexOfCharacter:range:", 58, 0, v4)) != 0)
    && (v6 = v5, v5 != 0x7FFFFFFFFFFFFFFFLL)
    && v5 < -[NSString findIndexOfCharacter:range:](v3, "findIndexOfCharacter:range:", 47, 0, v4)
    && v6 < -[NSString findIndexOfCharacter:range:](v3, "findIndexOfCharacter:range:", 63, 0, v4)
    && v6 < -[NSString findIndexOfCharacter:range:](v3, "findIndexOfCharacter:range:", 35, 0, v4))
  {
    return -[NSString substringWithRange:](v3, "substringWithRange:", 0, v6);
  }
  else
  {
    return &stru_24D82FEB0;
  }
}

- (BOOL)isFileURL
{
  return -[NSURL isFileURL](-[TSWPHyperlinkField url](self, "url"), "isFileURL");
}

- (BOOL)hasDisplayText
{
  return self->_url != 0;
}

- (id)filePath
{
  NSURL *v2;
  __CFString *v3;
  __CFString *v4;

  v2 = -[TSWPHyperlinkField url](self, "url");
  if (!-[NSURL isFileURL](v2, "isFileURL"))
    return 0;
  v3 = (__CFString *)CFURLCopyFileSystemPath((CFURLRef)v2, kCFURLPOSIXPathStyle);
  v4 = v3;
  return v3;
}

- (id)fullPath
{
  id v2;
  void *v3;
  void *v4;

  v2 = -[TSWPHyperlinkField filePath](self, "filePath");
  v3 = v2;
  if (v2
    && (objc_msgSend(v2, "isAbsolutePath") & 1) == 0
    && (v4 = (void *)objc_msgSend(CFSTR("~"), "stringByExpandingTildeInPath")) != 0)
  {
    return (id)objc_msgSend(v4, "stringByAppendingPathComponent:", v3);
  }
  else
  {
    return v3;
  }
}

@end
