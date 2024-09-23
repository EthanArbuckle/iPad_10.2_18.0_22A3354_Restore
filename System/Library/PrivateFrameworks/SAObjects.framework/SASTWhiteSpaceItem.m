@implementation SASTWhiteSpaceItem

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.templates");
}

- (id)encodedClassName
{
  return CFSTR("WhiteSpaceItem");
}

+ (id)whiteSpaceItem
{
  return objc_alloc_init((Class)a1);
}

@end
