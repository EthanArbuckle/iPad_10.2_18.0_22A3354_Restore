@implementation SAUSImageMarkup

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.universalsearch");
}

- (id)encodedClassName
{
  return CFSTR("ImageMarkup");
}

+ (id)imageMarkup
{
  return objc_alloc_init((Class)a1);
}

- (SAUIImageResource)imageResource
{
  return (SAUIImageResource *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("imageResource"));
}

- (void)setImageResource:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("imageResource"), a3);
}

@end
