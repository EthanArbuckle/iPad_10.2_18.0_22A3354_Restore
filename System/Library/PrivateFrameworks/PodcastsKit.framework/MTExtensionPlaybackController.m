@implementation MTExtensionPlaybackController

- (MTExtensionPlaybackController)init
{
  MTExtensionPlaybackController *v2;
  void *v3;
  uint64_t v4;
  NSMutableArray *magicMomentCompletionHandlers;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTExtensionPlaybackController;
  v2 = -[MTExtensionPlaybackController init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__playbackQueueChangedNotification_, *MEMORY[0x24BE65A80], 0);

    v4 = objc_opt_new();
    magicMomentCompletionHandlers = v2->_magicMomentCompletionHandlers;
    v2->_magicMomentCompletionHandlers = (NSMutableArray *)v4;

  }
  return v2;
}

+ (void)setQueueWithPlaybackRequestIdentifier:(id)a3 completion:(id)a4
{
  objc_msgSend(a1, "setQueueWithPlaybackRequestIdentifier:startPlayback:assetInfo:requesterSharedUserId:sharedUserIdFromPlayableITunesAccount:completion:", a3, 1, 0, 0, 0, a4);
}

+ (void)setQueueWithPlaybackRequestIdentifier:(id)a3 startPlayback:(BOOL)a4 assetInfo:(id)a5 requesterSharedUserId:(id)a6 sharedUserIdFromPlayableITunesAccount:(id)a7 completion:(id)a8
{
  _BOOL8 v11;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;

  v11 = a4;
  v14 = a8;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __166__MTExtensionPlaybackController_setQueueWithPlaybackRequestIdentifier_startPlayback_assetInfo_requesterSharedUserId_sharedUserIdFromPlayableITunesAccount_completion___block_invoke;
  v16[3] = &unk_24FD62F88;
  v17 = v14;
  v15 = v14;
  objc_msgSend(a1, "setQueueWithPlaybackRequestIdentifier:startPlayback:assetInfo:requesterSharedUserId:sharedUserIdFromPlayableITunesAccount:mrCompletion:", a3, v11, a5, a6, a7, v16);

}

uint64_t __166__MTExtensionPlaybackController_setQueueWithPlaybackRequestIdentifier_startPlayback_assetInfo_requesterSharedUserId_sharedUserIdFromPlayableITunesAccount_completion___block_invoke(uint64_t a1, int a2, int a3)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, (a3 | a2) == 0);
  return result;
}

+ (void)setQueueWithPlaybackRequestIdentifier:(id)a3 mrCompletion:(id)a4
{
  objc_msgSend(a1, "setQueueWithPlaybackRequestIdentifier:assetInfo:requesterSharedUserId:sharedUserIdFromPlayableITunesAccount:mrCompletion:", a3, 0, 0, 0, a4);
}

+ (void)setQueueWithPlaybackRequestIdentifier:(id)a3 assetInfo:(id)a4 requesterSharedUserId:(id)a5 sharedUserIdFromPlayableITunesAccount:(id)a6 mrCompletion:(id)a7
{
  objc_msgSend(a1, "setQueueWithPlaybackRequestIdentifier:startPlayback:assetInfo:requesterSharedUserId:sharedUserIdFromPlayableITunesAccount:mrCompletion:", a3, 1, a4, a5, a6, a7);
}

+ (void)setQueueWithPlaybackRequestIdentifier:(id)a3 startPlayback:(BOOL)a4 assetInfo:(id)a5 requesterSharedUserId:(id)a6 sharedUserIdFromPlayableITunesAccount:(id)a7 mrCompletion:(id)a8
{
  objc_msgSend(a1, "_setPlaybackQueueWithIdentifier:startPlayback:assetInfo:requesterSharedUserId:sharedUserIdFromPlayableITunesAccount:playerID:mrCompletion:", a3, 1, a5, a6, a7, CFSTR("Podcasts"), a8);
}

- (void)populateMagicMomentInfoCenterWithPlaybackRequestIdentifier:(id)a3 mrCompletion:(id)a4
{
  id v6;
  id v7;
  id v8;
  const void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  _QWORD v14[4];
  id v15;
  MTExtensionPlaybackController *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  void *(*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v6 = a3;
  v7 = a4;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__7;
  v22 = __Block_byref_object_dispose__7;
  v23 = _Block_copy(v7);
  -[MTExtensionPlaybackController magicMomentCompletionHandlers](self, "magicMomentCompletionHandlers");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v8);
  v9 = (const void *)v19[5];
  if (v9)
  {
    v10 = _Block_copy(v9);
    objc_msgSend(v8, "addObject:", v10);

  }
  MRMediaRemoteSetWantsNowPlayingNotifications();
  objc_sync_exit(v8);

  v11 = (void *)objc_opt_class();
  v12 = *MEMORY[0x24BE73A00];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __105__MTExtensionPlaybackController_populateMagicMomentInfoCenterWithPlaybackRequestIdentifier_mrCompletion___block_invoke;
  v14[3] = &unk_24FD62FB0;
  v13 = v8;
  v16 = self;
  v17 = &v18;
  v15 = v13;
  objc_msgSend(v11, "_setPlaybackQueueWithIdentifier:startPlayback:assetInfo:requesterSharedUserId:sharedUserIdFromPlayableITunesAccount:playerID:mrCompletion:", v6, 1, 0, 0, 0, v12, v14);

  _Block_object_dispose(&v18, 8);
}

