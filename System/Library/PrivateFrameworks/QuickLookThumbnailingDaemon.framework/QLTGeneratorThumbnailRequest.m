@implementation QLTGeneratorThumbnailRequest

- (void)setClientApplicationIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diskStore, 0);
  objc_storeStrong((id *)&self->_requestBadgeType, 0);
  objc_storeStrong(&self->_downloadCompletionHandler, 0);
  objc_storeStrong((id *)&self->_allowedTypesForGeneration, 0);
  objc_storeStrong((id *)&self->_clientApplicationIdentifier, 0);
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_taggedLogicalURL, 0);
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_topActivity, 0);
  objc_storeStrong((id *)&self->_generationHandler, 0);
  objc_storeStrong((id *)&self->_generationError, 0);
  objc_storeStrong((id *)&self->_batchDispatchGroup, 0);
  objc_storeStrong((id *)&self->_generator, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

- (BOOL)needsLowQualityThumbnailGeneration
{
  int v3;

  v3 = -[QLThumbnailGenerationRequest provideLowQualityThumbnail](self->_request, "provideLowQualityThumbnail");
  if (v3)
    LOBYTE(v3) = self->_handledRequestedTypes == *MEMORY[0x1E0CD3370];
  return v3;
}

- (void)_adjustRequestInformationIfNeeded
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  int v8;

  self->_badgeType = 0;
  if (-[QLThumbnailGenerationRequest badgeType](self->_request, "badgeType") == 1)
  {
    -[QLThumbnailGenerationRequest contentType](self->_request, "contentType");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "conformsToType:", *MEMORY[0x1E0CEC620]))
    {

    }
    else
    {
      -[QLThumbnailGenerationRequest contentType](self->_request, "contentType");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "conformsToType:", *MEMORY[0x1E0CEC5D0]);

      if (!v5)
        return;
    }
    +[QLThumbnailExtensionMonitor shared](QLThumbnailExtensionMonitor, "shared");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bestExtensionFor:", self->_request);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "supportsInteractiveThumbnailBadges");

    if (v8)
      self->_badgeType = -[QLThumbnailGenerationRequest badgeType](self->_request, "badgeType");
  }
}

- (OS_os_activity)activity
{
  return (OS_os_activity *)objc_getProperty(self, a2, 88, 1);
}

- (QLThumbnailGenerationRequest)request
{
  return self->_request;
}

- (BOOL)cancelled
{
  return self->_cancelled;
}

- (BOOL)hasHandledAllRequestedTypesOrMostRepresentativeType
{
  QLThumbnailGenerationRequestRepresentationTypes v3;
  unint64_t handledRequestedTypes;
  char v6;
  void *v7;
  BOOL v8;

  v3 = -[QLThumbnailGenerationRequest representationTypes](self->_request, "representationTypes") & 6;
  handledRequestedTypes = self->_handledRequestedTypes;
  v6 = handledRequestedTypes >= v3 || v3 < 2 * handledRequestedTypes;
  -[QLTGeneratorThumbnailRequest request](self, "request");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "provideCachedResultsOnly"))
  {
    v8 = -[QLTGeneratorThumbnailRequest didCheckCache](self, "didCheckCache");

    v6 |= v8;
  }
  else
  {

  }
  if (handledRequestedTypes == v3)
    return 1;
  else
    return v6;
}

- (OS_os_activity)topActivity
{
  return (OS_os_activity *)objc_getProperty(self, a2, 80, 1);
}

- (void)setActivity:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (void)setDidCheckCache:(BOOL)a3
{
  self->_didCheckCache = a3;
}

- (unint64_t)badgeType
{
  return self->_badgeType;
}

- (void)addTypeToHandledTypes:(int64_t)a3
{
  unint64_t handledRequestedTypes;

  handledRequestedTypes = self->_handledRequestedTypes;
  self->_handledRequestedTypes = -[QLTGeneratorThumbnailRequest _requestedTypesForRepresentationType:](self, "_requestedTypesForRepresentationType:", a3) | handledRequestedTypes;
}

