@implementation _SFFPShareCollaborationItem

- (_SFFPShareCollaborationItem)initWithFileURL:(id)a3 itemProvider:(id)a4 activityItem:(id)a5 defaultCollaboration:(BOOL)a6 managedFileURL:(id)a7
{
  _BOOL8 v8;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  _SFFPShareCollaborationItem *v19;
  NSObject *v20;
  const char *v21;
  const char *v22;
  _BOOL4 isInSharedFolder;
  _BOOL4 isThirdPartyFileProviderBacked;
  const char *v25;
  const char *v26;
  objc_super v28;
  uint8_t buf[4];
  _SFFPShareCollaborationItem *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  const char *v40;
  uint64_t v41;

  v8 = a6;
  v41 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  if (!v14)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v17 = v15;
    else
      v17 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36C8]), "initWithObject:", v13);
    v14 = v17;
  }
  if (v13 && v14 && (objc_msgSend(v14, "canLoadObjectOfClass:", objc_opt_class()) & 1) == 0)
    objc_msgSend(v14, "registerObject:visibility:", v13, 0);
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://www.apple.com/icloud/"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v28.receiver = self;
  v28.super_class = (Class)_SFFPShareCollaborationItem;
  v19 = -[SFCollaborationItem initWithItemProvider:activityItem:placeholderActivityItem:defaultCollaboration:](&v28, sel_initWithItemProvider_activityItem_placeholderActivityItem_defaultCollaboration_, v14, v15, v18, v8);
  if (v19)
  {
    v19->_isShared = +[SFCollaborationUtilities isSharedFileURL:isLocalStorageFileURL:isiCloudDriveFileURL:isInSharedFolder:](SFCollaborationUtilities, "isSharedFileURL:isLocalStorageFileURL:isiCloudDriveFileURL:isInSharedFolder:", v13, &v19->_isLocalStorage, &v19->_isiCloudDrive, &v19->_isInSharedFolder);
    v19->_isThirdPartyFileProviderBacked = +[SFCollaborationUtilities isThirdPartyFileProviderBackedURL:](SFCollaborationUtilities, "isThirdPartyFileProviderBackedURL:", v13);
    objc_storeStrong((id *)&v19->_fileURL, a3);
    objc_storeStrong((id *)&v19->_managedFileURL, a7);
    -[SFCollaborationItem setType:](v19, "setType:", 0);
    share_sheet_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = "yes";
      if (v19->_isShared)
        v22 = "yes";
      else
        v22 = "no";
      isInSharedFolder = v19->_isInSharedFolder;
      isThirdPartyFileProviderBacked = v19->_isThirdPartyFileProviderBacked;
      if (v19->_isiCloudDrive)
        v25 = "yes";
      else
        v25 = "no";
      *(_DWORD *)buf = 138413570;
      if (isInSharedFolder)
        v26 = "yes";
      else
        v26 = "no";
      v30 = v19;
      v31 = 2112;
      if (!isThirdPartyFileProviderBacked)
        v21 = "no";
      v32 = v13;
      v33 = 2080;
      v34 = v22;
      v35 = 2080;
      v36 = v25;
      v37 = 2080;
      v38 = v26;
      v39 = 2080;
      v40 = v21;
      _os_log_impl(&dword_1A2830000, v20, OS_LOG_TYPE_DEFAULT, "%@: fileURL:%@ isShared:%s isiCloudDrive:%s isInSharedFolder:%s isThirdPartyFileProviderBacked:%s", buf, 0x3Eu);
    }

    -[_SFFPShareCollaborationItem _loadMetadataIfNeeded](v19, "_loadMetadataIfNeeded");
  }

  return v19;
}

- (NSString)additionalContentIdentifier
{
  return (NSString *)CFSTR("com.apple.sharing.collaborationuserdefaults.content-identifier.file-urls");
}

