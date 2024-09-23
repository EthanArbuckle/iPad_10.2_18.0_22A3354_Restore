@implementation SHSheetRemoteSceneViewController

+ (BOOL)_wantsContentOverlayInsetsUpdatesWhileDismissing
{
  return 1;
}

- (SHSheetRemoteSceneViewController)initWithSession:(id)a3
{
  id v5;
  SHSheetRemoteSceneViewController *v6;
  SHSheetRemoteSceneViewController *v7;
  uint64_t v8;
  SHSheetRemoteScene *scene;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SHSheetRemoteSceneViewController;
  v6 = -[SHSheetRemoteSceneViewController initWithNibName:bundle:](&v11, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_session, a3);
    objc_msgSend(v5, "remoteScene");
    v8 = objc_claimAutoreleasedReturnValue();
    scene = v7->_scene;
    v7->_scene = (SHSheetRemoteScene *)v8;

    -[SHSheetRemoteScene setDelegate:](v7->_scene, "setDelegate:", v7);
    -[SHSheetRemoteSceneViewController installSceneHostingView](v7, "installSceneHostingView");
  }

  return v7;
}

- (void)installSceneHostingView
{
  NSObject *v3;
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
  _QWORD v24[4];
  uint8_t buf[4];
  SHSheetRemoteSceneViewController *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (!-[SHSheetRemoteSceneViewController didInstallHostingView](self, "didInstallHostingView"))
  {
    share_sheet_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v26 = self;
      _os_log_impl(&dword_19E419000, v3, OS_LOG_TYPE_DEFAULT, "remote scene view controller %@ installing hosting view", buf, 0xCu);
    }

    -[SHSheetRemoteSceneViewController setDidInstallHostingView:](self, "setDidInstallHostingView:", 1);
    -[SHSheetRemoteSceneViewController scene](self, "scene");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hostingController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sceneViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = v6;
    -[SHSheetRemoteSceneViewController addChildViewController:](self, "addChildViewController:", v6);
    objc_msgSend(v6, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHSheetRemoteSceneViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", v7);
    objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v17 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(v7, "leadingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "leadingAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:", v21);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v20;
    objc_msgSend(v7, "trailingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "trailingAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:", v18);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = v16;
    objc_msgSend(v7, "topAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "topAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintEqualToAnchor:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v24[2] = v11;
    objc_msgSend(v7, "bottomAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bottomAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToAnchor:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v24[3] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "activateConstraints:", v15);

    objc_msgSend(v23, "didMoveToParentViewController:", self);
  }
}

- (void)viewDidLoad
{
  NSObject *v3;
  uint8_t v4[16];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SHSheetRemoteSceneViewController;
  -[SHSheetRemoteSceneViewController viewDidLoad](&v5, sel_viewDidLoad);
  share_sheet_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_19E419000, v3, OS_LOG_TYPE_DEFAULT, "SHSheetRemoteSceneViewController: viewDidLoad", v4, 2u);
  }

  -[SHSheetRemoteSceneViewController installSceneHostingView](self, "installSceneHostingView");
}

- (void)viewDidLayoutSubviews
{
  NSObject *v3;
  void *v4;
  _QWORD v5[5];
  uint8_t buf[16];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SHSheetRemoteSceneViewController;
  -[SHSheetRemoteSceneViewController viewDidLayoutSubviews](&v7, sel_viewDidLayoutSubviews);
  share_sheet_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19E419000, v3, OS_LOG_TYPE_DEFAULT, "SHSheetRemoteSceneViewController: viewDidLayoutSubviews", buf, 2u);
  }

  -[SHSheetRemoteSceneViewController scene](self, "scene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __57__SHSheetRemoteSceneViewController_viewDidLayoutSubviews__block_invoke;
  v5[3] = &unk_1E4001200;
  v5[4] = self;
  objc_msgSend(v4, "updateWithChange:", v5);

}

void __57__SHSheetRemoteSceneViewController_viewDidLayoutSubviews__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setPresentationStyle:", objc_msgSend(v2, "effectivePresentationStyle"));

}

