@implementation PXAssetBadgeManager

- (PXAssetBadgeInfo)badgeInfoForAsset:(SEL)a3 inCollection:(id)a4 options:(id)a5
{
  char v6;
  id v8;
  void *v9;
  __int128 v10;
  int v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  int v17;
  double v18;
  uint64_t v19;
  int64_t v20;
  void *v21;
  void *v22;
  PXAssetBadgeInfo *result;
  __int128 v24;
  __int128 v25;

  v6 = a6;
  v8 = a4;
  v9 = v8;
  v10 = *((_OWORD *)off_1E50B7E20 + 1);
  *(_OWORD *)&retstr->badges = *(_OWORD *)off_1E50B7E20;
  *(_OWORD *)&retstr->count = v10;
  if (!v8)
    goto LABEL_57;
  v11 = objc_msgSend(v8, "mediaSubtypes");
  if (PXDisplayAssetSupportsSyndication(v9) && PXDisplayAssetIsSyndicatedAndUnsaved(v9))
  {
    v12 = v9;
    if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;

    objc_msgSend(v13, "photoLibrary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      +[PXContentSyndicationConfigurationProvider contentSyndicationConfigurationProviderWithPhotoLibrary:](PXContentSyndicationConfigurationProvider, "contentSyndicationConfigurationProviderWithPhotoLibrary:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v15, "showUnsavedSyndicatedContentInPhotosGrids"))
        retstr->badges |= 0x80000000uLL;

    }
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v16 = objc_msgSend(v9, "playbackStyle");
  else
    v16 = 0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v17 = objc_msgSend(v9, "playbackVariation");
  else
    v17 = 0;
  if (objc_msgSend(v9, "isFavorite"))
  {
    retstr->badges |= 1uLL;
    if ((v11 & 1) == 0)
    {
LABEL_21:
      if ((v11 & 2) == 0)
        goto LABEL_22;
      goto LABEL_28;
    }
  }
  else if ((v11 & 1) == 0)
  {
    goto LABEL_21;
  }
  retstr->badges |= 2uLL;
  if ((v11 & 2) == 0)
  {
LABEL_22:
    if ((v11 & 0x100000) == 0)
      goto LABEL_23;
    goto LABEL_29;
  }
LABEL_28:
  retstr->badges |= 4uLL;
  if ((v11 & 0x100000) == 0)
  {
LABEL_23:
    if ((v11 & 0x10) == 0)
      goto LABEL_24;
LABEL_30:
    retstr->badges |= 0x10uLL;
    if ((v6 & 4) != 0)
      goto LABEL_33;
    goto LABEL_31;
  }
LABEL_29:
  retstr->badges |= 0x400uLL;
  if ((v11 & 0x10) != 0)
    goto LABEL_30;
LABEL_24:
  if ((v6 & 4) != 0)
    goto LABEL_33;
LABEL_31:
  if (v16 == 4)
  {
    objc_msgSend(v9, "duration");
    retstr->duration = v18;
  }
LABEL_33:
  if ((v6 & 8) != 0 && (objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v9, "isSpatialMedia"))
    retstr->badges |= 0x20000000000uLL;
  if (v17 == 1 && v16 == 5)
  {
    v19 = 128;
  }
  else if (v17 == 2 && v16 == 5)
  {
    v19 = 256;
  }
  else if (v17 == 3)
  {
    v19 = 512;
  }
  else
  {
    v19 = 64;
    if (v16 != 3 && (v11 & 8) == 0)
      goto LABEL_48;
  }
  retstr->badges |= v19;
LABEL_48:
  if ((v6 & 2) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v20 = objc_msgSend(v9, "originalFileSize");
    if (v20 >= 1)
    {
      retstr->badges |= 0x10000000000uLL;
      retstr->fileSize = v20;
    }
  }
  v24 = 0u;
  v25 = 0u;
  +[PXPhotosDetailsSettings sharedInstance](PXPhotosDetailsSettings, "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v21)
  {
    objc_msgSend(v21, "debugBadgeInfo");
  }
  else
  {
    v24 = 0u;
    v25 = 0u;
  }

  if ((PXAssetBadgeInfoIsNull() & 1) == 0)
  {
    *(_OWORD *)&retstr->badges = v24;
    *(_OWORD *)&retstr->count = v25;
  }
LABEL_57:

  return result;
}

+ (PXAssetBadgeManager)defaultManager
{
  if (defaultManager_onceToken_108189 != -1)
    dispatch_once(&defaultManager_onceToken_108189, &__block_literal_global_108190);
  return (PXAssetBadgeManager *)(id)defaultManager_defaultManager_108191;
}

void __37__PXAssetBadgeManager_defaultManager__block_invoke()
{
  PXAssetBadgeManager *v0;
  void *v1;

  v0 = objc_alloc_init(PXAssetBadgeManager);
  v1 = (void *)defaultManager_defaultManager_108191;
  defaultManager_defaultManager_108191 = (uint64_t)v0;

}

- (PXAssetBadgeInfo)badgeInfoForCollection:(SEL)a3 options:(id)a4
{
  __int128 v6;
  char isKindOfClass;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  PXAssetBadgeInfo *result;
  id v12;

  v12 = a4;
  v6 = *((_OWORD *)off_1E50B7E20 + 1);
  *(_OWORD *)&retstr->badges = *(_OWORD *)off_1E50B7E20;
  *(_OWORD *)&retstr->count = v6;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v8 = v12;
  if ((isKindOfClass & 1) != 0)
  {
    v9 = objc_msgSend(v12, "assetCollectionSubtype");
    if (v9 == 203)
    {
      v10 = 1;
      v8 = v12;
      goto LABEL_6;
    }
    v8 = v12;
    if (v9 == 201)
    {
      v10 = 2;
LABEL_6:
      retstr->badges |= v10;
    }
  }

  return result;
}

@end
