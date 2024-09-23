@implementation SYLastModifiedDocumentFetchRequest

+ (void)fetchLastModifiedDocument:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *);
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  uint8_t buf[4];
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = os_log_create("com.apple.synapse", "DocumentWorkflows");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v31 = v6;
    _os_log_impl(&dword_1BCC38000, v8, OS_LOG_TYPE_INFO, "Fetching last modified document attributes for document with index key: %@", buf, 0xCu);
  }

  objc_msgSend(a1, "_buildQueryStringWithDocumentRelatedUniqueIdentifier:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = os_log_create("com.apple.synapse", "DocumentWorkflows");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    +[SYDocumentFetchRequest _fetchDocumentsWithReason:queryString:completion:].cold.1((uint64_t)v9, v10);

  objc_msgSend(a1, "_createSearchQueryWithString:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __75__SYLastModifiedDocumentFetchRequest_fetchLastModifiedDocument_completion___block_invoke;
  v28[3] = &unk_1E757B4D8;
  v14 = v12;
  v29 = v14;
  objc_msgSend(v11, "setFoundItemsHandler:", v28);
  v19 = v13;
  v20 = 3221225472;
  v21 = __75__SYLastModifiedDocumentFetchRequest_fetchLastModifiedDocument_completion___block_invoke_2;
  v22 = &unk_1E757C6B8;
  v23 = v11;
  v24 = v14;
  v26 = v7;
  v27 = a1;
  v25 = v6;
  v15 = v7;
  v16 = v6;
  v17 = v14;
  v18 = v11;
  objc_msgSend(v18, "setCompletionHandler:", &v19);
  objc_msgSend(v18, "start", v19, v20, v21, v22);

}

uint64_t __75__SYLastModifiedDocumentFetchRequest_fetchLastModifiedDocument_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", a2);
}

void __75__SYLastModifiedDocumentFetchRequest_fetchLastModifiedDocument_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(id *)(a1 + 32);
  v5 = os_log_create("com.apple.synapse", "DocumentWorkflows");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = objc_msgSend(*(id *)(a1 + 40), "count");
    v7 = *(_QWORD *)(a1 + 48);
    v11 = 134218498;
    v12 = v6;
    v13 = 2112;
    v14 = v7;
    v15 = 2112;
    v16 = v3;
    _os_log_impl(&dword_1BCC38000, v5, OS_LOG_TYPE_INFO, "Found %ld matching document(s) with index key: %@, error: %@", (uint8_t *)&v11, 0x20u);
  }

  objc_msgSend(*(id *)(a1 + 64), "_buildResultWithMatches:", *(_QWORD *)(a1 + 40));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sortedArrayUsingComparator:", &__block_literal_global_16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "lastObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

uint64_t __75__SYLastModifiedDocumentFetchRequest_fetchLastModifiedDocument_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "modifiedDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "modifiedDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

+ (id)_createSearchQueryWithString:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v9[5];

  v9[4] = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)MEMORY[0x1E0CA6B30];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  v9[0] = CFSTR("SYDocumentRelatedUniqueIdentifierKey");
  v9[1] = CFSTR("kMDItemContentURL");
  v9[2] = CFSTR("kMDItemContentCreationDate");
  v9[3] = CFSTR("kMDItemContentModificationDate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFetchAttributes:", v6);

  objc_msgSend(v5, "setReason:", CFSTR("Document Workflows: Get last modified document"));
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6B28]), "initWithQueryString:context:", v4, v5);

  return v7;
}

+ (id)_buildQueryStringWithDocumentRelatedUniqueIdentifier:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(kMDItemIsTrashed != 1) && (%@ == '%@')"), CFSTR("SYDocumentRelatedUniqueIdentifierKey"), a3);
}

+ (id)_buildResultWithMatches:(id)a3
{
  id v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  int v17;
  BOOL v18;
  int v19;
  NSObject *v20;
  void *v21;
  SYLastModifiedDocumentAttributes *v22;
  void *v23;
  __int128 v25;
  void *v26;
  id obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  int v39;
  __int16 v40;
  int v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v42, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v29;
    *(_QWORD *)&v5 = 138478851;
    v25 = v5;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v29 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        +[SYDocumentFetchRequest _contentURLForItem:](SYDocumentFetchRequest, "_contentURLForItem:", v9, v25);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "attributeSet");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "contentCreationDate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "attributeSet");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "contentModificationDate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        v15 = v10;
        if (objc_msgSend(v15, "isFileURL"))
        {
          objc_msgSend(v15, "pathExtension");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "hasPrefix:", CFSTR("sb-"));

        }
        else
        {
          v17 = 0;
        }

        if (v15)
          v18 = v14 == 0;
        else
          v18 = 1;
        if (v18)
        {
          v19 = 0;
        }
        else if (objc_msgSend(v12, "compare:", v14))
        {
          v19 = v17 ^ 1;
        }
        else
        {
          v19 = 0;
        }
        v20 = os_log_create("com.apple.synapse", "DocumentWorkflows");
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v15, "path");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v25;
          v33 = v21;
          v34 = 2113;
          v35 = v12;
          v36 = 2113;
          v37 = v14;
          v38 = 1024;
          v39 = v17;
          v40 = 1024;
          v41 = v19;
          _os_log_impl(&dword_1BCC38000, v20, OS_LOG_TYPE_INFO, "Found searchable item with contentURL: %{private}@, creationDate: %{private}@, lastModifiedDate: %{private}@, isAutosaveFileURL: %{BOOL}d, isValid: %{BOOL}d", buf, 0x2Cu);

        }
        if (v19)
        {
          v22 = -[SYLastModifiedDocumentAttributes initWithFileURL:modifiedDate:]([SYLastModifiedDocumentAttributes alloc], "initWithFileURL:modifiedDate:", v15, v14);
          objc_msgSend(v26, "addObject:", v22);

        }
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v42, 16);
    }
    while (v6);
  }

  v23 = (void *)objc_msgSend(v26, "copy");
  return v23;
}

@end
