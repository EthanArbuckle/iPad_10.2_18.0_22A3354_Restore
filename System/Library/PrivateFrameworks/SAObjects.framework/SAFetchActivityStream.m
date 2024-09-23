@implementation SAFetchActivityStream

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("FetchActivityStream");
}

+ (id)fetchActivityStream
{
  return objc_alloc_init((Class)a1);
}

- (NSString)activityType
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("activityType"));
}

- (void)setActivityType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("activityType"), a3);
}

- (BOOL)ascending
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("ascending"));
}

- (void)setAscending:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("ascending"), a3);
}

- (NSDate)fromDate
{
  return (NSDate *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("fromDate"));
}

- (void)setFromDate:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("fromDate"), a3);
}

- (NSNumber)limit
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("limit"));
}

- (void)setLimit:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("limit"), a3);
}

- (NSArray)matchingMetadataKeys
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("matchingMetadataKeys"));
}

- (void)setMatchingMetadataKeys:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("matchingMetadataKeys"), a3);
}

- (NSDictionary)matchingMetadataKeysAndStringValues
{
  return (NSDictionary *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("matchingMetadataKeysAndStringValues"));
}

- (void)setMatchingMetadataKeysAndStringValues:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("matchingMetadataKeysAndStringValues"), a3);
}

- (NSString)sortBy
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("sortBy"));
}

- (void)setSortBy:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("sortBy"), a3);
}

- (NSArray)streamTypes
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("streamTypes"));
}

- (void)setStreamTypes:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("streamTypes"), a3);
}

- (NSString)taskType
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("taskType"));
}

- (void)setTaskType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("taskType"), a3);
}

- (NSDate)toDate
{
  return (NSDate *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("toDate"));
}

- (void)setToDate:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("toDate"), a3);
}

- (NSString)visibility
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("visibility"));
}

- (void)setVisibility:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("visibility"), a3);
}

- (BOOL)requiresResponse
{
  return 1;
}

@end
