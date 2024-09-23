@implementation PXConcatenatingAssetsDataSourceManager

- (PXConcatenatingAssetsDataSourceManager)initWithDataSourceManagers:(id)a3
{
  unint64_t v3;

  sub_1A6856488(0, (unint64_t *)&unk_1EE90E110);
  v3 = sub_1A7AE3A10();
  return (PXConcatenatingAssetsDataSourceManager *)ConcatenatingAssetsDataSourceManager.init(dataSourceManagers:)(v3);
}

- (id)createInitialDataSource
{
  PXConcatenatingAssetsDataSourceManager *v2;
  id v3;

  v2 = self;
  v3 = sub_1A71E36D0();

  return v3;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v6;
  PXConcatenatingAssetsDataSourceManager *v7;
  id v8;

  if ((a4 & 1) != 0)
  {
    v6 = a3;
    v7 = self;
    v8 = sub_1A71E36D0();
    -[PXSectionedDataSourceManager setDataSource:changeDetails:](v7, sel_setDataSource_changeDetails_, v8, 0);

  }
}

- (PXConcatenatingAssetsDataSourceManager)init
{
  PXConcatenatingAssetsDataSourceManager *result;

  result = (PXConcatenatingAssetsDataSourceManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
