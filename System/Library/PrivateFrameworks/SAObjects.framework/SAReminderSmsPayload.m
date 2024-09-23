@implementation SAReminderSmsPayload

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.reminder");
}

- (id)encodedClassName
{
  return CFSTR("SmsPayload");
}

+ (id)smsPayload
{
  return objc_alloc_init((Class)a1);
}

- (NSString)message
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("message"));
}

- (void)setMessage:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("message"), a3);
}

- (NSArray)recipients
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("recipients"));
}

- (void)setRecipients:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("recipients"), a3);
}

@end
