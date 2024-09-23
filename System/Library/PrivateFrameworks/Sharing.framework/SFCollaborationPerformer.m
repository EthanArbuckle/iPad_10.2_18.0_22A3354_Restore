@implementation SFCollaborationPerformer

- (SFCollaborationPerformer)initWithCollaborationItem:(id)a3 activityType:(id)a4 deviceScreenScale:(double)a5
{
  id v9;
  id v10;
  SFCollaborationPerformer *v11;
  SFCollaborationPerformer *v12;
  uint64_t v13;
  NSString *activityType;
  NSObject *v15;
  NSObject *v16;
  dispatch_queue_t v17;
  OS_dispatch_queue *performQueue;
  objc_super v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v20.receiver = self;
  v20.super_class = (Class)SFCollaborationPerformer;
  v11 = -[SFCollaborationPerformer init](&v20, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_collaborationItem, a3);
    v13 = objc_msgSend(v10, "copy");
    activityType = v12->_activityType;
    v12->_activityType = (NSString *)v13;

    v12->_deviceScreenScale = a5;
    v12->_requiresParticipants = 0;
    share_sheet_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v22 = v9;
      v23 = 2112;
      v24 = v10;
      _os_log_impl(&dword_1A2830000, v15, OS_LOG_TYPE_DEFAULT, "New Collaboration Performer for item:%@ activityType:%@", buf, 0x16u);
    }

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = dispatch_queue_create("com.apple.sharesheet.SFCollaborationPerformer.performQueue", v16);
    performQueue = v12->_performQueue;
    v12->_performQueue = (OS_dispatch_queue *)v17;

  }
  return v12;
}

- (SFCollaborationPerformer)initWithCollaborationItem:(id)a3 activityType:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  SFCollaborationPerformer *v10;

  v8 = a4;
  v9 = a3;
  objc_msgSend(a5, "deviceScreenScale");
  v10 = -[SFCollaborationPerformer initWithCollaborationItem:activityType:deviceScreenScale:](self, "initWithCollaborationItem:activityType:deviceScreenScale:", v9, v8);

  return v10;
}

- (void)perform
{
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  NSObject *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  _BYTE buf[24];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  gelato_sharing_log();
  v3 = objc_claimAutoreleasedReturnValue();
  gelato_sharing_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_signpost_id_make_with_pointer(v4, self->_collaborationItem);

  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A2830000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PerformCollaboration", ", buf, 2u);
  }

  -[SFCollaborationPerformer setDidCancel:](self, "setDidCancel:", 0);
  self->_isRunning = 1;
  share_sheet_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = self;
    _os_log_impl(&dword_1A2830000, v6, OS_LOG_TYPE_DEFAULT, "performing Collaboration Performer:%@", buf, 0xCu);
  }

  -[SFCollaborationPerformer creationDelegate](self, "creationDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    *(_QWORD *)buf = 0;
    objc_initWeak((id *)buf, self);
    -[SFCollaborationPerformer creationDelegate](self, "creationDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCollaborationPerformer collaborationItem](self, "collaborationItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __35__SFCollaborationPerformer_perform__block_invoke;
    v14[3] = &unk_1E482DB08;
    objc_copyWeak(&v15, (id *)buf);
    objc_msgSend(v9, "addParticipantsAllowedForCollaborationItem:completionHandler:", v10, v14);

    objc_destroyWeak(&v15);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    share_sheet_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      -[SFCollaborationPerformer collaborationItem](self, "collaborationItem");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v13;
      _os_log_impl(&dword_1A2830000, v11, OS_LOG_TYPE_DEFAULT, "Collaboration performer for item %@ assuming Add Participants Allowed is true because the creation delegate doesn't implement the delegate function", buf, 0xCu);

    }
    -[SFCollaborationPerformer _performWithAddParticipantsAllowed:](self, "_performWithAddParticipantsAllowed:", 1);
  }
}

void __35__SFCollaborationPerformer_perform__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  char v10;

  v5 = a3;
  if (v5)
  {
    share_sheet_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __35__SFCollaborationPerformer_perform__block_invoke_cold_1((uint64_t)v5, v6, v7);

  }
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __35__SFCollaborationPerformer_perform__block_invoke_17;
  v8[3] = &unk_1E482DAE0;
  objc_copyWeak(&v9, (id *)(a1 + 32));
  v10 = a2;
  sf_dispatch_on_main_queue(v8);
  objc_destroyWeak(&v9);

}

