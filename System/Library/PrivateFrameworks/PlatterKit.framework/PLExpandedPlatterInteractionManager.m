@implementation PLExpandedPlatterInteractionManager

+ (void)initialize
{
  id v3;

  objc_opt_self();
  v3 = (id)objc_claimAutoreleasedReturnValue();

  if (v3 == a1)
    PLRegisterPlatterKitLogging();
}

- (PLExpandedPlatterInteractionManager)initWithPresentingViewController:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  PLExpandedPlatterInteractionManager *v8;
  PLExpandedPlatterInteractionManager *v9;
  __int16 v10;
  __int16 v11;
  __int16 v12;
  __int16 v13;
  __int16 v14;
  __int16 v15;
  __int16 v16;
  __int16 v17;
  PLContextMenuInteraction *v18;
  UIContextMenuInteraction *contextMenuInteraction;
  void *v20;
  objc_super v22;

  v6 = a3;
  v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)PLExpandedPlatterInteractionManager;
  v8 = -[PLExpandedPlatterInteractionManager init](&v22, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_presentingViewController, v6);
    objc_storeWeak((id *)&v9->_delegate, v7);
    *(_WORD *)&v9->_expandedPlatterInteractionManagerDelegateFlags = *(_WORD *)&v9->_expandedPlatterInteractionManagerDelegateFlags & 0xFFFE | objc_opt_respondsToSelector() & 1;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v10 = 2;
    else
      v10 = 0;
    *(_WORD *)&v9->_expandedPlatterInteractionManagerDelegateFlags = *(_WORD *)&v9->_expandedPlatterInteractionManagerDelegateFlags & 0xFFFD | v10;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v11 = 4;
    else
      v11 = 0;
    *(_WORD *)&v9->_expandedPlatterInteractionManagerDelegateFlags = *(_WORD *)&v9->_expandedPlatterInteractionManagerDelegateFlags & 0xFFFB | v11;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v12 = 8;
    else
      v12 = 0;
    *(_WORD *)&v9->_expandedPlatterInteractionManagerDelegateFlags = *(_WORD *)&v9->_expandedPlatterInteractionManagerDelegateFlags & 0xFFF7 | v12;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v13 = 16;
    else
      v13 = 0;
    *(_WORD *)&v9->_expandedPlatterInteractionManagerDelegateFlags = *(_WORD *)&v9->_expandedPlatterInteractionManagerDelegateFlags & 0xFFEF | v13;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v14 = 32;
    else
      v14 = 0;
    *(_WORD *)&v9->_expandedPlatterInteractionManagerDelegateFlags = *(_WORD *)&v9->_expandedPlatterInteractionManagerDelegateFlags & 0xFFDF | v14;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v15 = 64;
    else
      v15 = 0;
    *(_WORD *)&v9->_expandedPlatterInteractionManagerDelegateFlags = *(_WORD *)&v9->_expandedPlatterInteractionManagerDelegateFlags & 0xFFBF | v15;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v16 = 128;
    else
      v16 = 0;
    *(_WORD *)&v9->_expandedPlatterInteractionManagerDelegateFlags = *(_WORD *)&v9->_expandedPlatterInteractionManagerDelegateFlags & 0xFF7F | v16;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v17 = 256;
    else
      v17 = 0;
    *(_WORD *)&v9->_expandedPlatterInteractionManagerDelegateFlags = *(_WORD *)&v9->_expandedPlatterInteractionManagerDelegateFlags & 0xFEFF | v17;
    v18 = -[PLContextMenuInteraction initWithDelegate:]([PLContextMenuInteraction alloc], "initWithDelegate:", v9);
    contextMenuInteraction = v9->_contextMenuInteraction;
    v9->_contextMenuInteraction = &v18->super;

    objc_msgSend(v6, "viewForPreview");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addInteraction:", v9->_contextMenuInteraction);

  }
  return v9;
}

- (void)presentAtLocation:(CGPoint)a3 completion:(id)a4
{
  double y;
  double x;
  id v7;
  NSObject *v8;
  void *v9;
  id cachedCompletion;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  if (self->_cachedCompletion)
  {
    v8 = PLLogTransition;
    if (os_log_type_enabled((os_log_t)PLLogTransition, OS_LOG_TYPE_ERROR))
      -[PLExpandedPlatterInteractionManager presentAtLocation:completion:].cold.1(v8);
    (*((void (**)(void))self->_cachedCompletion + 2))();
  }
  v9 = (void *)objc_msgSend(v7, "copy");
  cachedCompletion = self->_cachedCompletion;
  self->_cachedCompletion = v9;

  -[UIContextMenuInteraction _presentMenuAtLocation:](self->_contextMenuInteraction, "_presentMenuAtLocation:", x, y);
}

