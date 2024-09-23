@implementation ICUserIdentityProperties

- (NSString)storefrontIdentifier
{
  if (self->_storefrontIdentifier)
    return self->_storefrontIdentifier;
  else
    return (NSString *)&stru_1E4391778;
}

- (NSNumber)DSID
{
  return self->_dsid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privacyAcknowledgementVersions, 0);
  objc_storeStrong((id *)&self->_privateListeningEnabledForHomeUsers, 0);
  objc_storeStrong((id *)&self->_privateListeningEnabled, 0);
  objc_storeStrong((id *)&self->_cloudLibraryStateReason, 0);
  objc_storeStrong((id *)&self->_homeUserIdentifiers, 0);
  objc_storeStrong((id *)&self->_mergeToCloudLibraryPreference, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_storefrontIdentifier, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_iCloudPersonID, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_dsid, 0);
  objc_storeStrong((id *)&self->_delegateToken, 0);
  objc_storeStrong((id *)&self->_carrierBundleDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_alternateDSID, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  ICUserIdentityProperties *v5;

  v4 = (void *)objc_opt_class();
  if ((objc_msgSend(v4, "isSubclassOfClass:", objc_opt_class()) & 1) == 0)
    return self;
  v5 = -[ICUserIdentityProperties init](+[ICUserIdentityProperties allocWithZone:](ICUserIdentityProperties, "allocWithZone:", a3), "init");
  if (v5)
    __CopyHelper(self, v5, (uint64_t)a3);
  return v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v5 = (void *)objc_opt_class();
  v6 = objc_opt_class();
  if (objc_msgSend(v5, "isSubclassOfClass:", v6))
    v7 = v5;
  else
    v7 = (void *)v6;
  v8 = (void *)objc_msgSend((id)objc_msgSend(v7, "allocWithZone:", a3), "init");
  if (v8)
    __CopyHelper(self, v8, (uint64_t)a3);
  return v8;
}

- (BOOL)isDelegated
{
  return self->_delegated;
}

- (BOOL)isActiveLocker
{
  return self->_activeLocker;
}

- (NSNumber)privateListeningEnabled
{
  return self->_privateListeningEnabled;
}

- (BOOL)isSandboxed
{
  return self->_sandboxed;
}

- (NSDictionary)cloudLibraryStateReason
{
  return self->_cloudLibraryStateReason;
}

- (NSString)alternateDSID
{
  return self->_alternateDSID;
}

- (NSString)carrierBundleDeviceIdentifier
{
  if (self->_carrierBundleDeviceIdentifier)
    return self->_carrierBundleDeviceIdentifier;
  else
    return (NSString *)&stru_1E4391778;
}

- (NSString)firstName
{
  if (self->_firstName)
    return self->_firstName;
  else
    return (NSString *)&stru_1E4391778;
}

- (NSString)iCloudPersonID
{
  if (self->_iCloudPersonID)
    return self->_iCloudPersonID;
  else
    return (NSString *)&stru_1E4391778;
}

- (NSString)lastName
{
  if (self->_lastName)
    return self->_lastName;
  else
    return (NSString *)&stru_1E4391778;
}

- (NSString)username
{
  if (self->_username)
    return self->_username;
  else
    return (NSString *)&stru_1E4391778;
}

- (NSDate)ageVerificationExpirationDate
{
  return 0;
}

- (NSNumber)mergeToCloudLibraryPreference
{
  return self->_mergeToCloudLibraryPreference;
}

- (NSArray)homeUserIdentifiers
{
  return self->_homeUserIdentifiers;
}

- (NSDictionary)privateListeningEnabledForHomeUsers
{
  return self->_privateListeningEnabledForHomeUsers;
}

- (NSDictionary)privacyAcknowledgementVersions
{
  return self->_privacyAcknowledgementVersions;
}

- (BOOL)isEqual:(id)a3
{
  ICUserIdentityProperties *v4;
  BOOL v5;

  v4 = (ICUserIdentityProperties *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[ICUserIdentityProperties isEqualToIdentityProperties:](self, "isEqualToIdentityProperties:", v4);
  }

  return v5;
}

