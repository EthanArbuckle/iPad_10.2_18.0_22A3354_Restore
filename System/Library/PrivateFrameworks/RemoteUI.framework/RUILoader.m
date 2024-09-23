@implementation RUILoader

- (RUILoader)init
{
  RUILoader *v2;
  NSMutableArray *v3;
  NSMutableArray *pendingRefreshPageIDs;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RUILoader;
  v2 = -[RUIHTTPRequest init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    pendingRefreshPageIDs = v2->_pendingRefreshPageIDs;
    v2->_pendingRefreshPageIDs = v3;

    -[RUILoader initializeSwift](v2, "initializeSwift");
  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)RUILoader;
  -[RUIHTTPRequest dealloc](&v4, sel_dealloc);
}

- (void)cancel
{
  NSURL *url;
  objc_super v4;

  url = self->_url;
  self->_url = 0;

  v4.receiver = self;
  v4.super_class = (Class)RUILoader;
  -[RUIHTTPRequest cancel](&v4, sel_cancel);
}

- (void)loadRequest:(id)a3
{
  id v4;
  void *v5;
  NSURL *v6;
  NSURL *url;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (!self->_url)
  {
    objc_msgSend(v4, "URL");
    v6 = (NSURL *)objc_claimAutoreleasedReturnValue();
    url = self->_url;
    self->_url = v6;

  }
  v8 = (void *)objc_msgSend(v5, "mutableCopy");
  objc_msgSend(v8, "valueForHTTPHeaderField:", CFSTR("Accept"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(v8, "setValue:forHTTPHeaderField:", CFSTR("application/x-buddyml"), CFSTR("Accept"));
    if (!self->_userInterfaceStyle)
    {
      objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "traitCollection");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      self->_userInterfaceStyle = objc_msgSend(v11, "userInterfaceStyle");

      if (_isInternalInstall())
      {
        _RUILoggingFacility();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_userInterfaceStyle);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v18 = v13;
          _os_log_impl(&dword_209E87000, v12, OS_LOG_TYPE_DEFAULT, "User interface style unknown, grabbing from mainScreen - %@", buf, 0xCu);

        }
      }
    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_userInterfaceStyle);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringValue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setValue:forHTTPHeaderField:", v15, CFSTR("X-Apple-I-Appearance"));

  }
  v16.receiver = self;
  v16.super_class = (Class)RUILoader;
  -[RUIHTTPRequest loadRequest:](&v16, sel_loadRequest_, v8);

}

- (void)_handleShouldLoadRequestResult:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, id, _QWORD);
  NSURL *v8;
  NSURL *url;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  RUILoader *v18;
  id v19;

  v6 = a3;
  v7 = (void (**)(id, id, _QWORD))a4;
  objc_msgSend(v6, "URL");
  v8 = (NSURL *)objc_claimAutoreleasedReturnValue();
  url = self->_url;
  self->_url = v8;

  if (!v6
    || -[RUILoader allowNonSecureHTTP](self, "allowNonSecureHTTP")
    || (objc_msgSend(v6, "URL"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v10, "scheme"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("https")),
        v11,
        v10,
        (v12 & 1) != 0))
  {
    v7[2](v7, v6, 0);
  }
  else
  {
    v14 = MEMORY[0x24BDAC760];
    v15 = 3221225472;
    v16 = __62__RUILoader__handleShouldLoadRequestResult_completionHandler___block_invoke;
    v17 = &unk_24C2979C0;
    v18 = self;
    v19 = v6;
    dispatch_async(MEMORY[0x24BDAC9B8], &v14);
    +[RUIHTTPRequest nonSecureConnectionNotAllowedError](RUIHTTPRequest, "nonSecureConnectionNotAllowedError", v14, v15, v16, v17, v18);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, id, void *))v7)[2](v7, 0, v13);

  }
}

void __62__RUILoader__handleShouldLoadRequestResult_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  +[RUIHTTPRequest nonSecureConnectionNotAllowedError](RUIHTTPRequest, "nonSecureConnectionNotAllowedError");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "failWithError:forRequest:", v3, *(_QWORD *)(a1 + 40));

}

