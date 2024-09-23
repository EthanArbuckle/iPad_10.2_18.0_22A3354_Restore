@implementation IMAAppPresenter

+ (id)logHandle
{
  if (logHandle_onceToken != -1)
    dispatch_once(&logHandle_onceToken, &__block_literal_global);
  return (id)logHandle_sLogHandle;
}

void __28__IMAAppPresenter_logHandle__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Messages", "iMessageAppsViewService");
  v1 = (void *)logHandle_sLogHandle;
  logHandle_sLogHandle = (uint64_t)v0;

}

- (id)logHandle
{
  return (id)objc_msgSend((id)objc_opt_class(), "logHandle");
}

- (IMAAppPresenter)init
{
  IMAAppPresenter *v2;
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)IMAAppPresenter;
  v2 = -[IMAAppPresenter init](&v8, sel_init);
  if (v2)
  {
    v3 = (id)objc_msgSend(MEMORY[0x24BE159D0], "sharedInstance");
    v4 = MEMORY[0x2207A8FEC](CFSTR("CKPluginExtensionStateObserver"), CFSTR("ChatKit"));
    if (v4)
    {
      v5 = (void *)v4;
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v6 = (id)objc_msgSend(v5, "sharedInstance");
    }
  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x24BE159D0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidateAllActivePlugins");

  objc_msgSend(MEMORY[0x24BE159D0], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "forceKillRemoteExtensionsWithDelay:", 0);

  v5.receiver = self;
  v5.super_class = (Class)IMAAppPresenter;
  -[IMAAppPresenter dealloc](&v5, sel_dealloc);
}

- (void)appPresenterDidSelectAppWithIdentifier:(id)a3 type:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v6 = (void *)MEMORY[0x24BE502A0];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "balloonPluginForBundleID:", v8);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[IMAAppPresenter notifyDelegateOfSelectedPlugin:type:](self, "notifyDelegateOfSelectedPlugin:type:", v10, v7);
}

- (void)appPresenterDidSelectAppWithIdentifier:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x24BE502A0];
  v5 = a3;
  objc_msgSend(v4, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "balloonPluginForBundleID:", v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[IMAAppPresenter notifyDelegateOfSelectedPlugin:](self, "notifyDelegateOfSelectedPlugin:", v7);
}

- (void)notifyDelegateOfSelectedPlugin:(id)a3 type:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v12, "extension");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      if (_os_feature_enabled_impl())
        v8 = v12;
      else
        v8 = v7;
      objc_msgSend(v8, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v12, "appBundle");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "bundleIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    objc_msgSend(v12, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[IMAAppPresenter delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v11, "didSelectAppWithBundleIdentifier:type:", v9, v6);
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v11, "didSelectAppWithBundleIdentifier:", v9);
  }

}

- (void)notifyDelegateOfSelectedPlugin:(id)a3
{
  -[IMAAppPresenter notifyDelegateOfSelectedPlugin:type:](self, "notifyDelegateOfSelectedPlugin:type:", a3, &stru_24E210430);
}

- (void)presentAppWithBundleIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  if (-[IMAAppPresenter isAppCardsEnabled](self, "isAppCardsEnabled"))
    -[IMAAppPresenter _presentAppCardWithBundleIdentifier:completion:](self, "_presentAppCardWithBundleIdentifier:completion:", v7, v6);
  else
    -[IMAAppPresenter _presentAppWithBundleIdentifier:completion:](self, "_presentAppWithBundleIdentifier:completion:", v7, v6);

}

- (void)_presentAppCardWithBundleIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  -[IMAAppPresenter _presentAppCardWithBundleIdentifier:style:completion:](self, "_presentAppCardWithBundleIdentifier:style:completion:", v7, -[IMAAppPresenter alwaysPresentAppsExpanded](self, "alwaysPresentAppsExpanded"), v6);

}

- (void)_presentAppCardWithBundleIdentifier:(id)a3 style:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;

  v8 = a5;
  v9 = a3;
  -[IMAAppPresenter appCardPresentationOverseer](self, "appCardPresentationOverseer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE502A0], "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "balloonPluginForBundleID:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "updateCurrentBrowserForPlugin:dataSource:pluginContext:", v12, 0, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setNeedsLayout");
  objc_msgSend(v14, "layoutIfNeeded");
  objc_storeStrong((id *)&self->_currentBalloonPlugin, v12);
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __72__IMAAppPresenter__presentAppCardWithBundleIdentifier_style_completion___block_invoke;
  v17[3] = &unk_24E210148;
  v17[4] = self;
  v18 = v12;
  v19 = v8;
  v15 = v8;
  v16 = v12;
  objc_msgSend(v10, "presentCardWithStyle:animated:completion:", a4, 1, v17);

}

