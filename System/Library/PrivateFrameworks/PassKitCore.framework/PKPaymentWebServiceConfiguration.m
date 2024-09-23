@implementation PKPaymentWebServiceConfiguration

- (id)_regionsForOSVersion:(id)a3 deviceClass:(id)a4 platform:(id)a5 supportedRegions:(BOOL)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  void *v21;
  os_unfair_lock_s *lock;
  os_unfair_lock_s *locka;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (a6)
    -[PKPaymentWebServiceConfiguration _lock_regions](self, "_lock_regions", lock);
  else
    -[PKPaymentWebServiceConfiguration _lock_unsupported_regions](self, "_lock_unsupported_regions", lock);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v14 = v13;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v27 != v17)
          objc_enumerationMutation(v14);
        v19 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v14, "objectForKey:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20
          && -[PKPaymentWebServiceConfiguration _lock_supportedForOSVersion:inRegionDictionary:deviceClass:platform:](self, "_lock_supportedForOSVersion:inRegionDictionary:deviceClass:platform:", v10, v20, v11, v12))
        {
          objc_msgSend(v25, "addObject:", v19);
        }

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v16);
  }

  v21 = (void *)objc_msgSend(v25, "copy");
  os_unfair_lock_unlock(locka);

  return v21;
}

- (id)_lock_regions
{
  return -[NSDictionary objectForKey:](self->_configuration, "objectForKey:", CFSTR("SupportedRegions"));
}

- (void)encodeWithCoder:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  objc_msgSend(v5, "encodeObject:forKey:", self->_configuration, CFSTR("configuration"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_configurationURL, CFSTR("configurationURL"));

  os_unfair_lock_unlock(p_lock);
}

- (id)heroImageManifestURLForRegion:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[PKPaymentWebServiceConfiguration _lock_region:](self, "_lock_region:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKey:", CFSTR("PaymentSetupImageManifestURLV3"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  os_unfair_lock_unlock(p_lock);

  return v8;
}

- (NSURL)configurationURL
{
  return (NSURL *)objc_getProperty(self, a2, 32, 1);
}

- (unint64_t)notificationAuthorizationPromptPresentationCount
{
  os_unfair_lock_s *p_lock;
  int64_t v4;
  unint64_t v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = -[NSDictionary PKIntegerForKey:](self->_configuration, "PKIntegerForKey:", CFSTR("notificationAuthorizationPromptPresentationCount"));
  if (v4)
    v5 = v4;
  else
    v5 = 3;
  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (BOOL)regionHasProvisioningEnablementPercentage:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;
  void *v7;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[PKPaymentWebServiceConfiguration _lock_region:](self, "_lock_region:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKey:", CFSTR("ProvisioningEnablementPercentage"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);

  return v7 != 0;
}

- (id)_lock_region:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PKPaymentWebServiceConfiguration _lock_regions](self, "_lock_regions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    PKLogFacilityTypeGetObject(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = 138412290;
      v10 = v4;
      _os_log_error_impl(&dword_18FC92000, v7, OS_LOG_TYPE_ERROR, "Region %@ requested but no region data found!", (uint8_t *)&v9, 0xCu);
    }

  }
  return v6;
}

- (id)supportedRegionsForOSVersion:(id)a3 deviceClass:(id)a4 platform:(id)a5
{
  return -[PKPaymentWebServiceConfiguration _regionsForOSVersion:deviceClass:platform:supportedRegions:](self, "_regionsForOSVersion:deviceClass:platform:supportedRegions:", a3, a4, a5, 1);
}