- (void)viewIsAppearing:(BOOL)a3
{
  NSObject *v4;
  int64_t v5;
  void *v6;
  _QWORD v7[5];
  uint8_t buf[16];
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SHSheetRemoteSceneViewController;
  -[SHSheetRemoteSceneViewController viewIsAppearing:](&v9, sel_viewIsAppearing_, a3);
  share_sheet_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19E419000, v4, OS_LOG_TYPE_DEFAULT, "SHSheetRemoteSceneViewController: viewIsAppearing", buf, 2u);
  }

  v5 = -[SHSheetRemoteSceneViewController _hostProcessType](self, "_hostProcessType");
  -[SHSheetRemoteSceneViewController scene](self, "scene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__SHSheetRemoteSceneViewController_viewIsAppearing___block_invoke;
  v7[3] = &__block_descriptor_40_e37_v16__0___SHSheetRemoteMutableScene__8l;
  v7[4] = v5;
  objc_msgSend(v6, "updateWithChange:", v7);

}

uint64_t __52__SHSheetRemoteSceneViewController_viewIsAppearing___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setHostProcessType:", *(_QWORD *)(a1 + 32));
}

- (int64_t)_hostProcessType
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char isKindOfClass;

  -[SHSheetRemoteSceneViewController viewIfLoaded](self, "viewIfLoaded");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return 0;
  -[SHSheetRemoteSceneViewController viewIfLoaded](self, "viewIfLoaded");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    return 2;
  else
    return 1;
}

- (void)sceneDidBecomeActive:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  share_sheet_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_19E419000, v4, OS_LOG_TYPE_DEFAULT, "SHSheetRemoteSceneViewController: sceneDidBecomeActive", v5, 2u);
  }

  -[SHSheetRemoteSceneViewController installSceneHostingView](self, "installSceneHostingView");
}

- (void)dealloc
{
  NSObject *v3;
  void *v4;
  objc_super v5;
  uint8_t buf[16];

  share_sheet_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19E419000, v3, OS_LOG_TYPE_DEFAULT, "SHSheetRemoteSceneViewController: dealloc", buf, 2u);
  }

  -[SHSheetRemoteSceneViewController scene](self, "scene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  v5.receiver = self;
  v5.super_class = (Class)SHSheetRemoteSceneViewController;
  -[SHSheetRemoteSceneViewController dealloc](&v5, sel_dealloc);
}

- (void)scene:(id)a3 didReceiveAction:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  share_sheet_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 134217984;
    v10 = objc_msgSend(v5, "type");
    _os_log_impl(&dword_19E419000, v6, OS_LOG_TYPE_DEFAULT, "did receive action with type:%ld", (uint8_t *)&v9, 0xCu);
  }

  switch(objc_msgSend(v5, "type"))
  {
    case 0:
      -[SHSheetRemoteSceneViewController presenter](self, "presenter");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleCustomHeaderButton");
      goto LABEL_15;
    case 1:
      if (_ShareSheetPlatformWantsRemoteOptions())
      {
        -[SHSheetRemoteSceneViewController _handleOptions](self, "_handleOptions");
      }
      else
      {
        -[SHSheetRemoteSceneViewController presenter](self, "presenter");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "handleOptions");
LABEL_15:

      }
LABEL_16:

      return;
    case 2:
      -[SHSheetRemoteSceneViewController presenter](self, "presenter");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleCollaborationOptions");
      goto LABEL_15;
    case 3:
      -[SHSheetRemoteSceneViewController presenter](self, "presenter");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "didSelectCollaborativeAction");
      goto LABEL_15;
    case 4:
      -[SHSheetRemoteSceneViewController presenter](self, "presenter");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "didSelectSendCopyAction");
      goto LABEL_15;
    case 5:
      -[SHSheetRemoteSceneViewController presenter](self, "presenter");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleClose");
      goto LABEL_15;
    case 6:
      -[SHSheetRemoteSceneViewController presenter](self, "presenter");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleActionsEdit");
      goto LABEL_15;
    case 7:
      -[SHSheetRemoteSceneViewController presenter](self, "presenter");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleNext");
      goto LABEL_15;
    case 8:
      -[SHSheetRemoteSceneViewController session](self, "session");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "activityViewController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "dismissViewControllerAnimated:completion:", 0, 0);

      goto LABEL_15;
    default:
      goto LABEL_16;
  }
}

