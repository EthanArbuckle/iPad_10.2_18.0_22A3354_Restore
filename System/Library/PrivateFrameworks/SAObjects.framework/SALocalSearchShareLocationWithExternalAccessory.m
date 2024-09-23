@implementation SALocalSearchShareLocationWithExternalAccessory

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.localsearch");
}

- (id)encodedClassName
{
  return CFSTR("ShareLocationWithExternalAccessory");
}

+ (id)shareLocationWithExternalAccessory
{
  return objc_alloc_init((Class)a1);
}

- (SALocalSearchMapItem)mapItem
{
  return (SALocalSearchMapItem *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("mapItem"));
}

- (void)setMapItem:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("mapItem"), a3);
}

- (BOOL)useNavigationDestination
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("useNavigationDestination"));
}

- (void)setUseNavigationDestination:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("useNavigationDestination"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
