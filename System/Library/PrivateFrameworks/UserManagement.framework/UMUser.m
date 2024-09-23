@implementation UMUser

- (unint64_t)userType
{
  return sub_18FAEBAC4();
}

- (unsigned)uid
{
  return self->_uid;
}

- (BOOL)shouldFetchAttributes
{
  return self->_shouldFetchAttributes;
}

- (void)setUid:(unsigned int)a3
{
  self->_uid = a3;
}

- (void)setShouldFetchAttributes:(BOOL)a3
{
  self->_shouldFetchAttributes = a3;
}

- (BOOL)isLoginUser
{
  sub_18FAE7164(self);
  return self->_isLoginUser;
}

- (UMUser)init
{
  UMUser *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UMUser;
  result = -[UMUser init](&v3, sel_init);
  if (result)
  {
    result->_passcodeType = 3;
    result->_shouldFetchAttributes = 1;
  }
  return result;
}

- (unsigned)gid
{
  sub_18FAE7164(self);
  return self->_gid;
}

- (NSString)alternateDSID
{
  sub_18FAE7164(self);
  return self->_alternateDSID;
}

- (NSURL)homeDirectoryURL
{
  sub_18FAE7164(self);
  return self->_homeDirectoryURL;
}

- (NSString)username
{
  sub_18FAE7164(self);
  return self->_username;
}

- (NSString)givenName
{
  sub_18FAE7164(self);
  return self->_givenName;
}

- (NSString)familyName
{
  sub_18FAE7164(self);
  return self->_familyName;
}

- (NSURL)photoURL
{
  sub_18FAE7164(self);
  return self->_photoURL;
}

- (NSString)userAuxiliaryString
{
  sub_18FAE7164(self);
  return self->_userAuxiliaryString;
}

- (NSDate)creationDate
{
  sub_18FAE7164(self);
  return self->_creationDate;
}

- (NSDate)lastLoginDate
{
  sub_18FAE7164(self);
  return self->_lastLoginDate;
}

- (NSDate)lastRemoteAuthDate
{
  sub_18FAE7164(self);
  return self->_lastRemoteAuthDate;
}

- (BOOL)isAuditor
{
  sub_18FAE7164(self);
  return self->_isAuditor;
}

- (BOOL)isDisabled
{
  sub_18FAE7164(self);
  return self->_isDisabled;
}

- (BOOL)isTransientUser
{
  sub_18FAE7164(self);
  return self->_isTransientUser;
}

- (BOOL)isPrimaryUser
{
  sub_18FAE7164(self);
  return self->_isPrimaryUser;
}

- (BOOL)isAdminUser
{
  sub_18FAE7164(self);
  return self->_isAdminUser;
}

- (BOOL)inFirstLoginSession
{
  sub_18FAE7164(self);
  return !self->_firstLoginEndDate || !self->_lastCachedLoginStartDate;
}

- (unint64_t)passcodeLockGracePeriod
{
  sub_18FAE7164(self);
  return self->_passcodeLockGracePeriod;
}

- (NSArray)languages
{
  sub_18FAE7164(self);
  return self->_languages;
}

- (BOOL)hasManagedCredentials
{
  sub_18FAE7164(self);
  return self->_hasManagedCredentials;
}

- (NSError)errorCausingLogout
{
  sub_18FAE7164(self);
  return self->_errorCausingLogout;
}

- (NSError)debugErrorCausingLogout
{
  sub_18FAE7164(self);
  return self->_debugErrorCausingLogout;
}

- (unint64_t)passcodeType
{
  sub_18FAE7164(self);
  return self->_passcodeType;
}

- (NSDate)firstLoginStartDate
{
  sub_18FAE7164(self);
  return self->_firstLoginStartDate;
}

- (NSDate)firstLoginEndDate
{
  sub_18FAE7164(self);
  return self->_firstLoginEndDate;
}

- (NSDate)lastCachedLoginStartDate
{
  sub_18FAE7164(self);
  return self->_lastCachedLoginStartDate;
}

- (NSDate)lastCachedLoginEndDate
{
  sub_18FAE7164(self);
  return self->_lastCachedLoginEndDate;
}

- (NSDate)lastLogoutStartDate
{
  sub_18FAE7164(self);
  return self->_lastLogoutStartDate;
}

- (NSDate)lastLogoutEndDate
{
  sub_18FAE7164(self);
  return self->_lastLogoutEndDate;
}

- (double)passcodeBackOffInterval
{
  return sub_18FAEF04C((uint64_t)UMMobileKeyBag, self);
}

