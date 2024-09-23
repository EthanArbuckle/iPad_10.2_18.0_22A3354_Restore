@implementation SHSheetGroupActivitySharingController

- (SHSheetGroupActivitySharingController)initWithItemProvider:(id)a3
{
  id v4;
  SHSheetGroupActivitySharingController *v5;
  Class v6;
  objc_class *v7;
  uint64_t v8;
  GPGroupActivitySharingControllerHelpers *groupActivitySharingController;
  GPGroupActivitySharingControllerHelpers *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v27[4];
  id v28;
  id location;
  objc_super v30;

  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)SHSheetGroupActivitySharingController;
  v5 = -[SHSheetGroupActivitySharingController initWithNibName:bundle:](&v30, sel_initWithNibName_bundle_, 0, 0);
  if (v5)
  {
    if (_GroupActivities_UIKitLibrary_sOnce != -1)
      dispatch_once(&_GroupActivities_UIKitLibrary_sOnce, &__block_literal_global_5);
    v6 = NSClassFromString(CFSTR("_GroupActivities_UIKit.GroupActivitySharingController"));
    if (v6)
    {
      v7 = v6;
      if (-[objc_class instancesRespondToSelector:](v6, "instancesRespondToSelector:", sel_initWithItemProvider_))
      {
        v8 = objc_msgSend([v7 alloc], "initWithItemProvider:", v4);
        groupActivitySharingController = v5->_groupActivitySharingController;
        v5->_groupActivitySharingController = (GPGroupActivitySharingControllerHelpers *)v8;

        location = 0;
        objc_initWeak(&location, v5);
        v10 = v5->_groupActivitySharingController;
        v27[0] = MEMORY[0x1E0C809B0];
        v27[1] = 3221225472;
        v27[2] = __62__SHSheetGroupActivitySharingController_initWithItemProvider___block_invoke;
        v27[3] = &unk_1E4001540;
        objc_copyWeak(&v28, &location);
        -[GPGroupActivitySharingControllerHelpers registerWithResultHandler:](v10, "registerWithResultHandler:", v27);
        objc_destroyWeak(&v28);
        objc_destroyWeak(&location);
        goto LABEL_12;
      }
      share_sheet_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[SHSheetGroupActivitySharingController initWithItemProvider:].cold.2(v11, v19, v20, v21, v22, v23, v24, v25);
    }
    else
    {
      share_sheet_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[SHSheetGroupActivitySharingController initWithItemProvider:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);
    }

  }
LABEL_12:

  return v5;
}

void __62__SHSheetGroupActivitySharingController_initWithItemProvider___block_invoke(uint64_t a1, uint64_t a2)
{
  id *v3;
  void *v4;
  id v5;
  id WeakRetained;

  v3 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_loadWeakRetained(v3);
  objc_msgSend(v4, "groupActivitySharingController:didFinish:", v5, a2);

}

- (void)viewDidLoad
{
  GPGroupActivitySharingControllerHelpers *groupActivitySharingController;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  objc_super v32;
  _QWORD v33[6];

  v33[4] = *MEMORY[0x1E0C80C00];
  v32.receiver = self;
  v32.super_class = (Class)SHSheetGroupActivitySharingController;
  -[SHSheetGroupActivitySharingController viewDidLoad](&v32, sel_viewDidLoad);
  groupActivitySharingController = self->_groupActivitySharingController;
  if (groupActivitySharingController)
  {
    -[GPGroupActivitySharingControllerHelpers willMoveToParentViewController:](groupActivitySharingController, "willMoveToParentViewController:", self);
    -[SHSheetGroupActivitySharingController addChildViewController:](self, "addChildViewController:", self->_groupActivitySharingController);
    -[SHSheetGroupActivitySharingController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[GPGroupActivitySharingControllerHelpers view](self->_groupActivitySharingController, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addSubview:", v5);

    v21 = (void *)MEMORY[0x1E0CB3718];
    -[GPGroupActivitySharingControllerHelpers view](self->_groupActivitySharingController, "view");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "leadingAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHSheetGroupActivitySharingController view](self, "view");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "safeAreaLayoutGuide");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "leadingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintEqualToAnchor:", v27);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = v26;
    -[GPGroupActivitySharingControllerHelpers view](self->_groupActivitySharingController, "view");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "trailingAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHSheetGroupActivitySharingController view](self, "view");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "safeAreaLayoutGuide");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "trailingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:", v20);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v33[1] = v19;
    -[GPGroupActivitySharingControllerHelpers view](self->_groupActivitySharingController, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "topAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHSheetGroupActivitySharingController view](self, "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "safeAreaLayoutGuide");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "topAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:", v14);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v33[2] = v6;
    -[GPGroupActivitySharingControllerHelpers view](self->_groupActivitySharingController, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bottomAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHSheetGroupActivitySharingController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "safeAreaLayoutGuide");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bottomAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v33[3] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "activateConstraints:", v13);

    -[GPGroupActivitySharingControllerHelpers didMoveToParentViewController:](self->_groupActivitySharingController, "didMoveToParentViewController:", self);
  }
}

- (void)setShareSheetSessionID:(id)a3
{
  id v5;

  v5 = a3;
  if (!-[NSString isEqualToString:](self->_shareSheetSessionID, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_shareSheetSessionID, a3);
    -[GPGroupActivitySharingControllerHelpers setShareSheetSessionID:](self->_groupActivitySharingController, "setShareSheetSessionID:", v5);
  }

}

- (SHSheetGroupActivitySharingControllerDelegate)delegate
{
  return (SHSheetGroupActivitySharingControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)shareSheetSessionID
{
  return self->_shareSheetSessionID;
}

- (GPGroupActivitySharingControllerHelpers)groupActivitySharingController
{
  return self->_groupActivitySharingController;
}

- (void)setGroupActivitySharingController:(id)a3
{
  objc_storeStrong((id *)&self->_groupActivitySharingController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupActivitySharingController, 0);
  objc_storeStrong((id *)&self->_shareSheetSessionID, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)initWithItemProvider:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_19E419000, a1, a3, "SharePlay: Could not load GroupActivitySharingController class", a5, a6, a7, a8, 0);
}

- (void)initWithItemProvider:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_19E419000, a1, a3, "SharePlay: GroupActivitySharingController instances do not respond to initWithItemProvider", a5, a6, a7, a8, 0);
}

@end
