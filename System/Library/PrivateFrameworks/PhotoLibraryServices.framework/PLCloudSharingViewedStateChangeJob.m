@implementation PLCloudSharingViewedStateChangeJob

- (void)encodeToXPCObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  const char *v7;
  void *v8;
  double v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PLCloudSharingViewedStateChangeJob;
  v4 = a3;
  -[PLDaemonJob encodeToXPCObject:](&v10, sel_encodeToXPCObject_, v4);
  xpc_dictionary_set_int64(v4, (const char *)propertyKeyViewStateChangeJobType, -[PLCloudSharingViewedStateChangeJob jobType](self, "jobType", v10.receiver, v10.super_class));
  -[PLCloudSharingViewedStateChangeJob albumGUID](self, "albumGUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PLXPCDictionarySetString();

  xpc_dictionary_set_BOOL(v4, (const char *)propertyKeyAlbumHasUnseenContent, -[PLCloudSharingViewedStateChangeJob albumHasUnseenContent](self, "albumHasUnseenContent"));
  xpc_dictionary_set_int64(v4, (const char *)propertyKeyAlbumUnviewedAssetCount, -[PLCloudSharingViewedStateChangeJob albumUnviewedAssetCount](self, "albumUnviewedAssetCount"));
  -[PLCloudSharingViewedStateChangeJob assetCollectionGUID](self, "assetCollectionGUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PLXPCDictionarySetString();

  xpc_dictionary_set_BOOL(v4, (const char *)propertyKeyAssetCollectionHasUnreadComments, -[PLCloudSharingViewedStateChangeJob assetCollectionHasUnreadComments](self, "assetCollectionHasUnreadComments"));
  v7 = (const char *)propertyKeyAssetCollectionLastViewedCommentDate;
  -[PLCloudSharingViewedStateChangeJob assetCollectionLastViewedCommentDate](self, "assetCollectionLastViewedCommentDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSinceReferenceDate");
  xpc_dictionary_set_date(v4, v7, (uint64_t)v9);

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
  v12.super_class = (Class)PLCloudSharingViewedStateChangeJob;
  v7 = -[PLCloudSharingJob initFromXPCObject:libraryServicesManager:](&v12, sel_initFromXPCObject_libraryServicesManager_, v6, a4);
  if (v7)
  {
    objc_msgSend(v7, "setJobType:", xpc_dictionary_get_int64(v6, (const char *)propertyKeyViewStateChangeJobType));
    PLStringFromXPCDictionary();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAlbumGUID:", v8);

    objc_msgSend(v7, "setAlbumHasUnseenContent:", xpc_dictionary_get_BOOL(v6, (const char *)propertyKeyAlbumHasUnseenContent));
    objc_msgSend(v7, "setAlbumUnviewedAssetCount:", xpc_dictionary_get_int64(v6, (const char *)propertyKeyAlbumUnviewedAssetCount));
    PLStringFromXPCDictionary();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAssetCollectionGUID:", v9);

    objc_msgSend(v7, "setAssetCollectionHasUnreadComments:", xpc_dictionary_get_BOOL(v6, (const char *)propertyKeyAssetCollectionHasUnreadComments));
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", (double)xpc_dictionary_get_date(v6, (const char *)propertyKeyAssetCollectionLastViewedCommentDate));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAssetCollectionLastViewedCommentDate:", v10);

  }
  return v7;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  _BOOL4 v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _BOOL4 v14;
  const __CFString *v15;
  void *v16;
  uint64_t v17;
  void *v18;

  switch(-[PLCloudSharingViewedStateChangeJob jobType](self, "jobType"))
  {
    case 1:
      v3 = (void *)MEMORY[0x1E0CB3940];
      v4 = objc_opt_class();
      -[PLCloudSharingViewedStateChangeJob albumGUID](self, "albumGUID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[PLCloudSharingViewedStateChangeJob albumHasUnseenContent](self, "albumHasUnseenContent");
      v7 = CFSTR("NO");
      if (v6)
        v7 = CFSTR("YES");
      objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (PLViewedStateChangeAlbumReadState albumGUID=%@ hasUnseenContent=%@) "), v4, v5, v7);
      goto LABEL_7;
    case 2:
      v9 = (void *)MEMORY[0x1E0CB3940];
      v10 = objc_opt_class();
      -[PLCloudSharingViewedStateChangeJob albumGUID](self, "albumGUID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", CFSTR("%@ (PLViewedStateChangeAlbumUnviewedAssetCount albumGUID=%@ unviewedAssetCollectionCount=%lld) "), v10, v5, -[PLCloudSharingViewedStateChangeJob albumUnviewedAssetCount](self, "albumUnviewedAssetCount"));
LABEL_7:
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    case 3:
      v11 = (void *)MEMORY[0x1E0CB3940];
      v12 = objc_opt_class();
      -[PLCloudSharingViewedStateChangeJob albumGUID](self, "albumGUID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLCloudSharingViewedStateChangeJob assetCollectionGUID](self, "assetCollectionGUID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[PLCloudSharingViewedStateChangeJob assetCollectionHasUnreadComments](self, "assetCollectionHasUnreadComments");
      v15 = CFSTR("NO");
      if (v14)
        v15 = CFSTR("YES");
      objc_msgSend(v11, "stringWithFormat:", CFSTR("%@ (PLViewedStateChangeAssetCommentsReadState albumGUID=%@ collectionGUID=%@ hasUnreadComments=%@) "), v12, v5, v13, v15);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    case 4:
      v16 = (void *)MEMORY[0x1E0CB3940];
      v17 = objc_opt_class();
      -[PLCloudSharingViewedStateChangeJob albumGUID](self, "albumGUID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLCloudSharingViewedStateChangeJob assetCollectionGUID](self, "assetCollectionGUID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLCloudSharingViewedStateChangeJob assetCollectionLastViewedCommentDate](self, "assetCollectionLastViewedCommentDate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringWithFormat:", CFSTR("%@ (PLViewedStateChangeAssetLastViewedCommentDate albumGUID=%@ collectionGUID=%@ lasViewedCommentDate=%@) "), v17, v5, v13, v18);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_12:
LABEL_13:

      break;
    default:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ unknown job type %lld "), objc_opt_class(), -[PLCloudSharingViewedStateChangeJob jobType](self, "jobType"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      break;
  }
  return v8;
}

- (int64_t)daemonOperation
{
  return 9;
}

- (void)runDaemonSide
{
  NSObject *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  id v11;
  __int16 v12;
  PLCloudSharingViewedStateChangeJob *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PLPhotoSharingGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v11 = (id)objc_opt_class();
    v12 = 2112;
    v13 = self;
    v4 = v11;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEFAULT, "%@ : runDaemonSide %@", buf, 0x16u);

  }
  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLCloudSharingViewedStateChangeJob runDaemonSide]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "lowPriorityOperationQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__PLCloudSharingViewedStateChangeJob_runDaemonSide__block_invoke;
  v8[3] = &unk_1E3677C18;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "addOperationWithBlock:", v8);

}

