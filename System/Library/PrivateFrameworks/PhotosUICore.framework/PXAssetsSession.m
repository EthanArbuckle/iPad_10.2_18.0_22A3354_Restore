@implementation PXAssetsSession

- (PXAssetsSession)initWithDataSourceManager:(id)a3 mediaProvider:(id)a4
{
  return -[PXAssetsSession initWithDataSourceManager:mediaProvider:selectionManager:](self, "initWithDataSourceManager:mediaProvider:selectionManager:", a3, a4, 0);
}

- (PXAssetsSession)initWithDataSourceManager:(id)a3 mediaProvider:(id)a4 selectionManager:(id)a5
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  PXAssetsSession *v17;
  PXAssetsSession *v18;
  uint64_t v19;
  PXSectionedDataSource *dataSource;
  uint64_t v21;
  PXSelectionSnapshot *selectionSnapshot;
  PXSelectionSnapshot *v23;
  void *v24;
  char v25;
  void *v26;
  objc_super v28;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = v12;
  if (v12)
  {
    objc_msgSend(v12, "dataSourceManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isEqual:", v10);

    if ((v15 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAssetsSession.m"), 33, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!selectionManager || [selectionManager.dataSourceManager isEqual:dataSourceManager]"));

    }
  }
  v28.receiver = self;
  v28.super_class = (Class)PXAssetsSession;
  v17 = -[PXAssetsSession init](&v28, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_dataSourceManager, a3);
    objc_storeStrong((id *)&v18->_mediaProvider, a4);
    objc_storeStrong((id *)&v18->_selectionManager, a5);
    objc_msgSend(v10, "dataSource");
    v19 = objc_claimAutoreleasedReturnValue();
    dataSource = v18->_dataSource;
    v18->_dataSource = (PXSectionedDataSource *)v19;

    objc_msgSend(v13, "selectionSnapshot");
    v21 = objc_claimAutoreleasedReturnValue();
    selectionSnapshot = v18->_selectionSnapshot;
    v18->_selectionSnapshot = (PXSelectionSnapshot *)v21;

    v23 = v18->_selectionSnapshot;
    if (v23)
    {
      -[PXSelectionSnapshot dataSource](v23, "dataSource");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "isEqual:", v18->_dataSource);

      if ((v25 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, v18, CFSTR("PXAssetsSession.m"), 44, CFSTR("Initial data source and selection snapshot are out of sync"));

      }
    }
    -[PXSectionedDataSourceManager registerChangeObserver:context:](v18->_dataSourceManager, "registerChangeObserver:context:", v18, DataSourceManagerObservationContext_213397);
    -[PXSectionedSelectionManager registerChangeObserver:context:](v18->_selectionManager, "registerChangeObserver:context:", v18, SelectionManagerObservationContext_213398);
  }

  return v18;
}

- (PXAssetsSession)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAssetsSession.m"), 53, CFSTR("%s is not available as initializer"), "-[PXAssetsSession init]");

  abort();
}

- (void)setSelectionManager:(id)a3
{
  PXSectionedSelectionManager *v6;
  PXSectionedSelectionManager *v7;
  PXSectionedSelectionManager **p_selectionManager;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v6 = (PXSectionedSelectionManager *)a3;
  v7 = v6;
  p_selectionManager = &self->_selectionManager;
  if (self->_selectionManager != v6)
  {
    if (v6)
    {
      -[PXSectionedSelectionManager dataSourceManager](v6, "dataSourceManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXAssetsSession dataSourceManager](self, "dataSourceManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if ((v11 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAssetsSession.m"), 64, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!selectionManager || [selectionManager.dataSourceManager isEqual:self.dataSourceManager]"));

      }
    }
    -[PXSectionedSelectionManager unregisterChangeObserver:context:](*p_selectionManager, "unregisterChangeObserver:context:", self, SelectionManagerObservationContext_213398);
    objc_storeStrong((id *)&self->_selectionManager, a3);
    -[PXSectionedSelectionManager registerChangeObserver:context:](*p_selectionManager, "registerChangeObserver:context:", self, SelectionManagerObservationContext_213398);
    -[PXSectionedSelectionManager selectionSnapshot](v7, "selectionSnapshot");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      objc_msgSend(v13, "dataSource");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isEqual:", self->_dataSource);

      if ((v16 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAssetsSession.m"), 71, CFSTR("Initial selection snapshot are out of sync"));

      }
    }
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __39__PXAssetsSession_setSelectionManager___block_invoke;
    v19[3] = &unk_1E5137040;
    v20 = v14;
    v18 = v14;
    -[PXAssetsSession performChanges:](self, "performChanges:", v19);

  }
}

