@implementation PXImportAssetsDataSource

- (PXImportAssetsDataSource)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXImportAssetsDataSource.m"), 28, CFSTR("%s is not available as initializer"), "-[PXImportAssetsDataSource init]");

  abort();
}

- (PXImportAssetsDataSource)initWithAssetCollections:(id)a3 assetsMap:(id)a4
{
  return -[PXImportAssetsDataSource initWithAssetCollections:assetsMap:startsAtEnd:](self, "initWithAssetCollections:assetsMap:startsAtEnd:", a3, a4, 0);
}

- (PXImportAssetsDataSource)initWithAssetCollections:(id)a3 assetsMap:(id)a4 startsAtEnd:(BOOL)a5
{
  id v8;
  id v9;
  PXImportAssetsDataSource *v10;
  uint64_t v11;
  NSArray *assetCollections;
  uint64_t v13;
  NSDictionary *assetsMap;
  void *v15;
  NSArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  uint64_t v23;
  NSDictionary *assetCollectionsById;
  BOOL v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  objc_super v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v31.receiver = self;
  v31.super_class = (Class)PXImportAssetsDataSource;
  v10 = -[PXImportAssetsDataSource init](&v31, sel_init);
  if (v10)
  {
    v26 = a5;
    v11 = objc_msgSend(v8, "copy");
    assetCollections = v10->_assetCollections;
    v10->_assetCollections = (NSArray *)v11;

    v13 = objc_msgSend(v9, "copy");
    assetsMap = v10->_assetsMap;
    v10->_assetsMap = (NSDictionary *)v13;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", -[NSArray count](v10->_assetCollections, "count"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v16 = v10->_assetCollections;
    v17 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v28 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          objc_msgSend(v21, "identifier");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setObject:forKeyedSubscript:", v21, v22);

        }
        v18 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v18);
    }

    v23 = objc_msgSend(v15, "copy");
    assetCollectionsById = v10->_assetCollectionsById;
    v10->_assetCollectionsById = (NSDictionary *)v23;

    v10->_startsAtEnd = v26;
  }

  return v10;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ <%p> \"%lu\"\n%@"), objc_opt_class(), self, -[PXImportAssetsDataSource identifier](self, "identifier"), self->_assetCollections);
}

- (int64_t)numberOfSections
{
  return -[NSArray count](self->_assetCollections, "count");
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  void *v5;
  int64_t v6;

  if (-[NSArray count](self->_assetCollections, "count") <= a3)
    return 0;
  -[NSArray objectAtIndexedSubscript:](self->_assetCollections, "objectAtIndexedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "numberOfItems");

  return v6;
}

- (int64_t)numberOfSubitemsInItem:(int64_t)a3 section:(int64_t)a4
{
  return 0;
}

- (id)objectAtIndexPath:(PXSimpleIndexPath *)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  int64_t item;
  id v11;
  void *v12;
  void *v15;

  v5 = *(_QWORD *)off_1E50B7E98;
  if (a3->dataSourceIdentifier != *(_QWORD *)off_1E50B7E98 && a3->subitem != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXImportAssetsDataSource.m"), 85, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  -[NSArray objectAtIndexedSubscript:](self->_assetCollections, "objectAtIndexedSubscript:", a3->section);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  item = a3->item;
  if (a3->dataSourceIdentifier != v5 && a3->section != 0x7FFFFFFFFFFFFFFFLL && item == 0x7FFFFFFFFFFFFFFFLL)
  {
    v11 = v6;
  }
  else
  {
    objc_msgSend(v6, "itemAtIndex:", item);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;

  return v12;
}

- (PXSimpleIndexPath)indexPathForObjectReference:(SEL)a3
{
  id v7;
  __int128 v8;
  void *v9;
  NSArray *assetCollections;
  id v11;
  __int128 v12;
  PXSimpleIndexPath *result;
  void *v14;
  objc_class *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  PXImportAssetsDataSource *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  void *v26;
  __int128 v27;
  __int128 v28;

  v7 = a4;
  v23 = 0;
  v24 = &v23;
  v25 = 0x4010000000;
  v26 = &unk_1A7E74EE7;
  v8 = *((_OWORD *)off_1E50B8778 + 1);
  v27 = *(_OWORD *)off_1E50B8778;
  v28 = v8;
  objc_msgSend(v7, "itemObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a3, self, CFSTR("PXImportAssetsDataSource.m"), 100, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("objectReference.itemObject"), v16);
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "px_descriptionForAssertionMessage");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a3, self, CFSTR("PXImportAssetsDataSource.m"), 100, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("objectReference.itemObject"), v16, v18);

    goto LABEL_6;
  }
LABEL_3:
  assetCollections = self->_assetCollections;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __56__PXImportAssetsDataSource_indexPathForObjectReference___block_invoke;
  v19[3] = &unk_1E5115D70;
  v11 = v9;
  v21 = self;
  v22 = &v23;
  v20 = v11;
  -[NSArray enumerateObjectsUsingBlock:](assetCollections, "enumerateObjectsUsingBlock:", v19);
  v12 = *((_OWORD *)v24 + 3);
  *(_OWORD *)&retstr->dataSourceIdentifier = *((_OWORD *)v24 + 2);
  *(_OWORD *)&retstr->item = v12;

  _Block_object_dispose(&v23, 8);
  return result;
}