- (BOOL)isEqualToIdentityProperties:(id)a3
{
  ICUserIdentityProperties *v4;
  ICUserIdentityProperties *v5;
  id v6;
  id v7;
  void *v8;
  char v9;
  char v10;
  id v11;
  id v12;
  void *v13;
  char v14;
  id v15;
  id v16;
  void *v17;
  char v18;
  id v19;
  id v20;
  void *v21;
  char v22;
  id v23;
  id v24;
  void *v25;
  char v26;
  _BOOL4 v27;
  _BOOL4 v28;
  id v29;
  id v30;
  void *v31;
  char v32;
  _BOOL4 v33;
  id v34;
  id v35;
  void *v36;
  char v37;
  id v38;
  id v39;
  void *v40;
  char v41;
  id v42;
  id v43;
  void *v44;
  char v45;
  id v46;
  id v47;
  void *v48;
  char v49;
  id v50;
  id v51;
  void *v52;
  char v53;
  _BOOL4 v54;
  _BOOL4 v55;
  id v56;
  id v57;
  void *v58;
  char v59;
  _BOOL4 v60;
  id v61;
  id v62;
  void *v63;
  char v64;
  _BOOL4 v65;
  id v66;
  id v67;
  void *v68;
  char v69;
  void *v71;
  void *v72;

  v4 = (ICUserIdentityProperties *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_65;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    -[ICUserIdentityProperties alternateDSID](self, "alternateDSID");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[ICUserIdentityProperties alternateDSID](v5, "alternateDSID");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (v6 == v7)
    {

    }
    else
    {
      v8 = v7;
      v9 = objc_msgSend(v6, "isEqual:", v7);

      if ((v9 & 1) == 0)
        goto LABEL_65;
    }
    -[ICUserIdentityProperties carrierBundleDeviceIdentifier](self, "carrierBundleDeviceIdentifier");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    -[ICUserIdentityProperties carrierBundleDeviceIdentifier](v5, "carrierBundleDeviceIdentifier");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (v11 == v12)
    {

    }
    else
    {
      v13 = v12;
      v14 = objc_msgSend(v11, "isEqual:", v12);

      if ((v14 & 1) == 0)
        goto LABEL_65;
    }
    -[ICUserIdentityProperties DSID](self, "DSID");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    -[ICUserIdentityProperties DSID](v5, "DSID");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    if (v15 == v16)
    {

    }
    else
    {
      v17 = v16;
      v18 = objc_msgSend(v15, "isEqual:", v16);

      if ((v18 & 1) == 0)
        goto LABEL_65;
    }
    -[ICUserIdentityProperties firstName](self, "firstName");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    -[ICUserIdentityProperties firstName](v5, "firstName");
    v20 = (id)objc_claimAutoreleasedReturnValue();
    if (v19 == v20)
    {

    }
    else
    {
      v21 = v20;
      v22 = objc_msgSend(v19, "isEqual:", v20);

      if ((v22 & 1) == 0)
        goto LABEL_65;
    }
    -[ICUserIdentityProperties lastName](self, "lastName");
    v23 = (id)objc_claimAutoreleasedReturnValue();
    -[ICUserIdentityProperties lastName](v5, "lastName");
    v24 = (id)objc_claimAutoreleasedReturnValue();
    if (v23 == v24)
    {

    }
    else
    {
      v25 = v24;
      v26 = objc_msgSend(v23, "isEqual:", v24);

      if ((v26 & 1) == 0)
        goto LABEL_65;
    }
    v27 = -[ICUserIdentityProperties isManagedAppleID](self, "isManagedAppleID");
    if (v27 != -[ICUserIdentityProperties isManagedAppleID](v5, "isManagedAppleID"))
      goto LABEL_65;
    v28 = -[ICUserIdentityProperties isSandboxed](self, "isSandboxed");
    if (v28 != -[ICUserIdentityProperties isSandboxed](v5, "isSandboxed"))
      goto LABEL_65;
    -[ICUserIdentityProperties storefrontIdentifier](self, "storefrontIdentifier");
    v29 = (id)objc_claimAutoreleasedReturnValue();
    -[ICUserIdentityProperties storefrontIdentifier](v5, "storefrontIdentifier");
    v30 = (id)objc_claimAutoreleasedReturnValue();
    if (v29 == v30)
    {

    }
    else
    {
      v31 = v30;
      v32 = objc_msgSend(v29, "isEqual:", v30);

      if ((v32 & 1) == 0)
        goto LABEL_65;
    }
    v33 = -[ICUserIdentityProperties isSubscriptionStatusEnabled](self, "isSubscriptionStatusEnabled");
    if (v33 != -[ICUserIdentityProperties isSubscriptionStatusEnabled](v5, "isSubscriptionStatusEnabled"))
      goto LABEL_65;
    -[ICUserIdentityProperties username](self, "username");
    v34 = (id)objc_claimAutoreleasedReturnValue();
    -[ICUserIdentityProperties username](v5, "username");
    v35 = (id)objc_claimAutoreleasedReturnValue();
    if (v34 == v35)
    {

    }
    else
    {
      v36 = v35;
      v37 = objc_msgSend(v34, "isEqual:", v35);

      if ((v37 & 1) == 0)
        goto LABEL_65;
    }
    -[ICUserIdentityProperties mergeToCloudLibraryPreference](self, "mergeToCloudLibraryPreference");
    v38 = (id)objc_claimAutoreleasedReturnValue();
    -[ICUserIdentityProperties mergeToCloudLibraryPreference](v5, "mergeToCloudLibraryPreference");
    v39 = (id)objc_claimAutoreleasedReturnValue();
    if (v38 == v39)
    {

    }
    else
    {
      v40 = v39;
      v41 = objc_msgSend(v38, "isEqual:", v39);

      if ((v41 & 1) == 0)
        goto LABEL_65;
    }
    -[ICUserIdentityProperties homeUserIdentifiers](self, "homeUserIdentifiers");
    v42 = (id)objc_claimAutoreleasedReturnValue();
    -[ICUserIdentityProperties homeUserIdentifiers](v5, "homeUserIdentifiers");
    v43 = (id)objc_claimAutoreleasedReturnValue();
    if (v42 == v43)
    {

    }
    else
    {
      v44 = v43;
      v45 = objc_msgSend(v42, "isEqual:", v43);

      if ((v45 & 1) == 0)
        goto LABEL_65;
    }
    -[ICUserIdentityProperties cloudLibraryStateReason](self, "cloudLibraryStateReason");
    v46 = (id)objc_claimAutoreleasedReturnValue();
    -[ICUserIdentityProperties cloudLibraryStateReason](v5, "cloudLibraryStateReason");
    v47 = (id)objc_claimAutoreleasedReturnValue();
    if (v46 == v47)
    {

    }
    else
    {
      v48 = v47;
      v49 = objc_msgSend(v46, "isEqual:", v47);

      if ((v49 & 1) == 0)
        goto LABEL_65;
    }
    -[ICUserIdentityProperties privateListeningEnabled](self, "privateListeningEnabled");
    v50 = (id)objc_claimAutoreleasedReturnValue();
    -[ICUserIdentityProperties privateListeningEnabled](v5, "privateListeningEnabled");
    v51 = (id)objc_claimAutoreleasedReturnValue();
    if (v50 == v51)
    {

    }
    else
    {
      v52 = v51;
      v53 = objc_msgSend(v50, "isEqual:", v51);

      if ((v53 & 1) == 0)
        goto LABEL_65;
    }
    v54 = -[ICUserIdentityProperties isActiveLocker](self, "isActiveLocker");
    if (v54 != -[ICUserIdentityProperties isActiveLocker](v5, "isActiveLocker"))
      goto LABEL_65;
    v55 = -[ICUserIdentityProperties isActive](self, "isActive");
    if (v55 != -[ICUserIdentityProperties isActive](v5, "isActive"))
      goto LABEL_65;
    -[ICUserIdentityProperties privateListeningEnabledForHomeUsers](self, "privateListeningEnabledForHomeUsers");
    v56 = (id)objc_claimAutoreleasedReturnValue();
    -[ICUserIdentityProperties privateListeningEnabledForHomeUsers](v5, "privateListeningEnabledForHomeUsers");
    v57 = (id)objc_claimAutoreleasedReturnValue();
    if (v56 == v57)
    {

    }
    else
    {
      v58 = v57;
      v59 = objc_msgSend(v56, "isEqual:", v57);

      if ((v59 & 1) == 0)
        goto LABEL_65;
    }
    v60 = -[ICUserIdentityProperties isCloudBackupEnabled](self, "isCloudBackupEnabled");
    if (v60 != -[ICUserIdentityProperties isCloudBackupEnabled](v5, "isCloudBackupEnabled"))
      goto LABEL_65;
    -[ICUserIdentityProperties iCloudPersonID](self, "iCloudPersonID");
    v61 = (id)objc_claimAutoreleasedReturnValue();
    -[ICUserIdentityProperties iCloudPersonID](v5, "iCloudPersonID");
    v62 = (id)objc_claimAutoreleasedReturnValue();
    if (v61 == v62)
    {

    }
    else
    {
      v63 = v62;
      v64 = objc_msgSend(v61, "isEqual:", v62);

      if ((v64 & 1) == 0)
        goto LABEL_65;
    }
    v65 = -[ICUserIdentityProperties isDelegated](self, "isDelegated");
    if (v65 != -[ICUserIdentityProperties isDelegated](v5, "isDelegated"))
    {
LABEL_65:
      v10 = 0;
      goto LABEL_66;
    }
    -[ICUserIdentityProperties delegateToken](self, "delegateToken");
    v66 = (id)objc_claimAutoreleasedReturnValue();
    -[ICUserIdentityProperties delegateToken](v5, "delegateToken");
    v67 = (id)objc_claimAutoreleasedReturnValue();
    if (v66 == v67)
    {

    }
    else
    {
      v68 = v67;
      v69 = objc_msgSend(v66, "isEqual:", v67);

      if ((v69 & 1) == 0)
        goto LABEL_65;
    }
    -[ICUserIdentityProperties privacyAcknowledgementVersions](self, "privacyAcknowledgementVersions");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICUserIdentityProperties privacyAcknowledgementVersions](v5, "privacyAcknowledgementVersions");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    if (v71 == v72)
      v10 = 1;
    else
      v10 = objc_msgSend(v71, "isEqual:", v72);

  }