- (void)setDataSource:(id)a3
{
  PXSectionedDataSource *v5;
  PXSectionedDataSource *v6;
  char v7;
  PXSectionedDataSource *v8;

  v8 = (PXSectionedDataSource *)a3;
  v5 = self->_dataSource;
  if (v5 == v8)
  {

  }
  else
  {
    v6 = v5;
    v7 = -[PXSectionedDataSource isEqual:](v5, "isEqual:", v8);

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_dataSource, a3);
      -[PXAssetsSession signalChange:](self, "signalChange:", 1);
    }
  }

}

- (void)setSelectionSnapshot:(id)a3
{
  PXSelectionSnapshot *v5;
  PXSelectionSnapshot *v6;
  char v7;
  PXSelectionSnapshot *v8;

  v8 = (PXSelectionSnapshot *)a3;
  v5 = self->_selectionSnapshot;
  if (v5 == v8)
  {

  }
  else
  {
    v6 = v5;
    v7 = -[PXSelectionSnapshot isEqual:](v5, "isEqual:", v8);

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_selectionSnapshot, a3);
      -[PXAssetsSession signalChange:](self, "signalChange:", 2);
    }
  }

}

- (void)_updateDataSourceDependentProperties
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  _QWORD v9[4];
  id v10;
  id v11;

  -[PXAssetsSession dataSourceManager](self, "dataSourceManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXAssetsSession selectionManager](self, "selectionManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectionSnapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6
    || (objc_msgSend(v6, "dataSource"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v4, "isEqual:", v7),
        v7,
        v8))
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __55__PXAssetsSession__updateDataSourceDependentProperties__block_invoke;
    v9[3] = &unk_1E5137068;
    v10 = v4;
    v11 = v6;
    -[PXAssetsSession performChanges:](self, "performChanges:", v9);

  }
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v9;
  void *v11;
  id v12;

  v6 = a4;
  v9 = a3;
  if ((void *)DataSourceManagerObservationContext_213397 != a5
    && SelectionManagerObservationContext_213398 != (_QWORD)a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAssetsSession.m"), 128, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  if ((v6 & 1) != 0)
  {
    v12 = v9;
    -[PXAssetsSession _updateDataSourceDependentProperties](self, "_updateDataSourceDependentProperties");
    v9 = v12;
  }

}

- (PXSectionedDataSource)dataSource
{
  return self->_dataSource;
}

- (PXSelectionSnapshot)selectionSnapshot
{
  return self->_selectionSnapshot;
}

- (PXSectionedDataSourceManager)dataSourceManager
{
  return self->_dataSourceManager;
}

- (PXUIMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (PXSectionedSelectionManager)selectionManager
{
  return self->_selectionManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionManager, 0);
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_dataSourceManager, 0);
  objc_storeStrong((id *)&self->_selectionSnapshot, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

void __55__PXAssetsSession__updateDataSourceDependentProperties__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setDataSource:", v3);
  objc_msgSend(v4, "setSelectionSnapshot:", *(_QWORD *)(a1 + 40));

}

uint64_t __39__PXAssetsSession_setSelectionManager___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSelectionSnapshot:", *(_QWORD *)(a1 + 32));
}

@end
