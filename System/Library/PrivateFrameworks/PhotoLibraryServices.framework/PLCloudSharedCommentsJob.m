@implementation PLCloudSharedCommentsJob

- (void)encodeToXPCObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  objc_super v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)PLCloudSharedCommentsJob;
  v4 = a3;
  -[PLDaemonJob encodeToXPCObject:](&v15, sel_encodeToXPCObject_, v4);
  v5 = (void *)MEMORY[0x1E0CB36F8];
  -[PLCloudSharedCommentsJob msASComments](self, "msASComments");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(v5, "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, &v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v14;

  if (!v7)
  {
    PLPhotoSharingGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v8;
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEFAULT, "Failed to archive msASCommentsData, error: %@", buf, 0xCu);
    }

  }
  PLXPCDictionarySetData();
  -[PLCloudSharedCommentsJob commentGUID](self, "commentGUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  PLXPCDictionarySetString();

  -[PLCloudSharedCommentsJob assetGUID](self, "assetGUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  PLXPCDictionarySetString();

  -[PLCloudSharedCommentsJob albumGUID](self, "albumGUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  PLXPCDictionarySetString();

  -[PLCloudSharedCommentsJob mstreamdInfoDictionary](self, "mstreamdInfoDictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  PLXPCDictionarySetDictionary();

  xpc_dictionary_set_int64(v4, (const char *)propertyKeyCommentJobType, -[PLCloudSharedCommentsJob jobType](self, "jobType"));
}

- (id)initFromXPCObject:(id)a3 libraryServicesManager:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v19;

  v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PLCloudSharedCommentsJob;
  v7 = -[PLCloudSharingJob initFromXPCObject:libraryServicesManager:](&v19, sel_initFromXPCObject_libraryServicesManager_, v6, a4);
  if (v7)
  {
    PLDataFromXPCDictionary();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0CB3710];
    v10 = (void *)MEMORY[0x1E0C99E60];
    v11 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pl_safeUnarchiveObjectFromData:classes:", v8, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
      objc_msgSend(v7, "setMsASComments:", v13);
    PLStringFromXPCDictionary();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCommentGUID:", v14);

    PLStringFromXPCDictionary();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAssetGUID:", v15);

    PLStringFromXPCDictionary();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAlbumGUID:", v16);

    PLDictionaryFromXPCDictionary();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setMstreamdInfoDictionary:", v17);

    objc_msgSend(v7, "setJobType:", xpc_dictionary_get_int64(v6, (const char *)propertyKeyCommentJobType));
  }

  return v7;
}

- (id)description
{
  unint64_t v3;
  __CFString *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = -[PLCloudSharedCommentsJob jobType](self, "jobType") - 1;
  if (v3 < 5 && ((0x1Bu >> v3) & 1) != 0)
  {
    v4 = off_1E3670D98[v3];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unknown job type %lld"), -[PLCloudSharedCommentsJob jobType](self, "jobType"));
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = objc_opt_class();
  -[PLCloudSharedCommentsJob msASComments](self, "msASComments");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLCloudSharedCommentsJob commentGUID](self, "commentGUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLCloudSharedCommentsJob assetGUID](self, "assetGUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLCloudSharedCommentsJob albumGUID](self, "albumGUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLCloudSharedCommentsJob mstreamdInfoDictionary](self, "mstreamdInfoDictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ (%@ MSASComments=%@ commmentGUID=%@ assetGUID=%@ albumGUID=%@ info=%@) "), v6, v4, v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (int64_t)daemonOperation
{
  return 8;
}

- (BOOL)shouldArchiveXPCToDisk
{
  void *v2;
  BOOL v3;

  -[PLCloudSharedCommentsJob mstreamdInfoDictionary](self, "mstreamdInfoDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
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
  PLCloudSharedCommentsJob *v13;
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
  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLCloudSharedCommentsJob runDaemonSide]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "highPriorityOperationQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __41__PLCloudSharedCommentsJob_runDaemonSide__block_invoke;
  v8[3] = &unk_1E3677C18;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "addOperationWithBlock:", v8);

}

- (void)executeProcessServerNotificationOfCommentChanges
{
  NSObject *v3;
  void *v4;
  void *v5;
  BOOL v6;
  BOOL v7;
  id v8;
  _QWORD v9[5];
  id v10;
  BOOL v11;
  BOOL v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  PLPhotoSharingGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[PLCloudSharedCommentsJob msASComments](self, "msASComments");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v14 = v4;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEFAULT, "executeProcessServerNotificationOfCommentAdditions %@", buf, 0xCu);

  }
  -[PLCloudSharingJob transientPhotoLibrary](self, "transientPhotoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PLCloudSharedCommentsJob jobType](self, "jobType") == 1;
  v7 = -[PLCloudSharedCommentsJob jobType](self, "jobType") == 2;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __76__PLCloudSharedCommentsJob_executeProcessServerNotificationOfCommentChanges__block_invoke;
  v9[3] = &unk_1E3670D78;
  v9[4] = self;
  v10 = v5;
  v11 = v6;
  v12 = v7;
  v8 = v5;
  objc_msgSend(v8, "performTransactionAndWait:", v9);

}

- (void)executePublishCommentToServer
{
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[16];

  PLPhotoSharingGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEFAULT, "executePublishCommentToServer", buf, 2u);
  }

  -[PLCloudSharingJob transientPhotoLibrary](self, "transientPhotoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLCloudSharedCommentsJob commentGUID](self, "commentGUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __57__PLCloudSharedCommentsJob_executePublishCommentToServer__block_invoke;
  v8[3] = &unk_1E3677C18;
  v9 = v5;
  v10 = v4;
  v6 = v4;
  v7 = v5;
  objc_msgSend(v6, "performTransactionAndWait:", v8);

}

