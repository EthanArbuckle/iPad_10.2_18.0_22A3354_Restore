@implementation SASVDialogAct

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.vector");
}

- (id)encodedClassName
{
  return CFSTR("DialogAct");
}

+ (id)dialogAct
{
  return objc_alloc_init((Class)a1);
}

- (NSString)name
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("name"));
}

- (void)setName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("name"), a3);
}

- (SASVDialogNode)parametersRoot
{
  return (SASVDialogNode *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("parametersRoot"));
}

- (void)setParametersRoot:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("parametersRoot"), a3);
}

@end
