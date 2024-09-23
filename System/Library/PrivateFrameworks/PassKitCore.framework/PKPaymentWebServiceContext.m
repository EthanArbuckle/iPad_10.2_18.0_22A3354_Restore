@implementation PKPaymentWebServiceContext

- (void)encodeWithCoder:(id)a3
{
  os_unfair_lock_s *p_lock_context;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int64_t registrationType;
  const __CFString *v17;
  const __CFString *v18;

  p_lock_context = &self->_lock_context;
  v5 = a3;
  os_unfair_lock_lock(p_lock_context);
  objc_msgSend(v5, "encodeInteger:forKey:", -[PKPaymentWebServiceContext version](self, "version"), CFSTR("version"));
  -[PKPaymentWebServiceContext deviceID](self, "deviceID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("deviceID"));

  -[PKPaymentWebServiceContext secureElementID](self, "secureElementID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("secureElementID"));

  -[PKPaymentWebServiceContext registrationDate](self, "registrationDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v8, CFSTR("registrationDate"));

  -[PKPaymentWebServiceContext archivedDate](self, "archivedDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v9, CFSTR("archivedDate"));

  -[PKPaymentWebServiceContext pushToken](self, "pushToken");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v10, CFSTR("pushToken"));

  -[PKPaymentWebServiceContext companionSerialNumber](self, "companionSerialNumber");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v11, CFSTR("companionSerialNumber"));

  objc_msgSend(v5, "encodeObject:forKey:", self->_verificationRequestsByPassUniqueID, CFSTR("verificationRequestsByPassUniqueID"));
  objc_msgSend(v5, "encodeBool:forKey:", -[PKPaymentWebServiceContext devSigned](self, "devSigned"), CFSTR("devSigned"));
  -[PKPaymentWebServiceContext configurationDate](self, "configurationDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v12, CFSTR("configurationDate"));

  objc_msgSend(v5, "encodeObject:forKey:", self->_configuration, CFSTR("configuration"));
  -[PKPaymentWebServiceContext primaryRegionIdentifier](self, "primaryRegionIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v13, CFSTR("primaryRegionIdentifier"));

  objc_msgSend(v5, "encodeObject:forKey:", self->_regions, CFSTR("regions"));
  objc_msgSend(v5, "encodeBool:forKey:", -[PKPaymentWebServiceContext transactionServiceDisabled](self, "transactionServiceDisabled"), CFSTR("transactionServiceDisabled"));
  objc_msgSend(v5, "encodeBool:forKey:", -[PKPaymentWebServiceContext messageServiceDisabled](self, "messageServiceDisabled"), CFSTR("messageServiceDisabled"));
  objc_msgSend(v5, "encodeBool:forKey:", -[PKPaymentWebServiceContext ignoreProvisioningEnablementPercentage](self, "ignoreProvisioningEnablementPercentage"), CFSTR("ignoreProvisioningEnablementPercentage"));
  objc_msgSend(v5, "encodeInteger:forKey:", -[PKPaymentWebServiceContext consistencyCheckBackoffLevel](self, "consistencyCheckBackoffLevel"), CFSTR("consistencyCheckBackoff"));
  -[PKPaymentWebServiceContext lastUpdatedTag](self, "lastUpdatedTag");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v14, CFSTR("lastUpdatedTag"));

  -[PKPaymentWebServiceContext certificates](self, "certificates");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v15, CFSTR("certificates"));

  registrationType = self->_registrationType;
  v17 = CFSTR("default");
  if (registrationType != 1)
    v17 = 0;
  if (registrationType)
    v18 = v17;
  else
    v18 = CFSTR("none");
  objc_msgSend(v5, "encodeObject:forKey:", v18, CFSTR("registrationType"));

  os_unfair_lock_unlock(p_lock_context);
}

- (int64_t)version
{
  return self->_version;
}

- (BOOL)transactionServiceDisabled
{
  return self->_transactionServiceDisabled;
}

- (NSString)secureElementID
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (NSDate)registrationDate
{
  return (NSDate *)objc_getProperty(self, a2, 120, 1);
}

- (NSString)pushToken
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (NSString)primaryRegionIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 144, 1);
}

- (BOOL)messageServiceDisabled
{
  return self->_messageServiceDisabled;
}

- (NSString)lastUpdatedTag
{
  return (NSString *)objc_getProperty(self, a2, 168, 1);
}

- (NSString)deviceID
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (int64_t)consistencyCheckBackoffLevel
{
  return self->_consistencyCheckBackoffLevel;
}

- (NSString)companionSerialNumber
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (NSArray)certificates
{
  return (NSArray *)objc_getProperty(self, a2, 160, 1);
}

- (NSDate)archivedDate
{
  return (NSDate *)objc_getProperty(self, a2, 128, 1);
}

- (BOOL)devSigned
{
  return self->_devSigned;
}

- (NSDate)configurationDate
{
  return (NSDate *)objc_getProperty(self, a2, 136, 1);
}

