@implementation SADonateRankedQueriesToPortrait

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("DonateRankedQueriesToPortrait");
}

+ (id)donateRankedQueriesToPortrait
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)queryDonations
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("queryDonations"), v3);
}

- (void)setQueryDonations:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("queryDonations"), (uint64_t)a3);
}

- (NSString)resultCandidateId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("resultCandidateId"));
}

- (void)setResultCandidateId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("resultCandidateId"), a3);
}

- (NSString)utterance
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("utterance"));
}

- (void)setUtterance:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("utterance"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
