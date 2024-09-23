@implementation PXStackedDataSourceManager

- (PXStackedDataSourceManager)initWithDataSectionManagers:(id)a3
{
  id v4;
  PXStackedDataSourceManager *v5;
  uint64_t v6;
  NSArray *dataSectionManagers;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXStackedDataSourceManager;
  v5 = -[PXSectionedDataSourceManager init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    dataSectionManagers = v5->_dataSectionManagers;
    v5->_dataSectionManagers = (NSArray *)v6;

    -[PXStackedDataSourceManager _registerAsChangeObserverForDataSectionManagers:](v5, "_registerAsChangeObserverForDataSectionManagers:", v5->_dataSectionManagers);
  }

  return v5;
}

- (void)_registerAsChangeObserverForDataSectionManagers:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "registerChangeObserver:context:", self, PXDataSectionManagerObserverContext);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)_unregisterAsChangeObserverForDataSectionManagers:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "registerChangeObserver:context:", self, PXDataSectionManagerObserverContext);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (id)_newDataSource
{
  void *v2;
  void *v3;
  PXStackedDataSource *v4;

  -[PXStackedDataSourceManager dataSectionManagers](self, "dataSectionManagers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  PXMap();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = -[PXStackedDataSource initWithDataSections:]([PXStackedDataSource alloc], "initWithDataSections:", v3);
  return v4;
}

- (void)_updateDataSourceWithSectionChanges:(id)a3 itemChanges:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  v10 = -[PXStackedDataSourceManager _newDataSource](self, "_newDataSource");
  -[PXSectionedDataSourceManager dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "changeDetailsToDataSource:sectionChanges:itemChanges:", v10, v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXSectionedDataSourceManager setDataSource:changeDetails:](self, "setDataSource:changeDetails:", v10, v9);
}

- (void)setDataSectionManagers:(id)a3
{
  NSArray *v4;
  void *v5;
  NSArray *v6;
  char v7;
  int v8;
  NSArray *dataSectionManagers;
  void *v10;
  void *v11;
  NSArray *v12;
  NSArray *v13;
  NSArray *v14;
  void *v15;
  void *v16;
  NSArray *v17;
  NSArray *v18;
  NSArray *v19;

  v19 = (NSArray *)a3;
  v4 = self->_dataSectionManagers;
  v5 = v19;
  if (v4 == v19)
  {
LABEL_8:

    goto LABEL_9;
  }
  v6 = v4;
  v7 = -[NSArray isEqual:](v4, "isEqual:", v19);

  if ((v7 & 1) == 0)
  {
    objc_msgSend(off_1E50B1608, "changeDetailsFromArray:toArray:changedObjects:", self->_dataSectionManagers, v19, MEMORY[0x1E0C9AA60]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v5, "hasIncrementalChanges");
    dataSectionManagers = self->_dataSectionManagers;
    if (v8)
    {
      objc_msgSend(v5, "removedIndexes");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray objectsAtIndexes:](dataSectionManagers, "objectsAtIndexes:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXStackedDataSourceManager _unregisterAsChangeObserverForDataSectionManagers:](self, "_unregisterAsChangeObserverForDataSectionManagers:", v11);

      v12 = (NSArray *)-[NSArray copy](v19, "copy");
      v13 = self->_dataSectionManagers;
      self->_dataSectionManagers = v12;

      v14 = self->_dataSectionManagers;
      objc_msgSend(v5, "insertedIndexes");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray objectsAtIndexes:](v14, "objectsAtIndexes:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXStackedDataSourceManager _registerAsChangeObserverForDataSectionManagers:](self, "_registerAsChangeObserverForDataSectionManagers:", v16);

    }
    else
    {
      -[PXStackedDataSourceManager _unregisterAsChangeObserverForDataSectionManagers:](self, "_unregisterAsChangeObserverForDataSectionManagers:", self->_dataSectionManagers);
      v17 = (NSArray *)-[NSArray copy](v19, "copy");
      v18 = self->_dataSectionManagers;
      self->_dataSectionManagers = v17;

      -[PXStackedDataSourceManager _registerAsChangeObserverForDataSectionManagers:](self, "_registerAsChangeObserverForDataSectionManagers:", self->_dataSectionManagers);
    }
    if (-[PXStackedDataSourceManager initialDataSourceCreated](self, "initialDataSourceCreated"))
      -[PXStackedDataSourceManager _updateDataSourceWithSectionChanges:itemChanges:](self, "_updateDataSourceWithSectionChanges:itemChanges:", v5, 0);
    goto LABEL_8;
  }
LABEL_9:

}

- (id)createInitialDataSource
{
  -[PXStackedDataSourceManager setInitialDataSourceCreated:](self, "setInitialDataSourceCreated:", 1);
  return -[PXStackedDataSourceManager _newDataSource](self, "_newDataSource");
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if ((void *)PXDataSectionManagerObserverContext == a5
    && -[PXStackedDataSourceManager initialDataSourceCreated](self, "initialDataSourceCreated"))
  {
    v8 = v7;
    objc_msgSend(v8, "changeDetailsFromPreviousDataSection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStackedDataSourceManager dataSectionManagers](self, "dataSectionManagers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "indexOfObject:", v8);

    v12 = 0;
    if (v11 != 0x7FFFFFFFFFFFFFFFLL && v9)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v13;
      v16[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(off_1E50B1608, "changeDetailsWithNoChanges");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStackedDataSourceManager _updateDataSourceWithSectionChanges:itemChanges:](self, "_updateDataSourceWithSectionChanges:itemChanges:", v14, v12);

  }
}

- (NSArray)dataSectionManagers
{
  return self->_dataSectionManagers;
}

- (BOOL)initialDataSourceCreated
{
  return self->_initialDataSourceCreated;
}

- (void)setInitialDataSourceCreated:(BOOL)a3
{
  self->_initialDataSourceCreated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSectionManagers, 0);
}

uint64_t __44__PXStackedDataSourceManager__newDataSource__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dataSection");
}

@end
