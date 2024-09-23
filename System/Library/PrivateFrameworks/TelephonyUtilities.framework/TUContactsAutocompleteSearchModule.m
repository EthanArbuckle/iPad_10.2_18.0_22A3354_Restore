@implementation TUContactsAutocompleteSearchModule

- (TUContactsAutocompleteSearchModule)init
{
  TUContactsAutocompleteSearchModule *v2;
  TUAutocompleteResultPartitioner *v3;
  TUAutocompleteResultPartitioner *autocompleteResultPartitioner;
  void *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *queue;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TUContactsAutocompleteSearchModule;
  v2 = -[TUContactsAutocompleteSearchModule init](&v9, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(TUAutocompleteResultPartitioner);
    autocompleteResultPartitioner = v2->_autocompleteResultPartitioner;
    v2->_autocompleteResultPartitioner = v3;

    -[TUContactsAutocompleteSearchModule searchController](v2, "searchController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUAutocompleteResultPartitioner setSearchController:](v2->_autocompleteResultPartitioner, "setSearchController:", v5);

    v6 = dispatch_queue_create("com.apple.telephonyutilities.autocompletesearchmodule", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v6;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[TUContactsAutocompleteSearchModule _cleanup](self, "_cleanup");
  v3.receiver = self;
  v3.super_class = (Class)TUContactsAutocompleteSearchModule;
  -[TUContactsAutocompleteSearchModule dealloc](&v3, sel_dealloc);
}

- (void)_cleanup
{
  id v2;

  -[TUContactsAutocompleteSearchModule fetchRequest](self, "fetchRequest");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancel");

}

- (void)searchForString:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[TUContactsAutocompleteSearchModule queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__TUContactsAutocompleteSearchModule_searchForString_completion___block_invoke;
  block[3] = &unk_1E38A2B10;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

void __65__TUContactsAutocompleteSearchModule_searchForString_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  void (*v9)(void);
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint8_t buf[16];

  objc_msgSend(*(id *)(a1 + 32), "_cleanup");
  objc_msgSend(*(id *)(a1 + 32), "setCompletion:", *(_QWORD *)(a1 + 48));
  v2 = (void *)CUTWeakLinkClass();
  v3 = CUTWeakLinkClass();
  v4 = CUTWeakLinkClass();
  if (v2 && v3 && (v5 = (objc_class *)v4) != 0)
  {
    objc_msgSend(v2, "request");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSearchString:", *(_QWORD *)(a1 + 40));
    objc_msgSend(v6, "setSearchType:", 2);
    objc_msgSend(v6, "setIncludeContacts:", 1);
    objc_msgSend(v6, "setIncludeRecents:", 0);
    objc_msgSend(v6, "setIncludeSuggestions:", 1);
    objc_msgSend(v6, "setIncludePredictions:", 1);
    objc_msgSend(v6, "setIncludeDirectoryServers:", 0);
    objc_msgSend(v6, "setIncludeCalendarServers:", 0);
    v7 = (void *)objc_opt_new();
    if (kAppIDShareBear_block_invoke__pred_IMPreferredAccountForServiceIMCore != -1)
      dispatch_once(&kAppIDShareBear_block_invoke__pred_IMPreferredAccountForServiceIMCore, &__block_literal_global_53);
    v8 = (void *)CUTWeakLinkClass();
    v9 = (void (*)(void))kAppIDShareBear_block_invoke__IMPreferredAccountForService;
    objc_msgSend(v8, "facetimeService");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9();
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v11, "uniqueID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setSendingAddressAccountIdentifier:", v12);

    }
    objc_msgSend(v6, "setFetchContext:", v7);
    v13 = (void *)objc_msgSend([v5 alloc], "initWithDelegate:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 32), "setAutocompleteStore:", v13);

    TUDefaultLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19A50D000, v14, OS_LOG_TYPE_DEFAULT, "Requesting fetch from CNAutocompleteStore", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "autocompleteStore");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "scheduleFetchRequest:", v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setFetchRequest:", v16);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "completion");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(*(id *)(a1 + 32), "completion");
      v18 = (id)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, _QWORD))v18 + 2))(v18, *(_QWORD *)(a1 + 32), 0);

    }
  }
}

void *__65__TUContactsAutocompleteSearchModule_searchForString_completion___block_invoke_2()
{
  void *result;

  result = (void *)CUTWeakLinkSymbol();
  kAppIDShareBear_block_invoke__IMPreferredAccountForService = result;
  return result;
}

