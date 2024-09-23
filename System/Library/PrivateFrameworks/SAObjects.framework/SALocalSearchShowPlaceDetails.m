@implementation SALocalSearchShowPlaceDetails

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.localsearch");
}

- (id)encodedClassName
{
  return CFSTR("ShowPlaceDetails");
}

+ (id)showPlaceDetails
{
  return objc_alloc_init((Class)a1);
}

- (int64_t)itemIndex
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("itemIndex"));
}

- (void)setItemIndex:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("itemIndex"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
