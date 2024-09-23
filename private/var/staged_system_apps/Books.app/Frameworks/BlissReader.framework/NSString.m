@implementation NSString

+ (id)stringFromNSIndexPath:(id)a3
{
  char *v4;
  id v5;
  char *v6;
  char *v7;

  v4 = (char *)objc_msgSend(a3, "length");
  v5 = +[NSMutableString string](NSMutableString, "string");
  if (v4)
  {
    v6 = v4 - 1;
    if (v6)
    {
      v7 = v6;
      do
      {
        objc_msgSend(v5, "appendFormat:", CFSTR("%lu."), objc_msgSend(a3, "indexAtPosition:", 0));
        --v7;
      }
      while (v7);
    }
    objc_msgSend(v5, "appendFormat:", CFSTR("%lu"), objc_msgSend(a3, "indexAtPosition:", v6));
  }
  return v5;
}

- (CGSize)sizeWithParagraphStyle:(id)a3
{
  double width;
  double height;
  const __CFAttributedString *v5;
  CTTypesetterRef v6;
  const __CTTypesetter *v7;
  const __CTLine *Line;
  const __CTLine *v9;
  float TypographicBounds;
  float v11;
  double v12;
  double v13;
  double v14;
  CGFloat ascent;
  CFRange v16;
  CGSize result;

  width = CGSizeZero.width;
  height = CGSizeZero.height;
  v5 = (const __CFAttributedString *)objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:paragraphStyle:", self, a3);
  v6 = CTTypesetterCreateWithAttributedString(v5);
  if (v6)
  {
    v7 = v6;
    v16.length = (CFIndex)-[__CFAttributedString length](v5, "length");
    v16.location = 0;
    Line = CTTypesetterCreateLine(v7, v16);
    if (Line)
    {
      v9 = Line;
      v14 = 0.0;
      ascent = 0.0;
      TypographicBounds = CTLineGetTypographicBounds(Line, &ascent, &v14, 0);
      width = ceilf(TypographicBounds);
      v11 = ascent + v14;
      height = ceilf(v11);
      CFRelease(v9);
    }
    CFRelease(v7);
  }

  v12 = width;
  v13 = height;
  result.height = v13;
  result.width = v12;
  return result;
}

+ (int64_t)normalizedCompare:(id)a3 with:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __CFString *v9;
  const __CFString *v10;
  uint64_t v12;
  uint64_t v13;

  if (a3 == a4)
    return 0;
  v12 = v5;
  v13 = v4;
  if (!a3)
  {
    v9 = &stru_43D7D8;
    if (a4)
      goto LABEL_4;
LABEL_7:
    v10 = &stru_43D7D8;
    return (int64_t)-[__CFString localizedCaseInsensitiveCompare:](v9, "localizedCaseInsensitiveCompare:", v10);
  }
  v9 = (__CFString *)objc_msgSend(a3, "normalizedStringForSearch");
  if (!a4)
    goto LABEL_7;
LABEL_4:
  v10 = (const __CFString *)objc_msgSend(a4, "normalizedStringForSearch", v12, v13, v6, v7);
  return (int64_t)-[__CFString localizedCaseInsensitiveCompare:](v9, "localizedCaseInsensitiveCompare:", v10);
}

- (id)normalizedStringForSearch
{
  NSArray *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v3 = -[NSString componentsSeparatedByCharactersInSet:](-[NSString stringByFoldingWithOptions:locale:](self, "stringByFoldingWithOptions:locale:", 1, +[NSLocale currentLocale](NSLocale, "currentLocale")), "componentsSeparatedByCharactersInSet:", +[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet"));
  v4 = objc_msgSend(objc_alloc((Class)NSMutableString), "initWithCapacity:", -[NSString length](self, "length"));
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v9, "length"))
        {
          if (objc_msgSend(v4, "length"))
            objc_msgSend(v4, "appendString:", CFSTR(" "));
          objc_msgSend(v4, "appendString:", v9);
        }
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }
  return v4;
}

- (id)normalizedStringsForPrefixSearch
{
  NSArray *v2;
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  unint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v2 = -[NSString componentsSeparatedByCharactersInSet:](-[NSString stringByFoldingWithOptions:locale:](self, "stringByFoldingWithOptions:locale:", 1, +[NSLocale currentLocale](NSLocale, "currentLocale")), "componentsSeparatedByCharactersInSet:", +[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet"));
  v3 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSArray count](v2, "count"));
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v8, "length"))
        {
          if (objc_msgSend(v3, "count"))
          {
            v9 = 0;
            do
            {
              objc_msgSend(v3, "replaceObjectAtIndex:withObject:", v9, objc_msgSend(objc_msgSend(v3, "objectAtIndex:", v9), "stringByAppendingFormat:", CFSTR(" %@"), v8));
              ++v9;
            }
            while (v9 < (unint64_t)objc_msgSend(v3, "count"));
          }
          objc_msgSend(v3, "addObject:", v8);
        }
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }
  return v3;
}

