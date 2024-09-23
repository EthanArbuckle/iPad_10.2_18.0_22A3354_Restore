@implementation SASportsMatchupDetailsSnippet

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.sports");
}

- (id)encodedClassName
{
  return CFSTR("MatchupDetailsSnippet");
}

+ (id)matchupDetailsSnippet
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)isModalView
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("isModalView"));
}

- (void)setIsModalView:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("isModalView"), a3);
}

@end
