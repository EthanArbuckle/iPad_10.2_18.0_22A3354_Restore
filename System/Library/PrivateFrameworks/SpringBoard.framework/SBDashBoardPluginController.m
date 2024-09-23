@implementation SBDashBoardPluginController

- (SBDashBoardPluginController)initWithCoverSheetViewController:(id)a3
{
  id v5;
  SBDashBoardPluginController *v6;
  SBDashBoardPluginController *v7;
  SBLockScreenPluginManager *v8;
  SBLockScreenPluginManager *pluginManager;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBDashBoardPluginController;
  v6 = -[SBDashBoardPluginController init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_coverSheetViewController, a3);
    v8 = objc_alloc_init(SBLockScreenPluginManager);
    pluginManager = v7->_pluginManager;
    v7->_pluginManager = v8;

    -[CSCoverSheetViewController registerExternalEventHandler:](v7->_coverSheetViewController, "registerExternalEventHandler:", v7);
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[SBDashBoardPluginController _setPluginViewController:](self, "_setPluginViewController:", 0);
  -[SBDashBoardPluginController _deactivate](self, "_deactivate");
  -[CSCoverSheetViewController unregisterExternalEventHandler:](self->_coverSheetViewController, "unregisterExternalEventHandler:", self);
  v3.receiver = self;
  v3.super_class = (Class)SBDashBoardPluginController;
  -[SBDashBoardPluginController dealloc](&v3, sel_dealloc);
}

- (SBLockScreenActionProvider)lockScreenActionProvider
{
  return (SBLockScreenActionProvider *)self->_pluginManager;
}

- (void)_activate
{
  -[SBLockScreenPluginManager setDelegate:](self->_pluginManager, "setDelegate:", self);
  -[SBLockScreenPluginManager setEnabled:](self->_pluginManager, "setEnabled:", 1);
}

- (void)_deactivate
{
  -[SBLockScreenPluginManager setEnabled:](self->_pluginManager, "setEnabled:", 0);
  -[SBLockScreenPluginManager setEnabled:](self->_pluginManager, "setEnabled:", 0);
}

- (void)_setPluginViewController:(id)a3
{
  SBDashBoardPluginViewController *v5;
  SBDashBoardPluginViewController *pluginViewController;
  uint64_t v7;
  NSObject *v8;
  SBDashBoardPluginViewController *v9;
  int64_t pluginViewControllerPresentationStyle;
  NSObject *v11;
  int64_t v12;
  _QWORD v13[5];
  _QWORD v14[5];

  v5 = (SBDashBoardPluginViewController *)a3;
  pluginViewController = self->_pluginViewController;
  if (pluginViewController != v5)
  {
    v7 = MEMORY[0x1E0C809B0];
    if (pluginViewController
      || (-[CSCoverSheetViewController registerExternalAppearanceProvider:](self->_coverSheetViewController, "registerExternalAppearanceProvider:", self), -[CSCoverSheetViewController registerExternalBehaviorProvider:](self->_coverSheetViewController, "registerExternalBehaviorProvider:", self), self->_pluginViewController))
    {
      SBLogDashBoard();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        -[SBDashBoardPluginController _setPluginViewController:].cold.2(v5, v8);

      v9 = self->_pluginViewController;
      pluginViewControllerPresentationStyle = self->_pluginViewControllerPresentationStyle;
      v14[0] = v7;
      v14[1] = 3221225472;
      v14[2] = __56__SBDashBoardPluginController__setPluginViewController___block_invoke;
      v14[3] = &unk_1E8E9DED8;
      v14[4] = self;
      -[SBDashBoardPluginController _dismissPluginViewController:withStyle:animated:completion:](self, "_dismissPluginViewController:withStyle:animated:completion:", v9, pluginViewControllerPresentationStyle, v5 == 0, v14);
    }
    objc_storeStrong((id *)&self->_pluginViewController, a3);
    self->_pluginViewControllerPresentationStyle = -[SBDashBoardPluginViewController presentationStyle](v5, "presentationStyle");
    if (!self->_pluginViewController)
      goto LABEL_11;
    SBLogDashBoard();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[SBDashBoardPluginController _setPluginViewController:].cold.1(v5, v11);

    v12 = self->_pluginViewControllerPresentationStyle;
    v13[0] = v7;
    v13[1] = 3221225472;
    v13[2] = __56__SBDashBoardPluginController__setPluginViewController___block_invoke_3;
    v13[3] = &unk_1E8E9DED8;
    v13[4] = self;
    -[SBDashBoardPluginController _presentPluginViewController:withStyle:animated:completion:](self, "_presentPluginViewController:withStyle:animated:completion:", v5, v12, 1, v13);
    if (!self->_pluginViewController)
    {
LABEL_11:
      -[CSCoverSheetViewController unregisterExternalAppearanceProvider:](self->_coverSheetViewController, "unregisterExternalAppearanceProvider:", self);
      -[CSCoverSheetViewController unregisterExternalBehaviorProvider:](self->_coverSheetViewController, "unregisterExternalBehaviorProvider:", self);
    }
  }

}