- (BOOL)contextMeetsProvisioningEnablementPercentageThresholdForRegion:(id)a3
{
  id v4;
  void *v5;
  int v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  BOOL v12;
  NSObject *v13;
  const __CFString *v14;
  int v16;
  id v17;
  __int16 v18;
  double v19;
  __int16 v20;
  double v21;
  __int16 v22;
  const __CFString *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[PKPaymentWebServiceContext ignoreProvisioningEnablementPercentage](self, "ignoreProvisioningEnablementPercentage")|| (-[PKPaymentWebServiceContext configuration](self, "configuration"), v5 = (void *)objc_claimAutoreleasedReturnValue(), v6 = objc_msgSend(v5, "regionHasProvisioningEnablementPercentage:", v4), v5, !v6))
  {
    v12 = 1;
  }
  else
  {
    -[PKPaymentWebServiceContext _contextProvisioningEnablementValue](self, "_contextProvisioningEnablementValue");
    v8 = v7;
    -[PKPaymentWebServiceContext configuration](self, "configuration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "provisioningEnablementPercentageForRegion:", v4);
    v11 = v10;

    v12 = v8 < v11;
    PKLogFacilityTypeGetObject(6uLL);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = CFSTR("does not meet");
      v16 = 138413058;
      v17 = v4;
      if (v8 < v11)
        v14 = CFSTR("meets");
      v18 = 2048;
      v19 = v11;
      v20 = 2048;
      v21 = v8;
      v22 = 2112;
      v23 = v14;
      _os_log_impl(&dword_18FC92000, v13, OS_LOG_TYPE_DEFAULT, "Region: %@ has a defined ProvisioningEnablementPercentage threshold of %f. This device has context value %f. Context %@ the required threshold.", (uint8_t *)&v16, 0x2Au);
    }

  }
  return v12;
}

- (PKPaymentWebServiceConfiguration)configuration
{
  os_unfair_lock_s *p_lock_context;
  PKPaymentWebServiceConfiguration *v4;

  p_lock_context = &self->_lock_context;
  os_unfair_lock_lock(&self->_lock_context);
  v4 = self->_configuration;
  os_unfair_lock_unlock(p_lock_context);
  return v4;
}

- (BOOL)ignoreProvisioningEnablementPercentage
{
  return self->_ignoreProvisioningEnablementPercentage;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentWebServiceContext)initWithCoder:(id)a3
{
  id v4;
  PKPaymentWebServiceContext *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSMutableDictionary *verificationRequestsByPassUniqueID;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  NSDictionary *regions;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  uint64_t deviceID;
  uint64_t v35;

  v4 = a3;
  v5 = -[PKPaymentWebServiceContext init](self, "init");
  if (v5)
  {
    -[PKPaymentWebServiceContext setVersion:](v5, "setVersion:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("version")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentWebServiceContext setDeviceID:](v5, "setDeviceID:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("secureElementID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentWebServiceContext setSecureElementID:](v5, "setSecureElementID:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("registrationDate"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentWebServiceContext setRegistrationDate:](v5, "setRegistrationDate:", v8);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("archivedDate"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentWebServiceContext setArchivedDate:](v5, "setArchivedDate:", v9);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pushToken"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentWebServiceContext setPushToken:](v5, "setPushToken:", v10);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("companionSerialNumber"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentWebServiceContext setCompanionSerialNumber:](v5, "setCompanionSerialNumber:", v11);

    v12 = (void *)MEMORY[0x1E0C99E60];
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    objc_msgSend(v12, "setWithObjects:", v13, v14, objc_opt_class(), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("verificationRequestsByPassUniqueID"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "mutableCopy");
    verificationRequestsByPassUniqueID = v5->_verificationRequestsByPassUniqueID;
    v5->_verificationRequestsByPassUniqueID = (NSMutableDictionary *)v17;

    -[PKPaymentWebServiceContext setDevSigned:](v5, "setDevSigned:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("devSigned")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("configurationDate"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentWebServiceContext setConfigurationDate:](v5, "setConfigurationDate:", v19);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("configuration"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentWebServiceContext setConfiguration:](v5, "setConfiguration:", v20);

    v21 = (void *)MEMORY[0x1E0C99E60];
    v22 = objc_opt_class();
    v23 = objc_opt_class();
    objc_msgSend(v21, "setWithObjects:", v22, v23, objc_opt_class(), 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v24, CFSTR("regions"));
    v25 = objc_claimAutoreleasedReturnValue();
    regions = v5->_regions;
    v5->_regions = (NSDictionary *)v25;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("primaryRegionIdentifier"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentWebServiceContext setPrimaryRegionIdentifier:](v5, "setPrimaryRegionIdentifier:", v27);

    -[PKPaymentWebServiceContext setTransactionServiceDisabled:](v5, "setTransactionServiceDisabled:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("transactionServiceDisabled")));
    -[PKPaymentWebServiceContext setMessageServiceDisabled:](v5, "setMessageServiceDisabled:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("messageServiceDisabled")));
    -[PKPaymentWebServiceContext setIgnoreProvisioningEnablementPercentage:](v5, "setIgnoreProvisioningEnablementPercentage:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("ignoreProvisioningEnablementPercentage")));
    objc_msgSend(v4, "decodePropertyListForKey:", CFSTR("certificates"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentWebServiceContext setCertificates:](v5, "setCertificates:", v28);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastUpdatedTag"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentWebServiceContext setLastUpdatedTag:](v5, "setLastUpdatedTag:", v29);

    -[PKPaymentWebServiceContext setConsistencyCheckBackoffLevel:](v5, "setConsistencyCheckBackoffLevel:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("consistencyCheckBackoff")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("registrationType"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v30;
    if (v30)
    {
      v35 = 0;
      v32 = PKPaymentWebServiceRegistrationTypeFromString(v30, &v35);
      deviceID = v35;
      if (!v32)
        deviceID = 2;
    }
    else
    {
      deviceID = (uint64_t)v5->_deviceID;
      if (deviceID)
        deviceID = v5->_registrationDate != 0;
    }
    v5->_registrationType = deviceID;

  }
  return v5;
}

- (void)setVersion:(int64_t)a3
{
  self->_version = a3;
}

- (void)setTransactionServiceDisabled:(BOOL)a3
{
  self->_transactionServiceDisabled = a3;
}

- (void)setSecureElementID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 80);
}

- (void)setRegistrationDate:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 120);
}

- (void)setPushToken:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 88);
}

- (void)setPrimaryRegionIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 144);
}

- (void)setMessageServiceDisabled:(BOOL)a3
{
  self->_messageServiceDisabled = a3;
}

- (void)setLastUpdatedTag:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 168);
}

