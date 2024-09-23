@implementation WBSLeadImageSaver

+ (void)saveLeadImageFromWebView:(id)a3 toLeadImageCacheRegisteredWithMetadataManager:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_alloc_init(MEMORY[0x1E0CC11E0]);
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "setShouldFetchSubresources:", 0);
    v12 = MEMORY[0x1E0C809B0];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __110__WBSLeadImageSaver_saveLeadImageFromWebView_toLeadImageCacheRegisteredWithMetadataManager_completionHandler___block_invoke;
    v26[3] = &unk_1E5444690;
    v28 = v9;
    v27 = v8;
    v20 = 0;
    v21 = &v20;
    v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__8;
    v24 = __Block_byref_object_dispose__8;
    v25 = 0;
    v17[0] = v12;
    v17[1] = 3221225472;
    v17[2] = __110__WBSLeadImageSaver_saveLeadImageFromWebView_toLeadImageCacheRegisteredWithMetadataManager_completionHandler___block_invoke_4;
    v17[3] = &unk_1E54446B8;
    v18 = (id)MEMORY[0x1A85D45E4](v26);
    v19 = &v20;
    v13 = v18;
    objc_msgSend(v11, "_startFetchingMetadataForWebView:isNonAppInitiated:completionHandler:", v7, 1, v17);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v21[5];
    v21[5] = v14;

    _Block_object_dispose(&v20, 8);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 2, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v9 + 2))(v9, 0, v16);

  }
}

void __110__WBSLeadImageSaver_saveLeadImageFromWebView_toLeadImageCacheRegisteredWithMetadataManager_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    objc_msgSend(v5, "images");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "URL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      +[WBSLeadImageCacheRequest requestWithURL:](WBSLeadImageCacheRequest, "requestWithURL:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __110__WBSLeadImageSaver_saveLeadImageFromWebView_toLeadImageCacheRegisteredWithMetadataManager_completionHandler___block_invoke_2;
      v15[3] = &unk_1E5444668;
      v12 = *(void **)(a1 + 32);
      v17 = *(id *)(a1 + 40);
      v16 = v10;
      objc_msgSend(v12, "preloadRequest:withPriority:responseHandler:", v11, 0, v15);

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }

  }
  else
  {
    v13 = *(_QWORD *)(a1 + 40);
    if (v6)
    {
      (*(void (**)(_QWORD, _QWORD, id))(v13 + 16))(*(_QWORD *)(a1 + 40), 0, v6);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 5, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v13 + 16))(v13, 0, v14);

    }
  }

}

void __110__WBSLeadImageSaver_saveLeadImageFromWebView_toLeadImageCacheRegisteredWithMetadataManager_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  objc_msgSend(a2, "thumbnail");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = *(_QWORD *)(a1 + 40);
  if (v3)
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD))(v4 + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 5, 0);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v4 + 16))(v4, 0, v5);

  }
}

uint64_t __110__WBSLeadImageSaver_saveLeadImageFromWebView_toLeadImageCacheRegisteredWithMetadataManager_completionHandler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
}

@end
