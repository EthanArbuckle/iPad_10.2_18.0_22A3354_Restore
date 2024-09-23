@implementation SACardSnippet

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.ui.card");
}

- (id)encodedClassName
{
  return CFSTR("Snippet");
}

+ (id)snippet
{
  return objc_alloc_init((Class)a1);
}

- (NSData)cardData
{
  return (NSData *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("cardData"));
}

- (void)setCardData:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("cardData"), a3);
}

- (NSData)compactSizeCardData
{
  return (NSData *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("compactSizeCardData"));
}

- (void)setCompactSizeCardData:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("compactSizeCardData"), a3);
}

- (NSArray)contextItems
{
  return (NSArray *)AceObjectProtocolArrayForProperty(self, (uint64_t)CFSTR("contextItems"), &unk_1EE77C4D0);
}

- (void)setContextItems:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("contextItems"), (uint64_t)a3);
}

- (NSArray)referencedCommands
{
  return (NSArray *)AceObjectProtocolArrayForProperty(self, (uint64_t)CFSTR("referencedCommands"), &unk_1EE77C568);
}

- (void)setReferencedCommands:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("referencedCommands"), (uint64_t)a3);
}

- (NSArray)referencedSnippets
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("referencedSnippets"), v3);
}

- (void)setReferencedSnippets:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("referencedSnippets"), (uint64_t)a3);
}

- (NSString)responseViewId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("responseViewId"));
}

- (void)setResponseViewId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("responseViewId"), a3);
}

@end