- (void)setIgnoreProvisioningEnablementPercentage:(BOOL)a3
{
  self->_ignoreProvisioningEnablementPercentage = a3;
}

- (void)setDeviceID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 72);
}

- (void)setDevSigned:(BOOL)a3
{
  self->_devSigned = a3;
}

- (void)setConsistencyCheckBackoffLevel:(int64_t)a3
{
  self->_consistencyCheckBackoffLevel = a3;
}

- (void)setConfigurationDate:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 136);
}

- (void)setConfiguration:(id)a3
{
  PKPaymentWebServiceConfiguration *v4;
  PKPaymentWebServiceConfiguration *configuration;

  v4 = (PKPaymentWebServiceConfiguration *)a3;
  os_unfair_lock_lock(&self->_lock_context);
  configuration = self->_configuration;
  self->_configuration = v4;

  os_unfair_lock_unlock(&self->_lock_context);
}

- (void)setCompanionSerialNumber:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 104);
}

- (void)setCertificates:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 160);
}

- (void)setArchivedDate:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 128);
}

- (PKPaymentWebServiceContext)init
{
  PKPaymentWebServiceContext *v2;
  PKPaymentWebServiceContext *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *featureSupportedLanguageCache;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKPaymentWebServiceContext;
  v2 = -[PKPaymentWebServiceContext init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock_context._os_unfair_lock_opaque = 0;
    v2->_version = 1;
    v2->_cacheLock._os_unfair_lock_opaque = 0;
    v2->_registrationType = 0;
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    featureSupportedLanguageCache = v3->_featureSupportedLanguageCache;
    v3->_featureSupportedLanguageCache = v4;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v3, sel__localizationUpdated, *MEMORY[0x1E0C99720], 0);

  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0C99720], 0);

  v4.receiver = self;
  v4.super_class = (Class)PKPaymentWebServiceContext;
  -[PKPaymentWebServiceContext dealloc](&v4, sel_dealloc);
}

+ (PKPaymentWebServiceContext)contextWithArchive:(id)a3
{
  id v4;
  void *v5;
  PKPaymentWebServiceContext *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___PKPaymentWebServiceContext;
  objc_msgSendSuper2(&v8, sel_contextWithArchive_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
  }
  else
  {
    v6 = objc_alloc_init(PKPaymentWebServiceContext);
    if (!v6)
      goto LABEL_7;
  }
  if (-[PKPaymentWebServiceContext version](v6, "version") <= 0)
  {
    objc_msgSend((id)objc_opt_class(), "_migrateContext:", v6);
    objc_msgSend(v5, "archiveAtPath:", v4);
  }
LABEL_7:

  return v6;
}

- (void)archiveAtPath:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  objc_super v7;

  v4 = (void *)MEMORY[0x1E0C99D68];
  v5 = a3;
  objc_msgSend(v4, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentWebServiceContext setArchivedDate:](self, "setArchivedDate:", v6);

  v7.receiver = self;
  v7.super_class = (Class)PKPaymentWebServiceContext;
  -[PKWebServiceContext archiveAtPath:](&v7, sel_archiveAtPath_, v5);

}

- (BOOL)isRegistered
{
  return (unint64_t)(self->_registrationType - 1) < 2;
}

- (BOOL)isRegisteredForBrokerURL:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock_context;
  NSDictionary *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  void *v13;
  char v14;
  BOOL v15;
  os_unfair_lock_s *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[PKPaymentWebServiceContext isRegistered](self, "isRegistered"))
  {
    if (v4)
    {
      p_lock_context = &self->_lock_context;
      os_unfair_lock_lock(&self->_lock_context);
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v6 = self->_regions;
      v7 = -[NSDictionary countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v7)
      {
        v8 = v7;
        v17 = &self->_lock_context;
        v9 = *(_QWORD *)v19;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v19 != v9)
              objc_enumerationMutation(v6);
            -[NSDictionary objectForKeyedSubscript:](self->_regions, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i));
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "brokerURL");
            v12 = objc_claimAutoreleasedReturnValue();
            if (v12)
            {
              v13 = (void *)v12;
              v14 = objc_msgSend(v4, "isEqual:", v12);

              if ((v14 & 1) != 0)
              {
                v15 = 1;
                goto LABEL_17;
              }
            }
            else
            {

            }
          }
          v8 = -[NSDictionary countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        }
        while (v8);
        v15 = 0;
