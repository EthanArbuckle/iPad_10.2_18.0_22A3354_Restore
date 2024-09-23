@implementation _UITableViewDragController

- (NSMutableOrderedSet)indexPaths
{
  return self->_indexPaths;
}

- (void)updateDragInteractionEnabledState
{
  _BOOL4 v3;
  uint64_t v4;
  int64_t v5;
  unsigned int v6;
  id v7;

  v3 = +[UIDragInteraction isEnabledByDefault](UIDragInteraction, "isEnabledByDefault");
  if (-[_UITableViewDragController forceEnabledForReordering](self, "forceEnabledForReordering"))
  {
    v4 = 1;
  }
  else
  {
    v5 = -[_UITableViewDragController clientEnabledState](self, "clientEnabledState");
    v6 = v5 == 1 || v3;
    if (v5 == 2)
      v4 = 0;
    else
      v4 = v6;
  }
  -[_UITableViewDragController dragInteraction](self, "dragInteraction");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEnabled:", v4);

}

- (BOOL)forceEnabledForReordering
{
  return self->_forceEnabledForReordering;
}

- (UIDragInteraction)dragInteraction
{
  return self->_dragInteraction;
}

- (void)forceReset
{
  void *v3;
  uint64_t v4;

  -[_UITableViewDragController indexPaths](self, "indexPaths");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
    -[_UITableViewDragController resetDragState](self, "resetDragState");
}

+ (BOOL)isEnabledByDefault
{
  return +[UIDragInteraction isEnabledByDefault](UIDragInteraction, "isEnabledByDefault");
}

- (void)setForceEnabledForReordering:(BOOL)a3
{
  self->_forceEnabledForReordering = a3;
  -[_UITableViewDragController updateDragInteractionEnabledState](self, "updateDragInteractionEnabledState");
}

- (void)setClientEnabledState:(int64_t)a3
{
  self->_clientEnabledState = a3;
  -[_UITableViewDragController updateDragInteractionEnabledState](self, "updateDragInteractionEnabledState");
}

- (_UITableViewDragController)initWithTableView:(id)a3
{
  id v5;
  _UITableViewDragController *v6;
  _UITableViewDragController *v7;
  uint64_t v8;
  NSMutableOrderedSet *indexPaths;
  uint64_t v10;
  NSMutableOrderedSet *tentativeIndexPaths;
  uint64_t v12;
  NSMapTable *cellsAnimatingCancel;
  void *v15;
  objc_super v16;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITableViewDragController.m"), 60, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("tableView != nil"));

  }
  v16.receiver = self;
  v16.super_class = (Class)_UITableViewDragController;
  v6 = -[_UITableViewDragController init](&v16, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeWeak((id *)&v6->_tableView, v5);
    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
    v8 = objc_claimAutoreleasedReturnValue();
    indexPaths = v7->_indexPaths;
    v7->_indexPaths = (NSMutableOrderedSet *)v8;

    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
    v10 = objc_claimAutoreleasedReturnValue();
    tentativeIndexPaths = v7->_tentativeIndexPaths;
    v7->_tentativeIndexPaths = (NSMutableOrderedSet *)v10;

    v7->_clientEnabledState = 0;
    v7->_forceEnabledForReordering = 0;
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v12 = objc_claimAutoreleasedReturnValue();
    cellsAnimatingCancel = v7->_cellsAnimatingCancel;
    v7->_cellsAnimatingCancel = (NSMapTable *)v12;

    -[_UITableViewDragController resetDragState](v7, "resetDragState");
    -[_UITableViewDragController setupDragInteraction](v7, "setupDragInteraction");
  }

  return v7;
}

- (void)setupDragInteraction
{
  void *v3;
  UIDragInteraction *v4;

  v4 = -[UIDragInteraction initWithDelegate:]([UIDragInteraction alloc], "initWithDelegate:", self);
  -[_UITableViewDragController setDragInteraction:](self, "setDragInteraction:", v4);
  -[_UITableViewDragController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addInteraction:", v4);

}

- (_UITableViewDragControllerDelegate)tableView
{
  return (_UITableViewDragControllerDelegate *)objc_loadWeakRetained((id *)&self->_tableView);
}

- (void)setDragInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_dragInteraction, a3);
}

