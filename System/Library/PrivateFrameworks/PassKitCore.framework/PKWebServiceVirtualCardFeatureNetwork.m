@implementation PKWebServiceVirtualCardFeatureNetwork

+ (id)virtualCardFeatureNetworksFromDictionary:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *, void *);
  void *v14;
  id v15;
  id v16;

  v3 = (objc_class *)MEMORY[0x1E0C99E08];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithCapacity:", objc_msgSend(v4, "count"));
  v6 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  objc_msgSend(v6, "setNumberStyle:", 1);
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __82__PKWebServiceVirtualCardFeatureNetwork_virtualCardFeatureNetworksFromDictionary___block_invoke;
  v14 = &unk_1E2AC3240;
  v15 = v6;
  v16 = v5;
  v7 = v5;
  v8 = v6;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", &v11);

  v9 = (void *)objc_msgSend(v7, "copy", v11, v12, v13, v14);
  return v9;
}

void __82__PKWebServiceVirtualCardFeatureNetwork_virtualCardFeatureNetworksFromDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  PKWebServiceVirtualCardFeatureNetwork *v9;
  objc_class *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  NSObject *v14;
  int v15;
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(*(id *)(a1 + 32), "numberFromString:", v5);
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = v7;
      v9 = -[PKWebServiceVirtualCardFeatureNetwork initWithDictionary:network:]([PKWebServiceVirtualCardFeatureNetwork alloc], "initWithDictionary:network:", v6, -[NSObject integerValue](v7, "integerValue"));
      if (v9)
        objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v9, v8);

    }
    else
    {
      PKLogFacilityTypeGetObject(6uLL);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = 138412290;
        v16 = v5;
        _os_log_impl(&dword_18FC92000, v14, OS_LOG_TYPE_DEFAULT, "Couldn't parse version requirement for network: Key was not a number: '%@'", (uint8_t *)&v15, 0xCu);
      }

      v8 = 0;
    }
  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412546;
      v16 = v11;
      v17 = 2112;
      v18 = v13;
      _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Couldn't parse version requirement for network: Unexpected class (key: %@, value: %@)", (uint8_t *)&v15, 0x16u);

    }
  }

}

- (PKWebServiceVirtualCardFeatureNetwork)initWithDictionary:(id)a3 network:(int64_t)a4
{
  id v6;
  PKWebServiceVirtualCardFeatureNetwork *v7;
  PKWebServiceVirtualCardFeatureNetwork *v8;
  uint64_t v9;
  NSNumber *refreshType;
  void *v11;
  PKOSVersionRequirementRange *v12;
  PKOSVersionRequirementRange *versions;

  v6 = a3;
  v7 = -[PKWebServiceVirtualCardFeatureNetwork init](self, "init");
  v8 = v7;
  if (v7)
  {
    v7->_network = a4;
    v7->_implicitlySupported = objc_msgSend(v6, "PKBoolForKey:", CFSTR("implicitlySupported"));
    objc_msgSend(v6, "PKNumberForKey:", CFSTR("refreshType"));
    v9 = objc_claimAutoreleasedReturnValue();
    refreshType = v8->_refreshType;
    v8->_refreshType = (NSNumber *)v9;

    objc_msgSend(v6, "PKDictionaryForKey:", CFSTR("versionRange"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[PKOSVersionRequirementRange initWithDictionary:]([PKOSVersionRequirementRange alloc], "initWithDictionary:", v11);
    versions = v8->_versions;
    v8->_versions = v12;

  }
  return v8;
}

- (BOOL)isSupportedOnDevice:(id)a3
{
  PKWebServiceVirtualCardFeatureNetwork *v3;
  void *v4;
  void *v5;

  if (!self->_versions)
    return 1;
  v3 = self;
  objc_msgSend(a3, "deviceClass");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKOSVersionRequirement fromDeviceVersion](PKOSVersionRequirement, "fromDeviceVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = -[PKOSVersionRequirementRange versionMeetsRequirements:deviceClass:](v3->_versions, "versionMeetsRequirements:deviceClass:", v5, v4);

  return (char)v3;
}

- (int64_t)network
{
  return self->_network;
}

- (void)setNetwork:(int64_t)a3
{
  self->_network = a3;
}

- (BOOL)implicitlySupported
{
  return self->_implicitlySupported;
}

- (void)setImplicitlySupported:(BOOL)a3
{
  self->_implicitlySupported = a3;
}

- (NSNumber)refreshType
{
  return self->_refreshType;
}

- (void)setRefreshType:(id)a3
{
  objc_storeStrong((id *)&self->_refreshType, a3);
}

- (PKOSVersionRequirementRange)versions
{
  return self->_versions;
}

- (void)setVersions:(id)a3
{
  objc_storeStrong((id *)&self->_versions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_versions, 0);
  objc_storeStrong((id *)&self->_refreshType, 0);
}

@end
