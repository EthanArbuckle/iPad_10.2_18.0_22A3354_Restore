@implementation _UIDropSessionImpl

- (_UIDropSessionImpl)initWithSessionDestination:(id)a3
{
  id v6;
  _UIDropSessionImpl *v7;
  _UIDropSessionImpl *v8;
  uint64_t v9;
  UIDragSession *localDragSession;
  void *v12;
  objc_super v13;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIDragSession.m"), 472, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sessionDestination"));

  }
  v13.receiver = self;
  v13.super_class = (Class)_UIDropSessionImpl;
  v7 = -[_UIDropSessionImpl init](&v13, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_sessionDestination, a3);
    v8->_progressIndicatorStyle = 1;
    -[_UIInternalDraggingSessionDestination setProgressIndicatorStyle:](v8->_sessionDestination, "setProgressIndicatorStyle:", 1);
    +[_UIDragSessionImpl _localDragSessionForSessionDestination:](_UIDragSessionImpl, "_localDragSessionForSessionDestination:", v6);
    v9 = objc_claimAutoreleasedReturnValue();
    localDragSession = v8->_localDragSession;
    v8->_localDragSession = (UIDragSession *)v9;

  }
  return v8;
}

- (NSProgress)progress
{
  return -[_UIInternalDraggingSessionDestination progress](self->_sessionDestination, "progress");
}

- (NSArray)items
{
  NSArray *items;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  NSArray *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  NSArray *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  items = self->_items;
  if (!items
    || (v4 = -[NSArray count](items, "count"),
        -[_UIInternalDraggingSessionDestination internalItems](self->_sessionDestination, "internalItems"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "count"),
        v5,
        v4 != v6))
  {
    v7 = objc_alloc(MEMORY[0x1E0C99DE8]);
    -[_UIInternalDraggingSessionDestination internalItems](self->_sessionDestination, "internalItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (NSArray *)objc_msgSend(v7, "initWithCapacity:", objc_msgSend(v8, "count"));

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[_UIInternalDraggingSessionDestination internalItems](self->_sessionDestination, "internalItems", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v19 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(v15, "_setDragDropSession:", self);
          -[NSArray addObject:](v9, "addObject:", v15);
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v12);
    }

    v16 = self->_items;
    self->_items = v9;

  }
  return self->_items;
}

- (CGPoint)locationInView:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGPoint result;

  v4 = a3;
  if (!v4)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("View must be non-null"));
  -[_UIInternalDraggingSessionDestination draggingLocationInCoordinateSpace:](self->_sessionDestination, "draggingLocationInCoordinateSpace:", v4);
  v6 = v5;
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.y = v10;
  result.x = v9;
  return result;
}

- (BOOL)allowsMoveOperation
{
  return (-[_UIInternalDraggingSessionDestination sourceOperationMask](self->_sessionDestination, "sourceOperationMask") >> 4) & 1;
}

- (BOOL)isRestrictedToDraggingApplication
{
  return (-[_UIInternalDraggingSessionDestination outsideAppSourceOperationMask](self->_sessionDestination, "outsideAppSourceOperationMask") & 1) == 0;
}

- (BOOL)hasItemsConformingToTypeIdentifiers:(id)a3
{
  id v4;
  void *v5;
  char hasItemsConformingToTypeIdentifiers;

  v4 = a3;
  -[_UIDropSessionImpl items](self, "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  hasItemsConformingToTypeIdentifiers = _hasItemsConformingToTypeIdentifiers(v5, v4);

  return hasItemsConformingToTypeIdentifiers;
}

- (BOOL)canLoadObjectsOfClass:(Class)a3
{
  void *v4;

  -[_UIDropSessionImpl items](self, "items");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = _canLoadObjectsOfClass(v4, (uint64_t)a3);

  return (char)a3;
}

- (CGSize)_previewSizeForVisibleItem:(id)a3
{
  double v3;
  double v4;
  CGSize result;

  objc_msgSend(a3, "_visibleDropItemSize");
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGPoint)_previewCenterForVisibleItem:(id)a3 inView:(id)a4
{
  id v7;
  id v8;
  _UIInternalDraggingSessionDestination *sessionDestination;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  CGPoint result;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIDragSession.m"), 568, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("view"));

  }
  sessionDestination = self->_sessionDestination;
  objc_msgSend(v8, "coordinateSpace");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIInternalDraggingSessionDestination previewCenterForVisibleItem:inCoordinateSpace:](sessionDestination, "previewCenterForVisibleItem:inCoordinateSpace:", v7, v10);
  v12 = v11;
  v14 = v13;

  v15 = v12;
  v16 = v14;
  result.y = v16;
  result.x = v15;
  return result;
}

- (void)setProgressIndicatorStyle:(unint64_t)a3
{
  self->_progressIndicatorStyle = a3;
  -[_UIInternalDraggingSessionDestination setProgressIndicatorStyle:](self->_sessionDestination, "setProgressIndicatorStyle:");
}