LABEL_17:
        p_lock_context = v17;
      }
      else
      {
        v15 = 0;
      }

      os_unfair_lock_unlock(p_lock_context);
    }
    else
    {
      v15 = 1;
    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (NSDictionary)regions
{
  os_unfair_lock_s *p_lock_context;
  NSDictionary *v4;

  p_lock_context = &self->_lock_context;
  os_unfair_lock_lock(&self->_lock_context);
  v4 = self->_regions;
  os_unfair_lock_unlock(p_lock_context);
  return v4;
}

- (void)setRegions:(id)a3
{
  NSDictionary *v4;
  NSDictionary *regions;

  v4 = (NSDictionary *)objc_msgSend(a3, "copy");
  os_unfair_lock_lock(&self->_lock_context);
  regions = self->_regions;
  self->_regions = v4;

  os_unfair_lock_unlock(&self->_lock_context);
}

- (id)debugDescription
{
  void *v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; \n"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("version: '%ld';\n"), self->_version);
  objc_msgSend(v3, "appendFormat:", CFSTR("DeviceID: '%@';\n"), self->_deviceID);
  objc_msgSend(v3, "appendFormat:", CFSTR("secureElementID: '%@';\n"), self->_secureElementID);
  objc_msgSend(v3, "appendFormat:", CFSTR("registrationDate: '%@';\n"), self->_registrationDate);
  objc_msgSend(v3, "appendFormat:", CFSTR("archivedDate: '%@';\n"), self->_archivedDate);
  objc_msgSend(v3, "appendFormat:", CFSTR("pushToken: '%@';\n"), self->_pushToken);
  objc_msgSend(v3, "appendFormat:", CFSTR("nextPushToken: '%@';\n"), self->_nextPushToken);
  objc_msgSend(v3, "appendFormat:", CFSTR("companionSerialNumber: '%@';\n"), self->_companionSerialNumber);
  objc_msgSend(v3, "appendFormat:", CFSTR("verificationRequestsByPassUniqueID: '%@';\n"),
    self->_verificationRequestsByPassUniqueID);
  if (self->_devSigned)
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("devSigned: '%@';\n"), v4);
  objc_msgSend(v3, "appendFormat:", CFSTR("configurationDate: '%@';\n"), self->_configurationDate);
  -[PKPaymentWebServiceContext configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("configuration: '%@';\n"), v6);

  objc_msgSend(v3, "appendFormat:", CFSTR("primaryRegionIdentifier: '%@';\n"), self->_primaryRegionIdentifier);
  -[NSDictionary description](self->_regions, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("regions: '%@';\n"), v7);

  if (self->_transactionServiceDisabled)
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("transactionServiceDisabled: '%@';\n"), v8);
  if (self->_messageServiceDisabled)
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("messageServiceDisabled: '%@';\n"), v9);
  if (self->_ignoreProvisioningEnablementPercentage)
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("ignoreProvisioningEnablementPercentage: '%@';\n"), v10);
  objc_msgSend(v3, "appendFormat:", CFSTR("consistencyCheckBackoff: '%ld';\n"), self->_consistencyCheckBackoffLevel);
  objc_msgSend(v3, "appendFormat:", CFSTR("lastUpdatedTag: '%@';\n"), self->_lastUpdatedTag);
  objc_msgSend(v3, "appendFormat:", CFSTR("certificates: '%@';\n"), self->_certificates);
  return v3;
}

- (void)_localizationUpdated
{
  os_unfair_lock_s *p_cacheLock;

  p_cacheLock = &self->_cacheLock;
  os_unfair_lock_lock(&self->_cacheLock);
  -[NSMutableDictionary removeAllObjects](self->_featureSupportedLanguageCache, "removeAllObjects");
  os_unfair_lock_unlock(p_cacheLock);
}

- (void)addVerificationRequestRecord:(id)a3 forUniqueID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSMutableDictionary *verificationRequestsByPassUniqueID;
  NSMutableDictionary *v10;
  NSMutableDictionary *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  PKLogFacilityTypeGetObject(0x24uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412290;
    v13 = v7;
    _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Adding verification request record for %@", (uint8_t *)&v12, 0xCu);
  }

  os_unfair_lock_lock(&self->_lock_context);
  verificationRequestsByPassUniqueID = self->_verificationRequestsByPassUniqueID;
  if (!verificationRequestsByPassUniqueID)
  {
    v10 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
    v11 = self->_verificationRequestsByPassUniqueID;
    self->_verificationRequestsByPassUniqueID = v10;

    verificationRequestsByPassUniqueID = self->_verificationRequestsByPassUniqueID;
  }
  -[NSMutableDictionary setObject:forKey:](verificationRequestsByPassUniqueID, "setObject:forKey:", v6, v7);
  os_unfair_lock_unlock(&self->_lock_context);

}

- (id)verificationRequestRecordForUniqueID:(id)a3
{
  os_unfair_lock_s *p_lock_context;
  id v5;
  void *v6;

  p_lock_context = &self->_lock_context;
  v5 = a3;
  os_unfair_lock_lock(p_lock_context);
  -[NSMutableDictionary objectForKey:](self->_verificationRequestsByPassUniqueID, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock_context);
  return v6;
}

- (void)removeVerificationRequestRecordForUniqueID:(id)a3
{
  id v4;
  NSObject *v5;
  NSMutableDictionary *verificationRequestsByPassUniqueID;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PKLogFacilityTypeGetObject(0x24uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Removing verification request record for %@", (uint8_t *)&v7, 0xCu);
  }

  os_unfair_lock_lock(&self->_lock_context);
  -[NSMutableDictionary removeObjectForKey:](self->_verificationRequestsByPassUniqueID, "removeObjectForKey:", v4);
  if (!-[NSMutableDictionary count](self->_verificationRequestsByPassUniqueID, "count"))
  {
    verificationRequestsByPassUniqueID = self->_verificationRequestsByPassUniqueID;
    self->_verificationRequestsByPassUniqueID = 0;

  }
  os_unfair_lock_unlock(&self->_lock_context);

}

- (id)regionForIdentifier:(id)a3
{
  os_unfair_lock_s *p_lock_context;
  id v5;
  void *v6;

  p_lock_context = &self->_lock_context;
  v5 = a3;
  os_unfair_lock_lock(p_lock_context);
  -[NSDictionary objectForKey:](self->_regions, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock_context);
  return v6;
}

- (PKPaymentWebServiceRegion)primaryRegion
{
  os_unfair_lock_s *p_lock_context;
  void *v4;

  p_lock_context = &self->_lock_context;
  os_unfair_lock_lock(&self->_lock_context);
  -[NSDictionary objectForKey:](self->_regions, "objectForKey:", self->_primaryRegionIdentifier);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock_context);
  return (PKPaymentWebServiceRegion *)v4;
}

