@implementation SHCDNDataFetcher

- (SHCDNDataFetcher)init
{
  void *v3;
  SHCDNDataFetcher *v4;

  v3 = (void *)objc_opt_new();
  v4 = -[SHCDNDataFetcher initWithNetworkRequester:](self, "initWithNetworkRequester:", v3);

  return v4;
}

- (SHCDNDataFetcher)initWithNetworkRequester:(id)a3
{
  id v5;
  SHCDNDataFetcher *v6;
  SHCDNDataFetcher *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SHCDNDataFetcher;
  v6 = -[SHCDNDataFetcher init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_networkRequester, a3);

  return v7;
}

- (void)fetchClusterURL:(id)a3 forCurrentStorefront:(id)a4 cachedUniqueHash:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  id v25;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(MEMORY[0x24BDD16B0], "requestWithURL:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v12)
    objc_msgSend(v14, "addValue:forHTTPHeaderField:", v12, CFSTR("If-None-Match"));
  -[SHCDNDataFetcher networkRequester](self, "networkRequester");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __92__SHCDNDataFetcher_fetchClusterURL_forCurrentStorefront_cachedUniqueHash_completionHandler___block_invoke;
  v21[3] = &unk_24DCD28E8;
  v21[4] = self;
  v22 = v12;
  v24 = v10;
  v25 = v13;
  v23 = v11;
  v17 = v10;
  v18 = v11;
  v19 = v13;
  v20 = v12;
  objc_msgSend(v16, "downloadResourceFromRequest:completionHandler:", v15, v21);

}

void __92__SHCDNDataFetcher_fetchClusterURL_forCurrentStorefront_cachedUniqueHash_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  SHDataFetcherFileInfo *v11;
  SHDataFetcherFileInfo *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v7, "statusCode") == 304
    || objc_msgSend(*(id *)(a1 + 32), "doesRequestEtag:matchInResponse:", *(_QWORD *)(a1 + 40), v7))
  {
    v10 = *(_QWORD *)(a1 + 64);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.ShazamInsightsDataFetcher"), 100, 0);
    v11 = (SHDataFetcherFileInfo *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, SHDataFetcherFileInfo *))(v10 + 16))(v10, 0, v11);
  }
  else
  {
    if (!v8)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
      goto LABEL_5;
    }
    v12 = [SHDataFetcherFileInfo alloc];
    objc_msgSend(v7, "suggestedFilename");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[SHDataFetcherFileInfo initWithDataURL:suggestedFileName:](v12, "initWithDataURL:suggestedFileName:", v8, v13);

    -[SHDataFetcherFileInfo setStorefront:](v11, "setStorefront:", *(_QWORD *)(a1 + 48));
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHDataFetcherFileInfo setCreationDate:](v11, "setCreationDate:", v14);

    objc_msgSend(v7, "valueForHTTPHeaderField:", CFSTR("Etag"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "UUIDString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      sh_log_object();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = *(_QWORD *)(a1 + 56);
        v19 = 138412290;
        v20 = v18;
        _os_log_impl(&dword_21A508000, v17, OS_LOG_TYPE_ERROR, "Etag missing for request to %@, replacing with random hash", (uint8_t *)&v19, 0xCu);
      }

    }
    -[SHDataFetcherFileInfo setUniqueHash:](v11, "setUniqueHash:", v15);
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

  }
LABEL_5:

}

- (BOOL)doesRequestEtag:(id)a3 matchInResponse:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  if (!a4)
    return 0;
  v5 = a3;
  objc_msgSend(a4, "allHeaderFields");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Etag"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v6) = objc_msgSend(v5, "isEqualToString:", v7);
  return (char)v6;
}

- (void)clusterDataAtURL:(id)a3 forLocation:(id)a4 date:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v9 = a5;
  v10 = a6;
  objc_msgSend(MEMORY[0x24BDD16B0], "requestWithURL:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHCDNDataFetcher networkRequester](self, "networkRequester");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __72__SHCDNDataFetcher_clusterDataAtURL_forLocation_date_completionHandler___block_invoke;
  v15[3] = &unk_24DCD2910;
  v16 = v9;
  v17 = v10;
  v13 = v10;
  v14 = v9;
  objc_msgSend(v12, "performRequest:completionHandler:", v11, v15);

}

void __72__SHCDNDataFetcher_clusterDataAtURL_forLocation_date_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  SHDataFetcherFileInfo *v9;
  void *v10;
  SHDataFetcherFileInfo *v11;
  void *v12;
  id v13;

  v13 = a4;
  if (a3)
  {
    v7 = a3;
    v8 = a2;
    v9 = [SHDataFetcherFileInfo alloc];
    objc_msgSend(v8, "suggestedFilename");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[SHDataFetcherFileInfo initWithData:suggestedFileName:](v9, "initWithData:suggestedFileName:", v7, v10);

    -[SHDataFetcherFileInfo setCreationDate:](v11, "setCreationDate:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v8, "valueForHTTPHeaderField:", CFSTR("Etag"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[SHDataFetcherFileInfo setUniqueHash:](v11, "setUniqueHash:", v12);
  }
  else
  {
    v11 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (SHNetworkRequester)networkRequester
{
  return self->_networkRequester;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkRequester, 0);
}

@end
