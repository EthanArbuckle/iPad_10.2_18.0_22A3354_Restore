@implementation SAGKAlternateResult

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.generalknowledge");
}

- (id)encodedClassName
{
  return CFSTR("AlternateResult");
}

+ (id)alternateResult
{
  return objc_alloc_init((Class)a1);
}

- (SAClientBoundCommand)command
{
  return (SAClientBoundCommand *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("command"));
}

- (void)setCommand:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("command"), a3);
}

- (NSString)name
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("name"));
}

- (void)setName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("name"), a3);
}

@end