- (id)supportedRegionsForOSVersion:(id)a3 deviceClass:(id)a4
{
  return -[PKPaymentWebServiceConfiguration supportedRegionsForOSVersion:deviceClass:platform:](self, "supportedRegionsForOSVersion:deviceClass:platform:", a3, a4, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentWebServiceConfiguration)initWithCoder:(id)a3
{
  id v4;
  PKPaymentWebServiceConfiguration *v5;
  PKPaymentWebServiceConfiguration *v6;
  void *v7;
  uint64_t v8;
  NSDictionary *configuration;
  uint64_t v10;
  NSURL *configurationURL;

  v4 = a3;
  v5 = -[PKPaymentWebServiceConfiguration init](self, "init");
  v6 = v5;
  if (v5)
  {
    os_unfair_lock_lock(&v5->_lock);
    objc_msgSend(v4, "decodePropertyListForKey:", CFSTR("configuration"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PKDeepCopyDeduplicatedWithHashTable(v7, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    configuration = v6->_configuration;
    v6->_configuration = (NSDictionary *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("configurationURL"));
    v10 = objc_claimAutoreleasedReturnValue();
    configurationURL = v6->_configurationURL;
    v6->_configurationURL = (NSURL *)v10;

    os_unfair_lock_unlock(&v6->_lock);
  }

  return v6;
}

- (PKPaymentWebServiceConfiguration)init
{
  PKPaymentWebServiceConfiguration *v2;
  PKPaymentWebServiceConfiguration *v3;
  NSDictionary *v4;
  NSDictionary *configuration;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKPaymentWebServiceConfiguration;
  v2 = -[PKPaymentWebServiceConfiguration init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99D80]);
    configuration = v3->_configuration;
    v3->_configuration = v4;

  }
  return v3;
}

- (PKPaymentWebServiceConfiguration)initWithConfiguration:(id)a3 url:(id)a4
{
  id v6;
  id v7;
  PKPaymentWebServiceConfiguration *v8;
  uint64_t v9;
  NSDictionary *configuration;
  uint64_t v11;
  NSURL *configurationURL;

  v6 = a3;
  v7 = a4;
  v8 = -[PKPaymentWebServiceConfiguration init](self, "init");
  if (v8)
  {
    PKDeepCopyDeduplicatedWithHashTable(v6, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    configuration = v8->_configuration;
    v8->_configuration = (NSDictionary *)v9;

    v11 = objc_msgSend(v7, "copy");
    configurationURL = v8->_configurationURL;
    v8->_configurationURL = (NSURL *)v11;

  }
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[NSDictionary isEqualToDictionary:](self->_configuration, "isEqualToDictionary:", v4[3]);

  return v5;
}

- (unint64_t)hash
{
  return -[NSDictionary hash](self->_configuration, "hash");
}

- (id)brokerURLForRegion:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[PKPaymentWebServiceConfiguration _lock_region:](self, "_lock_region:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("serverURL"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }
  os_unfair_lock_unlock(p_lock);

  return v8;
}

- (id)paymentServicesURLForRegion:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[PKPaymentWebServiceConfiguration _lock_region:](self, "_lock_region:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("PaymentServicesURL"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }
  os_unfair_lock_unlock(p_lock);

  return v8;
}

- (id)paymentRelayServiceURLForRegion:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[PKPaymentWebServiceConfiguration _lock_region:](self, "_lock_region:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("PaymentRelayServiceURL"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }
  os_unfair_lock_unlock(p_lock);

  return v8;
}

- (id)paymentServicesMerchantURLForRegion:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[PKPaymentWebServiceConfiguration _lock_region:](self, "_lock_region:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("PaymentServicesMerchantURL"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }
  os_unfair_lock_unlock(p_lock);

  return v8;
}

- (BOOL)buddyProvisioningEnabledForRegion:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[PKPaymentWebServiceConfiguration _lock_region:](self, "_lock_region:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKey:", CFSTR("BuddyProvisioningEnabled"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    v9 = objc_msgSend(v7, "BOOLValue");
  else
    v9 = 1;
  os_unfair_lock_unlock(p_lock);

  return v9;
}

- (BOOL)buddyManualProvisioningEnabledForRegion:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;
  void *v7;
  char v8;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[PKPaymentWebServiceConfiguration _lock_region:](self, "_lock_region:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKey:", CFSTR("BuddyManualProvisioningEnabled"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  os_unfair_lock_unlock(p_lock);
  return v8;
}

- (BOOL)manualProvisioningEnabledForRegion:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;
  void *v7;
  char v8;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[PKPaymentWebServiceConfiguration _lock_region:](self, "_lock_region:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKey:", CFSTR("ManualProvisioningEnabled"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  os_unfair_lock_unlock(p_lock);
  return v8;
}

- (BOOL)cameraFirstProvisioningEnabledForRegion:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[PKPaymentWebServiceConfiguration _lock_region:](self, "_lock_region:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKey:", CFSTR("CameraFirstProvisioningEnabledV2"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    v9 = objc_msgSend(v7, "BOOLValue");
  else
    v9 = 1;
  os_unfair_lock_unlock(p_lock);

  return v9;
}

- (BOOL)tapToProvisionEnabledForRegion:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  BOOL v10;
  uint8_t v12[16];

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[PKPaymentWebServiceConfiguration _lock_region:](self, "_lock_region:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKey:", CFSTR("TapToProvisionEnabled"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7 || (objc_msgSend(v7, "BOOLValue") & 1) == 0)
  {
    if (!PKEnableTapToProvision())
    {
      v10 = 0;
      goto LABEL_9;
    }
    PKLogFacilityTypeGetObject(0x23uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Enabling Tap To Provision from Internal Settings override", v12, 2u);
    }

  }
  v10 = 1;
LABEL_9:
  os_unfair_lock_unlock(p_lock);

  return v10;
}

- (BOOL)tapToProvisionFirstProvisioningEnabledForRegion:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[PKPaymentWebServiceConfiguration _lock_region:](self, "_lock_region:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKey:", CFSTR("TapToProvisionFirstProvisioningEnabled"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    v9 = objc_msgSend(v7, "BOOLValue");
  else
    v9 = 1;
  os_unfair_lock_unlock(p_lock);

  return v9;
}

- (id)paymentSetupFeaturedNetworksForRegion:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[PKPaymentWebServiceConfiguration _lock_region:](self, "_lock_region:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("PaymentSetupFeaturedNetworksV3"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "count"))
  {
    objc_msgSend(v6, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("PaymentSetupFeaturedNetworksV2"));
    v8 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v8;
  }
  if (objc_msgSend(v7, "count"))
  {
    v9 = (void *)objc_msgSend(v7, "copy");
  }
  else
  {
    objc_msgSend(v6, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("PaymentSetupFeaturedNetworks"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v10, "count"));
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v12 = v10;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v22;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v22 != v15)
            objc_enumerationMutation(v12);
          PKPaymentNetworkNameForPaymentCredentialType(objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v16), "integerValue", (_QWORD)v21));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
            objc_msgSend(v11, "addObject:", v17);

          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v14);
    }

    v9 = (void *)objc_msgSend(v11, "copy");
  }
  os_unfair_lock_unlock(p_lock);
  if (v9)
    v18 = v9;
  else
    v18 = (void *)MEMORY[0x1E0C9AA60];
  v19 = v18;

  return v19;
}

- (id)primaryFeaturedNetworkForRegion:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[PKPaymentWebServiceConfiguration _lock_region:](self, "_lock_region:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "PKStringForKey:", CFSTR("PaymentSetupPrimaryFeaturedNetworkV2"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(v6, "PKNumberForKey:", CFSTR("PaymentSetupPrimaryFeaturedNetwork"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PKPaymentNetworkNameForPaymentCredentialType(objc_msgSend(v8, "integerValue"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  os_unfair_lock_unlock(p_lock);

  return v7;
}

- (id)discoveryManifestURLForRegion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  os_unfair_lock_s *p_lock;
  void *v9;
  void *v10;

  v4 = a3;
  PKDiscoveryManifestOverrideURL();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    -[PKPaymentWebServiceConfiguration _lock_region:](self, "_lock_region:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", CFSTR("DiscoveryManifestURL"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v10);
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
    os_unfair_lock_unlock(p_lock);

  }
  return v7;
}

- (id)marketsURL
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  PKMarketsURLOverride();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4
    || (-[NSDictionary PKStringForKey:](self->_configuration, "PKStringForKey:", CFSTR("MarketGeosURL")),
        (v4 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  os_unfair_lock_unlock(p_lock);

  return v5;
}

- (id)defaultServerURL
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSDictionary PKStringForKey:](self->_configuration, "PKStringForKey:", CFSTR("defaultServerURL"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  os_unfair_lock_unlock(p_lock);

  return v5;
}

- (BOOL)suppressCardholderNameFieldForRegion:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[PKPaymentWebServiceConfiguration _lock_region:](self, "_lock_region:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKey:", CFSTR("PaymentSetupSuppressCardholderName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    v9 = objc_msgSend(v7, "BOOLValue");
  else
    v9 = 0;
  os_unfair_lock_unlock(p_lock);

  return v9;
}

- (id)paymentSetupBrowsableProductTypesForRegion:(id)a3
{
  id v4;
  void *v5;
  os_unfair_lock_s *p_lock;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[PKPaymentWebServiceConfiguration _lock_region:](self, "_lock_region:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("PaymentSetupBrowsableProductTypes"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v13 = PKPaymentSetupProductTypeFromString(*(void **)(*((_QWORD *)&v17 + 1) + 8 * v12));
        if (v13)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v14);

        }
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }
  os_unfair_lock_unlock(p_lock);
  v15 = (void *)objc_msgSend(v5, "copy");

  return v15;
}

- (double)provisioningEnablementPercentageForRegion:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[PKPaymentWebServiceConfiguration _lock_region:](self, "_lock_region:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKey:", CFSTR("ProvisioningEnablementPercentage"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "doubleValue");
    v10 = v9;
  }
  else
  {
    v10 = 1.0;
  }
  os_unfair_lock_unlock(p_lock);

  return v10;
}

- (double)deviceUpgradeTaskEnablementPercentageForRegion:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[PKPaymentWebServiceConfiguration _lock_region:](self, "_lock_region:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKey:", CFSTR("deviceUpgradeTasksEnablementPercentage"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  if (v7
    || (-[NSDictionary objectForKey:](self->_configuration, "objectForKey:", CFSTR("deviceUpgradeTasksEnablementPercentage")), (v7 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend(v7, "doubleValue");
    v9 = 1.0;
    if (v8 <= 1.0)
      v9 = v8;
    if (v8 >= 0.0)
      v10 = v9;
    else
      v10 = 0.0;
  }
  else
  {
    v10 = 1.0;
  }

  return v10;
}

- (BOOL)paymentTransactionIconsEnabledForRegion:(id)a3
{
  __CFString *v4;
  os_unfair_lock_s *p_lock;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  BOOL v10;

  v4 = (__CFString *)a3;
  if (!-[__CFString length](v4, "length"))
  {

    v4 = CFSTR("US");
  }
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[PKPaymentWebServiceConfiguration _lock_region:](self, "_lock_region:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("PaymentTransactionIconsEnabled"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = objc_msgSend(v7, "BOOLValue");
  }
  else
  {
    if ((-[__CFString isEqualToString:](v4, "isEqualToString:", CFSTR("US")) & 1) != 0
      || (-[__CFString isEqualToString:](v4, "isEqualToString:", CFSTR("GB")) & 1) != 0
      || (-[__CFString isEqualToString:](v4, "isEqualToString:", CFSTR("CA")) & 1) != 0
      || (-[__CFString isEqualToString:](v4, "isEqualToString:", CFSTR("DE")) & 1) != 0)
    {
      v10 = 1;
      goto LABEL_11;
    }
    v9 = -[__CFString isEqualToString:](v4, "isEqualToString:", CFSTR("NL"));
  }
  v10 = v9;
LABEL_11:
  os_unfair_lock_unlock(p_lock);

  return v10;
}

- (BOOL)peerPaymentEnabledForRegion:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[PKPaymentWebServiceConfiguration _lock_region:](self, "_lock_region:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKey:", CFSTR("PeerPaymentSupported"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    v9 = objc_msgSend(v7, "BOOLValue");
  else
    v9 = 0;
  os_unfair_lock_unlock(p_lock);

  return v9;
}

- (BOOL)userCanResetCloudStoreApplePayViewForRegion:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[PKPaymentWebServiceConfiguration _lock_region:](self, "_lock_region:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKey:", CFSTR("UserCanResetCloudApplePayView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    v9 = objc_msgSend(v7, "BOOLValue");
  else
    v9 = 0;
  os_unfair_lock_unlock(p_lock);

  return v9;
}

- (id)betaPaymentNetworksForRegion:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[PKPaymentWebServiceConfiguration _lock_region:](self, "_lock_region:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("BetaPaymentNetworks"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
    v8 = (void *)objc_msgSend(v7, "copy");
  else
    v8 = (void *)MEMORY[0x1E0C9AA60];
  os_unfair_lock_unlock(p_lock);

  return v8;
}

- (id)betaPaymentNetworkVersionsForRegion:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[PKPaymentWebServiceConfiguration _lock_region:](self, "_lock_region:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("BetaPaymentNetworkVersions"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
    v8 = (void *)objc_msgSend(v7, "copy");
  else
    v8 = 0;
  os_unfair_lock_unlock(p_lock);
  if (v8)
    v9 = v8;
  else
    v9 = (void *)MEMORY[0x1E0C9AA60];
  v10 = v9;

  return v10;
}

- (id)unsupportedRegionsForOSVersion:(id)a3 deviceClass:(id)a4
{
  return -[PKPaymentWebServiceConfiguration unsupportedRegionsForOSVersion:deviceClass:platform:](self, "unsupportedRegionsForOSVersion:deviceClass:platform:", a3, a4, 0);
}

- (id)unsupportedRegionsForOSVersion:(id)a3 deviceClass:(id)a4 platform:(id)a5
{
  return -[PKPaymentWebServiceConfiguration _regionsForOSVersion:deviceClass:platform:supportedRegions:](self, "_regionsForOSVersion:deviceClass:platform:supportedRegions:", a3, a4, a5, 0);
}

- (id)_featuresFromDictionary:(id)a3 withRegion:(id)a4 osVersion:(id)a5 deviceClass:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  int v18;
  uint64_t i;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  void *v25;
  int v26;
  void *v27;
  __int128 v29;
  id v30;
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  void *v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v31 = a5;
  v30 = a6;
  os_unfair_lock_assert_owner(&self->_lock);
  v32 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v12 = v10;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
  if (v13)
  {
    v15 = v13;
    v16 = *(_QWORD *)v34;
    if (v31)
      v17 = v30 == 0;
    else
      v17 = 1;
    v18 = !v17;
    *(_QWORD *)&v14 = 138412290;
    v29 = v14;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v34 != v16)
          objc_enumerationMutation(v12);
        v20 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        v21 = PKWebServiceRegionFeatureTypeFromString(v20);
        if (v21)
        {
          v22 = v21;
          objc_msgSend(v12, "objectForKey:", v20);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          +[PKWebServiceRegionFeature regionFeatureWithType:dictionary:region:](PKWebServiceRegionFeature, "regionFeatureWithType:dictionary:region:", v22, v23, v11);
          v24 = objc_claimAutoreleasedReturnValue();

          if (v24)
          {
            if (!v18
              || (-[NSObject versionRange](v24, "versionRange"),
                  v25 = (void *)objc_claimAutoreleasedReturnValue(),
                  v26 = objc_msgSend(v25, "versionMeetsRequirements:deviceClass:", v31, v30),
                  v25,
                  v26))
            {
              objc_msgSend(v32, "addObject:", v24, v29);
            }
          }
        }
        else
        {
          PKLogFacilityTypeGetObject(6uLL);
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v29;
            v38 = v20;
            _os_log_impl(&dword_18FC92000, v24, OS_LOG_TYPE_DEFAULT, "Unknown feature with identifier: %@", buf, 0xCu);
          }
        }

      }
      v15 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    }
    while (v15);
  }

  v27 = (void *)objc_msgSend(v32, "copy");
  return v27;
}

- (id)supportedFeatureOfType:(int64_t)a3 inRegion:(id)a4 osVersion:(id)a5 deviceClass:(id)a6 didFailOSVersionRequirements:(BOOL *)a7
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  id v18;

  v12 = a5;
  v13 = a6;
  if (a7)
    *a7 = 0;
  -[PKPaymentWebServiceConfiguration featureWithType:inRegion:](self, "featureWithType:inRegion:", a3, a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (!v14)
    goto LABEL_8;
  objc_msgSend(v14, "versionRange");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "versionMeetsRequirements:deviceClass:", v12, v13);

  if (!v17)
  {
    if (a7)
    {
      v18 = 0;
      *a7 = 1;
      goto LABEL_9;
    }
LABEL_8:
    v18 = 0;
    goto LABEL_9;
  }
  v18 = v15;
LABEL_9:

  return v18;
}

