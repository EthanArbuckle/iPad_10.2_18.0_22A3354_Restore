@implementation SALocalSearchMapItem

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.localsearch");
}

- (id)encodedClassName
{
  return CFSTR("MapItem");
}

+ (id)mapItem
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)attributions
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("attributions"), v3);
}

- (void)setAttributions:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("attributions"), (uint64_t)a3);
}

- (SAAceSerializable)detail
{
  return (SAAceSerializable *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("detail"));
}

- (void)setDetail:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("detail"), a3);
}

- (NSString)detailType
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("detailType"));
}

- (void)setDetailType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("detailType"), a3);
}

- (NSString)directionRole
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("directionRole"));
}

- (void)setDirectionRole:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("directionRole"), a3);
}

- (SADistance)distance
{
  return (SADistance *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("distance"));
}

- (void)setDistance:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("distance"), a3);
}

- (NSNumber)distanceInMiles
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("distanceInMiles"));
}

- (void)setDistanceInMiles:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("distanceInMiles"), a3);
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

- (NSString)label
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("label"));
}

- (void)setLabel:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("label"), a3);
}

- (NSNumber)localSearchProviderId
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("localSearchProviderId"));
}

- (void)setLocalSearchProviderId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("localSearchProviderId"), a3);
}

- (SALocation)location
{
  return (SALocation *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("location"));
}

- (void)setLocation:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("location"), a3);
}

- (NSData)placeData
{
  return (NSData *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("placeData"));
}

- (void)setPlaceData:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("placeData"), a3);
}

- (NSData)placeData2
{
  return (NSData *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("placeData2"));
}

- (void)setPlaceData2:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("placeData2"), a3);
}

- (NSNumber)placeId
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("placeId"));
}

- (void)setPlaceId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("placeId"), a3);
}

- (NSData)resultDetourInfoData
{
  return (NSData *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("resultDetourInfoData"));
}

- (void)setResultDetourInfoData:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("resultDetourInfoData"), a3);
}

- (NSString)spokenAddress
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("spokenAddress"));
}

- (void)setSpokenAddress:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("spokenAddress"), a3);
}

- (NSString)spokenName
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("spokenName"));
}

- (void)setSpokenName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("spokenName"), a3);
}

- (NSString)suggestionsEntryType
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("suggestionsEntryType"));
}

- (void)setSuggestionsEntryType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("suggestionsEntryType"), a3);
}

@end