void __56__SBDashBoardPluginController__setPluginViewController___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;

  SBLogDashBoard();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __56__SBDashBoardPluginController__setPluginViewController___block_invoke_cold_1(a1, v2, v3);

}

void __56__SBDashBoardPluginController__setPluginViewController___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;

  SBLogDashBoard();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __56__SBDashBoardPluginController__setPluginViewController___block_invoke_3_cold_1(a1, v2, v3);

}

- (void)_dismissPluginViewController:(id)a3 withStyle:(int64_t)a4 animated:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v10;
  void (**v11)(_QWORD);
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, void *);
  void *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  void (**v26)(_QWORD);

  v7 = a5;
  v10 = a3;
  v11 = (void (**)(_QWORD))a6;
  -[SBDashBoardPluginViewController plugin](self->_pluginViewController, "plugin");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
  {
    v13 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __90__SBDashBoardPluginController__dismissPluginViewController_withStyle_animated_completion___block_invoke;
    v23[3] = &unk_1E8EA7D10;
    v14 = v10;
    v24 = v14;
    v26 = v11;
    v15 = v12;
    v25 = v15;
    v16 = (void *)MEMORY[0x1D17E5550](v23);
    v18 = v13;
    v19 = 3221225472;
    v20 = __90__SBDashBoardPluginController__dismissPluginViewController_withStyle_animated_completion___block_invoke_3;
    v21 = &unk_1E8EB5620;
    v22 = v15;
    objc_msgSend(v22, "enumerateLifecycleObserversUsingBlock:", &v18);
    if (a4 == 1)
    {
      -[CSCoverSheetViewController mainPagePresentationViewController](self->_coverSheetViewController, "mainPagePresentationViewController", v18, v19, v20, v21);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "dismissContentViewController:animated:completion:", v14, v7, v16);

    }
    else if (a4 == 2)
    {
      -[CSCoverSheetViewController _dismissModalViewController:animated:completion:](self->_coverSheetViewController, "_dismissModalViewController:animated:completion:", v14, v7, v16, v18, v19, v20, v21);
    }

  }
  else if (v11)
  {
    v11[2](v11);
  }

}

void __90__SBDashBoardPluginController__dismissPluginViewController_withStyle_animated_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "setPresenter:", 0);
  v2 = *(_QWORD *)(a1 + 48);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  v3 = *(void **)(a1 + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __90__SBDashBoardPluginController__dismissPluginViewController_withStyle_animated_completion___block_invoke_2;
  v4[3] = &unk_1E8EB5620;
  v5 = v3;
  objc_msgSend(v5, "enumerateLifecycleObserversUsingBlock:", v4);

}

uint64_t __90__SBDashBoardPluginController__dismissPluginViewController_withStyle_animated_completion___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "didDismissLockScreenPlugin:", *(_QWORD *)(a1 + 32));
}

uint64_t __90__SBDashBoardPluginController__dismissPluginViewController_withStyle_animated_completion___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "willDismissLockScreenPlugin:", *(_QWORD *)(a1 + 32));
}

- (void)_presentPluginViewController:(id)a3 withStyle:(int64_t)a4 animated:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v10;
  void (**v11)(_QWORD);
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  void (**v21)(_QWORD);

  v7 = a5;
  v10 = a3;
  v11 = (void (**)(_QWORD))a6;
  objc_msgSend(v10, "plugin");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
  {
    v13 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __90__SBDashBoardPluginController__presentPluginViewController_withStyle_animated_completion___block_invoke;
    v19[3] = &unk_1E8E9F1E8;
    v21 = v11;
    v14 = v12;
    v20 = v14;
    v15 = (void *)MEMORY[0x1D17E5550](v19);
    v17[0] = v13;
    v17[1] = 3221225472;
    v17[2] = __90__SBDashBoardPluginController__presentPluginViewController_withStyle_animated_completion___block_invoke_3;
    v17[3] = &unk_1E8EB5620;
    v18 = v14;
    objc_msgSend(v18, "enumerateLifecycleObserversUsingBlock:", v17);
    if (a4 == 1)
    {
      -[CSCoverSheetViewController mainPagePresentationViewController](self->_coverSheetViewController, "mainPagePresentationViewController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "presentContentViewController:animated:completion:", v10, v7, v15);

    }
    else if (a4 == 2)
    {
      -[CSCoverSheetViewController _presentModalViewController:animated:completion:](self->_coverSheetViewController, "_presentModalViewController:animated:completion:", v10, v7, v15);
    }

  }
  else if (v11)
  {
    v11[2](v11);
  }

}

