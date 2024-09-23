@implementation PKPaymentMarketsConfiguration

+ (void)paymentMarketsConfigurationWithURL:(id)a3 forDeviceClass:(id)a4 version:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;
  char v28;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  PKDeviceClass();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKOSVersionRequirement fromDeviceVersion](PKOSVersionRequirement, "fromDeviceVersion");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    v10 = v13;
    if (v11)
      goto LABEL_3;
LABEL_13:
    v11 = v14;
    goto LABEL_3;
  }
  if (!v11)
    goto LABEL_13;
LABEL_3:
  if (objc_msgSend(v10, "isEqualToString:", v13) && objc_msgSend(v11, "isEqual:", v14))
  {
    if ((objc_msgSend((id)qword_1ECF22240, "isEqual:", v9) & 1) == 0)
    {
      v15 = (void *)qword_1ECF22250;
      qword_1ECF22250 = 0;

      v16 = (void *)qword_1ECF22258;
      qword_1ECF22258 = 0;

    }
    v17 = 1;
  }
  else
  {
    v17 = 0;
  }
  if (qword_1ECF22238 != -1)
    dispatch_once(&qword_1ECF22238, &__block_literal_global_21);
  v18 = (void *)_MergedGlobals_198;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __102__PKPaymentMarketsConfiguration_paymentMarketsConfigurationWithURL_forDeviceClass_version_completion___block_invoke_2;
  v23[3] = &unk_1E2AC2C68;
  v24 = v9;
  v25 = v10;
  v26 = v11;
  v27 = v12;
  v28 = v17;
  v19 = v11;
  v20 = v10;
  v21 = v9;
  v22 = v12;
  objc_msgSend(v18, "downloadFromUrl:completionHandler:", v21, v23);

}

void __102__PKPaymentMarketsConfiguration_paymentMarketsConfigurationWithURL_forDeviceClass_version_completion___block_invoke()
{
  void *v0;
  PKObjectDownloader *v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0C92CA0], "defaultSessionConfiguration");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTimeoutIntervalForResource:", 360.0);
  objc_msgSend(v3, "setTimeoutIntervalForRequest:", 60.0);
  objc_msgSend(v3, "setNetworkServiceType:", 3);
  objc_msgSend(MEMORY[0x1E0C92C98], "sessionWithConfiguration:", v3);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = -[PKObjectDownloader initWithSession:]([PKObjectDownloader alloc], "initWithSession:", v0);
  v2 = (void *)_MergedGlobals_198;
  _MergedGlobals_198 = (uint64_t)v1;

}

void __102__PKPaymentMarketsConfiguration_paymentMarketsConfigurationWithURL_forDeviceClass_version_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  id v19;
  NSObject *v20;
  _BOOL4 v21;
  PKPaymentMarketsConfiguration *v22;
  PKPaymentMarketsConfiguration *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  NSObject *v31;
  uint64_t v32;
  id v33;
  uint8_t buf[4];
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = v8;
    v11 = v10;
    if (v10)
    {
      v12 = (void *)qword_1ECF22258;
      objc_msgSend(v10, "valueForHTTPHeaderField:", CFSTR("Etag"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v12, "isEqualToString:", v13) & 1) == 0)
      {

        if (v7)
          goto LABEL_11;
LABEL_13:
        v18 = 0;
        goto LABEL_14;
      }
      v14 = (void *)qword_1ECF22250;
      objc_msgSend(v11, "valueForHTTPHeaderField:", CFSTR("Last-Modified"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v14) = objc_msgSend(v14, "isEqualToString:", v15);

      if ((_DWORD)v14)
      {
        PKLogFacilityTypeGetObject(2uLL);
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18FC92000, v16, OS_LOG_TYPE_DEFAULT, "Markets configuration loaded from cache", buf, 2u);
        }

        v17 = *(_QWORD *)(a1 + 56);
        if (v17)
        {
          (*(void (**)(uint64_t, uint64_t, _QWORD))(v17 + 16))(v17, qword_1ECF22248, 0);
          goto LABEL_40;
        }
      }
    }
  }
  else
  {
    v11 = 0;
  }
  if (!v7)
    goto LABEL_13;
LABEL_11:
  v33 = v9;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v7, 0, &v33);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v33;

  v9 = v19;