- (BOOL)startsAtEnd
{
  return self->_startsAtEnd;
}

- (id)assetCollectionForSection:(unint64_t)a3
{
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;

  -[PXImportAssetsDataSource assetCollections](self, "assetCollections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 <= a3)
  {
    v8 = 0;
  }
  else
  {
    -[PXImportAssetsDataSource assetCollections](self, "assetCollections");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)assetCollectionForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  if (a3)
  {
    v4 = a3;
    -[PXImportAssetsDataSource assetCollectionsById](self, "assetCollectionsById");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (int64_t)sectionForAssetCollection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;

  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXImportAssetsDataSource assetCollectionsById](self, "assetCollectionsById");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[PXImportAssetsDataSource assetCollections](self, "assetCollections");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "indexOfObject:", v4);

  }
  else
  {
    v9 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v9;
}

- (PXSimpleIndexPath)itemIndexPathForItem:(SEL)a3
{
  __int128 v6;
  int64_t v7;
  void *v8;
  uint64_t v9;
  int64_t v10;
  PXSimpleIndexPath *result;
  id v12;

  v12 = a4;
  v6 = *((_OWORD *)off_1E50B8778 + 1);
  *(_OWORD *)&retstr->dataSourceIdentifier = *(_OWORD *)off_1E50B8778;
  *(_OWORD *)&retstr->item = v6;
  if (-[NSArray count](self->_assetCollections, "count"))
  {
    v7 = 0;
    while (1)
    {
      -[NSArray objectAtIndexedSubscript:](self->_assetCollections, "objectAtIndexedSubscript:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "indexOfItem:", v12);
      if (v9 != 0x7FFFFFFFFFFFFFFFLL)
        break;

      if (++v7 >= -[NSArray count](self->_assetCollections, "count"))
        goto LABEL_7;
    }
    v10 = v9;
    retstr->dataSourceIdentifier = -[PXImportAssetsDataSource identifier](self, "identifier");
    retstr->section = v7;
    retstr->item = v10;
    retstr->subitem = 0x7FFFFFFFFFFFFFFFLL;

  }
LABEL_7:

  return result;
}

- (unint64_t)numberOfNotYetImportedItems
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  _QWORD v10[5];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[PXImportAssetsDataSource assetCollections](self, "assetCollections");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v19, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v12;
    v5 = MEMORY[0x1E0C809B0];
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v12 != v4)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v6);
        v10[0] = v5;
        v10[1] = 3221225472;
        v10[2] = __55__PXImportAssetsDataSource_numberOfNotYetImportedItems__block_invoke;
        v10[3] = &unk_1E511C9B0;
        v10[4] = &v15;
        objc_msgSend(v7, "arrangedObjects:", v10);
        ++v6;
      }
      while (v3 != v6);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v19, 16);
    }
    while (v3);
  }

  v8 = v16[3];
  _Block_object_dispose(&v15, 8);
  return v8;
}

