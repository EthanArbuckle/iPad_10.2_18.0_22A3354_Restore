@implementation RUIServerHookHandler

- (RUIServerHookHandler)initWithRemoteUIController:(id)a3
{
  return -[RUIServerHookHandler initWithRemoteUIController:hooks:](self, "initWithRemoteUIController:hooks:", a3, MEMORY[0x24BDBD1A8]);
}

- (RUIServerHookHandler)initWithRemoteUIController:(id)a3 hooks:(id)a4
{
  id v6;
  id v7;
  RUIServerHookHandler *v8;
  RUIServerHookHandler *v9;
  uint64_t v10;
  NSArray *serverHooks;
  uint64_t v12;
  NSMutableArray *hookIdentifiers;

  v6 = a3;
  v7 = a4;
  v8 = -[RUIServerHookHandler init](self, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_remoteUIController, v6);
    v10 = objc_msgSend(v7, "copy");
    serverHooks = v9->_serverHooks;
    v9->_serverHooks = (NSArray *)v10;

    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", -[NSArray count](v9->_serverHooks, "count"));
    v12 = objc_claimAutoreleasedReturnValue();
    hookIdentifiers = v9->_hookIdentifiers;
    v9->_hookIdentifiers = (NSMutableArray *)v12;

    -[RUIServerHookHandler _rebuildServerHookHandlers](v9, "_rebuildServerHookHandlers");
  }

  return v9;
}

- (void)_rebuildServerHookHandlers
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  NSMutableArray *hookIdentifiers;
  NSObject *v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  NSObject *v14;
  __int128 v15;
  NSArray *obj;
  id WeakRetained;
  _QWORD v18[5];
  id v19;
  _QWORD v20[5];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  id location;
  _QWORD v26[4];
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)&self->_remoteUIController);
  if (_isInternalInstall())
  {
    _RUILoggingFacility();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_209E87000, v3, OS_LOG_TYPE_DEFAULT, "Rebuilding server hook handlers", buf, 2u);
    }

  }
  v4 = -[NSMutableArray count](self->_hookIdentifiers, "count");
  v5 = MEMORY[0x24BDAC760];
  if (v4)
  {
    hookIdentifiers = self->_hookIdentifiers;
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __50__RUIServerHookHandler__rebuildServerHookHandlers__block_invoke;
    v26[3] = &unk_24C297488;
    v27 = WeakRetained;
    -[NSMutableArray enumerateObjectsUsingBlock:](hookIdentifiers, "enumerateObjectsUsingBlock:", v26);
    -[NSMutableArray removeAllObjects](self->_hookIdentifiers, "removeAllObjects");
    if (_isInternalInstall())
    {
      _RUILoggingFacility();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_209E87000, v7, OS_LOG_TYPE_DEFAULT, "Cleared existing server hook handlers", buf, 2u);
      }

    }
  }
  objc_initWeak(&location, self);
  v24 = 0u;
  v22 = 0u;
  v23 = 0u;
  v21 = 0u;
  obj = self->_serverHooks;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v21, v32, 16);
  if (v8)
  {
    v10 = *(_QWORD *)v22;
    *(_QWORD *)&v9 = 138412546;
    v15 = v9;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v12, "setDelegate:", self, v15);
        v20[0] = v5;
        v20[1] = 3221225472;
        v20[2] = __50__RUIServerHookHandler__rebuildServerHookHandlers__block_invoke_26;
        v20[3] = &unk_24C2974B0;
        v20[4] = v12;
        v18[0] = v5;
        v18[1] = 3221225472;
        v18[2] = __50__RUIServerHookHandler__rebuildServerHookHandlers__block_invoke_2;
        v18[3] = &unk_24C297528;
        v18[4] = v12;
        objc_copyWeak(&v19, &location);
        objc_msgSend(WeakRetained, "setHandlerForElementsMatching:handler:", v20, v18);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObject:](self->_hookIdentifiers, "addObject:", v13);
        if (_isInternalInstall())
        {
          _RUILoggingFacility();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v15;
            v29 = v12;
            v30 = 2112;
            v31 = v13;
            _os_log_impl(&dword_209E87000, v14, OS_LOG_TYPE_DEFAULT, "Created a handler for hook: %@ with identifier %@", buf, 0x16u);
          }

        }
        objc_destroyWeak(&v19);
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v21, v32, 16);
    }
    while (v8);
  }

  objc_destroyWeak(&location);
}