- (void)shouldLoadRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  id v11;
  void *v12;
  char v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[5];
  id v17;

  v6 = a3;
  v7 = a4;
  -[RUIHTTPRequest delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[RUIHTTPRequest delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __49__RUILoader_shouldLoadRequest_completionHandler___block_invoke;
    v16[3] = &unk_24C297AB0;
    v16[4] = self;
    v17 = v7;
    objc_msgSend(v10, "loader:willLoadRequest:redirectResponse:completionHandler:", self, v6, 0, v16);

  }
  else
  {
    v11 = v6;
    -[RUIHTTPRequest delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_opt_respondsToSelector();

    if ((v13 & 1) != 0)
    {
      -[RUIHTTPRequest delegate](self, "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "loader:willLoadRequest:redirectResponse:", self, v11, 0);
      v15 = objc_claimAutoreleasedReturnValue();

      v11 = (id)v15;
    }
    -[RUILoader _handleShouldLoadRequestResult:completionHandler:](self, "_handleShouldLoadRequestResult:completionHandler:", v11, v7);

  }
}

uint64_t __49__RUILoader_shouldLoadRequest_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return objc_msgSend(*(id *)(a1 + 32), "_handleShouldLoadRequestResult:completionHandler:", a2, *(_QWORD *)(a1 + 40));
}

- (id)sessionConfiguration
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  -[RUIHTTPRequest delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[RUIHTTPRequest delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sessionConfigurationForLoader:", self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)urlSessionDelegate
{
  _RUILoaderSessionDelegateAdapter *sessionDelegateAdapter;
  _RUILoaderSessionDelegateAdapter *v4;
  _RUILoaderSessionDelegateAdapter *v5;

  sessionDelegateAdapter = self->_sessionDelegateAdapter;
  if (!sessionDelegateAdapter)
  {
    v4 = objc_alloc_init(_RUILoaderSessionDelegateAdapter);
    v5 = self->_sessionDelegateAdapter;
    self->_sessionDelegateAdapter = v4;

    -[_RUILoaderSessionDelegateAdapter setDelegate:](self->_sessionDelegateAdapter, "setDelegate:", self);
    sessionDelegateAdapter = self->_sessionDelegateAdapter;
  }
  return sessionDelegateAdapter;
}

- (void)loadXMLUIWithURL:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(MEMORY[0x24BDD1840], "requestWithURL:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RUILoader loadRequest:](self, "loadRequest:", v5);
  if (-[RUIHTTPRequest isLoading](self, "isLoading"))
    objc_storeStrong((id *)&self->_url, a3);

}

- (void)loadXMLUIWithRequest:(id)a3
{
  NSURL *v4;
  NSURL *url;
  id v6;

  v6 = a3;
  -[RUILoader loadRequest:](self, "loadRequest:");
  if (-[RUIHTTPRequest isLoading](self, "isLoading"))
  {
    objc_msgSend(v6, "URL");
    v4 = (NSURL *)objc_claimAutoreleasedReturnValue();
    url = self->_url;
    self->_url = v4;

  }
}

- (void)loadXMLUIWithData:(id)a3 baseURL:(id)a4
{
  id v6;

  objc_storeStrong((id *)&self->_url, a4);
  v6 = a3;
  -[RUILoader parseData:](self, "parseData:", v6);

  -[RUILoader didParseData](self, "didParseData");
}

- (id)URL
{
  return self->_url;
}

- (void)parseData:(id)a3
{
  id v4;
  RUIParser *v5;
  NSURL *url;
  RUIStyle *style;
  void *v8;
  RUIParser *v9;
  RUIParser *parser;
  id WeakRetained;

  v4 = a3;
  v5 = [RUIParser alloc];
  url = self->_url;
  style = self->_style;
  WeakRetained = objc_loadWeakRetained((id *)&self->_parserDelegate);
  -[RUILoader decodingUserInfo](self, "decodingUserInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[RUIParser initWithXML:baseURL:style:delegate:decodingUserInfo:](v5, "initWithXML:baseURL:style:delegate:decodingUserInfo:", v4, url, style, WeakRetained, v8);

  parser = self->_parser;
  self->_parser = v9;

}

- (void)parseData:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  RUIParser *v8;
  NSURL *url;
  RUIStyle *style;
  id WeakRetained;
  void *v12;
  RUIParser *v13;
  RUIParser *parser;
  NSObject *v15;
  id v16;
  id v17;
  _QWORD block[5];
  id v19;
  id v20;

  v6 = a3;
  v7 = a4;
  v8 = [RUIParser alloc];
  url = self->_url;
  style = self->_style;
  WeakRetained = objc_loadWeakRetained((id *)&self->_parserDelegate);
  -[RUILoader decodingUserInfo](self, "decodingUserInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[RUIParser initWithBaseURL:style:delegate:decodingUserInfo:](v8, "initWithBaseURL:style:delegate:decodingUserInfo:", url, style, WeakRetained, v12);
  parser = self->_parser;
  self->_parser = v13;

  dispatch_get_global_queue(33, 0);
  v15 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __34__RUILoader_parseData_completion___block_invoke;
  block[3] = &unk_24C297AD8;
  block[4] = self;
  v19 = v6;
  v20 = v7;
  v16 = v7;
  v17 = v6;
  dispatch_async(v15, block);

}

void __34__RUILoader_parseData_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  _QWORD block[5];
  id v5;
  id v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "parseXML:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __34__RUILoader_parseData_completion___block_invoke_2;
  block[3] = &unk_24C297AD8;
  block[4] = *(_QWORD *)(a1 + 32);
  v5 = v2;
  v6 = *(id *)(a1 + 48);
  v3 = v2;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __34__RUILoader_parseData_completion___block_invoke_2(_QWORD *a1)
{
  objc_msgSend(*(id *)(a1[4] + 40), "parseObjectModelWithXMLElement:", a1[5]);
  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

- (void)_loadResources
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  RUILoader *v20;
  id v21;
  id v22;
  _QWORD aBlock[5];
  id v24;
  id v25;
  id v26;

  -[RUIHTTPRequest delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RUIParser uiObjectModel](self->_parser, "uiObjectModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RUIParser actionSignal](self->_parser, "actionSignal");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[RUIParser succeeded](self->_parser, "succeeded");
  -[RUIParser error](self->_parser, "error");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (id)v7;
  if (v6)
  {
    v9 = MEMORY[0x24BDAC760];
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __27__RUILoader__loadResources__block_invoke;
    aBlock[3] = &unk_24C297B00;
    aBlock[4] = self;
    v10 = v4;
    v24 = v10;
    v11 = v5;
    v25 = v11;
    v8 = v8;
    v26 = v8;
    v12 = _Block_copy(aBlock);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v18[0] = v9;
      v18[1] = 3221225472;
      v18[2] = __27__RUILoader__loadResources__block_invoke_2;
      v18[3] = &unk_24C297B00;
      v19 = v3;
      v20 = self;
      v21 = v10;
      v22 = v11;
      v13 = _Block_copy(v18);

      v12 = v13;
    }
    +[RUIInternalResourceLoader shared](RUIInternalResourceLoader, "shared");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v9;
    v16[1] = 3221225472;
    v16[2] = __27__RUILoader__loadResources__block_invoke_4;
    v16[3] = &unk_24C297B50;
    v17 = v12;
    v15 = v12;
    objc_msgSend(v14, "loadWithCompletionHandler:", v16);

  }
  else
  {
    if (!v7)
    {
      +[RUIHTTPRequest errorWithCode:](RUIHTTPRequest, "errorWithCode:", 4);
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    -[RUILoader _finishLoadWithObjectModel:actionSignal:error:](self, "_finishLoadWithObjectModel:actionSignal:error:", v4, v5, v8);
  }

}

uint64_t __27__RUILoader__loadResources__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishLoadWithObjectModel:actionSignal:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

void __27__RUILoader__loadResources__block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void **)(a1 + 48);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __27__RUILoader__loadResources__block_invoke_3;
  v5[3] = &unk_24C297B28;
  v5[4] = v3;
  v6 = v4;
  v7 = *(id *)(a1 + 56);
  objc_msgSend(v2, "loader:loadResourcesForObjectModel:completion:", v3, v6, v5);

}

uint64_t __27__RUILoader__loadResources__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishLoadWithObjectModel:actionSignal:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a3);
}

void __27__RUILoader__loadResources__block_invoke_4(uint64_t a1)
{
  dispatch_async(MEMORY[0x24BDAC9B8], *(dispatch_block_t *)(a1 + 32));
}

- (void)_finishLoadWithObjectModel:(id)a3 actionSignal:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSURL *url;
  RUILoader *v13;
  void *v14;
  void *v15;
  char v16;
  id v17;
  BOOL v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  RUIParser *parser;
  NSURL *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  RUILoader *v30;
  __int128 *p_buf;
  BOOL v32;
  char v33;
  __int128 buf;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (_isInternalInstall())
  {
    _RUILoggingFacility();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      url = self->_url;
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = url;
      _os_log_impl(&dword_209E87000, v11, OS_LOG_TYPE_DEFAULT, "Finished load of %@", (uint8_t *)&buf, 0xCu);
    }

  }
  v13 = self;
  -[RUIHTTPRequest delegate](v13, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[RUIHTTPRequest request](v13, "request");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "loader:didFinishLoadWithError:forRequest:", v13, v10, v15);

