@implementation SACFPEXContactNameItem

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.clientflow.local.pex");
}

- (id)encodedClassName
{
  return CFSTR("ContactNameItem");
}

+ (id)contactNameItem
{
  return objc_alloc_init((Class)a1);
}

- (SAPerson)person
{
  return (SAPerson *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("person"));
}

- (void)setPerson:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("person"), a3);
}

@end
