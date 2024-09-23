@implementation SAUIURLImageData

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.assistant");
}

- (id)encodedClassName
{
  return CFSTR("URLImageData");
}

+ (id)uRLImageData
{
  return objc_alloc_init((Class)a1);
}

@end