LABEL_9:
    v16 = 1;
    goto LABEL_11;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v14, "loader:didFinishLoadWithError:", v13, v10);
    goto LABEL_9;
  }
  v16 = 0;
LABEL_11:
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy_;
  v37 = __Block_byref_object_dispose_;
  v17 = v9;
  v38 = v17;
  if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
  {
    v18 = 1;
  }
  else
  {
    objc_msgSend(v8, "primaryAlert");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      v18 = 1;
    }
    else
    {
      objc_msgSend(v8, "clientInfo");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v20, "count") != 0;

    }
  }
  objc_msgSend(v8, "setSourceURL:", v13->_url);
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __59__RUILoader__finishLoadWithObjectModel_actionSignal_error___block_invoke;
  v26[3] = &unk_24C297B78;
  v21 = v10;
  v32 = v18;
  v27 = v21;
  p_buf = &buf;
  v22 = v8;
  v28 = v22;
  v23 = v14;
  v29 = v23;
  v30 = v13;
  v33 = v16;
  -[RUILoader _showPrimaryAlertForObjectModel:completion:](v13, "_showPrimaryAlertForObjectModel:completion:", v22, v26);
  parser = v13->_parser;
  v13->_parser = 0;

  v25 = v13->_url;
  v13->_url = 0;

  _Block_object_dispose(&buf, 8);
}

