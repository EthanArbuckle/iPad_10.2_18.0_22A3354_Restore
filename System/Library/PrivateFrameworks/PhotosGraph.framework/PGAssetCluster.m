@implementation PGAssetCluster

- (PGAssetCluster)initWithAssets:(id)a3 region:(id)a4
{
  id v7;
  id v8;
  PGAssetCluster *v9;
  PGAssetCluster *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PGAssetCluster;
  v9 = -[PGAssetCluster init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_assets, a3);
    objc_storeStrong((id *)&v10->_region, a4);
  }

  return v10;
}

- (NSArray)assets
{
  return self->_assets;
}

- (CLCircularRegion)region
{
  return self->_region;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_region, 0);
  objc_storeStrong((id *)&self->_assets, 0);
}

@end