- (BOOL)hasDataToSync
{
  sub_18FAE772C(self, 0);
  return self->_hasDataToSync;
}

- (unint64_t)dataQuota
{
  uint64_t v2;
  int v4;
  const char *v5;
  uint64_t v6;
  unint64_t *p_dataQuota;
  _BYTE v9[64];

  v4 = objc_msgSend_uid(self, a2, v2);
  if (v4 == getuid())
  {
    p_dataQuota = (unint64_t *)v9;
    sub_18FB06794(self, v5, v6, (uint64_t)v9);
  }
  else
  {
    sub_18FAE772C(self, 0);
    p_dataQuota = &self->_dataQuota;
  }
  return *p_dataQuota;
}

- (unint64_t)dataUsed
{
  uint64_t v2;
  int v4;
  const char *v5;
  uint64_t v6;
  unint64_t *p_dataUsed;
  uint64_t v9;
  uint64_t v10;

  v4 = objc_msgSend_uid(self, a2, v2);
  if (v4 == getuid())
  {
    sub_18FB06794(self, v5, v6, (uint64_t)&v9);
    p_dataUsed = (unint64_t *)&v10;
  }
  else
  {
    sub_18FAE772C(self, 0);
    p_dataUsed = &self->_dataUsed;
  }
  return *p_dataUsed;
}

- (void)setDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_displayName, a3);
}

- (NSString)displayName
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  const char *v17;
  NSString *v18;
  NSString *displayName;

  if (!self->_displayName)
  {
    objc_msgSend_givenName(self, a2, v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {

LABEL_5:
      v8 = (void *)objc_opt_new();
      objc_msgSend_givenName(self, v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setGivenName_(v8, v12, (uint64_t)v11);

      objc_msgSend_familyName(self, v13, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setFamilyName_(v8, v16, (uint64_t)v15);

      objc_msgSend_localizedStringFromPersonNameComponents_style_options_(MEMORY[0x1E0CB3858], v17, (uint64_t)v8, 0, 0);
      v18 = (NSString *)objc_claimAutoreleasedReturnValue();
      displayName = self->_displayName;
      self->_displayName = v18;

      return self->_displayName;
    }
    objc_msgSend_familyName(self, v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      goto LABEL_5;
  }
  return self->_displayName;
}

- (id)description
{
  uint64_t v2;
  void *v4;
  uint64_t v5;
  const char *v6;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = objc_msgSend_uid(self, a2, v2);
  return (id)objc_msgSend_stringWithFormat_(v4, v6, (uint64_t)CFSTR("%p(UID: %d)"), self, v5);
}

- (BOOL)isEqual:(id)a3
{
  UMUser *v4;
  const char *v5;
  char isEqualToUser;

  v4 = (UMUser *)a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (self == v4)
      isEqualToUser = 1;
    else
      isEqualToUser = objc_msgSend_isEqualToUser_(self, v5, (uint64_t)v4);
  }
  else
  {
    isEqualToUser = 0;
  }

  return isEqualToUser;
}

- (BOOL)isEqualToUser:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  char isEqualToString;
  int v26;
  const char *v27;
  uint64_t v28;

  v4 = a3;
  objc_msgSend_alternateDSID(self, v5, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7
    && (v10 = (void *)v7,
        objc_msgSend_alternateDSID(v4, v8, v9),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v11,
        v10,
        v11))
  {
    objc_msgSend_alternateDSID(self, v8, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_alternateDSID(v4, v13, v14);
    v15 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend_username(self, v8, v9);
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17
      || (v20 = (void *)v17,
          objc_msgSend_username(v4, v18, v19),
          v21 = (void *)objc_claimAutoreleasedReturnValue(),
          v21,
          v20,
          !v21))
    {
      v26 = objc_msgSend_uid(self, v18, v19);
      isEqualToString = v26 == objc_msgSend_uid(v4, v27, v28);
      goto LABEL_9;
    }
    objc_msgSend_username(self, v18, v19);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_username(v4, v22, v23);
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v24 = (void *)v15;
  isEqualToString = objc_msgSend_isEqualToString_(v12, v16, v15);

LABEL_9:
  return isEqualToString;
}

- (void)refetchUser
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  sub_18FAEA1C0();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE71DC((uint64_t)v3, CFSTR("Force Marking UMUser with UID:%d to refetch Attributes on next access"), v4, v5, v6, v7, v8, v9, self->_uid);

  self->_shouldFetchAttributes = 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_opt_new();
  sub_18FB06C78((uint64_t)v4, self);
  return v4;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_opt_new();
  sub_18FB06C78((uint64_t)v4, self);
  return v4;
}

- (BOOL)commitChanges
{
  return MEMORY[0x1E0DE7D20](self, sel_commitChangesWithError_, 0);
}

- (BOOL)commitChangesWithError:(id *)a3
{
  UMUser *v4;

  v4 = self;
  objc_sync_enter(v4);
  LOBYTE(a3) = sub_18FAF1B60((uint64_t)UMMobileKeyBag, v4, a3);
  objc_sync_exit(v4);

  return (char)a3;
}

- (NSArray)allUserPersonas
{
  const char *v2;
  void *v3;
  void *v4;

  sub_18FAE9B44();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend_arrayWithObject_(MEMORY[0x1E0C99D20], v2, (uint64_t)v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (NSArray *)v4;
}

- (id)userPersonaFromIdentityString:(id)a3
{
  void *v3;

  if (objc_msgSend_isEqualToString_(a3, a2, (uint64_t)CFSTR("DEADDEAD-DEAD-DEAD-DEAD-DEADDEADDEAD")))
  {
    sub_18FAE9B44();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)setGid:(unsigned int)a3
{
  self->_gid = a3;
}

- (void)setAlternateDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setHomeDirectoryURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setUsername:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setGivenName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void)setFamilyName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void)setPhotoURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void)setUserAuxiliaryString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void)setCreationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void)setLastLoginDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void)setLastRemoteAuthDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void)setPasscodeType:(unint64_t)a3
{
  self->_passcodeType = a3;
}