uint64_t __59__RUILoader__finishLoadWithObjectModel_actionSignal_error___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  char v7;
  uint64_t v8;
  uint8_t v10[16];

  if (*(_QWORD *)(a1 + 32) || !*(_BYTE *)(a1 + 72))
  {
    if (_isInternalInstall())
    {
      _RUILoggingFacility();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_209E87000, v2, OS_LOG_TYPE_DEFAULT, "No object model in server response", v10, 2u);
      }

    }
    if (!*(_BYTE *)(a1 + 73) && (objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(*(id *)(a1 + 48), "loader:didFailWithError:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32));
  }
  else
  {
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
    {
      objc_msgSend(*(id *)(a1 + 40), "primaryAlert");
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      if (v3)
      {
        +[RUIActionSignal signalWithType:](RUIActionSignal, "signalWithType:", 7);
        v4 = objc_claimAutoreleasedReturnValue();
        v5 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
        v6 = *(void **)(v5 + 40);
        *(_QWORD *)(v5 + 40) = v4;

      }
    }
    v7 = objc_opt_respondsToSelector();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    if ((v7 & 1) != 0)
      objc_msgSend(*(id *)(a1 + 48), "loader:receivedObjectModel:topActionSignal:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(v8 + 40));
    else
      objc_msgSend(*(id *)(a1 + 48), "loader:receivedObjectModel:actionSignal:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(v8 + 40), "topSignal"));
  }
  return objc_msgSend(*(id *)(a1 + 56), "completePendingPageRefresh");
}

- (void)completePendingPageRefresh
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__RUILoader_completePendingPageRefresh__block_invoke;
  block[3] = &unk_24C2973F0;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __39__RUILoader_completePendingPageRefresh__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "pendingRefreshPageIDs", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v6);
        objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "postNotificationName:object:", CFSTR("RUIPageRefreshRequestedNotification"), v7);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

  objc_msgSend(*(id *)(a1 + 32), "pendingRefreshPageIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeAllObjects");

}

