@implementation SALocalSearchDropAPinCompleted

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.localsearch");
}

- (id)encodedClassName
{
  return CFSTR("DropAPinCompleted");
}

+ (id)dropAPinCompleted
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

- (BOOL)requiresResponse
{
  return 0;
}

@end
