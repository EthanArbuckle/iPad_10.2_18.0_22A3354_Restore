@implementation PXRevertAssetLocationAction

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  BOOL v17;
  double v18;
  objc_super v20;

  v6 = a3;
  v20.receiver = a1;
  v20.super_class = (Class)&OBJC_METACLASS___PXRevertAssetLocationAction;
  if (objc_msgSendSuper2(&v20, sel_canPerformOnAsset_inAssetCollection_, v6, a4))
  {
    objc_msgSend(v6, "location");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PHAssetOriginalLocationForAsset();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if ((v7 != 0) != (v8 != 0))
    {
      v10 = 1;
    }
    else
    {
      v10 = 0;
      if (v7 && v8)
      {
        objc_msgSend(v8, "coordinate");
        v12 = v11;
        objc_msgSend(v9, "coordinate");
        v14 = v13;
        objc_msgSend(v7, "coordinate");
        v16 = v15;
        objc_msgSend(v7, "coordinate");
        v17 = vabdd_f64(v12, v16) >= 2.22044605e-16;
        v10 = vabdd_f64(v14, v18) >= 2.22044605e-16 || v17;
      }
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)actionIdentifier
{
  return CFSTR("RevertAssetsLocation");
}

- (id)analyticsActionString
{
  return CFSTR("revert");
}

- (id)locationForAsset:(id)a3 shifted:(BOOL *)a4
{
  return (id)PHAssetOriginalLocationForAsset();
}

@end
