@implementation _UIFloatingTabBarDragController

- (_UIFloatingTabBarDragController)initWithDelegate:(id)a3 view:(id)a4
{
  id v6;
  id v7;
  _UIFloatingTabBarDragController *v8;
  _UIFloatingTabBarDragController *v9;
  UIDragInteraction *v10;
  UIDragInteraction *dragInteraction;
  UIDropInteraction *v12;
  UIDropInteraction *dropInteraction;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)_UIFloatingTabBarDragController;
  v8 = -[_UIFloatingTabBarDragController init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    v10 = -[UIDragInteraction initWithDelegate:]([UIDragInteraction alloc], "initWithDelegate:", v9);
    dragInteraction = v9->_dragInteraction;
    v9->_dragInteraction = v10;

    objc_msgSend(v7, "addInteraction:", v9->_dragInteraction);
    v12 = -[UIDropInteraction initWithDelegate:]([UIDropInteraction alloc], "initWithDelegate:", v9);
    dropInteraction = v9->_dropInteraction;
    v9->_dropInteraction = v12;

    objc_msgSend(v7, "addInteraction:", v9->_dropInteraction);
  }

  return v9;
}

- (void)beginEditingWithFavoriteOrder:(id)a3 excludedItems:(id)a4
{
  void *v6;
  id v7;
  NSMutableOrderedSet *v8;
  NSMutableOrderedSet *pendingFavoriteOrder;
  NSMutableSet *v10;
  NSMutableSet *pendingExcludedItems;

  self->_editing = 1;
  v6 = (void *)MEMORY[0x1E0C99E10];
  v7 = a4;
  objc_msgSend(v6, "orderedSetWithOrderedSet:", a3);
  v8 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue();
  pendingFavoriteOrder = self->_pendingFavoriteOrder;
  self->_pendingFavoriteOrder = v8;

  objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v7);
  v10 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();

  pendingExcludedItems = self->_pendingExcludedItems;
  self->_pendingExcludedItems = v10;

}

- (void)resetFavoriteOrderWithDefaultOrder:(id)a3
{
  NSMutableOrderedSet *v4;
  NSMutableOrderedSet *pendingFavoriteOrder;
  NSMutableSet *v6;
  NSMutableSet *pendingExcludedItems;

  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithOrderedSet:", a3);
  v4 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue();
  pendingFavoriteOrder = self->_pendingFavoriteOrder;
  self->_pendingFavoriteOrder = v4;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v6 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
  pendingExcludedItems = self->_pendingExcludedItems;
  self->_pendingExcludedItems = v6;

  -[UIDragInteraction setEnabled:](self->_dragInteraction, "setEnabled:", 0);
  -[UIDragInteraction setEnabled:](self->_dragInteraction, "setEnabled:", 1);
}

- (void)endEditing
{
  NSMutableOrderedSet *pendingFavoriteOrder;
  NSMutableSet *pendingExcludedItems;

  self->_editing = 0;
  pendingFavoriteOrder = self->_pendingFavoriteOrder;
  self->_pendingFavoriteOrder = 0;

  pendingExcludedItems = self->_pendingExcludedItems;
  self->_pendingExcludedItems = 0;

  -[_UIFloatingTabBarDragController _removePlaceholder](self, "_removePlaceholder");
}

- (void)removeTabForIdentifier:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[NSMutableOrderedSet containsObject:](self->_pendingFavoriteOrder, "containsObject:"))
  {
    -[NSMutableOrderedSet removeObject:](self->_pendingFavoriteOrder, "removeObject:", v5);
    -[_UIFloatingTabBarDragController delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "tabDragController:updateFavoriteOrderAnimated:", self, 1);

  }
}

- (BOOL)hasActiveDrag
{
  void *v2;
  BOOL v3;

  -[_UIFloatingTabBarDragController currentDragTab](self, "currentDragTab");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)excludedItems
{
  return self->_pendingExcludedItems;
}

- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  UIDragItem *v10;
  void *v11;
  void *v12;

  v5 = a4;
  if (-[_UIFloatingTabBarDragController isEditing](self, "isEditing"))
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[_UIFloatingTabBarDragController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "tabDragController:tabForBeginningSession:", self, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = objc_alloc_init(MEMORY[0x1E0CB36C8]);
      v10 = -[UIDragItem initWithItemProvider:]([UIDragItem alloc], "initWithItemProvider:", v9);
      -[UIDragItem setLocalObject:](v10, "setLocalObject:", v8);
      objc_msgSend(v6, "addObject:", v10);
      -[_UIFloatingTabBarDragController setCurrentDragTab:](self, "setCurrentDragTab:", v8);
      -[_UIFloatingTabBarDragController pendingFavoriteOrder](self, "pendingFavoriteOrder");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIFloatingTabBarDragController setCurrentDragTabOriginalIndex:](self, "setCurrentDragTabOriginalIndex:", objc_msgSend(v11, "indexOfObject:", v12));

    }
  }
  else
  {
    v6 = (id)MEMORY[0x1E0C9AA60];
  }

  return v6;
}

- (void)dragInteraction:(id)a3 willAnimateLiftWithAnimator:(id)a4 session:(id)a5
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __87___UIFloatingTabBarDragController_dragInteraction_willAnimateLiftWithAnimator_session___block_invoke;
  v5[3] = &unk_1E16B42D0;
  v5[4] = self;
  objc_msgSend(a4, "addCompletion:", v5);
}

- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5
{
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a4, "localObject", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIFloatingTabBarDragController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tabDragController:previewForLiftingTab:", self, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)dragInteraction:(id)a3 previewForCancellingItem:(id)a4 withDefault:(id)a5
{
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  objc_msgSend(a4, "localObject", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIFloatingTabBarDragController currentDragTab](self, "currentDragTab");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 == v7)
  {
    v8 = objc_msgSend(v6, "_tabPlacement");

    if (v8 != 3)
    {
      v10 = 0;
      goto LABEL_6;
    }
  }
  else
  {

  }
  -[_UIFloatingTabBarDragController delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "tabDragController:previewForCancellingTab:", self, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
  return v10;
}

- (void)dragInteraction:(id)a3 session:(id)a4 willEndWithOperation:(unint64_t)a5
{
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  -[_UIFloatingTabBarDragController currentDragTab](self, "currentDragTab", a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "_tabPlacement");

  if (!a5 && v8 == 3)
  {
    -[_UIFloatingTabBarDragController currentDragTab](self, "currentDragTab");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v12 = (id)objc_claimAutoreleasedReturnValue();

    -[_UIFloatingTabBarDragController pendingExcludedItems](self, "pendingExcludedItems");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObject:", v12);

    -[_UIFloatingTabBarDragController pendingFavoriteOrder](self, "pendingFavoriteOrder");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "insertObject:atIndex:", v12, -[_UIFloatingTabBarDragController currentDragTabOriginalIndex](self, "currentDragTabOriginalIndex"));

    -[_UIFloatingTabBarDragController _updateFavoriteOrderAnimated:](self, "_updateFavoriteOrderAnimated:", 1);
  }
}

- (void)dragInteraction:(id)a3 session:(id)a4 didEndWithOperation:(unint64_t)a5
{
  -[_UIFloatingTabBarDragController setCurrentDragTab:](self, "setCurrentDragTab:", 0, a4, a5);
}

- (BOOL)dragInteraction:(id)a3 sessionAllowsMoveOperation:(id)a4
{
  return 1;
}

- (double)_dragInteraction:(id)a3 delayForLiftBeginningAtLocation:(CGPoint)a4
{
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  double v8;

  -[_UIFloatingTabBarDragController delegate](self, "delegate", a3, a4.x, a4.y);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "pages");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7 <= 1)
    v8 = 0.0;
  else
    v8 = 0.15;

  return v8;
}

- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char isKindOfClass;
  char v11;

  v5 = a4;
  if (-[_UIFloatingTabBarDragController isEditing](self, "isEditing"))
  {
    objc_msgSend(v5, "items");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "items");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "count") == 1)
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
        v11 = 0;
        goto LABEL_9;
      }
      -[_UIFloatingTabBarDragController delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "tabDragController:canHandleDropSessionForTab:", self, v8);
    }
    else
    {
      v11 = 0;
    }

LABEL_9:
    goto LABEL_10;
  }
  v11 = 1;
LABEL_10:

  return v11;
}

- (void)dropInteraction:(id)a3 sessionDidEnter:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  id obj;

  obj = a4;
  if (-[_UIFloatingTabBarDragController isEditing](self, "isEditing"))
  {
    objc_storeWeak((id *)&self->_activeDropSession, obj);
    objc_msgSend(obj, "items");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UIFloatingTabBarDragController setPendingDropTab:](self, "setPendingDropTab:", v7);
  }

}

- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v12;

  v5 = a4;
  -[_UIFloatingTabBarDragController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "tabDragController:dropProposalForSession:", self, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIFloatingTabBarDragController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "tabDragController:destinationIndexPathForDropSession:", self, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[_UIFloatingTabBarDragController isEditing](self, "isEditing") && objc_msgSend(v7, "operation") == 3)
  {
    -[_UIFloatingTabBarDragController setPendingDropTabHasValidTarget:](self, "setPendingDropTabHasValidTarget:", 1);
    if (-[_UIFloatingTabBarDragController _shouldAddPlaceholderForPendingDrop](self, "_shouldAddPlaceholderForPendingDrop"))
    {
      if (v9)
      {
        v10 = objc_msgSend(v9, "item");
      }
      else
      {
        -[_UIFloatingTabBarDragController pendingFavoriteOrder](self, "pendingFavoriteOrder");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v12, "count");

      }
      -[_UIFloatingTabBarDragController _insertPlaceholderAtIndex:](self, "_insertPlaceholderAtIndex:", v10);
    }
  }
  else
  {
    -[_UIFloatingTabBarDragController setPendingDropTabHasValidTarget:](self, "setPendingDropTabHasValidTarget:", 0);
    -[_UIFloatingTabBarDragController _removePlaceholder](self, "_removePlaceholder");
  }

  return v7;
}

- (void)dropInteraction:(id)a3 sessionDidExit:(id)a4
{
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a4;
  v5 = -[_UIFloatingTabBarDragController isEditing](self, "isEditing");
  v6 = v11;
  if (v5)
  {
    objc_msgSend(v11, "items");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UIFloatingTabBarDragController pendingDropTab](self, "pendingDropTab");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9 == v10)
    {
      -[_UIFloatingTabBarDragController _removePlaceholder](self, "_removePlaceholder");
      -[_UIFloatingTabBarDragController setPendingDropTab:](self, "setPendingDropTab:", 0);
    }

    v6 = v11;
  }

}

- (void)dropInteraction:(id)a3 sessionDidEnd:(id)a4
{
  UIDropSession **p_activeDropSession;
  id v6;
  id WeakRetained;

  p_activeDropSession = &self->_activeDropSession;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_activeDropSession);

  if (WeakRetained == v6)
  {
    -[_UIFloatingTabBarDragController setPendingDropTab:](self, "setPendingDropTab:", 0);
    -[_UIFloatingTabBarDragController setPendingDropTabHasValidTarget:](self, "setPendingDropTabHasValidTarget:", 0);
    objc_storeWeak((id *)p_activeDropSession, 0);
  }
}

