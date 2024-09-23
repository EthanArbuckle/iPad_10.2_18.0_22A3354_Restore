@implementation UIContextMenuInteraction

- (BOOL)_clickPresentationInteraction:(id)a3 shouldBeDelayedByGestureRecognizer:(id)a4
{
  UIContextMenuInteraction *v4;
  id v5;
  void *v6;

  if (!self->_delegateImplements.shouldByDelayedByGestureRecognizer)
    return 0;
  v4 = self;
  v5 = a4;
  -[UIContextMenuInteraction delegate](v4, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v6, "_contextMenuInteraction:shouldBeDelayedByGestureRecognizer:", v4, v5);

  return (char)v4;
}

uint64_t __43__UIContextMenuInteraction_willMoveToView___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "cancelInteraction");
}

uint64_t __35__UIContextMenuInteraction_dealloc__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "cancelInteraction");
}

- (void)willMoveToView:(id)a3
{
  void *v4;
  _QWORD v5[5];

  if (self->_presentationInteraction)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __43__UIContextMenuInteraction_willMoveToView___block_invoke;
    v5[3] = &unk_1E16B1B28;
    v5[4] = self;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v5);
    -[_UIClickPresentationInteraction view](self->_presentationInteraction, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeInteraction:", self->_presentationInteraction);

  }
  objc_storeWeak((id *)&self->_view, 0);
}

- (void)setDrivers:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UIContextMenuInteraction presentationInteraction](self, "presentationInteraction");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setOverrideDrivers:", v4);

}

- (void)didMoveToView:(id)a3
{
  UIView **p_view;
  id v5;
  id WeakRetained;
  void *v7;

  p_view = &self->_view;
  v5 = objc_storeWeak((id *)&self->_view, a3);
  if (a3)
  {
    WeakRetained = objc_loadWeakRetained((id *)p_view);
    -[UIContextMenuInteraction presentationInteraction](self, "presentationInteraction");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "addInteraction:", v7);

  }
}

- (_UIClickPresentationInteraction)presentationInteraction
{
  _UIClickPresentationInteraction *presentationInteraction;
  _UIClickPresentationInteraction *v4;
  _UIClickPresentationInteraction *v5;

  presentationInteraction = self->_presentationInteraction;
  if (!presentationInteraction)
  {
    v4 = -[_UIClickPresentationInteraction initWithDelegate:]([_UIClickPresentationInteraction alloc], "initWithDelegate:", self);
    v5 = self->_presentationInteraction;
    self->_presentationInteraction = v4;

    -[_UIClickPresentationInteraction setDebugIdentifier:](self->_presentationInteraction, "setDebugIdentifier:", CFSTR("com.apple.UIKit.ContextMenuPresentation"));
    -[_UIClickPresentationInteraction setPresentationTypeDebugString:](self->_presentationInteraction, "setPresentationTypeDebugString:", CFSTR("UIContextMenuInteraction"));
    presentationInteraction = self->_presentationInteraction;
  }
  return presentationInteraction;
}

- (UIView)view
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_view);
}

- (void)_viewTraitCollectionDidChange:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[UIContextMenuInteraction presentationsByIdentifier](self, "presentationsByIdentifier", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "viewTraitCollectionDidChange");
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (BOOL)_hasVisibleMenu
{
  void *v2;
  BOOL v3;

  -[UIContextMenuInteraction presentationsByIdentifier](self, "presentationsByIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (NSMutableDictionary)presentationsByIdentifier
{
  return self->_presentationsByIdentifier;
}

- (BOOL)_clickPresentationInteractionShouldAllowRapidRestart:(id)a3
{
  return 1;
}

+ (NSCopying)visualStyleRegistryIdentity
{
  return (NSCopying *)CFSTR("UIContextMenuInteraction");
}

- (void)_retargetDismissingMenuWithInternalIdentifier:(id)a3 toPreview:(id)a4 force:(BOOL)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;

  v14 = a3;
  v8 = a4;
  -[UIContextMenuInteraction outgoingPresentation](self, "outgoingPresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    if (a5
      || (objc_msgSend(v9, "menuConfiguration"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v11, "internalIdentifiers"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          v13 = objc_msgSend(v12, "containsObject:", v14),
          v12,
          v11,
          v13))
    {
      objc_msgSend(v10, "retargetDismissingMenuToPreview:", v8);
      -[UIContextMenuInteraction setOutgoingPresentation:](self, "setOutgoingPresentation:", 0);
    }
  }

}

- (_UIContextMenuPresentation)outgoingPresentation
{
  return self->_outgoingPresentation;
}

- (UIContextMenuInteraction)initWithDelegate:(id)delegate
{
  id v4;
  UIContextMenuInteraction *v5;
  UIContextMenuInteraction *v6;
  id v7;
  id WeakRetained;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  objc_super v30;

  v4 = delegate;
  v30.receiver = self;
  v30.super_class = (Class)UIContextMenuInteraction;
  v5 = -[UIContextMenuInteraction init](&v30, sel_init);
  v6 = v5;
  if (v5)
  {
    v7 = objc_storeWeak((id *)&v5->_delegate, v4);
    v6->_delegateImplements.highlightPreviewForItemWithIdentifier = objc_opt_respondsToSelector() & 1;

    WeakRetained = objc_loadWeakRetained((id *)&v6->_delegate);
    v6->_delegateImplements.dismissalPreviewForItemWithIdentifier = objc_opt_respondsToSelector() & 1;

    v9 = objc_loadWeakRetained((id *)&v6->_delegate);
    v6->_delegateImplements.willPerformPreviewAction = objc_opt_respondsToSelector() & 1;

    v10 = objc_loadWeakRetained((id *)&v6->_delegate);
    v6->_delegateImplements.willDisplay = objc_opt_respondsToSelector() & 1;

    v11 = objc_loadWeakRetained((id *)&v6->_delegate);
    v6->_delegateImplements.willEndForConfiguration = objc_opt_respondsToSelector() & 1;

    v12 = objc_loadWeakRetained((id *)&v6->_delegate);
    v6->_delegateImplements.styleForMenu = objc_opt_respondsToSelector() & 1;

    v13 = objc_loadWeakRetained((id *)&v6->_delegate);
    v6->_delegateImplements.accessoriesForMenu = objc_opt_respondsToSelector() & 1;

    v14 = objc_loadWeakRetained((id *)&v6->_delegate);
    v6->_delegateImplements.shouldByDelayedByGestureRecognizer = objc_opt_respondsToSelector() & 1;

    v15 = objc_loadWeakRetained((id *)&v6->_delegate);
    v6->_delegateImplements.asyncConfigurationForMenuAtLocation = objc_opt_respondsToSelector() & 1;

    v16 = objc_loadWeakRetained((id *)&v6->_delegate);
    v6->_delegateImplements.overrideSuggestedActions = objc_opt_respondsToSelector() & 1;

    v17 = objc_loadWeakRetained((id *)&v6->_delegate);
    v6->_delegateImplements.shouldPresent = objc_opt_respondsToSelector() & 1;

    v18 = objc_loadWeakRetained((id *)&v6->_delegate);
    v6->_delegateImplements.shouldAllowDragAfterDismiss = objc_opt_respondsToSelector() & 1;

    v19 = objc_loadWeakRetained((id *)&v6->_delegate);
    v6->_delegateImplements.shouldAllowSwipeToDismiss = objc_opt_respondsToSelector() & 1;

    v20 = objc_loadWeakRetained((id *)&v6->_delegate);
    v6->_delegateImplements.shouldDeferCommitAnimation = objc_opt_respondsToSelector() & 1;

    v21 = objc_loadWeakRetained((id *)&v6->_delegate);
    v6->_delegateImplements.interactionEffectForTargetedPreview = objc_opt_respondsToSelector() & 1;

    v22 = objc_loadWeakRetained((id *)&v6->_delegate);
    v6->_delegateImplements.shouldAttemptToPresentConfiguration = objc_opt_respondsToSelector() & 1;

    v23 = objc_loadWeakRetained((id *)&v6->_delegate);
    v6->_delegateImplements.didPerformMenuLeaf = objc_opt_respondsToSelector() & 1;

    if (!v6->_delegateImplements.highlightPreviewForItemWithIdentifier)
    {
      v24 = objc_loadWeakRetained((id *)&v6->_delegate);
      v6->_delegateImplements.previewForHighlighting = objc_opt_respondsToSelector() & 1;

      v25 = objc_loadWeakRetained((id *)&v6->_delegate);
      v6->_delegateImplements.previewForDismissing = objc_opt_respondsToSelector() & 1;

    }
    if (_UIIsPrivateMainBundle())
    {
      v26 = objc_loadWeakRetained((id *)&v6->_delegate);
      v6->_delegateImplements.willCommit = objc_opt_respondsToSelector() & 1;

    }
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIContextMenuInteraction setPresentationsByIdentifier:](v6, "setPresentationsByIdentifier:", v27);

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIContextMenuInteraction setConfigurationsByIdentifier:](v6, "setConfigurationsByIdentifier:", v28);

    _UIContextMenuRegisterDefaultPlatformMetricsIfNecessary();
  }

  return v6;
}

- (void)setPresentationsByIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_presentationsByIdentifier, a3);
}

- (void)setConfigurationsByIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_configurationsByIdentifier, a3);
}

- (void)setAllowSimultaneousRecognition:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[UIContextMenuInteraction presentationInteraction](self, "presentationInteraction");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAllowSimultaneousRecognition:", v3);

}

- (void)_setProxySender:(id)a3
{
  objc_storeWeak(&self->__proxySender, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->__selectedMenuLeaf);
  objc_destroyWeak(&self->__proxySender);
  objc_storeStrong((id *)&self->_pendingCommitAnimator, 0);
  objc_storeStrong((id *)&self->_outgoingPresentation, 0);
  objc_storeStrong((id *)&self->_presentationsByIdentifier, 0);
  objc_storeStrong((id *)&self->_configurationsByIdentifier, 0);
  objc_storeStrong((id *)&self->_pendingConfiguration, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_presentationInteraction, 0);
  objc_destroyWeak((id *)&self->_view);
}

