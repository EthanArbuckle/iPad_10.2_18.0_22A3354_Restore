@implementation SUScriptSubscriptionStatusResponse

- (SUScriptSubscriptionStatusResponse)initWithSubscriptionStatus:(id)a3 isFinal:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  SUScriptSubscriptionStatusResponse *v7;
  void *v8;
  uint64_t v9;
  NSString *sessionIdentifier;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSString *v15;
  void *v16;
  void *v17;
  void *v18;
  NSString *accountStatus;
  unint64_t v20;
  unint64_t v21;
  __CFString *v22;
  NSString *carrierBundlingStatus;
  uint64_t v24;
  NSNumber *carrierBundlingErrorCode;
  void *v26;
  void *v27;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  uint64_t v34;
  void *i;
  void *v36;
  uint64_t v37;
  NSNumber *acceptedStoreTermsVersion;
  uint64_t v39;
  NSNumber *latestStoreTermsVersion;
  _BOOL4 v41;
  uint64_t v42;
  uint64_t v43;
  NSString *eligibilityStatus;
  void *v45;
  SUScriptDictionary *v46;
  void *v47;
  _BOOL4 v49;
  unint64_t v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  objc_super v55;
  _BYTE v56[128];
  uint64_t v57;

  v4 = a4;
  v57 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v55.receiver = self;
  v55.super_class = (Class)SUScriptSubscriptionStatusResponse;
  v7 = -[SUScriptObject init](&v55, sel_init);
  if (!v7)
    goto LABEL_60;
  objc_msgSend(v6, "sessionIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "copy");
  sessionIdentifier = v7->_sessionIdentifier;
  v7->_sessionIdentifier = (NSString *)v9;

  v11 = objc_msgSend(v6, "statusType");
  v12 = objc_msgSend(v6, "reasonType");
  if (v11 == 2)
  {
    if (v12 == 4)
      -[SUScriptSubscriptionStatusResponse accountStatusNeedsAuthentication](v7, "accountStatusNeedsAuthentication");
    else
      -[SUScriptSubscriptionStatusResponse accountStatusNotSubscribed](v7, "accountStatusNotSubscribed");
    v13 = objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  if (v11 != 1)
  {
    if (v11)
    {
LABEL_12:
      v16 = (void *)*MEMORY[0x24BDBD270];
      v17 = (void *)*MEMORY[0x24BDBD268];
      v18 = (void *)*MEMORY[0x24BDBD268];
      goto LABEL_13;
    }
    -[SUScriptSubscriptionStatusResponse accountStatusUnknown](v7, "accountStatusUnknown");
    v13 = objc_claimAutoreleasedReturnValue();
LABEL_11:
    accountStatus = v7->_accountStatus;
    v7->_accountStatus = (NSString *)v13;

    goto LABEL_12;
  }
  -[SUScriptSubscriptionStatusResponse accountStatusSubscribed](v7, "accountStatusSubscribed");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v7->_accountStatus;
  v7->_accountStatus = (NSString *)v14;

  v16 = (void *)*MEMORY[0x24BDBD270];
  v17 = (void *)*MEMORY[0x24BDBD268];
  v18 = (void *)*MEMORY[0x24BDBD270];
LABEL_13:
  objc_storeStrong(&v7->_subscribed, v18);
  v20 = objc_msgSend(v6, "carrierBundlingStatusType");
  v21 = v20;
  if (v20 <= 4)
  {
    v22 = *off_24DE7D7F8[v20];
    carrierBundlingStatus = v7->_carrierBundlingStatus;
    v7->_carrierBundlingStatus = &v22->isa;

  }
  v50 = v21;
  v49 = v4;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v6, "carrierBundlingErrorCode"));
  v24 = objc_claimAutoreleasedReturnValue();
  carrierBundlingErrorCode = v7->_carrierBundlingErrorCode;
  v7->_carrierBundlingErrorCode = (NSNumber *)v24;

  if (objc_msgSend(v6, "isDiscoveryModeEligible"))
    v26 = v16;
  else
    v26 = v17;
  objc_storeStrong(&v7->_discoveryModeEligible, v26);
  if (objc_msgSend(v6, "isHeadOfHousehold"))
    v27 = v16;
  else
    v27 = v17;
  objc_storeStrong(&v7->_familyOrganizer, v27);
  if (v12 == 2 && v11 == 1)
    v29 = v16;
  else
    v29 = v17;
  objc_storeStrong(&v7->_familySubscription, v29);
  if (objc_msgSend(v6, "hasFamily"))
    v30 = v16;
  else
    v30 = v17;
  objc_storeStrong(&v7->_hasFamily, v30);
  if (objc_msgSend(v6, "hasFamilyGreaterThanOneMember"))
    v31 = v16;
  else
    v31 = v17;
  objc_storeStrong(&v7->_hasFamilyMembers, v31);
  objc_msgSend(v6, "termsStatusList");
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v32 = (id)objc_claimAutoreleasedReturnValue();
  v33 = (id)objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
  if (v33)
  {
    v34 = *(_QWORD *)v52;
    while (2)
    {
      for (i = 0; i != v33; i = (char *)i + 1)
      {
        if (*(_QWORD *)v52 != v34)
          objc_enumerationMutation(v32);
        v36 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v36, "type") == 1)
        {
          v33 = v36;
          goto LABEL_43;
        }
      }
      v33 = (id)objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
      if (v33)
        continue;
      break;
    }
  }
