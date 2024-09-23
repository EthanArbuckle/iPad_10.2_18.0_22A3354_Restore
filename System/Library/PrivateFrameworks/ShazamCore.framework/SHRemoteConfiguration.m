@implementation SHRemoteConfiguration

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_2);
  return (id)sharedInstance_configuration;
}

void __39__SHRemoteConfiguration_sharedInstance__block_invoke()
{
  SHRemoteConfiguration *v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x24BE08190], "setSuppressEngagement:", 1);
  objc_msgSend(MEMORY[0x24BE08050], "bagForProfile:profileVersion:", CFSTR("Shazam"), CFSTR("1"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v0 = -[SHRemoteConfiguration initWithBag:]([SHRemoteConfiguration alloc], "initWithBag:", v2);
  v1 = (void *)sharedInstance_configuration;
  sharedInstance_configuration = (uint64_t)v0;

}

- (SHRemoteConfiguration)initWithBag:(id)a3
{
  id v5;
  SHRemoteConfiguration *v6;
  SHRemoteConfiguration *v7;
  void *v8;
  uint64_t v9;
  AMSBagValue *endpointsBagValue;
  void *v11;
  uint64_t v12;
  AMSBagValue *internalHostBagValue;
  void *v14;
  uint64_t v15;
  AMSBagValue *externalHostBagValue;
  void *v17;
  uint64_t v18;
  AMSBagValue *campaignTokenBagValue;
  void *v20;
  uint64_t v21;
  AMSBagValue *defaultValuesBagValue;
  void *v23;
  uint64_t v24;
  AMSBagValue *languageTagBagValue;
  void *v26;
  uint64_t v27;
  AMSBagValue *featureFlagsBagValue;
  void *v29;
  uint64_t v30;
  AMSBagValue *shazamOfferAPIHostsBagValue;
  void *v32;
  uint64_t v33;
  AMSBagValue *shazamAMPConfigurationAPIEndpointsBagValue;
  void *v35;
  uint64_t v36;
  AMSBagValue *cacheValuesBagValue;
  void *v38;
  uint64_t v39;
  AMSBagValue *recorderConfigurationBagValue;
  SHAMPConfigurationRequester *v41;
  SHAMPConfigurationRequester *configurationRequester;
  objc_super v44;

  v5 = a3;
  v44.receiver = self;
  v44.super_class = (Class)SHRemoteConfiguration;
  v6 = -[SHRemoteConfiguration init](&v44, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_amsBag, a3);
    -[SHRemoteConfiguration amsBag](v7, "amsBag");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dictionaryForKey:", CFSTR("shazam-endpoints"));
    v9 = objc_claimAutoreleasedReturnValue();
    endpointsBagValue = v7->_endpointsBagValue;
    v7->_endpointsBagValue = (AMSBagValue *)v9;

    -[SHRemoteConfiguration amsBag](v7, "amsBag");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringForKey:", CFSTR("shazam-media-api-host"));
    v12 = objc_claimAutoreleasedReturnValue();
    internalHostBagValue = v7->_internalHostBagValue;
    v7->_internalHostBagValue = (AMSBagValue *)v12;

    -[SHRemoteConfiguration amsBag](v7, "amsBag");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringForKey:", CFSTR("shazamkit-media-api-host"));
    v15 = objc_claimAutoreleasedReturnValue();
    externalHostBagValue = v7->_externalHostBagValue;
    v7->_externalHostBagValue = (AMSBagValue *)v15;

    -[SHRemoteConfiguration amsBag](v7, "amsBag");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "dictionaryForKey:", CFSTR("shazam-campaign-tokens"));
    v18 = objc_claimAutoreleasedReturnValue();
    campaignTokenBagValue = v7->_campaignTokenBagValue;
    v7->_campaignTokenBagValue = (AMSBagValue *)v18;

    -[SHRemoteConfiguration amsBag](v7, "amsBag");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "dictionaryForKey:", CFSTR("shazam-default-values"));
    v21 = objc_claimAutoreleasedReturnValue();
    defaultValuesBagValue = v7->_defaultValuesBagValue;
    v7->_defaultValuesBagValue = (AMSBagValue *)v21;

    -[SHRemoteConfiguration amsBag](v7, "amsBag");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "stringForKey:", CFSTR("language-tag"));
    v24 = objc_claimAutoreleasedReturnValue();
    languageTagBagValue = v7->_languageTagBagValue;
    v7->_languageTagBagValue = (AMSBagValue *)v24;

    -[SHRemoteConfiguration amsBag](v7, "amsBag");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "dictionaryForKey:", CFSTR("shazam-feature-flags"));
    v27 = objc_claimAutoreleasedReturnValue();
    featureFlagsBagValue = v7->_featureFlagsBagValue;
    v7->_featureFlagsBagValue = (AMSBagValue *)v27;

    -[SHRemoteConfiguration amsBag](v7, "amsBag");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "stringForKey:", CFSTR("shazam-amp-api-host"));
    v30 = objc_claimAutoreleasedReturnValue();
    shazamOfferAPIHostsBagValue = v7->_shazamOfferAPIHostsBagValue;
    v7->_shazamOfferAPIHostsBagValue = (AMSBagValue *)v30;

    -[SHRemoteConfiguration amsBag](v7, "amsBag");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "dictionaryForKey:", CFSTR("shazam-amp-api-endpoints"));
    v33 = objc_claimAutoreleasedReturnValue();
    shazamAMPConfigurationAPIEndpointsBagValue = v7->_shazamAMPConfigurationAPIEndpointsBagValue;
    v7->_shazamAMPConfigurationAPIEndpointsBagValue = (AMSBagValue *)v33;

    -[SHRemoteConfiguration amsBag](v7, "amsBag");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "dictionaryForKey:", CFSTR("shazam-cache-values"));
    v36 = objc_claimAutoreleasedReturnValue();
    cacheValuesBagValue = v7->_cacheValuesBagValue;
    v7->_cacheValuesBagValue = (AMSBagValue *)v36;

    -[SHRemoteConfiguration amsBag](v7, "amsBag");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "dictionaryForKey:", CFSTR("shazam-recorder-configuration"));
    v39 = objc_claimAutoreleasedReturnValue();
    recorderConfigurationBagValue = v7->_recorderConfigurationBagValue;
    v7->_recorderConfigurationBagValue = (AMSBagValue *)v39;

    v41 = objc_alloc_init(SHAMPConfigurationRequester);
    configurationRequester = v7->_configurationRequester;
    v7->_configurationRequester = v41;

  }
  return v7;
}

