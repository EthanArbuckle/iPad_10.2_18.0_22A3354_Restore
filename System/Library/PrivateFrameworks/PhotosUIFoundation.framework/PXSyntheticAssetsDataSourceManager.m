@implementation PXSyntheticAssetsDataSourceManager

- (PXSyntheticAssetsDataSourceManager)initWithConfigurationBlock:(id)a3
{
  id v4;
  PXSyntheticAssetsDataSourceManager *v5;
  PXSyntheticAssetsDataSource *v6;
  PXSyntheticAssetsDataSource *initialDataSource;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXSyntheticAssetsDataSourceManager;
  v5 = -[PXSectionedDataSourceManager init](&v9, sel_init);
  if (v5)
  {
    v6 = -[PXSyntheticAssetsDataSource initWithConfigurationBlock:]([PXSyntheticAssetsDataSource alloc], "initWithConfigurationBlock:", v4);
    initialDataSource = v5->_initialDataSource;
    v5->_initialDataSource = v6;

  }
  return v5;
}

- (PXSyntheticAssetsDataSourceManager)init
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSyntheticAssetsDataSourceManager.m"), 40, CFSTR("%s is not available as initializer"), "-[PXSyntheticAssetsDataSourceManager init]");

  abort();
}

- (id)createInitialDataSource
{
  PXSyntheticAssetsDataSource *v3;
  PXSyntheticAssetsDataSource *initialDataSource;

  v3 = self->_initialDataSource;
  initialDataSource = self->_initialDataSource;
  self->_initialDataSource = 0;

  return v3;
}

