@implementation _UITableViewMultiSelectController

- (_UITableViewMultiSelectController)initWithTableView:(id)a3
{
  id v4;
  _UITableViewMultiSelectController *v5;
  _UITableViewMultiSelectController *v6;
  UIMultiSelectInteraction *v7;
  UIMultiSelectInteraction *multiSelectInteraction;
  id WeakRetained;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_UITableViewMultiSelectController;
  v5 = -[_UITableViewMultiSelectController init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_tableView, v4);
    v7 = objc_alloc_init(UIMultiSelectInteraction);
    multiSelectInteraction = v6->_multiSelectInteraction;
    v6->_multiSelectInteraction = v7;

    -[UIMultiSelectInteraction setDelegate:](v6->_multiSelectInteraction, "setDelegate:", v6);
    WeakRetained = objc_loadWeakRetained((id *)&v6->_tableView);
    objc_msgSend(WeakRetained, "addInteraction:", v6->_multiSelectInteraction);

  }
  return v6;
}

- (void)uninstallFromTableView
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_tableView);
  objc_msgSend(WeakRetained, "removeInteraction:", self->_multiSelectInteraction);

}

- (void)selectedIndexPathsChanged:(id)a3
{
  id v4;
  void *v5;
  UIMultiSelectInteractionState *v6;

  v4 = a3;
  -[_UITableViewMultiSelectController currentSelectionState](self, "currentSelectionState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_UITableViewMultiSelectController currentSelectionState](self, "currentSelectionState");
    v6 = (UIMultiSelectInteractionState *)objc_claimAutoreleasedReturnValue();
    -[UIMultiSelectInteractionState updateStateWithDifferenceFromCurrentSelection:](v6, "updateStateWithDifferenceFromCurrentSelection:", v4);

  }
  else
  {
    v6 = -[UIMultiSelectInteractionState initWithCurrentSelection:]([UIMultiSelectInteractionState alloc], "initWithCurrentSelection:", v4);

    -[_UITableViewMultiSelectController setCurrentSelectionState:](self, "setCurrentSelectionState:", v6);
  }

}

- (void)_handleAutoScrollFromPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  id v8;

  y = a3.y;
  x = a3.x;
  -[_UITableViewMultiSelectController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_autoScrollAssistant");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[_UITableViewMultiSelectController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v7, "_shouldAutoScroll");

  if ((_DWORD)v6)
    objc_msgSend(v8, "autoScrollFromPoint:", x, y);
  else
    objc_msgSend(v8, "stop");

}

- (void)_endAutoScroll
{
  void *v2;
  id v3;

  -[_UITableViewMultiSelectController tableView](self, "tableView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_autoScrollAssistant");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stop");

}

- (void)_selectIndexPaths:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _UITableViewMultiSelectController *v16;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  -[_UITableViewMultiSelectController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "indexPathsForSelectedRows");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = v7;
  else
    v9 = MEMORY[0x1E0C9AA60];
  objc_msgSend(v4, "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(v5, "mutableCopy");
  objc_msgSend(v11, "minusSet:", v10);
  -[_UITableViewMultiSelectController currentSelectionState](self, "currentSelectionState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __55___UITableViewMultiSelectController__selectIndexPaths___block_invoke;
  v14[3] = &unk_1E16B1B50;
  v15 = v11;
  v16 = self;
  v13 = v11;
  objc_msgSend(v12, "ignoreSelectionChangedNotificationsWithBlock:", v14);

}

- (void)_deselectIndexPaths:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[_UITableViewMultiSelectController currentSelectionState](self, "currentSelectionState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57___UITableViewMultiSelectController__deselectIndexPaths___block_invoke;
  v7[3] = &unk_1E16B1B50;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "ignoreSelectionChangedNotificationsWithBlock:", v7);

}

- (void)_updateSelectedIndexPathsForCurrentSelection
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;

  -[_UITableViewMultiSelectController currentSelectionState](self, "currentSelectionState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startIndexPath");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  -[_UITableViewMultiSelectController currentSelectionState](self, "currentSelectionState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endIndexPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12 && v5)
  {
    v6 = objc_msgSend(v12, "section");
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v5, "row");
    if (v8 > objc_msgSend(v12, "row"))
      v9 = 1;
    else
      v9 = -1;
    for (i = objc_msgSend(v12, "row"); i != objc_msgSend(v5, "row"); i += v9)
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", i, v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v11);

    }
    -[_UITableViewMultiSelectController _updateSelectedIndexPaths:](self, "_updateSelectedIndexPaths:", v7);

  }
}

