@implementation PLUserActivityDaemonJob

- (PLUserActivityDaemonJob)initWithAssetsdClient:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PLUserActivityDaemonJob;
  return -[PLDaemonJob initWithAssetsdClient:](&v4, sel_initWithAssetsdClient_, a3);
}

- (void)encodeToXPCObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PLUserActivityDaemonJob;
  -[PLDaemonJob encodeToXPCObject:](&v11, sel_encodeToXPCObject_, v4);
  -[PLUserActivityDaemonJob albumUUID](self, "albumUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[PLUserActivityDaemonJob albumUUID](self, "albumUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PLXPCDictionarySetString();

  }
  -[PLUserActivityDaemonJob assetUUIDs](self, "assetUUIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[PLUserActivityDaemonJob assetUUIDs](self, "assetUUIDs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PLXPCDictionarySetArray();

  }
  -[PLUserActivityDaemonJob momentShareUUID](self, "momentShareUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[PLUserActivityDaemonJob momentShareUUID](self, "momentShareUUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PLXPCDictionarySetString();

  }
  xpc_dictionary_set_int64(v4, "actionType", self->_actionType);
  xpc_dictionary_set_int64(v4, "cloudFeedContent", self->_cloudFeedContent);

}

- (id)initFromXPCObject:(id)a3 libraryServicesManager:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PLUserActivityDaemonJob;
  v7 = -[PLDaemonJob initFromXPCObject:libraryServicesManager:](&v12, sel_initFromXPCObject_libraryServicesManager_, v6, a4);
  if (v7)
  {
    objc_msgSend(v7, "setActionType:", xpc_dictionary_get_int64(v6, "actionType"));
    PLStringFromXPCDictionary();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAlbumUUID:", v8);

    PLArrayFromXPCDictionary();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAssetUUIDs:", v9);

    objc_msgSend(v7, "setCloudFeedContent:", xpc_dictionary_get_int64(v6, "cloudFeedContent"));
    PLStringFromXPCDictionary();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setMomentShareUUID:", v10);

  }
  return v7;
}

- (int64_t)daemonOperation
{
  return 12;
}

- (void)runDaemonSide
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;

  +[PLNotificationManager sharedManager](PLNotificationManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLDaemonJob libraryServicesManager](self, "libraryServicesManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "databaseContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "newShortLivedLibraryWithName:", "-[PLUserActivityDaemonJob runDaemonSide]");

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __40__PLUserActivityDaemonJob_runDaemonSide__block_invoke;
  v9[3] = &unk_1E3677530;
  v9[4] = self;
  v10 = v6;
  v11 = v3;
  v7 = v3;
  v8 = v6;
  objc_msgSend(v8, "performTransaction:", v9);

}

- (int64_t)actionType
{
  return self->_actionType;
}

- (void)setActionType:(int64_t)a3
{
  self->_actionType = a3;
}

- (NSString)albumUUID
{
  return self->_albumUUID;
}

- (void)setAlbumUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSArray)assetUUIDs
{
  return self->_assetUUIDs;
}

- (void)setAssetUUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_assetUUIDs, a3);
}

- (unint64_t)cloudFeedContent
{
  return self->_cloudFeedContent;
}

- (void)setCloudFeedContent:(unint64_t)a3
{
  self->_cloudFeedContent = a3;
}

- (NSString)momentShareUUID
{
  return self->_momentShareUUID;
}

- (void)setMomentShareUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_momentShareUUID, 0);
  objc_storeStrong((id *)&self->_assetUUIDs, 0);
  objc_storeStrong((id *)&self->_albumUUID, 0);
}

