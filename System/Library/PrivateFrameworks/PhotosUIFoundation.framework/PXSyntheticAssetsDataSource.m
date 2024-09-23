@implementation PXSyntheticAssetsDataSource

- (PXSyntheticAssetsDataSource)initWithAssetsBySection:(id)a3 assetCollections:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  PXSyntheticAssetsDataSource *v10;
  uint64_t v11;
  NSArray *assetsBySection;
  uint64_t v13;
  NSArray *assetCollections;
  void *v16;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v9 = objc_msgSend(v7, "count");
  if (v9 != objc_msgSend(v8, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSyntheticAssetsDataSource.m"), 16, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assetsBySection.count == assetCollections.count"));

  }
  v17.receiver = self;
  v17.super_class = (Class)PXSyntheticAssetsDataSource;
  v10 = -[PXSectionedDataSource init](&v17, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v7, "copy");
    assetsBySection = v10->_assetsBySection;
    v10->_assetsBySection = (NSArray *)v11;

    v13 = objc_msgSend(v8, "copy");
    assetCollections = v10->_assetCollections;
    v10->_assetCollections = (NSArray *)v13;

  }
  return v10;
}

- (PXSyntheticAssetsDataSource)initWithConfigurationBlock:(id)a3
{
  void (**v4)(id, PXSyntheticAssetsDataSourceBuilder *);
  PXSyntheticAssetsDataSourceBuilder *v5;
  void *v6;
  void *v7;
  PXSyntheticAssetsDataSource *v8;

  v4 = (void (**)(id, PXSyntheticAssetsDataSourceBuilder *))a3;
  v5 = objc_alloc_init(PXSyntheticAssetsDataSourceBuilder);
  v4[2](v4, v5);

  -[PXSyntheticAssetsDataSourceBuilder assetsBySection](v5, "assetsBySection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSyntheticAssetsDataSourceBuilder assetCollections](v5, "assetCollections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PXSyntheticAssetsDataSource initWithAssetsBySection:assetCollections:](self, "initWithAssetsBySection:assetCollections:", v6, v7);

  return v8;
}

- (int64_t)numberOfSections
{
  void *v2;
  int64_t v3;

  -[PXSyntheticAssetsDataSource assetsBySection](self, "assetsBySection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  void *v6;
  void *v7;
  int64_t v8;
  void *v10;

  if (-[PXSyntheticAssetsDataSource numberOfSections](self, "numberOfSections") <= a3)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSyntheticAssetsDataSource.m"), 38, CFSTR("Out-of-bounds section"));

  }
  -[PXSyntheticAssetsDataSource assetsBySection](self, "assetsBySection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  return v8;
}

- (int64_t)numberOfSubitemsInItem:(int64_t)a3 section:(int64_t)a4
{
  void *v6;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSyntheticAssetsDataSource.m"), 44, CFSTR("Subitems not supported"));

  abort();
}

- (id)objectAtIndexPath:(PXSimpleIndexPath *)a3
{
  int64_t dataSourceIdentifier;
  int64_t item;
  int64_t section;
  void *v9;
  void *v10;
  int64_t v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  dataSourceIdentifier = a3->dataSourceIdentifier;
  if (dataSourceIdentifier != -[PXSectionedDataSource identifier](self, "identifier"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSyntheticAssetsDataSource.m"), 49, CFSTR("Invalid identifier"));

  }
  if (!a3->dataSourceIdentifier)
    goto LABEL_15;
  item = a3->item;
  if (item == 0x7FFFFFFFFFFFFFFFLL)
  {
    section = a3->section;
    if (section != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (section >= -[PXSyntheticAssetsDataSource numberOfSections](self, "numberOfSections"))
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSyntheticAssetsDataSource.m"), 59, CFSTR("Out-of-bounds index path"));

      }
      -[PXSyntheticAssetsDataSource assetCollections](self, "assetCollections");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndexedSubscript:", section);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
LABEL_15:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSyntheticAssetsDataSource.m"), 63, CFSTR("Invalid index path"));

    abort();
  }
  if (a3->subitem != 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_15;
  v11 = a3->section;
  if (v11 >= -[PXSyntheticAssetsDataSource numberOfSections](self, "numberOfSections")
    || item >= -[PXSyntheticAssetsDataSource numberOfItemsInSection:](self, "numberOfItemsInSection:", v11))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSyntheticAssetsDataSource.m"), 53, CFSTR("Out-of-bounds index path"));

  }
  -[PXSyntheticAssetsDataSource assetsBySection](self, "assetsBySection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectAtIndexedSubscript:", item);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_13:
  return v10;
}

- (PXSimpleIndexPath)indexPathForObjectID:(SEL)a3
{
  uint64_t v6;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  int64_t v13;
  PXSimpleIndexPath *result;
  void *v15;
  objc_class *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  id v21;
  _QWORD v22[4];
  id v23;

  v21 = a4;
  if (v21)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_3;
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "px_descriptionForAssertionMessage");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a3, self, CFSTR("PXSyntheticAssetsDataSource.m"), 68, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("objectID"), v17, v19);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a3, self, CFSTR("PXSyntheticAssetsDataSource.m"), 68, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("objectID"), v17);
  }