void __35__SFCollaborationPerformer_perform__block_invoke_17(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_performWithAddParticipantsAllowed:", *(unsigned __int8 *)(a1 + 40));

}

- (void)_performWithAddParticipantsAllowed:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  char v13;
  NSObject *v14;
  const __CFString *v15;
  const __CFString *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  const __CFString *v21;
  void *v22;
  char v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  char v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  BOOL v38;
  NSObject *v39;
  void *v40;
  char v41;
  void *v42;
  void *v43;
  void *v44;
  _QWORD v45[4];
  id v46;
  _BYTE buf[12];
  __int16 v48;
  const __CFString *v49;
  uint64_t v50;

  v3 = a3;
  v50 = *MEMORY[0x1E0C80C00];
  -[SFCollaborationPerformer collaborationItem](self, "collaborationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "type");

  if (v6 == 2)
  {
    -[SFCollaborationPerformer collaborationItem](self, "collaborationItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isURLProviderSupported");

    goto LABEL_16;
  }
  -[SFCollaborationPerformer collaborationItem](self, "collaborationItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = +[SFCollaborationUtilities isCollaborationItemPrivateShare:](SFCollaborationUtilities, "isCollaborationItemPrivateShare:", v9);

  -[SFCollaborationPerformer activityType](self, "activityType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.UIKit.activity.Mail")))
  {

  }
  else
  {
    -[SFCollaborationPerformer activityType](self, "activityType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqualToString:", &stru_1E483B8E8);

    if ((v13 & 1) == 0)
    {
      v8 = v3 & v10;
      if (v3 && v10)
        goto LABEL_16;
      share_sheet_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = CFSTR("YES");
        if (v10)
          v16 = CFSTR("NO");
        else
          v16 = CFSTR("YES");
        if (v3)
          v15 = CFSTR("NO");
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v16;
        v48 = 2112;
        v49 = v15;
        _os_log_impl(&dword_1A2830000, v14, OS_LOG_TYPE_DEFAULT, "not requesting Participants for Collaboration creation since access type is public (%@) or adding participants is not allowed (%@)", buf, 0x16u);
      }

    }
  }
  v8 = 0;
LABEL_16:
  -[SFCollaborationPerformer setRequiresParticipants:](self, "setRequiresParticipants:", v8);
  share_sheet_log();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    -[SFCollaborationPerformer collaborationItem](self, "collaborationItem");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "identifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[SFCollaborationPerformer requiresParticipants](self, "requiresParticipants");
    v21 = CFSTR("NO");
    if (v20)
      v21 = CFSTR("YES");
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v19;
    v48 = 2112;
    v49 = v21;
    _os_log_impl(&dword_1A2830000, v17, OS_LOG_TYPE_DEFAULT, "Collaboration performer for item %@ beginning perform with requiresParticipants:%@", buf, 0x16u);

  }
  -[SFCollaborationPerformer delegate](self, "delegate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_opt_respondsToSelector();

  -[SFCollaborationPerformer delegate](self, "delegate");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v23 & 1) != 0)
  {
    objc_msgSend(v24, "didBeginCreationForCollaborationPerformer:requiresAddParticipants:", self, -[SFCollaborationPerformer requiresParticipants](self, "requiresParticipants"));
  }
  else
  {
    v25 = objc_opt_respondsToSelector();

    if ((v25 & 1) == 0)
      goto LABEL_25;
    -[SFCollaborationPerformer delegate](self, "delegate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "didBeginCreationForCollaborationPerformer:", self);
  }

LABEL_25:
  -[SFCollaborationPerformer collaborationItem](self, "collaborationItem");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "metadata");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
  {
LABEL_28:

    goto LABEL_29;
  }
  -[SFCollaborationPerformer collaborationItem](self, "collaborationItem");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "shareOptions");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
  {

    goto LABEL_28;
  }
  -[SFCollaborationPerformer collaborationItem](self, "collaborationItem");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "metadataLoadError");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v37 == 0;

  if (v38)
  {
LABEL_29:
    -[SFCollaborationPerformer collaborationItem](self, "collaborationItem");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v29, "type"))
    {
      -[SFCollaborationPerformer creationDelegate](self, "creationDelegate");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[SFCollaborationPerformer creationDelegate](self, "creationDelegate");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_opt_respondsToSelector();

        if ((v32 & 1) != 0)
        {
          *(_QWORD *)buf = 0;
          objc_initWeak((id *)buf, self);
          -[SFCollaborationPerformer collaborationItem](self, "collaborationItem");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "fileURL");
          v34 = (void *)objc_claimAutoreleasedReturnValue();

          -[SFCollaborationPerformer creationDelegate](self, "creationDelegate");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v45[0] = MEMORY[0x1E0C809B0];
          v45[1] = 3221225472;
          v45[2] = __63__SFCollaborationPerformer__performWithAddParticipantsAllowed___block_invoke;
          v45[3] = &unk_1E482DB58;
          objc_copyWeak(&v46, (id *)buf);
          objc_msgSend(v35, "shareStatusForURL:completionHandler:", v34, v45);

          objc_destroyWeak(&v46);
          objc_destroyWeak((id *)buf);
          return;
        }
        goto LABEL_35;
      }

    }