uint64_t __72__IMAAppPresenter__presentAppCardWithBundleIdentifier_style_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "notifyDelegateOfSelectedPlugin:", *(_QWORD *)(a1 + 40));
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_presentAppWithBundleIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  CKBrowserTransitionCoordinator *transitionCoordinator;
  CKBrowserTransitionCoordinator *v13;
  CKBrowserTransitionCoordinator *v14;
  CKBrowserTransitionCoordinator *v15;
  id WeakRetained;
  void *v17;
  id v18;
  void (**v19)(_QWORD);
  void *v20;
  CKExpandedAppViewController *expandedAppViewController;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  CKExpandedAppViewController *v27;
  CKExpandedAppViewController *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  _QWORD v41[4];
  id v42;
  _QWORD v43[5];
  id v44;
  id v45;

  v6 = a4;
  v7 = (void *)MEMORY[0x24BE502A0];
  v8 = a3;
  objc_msgSend(v7, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "balloonPluginForBundleID:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[IMAAppPresenter delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[IMAAppPresenter alwaysPresentAppsExpanded](self, "alwaysPresentAppsExpanded")
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    transitionCoordinator = self->_transitionCoordinator;
    if (!transitionCoordinator)
    {
      v13 = (CKBrowserTransitionCoordinator *)objc_alloc_init(MEMORY[0x24BE15A08]);
      v14 = self->_transitionCoordinator;
      self->_transitionCoordinator = v13;

      -[CKBrowserTransitionCoordinator setSendDelegate:](self->_transitionCoordinator, "setSendDelegate:", self);
      v15 = self->_transitionCoordinator;
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "dockPresentationViewController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKBrowserTransitionCoordinator setPresentingViewController:](v15, "setPresentingViewController:", v17);

      -[CKBrowserTransitionCoordinator setDelegate:](self->_transitionCoordinator, "setDelegate:", self);
      -[CKBrowserTransitionCoordinator setExpanded:withReason:](self->_transitionCoordinator, "setExpanded:withReason:", 1, 2);
      transitionCoordinator = self->_transitionCoordinator;
    }
    -[CKBrowserTransitionCoordinator releaseOwnershipOfBrowserForConsumer:](transitionCoordinator, "releaseOwnershipOfBrowserForConsumer:", 2);
    -[CKBrowserTransitionCoordinator updateBrowserSessionForPlugin:datasource:](self->_transitionCoordinator, "updateBrowserSessionForPlugin:datasource:", v10, 0);
    v43[0] = MEMORY[0x24BDAC760];
    v43[1] = 3221225472;
    v43[2] = __62__IMAAppPresenter__presentAppWithBundleIdentifier_completion___block_invoke;
    v43[3] = &unk_24E210148;
    v43[4] = self;
    v18 = v10;
    v44 = v18;
    v45 = v6;
    v19 = (void (**)(_QWORD))MEMORY[0x2207A91CC](v43);
    -[CKBrowserTransitionCoordinator requestOwnershipOfBrowserForConsumer:](self->_transitionCoordinator, "requestOwnershipOfBrowserForConsumer:", 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    expandedAppViewController = self->_expandedAppViewController;
    if (expandedAppViewController)
    {
      -[CKExpandedAppViewController setContentViewController:](expandedAppViewController, "setContentViewController:", v20);
      v19[2](v19);
    }
    else
    {
      v27 = (CKExpandedAppViewController *)objc_msgSend(objc_alloc(MEMORY[0x24BE15A28]), "initWithConversation:plugin:", 0, v18);
      v28 = self->_expandedAppViewController;
      self->_expandedAppViewController = v27;

      -[CKExpandedAppViewController setDelegate:](self->_expandedAppViewController, "setDelegate:", self);
      -[CKExpandedAppViewController setAddsVerticalPaddingForStatusBar:](self->_expandedAppViewController, "setAddsVerticalPaddingForStatusBar:", 0);
      -[CKExpandedAppViewController setUsesDimmingView:](self->_expandedAppViewController, "setUsesDimmingView:", 0);
      -[CKExpandedAppViewController setFadesOutDuringStickerDrag:](self->_expandedAppViewController, "setFadesOutDuringStickerDrag:", 1);
      -[IMAAppPresenter alwaysExpandedAppViewControllerFrame](self, "alwaysExpandedAppViewControllerFrame");
      v30 = v29;
      v32 = v31;
      v34 = v33;
      v36 = v35;
      -[CKExpandedAppViewController view](self->_expandedAppViewController, "view");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setFrame:", v30, v32, v34, v36);

      -[CKExpandedAppViewController view](self->_expandedAppViewController, "view");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setClipsToBounds:", 1);

      -[CKExpandedAppViewController view](self->_expandedAppViewController, "view");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "layer");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "setCornerRadius:", 12.0);

      -[CKExpandedAppViewController addNewGrabberView](self->_expandedAppViewController, "addNewGrabberView");
      -[CKExpandedAppViewController setContentViewController:](self->_expandedAppViewController, "setContentViewController:", v20);
      objc_msgSend(v11, "presentExpandedAppViewController:animated:completion:", self->_expandedAppViewController, 1, v19);
    }

    v25 = v44;
    goto LABEL_12;
  }
  if (-[IMAAppPresenter addSwitcher](self, "addSwitcher"))
  {
    -[IMAAppPresenter positionSwitcherOffscreen:](self, "positionSwitcherOffscreen:", 1);
    -[IMAAppPresenter switcherViewController](self, "switcherViewController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "view");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v23, "setNeedsLayout");
    objc_msgSend(v23, "layoutIfNeeded");

    -[IMAAppPresenter switcherViewController](self, "switcherViewController");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "showBrowserInSwitcherForPlugin:datasource:reloadData:", v10, 0, 0);

    v41[0] = MEMORY[0x24BDAC760];
    v41[1] = 3221225472;
    v41[2] = __62__IMAAppPresenter__presentAppWithBundleIdentifier_completion___block_invoke_2;
    v41[3] = &unk_24E210170;
    v42 = v6;
    -[IMAAppPresenter animateSwitcherOffscreen:completion:](self, "animateSwitcherOffscreen:completion:", 0, v41);
    v25 = v42;
LABEL_12:

    goto LABEL_13;
  }
  -[IMAAppPresenter switcherViewController](self, "switcherViewController");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "showBrowserInSwitcherForPlugin:datasource:reloadData:", v10, 0, 0);

LABEL_13:
}

uint64_t __62__IMAAppPresenter__presentAppWithBundleIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), *(id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "notifyDelegateOfSelectedPlugin:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __62__IMAAppPresenter__presentAppWithBundleIdentifier_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)presentFullScreenModalAppWithBundleIdentifier:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  CKBrowserTransitionCoordinator *v10;
  CKBrowserTransitionCoordinator *transitionCoordinator;
  id v12;

  v6 = (void *)MEMORY[0x24BE502A0];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "balloonPluginForBundleID:", v8);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  v10 = (CKBrowserTransitionCoordinator *)objc_alloc_init(MEMORY[0x24BE15A08]);
  transitionCoordinator = self->_transitionCoordinator;
  self->_transitionCoordinator = v10;

  -[CKBrowserTransitionCoordinator setSendDelegate:](self->_transitionCoordinator, "setSendDelegate:", self);
  -[CKBrowserTransitionCoordinator setDelegate:](self->_transitionCoordinator, "setDelegate:", self);
  -[CKBrowserTransitionCoordinator presentPluginFullScreenModal:preferredContentSize:animated:completion:](self->_transitionCoordinator, "presentPluginFullScreenModal:preferredContentSize:animated:completion:", v12, 1, v7, *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));

}

- (void)presentPopoverAppWithBundleIdentifier:(id)a3 sourceRect:(CGRect)a4 inView:(id)a5 completion:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v13 = a6;
  v14 = a5;
  v15 = a3;
  -[IMAAppPresenter appCardPresentationOverseer](self, "appCardPresentationOverseer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE502A0], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "balloonPluginForBundleID:", v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "updateCurrentBrowserForPlugin:dataSource:pluginContext:", v18, 0, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setNeedsLayout");
  objc_msgSend(v20, "layoutIfNeeded");
  objc_storeStrong((id *)&self->_currentBalloonPlugin, v18);
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __86__IMAAppPresenter_presentPopoverAppWithBundleIdentifier_sourceRect_inView_completion___block_invoke;
  v23[3] = &unk_24E210148;
  v23[4] = self;
  v24 = v18;
  v25 = v13;
  v21 = v13;
  v22 = v18;
  objc_msgSend(v16, "presentPopoverFromView:sourceRect:completion:", v14, v23, x, y, width, height);

}

uint64_t __86__IMAAppPresenter_presentPopoverAppWithBundleIdentifier_sourceRect_inView_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "notifyDelegateOfSelectedPlugin:", *(_QWORD *)(a1 + 40));
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)updatePopoverWindowLocation:(CGRect)a3 inView:(id)a4 completion:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  id v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = a5;
  -[IMAAppPresenter appCardPresentationOverseer](self, "appCardPresentationOverseer");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "updatePopoverLocation:completion:", v10, x, y, width, height);

}

