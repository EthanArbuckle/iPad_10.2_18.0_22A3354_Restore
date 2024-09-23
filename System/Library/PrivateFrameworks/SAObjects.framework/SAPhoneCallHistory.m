@implementation SAPhoneCallHistory

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.phone");
}

- (id)encodedClassName
{
  return CFSTR("CallHistory");
}

+ (id)callHistory
{
  return objc_alloc_init((Class)a1);
}

- (NSNumber)blocked
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("blocked"));
}

- (void)setBlocked:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("blocked"), a3);
}

- (NSNumber)callCount
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("callCount"));
}

- (void)setCallCount:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("callCount"), a3);
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

@end
