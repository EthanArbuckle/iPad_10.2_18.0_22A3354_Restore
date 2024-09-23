@implementation WBSSearchHelperConnectionManager

+ (id)sharedManager
{
  WBSSearchHelperConnectionManager *v2;

  {
    v2 = (WBSSearchHelperConnectionManager *)+[WBSSearchHelperConnectionManager sharedManager]::manager;
  }
  else
  {
    v2 = objc_alloc_init(WBSSearchHelperConnectionManager);
    +[WBSSearchHelperConnectionManager sharedManager]::manager = (uint64_t)v2;
  }
  return v2;
}

- (WBSSearchHelperConnectionManager)init
{
  WBSSearchHelperConnectionManager *v2;
  uint64_t v3;
  NSMutableSet *clients;
  WBSSearchHelperConnectionManager *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WBSSearchHelperConnectionManager;
  v2 = -[WBSSearchHelperConnectionManager init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v3 = objc_claimAutoreleasedReturnValue();
    clients = v2->_clients;
    v2->_clients = (NSMutableSet *)v3;

    v5 = v2;
  }

  return v2;
}

- (id)searchHelperConnectionRequestedByClient:(id)a3
{
  NSXPCConnection *searchHelperConnection;
  NSXPCConnection *v6;
  NSXPCConnection *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSXPCConnection *v13;
  _QWORD v14[4];
  id v15;
  id location;
  _QWORD v17[5];

  v17[4] = *MEMORY[0x1E0C80C00];
  -[NSMutableSet addObject:](self->_clients, "addObject:", a3);
  searchHelperConnection = self->_searchHelperConnection;
  if (searchHelperConnection)
    return searchHelperConnection;
  objc_initWeak(&location, self);
  v6 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithServiceName:", CFSTR("com.apple.Safari.SearchHelper"));
  v7 = self->_searchHelperConnection;
  self->_searchHelperConnection = v6;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE73D478);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0C99E60];
  v17[0] = objc_opt_class();
  v17[1] = objc_opt_class();
  v17[2] = objc_opt_class();
  v17[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_fetchOpenSearchDescriptionWithURL_completionHandler_, 0, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_updateSuggestionsRequestWithSearchTerms_suggestionsURLTemplate_userAgentString_completionHandler_, 0, 1);

  -[NSXPCConnection setRemoteObjectInterface:](self->_searchHelperConnection, "setRemoteObjectInterface:", v8);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __76__WBSSearchHelperConnectionManager_searchHelperConnectionRequestedByClient___block_invoke;
  v14[3] = &unk_1E4B2C008;
  objc_copyWeak(&v15, &location);
  -[NSXPCConnection setInvalidationHandler:](self->_searchHelperConnection, "setInvalidationHandler:", v14);
  -[NSXPCConnection resume](self->_searchHelperConnection, "resume");
  v13 = self->_searchHelperConnection;
  objc_destroyWeak(&v15);

  objc_destroyWeak(&location);
  return v13;
}

void __76__WBSSearchHelperConnectionManager_searchHelperConnectionRequestedByClient___block_invoke(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__WBSSearchHelperConnectionManager_searchHelperConnectionRequestedByClient___block_invoke_2;
  block[3] = &unk_1E4B2C008;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v2);
}

void __76__WBSSearchHelperConnectionManager_searchHelperConnectionRequestedByClient___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setSearchHelperConnection:", 0);

}

- (void)removeClient:(id)a3
{
  id v4;

  v4 = a3;
  -[NSMutableSet removeObject:](self->_clients, "removeObject:");
  if (!-[NSMutableSet count](self->_clients, "count"))
    -[NSXPCConnection invalidate](self->_searchHelperConnection, "invalidate");

}

- (NSXPCConnection)searchHelperConnection
{
  return self->_searchHelperConnection;
}

- (void)setSearchHelperConnection:(id)a3
{
  objc_storeStrong((id *)&self->_searchHelperConnection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchHelperConnection, 0);
  objc_storeStrong((id *)&self->_clients, 0);
}

@end