- (void)atomicallyUpdatePrimaryRegion:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  void *v7;
  NSDictionary *v8;
  NSDictionary *regions;
  void (**v10)(id, void *);

  v4 = (void (**)(id, void *))a3;
  if (v4)
  {
    v10 = v4;
    os_unfair_lock_lock(&self->_lock_context);
    if (self->_primaryRegionIdentifier)
    {
      v5 = (void *)-[NSDictionary mutableCopy](self->_regions, "mutableCopy");
      -[NSDictionary objectForKeyedSubscript:](self->_regions, "objectForKeyedSubscript:", self->_primaryRegionIdentifier);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v10[2](v10, v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, self->_primaryRegionIdentifier);

      v8 = (NSDictionary *)objc_msgSend(v5, "copy");
      regions = self->_regions;
      self->_regions = v8;

    }
    os_unfair_lock_unlock(&self->_lock_context);
    v4 = v10;
  }

}

- (void)atomicallyUpdateRegionWithIdentifier:(id)a3 updateBlock:(id)a4
{
  os_unfair_lock_s *p_lock_context;
  void (**v7)(id, void *);
  id v8;
  void *v9;
  void *v10;
  NSDictionary *v11;
  NSDictionary *regions;
  id v13;

  if (a3)
  {
    if (a4)
    {
      p_lock_context = &self->_lock_context;
      v7 = (void (**)(id, void *))a4;
      v8 = a3;
      os_unfair_lock_lock(p_lock_context);
      v13 = (id)-[NSDictionary mutableCopy](self->_regions, "mutableCopy");
      -[NSDictionary objectForKeyedSubscript:](self->_regions, "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "setObject:forKeyedSubscript:", v10, v8);
      v11 = (NSDictionary *)objc_msgSend(v13, "copy");
      regions = self->_regions;
      self->_regions = v11;

      os_unfair_lock_unlock(p_lock_context);
    }
  }
}

- (void)atomicallyUpdateEveryRegion:(id)a3
{
  void (**v4)(id, void *);
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  NSDictionary *v13;
  NSDictionary *regions;
  os_unfair_lock_t lock;
  NSDictionary *obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *))a3;
  if (v4)
  {
    lock = &self->_lock_context;
    os_unfair_lock_lock(&self->_lock_context);
    v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    obj = self->_regions;
    v6 = -[NSDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v18 != v8)
            objc_enumerationMutation(obj);
          v10 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
          -[NSDictionary objectForKeyedSubscript:](self->_regions, "objectForKeyedSubscript:", v10, lock);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v4[2](v4, v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, v10);

        }
        v7 = -[NSDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v7);
    }

    v13 = (NSDictionary *)objc_msgSend(v5, "copy");
    regions = self->_regions;
    self->_regions = v13;

    os_unfair_lock_unlock(lock);
  }

}

- (id)TSMPushTopics
{
  id v3;
  os_unfair_lock_s *p_lock_context;
  NSDictionary *regions;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  p_lock_context = &self->_lock_context;
  os_unfair_lock_lock(&self->_lock_context);
  regions = self->_regions;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __43__PKPaymentWebServiceContext_TSMPushTopics__block_invoke;
  v9[3] = &unk_1E2AD1FC8;
  v10 = v3;
  v6 = v3;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](regions, "enumerateKeysAndObjectsUsingBlock:", v9);
  os_unfair_lock_unlock(p_lock_context);
  v7 = (void *)objc_msgSend(v6, "copy");

  return v7;
}

void __43__PKPaymentWebServiceContext_TSMPushTopics__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "trustedServiceManagerPushTopic");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);
    v4 = v5;
  }

}

- (id)TSMURLStringByPushTopic
{
  id v3;
  os_unfair_lock_s *p_lock_context;
  NSDictionary *regions;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  p_lock_context = &self->_lock_context;
  os_unfair_lock_lock(&self->_lock_context);
  regions = self->_regions;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __53__PKPaymentWebServiceContext_TSMURLStringByPushTopic__block_invoke;
  v9[3] = &unk_1E2AD1FC8;
  v10 = v3;
  v6 = v3;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](regions, "enumerateKeysAndObjectsUsingBlock:", v9);
  os_unfair_lock_unlock(p_lock_context);
  v7 = (void *)objc_msgSend(v6, "copy");

  return v7;
}

void __53__PKPaymentWebServiceContext_TSMURLStringByPushTopic__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_msgSend(v4, "trustedServiceManagerURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "absoluteString");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "trustedServiceManagerPushTopic");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && v6)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v7, v6);

}

- (id)notificationPushTopics
{
  id v3;
  os_unfair_lock_s *p_lock_context;
  NSDictionary *regions;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  p_lock_context = &self->_lock_context;
  os_unfair_lock_lock(&self->_lock_context);
  regions = self->_regions;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __52__PKPaymentWebServiceContext_notificationPushTopics__block_invoke;
  v9[3] = &unk_1E2AD1FC8;
  v10 = v3;
  v6 = v3;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](regions, "enumerateKeysAndObjectsUsingBlock:", v9);
  os_unfair_lock_unlock(p_lock_context);
  v7 = (void *)objc_msgSend(v6, "copy");

  return v7;
}

