@implementation SAActivityObject

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("ActivityObject");
}

+ (id)activityObject
{
  return objc_alloc_init((Class)a1);
}

- (NSDate)endDate
{
  return (NSDate *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("endDate"));
}

- (void)setEndDate:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("endDate"), a3);
}

- (NSDictionary)metadata
{
  return (NSDictionary *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("metadata"));
}

- (void)setMetadata:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("metadata"), a3);
}

- (NSDate)startDate
{
  return (NSDate *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("startDate"));
}

- (void)setStartDate:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("startDate"), a3);
}

- (NSString)streamType
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("streamType"));
}

- (void)setStreamType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("streamType"), a3);
}

- (NSString)type
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("type"));
}

- (void)setType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("type"), a3);
}

- (SAClientUserActivity)userActivity
{
  return (SAClientUserActivity *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("userActivity"));
}

- (void)setUserActivity:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("userActivity"), a3);
}

- (NSString)visibility
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("visibility"));
}

- (void)setVisibility:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("visibility"), a3);
}

@end
