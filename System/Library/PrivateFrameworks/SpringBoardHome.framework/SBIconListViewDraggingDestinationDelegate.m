@implementation SBIconListViewDraggingDestinationDelegate

- (SBIconListViewDraggingDestinationDelegate)initWithIconListView:(id)a3
{
  id v4;
  SBIconListViewDraggingDestinationDelegate *v5;
  uint64_t v6;
  UIDropInteraction *dropInteraction;
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t, void *);
  void *v16;
  id v17;
  id location;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SBIconListViewDraggingDestinationDelegate;
  v5 = -[SBIconListViewDraggingDestinationDelegate init](&v19, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3780]), "initWithDelegate:", v5);
    dropInteraction = v5->_dropInteraction;
    v5->_dropInteraction = (UIDropInteraction *)v6;

    -[UIDropInteraction setAllowsSimultaneousDropSessions:](v5->_dropInteraction, "setAllowsSimultaneousDropSessions:", 1);
    -[UIDropInteraction _setWantsDefaultVisualBehavior:](v5->_dropInteraction, "_setWantsDefaultVisualBehavior:", 0);
    objc_msgSend(v4, "addInteraction:", v5->_dropInteraction);
    objc_storeWeak((id *)&v5->_iconListView, v4);
    v8 = objc_alloc_init(MEMORY[0x1E0DA9EE8]);
    v9 = objc_alloc_init(MEMORY[0x1E0DA9EF0]);
    objc_msgSend(v8, "setDelegate:", v5);
    objc_msgSend(v9, "setDelegate:", v5);
    objc_msgSend(v9, "setUseFastBlinkAnimation:", 1);
    objc_initWeak(&location, v5);
    v10 = objc_alloc(MEMORY[0x1E0DC3C98]);
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __66__SBIconListViewDraggingDestinationDelegate_initWithIconListView___block_invoke;
    v16 = &unk_1E8D874F8;
    objc_copyWeak(&v17, &location);
    v11 = (void *)objc_msgSend(v10, "initWithInteractionBehavior:interactionEffect:activationHandler:", v8, v9, &v13);
    objc_msgSend(v4, "addInteraction:", v11, v13, v14, v15, v16);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);

  }
  return v5;
}

void __66__SBIconListViewDraggingDestinationDelegate_initWithIconListView___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 32);
  v4 = a3;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_handleSpringloadAndComplete:", v4);

}

- (id)dragDelegate
{
  void *v2;
  void *v3;

  -[SBIconListViewDraggingDestinationDelegate iconListView](self, "iconListView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "effectiveDragDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)uniqueIdentifierForDropSession:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  objc_msgSend(v3, "localDragSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4
    || (objc_getAssociatedObject(v3, "SBIconListViewDraggingDestinationDelegateDropSessionUniqueIdentifier"),
        (v5 = (id)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_getAssociatedObject(v3, "SBIconListViewDraggingDestinationDelegateDropSessionUniqueIdentifier");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0CB3A28]);
      objc_setAssociatedObject(v3, "SBIconListViewDraggingDestinationDelegateDropSessionUniqueIdentifier", v5, (void *)0x301);
      if (v4)
        objc_setAssociatedObject(v4, "SBIconListViewDraggingDestinationDelegateDropSessionUniqueIdentifier", v5, (void *)0x301);
    }
  }

  return v5;
}

- (void)addDragObserver:(id)a3 forDropSession:(id)a4
{
  void *v6;
  id v7;
  id v8;

  v8 = a3;
  -[SBIconListViewDraggingDestinationDelegate uniqueIdentifierForDropSession:](self, "uniqueIdentifierForDropSession:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[NSMapTable objectForKey:](self->_dragObservers, "objectForKey:", v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      -[NSMapTable setObject:forKey:](self->_dragObservers, "setObject:forKey:", v7, v6);
    }
    objc_msgSend(v7, "addObject:", v8);

  }
}

