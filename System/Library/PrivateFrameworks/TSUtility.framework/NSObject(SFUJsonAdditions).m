@implementation NSObject(SFUJsonAdditions)

- (uint64_t)appendJsonStringToString:()SFUJsonAdditions
{
  id v0;
  uint64_t v1;

  v0 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
  v1 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[NSObject(SFUJsonAdditions) appendJsonStringToString:]");
  return objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUJson.m"), 472, CFSTR("%@ doesn't support JSON encoding"), objc_opt_class());
}

@end
