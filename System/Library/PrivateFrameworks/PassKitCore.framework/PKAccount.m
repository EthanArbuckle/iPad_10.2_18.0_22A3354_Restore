@implementation PKAccount

- (PKAccount)initWithDictionary:(id)a3
{
  return -[PKAccount initWithDictionary:isCloudAccount:](self, "initWithDictionary:isCloudAccount:", a3, 0);
}

- (PKAccount)initWithDictionary:(id)a3 isCloudAccount:(BOOL)a4
{
  id v6;
  PKAccount *v7;
  uint64_t v8;
  NSString *accountIdentifier;
  uint64_t v10;
  NSURL *accountBaseURL;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  NSURL *applyServiceURL;
  uint64_t v17;
  NSURL *paymentServicesBaseURL;
  void *v19;
  PKAccountDetails *v20;
  void *v21;
  unint64_t type;
  uint64_t v23;
  PKAccountDetails *details;
  void *v25;
  id v26;
  uint64_t v27;
  NSObject *v28;
  NSString *v29;
  PKAccount *v30;
  void *v31;
  uint64_t v32;
  NSString *altDSID;
  uint64_t v34;
  NSSet *previousAccountIdentifiers;
  void *v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t i;
  unint64_t v43;
  uint64_t v44;
  id v45;
  void *v46;
  uint64_t v47;
  NSSet *supportedFeatures;
  PKAccountAdditionalPushTopics *v49;
  void *v50;
  uint64_t v51;
  PKAccountAdditionalPushTopics *additionalPushTopics;
  PKAccountFetchPeriods *v53;
  void *v54;
  uint64_t v55;
  PKAccountFetchPeriods *fetchPeriods;
  void *v57;
  uint64_t v58;
  NSArray *cloudStoreZoneNames;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  objc_super v65;
  uint8_t v66[128];
  uint8_t buf[4];
  NSString *v68;
  __int16 v69;
  NSObject *v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v65.receiver = self;
  v65.super_class = (Class)PKAccount;
  v7 = -[PKAccount init](&v65, sel_init);
  if (!v7)
    goto LABEL_61;
  objc_msgSend(v6, "PKStringForKey:", CFSTR("accountIdentifier"));
  v8 = objc_claimAutoreleasedReturnValue();
  accountIdentifier = v7->_accountIdentifier;
  v7->_accountIdentifier = (NSString *)v8;

  if (-[NSString length](v7->_accountIdentifier, "length"))
  {
    objc_msgSend(v6, "PKURLForKey:", CFSTR("accountBaseURL"));
    v10 = objc_claimAutoreleasedReturnValue();
    accountBaseURL = v7->_accountBaseURL;
    v7->_accountBaseURL = (NSURL *)v10;

    v7->_isCloudAccount = a4;
    if (!v7->_accountBaseURL && !a4)
    {
      PKLogFacilityTypeGetObject(0xEuLL);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v13 = "Error: Account baseURL missing for non-cloud account";
LABEL_9:
        _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, v13, buf, 2u);
        goto LABEL_19;
      }
      goto LABEL_19;
    }
    objc_msgSend(v6, "PKStringForKey:", CFSTR("featureIdentifier"));
    v12 = objc_claimAutoreleasedReturnValue();
    v14 = PKFeatureIdentifierFromString(v12);
    v7->_feature = v14;
    if (!v14)
    {
      PKLogFacilityTypeGetObject(0xEuLL);
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        v29 = v7->_accountIdentifier;
        *(_DWORD *)buf = 138412546;
        v68 = v29;
        v69 = 2112;
        v70 = v12;
        _os_log_impl(&dword_18FC92000, v28, OS_LOG_TYPE_DEFAULT, "Error: Unknown feature identifier for account: %@ feature:%@", buf, 0x16u);
      }

      goto LABEL_19;
    }
    objc_msgSend(v6, "PKURLForKey:", CFSTR("applyServiceURL"));
    v15 = objc_claimAutoreleasedReturnValue();
    applyServiceURL = v7->_applyServiceURL;
    v7->_applyServiceURL = (NSURL *)v15;

    objc_msgSend(v6, "PKURLForKey:", CFSTR("paymentServicesBaseURL"));
    v17 = objc_claimAutoreleasedReturnValue();
    paymentServicesBaseURL = v7->_paymentServicesBaseURL;
    v7->_paymentServicesBaseURL = (NSURL *)v17;

    objc_msgSend(v6, "PKStringForKey:", CFSTR("accountType"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_type = PKAccountTypeFromString(v19);

    v20 = [PKAccountDetails alloc];
    objc_msgSend(v6, "PKDictionaryForKey:", CFSTR("accountDetails"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7->_type - 1 >= 4)
      type = 0;
    else
      type = v7->_type;
    v23 = -[PKAccountDetails initWithDictionary:type:](v20, "initWithDictionary:type:", v21, type);
    details = v7->_details;
    v7->_details = (PKAccountDetails *)v23;

    objc_msgSend(v6, "PKStringForKey:", CFSTR("state"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_state = PKAccountStateFromString(v25);

    objc_msgSend(v6, "PKStringForKey:", CFSTR("stateReason"));
    v26 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v26, "isEqualToString:", CFSTR("delinquent")) & 1) != 0)
    {
      v27 = 1;
    }
    else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("hardship")) & 1) != 0)
    {
      v27 = 3;
    }
    else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("disasterRecovery")) & 1) != 0)
    {
      v27 = 2;
    }
    else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("termsOfUseViolation")) & 1) != 0)
    {
      v27 = 4;
    }
    else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("fraudSuspected")) & 1) != 0)
    {
      v27 = 5;
    }
    else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("fraudConfirmed")) & 1) != 0)
    {
      v27 = 6;
    }
    else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("fraudConfirmedCustomer")) & 1) != 0)
    {
      v27 = 7;
    }
    else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("chargedOff")) & 1) != 0)
    {
      v27 = 8;
    }
    else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("securityDowngrade")) & 1) != 0)
    {
      v27 = 9;
    }
    else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("embargoRecovery")) & 1) != 0)
    {
      v27 = 10;
    }
    else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("mergeComplete")) & 1) != 0)
    {
      v27 = 12;
    }
    else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("merging")) & 1) != 0)
    {
      v27 = 11;
    }
    else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("removed")) & 1) != 0)
    {
      v27 = 13;
    }
    else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("mergeInitiated")) & 1) != 0)
    {
      v27 = 14;
    }
    else if (objc_msgSend(v26, "isEqualToString:", CFSTR("bankruptcy")))
    {
      v27 = 15;
    }
    else
    {
      v27 = 0;
    }

    v7->_stateReason = v27;
    objc_msgSend(v6, "PKStringForKey:", CFSTR("accessLevel"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_accessLevel = PKAccountAccessLevelFromString(v31);

    v7->_blockAllAccountAccess = objc_msgSend(v6, "PKBoolForKey:", CFSTR("blockAllAccountAccess"));
    v7->_blockNotifications = objc_msgSend(v6, "PKBoolForKey:", CFSTR("blockNotifications"));
    objc_msgSend(v6, "PKStringForKey:", CFSTR("altDSID"));
    v32 = objc_claimAutoreleasedReturnValue();
    altDSID = v7->_altDSID;
    v7->_altDSID = (NSString *)v32;

    v7->_sharedAccount = objc_msgSend(v6, "PKBoolForKey:", CFSTR("isSharedAccount"));
    objc_msgSend(v6, "PKSetContaining:forKey:", objc_opt_class(), CFSTR("previousAccountIdentifiers"));
    v34 = objc_claimAutoreleasedReturnValue();
    previousAccountIdentifiers = v7->_previousAccountIdentifiers;
    v7->_previousAccountIdentifiers = (NSSet *)v34;

    objc_msgSend(v6, "PKSetForKey:", CFSTR("supportedFeatures"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    v64 = 0u;
    v38 = v36;
    v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v61, v66, 16);
    if (v39)
    {
      v40 = v39;
      v41 = *(_QWORD *)v62;
      do
      {
        for (i = 0; i != v40; ++i)
        {
          if (*(_QWORD *)v62 != v41)
            objc_enumerationMutation(v38);
          v43 = v7->_type - 1;
          if (v43 <= 3)
          {
            v44 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * i);
            v45 = objc_alloc(*off_1E2AC4C90[v43]);
            v46 = (void *)objc_msgSend(v45, "initWithDictionary:", v44, (_QWORD)v61);
            objc_msgSend(v37, "addObject:", v46);

          }
        }
        v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v61, v66, 16);
      }
      while (v40);
    }

    v47 = objc_msgSend(v37, "copy");
    supportedFeatures = v7->_supportedFeatures;
    v7->_supportedFeatures = (NSSet *)v47;

    v49 = [PKAccountAdditionalPushTopics alloc];
    objc_msgSend(v6, "PKDictionaryForKey:", CFSTR("additionalPushTopics"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = -[PKAccountAdditionalPushTopics initWithDictionary:](v49, "initWithDictionary:", v50);
    additionalPushTopics = v7->_additionalPushTopics;
    v7->_additionalPushTopics = (PKAccountAdditionalPushTopics *)v51;

    v53 = [PKAccountFetchPeriods alloc];
    objc_msgSend(v6, "PKDictionaryForKey:", CFSTR("proactiveFetchPeriods"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = -[PKAccountFetchPeriods initWithDictionary:](v53, "initWithDictionary:", v54);
    fetchPeriods = v7->_fetchPeriods;
    v7->_fetchPeriods = (PKAccountFetchPeriods *)v55;

    objc_msgSend(v6, "PKDictionaryForKey:", CFSTR("extendedAccountDetails"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    if (v57)
      -[PKAccountDetails ingestExtendedAccountDetails:](v7->_details, "ingestExtendedAccountDetails:", v57);
    objc_msgSend(v6, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("cloudStoreZoneNames"));
    v58 = objc_claimAutoreleasedReturnValue();
    cloudStoreZoneNames = v7->_cloudStoreZoneNames;
    v7->_cloudStoreZoneNames = (NSArray *)v58;

LABEL_61:
    v30 = v7;
    goto LABEL_62;
  }
  PKLogFacilityTypeGetObject(0xEuLL);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    v13 = "Error: Account identifier missing";
    goto LABEL_9;
  }
LABEL_19:

  v30 = 0;
LABEL_62:

  return v30;
}

- (id)associatedPassUniqueID
{
  void *v3;
  unint64_t type;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;

  v3 = 0;
  type = self->_type;
  switch(type)
  {
    case 3uLL:
      goto LABEL_11;
    case 2uLL:
      -[PKAccount payLaterDetails](self, "payLaterDetails");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9)
      {
        objc_msgSend(v9, "associatedPassTypeIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "associatedPassSerialNumber");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        PKGeneratePassUniqueID(v11, v12);
        v3 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v3 = 0;
      }

LABEL_11:
      -[PKAccount appleBalanceDetails](self, "appleBalanceDetails");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v13;
      if (v13)
      {
        objc_msgSend(v13, "associatedPassTypeIdentifier");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "associatedPassSerialNumber");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        PKGeneratePassUniqueID(v7, v8);
        v14 = objc_claimAutoreleasedReturnValue();

        v3 = (void *)v14;
        goto LABEL_13;
      }
LABEL_14:

      return v3;
    case 1uLL:
      -[PKAccount creditDetails](self, "creditDetails");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      if (v5)
      {
        objc_msgSend(v5, "associatedPassTypeIdentifier");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "associatedPassSerialNumber");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        PKGeneratePassUniqueID(v7, v8);
        v3 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:

        goto LABEL_14;
      }
      v3 = 0;
      goto LABEL_14;
  }
  return v3;
}

- (id)createdDate
{
  void *v2;
  void *v3;
  void *v4;

  switch(self->_type)
  {
    case 1uLL:
      -[PKAccount creditDetails](self, "creditDetails");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 2uLL:
      -[PKAccount payLaterDetails](self, "payLaterDetails");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 3uLL:
      -[PKAccount appleBalanceDetails](self, "appleBalanceDetails");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 4uLL:
      -[PKAccount savingsDetails](self, "savingsDetails");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
      v4 = v2;
      objc_msgSend(v2, "createdDate");
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      v3 = 0;
      break;
  }
  return v3;
}

- (id)productTimeZone
{
  unint64_t type;
  void *v3;
  void *v4;
  void *v5;

  type = self->_type;
  if (type == 4)
  {
    -[PKAccount savingsDetails](self, "savingsDetails");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (type != 1)
    {
      v5 = 0;
      return v5;
    }
    -[PKAccount creditDetails](self, "creditDetails");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;
  objc_msgSend(v3, "productTimeZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (PKCreditAccountDetails)creditDetails
{
  return -[PKAccountDetails creditDetails](self->_details, "creditDetails");
}

- (PKPayLaterAccountDetails)payLaterDetails
{
  return -[PKAccountDetails payLaterDetails](self->_details, "payLaterDetails");
}

- (PKAppleBalanceAccountDetails)appleBalanceDetails
{
  return -[PKAccountDetails appleBalanceDetails](self->_details, "appleBalanceDetails");
}

- (PKSavingsAccountDetails)savingsDetails
{
  return -[PKAccountDetails savingsDetails](self->_details, "savingsDetails");
}

- (id)analyticsEventAccountType
{
  __CFString **v2;
  unint64_t accessLevel;

  if (self->_coOwner)
  {
    v2 = PKAnalyticsReportEventTypeAccountTypeCoOwner;
  }
  else
  {
    accessLevel = self->_accessLevel;
    if (accessLevel == 1)
    {
      v2 = PKAnalyticsReportEventTypeAccountTypePrimary;
    }
    else
    {
      if (accessLevel != 2)
        return 0;
      v2 = PKAnalyticsReportEventTypeAccountTypeParticipant;
    }
  }
  return *v2;
}

+ (id)analyticsAccountTypeForAccount:(id)a3
{
  __CFString *v3;

  if (a3)
  {
    objc_msgSend(a3, "analyticsEventAccountType");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = CFSTR("new");
  }
  return v3;
}

- (NSSet)allAccountIdentifiers
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v4 = v3;
  if (self->_accountIdentifier)
    objc_msgSend(v3, "addObject:");
  if (-[NSSet count](self->_previousAccountIdentifiers, "count"))
    objc_msgSend(v4, "unionSet:", self->_previousAccountIdentifiers);
  v5 = (void *)objc_msgSend(v4, "copy");

  return (NSSet *)v5;
}

- (id)updateUserInfoBaseURL
{
  void *applyServiceURL;

  applyServiceURL = self->_applyServiceURL;
  if (applyServiceURL)
  {
    objc_msgSend(applyServiceURL, "URLByAppendingPathComponent:", CFSTR("updateUserInfo"));
    applyServiceURL = (void *)objc_claimAutoreleasedReturnValue();
  }
  return applyServiceURL;
}

- (BOOL)supportsStandaloneTransactions
{
  return self->_type == 4 && self->_state - 1 < 3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccount)initWithCoder:(id)a3
{
  id v4;
  PKAccount *v5;
  uint64_t v6;
  NSString *accountIdentifier;
  uint64_t v8;
  NSURL *accountBaseURL;
  uint64_t v10;
  NSURL *applyServiceURL;
  uint64_t v12;
  NSURL *paymentServicesBaseURL;
  uint64_t v14;
  NSString *altDSID;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSSet *previousAccountIdentifiers;
  uint64_t v21;
  NSDate *lastUpdated;
  uint64_t v23;
  PKAccountDetails *details;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  NSSet *supportedFeatures;
  uint64_t v30;
  PKAccountAdditionalPushTopics *additionalPushTopics;
  uint64_t v32;
  PKAccountFetchPeriods *fetchPeriods;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  NSArray *cloudStoreZoneNames;
  uint64_t v39;
  NSString *transactionSourceIdentifier;
  objc_super v42;
  _QWORD v43[3];

  v43[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)PKAccount;
  v5 = -[PKAccount init](&v42, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    accountIdentifier = v5->_accountIdentifier;
    v5->_accountIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountBaseURL"));
    v8 = objc_claimAutoreleasedReturnValue();
    accountBaseURL = v5->_accountBaseURL;
    v5->_accountBaseURL = (NSURL *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("applyServiceURL"));
    v10 = objc_claimAutoreleasedReturnValue();
    applyServiceURL = v5->_applyServiceURL;
    v5->_applyServiceURL = (NSURL *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("paymentServicesBaseURL"));
    v12 = objc_claimAutoreleasedReturnValue();
    paymentServicesBaseURL = v5->_paymentServicesBaseURL;
    v5->_paymentServicesBaseURL = (NSURL *)v12;

    v5->_feature = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("feature"));
    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("accountType"));
    v5->_state = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("state"));
    v5->_stateReason = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("stateReason"));
    v5->_accessLevel = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("accessLevel"));
    v5->_blockAllAccountAccess = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("blockAllAccountAccess"));
    v5->_blockNotifications = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("blockNotifications"));
    v5->_isCloudAccount = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isCloudAccount"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("altDSID"));
    v14 = objc_claimAutoreleasedReturnValue();
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v14;

    v5->_coOwner = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("coOwner"));
    v5->_sharedAccount = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isSharedAccount"));
    v16 = objc_alloc(MEMORY[0x1E0C99E60]);
    v17 = objc_opt_class();
    v18 = (void *)objc_msgSend(v16, "initWithObjects:", v17, objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("previousAccountIdentifiers"));
    v19 = objc_claimAutoreleasedReturnValue();
    previousAccountIdentifiers = v5->_previousAccountIdentifiers;
    v5->_previousAccountIdentifiers = (NSSet *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastUpdated"));
    v21 = objc_claimAutoreleasedReturnValue();
    lastUpdated = v5->_lastUpdated;
    v5->_lastUpdated = (NSDate *)v21;

    switch(v5->_type)
    {
      case 1uLL:
      case 2uLL:
      case 3uLL:
      case 4uLL:
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountDetails"));
        v23 = objc_claimAutoreleasedReturnValue();
        details = v5->_details;
        v5->_details = (PKAccountDetails *)v23;

        v25 = (void *)MEMORY[0x1E0C99E60];
        v26 = objc_opt_class();
        objc_msgSend(v25, "setWithObjects:", v26, objc_opt_class(), 0);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v27, CFSTR("supportedFeatures"));
        v28 = objc_claimAutoreleasedReturnValue();
        supportedFeatures = v5->_supportedFeatures;
        v5->_supportedFeatures = (NSSet *)v28;

        break;
      default:
        break;
    }
    v5->_accountStateDirty = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("accountStateDirty"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("additionalPushTopics"));
    v30 = objc_claimAutoreleasedReturnValue();
    additionalPushTopics = v5->_additionalPushTopics;
    v5->_additionalPushTopics = (PKAccountAdditionalPushTopics *)v30;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("proactiveFetchPeriods"));
    v32 = objc_claimAutoreleasedReturnValue();
    fetchPeriods = v5->_fetchPeriods;
    v5->_fetchPeriods = (PKAccountFetchPeriods *)v32;

    v34 = (void *)MEMORY[0x1E0C99E60];
    v43[0] = objc_opt_class();
    v43[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 2);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setWithArray:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v36, CFSTR("cloudStoreZoneNames"));
    v37 = objc_claimAutoreleasedReturnValue();
    cloudStoreZoneNames = v5->_cloudStoreZoneNames;
    v5->_cloudStoreZoneNames = (NSArray *)v37;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transactionSourceIdentifier"));
    v39 = objc_claimAutoreleasedReturnValue();
    transactionSourceIdentifier = v5->_transactionSourceIdentifier;
    v5->_transactionSourceIdentifier = (NSString *)v39;

  }
  return v5;
}

