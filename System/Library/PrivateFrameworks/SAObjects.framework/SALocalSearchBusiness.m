@implementation SALocalSearchBusiness

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.localsearch");
}

- (id)encodedClassName
{
  return CFSTR("Business");
}

+ (id)business
{
  return objc_alloc_init((Class)a1);
}

- (NSNumber)businessId
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("businessId"));
}

- (void)setBusinessId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("businessId"), a3);
}

- (NSDictionary)businessIds
{
  return (NSDictionary *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("businessIds"));
}

- (void)setBusinessIds:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("businessIds"), a3);
}

- (NSURL)businessUrl
{
  return (NSURL *)AceObjectURLForProperty(self, (uint64_t)CFSTR("businessUrl"));
}

- (void)setBusinessUrl:(id)a3
{
  AceObjectSetURLForProperty(self, CFSTR("businessUrl"), a3);
}

- (NSArray)categories
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("categories"));
}

- (void)setCategories:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("categories"), a3);
}

- (NSString)extSessionGuid
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("extSessionGuid"));
}

- (void)setExtSessionGuid:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("extSessionGuid"), a3);
}

- (NSDate)extSessionGuidCreatedTimestamp
{
  return (NSDate *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("extSessionGuidCreatedTimestamp"));
}

- (void)setExtSessionGuidCreatedTimestamp:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("extSessionGuidCreatedTimestamp"), a3);
}

- (NSString)name
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("name"));
}

- (void)setName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("name"), a3);
}

- (NSString)openingHours
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("openingHours"));
}

- (void)setOpeningHours:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("openingHours"), a3);
}

- (NSArray)phoneNumbers
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("phoneNumbers"), v3);
}

- (void)setPhoneNumbers:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("phoneNumbers"), (uint64_t)a3);
}

- (NSURL)photo
{
  return (NSURL *)AceObjectURLForProperty(self, (uint64_t)CFSTR("photo"));
}

- (void)setPhoto:(id)a3
{
  AceObjectSetURLForProperty(self, CFSTR("photo"), a3);
}

- (SALocalSearchRating)rating
{
  return (SALocalSearchRating *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("rating"));
}

- (void)setRating:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("rating"), a3);
}

- (NSArray)reviews
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("reviews"), v3);
}

- (void)setReviews:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("reviews"), (uint64_t)a3);
}

- (int64_t)totalNumberOfReviews
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("totalNumberOfReviews"));
}

- (void)setTotalNumberOfReviews:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("totalNumberOfReviews"), a3);
}

@end
