@implementation _SFCKShareCollaborationItem

- (_SFCKShareCollaborationItem)initWithItemProvider:(id)a3 activityItem:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  _SFCKShareCollaborationItem *v10;
  NSObject *v11;
  const char *v12;
  objc_super v14;
  uint8_t buf[4];
  _SFCKShareCollaborationItem *v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)MEMORY[0x1E0C99E98];
  v8 = a4;
  objc_msgSend(v7, "URLWithString:", CFSTR("https://www.apple.com/icloud/"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14.receiver = self;
  v14.super_class = (Class)_SFCKShareCollaborationItem;
  v10 = -[SFCollaborationItem initWithItemProvider:activityItem:placeholderActivityItem:defaultCollaboration:](&v14, sel_initWithItemProvider_activityItem_placeholderActivityItem_defaultCollaboration_, v6, v8, v9, 1);

  if (v10)
  {
    -[SFCollaborationItem setType:](v10, "setType:", 1);
    v10->_isServiceManatee = +[SFCollaborationUtilities isServiceManateeCKShareItemProvider:](SFCollaborationUtilities, "isServiceManateeCKShareItemProvider:", v6);
    share_sheet_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      if (v10->_isServiceManatee)
        v12 = "yes";
      else
        v12 = "no";
      *(_DWORD *)buf = 138412546;
      v16 = v10;
      v17 = 2080;
      v18 = v12;
      _os_log_impl(&dword_1A2830000, v11, OS_LOG_TYPE_DEFAULT, "%@: isServiceManatee:%s", buf, 0x16u);
    }

  }
  return v10;
}

- (BOOL)_canShowOptions
{
  return !-[_SFCKShareCollaborationItem isServiceManatee](self, "isServiceManatee");
}

- (id)_defaultLoadingOptionsSummary
{
  void *v2;
  _BOOL4 v3;
  void *v4;

  -[SFCollaborationItem itemProvider](self, "itemProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[SFCollaborationUtilities isPreCKShareItemProvider:](SFCollaborationUtilities, "isPreCKShareItemProvider:", v2);

  if (v3)
  {
    +[SFCollaborationUtilities defaultCKOptionsSummary](SFCollaborationUtilities, "defaultCKOptionsSummary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (BOOL)isLoading
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_SFCKShareCollaborationItem;
  return -[SFCollaborationItem isLoading](&v4, sel_isLoading)
      || -[_SFCKShareCollaborationItem isLoadingContainerSetupInfo](self, "isLoadingContainerSetupInfo");
}

- (void)_startLoading
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_SFCKShareCollaborationItem;
  -[SFCollaborationItem _startLoading](&v3, sel__startLoading);
  -[_SFCKShareCollaborationItem _loadCKContainerSetupInfoIfNeeded](self, "_loadCKContainerSetupInfoIfNeeded");
}

- (void)_loadCKContainerSetupInfoIfNeeded
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id location;

  -[_SFCKShareCollaborationItem containerSetupInfo](self, "containerSetupInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[_SFCKShareCollaborationItem setIsLoadingContainerSetupInfo:](self, "setIsLoadingContainerSetupInfo:", 1);
    location = 0;
    objc_initWeak(&location, self);
    -[SFCollaborationItem itemProvider](self, "itemProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __64___SFCKShareCollaborationItem__loadCKContainerSetupInfoIfNeeded__block_invoke;
    v5[3] = &unk_1E482FE10;
    objc_copyWeak(&v6, &location);
    +[SFCollaborationUtilities loadCKContainerForItemProvider:completionHandler:](SFCollaborationUtilities, "loadCKContainerForItemProvider:completionHandler:", v4, v5);

    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

- (void)_didLoadContainerSetupInfo:(id)a3
{
  id v4;

  v4 = a3;
  -[_SFCKShareCollaborationItem setIsLoadingContainerSetupInfo:](self, "setIsLoadingContainerSetupInfo:", 0);
  -[_SFCKShareCollaborationItem setContainerSetupInfo:](self, "setContainerSetupInfo:", v4);

  -[SFCollaborationItem _updateLoadingState](self, "_updateLoadingState");
}

- (LPLinkMetadata)linkMetadata
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[_SFCKShareCollaborationItem updatedShare](self, "updatedShare");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[_SFCKShareCollaborationItem containerSetupInfo](self, "containerSetupInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[_SFCKShareCollaborationItem updatedShare](self, "updatedShare");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFCKShareCollaborationItem containerSetupInfo](self, "containerSetupInfo");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[SFCollaborationUtilities createLinkMetadataWithCKShare:containerSetupInfo:](SFCollaborationUtilities, "createLinkMetadataWithCKShare:containerSetupInfo:", v6, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFCKShareCollaborationItem setPostSharelinkMetadata:](self, "setPostSharelinkMetadata:", v8);

    }
  }
  -[_SFCKShareCollaborationItem postSharelinkMetadata](self, "postSharelinkMetadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    -[SFCollaborationItem itemProvider](self, "itemProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[SFCollaborationUtilities createLinkMetadataWithCKShareItemProvider:](SFCollaborationUtilities, "createLinkMetadataWithCKShareItemProvider:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFCKShareCollaborationItem setPostSharelinkMetadata:](self, "setPostSharelinkMetadata:", v11);

  }
  return -[_SFCKShareCollaborationItem postSharelinkMetadata](self, "postSharelinkMetadata");
}

- (BOOL)isServiceManatee
{
  return self->_isServiceManatee;
}

- (CKAllowedSharingOptions)ckOptions
{
  return self->_ckOptions;
}

- (void)setCkOptions:(id)a3
{
  objc_storeStrong((id *)&self->_ckOptions, a3);
}

- (CKShare)updatedShare
{
  return self->_updatedShare;
}

- (void)setUpdatedShare:(id)a3
{
  objc_storeStrong((id *)&self->_updatedShare, a3);
}

- (CKContainerSetupInfo)containerSetupInfo
{
  return self->_containerSetupInfo;
}

- (void)setContainerSetupInfo:(id)a3
{
  objc_storeStrong((id *)&self->_containerSetupInfo, a3);
}

- (BOOL)isLoadingContainerSetupInfo
{
  return self->_isLoadingContainerSetupInfo;
}

- (void)setIsLoadingContainerSetupInfo:(BOOL)a3
{
  self->_isLoadingContainerSetupInfo = a3;
}

- (LPLinkMetadata)postSharelinkMetadata
{
  return self->_postSharelinkMetadata;
}

- (void)setPostSharelinkMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_postSharelinkMetadata, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postSharelinkMetadata, 0);
  objc_storeStrong((id *)&self->_containerSetupInfo, 0);
  objc_storeStrong((id *)&self->_updatedShare, 0);
  objc_storeStrong((id *)&self->_ckOptions, 0);
}

@end
