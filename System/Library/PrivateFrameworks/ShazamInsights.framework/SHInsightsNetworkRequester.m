@implementation SHInsightsNetworkRequester

- (void)performRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *, void *, uint64_t);
  void *v15;
  SHInsightsNetworkRequester *v16;
  id v17;

  v6 = a4;
  v7 = (void *)MEMORY[0x24BDD1850];
  v8 = a3;
  objc_msgSend(v7, "sharedSession");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x24BDAC760];
  v13 = 3221225472;
  v14 = __63__SHInsightsNetworkRequester_performRequest_completionHandler___block_invoke;
  v15 = &unk_24DCD2948;
  v16 = self;
  v17 = v6;
  v10 = v6;
  objc_msgSend(v9, "dataTaskWithRequest:completionHandler:", v8, &v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "resume", v12, v13, v14, v15, v16);
}

void __63__SHInsightsNetworkRequester_performRequest_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;

  v7 = *(void **)(a1 + 32);
  v8 = a3;
  v9 = a2;
  objc_msgSend(v7, "response:data:error:", v8, v9, a4);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (v11)
    v10 = 0;
  else
    v10 = v9;
  (*(void (**)(_QWORD, id, id))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v8, v10);

}

- (void)downloadResourceFromRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *, void *, void *);
  void *v15;
  SHInsightsNetworkRequester *v16;
  id v17;

  v6 = a4;
  v7 = (void *)MEMORY[0x24BDD1850];
  v8 = a3;
  objc_msgSend(v7, "sharedSession");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x24BDAC760];
  v13 = 3221225472;
  v14 = __76__SHInsightsNetworkRequester_downloadResourceFromRequest_completionHandler___block_invoke;
  v15 = &unk_24DCD2970;
  v16 = self;
  v17 = v6;
  v10 = v6;
  objc_msgSend(v9, "downloadTaskWithRequest:completionHandler:", v8, &v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "resume", v12, v13, v14, v15, v16);
}

void __76__SHInsightsNetworkRequester_downloadResourceFromRequest_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;

  v7 = *(void **)(a1 + 32);
  v8 = (void *)MEMORY[0x24BDBCE50];
  v9 = a4;
  v10 = a3;
  v11 = a2;
  objc_msgSend(v8, "dataWithContentsOfURL:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "response:data:error:", v10, v12, v9);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  if (v14)
    v13 = 0;
  else
    v13 = v11;
  (*(void (**)(_QWORD, id, id))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v10, v13);

}

- (id)response:(id)a3 data:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  int v16;
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if ((unint64_t)(objc_msgSend(v7, "statusCode") - 200) < 0x64 || objc_msgSend(v7, "statusCode") == 304)
  {
    v10 = v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v8, 4);
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, *MEMORY[0x24BDD0FC8]);

    }
    if (objc_msgSend(v7, "statusCode") == 404)
      v13 = 200;
    else
      v13 = 100;
    +[SHInsightsError errorWithCode:underlyingError:keyOverrides:](SHInsightsError, "errorWithCode:underlyingError:keyOverrides:", v13, v9, v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    shcore_log_object();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v16 = 138412546;
      v17 = v7;
      v18 = 2112;
      v19 = v10;
      _os_log_impl(&dword_21A508000, v14, OS_LOG_TYPE_ERROR, "Network call: %@ failed with bad server response: %@", (uint8_t *)&v16, 0x16u);
    }

  }
  return v10;
}

@end
