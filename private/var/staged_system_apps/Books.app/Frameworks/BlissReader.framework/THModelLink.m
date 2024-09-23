@implementation THModelLink

- (THModelLink)initWithTarget:(id)a3 context:(id)a4
{
  THModelLink *v5;
  THModelLink *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)THModelLink;
  v5 = -[THModelLink initWithContext:](&v8, "initWithContext:", a4);
  v6 = v5;
  if (v5)
  {
    -[THModelLink setTarget:](v5, "setTarget:", a3);
    -[THModelLink setUrl:](v6, "setUrl:", +[NSURL URLWithString:](NSURL, "URLWithString:", a3));
    -[THModelLink setCachedAbsolutePageIndex:](v6, "setCachedAbsolutePageIndex:", 0x7FFFFFFFFFFFFFFFLL);
  }
  return v6;
}

- (THModelLink)initWithPath:(id)a3 fragment:(id)a4 context:(id)a5
{
  id v9;
  id v10;
  id v11;

  v9 = objc_alloc_init((Class)NSURLComponents);
  objc_msgSend(v9, "setScheme:", CFSTR("apub"));
  objc_msgSend(v9, "setPath:", a3);
  v10 = objc_msgSend(objc_msgSend(v9, "URL"), "absoluteString");
  v11 = v10;
  if (a4)
    v11 = objc_msgSend(v10, "stringByAppendingFormat:", CFSTR("#%@"), a4);
  return -[THModelLink initWithTarget:context:](self, "initWithTarget:context:", v11, a5);
}

- (void)dealloc
{
  objc_super v3;

  -[THModelLink setUrl:](self, "setUrl:", 0);
  -[THModelLink setTarget:](self, "setTarget:", 0);
  v3.receiver = self;
  v3.super_class = (Class)THModelLink;
  -[THModelLink dealloc](&v3, "dealloc");
}

+ (id)modelLinkWithChapterGUID:(id)a3 context:(id)a4
{
  if (a3)
    return -[THModelLink initWithTarget:context:]([THModelLink alloc], "initWithTarget:context:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("ibooks:///#chapterguid(%@)"), a3), a4);
  else
    return 0;
}

- (BOOL)targetIsApplePub
{
  NSString *v2;

  v2 = -[NSString lowercaseString](-[NSURL scheme](-[THModelLink url](self, "url"), "scheme"), "lowercaseString");
  if (-[NSString length](v2, "length"))
    return -[NSString isEqualToString:](v2, "isEqualToString:", CFSTR("apub"));
  else
    return 1;
}

- (BOOL)targetIsiBooks
{
  return -[NSString isEqualToString:](-[NSString lowercaseString](-[NSURL scheme](-[THModelLink url](self, "url"), "scheme"), "lowercaseString"), "isEqualToString:", CFSTR("ibooks"));
}

- (id)docPath
{
  if (-[THModelLink targetIsApplePub](self, "targetIsApplePub"))
    return -[NSURL path](-[THModelLink url](self, "url"), "path");
  else
    return 0;
}

- (id)docId
{
  NSArray *v3;

  if (!-[THModelLink targetIsApplePub](self, "targetIsApplePub")
    || !-[NSString hasPrefix:](-[NSURL path](-[THModelLink url](self, "url"), "path"), "hasPrefix:", CFSTR("/")))
  {
    return 0;
  }
  v3 = -[NSURL pathComponents](-[THModelLink url](self, "url"), "pathComponents");
  if (-[NSArray count](v3, "count") <= 3)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THModelLink docId]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Model/THModelLink.m"), 103, CFSTR("ApplePub URL lacks isbn/uniq/vers at %@"), -[NSURL absoluteString](-[THModelLink url](self, "url"), "absoluteString"));
  if (-[NSArray count](v3, "count") >= 4)
    return -[NSArray componentsJoinedByString:](-[NSArray subarrayWithRange:](v3, "subarrayWithRange:", 1, 3), "componentsJoinedByString:", CFSTR("/"));
  else
    return 0;
}

