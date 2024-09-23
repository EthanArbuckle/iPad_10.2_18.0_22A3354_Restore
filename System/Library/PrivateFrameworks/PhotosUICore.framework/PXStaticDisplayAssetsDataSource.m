@implementation PXStaticDisplayAssetsDataSource

- (PXStaticDisplayAssetsDataSource)initWithAssetCollectionBySection:(id)a3 assetsBySection:(id)a4 curatedAssetsBySection:(id)a5 keyAssetsBySection:(id)a6 sectionContent:(int64_t)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  PXStaticDisplayAssetsDataSource *v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  PXMockDisplayAssetCollection *v24;
  void *v25;
  NSArray *v26;
  NSArray *exposedAssetsBySection;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  SEL v33;
  id obj;
  objc_super v35;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v35.receiver = self;
  v35.super_class = (Class)PXStaticDisplayAssetsDataSource;
  v17 = -[PXStaticDisplayAssetsDataSource init](&v35, sel_init);
  if (!v17)
    goto LABEL_27;
  v33 = a2;
  obj = a6;
  v18 = objc_msgSend(v13, "count");
  v19 = objc_msgSend(v14, "count");
  if (v18 <= v19)
    v20 = v19;
  else
    v20 = v18;
  v21 = objc_msgSend(v15, "count");
  v22 = objc_msgSend(v16, "count");
  if (v21 <= v22)
    v23 = v22;
  else
    v23 = v21;
  if (v20 <= v23)
    v20 = v23;
  if (v13 && objc_msgSend(v13, "count") != v20)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", v33, v17, CFSTR("PXStaticDisplayAssetsDataSource.m"), 32, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!assetCollectionBySection || assetCollectionBySection.count == maxCount"));

    if (!v14)
      goto LABEL_15;
  }
  else if (!v14)
  {
    goto LABEL_15;
  }
  if (objc_msgSend(v14, "count") != v20)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", v33, v17, CFSTR("PXStaticDisplayAssetsDataSource.m"), 33, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!assetsBySection || assetsBySection.count == maxCount"));

  }
LABEL_15:
  if (v15 && objc_msgSend(v15, "count") != v20)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", v33, v17, CFSTR("PXStaticDisplayAssetsDataSource.m"), 34, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!curatedAssetsBySection || curatedAssetsBySection.count == maxCount"));

    if (v16)
    {
LABEL_18:
      if (objc_msgSend(v16, "count") != v20)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", v33, v17, CFSTR("PXStaticDisplayAssetsDataSource.m"), 35, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!keyAssetsBySection || keyAssetsBySection.count == maxCount"));

      }
    }
  }
  else if (v16)
  {
    goto LABEL_18;
  }
  if (!v13)
  {
    v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (v20 >= 1)
    {
      do
      {
        v24 = -[PXMockDisplayAssetCollection initWithTitle:subtitle:type:subtype:]([PXMockDisplayAssetCollection alloc], "initWithTitle:subtitle:type:subtype:", 0, 0, 1, 2);
        objc_msgSend(v13, "addObject:", v24);

        --v20;
      }
      while (v20);
    }
  }
  objc_storeStrong((id *)&v17->_assetCollectionBySection, v13);
  objc_storeStrong((id *)&v17->_assetsBySection, a4);
  objc_storeStrong((id *)&v17->_curatedAssetsBySection, a5);
  objc_storeStrong((id *)&v17->_keyAssetsBySection, obj);
  v17->_sectionContent = a7;
  v25 = v14;
  if (!a7)
    goto LABEL_26;
  if (a7 == 1)
  {
    v25 = v15;
LABEL_26:
    v26 = v25;
    exposedAssetsBySection = v17->_exposedAssetsBySection;
    v17->_exposedAssetsBySection = v26;

  }
LABEL_27:

  return v17;
}

- (PXStaticDisplayAssetsDataSource)initWithDisplayAssetFetchResults:(id)a3
{
  return -[PXStaticDisplayAssetsDataSource initWithAssetCollectionBySection:assetsBySection:curatedAssetsBySection:keyAssetsBySection:sectionContent:](self, "initWithAssetCollectionBySection:assetsBySection:curatedAssetsBySection:keyAssetsBySection:sectionContent:", 0, a3, 0, 0, 0);
}

- (PXStaticDisplayAssetsDataSource)init
{
  return -[PXStaticDisplayAssetsDataSource initWithDisplayAssetFetchResults:](self, "initWithDisplayAssetFetchResults:", MEMORY[0x1E0C9AA60]);
}

