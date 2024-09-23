@implementation SFCollaborationItem

+ (id)collaborationItemForItemProvider:(id)a3 activityItem:(id)a4 isURLProviderSupported:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  _BOOL4 v9;
  _BOOL4 v10;
  _SFCKShareCollaborationItem *v11;
  _SFCKShareCollaborationItem *v12;

  v5 = a5;
  v7 = a3;
  v8 = a4;
  v9 = +[SFCollaborationUtilities isCKShareItemProvider:](SFCollaborationUtilities, "isCKShareItemProvider:", v7);
  v10 = +[SFCollaborationUtilities isSWYActivityItemProvider:](SFCollaborationUtilities, "isSWYActivityItemProvider:", v7);
  if (v9 || v10)
  {
    if (v9)
      v12 = -[_SFCKShareCollaborationItem initWithItemProvider:activityItem:]([_SFCKShareCollaborationItem alloc], "initWithItemProvider:activityItem:", v7, v8);
    else
      v12 = -[_SFSWYCollaborationItem initWithItemProvider:activityItem:isURLProviderSupported:]([_SFSWYCollaborationItem alloc], "initWithItemProvider:activityItem:isURLProviderSupported:", v7, v8, v5);
    v11 = v12;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)collaborationItemForFileURL:(id)a3 itemProvider:(id)a4 activityItem:(id)a5 defaultCollaboration:(BOOL)a6 managedFileURL:(id)a7
{
  _BOOL8 v8;
  id v13;
  id v14;
  id v15;
  id v16;
  __CFString *v17;
  _SFFPShareCollaborationItem *v18;
  void *v20;

  v8 = a6;
  v13 = a3;
  v14 = a7;
  v15 = a5;
  v16 = a4;
  objc_msgSend(v13, "absoluteString");
  v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!IsAppleInternalBuild())
  {

    v17 = CFSTR("<redacted>");
  }
  if ((objc_msgSend(v13, "isFileURL") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SFCollaborationItem.m"), 123, CFSTR("url is not a fileURL: %@"), v17);

  }
  v18 = -[_SFFPShareCollaborationItem initWithFileURL:itemProvider:activityItem:defaultCollaboration:managedFileURL:]([_SFFPShareCollaborationItem alloc], "initWithFileURL:itemProvider:activityItem:defaultCollaboration:managedFileURL:", v13, v16, v15, v8, v14);

  return v18;
}

- (SFCollaborationItem)initWithItemProvider:(id)a3 activityItem:(id)a4 placeholderActivityItem:(id)a5 defaultCollaboration:(BOOL)a6
{
  _BOOL4 v6;
  id v11;
  id v12;
  id v13;
  SFCollaborationItem *v14;
  uint64_t v15;
  NSUUID *identifier;
  SFChangePublisher *v17;
  SFChangePublisher *changePublisher;
  void *v19;
  uint64_t v20;
  NSString *contentIdentifier;
  NSObject *v22;
  const char *v23;
  NSUUID *v24;
  objc_super v26;
  uint8_t buf[4];
  SFCollaborationItem *v28;
  __int16 v29;
  NSUUID *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;
  __int16 v37;
  const char *v38;
  uint64_t v39;

  v6 = a6;
  v39 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v26.receiver = self;
  v26.super_class = (Class)SFCollaborationItem;
  v14 = -[SFCollaborationItem init](&v26, sel_init);
  if (v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v15 = objc_claimAutoreleasedReturnValue();
    identifier = v14->_identifier;
    v14->_identifier = (NSUUID *)v15;

    objc_storeStrong((id *)&v14->_itemProvider, a3);
    objc_storeStrong(&v14->_activityItem, a4);
    objc_storeStrong(&v14->_placeholderActivityItem, a5);
    v17 = objc_alloc_init(SFChangePublisher);
    changePublisher = v14->_changePublisher;
    v14->_changePublisher = v17;

    v14->_defaultCollaboration = v6;
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "bundleIdentifier");
    v20 = objc_claimAutoreleasedReturnValue();
    contentIdentifier = v14->_contentIdentifier;
    v14->_contentIdentifier = (NSString *)v20;

    share_sheet_log();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = "no";
      v24 = v14->_identifier;
      *(_DWORD *)buf = 138413571;
      if (v6)
        v23 = "yes";
      v28 = v14;
      v29 = 2112;
      v30 = v24;
      v31 = 2112;
      v32 = v11;
      v33 = 2113;
      v34 = v12;
      v35 = 2113;
      v36 = v13;
      v37 = 2080;
      v38 = v23;
      _os_log_impl(&dword_1A2830000, v22, OS_LOG_TYPE_DEFAULT, "%@: identifier:%@ itemProvider:%@ activityItem:%{private}@ placeholderActivityItem:%{private}@ defaultCollaboration:%s", buf, 0x3Eu);
    }

    -[SFCollaborationItem _startLoading](v14, "_startLoading");
  }

  return v14;
}

