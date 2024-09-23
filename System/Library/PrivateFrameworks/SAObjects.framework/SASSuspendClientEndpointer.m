@implementation SASSuspendClientEndpointer

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.speech");
}

- (id)encodedClassName
{
  return CFSTR("SuspendClientEndpointer");
}

+ (id)suspendClientEndpointer
{
  return objc_alloc_init((Class)a1);
}

- (NSNumber)audioProcessedMs
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("audioProcessedMs"));
}

- (void)setAudioProcessedMs:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("audioProcessedMs"), a3);
}

- (NSNumber)suspendDurationMs
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("suspendDurationMs"));
}

- (void)setSuspendDurationMs:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("suspendDurationMs"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
