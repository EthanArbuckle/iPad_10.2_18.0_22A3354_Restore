@implementation PXPhotosDragController

- (PXPhotosDragController)initWithContentView:(id)a3 selectionManager:(id)a4 assetCollectionActionManager:(id)a5 delegate:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  PXPhotosDragController *v14;
  uint64_t v15;
  PXUpdater *updater;
  NSMutableSet *v17;
  NSMutableSet *localDragSessions;
  void *v19;
  void *v20;
  uint64_t v21;
  _UIDragSnappingFeedbackGenerator *reorderFeedbackGenerator;
  objc_super v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)PXPhotosDragController;
  v14 = -[PXPhotosDragController init](&v24, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(objc_alloc((Class)off_1E50B5E00), "initWithTarget:", v14);
    updater = v14->_updater;
    v14->_updater = (PXUpdater *)v15;

    -[PXUpdater addUpdateSelector:](v14->_updater, "addUpdateSelector:", sel__updateDraggedAssetReferences);
    -[PXUpdater addUpdateSelector:](v14->_updater, "addUpdateSelector:", sel__updateDropTarget);
    -[PXUpdater addUpdateSelector:](v14->_updater, "addUpdateSelector:", sel__updateIsDragSessionActive);
    -[PXUpdater addUpdateSelector:](v14->_updater, "addUpdateSelector:", sel__updateExcludedAssets);
    v17 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    localDragSessions = v14->_localDragSessions;
    v14->_localDragSessions = v17;

    objc_storeWeak((id *)&v14->_delegate, v13);
    objc_storeStrong((id *)&v14->_selectionManager, a4);
    objc_msgSend(v11, "registerChangeObserver:context:", v14, SelectionManagerObserverContext);
    objc_storeStrong((id *)&v14->_assetCollectionActionManager, a5);
    objc_msgSend(MEMORY[0x1E0DC4118], "defaultConfiguration");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "tweakedConfigurationForClass:usage:", objc_opt_class(), CFSTR("reorder"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC4110]), "initWithConfiguration:view:", v20, v10);
    reorderFeedbackGenerator = v14->_reorderFeedbackGenerator;
    v14->_reorderFeedbackGenerator = (_UIDragSnappingFeedbackGenerator *)v21;

    objc_storeWeak((id *)&v14->_contentView, v10);
    -[PXPhotosDragController _setupWithContentView:](v14, "_setupWithContentView:", v10);
    -[PXPhotosDragController setCanDragIn:](v14, "setCanDragIn:", 1);

  }
  return v14;
}

- (void)setCanDragIn:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (self->_canDragIn != a3)
  {
    v3 = a3;
    -[PXPhotosDragController dropInteraction](self, "dropInteraction");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[PXPhotosDragController contentView](self, "contentView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXPhotosDragController dropInteraction](self, "dropInteraction");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "removeInteraction:", v7);

      -[PXPhotosDragController setDropInteraction:](self, "setDropInteraction:", 0);
    }
    self->_canDragIn = v3;
    if (v3)
    {
      v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3780]), "initWithDelegate:", self);
      objc_msgSend(v9, "setAllowsSimultaneousDropSessions:", 1);
      -[PXPhotosDragController contentView](self, "contentView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addInteraction:", v9);

      -[PXPhotosDragController setDropInteraction:](self, "setDropInteraction:", v9);
    }
  }
}

- (void)setDropInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_dropInteraction, a3);
}

- (UIDropInteraction)dropInteraction
{
  return self->_dropInteraction;
}

- (UIView)contentView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_contentView);
}

- (void)_setupWithContentView:(id)a3
{
  UIDragInteraction *v4;
  UIDragInteraction *dragInteraction;
  id v6;

  v6 = a3;
  if (-[PXPhotosDragController canDragOut](self, "canDragOut"))
  {
    v4 = (UIDragInteraction *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3750]), "initWithDelegate:", self);
    objc_msgSend(v6, "addInteraction:", v4);
    -[UIDragInteraction setEnabled:](v4, "setEnabled:", 1);
    dragInteraction = self->_dragInteraction;
    self->_dragInteraction = v4;

  }
}

- (BOOL)canDragOut
{
  void *v2;
  char v3;

  +[PXDragAndDropSettings sharedInstance](PXDragAndDropSettings, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "dragOutEnabled");

  return v3;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v9;
  void *v10;
  id v11;

  v6 = a4;
  v9 = a3;
  if ((void *)SelectionManagerObserverContext != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosDragController.m"), 927, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  if ((v6 & 3) != 0)
  {
    v11 = v9;
    -[PXPhotosDragController _updateTrackedAssetReferences](self, "_updateTrackedAssetReferences");
    v9 = v11;
  }

}

- (void)_updateTrackedAssetReferences
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[PXPhotosDragController selectionManager](self, "selectionManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectionSnapshot");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "px_descriptionForAssertionMessage");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosDragController.m"), 435, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("self.selectionManager.selectionSnapshot.dataSource"), v15, v16);

    }
  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[PXPhotosDragController localDragSessions](self, "localDragSessions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v11++), "updateWithDataSource:", v6);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

  -[PXPhotosDragController updater](self, "updater");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "updateIfNeeded");

}

- (PXUpdater)updater
{
  return self->_updater;
}

- (PXSectionedSelectionManager)selectionManager
{
  return self->_selectionManager;
}

- (NSMutableSet)localDragSessions
{
  return self->_localDragSessions;
}

- (PXPhotosDragController)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosDragController.m"), 152, CFSTR("%s is not available as initializer"), "-[PXPhotosDragController init]");

  abort();
}

- (void)dealloc
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  objc_super v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id v13;

  -[PXPhotosDragController dragInteraction](self, "dragInteraction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosDragController dropInteraction](self, "dropInteraction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __33__PXPhotosDragController_dealloc__block_invoke;
  v11 = &unk_1E5148D08;
  v12 = v3;
  v13 = v4;
  v5 = v4;
  v6 = v3;
  px_dispatch_on_main_queue();

  v7.receiver = self;
  v7.super_class = (Class)PXPhotosDragController;
  -[PXPhotosDragController dealloc](&v7, sel_dealloc);
}

- (void)removeFromView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[PXPhotosDragController dragInteraction](self, "dragInteraction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosDragController dragInteraction](self, "dragInteraction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeInteraction:", v5);

  -[PXPhotosDragController dropInteraction](self, "dropInteraction");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosDragController dropInteraction](self, "dropInteraction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeInteraction:", v7);

}