- (NSString)additionalContentIdentifier
{
  return 0;
}

- (NSArray)sendCopyItems
{
  void *v3;
  void *v4;
  int64_t v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFCollaborationItem sendCopyRepresentation](self, "sendCopyRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SFCollaborationItem type](self, "type");
  if (!v5)
  {
    -[SFCollaborationItem sendCopyRepresentationURL](self, "sendCopyRepresentationURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      -[SFCollaborationItem activityItem](self, "activityItem");
      v9 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v9;
    }
LABEL_9:
    if (v4)
      goto LABEL_10;
    goto LABEL_11;
  }
  if (v5 != 2 && v5 != 1)
    goto LABEL_9;
  if (v4)
  {
LABEL_10:
    objc_msgSend(v3, "addObject:", v4);

    goto LABEL_11;
  }
  -[SFCollaborationItem itemProvider](self, "itemProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "supportsShareSheetSendCopyRepresentation");

  if (v7)
  {
    -[SFCollaborationItem itemProvider](self, "itemProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
LABEL_11:
  -[SFCollaborationItem sendCopyActivityItems](self, "sendCopyActivityItems");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v10);

  v11 = (void *)objc_msgSend(v3, "copy");
  return (NSArray *)v11;
}

- (NSArray)sendCopyItemPlaceholderValues
{
  void *v3;
  void *v4;
  int64_t v5;
  void *v6;
  int v7;
  SFCollaborationItem *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFCollaborationItem sendCopyRepresentation](self, "sendCopyRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SFCollaborationItem type](self, "type");
  if (!v5)
  {
    v8 = self;
    -[SFCollaborationItem sendCopyRepresentationURL](v8, "sendCopyRepresentationURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      -[SFCollaborationItem sendCopyRepresentationURL](v8, "sendCopyRepresentationURL");
    else
      -[SFCollaborationItem fileURL](v8, "fileURL");
    v10 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v10;
LABEL_11:
    if (v4)
      goto LABEL_12;
    goto LABEL_13;
  }
  if (v5 != 2 && v5 != 1)
    goto LABEL_11;
  if (v4)
  {
LABEL_12:
    objc_msgSend(v3, "addObject:", v4);

    goto LABEL_13;
  }
  -[SFCollaborationItem itemProvider](self, "itemProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "supportsShareSheetSendCopyRepresentation");

  if (v7)
  {
    -[SFCollaborationItem itemProvider](self, "itemProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
LABEL_13:
  -[SFCollaborationItem sendCopyActivityItemValues](self, "sendCopyActivityItemValues");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v11);

  v12 = (void *)objc_msgSend(v3, "copy");
  return (NSArray *)v12;
}

- (id)workQueue
{
  if (workQueue_onceToken != -1)
    dispatch_once(&workQueue_onceToken, &__block_literal_global_18);
  return (id)workQueue_workQueue;
}

void __32__SFCollaborationItem_workQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.sharing.sfcollaborationitem.work-queue", 0);
  v1 = (void *)workQueue_workQueue;
  workQueue_workQueue = (uint64_t)v0;

}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v15.receiver = self;
  v15.super_class = (Class)SFCollaborationItem;
  -[SFCollaborationItem description](&v15, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFCollaborationItem identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SFCollaborationItem type](self, "type");
  -[SFCollaborationItem itemProvider](self, "itemProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFCollaborationItem activityItem](self, "activityItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFCollaborationItem placeholderActivityItem](self, "placeholderActivityItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFCollaborationItem options](self, "options");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFCollaborationItem sendCopyRepresentation](self, "sendCopyRepresentation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFCollaborationItem canAddPeople](self, "canAddPeople");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ identifier:%@, type:%ld, itemProvider:%@, activityItem:%@, placeholderActivityItem:%@, options:%@, sendCopyRepresentation:%@, canAddPeople:%@"), v4, v5, v6, v7, v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v13;
}

- (void)_startLoading
{
  -[SFCollaborationItem setIsLoadingCanAddPeople:](self, "setIsLoadingCanAddPeople:", 1);
  -[SFCollaborationItem _loadMetadataIfNeeded](self, "_loadMetadataIfNeeded");
  -[SFCollaborationItem _loadOptionsIfNeeded](self, "_loadOptionsIfNeeded");
  -[SFCollaborationItem _loadSendCopyRepresentationIfNeeded](self, "_loadSendCopyRepresentationIfNeeded");
}

- (void)_loadMetadataIfNeeded
{
  NSObject *v3;
  int v4;
  SFCollaborationItem *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  share_sheet_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = self;
    _os_log_impl(&dword_1A2830000, v3, OS_LOG_TYPE_DEFAULT, "No metadata to load: %@", (uint8_t *)&v4, 0xCu);
  }

}

- (void)_loadOptionsIfNeeded
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id location;

  -[SFCollaborationItem options](self, "options");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[SFCollaborationItem setIsLoadingOptions:](self, "setIsLoadingOptions:", 1);
    location = 0;
    objc_initWeak(&location, self);
    -[SFCollaborationItem itemProvider](self, "itemProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __43__SFCollaborationItem__loadOptionsIfNeeded__block_invoke;
    v5[3] = &unk_1E482FDC0;
    objc_copyWeak(&v6, &location);
    +[SFCollaborationUtilities loadShareOptionsForItemProvider:completionHandler:](SFCollaborationUtilities, "loadShareOptionsForItemProvider:completionHandler:", v4, v5);

    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

void __43__SFCollaborationItem__loadOptionsIfNeeded__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__SFCollaborationItem__loadOptionsIfNeeded__block_invoke_2;
  block[3] = &unk_1E482FD98;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  v10 = v5;
  v11 = v6;
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v12);
}

void __43__SFCollaborationItem__loadOptionsIfNeeded__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_didLoadOptions:ckOptions:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_loadSendCopyRepresentationIfNeeded
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id location;

  -[SFCollaborationItem sendCopyRepresentation](self, "sendCopyRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

  }
  else
  {
    -[SFCollaborationItem itemProvider](self, "itemProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "supportsShareSheetSendCopyRepresentation");

    if (v5)
    {
      -[SFCollaborationItem setIsLoadingSendCopyRepresentation:](self, "setIsLoadingSendCopyRepresentation:", 1);
      location = 0;
      objc_initWeak(&location, self);
      -[SFCollaborationItem itemProvider](self, "itemProvider");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __58__SFCollaborationItem__loadSendCopyRepresentationIfNeeded__block_invoke;
      v7[3] = &unk_1E482FDE8;
      objc_copyWeak(&v8, &location);
      +[SFCollaborationUtilities loadSendCopyRepresentationIfNeededForItemProvider:completion:](SFCollaborationUtilities, "loadSendCopyRepresentationIfNeededForItemProvider:completion:", v6, v7);

      objc_destroyWeak(&v8);
      objc_destroyWeak(&location);
    }
  }
}

void __58__SFCollaborationItem__loadSendCopyRepresentationIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__SFCollaborationItem__loadSendCopyRepresentationIfNeeded__block_invoke_2;
  v5[3] = &unk_1E482DBA8;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v7);
}