- (void)resetDragState
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[_UITableViewDragController setInitiatingCell:](self, "setInitiatingCell:", 0);
  -[_UITableViewDragController setInitiatingIndexPath:](self, "setInitiatingIndexPath:", 0);
  -[NSMutableOrderedSet removeAllObjects](self->_indexPaths, "removeAllObjects");
  -[_UITableViewDragController dragSession](self, "dragSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UITableViewDragController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  v6 = v4;
  if (v5)
  {
    objc_opt_class();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    objc_msgSend(v5, "items", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          objc_msgSend(v12, "_privateLocalContext");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v13, "tableView");
              v14 = (id)objc_claimAutoreleasedReturnValue();

              if (v14 == v6)
                objc_msgSend(v12, "_setPrivateLocalContext:", 0);
            }
          }

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v9);
    }

  }
}

- (void)setInitiatingIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_initiatingIndexPath, a3);
}

- (void)setInitiatingCell:(id)a3
{
  objc_storeStrong((id *)&self->_initiatingCell, a3);
}

- (UIDragSession)dragSession
{
  return self->_dragSession;
}

- (void)uninstallFromTableView
{
  void *v3;
  id v4;

  -[_UITableViewDragController forceReset](self, "forceReset");
  -[_UITableViewDragController tableView](self, "tableView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[_UITableViewDragController dragInteraction](self, "dragInteraction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeInteraction:", v3);

}

- (BOOL)isActive
{
  void *v3;
  BOOL v4;
  void *v5;

  -[_UITableViewDragController indexPaths](self, "indexPaths");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = 1;
  }
  else
  {
    -[_UITableViewDragController dragSession](self, "dragSession");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5 != 0;

  }
  return v4;
}

- (UITableViewCell)draggedCell
{
  void *v3;
  uint64_t v4;
  void *v5;

  -[_UITableViewDragController indexPaths](self, "indexPaths");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 == 1)
  {
    -[_UITableViewDragController initiatingCell](self, "initiatingCell");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return (UITableViewCell *)v5;
}

- (NSIndexPath)draggedIndexPath
{
  void *v3;
  uint64_t v4;
  void *v5;

  -[_UITableViewDragController indexPaths](self, "indexPaths");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 == 1)
  {
    -[_UITableViewDragController initiatingIndexPath](self, "initiatingIndexPath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return (NSIndexPath *)v5;
}

- (void)immediatelyBeginDragWithTouch:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_UITableViewDragController dragInteraction](self, "dragInteraction");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_immediatelyBeginDragWithTouch:completion:", v4, 0);

}

- (BOOL)canProvideItemsForDragAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  char v10;
  BOOL v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  _QWORD v27[4];
  id v28;
  uint64_t *v29;
  double v30;
  double v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;

  y = a3.y;
  x = a3.x;
  -[_UITableViewDragController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__186;
  v36 = __Block_byref_object_dispose__186;
  v7 = MEMORY[0x1E0C809B0];
  v37 = 0;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __60___UITableViewDragController_canProvideItemsForDragAtPoint___block_invoke;
  v27[3] = &unk_1E16C6D18;
  v29 = &v32;
  v8 = v6;
  v28 = v8;
  v30 = x;
  v31 = y;
  objc_msgSend(v8, "_performUsingPresentationValues:", v27);
  if (v33[5]
    && (-[_UITableViewDragController indexPaths](self, "indexPaths"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "containsObject:", v33[5]),
        v9,
        (v10 & 1) == 0))
  {
    v21 = 0;
    v22 = &v21;
    v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__186;
    v25 = __Block_byref_object_dispose__186;
    v26 = 0;
    v17[0] = v7;
    v17[1] = 3221225472;
    v17[2] = __60___UITableViewDragController_canProvideItemsForDragAtPoint___block_invoke_2;
    v17[3] = &unk_1E16C3488;
    v19 = &v21;
    v12 = v8;
    v18 = v12;
    v20 = &v32;
    objc_msgSend(v12, "_performUsingPresentationValues:", v17);
    v13 = (void *)v22[5];
    if (v13
      && (objc_msgSend(v13, "isUserInteractionEnabled") & 1) != 0
      && (objc_msgSend(v12, "_canBeginDragAtPoint:indexPath:", v33[5], x, y) & 1) != 0)
    {
      -[_UITableViewDragController setTentativeInitiatingCell:](self, "setTentativeInitiatingCell:", v22[5]);
      -[_UITableViewDragController setTentativeInitiatingIndexPath:](self, "setTentativeInitiatingIndexPath:", v33[5]);
      -[_UITableViewDragController indexPaths](self, "indexPaths");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "count");

      if (!v15)
        -[_UITableViewDragController clearTentativeRows](self, "clearTentativeRows");
      v11 = 1;
    }
    else
    {
      v11 = 0;
    }

    _Block_object_dispose(&v21, 8);
  }
  else
  {
    v11 = 0;
  }

  _Block_object_dispose(&v32, 8);
  return v11;
}