- (id)_actionManagerForDropSession:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  objc_msgSend(v4, "localDragSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;

  -[PXPhotosDragController assetCollectionActionManager](self, "assetCollectionActionManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDropSession:", v4);

  objc_msgSend(v7, "dragSession");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDragSession:", v9);

  -[PXPhotosDragController hitAssetReference](self, "hitAssetReference");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDropTargetAssetReference:", v10);

  objc_msgSend(v8, "performerDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
    objc_msgSend(v8, "setPerformerDelegate:", self);

  return v8;
}

- (UIViewController)viewControllerForPresentation
{
  void *v3;
  void *v4;

  -[PXPhotosDragController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dragControllerViewControllerForPresentation:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIViewController *)v4;
}

- (id)scrollView
{
  void *v3;
  void *v4;

  -[PXPhotosDragController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dragController:scrollViewForAssetReference:", self, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setDraggedAssetReferences:(id)a3
{
  NSSet *v5;
  void *v6;
  NSSet *v7;
  char v8;
  NSSet *v9;

  v9 = (NSSet *)a3;
  v5 = self->_draggedAssetReferences;
  v6 = v9;
  if (v5 == v9)
    goto LABEL_4;
  v7 = v5;
  v8 = -[NSSet isEqual:](v5, "isEqual:", v9);

  if ((v8 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_draggedAssetReferences, a3);
    -[PXPhotosDragController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dragController:draggedAssetReferencesDidChange:", self, v9);
LABEL_4:

  }
}

- (void)setDropTargetAssetReference:(id)a3
{
  PXAssetReference *v5;
  void *v6;
  PXAssetReference *v7;
  char v8;
  PXAssetReference *v9;

  v9 = (PXAssetReference *)a3;
  v5 = self->_dropTargetAssetReference;
  v6 = v9;
  if (v5 == v9)
    goto LABEL_4;
  v7 = v5;
  v8 = -[PXAssetReference isEqual:](v5, "isEqual:", v9);

  if ((v8 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_dropTargetAssetReference, a3);
    -[PXPhotosDragController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dragController:dropTargetAssetReferenceDidChange:", self, v9);
LABEL_4:

  }
}

- (void)setIsDragSessionActive:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  if (self->_isDragSessionActive != a3)
  {
    v3 = a3;
    self->_isDragSessionActive = a3;
    -[PXPhotosDragController delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dragController:isDragSessionActiveDidChange:", self, v3);

  }
}

- (void)setExcludedAssets:(id)a3
{
  NSSet *v6;
  NSSet *v7;
  NSSet *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;

  v6 = (NSSet *)a3;
  v7 = self->_excludedAssets;
  if (v7 == v6)
  {

  }
  else
  {
    v8 = v7;
    v9 = -[NSSet isEqual:](v7, "isEqual:", v6);

    if ((v9 & 1) == 0)
    {
      v10 = (void *)-[NSSet mutableCopy](self->_excludedAssets, "mutableCopy");
      if (-[NSSet count](v6, "count"))
        objc_msgSend(v10, "minusSet:", v6);
      objc_storeStrong((id *)&self->_excludedAssets, a3);
      if (objc_msgSend(v10, "count"))
      {
        -[PXPhotosDragController selectionManager](self, "selectionManager");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "dataSourceManager");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = (objc_class *)objc_opt_class();
            NSStringFromClass(v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "px_descriptionForAssertionMessage");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosDragController.m"), 247, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("self.selectionManager.dataSourceManager"), v15, v16);

          }
        }
        v17[0] = MEMORY[0x1E0C809B0];
        v17[1] = 3221225472;
        v17[2] = __44__PXPhotosDragController_setExcludedAssets___block_invoke;
        v17[3] = &unk_1E5145F88;
        v18 = v10;
        objc_msgSend(v12, "performChanges:", v17);

      }
    }
  }

}

- (void)setReorderFeedbackEnabled:(BOOL)a3
{
  _UIDragSnappingFeedbackGenerator *reorderFeedbackGenerator;

  if (self->_reorderFeedbackEnabled != a3)
  {
    self->_reorderFeedbackEnabled = a3;
    reorderFeedbackGenerator = self->_reorderFeedbackGenerator;
    if (a3)
      -[_UIDragSnappingFeedbackGenerator userInteractionStarted](reorderFeedbackGenerator, "userInteractionStarted");
    else
      -[_UIDragSnappingFeedbackGenerator userInteractionEnded](reorderFeedbackGenerator, "userInteractionEnded");
  }
}

- (id)_createLocalSession
{
  PXLocalDragSession *v3;
  void *v4;

  v3 = objc_alloc_init(PXLocalDragSession);
  -[PXLocalDragSession setDelegate:](v3, "setDelegate:", self);
  -[PXPhotosDragController localDragSessions](self, "localDragSessions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v3);

  return v3;
}

- (void)_pruneLocalSessionIfFinished:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  if (v4)
  {
    v11 = v4;
    objc_msgSend(v4, "dragSession");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      objc_msgSend(v11, "dropSession");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v5)
      {
        objc_msgSend(v11, "dropActionPerformer");
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        v4 = v11;
        if (v6)
          goto LABEL_5;
        -[PXPhotosDragController localDragSessions](self, "localDragSessions");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "removeObject:", v11);

        -[PXPhotosDragController updater](self, "updater");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setNeedsUpdateOf:", sel__updateDraggedAssetReferences);

        -[PXPhotosDragController updater](self, "updater");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setNeedsUpdateOf:", sel__updateDropTarget);

        -[PXPhotosDragController updater](self, "updater");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setNeedsUpdateOf:", sel__updateIsDragSessionActive);

        -[PXPhotosDragController updater](self, "updater");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setNeedsUpdateOf:", sel__updateExcludedAssets);
      }
    }

    v4 = v11;
  }
LABEL_5:

}

- (void)_localSessionForDragSession:(id)a3 changeBlock:(id)a4
{
  void (**v6)(id, id);
  void *v7;
  id v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = (void (**)(id, id))a4;
  objc_msgSend(v10, "localContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_opt_class() || (objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_6:
    -[PXPhotosDragController _createLocalSession](self, "_createLocalSession");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDragSession:", v10);
    objc_msgSend(v10, "setLocalContext:", v8);
    goto LABEL_7;
  }
  v8 = v7;

  if (!v8)
    goto LABEL_6;
LABEL_7:
  v6[2](v6, v8);
  -[PXPhotosDragController _pruneLocalSessionIfFinished:](self, "_pruneLocalSessionIfFinished:", v8);
  -[PXPhotosDragController updater](self, "updater");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "updateIfNeeded");

}

- (void)_localSessionForDropSession:(id)a3 changeBlock:(id)a4
{
  id v6;
  void (**v7)(id, id);
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, id))a4;
  objc_msgSend(v6, "localDragSession");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = v9;

    if (v10)
      goto LABEL_17;
  }
  else
  {

  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[PXPhotosDragController localDragSessions](self, "localDragSessions", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v20;
LABEL_8:
    v15 = 0;
    while (1)
    {
      if (*(_QWORD *)v20 != v14)
        objc_enumerationMutation(v11);
      v16 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v15);
      objc_msgSend(v16, "dropSession");
      v17 = (id)objc_claimAutoreleasedReturnValue();

      if (v17 == v6)
        break;
      if (v13 == ++v15)
      {
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v13)
          goto LABEL_8;
        goto LABEL_14;
      }
    }
    v10 = v16;

    if (v10)
      goto LABEL_17;
  }
  else
  {
LABEL_14:

  }
  -[PXPhotosDragController _createLocalSession](self, "_createLocalSession");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDropSession:", v6);
LABEL_17:
  v7[2](v7, v10);
  -[PXPhotosDragController _pruneLocalSessionIfFinished:](self, "_pruneLocalSessionIfFinished:", v10);
  -[PXPhotosDragController updater](self, "updater");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "updateIfNeeded");

}

- (void)_updateDraggedAssetReferences
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[PXPhotosDragController localDragSessions](self, "localDragSessions", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v9, "isDragSessionActive"))
        {
          objc_msgSend(v9, "draggedAssetReferences");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "unionSet:", v10);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  -[PXPhotosDragController setDraggedAssetReferences:](self, "setDraggedAssetReferences:", v3);
}

- (void)_updateDropTarget
{
  PXPhotosDragController *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _BOOL4 v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  char v23;
  PXPhotosDragController *v24;
  void *v25;
  _QWORD v26[5];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v2 = self;
  v32 = *MEMORY[0x1E0C80C00];
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  -[PXPhotosDragController localDragSessions](self, "localDragSessions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (!v4)
  {

    v6 = 0;
    v18 = 0;
    goto LABEL_27;
  }
  v5 = v4;
  v24 = v2;
  v25 = 0;
  v6 = 0;
  LOBYTE(v7) = 0;
  LOBYTE(v8) = 0;
  v9 = 0;
  v10 = *(_QWORD *)v28;
  do
  {
    for (i = 0; i != v5; ++i)
    {
      if (*(_QWORD *)v28 != v10)
        objc_enumerationMutation(v3);
      v12 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
      if (v7)
      {
        v7 = 1;
        if ((v8 & 1) == 0)
          goto LABEL_8;
      }
      else
      {
        v7 = objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "dropOperation") == 3;
        if ((v8 & 1) == 0)
        {
LABEL_8:
          v8 = objc_msgSend(v12, "isDropActiveInsideView");
          goto LABEL_11;
        }
      }
      v8 = 1;
LABEL_11:
      if (objc_msgSend(v12, "identifier") <= v9)
        continue;
      objc_msgSend(v12, "dropTargetAssetReference");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {

      }
      else
      {
        objc_msgSend(v12, "hitAssetReference");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v14)
          continue;
      }
      objc_msgSend(v12, "dropTargetAssetReference");
      v15 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "hitAssetReference");
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = v6;
      v6 = (void *)v16;

      v9 = objc_msgSend(v12, "identifier");
      v25 = (void *)v15;
    }
    v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  }
  while (v5);

  if ((v7 & v8) == 1)
  {
    v2 = v24;
    v18 = v25;
    if (-[PXPhotosDragController reorderFeedbackEnabled](v24, "reorderFeedbackEnabled"))
    {
      objc_msgSend(v25, "asset");
      v19 = (id)objc_claimAutoreleasedReturnValue();
      -[PXPhotosDragController dropTargetAssetReference](v24, "dropTargetAssetReference");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "asset");
      v21 = (id)objc_claimAutoreleasedReturnValue();
      if (v19 == v21)
      {

LABEL_26:
      }
      else
      {
        v22 = v21;
        v23 = objc_msgSend(v19, "isEqual:", v21);

        if ((v23 & 1) == 0)
        {
          -[PXPhotosDragController reorderFeedbackGenerator](v24, "reorderFeedbackGenerator");
          v19 = (id)objc_claimAutoreleasedReturnValue();
          v26[0] = MEMORY[0x1E0C809B0];
          v26[1] = 3221225472;
          v26[2] = __43__PXPhotosDragController__updateDropTarget__block_invoke;
          v26[3] = &unk_1E5149198;
          v26[4] = v24;
          objc_msgSend(v19, "performFeedbackWithDelay:insideBlock:", v26, 0.05);
          goto LABEL_26;
        }
      }
    }
  }
  else
  {
    v2 = v24;
    v18 = v25;
  }
