@implementation PXFileBackedAssetActionManager

- (PXFileBackedAssetActionManager)initWithSelectionManager:(id)a3
{
  PXFileBackedAssetActionManager *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *performerClassByType;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXFileBackedAssetActionManager;
  v3 = -[PXAssetActionManager initWithSelectionManager:](&v7, sel_initWithSelectionManager_, a3);
  if (v3)
  {
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    performerClassByType = v3->_performerClassByType;
    v3->_performerClassByType = v4;

    -[NSMutableDictionary setObject:forKeyedSubscript:](v3->_performerClassByType, "setObject:forKeyedSubscript:", objc_opt_class(), CFSTR("PXAssetActionTypeAddToLibrary"));
  }
  return v3;
}

- (BOOL)supportsActionType:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;

  if (!a3)
    return 0;
  v4 = a3;
  -[PXFileBackedAssetActionManager performerClassByType](self, "performerClassByType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "objectForKeyedSubscript:", v4);

  return v6 != 0;
}

- (BOOL)canPerformActionType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  if (v4
    && -[PXActionManager isActionTypeAllowed:](self, "isActionTypeAllowed:", v4)
    && (-[PXFileBackedAssetActionManager performerClassByType](self, "performerClassByType"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = (void *)objc_msgSend(v5, "objectForKeyedSubscript:", v4),
        v5,
        v6))
  {
    v7 = objc_msgSend(v6, "canPerformWithActionManager:", self);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)actionPerformerForActionType:(id)a3
{
  id v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  if (-[PXFileBackedAssetActionManager canPerformActionType:](self, "canPerformActionType:", v4)
    && (-[PXFileBackedAssetActionManager performerClassByType](self, "performerClassByType"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = (objc_class *)objc_msgSend(v5, "objectForKeyedSubscript:", v4),
        v5,
        v6))
  {
    v7 = (void *)objc_msgSend([v6 alloc], "initWithActionType:", v4);
    -[PXFileBackedAssetActionManager _selectionSnapshotForPerformerClass:](self, "_selectionSnapshotForPerformerClass:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSelectionSnapshot:", v8);

    -[PXAssetActionManager selectionManager](self, "selectionManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSelectionManager:", v9);

    -[PXActionManager performerDelegate](self, "performerDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDelegate:", v10);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_selectionSnapshotForPerformerClass:(Class)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;

  -[PXAssetActionManager selectionManager](self, "selectionManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectionSnapshot");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[objc_class canPerformOnImplicitSelection](a3, "canPerformOnImplicitSelection")
    && (objc_msgSend(v5, "isAnyItemSelected") & 1) == 0)
  {
    objc_msgSend(v5, "dataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc((Class)off_1E50B4A80);
    objc_msgSend(v6, "allItemIndexPaths");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "initWithDataSource:selectedIndexPaths:", v6, v8);

    v5 = (void *)v9;
  }
  return v5;
}

- (NSMutableDictionary)performerClassByType
{
  return self->_performerClassByType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_performerClassByType, 0);
}

@end