- (void)addTentativeRowAtIndexPath:(id)a3
{
  -[NSMutableOrderedSet addObject:](self->_tentativeIndexPaths, "addObject:", a3);
}

- (void)clearTentativeRows
{
  -[NSMutableOrderedSet removeAllObjects](self->_tentativeIndexPaths, "removeAllObjects");
}

- (void)beginDragForTentativeRows
{
  void *v4;
  uint64_t v5;
  int has_internal_diagnostics;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unint64_t v22;
  NSObject *v23;
  unint64_t v24;
  NSObject *v25;
  uint8_t v26[16];
  uint8_t v27[16];
  uint8_t buf[16];
  uint8_t v29[16];

  -[_UITableViewDragController indexPaths](self, "indexPaths");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (!v5)
  {
    has_internal_diagnostics = os_variant_has_internal_diagnostics();
    -[_UITableViewDragController initiatingCell](self, "initiatingCell");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (has_internal_diagnostics)
    {
      if (v7)
      {
        __UIFaultDebugAssertLog();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)v29 = 0;
          _os_log_fault_impl(&dword_185066000, v16, OS_LOG_TYPE_FAULT, "There should not be a cell stored in the initiatingCell property if there are no index paths in the drag.", v29, 2u);
        }

      }
    }
    else if (v7)
    {
      v22 = _MergedGlobals_1240;
      if (!_MergedGlobals_1240)
      {
        v22 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v22, (unint64_t *)&_MergedGlobals_1240);
      }
      v23 = *(NSObject **)(v22 + 8);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_185066000, v23, OS_LOG_TYPE_ERROR, "There should not be a cell stored in the initiatingCell property if there are no index paths in the drag.", buf, 2u);
      }
    }
    v8 = os_variant_has_internal_diagnostics();
    -[_UITableViewDragController initiatingIndexPath](self, "initiatingIndexPath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      if (v9)
      {
        __UIFaultDebugAssertLog();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)v27 = 0;
          _os_log_fault_impl(&dword_185066000, v17, OS_LOG_TYPE_FAULT, "There should not be a cell stored in the initiatingIndexPath property if there are no index paths in the drag.", v27, 2u);
        }

      }
    }
    else if (v9)
    {
      v24 = qword_1ECD809B8;
      if (!qword_1ECD809B8)
      {
        v24 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v24, (unint64_t *)&qword_1ECD809B8);
      }
      v25 = *(NSObject **)(v24 + 8);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v26 = 0;
        _os_log_impl(&dword_185066000, v25, OS_LOG_TYPE_ERROR, "There should not be a cell stored in the initiatingIndexPath property if there are no index paths in the drag.", v26, 2u);
      }
    }
    -[_UITableViewDragController tentativeInitiatingCell](self, "tentativeInitiatingCell");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITableViewDragController tentativeInitiatingIndexPath](self, "tentativeInitiatingIndexPath");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (v10)
    {
      if (v11)
      {
LABEL_8:
        -[_UITableViewDragController setInitiatingCell:](self, "setInitiatingCell:", v10);
        -[_UITableViewDragController setInitiatingIndexPath:](self, "setInitiatingIndexPath:", v12);

        goto LABEL_9;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITableViewDragController.m"), 235, CFSTR("_UITableViewDragController internal inconsistency: initiatingCell cannot be nil in %@"), v19);

      if (v12)
        goto LABEL_8;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITableViewDragController.m"), 236, CFSTR("_UITableViewDragController internal inconsistency: initiatingIndexPath cannot be nil in %@"), v21);

    goto LABEL_8;
  }
LABEL_9:
  -[_UITableViewDragController tentativeIndexPaths](self, "tentativeIndexPaths");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v13, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITableViewDragController.m"), 241, CFSTR("_UITableViewDragController internal inconsistency: tentativeIndexPaths cannot be empty in %@"), v15);

  }
  -[NSMutableOrderedSet unionOrderedSet:](self->_indexPaths, "unionOrderedSet:", v13);
  -[_UITableViewDragController setTentativeInitiatingCell:](self, "setTentativeInitiatingCell:", 0);
  -[_UITableViewDragController setTentativeInitiatingIndexPath:](self, "setTentativeInitiatingIndexPath:", 0);
  -[_UITableViewDragController clearTentativeRows](self, "clearTentativeRows");

}

