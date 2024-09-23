@implementation _UITableViewDropCoordinatorImpl

- (_UITableViewDropCoordinatorImpl)initWithDelegate:(id)a3 destinationIndexPath:(id)a4 dropProposal:(id)a5 session:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _UITableViewDropCoordinatorImpl *v14;
  _UITableViewDropCoordinatorImpl *v15;
  void *v16;
  NSArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  _UITableViewDropItemImpl *v27;
  NSArray *items;
  id v30;
  id v31;
  _UITableViewDropCoordinatorImpl *v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id obj;
  objc_super v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v39.receiver = self;
  v39.super_class = (Class)_UITableViewDropCoordinatorImpl;
  v14 = -[_UITableViewDropCoordinatorImpl init](&v39, sel_init);
  v15 = v14;
  if (v14)
  {
    v31 = a4;
    v32 = v14;
    v33 = v12;
    v34 = a5;
    v35 = v11;
    objc_storeWeak((id *)&v14->_delegate, v10);
    v36 = v10;
    objc_msgSend(v10, "tableView");
    v37 = (id)objc_claimAutoreleasedReturnValue();
    v30 = v13;
    objc_msgSend(v13, "items");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v16, "count"));
    v17 = (NSArray *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    obj = v16;
    v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v41 != v20)
            objc_enumerationMutation(obj);
          v22 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
          objc_msgSend(v22, "_privateLocalContext");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (v23 && (objc_opt_isKindOfClass() & 1) != 0)
          {
            v24 = v23;
            objc_msgSend(v24, "tableView");
            v25 = (id)objc_claimAutoreleasedReturnValue();

            if (v25 == v37)
            {
              objc_msgSend(v24, "indexPath");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v26 = 0;
            }

          }
          else
          {
            v26 = 0;
          }
          v27 = -[_UITableViewDropItemImpl initWithDragItem:sourceIndexPath:]([_UITableViewDropItemImpl alloc], "initWithDragItem:sourceIndexPath:", v22, v26);
          -[NSArray addObject:](v17, "addObject:", v27);

        }
        v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
      }
      while (v19);
    }

    v15 = v32;
    items = v32->_items;
    v32->_items = v17;

    objc_storeStrong((id *)&v32->_destinationIndexPath, v31);
    objc_storeStrong((id *)&v32->_proposal, v34);
    objc_storeStrong((id *)&v32->_session, a6);

    v10 = v36;
    v11 = v35;
    v12 = v33;
    v13 = v30;
  }

  return v15;
}

- (NSIndexPath)destinationIndexPath
{
  NSIndexPath *translatedDestinationIndexPath;

  translatedDestinationIndexPath = self->_translatedDestinationIndexPath;
  if (!translatedDestinationIndexPath)
    translatedDestinationIndexPath = self->_destinationIndexPath;
  return translatedDestinationIndexPath;
}

- (id)_sourceIndexPaths
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[_UITableViewDropCoordinatorImpl _items](self, "_items");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "sourceIndexPath", (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
          objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (void)_translateDestinationIndexPath:(id)a3
{
  NSIndexPath *v4;
  NSIndexPath *translatedDestinationIndexPath;

  (*((void (**)(id, NSIndexPath *))a3 + 2))(a3, self->_destinationIndexPath);
  v4 = (NSIndexPath *)objc_claimAutoreleasedReturnValue();
  translatedDestinationIndexPath = self->_translatedDestinationIndexPath;
  self->_translatedDestinationIndexPath = v4;

}

- (void)_translateSourceIndexPathsOfDropItems:(id)a3
{
  id v4;
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
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[_UITableViewDropCoordinatorImpl _items](self, "_items", 0);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "_translateSourceIndexPath:", v4);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (NSArray)_items
{
  return self->_items;
}

- (NSIndexPath)_destinationIndexPath
{
  return self->_destinationIndexPath;
}

- (UITableViewDropProposal)_dropProposal
{
  return self->_proposal;
}

- (UIDropSession)_dropSession
{
  return self->_session;
}

- (id)dropItem:(id)a3 toPlaceholder:(id)a4
{
  id v7;
  id v8;
  _UITableViewDropPlaceholderContextImpl *v9;
  _UITableViewDropCoordinatorDelegate **p_delegate;
  id WeakRetained;
  void *v12;
  double v13;
  double v14;
  void *v15;
  _UITableViewDropPlaceholderContextImpl *v16;
  id v17;
  void *v18;
  void *v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITableViewDropCoordinator.m"), 282, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dragItem != nil"));

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITableViewDropCoordinator.m"), 283, CFSTR("The drag item passed to %@ must be an instance of UIDragItem"), v23);

    if (v8)
      goto LABEL_5;
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITableViewDropCoordinator.m"), 284, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("placeholder != nil"));

    goto LABEL_5;
  }
  if (!v8)
    goto LABEL_7;
