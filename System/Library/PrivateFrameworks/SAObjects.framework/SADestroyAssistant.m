@implementation SADestroyAssistant

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("DestroyAssistant");
}

+ (id)destroyAssistant
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

- (NSString)speechId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("speechId"));
}

- (void)setSpeechId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("speechId"), a3);
}

- (BOOL)requiresResponse
{
  return 1;
}

@end
