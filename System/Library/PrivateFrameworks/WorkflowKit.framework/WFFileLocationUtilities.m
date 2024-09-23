@implementation WFFileLocationUtilities

+ (void)fetchItemWithIdentifier:(id)a3 domainIdentifier:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v9 = a4;
  v10 = a5;
  if (v16)
  {
    if (v9)
      goto LABEL_3;
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFFileLocationUtilities.m"), 52, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("domainIdentifier"));

    if (v10)
      goto LABEL_4;
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFFileLocationUtilities.m"), 53, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFFileLocationUtilities.m"), 51, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("itemIdentifier"));

  if (!v9)
    goto LABEL_6;
LABEL_3:
  if (!v10)
    goto LABEL_7;
LABEL_4:
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CAAC70]), "initWithProviderDomainID:itemIdentifier:", v9, v16);
  objc_msgSend(MEMORY[0x1E0CAAC80], "defaultManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "fetchItemForItemID:completionHandler:", v11, v10);

}

+ (id)fetchRootItemURLForDomainWithID:(id)a3
{
  id v3;
  dispatch_semaphore_t v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  dispatch_time_t v9;
  void *v10;
  id v11;
  NSObject *v12;
  _QWORD v14[4];
  NSObject *v15;
  NSObject *v16;
  uint64_t *v17;
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    v4 = dispatch_semaphore_create(0);
    v19 = 0;
    v20 = &v19;
    v21 = 0x3032000000;
    v22 = __Block_byref_object_copy__5997;
    v23 = __Block_byref_object_dispose__5998;
    v24 = 0;
    v18 = 0;
    objc_msgSend(MEMORY[0x1E0CAACA8], "providerDomainWithID:error:", v3, &v18);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v18;
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CAAC80], "defaultManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __59__WFFileLocationUtilities_fetchRootItemURLForDomainWithID___block_invoke;
      v14[3] = &unk_1E7AEBDD0;
      v15 = v5;
      v17 = &v19;
      v8 = v4;
      v16 = v8;
      objc_msgSend(v7, "fetchRootItemForProviderDomain:completionHandler:", v15, v14);

      v9 = dispatch_time(0, 3000000000);
      dispatch_semaphore_wait(v8, v9);
      v10 = (void *)v20[5];
      if (v10)
        v11 = v10;

      v12 = v15;
    }
    else
    {
      getWFFilesLogObject();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315650;
        v26 = "+[WFFileLocationUtilities fetchRootItemURLForDomainWithID:]";
        v27 = 2112;
        v28 = v3;
        v29 = 2112;
        v30 = v6;
        _os_log_impl(&dword_1C15B3000, v12, OS_LOG_TYPE_FAULT, "%s Could not fetch provider domain: %@ with error: %@", buf, 0x20u);
      }
      v10 = 0;
    }

    _Block_object_dispose(&v19, 8);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)parentItemsForItem:(id)a3
{
  id v3;
  dispatch_semaphore_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD v10[4];
  NSObject *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v3 = a3;
  v4 = dispatch_semaphore_create(0);
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__5997;
  v17 = __Block_byref_object_dispose__5998;
  v18 = 0;
  objc_msgSend(MEMORY[0x1E0CAAC80], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "itemID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __46__WFFileLocationUtilities_parentItemsForItem___block_invoke;
  v10[3] = &unk_1E7AEBDF8;
  v12 = &v13;
  v7 = v4;
  v11 = v7;
  objc_msgSend(v5, "fetchParentsForItemID:recursively:completionHandler:", v6, 1, v10);

  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

+ (id)rootItemForItem:(id)a3
{
  id v3;
  void *v4;
  id v5;
  dispatch_semaphore_t v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD v11[4];
  NSObject *v12;
  _BYTE *v13;
  id v14;
  _BYTE buf[24];
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v14 = 0;
  objc_msgSend(MEMORY[0x1E0CAACA8], "providerDomainForItem:error:", v3, &v14);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v14;
  if (v4)
  {
    v6 = dispatch_semaphore_create(0);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v16 = __Block_byref_object_copy__5997;
    v17 = __Block_byref_object_dispose__5998;
    v18 = 0;
    objc_msgSend(MEMORY[0x1E0CAAC80], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __43__WFFileLocationUtilities_rootItemForItem___block_invoke;
    v11[3] = &unk_1E7AF26C0;
    v13 = buf;
    v8 = v6;
    v12 = v8;
    objc_msgSend(v7, "fetchRootItemForProviderDomain:completionHandler:", v4, v11);

    dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
    v9 = *(id *)(*(_QWORD *)&buf[8] + 40);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    getWFFilesLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "+[WFFileLocationUtilities rootItemForItem:]";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v5;
      _os_log_impl(&dword_1C15B3000, v8, OS_LOG_TYPE_ERROR, "%s Could not get domain with error: %@", buf, 0x16u);
    }
    v9 = 0;
  }

  return v9;
}

+ (id)itemForURL:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = (void *)MEMORY[0x1E0CAAC80];
  v6 = a3;
  objc_msgSend(v5, "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "itemForURL:error:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)bundleIdentifierForItem:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v3 = a3;
  objc_msgSend(v3, "fp_appContainerBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    objc_msgSend(v3, "fp_appContainerBundleIdentifier");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x3032000000;
    v13 = __Block_byref_object_copy__5997;
    v14 = __Block_byref_object_dispose__5998;
    v15 = 0;
    +[WFFileLocationUtilities parentItemsForItem:](WFFileLocationUtilities, "parentItemsForItem:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __51__WFFileLocationUtilities_bundleIdentifierForItem___block_invoke;
    v9[3] = &unk_1E7AEBE20;
    v9[4] = &v10;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v9);
    v6 = (id)v11[5];

    _Block_object_dispose(&v10, 8);
  }

  return v6;
}

+ (id)documentsURLForApplicationContainerBundleID:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)MEMORY[0x1E0CA5870];
  v4 = a3;
  v10 = 0;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithBundleIdentifier:allowPlaceholder:error:", v4, 0, &v10);

  v6 = v10;
  if (v5)
  {
    objc_msgSend(v5, "dataContainerURL");
    v7 = objc_claimAutoreleasedReturnValue();
    -[NSObject URLByAppendingPathComponent:](v7, "URLByAppendingPathComponent:", CFSTR("Documents"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    getWFFilesLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v12 = "+[WFFileLocationUtilities documentsURLForApplicationContainerBundleID:]";
      v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_1C15B3000, v7, OS_LOG_TYPE_ERROR, "%s Could not get application record with error: %@", buf, 0x16u);
    }
    v8 = 0;
  }

  return v8;
}