void __90__SBDashBoardPluginController__presentPluginViewController_withStyle_animated_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  v3 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __90__SBDashBoardPluginController__presentPluginViewController_withStyle_animated_completion___block_invoke_2;
  v4[3] = &unk_1E8EB5620;
  v5 = v3;
  objc_msgSend(v5, "enumerateLifecycleObserversUsingBlock:", v4);

}

uint64_t __90__SBDashBoardPluginController__presentPluginViewController_withStyle_animated_completion___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "didPresentLockScreenPlugin:", *(_QWORD *)(a1 + 32));
}

uint64_t __90__SBDashBoardPluginController__presentPluginViewController_withStyle_animated_completion___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "willPresentLockScreenPlugin:", *(_QWORD *)(a1 + 32));
}

- (NSString)coverSheetIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (int64_t)participantState
{
  return 2;
}

- (NSSet)components
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  -[SBDashBoardPluginViewController plugin](self->_pluginViewController, "plugin");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "coverSheetAppearance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentForType:property:", 1, 16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    objc_msgSend(v3, "addObject:", v6);
  -[SBDashBoardPluginViewController plugin](self->_pluginViewController, "plugin");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hidesLockScreenComplications");

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0D1BB88], "complicationSidebar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBDashBoardPluginController appearanceIdentifier](self, "appearanceIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "hidden:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D1BB88], "complicationContainer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBDashBoardPluginController appearanceIdentifier](self, "appearanceIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "identifier:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "hidden:", 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "addObject:", v12);
    objc_msgSend(v3, "addObject:", v16);

  }
  return (NSSet *)v3;
}

- (_UILegibilitySettings)legibilitySettings
{
  return 0;
}

- (unint64_t)restrictedCapabilities
{
  return -[CSCoverSheetViewControllerBase restrictedCapabilities](self->_pluginViewController, "restrictedCapabilities");
}

- (int64_t)notificationBehavior
{
  return 0;
}

- (int64_t)proximityDetectionMode
{
  return 0;
}

- (int64_t)scrollingStrategy
{
  return 0;
}

- (BOOL)wouldHandleButtonEvent:(id)a3
{
  return 0;
}

- (BOOL)handleEvent:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  v5 = 0;
  switch(objc_msgSend(v4, "type"))
  {
    case 3:
    case 8:
      -[SBDashBoardPluginController _activate](self, "_activate");
      goto LABEL_5;
    case 6:
    case 9:
      -[SBDashBoardPluginController _deactivate](self, "_deactivate");
      goto LABEL_5;
    case 12:
      if (-[SBLockScreenPluginManager handleEvent:](self->_pluginManager, "handleEvent:", 1))
LABEL_5:
        v5 = objc_msgSend(v4, "isConsumable");
      else
        v5 = 0;
      break;
    default:
      break;
  }

  return v5;
}

- (void)enableLockScreenPluginWithContext:(id)a3
{
  -[SBLockScreenPluginManager enableLockScreenPluginWithContext:](self->_pluginManager, "enableLockScreenPluginWithContext:", a3);
}

- (void)disableLockScreenPluginWithContext:(id)a3
{
  -[SBLockScreenPluginManager disableLockScreenPluginWithContext:](self->_pluginManager, "disableLockScreenPluginWithContext:", a3);
}

