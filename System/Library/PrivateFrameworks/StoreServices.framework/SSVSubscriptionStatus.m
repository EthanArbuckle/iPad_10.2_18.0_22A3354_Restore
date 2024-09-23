@implementation SSVSubscriptionStatus

- (void)setSubscriptionPurchaser:(BOOL)a3
{
  self->_subscriptionPurchaser = a3;
}

- (void)setSubscriptionExpirationDate:(id)a3
{
  double v4;

  objc_msgSend(a3, "timeIntervalSinceReferenceDate");
  self->_subscriptionExpirationTime = v4;
}

- (void)setSessionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void)setRawResponseData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void)setPhoneNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void)setLatestStoreTermsVersion:(unint64_t)a3
{
  self->_latestStoreTermsVersion = a3;
}

- (void)setHasOfflineSlots:(BOOL)a3
{
  self->_hasOfflineSlots = a3;
}

- (void)setHasFamilyMembers:(BOOL)a3
{
  self->_hasFamilyMembers = a3;
}

- (void)setHasFamily:(BOOL)a3
{
  self->_hasFamily = a3;
}

- (void)setFreeTrialIneligible:(BOOL)a3
{
  self->_freeTrialIneligible = a3;
}

- (void)setFamilySubscription:(BOOL)a3
{
  self->_familySubscription = a3;
}

- (void)setFamilyOrganizer:(BOOL)a3
{
  self->_familyOrganizer = a3;
}

- (void)setDiscoveryModeEligible:(BOOL)a3
{
  self->_discoveryModeEligible = a3;
}

- (void)setCellularOperatorName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setCarrierBundlingStatus:(int64_t)a3
{
  self->_carrierBundlingStatus = a3;
}

- (void)setCarrierBundlingErrorCode:(int64_t)a3
{
  self->_carrierBundlingErrorCode = a3;
}

- (void)setAccountStatus:(int64_t)a3
{
  self->_accountStatus = a3;
}

- (void)setAccountPermissions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setAccountIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setAcceptedStoreTermsVersion:(unint64_t)a3
{
  self->_acceptedStoreTermsVersion = a3;
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void)resetCarrierBundlingProperties
{
  -[SSVSubscriptionStatus setCarrierBundlingStatus:](self, "setCarrierBundlingStatus:", 0);
  -[SSVSubscriptionStatus setCarrierBundlingErrorCode:](self, "setCarrierBundlingErrorCode:", 0);
  -[SSVSubscriptionStatus setCellularOperatorName:](self, "setCellularOperatorName:", 0);
  -[SSVSubscriptionStatus setPhoneNumber:](self, "setPhoneNumber:", 0);
  -[SSVSubscriptionStatus setSessionIdentifier:](self, "setSessionIdentifier:", 0);
}

