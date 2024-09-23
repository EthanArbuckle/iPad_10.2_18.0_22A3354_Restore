@implementation PUOneUpAssetsDataSourceConverter

- (BOOL)shouldReloadTileControllerFromAsset:(id)a3 toAsset:(id)a4 tileKind:(id)a5
{
  id v7;
  id v8;
  BOOL v9;
  int v10;
  int v11;
  int v12;
  int v13;

  v7 = a3;
  v8 = a4;
  if (a5 == CFSTR("PUTileKindItemContent"))
  {
    if ((objc_msgSend(v7, "canPlayPhotoIris") & 1) != 0)
      v10 = 1;
    else
      v10 = objc_msgSend(v7, "isPhotoIrisPlaceholder");
    if ((objc_msgSend(v8, "canPlayPhotoIris") & 1) != 0)
      v11 = 1;
    else
      v11 = objc_msgSend(v8, "isPhotoIrisPlaceholder");
    v12 = objc_msgSend(v7, "canPlayLoopingVideo");
    v13 = v12 ^ objc_msgSend(v8, "canPlayLoopingVideo");
    if (v10 == v11)
      v9 = v13;
    else
      v9 = 1;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)defaultConverter
{
  if (defaultConverter_onceToken_48578 != -1)
    dispatch_once(&defaultConverter_onceToken_48578, &__block_literal_global_48579);
  return (id)defaultConverter_defaultConverter_48580;
}

void __52__PUOneUpAssetsDataSourceConverter_defaultConverter__block_invoke()
{
  PUOneUpAssetsDataSourceConverter *v0;
  void *v1;

  v0 = objc_alloc_init(PUOneUpAssetsDataSourceConverter);
  v1 = (void *)defaultConverter_defaultConverter_48580;
  defaultConverter_defaultConverter_48580 = (uint64_t)v0;

}

@end