void __52__PKPaymentWebServiceContext_notificationPushTopics__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
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
  id v20;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "pk_safelyAddObject:", a2);
  v7 = *(void **)(a1 + 32);
  objc_msgSend(v6, "userNotificationPushTopic");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pk_safelyAddObject:", v8);

  v9 = *(void **)(a1 + 32);
  objc_msgSend(v6, "deviceCheckInPushTopic");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pk_safelyAddObject:", v10);

  v11 = *(void **)(a1 + 32);
  objc_msgSend(v6, "productsPushTopic");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "pk_safelyAddObject:", v12);

  v13 = *(void **)(a1 + 32);
  objc_msgSend(v6, "transactionZonePushTopic");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "pk_safelyAddObject:", v14);

  v15 = *(void **)(a1 + 32);
  objc_msgSend(v6, "provisioningTargetsPushTopic");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "pk_safelyAddObject:", v16);

  objc_msgSend(*(id *)(a1 + 32), "pk_safelyAddObject:", CFSTR("com.apple.pay.provision"));
  v17 = *(void **)(a1 + 32);
  objc_msgSend(v6, "ownershipTokensPushTopic");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "pk_safelyAddObject:", v18);

  v19 = *(void **)(a1 + 32);
  objc_msgSend(v6, "auxiliaryRegistrationRequirementPushTopic");
  v20 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "pk_safelyAddObject:", v20);
}

- (id)applyServicePushTopics
{
  id v3;
  os_unfair_lock_s *p_lock_context;
  NSDictionary *regions;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  p_lock_context = &self->_lock_context;
  os_unfair_lock_lock(&self->_lock_context);
  regions = self->_regions;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __52__PKPaymentWebServiceContext_applyServicePushTopics__block_invoke;
  v9[3] = &unk_1E2AD1FC8;
  v10 = v3;
  v6 = v3;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](regions, "enumerateKeysAndObjectsUsingBlock:", v9);
  os_unfair_lock_unlock(p_lock_context);
  v7 = (void *)objc_msgSend(v6, "copy");

  return v7;
}

void __52__PKPaymentWebServiceContext_applyServicePushTopics__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a3, "applyServicePushTopic");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pk_safelyAddObject:", v4);

}

- (id)accountServicePushTopics
{
  id v3;
  os_unfair_lock_s *p_lock_context;
  NSDictionary *regions;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  p_lock_context = &self->_lock_context;
  os_unfair_lock_lock(&self->_lock_context);
  regions = self->_regions;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __54__PKPaymentWebServiceContext_accountServicePushTopics__block_invoke;
  v9[3] = &unk_1E2AD1FC8;
  v10 = v3;
  v6 = v3;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](regions, "enumerateKeysAndObjectsUsingBlock:", v9);
  os_unfair_lock_unlock(p_lock_context);
  v7 = (void *)objc_msgSend(v6, "copy");

  return v7;
}

void __54__PKPaymentWebServiceContext_accountServicePushTopics__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a3, "accountServicePushTopic");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pk_safelyAddObject:", v4);

}

- (id)paymentOffersServicePushTopics
{
  id v3;
  os_unfair_lock_s *p_lock_context;
  NSDictionary *regions;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  p_lock_context = &self->_lock_context;
  os_unfair_lock_lock(&self->_lock_context);
  regions = self->_regions;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __60__PKPaymentWebServiceContext_paymentOffersServicePushTopics__block_invoke;
  v9[3] = &unk_1E2AD1FC8;
  v10 = v3;
  v6 = v3;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](regions, "enumerateKeysAndObjectsUsingBlock:", v9);
  os_unfair_lock_unlock(p_lock_context);
  v7 = (void *)objc_msgSend(v6, "copy");

  return v7;
}

void __60__PKPaymentWebServiceContext_paymentOffersServicePushTopics__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a3, "paymentOffersServicePushTopic");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pk_safelyAddObject:", v4);

}

- (NSURL)peerPaymentServiceURL
{
  void *v2;
  void *v3;

  -[PKPaymentWebServiceContext _regionWithPeerPaymentServiceURL](self, "_regionWithPeerPaymentServiceURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "peerPaymentServiceURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (BOOL)hasPeerPaymentAccount
{
  void *v2;
  char v3;

  -[PKPaymentWebServiceContext _regionWithPeerPaymentServiceURL](self, "_regionWithPeerPaymentServiceURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasPeerPaymentAccount");

  return v3;
}

- (id)_regionWithPeerPaymentServiceURL
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[PKPaymentWebServiceContext primaryRegion](self, "primaryRegion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "peerPaymentServiceURL");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
  }
  else
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[PKPaymentWebServiceContext regions](self, "regions", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      while (2)
      {
        v10 = 0;
        v11 = v3;
        do
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          -[PKPaymentWebServiceContext regionForIdentifier:](self, "regionForIdentifier:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10));
          v3 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v3, "peerPaymentServiceURL");
          v12 = objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            v5 = (void *)v12;
            goto LABEL_13;
          }
          ++v10;
          v11 = v3;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v8)
          continue;
        break;
      }
    }

    v5 = 0;
    v6 = v3;
    v3 = 0;
LABEL_13:

  }
  return v3;
}

- (BOOL)contextMeetsMarketGeoNotificationThresholdForRegion:(id)a3 paymentNetwork:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  BOOL v15;
  NSObject *v16;
  const __CFString *v17;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  double v22;
  __int16 v23;
  int64_t v24;
  __int16 v25;
  double v26;
  __int16 v27;
  const __CFString *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[PKPaymentWebServiceContext configuration](self, "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "marketGeoRegionNotificationNetworkThresholdsForRegion:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v10, "doubleValue");
    v12 = v11;
    -[PKPaymentWebServiceContext _contextProvisioningEnablementValue](self, "_contextProvisioningEnablementValue");
    v14 = v13;
    v15 = v13 < v12;
    PKLogFacilityTypeGetObject(6uLL);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = CFSTR("does not meet");
      *(_DWORD *)buf = 138413314;
      v20 = v6;
      if (v14 < v12)
        v17 = CFSTR("meets");
      v21 = 2048;
      v22 = v12;
      v23 = 2048;
      v24 = a4;
      v25 = 2048;
      v26 = v14;
      v27 = 2112;
      v28 = v17;
      _os_log_impl(&dword_18FC92000, v16, OS_LOG_TYPE_DEFAULT, "Region: %@ has a defined GeoRegionNotificationNetwork threshold of %f for network %ld. This device has context value %f. Context %@ the required threshold.", buf, 0x34u);
    }

  }
  else
  {
    v15 = 1;
  }

  return v15;
}