- (NSDictionary)rawResponseData
{
  return self->_rawResponseData;
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (unint64_t)latestStoreTermsVersion
{
  return self->_latestStoreTermsVersion;
}

- (BOOL)isSubscriptionPurchaser
{
  return self->_subscriptionPurchaser;
}

- (BOOL)isFreeTrialIneligible
{
  return self->_freeTrialIneligible;
}

- (BOOL)isFamilySubscription
{
  return self->_familySubscription;
}

- (BOOL)isFamilyOrganizer
{
  return self->_familyOrganizer;
}

- (BOOL)isDiscoveryModeEligible
{
  return self->_discoveryModeEligible;
}

- (SSVSubscriptionStatus)initWithUserDefaultsRepresentation:(id)a3
{
  id v4;
  SSVSubscriptionStatus *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  objc_super v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v41.receiver = self;
    v41.super_class = (Class)SSVSubscriptionStatus;
    v5 = -[SSVSubscriptionStatus init](&v41, sel_init);
    if (v5)
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("aid"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        -[SSVSubscriptionStatus setAccountIdentifier:](v5, "setAccountIdentifier:", v6);
      objc_msgSend(v4, "objectForKey:", CFSTR("astv"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        -[SSVSubscriptionStatus setAcceptedStoreTermsVersion:](v5, "setAcceptedStoreTermsVersion:", objc_msgSend(v7, "unsignedLongLongValue"));
      objc_msgSend(v4, "objectForKey:", CFSTR("cb"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        -[SSVSubscriptionStatus setCarrierBundlingStatus:](v5, "setCarrierBundlingStatus:", objc_msgSend(v8, "integerValue"));
      objc_msgSend(v4, "objectForKey:", CFSTR("cbec"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        -[SSVSubscriptionStatus setCarrierBundlingErrorCode:](v5, "setCarrierBundlingErrorCode:", objc_msgSend(v9, "integerValue"));
      objc_msgSend(v4, "objectForKey:", CFSTR("con"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        -[SSVSubscriptionStatus setCellularOperatorName:](v5, "setCellularOperatorName:", v10);
      objc_msgSend(v4, "objectForKey:", CFSTR("dm"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        -[SSVSubscriptionStatus setDiscoveryModeEligible:](v5, "setDiscoveryModeEligible:", objc_msgSend(v11, "BOOLValue"));
      objc_msgSend(v4, "objectForKey:", CFSTR("exp"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v13 = objc_alloc(MEMORY[0x1E0C99D68]);
        objc_msgSend(v12, "doubleValue");
        v14 = (void *)objc_msgSend(v13, "initWithTimeIntervalSinceReferenceDate:");
        -[SSVSubscriptionStatus setSubscriptionExpirationDate:](v5, "setSubscriptionExpirationDate:", v14);

      }
      objc_msgSend(v4, "objectForKey:", CFSTR("hoh"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        -[SSVSubscriptionStatus setFamilyOrganizer:](v5, "setFamilyOrganizer:", objc_msgSend(v15, "BOOLValue"));
      objc_msgSend(v4, "objectForKey:", CFSTR("fs"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        -[SSVSubscriptionStatus setFamilySubscription:](v5, "setFamilySubscription:", objc_msgSend(v16, "BOOLValue"));
      objc_msgSend(v4, "objectForKey:", CFSTR("ft"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        -[SSVSubscriptionStatus setFreeTrialIneligible:](v5, "setFreeTrialIneligible:", objc_msgSend(v17, "BOOLValue"));
      objc_msgSend(v4, "objectForKey:", CFSTR("hf"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        -[SSVSubscriptionStatus setHasFamily:](v5, "setHasFamily:", objc_msgSend(v18, "BOOLValue"));
      objc_msgSend(v4, "objectForKey:", CFSTR("hfm"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        -[SSVSubscriptionStatus setHasFamilyMembers:](v5, "setHasFamilyMembers:", objc_msgSend(v19, "BOOLValue"));
      objc_msgSend(v4, "objectForKey:", CFSTR("hos"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        -[SSVSubscriptionStatus setHasOfflineSlots:](v5, "setHasOfflineSlots:", objc_msgSend(v20, "BOOLValue"));
      objc_msgSend(v4, "objectForKey:", CFSTR("lstv"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        -[SSVSubscriptionStatus setLatestStoreTermsVersion:](v5, "setLatestStoreTermsVersion:", objc_msgSend(v21, "unsignedLongLongValue"));
      objc_msgSend(v4, "objectForKey:", CFSTR("pn"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        -[SSVSubscriptionStatus setPhoneNumber:](v5, "setPhoneNumber:", v22);
      objc_msgSend(v4, "objectForKey:", CFSTR("pur"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        -[SSVSubscriptionStatus setSubscriptionPurchaser:](v5, "setSubscriptionPurchaser:", objc_msgSend(v23, "BOOLValue"));
      objc_msgSend(v4, "objectForKey:", CFSTR("sid"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        -[SSVSubscriptionStatus setSessionIdentifier:](v5, "setSessionIdentifier:", v24);
      objc_msgSend(v4, "objectForKey:", CFSTR("ast"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[SSVSubscriptionStatus setAccountStatus:](v5, "setAccountStatus:", objc_msgSend(v25, "integerValue"));
      }
      else
      {
        objc_msgSend(v4, "objectForKey:", CFSTR("sb"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          -[SSVSubscriptionStatus _setSubscribed:](v5, "_setSubscribed:", objc_msgSend(v26, "BOOLValue"));
        v25 = v26;
      }
      objc_msgSend(v4, "objectForKey:", CFSTR("prms"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v28 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v37 = 0u;
        v38 = 0u;
        v39 = 0u;
        v40 = 0u;
        v29 = v27;
        v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
        if (v30)
        {
          v31 = v30;
          v32 = *(_QWORD *)v38;
          do
          {
            v33 = 0;
            do
            {
              if (*(_QWORD *)v38 != v32)
                objc_enumerationMutation(v29);
              v34 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * v33);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                objc_msgSend(v28, "addObject:", v34, (_QWORD)v37);
              ++v33;
            }
            while (v31 != v33);
            v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
          }
          while (v31);
        }

        -[SSVSubscriptionStatus setAccountPermissions:](v5, "setAccountPermissions:", v28);
      }
      objc_msgSend(v4, "objectForKey:", CFSTR("raw"), (_QWORD)v37);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        -[SSVSubscriptionStatus setRawResponseData:](v5, "setRawResponseData:", v35);

    }
  }
  else
  {

    v5 = 0;
  }

  return v5;
}

- (BOOL)hasOfflineSlots
{
  return self->_hasOfflineSlots;
}

- (BOOL)hasFamily
{
  return self->_hasFamily;
}

- (BOOL)hasFamilyMembers
{
  return self->_hasFamilyMembers;
}

- (id)copyWithZone:(_NSZone *)a3
{
  double *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (double *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[SSVSubscriptionStatus accountIdentifier](self, "accountIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccountIdentifier:", v5);

  -[SSVSubscriptionStatus accountPermissions](self, "accountPermissions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccountPermissions:", v6);

  objc_msgSend(v4, "setAccountStatus:", -[SSVSubscriptionStatus accountStatus](self, "accountStatus"));
  objc_msgSend(v4, "setAcceptedStoreTermsVersion:", -[SSVSubscriptionStatus acceptedStoreTermsVersion](self, "acceptedStoreTermsVersion"));
  objc_msgSend(v4, "setCarrierBundlingStatus:", -[SSVSubscriptionStatus carrierBundlingStatus](self, "carrierBundlingStatus"));
  objc_msgSend(v4, "setCarrierBundlingErrorCode:", -[SSVSubscriptionStatus carrierBundlingErrorCode](self, "carrierBundlingErrorCode"));
  -[SSVSubscriptionStatus cellularOperatorName](self, "cellularOperatorName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCellularOperatorName:", v7);

  objc_msgSend(v4, "setDiscoveryModeEligible:", -[SSVSubscriptionStatus isDiscoveryModeEligible](self, "isDiscoveryModeEligible"));
  objc_msgSend(v4, "setFamilyOrganizer:", -[SSVSubscriptionStatus isFamilyOrganizer](self, "isFamilyOrganizer"));
  objc_msgSend(v4, "setFamilySubscription:", -[SSVSubscriptionStatus isFamilySubscription](self, "isFamilySubscription"));
  objc_msgSend(v4, "setFreeTrialIneligible:", -[SSVSubscriptionStatus isFreeTrialIneligible](self, "isFreeTrialIneligible"));
  objc_msgSend(v4, "setHasFamily:", -[SSVSubscriptionStatus hasFamily](self, "hasFamily"));
  objc_msgSend(v4, "setHasFamilyMembers:", -[SSVSubscriptionStatus hasFamilyMembers](self, "hasFamilyMembers"));
  objc_msgSend(v4, "setHasOfflineSlots:", -[SSVSubscriptionStatus hasOfflineSlots](self, "hasOfflineSlots"));
  objc_msgSend(v4, "setLatestStoreTermsVersion:", -[SSVSubscriptionStatus latestStoreTermsVersion](self, "latestStoreTermsVersion"));
  -[SSVSubscriptionStatus phoneNumber](self, "phoneNumber");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPhoneNumber:", v8);

  -[SSVSubscriptionStatus rawResponseData](self, "rawResponseData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRawResponseData:", v9);

  -[SSVSubscriptionStatus sessionIdentifier](self, "sessionIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSessionIdentifier:", v10);

  v4[12] = self->_subscriptionExpirationTime;
  objc_msgSend(v4, "setSubscriptionPurchaser:", -[SSVSubscriptionStatus isSubscriptionPurchaser](self, "isSubscriptionPurchaser"));
  return v4;
}

- (NSString)cellularOperatorName
{
  return self->_cellularOperatorName;
}

- (int64_t)carrierBundlingStatus
{
  return self->_carrierBundlingStatus;
}

- (int64_t)carrierBundlingErrorCode
{
  return self->_carrierBundlingErrorCode;
}

- (int64_t)accountStatus
{
  return self->_accountStatus;
}

- (NSArray)accountPermissions
{
  return self->_accountPermissions;
}

- (NSNumber)accountIdentifier
{
  return self->_accountIdentifier;
}

- (unint64_t)acceptedStoreTermsVersion
{
  return self->_acceptedStoreTermsVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_rawResponseData, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_cellularOperatorName, 0);
  objc_storeStrong((id *)&self->_accountPermissions, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

- (BOOL)isSubscribed
{
  return self->_accountStatus == 3;
}

- (NSDate)subscriptionExpirationDate
{
  void *v2;

  if (self->_subscriptionExpirationTime <= 2.22044605e-16)
  {
    v2 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSDate *)v2;
}

- (NSString)description
{
  unint64_t accountStatus;
  __CFString *v4;
  unint64_t carrierBundlingStatus;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  accountStatus = self->_accountStatus;
  if (accountStatus > 4)
    v4 = 0;
  else
    v4 = off_1E47BF4D0[accountStatus];
  carrierBundlingStatus = self->_carrierBundlingStatus;
  if (carrierBundlingStatus > 4)
    v6 = 0;
  else
    v6 = off_1E47BF4F8[carrierBundlingStatus];
  v7 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)SSVSubscriptionStatus;
  -[SSVSubscriptionStatus description](&v11, sel_description);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ accountIdentifier %@ accountStatus %@ carrierBundlingStatus: %@"), v8, self->_accountIdentifier, v4, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (id)copyUserDefaultsRepresentation
{
  id v3;
  void *v4;
  NSNumber *accountIdentifier;
  NSArray *accountPermissions;
  NSString *cellularOperatorName;
  NSString *phoneNumber;
  NSString *sessionIdentifier;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSDictionary *rawResponseData;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = v3;
  accountIdentifier = self->_accountIdentifier;
  if (accountIdentifier)
    objc_msgSend(v3, "setObject:forKey:", accountIdentifier, CFSTR("aid"));
  accountPermissions = self->_accountPermissions;
  if (accountPermissions)
    objc_msgSend(v4, "setObject:forKey:", accountPermissions, CFSTR("prms"));
  cellularOperatorName = self->_cellularOperatorName;
  if (cellularOperatorName)
    objc_msgSend(v4, "setObject:forKey:", cellularOperatorName, CFSTR("con"));
  phoneNumber = self->_phoneNumber;
  if (phoneNumber)
    objc_msgSend(v4, "setObject:forKey:", phoneNumber, CFSTR("pn"));
  sessionIdentifier = self->_sessionIdentifier;
  if (sessionIdentifier)
    objc_msgSend(v4, "setObject:forKey:", sessionIdentifier, CFSTR("sid"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_accountStatus);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("ast"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_acceptedStoreTermsVersion);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("astv"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_carrierBundlingStatus);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("cb"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_carrierBundlingErrorCode);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("cbec"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_discoveryModeEligible);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("dm"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_subscriptionExpirationTime);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("exp"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_familyOrganizer);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("hoh"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_familySubscription);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("fs"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_freeTrialIneligible);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("ft"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hasFamily);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("hf"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hasFamilyMembers);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("hfm"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hasOfflineSlots);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v21, CFSTR("hos"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_latestStoreTermsVersion);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v22, CFSTR("lstv"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_subscriptionPurchaser);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v23, CFSTR("pur"));

  rawResponseData = self->_rawResponseData;
  if (rawResponseData)
    objc_msgSend(v4, "setObject:forKey:", rawResponseData, CFSTR("raw"));
  return v4;
}

- (void)resetAccountBasedProperties
{
  -[SSVSubscriptionStatus setAccountIdentifier:](self, "setAccountIdentifier:", 0);
  -[SSVSubscriptionStatus setAccountPermissions:](self, "setAccountPermissions:", 0);
  -[SSVSubscriptionStatus setAccountStatus:](self, "setAccountStatus:", 0);
  -[SSVSubscriptionStatus setFamilyOrganizer:](self, "setFamilyOrganizer:", 0);
  -[SSVSubscriptionStatus setFamilySubscription:](self, "setFamilySubscription:", 0);
  -[SSVSubscriptionStatus setFreeTrialIneligible:](self, "setFreeTrialIneligible:", 0);
  -[SSVSubscriptionStatus setHasFamily:](self, "setHasFamily:", 0);
  -[SSVSubscriptionStatus setHasFamilyMembers:](self, "setHasFamilyMembers:", 0);
  -[SSVSubscriptionStatus setHasOfflineSlots:](self, "setHasOfflineSlots:", 0);
  -[SSVSubscriptionStatus setSubscriptionExpirationDate:](self, "setSubscriptionExpirationDate:", 0);
  -[SSVSubscriptionStatus setAcceptedStoreTermsVersion:](self, "setAcceptedStoreTermsVersion:", 0);
  -[SSVSubscriptionStatus setLatestStoreTermsVersion:](self, "setLatestStoreTermsVersion:", 0);
  -[SSVSubscriptionStatus setSubscriptionPurchaser:](self, "setSubscriptionPurchaser:", 0);
}

- (void)setValuesUsingStatusDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  SSVSubscriptionStatus *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  SSVSubscriptionStatus *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SSVSubscriptionStatus setRawResponseData:](self, "setRawResponseData:", v4);
  objc_msgSend(v4, "objectForKey:", CFSTR("music"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v5 = 0;
  }
  objc_msgSend(v5, "objectForKey:", CFSTR("reason"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  objc_msgSend(v5, "objectForKey:", CFSTR("expirationDate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = objc_msgSend(v8, "unsignedLongLongValue");
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_12;
    v9 = strtoull((const char *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String"), 0, 10);
  }
  if (v9)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSince1970:", (double)v9 / 1000.0);
    -[SSVSubscriptionStatus setSubscriptionExpirationDate:](self, "setSubscriptionExpirationDate:", v10);

  }
LABEL_12:
  v40 = v8;
  objc_msgSend(v5, "objectForKey:", CFSTR("isPurchaser"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[SSVSubscriptionStatus setSubscriptionPurchaser:](self, "setSubscriptionPurchaser:", objc_msgSend(v11, "BOOLValue"));
  objc_msgSend(v5, "objectForKey:", CFSTR("hasOfflineSlots"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[SSVSubscriptionStatus setHasOfflineSlots:](self, "setHasOfflineSlots:", objc_msgSend(v12, "BOOLValue"));
  objc_msgSend(v5, "objectForKey:", CFSTR("isNotEligibleForFreeTrial"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[SSVSubscriptionStatus setFreeTrialIneligible:](self, "setFreeTrialIneligible:", objc_msgSend(v13, "BOOLValue"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "objectForKey:", CFSTR("status"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }
  objc_opt_class();
  v42 = v14;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("isFuseEnabled"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[SSVSubscriptionStatus setAccountStatus:](self, "setAccountStatus:", 3);

    v14 = v42;
    goto LABEL_43;
  }
  if (objc_msgSend(v14, "isEqualToString:", CFSTR("Enabled")))
  {
    -[SSVSubscriptionStatus setAccountStatus:](self, "setAccountStatus:", 3);
    objc_msgSend(v5, "objectForKey:", CFSTR("source"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if ((objc_msgSend(v15, "isEqualToString:", CFSTR("Apple")) & 1) != 0)
        goto LABEL_28;
      if ((objc_msgSend(v15, "isEqualToString:", CFSTR("Carrier")) & 1) != 0)
      {
LABEL_27:
        -[SSVSubscriptionStatus setCarrierBundlingStatus:](self, "setCarrierBundlingStatus:", 1);
        goto LABEL_28;
      }
    }
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("Carrier")))
      goto LABEL_27;
LABEL_28:
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("Family")))
      -[SSVSubscriptionStatus setFamilySubscription:](self, "setFamilySubscription:", 1);

    goto LABEL_43;
  }
  if (objc_msgSend(v14, "isEqualToString:", CFSTR("Glide")))
  {
    v17 = self;
    v18 = 4;
  }
  else
  {
    if (!objc_msgSend(v14, "isEqualToString:", CFSTR("Disabled")))
    {
      if (objc_msgSend(v14, "isEqualToString:", CFSTR("Discovery")))
      {
        -[SSVSubscriptionStatus setDiscoveryModeEligible:](self, "setDiscoveryModeEligible:", 1);
      }
      else if (objc_msgSend(v14, "isEqualToString:", CFSTR("Unlinked")))
      {
        -[SSVSubscriptionStatus setCarrierBundlingStatus:](self, "setCarrierBundlingStatus:", 4);
      }
      goto LABEL_43;
    }
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("InvalidToken")))
    {
      v17 = self;
      v18 = 1;
    }
    else
    {
      v17 = self;
      v18 = 2;
    }
  }
  -[SSVSubscriptionStatus setAccountStatus:](v17, "setAccountStatus:", v18);
LABEL_43:
  objc_msgSend(v4, "objectForKey:", CFSTR("family"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v43 = v19;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v19, "objectForKey:", CFSTR("hasFamily"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[SSVSubscriptionStatus setHasFamily:](self, "setHasFamily:", objc_msgSend(v20, "BOOLValue"));
    objc_msgSend(v19, "objectForKey:", CFSTR("hasFamilyGreaterThanOneMember"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[SSVSubscriptionStatus setHasFamilyMembers:](self, "setHasFamilyMembers:", objc_msgSend(v21, "BOOLValue"));
    objc_msgSend(v19, "objectForKey:", CFSTR("isHoH"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[SSVSubscriptionStatus setFamilyOrganizer:](self, "setFamilyOrganizer:", objc_msgSend(v22, "BOOLValue"));

    v14 = v42;
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("terms"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v41 = v7;
  v39 = v23;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v30 = 0;
    v25 = 0;
    goto LABEL_76;
  }
  v38 = v13;
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v24 = v23;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
  if (!v25)
  {
    v30 = 0;
    v31 = v24;
    goto LABEL_75;
  }
  v36 = self;
  v37 = v4;
  v26 = *(_QWORD *)v45;
LABEL_54:
  v27 = 0;
  while (1)
  {
    if (*(_QWORD *)v45 != v26)
      objc_enumerationMutation(v24);
    v28 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v27);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_60;
    objc_msgSend(v28, "objectForKey:", CFSTR("type"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v29, "compare:options:", CFSTR("Store"), 1))
      break;

LABEL_60:
    if (v25 == ++v27)
    {
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
      if (v25)
        goto LABEL_54;
      v30 = 0;
      v31 = v24;
      self = v36;
      v4 = v37;
      goto LABEL_74;
    }
  }
  v31 = v28;

  if (!v31)
  {
    v30 = 0;
    v25 = 0;
    self = v36;
    v4 = v37;
    v13 = v38;
    v14 = v42;
    goto LABEL_76;
  }
  objc_msgSend(v31, "objectForKey:", CFSTR("agreedToTerms"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  self = v36;
  v4 = v37;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v30 = objc_msgSend(v32, "unsignedLongLongValue");
  else
    v30 = 0;
  objc_msgSend(v31, "objectForKey:", CFSTR("latestTerms"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    v25 = objc_msgSend(v33, "unsignedLongLongValue");
  else
    v25 = 0;

LABEL_74:
  v14 = v42;
LABEL_75:

  v13 = v38;
LABEL_76:
  -[SSVSubscriptionStatus setAcceptedStoreTermsVersion:](self, "setAcceptedStoreTermsVersion:", v30);
  -[SSVSubscriptionStatus setLatestStoreTermsVersion:](self, "setLatestStoreTermsVersion:", v25);
  objc_msgSend(v5, "objectForKey:", CFSTR("isAdmin"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v34, "BOOLValue"))
  {
    v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CFSTR("admin"), CFSTR("social"), 0);
    -[SSVSubscriptionStatus setAccountPermissions:](self, "setAccountPermissions:", v35);

    v14 = v42;
  }

}

- (BOOL)isEqualToStatus:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  char v7;

  v4 = a3;
  -[SSVSubscriptionStatus rawResponseData](self, "rawResponseData");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rawResponseData");
  v6 = objc_claimAutoreleasedReturnValue();

  v7 = (v5 | v6) == 0;
  if (v6)
    v7 = objc_msgSend((id)v5, "isEqualToDictionary:", v6);

  return v7;
}

- (SSVSubscriptionStatus)initWithXPCEncoding:(id)a3
{
  id v4;
  void *v5;
  SSVSubscriptionStatus *v6;
  uint64_t v8;
  uint64_t v9;
  NSNumber *accountIdentifier;
  uint64_t v11;
  uint64_t v12;
  NSString *cellularOperatorName;
  uint64_t v14;
  uint64_t v15;
  NSString *phoneNumber;
  uint64_t v17;
  uint64_t v18;
  NSDictionary *rawResponseData;
  uint64_t v20;
  uint64_t v21;
  NSString *sessionIdentifier;
  void *v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  NSArray *accountPermissions;
  objc_super v28;

  v4 = a3;
  v5 = v4;
  if (v4 && MEMORY[0x1A85863E4](v4) == MEMORY[0x1E0C812F8])
  {
    v28.receiver = self;
    v28.super_class = (Class)SSVSubscriptionStatus;
    v6 = -[SSVSubscriptionStatus init](&v28, sel_init);
    if (v6)
    {
      v8 = objc_opt_class();
      v9 = SSXPCDictionaryCopyObjectWithClass(v5, "0", v8);
      accountIdentifier = v6->_accountIdentifier;
      v6->_accountIdentifier = (NSNumber *)v9;

      v6->_accountStatus = xpc_dictionary_get_int64(v5, "1");
      v6->_acceptedStoreTermsVersion = xpc_dictionary_get_uint64(v5, "13");
      v6->_carrierBundlingStatus = xpc_dictionary_get_int64(v5, "2");
      v6->_carrierBundlingErrorCode = xpc_dictionary_get_int64(v5, "19");
      v11 = objc_opt_class();
      v12 = SSXPCDictionaryCopyObjectWithClass(v5, "4", v11);
      cellularOperatorName = v6->_cellularOperatorName;
      v6->_cellularOperatorName = (NSString *)v12;

      v6->_discoveryModeEligible = xpc_dictionary_get_BOOL(v5, "3");
      v6->_familyOrganizer = xpc_dictionary_get_BOOL(v5, "9");
      v6->_familySubscription = xpc_dictionary_get_BOOL(v5, "8");
      v6->_freeTrialIneligible = xpc_dictionary_get_BOOL(v5, "18");
      v6->_hasFamily = xpc_dictionary_get_BOOL(v5, "10");
      v6->_hasFamilyMembers = xpc_dictionary_get_BOOL(v5, "11");
      v6->_hasOfflineSlots = xpc_dictionary_get_BOOL(v5, "16");
      v6->_latestStoreTermsVersion = xpc_dictionary_get_uint64(v5, "14");
      v14 = objc_opt_class();
      v15 = SSXPCDictionaryCopyObjectWithClass(v5, "5", v14);
      phoneNumber = v6->_phoneNumber;
      v6->_phoneNumber = (NSString *)v15;

      v17 = objc_opt_class();
      v18 = SSXPCDictionaryCopyObjectWithClass(v5, "17", v17);
      rawResponseData = v6->_rawResponseData;
      v6->_rawResponseData = (NSDictionary *)v18;

      v20 = objc_opt_class();
      v21 = SSXPCDictionaryCopyObjectWithClass(v5, "6", v20);
      sessionIdentifier = v6->_sessionIdentifier;
      v6->_sessionIdentifier = (NSString *)v21;

      v6->_subscriptionExpirationTime = xpc_dictionary_get_double(v5, "12");
      v6->_subscriptionPurchaser = xpc_dictionary_get_BOOL(v5, "15");
      xpc_dictionary_get_value(v5, "7");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_opt_class();
      v25 = SSXPCCreateNSArrayFromCFTypeArray(v23, v24);
      v26 = objc_msgSend(v25, "copy");
      accountPermissions = v6->_accountPermissions;
      v6->_accountPermissions = (NSArray *)v26;

    }
  }
  else
  {

    v6 = 0;
  }

  return v6;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3;

  v3 = xpc_dictionary_create(0, 0, 0);
  SSXPCDictionarySetObject(v3, "0", self->_accountIdentifier);
  SSXPCDictionarySetObject(v3, "7", self->_accountPermissions);
  xpc_dictionary_set_int64(v3, "1", -[SSVSubscriptionStatus accountStatus](self, "accountStatus"));
  xpc_dictionary_set_uint64(v3, "13", self->_acceptedStoreTermsVersion);
  xpc_dictionary_set_int64(v3, "2", -[SSVSubscriptionStatus carrierBundlingStatus](self, "carrierBundlingStatus"));
  xpc_dictionary_set_int64(v3, "19", -[SSVSubscriptionStatus carrierBundlingErrorCode](self, "carrierBundlingErrorCode"));
  SSXPCDictionarySetObject(v3, "4", self->_cellularOperatorName);
  xpc_dictionary_set_BOOL(v3, "3", -[SSVSubscriptionStatus isDiscoveryModeEligible](self, "isDiscoveryModeEligible"));
  xpc_dictionary_set_BOOL(v3, "9", -[SSVSubscriptionStatus isFamilyOrganizer](self, "isFamilyOrganizer"));
  xpc_dictionary_set_BOOL(v3, "8", -[SSVSubscriptionStatus isFamilySubscription](self, "isFamilySubscription"));
  xpc_dictionary_set_BOOL(v3, "18", -[SSVSubscriptionStatus isFreeTrialIneligible](self, "isFreeTrialIneligible"));
  xpc_dictionary_set_BOOL(v3, "10", -[SSVSubscriptionStatus hasFamily](self, "hasFamily"));
  xpc_dictionary_set_BOOL(v3, "11", -[SSVSubscriptionStatus hasFamilyMembers](self, "hasFamilyMembers"));
  xpc_dictionary_set_BOOL(v3, "16", -[SSVSubscriptionStatus hasOfflineSlots](self, "hasOfflineSlots"));
  xpc_dictionary_set_uint64(v3, "14", self->_latestStoreTermsVersion);
  SSXPCDictionarySetObject(v3, "5", self->_phoneNumber);
  SSXPCDictionarySetObject(v3, "17", self->_rawResponseData);
  SSXPCDictionarySetObject(v3, "6", self->_sessionIdentifier);
  xpc_dictionary_set_double(v3, "12", self->_subscriptionExpirationTime);
  xpc_dictionary_set_BOOL(v3, "15", self->_subscriptionPurchaser);
  return v3;
}

- (void)_setSubscribed:(BOOL)a3
{
  uint64_t v3;

  if (a3)
    v3 = 3;
  else
    v3 = 2;
  -[SSVSubscriptionStatus setAccountStatus:](self, "setAccountStatus:", v3);
}

- (BOOL)hasOfflineSlot
{
  return self->_hasOfflineSlot;
}

@end