void __58__SFCollaborationItem__loadSendCopyRepresentationIfNeeded__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_didLoadSendCopyRepresentation:", *(_QWORD *)(a1 + 32));

}

- (void)_didLoadMetadata:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  share_sheet_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412290;
    v12 = v4;
    _os_log_impl(&dword_1A2830000, v5, OS_LOG_TYPE_DEFAULT, "did load metadata:%@", (uint8_t *)&v11, 0xCu);
  }

  share_sheet_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "defaultShareOptions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[SFCollaborationUtilities descriptionForShareOptions:](SFCollaborationUtilities, "descriptionForShareOptions:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412290;
    v12 = v8;
    _os_log_impl(&dword_1A2830000, v6, OS_LOG_TYPE_DEFAULT, "loaded options:%@", (uint8_t *)&v11, 0xCu);

  }
  -[SFCollaborationItem setIsLoadingMetadata:](self, "setIsLoadingMetadata:", 0);
  if (v4)
  {
    -[SFCollaborationItem setMetadata:](self, "setMetadata:", v4);
    objc_msgSend(v4, "defaultShareOptions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCollaborationItem setShareOptions:](self, "setShareOptions:", v9);

    -[SFCollaborationItem changePublisher](self, "changePublisher");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "publishChangeDescriptor:forObservable:", 1, self);

  }
  -[SFCollaborationItem _updateLoadingState](self, "_updateLoadingState");

}

