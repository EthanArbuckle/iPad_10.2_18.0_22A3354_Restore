@implementation SAMPAd

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.media");
}

- (id)encodedClassName
{
  return CFSTR("Ad");
}

+ (id)ad
{
  return objc_alloc_init((Class)a1);
}

@end
