@implementation PXNavigationListDataSourceBasedDataSectionManager

- (PXNavigationListDataSourceBasedDataSectionManager)initWithDataSourceManager:(id)a3
{
  id v5;
  PXNavigationListDataSourceBasedDataSectionManager *v6;
  PXNavigationListDataSourceBasedDataSectionManager *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXNavigationListDataSourceBasedDataSectionManager;
  v6 = -[PXDataSectionManager initWithChildDataSectionManagers:](&v9, sel_initWithChildDataSectionManagers_, MEMORY[0x1E0C9AA60]);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_dataSourceManager, a3);

  return v7;
}

- (PXNavigationListDataSourceBasedDataSectionManager)initWithChildDataSectionManagers:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXNavigationListDataSourceBasedDataSectionManager.m"), 43, CFSTR("%s is not available as initializer"), "-[PXNavigationListDataSourceBasedDataSectionManager initWithChildDataSectionManagers:]");

  abort();
}

- (BOOL)allowsEmptyDataSection
{
  return !-[PXNavigationListDataSourceBasedDataSectionManager isHiddenWhenEmpty](self, "isHiddenWhenEmpty")
      && -[PXNavigationListDataSourceBasedDataSectionManager isEnabled](self, "isEnabled");
}

- (void)setEnabled:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  if (self->_enabled != a3)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __64__PXNavigationListDataSourceBasedDataSectionManager_setEnabled___block_invoke;
    v3[3] = &unk_1E5142B28;
    v3[4] = self;
    v4 = a3;
    -[PXNavigationListDataSourceBasedDataSectionManager performChanges:](self, "performChanges:", v3);
  }
}

- (void)setHiddenWhenEmpty:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  if (self->_hiddenWhenEmpty != a3)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __72__PXNavigationListDataSourceBasedDataSectionManager_setHiddenWhenEmpty___block_invoke;
    v3[3] = &unk_1E5142B28;
    v3[4] = self;
    v4 = a3;
    -[PXNavigationListDataSourceBasedDataSectionManager performChanges:](self, "performChanges:", v3);
  }
}

- (BOOL)isDataSourceEmpty
{
  void *v2;
  char v3;

  -[PXNavigationListDataSourceBasedDataSectionManager dataSource](self, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsAnyItems") ^ 1;

  return v3;
}

- (BOOL)isDataSectionVisible
{
  _BOOL4 v3;

  v3 = -[PXNavigationListDataSourceBasedDataSectionManager isEnabled](self, "isEnabled");
  if (v3)
  {
    if (-[PXNavigationListDataSourceBasedDataSectionManager isHiddenWhenEmpty](self, "isHiddenWhenEmpty"))
      LOBYTE(v3) = !-[PXNavigationListDataSourceBasedDataSectionManager isDataSourceEmpty](self, "isDataSourceEmpty");
    else
      LOBYTE(v3) = 1;
  }
  return v3;
}

- (void)_updateVisibilityViaDataSectionIfNecessary
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  void *v8;
  void *v9;

  -[PXDataSectionManager dataSectionIfCreated](self, "dataSectionIfCreated");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v9 = v3;
    if (objc_msgSend(v3, "count")
      || !-[PXNavigationListDataSourceBasedDataSectionManager isDataSectionVisible](self, "isDataSectionVisible"))
    {
      v6 = objc_msgSend(v9, "count");
      v4 = v9;
      if (v6 < 1)
        goto LABEL_10;
      v7 = -[PXNavigationListDataSourceBasedDataSectionManager isDataSectionVisible](self, "isDataSectionVisible");
      v4 = v9;
      if (v7)
        goto LABEL_10;
      objc_msgSend(off_1E50B1608, "changeDetailsWithRemovedIndexRange:", 0, 1);
      v5 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(off_1E50B1608, "changeDetailsWithInsertedIndexRange:", 0, 1);
      v5 = objc_claimAutoreleasedReturnValue();
    }
    v8 = (void *)v5;
    v4 = v9;
    if (v5)
    {
      -[PXDataSectionManager updateDataSectionWithChangeDetails:](self, "updateDataSectionWithChangeDetails:", v5);

      v4 = v9;
    }
  }
LABEL_10:

}

- (void)_handleDataSourceChange
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[PXNavigationListDataSourceBasedDataSectionManager dataSourceManager](self, "dataSourceManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataSource");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[PXNavigationListDataSourceBasedDataSectionManager dataSourceManager](self, "dataSourceManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXNavigationListDataSourceBasedDataSectionManager dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "changeDetailsFromDataSource:toDataSource:", v5, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "sectionChanges");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXDataSectionManager updateDataSectionWithChangeDetails:](self, "updateDataSectionWithChangeDetails:", v7);

}

- (id)createDataSection
{
  void *v3;
  PXSectionedDataSource *v4;
  PXSectionedDataSource *dataSource;
  void *v6;
  PXNavigationListDataSection *v7;
  PXCollectionsDataSection *v8;

  -[PXNavigationListDataSourceBasedDataSectionManager dataSourceManager](self, "dataSourceManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataSource");
  v4 = (PXSectionedDataSource *)objc_claimAutoreleasedReturnValue();
  dataSource = self->_dataSource;
  self->_dataSource = v4;

  -[PXNavigationListDataSourceBasedDataSectionManager dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PXNavigationListDataSourceBasedDataSectionManager isDataSectionVisible](self, "isDataSectionVisible")
    && objc_msgSend(v6, "containsAnyItems"))
  {
    -[PXNavigationListDataSourceBasedDataSectionManager dataSectionFromDataSource:](self, "dataSectionFromDataSource:", v6);
    v7 = (PXNavigationListDataSection *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = objc_alloc_init(PXCollectionsDataSection);
    v7 = -[PXNavigationListDataSection initWithCollectionsDataSection:]([PXNavigationListDataSection alloc], "initWithCollectionsDataSection:", v8);

  }
  return v7;
}

- (id)dataSectionFromDataSource:(id)a3
{
  id v5;
  void *v6;
  objc_class *v7;
  void *v8;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXNavigationListDataSourceBasedDataSectionManager.m"), 131, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXNavigationListDataSourceBasedDataSectionManager dataSectionFromDataSource:]", v8);

  abort();
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  if ((a4 & 1) != 0 && (void *)DataSourceManagerObservableContext == a5)
    -[PXNavigationListDataSourceBasedDataSectionManager _handleDataSourceChange](self, "_handleDataSourceChange", a3);
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (PXDataSectionEnablementForwarder)enablementForwarder
{
  return self->_enablementForwarder;
}

- (void)setEnablementForwarder:(id)a3
{
  objc_storeStrong((id *)&self->_enablementForwarder, a3);
}

- (PXSectionedDataSourceManager)dataSourceManager
{
  return self->_dataSourceManager;
}

- (BOOL)isHiddenWhenEmpty
{
  return self->_hiddenWhenEmpty;
}

- (PXSectionedDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_dataSourceManager, 0);
  objc_storeStrong((id *)&self->_enablementForwarder, 0);
}

uint64_t __72__PXNavigationListDataSourceBasedDataSectionManager_setHiddenWhenEmpty___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 145) = *(_BYTE *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "signalChange:", 2);
  return objc_msgSend(*(id *)(a1 + 32), "_updateVisibilityViaDataSectionIfNecessary");
}

uint64_t __64__PXNavigationListDataSourceBasedDataSectionManager_setEnabled___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 144) = *(_BYTE *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "signalChange:", 4);
  return objc_msgSend(*(id *)(a1 + 32), "_updateVisibilityViaDataSectionIfNecessary");
}

@end