- (void)_didLoadOptions:(id)a3 ckOptions:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  share_sheet_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    +[SFCollaborationUtilities descriptionForShareOptions:](SFCollaborationUtilities, "descriptionForShareOptions:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412290;
    v11 = v9;
    _os_log_impl(&dword_1A2830000, v8, OS_LOG_TYPE_DEFAULT, "did load options:%@", (uint8_t *)&v10, 0xCu);

  }
  -[SFCollaborationItem setIsLoadingOptions:](self, "setIsLoadingOptions:", 0);
  if (v7 && -[SFCollaborationItem type](self, "type") == 1)
    -[SFCollaborationItem setCkOptions:](self, "setCkOptions:", v7);
  if (v6)
    -[SFCollaborationItem setShareOptions:](self, "setShareOptions:", v6);
  -[SFCollaborationItem _updateLoadingState](self, "_updateLoadingState");

}

- (void)_didLoadSendCopyRepresentation:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  share_sheet_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_1A2830000, v5, OS_LOG_TYPE_DEFAULT, "did load send copy representation:%@", (uint8_t *)&v7, 0xCu);
  }

  -[SFCollaborationItem setIsLoadingSendCopyRepresentation:](self, "setIsLoadingSendCopyRepresentation:", 0);
  if (v4)
  {
    -[SFCollaborationItem setSendCopyRepresentation:](self, "setSendCopyRepresentation:", v4);
    -[SFCollaborationItem changePublisher](self, "changePublisher");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "publishChangeDescriptor:forObservable:", 8, self);

  }
  -[SFCollaborationItem _updateLoadingState](self, "_updateLoadingState");

}

- (void)setCanAddPeople:(id)a3
{
  id v5;
  NSObject *v6;
  int v7;
  const __CFString *v8;
  void *v9;
  int v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    share_sheet_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = objc_msgSend(v5, "BOOLValue");
      v8 = CFSTR("NO");
      if (v7)
        v8 = CFSTR("YES");
      v10 = 138412290;
      v11 = v8;
      _os_log_impl(&dword_1A2830000, v6, OS_LOG_TYPE_DEFAULT, "did load can add people:%@", (uint8_t *)&v10, 0xCu);
    }

    -[SFCollaborationItem setIsLoadingCanAddPeople:](self, "setIsLoadingCanAddPeople:", 0);
    objc_storeStrong((id *)&self->_canAddPeople, a3);
    -[SFCollaborationItem changePublisher](self, "changePublisher");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "publishChangeDescriptor:forObservable:", 16, self);

    -[SFCollaborationItem _updateLoadingState](self, "_updateLoadingState");
  }

}

- (void)_updateLoadingState
{
  NSObject *v3;
  void *v4;
  int v5;
  SFCollaborationItem *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (!-[SFCollaborationItem isLoading](self, "isLoading"))
  {
    share_sheet_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 138412290;
      v6 = self;
      _os_log_impl(&dword_1A2830000, v3, OS_LOG_TYPE_DEFAULT, "Did finish loading for collaboration item:%@", (uint8_t *)&v5, 0xCu);
    }

    -[SFCollaborationItem changePublisher](self, "changePublisher");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "publishChangeDescriptor:forObservable:", 4, self);

  }
}

- (BOOL)isLoading
{
  return -[SFCollaborationItem isLoadingMetadata](self, "isLoadingMetadata")
      || -[SFCollaborationItem isLoadingOptions](self, "isLoadingOptions")
      || -[SFCollaborationItem isLoadingSendCopyRepresentation](self, "isLoadingSendCopyRepresentation")
      || -[SFCollaborationItem isLoadingCanAddPeople](self, "isLoadingCanAddPeople");
}

- (void)registerChangeObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SFCollaborationItem changePublisher](self, "changePublisher");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerChangeObserver:", v4);

}