uint64_t __50__RUIServerHookHandler__rebuildServerHookHandlers__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeHandlerForKey:", a2);
}

uint64_t __50__RUIServerHookHandler__rebuildServerHookHandlers__block_invoke_26(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "shouldMatchElement:", a2);
}

void __50__RUIServerHookHandler__rebuildServerHookHandlers__block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  id *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (_isInternalInstall())
  {
    _RUILoggingFacility();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "name");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v24 = v11;
      v25 = 2112;
      v26 = v9;
      _os_log_impl(&dword_209E87000, v10, OS_LOG_TYPE_DEFAULT, "Starting to process element %@ with attributes: %@", buf, 0x16u);

    }
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "setObjectModel:", v7);
  v13 = *(void **)(a1 + 32);
  v12 = (id *)(a1 + 32);
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __50__RUIServerHookHandler__rebuildServerHookHandlers__block_invoke_28;
  v17[3] = &unk_24C297500;
  v14 = v8;
  v18 = v14;
  objc_copyWeak(&v22, v12 + 1);
  v19 = *v12;
  v15 = v9;
  v20 = v15;
  v16 = v7;
  v21 = v16;
  objc_msgSend(v13, "processElement:attributes:objectModel:completion:", v14, v15, v16, v17);

  objc_destroyWeak(&v22);
}

void __50__RUIServerHookHandler__rebuildServerHookHandlers__block_invoke_28(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  id WeakRetained;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (_isInternalInstall())
  {
    _RUILoggingFacility();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v15 = v7;
      _os_log_impl(&dword_209E87000, v6, OS_LOG_TYPE_DEFAULT, "Finished processing element: %@", buf, 0xCu);

    }
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    v9 = *(_QWORD *)(a1 + 48);
    v10 = *(_QWORD *)(a1 + 56);
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __50__RUIServerHookHandler__rebuildServerHookHandlers__block_invoke_29;
    v12[3] = &unk_24C2974D8;
    v11 = *(_QWORD *)(a1 + 40);
    v13 = *(id *)(a1 + 32);
    objc_msgSend(WeakRetained, "_handleResponseForHook:success:error:attributes:objectModel:completion:", v11, a2, v5, v9, v10, v12);

  }
}

void __50__RUIServerHookHandler__rebuildServerHookHandlers__block_invoke_29(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (_isInternalInstall())
  {
    _RUILoggingFacility();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "name");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = 138412290;
      v5 = v3;
      _os_log_impl(&dword_209E87000, v2, OS_LOG_TYPE_DEFAULT, "Finished reloading UI in response to element: %@", (uint8_t *)&v4, 0xCu);

    }
  }
}

- (void)setServerHooks:(id)a3
{
  NSArray *v4;
  NSArray *serverHooks;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  serverHooks = self->_serverHooks;
  self->_serverHooks = v4;

  -[RUIServerHookHandler _rebuildServerHookHandlers](self, "_rebuildServerHookHandlers");
}

- (void)processObjectModel:(id)a3 isModal:(BOOL)a4
{
  -[RUIServerHookHandler processObjectModel:isModal:completion:](self, "processObjectModel:isModal:completion:", a3, a4, 0);
}