- (void)_showPrimaryAlertForObjectModel:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  char v9;
  void *v10;
  void *v11;
  uint64_t v12;
  char v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  void (**v17)(_QWORD);
  _QWORD *v18;
  _QWORD v19[5];
  RUILoader *v20;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  -[RUIHTTPRequest delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  -[RUIHTTPRequest delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if ((v9 & 1) != 0)
  {
    objc_msgSend(v10, "viewControllerForAlertPresentation");
    v12 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v14 = (void *)v12;

    goto LABEL_7;
  }
  v13 = objc_opt_respondsToSelector();

  if ((v13 & 1) != 0)
  {
    -[RUIHTTPRequest delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "parentViewControllerForObjectModel:", v6);
    v12 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  v14 = 0;
LABEL_7:
  objc_msgSend(v6, "primaryAlert");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy_;
  v19[4] = __Block_byref_object_dispose_;
  v20 = self;
  if (v15)
  {
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __56__RUILoader__showPrimaryAlertForObjectModel_completion___block_invoke;
    v16[3] = &unk_24C297BA0;
    v17 = v7;
    v18 = v19;
    objc_msgSend(v15, "runAlertInController:completion:", v14, v16);

  }
  else
  {
    v7[2](v7);
  }
  _Block_object_dispose(v19, 8);

}

void __56__RUILoader__showPrimaryAlertForObjectModel_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

}

- (BOOL)anyWebViewLoading
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[RUIParser uiObjectModel](self->_parser, "uiObjectModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allPages");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v7, "hasWebView", (_QWORD)v12))
        {
          objc_msgSend(v7, "webViewOM");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "webView");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "isLoading");

          if ((v10 & 1) != 0)
          {
            LOBYTE(v4) = 1;
            goto LABEL_12;
          }
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_12:

  return v4;
}

- (void)didParseData
{
  id v3;

  if (-[RUILoader anyWebViewLoading](self, "anyWebViewLoading"))
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_webViewFinishedLoading, RUIWebViewDidFinishLoadNotification, 0);

  }
  else
  {
    -[RUILoader allWebViewsFinishedLoading](self, "allWebViewsFinishedLoading");
  }
}

- (void)webViewFinishedLoading
{
  void *v3;

  if (!-[RUILoader anyWebViewLoading](self, "anyWebViewLoading"))
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:name:object:", self, RUIWebViewDidFinishLoadNotification, 0);

    -[RUILoader allWebViewsFinishedLoading](self, "allWebViewsFinishedLoading");
  }
}

