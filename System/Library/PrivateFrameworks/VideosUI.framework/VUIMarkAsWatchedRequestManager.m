@implementation VUIMarkAsWatchedRequestManager

+ (id)sharedInstance
{
  if (sharedInstance___onceToken_4 != -1)
    dispatch_once(&sharedInstance___onceToken_4, &__block_literal_global_40);
  return (id)sharedInstance___instance_2;
}

void __48__VUIMarkAsWatchedRequestManager_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VUIMarkAsWatchedRequestManager _init]([VUIMarkAsWatchedRequestManager alloc], "_init");
  v1 = (void *)sharedInstance___instance_2;
  sharedInstance___instance_2 = (uint64_t)v0;

}

- (id)_init
{
  VUIMarkAsWatchedRequestManager *v2;
  uint64_t v3;
  NSMutableDictionary *ongoingItemIDOperationDictionary;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VUIMarkAsWatchedRequestManager;
  v2 = -[VUIMarkAsWatchedRequestManager init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    ongoingItemIDOperationDictionary = v2->_ongoingItemIDOperationDictionary;
    v2->_ongoingItemIDOperationDictionary = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (VUIMarkAsWatchedRequestManager)init
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("Unimplemented"), CFSTR("-[VUIMarkAsWatchedRequestManager init] not supported, use +sharedInstance instead"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (void)sendRequestForItemID:(id)a3 itemType:(id)a4 channelID:(id)a5 adamID:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  _QWORD block[4];
  id v30;
  id from;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[NSMutableDictionary objectForKey:](self->_ongoingItemIDOperationDictionary, "objectForKey:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (!v14 || objc_msgSend(v14, "isCancelled"))
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC87D0]), "initWithItemID:", v10);
    if (v16)
    {
      objc_initWeak(&location, v16);
      objc_initWeak(&from, self);
      +[VUIStreamingBookmarkCache sharedInstance](VUIStreamingBookmarkCache, "sharedInstance");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "removeBookmarkForCanonicalID:", v10);
      v24 = v11;

      v18 = MEMORY[0x1E0C809B0];
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __81__VUIMarkAsWatchedRequestManager_sendRequestForItemID_itemType_channelID_adamID___block_invoke;
      block[3] = &unk_1E9F98DF0;
      v19 = v13;
      v30 = v19;
      dispatch_async(MEMORY[0x1E0C80D38], block);
      objc_msgSend(MEMORY[0x1E0CC23F0], "vui_mediaItemForStoreIdentifierString:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v20;
      if (v20)
        objc_msgSend(v20, "setValue:forProperty:withCompletionBlock:", &unk_1EA0B9388, *MEMORY[0x1E0CC1DB8], 0);
      v25[0] = v18;
      v25[1] = 3221225472;
      v25[2] = __81__VUIMarkAsWatchedRequestManager_sendRequestForItemID_itemType_channelID_adamID___block_invoke_22;
      v25[3] = &unk_1E9F9C168;
      objc_copyWeak(&v27, &location);
      objc_copyWeak(&v28, &from);
      v22 = v10;
      v26 = v22;
      objc_msgSend(v16, "setCompletionBlock:", v25);
      -[NSMutableDictionary setValue:forKey:](self->_ongoingItemIDOperationDictionary, "setValue:forKey:", v16, v22);
      objc_msgSend(MEMORY[0x1E0CB3828], "wlkDefaultQueue");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "addOperation:", v16);

      objc_destroyWeak(&v28);
      objc_destroyWeak(&v27);

      objc_destroyWeak(&from);
      objc_destroyWeak(&location);

      v11 = v24;
    }
  }

}

void __81__VUIMarkAsWatchedRequestManager_sendRequestForItemID_itemType_channelID_adamID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (*(_QWORD *)(a1 + 32))
  {
    +[VUIMediaLibraryManager defaultManager](VUIMediaLibraryManager, "defaultManager");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "sidebandMediaLibrary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "videoForAdamID:useMainThreadContext:", *(_QWORD *)(a1 + 32), 1);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setBookmarkTime:", &unk_1EA0B9388);
      objc_msgSend(v7, "setBookmarkTimeStamp:", v4);
      objc_msgSend(v7, "setMainContentRelativeBookmarkTime:", &unk_1EA0B9388);
      objc_msgSend(v7, "setMainContentRelativeBookmarkTimeStamp:", v4);
      +[VUIMediaLibraryManager defaultManager](VUIMediaLibraryManager, "defaultManager");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "sidebandMediaLibrary");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "saveChangesToManagedObjects");

    }
  }
}

void __81__VUIMarkAsWatchedRequestManager_sendRequestForItemID_itemType_channelID_adamID___block_invoke_22(id *a1)
{
  id WeakRetained;
  id v3;
  _QWORD block[4];
  id v5;
  id v6;
  id v7;

  WeakRetained = objc_loadWeakRetained(a1 + 5);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81__VUIMarkAsWatchedRequestManager_sendRequestForItemID_itemType_channelID_adamID___block_invoke_2;
  block[3] = &unk_1E9F99000;
  objc_copyWeak(&v7, a1 + 6);
  v5 = a1[4];
  v6 = WeakRetained;
  v3 = WeakRetained;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v7);
}

void __81__VUIMarkAsWatchedRequestManager_sendRequestForItemID_itemType_channelID_adamID___block_invoke_2(id *a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  dispatch_time_t v8;
  void *v9;
  id v10;
  _QWORD block[4];
  id v12;

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(WeakRetained, "ongoingItemIDOperationDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObjectForKey:", a1[4]);

  objc_msgSend(a1[5], "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    +[VUIFeaturesConfiguration sharedInstance](VUIFeaturesConfiguration, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "upNextConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "upNextCallDelayAfterMarkAsWatched");

    if (v7 < 1)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "postNotificationName:object:", CFSTR("VUIPlayHistoryUpdatedNotification"), a1[4]);

      objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "vui_postNotificationName:object:userInfo:", CFSTR("com.apple.VideosUI.PlayHistoryUpdatedNotification"), a1[4], 0);

    }
    else
    {
      v8 = dispatch_time(0, 1000000 * v7);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __81__VUIMarkAsWatchedRequestManager_sendRequestForItemID_itemType_channelID_adamID___block_invoke_3;
      block[3] = &unk_1E9F98DF0;
      v12 = a1[4];
      dispatch_after(v8, MEMORY[0x1E0C80D38], block);

    }
  }
}

void __81__VUIMarkAsWatchedRequestManager_sendRequestForItemID_itemType_channelID_adamID___block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("VUIPlayHistoryUpdatedNotification"), *(_QWORD *)(a1 + 32));

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "vui_postNotificationName:object:userInfo:", CFSTR("com.apple.VideosUI.PlayHistoryUpdatedNotification"), *(_QWORD *)(a1 + 32), 0);

}

- (NSMutableDictionary)ongoingItemIDOperationDictionary
{
  return self->_ongoingItemIDOperationDictionary;
}

- (void)setOngoingItemIDOperationDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_ongoingItemIDOperationDictionary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ongoingItemIDOperationDictionary, 0);
}

- (void)sendRequestForItemID:(os_log_t)log itemType:channelID:adamID:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D96EE000, log, OS_LOG_TYPE_ERROR, "VUIMarkAsWatchRequestManager -- caught exception while getting request operation", v1, 2u);
}

@end
