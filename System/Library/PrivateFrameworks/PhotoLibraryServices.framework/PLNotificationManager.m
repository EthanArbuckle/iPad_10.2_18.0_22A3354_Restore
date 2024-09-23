@implementation PLNotificationManager

+ (id)filteredAlbumListForContentMode:(int)a3 library:(id)a4
{
  void *v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(a4, "albumListForContentMode:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = 397312;
    if (a3 == 1)
    {
      v6 = 462848;
    }
    else if (a3 == 13 || a3 == 2)
    {
      v6 = 17174528;
    }
    +[PLFilteredAlbumList filteredAlbumList:filter:](PLFilteredAlbumList, "filteredAlbumList:filter:", v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (PLNotificationManager)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLNotificationManager.m"), 157, CFSTR("Do not use this initializer"));

  return 0;
}

- (id)_initSharedInstance
{
  PLNotificationManager *v2;
  PLNotificationManager *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *isolationQueue;
  __CFNotificationCenter *DarwinNotifyCenter;
  NSMutableDictionary *v7;
  NSMutableDictionary *waitingAssetsAddNotifications;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PLNotificationManager;
  v2 = -[PLNotificationManager init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_alertFiltrationEnabled = -1;
    v4 = dispatch_queue_create("com.apple.PLNotificationManager.IsolationQueue", 0);
    isolationQueue = v3->_isolationQueue;
    v3->_isolationQueue = (OS_dispatch_queue *)v4;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v3, (CFNotificationCallback)incomingMessageAlertFiltrationEnabledChanged, CFSTR("com.apple.mobileslideshow.IncomingMessageAlertFiltration.changed"), 0, (CFNotificationSuspensionBehavior)1028);
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    waitingAssetsAddNotifications = v3->_waitingAssetsAddNotifications;
    v3->_waitingAssetsAddNotifications = v7;

    v3->_processCinematicVideoItemsPrompt = 0;
    v3->_processCinematicVideoItemsPromptLock._os_unfair_lock_opaque = 0;
  }
  return v3;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4.receiver = self;
  v4.super_class = (Class)PLNotificationManager;
  -[PLNotificationManager dealloc](&v4, sel_dealloc);
}

- (BOOL)enableTemporaryDebugMode
{
  return self->_enableTemporaryDebugMode;
}

- (void)setEnableTemporaryDebugMode:(BOOL)a3
{
  self->_enableTemporaryDebugMode = a3;
}

- (void)noteDidReceiveInvitationForSharedAlbum:(id)a3
{
  id v4;
  PLNotification *v5;
  void *v6;
  PLNotification *v7;
  id v8;
  id v9;
  id location;

  v4 = a3;
  v5 = -[PLNotification initWithInvitationAlbum:]([PLNotification alloc], "initWithInvitationAlbum:", v4);
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLNotificationManager noteDidReceiveInvitationForSharedAlbum:]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_copyWeak(&v9, &location);
  v7 = v5;
  v8 = v6;
  pl_dispatch_async();

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

- (void)noteDidDeleteSharedAlbum:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id location;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLNotificationManager noteDidDeleteSharedAlbum:]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  objc_initWeak(&location, self);
  objc_copyWeak(&v10, &location);
  v8 = v7;
  v9 = v5;
  pl_dispatch_async();

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

- (void)noteDidDeleteSharedAssetsWithUUIDs:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLNotificationManager noteDidDeleteSharedAssetsWithUUIDs:]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v6 = v4;
  objc_copyWeak(&v8, &location);
  v7 = v5;
  pl_dispatch_async();

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

- (void)noteInvitationRecordStatusChanged:(id)a3 fromOldState:(int64_t)a4 mstreamdInfo:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  int v17;
  NSObject *v18;
  void *v19;
  PLNotification *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  _BOOL4 v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32[6];
  id v33;
  id v34;
  uint8_t buf[4];
  int64_t v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  objc_msgSend(v8, "album");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "valueForKey:", *MEMORY[0x1E0D16D88]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "BOOLValue");

  if (v12)
  {
    PLPhotoSharingGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v10, "localizedTitle");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v36 = (int64_t)v14;
      v37 = 2112;
      v38 = v8;
      _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_DEFAULT, "Notifications: Ignoring invitatitionRecordStatusChanged notification for album %@ and invitationRecord %@ beause it's not interesting as per mstreamd dictionary.", buf, 0x16u);

    }
  }
  objc_msgSend(v8, "invitationState");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "intValue");

  if ((objc_msgSend(v10, "isOwnedCloudSharedAlbum") & 1) != 0
    || -[PLNotificationManager enableTemporaryDebugMode](self, "enableTemporaryDebugMode"))
  {
    v17 = 0;
  }
  else
  {
    PLPhotoSharingGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v10, "localizedTitle");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v36 = (int64_t)v19;
      _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_DEFAULT, "Notifications: Ignoring invitation status changed because we don't own the album %@.", buf, 0xCu);

    }
    v17 = 1;
  }
  if ((objc_msgSend(v10, "cloudNotificationsEnabled") & 1) == 0)
  {
    PLPhotoSharingGetLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v10, "localizedTitle");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v36 = (int64_t)v23;
      _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_DEFAULT, "Notifications: Ignoring invitation status changed since we are currently not accepting notification for album %@.", buf, 0xCu);

    }
    goto LABEL_27;
  }
  if (-[PLNotificationManager enableTemporaryDebugMode](self, "enableTemporaryDebugMode")
    || v16 != a4 && (v16 == 2 || v16 == 4))
  {
    if (((v17 | v12) & 1) == 0)
    {
      v20 = -[PLNotification initWithInvitationRecordStatusChanged:]([PLNotification alloc], "initWithInvitationRecordStatusChanged:", v8);
      objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLNotificationManager noteInvitationRecordStatusChanged:fromOldState:mstreamdInfo:]");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_initWeak((id *)buf, self);
      v32[1] = (id)MEMORY[0x1E0C809B0];
      v32[2] = (id)3221225472;
      v32[3] = __85__PLNotificationManager_noteInvitationRecordStatusChanged_fromOldState_mstreamdInfo___block_invoke;
      v32[4] = &unk_1E366FA08;
      objc_copyWeak(&v34, (id *)buf);
      v22 = v20;
      v32[5] = v22;
      v33 = v21;
      pl_dispatch_async();

      objc_destroyWeak(&v34);
      objc_destroyWeak((id *)buf);

LABEL_27:
      goto LABEL_28;
    }
  }
  else
  {
    PLPhotoSharingGetLog();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      v36 = a4;
      v37 = 2048;
      v38 = (id)(int)v16;
      _os_log_impl(&dword_199541000, v24, OS_LOG_TYPE_DEFAULT, "Notifications: Ignoring invitation status changed because it changed from %ld to %ld.", buf, 0x16u);
    }

  }
  if ((objc_msgSend(v10, "isOwnedCloudSharedAlbum") & 1) == 0 && v16 >= 2)
  {
    objc_msgSend(v8, "inviteeEmails");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "firstObject");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = +[PLPhotoSharingHelper accountMatchesEmail:](PLPhotoSharingHelper, "accountMatchesEmail:", v26);

    if (v27)
    {
      objc_msgSend(v10, "uuid");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (void *)objc_msgSend(v28, "copy");

      objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLNotificationManager noteInvitationRecordStatusChanged:fromOldState:mstreamdInfo:]");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_initWeak((id *)buf, self);
      objc_copyWeak(v32, (id *)buf);
      v22 = v29;
      v31 = v30;
      pl_dispatch_async();

      objc_destroyWeak(v32);
      objc_destroyWeak((id *)buf);

      goto LABEL_27;
    }
  }
LABEL_28:

}

- (void)noteMultipleContributorStatusChangedForAlbum:(id)a3 mstreamdInfo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  PLNotification *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24[6];
  id v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "valueForKey:", *MEMORY[0x1E0D16D88]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  if (v9)
  {
    PLPhotoSharingGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "localizedTitle");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v28 = v11;
      _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_DEFAULT, "Notifications: Ignoring multipleContributorStatusChanged notification for album %@ beause it's not interesting as per mstreamd dictionary.", buf, 0xCu);

    }
  }
  else if ((objc_msgSend(v6, "cloudNotificationsEnabled") & 1) != 0)
  {
    if (objc_msgSend(v6, "isOwnedCloudSharedAlbum")
      && !-[PLNotificationManager enableTemporaryDebugMode](self, "enableTemporaryDebugMode"))
    {
      PLPhotoSharingGetLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v6, "localizedTitle");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v28 = v22;
        _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_DEFAULT, "Notifications: Ignoring multiple status changed notification because we are not subscribed to this the album %@.", buf, 0xCu);

      }
    }
    else
    {
      objc_msgSend(v6, "cloudMultipleContributorsEnabled");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "BOOLValue");

      if (v13)
      {
        v14 = -[PLNotification initWithMultipleContributorEnabledForAlbum:]([PLNotification alloc], "initWithMultipleContributorEnabledForAlbum:", v6);
        objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLNotificationManager noteMultipleContributorStatusChangedForAlbum:mstreamdInfo:]");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_initWeak((id *)buf, self);
        v24[1] = (id)MEMORY[0x1E0C809B0];
        v24[2] = (id)3221225472;
        v24[3] = __83__PLNotificationManager_noteMultipleContributorStatusChangedForAlbum_mstreamdInfo___block_invoke;
        v24[4] = &unk_1E366FA08;
        objc_copyWeak(&v26, (id *)buf);
        v10 = v14;
        v24[5] = v10;
        v25 = v15;
        pl_dispatch_async();

        objc_destroyWeak(&v26);
        objc_destroyWeak((id *)buf);

      }
      else
      {
        objc_msgSend(v6, "uuid");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)objc_msgSend(v17, "copy");

        PLPhotoSharingGetLog();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v6, "localizedTitle");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v28 = v20;
          _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_DEFAULT, "Notifications: Deleting notifications for multiple contributor status change for album: %@.", buf, 0xCu);

        }
        objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLNotificationManager noteMultipleContributorStatusChangedForAlbum:mstreamdInfo:]");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_initWeak((id *)buf, self);
        objc_copyWeak(v24, (id *)buf);
        v10 = v18;
        v23 = v21;
        pl_dispatch_async();

        objc_destroyWeak(v24);
        objc_destroyWeak((id *)buf);

      }
    }
  }
  else
  {
    PLPhotoSharingGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "localizedTitle");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v28 = v16;
      _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_DEFAULT, "Notifications: Ignoring multipleContributorStatusChanged notification since we are currently not accepting notification for album %@.", buf, 0xCu);

    }
  }

}

- (void)noteDidReceiveAssets:(id)a3 forSharedAlbum:(id)a4 mstreamdInfo:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  BOOL v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  int v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  OS_dispatch_queue *v24;
  OS_dispatch_queue *v25;
  id v26;
  id v27;
  id location;
  _QWORD v29[4];
  NSObject *v30;
  _BYTE buf[24];
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  PLNotification *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "cloudIsMyAsset"))
  {
    v12 = -[PLNotificationManager enableTemporaryDebugMode](self, "enableTemporaryDebugMode");

    if (!v12)
    {
      PLPhotoSharingGetLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v9, "localizedTitle");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v14;
        _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_DEFAULT, "Notifications: Ignoring addedAsset notification since we own the  asset in the album %@.", buf, 0xCu);

      }
      goto LABEL_17;
    }
  }
  else
  {

  }
  if ((objc_msgSend(v9, "cloudNotificationsEnabled") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __74__PLNotificationManager_noteDidReceiveAssets_forSharedAlbum_mstreamdInfo___block_invoke;
    v29[3] = &unk_1E36740E0;
    v13 = v15;
    v30 = v13;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v29);
    PLPhotoSharingGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v9, "localizedTitle");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v17;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v13;
      _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_DEFAULT, "Notifications: Processing addedAsset to \"%@\", UUIDs: %@.", buf, 0x16u);

    }
    objc_msgSend(v10, "valueForKey:", *MEMORY[0x1E0D16D88]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "BOOLValue");

    if (v19)
    {
      PLPhotoSharingGetLog();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v9, "localizedTitle");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v21;
        _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_DEFAULT, "Notifications: Ignoring addedAsset notification for album %@ beause it's not interesting as per mstreamd dictionary.", buf, 0xCu);

      }
    }
    else
    {
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v32 = __Block_byref_object_copy__66790;
      v33 = __Block_byref_object_dispose__66791;
      v34 = -[PLNotification initWithAssetsAdded:toAlbum:]([PLNotification alloc], "initWithAssetsAdded:toAlbum:", v8, v9);
      objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLNotificationManager noteDidReceiveAssets:forSharedAlbum:mstreamdInfo:]");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = self->_isolationQueue;
      objc_initWeak(&location, self);
      objc_copyWeak(&v27, &location);
      v25 = v24;
      v26 = v23;
      pl_dispatch_async();

      objc_destroyWeak(&v27);
      objc_destroyWeak(&location);

      _Block_object_dispose(buf, 8);
    }

  }
  else
  {
    PLPhotoSharingGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v9, "localizedTitle");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v22;
      _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_DEFAULT, "Notifications: Ignoring addedAsset notification since we are currently not accepting notification for album %@.", buf, 0xCu);

    }
  }
LABEL_17:

}

- (void)noteDidChangePlaceholderKindForAsset:(id)a3 fromOldKind:(signed __int16)a4 forSharedAlbum:(id)a5 mstreamdInfo:(id)a6
{
  id v9;
  id v10;
  id v11;
  int v12;
  NSObject *v13;
  void *v14;
  int v15;
  NSObject *v16;
  void *v17;
  const char *v18;
  int v19;
  _DWORD v20[7];

  *(_QWORD *)&v20[5] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  v11 = a6;
  if (objc_msgSend(v9, "cloudIsMyAsset")
    && !-[PLNotificationManager enableTemporaryDebugMode](self, "enableTemporaryDebugMode"))
  {
    PLPhotoSharingGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v10, "localizedTitle");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138412290;
      *(_QWORD *)v20 = v17;
      v18 = "Notifications: Ignoring placeholderKindChanged notification since we own the album %@.";
      goto LABEL_13;
    }
  }
  else if ((objc_msgSend(v10, "cloudNotificationsEnabled") & 1) != 0)
  {
    v12 = objc_msgSend(v9, "cloudPlaceholderKind");
    PLPhotoSharingGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 67109378;
      v20[0] = v12;
      LOWORD(v20[1]) = 2112;
      *(_QWORD *)((char *)&v20[1] + 2) = v9;
      _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_DEFAULT, "Notifications: Processing placeholderKindChanged. Asset changed to %d. (asset: %@)", (uint8_t *)&v19, 0x12u);
    }

    objc_msgSend(v11, "valueForKey:", *MEMORY[0x1E0D16D88]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "BOOLValue");

    if (!v15)
    {
      -[PLNotificationManager triggerNotificationThumbnailUpdateForAsset:](self, "triggerNotificationThumbnailUpdateForAsset:", v9);
      goto LABEL_15;
    }
    PLPhotoSharingGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v10, "localizedTitle");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138412290;
      *(_QWORD *)v20 = v17;
      v18 = "Notifications: Ignoring placeholderKindChanged notification for album %@ beause it's not interesting as per "
            "mstreamd dictionary.";
