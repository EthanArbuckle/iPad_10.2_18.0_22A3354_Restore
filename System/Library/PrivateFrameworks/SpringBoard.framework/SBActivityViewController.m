@implementation SBActivityViewController

- (SBActivityViewController)initWithActivityItem:(id)a3 sceneType:(int64_t)a4 payloadID:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  SBActivityViewController *v16;

  v8 = a5;
  v9 = a3;
  objc_msgSend(v9, "descriptor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "contentType");
  if (a4 == 3)
  {
    if (v11 == 1)
    {
      objc_msgSend(MEMORY[0x1E0DAC5E8], "ambientCompactDefaultMetrics");
      v12 = objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
    if (!v11)
      goto LABEL_5;
LABEL_8:
    v13 = 0;
LABEL_14:
    objc_msgSend(MEMORY[0x1E0CF5468], "activityHostViewControllerWithDescriptor:sceneType:metricsRequest:", v10, a4, v13);
    v14 = objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  if (a4 == 2)
  {
    if (v11 == 1)
    {
      objc_msgSend(MEMORY[0x1E0DAC5E8], "ambientDefaultMetrics");
      v12 = objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
    if (!v11)
    {
LABEL_5:
      objc_msgSend(MEMORY[0x1E0DAC5E8], "ambientWidgetMetrics");
      v12 = objc_claimAutoreleasedReturnValue();
LABEL_13:
      v13 = (void *)v12;
      goto LABEL_14;
    }
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0DAC5E8], "defaultMetrics");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4 != 1)
    goto LABEL_14;
  objc_msgSend(MEMORY[0x1E0CF5468], "activityHostViewControllerWithDescriptor:metricsRequest:payloadID:", v10, v13, v8);
  v14 = objc_claimAutoreleasedReturnValue();
LABEL_15:
  v15 = (void *)v14;
  v16 = -[SBActivityViewController initWithActivityItem:viewController:](self, "initWithActivityItem:viewController:", v9, v14);

  return v16;
}

- (SBActivityViewController)initWithActivityItem:(id)a3 viewController:(id)a4
{
  id v7;
  id v8;
  SBActivityViewController *v9;
  SBActivityViewController *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBActivityViewController;
  v9 = -[SBActivityViewController initWithNibName:bundle:](&v12, sel_initWithNibName_bundle_, 0, 0);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_activityItem, a3);
    objc_storeStrong((id *)&v10->_activityHostViewController, a4);
  }

  return v10;
}

- (void)dealloc
{
  ACUISActivityHostViewController *activityHostViewController;
  objc_super v4;

  -[SBActivityViewController bs_removeChildViewController:](self, "bs_removeChildViewController:", self->_activityHostViewController);
  -[ACUISActivityHostViewController invalidate](self->_activityHostViewController, "invalidate");
  activityHostViewController = self->_activityHostViewController;
  self->_activityHostViewController = 0;

  v4.receiver = self;
  v4.super_class = (Class)SBActivityViewController;
  -[SBActivityViewController dealloc](&v4, sel_dealloc);
}

- (void)_preferredContentSizeDidChangeForChildViewController:(id)a3
{
  ACUISActivityHostViewController *v4;
  void *v5;
  objc_super v6;

  v4 = (ACUISActivityHostViewController *)a3;
  v6.receiver = self;
  v6.super_class = (Class)SBActivityViewController;
  -[SBActivityViewController _preferredContentSizeDidChangeForChildViewController:](&v6, sel__preferredContentSizeDidChangeForChildViewController_, v4);
  if (self->_activityHostViewController == v4)
  {
    -[ACUISActivityHostViewController preferredContentSize](v4, "preferredContentSize");
    -[SBActivityViewController setPreferredContentSize:](self, "setPreferredContentSize:");
    -[SBActivityViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "layoutIfNeeded");

  }
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBActivityViewController;
  -[SBActivityViewController viewDidLoad](&v5, sel_viewDidLoad);
  -[SBActivityViewController activityHostViewController](self, "activityHostViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", self);

  -[SBActivityViewController activityHostViewController](self, "activityHostViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBActivityViewController bs_addChildViewController:](self, "bs_addChildViewController:", v4);

}

- (void)viewWillLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBActivityViewController;
  -[SBActivityViewController viewWillLayoutSubviews](&v3, sel_viewWillLayoutSubviews);
  -[SBActivityViewController _viewWillLayoutSubviews](self, "_viewWillLayoutSubviews");
}