- (unint64_t)_requestedTypesForRepresentationType:(int64_t)a3
{
  unint64_t v3;

  v3 = 1;
  if (a3 == 1)
    v3 = 2;
  if (a3 == 2)
    return 4;
  else
    return v3;
}

- (void)addTypeToSuccessfullyHandledTypes:(int64_t)a3
{
  unint64_t successfullyHandldedRequestedTypes;

  successfullyHandldedRequestedTypes = self->_successfullyHandldedRequestedTypes;
  self->_successfullyHandldedRequestedTypes = -[QLTGeneratorThumbnailRequest _requestedTypesForRepresentationType:](self, "_requestedTypesForRepresentationType:", a3) | successfullyHandldedRequestedTypes;
}

- (void)setTopActivity:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (void)setBatchDispatchGroup:(id)a3
{
  objc_storeStrong((id *)&self->_batchDispatchGroup, a3);
}

- (BOOL)cacheEnabled
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[QLTGeneratorThumbnailRequest diskStore](self, "diskStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return (-[QLThumbnailGenerationRequest isDataBased](self->_request, "isDataBased") & 1) == 0;
  -[QLTGeneratorThumbnailRequest request](self, "request");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isFileBased"))
  {
    -[QLTGeneratorThumbnailRequest diskStore](self, "diskStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "hasThumbnailCache");

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (QLDiskStore)diskStore
{
  return (QLDiskStore *)objc_getProperty(self, a2, 144, 1);
}

- (OS_dispatch_group)batchDispatchGroup
{
  return self->_batchDispatchGroup;
}

- (QLIncrementalThumbnailGenerationHandler)generationHandler
{
  return self->_generationHandler;
}

- (QLTGeneratorThumbnailRequest)initWithRequest:(id)a3 generationHandler:(id)a4
{
  id v7;
  id v8;
  QLTGeneratorThumbnailRequest *v9;
  QLTGeneratorThumbnailRequest *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  QLDiskStore *diskStore;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)QLTGeneratorThumbnailRequest;
  v9 = -[QLTGeneratorThumbnailRequest init](&v17, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_request, a3);
    objc_storeStrong((id *)&v10->_generationHandler, a4);
    v10->_handledRequestedTypes = *MEMORY[0x1E0CD3370];
    objc_msgSend(v7, "quicklookSandboxWrapper");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "url");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = objc_msgSend(v12, "startAccessingSecurityScopedResource");
      +[QLDiskStore diskStoreForURL:](QLDiskStore, "diskStoreForURL:", v12);
      v14 = objc_claimAutoreleasedReturnValue();
      diskStore = v10->_diskStore;
      v10->_diskStore = (QLDiskStore *)v14;

      if (v13)
        objc_msgSend(v12, "stopAccessingSecurityScopedResource");
    }
    -[QLTGeneratorThumbnailRequest _adjustRequestInformationIfNeeded](v10, "_adjustRequestInformationIfNeeded");

  }
  return v10;
}

- (void)fetchFPItemWithCompletionHandler:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  void (**v18)(id, _QWORD);

  v4 = (void (**)(id, _QWORD))a3;
  -[QLTGeneratorThumbnailRequest item](self, "item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    goto LABEL_4;
  -[QLTGeneratorThumbnailRequest request](self, "request");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "item");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[QLTGeneratorThumbnailRequest request](self, "request");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    objc_msgSend(v8, "item");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLTGeneratorThumbnailRequest setItem:](self, "setItem:", v10);

