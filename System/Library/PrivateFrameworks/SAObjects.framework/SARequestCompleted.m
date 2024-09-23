@implementation SARequestCompleted

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("RequestCompleted");
}

+ (id)requestCompleted
{
  return objc_alloc_init((Class)a1);
}

- (NSString)turnId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("turnId"));
}

- (void)setTurnId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("turnId"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