LABEL_3:
  v6 = -[PXSyntheticAssetsDataSource numberOfSections](self, "numberOfSections");
  if (v6 < 1)
  {
LABEL_7:
    *(_OWORD *)&retstr->dataSourceIdentifier = *(_OWORD *)PXSimpleIndexPathNull;
    *(_OWORD *)&retstr->item = *(_OWORD *)&PXSimpleIndexPathNull[16];
  }
  else
  {
    v7 = v6;
    v8 = 0;
    v9 = MEMORY[0x24BDAC760];
    while (1)
    {
      -[PXSyntheticAssetsDataSource assetsBySection](self, "assetsBySection");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectAtIndexedSubscript:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = v9;
      v22[1] = 3221225472;
      v22[2] = __52__PXSyntheticAssetsDataSource_indexPathForObjectID___block_invoke;
      v22[3] = &unk_2514D1258;
      v23 = v21;
      v12 = objc_msgSend(v11, "indexOfObjectPassingTest:", v22);
      if (v12 != 0x7FFFFFFFFFFFFFFFLL)
        break;

      if (v7 == ++v8)
        goto LABEL_7;
    }
    v13 = v12;
    retstr->dataSourceIdentifier = -[PXSectionedDataSource identifier](self, "identifier");
    retstr->section = v8;
    retstr->item = v13;
    retstr->subitem = 0x7FFFFFFFFFFFFFFFLL;

  }
  return result;
}

- (id)objectsInIndexPath:(PXSimpleIndexPath *)a3
{
  BOOL v4;
  void *v6;
  void *v7;
  PXSyntheticAssetsFetchResult *v8;
  void *v12;
  __int128 v13;
  void *v14;
  _OWORD v15[2];

  if (a3->dataSourceIdentifier)
    v4 = a3->section == 0x7FFFFFFFFFFFFFFFLL;
  else
    v4 = 1;
  if (v4 || a3->item != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(_OWORD *)&a3->item;
    v15[0] = *(_OWORD *)&a3->dataSourceIdentifier;
    v15[1] = v13;
    PXSimpleIndexPathDescription(v15);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSyntheticAssetsDataSource.m"), 89, CFSTR("%@ invalid indexPath:%@"), self, v14);

    abort();
  }
  -[PXSyntheticAssetsDataSource assetsBySection](self, "assetsBySection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", a3->section);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[PXSyntheticAssetsFetchResult initWithAssets:]([PXSyntheticAssetsFetchResult alloc], "initWithAssets:", v7);
  return v8;
}

- (NSArray)assetsBySection
{
  return self->_assetsBySection;
}

- (NSArray)assetCollections
{
  return self->_assetCollections;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetCollections, 0);
  objc_storeStrong((id *)&self->_assetsBySection, 0);
}

uint64_t __52__PXSyntheticAssetsDataSource_indexPathForObjectID___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

@end
