@implementation SADonateSiriQueryToPortrait

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("DonateSiriQueryToPortrait");
}

+ (id)donateSiriQueryToPortrait
{
  return objc_alloc_init((Class)a1);
}

- (NSString)domain
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("domain"));
}

- (void)setDomain:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("domain"), a3);
}

- (NSString)originalQuery
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("originalQuery"));
}

- (void)setOriginalQuery:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("originalQuery"), a3);
}

- (NSString)qid
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("qid"));
}

- (void)setQid:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("qid"), a3);
}

- (int64_t)rank
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("rank"));
}

- (void)setRank:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("rank"), a3);
}

- (double)rankerConfidence
{
  return AceObjectDoubleForProperty(self, (uint64_t)CFSTR("rankerConfidence"));
}

- (void)setRankerConfidence:(double)a3
{
  AceObjectSetDoubleForProperty(self, CFSTR("rankerConfidence"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