- (void)enumerateDragObserversForDropSession:(id)a3 usingBlock:(id)a4
{
  void (**v6)(id, _QWORD);
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, _QWORD))a4;
  -[SBIconListViewDraggingDestinationDelegate uniqueIdentifierForDropSession:](self, "uniqueIdentifierForDropSession:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[NSMapTable objectForKey:](self->_dragObservers, "objectForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v14;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v14 != v11)
            objc_enumerationMutation(v8);
          v6[2](v6, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12++));
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v10);
    }

  }
}

- (void)removeAllDragObserversForDropSession:(id)a3
{
  void *v4;
  void *v5;

  -[SBIconListViewDraggingDestinationDelegate uniqueIdentifierForDropSession:](self, "uniqueIdentifierForDropSession:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    -[NSMapTable removeObjectForKey:](self->_dragObservers, "removeObjectForKey:", v4);
    v4 = v5;
  }

}

- (void)markDropSessionAsWaitingForConcludeDrop:(id)a3
{
  void *v4;
  NSMutableSet *dropSessionIdentifiersWaitingForConcludeDrop;
  NSMutableSet *v6;
  NSMutableSet *v7;
  void *v8;

  -[SBIconListViewDraggingDestinationDelegate uniqueIdentifierForDropSession:](self, "uniqueIdentifierForDropSession:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    dropSessionIdentifiersWaitingForConcludeDrop = self->_dropSessionIdentifiersWaitingForConcludeDrop;
    v8 = v4;
    if (!dropSessionIdentifiersWaitingForConcludeDrop)
    {
      v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
      v7 = self->_dropSessionIdentifiersWaitingForConcludeDrop;
      self->_dropSessionIdentifiersWaitingForConcludeDrop = v6;

      dropSessionIdentifiersWaitingForConcludeDrop = self->_dropSessionIdentifiersWaitingForConcludeDrop;
    }
    -[NSMutableSet addObject:](dropSessionIdentifiersWaitingForConcludeDrop, "addObject:", v8);
    v4 = v8;
  }

}

- (void)unmarkDropSessionAsWaitingForConcludeDrop:(id)a3
{
  void *v4;
  void *v5;

  -[SBIconListViewDraggingDestinationDelegate uniqueIdentifierForDropSession:](self, "uniqueIdentifierForDropSession:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    -[NSMutableSet removeObject:](self->_dropSessionIdentifiersWaitingForConcludeDrop, "removeObject:", v4);
    v4 = v5;
  }

}

- (BOOL)isDropSessionWaitingForConcludeDrop:(id)a3
{
  void *v4;
  char v5;

  -[SBIconListViewDraggingDestinationDelegate uniqueIdentifierForDropSession:](self, "uniqueIdentifierForDropSession:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = -[NSMutableSet containsObject:](self->_dropSessionIdentifiersWaitingForConcludeDrop, "containsObject:", v4);
  else
    v5 = 0;

  return v5;
}

- (unint64_t)dragTypeForDropSession:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  unint64_t v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SBIconListViewDraggingDestinationDelegate iconListView](self, "iconListView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "iconDragTypeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v11[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v4, "hasItemsConformingToTypeIdentifiers:", v7);

    if (v8)
      v9 = 1;
    else
      v9 = 2;
  }
  else
  {
    v9 = 2;
  }

  return v9;
}

