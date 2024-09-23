@implementation SAUISetUpdateMask

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.assistant");
}

- (id)encodedClassName
{
  return CFSTR("SetUpdateMask");
}

- (BOOL)shouldHideSiri
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("shouldHideSiri"));
}

- (void)setShouldHideSiri:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("shouldHideSiri"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
