@implementation SAUSTextMarkup

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.universalsearch");
}

- (id)encodedClassName
{
  return CFSTR("TextMarkup");
}

+ (id)textMarkup
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)emphasized
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("emphasized"));
}

- (void)setEmphasized:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("emphasized"), a3);
}

- (NSString)text
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("text"));
}

- (void)setText:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("text"), a3);
}

@end