- (void)performDataSourceChanges:(id)a3
{
  void (**v5)(id, PXSyntheticAssetsDataSourceManager *);
  void *v6;
  void *v7;
  NSMutableArray *v8;
  NSMutableArray *nextAssetsBySection;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  NSMutableArray *v15;
  void *v16;
  void *v17;
  void *v18;
  NSMutableArray *v19;
  NSMutableArray *nextAssetCollections;
  PXSyntheticAssetsDataSource *v21;
  void *v22;
  void *v23;
  id v24;
  PXSectionedChangeDetailsCoalescer *changeDetailsCoalescer;
  void *v26;
  void *v27;
  void (**v28)(id, PXSyntheticAssetsDataSourceManager *);
  uint64_t v29;
  PXSyntheticAssetsDataSource *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSMutableArray *v34;
  NSMutableArray *v35;
  PXSectionedChangeDetailsCoalescer *v36;
  void *v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v5 = (void (**)(id, PXSyntheticAssetsDataSourceManager *))a3;
  if (self->_isPerformingDataSourceChanges)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSyntheticAssetsDataSourceManager.m"), 50, CFSTR("Nested changes not supported"));

  }
  -[PXSectionedDataSourceManager dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "assetsBySection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v7, "count"));
  nextAssetsBySection = self->_nextAssetsBySection;
  self->_nextAssetsBySection = v8;

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v40 != v13)
          objc_enumerationMutation(v10);
        v15 = self->_nextAssetsBySection;
        v16 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * i), "mutableCopy");
        -[NSMutableArray addObject:](v15, "addObject:", v16);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    }
    while (v12);
  }

  -[PXSectionedDataSourceManager dataSource](self, "dataSource");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "assetCollections");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (NSMutableArray *)objc_msgSend(v18, "mutableCopy");
  nextAssetCollections = self->_nextAssetCollections;
  self->_nextAssetCollections = v19;

  self->_isPerformingDataSourceChanges = 1;
  v5[2](v5, self);
  self->_isPerformingDataSourceChanges = 0;
  v21 = -[PXSyntheticAssetsDataSource initWithAssetsBySection:assetCollections:]([PXSyntheticAssetsDataSource alloc], "initWithAssetsBySection:assetCollections:", self->_nextAssetsBySection, self->_nextAssetCollections);
  -[PXSectionedDataSourceManager dataSource](self, "dataSource");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXSectionedDataSourceChangeDetails changeDetailsWithNoChangesFromDataSourceIdentifier:toDataSourceIdentifier:](PXSectionedDataSourceChangeDetails, "changeDetailsWithNoChangesFromDataSourceIdentifier:toDataSourceIdentifier:", objc_msgSend(v22, "identifier"), -[PXSectionedDataSource identifier](v21, "identifier"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = v23;
  changeDetailsCoalescer = self->_changeDetailsCoalescer;
  v26 = v24;
  if (changeDetailsCoalescer)
  {
    -[PXSectionedChangeDetailsCoalescer addChangeDetails:](changeDetailsCoalescer, "addChangeDetails:", v24);
    -[PXSectionedChangeDetailsCoalescer coalescedChangeDetails](self->_changeDetailsCoalescer, "coalescedChangeDetails");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (self->_changeIsReload)
  {
    -[PXSectionedDataSourceManager dataSource](self, "dataSource");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v24;
    v28 = v5;
    v29 = objc_msgSend(v27, "identifier");
    v30 = v21;
    v31 = -[PXSectionedDataSource identifier](v21, "identifier");
    v32 = v29;
    v5 = v28;
    +[PXSectionedDataSourceChangeDetails changeDetailsWithoutIncrementalChangesFromDataSourceIdentifier:toDataSourceIdentifier:](PXSectionedDataSourceChangeDetails, "changeDetailsWithoutIncrementalChangesFromDataSourceIdentifier:toDataSourceIdentifier:", v32, v31);
    v33 = objc_claimAutoreleasedReturnValue();

    v26 = (void *)v33;
    v24 = v38;
  }
  else
  {
    v30 = v21;
  }
  -[PXSectionedDataSourceManager setDataSource:changeDetails:](self, "setDataSource:changeDetails:", v30, v26);
  v34 = self->_nextAssetsBySection;
  self->_nextAssetsBySection = 0;

  v35 = self->_nextAssetCollections;
  self->_nextAssetCollections = 0;

  v36 = self->_changeDetailsCoalescer;
  self->_changeDetailsCoalescer = 0;

  self->_changeIsReload = 0;
}

- (void)_appendIncrementalChangeDetails:(id)a3
{
  id v4;
  PXSectionedChangeDetailsCoalescer *changeDetailsCoalescer;
  PXSectionedChangeDetailsCoalescer *v6;
  PXSectionedChangeDetailsCoalescer *v7;
  id v8;

  v4 = a3;
  changeDetailsCoalescer = self->_changeDetailsCoalescer;
  v8 = v4;
  if (changeDetailsCoalescer || self->_changeIsReload)
  {
    -[PXSectionedChangeDetailsCoalescer addChangeDetails:](changeDetailsCoalescer, "addChangeDetails:", v4);
  }
  else
  {
    v6 = -[PXSectionedChangeDetailsCoalescer initWithSectionedChangeDetails:]([PXSectionedChangeDetailsCoalescer alloc], "initWithSectionedChangeDetails:", v4);
    v7 = self->_changeDetailsCoalescer;
    self->_changeDetailsCoalescer = v6;

  }
}

- (void)insertItemAtIndexPath:(id)a3 assetBlock:(id)a4
{
  id v7;
  void (**v8)(id, unint64_t, unint64_t);
  unint64_t v9;
  unint64_t v10;
  void *v11;
  PXSectionedDataSourceChangeDetails *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  PXSectionedDataSourceChangeDetails *v21;
  void *v22;
  void *v23;
  void *v24;
  void (**v25)(id, unint64_t, unint64_t);
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = (void (**)(id, unint64_t, unint64_t))a4;
  if (!self->_isPerformingDataSourceChanges)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSyntheticAssetsDataSourceManager.m"), 95, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_isPerformingDataSourceChanges"));

  }
  v9 = objc_msgSend(v7, "px_section");
  v28 = v7;
  v10 = objc_msgSend(v7, "px_item");
  if (v9 >= -[NSMutableArray count](self->_nextAssetsBySection, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSyntheticAssetsDataSourceManager.m"), 98, CFSTR("Out of bounds section for insertion"));

  }
  -[NSMutableArray objectAtIndexedSubscript:](self->_nextAssetsBySection, "objectAtIndexedSubscript:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 > objc_msgSend(v11, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSyntheticAssetsDataSourceManager.m"), 100, CFSTR("Out of bounds index for insertion in section %ld"), v9);

  }
  v8[2](v8, v9, v10);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "insertObject:atIndex:", v27, v10);
  v12 = [PXSectionedDataSourceChangeDetails alloc];
  -[PXSectionedDataSourceManager dataSource](self, "dataSource");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v11;
  v14 = objc_msgSend(v13, "identifier");
  -[PXSectionedDataSourceManager dataSource](self, "dataSource");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v8;
  v16 = objc_msgSend(v15, "identifier");
  +[PXArrayChangeDetails changeDetailsWithNoChanges](PXArrayChangeDetails, "changeDetailsWithNoChanges");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v9);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v18;
  +[PXArrayChangeDetails changeDetailsWithInsertedIndexRange:](PXArrayChangeDetails, "changeDetailsWithInsertedIndexRange:", v10, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v19;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[PXSectionedDataSourceChangeDetails initWithFromDataSourceIdentifier:toDataSourceIdentifier:sectionChanges:itemChangeDetailsBySection:subitemChangeDetailsByItemBySection:](v12, "initWithFromDataSourceIdentifier:toDataSourceIdentifier:sectionChanges:itemChangeDetailsBySection:subitemChangeDetailsByItemBySection:", v14, v16, v17, v20, 0);

  -[PXSyntheticAssetsDataSourceManager _appendIncrementalChangeDetails:](self, "_appendIncrementalChangeDetails:", v21);
}