- (void)failWithError:(id)a3 forRequest:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  char v15;
  NSURL *url;
  int v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (_isInternalInstall())
  {
    _RUILoggingFacility();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 138412290;
      v18 = v6;
      _os_log_impl(&dword_209E87000, v8, OS_LOG_TYPE_DEFAULT, "RUILoader failed with error %@", (uint8_t *)&v17, 0xCu);
    }

  }
  -[RUIHTTPRequest delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  -[RUIHTTPRequest delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if ((v10 & 1) != 0)
  {
    objc_msgSend(v11, "loader:didFinishLoadWithError:forRequest:", self, v6, v7);
LABEL_11:

    goto LABEL_12;
  }
  v13 = objc_opt_respondsToSelector();

  -[RUIHTTPRequest delegate](self, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v14;
  if ((v13 & 1) != 0)
  {
    objc_msgSend(v14, "loader:didFinishLoadWithError:", self, v6);
    goto LABEL_11;
  }
  v15 = objc_opt_respondsToSelector();

  if ((v15 & 1) != 0)
  {
    -[RUIHTTPRequest delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "loader:didFailWithError:", self, v6);
    goto LABEL_11;
  }
LABEL_12:
  url = self->_url;
  self->_url = 0;

}

- (BOOL)receivedValidResponse:(id)a3 forRequest:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  char v13;
  BOOL v14;
  objc_super v16;
  _QWORD block[4];
  id v18;
  RUILoader *v19;

  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __46__RUILoader_receivedValidResponse_forRequest___block_invoke;
    block[3] = &unk_24C2979C0;
    v8 = v6;
    v18 = v8;
    v19 = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
    -[RUIHTTPRequest delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_respondsToSelector();

    -[RUIHTTPRequest delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if ((v10 & 1) != 0)
    {
      objc_msgSend(v11, "loader:didReceiveHTTPResponse:forRequest:", self, v8, v7);
    }
    else
    {
      v13 = objc_opt_respondsToSelector();

      if ((v13 & 1) == 0)
      {
LABEL_7:

        goto LABEL_8;
      }
      -[RUIHTTPRequest delegate](self, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "loader:didReceiveHTTPResponse:", self, v8);
    }

    goto LABEL_7;
  }
LABEL_8:
  v16.receiver = self;
  v16.super_class = (Class)RUILoader;
  v14 = -[RUIHTTPRequest receivedValidResponse:forRequest:](&v16, sel_receivedValidResponse_forRequest_, v6, v7);

  return v14;
}

void __46__RUILoader_receivedValidResponse_forRequest___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  _QWORD v4[5];
  uint8_t buf[4];
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "allHeaderFields");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_isInternalInstall())
  {
    _RUILoggingFacility();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v6 = v2;
      _os_log_impl(&dword_209E87000, v3, OS_LOG_TYPE_DEFAULT, "loader receivedValidResponse. headers: %@", buf, 0xCu);
    }

  }
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __46__RUILoader_receivedValidResponse_forRequest___block_invoke_52;
  v4[3] = &unk_24C297BC8;
  v4[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v4);

}

void __46__RUILoader_receivedValidResponse_forRequest___block_invoke_52(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  int v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(a2, "lowercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("x-apple-i-refresh-page"));

  if (v7)
  {
    if (_isInternalInstall())
    {
      _RUILoggingFacility();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 138412290;
        v13 = v5;
        _os_log_impl(&dword_209E87000, v8, OS_LOG_TYPE_DEFAULT, "Posting RUIPageRefreshRequestedNotification for page: %@", (uint8_t *)&v12, 0xCu);
      }

    }
    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByTrimmingCharactersInSet:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "pendingRefreshPageIDs");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v10);

  }
}

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  _QWORD aBlock[5];
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v10 = a5;
  v11 = a6;
  v12 = a7;
  if (_isInternalInstall())
  {
    _RUILoggingFacility();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v10, "URL");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "URL");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v26 = v14;
      v27 = 2112;
      v28 = v15;
      _os_log_impl(&dword_209E87000, v13, OS_LOG_TYPE_DEFAULT, "Loader processing redirect from %@ to %@", buf, 0x16u);

    }
  }
  if (v10)
  {
    v16 = MEMORY[0x24BDAC760];
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __85__RUILoader_URLSession_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke;
    aBlock[3] = &unk_24C297BF0;
    aBlock[4] = self;
    v24 = v12;
    v17 = _Block_copy(aBlock);
    -[RUIHTTPRequest delegate](self, "delegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_opt_respondsToSelector();

    if ((v19 & 1) != 0)
    {
      -[RUIHTTPRequest delegate](self, "delegate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = v16;
      v21[1] = 3221225472;
      v21[2] = __85__RUILoader_URLSession_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke_2;
      v21[3] = &unk_24C297C18;
      v22 = v17;
      objc_msgSend(v20, "loader:willLoadRequest:redirectResponse:completionHandler:", self, v11, v10, v21);

    }
    else
    {
      (*((void (**)(void *, id))v17 + 2))(v17, v11);
    }

  }
  else
  {
    (*((void (**)(id, id))v12 + 2))(v12, v11);
  }

}

void __85__RUILoader_URLSession_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a2;
  v8 = v3;
  if (v3)
  {
    objc_msgSend(v3, "URL");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 48);
    *(_QWORD *)(v5 + 48) = v4;

    v7 = (void *)objc_msgSend(v8, "mutableCopy");
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "cancel");
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

