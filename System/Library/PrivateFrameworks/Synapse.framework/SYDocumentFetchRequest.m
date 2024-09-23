@implementation SYDocumentFetchRequest

+ (void)fetchAllDocumentsMatchingAnyIndexIdWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[16];

  v4 = a3;
  v5 = os_log_create("com.apple.synapse", "DocumentWorkflows");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BCC38000, v5, OS_LOG_TYPE_INFO, "Fetching all documents matching any id", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@ = '*') && (kMDItemIsTrashed != 1)"), CFSTR("SYDocumentRelatedUniqueIdentifierKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __76__SYDocumentFetchRequest_fetchAllDocumentsMatchingAnyIndexIdWithCompletion___block_invoke;
  v8[3] = &unk_1E757B488;
  v9 = v4;
  v10 = a1;
  v7 = v4;
  objc_msgSend(a1, "_fetchDocumentsWithReason:queryString:completion:", CFSTR("Document Workflows: Fetch documents to update link state."), v6, v8);

}

void __76__SYDocumentFetchRequest_fetchAllDocumentsMatchingAnyIndexIdWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = *(void **)(a1 + 40);
  v6 = a3;
  objc_msgSend(v5, "_buildResultWithMatches:", a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

+ (void)fetchDocumentsWithIndexIds:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = os_log_create("com.apple.synapse", "DocumentWorkflows");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    v22 = v6;
    _os_log_impl(&dword_1BCC38000, v8, OS_LOG_TYPE_DEFAULT, "Fetching documents matching ids: %{private}@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __64__SYDocumentFetchRequest_fetchDocumentsWithIndexIds_completion___block_invoke;
  v18[3] = &unk_1E757B4B0;
  v19 = v9;
  v20 = v6;
  v11 = v6;
  v12 = v9;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v18);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(kMDItemIsTrashed != 1) && (%@)"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v10;
  v15[1] = 3221225472;
  v15[2] = __64__SYDocumentFetchRequest_fetchDocumentsWithIndexIds_completion___block_invoke_2;
  v15[3] = &unk_1E757B488;
  v16 = v7;
  v17 = a1;
  v14 = v7;
  objc_msgSend(a1, "_fetchDocumentsWithReason:queryString:completion:", CFSTR("Document Workflows: Fetch documents for unlinking."), v13, v15);

}

uint64_t __64__SYDocumentFetchRequest_fetchDocumentsWithIndexIds_completion___block_invoke(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("(%@ = '%@')"), CFSTR("SYDocumentRelatedUniqueIdentifierKey"), a2);
  result = objc_msgSend(*(id *)(a1 + 40), "count");
  if (result - 1 > a3)
    return objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR(" || "));
  return result;
}

void __64__SYDocumentFetchRequest_fetchDocumentsWithIndexIds_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = *(void **)(a1 + 40);
  v6 = a3;
  objc_msgSend(v5, "_buildResultWithMatches:", a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

+ (void)_fetchDocumentsWithReason:(id)a3 queryString:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  objc_class *v9;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  v9 = (objc_class *)MEMORY[0x1E0CA6B30];
  v10 = a3;
  v11 = objc_alloc_init(v9);
  objc_msgSend(v11, "setReason:", v10);

  v27[0] = CFSTR("SYDocumentRelatedUniqueIdentifierKey");
  v27[1] = CFSTR("kMDItemContentURL");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFetchAttributes:", v12);

  v13 = os_log_create("com.apple.synapse", "DocumentWorkflows");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    +[SYDocumentFetchRequest _fetchDocumentsWithReason:queryString:completion:].cold.1((uint64_t)v7, v13);

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6B28]), "initWithQueryString:context:", v7, v11);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __75__SYDocumentFetchRequest__fetchDocumentsWithReason_queryString_completion___block_invoke;
  v25[3] = &unk_1E757B4D8;
  v17 = v15;
  v26 = v17;
  objc_msgSend(v14, "setFoundItemsHandler:", v25);
  v21[0] = v16;
  v21[1] = 3221225472;
  v21[2] = __75__SYDocumentFetchRequest__fetchDocumentsWithReason_queryString_completion___block_invoke_2;
  v21[3] = &unk_1E757B500;
  v22 = v14;
  v23 = v17;
  v24 = v8;
  v18 = v8;
  v19 = v17;
  v20 = v14;
  objc_msgSend(v20, "setCompletionHandler:", v21);
  objc_msgSend(v20, "start");

}