- (void)dismissMenu
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  char v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[UIContextMenuInteraction presentationInteraction](self, "presentationInteraction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_isActive");

  if (v4)
  {
    -[UIContextMenuInteraction presentationsByIdentifier](self, "presentationsByIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allKeys");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");

    if (objc_msgSend(v7, "count"))
    {
      if (!self->_delegateImplements.shouldAllowDragAfterDismiss)
        goto LABEL_6;
      -[UIContextMenuInteraction delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "_contextMenuInteractionShouldAllowDragAfterDismiss:", self);

      if (!v9
        || (-[UIContextMenuInteraction presentationInteraction](self, "presentationInteraction"),
            v10 = (void *)objc_claimAutoreleasedReturnValue(),
            v11 = objc_msgSend(v10, "beginDragIfPossibleWithTouch:", 0),
            v10,
            (v11 & 1) == 0))
      {
LABEL_6:
        -[UIContextMenuInteraction presentationInteraction](self, "presentationInteraction");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "_cancelWithReason:alongsideActions:completion:", 8, 0, 0);

        v20 = 0u;
        v21 = 0u;
        v18 = 0u;
        v19 = 0u;
        v13 = v7;
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v19;
          do
          {
            for (i = 0; i != v15; ++i)
            {
              if (*(_QWORD *)v19 != v16)
                objc_enumerationMutation(v13);
              -[UIContextMenuInteraction _performCleanupForConfigurationWithIdentifier:](self, "_performCleanupForConfigurationWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i), (_QWORD)v18);
            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
          }
          while (v15);
        }

      }
    }

  }
}

- (void)dealloc
{
  objc_super v3;
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __35__UIContextMenuInteraction_dealloc__block_invoke;
  v4[3] = &unk_1E16B1B28;
  v4[4] = self;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v4);
  v3.receiver = self;
  v3.super_class = (Class)UIContextMenuInteraction;
  -[UIContextMenuInteraction dealloc](&v3, sel_dealloc);
}

- (unint64_t)activationStyleForClickPresentationInteraction:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  uint64_t v7;

  -[UIContextMenuInteraction delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0)
    return 0;
  -[UIContextMenuInteraction delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "_activationMethodForContextMenuInteraction:", self);

  return v7 == 1;
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (UIContextMenuInteractionAppearance)menuAppearance
{
  void *v2;
  uint64_t v3;

  -[UIContextMenuInteraction presentationInteraction](self, "presentationInteraction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "activatedDriverStyle");

  if (v3 == 1)
    return 2;
  else
    return 1;
}

- (CGPoint)locationInView:(UIView *)view
{
  UIView *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGPoint result;

  v4 = view;
  -[UIContextMenuInteraction presentationInteraction](self, "presentationInteraction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "locationInView:", v4);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.y = v11;
  result.x = v10;
  return result;
}

- (void)updateVisibleMenuWithBlock:(void *)block
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unint64_t v24;
  NSObject *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  UIContextMenuInteraction *v35;
  void (**v36)(void *, _QWORD);
  uint8_t buf[16];
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD aBlock[4];
  id v43;
  _BYTE v44[128];
  _QWORD v45[3];

  v45[1] = *MEMORY[0x1E0C80C00];
  v4 = block;
  if (-[_UIClickPresentationInteraction _isActive](self->_presentationInteraction, "_isActive"))
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __55__UIContextMenuInteraction_updateVisibleMenuWithBlock___block_invoke;
    aBlock[3] = &unk_1E16ED1D8;
    v43 = v4;
    v36 = (void (**)(void *, _QWORD))_Block_copy(aBlock);
    -[UIContextMenuInteraction presentationsByIdentifier](self, "presentationsByIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allValues");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      v24 = updateVisibleMenuWithBlock____s_category;
      if (!updateVisibleMenuWithBlock____s_category)
      {
        v24 = __UILogCategoryGetNode("UILog", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v24, (unint64_t *)&updateVisibleMenuWithBlock____s_category);
      }
      v25 = *(NSObject **)(v24 + 8);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_185066000, v25, OS_LOG_TYPE_ERROR, "Called -[UIContextMenuInteraction updateVisibleMenuWithBlock:] while no context menu is visible. This won't do anything.", buf, 2u);
      }
      goto LABEL_28;
    }
    objc_msgSend(v7, "visibleMenus");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      if (dyld_program_sdk_at_least())
      {
        if (!objc_msgSend(v9, "count"))
        {
          +[UIMenu menuWithChildren:](UIMenu, "menuWithChildren:", MEMORY[0x1E0C9AA60]);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v45[0] = v10;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 1);
          v11 = objc_claimAutoreleasedReturnValue();

          v9 = (void *)v11;
        }
        v40 = 0u;
        v41 = 0u;
        v38 = 0u;
        v39 = 0u;
        v12 = v9;
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
        if (v13)
        {
          v14 = v13;
          v34 = v4;
          v35 = self;
          v15 = *(_QWORD *)v39;
          do
          {
            for (i = 0; i != v14; ++i)
            {
              if (*(_QWORD *)v39 != v15)
                objc_enumerationMutation(v12);
              v17 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i);
              v36[2](v36, v17);
              v18 = objc_claimAutoreleasedReturnValue();
              if (v18)
              {
                v19 = (void *)v18;
                objc_msgSend(v7, "menuConfiguration");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "firstResponderTarget");
                v21 = v7;
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                -[UIContextMenuInteraction _menuPreparedForDisplayWithMenu:firstResponder:](v35, "_menuPreparedForDisplayWithMenu:firstResponder:", v19, v22);
                v23 = (void *)objc_claimAutoreleasedReturnValue();

                v7 = v21;
                objc_msgSend(v21, "displayMenu:inPlaceOfMenu:", v23, v17);

              }
            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
          }
          while (v14);
          v9 = v12;
          v4 = v34;
        }
        else
        {
          v9 = v12;
        }
        goto LABEL_26;
      }
      objc_msgSend(v9, "lastObject");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(void *, void *))v36)[2](v36, v33);
      v12 = (id)objc_claimAutoreleasedReturnValue();

      if (!v12)
      {
LABEL_26:

        goto LABEL_27;
      }
    }
    else
    {
      objc_msgSend(v7, "uiController");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "menuConfiguration");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "menu");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      ((void (**)(void *, void *))v36)[2](v36, v9);
      v28 = objc_claimAutoreleasedReturnValue();
      if (!v28)
      {
LABEL_27:

LABEL_28:
        goto LABEL_29;
      }
      v29 = (void *)v28;
      objc_msgSend(v7, "menuConfiguration");
      v30 = v4;
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "firstResponderTarget");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIContextMenuInteraction _menuPreparedForDisplayWithMenu:firstResponder:](self, "_menuPreparedForDisplayWithMenu:firstResponder:", v29, v32);
      v12 = (id)objc_claimAutoreleasedReturnValue();

      v4 = v30;
    }
    objc_msgSend(v7, "displayMenu:inPlaceOfMenu:", v12, 0);
    goto LABEL_26;
  }
LABEL_29:

}

id __55__UIContextMenuInteraction_updateVisibleMenuWithBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_msgSend(a2, "_mutableCopy");
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 == v3)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v4, "_immutableCopy");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

+ (void)_setDefaultDriverClasses:(id)a3 forIdiom:(int64_t)a4
{
  +[_UIClickPresentationInteraction _setDefaultDriverClasses:forIdiom:](_UIClickPresentationInteraction, "_setDefaultDriverClasses:forIdiom:", a3, a4);
}

- (id)_proxySender
{
  void *WeakRetained;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained(&self->__proxySender);
  v4 = WeakRetained;
  if (!WeakRetained)
    WeakRetained = self;
  v5 = WeakRetained;

  return v5;
}

- (unint64_t)_inputPrecision
{
  void *v2;
  unint64_t v3;

  -[UIContextMenuInteraction presentationInteraction](self, "presentationInteraction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "inputPrecision");

  return v3;
}

- (NSSet)_internalIdentifiersForDismissingMenu
{
  void *v2;
  void *v3;
  void *v4;

  -[UIContextMenuInteraction outgoingPresentation](self, "outgoingPresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "menuConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "internalIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

- (unint64_t)_fallbackDriverStyle
{
  void *v2;
  unint64_t v3;

  -[UIContextMenuInteraction presentationInteraction](self, "presentationInteraction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "fallbackDriverStyle");

  return v3;
}

- (void)_setFallbackDriverStyle:(unint64_t)a3
{
  id v4;

  -[UIContextMenuInteraction presentationInteraction](self, "presentationInteraction");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFallbackDriverStyle:", a3);

}

- (void)deferredMenuElementWasFulfilled:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __60__UIContextMenuInteraction_deferredMenuElementWasFulfilled___block_invoke;
  v6[3] = &unk_1E16B50F0;
  v7 = v4;
  v5 = v4;
  -[UIContextMenuInteraction updateVisibleMenuWithBlock:](self, "updateVisibleMenuWithBlock:", v6);

}

id __60__UIContextMenuInteraction_deferredMenuElementWasFulfilled___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;

  v3 = a2;
  if (isDeferredElementVisibleInMenu_0(*(void **)(a1 + 32), v3))
    v4 = (id)objc_msgSend(v3, "copy");
  else
    v4 = v3;
  v5 = v4;

  return v5;
}

- (void)_presentMenuAtLocation3D:(CAPoint3D)a3
{
  double z;
  double y;
  double x;
  void *v7;
  id v8;
  _QWORD v9[5];
  uint64_t v10;

  z = a3.z;
  y = a3.y;
  x = a3.x;
  v10 = *MEMORY[0x1E0C80C00];
  -[UIContextMenuInteraction configurationsByIdentifier](self, "configurationsByIdentifier");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {

  }
  else
  {
    -[UIContextMenuInteraction pendingConfiguration](self, "pendingConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __53__UIContextMenuInteraction__presentMenuAtLocation3D___block_invoke;
      v9[3] = &unk_1E16C3F48;
      v9[4] = self;
      -[UIContextMenuInteraction _interactionShouldBeginAtPoint:completion:](self, "_interactionShouldBeginAtPoint:completion:", v9, x, y, z);
    }
  }
}

void __53__UIContextMenuInteraction__presentMenuAtLocation3D___block_invoke(uint64_t a1, uint64_t a2)
{
  id v2;

  if (!a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "presentationInteraction");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "present");

  }
}

