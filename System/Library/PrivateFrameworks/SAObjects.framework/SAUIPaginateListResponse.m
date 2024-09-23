@implementation SAUIPaginateListResponse

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.assistant");
}

- (id)encodedClassName
{
  return CFSTR("PaginateListResponse");
}

- (int64_t)firstItemIndex
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("firstItemIndex"));
}

- (void)setFirstItemIndex:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("firstItemIndex"), a3);
}

- (int64_t)focusedItemIndex
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("focusedItemIndex"));
}

- (void)setFocusedItemIndex:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("focusedItemIndex"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
