@implementation SALocalSearchReviewList

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.localsearch");
}

- (id)encodedClassName
{
  return CFSTR("ReviewList");
}

+ (id)reviewList
{
  return objc_alloc_init((Class)a1);
}

- (NSURL)providerId
{
  return (NSURL *)AceObjectURLForProperty(self, (uint64_t)CFSTR("providerId"));
}

- (void)setProviderId:(id)a3
{
  AceObjectSetURLForProperty(self, CFSTR("providerId"), a3);
}

- (NSString)providerId2
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("providerId2"));
}

- (void)setProviderId2:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("providerId2"), a3);
}

- (SALocalSearchRating)rating
{
  return (SALocalSearchRating *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("rating"));
}

- (void)setRating:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("rating"), a3);
}

- (NSArray)selectReviews
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("selectReviews"), v3);
}

- (void)setSelectReviews:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("selectReviews"), (uint64_t)a3);
}

- (NSNumber)totalReviewCount
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("totalReviewCount"));
}

- (void)setTotalReviewCount:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("totalReviewCount"), a3);
}

@end
