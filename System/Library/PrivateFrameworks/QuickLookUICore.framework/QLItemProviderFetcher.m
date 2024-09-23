@implementation QLItemProviderFetcher

- (QLItemProviderFetcher)initWithContentType:(id)a3 fileSize:(id)a4
{
  id v7;
  id v8;
  QLItemProviderFetcher *v9;
  QLItemProviderFetcher *v10;
  QLItemProviderFetcher *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)QLItemProviderFetcher;
  v9 = -[QLItemFetcher init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_contentType, a3);
    objc_storeStrong((id *)&v10->_fileSize, a4);
    v11 = v10;
  }

  return v10;
}

- (void)fetchContentWithAllowedOutputClasses:(id)a3 inQueue:(id)a4 updateBlock:(id)a5 completionBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id updateBlock;
  void *v15;
  id completionBlock;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;

  v10 = a3;
  v11 = a6;
  v12 = a4;
  v13 = (void *)MEMORY[0x1DF089CE8](a5);
  updateBlock = self->_updateBlock;
  self->_updateBlock = v13;

  v15 = (void *)MEMORY[0x1DF089CE8](v11);
  completionBlock = self->_completionBlock;
  self->_completionBlock = v15;

  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __98__QLItemProviderFetcher_fetchContentWithAllowedOutputClasses_inQueue_updateBlock_completionBlock___block_invoke;
  v19[3] = &unk_1E9EFC0A0;
  v20 = v10;
  v21 = v11;
  v19[4] = self;
  v17 = v10;
  v18 = v11;
  objc_msgSend(v12, "addOperationWithBlock:", v19);

}

void __98__QLItemProviderFetcher_fetchContentWithAllowedOutputClasses_inQueue_updateBlock_completionBlock___block_invoke(id *a1)
{
  void *v2;
  _QWORD *v3;
  void *v4;
  uint64_t v5;
  id *v6;
  id *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id location;

  +[QLNetworkStateObserver sharedInstance](QLNetworkStateObserver, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pushOperation");

  objc_initWeak(&location, a1[4]);
  v3 = a1[4];
  v4 = (void *)v3[3];
  if (v4)
  {
    v5 = v3[4];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __98__QLItemProviderFetcher_fetchContentWithAllowedOutputClasses_inQueue_updateBlock_completionBlock___block_invoke_2;
    v17[3] = &unk_1E9EFC050;
    v6 = &v20;
    objc_copyWeak(&v20, &location);
    v19 = a1[6];
    v18 = a1[5];
    objc_msgSend(v4, "loadItemForTypeIdentifier:options:completionHandler:", v5, 0, v17);
    v7 = &v19;
    v8 = v18;
  }
  else
  {
    v9 = (void *)v3[6];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __98__QLItemProviderFetcher_fetchContentWithAllowedOutputClasses_inQueue_updateBlock_completionBlock___block_invoke_2;
    v13[3] = &unk_1E9EFC078;
    v6 = &v16;
    objc_copyWeak(&v16, &location);
    v10 = a1[6];
    v11 = a1[4];
    v12 = a1[5];
    v15 = v10;
    v13[4] = v11;
    v14 = v12;
    objc_msgSend(v9, "getURLWithDownloadTracker:completionHandler:", v3, v13);
    v7 = &v15;
    v8 = v14;
  }

  objc_destroyWeak(v6);
  objc_destroyWeak(&location);
}

void __98__QLItemProviderFetcher_fetchContentWithAllowedOutputClasses_inQueue_updateBlock_completionBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  id v8;
  NSObject *v9;
  NSObject **v10;
  NSObject *v11;
  void (*v12)(void);
  NSObject **v13;
  NSObject *v14;
  void *v15;
  NSObject **v16;
  int v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (!v5 || v6)
    {
      v10 = (NSObject **)MEMORY[0x1E0D83678];
      v11 = *MEMORY[0x1E0D83678];
      if (!*MEMORY[0x1E0D83678])
      {
        QLSInitLogging();
        v11 = *v10;
      }
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v17 = 138412290;
        v18 = v6;
        _os_log_impl(&dword_1D936E000, v11, OS_LOG_TYPE_ERROR, "Error while attempting to load item: %@ #PreviewItem", (uint8_t *)&v17, 0xCu);
      }
      v12 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = v5;
        v9 = *MEMORY[0x1E0D83678];
        if (!*MEMORY[0x1E0D83678])
        {
          v16 = (NSObject **)MEMORY[0x1E0D83678];
          QLSInitLogging();
          v9 = *v16;
        }
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          v17 = 138412290;
          v18 = v8;
          _os_log_impl(&dword_1D936E000, v9, OS_LOG_TYPE_INFO, "Did obtain NSURL as contents for item backed by NSItemProvider: %@ #PreviewItem", (uint8_t *)&v17, 0xCu);
        }
        objc_msgSend(WeakRetained, "_updateCompletionBlockWithAllowedOutputClasses:URL:", *(_QWORD *)(a1 + 32), v8);

        goto LABEL_21;
      }
      v13 = (NSObject **)MEMORY[0x1E0D83678];
      v14 = *MEMORY[0x1E0D83678];
      if (!*MEMORY[0x1E0D83678])
      {
        QLSInitLogging();
        v14 = *v13;
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v17) = 0;
        _os_log_impl(&dword_1D936E000, v14, OS_LOG_TYPE_ERROR, "QLItems backed by NSItemProvider can only provide NSURLs, NSData is not supported. #PreviewItem", (uint8_t *)&v17, 2u);
      }
      v12 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    }
    v12();
