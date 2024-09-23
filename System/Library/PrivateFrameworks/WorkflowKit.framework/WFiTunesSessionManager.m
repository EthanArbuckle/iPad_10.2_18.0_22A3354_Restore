@implementation WFiTunesSessionManager

- (WFiTunesSessionManager)init
{
  return -[WFiTunesSessionManager initWithSessionConfiguration:](self, "initWithSessionConfiguration:", 0);
}

- (WFiTunesSessionManager)initWithSessionConfiguration:(id)a3
{
  id v4;
  WFiTunesSessionManager *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSURLSession *session;
  uint64_t v10;
  NSURL *baseURL;
  WFiTunesSessionManager *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WFiTunesSessionManager;
  v5 = -[WFiTunesSessionManager init](&v14, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0CB39F0];
    v7 = v4;
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0CB39F8], "wf_defaultSessionConfiguration");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "sessionWithConfiguration:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    session = v5->_session;
    v5->_session = (NSURLSession *)v8;

    if (!v4)
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://itunes.apple.com/"));
    v10 = objc_claimAutoreleasedReturnValue();
    baseURL = v5->_baseURL;
    v5->_baseURL = (NSURL *)v10;

    v12 = v5;
  }

  return v5;
}

- (void)searchForMediaOfType:(id)a3 limitedToEntityType:(id)a4 withTerm:(id)a5 forAttribute:(id)a6 countryCode:(id)a7 limit:(unint64_t)a8 completion:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;

  v36 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a9;
  if (!v18)
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKey:", *MEMORY[0x1E0C997B0]);
    v18 = (id)objc_claimAutoreleasedReturnValue();

  }
  v21 = (void *)MEMORY[0x1E0C99DE8];
  v35 = v16;
  objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("term"), v16);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("country"), v18);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "arrayWithObjects:", v22, v23, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("media"), v36);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addObject:", v25);

  }
  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("entity"), v15);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addObject:", v26);

  }
  if (v17)
  {
    objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("attribute"), v17);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addObject:", v27);

  }
  if (a8)
  {
    v28 = (void *)MEMORY[0x1E0CB39D8];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), a8);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "queryItemWithName:value:", CFSTR("limit"), v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addObject:", v30);

  }
  v31 = (void *)MEMORY[0x1E0CB3998];
  -[WFiTunesSessionManager baseURL](self, "baseURL");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "componentsWithURL:resolvingAgainstBaseURL:", v32, 0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v33, "setPath:", CFSTR("/search"));
  objc_msgSend(v33, "setQueryItems:", v24);
  objc_msgSend(v33, "URL");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFiTunesSessionManager getMediaWithURL:completion:](self, "getMediaWithURL:completion:", v34, v19);

}

- (void)lookupMediaWithIdentifiers:(id)a3 countryCode:(id)a4 completion:(id)a5
{
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a4;
  v8 = (void *)MEMORY[0x1E0CB3998];
  v9 = a5;
  v10 = a3;
  -[WFiTunesSessionManager baseURL](self, "baseURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "componentsWithURL:resolvingAgainstBaseURL:", v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setPath:", CFSTR("/lookup"));
  v13 = (void *)objc_opt_new();
  v14 = (void *)MEMORY[0x1E0CB39D8];
  objc_msgSend(v10, "componentsJoinedByString:", CFSTR(","));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "queryItemWithName:value:", CFSTR("id"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObject:", v16);

  if (v19)
  {
    objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("country"), v19);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v17);

  }
  objc_msgSend(v12, "setQueryItems:", v13);
  objc_msgSend(v12, "URL");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFiTunesSessionManager getMediaWithURL:completion:](self, "getMediaWithURL:completion:", v18, v9);

}

- (void)lookupMediaWithBundleIdentifier:(id)a3 countryCode:(id)a4 completion:(id)a5
{
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a4;
  v8 = (void *)MEMORY[0x1E0CB3998];
  v9 = a5;
  v10 = a3;
  -[WFiTunesSessionManager baseURL](self, "baseURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "componentsWithURL:resolvingAgainstBaseURL:", v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setPath:", CFSTR("/lookup"));
  v13 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("bundleId"), v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "addObject:", v14);
  if (v17)
  {
    objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("country"), v17);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v15);

  }
  objc_msgSend(v12, "setQueryItems:", v13);
  objc_msgSend(v12, "URL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFiTunesSessionManager getMediaWithURL:completion:](self, "getMediaWithURL:completion:", v16, v9);

}

- (void)lookupMediaWithUPC:(unint64_t)a3 completion:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0CB3998];
  v7 = a4;
  -[WFiTunesSessionManager baseURL](self, "baseURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsWithURL:resolvingAgainstBaseURL:", v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setPath:", CFSTR("/lookup"));
  v10 = (void *)MEMORY[0x1E0CB39D8];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llu"), a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "queryItemWithName:value:", CFSTR("upc"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setQueryItems:", v13);

  objc_msgSend(v9, "URL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFiTunesSessionManager getMediaWithURL:completion:](self, "getMediaWithURL:completion:", v14, v7);

}

- (void)lookupMediaWithISBN:(unint64_t)a3 completion:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0CB3998];
  v7 = a4;
  -[WFiTunesSessionManager baseURL](self, "baseURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsWithURL:resolvingAgainstBaseURL:", v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setPath:", CFSTR("/lookup"));
  v10 = (void *)MEMORY[0x1E0CB39D8];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llu"), a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "queryItemWithName:value:", CFSTR("isbn"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setQueryItems:", v13);

  objc_msgSend(v9, "URL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFiTunesSessionManager getMediaWithURL:completion:](self, "getMediaWithURL:completion:", v14, v7);

}

- (void)getMediaWithURL:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v7 = a3;
  -[WFiTunesSessionManager session](self, "session");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __53__WFiTunesSessionManager_getMediaWithURL_completion___block_invoke;
  v11[3] = &unk_1E7AF3CD0;
  v12 = v6;
  v9 = v6;
  objc_msgSend(v8, "dataTaskWithURL:completionHandler:", v7, v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "resume");
}

- (NSURLSession)session
{
  return self->_session;
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

void __53__WFiTunesSessionManager_getMediaWithURL_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  id v15;

  v6 = a2;
  v7 = a4;
  if (objc_msgSend(v6, "length"))
  {
    v15 = v7;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v6, 0, &v15);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v15;

    if (v8)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("results"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1 + 32);
      if (v10)
      {
        v14 = v9;
        +[MTLJSONAdapter modelsOfClass:fromJSONArray:error:](MTLJSONAdapter, "modelsOfClass:fromJSONArray:error:", objc_opt_class(), v10, &v14);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v14;

        (*(void (**)(uint64_t, void *, id))(v11 + 16))(v11, v12, v13);
        v9 = v13;
      }
      else
      {
        (*(void (**)(uint64_t, _QWORD, id))(v11 + 16))(v11, 0, v9);
      }

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }

    v7 = v9;
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

@end