- (BOOL)contextMeetsDeviceUpgradeTasksEnablementThresholdForRegion:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  NSObject *v10;
  const __CFString *v11;
  int v13;
  id v14;
  __int16 v15;
  double v16;
  __int16 v17;
  double v18;
  __int16 v19;
  const __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PKPaymentWebServiceContext _contextProvisioningEnablementValue](self, "_contextProvisioningEnablementValue");
  v6 = v5;
  -[PKPaymentWebServiceContext configuration](self, "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "deviceUpgradeTaskEnablementPercentageForRegion:", v4);
  v9 = v8;

  if (v9 < 1.0)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = CFSTR("does not meet");
      v13 = 138413058;
      v14 = v4;
      if (v6 < v9)
        v11 = CFSTR("meets");
      v15 = 2048;
      v16 = v9;
      v17 = 2048;
      v18 = v6;
      v19 = 2112;
      v20 = v11;
      _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "Region: %@ has a defined deviceUpgradeTasksEnablementPercentage threshold of %f. This device has context value %f. Context %@ meets the required threshold.", (uint8_t *)&v13, 0x2Au);
    }

  }
  return v6 < v9;
}

- (id)betaPaymentNetworksForRegion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  PKOSVersionRequirementRange *v15;
  void *v16;
  PKOSVersionRequirementRange *v17;
  void *v18;
  void *v20;
  void *v21;
  id obj;
  void *v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PKPaymentWebServiceContext configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x1E0C99E20]);
  objc_msgSend(v5, "betaPaymentNetworksForRegion:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v6, "initWithArray:", v7);

  v20 = v5;
  v21 = v4;
  objc_msgSend(v5, "betaPaymentNetworkVersionsForRegion:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKOSVersionRequirement fromDeviceVersion](PKOSVersionRequirement, "fromDeviceVersion");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  PKDeviceClass();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v8;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v27 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v13, "PKIntegerForKey:", CFSTR("cardType")));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = [PKOSVersionRequirementRange alloc];
        objc_msgSend(v13, "PKDictionaryForKey:", CFSTR("version"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = -[PKOSVersionRequirementRange initWithDictionary:](v15, "initWithDictionary:", v16);

        if (v17)
        {
          if (-[PKOSVersionRequirementRange versionMeetsRequirements:deviceClass:](v17, "versionMeetsRequirements:deviceClass:", v24, v23))
          {
            objc_msgSend(v25, "addObject:", v14);
          }
          else
          {
            objc_msgSend(v25, "removeObject:", v14);
          }
        }

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v10);
  }

  v18 = (void *)objc_msgSend(v25, "copy");
  return v18;
}

- (double)_contextProvisioningEnablementValue
{
  id v2;
  const char *v3;
  size_t v4;
  unsigned int v5;
  int v6;
  double v7;

  -[PKPaymentWebServiceContext secureElementID](self, "secureElementID");
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v3 = (const char *)objc_msgSend(v2, "UTF8String");

  if (!v3)
    return 0.0;
  v4 = strlen(v3);
  if (v4)
  {
    v5 = 0;
    do
    {
      v6 = *v3++;
      v5 = 33 * v5 + v6;
      --v4;
    }
    while (v4);
    v7 = (double)(v5 % 0x64);
  }
  else
  {
    v7 = 0.0;
  }
  return v7 / 100.0;
}

- (id)applyServiceFeaturesForRegionMeetingEnablementThreshold:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  __CFString *v16;
  id v17;
  uint64_t v18;

  v4 = (objc_class *)MEMORY[0x1E0C99E08];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  -[PKPaymentWebServiceContext configuration](self, "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentWebServiceContext _contextProvisioningEnablementValue](self, "_contextProvisioningEnablementValue");
  v9 = v8;
  objc_msgSend(v7, "applyServiceFeaturesForRegion:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __86__PKPaymentWebServiceContext_applyServiceFeaturesForRegionMeetingEnablementThreshold___block_invoke;
  v15[3] = &unk_1E2AD1FF0;
  v16 = CFSTR("enablementThreshold");
  v18 = v9;
  v11 = v6;
  v17 = v11;
  objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v15);
  v12 = v17;
  v13 = v11;

  return v13;
}

void __86__PKPaymentWebServiceContext_applyServiceFeaturesForRegionMeetingEnablementThreshold___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  NSObject *v10;
  uint64_t v11;
  int v12;
  id v13;
  __int16 v14;
  double v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v6, "PKNumberForKey:", *(_QWORD *)(a1 + 32));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  v9 = v8;
  if (v7 && *(double *)(a1 + 48) < v8)
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v6, v5);
  PKLogFacilityTypeGetObject(0xDuLL);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = *(_QWORD *)(a1 + 48);
    v12 = 138412802;
    v13 = v5;
    v14 = 2048;
    v15 = v9;
    v16 = 2048;
    v17 = v11;
    _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "%@ has a defined threshold of %f. This device has context value %f.", (uint8_t *)&v12, 0x20u);
  }

}

