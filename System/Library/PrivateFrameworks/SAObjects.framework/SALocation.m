@implementation SALocation

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("Location");
}

+ (id)location
{
  return objc_alloc_init((Class)a1);
}

- (NSNumber)accuracy
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("accuracy"));
}

- (void)setAccuracy:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("accuracy"), a3);
}

- (NSString)city
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("city"));
}

- (void)setCity:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("city"), a3);
}

- (NSString)countryCode
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("countryCode"));
}

- (void)setCountryCode:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("countryCode"), a3);
}

- (NSArray)entryPoints
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("entryPoints"), v3);
}

- (void)setEntryPoints:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("entryPoints"), (uint64_t)a3);
}

- (NSData)forwardGeoData
{
  return (NSData *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("forwardGeoData"));
}

- (void)setForwardGeoData:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("forwardGeoData"), a3);
}

- (NSString)label
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("label"));
}

- (void)setLabel:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("label"), a3);
}

- (NSNumber)latitude
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("latitude"));
}

- (void)setLatitude:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("latitude"), a3);
}

- (NSNumber)longitude
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("longitude"));
}

- (void)setLongitude:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("longitude"), a3);
}

- (NSString)postalCode
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("postalCode"));
}

- (void)setPostalCode:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("postalCode"), a3);
}

- (NSString)regionType
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("regionType"));
}

- (void)setRegionType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("regionType"), a3);
}

- (SADistance)relativeDistance
{
  return (SADistance *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("relativeDistance"));
}

- (void)setRelativeDistance:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("relativeDistance"), a3);
}

- (NSString)stateCode
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("stateCode"));
}

- (void)setStateCode:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("stateCode"), a3);
}

- (NSString)street
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("street"));
}

- (void)setStreet:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("street"), a3);
}

- (NSString)subAdministrativeArea
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("subAdministrativeArea"));
}

- (void)setSubAdministrativeArea:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("subAdministrativeArea"), a3);
}

- (NSString)subLocality
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("subLocality"));
}

- (void)setSubLocality:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("subLocality"), a3);
}

- (NSString)subThoroughfare
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("subThoroughfare"));
}

- (void)setSubThoroughfare:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("subThoroughfare"), a3);
}

- (NSString)thoroughfare
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("thoroughfare"));
}

- (void)setThoroughfare:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("thoroughfare"), a3);
}

- (NSString)timezoneId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("timezoneId"));
}

- (void)setTimezoneId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("timezoneId"), a3);
}

- (NSNumber)travelDistance
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("travelDistance"));
}

- (void)setTravelDistance:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("travelDistance"), a3);
}

- (NSNumber)travelTime
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("travelTime"));
}

- (void)setTravelTime:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("travelTime"), a3);
}

@end