- (BOOL)hasFeatureRequiringRegistrationInRegion:(id)a3 osVersion:(id)a4 deviceClass:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  float v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  float v26;
  char v27;
  os_unfair_lock_s *p_lock;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t k;
  void *v35;
  void *v36;
  char v37;
  float v38;
  id v40;
  id v41;
  os_unfair_lock_s *lock;
  void *v43;
  id obj;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint8_t buf[16];
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v11 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  PKRegionFeatureOverride();
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
  v43 = v10;
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v55;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v55 != v14)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
        objc_msgSend(v16, "enablementThreshold");
        if (v17 > 0.0 && (objc_msgSend(v16, "registrationType") == 2 || objc_msgSend(v16, "registrationType") == 3))
        {
          PKLogFacilityTypeGetObject(6uLL);
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_18FC92000, v29, OS_LOG_TYPE_DEFAULT, "Override feature adding support for region.", buf, 2u);
          }

          v27 = 1;
          v30 = obj;
          goto LABEL_42;
        }
      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
      if (v13)
        continue;
      break;
    }
  }

  -[PKPaymentWebServiceConfiguration _lock_featuresForRegion:osVersion:deviceClass:](self, "_lock_featuresForRegion:osVersion:deviceClass:", v8, v9, v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
  v40 = v9;
  v41 = v8;
  if (v19)
  {
    v20 = v19;
    v21 = 0;
    v22 = *(_QWORD *)v50;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v50 != v22)
          objc_enumerationMutation(v18);
        v24 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * j);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v24, "featureType"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v25);

        objc_msgSend(v24, "enablementThreshold");
        if (v26 > 0.0 && (objc_msgSend(v24, "registrationType") == 2 || objc_msgSend(v24, "registrationType") == 3))
          v21 = 1;
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
    }
    while (v20);

    v9 = v40;
    v8 = v41;
    if ((v21 & 1) != 0)
    {
      v27 = 1;
      p_lock = &self->_lock;
      goto LABEL_43;
    }
  }
  else
  {

  }
  -[PKPaymentWebServiceConfiguration _lock_globalFeaturesForOSVersion:deviceClass:](self, "_lock_globalFeaturesForOSVersion:deviceClass:", v9, v43);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v45, v58, 16);
  if (v31)
  {
    v32 = v31;
    v27 = 0;
    v33 = *(_QWORD *)v46;
    do
    {
      for (k = 0; k != v32; ++k)
      {
        if (*(_QWORD *)v46 != v33)
          objc_enumerationMutation(v30);
        v35 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * k);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v35, "featureType"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v11, "containsObject:", v36);

        if ((v37 & 1) == 0)
        {
          objc_msgSend(v35, "enablementThreshold");
          if (v38 > 0.0 && (objc_msgSend(v35, "registrationType") == 2 || objc_msgSend(v35, "registrationType") == 3))
            v27 = 1;
        }
      }
      v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v45, v58, 16);
    }
    while (v32);
    v9 = v40;
    v8 = v41;
  }
  else
  {
    v27 = 0;
  }