LABEL_4:
    v4[2](v4, 0);
    goto LABEL_5;
  }
  if (objc_msgSend(v8, "isDataBased"))
    -[QLTGeneratorThumbnailRequest fetchFPItemWithCompletionHandler:].cold.1();

  -[QLTGeneratorThumbnailRequest taggedLogicalURL](self, "taggedLogicalURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    -[QLTGeneratorThumbnailRequest request](self, "request");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "quicklookSandboxWrapper");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "url");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLTGeneratorThumbnailRequest setTaggedLogicalURL:](self, "setTaggedLogicalURL:", v14);

  }
  objc_msgSend(MEMORY[0x1E0CAAC80], "defaultManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLTGeneratorThumbnailRequest taggedLogicalURL](self, "taggedLogicalURL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __65__QLTGeneratorThumbnailRequest_fetchFPItemWithCompletionHandler___block_invoke;
  v17[3] = &unk_1E99D31A0;
  v17[4] = self;
  v18 = v4;
  objc_msgSend(v15, "fetchItemForURL:completionHandler:", v16, v17);

LABEL_5:
}

void __75__QLTGeneratorThumbnailRequest_computeUbiquitousnessWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void (*v3)(void);
  id *v4;
  void *v5;
  int v6;
  id v7;
  void *v8;
  char v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  _BOOL8 v19;
  NSObject *v20;
  id v21;
  id v22;
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v3 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
LABEL_5:
    v3();
    return;
  }
  v4 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "taggedLogicalURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_QLIsDataLess");

  v7 = *v4;
  if (v6)
  {
    objc_msgSend(v7, "setIsDownloaded:", 0);
    objc_msgSend(*(id *)(a1 + 32), "setIsDownloadedKnown:", 1);
    objc_msgSend(*(id *)(a1 + 32), "setIsUbiquitous:", 1);
    objc_msgSend(*(id *)(a1 + 32), "setIsUbiquitousKnown:", 1);
    v3 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    goto LABEL_5;
  }
  objc_msgSend(v7, "setIsDownloaded:", 1);
  objc_msgSend(*v4, "setIsDownloadedKnown:", 1);
  objc_msgSend(*v4, "taggedLogicalURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v9 = objc_msgSend(v8, "_QLIsThumbnailableWithError:", &v22);
  v10 = v22;

  if ((v9 & 1) != 0)
  {
    objc_msgSend(*v4, "taggedLogicalURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *MEMORY[0x1E0C99B00];
    v13 = *MEMORY[0x1E0C99A38];
    v23[0] = *MEMORY[0x1E0C99B00];
    v23[1] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    objc_msgSend(v11, "promisedItemResourceValuesForKeys:error:", v14, &v21);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v21;

    if (v15)
    {
      objc_msgSend(v15, "objectForKeyedSubscript:", v12);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKeyedSubscript:", v13);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*v4, "setIsUbiquitous:", objc_msgSend(v18, "BOOLValue"));
      objc_msgSend(*v4, "setIsUbiquitousKnown:", 1);
      v19 = !objc_msgSend(v18, "BOOLValue")
         || v17 && (objc_msgSend(v17, "isEqualToString:", *MEMORY[0x1E0C99B08]) & 1) == 0;
      objc_msgSend(*(id *)(a1 + 32), "setIsDownloadedKnown:", 1);
      objc_msgSend(*(id *)(a1 + 32), "setIsDownloaded:", v19);
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

    }
    else
    {
      _log_6();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        __75__QLTGeneratorThumbnailRequest_computeUbiquitousnessWithCompletionHandler___block_invoke_2_cold_1((id *)(a1 + 32), (uint64_t)v16, v20);

      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (NSURL)taggedLogicalURL
{
  return (NSURL *)objc_getProperty(self, a2, 96, 1);
}

- (void)setIsDownloadedKnown:(BOOL)a3
{
  self->_isDownloadedKnown = a3;
}

- (void)setIsDownloaded:(BOOL)a3
{
  self->_isDownloaded = a3;
}

void __65__QLTGeneratorThumbnailRequest_fetchFPItemWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _log_6();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __65__QLTGeneratorThumbnailRequest_fetchFPItemWithCompletionHandler___block_invoke_cold_1(a1, (uint64_t)v6, v7);

  }
  objc_msgSend(*(id *)(a1 + 32), "setItem:", v5);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (BOOL)shouldGenerateLowQualityThumbnailOnCacheMiss
{
  return 0;
}

- (void)setTaggedLogicalURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (void)setItem:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (void)setIsUbiquitousKnown:(BOOL)a3
{
  self->_isUbiquitousKnown = a3;
}

- (void)setIsUbiquitous:(BOOL)a3
{
  self->_isUbiquitous = a3;
}

- (void)setGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_generator, a3);
}

- (void)setGenerationError:(id)a3
{
  objc_storeStrong((id *)&self->_generationError, a3);
}

- (FPItem)item
{
  return (FPItem *)objc_getProperty(self, a2, 104, 1);
}

- (BOOL)isUbiquitous
{
  return self->_isUbiquitous;
}

- (BOOL)isDownloaded
{
  return self->_isDownloaded;
}

- (void)fetchURLWithCompletionHandler:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[5];
  void (**v24)(id, _QWORD);

  v4 = (void (**)(id, _QWORD))a3;
  -[QLTGeneratorThumbnailRequest request](self, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isDataBased");

  if (v6)
    goto LABEL_4;
  -[QLTGeneratorThumbnailRequest request](self, "request");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "quicklookSandboxWrapper");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[QLTGeneratorThumbnailRequest request](self, "request");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
  {
    objc_msgSend(v9, "quicklookSandboxWrapper");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "url");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLTGeneratorThumbnailRequest setTaggedLogicalURL:](self, "setTaggedLogicalURL:", v12);

