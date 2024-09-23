@implementation PUAssetsDataSourceConverter

- (BOOL)convertIndexPath:(id *)a3 tileKind:(id *)a4 fromDataSource:(id)a5 toDataSource:(id)a6
{
  id v10;
  id v11;
  char v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  _BOOL4 v18;
  id v20;
  objc_super v21;

  v10 = a5;
  v11 = a6;
  v21.receiver = self;
  v21.super_class = (Class)PUAssetsDataSourceConverter;
  if (-[PUTilingDataSourceConverter convertIndexPath:tileKind:fromDataSource:toDataSource:](&v21, sel_convertIndexPath_tileKind_fromDataSource_toDataSource_, a3, a4, v10, v11))
  {
    v12 = 1;
  }
  else
  {
    v13 = *a3;
    v14 = *a4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v11, "convertIndexPath:fromAssetsDataSource:", v13, v10);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        objc_msgSend(v10, "assetAtIndexPath:", v13);
        v16 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "assetAtIndexPath:", v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = -[PUAssetsDataSourceConverter shouldReloadTileControllerFromAsset:toAsset:tileKind:](self, "shouldReloadTileControllerFromAsset:toAsset:tileKind:", v16, v17, v14);
        if (v18)
        {

        }
        else
        {
          v20 = v14;

          *a3 = objc_retainAutorelease(v15);
          v16 = objc_retainAutorelease(v20);
          *a4 = v16;
        }
        v12 = !v18;

      }
      else
      {
        v12 = 0;
      }
    }
    else
    {
      v12 = 0;
      v15 = 0;
    }

  }
  return v12;
}

- (BOOL)shouldReloadTileControllerFromAsset:(id)a3 toAsset:(id)a4 tileKind:(id)a5
{
  return 0;
}

+ (PUTilingDataSourceConverter)defaultConverter
{
  if (defaultConverter_onceToken != -1)
    dispatch_once(&defaultConverter_onceToken, &__block_literal_global_14462);
  return (PUTilingDataSourceConverter *)(id)defaultConverter_defaultConverter;
}

void __47__PUAssetsDataSourceConverter_defaultConverter__block_invoke()
{
  PUAssetsDataSourceConverter *v0;
  void *v1;

  v0 = objc_alloc_init(PUAssetsDataSourceConverter);
  v1 = (void *)defaultConverter_defaultConverter;
  defaultConverter_defaultConverter = (uint64_t)v0;

}

@end