- (void)unregisterChangeObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SFCollaborationItem changePublisher](self, "changePublisher");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unregisterChangeObserver:", v4);

}

- (id)_defaultLoadingOptionsSummary
{
  return 0;
}

- (id)createCollaborationFooterViewModel
{
  void *v2;
  void *v3;
  objc_class *v4;
  void *v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  -[SFCollaborationItem _optionsSummary](self, "_optionsSummary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v8 = 0;
    v9 = &v8;
    v10 = 0x2050000000;
    v3 = (void *)getSLCollaborationFooterViewModelClass_softClass;
    v11 = getSLCollaborationFooterViewModelClass_softClass;
    if (!getSLCollaborationFooterViewModelClass_softClass)
    {
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __getSLCollaborationFooterViewModelClass_block_invoke;
      v7[3] = &unk_1E482D680;
      v7[4] = &v8;
      __getSLCollaborationFooterViewModelClass_block_invoke((uint64_t)v7);
      v3 = (void *)v9[3];
    }
    v4 = objc_retainAutorelease(v3);
    _Block_object_dispose(&v8, 8);
    v5 = (void *)objc_msgSend([v4 alloc], "initWithTitle:subtitle:", 0, 0);
    objc_msgSend(v5, "setOptionsSummary:", v2);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_optionsSummary
{
  void *v3;
  const __CFString *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;

  if (!-[SFCollaborationItem _canShowOptions](self, "_canShowOptions"))
    goto LABEL_10;
  if (!-[SFCollaborationItem isLoading](self, "isLoading"))
  {
    -[SFCollaborationItem canAddPeople](self, "canAddPeople");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      -[SFCollaborationItem canAddPeople](self, "canAddPeople");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "BOOLValue");

      if (!v8)
      {
        v4 = CFSTR("SHARE_OPTIONS_CANNOT_ADD");
        goto LABEL_12;
      }
    }
    -[SFCollaborationItem shareOptions](self, "shareOptions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "summary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
      return v3;
    -[SFCollaborationItem options](self, "options");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v4 = CFSTR("SHARE_OPTIONS");
      goto LABEL_12;
    }
LABEL_10:
    v3 = 0;
    return v3;
  }
  -[SFCollaborationItem _defaultLoadingOptionsSummary](self, "_defaultLoadingOptionsSummary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = CFSTR("PREPARING_SHARE_OPTIONS");
LABEL_12:
    SFLocalizedStringForKey(v4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (BOOL)_canShowOptions
{
  return 1;
}

- (void)setShareOptions:(id)a3
{
  NSArray *v5;
  NSArray *options;
  void *v7;
  _SWCollaborationShareOptions *v8;

  v8 = (_SWCollaborationShareOptions *)a3;
  if (self->_shareOptions != v8)
  {
    objc_storeStrong((id *)&self->_shareOptions, a3);
    -[_SWCollaborationShareOptions optionsGroups](v8, "optionsGroups");
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    options = self->_options;
    self->_options = v5;

    -[SFCollaborationItem changePublisher](self, "changePublisher");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "publishChangeDescriptor:forObservable:", 2, self);

  }
}

- (void)setCloudSharingResult:(id)a3
{
  SFCollaborationCloudSharingResult *v5;
  void *v6;
  _BOOL4 v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint8_t buf[8];
  id v15;

  v5 = (SFCollaborationCloudSharingResult *)a3;
  if (self->_cloudSharingResult != v5)
  {
    objc_storeStrong((id *)&self->_cloudSharingResult, a3);
    if (-[SFCollaborationItem type](self, "type") == 1)
    {
      -[SFCollaborationCloudSharingResult error](v5, "error");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 0;
      v7 = +[SFCollaborationUtilities isOplockError:updatedShare:](SFCollaborationUtilities, "isOplockError:updatedShare:", v6, &v15);
      v8 = v15;

      if (v7 && v8)
      {
        share_sheet_log();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A2830000, v9, OS_LOG_TYPE_DEFAULT, "Received updated share from oplock error, updating options", buf, 2u);
        }

        -[SFCollaborationItem setUpdatedShare:](self, "setUpdatedShare:", v8);
        -[SFCollaborationItem setIsLoadingOptions:](self, "setIsLoadingOptions:", 1);
        -[SFCollaborationItem ckOptions](self, "ckOptions");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 0;
        +[SFCollaborationUtilities optionsFromCKShare:previousCKOptions:newCKOptions:](SFCollaborationUtilities, "optionsFromCKShare:previousCKOptions:newCKOptions:", v8, v10, &v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v13;
        -[SFCollaborationItem _didLoadOptions:ckOptions:](self, "_didLoadOptions:ckOptions:", v11, v12);

      }
    }
  }

}

- (_SWCollaborationShareOptions)shareOptions
{
  return self->_shareOptions;
}

- (NSArray)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (SFCollaborationMetadata)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (SFCollaborationCloudSharingResult)cloudSharingResult
{
  return self->_cloudSharingResult;
}

- (NSString)contentIdentifier
{
  return self->_contentIdentifier;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSItemProvider)itemProvider
{
  return self->_itemProvider;
}

- (void)setItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_itemProvider, a3);
}