LABEL_27:
  -[PXPhotosDragController setHitAssetReference:](v2, "setHitAssetReference:", v6);
  -[PXPhotosDragController setDropTargetAssetReference:](v2, "setDropTargetAssetReference:", v18);

}

- (void)_updateIsDragSessionActive
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[PXPhotosDragController localDragSessions](self, "localDragSessions", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v3);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "isDragSessionActive") & 1) != 0)
        {
          v4 = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  -[PXPhotosDragController setIsDragSessionActive:](self, "setIsDragSessionActive:", v4);
}

- (void)_updateExcludedAssets
{
  PXPhotosDragController *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  void *v34;
  void *v35;
  objc_class *v36;
  void *v37;
  void *v38;
  void *v39;
  _BOOL4 v40;
  void *v41;
  uint64_t v42;
  void *v43;
  PXPhotosDragController *v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _QWORD v52[4];
  id v53;
  _OWORD v54[2];
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  _BYTE v66[128];
  _BYTE v67[128];
  uint64_t v68;

  v3 = self;
  v68 = *MEMORY[0x1E0C80C00];
  v40 = -[PXPhotosDragController isUpdatingExcludedAssets](self, "isUpdatingExcludedAssets");
  -[PXPhotosDragController setIsUpdatingExcludedAssets:](v3, "setIsUpdatingExcludedAssets:", 1);
  v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  -[PXPhotosDragController excludedAssets](v3, "excludedAssets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosDragController selectionManager](v3, "selectionManager");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "dataSourceManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v6;
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = (objc_class *)objc_opt_class();
      NSStringFromClass(v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "px_descriptionForAssertionMessage");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, v3, CFSTR("PXPhotosDragController.m"), 400, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("selectionManager.dataSourceManager"), v37, v38);

      v6 = v41;
    }
  }
  objc_msgSend(v6, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_alloc_init((Class)off_1E50B3668);
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  -[PXPhotosDragController localDragSessions](v3, "localDragSessions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v61, v67, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v62;
    v43 = v8;
    v44 = v3;
    v42 = *(_QWORD *)v62;
    do
    {
      v12 = 0;
      v45 = v10;
      do
      {
        if (*(_QWORD *)v62 != v11)
          objc_enumerationMutation(v8);
        v46 = v12;
        v13 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * v12);
        objc_msgSend(v13, "dropActionPerformer");
        v14 = objc_claimAutoreleasedReturnValue();
        if (v14
          && (v15 = (void *)v14,
              objc_msgSend(v13, "excludedAssets"),
              v16 = (void *)objc_claimAutoreleasedReturnValue(),
              v16,
              v15,
              v16))
        {
          objc_msgSend(v13, "excludedAssets");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "unionSet:", v17);
        }
        else
        {
          if (objc_msgSend(v13, "dropOperation") != 3)
            goto LABEL_29;
          objc_msgSend(v13, "dropTargetAssetReference");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
          {

          }
          else if (!objc_msgSend(v13, "isDropActiveInsideView"))
          {
            goto LABEL_29;
          }
          v59 = 0u;
          v60 = 0u;
          v57 = 0u;
          v58 = 0u;
          objc_msgSend(v13, "draggedAssetReferences");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
          if (v19)
          {
            v20 = v19;
            v21 = *(_QWORD *)v58;
            do
            {
              for (i = 0; i != v20; ++i)
              {
                if (*(_QWORD *)v58 != v21)
                  objc_enumerationMutation(v17);
                v23 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
                objc_msgSend(v23, "asset");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                v25 = objc_msgSend(v5, "containsObject:", v24);

                if ((v25 & 1) == 0)
                {
                  v55 = 0u;
                  v56 = 0u;
                  if (v7)
                    objc_msgSend(v7, "indexPathForAssetReference:", v23);
                  v54[0] = v55;
                  v54[1] = v56;
                  objc_msgSend(v47, "addIndexPath:", v54);
                }
                objc_msgSend(v23, "asset");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v4, "addObject:", v26);

              }
              v20 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
            }
            while (v20);
            v8 = v43;
            v3 = v44;
            v11 = v42;
            v10 = v45;
          }
        }

LABEL_29:
        v12 = v46 + 1;
      }
      while (v46 + 1 != v10);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v61, v67, 16);
    }
    while (v10);
  }

  if (objc_msgSend(v47, "count") >= 1)
  {
    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = __47__PXPhotosDragController__updateExcludedAssets__block_invoke;
    v52[3] = &unk_1E5145F88;
    v53 = v47;
    objc_msgSend(v41, "performChanges:", v52);

  }
  v27 = (void *)objc_msgSend(v4, "copy");
  -[PXPhotosDragController setExcludedAssets:](v3, "setExcludedAssets:", v27);

  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  -[PXPhotosDragController localDragSessions](v3, "localDragSessions");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v48, v65, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v49;
    do
    {
      for (j = 0; j != v30; ++j)
      {
        if (*(_QWORD *)v49 != v31)
          objc_enumerationMutation(v28);
        v33 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * j);
        -[PXPhotosDragController excludedAssets](v3, "excludedAssets");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "setExcludedAssets:", v34);

      }
      v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v48, v65, 16);
    }
    while (v30);
  }

  -[PXPhotosDragController setIsUpdatingExcludedAssets:](v3, "setIsUpdatingExcludedAssets:", v40);
}

- (id)_assetReferenceForDragItem:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "localObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "assetReference");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_createDragItemForAssetReference:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  PXDraggingItemLocalObject *v8;
  void *v9;
  char v10;
  void *v11;

  v4 = a3;
  objc_msgSend(v4, "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PXDragAndDropItemProviderForDisplayAsset(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    goto LABEL_2;
  -[PXPhotosDragController delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) == 0)
  {
    v6 = 0;
LABEL_7:
    v7 = 0;
    goto LABEL_8;
  }
  -[PXPhotosDragController delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dragController:itemProviderForAssetReference:", self, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    goto LABEL_7;
LABEL_2:
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3758]), "initWithItemProvider:", v6);
  v8 = -[PXDraggingItemLocalObject initWithAssetReference:]([PXDraggingItemLocalObject alloc], "initWithAssetReference:", v4);
  objc_msgSend(v7, "setLocalObject:", v8);

LABEL_8:
  return v7;
}

- (BOOL)_addDraggedAssetReferences:(id)a3 toLocalSession:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "draggedAssetReferences");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = v8;
    objc_msgSend(v8, "setByAddingObjectsFromSet:", v6);
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = v6;
  }
  objc_msgSend(v7, "setDraggedAssetReferences:", v10);
  -[PXPhotosDragController _updateDraggedAssetReferences](self, "_updateDraggedAssetReferences");

  return 1;
}

