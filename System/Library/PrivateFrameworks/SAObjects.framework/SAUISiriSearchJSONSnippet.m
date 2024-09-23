@implementation SAUISiriSearchJSONSnippet

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.assistant");
}

- (id)encodedClassName
{
  return CFSTR("SiriSearchJSONSnippet");
}

+ (id)siriSearchJSONSnippet
{
  return objc_alloc_init((Class)a1);
}

- (NSString)clientTemplate
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("clientTemplate"));
}

- (void)setClientTemplate:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("clientTemplate"), a3);
}

@end