- (void)populateRemoteConfiguration
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint8_t v14[16];

  shcore_log_object();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_21AB5E000, v3, OS_LOG_TYPE_DEBUG, "Populating remote configuration...", v14, 2u);
  }

  -[SHRemoteConfiguration endpointsBagValue](self, "endpointsBagValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueWithCompletion:", &__block_literal_global_32);

  -[SHRemoteConfiguration internalHostBagValue](self, "internalHostBagValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueWithCompletion:", &__block_literal_global_33);

  -[SHRemoteConfiguration externalHostBagValue](self, "externalHostBagValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueWithCompletion:", &__block_literal_global_34);

  -[SHRemoteConfiguration languageTagBagValue](self, "languageTagBagValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "valueWithCompletion:", &__block_literal_global_35);

  -[SHRemoteConfiguration campaignTokenBagValue](self, "campaignTokenBagValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "valueWithCompletion:", &__block_literal_global_36);

  -[SHRemoteConfiguration defaultValuesBagValue](self, "defaultValuesBagValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "valueWithCompletion:", &__block_literal_global_37);

  -[SHRemoteConfiguration featureFlagsBagValue](self, "featureFlagsBagValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "valueWithCompletion:", &__block_literal_global_38);

  -[SHRemoteConfiguration shazamAMPConfigurationAPIEndpointsBagValue](self, "shazamAMPConfigurationAPIEndpointsBagValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "valueWithCompletion:", &__block_literal_global_39);

  -[SHRemoteConfiguration cacheValuesBagValue](self, "cacheValuesBagValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "valueWithCompletion:", &__block_literal_global_40);

  -[SHRemoteConfiguration recorderConfigurationBagValue](self, "recorderConfigurationBagValue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "valueWithCompletion:", &__block_literal_global_41);

}

- (void)shazamAMPConfigurationAPIHostWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[SHRemoteConfiguration shazamOfferAPIHostsBagValue](self, "shazamOfferAPIHostsBagValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __69__SHRemoteConfiguration_shazamAMPConfigurationAPIHostWithCompletion___block_invoke;
  v7[3] = &unk_24DDB22E8;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "valueWithCompletion:", v7);

}

void __69__SHRemoteConfiguration_shazamAMPConfigurationAPIHostWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  SHHost *v6;
  void *v7;
  id v8;

  v8 = a2;
  if (v8)
  {
    v6 = -[SHHost initWithName:]([SHHost alloc], "initWithName:", v8);
    v7 = 0;
  }
  else
  {
    +[SHCoreError errorWithCode:underlyingError:](SHCoreError, "errorWithCode:underlyingError:", 401, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)shazamOfferAPIURLPathWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[SHRemoteConfiguration languageTagBagValue](self, "languageTagBagValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __61__SHRemoteConfiguration_shazamOfferAPIURLPathWithCompletion___block_invoke;
  v7[3] = &unk_24DDB2338;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v8 = v6;
  objc_msgSend(v5, "valueWithCompletion:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __61__SHRemoteConfiguration_shazamOfferAPIURLPathWithCompletion___block_invoke(uint64_t a1, __CFString *a2)
{
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;
  id WeakRetained;
  void *v8;
  __CFString *v9;
  _QWORD v10[4];
  __CFString *v11;
  id v12;

  v4 = CFSTR("en-US");
  if (a2)
    v4 = a2;
  v5 = v4;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "shazamAMPConfigurationAPIEndpointsBagValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __61__SHRemoteConfiguration_shazamOfferAPIURLPathWithCompletion___block_invoke_2;
  v10[3] = &unk_24DDB2310;
  v11 = v5;
  v12 = *(id *)(a1 + 32);
  v9 = v5;
  objc_msgSend(v8, "valueWithCompletion:", v10);

}

void __61__SHRemoteConfiguration_shazamOfferAPIURLPathWithCompletion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  v6 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("configuration"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[SHTokenizedURL replaceToken:withValue:urlString:](SHTokenizedURL, "replaceToken:withValue:urlString:", 2, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = 0;
  }
  else
  {
    +[SHCoreError errorWithCode:underlyingError:](SHCoreError, "errorWithCode:underlyingError:", 401, v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)endpointsWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id buf[2];

  v4 = a3;
  shcore_log_object();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_21AB5E000, v5, OS_LOG_TYPE_DEBUG, "Fetching endpoints...", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  -[SHRemoteConfiguration languageTagBagValue](self, "languageTagBagValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __49__SHRemoteConfiguration_endpointsWithCompletion___block_invoke;
  v8[3] = &unk_24DDB2338;
  objc_copyWeak(&v10, buf);
  v7 = v4;
  v9 = v7;
  objc_msgSend(v6, "valueWithCompletion:", v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(buf);

}

void __49__SHRemoteConfiguration_endpointsWithCompletion___block_invoke(uint64_t a1, __CFString *a2)
{
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;
  id WeakRetained;
  void *v8;
  id v9;
  __CFString *v10;
  _QWORD v11[4];
  __CFString *v12;
  id v13;

  v4 = CFSTR("en-US");
  if (a2)
    v4 = a2;
  v5 = v4;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "endpointsBagValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __49__SHRemoteConfiguration_endpointsWithCompletion___block_invoke_2;
  v11[3] = &unk_24DDB2360;
  v9 = *(id *)(a1 + 32);
  v12 = v5;
  v13 = v9;
  v10 = v5;
  objc_msgSend(v8, "valueWithCompletion:", v11);

}

void __49__SHRemoteConfiguration_endpointsWithCompletion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  SHEndpoints *v10;
  int v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a4;
  shcore_log_object();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v11 = 138412546;
    v12 = v6;
    v13 = 2112;
    v14 = v7;
    _os_log_impl(&dword_21AB5E000, v8, OS_LOG_TYPE_DEBUG, "Endpoint fetch complete with value %@ error %@", (uint8_t *)&v11, 0x16u);
  }

  v9 = *(_QWORD *)(a1 + 40);
  if (v6)
  {
    v10 = -[SHEndpoints initWithConfiguration:suggestedLanguage:]([SHEndpoints alloc], "initWithConfiguration:suggestedLanguage:", v6, *(_QWORD *)(a1 + 32));
    (*(void (**)(uint64_t, SHEndpoints *, id))(v9 + 16))(v9, v10, v7);

  }
  else
  {
    (*(void (**)(_QWORD, _QWORD, id))(v9 + 16))(*(_QWORD *)(a1 + 40), 0, v7);
  }

}

- (void)hostForClientType:(int64_t)a3 completion:(id)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[16];

  v6 = a4;
  shcore_log_object();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21AB5E000, v7, OS_LOG_TYPE_DEBUG, "Fetching hosts...", buf, 2u);
  }

  if (a3 == 2)
  {
    -[SHRemoteConfiguration externalHostBagValue](self, "externalHostBagValue");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a3 != 1)
    {
      v9 = 0;
      goto LABEL_9;
    }
    -[SHRemoteConfiguration internalHostBagValue](self, "internalHostBagValue");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;
LABEL_9:
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __54__SHRemoteConfiguration_hostForClientType_completion___block_invoke;
  v11[3] = &unk_24DDB22E8;
  v12 = v6;
  v10 = v6;
  objc_msgSend(v9, "valueWithCompletion:", v11);

}

void __54__SHRemoteConfiguration_hostForClientType_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  SHHost *v10;
  int v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a4;
  shcore_log_object();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v11 = 138412546;
    v12 = v6;
    v13 = 2112;
    v14 = v7;
    _os_log_impl(&dword_21AB5E000, v8, OS_LOG_TYPE_DEBUG, "Host fetch complete with value %@ error %@", (uint8_t *)&v11, 0x16u);
  }

  v9 = *(_QWORD *)(a1 + 32);
  if (v6)
  {
    v10 = -[SHHost initWithName:]([SHHost alloc], "initWithName:", v6);
    (*(void (**)(uint64_t, SHHost *, id))(v9 + 16))(v9, v10, v7);

  }
  else
  {
    (*(void (**)(uint64_t, _QWORD, id))(v9 + 16))(v9, 0, v7);
  }

}

- (void)campaignTokenWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[16];

  v4 = a3;
  shcore_log_object();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21AB5E000, v5, OS_LOG_TYPE_DEBUG, "Fetching campaign tokens...", buf, 2u);
  }

  -[SHRemoteConfiguration campaignTokenBagValue](self, "campaignTokenBagValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __53__SHRemoteConfiguration_campaignTokenWithCompletion___block_invoke;
  v8[3] = &unk_24DDB22E8;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "valueWithCompletion:", v8);

}

void __53__SHRemoteConfiguration_campaignTokenWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  SHCampaignTokens *v10;
  int v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a4;
  shcore_log_object();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v11 = 138412546;
    v12 = v6;
    v13 = 2112;
    v14 = v7;
    _os_log_impl(&dword_21AB5E000, v8, OS_LOG_TYPE_DEBUG, "Campaign tokens fetch complete with value %@ error %@", (uint8_t *)&v11, 0x16u);
  }

  v9 = *(_QWORD *)(a1 + 32);
  if (v6)
  {
    v10 = -[SHCampaignTokens initWithConfiguration:]([SHCampaignTokens alloc], "initWithConfiguration:", v6);
    (*(void (**)(uint64_t, SHCampaignTokens *, id))(v9 + 16))(v9, v10, v7);

  }
  else
  {
    (*(void (**)(uint64_t, _QWORD, id))(v9 + 16))(v9, 0, v7);
  }

}

