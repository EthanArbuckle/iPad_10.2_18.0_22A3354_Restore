@implementation STUserData

- (STUserData)initWithIdentifier:(id)a3 givenName:(id)a4 isParent:(BOOL)a5 isRemote:(BOOL)a6 hasPasscode:(BOOL)a7 screenTimeEnabled:(BOOL)a8 syncingEnabled:(BOOL)a9 checkForUnsafePhotos:(BOOL)a10 communicationSafetyNotificationEnabled:(BOOL)a11 communicationSafetyAnalyticsEnabled:(BOOL)a12 familyMemberType:(id)a13
{
  id v20;
  id v21;
  id v22;
  STUserData *v23;
  STUserData *v24;
  uint64_t v25;
  NSString *familyMemberType;
  objc_super v28;

  v20 = a3;
  v21 = a4;
  v22 = a13;
  v28.receiver = self;
  v28.super_class = (Class)STUserData;
  v23 = -[STUserData init](&v28, sel_init);
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_identifier, a3);
    objc_storeStrong((id *)&v24->_givenName, a4);
    v24->_isParent = a5;
    v24->_isRemote = a6;
    v24->_hasPasscode = a7;
    v24->_screenTimeEnabled = a8;
    v24->_syncingEnabled = a9;
    v24->_checkForUnsafePhotos = a10;
    v24->_isCommunicationSafetyNotificationEnabled = a11;
    v24->_isCommunicationSafetyAnalyticsEnabled = a12;
    v25 = objc_msgSend(v22, "copy");
    familyMemberType = v24->_familyMemberType;
    v24->_familyMemberType = (NSString *)v25;

  }
  return v24;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)givenName
{
  return self->_givenName;
}

- (BOOL)isParent
{
  return self->_isParent;
}

- (BOOL)isRemote
{
  return self->_isRemote;
}

- (BOOL)hasPasscode
{
  return self->_hasPasscode;
}

- (BOOL)screenTimeEnabled
{
  return self->_screenTimeEnabled;
}

- (BOOL)syncingEnabled
{
  return self->_syncingEnabled;
}

- (BOOL)checkForUnsafePhotos
{
  return self->_checkForUnsafePhotos;
}

- (BOOL)isCommunicationSafetyNotificationEnabled
{
  return self->_isCommunicationSafetyNotificationEnabled;
}

- (BOOL)isCommunicationSafetyAnalyticsEnabled
{
  return self->_isCommunicationSafetyAnalyticsEnabled;
}

- (NSString)familyMemberType
{
  return self->_familyMemberType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_familyMemberType, 0);
  objc_storeStrong((id *)&self->_givenName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