- (UIViewController)currentAppViewController
{
  IMBalloonPlugin *v2;
  void *v3;
  void *v4;
  void *v6;
  void *v7;
  void *v8;

  v2 = self->_currentBalloonPlugin;
  if (v2
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (-[IMBalloonPlugin extension](v2, "extension"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        !v3))
  {
    objc_msgSend(MEMORY[0x24BE159D0], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMBalloonPlugin identifier](v2, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "existingViewControllerForPluginIdentifier:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v8, "remoteViewController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }

  }
  else
  {
    v4 = 0;
  }

  return (UIViewController *)v4;
}

- (void)hideAppViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  CKExpandedAppViewController *expandedAppViewController;
  _QWORD v12[5];
  id v13;
  _QWORD v14[5];
  id v15;

  v4 = a3;
  v6 = a4;
  v7 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __60__IMAAppPresenter_hideAppViewControllerAnimated_completion___block_invoke;
  v14[3] = &unk_24E210198;
  v14[4] = self;
  v8 = v6;
  v15 = v8;
  v9 = (void *)MEMORY[0x2207A91CC](v14);
  if (-[IMAAppPresenter alwaysPresentAppsExpanded](self, "alwaysPresentAppsExpanded"))
  {
    -[IMAAppPresenter delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      expandedAppViewController = self->_expandedAppViewController;
      v12[0] = v7;
      v12[1] = 3221225472;
      v12[2] = __60__IMAAppPresenter_hideAppViewControllerAnimated_completion___block_invoke_2;
      v12[3] = &unk_24E210198;
      v12[4] = self;
      v13 = v9;
      objc_msgSend(v10, "dismissExpandedAppViewController:animated:completion:", expandedAppViewController, v4, v12);

    }
    else
    {
      _IMWarn();
    }

  }
  else if (-[CKBrowserTransitionCoordinator currentConsumer](self->_transitionCoordinator, "currentConsumer") == 2)
  {
    -[CKBrowserTransitionCoordinator dismissCurrentExpandedBrowserAnimated:completion:](self->_transitionCoordinator, "dismissCurrentExpandedBrowserAnimated:completion:", v4, v9);
  }
  else if (-[IMAAppPresenter isAppCardsEnabled](self, "isAppCardsEnabled"))
  {
    -[IMAAppPresenter _hideAppCardAnimated:completion:](self, "_hideAppCardAnimated:completion:", v4, v9);
  }
  else
  {
    -[IMAAppPresenter _hideCompactBrowserAnimated:completion:](self, "_hideCompactBrowserAnimated:completion:", v4, v9);
  }

}

uint64_t __60__IMAAppPresenter_hideAppViewControllerAnimated_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  *(_QWORD *)(v2 + 16) = 0;

  objc_msgSend(*(id *)(a1 + 32), "notifyDelegateOfSelectedPlugin:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __60__IMAAppPresenter_hideAppViewControllerAnimated_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "releaseOwnershipOfBrowserForConsumer:", 2);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  *(_QWORD *)(v2 + 24) = 0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_hideCompactBrowserAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id v17;

  v4 = a3;
  v6 = a4;
  -[IMAAppPresenter switcherViewController](self, "switcherViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x24BDAC760];
  v13 = 3221225472;
  v14 = __58__IMAAppPresenter__hideCompactBrowserAnimated_completion___block_invoke;
  v15 = &unk_24E2101C0;
  v16 = v7;
  v17 = v6;
  v8 = v6;
  v9 = v7;
  v10 = MEMORY[0x2207A91CC](&v12);
  v11 = (void *)v10;
  if (v4)
    -[IMAAppPresenter animateSwitcherOffscreen:completion:](self, "animateSwitcherOffscreen:completion:", 1, v10, v12, v13, v14, v15, v16, v17);
  else
    (*(void (**)(uint64_t, uint64_t))(v10 + 16))(v10, 1);

}

void __58__IMAAppPresenter__hideCompactBrowserAnimated_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsLayout");
  objc_msgSend(*(id *)(a1 + 32), "willMoveToParentViewController:", 0);
  objc_msgSend(v3, "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 32), "removeFromParentViewController");
  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();

}

- (void)_hideAppCardAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a3;
  v6 = a4;
  -[IMAAppPresenter appCardPresentationOverseer](self, "appCardPresentationOverseer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dismissCardAnimated:completion:", v4, v6);

}

- (void)updateAppFrameForRotation
{
  void *v3;
  id v4;

  -[IMAAppPresenter updateSwitcherViewFrame](self, "updateSwitcherViewFrame");
  -[IMAAppPresenter switcherViewController](self, "switcherViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutIfNeeded");

}

