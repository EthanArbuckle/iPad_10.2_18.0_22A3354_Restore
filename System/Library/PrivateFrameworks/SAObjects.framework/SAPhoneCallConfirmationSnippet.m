@implementation SAPhoneCallConfirmationSnippet

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.phone");
}

- (id)encodedClassName
{
  return CFSTR("CallConfirmationSnippet");
}

- (NSString)confirmationDisplayText
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("confirmationDisplayText"));
}

- (void)setConfirmationDisplayText:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("confirmationDisplayText"), a3);
}

- (NSArray)persons
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("persons"), v3);
}

- (void)setPersons:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("persons"), (uint64_t)a3);
}

@end
