@implementation SAUIAssistantUtteranceView

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.assistant");
}

- (id)encodedClassName
{
  return CFSTR("AssistantUtteranceView");
}

+ (id)assistantUtteranceView
{
  return objc_alloc_init((Class)a1);
}

- (NSString)dialogCategory
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("dialogCategory"));
}

- (void)setDialogCategory:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("dialogCategory"), a3);
}

- (NSString)dialogIdentifier
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("dialogIdentifier"));
}

- (void)setDialogIdentifier:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("dialogIdentifier"), a3);
}

- (NSNumber)postDialogDelayInMilliseconds
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("postDialogDelayInMilliseconds"));
}

- (void)setPostDialogDelayInMilliseconds:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("postDialogDelayInMilliseconds"), a3);
}

- (NSString)redactedText
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("redactedText"));
}

- (void)setRedactedText:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("redactedText"), a3);
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