- (void)updateVisibleMenuWithBlock:(id)a3
{
  if (a3)
    -[UIContextMenuInteraction updateVisibleMenuWithBlock:](self->_contextMenuInteraction, "updateVisibleMenuWithBlock:");
}

- (void)dismiss
{
  -[UIContextMenuInteraction dismissMenu](self->_contextMenuInteraction, "dismissMenu");
}

- (BOOL)reachedForceThreshold
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[UIContextMenuInteraction _reachedForceThreshold](self->_contextMenuInteraction, "_reachedForceThreshold");
  else
    return 0;
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  id WeakRetained;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  int v17;
  id v18;
  void *v19;
  __int16 expandedPlatterInteractionManagerDelegateFlags;
  id *v21;
  id v22;
  _QWORD *v23;
  void *v24;
  __int16 v25;
  _QWORD *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id *v32;
  id *v33;
  id *v34;
  id v35;
  _QWORD v36[4];
  id v37;
  id v38;
  _QWORD v39[4];
  id v40;
  id v41;
  id location[2];

  y = a4.y;
  x = a4.x;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  v9 = PLLogTransition;
  if (os_log_type_enabled((os_log_t)PLLogTransition, OS_LOG_TYPE_DEBUG))
    -[PLExpandedPlatterInteractionManager contextMenuInteraction:configurationForMenuAtLocation:].cold.1((uint64_t)WeakRetained, v9, v10, v11, v12, v13, v14, v15);
  if ((*(_WORD *)&self->_expandedPlatterInteractionManagerDelegateFlags & 8) != 0
    && (v16 = objc_loadWeakRetained((id *)&self->_delegate),
        v17 = objc_msgSend(v16, "expandedPlatterInteractionManager:shouldBeginInteractionWithTouchAtLocation:", self, x, y), v16, !v17))
  {
    v30 = 0;
  }
  else
  {
    v35 = WeakRetained;
    objc_initWeak(location, self);
    v18 = objc_loadWeakRetained((id *)&self->_delegate);
    v19 = v18;
    expandedPlatterInteractionManagerDelegateFlags = (__int16)self->_expandedPlatterInteractionManagerDelegateFlags;
    v21 = (id *)MEMORY[0x1E0C809B0];
    v22 = v7;
    if ((expandedPlatterInteractionManagerDelegateFlags & 2) != 0)
    {
      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = __93__PLExpandedPlatterInteractionManager_contextMenuInteraction_configurationForMenuAtLocation___block_invoke;
      v39[3] = &unk_1E91D37B8;
      v23 = v39;
      v33 = &v40;
      v40 = v18;
      v34 = &v41;
      objc_copyWeak(&v41, location);
    }
    else
    {
      v23 = 0;
    }
    v24 = (void *)MEMORY[0x1D17E5ED8](v23);
    v25 = (__int16)self->_expandedPlatterInteractionManagerDelegateFlags;
    if ((v25 & 4) != 0)
    {
      v36[0] = v21;
      v36[1] = 3221225472;
      v36[2] = __93__PLExpandedPlatterInteractionManager_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_2;
      v36[3] = &unk_1E91D37E0;
      v26 = v36;
      v32 = &v37;
      v37 = v19;
      v21 = &v38;
      objc_copyWeak(&v38, location);
    }
    else
    {
      v26 = 0;
    }
    v27 = (void *)MEMORY[0x1D17E5ED8](v26);
    v28 = (void *)MEMORY[0x1E0CEA4B0];
    -[PLExpandedPlatterInteractionManager _contextMenuConfigurationIdentifier](self, "_contextMenuConfigurationIdentifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "configurationWithIdentifier:previewProvider:actionProvider:", v29, v24, v27);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if ((v25 & 4) != 0)
    {
      objc_destroyWeak(v21);

    }
    if ((expandedPlatterInteractionManagerDelegateFlags & 2) != 0)
    {
      objc_destroyWeak(v34);

    }
    objc_destroyWeak(location);
    v7 = v22;
    WeakRetained = v35;
  }

  return v30;
}