- (id)activityItem
{
  return self->_activityItem;
}

- (void)setActivityItem:(id)a3
{
  objc_storeStrong(&self->_activityItem, a3);
}

- (id)placeholderActivityItem
{
  return self->_placeholderActivityItem;
}

- (void)setPlaceholderActivityItem:(id)a3
{
  objc_storeStrong(&self->_placeholderActivityItem, a3);
}

- (NSArray)sendCopyActivityItems
{
  return self->_sendCopyActivityItems;
}

- (void)setSendCopyActivityItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSArray)sendCopyActivityItemValues
{
  return self->_sendCopyActivityItemValues;
}

- (void)setSendCopyActivityItemValues:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (BOOL)defaultCollaboration
{
  return self->_defaultCollaboration;
}

- (void)setDefaultCollaboration:(BOOL)a3
{
  self->_defaultCollaboration = a3;
}

- (NSNumber)canAddPeople
{
  return self->_canAddPeople;
}

- (BOOL)isLoadingMetadata
{
  return self->_isLoadingMetadata;
}

- (void)setIsLoadingMetadata:(BOOL)a3
{
  self->_isLoadingMetadata = a3;
}

- (BOOL)isLoadingOptions
{
  return self->_isLoadingOptions;
}

- (void)setIsLoadingOptions:(BOOL)a3
{
  self->_isLoadingOptions = a3;
}

- (BOOL)isLoadingSendCopyRepresentation
{
  return self->_isLoadingSendCopyRepresentation;
}

- (void)setIsLoadingSendCopyRepresentation:(BOOL)a3
{
  self->_isLoadingSendCopyRepresentation = a3;
}

- (BOOL)isLoadingCanAddPeople
{
  return self->_isLoadingCanAddPeople;
}

- (void)setIsLoadingCanAddPeople:(BOOL)a3
{
  self->_isLoadingCanAddPeople = a3;
}

- (LPLinkMetadata)linkMetadata
{
  return self->_linkMetadata;
}

- (void)setLinkMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_linkMetadata, a3);
}

- (NSError)metadataLoadError
{
  return self->_metadataLoadError;
}

- (void)setMetadataLoadError:(id)a3
{
  objc_storeStrong((id *)&self->_metadataLoadError, a3);
}

- (id)sendCopyRepresentation
{
  return self->_sendCopyRepresentation;
}

- (void)setSendCopyRepresentation:(id)a3
{
  objc_storeStrong(&self->_sendCopyRepresentation, a3);
}

- (SFChangePublisher)changePublisher
{
  return self->_changePublisher;
}

- (void)setChangePublisher:(id)a3
{
  objc_storeStrong((id *)&self->_changePublisher, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changePublisher, 0);
  objc_storeStrong(&self->_sendCopyRepresentation, 0);
  objc_storeStrong((id *)&self->_metadataLoadError, 0);
  objc_storeStrong((id *)&self->_linkMetadata, 0);
  objc_storeStrong((id *)&self->_canAddPeople, 0);
  objc_storeStrong((id *)&self->_sendCopyActivityItemValues, 0);
  objc_storeStrong((id *)&self->_sendCopyActivityItems, 0);
  objc_storeStrong(&self->_placeholderActivityItem, 0);
  objc_storeStrong(&self->_activityItem, 0);
  objc_storeStrong((id *)&self->_itemProvider, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_contentIdentifier, 0);
  objc_storeStrong((id *)&self->_cloudSharingResult, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_shareOptions, 0);
}

@end