LABEL_13:
      _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&v19, 0xCu);

    }
  }
  else
  {
    PLPhotoSharingGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v10, "localizedTitle");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138412290;
      *(_QWORD *)v20 = v17;
      v18 = "Notifications: Ignoring placeholderKindChanged notification since we are currently not accepting notification for album %@.";
      goto LABEL_13;
    }
  }

LABEL_15:
}

- (void)noteDidReceiveComment:(id)a3 mstreamdInfo:(id)a4
{
  id v6;
  id v7;
  char v8;
  char v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  const __CFString *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  const __CFString *v31;
  OS_dispatch_queue *v32;
  void *v33;
  id v34;
  id v35;
  char v36;
  char v37;
  id location;
  char v39;
  _BYTE buf[24];
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  PLNotification *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v39 = 0;
  v8 = objc_msgSend(v6, "shouldNotifyAsNotificationWithMediaStreamInfo:asCaptionOnly:", v7, &v39);
  v9 = v8;
  if (v39)
    v10 = 1;
  else
    v10 = v8;
  if ((v10 & 1) == 0)
  {
    PLPhotoSharingGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "cloudGUID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "asset");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "cloudAssetGUID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "isCaption");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "BOOLValue");
      v24 = CFSTR("N");
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v19;
      *(_WORD *)&buf[12] = 2112;
      if (v23)
        v24 = CFSTR("Y");
      *(_QWORD *)&buf[14] = v21;
      *(_WORD *)&buf[22] = 2112;
      v41 = (uint64_t (*)(uint64_t, uint64_t))v24;
      _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_DEFAULT, "Notifications: Ignoring received comment: %@, for asset: %@, isCaption: %@", buf, 0x20u);

    }
    goto LABEL_9;
  }
  objc_msgSend(v6, "asset");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "isCloudSharedAsset") & 1) != 0)
  {
    objc_msgSend(v6, "asset");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "cloudShareAlbum");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "cloudNotificationsEnabled");

    if ((v14 & 1) == 0)
    {
      PLPhotoSharingGetLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v6, "asset");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "cloudShareAlbum");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "cloudGUID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v18;
        _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_DEFAULT, "Notifications: Ignoring received comment notification since we are currently not accepting notification for album %@.", buf, 0xCu);

      }
LABEL_9:

      goto LABEL_21;
    }
  }
  else
  {

  }
  PLPhotoSharingGetLog();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "cloudGUID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "asset");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "cloudAssetGUID");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "isCaption");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "BOOLValue");
    v31 = CFSTR("N");
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v26;
    *(_WORD *)&buf[12] = 2112;
    if (v30)
      v31 = CFSTR("Y");
    *(_QWORD *)&buf[14] = v28;
    *(_WORD *)&buf[22] = 2112;
    v41 = (uint64_t (*)(uint64_t, uint64_t))v31;
    _os_log_impl(&dword_199541000, v25, OS_LOG_TYPE_DEFAULT, "Notifications: Processing received comment: %@, for asset: %@, isCaption: %@", buf, 0x20u);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v41 = __Block_byref_object_copy__66790;
  v42 = __Block_byref_object_dispose__66791;
  v43 = -[PLNotification initWithCommentAdded:]([PLNotification alloc], "initWithCommentAdded:", v6);
  v32 = self->_isolationQueue;
  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLNotificationManager noteDidReceiveComment:mstreamdInfo:]");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v36 = v9;
  v37 = v39;
  objc_copyWeak(&v35, &location);
  v34 = v33;
  pl_dispatch_async();

  objc_destroyWeak(&v35);
  objc_destroyWeak(&location);

  _Block_object_dispose(buf, 8);
LABEL_21:

}

- (void)noteDidReceiveLike:(id)a3 mstreamdInfo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  NSObject *v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  void *v25;
  OS_dispatch_queue *v26;
  void *v27;
  id v28;
  id v29;
  id location;
  _BYTE buf[24];
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  PLNotification *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v6, "shouldNotifyAsNotificationWithMediaStreamInfo:asCaptionOnly:", v7, 0) & 1) == 0)
  {
    PLPhotoSharingGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "commenterDisplayName");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "asset");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "uuid");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v16;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v18;
      _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_DEFAULT, "Notifications: Ignoring received like from %@, asset: %@", buf, 0x16u);

    }
    goto LABEL_6;
  }
  objc_msgSend(v6, "asset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isCloudSharedAsset") & 1) != 0)
  {
    objc_msgSend(v6, "asset");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cloudShareAlbum");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "cloudNotificationsEnabled");

    if ((v11 & 1) == 0)
    {
      PLPhotoSharingGetLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v6, "asset");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "cloudShareAlbum");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "localizedTitle");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v15;
        _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_DEFAULT, "Notifications: Ignoring received like notification since we are currently not accepting notification for album %@.", buf, 0xCu);

      }
LABEL_6:

      goto LABEL_18;
    }
  }
  else
  {

  }
  objc_msgSend(v7, "valueForKey:", *MEMORY[0x1E0D16D88]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "BOOLValue");

  PLPhotoSharingGetLog();
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
  if (v20)
  {
    if (v22)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_DEFAULT, "Notifications: Ignoring add liked notification beause it's not interesting as per mstreamd dictionary.", buf, 2u);
    }

  }
  else
  {
    if (v22)
    {
      objc_msgSend(v6, "commenterDisplayName");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "asset");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "uuid");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v23;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v25;
      _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_DEFAULT, "Notifications: Processing recevedLike: %@. asset: %@", buf, 0x16u);

    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v32 = __Block_byref_object_copy__66790;
    v33 = __Block_byref_object_dispose__66791;
    v34 = -[PLNotification initWithLikeAdded:]([PLNotification alloc], "initWithLikeAdded:", v6);
    v26 = self->_isolationQueue;
    objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLNotificationManager noteDidReceiveLike:mstreamdInfo:]");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    objc_copyWeak(&v29, &location);
    v28 = v27;
    pl_dispatch_async();

    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);

    _Block_object_dispose(buf, 8);
  }
LABEL_18:

}

- (void)noteSharedAlbumUnseenStatusDidChange:(id)a3
{
  id v4;
  int v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  char v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "hasUnseenContentBoolValue");
  objc_msgSend(v4, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  PLPhotoSharingGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "localizedTitle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = CFSTR("NO");
    *(_DWORD *)buf = 138412802;
    v17 = v9;
    v18 = 2112;
    if (v5)
      v10 = CFSTR("YES");
    v19 = v7;
    v20 = 2112;
    v21 = v10;
    _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_DEFAULT, "Notifications: processing albumUnseenStatusDidChange \"%@\" (%@), unseen: %@", buf, 0x20u);

  }
  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLNotificationManager noteSharedAlbumUnseenStatusDidChange:]");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak((id *)buf, self);
  v15 = v5;
  objc_copyWeak(&v14, (id *)buf);
  v12 = v7;
  v13 = v11;
  pl_dispatch_async();

  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);

}

- (void)noteSharedAssetCommentsUnreadStatusDidChange:(id)a3
{
  id v4;
  int v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  const __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "cloudHasUnseenComments");
  objc_msgSend(v4, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  PLPhotoSharingGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "uuid");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    v11 = CFSTR("NO");
    if (v5)
      v11 = CFSTR("YES");
    *(_DWORD *)buf = 138412546;
    v17 = v9;
    v18 = 2112;
    v19 = v11;
    _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_DEFAULT, "Notifications: Processing assetCommentsUnreadStatusDidChange for asset %@, unread: %@", buf, 0x16u);

  }
  if ((v5 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLNotificationManager noteSharedAssetCommentsUnreadStatusDidChange:]");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak((id *)buf, self);
    objc_copyWeak(&v15, (id *)buf);
    v13 = v7;
    v14 = v12;
    pl_dispatch_async();

    objc_destroyWeak(&v15);
    objc_destroyWeak((id *)buf);

  }
}

- (void)noteDidReceiveCMMInvitationWithMomentShare:(id)a3
{
  id v4;
  id v5;
  void *v6;
  NSObject *v7;
  const char *v8;
  void *v9;
  id v10;
  id buf[2];

  v4 = a3;
  v5 = -[PLNotification initCMMInvitationWithMomentShare:]([PLNotification alloc], "initCMMInvitationWithMomentShare:", v4);
  objc_msgSend(v5, "senderEmailAddress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    if (objc_msgSend(v4, "status") == 1)
    {
      PLPhotoSharingGetLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        v8 = "Notifications: MomentShare is inited by myself.";
LABEL_10:
        _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)buf, 2u);
      }
    }
    else
    {
      if (!-[PLNotificationManager _shouldAllowAlertsFromContactWithEmail:](self, "_shouldAllowAlertsFromContactWithEmail:", v6))
      {
        objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLNotificationManager noteDidReceiveCMMInvitationWithMomentShare:]");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_initWeak(buf, self);
        objc_copyWeak(&v10, buf);
        v7 = v9;
        pl_dispatch_async();

        objc_destroyWeak(&v10);
        objc_destroyWeak(buf);
        goto LABEL_12;
      }
      PLPhotoSharingGetLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        v8 = "Notifications: MomentShare's invitor is NOT in my contacts.";
        goto LABEL_10;
      }
    }
  }
  else
  {
    PLPhotoSharingGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      v8 = "Notifications: no sender email address.";
      goto LABEL_10;
    }
  }
LABEL_12:

}

- (void)noteDidReceiveExpiringCMMInvitationsWithMomentShares:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  PLNotification *v13;
  _QWORD v14[4];
  id v15;

  v5 = a3;
  if (!objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLNotificationManager.m"), 673, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("momentShares.count"));

  }
  v13 = -[PLNotification initWithExpiringMomentShares:]([PLNotification alloc], "initWithExpiringMomentShares:", v5);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __78__PLNotificationManager_noteDidReceiveExpiringCMMInvitationsWithMomentShares___block_invoke;
  v14[3] = &unk_1E366FD98;
  v15 = v6;
  v7 = v6;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v14);
  objc_msgSend(v5, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "thumbnailImageData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLNotification title](v13, "title");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLNotification message](v13, "message");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLNotificationManager postNotificationForExpiringCMMsWithUUIDs:thumbnailImageData:notificationTitle:notificationSubtitle:](self, "postNotificationForExpiringCMMsWithUUIDs:thumbnailImageData:notificationTitle:notificationSubtitle:", v7, v9, v10, v11);

}

- (void)noteUserAssetsAreReadyForMomentShare:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id location;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3032000000;
  v9[3] = __Block_byref_object_copy__66790;
  v9[4] = __Block_byref_object_dispose__66791;
  v10 = -[PLNotification initCMMInvitationReadyToViewWithMomentShare:]([PLNotification alloc], "initCMMInvitationReadyToViewWithMomentShare:", v4);
  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLNotificationManager noteUserAssetsAreReadyForMomentShare:]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  objc_copyWeak(&v7, &location);
  v6 = v5;
  pl_dispatch_async();

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

  _Block_object_dispose(v9, 8);
}

- (void)noteUserDidViewCloudFeedContent:(unint64_t)a3 photoLibrary:(id)a4
{
  char v4;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  PLNotificationManager *v31;
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  id v38;
  _QWORD v39[2];
  uint8_t buf[4];
  id v41;
  uint64_t v42;

  v4 = a3;
  v42 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(v6, "managedObjectContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v4 & 1) != 0)
  {
    v10 = objc_alloc_init(MEMORY[0x1E0C97B48]);
    +[PLManagedObject entityInManagedObjectContext:](PLCloudSharedAlbum, "entityInManagedObjectContext:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setEntity:", v11);

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(hasUnseenContent == YES)"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setPredicate:", v12);

    v38 = 0;
    objc_msgSend(v7, "executeFetchRequest:error:", v10, &v38);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v38;
    if (!v8)
    {
      PLPhotoSharingGetLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v41 = v9;
        _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_ERROR, "failed to fetch albums with unseen content: %@", buf, 0xCu);
      }

    }
  }
  else
  {
    v8 = 0;
    v9 = 0;
  }
  if ((v4 & 2) != 0)
  {
    v15 = (void *)MEMORY[0x1E0C97B48];
    +[PLManagedAsset entityName](PLManagedAsset, "entityName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "fetchRequestWithEntityName:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = (void *)MEMORY[0x1E0CB3528];
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == YES"), CFSTR("cloudHasUnseenComments"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = v19;
    objc_msgSend(MEMORY[0x1E0D73310], "predicateForIncludeMask:useIndex:", objc_msgSend(MEMORY[0x1E0D73310], "maskForCloudSharedAsset"), 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v39[1] = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "andPredicateWithSubpredicates:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "setPredicate:", v22);
    v37 = v9;
    objc_msgSend(v7, "executeFetchRequest:error:", v17, &v37);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v37;

    if (!v14)
    {
      PLPhotoSharingGetLog();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v41 = v23;
        _os_log_impl(&dword_199541000, v24, OS_LOG_TYPE_ERROR, "failed to fetch assets with unseen comments: %@", buf, 0xCu);
      }

    }
    v9 = v23;
  }
  else
  {
    v14 = 0;
  }
  if (objc_msgSend(v8, "count") || objc_msgSend(v14, "count"))
  {
    objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLNotificationManager noteUserDidViewCloudFeedContent:photoLibrary:]");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak((id *)buf, self);
    v26 = MEMORY[0x1E0C809B0];
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __70__PLNotificationManager_noteUserDidViewCloudFeedContent_photoLibrary___block_invoke;
    v34[3] = &unk_1E3677C18;
    v35 = v8;
    v36 = v14;
    v28[0] = v26;
    v28[1] = 3221225472;
    v28[2] = __70__PLNotificationManager_noteUserDidViewCloudFeedContent_photoLibrary___block_invoke_2;
    v28[3] = &unk_1E366FC38;
    v29 = v35;
    v30 = v36;
    v31 = self;
    objc_copyWeak(&v33, (id *)buf);
    v27 = v25;
    v32 = v27;
    objc_msgSend(v6, "performTransaction:completionHandler:withPriority:", v34, v28, 0);

    objc_destroyWeak(&v33);
    objc_destroyWeak((id *)buf);

  }
}