- (void)scene:(id)a3 didReceiveMetadataUpdateAction:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  uint8_t v8[16];

  v5 = a4;
  share_sheet_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_19E419000, v6, OS_LOG_TYPE_DEFAULT, "SHSheetRemoteSceneViewController received metadata update", v8, 2u);
  }

  objc_msgSend(v5, "metadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SHSheetRemoteSceneViewController setRemoteHeaderMetadata:](self, "setRemoteHeaderMetadata:", v7);
}

- (void)scene:(id)a3 didReceiveSuggestionAction:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint8_t v9[16];

  v5 = a4;
  share_sheet_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_19E419000, v6, OS_LOG_TYPE_DEFAULT, "SHSheetRemoteSceneViewController received suggestion action", v9, 2u);
  }

  -[SHSheetRemoteSceneViewController presenter](self, "presenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "suggestionReason");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "handleInfoSuggestionPress:", v8);
}

- (void)scene:(id)a3 didReceiveOptionUpdateAction:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint8_t v10[16];

  v5 = a4;
  share_sheet_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_19E419000, v6, OS_LOG_TYPE_DEFAULT, "SHSheetRemoteSceneViewController received option update", v10, 2u);
  }

  objc_msgSend(v5, "customization");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SHSheetRemoteSceneViewController _localCustomizationForRemoteProxy:](self, "_localCustomizationForRemoteProxy:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[SHSheetRemoteSceneViewController _applyValueFromRemoteCustomization:toLocalCustomization:](self, "_applyValueFromRemoteCustomization:toLocalCustomization:", v7, v8);
  }
  else
  {
    share_sheet_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[SHSheetRemoteSceneViewController scene:didReceiveOptionUpdateAction:].cold.1(v9);

  }
}

- (void)scene:(id)a3 didReceiveCollaborationOptionUpdateAction:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint8_t v9[16];

  v5 = a4;
  share_sheet_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_19E419000, v6, OS_LOG_TYPE_DEFAULT, "SHSheetRemoteSceneViewController received collaboration options update", v9, 2u);
  }

  -[SHSheetRemoteSceneViewController session](self, "session");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "collaborationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setShareOptions:", v5);

}

- (id)_localCustomizationForRemoteProxy:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  id v20;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SHSheetRemoteSceneViewController session](self, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "customizationGroups");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v7 = v6;
  v23 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v23)
  {
    v8 = *(_QWORD *)v30;
    v24 = v7;
    v22 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v30 != v8)
          objc_enumerationMutation(v7);
        v10 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        objc_msgSend(v10, "customizations");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v26;
          while (2)
          {
            for (j = 0; j != v13; ++j)
            {
              if (*(_QWORD *)v26 != v14)
                objc_enumerationMutation(v11);
              v16 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * j);
              objc_msgSend(v16, "identifier");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "identifier");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = objc_msgSend(v17, "isEqualToString:", v18);

              if ((v19 & 1) != 0)
              {
                v20 = v16;

                v7 = v24;
                goto LABEL_19;
              }
            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
            if (v13)
              continue;
            break;
          }
        }

        v7 = v24;
        v8 = v22;
      }
      v20 = 0;
      v23 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v23);
  }
  else
  {
    v20 = 0;
  }
LABEL_19:

  return v20;
}

- (void)_applyValueFromRemoteCustomization:(id)a3 toLocalCustomization:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    -[NSObject _setValue:](v8, "_setValue:", objc_msgSend(v6, "value"));
LABEL_9:

    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = v7;
      -[NSObject _setSelectedOptionIndex:](v8, "_setSelectedOptionIndex:", objc_msgSend(v6, "selectedOptionIndex"));
    }
    else
    {
      share_sheet_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[SHSheetRemoteSceneViewController _applyValueFromRemoteCustomization:toLocalCustomization:].cold.1((uint64_t)v6, (uint64_t)v7, v8);
    }
    goto LABEL_9;
  }
  v9 = v7;
  objc_msgSend(v6, "text");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_setText:", v10);

