@implementation PLCloudSharedDeleteAlbumsJob

- (void)encodeToXPCObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PLCloudSharedDeleteAlbumsJob;
  v4 = a3;
  -[PLDaemonJob encodeToXPCObject:](&v7, sel_encodeToXPCObject_, v4);
  -[PLCloudSharedDeleteAlbumsJob albumCloudGUIDsToDelete](self, "albumCloudGUIDsToDelete", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PLXPCDictionarySetArray();

  -[PLCloudSharedDeleteAlbumsJob inviterAddress](self, "inviterAddress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PLXPCDictionarySetString();

}

- (id)initFromXPCObject:(id)a3 libraryServicesManager:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PLCloudSharedDeleteAlbumsJob;
  v7 = -[PLCloudSharingJob initFromXPCObject:libraryServicesManager:](&v11, sel_initFromXPCObject_libraryServicesManager_, v6, a4);
  if (v7)
  {
    PLArrayFromXPCDictionary();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAlbumCloudGUIDsToDelete:", v8);

    PLStringFromXPCDictionary();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setInviterAddress:", v9);

  }
  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PLCloudSharedDeleteAlbumsJob;
  -[PLDaemonJob description](&v8, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLCloudSharedDeleteAlbumsJob albumCloudGUIDsToDelete](self, "albumCloudGUIDsToDelete");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLCloudSharedDeleteAlbumsJob inviterAddress](self, "inviterAddress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" albumCloudGUIDsToDelete %@ inviter %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int64_t)daemonOperation
{
  return 4;
}

- (void)runDaemonSide
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLCloudSharedDeleteAlbumsJob runDaemonSide]");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "highPriorityOperationQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __45__PLCloudSharedDeleteAlbumsJob_runDaemonSide__block_invoke;
  v6[3] = &unk_1E3677C18;
  v6[4] = self;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "addOperationWithBlock:", v6);

}

- (NSArray)albumCloudGUIDsToDelete
{
  return self->_albumCloudGUIDsToDelete;
}

- (void)setAlbumCloudGUIDsToDelete:(id)a3
{
  objc_storeStrong((id *)&self->_albumCloudGUIDsToDelete, a3);
}

- (NSString)inviterAddress
{
  return self->_inviterAddress;
}

- (void)setInviterAddress:(id)a3
{
  objc_storeStrong((id *)&self->_inviterAddress, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inviterAddress, 0);
  objc_storeStrong((id *)&self->_albumCloudGUIDsToDelete, 0);
}

void __45__PLCloudSharedDeleteAlbumsJob_runDaemonSide__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  objc_super v5;
  _QWORD v6[5];
  id v7;

  v2 = (void *)MEMORY[0x19AEC1554]();
  objc_msgSend(*(id *)(a1 + 32), "transientPhotoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __45__PLCloudSharedDeleteAlbumsJob_runDaemonSide__block_invoke_2;
  v6[3] = &unk_1E3677C18;
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v4 = v3;
  objc_msgSend(v4, "performTransactionAndWait:", v6);
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)PLCloudSharedDeleteAlbumsJob;
  objc_msgSendSuper2(&v5, sel_runDaemonSide);
  objc_msgSend(*(id *)(a1 + 40), "stillAlive");

  objc_autoreleasePoolPop(v2);
}

void __45__PLCloudSharedDeleteAlbumsJob_runDaemonSide__block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  __int128 v21;
  void *v22;
  uint64_t v23;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  NSObject *v30;
  __int16 v31;
  NSObject *v32;
  __int16 v33;
  uint64_t v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  +[PLNotificationManager sharedManager](PLNotificationManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  PLPhotoSharingGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  v22 = v2;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "albumCloudGUIDsToDelete");
    v4 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v30 = v4;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEFAULT, "PLCloudSharedDeleteAlbumsJob will delete locally shared albums with UUIDS %@", buf, 0xCu);

    v2 = v22;
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "albumCloudGUIDsToDelete");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v26;
    v23 = *MEMORY[0x1E0D16CB0];
    *(_QWORD *)&v6 = 138412290;
    v21 = v6;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v26 != v8)
          objc_enumerationMutation(obj);
        v10 = *(NSObject **)(*((_QWORD *)&v25 + 1) + 8 * i);
        +[PLCloudSharedAlbum cloudSharedAlbumWithGUID:inLibrary:](PLCloudSharedAlbum, "cloudSharedAlbumWithGUID:inLibrary:", v10, *(_QWORD *)(a1 + 40), v21);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          objc_msgSend(*(id *)(a1 + 32), "inviterAddress");
          v12 = objc_claimAutoreleasedReturnValue();
          if (!-[NSObject length](v12, "length"))
            goto LABEL_13;
          objc_msgSend(v11, "cloudMetadata");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectForKey:", v23);
          v14 = objc_claimAutoreleasedReturnValue();

          if (!-[NSObject length](v14, "length")
            || (-[NSObject isEqualToString:](v14, "isEqualToString:", v12) & 1) != 0)
          {

LABEL_13:
            PLPhotoSharingGetLog();
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v11, "title");
              v16 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "assets");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = objc_msgSend(v17, "count");
              *(_DWORD *)buf = 138412802;
              v30 = v16;
              v31 = 2112;
              v32 = v10;
              v33 = 2048;
              v34 = v18;
              _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_DEFAULT, "PLCloudSharedDeleteAlbumsJob will delete locally shared album with title %@, UUID %@, and %lu assets", buf, 0x20u);

              v2 = v22;
            }

            objc_msgSend(v2, "noteDidDeleteSharedAlbum:", v11);
            objc_msgSend(v11, "delete");
            goto LABEL_21;
          }
          PLPhotoSharingGetLog();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v11, "cloudGUID");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v30 = v14;
            v31 = 2112;
            v32 = v12;
            v33 = 2112;
            v34 = (uint64_t)v20;
            _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_ERROR, "PLCloudSharedDeleteAlbumsJob persisted inviterAddress %@ does not match current inviterAddress %@, skip deleting the album %@", buf, 0x20u);

          }
        }
        else
        {
          PLPhotoSharingGetLog();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v21;
            v30 = v10;
            _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_DEFAULT, "PLCloudSharedDeleteAlbumsJob did not find locally shared album with uuid %@ to delete", buf, 0xCu);
          }
        }
LABEL_21:

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
    }
    while (v7);
  }

}

+ (void)deleteLocalAlbumsForMSASAlbumGUIDs:(id)a3
{
  void *v3;
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v3 = (void *)objc_opt_new();
    objc_msgSend(v3, "setAlbumCloudGUIDsToDelete:", v4);
    objc_msgSend(v3, "runAndWaitForMessageToBeSent");

  }
}

+ (void)deleteLocalAlbumForMSASAlbumGUID:(id)a3 inviterAddress:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  v9[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setAlbumCloudGUIDsToDelete:", v8);
  objc_msgSend(v7, "setInviterAddress:", v5);

  objc_msgSend(v7, "runAndWaitForMessageToBeSent");
}

@end
