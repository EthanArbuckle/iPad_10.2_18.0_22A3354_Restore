@implementation PCNativeAsset

- (id)initWithAsset:(id)a3
{
  id v4;
  PCNativeAsset *v5;
  PCNativeAsset *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v4 = a3;
  v5 = -[PCNativeAsset init](self, "init");
  v6 = v5;
  if (v4 && v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
    -[PCNativeAsset setName:](v6, "setName:", v7);

    -[PCNativeAsset setLocation:](v6, "setLocation:", (int)objc_msgSend(v4, "location"));
    -[PCNativeAsset setAdamID:](v6, "setAdamID:", objc_msgSend(v4, "adamId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "treatment"));
    -[PCNativeAsset setTreatment:](v6, "setTreatment:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "assetInfos", 0));
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v19;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v19 != v13)
            objc_enumerationMutation(v10);
          v15 = objc_msgSend(objc_alloc((Class)PCNativeAssetInfo), "initWithAssetInfo:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v14));
          objc_msgSend(v9, "addObject:", v15);

          v14 = (char *)v14 + 1;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v12);
    }

    v16 = objc_msgSend(v9, "copy");
    -[PCNativeAsset setAssetInformation:](v6, "setAssetInformation:", v16);

  }
  return v6;
}

@end
