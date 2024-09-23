@implementation SAGuidanceGuideUpdate

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.guidance");
}

- (id)encodedClassName
{
  return CFSTR("GuideUpdate");
}

+ (id)guideUpdate
{
  return objc_alloc_init((Class)a1);
}

- (SAGuidanceGuideSnippet)guideSnippet
{
  return (SAGuidanceGuideSnippet *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("guideSnippet"));
}

- (void)setGuideSnippet:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("guideSnippet"), a3);
}

- (NSNumber)guideTag
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("guideTag"));
}

- (void)setGuideTag:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("guideTag"), a3);
}

- (NSString)languageCode
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("languageCode"));
}

- (void)setLanguageCode:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("languageCode"), a3);
}

- (SAGuidanceSuggestedUtterances)suggestedUtterances
{
  return (SAGuidanceSuggestedUtterances *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("suggestedUtterances"));
}

- (void)setSuggestedUtterances:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("suggestedUtterances"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

- (BOOL)mutatingCommand
{
  return 0;
}

@end
