@implementation SASportsAthleteComparisonSnippet

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.sports");
}

- (id)encodedClassName
{
  return CFSTR("AthleteComparisonSnippet");
}

+ (id)athleteComparisonSnippet
{
  return objc_alloc_init((Class)a1);
}

- (NSDictionary)comparisonItemDetails
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSDictionary *)AceObjectClassDictionaryForProperty(self, (uint64_t)CFSTR("comparisonItemDetails"), v3);
}

- (void)setComparisonItemDetails:(id)a3
{
  AceObjectSetAceObjectDictionaryForProperty(self, CFSTR("comparisonItemDetails"), (uint64_t)a3);
}

@end