id __93__PLExpandedPlatterInteractionManager_contextMenuInteraction_configurationForMenuAtLocation___block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;
  void *v3;

  v1 = *(void **)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v1, "expandedPlatterInteractionManagerContentViewController:", WeakRetained);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __93__PLExpandedPlatterInteractionManager_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id *v3;
  id v4;
  id WeakRetained;
  void *v6;

  v2 = *(void **)(a1 + 32);
  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(v2, "expandedPlatterInteractionManager:menuWithSuggestedActions:", WeakRetained, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 highlightPreviewForItemWithIdentifier:(id)a5
{
  id WeakRetained;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;

  WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  v7 = PLLogTransition;
  if (os_log_type_enabled((os_log_t)PLLogTransition, OS_LOG_TYPE_DEBUG))
    -[PLExpandedPlatterInteractionManager contextMenuInteraction:configuration:highlightPreviewForItemWithIdentifier:].cold.2((uint64_t)WeakRetained, v7, v8, v9, v10, v11, v12, v13);
  objc_msgSend(WeakRetained, "viewForPreview");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "window");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[PLExpandedPlatterInteractionManager _setPresentingViewControllerHighlighted:animated:](self, "_setPresentingViewControllerHighlighted:animated:", 1, 1);
    v16 = objc_alloc_init(MEMORY[0x1E0CEA8B8]);
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setBackgroundColor:", v17);

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(WeakRetained, "visiblePath");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setVisiblePath:", v18);

    }
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA98]), "initWithView:parameters:", v14, v16);

  }
  else
  {
    v20 = PLLogTransition;
    if (os_log_type_enabled((os_log_t)PLLogTransition, OS_LOG_TYPE_ERROR))
      -[PLExpandedPlatterInteractionManager contextMenuInteraction:configuration:highlightPreviewForItemWithIdentifier:].cold.1((uint64_t)v14, v20);
    v19 = 0;
  }

  return v19;
}

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id cachedCompletion;
  id v13;
  id WeakRetained;
  _QWORD v15[4];
  id v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (self->_cachedCompletion)
  {
    v11 = (void *)MEMORY[0x1D17E5ED8]();
    cachedCompletion = self->_cachedCompletion;
    self->_cachedCompletion = 0;

    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __103__PLExpandedPlatterInteractionManager_contextMenuInteraction_willDisplayMenuForConfiguration_animator___block_invoke;
    v15[3] = &unk_1E91D3808;
    v16 = v11;
    v13 = v11;
    objc_msgSend(v10, "addCompletion:", v15);

  }
  if ((*(_WORD *)&self->_expandedPlatterInteractionManagerDelegateFlags & 0x10) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "expandedPlatterInteractionManager:willPresentContentWithAnimator:", self, v10);

  }
}

uint64_t __103__PLExpandedPlatterInteractionManager_contextMenuInteraction_willDisplayMenuForConfiguration_animator___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  id v6;
  id WeakRetained;
  _QWORD v8[5];

  v6 = a5;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __95__PLExpandedPlatterInteractionManager_contextMenuInteraction_willEndForConfiguration_animator___block_invoke;
  v8[3] = &unk_1E91D3160;
  v8[4] = self;
  objc_msgSend(v6, "addAnimations:", v8);
  if ((*(_WORD *)&self->_expandedPlatterInteractionManagerDelegateFlags & 0x80) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "expandedPlatterInteractionManager:willDismissContentWithAnimator:", self, v6);

  }
}

uint64_t __95__PLExpandedPlatterInteractionManager_contextMenuInteraction_willEndForConfiguration_animator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setPresentingViewControllerHighlighted:animated:", 0, 0);
}

- (id)_contextMenuInteraction:(id)a3 styleForMenuWithConfiguration:(id)a4
{
  void *v5;
  id WeakRetained;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CEACE0], "defaultStyle", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHasInteractivePreview:", 1);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "setPrefersCenteredPreviewWhenActionsAreAbsent:", 0);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "setKeepsInputViewsVisible:", 1);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "setIgnoresDefaultSizingRules:", 1);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "expandedPlatterInteractionManagerContainerView:", self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      objc_msgSend(v5, "setContainerView:", v7);

  }
  return v5;
}

