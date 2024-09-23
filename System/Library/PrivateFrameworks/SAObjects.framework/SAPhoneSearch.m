@implementation SAPhoneSearch

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.phone");
}

- (id)encodedClassName
{
  return CFSTR("Search");
}

+ (id)search
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)contacts
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("contacts"), v3);
}

- (void)setContacts:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("contacts"), (uint64_t)a3);
}

- (NSDate)end
{
  return (NSDate *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("end"));
}

- (void)setEnd:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("end"), a3);
}

- (NSNumber)faceTime
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("faceTime"));
}

- (void)setFaceTime:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("faceTime"), a3);
}

- (NSNumber)faceTimeAudio
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("faceTimeAudio"));
}

- (void)setFaceTimeAudio:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("faceTimeAudio"), a3);
}

- (NSNumber)isNew
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("isNew"));
}

- (void)setIsNew:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("isNew"), a3);
}

- (NSNumber)last
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("last"));
}

- (void)setLast:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("last"), a3);
}

- (NSNumber)missed
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("missed"));
}

- (void)setMissed:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("missed"), a3);
}

- (NSNumber)outgoing
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("outgoing"));
}

- (void)setOutgoing:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("outgoing"), a3);
}

- (NSDate)start
{
  return (NSDate *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("start"));
}

- (void)setStart:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("start"), a3);
}

- (NSNumber)voiceMail
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("voiceMail"));
}

- (void)setVoiceMail:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("voiceMail"), a3);
}

- (BOOL)requiresResponse
{
  return 1;
}

- (BOOL)mutatingCommand
{
  return 0;
}

@end
