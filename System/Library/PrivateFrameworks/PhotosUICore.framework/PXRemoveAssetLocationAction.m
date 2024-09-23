@implementation PXRemoveAssetLocationAction

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4
{
  id v6;
  void *v7;
  BOOL v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___PXRemoveAssetLocationAction;
  if (objc_msgSendSuper2(&v10, sel_canPerformOnAsset_inAssetCollection_, v6, a4))
  {
    objc_msgSend(v6, "location");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7 != 0;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)actionIdentifier
{
  return CFSTR("RemoveAssetsLocation");
}

- (id)actionNameLocalizationKey
{
  return CFSTR("PXRemoveLocationActionName");
}

- (id)analyticsActionString
{
  return CFSTR("remove");
}

- (id)locationForAsset:(id)a3 shifted:(BOOL *)a4
{
  return 0;
}

@end