- (void)executeDeleteCommentFromServer
{
  id v2;

  -[PLCloudSharedCommentsJob commentGUID](self, "commentGUID");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  +[PLPhotoSharingHelper deleteCommentWithGUIDFromServer:](PLPhotoSharingHelper, "deleteCommentWithGUIDFromServer:", v2);

}

- (int64_t)jobType
{
  return self->_jobType;
}

- (void)setJobType:(int64_t)a3
{
  self->_jobType = a3;
}

- (NSArray)msASComments
{
  return self->_msASComments;
}

- (void)setMsASComments:(id)a3
{
  objc_storeStrong((id *)&self->_msASComments, a3);
}

- (NSString)commentGUID
{
  return self->_commentGUID;
}

- (void)setCommentGUID:(id)a3
{
  objc_storeStrong((id *)&self->_commentGUID, a3);
}

- (NSString)assetGUID
{
  return self->_assetGUID;
}

- (void)setAssetGUID:(id)a3
{
  objc_storeStrong((id *)&self->_assetGUID, a3);
}

- (NSString)albumGUID
{
  return self->_albumGUID;
}

- (void)setAlbumGUID:(id)a3
{
  objc_storeStrong((id *)&self->_albumGUID, a3);
}

- (NSDictionary)mstreamdInfoDictionary
{
  return self->_mstreamdInfoDictionary;
}

- (void)setMstreamdInfoDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_mstreamdInfoDictionary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mstreamdInfoDictionary, 0);
  objc_storeStrong((id *)&self->_albumGUID, 0);
  objc_storeStrong((id *)&self->_assetGUID, 0);
  objc_storeStrong((id *)&self->_commentGUID, 0);
  objc_storeStrong((id *)&self->_msASComments, 0);
}

void __57__PLCloudSharedCommentsJob_executePublishCommentToServer__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  NSObject *v19;
  __int16 v20;
  void *v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  +[PLCloudSharedComment cloudSharedCommentWithGUID:inLibrary:](PLCloudSharedComment, "cloudSharedCommentWithGUID:inLibrary:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    PLPhotoSharingGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v12 = *(NSObject **)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v19 = v12;
      _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_ERROR, "ERROR: did not find comment with GUID %@ to publish", buf, 0xCu);
    }
    goto LABEL_17;
  }
  +[PLPhotoSharingHelper publishCloudSharedCommentToServer:](PLPhotoSharingHelper, "publishCloudSharedCommentToServer:", v2);
  if (objc_msgSend(v2, "isInterestingForAlbumsSorting"))
  {
    objc_msgSend(v2, "asset");
    v3 = objc_claimAutoreleasedReturnValue();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    -[NSObject albums](v3, "albums");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    if (v5)
    {
      v7 = v5;
      v8 = *(_QWORD *)v15;
      *(_QWORD *)&v6 = 138412546;
      v13 = v6;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v4);
          v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          if (objc_msgSend(v10, "conformsToProtocol:", &unk_1EE3B1010, v13))
          {
            objc_msgSend(v2, "commentDate");
            v11 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "updateCloudLastInterestingChangeDateWithDate:", v11);
          }
          else
          {
            PLPhotoSharingGetLog();
            v11 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v13;
              v19 = v3;
              v20 = 2112;
              v21 = v10;
              _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_ERROR, "ERROR: cloud asset in a non-cloud album. Asset: %@, album: %@", buf, 0x16u);
            }
          }

        }
        v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
      }
      while (v7);
    }