+ (id)cloudDocsURL
{
  NSObject *v2;
  int v4;
  const char *v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (cloudDocsURL_onceToken != -1)
    dispatch_once(&cloudDocsURL_onceToken, &__block_literal_global_32);
  getWFFilesLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v4 = 136315394;
    v5 = "+[WFFileLocationUtilities cloudDocsURL]";
    v6 = 2112;
    v7 = cloudDocsURL_URL;
    _os_log_impl(&dword_1C15B3000, v2, OS_LOG_TYPE_DEBUG, "%s Got cloud docs url %@", (uint8_t *)&v4, 0x16u);
  }

  return (id)cloudDocsURL_URL;
}

+ (id)desktopDirectory
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(a1, "iCloudDesktopDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "wf_fileExists"))
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

+ (id)iCloudDesktopDirectory
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a1, "cloudDocsURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("com~apple~CloudDocs/Desktop/"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "wf_fileExists"))
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

+ (id)documentsDirectory
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(a1, "iCloudDocumentsDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "wf_fileExists"))
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

+ (id)iCloudDocumentsDirectory
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a1, "cloudDocsURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("com~apple~CloudDocs/Documents/"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "wf_fileExists"))
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

+ (id)downloadsDirectory
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(a1, "iCloudDownloadsDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "wf_fileExists"))
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

+ (id)iCloudDownloadsDirectory
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a1, "cloudDocsURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("com~apple~CloudDocs/Downloads/"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "wf_fileExists"))
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

+ (id)mobileDocumentsDirectory
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(a1, "cloudDocsURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "wf_fileExists"))
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

+ (BOOL)isFileURL:(id)a3 withParentItems:(id)a4 insideFolderType:(unint64_t)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  char v11;
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  v10 = 2;
  if (a5 == 1)
    v10 = 3;
  if (a5 == 2)
    v10 = 4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __70__WFFileLocationUtilities_isFileURL_withParentItems_insideFolderType___block_invoke;
  v13[3] = &unk_1E7AEBEA8;
  v13[4] = &v14;
  v13[5] = v10;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v13);
  v11 = *((_BYTE *)v15 + 24);
  _Block_object_dispose(&v14, 8);

  return v11;
}

uint64_t __70__WFFileLocationUtilities_isFileURL_withParentItems_insideFolderType___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "folderType");
  if (result == *(_QWORD *)(a1 + 40))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

uint64_t __39__WFFileLocationUtilities_cloudDocsURL__block_invoke()
{
  return BRGetCloudDocsRootURL();
}

void __39__WFFileLocationUtilities_cloudDocsURL__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  if (!v4)
  {
    getWFFilesLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = 136315394;
      v9 = "+[WFFileLocationUtilities cloudDocsURL]_block_invoke_2";
      v10 = 2112;
      v11 = v5;
      _os_log_impl(&dword_1C15B3000, v6, OS_LOG_TYPE_ERROR, "%s Could not get url with error: %@", (uint8_t *)&v8, 0x16u);
    }

  }
  v7 = (void *)cloudDocsURL_URL;
  cloudDocsURL_URL = (uint64_t)v4;

}

void __51__WFFileLocationUtilities_bundleIdentifierForItem___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "fp_appContainerBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v10, "fp_appContainerBundleIdentifier");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    *a4 = 1;
  }

}

void __43__WFFileLocationUtilities_rootItemForItem___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __46__WFFileLocationUtilities_parentItemsForItem___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!v5)
  {
    getWFFilesLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v11 = 136315394;
      v12 = "+[WFFileLocationUtilities parentItemsForItem:]_block_invoke";
      v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_1C15B3000, v7, OS_LOG_TYPE_ERROR, "%s Could not fetch parent items due to error: %@", (uint8_t *)&v11, 0x16u);
    }

  }
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v5;
  v10 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __59__WFFileLocationUtilities_fetchRootItemURLForDomainWithID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!v5)
  {
    getWFFilesLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v12 = 136315650;
      v13 = "+[WFFileLocationUtilities fetchRootItemURLForDomainWithID:]_block_invoke";
      v14 = 2112;
      v15 = v8;
      v16 = 2112;
      v17 = v6;
      _os_log_impl(&dword_1C15B3000, v7, OS_LOG_TYPE_ERROR, "%s Could not fetch root item for providerDomain: %@ error: %@", (uint8_t *)&v12, 0x20u);
    }

  }
  objc_msgSend(v5, "fileURL");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

@end