LABEL_42:
  p_lock = lock;

LABEL_43:
  os_unfair_lock_unlock(p_lock);

  return v27 & 1;
}

- (id)_lock_globalFeaturesForOSVersion:(id)a3 deviceClass:(id)a4
{
  os_unfair_lock_s *p_lock;
  id v7;
  id v8;
  void *v9;
  void *v10;

  p_lock = &self->_lock;
  v7 = a4;
  v8 = a3;
  os_unfair_lock_assert_owner(p_lock);
  -[NSDictionary PKDictionaryForKey:](self->_configuration, "PKDictionaryForKey:", CFSTR("globalFeatures"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentWebServiceConfiguration _featuresFromDictionary:withRegion:osVersion:deviceClass:](self, "_featuresFromDictionary:withRegion:osVersion:deviceClass:", v9, 0, v8, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)featuresForRegion:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;
  void *v7;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[PKPaymentWebServiceConfiguration _lock_featuresForRegion:](self, "_lock_featuresForRegion:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v6, "copy");
  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (id)_lock_featuresForRegion:(id)a3
{
  return -[PKPaymentWebServiceConfiguration _lock_featuresForRegion:osVersion:deviceClass:](self, "_lock_featuresForRegion:osVersion:deviceClass:", a3, 0, 0);
}

- (id)_lock_featuresForRegion:(id)a3 osVersion:(id)a4 deviceClass:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  os_unfair_lock_assert_owner(&self->_lock);
  -[PKPaymentWebServiceConfiguration _lock_region:](self, "_lock_region:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "PKDictionaryForKey:", CFSTR("features"));
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
  }
  else
  {
    -[PKPaymentWebServiceConfiguration _lock_unsupported_region:](self, "_lock_unsupported_region:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "PKDictionaryForKey:", CFSTR("features"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v14;
  }
  -[PKPaymentWebServiceConfiguration _featuresFromDictionary:withRegion:osVersion:deviceClass:](self, "_featuresFromDictionary:withRegion:osVersion:deviceClass:", v13, v8, v9, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)featureWithType:(int64_t)a3 inRegion:(id)a4
{
  id v6;
  os_unfair_lock_s *p_lock;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  PKPaymentWebServiceConfiguration *v31;
  os_unfair_lock_s *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint8_t v46[128];
  uint8_t buf[4];
  int64_t v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  PKRegionFeatureOverride();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
  if (!v9)
    goto LABEL_16;
  v10 = v9;
  v31 = self;
  v32 = &self->_lock;
  v11 = 0;
  v12 = *(_QWORD *)v42;
  do
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v42 != v12)
        objc_enumerationMutation(v8);
      v14 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
      objc_msgSend(v14, "region", v31, v32);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "featureType") == a3 && (!v15 || v6 && objc_msgSend(v6, "isEqual:", v15)))
      {
        v16 = v14;

        PKLogFacilityTypeGetObject(6uLL);
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          v48 = a3;
          _os_log_impl(&dword_18FC92000, v17, OS_LOG_TYPE_DEFAULT, "Using override for feature of type: %ld", buf, 0xCu);
        }

        v11 = v16;
      }

    }
    v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
  }
  while (v10);
  self = v31;
  p_lock = v32;
  if (!v11)
  {
LABEL_16:
    -[PKPaymentWebServiceConfiguration _lock_featuresForRegion:](self, "_lock_featuresForRegion:", v6);
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v18 = (id)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v38;
LABEL_18:
      v22 = 0;
      while (1)
      {
        if (*(_QWORD *)v38 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v22);
        if (objc_msgSend(v23, "featureType") == a3)
          break;
        if (v20 == ++v22)
        {
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
          if (v20)
            goto LABEL_18;
          goto LABEL_24;
        }
      }
      v11 = v23;

      if (v11)
        goto LABEL_37;
    }
    else
    {
LABEL_24:

    }
    -[PKPaymentWebServiceConfiguration _lock_globalFeaturesForOSVersion:deviceClass:](self, "_lock_globalFeaturesForOSVersion:deviceClass:", 0, 0);
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v24 = (id)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v34;
      while (2)
      {
        for (j = 0; j != v26; ++j)
        {
          if (*(_QWORD *)v34 != v27)
            objc_enumerationMutation(v24);
          v29 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * j);
          if (objc_msgSend(v29, "featureType") == a3)
          {
            v11 = v29;
            goto LABEL_36;
          }
        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
        if (v26)
          continue;
        break;
      }
    }
    v11 = 0;
