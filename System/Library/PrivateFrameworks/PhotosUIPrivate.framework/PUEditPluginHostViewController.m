@implementation PUEditPluginHostViewController

- (PUEditPluginHostViewController)initWithPlugin:(id)a3
{
  id v5;
  PUEditPluginHostViewController *v6;
  PUEditPluginHostViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PUEditPluginHostViewController;
  v6 = -[PUEditPluginHostViewController init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_plugin, a3);

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[PUEditPluginHostViewController _endDisablingIdleTimerIfNecessary](self, "_endDisablingIdleTimerIfNecessary");
  v3.receiver = self;
  v3.super_class = (Class)PUEditPluginHostViewController;
  -[PUEditPluginHostViewController dealloc](&v3, sel_dealloc);
}

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PUEditPluginHostViewController;
  -[PUEditPluginHostViewController loadView](&v9, sel_loadView);
  -[PUEditPluginHostViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  -[PUEditPluginHostViewController plugin](self, "plugin");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUEditPluginHostViewController setTitle:](self, "setTitle:", v6);
  -[PUEditPluginHostViewController _updateBarButtonsWithUndoRedoVisible:](self, "_updateBarButtonsWithUndoRedoVisible:", -[PUEditPluginHostViewController showUndoRedoButtons](self, "showUndoRedoButtons"));
  -[PUEditPluginHostViewController _hostContext](self, "_hostContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __42__PUEditPluginHostViewController_loadView__block_invoke;
  v8[3] = &unk_1E58A9910;
  v8[4] = self;
  objc_msgSend(v7, "setHideNavigationControllerHandler:", v8);

}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)PUEditPluginHostViewController;
  -[PUEditPluginHostViewController viewWillAppear:](&v6, sel_viewWillAppear_);
  -[UIViewController pu_setupInitialBarsVisibilityOnViewWillAppearAnimated:](self, "pu_setupInitialBarsVisibilityOnViewWillAppearAnimated:", v3);
  -[PUEditPluginHostViewController allowsFullScreen](self, "allowsFullScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUEditPluginHostViewController _addRemoteViewControllerIfNeededAllowingFullscreen:](self, "_addRemoteViewControllerIfNeededAllowingFullscreen:", objc_msgSend(v5, "BOOLValue"));

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  int v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PUEditPluginHostViewController;
  -[PUEditPluginHostViewController viewDidDisappear:](&v6, sel_viewDidDisappear_, a3);
  if ((-[PUEditPluginHostViewController isBeingDismissed](self, "isBeingDismissed") & 1) != 0
    || (-[PUEditPluginHostViewController navigationController](self, "navigationController"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "isBeingDismissed"),
        v4,
        v5))
  {
    -[PUEditPluginHostViewController _dismiss](self, "_dismiss");
  }
}

- (void)loadRemoteViewControllerWithCompletionHandler:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  _QWORD *v18;
  SEL v19;
  _QWORD v20[5];
  _QWORD v21[5];
  id v22;
  _QWORD v23[4];
  id v24;
  id location;
  id v26;
  _QWORD v27[3];

  v27[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUEditPluginHostViewController.m"), 103, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler != nil"));

  }
  -[PUEditPluginHostViewController plugin](self, "plugin");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extension");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v8 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __80__PUEditPluginHostViewController_loadRemoteViewControllerWithCompletionHandler___block_invoke;
  v23[3] = &unk_1E589E238;
  objc_copyWeak(&v24, &location);
  objc_msgSend(v7, "set_requestPostCompletionBlock:", v23);
  v9 = objc_alloc_init(MEMORY[0x1E0CB36C8]);
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__24143;
  v21[4] = __Block_byref_object_dispose__24144;
  v22 = 0;
  v10 = *MEMORY[0x1E0CD2240];
  v20[0] = v8;
  v20[1] = 3221225472;
  v20[2] = __80__PUEditPluginHostViewController_loadRemoteViewControllerWithCompletionHandler___block_invoke_146;
  v20[3] = &unk_1E589E288;
  v20[4] = v21;
  objc_msgSend(v9, "registerItemForTypeIdentifier:loadHandler:", v10, v20);
  v11 = objc_alloc_init(MEMORY[0x1E0CB35E8]);
  v27[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAttachments:", v12);

  v26 = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v8;
  v16[1] = 3221225472;
  v16[2] = __80__PUEditPluginHostViewController_loadRemoteViewControllerWithCompletionHandler___block_invoke_3;
  v16[3] = &unk_1E589E328;
  v14 = v5;
  v16[4] = self;
  v17 = v14;
  v18 = v21;
  v19 = a2;
  objc_msgSend(v7, "instantiateViewControllerWithInputItems:listenerEndpoint:connectionHandler:", v13, 0, v16);

  _Block_object_dispose(v21, 8);
  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);

}

