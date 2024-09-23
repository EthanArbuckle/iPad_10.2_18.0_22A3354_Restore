@implementation TVRCUTSMediaInfoRequest

- (void)requestForCanonicalID:(id)a3 completion:(id)a4
{
  -[TVRCUTSMediaInfoRequest requestForCanonicalID:includeRoles:completion:](self, "requestForCanonicalID:includeRoles:completion:", a3, 0, a4);
}

- (void)requestForCanonicalID:(id)a3 includeRoles:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  __CFString *v16;
  void *v17;
  id v18;
  __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  __CFString *v25;
  __CFString *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  __CFString *v30;
  __CFString *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  TVRCUTSMediaInfoRequest *v36;
  __CFString *v37;
  _QWORD v38[4];
  id v39;
  id v40;
  id v41;
  BOOL v42;
  id location;
  _QWORD v44[7];
  _QWORD v45[9];

  v6 = a4;
  v45[7] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  if (objc_msgSend(v8, "length"))
  {
    v36 = self;
    objc_msgSend(MEMORY[0x24BDB4398], "ams_sharedAccountStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "ams_activeiTunesAccount");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "ams_storefront");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "componentsSeparatedByString:", CFSTR("-"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "firstObject");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    v16 = CFSTR("143441");
    if (v14)
      v16 = (__CFString *)v14;
    v37 = v16;

    v17 = &unk_24DCF9080;
    if (v6)
      v17 = &unk_24DCF9068;
    v18 = v17;
    if (v6)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("view/product/%@"), v8);
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v20 = &unk_24DCF92E0;
    }
    else
    {
      v20 = (void *)MEMORY[0x24BDBD1B8];
      v19 = CFSTR("contents");
    }
    objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "firstObject");
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)v23;
    v25 = CFSTR("en-US");
    if (v23)
      v25 = (__CFString *)v23;
    v26 = v25;

    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "countryCode");
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = (void *)v28;
    v30 = CFSTR("US");
    if (v28)
      v30 = (__CFString *)v28;
    v31 = v30;

    if (v6)
    {
      v32 = &unk_24DCF9308;
    }
    else
    {
      v44[0] = CFSTR("ids");
      v44[1] = CFSTR("profile");
      v45[0] = v8;
      v45[1] = CFSTR("Full");
      v44[2] = CFSTR("caller");
      v44[3] = CFSTR("locale");
      v45[2] = CFSTR("tv-remote");
      v45[3] = v26;
      v44[4] = CFSTR("country");
      v44[5] = CFSTR("sf");
      v45[4] = v31;
      v45[5] = v37;
      v44[6] = CFSTR("pfm");
      v45[6] = CFSTR("AppleTV");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v45, v44, 7);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[TVRCUTSMediaInfoRequest _requestPropertiesForEndPoint:apiVersion:headersDict:queryParamsDict:](v36, "_requestPropertiesForEndPoint:apiVersion:headersDict:queryParamsDict:", v19, v18, v20, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC1ED8]), "initWithRequestProperties:", v33);
    objc_initWeak(&location, v34);
    v38[0] = MEMORY[0x24BDAC760];
    v38[1] = 3221225472;
    v38[2] = __73__TVRCUTSMediaInfoRequest_requestForCanonicalID_includeRoles_completion___block_invoke;
    v38[3] = &unk_24DCD6DB0;
    objc_copyWeak(&v41, &location);
    v42 = v6;
    v39 = v8;
    v40 = v9;
    objc_msgSend(v34, "setCompletionBlock:", v38);
    objc_msgSend(MEMORY[0x24BDD1710], "wlkDefaultConcurrentQueue");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "addOperation:", v34);

    objc_destroyWeak(&v41);
    objc_destroyWeak(&location);

  }
  else
  {
    +[TVRCMediaInfo mediaInfoWithDictionary:](TVRCMediaInfo, "mediaInfoWithDictionary:", MEMORY[0x24BDBD1B8]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *, _QWORD))v9 + 2))(v9, v21, 0);

  }
}

void __73__TVRCUTSMediaInfoRequest_requestForCanonicalID_includeRoles_completion___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;
  id v14;
  char v15;

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_loadWeakRetained(v2);
  objc_msgSend(v5, "responseDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __73__TVRCUTSMediaInfoRequest_requestForCanonicalID_includeRoles_completion___block_invoke_2;
  block[3] = &unk_24DCD6D88;
  v11 = v6;
  v15 = *(_BYTE *)(a1 + 56);
  v12 = *(id *)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v13 = v4;
  v14 = v7;
  v8 = v4;
  v9 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __73__TVRCUTSMediaInfoRequest_requestForCanonicalID_includeRoles_completion___block_invoke_2(uint64_t a1)
{
  id v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;

  v2 = *(id *)(a1 + 32);
  v3 = v2;
  if (!*(_BYTE *)(a1 + 64))
  {
    v8 = v2;
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("content"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
      v5 = objc_claimAutoreleasedReturnValue();

      v8 = (id)v5;
    }

    v3 = v8;
  }
  v6 = *(_QWORD *)(a1 + 56);
  v9 = v3;
  +[TVRCMediaInfo mediaInfoWithDictionary:](TVRCMediaInfo, "mediaInfoWithDictionary:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, _QWORD))(v6 + 16))(v6, v7, *(_QWORD *)(a1 + 48));

}

- (id)_requestPropertiesForEndPoint:(id)a3 apiVersion:(id)a4 headersDict:(id)a5 queryParamsDict:(id)a6
{
  return (id)objc_msgSend(MEMORY[0x24BEC1ED0], "requestPropertiesWithEndpoint:queryParameters:httpMethod:httpBody:headers:caller:timeout:apiVersion:options:", a3, a6, CFSTR("GET"), 0, a5, 0, 0, a4, 1);
}

- (TVRCUTSMediaInfoRequest)selfRetained
{
  return self->_selfRetained;
}

- (void)setSelfRetained:(id)a3
{
  objc_storeStrong((id *)&self->_selfRetained, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selfRetained, 0);
}

@end