- (void)noteUserDidNavigateIntoSharedAlbum:(id)a3 photoLibrary:(id)a4
{
  id v6;
  id v7;
  int v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id location;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "hasUnseenContentBoolValue");
  v9 = MEMORY[0x1E0C809B0];
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLNotificationManager noteUserDidNavigateIntoSharedAlbum:photoLibrary:]");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v9;
    v21[1] = 3221225472;
    v21[2] = __73__PLNotificationManager_noteUserDidNavigateIntoSharedAlbum_photoLibrary___block_invoke;
    v21[3] = &unk_1E3677AA0;
    v22 = v6;
    v19[0] = v9;
    v19[1] = 3221225472;
    v19[2] = __73__PLNotificationManager_noteUserDidNavigateIntoSharedAlbum_photoLibrary___block_invoke_2;
    v19[3] = &unk_1E3677AA0;
    v20 = v10;
    v11 = v10;
    objc_msgSend(v7, "performTransaction:completionHandler:withPriority:", v21, v19, 0);

  }
  objc_msgSend(v6, "uuid");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "copy");

  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLNotificationManager noteUserDidNavigateIntoSharedAlbum:photoLibrary:]");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  objc_copyWeak(&v17, &location);
  v15 = v13;
  v16 = v14;
  pl_dispatch_async();

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

- (void)noteUserDidNavigateAwayFromSharedAlbum:(id)a3 photoLibrary:(id)a4
{
  id v5;
  id v6;
  char v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  char v16;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "hasUnseenContentBoolValue");
  v8 = objc_msgSend(v5, "unseenAssetsCountIntegerValue");
  if ((v7 & 1) != 0 || v8)
  {
    objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLNotificationManager noteUserDidNavigateAwayFromSharedAlbum:photoLibrary:]");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __77__PLNotificationManager_noteUserDidNavigateAwayFromSharedAlbum_photoLibrary___block_invoke;
    v14[3] = &unk_1E36762F8;
    v16 = v7;
    v15 = v5;
    v12[0] = v10;
    v12[1] = 3221225472;
    v12[2] = __77__PLNotificationManager_noteUserDidNavigateAwayFromSharedAlbum_photoLibrary___block_invoke_2;
    v12[3] = &unk_1E3677AA0;
    v13 = v9;
    v11 = v9;
    objc_msgSend(v6, "performTransaction:completionHandler:withPriority:", v14, v12, 0);

  }
}

- (void)noteUserDidReadCommentOnSharedAsset:(id)a3 photoLibrary:(id)a4
{
  id v6;
  id v7;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id location;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "cloudHasUnseenComments");
  v9 = MEMORY[0x1E0C809B0];
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLNotificationManager noteUserDidReadCommentOnSharedAsset:photoLibrary:]");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "photoLibrary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v9;
    v22[1] = 3221225472;
    v22[2] = __74__PLNotificationManager_noteUserDidReadCommentOnSharedAsset_photoLibrary___block_invoke;
    v22[3] = &unk_1E3677AA0;
    v23 = v6;
    v20[0] = v9;
    v20[1] = 3221225472;
    v20[2] = __74__PLNotificationManager_noteUserDidReadCommentOnSharedAsset_photoLibrary___block_invoke_2;
    v20[3] = &unk_1E3677AA0;
    v21 = v10;
    v12 = v10;
    objc_msgSend(v11, "performTransaction:completionHandler:withPriority:", v22, v20, 0);

  }
  objc_msgSend(v6, "uuid");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");

  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLNotificationManager noteUserDidReadCommentOnSharedAsset:photoLibrary:]");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  objc_copyWeak(&v18, &location);
  v16 = v14;
  v17 = v15;
  pl_dispatch_async();

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

}

- (void)noteUserDidDeleteSharedAlbumWithUUID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLNotificationManager noteUserDidDeleteSharedAlbumWithUUID:]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  objc_copyWeak(&v8, &location);
  v6 = v4;
  v7 = v5;
  pl_dispatch_async();

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

- (void)noteUserDidDeleteSharedAssetsWithUUIDs:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLNotificationManager noteUserDidDeleteSharedAssetsWithUUIDs:]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v6 = v4;
  objc_copyWeak(&v8, &location);
  v7 = v5;
  pl_dispatch_async();

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

- (void)noteUserDidLeavePhotosApplication
{
  void *v3;
  id v4;
  id v5;
  id location;

  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLNotificationManager noteUserDidLeavePhotosApplication]");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  objc_copyWeak(&v5, &location);
  v4 = v3;
  pl_dispatch_async();

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);

}

- (void)noteUserDidChangeStatusForMomentShare:(id)a3 photoLibrary:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id location;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLNotificationManager noteUserDidChangeStatusForMomentShare:photoLibrary:]");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  objc_copyWeak(&v10, &location);
  v9 = v8;
  pl_dispatch_async();

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

- (void)userViewedNotificationWithAlbumCloudGUID:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a3;
  if (v3)
  {
    +[PLPhotoLibrary cloudSharingPhotoLibrary](PLPhotoLibrary, "cloudSharingPhotoLibrary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __66__PLNotificationManager_userViewedNotificationWithAlbumCloudGUID___block_invoke;
    v6[3] = &unk_1E3677C18;
    v7 = v3;
    v8 = v4;
    v5 = v4;
    objc_msgSend(v5, "performBlock:", v6);

  }
}

- (id)_memoryNotificationFromDictionaryRepresentation:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  PLNotification *v11;

  v3 = *MEMORY[0x1E0D74BC8];
  v4 = a3;
  objc_msgSend(v4, "objectForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D74B58]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D74BE8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D74BE0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D74BA0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D74C10]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[PLNotification initWithInterestingMemoryNotificationWithMemoryUUID:keyAssetUUID:notificationTitle:notificationSubtitle:photoLibraryURLString:]([PLNotification alloc], "initWithInterestingMemoryNotificationWithMemoryUUID:keyAssetUUID:notificationTitle:notificationSubtitle:photoLibraryURLString:", v5, v6, v7, v8, v10);
  -[PLNotification setNotificationDeliveryDate:](v11, "setNotificationDeliveryDate:", v9);

  return v11;
}

- (id)_generateMemoryNotificationRepresentationWithMemoryUUID:(id)a3 keyAssetUUID:(id)a4 notificationTitle:(id)a5 notificationSubtitle:(id)a6 notificationDeliveryDate:(id)a7 pathManager:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v35 = a6;
  v34 = a7;
  v18 = a8;
  if (v15)
  {
    if (v17)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLNotificationManager.m"), 983, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("memoryUUID"));

    if (v17)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLNotificationManager.m"), 984, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("notificationTitle"));

LABEL_3:
  v19 = v17;
  if (!v35)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLNotificationManager.m"), 985, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("notificationSubtitle"));

  }
  v20 = v16;
  v21 = v15;
  if (!v18)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLNotificationManager.m"), 986, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("pathManager"));

  }
  v22 = (void *)MEMORY[0x1E0C99E08];
  v23 = *MEMORY[0x1E0D74BC8];
  v24 = *MEMORY[0x1E0D74BE8];
  v25 = *MEMORY[0x1E0D74BE0];
  objc_msgSend(v18, "libraryURL");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "absoluteString");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "dictionaryWithObjectsAndKeys:", v21, v23, v19, v24, v35, v25, v27, *MEMORY[0x1E0D74C10], 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v28, "setObject:forKeyedSubscript:", v20, *MEMORY[0x1E0D74B58]);
  if (v34)
    objc_msgSend(v28, "setObject:forKey:", v34, *MEMORY[0x1E0D74BA0]);

  return v28;
}

- (void)postNotificationForInterestingMemoryWithMemoryUUID:(id)a3 library:(id)a4 notificationDeliveryDate:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  OS_dispatch_queue *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  id v25;
  id v26;
  id location[2];
  _QWORD v28[4];
  id v29;
  id v30;
  uint64_t *v31;
  __int128 *p_buf;
  uint64_t *v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  char v50;
  __int128 buf;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  PLPhotoSharingGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v9;
    _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_DEFAULT, "[Memories Notification] Notifications: Trying to post notification for memory %@.", (uint8_t *)&buf, 0xCu);
  }

  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLNotificationManager.m"), 1005, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("memoryUUID"));

  }
  if ((PLIsFeaturedContentAllowed() & 1) != 0)
  {
    v47 = 0;
    v48 = &v47;
    v49 = 0x2020000000;
    v50 = 0;
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v52 = 0x3032000000;
    v53 = __Block_byref_object_copy__66790;
    v54 = __Block_byref_object_dispose__66791;
    v55 = 0;
    v41 = 0;
    v42 = &v41;
    v43 = 0x3032000000;
    v44 = __Block_byref_object_copy__66790;
    v45 = __Block_byref_object_dispose__66791;
    v46 = 0;
    v35 = 0;
    v36 = &v35;
    v37 = 0x3032000000;
    v38 = __Block_byref_object_copy__66790;
    v39 = __Block_byref_object_dispose__66791;
    v40 = 0;
    if (!v10)
      goto LABEL_12;
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __109__PLNotificationManager_postNotificationForInterestingMemoryWithMemoryUUID_library_notificationDeliveryDate___block_invoke;
    v28[3] = &unk_1E366FB48;
    v13 = v9;
    v29 = v13;
    v14 = v10;
    v30 = v14;
    v31 = &v47;
    p_buf = &buf;
    v33 = &v41;
    v34 = &v35;
    objc_msgSend(v14, "performBlockAndWait:", v28);

    if (*((_BYTE *)v48 + 24))
    {
      v15 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
      v16 = v42[5];
      v17 = v36[5];
      objc_msgSend(v14, "pathManager");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLNotificationManager _generateMemoryNotificationRepresentationWithMemoryUUID:keyAssetUUID:notificationTitle:notificationSubtitle:notificationDeliveryDate:pathManager:](self, "_generateMemoryNotificationRepresentationWithMemoryUUID:keyAssetUUID:notificationTitle:notificationSubtitle:notificationDeliveryDate:pathManager:", v13, v15, v16, v17, v11, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = self->_isolationQueue;
      objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLNotificationManager postNotificationForInterestingMemoryWithMemoryUUID:library:notificationDeliveryDate:]");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_initWeak(location, self);
      objc_copyWeak(&v26, location);
      v22 = v19;
      v25 = v21;
      pl_dispatch_async();

      objc_destroyWeak(&v26);
      objc_destroyWeak(location);

    }
    else
    {
LABEL_12:
      PLPhotoSharingGetLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        LOWORD(location[0]) = 0;
        _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_ERROR, "[Memories Notification] Notifications: No displayable memory subtitle.", (uint8_t *)location, 2u);
      }
    }

    _Block_object_dispose(&v35, 8);
    _Block_object_dispose(&v41, 8);

    _Block_object_dispose(&buf, 8);
    _Block_object_dispose(&v47, 8);
  }
  else
  {
    PLPhotoSharingGetLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_199541000, v23, OS_LOG_TYPE_DEFAULT, "[Memories Notification] Not posting - featured content is disabled in settings", (uint8_t *)&buf, 2u);
    }

  }
}

- (void)removeNotificationForInterestingMemoryWithUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLNotificationManager removeNotificationForInterestingMemoryWithUUID:]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "copy");
  objc_initWeak(&location, self);
  objc_copyWeak(&v9, &location);
  v7 = v6;
  v8 = v5;
  pl_dispatch_async();

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

- (void)_deleteNotificationsForObjectWithUUID:(id)a3 notificationDictionaryKey:(id)a4 notificationTypes:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  _QWORD v17[6];
  _QWORD v18[4];
  id v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v8 && objc_msgSend(v10, "count"))
  {
    v22 = 0;
    v23 = &v22;
    v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__66790;
    v26 = __Block_byref_object_dispose__66791;
    v27 = 0;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v11, "count"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __107__PLNotificationManager__deleteNotificationsForObjectWithUUID_notificationDictionaryKey_notificationTypes___block_invoke;
    v18[3] = &unk_1E366FB70;
    v19 = v8;
    v21 = &v22;
    v14 = v12;
    v20 = v14;
    objc_msgSend(v11, "enumerateIndexesUsingBlock:", v18);
    if (objc_msgSend(v14, "count"))
    {
      -[PLNotificationManager UNCenter](self, "UNCenter");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "removeNotificationWithRequestIdentifiers:", v14);

    }
    if (v23[5])
    {
      -[PLNotificationManager UNCenter](self, "UNCenter");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = v13;
      v17[1] = 3221225472;
      v17[2] = __107__PLNotificationManager__deleteNotificationsForObjectWithUUID_notificationDictionaryKey_notificationTypes___block_invoke_2;
      v17[3] = &unk_1E366FB98;
      v17[4] = self;
      v17[5] = &v22;
      objc_msgSend(v16, "enumerateExistingNotificationsUsingBlock:", v17);

    }
    _Block_object_dispose(&v22, 8);

  }
}

- (void)_deleteNotificationsForMemoriesWithUUID:(id)a3 notificationTypes:(id)a4
{
  -[PLNotificationManager _deleteNotificationsForObjectWithUUID:notificationDictionaryKey:notificationTypes:](self, "_deleteNotificationsForObjectWithUUID:notificationDictionaryKey:notificationTypes:", a3, *MEMORY[0x1E0D74BC8], a4);
}

- (void)_deleteNotificationsForAlbumWithUUID:(id)a3 notificationTypes:(id)a4
{
  -[PLNotificationManager _deleteNotificationsForObjectWithUUID:notificationDictionaryKey:notificationTypes:](self, "_deleteNotificationsForObjectWithUUID:notificationDictionaryKey:notificationTypes:", a3, *MEMORY[0x1E0D74B30], a4);
}

- (BOOL)_notificationType:(int64_t)a3 matchesCommentsOrLikeNotifications:(BOOL)a4 andPhotosAddedToAlbumNotifications:(BOOL)a5
{
  BOOL v7;

  if (a4 && a5)
    return a3 == 3 || (a3 & 0xFFFFFFFFFFFFFFFELL) == 4;
  v7 = a3 == 3 && a5;
  if (a4)
    return (a3 & 0xFFFFFFFFFFFFFFFELL) == 4;
  else
    return v7;
}