LABEL_14:
  PKLogFacilityTypeGetObject(2uLL);
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG);

  if (v21)
  {
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v20, OS_LOG_TYPE_DEFAULT, "Markets configuration loaded from web", buf, 2u);
    }

  }
  if (!v7 || v9)
  {
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), 1, 0);
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    PKLogFacilityTypeGetObject(6uLL);
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v35 = v9;
      _os_log_impl(&dword_18FC92000, v29, OS_LOG_TYPE_DEFAULT, "Markets configuration failed downloading: %@", buf, 0xCu);
    }

    v30 = *(_QWORD *)(a1 + 56);
    if (v30)
      (*(void (**)(uint64_t, _QWORD, id))(v30 + 16))(v30, 0, v9);
  }
  else
  {
    if (v18
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && (v22 = -[PKPaymentMarketsConfiguration initWithDictionary:url:forDeviceClass:version:]([PKPaymentMarketsConfiguration alloc], "initWithDictionary:url:forDeviceClass:version:", v18, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48))) != 0)
    {
      v23 = v22;
      if (*(_BYTE *)(a1 + 64))
      {
        objc_storeStrong((id *)&qword_1ECF22240, *(id *)(a1 + 32));
        objc_storeStrong((id *)&qword_1ECF22248, v23);
        objc_msgSend(v11, "valueForHTTPHeaderField:", CFSTR("Last-Modified"));
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = (void *)qword_1ECF22250;
        qword_1ECF22250 = v24;

        objc_msgSend(v11, "valueForHTTPHeaderField:", CFSTR("Etag"));
        v26 = objc_claimAutoreleasedReturnValue();
        v27 = (void *)qword_1ECF22258;
        qword_1ECF22258 = v26;

      }
      v28 = *(_QWORD *)(a1 + 56);
      if (v28)
        (*(void (**)(uint64_t, PKPaymentMarketsConfiguration *, _QWORD))(v28 + 16))(v28, v23, 0);
    }
    else
    {
      PKLogFacilityTypeGetObject(6uLL);
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v35 = 0;
        _os_log_impl(&dword_18FC92000, v31, OS_LOG_TYPE_DEFAULT, "Markets configuration failed to parse: %@", buf, 0xCu);
      }

      v32 = *(_QWORD *)(a1 + 56);
      if (v32)
        (*(void (**)(uint64_t, _QWORD, _QWORD))(v32 + 16))(v32, 0, 0);
      v23 = 0;
    }

    v9 = 0;
  }

LABEL_40:
}

- (PKPaymentMarketsConfiguration)initWithDictionary:(id)a3 url:(id)a4 forDeviceClass:(id)a5 version:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  PKPaymentMarketsConfiguration *v14;
  uint64_t v15;
  NSURL *url;
  void *v17;
  uint64_t v18;
  NSString *version;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  NSSet *markets;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  objc_super v30;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v30.receiver = self;
  v30.super_class = (Class)PKPaymentMarketsConfiguration;
  v14 = -[PKPaymentMarketsConfiguration init](&v30, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v11, "copy");
    url = v14->_url;
    v14->_url = (NSURL *)v15;

    objc_msgSend(v10, "PKStringForKey:", CFSTR("Version"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "copy");
    version = v14->_version;
    v14->_version = (NSString *)v18;

    objc_msgSend(v10, "PKArrayForKey:", CFSTR("MarketGeos"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __79__PKPaymentMarketsConfiguration_initWithDictionary_url_forDeviceClass_version___block_invoke;
    v26[3] = &unk_1E2AC2C90;
    v27 = v12;
    v28 = v13;
    v29 = v21;
    v22 = v21;
    objc_msgSend(v20, "enumerateObjectsUsingBlock:", v26);
    v23 = objc_msgSend(v22, "copy");
    markets = v14->_markets;
    v14->_markets = (NSSet *)v23;

  }
  return v14;
}

void __79__PKPaymentMarketsConfiguration_initWithDictionary_url_forDeviceClass_version___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  PKPaymentMarket *v4;
  PKPaymentMarket *v5;

  v3 = a2;
  v5 = -[PKPaymentMarket initWithDictionary:forDeviceClass:version:]([PKPaymentMarket alloc], "initWithDictionary:forDeviceClass:version:", v3, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  v4 = v5;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v5);
    v4 = v5;
  }

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentMarketsConfiguration)initWithCoder:(id)a3
{
  id v4;
  PKPaymentMarketsConfiguration *v5;
  uint64_t v6;
  NSURL *url;
  uint64_t v8;
  NSString *version;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSSet *markets;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PKPaymentMarketsConfiguration;
  v5 = -[PKPaymentMarketsConfiguration init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("url"));
    v6 = objc_claimAutoreleasedReturnValue();
    url = v5->_url;
    v5->_url = (NSURL *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("version"));
    v8 = objc_claimAutoreleasedReturnValue();
    version = v5->_version;
    v5->_version = (NSString *)v8;

    v10 = (void *)MEMORY[0x1E0C99E60];
    v11 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("markets"));
    v13 = objc_claimAutoreleasedReturnValue();
    markets = v5->_markets;
    v5->_markets = (NSSet *)v13;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSURL *url;
  id v5;

  url = self->_url;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", url, CFSTR("url"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_version, CFSTR("version"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_markets, CFSTR("markets"));

}

