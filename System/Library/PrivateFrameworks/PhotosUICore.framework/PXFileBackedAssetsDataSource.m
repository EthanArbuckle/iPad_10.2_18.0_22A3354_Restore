@implementation PXFileBackedAssetsDataSource

- (PXFileBackedAssetsDataSource)initWithFileBackedAssetDescriptionsBySection:(id)a3
{
  id v4;
  PXFileBackedAssetsDataSource *v5;
  uint64_t v6;
  NSDictionary *assetDescriptionsBySection;
  void *v8;
  NSDictionary *v9;
  NSDictionary *assetCollectionBySection;
  NSDictionary *v11;
  _QWORD v13[4];
  NSDictionary *v14;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PXFileBackedAssetsDataSource;
  v5 = -[PXFileBackedAssetsDataSource init](&v15, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    assetDescriptionsBySection = v5->_assetDescriptionsBySection;
    v5->_assetDescriptionsBySection = (NSDictionary *)v6;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __77__PXFileBackedAssetsDataSource_initWithFileBackedAssetDescriptionsBySection___block_invoke;
    v13[3] = &unk_1E51489F0;
    v9 = v8;
    v14 = v9;
    objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v13);
    assetCollectionBySection = v5->_assetCollectionBySection;
    v5->_assetCollectionBySection = v9;
    v11 = v9;

  }
  return v5;
}

- (PXFileBackedAssetsDataSource)initWithFileURLsBySection:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  PXFileBackedAssetsDataSource *v8;
  _QWORD v10[4];
  id v11;

  v4 = (void *)MEMORY[0x1E0C99E08];
  v5 = a3;
  objc_msgSend(v4, "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __58__PXFileBackedAssetsDataSource_initWithFileURLsBySection___block_invoke;
  v10[3] = &unk_1E5132138;
  v11 = v6;
  v7 = v6;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v10);

  v8 = -[PXFileBackedAssetsDataSource initWithFileBackedAssetDescriptionsBySection:](self, "initWithFileBackedAssetDescriptionsBySection:", v7);
  return v8;
}

- (PXFileBackedAssetsDataSource)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFileBackedAssetsDataSource.m"), 134, CFSTR("%s is not available as initializer"), "-[PXFileBackedAssetsDataSource init]");

  abort();
}

- (int64_t)numberOfSections
{
  void *v2;
  int64_t v3;

  -[PXFileBackedAssetsDataSource assetDescriptionsBySection](self, "assetDescriptionsBySection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;

  -[PXFileBackedAssetsDataSource assetDescriptionsBySection](self, "assetDescriptionsBySection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  return v7;
}

- (int64_t)numberOfSubitemsInItem:(int64_t)a3 section:(int64_t)a4
{
  return 0;
}

- (id)objectAtIndexPath:(PXSimpleIndexPath *)a3
{
  int64_t dataSourceIdentifier;
  NSDictionary *assetCollectionBySection;
  void *v8;
  PXFileBackedAsset *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;

  dataSourceIdentifier = a3->dataSourceIdentifier;
  if (dataSourceIdentifier != -[PXFileBackedAssetsDataSource identifier](self, "identifier"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFileBackedAssetsDataSource.m"), 150, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indexPath.dataSourceIdentifier == [self identifier]"));

  }
  if (a3->dataSourceIdentifier == *(_QWORD *)off_1E50B7E98)
    goto LABEL_10;
  if (a3->item != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (a3->subitem == 0x7FFFFFFFFFFFFFFFLL)
    {
      -[PXFileBackedAssetsDataSource assetDescriptionsBySection](self, "assetDescriptionsBySection");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3->section);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", v11);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "objectAtIndexedSubscript:", a3->item);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[PXFileBackedAsset initWithDescription:]([PXFileBackedAsset alloc], "initWithDescription:", v12);

      goto LABEL_9;
    }
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *(_OWORD *)&a3->dataSourceIdentifier;
    v18 = *(_OWORD *)&a3->item;
    PXSimpleIndexPathDescription();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFileBackedAssetsDataSource.m"), 160, CFSTR("%@ invalid indexPath:%@"), self, v16, v17, v18);

    abort();
  }
  if (a3->section == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_10;
  assetCollectionBySection = self->_assetCollectionBySection;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](assetCollectionBySection, "objectForKeyedSubscript:", v8);
  v9 = (PXFileBackedAsset *)objc_claimAutoreleasedReturnValue();
LABEL_9:

  return v9;
}

