@implementation SAAssistantDestroyed

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("AssistantDestroyed");
}

+ (id)assistantDestroyed
{
  return objc_alloc_init((Class)a1);
}

- (NSString)assistantId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("assistantId"));
}

- (void)setAssistantId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("assistantId"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