- (void)_queryAllowsFullScreen:(id)a3
{
  void (**v4)(id, uint64_t);
  PUEditPluginHostViewController *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  void (**v9)(id, uint64_t);
  id v10;
  id location;

  v4 = (void (**)(id, uint64_t))a3;
  v5 = self;
  objc_sync_enter(v5);
  -[PUEditPluginHostViewController allowsFullScreen](v5, "allowsFullScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v5);

  if (v6)
  {
    if (v4)
      v4[2](v4, objc_msgSend(v6, "BOOLValue"));
  }
  else
  {
    -[PUEditPluginHostViewController _extensionVendorProxy](v5, "_extensionVendorProxy");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, v5);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __57__PUEditPluginHostViewController__queryAllowsFullScreen___block_invoke;
    v8[3] = &unk_1E589E350;
    objc_copyWeak(&v10, &location);
    v9 = v4;
    objc_msgSend(v7, "querySDKVersionWithResponseHandler:", v8);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);

  }
}

- (void)_handleVendorVersion:(unsigned int)a3 completion:(id)a4
{
  unsigned int v6;
  PUEditPluginHostViewController *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  v6 = a3 >> 9;
  v7 = self;
  objc_sync_enter(v7);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6 > 0x580);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUEditPluginHostViewController setAllowsFullScreen:](v7, "setAllowsFullScreen:", v8);

  objc_sync_exit(v7);
  v9 = v10;
  if (v10)
  {
    (*((void (**)(id, BOOL))v10 + 2))(v10, v6 > 0x580);
    v9 = v10;
  }

}

- (void)queryHandlingCapabilityForAdjustmentData:(id)a3 withResponseHandler:(id)a4 timeout:(double)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  dispatch_time_t v13;
  id v14;
  _QWORD block[4];
  id v16;
  _QWORD aBlock[4];
  id v18;
  _QWORD *v19;
  _QWORD v20[3];
  int v21;

  v8 = a3;
  v9 = a4;
  -[PUEditPluginHostViewController _extensionVendorProxy](self, "_extensionVendorProxy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v20[0] = 0;
    v20[1] = v20;
    v20[2] = 0x2020000000;
    v11 = MEMORY[0x1E0C809B0];
    v21 = 0;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __103__PUEditPluginHostViewController_queryHandlingCapabilityForAdjustmentData_withResponseHandler_timeout___block_invoke;
    aBlock[3] = &unk_1E589E378;
    v19 = v20;
    v18 = v9;
    v12 = _Block_copy(aBlock);
    objc_msgSend(v10, "queryHandlingCapabilityForAdjustmentData:withResponseHandler:", v8, v12);
    v13 = dispatch_time(0, (uint64_t)(a5 * 1000000000.0));
    block[0] = v11;
    block[1] = 3221225472;
    block[2] = __103__PUEditPluginHostViewController_queryHandlingCapabilityForAdjustmentData_withResponseHandler_timeout___block_invoke_2;
    block[3] = &unk_1E58ABAC8;
    v16 = v12;
    v14 = v12;
    dispatch_after(v13, MEMORY[0x1E0C80D38], block);

    _Block_object_dispose(v20, 8);
  }
  else if (v9)
  {
    (*((void (**)(id, _QWORD))v9 + 2))(v9, 0);
  }

}

- (void)_queryShouldShowCancelConfirmationWithResponseHandler:(id)a3 timeout:(double)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  dispatch_time_t v10;
  id v11;
  _QWORD block[4];
  id v13;
  _QWORD aBlock[4];
  id v15;
  _QWORD *v16;
  _QWORD v17[3];
  int v18;

  v6 = a3;
  -[PUEditPluginHostViewController _extensionVendorProxy](self, "_extensionVendorProxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v17[0] = 0;
    v17[1] = v17;
    v17[2] = 0x2020000000;
    v8 = MEMORY[0x1E0C809B0];
    v18 = 0;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __96__PUEditPluginHostViewController__queryShouldShowCancelConfirmationWithResponseHandler_timeout___block_invoke;
    aBlock[3] = &unk_1E589E378;
    v16 = v17;
    v15 = v6;
    v9 = _Block_copy(aBlock);
    objc_msgSend(v7, "queryShouldShowCancelConfirmationWithResponseHandler:", v9);
    v10 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
    block[0] = v8;
    block[1] = 3221225472;
    block[2] = __96__PUEditPluginHostViewController__queryShouldShowCancelConfirmationWithResponseHandler_timeout___block_invoke_2;
    block[3] = &unk_1E58ABAC8;
    v13 = v9;
    v11 = v9;
    dispatch_after(v10, MEMORY[0x1E0C80D38], block);

    _Block_object_dispose(v17, 8);
  }
  else if (v6)
  {
    (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
  }

}

