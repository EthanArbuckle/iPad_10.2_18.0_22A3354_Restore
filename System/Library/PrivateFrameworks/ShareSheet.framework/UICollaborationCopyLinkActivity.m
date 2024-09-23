@implementation UICollaborationCopyLinkActivity

+ (unint64_t)_xpcAttributes
{
  uint64_t v2;

  v2 = objc_opt_class();
  if (v2 == objc_opt_class())
    return 3;
  else
    return 0;
}

+ (int64_t)activityCategory
{
  return 0;
}

- (int64_t)_defaultSortGroup
{
  return 1;
}

- (id)activityType
{
  return CFSTR("com.apple.UIKit.activity.CollaborationCopyLink");
}

- (id)_systemImageName
{
  return CFSTR("link");
}

- (id)activityTitle
{
  void *v2;
  void *v3;

  _ShareSheetBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("CopyLink[Activity]"), CFSTR("Copy Link"), CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  return 0;
}

- (BOOL)canPerformWithCollaborationItem:(id)a3 activityItems:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  const char *v11;
  int v13;
  UICollaborationCopyLinkActivity *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_msgSend(v5, "type");
  if (v6)
  {
    if (v6 == 1)
    {
      v7 = (void *)MEMORY[0x1E0D97420];
      objc_msgSend(v5, "itemProvider");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isPostCKShareItemProvider:", v8);

    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    v9 = objc_msgSend(v5, "isShared");
  }
  share_sheet_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = "no";
    v13 = 138412802;
    v14 = self;
    if (v9)
      v11 = "yes";
    v15 = 2080;
    v16 = v11;
    v17 = 2112;
    v18 = v5;
    _os_log_impl(&dword_19E419000, v10, OS_LOG_TYPE_DEFAULT, "%@: canPerform:%s collaborationItem:%@", (uint8_t *)&v13, 0x20u);
  }

  return v9;
}

- (BOOL)_activitySupportsPromiseURLs
{
  return 1;
}

- (void)_prepareWithActivityItems:(id)a3 completion:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v5 = a4;
  v6 = (void *)MEMORY[0x1E0D97420];
  -[UICollaborationCopyLinkActivity collaborationItem](self, "collaborationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollaborationCopyLinkActivity collaborationService](self, "collaborationService");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __72__UICollaborationCopyLinkActivity__prepareWithActivityItems_completion___block_invoke;
  v10[3] = &unk_1E4001FD8;
  v10[4] = self;
  v11 = v5;
  v9 = v5;
  objc_msgSend(v6, "requestSharedURLForCollaborationItem:collaborationService:completionHandler:", v7, v8, v10);

}

void __72__UICollaborationCopyLinkActivity__prepareWithActivityItems_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __72__UICollaborationCopyLinkActivity__prepareWithActivityItems_completion___block_invoke_2;
  v11[3] = &unk_1E4001B50;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v12 = v5;
  v13 = v7;
  v14 = v6;
  v15 = v8;
  v9 = v6;
  v10 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v11);

}

uint64_t __72__UICollaborationCopyLinkActivity__prepareWithActivityItems_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v8;
  uint8_t buf[4];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  share_sheet_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v10 = v5;
      _os_log_impl(&dword_19E419000, v4, OS_LOG_TYPE_DEFAULT, "Copying Link %@", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
    v4 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v8, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObjects:](v4, "setObjects:", v6);

  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    __72__UICollaborationCopyLinkActivity__prepareWithActivityItems_completion___block_invoke_2_cold_1(a1, v4);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (void)performActivity
{
  -[UIActivity activityDidFinish:](self, "activityDidFinish:", 1);
}

- (id)activityViewController
{
  return 0;
}

- (SFCollaborationItem)collaborationItem
{
  return self->_collaborationItem;
}

- (void)setCollaborationItem:(id)a3
{
  objc_storeStrong((id *)&self->_collaborationItem, a3);
}

- (SFCollaborationService)collaborationService
{
  return (SFCollaborationService *)objc_loadWeakRetained((id *)&self->_collaborationService);
}

- (void)setCollaborationService:(id)a3
{
  objc_storeWeak((id *)&self->_collaborationService, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_collaborationService);
  objc_storeStrong((id *)&self->_collaborationItem, 0);
}

void __72__UICollaborationCopyLinkActivity__prepareWithActivityItems_completion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 40), "collaborationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 48);
  v6 = 138412546;
  v7 = v4;
  v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_19E419000, a2, OS_LOG_TYPE_ERROR, "Copy Link failed: Couldn't retrieve shareURL for item:%@ %@", (uint8_t *)&v6, 0x16u);

}

@end