- (id)appViewControllerPresenter
{
  void *v2;
  void *v3;

  -[IMAAppPresenter delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dockPresentationViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (double)switcherHeight
{
  double v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  BOOL v12;
  id WeakRetained;
  void *v14;
  void *v15;
  double v16;

  -[IMAAppPresenter compactHeight](self, "compactHeight");
  if (v3 != 0.0)
    return v3;
  objc_msgSend(MEMORY[0x24BE15A60], "sharedBehaviors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "browserSwitcherExpandedGrabberHeaderHeight");
  v6 = v5 + 159.0;

  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_referenceBounds");
  v9 = v8;
  v11 = v10;

  v12 = v9 == 414.0 && v11 == 896.0;
  if (v12 || v9 == 428.0 && v11 == 926.0)
    v6 = v6 + 23.0;
  if (-[IMAAppPresenter isAppCardsEnabled](self, "isAppCardsEnabled"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "dockPresentationViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "safeAreaInsets");
    v6 = v6 - v16;

  }
  return v6;
}

- (CKBrowserSwitcherViewController)switcherViewController
{
  CKBrowserSwitcherViewController *switcherViewController;
  id v4;
  id WeakRetained;
  void *v6;
  CKBrowserSwitcherViewController *v7;
  CKBrowserSwitcherViewController *v8;
  CKBrowserTransitionCoordinator *v9;
  CKBrowserTransitionCoordinator *transitionCoordinator;

  switcherViewController = self->_switcherViewController;
  if (!switcherViewController)
  {
    v4 = objc_alloc(MEMORY[0x24BE15A00]);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "dockPresentationViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (CKBrowserSwitcherViewController *)objc_msgSend(v4, "initWithConversation:sendDelegate:presentingViewController:", 0, self, v6);
    v8 = self->_switcherViewController;
    self->_switcherViewController = v7;

    -[CKBrowserSwitcherViewController setDelegate:](self->_switcherViewController, "setDelegate:", self);
    -[CKBrowserSwitcherViewController transitionCoordinator](self->_switcherViewController, "transitionCoordinator");
    v9 = (CKBrowserTransitionCoordinator *)objc_claimAutoreleasedReturnValue();
    transitionCoordinator = self->_transitionCoordinator;
    self->_transitionCoordinator = v9;

    switcherViewController = self->_switcherViewController;
  }
  return switcherViewController;
}

- (CKAppCardPresentationOverseer)appCardPresentationOverseer
{
  CKAppCardPresentationOverseer *appCardPresentationOverseer;
  id v4;
  id WeakRetained;
  void *v6;
  CKAppCardPresentationOverseer *v7;
  CKAppCardPresentationOverseer *v8;

  appCardPresentationOverseer = self->_appCardPresentationOverseer;
  if (!appCardPresentationOverseer)
  {
    v4 = objc_alloc(MEMORY[0x24BE159C0]);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "dockPresentationViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (CKAppCardPresentationOverseer *)objc_msgSend(v4, "initWithPresentingViewController:sendDelegate:", v6, self);
    v8 = self->_appCardPresentationOverseer;
    self->_appCardPresentationOverseer = v7;

    -[CKAppCardPresentationOverseer setDelegate:](self->_appCardPresentationOverseer, "setDelegate:", self);
    appCardPresentationOverseer = self->_appCardPresentationOverseer;
  }
  return appCardPresentationOverseer;
}

- (BOOL)addSwitcher
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[IMAAppPresenter switcherViewController](self, "switcherViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "parentViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[IMAAppPresenter appViewControllerPresenter](self, "appViewControllerPresenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addChildViewController:", v3);

    objc_msgSend(v3, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBackgroundColor:", 0);

    objc_msgSend(v3, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBackgroundColor:", 0);

    objc_msgSend(v3, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMAAppPresenter appViewControllerPresenter](self, "appViewControllerPresenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", v8);

    -[IMAAppPresenter updateSwitcherViewFrame](self, "updateSwitcherViewFrame");
    -[IMAAppPresenter appViewControllerPresenter](self, "appViewControllerPresenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "didMoveToParentViewController:", v11);

  }
  return v4 == 0;
}

- (void)updateSwitcherViewFrame
{
  void *v3;
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  CGFloat v15;
  double Width;
  void *v17;
  id v18;
  CGRect v19;
  CGRect v20;

  if (!-[IMAAppPresenter isAppCardsEnabled](self, "isAppCardsEnabled"))
  {
    -[IMAAppPresenter appViewControllerPresenter](self, "appViewControllerPresenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;

    -[IMAAppPresenter switcherHeight](self, "switcherHeight");
    v14 = v13;
    v19.origin.x = v6;
    v19.origin.y = v8;
    v19.size.width = v10;
    v19.size.height = v12;
    v15 = CGRectGetMaxY(v19) - v14;
    v20.origin.x = v6;
    v20.origin.y = v8;
    v20.size.width = v10;
    v20.size.height = v12;
    Width = CGRectGetWidth(v20);
    -[IMAAppPresenter switcherViewController](self, "switcherViewController");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setFrame:", 0.0, v15, Width, v14);

  }
}

- (void)animateSwitcherOffscreen:(BOOL)a3 completion:(id)a4
{
  _QWORD v4[5];
  BOOL v5;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __55__IMAAppPresenter_animateSwitcherOffscreen_completion___block_invoke;
  v4[3] = &unk_24E2101E8;
  v4[4] = self;
  v5 = a3;
  objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v4, a4, 0.3, 0.3, 1.0, 0.0);
}

uint64_t __55__IMAAppPresenter_animateSwitcherOffscreen_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "positionSwitcherOffscreen:", *(unsigned __int8 *)(a1 + 40));
}

- (void)positionSwitcherOffscreen:(BOOL)a3
{
  double v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  CGFloat v16;
  void *v17;
  id v18;
  CGRect v19;

  v4 = 0.0;
  if (!a3)
  {
    -[IMAAppPresenter switcherHeight](self, "switcherHeight");
    v4 = v5;
  }
  -[IMAAppPresenter switcherViewController](self, "switcherViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frame");
  v9 = v8;
  v11 = v10;
  v13 = v12;

  -[IMAAppPresenter appViewControllerPresenter](self, "appViewControllerPresenter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bounds");
  v16 = CGRectGetMaxY(v19) - v4;

  -[IMAAppPresenter switcherViewController](self, "switcherViewController");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setFrame:", v9, v16, v11, v13);

}

- (BOOL)isAppCompact
{
  return -[CKBrowserTransitionCoordinator currentConsumer](self->_transitionCoordinator, "currentConsumer") == 1;
}

- (BOOL)isSwitcherOffscreen
{
  void *v3;
  void *v4;
  double MinY;
  void *v6;
  void *v7;
  BOOL v8;
  CGRect v10;
  CGRect v11;

  if (!-[IMAAppPresenter isAppCompact](self, "isAppCompact"))
    return 0;
  -[IMAAppPresenter switcherViewController](self, "switcherViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  MinY = CGRectGetMinY(v10);
  -[IMAAppPresenter appViewControllerPresenter](self, "appViewControllerPresenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v8 = MinY >= CGRectGetMaxY(v11);

  return v8;
}

- (void)startEditingPayload:(id)a3 dismiss:(BOOL)a4
{
  IMASticker *v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "fileURL");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v5 = -[IMASticker initWithFileURL:stickerName:accessibilityLabel:representations:]([IMASticker alloc], "initWithFileURL:stickerName:accessibilityLabel:representations:", v7, 0, 0, 0);
    -[IMAAppPresenter delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSticker:", v5);

  }
}

- (void)dismissAndReloadInputViews:(BOOL)a3
{
  -[IMAAppPresenter hideAppViewControllerAnimated:completion:](self, "hideAppViewControllerAnimated:completion:", 1, 0);
}

- (void)dismissAndReloadInputViews:(BOOL)a3 forPlugin:(id)a4
{
  void *v5;
  char v6;
  CKBrowserTransitionCoordinator *transitionCoordinator;
  _QWORD v8[5];
  char v9;
  _QWORD v10[5];
  char v11;

  -[IMAAppPresenter delegate](self, "delegate", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if (-[IMAAppPresenter isAppCardsEnabled](self, "isAppCardsEnabled"))
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __56__IMAAppPresenter_dismissAndReloadInputViews_forPlugin___block_invoke;
    v10[3] = &unk_24E2101E8;
    v11 = v6 & 1;
    v10[4] = self;
    -[IMAAppPresenter _hideAppCardAnimated:completion:](self, "_hideAppCardAnimated:completion:", 1, v10);
  }
  else
  {
    transitionCoordinator = self->_transitionCoordinator;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __56__IMAAppPresenter_dismissAndReloadInputViews_forPlugin___block_invoke_2;
    v8[3] = &unk_24E2101E8;
    v9 = v6 & 1;
    v8[4] = self;
    -[CKBrowserTransitionCoordinator dismissCurrentFullScreenModalAnimated:completion:](transitionCoordinator, "dismissCurrentFullScreenModalAnimated:completion:", 1, v8);
  }
}

void __56__IMAAppPresenter_dismissAndReloadInputViews_forPlugin___block_invoke(uint64_t a1)
{
  id v2;

  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "appPresenterCardDidDismiss:", *(_QWORD *)(a1 + 32));

  }
}

void __56__IMAAppPresenter_dismissAndReloadInputViews_forPlugin___block_invoke_2(uint64_t a1)
{
  id v2;

  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "appPresenterDidDismissFullscreenModal:", *(_QWORD *)(a1 + 32));

  }
}

- (void)dismiss
{
  -[IMAAppPresenter dismissAndReloadInputViews:](self, "dismissAndReloadInputViews:", 1);
}

- (void)requestPresentationStyleExpanded:(BOOL)a3
{
  _BOOL4 v3;
  id v5;

  v3 = a3;
  if (!-[IMAAppPresenter alwaysPresentAppsExpanded](self, "alwaysPresentAppsExpanded"))
  {
    if (-[IMAAppPresenter isAppCardsEnabled](self, "isAppCardsEnabled"))
    {
      -[IMAAppPresenter appCardPresentationOverseer](self, "appCardPresentationOverseer");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "requestPresentationStyle:", v3);
    }
    else if (v3)
    {
      -[IMAAppPresenter switcherViewController](self, "switcherViewController");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "transitionToFullscreen");
    }
    else
    {
      -[IMAAppPresenter addSwitcher](self, "addSwitcher");
      -[IMAAppPresenter switcherViewController](self, "switcherViewController");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "transitionToCollapsed");
    }

  }
}