- (void)_beginContentEditingWithCompletionHandler:(id)a3 timeout:(double)a4
{
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  dispatch_time_t v15;
  _QWORD block[4];
  id v17;
  id v18;
  _QWORD aBlock[4];
  id v20;
  _QWORD *v21;
  _QWORD v22[3];
  int v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  v7 = MEMORY[0x1E0C809B0];
  v23 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __84__PUEditPluginHostViewController__beginContentEditingWithCompletionHandler_timeout___block_invoke;
  aBlock[3] = &unk_1E589E3A0;
  v21 = v22;
  v8 = v6;
  v20 = v8;
  v9 = _Block_copy(aBlock);
  v10 = (void *)MEMORY[0x1E0CB35C8];
  v24 = *MEMORY[0x1E0CB2D50];
  v25[0] = CFSTR("extension connection lost");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4099, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUEditPluginHostViewController _extensionVendorProxy](self, "_extensionVendorProxy");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, "beginContentEditingWithCompletionHandler:", v9);
    v15 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
    block[0] = v7;
    block[1] = 3221225472;
    block[2] = __84__PUEditPluginHostViewController__beginContentEditingWithCompletionHandler_timeout___block_invoke_3;
    block[3] = &unk_1E58AB968;
    v18 = v9;
    v17 = v12;
    dispatch_after(v15, MEMORY[0x1E0C80D38], block);

  }
  else
  {
    (*((void (**)(void *, void *))v9 + 2))(v9, v12);
  }

  _Block_object_dispose(v22, 8);
}

- (void)_addRemoteViewControllerIfNeededAllowingFullscreen:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  int v6;
  PUEditPluginHostViewController *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;

  v3 = a3;
  -[PUEditPluginHostViewController remoteViewController](self, "remoteViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v36 = v5;
    v6 = -[PUEditPluginHostViewController isViewLoaded](self, "isViewLoaded");
    v5 = v36;
    if (v6)
    {
      objc_msgSend(v36, "parentViewController");
      v7 = (PUEditPluginHostViewController *)objc_claimAutoreleasedReturnValue();

      v5 = v36;
      if (v7 != self)
      {
        -[PUEditPluginHostViewController addChildViewController:](self, "addChildViewController:", v36);
        objc_msgSend(v36, "view");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUEditPluginHostViewController view](self, "view");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addSubview:", v8);

        objc_msgSend(v36, "didMoveToParentViewController:", self);
        _NSDictionaryOfVariableBindings(CFSTR("remoteView"), v8, 0);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "centerXAnchor");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUEditPluginHostViewController view](self, "view");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "centerXAnchor");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "constraintEqualToAnchor:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        LODWORD(v15) = 1148846080;
        objc_msgSend(v14, "setPriority:", v15);
        v34 = v14;
        objc_msgSend(v10, "addObject:", v14);
        objc_msgSend(v8, "leadingAnchor");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUEditPluginHostViewController view](self, "view");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "safeAreaLayoutGuide");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "leadingAnchor");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "constraintEqualToAnchor:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        LODWORD(v21) = 1132068864;
        objc_msgSend(v20, "setPriority:", v21);
        objc_msgSend(v10, "addObject:", v20);
        objc_msgSend(v8, "trailingAnchor");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUEditPluginHostViewController view](self, "view");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "safeAreaLayoutGuide");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "trailingAnchor");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "constraintEqualToAnchor:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        LODWORD(v27) = 1132068864;
        objc_msgSend(v26, "setPriority:", v27);
        objc_msgSend(v10, "addObject:", v26);
        if (v3)
        {
          objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[remoteView]|"), 0, 0, v35);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObjectsFromArray:", v28);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-[remoteView]"), 0, 0, v35);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObjectsFromArray:", v29);

          objc_msgSend(v8, "bottomAnchor");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[PUEditPluginHostViewController view](self, "view");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "safeAreaLayoutGuide");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "bottomAnchor");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "constraintEqualToAnchor:", v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v33);

        }
        objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v10);

        v5 = v36;
      }
    }
  }

}

- (id)_hostContext
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;

  -[PUEditPluginHostViewController plugin](self, "plugin");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "extension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUEditPluginHostViewController request](self, "request");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_extensionContextForUUID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUEditPluginHostViewController.m"), 294, CFSTR("unexpected class %@"), v7);

    }
  }
  return v7;
}

- (id)_extensionVendorProxy
{
  void *v2;
  void *v3;
  void *v4;

  -[PUEditPluginHostViewController _hostContext](self, "_hostContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_auxiliaryConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_dismiss
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[PUEditPluginHostViewController remoteViewController](self, "remoteViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v3;
  if (v3)
  {
    if (objc_msgSend(v3, "isViewLoaded"))
    {
      objc_msgSend(v8, "view");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "removeFromSuperview");

    }
    objc_msgSend(v8, "removeFromParentViewController");
    -[PUEditPluginHostViewController setRemoteViewController:](self, "setRemoteViewController:", 0);
  }
  -[PUEditPluginHostViewController request](self, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[PUEditPluginHostViewController plugin](self, "plugin");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "extension");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cancelExtensionRequestWithIdentifier:", v5);

    -[PUEditPluginHostViewController setRequest:](self, "setRequest:", 0);
  }

}

