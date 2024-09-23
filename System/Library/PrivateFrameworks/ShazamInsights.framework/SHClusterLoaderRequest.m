@implementation SHClusterLoaderRequest

- (SHClusterLoaderRequest)initWithType:(int64_t)a3
{
  return -[SHClusterLoaderRequest initWithType:sourceURL:outputURL:](self, "initWithType:sourceURL:outputURL:", a3, 0, 0);
}

- (SHClusterLoaderRequest)initWithType:(int64_t)a3 sourceURL:(id)a4 outputURL:(id)a5
{
  id v9;
  id v10;
  SHClusterLoaderRequest *v11;
  SHClusterLoaderRequest *v12;
  SHStorefront *v13;
  SHStorefront *storefront;
  objc_super v16;

  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)SHClusterLoaderRequest;
  v11 = -[SHClusterLoaderRequest init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_type = a3;
    objc_storeStrong((id *)&v11->_sourceURL, a4);
    objc_storeStrong((id *)&v12->_outputURL, a5);
    v13 = (SHStorefront *)objc_alloc_init(MEMORY[0x24BE90560]);
    storefront = v12->_storefront;
    v12->_storefront = v13;

  }
  return v12;
}

- (BOOL)shouldDeleteExistingDatabaseAtOutputURL
{
  return self->_sourceURL != 0;
}

- (void)URLForRequestForStorefront:(id)a3 withCompletion:(id)a4
{
  id v6;
  void (**v7)(id, void *, id, _QWORD, double);
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  void (**v12)(id, void *, id, _QWORD, double);
  id v13;
  id location;

  v6 = a3;
  v7 = (void (**)(id, void *, id, _QWORD, double))a4;
  -[SHClusterLoaderRequest sourceURL](self, "sourceURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[SHClusterLoaderRequest sourceURL](self, "sourceURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v9, v6, 0, 3.40282347e38);

  }
  else
  {
    objc_initWeak(&location, self);
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __68__SHClusterLoaderRequest_URLForRequestForStorefront_withCompletion___block_invoke;
    v10[3] = &unk_24DCD2848;
    objc_copyWeak(&v13, &location);
    v11 = v6;
    v12 = v7;
    +[SHInsightsConfiguration fetchSharedInstanceWithCompletion:](SHInsightsConfiguration, "fetchSharedInstanceWithCompletion:", v10);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

}

void __68__SHClusterLoaderRequest_URLForRequestForStorefront_withCompletion___block_invoke(id *a1, void *a2)
{
  id v3;
  id WeakRetained;
  id *v5;
  id *v6;
  id v7;
  id *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (objc_msgSend(WeakRetained, "type") == 1)
  {
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __68__SHClusterLoaderRequest_URLForRequestForStorefront_withCompletion___block_invoke_2;
    v13[3] = &unk_24DCD2820;
    v5 = &v14;
    v14 = v3;
    v6 = &v16;
    v7 = a1[4];
    v16 = a1[5];
    v8 = &v15;
    v15 = a1[4];
    objc_msgSend(v3, "tracksClusterEndpointForStorefront:completionHandler:", v7, v13);
  }
  else
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __68__SHClusterLoaderRequest_URLForRequestForStorefront_withCompletion___block_invoke_4;
    v9[3] = &unk_24DCD2820;
    v5 = &v10;
    v10 = v3;
    v6 = &v12;
    v12 = a1[5];
    v8 = &v11;
    v11 = a1[4];
    objc_msgSend(v3, "artistsClusterEndpointWithCompletionHandler:", v9);
  }

}

void __68__SHClusterLoaderRequest_URLForRequestForStorefront_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __68__SHClusterLoaderRequest_URLForRequestForStorefront_withCompletion___block_invoke_3;
  v6[3] = &unk_24DCD27F8;
  v7 = v3;
  v9 = *(id *)(a1 + 48);
  v8 = *(id *)(a1 + 40);
  v5 = v3;
  objc_msgSend(v4, "tracksCachedDataMaxAgeWithCompletionHandler:", v6);

}

void __68__SHClusterLoaderRequest_URLForRequestForStorefront_withCompletion___block_invoke_3(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  id v3;

  v1 = a1[4];
  v2 = a1[6];
  if (v1)
  {
    (*(void (**)(_QWORD, uint64_t, _QWORD, _QWORD))(v2 + 16))(a1[6], v1, a1[5], 0);
  }
  else
  {
    +[SHInsightsError errorWithCode:underlyingError:](SHInsightsError, "errorWithCode:underlyingError:", 100, 0);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, id, double))(v2 + 16))(v2, 0, 0, v3, -1.0);

  }
}

void __68__SHClusterLoaderRequest_URLForRequestForStorefront_withCompletion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __68__SHClusterLoaderRequest_URLForRequestForStorefront_withCompletion___block_invoke_5;
  v6[3] = &unk_24DCD27F8;
  v7 = v3;
  v9 = *(id *)(a1 + 48);
  v8 = *(id *)(a1 + 40);
  v5 = v3;
  objc_msgSend(v4, "artistsCachedDataMaxAgeWithCompletionHandler:", v6);

}

void __68__SHClusterLoaderRequest_URLForRequestForStorefront_withCompletion___block_invoke_5(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  id v3;

  v1 = a1[4];
  v2 = a1[6];
  if (v1)
  {
    (*(void (**)(_QWORD, uint64_t, _QWORD, _QWORD))(v2 + 16))(a1[6], v1, a1[5], 0);
  }
  else
  {
    +[SHInsightsError errorWithCode:underlyingError:](SHInsightsError, "errorWithCode:underlyingError:", 100, 0);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, id, double))(v2 + 16))(v2, 0, 0, v3, -1.0);

  }
}

- (void)sourceURLWithCompletion:(id)a3
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
  -[SHClusterLoaderRequest storefront](self, "storefront");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __50__SHClusterLoaderRequest_sourceURLWithCompletion___block_invoke;
  v7[3] = &unk_24DCD2870;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v8 = v6;
  objc_msgSend(v5, "storefrontCountryCode:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __50__SHClusterLoaderRequest_sourceURLWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "URLForRequestForStorefront:withCompletion:", v4, *(_QWORD *)(a1 + 32));

}

- (void)clusterConfiguration:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[SHClusterLoaderRequest storefront](self, "storefront");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __47__SHClusterLoaderRequest_clusterConfiguration___block_invoke;
  v7[3] = &unk_24DCD28C0;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "storefrontCountryCode:", v7);

}

void __47__SHClusterLoaderRequest_clusterConfiguration___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __47__SHClusterLoaderRequest_clusterConfiguration___block_invoke_2;
  v6[3] = &unk_24DCD2898;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  +[SHInsightsConfiguration fetchSharedInstanceWithCompletion:](SHInsightsConfiguration, "fetchSharedInstanceWithCompletion:", v6);

}

uint64_t __47__SHClusterLoaderRequest_clusterConfiguration___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a2, *(_QWORD *)(a1 + 32), 0);
}

- (NSURL)sourceURL
{
  return self->_sourceURL;
}

- (NSURL)outputURL
{
  return self->_outputURL;
}

- (int64_t)type
{
  return self->_type;
}

- (SHStorefront)storefront
{
  return self->_storefront;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storefront, 0);
  objc_storeStrong((id *)&self->_outputURL, 0);
  objc_storeStrong((id *)&self->_sourceURL, 0);
}

@end
