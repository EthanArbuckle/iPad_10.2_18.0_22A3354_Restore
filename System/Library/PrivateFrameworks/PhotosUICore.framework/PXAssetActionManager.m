@implementation PXAssetActionManager

- (PXAssetActionManager)initWithSelectionManager:(id)a3
{
  id v5;
  PXAssetActionManager *v6;
  PXAssetActionManager *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXAssetActionManager;
  v6 = -[PXAssetActionManager init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_selectionManager, a3);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_excludedContextMenuActionTypes, 0);
  objc_storeStrong((id *)&self->_objectReference, 0);
  objc_storeStrong((id *)&self->_selectionManager, 0);
}

- (PXAssetActionManager)initWithSelectedObjectReference:(id)a3 dataSourceManager:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  PXAssetActionManager *v11;
  _QWORD v13[4];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;

  v6 = a3;
  v16 = 0u;
  v17 = 0u;
  v7 = a4;
  objc_msgSend(v7, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "indexPathForObjectReference:", v6);
  }
  else
  {
    v16 = 0u;
    v17 = 0u;
  }

  v10 = (void *)objc_msgSend(objc_alloc((Class)off_1E50B4A40), "initWithDataSourceManager:", v7);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __74__PXAssetActionManager_initWithSelectedObjectReference_dataSourceManager___block_invoke;
  v13[3] = &__block_descriptor_64_e37_v16__0___PXMutableSelectionManager__8l;
  v14 = v16;
  v15 = v17;
  objc_msgSend(v10, "performChanges:", v13);
  v11 = -[PXAssetActionManager initWithSelectionManager:](self, "initWithSelectionManager:", v10);

  return v11;
}

- (PXAssetActionManager)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAssetActionManager.m"), 152, CFSTR("%s is not available as initializer"), "-[PXAssetActionManager init]");

  abort();
}

- (BOOL)canPerformAssetVariationActions
{
  return 0;
}

- (id)actionPerformerForActionType:(id)a3
{
  return 0;
}

- (BOOL)shouldEnableActionType:(id)a3 onAsset:(id)a4
{
  return 1;
}

- (BOOL)canPerformActionType:(id)a3
{
  return 0;
}

- (id)localizedTitleForActionType:(id)a3 useCase:(unint64_t)a4
{
  return 0;
}

- (id)systemImageNameForActionType:(id)a3
{
  return 0;
}

- (id)contextMenuElementsWithHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PXAssetActionManager excludedContextMenuActionTypes](self, "excludedContextMenuActionTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXAssetActionMenuBuilder pxMenuElementsForActionManager:excludedActionTypes:handler:](PXAssetActionMenuBuilder, "pxMenuElementsForActionManager:excludedActionTypes:handler:", self, v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (PXSelectionSnapshot)effectiveSelectionSnapshot
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  char v11;
  id v12;
  uint64_t v13;
  uint64_t v15;
  _BYTE v16[32];
  uint64_t v17;

  -[PXAssetActionManager selectionManager](self, "selectionManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectionSnapshot");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXAssetActionManager objectReference](self, "objectReference");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    objc_msgSend(v4, "dataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "identifier");
    objc_msgSend(v6, "indexPath");
    if (v8 == v17
      || (objc_msgSend(v7, "objectReferenceForObjectReference:", v6),
          v9 = objc_claimAutoreleasedReturnValue(),
          v6,
          (v6 = (void *)v9) != 0))
    {
      objc_msgSend(v4, "selectedIndexPaths");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "indexPath");
      v11 = objc_msgSend(v10, "containsIndexPath:", v16);

      if ((v11 & 1) == 0)
      {
        v12 = objc_alloc((Class)off_1E50B4A80);
        objc_msgSend(v6, "indexPath");
        v13 = objc_msgSend(v12, "initWithDataSource:selectedIndexPath:", v7, &v15);

        v4 = (void *)v13;
      }
    }

  }
  return (PXSelectionSnapshot *)v4;
}

- (void)executeActionForActionType:(id)a3 sender:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  objc_class *v13;
  void *v14;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (objc_class *)objc_opt_class();
  NSStringFromClass(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAssetActionManager.m"), 206, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXAssetActionManager executeActionForActionType:sender:completionHandler:]", v14);

  abort();
}

- (void)executeActionForActionType:(id)a3 withCompletionHandler:(id)a4
{
  -[PXAssetActionManager executeActionForActionType:sender:completionHandler:](self, "executeActionForActionType:sender:completionHandler:", a3, 0, a4);
}

- (PXSectionedSelectionManager)selectionManager
{
  return self->_selectionManager;
}

- (void)setSelectionManager:(id)a3
{
  objc_storeStrong((id *)&self->_selectionManager, a3);
}

- (PXSectionedObjectReference)objectReference
{
  return self->_objectReference;
}

- (void)setObjectReference:(id)a3
{
  objc_storeStrong((id *)&self->_objectReference, a3);
}

- (NSArray)excludedContextMenuActionTypes
{
  return self->_excludedContextMenuActionTypes;
}

- (void)setExcludedContextMenuActionTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

uint64_t __74__PXAssetActionManager_initWithSelectedObjectReference_dataSourceManager___block_invoke(uint64_t a1, void *a2)
{
  __int128 v2;
  _OWORD v4[2];

  v2 = *(_OWORD *)(a1 + 48);
  v4[0] = *(_OWORD *)(a1 + 32);
  v4[1] = v2;
  return objc_msgSend(a2, "setSelectedIndexPath:", v4);
}

@end
