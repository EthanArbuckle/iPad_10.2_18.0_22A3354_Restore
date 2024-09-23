@implementation SAGuidanceSuggestedUtterances

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.guidance");
}

- (id)encodedClassName
{
  return CFSTR("SuggestedUtterances");
}

+ (id)suggestedUtterances
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)utterances
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("utterances"));
}

- (void)setUtterances:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("utterances"), a3);
}

@end
