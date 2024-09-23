@implementation PKAccountUser

- (PKAccountUser)initWithDictionary:(id)a3
{
  id v4;
  PKAccountUser *v5;
  void *v6;
  uint64_t v7;
  NSString *altDSID;
  void *v9;
  uint64_t v10;
  NSString *firstName;
  uint64_t v12;
  NSString *lastName;
  uint64_t v14;
  NSString *appleID;
  uint64_t v16;
  NSSet *addressableHandles;
  void *v18;
  uint64_t v19;
  NSSet *supportedFeatures;
  PKAccountUserPreferences *v21;
  void *v22;
  uint64_t v23;
  PKAccountUserPreferences *preferences;
  __CFString *v25;
  __CFString *v26;
  char v27;
  uint64_t v28;
  __CFString *v29;
  __CFString *v30;
  char v31;
  __CFString *v32;
  __CFString *v33;
  char v34;
  __CFString *v35;
  __CFString *v36;
  int v37;
  objc_super v39;

  v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)PKAccountUser;
  v5 = -[PKAccountUser init](&v39, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("accessLevel"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_accessLevel = PKAccountAccessLevelFromString(v6);

    objc_msgSend(v4, "PKStringForKey:", CFSTR("altDSID"));
    v7 = objc_claimAutoreleasedReturnValue();
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v7;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("state"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_accountState = PKAccountStateFromString(v9);

    objc_msgSend(v4, "PKStringForKey:", CFSTR("firstName"));
    v10 = objc_claimAutoreleasedReturnValue();
    firstName = v5->_firstName;
    v5->_firstName = (NSString *)v10;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("lastName"));
    v12 = objc_claimAutoreleasedReturnValue();
    lastName = v5->_lastName;
    v5->_lastName = (NSString *)v12;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("appleID"));
    v14 = objc_claimAutoreleasedReturnValue();
    appleID = v5->_appleID;
    v5->_appleID = (NSString *)v14;

    objc_msgSend(v4, "PKSetContaining:forKey:", objc_opt_class(), CFSTR("addressableHandles"));
    v16 = objc_claimAutoreleasedReturnValue();
    addressableHandles = v5->_addressableHandles;
    v5->_addressableHandles = (NSSet *)v16;

    objc_msgSend(v4, "PKSetContaining:forKey:", objc_opt_class(), CFSTR("supportedFeatures"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "pk_setByApplyingBlock:", &__block_literal_global_90);
    v19 = objc_claimAutoreleasedReturnValue();
    supportedFeatures = v5->_supportedFeatures;
    v5->_supportedFeatures = (NSSet *)v19;

    v21 = [PKAccountUserPreferences alloc];
    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("preferences"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[PKAccountUserPreferences initWithDictionary:](v21, "initWithDictionary:", v22);
    preferences = v5->_preferences;
    v5->_preferences = (PKAccountUserPreferences *)v23;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("identityStatus"));
    v25 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (v25 != CFSTR("verified"))
    {
      if (v25)
      {
        v27 = -[__CFString isEqualToString:](v25, "isEqualToString:", CFSTR("verified"));

        if ((v27 & 1) != 0)
          goto LABEL_5;
        v29 = v26;
        if (v29 == CFSTR("notVerified")
          || (v30 = v29,
              v31 = -[__CFString isEqualToString:](v29, "isEqualToString:", CFSTR("notVerified")),
              v30,
              (v31 & 1) != 0))
        {
          v28 = 2;
          goto LABEL_16;
        }
        v32 = v30;
        if (v32 == CFSTR("verificationPending")
          || (v33 = v32,
              v34 = -[__CFString isEqualToString:](v32, "isEqualToString:", CFSTR("verificationPending")),
              v33,
              (v34 & 1) != 0))
        {
          v28 = 3;
          goto LABEL_16;
        }
        v35 = v33;
        if (v35 == CFSTR("notEligible")
          || (v36 = v35,
              v37 = -[__CFString isEqualToString:](v35, "isEqualToString:", CFSTR("notEligible")),
              v36,
              v37))
        {
          v28 = 4;
          goto LABEL_16;
        }
      }
      v28 = 0;
      goto LABEL_16;
    }
LABEL_5:
    v28 = 1;
LABEL_16:

    v5->_identityStatus = v28;
  }

  return v5;
}

