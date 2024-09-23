@implementation SAPerformRemoteAnnouncement

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("PerformRemoteAnnouncement");
}

- (NSString)announcementIdentifier
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("announcementIdentifier"));
}

- (void)setAnnouncementIdentifier:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("announcementIdentifier"), a3);
}

- (NSNumber)announcementNotificationType
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("announcementNotificationType"));
}

- (void)setAnnouncementNotificationType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("announcementNotificationType"), a3);
}

- (NSNumber)announcementPlatform
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("announcementPlatform"));
}

- (void)setAnnouncementPlatform:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("announcementPlatform"), a3);
}

- (NSDate)announcementTimestamp
{
  return (NSDate *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("announcementTimestamp"));
}

- (void)setAnnouncementTimestamp:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("announcementTimestamp"), a3);
}

- (NSNumber)announcementType
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("announcementType"));
}

- (void)setAnnouncementType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("announcementType"), a3);
}

- (SAStartLocalRequest)startLocalRequest
{
  return (SAStartLocalRequest *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("startLocalRequest"));
}

- (void)setStartLocalRequest:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("startLocalRequest"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
