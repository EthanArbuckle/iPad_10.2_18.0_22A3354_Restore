@implementation QLGeneratorFetcher

- (QLGeneratorFetcher)initWithURL:(id)a3 contentType:(id)a4
{
  id v7;
  id v8;
  QLGeneratorFetcher *v9;
  QLGeneratorFetcher *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)QLGeneratorFetcher;
  v9 = -[QLItemFetcher init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_url, a3);
    objc_storeStrong((id *)&v10->_contentType, a4);
  }

  return v10;
}

- (void)_callCompletionBlockIfNecessary:(id)a3 withReply:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  QLGeneratorFetcher *v10;
  void (**v11)(id, id, id);

  v11 = (void (**)(id, id, id))a3;
  v8 = a4;
  v9 = a5;
  v10 = self;
  objc_sync_enter(v10);
  if (!-[QLGeneratorFetcher fetchCompleted](v10, "fetchCompleted"))
  {
    v11[2](v11, v8, v9);
    -[QLGeneratorFetcher setFetchCompleted:](v10, "setFetchCompleted:", 1);
  }
  objc_sync_exit(v10);

}

- (void)fetchContentWithAllowedOutputClasses:(id)a3 inQueue:(id)a4 updateBlock:(id)a5 completionBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id location;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(MEMORY[0x1E0D835D0], "sharedManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLGeneratorFetcher contentType](self, "contentType");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v20) = 0;
  objc_msgSend(v14, "qlExtensionForContentType:allowExtensionsForParentTypes:applicationBundleIdentifier:extensionPath:extensionType:generationType:shouldUseRestrictedExtension:", v15, 1, 0, 0, 0, 1, v20);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_initWeak(&location, self);
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __95__QLGeneratorFetcher_fetchContentWithAllowedOutputClasses_inQueue_updateBlock_completionBlock___block_invoke;
    v21[3] = &unk_1E9EFC300;
    objc_copyWeak(&v24, &location);
    v22 = v16;
    v23 = v13;
    objc_msgSend(v22, "extensionContextWithCompletionHandler:", v21);

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }
  else
  {
    v17 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v26 = *MEMORY[0x1E0CB2938];
    v27[0] = CFSTR("No valid extension or context.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v17, "initWithDomain:code:userInfo:", *MEMORY[0x1E0D83638], 4, v18);

    -[QLGeneratorFetcher _callCompletionBlockIfNecessary:withReply:error:](self, "_callCompletionBlockIfNecessary:withReply:error:", v13, 0, v19);
  }

}

void __95__QLGeneratorFetcher_fetchContentWithAllowedOutputClasses_inQueue_updateBlock_completionBlock___block_invoke(id *a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(a1[4], "extension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_auxiliaryConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __95__QLGeneratorFetcher_fetchContentWithAllowedOutputClasses_inQueue_updateBlock_completionBlock___block_invoke_2;
  v19[3] = &unk_1E9EFC2B0;
  v8 = WeakRetained;
  v20 = v8;
  v21 = a1[5];
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v19);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 && v5 && v9)
  {
    objc_msgSend(a1[4], "registerClient:", v8);
    v10 = objc_alloc(MEMORY[0x1E0CD3300]);
    objc_msgSend(v8, "url");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithURL:sandboxType:", v11, *MEMORY[0x1E0C80000]);

    v15[0] = v7;
    v15[1] = 3221225472;
    v15[2] = __95__QLGeneratorFetcher_fetchContentWithAllowedOutputClasses_inQueue_updateBlock_completionBlock___block_invoke_3;
    v15[3] = &unk_1E9EFC2D8;
    objc_copyWeak(&v18, a1 + 6);
    v16 = a1[4];
    v17 = a1[5];
    objc_msgSend(v9, "generatePreviewForURL:completion:", v12, v15);

    objc_destroyWeak(&v18);
  }
  else
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v22 = *MEMORY[0x1E0CB2938];
    v23[0] = CFSTR("Failed to connect to extension to generate a preview.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D83638], 4, v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "_callCompletionBlockIfNecessary:withReply:error:", a1[5], 0, v12);
  }

}

uint64_t __95__QLGeneratorFetcher_fetchContentWithAllowedOutputClasses_inQueue_updateBlock_completionBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_callCompletionBlockIfNecessary:withReply:error:", *(_QWORD *)(a1 + 40), 0, a2);
}

void __95__QLGeneratorFetcher_fetchContentWithAllowedOutputClasses_inQueue_updateBlock_completionBlock___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id *v5;
  id v6;
  id v7;
  id WeakRetained;

  v5 = (id *)(a1 + 48);
  v6 = a3;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(*(id *)(a1 + 32), "unregisterClient:", WeakRetained);
  objc_msgSend(WeakRetained, "_callCompletionBlockIfNecessary:withReply:error:", *(_QWORD *)(a1 + 40), v7, v6);

}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 32, 1);
}

- (void)setUrl:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (NSString)contentType
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setContentType:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (BOOL)fetchCompleted
{
  return self->_fetchCompleted;
}

- (void)setFetchCompleted:(BOOL)a3
{
  self->_fetchCompleted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentType, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
