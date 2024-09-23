@implementation SAIntentGroupSnippetTemplate

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.command.assistant.intent");
}

- (id)encodedClassName
{
  return CFSTR("SnippetTemplate");
}

+ (id)snippetTemplate
{
  return objc_alloc_init((Class)a1);
}

- (SAUISnippet)detailSnippet
{
  return (SAUISnippet *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("detailSnippet"));
}

- (void)setDetailSnippet:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("detailSnippet"), a3);
}

- (NSArray)intentSlotKeyPaths
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("intentSlotKeyPaths"));
}

- (void)setIntentSlotKeyPaths:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("intentSlotKeyPaths"), a3);
}

- (NSString)key
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("key"));
}

- (void)setKey:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("key"), a3);
}

@end