- (void)_executeAlbumViewedStateChanged
{
  void *v3;
  uint64_t v4;
  id v5;
  _QWORD v6[6];
  _QWORD v7[5];
  id v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[3];
  char v14;

  -[PLCloudSharingJob transientPhotoLibrary](self, "transientPhotoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  v14 = 0;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = __Block_byref_object_copy__78838;
  v11[4] = __Block_byref_object_dispose__78839;
  v12 = 0;
  v4 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __69__PLCloudSharingViewedStateChangeJob__executeAlbumViewedStateChanged__block_invoke;
  v7[3] = &unk_1E3676348;
  v9 = v11;
  v7[4] = self;
  v5 = v3;
  v8 = v5;
  v10 = v13;
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __69__PLCloudSharingViewedStateChangeJob__executeAlbumViewedStateChanged__block_invoke_47;
  v6[3] = &unk_1E36743E0;
  v6[4] = v13;
  v6[5] = v11;
  objc_msgSend(v5, "performTransactionAndWait:completionHandler:", v7, v6);

  _Block_object_dispose(v11, 8);
  _Block_object_dispose(v13, 8);

}

- (void)_executeAlbumUnviewedAssetCountChangedWithGroup
{
  void *v3;
  id v4;
  _QWORD v5[5];
  id v6;

  -[PLCloudSharingJob transientPhotoLibrary](self, "transientPhotoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __85__PLCloudSharingViewedStateChangeJob__executeAlbumUnviewedAssetCountChangedWithGroup__block_invoke;
  v5[3] = &unk_1E3677C18;
  v5[4] = self;
  v6 = v3;
  v4 = v3;
  objc_msgSend(v4, "performTransactionAndWait:", v5);

}

- (void)_executeAssetCommentsReadStateChangedWithGroup
{
  void *v3;
  id v4;
  _QWORD v5[5];
  id v6;

  -[PLCloudSharingJob transientPhotoLibrary](self, "transientPhotoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __84__PLCloudSharingViewedStateChangeJob__executeAssetCommentsReadStateChangedWithGroup__block_invoke;
  v5[3] = &unk_1E3677C18;
  v5[4] = self;
  v6 = v3;
  v4 = v3;
  objc_msgSend(v4, "performTransactionAndWait:", v5);

}

- (void)_executeAssetLastViewedCommentDateChangedWithGroup
{
  void *v3;
  id v4;
  _QWORD v5[5];
  id v6;

  -[PLCloudSharingJob transientPhotoLibrary](self, "transientPhotoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __88__PLCloudSharingViewedStateChangeJob__executeAssetLastViewedCommentDateChangedWithGroup__block_invoke;
  v5[3] = &unk_1E3677C18;
  v5[4] = self;
  v6 = v3;
  v4 = v3;
  objc_msgSend(v4, "performTransactionAndWait:", v5);

}

- (int64_t)jobType
{
  return self->_jobType;
}

- (void)setJobType:(int64_t)a3
{
  self->_jobType = a3;
}

- (NSString)albumGUID
{
  return self->_albumGUID;
}

- (void)setAlbumGUID:(id)a3
{
  objc_storeStrong((id *)&self->_albumGUID, a3);
}

- (BOOL)albumHasUnseenContent
{
  return self->_albumHasUnseenContent;
}

- (void)setAlbumHasUnseenContent:(BOOL)a3
{
  self->_albumHasUnseenContent = a3;
}

- (int64_t)albumUnviewedAssetCount
{
  return self->_albumUnviewedAssetCount;
}

- (void)setAlbumUnviewedAssetCount:(int64_t)a3
{
  self->_albumUnviewedAssetCount = a3;
}

- (NSString)assetCollectionGUID
{
  return self->_assetCollectionGUID;
}

- (void)setAssetCollectionGUID:(id)a3
{
  objc_storeStrong((id *)&self->_assetCollectionGUID, a3);
}

- (BOOL)assetCollectionHasUnreadComments
{
  return self->_assetCollectionHasUnreadComments;
}

- (void)setAssetCollectionHasUnreadComments:(BOOL)a3
{
  self->_assetCollectionHasUnreadComments = a3;
}

- (NSDate)assetCollectionLastViewedCommentDate
{
  return self->_assetCollectionLastViewedCommentDate;
}

- (void)setAssetCollectionLastViewedCommentDate:(id)a3
{
  objc_storeStrong((id *)&self->_assetCollectionLastViewedCommentDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetCollectionLastViewedCommentDate, 0);
  objc_storeStrong((id *)&self->_assetCollectionGUID, 0);
  objc_storeStrong((id *)&self->_albumGUID, 0);
}

void __88__PLCloudSharingViewedStateChangeJob__executeAssetLastViewedCommentDateChangedWithGroup__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99D20];
  objc_msgSend(*(id *)(a1 + 32), "assetCollectionGUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayWithObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLManagedAsset cloudSharedAssetsWithGUIDs:inLibrary:](PLManagedAsset, "cloudSharedAssetsWithGUIDs:inLibrary:", v4, *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v5, "count") >= 2)
  {
    PLPhotoSharingGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "assetCollectionGUID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412546;
      v19 = v7;
      v20 = 2112;
      v21 = v5;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEFAULT, "WARNING: Found more than one asset with cloudAssetGUID %@, returning last one in array %@", (uint8_t *)&v18, 0x16u);

    }
  }
  objc_msgSend(v5, "lastObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    PLPhotoSharingGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = (void *)objc_opt_class();
      v11 = *(void **)(a1 + 32);
      v12 = v10;
      objc_msgSend(v11, "assetCollectionGUID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412546;
      v19 = v10;
      v20 = 2112;
      v21 = v13;
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_ERROR, "ERROR %@:couldn't find asset %@", (uint8_t *)&v18, 0x16u);

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "assetCollectionLastViewedCommentDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v8, "cloudLastViewedCommentDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "timeIntervalSinceDate:", v14);
    v17 = fabs(v16);

    if (v17 > 1.0)
      objc_msgSend(v8, "setCloudLastViewedCommentDate:", v14);
  }

}

