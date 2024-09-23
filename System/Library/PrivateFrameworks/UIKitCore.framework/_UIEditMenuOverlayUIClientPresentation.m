@implementation _UIEditMenuOverlayUIClientPresentation

- (_UIEditMenuOverlayUIClientPresentation)initWithDelegate:(id)a3 sourceView:(id)a4
{
  _UIEditMenuOverlayUIClientPresentation *v4;
  uint64_t v5;
  _UIHostedMenuManager *menuManager;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UIEditMenuOverlayUIClientPresentation;
  v4 = -[_UIEditMenuPresentation initWithDelegate:sourceView:](&v8, sel_initWithDelegate_sourceView_, a3, a4);
  if (v4)
  {
    v5 = objc_opt_new();
    menuManager = v4->_menuManager;
    v4->_menuManager = (_UIHostedMenuManager *)v5;

  }
  return v4;
}

- (void)setDisplayedMenu:(id)a3
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIEditMenuOverlayUIPresentation.m"), 51, CFSTR("setDisplayedMenu: is not available"));

}

- (id)displayedMenu
{
  return -[_UIHostedMenuManager displayedMenu](self->_menuManager, "displayedMenu");
}

- (void)displayMenu:(id)a3 configuration:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  _UIOEditMenuPresentationConfiguration *v27;
  _UIOEditMenuPresentationConfiguration *presentationConfiguration;
  void *v29;
  _UIORequestEditMenuPresentationAction *v30;
  _UIOEditMenuPresentationConfiguration *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  unint64_t v35;
  NSObject *v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[_UIEditMenuPresentation setActiveConfiguration:](self, "setActiveConfiguration:", v7);
  -[_UIEditMenuPresentation sourceView](self, "sourceView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIEditMenuSceneComponent sceneComponentForView:](_UIEditMenuSceneComponent, "sceneComponentForView:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[_UIEditMenuOverlayUIClientPresentation _configureOverlayServiceIfNeeded](self, "_configureOverlayServiceIfNeeded");
    -[_UIEditMenuPresentation delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_editMenuPresentation:targetRectForConfiguration:", self, v7);
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;

    -[_UIEditMenuPresentation sourceView](self, "sourceView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[UIView _constrainRectWithinSceneBounds:additionalInsets:](v19, v12, v14, v16, v18, 10.0);
    v22 = v21;
    v24 = v23;
    v26 = v25;

    +[_UIOEditMenuPresentationConfiguration configurationWithMenu:preferredArrowDirection:sourceRect:enforcesMenuControllerLifecycle:initialUserInterfaceStyle:](_UIOEditMenuPresentationConfiguration, "configurationWithMenu:preferredArrowDirection:sourceRect:enforcesMenuControllerLifecycle:initialUserInterfaceStyle:", v6, objc_msgSend(v7, "preferredArrowDirection"), -[_UIEditMenuPresentation enforcesMenuControllerLifecycle](self, "enforcesMenuControllerLifecycle"), -[_UIEditMenuPresentation resolvedUserInterfaceStyle](self, "resolvedUserInterfaceStyle"), v20, v22, v24, v26);
    v27 = (_UIOEditMenuPresentationConfiguration *)objc_claimAutoreleasedReturnValue();
    presentationConfiguration = self->_presentationConfiguration;
    self->_presentationConfiguration = v27;

    objc_msgSend(v9, "setActivePresentation:", self);
    -[_UIEditMenuOverlayUIClientPresentation menuManager](self, "menuManager");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setRootMenu:", v6);

    v30 = [_UIORequestEditMenuPresentationAction alloc];
    v31 = self->_presentationConfiguration;
    -[_UIEditMenuPresentation sourceView](self, "sourceView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = -[_UIORequestEditMenuPresentationAction initWithConfiguration:view:](v30, "initWithConfiguration:view:", v31, v32);

    -[_UIEditMenuOverlayUIClientPresentation overlayService](self, "overlayService");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "sendOverlayAction:", v33);

LABEL_9:
    goto LABEL_10;
  }
  if (os_variant_has_internal_diagnostics())
  {
    __UIFaultDebugAssertLog();
    v33 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
      goto LABEL_9;
    -[_UIEditMenuPresentation activeConfiguration](self, "activeConfiguration");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIEditMenuPresentation sourceView](self, "sourceView");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = 138412546;
    v40 = v37;
    v41 = 2112;
    v42 = v38;
    _os_log_fault_impl(&dword_185066000, v33, OS_LOG_TYPE_FAULT, "The edit menu (configuration: %@) can only be presented when the view is in a window scene: %@", (uint8_t *)&v39, 0x16u);
    goto LABEL_8;
  }
  v35 = displayMenu_configuration____s_category;
  if (!displayMenu_configuration____s_category)
  {
    v35 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v35, (unint64_t *)&displayMenu_configuration____s_category);
  }
  v36 = *(NSObject **)(v35 + 8);
  if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
  {
    v33 = v36;
    -[_UIEditMenuPresentation activeConfiguration](self, "activeConfiguration");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIEditMenuPresentation sourceView](self, "sourceView");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = 138412546;
    v40 = v37;
    v41 = 2112;
    v42 = v38;
    _os_log_impl(&dword_185066000, v33, OS_LOG_TYPE_ERROR, "The edit menu (configuration: %@) can only be presented when the view is in a window scene: %@", (uint8_t *)&v39, 0x16u);