void __40__PLUserActivityDaemonJob_runDaemonSide__block_invoke(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint8_t v20[16];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1[4], "albumUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(a1[5], "albumWithUuid:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3
      && objc_msgSend(v3, "isCloudSharedAlbum")
      && objc_msgSend(v4, "conformsToProtocol:", &unk_1EE3B1010))
    {
      v5 = v4;
    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(a1[4], "assetUUIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v6);
        objc_msgSend(a1[5], "assetWithUUID:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          if (!v9)
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v9, "addObject:", v12);
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }
  objc_msgSend(a1[4], "momentShareUUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  switch(objc_msgSend(a1[4], "actionType"))
  {
    case 0:
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("_PLUserActivityTypeInvalid not a valid user activity"));
      break;
    case 1:
      objc_msgSend(a1[6], "noteUserDidViewCloudFeedContent:photoLibrary:", objc_msgSend(a1[4], "cloudFeedContent"), a1[5]);
      break;
    case 2:
      if (v5)
      {
        +[PLPhotoSharingHelper checkServerModelForAlbum:photoLibrary:](PLPhotoSharingHelper, "checkServerModelForAlbum:photoLibrary:", v5, a1[5]);
        objc_msgSend(v5, "cloudGUID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLPhotoSharingHelper prioritizeDownloadsForAlbumGUID:](PLPhotoSharingHelper, "prioritizeDownloadsForAlbumGUID:", v14);

        objc_msgSend(a1[6], "noteUserDidNavigateIntoSharedAlbum:photoLibrary:", v5, a1[5]);
      }
      break;
    case 3:
      if (v5)
      {
        objc_msgSend(v5, "cloudGUID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLPhotoSharingHelper prioritizeDownloadsForAlbumGUID:](PLPhotoSharingHelper, "prioritizeDownloadsForAlbumGUID:", v15);
        goto LABEL_47;
      }
      break;
    case 4:
      if (v5)
        objc_msgSend(a1[6], "noteUserDidNavigateAwayFromSharedAlbum:photoLibrary:", v5, a1[5]);
      break;
    case 5:
      +[PLPhotoSharingHelper prioritizeDownloadsForAlbumGUID:](PLPhotoSharingHelper, "prioritizeDownloadsForAlbumGUID:", 0);
      break;
    case 6:
      if (objc_msgSend(v9, "count"))
      {
        v16 = a1[6];
        objc_msgSend(v9, "objectAtIndex:", 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "noteUserDidReadCommentOnSharedAsset:photoLibrary:", v17, a1[5]);

      }
      break;
    case 7:
      if (v6)
        objc_msgSend(a1[6], "noteUserDidDeleteSharedAssetsWithUUIDs:", v6);
      break;
    case 8:
      if (v2)
        objc_msgSend(a1[6], "noteUserDidDeleteSharedAlbumWithUUID:", v2);
      break;
    case 9:
      objc_msgSend(a1[6], "noteUserDidLeavePhotosApplication");
      break;
    case 10:
      if (v13)
        objc_msgSend(a1[6], "noteUserDidChangeStatusForMomentShare:photoLibrary:", v13, a1[5]);
      break;
    case 11:
      objc_msgSend(a1[5], "managedObjectContext");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLLibraryScope activeLibraryScopeInManagedObjectContext:](PLLibraryScope, "activeLibraryScopeInManagedObjectContext:", v18);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        objc_msgSend(a1[5], "managedObjectContext");
        v19 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "userViewedAssetTrashNotificationWithManagedObjectContext:", v19);
      }
      else
      {
        PLUserActivityGetLog();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v20 = 0;
          _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_ERROR, "Failed to find an active LibraryScope to mark as notification viewed", v20, 2u);
        }
      }

LABEL_47:
      break;
    case 12:
      +[PLPhotoSharingHelper checkServerModelRelationshipsForPhotoLibrary:](PLPhotoSharingHelper, "checkServerModelRelationshipsForPhotoLibrary:", a1[5]);
      break;
    default:
      break;
  }

}

+ (id)newUserActivityDaemonJob
{
  PLUserActivityDaemonJob *v2;
  void *v3;
  void *v4;
  PLUserActivityDaemonJob *v5;

  v2 = [PLUserActivityDaemonJob alloc];
  objc_msgSend(MEMORY[0x1E0D73280], "systemLibraryURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLPhotoLibraryBundleController sharedAssetsdClientForPhotoLibraryURL:](PLPhotoLibraryBundleController, "sharedAssetsdClientForPhotoLibraryURL:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PLUserActivityDaemonJob initWithAssetsdClient:](v2, "initWithAssetsdClient:", v4);

  return v5;
}

+ (void)userDidViewCloudFeedContent:(unint64_t)a3
{
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  PLUserActivityGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEFAULT, "User did view cloud feed content", v7, 2u);
  }

  v6 = (void *)objc_msgSend(a1, "newUserActivityDaemonJob");
  objc_msgSend(v6, "setActionType:", 1);
  objc_msgSend(v6, "setCloudFeedContent:", a3);
  objc_msgSend(v6, "run");

}

+ (void)userDidNavigateIntoSharedAlbum:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLUserActivityGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v6;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEFAULT, "User did navigate into shared album: %{public}@", (uint8_t *)&v9, 0xCu);

  }
  v7 = (void *)objc_msgSend(a1, "newUserActivityDaemonJob");
  objc_msgSend(v7, "setActionType:", 2);
  objc_msgSend(v4, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAlbumUUID:", v8);

  objc_msgSend(v7, "run");
}