- (void)_deleteNotificationsForAssetWithUUID:(id)a3 shouldDeleteCommentsOrLikeNotifications:(BOOL)a4 shouldDeletePhotosAddedToAlbumNotifications:(BOOL)a5
{
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  BOOL v13;
  BOOL v14;
  id location;

  v8 = a3;
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLNotificationManager _deleteNotificationsForAssetWithUUID:shouldDeleteCommentsOrLikeNotifications:shouldDeletePhotosAddedToAlbumNotifications:]");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    objc_copyWeak(&v12, &location);
    v13 = a4;
    v14 = a5;
    v10 = v8;
    v11 = v9;
    pl_dispatch_async();

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);

  }
}

- (void)postNotificationForExpiringCMMsWithUUIDs:(id)a3 thumbnailImageData:(id)a4 notificationTitle:(id)a5 notificationSubtitle:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  PLNotification *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  PLNotification *v21;
  id v22;
  id v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  PLPhotoSharingGetLog();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v25 = v11;
    v26 = 2112;
    v27 = v13;
    v28 = 2112;
    v29 = v14;
    _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_DEFAULT, "[CMM Notification] Notifications: Trying to post notification for about to expire CMMs %@, title %@, subtitle %@.", buf, 0x20u);
  }

  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLNotificationManager.m"), 1174, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("CMMUUIDs"));

  }
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLNotificationManager.m"), 1175, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("notificationTitle"));

  }
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLNotificationManager.m"), 1176, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("notificationSubtitle"));

  }
  v16 = -[PLNotification initWithExpiringMomentShareUUIDs:thumbnailImageData:notificationTitle:notificationSubtitle:]([PLNotification alloc], "initWithExpiringMomentShareUUIDs:thumbnailImageData:notificationTitle:notificationSubtitle:", v11, v12, v13, v14);
  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLNotificationManager postNotificationForExpiringCMMsWithUUIDs:thumbnailImageData:notificationTitle:notificationSubtitle:]");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak((id *)buf, self);
  objc_copyWeak(&v23, (id *)buf);
  v21 = v16;
  v22 = v17;
  pl_dispatch_async();

  objc_destroyWeak(&v23);
  objc_destroyWeak((id *)buf);

}

- (void)postNotificationForReadyToViewMomentShareWithUUID:(id)a3 photoLibrary:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  PLNotificationManager *v16;
  _QWORD *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD *v21;
  _QWORD v22[5];
  id v23;

  v7 = a3;
  v8 = a4;
  if (!objc_msgSend(v7, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLNotificationManager.m"), 1189, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("momentShareUUID.length"));

    if (v8)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLNotificationManager.m"), 1190, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("photoLibrary"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy__66790;
  v22[4] = __Block_byref_object_dispose__66791;
  v23 = 0;
  v9 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __88__PLNotificationManager_postNotificationForReadyToViewMomentShareWithUUID_photoLibrary___block_invoke;
  v18[3] = &unk_1E3676EA0;
  v19 = v7;
  v10 = v8;
  v20 = v10;
  v21 = v22;
  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __88__PLNotificationManager_postNotificationForReadyToViewMomentShareWithUUID_photoLibrary___block_invoke_2;
  v14[3] = &unk_1E3676EA0;
  v17 = v22;
  v11 = v19;
  v15 = v11;
  v16 = self;
  objc_msgSend(v10, "performBlock:completionHandler:withPriority:", v18, v14, 0);

  _Block_object_dispose(v22, 8);
}

- (void)postNotificationForInterestInUnrenderedCinematicVideoItems
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const __CFDictionary *v11;
  NSObject *v12;
  CFUserNotificationRef v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  CFUserNotificationRef v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t);
  void *v24;
  PLNotificationManager *v25;
  CFUserNotificationRef v26;
  uint8_t buf[16];
  _QWORD v28[6];
  uint8_t v29[8];
  id v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  PLServicesLocalizedFrameworkStringForAssetsd();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PLServicesLocalizedFrameworkStringForAssetsd();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  PLServicesLocalizedFrameworkStringForAssetsd();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0C99E08];
  v8 = *MEMORY[0x1E0C9B830];
  v28[0] = *MEMORY[0x1E0C9B800];
  v28[1] = v8;
  *(_QWORD *)v29 = v6;
  v30 = v5;
  v9 = *MEMORY[0x1E0C9B820];
  v28[2] = *MEMORY[0x1E0C9B868];
  v28[3] = v9;
  v31 = v4;
  v32 = MEMORY[0x1E0C9AAB0];
  v28[4] = CFSTR("DismissOnLock");
  v28[5] = CFSTR("SBUserNotificationDontDismissOnUnlock");
  v33 = MEMORY[0x1E0C9AAB0];
  v34 = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dictionaryWithDictionary:", v10);
  v11 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  PLBackendGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_DEBUG, "Presenting prompt to process unrendered Cinematic videos on behalf of Photos", buf, 2u);
  }

  v13 = CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0.0, 0x20uLL, 0, v11);
  if (v13)
  {
    v14 = MEMORY[0x1E0C809B0];
    v21 = MEMORY[0x1E0C809B0];
    v22 = 3221225472;
    v23 = __83__PLNotificationManager_postNotificationForInterestInUnrenderedCinematicVideoItems__block_invoke;
    v24 = &unk_1E3674C18;
    v25 = self;
    v26 = v13;
    PLRunWithUnfairLock();
    dispatch_get_global_queue(25, 0);
    v15 = objc_claimAutoreleasedReturnValue();
    v17[0] = v14;
    v17[1] = 3221225472;
    v17[2] = __83__PLNotificationManager_postNotificationForInterestInUnrenderedCinematicVideoItems__block_invoke_2;
    v17[3] = &unk_1E3674F30;
    v20 = v13;
    v17[4] = self;
    v18 = v5;
    v19 = v4;
    dispatch_async(v15, v17);

  }
  else
  {
    PLBackendGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v29 = 0;
      _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_ERROR, "Failed to present library picker alert on behalf of Photos", v29, 2u);
    }

  }
}

- (void)removeNotificationForInterestInUnrenderedCinematicVideoItems
{
  PLRunWithUnfairLock();
}

- (void)postNotificationForPhotosChallengeSubmissionWithNotificationDeliveryDate:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLNotificationManager postNotificationForPhotosChallengeSubmissionWithNotificationDeliveryDate:]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  objc_copyWeak(&v8, &location);
  v6 = v4;
  v7 = v5;
  pl_dispatch_async();

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

- (void)_postAsyncNotificationForPhotosChallengeSubmissionWithNotificationDeliveryDate:(id)a3 transaction:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  v9 = -[PLNotification initForPhotosChallengeSubmission]([PLNotification alloc], "initForPhotosChallengeSubmission");
  objc_msgSend(v9, "setNotificationDeliveryDate:", v7);

  -[PLNotificationManager UNCenter](self, "UNCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sendNotificationForNotification:", v9);

  objc_msgSend(v6, "stillAlive");
}

- (void)postNotificationForPhotosChallengeNewQuestionsWithNotificationDeliveryDate:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLNotificationManager postNotificationForPhotosChallengeNewQuestionsWithNotificationDeliveryDate:]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  objc_copyWeak(&v8, &location);
  v6 = v4;
  v7 = v5;
  pl_dispatch_async();

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

- (void)_postAsyncNotificationForPhotosChallengeNewQuestionsWithNotificationDeliveryDate:(id)a3 transaction:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  v9 = -[PLNotification initForPhotosChallengeNewQuestions]([PLNotification alloc], "initForPhotosChallengeNewQuestions");
  objc_msgSend(v9, "setNotificationDeliveryDate:", v7);

  -[PLNotificationManager UNCenter](self, "UNCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sendNotificationForNotification:", v9);

  objc_msgSend(v6, "stillAlive");
}

- (void)postNotificationForSharedLibrarySuggestionsWithNotificationDeliveryDate:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLNotificationManager postNotificationForSharedLibrarySuggestionsWithNotificationDeliveryDate:]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  objc_copyWeak(&v8, &location);
  v6 = v4;
  v7 = v5;
  pl_dispatch_async();

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

- (void)_postAsyncNotificationForSharedLibrarySuggestionsWithNotificationDeliveryDate:(id)a3 transaction:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  v9 = -[PLNotification initForSharedLibrarySuggestions]([PLNotification alloc], "initForSharedLibrarySuggestions");
  objc_msgSend(v9, "setNotificationDeliveryDate:", v7);

  -[PLNotificationManager UNCenter](self, "UNCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sendNotificationForNotification:", v9);

  objc_msgSend(v6, "stillAlive");
}

- (void)postNotificationForAcceptedSharedLibraryWithScopeIdentifier:(id)a3 participantName:(id)a4 library:(id)a5 notificationDeliveryDate:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLNotificationManager postNotificationForAcceptedSharedLibraryWithScopeIdentifier:participantName:library:notificationDeliveryDate:]");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  objc_copyWeak(&v19, &location);
  v15 = v10;
  v16 = v11;
  v17 = v13;
  v18 = v14;
  pl_dispatch_async();

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

}

- (void)_postAsyncNotificationForAcceptedSharedLibraryWithScopeIdentifier:(id)a3 participantName:(id)a4 NotificationDeliveryDate:(id)a5 transaction:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v15 = -[PLNotification initForSharedLibraryScopeAcceptWithLibraryScopeIdentifier:participantName:]([PLNotification alloc], "initForSharedLibraryScopeAcceptWithLibraryScopeIdentifier:participantName:", v13, v12);

  objc_msgSend(v15, "setNotificationDeliveryDate:", v11);
  -[PLNotificationManager UNCenter](self, "UNCenter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sendNotificationForNotification:", v15);

  objc_msgSend(v10, "stillAlive");
}

- (void)postNotificationForSharedLibraryParticipantAssetTrashWithTrashedAssetPhotoCount:(unint64_t)a3 videoCount:(unint64_t)a4 itemCount:(unint64_t)a5 withNotificationDeliveryDate:(id)a6
{
  id v6;
  id v7;
  id v8;
  void *v9;

  v6 = a6;
  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLNotificationManager postNotificationForSharedLibraryParticipantAssetTrashWithTrashedAssetPhotoCount:videoCount:itemCount:withNotificationDeliveryDate:]");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v9;
  v8 = v6;
  pl_dispatch_async();

}

- (void)_postAsyncNotificationForSharedLibraryParticipantAssetTrashWithTrashedAssetPhotoCount:(unint64_t)a3 videoCount:(unint64_t)a4 itemCount:(unint64_t)a5 withNotificationDeliveryDate:(id)a6 transaction:(id)a7
{
  id v12;
  id v13;
  void *v14;
  id v15;

  v12 = a7;
  v13 = a6;
  v15 = -[PLNotification initForSharedLibraryParticipantAssetTrashNotificationWithTrashedPhotoCount:videoCount:itemCount:]([PLNotification alloc], "initForSharedLibraryParticipantAssetTrashNotificationWithTrashedPhotoCount:videoCount:itemCount:", a3, a4, a5);
  objc_msgSend(v15, "setNotificationDeliveryDate:", v13);

  -[PLNotificationManager UNCenter](self, "UNCenter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sendNotificationForNotification:", v15);

  objc_msgSend(v12, "stillAlive");
}

- (void)removeNotificationForSharedLibraryParticipantAssetTrash
{
  void *v3;
  id v4;
  id v5;
  id location;

  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLNotificationManager removeNotificationForSharedLibraryParticipantAssetTrash]");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  objc_copyWeak(&v5, &location);
  v4 = v3;
  pl_dispatch_async();

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);

}

- (void)postNotificationForSharedLibraryExitInitatedByOwnerWithTypeWithExitType:(signed __int16)a3 retentionPolicy:(int64_t)a4 ownerName:(id)a5 notificationDeliveryDate:(id)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16[2];
  signed __int16 v17;
  id location;

  v10 = a5;
  v11 = a6;
  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLNotificationManager postNotificationForSharedLibraryExitInitatedByOwnerWithTypeWithExitType:retentionPolicy:ownerName:notificationDeliveryDate:]");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  objc_copyWeak(v16, &location);
  v17 = a3;
  v16[1] = (id)a4;
  v13 = v10;
  v14 = v11;
  v15 = v12;
  pl_dispatch_async();

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);

}

- (void)_postNotificationForSharedLibraryExitInitatedByOwnerWithTypeWithExitType:(signed __int16)a3 retentionPolicy:(int64_t)a4 ownerName:(id)a5 notificationDeliveryDate:(id)a6 transaction:(id)a7
{
  uint64_t v10;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;

  v10 = a3;
  v16 = a6;
  v12 = a7;
  v13 = a5;
  v14 = -[PLNotification initForSharedLibraryExitInitatedByOwnerWithType:retentionPolicy:ownerName:]([PLNotification alloc], "initForSharedLibraryExitInitatedByOwnerWithType:retentionPolicy:ownerName:", v10, a4, v13);

  if (v14)
  {
    objc_msgSend(v14, "setNotificationDeliveryDate:", v16);
    -[PLNotificationManager UNCenter](self, "UNCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "sendNotificationForNotification:", v14);

  }
  objc_msgSend(v12, "stillAlive");

}

- (unint64_t)_appBadgeCount
{
  unint64_t v3;
  void *v4;
  id v5;
  _QWORD v7[5];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  if ((PLIsLockdownMode() & 1) != 0)
    return 0;
  +[PLPhotoLibrary cloudSharingPhotoLibrary](PLPhotoLibrary, "cloudSharingPhotoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __39__PLNotificationManager__appBadgeCount__block_invoke;
  v7[3] = &unk_1E3676EA0;
  v7[4] = self;
  v5 = v4;
  v8 = v5;
  v9 = &v10;
  objc_msgSend(v5, "performBlockAndWait:", v7);
  v3 = v11[3];

  _Block_object_dispose(&v10, 8);
  return v3;
}

- (void)calculateCurrentBadgeCountWithCompletionHandler:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a3;
  +[PLPhotoLibrary cloudSharingPhotoLibrary](PLPhotoLibrary, "cloudSharingPhotoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __73__PLNotificationManager_calculateCurrentBadgeCountWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E3675C58;
  v8 = v4;
  v9 = v3;
  v5 = v3;
  v6 = v4;
  objc_msgSend(v6, "performBlock:withPriority:", v7, 0);

}

- (id)_addWaitingNotification:(id)a3 forPhotosBatchID:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v16;
  void *v17;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLNotificationManager.m"), 1433, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("notification"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLNotificationManager.m"), 1434, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("photosBatchID"));