- (void)beginDragOfRowsForSession:(id)a3 notifyDelegate:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  id v8;

  v4 = a4;
  v8 = a3;
  -[_UITableViewDragController beginDragForTentativeRows](self, "beginDragForTentativeRows");
  -[_UITableViewDragController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v4)
    objc_msgSend(v6, "_dragSessionWillBegin:", v8);
  objc_msgSend(v7, "_updateAppearanceOfVisibleRowsForDragState");

}

- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int has_internal_diagnostics;
  char v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  _UITableViewDragItemContext *v21;
  void *v23;
  void *v24;
  NSObject *v25;
  unint64_t v26;
  NSObject *v27;
  void *v28;
  id obj;
  _UITableViewDragController *v30;
  id v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[16];
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[_UITableViewDragController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v6;
  objc_msgSend(v6, "locationInView:", v7);
  if (-[_UITableViewDragController canProvideItemsForDragAtPoint:](self, "canProvideItemsForDragAtPoint:"))
  {
    -[_UITableViewDragController tentativeInitiatingIndexPath](self, "tentativeInitiatingIndexPath");
    v8 = objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITableViewDragController.m"), 284, CFSTR("_UITableViewDragController internal inconsistency: tentativeInitiatingIndexPath cannot be nil in %@"), v24);

    }
    objc_msgSend(v7, "_rowsToIncludeInDragSession:atIndexPath:withDataOwner:", v6, v8, objc_msgSend(v7, "_dataOwnerForDragSession:atIndexPath:", v6, v8));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    has_internal_diagnostics = os_variant_has_internal_diagnostics();
    v11 = objc_msgSend(v9, "containsObject:", v8);
    if (has_internal_diagnostics)
    {
      if ((v11 & 1) == 0)
      {
        __UIFaultDebugAssertLog();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_185066000, v25, OS_LOG_TYPE_FAULT, "The rows to include in the drag should always contain the index path that initiated the drag.", buf, 2u);
        }

      }
    }
    else if ((v11 & 1) == 0)
    {
      v26 = dragInteraction_itemsForBeginningSession____s_category;
      if (!dragInteraction_itemsForBeginningSession____s_category)
      {
        v26 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v26, (unint64_t *)&dragInteraction_itemsForBeginningSession____s_category);
      }
      v27 = *(NSObject **)(v26 + 8);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_185066000, v27, OS_LOG_TYPE_ERROR, "The rows to include in the drag should always contain the index path that initiated the drag.", buf, 2u);
      }
    }
    v28 = (void *)v8;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v9, "count"));
    v31 = (id)objc_claimAutoreleasedReturnValue();
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    obj = v9;
    v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
    if (v34)
    {
      v32 = *(_QWORD *)v41;
      v30 = self;
      do
      {
        for (i = 0; i != v34; ++i)
        {
          if (*(_QWORD *)v41 != v32)
            objc_enumerationMutation(obj);
          v13 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i);
          objc_msgSend(v7, "_itemsForBeginningDragSession:atIndexPath:", v33, v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v14, "count"))
          {
            -[_UITableViewDragController addTentativeRowAtIndexPath:](self, "addTentativeRowAtIndexPath:", v13);
            v38 = 0u;
            v39 = 0u;
            v36 = 0u;
            v37 = 0u;
            v35 = v14;
            v15 = v14;
            v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
            if (v16)
            {
              v17 = v16;
              v18 = *(_QWORD *)v37;
              do
              {
                for (j = 0; j != v17; ++j)
                {
                  if (*(_QWORD *)v37 != v18)
                    objc_enumerationMutation(v15);
                  v20 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * j);
                  v21 = -[_UITableViewDragItemContext initWithIndexPath:forTableView:]([_UITableViewDragItemContext alloc], "initWithIndexPath:forTableView:", v13, v7);
                  objc_msgSend(v20, "_setPrivateLocalContext:", v21);

                }
                v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
              }
              while (v17);
            }

            objc_msgSend(v31, "addObjectsFromArray:", v15);
            self = v30;
            v14 = v35;
          }

        }
        v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
      }
      while (v34);
    }

  }
  else
  {
    v31 = (id)MEMORY[0x1E0C9AA60];
  }

  return v31;
}

