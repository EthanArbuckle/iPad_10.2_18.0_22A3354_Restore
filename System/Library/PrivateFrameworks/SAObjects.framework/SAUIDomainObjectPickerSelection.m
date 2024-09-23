@implementation SAUIDomainObjectPickerSelection

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.assistant");
}

- (id)encodedClassName
{
  return CFSTR("DomainObjectPickerSelection");
}

+ (id)domainObjectPickerSelection
{
  return objc_alloc_init((Class)a1);
}

- (SAUIDomainObjectPicker)domainObjectPicker
{
  return (SAUIDomainObjectPicker *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("domainObjectPicker"));
}

- (void)setDomainObjectPicker:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("domainObjectPicker"), a3);
}

- (SADomainObject)selectedItem
{
  return (SADomainObject *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("selectedItem"));
}

- (void)setSelectedItem:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("selectedItem"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
