@implementation _UITableViewDropController

- (id)beginIgnoringDrags
{
  void *v3;
  _UITableViewIgnoreDragsTokenImpl *v4;
  _UITableViewIgnoreDragsTokenImpl *v5;
  _QWORD v7[4];
  id v8;
  id location;

  if (!-[_UITableViewDropController shouldIgnoreDrags](self, "shouldIgnoreDrags")
    && -[_UITableViewDropController isTrackingDrag](self, "isTrackingDrag"))
  {
    -[_UITableViewDropController tableView](self, "tableView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_removeDropTargetAndResetAppearance");

    -[_UITableViewDropController resetTrackingState](self, "resetTrackingState");
  }
  -[_UITableViewDropController setIgnoringDragsCount:](self, "setIgnoringDragsCount:", -[_UITableViewDropController ignoringDragsCount](self, "ignoringDragsCount") + 1);
  objc_initWeak(&location, self);
  v4 = [_UITableViewIgnoreDragsTokenImpl alloc];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48___UITableViewDropController_beginIgnoringDrags__block_invoke;
  v7[3] = &unk_1E16B3F40;
  objc_copyWeak(&v8, &location);
  v5 = -[_UITableViewIgnoreDragsTokenImpl initWithDidEndHandler:](v4, "initWithDidEndHandler:", v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
  return v5;
}

- (void)setIgnoringDragsCount:(int64_t)a3
{
  self->_ignoringDragsCount = a3;
}

- (BOOL)isTrackingDrag
{
  return -[_UITableViewDropController defaultDropOperation](self, "defaultDropOperation") != 0;
}

- (unint64_t)defaultDropOperation
{
  return self->_defaultDropOperation;
}

- (void)endIgnoringDrags
{
  void *v4;
  id v5;

  -[_UITableViewDropController setIgnoringDragsCount:](self, "setIgnoringDragsCount:", -[_UITableViewDropController ignoringDragsCount](self, "ignoringDragsCount") - 1);
  if (-[_UITableViewDropController ignoringDragsCount](self, "ignoringDragsCount") < 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITableViewDropController.m"), 137, CFSTR("UITableView internal inconsistency: attempted to end ignoring drags more times than begin ignoring drags."));

  }
  if (!-[_UITableViewDropController shouldIgnoreDrags](self, "shouldIgnoreDrags"))
  {
    if (-[_UITableViewDropController isTrackingDrag](self, "isTrackingDrag"))
    {
      -[_UITableViewDropController dropSession](self, "dropSession");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      -[_UITableViewDropController updateTargetIndexPathAndDropProposalForSession:](self, "updateTargetIndexPathAndDropProposalForSession:", v5);

    }
  }
}

- (BOOL)shouldIgnoreDrags
{
  return -[_UITableViewDropController ignoringDragsCount](self, "ignoringDragsCount") > 0;
}

- (int64_t)ignoringDragsCount
{
  return self->_ignoringDragsCount;
}

- (_UITableViewDropController)initWithTableView:(id)a3
{
  id v5;
  _UITableViewDropController *v6;
  _UITableViewDropController *v7;
  void *v9;
  objc_super v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITableViewDropController.m"), 79, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("tableView != nil"));

  }
  v10.receiver = self;
  v10.super_class = (Class)_UITableViewDropController;
  v6 = -[_UITableViewDropController init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeWeak((id *)&v6->_tableView, v5);
    -[_UITableViewDropController resetAllDragState](v7, "resetAllDragState");
    -[_UITableViewDropController setupDragInteraction](v7, "setupDragInteraction");
  }

  return v7;
}

- (void)setupDragInteraction
{
  void *v3;
  UIDropInteraction *v4;

  v4 = -[UIDropInteraction initWithDelegate:]([UIDropInteraction alloc], "initWithDelegate:", self);
  -[_UITableViewDropController setDropInteraction:](self, "setDropInteraction:", v4);
  -[_UITableViewDropController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addInteraction:", v4);

}

- (_UITableViewDropControllerDelegate)tableView
{
  return (_UITableViewDropControllerDelegate *)objc_loadWeakRetained((id *)&self->_tableView);
}

- (void)setDropInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_dropInteraction, a3);
}

