@implementation SAUIDelayedActionCancelCommand

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.assistant");
}

- (id)encodedClassName
{
  return CFSTR("DelayedActionCancelCommand");
}

+ (id)delayedActionCancelCommand
{
  return objc_alloc_init((Class)a1);
}

- (NSString)delayedActionAceId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("delayedActionAceId"));
}

- (void)setDelayedActionAceId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("delayedActionAceId"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