- (id)applyServiceLocalizationBundleForFeatureIdentifier:(unint64_t)a3 mainLanguageBundle:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a4;
  if (!v6)
  {
    PKPassKitBundle();
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@-%@"), v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_lock(&self->_cacheLock);
  -[NSMutableDictionary objectForKey:](self->_featureSupportedLanguageCache, "objectForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&self->_cacheLock);
  if (v11)
  {
    v12 = v11;
  }
  else
  {
    v12 = v6;
    os_unfair_lock_lock(&self->_cacheLock);
    -[NSMutableDictionary setObject:forKey:](self->_featureSupportedLanguageCache, "setObject:forKey:", v12, v10);
    os_unfair_lock_unlock(&self->_cacheLock);
  }

  return v12;
}

- (id)applyServicePreferredLanguageForFeatureIdentifier:(unint64_t)a3 mainLanguageBundle:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __CFString *v23;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (!v6)
  {
    PKPassKitBundle();
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[PKPaymentWebServiceContext configuration](self, "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentWebServiceContext primaryRegionIdentifier](self, "primaryRegionIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "applyServiceFeaturesForRegion:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  PKFeatureIdentifierToString(a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "PKArrayForKey:", CFSTR("applySupportedLanguages"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    objc_msgSend(v6, "preferredLocalizations");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    if (v27)
    {
      v14 = *(_QWORD *)v34;
      v25 = *(_QWORD *)v34;
      v26 = v9;
      v28 = v13;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v34 != v14)
            objc_enumerationMutation(v13);
          v16 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v15);
          v29 = 0u;
          v30 = 0u;
          v31 = 0u;
          v32 = 0u;
          v17 = v12;
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
          if (v18)
          {
            v19 = v18;
            v20 = *(_QWORD *)v30;
            while (2)
            {
              v21 = 0;
              do
              {
                if (*(_QWORD *)v30 != v20)
                  objc_enumerationMutation(v17);
                if ((objc_msgSend(v16, "isEqualToString:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v21), v25) & 1) != 0)
                {
                  v23 = v16;

                  v9 = v26;
                  goto LABEL_27;
                }
                ++v21;
              }
              while (v19 != v21);
              v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
              if (v19)
                continue;
              break;
            }
          }

          ++v15;
          v13 = v28;
          v14 = v25;
        }
        while (v15 != v27);
        v9 = v26;
        v27 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      }
      while (v27);
    }

  }
  if (a3 == 2 || a3 == 5)
    v23 = CFSTR("en");
  else
    v23 = 0;
LABEL_27:

  return v23;
}

+ (void)_migrateContext:(id)a3
{
  id v4;

  v4 = a3;
  if (!objc_msgSend(v4, "version"))
    objc_msgSend(a1, "_migrateFrom0To1:", v4);

}

+ (void)_migrateFrom0To1:(id)a3
{
  id v3;
  NSObject *v4;
  PKSecureElement *v5;
  PKPaymentWebServiceRegion *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  PKPaymentWebServiceRegion *v14;
  _BOOL4 v15;
  __CFString *v16;
  void *v17;
  __CFString *v18;
  void *v19;
  uint8_t buf[8];
  __CFString *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  PKLogFacilityTypeGetObject(6uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "Migrating PKPaymentWebServiceContext from 0 to 1… ", buf, 2u);
  }

  v5 = objc_alloc_init(PKSecureElement);
  v6 = [PKPaymentWebServiceRegion alloc];
  objc_msgSend(v3, "certificates");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalBrokerURL(objc_msgSend(v3, "devSigned"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PKTrustedServiceManagerURL();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  PKPaymentServicesURL();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  PKPaymentServicesURL();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v3, "consistencyCheckBackoffLevel");
  objc_msgSend(v3, "lastUpdatedTag");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[PKPaymentWebServiceRegion initWithCeritficates:brokerURL:trustedServiceManagerURL:trustedServiceManagerPushTopic:paymentServicesURL:inAppPaymentServicesURL:consistencyCheckBackoffLevel:lastUpdatedTag:](v6, "initWithCeritficates:brokerURL:trustedServiceManagerURL:trustedServiceManagerPushTopic:paymentServicesURL:inAppPaymentServicesURL:consistencyCheckBackoffLevel:lastUpdatedTag:", v7, v8, v9, CFSTR("com.apple.seld"), v10, v11, v12, v13);

  v15 = -[PKSecureElement isProductionSigned](v5, "isProductionSigned");
  v16 = CFSTR("paymentpass.com.apple.dev1");
  if (v15)
    v16 = CFSTR("paymentpass.com.apple");
  v21 = v16;
  v22[0] = v14;
  v17 = (void *)MEMORY[0x1E0C99D80];
  v18 = v16;
  objc_msgSend(v17, "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRegions:", v19);
  objc_msgSend(v3, "setPrimaryRegionIdentifier:", v18);

  objc_msgSend(v3, "setCertificates:", 0);
  objc_msgSend(v3, "setLastUpdatedTag:", 0);
  objc_msgSend(v3, "setConsistencyCheckBackoffLevel:", 0);
  objc_msgSend(v3, "setVersion:", 1);

}

- (NSString)nextPushToken
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setNextPushToken:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 96);
}

- (int64_t)registrationType
{
  return self->_registrationType;
}

- (void)setRegistrationType:(int64_t)a3
{
  self->_registrationType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastUpdatedTag, 0);
  objc_storeStrong((id *)&self->_certificates, 0);
  objc_storeStrong((id *)&self->_primaryRegionIdentifier, 0);
  objc_storeStrong((id *)&self->_configurationDate, 0);
  objc_storeStrong((id *)&self->_archivedDate, 0);
  objc_storeStrong((id *)&self->_registrationDate, 0);
  objc_storeStrong((id *)&self->_companionSerialNumber, 0);
  objc_storeStrong((id *)&self->_nextPushToken, 0);
  objc_storeStrong((id *)&self->_pushToken, 0);
  objc_storeStrong((id *)&self->_secureElementID, 0);
  objc_storeStrong((id *)&self->_deviceID, 0);
  objc_storeStrong((id *)&self->_featureSupportedLanguageCache, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_regions, 0);
  objc_storeStrong((id *)&self->_verificationRequestsByPassUniqueID, 0);
}

@end
