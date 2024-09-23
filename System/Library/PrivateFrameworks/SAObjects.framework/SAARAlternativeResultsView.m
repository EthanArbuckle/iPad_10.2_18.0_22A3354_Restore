@implementation SAARAlternativeResultsView

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.alternatives");
}

- (id)encodedClassName
{
  return CFSTR("AlternativeResultsView");
}

+ (id)alternativeResultsView
{
  return objc_alloc_init((Class)a1);
}

- (NSString)dialogIdentifier
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("dialogIdentifier"));
}

- (void)setDialogIdentifier:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("dialogIdentifier"), a3);
}

- (int64_t)rank
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("rank"));
}

- (void)setRank:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("rank"), a3);
}

- (SAUIAddViews)resultView
{
  return (SAUIAddViews *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("resultView"));
}

- (void)setResultView:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("resultView"), a3);
}

- (BOOL)suggestedResult
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("suggestedResult"));
}

- (void)setSuggestedResult:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("suggestedResult"), a3);
}

- (NSString)utterance
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("utterance"));
}

- (void)setUtterance:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("utterance"), a3);
}

@end
