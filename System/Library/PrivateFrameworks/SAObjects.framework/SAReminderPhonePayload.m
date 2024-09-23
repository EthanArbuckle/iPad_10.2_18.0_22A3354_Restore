@implementation SAReminderPhonePayload

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.reminder");
}

- (id)encodedClassName
{
  return CFSTR("PhonePayload");
}

+ (id)phonePayload
{
  return objc_alloc_init((Class)a1);
}

- (NSString)phoneCallType
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("phoneCallType"));
}

- (void)setPhoneCallType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("phoneCallType"), a3);
}

- (NSString)recipient
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("recipient"));
}

- (void)setRecipient:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("recipient"), a3);
}

@end