- (id)dragInteraction:(id)a3 itemsForAddingToSession:(id)a4 withTouchAtPoint:(CGPoint)a5
{
  double y;
  double x;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  _UITableViewDragItemContext *v19;
  void *v21;
  void *v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  y = a5.y;
  x = a5.x;
  v29 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  if (-[_UITableViewDragController canProvideItemsForDragAtPoint:](self, "canProvideItemsForDragAtPoint:", x, y))
  {
    -[_UITableViewDragController tentativeInitiatingIndexPath](self, "tentativeInitiatingIndexPath");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITableViewDragController.m"), 317, CFSTR("_UITableViewDragController internal inconsistency: tentativeInitiatingIndexPath cannot be nil in %@"), v22);

    }
    -[_UITableViewDragController tableView](self, "tableView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_itemsForAddingToDragSession:atIndexPath:point:withDataOwner:", v9, v10, objc_msgSend(v9, "_dataOwner"), x, y);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "count"))
    {
      v23 = v9;
      -[_UITableViewDragController addTentativeRowAtIndexPath:](self, "addTentativeRowAtIndexPath:", v10);
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v13 = v12;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v25;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v25 != v16)
              objc_enumerationMutation(v13);
            v18 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
            v19 = -[_UITableViewDragItemContext initWithIndexPath:forTableView:]([_UITableViewDragItemContext alloc], "initWithIndexPath:forTableView:", v10, v11);
            objc_msgSend(v18, "_setPrivateLocalContext:", v19);

          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        }
        while (v15);
      }

      v9 = v23;
    }

  }
  else
  {
    v12 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v12;
}

- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  UIDragPreviewTarget *v19;
  UIDragPreviewTarget *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  UITargetedDragPreview *v27;
  uint64_t v28;
  void *v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  id v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(v10, "_privateLocalContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITableViewDragController.m"), 337, CFSTR("UITableView internal inconsistency: %@ should never be called for a drag item that did not come from this table view"), v31);

    }
  }
  objc_msgSend(v12, "indexPath");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    -[_UITableViewDragController tableView](self, "tableView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0;
    v37 = &v36;
    v38 = 0x3032000000;
    v39 = __Block_byref_object_copy__186;
    v40 = __Block_byref_object_dispose__186;
    v41 = 0;
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __76___UITableViewDragController_dragInteraction_previewForLiftingItem_session___block_invoke;
    v32[3] = &unk_1E16B9698;
    v35 = &v36;
    v15 = v14;
    v33 = v15;
    v16 = v13;
    v34 = v16;
    objc_msgSend(v15, "_performUsingPresentationValues:", v32);
    v17 = (void *)v37[5];
    if (v17 && (objc_msgSend(v17, "window"), v18 = (void *)objc_claimAutoreleasedReturnValue(), v18, v18))
    {
      objc_msgSend((id)v37[5], "_dropAnimationContainerView");
      v19 = (UIDragPreviewTarget *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        v20 = [UIDragPreviewTarget alloc];
        objc_msgSend((id)v37[5], "superview");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v37[5], "center");
        objc_msgSend(v21, "convertPoint:toView:", v15);
        v19 = -[UIPreviewTarget initWithContainer:center:](v20, "initWithContainer:center:", v15);

      }
      objc_msgSend(v15, "_dragPreviewParametersForIndexPath:", v16);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v22;
      if (v22)
        v24 = v22;
      else
        v24 = (id)objc_opt_new();
      v26 = v24;

      v27 = [UITargetedDragPreview alloc];
      if (v19)
        v28 = -[UITargetedDragPreview initWithView:parameters:target:](v27, "initWithView:parameters:target:", v37[5], v26, v19);
      else
        v28 = -[UITargetedPreview initWithView:parameters:](v27, "initWithView:parameters:", v37[5], v26);
      v25 = (void *)v28;

    }
    else
    {
      v25 = 0;
    }

    _Block_object_dispose(&v36, 8);
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (void)dragInteraction:(id)a3 willAnimateLiftWithAnimator:(id)a4 session:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;

  v7 = a4;
  -[_UITableViewDragController tentativeIndexPaths](self, "tentativeIndexPaths");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");

  if (!objc_msgSend(v9, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITableViewDragController.m"), 377, CFSTR("_UITableViewDragController internal inconsistency: tentativeIndexPaths cannot be empty in %@"), v16);

  }
  -[_UITableViewDragController tableView](self, "tableView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_prepareToLiftRowsAtIndexPaths:", v9);
  v11 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __82___UITableViewDragController_dragInteraction_willAnimateLiftWithAnimator_session___block_invoke;
  v19[3] = &unk_1E16B1B50;
  v12 = v10;
  v20 = v12;
  v21 = v9;
  v13 = v9;
  objc_msgSend(v7, "addAnimations:", v19);
  v17[0] = v11;
  v17[1] = 3221225472;
  v17[2] = __82___UITableViewDragController_dragInteraction_willAnimateLiftWithAnimator_session___block_invoke_2;
  v17[3] = &unk_1E16B42D0;
  v18 = v12;
  v14 = v12;
  objc_msgSend(v7, "addCompletion:", v17);

}