LABEL_5:
  v9 = [_UITableViewDropPlaceholderContextImpl alloc];
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(v8, "reuseIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "rowHeight");
  v14 = v13;
  objc_msgSend(v8, "cellUpdateHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[_UITableViewDropPlaceholderContextImpl initWithDelegate:dragItem:reuseIdentifier:rowHeight:cellUpdateHandler:](v9, "initWithDelegate:dragItem:reuseIdentifier:rowHeight:cellUpdateHandler:", WeakRetained, v7, v12, v15, v14);

  v17 = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(v8, "insertionIndexPath");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "previewParametersProvider");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "insertPlaceholderAtIndexPath:withContext:previewParametersProvider:", v18, v16, v19);

  return v16;
}

- (id)dropItem:(id)a3 toPlaceholderInsertedAtIndexPath:(id)a4 withReuseIdentifier:(id)a5 rowHeight:(double)a6 cellUpdateHandler:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  _UITableViewDropPlaceholderContextImpl *v17;
  _UITableViewDropCoordinatorDelegate **p_delegate;
  id WeakRetained;
  _UITableViewDropPlaceholderContextImpl *v20;
  id v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITableViewDropCoordinator.m"), 295, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dragItem != nil"));

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (v14)
      goto LABEL_5;
LABEL_11:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITableViewDropCoordinator.m"), 297, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indexPath != nil"));

    if (v15)
      goto LABEL_6;
LABEL_12:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITableViewDropCoordinator.m"), 298, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reuseIdentifier != nil"));

    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITableViewDropCoordinator.m"), 296, CFSTR("The drag item passed to %@ must be an instance of UIDragItem"), v25);

  if (!v14)
    goto LABEL_11;
LABEL_5:
  if (!v15)
    goto LABEL_12;
LABEL_6:
  if (a6 <= 0.0 && a6 != -1.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITableViewDropCoordinator.m"), 299, CFSTR("Invalid row height provided for the placeholder row. Value must be greater than zero or UITableViewAutomaticDimension."));

    if (v16)
      goto LABEL_9;
LABEL_14:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITableViewDropCoordinator.m"), 300, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("cellUpdateHandler != nil"));

    goto LABEL_9;
  }
  if (!v16)
    goto LABEL_14;
LABEL_9:
  v17 = [_UITableViewDropPlaceholderContextImpl alloc];
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v20 = -[_UITableViewDropPlaceholderContextImpl initWithDelegate:dragItem:reuseIdentifier:rowHeight:cellUpdateHandler:](v17, "initWithDelegate:dragItem:reuseIdentifier:rowHeight:cellUpdateHandler:", WeakRetained, v13, v15, v16, a6);

  v21 = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(v21, "insertPlaceholderAtIndexPath:withContext:previewParametersProvider:", v14, v20, 0);

  return v20;
}