- (void)_updateSelectedIndexPaths:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99E60];
  -[_UITableViewMultiSelectController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "indexPathsForSelectedRows");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v7);
  v8 = objc_claimAutoreleasedReturnValue();

  -[_UITableViewMultiSelectController currentSelectionState](self, "currentSelectionState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pathsToSelectForInterpolatedIndexPaths:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UITableViewMultiSelectController currentSelectionState](self, "currentSelectionState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)v8;
  v23 = v4;
  objc_msgSend(v11, "pathsToDeselectForInterpolatedIndexPaths:currentlySelectedIndexPaths:", v4, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v14 = v10;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v25;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v25 != v17)
          objc_enumerationMutation(v14);
        v19 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v18);
        -[_UITableViewMultiSelectController tableView](self, "tableView");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "_canRowBeIncludedInMultipleSelection:", v19);

        if (v21)
          objc_msgSend(v13, "addObject:", v19);
        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v16);
  }

  -[_UITableViewMultiSelectController _selectIndexPaths:](self, "_selectIndexPaths:", v14);
  -[_UITableViewMultiSelectController _deselectIndexPaths:](self, "_deselectIndexPaths:", v12);

}

- (void)_adjustSelectionRangeToIndexPath:(id)a3 isDeselecting:(BOOL)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  -[_UITableViewMultiSelectController currentSelectionState](self, "currentSelectionState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startIndexPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = objc_msgSend(v9, "section");
    if (v7 == objc_msgSend(v6, "section"))
    {
      -[_UITableViewMultiSelectController currentSelectionState](self, "currentSelectionState");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setEndIndexPath:", v9);

      -[_UITableViewMultiSelectController _updateSelectedIndexPathsForCurrentSelection](self, "_updateSelectedIndexPathsForCurrentSelection");
    }
  }

}

- (BOOL)_isPointInsideEditControl:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  BOOL v21;

  y = a3.y;
  x = a3.x;
  -[_UITableViewMultiSelectController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "indexPathForRowAtPoint:", x, y);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UITableViewMultiSelectController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cellForRowAtIndexPath:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "editingData:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "editControl:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0;
  if (v11)
  {
    -[_UITableViewMultiSelectController tableView](self, "tableView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "convertPoint:fromView:", v12, x, y);
    v14 = v13;
    v16 = v15;

    objc_msgSend(v11, "bounds");
    if (sqrt((v18 + v17 * 0.5 - v14) * (v18 + v17 * 0.5 - v14) + (v20 + v19 * 0.5 - v16) * (v20 + v19 * 0.5 - v16)) < 35.0)
      v21 = 1;
  }

  return v21;
}