PKCreditAccountFeatureDescriptor *__36__PKAccountUser_initWithDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  PKCreditAccountFeatureDescriptor *v3;

  v2 = a2;
  v3 = -[PKCreditAccountFeatureDescriptor initWithDictionary:]([PKCreditAccountFeatureDescriptor alloc], "initWithDictionary:", v2);

  return v3;
}

- (NSPersonNameComponents)nameComponents
{
  id v3;

  if (self->_firstName && self->_lastName)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0CB3850]);
    objc_msgSend(v3, "setGivenName:", self->_firstName);
    objc_msgSend(v3, "setFamilyName:", self->_lastName);
  }
  else
  {
    v3 = 0;
  }
  return (NSPersonNameComponents *)v3;
}

+ (BOOL)currentUser:(id)a3 canShareZone:(id)a4 withAccountUser:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  id v18;
  char v19;
  void *v20;
  void *v21;
  id v22;
  char v23;
  void *v24;
  void *v25;
  id v26;
  char v27;
  BOOL v28;
  void *v30;
  void *v31;
  int v32;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v7, "accountState") == 4
    || !objc_msgSend(v7, "accountState")
    || objc_msgSend(v9, "accountState") == 4
    || !objc_msgSend(v9, "accountState"))
  {
    goto LABEL_29;
  }
  objc_msgSend(v8, "accountIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "accountIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v10;
  v13 = v11;
  if (v12 == v13)
  {

  }
  else
  {
    v14 = v13;
    if (!v12 || !v13)
      goto LABEL_28;
    v15 = objc_msgSend(v12, "isEqualToString:", v13);

    if ((v15 & 1) == 0)
      goto LABEL_29;
  }
  objc_msgSend(v7, "accountIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "accountIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v16;
  v18 = v17;
  if (v12 == v18)
  {

  }
  else
  {
    v14 = v18;
    if (!v12 || !v18)
      goto LABEL_28;
    v19 = objc_msgSend(v12, "isEqualToString:", v18);

    if ((v19 & 1) == 0)
      goto LABEL_29;
  }
  objc_msgSend(v8, "accountIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accountIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v20;
  v22 = v21;
  if (v12 == v22)
  {

  }
  else
  {
    v14 = v22;
    if (!v12 || !v22)
      goto LABEL_28;
    v23 = objc_msgSend(v12, "isEqualToString:", v22);

    if ((v23 & 1) == 0)
      goto LABEL_29;
  }
  objc_msgSend(v8, "originatorAltDSID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "altDSID");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v24;
  v26 = v25;
  if (v12 != v26)
  {
    v14 = v26;
    if (v12 && v26)
    {
      v27 = objc_msgSend(v12, "isEqualToString:", v26);

      if ((v27 & 1) == 0)
        goto LABEL_29;
      goto LABEL_32;
    }
LABEL_28:

    goto LABEL_29;
  }

LABEL_32:
  objc_msgSend(v8, "sharedUsersAltDSIDs");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "altDSID");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v30, "containsObject:", v31);

  if (v32)
  {
    v28 = objc_msgSend(v8, "access") == 1;
    goto LABEL_30;
  }
LABEL_29:
  v28 = 0;
LABEL_30:

  return v28;
}

+ (BOOL)currentUser:(id)a3 shouldRequestZoneShareForZone:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  void *v13;
  BOOL v14;
  uint64_t v16;
  uint64_t v17;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "accountState") == 4 || !objc_msgSend(v5, "accountState"))
    goto LABEL_13;
  objc_msgSend(v6, "accountIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accountIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7;
  v10 = v8;
  if (v9 == v10)
  {

  }
  else
  {
    v11 = v10;
    if (!v9 || !v10)
    {

      goto LABEL_13;
    }
    v12 = objc_msgSend(v9, "isEqualToString:", v10);

    if ((v12 & 1) == 0)
      goto LABEL_13;
  }
  if (objc_msgSend(v6, "access") != 2)
  {
LABEL_13:
    v14 = 0;
    goto LABEL_14;
  }
  v17 = 0;
  objc_msgSend(v6, "zoneName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  +[PKCloudStoreZone zoneValueForZoneName:outZoneType:outAccountIdentifier:altDSID:](PKCloudStoreZone, "zoneValueForZoneName:outZoneType:outAccountIdentifier:altDSID:", v13, &v17, &v16, 0);

  if ((unint64_t)(v17 - 5) >= 2)
  {
    if (v17 == 4)
    {
      v14 = objc_msgSend(v5, "accessLevel") == 1;
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  v14 = (unint64_t)(objc_msgSend(v5, "accessLevel") - 1) < 2;
LABEL_14:

  return v14;
}

- (BOOL)hasHandle:(id)a3
{
  return -[NSSet containsObject:](self->_addressableHandles, "containsObject:", a3);
}

- (BOOL)isEqual:(id)a3
{
  PKAccountUser *v4;
  PKAccountUser *v5;
  BOOL v6;

  v4 = (PKAccountUser *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKAccountUser isEqualToAccountUser:](self, "isEqualToAccountUser:", v5);

  return v6;
}

- (BOOL)isEqualToAccountUser:(id)a3
{
  unsigned __int8 *v4;
  unsigned __int8 *v5;
  NSString *altDSID;
  NSString *v7;
  NSString *firstName;
  NSString *v9;
  NSString *lastName;
  NSString *v11;
  NSString *appleID;
  NSString *v13;
  NSSet *addressableHandles;
  NSSet *v15;
  NSSet *supportedFeatures;
  NSSet *v17;
  NSSet *transactionSourceIdentifiers;
  NSSet *v19;
  NSString *accountIdentifier;
  NSString *v21;
  PKAccountUserPreferences *preferences;
  PKAccountUserPreferences *v23;
  BOOL v24;

  v4 = (unsigned __int8 *)a3;
  v5 = v4;
  if (!v4 || self->_accessLevel != *((_QWORD *)v4 + 2))
    goto LABEL_48;
  altDSID = self->_altDSID;
  v7 = (NSString *)*((_QWORD *)v5 + 3);
  if (altDSID && v7)
  {
    if ((-[NSString isEqual:](altDSID, "isEqual:") & 1) == 0)
      goto LABEL_48;
  }
  else if (altDSID != v7)
  {
    goto LABEL_48;
  }
  if (self->_accountState != *((_QWORD *)v5 + 4)
    || self->_currentUser != v5[8]
    || self->_identityStatus != *((_QWORD *)v5 + 9))
  {
    goto LABEL_48;
  }
  firstName = self->_firstName;
  v9 = (NSString *)*((_QWORD *)v5 + 14);
  if (firstName && v9)
  {
    if ((-[NSString isEqual:](firstName, "isEqual:") & 1) == 0)
      goto LABEL_48;
  }
  else if (firstName != v9)
  {
    goto LABEL_48;
  }
  lastName = self->_lastName;
  v11 = (NSString *)*((_QWORD *)v5 + 15);
  if (lastName && v11)
  {
    if ((-[NSString isEqual:](lastName, "isEqual:") & 1) == 0)
      goto LABEL_48;
  }
  else if (lastName != v11)
  {
    goto LABEL_48;
  }
  appleID = self->_appleID;
  v13 = (NSString *)*((_QWORD *)v5 + 5);
  if (appleID && v13)
  {
    if ((-[NSString isEqual:](appleID, "isEqual:") & 1) == 0)
      goto LABEL_48;
  }
  else if (appleID != v13)
  {
    goto LABEL_48;
  }
  addressableHandles = self->_addressableHandles;
  v15 = (NSSet *)*((_QWORD *)v5 + 6);
  if (addressableHandles && v15)
  {
    if ((-[NSSet isEqual:](addressableHandles, "isEqual:") & 1) == 0)
      goto LABEL_48;
  }
  else if (addressableHandles != v15)
  {
    goto LABEL_48;
  }
  supportedFeatures = self->_supportedFeatures;
  v17 = (NSSet *)*((_QWORD *)v5 + 7);
  if (supportedFeatures && v17)
  {
    if ((-[NSSet isEqual:](supportedFeatures, "isEqual:") & 1) == 0)
      goto LABEL_48;
  }
  else if (supportedFeatures != v17)
  {
    goto LABEL_48;
  }
  transactionSourceIdentifiers = self->_transactionSourceIdentifiers;
  v19 = (NSSet *)*((_QWORD *)v5 + 11);
  if (transactionSourceIdentifiers && v19)
  {
    if ((-[NSSet isEqual:](transactionSourceIdentifiers, "isEqual:") & 1) == 0)
      goto LABEL_48;
  }
  else if (transactionSourceIdentifiers != v19)
  {
    goto LABEL_48;
  }
  accountIdentifier = self->_accountIdentifier;
  v21 = (NSString *)*((_QWORD *)v5 + 12);
  if (!accountIdentifier || !v21)
  {
    if (accountIdentifier == v21)
      goto LABEL_44;
LABEL_48:
    v24 = 0;
    goto LABEL_49;
  }
  if ((-[NSString isEqual:](accountIdentifier, "isEqual:") & 1) == 0)
    goto LABEL_48;
LABEL_44:
  preferences = self->_preferences;
  v23 = (PKAccountUserPreferences *)*((_QWORD *)v5 + 8);
  if (preferences && v23)
    v24 = -[PKAccountUserPreferences isEqual:](preferences, "isEqual:");
  else
    v24 = preferences == v23;
LABEL_49:

  return v24;
}

- (unint64_t)hash
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_altDSID);
  objc_msgSend(v3, "safelyAddObject:", self->_firstName);
  objc_msgSend(v3, "safelyAddObject:", self->_lastName);
  objc_msgSend(v3, "safelyAddObject:", self->_supportedFeatures);
  objc_msgSend(v3, "safelyAddObject:", self->_transactionSourceIdentifiers);
  objc_msgSend(v3, "safelyAddObject:", self->_accountIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_addressableHandles);
  objc_msgSend(v3, "safelyAddObject:", self->_appleID);
  objc_msgSend(v3, "safelyAddObject:", self->_preferences);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_accessLevel - v4 + 32 * v4;
  v6 = self->_accountState - v5 + 32 * v5;
  v7 = self->_currentUser - v6 + 32 * v6;
  v8 = self->_identityStatus - v7 + 32 * v7;

  return v8;
}

- (id)description
{
  void *v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  unint64_t identityStatus;
  const __CFString *v8;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("<%@: %p; "),
                 objc_opt_class(),
                 self);
  objc_msgSend(v3, "appendFormat:", CFSTR("altDSID: '%@'; "), self->_altDSID);
  if (self->_currentUser)
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("isCurrentUser: '%@'; "), v4);
  PKAccountAccessLevelToString(self->_accessLevel);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("accessLevel: '%@'; "), v5);

  PKAccountStateToString(self->_accountState);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("state: '%@'; "), v6);

  objc_msgSend(v3, "appendFormat:", CFSTR("firstName: '%@'; "), self->_firstName);
  objc_msgSend(v3, "appendFormat:", CFSTR("lastName: '%@'; "), self->_lastName);
  objc_msgSend(v3, "appendFormat:", CFSTR("appleID: '%@'; "), self->_appleID);
  identityStatus = self->_identityStatus;
  if (identityStatus > 4)
    v8 = CFSTR("unknown");
  else
    v8 = off_1E2ACBE20[identityStatus];
  objc_msgSend(v3, "appendFormat:", CFSTR("identityStatus: '%@'; "), v8);
  objc_msgSend(v3, "appendFormat:", CFSTR("supportedFeatures: '%@'; "), self->_supportedFeatures);
  objc_msgSend(v3, "appendFormat:", CFSTR("accountIdentifier: '%@'; "), self->_accountIdentifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("transactionSourceIdentifiers: '%@'; "), self->_transactionSourceIdentifiers);
  objc_msgSend(v3, "appendFormat:", CFSTR("preferences: '%@'; "), self->_preferences);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountUser)initWithCoder:(id)a3
{
  id v4;
  PKAccountUser *v5;
  uint64_t v6;
  NSString *altDSID;
  uint64_t v8;
  NSString *firstName;
  uint64_t v10;
  NSString *lastName;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSSet *supportedFeatures;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSSet *transactionSourceIdentifiers;
  uint64_t v22;
  NSString *accountIdentifier;
  uint64_t v24;
  NSString *appleID;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  NSSet *addressableHandles;
  uint64_t v31;
  PKAccountUserPreferences *preferences;
  uint64_t v33;
  PKAccountUserNotificationSettings *notificationSettings;
  objc_super v36;

  v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)PKAccountUser;
  v5 = -[PKAccountUser init](&v36, sel_init);
  if (v5)
  {
    v5->_accessLevel = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("accessLevel"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("altDSID"));
    v6 = objc_claimAutoreleasedReturnValue();
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v6;

    v5->_accountState = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("state"));
    v5->_currentUser = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("currentUser")) != 0;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("firstName"));
    v8 = objc_claimAutoreleasedReturnValue();
    firstName = v5->_firstName;
    v5->_firstName = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastName"));
    v10 = objc_claimAutoreleasedReturnValue();
    lastName = v5->_lastName;
    v5->_lastName = (NSString *)v10;

    v12 = (void *)MEMORY[0x1E0C99E60];
    v13 = objc_opt_class();
    objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("supportedFeatures"));
    v15 = objc_claimAutoreleasedReturnValue();
    supportedFeatures = v5->_supportedFeatures;
    v5->_supportedFeatures = (NSSet *)v15;

    v17 = (void *)MEMORY[0x1E0C99E60];
    v18 = objc_opt_class();
    objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v19, CFSTR("transactionSourceIdentifier"));
    v20 = objc_claimAutoreleasedReturnValue();
    transactionSourceIdentifiers = v5->_transactionSourceIdentifiers;
    v5->_transactionSourceIdentifiers = (NSSet *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountIdentifier"));
    v22 = objc_claimAutoreleasedReturnValue();
    accountIdentifier = v5->_accountIdentifier;
    v5->_accountIdentifier = (NSString *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appleID"));
    v24 = objc_claimAutoreleasedReturnValue();
    appleID = v5->_appleID;
    v5->_appleID = (NSString *)v24;

    v26 = (void *)MEMORY[0x1E0C99E60];
    v27 = objc_opt_class();
    objc_msgSend(v26, "setWithObjects:", v27, objc_opt_class(), 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v28, CFSTR("addressableHandles"));
    v29 = objc_claimAutoreleasedReturnValue();
    addressableHandles = v5->_addressableHandles;
    v5->_addressableHandles = (NSSet *)v29;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("preferences"));
    v31 = objc_claimAutoreleasedReturnValue();
    preferences = v5->_preferences;
    v5->_preferences = (PKAccountUserPreferences *)v31;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("notificationSettings"));
    v33 = objc_claimAutoreleasedReturnValue();
    notificationSettings = v5->_notificationSettings;
    v5->_notificationSettings = (PKAccountUserNotificationSettings *)v33;

    v5->_identityStatus = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("identityStatus"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t accessLevel;
  id v5;

  accessLevel = self->_accessLevel;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", accessLevel, CFSTR("accessLevel"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_altDSID, CFSTR("altDSID"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_accountState, CFSTR("state"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_currentUser, CFSTR("currentUser"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_firstName, CFSTR("firstName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastName, CFSTR("lastName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_supportedFeatures, CFSTR("supportedFeatures"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_transactionSourceIdentifiers, CFSTR("transactionSourceIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_accountIdentifier, CFSTR("accountIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_appleID, CFSTR("appleID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_addressableHandles, CFSTR("addressableHandles"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_preferences, CFSTR("preferences"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_notificationSettings, CFSTR("notificationSettings"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_identityStatus, CFSTR("identityStatus"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  PKAccountUser *v5;
  uint64_t v6;
  NSString *altDSID;
  uint64_t v8;
  NSString *firstName;
  uint64_t v10;
  NSString *lastName;
  uint64_t v12;
  NSSet *supportedFeatures;
  uint64_t v14;
  NSSet *transactionSourceIdentifiers;
  uint64_t v16;
  NSString *accountIdentifier;
  uint64_t v18;
  NSString *appleID;
  uint64_t v20;
  NSSet *addressableHandles;
  PKAccountUserPreferences *v22;
  PKAccountUserPreferences *preferences;

  v5 = -[PKAccountUser init](+[PKAccountUser allocWithZone:](PKAccountUser, "allocWithZone:"), "init");
  v5->_accessLevel = self->_accessLevel;
  v6 = -[NSString copyWithZone:](self->_altDSID, "copyWithZone:", a3);
  altDSID = v5->_altDSID;
  v5->_altDSID = (NSString *)v6;

  v5->_accountState = self->_accountState;
  v5->_currentUser = self->_currentUser;
  v5->_identityStatus = self->_identityStatus;
  v8 = -[NSString copyWithZone:](self->_firstName, "copyWithZone:", a3);
  firstName = v5->_firstName;
  v5->_firstName = (NSString *)v8;

  v10 = -[NSString copyWithZone:](self->_lastName, "copyWithZone:", a3);
  lastName = v5->_lastName;
  v5->_lastName = (NSString *)v10;

  v12 = -[NSSet copyWithZone:](self->_supportedFeatures, "copyWithZone:", a3);
  supportedFeatures = v5->_supportedFeatures;
  v5->_supportedFeatures = (NSSet *)v12;

  v14 = -[NSSet copyWithZone:](self->_transactionSourceIdentifiers, "copyWithZone:", a3);
  transactionSourceIdentifiers = v5->_transactionSourceIdentifiers;
  v5->_transactionSourceIdentifiers = (NSSet *)v14;

  v16 = -[NSString copyWithZone:](self->_accountIdentifier, "copyWithZone:", a3);
  accountIdentifier = v5->_accountIdentifier;
  v5->_accountIdentifier = (NSString *)v16;

  v18 = -[NSString copyWithZone:](self->_appleID, "copyWithZone:", a3);
  appleID = v5->_appleID;
  v5->_appleID = (NSString *)v18;

  v20 = -[NSSet copyWithZone:](self->_addressableHandles, "copyWithZone:", a3);
  addressableHandles = v5->_addressableHandles;
  v5->_addressableHandles = (NSSet *)v20;

  v22 = -[PKAccountUserPreferences copyWithZone:](self->_preferences, "copyWithZone:", a3);
  preferences = v5->_preferences;
  v5->_preferences = v22;

  return v5;
}

- (unint64_t)accessLevel
{
  return self->_accessLevel;
}

- (void)setAccessLevel:(unint64_t)a3
{
  self->_accessLevel = a3;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (unint64_t)accountState
{
  return self->_accountState;
}

- (void)setAccountState:(unint64_t)a3
{
  self->_accountState = a3;
}

- (NSString)appleID
{
  return self->_appleID;
}

- (void)setAppleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)isCurrentUser
{
  return self->_currentUser;
}

- (void)setCurrentUser:(BOOL)a3
{
  self->_currentUser = a3;
}

- (NSSet)addressableHandles
{
  return self->_addressableHandles;
}

- (void)setAddressableHandles:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSSet)supportedFeatures
{
  return self->_supportedFeatures;
}

- (void)setSupportedFeatures:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (PKAccountUserPreferences)preferences
{
  return self->_preferences;
}

- (void)setPreferences:(id)a3
{
  objc_storeStrong((id *)&self->_preferences, a3);
}

- (unint64_t)identityStatus
{
  return self->_identityStatus;
}

- (void)setIdentityStatus:(unint64_t)a3
{
  self->_identityStatus = a3;
}

- (BOOL)isDirty
{
  return self->_dirty;
}

- (void)setDirty:(BOOL)a3
{
  self->_dirty = a3;
}

- (NSDate)lastUpdated
{
  return self->_lastUpdated;
}

- (void)setLastUpdated:(id)a3
{
  objc_storeStrong((id *)&self->_lastUpdated, a3);
}

- (NSSet)transactionSourceIdentifiers
{
  return self->_transactionSourceIdentifiers;
}

- (void)setTransactionSourceIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (PKAccountUserNotificationSettings)notificationSettings
{
  return self->_notificationSettings;
}

- (void)setNotificationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_notificationSettings, a3);
}

- (NSString)firstName
{
  return self->_firstName;
}

- (void)setFirstName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)lastName
{
  return self->_lastName;
}

- (void)setLastName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_notificationSettings, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_transactionSourceIdentifiers, 0);
  objc_storeStrong((id *)&self->_lastUpdated, 0);
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong((id *)&self->_supportedFeatures, 0);
  objc_storeStrong((id *)&self->_addressableHandles, 0);
  objc_storeStrong((id *)&self->_appleID, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
}

- (BOOL)supportsRequestPhysicalCard
{
  void *v2;
  BOOL v3;

  -[PKAccountUser requestPhysicalCardFeatureDescriptor](self, "requestPhysicalCardFeatureDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)requestPhysicalCardFeatureDescriptor
{
  return -[PKAccountUser _featureWithIdentifier:](self, "_featureWithIdentifier:", CFSTR("requestPhysicalCard"));
}

- (BOOL)supportsMonthlySpendLimit
{
  void *v2;
  BOOL v3;

  -[PKAccountUser monthlySpendLimitFeatureDescriptor](self, "monthlySpendLimitFeatureDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)monthlySpendLimitFeatureDescriptor
{
  return -[PKAccountUser _featureWithIdentifier:](self, "_featureWithIdentifier:", CFSTR("monthlySpendLimit"));
}

- (BOOL)supportsPhysicalCardActivation
{
  void *v2;
  BOOL v3;

  -[PKAccountUser physicalCardActivationFeatureDescriptor](self, "physicalCardActivationFeatureDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)physicalCardActivationFeatureDescriptor
{
  return -[PKAccountUser _featureWithIdentifier:](self, "_featureWithIdentifier:", CFSTR("physicalCardActivation"));
}

- (id)_featureWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[PKAccountUser supportedFeatures](self, "supportedFeatures", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if (v11)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

@end