- (id)dropItem:(id)a3 intoRowAtIndexPath:(id)a4 rect:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  id v12;
  id v13;
  id WeakRetained;
  void *v15;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v12 = a3;
  v13 = a4;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITableViewDropCoordinator.m"), 317, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dragItem != nil"));

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITableViewDropCoordinator.m"), 318, CFSTR("The drag item passed to %@ must be an instance of UIDragItem"), v19);

    if (v13)
      goto LABEL_5;
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITableViewDropCoordinator.m"), 319, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indexPath != nil"));

    goto LABEL_5;
  }
  if (!v13)
    goto LABEL_7;
LABEL_5:
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "animateDragItem:intoRowAtIndexPath:rect:", v12, v13, x, y, width, height);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)dropItem:(id)a3 toRowAtIndexPath:(id)a4
{
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITableViewDropCoordinator.m"), 326, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dragItem != nil"));

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITableViewDropCoordinator.m"), 327, CFSTR("The drag item passed to %@ must be an instance of UIDragItem"), v14);

    if (v8)
      goto LABEL_5;
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITableViewDropCoordinator.m"), 328, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indexPath != nil"));

    goto LABEL_5;
  }
  if (!v8)
    goto LABEL_7;
LABEL_5:
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "animateDragItem:toRowAtIndexPath:", v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)_dropItem:(id)a3 toRowAtIndexPath:(id)a4
{
  id v4;

  v4 = -[_UITableViewDropCoordinatorImpl dropItem:toRowAtIndexPath:](self, "dropItem:toRowAtIndexPath:", a3, a4);
}

- (id)dropItem:(id)a3 toTarget:(id)a4
{
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITableViewDropCoordinator.m"), 340, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dragItem != nil"));

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITableViewDropCoordinator.m"), 341, CFSTR("The drag item passed to %@ must be an instance of UIDragItem"), v14);

    if (v8)
      goto LABEL_5;
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITableViewDropCoordinator.m"), 342, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("target != nil"));

    goto LABEL_5;
  }
  if (!v8)
    goto LABEL_7;
LABEL_5:
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "animateDragItem:toTarget:", v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)_dropItem:(id)a3 toTarget:(id)a4
{
  id v4;

  v4 = -[_UITableViewDropCoordinatorImpl dropItem:toTarget:](self, "dropItem:toTarget:", a3, a4);
}

- (void)_dropItem:(id)a3 toCell:(id)a4 withPreviewParameters:(id)a5
{
  id v9;
  id v10;
  id WeakRetained;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v9 = a4;
  v10 = a5;
  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITableViewDropCoordinator.m"), 354, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dragItem != nil"));

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITableViewDropCoordinator.m"), 355, CFSTR("The drag item passed to %@ must be an instance of UIDragItem"), v15);

    if (v9)
      goto LABEL_5;
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITableViewDropCoordinator.m"), 356, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("cell != nil"));

    goto LABEL_5;
  }
  if (!v9)
    goto LABEL_7;
LABEL_5:
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v12 = (id)objc_msgSend(WeakRetained, "animateDragItem:toCell:withPreviewParameters:", v17, v9, v10);

}

- (_UITableViewDropCoordinatorDelegate)delegate
{
  return (_UITableViewDropCoordinatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
  objc_storeStrong((id *)&self->_items, a3);
}

- (void)setDestinationIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_destinationIndexPath, a3);
}

- (NSIndexPath)_translatedDestinationIndexPath
{
  return self->_translatedDestinationIndexPath;
}

- (void)_setTranslatedDestinationIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_translatedDestinationIndexPath, a3);
}

- (UITableViewDropProposal)proposal
{
  return self->_proposal;
}

- (void)setProposal:(id)a3
{
  objc_storeStrong((id *)&self->_proposal, a3);
}

- (UIDropSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_proposal, 0);
  objc_storeStrong((id *)&self->_translatedDestinationIndexPath, 0);
  objc_storeStrong((id *)&self->_destinationIndexPath, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
