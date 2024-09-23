@implementation SAMPGeniusMix

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.media");
}

- (id)encodedClassName
{
  return CFSTR("GeniusMix");
}

+ (id)geniusMix
{
  return objc_alloc_init((Class)a1);
}

@end
