@implementation PXConcatenatingAssetsDataSource

- (int64_t)numberOfSections
{
  PXConcatenatingAssetsDataSource *v2;
  int64_t v3;

  v2 = self;
  v3 = sub_1A6A56840();

  return v3;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  PXConcatenatingAssetsDataSource *v4;
  int64_t v5;

  v4 = self;
  v5 = sub_1A6A559A0(a3);

  return v5;
}

- (id)startingAssetReference
{
  PXConcatenatingAssetsDataSource *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1A6A55AC4();

  return v3;
}

- (PXSimpleIndexPath)indexPathForAssetReference:(SEL)a3
{
  id v6;
  PXConcatenatingAssetsDataSource *v7;
  int64_t v8;
  int64_t v9;
  int64_t v10;
  int64_t v11;
  int64_t v12;
  int64_t v13;
  int64_t v14;
  PXSimpleIndexPath *result;

  v6 = a4;
  v7 = self;
  v8 = sub_1A6A55C74(v6);
  v10 = v9;
  v12 = v11;
  v14 = v13;

  retstr->dataSourceIdentifier = v8;
  retstr->section = v10;
  retstr->item = v12;
  retstr->subitem = v14;
  return result;
}

- (id)assetReferenceAtItemIndexPath:(PXSimpleIndexPath *)a3
{
  int64_t section;
  int64_t item;
  PXConcatenatingAssetsDataSource *v5;
  void *v6;

  section = a3->section;
  item = a3->item;
  v5 = self;
  v6 = (void *)sub_1A6A55EC4((uint64_t)v5, section, item);

  return v6;
}

- (id)assetReferenceForAssetReference:(id)a3
{
  id v4;
  PXConcatenatingAssetsDataSource *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  v6 = sub_1A6A5605C(v4);

  return v6;
}

- (id)objectReferenceAtIndexPath:(PXSimpleIndexPath *)a3
{
  int64_t section;
  int64_t item;
  PXConcatenatingAssetsDataSource *v5;
  void *v6;

  section = a3->section;
  item = a3->item;
  v5 = self;
  v6 = (void *)sub_1A6A56228((uint64_t)v5, section, item);

  return v6;
}

- (id)assetAtItemIndexPath:(PXSimpleIndexPath *)a3
{
  int64_t section;
  int64_t item;
  PXConcatenatingAssetsDataSource *v5;
  void *v6;

  section = a3->section;
  item = a3->item;
  v5 = self;
  v6 = (void *)sub_1A6A56390((uint64_t)v5, section, item);

  return v6;
}

- (PXConcatenatingAssetsDataSource)init
{
  PXConcatenatingAssetsDataSource *result;

  result = (PXConcatenatingAssetsDataSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