- (unint64_t)numberOfAlreadyImportedItems
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  _QWORD v10[5];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[PXImportAssetsDataSource assetCollections](self, "assetCollections");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v19, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v12;
    v5 = MEMORY[0x1E0C809B0];
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v12 != v4)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v6);
        v10[0] = v5;
        v10[1] = 3221225472;
        v10[2] = __56__PXImportAssetsDataSource_numberOfAlreadyImportedItems__block_invoke;
        v10[3] = &unk_1E511C9B0;
        v10[4] = &v15;
        objc_msgSend(v7, "arrangedObjects:", v10);
        ++v6;
      }
      while (v3 != v6);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v19, 16);
    }
    while (v3);
  }

  v8 = v16[3];
  _Block_object_dispose(&v15, 8);
  return v8;
}

- (unint64_t)numberOfSelectableItems
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  _QWORD v10[5];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[PXImportAssetsDataSource assetCollections](self, "assetCollections");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v19, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v12;
    v5 = MEMORY[0x1E0C809B0];
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v12 != v4)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v6);
        v10[0] = v5;
        v10[1] = 3221225472;
        v10[2] = __51__PXImportAssetsDataSource_numberOfSelectableItems__block_invoke;
        v10[3] = &unk_1E511C9B0;
        v10[4] = &v15;
        objc_msgSend(v7, "arrangedObjects:", v10);
        ++v6;
      }
      while (v3 != v6);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v19, 16);
    }
    while (v3);
  }

  v8 = v16[3];
  _Block_object_dispose(&v15, 8);
  return v8;
}

- (unint64_t)numberOfItems
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[PXImportAssetsDataSource assetCollections](self, "assetCollections", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v2);
        v5 += objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "numberOfItems");
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)hasAlreadyImportedSection
{
  void *v2;
  BOOL v3;

  -[PXImportAssetsDataSource alreadyImportedCollection](self, "alreadyImportedCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)alreadyImportedCollection
{
  void *v3;
  void *v4;
  void *v5;

  +[PXImportItemViewModel alreadyImportedGroupIdentifier](PXImportItemViewModel, "alreadyImportedGroupIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXImportAssetsDataSource assetCollectionsById](self, "assetCollectionsById");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)allItems
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[PXImportAssetsDataSource assetCollections](self, "assetCollections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    v8 = MEMORY[0x1E0C809B0];
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v9);
        v12[0] = v8;
        v12[1] = 3221225472;
        v12[2] = __36__PXImportAssetsDataSource_allItems__block_invoke;
        v12[3] = &unk_1E5115E18;
        v13 = v3;
        objc_msgSend(v10, "arrangedObjects:", v12);

        ++v9;
      }
      while (v6 != v9);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)allSelectableItems
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[PXImportAssetsDataSource assetCollections](self, "assetCollections", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v8), "unsortedObjects");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "firstObject");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isSelectable");

        if (v11)
          objc_msgSend(v3, "addObjectsFromArray:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)allItemsUnsorted
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[PXImportAssetsDataSource assetCollections](self, "assetCollections", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "unsortedObjects");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObjectsFromArray:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)notYetImportedItems
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[PXImportAssetsDataSource assetCollections](self, "assetCollections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    v8 = MEMORY[0x1E0C809B0];
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v9);
        v12[0] = v8;
        v12[1] = 3221225472;
        v12[2] = __47__PXImportAssetsDataSource_notYetImportedItems__block_invoke;
        v12[3] = &unk_1E5115E18;
        v13 = v3;
        objc_msgSend(v10, "arrangedObjects:", v12);

        ++v9;
      }
      while (v6 != v9);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)alreadyImportedItems
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[PXImportAssetsDataSource assetCollections](self, "assetCollections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    v8 = MEMORY[0x1E0C809B0];
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v9);
        v12[0] = v8;
        v12[1] = 3221225472;
        v12[2] = __48__PXImportAssetsDataSource_alreadyImportedItems__block_invoke;
        v12[3] = &unk_1E5115E18;
        v13 = v3;
        objc_msgSend(v10, "arrangedObjects:", v12);

        ++v9;
      }
      while (v6 != v9);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)itemForImportAssetUuid:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PXImportAssetsDataSource assetsMap](self, "assetsMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSArray)assetCollections
{
  return self->_assetCollections;
}

- (NSDictionary)assetCollectionsById
{
  return self->_assetCollectionsById;
}

- (NSDictionary)assetsMap
{
  return self->_assetsMap;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetsMap, 0);
  objc_storeStrong((id *)&self->_assetCollectionsById, 0);
  objc_storeStrong((id *)&self->_assetCollections, 0);
}