- (id)docRelativePath
{
  unsigned int v3;
  NSURL *v4;
  NSArray *v5;

  if (!-[THModelLink targetIsApplePub](self, "targetIsApplePub"))
    return 0;
  v3 = -[NSString hasPrefix:](-[NSURL path](-[THModelLink url](self, "url"), "path"), "hasPrefix:", CFSTR("/"));
  v4 = -[THModelLink url](self, "url");
  if (v3)
  {
    v5 = -[NSURL pathComponents](v4, "pathComponents");
    if (-[NSArray count](v5, "count") <= 3)
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THModelLink docRelativePath]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Model/THModelLink.m"), 119, CFSTR("ApplePub URL lacks isbn/uniq/vers at %@"), -[NSURL absoluteString](-[THModelLink url](self, "url"), "absoluteString"));
    if (-[NSArray count](v5, "count") >= 4)
      return -[NSArray componentsJoinedByString:](-[NSArray subarrayWithRange:](v5, "subarrayWithRange:", 4, (char *)-[NSArray count](v5, "count") - 4), "componentsJoinedByString:", CFSTR("/"));
    return 0;
  }
  return -[NSURL path](v4, "path");
}

- (id)fragment
{
  if (-[THModelLink targetIsApplePub](self, "targetIsApplePub")
    || -[THModelLink targetIsiBooks](self, "targetIsiBooks"))
  {
    return -[NSURL fragment](-[THModelLink url](self, "url"), "fragment");
  }
  else
  {
    return 0;
  }
}

- (BOOL)isRelative
{
  if (-[NSString isEqual:](-[NSURL relativeString](-[THModelLink url](self, "url"), "relativeString"), "isEqual:", -[NSURL absoluteString](-[THModelLink url](self, "url"), "absoluteString")))return !-[NSString hasPrefix:](-[NSURL path](-[THModelLink url](self, "url"), "path"), "hasPrefix:", CFSTR("/"));
  else
    return 1;
}