LABEL_36:

  }
LABEL_37:
  os_unfair_lock_unlock(p_lock);

  return v11;
}

- (id)unsupportedWebPaymentConfigurations
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSDictionary PKArrayForKey:](self->_configuration, "PKArrayForKey:", CFSTR("UnsupportedWebPaymentConfigurations"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (BOOL)remotePaymentsRequiredForVoiceover
{
  PKPaymentWebServiceConfiguration *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = -[NSDictionary PKBoolForKey:](v2->_configuration, "PKBoolForKey:", CFSTR("MandateRemotePayments"));
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)accountServiceEnabledForRegion:(id)a3
{
  __CFString *v4;
  os_unfair_lock_s *p_lock;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  NSObject *v11;
  _BOOL4 v12;
  const char *v13;
  int v15;
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = (__CFString *)a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[PKPaymentWebServiceConfiguration _lock_region:](self, "_lock_region:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("accountServiceEnabled"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    LOBYTE(v9) = objc_msgSend(v7, "BOOLValue");
  else
    LOBYTE(v9) = 0;
  PKAccountServiceOverrideURL();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v9 & 1) == 0 && v10)
  {
    v9 = -[__CFString isEqualToString:](v4, "isEqualToString:", CFSTR("US"));
    PKLogFacilityTypeGetObject(0xEuLL);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v12)
      {
        v15 = 138412290;
        v16 = CFSTR("YES");
        v13 = "Account service enabled in region overrideURLActive: %@";
LABEL_11:
        _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v15, 0xCu);
      }
    }
    else if (v12)
    {
      v15 = 138412290;
      v16 = v4;
      v13 = "Warning: Toggle region not allowed: %@";
      goto LABEL_11;
    }

  }
  os_unfair_lock_unlock(p_lock);

  return v9;
}