- (void)resetAllDragState
{
  id v3;

  -[_UITableViewDropController resetTrackingState](self, "resetTrackingState");
  -[_UITableViewDropController setDefaultDropOperation:](self, "setDefaultDropOperation:", 0);
  -[_UITableViewDropController setCanOnlyHandleReordering:](self, "setCanOnlyHandleReordering:", 0);
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[_UITableViewDropController setDragItemDropAnimations:](self, "setDragItemDropAnimations:", v3);

}

- (void)setDropProposal:(id)a3
{
  objc_storeStrong((id *)&self->_dropProposal, a3);
}

- (void)setDragItemDropAnimations:(id)a3
{
  objc_storeStrong((id *)&self->_dragItemDropAnimations, a3);
}

- (void)setDefaultDropOperation:(unint64_t)a3
{
  self->_defaultDropOperation = a3;
}

- (void)setCanOnlyHandleReordering:(BOOL)a3
{
  self->_canOnlyHandleReordering = a3;
}

- (void)resetTrackingState
{
  -[_UITableViewDropController setTargetIndexPath:](self, "setTargetIndexPath:", 0);
  -[_UITableViewDropController setDropProposal:](self, "setDropProposal:", 0);
}

- (void)setTargetIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_targetIndexPath, a3);
}

- (BOOL)isActive
{
  BOOL v3;
  void *v4;

  if (-[_UITableViewDropController isTrackingDrag](self, "isTrackingDrag"))
    return 1;
  -[_UITableViewDropController dropSession](self, "dropSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v4 != 0;

  return v3;
}

- (void)uninstallFromTableView
{
  void *v3;
  void *v4;
  id v5;

  if (-[_UITableViewDropController isActive](self, "isActive"))
  {
    -[_UITableViewDropController tableView](self, "tableView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_removeDropTargetAndResetAppearance");

    -[_UITableViewDropController resetAllDragState](self, "resetAllDragState");
  }
  -[_UITableViewDropController tableView](self, "tableView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[_UITableViewDropController dropInteraction](self, "dropInteraction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeInteraction:", v4);

}

- (void)updateTargetIndexPathAndDropProposalForSession:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  UITableViewDropProposal *v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  UITableViewDropProposal *v11;
  void *v12;
  unint64_t v13;
  NSObject *v14;
  uint8_t v15[16];
  uint8_t buf[16];

  v4 = a3;
  if (os_variant_has_internal_diagnostics())
  {
    if (!v4)
    {
      __UIFaultDebugAssertLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v5, OS_LOG_TYPE_FAULT, "Cannot update the target index path and drop proposal without a dropSession", buf, 2u);
      }
      goto LABEL_11;
    }
  }
  else if (!v4)
  {
    v13 = updateTargetIndexPathAndDropProposalForSession____s_category;
    if (!updateTargetIndexPathAndDropProposalForSession____s_category)
    {
      v13 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v13, (unint64_t *)&updateTargetIndexPathAndDropProposalForSession____s_category);
    }
    v14 = *(NSObject **)(v13 + 8);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_185066000, v14, OS_LOG_TYPE_ERROR, "Cannot update the target index path and drop proposal without a dropSession", v15, 2u);
    }
    goto LABEL_12;
  }
  if (!-[_UITableViewDropController shouldIgnoreDrags](self, "shouldIgnoreDrags"))
  {
    -[_UITableViewDropController tableView](self, "tableView");
    v5 = objc_claimAutoreleasedReturnValue();
    -[NSObject _targetIndexPathForDrop:](v5, "_targetIndexPathForDrop:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[UITableViewDropProposal initWithDropOperation:]([UITableViewDropProposal alloc], "initWithDropOperation:", -[_UITableViewDropController defaultDropOperation](self, "defaultDropOperation"));
    -[NSObject _updatedDropProposalForIndexPath:dropSession:withDefaultProposal:](v5, "_updatedDropProposalForIndexPath:dropSession:withDefaultProposal:", v6, v4, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "operation");
    if (v9 == 3)
    {
      if ((objc_msgSend(v4, "allowsMoveOperation") & 1) == 0)
      {
        v10 = 0;
LABEL_8:
        v11 = -[UITableViewDropProposal initWithDropOperation:]([UITableViewDropProposal alloc], "initWithDropOperation:", v10);
        -[_UITableViewDropController setDropProposal:](self, "setDropProposal:", v11);

        -[_UITableViewDropController setTargetIndexPath:](self, "setTargetIndexPath:", 0);
        -[NSObject _removeDropTargetAndResetAppearance](v5, "_removeDropTargetAndResetAppearance");
LABEL_10:

LABEL_11:
        goto LABEL_12;
      }
    }
    else
    {
      v10 = v9;
      if (v9 <= 1)
        goto LABEL_8;
    }
    -[_UITableViewDropController setDropProposal:](self, "setDropProposal:", v8);
    objc_msgSend(v8, "_adjustedTargetIndexPath");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITableViewDropController setTargetIndexPath:](self, "setTargetIndexPath:", v12);
    -[NSObject _updateDropTargetAppearanceWithTargetIndexPath:dropProposal:dropSession:](v5, "_updateDropTargetAppearanceWithTargetIndexPath:dropProposal:dropSession:", v12, v8, v4);

    goto LABEL_10;
  }
