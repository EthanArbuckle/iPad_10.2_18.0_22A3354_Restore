@implementation NSDictionary

+ (NSDictionary)dictionaryWithContentsOfPlistData:(id)a3
{
  CFPropertyListRef v3;
  const void *v4;
  uint64_t v5;
  id v6;
  NSDictionary *v7;

  v3 = CFPropertyListCreateWithData(kCFAllocatorDefault, (CFDataRef)a3, 0, 0, 0);
  if (!v3)
    return 0;
  v4 = v3;
  v5 = objc_opt_class(NSDictionary);
  TSUDynamicCast(v5, v4);
  v7 = (NSDictionary *)v6;
  if (!v7)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[NSDictionary(THAdditions) dictionaryWithContentsOfPlistData:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Utility/NSDictionary_THAdditions.m"), 23, CFSTR("invalid nil value for '%s'"), "plistDict");
  CFRelease(v4);
  return v7;
}

@end