LABEL_3:
  -[NSMutableDictionary objectForKey:](self->_waitingAssetsAddNotifications, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "notificationByMergingWithNotification:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
  if (v12)
    v13 = v12;
  else
    v13 = v7;
  v14 = v13;

  -[NSMutableDictionary setObject:forKey:](self->_waitingAssetsAddNotifications, "setObject:forKey:", v14, v9);
  return v14;
}

- (id)_waitingNotificationForPhotosBatchID:(id)a3
{
  id v5;
  void *v6;
  void *v8;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLNotificationManager.m"), 1451, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("photosBatchID"));

  }
  -[NSMutableDictionary objectForKey:](self->_waitingAssetsAddNotifications, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_removeWaitingNotificationForPhotosBatchID:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  v7 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLNotificationManager.m"), 1458, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("photosBatchID"));

    v5 = 0;
  }
  -[NSMutableDictionary removeObjectForKey:](self->_waitingAssetsAddNotifications, "removeObjectForKey:", v5);

}

- (void)triggerNotificationThumbnailUpdateForAsset:(id)a3
{
  id v5;
  unsigned int v6;
  void *v7;
  OS_dispatch_queue *v8;
  void *v9;
  id v10;
  OS_dispatch_queue *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  OS_dispatch_queue *v15;
  id v16;
  id location;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLNotificationManager.m"), 1466, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset"));

  }
  v6 = objc_msgSend(v5, "cloudPlaceholderKind");
  if (v6 <= 8 && ((1 << v6) & 0x1B8) != 0)
  {
    objc_msgSend(v5, "uuid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = self->_isolationQueue;
    objc_initWeak(&location, self);
    -[PLNotificationManager UNCenter](self, "UNCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __68__PLNotificationManager_triggerNotificationThumbnailUpdateForAsset___block_invoke;
    v13[3] = &unk_1E366FCD8;
    v10 = v7;
    v14 = v10;
    v11 = v8;
    v15 = v11;
    objc_copyWeak(&v16, &location);
    objc_msgSend(v9, "enumerateExistingNotificationsUsingBlock:", v13);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);

  }
}

- (void)getThumbnailImageDataAssetUUID:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5)
  {
    +[PLPhotoLibrary cloudSharingPhotoLibrary](PLPhotoLibrary, "cloudSharingPhotoLibrary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __74__PLNotificationManager_getThumbnailImageDataAssetUUID_completionHandler___block_invoke;
    v10[3] = &unk_1E3676290;
    v11 = v8;
    v12 = v5;
    v13 = v7;
    v9 = v8;
    objc_msgSend(v9, "performBlock:withPriority:", v10, 0);

  }
  else if (v6)
  {
    (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
  }

}

- (void)_updateImageDataForNotification:(id)a3
{
  id v4;
  OS_dispatch_queue *v5;
  id v6;
  void *v7;
  OS_dispatch_queue *v8;
  _QWORD v9[4];
  OS_dispatch_queue *v10;
  id v11;
  id v12;
  id location;

  v4 = a3;
  if (v4)
  {
    v5 = self->_isolationQueue;
    v6 = objc_initWeak(&location, self);
    objc_msgSend(v4, "mainAssetUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __57__PLNotificationManager__updateImageDataForNotification___block_invoke;
    v9[3] = &unk_1E366FCB0;
    v8 = v5;
    v10 = v8;
    objc_copyWeak(&v12, &location);
    v11 = v4;
    -[PLNotificationManager getThumbnailImageDataAssetUUID:completionHandler:](self, "getThumbnailImageDataAssetUUID:completionHandler:", v7, v9);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);

  }
}

- (void)discardAllNotifications
{
  NSObject *v3;
  void *v4;
  id v5;
  id v6;
  id buf[2];

  PLPhotoSharingGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEFAULT, "Notifications: Discarding ALL notifications", (uint8_t *)buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLNotificationManager discardAllNotifications]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(buf, self);
  objc_copyWeak(&v6, buf);
  v5 = v4;
  pl_dispatch_async();

  objc_destroyWeak(&v6);
  objc_destroyWeak(buf);

}

- (void)sendResponse:(BOOL)a3 toPhotoStreamInvitationForAlbumWithCloudGUID:(id)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  BOOL v12;

  v5 = a4;
  +[PLPhotoLibrary cloudSharingPhotoLibrary](PLPhotoLibrary, "cloudSharingPhotoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __83__PLNotificationManager_sendResponse_toPhotoStreamInvitationForAlbumWithCloudGUID___block_invoke;
  v9[3] = &unk_1E3675C80;
  v10 = v5;
  v11 = v6;
  v12 = a3;
  v7 = v6;
  v8 = v5;
  objc_msgSend(v7, "performBlock:", v9);

}

- (void)reportAsJunkPhotoStreamInvitationForAlbumWithCloudGUID:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a3;
  +[PLPhotoLibrary cloudSharingPhotoLibrary](PLPhotoLibrary, "cloudSharingPhotoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __80__PLNotificationManager_reportAsJunkPhotoStreamInvitationForAlbumWithCloudGUID___block_invoke;
  v7[3] = &unk_1E3677C18;
  v8 = v3;
  v9 = v4;
  v5 = v4;
  v6 = v3;
  objc_msgSend(v5, "performBlock:", v7);

}

- (id)contactStore
{
  CNContactStore *contactStore;
  CNContactStore *v4;
  CNContactStore *v5;

  contactStore = self->_contactStore;
  if (!contactStore)
  {
    v4 = (CNContactStore *)objc_alloc_init(MEMORY[0x1E0C97298]);
    v5 = self->_contactStore;
    self->_contactStore = v4;

    contactStore = self->_contactStore;
  }
  return contactStore;
}

- (BOOL)_shouldAllowAlertsFromContactWithEmail:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;

  v4 = a3;
  if (-[PLNotificationManager _alertFiltrationEnabled](self, "_alertFiltrationEnabled"))
  {
    if (v4)
    {
      -[PLNotificationManager contactStore](self, "contactStore");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "contactsMatchingEmailAddress:keysToFetch:", v4, MEMORY[0x1E0C9AA60]);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = v6 != 0;
    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (BOOL)_isMyEmailAddress:(id)a3
{
  return 0;
}

- (BOOL)_alertFiltrationEnabled
{
  int alertFiltrationEnabled;
  int AppBooleanValue;
  BOOL v5;
  Boolean keyExistsAndHasValidFormat;

  alertFiltrationEnabled = self->_alertFiltrationEnabled;
  if (alertFiltrationEnabled == -1)
  {
    keyExistsAndHasValidFormat = 0;
    CFPreferencesAppSynchronize(CFSTR("com.apple.mobileslideshow"));
    AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("IncomingMessageAlertFiltration"), CFSTR("com.apple.mobileslideshow"), &keyExistsAndHasValidFormat);
    if (keyExistsAndHasValidFormat)
      v5 = AppBooleanValue == 0;
    else
      v5 = 1;
    alertFiltrationEnabled = !v5;
    self->_alertFiltrationEnabled = alertFiltrationEnabled;
  }
  return alertFiltrationEnabled != 0;
}

- (void)_resetAlertFiltration
{
  pl_dispatch_sync();
}

- (PLNotificationUNCenter)UNCenter
{
  return self->_UNCenter;
}

- (void)setUNCenter:(id)a3
{
  objc_storeStrong((id *)&self->_UNCenter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_UNCenter, 0);
  objc_storeStrong((id *)&self->_waitingAssetsAddNotifications, 0);
  objc_storeStrong((id *)&self->_isolationQueue, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
}

uint64_t __46__PLNotificationManager__resetAlertFiltration__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(result + 32) + 24) = -1;
  return result;
}

void __80__PLNotificationManager_reportAsJunkPhotoStreamInvitationForAlbumWithCloudGUID___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  _QWORD v5[4];
  NSObject *v6;
  uint8_t buf[4];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  +[PLCloudSharedAlbum cloudSharedAlbumWithGUID:inLibrary:](PLCloudSharedAlbum, "cloudSharedAlbumWithGUID:inLibrary:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __80__PLNotificationManager_reportAsJunkPhotoStreamInvitationForAlbumWithCloudGUID___block_invoke_2;
    v5[3] = &unk_1E3674D50;
    v6 = *(id *)(a1 + 32);
    +[PLPhotoSharingHelper markPendingInvitationAsSpamForAlbum:completionHandler:](PLPhotoSharingHelper, "markPendingInvitationAsSpamForAlbum:completionHandler:", v2, v5);
    v3 = v6;
  }
  else
  {
    PLPhotoSharingGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v8 = v4;
      _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_ERROR, "Cannot locate album for cloud GUID: \"%@\", buf, 0xCu);
    }
  }

}

void __80__PLNotificationManager_reportAsJunkPhotoStreamInvitationForAlbumWithCloudGUID___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PLPhotoSharingGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138412546;
    v7 = v5;
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_ERROR, "Failed to report as junk the invitation to album with cloud GUID: \"%@\" error: %@", (uint8_t *)&v6, 0x16u);
  }

}

void __83__PLNotificationManager_sendResponse_toPhotoStreamInvitationForAlbumWithCloudGUID___block_invoke(uint64_t a1)
{
  void *v2;
  _BOOL4 v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  NSObject *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  +[PLCloudSharedAlbum cloudSharedAlbumWithGUID:inLibrary:](PLCloudSharedAlbum, "cloudSharedAlbumWithGUID:inLibrary:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    PLPhotoSharingGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v10 = v5;
      _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_ERROR, "Cannot locate album for cloud GUID: \"%@\", buf, 0xCu);
    }
    goto LABEL_11;
  }
  if (*(_BYTE *)(a1 + 48))
  {
    v8 = 0;
    v3 = +[PLPhotoSharingHelper canAcceptPendingInvitationForAlbum:error:](PLPhotoSharingHelper, "canAcceptPendingInvitationForAlbum:error:", v2, &v8);
    v4 = v8;
    if (v3)
    {
      +[PLPhotoSharingHelper acceptPendingInvitationForAlbum:completionHandler:](PLPhotoSharingHelper, "acceptPendingInvitationForAlbum:completionHandler:", v2, 0);
    }
    else
    {
      PLPhotoSharingGetLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v7 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412546;
        v10 = v7;
        v11 = 2112;
        v12 = v4;
        _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_ERROR, "Cannot accept invitation to album with cloud GUID: \"%@\" error: %@", buf, 0x16u);
      }

    }
LABEL_11:

    goto LABEL_12;
  }
  +[PLPhotoSharingHelper declinePendingInvitationForAlbum:](PLPhotoSharingHelper, "declinePendingInvitationForAlbum:", v2);
LABEL_12:

}

uint64_t __48__PLNotificationManager_discardAllNotifications__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "UNCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllNotifications");

  return objc_msgSend(*(id *)(a1 + 32), "stillAlive");
}

void __57__PLNotificationManager__updateImageDataForNotification___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  uint8_t buf[4];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    objc_copyWeak(&v8, (id *)(a1 + 48));
    v6 = v3;
    v7 = *(id *)(a1 + 40);
    pl_dispatch_async();

    objc_destroyWeak(&v8);
  }
  else
  {
    PLPhotoSharingGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v10 = v5;
      _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_ERROR, "[Notification] notification get no thumbnail data for main asset. (%@)", buf, 0xCu);
    }

  }
}

void __57__PLNotificationManager__updateImageDataForNotification___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "UNCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "requestIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateImageData:forNotificationWithIdentifier:", v3, v4);

}

void __74__PLNotificationManager_getThumbnailImageDataAssetUUID_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  CGImage *v10;
  __CFString *v11;
  CGImageDestination *v12;
  uint64_t v13;
  __CFData *data;
  CFMutableDataRef dataa;

  objc_msgSend(*(id *)(a1 + 32), "assetWithUUID:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D73218], "defaultFormatChooser");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "masterThumbnailFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[PLImageLoadingUtilities newSynchronousImageForAsset:withFormat:allowPlaceholder:outImageProperties:outDeliveredPlaceholder:](PLImageLoadingUtilities, "newSynchronousImageForAsset:withFormat:allowPlaceholder:outImageProperties:outDeliveredPlaceholder:", v2, objc_msgSend(v4, "formatID"), 0, 0, 0);

  if (v5)
  {
    DCIM_sizeFromPLImage();
    if (v6 != v7)
    {
      v8 = PLCreateSquareCroppedImage(v5);

      v5 = (id)v8;
    }
    v9 = DCIM_CGImageRefFromPLImage();
    if (v9)
    {
      v10 = (CGImage *)v9;
      objc_msgSend(MEMORY[0x1E0C99DF0], "data");
      data = (__CFData *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)*MEMORY[0x1E0CEC530], "identifier");
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v12 = CGImageDestinationCreateWithData(data, v11, 1uLL, 0);

      if (v12)
      {
        CGImageDestinationAddImage(v12, v10, 0);
        if (!CGImageDestinationFinalize(v12))
        {

          data = 0;
        }
        CFRelease(v12);
      }
      v9 = (uint64_t)data;
    }
  }
  else
  {
    v9 = 0;
  }
  dataa = (CFMutableDataRef)v9;
  v13 = *(_QWORD *)(a1 + 48);
  if (v13)
    (*(void (**)(uint64_t, CFMutableDataRef))(v13 + 16))(v13, dataa);

}

void __68__PLNotificationManager_triggerNotificationThumbnailUpdateForAsset___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;

  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D74C38]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D74B58]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D74C18]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4 && objc_msgSend(v5, "isEqualToString:", *(_QWORD *)(a1 + 32)))
  {
    objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLNotificationManager triggerNotificationThumbnailUpdateForAsset:]_block_invoke");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_copyWeak(&v12, (id *)(a1 + 48));
    v8 = v5;
    v9 = *(id *)(a1 + 40);
    v10 = v6;
    v11 = v7;
    pl_dispatch_async();

    objc_destroyWeak(&v12);
  }

}

