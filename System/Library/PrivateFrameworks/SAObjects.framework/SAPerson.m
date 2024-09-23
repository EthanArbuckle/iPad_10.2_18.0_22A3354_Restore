@implementation SAPerson

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("Person");
}

+ (id)person
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)addresses
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("addresses"), v3);
}

- (void)setAddresses:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("addresses"), (uint64_t)a3);
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

- (NSString)companyPhonetic
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("companyPhonetic"));
}

- (void)setCompanyPhonetic:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("companyPhonetic"), a3);
}

- (NSArray)emails
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("emails"), v3);
}

- (void)setEmails:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("emails"), (uint64_t)a3);
}

- (NSString)firstName
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("firstName"));
}

- (void)setFirstName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("firstName"), a3);
}

- (NSDictionary)firstNameAPGs
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSDictionary *)AceObjectClassDictionaryForProperty(self, (uint64_t)CFSTR("firstNameAPGs"), v3);
}

- (void)setFirstNameAPGs:(id)a3
{
  AceObjectSetAceObjectDictionaryForProperty(self, CFSTR("firstNameAPGs"), (uint64_t)a3);
}

- (NSString)firstNamePhonetic
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("firstNamePhonetic"));
}

- (void)setFirstNamePhonetic:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("firstNamePhonetic"), a3);
}

- (NSString)fullName
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("fullName"));
}

- (void)setFullName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("fullName"), a3);
}

- (NSString)internalGUID
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("internalGUID"));
}

- (void)setInternalGUID:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("internalGUID"), a3);
}

- (NSNumber)isBlocked
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("isBlocked"));
}

- (void)setIsBlocked:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("isBlocked"), a3);
}

- (NSString)lastName
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("lastName"));
}

- (void)setLastName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("lastName"), a3);
}

- (NSDictionary)lastNameAPGs
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSDictionary *)AceObjectClassDictionaryForProperty(self, (uint64_t)CFSTR("lastNameAPGs"), v3);
}

- (void)setLastNameAPGs:(id)a3
{
  AceObjectSetAceObjectDictionaryForProperty(self, CFSTR("lastNameAPGs"), (uint64_t)a3);
}

- (NSString)lastNamePhonetic
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("lastNamePhonetic"));
}

- (void)setLastNamePhonetic:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("lastNamePhonetic"), a3);
}

- (NSNumber)me
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("me"));
}

- (void)setMe:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("me"), a3);
}

- (NSString)middleName
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("middleName"));
}

- (void)setMiddleName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("middleName"), a3);
}

- (NSString)nickName
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("nickName"));
}

- (void)setNickName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("nickName"), a3);
}

- (NSDictionary)nickNameAPGs
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSDictionary *)AceObjectClassDictionaryForProperty(self, (uint64_t)CFSTR("nickNameAPGs"), v3);
}

- (void)setNickNameAPGs:(id)a3
{
  AceObjectSetAceObjectDictionaryForProperty(self, CFSTR("nickNameAPGs"), (uint64_t)a3);
}

- (NSString)phonemeData
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("phonemeData"));
}

- (void)setPhonemeData:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("phonemeData"), a3);
}

- (NSArray)phones
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("phones"), v3);
}

- (void)setPhones:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("phones"), (uint64_t)a3);
}

- (NSString)prefix
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("prefix"));
}

- (void)setPrefix:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("prefix"), a3);
}

- (NSNumber)pseudo
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("pseudo"));
}

- (void)setPseudo:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("pseudo"), a3);
}

- (NSArray)relatedNames
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("relatedNames"), v3);
}

- (void)setRelatedNames:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("relatedNames"), (uint64_t)a3);
}

- (NSArray)socialProfiles
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("socialProfiles"), v3);
}

- (void)setSocialProfiles:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("socialProfiles"), (uint64_t)a3);
}

- (NSString)suffix
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("suffix"));
}

- (void)setSuffix:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("suffix"), a3);
}

@end
