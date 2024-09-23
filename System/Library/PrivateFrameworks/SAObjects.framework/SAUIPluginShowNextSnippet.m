@implementation SAUIPluginShowNextSnippet

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.assistant");
}

- (id)encodedClassName
{
  return CFSTR("PluginShowNextSnippet");
}

- (SAUIPluginSnippet)pluginSnippet
{
  return (SAUIPluginSnippet *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("pluginSnippet"));
}

- (void)setPluginSnippet:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("pluginSnippet"), a3);
}

@end
