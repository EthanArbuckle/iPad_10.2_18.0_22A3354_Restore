@implementation SASessionValidationFailed

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("SessionValidationFailed");
}

+ (id)sessionValidationFailed
{
  return objc_alloc_init((Class)a1);
}

- (NSString)errorCode
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("errorCode"));
}

- (void)setErrorCode:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("errorCode"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