- (void)_handleResponseForHook:(id)a3 success:(BOOL)a4 error:(id)a5 attributes:(id)a6 objectModel:(id)a7 completion:(id)a8
{
  _BOOL8 v12;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  id v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v12 = a4;
  v29 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v14, "serverHookResponse");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = 0;
  }
  if (_isInternalInstall())
  {
    _RUILoggingFacility();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v17, "serverInfo");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138412546;
      v26 = v17;
      v27 = 2112;
      v28 = v21;
      _os_log_impl(&dword_209E87000, v20, OS_LOG_TYPE_DEFAULT, "Attempting to reload with originating OM: %@ - %@", (uint8_t *)&v25, 0x16u);

    }
  }
  objc_msgSend(v19, "continuationRequest");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend(v19, "continuationRequest");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUIServerHookHandler refreshWithRequest:completion:](self, "refreshWithRequest:completion:", v23, v18);
  }
  else
  {
    -[RUIServerHookHandler _responseDataForResult:withError:](self, "_responseDataForResult:withError:", v12, v15);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      objc_msgSend(v19, "additionalPayload");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v24)
        objc_msgSend(v23, "addEntriesFromDictionary:", v24);

    }
    -[RUIServerHookHandler _reloadUIWithInfo:attributes:initiatingObjectModel:completion:](self, "_reloadUIWithInfo:attributes:initiatingObjectModel:completion:", v23, v16, v17, v18);
  }

}

- (void)processObjectModel:(id)a3 isModal:(BOOL)a4 completion:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  NSArray *serverHooks;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint8_t *v16;
  id v17;
  uint8_t buf[8];
  uint8_t *v19;
  uint64_t v20;
  char v21;
  id location;

  v7 = a3;
  v8 = a5;
  if (_isInternalInstall())
  {
    _RUILoggingFacility();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_209E87000, v9, OS_LOG_TYPE_DEFAULT, "Processing object model to detect hook handler matches...", buf, 2u);
    }

  }
  objc_initWeak(&location, self);
  *(_QWORD *)buf = 0;
  v19 = buf;
  v20 = 0x2020000000;
  v21 = 0;
  serverHooks = self->_serverHooks;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __62__RUIServerHookHandler_processObjectModel_isModal_completion___block_invoke;
  v13[3] = &unk_24C2975A0;
  v11 = v7;
  v14 = v11;
  v16 = buf;
  objc_copyWeak(&v17, &location);
  v12 = v8;
  v15 = v12;
  -[NSArray enumerateObjectsUsingBlock:](serverHooks, "enumerateObjectsUsingBlock:", v13);
  if (v12 && !v19[24])
    (*((void (**)(id, _QWORD, _QWORD))v12 + 2))(v12, 0, 0);

  objc_destroyWeak(&v17);
  _Block_object_dispose(buf, 8);
  objc_destroyWeak(&location);

}

void __62__RUIServerHookHandler_processObjectModel_isModal_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  int v7;
  int isInternalInstall;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  NSObject *v18;
  id v19;
  id v20;
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = objc_msgSend(v6, "shouldMatchModel:", *(_QWORD *)(a1 + 32));
  isInternalInstall = _isInternalInstall();
  if (v7)
  {
    if (isInternalInstall)
    {
      _RUILoggingFacility();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v22 = v6;
        _os_log_impl(&dword_209E87000, v9, OS_LOG_TYPE_DEFAULT, "Matched %@, starting processing...", buf, 0xCu);
      }

    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v6, "setObjectModel:", *(_QWORD *)(a1 + 32));
    v10 = *(void **)(a1 + 32);
    objc_msgSend(v10, "clientInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "elementForActivityIndicatorWithAttributes:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "startActivityIndicator");
    v13 = *(_QWORD *)(a1 + 32);
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __62__RUIServerHookHandler_processObjectModel_isModal_completion___block_invoke_34;
    v15[3] = &unk_24C297578;
    objc_copyWeak(&v20, (id *)(a1 + 56));
    v16 = v6;
    v17 = *(id *)(a1 + 32);
    v19 = *(id *)(a1 + 40);
    v14 = v12;
    v18 = v14;
    objc_msgSend(v16, "processObjectModel:completion:", v13, v15);
    if (a4)
      *a4 = 1;

    objc_destroyWeak(&v20);
LABEL_14:

    goto LABEL_15;
  }
  if (isInternalInstall)
  {
    _RUILoggingFacility();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v6;
      _os_log_impl(&dword_209E87000, v14, OS_LOG_TYPE_DEFAULT, "Did not match, skipping %@ ...", buf, 0xCu);
    }
    goto LABEL_14;
  }