LABEL_12:

}

- (void)dropInteraction:(id)a3 sessionDidEnter:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  uint64_t v11;
  id v12;

  v12 = a4;
  -[_UITableViewDropController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (shouldAllowDrop(v5, v12) && objc_msgSend(v5, "_canHandleDropSession:", v12))
  {
    v6 = v12;
    objc_msgSend(v5, "_activeSourceDragSession");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7
      && (objc_msgSend(v6, "localDragSession"), v8 = (void *)objc_claimAutoreleasedReturnValue(), v8, v8))
    {
      objc_msgSend(v6, "localDragSession");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v7 == v9;

      if (v10)
        v11 = 3;
      else
        v11 = 2;
    }
    else
    {

      v11 = 2;
    }
    -[_UITableViewDropController setDefaultDropOperation:](self, "setDefaultDropOperation:", v11);
    -[_UITableViewDropController setDropSession:](self, "setDropSession:", v6);
    objc_msgSend(v5, "_dropEntered:", v6);
    -[_UITableViewDropController updateTargetIndexPathAndDropProposalForSession:](self, "updateTargetIndexPathAndDropProposalForSession:", v6);
  }
  else
  {
    -[_UITableViewDropController setDefaultDropOperation:](self, "setDefaultDropOperation:", 0);
  }

}

- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  UIDropProposal *v9;
  __objc2_class **v10;

  v6 = a3;
  v7 = a4;
  if (-[_UITableViewDropController defaultDropOperation](self, "defaultDropOperation"))
  {
    -[_UITableViewDropController tableView](self, "tableView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((shouldAllowDrop(v8, v7) & 1) != 0)
    {
      -[_UITableViewDropController setDropSession:](self, "setDropSession:", v7);
      -[_UITableViewDropController updateTargetIndexPathAndDropProposalForSession:](self, "updateTargetIndexPathAndDropProposalForSession:", v7);
      -[_UITableViewDropController dropProposal](self, "dropProposal");
      v9 = (UIDropProposal *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
LABEL_8:

        goto LABEL_9;
      }
      v10 = off_1E167B7B8;
    }
    else
    {
      -[_UITableViewDropController dropInteraction:sessionDidExit:](self, "dropInteraction:sessionDidExit:", v6, v7);
      v10 = off_1E167A750;
    }
    v9 = (UIDropProposal *)objc_msgSend(objc_alloc(*v10), "initWithDropOperation:", 0);
    goto LABEL_8;
  }
  v9 = -[UIDropProposal initWithDropOperation:]([UIDropProposal alloc], "initWithDropOperation:", 0);
LABEL_9:

  return v9;
}