void __105__MTExtensionPlaybackController_populateMagicMomentInfoCenterWithPlaybackRequestIdentifier_mrCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  dispatch_time_t v10;
  _QWORD block[5];

  if (a3 | a2)
  {
    v6 = *(id *)(a1 + 32);
    objc_sync_enter(v6);
    v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    if (v7)
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t, _QWORD))(v7 + 16))(v7, a2, a3, 0);
      v8 = *(void **)(a1 + 32);
      v9 = _Block_copy(*(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
      objc_msgSend(v8, "removeObject:", v9);

    }
    objc_sync_exit(v6);

  }
  v10 = dispatch_time(0, 250000000);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __105__MTExtensionPlaybackController_populateMagicMomentInfoCenterWithPlaybackRequestIdentifier_mrCompletion___block_invoke_2;
  block[3] = &unk_24FD628D0;
  block[4] = *(_QWORD *)(a1 + 40);
  dispatch_after(v10, MEMORY[0x24BDAC9B8], block);
}

void __105__MTExtensionPlaybackController_populateMagicMomentInfoCenterWithPlaybackRequestIdentifier_mrCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(*(id *)(a1 + 32), "magicMomentCompletionHandlers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v2);
  objc_msgSend(*(id *)(a1 + 32), "magicMomentCompletionHandlers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  objc_sync_exit(v2);
  if (v4)
    objc_msgSend(*(id *)(a1 + 32), "_getNowPlayingInfoAndCallPendingCompletions");
}

- (void)_playbackQueueChangedNotification:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE65A68]);

  MRNowPlayingPlayerPathGetPlayer();
  MRNowPlayingPlayerGetIdentifier();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BE73A00]))
    -[MTExtensionPlaybackController _getNowPlayingInfoAndCallPendingCompletions](self, "_getNowPlayingInfoAndCallPendingCompletions");

}

- (void)_getNowPlayingInfoAndCallPendingCompletions
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v2 = (void *)objc_opt_class();
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __76__MTExtensionPlaybackController__getNowPlayingInfoAndCallPendingCompletions__block_invoke;
  v3[3] = &unk_24FD62FD8;
  objc_copyWeak(&v4, &location);
  objc_msgSend(v2, "getNowPlayingInfoForMagicMomentInfoCenterWithCompletion:", v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __76__MTExtensionPlaybackController__getNowPlayingInfoAndCallPendingCompletions__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id WeakRetained;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "magicMomentCompletionHandlers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_enter(v6);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = objc_loadWeakRetained(v4);
  objc_msgSend(v7, "magicMomentCompletionHandlers", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v8);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11++) + 16))();
      }
      while (v9 != v11);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  v12 = objc_loadWeakRetained(v4);
  objc_msgSend(v12, "magicMomentCompletionHandlers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removeAllObjects");

  MRMediaRemoteSetWantsNowPlayingNotifications();
  objc_sync_exit(v6);

}

+ (void)getNowPlayingInfoForMagicMomentInfoCenterWithCompletion:(id)a3
{
  id v3;
  void *v4;
  const void *v5;
  const void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v3 = a3;
  dispatch_get_global_queue(0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MRMediaRemoteGetLocalOrigin();
  v5 = (const void *)MRNowPlayingClientCreate();
  v6 = (const void *)MRNowPlayingPlayerCreate();
  v7 = MRNowPlayingPlayerPathCreate();
  if (v5)
    CFRelease(v5);
  if (v6)
    CFRelease(v6);
  v8 = MRPlaybackQueueRequestCreate();
  MRPlaybackQueueRequestSetIncludeMetadata();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __89__MTExtensionPlaybackController_getNowPlayingInfoForMagicMomentInfoCenterWithCompletion___block_invoke;
  v10[3] = &unk_24FD63000;
  v11 = v3;
  v9 = v3;
  MEMORY[0x2348A9908](v8, v7, v4, v10);

}

void __89__MTExtensionPlaybackController_getNowPlayingInfoForMagicMomentInfoCenterWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  MRPlaybackQueueGetContentItemAtOffset();
  v2 = (void *)MRContentItemCopyNowPlayingInfo();
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    v4 = v2;
    (*(void (**)(void))(v3 + 16))();
    v2 = v4;
  }

}