- (void)defaultValuesWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[16];

  v4 = a3;
  shcore_log_object();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21AB5E000, v5, OS_LOG_TYPE_DEBUG, "Fetching default values...", buf, 2u);
  }

  -[SHRemoteConfiguration defaultValuesBagValue](self, "defaultValuesBagValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __53__SHRemoteConfiguration_defaultValuesWithCompletion___block_invoke;
  v8[3] = &unk_24DDB22E8;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "valueWithCompletion:", v8);

}

void __53__SHRemoteConfiguration_defaultValuesWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  SHDefaultConfigurationValues *v10;
  int v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a4;
  shcore_log_object();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v11 = 138412546;
    v12 = v6;
    v13 = 2112;
    v14 = v7;
    _os_log_impl(&dword_21AB5E000, v8, OS_LOG_TYPE_DEBUG, "Default values fetch complete with value %@ error %@", (uint8_t *)&v11, 0x16u);
  }

  v9 = *(_QWORD *)(a1 + 32);
  if (v6)
  {
    v10 = -[SHDefaultConfigurationValues initWithConfiguration:]([SHDefaultConfigurationValues alloc], "initWithConfiguration:", v6);
    (*(void (**)(uint64_t, SHDefaultConfigurationValues *, id))(v9 + 16))(v9, v10, v7);

  }
  else
  {
    (*(void (**)(uint64_t, _QWORD, id))(v9 + 16))(v9, 0, v7);
  }

}

