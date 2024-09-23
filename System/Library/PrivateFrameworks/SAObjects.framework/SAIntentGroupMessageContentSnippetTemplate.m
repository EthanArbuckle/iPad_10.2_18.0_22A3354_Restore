@implementation SAIntentGroupMessageContentSnippetTemplate

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.command.assistant.intent");
}

- (id)encodedClassName
{
  return CFSTR("MessageContentSnippetTemplate");
}

+ (id)messageContentSnippetTemplate
{
  return objc_alloc_init((Class)a1);
}

- (NSString)content
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("content"));
}

- (void)setContent:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("content"), a3);
}

- (BOOL)sentStatus
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("sentStatus"));
}

- (void)setSentStatus:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("sentStatus"), a3);
}

@end