- (BOOL)updateCurrentPolicyHandlerForDropSession:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  BOOL result;
  __objc2_class **v7;
  id v8;

  v4 = -[SBIconListViewDraggingDestinationDelegate dragTypeForDropSession:](self, "dragTypeForDropSession:", a3);
  v5 = -[SBIconListViewDraggingDestinationDelegate currentDragType](self, "currentDragType");
  result = v4 == v5;
  if (v4 && !v5)
  {
    if (v4 == 1)
    {
      v7 = off_1E8D81F28;
    }
    else
    {
      if (v4 != 2)
      {
        v8 = 0;
        goto LABEL_9;
      }
      v7 = off_1E8D81F30;
    }
    v8 = objc_alloc_init(*v7);
    objc_msgSend(v8, "setDraggingDestinationDelegate:", self);
LABEL_9:
    -[SBIconListViewDraggingDestinationDelegate setCurrentPolicyHandler:](self, "setCurrentPolicyHandler:", v8);
    -[SBIconListViewDraggingDestinationDelegate setCurrentDragType:](self, "setCurrentDragType:", v4);

    return 1;
  }
  return result;
}

- (BOOL)updateSpringLoadedPolicyHandlerForDropSession:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  BOOL result;
  __objc2_class **v7;
  id v8;

  v4 = -[SBIconListViewDraggingDestinationDelegate dragTypeForDropSession:](self, "dragTypeForDropSession:", a3);
  v5 = -[SBIconListViewDraggingDestinationDelegate currentSpringLoadedDragType](self, "currentSpringLoadedDragType");
  result = v4 == v5;
  if (v4 && !v5)
  {
    if (v4 == 1)
    {
      v7 = off_1E8D81F28;
    }
    else
    {
      if (v4 != 2)
      {
        v8 = 0;
        goto LABEL_9;
      }
      v7 = off_1E8D81F30;
    }
    v8 = objc_alloc_init(*v7);
    objc_msgSend(v8, "setDraggingDestinationDelegate:", self);
LABEL_9:
    -[SBIconListViewDraggingDestinationDelegate setSpringLoadingPolicyHandler:](self, "setSpringLoadingPolicyHandler:", v8);
    -[SBIconListViewDraggingDestinationDelegate setCurrentSpringLoadedDragType:](self, "setCurrentSpringLoadedDragType:", v4);

    return 1;
  }
  return result;
}

- (NSString)description
{
  return (NSString *)-[SBIconListViewDraggingDestinationDelegate descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)targetItemForSpringLoadingInteractionInView:(id)a3 atLocation:(CGPoint)a4 forDropSession:(id)a5
{
  double y;
  double x;
  id v9;
  id v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  BOOL v16;
  void *v17;

  y = a4.y;
  x = a4.x;
  v9 = a5;
  v10 = a3;
  v11 = -[SBIconListViewDraggingDestinationDelegate updateSpringLoadedPolicyHandlerForDropSession:](self, "updateSpringLoadedPolicyHandlerForDropSession:", v9);
  -[SBIconListViewDraggingDestinationDelegate springLoadingPolicyHandler](self, "springLoadingPolicyHandler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  SBFSafeCast();
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v13, "isDragSpringloadingEnabled"))
    goto LABEL_12;
  objc_msgSend(v13, "iconAtPoint:index:", 0, x, y);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v12, "dragHitRegionForDropSession:iconListView:point:icon:", v9, v13, v14, x, y) & 2;
  if (v14)
    v16 = v15 == 0;
  else
    v16 = 1;
  if (v16)
  {
LABEL_11:

LABEL_12:
    v17 = 0;
    goto LABEL_13;
  }
  objc_msgSend(v13, "iconViewForIcon:", v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    if (objc_msgSend(v12, "allowsSpringLoadForSession:onIconView:", v9, v17))
    {
      if (v11)
        goto LABEL_14;
      goto LABEL_13;
    }
    v14 = v17;
    goto LABEL_11;
  }
LABEL_13:
  -[SBIconListViewDraggingDestinationDelegate _resetSpringLoadingPolicyHandler](self, "_resetSpringLoadingPolicyHandler");
LABEL_14:

  return v17;
}

- (id)targetViewForSpringLoadingEffectForView:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  objc_opt_class();
  SBFSafeCast();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "_iconImageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(v4, "customIconImageViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v6, "springLoadingEffectTargetView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }

  }
  return v5;
}

