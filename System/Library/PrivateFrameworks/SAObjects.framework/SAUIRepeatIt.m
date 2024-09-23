@implementation SAUIRepeatIt

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.assistant");
}

- (id)encodedClassName
{
  return CFSTR("RepeatIt");
}

+ (id)repeatIt
{
  return objc_alloc_init((Class)a1);
}

- (NSString)contingency
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("contingency"));
}

- (void)setContingency:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("contingency"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
