@implementation SAUICloseAssistant

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.assistant");
}

- (id)encodedClassName
{
  return CFSTR("CloseAssistant");
}

- (NSString)reason
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("reason"));
}

- (void)setReason:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("reason"), a3);
}

+ (id)closeAssistant
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
