@implementation SAUIVisualResponseShowNextSnippet

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.assistant");
}

- (id)encodedClassName
{
  return CFSTR("VisualResponseShowNextSnippet");
}

- (SAUIVisualResponseSnippet)visualResponse
{
  return (SAUIVisualResponseSnippet *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("visualResponse"));
}

- (void)setVisualResponse:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("visualResponse"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
