@implementation PUCameraTransientAssetActionManager

- (BOOL)canPerformActionType:(unint64_t)a3 onAsset:(id)a4 inAssetCollection:(id)a5
{
  id v7;
  id v8;
  char v9;
  BOOL v10;
  id v12;
  void *v13;
  uint64_t v14;
  BOOL v15;

  v7 = a4;
  v8 = a5;
  v9 = 0;
  if (a3 <= 0x3E)
  {
    if (((1 << a3) & 0x4000018080008100) != 0)
    {
      v9 = 1;
    }
    else if (a3 == 33)
    {
      if (objc_msgSend(v7, "conformsToProtocol:", &unk_1EED7ACE0))
      {
        v12 = v7;
        objc_msgSend(v12, "burstIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v12, "numberOfRepresentedAssets");

        if (v13)
          v15 = v14 <= 1;
        else
          v15 = 1;
        v9 = !v15;

      }
      else
      {
        v9 = 0;
      }
    }
  }
  if (a3 == 8)
    v10 = 1;
  else
    v10 = v9;

  return v10;
}

- (BOOL)shouldEnableActionType:(unint64_t)a3 onAsset:(id)a4 inAssetCollection:(id)a5
{
  return 0;
}

@end