- (void)removeItemAtIndexPath:(id)a3
{
  id v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  PXSectionedDataSourceChangeDetails *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  PXSectionedDataSourceChangeDetails *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!self->_isPerformingDataSourceChanges)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSyntheticAssetsDataSourceManager.m"), 110, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_isPerformingDataSourceChanges"));

  }
  v6 = objc_msgSend(v5, "px_section");
  v23 = v5;
  v7 = objc_msgSend(v5, "px_item");
  if (v6 >= -[NSMutableArray count](self->_nextAssetsBySection, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSyntheticAssetsDataSourceManager.m"), 113, CFSTR("Out of bounds section for deletion"));

  }
  -[NSMutableArray objectAtIndexedSubscript:](self->_nextAssetsBySection, "objectAtIndexedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 >= objc_msgSend(v8, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSyntheticAssetsDataSourceManager.m"), 115, CFSTR("Out of bounds index for deletion in section %ld"), v6);

  }
  objc_msgSend(v8, "removeObjectAtIndex:", v7);
  v9 = [PXSectionedDataSourceChangeDetails alloc];
  -[PXSectionedDataSourceManager dataSource](self, "dataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "identifier");
  -[PXSectionedDataSourceManager dataSource](self, "dataSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v8;
  v13 = objc_msgSend(v12, "identifier");
  +[PXArrayChangeDetails changeDetailsWithNoChanges](PXArrayChangeDetails, "changeDetailsWithNoChanges");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v15;
  +[PXArrayChangeDetails changeDetailsWithRemovedIndexRange:](PXArrayChangeDetails, "changeDetailsWithRemovedIndexRange:", v7, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v16;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[PXSectionedDataSourceChangeDetails initWithFromDataSourceIdentifier:toDataSourceIdentifier:sectionChanges:itemChangeDetailsBySection:subitemChangeDetailsByItemBySection:](v9, "initWithFromDataSourceIdentifier:toDataSourceIdentifier:sectionChanges:itemChangeDetailsBySection:subitemChangeDetailsByItemBySection:", v11, v13, v14, v17, 0);

  -[PXSyntheticAssetsDataSourceManager _appendIncrementalChangeDetails:](self, "_appendIncrementalChangeDetails:", v18);
}

- (void)changeItemAtIndexPath:(id)a3 toAsset:(id)a4
{
  id v7;
  void (**v8)(id, unint64_t, unint64_t);
  unint64_t v9;
  unint64_t v10;
  void *v11;
  PXSectionedDataSourceChangeDetails *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  PXSectionedDataSourceChangeDetails *v21;
  void *v22;
  void *v23;
  void *v24;
  void (**v25)(id, unint64_t, unint64_t);
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = (void (**)(id, unint64_t, unint64_t))a4;
  if (!self->_isPerformingDataSourceChanges)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSyntheticAssetsDataSourceManager.m"), 124, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_isPerformingDataSourceChanges"));

  }
  v9 = objc_msgSend(v7, "px_section");
  v28 = v7;
  v10 = objc_msgSend(v7, "px_item");
  if (v9 >= -[NSMutableArray count](self->_nextAssetsBySection, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSyntheticAssetsDataSourceManager.m"), 127, CFSTR("Out of bounds section for change"));

  }
  -[NSMutableArray objectAtIndexedSubscript:](self->_nextAssetsBySection, "objectAtIndexedSubscript:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 >= objc_msgSend(v11, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSyntheticAssetsDataSourceManager.m"), 129, CFSTR("Out of bounds index for change in section %ld"), v9);

  }
  v8[2](v8, v9, v10);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "replaceObjectAtIndex:withObject:", v10, v27);
  v12 = [PXSectionedDataSourceChangeDetails alloc];
  -[PXSectionedDataSourceManager dataSource](self, "dataSource");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v11;
  v14 = objc_msgSend(v13, "identifier");
  -[PXSectionedDataSourceManager dataSource](self, "dataSource");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v8;
  v16 = objc_msgSend(v15, "identifier");
  +[PXArrayChangeDetails changeDetailsWithNoChanges](PXArrayChangeDetails, "changeDetailsWithNoChanges");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v9);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v18;
  +[PXArrayChangeDetails changeDetailsWithChangedIndexRange:](PXArrayChangeDetails, "changeDetailsWithChangedIndexRange:", v10, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v19;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[PXSectionedDataSourceChangeDetails initWithFromDataSourceIdentifier:toDataSourceIdentifier:sectionChanges:itemChangeDetailsBySection:subitemChangeDetailsByItemBySection:](v12, "initWithFromDataSourceIdentifier:toDataSourceIdentifier:sectionChanges:itemChangeDetailsBySection:subitemChangeDetailsByItemBySection:", v14, v16, v17, v20, 0);

  -[PXSyntheticAssetsDataSourceManager _appendIncrementalChangeDetails:](self, "_appendIncrementalChangeDetails:", v21);
}