- (id)loadObjectsOfClass:(Class)a3 completion:(id)a4
{
  id v7;
  void *v8;
  void *v10;

  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIDragSession.m"), 585, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion != nil"));

  }
  -[_UIDropSessionImpl _createItemsOfClass:synchronouslyIfPossible:completion:](self, "_createItemsOfClass:synchronouslyIfPossible:completion:", a3, 0, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)requestVisibleItems:(id)a3
{
  id v4;
  void *v5;
  _UIInternalDraggingSessionDestination *sessionDestination;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    sessionDestination = self->_sessionDestination;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __42___UIDropSessionImpl_requestVisibleItems___block_invoke;
    v7[3] = &unk_1E16BB6E0;
    v7[4] = self;
    v8 = v4;
    -[_UIInternalDraggingSessionDestination requestVisibleItems:](sessionDestination, "requestVisibleItems:", v7);

  }
}

- (unsigned)_sessionIdentifier
{
  return -[_UIInternalDraggingSessionDestination sessionIdentifier](self->_sessionDestination, "sessionIdentifier");
}

- (BOOL)_drivenByPointer
{
  return -[_UIInternalDraggingSessionDestination drivenByPointer](self->_sessionDestination, "drivenByPointer");
}

- (unint64_t)_operationMask
{
  return -[_UIInternalDraggingSessionDestination draggingSourceOperationMask](self->_sessionDestination, "draggingSourceOperationMask");
}

- (id)_internalSession
{
  return self->_sessionDestination;
}

- (id)_createItemsOfClass:(Class)a3 synchronouslyIfPossible:(BOOL)a4 completion:(id)a5
{
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  dispatch_time_t v24;
  NSObject *v25;
  void *v26;
  void *v27;
  _BOOL4 v29;
  id v30;
  void *v31;
  _QWORD block[4];
  NSObject *v33;
  id v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _QWORD v40[4];
  id v41;
  NSObject *v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v29 = a4;
  v50 = *MEMORY[0x1E0C80C00];
  v30 = a5;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = dispatch_group_create();
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  -[_UIDropSessionImpl items](self, "items");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = *(_QWORD *)v45;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v45 != v13)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * v14), "itemProvider");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v15, "canLoadObjectOfClass:", a3))
        {
          dispatch_group_enter(v8);
          v40[0] = MEMORY[0x1E0C809B0];
          v40[1] = 3221225472;
          v40[2] = __77___UIDropSessionImpl__createItemsOfClass_synchronouslyIfPossible_completion___block_invoke;
          v40[3] = &unk_1E16C4398;
          v16 = v7;
          v41 = v7;
          v43 = v12;
          v42 = v8;
          objc_msgSend(v15, "loadObjectOfClass:completionHandler:", a3, v40);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
            objc_msgSend(v31, "addObject:", v17);
          ++v12;

          v7 = v16;
        }

        ++v14;
      }
      while (v11 != v14);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
    }
    while (v11);
  }

  objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", objc_msgSend(v31, "count"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v19 = v31;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v37;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v37 != v22)
          objc_enumerationMutation(v19);
        objc_msgSend(v18, "addChild:withPendingUnitCount:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v23++), 1);
      }
      while (v21 != v23);
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
    }
    while (v21);
  }

  if (v29 && (v24 = dispatch_time(0, 50000000), !dispatch_group_wait(v8, v24)))
  {
    arrayOfItemsFromDictionaryOfItemsByIndex(v7);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v30;
    (*((void (**)(id, void *))v30 + 2))(v30, v27);
  }
  else
  {
    dispatch_get_global_queue(25, 0);
    v25 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __77___UIDropSessionImpl__createItemsOfClass_synchronouslyIfPossible_completion___block_invoke_2;
    block[3] = &unk_1E16BAD68;
    v33 = v8;
    v34 = v7;
    v26 = v30;
    v35 = v30;
    dispatch_async(v25, block);

    v27 = v33;
  }

  return v18;
}

- (void)_itemsNeedUpdate:(id)a3
{
  _markItemsForUpdate(a3, self);
}

- (BOOL)_allowsItemsToUpdate
{
  void *v2;
  BOOL v3;

  -[_UIDropSessionImpl _internalSession](self, "_internalSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (int64_t)_dataOwner
{
  return -[_UIInternalDraggingSessionDestination sourceDataOwner](self->_sessionDestination, "sourceDataOwner");
}

- (UIDragSession)localDragSession
{
  return self->_localDragSession;
}

- (unint64_t)progressIndicatorStyle
{
  return self->_progressIndicatorStyle;
}

- (_UIInternalDraggingSessionDestination)sessionDestination
{
  return self->_sessionDestination;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionDestination, 0);
  objc_storeStrong((id *)&self->_localDragSession, 0);
  objc_storeStrong((id *)&self->_items, 0);
}

@end
