@implementation WBSOnDeviceSearchSuggestionsProvider

- (WBSOnDeviceSearchSuggestionsProvider)init
{
  WBSOnDeviceSearchSuggestionsProvider *v2;
  WBSOnDeviceSearchSuggestionsProvider *v3;
  id v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *completionQueue;
  WBSOnDeviceSearchSuggestionsProvider *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WBSOnDeviceSearchSuggestionsProvider;
  v2 = -[WBSOnDeviceSearchSuggestionsProvider init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    -[WBSOnDeviceSearchSuggestionsProvider reloadModel](v2, "reloadModel");
    v3->_maximumNumberOfSuggestions = 5;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.Safari.Shared.%@.%p"), objc_opt_class(), v3);
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v5 = dispatch_queue_create((const char *)objc_msgSend(v4, "UTF8String"), 0);
    completionQueue = v3->_completionQueue;
    v3->_completionQueue = (OS_dispatch_queue *)v5;

    v3->_prefixLock._os_unfair_lock_opaque = 0;
    v7 = v3;
  }

  return v3;
}

- (id)_loadModel
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  WBSOnDeviceSearchSuggestionsModel *v6;

  +[WBSOnDeviceSearchSuggestionsModelManager sharedManager](WBSOnDeviceSearchSuggestionsModelManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileURLForModelWithLocaleIfDownloaded:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = -[WBSOnDeviceSearchSuggestionsModel initWithModelFileAtPath:]([WBSOnDeviceSearchSuggestionsModel alloc], "initWithModelFileAtPath:", v5);
  else
    v6 = 0;

  return v6;
}

- (void)reloadModel
{
  WBSOnDeviceSearchSuggestionsModel *v3;
  WBSOnDeviceSearchSuggestionsModel *searchModel;

  -[WBSOnDeviceSearchSuggestionsProvider _loadModel](self, "_loadModel");
  v3 = (WBSOnDeviceSearchSuggestionsModel *)objc_claimAutoreleasedReturnValue();
  searchModel = self->_searchModel;
  self->_searchModel = v3;

}

- (void)setQueryString:(id)a3
{
  id v5;
  NSObject *completionQueue;
  _QWORD v7[5];
  id v8;

  v5 = a3;
  os_unfair_lock_lock(&self->_prefixLock);
  if (-[NSString isEqualToString:](self->_currentPrefix, "isEqualToString:", v5))
  {
    os_unfair_lock_unlock(&self->_prefixLock);
  }
  else
  {
    objc_storeStrong((id *)&self->_currentPrefix, a3);
    completionQueue = self->_completionQueue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __55__WBSOnDeviceSearchSuggestionsProvider_setQueryString___block_invoke;
    v7[3] = &unk_1E4B2B448;
    v7[4] = self;
    v8 = v5;
    dispatch_async(completionQueue, v7);
    os_unfair_lock_unlock(&self->_prefixLock);

  }
}

void __55__WBSOnDeviceSearchSuggestionsProvider_setQueryString___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  __CFString *v4;
  void *v5;
  _QWORD v6[5];
  id v7;
  uint64_t v8;
  char v9;
  const __CFString *v10;
  _QWORD block[5];
  __CFString *v12;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 24));
  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "copy");
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 24));
  if (objc_msgSend(v2, "isEqualToString:", *(_QWORD *)(a1 + 40)) && objc_msgSend(v2, "length"))
  {
    v8 = 0x200000000;
    v9 = 0;
    v10 = &stru_1E4B40D18;
    if (objc_msgSend(*(id *)(a1 + 32), "_findRootNodeForPrefix:rootNode:", *(_QWORD *)(a1 + 40), &v8))
    {
      objc_msgSend(*(id *)(a1 + 32), "_doSearch:atRootNode:", *(_QWORD *)(a1 + 40), &v8);
    }
    else
    {
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __55__WBSOnDeviceSearchSuggestionsProvider_setQueryString___block_invoke_3;
      v6[3] = &unk_1E4B2B448;
      v5 = *(void **)(a1 + 40);
      v6[4] = *(_QWORD *)(a1 + 32);
      v7 = v5;
      dispatch_async(MEMORY[0x1E0C80D38], v6);

    }
    v4 = (__CFString *)v10;
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __55__WBSOnDeviceSearchSuggestionsProvider_setQueryString___block_invoke_2;
    block[3] = &unk_1E4B2B448;
    v3 = *(void **)(a1 + 40);
    block[4] = *(_QWORD *)(a1 + 32);
    v12 = v3;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    v4 = v12;
  }

}

