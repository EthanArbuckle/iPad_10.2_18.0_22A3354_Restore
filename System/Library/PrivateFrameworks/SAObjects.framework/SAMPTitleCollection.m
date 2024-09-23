@implementation SAMPTitleCollection

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.media");
}

- (id)encodedClassName
{
  return CFSTR("TitleCollection");
}

+ (id)titleCollection
{
  return objc_alloc_init((Class)a1);
}

@end