- (void)_updateBarButtonsWithUndoRedoVisible:(BOOL)a3
{
  _BOOL4 v3;
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
  _QWORD v23[2];
  _QWORD v24[2];

  v3 = a3;
  v24[1] = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__handleCancelButton_);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, self, sel__handleDoneButton_);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3520], "plainButtonConfiguration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("arrow.uturn.backward.circle"));
    v21 = v6;
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setImage:", v10);

    objc_msgSend(v9, "setContentInsets:", 0.0, 4.0, 0.0, 4.0);
    v22 = v5;
    objc_msgSend(MEMORY[0x1E0D7BB48], "buttonWithWithCursorEffect:target:action:", 1, self, sel_handleUndoButton_);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setConfiguration:", v9);
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", v11);
    PULocalizedString(CFSTR("PLUGIN_UNDO_BUTTON_TITLE"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTitle:", v13);

    objc_msgSend(v12, "setEnabled:", 0);
    objc_msgSend(MEMORY[0x1E0DC3520], "plainButtonConfiguration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("arrow.uturn.forward.circle"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setImage:", v15);

    objc_msgSend(v14, "setContentInsets:", 0.0, 4.0, 0.0, 4.0);
    objc_msgSend(MEMORY[0x1E0D7BB48], "buttonWithWithCursorEffect:target:action:", 1, self, sel_handleRedoButton_);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setConfiguration:", v14);
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", v16);
    objc_msgSend(v17, "setEnabled:", 0);
    v23[0] = v12;
    v23[1] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObjectsFromArray:", v18);

    v5 = v22;
    -[PUEditPluginHostViewController setUndoBarButtonItem:](self, "setUndoBarButtonItem:", v12);
    -[PUEditPluginHostViewController setRedoBarButtonItem:](self, "setRedoBarButtonItem:", v17);

    v6 = v21;
  }
  -[PUEditPluginHostViewController navigationItem](self, "navigationItem");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setLeftBarButtonItems:animated:", v7, 1);

  -[PUEditPluginHostViewController navigationItem](self, "navigationItem");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setRightBarButtonItems:animated:", v8, 1);

}

- (int64_t)preferredUserInterfaceStyle
{
  void *v2;
  int64_t v3;

  +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "lightModeEditor"))
    v3 = 0;
  else
    v3 = 2;

  return v3;
}

- (BOOL)prepareForDismissingForced:(BOOL)a3
{
  if (a3)
    -[PUEditPluginHostViewController _dismiss](self, "_dismiss");
  return 0;
}

- (void)_handleCancelButton:(id)a3
{
  id v4;
  _QWORD v5[5];
  id v6;

  v4 = a3;
  if (!-[PUEditPluginHostViewController didHandleCancel](self, "didHandleCancel"))
  {
    -[PUEditPluginHostViewController setDidHandleCancel:](self, "setDidHandleCancel:", 1);
    if (-[PUEditPluginHostViewController extensionDidBeginContentEditing](self, "extensionDidBeginContentEditing"))
    {
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __54__PUEditPluginHostViewController__handleCancelButton___block_invoke;
      v5[3] = &unk_1E58AAE08;
      v5[4] = self;
      v6 = v4;
      -[PUEditPluginHostViewController _queryShouldShowCancelConfirmationWithResponseHandler:timeout:](self, "_queryShouldShowCancelConfirmationWithResponseHandler:timeout:", v5, 2.0);

    }
    else
    {
      -[PUEditPluginHostViewController _handleCancel](self, "_handleCancel");
    }
  }

}

- (void)_handleCancel
{
  void *v3;
  id v4;

  -[PUEditPluginHostViewController _endDisablingIdleTimerIfNecessary](self, "_endDisablingIdleTimerIfNecessary");
  -[PUEditPluginHostViewController _extensionVendorProxy](self, "_extensionVendorProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelContentEditingWithResponseHandler:", &__block_literal_global_24101);

  -[PUEditPluginHostViewController delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "editPluginHostViewController:didFinishWithCompletionType:", self, 0);

}

- (void)_handleDoneButton:(id)a3
{
  void *v4;
  uint64_t v5;
  PUProgressView *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];

  if (!-[PUEditPluginHostViewController didHandleDone](self, "didHandleDone", a3))
  {
    -[PUEditPluginHostViewController setDidHandleDone:](self, "setDidHandleDone:", 1);
    -[PUEditPluginHostViewController _beginDisablingIdleTimer](self, "_beginDisablingIdleTimer");
    +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "lightModeEditor");

    v6 = -[PUProgressView initWithStyle:]([PUProgressView alloc], "initWithStyle:", v5);
    -[PUEditPluginHostViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUProgressView showInView:animated:afterDelay:](v6, "showInView:animated:afterDelay:", v7, 1, 0.0);

    -[PUEditPluginHostViewController _hostContext](self, "_hostContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __52__PUEditPluginHostViewController__handleDoneButton___block_invoke;
    v10[3] = &unk_1E589E438;
    v10[4] = self;
    objc_msgSend(v8, "setContentEditingOutputCommitHandler:", v10);
    -[PUEditPluginHostViewController _extensionVendorProxy](self, "_extensionVendorProxy");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "finishContentEditing");

  }
}

