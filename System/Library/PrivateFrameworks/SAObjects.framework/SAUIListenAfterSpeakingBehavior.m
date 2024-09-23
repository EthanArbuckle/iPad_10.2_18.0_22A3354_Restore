@implementation SAUIListenAfterSpeakingBehavior

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.assistant");
}

- (id)encodedClassName
{
  return CFSTR("ListenAfterSpeakingBehavior");
}

- (NSString)startAlertSoundID
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("startAlertSoundID"));
}

- (void)setStartAlertSoundID:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("startAlertSoundID"), a3);
}

@end