- (void)cancelSearch
{
  NSObject *v3;
  _QWORD block[5];

  -[TUContactsAutocompleteSearchModule queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__TUContactsAutocompleteSearchModule_cancelSearch__block_invoke;
  block[3] = &unk_1E38A1360;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __50__TUContactsAutocompleteSearchModule_cancelSearch__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setCancelled:", 1);
  return objc_msgSend(*(id *)(a1 + 32), "_cleanup");
}

- (TUSearchResults)searchResults
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__13;
  v11 = __Block_byref_object_dispose__13;
  v12 = 0;
  -[TUContactsAutocompleteSearchModule queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__TUContactsAutocompleteSearchModule_searchResults__block_invoke;
  v6[3] = &unk_1E38A1CE8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (TUSearchResults *)v4;
}

void __51__TUContactsAutocompleteSearchModule_searchResults__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "autocompleteResultPartitioner");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "searchResults");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)autocompleteFetch:(id)a3 didReceiveResults:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[TUContactsAutocompleteSearchModule queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__TUContactsAutocompleteSearchModule_autocompleteFetch_didReceiveResults___block_invoke;
  block[3] = &unk_1E38A19B8;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

void __74__TUContactsAutocompleteSearchModule_autocompleteFetch_didReceiveResults___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  TUAutocompleteResultPartitioner *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  void *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "autocompleteFetch:didReceiveResults:", buf, 2u);
  }

  if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) != 0)
  {
    TUDefaultLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 32), "fetchRequest");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v21 = v4;
      v22 = 2112;
      v23 = v5;
      _os_log_impl(&dword_19A50D000, v3, OS_LOG_TYPE_DEFAULT, "[WARN] ZOMBIE FETCH %@ did receive results but current search is %@", buf, 0x16u);

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "autocompleteResultPartitioner");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v7 = objc_alloc_init(TUAutocompleteResultPartitioner);
      objc_msgSend(*(id *)(a1 + 32), "setAutocompleteResultPartitioner:", v7);

      objc_msgSend(*(id *)(a1 + 32), "searchController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "autocompleteResultPartitioner");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setSearchController:", v8);

    }
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v3 = *(id *)(a1 + 40);
    v10 = -[NSObject countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v17;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(v3);
          v14 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v13);
          objc_msgSend(*(id *)(a1 + 32), "autocompleteResultPartitioner", (_QWORD)v16);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addResult:", v14);

          ++v13;
        }
        while (v11 != v13);
        v11 = -[NSObject countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
      }
      while (v11);
    }
  }

}

- (void)autocompleteFetch:(id)a3 didFailWithError:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  TUContactsAutocompleteSearchModule *v10;

  v5 = a4;
  -[TUContactsAutocompleteSearchModule queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __73__TUContactsAutocompleteSearchModule_autocompleteFetch_didFailWithError___block_invoke;
  v8[3] = &unk_1E38A1388;
  v9 = v5;
  v10 = self;
  v7 = v5;
  dispatch_async(v6, v8);

}

uint64_t __73__TUContactsAutocompleteSearchModule_autocompleteFetch_didFailWithError___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;
  void *v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);

  TUDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __73__TUContactsAutocompleteSearchModule_autocompleteFetch_didFailWithError___block_invoke_cold_1(a1, v2);

  result = objc_msgSend(*(id *)(a1 + 40), "isCancelled");
  if ((result & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "setSearchComplete:", 1);
    objc_msgSend(*(id *)(a1 + 40), "completion");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 40), "completion");
      v5 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v5[2](v5, *(_QWORD *)(a1 + 40), 0);

    }
    return objc_msgSend(*(id *)(a1 + 40), "_cleanup");
  }
  return result;
}

- (void)autocompleteFetchDidFinish:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[TUContactsAutocompleteSearchModule queue](self, "queue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__TUContactsAutocompleteSearchModule_autocompleteFetchDidFinish___block_invoke;
  block[3] = &unk_1E38A1360;
  block[4] = self;
  dispatch_async(v4, block);

}

void __65__TUContactsAutocompleteSearchModule_autocompleteFetchDidFinish___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void (**v4)(_QWORD, _QWORD, _QWORD);
  uint8_t v5[16];

  TUDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "autocompleteFetchDidFinish:", v5, 2u);
  }

  if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "setSearchComplete:", 1);
    objc_msgSend(*(id *)(a1 + 32), "completion");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      objc_msgSend(*(id *)(a1 + 32), "completion");
      v4 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v4[2](v4, *(_QWORD *)(a1 + 32), 1);

    }
  }
}

- (TUSearchController)searchController
{
  return (TUSearchController *)objc_loadWeakRetained((id *)&self->_searchController);
}

- (void)setSearchController:(id)a3
{
  objc_storeWeak((id *)&self->_searchController, a3);
}

- (CNAutocompleteStore)autocompleteStore
{
  return self->_autocompleteStore;
}

- (void)setAutocompleteStore:(id)a3
{
  objc_storeStrong((id *)&self->_autocompleteStore, a3);
}

- (CNAutocompleteCancelable)fetchRequest
{
  return self->_fetchRequest;
}

- (void)setFetchRequest:(id)a3
{
  objc_storeStrong((id *)&self->_fetchRequest, a3);
}

- (TUAutocompleteResultPartitioner)autocompleteResultPartitioner
{
  return self->_autocompleteResultPartitioner;
}

- (void)setAutocompleteResultPartitioner:(id)a3
{
  objc_storeStrong((id *)&self->_autocompleteResultPartitioner, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)isSearchComplete
{
  return self->_searchComplete;
}

- (void)setSearchComplete:(BOOL)a3
{
  self->_searchComplete = a3;
}

- (BOOL)isCancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_autocompleteResultPartitioner, 0);
  objc_storeStrong((id *)&self->_fetchRequest, 0);
  objc_storeStrong((id *)&self->_autocompleteStore, 0);
  objc_destroyWeak((id *)&self->_searchController);
}

void __73__TUContactsAutocompleteSearchModule_autocompleteFetch_didFailWithError___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_19A50D000, a2, OS_LOG_TYPE_ERROR, "autocompleteFetch:didFailWithError: %@", (uint8_t *)&v3, 0xCu);
}

@end
