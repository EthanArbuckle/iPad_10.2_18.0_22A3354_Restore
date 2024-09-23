@implementation SAUSCardSection

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.universalsearch");
}

- (id)encodedClassName
{
  return CFSTR("CardSection");
}

+ (id)cardSection
{
  return objc_alloc_init((Class)a1);
}

- (SAUIAppPunchOut)punchOut
{
  return (SAUIAppPunchOut *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("punchOut"));
}

- (void)setPunchOut:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("punchOut"), a3);
}

@end