- (void)_removeDraggedAssetReferece:(id)a3 fromLocalSession:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "draggedAssetReferences");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v8, "mutableCopy");

  objc_msgSend(v10, "removeObject:", v7);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithSet:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDraggedAssetReferences:", v9);

  -[PXPhotosDragController _updateDraggedAssetReferences](self, "_updateDraggedAssetReferences");
}

- (void)_presentConfidentialityWarning
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", CFSTR("OK"), 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXSharingConfidentialityController confidentialityAlertWithActions:](PXSharingConfidentialityController, "confidentialityAlertWithActions:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXPhotosDragController viewControllerForPresentation](self, "viewControllerForPresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "presentViewController:animated:completion:", v5, 1, 0);

}

- (id)_draggableAssetReferenceAtLocation:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;

  y = a3.y;
  x = a3.x;
  -[PXPhotosDragController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dragController:draggableAssetReferenceAtLocation:", self, x, y);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v22;
  _QWORD v23[4];
  id v24;
  PXPhotosDragController *v25;
  id v26;
  _BYTE *v27;
  SEL v28;
  _BYTE buf[24];
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  PLDragAndDropGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v7;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v8;
    _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_DEFAULT, "dragInteraction: %@ itemsForBeginningSession: %@", buf, 0x16u);
  }

  if (!-[PXPhotosDragController canDragOut](self, "canDragOut"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosDragController.m"), 503, CFSTR("Trying to start a dragging session when Drag & Drop is not enabled."));

  }
  -[PXPhotosDragController delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dragControllerAssetReferenceForBeginningSession:", self);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    -[PXPhotosDragController contentView](self, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "locationInView:", v12);
    v14 = v13;
    v16 = v15;

    -[PXPhotosDragController _draggableAssetReferenceAtLocation:](self, "_draggableAssetReferenceAtLocation:", v14, v16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v30 = __Block_byref_object_copy__71208;
  v31 = __Block_byref_object_dispose__71209;
  v32 = (id)MEMORY[0x1E0C9AA60];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __67__PXPhotosDragController_dragInteraction_itemsForBeginningSession___block_invoke;
  v23[3] = &unk_1E5120E90;
  v18 = v11;
  v24 = v18;
  v25 = self;
  v28 = a2;
  v19 = v17;
  v26 = v19;
  v27 = buf;
  -[PXPhotosDragController _localSessionForDragSession:changeBlock:](self, "_localSessionForDragSession:changeBlock:", v8, v23);
  v20 = *(id *)(*(_QWORD *)&buf[8] + 40);

  _Block_object_dispose(buf, 8);
  return v20;
}

- (id)dragInteraction:(id)a3 itemsForAddingToSession:(id)a4 withTouchAtPoint:(CGPoint)a5
{
  CGFloat y;
  CGFloat x;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void *v13;
  id v14;
  _QWORD v16[8];
  _BYTE buf[24];
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  CGPoint v22;

  y = a5.y;
  x = a5.x;
  v21 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  PLDragAndDropGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v22.x = x;
    v22.y = y;
    NSStringFromCGPoint(v22);
    v12 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v9;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v10;
    *(_WORD *)&buf[22] = 2112;
    v18 = v12;
    _os_log_impl(&dword_1A6789000, v11, OS_LOG_TYPE_DEFAULT, "dragInteraction: %@ itemsForAddingToSession: %@ withTouchAtPoint: %@", buf, 0x20u);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v18 = __Block_byref_object_copy__71208;
  v19 = __Block_byref_object_dispose__71209;
  v20 = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __83__PXPhotosDragController_dragInteraction_itemsForAddingToSession_withTouchAtPoint___block_invoke;
  v16[3] = &unk_1E5120EB8;
  *(CGFloat *)&v16[6] = x;
  *(CGFloat *)&v16[7] = y;
  v16[4] = self;
  v16[5] = buf;
  -[PXPhotosDragController _localSessionForDragSession:changeBlock:](self, "_localSessionForDragSession:changeBlock:", v10, v16);
  if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
    v13 = *(void **)(*(_QWORD *)&buf[8] + 40);
  else
    v13 = (void *)MEMORY[0x1E0C9AA60];
  objc_storeStrong((id *)(*(_QWORD *)&buf[8] + 40), v13);
  v14 = *(id *)(*(_QWORD *)&buf[8] + 40);
  _Block_object_dispose(buf, 8);

  return v14;
}

- (void)dragInteraction:(id)a3 session:(id)a4 willAddItems:(id)a5 forInteraction:(id)a6
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  objc_class *v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  PXPhotosDragController *v24;
  id v25;

  v11 = a5;
  if (a6 == a3)
  {
    v21 = v11;
    v12 = a4;
    -[PXPhotosDragController selectionManager](self, "selectionManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dataSourceManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (objc_class *)objc_opt_class();
        NSStringFromClass(v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "px_descriptionForAssertionMessage");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosDragController.m"), 576, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("self.selectionManager.dataSourceManager"), v19, v20);

      }
    }
    objc_msgSend(v14, "dataSource");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __78__PXPhotosDragController_dragInteraction_session_willAddItems_forInteraction___block_invoke;
    v22[3] = &unk_1E5120EE0;
    v23 = v21;
    v24 = self;
    v25 = v15;
    v16 = v15;
    -[PXPhotosDragController _localSessionForDragSession:changeBlock:](self, "_localSessionForDragSession:changeBlock:", v12, v22);

    v11 = v21;
  }

}

- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  id v30;
  void *v31;
  void *v32;
  void *v34;
  id v35;
  uint8_t buf[4];
  id v37;
  __int16 v38;
  id v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  PLDragAndDropGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v37 = v8;
    v38 = 2112;
    v39 = v9;
    v40 = 2112;
    v41 = v10;
    _os_log_impl(&dword_1A6789000, v11, OS_LOG_TYPE_DEFAULT, "dragInteraction: %@ previewForLiftingItem: %@ session: %@", buf, 0x20u);
  }

  -[PXPhotosDragController viewControllerForPresentation](self, "viewControllerForPresentation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "px_isVisible");

  if (v13)
  {
    -[PXPhotosDragController _assetReferenceForDragItem:](self, "_assetReferenceForDragItem:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotosDragController delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 0;
    objc_msgSend(v15, "dragController:regionOfInterestForAssetReference:image:", self, v14, &v35);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v35;

    v18 = 0;
    if (v16 && v17)
    {
      objc_msgSend(v16, "coordinateSpace");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "rectInCoordinateSpace:", v19);
      PXPreviewImageViewForImage(v17, v16, v20, v21, v22, v23);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      -[PXPhotosDragController delegate](self, "delegate");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "dragController:scrollViewForAssetReference:", self, v14);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "rectInCoordinateSpace:", v25);
      PXRectGetCenter();
      v27 = v26;
      v29 = v28;
      v30 = objc_alloc_init(MEMORY[0x1E0DC3768]);
      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setBackgroundColor:", v31);

      v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3770]), "initWithContainer:center:", v25, v27, v29);
      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D88]), "initWithView:parameters:target:", v34, v30, v32);

    }
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)dragInteraction:(id)a3 previewForCancellingItem:(id)a4 withDefault:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  int v24;
  void *v25;
  __int128 v26;
  id v27;
  void *v28;
  _OWORD v30[3];
  uint8_t buf[32];
  __int128 v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  PLDragAndDropGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v8;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v10;
    _os_log_impl(&dword_1A6789000, v11, OS_LOG_TYPE_DEFAULT, "dragInteraction: %@ previewForCancellingItem: %@", buf, 0x16u);
  }

  -[PXPhotosDragController viewControllerForPresentation](self, "viewControllerForPresentation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "px_isVisible");

  if (v13)
  {
    -[PXPhotosDragController _assetReferenceForDragItem:](self, "_assetReferenceForDragItem:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotosDragController delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "dragController:regionOfInterestForAssetReference:image:", self, v14, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      -[PXPhotosDragController delegate](self, "delegate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "dragController:scrollViewForAssetReference:", self, v14);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "rectInCoordinateSpace:", v18);
      PXRectGetCenter();
      v20 = v19;
      v22 = v21;
      -[PXPhotosDragController delegate](self, "delegate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "dragController:shouldResizeCancelledPreviewForAssetReference:", self, v14);

      v32 = 0u;
      memset(buf, 0, sizeof(buf));
      if (v24)
      {
        objc_msgSend(v10, "size");
        objc_msgSend(v10, "size");
        PXAffineTransformMakeFromRects();
      }
      else
      {
        v26 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
        *(_OWORD *)buf = *MEMORY[0x1E0C9BAA8];
        *(_OWORD *)&buf[16] = v26;
        v32 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      }
      v27 = objc_alloc(MEMORY[0x1E0DC3770]);
      v30[0] = *(_OWORD *)buf;
      v30[1] = *(_OWORD *)&buf[16];
      v30[2] = v32;
      v28 = (void *)objc_msgSend(v27, "initWithContainer:center:transform:", v18, v30, v20, v22);
      objc_msgSend(v10, "retargetedPreviewWithTarget:", v28);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v25 = 0;
    }

  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (void)dragInteraction:(id)a3 sessionWillBegin:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __59__PXPhotosDragController_dragInteraction_sessionWillBegin___block_invoke;
  v10[3] = &unk_1E5120EE0;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[PXPhotosDragController _localSessionForDragSession:changeBlock:](self, "_localSessionForDragSession:changeBlock:", v8, v10);

}

