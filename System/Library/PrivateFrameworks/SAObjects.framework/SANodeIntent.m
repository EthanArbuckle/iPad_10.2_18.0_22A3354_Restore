@implementation SANodeIntent

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("NodeIntent");
}

+ (id)nodeIntent
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)matchingSpans
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("matchingSpans"), v3);
}

- (void)setMatchingSpans:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("matchingSpans"), (uint64_t)a3);
}

- (NSString)name
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("name"));
}

- (void)setName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("name"), a3);
}

- (NSArray)privacyPolicy
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("privacyPolicy"), v3);
}

- (void)setPrivacyPolicy:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("privacyPolicy"), (uint64_t)a3);
}

- (SAAceSerializable)value
{
  return (SAAceSerializable *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("value"));
}

- (void)setValue:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("value"), a3);
}

@end
