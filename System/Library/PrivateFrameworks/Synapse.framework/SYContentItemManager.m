@implementation SYContentItemManager

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_13);
  return (id)sharedManager_sharedManager;
}

void __37__SYContentItemManager_sharedManager__block_invoke()
{
  SYContentItemManager *v0;
  void *v1;

  v0 = objc_alloc_init(SYContentItemManager);
  v1 = (void *)sharedManager_sharedManager;
  sharedManager_sharedManager = (uint64_t)v0;

}

- (void)navigateToContentItem:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;

  v6 = a3;
  v7 = a4;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __57__SYContentItemManager_navigateToContentItem_completion___block_invoke;
  v14[3] = &unk_1E757B5D0;
  v15 = v7;
  v8 = v7;
  v9 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1BCCFF08C](v14);
  objc_msgSend(v6, "userActivity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v6, "userActivity");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SYContentItemManager _navigateToUserActivity:completion:](self, "_navigateToUserActivity:completion:", v11, v9);
LABEL_5:

    goto LABEL_6;
  }
  objc_msgSend(v6, "itemURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v6, "itemURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SYContentItemManager _navigateToURL:completion:](self, "_navigateToURL:completion:", v11, v9);
    goto LABEL_5;
  }
  v13 = os_log_create("com.apple.synapse", "ContentItemManager");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    -[SYContentItemManager navigateToContentItem:completion:].cold.1(v13);

  v9[2](v9, 0, 0);
LABEL_6:

}

void __57__SYContentItemManager_navigateToContentItem_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  id v10;
  char v11;

  v5 = a3;
  v6 = *(void **)(a1 + 32);
  if (v6)
  {
    dispatch_get_global_queue(0, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__SYContentItemManager_navigateToContentItem_completion___block_invoke_2;
    block[3] = &unk_1E757C5B0;
    v10 = v6;
    v11 = a2;
    v9 = v5;
    dispatch_async(v7, block);

  }
}

uint64_t __57__SYContentItemManager_navigateToContentItem_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void)_navigateToUserActivity:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SYContentItemManager.m"), 62, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("userActivity"));

  }
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __59__SYContentItemManager__navigateToUserActivity_completion___block_invoke;
  v12[3] = &unk_1E757B5D0;
  v13 = v8;
  v10 = v8;
  objc_msgSend(v9, "openUserActivity:usingApplicationRecord:configuration:completionHandler:", v7, 0, 0, v12);

}

uint64_t __59__SYContentItemManager__navigateToUserActivity_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_navigateToURL:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SYContentItemManager.m"), 72, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("targetURL"));

  }
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __50__SYContentItemManager__navigateToURL_completion___block_invoke;
  v12[3] = &unk_1E757C098;
  v13 = v8;
  v10 = v8;
  objc_msgSend(v9, "openURL:configuration:completionHandler:", v7, 0, v12);

}

uint64_t __50__SYContentItemManager__navigateToURL_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchLinkableContentItemsWithCompletion:(id)a3
{
  id v3;
  SYLinkableContentItemFinder *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  v4 = objc_alloc_init(SYLinkableContentItemFinder);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __64__SYContentItemManager_fetchLinkableContentItemsWithCompletion___block_invoke;
  v6[3] = &unk_1E757BE48;
  v7 = v3;
  v5 = v3;
  -[SYLinkableContentItemFinder fetchLinkableContentItemsExcludingActivities:completion:](v4, "fetchLinkableContentItemsExcludingActivities:completion:", 0, v6);

}

uint64_t __64__SYContentItemManager_fetchLinkableContentItemsWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)navigateToContentItem:(os_log_t)log completion:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1BCC38000, log, OS_LOG_TYPE_ERROR, "Requested navigation to an item that has no URL or user activity.", v1, 2u);
}

@end