- (void)_viewWillLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;
  CGRect v24;

  v23 = *MEMORY[0x1E0C80C00];
  -[SBActivityViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;

  -[SBActivityViewController preferredActivityContentSize](self, "preferredActivityContentSize");
  v7 = v6;
  v9 = v8;
  -[SBActivityViewController traitCollection](self, "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "displayScale");

  BSFloatRoundForScale();
  v12 = v11;
  BSFloatRoundForScale();
  v14 = v13;
  if (v7 < v5)
    v5 = v7;
  SBLogActivity();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    -[ACUISActivityHostViewController activityIdentifier](self->_activityHostViewController, "activityIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v24.origin.x = v12;
    v24.origin.y = v14;
    v24.size.width = v5;
    v24.size.height = v9;
    NSStringFromCGRect(v24);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138543618;
    v20 = v16;
    v21 = 2112;
    v22 = v17;
    _os_log_impl(&dword_1D0540000, v15, OS_LOG_TYPE_DEFAULT, "Activity[%{public}@] Setting host view controller frame: %@", (uint8_t *)&v19, 0x16u);

  }
  -[ACUISActivityHostViewController view](self->_activityHostViewController, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setFrame:", v12, v14, v5, v9);

}

- (CGSize)preferredActivityContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[ACUISActivityHostViewController preferredContentSize](self->_activityHostViewController, "preferredContentSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (ACUISActivityHostViewController)activityHostViewController
{
  return self->_activityHostViewController;
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBActivityViewController;
  -[SBActivityViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[ACUISActivityHostViewController setVisibility:](self->_activityHostViewController, "setVisibility:", 1);
  -[ACUISActivityHostViewController setPresentationMode:](self->_activityHostViewController, "setPresentationMode:", 1);
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBActivityViewController;
  -[SBActivityViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[ACUISActivityHostViewController setVisibility:](self->_activityHostViewController, "setVisibility:", 0);
  -[ACUISActivityHostViewController setPresentationMode:](self->_activityHostViewController, "setPresentationMode:", 0);
}

- (void)ensureContent:(double)a3 queue:(id)a4 completion:(id)a5
{
  -[ACUISActivityHostViewController ensureContent:queue:completion:](self->_activityHostViewController, "ensureContent:queue:completion:", a4, a5, a3);
}

- (void)setPresentationMode:(unint64_t)a3
{
  if (self->_presentationMode != a3)
  {
    self->_presentationMode = a3;
    -[ACUISActivityHostViewController setPresentationMode:](self->_activityHostViewController, "setPresentationMode:");
  }
}

- (void)setVisibility:(unint64_t)a3
{
  if (self->_visibility != a3)
  {
    self->_visibility = a3;
    -[ACUISActivityHostViewController setVisibility:](self->_activityHostViewController, "setVisibility:");
  }
}

- (void)invalidate
{
  -[ACUISActivityHostViewController invalidate](self->_activityHostViewController, "invalidate");
}

- (BOOL)wantsIdleTimerDisabled
{
  return -[ACUISActivityHostViewController idleTimerDisabled](self->_activityHostViewController, "idleTimerDisabled");
}

- (NSSet)audioCategoriesDisablingVolumeHUD
{
  void *v2;
  void *v3;

  -[ACUISActivityHostViewController audioCategoriesDisablingVolumeHUD](self->_activityHostViewController, "audioCategoriesDisablingVolumeHUD");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSSet *)v3;
}

- (void)_unlockAndLaunchAppIfPossible:(id)a3 withAction:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  id v24;
  id v25;
  _QWORD v26[3];
  _QWORD v27[4];

  v27[3] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = a3;
  BSDispatchQueueAssertMain();
  objc_msgSend(v6, "activityIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "activitySceneDescriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "activityDescriptor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "platterTargetBundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = (void *)MEMORY[0x1E0D23158];
    v26[0] = *MEMORY[0x1E0D22CE0];
    if (v5)
    {
      v25 = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = (void *)MEMORY[0x1E0C9AA60];
    }
    v14 = *MEMORY[0x1E0D22D88];
    v27[0] = v12;
    v27[1] = MEMORY[0x1E0C9AAB0];
    v15 = *MEMORY[0x1E0D22DA8];
    v26[1] = v14;
    v26[2] = v15;
    v27[2] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "optionsWithDictionary:", v16);
    v13 = objc_claimAutoreleasedReturnValue();

    if (v5)
    SBLogActivity();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543619;
      v22 = v7;
      v23 = 2113;
      v24 = v5;
      _os_log_impl(&dword_1D0540000, v17, OS_LOG_TYPE_DEFAULT, "Activity[%{public}@] Sending open application request for %{private}@", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0D23170], "serviceWithDefaultShellEndpoint");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __69__SBActivityViewController__unlockAndLaunchAppIfPossible_withAction___block_invoke;
    v19[3] = &unk_1E8EAB8B8;
    v20 = v7;
    objc_msgSend(v18, "openApplication:withOptions:completion:", v10, v13, v19);

  }
  else
  {
    SBLogActivity();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      -[SBActivityViewController _unlockAndLaunchAppIfPossible:withAction:].cold.1((uint64_t)v7, v13);
  }

}

void __69__SBActivityViewController__unlockAndLaunchAppIfPossible_withAction___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogActivity();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __69__SBActivityViewController__unlockAndLaunchAppIfPossible_withAction___block_invoke_cold_1(a1, (uint64_t)v4, v6);
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = 138543362;
    v9 = v7;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "Activity[%{public}@] Open application from banner succeeded.", (uint8_t *)&v8, 0xCu);
  }

}