- (void)featureFlagsWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[16];

  v4 = a3;
  shcore_log_object();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21AB5E000, v5, OS_LOG_TYPE_DEBUG, "Fetching feature flags...", buf, 2u);
  }

  -[SHRemoteConfiguration featureFlagsBagValue](self, "featureFlagsBagValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __52__SHRemoteConfiguration_featureFlagsWithCompletion___block_invoke;
  v8[3] = &unk_24DDB22E8;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "valueWithCompletion:", v8);

}

void __52__SHRemoteConfiguration_featureFlagsWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  SHFeatureFlags *v10;
  int v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a4;
  shcore_log_object();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v11 = 138412546;
    v12 = v6;
    v13 = 2112;
    v14 = v7;
    _os_log_impl(&dword_21AB5E000, v8, OS_LOG_TYPE_DEBUG, "Feature flags fetch complete with value %@ error %@", (uint8_t *)&v11, 0x16u);
  }

  v9 = *(_QWORD *)(a1 + 32);
  if (v6)
  {
    v10 = -[SHFeatureFlags initWithConfiguration:]([SHFeatureFlags alloc], "initWithConfiguration:", v6);
    (*(void (**)(uint64_t, SHFeatureFlags *, id))(v9 + 16))(v9, v10, v7);

  }
  else
  {
    (*(void (**)(uint64_t, _QWORD, id))(v9 + 16))(v9, 0, v7);
  }

}

