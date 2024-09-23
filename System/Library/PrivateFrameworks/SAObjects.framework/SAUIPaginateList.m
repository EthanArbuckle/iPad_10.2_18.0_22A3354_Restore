@implementation SAUIPaginateList

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.assistant");
}

- (id)encodedClassName
{
  return CFSTR("PaginateList");
}

- (BOOL)forward
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("forward"));
}

- (void)setForward:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("forward"), a3);
}

- (BOOL)requiresResponse
{
  return 1;
}

@end