- (id)assetsInSectionIndexPath:(PXSimpleIndexPath *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  PXFileBackedAsset *v13;
  PXFileBackedFetchResult *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[PXFileBackedAssetsDataSource assetDescriptionsBySection](self, "assetDescriptionsBySection", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3->section);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = -[PXFileBackedAsset initWithDescription:]([PXFileBackedAsset alloc], "initWithDescription:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v12));
        if (v13)
          objc_msgSend(v5, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  v14 = -[PXFileBackedFetchResult initWithAssets:]([PXFileBackedFetchResult alloc], "initWithAssets:", v5);
  return v14;
}

- (PXSimpleIndexPath)indexPathForObjectReference:(SEL)a3
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id *v11;
  __int128 v12;
  NSDictionary *assetCollectionBySection;
  __int128 v14;
  PXSimpleIndexPath *result;
  void *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  _QWORD v25[3];
  _QWORD v26[4];
  _QWORD v27[3];
  objc_super v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  void *v32;
  __int128 v33;
  __int128 v34;

  v7 = a4;
  v29 = 0;
  v30 = &v29;
  v31 = 0x4010000000;
  v32 = &unk_1A7E74EE7;
  v33 = 0u;
  v34 = 0u;
  v28.receiver = self;
  v28.super_class = (Class)PXFileBackedAssetsDataSource;
  -[PXSimpleIndexPath indexPathForObjectReference:](&v28, sel_indexPathForObjectReference_, v7);
  if (v30[4] == *(_QWORD *)off_1E50B7E98)
  {
    objc_msgSend(v7, "sectionObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (objc_class *)objc_opt_class();
        NSStringFromClass(v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "px_descriptionForAssertionMessage");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a3, self, CFSTR("PXFileBackedAssetsDataSource.m"), 183, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("objectReference.sectionObject"), v18, v19);

      }
    }
    objc_msgSend(v7, "itemObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (objc_class *)objc_opt_class();
        NSStringFromClass(v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "px_descriptionForAssertionMessage");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a3, self, CFSTR("PXFileBackedAssetsDataSource.m"), 184, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("objectReference.itemObject"), v22, v23);

      }
      -[PXFileBackedAssetsDataSource assetDescriptionsBySection](self, "assetDescriptionsBySection");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __60__PXFileBackedAssetsDataSource_indexPathForObjectReference___block_invoke;
      v26[3] = &unk_1E5132160;
      v27[1] = self;
      v27[2] = &v29;
      v27[0] = v9;
      objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v26);
      v11 = (id *)v27;

    }
    else
    {
      if (!v8)
      {
LABEL_13:
        v14 = *((_OWORD *)v30 + 3);
        *(_OWORD *)&retstr->dataSourceIdentifier = *((_OWORD *)v30 + 2);
        *(_OWORD *)&retstr->item = v14;

        goto LABEL_14;
      }
      assetCollectionBySection = self->_assetCollectionBySection;
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __60__PXFileBackedAssetsDataSource_indexPathForObjectReference___block_invoke_2;
      v24[3] = &unk_1E5132188;
      v25[1] = self;
      v25[2] = &v29;
      v25[0] = v8;
      -[NSDictionary enumerateKeysAndObjectsUsingBlock:](assetCollectionBySection, "enumerateKeysAndObjectsUsingBlock:", v24);
      v11 = (id *)v25;
    }

    goto LABEL_13;
  }
  v12 = *((_OWORD *)v30 + 3);
  *(_OWORD *)&retstr->dataSourceIdentifier = *((_OWORD *)v30 + 2);
  *(_OWORD *)&retstr->item = v12;
LABEL_14:
  _Block_object_dispose(&v29, 8);

  return result;
}

- (id)inputForItem:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v9[4];

  v4 = a3;
  v5 = -[PXFileBackedAssetsDataSource identifier](self, "identifier");
  v6 = objc_msgSend(v4, "px_section");
  v7 = objc_msgSend(v4, "px_item");

  v9[0] = v5;
  v9[1] = v6;
  v9[2] = v7;
  v9[3] = 0x7FFFFFFFFFFFFFFFLL;
  -[PXFileBackedAssetsDataSource objectAtIndexPath:](self, "objectAtIndexPath:", v9);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSDictionary)assetDescriptionsBySection
{
  return self->_assetDescriptionsBySection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetDescriptionsBySection, 0);
  objc_storeStrong((id *)&self->_assetCollectionBySection, 0);
}

void __60__PXFileBackedAssetsDataSource_indexPathForObjectReference___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  _BYTE *v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v19 = a4;
  v26 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = a3;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v22;
    while (2)
    {
      v12 = 0;
      v20 = v10 + v9;
      do
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v12), "url", v19);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "url");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v13, "isEqual:", v14);

        if (v15)
        {
          v16 = objc_msgSend(*(id *)(a1 + 40), "identifier");
          v17 = objc_msgSend(v6, "integerValue");
          v18 = *(_QWORD **)(*(_QWORD *)(a1 + 48) + 8);
          v18[4] = v16;
          v18[5] = v17;
          v18[6] = v10 + v12;
          v18[7] = 0x7FFFFFFFFFFFFFFFLL;
          *v19 = 1;
          goto LABEL_11;
        }
        ++v12;
      }
      while (v9 != v12);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      v10 = v20;
      if (v9)
        continue;
      break;
    }
  }
LABEL_11:

}

void __60__PXFileBackedAssetsDataSource_indexPathForObjectReference___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v7;
  uint64_t v8;
  int64x2_t *v9;
  id v10;

  v10 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isEqual:", a3))
  {
    v7 = objc_msgSend(*(id *)(a1 + 40), "identifier");
    v8 = objc_msgSend(v10, "integerValue");
    v9 = *(int64x2_t **)(*(_QWORD *)(a1 + 48) + 8);
    v9[2].i64[0] = v7;
    v9[2].i64[1] = v8;
    v9[3] = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    *a4 = 1;
  }

}

void __58__PXFileBackedAssetsDataSource_initWithFileURLsBySection___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        +[PXFileBackedAssetDescription simpleImageDescriptionWithURL:](PXFileBackedAssetDescription, "simpleImageDescriptionWithURL:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v12), (_QWORD)v14);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v5);
}

void __77__PXFileBackedAssetsDataSource_initWithFileBackedAssetDescriptionsBySection___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _PXFileBackedAssetCollection *v4;

  v3 = a2;
  v4 = objc_alloc_init(_PXFileBackedAssetCollection);
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v4, v3);

}

@end