- (void)cacheValuesWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[16];

  v4 = a3;
  shcore_log_object();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21AB5E000, v5, OS_LOG_TYPE_DEBUG, "Fetching cache values...", buf, 2u);
  }

  -[SHRemoteConfiguration cacheValuesBagValue](self, "cacheValuesBagValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __51__SHRemoteConfiguration_cacheValuesWithCompletion___block_invoke;
  v8[3] = &unk_24DDB22E8;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "valueWithCompletion:", v8);

}

void __51__SHRemoteConfiguration_cacheValuesWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  SHCacheValues *v10;
  int v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a4;
  shcore_log_object();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v11 = 138412546;
    v12 = v6;
    v13 = 2112;
    v14 = v7;
    _os_log_impl(&dword_21AB5E000, v8, OS_LOG_TYPE_DEBUG, "Cache values fetch complete with value %@ error %@", (uint8_t *)&v11, 0x16u);
  }

  v9 = *(_QWORD *)(a1 + 32);
  if (v6)
  {
    v10 = -[SHCacheValues initWithValues:]([SHCacheValues alloc], "initWithValues:", v6);
    (*(void (**)(uint64_t, SHCacheValues *, id))(v9 + 16))(v9, v10, v7);

  }
  else
  {
    (*(void (**)(uint64_t, _QWORD, id))(v9 + 16))(v9, 0, v7);
  }

}