- (void)dropInteraction:(id)a3 sessionDidExit:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  if (-[_UITableViewDropController defaultDropOperation](self, "defaultDropOperation"))
  {
    -[_UITableViewDropController resetAllDragState](self, "resetAllDragState");
    -[_UITableViewDropController tableView](self, "tableView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[_UITableViewDropController shouldIgnoreDrags](self, "shouldIgnoreDrags"))
      objc_msgSend(v5, "_removeDropTargetAndResetAppearance");
    objc_msgSend(v5, "_dropExited:", v6);

  }
}

- (void)dropInteraction:(id)a3 sessionDidEnd:(id)a4
{
  unint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a4;
  v5 = -[_UITableViewDropController defaultDropOperation](self, "defaultDropOperation");
  -[_UITableViewDropController dropSession](self, "dropSession");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 || v6)
  {
    -[_UITableViewDropController resetAllDragState](self, "resetAllDragState");
    -[_UITableViewDropController tableView](self, "tableView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[_UITableViewDropController shouldIgnoreDrags](self, "shouldIgnoreDrags"))
      objc_msgSend(v7, "_removeDropTargetAndResetAppearance");
    -[_UITableViewDropController setDropSession:](self, "setDropSession:", 0);
    objc_msgSend(v7, "_dropEnded:", v8);

  }
}

- (void)dropInteraction:(id)a3 performDrop:(id)a4
{
  void *v5;
  void *v6;
  _BOOL8 v7;
  unint64_t v8;
  UITableViewDropProposal *v9;
  void *v10;
  _UITableViewDropCoordinatorImpl *v11;
  id v12;

  v12 = a4;
  -[_UITableViewDropController dropProposal](self, "dropProposal");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UITableViewDropController targetIndexPath](self, "targetIndexPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[_UITableViewDropController canOnlyHandleReordering](self, "canOnlyHandleReordering");
  v8 = objc_msgSend(v5, "operation");
  if (!v6 && objc_msgSend(v5, "intent"))
  {
    v9 = -[UITableViewDropProposal initWithDropOperation:intent:]([UITableViewDropProposal alloc], "initWithDropOperation:intent:", v8, 0);

    v5 = v9;
  }
  -[_UITableViewDropController resetAllDragState](self, "resetAllDragState");
  -[_UITableViewDropController tableView](self, "tableView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[_UITableViewDropController shouldIgnoreDrags](self, "shouldIgnoreDrags"))
    objc_msgSend(v10, "_removeDropTargetAndResetAppearance");
  if (v8 >= 2)
  {
    v11 = -[_UITableViewDropCoordinatorImpl initWithDelegate:destinationIndexPath:dropProposal:session:]([_UITableViewDropCoordinatorImpl alloc], "initWithDelegate:destinationIndexPath:dropProposal:session:", self, v6, v5, v12);
    objc_msgSend(v10, "_performDrop:withDropCoordinator:forceHandleAsReorder:", v12, v11, v7);

  }
}

- (id)dropInteraction:(id)a3 previewForDroppingItem:(id)a4 withDefault:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  UITargetedDragPreview *v17;
  uint64_t v18;
  id v19;
  void *v20;

  v7 = a5;
  v8 = a4;
  -[_UITableViewDropController tableView](self, "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UITableViewDropController dragItemDropAnimations](self, "dragItemDropAnimations");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = v11;
      objc_msgSend(v12, "cell");
      v13 = objc_claimAutoreleasedReturnValue();
      if (!v13)
      {
        v20 = 0;
LABEL_15:

        goto LABEL_16;
      }
      v14 = (void *)v13;
      objc_msgSend(v9, "_beginAnimatingDropOfCell:isCanceling:", v13, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "_setDidBeginAnimation:", 1);
      objc_msgSend(v12, "previewParameters");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = [UITargetedDragPreview alloc];
      if (v16)
        v18 = -[UITargetedPreview initWithView:parameters:](v17, "initWithView:parameters:", v15, v16);
      else
        v18 = -[UITargetedDragPreview initWithView:](v17, "initWithView:", v15);
      v20 = (void *)v18;

LABEL_14:
      goto LABEL_15;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = v11;
      objc_msgSend(v19, "cellForTargetContainerInTableView:", v9);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        objc_msgSend(v9, "_beginAnimatingDropIntoCell:", v14);
        objc_msgSend(v19, "_setDidBeginAnimation:", 1);
      }
      objc_msgSend(v19, "target");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "retargetedPreviewWithTarget:", v15);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
  }
  v20 = 0;