LABEL_4:
    v4[2](v4, 0);
    goto LABEL_5;
  }
  objc_msgSend(v9, "item");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0CAAC80], "defaultManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLTGeneratorThumbnailRequest request](self, "request");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "item");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __62__QLTGeneratorThumbnailRequest_fetchURLWithCompletionHandler___block_invoke;
    v23[3] = &unk_1E99D3178;
    v23[4] = self;
    v24 = v4;
    objc_msgSend(v14, "fetchURLForItem:completionHandler:", v16, v23);

  }
  else
  {
    _log_6();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[QLTGeneratorThumbnailRequest fetchURLWithCompletionHandler:].cold.2((uint64_t)self, v17);

    -[QLTGeneratorThumbnailRequest request](self, "request");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v18, "isDataBased") & 1) == 0)
    {
      -[QLTGeneratorThumbnailRequest request](self, "request");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "quicklookSandboxWrapper");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v20)
      {
        -[QLTGeneratorThumbnailRequest request](self, "request");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "item");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v22)
          -[QLTGeneratorThumbnailRequest fetchURLWithCompletionHandler:].cold.1();

      }
    }

  }
LABEL_5:

}

- (void)computeUbiquitousnessWithCompletionHandler:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  int v16;
  void *v17;
  _QWORD v18[5];
  void (**v19)(id, _QWORD);
  _QWORD v20[5];
  void (**v21)(id, _QWORD);
  id v22;

  v4 = (void (**)(id, _QWORD))a3;
  -[QLTGeneratorThumbnailRequest request](self, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "item");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[QLTGeneratorThumbnailRequest request](self, "request");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    objc_msgSend(v7, "item");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = 1;
    -[QLTGeneratorThumbnailRequest setIsUbiquitous:](self, "setIsUbiquitous:", 1);
    -[QLTGeneratorThumbnailRequest setIsUbiquitousKnown:](self, "setIsUbiquitousKnown:", 1);
    -[QLTGeneratorThumbnailRequest setIsDownloadedKnown:](self, "setIsDownloadedKnown:", 1);
    if (objc_msgSend(v9, "isCloudItem"))
      v10 = objc_msgSend(v9, "isDownloaded");
    -[QLTGeneratorThumbnailRequest setIsDownloaded:](self, "setIsDownloaded:", v10);
    objc_msgSend(v9, "fileURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v9, "fileURL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[QLTGeneratorThumbnailRequest setTaggedLogicalURL:](self, "setTaggedLogicalURL:", v12);

      -[QLTGeneratorThumbnailRequest taggedLogicalURL](self, "taggedLogicalURL");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 0;
      LODWORD(v12) = objc_msgSend(v13, "_QLIsThumbnailableWithError:", &v22);
      v14 = v22;

      if ((_DWORD)v12)
        v15 = 0;
      else
        v15 = v14;
      ((void (**)(id, id))v4)[2](v4, v15);

    }
    else if (-[QLTGeneratorThumbnailRequest isDownloaded](self, "isDownloaded"))
    {
      objc_msgSend(MEMORY[0x1E0CAAC80], "defaultManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __75__QLTGeneratorThumbnailRequest_computeUbiquitousnessWithCompletionHandler___block_invoke;
      v20[3] = &unk_1E99D3178;
      v20[4] = self;
      v21 = v4;
      objc_msgSend(v17, "fetchURLForItem:completionHandler:", v9, v20);

    }
    else
    {
      v4[2](v4, 0);
    }

  }
  else
  {
    v16 = objc_msgSend(v7, "isDataBased");

    if (v16)
    {
      -[QLTGeneratorThumbnailRequest setIsDownloaded:](self, "setIsDownloaded:", 1);
      -[QLTGeneratorThumbnailRequest setIsDownloadedKnown:](self, "setIsDownloadedKnown:", 1);
      -[QLTGeneratorThumbnailRequest setIsUbiquitous:](self, "setIsUbiquitous:", 0);
      -[QLTGeneratorThumbnailRequest setIsUbiquitousKnown:](self, "setIsUbiquitousKnown:", 0);
      v4[2](v4, 0);
    }
    else
    {
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __75__QLTGeneratorThumbnailRequest_computeUbiquitousnessWithCompletionHandler___block_invoke_2;
      v18[3] = &unk_1E99D2C58;
      v18[4] = self;
      v19 = v4;
      -[QLTGeneratorThumbnailRequest fetchURLWithCompletionHandler:](self, "fetchURLWithCompletionHandler:", v18);

    }
  }

}