- (void)_beginDisablingIdleTimer
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUEditPluginHostViewController.m"), 471, CFSTR("Must be on main thread"));

  }
  -[PUEditPluginHostViewController disablingIdleTimerToken](self, "disablingIdleTimerToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0D7B1B8], "sharedState");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "beginDisablingIdleTimerForReason:", CFSTR("Editor (PUEditPluginHostViewController)"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUEditPluginHostViewController setDisablingIdleTimerToken:](self, "setDisablingIdleTimerToken:", v5);

  }
}

- (void)_endDisablingIdleTimerIfNecessary
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUEditPluginHostViewController.m"), 479, CFSTR("Must be on main thread"));

  }
  -[PUEditPluginHostViewController disablingIdleTimerToken](self, "disablingIdleTimerToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v7 = v4;
    objc_msgSend(MEMORY[0x1E0D7B1B8], "sharedState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "endDisablingIdleTimer:", v7);

    -[PUEditPluginHostViewController setDisablingIdleTimerToken:](self, "setDisablingIdleTimerToken:", 0);
    v4 = v7;
  }

}

- (void)_setupUndoProxy
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_opt_new();
  -[PUEditPluginHostViewController setUndoProxy:](self, "setUndoProxy:", v6);
  objc_msgSend(v6, "setTarget:", self);
  -[PUEditPluginHostViewController _extensionVendorProxy](self, "_extensionVendorProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "listenerEndpoint");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setupUndoProxyWithXPCListenerEndpoint:attemptUndoManagerAutoSetup:", v4, objc_msgSend(v5, "attemptEditExtensionUndoAutoSetup"));

}

- (void)setShowUndoRedo:(BOOL)a3
{
  px_dispatch_on_main_queue();
}

- (void)setUndoEnabled:(BOOL)a3 redoEnabled:(BOOL)a4
{
  px_dispatch_on_main_queue();
}

- (void)handleUndoButton:(id)a3
{
  id v3;

  -[PUEditPluginHostViewController undoProxy](self, "undoProxy", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "performUndo");

}

- (void)handleRedoButton:(id)a3
{
  id v3;

  -[PUEditPluginHostViewController undoProxy](self, "undoProxy", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "performRedo");

}

- (PUEditPlugin)plugin
{
  return self->_plugin;
}

- (PUEditPluginHostViewControllerDataSource)dataSource
{
  return (PUEditPluginHostViewControllerDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (PUEditPluginHostViewControllerDelegate)delegate
{
  return (PUEditPluginHostViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIViewController)remoteViewController
{
  return (UIViewController *)objc_getProperty(self, a2, 1000, 1);
}

- (void)setRemoteViewController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1000);
}

- (NSCopying)request
{
  return (NSCopying *)objc_getProperty(self, a2, 1008, 1);
}

- (void)setRequest:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 1008);
}

- (BOOL)extensionDidBeginContentEditing
{
  return self->_extensionDidBeginContentEditing;
}

- (void)setExtensionDidBeginContentEditing:(BOOL)a3
{
  self->_extensionDidBeginContentEditing = a3;
}

- (BOOL)didHandleCancel
{
  return self->_didHandleCancel;
}

- (void)setDidHandleCancel:(BOOL)a3
{
  self->_didHandleCancel = a3;
}

- (BOOL)didHandleDone
{
  return self->_didHandleDone;
}

- (void)setDidHandleDone:(BOOL)a3
{
  self->_didHandleDone = a3;
}

- (id)disablingIdleTimerToken
{
  return self->_disablingIdleTimerToken;
}

- (void)setDisablingIdleTimerToken:(id)a3
{
  objc_storeStrong(&self->_disablingIdleTimerToken, a3);
}

- (NSNumber)allowsFullScreen
{
  return self->_allowsFullScreen;
}

- (void)setAllowsFullScreen:(id)a3
{
  objc_storeStrong((id *)&self->_allowsFullScreen, a3);
}

- (PUEditingExtensionUndoProxyHostSide)undoProxy
{
  return self->_undoProxy;
}

- (void)setUndoProxy:(id)a3
{
  objc_storeStrong((id *)&self->_undoProxy, a3);
}

- (UIBarButtonItem)undoBarButtonItem
{
  return (UIBarButtonItem *)objc_loadWeakRetained((id *)&self->_undoBarButtonItem);
}