+ (void)userDidNavigateIntoImagePickerSharedAlbum:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLUserActivityGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v6;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEFAULT, "User did navigate into picker shared album: %{public}@", (uint8_t *)&v9, 0xCu);

  }
  v7 = (void *)objc_msgSend(a1, "newUserActivityDaemonJob");
  objc_msgSend(v7, "setActionType:", 3);
  objc_msgSend(v4, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAlbumUUID:", v8);

  objc_msgSend(v7, "run");
}

+ (void)userDidNavigateAwayFromSharedAlbum:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLUserActivityGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v6;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEFAULT, "User did navigate away from shared album: %{public}@", (uint8_t *)&v9, 0xCu);

  }
  v7 = (void *)objc_msgSend(a1, "newUserActivityDaemonJob");
  objc_msgSend(v7, "setActionType:", 4);
  objc_msgSend(v4, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAlbumUUID:", v8);

  objc_msgSend(v7, "run");
}

+ (void)userDidNavigateAwayFromAllSharedAlbums
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  PLUserActivityGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEFAULT, "User did navigate away from all shared albums", v5, 2u);
  }

  v4 = (void *)objc_msgSend(a1, "newUserActivityDaemonJob");
  objc_msgSend(v4, "setActionType:", 5);
  objc_msgSend(v4, "run");

}

+ (void)userDidReadCommentOnSharedAsset:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLUserActivityGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543362;
    v11 = v6;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEFAULT, "User did read comments on asset: %{public}@", (uint8_t *)&v10, 0xCu);

  }
  objc_msgSend(v4, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)objc_msgSend(a1, "newUserActivityDaemonJob");
    objc_msgSend(v8, "setActionType:", 6);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAssetUUIDs:", v9);

    objc_msgSend(v8, "run");
  }

}

+ (void)userDidDeleteSharedAlbum:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLUserActivityGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v6;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEFAULT, "User did delete shared album: %{public}@", (uint8_t *)&v9, 0xCu);

  }
  v7 = (void *)objc_msgSend(a1, "newUserActivityDaemonJob");
  objc_msgSend(v7, "setActionType:", 8);
  objc_msgSend(v4, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAlbumUUID:", v8);

  objc_msgSend(v7, "run");
}

+ (void)userDidDeleteSharedAssets:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[128];
  uint8_t buf[4];
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLUserActivityGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v20 = objc_msgSend(v4, "count");
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEFAULT, "User did delete %lu shared album assets", buf, 0xCu);
  }

  v6 = (void *)objc_msgSend(a1, "newUserActivityDaemonJob");
  objc_msgSend(v6, "setActionType:", 7);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = v4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v12), "uuid", (_QWORD)v14);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
          objc_msgSend(v7, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

  objc_msgSend(v6, "setAssetUUIDs:", v7);
  objc_msgSend(v6, "run");

}

+ (void)userDidLeavePhotosApplication
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  PLUserActivityGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEFAULT, "User did delete leave Photos app", v5, 2u);
  }

  v4 = (void *)objc_msgSend(a1, "newUserActivityDaemonJob");
  objc_msgSend(v4, "setActionType:", 9);
  objc_msgSend(v4, "run");

}

+ (void)userDidChangeStatusForMomentShare:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLUserActivityGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v6;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEFAULT, "User did change status for moment share: %{public}@", (uint8_t *)&v9, 0xCu);

  }
  v7 = (void *)objc_msgSend(a1, "newUserActivityDaemonJob");
  objc_msgSend(v7, "setActionType:", 10);
  objc_msgSend(v4, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setMomentShareUUID:", v8);

  objc_msgSend(v7, "run");
}

+ (void)userDidViewSharedLibraryParticipantAssetTrashNotification
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  PLUserActivityGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEFAULT, "User did view shared library participant asset trash notification", v5, 2u);
  }

  v4 = (void *)objc_msgSend(a1, "newUserActivityDaemonJob");
  objc_msgSend(v4, "setActionType:", 11);
  objc_msgSend(v4, "run");

}

+ (void)checkedSharedAlbumServerModelRelationships
{
  id v2;

  v2 = (id)objc_msgSend(a1, "newUserActivityDaemonJob");
  objc_msgSend(v2, "setActionType:", 12);
  objc_msgSend(v2, "run");

}

@end
