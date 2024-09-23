@implementation SAABPersonSearch

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.contact");
}

- (id)encodedClassName
{
  return CFSTR("PersonSearch");
}

+ (id)personSearch
{
  return objc_alloc_init((Class)a1);
}

- (NSURL)accountIdentifier
{
  return (NSURL *)AceObjectURLForProperty(self, (uint64_t)CFSTR("accountIdentifier"));
}

- (void)setAccountIdentifier:(id)a3
{
  AceObjectSetURLForProperty(self, CFSTR("accountIdentifier"), a3);
}

- (SALocation)address
{
  return (SALocation *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("address"));
}

- (void)setAddress:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("address"), a3);
}

- (NSDate)birthday
{
  return (NSDate *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("birthday"));
}

- (void)setBirthday:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("birthday"), a3);
}

- (NSString)company
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("company"));
}

- (void)setCompany:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("company"), a3);
}

- (SAEmail)email
{
  return (SAEmail *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("email"));
}

- (void)setEmail:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("email"), a3);
}

- (NSNumber)me
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("me"));
}

- (void)setMe:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("me"), a3);
}

- (NSString)name
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("name"));
}

- (void)setName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("name"), a3);
}

- (SAPhone)phone
{
  return (SAPhone *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("phone"));
}

- (void)setPhone:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("phone"), a3);
}

- (NSString)relationship
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("relationship"));
}

- (void)setRelationship:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("relationship"), a3);
}

- (NSString)scope
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("scope"));
}

- (void)setScope:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("scope"), a3);
}

- (BOOL)requiresResponse
{
  return 1;
}

- (BOOL)mutatingCommand
{
  return 0;
}

@end