- (void)dropInteraction:(id)a3 performDrop:(id)a4
{
  id v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v5 = a4;
  v6 = -[_UIFloatingTabBarDragController isEditing](self, "isEditing");
  -[_UIFloatingTabBarDragController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    objc_msgSend(v7, "tabDragController:destinationIndexPathForDropSession:", self, v5);
    v21 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "items");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localObject");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    -[_UIFloatingTabBarDragController pendingFavoriteOrder](self, "pendingFavoriteOrder");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "indexOfObject:", v12);

    if (v13 != 0x7FFFFFFFFFFFFFFFLL)
    {
      -[_UIFloatingTabBarDragController pendingFavoriteOrder](self, "pendingFavoriteOrder");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "removeObjectAtIndex:", v13);

    }
    if (v21)
    {
      v15 = objc_msgSend(v21, "item");
    }
    else
    {
      -[_UIFloatingTabBarDragController pendingFavoriteOrder](self, "pendingFavoriteOrder");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v16, "count");

    }
    -[_UIFloatingTabBarDragController pendingFavoriteOrder](self, "pendingFavoriteOrder");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "insertObject:atIndex:", v18, v15);

    -[_UIFloatingTabBarDragController pendingExcludedItems](self, "pendingExcludedItems");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "removeObject:", v20);

    -[_UIFloatingTabBarDragController setPendingDropTab:](self, "setPendingDropTab:", 0);
  }
  else
  {
    objc_msgSend(v7, "tabDragController:acceptItemsIntoTabFromDropSession:", self, v5);
    v21 = v8;
  }

}

- (id)dropInteraction:(id)a3 previewForDroppingItem:(id)a4 withDefault:(id)a5
{
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  if (-[_UIFloatingTabBarDragController isEditing](self, "isEditing")
    || (WeakRetained = objc_loadWeakRetained((id *)&self->_activeDropItem),
        WeakRetained,
        WeakRetained == v6))
  {
    objc_msgSend(v6, "localObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIFloatingTabBarDragController delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "tabDragController:previewForInsertingTab:", self, v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)dropInteraction:(id)a3 item:(id)a4 willAnimateDropWithAnimator:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[_UIFloatingTabBarDragController isEditing](self, "isEditing"))
  {
    objc_storeWeak((id *)&self->_activeDropItem, v9);
    objc_initWeak(&location, self);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __84___UIFloatingTabBarDragController_dropInteraction_item_willAnimateDropWithAnimator___block_invoke;
    v11[3] = &unk_1E16B42F8;
    objc_copyWeak(&v12, &location);
    objc_msgSend(v10, "addCompletion:", v11);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

}

- (void)setPendingDropTab:(id)a3
{
  UITab *v5;
  void *v6;
  UITab *v7;

  v5 = (UITab *)a3;
  if (self->_pendingDropTab != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_pendingDropTab, a3);
    -[_UIFloatingTabBarDragController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "tabDragController:pendingDropTabDidChange:", self, v7);

    v5 = v7;
    if (!v7)
    {
      -[_UIFloatingTabBarDragController _removePlaceholder](self, "_removePlaceholder");
      v5 = 0;
    }
  }

}

- (BOOL)_shouldAddPlaceholderForPendingDrop
{
  void *v3;
  void *v4;
  void *v5;
  int v6;

  -[_UIFloatingTabBarDragController pendingDropTab](self, "pendingDropTab");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && -[_UIFloatingTabBarDragController pendingDropTabHasValidTarget](self, "pendingDropTabHasValidTarget"))
  {
    -[_UIFloatingTabBarDragController delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIFloatingTabBarDragController pendingDropTab](self, "pendingDropTab");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "tabDragController:isDisplayingTab:", self, v5) ^ 1;

  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (void)_insertPlaceholderAtIndex:(int64_t)a3
{
  void *v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v13;
  void *v14;

  -[_UIFloatingTabBarDragController pendingFavoriteOrder](self, "pendingFavoriteOrder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", CFSTR("com.apple.UIKit.TabBar.Placeholder"));

  -[_UIFloatingTabBarDragController pendingDropTab](self, "pendingDropTab");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[_UIFloatingTabBarDragController pendingFavoriteOrder](self, "pendingFavoriteOrder");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIFloatingTabBarDragController pendingDropTab](self, "pendingDropTab");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v8, "indexOfObject:", v10);

    if (v11 != 0x7FFFFFFFFFFFFFFFLL && v11 < a3)
      ++a3;
  }
  if (v6 != a3)
  {
    if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    {
      a3 -= v6 < a3;
      if (v6 == a3)
        return;
      -[_UIFloatingTabBarDragController pendingFavoriteOrder](self, "pendingFavoriteOrder");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "removeObjectAtIndex:", v6);

    }
    -[_UIFloatingTabBarDragController pendingFavoriteOrder](self, "pendingFavoriteOrder");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "insertObject:atIndex:", CFSTR("com.apple.UIKit.TabBar.Placeholder"), a3);

    -[_UIFloatingTabBarDragController _updateFavoriteOrderAnimated:](self, "_updateFavoriteOrderAnimated:", 1);
  }
}