- (BOOL)applyServiceEnabledForRegion:(id)a3
{
  __CFString *v4;
  os_unfair_lock_s *p_lock;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  NSObject *v11;
  _BOOL4 v12;
  const char *v13;
  int v15;
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = (__CFString *)a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[PKPaymentWebServiceConfiguration _lock_region:](self, "_lock_region:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("applyServiceEnabled"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    LOBYTE(v9) = objc_msgSend(v7, "BOOLValue");
  else
    LOBYTE(v9) = 0;
  PKApplyServiceOverrideURL();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v9 & 1) == 0 && v10)
  {
    v9 = -[__CFString isEqualToString:](v4, "isEqualToString:", CFSTR("US"));
    PKLogFacilityTypeGetObject(0xDuLL);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v12)
      {
        v15 = 138412290;
        v16 = CFSTR("YES");
        v13 = "Apply service enabled in region overrideURLActive: %@";
LABEL_11:
        _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v15, 0xCu);
      }
    }
    else if (v12)
    {
      v15 = 138412290;
      v16 = v4;
      v13 = "Warning: Toggle region not allowed: %@";
      goto LABEL_11;
    }

  }
  os_unfair_lock_unlock(p_lock);

  return v9;
}

- (id)applyServiceFeaturesForRegion:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[PKPaymentWebServiceConfiguration _lock_region:](self, "_lock_region:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "PKDictionaryForKey:", CFSTR("applyServiceFeatures"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");

  os_unfair_lock_unlock(p_lock);
  return v8;
}