LABEL_35:
    -[SFCollaborationPerformer _performAfterFolderCheck](self, "_performAfterFolderCheck");
    return;
  }
  share_sheet_log();
  v39 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    -[SFCollaborationPerformer _performWithAddParticipantsAllowed:].cold.1(self, v39);

  -[SFCollaborationPerformer delegate](self, "delegate");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_opt_respondsToSelector();

  if ((v41 & 1) != 0)
  {
    -[SFCollaborationPerformer delegate](self, "delegate");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCollaborationPerformer collaborationItem](self, "collaborationItem");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "metadataLoadError");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "didFailCreationForCollaborationPerformer:error:", self, v44);

  }
  -[SFCollaborationPerformer cancel](self, "cancel");
}

void __63__SFCollaborationPerformer__performWithAddParticipantsAllowed___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  _QWORD v6[4];
  id v7[2];

  v5 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __63__SFCollaborationPerformer__performWithAddParticipantsAllowed___block_invoke_2;
  v6[3] = &unk_1E482DB30;
  v7[1] = a2;
  objc_copyWeak(v7, (id *)(a1 + 32));
  sf_dispatch_on_main_queue(v6);
  objc_destroyWeak(v7);

}

void __63__SFCollaborationPerformer__performWithAddParticipantsAllowed___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id *v2;
  id v3;
  id WeakRetained;
  id v5;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = (id *)(a1 + 32);
  if (v1 == 5)
  {
    WeakRetained = objc_loadWeakRetained(v2);
    objc_msgSend(WeakRetained, "_handleSubitemInSharedFolder");

  }
  else if (v1 == 6)
  {
    v3 = objc_loadWeakRetained(v2);
    objc_msgSend(v3, "_handleUnsharedFolderWithSharedSubitems");

  }
  else
  {
    v5 = objc_loadWeakRetained(v2);
    objc_msgSend(v5, "_performAfterFolderCheck");

  }
}

- (void)_handleUnsharedFolderWithSharedSubitems
{
  NSObject *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  uint8_t buf[8];

  share_sheet_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A2830000, v3, OS_LOG_TYPE_DEFAULT, "Collaboration item is an unshared folder with shared subitems", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  objc_initWeak((id *)buf, self);
  -[SFCollaborationPerformer creationDelegate](self, "creationDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __67__SFCollaborationPerformer__handleUnsharedFolderWithSharedSubitems__block_invoke;
  v5[3] = &unk_1E482DBF8;
  objc_copyWeak(&v6, (id *)buf);
  objc_msgSend(v4, "canShareFolderContainingExistingSharedItemsWithCompletionHandler:", v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak((id *)buf);
}

void __67__SFCollaborationPerformer__handleUnsharedFolderWithSharedSubitems__block_invoke(uint64_t a1, int a2)
{
  NSObject *v3;
  id *v4;
  id WeakRetained;
  id v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[16];

  if (a2)
  {
    share_sheet_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A2830000, v3, OS_LOG_TYPE_DEFAULT, "Received user permission to override shared subitems", buf, 2u);
    }

    v4 = (id *)(a1 + 32);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __67__SFCollaborationPerformer__handleUnsharedFolderWithSharedSubitems__block_invoke_34;
    v7[3] = &unk_1E482DBD0;
    objc_copyWeak(&v8, v4);
    objc_msgSend(WeakRetained, "_createCollaborationRequestWithCompletionHandler:", v7);

    objc_destroyWeak(&v8);
  }
  else
  {
    v6 = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(v6, "cancel");

  }
}

