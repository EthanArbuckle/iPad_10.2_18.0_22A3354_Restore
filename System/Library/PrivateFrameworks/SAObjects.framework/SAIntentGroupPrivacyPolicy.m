@implementation SAIntentGroupPrivacyPolicy

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.command.assistant.intent");
}

- (id)encodedClassName
{
  return CFSTR("PrivacyPolicy");
}

+ (id)privacyPolicy
{
  return objc_alloc_init((Class)a1);
}

- (NSString)privacyCategory
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("privacyCategory"));
}

- (void)setPrivacyCategory:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("privacyCategory"), a3);
}

- (NSString)redactionTarget
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("redactionTarget"));
}

- (void)setRedactionTarget:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("redactionTarget"), a3);
}

@end