void __55__WBSOnDeviceSearchSuggestionsProvider_setQueryString___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 48));
  objc_msgSend(WeakRetained, "onDeviceSearchSuggestionProvider:didFinishWithSuggestions:forQueryString:", *(_QWORD *)(a1 + 32), MEMORY[0x1E0C9AA60], *(_QWORD *)(a1 + 40));

}

void __55__WBSOnDeviceSearchSuggestionsProvider_setQueryString___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 48));
  objc_msgSend(WeakRetained, "onDeviceSearchSuggestionProvider:didFinishWithSuggestions:forQueryString:", *(_QWORD *)(a1 + 32), MEMORY[0x1E0C9AA60], *(_QWORD *)(a1 + 40));

}

- (BOOL)_findRootNodeForPrefix:(id)a3 rootNode:(_WBSSearchSuggestionCandidate *)a4
{
  id v6;
  id *p_var3;
  unint64_t v8;
  WBSOnDeviceSearchSuggestionsModel *searchModel;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  BOOL v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void **v19;

  v6 = a3;
  p_var3 = &a4->var3;
LABEL_2:
  v8 = objc_msgSend(*p_var3, "length");
  if (v8 >= objc_msgSend(v6, "length"))
  {
    v13 = objc_msgSend(*p_var3, "length");
    v14 = v13 >= objc_msgSend(v6, "length");
  }
  else
  {
    searchModel = self->_searchModel;
    if (searchModel)
    {
      -[WBSOnDeviceSearchSuggestionsModel readTreeNodeWithCandidate:](searchModel, "readTreeNodeWithCandidate:", a4);
      v10 = v16;
      v11 = v17;
      while (v10 != v11)
      {
        if (objc_msgSend(*(id *)(v10 + 16), "length")
          && ((objc_msgSend(v6, "hasPrefix:", *(_QWORD *)(v10 + 16)) & 1) != 0
           || objc_msgSend(*(id *)(v10 + 16), "hasPrefix:", v6)))
        {
          if (!*(_BYTE *)(v10 + 8)
            || (v12 = objc_msgSend(*(id *)(v10 + 16), "length"), v12 >= objc_msgSend(v6, "length")))
          {
            objc_storeStrong(&a4->var3, *(id *)(v10 + 16));
            a4->var2 = *(_BYTE *)(v10 + 8);
            a4->var1 = *(_DWORD *)(v10 + 4);
            v19 = (void **)&v16;
            std::vector<_WBSSearchSuggestionCandidate>::__destroy_vector::operator()[abi:sn180100](&v19);
            goto LABEL_2;
          }
        }
        v10 += 24;
      }
    }
    else
    {
      v16 = 0;
      v17 = 0;
      v18 = 0;
    }
    v19 = (void **)&v16;
    std::vector<_WBSSearchSuggestionCandidate>::__destroy_vector::operator()[abi:sn180100](&v19);
    v14 = 0;
  }

  return v14;
}