- (void)_removePlaceholder
{
  void *v3;
  int v4;
  void *v5;

  -[_UIFloatingTabBarDragController pendingFavoriteOrder](self, "pendingFavoriteOrder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", CFSTR("com.apple.UIKit.TabBar.Placeholder"));

  if (v4)
  {
    -[_UIFloatingTabBarDragController pendingFavoriteOrder](self, "pendingFavoriteOrder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObject:", CFSTR("com.apple.UIKit.TabBar.Placeholder"));

    -[_UIFloatingTabBarDragController _updateFavoriteOrderAnimated:](self, "_updateFavoriteOrderAnimated:", 1);
  }
}

- (void)_updateFavoriteOrderAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  -[_UIFloatingTabBarDragController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tabDragController:updateFavoriteOrderAnimated:", self, v3);

  self->_needsFavoriteOrderUpdate = 0;
}

- (_UIFloatingTabBarDragControllerDelegate)delegate
{
  return (_UIFloatingTabBarDragControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)isEditing
{
  return self->_editing;
}

- (UITab)pendingDropTab
{
  return self->_pendingDropTab;
}

- (UIDragItem)activeDropItem
{
  return (UIDragItem *)objc_loadWeakRetained((id *)&self->_activeDropItem);
}

- (UIDragInteraction)dragInteraction
{
  return self->_dragInteraction;
}

- (UIDropInteraction)dropInteraction
{
  return self->_dropInteraction;
}

- (UITab)currentDragTab
{
  return self->_currentDragTab;
}

- (void)setCurrentDragTab:(id)a3
{
  objc_storeStrong((id *)&self->_currentDragTab, a3);
}

- (int64_t)currentDragTabOriginalIndex
{
  return self->_currentDragTabOriginalIndex;
}

- (void)setCurrentDragTabOriginalIndex:(int64_t)a3
{
  self->_currentDragTabOriginalIndex = a3;
}

- (UIDropSession)activeDropSession
{
  return (UIDropSession *)objc_loadWeakRetained((id *)&self->_activeDropSession);
}

- (void)setActiveDropSession:(id)a3
{
  objc_storeWeak((id *)&self->_activeDropSession, a3);
}

- (BOOL)pendingDropTabHasValidTarget
{
  return self->_pendingDropTabHasValidTarget;
}

- (void)setPendingDropTabHasValidTarget:(BOOL)a3
{
  self->_pendingDropTabHasValidTarget = a3;
}

- (NSMutableOrderedSet)pendingFavoriteOrder
{
  return self->_pendingFavoriteOrder;
}

- (void)setPendingFavoriteOrder:(id)a3
{
  objc_storeStrong((id *)&self->_pendingFavoriteOrder, a3);
}

- (NSMutableSet)pendingExcludedItems
{
  return self->_pendingExcludedItems;
}

- (void)setPendingExcludedItems:(id)a3
{
  objc_storeStrong((id *)&self->_pendingExcludedItems, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingExcludedItems, 0);
  objc_storeStrong((id *)&self->_pendingFavoriteOrder, 0);
  objc_destroyWeak((id *)&self->_activeDropSession);
  objc_storeStrong((id *)&self->_currentDragTab, 0);
  objc_storeStrong((id *)&self->_dropInteraction, 0);
  objc_storeStrong((id *)&self->_dragInteraction, 0);
  objc_destroyWeak((id *)&self->_activeDropItem);
  objc_storeStrong((id *)&self->_pendingDropTab, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
