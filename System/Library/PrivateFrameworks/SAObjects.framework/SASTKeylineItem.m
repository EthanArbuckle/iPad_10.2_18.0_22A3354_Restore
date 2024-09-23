@implementation SASTKeylineItem

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.templates");
}

- (id)encodedClassName
{
  return CFSTR("KeylineItem");
}

+ (id)keylineItem
{
  return objc_alloc_init((Class)a1);
}

@end