LABEL_17:
  }

}

void __76__PLCloudSharedCommentsJob_executeProcessServerNotificationOfCommentChanges__block_invoke(uint64_t a1)
{
  uint64_t v1;
  __int128 v2;
  uint64_t i;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  NSObject *v52;
  int v53;
  void *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t k;
  void *v60;
  NSObject *v61;
  NSObject *v62;
  __int128 v63;
  id obj;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  uint8_t v81[128];
  uint8_t buf[4];
  uint64_t v83;
  __int16 v84;
  void *v85;
  __int16 v86;
  uint64_t v87;
  _BYTE v88[128];
  _BYTE v89[128];
  uint64_t v90;

  v1 = a1;
  v90 = *MEMORY[0x1E0C80C00];
  v77 = 0u;
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "msASComments");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v67 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v77, v89, 16);
  if (v67)
  {
    v66 = *(_QWORD *)v78;
    *(_QWORD *)&v2 = 134217984;
    v63 = v2;
    v65 = v1;
    do
    {
      for (i = 0; i != v67; i = v28 + 1)
      {
        if (*(_QWORD *)v78 != v66)
          objc_enumerationMutation(obj);
        v68 = i;
        v4 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * i);
        objc_msgSend(v4, "GUID", v63);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLCloudSharedComment cloudSharedCommentWithGUID:inLibrary:](PLCloudSharedComment, "cloudSharedCommentWithGUID:inLibrary:", v5, *(_QWORD *)(v1 + 40));
        v6 = (id)objc_claimAutoreleasedReturnValue();

        if (!v6)
        {
          objc_msgSend(v4, "content");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = objc_msgSend(v4, "isLike");
          objc_msgSend(v4, "timestamp");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(v1 + 40), "managedObjectContext");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          +[PLCloudSharedComment cloudSharedCommentsWithCommentDate:inManagedObjectContext:](PLCloudSharedComment, "cloudSharedCommentsWithCommentDate:inManagedObjectContext:", v9, v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          v75 = 0u;
          v76 = 0u;
          v73 = 0u;
          v74 = 0u;
          v12 = v11;
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v73, v88, 16);
          if (v13)
          {
            v14 = v13;
            v15 = *(_QWORD *)v74;
            while (2)
            {
              for (j = 0; j != v14; ++j)
              {
                if (*(_QWORD *)v74 != v15)
                  objc_enumerationMutation(v12);
                v17 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * j);
                if (objc_msgSend(v17, "matchesCommentText:isLike:", v7, v8))
                {
                  v6 = v17;
                  goto LABEL_17;
                }
              }
              v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v73, v88, 16);
              if (v14)
                continue;
              break;
            }
            v6 = 0;
LABEL_17:
            v1 = v65;
          }
          else
          {
            v6 = 0;
          }

        }
        if (*(_BYTE *)(v1 + 48))
        {
          v18 = (void *)MEMORY[0x1E0C99D20];
          objc_msgSend(*(id *)(v1 + 32), "assetGUID");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "arrayWithObject:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          +[PLManagedAsset cloudSharedAssetsWithGUIDs:inLibrary:](PLManagedAsset, "cloudSharedAssetsWithGUIDs:inLibrary:", v20, *(_QWORD *)(v1 + 40));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "lastObject");
          v22 = objc_claimAutoreleasedReturnValue();

          if (v22)
          {
            if (!v6)
              goto LABEL_23;
            goto LABEL_40;
          }
          objc_msgSend(*(id *)(v1 + 40), "pathManager");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "directoryPathForInFlightComments:", 1);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(v1 + 32), "assetGUID");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "stringByAppendingPathComponent:", v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          if (v32)
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithContentsOfFile:", v32);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v33)
            {
              objc_msgSend(MEMORY[0x1E0C99DE8], "array");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
            }
          }
          else
          {
            v33 = 0;
          }
          objc_msgSend(v4, "GUID");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "addObject:", v35);

          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "removeItemAtPath:error:", v32, 0);

          PLPhotoSharingGetLog();
          v37 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v4, "GUID");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(v65 + 32), "assetGUID");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = objc_msgSend(v33, "count");
            *(_DWORD *)buf = 138412802;
            v83 = (uint64_t)v38;
            v84 = 2112;
            v85 = v39;
            v86 = 2048;
            v87 = v40;
            _os_log_impl(&dword_199541000, v37, OS_LOG_TYPE_DEFAULT, "saving inflight comment GUID %@ for asset %@, total inflight count for this asset %lu", buf, 0x20u);

          }
          objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v33, 100, 0, 0);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v41, "writeToFile:options:error:", v32, 1073741825, 0) & 1) != 0)
          {

            v1 = v65;
            if (!v6)
            {
LABEL_23:
              objc_msgSend(v4, "timestamp");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "content");
              v24 = v1;
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              +[PLCloudSharedComment insertNewCommentIntoAsset:commentDate:withText:isLike:isMyComment:inLibrary:](PLCloudSharedComment, "insertNewCommentIntoAsset:commentDate:withText:isLike:isMyComment:inLibrary:", v22, v23, v25, objc_msgSend(v4, "isLike"), objc_msgSend(v4, "isMine"), *(_QWORD *)(v24 + 40));
              v6 = (id)objc_claimAutoreleasedReturnValue();

              PLPhotoSharingGetLog();
              v26 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v83 = (uint64_t)v6;
                _os_log_impl(&dword_199541000, v26, OS_LOG_TYPE_DEFAULT, "inserting new PLCloudSharedComment %@", buf, 0xCu);
              }

              v1 = v65;
            }
