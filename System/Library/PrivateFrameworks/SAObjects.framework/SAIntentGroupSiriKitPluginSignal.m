@implementation SAIntentGroupSiriKitPluginSignal

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.command.assistant.intent");
}

- (id)encodedClassName
{
  return CFSTR("SiriKitPluginSignal");
}

- (SAIntentGroupSiriKitPluginSignal)initWithBundleIdentifier:(id)a3
{
  id v4;
  SAIntentGroupSiriKitPluginSignal *v5;
  SAIntentGroupSiriKitPluginSignal *v6;

  v4 = a3;
  v5 = -[AceObject init](self, "init");
  v6 = v5;
  if (v5)
    -[SAIntentGroupSiriKitPluginSignal setBundleIdentifier:](v5, "setBundleIdentifier:", v4);

  return v6;
}

- (NSString)bundleIdentifier
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("bundleIdentifier"));
}

- (void)setBundleIdentifier:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("bundleIdentifier"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

- (BOOL)mutatingCommand
{
  return 0;
}

@end