void __68__PLNotificationManager_triggerNotificationThumbnailUpdateForAsset___block_invoke_2(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;

  v2 = (id *)(a1 + 64);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __68__PLNotificationManager_triggerNotificationThumbnailUpdateForAsset___block_invoke_3;
  v5[3] = &unk_1E366FCB0;
  v4 = *(_QWORD *)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  objc_copyWeak(&v8, v2);
  v7 = *(id *)(a1 + 48);
  objc_msgSend(WeakRetained, "getThumbnailImageDataAssetUUID:completionHandler:", v4, v5);

  objc_msgSend(*(id *)(a1 + 56), "stillAlive");
  objc_destroyWeak(&v8);

}

void __68__PLNotificationManager_triggerNotificationThumbnailUpdateForAsset___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;

  v3 = a2;
  if (v3)
  {
    objc_copyWeak(&v6, (id *)(a1 + 48));
    v4 = v3;
    v5 = *(id *)(a1 + 40);
    pl_dispatch_async();

    objc_destroyWeak(&v6);
  }

}

void __68__PLNotificationManager_triggerNotificationThumbnailUpdateForAsset___block_invoke_4(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "UNCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateImageData:forNotificationWithIdentifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __73__PLNotificationManager_calculateCurrentBadgeCountWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "albumListForContentMode:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unreadAlbumsCount");
  PLPhotoSharingGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 134217984;
    v7 = v3;
    _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEFAULT, "Notifications: Calculated current badge count: %ld", (uint8_t *)&v6, 0xCu);
  }

  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, v3);

}

void __39__PLNotificationManager__appBadgeCount__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend((id)objc_opt_class(), "filteredAlbumListForContentMode:library:", 1, *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v2, "unreadAlbumsCount");

}

void __148__PLNotificationManager_postNotificationForSharedLibraryExitInitatedByOwnerWithTypeWithExitType_retentionPolicy_ownerName_notificationDeliveryDate___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "_postNotificationForSharedLibraryExitInitatedByOwnerWithTypeWithExitType:retentionPolicy:ownerName:notificationDeliveryDate:transaction:", *(__int16 *)(a1 + 72), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __80__PLNotificationManager_removeNotificationForSharedLibraryParticipantAssetTrash__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addIndex:", 14);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_deleteNotificationsForObjectWithUUID:notificationDictionaryKey:notificationTypes:", CFSTR("SharedLibraryParticipantAssetTrashNotification"), 0, v3);

  objc_msgSend(*(id *)(a1 + 32), "stillAlive");
}

uint64_t __155__PLNotificationManager_postNotificationForSharedLibraryParticipantAssetTrashWithTrashedAssetPhotoCount_videoCount_itemCount_withNotificationDeliveryDate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_postAsyncNotificationForSharedLibraryParticipantAssetTrashWithTrashedAssetPhotoCount:videoCount:itemCount:withNotificationDeliveryDate:transaction:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __134__PLNotificationManager_postNotificationForAcceptedSharedLibraryWithScopeIdentifier_participantName_library_notificationDeliveryDate___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "_postAsyncNotificationForAcceptedSharedLibraryWithScopeIdentifier:participantName:NotificationDeliveryDate:transaction:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

void __97__PLNotificationManager_postNotificationForSharedLibrarySuggestionsWithNotificationDeliveryDate___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_postAsyncNotificationForSharedLibrarySuggestionsWithNotificationDeliveryDate:transaction:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __100__PLNotificationManager_postNotificationForPhotosChallengeNewQuestionsWithNotificationDeliveryDate___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_postAsyncNotificationForPhotosChallengeNewQuestionsWithNotificationDeliveryDate:transaction:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __98__PLNotificationManager_postNotificationForPhotosChallengeSubmissionWithNotificationDeliveryDate___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_postAsyncNotificationForPhotosChallengeSubmissionWithNotificationDeliveryDate:transaction:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __85__PLNotificationManager_removeNotificationForInterestInUnrenderedCinematicVideoItems__block_invoke(uint64_t a1)
{
  __CFUserNotification *v2;

  v2 = *(__CFUserNotification **)(*(_QWORD *)(a1 + 32) + 48);
  if (v2)
  {
    CFUserNotificationCancel(v2);
    CFRelease(*(CFTypeRef *)(*(_QWORD *)(a1 + 32) + 48));
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) = 0;
  }
}

uint64_t __83__PLNotificationManager_postNotificationForInterestInUnrenderedCinematicVideoItems__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 48) = *(_QWORD *)(result + 40);
  return result;
}

void __83__PLNotificationManager_postNotificationForInterestInUnrenderedCinematicVideoItems__block_invoke_2(uint64_t a1)
{
  CFOptionFlags v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  CFOptionFlags responseFlags;
  uint8_t buf[4];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  responseFlags = 0;
  CFUserNotificationReceiveResponse(*(CFUserNotificationRef *)(a1 + 56), 0.0, &responseFlags);
  v8 = MEMORY[0x1E0C809B0];
  v9 = *(_QWORD *)(a1 + 32);
  PLRunWithUnfairLock();
  v2 = responseFlags & 3;
  PLBackendGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = 48;
    if (v2 == 1)
      v4 = 40;
    v5 = *(_QWORD *)(a1 + v4);
    *(_DWORD *)buf = 138543362;
    v12 = v5;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEBUG, "User selected: %{public}@", buf, 0xCu);
  }

  if (v2 == 1)
  {
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace", v8, 3221225472, __83__PLNotificationManager_postNotificationForInterestInUnrenderedCinematicVideoItems__block_invoke_3, &unk_1E3677AA0, v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("photos://album?name=cinematic&render=1"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "openSensitiveURL:withOptions:", v7, MEMORY[0x1E0C9AA70]);

  }
}

void __83__PLNotificationManager_postNotificationForInterestInUnrenderedCinematicVideoItems__block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  const void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(const void **)(v2 + 48);
  if (v3)
  {
    CFRelease(v3);
    v2 = *(_QWORD *)(a1 + 32);
  }
  *(_QWORD *)(v2 + 48) = 0;
}

void __88__PLNotificationManager_postNotificationForReadyToViewMomentShareWithUUID_photoLibrary___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLShare shareWithUUID:includeTrashed:inManagedObjectContext:](PLMomentShare, "shareWithUUID:includeTrashed:inManagedObjectContext:", v2, 0, v3);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v4 = -[PLNotification initCMMInvitationReadyToViewWithMomentShare:]([PLNotification alloc], "initCMMInvitationReadyToViewWithMomentShare:", v7);
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
}

void __88__PLNotificationManager_postNotificationForReadyToViewMomentShareWithUUID_photoLibrary___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    v2 = *(id *)(*(_QWORD *)(a1 + 40) + 32);
    objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLNotificationManager postNotificationForReadyToViewMomentShareWithUUID:photoLibrary:]_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(location, *(id *)(a1 + 40));
    objc_copyWeak(&v6, location);
    v5 = v3;
    pl_dispatch_async();

    objc_destroyWeak(&v6);
    objc_destroyWeak(location);

  }
  else
  {
    PLPhotoSharingGetLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v4 = *(void **)(a1 + 32);
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v4;
      _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_ERROR, "[CMM Notification] fail to find matching moment share for uuid: \"%@\", (uint8_t *)location, 0xCu);
    }
  }

}

uint64_t __88__PLNotificationManager_postNotificationForReadyToViewMomentShareWithUUID_photoLibrary___block_invoke_2_100(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id WeakRetained;
  void *v5;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  PLPhotoSharingGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v7 = 138412290;
    v8 = v3;
    _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_DEFAULT, "[CMM Notification] Sending \"ready to view\" moment share notification: %@", (uint8_t *)&v7, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "UNCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendNotificationForNotification:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

  return objc_msgSend(*(id *)(a1 + 32), "stillAlive");
}

uint64_t __124__PLNotificationManager_postNotificationForExpiringCMMsWithUUIDs_thumbnailImageData_notificationTitle_notificationSubtitle___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "UNCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sendNotificationForNotification:", *(_QWORD *)(a1 + 32));

  return objc_msgSend(*(id *)(a1 + 40), "stillAlive");
}

void __146__PLNotificationManager__deleteNotificationsForAssetWithUUID_shouldDeleteCommentsOrLikeNotifications_shouldDeletePhotosAddedToAlbumNotifications___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;
  __int16 v8;

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "UNCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __146__PLNotificationManager__deleteNotificationsForAssetWithUUID_shouldDeleteCommentsOrLikeNotifications_shouldDeletePhotosAddedToAlbumNotifications___block_invoke_2;
  v5[3] = &unk_1E366FBC0;
  objc_copyWeak(&v7, v2);
  v8 = *(_WORD *)(a1 + 56);
  v6 = *(id *)(a1 + 32);
  objc_msgSend(v4, "enumerateExistingNotificationsUsingBlock:", v5);

  objc_msgSend(*(id *)(a1 + 40), "stillAlive");
  objc_destroyWeak(&v7);
}

void __146__PLNotificationManager__deleteNotificationsForAssetWithUUID_shouldDeleteCommentsOrLikeNotifications_shouldDeletePhotosAddedToAlbumNotifications___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;
  void *v8;
  id *v9;
  id WeakRetained;
  int v11;
  int v12;
  int v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D74BF0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D74B80]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D74B58]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v11 = objc_msgSend(WeakRetained, "_notificationType:matchesCommentsOrLikeNotifications:andPhotosAddedToAlbumNotifications:", v5, *(unsigned __int8 *)(a1 + 48), *(unsigned __int8 *)(a1 + 49));

  if (*(_BYTE *)(a1 + 48))
    v12 = v11;
  else
    v12 = 1;
  if (v12)
    v13 = v11;
  else
    v13 = v7 | v11;
  if (v13 == 1 && objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", v8))
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D74C18]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = objc_loadWeakRetained(v9);
      objc_msgSend(v15, "UNCenter");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = v14;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "removeNotificationWithRequestIdentifiers:", v17);

    }
  }

}

void __107__PLNotificationManager__deleteNotificationsForObjectWithUUID_notificationDictionaryKey_notificationTypes___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;

  +[PLNotification requestIdentifierByNotificationType:keyObjectUUID:photosBatchID:](PLNotification, "requestIdentifierByNotificationType:keyObjectUUID:photosBatchID:", a2, *(_QWORD *)(a1 + 32), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a2 == 3)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v4);
    v4 = v5;
  }
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
    v4 = v5;
  }

}

void __107__PLNotificationManager__deleteNotificationsForObjectWithUUID_notificationDictionaryKey_notificationTypes___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0D74C18]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hasPrefix:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40)))
  {
    objc_msgSend(*(id *)(a1 + 32), "UNCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeNotificationWithRequestIdentifiers:", v5);

  }
}

void __72__PLNotificationManager_removeNotificationForInterestingMemoryWithUUID___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addIndex:", 6);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_deleteNotificationsForMemoriesWithUUID:notificationTypes:", *(_QWORD *)(a1 + 32), v3);

  objc_msgSend(*(id *)(a1 + 40), "stillAlive");
}

void __109__PLNotificationManager_postNotificationForInterestingMemoryWithMemoryUUID_library_notificationDeliveryDate___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;

  +[PLMemory memoryWithUUID:inPhotoLibrary:](PLMemory, "memoryWithUUID:inPhotoLibrary:", a1[4], a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v2;
  if (v2)
  {
    objc_msgSend(v2, "title");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      v5 = objc_msgSend(v3, "length") != 0;
      goto LABEL_6;
    }
  }
  else
  {
    v4 = 0;
  }
  v5 = 0;
LABEL_6:
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = v5;
  if (*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
  {
    objc_msgSend(v16, "keyAsset");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uuid");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1[7] + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    PLLocalizedImportantMemoryNotificationTitle();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1[8] + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

    objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), &stru_1E36789C0);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(a1[9] + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

  }
}

void __109__PLNotificationManager_postNotificationForInterestingMemoryWithMemoryUUID_library_notificationDeliveryDate___block_invoke_90(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_memoryNotificationFromDictionaryRepresentation:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  PLPhotoSharingGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v4;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEFAULT, "[Memories Notification] Notifications: Created notification for new memory notification: %@.", (uint8_t *)&v10, 0xCu);
  }

  v6 = objc_loadWeakRetained(v2);
  objc_msgSend(v6, "UNCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sendNotificationForNotification:", v4);

  objc_msgSend(v4, "thumbnailImageData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v9 = objc_loadWeakRetained(v2);
    objc_msgSend(v9, "_updateImageDataForNotification:", v4);

  }
  objc_msgSend(*(id *)(a1 + 40), "stillAlive");

}

void __66__PLNotificationManager_userViewedNotificationWithAlbumCloudGUID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  +[PLCloudSharedAlbum cloudSharedAlbumWithGUID:inLibrary:](PLCloudSharedAlbum, "cloudSharedAlbumWithGUID:inLibrary:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    if (objc_msgSend(v2, "hasUnseenContentBoolValue"))
    {
      objc_msgSend(v3, "setHasUnseenContentBoolValue:", 0);
      +[PLPhotoSharingHelper markAlbumGUIDAsViewed:clearUnseenAssetsCount:](PLPhotoSharingHelper, "markAlbumGUIDAsViewed:clearUnseenAssetsCount:", *(_QWORD *)(a1 + 32), 1);
    }
  }
  else
  {
    PLPhotoSharingGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = 138412290;
      v7 = v5;
      _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_ERROR, "Cannot locate album for cloud GUID: \"%@\", (uint8_t *)&v6, 0xCu);
    }

  }
}

uint64_t __76__PLNotificationManager_noteUserDidChangeStatusForMomentShare_photoLibrary___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "UNCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateBadgeCountWithDelay:", 1);

  return objc_msgSend(*(id *)(a1 + 32), "stillAlive");
}

uint64_t __58__PLNotificationManager_noteUserDidLeavePhotosApplication__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "UNCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateBadgeCountWithDelay:", 1);

  return objc_msgSend(*(id *)(a1 + 32), "stillAlive");
}

uint64_t __64__PLNotificationManager_noteUserDidDeleteSharedAssetsWithUUIDs___block_invoke(id *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id WeakRetained;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = a1[4];
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v6);
        WeakRetained = objc_loadWeakRetained(a1 + 6);
        objc_msgSend(WeakRetained, "_deleteNotificationsForAssetWithUUID:shouldDeleteCommentsOrLikeNotifications:shouldDeletePhotosAddedToAlbumNotifications:", v7, 1, 1, (_QWORD)v10);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

  return objc_msgSend(a1[5], "stillAlive");
}

