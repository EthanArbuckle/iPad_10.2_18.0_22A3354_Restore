@implementation SAHomeCommunicationAnnouncement

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.homecommunication");
}

- (id)encodedClassName
{
  return CFSTR("Announcement");
}

- (NSDate)datePlaybackFinished
{
  return (NSDate *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("datePlaybackFinished"));
}

- (void)setDatePlaybackFinished:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("datePlaybackFinished"), a3);
}

- (NSDate)datePlaybackStarted
{
  return (NSDate *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("datePlaybackStarted"));
}

- (void)setDatePlaybackStarted:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("datePlaybackStarted"), a3);
}

@end