- (unint64_t)unhandledRequestedTypes
{
  return -[QLThumbnailGenerationRequest representationTypes](self->_request, "representationTypes") & ~LODWORD(self->_handledRequestedTypes) & 6;
}

- (void)cancel
{
  id v3;

  -[QLTGeneratorThumbnailRequest setCancelled:](self, "setCancelled:", 1);
  -[QLThumbnailGenerationRequest cancel](self->_request, "cancel");
  -[QLTGeneratorThumbnailRequest generator](self, "generator");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

}

- (int64_t)compare:(id)a3
{
  QLThumbnailGenerationRequest *request;
  void *v4;
  int64_t v5;

  request = self->_request;
  objc_msgSend(a3, "request");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[QLThumbnailGenerationRequest compare:](request, "compare:", v4);

  return v5;
}

- (id)description
{
  id v3;
  uint64_t v4;
  QLThumbnailGenerationRequest *request;
  NSURL *taggedLogicalURL;
  FPItem *item;
  unint64_t handledRequestedTypes;
  unint64_t badgeType;
  const __CFString *v10;
  void *v11;
  void *v12;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = objc_opt_class();
  request = self->_request;
  taggedLogicalURL = self->_taggedLogicalURL;
  item = self->_item;
  handledRequestedTypes = self->_handledRequestedTypes;
  badgeType = self->_badgeType;
  if (-[QLTGeneratorThumbnailRequest needsLowQualityThumbnailGeneration](self, "needsLowQualityThumbnailGeneration"))
    v10 = CFSTR("(low quality)");
  else
    v10 = &stru_1E99D4E38;
  -[QLTGeneratorThumbnailRequest clientApplicationIdentifier](self, "clientApplicationIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %@, url: %@, item: %@, ht:%lu bt:%lu %@ client:%@>"), v4, request, taggedLogicalURL, item, handledRequestedTypes, badgeType, v10, v11);

  return v12;
}