void __62__PLNotificationManager_noteUserDidDeleteSharedAlbumWithUUID___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addIndex:", 0);
  objc_msgSend(v3, "addIndex:", 1);
  objc_msgSend(v3, "addIndex:", 3);
  objc_msgSend(v3, "addIndex:", 4);
  objc_msgSend(v3, "addIndex:", 5);
  objc_msgSend(v3, "addIndex:", 2);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_deleteNotificationsForAlbumWithUUID:notificationTypes:", *(_QWORD *)(a1 + 32), v3);

  objc_msgSend(*(id *)(a1 + 40), "stillAlive");
}

uint64_t __74__PLNotificationManager_noteUserDidReadCommentOnSharedAsset_photoLibrary___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "userReadAllCloudSharedComments");
}

uint64_t __74__PLNotificationManager_noteUserDidReadCommentOnSharedAsset_photoLibrary___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "stillAlive");
}

uint64_t __74__PLNotificationManager_noteUserDidReadCommentOnSharedAsset_photoLibrary___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_deleteNotificationsForAssetWithUUID:shouldDeleteCommentsOrLikeNotifications:shouldDeletePhotosAddedToAlbumNotifications:", *(_QWORD *)(a1 + 32), 1, 0);

  return objc_msgSend(*(id *)(a1 + 40), "stillAlive");
}

void __77__PLNotificationManager_noteUserDidNavigateAwayFromSharedAlbum_photoLibrary___block_invoke(uint64_t a1)
{
  id v2;

  if (*(_BYTE *)(a1 + 40))
    objc_msgSend(*(id *)(a1 + 32), "setHasUnseenContentBoolValue:", 0);
  objc_msgSend(*(id *)(a1 + 32), "cloudGUID");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  +[PLPhotoSharingHelper markAlbumGUIDAsViewed:clearUnseenAssetsCount:](PLPhotoSharingHelper, "markAlbumGUIDAsViewed:clearUnseenAssetsCount:", v2, 1);

}

uint64_t __77__PLNotificationManager_noteUserDidNavigateAwayFromSharedAlbum_photoLibrary___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "stillAlive");
}

void __73__PLNotificationManager_noteUserDidNavigateIntoSharedAlbum_photoLibrary___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "setHasUnseenContentBoolValue:", 0);
  objc_msgSend(*(id *)(a1 + 32), "cloudGUID");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  +[PLPhotoSharingHelper markAlbumGUIDAsViewed:clearUnseenAssetsCount:](PLPhotoSharingHelper, "markAlbumGUIDAsViewed:clearUnseenAssetsCount:", v2, 1);

}

uint64_t __73__PLNotificationManager_noteUserDidNavigateIntoSharedAlbum_photoLibrary___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "stillAlive");
}

void __73__PLNotificationManager_noteUserDidNavigateIntoSharedAlbum_photoLibrary___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addIndex:", 0);
  objc_msgSend(v3, "addIndex:", 1);
  objc_msgSend(v3, "addIndex:", 3);
  objc_msgSend(v3, "addIndex:", 2);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_deleteNotificationsForAlbumWithUUID:notificationTypes:", *(_QWORD *)(a1 + 32), v3);

  objc_msgSend(*(id *)(a1 + 40), "stillAlive");
}

void __70__PLNotificationManager_noteUserDidViewCloudFeedContent_photoLibrary___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v19 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v7, "setHasUnseenContentBoolValue:", 0);
        objc_msgSend(v7, "cloudGUID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLPhotoSharingHelper markAlbumGUIDAsViewed:clearUnseenAssetsCount:](PLPhotoSharingHelper, "markAlbumGUIDAsViewed:clearUnseenAssetsCount:", v8, 1);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v4);
  }

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v9 = *(id *)(a1 + 40);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      for (j = 0; j != v11; ++j)
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * j), "userReadAllCloudSharedComments", (_QWORD)v14);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    }
    while (v11);
  }

}

void __70__PLNotificationManager_noteUserDidViewCloudFeedContent_photoLibrary___block_invoke_2(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(id *);
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;

  objc_msgSend(a1[4], "valueForKey:", CFSTR("uuid"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "valueForKey:", CFSTR("uuid"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count") || objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLNotificationManager noteUserDidViewCloudFeedContent:photoLibrary:]_block_invoke_2");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = MEMORY[0x1E0C809B0];
    v6 = 3221225472;
    v7 = __70__PLNotificationManager_noteUserDidViewCloudFeedContent_photoLibrary___block_invoke_3;
    v8 = &unk_1E366FB20;
    v9 = v2;
    objc_copyWeak(&v12, a1 + 8);
    v10 = v3;
    v11 = v4;
    pl_dispatch_async();

    objc_destroyWeak(&v12);
  }
  objc_msgSend(a1[7], "stillAlive", v5, v6, v7, v8);

}

void __70__PLNotificationManager_noteUserDidViewCloudFeedContent_photoLibrary___block_invoke_3(id *a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id WeakRetained;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addIndex:", 3);
  objc_msgSend(v2, "addIndex:", 4);
  objc_msgSend(v2, "addIndex:", 5);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v3 = a1[4];
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v22;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v22 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v7);
        WeakRetained = objc_loadWeakRetained(a1 + 7);
        objc_msgSend(WeakRetained, "_deleteNotificationsForAlbumWithUUID:notificationTypes:", v8, v2);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v5);
  }

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = a1[5];
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v14);
        v16 = objc_loadWeakRetained(a1 + 7);
        objc_msgSend(v16, "_deleteNotificationsForAssetWithUUID:shouldDeleteCommentsOrLikeNotifications:shouldDeletePhotosAddedToAlbumNotifications:", v15, 1, 1, (_QWORD)v17);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v12);
  }

  objc_msgSend(a1[6], "stillAlive");
}

uint64_t __62__PLNotificationManager_noteUserAssetsAreReadyForMomentShare___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "UNCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sendNotificationForNotification:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

  return objc_msgSend(*(id *)(a1 + 32), "stillAlive");
}

void __78__PLNotificationManager_noteDidReceiveExpiringCMMInvitationsWithMomentShares___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "uuid");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

uint64_t __68__PLNotificationManager_noteDidReceiveCMMInvitationWithMomentShare___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "UNCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateBadgeCountWithDelay:", 1);

  return objc_msgSend(*(id *)(a1 + 32), "stillAlive");
}

uint64_t __70__PLNotificationManager_noteSharedAssetCommentsUnreadStatusDidChange___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_deleteNotificationsForAssetWithUUID:shouldDeleteCommentsOrLikeNotifications:shouldDeletePhotosAddedToAlbumNotifications:", *(_QWORD *)(a1 + 32), 1, 0);

  return objc_msgSend(*(id *)(a1 + 40), "stillAlive");
}

uint64_t __62__PLNotificationManager_noteSharedAlbumUnseenStatusDidChange___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  if (!*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addIndex:", 0);
    objc_msgSend(v2, "addIndex:", 1);
    objc_msgSend(v2, "addIndex:", 3);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "_deleteNotificationsForAlbumWithUUID:notificationTypes:", *(_QWORD *)(a1 + 32), v2);

  }
  return objc_msgSend(*(id *)(a1 + 40), "stillAlive");
}

void __57__PLNotificationManager_noteDidReceiveLike_mstreamdInfo___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  uint64_t v10;
  id v11;

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "UNCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v6 = MEMORY[0x1E0C809B0];
  v7 = 3221225472;
  v8 = __57__PLNotificationManager_noteDidReceiveLike_mstreamdInfo___block_invoke_2;
  v9 = &unk_1E366FA80;
  objc_copyWeak(&v11, v2);
  v10 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v4, "mergeExistingAndSendNotificationForNotification:thumbnailHandler:", v5, &v6);

  objc_msgSend(*(id *)(a1 + 32), "stillAlive", v6, v7, v8, v9);
  objc_destroyWeak(&v11);
}

void __57__PLNotificationManager_noteDidReceiveLike_mstreamdInfo___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_updateImageDataForNotification:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));

}

uint64_t __60__PLNotificationManager_noteDidReceiveComment_mstreamdInfo___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  _QWORD v18[5];
  id v19;
  char v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 56) || !*(_BYTE *)(a1 + 57))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "UNCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "requestIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __60__PLNotificationManager_noteDidReceiveComment_mstreamdInfo___block_invoke_51;
    v18[3] = &unk_1E366FAA8;
    v20 = *(_BYTE *)(a1 + 56);
    v18[4] = *(_QWORD *)(a1 + 40);
    objc_copyWeak(&v19, (id *)(a1 + 48));
    objc_msgSend(v3, "findExistingNotificationByIdentifier:withCompletionHandler:", v4, v18);

    objc_destroyWeak(&v19);
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "photosBatchID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = objc_loadWeakRetained((id *)(a1 + 48));
      objc_msgSend(v6, "_waitingNotificationForPhotosBatchID:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        objc_msgSend(v7, "notificationByMergingWithNotification:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
        v8 = objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          v9 = objc_loadWeakRetained((id *)(a1 + 48));
          objc_msgSend(v9, "_removeWaitingNotificationForPhotosBatchID:", v5);

          v10 = objc_loadWeakRetained((id *)(a1 + 48));
          objc_msgSend(v10, "UNCenter");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "sendNotificationForNotification:", v8);

          -[NSObject thumbnailImageData](v8, "thumbnailImageData");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v12)
          {
            v13 = objc_loadWeakRetained((id *)(a1 + 48));
            objc_msgSend(v13, "_updateImageDataForNotification:", v8);

          }
        }
        else
        {
          PLPhotoSharingGetLog();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            v16 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
            *(_DWORD *)buf = 138412546;
            v22 = v7;
            v23 = 2112;
            v24 = v16;
            _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_DEFAULT, "Notifications: found same batch notification, but failed to merge. (found: %@, new: %@)", buf, 0x16u);
          }

          v8 = 0;
        }
      }
      else
      {
        PLPhotoSharingGetLog();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          v14 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
          *(_DWORD *)buf = 138412290;
          v22 = v14;
          _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_DEFAULT, "Notifications: Caption comment arrived, but no \"Photos added batch\" waiting. (new: %@)", buf, 0xCu);
        }
      }

    }
  }
  return objc_msgSend(*(id *)(a1 + 32), "stillAlive");
}

void __60__PLNotificationManager_noteDidReceiveComment_mstreamdInfo___block_invoke_51(uint64_t a1, char a2)
{
  uint64_t v3;
  void *v4;
  id WeakRetained;
  void *v6;
  uint64_t v7;
  _QWORD v8[5];
  id v9;

  if ((a2 & 1) == 0 && !*(_BYTE *)(a1 + 48))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = 0;

  }
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "UNCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __60__PLNotificationManager_noteDidReceiveComment_mstreamdInfo___block_invoke_2;
    v8[3] = &unk_1E366FA80;
    objc_copyWeak(&v9, (id *)(a1 + 40));
    v8[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v6, "mergeExistingAndSendNotificationForNotification:thumbnailHandler:", v7, v8);

    objc_destroyWeak(&v9);
  }
}

void __60__PLNotificationManager_noteDidReceiveComment_mstreamdInfo___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_updateImageDataForNotification:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));

}

void __74__PLNotificationManager_noteDidReceiveAssets_forSharedAlbum_mstreamdInfo___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "uuid");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __74__PLNotificationManager_noteDidReceiveAssets_forSharedAlbum_mstreamdInfo___block_invoke_46(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "photosBatchID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v4 = WeakRetained;
  if (v2)
  {
    objc_msgSend(WeakRetained, "_addWaitingNotification:forPhotosBatchID:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    dispatch_time(0, 3000000000);
    objc_copyWeak(&v9, (id *)(a1 + 56));
    v7 = v2;
    v8 = v5;
    pl_dispatch_after();

    objc_destroyWeak(&v9);
  }
  else
  {
    objc_msgSend(WeakRetained, "UNCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "mergeExistingAndSendNotificationForNotification:thumbnailHandler:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), 0);

  }
  objc_msgSend(*(id *)(a1 + 40), "stillAlive");

}

void __74__PLNotificationManager_noteDidReceiveAssets_forSharedAlbum_mstreamdInfo___block_invoke_2(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_waitingNotificationForPhotosBatchID:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && v4 == *(void **)(a1 + 40))
  {
    v5 = objc_loadWeakRetained(v2);
    objc_msgSend(v5, "_removeWaitingNotificationForPhotosBatchID:", *(_QWORD *)(a1 + 32));

    v6 = objc_msgSend(v4, "notificationType");
    objc_msgSend(v4, "keyObjectUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLNotification requestIdentifierByNotificationType:keyObjectUUID:photosBatchID:](PLNotification, "requestIdentifierByNotificationType:keyObjectUUID:photosBatchID:", v6, v7, *(_QWORD *)(a1 + 32));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_loadWeakRetained(v2);
    objc_msgSend(v9, "UNCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __74__PLNotificationManager_noteDidReceiveAssets_forSharedAlbum_mstreamdInfo___block_invoke_3;
    v12[3] = &unk_1E366FA30;
    objc_copyWeak(&v15, v2);
    v13 = v4;
    v11 = v8;
    v14 = v11;
    objc_msgSend(v10, "findExistingNotificationByIdentifier:withCompletionHandler:", v11, v12);

    objc_destroyWeak(&v15);
  }

}

void __74__PLNotificationManager_noteDidReceiveAssets_forSharedAlbum_mstreamdInfo___block_invoke_3(uint64_t a1, int a2)
{
  id *v4;
  id WeakRetained;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id *v9;
  id *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v4 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "UNCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 32);
  if (a2)
  {
    v8 = *(_QWORD *)(a1 + 40);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __74__PLNotificationManager_noteDidReceiveAssets_forSharedAlbum_mstreamdInfo___block_invoke_4;
    v14[3] = &unk_1E3677B80;
    v9 = &v16;
    objc_copyWeak(&v16, v4);
    v15 = *(id *)(a1 + 32);
    objc_msgSend(v6, "mergeExistingAndSendNotificationForNotification:requestIdentifier:thumbnailHandler:", v7, v8, v14);
    v10 = &v15;
  }
  else
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __74__PLNotificationManager_noteDidReceiveAssets_forSharedAlbum_mstreamdInfo___block_invoke_5;
    v11[3] = &unk_1E3677B80;
    v9 = &v13;
    objc_copyWeak(&v13, v4);
    v12 = *(id *)(a1 + 32);
    objc_msgSend(v6, "mergeExistingAndSendNotificationForNotification:thumbnailHandler:", v7, v11);
    v10 = &v12;
  }

  objc_destroyWeak(v9);
}