- (void)_presentMenuAtLocation:(CGPoint)a3
{
  -[UIContextMenuInteraction _presentMenuAtLocation3D:](self, "_presentMenuAtLocation3D:", a3.x, a3.y, 0.0);
}

- (BOOL)allowSimultaneousRecognition
{
  void *v2;
  char v3;

  -[UIContextMenuInteraction presentationInteraction](self, "presentationInteraction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "allowSimultaneousRecognition");

  return v3;
}

- (UIGestureRecognizer)gestureRecognizerForFailureRelationships
{
  void *v2;
  void *v3;

  -[UIContextMenuInteraction presentationInteraction](self, "presentationInteraction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "gestureRecognizerForExclusionRelationship");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIGestureRecognizer *)v3;
}

- (id)gestureRecognizerForExclusionRelationships
{
  void *v2;
  void *v3;

  -[UIContextMenuInteraction presentationInteraction](self, "presentationInteraction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "gestureRecognizerForFailureRelationship");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (UIGestureRecognizer)_gestureRecognizerForBeginningDragRelationships
{
  void *v2;
  void *v3;

  -[UIContextMenuInteraction presentationInteraction](self, "presentationInteraction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "gestureRecognizerForBeginningDragRelationships");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIGestureRecognizer *)v3;
}

- (BOOL)_reachedForceThreshold
{
  void *v2;
  char v3;

  -[UIContextMenuInteraction presentationInteraction](self, "presentationInteraction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_reachedForceThreshold");

  return v3;
}

- (void)_clickPresentationInteraction:(id)a3 shouldBeginWithTouch:(id)a4 completion:(id)a5
{
  void (**v7)(id, uint64_t);
  void *v8;
  void *v9;
  char v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;

  v16 = a4;
  v7 = (void (**)(id, uint64_t))a5;
  if (-[UIContextMenuInteraction _requiresTouchAuthentication](self, "_requiresTouchAuthentication")
    && (objc_msgSend(v16, "_touchAuthenticationRecord"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        v8)
    && (objc_msgSend(v16, "_touchAuthenticationRecord"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "shouldAllowEvents"),
        v9,
        (v10 & 1) == 0))
  {
    v7[2](v7, 2);
  }
  else
  {
    -[UIContextMenuInteraction view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIContextMenuInteraction locationInView:](self, "locationInView:", v11);
    v13 = v12;
    v15 = v14;

    -[UIContextMenuInteraction _interactionShouldBeginAtPoint:completion:](self, "_interactionShouldBeginAtPoint:completion:", v7, v13, v15, 0.0);
  }

}

- (BOOL)_clickPresentationInteractionShouldAssociateWithDrag:(id)a3
{
  UIContextMenuInteractionAppearance v4;
  void *v5;
  char v6;

  v4 = -[UIContextMenuInteraction menuAppearance](self, "menuAppearance", a3);
  if (v4 != UIContextMenuInteractionAppearanceRich)
  {
    -[UIContextMenuInteraction pendingConfiguration](self, "pendingConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "_isMultiItemMenu");

    LOBYTE(v4) = v6;
  }
  return v4;
}

- (BOOL)_clickPresentationInteractionShouldAllowDragAfterDismiss:(id)a3
{
  UIContextMenuInteraction *v3;
  void *v4;

  if (!self->_delegateImplements.shouldAllowDragAfterDismiss)
    return 0;
  v3 = self;
  -[UIContextMenuInteraction delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "_contextMenuInteractionShouldAllowDragAfterDismiss:", v3);

  return (char)v3;
}

- (id)clickPresentationInteraction:(id)a3 previewForHighlightingAtLocation:(CGPoint)a4
{
  void *v5;
  UITargetedPreview *v6;
  UITargetedPreview *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  UITargetedPreview *v12;
  void *v13;
  uint64_t (**v14)(_QWORD, _QWORD);
  uint64_t v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGFloat v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  UIPreviewTarget *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  UIPreviewTarget *v42;
  uint64_t v43;
  _OWORD v45[3];
  CGRect v46;
  CGRect v47;

  -[UIContextMenuInteraction pendingConfiguration](self, "pendingConfiguration", a3, a4.x, a4.y);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIContextMenuInteraction _delegate_previewForHighlightingForConfiguration:](self, "_delegate_previewForHighlightingForConfiguration:", v5);
  v6 = (UITargetedPreview *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v7 = [UITargetedPreview alloc];
    -[UIContextMenuInteraction view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[UITargetedPreview initWithView:](v7, "initWithView:", v8);

  }
  -[UIContextMenuInteraction view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "userInterfaceIdiom");
  v12 = v6;
  _UIContextMenuGetPlatformMetrics(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "shouldApplyShadowHandler");
  v14 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  if (v14)
    v15 = ((uint64_t (**)(_QWORD, UITargetedPreview *))v14)[2](v14, v12);
  else
    v15 = 1;

  -[UITargetedPreview parameters](v12, "parameters");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setAppliesShadow:", v15);

  objc_msgSend(v5, "identifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITargetedPreview set_internalIdentifier:](v12, "set_internalIdentifier:", v17);

  objc_msgSend(v5, "set_primarySourcePreview:", v12);
  -[UITargetedPreview _frame](v12, "_frame");
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;
  -[UITargetedPreview target](v12, "target");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "container");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = -[UIView _constrainRectWithinSceneBounds:additionalInsets:](v27, v19, v21, v23, v25, 0.0);
  v30 = v29;
  v32 = v31;
  v34 = v33;

  v46.origin.x = v19;
  v46.origin.y = v21;
  v46.size.width = v23;
  v46.size.height = v25;
  v47.origin.x = v28;
  v47.origin.y = v30;
  v47.size.width = v32;
  v47.size.height = v34;
  if (!CGRectIntersectsRect(v46, v47))
  {
    v35 = v28 + v32 * 0.5;
    v36 = v30 + v34 * 0.5;
    v37 = [UIPreviewTarget alloc];
    -[UITargetedPreview target](v12, "target");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "container");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITargetedPreview target](v12, "target");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v40;
    if (v40)
      objc_msgSend(v40, "transform");
    else
      memset(v45, 0, sizeof(v45));
    v42 = -[UIPreviewTarget initWithContainer:center:transform:](v37, "initWithContainer:center:transform:", v39, v45, v35, v36);

    -[UITargetedPreview retargetedPreviewWithTarget:](v12, "retargetedPreviewWithTarget:", v42);
    v43 = objc_claimAutoreleasedReturnValue();

    v12 = (UITargetedPreview *)v43;
  }

  return v12;
}

- (id)_secondaryPreviewsForClickPresentationInteraction:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[UIContextMenuInteraction pendingConfiguration](self, "pendingConfiguration", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4
    || !self->_delegateImplements.highlightPreviewForItemWithIdentifier
    && !self->_delegateImplements._dci_secondaryHighlightPreview)
  {
    goto LABEL_17;
  }
  objc_msgSend(v4, "_effectiveSecondaryItemIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "count"))
  {

LABEL_17:
    v7 = 0;
    goto LABEL_18;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        if (self->_delegateImplements.highlightPreviewForItemWithIdentifier)
        {
          v13 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
          -[UIContextMenuInteraction delegate](self, "delegate", (_QWORD)v17);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "contextMenuInteraction:configuration:highlightPreviewForItemWithIdentifier:", self, v5, v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {
            objc_msgSend(v15, "set_internalIdentifier:", v13);
            objc_msgSend(v7, "addObject:", v15);

          }
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

LABEL_18:
  return v7;
}

- (id)_clickPresentationInteraction:(id)a3 interactionEffectForTargetedPreview:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  if (self->_delegateImplements.interactionEffectForTargetedPreview)
  {
    v5 = a4;
    -[UIContextMenuInteraction pendingConfiguration](self, "pendingConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIContextMenuInteraction delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_contextMenuInteraction:configuration:interactionEffectForTargetedPreview:", self, v6, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)clickPresentationInteraction:(id)a3 presentationForPresentingViewController:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
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
  _UIContextMenuPresentation *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _BOOL4 v35;
  _BOOL8 v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  char v50;
  void *v51;
  _QWORD v52[5];
  __int128 v53;
  __int128 v54;
  uint64_t v55;
  __int128 v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  __int128 v60;
  __int128 v61;
  uint64_t v62;

  v5 = a4;
  -[UIContextMenuInteraction pendingConfiguration](self, "pendingConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_delegateImplements.shouldAttemptToPresentConfiguration
    || (-[UIContextMenuInteraction delegate](self, "delegate"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "_contextMenuInteraction:shouldAttemptToPresentConfiguration:", self, v6),
        v7,
        v8))
  {
    -[UIContextMenuInteraction view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIContextMenuInteraction locationInView:](self, "locationInView:", v9);
    v11 = v10;
    v13 = v12;

    -[UIContextMenuInteraction _fulfilledConfigurationForConfiguration:atLocation:](self, "_fulfilledConfigurationForConfiguration:atLocation:", v6, v11, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v14, "isPresentable"))
    {
      v26 = 0;
LABEL_49:

      goto LABEL_50;
    }
    -[UIContextMenuInteraction setPendingConfiguration:](self, "setPendingConfiguration:", 0);
    -[UIContextMenuInteraction view](self, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_window");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "windowScene");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    _UIFocusBehaviorSetOverrideFocusSystemEnabled(1, v17, self);
    -[UIContextMenuInteraction view](self, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    _UIGameControllerNotifyRelevantSystemUIWillShow(v17, v18);

    -[UIContextMenuInteraction _delegate_contextMenuInteractionWillDisplayForConfiguration:](self, "_delegate_contextMenuInteractionWillDisplayForConfiguration:", v6);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (!self->_delegateImplements.styleForMenu
      || (-[UIContextMenuInteraction delegate](self, "delegate"),
          v20 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v20, "_contextMenuInteraction:styleForMenuWithConfiguration:", self, v6),
          v21 = (void *)objc_claimAutoreleasedReturnValue(),
          v20,
          !v21))
    {
      +[_UIContextMenuStyle defaultStyle](_UIContextMenuStyle, "defaultStyle");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (-[UIContextMenuInteraction menuAppearance](self, "menuAppearance") == UIContextMenuInteractionAppearanceCompact)
    {
      objc_msgSend(v21, "setPreferredLayout:", 3);
      if (v21)
      {
        objc_msgSend(v21, "_preferredAnchor");
        if (v60 == __PAIR128__(0x7FFFFFFFFFFFFFFFLL, 0x7FFFFFFFFFFFFFFFLL))
        {
          objc_msgSend(v6, "_primarySourcePreview");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "target");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "container");
          v24 = v19;
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          -[UIContextMenuInteraction locationInView:](self, "locationInView:", v25);
          objc_msgSend(v21, "set_preferredMenuAttachmentPoint:");
          v57 = 0;
          v58 = 0;
          v59 = 0;
          v56 = xmmword_186685AE0;
          objc_msgSend(v21, "set_preferredAnchor:", &v56);

          v19 = v24;
        }
LABEL_14:
        objc_msgSend(v21, "_preferredAnchor");
        if (v53 != __PAIR128__(0x7FFFFFFFFFFFFFFFLL, 0x7FFFFFFFFFFFFFFFLL)
          || !objc_msgSend(v6, "preferredMenuAlignment"))
        {
LABEL_27:
          v33 = objc_msgSend(v6, "preferredMenuElementOrder");
          if (v33 == 2)
          {
            v34 = 0;
          }
          else
          {
            if (v33 != 1)
            {
LABEL_32:
              v35 = -[UIContextMenuInteraction _shouldKeepInputViewVisibleForStyle:](self, "_shouldKeepInputViewVisibleForStyle:", v21);
              if (v35)
                objc_msgSend(v21, "set_shouldAvoidInputViews:", 1);
              v36 = !v35;
              objc_msgSend(v21, "containerView");
              v37 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v37)
              {
                v51 = v19;
                -[UIContextMenuInteraction view](self, "view");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v38, "_window");
                v39 = (void *)objc_claimAutoreleasedReturnValue();

                if (+[_UIRemoteKeyboards enabled](_UIRemoteKeyboards, "enabled"))
                {
                  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
                  v40 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v40, "keyboardWindow");
                  v41 = (void *)objc_claimAutoreleasedReturnValue();

                  if ((objc_msgSend(v39, "_isTextEffectsWindow") & 1) != 0
                    || v39 == v41
                    || objc_msgSend(v39, "_isRemoteInputHostWindow"))
                  {
                    if (v41)
                    {
                      if ((objc_msgSend(v41, "isHidden") & 1) == 0)
                      {
                        +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
                        v42 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v42, "visualModeManager");
                        v43 = (void *)objc_claimAutoreleasedReturnValue();
                        v50 = objc_msgSend(v43, "shouldShowWithinAppWindow");

                        if ((v50 & 1) == 0)
                        {
                          v44 = v41;

                          v39 = v44;
                        }
                      }
                    }
                    objc_msgSend(v21, "set_shouldAvoidInputViews:", +[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"));
                    v36 = 0;
                  }

                }
                v19 = v51;
                objc_msgSend(v21, "setContainerView:", v39);

              }
              objc_msgSend(v14, "previewViewController");
              v45 = (void *)objc_claimAutoreleasedReturnValue();

              if (v45)
              {
                objc_msgSend(v14, "previewViewController");
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v21, "setHasInteractivePreview:", objc_msgSend(v46, "_allowsUserInteractionWhenPreviewedInContextMenu") | objc_msgSend(v21, "hasInteractivePreview"));

              }
              v26 = -[_UIContextMenuPresentation initWithPresentingViewController:configuration:style:]([_UIContextMenuPresentation alloc], "initWithPresentingViewController:configuration:style:", v5, v14, v21);
              -[_UIContextMenuPresentation setDelegate:](v26, "setDelegate:", self);
              -[_UIContextMenuPresentation setSuppressInputViewDuringPresentation:](v26, "setSuppressInputViewDuringPresentation:", v36);
              -[_UIContextMenuPresentation setAlongsideAnimatorForPresentation:](v26, "setAlongsideAnimatorForPresentation:", v19);
              -[UIContextMenuInteraction presentationsByIdentifier](self, "presentationsByIdentifier");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "identifier");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v47, "setObject:forKeyedSubscript:", v26, v48);

              goto LABEL_49;
            }
            v34 = 1;
          }
          objc_msgSend(v21, "set_orderMenuBasedOnPriority:", v34);
          goto LABEL_32;
        }
        -[UIContextMenuInteraction view](self, "view");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "effectiveUserInterfaceLayoutDirection");

        v29 = objc_msgSend(v6, "preferredMenuAlignment");
        if (v29 == 3)
        {
          v30 = v28 == 0;
          v31 = 2;
          v32 = 8;
        }
        else
        {
          if (v29 != 1)
          {
            v31 = 0;
LABEL_26:
            memset(&v52[2], 0, 24);
            v52[0] = 0x7FFFFFFFFFFFFFFFLL;
            v52[1] = v31;
            objc_msgSend(v21, "set_preferredAnchor:", v52);
            goto LABEL_27;
          }
          v30 = v28 == 0;
          v31 = 8;
          v32 = 2;
        }
        if (v30)
          v31 = v32;
        goto LABEL_26;
      }
      v62 = 0;
      v60 = 0u;
      v61 = 0u;
    }
    else
    {
      objc_msgSend(v21, "setPreferredLayout:", -[UIContextMenuInteraction _actualLayoutForPreferredLayout:withConfiguration:](self, "_actualLayoutForPreferredLayout:withConfiguration:", objc_msgSend(v21, "preferredLayout"), v14));
      if (v21)
        goto LABEL_14;
    }
    v55 = 0;
    v53 = 0u;
    v54 = 0u;
    goto LABEL_27;
  }
  v26 = 0;
LABEL_50:

  return v26;
}

