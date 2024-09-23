@implementation SACardShowNextCard

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.ui.card");
}

- (id)encodedClassName
{
  return CFSTR("ShowNextCard");
}

+ (id)showNextCard
{
  return objc_alloc_init((Class)a1);
}

- (SACardSnippet)cardSnippet
{
  return (SACardSnippet *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("cardSnippet"));
}

- (void)setCardSnippet:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("cardSnippet"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