void __74__PLNotificationManager_noteDidReceiveAssets_forSharedAlbum_mstreamdInfo___block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_updateImageDataForNotification:", *(_QWORD *)(a1 + 32));

}

void __74__PLNotificationManager_noteDidReceiveAssets_forSharedAlbum_mstreamdInfo___block_invoke_5(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_updateImageDataForNotification:", *(_QWORD *)(a1 + 32));

}

uint64_t __83__PLNotificationManager_noteMultipleContributorStatusChangedForAlbum_mstreamdInfo___block_invoke(id *a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  int v5;
  NSObject *v6;
  id v7;
  id v8;
  void *v9;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = a1 + 6;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(a1[4], "senderEmailAddress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(WeakRetained, "_shouldAllowAlertsFromContactWithEmail:", v4);

  if (v5)
  {
    PLPhotoSharingGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = a1[4];
      v11 = 138412290;
      v12 = v7;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEFAULT, "Notifications: Created notification for multiple contributor status change: %@.", (uint8_t *)&v11, 0xCu);
    }

    v8 = objc_loadWeakRetained(v2);
    objc_msgSend(v8, "UNCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sendNotificationForNotification:", a1[4]);

  }
  return objc_msgSend(a1[5], "stillAlive");
}

void __83__PLNotificationManager_noteMultipleContributorStatusChangedForAlbum_mstreamdInfo___block_invoke_43(uint64_t a1)
{
  id WeakRetained;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addIndex:", 2);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_deleteNotificationsForAlbumWithUUID:notificationTypes:", *(_QWORD *)(a1 + 32), v3);

  objc_msgSend(*(id *)(a1 + 40), "stillAlive");
}

uint64_t __85__PLNotificationManager_noteInvitationRecordStatusChanged_fromOldState_mstreamdInfo___block_invoke(id *a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  int v5;
  NSObject *v6;
  id v7;
  id v8;
  void *v9;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = a1 + 6;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(a1[4], "senderEmailAddress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(WeakRetained, "_shouldAllowAlertsFromContactWithEmail:", v4);

  if (v5)
  {
    PLPhotoSharingGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = a1[4];
      v11 = 138412290;
      v12 = v7;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEFAULT, "Notifications: Created notification for invitation changed: %@.", (uint8_t *)&v11, 0xCu);
    }

    v8 = objc_loadWeakRetained(v2);
    objc_msgSend(v8, "UNCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sendNotificationForNotification:", a1[4]);

  }
  return objc_msgSend(a1[5], "stillAlive");
}

void __85__PLNotificationManager_noteInvitationRecordStatusChanged_fromOldState_mstreamdInfo___block_invoke_42(uint64_t a1)
{
  id WeakRetained;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addIndex:", 0);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_deleteNotificationsForAlbumWithUUID:notificationTypes:", *(_QWORD *)(a1 + 32), v3);

  objc_msgSend(*(id *)(a1 + 40), "stillAlive");
}

uint64_t __60__PLNotificationManager_noteDidDeleteSharedAssetsWithUUIDs___block_invoke(id *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id WeakRetained;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = a1[4];
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v6);
        WeakRetained = objc_loadWeakRetained(a1 + 6);
        objc_msgSend(WeakRetained, "_deleteNotificationsForAssetWithUUID:shouldDeleteCommentsOrLikeNotifications:shouldDeletePhotosAddedToAlbumNotifications:", v7, 1, 1, (_QWORD)v10);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

  return objc_msgSend(a1[5], "stillAlive");
}

void __50__PLNotificationManager_noteDidDeleteSharedAlbum___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addIndex:", 0);
  objc_msgSend(v3, "addIndex:", 1);
  objc_msgSend(v3, "addIndex:", 3);
  objc_msgSend(v3, "addIndex:", 4);
  objc_msgSend(v3, "addIndex:", 5);
  objc_msgSend(v3, "addIndex:", 2);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_deleteNotificationsForAlbumWithUUID:notificationTypes:", *(_QWORD *)(a1 + 32), v3);

  objc_msgSend(*(id *)(a1 + 40), "stillAlive");
}

uint64_t __64__PLNotificationManager_noteDidReceiveInvitationForSharedAlbum___block_invoke(id *a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  int v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, char);
  void *v13;
  id v14;
  id v15;

  v2 = a1 + 6;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(a1[4], "senderEmailAddress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(WeakRetained, "_shouldAllowAlertsFromContactWithEmail:", v4);

  if (v5)
  {
    v6 = objc_loadWeakRetained(v2);
    objc_msgSend(v6, "UNCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "requestIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __64__PLNotificationManager_noteDidReceiveInvitationForSharedAlbum___block_invoke_2;
    v13 = &unk_1E366F9E0;
    v14 = a1[4];
    objc_copyWeak(&v15, v2);
    objc_msgSend(v7, "findExistingNotificationByIdentifier:withCompletionHandler:", v8, &v10);

    objc_destroyWeak(&v15);
  }
  return objc_msgSend(a1[5], "stillAlive", v10, v11, v12, v13);
}

void __64__PLNotificationManager_noteDidReceiveInvitationForSharedAlbum___block_invoke_2(uint64_t a1, char a2)
{
  NSObject *WeakRetained;
  _BOOL4 v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  PLPhotoSharingGetLog();
  WeakRetained = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT);
  if ((a2 & 1) != 0)
  {
    if (v5)
    {
      v6 = *(_QWORD *)(a1 + 32);
      v9 = 138412290;
      v10 = v6;
      _os_log_impl(&dword_199541000, WeakRetained, OS_LOG_TYPE_DEFAULT, "Notifications: Ignored notification for album invitation: %@.", (uint8_t *)&v9, 0xCu);
    }
  }
  else
  {
    if (v5)
    {
      v7 = *(_QWORD *)(a1 + 32);
      v9 = 138412290;
      v10 = v7;
      _os_log_impl(&dword_199541000, WeakRetained, OS_LOG_TYPE_DEFAULT, "Notifications: Created notification for album invitation: %@.", (uint8_t *)&v9, 0xCu);
    }

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    -[NSObject UNCenter](WeakRetained, "UNCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sendNotificationForNotification:", *(_QWORD *)(a1 + 32));

  }
}

+ (id)sharedManager
{
  pl_dispatch_once();
  return (id)sharedManager___sharedManager;
}

+ (id)_notificationDeliveryDate
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  void *v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  void *v11;
  int v13;
  double v14;
  __int16 v15;
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("PhotosMemoriesNotificationDelayOverride"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "doubleValue");
    v5 = v4;
    if (v4 >= 0.0)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "dateByAddingTimeInterval:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v6 = 0;
    }
    PLPhotoSharingGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 134218242;
      v14 = v5;
      v15 = 2112;
      v16 = CFSTR("PhotosMemoriesNotificationDelayOverride");
      v8 = "Memories Notification: overriding notification delay with time inverval %.2f because of user defaults %@";
      v9 = v7;
      v10 = 22;
      goto LABEL_9;
    }
  }
  else
  {
    +[PLNotificationManager _bestDateForDeliveringNotification](PLNotificationManager, "_bestDateForDeliveringNotification");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PLPhotoSharingGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138412290;
      v14 = *(double *)&v6;
      v8 = "Memories Notification Delivery Date: %@";
      v9 = v7;
      v10 = 12;
LABEL_9:
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v13, v10);
    }
  }

  return v6;
}

+ (id)_bestDateForDeliveringNotification
{
  void *v2;
  id v3;
  id v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  id v36;
  void *v38;
  id obj;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t v49[128];
  uint8_t buf[4];
  id v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v4, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss"));
  v5 = (double)arc4random_uniform(0x708u);
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  obj = (id)PhotosMemoriesBestContentStartTimeHours;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v46;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v46 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
        objc_msgSend(v2, "components:fromDate:", 124, v3);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setHour:", objc_msgSend(v10, "integerValue"));
        objc_msgSend(v11, "setMinute:", 0);
        objc_msgSend(v2, "dateFromComponents:", v11);
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:duration:", v12, 7200.0);
        if (objc_msgSend(v13, "containsDate:", v3))
        {
          v31 = v11;
          objc_msgSend(v3, "dateByAddingTimeInterval:", v5);
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          PLPhotoSharingGetLog();
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v4, "stringFromDate:", v32);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v51 = v34;
            _os_log_impl(&dword_199541000, v33, OS_LOG_TYPE_DEFAULT, "Memory Notification scheduled within best content time with offset: %@ (local time)", buf, 0xCu);

          }
          v3 = v32;

          v29 = v3;
          goto LABEL_28;
        }

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
      if (v7)
        continue;
      break;
    }
  }

  v44 = 0;
  objc_msgSend(a1, "_bestDateForDeliveringNotificationFromCoreDuetWithError:", &v44);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v14 = v44;
  if (v14)
  {
    PLPhotoSharingGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v51 = v14;
      _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_ERROR, "Error while calling +[PLNotificationManager(Private) _bestDateForDeliveringNotificationFromCoreDuetWithError:]: %@", buf, 0xCu);
    }

    v16 = v3;
    obj = v16;
  }
  PLPhotoSharingGetLog();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "stringFromDate:", obj);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v51 = v18;
    _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_DEFAULT, "CoreDuet suggested Memory Notification time: %@ (local time)", buf, 0xCu);

  }
  v36 = v14;
  v38 = v4;

  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v20 = (id)PhotosMemoriesBestContentStartTimeHours;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v41;
    do
    {
      for (j = 0; j != v22; ++j)
      {
        if (*(_QWORD *)v41 != v23)
          objc_enumerationMutation(v20);
        v25 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * j);
        objc_msgSend(v2, "nextDateAfterDate:matchingHour:minute:second:options:", obj, objc_msgSend(v25, "integerValue"), 0, 0, 1024);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "nextDateAfterDate:matchingHour:minute:second:options:", v3, objc_msgSend(v25, "integerValue"), 0, 0, 1024);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "earlierDate:", v26);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v28, "earlierDate:", v27);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
    }
    while (v22);
  }

  objc_msgSend(v19, "dateByAddingTimeInterval:", v5);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  PLPhotoSharingGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  v4 = v38;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v38, "stringFromDate:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v51 = v30;
    _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_DEFAULT, "Memory Notification scheduled at next best content start time: %@ (local time)", buf, 0xCu);

  }
  v31 = v36;
LABEL_28:

  return v29;
}

+ (id)_bestDateForDeliveringNotificationFromCoreDuetWithError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  char v15;
  uint64_t v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  id v22;
  void *v23;
  uint64_t v24;
  void *v25;
  double v26;
  double v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  id v34;
  NSObject *v35;
  id v36;
  void *v37;
  void *v39;
  void *v40;
  uint8_t buf[4];
  id v42;
  __int16 v43;
  double v44;
  uint64_t v45;
  _QWORD v46[2];

  v46[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15A50], "knowledgeStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15AC8], "predictorWithKnowledgeStore:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "launchLikelihoodPredictionForApp:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15AC0], "predictionUnavailable");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 != v8)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "startDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "endDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timeIntervalSinceDate:", v12);
    v14 = v13;

    if (v14 < 0.0)
    {
      v39 = v5;
      v40 = v4;
      v15 = 0;
      v16 = 0;
      v17 = 0.0;
      do
      {
        v18 = v11;
        if (objc_msgSend(v10, "isDateInToday:", v11, v39, v40))
        {
          objc_msgSend(v7, "valueAtDate:", v11);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "doubleValue");
          v21 = v20;

          if (v21 >= v17)
          {
            v22 = v18;

            v15 = 1;
            v9 = v22;
            v17 = v21;
          }
        }
        objc_msgSend(v7, "transitionDates");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v16 + 1;
        objc_msgSend(v23, "objectAtIndexedSubscript:", v16);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "endDate");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "timeIntervalSinceDate:", v25);
        v27 = v26;

        v16 = v24;
      }
      while (v27 < 0.0);
      if ((v15 & 1) != 0)
      {
        PLPhotoSharingGetLog();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "descriptionWithLocale:", v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v42 = v30;
          v43 = 2048;
          v44 = v17;
          _os_log_impl(&dword_199541000, v28, OS_LOG_TYPE_DEFAULT, "Most likely to use device at date %@ with likelihood %2.2f", buf, 0x16u);

        }
        v5 = v39;
        v4 = v40;
LABEL_20:

        v34 = v9;
        v36 = v34;
        goto LABEL_21;
      }
      v5 = v39;
      v4 = v40;
    }
    v37 = v9;
    v9 = v4;

    PLPhotoSharingGetLog();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v28, OS_LOG_TYPE_DEFAULT, "No interesting dates in today returned from -[_DKPredictor launchLikelihoodPredictionForApp:], using default date.", buf, 2u);
    }
    goto LABEL_20;
  }
  v31 = (void *)MEMORY[0x1E0CB35C8];
  v32 = *MEMORY[0x1E0D74498];
  v45 = *MEMORY[0x1E0CB2D50];
  v46[0] = CFSTR("Problem while querying -[_DKPredictor launchLikelihoodPredictionForApp:]: prediction unavailable.");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, &v45, 1);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "errorWithDomain:code:userInfo:", v32, 0, v33);
  v34 = (id)objc_claimAutoreleasedReturnValue();

  if (a3)
    *a3 = objc_retainAutorelease(v34);
  PLPhotoSharingGetLog();
  v35 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v42 = v34;
    _os_log_impl(&dword_199541000, v35, OS_LOG_TYPE_ERROR, "Error: %@, can't predict best time to notify", buf, 0xCu);
  }

  v36 = v4;
LABEL_21:

  return v36;
}

void __38__PLNotificationManager_sharedManager__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  PLNotificationUNCenter *v4;
  uint64_t v5;
  id v6;

  if ((PLIsAssetsd() & 1) != 0 || PLIsInternalTool())
  {
    v2 = -[PLNotificationManager _initSharedInstance]([PLNotificationManager alloc], "_initSharedInstance");
    v3 = (void *)sharedManager___sharedManager;
    sharedManager___sharedManager = (uint64_t)v2;

    v4 = objc_alloc_init(PLNotificationUNCenter);
    objc_msgSend((id)sharedManager___sharedManager, "setUNCenter:", v4);

    v5 = sharedManager___sharedManager;
    objc_msgSend((id)sharedManager___sharedManager, "UNCenter");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDelegate:", v5);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), CFSTR("PLNotificationManager.m"), 148, CFSTR("PLNotificationManager can only run on assetsd."));
  }

}

@end
