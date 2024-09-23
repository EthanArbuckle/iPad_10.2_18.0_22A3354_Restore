@implementation SADismissRemoteAnnouncement

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("DismissRemoteAnnouncement");
}

- (NSString)announcementIdentifier
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("announcementIdentifier"));
}

- (void)setAnnouncementIdentifier:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("announcementIdentifier"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