uint64_t __85__RUILoader_URLSession_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 32);
  if (a3)
    a2 = 0;
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 16))(v3, a2);
}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  void (**v7)(id, uint64_t, _QWORD);
  void *v8;
  char v9;
  void *v10;
  id v11;

  v11 = a4;
  v7 = (void (**)(id, uint64_t, _QWORD))a5;
  -[RUIHTTPRequest delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[RUIHTTPRequest delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "loader:didReceiveChallenge:completionHandler:", self, v11, v7);

  }
  else if (v7)
  {
    v7[2](v7, 1, 0);
  }

}

- (BOOL)allowNonSecureHTTP
{
  return self->_allowNonSecureHTTP;
}

- (void)setAllowNonSecureHTTP:(BOOL)a3
{
  self->_allowNonSecureHTTP = a3;
}

- (RUIParserDelegate)parserDelegate
{
  return (RUIParserDelegate *)objc_loadWeakRetained((id *)&self->_parserDelegate);
}

- (void)setParserDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_parserDelegate, a3);
}

- (RUIStyle)style
{
  return self->_style;
}

- (void)setStyle:(id)a3
{
  objc_storeStrong((id *)&self->_style, a3);
}

- (int64_t)userInterfaceStyle
{
  return self->_userInterfaceStyle;
}

- (void)setUserInterfaceStyle:(int64_t)a3
{
  self->_userInterfaceStyle = a3;
}

- (NSMutableArray)pendingRefreshPageIDs
{
  return self->_pendingRefreshPageIDs;
}

- (void)setPendingRefreshPageIDs:(id)a3
{
  objc_storeStrong((id *)&self->_pendingRefreshPageIDs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingRefreshPageIDs, 0);
  objc_storeStrong((id *)&self->_style, 0);
  objc_destroyWeak((id *)&self->_parserDelegate);
  objc_storeStrong((id *)&self->_sessionDelegateAdapter, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_parser, 0);
}

- (void)initializeSwift
{
  RUILoader *v3;
  RUIDecodingUserInfo *v4;
  uint64_t v5;
  uint64_t v6;

  type metadata accessor for RUIDecodingUserInfo();
  v3 = self;
  RUIDecodingUserInfo.init()(v4);
  v6 = v5;
  sub_209EE5AE8((uint64_t)&v6, (uint64_t)&type metadata for DecodingUserInfoAssociatedKey, (uint64_t)&type metadata for DecodingUserInfoAssociatedKey, (uint64_t)&off_2545B94A8);

}

- (RUIDecodingUserInfo)decodingUserInfo
{
  RUILoader *v2;
  id v4;

  v2 = self;
  sub_209EE596C((uint64_t)&type metadata for DecodingUserInfoAssociatedKey, (uint64_t)&off_2545B94A8, (uint64_t)&v4);

  return (RUIDecodingUserInfo *)v4;
}

@end