- (void)dragInteraction:(id)a3 session:(id)a4 didEndWithOperation:(unint64_t)a5
{
  id v8;
  id v9;
  NSObject *v10;
  int v11;
  id v12;
  __int16 v13;
  id v14;
  __int16 v15;
  unint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  PLDragAndDropGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412802;
    v12 = v8;
    v13 = 2112;
    v14 = v9;
    v15 = 2048;
    v16 = a5;
    _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_DEFAULT, "dragInteraction: %@ session: %@ didEndWithOperation: %lu", (uint8_t *)&v11, 0x20u);
  }

  -[PXPhotosDragController _localSessionForDragSession:changeBlock:](self, "_localSessionForDragSession:changeBlock:", v9, &__block_literal_global_71198);
}

- (void)dragInteraction:(id)a3 item:(id)a4 willAnimateCancelWithAnimator:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  int v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  _QWORD v25[5];
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[PXPhotosDragController _assetReferenceForDragItem:](self, "_assetReferenceForDragItem:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v24 = v8;
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    -[PXPhotosDragController localDragSessions](self, "localDragSessions");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (!v13)
    {
LABEL_13:

      goto LABEL_14;
    }
    v14 = v13;
    v22 = v10;
    v23 = v9;
    v15 = 0;
    v16 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v29 != v16)
          objc_enumerationMutation(v12);
        v18 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v18, "draggedAssetReferences", v22, v23);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "containsObject:", v11);

        if (v20)
        {
          v21 = v18;

          v15 = v21;
        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v14);

    v9 = v23;
    v8 = v24;
    v10 = v22;
    if (v15)
    {
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __77__PXPhotosDragController_dragInteraction_item_willAnimateCancelWithAnimator___block_invoke;
      v25[3] = &unk_1E5120F48;
      v25[4] = self;
      v26 = v11;
      v27 = v15;
      v12 = v15;
      objc_msgSend(v22, "addCompletion:", v25);

      goto LABEL_13;
    }
  }
LABEL_14:

}

- (void)dragInteraction:(id)a3 willAnimateLiftWithAnimator:(id)a4 session:(id)a5
{
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v7 = a5;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __78__PXPhotosDragController_dragInteraction_willAnimateLiftWithAnimator_session___block_invoke;
  v9[3] = &unk_1E5147A40;
  v9[4] = self;
  v10 = v7;
  v8 = v7;
  objc_msgSend(a4, "addCompletion:", v9);

}

- (id)dragInteraction:(id)a3 sessionForAddingItems:(id)a4 withTouchAtPoint:(CGPoint)a5
{
  CGFloat y;
  CGFloat x;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t v32[128];
  uint8_t buf[4];
  id v34;
  __int16 v35;
  id v36;
  __int16 v37;
  void *v38;
  uint64_t v39;
  CGPoint v40;

  y = a5.y;
  x = a5.x;
  v39 = *MEMORY[0x1E0C80C00];
  v27 = a3;
  v9 = a4;
  PLDragAndDropGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v40.x = x;
    v40.y = y;
    NSStringFromCGPoint(v40);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v34 = v27;
    v35 = 2112;
    v36 = v9;
    v37 = 2112;
    v38 = v11;
    _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_DEFAULT, "dragInteraction: %@ sessionForAddingItems: %@ withTouchAtPoint: %@", buf, 0x20u);

  }
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[PXPhotosDragController localDragSessions](self, "localDragSessions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (!v13)
  {

LABEL_16:
    if (objc_msgSend(v9, "count") == 1)
    {
      objc_msgSend(v9, "lastObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = 0;
    }
    goto LABEL_19;
  }
  v14 = v13;
  v26 = v9;
  v15 = 0;
  v16 = *(_QWORD *)v29;
  do
  {
    for (i = 0; i != v14; ++i)
    {
      if (*(_QWORD *)v29 != v16)
        objc_enumerationMutation(v12);
      v18 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
      objc_msgSend(v18, "dragSession", v26);
      v19 = objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        v20 = (void *)v19;
        v21 = objc_msgSend(v18, "identifier");
        objc_msgSend(v15, "localContext");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "identifier");

        if (v21 > v23)
        {
          objc_msgSend(v18, "dragSession");
          v24 = objc_claimAutoreleasedReturnValue();

          v15 = (void *)v24;
        }
      }
    }
    v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  }
  while (v14);

  v9 = v26;
  if (!v15)
    goto LABEL_16;
LABEL_19:

  return v15;
}

- (unint64_t)_supportedDropOperationForSession:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  void *v17;
  objc_class *v18;
  void *v19;
  void *v20;

  v5 = a3;
  -[PXPhotosDragController selectionManager](self, "selectionManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "selectionSnapshot");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "px_descriptionForAssertionMessage");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosDragController.m"), 728, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("self.selectionManager.selectionSnapshot.dataSource"), v19, v20);

    }
  }
  -[PXPhotosDragController _actionManagerForDropSession:](self, "_actionManagerForDropSession:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[PXPhotosDragController isDragSessionActive](self, "isDragSessionActive"))
    goto LABEL_11;
  if (!objc_msgSend(v5, "allowsMoveOperation"))
    goto LABEL_11;
  if ((objc_msgSend(v8, "isSorted") & 1) != 0)
    goto LABEL_11;
  if (!objc_msgSend(v9, "canPerformActionType:", CFSTR("PXAssetCollectionActionTypeMoveAssets")))
    goto LABEL_11;
  objc_msgSend(v5, "items");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");
  v12 = objc_msgSend(v8, "totalNumberOfItems");
  -[PXPhotosDragController excludedAssets](self, "excludedAssets");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count") + v12;

  if (v11 < v14)
  {
    v15 = 3;
  }
  else
  {
LABEL_11:
    if (-[PXPhotosDragController isDragSessionActive](self, "isDragSessionActive")
      || (objc_msgSend(v9, "canPerformActionType:", CFSTR("PXAssetCollectionActionTypeDropAssets")) & 1) == 0)
    {
      v15 = 0;
    }
    else
    {
      v15 = 2;
    }
  }

  return v15;
}

- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  char v10;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  PLDragAndDropGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412546;
    v13 = v6;
    v14 = 2112;
    v15 = v7;
    _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_DEFAULT, "dropInteraction: %@ canHandleSession: %@", (uint8_t *)&v12, 0x16u);
  }

  if (-[PXPhotosDragController canDragIn](self, "canDragIn"))
  {
    -[PXPhotosDragController _actionManagerForDropSession:](self, "_actionManagerForDropSession:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "canPerformActionType:", CFSTR("PXAssetCollectionActionTypeDropAssets"));

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)dropInteraction:(id)a3 sessionDidEnter:(id)a4
{
  -[PXPhotosDragController _localSessionForDropSession:changeBlock:](self, "_localSessionForDropSession:changeBlock:", a4, &__block_literal_global_188_71193);
}

- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4
{
  id v5;
  unint64_t v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  PXPhotosDragController *v12;
  unint64_t v13;

  v5 = a4;
  v6 = -[PXPhotosDragController _supportedDropOperationForSession:](self, "_supportedDropOperationForSession:", v5);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __59__PXPhotosDragController_dropInteraction_sessionDidUpdate___block_invoke;
  v10[3] = &unk_1E5120FD8;
  v12 = self;
  v13 = v6;
  v11 = v5;
  v7 = v5;
  -[PXPhotosDragController _localSessionForDropSession:changeBlock:](self, "_localSessionForDropSession:changeBlock:", v7, v10);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3788]), "initWithDropOperation:", v6);

  return v8;
}