- (BOOL)_contextMenuInteractionShouldAllowSwipeToDismiss:(id)a3
{
  id WeakRetained;
  void *v5;
  char v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = WeakRetained;
  if (self->_initialPanOccurred)
  {
    v6 = 1;
  }
  else
  {
    v6 = 1;
    if ((*(_WORD *)&self->_expandedPlatterInteractionManagerDelegateFlags & 0x40) == 0
      || (v6 = objc_msgSend(WeakRetained, "expandedPlatterInteractionManagerShouldAllowInitialSwipeToDismiss:", self),
          !self->_initialPanOccurred))
    {
      self->_initialPanOccurred = 1;
    }
  }

  return v6;
}

- (void)_contextMenuInteraction:(id)a3 shouldPresentWithCompletion:(id)a4
{
  PLExpandedPlatterInteractionManagerDelegate **p_delegate;
  id v6;
  id WeakRetained;

  if ((*(_WORD *)&self->_expandedPlatterInteractionManagerDelegateFlags & 0x20) != 0)
  {
    p_delegate = &self->_delegate;
    v6 = a4;
    WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(WeakRetained, "expandedPlatterInteractionManager:shouldCommitInteraction:", self, v6);

  }
}

- (unint64_t)_activationMethodForContextMenuInteraction:(id)a3
{
  id WeakRetained;
  void *v5;
  unint64_t v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = WeakRetained;
  if ((*(_WORD *)&self->_expandedPlatterInteractionManagerDelegateFlags & 0x100) != 0)
    v6 = objc_msgSend(WeakRetained, "expandedPlatterInteractionManagerShouldAllowLongPressGesture:", self) ^ 1;
  else
    v6 = 0;

  return v6;
}

- (id)_identifier
{
  void *WeakRetained;
  void *v3;
  void *v4;

  if ((*(_WORD *)&self->_expandedPlatterInteractionManagerDelegateFlags & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "expandedPlatterInteractionManagerIdentifier:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "UUIDString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("com.apple.PlatterKit.PLExpandedPlatterInteractionManager"), "stringByAppendingPathExtension:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (id)_contextMenuConfigurationIdentifier
{
  void *v2;
  void *v3;

  -[PLExpandedPlatterInteractionManager _identifier](self, "_identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathExtension:", CFSTR("contextMenuConfiguration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_setPresentingViewControllerHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL8 v5;
  id WeakRetained;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  void *v11;
  id v12;
  BOOL v13;

  v4 = a4;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    if (v4)
    {
      v7 = (void *)objc_msgSend(MEMORY[0x1E0D47498], "newDefaultHighlightAnimator");
      v8 = MEMORY[0x1E0C809B0];
      v9 = 3221225472;
      v10 = __88__PLExpandedPlatterInteractionManager__setPresentingViewControllerHighlighted_animated___block_invoke;
      v11 = &unk_1E91D3188;
      v12 = WeakRetained;
      v13 = v5;
      objc_msgSend(v7, "addAnimations:", &v8);
      objc_msgSend(v7, "startAnimation", v8, v9, v10, v11);

    }
    else
    {
      objc_msgSend(WeakRetained, "setHighlighted:", v5);
    }
  }

}

uint64_t __88__PLExpandedPlatterInteractionManager__setPresentingViewControllerHighlighted_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setHighlighted:", *(unsigned __int8 *)(a1 + 40));
}

- (PLExpandedPlatterInteractionHosting)presentingViewController
{
  return (PLExpandedPlatterInteractionHosting *)objc_loadWeakRetained((id *)&self->_presentingViewController);
}

- (PLExpandedPlatterInteractionManagerDelegate)delegate
{
  return (PLExpandedPlatterInteractionManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong(&self->_cachedCompletion, 0);
  objc_storeStrong((id *)&self->_contextMenuInteraction, 0);
}

- (void)presentAtLocation:(os_log_t)log completion:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D1285000, log, OS_LOG_TYPE_ERROR, "Already have a cached completion – calling with 'finished=NO'", v1, 2u);
}

- (void)contextMenuInteraction:(uint64_t)a3 configurationForMenuAtLocation:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D1285000, a2, a3, "Configuring context menu configuration for expanded platter presentation from view controller: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)contextMenuInteraction:(uint64_t)a1 configuration:(NSObject *)a2 highlightPreviewForItemWithIdentifier:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1D1285000, a2, OS_LOG_TYPE_ERROR, "View for preview isn't in a window: %{public}@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1();
}

- (void)contextMenuInteraction:(uint64_t)a3 configuration:(uint64_t)a4 highlightPreviewForItemWithIdentifier:(uint64_t)a5 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D1285000, a2, a3, "Configuring targeted preview for expanded platter presentation from view controller: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