- (void)setUndoBarButtonItem:(id)a3
{
  objc_storeWeak((id *)&self->_undoBarButtonItem, a3);
}

- (UIBarButtonItem)redoBarButtonItem
{
  return (UIBarButtonItem *)objc_loadWeakRetained((id *)&self->_redoBarButtonItem);
}

- (void)setRedoBarButtonItem:(id)a3
{
  objc_storeWeak((id *)&self->_redoBarButtonItem, a3);
}

- (BOOL)showUndoRedoButtons
{
  return self->_showUndoRedoButtons;
}

- (void)setShowUndoRedoButtons:(BOOL)a3
{
  self->_showUndoRedoButtons = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_redoBarButtonItem);
  objc_destroyWeak((id *)&self->_undoBarButtonItem);
  objc_storeStrong((id *)&self->_undoProxy, 0);
  objc_storeStrong((id *)&self->_allowsFullScreen, 0);
  objc_storeStrong(&self->_disablingIdleTimerToken, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_remoteViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_plugin, 0);
}

void __61__PUEditPluginHostViewController_setUndoEnabled_redoEnabled___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;

  v2 = *(unsigned __int8 *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "undoBarButtonItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEnabled:", v2);

  v4 = *(unsigned __int8 *)(a1 + 41);
  objc_msgSend(*(id *)(a1 + 32), "redoBarButtonItem");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", v4);

}

uint64_t __50__PUEditPluginHostViewController_setShowUndoRedo___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setShowUndoRedoButtons:", *(unsigned __int8 *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_updateBarButtonsWithUndoRedoVisible:", *(unsigned __int8 *)(a1 + 40));
}

void __52__PUEditPluginHostViewController__handleDoneButton___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  _QWORD block[5];
  id v22;
  void (**v23)(_QWORD, _QWORD, _QWORD);
  uint8_t buf[16];
  _QWORD aBlock[5];
  id v26;

  v5 = a2;
  v6 = a3;
  v7 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__PUEditPluginHostViewController__handleDoneButton___block_invoke_2;
  aBlock[3] = &unk_1E589E3E8;
  v8 = v6;
  aBlock[4] = *(_QWORD *)(a1 + 32);
  v26 = v8;
  v9 = _Block_copy(aBlock);
  v10 = (void (**)(_QWORD, _QWORD, _QWORD))v9;
  if (v5)
  {
    objc_msgSend(v5, "adjustmentData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {

LABEL_6:
      objc_msgSend(*(id *)(a1 + 32), "plugin");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "extension");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "_plugIn");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "containingUrl");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "setEditorBundleURL:", v19);
      block[0] = v7;
      block[1] = 3221225472;
      block[2] = __52__PUEditPluginHostViewController__handleDoneButton___block_invoke_210;
      block[3] = &unk_1E58ABAF0;
      block[4] = *(_QWORD *)(a1 + 32);
      v22 = v5;
      v23 = v10;
      dispatch_async(MEMORY[0x1E0C80D38], block);

      goto LABEL_10;
    }
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "renderedContentURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "path");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v12, "fileExistsAtPath:", v14);

    if ((v15 & 1) != 0)
      goto LABEL_6;
    PLUIGetLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AAB61000, v20, OS_LOG_TYPE_DEFAULT, "Extension returned output with no changes to commit.", buf, 2u);
    }

    v10[2](v10, 1, 0);
  }
  else
  {
    (*((void (**)(void *, _QWORD, _QWORD))v9 + 2))(v9, 0, 0);
  }
LABEL_10:

}

void __52__PUEditPluginHostViewController__handleDoneButton___block_invoke_2(uint64_t a1, char a2, char a3)
{
  _QWORD v6[5];
  char v7;
  char v8;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__PUEditPluginHostViewController__handleDoneButton___block_invoke_3;
  v6[3] = &unk_1E58A7DF8;
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = a2;
  v8 = a3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);
}

void __52__PUEditPluginHostViewController__handleDoneButton___block_invoke_210(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__PUEditPluginHostViewController__handleDoneButton___block_invoke_2_211;
  v5[3] = &unk_1E589E410;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v2, "editPluginHostViewController:commitContentEditingOutput:withCompletionHandler:", v3, v4, v5);

}

