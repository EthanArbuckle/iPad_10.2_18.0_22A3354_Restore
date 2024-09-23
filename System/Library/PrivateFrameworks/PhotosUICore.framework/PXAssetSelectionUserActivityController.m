@implementation PXAssetSelectionUserActivityController

- (void)setSelectionManager:(id)a3
{
  PXSectionedSelectionManager *v5;
  PXSectionedSelectionManager *selectionManager;
  void *v7;
  PXSectionedSelectionManager *v8;

  v5 = (PXSectionedSelectionManager *)a3;
  selectionManager = self->_selectionManager;
  if (selectionManager != v5)
  {
    v8 = v5;
    -[PXSectionedSelectionManager unregisterChangeObserver:context:](selectionManager, "unregisterChangeObserver:context:", self, SelectionManagerObservationContext_141522);
    objc_storeStrong((id *)&self->_selectionManager, a3);
    -[PXSectionedSelectionManager registerChangeObserver:context:](self->_selectionManager, "registerChangeObserver:context:", self, SelectionManagerObservationContext_141522);
    -[PXSectionedSelectionManager selectionSnapshot](self->_selectionManager, "selectionSnapshot");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXAssetSelectionUserActivityController setSelectionSnapshot:](self, "setSelectionSnapshot:", v7);

    v5 = v8;
  }

}

- (void)setActive:(BOOL)a3
{
  if (self->_active != a3)
  {
    self->_active = a3;
    -[PXAssetSelectionUserActivityController _updateActivity](self, "_updateActivity");
  }
}

- (void)_updateActivity
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (-[PXAssetSelectionUserActivityController isActive](self, "isActive")
    && -[PXAssetSelectionUserActivityController hasSelection](self, "hasSelection"))
  {
    -[PXAssetSelectionUserActivityController currentUserActivity](self, "currentUserActivity");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5920]), "initWithActivityType:", CFSTR("com.apple.mobileslideshow.assetselection"));
      objc_msgSend(v6, "setEligibleForHandoff:", 0);
      objc_msgSend(v6, "setDelegate:", self);
      objc_msgSend(v6, "becomeCurrent");
      -[PXAssetSelectionUserActivityController setCurrentUserActivity:](self, "setCurrentUserActivity:", v6);

    }
  }
  else
  {
    -[PXAssetSelectionUserActivityController currentUserActivity](self, "currentUserActivity");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[PXAssetSelectionUserActivityController currentUserActivity](self, "currentUserActivity");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "resignCurrent");

      -[PXAssetSelectionUserActivityController setCurrentUserActivity:](self, "setCurrentUserActivity:", 0);
    }
  }
}

- (BOOL)isActive
{
  return self->_active;
}

- (NSUserActivity)currentUserActivity
{
  return self->_currentUserActivity;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a4;
  v9 = a3;
  if ((void *)SelectionManagerObservationContext_141522 != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAssetSelectionUserActivityController.m"), 123, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  if ((v6 & 1) != 0)
  {
    v13 = v9;
    -[PXAssetSelectionUserActivityController selectionManager](self, "selectionManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "selectionSnapshot");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXAssetSelectionUserActivityController setSelectionSnapshot:](self, "setSelectionSnapshot:", v11);

    v9 = v13;
  }

}

- (PXSectionedSelectionManager)selectionManager
{
  return self->_selectionManager;
}

- (void)setSelectionSnapshot:(id)a3
{
  _BOOL8 v6;
  void *v7;
  void *v8;
  PXSelectionSnapshot *v9;

  v9 = (PXSelectionSnapshot *)a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAssetSelectionUserActivityController.m"), 72, CFSTR("%s must be called on the main thread"), "-[PXAssetSelectionUserActivityController setSelectionSnapshot:]");

  }
  v6 = -[PXAssetSelectionUserActivityController hasSelection](self, "hasSelection");
  os_unfair_lock_lock(&self->_snapshotLock);
  if (self->_selectionSnapshot != v9)
  {
    objc_storeStrong((id *)&self->_selectionSnapshot, a3);
    -[PXSelectionSnapshot selectedIndexPaths](v9, "selectedIndexPaths");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "itemCount") > 0;

  }
  os_unfair_lock_unlock(&self->_snapshotLock);
  -[PXAssetSelectionUserActivityController setHasSelection:](self, "setHasSelection:", v6);

}

