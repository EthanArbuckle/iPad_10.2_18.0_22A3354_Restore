@implementation SAAceWatchFace

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("AceWatchFace");
}

+ (id)aceWatchFace
{
  return objc_alloc_init((Class)a1);
}

@end