- (BOOL)_shouldKeepInputViewVisibleForStyle:(id)a3
{
  id v4;
  int v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const char *v12;

  v4 = a3;
  if ((objc_msgSend(v4, "keepsInputViewsVisible") & 1) != 0)
    goto LABEL_2;
  if (objc_msgSend(v4, "preferredLayout") != 3)
  {
    LOBYTE(v5) = 0;
    goto LABEL_10;
  }
  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceIdiom");

  if ((v7 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
LABEL_2:
    LOBYTE(v5) = 1;
  }
  else
  {
    -[UIContextMenuInteraction view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_window");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "traitCollection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v10, "verticalSizeClass") == 1)
    {
      LOBYTE(v5) = 0;
    }
    else
    {
      objc_msgSend(v10, "preferredContentSizeCategory");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = _UIContentSizeCategoryIsAccessibilityContentSizeCategory(v11, v12) ^ 1;

    }
  }
LABEL_10:

  return v5;
}

- (unint64_t)_actualLayoutForPreferredLayout:(unint64_t)a3 withConfiguration:(id)a4
{
  unint64_t v4;
  void *v5;

  v4 = a3;
  if (a3 == 100)
  {
    objc_msgSend(a4, "previewViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5 == 0;

  }
  return v4;
}

- (id)_fulfilledConfigurationForConfiguration:(id)a3 atLocation:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void (**v15)(_QWORD, _QWORD);
  int v16;
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
  void (**v27)(_QWORD, _QWORD);
  void *v28;
  void *v29;
  void (**v30)(_QWORD);
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v39;
  void *v40;
  void *v41;
  _QWORD v42[4];
  id v43;
  id location;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  v8 = (void *)objc_opt_new();
  objc_msgSend(v7, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setIdentifier:", v9);

  objc_msgSend(v7, "_internalIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_internalSecondaryItemIdentifiers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPrimaryInternalIdentifier:secondaryIdentifiers:", v10, v11);

  objc_msgSend(v7, "firstResponderTarget");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(v8, "setFirstResponderTarget:", v12);
  }
  else
  {
    -[UIContextMenuInteraction view](self, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFirstResponderTarget:", v13);

  }
  objc_msgSend(v7, "_primarySourcePreview");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSourcePreview:", v14);

  objc_msgSend(v7, "actionProvider");
  v15 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = dyld_program_sdk_at_least();
    -[UIContextMenuInteraction view](self, "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIContextMenuInteraction _suggestedMenuForConfiguration:atLocation:inCoordinateSpace:](self, "_suggestedMenuForConfiguration:atLocation:inCoordinateSpace:", v7, v17, x, y);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v18, "children");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v15)[2](v15, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "firstResponderTarget");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIContextMenuInteraction _menuPreparedForDisplayWithMenu:firstResponder:](self, "_menuPreparedForDisplayWithMenu:firstResponder:", v20, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v8, "firstResponderTarget");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      +[_UIActionBridge actionMenuForMenu:firstTarget:includeHidden:](_UIActionBridge, "actionMenuForMenu:firstTarget:includeHidden:", v18, v23, 1);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "children");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v15)[2](v15, v24);
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      +[_UIActionBridge actionMenuForMenu:firstTarget:includeHidden:](_UIActionBridge, "actionMenuForMenu:firstTarget:includeHidden:", v40, v23, 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIContextMenuInteraction _defaultPreparationContextWithFirstResponderTarget:](self, "_defaultPreparationContextWithFirstResponderTarget:", v23);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      BYTE4(location) = 0;
      LODWORD(location) = 0;
      objc_msgSend(v25, "_resolveElementSizeWithContext:", v26);
      objc_msgSend(v25, "children");
      v39 = v18;
      v27 = v15;
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      _menuElementsPreparedForDisplay(v28, objc_msgSend(v25, "_resolvedElementSize"), v26, (uint64_t)&location);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "menuByReplacingChildren:", v29);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = v27;
      LOBYTE(location) = 1;
      objc_msgSend(v22, "setMetadata:", location | ((unint64_t)BYTE4(location) << 32));

    }
    objc_msgSend(v8, "setMenu:", v22);

  }
  objc_msgSend(v7, "previewProvider");
  v30 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_effectiveSecondaryItemIdentifiers");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRepresentedItemCount:", objc_msgSend(v31, "count") + 1);

  -[UIContextMenuInteraction presentationInteraction](self, "presentationInteraction");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "secondaryEffectPreviews");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSecondarySourcePreviews:", v33);

  if (objc_msgSend(v7, "_clientDidSetBadgeCount"))
    v34 = objc_msgSend(v7, "badgeCount");
  else
    v34 = objc_msgSend(v8, "representedItemCount");
  objc_msgSend(v8, "setBadgeCount:", v34);
  if (-[UIContextMenuInteraction menuAppearance](self, "menuAppearance") == UIContextMenuInteractionAppearanceRich)
  {
    if ((objc_msgSend(v8, "isMultiItemMenu") & 1) == 0)
    {
      if (v30)
      {
        v30[2](v30);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setPreviewViewController:", v35);

      }
      if (self->_delegateImplements.willCommit || self->_delegateImplements.willPerformPreviewAction)
      {
        objc_initWeak(&location, self);
        v42[0] = MEMORY[0x1E0C809B0];
        v42[1] = 3221225472;
        v42[2] = __79__UIContextMenuInteraction__fulfilledConfigurationForConfiguration_atLocation___block_invoke;
        v42[3] = &unk_1E16B58D0;
        objc_copyWeak(&v43, &location);
        +[UIAction actionWithHandler:](UIAction, "actionWithHandler:", v42);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setPreviewAction:", v36);

        objc_destroyWeak(&v43);
        objc_destroyWeak(&location);
      }
    }
    -[UIContextMenuInteraction _delegate_getAccessoryViewsForConfiguration:](self, "_delegate_getAccessoryViewsForConfiguration:", v7);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAccessoryViews:", v37);

  }
  return v8;
}