- (void)offerValuesWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[SHRemoteConfiguration configurationRequester](self, "configurationRequester");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __51__SHRemoteConfiguration_offerValuesWithCompletion___block_invoke;
  v7[3] = &unk_24DDB2388;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "offersWithCompletion:", v7);

}

void __51__SHRemoteConfiguration_offerValuesWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  shcore_log_object();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412546;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_21AB5E000, v7, OS_LOG_TYPE_DEBUG, "Shazam campaign offers fetch complete with value %@ error %@", (uint8_t *)&v8, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)streamingProviderValuesWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[SHRemoteConfiguration configurationRequester](self, "configurationRequester");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __63__SHRemoteConfiguration_streamingProviderValuesWithCompletion___block_invoke;
  v7[3] = &unk_24DDB23B0;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "streamingProvidersWithCompletion:", v7);

}

void __63__SHRemoteConfiguration_streamingProviderValuesWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  shcore_log_object();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412546;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_21AB5E000, v7, OS_LOG_TYPE_DEBUG, "Third party streaming providers fetch complete with value %@ error %@", (uint8_t *)&v8, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)recorderConfigurationWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[16];

  v4 = a3;
  shcore_log_object();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21AB5E000, v5, OS_LOG_TYPE_DEBUG, "Fetching recorder configuration values...", buf, 2u);
  }

  -[SHRemoteConfiguration recorderConfigurationBagValue](self, "recorderConfigurationBagValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __61__SHRemoteConfiguration_recorderConfigurationWithCompletion___block_invoke;
  v8[3] = &unk_24DDB22E8;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "valueWithCompletion:", v8);

}

void __61__SHRemoteConfiguration_recorderConfigurationWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  SHRecorderConfiguration *v10;
  int v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a4;
  shcore_log_object();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v11 = 138412546;
    v12 = v6;
    v13 = 2112;
    v14 = v7;
    _os_log_impl(&dword_21AB5E000, v8, OS_LOG_TYPE_DEBUG, "Recorder configuration with value %@ error %@", (uint8_t *)&v11, 0x16u);
  }

  v9 = *(_QWORD *)(a1 + 32);
  if (v6)
  {
    v10 = -[SHRecorderConfiguration initWithValues:]([SHRecorderConfiguration alloc], "initWithValues:", v6);
    (*(void (**)(uint64_t, SHRecorderConfiguration *, id))(v9 + 16))(v9, v10, v7);

  }
  else
  {
    (*(void (**)(uint64_t, _QWORD, id))(v9 + 16))(v9, 0, v7);
  }

}

- (id)recorderConfigurationWithPromise
{
  void *v2;
  void *v3;
  SHRecorderConfiguration *v4;

  -[SHRemoteConfiguration recorderConfigurationBagValue](self, "recorderConfigurationBagValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valuePromise");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = -[SHRecorderConfiguration initWithPromise:]([SHRecorderConfiguration alloc], "initWithPromise:", v3);
  return v4;
}

- (AMSBag)amsBag
{
  return self->_amsBag;
}

- (void)setAmsBag:(id)a3
{
  objc_storeStrong((id *)&self->_amsBag, a3);
}

- (AMSBagValue)endpointsBagValue
{
  return self->_endpointsBagValue;
}

