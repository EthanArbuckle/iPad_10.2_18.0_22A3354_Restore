@implementation NSString(WebKitExtras)

- (uint64_t)_web_stringByAbbreviatingWithTildeInPath
{
  NSString *v2;

  v2 = -[NSString stringByResolvingSymlinksInPath](NSHomeDirectory(), "stringByResolvingSymlinksInPath");
  if (-[NSString hasPrefix:](a1, "hasPrefix:", v2))
    a1 = -[NSString stringByAppendingPathComponent:](NSHomeDirectory(), "stringByAppendingPathComponent:", -[NSString substringFromIndex:](a1, "substringFromIndex:", -[NSString length](v2, "length")));
  return (uint64_t)-[NSString stringByAbbreviatingWithTildeInPath](a1, "stringByAbbreviatingWithTildeInPath");
}

- (BOOL)_webkit_isCaseInsensitiveEqualToString:()WebKitExtras
{
  return objc_msgSend(a1, "compare:options:", a3, 3) == 0;
}

- (BOOL)_webkit_hasCaseInsensitivePrefix:()WebKitExtras
{
  return objc_msgSend(a1, "rangeOfString:options:", a3, 9) != 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)_webkit_hasCaseInsensitiveSuffix:()WebKitExtras
{
  return objc_msgSend(a1, "rangeOfString:options:", a3, 13) != 0x7FFFFFFFFFFFFFFFLL;
}

- (CFTypeRef)_webkit_stringByTrimmingWhitespace
{
  __CFString *v1;

  v1 = (__CFString *)objc_msgSend(a1, "mutableCopy");
  CFStringTrimWhitespace(v1);
  return (id)CFMakeCollectable(v1);
}

+ (uint64_t)_webkit_localCacheDirectoryWithBundleIdentifier:()WebKitExtras
{
  void *v4;
  uint64_t v5;
  NSString *v6;

  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v5 = objc_msgSend(v4, "objectForKey:", WebKitLocalCacheDefaultsKey);
  if (!v5 || (v6 = (NSString *)v5, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    v6 = -[NSString stringByAppendingPathComponent:](NSHomeDirectory(), "stringByAppendingPathComponent:", CFSTR("Library/Caches"));
  return (uint64_t)-[NSString stringByAppendingPathComponent:](v6, "stringByAppendingPathComponent:", a3);
}

@end