- (void)requestPresentationStyleFullScreenModalForPlugin:(id)a3 preferredContentSize:(CGSize)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v5 = (void *)MEMORY[0x24BE502A0];
  v6 = a3;
  objc_msgSend(v5, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "balloonPluginForBundleID:", v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[IMAAppPresenter switcherViewController](self, "switcherViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "showBrowserFullscreenModalForPlugin:datasource:preferredContentSize:", v9, 0, *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));

}

- (void)commitSticker:(id)a3 stickerFrame:(CGRect)a4
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __46__IMAAppPresenter_commitSticker_stickerFrame___block_invoke;
  v4[3] = &unk_24E210210;
  v4[4] = self;
  -[IMAAppPresenter convertIMSticker:bakeInEffect:completion:](self, "convertIMSticker:bakeInEffect:completion:", a3, 1, v4);
}

void __46__IMAAppPresenter_commitSticker_stickerFrame___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSticker:", v3);

}

- (void)commitSticker:(id)a3 withDragTarget:(id)a4 draggedSticker:(id)a5
{
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  IMAAppPresenter *v11;

  v7 = a4;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __63__IMAAppPresenter_commitSticker_withDragTarget_draggedSticker___block_invoke;
  v9[3] = &unk_24E210238;
  v10 = v7;
  v11 = self;
  v8 = v7;
  -[IMAAppPresenter convertIMSticker:bakeInEffect:completion:](self, "convertIMSticker:bakeInEffect:completion:", a3, 0, v9);

}

void __63__IMAAppPresenter_commitSticker_withDragTarget_draggedSticker___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  IMADropTarget *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  IMADropTarget *v19;

  v3 = a2;
  v4 = [IMADropTarget alloc];
  objc_msgSend(*(id *)(a1 + 32), "screenCoordinate");
  v6 = v5;
  v8 = v7;
  objc_msgSend(*(id *)(a1 + 32), "initialSize");
  v10 = v9;
  v12 = v11;
  objc_msgSend(*(id *)(a1 + 32), "scale");
  v14 = v13;
  objc_msgSend(*(id *)(a1 + 32), "meshScaleFactor");
  v16 = v15;
  objc_msgSend(*(id *)(a1 + 32), "rotation");
  v19 = -[IMADropTarget initWithScreenCoordinate:initialSize:scale:meshScaleFactor:rotation:](v4, "initWithScreenCoordinate:initialSize:scale:meshScaleFactor:rotation:", v6, v8, v10, v12, v14, v16, v17);
  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addSticker:atDropTarget:", v3, v19);

}

- (void)convertIMSticker:(id)a3 bakeInEffect:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  dispatch_group_t v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  id v15;
  _QWORD block[4];
  id v17;
  NSObject *v18;
  id v19;
  IMAAppPresenter *v20;
  id v21;
  id v22;
  BOOL v23;

  v8 = a3;
  v9 = a5;
  objc_msgSend(v8, "representations");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = dispatch_group_create();
  dispatch_get_global_queue(2, 0);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v8, "stickerEffectType");
  if (v13)
  {
    objc_msgSend(MEMORY[0x24BEBFF40], "effectWithType:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __60__IMAAppPresenter_convertIMSticker_bakeInEffect_completion___block_invoke;
    block[3] = &unk_24E2102B0;
    v23 = a4;
    v17 = v10;
    v18 = v11;
    v19 = v14;
    v20 = self;
    v21 = v8;
    v22 = v9;
    v15 = v14;
    dispatch_async(v12, block);

  }
  else
  {
    -[IMAAppPresenter convertStickerToIMASticker:](self, "convertStickerToIMASticker:", v8);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, id))v9 + 2))(v9, v15);
  }

}

void __60__IMAAppPresenter_convertIMSticker_bakeInEffect_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  void *v5;
  _QWORD block[5];
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v2 = MEMORY[0x24BDAC760];
  if (*(_BYTE *)(a1 + 80))
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __60__IMAAppPresenter_convertIMSticker_bakeInEffect_completion___block_invoke_2;
    v9[3] = &unk_24E210288;
    v3 = *(void **)(a1 + 32);
    v10 = *(id *)(a1 + 40);
    v11 = *(id *)(a1 + 48);
    objc_msgSend(v3, "enumerateObjectsUsingBlock:", v9);

  }
  v4 = *(NSObject **)(a1 + 40);
  block[0] = v2;
  block[1] = 3221225472;
  block[2] = __60__IMAAppPresenter_convertIMSticker_bakeInEffect_completion___block_invoke_4;
  block[3] = &unk_24E210148;
  v5 = *(void **)(a1 + 64);
  block[4] = *(_QWORD *)(a1 + 56);
  v7 = v5;
  v8 = *(id *)(a1 + 72);
  dispatch_group_notify(v4, MEMORY[0x24BDAC9B8], block);

}