LABEL_66:

  return v10;
}

- (ICUserIdentityProperties)initWithCoder:(id)a3
{
  id v4;
  ICUserIdentityProperties *v5;
  uint64_t v6;
  NSString *alternateDSID;
  uint64_t v8;
  NSString *carrierBundleDeviceIdentifier;
  uint64_t v10;
  ICDelegateToken *delegateToken;
  uint64_t v12;
  NSNumber *dsid;
  uint64_t v14;
  NSString *firstName;
  uint64_t v16;
  NSString *iCloudPersonID;
  uint64_t v18;
  NSString *lastName;
  uint64_t v20;
  NSString *storefrontIdentifier;
  uint64_t v22;
  NSString *username;
  uint64_t v24;
  NSNumber *mergeToCloudLibraryPreference;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  NSArray *homeUserIdentifiers;
  uint64_t v31;
  NSDictionary *cloudLibraryStateReason;
  uint64_t v33;
  NSNumber *privateListeningEnabled;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  NSDictionary *privateListeningEnabledForHomeUsers;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  NSDictionary *privacyAcknowledgementVersions;
  objc_super v48;

  v4 = a3;
  v48.receiver = self;
  v48.super_class = (Class)ICUserIdentityProperties;
  v5 = -[ICUserIdentityProperties init](&v48, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("altDSID"));
    v6 = objc_claimAutoreleasedReturnValue();
    alternateDSID = v5->_alternateDSID;
    v5->_alternateDSID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("carrierDeviceID"));
    v8 = objc_claimAutoreleasedReturnValue();
    carrierBundleDeviceIdentifier = v5->_carrierBundleDeviceIdentifier;
    v5->_carrierBundleDeviceIdentifier = (NSString *)v8;

    v5->_cloudBackupEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("cloudBackup"));
    v5->_delegated = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("delegated"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("delegateToken"));
    v10 = objc_claimAutoreleasedReturnValue();
    delegateToken = v5->_delegateToken;
    v5->_delegateToken = (ICDelegateToken *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dsid"));
    v12 = objc_claimAutoreleasedReturnValue();
    dsid = v5->_dsid;
    v5->_dsid = (NSNumber *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("firstName"));
    v14 = objc_claimAutoreleasedReturnValue();
    firstName = v5->_firstName;
    v5->_firstName = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("iCloudPersonID"));
    v16 = objc_claimAutoreleasedReturnValue();
    iCloudPersonID = v5->_iCloudPersonID;
    v5->_iCloudPersonID = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastName"));
    v18 = objc_claimAutoreleasedReturnValue();
    lastName = v5->_lastName;
    v5->_lastName = (NSString *)v18;

    v5->_managedAppleID = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isManaged"));
    v5->_sandboxed = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("sandboxed"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("storefront"));
    v20 = objc_claimAutoreleasedReturnValue();
    storefrontIdentifier = v5->_storefrontIdentifier;
    v5->_storefrontIdentifier = (NSString *)v20;

    v5->_subscriptionStatusEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("subscriptionStatusEnabled"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("username"));
    v22 = objc_claimAutoreleasedReturnValue();
    username = v5->_username;
    v5->_username = (NSString *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mergeToCloudLibraryPreference"));
    v24 = objc_claimAutoreleasedReturnValue();
    mergeToCloudLibraryPreference = v5->_mergeToCloudLibraryPreference;
    v5->_mergeToCloudLibraryPreference = (NSNumber *)v24;

    v26 = (void *)MEMORY[0x1E0C99E60];
    v27 = objc_opt_class();
    objc_msgSend(v26, "setWithObjects:", v27, objc_opt_class(), 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v28, CFSTR("homeUserIdentifiers"));
    v29 = objc_claimAutoreleasedReturnValue();
    homeUserIdentifiers = v5->_homeUserIdentifiers;
    v5->_homeUserIdentifiers = (NSArray *)v29;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cloudLibraryStateReason"));
    v31 = objc_claimAutoreleasedReturnValue();
    cloudLibraryStateReason = v5->_cloudLibraryStateReason;
    v5->_cloudLibraryStateReason = (NSDictionary *)v31;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("privateListeningEnabled"));
    v33 = objc_claimAutoreleasedReturnValue();
    privateListeningEnabled = v5->_privateListeningEnabled;
    v5->_privateListeningEnabled = (NSNumber *)v33;

    v5->_activeLocker = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("activeLocker"));
    v5->_active = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("active"));
    v35 = (void *)MEMORY[0x1E0C99E60];
    v36 = objc_opt_class();
    v37 = objc_opt_class();
    objc_msgSend(v35, "setWithObjects:", v36, v37, objc_opt_class(), 0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v38, CFSTR("privateListeningEnabledForHomeUsers"));
    v39 = objc_claimAutoreleasedReturnValue();
    privateListeningEnabledForHomeUsers = v5->_privateListeningEnabledForHomeUsers;
    v5->_privateListeningEnabledForHomeUsers = (NSDictionary *)v39;

    v41 = (void *)MEMORY[0x1E0C99E60];
    v42 = objc_opt_class();
    v43 = objc_opt_class();
    objc_msgSend(v41, "setWithObjects:", v42, v43, objc_opt_class(), 0);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v44, CFSTR("privacyAcknowledgementVersions"));
    v45 = objc_claimAutoreleasedReturnValue();
    privacyAcknowledgementVersions = v5->_privacyAcknowledgementVersions;
    v5->_privacyAcknowledgementVersions = (NSDictionary *)v45;

    v5->_u18MinorAccount = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("u18MinorAccount"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *alternateDSID;
  id v5;

  alternateDSID = self->_alternateDSID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", alternateDSID, CFSTR("altDSID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_carrierBundleDeviceIdentifier, CFSTR("carrierDeviceID"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_cloudBackupEnabled, CFSTR("cloudBackup"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_delegated, CFSTR("delegated"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_delegateToken, CFSTR("delegateToken"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dsid, CFSTR("dsid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_firstName, CFSTR("firstName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_iCloudPersonID, CFSTR("iCloudPersonID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastName, CFSTR("lastName"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_managedAppleID, CFSTR("isManaged"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_sandboxed, CFSTR("sandboxed"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_storefrontIdentifier, CFSTR("storefront"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_subscriptionStatusEnabled, CFSTR("subscriptionStatusEnabled"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_username, CFSTR("username"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_mergeToCloudLibraryPreference, CFSTR("mergeToCloudLibraryPreference"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_homeUserIdentifiers, CFSTR("homeUserIdentifiers"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_cloudLibraryStateReason, CFSTR("cloudLibraryStateReason"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_privateListeningEnabled, CFSTR("privateListeningEnabled"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_activeLocker, CFSTR("activeLocker"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_active, CFSTR("active"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_privateListeningEnabledForHomeUsers, CFSTR("privateListeningEnabledForHomeUsers"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_privacyAcknowledgementVersions, CFSTR("privacyAcknowledgementVersions"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_u18MinorAccount, CFSTR("u18MinorAccount"));

}

- (ICDelegateToken)delegateToken
{
  return self->_delegateToken;
}

- (BOOL)isActive
{
  return self->_active;
}

- (BOOL)isManagedAppleID
{
  return self->_managedAppleID;
}

- (BOOL)isSubscriptionStatusEnabled
{
  return self->_subscriptionStatusEnabled;
}

- (void)setHomeUserIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void)setPrivateListeningEnabledForHomeUsers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (BOOL)isU18MinorAccount
{
  return self->_u18MinorAccount;
}

- (BOOL)isCloudBackupEnabled
{
  return self->_cloudBackupEnabled;
}

- (void)setCloudBackupEnabled:(BOOL)a3
{
  self->_cloudBackupEnabled = a3;
}

- (void)setICloudPersonID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
