@implementation WBSSiriIntelligenceHistorySearch

- (void)dealloc
{
  objc_super v3;

  -[CSSearchQuery cancel](self->_searchQuery, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)WBSSiriIntelligenceHistorySearch;
  -[WBSSiriIntelligenceHistorySearch dealloc](&v3, sel_dealloc);
}

- (void)findURLStringsForHistoryItemsContainingString:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  CSSearchQuery *searchQuery;
  CSSearchQuery *v9;
  void *v10;
  id v11;
  CSSearchQuery *v12;
  CSSearchQuery *v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  _QWORD *v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id location;
  _QWORD v22[5];
  id v23;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "length"))
  {
    searchQuery = self->_searchQuery;
    if (searchQuery)
    {
      -[CSSearchQuery cancel](searchQuery, "cancel");
      v9 = self->_searchQuery;
      self->_searchQuery = 0;

    }
    v22[0] = 0;
    v22[1] = v22;
    v22[2] = 0x3032000000;
    v22[3] = __Block_byref_object_copy__19;
    v22[4] = __Block_byref_object_dispose__19;
    v23 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("textContent == \"%@*\"cd && contentType == \"%@\"), v6, *MEMORY[0x1E0D8A730]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_alloc_init(MEMORY[0x1E0CA6B30]);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v11, "setPrivateQuery:", 1);
    objc_msgSend(v11, "setFetchAttributes:", &unk_1E547C210);
    v12 = (CSSearchQuery *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6B28]), "initWithQueryString:queryContext:", v10, v11);
    v13 = self->_searchQuery;
    self->_searchQuery = v12;

    objc_initWeak(&location, self->_searchQuery);
    v14 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __100__WBSSiriIntelligenceHistorySearch_findURLStringsForHistoryItemsContainingString_completionHandler___block_invoke;
    v19[3] = &unk_1E5445D08;
    objc_copyWeak(&v20, &location);
    v19[4] = v22;
    -[CSSearchQuery setFoundItemsHandler:](self->_searchQuery, "setFoundItemsHandler:", v19);
    v15[0] = v14;
    v15[1] = 3221225472;
    v15[2] = __100__WBSSiriIntelligenceHistorySearch_findURLStringsForHistoryItemsContainingString_completionHandler___block_invoke_3;
    v15[3] = &unk_1E5445D30;
    objc_copyWeak(&v18, &location);
    v16 = v7;
    v17 = v22;
    -[CSSearchQuery setCompletionHandler:](self->_searchQuery, "setCompletionHandler:", v15);
    -[CSSearchQuery start](self->_searchQuery, "start");

    objc_destroyWeak(&v18);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);

    _Block_object_dispose(v22, 8);
  }
  else
  {
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

void __100__WBSSiriIntelligenceHistorySearch_findURLStringsForHistoryItemsContainingString_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[5];

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained && (objc_msgSend(WeakRetained, "isCancelled") & 1) == 0)
  {
    v5 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    objc_sync_enter(v5);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __100__WBSSiriIntelligenceHistorySearch_findURLStringsForHistoryItemsContainingString_completionHandler___block_invoke_2;
    v7[3] = &unk_1E5445CE0;
    v7[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v7);
    objc_sync_exit(v5);

  }
}

void __100__WBSSiriIntelligenceHistorySearch_findURLStringsForHistoryItemsContainingString_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a2, "attributeSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "absoluteString");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v6;
  if (v6)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v6);
    v5 = v6;
  }

}

void __100__WBSSiriIntelligenceHistorySearch_findURLStringsForHistoryItemsContainingString_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (v7 || !WeakRetained || objc_msgSend(WeakRetained, "isCancelled"))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v4 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    objc_sync_enter(v4);
    v5 = *(_QWORD *)(a1 + 32);
    v6 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "copy");
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);

    objc_sync_exit(v4);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchQuery, 0);
}

@end