void __60__IMAAppPresenter_convertIMSticker_bakeInEffect_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  char v16;

  v3 = a2;
  objc_msgSend(v3, "role");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.stickers.role.still"));

  if (v5)
  {
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
    v6 = objc_alloc(MEMORY[0x24BDF6AC8]);
    objc_msgSend(v3, "data");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithData:", v7);

    objc_msgSend(v3, "type");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)*MEMORY[0x24BDF84F8], "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqualToString:", v10);

    v12 = *(void **)(a1 + 40);
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __60__IMAAppPresenter_convertIMSticker_bakeInEffect_completion___block_invoke_3;
    v13[3] = &unk_24E210260;
    v14 = v3;
    v16 = v11;
    v15 = *(id *)(a1 + 32);
    objc_msgSend(v12, "applyToImage:completion:", v8, v13);

  }
}

void __60__IMAAppPresenter_convertIMSticker_bakeInEffect_completion___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;

  if (*(_BYTE *)(a1 + 48))
    objc_msgSend(a2, "__ck_pngImageData");
  else
    objc_msgSend(a2, "__ck_heicsImageData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setData:", v3);

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __60__IMAAppPresenter_convertIMSticker_bakeInEffect_completion___block_invoke_4(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "convertStickerToIMASticker:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (id)convertStickerToIMASticker:(id)a3
{
  id v3;
  IMASticker *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  IMASticker *v13;
  void *v15;
  void *v16;

  v3 = a3;
  v4 = [IMASticker alloc];
  objc_msgSend(v3, "stickerGUID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fileURL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "representations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "stickerEffectType");
  if (v6 == -1)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v3, "stickerEffectType"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "externalURI");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stickerName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "metadata");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributionInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[IMASticker initWithStickerIdentifier:fileURL:representations:effectType:externalURI:stickerName:accessibilityLabel:metadata:ckAttributionInfo:](v4, "initWithStickerIdentifier:fileURL:representations:effectType:externalURI:stickerName:accessibilityLabel:metadata:ckAttributionInfo:", v16, v15, v5, v7, v8, v9, v10, v11, v12);

  if (v6 != -1)
  return v13;
}

- (BOOL)presentsStickerPickerInPopover
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  BOOL v8;

  -[IMAAppPresenter delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[IMAAppPresenter delegate](self, "delegate");
  else
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceIdiom");

  v8 = (v7 & 0xFFFFFFFFFFFFFFFBLL) == 1 && objc_msgSend(v5, "horizontalSizeClass") != 1;
  return v8;
}

- (void)stickerDruidDragStarted
{
  OUTLINED_FUNCTION_0(&dword_21E02D000, a1, a3, "Failed to weak link CKPluginExtensionStateObserverStickerDragStarted. This may cause sticker drags to fail.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)stickerDruidDragEndedWithIMSticker:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;

  v4 = a3;
  -[IMAAppPresenter appCardPresentationOverseer](self, "appCardPresentationOverseer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isPresentingCard") & 1) != 0)
  {
    -[IMAAppPresenter savedStickerPresentationContext](self, "savedStickerPresentationContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setStickerForDeferredRePresentation:", v4);

    -[IMAAppPresenter savedStickerPresentationContext](self, "savedStickerPresentationContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDeferredPresentation:", 1);

    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x24BE15A10], "donateStickerToRecents:", v4);
  IMStickersExtensionIdentifier();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  IMBalloonExtensionIDWithSuffix();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[IMAAppPresenter savedStickerPresentationContext](self, "savedStickerPresentationContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setStickerPickerContainer:", 0);

  v11 = -[IMAAppPresenter presentsStickerPickerInPopover](self, "presentsStickerPickerInPopover");
  -[IMAAppPresenter savedStickerPresentationContext](self, "savedStickerPresentationContext");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v11)
  {
    -[IMAAppPresenter _presentAppCardWithBundleIdentifier:style:completion:](self, "_presentAppCardWithBundleIdentifier:style:completion:", v9, -[NSObject style](v12, "style"), &__block_literal_global_154);
LABEL_9:

    goto LABEL_10;
  }
  -[NSObject sourceView](v12, "sourceView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    -[IMAAppPresenter logHandle](self, "logHandle");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[IMAAppPresenter stickerDruidDragEndedWithIMSticker:].cold.2(v13, v26, v27, v28, v29, v30, v31, v32);
    goto LABEL_9;
  }
  -[IMAAppPresenter savedStickerPresentationContext](self, "savedStickerPresentationContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sourceView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[IMAAppPresenter savedStickerPresentationContext](self, "savedStickerPresentationContext");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "sourceRect");
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;

  -[IMAAppPresenter presentPopoverAppWithBundleIdentifier:sourceRect:inView:completion:](self, "presentPopoverAppWithBundleIdentifier:sourceRect:inView:completion:", v9, v16, &__block_literal_global_153, v19, v21, v23, v25);
LABEL_10:
  v33 = *(id *)MEMORY[0x2207A8FF8]("CKPluginExtensionStateObserverStickerDragEnded", CFSTR("ChatKit"));
  if (v33)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v34 = objc_claimAutoreleasedReturnValue();
    -[NSObject postNotificationName:object:](v34, "postNotificationName:object:", v33, self);
  }
  else
  {
    -[IMAAppPresenter logHandle](self, "logHandle");
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      -[IMAAppPresenter stickerDruidDragEndedWithIMSticker:].cold.1(v34, v35, v36, v37, v38, v39, v40, v41);
  }

LABEL_15:
}

- (void)canShowBrowserForPluginIdentifier:(id)a3 completion:(id)a4
{
  (*((void (**)(id, _QWORD))a4 + 2))(a4, 0);
}

- (void)showBrowserForPluginIdentifier:(id)a3 style:(unint64_t)a4 completion:(id)a5
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a5;
  if (objc_msgSend(a3, "isEqualToString:", *MEMORY[0x24BE50B48]))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", CFSTR("itms-appss://apps.apple.com/genre/ios-stickers/id6025"));
    objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "openURL:", v6);

  }
  v8 = v9;
  if (v9)
  {
    (*((void (**)(id))v9 + 2))(v9);
    v8 = v9;
  }

}

- (void)dragManagerDidBeginDragging:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BE15A38], "sharedTimer", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShouldStopWhenBackgrounded:", 0);

  if (-[IMAAppPresenter hidesCompactAppForStickerDrag](self, "hidesCompactAppForStickerDrag")
    && -[IMAAppPresenter isAppCompact](self, "isAppCompact"))
  {
    -[IMAAppPresenter animateSwitcherOffscreen:completion:](self, "animateSwitcherOffscreen:completion:", 1, 0);
  }
  -[IMAAppPresenter delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "didBeginDraggingSticker");

}