- (void)dropInteraction:(id)a3 sessionDidExit:(id)a4
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  char v17;
  id v18;

  v18 = a4;
  -[PXPhotosDragController contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "locationInView:", v6);
  v8 = v7;
  v10 = v9;

  -[PXPhotosDragController contentView](self, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "window");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "hitTest:withEvent:", 0, v8, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXPhotosDragController contentView](self, "contentView");
  v14 = objc_claimAutoreleasedReturnValue();
  if (v13 == (void *)v14)
  {

  }
  else
  {
    v15 = (void *)v14;
    -[PXPhotosDragController contentView](self, "contentView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v13, "isDescendantOfView:", v16);

    if ((v17 & 1) == 0)
      -[PXPhotosDragController _localSessionForDropSession:changeBlock:](self, "_localSessionForDropSession:changeBlock:", v18, &__block_literal_global_190_71190);
  }

}

- (void)dropInteraction:(id)a3 performDrop:(id)a4
{
  id v7;
  id v8;
  unint64_t v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  PXPhotosDragController *v22;
  unint64_t v23;
  SEL v24;
  _QWORD v25[4];
  id v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  id v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = -[PXPhotosDragController _supportedDropOperationForSession:](self, "_supportedDropOperationForSession:", v8);
  v10 = CFSTR("PXAssetCollectionActionTypeDropAssets");
  if (v9 == 3)
    v10 = CFSTR("PXAssetCollectionActionTypeMoveAssets");
  v11 = v10;
  -[PXPhotosDragController _actionManagerForDropSession:](self, "_actionManagerForDropSession:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "actionPerformerForActionType:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  PLDragAndDropGetLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v28 = v7;
    v29 = 2112;
    v30 = v8;
    v31 = 2112;
    v32 = v13;
    _os_log_impl(&dword_1A6789000, v14, OS_LOG_TYPE_DEFAULT, "dropInteraction:%@ performDrop:%@ actionPerformer:%@", buf, 0x20u);
  }

  v15 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __54__PXPhotosDragController_dropInteraction_performDrop___block_invoke;
  v25[3] = &unk_1E5120F90;
  v26 = v13;
  v16 = v13;
  -[PXPhotosDragController _localSessionForDropSession:changeBlock:](self, "_localSessionForDropSession:changeBlock:", v8, v25);
  v19[0] = v15;
  v19[1] = 3221225472;
  v19[2] = __54__PXPhotosDragController_dropInteraction_performDrop___block_invoke_2;
  v19[3] = &unk_1E5121090;
  v20 = v7;
  v21 = v8;
  v22 = self;
  v23 = v9;
  v24 = a2;
  v17 = v8;
  v18 = v7;
  objc_msgSend(v16, "performActionWithCompletionHandler:", v19);

}

- (id)dropInteraction:(id)a3 previewForDroppingItem:(id)a4 withDefault:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v27;
  objc_class *v28;
  void *v29;
  void *v30;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  PLDragAndDropGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v32 = v9;
    v33 = 2112;
    v34 = v10;
    _os_log_impl(&dword_1A6789000, v12, OS_LOG_TYPE_DEFAULT, "dropInteraction: %@ previewForDroppingItem: %@", buf, 0x16u);
  }

  -[PXPhotosDragController _assetReferenceForDragItem:](self, "_assetReferenceForDragItem:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
    goto LABEL_12;
  -[PXPhotosDragController selectionManager](self, "selectionManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "selectionSnapshot");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "dataSource");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (objc_class *)objc_opt_class();
      NSStringFromClass(v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "px_descriptionForAssertionMessage");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosDragController.m"), 863, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("self.selectionManager.selectionSnapshot.dataSource"), v29, v30);

    }
  }
  objc_msgSend(v16, "assetReferenceForAssetReference:", v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosDragController delegate](self, "delegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "dragController:regionOfInterestForAssetReference:image:", self, v13, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0;
  if (v19 && v17)
  {
    -[PXPhotosDragController delegate](self, "delegate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "dragController:scrollViewForAssetReference:", self, v17);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "rectInCoordinateSpace:", v22);
    PXRectGetCenter();
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3770]), "initWithContainer:center:", v22, v23, v24);

  }
  if (v20)
  {
    objc_msgSend(v11, "retargetedPreviewWithTarget:", v20);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_12:
    v25 = 0;
  }

  return v25;
}

- (void)dropInteraction:(id)a3 concludeDrop:(id)a4
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __55__PXPhotosDragController_dropInteraction_concludeDrop___block_invoke;
  v4[3] = &unk_1E5120F90;
  v4[4] = self;
  -[PXPhotosDragController _localSessionForDropSession:changeBlock:](self, "_localSessionForDropSession:changeBlock:", a4, v4);
}

- (void)dropInteraction:(id)a3 sessionDidEnd:(id)a4
{
  void *v5;
  uint64_t v6;

  -[PXPhotosDragController _localSessionForDropSession:changeBlock:](self, "_localSessionForDropSession:changeBlock:", a4, &__block_literal_global_198_71170);
  -[PXPhotosDragController localDragSessions](self, "localDragSessions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (!v6)
    -[PXPhotosDragController setReorderFeedbackEnabled:](self, "setReorderFeedbackEnabled:", 0);
}

- (BOOL)actionPerformer:(id)a3 presentViewController:(id)a4
{
  id v5;
  void *v6;

  v5 = a4;
  -[PXPhotosDragController viewControllerForPresentation](self, "viewControllerForPresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "presentViewController:animated:completion:", v5, 1, 0);

  return 1;
}

- (BOOL)actionPerformer:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5
{
  id v6;
  void *v7;

  v6 = a5;
  -[PXPhotosDragController viewControllerForPresentation](self, "viewControllerForPresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 1, v6);

  return 1;
}

- (id)undoManagerForActionPerformer:(id)a3
{
  void *v4;
  void *v5;

  -[PXPhotosDragController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dragControllerUndoManager:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)localDragSession:(id)a3 didChangeProperty:(SEL)a4
{
  if (!-[PXPhotosDragController isUpdatingExcludedAssets](self, "isUpdatingExcludedAssets", a3))
  {
    if (sel_draggedAssetReferences == a4)
      -[PXUpdater setNeedsUpdateOf:](self->_updater, "setNeedsUpdateOf:", sel__updateDraggedAssetReferences);
    if (sel_dropTargetAssetReference == a4 || sel_hitAssetReference == a4)
      -[PXUpdater setNeedsUpdateOf:](self->_updater, "setNeedsUpdateOf:", sel__updateDropTarget);
    if (sel_isDragSessionActive == a4)
    {
      -[PXUpdater setNeedsUpdateOf:](self->_updater, "setNeedsUpdateOf:", sel__updateDraggedAssetReferences);
      -[PXUpdater setNeedsUpdateOf:](self->_updater, "setNeedsUpdateOf:", sel__updateIsDragSessionActive);
    }
    if (sel_draggedAssetReferences == a4
      || sel_dropTargetAssetReference == a4
      || sel_dropActionPerformer == a4
      || sel_excludedAssets == a4
      || sel_isDropActiveInsideView == a4
      || sel_dropOperation == a4)
    {
      -[PXUpdater setNeedsUpdateOf:](self->_updater, "setNeedsUpdateOf:", sel__updateExcludedAssets);
    }
  }
}

- (PXAssetCollectionActionManager)assetCollectionActionManager
{
  return self->_assetCollectionActionManager;
}

- (PXPhotosDragControllerDelegate)delegate
{
  return (PXPhotosDragControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSSet)draggedAssetReferences
{
  return self->_draggedAssetReferences;
}

- (PXAssetReference)dropTargetAssetReference
{
  return self->_dropTargetAssetReference;
}

- (BOOL)isDragSessionActive
{
  return self->_isDragSessionActive;
}

- (BOOL)canDragIn
{
  return self->_canDragIn;
}

- (BOOL)isUpdatingExcludedAssets
{
  return self->_isUpdatingExcludedAssets;
}

- (void)setIsUpdatingExcludedAssets:(BOOL)a3
{
  self->_isUpdatingExcludedAssets = a3;
}

- (_UIDragSnappingFeedbackGenerator)reorderFeedbackGenerator
{
  return self->_reorderFeedbackGenerator;
}

- (NSSet)excludedAssets
{
  return self->_excludedAssets;
}

- (BOOL)reorderFeedbackEnabled
{
  return self->_reorderFeedbackEnabled;
}

- (PXAssetReference)hitAssetReference
{
  return self->_hitAssetReference;
}

- (void)setHitAssetReference:(id)a3
{
  objc_storeStrong((id *)&self->_hitAssetReference, a3);
}

- (UIDragInteraction)dragInteraction
{
  return self->_dragInteraction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dropInteraction, 0);
  objc_storeStrong((id *)&self->_dragInteraction, 0);
  objc_storeStrong((id *)&self->_hitAssetReference, 0);
  objc_storeStrong((id *)&self->_excludedAssets, 0);
  objc_storeStrong((id *)&self->_reorderFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->_localDragSessions, 0);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_dropTargetAssetReference, 0);
  objc_storeStrong((id *)&self->_draggedAssetReferences, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_assetCollectionActionManager, 0);
  objc_storeStrong((id *)&self->_selectionManager, 0);
  objc_destroyWeak((id *)&self->_contentView);
}

void __56__PXPhotosDragController_dropInteraction_sessionDidEnd___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setDropActionPerformer:", 0);
  objc_msgSend(v2, "setDropSession:", 0);

}

void __55__PXPhotosDragController_dropInteraction_concludeDrop___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;

  v3 = a2;
  objc_msgSend(v3, "setDropActionPerformer:", 0);
  v4 = objc_msgSend(v3, "dropOperation");

  if (v4 == 3)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "reorderFeedbackEnabled"))
    {
      objc_msgSend(*(id *)(a1 + 32), "reorderFeedbackGenerator");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "draggedObjectLanded");

    }
  }
}

