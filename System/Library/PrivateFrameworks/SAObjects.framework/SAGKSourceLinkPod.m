@implementation SAGKSourceLinkPod

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.generalknowledge");
}

- (id)encodedClassName
{
  return CFSTR("SourceLinkPod");
}

+ (id)sourceLinkPod
{
  return objc_alloc_init((Class)a1);
}

- (NSString)linkText
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("linkText"));
}

- (void)setLinkText:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("linkText"), a3);
}

- (SAUIAppPunchOut)punchOut
{
  return (SAUIAppPunchOut *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("punchOut"));
}

- (void)setPunchOut:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("punchOut"), a3);
}

@end