void __67__SFCollaborationPerformer__handleUnsharedFolderWithSharedSubitems__block_invoke_34(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __67__SFCollaborationPerformer__handleUnsharedFolderWithSharedSubitems__block_invoke_2;
  v5[3] = &unk_1E482DBA8;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v4 = v3;
  v6 = v4;
  sf_dispatch_on_main_queue(v5);

  objc_destroyWeak(&v7);
}

void __67__SFCollaborationPerformer__handleUnsharedFolderWithSharedSubitems__block_invoke_2(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "creationDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __67__SFCollaborationPerformer__handleUnsharedFolderWithSharedSubitems__block_invoke_3;
  v6[3] = &unk_1E482DB80;
  objc_copyWeak(&v7, v2);
  objc_msgSend(v4, "createSharingURLForCollaborationRequest:completionHandler:", v5, v6);

  objc_destroyWeak(&v7);
}

void __67__SFCollaborationPerformer__handleUnsharedFolderWithSharedSubitems__block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_performAfterFolderCheck");

}

- (void)_handleSubitemInSharedFolder
{
  NSObject *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[8];

  share_sheet_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A2830000, v3, OS_LOG_TYPE_DEFAULT, "Collaboration item is a file in a shared folder", buf, 2u);
  }

  -[SFCollaborationPerformer creationDelegate](self, "creationDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[SFCollaborationPerformer creationDelegate](self, "creationDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      *(_QWORD *)buf = 0;
      objc_initWeak((id *)buf, self);
      -[SFCollaborationPerformer creationDelegate](self, "creationDelegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __56__SFCollaborationPerformer__handleSubitemInSharedFolder__block_invoke;
      v8[3] = &unk_1E482DBF8;
      objc_copyWeak(&v9, (id *)buf);
      objc_msgSend(v7, "canManageShareForDocumentInSharedFolderWithCompletionHandler:", v8);

      objc_destroyWeak(&v9);
      objc_destroyWeak((id *)buf);
      return;
    }
  }
  else
  {

  }
  -[SFCollaborationPerformer _performAfterFolderCheck](self, "_performAfterFolderCheck");
}

void __56__SFCollaborationPerformer__handleSubitemInSharedFolder__block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (a2)
  {
    objc_msgSend(WeakRetained, "creationDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "manageShareForDocumentInSharedFolder");

  }
  else
  {
    objc_msgSend(WeakRetained, "cancel");
  }

}

- (void)_createSharingURLForCollaborationRequest:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  id *v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  id location;

  v4 = a3;
  location = 0;
  objc_initWeak(&location, self);
  if (!-[SFCollaborationPerformer requiresParticipants](self, "requiresParticipants"))
  {
    -[SFCollaborationPerformer creationDelegate](self, "creationDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __69__SFCollaborationPerformer__createSharingURLForCollaborationRequest___block_invoke_44;
    v10[3] = &unk_1E482DB80;
    v8 = &v11;
    objc_copyWeak(&v11, &location);
    objc_msgSend(v7, "createSharingURLForCollaborationRequest:completionHandler:", v4, v10);
    goto LABEL_5;
  }
  -[SFCollaborationPerformer creationDelegate](self, "creationDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[SFCollaborationPerformer creationDelegate](self, "creationDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __69__SFCollaborationPerformer__createSharingURLForCollaborationRequest___block_invoke;
    v12[3] = &unk_1E482DB80;
    v8 = &v13;
    objc_copyWeak(&v13, &location);
    objc_msgSend(v7, "createSharingURLWithParticipantsForCollaborationRequest:completionHandler:", v4, v12);
LABEL_5:

    objc_destroyWeak(v8);
    goto LABEL_9;
  }
  share_sheet_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    -[SFCollaborationPerformer _createSharingURLForCollaborationRequest:].cold.1(v9);

  -[SFCollaborationPerformer cancel](self, "cancel");
LABEL_9:
  objc_destroyWeak(&location);

}