uint64_t __52__PUEditPluginHostViewController__handleDoneButton___block_invoke_2_211(uint64_t a1, uint64_t a2)
{
  if (a2)
    NSLog(CFSTR("Error committing content editing output: %@"), a2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __52__PUEditPluginHostViewController__handleDoneButton___block_invoke_3(uint64_t a1)
{
  int v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[5];

  objc_msgSend(*(id *)(a1 + 32), "_endDisablingIdleTimerIfNecessary");
  if (*(_BYTE *)(a1 + 40))
  {
    v2 = *(unsigned __int8 *)(a1 + 41);
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
      v4 = 3;
    else
      v4 = 2;
    objc_msgSend(v3, "editPluginHostViewController:didFinishWithCompletionType:", *(_QWORD *)(a1 + 32), v4, v3);

  }
  else
  {
    v5 = (void *)MEMORY[0x1E0DC3450];
    PULocalizedString(CFSTR("PLUGIN_OUTPUT_ERROR_TITLE"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PULocalizedString(CFSTR("PLUGIN_OUTPUT_ERROR_MESSAGE"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "alertControllerWithTitle:message:preferredStyle:", v6, v7, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)MEMORY[0x1E0DC3448];
    PULocalizedString(CFSTR("OK"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __52__PUEditPluginHostViewController__handleDoneButton___block_invoke_4;
    v13[3] = &unk_1E58A8DE8;
    v13[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v9, "actionWithTitle:style:handler:", v10, 1, v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addAction:", v11);

    objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v8, 1, 0);
  }
}

void __52__PUEditPluginHostViewController__handleDoneButton___block_invoke_4(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "editPluginHostViewController:didFinishWithCompletionType:", *(_QWORD *)(a1 + 32), 1);

}

void __54__PUEditPluginHostViewController__handleCancelButton___block_invoke(uint64_t a1, char a2)
{
  void *v2;
  _QWORD block[5];
  id v4;
  char v5;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__PUEditPluginHostViewController__handleCancelButton___block_invoke_2;
  block[3] = &unk_1E58AA878;
  v5 = a2;
  v2 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v4 = v2;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __54__PUEditPluginHostViewController__handleCancelButton___block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  _QWORD v12[5];

  if (*(_BYTE *)(a1 + 48))
  {
    v2 = objc_alloc_init(MEMORY[0x1E0DC3450]);
    v3 = (void *)MEMORY[0x1E0DC3448];
    PULocalizedString(CFSTR("CANCEL"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __54__PUEditPluginHostViewController__handleCancelButton___block_invoke_3;
    v12[3] = &unk_1E58A8DE8;
    v12[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v3, "actionWithTitle:style:handler:", v4, 1, v12);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addAction:", v6);

    v7 = (void *)MEMORY[0x1E0DC3448];
    PULocalizedString(CFSTR("PHOTOEDIT_DISCARD_CHANGES"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v5;
    v11[1] = 3221225472;
    v11[2] = __54__PUEditPluginHostViewController__handleCancelButton___block_invoke_4;
    v11[3] = &unk_1E58A8DE8;
    v11[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v7, "actionWithTitle:style:handler:", v8, 0, v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addAction:", v9);

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v2, "popoverPresentationController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setBarButtonItem:", *(_QWORD *)(a1 + 40));

    }
    objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v2, 1, 0);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_handleCancel");
  }
}

uint64_t __54__PUEditPluginHostViewController__handleCancelButton___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setDidHandleCancel:", 0);
}

uint64_t __54__PUEditPluginHostViewController__handleCancelButton___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleCancel");
}

void __84__PUEditPluginHostViewController__beginContentEditingWithCompletionHandler_timeout___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  unsigned int *v4;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = (unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  do
  {
    if (__ldaxr(v4))
    {
      __clrex();
      goto LABEL_7;
    }
  }
  while (__stlxr(1u, v4));
  v6 = *(void **)(a1 + 32);
  if (v6)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __84__PUEditPluginHostViewController__beginContentEditingWithCompletionHandler_timeout___block_invoke_2;
    v7[3] = &unk_1E58AB968;
    v9 = v6;
    v8 = v3;
    dispatch_async(MEMORY[0x1E0C80D38], v7);

  }
LABEL_7:

}

uint64_t __84__PUEditPluginHostViewController__beginContentEditingWithCompletionHandler_timeout___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __84__PUEditPluginHostViewController__beginContentEditingWithCompletionHandler_timeout___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __96__PUEditPluginHostViewController__queryShouldShowCancelConfirmationWithResponseHandler_timeout___block_invoke(uint64_t result)
{
  unsigned int *v1;

  v1 = (unsigned int *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24);
  while (!__ldaxr(v1))
  {
    if (!__stlxr(1u, v1))
      return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  }
  __clrex();
  return result;
}

uint64_t __96__PUEditPluginHostViewController__queryShouldShowCancelConfirmationWithResponseHandler_timeout___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __103__PUEditPluginHostViewController_queryHandlingCapabilityForAdjustmentData_withResponseHandler_timeout___block_invoke(uint64_t result)
{
  unsigned int *v1;

  v1 = (unsigned int *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24);
  while (!__ldaxr(v1))
  {
    if (!__stlxr(1u, v1))
      return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  }
  __clrex();
  return result;
}

uint64_t __103__PUEditPluginHostViewController_queryHandlingCapabilityForAdjustmentData_withResponseHandler_timeout___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __57__PUEditPluginHostViewController__queryAllowsFullScreen___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_handleVendorVersion:completion:", a2, *(_QWORD *)(a1 + 32));

}

void __80__PUEditPluginHostViewController_loadRemoteViewControllerWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id *v3;
  id WeakRetained;
  void (**v5)(void);

  v3 = (id *)(a1 + 32);
  v5 = a3;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "setRequest:", 0);

  v5[2]();
}

void __80__PUEditPluginHostViewController_loadRemoteViewControllerWithCompletionHandler___block_invoke_146(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v5 = *MEMORY[0x1E0CD2240];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __80__PUEditPluginHostViewController_loadRemoteViewControllerWithCompletionHandler___block_invoke_2;
  v7[3] = &unk_1E589E260;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v4, "loadItemForTypeIdentifier:options:completionHandler:", v5, 0, v7);

}

void __80__PUEditPluginHostViewController_loadRemoteViewControllerWithCompletionHandler___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  __int128 v14;
  _QWORD v15[5];
  id v16;
  __int128 v17;
  uint64_t v18;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v8)
  {
    NSLog(CFSTR("error instantiating remote view controller: %@"), v8);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setRequest:", a2);
    objc_msgSend(*(id *)(a1 + 32), "_setupUndoProxy");
    v10 = *(void **)(a1 + 32);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __80__PUEditPluginHostViewController_loadRemoteViewControllerWithCompletionHandler___block_invoke_4;
    v15[3] = &unk_1E589E300;
    v15[4] = v10;
    v11 = v7;
    v12 = *(_QWORD *)(a1 + 56);
    v16 = v11;
    v18 = v12;
    v14 = *(_OWORD *)(a1 + 40);
    v13 = (id)v14;
    v17 = v14;
    objc_msgSend(v10, "_queryAllowsFullScreen:", v15);

  }
}

