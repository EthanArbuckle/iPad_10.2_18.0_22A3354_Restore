@implementation SASTViewTemplateAction

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.templates");
}

- (id)encodedClassName
{
  return CFSTR("ViewTemplateAction");
}

+ (id)viewTemplateAction
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)commands
{
  return (NSArray *)AceObjectProtocolArrayForProperty(self, (uint64_t)CFSTR("commands"), &unk_1EE77C568);
}

- (void)setCommands:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("commands"), (uint64_t)a3);
}

- (SASTItemGroup)itemGroupView
{
  return (SASTItemGroup *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("itemGroupView"));
}

- (void)setItemGroupView:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("itemGroupView"), a3);
}

- (NSString)viewTitle
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("viewTitle"));
}

- (void)setViewTitle:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("viewTitle"), a3);
}

@end