LABEL_40:
            objc_msgSend(v4, "GUID");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "setCloudGUID:", v42);

            objc_msgSend(v4, "personID");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "setCommenterHashedPersonID:", v43);

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "isDeletable"));
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "setIsDeletable:", v44);

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "isLike"));
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "setIsLike:", v45);

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "isCaption"));
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "setIsCaption:", v46);

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "isBatchComment"));
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "setIsBatchComment:", v47);

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "isMine"));
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "setIsMyComment:", v48);

            objc_msgSend(v4, "content");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "setCommentText:", v49);

            objc_msgSend(v4, "clientTimestamp");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "setCommentClientDate:", v50);

            objc_msgSend(v6, "asset");
            v51 = (void *)objc_claimAutoreleasedReturnValue();

            if (v22 && !v51)
              -[NSObject addComment:](v22, "addComment:", v6);
            PLPhotoSharingGetLog();
            v52 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v83 = (uint64_t)v6;
              v84 = 2112;
              v85 = v4;
              _os_log_impl(&dword_199541000, v52, OS_LOG_TYPE_DEFAULT, "resulting comment %@ for MSASComment %@", buf, 0x16u);
            }

            if (v22)
            {
              v53 = objc_msgSend(v6, "isLikeBoolValue");
              +[PLNotificationManager sharedManager](PLNotificationManager, "sharedManager");
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(v1 + 32), "mstreamdInfoDictionary");
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              if (v53)
                objc_msgSend(v54, "noteDidReceiveLike:mstreamdInfo:", v6, v55);
              else
                objc_msgSend(v54, "noteDidReceiveComment:mstreamdInfo:", v6, v55);

              if (objc_msgSend(v6, "isInterestingForAlbumsSorting"))
              {
                v71 = 0u;
                v72 = 0u;
                v69 = 0u;
                v70 = 0u;
                -[NSObject albums](v22, "albums");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                v56 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v69, v81, 16);
                if (v56)
                {
                  v57 = v56;
                  v58 = *(_QWORD *)v70;
                  do
                  {
                    for (k = 0; k != v57; ++k)
                    {
                      if (*(_QWORD *)v70 != v58)
                        objc_enumerationMutation(v33);
                      v60 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * k);
                      if (objc_msgSend(v60, "conformsToProtocol:", &unk_1EE3B1010))
                      {
                        objc_msgSend(v6, "commentDate");
                        v61 = objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v60, "updateCloudLastInterestingChangeDateWithDate:", v61);
                      }
                      else
                      {
                        PLPhotoSharingGetLog();
                        v61 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
                        {
                          *(_DWORD *)buf = 138412546;
                          v83 = (uint64_t)v22;
                          v84 = 2112;
                          v85 = v60;
                          _os_log_impl(&dword_199541000, v61, OS_LOG_TYPE_ERROR, "ERROR: cloud asset in a non-cloud album. Asset: %@, album: %@", buf, 0x16u);
                        }
                      }

                    }
                    v57 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v69, v81, 16);
                  }
                  while (v57);
                  goto LABEL_65;
                }
                goto LABEL_66;
              }
            }
          }
          else
          {
            PLPhotoSharingGetLog();
            v62 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v83 = (uint64_t)v32;
              _os_log_impl(&dword_199541000, v62, OS_LOG_TYPE_ERROR, "could not write asset inflight comment to path %@, skipping adding comment", buf, 0xCu);
            }

LABEL_65:
            v1 = v65;