void __84__PLCloudSharingViewedStateChangeJob__executeAssetCommentsReadStateChangedWithGroup__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99D20];
  objc_msgSend(*(id *)(a1 + 32), "assetCollectionGUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayWithObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLManagedAsset cloudSharedAssetsWithGUIDs:inLibrary:](PLManagedAsset, "cloudSharedAssetsWithGUIDs:inLibrary:", v4, *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v5, "count") >= 2)
  {
    PLPhotoSharingGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "assetCollectionGUID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412546;
      v17 = v7;
      v18 = 2112;
      v19 = v5;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEFAULT, "WARNING: Found more than one asset with cloudAssetGUID %@, returning last one in array %@", (uint8_t *)&v16, 0x16u);

    }
  }
  objc_msgSend(v5, "lastObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = objc_msgSend(*(id *)(a1 + 32), "assetCollectionHasUnreadComments");
    if ((_DWORD)v9 != objc_msgSend(v8, "cloudHasUnseenComments"))
    {
      objc_msgSend(v8, "setCloudHasUnseenComments:", v9);
      +[PLNotificationManager sharedManager](PLNotificationManager, "sharedManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "noteSharedAssetCommentsUnreadStatusDidChange:", v8);

    }
  }
  else
  {
    PLPhotoSharingGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = (void *)objc_opt_class();
      v13 = *(void **)(a1 + 32);
      v14 = v12;
      objc_msgSend(v13, "assetCollectionGUID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412546;
      v17 = v12;
      v18 = 2112;
      v19 = v15;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_ERROR, "ERROR %@:couldn't find asset %@", (uint8_t *)&v16, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 32), "assetCollectionHasUnreadComments");
  }

}