- (void)dragInteraction:(id)a3 sessionWillBegin:(id)a4
{
  id v5;

  v5 = a4;
  -[_UITableViewDragController setDragSession:](self, "setDragSession:", v5);
  -[_UITableViewDragController beginDragOfRowsForSession:notifyDelegate:](self, "beginDragOfRowsForSession:notifyDelegate:", v5, 1);

}

- (void)dragInteraction:(id)a3 session:(id)a4 didEndWithOperation:(unint64_t)a5
{
  id v6;
  id v7;

  v6 = a4;
  -[_UITableViewDragController resetDragState](self, "resetDragState");
  -[_UITableViewDragController tableView](self, "tableView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[_UITableViewDragController setDragSession:](self, "setDragSession:", 0);
  objc_msgSend(v7, "_dragSessionDidEnd:", v6);

  objc_msgSend(v7, "_updateAppearanceOfVisibleRowsForDragState");
}

- (id)dragInteraction:(id)a3 sessionForAddingItems:(id)a4 withTouchAtPoint:(CGPoint)a5
{
  id v6;
  void *v7;
  id v8;
  unint64_t v9;
  NSObject *v10;
  void *v11;
  NSObject *v13;
  uint8_t v14[16];
  uint8_t buf[16];

  v6 = a4;
  -[_UITableViewDragController dragSession](self, "dragSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (objc_msgSend(v6, "containsObject:", v7))
    {
      v8 = v7;
      goto LABEL_11;
    }
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v13, OS_LOG_TYPE_FAULT, "It should not be possible for mySession to not be one of the localDragSessions", buf, 2u);
      }

    }
    else
    {
      v9 = dragInteraction_sessionForAddingItems_withTouchAtPoint____s_category;
      if (!dragInteraction_sessionForAddingItems_withTouchAtPoint____s_category)
      {
        v9 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v9, (unint64_t *)&dragInteraction_sessionForAddingItems_withTouchAtPoint____s_category);
      }
      v10 = *(NSObject **)(v9 + 8);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_ERROR, "It should not be possible for mySession to not be one of the localDragSessions", v14, 2u);
      }
    }
  }
  if (objc_msgSend(v6, "count") != 1)
  {
    v11 = 0;
    goto LABEL_13;
  }
  objc_msgSend(v6, "firstObject");
  v8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_11:
  v11 = v8;
LABEL_13:

  return v11;
}

- (void)dragInteraction:(id)a3 session:(id)a4 willAddItems:(id)a5 forInteraction:(id)a6
{
  id v9;
  void *v10;
  id v11;

  v9 = a4;
  if (a3 == a6)
  {
    v11 = v9;
    -[_UITableViewDragController dragSession](self, "dragSession");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
      -[_UITableViewDragController setDragSession:](self, "setDragSession:", v11);
    -[_UITableViewDragController beginDragOfRowsForSession:notifyDelegate:](self, "beginDragOfRowsForSession:notifyDelegate:", v11, v10 == 0);
    v9 = v11;
  }

}

