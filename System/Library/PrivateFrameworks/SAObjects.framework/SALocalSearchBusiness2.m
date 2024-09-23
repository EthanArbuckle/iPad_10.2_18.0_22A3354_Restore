@implementation SALocalSearchBusiness2

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.localsearch");
}

- (id)encodedClassName
{
  return CFSTR("Business2");
}

+ (id)business2
{
  return objc_alloc_init((Class)a1);
}

- (SALocation)address
{
  return (SALocation *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("address"));
}

- (void)setAddress:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("address"), a3);
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

- (NSArray)commands
{
  return (NSArray *)AceObjectProtocolArrayForProperty(self, (uint64_t)CFSTR("commands"), &unk_1EE77C568);
}

- (void)setCommands:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("commands"), (uint64_t)a3);
}

- (NSString)currencySymbol
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("currencySymbol"));
}

- (void)setCurrencySymbol:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("currencySymbol"), a3);
}

- (NSString)descriptionText
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("descriptionText"));
}

- (void)setDescriptionText:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("descriptionText"), a3);
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

- (NSDictionary)identifierMap
{
  return (NSDictionary *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("identifierMap"));
}

- (void)setIdentifierMap:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("identifierMap"), a3);
}

- (NSString)name
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("name"));
}

- (void)setName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("name"), a3);
}

- (NSArray)offerLists
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("offerLists"), v3);
}

- (void)setOfferLists:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("offerLists"), (uint64_t)a3);
}

- (SALocalSearchOperationHours)operationHours
{
  return (SALocalSearchOperationHours *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("operationHours"));
}

- (void)setOperationHours:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("operationHours"), a3);
}

- (NSString)phoneNumber
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("phoneNumber"));
}

- (void)setPhoneNumber:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("phoneNumber"), a3);
}

- (NSArray)photoList
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("photoList"), v3);
}

- (void)setPhotoList:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("photoList"), (uint64_t)a3);
}

- (NSData)placeData2
{
  return (NSData *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("placeData2"));
}

- (void)setPlaceData2:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("placeData2"), a3);
}

- (NSString)priceRange
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("priceRange"));
}

- (void)setPriceRange:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("priceRange"), a3);
}

- (NSArray)reviewList
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("reviewList"), v3);
}

- (void)setReviewList:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("reviewList"), (uint64_t)a3);
}

@end