- (id)stringByTransformingForTHNotesSectionHeader
{
  return -[NSString stringByTrimmingCharactersInSet:](self, "stringByTrimmingCharactersInSet:", +[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet"));
}

+ (NSString)stringWithUUID
{
  const __CFUUID *v2;
  __CFString *v3;

  v2 = CFUUIDCreate(0);
  v3 = (__CFString *)CFUUIDCreateString(0, v2);
  CFRelease(v2);
  return (NSString *)v3;
}

- (NSString)stringWithURLFromCssUriValue
{
  return -[NSString substringWithRange:](self, "substringWithRange:", 4, (char *)-[NSString length](self, "length") - 5);
}

- (id)stringByFixingCharactersWithLatinFontFamilyName:(id)a3 symbolFontFamilyName:(id)a4
{
  -[NSString length](self, "length");
  operator new[]();
}

- (BOOL)startsWithString:(id)a3
{
  id v3;
  uint64_t v4;

  v3 = -[NSString rangeOfString:](self, "rangeOfString:", a3);
  return v4 && v3 == 0;
}

- (BOOL)doesURLHostContainWhitespace
{
  id v2;
  BOOL v3;

  v2 = objc_msgSend(objc_alloc((Class)NSURL), "initWithString:", self);
  if (objc_msgSend(v2, "host"))
    v3 = objc_msgSend(objc_msgSend(v2, "host"), "rangeOfCharacterFromSet:", +[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet")) != (id)0x7FFFFFFFFFFFFFFFLL;
  else
    v3 = 0;

  return v3;
}

- (NSString)initWithXmlString:(const char *)a3
{
  if (a3)
    return -[NSString initWithUTF8String:](self, "initWithUTF8String:");

  return 0;
}

+ (NSString)stringWithXmlString:(const char *)a3
{
  return (NSString *)objc_msgSend(objc_alloc((Class)a1), "initWithXmlString:", a3);
}

- (NSString)initWithValueOfXmlAttribute:(_xmlAttr *)a3
{
  xmlChar *String;
  xmlChar *v5;
  NSString *v6;

  String = xmlNodeListGetString(a3->doc, a3->children, 1);
  if (!String)
    return -[NSString init](self, "init");
  v5 = String;
  v6 = -[NSString initWithXmlString:](self, "initWithXmlString:", String);
  xmlFree(v5);
  return v6;
}

- (NSString)initWithContentOfXmlNode:(_xmlNode *)a3
{
  xmlChar *Content;
  xmlChar *v5;
  NSString *v6;

  Content = xmlNodeGetContent(a3);
  if (!Content)
    return -[NSString init](self, "init");
  v5 = Content;
  v6 = -[NSString initWithXmlString:](self, "initWithXmlString:", Content);
  xmlFree(v5);
  return v6;
}

- (id)initFromXmlNode:(_xmlNode *)a3 ns:(const char *)a4 attributeName:(const char *)a5
{
  xmlChar *NsProp;
  xmlChar *v7;
  NSString *v8;

  NsProp = xmlGetNsProp(a3, (const xmlChar *)a5, (const xmlChar *)a4);
  if (NsProp)
  {
    v7 = NsProp;
    v8 = -[NSString initWithXmlString:](self, "initWithXmlString:", NsProp);
    xmlFree(v7);
    return v8;
  }
  else
  {

    return 0;
  }
}

- (id)componentsSeparatedByWhitespace
{
  id v3;
  unint64_t v4;
  unint64_t v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  __uint32_t v11;
  unsigned int v12;

  v3 = +[NSMutableArray array](NSMutableArray, "array");
  v4 = -[NSString length](self, "length");
  v5 = 0;
  if (!v4)
    goto LABEL_10;
  do
  {
    v6 = -[NSString characterAtIndex:](self, "characterAtIndex:", v5);
    if (v6 <= 0x7F)
    {
      if ((_DefaultRuneLocale.__runetype[v6] & 0x4000) == 0)
        goto LABEL_8;
    }
    else if (!__maskrune(v6, 0x4000uLL))
    {
      goto LABEL_8;
    }
    ++v5;
  }
  while (v4 != v5);
  v5 = v4;
LABEL_8:
  if (v5)
    objc_msgSend(v3, "addObject:", &stru_43D7D8);
LABEL_10:
  while (v5 < v4)
  {
    v7 = 0;
    do
    {
      v8 = v7;
      v9 = v5 + v7;
      if (v5 + v7 + 1 >= v4)
        break;
      v10 = -[NSString characterAtIndex:](self, "characterAtIndex:");
      v11 = v10 <= 0x7F ? _DefaultRuneLocale.__runetype[v10] & 0x4000 : __maskrune(v10, 0x4000uLL);
      v7 = v8 + 1;
    }
    while (!v11);
    objc_msgSend(v3, "addObject:", -[NSString substringWithRange:](self, "substringWithRange:", v5, v8 + 1));
    v5 = v9 + 2;
    if (v9 + 2 < v4)
    {
      do
      {
        v12 = -[NSString characterAtIndex:](self, "characterAtIndex:", v5);
        if (v12 <= 0x7F)
        {
          if ((_DefaultRuneLocale.__runetype[v12] & 0x4000) == 0)
            goto LABEL_10;
        }
        else if (!__maskrune(v12, 0x4000uLL))
        {
          goto LABEL_10;
        }
        ++v5;
      }
      while (v5 < v4);
      goto LABEL_25;
    }
  }
  if (v5 != v4)
    return v3;
LABEL_25:
  objc_msgSend(v3, "addObject:", &stru_43D7D8);
  return v3;
}

- (BOOL)isEqualToXmlString:(const char *)a3
{
  return -[NSString isEqualToString:](self, "isEqualToString:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", a3));
}

- (unsigned)createQueryString
{
  NSString *v3;
  NSUInteger v4;
  unsigned __int16 *v5;

  v3 = -[NSString lowercaseString](self, "lowercaseString");
  v4 = -[NSString length](self, "length");
  v5 = (unsigned __int16 *)malloc_type_calloc(v4 + 1, 2uLL, 0x1000040BDFB0063uLL);
  -[NSString getCharacters:range:](v3, "getCharacters:range:", v5, 0, v4);
  return v5;
}

@end
