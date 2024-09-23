@implementation SBHLibraryIndicatorIconDropInteractionDelegate

- (SBHLibraryIndicatorIconDropInteractionDelegate)initWithLibraryIndicatorIconView:(id)a3
{
  id v4;
  SBHLibraryIndicatorIconDropInteractionDelegate *v5;
  SBHLibraryIndicatorIconDropInteractionDelegate *v6;
  uint64_t v7;
  UIDropInteraction *dropInteraction;
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t, void *);
  void *v17;
  id v18;
  id location;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)SBHLibraryIndicatorIconDropInteractionDelegate;
  v5 = -[SBHLibraryIndicatorIconDropInteractionDelegate init](&v20, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_libraryIndicatorIconView, v4);
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3780]), "initWithDelegate:", v6);
    dropInteraction = v6->_dropInteraction;
    v6->_dropInteraction = (UIDropInteraction *)v7;

    -[UIDropInteraction _setWantsDefaultVisualBehavior:](v6->_dropInteraction, "_setWantsDefaultVisualBehavior:", 0);
    objc_msgSend(v4, "addInteraction:", v6->_dropInteraction);
    v9 = objc_alloc_init(MEMORY[0x1E0DA9EE8]);
    v10 = objc_alloc_init(MEMORY[0x1E0DA9EF0]);
    objc_msgSend(v9, "setDelegate:", v6);
    objc_msgSend(v10, "setDelegate:", v6);
    objc_msgSend(v10, "setUseFastBlinkAnimation:", 1);
    objc_initWeak(&location, v6);
    v11 = objc_alloc(MEMORY[0x1E0DC3C98]);
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __83__SBHLibraryIndicatorIconDropInteractionDelegate_initWithLibraryIndicatorIconView___block_invoke;
    v17 = &unk_1E8D874F8;
    objc_copyWeak(&v18, &location);
    v12 = (void *)objc_msgSend(v11, "initWithInteractionBehavior:interactionEffect:activationHandler:", v9, v10, &v14);
    objc_msgSend(v4, "addInteraction:", v12, v14, v15, v16, v17);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);

  }
  return v6;
}

void __83__SBHLibraryIndicatorIconDropInteractionDelegate_initWithLibraryIndicatorIconView___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 32);
  v4 = a3;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_handleSpringLoadedInteractionDidActivateWithContext:", v4);

}

- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  char v10;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v12 = *MEMORY[0x1E0DAB500];
  v5 = (void *)MEMORY[0x1E0C99D20];
  v6 = a4;
  objc_msgSend(v5, "arrayWithObjects:count:", &v12, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "hasItemsConformingToTypeIdentifiers:", v7, v12, v13);

  if (!v8)
    return 0;
  -[SBHLibraryIndicatorIconDropInteractionDelegate libraryIndicatorIconView](self, "libraryIndicatorIconView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEditing");

  return v10;
}

- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4
{
  uint64_t v4;

  if (-[SBHLibraryIndicatorIconDropInteractionDelegate _canPerformDropForAnyItemInSession:](self, "_canPerformDropForAnyItemInSession:", a4))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3788]), "initWithDropOperation:", v4);
}

- (void)dropInteraction:(id)a3 sessionDidEnter:(id)a4
{
  -[SBHLibraryIndicatorIconDropInteractionDelegate _updateIndicatorIconViewForSession:isActive:](self, "_updateIndicatorIconViewForSession:isActive:", a4, 1);
}

- (void)dropInteraction:(id)a3 sessionDidExit:(id)a4
{
  -[SBHLibraryIndicatorIconDropInteractionDelegate _updateIndicatorIconViewForSession:isActive:](self, "_updateIndicatorIconViewForSession:isActive:", a4, 0);
}

- (void)dropInteraction:(id)a3 sessionDidEnd:(id)a4
{
  -[SBHLibraryIndicatorIconDropInteractionDelegate _updateIndicatorIconViewForSession:isActive:](self, "_updateIndicatorIconViewForSession:isActive:", a4, 0);
}

- (void)dropInteraction:(id)a3 performDrop:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[SBHLibraryIndicatorIconDropInteractionDelegate _iconModel](self, "_iconModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rootFolder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHLibraryIndicatorIconDropInteractionDelegate _draggedItemIdentifiersInSession:](self, "_draggedItemIdentifiersInSession:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(v6, "leafIconForIdentifier:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v12));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[SBHLibraryIndicatorIconDropInteractionDelegate _canPerformDropForDraggedIcon:](self, "_canPerformDropForDraggedIcon:", v13))
        {
          objc_msgSend(v7, "ignoredList");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addIcon:", v13);

        }
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }
  -[SBHLibraryIndicatorIconDropInteractionDelegate _notifyDidPerformDropForSession:](self, "_notifyDidPerformDropForSession:", v5);

}