- (void)insertSectionAtIndex:(int64_t)a3 count:(int64_t)a4 assetCollection:(id)a5 assetBlock:(id)a6
{
  void (**v11)(id, int64_t, _QWORD);
  void *v12;
  uint64_t v13;
  void *v14;
  NSMutableArray *nextAssetCollections;
  void *v16;
  PXSectionedDataSourceChangeDetails *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  PXSectionedDataSourceChangeDetails *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;

  v27 = a5;
  v11 = (void (**)(id, int64_t, _QWORD))a6;
  if (self->_isPerformingDataSourceChanges)
  {
    if (!a4)
      goto LABEL_5;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSyntheticAssetsDataSourceManager.m"), 139, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_isPerformingDataSourceChanges"));

    if (!a4)
      goto LABEL_5;
  }
  if (!v11)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSyntheticAssetsDataSourceManager.m"), 140, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assetBlock != nil || count == 0"));

  }
LABEL_5:
  if (-[NSMutableArray count](self->_nextAssetCollections, "count") < (unint64_t)a3
    || -[NSMutableArray count](self->_nextAssetsBySection, "count") < (unint64_t)a3)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSyntheticAssetsDataSourceManager.m"), 141, CFSTR("Out of bounds index for section insertion"));

  }
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", a4);
  if (a4 >= 1)
  {
    v13 = 0;
    do
    {
      v11[2](v11, a3, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObject:", v14);

      ++v13;
    }
    while (a4 != v13);
  }
  -[NSMutableArray insertObject:atIndex:](self->_nextAssetsBySection, "insertObject:atIndex:", v12, a3);
  nextAssetCollections = self->_nextAssetCollections;
  v16 = (void *)objc_msgSend(v27, "copyWithZone:", 0);
  -[NSMutableArray insertObject:atIndex:](nextAssetCollections, "insertObject:atIndex:", v16, a3);

  v17 = [PXSectionedDataSourceChangeDetails alloc];
  -[PXSectionedDataSourceManager dataSource](self, "dataSource");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "identifier");
  -[PXSectionedDataSourceManager dataSource](self, "dataSource");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "identifier");
  +[PXArrayChangeDetails changeDetailsWithInsertedIndexRange:](PXArrayChangeDetails, "changeDetailsWithInsertedIndexRange:", a3, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[PXSectionedDataSourceChangeDetails initWithFromDataSourceIdentifier:toDataSourceIdentifier:sectionChanges:itemChangeDetailsBySection:subitemChangeDetailsByItemBySection:](v17, "initWithFromDataSourceIdentifier:toDataSourceIdentifier:sectionChanges:itemChangeDetailsBySection:subitemChangeDetailsByItemBySection:", v19, v21, v22, 0, 0);

  -[PXSyntheticAssetsDataSourceManager _appendIncrementalChangeDetails:](self, "_appendIncrementalChangeDetails:", v23);
}