- (void)dragManager:(id)a3 draggedItemWithTarget:(id)a4
{
  id v6;
  void *v7;
  IMADropTarget *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  IMADropTarget *v22;
  void *v23;
  void *v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  _BOOL8 v35;
  id v36;
  CGPoint v37;
  CGRect v38;

  v36 = a3;
  v6 = a4;
  -[IMAAppPresenter delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v8 = [IMADropTarget alloc];
    objc_msgSend(v6, "screenCoordinate");
    v10 = v9;
    v12 = v11;
    objc_msgSend(v6, "initialSize");
    v14 = v13;
    v16 = v15;
    objc_msgSend(v6, "scale");
    v18 = v17;
    objc_msgSend(v6, "meshScaleFactor");
    v20 = v19;
    objc_msgSend(v6, "rotation");
    v22 = -[IMADropTarget initWithScreenCoordinate:initialSize:scale:meshScaleFactor:rotation:](v8, "initWithScreenCoordinate:initialSize:scale:meshScaleFactor:rotation:", v10, v12, v14, v16, v18, v20, v21);
    -[IMAAppPresenter switcherViewController](self, "switcherViewController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "view");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "frame");
    v26 = v25;
    v28 = v27;
    v30 = v29;
    v32 = v31;
    objc_msgSend(v6, "screenCoordinate");
    v37.x = v33;
    v37.y = v34;
    v38.origin.x = v26;
    v38.origin.y = v28;
    v38.size.width = v30;
    v38.size.height = v32;
    v35 = CGRectContainsPoint(v38, v37);

    objc_msgSend(v7, "didDragStickerToTarget:outsideSwitcher:", v22, v35 ^ 1);
    objc_msgSend(v36, "setPlusButtonHidden:", v35);

  }
}

- (void)dragManagerDidEndDragging:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BE15A38], "sharedTimer", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShouldStopWhenBackgrounded:", 1);

  if (-[IMAAppPresenter hidesCompactAppForStickerDrag](self, "hidesCompactAppForStickerDrag")
    && -[IMAAppPresenter isSwitcherOffscreen](self, "isSwitcherOffscreen"))
  {
    -[IMAAppPresenter animateSwitcherOffscreen:completion:](self, "animateSwitcherOffscreen:completion:", 0, 0);
  }
  -[IMAAppPresenter delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "didEndDraggingSticker");

}

- (int)dragManager:(id)a3 dropAreaForDragTarget:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  int v19;
  IMADropTarget *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  IMADropTarget *v34;
  void *v35;
  CGPoint v37;
  CGRect v38;

  v5 = a4;
  if (!-[IMAAppPresenter isAppCompact](self, "isAppCompact"))
    goto LABEL_5;
  if (-[IMAAppPresenter isSwitcherOffscreen](self, "isSwitcherOffscreen"))
    goto LABEL_5;
  -[IMAAppPresenter switcherViewController](self, "switcherViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "superview");
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frame");
  objc_msgSend((id)v8, "convertRect:toView:", 0);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  objc_msgSend(v5, "screenCoordinate");
  v37.x = v17;
  v37.y = v18;
  v38.origin.x = v10;
  v38.origin.y = v12;
  v38.size.width = v14;
  v38.size.height = v16;
  LOBYTE(v8) = CGRectContainsPoint(v38, v37);

  if ((v8 & 1) != 0)
  {
    v19 = 3;
  }
  else
  {
LABEL_5:
    v20 = [IMADropTarget alloc];
    objc_msgSend(v5, "screenCoordinate");
    v22 = v21;
    v24 = v23;
    objc_msgSend(v5, "initialSize");
    v26 = v25;
    v28 = v27;
    objc_msgSend(v5, "scale");
    v30 = v29;
    objc_msgSend(v5, "meshScaleFactor");
    v32 = v31;
    objc_msgSend(v5, "rotation");
    v34 = -[IMADropTarget initWithScreenCoordinate:initialSize:scale:meshScaleFactor:rotation:](v20, "initWithScreenCoordinate:initialSize:scale:meshScaleFactor:rotation:", v22, v24, v26, v28, v30, v32, v33);
    -[IMAAppPresenter delegate](self, "delegate");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v35, "isDropTargetValid:", v34) & 1) == 0)
    {
      if (-[IMAAppPresenter hidesCompactAppForStickerDrag](self, "hidesCompactAppForStickerDrag")
        && -[IMAAppPresenter isAppCompact](self, "isAppCompact"))
      {
        -[IMAAppPresenter animateSwitcherOffscreen:completion:](self, "animateSwitcherOffscreen:completion:", 0, 0);
      }
      v19 = 1;
    }
    else
    {
      v19 = 5;
    }

  }
  return v19;
}

- (void)dragManager:(id)a3 overrideDropPointForTarget:(id)a4 completion:(id)a5
{
  void (**v7)(_QWORD);
  void *v8;
  id v9;

  v9 = a4;
  v7 = (void (**)(_QWORD))a5;
  -[IMAAppPresenter delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v8, "overrideDropPointWithCompletion:", v7);
  }
  else
  {
    objc_msgSend(v9, "screenCoordinate");
    v7[2](v7);
  }

}

- (void)browserTransitionCoordinatorWillTransitionOrPresentToFullscreen:(id)a3 withReason:(int64_t)a4
{
  self->_isTransitioningPresentationStyles = 1;
}

- (void)browserTransitionCoordinatorDidTransitionOrPresentToFullscreen:(id)a3 withReason:(int64_t)a4
{
  self->_isTransitioningPresentationStyles = 0;
  -[IMAAppPresenter _hideCompactBrowserAnimated:completion:](self, "_hideCompactBrowserAnimated:completion:", 0, 0);
}

- (void)browserTransitionCoordinatorWillCollapseOrDismiss:(id)a3 withReason:(int64_t)a4
{
  self->_isTransitioningPresentationStyles = 1;
}

- (void)browserTransitionCoordinatorDidCollapseOrDismiss:(id)a3 withReason:(int64_t)a4
{
  self->_isTransitioningPresentationStyles = 0;
}