- (void)_handleSpringloadAndComplete:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_opt_class();
  objc_msgSend(v4, "targetItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  SBFSafeCast();
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[SBIconListViewDraggingDestinationDelegate springLoadingPolicyHandler](self, "springLoadingPolicyHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleSpringLoadOnIconView:", v7);

}

- (void)_resetSpringLoadingPolicyHandler
{
  -[SBIconListViewDraggingDestinationDelegate setSpringLoadingPolicyHandler:](self, "setSpringLoadingPolicyHandler:", 0);
  -[SBIconListViewDraggingDestinationDelegate setCurrentSpringLoadedDragType:](self, "setCurrentSpringLoadedDragType:", 0);
}

- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  BOOL v10;
  _BOOL4 v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  -[SBIconListViewDraggingDestinationDelegate iconListView](self, "iconListView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "contentVisibility");

  if (v9)
  {
    v10 = 0;
  }
  else
  {
    v11 = -[SBIconListViewDraggingDestinationDelegate updateCurrentPolicyHandlerForDropSession:](self, "updateCurrentPolicyHandlerForDropSession:", v7);
    -[SBIconListViewDraggingDestinationDelegate currentPolicyHandler](self, "currentPolicyHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11
      && ((objc_opt_respondsToSelector() & 1) == 0
       || (objc_msgSend(v12, "dropInteraction:canHandleSession:", v6, v7) & 1) != 0))
    {
      v10 = 1;
    }
    else
    {
      -[SBIconListViewDraggingDestinationDelegate setCurrentPolicyHandler:](self, "setCurrentPolicyHandler:", 0);
      -[SBIconListViewDraggingDestinationDelegate setCurrentDragType:](self, "setCurrentDragType:", 0);
      v10 = 0;
    }

  }
  return v10;
}

- (void)dropInteraction:(id)a3 sessionDidEnter:(id)a4
{
  id v6;
  void *v7;
  NSMutableSet *activeDropSessionIdentifiers;
  NSMutableSet *v9;
  NSMutableSet *v10;
  NSMapTable *v11;
  NSMapTable *dragObservers;
  void *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  -[SBIconListViewDraggingDestinationDelegate uniqueIdentifierForDropSession:](self, "uniqueIdentifierForDropSession:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    activeDropSessionIdentifiers = self->_activeDropSessionIdentifiers;
    if (!activeDropSessionIdentifiers)
    {
      v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
      v10 = self->_activeDropSessionIdentifiers;
      self->_activeDropSessionIdentifiers = v9;

      activeDropSessionIdentifiers = self->_activeDropSessionIdentifiers;
    }
    -[NSMutableSet addObject:](activeDropSessionIdentifiers, "addObject:", v7);
  }
  if (!self->_dragObservers)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v11 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    dragObservers = self->_dragObservers;
    self->_dragObservers = v11;

  }
  -[SBIconListViewDraggingDestinationDelegate currentPolicyHandler](self, "currentPolicyHandler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v13, "dropInteraction:sessionDidEnter:", v14, v6);

}

- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  -[SBIconListViewDraggingDestinationDelegate currentPolicyHandler](self, "currentPolicyHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v8, "dropInteraction:sessionDidUpdate:", v6, v7);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3788]), "initWithDropOperation:", 0);
  }
  v10 = (void *)v9;

  return v10;
}

- (void)dropInteraction:(id)a3 sessionDidExit:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[SBIconListViewDraggingDestinationDelegate currentPolicyHandler](self, "currentPolicyHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "dropInteraction:sessionDidExit:", v8, v6);

}

- (void)dropInteraction:(id)a3 performDrop:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[SBIconListViewDraggingDestinationDelegate currentPolicyHandler](self, "currentPolicyHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "dropInteraction:performDrop:", v8, v6);
  -[SBIconListViewDraggingDestinationDelegate markDropSessionAsWaitingForConcludeDrop:](self, "markDropSessionAsWaitingForConcludeDrop:", v6);

}

