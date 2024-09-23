@implementation SALCMLiveTuneInButton

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.livecontent");
}

- (id)encodedClassName
{
  return CFSTR("LiveTuneInButton");
}

+ (id)liveTuneInButton
{
  return objc_alloc_init((Class)a1);
}

- (NSString)liveTuneInButtonType
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("liveTuneInButtonType"));
}

- (void)setLiveTuneInButtonType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("liveTuneInButtonType"), a3);
}

@end
