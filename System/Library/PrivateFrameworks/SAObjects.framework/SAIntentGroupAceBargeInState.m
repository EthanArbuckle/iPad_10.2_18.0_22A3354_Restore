@implementation SAIntentGroupAceBargeInState

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.command.assistant.intent");
}

- (id)encodedClassName
{
  return CFSTR("AceBargeInState");
}

- (NSArray)bargeInModes
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("bargeInModes"));
}

- (void)setBargeInModes:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("bargeInModes"), a3);
}

- (NSNumber)durationSincePreviousTTSFinish
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("durationSincePreviousTTSFinish"));
}

- (void)setDurationSincePreviousTTSFinish:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("durationSincePreviousTTSFinish"), a3);
}

- (NSNumber)durationSincePreviousTTSStart
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("durationSincePreviousTTSStart"));
}

- (void)setDurationSincePreviousTTSStart:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("durationSincePreviousTTSStart"), a3);
}

@end