LABEL_15:

}

void __62__RUIServerHookHandler_processObjectModel_isModal_completion___block_invoke_34(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id WeakRetained;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    v7 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "clientInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 40);
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __62__RUIServerHookHandler_processObjectModel_isModal_completion___block_invoke_2;
    v10[3] = &unk_24C297550;
    v12 = *(id *)(a1 + 56);
    v11 = *(id *)(a1 + 48);
    objc_msgSend(WeakRetained, "_handleResponseForHook:success:error:attributes:objectModel:completion:", v7, a2, v5, v8, v9, v10);

  }
}

uint64_t __62__RUIServerHookHandler_processObjectModel_isModal_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "stopActivityIndicator");
}

- (void)processServerResponse:(id)a3
{
  id v4;
  NSObject *v5;
  NSArray *serverHooks;
  id v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[16];

  v4 = a3;
  if (_isInternalInstall())
  {
    _RUILoggingFacility();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_209E87000, v5, OS_LOG_TYPE_DEFAULT, "Harvesting data from response", buf, 2u);
    }

  }
  serverHooks = self->_serverHooks;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __46__RUIServerHookHandler_processServerResponse___block_invoke;
  v8[3] = &unk_24C2975C8;
  v9 = v4;
  v7 = v4;
  -[NSArray enumerateObjectsUsingBlock:](serverHooks, "enumerateObjectsUsingBlock:", v8);

}

void __46__RUIServerHookHandler_processServerResponse___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "harvestDataFromResponse:", *(_QWORD *)(a1 + 32));

}

- (id)currentPresenter
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  uint8_t v8[16];

  WeakRetained = objc_loadWeakRetained((id *)&self->_remoteUIController);
  objc_msgSend(WeakRetained, "currentPresentationContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "userInterfaceIdiom");

    if (!v5)
    {
      if (_isInternalInstall())
      {
        _RUILoggingFacility();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v8 = 0;
          _os_log_impl(&dword_209E87000, v6, OS_LOG_TYPE_DEFAULT, "RUI nav controller detected, suppressing rotation views", v8, 2u);
        }

      }
      objc_msgSend(v3, "setSupportedInterfaceOrientations:", 2);
    }
  }

  return v3;
}

- (void)dismissObjectModelsAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id WeakRetained;
  id v7;
  id v8;

  v4 = a3;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_remoteUIController);
  v7 = (id)objc_msgSend(WeakRetained, "dismissObjectModelsAnimated:completion:", v4, v8);

}

- (BOOL)isUserCancelError:(id)a3
{
  RUIServerHookHandler *v3;
  RUIServerHookHandlerDelegate **p_delegate;
  id v5;
  id WeakRetained;

  if (!a3)
    return 0;
  v3 = self;
  p_delegate = &self->_delegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  LOBYTE(v3) = objc_msgSend(WeakRetained, "serverHookHandler:isUserCancelError:", v3, v5);

  return (char)v3;
}

- (id)_responseDataForResult:(BOOL)a3 withError:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;

  v4 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v6, "code"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("errorCode"));

    objc_msgSend(v6, "domain");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, CFSTR("errorDomain"));

    if (-[RUIServerHookHandler isUserCancelError:](self, "isUserCancelError:", v6))
      objc_msgSend(v7, "setObject:forKeyedSubscript:", CFSTR("cancel"), CFSTR("action"));
  }
  if (v4)
    v11 = CFSTR("1");
  else
    v11 = CFSTR("0");
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, CFSTR("success"));

  return v7;
}

- (void)refreshWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id WeakRetained;
  id v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (_isInternalInstall())
  {
    _RUILoggingFacility();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v6;
      _os_log_impl(&dword_209E87000, v8, OS_LOG_TYPE_DEFAULT, "Attempting to refresh with request: %@", buf, 0xCu);
    }

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_remoteUIController);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __54__RUIServerHookHandler_refreshWithRequest_completion___block_invoke;
  v11[3] = &unk_24C297618;
  v12 = v7;
  v10 = v7;
  objc_msgSend(WeakRetained, "loadRequest:completion:", v6, v11);

}