- (void)setIsLoginUser:(BOOL)a3
{
  self->_isLoginUser = a3;
}

- (void)setIsAuditor:(BOOL)a3
{
  self->_isAuditor = a3;
}

- (void)setIsDisabled:(BOOL)a3
{
  self->_isDisabled = a3;
}

- (void)setIsTransientUser:(BOOL)a3
{
  self->_isTransientUser = a3;
}

- (void)setIsPrimaryUser:(BOOL)a3
{
  self->_isPrimaryUser = a3;
}

- (void)setIsAdminUser:(BOOL)a3
{
  self->_isAdminUser = a3;
}

- (void)setPasscodeLockGracePeriod:(unint64_t)a3
{
  self->_passcodeLockGracePeriod = a3;
}

- (void)setLanguages:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (void)setHasManagedCredentials:(BOOL)a3
{
  self->_hasManagedCredentials = a3;
}

- (void)setDataQuota:(unint64_t)a3
{
  self->_dataQuota = a3;
}

- (void)setDataUsed:(unint64_t)a3
{
  self->_dataUsed = a3;
}

- (void)setHasDataToSync:(BOOL)a3
{
  self->_hasDataToSync = a3;
}

- (void)setErrorCausingLogout:(id)a3
{
  objc_storeStrong((id *)&self->_errorCausingLogout, a3);
}

- (id)_photo
{
  return self->__photo;
}

- (void)set_photo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (void)setFirstLoginStartDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (void)setFirstLoginEndDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (void)setLastCachedLoginStartDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (void)setLastCachedLoginEndDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (void)setLastLogoutStartDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (void)setLastLogoutEndDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (void)setDebugErrorCausingLogout:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugErrorCausingLogout, 0);
  objc_storeStrong((id *)&self->_lastLogoutEndDate, 0);
  objc_storeStrong((id *)&self->_lastLogoutStartDate, 0);
  objc_storeStrong((id *)&self->_lastCachedLoginEndDate, 0);
  objc_storeStrong((id *)&self->_lastCachedLoginStartDate, 0);
  objc_storeStrong((id *)&self->_firstLoginEndDate, 0);
  objc_storeStrong((id *)&self->_firstLoginStartDate, 0);
  objc_storeStrong(&self->__photo, 0);
  objc_storeStrong((id *)&self->_errorCausingLogout, 0);
  objc_storeStrong((id *)&self->_languages, 0);
  objc_storeStrong((id *)&self->_lastRemoteAuthDate, 0);
  objc_storeStrong((id *)&self->_lastLoginDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_userAuxiliaryString, 0);
  objc_storeStrong((id *)&self->_photoURL, 0);
  objc_storeStrong((id *)&self->_familyName, 0);
  objc_storeStrong((id *)&self->_givenName, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_homeDirectoryURL, 0);
  objc_storeStrong((id *)&self->_alternateDSID, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

@end