- (BOOL)AMPNonDefaultBehaviourDisabledForRegion:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[PKPaymentWebServiceConfiguration _lock_region:](self, "_lock_region:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = objc_msgSend(v6, "PKBoolForKey:", CFSTR("AMPNonDefaultBehaviorDisabled"));
  os_unfair_lock_unlock(p_lock);

  return (char)v5;
}

- (id)numberOfDaysBetweenMapsReprocessingForRegion:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;
  void *v7;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[PKPaymentWebServiceConfiguration _lock_region:](self, "_lock_region:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "PKNumberForKey:", CFSTR("MapsReprocessingWaitTime"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);

  return v7;
}

- (BOOL)browseProvisioningBankAppsEnabledForRegion:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[PKPaymentWebServiceConfiguration _lock_region:](self, "_lock_region:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = objc_msgSend(v6, "PKBoolForKey:", CFSTR("BrowseProvisioningBankAppsEnabled"));
  os_unfair_lock_unlock(p_lock);

  return (char)v5;
}

- (id)marketGeoRegionNotificationTimeRangeForRegion:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;
  void *v7;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[PKPaymentWebServiceConfiguration _lock_region:](self, "_lock_region:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "PKNumberForKey:", CFSTR("MarketGeoRegionNotificationTimeRange"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);

  return v7;
}

- (id)marketGeoRegionNotificationNetworkThresholdsForRegion:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[PKPaymentWebServiceConfiguration _lock_region:](self, "_lock_region:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "PKDictionaryForKey:", CFSTR("MarketGeoRegionNotificationNetworkThresholds"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  if (v7)
    v8 = v7;
  else
    v8 = (void *)MEMORY[0x1E0C9AA70];
  v9 = v8;

  return v9;
}

- (double)deviceCheckInIntervalForRegion:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[PKPaymentWebServiceConfiguration _lock_region:](self, "_lock_region:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "PKDoubleForKey:", CFSTR("DeviceCheckInInterval"));
  v8 = 604800.0;
  if (v7 <= 604800.0)
    v8 = v7;
  if (v7 < 600.0)
    v8 = 600.0;
  if (v7 == 0.0)
    v9 = 0.0;
  else
    v9 = v8;
  os_unfair_lock_unlock(p_lock);

  return v9;
}

- (BOOL)deviceCheckInDisabledForRegion:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[PKPaymentWebServiceConfiguration _lock_region:](self, "_lock_region:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = objc_msgSend(v6, "PKBoolForKey:", CFSTR("DeviceCheckInDisabled"));
  os_unfair_lock_unlock(p_lock);

  return (char)v5;
}

- (BOOL)shouldEnableTransitServiceCheckInForRegion:(id)a3
{
  id v4;
  NSObject *v5;
  char v6;
  os_unfair_lock_s *p_lock;
  void *v8;
  uint8_t v10[16];

  v4 = a3;
  if (PKForceEnableTransitServiceCheckIn())
  {
    PKLogFacilityTypeGetObject(0xCuLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Transit service check in enabled by internal toggle", v10, 2u);
    }

    v6 = 1;
  }
  else
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    -[PKPaymentWebServiceConfiguration _lock_region:](self, "_lock_region:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v8, "PKBoolForKey:", CFSTR("EnableTransitServiceCheckIn"));
    os_unfair_lock_unlock(p_lock);

  }
  return v6;
}

