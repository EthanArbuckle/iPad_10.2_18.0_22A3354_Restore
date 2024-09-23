@implementation SASUserUtteranceEditableTextSnippet

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.speech");
}

- (id)encodedClassName
{
  return CFSTR("UserUtteranceEditableTextSnippet");
}

+ (id)userUtteranceEditableTextSnippet
{
  return objc_alloc_init((Class)a1);
}

- (NSString)sessionId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("sessionId"));
}

- (void)setSessionId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("sessionId"), a3);
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