LABEL_16:

  return v20;
}

- (void)dropInteraction:(id)a3 item:(id)a4 willAnimateDropWithAnimator:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[_UITableViewDropController dragItemDropAnimations](self, "dragItemDropAnimations");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v12, "_addClientBlocksToAnimator:", v10);
    objc_initWeak(&location, self);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __79___UITableViewDropController_dropInteraction_item_willAnimateDropWithAnimator___block_invoke;
    v13[3] = &unk_1E16C1818;
    objc_copyWeak(&v16, &location);
    v14 = v12;
    v15 = v9;
    objc_msgSend(v10, "addCompletion:", v13);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

}

- (void)dropInteraction:(id)a3 concludeDrop:(id)a4
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[_UITableViewDropController dragItemDropAnimations](self, "dragItemDropAnimations", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(v4, "objectEnumerator", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "_executeCompletionBlocks");
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (int64_t)_dropInteraction:(id)a3 dataOwnerForSession:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  int64_t v8;

  v5 = a4;
  -[_UITableViewDropController targetIndexPath](self, "targetIndexPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UITableViewDropController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "_dataOwnerForDropSession:atIndexPath:", v5, v6);

  return v8;
}

- (id)defaultAnimatorForDragItem:(id)a3
{
  id v4;
  _UITableViewDropAnimation *v5;
  void *v6;

  v4 = a3;
  v5 = -[_UITableViewDropAnimation initWithDragItem:]([_UITableViewDropAnimation alloc], "initWithDragItem:", v4);
  -[_UITableViewDropController dragItemDropAnimations](self, "dragItemDropAnimations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v5, v4);

  return v5;
}

- (id)animateDragItem:(id)a3 intoRowAtIndexPath:(id)a4 rect:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  id v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double Center;
  double v20;
  double v21;
  UIDragPreviewTarget *v22;
  UIDragPreviewTarget *v23;
  void *v24;
  _OWORD v26[3];
  __int128 v27;
  __int128 v28;
  __int128 v29;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v11 = a3;
  v12 = a4;
  -[_UITableViewDropController tableView](self, "tableView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "cellForRowAtIndexPath:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v11, "_visibleDropItemSize");
    v16 = v15;
    v18 = v17;
    Center = UIRectGetCenter(x, y, width);
    v21 = v20;
    v28 = 0u;
    v29 = 0u;
    v27 = 0u;
    _UIScaleTransformForAspectFitOrFillOfSizeInTargetSize((CGAffineTransform *)1, (uint64_t)&v27, v16, v18, width, height);
    v22 = [UIDragPreviewTarget alloc];
    v26[0] = v27;
    v26[1] = v28;
    v26[2] = v29;
    v23 = -[UIPreviewTarget initWithContainer:center:transform:](v22, "initWithContainer:center:transform:", v14, v26, Center, v21);
    -[_UITableViewDropController animateDragItem:toTarget:](self, "animateDragItem:toTarget:", v11, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[_UITableViewDropController defaultAnimatorForDragItem:](self, "defaultAnimatorForDragItem:", v11);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v24;
}

- (id)animateDragItem:(id)a3 toRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  UIDragPreviewParameters *v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  -[_UITableViewDropController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cellForRowAtIndexPath:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v8, "_dropPreviewParametersForIndexPath:", v7);
    v10 = (UIDragPreviewParameters *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      v10 = objc_alloc_init(UIDragPreviewParameters);
      objc_msgSend(v9, "_visiblePathForBackgroundConfiguration");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIPreviewParameters setVisiblePath:](v10, "setVisiblePath:", v11);

    }
    -[_UITableViewDropController animateDragItem:toCell:withPreviewParameters:](self, "animateDragItem:toCell:withPreviewParameters:", v6, v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[_UITableViewDropController defaultAnimatorForDragItem:](self, "defaultAnimatorForDragItem:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (id)animateDragItem:(id)a3 toCell:(id)a4 withPreviewParameters:(id)a5
{
  id v8;
  id v9;
  id v10;
  _UITableViewDropAnimationToCell *v11;
  void *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[_UITableViewDropAnimationToCell initWithDragItem:cell:previewParameters:]([_UITableViewDropAnimationToCell alloc], "initWithDragItem:cell:previewParameters:", v10, v9, v8);

  -[_UITableViewDropController dragItemDropAnimations](self, "dragItemDropAnimations");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKey:", v11, v10);

  return v11;
}

- (id)animateDragItem:(id)a3 toTarget:(id)a4
{
  id v6;
  id v7;
  _UITableViewDropAnimationToTarget *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  v8 = -[_UITableViewDropAnimationToTarget initWithDragItem:target:]([_UITableViewDropAnimationToTarget alloc], "initWithDragItem:target:", v7, v6);

  -[_UITableViewDropController dragItemDropAnimations](self, "dragItemDropAnimations");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v8, v7);

  return v8;
}

- (void)insertPlaceholderAtIndexPath:(id)a3 withContext:(id)a4 previewParametersProvider:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD);
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD))a5;
  -[_UITableViewDropController tableView](self, "tableView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dragItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_insertPlaceholderAtIndexPath:withContext:", v8, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__187;
  v27 = __Block_byref_object_dispose__187;
  v28 = 0;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __97___UITableViewDropController_insertPlaceholderAtIndexPath_withContext_previewParametersProvider___block_invoke;
  v19[3] = &unk_1E16B9698;
  v22 = &v23;
  v14 = v11;
  v20 = v14;
  v15 = v13;
  v21 = v15;
  objc_msgSend(v14, "performUsingPresentationValues:", v19);
  v16 = v24[5];
  if (v16)
  {
    if (v10)
    {
      v10[2](v10, v24[5]);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v24[5];
    }
    else
    {
      v17 = 0;
    }
    -[_UITableViewDropController animateDragItem:toCell:withPreviewParameters:](self, "animateDragItem:toCell:withPreviewParameters:", v12, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[_UITableViewDropController defaultAnimatorForDragItem:](self, "defaultAnimatorForDragItem:", v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v9, "_setAnimator:", v18);

  _Block_object_dispose(&v23, 8);
}

- (BOOL)deletePlaceholder:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[_UITableViewDropController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_deletePlaceholderForContext:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6 != 0;
}

- (BOOL)commitPlaceholderInsertionWithContext:(id)a3 dataSourceUpdates:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;

  v6 = a4;
  v7 = a3;
  -[_UITableViewDropController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "_commitPlaceholderInsertionWithContext:dataSourceUpdates:", v7, v6);

  return v9;
}

- (BOOL)canOnlyHandleReordering
{
  return self->_canOnlyHandleReordering;
}

- (UIDropInteraction)dropInteraction
{
  return self->_dropInteraction;
}

- (void)setTableView:(id)a3
{
  objc_storeWeak((id *)&self->_tableView, a3);
}

- (NSIndexPath)targetIndexPath
{
  return self->_targetIndexPath;
}

- (UITableViewDropProposal)dropProposal
{
  return self->_dropProposal;
}

- (UIDropSession)dropSession
{
  return self->_dropSession;
}

- (void)setDropSession:(id)a3
{
  objc_storeStrong((id *)&self->_dropSession, a3);
}

- (NSMapTable)dragItemDropAnimations
{
  return self->_dragItemDropAnimations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dragItemDropAnimations, 0);
  objc_storeStrong((id *)&self->_dropSession, 0);
  objc_storeStrong((id *)&self->_dropProposal, 0);
  objc_storeStrong((id *)&self->_targetIndexPath, 0);
  objc_destroyWeak((id *)&self->_tableView);
  objc_storeStrong((id *)&self->_dropInteraction, 0);
}

@end