- (id)p_parameterValueFromFragmentWithFunction:(id)a3
{
  NSString *v4;
  _BYTE *v5;

  v4 = -[NSString stringByTrimmingCharactersInSet:](-[NSURL fragment](-[THModelLink url](self, "url"), "fragment"), "stringByTrimmingCharactersInSet:", +[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet"));
  v5 = objc_msgSend(a3, "length");
  if (v5 + 2 >= (_BYTE *)-[NSString length](v4, "length"))
    return 0;
  else
    return -[NSString substringWithRange:](v4, "substringWithRange:", v5 + 1, (_BYTE *)-[NSString length](v4, "length") - v5 - 2);
}

- (BOOL)p_fragmentIsFunction:(id)a3
{
  NSString *v4;
  unsigned int v5;

  v4 = -[NSString stringByTrimmingCharactersInSet:](-[NSURL fragment](-[THModelLink url](self, "url"), "fragment"), "stringByTrimmingCharactersInSet:", +[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet"));
  v5 = -[NSString hasPrefix:](v4, "hasPrefix:", objc_msgSend(a3, "stringByAppendingString:", CFSTR("(")));
  if (v5)
    LOBYTE(v5) = -[NSString hasSuffix:](v4, "hasSuffix:", CFSTR(")"));
  return v5;
}

- (BOOL)isPageLink
{
  NSString *v3;

  v3 = -[NSString stringByTrimmingCharactersInSet:](-[NSURL fragment](-[THModelLink url](self, "url"), "fragment"), "stringByTrimmingCharactersInSet:", +[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet"));
  if (-[THModelLink targetIsiBooks](self, "targetIsiBooks") && -[NSString hasPrefix:](v3, "hasPrefix:", CFSTR("page(")))
    return -[NSString hasSuffix:](v3, "hasSuffix:", CFSTR(")"));
  else
    return 0;
}

- (BOOL)isChapterLink
{
  _BOOL4 v3;

  v3 = -[THModelLink targetIsiBooks](self, "targetIsiBooks");
  if (v3)
    LOBYTE(v3) = -[THModelLink p_fragmentIsFunction:](self, "p_fragmentIsFunction:", CFSTR("chapter"));
  return v3;
}

- (BOOL)isChapterGuidLink
{
  _BOOL4 v3;

  v3 = -[THModelLink targetIsiBooks](self, "targetIsiBooks");
  if (v3)
    LOBYTE(v3) = -[THModelLink p_fragmentIsFunction:](self, "p_fragmentIsFunction:", CFSTR("chapterguid"));
  return v3;
}

- (BOOL)hasAssetID
{
  return objc_msgSend(+[NSURL assetIDFromURL:](NSURL, "assetIDFromURL:", -[THModelLink url](self, "url")), "integerValue") != 0;
}

- (id)pageNumberString
{
  NSString *v3;

  if (-[THModelLink isPageLink](self, "isPageLink")
    && (v3 = -[NSString stringByTrimmingCharactersInSet:](-[NSURL fragment](-[THModelLink url](self, "url"), "fragment"), "stringByTrimmingCharactersInSet:", +[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet")), -[NSString hasPrefix:](v3, "hasPrefix:", CFSTR("page(")))&& -[NSString hasSuffix:](v3, "hasSuffix:", CFSTR(")")))
  {
    return -[NSString substringWithRange:](v3, "substringWithRange:", 5, (char *)-[NSString length](v3, "length") - 6);
  }
  else
  {
    return 0;
  }
}

- (id)chapterString
{
  if (-[THModelLink isChapterLink](self, "isChapterLink"))
    return -[THModelLink p_parameterValueFromFragmentWithFunction:](self, "p_parameterValueFromFragmentWithFunction:", CFSTR("chapter"));
  else
    return 0;
}

- (id)chapterGuidString
{
  if (-[THModelLink isChapterGuidLink](self, "isChapterGuidLink"))
    return -[THModelLink p_parameterValueFromFragmentWithFunction:](self, "p_parameterValueFromFragmentWithFunction:", CFSTR("chapterguid"));
  else
    return 0;
}

- (BOOL)p_isCustomApplePubPageLink
{
  unsigned int v3;

  v3 = -[THModelLink targetIsApplePub](self, "targetIsApplePub");
  if (v3)
    LOBYTE(v3) = objc_msgSend(-[THModelLink fragment](self, "fragment"), "hasPrefix:", CFSTR("x-apple-internal-absolutepageindex-"));
  return v3;
}

- (BOOL)isCustom
{
  unsigned int v3;

  v3 = -[THModelLink targetIsApplePub](self, "targetIsApplePub");
  if (v3)
    LOBYTE(v3) = objc_msgSend(-[THModelLink fragment](self, "fragment"), "hasPrefix:", CFSTR("x-apple-"));
  return v3;
}

- (int64_t)customPageIndex
{
  if (-[THModelLink p_isCustomApplePubPageLink](self, "p_isCustomApplePubPageLink"))
    return (int64_t)objc_msgSend(objc_msgSend(-[THModelLink fragment](self, "fragment"), "substringFromIndex:", objc_msgSend(CFSTR("x-apple-internal-absolutepageindex-"), "length")), "integerValue");
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)isDynamic
{
  unsigned int v3;

  v3 = -[THModelLink targetIsApplePub](self, "targetIsApplePub");
  if (v3)
    LOBYTE(v3) = objc_msgSend(-[THModelLink fragment](self, "fragment"), "hasPrefix:", CFSTR("xpointer"));
  return v3;
}

- (BOOL)isOrdinary
{
  if (-[THModelLink isCustom](self, "isCustom"))
    return 0;
  else
    return !-[THModelLink isDynamic](self, "isDynamic");
}

- (id)description
{
  NSString *v3;
  const __CFString *v4;

  v3 = -[THModelLink target](self, "target");
  if (-[THModelLink cachedAbsolutePageIndex](self, "cachedAbsolutePageIndex") == 0x7FFFFFFFFFFFFFFFLL)
    v4 = &stru_43D7D8;
  else
    v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" @p%ud"), -[THModelLink cachedAbsolutePageIndex](self, "cachedAbsolutePageIndex"));
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<link:%@%@>"), v3, v4);
}

- (NSString)target
{
  return self->mTarget;
}

- (void)setTarget:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (NSURL)url
{
  return self->mURL;
}

- (void)setUrl:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (unint64_t)cachedAbsolutePageIndex
{
  return self->mCachedAbsolutePageIndex;
}

- (void)setCachedAbsolutePageIndex:(unint64_t)a3
{
  self->mCachedAbsolutePageIndex = a3;
}

@end