- (void)activityHostViewController:(id)a3 requestsLaunchWithAction:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__SBActivityViewController_activityHostViewController_requestsLaunchWithAction___block_invoke;
  block[3] = &unk_1E8E9E270;
  block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __80__SBActivityViewController_activityHostViewController_requestsLaunchWithAction___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_unlockAndLaunchAppIfPossible:withAction:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)activityHostViewControllerHostShouldCancelTouches:(id)a3
{
  id v4;

  -[SBActivityViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "activityViewControllerContentRequestsCancellingGesture:", self);

}

- (void)activityHostViewController:(id)a3 didSetIdleTimerDisabled:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  -[SBActivityViewController delegate](self, "delegate", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "activityViewController:didSetIdleTimerDisabled:", self, v4);

}

- (void)activityHostViewControllerAudioCategoriesDisablingVolumeHUDDidChange:(id)a3
{
  id v4;

  -[SBActivityViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "activityViewControllerDidUpdateAudioCategoriesDisablingVolumeHUD:", self);

}

- (unint64_t)presentationMode
{
  return self->_presentationMode;
}

- (unint64_t)visibility
{
  return self->_visibility;
}

- (SBActivityViewControllerDelegate)delegate
{
  return (SBActivityViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SBActivityItem)activityItem
{
  return self->_activityItem;
}

- (void)setActivityHostViewController:(id)a3
{
  objc_storeStrong((id *)&self->_activityHostViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityHostViewController, 0);
  objc_storeStrong((id *)&self->_activityItem, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)_unlockAndLaunchAppIfPossible:(uint64_t)a1 withAction:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_fault_impl(&dword_1D0540000, a2, OS_LOG_TYPE_FAULT, "Activity[%{public}@] Unable to resolve container bundle identifier", (uint8_t *)&v2, 0xCu);
}

void __69__SBActivityViewController__unlockAndLaunchAppIfPossible_withAction___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138543618;
  v5 = v3;
  v6 = 2114;
  v7 = a2;
  _os_log_error_impl(&dword_1D0540000, log, OS_LOG_TYPE_ERROR, "Activity[%{public}@] Open application from banner failed: %{public}@", (uint8_t *)&v4, 0x16u);
}

@end