void __79__UIContextMenuInteraction__fulfilledConfigurationForConfiguration_atLocation___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "sender");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "_contextMenuPresentationPreviewWasTapped:", v4);
}

- (id)_defaultPreparationContextWithFirstResponderTarget:(id)a3
{
  void *v4;

  +[_UIMenuPreparationContext contextWithPreparer:firstResponderTarget:](_UIMenuPreparationContext, "contextWithPreparer:firstResponderTarget:", self, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDeferredElementDelegate:", self);
  objc_msgSend(v4, "setSupportsCustomViewMenuElements:", 1);
  objc_msgSend(v4, "setShouldTrackVisibleSelection:", &__block_literal_global_684);
  return v4;
}

BOOL __79__UIContextMenuInteraction__defaultPreparationContextWithFirstResponderTarget___block_invoke(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v4;
  unint64_t v5;

  v4 = _UIContextMenuCellSizeForElementSize(a3);
  v5 = 3;
  if (v4 != 1)
    v5 = 0;
  if (!v4)
    v5 = 4;
  return v5 <= a2;
}

- (id)_menuPreparedForDisplayWithMenu:(id)a3 firstResponder:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  unsigned int v18;
  unsigned __int8 v19;

  v6 = a3;
  -[UIContextMenuInteraction _defaultPreparationContextWithFirstResponderTarget:](self, "_defaultPreparationContextWithFirstResponderTarget:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSupportsHeaderView:", 1);
  -[UIContextMenuInteraction _proxySender](self, "_proxySender");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSender:", v8);

  objc_msgSend(v7, "setUseSenderAsResponderSender:", -[UIContextMenuInteraction _useSenderAsResponderSender](self, "_useSenderAsResponderSender"));
  v9 = v6;
  v10 = v7;
  if ((objc_msgSend(v9, "metadata") & 1) != 0)
  {
    v15 = v9;
  }
  else
  {
    objc_msgSend(v10, "setTracksSelection:", (objc_msgSend(v9, "options") & 0x80) == 0);
    v19 = 0;
    v18 = 0;
    +[_UIActionBridge validatedCommandMenuForMenu:context:](_UIActionBridge, "validatedCommandMenuForMenu:context:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "_resolvedElementSize");
    objc_msgSend(v11, "children");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    _menuElementsPreparedForDisplay(v13, v12, v10, (uint64_t)&v18);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "menuByReplacingChildren:", v14);
    v15 = (id)objc_claimAutoreleasedReturnValue();

    LOBYTE(v18) = 1;
    if (objc_msgSend(v10, "supportsHeaderView"))
    {
      objc_msgSend(v9, "headerView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      HIBYTE(v18) |= v16 != 0;

    }
    objc_msgSend(v15, "setMetadata:", v18 | ((unint64_t)v19 << 32));
  }

  return v15;
}

- (void)_clickPresentationInteractionEnded:(id)a3 forPresentation:(id)a4 reason:(unint64_t)a5
{
  id v8;
  id v9;
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
  unint64_t v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  _QWORD v25[5];
  id v26;
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "menuConfiguration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIContextMenuInteraction configurationsByIdentifier](self, "configurationsByIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_5;
  }
  -[UIContextMenuInteraction pendingConfiguration](self, "pendingConfiguration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[UIContextMenuInteraction pendingConfiguration](self, "pendingConfiguration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIContextMenuInteraction setPendingConfiguration:](self, "setPendingConfiguration:", 0);
LABEL_5:
    -[UIContextMenuInteraction view](self, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_window");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "windowScene");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    _UIFocusBehaviorSetOverrideFocusSystemEnabled(0, v18, self);

    -[UIContextMenuInteraction _delegate_contextMenuInteractionWillEndForConfiguration:presentation:](self, "_delegate_contextMenuInteractionWillEndForConfiguration:presentation:", v14, v10);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (a5 != 10)
    {
      if (v10)
      {
        objc_msgSend(v10, "setAlongsideAnimatorForDismissal:", v19);
        if (a5 == 9)
        {
          v25[0] = MEMORY[0x1E0C809B0];
          v25[1] = 3221225472;
          v25[2] = __86__UIContextMenuInteraction__clickPresentationInteractionEnded_forPresentation_reason___block_invoke;
          v25[3] = &unk_1E16B1B50;
          v25[4] = self;
          v26 = v14;
          objc_msgSend(v19, "addAnimations:", v25);

        }
        goto LABEL_17;
      }
LABEL_16:
      objc_msgSend(v14, "identifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIContextMenuInteraction _performCleanupForConfigurationWithIdentifier:](self, "_performCleanupForConfigurationWithIdentifier:", v24);

      objc_msgSend(v19, "performAllAnimations");
      objc_msgSend(v19, "performAllCompletions");
LABEL_17:

      goto LABEL_18;
    }
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
        goto LABEL_15;
      objc_msgSend(v14, "identifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v28 = v23;
      _os_log_fault_impl(&dword_185066000, v22, OS_LOG_TYPE_FAULT, "Failed to present a context menu for configuration with identifier %@. This is likely due to a different presentation occuring during the lifecycle of the interaction.", buf, 0xCu);
    }
    else
    {
      v20 = _clickPresentationInteractionEnded_forPresentation_reason____s_category;
      if (!_clickPresentationInteractionEnded_forPresentation_reason____s_category)
      {
        v20 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v20, (unint64_t *)&_clickPresentationInteractionEnded_forPresentation_reason____s_category);
      }
      v21 = *(NSObject **)(v20 + 8);
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        goto LABEL_16;
      v22 = v21;
      objc_msgSend(v14, "identifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v28 = v23;
      _os_log_impl(&dword_185066000, v22, OS_LOG_TYPE_ERROR, "Failed to present a context menu for configuration with identifier %@. This is likely due to a different presentation occuring during the lifecycle of the interaction.", buf, 0xCu);
    }

LABEL_15:
    goto LABEL_16;
  }
LABEL_18:

}

void __86__UIContextMenuInteraction__clickPresentationInteractionEnded_forPresentation_reason___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_performCleanupForConfigurationWithIdentifier:", v2);

}

- (void)_clickPresentationInteraction:(id)a3 dragSessionDidEndForItems:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  dispatch_time_t v13;
  _QWORD v14[6];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__246;
  v23 = __Block_byref_object_dispose__246;
  v24 = 0;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = a4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v25, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v16;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v9)
        objc_enumerationMutation(v7);
      objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v10), "_uicmi_getAssociatedMenuIdentifier");
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)v20[5];
      v20[5] = v11;

      if (v20[5])
        break;
      if (v8 == ++v10)
      {
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v25, 16);
        if (v8)
          goto LABEL_3;
        break;
      }
    }
  }

  if (v20[5])
  {
    v13 = dispatch_time(0, 2000000000);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __84__UIContextMenuInteraction__clickPresentationInteraction_dragSessionDidEndForItems___block_invoke;
    v14[3] = &unk_1E16BC3A0;
    v14[4] = self;
    v14[5] = &v19;
    dispatch_after(v13, MEMORY[0x1E0C80D38], v14);
  }
  _Block_object_dispose(&v19, 8);

}

uint64_t __84__UIContextMenuInteraction__clickPresentationInteraction_dragSessionDidEndForItems___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performCleanupForConfigurationWithIdentifier:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

- (void)_clickPresentationInteraction:(id)a3 shouldPresentWithCompletion:(id)a4
{
  id v5;
  void (*v6)(void);
  id v7;

  if (self->_delegateImplements.shouldPresent)
  {
    v5 = a4;
    -[UIContextMenuInteraction delegate](self, "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_contextMenuInteraction:shouldPresentWithCompletion:", self, v5);

  }
  else
  {
    v6 = (void (*)(void))*((_QWORD *)a4 + 2);
    v7 = a4;
    v6();
  }

}

