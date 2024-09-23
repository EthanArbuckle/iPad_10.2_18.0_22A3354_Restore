@implementation SYDocumentAttributesFetchRequest

+ (void)fetchAttributesForDocumentsWithIndexKeys:(id)a3 completion:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *);
  void *v24;
  id v25;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (objc_class *)MEMORY[0x1E0C99E40];
  v8 = a3;
  v9 = (void *)objc_msgSend([v7 alloc], "initWithArray:", v8);

  v10 = objc_alloc_init(MEMORY[0x1E0CA6B30]);
  objc_msgSend(v10, "setFetchAttributes:", &unk_1E758F1C0);
  objc_msgSend(v10, "setReason:", CFSTR("Document Workflows: Get attachment info for document with index key"));
  objc_msgSend(v9, "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_buildQueryStringWithIndexKeys:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = os_log_create("com.apple.synapse", "DocumentWorkflows");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    +[SYDocumentFetchRequest _fetchDocumentsWithReason:queryString:completion:].cold.1((uint64_t)v12, v13);

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6B28]), "initWithQueryString:context:", v12, v10);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v14, "setPrivateQuery:", 1);
  v30[0] = CFSTR("com.apple.mobilemail");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setBundleIDs:", v15);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __88__SYDocumentAttributesFetchRequest_fetchAttributesForDocumentsWithIndexKeys_completion___block_invoke;
  v28[3] = &unk_1E757B4D8;
  v18 = v16;
  v29 = v18;
  objc_msgSend(v14, "setFoundItemsHandler:", v28);
  v21 = v17;
  v22 = 3221225472;
  v23 = __88__SYDocumentAttributesFetchRequest_fetchAttributesForDocumentsWithIndexKeys_completion___block_invoke_2;
  v24 = &unk_1E757C620;
  v26 = v6;
  v27 = a1;
  v25 = v18;
  v19 = v6;
  v20 = v18;
  objc_msgSend(v14, "setCompletionHandler:", &v21);
  objc_msgSend(v14, "start", v21, v22, v23, v24);

}

uint64_t __88__SYDocumentAttributesFetchRequest_fetchAttributesForDocumentsWithIndexKeys_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", a2);
}

void __88__SYDocumentAttributesFetchRequest_fetchAttributesForDocumentsWithIndexKeys_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if (v4)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "_buildResultWithMatches:", *(_QWORD *)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

