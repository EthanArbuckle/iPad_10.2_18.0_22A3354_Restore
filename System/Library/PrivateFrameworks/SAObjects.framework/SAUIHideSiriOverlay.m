@implementation SAUIHideSiriOverlay

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.assistant");
}

- (id)encodedClassName
{
  return CFSTR("HideSiriOverlay");
}

+ (id)hideSiriOverlay
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)hideSnippets
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("hideSnippets"));
}

- (void)setHideSnippets:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("hideSnippets"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