- (void)removeSectionAtIndex:(int64_t)a3
{
  PXSectionedDataSourceChangeDetails *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  PXSectionedDataSourceChangeDetails *v14;

  if (!self->_isPerformingDataSourceChanges)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSyntheticAssetsDataSourceManager.m"), 155, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_isPerformingDataSourceChanges"));

  }
  if (-[NSMutableArray count](self->_nextAssetCollections, "count") <= (unint64_t)a3
    || -[NSMutableArray count](self->_nextAssetsBySection, "count") <= (unint64_t)a3)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSyntheticAssetsDataSourceManager.m"), 156, CFSTR("Out of bounds index for section deletion"));

  }
  -[NSMutableArray removeObjectAtIndex:](self->_nextAssetCollections, "removeObjectAtIndex:", a3);
  -[NSMutableArray removeObjectAtIndex:](self->_nextAssetsBySection, "removeObjectAtIndex:", a3);
  v6 = [PXSectionedDataSourceChangeDetails alloc];
  -[PXSectionedDataSourceManager dataSource](self, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "identifier");
  -[PXSectionedDataSourceManager dataSource](self, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "identifier");
  +[PXArrayChangeDetails changeDetailsWithRemovedIndexRange:](PXArrayChangeDetails, "changeDetailsWithRemovedIndexRange:", a3, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[PXSectionedDataSourceChangeDetails initWithFromDataSourceIdentifier:toDataSourceIdentifier:sectionChanges:itemChangeDetailsBySection:subitemChangeDetailsByItemBySection:](v6, "initWithFromDataSourceIdentifier:toDataSourceIdentifier:sectionChanges:itemChangeDetailsBySection:subitemChangeDetailsByItemBySection:", v8, v10, v11, 0, 0);

  -[PXSyntheticAssetsDataSourceManager _appendIncrementalChangeDetails:](self, "_appendIncrementalChangeDetails:", v14);
}

- (void)changeSectionAtIndex:(int64_t)a3 toAssetCollection:(id)a4
{
  NSMutableArray *nextAssetCollections;
  void *v8;
  PXSectionedDataSourceChangeDetails *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  PXSectionedDataSourceChangeDetails *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a4;
  if (!self->_isPerformingDataSourceChanges)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSyntheticAssetsDataSourceManager.m"), 165, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_isPerformingDataSourceChanges"));

  }
  if (-[NSMutableArray count](self->_nextAssetCollections, "count") <= (unint64_t)a3)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSyntheticAssetsDataSourceManager.m"), 166, CFSTR("Out of bounds index for section change"));

  }
  nextAssetCollections = self->_nextAssetCollections;
  v8 = (void *)objc_msgSend(v18, "copyWithZone:", 0);
  -[NSMutableArray replaceObjectAtIndex:withObject:](nextAssetCollections, "replaceObjectAtIndex:withObject:", a3, v8);

  v9 = [PXSectionedDataSourceChangeDetails alloc];
  -[PXSectionedDataSourceManager dataSource](self, "dataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "identifier");
  -[PXSectionedDataSourceManager dataSource](self, "dataSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "identifier");
  +[PXArrayChangeDetails changeDetailsWithChangedIndexRange:](PXArrayChangeDetails, "changeDetailsWithChangedIndexRange:", a3, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[PXSectionedDataSourceChangeDetails initWithFromDataSourceIdentifier:toDataSourceIdentifier:sectionChanges:itemChangeDetailsBySection:subitemChangeDetailsByItemBySection:](v9, "initWithFromDataSourceIdentifier:toDataSourceIdentifier:sectionChanges:itemChangeDetailsBySection:subitemChangeDetailsByItemBySection:", v11, v13, v14, 0, 0);

  -[PXSyntheticAssetsDataSourceManager _appendIncrementalChangeDetails:](self, "_appendIncrementalChangeDetails:", v15);
}

- (void)markChangeAsReload
{
  PXSectionedChangeDetailsCoalescer *changeDetailsCoalescer;
  void *v5;

  if (!self->_isPerformingDataSourceChanges)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSyntheticAssetsDataSourceManager.m"), 174, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_isPerformingDataSourceChanges"));

  }
  self->_changeIsReload = 1;
  changeDetailsCoalescer = self->_changeDetailsCoalescer;
  self->_changeDetailsCoalescer = 0;

}

- (id)pauseChangeDeliveryWithTimeout:(double)a3 identifier:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x24BDBCEF8], "null", a4, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeDetailsCoalescer, 0);
  objc_storeStrong((id *)&self->_nextAssetCollections, 0);
  objc_storeStrong((id *)&self->_nextAssetsBySection, 0);
  objc_storeStrong((id *)&self->_initialDataSource, 0);
}

@end