- (void)dropInteraction:(id)a3 concludeDrop:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  -[SBIconListViewDraggingDestinationDelegate currentPolicyHandler](self, "currentPolicyHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v8, "dropInteraction:concludeDrop:", v6, v7);
  -[SBIconListViewDraggingDestinationDelegate iconListView](self, "iconListView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __74__SBIconListViewDraggingDestinationDelegate_dropInteraction_concludeDrop___block_invoke;
  v15 = &unk_1E8D8C3C0;
  v10 = v9;
  v16 = v10;
  v11 = v7;
  v17 = v11;
  -[SBIconListViewDraggingDestinationDelegate enumerateDragObserversForDropSession:usingBlock:](self, "enumerateDragObserversForDropSession:usingBlock:", v11, &v12);
  -[SBIconListViewDraggingDestinationDelegate removeAllDragObserversForDropSession:](self, "removeAllDragObserversForDropSession:", v11, v12, v13, v14, v15);
  -[SBIconListViewDraggingDestinationDelegate unmarkDropSessionAsWaitingForConcludeDrop:](self, "unmarkDropSessionAsWaitingForConcludeDrop:", v11);
  if (!-[NSMutableSet count](self->_activeDropSessionIdentifiers, "count"))
  {
    -[SBIconListViewDraggingDestinationDelegate setCurrentPolicyHandler:](self, "setCurrentPolicyHandler:", 0);
    -[SBIconListViewDraggingDestinationDelegate setCurrentDragType:](self, "setCurrentDragType:", 0);
  }

}

uint64_t __74__SBIconListViewDraggingDestinationDelegate_dropInteraction_concludeDrop___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "iconListView:concludeIconDrop:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)dropInteraction:(id)a3 sessionDidEnd:(id)a4
{
  id v6;
  id v7;
  void *v8;
  BOOL v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, void *);
  void *v18;
  id v19;
  id v20;

  v6 = a3;
  v7 = a4;
  -[SBIconListViewDraggingDestinationDelegate currentPolicyHandler](self, "currentPolicyHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v8, "dropInteraction:sessionDidEnd:", v6, v7);
  v9 = -[SBIconListViewDraggingDestinationDelegate isDropSessionWaitingForConcludeDrop:](self, "isDropSessionWaitingForConcludeDrop:", v7);
  -[SBIconListViewDraggingDestinationDelegate iconListView](self, "iconListView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __75__SBIconListViewDraggingDestinationDelegate_dropInteraction_sessionDidEnd___block_invoke;
  v18 = &unk_1E8D8C3C0;
  v11 = v10;
  v19 = v11;
  v12 = v7;
  v20 = v12;
  -[SBIconListViewDraggingDestinationDelegate enumerateDragObserversForDropSession:usingBlock:](self, "enumerateDragObserversForDropSession:usingBlock:", v12, &v15);
  if (!v9)
    -[SBIconListViewDraggingDestinationDelegate removeAllDragObserversForDropSession:](self, "removeAllDragObserversForDropSession:", v12, v15, v16, v17, v18, v19);
  -[SBIconListViewDraggingDestinationDelegate uniqueIdentifierForDropSession:](self, "uniqueIdentifierForDropSession:", v12, v15, v16, v17, v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    -[NSMutableSet removeObject:](self->_activeDropSessionIdentifiers, "removeObject:", v13);
  if (-[NSMutableSet count](self->_activeDropSessionIdentifiers, "count"))
    v14 = 1;
  else
    v14 = v9;
  if ((v14 & 1) == 0)
    -[SBIconListViewDraggingDestinationDelegate setCurrentPolicyHandler:](self, "setCurrentPolicyHandler:", 0);
  -[SBIconListViewDraggingDestinationDelegate setCurrentDragType:](self, "setCurrentDragType:", 0);

}

uint64_t __75__SBIconListViewDraggingDestinationDelegate_dropInteraction_sessionDidEnd___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "iconListView:iconDropSessionDidEnd:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (id)dropInteraction:(id)a3 previewForDroppingItem:(id)a4 withDefault:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[SBIconListViewDraggingDestinationDelegate currentPolicyHandler](self, "currentPolicyHandler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v10;
  v13 = v12;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v11, "dropInteraction:previewForDroppingItem:withDefault:", v8, v9, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v13, "set_springboardPlatterStyle:", 1);

  return v13;
}

- (void)dropInteraction:(id)a3 item:(id)a4 willAnimateDropWithAnimator:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = a5;
  -[SBIconListViewDraggingDestinationDelegate currentPolicyHandler](self, "currentPolicyHandler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v10, "dropInteraction:item:willAnimateDropWithAnimator:", v11, v8, v9);

}

- (id)_dropInteraction:(id)a3 customSpringAnimationBehaviorForDroppingItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  -[SBIconListViewDraggingDestinationDelegate currentPolicyHandler](self, "currentPolicyHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v8, "_dropInteraction:customSpringAnimationBehaviorForDroppingItem:", v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBIconListViewDraggingDestinationDelegate succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBIconListViewDraggingDestinationDelegate descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  -[SBIconListViewDraggingDestinationDelegate succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconListViewDraggingDestinationDelegate dropInteraction](self, "dropInteraction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v4, "appendObject:withName:", v5, CFSTR("dropInteraction"));

  v7 = (id)objc_msgSend(v4, "appendInteger:withName:", -[SBIconListViewDraggingDestinationDelegate currentDragType](self, "currentDragType"), CFSTR("currentDragType"));
  -[SBIconListViewDraggingDestinationDelegate currentPolicyHandler](self, "currentPolicyHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v4, "appendObject:withName:", v8, CFSTR("currentPolicyHandler"));

  -[SBIconListViewDraggingDestinationDelegate springLoadingPolicyHandler](self, "springLoadingPolicyHandler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v4, "appendObject:withName:", v10, CFSTR("springLoadingPolicyHandler"));

  return v4;
}

- (SBIconListView)iconListView
{
  return (SBIconListView *)objc_loadWeakRetained((id *)&self->_iconListView);
}

- (UIDropInteraction)dropInteraction
{
  return self->_dropInteraction;
}

- (unint64_t)currentDragType
{
  return self->_currentDragType;
}

- (void)setCurrentDragType:(unint64_t)a3
{
  self->_currentDragType = a3;
}

- (SBIconListViewDraggingPolicyHandling)currentPolicyHandler
{
  return self->_currentPolicyHandler;
}

- (void)setCurrentPolicyHandler:(id)a3
{
  objc_storeStrong((id *)&self->_currentPolicyHandler, a3);
}

- (unint64_t)currentSpringLoadedDragType
{
  return self->_currentSpringLoadedDragType;
}

- (void)setCurrentSpringLoadedDragType:(unint64_t)a3
{
  self->_currentSpringLoadedDragType = a3;
}

- (SBIconListViewDraggingPolicyHandling)springLoadingPolicyHandler
{
  return self->_springLoadingPolicyHandler;
}

- (void)setSpringLoadingPolicyHandler:(id)a3
{
  objc_storeStrong((id *)&self->_springLoadingPolicyHandler, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_springLoadingPolicyHandler, 0);
  objc_storeStrong((id *)&self->_currentPolicyHandler, 0);
  objc_storeStrong((id *)&self->_dropInteraction, 0);
  objc_destroyWeak((id *)&self->_iconListView);
  objc_storeStrong((id *)&self->_dropSessionIdentifiersWaitingForConcludeDrop, 0);
  objc_storeStrong((id *)&self->_activeDropSessionIdentifiers, 0);
  objc_storeStrong((id *)&self->_dragObservers, 0);
}

@end
