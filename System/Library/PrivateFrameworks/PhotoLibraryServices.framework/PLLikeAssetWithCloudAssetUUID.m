@implementation PLLikeAssetWithCloudAssetUUID

void ___PLLikeAssetWithCloudAssetUUID_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _BOOL4 v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "assetWithUUID:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v4 = +[PLPhotoSharingHelper canSetUserCloudSharedLiked:forAssets:error:](PLPhotoSharingHelper, "canSetUserCloudSharedLiked:forAssets:error:", 1, v3, &v8);
  v5 = v8;

  if (v4)
  {
    objc_msgSend(v2, "setUserCloudSharedLiked:", 1);
  }
  else
  {
    PLPhotoSharingGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v10 = v7;
      v11 = 2112;
      v12 = v5;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_ERROR, "Cannot like asset with UUID: \"%@\", Error: %@", buf, 0x16u);
    }

  }
}

@end