void __80__PUEditPluginHostViewController_loadRemoteViewControllerWithCompletionHandler___block_invoke_4(uint64_t a1, char a2)
{
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  __int128 v8;
  _QWORD block[5];
  id v10;
  __int128 v11;
  uint64_t v12;
  char v13;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__PUEditPluginHostViewController_loadRemoteViewControllerWithCompletionHandler___block_invoke_5;
  block[3] = &unk_1E589E2D8;
  v4 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v5 = v4;
  v13 = a2;
  v6 = *(_QWORD *)(a1 + 64);
  v10 = v5;
  v12 = v6;
  v8 = *(_OWORD *)(a1 + 48);
  v7 = (id)v8;
  v11 = v8;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __80__PUEditPluginHostViewController_loadRemoteViewControllerWithCompletionHandler___block_invoke_5(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  __int128 v6;
  _QWORD v7[5];
  __int128 v8;

  objc_msgSend(*(id *)(a1 + 32), "setRemoteViewController:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_addRemoteViewControllerIfNeededAllowingFullscreen:", *(unsigned __int8 *)(a1 + 72));
  objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), CFSTR("PUEditPluginHostViewController.m"), 140, CFSTR("dataSource must be set"));

  }
  v3 = *(_QWORD *)(a1 + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __80__PUEditPluginHostViewController_loadRemoteViewControllerWithCompletionHandler___block_invoke_6;
  v7[3] = &unk_1E589E2B0;
  v7[4] = v3;
  v6 = *(_OWORD *)(a1 + 48);
  v4 = (id)v6;
  v8 = v6;
  objc_msgSend(v2, "editPluginHostViewController:loadItemProviderWithHandler:", v3, v7);

}

void __80__PUEditPluginHostViewController_loadRemoteViewControllerWithCompletionHandler___block_invoke_6(_QWORD *a1, void *a2)
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a2);
  v4 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __80__PUEditPluginHostViewController_loadRemoteViewControllerWithCompletionHandler___block_invoke_7;
  v6[3] = &unk_1E58A5EB8;
  v5 = (void *)a1[5];
  v7 = (id)a1[4];
  v8 = v5;
  objc_msgSend(v7, "_beginContentEditingWithCompletionHandler:timeout:", v6, 10.0);

}

void __80__PUEditPluginHostViewController_loadRemoteViewControllerWithCompletionHandler___block_invoke_7(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;
  id v10;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__PUEditPluginHostViewController_loadRemoteViewControllerWithCompletionHandler___block_invoke_8;
  block[3] = &unk_1E58ABAF0;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v8 = v3;
  v9 = v4;
  v10 = v5;
  v6 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __80__PUEditPluginHostViewController_loadRemoteViewControllerWithCompletionHandler___block_invoke_8(uint64_t a1)
{
  if (!*(_QWORD *)(a1 + 32))
    objc_msgSend(*(id *)(a1 + 40), "setExtensionDidBeginContentEditing:", 1);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t __80__PUEditPluginHostViewController_loadRemoteViewControllerWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __42__PUEditPluginHostViewController_loadView__block_invoke()
{
  return px_dispatch_on_main_queue();
}

void __42__PUEditPluginHostViewController_loadView__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(unsigned __int8 *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNavigationBarHidden:", v1);

}

@end
