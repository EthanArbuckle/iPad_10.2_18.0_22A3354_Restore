@implementation PXStoryRecipeAssetEdits

- (PXStoryRecipeAssetEdits)init
{
  __int128 v2;
  __int128 v3;
  _OWORD v5[5];

  v2 = *(_OWORD *)(MEMORY[0x1E0D759B0] + 48);
  v5[2] = *(_OWORD *)(MEMORY[0x1E0D759B0] + 32);
  v5[3] = v2;
  v5[4] = *(_OWORD *)(MEMORY[0x1E0D759B0] + 64);
  v3 = *(_OWORD *)(MEMORY[0x1E0D759B0] + 16);
  v5[0] = *MEMORY[0x1E0D759B0];
  v5[1] = v3;
  return -[PXStoryRecipeAssetEdits initWithKeyAsset:overallDurationInfo:userCuratedAssets:customUserAssetsEdit:](self, "initWithKeyAsset:overallDurationInfo:userCuratedAssets:customUserAssetsEdit:", 0, v5, 0, 0);
}

- (PXStoryRecipeAssetEdits)initWithKeyAsset:(id)a3 overallDurationInfo:(id *)a4 userCuratedAssets:(id)a5 customUserAssetsEdit:(id)a6
{
  id v11;
  id v12;
  id v13;
  PXStoryRecipeAssetEdits *v14;
  PXStoryRecipeAssetEdits *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  objc_super v20;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)PXStoryRecipeAssetEdits;
  v14 = -[PXStoryRecipeAssetEdits init](&v20, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_keyAsset, a3);
    *(_OWORD *)&v15->_overallDurationInfo.kind = *(_OWORD *)&a4->var0;
    v16 = *(_OWORD *)&a4->var1.var0.var1;
    v17 = *(_OWORD *)&a4->var1.var1.var0;
    v18 = *(_OWORD *)&a4->var1.var2.var1;
    *(_OWORD *)&v15->_overallDurationInfo.specificDurationInfo.preferredDuration.epoch = *(_OWORD *)&a4->var1.var1.var3;
    *(_OWORD *)&v15->_overallDurationInfo.specificDurationInfo.maximumDuration.timescale = v18;
    *(_OWORD *)&v15->_overallDurationInfo.specificDurationInfo.minimumDuration.timescale = v16;
    *(_OWORD *)&v15->_overallDurationInfo.specificDurationInfo.preferredDuration.value = v17;
    objc_storeStrong((id *)&v15->_userCuratedAssets, a5);
    objc_storeStrong((id *)&v15->_customUserAssetsEdit, a6);
  }

  return v15;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[PXStoryRecipeAssetEdits keyAsset](self, "keyAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  PXStoryRecipeAssetEdits *v4;
  PXStoryRecipeAssetEdits *v5;
  PXDisplayAsset *keyAsset;
  PXDisplayAsset *v7;
  PXDisplayAsset *v8;
  int v9;
  uint64_t v10;
  char v11;
  PXDisplayAssetFetchResult *userCuratedAssets;
  PXDisplayAssetFetchResult *v14;
  PXDisplayAssetFetchResult *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  __int128 v21;
  _QWORD v22[4];
  __int128 v23;
  _OWORD v24[2];
  CMTime maximumDuration;
  CMTime time2;
  CMTime time1;

  v4 = (PXStoryRecipeAssetEdits *)a3;
  if (v4 == self)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      keyAsset = self->_keyAsset;
      -[PXStoryRecipeAssetEdits keyAsset](v5, "keyAsset");
      v7 = (PXDisplayAsset *)(id)objc_claimAutoreleasedReturnValue();
      if (keyAsset == v7)
      {

        if (v5)
        {
LABEL_6:
          -[PXStoryRecipeAssetEdits overallDurationInfo](v5, "overallDurationInfo");
          v10 = v20[0];
          goto LABEL_11;
        }
      }
      else
      {
        v8 = v7;
        v9 = -[PXDisplayAsset isEqual:](keyAsset, "isEqual:", v7);

        if (!v9)
          goto LABEL_15;
        if (v5)
          goto LABEL_6;
      }
      v10 = 0;
      memset(v22, 0, sizeof(v22));
      v21 = 0u;
      memset(v20, 0, sizeof(v20));
LABEL_11:
      if (self->_overallDurationInfo.kind != v10)
        goto LABEL_15;
      v24[1] = *(_OWORD *)&self->_overallDurationInfo.specificDurationInfo.preferredDuration.timescale;
      maximumDuration = (CMTime)self->_overallDurationInfo.specificDurationInfo.maximumDuration;
      v24[0] = *(_OWORD *)&self->_overallDurationInfo.specificDurationInfo.minimumDuration.epoch;
      v23 = v21;
      time1 = (CMTime)self->_overallDurationInfo.specificDurationInfo.minimumDuration;
      time2 = *(CMTime *)&v20[1];
      if (CMTimeCompare(&time1, &time2))
        goto LABEL_15;
      time1 = *(CMTime *)((char *)v24 + 8);
      *(_OWORD *)&time2.value = v23;
      time2.epoch = v22[0];
      if (CMTimeCompare(&time1, &time2))
        goto LABEL_15;
      time1 = maximumDuration;
      time2 = *(CMTime *)&v22[1];
      if (CMTimeCompare(&time1, &time2))
        goto LABEL_15;
      userCuratedAssets = self->_userCuratedAssets;
      -[PXStoryRecipeAssetEdits userCuratedAssets](v5, "userCuratedAssets");
      v14 = (PXDisplayAssetFetchResult *)(id)objc_claimAutoreleasedReturnValue();
      if (userCuratedAssets == v14)
      {

LABEL_22:
        -[PXMemoryCustomUserAssetsEdit assets](self->_customUserAssetsEdit, "assets", v20[0]);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXStoryRecipeAssetEdits customUserAssetsEdit](v5, "customUserAssetsEdit");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "assets");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17 == v19)
          v11 = 1;
        else
          v11 = objc_msgSend(v17, "isEqual:", v19);

        goto LABEL_16;
      }
      v15 = v14;
      v16 = -[PXDisplayAssetFetchResult isEqual:](userCuratedAssets, "isEqual:", v14);

      if (v16)
        goto LABEL_22;