void __69__SFCollaborationPerformer__createSharingURLForCollaborationRequest___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __69__SFCollaborationPerformer__createSharingURLForCollaborationRequest___block_invoke_2;
  v5[3] = &unk_1E482DC20;
  v4 = v3;
  v6 = v4;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  sf_dispatch_on_main_queue(v5);
  objc_destroyWeak(&v7);

}

void __69__SFCollaborationPerformer__createSharingURLForCollaborationRequest___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  objc_msgSend(*(id *)(a1 + 32), "error");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "sharingURL");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
      objc_msgSend(WeakRetained, "cancel");
      goto LABEL_5;
    }
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_didCreateCollaborationWithResult:", *(_QWORD *)(a1 + 32));
LABEL_5:

}

void __69__SFCollaborationPerformer__createSharingURLForCollaborationRequest___block_invoke_44(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __69__SFCollaborationPerformer__createSharingURLForCollaborationRequest___block_invoke_2_45;
  v5[3] = &unk_1E482DBA8;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v4 = v3;
  v6 = v4;
  sf_dispatch_on_main_queue(v5);

  objc_destroyWeak(&v7);
}

void __69__SFCollaborationPerformer__createSharingURLForCollaborationRequest___block_invoke_2_45(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_didCreateCollaborationWithResult:", *(_QWORD *)(a1 + 32));

}

- (void)_performAfterFolderCheck
{
  _QWORD v3[4];
  id v4;
  id location;

  location = 0;
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __52__SFCollaborationPerformer__performAfterFolderCheck__block_invoke;
  v3[3] = &unk_1E482DBD0;
  objc_copyWeak(&v4, &location);
  -[SFCollaborationPerformer _createCollaborationRequestWithCompletionHandler:](self, "_createCollaborationRequestWithCompletionHandler:", v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __52__SFCollaborationPerformer__performAfterFolderCheck__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__SFCollaborationPerformer__performAfterFolderCheck__block_invoke_2;
  v5[3] = &unk_1E482DBA8;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v4 = v3;
  v6 = v4;
  sf_dispatch_on_main_queue(v5);

  objc_destroyWeak(&v7);
}

void __52__SFCollaborationPerformer__performAfterFolderCheck__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_createSharingURLForCollaborationRequest:", *(_QWORD *)(a1 + 32));

}

- (void)cancel
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  share_sheet_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[SFCollaborationPerformer collaborationItem](self, "collaborationItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_1A2830000, v3, OS_LOG_TYPE_DEFAULT, "Cancel Collaboration creation for collaboration item %@", (uint8_t *)&v7, 0xCu);

  }
  -[SFCollaborationPerformer setDidCancel:](self, "setDidCancel:", 1);
  self->_isRunning = 0;
  -[SFCollaborationPerformer delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "didCancelCreationForCollaborationPerformer:", self);

}

- (void)_createCollaborationRequestWithCompletionHandler:(id)a3
{
  void (**v4)(id, void *);
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  SFCollaborationCloudSharingRequest *v9;
  void *v10;
  void *v11;
  void *v12;
  SFCollaborationCloudSharingRequest *v13;
  _QWORD v14[4];
  SFCollaborationCloudSharingRequest *v15;
  SFCollaborationPerformer *v16;
  void (**v17)(id, void *);
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *))a3;
  share_sheet_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[SFCollaborationPerformer collaborationItem](self, "collaborationItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v19 = v7;
    _os_log_impl(&dword_1A2830000, v5, OS_LOG_TYPE_DEFAULT, "Create Collaboration request for collaboration item %@", buf, 0xCu);

  }
  -[SFCollaborationPerformer collaborationItem](self, "collaborationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "type") == 2)
  {
    v9 = [SFCollaborationCloudSharingRequest alloc];
    objc_msgSend(v8, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "options");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCollaborationPerformer activityType](self, "activityType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[SFCollaborationCloudSharingRequest initWithCollaborationItemIdentifier:options:fileOrFolderURL:share:setupInfo:phoneNumbers:emailAddresses:activityType:appName:appIconData:](v9, "initWithCollaborationItemIdentifier:options:fileOrFolderURL:share:setupInfo:phoneNumbers:emailAddresses:activityType:appName:appIconData:", v10, v11, 0, 0, 0, MEMORY[0x1E0C9AA60], v12, 0, 0);

    v4[2](v4, v13);
  }
  else
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __77__SFCollaborationPerformer__createCollaborationRequestWithCompletionHandler___block_invoke;
    v14[3] = &unk_1E482DC70;
    v15 = v8;
    v16 = self;
    v17 = v4;
    -[SFCollaborationPerformer _fetchCollaborationAppInfoIfNeeded:](self, "_fetchCollaborationAppInfoIfNeeded:", v14);

    v13 = v15;
  }

}