void __48__PXImportAssetsDataSource_alreadyImportedItems__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0CB3880];
  v4 = a2;
  objc_msgSend(v3, "predicateWithBlock:", &__block_literal_global_24);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filteredArrayUsingPredicate:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", v6);
}

uint64_t __48__PXImportAssetsDataSource_alreadyImportedItems__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isNotYetImported") ^ 1;
}

void __47__PXImportAssetsDataSource_notYetImportedItems__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0CB3880];
  v4 = a2;
  objc_msgSend(v3, "predicateWithBlock:", &__block_literal_global_23);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filteredArrayUsingPredicate:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", v6);
}

uint64_t __47__PXImportAssetsDataSource_notYetImportedItems__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isNotYetImported");
}

void __36__PXImportAssetsDataSource_allItems__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "count"))
    objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", v3);

}

void __51__PXImportAssetsDataSource_numberOfSelectableItems__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0CB3880];
  v4 = a2;
  objc_msgSend(v3, "predicateWithBlock:", &__block_literal_global_21);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filteredArrayUsingPredicate:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += objc_msgSend(v6, "count");
}

uint64_t __51__PXImportAssetsDataSource_numberOfSelectableItems__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isSelectable");
}

void __56__PXImportAssetsDataSource_numberOfAlreadyImportedItems__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0CB3880];
  v4 = a2;
  objc_msgSend(v3, "predicateWithBlock:", &__block_literal_global_20);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filteredArrayUsingPredicate:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += objc_msgSend(v6, "count");
}

BOOL __56__PXImportAssetsDataSource_numberOfAlreadyImportedItems__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;
  void *v4;

  v2 = a2;
  if ((objc_msgSend(v2, "isDuplicate") & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    objc_msgSend(v2, "importDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v4 != 0;

  }
  return v3;
}

void __55__PXImportAssetsDataSource_numberOfNotYetImportedItems__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0CB3880];
  v4 = a2;
  objc_msgSend(v3, "predicateWithBlock:", &__block_literal_global_1477);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filteredArrayUsingPredicate:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += objc_msgSend(v6, "count");
}

uint64_t __55__PXImportAssetsDataSource_numberOfNotYetImportedItems__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isNotYetImported");
}

uint64_t __56__PXImportAssetsDataSource_indexPathForObjectReference___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;
  uint64_t v8;
  _QWORD *v9;

  result = objc_msgSend(a2, "indexOfItem:", *(_QWORD *)(a1 + 32));
  if (result != 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = result;
    result = objc_msgSend(*(id *)(a1 + 40), "identifier");
    v9 = *(_QWORD **)(*(_QWORD *)(a1 + 48) + 8);
    v9[4] = result;
    v9[5] = a3;
    v9[6] = v8;
    v9[7] = 0x7FFFFFFFFFFFFFFFLL;
    *a4 = 1;
  }
  return result;
}

@end