- (void)_doSearch:(id)a3 atRootNode:(_WBSSearchSuggestionCandidate *)a4
{
  id v6;
  void (**v7)(_QWORD, _QWORD);
  uint64_t *v8;
  uint64_t i;
  _QWORD *v10;
  unint64_t v11;
  char v12;
  WBSOnDeviceSearchSuggestionsModel *searchModel;
  unsigned int v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t maximumNumberOfSuggestions;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  id v27;
  _QWORD block[5];
  id v29;
  id v30;
  _OWORD v31[2];
  unint64_t v32;
  uint64_t v33;
  _OWORD v34[2];
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  id v39;
  _OWORD v40[2];
  unint64_t v41;
  uint64_t v42;
  _OWORD v43[2];
  unint64_t v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;
  char v50;
  id v51;
  uint64_t v52;
  BOOL var2;
  id v54;
  _QWORD v55[6];
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  double (*v59)(_QWORD *, _QWORD *);
  void (*v60)(uint64_t);
  void *v61;
  _QWORD v62[6];
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  double (*v66)(_QWORD *, _QWORD *);
  void (*v67)(uint64_t);
  void *v68;
  _QWORD v69[6];
  void **v70;

  v6 = a3;
  v63 = 0;
  v64 = &v63;
  v65 = 0x6012000000;
  v66 = __Block_byref_object_copy__29;
  v67 = __Block_byref_object_dispose__29;
  v68 = &unk_1A3FCC9DF;
  memset(v69, 0, sizeof(v69));
  v56 = 0;
  v57 = &v56;
  v58 = 0x6012000000;
  v59 = __Block_byref_object_copy__29;
  v60 = __Block_byref_object_dispose__29;
  v61 = &unk_1A3FCC9DF;
  memset(v62, 0, sizeof(v62));
  v55[0] = MEMORY[0x1E0C809B0];
  v55[1] = 3221225472;
  v55[2] = __61__WBSOnDeviceSearchSuggestionsProvider__doSearch_atRootNode___block_invoke;
  v55[3] = &unk_1E4B3D4A0;
  v55[4] = &v63;
  v55[5] = &v56;
  v7 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A8599ED0](v55);
  v52 = *(_QWORD *)&a4->var0;
  var2 = a4->var2;
  v54 = a4->var3;
  ((void (**)(_QWORD, uint64_t *))v7)[2](v7, &v52);
  v8 = v57;
  for (i = v57[11]; i; i = v57[11])
  {
    v10 = v8 + 6;
    v11 = *(_QWORD *)(v8[7] + 8 * ((i + v8[10] - 1) / 0xAAuLL)) + 24 * ((i + v8[10] - 1) % 0xAAuLL);
    v12 = *(_BYTE *)(v11 + 8);
    v49 = *(_QWORD *)v11;
    v50 = v12;
    v51 = *(id *)(v11 + 16);
    std::deque<_WBSSearchSuggestionCandidate>::pop_back(v10);
    searchModel = self->_searchModel;
    if (searchModel)
    {
      -[WBSOnDeviceSearchSuggestionsModel readTreeNodeWithCandidate:](searchModel, "readTreeNodeWithCandidate:", &v49);
    }
    else
    {
      v46 = 0;
      v47 = 0;
      v48 = 0;
    }
    std::deque<_WBSSearchSuggestionCandidate>::deque(v43, v64 + 6);
    std::deque<_WBSSearchSuggestionCandidate>::deque(v40, v57 + 6);
    if (v45)
      v14 = *(_DWORD *)(*(_QWORD *)(*((_QWORD *)&v43[0] + 1) + 8 * (v44 / 0xAA)) + 24 * (v44 % 0xAA));
    else
      v14 = -1;
    if (v42 && *(_DWORD *)(*(_QWORD *)(*((_QWORD *)&v40[0] + 1) + 8 * (v41 / 0xAA)) + 24 * (v41 % 0xAA)) < v14)
      v14 = *(_DWORD *)(*(_QWORD *)(*((_QWORD *)&v40[0] + 1) + 8 * (v41 / 0xAA)) + 24 * (v41 % 0xAA));
    std::deque<_WBSSearchSuggestionCandidate>::~deque[abi:sn180100](v40);
    std::deque<_WBSSearchSuggestionCandidate>::~deque[abi:sn180100](v43);
    v15 = v46;
    v16 = v47;
    while (v15 != v16)
    {
      if (*(_DWORD *)v15 > v14
        || (v17 = v64,
            v18 = v64[11],
            v19 = v57,
            v20 = v57[11],
            v21 = v20 + v18,
            maximumNumberOfSuggestions = self->_maximumNumberOfSuggestions,
            v20 + v18 < maximumNumberOfSuggestions))
      {
        v23 = *v15;
        v38 = *((_BYTE *)v15 + 8);
        v37 = v23;
        v39 = (id)v15[2];
        ((void (**)(_QWORD, uint64_t *))v7)[2](v7, &v37);
        v17 = v64;
        v18 = v64[11];
        v19 = v57;
        v20 = v57[11];
        maximumNumberOfSuggestions = self->_maximumNumberOfSuggestions;
        v21 = v20 + v18;
      }
      if (v21 > maximumNumberOfSuggestions)
      {
        v24 = (uint64_t)(v19 + 6);
        if (v18
          && (!v20
           || *(_DWORD *)(*(_QWORD *)(v17[7] + 8 * (v17[10] / 0xAAuLL)) + 24 * (v17[10] % 0xAAuLL)) <= *(_DWORD *)(*(_QWORD *)(v19[7] + 8 * (v19[10] / 0xAAuLL)) + 24 * (v19[10] % 0xAAuLL))))
        {
          v24 = (uint64_t)(v17 + 6);
        }
        std::deque<_WBSSearchSuggestionCandidate>::pop_front(v24);
        v17 = v64;
      }
      std::deque<_WBSSearchSuggestionCandidate>::deque(v34, v17 + 6);
      std::deque<_WBSSearchSuggestionCandidate>::deque(v31, v57 + 6);
      if (v36)
        v14 = *(_DWORD *)(*(_QWORD *)(*((_QWORD *)&v34[0] + 1) + 8 * (v35 / 0xAA)) + 24 * (v35 % 0xAA));
      else
        v14 = -1;
      if (v33)
      {
        if (*(_DWORD *)(*(_QWORD *)(*((_QWORD *)&v31[0] + 1) + 8 * (v32 / 0xAA)) + 24 * (v32 % 0xAA)) < v14)
          v14 = *(_DWORD *)(*(_QWORD *)(*((_QWORD *)&v31[0] + 1) + 8 * (v32 / 0xAA)) + 24 * (v32 % 0xAA));
      }
      std::deque<_WBSSearchSuggestionCandidate>::~deque[abi:sn180100](v31);
      std::deque<_WBSSearchSuggestionCandidate>::~deque[abi:sn180100](v34);
      v15 += 3;
    }
    v70 = (void **)&v46;
    std::vector<_WBSSearchSuggestionCandidate>::__destroy_vector::operator()[abi:sn180100](&v70);

    v8 = v57;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  while (v64[11])
  {
    objc_msgSend(v25, "addObject:", *(_QWORD *)(*(_QWORD *)(v64[7] + 8 * (v64[10] / 0xAAuLL)) + 24 * (v64[10] % 0xAAuLL) + 16));
    std::deque<_WBSSearchSuggestionCandidate>::pop_front((uint64_t)(v64 + 6));
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__WBSOnDeviceSearchSuggestionsProvider__doSearch_atRootNode___block_invoke_3;
  block[3] = &unk_1E4B2B2A8;
  block[4] = self;
  v29 = v25;
  v30 = v6;
  v26 = v25;
  v27 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  _Block_object_dispose(&v56, 8);
  std::deque<_WBSSearchSuggestionCandidate>::~deque[abi:sn180100](v62);
  _Block_object_dispose(&v63, 8);
  std::deque<_WBSSearchSuggestionCandidate>::~deque[abi:sn180100](v69);
}

void __61__WBSOnDeviceSearchSuggestionsProvider__doSearch_atRootNode___block_invoke(uint64_t a1, unint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  unsigned int v7;
  unint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unsigned int *v16;
  uint64_t v17;
  uint64_t v18;

  if (*(_BYTE *)(a2 + 8))
    v3 = *(_QWORD *)(a1 + 32);
  else
    v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(v3 + 8);
  v5 = (_QWORD *)(v4 + 48);
  v6 = *(_QWORD *)(v4 + 88);
  if (v6
    && (v7 = *(_DWORD *)a2,
        v8 = v5[4],
        v9 = v5[1],
        *(_DWORD *)a2 <= *(_DWORD *)(*(_QWORD *)(v9 + 8 * ((v6 + v8 - 1) / 0xAA)) + 24 * ((v6 + v8 - 1) % 0xAA))))
  {
    v10 = (_QWORD *)(v9 + 8 * (v8 / 0xAA));
    v11 = v5[2];
    if (v11 == v9)
      v12 = 0;
    else
      v12 = *v10 + 24 * (v8 % 0xAA);
    v13 = v8 + v6;
    v14 = v13 / 0xAA;
    v15 = v13 % 0xAA;
LABEL_11:
    v16 = (unsigned int *)v12;
    while (1)
    {
      v17 = v11 == v9 ? 0 : *(_QWORD *)(v9 + 8 * v14) + 24 * v15;
      if (v16 == (unsigned int *)v17 || v7 <= *v16)
        break;
      v16 += 6;
      v12 += 24;
      if (*v10 + 4080 == v12)
      {
        v18 = v10[1];
        ++v10;
        v12 = v18;
        goto LABEL_11;
      }
    }
    std::deque<_WBSSearchSuggestionCandidate>::insert((uint64_t)v5, v10, v12, a2);
  }
  else
  {
    std::deque<_WBSSearchSuggestionCandidate>::push_back((uint64_t)v5, (uint64_t *)a2);
  }

}

void __61__WBSOnDeviceSearchSuggestionsProvider__doSearch_atRootNode___block_invoke_3(_QWORD *a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 48));
  objc_msgSend(WeakRetained, "onDeviceSearchSuggestionProvider:didFinishWithSuggestions:forQueryString:", a1[4], a1[5], a1[6]);

}

- (unint64_t)maximumNumberOfSuggestions
{
  return self->_maximumNumberOfSuggestions;
}

- (void)setMaximumNumberOfSuggestions:(unint64_t)a3
{
  self->_maximumNumberOfSuggestions = a3;
}

- (WBSOnDeviceSearchSuggestionsProviderDelegate)delegate
{
  return (WBSOnDeviceSearchSuggestionsProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentPrefix, 0);
  objc_storeStrong((id *)&self->_completionQueue, 0);
  objc_storeStrong((id *)&self->_searchModel, 0);
}

@end