- (id)marketsForLocation:(id)a3
{
  id v4;
  id v5;
  NSSet *markets;
  id v7;
  id v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  id v16;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  markets = self->_markets;
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __52__PKPaymentMarketsConfiguration_marketsForLocation___block_invoke;
  v14 = &unk_1E2AC2CB8;
  v15 = v4;
  v16 = v5;
  v7 = v5;
  v8 = v4;
  -[NSSet enumerateObjectsUsingBlock:](markets, "enumerateObjectsUsingBlock:", &v11);
  v9 = (void *)objc_msgSend(v7, "copy", v11, v12, v13, v14);

  return v9;
}

void __52__PKPaymentMarketsConfiguration_marketsForLocation___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "containsLocation:", *(_QWORD *)(a1 + 32)))
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

}

- (id)marketsForLocation:(id)a3 passingTest:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSSet *markets;
  id v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  markets = self->_markets;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __64__PKPaymentMarketsConfiguration_marketsForLocation_passingTest___block_invoke;
  v15[3] = &unk_1E2AC2CE0;
  v17 = v8;
  v18 = v7;
  v16 = v6;
  v10 = v8;
  v11 = v6;
  v12 = v7;
  -[NSSet enumerateObjectsUsingBlock:](markets, "enumerateObjectsUsingBlock:", v15);
  v13 = (void *)objc_msgSend(v10, "copy");

  return v13;
}

void __64__PKPaymentMarketsConfiguration_marketsForLocation_passingTest___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 48) + 16))()
    && objc_msgSend(v3, "containsLocation:", *(_QWORD *)(a1 + 32)))
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
  }

}

- (id)marketsForLocation:(id)a3 ofType:(int64_t)a4
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__PKPaymentMarketsConfiguration_marketsForLocation_ofType___block_invoke;
  v5[3] = &__block_descriptor_40_e25_B16__0__PKPaymentMarket_8l;
  v5[4] = a4;
  -[PKPaymentMarketsConfiguration marketsForLocation:passingTest:](self, "marketsForLocation:passingTest:", a3, v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

BOOL __59__PKPaymentMarketsConfiguration_marketsForLocation_ofType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "type") == *(_QWORD *)(a1 + 32);
}

+ (id)closestMarketFromSet:(id)a3 forLocation:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  double v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  double v14;
  double v15;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *MEMORY[0x1E0C9E318];
    v11 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v5);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v13, "shortestDistanceFromLocation:", v6);
        if (v14 < v10)
        {
          v15 = v14;
          v16 = v13;

          v10 = v15;
          v9 = v16;
        }
      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)marketsForRegions:(id)a3
{
  id v4;
  id v5;
  NSSet *markets;
  id v7;
  id v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  id v16;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  markets = self->_markets;
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __51__PKPaymentMarketsConfiguration_marketsForRegions___block_invoke;
  v14 = &unk_1E2AC2CB8;
  v15 = v4;
  v16 = v5;
  v7 = v5;
  v8 = v4;
  -[NSSet enumerateObjectsUsingBlock:](markets, "enumerateObjectsUsingBlock:", &v11);
  v9 = (void *)objc_msgSend(v7, "copy", v11, v12, v13, v14);

  return v9;
}

void __51__PKPaymentMarketsConfiguration_marketsForRegions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6 = v3;
  objc_msgSend(v3, "region");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v4, "containsObject:", v5);

  if ((_DWORD)v4)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);

}

- (id)supportedTransitNetworksForLocation:(id)a3
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  -[PKPaymentMarketsConfiguration marketsForLocation:](self, "marketsForLocation:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __69__PKPaymentMarketsConfiguration_supportedTransitNetworksForLocation___block_invoke;
    v8[3] = &unk_1E2AC2D28;
    v5 = v4;
    v9 = v5;
    objc_msgSend(v3, "enumerateObjectsUsingBlock:", v8);

  }
  else
  {
    v5 = 0;
  }
  v6 = (void *)objc_msgSend(v5, "copy");

  return v6;
}

void __69__PKPaymentMarketsConfiguration_supportedTransitNetworksForLocation___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "supportedTransitNetworks");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unionSet:", v3);

}

- (id)expressTransitNetworksForLocation:(id)a3
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  -[PKPaymentMarketsConfiguration marketsForLocation:](self, "marketsForLocation:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __67__PKPaymentMarketsConfiguration_expressTransitNetworksForLocation___block_invoke;
    v8[3] = &unk_1E2AC2D28;
    v5 = v4;
    v9 = v5;
    objc_msgSend(v3, "enumerateObjectsUsingBlock:", v8);

  }
  else
  {
    v5 = 0;
  }
  v6 = (void *)objc_msgSend(v5, "copy");

  return v6;
}

void __67__PKPaymentMarketsConfiguration_expressTransitNetworksForLocation___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "expressTransitNetworks");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unionSet:", v3);

}

- (NSSet)markets
{
  return (NSSet *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)version
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_markets, 0);
}

@end