LABEL_43:

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v33, "acceptedVersion"));
  v37 = objc_claimAutoreleasedReturnValue();
  acceptedStoreTermsVersion = v7->_acceptedStoreTermsVersion;
  v7->_acceptedStoreTermsVersion = (NSNumber *)v37;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v33, "currentVersion"));
  v39 = objc_claimAutoreleasedReturnValue();
  latestStoreTermsVersion = v7->_latestStoreTermsVersion;
  v7->_latestStoreTermsVersion = (NSNumber *)v39;

  if (v11 == 1 || v50 - 1 <= 1)
  {
    -[SUScriptSubscriptionStatusResponse eligibilityStatusEligible](v7, "eligibilityStatusEligible");
    v43 = objc_claimAutoreleasedReturnValue();
    eligibilityStatus = v7->_eligibilityStatus;
    v7->_eligibilityStatus = (NSString *)v43;
    v41 = v49;
  }
  else
  {
    v41 = v49;
    if (v11 == 2 && v50 == 3)
    {
      -[SUScriptSubscriptionStatusResponse eligibilityStatusNotEligible](v7, "eligibilityStatusNotEligible");
      v42 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[SUScriptSubscriptionStatusResponse eligibilityStatusUnknown](v7, "eligibilityStatusUnknown");
      v42 = objc_claimAutoreleasedReturnValue();
    }
    eligibilityStatus = v7->_eligibilityStatus;
    v7->_eligibilityStatus = (NSString *)v42;
  }

  objc_msgSend(v6, "responseDictionary");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  if (v45)
    v46 = -[SUScriptDictionary initWithDictionary:]([SUScriptDictionary alloc], "initWithDictionary:", v45);
  else
    v46 = 0;
  objc_storeStrong((id *)&v7->_rawResponseData, v46);
  if (v45)

  if (v41)
    v47 = v16;
  else
    v47 = v17;
  objc_storeStrong(&v7->_final, v47);

LABEL_60:
  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  NSInteger v8;
  NSInteger v9;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  uint64_t v17;

  v3 = -[NSNumber unsignedLongLongValue](self->_acceptedStoreTermsVersion, "unsignedLongLongValue");
  v4 = -[NSString hash](self->_sessionIdentifier, "hash") ^ v3;
  v5 = v4 ^ -[NSString hash](self->_accountStatus, "hash");
  v6 = v5 ^ objc_msgSend(self->_subscribed, "BOOLValue");
  v7 = -[NSString hash](self->_carrierBundlingStatus, "hash");
  v8 = v7 ^ -[NSNumber integerValue](self->_carrierBundlingErrorCode, "integerValue");
  v9 = v6 ^ v8 ^ objc_msgSend(self->_discoveryModeEligible, "BOOLValue");
  v10 = -[NSString hash](self->_eligibilityStatus, "hash");
  v11 = v10 ^ objc_msgSend(self->_familyOrganizer, "BOOLValue");
  v12 = v9 ^ v11 ^ objc_msgSend(self->_familySubscription, "BOOLValue");
  v13 = objc_msgSend(self->_hasFamily, "BOOLValue");
  v14 = v13 ^ objc_msgSend(self->_hasFamilyMembers, "BOOLValue");
  v15 = v14 ^ -[NSNumber unsignedLongLongValue](self->_latestStoreTermsVersion, "unsignedLongLongValue");
  -[SUScriptDictionary dictionary](self->_rawResponseData, "dictionary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v12 ^ v15 ^ objc_msgSend(v16, "hash");

  return v17 ^ objc_msgSend(self->_final, "BOOLValue");
}