- (BOOL)hasSelection
{
  return self->_hasSelection;
}

- (void)setHasSelection:(BOOL)a3
{
  if (self->_hasSelection != a3)
  {
    self->_hasSelection = a3;
    -[PXAssetSelectionUserActivityController _updateActivity](self, "_updateActivity");
  }
}

- (PXAssetSelectionUserActivityController)initWithSelectionManager:(id)a3
{
  id v4;
  PXAssetSelectionUserActivityController *v5;
  PXAssetSelectionUserActivityController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PXAssetSelectionUserActivityController;
  v5 = -[PXAssetSelectionUserActivityController init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_snapshotLock._os_unfair_lock_opaque = 0;
    -[PXAssetSelectionUserActivityController setSelectionManager:](v5, "setSelectionManager:", v4);
  }

  return v6;
}

- (PXAssetSelectionUserActivityController)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAssetSelectionUserActivityController.m"), 44, CFSTR("%s is not available as initializer"), "-[PXAssetSelectionUserActivityController init]");

  abort();
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[PXAssetSelectionUserActivityController currentUserActivity](self, "currentUserActivity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resignCurrent");

  -[PXAssetSelectionUserActivityController setCurrentUserActivity:](self, "setCurrentUserActivity:", 0);
  v4.receiver = self;
  v4.super_class = (Class)PXAssetSelectionUserActivityController;
  -[PXAssetSelectionUserActivityController dealloc](&v4, sel_dealloc);
}

- (PXSelectionSnapshot)selectionSnapshot
{
  os_unfair_lock_s *p_snapshotLock;
  PXSelectionSnapshot *v4;

  p_snapshotLock = &self->_snapshotLock;
  os_unfair_lock_lock(&self->_snapshotLock);
  v4 = self->_selectionSnapshot;
  os_unfair_lock_unlock(p_snapshotLock);
  return v4;
}

- (void)userActivityWillSave:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  objc_class *v20;
  void *v21;
  objc_class *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  uint8_t buf[4];
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[PXAssetSelectionUserActivityController selectionSnapshot](self, "selectionSnapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (objc_class *)objc_opt_class();
    NSStringFromClass(v22);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "px_descriptionForAssertionMessage");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAssetSelectionUserActivityController.m"), 132, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("currentSelection.dataSource"), v21, v23);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAssetSelectionUserActivityController.m"), 132, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("currentSelection.dataSource"), v21);
  }

LABEL_3:
  objc_msgSend(v6, "selectedIndexPaths");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PLUIGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v28 = objc_msgSend(v8, "itemCount");
    _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_DEFAULT, "Selection user activity has been requested with %lu assets selected", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v8, "itemCount"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __63__PXAssetSelectionUserActivityController_userActivityWillSave___block_invoke;
  v24[3] = &unk_1E5142450;
  v11 = v7;
  v25 = v11;
  v12 = v10;
  v26 = v12;
  objc_msgSend(v8, "enumerateItemIndexPathsUsingBlock:", v24);
  objc_msgSend(v5, "userInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "mutableCopy");
  v15 = v14;
  if (v14)
  {
    v16 = v14;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  v17 = v16;

  v18 = (void *)objc_msgSend(v12, "copy");
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v18, CFSTR("selectedUUIDs"));

  objc_msgSend(v5, "setUserInfo:", v17);
}

- (void)setCurrentUserActivity:(id)a3
{
  objc_storeStrong((id *)&self->_currentUserActivity, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentUserActivity, 0);
  objc_storeStrong((id *)&self->_selectionManager, 0);
  objc_storeStrong((id *)&self->_selectionSnapshot, 0);
}

void __63__PXAssetSelectionUserActivityController_userActivityWillSave___block_invoke(uint64_t a1, _OWORD *a2)
{
  void *v3;
  __int128 v4;
  void *v5;
  void *v6;
  void *v7;
  _OWORD v8[2];

  v3 = *(void **)(a1 + 32);
  v4 = a2[1];
  v8[0] = *a2;
  v8[1] = v4;
  objc_msgSend(v3, "assetAtItemIndexPath:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 40);
  objc_msgSend(v5, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v7);

}

@end
