@implementation ICQUIHelperFunctions

void __57___ICQUIHelperFunctions_addHeadersForRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "allHTTPHeaderFields");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  v7 = v6;
  if (v6)
    v8 = v6;
  else
    v8 = (id)objc_opt_new();
  v9 = v8;

  objc_msgSend(v9, "addEntriesFromDictionary:", v4);
  objc_msgSend(*(id *)(a1 + 32), "setAllHTTPHeaderFields:", v9);
  objc_msgSend(MEMORY[0x24BDB4398], "ams_sharedAccountStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "ams_activeiTunesAccount");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "ams_DSID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v14 = *(void **)(a1 + 32);
      objc_msgSend(v12, "ams_DSID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringValue");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setValue:forHTTPHeaderField:", v16, CFSTR("X-Apple-Itunes-DSID"));

    }
  }
  _ICQGetLogSystem();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "allHTTPHeaderFields");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_alloc(MEMORY[0x24BDD17C8]);
    objc_msgSend(*(id *)(a1 + 32), "HTTPBody");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v19, "initWithData:encoding:", v20, 4);
    v22 = 138412546;
    v23 = v18;
    v24 = 2112;
    v25 = v21;
    _os_log_impl(&dword_21F2CC000, v17, OS_LOG_TYPE_DEFAULT, "Request headers: %@, body (decoded from data): %@", (uint8_t *)&v22, 0x16u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

@end
