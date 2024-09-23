@implementation SALocalSearchGetNavigationStatus

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.localsearch");
}

- (id)encodedClassName
{
  return CFSTR("GetNavigationStatus");
}

+ (id)getNavigationStatus
{
  return objc_alloc_init((Class)a1);
}

- (NSNumber)getRoute
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("getRoute"));
}

- (void)setGetRoute:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("getRoute"), a3);
}

- (BOOL)requiresResponse
{
  return 1;
}

@end