void __62__QLTGeneratorThumbnailRequest_fetchURLWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "setTaggedLogicalURL:", a2);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __75__QLTGeneratorThumbnailRequest_computeUbiquitousnessWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  char v7;
  id v8;
  id v9;
  id v10;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "setTaggedLogicalURL:", v5);
  if (v5)
  {
    v10 = 0;
    v7 = objc_msgSend(v5, "_QLIsThumbnailableWithError:", &v10);
    v8 = v10;
    if ((v7 & 1) != 0)
      v9 = 0;
    else
      v9 = v8;
    (*(void (**)(_QWORD, id))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v9);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (QLPreviewThumbnailGenerator)generator
{
  return self->_generator;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (NSError)generationError
{
  return self->_generationError;
}

- (unint64_t)handledRequestedTypes
{
  return self->_handledRequestedTypes;
}

- (void)setHandledRequestedTypes:(unint64_t)a3
{
  self->_handledRequestedTypes = a3;
}

- (BOOL)didCheckCache
{
  return self->_didCheckCache;
}

- (unint64_t)successfullyHandldedRequestedTypes
{
  return self->_successfullyHandldedRequestedTypes;
}

- (void)setSuccessfullyHandldedRequestedTypes:(unint64_t)a3
{
  self->_successfullyHandldedRequestedTypes = a3;
}

- (BOOL)isUbiquitousKnown
{
  return self->_isUbiquitousKnown;
}

- (BOOL)isDownloadedKnown
{
  return self->_isDownloadedKnown;
}

- (NSString)clientApplicationIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (NSSet)allowedTypesForGeneration
{
  return self->_allowedTypesForGeneration;
}

- (void)setAllowedTypesForGeneration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (id)downloadCompletionHandler
{
  return objc_getProperty(self, a2, 128, 1);
}

- (void)setDownloadCompletionHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 128);
}

- (NSNumber)requestBadgeType
{
  return self->_requestBadgeType;
}

- (void)setRequestBadgeType:(id)a3
{
  objc_storeStrong((id *)&self->_requestBadgeType, a3);
}

- (void)setDiskStore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (void)fetchURLWithCompletionHandler:.cold.1()
{
  __assert_rtn("-[QLTGeneratorThumbnailRequest fetchURLWithCompletionHandler:]", "QLTGeneratorThumbnailRequest.m", 202, "self.request.isDataBased || (self.request.quicklookSandboxWrapper != nil) || (self.request.item != nil)");
}

- (void)fetchURLWithCompletionHandler:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1D54AE000, a2, OS_LOG_TYPE_ERROR, "No URL or FPItem for request %@", (uint8_t *)&v2, 0xCu);
}

void __75__QLTGeneratorThumbnailRequest_computeUbiquitousnessWithCompletionHandler___block_invoke_2_cold_1(id *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*a1, "taggedLogicalURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v5;
  v9 = 2112;
  v10 = a2;
  OUTLINED_FUNCTION_0_1(&dword_1D54AE000, a3, v6, "Could not retrieve the downloading status of %@: %@", (uint8_t *)&v7);

}

- (void)fetchFPItemWithCompletionHandler:.cold.1()
{
  __assert_rtn("-[QLTGeneratorThumbnailRequest fetchFPItemWithCompletionHandler:]", "QLTGeneratorThumbnailRequest.m", 330, "!self.request.isDataBased");
}

void __65__QLTGeneratorThumbnailRequest_fetchFPItemWithCompletionHandler___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  OUTLINED_FUNCTION_0_1(&dword_1D54AE000, a3, (uint64_t)a3, "Could not fetch FPItem for %@: %@", (uint8_t *)&v4);
}

@end
