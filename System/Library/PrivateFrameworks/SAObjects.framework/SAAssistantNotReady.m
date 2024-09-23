@implementation SAAssistantNotReady

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("AssistantNotReady");
}

+ (id)assistantNotReady
{
  return objc_alloc_init((Class)a1);
}

- (NSString)language
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("language"));
}

- (void)setLanguage:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("language"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