- (BOOL)_clickPresentationInteraction:(id)a3 shouldMaintainKeyboardAssertionForFirstResponder:(id)a4 presentation:(id)a5
{
  id v6;
  void *v7;
  char v8;

  v6 = a4;
  objc_msgSend(a5, "uiController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "shouldMaintainKeyboardAssertionForFirstResponder:", v6);

  return v8;
}

- (BOOL)contextMenuPresentationShouldAllowSwipeToDismissForBeginningPanInteraction:(id)a3
{
  void *v4;
  void *v5;
  char v6;

  -[UIContextMenuInteraction presentationInteraction](self, "presentationInteraction", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "beginPanInteraction");

  if (!self->_delegateImplements.shouldAllowSwipeToDismiss)
    return 1;
  -[UIContextMenuInteraction delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_contextMenuInteractionShouldAllowSwipeToDismiss:", self);

  return v6;
}

- (void)contextMenuPresentationDidEndPanInteraction:(id)a3
{
  id v3;

  -[UIContextMenuInteraction presentationInteraction](self, "presentationInteraction", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endPanInteraction");

}

- (void)contextMenuPresentation:(id)a3 didRequestDismissalWithReason:(unint64_t)a4 alongsideActions:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  int v20;
  unint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t);
  void *v29;
  UIContextMenuInteraction *v30;
  id v31;
  uint8_t buf[16];

  v10 = a3;
  v11 = a5;
  v12 = a6;
  -[UIContextMenuInteraction presentationInteraction](self, "presentationInteraction");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "_isActive");

  if ((v14 & 1) != 0)
  {
    -[UIContextMenuInteraction presentationsByIdentifier](self, "presentationsByIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "menuConfiguration");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = 0;
    v20 = 1;
    switch(a4)
    {
      case 0uLL:
        v19 = 3;
        break;
      case 1uLL:
        v19 = 5;
        break;
      case 2uLL:
        v19 = 6;
        break;
      case 3uLL:
        v19 = 7;
        break;
      case 6uLL:

        v18 = 0;
        v20 = 0;
        v19 = 2;
        break;
      default:
        break;
    }
    -[UIContextMenuInteraction setOutgoingPresentation:](self, "setOutgoingPresentation:", v18);
    -[UIContextMenuInteraction presentationInteraction](self, "presentationInteraction");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = MEMORY[0x1E0C809B0];
    v27 = 3221225472;
    v28 = __110__UIContextMenuInteraction_contextMenuPresentation_didRequestDismissalWithReason_alongsideActions_completion___block_invoke;
    v29 = &unk_1E16B2F48;
    v30 = self;
    v31 = v12;
    objc_msgSend(v23, "_cancelWithReason:alongsideActions:completion:", v19, v11, &v26);

    if (v20)
    {
      objc_msgSend(v18, "menuConfiguration", v26, v27, v28, v29);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "identifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIContextMenuInteraction _performCleanupForConfigurationWithIdentifier:](self, "_performCleanupForConfigurationWithIdentifier:", v25);

    }
  }
  else
  {
    v21 = contextMenuPresentation_didRequestDismissalWithReason_alongsideActions_completion____s_category;
    if (!contextMenuPresentation_didRequestDismissalWithReason_alongsideActions_completion____s_category)
    {
      v21 = __UILogCategoryGetNode("UILog", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v21, (unint64_t *)&contextMenuPresentation_didRequestDismissalWithReason_alongsideActions_completion____s_category);
    }
    v22 = *(NSObject **)(v21 + 8);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_185066000, v22, OS_LOG_TYPE_ERROR, "Ignoring attempt to dismiss a context menu. This might be due to a re-entrant dismiss call.", buf, 2u);
    }
  }

}

uint64_t __110__UIContextMenuInteraction_contextMenuPresentation_didRequestDismissalWithReason_alongsideActions_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "setOutgoingPresentation:", 0);
}

- (void)contextMenuPresentation:(id)a3 didBeginDragWithTouch:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[UIContextMenuInteraction presentationInteraction](self, "presentationInteraction");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "beginDragIfPossibleWithTouch:", v5);

}

- (id)_clickPresentationInteraction:(id)a3 liveDragPreviewForPresentation:(id)a4 dragItem:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;

  v7 = a4;
  v8 = a5;
  if (v7)
  {
    objc_msgSend(a3, "associatedDragInteraction");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_dragDropSession");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "_sessionPrefersFullSizePreviews:", v10);

    objc_msgSend(v7, "livePreviewForDragItem:preferringFullSize:", v8, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v7, "menuConfiguration");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "_uicmi_setAssociatedMenuIdentifier:", v14);
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)_clickPresentationInteraction:(id)a3 previewForCancellingDragItem:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a4;
  objc_msgSend(v5, "_uicmi_getAssociatedMenuIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6
    && (-[UIContextMenuInteraction presentationsByIdentifier](self, "presentationsByIdentifier"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v7, "objectForKeyedSubscript:", v6),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v8))
  {
    objc_msgSend(v8, "previewForCancellingDragItem:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)_clickPresentationInteraction:(id)a3 item:(id)a4 willAnimateDragCancelWithAnimator:(id)a5
{
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a5;
  objc_msgSend(a4, "_uicmi_getAssociatedMenuIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[UIContextMenuInteraction presentationsByIdentifier](self, "presentationsByIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "dragWillCancelWithAnimator:", v10);
  }

}

- (void)_performCleanupForConfigurationWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[UIContextMenuInteraction presentationsByIdentifier](self, "presentationsByIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIContextMenuInteraction presentationsByIdentifier](self, "presentationsByIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObjectForKey:", v4);

    -[UIContextMenuInteraction configurationsByIdentifier](self, "configurationsByIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObjectForKey:", v4);

    goto LABEL_4;
  }
  if (!os_variant_has_internal_diagnostics())
    goto LABEL_4;
  if (os_variant_has_internal_diagnostics())
  {
    __UIFaultDebugAssertLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      goto LABEL_11;
    -[UIContextMenuInteraction presentationsByIdentifier](self, "presentationsByIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412290;
    v14 = v12;
    _os_log_fault_impl(&dword_185066000, v11, OS_LOG_TYPE_FAULT, "Somehow made it to cleanup step with a nil identifier. Current presentations: %@.", (uint8_t *)&v13, 0xCu);
LABEL_10:

LABEL_11:
    goto LABEL_4;
  }
  v9 = _performCleanupForConfigurationWithIdentifier____s_category;
  if (!_performCleanupForConfigurationWithIdentifier____s_category)
  {
    v9 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v9, (unint64_t *)&_performCleanupForConfigurationWithIdentifier____s_category);
  }
  v10 = *(NSObject **)(v9 + 8);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v11 = v10;
    -[UIContextMenuInteraction presentationsByIdentifier](self, "presentationsByIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412290;
    v14 = v12;
    _os_log_impl(&dword_185066000, v11, OS_LOG_TYPE_ERROR, "Somehow made it to cleanup step with a nil identifier. Current presentations: %@.", (uint8_t *)&v13, 0xCu);
    goto LABEL_10;
  }
LABEL_4:

}

- (void)_contextMenuPresentationPreviewWasTapped:(id)a3
{
  id v4;
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
  _UIContextMenuCommitAnimation *v16;
  void *v17;
  void *v18;
  _UIContextMenuCommitAnimation *v19;
  _UIContextMenuCommitAnimation *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  _UIContextMenuCommitAnimation *v25;
  UIContextMenuInteraction *v26;
  _QWORD *v27;
  _QWORD v28[3];
  char v29;

  v4 = a3;
  v5 = v4;
  if (self->_delegateImplements.willCommit || self->_delegateImplements.willPerformPreviewAction)
  {
    objc_msgSend(v4, "menuConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "previewViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    +[_UIContextMenuAnimator animatorWithViewController:](_UIContextMenuAnimator, "animatorWithViewController:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIContextMenuInteraction setPendingCommitAnimator:](self, "setPendingCommitAnimator:", v8);
    -[UIContextMenuInteraction configurationsByIdentifier](self, "configurationsByIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "menuConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIContextMenuInteraction _delegate_tappedPreviewForConfiguration:withAnimator:](self, "_delegate_tappedPreviewForConfiguration:withAnimator:", v12, v8);
    if (objc_msgSend(v8, "preferredCommitStyle") == 1 && objc_msgSend(v8, "hasAnyActions"))
    {
      objc_msgSend(v5, "uiController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "platterContainerView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "window");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = [_UIContextMenuCommitAnimation alloc];
      objc_msgSend(v5, "uiController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "contentPlatterView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[_UIContextMenuCommitAnimation initWithSource:container:](v16, "initWithSource:container:", v18, v15);

      v28[0] = 0;
      v28[1] = v28;
      v28[2] = 0x2020000000;
      v29 = 0;
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __69__UIContextMenuInteraction__contextMenuPresentationPreviewWasTapped___block_invoke;
      v24[3] = &unk_1E16B9698;
      v27 = v28;
      v20 = v19;
      v25 = v20;
      v26 = self;
      -[UIContextMenuInteraction _delegate_performPreviewActionCommitAnimation:](self, "_delegate_performPreviewActionCommitAnimation:", v24);

      _Block_object_dispose(v28, 8);
    }
    else
    {
      if (objc_msgSend(v8, "hasAnyActions"))
        v21 = 4;
      else
        v21 = 3;
      -[UIContextMenuInteraction presentationInteraction](self, "presentationInteraction");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "_cancelWithReason:alongsideActions:completion:", v21, 0, 0);

    }
    objc_msgSend(v12, "identifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIContextMenuInteraction _performCleanupForConfigurationWithIdentifier:](self, "_performCleanupForConfigurationWithIdentifier:", v23);

  }
}

void __69__UIContextMenuInteraction__contextMenuPresentationPreviewWasTapped___block_invoke(_QWORD *a1)
{
  uint64_t v1;
  unint64_t v2;
  NSObject *v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[5];
  uint8_t buf[16];

  v1 = *(_QWORD *)(a1[6] + 8);
  if (*(_BYTE *)(v1 + 24))
  {
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v5, OS_LOG_TYPE_FAULT, "The context menu commit animation cannot be performed more than once.", buf, 2u);
      }

    }
    else
    {
      v2 = kClickPresentationInteractionTypeDebugString_block_invoke___s_category;
      if (!kClickPresentationInteractionTypeDebugString_block_invoke___s_category)
      {
        v2 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v2, (unint64_t *)&kClickPresentationInteractionTypeDebugString_block_invoke___s_category);
      }
      v3 = *(NSObject **)(v2 + 8);
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_185066000, v3, OS_LOG_TYPE_ERROR, "The context menu commit animation cannot be performed more than once.", buf, 2u);
      }
    }
  }
  else
  {
    *(_BYTE *)(v1 + 24) = 1;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __69__UIContextMenuInteraction__contextMenuPresentationPreviewWasTapped___block_invoke_104;
    v6[3] = &unk_1E16B1B28;
    v4 = (void *)a1[4];
    v6[4] = a1[5];
    objc_msgSend(v4, "animateWithAlongsideActions:completion:", v6, 0);
  }
}