uint64_t __75__SYDocumentFetchRequest__fetchDocumentsWithReason_queryString_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", a2);
}

void __75__SYDocumentFetchRequest__fetchDocumentsWithReason_queryString_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(id *)(a1 + 32);
  v5 = os_log_create("com.apple.synapse", "DocumentWorkflows");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = objc_msgSend(*(id *)(a1 + 40), "count");
    v7 = 134218242;
    v8 = v6;
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_1BCC38000, v5, OS_LOG_TYPE_INFO, "Query finished with matches count: %ld, error: %@", (uint8_t *)&v7, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

+ (id)_buildResultWithMatches:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  id v14;
  NSObject *v15;
  void *v16;
  SYDocumentFetchResult *v17;
  void *v18;
  __int128 v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  id v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v23;
    *(_QWORD *)&v8 = 138412546;
    v20 = v8;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(v6);
        v12 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v11);
        v21 = 0;
        v13 = objc_msgSend(a1, "_isSearchableItemValid:loggableErrorDescription:", v12, &v21, v20);
        v14 = v21;
        if ((v13 & 1) != 0)
        {
          objc_msgSend(a1, "_itemIdFromSearchableItem:", v12);
          v15 = objc_claimAutoreleasedReturnValue();
          +[SYDocumentFetchRequest _contentURLForItem:](SYDocumentFetchRequest, "_contentURLForItem:", v12);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = -[SYDocumentFetchResult initWithDocumentId:fileURL:]([SYDocumentFetchResult alloc], "initWithDocumentId:fileURL:", v15, v16);
          objc_msgSend(v5, "addObject:", v17);

        }
        else
        {
          v15 = os_log_create("com.apple.synapse", "DocumentWorkflows");
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v20;
            v27 = v12;
            v28 = 2112;
            v29 = v14;
            _os_log_impl(&dword_1BCC38000, v15, OS_LOG_TYPE_INFO, "Searchable item isn't valid: %@, error: %@", buf, 0x16u);
          }
        }

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v9);
  }

  v18 = (void *)objc_msgSend(v5, "copy");
  return v18;
}

+ (BOOL)_isSearchableItemValid:(id)a3 loggableErrorDescription:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  void *v14;
  void *v15;

  v6 = a3;
  objc_msgSend(v6, "attributeSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundleID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 && !objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.mobilemail")))
  {
    objc_msgSend(a1, "_itemIdFromSearchableItem:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[SYDocumentFetchRequest _contentURLForItem:](SYDocumentFetchRequest, "_contentURLForItem:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v10)
      v13 = v11 == 0;
    else
      v13 = 1;
    v9 = !v13;
    if (a4 && !v9)
    {
      v14 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v11, "path");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringWithFormat:", CFSTR("Skip invalid searchable with itemId: %@, contentURL: %@"), v10, v15);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Skip searchable item with bundle id: %@"), v8);
    v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)_itemIdFromSearchableItem:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (objc_class *)MEMORY[0x1E0CA6AC0];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithKeyName:", CFSTR("SYDocumentRelatedUniqueIdentifierKey"));
  objc_msgSend(v4, "attributeSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "valueForCustomKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)_contentURLForItem:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "attributeSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (void)_fetchDocumentsWithReason:(uint64_t)a1 queryString:(NSObject *)a2 completion:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1BCC38000, a2, OS_LOG_TYPE_DEBUG, "Query: %@", (uint8_t *)&v2, 0xCu);
}

@end
