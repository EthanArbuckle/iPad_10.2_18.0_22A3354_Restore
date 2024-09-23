@implementation PXSyntheticAssetsDataSourceBuilder

- (PXSyntheticAssetsDataSourceBuilder)init
{
  PXSyntheticAssetsDataSourceBuilder *v2;
  NSMutableArray *v3;
  NSMutableArray *mutableAssetsBySection;
  NSMutableArray *v5;
  NSMutableArray *mutableAssetCollections;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXSyntheticAssetsDataSourceBuilder;
  v2 = -[PXSyntheticAssetsDataSourceBuilder init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    mutableAssetsBySection = v2->_mutableAssetsBySection;
    v2->_mutableAssetsBySection = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    mutableAssetCollections = v2->_mutableAssetCollections;
    v2->_mutableAssetCollections = v5;

  }
  return v2;
}

- (NSArray)assetsBySection
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_mutableAssetsBySection, "copy");
}

- (NSArray)assetCollections
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_mutableAssetCollections, "copy");
}

- (void)appendDisplayAssetSectionWithCount:(int64_t)a3 assetCollection:(id)a4 assetBlock:(id)a5
{
  id v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSMutableArray *mutableAssetCollections;
  void *v16;
  void *v17;
  id v18;

  v18 = a4;
  v9 = a5;
  v10 = (void (**)(_QWORD, _QWORD, _QWORD))v9;
  if (a3 && !v9)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSyntheticAssetsDataSourceBuilder.m"), 36, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assetBlock != nil || count == 0"));

  }
  v11 = -[NSMutableArray count](self->_mutableAssetsBySection, "count");
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", a3);
  if (a3 >= 1)
  {
    v13 = 0;
    do
    {
      v10[2](v10, v11, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObject:", v14);

      ++v13;
    }
    while (a3 != v13);
  }
  -[NSMutableArray addObject:](self->_mutableAssetsBySection, "addObject:", v12);
  mutableAssetCollections = self->_mutableAssetCollections;
  v16 = (void *)objc_msgSend(v18, "copyWithZone:", 0);
  -[NSMutableArray addObject:](mutableAssetCollections, "addObject:", v16);

}

- (void)appendDisplayAssetsWithCount:(int64_t)a3 assetBlock:(id)a4
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void (**v15)(id, uint64_t, uint64_t);

  v15 = (void (**)(id, uint64_t, uint64_t))a4;
  if (a3 <= 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSyntheticAssetsDataSourceBuilder.m"), 49, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("count > 0"));

  }
  -[NSMutableArray lastObject](self->_mutableAssetsBySection, "lastObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSyntheticAssetsDataSourceBuilder.m"), 51, CFSTR("Append may not be called before there are any sections"));

  }
  v8 = -[NSMutableArray count](self->_mutableAssetsBySection, "count");
  v9 = objc_msgSend(v7, "count");
  if (a3 >= 1)
  {
    v10 = v9;
    v11 = v8 - 1;
    do
    {
      v15[2](v15, v11, v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v12);

      ++v10;
      --a3;
    }
    while (a3);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableAssetCollections, 0);
  objc_storeStrong((id *)&self->_mutableAssetsBySection, 0);
}

@end