void __69__UIContextMenuInteraction__contextMenuPresentationPreviewWasTapped___block_invoke_104(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "presentationInteraction");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_cancelWithReason:alongsideActions:completion:", 4, 0, 0);

}

- (void)contextMenuPresentation:(id)a3 didSelectMenuLeaf:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;

  v6 = a3;
  v7 = a4;
  objc_storeWeak((id *)&self->__selectedMenuLeaf, v7);
  -[UIContextMenuInteraction _proxySender](self, "_proxySender");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v7;
    objc_msgSend(v6, "menuConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstResponderTarget");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_resolvedTargetFromFirstTarget:sender:shouldUseFallbackActionOut:", v11, v8, &v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
      goto LABEL_10;
    if (v14)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v9, "_performFallbackActionWithSender:target:", v8, v12);
        goto LABEL_8;
      }
    }
  }
  else
  {
    v12 = 0;
  }
  objc_msgSend(v7, "performWithSender:target:", v8, v12);
LABEL_8:
  if (self->_delegateImplements.didPerformMenuLeaf)
  {
    -[UIContextMenuInteraction delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_contextMenuInteraction:didPerformMenuLeaf:target:", self, v7, v12);

  }
LABEL_10:
  objc_storeWeak((id *)&self->__selectedMenuLeaf, 0);

}

- (id)contextMenuPresentation:(id)a3 willDisplayMenu:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a4;
  objc_msgSend(a3, "menuConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstResponderTarget");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIContextMenuInteraction _menuPreparedForDisplayWithMenu:firstResponder:](self, "_menuPreparedForDisplayWithMenu:firstResponder:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)contextMenuPresentation:(id)a3 dismissalPreviewForItem:(id)a4 clientReturnedPreview:(BOOL *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v8 = a3;
  v9 = a4;
  -[UIContextMenuInteraction configurationsByIdentifier](self, "configurationsByIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[UIContextMenuInteraction _delegate_previewForDismissingForConfiguration:clientReturnedPreview:](self, "_delegate_previewForDismissingForConfiguration:clientReturnedPreview:", v11, a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (self->_delegateImplements.dismissalPreviewForItemWithIdentifier
         || self->_delegateImplements._dci_secondaryDismissalPreview)
  {
    objc_msgSend(v8, "menuConfiguration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIContextMenuInteraction configurationsByIdentifier](self, "configurationsByIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16 && self->_delegateImplements.dismissalPreviewForItemWithIdentifier)
    {
      -[UIContextMenuInteraction delegate](self, "delegate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "contextMenuInteraction:configuration:dismissalPreviewForItemWithIdentifier:", self, v16, v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)_interactionShouldBeginAtPoint:(CAPoint3D)a3 completion:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD aBlock[5];
  id v20;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[UIContextMenuInteraction presentationInteraction](self, "presentationInteraction");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "activatedDriverStyle");

  v9 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __70__UIContextMenuInteraction__interactionShouldBeginAtPoint_completion___block_invoke;
  aBlock[3] = &unk_1E16E5600;
  aBlock[4] = self;
  v10 = v7;
  v20 = v10;
  v17[0] = v9;
  v17[1] = 3221225472;
  v17[2] = __70__UIContextMenuInteraction__interactionShouldBeginAtPoint_completion___block_invoke_2;
  v17[3] = &unk_1E16E5628;
  v11 = _Block_copy(aBlock);
  v18 = v11;
  v12 = _Block_copy(v17);
  if (self->_delegateImplements.asyncConfigurationForMenuAtLocation)
  {
    -[UIContextMenuInteraction delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v9;
    v15[1] = 3221225472;
    v15[2] = __70__UIContextMenuInteraction__interactionShouldBeginAtPoint_completion___block_invoke_4;
    v15[3] = &unk_1E16E5628;
    v16 = v12;
    objc_msgSend(v13, "_contextMenuInteraction:configurationForMenuAtLocation:completion:", self, v15, x, y);

    v14 = v16;
  }
  else
  {
    -[UIContextMenuInteraction _delegate_configurationForMenuAtLocation:](self, "_delegate_configurationForMenuAtLocation:", x, y);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void *, void *))v12 + 2))(v12, v14);
  }

}