LABEL_15:
      v11 = 0;
LABEL_16:

      goto LABEL_17;
    }
    v11 = 0;
  }
LABEL_17:

  return v11;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryRecipeAssetEdits keyAsset](self, "keyAsset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryRecipeAssetEdits overallDurationInfo](self, "overallDurationInfo");
  PFStoryOverallDurationInfoDescription();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryRecipeAssetEdits userCuratedAssets](self, "userCuratedAssets");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");
  -[PXStoryRecipeAssetEdits customUserAssetsEdit](self, "customUserAssetsEdit");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "assets");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p; keyAsset:%@, overallDurationInfo:%@, userCuratedAssets:%ld, customUserAssets:%ld>"),
    v5,
    self,
    v7,
    v8,
    v10,
    objc_msgSend(v12, "count"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)copyWithKeyAsset:(id)a3
{
  id v4;
  PXStoryRecipeAssetEdits *v5;
  void *v6;
  void *v7;
  PXStoryRecipeAssetEdits *v8;
  uint64_t v10;

  v4 = a3;
  v5 = [PXStoryRecipeAssetEdits alloc];
  -[PXStoryRecipeAssetEdits overallDurationInfo](self, "overallDurationInfo");
  -[PXStoryRecipeAssetEdits userCuratedAssets](self, "userCuratedAssets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryRecipeAssetEdits customUserAssetsEdit](self, "customUserAssetsEdit");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PXStoryRecipeAssetEdits initWithKeyAsset:overallDurationInfo:userCuratedAssets:customUserAssetsEdit:](v5, "initWithKeyAsset:overallDurationInfo:userCuratedAssets:customUserAssetsEdit:", v4, &v10, v6, v7);

  return v8;
}

- (id)copyWithOverallDurationInfo:(id *)a3 userCuratedAssets:(id)a4
{
  id v6;
  PXStoryRecipeAssetEdits *v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  PXStoryRecipeAssetEdits *v12;
  _OWORD v14[5];

  v6 = a4;
  v7 = [PXStoryRecipeAssetEdits alloc];
  -[PXStoryRecipeAssetEdits keyAsset](self, "keyAsset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryRecipeAssetEdits customUserAssetsEdit](self, "customUserAssetsEdit");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(_OWORD *)&a3->var1.var1.var3;
  v14[2] = *(_OWORD *)&a3->var1.var1.var0;
  v14[3] = v10;
  v14[4] = *(_OWORD *)&a3->var1.var2.var1;
  v11 = *(_OWORD *)&a3->var1.var0.var1;
  v14[0] = *(_OWORD *)&a3->var0;
  v14[1] = v11;
  v12 = -[PXStoryRecipeAssetEdits initWithKeyAsset:overallDurationInfo:userCuratedAssets:customUserAssetsEdit:](v7, "initWithKeyAsset:overallDurationInfo:userCuratedAssets:customUserAssetsEdit:", v8, v14, v6, v9);

  return v12;
}

- (id)copyWithCustomUserAssets:(id)a3
{
  id v4;
  PXMemoryCustomUserAssetsEdit *v5;
  PXStoryRecipeAssetEdits *v6;
  void *v7;
  void *v8;
  PXStoryRecipeAssetEdits *v9;
  uint64_t v11;

  v4 = a3;
  v5 = -[PXMemoryCustomUserAssetsEdit initWithAssets:]([PXMemoryCustomUserAssetsEdit alloc], "initWithAssets:", v4);

  v6 = [PXStoryRecipeAssetEdits alloc];
  -[PXStoryRecipeAssetEdits keyAsset](self, "keyAsset");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryRecipeAssetEdits overallDurationInfo](self, "overallDurationInfo");
  -[PXStoryRecipeAssetEdits userCuratedAssets](self, "userCuratedAssets");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PXStoryRecipeAssetEdits initWithKeyAsset:overallDurationInfo:userCuratedAssets:customUserAssetsEdit:](v6, "initWithKeyAsset:overallDurationInfo:userCuratedAssets:customUserAssetsEdit:", v7, &v11, v8, v5);

  return v9;
}

- (PXDisplayAsset)keyAsset
{
  return self->_keyAsset;
}

- (PXMemoryCustomUserAssetsEdit)customUserAssetsEdit
{
  return self->_customUserAssetsEdit;
}

- (PXDisplayAssetFetchResult)userCuratedAssets
{
  return self->_userCuratedAssets;
}

- ($336525CEFD5B2F1C5550B48E7B6054AC)overallDurationInfo
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&self[1].var0;
  *(_OWORD *)&retstr->var1.var1.var0 = *(_OWORD *)&self->var1.var2.var1;
  *(_OWORD *)&retstr->var1.var1.var3 = v3;
  *(_OWORD *)&retstr->var1.var2.var1 = *(_OWORD *)&self[1].var1.var0.var1;
  v4 = *(_OWORD *)&self->var1.var1.var3;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self->var1.var1.var0;
  *(_OWORD *)&retstr->var1.var0.var1 = v4;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userCuratedAssets, 0);
  objc_storeStrong((id *)&self->_customUserAssetsEdit, 0);
  objc_storeStrong((id *)&self->_keyAsset, 0);
}

@end