- (CGSize)browserTransitionCoordinator:(id)a3 preferredSizeForBrowser:(id)a4
{
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  if (-[IMAAppPresenter alwaysPresentAppsExpanded](self, "alwaysPresentAppsExpanded", a3, a4))
  {
    -[IMAAppPresenter alwaysExpandedAppViewControllerFrame](self, "alwaysExpandedAppViewControllerFrame");
    v6 = v5;
    v8 = v7;
    objc_msgSend(MEMORY[0x24BE15A60], "sharedBehaviors");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "browserSwitcherExpandedGrabberHeaderHeight");
    v11 = v8 - v10;

  }
  else
  {
    v6 = *MEMORY[0x24BDBF148];
    v11 = *(double *)(MEMORY[0x24BDBF148] + 8);
  }
  v12 = v6;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (BOOL)browserTransitionCoordinatorShouldDismissOnDragSuccess:(id)a3
{
  void *v3;
  char v4;

  -[IMAAppPresenter delegate](self, "delegate", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(v3, "expandedAppShouldDismissOnDragSuccess");
  else
    v4 = 0;

  return v4;
}

- (BOOL)shouldAlwaysShowAppTitle
{
  return 1;
}

- (id)transitionsPresentationViewController
{
  void *v2;
  void *v3;

  -[IMAAppPresenter delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v2, "dockPresentationViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (BOOL)shouldPresentAppCardInSendMenuWithTraitCollection:(id)a3
{
  return 0;
}

- (id)activeSendMenuPresentationForAppCardOverseer
{
  return 0;
}

- (void)appCardOverseerDidDismissAppCard
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t);
  void *v13;
  IMAAppPresenter *v14;
  id v15;

  -[IMAAppPresenter delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "appPresenterCardDidDismiss:", self);
  -[IMAAppPresenter savedStickerPresentationContext](self, "savedStickerPresentationContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stickerForDeferredRePresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[IMAAppPresenter savedStickerPresentationContext](self, "savedStickerPresentationContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "deferredPresentation");

  if (v7)
  {
    v10 = MEMORY[0x24BDAC760];
    v11 = 3221225472;
    v12 = __51__IMAAppPresenter_appCardOverseerDidDismissAppCard__block_invoke;
    v13 = &unk_24E210358;
    v14 = self;
    v15 = v5;
    dispatch_async(MEMORY[0x24BDAC9B8], &v10);
    -[IMAAppPresenter savedStickerPresentationContext](self, "savedStickerPresentationContext", v10, v11, v12, v13, v14);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setStickerForDeferredRePresentation:", 0);

    -[IMAAppPresenter savedStickerPresentationContext](self, "savedStickerPresentationContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDeferredPresentation:", 0);

  }
}

uint64_t __51__IMAAppPresenter_appCardOverseerDidDismissAppCard__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "stickerDruidDragEndedWithIMSticker:", *(_QWORD *)(a1 + 40));
}

- (CGRect)alwaysExpandedAppViewControllerFrame
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGRect result;

  if (!-[IMAAppPresenter alwaysPresentAppsExpanded](self, "alwaysPresentAppsExpanded"))
    goto LABEL_5;
  -[IMAAppPresenter delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

LABEL_5:
    v9 = *MEMORY[0x24BDBF090];
    v8 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v5 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v7 = *(double *)(MEMORY[0x24BDBF090] + 24);
    goto LABEL_6;
  }
  objc_msgSend(v3, "expandedAppViewControllerSize");
  v5 = v4;
  v7 = v6;

  v8 = 0.0;
  v9 = 0.0;
LABEL_6:
  v10 = v5;
  v11 = v7;
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v8;
  result.origin.x = v9;
  return result;
}

- (void)switcherViewControllerDidFinishSwitching:(id)a3 toViewController:(id)a4
{
  IMBalloonPlugin *v5;
  IMBalloonPlugin *v6;

  objc_msgSend(a4, "balloonPlugin", a3);
  v5 = (IMBalloonPlugin *)objc_claimAutoreleasedReturnValue();
  if (!self->_isTransitioningPresentationStyles && self->_currentBalloonPlugin != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_currentBalloonPlugin, v5);
    -[IMAAppPresenter notifyDelegateOfSelectedPlugin:](self, "notifyDelegateOfSelectedPlugin:", self->_currentBalloonPlugin);
    v5 = v6;
  }

}

- (BOOL)switcherViewControllerShouldShowIconAndTitleWhenCompact:(id)a3
{
  return CKIsRunningInMessages() == 0;
}

- (IMAAppPresenterDelegate)delegate
{
  return (IMAAppPresenterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (double)compactHeight
{
  return self->_compactHeight;
}

- (void)setCompactHeight:(double)a3
{
  self->_compactHeight = a3;
}

- (BOOL)alwaysPresentAppsExpanded
{
  return self->_alwaysPresentAppsExpanded;
}

- (void)setAlwaysPresentAppsExpanded:(BOOL)a3
{
  self->_alwaysPresentAppsExpanded = a3;
}

- (BOOL)hidesCompactAppForStickerDrag
{
  return self->_hidesCompactAppForStickerDrag;
}

- (void)setHidesCompactAppForStickerDrag:(BOOL)a3
{
  self->_hidesCompactAppForStickerDrag = a3;
}

- (void)setSwitcherViewController:(id)a3
{
  objc_storeStrong((id *)&self->_switcherViewController, a3);
}

- (void)setAppCardPresentationOverseer:(id)a3
{
  objc_storeStrong((id *)&self->_appCardPresentationOverseer, a3);
}

- (IMAStickerPickerPresentationContext)savedStickerPresentationContext
{
  return self->_savedStickerPresentationContext;
}

- (void)setSavedStickerPresentationContext:(id)a3
{
  objc_storeStrong((id *)&self->_savedStickerPresentationContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_savedStickerPresentationContext, 0);
  objc_storeStrong((id *)&self->_appCardPresentationOverseer, 0);
  objc_storeStrong((id *)&self->_switcherViewController, 0);
  objc_storeStrong((id *)&self->_transitionCoordinator, 0);
  objc_storeStrong((id *)&self->_expandedAppViewController, 0);
  objc_storeStrong((id *)&self->_currentBalloonPlugin, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

+ (void)disableAutomaticAppDiscovery
{
  objc_msgSend(MEMORY[0x24BE502A0], "disableExtensionDiscovery");
}

+ (void)loadAppWithIdentifierIfNeeded:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x24BE502A0];
  v4 = a3;
  objc_msgSend(v3, "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "loadExtensionWithIdentifierIfNeeded:", v4);

}

- (id)currentStickerViewController
{
  void *v3;
  uint64_t v4;
  void *v5;

  if (-[IMAAppPresenter isAppCardsEnabled](self, "isAppCardsEnabled"))
  {
    -[IMAAppPresenter appCardPresentationOverseer](self, "appCardPresentationOverseer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "browserViewController");
    v4 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v5 = (void *)v4;

    return v5;
  }
  if (!-[IMAAppPresenter alwaysPresentAppsExpanded](self, "alwaysPresentAppsExpanded"))
  {
    -[IMAAppPresenter switcherViewController](self, "switcherViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "currentViewController");
    v4 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  -[CKExpandedAppViewController contentViewController](self->_expandedAppViewController, "contentViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  return v5;
}

- (void)stickerDruidDragEndedWithIMSticker:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_21E02D000, a1, a3, "Failed to weak link CKPluginExtensionStateObserverStickerDragEnded. This may cause sticker drags to fail.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)stickerDruidDragEndedWithIMSticker:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_21E02D000, a1, a3, "Attempting to represent the sticker picker in a popover without a source view, falling back to card presentation!", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

@end