void __85__PLCloudSharingViewedStateChangeJob__executeAlbumUnviewedAssetCountChangedWithGroup__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "albumGUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLCloudSharedAlbum cloudSharedAlbumWithGUID:inLibrary:](PLCloudSharedAlbum, "cloudSharedAlbumWithGUID:inLibrary:", v2, *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "albumUnviewedAssetCount");
    objc_msgSend(v3, "unseenAssetsCount");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "integerValue");

    if (v6 != v4)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setUnseenAssetsCount:", v7);

    }
  }
  else
  {
    PLPhotoSharingGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = (void *)objc_opt_class();
      v10 = *(void **)(a1 + 32);
      v11 = v9;
      objc_msgSend(v10, "albumGUID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412546;
      v14 = v9;
      v15 = 2112;
      v16 = v12;
      _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_ERROR, "ERROR %@:couldn't find album %@", (uint8_t *)&v13, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 32), "albumUnviewedAssetCount");
  }

}

void __69__PLCloudSharingViewedStateChangeJob__executeAlbumViewedStateChanged__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  const __CFString *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "albumGUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLCloudSharedAlbum cloudSharedAlbumWithGUID:inLibrary:](PLCloudSharedAlbum, "cloudSharedAlbumWithGUID:inLibrary:", v2, *(_QWORD *)(a1 + 40));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    PLPhotoSharingGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = (void *)objc_opt_class();
      v8 = *(void **)(a1 + 32);
      v9 = v7;
      objc_msgSend(v8, "albumGUID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138412546;
      v23 = v7;
      v24 = 2112;
      v25 = (uint64_t)v10;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_ERROR, "ERROR %@:couldn't find album %@", (uint8_t *)&v22, 0x16u);

    }
  }
  v11 = objc_msgSend(*(id *)(a1 + 32), "albumHasUnseenContent");
  v12 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  if (v12 && (_DWORD)v11 != objc_msgSend(v12, "hasUnseenContentBoolValue"))
  {
    PLPhotoSharingGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = (void *)objc_opt_class();
      v15 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      v16 = v14;
      objc_msgSend(v15, "localizedTitle");
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = (void *)v17;
      v19 = CFSTR("NO");
      v22 = 138412802;
      v23 = v14;
      v24 = 2112;
      if ((_DWORD)v11)
        v19 = CFSTR("YES");
      v25 = v17;
      v26 = 2112;
      v27 = v19;
      _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_DEFAULT, "%@ : _executeAlbumViewedStateChanged marking album \"%@\" setHasUnseenContent:%@", (uint8_t *)&v22, 0x20u);

    }
    v20 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v11);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setHasUnseenContent:", v21);

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  }
}