+ (void)_setPlaybackQueueWithIdentifier:(id)a3 startPlayback:(BOOL)a4 assetInfo:(id)a5 requesterSharedUserId:(id)a6 sharedUserIdFromPlayableITunesAccount:(id)a7 playerID:(id)a8 mrCompletion:(id)a9
{
  _BOOL8 v13;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  const void *v25;
  const void *v26;
  void *v27;
  NSObject *v28;
  id v29;
  id v30;
  id v31;
  uint8_t buf[8];
  uint64_t v33;
  _QWORD v34[2];

  v13 = a4;
  v34[1] = *MEMORY[0x24BDAC8D0];
  v15 = a3;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  if (objc_msgSend(v15, "length"))
  {
    objc_msgSend(a1, "playbackQueueForIdentifier:startPlayback:assetInfo:", v15, v13, v16);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v17)
      objc_msgSend(v21, "setObject:forKey:", v17, CFSTR("requesterUserId"));
    v30 = v17;
    v23 = v16;
    if (v18)
      objc_msgSend(v22, "setObject:forKey:", v18, CFSTR("sharedUserId"));
    MRSystemAppPlaybackQueueSetUserInfo();
    dispatch_get_global_queue(0, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    MRMediaRemoteGetLocalOrigin();
    v25 = (const void *)MRNowPlayingClientCreate();
    v29 = v19;
    v26 = (const void *)MRNowPlayingPlayerCreate();
    MRNowPlayingPlayerPathCreate();
    if (v25)
      CFRelease(v25);
    v16 = v23;
    if (v26)
      CFRelease(v26);
    v33 = *MEMORY[0x24BE658A8];
    v34[0] = &unk_24FD6BEC0;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v20;
    MRMediaRemoteSetAppPlaybackQueueForPlayer();

    v19 = v29;
    v17 = v30;
  }
  else
  {
    _MTLogCategoryPlayback();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22FB0C000, v28, OS_LOG_TYPE_ERROR, "Failed to set playback queue: empty playback request identifier provided", buf, 2u);
    }

    if (v20)
      (*((void (**)(id, uint64_t, uint64_t))v20 + 2))(v20, 2, 7);
  }

}

void __171__MTExtensionPlaybackController__setPlaybackQueueWithIdentifier_startPlayback_assetInfo_requesterSharedUserId_sharedUserIdFromPlayableITunesAccount_playerID_mrCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  NSObject *v5;
  uint64_t v6;
  void *v7;
  unsigned int v8;
  NSObject *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if ((_DWORD)a2)
  {
    _MTLogCategoryPlayback();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v10 = 134217984;
      v11 = a2;
      _os_log_impl(&dword_22FB0C000, v5, OS_LOG_TYPE_ERROR, "Failed to set playback queue: MediaRemote command failed with MRSendCommandError: %ld", (uint8_t *)&v10, 0xCu);
    }

    v6 = *(_QWORD *)(a1 + 32);
    if (v6)
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v6, 2, a2);
  }
  else
  {
    objc_msgSend(a3, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "unsignedIntValue");
    if (v8)
    {
      _MTLogCategoryPlayback();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = 134217984;
        v11 = v8;
        _os_log_impl(&dword_22FB0C000, v9, OS_LOG_TYPE_ERROR, "Failed to set playback queue: MediaRemote command failed with MRMediaRemoteCommandHandlerStatus: %ld", (uint8_t *)&v10, 0xCu);
      }

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

+ (_MRSystemAppPlaybackQueue)playbackQueueForIdentifier:(id)a3 startPlayback:(BOOL)a4 assetInfo:(id)a5
{
  id v6;
  void *v7;
  id v8;
  _MRSystemAppPlaybackQueue *v9;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v6 = a5;
  v11 = a3;
  v7 = (void *)MEMORY[0x24BDBCE30];
  v8 = a3;
  objc_msgSend(v7, "arrayWithObjects:count:", &v11, 1);

  v9 = (_MRSystemAppPlaybackQueue *)MRSystemAppPlaybackQueueCreate();
  MRSystemAppPlaybackQueueSetGenericTrackIdentifiers();
  MRSystemAppPlaybackQueueSetTracklistShuffleMode();
  MRSystemAppPlaybackQueueSetReplaceIntent();
  MRSystemAppPlaybackQueueSetIsRequestingImmediatePlayback();
  if (objc_msgSend(v6, "length", v11, v12))
    MRSystemAppPlaybackQueueSetSiriAssetInfo();

  return v9;
}

- (NSMutableArray)magicMomentCompletionHandlers
{
  return self->_magicMomentCompletionHandlers;
}

- (void)setMagicMomentCompletionHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_magicMomentCompletionHandlers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_magicMomentCompletionHandlers, 0);
}

@end