- (void)_loadMetadataIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _SFFPShareCollaborationItem *v12;

  -[_SFFPShareCollaborationItem fileURL](self, "fileURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[_SFFPShareCollaborationItem managedFileURL](self, "managedFileURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      v6 = v4;
    }
    else
    {
      -[_SFFPShareCollaborationItem fileURL](self, "fileURL");
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    v7 = v6;

    -[SFCollaborationItem setIsLoadingMetadata:](self, "setIsLoadingMetadata:", 1);
    -[SFCollaborationItem workQueue](self, "workQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __52___SFFPShareCollaborationItem__loadMetadataIfNeeded__block_invoke;
    v10[3] = &unk_1E482D3A0;
    v11 = v7;
    v12 = self;
    v9 = v7;
    dispatch_async(v8, v10);

  }
}

- (BOOL)isCollaborativeURL
{
  BOOL v3;
  void *v4;

  if (-[_SFFPShareCollaborationItem isiCloudDrive](self, "isiCloudDrive"))
    return 1;
  if (-[_SFFPShareCollaborationItem isiCloudDrive](self, "isiCloudDrive"))
    return 0;
  -[SFCollaborationItem metadata](self, "metadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v4 != 0;

  return v3;
}

- (BOOL)hasSeparateSendCopyRepresentation
{
  void *v2;
  BOOL v3;

  -[SFCollaborationItem itemProvider](self, "itemProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[SFCollaborationUtilities hasiWorkSendCopyRepresentationForItemProvider:](SFCollaborationUtilities, "hasiWorkSendCopyRepresentationForItemProvider:", v2);

  return v3;
}

- (id)_defaultLoadingOptionsSummary
{
  void *v3;

  if (-[_SFFPShareCollaborationItem isiCloudDrive](self, "isiCloudDrive")
    && !-[_SFFPShareCollaborationItem isShared](self, "isShared"))
  {
    +[SFCollaborationUtilities defaultCKOptionsSummary](SFCollaborationUtilities, "defaultCKOptionsSummary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)loadCopyRepresentationURLWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v4 = a3;
  if (-[_SFFPShareCollaborationItem hasSeparateSendCopyRepresentation](self, "hasSeparateSendCopyRepresentation")
    && (-[_SFFPShareCollaborationItem sendCopyRepresentationURL](self, "sendCopyRepresentationURL"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        !v5))
  {
    location = 0;
    objc_initWeak(&location, self);
    -[SFCollaborationItem itemProvider](self, "itemProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __78___SFFPShareCollaborationItem_loadCopyRepresentationURLWithCompletionHandler___block_invoke;
    v9[3] = &unk_1E482FE60;
    objc_copyWeak(&v11, &location);
    v10 = v4;
    +[SFCollaborationUtilities loadiWorkCopyRepresentationURLForItemProvider:completionHandler:](SFCollaborationUtilities, "loadiWorkCopyRepresentationURLForItemProvider:completionHandler:", v8, v9);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  else
  {
    -[_SFFPShareCollaborationItem sendCopyRepresentationURL](self, "sendCopyRepresentationURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      (*((void (**)(id, void *))v4 + 2))(v4, v6);
    }
    else
    {
      -[_SFFPShareCollaborationItem fileURL](self, "fileURL");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *))v4 + 2))(v4, v7);

    }
  }

}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (BOOL)isLocalStorage
{
  return self->_isLocalStorage;
}

- (BOOL)isiCloudDrive
{
  return self->_isiCloudDrive;
}

- (BOOL)isThirdPartyFileProviderBacked
{
  return self->_isThirdPartyFileProviderBacked;
}

- (BOOL)isShared
{
  return self->_isShared;
}

- (BOOL)isInSharedFolder
{
  return self->_isInSharedFolder;
}

- (NSURL)sendCopyRepresentationURL
{
  return self->_sendCopyRepresentationURL;
}

- (void)setSendCopyRepresentationURL:(id)a3
{
  objc_storeStrong((id *)&self->_sendCopyRepresentationURL, a3);
}

- (NSURL)managedFileURL
{
  return self->_managedFileURL;
}

- (void)setManagedFileURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managedFileURL, 0);
  objc_storeStrong((id *)&self->_sendCopyRepresentationURL, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
}

@end