- (id)dropInteraction:(id)a3 previewForDroppingItem:(id)a4 withDefault:(id)a5
{
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  void *v14;
  void *v15;
  CGAffineTransform v17;
  CGAffineTransform v18;

  v7 = a5;
  if (-[SBHLibraryIndicatorIconDropInteractionDelegate _canPerformDropForDragItem:](self, "_canPerformDropForDragItem:", a4))
  {
    -[SBHLibraryIndicatorIconDropInteractionDelegate libraryIndicatorIconView](self, "libraryIndicatorIconView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bounds");
    UIRectGetCenter();
    v10 = v9;
    v12 = v11;
    memset(&v18, 0, sizeof(v18));
    CGAffineTransformMakeScale(&v18, 0.01, 0.01);
    v13 = objc_alloc(MEMORY[0x1E0DC3770]);
    v17 = v18;
    v14 = (void *)objc_msgSend(v13, "initWithContainer:center:transform:", v8, &v17, v10, v12);
    objc_msgSend(v7, "retargetedPreviewWithTarget:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "set_springboardPlatterStyle:", 1);

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)dropInteraction:(id)a3 item:(id)a4 willAnimateDropWithAnimator:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v6 = a5;
  objc_msgSend(a4, "sbh_appDragLocalContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "portaledPreview");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  if (v10)
  {
    v11 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __99__SBHLibraryIndicatorIconDropInteractionDelegate_dropInteraction_item_willAnimateDropWithAnimator___block_invoke;
    v15[3] = &unk_1E8D84C50;
    v12 = v10;
    v16 = v12;
    objc_msgSend(v6, "addAnimations:", v15);
    v13[0] = v11;
    v13[1] = 3221225472;
    v13[2] = __99__SBHLibraryIndicatorIconDropInteractionDelegate_dropInteraction_item_willAnimateDropWithAnimator___block_invoke_2;
    v13[3] = &unk_1E8D863E0;
    v14 = v12;
    objc_msgSend(v6, "addCompletion:", v13);

  }
}

uint64_t __99__SBHLibraryIndicatorIconDropInteractionDelegate_dropInteraction_item_willAnimateDropWithAnimator___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setIconAllowsLabelArea:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setIconAllowsAccessory:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setIconCanShowCloseBox:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setDragState:", 3);
}

uint64_t __99__SBHLibraryIndicatorIconDropInteractionDelegate_dropInteraction_item_willAnimateDropWithAnimator___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dropDestinationAnimationCompleted");
}

- (id)targetItemForSpringLoadingInteractionInView:(id)a3 atLocation:(CGPoint)a4 forDropSession:(id)a5
{
  void *v6;

  if (-[SBHLibraryIndicatorIconDropInteractionDelegate _canPerformDropForAnyItemInSession:](self, "_canPerformDropForAnyItemInSession:", a5, a4.x, a4.y))
  {
    -[SBHLibraryIndicatorIconDropInteractionDelegate libraryIndicatorIconView](self, "libraryIndicatorIconView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)targetViewForSpringLoadingEffectForView:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[SBHLibraryIndicatorIconDropInteractionDelegate libraryIndicatorIconView](self, "libraryIndicatorIconView", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "customIconImageViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "springLoadingEffectTargetView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_iconIdentifierForDragItem:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "sbh_appDragLocalContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_draggedItemIdentifiersInSession:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v18 = v4;
  objc_msgSend(v4, "items");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v11, "sbh_appDragLocalContext");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBHLibraryIndicatorIconDropInteractionDelegate _iconIdentifierForDragItem:](self, "_iconIdentifierForDragItem:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
          objc_msgSend(v5, "addObject:", v13);
        objc_msgSend(v12, "containedIconIdentifiers");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (v14)
        {
          objc_msgSend(v14, "allObjects");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObjectsFromArray:", v16);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
  }

  return v5;
}

- (BOOL)_canPerformDropForAnyItemInSession:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  BOOL v12;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SBHLibraryIndicatorIconDropInteractionDelegate _iconModel](self, "_iconModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHLibraryIndicatorIconDropInteractionDelegate _draggedItemIdentifiersInSession:](self, "_draggedItemIdentifiersInSession:", v4);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(v5, "leafIconForIdentifier:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i), (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = -[SBHLibraryIndicatorIconDropInteractionDelegate _canPerformDropForDraggedIcon:](self, "_canPerformDropForDraggedIcon:", v11);

        if (v12)
        {
          v13 = 1;
          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v8)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_11:

  return v13;
}

