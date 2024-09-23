@implementation SAHomeCommunicationAnnouncementSnippet

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.homecommunication");
}

- (id)encodedClassName
{
  return CFSTR("AnnouncementSnippet");
}

- (NSString)announcerName
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("announcerName"));
}

- (void)setAnnouncerName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("announcerName"), a3);
}

@end