- (id)dragInteraction:(id)a3 previewForCancellingItem:(id)a4 withDefault:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  UITargetedDragPreview *v22;
  UITargetedDragPreview *v23;
  void *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(v10, "_privateLocalContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITableViewDragController.m"), 456, CFSTR("UITableView internal inconsistency: %@ should never be called for a drag item that did not come from this table view"), v26);

    }
  }
  objc_msgSend(v12, "indexPath");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    -[_UITableViewDragController tableView](self, "tableView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0;
    v32 = &v31;
    v33 = 0x3032000000;
    v34 = __Block_byref_object_copy__186;
    v35 = __Block_byref_object_dispose__186;
    v36 = 0;
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __83___UITableViewDragController_dragInteraction_previewForCancellingItem_withDefault___block_invoke;
    v27[3] = &unk_1E16B9698;
    v30 = &v31;
    v15 = v14;
    v28 = v15;
    v16 = v13;
    v29 = v16;
    objc_msgSend(v15, "_performUsingPresentationValues:", v27);
    v17 = (void *)v32[5];
    if (v17 && (objc_msgSend(v17, "window"), v18 = (void *)objc_claimAutoreleasedReturnValue(), v18, v18))
    {
      -[_UITableViewDragController cellsAnimatingCancel](self, "cellsAnimatingCancel");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setObject:forKey:", v32[5], v10);

      objc_msgSend(v15, "_beginAnimatingDropOfCell:isCanceling:", v32[5], 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "_dragPreviewParametersForIndexPath:", v16);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v21)
        v22 = -[UITargetedPreview initWithView:parameters:]([UITargetedDragPreview alloc], "initWithView:parameters:", v20, v21);
      else
        v22 = -[UITargetedDragPreview initWithView:]([UITargetedDragPreview alloc], "initWithView:", v20);
      v23 = v22;

    }
    else
    {
      v23 = 0;
    }

    _Block_object_dispose(&v31, 8);
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (void)dragInteraction:(id)a3 item:(id)a4 willAnimateCancelWithAnimator:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;
  id location;
  _QWORD v24[4];
  id v25;
  id v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[_UITableViewDragController cellsAnimatingCancel](self, "cellsAnimatingCancel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[_UITableViewDragController tableView](self, "tableView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __81___UITableViewDragController_dragInteraction_item_willAnimateCancelWithAnimator___block_invoke;
    v24[3] = &unk_1E16B1B50;
    v15 = v13;
    v25 = v15;
    v16 = v12;
    v26 = v16;
    objc_msgSend(v10, "addAnimations:", v24);
    objc_initWeak(&location, self);
    v18[0] = v14;
    v18[1] = 3221225472;
    v18[2] = __81___UITableViewDragController_dragInteraction_item_willAnimateCancelWithAnimator___block_invoke_2;
    v18[3] = &unk_1E16E39D8;
    objc_copyWeak(&v22, &location);
    v17 = v15;
    v19 = v17;
    v20 = v16;
    v21 = v9;
    objc_msgSend(v10, "addCompletion:", v18);

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);

  }
}

- (BOOL)dragInteraction:(id)a3 sessionAllowsMoveOperation:(id)a4
{
  id v5;
  void *v6;
  char v7;

  v5 = a4;
  -[_UITableViewDragController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "_dragSessionAllowsMoveOperation:", v5);

  return v7;
}

- (BOOL)dragInteraction:(id)a3 sessionIsRestrictedToDraggingApplication:(id)a4
{
  id v5;
  void *v6;
  char v7;

  v5 = a4;
  -[_UITableViewDragController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "_dragSessionIsRestrictedToDraggingApplication:", v5);

  return v7;
}

