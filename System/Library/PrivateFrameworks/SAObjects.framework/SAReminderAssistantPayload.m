@implementation SAReminderAssistantPayload

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.reminder");
}

- (id)encodedClassName
{
  return CFSTR("AssistantPayload");
}

+ (id)assistantPayload
{
  return objc_alloc_init((Class)a1);
}

- (NSString)utterance
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("utterance"));
}

- (void)setUtterance:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("utterance"), a3);
}

@end
