@implementation _SFSWYCollaborationItem

- (_SFSWYCollaborationItem)initWithItemProvider:(id)a3 activityItem:(id)a4 isURLProviderSupported:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  _SFSWYCollaborationItem *v11;
  _SFSWYCollaborationItem *v12;
  _QWORD v14[4];
  _SFSWYCollaborationItem *v15;
  objc_super v16;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://www.apple.com/icloud/"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  v16.receiver = self;
  v16.super_class = (Class)_SFSWYCollaborationItem;
  v11 = -[SFCollaborationItem initWithItemProvider:activityItem:placeholderActivityItem:defaultCollaboration:](&v16, sel_initWithItemProvider_activityItem_placeholderActivityItem_defaultCollaboration_, v8, v9, v10, 1);
  v12 = v11;
  if (v11)
  {
    v11->_isURLProviderSupported = v5;
    -[SFCollaborationItem setType:](v11, "setType:", 2);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __84___SFSWYCollaborationItem_initWithItemProvider_activityItem_isURLProviderSupported___block_invoke;
    v14[3] = &unk_1E482FE88;
    v15 = v12;
    +[SFCollaborationUtilities loadPendingCollaborationForItemProvider:completionHandler:](SFCollaborationUtilities, "loadPendingCollaborationForItemProvider:completionHandler:", v8, v14);

  }
  return v12;
}

- (void)_loadOptionsIfNeeded
{
  NSObject *v2;
  uint8_t v3[16];

  share_sheet_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1A2830000, v2, OS_LOG_TYPE_DEFAULT, "Not loading options for SWY type collaboration item since the item will have metadata", v3, 2u);
  }

}

- (SFPendingCollaboration)pendingCollaboration
{
  return self->_pendingCollaboration;
}

- (BOOL)isURLProviderSupported
{
  return self->_isURLProviderSupported;
}

- (void)setIsURLProviderSupported:(BOOL)a3
{
  self->_isURLProviderSupported = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingCollaboration, 0);
}

@end