- (id)_tableViewDelegate
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;

  -[_UITableViewMultiSelectController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[_UITableViewMultiSelectController tableView](self, "tableView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (void)clearSelectionState
{
  -[_UITableViewMultiSelectController setCurrentSelectionState:](self, "setCurrentSelectionState:", 0);
}

- (id)keyCommandsForSelectionExtension
{
  return -[UIMultiSelectInteraction keyCommandsForSelectionExtension](self->_multiSelectInteraction, "keyCommandsForSelectionExtension");
}

- (id)targetForKeyCommands
{
  return self->_multiSelectInteraction;
}

- (BOOL)supportsKeyboardSelectionExtension
{
  return 1;
}

- (void)multiSelectInteraction:(id)a3 extendSelectionInDirection:(unint64_t)a4
{
  UITableView **p_tableView;
  id WeakRetained;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;

  p_tableView = &self->_tableView;
  WeakRetained = objc_loadWeakRetained((id *)&self->_tableView);
  objc_msgSend(WeakRetained, "indexPathsForSelectedRows");
  v19 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "lastObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_loadWeakRetained((id *)p_tableView);
  v10 = objc_msgSend(v9, "globalRowForRowAtIndexPath:", v8);

  if (a4 == 1)
    v11 = v10 + 1;
  else
    v11 = v10;
  if (a4 == 2)
    v12 = v10 - 1;
  else
    v12 = v11;
  v13 = objc_loadWeakRetained((id *)p_tableView);
  objc_msgSend(v13, "indexPathForRowAtGlobalRow:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UITableViewMultiSelectController currentSelectionState](self, "currentSelectionState");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "startIndexPath");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v17 = objc_msgSend(v14, "section");
    if (v17 == objc_msgSend(v16, "section"))
    {
      -[_UITableViewMultiSelectController currentSelectionState](self, "currentSelectionState");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setEndIndexPath:", v14);

      -[_UITableViewMultiSelectController _updateSelectedIndexPathsForCurrentSelection](self, "_updateSelectedIndexPathsForCurrentSelection");
    }
  }

}

- (BOOL)isInMultiSelectMode
{
  void *v2;
  char v3;

  -[_UITableViewMultiSelectController tableView](self, "tableView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (dyld_program_sdk_at_least())
    v3 = objc_msgSend(v2, "_allowsEffectiveMultipleSelection");
  else
    v3 = objc_msgSend(v2, "isEditing")
      && (objc_msgSend(v2, "allowsMultipleSelectionDuringEditing") & 1) != 0;

  return v3;
}

- (void)automaticallyTransitionToMultiSelectModeKeepingCurrentSelection:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  UIMultiSelectInteractionState *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v3 = a3;
  -[_UITableViewMultiSelectController multiSelectInteraction](self, "multiSelectInteraction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "activeGestureType");

  if (!-[_UITableViewMultiSelectController isInMultiSelectMode](self, "isInMultiSelectMode"))
  {
    -[_UITableViewMultiSelectController tableView](self, "tableView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v9;
    if (!v3)
      goto LABEL_10;
    objc_msgSend(v9, "indexPathsForSelectedRows");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = -[UIMultiSelectInteractionState initWithCurrentSelection:]([UIMultiSelectInteractionState alloc], "initWithCurrentSelection:", v10);
    -[_UITableViewMultiSelectController setCurrentSelectionState:](self, "setCurrentSelectionState:", v11);

    -[_UITableViewMultiSelectController tableView](self, "tableView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setEditing:animated:", 1, 1);

    v13 = (void *)MEMORY[0x1E0C99E60];
    -[_UITableViewMultiSelectController currentSelectionState](self, "currentSelectionState");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "originallySelectedIndexPaths");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setWithArray:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITableViewMultiSelectController _selectIndexPaths:](self, "_selectIndexPaths:", v15);

    goto LABEL_11;
  }
  if (!dyld_program_sdk_at_least() || (unint64_t)(v6 - 1) > 1)
    return;
  -[_UITableViewMultiSelectController tableView](self, "tableView");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v16, "_isEditingWithNoSwipedCell") & 1) != 0)
  {
LABEL_11:

    return;
  }
  -[_UITableViewMultiSelectController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "allowsMultipleSelectionDuringEditing");

  if (v8)
  {
    -[_UITableViewMultiSelectController tableView](self, "tableView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v9;
LABEL_10:
    objc_msgSend(v9, "setEditing:animated:", 1, 1);
    goto LABEL_11;
  }
}

- (BOOL)_shouldBeginInteractionAtPoint:(CGPoint)a3
{
  double y;
  double x;
  _UITableViewMultiSelectController *v5;
  void *v6;
  void *v7;

  y = a3.y;
  x = a3.x;
  v5 = self;
  -[_UITableViewMultiSelectController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "indexPathForRowAtPoint:", x, y);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = -[_UITableViewMultiSelectController _shouldBeginInteractionAtIndexPath:](v5, "_shouldBeginInteractionAtIndexPath:", v7);
  return (char)v5;
}