uint64_t __54__PXPhotosDragController_dropInteraction_performDrop___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDropActionPerformer:", *(_QWORD *)(a1 + 32));
}

void __54__PXPhotosDragController_dropInteraction_performDrop___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  objc_class *v26;
  void *v27;
  void *v28;
  void *v29;
  objc_class *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD v35[4];
  id v36;
  id v37;
  _QWORD v38[5];
  id v39;
  uint8_t buf[4];
  uint64_t v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  __CFString *v45;
  __int16 v46;
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  PLDragAndDropGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    v9 = CFSTR("NO");
    if (a2)
      v9 = CFSTR("YES");
    v10 = v9;
    *(_DWORD *)buf = 138413058;
    v41 = v7;
    v42 = 2112;
    v43 = v8;
    v44 = 2112;
    v45 = v10;
    v46 = 2112;
    v47 = v5;
    _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_DEFAULT, "dropInteraction:%@ performDrop:%@ success:%@ error:%@", buf, 0x2Au);

  }
  if (*(_QWORD *)(a1 + 56) == 3)
  {
    objc_msgSend(*(id *)(a1 + 48), "selectionManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dataSourceManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = *(_QWORD *)(a1 + 64);
        v25 = *(_QWORD *)(a1 + 48);
        v26 = (objc_class *)objc_opt_class();
        NSStringFromClass(v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "px_descriptionForAssertionMessage");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", v24, v25, CFSTR("PXPhotosDragController.m"), 821, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("self.selectionManager.dataSourceManager"), v27, v28);

      }
    }
    v13 = MEMORY[0x1E0C809B0];
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __54__PXPhotosDragController_dropInteraction_performDrop___block_invoke_191;
    v38[3] = &unk_1E5121020;
    v38[4] = *(_QWORD *)(a1 + 48);
    v14 = v12;
    v39 = v14;
    objc_msgSend(v14, "performChanges:", v38);
    objc_msgSend(*(id *)(a1 + 48), "draggedAssetReferences");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "allObjects");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 48), "delegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "dragController:shouldSelectRearrangedAssetReferences:", *(_QWORD *)(a1 + 48), v16);

    if (v18)
    {
      objc_msgSend(*(id *)(a1 + 48), "selectionManager");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "selectionSnapshot");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "dataSource");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = *(_QWORD *)(a1 + 48);
          v34 = *(_QWORD *)(a1 + 64);
          v30 = (objc_class *)objc_opt_class();
          NSStringFromClass(v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "px_descriptionForAssertionMessage");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", v34, v33, CFSTR("PXPhotosDragController.m"), 834, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("selectionManager.selectionSnapshot.dataSource"), v31, v32);

        }
      }
      v35[0] = v13;
      v35[1] = 3221225472;
      v35[2] = __54__PXPhotosDragController_dropInteraction_performDrop___block_invoke_2_194;
      v35[3] = &unk_1E5121048;
      v36 = v16;
      v37 = v21;
      v22 = v21;
      objc_msgSend(v19, "performChanges:", v35);

    }
  }
  objc_msgSend(*(id *)(a1 + 48), "_localSessionForDropSession:changeBlock:", *(_QWORD *)(a1 + 40), &__block_literal_global_196);

}

void __54__PXPhotosDragController_dropInteraction_performDrop___block_invoke_191(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(*(id *)(a1 + 32), "hitAssetReference");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assetCollection");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;

LABEL_4:
    objc_msgSend(v8, "refreshResultsForAssetCollection:", v5);

    v7 = v8;
    goto LABEL_5;
  }
  objc_msgSend(*(id *)(a1 + 40), "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstAssetCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v8;
  if (v5)
    goto LABEL_4;
LABEL_5:

}

void __54__PXPhotosDragController_dropInteraction_performDrop___block_invoke_2_194(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  _OWORD v14[2];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    v8 = *(_QWORD *)off_1E50B7E98;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v4);
        v10 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        v15 = 0u;
        v16 = 0u;
        v11 = *(void **)(a1 + 40);
        if (v11)
        {
          objc_msgSend(v11, "indexPathForAssetReference:", v10);
          if ((_QWORD)v15 != v8 && (_QWORD)v16 != 0x7FFFFFFFFFFFFFFFLL && *((_QWORD *)&v16 + 1) == 0x7FFFFFFFFFFFFFFFLL)
          {
            v14[0] = v15;
            v14[1] = v16;
            objc_msgSend(v3, "setSelectedState:forIndexPath:", 1, v14);
          }
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
  }

}

void __54__PXPhotosDragController_dropInteraction_performDrop___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setHitAssetReference:", 0);
  objc_msgSend(v2, "setDropTargetAssetReference:", 0);
  objc_msgSend(v2, "setIsDropActiveInsideView:", 0);

}

void __57__PXPhotosDragController_dropInteraction_sessionDidExit___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setIsDropActiveInsideView:", 0);
  objc_msgSend(v2, "setHitAssetReference:", 0);
  objc_msgSend(v2, "setDropTargetAssetReference:", 0);

}

void __59__PXPhotosDragController_dropInteraction_sessionDidUpdate___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  long double v17;
  long double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  id v24;

  v24 = a2;
  objc_msgSend(v24, "setIsDropActiveInsideView:", 1);
  if (*(_QWORD *)(a1 + 48) == 3)
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "contentView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "locationInView:", v4);
    v6 = v5;
    v8 = v7;

    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dragController:dropTargetAssetReferenceForLocation:", *(_QWORD *)(a1 + 40), v6, v8);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    v11 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "scrollView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "locationInView:", v12);
    v14 = v13;
    v16 = v15;

    objc_msgSend(v24, "setScrollViewLocation:", v14, v16);
    objc_msgSend(v24, "velocity");
    v19 = hypot(v17, v18);
    +[PXDragAndDropSettings sharedInstance](PXDragAndDropSettings, "sharedInstance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "dropGestureSpeedLimit");
    v22 = v21;

    if (v19 <= v22)
    {
      v10 = v10;
      objc_msgSend(*(id *)(a1 + 40), "setReorderFeedbackEnabled:", 1);
      v23 = v10;
    }
    else
    {
      objc_msgSend(v24, "dropTargetAssetReference");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v10 = 0;
    v23 = 0;
  }
  objc_msgSend(v24, "setHitAssetReference:", v10);
  objc_msgSend(v24, "setDropTargetAssetReference:", v23);
  objc_msgSend(v24, "setDropOperation:", *(_QWORD *)(a1 + 48));

}