void __77__SFCollaborationPerformer__createCollaborationRequestWithCompletionHandler___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  SFCollaborationCloudSharingRequest *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  SFCollaborationCloudSharingRequest *v14;
  NSObject *v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;

  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(a1[4], "type");
  switch(v7)
  {
    case 2:
      share_sheet_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        __77__SFCollaborationPerformer__createCollaborationRequestWithCompletionHandler___block_invoke_cold_1(v15);

      objc_msgSend(a1[5], "cancel");
      (*((void (**)(void))a1[6] + 2))();
      break;
    case 1:
      objc_msgSend(a1[4], "itemProvider");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __77__SFCollaborationPerformer__createCollaborationRequestWithCompletionHandler___block_invoke_2;
      v19[3] = &unk_1E482DC48;
      v17 = a1[4];
      v18 = a1[5];
      v20 = v17;
      v21 = v18;
      v22 = v5;
      v23 = v6;
      v24 = a1[6];
      +[SFCollaborationUtilities loadCKShareItemProvider:completionHandler:](SFCollaborationUtilities, "loadCKShareItemProvider:completionHandler:", v16, v19);

      break;
    case 0:
      v8 = a1[4];
      v9 = [SFCollaborationCloudSharingRequest alloc];
      objc_msgSend(v8, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[4], "options");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "fileURL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "activityType");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[SFCollaborationCloudSharingRequest initWithCollaborationItemIdentifier:options:fileOrFolderURL:share:setupInfo:phoneNumbers:emailAddresses:activityType:appName:appIconData:](v9, "initWithCollaborationItemIdentifier:options:fileOrFolderURL:share:setupInfo:phoneNumbers:emailAddresses:activityType:appName:appIconData:", v10, v11, v12, 0, 0, MEMORY[0x1E0C9AA60], v13, v5, v6);

      (*((void (**)(void))a1[6] + 2))();
      break;
  }

}

void __77__SFCollaborationPerformer__createCollaborationRequestWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  SFCollaborationCloudSharingRequest *v10;
  void *v11;
  void *v12;
  void *v13;
  SFCollaborationCloudSharingRequest *v14;
  id v15;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v15 = a2;
  objc_msgSend(v5, "updatedShare");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    v8 = v7;
  else
    v8 = v15;
  v9 = v8;

  v10 = [SFCollaborationCloudSharingRequest alloc];
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "options");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "activityType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[SFCollaborationCloudSharingRequest initWithCollaborationItemIdentifier:options:fileOrFolderURL:share:setupInfo:phoneNumbers:emailAddresses:activityType:appName:appIconData:](v10, "initWithCollaborationItemIdentifier:options:fileOrFolderURL:share:setupInfo:phoneNumbers:emailAddresses:activityType:appName:appIconData:", v11, v12, 0, v9, v6, MEMORY[0x1E0C9AA60], v13, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
}

- (void)_fetchCollaborationAppInfoIfNeeded:(id)a3
{
  id v4;
  void *v5;
  int v6;
  double v7;
  double v8;
  id *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;

  v4 = a3;
  -[SFCollaborationPerformer activityType](self, "activityType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.UIKit.activity.Mail"));

  if (v6)
  {
    -[SFCollaborationPerformer deviceScreenScale](self, "deviceScreenScale");
    v8 = v7;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __63__SFCollaborationPerformer__fetchCollaborationAppInfoIfNeeded___block_invoke;
    v14[3] = &unk_1E482DC98;
    v9 = &v15;
    v15 = v4;
    v10 = v4;
    SFCurrentAppIconData(v14, v8);
  }
  else
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __63__SFCollaborationPerformer__fetchCollaborationAppInfoIfNeeded___block_invoke_2;
    v12[3] = &unk_1E482DCC0;
    v9 = &v13;
    v13 = v4;
    v11 = v4;
    sf_dispatch_on_main_queue(v12);
  }

}