- (NSArray)cloudStoreZoneNames
{
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  if (-[NSArray count](self->_cloudStoreZoneNames, "count"))
    return self->_cloudStoreZoneNames;
  v4[0] = CFSTR("transactions");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)encodeWithCoder:(id)a3
{
  NSString *accountIdentifier;
  id v5;

  accountIdentifier = self->_accountIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", accountIdentifier, CFSTR("accountIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_accountBaseURL, CFSTR("accountBaseURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_applyServiceURL, CFSTR("applyServiceURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_paymentServicesBaseURL, CFSTR("paymentServicesBaseURL"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_feature, CFSTR("feature"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_type, CFSTR("accountType"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_state, CFSTR("state"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_stateReason, CFSTR("stateReason"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_blockAllAccountAccess, CFSTR("blockAllAccountAccess"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_blockNotifications, CFSTR("blockNotifications"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isCloudAccount, CFSTR("isCloudAccount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_altDSID, CFSTR("altDSID"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_coOwner, CFSTR("coOwner"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_sharedAccount, CFSTR("isSharedAccount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_previousAccountIdentifiers, CFSTR("previousAccountIdentifiers"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_accessLevel, CFSTR("accessLevel"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastUpdated, CFSTR("lastUpdated"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_details, CFSTR("accountDetails"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_supportedFeatures, CFSTR("supportedFeatures"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_accountStateDirty, CFSTR("accountStateDirty"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_additionalPushTopics, CFSTR("additionalPushTopics"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_fetchPeriods, CFSTR("proactiveFetchPeriods"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_cloudStoreZoneNames, CFSTR("cloudStoreZoneNames"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_transactionSourceIdentifier, CFSTR("transactionSourceIdentifier"));

}

- (BOOL)isContentEqualToAccount:(id)a3
{
  _QWORD *v4;
  NSString *accountIdentifier;
  NSString *v6;
  BOOL v7;
  NSURL *accountBaseURL;
  NSURL *v9;
  NSURL *applyServiceURL;
  NSURL *v11;
  NSURL *paymentServicesBaseURL;
  NSURL *v13;
  PKAccountDetails *details;
  PKAccountDetails *v15;
  NSString *altDSID;
  NSString *v17;
  NSSet *previousAccountIdentifiers;
  NSSet *v19;
  NSSet *supportedFeatures;
  NSSet *v21;
  PKAccountAdditionalPushTopics *additionalPushTopics;
  PKAccountAdditionalPushTopics *v23;
  PKAccountFetchPeriods *fetchPeriods;
  PKAccountFetchPeriods *v25;
  BOOL v26;

  v4 = a3;
  if (!v4)
    goto LABEL_63;
  accountIdentifier = self->_accountIdentifier;
  v6 = (NSString *)v4[2];
  if (accountIdentifier)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    if (accountIdentifier != v6)
      goto LABEL_63;
  }
  else if ((-[NSString isEqual:](accountIdentifier, "isEqual:") & 1) == 0)
  {
    goto LABEL_63;
  }
  accountBaseURL = self->_accountBaseURL;
  v9 = (NSURL *)v4[3];
  if (accountBaseURL && v9)
  {
    if ((-[NSURL isEqual:](accountBaseURL, "isEqual:") & 1) == 0)
      goto LABEL_63;
  }
  else if (accountBaseURL != v9)
  {
    goto LABEL_63;
  }
  applyServiceURL = self->_applyServiceURL;
  v11 = (NSURL *)v4[5];
  if (applyServiceURL && v11)
  {
    if ((-[NSURL isEqual:](applyServiceURL, "isEqual:") & 1) == 0)
      goto LABEL_63;
  }
  else if (applyServiceURL != v11)
  {
    goto LABEL_63;
  }
  paymentServicesBaseURL = self->_paymentServicesBaseURL;
  v13 = (NSURL *)v4[4];
  if (paymentServicesBaseURL && v13)
  {
    if ((-[NSURL isEqual:](paymentServicesBaseURL, "isEqual:") & 1) == 0)
      goto LABEL_63;
  }
  else if (paymentServicesBaseURL != v13)
  {
    goto LABEL_63;
  }
  details = self->_details;
  v15 = (PKAccountDetails *)v4[8];
  if (details && v15)
  {
    if (!-[PKAccountDetails isEqual:](details, "isEqual:"))
      goto LABEL_63;
  }
  else if (details != v15)
  {
    goto LABEL_63;
  }
  if (self->_feature != v4[6]
    || self->_type != v4[7]
    || self->_state != v4[9]
    || self->_stateReason != v4[10]
    || self->_accessLevel != v4[11]
    || self->_blockAllAccountAccess != *((unsigned __int8 *)v4 + 9)
    || self->_blockNotifications != *((unsigned __int8 *)v4 + 8)
    || self->_isCloudAccount != *((unsigned __int8 *)v4 + 10))
  {
    goto LABEL_63;
  }
  altDSID = self->_altDSID;
  v17 = (NSString *)v4[12];
  if (altDSID && v17)
  {
    if ((-[NSString isEqual:](altDSID, "isEqual:") & 1) == 0)
      goto LABEL_63;
  }
  else if (altDSID != v17)
  {
    goto LABEL_63;
  }
  if (self->_coOwner != *((unsigned __int8 *)v4 + 11) || self->_sharedAccount != *((unsigned __int8 *)v4 + 12))
    goto LABEL_63;
  previousAccountIdentifiers = self->_previousAccountIdentifiers;
  v19 = (NSSet *)v4[13];
  if (previousAccountIdentifiers && v19)
  {
    if ((-[NSSet isEqual:](previousAccountIdentifiers, "isEqual:") & 1) == 0)
      goto LABEL_63;
  }
  else if (previousAccountIdentifiers != v19)
  {
    goto LABEL_63;
  }
  if (self->_accountStateDirty != *((unsigned __int8 *)v4 + 13))
    goto LABEL_63;
  supportedFeatures = self->_supportedFeatures;
  v21 = (NSSet *)v4[14];
  if (supportedFeatures && v21)
  {
    if ((-[NSSet isEqual:](supportedFeatures, "isEqual:") & 1) == 0)
      goto LABEL_63;
  }
  else if (supportedFeatures != v21)
  {
    goto LABEL_63;
  }
  additionalPushTopics = self->_additionalPushTopics;
  v23 = (PKAccountAdditionalPushTopics *)v4[15];
  if (!additionalPushTopics || !v23)
  {
    if (additionalPushTopics == v23)
      goto LABEL_59;
LABEL_63:
    v26 = 0;
    goto LABEL_64;
  }
  if (!-[PKAccountAdditionalPushTopics isEqual:](additionalPushTopics, "isEqual:"))
    goto LABEL_63;
LABEL_59:
  fetchPeriods = self->_fetchPeriods;
  v25 = (PKAccountFetchPeriods *)v4[16];
  if (fetchPeriods && v25)
    v26 = -[PKAccountFetchPeriods isEqual:](fetchPeriods, "isEqual:");
  else
    v26 = fetchPeriods == v25;
LABEL_64:

  return v26;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *accountIdentifier;
  NSString *v6;
  NSURL *accountBaseURL;
  NSURL *v8;
  NSURL *applyServiceURL;
  NSURL *v10;
  NSURL *paymentServicesBaseURL;
  NSURL *v12;
  PKAccountDetails *details;
  PKAccountDetails *v14;
  NSDate *lastUpdated;
  NSDate *v16;
  NSString *altDSID;
  NSString *v18;
  NSSet *previousAccountIdentifiers;
  NSSet *v20;
  NSSet *supportedFeatures;
  NSSet *v22;
  PKAccountAdditionalPushTopics *additionalPushTopics;
  PKAccountAdditionalPushTopics *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  PKAccountFetchPeriods *fetchPeriods;
  PKAccountFetchPeriods *v29;
  BOOL v30;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_68;
  accountIdentifier = self->_accountIdentifier;
  v6 = (NSString *)v4[2];
  if (accountIdentifier && v6)
  {
    if ((-[NSString isEqual:](accountIdentifier, "isEqual:") & 1) == 0)
      goto LABEL_68;
  }
  else if (accountIdentifier != v6)
  {
    goto LABEL_68;
  }
  accountBaseURL = self->_accountBaseURL;
  v8 = (NSURL *)v4[3];
  if (accountBaseURL && v8)
  {
    if ((-[NSURL isEqual:](accountBaseURL, "isEqual:") & 1) == 0)
      goto LABEL_68;
  }
  else if (accountBaseURL != v8)
  {
    goto LABEL_68;
  }
  applyServiceURL = self->_applyServiceURL;
  v10 = (NSURL *)v4[5];
  if (applyServiceURL && v10)
  {
    if ((-[NSURL isEqual:](applyServiceURL, "isEqual:") & 1) == 0)
      goto LABEL_68;
  }
  else if (applyServiceURL != v10)
  {
    goto LABEL_68;
  }
  paymentServicesBaseURL = self->_paymentServicesBaseURL;
  v12 = (NSURL *)v4[4];
  if (paymentServicesBaseURL && v12)
  {
    if ((-[NSURL isEqual:](paymentServicesBaseURL, "isEqual:") & 1) == 0)
      goto LABEL_68;
  }
  else if (paymentServicesBaseURL != v12)
  {
    goto LABEL_68;
  }
  details = self->_details;
  v14 = (PKAccountDetails *)v4[8];
  if (details && v14)
  {
    if (!-[PKAccountDetails isEqual:](details, "isEqual:"))
      goto LABEL_68;
  }
  else if (details != v14)
  {
    goto LABEL_68;
  }
  if (self->_feature == v4[6])
  {
    lastUpdated = self->_lastUpdated;
    v16 = (NSDate *)v4[17];
    if (lastUpdated && v16)
    {
      if ((-[NSDate isEqual:](lastUpdated, "isEqual:") & 1) == 0)
        goto LABEL_68;
    }
    else if (lastUpdated != v16)
    {
      goto LABEL_68;
    }
    if (self->_type != v4[7]
      || self->_state != v4[9]
      || self->_stateReason != v4[10]
      || self->_accessLevel != v4[11]
      || self->_blockAllAccountAccess != *((unsigned __int8 *)v4 + 9)
      || self->_blockNotifications != *((unsigned __int8 *)v4 + 8)
      || self->_isCloudAccount != *((unsigned __int8 *)v4 + 10))
    {
      goto LABEL_68;
    }
    altDSID = self->_altDSID;
    v18 = (NSString *)v4[12];
    if (altDSID && v18)
    {
      if ((-[NSString isEqual:](altDSID, "isEqual:") & 1) == 0)
        goto LABEL_68;
    }
    else if (altDSID != v18)
    {
      goto LABEL_68;
    }
    if (self->_coOwner != *((unsigned __int8 *)v4 + 11) || self->_sharedAccount != *((unsigned __int8 *)v4 + 12))
      goto LABEL_68;
    previousAccountIdentifiers = self->_previousAccountIdentifiers;
    v20 = (NSSet *)v4[13];
    if (previousAccountIdentifiers && v20)
    {
      if ((-[NSSet isEqual:](previousAccountIdentifiers, "isEqual:") & 1) == 0)
        goto LABEL_68;
    }
    else if (previousAccountIdentifiers != v20)
    {
      goto LABEL_68;
    }
    if (self->_accountStateDirty == *((unsigned __int8 *)v4 + 13))
    {
      supportedFeatures = self->_supportedFeatures;
      v22 = (NSSet *)v4[14];
      if (supportedFeatures && v22)
      {
        if ((-[NSSet isEqual:](supportedFeatures, "isEqual:") & 1) == 0)
          goto LABEL_68;
      }
      else if (supportedFeatures != v22)
      {
        goto LABEL_68;
      }
      additionalPushTopics = self->_additionalPushTopics;
      v24 = (PKAccountAdditionalPushTopics *)v4[15];
      if (additionalPushTopics && v24)
      {
        if (-[PKAccountAdditionalPushTopics isEqual:](additionalPushTopics, "isEqual:"))
        {
LABEL_61:
          -[PKAccount cloudStoreZoneNames](self, "cloudStoreZoneNames");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "cloudStoreZoneNames");
          v26 = objc_claimAutoreleasedReturnValue();
          v27 = (void *)v26;
          if (v25 && v26)
          {
            if ((objc_msgSend(v25, "isEqual:", v26) & 1) != 0)
            {
LABEL_64:
              fetchPeriods = self->_fetchPeriods;
              v29 = (PKAccountFetchPeriods *)v4[16];
              if (fetchPeriods && v29)
                v30 = -[PKAccountFetchPeriods isEqual:](fetchPeriods, "isEqual:");
              else
                v30 = fetchPeriods == v29;
              goto LABEL_73;
            }
          }
          else if (v25 == (void *)v26)
          {
            goto LABEL_64;
          }
          v30 = 0;
LABEL_73:

          goto LABEL_69;
        }
      }
      else if (additionalPushTopics == v24)
      {
        goto LABEL_61;
      }
    }
  }
LABEL_68:
  v30 = 0;
LABEL_69:

  return v30;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_accountIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_details);
  objc_msgSend(v3, "safelyAddObject:", self->_supportedFeatures);
  objc_msgSend(v3, "safelyAddObject:", self->_lastUpdated);
  objc_msgSend(v3, "safelyAddObject:", self->_accountBaseURL);
  objc_msgSend(v3, "safelyAddObject:", self->_altDSID);
  objc_msgSend(v3, "safelyAddObject:", self->_applyServiceURL);
  objc_msgSend(v3, "safelyAddObject:", self->_previousAccountIdentifiers);
  objc_msgSend(v3, "safelyAddObject:", self->_paymentServicesBaseURL);
  objc_msgSend(v3, "safelyAddObject:", self->_additionalPushTopics);
  -[PKAccount cloudStoreZoneNames](self, "cloudStoreZoneNames");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", v4);

  objc_msgSend(v3, "safelyAddObject:", self->_fetchPeriods);
  v5 = PKCombinedHash(17, v3);
  v6 = self->_type - v5 + 32 * v5;
  v7 = self->_feature - v6 + 32 * v6;
  v8 = self->_state - v7 + 32 * v7;
  v9 = self->_stateReason - v8 + 32 * v8;
  v10 = self->_accessLevel - v9 + 32 * v9;
  v11 = self->_accountStateDirty - v10 + 32 * v10;
  v12 = self->_blockAllAccountAccess - v11 + 32 * v11;
  v13 = self->_blockNotifications - v12 + 32 * v12;
  v14 = self->_isCloudAccount - v13 + 32 * v13;
  v15 = self->_coOwner - v14 + 32 * v14;
  v16 = self->_sharedAccount - v15 + 32 * v15;

  return v16;
}

- (id)description
{
  void *v3;
  void *v4;
  unint64_t type;
  const __CFString *v6;
  unint64_t state;
  const __CFString *v8;
  void *v9;
  unint64_t accessLevel;
  const __CFString *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("accountIdentifier: '%@'; "), self->_accountIdentifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("accountBaseURL: '%@'; "), self->_accountBaseURL);
  objc_msgSend(v3, "appendFormat:", CFSTR("applyServiceURL: '%@'; "), self->_applyServiceURL);
  objc_msgSend(v3, "appendFormat:", CFSTR("paymentServicesBaseURL: '%@'; "), self->_paymentServicesBaseURL);
  PKFeatureIdentifierToString(self->_feature);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("feature: '%@'; "), v4);

  type = self->_type;
  if (type > 4)
    v6 = CFSTR("unknown");
  else
    v6 = off_1E2AC4CC8[type];
  objc_msgSend(v3, "appendFormat:", CFSTR("type: '%@'; "), v6);
  state = self->_state;
  if (state > 5)
    v8 = CFSTR("unknown");
  else
    v8 = off_1E2AC4CF0[state];
  objc_msgSend(v3, "appendFormat:", CFSTR("state: '%@'; "), v8);
  PKAccountStateReasonToString(self->_stateReason);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("stateReason: '%@'; "), v9);

  accessLevel = self->_accessLevel;
  if (accessLevel > 2)
    v11 = CFSTR("unknown");
  else
    v11 = off_1E2AC4CB0[accessLevel];
  objc_msgSend(v3, "appendFormat:", CFSTR("accessLevel: '%@'; "), v11);
  -[PKAccountDetails description](self->_details, "description");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("details: '%@'; "), v12);

  if (-[NSSet count](self->_supportedFeatures, "count"))
  {
    -[NSSet description](self->_supportedFeatures, "description");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("supported features: '%@'; "), v13);

  }
  if (self->_accountStateDirty)
    v14 = CFSTR("YES");
  else
    v14 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("dirty: '%@'; "), v14);
  if (self->_isCloudAccount)
    v15 = CFSTR("YES");
  else
    v15 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("is cloud account: '%@'; "), v15);
  if (self->_type == 1)
  {
    if (self->_blockAllAccountAccess)
      v16 = CFSTR("YES");
    else
      v16 = CFSTR("NO");
    objc_msgSend(v3, "appendFormat:", CFSTR("block all account access: '%@'; "), v16);
    if (self->_blockNotifications)
      v17 = CFSTR("YES");
    else
      v17 = CFSTR("NO");
    objc_msgSend(v3, "appendFormat:", CFSTR("block notifications: '%@'; "), v17);
    objc_msgSend(v3, "appendFormat:", CFSTR("altDSID: '%@'; "), self->_altDSID);
    if (self->_sharedAccount)
      v18 = CFSTR("YES");
    else
      v18 = CFSTR("NO");
    objc_msgSend(v3, "appendFormat:", CFSTR("shared account: '%@'; "), v18);
    objc_msgSend(v3, "appendFormat:", CFSTR("previousAccountIdentifiers: '%@'; "), self->_previousAccountIdentifiers);
    if (self->_coOwner)
      v19 = CFSTR("YES");
    else
      v19 = CFSTR("NO");
    objc_msgSend(v3, "appendFormat:", CFSTR("coOwner: '%@'; "), v19);
  }
  objc_msgSend(v3, "appendFormat:", CFSTR("cloudStoreZoneNames: '%@'; "), self->_cloudStoreZoneNames);
  -[NSDate description](self->_lastUpdated, "description");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("last update: '%@'; "), v20);

  -[PKAccountAdditionalPushTopics description](self->_additionalPushTopics, "description");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("additional push topics: '%@'; "), v21);

  -[PKAccountFetchPeriods description](self->_fetchPeriods, "description");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("fetch periods: '%@'; "), v22);

  objc_msgSend(v3, "appendFormat:", CFSTR("source identifier: '%@'; "), self->_transactionSourceIdentifier);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PKAccount *v5;
  uint64_t v6;
  NSString *accountIdentifier;
  uint64_t v8;
  NSURL *accountBaseURL;
  uint64_t v10;
  NSURL *applyServiceURL;
  uint64_t v12;
  NSURL *paymentServicesBaseURL;
  uint64_t v14;
  NSString *altDSID;
  uint64_t v16;
  NSSet *previousAccountIdentifiers;
  PKAccountDetails *v18;
  PKAccountDetails *details;
  id v20;
  NSSet *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  NSSet *supportedFeatures;
  uint64_t v29;
  NSDate *lastUpdated;
  PKAccountAdditionalPushTopics *v31;
  PKAccountAdditionalPushTopics *additionalPushTopics;
  PKAccountFetchPeriods *v33;
  PKAccountFetchPeriods *fetchPeriods;
  uint64_t v35;
  NSArray *cloudStoreZoneNames;
  uint64_t v37;
  NSString *transactionSourceIdentifier;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v5 = -[PKAccount init](+[PKAccount allocWithZone:](PKAccount, "allocWithZone:"), "init");
  v6 = -[NSString copyWithZone:](self->_accountIdentifier, "copyWithZone:", a3);
  accountIdentifier = v5->_accountIdentifier;
  v5->_accountIdentifier = (NSString *)v6;

  v8 = -[NSURL copyWithZone:](self->_accountBaseURL, "copyWithZone:", a3);
  accountBaseURL = v5->_accountBaseURL;
  v5->_accountBaseURL = (NSURL *)v8;

  v10 = -[NSURL copyWithZone:](self->_applyServiceURL, "copyWithZone:", a3);
  applyServiceURL = v5->_applyServiceURL;
  v5->_applyServiceURL = (NSURL *)v10;

  v12 = -[NSURL copyWithZone:](self->_paymentServicesBaseURL, "copyWithZone:", a3);
  paymentServicesBaseURL = v5->_paymentServicesBaseURL;
  v5->_paymentServicesBaseURL = (NSURL *)v12;

  v5->_feature = self->_feature;
  v5->_type = self->_type;
  v5->_state = self->_state;
  v5->_stateReason = self->_stateReason;
  v5->_accessLevel = self->_accessLevel;
  v5->_blockAllAccountAccess = self->_blockAllAccountAccess;
  v5->_blockNotifications = self->_blockNotifications;
  v5->_isCloudAccount = self->_isCloudAccount;
  v5->_coOwner = self->_coOwner;
  v14 = -[NSString copyWithZone:](self->_altDSID, "copyWithZone:", a3);
  altDSID = v5->_altDSID;
  v5->_altDSID = (NSString *)v14;

  v5->_sharedAccount = self->_sharedAccount;
  v16 = -[NSSet copyWithZone:](self->_previousAccountIdentifiers, "copyWithZone:", a3);
  previousAccountIdentifiers = v5->_previousAccountIdentifiers;
  v5->_previousAccountIdentifiers = (NSSet *)v16;

  v18 = -[PKAccountDetails copyWithZone:](self->_details, "copyWithZone:", a3);
  details = v5->_details;
  v5->_details = v18;

  v20 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v21 = self->_supportedFeatures;
  v22 = -[NSSet countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v41;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v41 != v24)
          objc_enumerationMutation(v21);
        v26 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * v25), "copy", (_QWORD)v40);
        objc_msgSend(v20, "addObject:", v26);

        ++v25;
      }
      while (v23 != v25);
      v23 = -[NSSet countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    }
    while (v23);
  }

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithSet:", v20);
  v27 = objc_claimAutoreleasedReturnValue();
  supportedFeatures = v5->_supportedFeatures;
  v5->_supportedFeatures = (NSSet *)v27;

  v5->_accountStateDirty = self->_accountStateDirty;
  v29 = -[NSDate copyWithZone:](self->_lastUpdated, "copyWithZone:", a3);
  lastUpdated = v5->_lastUpdated;
  v5->_lastUpdated = (NSDate *)v29;

  v31 = -[PKAccountAdditionalPushTopics copyWithZone:](self->_additionalPushTopics, "copyWithZone:", a3);
  additionalPushTopics = v5->_additionalPushTopics;
  v5->_additionalPushTopics = v31;

  v33 = -[PKAccountFetchPeriods copyWithZone:](self->_fetchPeriods, "copyWithZone:", a3);
  fetchPeriods = v5->_fetchPeriods;
  v5->_fetchPeriods = v33;

  v35 = -[NSArray copyWithZone:](self->_cloudStoreZoneNames, "copyWithZone:", a3);
  cloudStoreZoneNames = v5->_cloudStoreZoneNames;
  v5->_cloudStoreZoneNames = (NSArray *)v35;

  v37 = -[NSString copyWithZone:](self->_transactionSourceIdentifier, "copyWithZone:", a3);
  transactionSourceIdentifier = v5->_transactionSourceIdentifier;
  v5->_transactionSourceIdentifier = (NSString *)v37;

  return v5;
}