void __70__UIContextMenuInteraction__interactionShouldBeginAtPoint_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "configurationsByIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "setPendingConfiguration:", v8);
    if (!v5)
    {
      objc_msgSend(*(id *)(a1 + 32), "configurationsByIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, v7);

      objc_msgSend(*(id *)(a1 + 32), "_willBeginWithConfiguration:", v8);
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __70__UIContextMenuInteraction__interactionShouldBeginAtPoint_completion___block_invoke_2(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  if (a2)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __70__UIContextMenuInteraction__interactionShouldBeginAtPoint_completion___block_invoke_3;
    v3[3] = &unk_1E16E5628;
    v4 = *(id *)(a1 + 32);
    objc_msgSend(a2, "_prepareWithCompletion:", v3);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

uint64_t __70__UIContextMenuInteraction__interactionShouldBeginAtPoint_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __70__UIContextMenuInteraction__interactionShouldBeginAtPoint_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_delegate_configurationForMenuAtLocation:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;

  y = a3.y;
  x = a3.x;
  -[UIContextMenuInteraction delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contextMenuInteraction:configurationForMenuAtLocation:", self, x, y);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_delegate_previewForHighlightingForConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = v4;
  if (self->_delegateImplements.highlightPreviewForItemWithIdentifier)
  {
    objc_msgSend(v4, "_effectiveInternalIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIContextMenuInteraction delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "contextMenuInteraction:configuration:highlightPreviewForItemWithIdentifier:", self, v5, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (!self->_delegateImplements.previewForHighlighting)
    {
      v8 = 0;
      goto LABEL_6;
    }
    -[UIContextMenuInteraction delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contextMenuInteraction:previewForHighlightingMenuWithConfiguration:", self, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_6:
  return v8;
}

- (id)_delegate_previewForDismissingForConfiguration:(id)a3 clientReturnedPreview:(BOOL *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t (**v16)(_QWORD, _QWORD);
  uint64_t v17;
  void *v18;
  void *v19;

  v6 = a3;
  v7 = v6;
  if (self->_delegateImplements.dismissalPreviewForItemWithIdentifier)
  {
    objc_msgSend(v6, "_effectiveInternalIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIContextMenuInteraction delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "contextMenuInteraction:configuration:dismissalPreviewForItemWithIdentifier:", self, v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    *a4 = 1;
  }
  else if (self->_delegateImplements.previewForDismissing)
  {
    -[UIContextMenuInteraction delegate](self, "delegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "contextMenuInteraction:previewForDismissingMenuWithConfiguration:", self, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (dyld_program_sdk_at_least())
      *a4 = 1;
  }
  else
  {
    v10 = 0;
  }
  -[UIContextMenuInteraction view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "traitCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "userInterfaceIdiom");
  v14 = v10;
  _UIContextMenuGetPlatformMetrics(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "shouldApplyShadowHandler");
  v16 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  if (v16)
    v17 = ((uint64_t (**)(_QWORD, id))v16)[2](v16, v14);
  else
    v17 = 1;

  objc_msgSend(v14, "parameters");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setAppliesShadow:", v17);

  return v14;
}

- (void)_delegate_tappedPreviewForConfiguration:(id)a3 withAnimator:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if (self->_delegateImplements.willPerformPreviewAction)
  {
    -[UIContextMenuInteraction delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "contextMenuInteraction:willPerformPreviewActionForMenuWithConfiguration:animator:", self, v8, v6);
LABEL_5:

    goto LABEL_6;
  }
  if (self->_delegateImplements.willCommit)
  {
    -[UIContextMenuInteraction delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "contextMenuInteraction:willCommitWithAnimator:", self, v6);
    goto LABEL_5;
  }
LABEL_6:

}

- (id)_delegate_contextMenuInteractionWillDisplayForConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  if (self->_delegateImplements.willDisplay)
  {
    -[UIContextMenuInteraction delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contextMenuInteraction:willDisplayMenuForConfiguration:animator:", self, v4, v5);

  }
  return v5;
}

- (id)_delegate_contextMenuInteractionWillEndForConfiguration:(id)a3 presentation:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v5 = a3;
  -[UIContextMenuInteraction pendingCommitAnimator](self, "pendingCommitAnimator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    v8 = v6;
  else
    v8 = (id)objc_opt_new();
  v9 = v8;

  -[UIContextMenuInteraction setPendingCommitAnimator:](self, "setPendingCommitAnimator:", 0);
  if (self->_delegateImplements.willEndForConfiguration)
  {
    -[UIContextMenuInteraction delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "contextMenuInteraction:willEndForConfiguration:animator:", self, v5, v9);

  }
  return v9;
}

- (id)_delegate_getAccessoryViewsForConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  if (self->_delegateImplements.accessoriesForMenu)
  {
    v4 = a3;
    -[UIContextMenuInteraction delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_contextMenuInteraction:accessoriesForMenuWithConfiguration:", self, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)_delegate_performPreviewActionCommitAnimation:(id)a3
{
  void *v4;
  char v5;
  void (**v6)(void);

  v6 = (void (**)(void))a3;
  if (!self->_delegateImplements.shouldDeferCommitAnimation
    || (-[UIContextMenuInteraction delegate](self, "delegate"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "_contextMenuInteraction:shouldDeferPreviewActionCommitAnimation:", self, v6),
        v4,
        (v5 & 1) == 0))
  {
    v6[2]();
  }

}

- (id)_suggestedMenuForConfiguration:(id)a3 atLocation:(CGPoint)a4 inCoordinateSpace:(id)a5
{
  double y;
  double x;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  y = a4.y;
  x = a4.x;
  v9 = a3;
  v10 = a5;
  if (!self->_delegateImplements.overrideSuggestedActions)
    goto LABEL_3;
  -[UIContextMenuInteraction delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_contextMenuInteraction:overrideSuggestedActionsForConfiguration:", self, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_1E16EDF20, 0, CFSTR("com.apple.menu.root"), 0, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
LABEL_3:
    +[UIMenuSystem contextSystem](UIMenuSystem, "contextSystem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIContextMenuInteraction view](self, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v14, "_newBuilderFromResponderChain:atLocation:inCoordinateSpace:", v15, v10, x, y);
    objc_msgSend(v16, "menuForIdentifier:", CFSTR("com.apple.menu.root"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v13;
}

- (void)_prepareSceneActivationConfiguration:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  UIContextMenuInteraction *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  id v16;

  v16 = a3;
  -[UIContextMenuInteraction presentationsByIdentifier](self, "presentationsByIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "windowSceneActivationPreview");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    v9 = 1;
  }
  else
  {
    objc_msgSend(v16, "preview");
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v8 = (void *)v10;
    }
    else
    {
      -[UIContextMenuInteraction _proxySender](self, "_proxySender");
      v11 = (UIContextMenuInteraction *)objc_claimAutoreleasedReturnValue();

      if (v11 == self
        && (objc_msgSend(v6, "menuConfiguration"),
            v12 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v12, "sourcePreview"),
            v13 = (void *)objc_claimAutoreleasedReturnValue(),
            v14 = objc_msgSend(v13, "_isVisible"),
            v13,
            v12,
            v14))
      {
        objc_msgSend(v6, "menuConfiguration");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "sourcePreview");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v8 = 0;
      }
    }
    v9 = 0;
  }
  objc_msgSend(v16, "setPreview:", v8);
  objc_msgSend(v16, "_setAnimationSource:", v9);

}

- (void)_requestSceneActivationWithConfiguration:(id)a3 animated:(BOOL)a4 sender:(id)a5 errorHandler:(id)a6
{
  _BOOL4 v8;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _UIWindowSceneActivationAnimator *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  id v22;
  _UIWindowSceneActivationAnimator *v23;
  unint64_t v24;
  NSObject *v25;
  NSObject *v26;
  _QWORD v27[4];
  _UIWindowSceneActivationAnimator *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  _QWORD v34[5];
  id v35;
  _QWORD v36[4];
  id v37;
  id location[4];

  v8 = a4;
  location[3] = *(id *)MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  -[UIContextMenuInteraction presentationsByIdentifier](self, "presentationsByIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "allValues");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "firstObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v10, "preview");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16 && v15)
    {
      v17 = -[_UIWindowSceneActivationAnimator initWithConfiguration:]([_UIWindowSceneActivationAnimator alloc], "initWithConfiguration:", v10);
      objc_msgSend(v15, "uiController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[_UIContextMenuDismissToWindowSceneActivationAnimation animationWithUIController:](_UIContextMenuDismissToWindowSceneActivationAnimation, "animationWithUIController:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = MEMORY[0x1E0C809B0];
      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = __98__UIContextMenuInteraction__requestSceneActivationWithConfiguration_animated_sender_errorHandler___block_invoke;
      v36[3] = &unk_1E16EC400;
      v21 = v19;
      v37 = v21;
      -[_UIWindowSceneActivationAnimator addAnimations:](v17, "addAnimations:", v36);
      v34[0] = v20;
      v34[1] = 3221225472;
      v34[2] = __98__UIContextMenuInteraction__requestSceneActivationWithConfiguration_animated_sender_errorHandler___block_invoke_2;
      v34[3] = &unk_1E16B1B50;
      v34[4] = self;
      v22 = v15;
      v35 = v22;
      -[_UIWindowSceneActivationAnimator addCompletion:](v17, "addCompletion:", v34);
      objc_initWeak(location, self);
      v27[0] = v20;
      v27[1] = 3221225472;
      v27[2] = __98__UIContextMenuInteraction__requestSceneActivationWithConfiguration_animated_sender_errorHandler___block_invoke_4;
      v27[3] = &unk_1E16ED220;
      v23 = v17;
      v28 = v23;
      v29 = v10;
      v30 = v11;
      v32 = v12;
      objc_copyWeak(&v33, location);
      v31 = v22;
      -[_UIWindowSceneActivationAnimator prewarmWithCompletion:](v23, "prewarmWithCompletion:", v27);

      objc_destroyWeak(&v33);
      objc_destroyWeak(location);

    }
    else
    {
      if (os_variant_has_internal_diagnostics())
      {
        __UIFaultDebugAssertLog();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
        {
          LODWORD(location[0]) = 138412290;
          *(id *)((char *)location + 4) = v10;
          _os_log_fault_impl(&dword_185066000, v26, OS_LOG_TYPE_FAULT, "The configuration either has no preview or there is no current context menu presentation; configuration = %@",
            (uint8_t *)location,
            0xCu);
        }

      }
      else
      {
        v24 = _requestSceneActivationWithConfiguration_animated_sender_errorHandler____s_category;
        if (!_requestSceneActivationWithConfiguration_animated_sender_errorHandler____s_category)
        {
          v24 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v24, (unint64_t *)&_requestSceneActivationWithConfiguration_animated_sender_errorHandler____s_category);
        }
        v25 = *(NSObject **)(v24 + 8);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          LODWORD(location[0]) = 138412290;
          *(id *)((char *)location + 4) = v10;
          _os_log_impl(&dword_185066000, v25, OS_LOG_TYPE_ERROR, "The configuration either has no preview or there is no current context menu presentation; configuration = %@",
            (uint8_t *)location,
            0xCu);
        }
      }
      objc_msgSend((id)UIApp, "_requestSceneActivationWithConfiguration:animated:sender:errorHandler:", v10, 0, v11, v12);
    }
  }
  else
  {
    if (v15)
      -[UIContextMenuInteraction contextMenuPresentation:didRequestDismissalWithReason:alongsideActions:completion:](self, "contextMenuPresentation:didRequestDismissalWithReason:alongsideActions:completion:", v15, 1, 0, 0);
    objc_msgSend((id)UIApp, "_requestSceneActivationWithConfiguration:animated:sender:errorHandler:", v10, 0, v11, v12);
  }

}

uint64_t __98__UIContextMenuInteraction__requestSceneActivationWithConfiguration_animated_sender_errorHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "animateAlongsideScenePlatter:", a2);
}

void __98__UIContextMenuInteraction__requestSceneActivationWithConfiguration_animated_sender_errorHandler___block_invoke_2(uint64_t a1)
{
  void *v1;
  _QWORD v2[5];
  id v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __98__UIContextMenuInteraction__requestSceneActivationWithConfiguration_animated_sender_errorHandler___block_invoke_3;
  v2[3] = &unk_1E16B1B50;
  v1 = *(void **)(a1 + 40);
  v2[4] = *(_QWORD *)(a1 + 32);
  v3 = v1;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v2);

}

uint64_t __98__UIContextMenuInteraction__requestSceneActivationWithConfiguration_animated_sender_errorHandler___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "contextMenuPresentation:didRequestDismissalWithReason:alongsideActions:completion:", *(_QWORD *)(a1 + 40), 1, 0, 0);
}

void __98__UIContextMenuInteraction__requestSceneActivationWithConfiguration_animated_sender_errorHandler___block_invoke_4(uint64_t a1, int a2, void *a3)
{
  void *v5;
  void *v6;
  id WeakRetained;
  id v8;

  v8 = a3;
  v5 = *(void **)(a1 + 32);
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 40), "preview");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "animateWithSourcePreview:velocity:", v6, 0.0);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "cancel");
  }
  objc_msgSend((id)UIApp, "_requestSceneActivationWithConfiguration:animated:sender:errorHandler:", *(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
  if ((a2 & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    objc_msgSend(WeakRetained, "contextMenuPresentation:didRequestDismissalWithReason:alongsideActions:completion:", *(_QWORD *)(a1 + 56), 1, 0, 0);

  }
}

- ($9BEB610D0CE1B1EDC3D89DA2464F985F)_testing_metdataForMenuElements:(id)a3
{
  id v4;
  void *v5;
  id v6;
  unsigned int v8;
  unsigned __int8 v9;

  v4 = a3;
  v8 = 0;
  v9 = 0;
  +[_UIMenuPreparationContext contextWithPreparer:firstResponderTarget:](_UIMenuPreparationContext, "contextWithPreparer:firstResponderTarget:", self, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDeferredElementDelegate:", self);
  objc_msgSend(v5, "setSupportsCustomViewMenuElements:", 1);
  v6 = _menuElementsPreparedForDisplay(v4, 2, v5, (uint64_t)&v8);

  return ($9BEB610D0CE1B1EDC3D89DA2464F985F)(v8 | ((unint64_t)v9 << 32));
}

- (UIContextMenuConfiguration)pendingConfiguration
{
  return self->_pendingConfiguration;
}

- (void)setPendingConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_pendingConfiguration, a3);
}

- (NSMutableDictionary)configurationsByIdentifier
{
  return self->_configurationsByIdentifier;
}

- (void)setOutgoingPresentation:(id)a3
{
  objc_storeStrong((id *)&self->_outgoingPresentation, a3);
}

- (_UIContextMenuAnimator)pendingCommitAnimator
{
  return self->_pendingCommitAnimator;
}

- (void)setPendingCommitAnimator:(id)a3
{
  objc_storeStrong((id *)&self->_pendingCommitAnimator, a3);
}

- (BOOL)_requiresTouchAuthentication
{
  return self->__requiresTouchAuthentication;
}

- (void)set_requiresTouchAuthentication:(BOOL)a3
{
  self->__requiresTouchAuthentication = a3;
}

- (BOOL)_useSenderAsResponderSender
{
  return self->__useSenderAsResponderSender;
}

- (void)set_useSenderAsResponderSender:(BOOL)a3
{
  self->__useSenderAsResponderSender = a3;
}

- (UIMenuLeaf)_selectedMenuLeaf
{
  return (UIMenuLeaf *)objc_loadWeakRetained((id *)&self->__selectedMenuLeaf);
}

- (void)set_selectedMenuLeaf:(id)a3
{
  objc_storeWeak((id *)&self->__selectedMenuLeaf, a3);
}

@end