void __69__PLCloudSharingViewedStateChangeJob__executeAlbumViewedStateChanged__block_invoke_47(uint64_t a1)
{
  id v2;

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    +[PLNotificationManager sharedManager](PLNotificationManager, "sharedManager");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "noteSharedAlbumUnseenStatusDidChange:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

  }
}

void __51__PLCloudSharingViewedStateChangeJob_runDaemonSide__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  objc_super v7;
  uint8_t buf[4];
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x19AEC1554]();
  switch(objc_msgSend(*(id *)(a1 + 32), "jobType"))
  {
    case 1:
      objc_msgSend(*(id *)(a1 + 32), "_executeAlbumViewedStateChanged");
      break;
    case 2:
      objc_msgSend(*(id *)(a1 + 32), "_executeAlbumUnviewedAssetCountChangedWithGroup");
      break;
    case 3:
      objc_msgSend(*(id *)(a1 + 32), "_executeAssetCommentsReadStateChangedWithGroup");
      break;
    case 4:
      objc_msgSend(*(id *)(a1 + 32), "_executeAssetLastViewedCommentDateChangedWithGroup");
      break;
    default:
      PLPhotoSharingGetLog();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        v4 = (void *)objc_opt_class();
        v5 = *(void **)(a1 + 32);
        v6 = v4;
        *(_DWORD *)buf = 138412546;
        v9 = v4;
        v10 = 2048;
        v11 = objc_msgSend(v5, "jobType");
        _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_ERROR, "ERROR %@:invalid job type: %lld", buf, 0x16u);

      }
      break;
  }
  v7.receiver = *(id *)(a1 + 32);
  v7.super_class = (Class)PLCloudSharingViewedStateChangeJob;
  objc_msgSendSuper2(&v7, sel_runDaemonSide);
  objc_msgSend(*(id *)(a1 + 40), "stillAlive");
  objc_autoreleasePoolPop(v2);
}

+ (void)markAlbum:(id)a3 asHavingUnseenContent:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;
  id v7;

  v4 = a4;
  v5 = a3;
  v7 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v7, "setJobType:", 1);
  objc_msgSend(v5, "GUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setAlbumGUID:", v6);
  objc_msgSend(v7, "setAlbumHasUnseenContent:", v4);
  objc_msgSend(v7, "run");

}

+ (void)updateUnviewedAssetCollectionCount:(int)a3 forAlbum:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  v7 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v7, "setJobType:", 2);
  objc_msgSend(v5, "GUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setAlbumGUID:", v6);
  objc_msgSend(v7, "setAlbumUnviewedAssetCount:", a3);
  objc_msgSend(v7, "run");

}

+ (void)markAssetCollection:(id)a3 asHavingUnreadComments:(BOOL)a4 inAlbum:(id)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a4;
  v7 = a5;
  v8 = a3;
  v11 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v11, "setJobType:", 3);
  objc_msgSend(v8, "GUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setAssetCollectionGUID:", v9);
  objc_msgSend(v11, "setAssetCollectionHasUnreadComments:", v5);
  objc_msgSend(v7, "GUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setAlbumGUID:", v10);
  objc_msgSend(v11, "run");

}

+ (void)setLastViewedCommentDate:(id)a3 forAssetCollection:(id)a4 inAlbum:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v12 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v12, "setJobType:", 4);
  objc_msgSend(v12, "setAssetCollectionLastViewedCommentDate:", v9);

  objc_msgSend(v8, "GUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setAssetCollectionGUID:", v10);
  objc_msgSend(v7, "GUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setAlbumGUID:", v11);
  objc_msgSend(v12, "run");

}

@end