- (void)pluginManager:(id)a3 displayedPluginDidUpdateAppearance:(id)a4
{
  id v7;
  id v8;
  SBDashBoardPluginViewController *pluginViewController;
  id v10;
  NSObject *v11;
  int64_t pluginViewControllerPresentationStyle;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  pluginViewController = self->_pluginViewController;
  if (!pluginViewController)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDashBoardPluginController.m"), 301, CFSTR("We must have a plugin for the active one to have changed it's appearance."));

    pluginViewController = self->_pluginViewController;
  }
  -[SBDashBoardPluginViewController plugin](pluginViewController, "plugin");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10 != v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDashBoardPluginController.m"), 302, CFSTR("The active plugin that changed wasn't the one we knew about now."));

  }
  SBLogDashBoard();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v8;
    _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_INFO, "Active uplugin changed it's appearance style: %@", buf, 0xCu);
  }

  pluginViewControllerPresentationStyle = self->_pluginViewControllerPresentationStyle;
  if (pluginViewControllerPresentationStyle != -[SBDashBoardPluginViewController presentationStyle](self->_pluginViewController, "presentationStyle"))
  {
    v13 = (void *)MEMORY[0x1E0CEABB0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __80__SBDashBoardPluginController_pluginManager_displayedPluginDidUpdateAppearance___block_invoke;
    v16[3] = &unk_1E8E9E820;
    v16[4] = self;
    v17 = v8;
    objc_msgSend(v13, "performWithoutAnimation:", v16);

  }
}

uint64_t __80__SBDashBoardPluginController_pluginManager_displayedPluginDidUpdateAppearance___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  _DWORD v8[2];
  __int16 v9;
  int v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  SBLogDashBoard();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(v3 + 24);
    v5 = objc_msgSend(*(id *)(v3 + 16), "presentationStyle");
    v6 = *(_QWORD *)(a1 + 40);
    v8[0] = 67109634;
    v8[1] = v4;
    v9 = 1024;
    v10 = v5;
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_INFO, "Plugin changed presentation style from %d to %d: %@", (uint8_t *)v8, 0x18u);
  }

  objc_msgSend(*(id *)(a1 + 32), "_dismissPluginViewController:withStyle:animated:completion:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), 0, 0);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "presentationStyle");
  return objc_msgSend(*(id *)(a1 + 32), "_presentPluginViewController:withStyle:animated:completion:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), 0, 0);
}

- (void)pluginManager:(id)a3 displayedPluginDidChangeFromPlugin:(id)a4 toPlugin:(id)a5
{
  SBDashBoardPluginViewController *v6;
  id v7;

  v7 = a5;
  if (v7)
  {
    v6 = -[SBDashBoardPluginViewController initWithLockScreenPlugin:]([SBDashBoardPluginViewController alloc], "initWithLockScreenPlugin:", v7);
    -[SBDashBoardPluginController _setPluginViewController:](self, "_setPluginViewController:", v6);

  }
  else
  {
    -[SBDashBoardPluginController _setPluginViewController:](self, "_setPluginViewController:", 0);
  }

}

- (BOOL)pluginManager:(id)a3 plugin:(id)a4 handleAction:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  CSCoverSheetViewController *coverSheetViewController;
  void *v12;
  _BOOL8 v13;

  v7 = a5;
  v8 = a4;
  +[SBLockScreenActionContextFactory sharedInstance](SBLockScreenActionContextFactory, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "lockScreenActionContextForAction:fromPlugin:", v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 && self->_pluginViewController)
  {
    coverSheetViewController = self->_coverSheetViewController;
    objc_msgSend(MEMORY[0x1E0D1BB48], "actionWithContext:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSCoverSheetViewController handleAction:fromSender:](coverSheetViewController, "handleAction:fromSender:", v12, self->_pluginViewController);

    v13 = 1;
  }
  else
  {
    v13 = 0;
  }
  objc_msgSend(v7, "sendResponseWithSuccess:", v13);

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pluginManager, 0);
  objc_storeStrong((id *)&self->_pluginViewController, 0);
  objc_storeStrong((id *)&self->_coverSheetViewController, 0);
}

- (void)_setPluginViewController:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "plugin");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_0_1(&dword_1D0540000, a2, v4, "Presenting plugin view controller for plugin: %@", (uint8_t *)&v5);

  OUTLINED_FUNCTION_2_2();
}

- (void)_setPluginViewController:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "plugin");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_0_1(&dword_1D0540000, a2, v4, "Dismissing plugin view controller for plugin: %@", (uint8_t *)&v5);

  OUTLINED_FUNCTION_2_2();
}

void __56__SBDashBoardPluginController__setPluginViewController___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_0_1(&dword_1D0540000, a2, a3, "Dismissed plugin view controller: %@.", (uint8_t *)&v4);
}

void __56__SBDashBoardPluginController__setPluginViewController___block_invoke_3_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_0_1(&dword_1D0540000, a2, a3, "Presented plugin view controller: %@.", (uint8_t *)&v4);
}

@end
