@implementation RadioStoreBag

- (NSDictionary)radioConfigurationDictionary
{
  return self->_tiltDictionary;
}

- (NSURL)baseURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[NSDictionary objectForKey:](self->_tiltDictionary, "objectForKey:", CFSTR("base-url"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(v2, "stringByAppendingString:", CFSTR("/"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "URLWithString:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return (NSURL *)v5;
}

- (id)_initWithURLBag:(id)a3
{
  id v4;
  RadioStoreBag *v5;
  void *v6;
  uint64_t v7;
  NSString *srdnldURLString;
  uint64_t v9;
  NSDictionary *tiltDictionary;
  void *v11;
  uint64_t v12;
  NSDictionary *mescalRequestAllowList;
  void *v14;
  uint64_t v15;
  NSDictionary *mescalResponseAllowList;
  void *v17;
  void *v18;
  uint64_t v19;
  NSString *mescalSetupCertURLString;
  uint64_t v21;
  NSString *mescalSetupURLString;
  void *v23;
  uint64_t v24;
  NSArray *amdDomains;
  void *v26;
  uint64_t v27;
  NSString *storeFrontSuffix;
  void *v29;
  uint64_t v30;
  NSNumber *shouldSendKBSyncDataValue;
  id v32;
  void *v33;
  uint64_t v34;
  SSVPlatformContext *platformContext;
  void *v37;
  objc_super v38;

  v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)RadioStoreBag;
  v5 = -[RadioStoreBag init](&v38, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "dictionaryForBagKey:", CFSTR("radio"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      v6 = 0;
    }
    objc_msgSend(v4, "stringForBagKey:", CFSTR("sRdnld"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v37, "copy");
    srdnldURLString = v5->_srdnldURLString;
    v5->_srdnldURLString = (NSString *)v7;

    v9 = objc_msgSend(v6, "copy");
    tiltDictionary = v5->_tiltDictionary;
    v5->_tiltDictionary = (NSDictionary *)v9;

    objc_msgSend(v4, "dictionaryForBagKey:", CFSTR("sign-sap-request"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = objc_msgSend(v11, "copy");
      mescalRequestAllowList = v5->_mescalRequestAllowList;
      v5->_mescalRequestAllowList = (NSDictionary *)v12;

    }
    objc_msgSend(v4, "dictionaryForBagKey:", CFSTR("sign-sap-response"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = objc_msgSend(v14, "copy");
      mescalResponseAllowList = v5->_mescalResponseAllowList;
      v5->_mescalResponseAllowList = (NSDictionary *)v15;

    }
    if (v5->_mescalRequestAllowList || v5->_mescalResponseAllowList)
    {
      objc_msgSend(v4, "stringForBagKey:", CFSTR("sign-sap-setup-cert"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "stringForBagKey:", CFSTR("sign-sap-setup"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v19 = objc_msgSend(v17, "copy");
          mescalSetupCertURLString = v5->_mescalSetupCertURLString;
          v5->_mescalSetupCertURLString = (NSString *)v19;

          v21 = objc_msgSend(v18, "copy");
          mescalSetupURLString = v5->_mescalSetupURLString;
          v5->_mescalSetupURLString = (NSString *)v21;

        }
      }

    }
    objc_msgSend(v4, "arrayForBagKey:", CFSTR("amd-domains"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v24 = objc_msgSend(v23, "copy");
      amdDomains = v5->_amdDomains;
      v5->_amdDomains = (NSArray *)v24;

    }
    objc_msgSend(v4, "stringForBagKey:", CFSTR("storefront-header-suffix"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v27 = objc_msgSend(v26, "copy");
      storeFrontSuffix = v5->_storeFrontSuffix;
      v5->_storeFrontSuffix = (NSString *)v27;

    }
    objc_msgSend(v4, "stringForBagKey:", *MEMORY[0x24BEB2B48]);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_storeStrong((id *)&v5->_leaseCertificateURLString, v29);
    objc_msgSend(v4, "numberForBagKey:", CFSTR("auth-can-post"));
    v30 = objc_claimAutoreleasedReturnValue();
    shouldSendKBSyncDataValue = v5->_shouldSendKBSyncDataValue;
    v5->_shouldSendKBSyncDataValue = (NSNumber *)v30;

    v32 = objc_alloc(MEMORY[0x24BEB2050]);
    objc_msgSend(v4, "_allValues");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v32, "initWithBagDictionary:", v33);
    platformContext = v5->_platformContext;
    v5->_platformContext = (SSVPlatformContext *)v34;

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tiltDictionary, 0);
  objc_storeStrong((id *)&self->_storeFrontSuffix, 0);
  objc_storeStrong((id *)&self->_srdnldURLString, 0);
  objc_storeStrong((id *)&self->_shouldSendKBSyncDataValue, 0);
  objc_storeStrong((id *)&self->_platformContext, 0);
  objc_storeStrong((id *)&self->_mescalSetupURLString, 0);
  objc_storeStrong((id *)&self->_mescalSetupCertURLString, 0);
  objc_storeStrong((id *)&self->_mescalResponseAllowList, 0);
  objc_storeStrong((id *)&self->_mescalRequestAllowList, 0);
  objc_storeStrong((id *)&self->_leaseCertificateURLString, 0);
  objc_storeStrong((id *)&self->_amdDomains, 0);
}

- (BOOL)isAdFreeRadioEnabled
{
  void *v2;
  char v3;

  -[NSDictionary objectForKey:](self->_tiltDictionary, "objectForKey:", CFSTR("ad-free-radio-enabled"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "BOOLValue");
  else
    v3 = 0;

  return v3;
}

- (NSString)platformLookupURLString
{
  return (NSString *)-[SSVPlatformContext lookupURLString](self->_platformContext, "lookupURLString");
}

- (BOOL)shouldMescalSignRequestWithURL:(id)a3
{
  void *v3;
  char v4;

  if (!self->_mescalRequestAllowList)
    return 0;
  objc_msgSend(a3, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = SSVURLPathMatchesActionDictionary();
  else
    v4 = 0;

  return v4;
}

- (BOOL)shouldMescalVerifyResponseFromURL:(id)a3
{
  void *v3;
  char v4;

  if (!self->_mescalResponseAllowList)
    return 0;
  objc_msgSend(a3, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = SSVURLPathMatchesActionDictionary();
  else
    v4 = 0;

  return v4;
}

- (BOOL)shouldSendKBSyncData
{
  if (!self->_shouldSendKBSyncDataValue)
    return 1;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[NSNumber BOOLValue](self->_shouldSendKBSyncDataValue, "BOOLValue");
  return 0;
}

- (id)_initWithCacheRepresentation:(id)a3
{
  id v4;
  RadioStoreBag *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSString *srdnldURLString;
  uint64_t v10;
  NSDictionary *tiltDictionary;
  void *v12;
  uint64_t v13;
  NSDictionary *mescalRequestAllowList;
  void *v15;
  uint64_t v16;
  NSDictionary *mescalResponseAllowList;
  void *v18;
  void *v19;
  uint64_t v20;
  NSString *mescalSetupCertURLString;
  uint64_t v22;
  NSString *mescalSetupURLString;
  void *v24;
  uint64_t v25;
  NSArray *amdDomains;
  void *v27;
  uint64_t v28;
  NSString *storeFrontSuffix;
  void *v30;
  uint64_t v31;
  NSNumber *shouldSendKBSyncDataValue;
  uint64_t v33;
  SSVPlatformContext *platformContext;
  RadioStoreBag *v35;
  objc_super v37;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v37.receiver = self;
    v37.super_class = (Class)RadioStoreBag;
    v5 = -[RadioStoreBag init](&v37, sel_init);
    if (v5)
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("radio"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

        v6 = 0;
      }
      objc_msgSend(v4, "objectForKey:", CFSTR("sRdnld"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "copy");
      srdnldURLString = v5->_srdnldURLString;
      v5->_srdnldURLString = (NSString *)v8;

      v10 = objc_msgSend(v6, "copy");
      tiltDictionary = v5->_tiltDictionary;
      v5->_tiltDictionary = (NSDictionary *)v10;

      objc_msgSend(v4, "objectForKey:", CFSTR("sign-sap-request"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = objc_msgSend(v12, "copy");
        mescalRequestAllowList = v5->_mescalRequestAllowList;
        v5->_mescalRequestAllowList = (NSDictionary *)v13;

      }
      objc_msgSend(v4, "objectForKey:", CFSTR("sign-sap-response"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v16 = objc_msgSend(v15, "copy");
        mescalResponseAllowList = v5->_mescalResponseAllowList;
        v5->_mescalResponseAllowList = (NSDictionary *)v16;

      }
      if (v5->_mescalRequestAllowList || v5->_mescalResponseAllowList)
      {
        objc_msgSend(v4, "objectForKey:", CFSTR("sign-sap-setup-cert"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKey:", CFSTR("sign-sap-setup"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v20 = objc_msgSend(v18, "copy");
            mescalSetupCertURLString = v5->_mescalSetupCertURLString;
            v5->_mescalSetupCertURLString = (NSString *)v20;

            v22 = objc_msgSend(v19, "copy");
            mescalSetupURLString = v5->_mescalSetupURLString;
            v5->_mescalSetupURLString = (NSString *)v22;

          }
        }

      }
      objc_msgSend(v4, "objectForKey:", CFSTR("amd-domains"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v25 = objc_msgSend(v24, "copy");
        amdDomains = v5->_amdDomains;
        v5->_amdDomains = (NSArray *)v25;

      }
      objc_msgSend(v4, "objectForKey:", CFSTR("storefront-header-suffix"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v28 = objc_msgSend(v27, "copy");
        storeFrontSuffix = v5->_storeFrontSuffix;
        v5->_storeFrontSuffix = (NSString *)v28;

      }
      objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BEB2B48]);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_storeStrong((id *)&v5->_leaseCertificateURLString, v30);
      objc_msgSend(v4, "objectForKey:", CFSTR("auth-can-post"));
      v31 = objc_claimAutoreleasedReturnValue();
      shouldSendKBSyncDataValue = v5->_shouldSendKBSyncDataValue;
      v5->_shouldSendKBSyncDataValue = (NSNumber *)v31;

      v33 = objc_msgSend(objc_alloc(MEMORY[0x24BEB2050]), "initWithBagDictionary:", v4);
      platformContext = v5->_platformContext;
      v5->_platformContext = (SSVPlatformContext *)v33;

    }
    self = v5;
    v35 = self;
  }
  else
  {
    v35 = 0;
  }

  return v35;
}

- (id)_cacheRepresentation
{
  void *v3;
  void *v4;
  NSString *srdnldURLString;
  NSDictionary *tiltDictionary;
  NSDictionary *mescalRequestAllowList;
  NSDictionary *mescalResponseAllowList;
  NSString *mescalSetupCertURLString;
  NSString *mescalSetupURLString;
  NSNumber *shouldSendKBSyncDataValue;
  NSArray *amdDomains;
  NSString *storeFrontSuffix;
  NSString *leaseCertificateURLString;
  void *v15;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  srdnldURLString = self->_srdnldURLString;
  if (srdnldURLString)
    objc_msgSend(v3, "setObject:forKey:", srdnldURLString, CFSTR("sRdnld"));
  tiltDictionary = self->_tiltDictionary;
  if (tiltDictionary)
    objc_msgSend(v4, "setObject:forKey:", tiltDictionary, CFSTR("radio"));
  mescalRequestAllowList = self->_mescalRequestAllowList;
  if (mescalRequestAllowList)
    objc_msgSend(v4, "setObject:forKey:", mescalRequestAllowList, CFSTR("sign-sap-request"));
  mescalResponseAllowList = self->_mescalResponseAllowList;
  if (mescalResponseAllowList)
    objc_msgSend(v4, "setObject:forKey:", mescalResponseAllowList, CFSTR("sign-sap-response"));
  mescalSetupCertURLString = self->_mescalSetupCertURLString;
  if (mescalSetupCertURLString)
    objc_msgSend(v4, "setObject:forKey:", mescalSetupCertURLString, CFSTR("sign-sap-setup-cert"));
  mescalSetupURLString = self->_mescalSetupURLString;
  if (mescalSetupURLString)
    objc_msgSend(v4, "setObject:forKey:", mescalSetupURLString, CFSTR("sign-sap-setup"));
  shouldSendKBSyncDataValue = self->_shouldSendKBSyncDataValue;
  if (shouldSendKBSyncDataValue)
    objc_msgSend(v4, "setObject:forKey:", shouldSendKBSyncDataValue, CFSTR("auth-can-post"));
  amdDomains = self->_amdDomains;
  if (amdDomains)
    objc_msgSend(v4, "setObject:forKey:", amdDomains, CFSTR("amd-domains"));
  storeFrontSuffix = self->_storeFrontSuffix;
  if (storeFrontSuffix)
    objc_msgSend(v4, "setObject:forKey:", storeFrontSuffix, CFSTR("storefront-header-suffix"));
  leaseCertificateURLString = self->_leaseCertificateURLString;
  if (leaseCertificateURLString)
    objc_msgSend(v4, "setObject:forKey:", leaseCertificateURLString, *MEMORY[0x24BEB2B48]);
  -[SSVPlatformContext bagDictionary](self->_platformContext, "bagDictionary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    objc_msgSend(v4, "addEntriesFromDictionary:", v15);

  return v4;
}

- (id)_platformContext
{
  return (id)-[SSVPlatformContext copy](self->_platformContext, "copy");
}

- (NSString)mescalCertificateURLString
{
  return self->_mescalSetupCertURLString;
}

- (NSString)mescalSetupURLString
{
  return self->_mescalSetupURLString;
}

- (NSString)storeFrontSuffix
{
  return self->_storeFrontSuffix;
}

- (NSString)streamingDownloadURLString
{
  return self->_srdnldURLString;
}

- (NSString)leaseCertificateURLString
{
  return self->_leaseCertificateURLString;
}

@end
