@implementation SAFetchUserActivity

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("FetchUserActivity");
}

+ (id)fetchUserActivity
{
  return objc_alloc_init((Class)a1);
}

- (NSString)internalGUID
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("internalGUID"));
}

- (void)setInternalGUID:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("internalGUID"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