void __63__SFCollaborationPerformer__fetchCollaborationAppInfoIfNeeded___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  SFCurrentAppName();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v2 + 16))(v2, v4, v3);

}

uint64_t __63__SFCollaborationPerformer__fetchCollaborationAppInfoIfNeeded___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_didCreateCollaborationWithResult:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  uint8_t v14[16];
  uint8_t buf[16];

  v5 = a3;
  if (!-[SFCollaborationPerformer didCancel](self, "didCancel"))
  {
    share_sheet_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A2830000, v6, OS_LOG_TYPE_DEFAULT, "Did create Collaboration", buf, 2u);
    }

    objc_msgSend(v5, "sharingURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      share_sheet_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[SFCollaborationPerformer _didCreateCollaborationWithResult:].cold.1(v5, v8);

    }
    self->_isRunning = 0;
    objc_storeStrong((id *)&self->_cloudSharingResult, a3);
    -[SFCollaborationPerformer collaborationItem](self, "collaborationItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCloudSharingResult:", v5);

    -[SFCollaborationPerformer delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "didFinishCreationForCollaborationPerformer:", self);

  }
  gelato_sharing_log();
  v11 = objc_claimAutoreleasedReturnValue();
  gelato_sharing_log();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_signpost_id_make_with_pointer(v12, self->_collaborationItem);

  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)v14 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A2830000, v11, OS_SIGNPOST_INTERVAL_END, v13, "PerformCollaboration", ", v14, 2u);
  }

}

- (SFCollaborationItem)collaborationItem
{
  return self->_collaborationItem;
}

- (NSString)activityType
{
  return self->_activityType;
}

- (double)deviceScreenScale
{
  return self->_deviceScreenScale;
}

- (SFCollaborationPerformerDelegate)delegate
{
  return (SFCollaborationPerformerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SFCollaborationCreationDelegate)creationDelegate
{
  return (SFCollaborationCreationDelegate *)objc_loadWeakRetained((id *)&self->_creationDelegate);
}

- (void)setCreationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_creationDelegate, a3);
}

- (SFCollaborationCloudSharingResult)cloudSharingResult
{
  return self->_cloudSharingResult;
}

- (BOOL)isRunning
{
  return self->_isRunning;
}

- (BOOL)requiresParticipants
{
  return self->_requiresParticipants;
}

- (void)setRequiresParticipants:(BOOL)a3
{
  self->_requiresParticipants = a3;
}

- (BOOL)didCancel
{
  return self->_didCancel;
}

- (void)setDidCancel:(BOOL)a3
{
  self->_didCancel = a3;
}

- (OS_dispatch_queue)performQueue
{
  return self->_performQueue;
}

- (void)setPerformQueue:(id)a3
{
  objc_storeStrong((id *)&self->_performQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_performQueue, 0);
  objc_storeStrong((id *)&self->_cloudSharingResult, 0);
  objc_destroyWeak((id *)&self->_creationDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_activityType, 0);
  objc_storeStrong((id *)&self->_collaborationItem, 0);
}

void __35__SFCollaborationPerformer_perform__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_0(&dword_1A2830000, a2, a3, "Add Participants Allowed load returned error: %@", (uint8_t *)&v3);
}

- (void)_performWithAddParticipantsAllowed:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "collaborationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "metadataLoadError");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412290;
  v7 = v4;
  OUTLINED_FUNCTION_0_0(&dword_1A2830000, a2, v5, "Collaboration Performer failed because metadata was not loaded: %@", (uint8_t *)&v6);

}

- (void)_createSharingURLForCollaborationRequest:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A2830000, log, OS_LOG_TYPE_ERROR, "Add participants view delegate method is not implemented", v1, 2u);
}

void __77__SFCollaborationPerformer__createCollaborationRequestWithCompletionHandler___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1A2830000, log, OS_LOG_TYPE_FAULT, "prepare Collaboration for SWY isn't supported.", v1, 2u);
}

- (void)_didCreateCollaborationWithResult:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_0_0(&dword_1A2830000, a2, v4, "error:%@", (uint8_t *)&v5);

}

@end
