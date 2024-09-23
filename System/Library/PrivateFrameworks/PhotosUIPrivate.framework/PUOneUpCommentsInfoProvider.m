@implementation PUOneUpCommentsInfoProvider

+ (unint64_t)commentCountForDisplayAsset:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;

  v4 = a3;
  if (objc_msgSend(a1, "_canHandleDisplayAsset:", v4))
  {
    objc_msgSend(v4, "commentProperties");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "commentCount");

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (unint64_t)likeCountForDisplayAsset:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;

  v4 = a3;
  if (objc_msgSend(a1, "_canHandleDisplayAsset:", v4))
  {
    objc_msgSend(v4, "commentProperties");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "likeCount");

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (BOOL)hasUserLikedDisplayAsset:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  if (objc_msgSend(a1, "_canHandleDisplayAsset:", v4))
  {
    objc_msgSend(v4, "commentProperties");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "hasUserLiked");

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (void)toggleLike:(BOOL)a3 forDisplayAsset:(id)a4
{
  _BOOL4 v4;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t);
  void *v19;
  id v20;
  id v21;
  BOOL v22;
  uint64_t v23;
  _QWORD v24[2];

  v4 = a3;
  v24[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (objc_msgSend(a1, "_canHandleDisplayAsset:", v6))
  {
    v7 = v6;
    objc_msgSend(MEMORY[0x1E0D719A8], "systemPhotoLibrary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pl_managedAssetFromPhotoLibrary:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "photoLibrary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __58__PUOneUpCommentsInfoProvider_toggleLike_forDisplayAsset___block_invoke;
    v19 = &unk_1E58AA878;
    v22 = v4;
    v20 = v7;
    v21 = v9;
    v11 = v9;
    v12 = v7;
    objc_msgSend(v10, "performTransaction:", &v16);

    PLSAggregateDictionaryAddValueForScalarKey();
    v13 = (void *)MEMORY[0x1E0D09910];
    if (v4)
      v14 = CFSTR("com.apple.photos.CPAnalytics.oneUpSharedAssetLiked");
    else
      v14 = CFSTR("com.apple.photos.CPAnalytics.oneUpSharedAssetUnliked");
    v23 = *MEMORY[0x1E0D09828];
    v24[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1, v16, v17, v18, v19);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sendEvent:withPayload:", v14, v15);

  }
}

+ (BOOL)_canHandleDisplayAsset:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = objc_msgSend(v3, "isCloudSharedAsset");
  else
    v4 = 0;

  return v4;
}

uint64_t __58__PUOneUpCommentsInfoProvider_toggleLike_forDisplayAsset___block_invoke(uint64_t a1)
{
  int v2;
  _BOOL4 v3;
  void *v4;
  void *v5;
  NSObject *v6;
  const char *v7;
  _BYTE v9[24];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = *(unsigned __int8 *)(a1 + 48);
  v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO);
  if (v2)
  {
    if (v3)
    {
      objc_msgSend(*(id *)(a1 + 32), "uuid");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "uuid");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v9 = 138543618;
      *(_QWORD *)&v9[4] = v4;
      *(_WORD *)&v9[12] = 2114;
      *(_QWORD *)&v9[14] = v5;
      v6 = MEMORY[0x1E0C81028];
      v7 = "[79401480]: LIKING PHAsset (%{public}@), PLAsset (%{public}@)";
LABEL_6:
      _os_log_impl(&dword_1AAB61000, v6, OS_LOG_TYPE_INFO, v7, v9, 0x16u);

    }
  }
  else if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "uuid");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "uuid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v9 = 138543618;
    *(_QWORD *)&v9[4] = v4;
    *(_WORD *)&v9[12] = 2114;
    *(_QWORD *)&v9[14] = v5;
    v6 = MEMORY[0x1E0C81028];
    v7 = "[79401480]: UNLIKING PHAsset (%{public}@), PLAsset (%{public}@)";
    goto LABEL_6;
  }
  return objc_msgSend(*(id *)(a1 + 40), "setUserCloudSharedLiked:", *(unsigned __int8 *)(a1 + 48), *(_OWORD *)v9, *(_QWORD *)&v9[16], v10);
}

@end