void __54__RUIServerHookHandler_refreshWithRequest_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  char v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (_isInternalInstall())
  {
    _RUILoggingFacility();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v5;
      _os_log_impl(&dword_209E87000, v6, OS_LOG_TYPE_DEFAULT, "Finished loading: %@", buf, 0xCu);
    }

  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__RUIServerHookHandler_refreshWithRequest_completion___block_invoke_46;
  block[3] = &unk_24C2975F0;
  v7 = *(id *)(a1 + 32);
  v12 = a2;
  v10 = v5;
  v11 = v7;
  v8 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __54__RUIServerHookHandler_refreshWithRequest_completion___block_invoke_46(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
  return result;
}

- (void)_reloadUIWithInfo:(id)a3 attributes:(id)a4 initiatingObjectModel:(id)a5 completion:(id)a6
{
  id v10;
  void *v11;
  NSObject *v12;
  _QWORD block[4];
  id v14;
  uint8_t buf[16];

  v10 = a6;
  -[RUIServerHookHandler _refreshRequestWithInfo:initiatingObjectModel:attributes:](self, "_refreshRequestWithInfo:initiatingObjectModel:attributes:", a3, a5, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[RUIServerHookHandler refreshWithRequest:completion:](self, "refreshWithRequest:completion:", v11, v10);
  }
  else
  {
    if (_isInternalInstall())
    {
      _RUILoggingFacility();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_209E87000, v12, OS_LOG_TYPE_DEFAULT, "No refresh URL; skipping reload", buf, 2u);
      }

    }
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __86__RUIServerHookHandler__reloadUIWithInfo_attributes_initiatingObjectModel_completion___block_invoke;
    block[3] = &unk_24C297640;
    v14 = v10;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
}

uint64_t __86__RUIServerHookHandler__reloadUIWithInfo_attributes_initiatingObjectModel_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, 1, 0);
  return result;
}

- (id)_refreshRequestWithInfo:(id)a3 initiatingObjectModel:(id)a4 attributes:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  int v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (_isInternalInstall())
  {
    _RUILoggingFacility();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v23 = 138412290;
      v24 = v9;
      _os_log_impl(&dword_209E87000, v10, OS_LOG_TYPE_DEFAULT, "Refreshing server UI with attributes %@", (uint8_t *)&v23, 0xCu);
    }

  }
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("refreshUrl"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("refreshHttpMethod"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v13 = objc_alloc(MEMORY[0x24BDD16B0]);
    v14 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(v8, "sourceURL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "URLWithString:relativeToURL:", v11, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v13, "initWithURL:", v16);

    if (objc_msgSend(v12, "isEqualToString:", CFSTR("POST")))
    {
      v18 = (void *)objc_msgSend(v7, "mutableCopy");
      objc_msgSend(v8, "serverInfo");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19)
        objc_msgSend(v18, "addEntriesFromDictionary:", v19);
      if (_isInternalInstall())
      {
        _RUILoggingFacility();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          v23 = 138412290;
          v24 = v18;
          _os_log_impl(&dword_209E87000, v20, OS_LOG_TYPE_DEFAULT, "Responding to server with info: %@", (uint8_t *)&v23, 0xCu);
        }

      }
      objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", v18, 100, 0, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setHTTPBody:", v21);
      objc_msgSend(v17, "setHTTPMethod:", CFSTR("POST"));
      objc_msgSend(v17, "setValue:forHTTPHeaderField:", CFSTR("application/x-plist"), CFSTR("Content-Type"));

    }
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (NSArray)serverHooks
{
  return self->_serverHooks;
}

- (RUIServerHookHandlerDelegate)delegate
{
  return (RUIServerHookHandlerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_serverHooks, 0);
  objc_destroyWeak((id *)&self->_remoteUIController);
  objc_storeStrong((id *)&self->_hookIdentifiers, 0);
}

@end
