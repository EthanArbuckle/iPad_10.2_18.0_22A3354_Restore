@implementation SAFmfPunchOutFriend

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.fmf");
}

- (id)encodedClassName
{
  return CFSTR("PunchOutFriend");
}

+ (id)punchOutFriend
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)friends
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("friends"), v3);
}

- (void)setFriends:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("friends"), (uint64_t)a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