LABEL_10:
  -[SHSheetRemoteSceneViewController _handleOptions](self, "_handleOptions");

}

- (void)_handleOptions
{
  void *v3;
  int v4;

  -[SHSheetRemoteSceneViewController session](self, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportsCollaboration");

  if (v4)
    -[SHSheetRemoteSceneViewController _handleCollaborationOptions](self, "_handleCollaborationOptions");
  else
    -[SHSheetRemoteSceneViewController _handleLocalOptions](self, "_handleLocalOptions");
}

- (void)_handleLocalOptions
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[16];

  share_sheet_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19E419000, v3, OS_LOG_TYPE_DEFAULT, "SHSheetRemoteSceneViewController sending options to remote", buf, 2u);
  }

  -[SHSheetRemoteSceneViewController session](self, "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "customizationGroups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[SHSheetRemoteSceneViewController scene](self, "scene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__SHSheetRemoteSceneViewController__handleLocalOptions__block_invoke;
  v8[3] = &unk_1E4001200;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "updateWithChange:", v8);

}

uint64_t __55__SHSheetRemoteSceneViewController__handleLocalOptions__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setCustomizationGroups:", *(_QWORD *)(a1 + 32));
}

- (void)_handleCollaborationOptions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  -[SHSheetRemoteSceneViewController session](self, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "collaborationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "shareOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[SHSheetRemoteSceneViewController scene](self, "scene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63__SHSheetRemoteSceneViewController__handleCollaborationOptions__block_invoke;
  v8[3] = &unk_1E4001200;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "updateWithChange:", v8);

}

uint64_t __63__SHSheetRemoteSceneViewController__handleCollaborationOptions__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setCollaborationOptions:", *(_QWORD *)(a1 + 32));
}

- (void)updateWithViewModel:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  share_sheet_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v13 = v4;
    _os_log_impl(&dword_19E419000, v5, OS_LOG_TYPE_DEFAULT, "SHSheetRemoteSceneViewController updating remote with view model: %@", buf, 0xCu);
  }

  -[SHSheetRemoteSceneViewController session](self, "session");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "createClientContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SHSheetRemoteSceneViewController scene](self, "scene");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __56__SHSheetRemoteSceneViewController_updateWithViewModel___block_invoke;
  v10[3] = &unk_1E4001200;
  v11 = v7;
  v9 = v7;
  objc_msgSend(v8, "updateWithChange:", v10);

}

uint64_t __56__SHSheetRemoteSceneViewController_updateWithViewModel___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSessionContext:", *(_QWORD *)(a1 + 32));
}

- (void)didUpdateAirDropTransferWithChange:(id)a3
{
  id v4;
  void *v5;
  SHSheetAirDropTransferUpdateAction *v6;

  v4 = a3;
  v6 = -[SHSheetAirDropTransferUpdateAction initWithAirDropTransferChange:]([SHSheetAirDropTransferUpdateAction alloc], "initWithAirDropTransferChange:", v4);

  -[SHSheetRemoteSceneViewController scene](self, "scene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendAction:", v6);

}

- (void)reloadMetadata:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  _QWORD v7[5];
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v8[0] = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__SHSheetRemoteSceneViewController_reloadMetadata___block_invoke;
  v7[3] = &unk_1E4001270;
  v7[4] = self;
  softLinkSFUILinkMetadataSerializationForLocalUseOnly(v6, v7);

}

void __51__SHSheetRemoteSceneViewController_reloadMetadata___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v3 = a2;
  v2 = v3;
  sf_dispatch_on_main_queue();

}