LABEL_8:

    goto LABEL_9;
  }
LABEL_10:

}

- (void)sourceViewDidUpdateFromTraitCollection:(id)a3
{
  id v4;
  int64_t v5;
  uint64_t v6;
  _UIORequestEditMenuTraitUpdateAction *v7;
  void *v8;
  void *v9;
  void *v10;
  _UIORequestEditMenuTraitUpdateAction *v11;

  v4 = a3;
  v5 = -[_UIEditMenuPresentation resolvedUserInterfaceStyle](self, "resolvedUserInterfaceStyle");
  v6 = objc_msgSend(v4, "userInterfaceStyle");

  if (v5 != v6)
  {
    v7 = [_UIORequestEditMenuTraitUpdateAction alloc];
    -[_UIEditMenuOverlayUIClientPresentation presentationConfiguration](self, "presentationConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[_UIORequestEditMenuTraitUpdateAction initWithConfigurationIdentifier:userInterfaceStyle:](v7, "initWithConfigurationIdentifier:userInterfaceStyle:", v9, v5);

    -[_UIEditMenuOverlayUIClientPresentation overlayService](self, "overlayService");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sendOverlayAction:", v11);

  }
}

- (void)replaceVisibleMenuWithMenu:(id)a3 reason:(int64_t)a4
{
  id v6;
  _UIORequestEditMenuUpdateAction *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _UIORequestEditMenuUpdateAction *v12;

  v6 = a3;
  v7 = [_UIORequestEditMenuUpdateAction alloc];
  -[_UIEditMenuOverlayUIClientPresentation presentationConfiguration](self, "presentationConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[_UIORequestEditMenuUpdateAction initWithConfigurationIdentifier:updatedMenu:reason:](v7, "initWithConfigurationIdentifier:updatedMenu:reason:", v9, v6, a4);

  -[_UIEditMenuOverlayUIClientPresentation overlayService](self, "overlayService");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sendOverlayAction:", v12);

  -[_UIEditMenuOverlayUIClientPresentation menuManager](self, "menuManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDisplayedMenu:", v6);

}

- (void)hideMenuWithReason:(int64_t)a3
{
  void *v5;
  _UIORequestEditMenuDismissalAction *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[_UIEditMenuOverlayUIClientPresentation presentationConfiguration](self, "presentationConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v6 = -[_UIORequestEditMenuDismissalAction initWithConfigurationIdentifier:reason:]([_UIORequestEditMenuDismissalAction alloc], "initWithConfigurationIdentifier:reason:", v10, a3);
  -[_UIEditMenuOverlayUIClientPresentation overlayService](self, "overlayService");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sendOverlayAction:", v6);

  -[_UIEditMenuPresentation sourceView](self, "sourceView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIEditMenuSceneComponent sceneComponentForView:](_UIEditMenuSceneComponent, "sceneComponentForView:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeActivePresentation:", self);

}

- (void)handleLifecycleEvent:(int64_t)a3
{
  if ((unint64_t)a3 <= 3)
    -[_UIEditMenuPresentation transitionWithEvent:](self, "transitionWithEvent:");
}

- (void)performMenuLeafAction:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  NSObject *v14;
  NSObject *v15;
  uint8_t v16[16];
  uint8_t buf[16];

  v6 = a4;
  v7 = a3;
  -[_UIEditMenuOverlayUIClientPresentation menuManager](self, "menuManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "menuLeafForIdentifier:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "pasteAuthenticationMessage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[UIPasteboard _attemptAuthenticationWithMessage:](UIPasteboard, "_attemptAuthenticationWithMessage:", v11);
  if (v10)
  {
    -[_UIEditMenuPresentation delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_editMenuPresentation:didSelectMenuLeaf:completion:", self, v10, v6);

  }
  else if (os_variant_has_internal_diagnostics())
  {
    __UIFaultDebugAssertLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_185066000, v15, OS_LOG_TYPE_FAULT, "Could not find matching menu leaf in the menu...", buf, 2u);
    }

  }
  else
  {
    v13 = performMenuLeafAction_completionHandler____s_category;
    if (!performMenuLeafAction_completionHandler____s_category)
    {
      v13 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v13, (unint64_t *)&performMenuLeafAction_completionHandler____s_category);
    }
    v14 = *(NSObject **)(v13 + 8);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_185066000, v14, OS_LOG_TYPE_ERROR, "Could not find matching menu leaf in the menu...", v16, 2u);
    }
  }

}