- (id)contactFormatConfiguration
{
  os_unfair_lock_s *p_lock;
  void *v4;
  PKContactFormatConfiguration *v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSDictionary PKDictionaryForKey:](self->_configuration, "PKDictionaryForKey:", CFSTR("contactFormatConfiguration"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = -[PKContactFormatConfiguration initWithDictionary:]([PKContactFormatConfiguration alloc], "initWithDictionary:", v4);
  else
    v5 = 0;
  os_unfair_lock_unlock(p_lock);

  return v5;
}

- (id)credentialTypesRequiringMetadata
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSDictionary PKSetForKey:](self->_configuration, "PKSetForKey:", CFSTR("credentialTypesRequiringMetadata"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (id)credentialTypesRequiringDPANNotifications
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSDictionary PKSetForKey:](self->_configuration, "PKSetForKey:", CFSTR("credentialTypesRequiringDPANNotifications"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (id)relayServerHostForRegion:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[PKPaymentWebServiceConfiguration featureWithType:inRegion:](self, "featureWithType:inRegion:", 5, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "relayServerHost");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PKSharingRelayServerURLForCurrentEnvironment(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)allowedRelayServerHostsForRegion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[PKPaymentWebServiceConfiguration featureWithType:inRegion:](self, "featureWithType:inRegion:", 5, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allowedRelayServerHosts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc(MEMORY[0x1E0C99E20]);
  -[PKPaymentWebServiceConfiguration relayServerHostsToHandleUniversalLinksForRegion:](self, "relayServerHostsToHandleUniversalLinksForRegion:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(v7, "initWithArray:", v8);
  if (v6)
    objc_msgSend(v9, "addObjectsFromArray:", v6);
  objc_msgSend(v9, "addObject:", CFSTR("wallet.apple.com"));
  objc_msgSend(v9, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)relayServerHostsToHandleUniversalLinksForRegion:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[PKPaymentWebServiceConfiguration featureWithType:inRegion:](self, "featureWithType:inRegion:", 5, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "relayServerHostsToHandleUniversalLinks");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  v6 = v5;
  if (v5)
    v7 = v5;
  else
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v8 = v7;

  objc_msgSend(v3, "relayServerHost");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "safelyAddObject:", v9);

  PKSharingRelayServerURLs();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObjectsFromArray:", v10);

  v11 = (void *)objc_msgSend(v8, "copy");
  return v11;
}

- (double)dynamicAssetPrefetchTimeIntervalForRegion:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  double v10;
  double v11;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[PKPaymentWebServiceConfiguration _lock_region:](self, "_lock_region:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "PKNumberForKey:", CFSTR("dynamicAssetPrefetchTimeInterval"));
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    -[NSDictionary PKNumberForKey:](self->_configuration, "PKNumberForKey:", CFSTR("defaultDynamicAssetPrefetchTimeInterval"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(p_lock);
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 86400);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      PKLogFacilityTypeGetObject(0xAuLL);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 138412290;
        v14 = v8;
        _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Falling back to hardcoded time interval for prefetch %@", (uint8_t *)&v13, 0xCu);
      }

    }
  }
  objc_msgSend(v8, "doubleValue");
  v11 = v10;

  return v11;
}

- (double)paymentSetupFeaturesCacheUpdateIntervalForRegion:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  double v10;
  double v11;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[PKPaymentWebServiceConfiguration _lock_region:](self, "_lock_region:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "PKNumberForKey:", CFSTR("paymentSetupFeaturesCacheUpdateInterval"));
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    -[NSDictionary PKNumberForKey:](self->_configuration, "PKNumberForKey:", CFSTR("defaultPaymentSetupFeaturesCacheUpdateInterval"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(p_lock);
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 86400);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      PKLogFacilityTypeGetObject(0xAuLL);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 138412290;
        v14 = v8;
        _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Falling back to hardcoded time interval for update Payment Setup Features %@", (uint8_t *)&v13, 0xCu);
      }

    }
  }
  objc_msgSend(v8, "doubleValue");
  v11 = v10;

  return v11;
}

- (double)sharingMessageCacheTimeToLiveInterval
{
  os_unfair_lock_s *p_lock;
  void *v4;
  double v5;
  double v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSDictionary PKNumberForKey:](self->_configuration, "PKNumberForKey:", CFSTR("sharingMessageCacheTimeToLiveInterval"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 172800);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  return v6;
}

- (BOOL)quickAccessForMoreRemovePassEnabled
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;
  char v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSDictionary PKNumberForKey:](self->_configuration, "PKNumberForKey:", CFSTR("quickAccessForMoreRemovePassEnabled"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "BOOLValue");
  else
    v6 = 0;
  os_unfair_lock_unlock(p_lock);

  return v6;
}

- (id)stationCodeProvidersUsingLocalLookup
{
  os_unfair_lock_s *p_lock;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSDictionary PKArrayContaining:forKey:](self->_configuration, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("stationCodeProvidersUsingLocalLookup"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v6[0] = CFSTR("transit.apple.tmoney");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)unsupportedProvisioningExtensions
{
  os_unfair_lock_s *p_lock;
  NSDictionary *configuration;
  uint64_t v5;
  void *v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  configuration = self->_configuration;
  v5 = objc_opt_class();
  -[NSDictionary PKDictionaryOfKeyClass:valueClass:ForKey:](configuration, "PKDictionaryOfKeyClass:valueClass:ForKey:", v5, objc_opt_class(), CFSTR("unsupportedProvisioningExtensions"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (BOOL)_lock_supportedForOSVersion:(id)a3 inRegionDictionary:(id)a4 deviceClass:(id)a5 platform:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  BOOL v19;

  v9 = a3;
  v10 = a5;
  v11 = a6;
  if (a4)
  {
    objc_msgSend(a4, "objectForKey:", CFSTR("minimumOSVersion"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      v14 = v12;
      v15 = v14;
      if (v11)
      {
        objc_msgSend(v14, "objectForKey:", v11);
        v16 = objc_claimAutoreleasedReturnValue();

        v15 = (void *)v16;
      }
      objc_msgSend(v15, "objectForKey:", v10);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v17)
        v19 = (unint64_t)(objc_msgSend(v17, "compare:options:", v9, 64) + 1) < 2;
      else
        v19 = 1;

    }
    else
    {
      v19 = 1;
    }

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (id)_lock_unsupported_regions
{
  return -[NSDictionary objectForKey:](self->_configuration, "objectForKey:", CFSTR("unsupportedRegions"));
}

- (id)_lock_unsupported_region:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PKPaymentWebServiceConfiguration _lock_unsupported_regions](self, "_lock_unsupported_regions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSDictionary)configuration
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationURL, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_version, 0);
}

@end
