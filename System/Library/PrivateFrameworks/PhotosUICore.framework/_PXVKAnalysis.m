@implementation _PXVKAnalysis

- (_PXVKAnalysis)initWithAsset:(id)a3 analysis:(id)a4
{
  id v7;
  id v8;
  _PXVKAnalysis *v9;
  _PXVKAnalysis *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_PXVKAnalysis;
  v9 = -[_PXVKAnalysis init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_asset, a3);
    objc_storeStrong((id *)&v10->_analysis, a4);
  }

  return v10;
}

- (PXDisplayAsset)asset
{
  return self->_asset;
}

- (PXVKImageAnalysis)analysis
{
  return self->_analysis;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analysis, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

@end