- (BOOL)supportsExtendedFetch
{
  return self->_additionalPushTopics != 0;
}

- (BOOL)isClosedAndChargedOff
{
  return self->_state == 4 && self->_stateReason == 8;
}

- (void)updateWithCloudStoreRecord:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];
  int v15;

  objc_msgSend(a3, "recordsWithRecordType:", CFSTR("Account"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "pk_stringForKey:", CFSTR("featureIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = PKFeatureIdentifierFromString(v6);

    if (v7 == 4)
    {
      objc_msgSend(v5, "pk_encryptedObjectForKey:ofClass:", CFSTR("balanceAmount"), objc_opt_class());
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      v10 = (void *)MEMORY[0x1E0CB3598];
      if (v8)
      {
        objc_msgSend(v8, "decimalValue");
      }
      else
      {
        v14[0] = 0;
        v14[1] = 0;
        v15 = 0;
      }
      objc_msgSend(v10, "decimalNumberWithDecimal:", v14);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        -[PKAccount appleBalanceDetails](self, "appleBalanceDetails");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "accountSummary");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "setCurrentBalance:", v11);
      }

    }
  }

}

- (PKAccount)initWithCloudStoreCoder:(id)a3
{
  id v4;
  PKAccount *v5;
  PKAccount *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKAccount;
  v5 = -[PKAccount init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[PKAccount applyPropertiesFromCloudStoreRecord:](v5, "applyPropertiesFromCloudStoreRecord:", v4);

  return v6;
}

- (void)applyPropertiesFromCloudStoreRecord:(id)a3
{
  void *v4;
  NSString *v5;
  NSString *accountIdentifier;
  void *v7;
  void *v8;
  PKAccountDetails *v9;
  unint64_t type;
  PKAccountDetails *v11;
  PKAccountDetails *details;
  void *v13;
  NSArray *v14;
  NSArray *cloudStoreZoneNames;
  NSSet *v16;
  NSSet *supportedFeatures;
  id v18;

  objc_msgSend(a3, "recordsWithRecordType:", CFSTR("Account"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v18 = (id)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(v18, "pk_encryptedStringForKey:", CFSTR("accountIdentifier"));
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    accountIdentifier = self->_accountIdentifier;
    self->_accountIdentifier = v5;

    objc_msgSend(v18, "pk_stringForKey:", CFSTR("featureIdentifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    self->_feature = PKFeatureIdentifierFromString(v7);

    objc_msgSend(v18, "pk_stringForKey:", CFSTR("accountType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    self->_type = PKAccountTypeFromString(v8);

    v9 = [PKAccountDetails alloc];
    if (self->_type - 1 >= 4)
      type = 0;
    else
      type = self->_type;
    v11 = -[PKAccountDetails initWithCloudRecord:type:](v9, "initWithCloudRecord:type:", v18, type);
    details = self->_details;
    self->_details = v11;

    objc_msgSend(v18, "pk_encryptedStringForKey:", CFSTR("state"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    self->_state = PKAccountStateFromString(v13);

    *(_OWORD *)&self->_stateReason = xmmword_19043CD10;
    self->_isCloudAccount = 1;
    self->_sharedAccount = 0;
    objc_msgSend(v18, "pk_arrayForKey:", CFSTR("cloudStoreZoneNames"));
    v14 = (NSArray *)objc_claimAutoreleasedReturnValue();
    cloudStoreZoneNames = self->_cloudStoreZoneNames;
    self->_cloudStoreZoneNames = v14;

    -[PKAccount _featureDescriptorsForFeature:inCloudRecord:](self, "_featureDescriptorsForFeature:inCloudRecord:", self->_feature, v18);
    v16 = (NSSet *)objc_claimAutoreleasedReturnValue();
    supportedFeatures = self->_supportedFeatures;
    self->_supportedFeatures = v16;

  }
}

- (void)encodeWithCloudStoreCoder:(id)a3 codingType:(unint64_t)a4
{
  void *v6;
  void *v7;
  unint64_t type;
  const __CFString *v9;
  NSArray *cloudStoreZoneNames;
  void *v11;
  void *v12;
  void *v13;
  unint64_t state;
  const __CFString *v15;
  id v16;

  objc_msgSend(a3, "recordsWithRecordType:", CFSTR("Account"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v16 = (id)objc_claimAutoreleasedReturnValue();

  PKFeatureIdentifierToString(self->_feature);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKey:", v7, CFSTR("featureIdentifier"));

  type = self->_type;
  if (type > 4)
    v9 = CFSTR("unknown");
  else
    v9 = off_1E2AC4CC8[type];
  objc_msgSend(v16, "setObject:forKey:", v9, CFSTR("accountType"));
  cloudStoreZoneNames = self->_cloudStoreZoneNames;
  if (cloudStoreZoneNames)
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", cloudStoreZoneNames, 0, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v11, 4);
    objc_msgSend(v16, "setObject:forKey:", v12, CFSTR("cloudStoreZoneNames"));

  }
  objc_msgSend(v16, "encryptedValues");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKey:", self->_accountIdentifier, CFSTR("accountIdentifier"));
  state = self->_state;
  if (state > 5)
    v15 = CFSTR("unknown");
  else
    v15 = off_1E2AC4CF0[state];
  objc_msgSend(v13, "setObject:forKey:", v15, CFSTR("state"));
  -[PKAccountDetails encodeWithCloudRecord:codingType:](self->_details, "encodeWithCloudRecord:codingType:", v16, a4);
  -[PKAccount _addSupportedFeaturesToEncryptedCloudRecord:](self, "_addSupportedFeaturesToEncryptedCloudRecord:", v16);

}

- (unint64_t)itemType
{
  return 7;
}

+ (id)recordNamePrefix
{
  return CFSTR("account-");
}

- (id)primaryIdentifier
{
  return self->_accountIdentifier;
}

- (id)recordTypesAndNamesForCodingType:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v7 = CFSTR("Account");
  objc_msgSend((id)objc_opt_class(), "recordNameForAccountIdentifier:", self->_accountIdentifier, CFSTR("Account"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)recordNameForAccountIdentifier:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;

  v4 = (objc_class *)MEMORY[0x1E0CB3940];
  v5 = a3;
  v6 = [v4 alloc];
  objc_msgSend(a1, "recordNamePrefix");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithFormat:", CFSTR("%@%@"), v7, v5);

  return v8;
}

+ (id)accountIdentifierFromRecordName:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(a1, "recordNamePrefix");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "hasPrefix:", v5);

  if (v6)
  {
    objc_msgSend(a1, "recordNamePrefix");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "substringFromIndex:", objc_msgSend(v7, "length"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_featureDescriptorsForFeature:(unint64_t)a3 inCloudRecord:(id)a4
{
  id v5;
  id v6;
  PKAppleBalanceAccountFeatureDescriptor *v7;
  PKAppleBalanceAccountFeatureDescriptor *v8;

  v5 = a4;
  v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  if (a3 == 4)
  {
    if (objc_msgSend(v5, "pk_BOOLForKey:", CFSTR("ampTopUpSupported")))
    {
      v7 = -[PKAppleBalanceAccountFeatureDescriptor initWithIdentifier:]([PKAppleBalanceAccountFeatureDescriptor alloc], "initWithIdentifier:", CFSTR("ampTopUpSupported"));
      objc_msgSend(v6, "addObject:", v7);

    }
    if (objc_msgSend(v5, "pk_BOOLForKey:", CFSTR("ampRedemptionSupported")))
    {
      v8 = -[PKAppleBalanceAccountFeatureDescriptor initWithIdentifier:]([PKAppleBalanceAccountFeatureDescriptor alloc], "initWithIdentifier:", CFSTR("ampRedemptionSupported"));
      objc_msgSend(v6, "addObject:", v8);

    }
  }

  return v6;
}

- (void)_addSupportedFeaturesToEncryptedCloudRecord:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  if (self->_feature == 4)
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    v5 = a3;
    objc_msgSend(v4, "numberWithBool:", -[PKAccount supportsAMPTopUp](self, "supportsAMPTopUp"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("ampTopUpSupported"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PKAccount supportsAMPRedeemGiftcard](self, "supportsAMPRedeemGiftcard"));
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v7, CFSTR("ampRedemptionSupported"));

  }
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
  -[PKAccount supportedFeatures](self, "supportedFeatures", 0);
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

- (void)_insertSupportedFeature:(id)a3
{
  void *v4;
  void *v5;
  NSSet *v6;
  NSSet *supportedFeatures;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccount _featureWithIdentifier:](self, "_featureWithIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[NSSet setByAddingObject:](self->_supportedFeatures, "setByAddingObject:", v8);
    v6 = (NSSet *)objc_claimAutoreleasedReturnValue();
    supportedFeatures = self->_supportedFeatures;
    self->_supportedFeatures = v6;

  }
}

- (void)_removeSupportedFeatureWithIdentifier:(id)a3
{
  void *v4;
  NSSet *v5;
  NSSet *supportedFeatures;
  void *v7;

  -[PKAccount _featureWithIdentifier:](self, "_featureWithIdentifier:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v7 = v4;
    -[NSSet pk_setByRemovingObject:](self->_supportedFeatures, "pk_setByRemovingObject:", v4);
    v5 = (NSSet *)objc_claimAutoreleasedReturnValue();
    supportedFeatures = self->_supportedFeatures;
    self->_supportedFeatures = v5;

    v4 = v7;
  }

}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSURL)accountBaseURL
{
  return self->_accountBaseURL;
}

- (void)setAccountBaseURL:(id)a3
{
  objc_storeStrong((id *)&self->_accountBaseURL, a3);
}

- (NSURL)paymentServicesBaseURL
{
  return self->_paymentServicesBaseURL;
}

- (void)setPaymentServicesBaseURL:(id)a3
{
  objc_storeStrong((id *)&self->_paymentServicesBaseURL, a3);
}

- (NSURL)applyServiceURL
{
  return self->_applyServiceURL;
}

- (void)setApplyServiceURL:(id)a3
{
  objc_storeStrong((id *)&self->_applyServiceURL, a3);
}

- (unint64_t)feature
{
  return self->_feature;
}

- (void)setFeature:(unint64_t)a3
{
  self->_feature = a3;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (PKAccountDetails)details
{
  return self->_details;
}

- (void)setDetails:(id)a3
{
  objc_storeStrong((id *)&self->_details, a3);
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (unint64_t)stateReason
{
  return self->_stateReason;
}

- (void)setStateReason:(unint64_t)a3
{
  self->_stateReason = a3;
}

- (unint64_t)accessLevel
{
  return self->_accessLevel;
}

- (void)setAccessLevel:(unint64_t)a3
{
  self->_accessLevel = a3;
}

- (BOOL)blockNotifications
{
  return self->_blockNotifications;
}

- (void)setBlockNotifications:(BOOL)a3
{
  self->_blockNotifications = a3;
}

- (BOOL)blockAllAccountAccess
{
  return self->_blockAllAccountAccess;
}

- (void)setBlockAllAccountAccess:(BOOL)a3
{
  self->_blockAllAccountAccess = a3;
}

- (BOOL)isCloudAccount
{
  return self->_isCloudAccount;
}

- (void)setIsCloudAccount:(BOOL)a3
{
  self->_isCloudAccount = a3;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (BOOL)isCoOwner
{
  return self->_coOwner;
}

- (void)setCoOwner:(BOOL)a3
{
  self->_coOwner = a3;
}

- (BOOL)isSharedAccount
{
  return self->_sharedAccount;
}

- (void)setSharedAccount:(BOOL)a3
{
  self->_sharedAccount = a3;
}

- (NSSet)previousAccountIdentifiers
{
  return self->_previousAccountIdentifiers;
}

- (void)setPreviousAccountIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSSet)supportedFeatures
{
  return self->_supportedFeatures;
}

- (void)setSupportedFeatures:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (PKAccountAdditionalPushTopics)additionalPushTopics
{
  return self->_additionalPushTopics;
}

- (void)setAdditionalPushTopics:(id)a3
{
  objc_storeStrong((id *)&self->_additionalPushTopics, a3);
}

- (PKAccountFetchPeriods)fetchPeriods
{
  return self->_fetchPeriods;
}

- (void)setFetchPeriods:(id)a3
{
  objc_storeStrong((id *)&self->_fetchPeriods, a3);
}

- (BOOL)accountStateDirty
{
  return self->_accountStateDirty;
}

- (void)setAccountStateDirty:(BOOL)a3
{
  self->_accountStateDirty = a3;
}

- (NSDate)lastUpdated
{
  return self->_lastUpdated;
}

- (void)setLastUpdated:(id)a3
{
  objc_storeStrong((id *)&self->_lastUpdated, a3);
}

- (void)setCloudStoreZoneNames:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSString)transactionSourceIdentifier
{
  return self->_transactionSourceIdentifier;
}

- (void)setTransactionSourceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionSourceIdentifier, 0);
  objc_storeStrong((id *)&self->_cloudStoreZoneNames, 0);
  objc_storeStrong((id *)&self->_lastUpdated, 0);
  objc_storeStrong((id *)&self->_fetchPeriods, 0);
  objc_storeStrong((id *)&self->_additionalPushTopics, 0);
  objc_storeStrong((id *)&self->_supportedFeatures, 0);
  objc_storeStrong((id *)&self->_previousAccountIdentifiers, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_details, 0);
  objc_storeStrong((id *)&self->_applyServiceURL, 0);
  objc_storeStrong((id *)&self->_paymentServicesBaseURL, 0);
  objc_storeStrong((id *)&self->_accountBaseURL, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

- (BOOL)supportsSchedulePayment
{
  void *v2;
  BOOL v3;

  -[PKAccount schedulePaymentFeatureDescriptor](self, "schedulePaymentFeatureDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)schedulePaymentFeatureDescriptor
{
  return -[PKAccount _creditFeatureWithIdentifier:](self, "_creditFeatureWithIdentifier:", CFSTR("schedulePayment"));
}

- (BOOL)supportsScheduleRecurringPayments
{
  void *v2;
  BOOL v3;

  -[PKAccount scheduleRecurringPaymentsFeatureDescriptor](self, "scheduleRecurringPaymentsFeatureDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)scheduleRecurringPaymentsFeatureDescriptor
{
  return -[PKAccount _creditFeatureWithIdentifier:](self, "_creditFeatureWithIdentifier:", CFSTR("scheduleRecurringPayments"));
}

- (BOOL)supportsViewStatement
{
  void *v2;
  BOOL v3;

  -[PKAccount viewStatementFeatureDescriptor](self, "viewStatementFeatureDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)viewStatementFeatureDescriptor
{
  return -[PKAccount _creditFeatureWithIdentifier:](self, "_creditFeatureWithIdentifier:", CFSTR("viewStatement"));
}

- (BOOL)supportsRequestStatement
{
  void *v2;
  BOOL v3;

  -[PKAccount requestStatementFeatureDescriptor](self, "requestStatementFeatureDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)requestStatementFeatureDescriptor
{
  return -[PKAccount _creditFeatureWithIdentifier:](self, "_creditFeatureWithIdentifier:", CFSTR("requestStatement"));
}

- (BOOL)supportsExportTransactionData
{
  void *v2;
  BOOL v3;

  -[PKAccount exportTransactionDataFeatureDescriptor](self, "exportTransactionDataFeatureDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)exportTransactionDataFeatureDescriptor
{
  return -[PKAccount _creditFeatureWithIdentifier:](self, "_creditFeatureWithIdentifier:", CFSTR("exportTransactionData"));
}

- (BOOL)supportsRequestPhysicalCard
{
  void *v2;
  BOOL v3;

  -[PKAccount requestPhysicalCardFeatureDescriptor](self, "requestPhysicalCardFeatureDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)requestPhysicalCardFeatureDescriptor
{
  return -[PKAccount _creditFeatureWithIdentifier:](self, "_creditFeatureWithIdentifier:", CFSTR("requestPhysicalCard"));
}

- (BOOL)supportsRedeemRewards
{
  void *v2;
  BOOL v3;

  -[PKAccount redeemRewardsFeatureDescriptor](self, "redeemRewardsFeatureDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)redeemRewardsFeatureDescriptor
{
  return -[PKAccount _creditFeatureWithIdentifier:](self, "_creditFeatureWithIdentifier:", CFSTR("redeemRewards"));
}

- (BOOL)supportsShowNotifications
{
  void *v2;
  BOOL v3;

  -[PKAccount showNotificationsFeatureDescriptor](self, "showNotificationsFeatureDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)showNotificationsFeatureDescriptor
{
  return -[PKAccount _featureWithIdentifier:](self, "_featureWithIdentifier:", CFSTR("showNotifications"));
}

- (BOOL)supportsTransactionSyncReporting
{
  void *v2;
  BOOL v3;

  -[PKAccount transactionSyncReportingFeatureDescriptor](self, "transactionSyncReportingFeatureDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)transactionSyncReportingFeatureDescriptor
{
  return -[PKAccount _featureWithIdentifier:](self, "_featureWithIdentifier:", CFSTR("supportsTransactionSyncReporting"));
}

- (BOOL)supportsStatementMetadata
{
  void *v2;
  BOOL v3;

  -[PKAccount statementMetadataFeatureDescriptor](self, "statementMetadataFeatureDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)statementMetadataFeatureDescriptor
{
  return -[PKAccount _featureWithIdentifier:](self, "_featureWithIdentifier:", CFSTR("supportsStatementMetadata"));
}

- (BOOL)supportsShowAccountSummary
{
  void *v2;
  BOOL v3;

  -[PKAccount showAccountSummaryFeatureDescriptor](self, "showAccountSummaryFeatureDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)showAccountSummaryFeatureDescriptor
{
  return -[PKAccount _creditFeatureWithIdentifier:](self, "_creditFeatureWithIdentifier:", CFSTR("showAccountSummary"));
}

- (BOOL)supportsAddFundingSource
{
  void *v2;
  BOOL v3;

  -[PKAccount addFundingSourceFeatureDescriptor](self, "addFundingSourceFeatureDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)addFundingSourceFeatureDescriptor
{
  return -[PKAccount _featureWithIdentifier:](self, "_featureWithIdentifier:", CFSTR("addFundingSource"));
}

- (BOOL)supportsShowVirtualCard
{
  void *v2;
  BOOL v3;

  -[PKAccount showVirtualCardFeatureDescriptor](self, "showVirtualCardFeatureDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)showVirtualCardFeatureDescriptor
{
  return -[PKAccount _creditFeatureWithIdentifier:](self, "_creditFeatureWithIdentifier:", CFSTR("showVirtualCard"));
}

- (BOOL)supportsDynamicSecurityCodes
{
  void *v2;
  BOOL v3;

  -[PKAccount dynamicSecurityCodesFeatureDescriptor](self, "dynamicSecurityCodesFeatureDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)dynamicSecurityCodesFeatureDescriptor
{
  return -[PKAccount _creditFeatureWithIdentifier:](self, "_creditFeatureWithIdentifier:", CFSTR("dynamicSecurityCodes"));
}

- (BOOL)provisioningAllowed
{
  void *v2;
  BOOL v3;

  -[PKAccount provisioningAllowedFeatureDescriptor](self, "provisioningAllowedFeatureDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)provisioningAllowedFeatureDescriptor
{
  return -[PKAccount _featureWithIdentifier:](self, "_featureWithIdentifier:", CFSTR("provisioningAllowed"));
}

- (BOOL)accountUserInvitationAllowed
{
  void *v2;
  BOOL v3;

  -[PKAccount accountUserInvitationAllowedFeatureDescriptor](self, "accountUserInvitationAllowedFeatureDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)accountUserInvitationAllowedFeatureDescriptor
{
  return -[PKAccount _creditFeatureWithIdentifier:](self, "_creditFeatureWithIdentifier:", CFSTR("accountUserInvitationAllowed"));
}

- (BOOL)showPhysicalCardExpiringSoonMessaging
{
  void *v2;
  BOOL v3;

  -[PKAccount showPhysicalCardExpiringSoonMessagingDescriptor](self, "showPhysicalCardExpiringSoonMessagingDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)showPhysicalCardExpiringSoonMessagingDescriptor
{
  return -[PKAccount _creditFeatureWithIdentifier:](self, "_creditFeatureWithIdentifier:", CFSTR("showPhysicalCardExpiringSoonMessaging"));
}

- (BOOL)supportsPhysicalCardActivation
{
  void *v2;
  BOOL v3;

  -[PKAccount physicalCardActivationFeatureDescriptor](self, "physicalCardActivationFeatureDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)physicalCardActivationFeatureDescriptor
{
  return -[PKAccount _creditFeatureWithIdentifier:](self, "_creditFeatureWithIdentifier:", CFSTR("physicalCardActivation"));
}

- (BOOL)showBillPaymentInterest
{
  void *v2;
  BOOL v3;

  -[PKAccount showBillPaymentInterestFeatureDescriptor](self, "showBillPaymentInterestFeatureDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)showBillPaymentInterestFeatureDescriptor
{
  return -[PKAccount _creditFeatureWithIdentifier:](self, "_creditFeatureWithIdentifier:", CFSTR("showBillPaymentInterest"));
}

- (BOOL)showBillPaymentInterestSummary
{
  void *v2;
  BOOL v3;

  -[PKAccount showBillPaymentInterestSummaryFeatureDescriptor](self, "showBillPaymentInterestSummaryFeatureDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)showBillPaymentInterestSummaryFeatureDescriptor
{
  return -[PKAccount _creditFeatureWithIdentifier:](self, "_creditFeatureWithIdentifier:", CFSTR("showBillPaymentInterestSummary"));
}

- (BOOL)hideInterestChargeClarity
{
  void *v2;
  BOOL v3;

  -[PKAccount hideInterestChargeClarityFeatureDescriptor](self, "hideInterestChargeClarityFeatureDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)hideInterestChargeClarityFeatureDescriptor
{
  return -[PKAccount _creditFeatureWithIdentifier:](self, "_creditFeatureWithIdentifier:", CFSTR("hideInterestChargeClarity"));
}

- (BOOL)hideBillPaymentHoldTime
{
  void *v2;
  BOOL v3;

  -[PKAccount hideBillPaymentHoldTimeFeatureDescriptor](self, "hideBillPaymentHoldTimeFeatureDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)hideBillPaymentHoldTimeFeatureDescriptor
{
  return -[PKAccount _creditFeatureWithIdentifier:](self, "_creditFeatureWithIdentifier:", CFSTR("hideBillPaymentHoldTime"));
}

- (BOOL)hideEnhancedDisputeDetails
{
  void *v2;
  BOOL v3;

  -[PKAccount hideEnhancedDisputeDetailsFeatureDescriptor](self, "hideEnhancedDisputeDetailsFeatureDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)hideEnhancedDisputeDetailsFeatureDescriptor
{
  return -[PKAccount _creditFeatureWithIdentifier:](self, "_creditFeatureWithIdentifier:", CFSTR("hideEnhancedDisputeDetails"));
}

- (BOOL)hideDisputeDetails
{
  void *v2;
  BOOL v3;

  -[PKAccount hideDisputeDetailsFeatureDescriptor](self, "hideDisputeDetailsFeatureDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)hideDisputeDetailsFeatureDescriptor
{
  return -[PKAccount _creditFeatureWithIdentifier:](self, "_creditFeatureWithIdentifier:", CFSTR("hideDisputeDetails"));
}

- (BOOL)hideSpendingInsights
{
  void *v2;
  BOOL v3;

  -[PKAccount hideSpendingInsightsFeatureDescriptor](self, "hideSpendingInsightsFeatureDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)hideSpendingInsightsFeatureDescriptor
{
  return -[PKAccount _creditFeatureWithIdentifier:](self, "_creditFeatureWithIdentifier:", CFSTR("hideSpendingInsights"));
}

- (BOOL)showRewardsGraph
{
  void *v2;
  BOOL v3;

  -[PKAccount showRewardsGraphFeatureDescriptor](self, "showRewardsGraphFeatureDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)showRewardsGraphFeatureDescriptor
{
  return -[PKAccount _creditFeatureWithIdentifier:](self, "_creditFeatureWithIdentifier:", CFSTR("showRewardsGraph"));
}

- (BOOL)showPaymentSheetRewards
{
  void *v2;
  BOOL v3;

  -[PKAccount showPaymentSheetRewardsFeatureDescriptor](self, "showPaymentSheetRewardsFeatureDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)showPaymentSheetRewardsFeatureDescriptor
{
  return -[PKAccount _creditFeatureWithIdentifier:](self, "_creditFeatureWithIdentifier:", CFSTR("showPaymentSheetRewards"));
}

- (BOOL)showCardPromotions
{
  void *v2;
  BOOL v3;

  -[PKAccount showCardPromotionsFeatureDescriptor](self, "showCardPromotionsFeatureDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)showCardPromotionsFeatureDescriptor
{
  return -[PKAccount _creditFeatureWithIdentifier:](self, "_creditFeatureWithIdentifier:", CFSTR("showCardOffers"));
}

- (BOOL)showEnhancedMerchants
{
  void *v2;
  BOOL v3;

  -[PKAccount showEnhancedMerchantsFeatureDescriptor](self, "showEnhancedMerchantsFeatureDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)showEnhancedMerchantsFeatureDescriptor
{
  return -[PKAccount _creditFeatureWithIdentifier:](self, "_creditFeatureWithIdentifier:", CFSTR("showEnhancedMerchants"));
}

- (id)_creditFeatureWithIdentifier:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  -[PKAccount _featureWithIdentifier:](self, "_featureWithIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (BOOL)supportsTopUp
{
  int has_internal_ui;

  has_internal_ui = os_variant_has_internal_ui();
  if (has_internal_ui)
    LOBYTE(has_internal_ui) = PKAppleBalanceNativeTopUpEnabled();
  return has_internal_ui;
}

- (id)supportsTopUpFeatureDescriptor
{
  return -[PKAccount _appleBalanceFeatureWithIdentifier:](self, "_appleBalanceFeatureWithIdentifier:", CFSTR("directTopUp"));
}

- (BOOL)supportsAMPTopUp
{
  void *v2;
  BOOL v3;

  -[PKAccount supportsAMPTopUpFeatureDescriptor](self, "supportsAMPTopUpFeatureDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)supportsAMPTopUpFeatureDescriptor
{
  return -[PKAccount _appleBalanceFeatureWithIdentifier:](self, "_appleBalanceFeatureWithIdentifier:", CFSTR("ampTopUpSupported"));
}

- (BOOL)supportsAMPRedeemGiftcard
{
  void *v2;
  BOOL v3;

  -[PKAccount supportsAMPRedeemGiftcardFeatureDescriptor](self, "supportsAMPRedeemGiftcardFeatureDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)supportsAMPRedeemGiftcardFeatureDescriptor
{
  return -[PKAccount _appleBalanceFeatureWithIdentifier:](self, "_appleBalanceFeatureWithIdentifier:", CFSTR("ampRedemptionSupported"));
}

- (BOOL)supportsInStoreTopUp
{
  void *v2;
  BOOL v3;

  -[PKAccount supportsInStoreTopUpFeatureDescriptor](self, "supportsInStoreTopUpFeatureDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)supportsInStoreTopUpFeatureDescriptor
{
  return -[PKAccount _appleBalanceFeatureWithIdentifier:](self, "_appleBalanceFeatureWithIdentifier:", CFSTR("inStoreTopUp"));
}

- (BOOL)supportsInStorePayment
{
  void *v2;
  BOOL v3;

  -[PKAccount supportsInStorePaymentFeatureDescriptor](self, "supportsInStorePaymentFeatureDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)supportsInStorePaymentFeatureDescriptor
{
  return -[PKAccount _appleBalanceFeatureWithIdentifier:](self, "_appleBalanceFeatureWithIdentifier:", CFSTR("inStorePayment"));
}

- (id)_appleBalanceFeatureWithIdentifier:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  -[PKAccount _featureWithIdentifier:](self, "_featureWithIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (BOOL)supportsMoneyMovement
{
  return -[PKAccount supportsOneTimeDeposit](self, "supportsOneTimeDeposit")
      || -[PKAccount supportsOneTimeWithdrawal](self, "supportsOneTimeWithdrawal")
      || -[PKAccount supportsOneTimeDepositWithAppleCash](self, "supportsOneTimeDepositWithAppleCash")
      || -[PKAccount supportsOneTimeWithdrawalWithAppleCash](self, "supportsOneTimeWithdrawalWithAppleCash");
}

- (BOOL)supportsOneTimeDeposit
{
  void *v2;
  BOOL v3;

  -[PKAccount oneTimeDepositFeatureDescriptor](self, "oneTimeDepositFeatureDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)oneTimeDepositFeatureDescriptor
{
  return -[PKAccount _savingsFeatureWithIdentifier:](self, "_savingsFeatureWithIdentifier:", CFSTR("scheduleOneTimeDeposit"));
}

- (BOOL)supportsOneTimeWithdrawal
{
  void *v2;
  BOOL v3;

  -[PKAccount oneTimeWithdrawalFeatureDescriptor](self, "oneTimeWithdrawalFeatureDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)oneTimeWithdrawalFeatureDescriptor
{
  return -[PKAccount _savingsFeatureWithIdentifier:](self, "_savingsFeatureWithIdentifier:", CFSTR("scheduleOneTimeWithdrawal"));
}

- (unint64_t)oneTimeDepositFundingSourceTypes
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[PKAccount oneTimeDepositFeatureDescriptor](self, "oneTimeDepositFeatureDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "fundingSourceTypes");

  -[PKAccount oneTimeDepositWithAppleCashFeatureDescriptor](self, "oneTimeDepositWithAppleCashFeatureDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "fundingSourceTypes") | v4 & 0xFFFFFFFFFFFFFFFDLL;

  return v6;
}

- (unint64_t)oneTimeWithdrawalFundingSourceTypes
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[PKAccount oneTimeWithdrawalFeatureDescriptor](self, "oneTimeWithdrawalFeatureDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "fundingSourceTypes");

  -[PKAccount oneTimeWithdrawalWithAppleCashFeatureDescriptor](self, "oneTimeWithdrawalWithAppleCashFeatureDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "fundingSourceTypes") | v4 & 0xFFFFFFFFFFFFFFFDLL;

  return v6;
}

- (BOOL)supportsOneTimeDepositWithAppleCash
{
  void *v2;
  BOOL v3;

  -[PKAccount oneTimeDepositWithAppleCashFeatureDescriptor](self, "oneTimeDepositWithAppleCashFeatureDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)oneTimeDepositWithAppleCashFeatureDescriptor
{
  return -[PKAccount _savingsFeatureWithIdentifier:](self, "_savingsFeatureWithIdentifier:", CFSTR("scheduleOneTimeDepositWithAppleCash"));
}

- (BOOL)supportsOneTimeWithdrawalWithAppleCash
{
  void *v2;
  BOOL v3;

  -[PKAccount oneTimeWithdrawalWithAppleCashFeatureDescriptor](self, "oneTimeWithdrawalWithAppleCashFeatureDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)oneTimeWithdrawalWithAppleCashFeatureDescriptor
{
  return -[PKAccount _savingsFeatureWithIdentifier:](self, "_savingsFeatureWithIdentifier:", CFSTR("scheduleOneTimeWithdrawalWithAppleCash"));
}

- (BOOL)supportsViewSavingsStatement
{
  void *v2;
  BOOL v3;

  -[PKAccount viewSavingsStatementFeatureDescriptor](self, "viewSavingsStatementFeatureDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)viewSavingsStatementFeatureDescriptor
{
  return -[PKAccount _savingsFeatureWithIdentifier:](self, "_savingsFeatureWithIdentifier:", CFSTR("viewStatement"));
}

- (BOOL)supportsExportSavingsTransactionData
{
  void *v2;
  BOOL v3;

  -[PKAccount exportSavingsTransactionDataFeatureDescriptor](self, "exportSavingsTransactionDataFeatureDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)exportSavingsTransactionDataFeatureDescriptor
{
  return -[PKAccount _savingsFeatureWithIdentifier:](self, "_savingsFeatureWithIdentifier:", CFSTR("exportTransactionData"));
}

- (BOOL)supportsShowSavingsAccountSummary
{
  void *v2;
  BOOL v3;

  -[PKAccount showSavingsAccountSummaryFeatureDescriptor](self, "showSavingsAccountSummaryFeatureDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)showSavingsAccountSummaryFeatureDescriptor
{
  return -[PKAccount _savingsFeatureWithIdentifier:](self, "_savingsFeatureWithIdentifier:", CFSTR("showAccountSummary"));
}

- (BOOL)supportsAddBeneficiaries
{
  void *v2;
  BOOL v3;

  -[PKAccount addBeneficiariesFeatureDescriptor](self, "addBeneficiariesFeatureDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)addBeneficiariesFeatureDescriptor
{
  return -[PKAccount _savingsFeatureWithIdentifier:](self, "_savingsFeatureWithIdentifier:", CFSTR("addBeneficiaries"));
}

- (unint64_t)supportedContactMethodForAddingBeneficiaries
{
  void *v2;
  unint64_t v3;
  unint64_t v4;

  -[PKAccount addBeneficiariesFeatureDescriptor](self, "addBeneficiariesFeatureDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "contactMethod");
  if (v3 <= 1)
    v4 = 1;
  else
    v4 = v3;

  return v4;
}

- (BOOL)supportsViewTaxDocuments
{
  void *v2;
  BOOL v3;

  -[PKAccount viewTaxDocumentsFeatureDescriptor](self, "viewTaxDocumentsFeatureDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)viewTaxDocumentsFeatureDescriptor
{
  return -[PKAccount _savingsFeatureWithIdentifier:](self, "_savingsFeatureWithIdentifier:", CFSTR("viewTaxForms"));
}

- (id)_savingsFeatureWithIdentifier:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  -[PKAccount _featureWithIdentifier:](self, "_featureWithIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (BOOL)hidePayLaterInPaymentSheet
{
  void *v2;
  BOOL v3;

  -[PKAccount hidePayLaterInPaymentSheetFeatureDescriptor](self, "hidePayLaterInPaymentSheetFeatureDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)hidePayLaterInPaymentSheetFeatureDescriptor
{
  return -[PKAccount _payLaterFeatureWithIdentifier:](self, "_payLaterFeatureWithIdentifier:", CFSTR("hidePayLaterInPaymentSheet"));
}

- (BOOL)hidePayLaterSetupInWallet
{
  void *v2;
  BOOL v3;

  -[PKAccount hidePayLaterSetupInWalletFeatureDescriptor](self, "hidePayLaterSetupInWalletFeatureDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)hidePayLaterSetupInWalletFeatureDescriptor
{
  return -[PKAccount _payLaterFeatureWithIdentifier:](self, "_payLaterFeatureWithIdentifier:", CFSTR("hidePayLaterSetupInWallet"));
}

- (BOOL)supportsDynamicReportIssueTopics
{
  void *v2;
  BOOL v3;

  -[PKAccount supportsDynamicReportIssueTopicsFeatureDescriptor](self, "supportsDynamicReportIssueTopicsFeatureDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)supportsDynamicReportIssueTopicsFeatureDescriptor
{
  return -[PKAccount _payLaterFeatureWithIdentifier:](self, "_payLaterFeatureWithIdentifier:", CFSTR("supportsDynamicReportIssueTopics"));
}

- (id)_payLaterFeatureWithIdentifier:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  -[PKAccount _featureWithIdentifier:](self, "_featureWithIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

@end
