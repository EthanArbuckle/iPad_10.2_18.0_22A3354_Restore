@implementation SAUISetSuggestedUtterances

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.assistant");
}

- (id)encodedClassName
{
  return CFSTR("SetSuggestedUtterances");
}

+ (id)setSuggestedUtterances
{
  return objc_alloc_init((Class)a1);
}

- (NSString)language
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("language"));
}

- (void)setLanguage:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("language"), a3);
}

- (NSArray)utterances
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("utterances"));
}

- (void)setUtterances:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("utterances"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
