@implementation SAReminderEmailPayload

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.reminder");
}

- (id)encodedClassName
{
  return CFSTR("EmailPayload");
}

+ (id)emailPayload
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)recipientsTo
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("recipientsTo"));
}

- (void)setRecipientsTo:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("recipientsTo"), a3);
}

- (NSString)subject
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("subject"));
}

- (void)setSubject:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("subject"), a3);
}

@end