- (int64_t)numberOfSections
{
  void *v2;
  int64_t v3;

  -[PXStaticDisplayAssetsDataSource assetCollectionBySection](self, "assetCollectionBySection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  void *v4;
  void *v5;
  int64_t v6;

  -[PXStaticDisplayAssetsDataSource exposedAssetsBySection](self, "exposedAssetsBySection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  return v6;
}

- (int64_t)numberOfCuratedItemsInAssetCollection:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v8;
  void *v9;
  int64_t v10;

  v4 = a3;
  -[PXStaticDisplayAssetsDataSource assetCollectionBySection](self, "assetCollectionBySection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  -[PXStaticDisplayAssetsDataSource curatedAssetsBySection](self, "curatedAssetsBySection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  return v10;
}

- (int64_t)numberOfUncuratedItemsInAssetCollection:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v8;
  void *v9;
  int64_t v10;

  v4 = a3;
  -[PXStaticDisplayAssetsDataSource assetCollectionBySection](self, "assetCollectionBySection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  -[PXStaticDisplayAssetsDataSource assetsBySection](self, "assetsBySection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  return v10;
}

- (int64_t)numberOfCuratedItemsInSectionIndexPath:(PXSimpleIndexPath *)a3
{
  __int128 v3;
  void *v4;
  int64_t v5;
  _OWORD v7[2];

  v3 = *(_OWORD *)&a3->item;
  v7[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v7[1] = v3;
  -[PXStaticDisplayAssetsDataSource curatedAssetsInSectionIndexPath:](self, "curatedAssetsInSectionIndexPath:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (id)curatedAssetsInSectionIndexPath:(PXSimpleIndexPath *)a3
{
  int64_t dataSourceIdentifier;
  void *v7;
  void *v8;
  void *v10;

  dataSourceIdentifier = a3->dataSourceIdentifier;
  if (dataSourceIdentifier != -[PXStaticDisplayAssetsDataSource identifier](self, "identifier"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStaticDisplayAssetsDataSource.m"), 101, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indexPath.dataSourceIdentifier == self.identifier"));

  }
  -[PXStaticDisplayAssetsDataSource curatedAssetsBySection](self, "curatedAssetsBySection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", a3->section);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (int64_t)numberOfUncuratedItemsInSectionIndexPath:(PXSimpleIndexPath *)a3
{
  __int128 v3;
  void *v4;
  int64_t v5;
  _OWORD v7[2];

  v3 = *(_OWORD *)&a3->item;
  v7[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v7[1] = v3;
  -[PXStaticDisplayAssetsDataSource uncuratedAssetsInSectionIndexPath:](self, "uncuratedAssetsInSectionIndexPath:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (id)uncuratedAssetsInSectionIndexPath:(PXSimpleIndexPath *)a3
{
  int64_t dataSourceIdentifier;
  void *v7;
  void *v8;
  void *v10;

  dataSourceIdentifier = a3->dataSourceIdentifier;
  if (dataSourceIdentifier != -[PXStaticDisplayAssetsDataSource identifier](self, "identifier"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStaticDisplayAssetsDataSource.m"), 110, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indexPath.dataSourceIdentifier == self.identifier"));

  }
  -[PXStaticDisplayAssetsDataSource assetsBySection](self, "assetsBySection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", a3->section);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)objectAtIndexPath:(PXSimpleIndexPath *)a3
{
  int64_t dataSourceIdentifier;
  int64_t item;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  void *v13;

  dataSourceIdentifier = a3->dataSourceIdentifier;
  if (dataSourceIdentifier != -[PXStaticDisplayAssetsDataSource identifier](self, "identifier"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStaticDisplayAssetsDataSource.m"), 115, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indexPath.dataSourceIdentifier == self.identifier"));

  }
  if (a3->dataSourceIdentifier == *(_QWORD *)off_1E50B7E98)
  {
LABEL_12:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStaticDisplayAssetsDataSource.m"), 122, CFSTR("Index path has to be for a section or item."));

    abort();
  }
  item = a3->item;
  if (a3->section == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (item == 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_12;
  }
  else if (item == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[PXStaticDisplayAssetsDataSource assetCollectionBySection](self, "assetCollectionBySection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", a3->section);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  if (a3->subitem != 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_12;
  -[PXStaticDisplayAssetsDataSource exposedAssetsBySection](self, "exposedAssetsBySection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", a3->section);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndexedSubscript:", a3->item);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_11:
  return v9;
}

- (id)objectsInIndexPath:(PXSimpleIndexPath *)a3
{
  int64_t dataSourceIdentifier;
  void *v9;
  void *v10;
  void *v12;
  void *v13;

  dataSourceIdentifier = a3->dataSourceIdentifier;
  if (dataSourceIdentifier != -[PXStaticDisplayAssetsDataSource identifier](self, "identifier"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStaticDisplayAssetsDataSource.m"), 128, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indexPath.dataSourceIdentifier == self.identifier"));

  }
  if (a3->dataSourceIdentifier == *(_QWORD *)off_1E50B7E98
    || a3->section == 0x7FFFFFFFFFFFFFFFLL
    || a3->item != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStaticDisplayAssetsDataSource.m"), 133, CFSTR("Index path has to be for a section."));

    abort();
  }
  -[PXStaticDisplayAssetsDataSource exposedAssetsBySection](self, "exposedAssetsBySection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", a3->section);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)hasCurationForAssetCollection:(id)a3
{
  return -[PXStaticDisplayAssetsDataSource sectionContent](self, "sectionContent", a3) == 1;
}

- (id)keyAssetsInSectionIndexPath:(PXSimpleIndexPath *)a3
{
  int64_t dataSourceIdentifier;
  void *v7;
  void *v8;
  void *v10;

  dataSourceIdentifier = a3->dataSourceIdentifier;
  if (dataSourceIdentifier != -[PXStaticDisplayAssetsDataSource identifier](self, "identifier"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStaticDisplayAssetsDataSource.m"), 143, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indexPath.dataSourceIdentifier == self.identifier"));

  }
  -[PXStaticDisplayAssetsDataSource keyAssetsBySection](self, "keyAssetsBySection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", a3->section);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)keyAssetsForAssetCollection:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[PXStaticDisplayAssetsDataSource assetCollectionBySection](self, "assetCollectionBySection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = 0;
  }
  else
  {
    -[PXStaticDisplayAssetsDataSource keyAssetsBySection](self, "keyAssetsBySection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (PXSimpleIndexPath)indexPathForObjectReference:(SEL)a3
{
  __int128 v6;
  int64_t v7;
  id v8;
  int64_t v9;
  void *v10;
  id v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  int64_t ResultIndexOfObject;
  PXSimpleIndexPath *result;
  id v18;

  v18 = a4;
  v6 = *((_OWORD *)off_1E50B8778 + 1);
  *(_OWORD *)&retstr->dataSourceIdentifier = *(_OWORD *)off_1E50B8778;
  *(_OWORD *)&retstr->item = v6;
  v7 = -[PXStaticDisplayAssetsDataSource identifier](self, "identifier");
  objc_msgSend(v18, "leafObject");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (-[PXStaticDisplayAssetsDataSource numberOfSections](self, "numberOfSections") >= 1)
  {
    v9 = 0;
    while (1)
    {
      -[PXStaticDisplayAssetsDataSource assetCollectionBySection](self, "assetCollectionBySection");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectAtIndexedSubscript:", v9);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      if (v8 == v11)
        break;
      v12 = v11;
      v13 = objc_msgSend(v8, "isEqual:", v11);

      if ((v13 & 1) != 0)
        goto LABEL_9;
      -[PXStaticDisplayAssetsDataSource exposedAssetsBySection](self, "exposedAssetsBySection");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectAtIndexedSubscript:", v9);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      ResultIndexOfObject = PXSectionedFetchResultIndexOfObject();

      if (ResultIndexOfObject != 0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_10;
      if (++v9 >= -[PXStaticDisplayAssetsDataSource numberOfSections](self, "numberOfSections"))
        goto LABEL_11;
    }

LABEL_9:
    ResultIndexOfObject = 0x7FFFFFFFFFFFFFFFLL;
LABEL_10:
    retstr->dataSourceIdentifier = v7;
    retstr->section = v9;
    retstr->item = ResultIndexOfObject;
    retstr->subitem = 0x7FFFFFFFFFFFFFFFLL;
  }
LABEL_11:

  return result;
}

- (int64_t)sectionContent
{
  return self->_sectionContent;
}

- (NSArray)assetCollectionBySection
{
  return self->_assetCollectionBySection;
}

- (NSArray)assetsBySection
{
  return self->_assetsBySection;
}

- (NSArray)curatedAssetsBySection
{
  return self->_curatedAssetsBySection;
}

- (NSArray)keyAssetsBySection
{
  return self->_keyAssetsBySection;
}

- (NSArray)exposedAssetsBySection
{
  return self->_exposedAssetsBySection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exposedAssetsBySection, 0);
  objc_storeStrong((id *)&self->_keyAssetsBySection, 0);
  objc_storeStrong((id *)&self->_curatedAssetsBySection, 0);
  objc_storeStrong((id *)&self->_assetsBySection, 0);
  objc_storeStrong((id *)&self->_assetCollectionBySection, 0);
}

@end