LABEL_21:
    +[QLNetworkStateObserver sharedInstance](QLNetworkStateObserver, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "popOperation");

  }
}

{
  id v5;
  id WeakRetained;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (v8 && v5)
    {
      objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) = sandbox_extension_consume();
      objc_msgSend(WeakRetained, "_updateCompletionBlockWithAllowedOutputClasses:URL:", *(_QWORD *)(a1 + 40), v8);
    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
    +[QLNetworkStateObserver sharedInstance](QLNetworkStateObserver, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "popOperation");

  }
}

- (void)_updateCompletionBlockWithAllowedOutputClasses:(id)a3 URL:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __76__QLItemProviderFetcher__updateCompletionBlockWithAllowedOutputClasses_URL___block_invoke;
  v10[3] = &unk_1E9EFBFA0;
  v10[4] = self;
  v11 = v7;
  v12 = v6;
  v8 = v6;
  v9 = v7;
  QLRunInMainThread(v10);

}

void __76__QLItemProviderFetcher__updateCompletionBlockWithAllowedOutputClasses_URL___block_invoke(id *a1)
{
  id v2;
  uint64_t v3;
  int v4;
  _QWORD *v5;
  void (*v6)(void);
  id v7;

  objc_storeStrong((id *)a1[4] + 10, a1[5]);
  if (objc_msgSend(a1[6], "containsObject:", objc_opt_class()))
  {
    objc_msgSend(a1[4], "setFetchingState:", 1);
    v2 = a1[5];
    v3 = *((_QWORD *)a1[4] + 8);
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v2);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, _QWORD))(v3 + 16))(v3, v7, 0);

  }
  else
  {
    v4 = objc_msgSend(a1[6], "containsObject:", objc_opt_class());
    v5 = a1[4];
    if (v4)
    {
      objc_msgSend(v5, "setFetchingState:", 1);
      v6 = *(void (**)(void))(*((_QWORD *)a1[4] + 8) + 16);
    }
    else
    {
      v6 = *(void (**)(void))(v5[8] + 16);
    }
    v6();
  }
}

- (void)updatedURLWithProgress:(double)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __48__QLItemProviderFetcher_updatedURLWithProgress___block_invoke;
  v3[3] = &unk_1E9EFC0C8;
  v3[4] = self;
  *(double *)&v3[5] = a3;
  QLRunInMainThread(v3);
}

void __48__QLItemProviderFetcher_updatedURLWithProgress___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
  if (v1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 40));
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

  }
}

- (void)getURLWithDownloadTracker:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_opt_new();
  v13 = v7;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __69__QLItemProviderFetcher_getURLWithDownloadTracker_completionHandler___block_invoke;
  v14[3] = &unk_1E9EFC0F0;
  v15 = v6;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __69__QLItemProviderFetcher_getURLWithDownloadTracker_completionHandler___block_invoke_2;
  v12[3] = &unk_1E9EFC118;
  v10 = v7;
  v11 = v6;
  -[QLItemProviderFetcher fetchContentWithAllowedOutputClasses:inQueue:updateBlock:completionBlock:](self, "fetchContentWithAllowedOutputClasses:inQueue:updateBlock:completionBlock:", v8, v9, v14, v12);

}

uint64_t __69__QLItemProviderFetcher_getURLWithDownloadTracker_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  float v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "floatValue");
  return objc_msgSend(v2, "updatedURLWithProgress:", v3);
}