- (BOOL)_shouldBeginInteractionAtIndexPath:(id)a3
{
  id v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  if (-[_UITableViewMultiSelectController isInMultiSelectMode](self, "isInMultiSelectMode"))
  {
    v5 = 1;
  }
  else
  {
    if (v4)
      goto LABEL_5;
    -[_UITableViewMultiSelectController tableView](self, "tableView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "indexPathsForSelectedRows");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastObject");
    v4 = (id)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
LABEL_5:
      -[_UITableViewMultiSelectController _tableViewDelegate](self, "_tableViewDelegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UITableViewMultiSelectController tableView](self, "tableView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v8, "tableView:shouldBeginMultipleSelectionInteractionAtIndexPath:", v9, v4);

    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (void)willBeginMultiSelectInteraction:(id)a3 atPoint:(CGPoint)a4 keepCurrentSelection:(BOOL)a5
{
  _BOOL8 v5;
  double y;
  double x;
  void *v10;
  id v11;

  v5 = a5;
  y = a4.y;
  x = a4.x;
  if (a4.x == *MEMORY[0x1E0C9D628] && a4.y == *(double *)(MEMORY[0x1E0C9D628] + 8))
  {
    v11 = 0;
  }
  else
  {
    -[_UITableViewMultiSelectController tableView](self, "tableView", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "indexPathForRowAtPoint:", x, y);
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  -[_UITableViewMultiSelectController willBeginExtendingSelectionAtIndexPath:keepingSelection:](self, "willBeginExtendingSelectionAtIndexPath:keepingSelection:", v11, v5);

}

- (void)willBeginExtendingSelectionAtIndexPath:(id)a3 keepingSelection:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  UIMultiSelectInteractionState *v10;
  UIMultiSelectInteractionState *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v4 = a4;
  v6 = a3;
  -[_UITableViewMultiSelectController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "indexPathsForSelectedRows");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UITableViewMultiSelectController currentSelectionState](self, "currentSelectionState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    if (v4)
      v10 = -[UIMultiSelectInteractionState initWithCurrentSelection:]([UIMultiSelectInteractionState alloc], "initWithCurrentSelection:", v8);
    else
      v10 = objc_alloc_init(UIMultiSelectInteractionState);
    v11 = v10;
    -[_UITableViewMultiSelectController setCurrentSelectionState:](self, "setCurrentSelectionState:", v10);

  }
  -[_UITableViewMultiSelectController currentSelectionState](self, "currentSelectionState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "beginMultiselectInteraction");

  -[_UITableViewMultiSelectController currentSelectionState](self, "currentSelectionState");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "updateStateWithStartingIndexPath:otherSelectedIndexPaths:", v6, v8);

  -[_UITableViewMultiSelectController currentSelectionState](self, "currentSelectionState");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "startIndexPath");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[_UITableViewMultiSelectController currentSelectionState](self, "currentSelectionState");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "startIndexPath");
    v22 = (id)objc_claimAutoreleasedReturnValue();

    -[_UITableViewMultiSelectController tableView](self, "tableView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "delegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[_UITableViewMultiSelectController tableView](self, "tableView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "tableView:didBeginMultipleSelectionInteractionAtIndexPath:", v19, v22);

    }
    -[_UITableViewMultiSelectController tableView](self, "tableView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "_forciblyCancelPendingSelection");

    -[_UITableViewMultiSelectController tableView](self, "tableView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "unhighlightRowAtIndexPath:animated:", v22, 0);

  }
  else
  {
    v22 = v6;
  }

}

- (BOOL)supportsMultiSelectInteraction:(id)a3
{
  void *v4;
  void *v5;
  char v6;

  -[_UITableViewMultiSelectController _tableViewDelegate](self, "_tableViewDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[_UITableViewMultiSelectController tableView](self, "tableView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "allowsMultipleSelectionDuringEditing");

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)shouldBeginMultiSelectInteraction:(id)a3 ofType:(int64_t)a4 atPoint:(CGPoint)a5 withVelocity:(CGPoint)a6
{
  double y;
  double x;
  _BOOL4 v9;

  y = a5.y;
  x = a5.x;
  if (a4)
  {
    LOBYTE(v9) = -[_UITableViewMultiSelectController _shouldBeginInteractionAtPoint:](self, "_shouldBeginInteractionAtPoint:", a3, a5.x, a5.y, a6.x, a6.y);
  }
  else
  {
    v9 = -[_UITableViewMultiSelectController isInMultiSelectMode](self, "isInMultiSelectMode", a3, a5.x, a5.y, a6.x, a6.y);
    if (v9)
      LOBYTE(v9) = -[_UITableViewMultiSelectController _isPointInsideEditControl:](self, "_isPointInsideEditControl:", x, y);
  }
  return v9;
}

- (void)didEndMultiSelectInteraction:(id)a3 atPoint:(CGPoint)a4
{
  void *v5;
  char v6;
  void *v7;
  void *v8;
  id v9;

  -[_UITableViewMultiSelectController _endAutoScroll](self, "_endAutoScroll", a3, a4.x, a4.y);
  -[_UITableViewMultiSelectController _tableViewDelegate](self, "_tableViewDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[_UITableViewMultiSelectController _tableViewDelegate](self, "_tableViewDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITableViewMultiSelectController tableView](self, "tableView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "tableViewDidEndMultipleSelectionInteraction:", v8);

  }
  -[_UITableViewMultiSelectController currentSelectionState](self, "currentSelectionState");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "endMultiselectInteraction");

}

- (BOOL)shouldAllowSelectionExtensionAtPoint:(CGPoint)a3
{
  double y;
  double x;
  _UITableViewMultiSelectController *v5;
  void *v6;
  void *v7;

  y = a3.y;
  x = a3.x;
  v5 = self;
  -[_UITableViewMultiSelectController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "indexPathForRowAtPoint:", x, y);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = -[_UITableViewMultiSelectController shouldAllowSelectionExtensionAtIndexPath:](v5, "shouldAllowSelectionExtensionAtIndexPath:", v7);
  return (char)v5;
}