- (void)setEndpointsBagValue:(id)a3
{
  objc_storeStrong((id *)&self->_endpointsBagValue, a3);
}

- (AMSBagValue)internalHostBagValue
{
  return self->_internalHostBagValue;
}

- (void)setInternalHostBagValue:(id)a3
{
  objc_storeStrong((id *)&self->_internalHostBagValue, a3);
}

- (AMSBagValue)externalHostBagValue
{
  return self->_externalHostBagValue;
}

- (void)setExternalHostBagValue:(id)a3
{
  objc_storeStrong((id *)&self->_externalHostBagValue, a3);
}

- (AMSBagValue)campaignTokenBagValue
{
  return self->_campaignTokenBagValue;
}

- (void)setCampaignTokenBagValue:(id)a3
{
  objc_storeStrong((id *)&self->_campaignTokenBagValue, a3);
}

- (AMSBagValue)defaultValuesBagValue
{
  return self->_defaultValuesBagValue;
}

- (void)setDefaultValuesBagValue:(id)a3
{
  objc_storeStrong((id *)&self->_defaultValuesBagValue, a3);
}

- (AMSBagValue)languageTagBagValue
{
  return self->_languageTagBagValue;
}

- (void)setLanguageTagBagValue:(id)a3
{
  objc_storeStrong((id *)&self->_languageTagBagValue, a3);
}

- (AMSBagValue)featureFlagsBagValue
{
  return self->_featureFlagsBagValue;
}

- (void)setFeatureFlagsBagValue:(id)a3
{
  objc_storeStrong((id *)&self->_featureFlagsBagValue, a3);
}

- (AMSBagValue)shazamOfferAPIHostsBagValue
{
  return self->_shazamOfferAPIHostsBagValue;
}

- (void)setShazamOfferAPIHostsBagValue:(id)a3
{
  objc_storeStrong((id *)&self->_shazamOfferAPIHostsBagValue, a3);
}

- (AMSBagValue)shazamAMPConfigurationAPIEndpointsBagValue
{
  return self->_shazamAMPConfigurationAPIEndpointsBagValue;
}

- (void)setShazamAMPConfigurationAPIEndpointsBagValue:(id)a3
{
  objc_storeStrong((id *)&self->_shazamAMPConfigurationAPIEndpointsBagValue, a3);
}

- (AMSBagValue)cacheValuesBagValue
{
  return self->_cacheValuesBagValue;
}

- (void)setCacheValuesBagValue:(id)a3
{
  objc_storeStrong((id *)&self->_cacheValuesBagValue, a3);
}

- (AMSBagValue)recorderConfigurationBagValue
{
  return self->_recorderConfigurationBagValue;
}

- (void)setRecorderConfigurationBagValue:(id)a3
{
  objc_storeStrong((id *)&self->_recorderConfigurationBagValue, a3);
}

- (SHAMPConfigurationRequester)configurationRequester
{
  return self->_configurationRequester;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationRequester, 0);
  objc_storeStrong((id *)&self->_recorderConfigurationBagValue, 0);
  objc_storeStrong((id *)&self->_cacheValuesBagValue, 0);
  objc_storeStrong((id *)&self->_shazamAMPConfigurationAPIEndpointsBagValue, 0);
  objc_storeStrong((id *)&self->_shazamOfferAPIHostsBagValue, 0);
  objc_storeStrong((id *)&self->_featureFlagsBagValue, 0);
  objc_storeStrong((id *)&self->_languageTagBagValue, 0);
  objc_storeStrong((id *)&self->_defaultValuesBagValue, 0);
  objc_storeStrong((id *)&self->_campaignTokenBagValue, 0);
  objc_storeStrong((id *)&self->_externalHostBagValue, 0);
  objc_storeStrong((id *)&self->_internalHostBagValue, 0);
  objc_storeStrong((id *)&self->_endpointsBagValue, 0);
  objc_storeStrong((id *)&self->_amsBag, 0);
}

@end