void __69__QLItemProviderFetcher_getURLWithDownloadTracker_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  char isKindOfClass;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject **v11;
  NSObject *v12;
  int v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5 && (objc_opt_class(), isKindOfClass = objc_opt_isKindOfClass(), !v6) && (isKindOfClass & 1) != 0)
  {
    objc_msgSend(objc_retainAutorelease(v5), "fileSystemRepresentation");
    v8 = sandbox_extension_issue_file();
    if (v8)
    {
      v9 = (void *)v8;
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCString:encoding:", v8, 4);
      free(v9);
    }
    else
    {
      v10 = 0;
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    v11 = (NSObject **)MEMORY[0x1E0D83678];
    v12 = *MEMORY[0x1E0D83678];
    if (!*MEMORY[0x1E0D83678])
    {
      QLSInitLogging();
      v12 = *v11;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = 138412546;
      v14 = v5;
      v15 = 2112;
      v16 = v6;
      _os_log_impl(&dword_1D936E000, v12, OS_LOG_TYPE_ERROR, "Error while obtaining URL in getURLWithDownloadTracker: %@. Error: %@ #PreviewItem", (uint8_t *)&v13, 0x16u);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (BOOL)isLongFetchOperation
{
  return self->_lastContent == 0;
}

- (BOOL)canBeCanceled
{
  return 0;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_fileExtensionHandle)
    sandbox_extension_release();
  v3.receiver = self;
  v3.super_class = (Class)QLItemProviderFetcher;
  -[QLItemProviderFetcher dealloc](&v3, sel_dealloc);
}

- (id)shareableItem
{
  return self->_lastContent;
}

- (id)fetchedContent
{
  id v3;

  v3 = -[QLItemFetcher fetchingState](self, "fetchingState");
  if (v3)
    v3 = self->_lastContent;
  return v3;
}

- (id)itemSize
{
  return self->_fileSize;
}

- (id)newItemProvider
{
  void *v3;
  NSString *contentType;
  _QWORD v6[4];
  id v7;
  id location;

  objc_initWeak(&location, self);
  v3 = (void *)objc_opt_new();
  contentType = self->_contentType;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __40__QLItemProviderFetcher_newItemProvider__block_invoke;
  v6[3] = &unk_1E9EFC140;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v3, "registerFileRepresentationForTypeIdentifier:fileOptions:visibility:loadHandler:", contentType, 0, 0, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
  return v3;
}

uint64_t __40__QLItemProviderFetcher_newItemProvider__block_invoke(uint64_t a1, void (**a2)(_QWORD, _QWORD, _QWORD, _QWORD))
{
  id *v3;
  void (**v4)(_QWORD, _QWORD, _QWORD, _QWORD);
  id WeakRetained;
  void *v6;

  v3 = (id *)(a1 + 32);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "lastContent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *, uint64_t, _QWORD))a2)[2](v4, v6, 1, 0);

  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)QLItemProviderFetcher;
  v4 = a3;
  -[QLItemFetcher encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_fileSize, CFSTR("fileSize"), v5.receiver, v5.super_class);

}

- (QLItemProviderFetcher)initWithCoder:(id)a3
{
  id v4;
  QLItemProviderFetcher *v5;
  uint64_t v6;
  NSNumber *fileSize;
  QLItemProviderFetcher *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)QLItemProviderFetcher;
  v5 = -[QLItemFetcher initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fileSize"));
    v6 = objc_claimAutoreleasedReturnValue();
    fileSize = v5->_fileSize;
    v5->_fileSize = (NSNumber *)v6;

    v8 = v5;
  }

  return v5;
}

- (NSItemProvider)itemProvider
{
  return (NSItemProvider *)objc_getProperty(self, a2, 24, 1);
}

- (void)setItemProvider:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (QLPreviewItemURLProvider)urlProvider
{
  return (QLPreviewItemURLProvider *)objc_getProperty(self, a2, 48, 1);
}

- (void)setUrlProvider:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (id)lastContent
{
  return self->_lastContent;
}

- (void)setLastContent:(id)a3
{
  objc_storeStrong(&self->_lastContent, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_lastContent, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong(&self->_updateBlock, 0);
  objc_storeStrong((id *)&self->_urlProvider, 0);
  objc_storeStrong((id *)&self->_fileSize, 0);
  objc_storeStrong((id *)&self->_contentType, 0);
  objc_storeStrong((id *)&self->_itemProvider, 0);
}

@end