- (BOOL)shouldAllowSelectionAppendageAtPoint:(CGPoint)a3
{
  double y;
  double x;

  y = a3.y;
  x = a3.x;
  if (dyld_program_sdk_at_least())
    return -[_UITableViewMultiSelectController _shouldBeginInteractionAtPoint:](self, "_shouldBeginInteractionAtPoint:", x, y);
  else
    return -[_UITableViewMultiSelectController shouldAllowSelectionExtensionAtPoint:](self, "shouldAllowSelectionExtensionAtPoint:", x, y);
}

- (BOOL)shouldAllowSelectionExtensionAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;

  v4 = a3;
  -[_UITableViewMultiSelectController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPathsForSelectedRows");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
    v7 = -[_UITableViewMultiSelectController _shouldBeginInteractionAtIndexPath:](self, "_shouldBeginInteractionAtIndexPath:", v4);
  else
    v7 = 0;

  return v7;
}

- (void)toggleSelectionStateUpToIndexPath:(id)a3
{
  -[_UITableViewMultiSelectController _adjustSelectionRangeToIndexPath:isDeselecting:](self, "_adjustSelectionRangeToIndexPath:isDeselecting:", a3, 0);
}

- (void)multiSelectInteraction:(id)a3 toggleSelectionStateUpToPoint:(CGPoint)a4
{
  double y;
  double x;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  y = a4.y;
  x = a4.x;
  -[_UITableViewMultiSelectController tableView](self, "tableView", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_nearestCellToPoint:", x, y);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[_UITableViewMultiSelectController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "indexPathForCell:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UITableViewMultiSelectController toggleSelectionStateUpToIndexPath:](self, "toggleSelectionStateUpToIndexPath:", v9);
  -[_UITableViewMultiSelectController _handleAutoScrollFromPoint:](self, "_handleAutoScrollFromPoint:", x, y);

}

- (void)multiSelectInteraction:(id)a3 appendSelectionAtPoint:(CGPoint)a4
{
  double y;
  double x;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  id v13;

  y = a4.y;
  x = a4.x;
  -[_UITableViewMultiSelectController tableView](self, "tableView", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "indexPathForRowAtPoint:", x, y);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  v8 = v13;
  if (v13)
  {
    -[_UITableViewMultiSelectController currentSelectionState](self, "currentSelectionState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isSelecting");

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      -[_UITableViewMultiSelectController _selectIndexPaths:](self, "_selectIndexPaths:", v11);
    else
      -[_UITableViewMultiSelectController _deselectIndexPaths:](self, "_deselectIndexPaths:", v11);

    -[_UITableViewMultiSelectController currentSelectionState](self, "currentSelectionState");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setStartIndexPath:", v13);

    v8 = v13;
  }

}

- (BOOL)multiSelectInteractionGestureShouldPreventDragLiftGesture:(id)a3
{
  return 1;
}

- (void)didCancelMultiSelectInteraction:(id)a3 atPoint:(CGPoint)a4
{
  double y;
  double x;
  void *v7;
  void *v8;
  id v9;

  y = a4.y;
  x = a4.x;
  v7 = (void *)MEMORY[0x1E0C99E60];
  v9 = a3;
  objc_msgSend(v7, "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UITableViewMultiSelectController _updateSelectedIndexPaths:](self, "_updateSelectedIndexPaths:", v8);

  -[_UITableViewMultiSelectController didEndMultiSelectInteraction:atPoint:](self, "didEndMultiSelectInteraction:atPoint:", v9, x, y);
}

- (BOOL)isInMultiselectInteraction
{
  void *v2;
  char v3;

  -[_UITableViewMultiSelectController currentSelectionState](self, "currentSelectionState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isInMultiselectInteraction");

  return v3;
}

- (UITableView)tableView
{
  return (UITableView *)objc_loadWeakRetained((id *)&self->_tableView);
}

- (void)setTableView:(id)a3
{
  objc_storeWeak((id *)&self->_tableView, a3);
}

- (UIMultiSelectInteraction)multiSelectInteraction
{
  return self->_multiSelectInteraction;
}

- (void)setMultiSelectInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_multiSelectInteraction, a3);
}

- (UIMultiSelectInteractionState)currentSelectionState
{
  return self->_currentSelectionState;
}

- (void)setCurrentSelectionState:(id)a3
{
  objc_storeStrong((id *)&self->_currentSelectionState, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentSelectionState, 0);
  objc_storeStrong((id *)&self->_multiSelectInteraction, 0);
  objc_destroyWeak((id *)&self->_tableView);
}

@end