void __51__SHSheetRemoteSceneViewController_reloadMetadata___block_invoke_2(uint64_t a1)
{
  SHSheetMetadataChangedAction *v2;
  void *v3;
  void *v4;
  SHSheetMetadataChangedAction *v5;

  v2 = [SHSheetMetadataChangedAction alloc];
  objc_msgSend(*(id *)(a1 + 32), "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SHSheetMetadataChangedAction initWithSerializedMetadata:](v2, "initWithSerializedMetadata:", v3);

  objc_msgSend(*(id *)(a1 + 40), "scene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sendAction:", v5);

}

- (void)reloadContent
{
  void *v3;
  SHSheetContentReloadAction *v4;

  v4 = -[SHSheetContentReloadAction initWithActivityUUID:]([SHSheetContentReloadAction alloc], "initWithActivityUUID:", 0);
  -[SHSheetRemoteSceneViewController scene](self, "scene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sendAction:", v4);

}

- (void)reloadActivity:(id)a3
{
  id v4;
  SHSheetContentReloadAction *v5;
  void *v6;
  void *v7;
  SHSheetContentReloadAction *v8;

  v4 = a3;
  v5 = [SHSheetContentReloadAction alloc];
  objc_msgSend(v4, "activityUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[SHSheetContentReloadAction initWithActivityUUID:](v5, "initWithActivityUUID:", v6);
  -[SHSheetRemoteSceneViewController scene](self, "scene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sendAction:", v8);

}

- (void)startPulsingActivity:(id)a3 localizedTitle:(id)a4
{
  id v6;
  void *v7;
  SHSheetPulsingAction *v8;
  void *v9;
  id v10;

  v6 = a4;
  objc_msgSend(a3, "activityUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[SHSheetPulsingEvent startPulsingEventWithActivityUUID:localizedTitle:](SHSheetPulsingEvent, "startPulsingEventWithActivityUUID:localizedTitle:", v7, v6);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v8 = -[SHSheetPulsingAction initWithEvent:]([SHSheetPulsingAction alloc], "initWithEvent:", v10);
  -[SHSheetRemoteSceneViewController scene](self, "scene");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sendAction:", v8);

}

- (void)stopPulsingActivity:(id)a3
{
  void *v4;
  SHSheetPulsingAction *v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "activityUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[SHSheetPulsingEvent stopPulsingEventWithActivityUUID:](SHSheetPulsingEvent, "stopPulsingEventWithActivityUUID:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v5 = -[SHSheetPulsingAction initWithEvent:]([SHSheetPulsingAction alloc], "initWithEvent:", v7);
  -[SHSheetRemoteSceneViewController scene](self, "scene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sendAction:", v5);

}

- (SHSheetSession)session
{
  return self->_session;
}

- (SHSheetContentPresenter)presenter
{
  return (SHSheetContentPresenter *)objc_loadWeakRetained((id *)&self->_presenter);
}

- (void)setPresenter:(id)a3
{
  objc_storeWeak((id *)&self->_presenter, a3);
}

- (SHSheetRemoteScene)scene
{
  return self->_scene;
}

- (UIViewController)sceneViewController
{
  return self->_sceneViewController;
}

- (LPLinkMetadata)remoteHeaderMetadata
{
  return self->_remoteHeaderMetadata;
}

- (void)setRemoteHeaderMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_remoteHeaderMetadata, a3);
}

- (BOOL)didInstallHostingView
{
  return self->_didInstallHostingView;
}

- (void)setDidInstallHostingView:(BOOL)a3
{
  self->_didInstallHostingView = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteHeaderMetadata, 0);
  objc_storeStrong((id *)&self->_sceneViewController, 0);
  objc_storeStrong((id *)&self->_scene, 0);
  objc_destroyWeak((id *)&self->_presenter);
  objc_storeStrong((id *)&self->_session, 0);
}

- (void)scene:(os_log_t)log didReceiveOptionUpdateAction:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_19E419000, log, OS_LOG_TYPE_ERROR, "Could not find local counterpart to remote customization", v1, 2u);
}

- (void)_applyValueFromRemoteCustomization:(os_log_t)log toLocalCustomization:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_19E419000, log, OS_LOG_TYPE_ERROR, "Could not apply value from remote customization %@ to local customization %@", (uint8_t *)&v3, 0x16u);
}

@end
