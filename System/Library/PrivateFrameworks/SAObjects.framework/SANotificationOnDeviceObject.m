@implementation SANotificationOnDeviceObject

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.notification");
}

- (id)encodedClassName
{
  return CFSTR("OnDeviceObject");
}

- (NSString)announcementType
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("announcementType"));
}

- (void)setAnnouncementType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("announcementType"), a3);
}

- (NSString)body
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("body"));
}

- (void)setBody:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("body"), a3);
}

- (NSNumber)isHighlight
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("isHighlight"));
}

- (void)setIsHighlight:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("isHighlight"), a3);
}

- (NSData)request
{
  return (NSData *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("request"));
}

- (void)setRequest:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("request"), a3);
}

- (NSString)senderHandle
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("senderHandle"));
}

- (void)setSenderHandle:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("senderHandle"), a3);
}

- (NSString)subtitle
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("subtitle"));
}

- (void)setSubtitle:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("subtitle"), a3);
}

- (NSString)summary
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("summary"));
}

- (void)setSummary:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("summary"), a3);
}

- (NSString)threadSummary
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("threadSummary"));
}

- (void)setThreadSummary:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("threadSummary"), a3);
}

- (NSString)title
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("title"));
}

- (void)setTitle:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("title"), a3);
}

@end
