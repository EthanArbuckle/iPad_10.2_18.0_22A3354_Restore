@implementation PXCollectionsBrowserSelectionSnapshot

- (PXCollectionsBrowserSelectionSnapshot)initWithIndexPaths:(id)a3 dataSource:(id)a4
{
  id v6;
  id v7;
  PXCollectionsBrowserSelectionSnapshot *v8;
  uint64_t v9;
  NSArray *indexPaths;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXCollectionsBrowserSelectionSnapshot;
  v8 = -[PXCollectionsBrowserSelectionSnapshot init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    indexPaths = v8->_indexPaths;
    v8->_indexPaths = (NSArray *)v9;

    objc_storeStrong((id *)&v8->_dataSource, a4);
  }

  return v8;
}

- (int64_t)estimatedAssetCount
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (int64_t)assetCount
{
  return 0;
}

- (int64_t)mediaType
{
  return 0;
}

- (int64_t)estimatedModelObjectsCount
{
  return -[NSArray count](self->_indexPaths, "count");
}

- (NSArray)modelObjects
{
  NSArray *modelObjects;
  void *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  PXSectionedDataSource *dataSource;
  void *v11;
  NSArray *v12;
  NSArray *v13;
  _OWORD v15[2];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  modelObjects = self->_modelObjects;
  if (!modelObjects)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](self->_indexPaths, "count"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v5 = self->_indexPaths;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v19;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v19 != v8)
            objc_enumerationMutation(v5);
          v16 = 0u;
          v17 = 0u;
          -[PXSectionedDataSource identifier](self->_dataSource, "identifier");
          PXSimpleIndexPathFromIndexPath();
          dataSource = self->_dataSource;
          v15[0] = v16;
          v15[1] = v17;
          -[PXSectionedDataSource objectAtIndexPath:](dataSource, "objectAtIndexPath:", v15);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v11);

          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v7);
    }

    v12 = (NSArray *)objc_msgSend(v4, "copy");
    v13 = self->_modelObjects;
    self->_modelObjects = v12;

    modelObjects = self->_modelObjects;
  }
  return modelObjects;
}

- (id)assetReferenceAtIndex:(int64_t)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXBrowserSnapshot.m"), 293, CFSTR("Accessing asset references from a collections selection snapshot is unsupported"));

  abort();
}

- (id)displayAssetAtIndex:(int64_t)a3
{
  NSObject *v3;
  uint8_t v5[16];

  PXAssertGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v5 = 0;
    _os_log_error_impl(&dword_1A6789000, v3, OS_LOG_TYPE_ERROR, "Accessing assets from a collections selection snapshot is unsupported", v5, 2u);
  }

  return 0;
}

- (int64_t)indexOfAssetReference:(id)a3
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelObjects, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_indexPaths, 0);
}

@end
