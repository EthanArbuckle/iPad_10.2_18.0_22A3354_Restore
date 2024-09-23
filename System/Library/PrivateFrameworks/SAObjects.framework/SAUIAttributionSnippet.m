@implementation SAUIAttributionSnippet

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.assistant");
}

- (id)encodedClassName
{
  return CFSTR("AttributionSnippet");
}

+ (id)attributionSnippet
{
  return objc_alloc_init((Class)a1);
}

- (SAUIAppPunchOut)appPunchOut
{
  return (SAUIAppPunchOut *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("appPunchOut"));
}

- (void)setAppPunchOut:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("appPunchOut"), a3);
}

- (BOOL)showKeyLine
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("showKeyLine"));
}

- (void)setShowKeyLine:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("showKeyLine"), a3);
}

@end