uint64_t __58__PXPhotosDragController_dropInteraction_sessionDidEnter___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setIsDropActiveInsideView:", 1);
}

uint64_t __78__PXPhotosDragController_dragInteraction_willAnimateLiftWithAnimator_session___block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  _QWORD v4[5];

  if (a2)
  {
    if (a2 == 1)
      return objc_msgSend(*(id *)(result + 32), "_localSessionForDragSession:changeBlock:", *(_QWORD *)(result + 40), &__block_literal_global_187);
  }
  else
  {
    v3 = *(void **)(result + 32);
    v2 = *(_QWORD *)(result + 40);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __78__PXPhotosDragController_dragInteraction_willAnimateLiftWithAnimator_session___block_invoke_3;
    v4[3] = &unk_1E5120F90;
    v4[4] = v3;
    return objc_msgSend(v3, "_localSessionForDragSession:changeBlock:", v2, v4);
  }
  return result;
}

void __78__PXPhotosDragController_dragInteraction_willAnimateLiftWithAnimator_session___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;

  if (objc_msgSend(a2, "dropOperation") == 3)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "reorderFeedbackEnabled"))
    {
      objc_msgSend(*(id *)(a1 + 32), "reorderFeedbackGenerator");
      v3 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "draggedObjectLifted");

    }
  }
}

uint64_t __78__PXPhotosDragController_dragInteraction_willAnimateLiftWithAnimator_session___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDraggedAssetReferences:", 0);
}

uint64_t __77__PXPhotosDragController_dragInteraction_item_willAnimateCancelWithAnimator___block_invoke(uint64_t result, uint64_t a2)
{
  if (!a2)
    return objc_msgSend(*(id *)(result + 32), "_removeDraggedAssetReferece:fromLocalSession:", *(_QWORD *)(result + 40), *(_QWORD *)(result + 48));
  return result;
}

void __70__PXPhotosDragController_dragInteraction_session_didEndWithOperation___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setDragSession:", 0);
  objc_msgSend(v2, "setIsDragSessionActive:", 0);

}

void __59__PXPhotosDragController_dragInteraction_sessionWillBegin___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  _BOOL4 v5;
  dispatch_time_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "draggedAssetReferences");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[PXSharingConfidentialityController confidentialWarningRequiredForAssetReferences:](PXSharingConfidentialityController, "confidentialWarningRequiredForAssetReferences:", v4);

  if (v5)
  {
    v6 = dispatch_time(0, 0);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __59__PXPhotosDragController_dragInteraction_sessionWillBegin___block_invoke_2;
    block[3] = &unk_1E5149198;
    block[4] = a1[4];
    dispatch_after(v6, MEMORY[0x1E0C80D38], block);
  }
  else
  {
    PLDragAndDropGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = a1[5];
      v9 = a1[6];
      *(_DWORD *)buf = 138412546;
      v12 = v8;
      v13 = 2112;
      v14 = v9;
      _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_DEFAULT, "dragInteraction: %@ sessionWillBegin: %@", buf, 0x16u);
    }

    objc_msgSend(v3, "setIsDragSessionActive:", 1);
  }

}

uint64_t __59__PXPhotosDragController_dragInteraction_sessionWillBegin___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_presentConfidentialityWarning");
}

void __78__PXPhotosDragController_dragInteraction_session_willAddItems_forInteraction___block_invoke(id *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = a1[4];
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(a1[5], "_assetReferenceForDragItem:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9), (_QWORD)v13);
        v10 = objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          v11 = (void *)v10;
          objc_msgSend(a1[6], "assetReferenceForAssetReference:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
          {
            objc_msgSend(v4, "addObject:", v12);

          }
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  objc_msgSend(a1[5], "_addDraggedAssetReferences:toLocalSession:", v4, v3);
}

void __83__PXPhotosDragController_dragInteraction_itemsForAddingToSession_withTouchAtPoint___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_draggableAssetReferenceAtLocation:", *(double *)(a1 + 48), *(double *)(a1 + 56));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "draggedAssetReferences");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "containsObject:", v4);

    if ((v6 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "_createDragItemForAssetReference:", v4);
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = (void *)v7;
      if (v7)
      {
        v12[0] = v7;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v11 = *(void **)(v10 + 40);
        *(_QWORD *)(v10 + 40) = v9;

      }
    }
  }

}

void __67__PXPhotosDragController_dragInteraction_itemsForBeginningSession___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  objc_class *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  uint64_t v23;
  id v24;
  id v25;
  _OWORD v26[2];

  v3 = a2;
  v4 = v3;
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(v3, "draggedAssetReferences");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "containsObject:", *(_QWORD *)(a1 + 32));

    if ((v6 & 1) == 0)
    {
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      objc_msgSend(*(id *)(a1 + 40), "selectionManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "selectionSnapshot");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "dataSource");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = *(_QWORD *)(a1 + 64);
          v17 = *(_QWORD *)(a1 + 40);
          v18 = (objc_class *)objc_opt_class();
          NSStringFromClass(v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "px_descriptionForAssertionMessage");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", v16, v17, CFSTR("PXPhotosDragController.m"), 522, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("selectionSnapshot.dataSource"), v19, v20);

        }
      }
      v11 = *(void **)(a1 + 32);
      if (v11)
        objc_msgSend(v11, "indexPath");
      else
        memset(v26, 0, sizeof(v26));
      if (objc_msgSend(v9, "isIndexPathSelected:", v26))
      {
        objc_msgSend(v9, "selectedIndexPaths");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v21[0] = MEMORY[0x1E0C809B0];
        v21[1] = 3221225472;
        v21[2] = __67__PXPhotosDragController_dragInteraction_itemsForBeginningSession___block_invoke_2;
        v21[3] = &unk_1E513AAF8;
        v13 = v10;
        v14 = *(_QWORD *)(a1 + 40);
        v22 = v13;
        v23 = v14;
        v24 = v7;
        v25 = *(id *)(a1 + 48);
        objc_msgSend(v12, "enumerateItemIndexPathsUsingBlock:", v21);

      }
      else
      {
        objc_msgSend(*(id *)(a1 + 40), "_createDragItemForAssetReference:", *(_QWORD *)(a1 + 32));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          objc_msgSend(v7, "addObject:", v12);
          objc_msgSend(*(id *)(a1 + 48), "addObject:", *(_QWORD *)(a1 + 32));
        }
      }

      if (objc_msgSend(*(id *)(a1 + 48), "count")
        && objc_msgSend(*(id *)(a1 + 40), "_addDraggedAssetReferences:toLocalSession:", *(_QWORD *)(a1 + 48), v4))
      {
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v7);
      }

    }
  }

}

void __67__PXPhotosDragController_dragInteraction_itemsForBeginningSession___block_invoke_2(uint64_t a1, _OWORD *a2)
{
  void *v3;
  __int128 v4;
  void *v5;
  void *v6;
  _OWORD v7[2];

  v3 = *(void **)(a1 + 32);
  v4 = a2[1];
  v7[0] = *a2;
  v7[1] = v4;
  objc_msgSend(v3, "assetReferenceAtItemIndexPath:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_createDragItemForAssetReference:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v6);
    objc_msgSend(*(id *)(a1 + 56), "addObject:", v5);
  }

}

uint64_t __47__PXPhotosDragController__updateExcludedAssets__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "excludeAssetsAtIndexPaths:", *(_QWORD *)(a1 + 32));
}

void __43__PXPhotosDragController__updateDropTarget__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "reorderFeedbackGenerator");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectSnapped");

}

void __44__PXPhotosDragController_setExcludedAssets___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "allObjects");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopExcludingAssets:", v4);

}

void __33__PXPhotosDragController_dealloc__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v2, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeInteraction:", *(_QWORD *)(a1 + 32));

  }
  v4 = *(void **)(a1 + 40);
  if (v4)
  {
    objc_msgSend(v4, "view");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeInteraction:", *(_QWORD *)(a1 + 40));

  }
}

@end