- (BOOL)_canPerformDropForDragItem:(id)a3
{
  SBHLibraryIndicatorIconDropInteractionDelegate *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = self;
  -[SBHLibraryIndicatorIconDropInteractionDelegate _iconIdentifierForDragItem:](self, "_iconIdentifierForDragItem:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHLibraryIndicatorIconDropInteractionDelegate _iconModel](v3, "_iconModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "leafIconForIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = -[SBHLibraryIndicatorIconDropInteractionDelegate _canPerformDropForDraggedIcon:](v3, "_canPerformDropForDraggedIcon:", v6);
  return (char)v3;
}

- (BOOL)_canPerformDropForDraggedIcon:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  if (!a3)
    return 0;
  v4 = a3;
  -[SBHLibraryIndicatorIconDropInteractionDelegate _iconModel](self, "_iconModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rootFolder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ignoredList");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v6) = objc_msgSend(v7, "isAllowedToContainIcon:", v4);
  return (char)v6;
}

- (id)_iconModel
{
  void *v3;
  void *v4;
  void *v5;

  -[SBHLibraryIndicatorIconDropInteractionDelegate contextProvider](self, "contextProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHLibraryIndicatorIconDropInteractionDelegate libraryIndicatorIconView](self, "libraryIndicatorIconView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "iconModelForDroppingIntoLibraryIndicatorIconView:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_notifyDidPerformDropForSession:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SBHLibraryIndicatorIconDropInteractionDelegate contextProvider](self, "contextProvider");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[SBHLibraryIndicatorIconDropInteractionDelegate libraryIndicatorIconView](self, "libraryIndicatorIconView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "libraryIndicatorIconView:didAcceptDropForSession:", v5, v4);

}

- (void)_handleSpringLoadedInteractionDidActivateWithContext:(id)a3
{
  void *v4;
  id v5;

  -[SBHLibraryIndicatorIconDropInteractionDelegate contextProvider](self, "contextProvider", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[SBHLibraryIndicatorIconDropInteractionDelegate libraryIndicatorIconView](self, "libraryIndicatorIconView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleSpringLoadDidActivateForLibraryIndicatorIconView:", v4);

}

- (void)_updateIndicatorIconViewForSession:(id)a3 isActive:(BOOL)a4
{
  int v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  _QWORD v12[4];
  id v13;
  char v14;

  v4 = a4;
  v6 = a3;
  -[SBHLibraryIndicatorIconDropInteractionDelegate libraryIndicatorIconView](self, "libraryIndicatorIconView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v4 = -[SBHLibraryIndicatorIconDropInteractionDelegate _canPerformDropForAnyItemInSession:](self, "_canPerformDropForAnyItemInSession:", v6);
  objc_msgSend(v7, "customIconImageViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 != objc_msgSend(v8, "isOverlapping"))
  {
    v9 = (void *)MEMORY[0x1E0DC3F10];
    +[SBHIconManager defaultIconLayoutAnimationDuration](SBHIconManager, "defaultIconLayoutAnimationDuration");
    v11 = v10;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __94__SBHLibraryIndicatorIconDropInteractionDelegate__updateIndicatorIconViewForSession_isActive___block_invoke;
    v12[3] = &unk_1E8D85BB8;
    v13 = v8;
    v14 = v4;
    objc_msgSend(v9, "animateWithDuration:animations:", v12, v11);

  }
}

uint64_t __94__SBHLibraryIndicatorIconDropInteractionDelegate__updateIndicatorIconViewForSession_isActive___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setOverlapping:", *(unsigned __int8 *)(a1 + 40));
}

- (SBIconView)libraryIndicatorIconView
{
  return (SBIconView *)objc_loadWeakRetained((id *)&self->_libraryIndicatorIconView);
}

- (SBHLibraryIndicatorIconDropInteractionContextProviding)contextProvider
{
  return (SBHLibraryIndicatorIconDropInteractionContextProviding *)objc_loadWeakRetained((id *)&self->_contextProvider);
}

- (void)setContextProvider:(id)a3
{
  objc_storeWeak((id *)&self->_contextProvider, a3);
}

- (UIDropInteraction)dropInteraction
{
  return self->_dropInteraction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dropInteraction, 0);
  objc_destroyWeak((id *)&self->_contextProvider);
  objc_destroyWeak((id *)&self->_libraryIndicatorIconView);
}

@end