- (void)preparedMenuWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v14[5];
  id v15;

  v7 = a4;
  v8 = a3;
  -[_UIEditMenuOverlayUIClientPresentation menuManager](self, "menuManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "menuForIdentifier:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIEditMenuOverlayUIPresentation.m"), 158, CFSTR("Could not find matching menu for the given request"));

  }
  -[_UIEditMenuPresentation delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __87___UIEditMenuOverlayUIClientPresentation_preparedMenuWithIdentifier_completionHandler___block_invoke;
  v14[3] = &unk_1E16CD258;
  v14[4] = self;
  v15 = v7;
  v12 = v7;
  objc_msgSend(v11, "_editMenuPresentation:preparedMenuForDisplay:completion:", self, v10, v14);

}

- (void)didTransitionFrom:(unint64_t)a3 to:(unint64_t)a4
{
  void *v6;
  void *v7;
  _QWORD v8[5];
  _QWORD v9[5];
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_UIEditMenuOverlayUIClientPresentation;
  -[_UIEditMenuPresentation didTransitionFrom:to:](&v10, sel_didTransitionFrom_to_, a3);
  if (a4 == 4)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __63___UIEditMenuOverlayUIClientPresentation_didTransitionFrom_to___block_invoke_2;
    v8[3] = &unk_1E16B1B28;
    v8[4] = self;
    -[_UIEditMenuPresentation animateScaleDismissalWithAnimations:completion:](self, "animateScaleDismissalWithAnimations:completion:", v8, 0);
    -[_UIEditMenuPresentation sourceView](self, "sourceView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIEditMenuSceneComponent sceneComponentForView:](_UIEditMenuSceneComponent, "sceneComponentForView:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeActivePresentation:", self);

  }
  else if (a4 == 2)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __63___UIEditMenuOverlayUIClientPresentation_didTransitionFrom_to___block_invoke;
    v9[3] = &unk_1E16B1B28;
    v9[4] = self;
    -[_UIEditMenuPresentation animateScalePresentWithDelay:animations:completion:](self, "animateScalePresentWithDelay:animations:completion:", v9, 0, 0.0);
  }
}

- (void)_configureOverlayServiceIfNeeded
{
  _UIOverlayService *v3;
  _UIOverlayService *overlayService;

  if (!self->_overlayService)
  {
    v3 = (_UIOverlayService *)objc_opt_new();
    overlayService = self->_overlayService;
    self->_overlayService = v3;

    -[_UIOverlayService setDelegate:](self->_overlayService, "setDelegate:", self);
    -[_UIOverlayService prewarmConnection](self->_overlayService, "prewarmConnection");
  }
}

- (void)overlayServiceDidInvalidate:(id)a3
{
  -[_UIEditMenuOverlayUIClientPresentation hideMenuWithReason:](self, "hideMenuWithReason:", 0);
}

- (_UIOEditMenuPresentationConfiguration)presentationConfiguration
{
  return self->_presentationConfiguration;
}

- (_UIOverlayService)overlayService
{
  return self->_overlayService;
}

- (_UIHostedMenuManager)menuManager
{
  return self->_menuManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_menuManager, 0);
  objc_storeStrong((id *)&self->_overlayService, 0);
  objc_storeStrong((id *)&self->_presentationConfiguration, 0);
}

@end
