@implementation SHAMPConfigurationRequester

- (void)configurationEndpoint:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  +[SHRemoteConfiguration sharedInstance](SHRemoteConfiguration, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __53__SHAMPConfigurationRequester_configurationEndpoint___block_invoke;
  v7[3] = &unk_24DDB20E8;
  objc_copyWeak(&v9, &location);
  v7[4] = self;
  v6 = v4;
  v8 = v6;
  objc_msgSend(v5, "shazamAMPConfigurationAPIHostWithCompletion:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __53__SHAMPConfigurationRequester_configurationEndpoint___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  +[SHRemoteConfiguration sharedInstance](SHRemoteConfiguration, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __53__SHAMPConfigurationRequester_configurationEndpoint___block_invoke_2;
  v9[3] = &unk_24DDB20C0;
  objc_copyWeak(&v12, (id *)(a1 + 48));
  v9[4] = *(_QWORD *)(a1 + 32);
  v8 = v5;
  v10 = v8;
  v11 = *(id *)(a1 + 40);
  objc_msgSend(v7, "shazamOfferAPIURLPathWithCompletion:", v9);

  objc_destroyWeak(&v12);
}

void __53__SHAMPConfigurationRequester_configurationEndpoint___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;
  id v17;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "storefront");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __53__SHAMPConfigurationRequester_configurationEndpoint___block_invoke_3;
  v13[3] = &unk_24DDB2098;
  v9 = *(void **)(a1 + 40);
  v13[4] = *(_QWORD *)(a1 + 32);
  v14 = v9;
  v15 = v5;
  v10 = *(id *)(a1 + 48);
  v16 = v6;
  v17 = v10;
  v11 = v6;
  v12 = v5;
  objc_msgSend(v8, "storefrontCountryCode:", v13);

}

void __53__SHAMPConfigurationRequester_configurationEndpoint___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "endpointURLWithHost:path:storefront:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a2);
  v4 = objc_claimAutoreleasedReturnValue();
  v7 = (id)v4;
  if (*(_QWORD *)(a1 + 40) && a2 && *(_QWORD *)(a1 + 48) && v4)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    v5 = *(_QWORD *)(a1 + 64);
    +[SHCoreError errorWithCode:underlyingError:](SHCoreError, "errorWithCode:underlyingError:", 401, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v5 + 16))(v5, 0, v6);

  }
}

- (void)offersWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __52__SHAMPConfigurationRequester_offersWithCompletion___block_invoke;
  v6[3] = &unk_24DDB2110;
  objc_copyWeak(&v8, &location);
  v5 = v4;
  v7 = v5;
  -[SHAMPConfigurationRequester configurationEndpoint:](self, "configurationEndpoint:", v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

void __52__SHAMPConfigurationRequester_offersWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "fetchOffersAtURL:completionHandler:", v4, *(_QWORD *)(a1 + 32));

}

- (void)streamingProvidersWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __64__SHAMPConfigurationRequester_streamingProvidersWithCompletion___block_invoke;
  v6[3] = &unk_24DDB2110;
  objc_copyWeak(&v8, &location);
  v5 = v4;
  v7 = v5;
  -[SHAMPConfigurationRequester configurationEndpoint:](self, "configurationEndpoint:", v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

void __64__SHAMPConfigurationRequester_streamingProvidersWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "fetchStreamingProvidersAtURL:completionHandler:", v4, *(_QWORD *)(a1 + 32));

}

- (id)endpointURLWithHost:(id)a3 path:(id)a4 storefront:(id)a5
{
  id v7;
  id v8;
  id v9;
  SHTokenizedURL *v10;
  void *v11;
  SHTokenizedURL *v12;
  void *v13;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = [SHTokenizedURL alloc];
  objc_msgSend(v9, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[SHTokenizedURL initWithHost:URLPath:](v10, "initWithHost:URLPath:", v11, v8);
  -[SHTokenizedURL updateToken:withValue:](v12, "updateToken:withValue:", 3, v7);

  -[SHTokenizedURL URLRepresentation](v12, "URLRepresentation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)fetchOffersAtURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __66__SHAMPConfigurationRequester_fetchOffersAtURL_completionHandler___block_invoke;
  v8[3] = &unk_24DDB2138;
  v9 = v6;
  v7 = v6;
  -[SHAMPConfigurationRequester fetchShazamAMPConfiguration:completionHandler:](self, "fetchShazamAMPConfiguration:completionHandler:", a3, v8);

}

void __66__SHAMPConfigurationRequester_fetchOffersAtURL_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  objc_msgSend(a2, "offers");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);

}

- (void)fetchStreamingProvidersAtURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __78__SHAMPConfigurationRequester_fetchStreamingProvidersAtURL_completionHandler___block_invoke;
  v8[3] = &unk_24DDB2138;
  v9 = v6;
  v7 = v6;
  -[SHAMPConfigurationRequester fetchShazamAMPConfiguration:completionHandler:](self, "fetchShazamAMPConfiguration:completionHandler:", a3, v8);

}

void __78__SHAMPConfigurationRequester_fetchStreamingProvidersAtURL_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  objc_msgSend(a2, "streamingProviders");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);

}

- (void)fetchShazamAMPConfiguration:(id)a3 completionHandler:(id)a4
{
  id v5;
  objc_class *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v5 = a4;
  v6 = (objc_class *)MEMORY[0x24BDD16B0];
  v7 = a3;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithURL:", v7);

  objc_msgSend(v8, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(MEMORY[0x24BDD1850], "sharedSession");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __77__SHAMPConfigurationRequester_fetchShazamAMPConfiguration_completionHandler___block_invoke;
  v12[3] = &unk_24DDB2160;
  v13 = v5;
  v10 = v5;
  objc_msgSend(v9, "dataTaskWithRequest:completionHandler:", v8, v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "resume");
}

void __77__SHAMPConfigurationRequester_fetchShazamAMPConfiguration_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v5;
  id v6;
  SHAMPConfiguration *v7;
  NSObject *v8;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    v9 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", a2, 0, &v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v9;
    if (v5)
    {
      v7 = -[SHAMPConfiguration initWithResponse:]([SHAMPConfiguration alloc], "initWithResponse:", v5);
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

    }
    else
    {
      shcore_log_object();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v11 = v6;
        _os_log_impl(&dword_21AB5E000, v8, OS_LOG_TYPE_ERROR, "Failed to parse the offer response %@", buf, 0xCu);
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }

  }
  else
  {
    (*(void (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 0, a4);
  }
}

- (SHStorefront)storefront
{
  SHStorefront *storefront;
  SHStorefront *v4;
  SHStorefront *v5;

  storefront = self->_storefront;
  if (!storefront)
  {
    v4 = objc_alloc_init(SHStorefront);
    v5 = self->_storefront;
    self->_storefront = v4;

    storefront = self->_storefront;
  }
  return storefront;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storefront, 0);
}

@end
