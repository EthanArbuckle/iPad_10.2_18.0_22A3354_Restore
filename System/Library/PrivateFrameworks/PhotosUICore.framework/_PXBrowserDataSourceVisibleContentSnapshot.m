@implementation _PXBrowserDataSourceVisibleContentSnapshot

- (_PXBrowserDataSourceVisibleContentSnapshot)initWithIndexPaths:(id)a3 dataSource:(id)a4 dateIntervalGranularity:(unint64_t)a5 dateType:(unint64_t)a6
{
  id v10;
  id v11;
  _PXBrowserDataSourceVisibleContentSnapshot *v12;
  uint64_t v13;
  NSArray *indexPaths;
  objc_super v16;

  v10 = a3;
  v11 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_PXBrowserDataSourceVisibleContentSnapshot;
  v12 = -[PXBrowserVisibleContentSnapshot initWithDateIntervalGranularity:](&v16, sel_initWithDateIntervalGranularity_, a5);
  if (v12)
  {
    v13 = objc_msgSend(v10, "copy");
    indexPaths = v12->_indexPaths;
    v12->_indexPaths = (NSArray *)v13;

    objc_storeStrong((id *)&v12->_dataSource, a4);
    v12->_dateType = a6;
  }

  return v12;
}

- (_PXBrowserDataSourceVisibleContentSnapshot)initWithDateIntervalGranularity:(unint64_t)a3
{
  return -[_PXBrowserDataSourceVisibleContentSnapshot initWithIndexPaths:dataSource:dateIntervalGranularity:dateType:](self, "initWithIndexPaths:dataSource:dateIntervalGranularity:dateType:", 0, 0, a3, 0);
}

- (id)dateInterval
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id obj;
  void *v19;
  id v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  -[_PXBrowserDataSourceVisibleContentSnapshot dataSource](self, "dataSource");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[_PXBrowserDataSourceVisibleContentSnapshot indexPaths](self, "indexPaths");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (!v4)
  {

    v16 = 0;
    v6 = 0;
    v7 = 0;
    v8 = 0;
    goto LABEL_17;
  }
  v5 = v4;
  v6 = 0;
  v7 = 0;
  v8 = 0;
  v9 = *(_QWORD *)v23;
  obj = v3;
  do
  {
    v10 = 0;
    v11 = v6;
    v12 = v7;
    do
    {
      if (*(_QWORD *)v23 != v9)
        objc_enumerationMutation(obj);
      objc_msgSend(v19, "displayAssetAtIndexPath:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v10), obj);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[_PXBrowserDataSourceVisibleContentSnapshot dateType](self, "dateType"))
      {
        if (-[_PXBrowserDataSourceVisibleContentSnapshot dateType](self, "dateType") != 1)
          goto LABEL_11;
        objc_msgSend(v13, "importDate");
        v14 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v13, "creationDate");
        v14 = objc_claimAutoreleasedReturnValue();
      }
      v15 = (void *)v14;

      v8 = v15;
LABEL_11:
      v20 = v11;
      v21 = v12;
      objc_msgSend(MEMORY[0x1E0C99D68], "px_unionStartDate:endDate:withDate:", &v21, &v20, v8);
      v7 = v21;

      v6 = v20;
      ++v10;
      v11 = v6;
      v12 = v7;
    }
    while (v5 != v10);
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  }
  while (v5);

  v16 = 0;
  if (v7 && v6)
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v7, v6);
LABEL_17:

  return v16;
}

- (NSArray)indexPaths
{
  return self->_indexPaths;
}

- (PXDisplayAssetDataSource)dataSource
{
  return self->_dataSource;
}

- (unint64_t)dateType
{
  return self->_dateType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_indexPaths, 0);
}

@end