LABEL_66:

          }
          v28 = v68;
          goto LABEL_68;
        }
        if (*(_BYTE *)(v1 + 49))
        {
          objc_msgSend(v6, "asset");
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          v28 = v68;
          if (v27)
          {
            objc_msgSend(v6, "asset");
            v22 = objc_claimAutoreleasedReturnValue();
            -[NSObject deleteComment:](v22, "deleteComment:", v6);
          }
          else
          {
            objc_msgSend(v6, "managedObjectContext");
            v22 = objc_claimAutoreleasedReturnValue();
            -[NSObject deleteObject:](v22, "deleteObject:", v6);
          }
        }
        else
        {
          PLPhotoSharingGetLog();
          v22 = objc_claimAutoreleasedReturnValue();
          v28 = v68;
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            v34 = objc_msgSend(*(id *)(v1 + 32), "jobType");
            *(_DWORD *)buf = v63;
            v83 = v34;
            _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_ERROR, "ERROR: unknown comment change job type %lld", buf, 0xCu);
          }
        }
LABEL_68:

      }
      v67 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v77, v89, 16);
    }
    while (v67);
  }

}

void __41__PLCloudSharedCommentsJob_runDaemonSide__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  objc_super v5;
  uint8_t buf[4];
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x19AEC1554]();
  switch(objc_msgSend(*(id *)(a1 + 32), "jobType"))
  {
    case 1:
    case 2:
      objc_msgSend(*(id *)(a1 + 32), "executeProcessServerNotificationOfCommentChanges");
      break;
    case 4:
      objc_msgSend(*(id *)(a1 + 32), "executePublishCommentToServer");
      break;
    case 5:
      objc_msgSend(*(id *)(a1 + 32), "executeDeleteCommentFromServer");
      break;
    default:
      PLPhotoSharingGetLog();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        v4 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        v7 = v4;
        _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_ERROR, "Error: unknown job type for %@", buf, 0xCu);
      }

      break;
  }
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)PLCloudSharedCommentsJob;
  objc_msgSendSuper2(&v5, sel_runDaemonSide);
  objc_msgSend(*(id *)(a1 + 40), "stillAlive");
  objc_autoreleasePoolPop(v2);
}

+ (void)publishCommentToServer:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  v7 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v7, "setJobType:", 4);
  objc_msgSend(v3, "cloudGUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCommentGUID:", v4);

  objc_msgSend(v3, "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "cloudAssetGUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAssetGUID:", v6);

  objc_msgSend(v7, "run");
}

+ (void)deleteSharedCommentFromServer:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  v7 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v7, "setJobType:", 5);
  objc_msgSend(v3, "cloudGUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCommentGUID:", v4);

  objc_msgSend(v3, "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "cloudAssetGUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAssetGUID:", v6);

  objc_msgSend(v7, "run");
}

+ (void)locallyProcessAddedComments:(id)a3 assetGUID:(id)a4 albumGUID:(id)a5 info:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v13, "setJobType:", 1);
  objc_msgSend(v13, "setMsASComments:", v12);

  objc_msgSend(v13, "setAssetGUID:", v11);
  objc_msgSend(v13, "setAlbumGUID:", v10);

  objc_msgSend(v13, "setMstreamdInfoDictionary:", v9);
  objc_msgSend(v13, "runAndWaitForMessageToBeSent");

}

+ (void)assetsdLocallyProcessAddedComments:(id)a3 assetGUID:(id)a4 albumGUID:(id)a5 info:(id)a6 libraryServicesManager:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;

  v13 = a7;
  v14 = a6;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  if ((PLIsAssetsd() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLCloudSharedCommentsJob.m"), 94, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("PLIsAssetsd()"));

    if (v13)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLCloudSharedCommentsJob.m"), 95, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("libraryServicesManager"));

    goto LABEL_3;
  }
  if (!v13)
    goto LABEL_5;
LABEL_3:
  v20 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v20, "setJobType:", 1);
  objc_msgSend(v20, "setMsASComments:", v17);

  objc_msgSend(v20, "setAssetGUID:", v16);
  objc_msgSend(v20, "setAlbumGUID:", v15);

  objc_msgSend(v20, "setMstreamdInfoDictionary:", v14);
  objc_msgSend(v20, "setLibraryServicesManager:", v13);

  objc_msgSend(v20, "runDaemonSide");
}

+ (void)locallyProcessDeletedComments:(id)a3 info:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v7, "setJobType:", 2);
  objc_msgSend(v7, "setMsASComments:", v6);

  objc_msgSend(v7, "setMstreamdInfoDictionary:", v5);
  objc_msgSend(v7, "runAndWaitForMessageToBeSent");

}

@end