- (BOOL)isEqual:(id)a3
{
  SUScriptSubscriptionStatusResponse *v4;
  SUScriptSubscriptionStatusResponse *v5;
  unint64_t v6;
  NSString *sessionIdentifier;
  NSString *accountStatus;
  int v9;
  NSString *carrierBundlingStatus;
  int v11;
  NSString *eligibilityStatus;
  int v13;
  int v14;
  int v15;
  int v16;
  unint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  int v24;
  int v26;

  v4 = (SUScriptSubscriptionStatusResponse *)a3;
  if (self == v4)
  {
    LOBYTE(v24) = 1;
    goto LABEL_26;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    LOBYTE(v24) = 0;
    goto LABEL_26;
  }
  v5 = v4;
  v6 = -[NSNumber unsignedLongLongValue](self->_acceptedStoreTermsVersion, "unsignedLongLongValue");
  if (v6 != -[NSNumber unsignedLongLongValue](v5->_acceptedStoreTermsVersion, "unsignedLongLongValue"))
    goto LABEL_22;
  sessionIdentifier = self->_sessionIdentifier;
  if (sessionIdentifier != v5->_sessionIdentifier
    && !-[NSString isEqualToString:](sessionIdentifier, "isEqualToString:"))
  {
    goto LABEL_22;
  }
  accountStatus = self->_accountStatus;
  if (accountStatus != v5->_accountStatus && !-[NSString isEqualToString:](accountStatus, "isEqualToString:"))
    goto LABEL_22;
  v9 = objc_msgSend(self->_subscribed, "BOOLValue");
  if (v9 != objc_msgSend(v5->_subscribed, "BOOLValue"))
    goto LABEL_22;
  carrierBundlingStatus = self->_carrierBundlingStatus;
  if (carrierBundlingStatus != v5->_carrierBundlingStatus
    && !-[NSString isEqualToString:](carrierBundlingStatus, "isEqualToString:"))
  {
    goto LABEL_22;
  }
  if (self->_carrierBundlingErrorCode != v5->_carrierBundlingErrorCode)
    goto LABEL_22;
  v11 = objc_msgSend(self->_discoveryModeEligible, "BOOLValue");
  if (v11 != objc_msgSend(v5->_discoveryModeEligible, "BOOLValue"))
    goto LABEL_22;
  eligibilityStatus = self->_eligibilityStatus;
  if (eligibilityStatus != v5->_eligibilityStatus
    && !-[NSString isEqualToString:](eligibilityStatus, "isEqualToString:"))
  {
    goto LABEL_22;
  }
  v13 = objc_msgSend(self->_familyOrganizer, "BOOLValue");
  if (v13 != objc_msgSend(v5->_familyOrganizer, "BOOLValue"))
    goto LABEL_22;
  v14 = objc_msgSend(self->_familySubscription, "BOOLValue");
  if (v14 != objc_msgSend(v5->_familySubscription, "BOOLValue"))
    goto LABEL_22;
  v15 = objc_msgSend(self->_hasFamily, "BOOLValue");
  if (v15 != objc_msgSend(v5->_hasFamily, "BOOLValue"))
    goto LABEL_22;
  v16 = objc_msgSend(self->_hasFamilyMembers, "BOOLValue");
  if (v16 != objc_msgSend(v5->_hasFamilyMembers, "BOOLValue"))
    goto LABEL_22;
  v17 = -[NSNumber unsignedLongLongValue](self->_latestStoreTermsVersion, "unsignedLongLongValue");
  if (v17 != -[NSNumber unsignedLongLongValue](v5->_latestStoreTermsVersion, "unsignedLongLongValue"))
    goto LABEL_22;
  -[SUScriptDictionary dictionary](self->_rawResponseData, "dictionary");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUScriptDictionary dictionary](v5->_rawResponseData, "dictionary");
  v19 = objc_claimAutoreleasedReturnValue();
  if (v18 == (void *)v19)
  {

    goto LABEL_28;
  }
  v20 = (void *)v19;
  -[SUScriptDictionary dictionary](self->_rawResponseData, "dictionary");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUScriptDictionary dictionary](v5->_rawResponseData, "dictionary");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v21, "isEqualToDictionary:", v22);

  if (v23)
  {
LABEL_28:
    v26 = objc_msgSend(self->_final, "BOOLValue");
    v24 = v26 ^ objc_msgSend(v5->_final, "BOOLValue") ^ 1;
    goto LABEL_23;
  }
