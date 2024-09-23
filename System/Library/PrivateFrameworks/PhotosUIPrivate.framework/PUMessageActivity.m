@implementation PUMessageActivity

- (BOOL)canPerformWithActivityItems:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  char v9;
  NSObject *v10;
  uint64_t v11;
  int v12;
  char v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  char v17;
  objc_super v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v19.receiver = self;
  v19.super_class = (Class)PUMessageActivity;
  if (!-[UIMessageActivity canPerformWithActivityItems:](&v19, sel_canPerformWithActivityItems_, a3))
    return 0;
  -[PUMessageActivity itemSourceController](self, "itemSourceController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "photoLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = PXCMMHasSendAndReceiveCapabilities();
  }
  else
  {
    PLSharingGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = objc_msgSend(v5, "count");
      *(_DWORD *)buf = 138412546;
      v21 = v4;
      v22 = 2048;
      v23 = v11;
      _os_log_impl(&dword_1AAB61000, v10, OS_LOG_TYPE_ERROR, "Share Sheet: PUMessageActivity had a nil photo library from itemSourceController: %@, number of assets: %lu", buf, 0x16u);
    }

    v8 = 0;
  }
  v12 = objc_msgSend(v4, "itemSourcesSupportMomentShareLinkCreation");
  v13 = objc_msgSend(v4, "shouldUseMomentShareLinkInMessagesIfThresholdMet");
  if (PLCPLIsExceedingPrimarySyncQuota())
  {
    PLSharingGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AAB61000, v14, OS_LOG_TYPE_DEFAULT, "Share Sheet: User's account is exceeding CPL quota, but still showing Messages as an iCloud Link option, so we can show a proper error message if they choose it.", buf, 2u);
    }

  }
  objc_msgSend(MEMORY[0x1E0D7B280], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "cmmShareSheetBehavior");

  if (v16 == 3)
    v17 = 1;
  else
    v17 = v13;
  if ((v8 & v12) == 1 && (v17 & 1) != 0)
    v9 = 1;
  else
    v9 = objc_msgSend((id)objc_opt_class(), "canPerformActivityAsIndividualItemsInSourceController:", v4);

  return v9;
}

- (void)_prepareWithMomentShareLink:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  const char *v13;
  NSObject *v14;
  os_log_type_t v15;
  objc_super v16;
  objc_super v17;
  objc_super v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    if (PLIsMobileSlideShow())
    {
      PXMessageForMomentShareURL();
      v5 = objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        v6 = (void *)v5;
        v18.receiver = self;
        v18.super_class = (Class)PUMessageActivity;
        -[UIMessageActivity prepareWithActivityItems:](&v18, sel_prepareWithActivityItems_, MEMORY[0x1E0C9AA60]);
        PLSharingGetLog();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v4, "pl_redactedShareURL");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v21 = v8;
          _os_log_impl(&dword_1AAB61000, v7, OS_LOG_TYPE_DEFAULT, "Share Sheet: Staging Live Bubble for moment share URL: %{public}@", buf, 0xCu);

        }
        -[UIMessageActivity messageComposeViewController](self, "messageComposeViewController");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setMessage:", v6);

        goto LABEL_16;
      }
      PLSharingGetLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v4, "pl_redactedShareURL");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v21 = v12;
        v13 = "Share Sheet: Unable to create MSMessage for URL: %{public}@. Falling back to plain link";
        v14 = v11;
        v15 = OS_LOG_TYPE_ERROR;
        goto LABEL_14;
      }
    }
    else
    {
      PLSharingGetLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v4, "pl_redactedShareURL");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v21 = v12;
        v13 = "Share Sheet: Live Bubbles not supported. Sending moment share URL as text: %{public}@";
        v14 = v11;
        v15 = OS_LOG_TYPE_DEFAULT;
LABEL_14:
        _os_log_impl(&dword_1AAB61000, v14, v15, v13, buf, 0xCu);

      }
    }

    v19 = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v17.receiver = self;
    v17.super_class = (Class)PUMessageActivity;
    -[UIMessageActivity prepareWithActivityItems:](&v17, sel_prepareWithActivityItems_, v6);
LABEL_16:

    goto LABEL_17;
  }
  PLSharingGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AAB61000, v10, OS_LOG_TYPE_ERROR, "Share Sheet: Missing URL to share via Messages", buf, 2u);
  }

  v16.receiver = self;
  v16.super_class = (Class)PUMessageActivity;
  -[UIMessageActivity prepareWithActivityItems:](&v16, sel_prepareWithActivityItems_, MEMORY[0x1E0C9AA60]);
LABEL_17:

}

- (void)prepareWithActivityItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  objc_super v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PUMessageActivity itemSourceController](self, "itemSourceController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "publishedURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v5, "publishedURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUMessageActivity _prepareWithMomentShareLink:](self, "_prepareWithMomentShareLink:", v7);

  }
  else
  {
    v22.receiver = self;
    v22.super_class = (Class)PUMessageActivity;
    -[UIMessageActivity prepareWithActivityItems:](&v22, sel_prepareWithActivityItems_, v4);
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[PUMessageActivity itemSourceController](self, "itemSourceController", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "assetItemSources");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v19;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v14), "asset");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "uuid");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v16);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v12);
  }

  -[UIMessageActivity messageComposeViewController](self, "messageComposeViewController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setPhotoIDs:", v8);

}

- (id)activityViewController
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v7;
  objc_super v8;
  uint8_t buf[16];

  -[PUMessageActivity itemSourceController](self, "itemSourceController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "momentSharePublishAttempted")
    && (objc_msgSend(v3, "publishedURL"), v4 = (void *)objc_claimAutoreleasedReturnValue(), v4, !v4))
  {
    PLSharingGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AAB61000, v7, OS_LOG_TYPE_ERROR, "Share Sheet: Failed to get anything to share to Messages. Skipping compose presentation", buf, 2u);
    }

    v5 = 0;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)PUMessageActivity;
    -[UIMessageActivity activityViewController](&v8, sel_activityViewController);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (void)performActivity
{
  void *v3;
  void *v4;
  NSObject *v5;
  objc_super v6;
  uint8_t buf[16];

  -[PUMessageActivity itemSourceController](self, "itemSourceController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "momentSharePublishAttempted")
    && (objc_msgSend(v3, "publishedURL"), v4 = (void *)objc_claimAutoreleasedReturnValue(), v4, !v4))
  {
    PLSharingGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AAB61000, v5, OS_LOG_TYPE_ERROR, "Share Sheet: Immediately failing Message activity for missing moment share URL", buf, 2u);
    }

    -[UIActivity activityDidFinish:](self, "activityDidFinish:", 0);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)PUMessageActivity;
    -[UIActivity performActivity](&v6, sel_performActivity);
  }

}

- (PXActivityItemSourceController)itemSourceController
{
  return (PXActivityItemSourceController *)objc_loadWeakRetained((id *)&self->_itemSourceController);
}

- (void)setItemSourceController:(id)a3
{
  objc_storeWeak((id *)&self->_itemSourceController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_itemSourceController);
}

+ (BOOL)canPerformActivityAsIndividualItemsInSourceController:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  BOOL v9;

  v3 = a3;
  objc_msgSend(v3, "assetItemSources");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  v6 = objc_msgSend(v3, "preferredPreparationType");
  objc_msgSend(MEMORY[0x1E0D7B980], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "maxMessagesAssetLimit");

  if (v6)
    v9 = 1;
  else
    v9 = v8 == 0;
  return v9 || v5 <= v8;
}

@end