+ (id)_buildQueryStringWithIndexKeys:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v5 = 0;
    do
    {
      objc_msgSend(v3, "objectAtIndex:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appendFormat:", CFSTR("(kMDItemRelatedUniqueIdentifier == '%@')"), v6);
      if (v5 < objc_msgSend(v3, "count") - 1)
        objc_msgSend(v4, "appendFormat:", CFSTR(" || "));

      ++v5;
    }
    while (v5 < objc_msgSend(v3, "count"));
  }
  v7 = (void *)MEMORY[0x1E0CB3940];
  v8 = (void *)objc_msgSend(v4, "copy");
  objc_msgSend(v7, "stringWithFormat:", CFSTR("(kMDItemIsTrashed != 1) && (%@)"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)_buildResultWithMatches:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  char v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  __CFString *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  __CFString *v21;
  __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  __CFString *v28;
  __CFString *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  __CFString *v34;
  __CFString *v35;
  void *v36;
  void *v37;
  void *v38;
  SYDocumentSender *v39;
  SYDocumentAttributes *v40;
  void *v41;
  void *v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  id obj;
  id v48;
  void *v49;
  uint8_t v50;
  _BYTE v51[7];
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint8_t buf[4];
  void *v58;
  __int16 v59;
  void *v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  obj = v4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v54;
    v44 = *(_QWORD *)v54;
    v45 = a1;
    do
    {
      v8 = 0;
      v46 = v6;
      do
      {
        if (*(_QWORD *)v54 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * v8);
        v52 = 0;
        v10 = objc_msgSend(a1, "_isValidSearchableItem:loggableErrorDescription:", v9, &v52);
        v11 = v52;
        v12 = v11;
        if ((v10 & 1) != 0)
        {
          v48 = v11;
          objc_msgSend(v9, "attributeSet");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "bundleID");
          v14 = objc_claimAutoreleasedReturnValue();
          v15 = (void *)v14;
          if (v14)
            v16 = (__CFString *)v14;
          else
            v16 = &stru_1E757CA18;
          v17 = v16;

          objc_msgSend(v9, "attributeSet");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "relatedUniqueIdentifier");
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = (void *)v19;
          if (v19)
            v21 = (__CFString *)v19;
          else
            v21 = &stru_1E757CA18;
          v22 = v21;

          objc_msgSend(v9, "attributeSet");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "contentURL");
          v49 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v9, "attributeSet");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "userSharedReceivedSender");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "firstObject");
          v26 = objc_claimAutoreleasedReturnValue();
          v27 = (void *)v26;
          if (v26)
            v28 = (__CFString *)v26;
          else
            v28 = &stru_1E757CA18;
          v29 = v28;

          objc_msgSend(v9, "attributeSet");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "userSharedReceivedSenderHandle");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "firstObject");
          v32 = objc_claimAutoreleasedReturnValue();
          v33 = (void *)v32;
          if (v32)
            v34 = (__CFString *)v32;
          else
            v34 = &stru_1E757CA18;
          v35 = v34;

          objc_msgSend(v9, "attributeSet");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "userSharedReceivedDate");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "firstObject");
          v38 = (void *)objc_claimAutoreleasedReturnValue();

          if (v38)
          {
            v39 = -[SYDocumentSender initWithName:handle:]([SYDocumentSender alloc], "initWithName:handle:", v29, v35);
            v40 = -[SYDocumentAttributes initWithSourceBundleIdentifier:indexKey:originalFileURL:receivedDate:sender:]([SYDocumentAttributes alloc], "initWithSourceBundleIdentifier:indexKey:originalFileURL:receivedDate:sender:", v17, v22, v49, v38, v39);
            objc_msgSend(v43, "addObject:", v40);

          }
          else
          {
            v39 = (SYDocumentSender *)os_log_create("com.apple.synapse", "DocumentWorkflows");
            if (os_log_type_enabled(&v39->super, OS_LOG_TYPE_ERROR))
              +[SYDocumentAttributesFetchRequest _buildResultWithMatches:].cold.1(&v50, v51, &v39->super);
          }
          v7 = v44;
          a1 = v45;
          v12 = v48;

          v6 = v46;
        }
        else
        {
          v17 = os_log_create("com.apple.synapse", "DocumentWorkflows");
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v58 = v9;
            v59 = 2112;
            v60 = v12;
            _os_log_error_impl(&dword_1BCC38000, v17, OS_LOG_TYPE_ERROR, "Searchable item isn't valid: %@, error: %@", buf, 0x16u);
          }
        }

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
    }
    while (v6);
  }

  v41 = (void *)objc_msgSend(v43, "copy");
  return v41;
}

+ (BOOL)_isValidSearchableItem:(id)a3 loggableErrorDescription:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  BOOL v16;
  __CFString *v17;
  const __CFString *v18;

  v5 = a3;
  objc_msgSend(v5, "attributeSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v5, "attributeSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "contentTypeTree");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "count"))
    {
      if (+[SYDocumentWorkflows isSupportedContentTypeTree:](SYDocumentWorkflows, "isSupportedContentTypeTree:", v9))
      {
        objc_msgSend(v5, "attributeSet");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "userSharedReceivedSender");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "count");

        if (v12)
        {
          objc_msgSend(v5, "attributeSet");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "userSharedReceivedSenderHandle");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "count");
          v16 = v15 != 0;

          if (!a4 || v15)
            goto LABEL_19;
          v17 = CFSTR("Searchable item doesn't have sender handle info.");
          goto LABEL_15;
        }
        if (a4)
        {
          v17 = CFSTR("Searchable item doesn't have sender info.");
          goto LABEL_15;
        }
LABEL_18:
        v16 = 0;
        goto LABEL_19;
      }
      if (!a4)
        goto LABEL_18;
      v18 = CFSTR("Searchable item isn't a supported content type, found: %@");
    }
    else
    {
      if (!a4)
        goto LABEL_18;
      v18 = CFSTR("Searchable item doesn't have a valid content type, found: %@");
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v18, v9);
    v17 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
LABEL_15:
    v16 = 0;
    *a4 = v17;
LABEL_19:

    goto LABEL_20;
  }
  v16 = 0;
  if (a4)
    *a4 = CFSTR("Searchable item doesn't have a file.");
LABEL_20:

  return v16;
}

+ (void)_buildResultWithMatches:(os_log_t)log .cold.1(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1BCC38000, log, OS_LOG_TYPE_ERROR, "Searchable item doesn't have a valid received date.", buf, 2u);
}

@end