- (BOOL)dragInteraction:(id)a3 prefersFullSizePreviewsForSession:(id)a4
{
  id v5;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  CGPoint v20;
  CGRect v21;

  v5 = a4;
  -[_UITableViewDragController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  objc_msgSend(v5, "locationInView:", v6);
  v16 = v15;
  v18 = v17;

  v21.origin.x = v8;
  v21.origin.y = v10;
  v21.size.width = v12;
  v21.size.height = v14;
  v20.x = v16;
  v20.y = v18;
  LOBYTE(v5) = CGRectContainsPoint(v21, v20);

  return (char)v5;
}

- (BOOL)_dragInteractionDynamicallyUpdatesPrefersFullSizePreviews:(id)a3
{
  return 1;
}

- (int64_t)_dragInteraction:(id)a3 dataOwnerForSession:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int64_t v9;
  void *v11;
  void *v12;

  v6 = a4;
  if (_UIShouldEnforceOpenInRulesInAccountBasedApp())
  {
    -[_UITableViewDragController tentativeInitiatingIndexPath](self, "tentativeInitiatingIndexPath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITableViewDragController.m"), 531, CFSTR("_UITableViewDragController internal inconsistency: tentativeInitiatingIndexPath cannot be nil in %@"), v12);

    }
    -[_UITableViewDragController tableView](self, "tableView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "_dataOwnerForDragSession:atIndexPath:", v6, v7);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (int64_t)_dragInteraction:(id)a3 dataOwnerForAddingToSession:(id)a4 withTouchAtPoint:(CGPoint)a5
{
  double y;
  double x;
  id v9;
  void *v10;
  void *v11;
  int64_t v12;
  void *v14;
  void *v15;

  y = a5.y;
  x = a5.x;
  v9 = a4;
  if (_UIShouldEnforceOpenInRulesInAccountBasedApp()
    && -[_UITableViewDragController canProvideItemsForDragAtPoint:](self, "canProvideItemsForDragAtPoint:", x, y))
  {
    -[_UITableViewDragController tentativeInitiatingIndexPath](self, "tentativeInitiatingIndexPath");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITableViewDragController.m"), 545, CFSTR("_UITableViewDragController internal inconsistency: tentativeInitiatingIndexPath cannot be nil in %@"), v15);

    }
    -[_UITableViewDragController tableView](self, "tableView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "_dataOwnerForDragSession:atIndexPath:", v9, v10);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)_dragInteraction:(id)a3 sessionPropertiesForSession:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  -[_UITableViewDragController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_dragSessionPropertiesForSession:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (int64_t)clientEnabledState
{
  return self->_clientEnabledState;
}

- (void)setDragSession:(id)a3
{
  objc_storeStrong((id *)&self->_dragSession, a3);
}

- (void)setIndexPaths:(id)a3
{
  objc_storeStrong((id *)&self->_indexPaths, a3);
}

- (void)setTableView:(id)a3
{
  objc_storeWeak((id *)&self->_tableView, a3);
}

- (UITableViewCell)initiatingCell
{
  return self->_initiatingCell;
}

- (NSIndexPath)initiatingIndexPath
{
  return self->_initiatingIndexPath;
}

- (UITableViewCell)tentativeInitiatingCell
{
  return self->_tentativeInitiatingCell;
}

- (void)setTentativeInitiatingCell:(id)a3
{
  objc_storeStrong((id *)&self->_tentativeInitiatingCell, a3);
}

- (NSIndexPath)tentativeInitiatingIndexPath
{
  return self->_tentativeInitiatingIndexPath;
}

- (void)setTentativeInitiatingIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_tentativeInitiatingIndexPath, a3);
}

- (NSMutableOrderedSet)tentativeIndexPaths
{
  return self->_tentativeIndexPaths;
}

- (void)setTentativeIndexPaths:(id)a3
{
  objc_storeStrong((id *)&self->_tentativeIndexPaths, a3);
}

- (NSMapTable)cellsAnimatingCancel
{
  return self->_cellsAnimatingCancel;
}

- (void)setCellsAnimatingCancel:(id)a3
{
  objc_storeStrong((id *)&self->_cellsAnimatingCancel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellsAnimatingCancel, 0);
  objc_storeStrong((id *)&self->_tentativeIndexPaths, 0);
  objc_storeStrong((id *)&self->_tentativeInitiatingIndexPath, 0);
  objc_storeStrong((id *)&self->_tentativeInitiatingCell, 0);
  objc_storeStrong((id *)&self->_initiatingIndexPath, 0);
  objc_storeStrong((id *)&self->_initiatingCell, 0);
  objc_destroyWeak((id *)&self->_tableView);
  objc_storeStrong((id *)&self->_dragInteraction, 0);
  objc_storeStrong((id *)&self->_indexPaths, 0);
  objc_storeStrong((id *)&self->_dragSession, 0);
}

@end