LABEL_22:
  LOBYTE(v24) = 0;
LABEL_23:

LABEL_26:
  return v24;
}

- (id)_className
{
  return CFSTR("iTunesSubscriptionStatusResponse");
}

- (NSString)accountIdentifier
{
  return (NSString *)&stru_24DE83F60;
}

- (NSString)accountStatusNeedsAuthentication
{
  return (NSString *)CFSTR("needsAuthentication");
}

- (NSString)accountStatusNotSubscribed
{
  return (NSString *)CFSTR("notSubscribed");
}

- (NSString)accountStatusSubscribed
{
  return (NSString *)CFSTR("subscribed");
}

- (NSString)accountStatusUnknown
{
  return (NSString *)CFSTR("unknown");
}

- (NSString)eligibilityStatusEligible
{
  return (NSString *)CFSTR("eligible");
}

- (NSString)eligibilityStatusNotEligible
{
  return (NSString *)CFSTR("notEligible");
}

- (NSString)eligibilityStatusUnknown
{
  return (NSString *)CFSTR("unknown");
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v4 = a3;
  objc_msgSend((id)__KeyMapping_53, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___SUScriptSubscriptionStatusResponse;
    objc_msgSendSuper2(&v7, sel_webScriptNameForKeyName_, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)scriptAttributeKeys
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUScriptSubscriptionStatusResponse;
  -[SUScriptObject scriptAttributeKeys](&v5, sel_scriptAttributeKeys);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)__KeyMapping_53, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);

  return v2;
}

+ (void)initialize
{
  void *v2;

  if ((id)objc_opt_class() == a1)
  {
    v2 = (void *)__KeyMapping_53;
    __KeyMapping_53 = (uint64_t)&unk_24DEDC6A8;

  }
}

- (NSNumber)acceptedStoreTermsVersion
{
  return (NSNumber *)objc_getProperty(self, a2, 72, 1);
}

- (NSString)accountStatus
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (NSString)carrierBundlingStatus
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (NSNumber)carrierBundlingErrorCode
{
  return (NSNumber *)objc_getProperty(self, a2, 96, 1);
}

- (id)isDiscoveryModeEligible
{
  return objc_getProperty(self, a2, 104, 1);
}

- (NSString)eligibilityStatus
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (id)isFamilyOrganizer
{
  return objc_getProperty(self, a2, 120, 1);
}

- (id)isFamilySubscription
{
  return objc_getProperty(self, a2, 128, 1);
}

- (id)isFinal
{
  return objc_getProperty(self, a2, 136, 1);
}

- (id)hasFamily
{
  return objc_getProperty(self, a2, 144, 1);
}

- (id)hasFamilyMembers
{
  return objc_getProperty(self, a2, 152, 1);
}

- (NSNumber)latestStoreTermsVersion
{
  return (NSNumber *)objc_getProperty(self, a2, 160, 1);
}

- (SUScriptDictionary)rawResponseData
{
  return (SUScriptDictionary *)objc_getProperty(self, a2, 168, 1);
}

- (NSString)sessionIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 176, 1);
}

- (id)isSubscribed
{
  return objc_getProperty(self, a2, 184, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_subscribed, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_rawResponseData, 0);
  objc_storeStrong((id *)&self->_latestStoreTermsVersion, 0);
  objc_storeStrong(&self->_hasFamilyMembers, 0);
  objc_storeStrong(&self->_hasFamily, 0);
  objc_storeStrong(&self->_final, 0);
  objc_storeStrong(&self->_familySubscription, 0);
  objc_storeStrong(&self->_familyOrganizer, 0);
  objc_storeStrong((id *)&self->_eligibilityStatus, 0);
  objc_storeStrong(&self->_discoveryModeEligible, 0);
  objc_storeStrong((id *)&self->_carrierBundlingErrorCode, 0);
  objc_storeStrong((id *)&self->_carrierBundlingStatus, 0);
  objc_storeStrong((id *)&self->_accountStatus, 0);
  objc_storeStrong((id *)&self->_acceptedStoreTermsVersion, 0);
}

@end
