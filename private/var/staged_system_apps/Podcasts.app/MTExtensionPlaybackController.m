@implementation MTExtensionPlaybackController

- (MTExtensionPlaybackController)init
{
  MTExtensionPlaybackController *v2;
  void *v3;
  NSMutableArray *v4;
  NSMutableArray *magicMomentCompletionHandlers;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTExtensionPlaybackController;
  v2 = -[MTExtensionPlaybackController init](&v7, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, "_playbackQueueChangedNotification:", kMRPlayerPlaybackQueueChangedNotification, 0);

    v4 = objc_opt_new(NSMutableArray);
    magicMomentCompletionHandlers = v2->_magicMomentCompletionHandlers;
    v2->_magicMomentCompletionHandlers = v4;

  }
  return v2;
}

+ (void)setQueueWithPlaybackRequestIdentifier:(id)a3 completion:(id)a4
{
  _objc_msgSend(a1, "setQueueWithPlaybackRequestIdentifier:startPlayback:assetInfo:requesterSharedUserId:sharedUserIdFromPlayableITunesAccount:completion:", a3, 1, 0, 0, 0, a4);
}

+ (void)setQueueWithPlaybackRequestIdentifier:(id)a3 startPlayback:(BOOL)a4 assetInfo:(id)a5 requesterSharedUserId:(id)a6 sharedUserIdFromPlayableITunesAccount:(id)a7 completion:(id)a8
{
  _BOOL8 v11;
  id v14;
  _QWORD v15[4];
  id v16;

  v11 = a4;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100116AD4;
  v15[3] = &unk_1004ABC68;
  v16 = a8;
  v14 = v16;
  objc_msgSend(a1, "setQueueWithPlaybackRequestIdentifier:startPlayback:assetInfo:requesterSharedUserId:sharedUserIdFromPlayableITunesAccount:mrCompletion:", a3, v11, a5, a6, a7, v15);

}

+ (void)setQueueWithPlaybackRequestIdentifier:(id)a3 mrCompletion:(id)a4
{
  _objc_msgSend(a1, "setQueueWithPlaybackRequestIdentifier:assetInfo:requesterSharedUserId:sharedUserIdFromPlayableITunesAccount:mrCompletion:", a3, 0, 0, 0, a4);
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
  void *v9;
  id v10;
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
  id (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v6 = a3;
  v7 = a4;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = sub_1000468BC;
  v22 = sub_100046AD4;
  v23 = objc_retainBlock(v7);
  v8 = (id)objc_claimAutoreleasedReturnValue(-[MTExtensionPlaybackController magicMomentCompletionHandlers](self, "magicMomentCompletionHandlers"));
  objc_sync_enter(v8);
  v9 = (void *)v19[5];
  if (v9)
  {
    v10 = objc_retainBlock(v9);
    objc_msgSend(v8, "addObject:", v10);

  }
  MRMediaRemoteSetWantsNowPlayingNotifications(1);
  objc_sync_exit(v8);

  v11 = (void *)objc_opt_class(self);
  v12 = kMTPodcastsMagicMomentsPlayerID;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100116CE4;
  v14[3] = &unk_1004ABC90;
  v13 = v8;
  v16 = self;
  v17 = &v18;
  v15 = v13;
  objc_msgSend(v11, "_setPlaybackQueueWithIdentifier:startPlayback:assetInfo:requesterSharedUserId:sharedUserIdFromPlayableITunesAccount:playerID:mrCompletion:", v6, 1, 0, 0, 0, v12, v14);

  _Block_object_dispose(&v18, 8);
}

- (void)_playbackQueueChangedNotification:(id)a3
{
  void *v4;
  void *v5;
  uint64_t Player;
  uint64_t Identifier;
  id v8;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", kMRNowPlayingPlayerPathUserInfoKey));

  Player = MRNowPlayingPlayerPathGetPlayer(v5);
  Identifier = MRNowPlayingPlayerGetIdentifier(Player);
  v8 = (id)objc_claimAutoreleasedReturnValue(Identifier);
  if (objc_msgSend(v8, "isEqualToString:", kMTPodcastsMagicMomentsPlayerID))
    -[MTExtensionPlaybackController _getNowPlayingInfoAndCallPendingCompletions](self, "_getNowPlayingInfoAndCallPendingCompletions");

}

- (void)_getNowPlayingInfoAndCallPendingCompletions
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v3 = (void *)objc_opt_class(self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100116FC8;
  v4[3] = &unk_1004ABCB8;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "getNowPlayingInfoForMagicMomentInfoCenterWithCompletion:", v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

+ (void)getNowPlayingInfoForMagicMomentInfoCenterWithCompletion:(id)a3
{
  id v3;
  dispatch_queue_global_t global_queue;
  void *v5;
  uint64_t LocalOrigin;
  const void *v7;
  const void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v3 = a3;
  global_queue = dispatch_get_global_queue(0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
  LocalOrigin = MRMediaRemoteGetLocalOrigin();
  v7 = (const void *)MRNowPlayingClientCreate(0, kMTApplicationBundleIdentifier);
  v8 = (const void *)MRNowPlayingPlayerCreate(kMTPodcastsMagicMomentsPlayerID, 0);
  v9 = MRNowPlayingPlayerPathCreate(LocalOrigin, v7, v8);
  if (v7)
    CFRelease(v7);
  if (v8)
    CFRelease(v8);
  v10 = MRPlaybackQueueRequestCreate(0, 1);
  MRPlaybackQueueRequestSetIncludeMetadata(v10, 1);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100117298;
  v12[3] = &unk_1004ABCE0;
  v13 = v3;
  v11 = v3;
  MRMediaRemoteRequestNowPlayingPlaybackQueueForPlayerSync(v10, v9, v5, v12);

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
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  dispatch_queue_global_t global_queue;
  void *v27;
  uint64_t LocalOrigin;
  const void *v29;
  const void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  NSObject *v34;
  id v35;
  id v36;
  _QWORD v37[4];
  id v38;
  uint8_t buf[8];
  uint64_t v40;
  _UNKNOWN **v41;

  v13 = a4;
  v15 = a3;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  if (objc_msgSend(v15, "length"))
  {
    v22 = objc_msgSend(a1, "playbackQueueForIdentifier:startPlayback:assetInfo:", v15, v13, v16);
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 2));
    v24 = v23;
    if (v17)
      objc_msgSend(v23, "setObject:forKey:", v17, CFSTR("requesterUserId"));
    v36 = v17;
    v25 = v16;
    if (v18)
      objc_msgSend(v24, "setObject:forKey:", v18, CFSTR("sharedUserId"));
    MRSystemAppPlaybackQueueSetUserInfo(v22, v24);
    global_queue = dispatch_get_global_queue(0, 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
    LocalOrigin = MRMediaRemoteGetLocalOrigin();
    v29 = (const void *)MRNowPlayingClientCreate(0, kMTApplicationBundleIdentifier);
    v35 = v19;
    v30 = (const void *)MRNowPlayingPlayerCreate(v19, 0);
    v31 = MRNowPlayingPlayerPathCreate(LocalOrigin, v29, v30);
    if (v29)
      CFRelease(v29);
    v16 = v25;
    if (v30)
      CFRelease(v30);
    v40 = kMRMediaRemoteOptionAssistantSetQueueTrueCompletion;
    v41 = &off_1004D66B8;
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1));
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_1001175B8;
    v37[3] = &unk_1004ABD08;
    v38 = v20;
    MRMediaRemoteSetAppPlaybackQueueForPlayer(v22, v32, v31, 0, v27, v37);

    v19 = v35;
    v17 = v36;
  }
  else
  {
    v33 = _MTLogCategoryPlayback(0, v21);
    v34 = objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "Failed to set playback queue: empty playback request identifier provided", buf, 2u);
    }

    if (v20)
      (*((void (**)(id, uint64_t, uint64_t))v20 + 2))(v20, 2, 7);
  }

}

+ (_MRSystemAppPlaybackQueue)playbackQueueForIdentifier:(id)a3 startPlayback:(BOOL)a4 assetInfo:(id)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  NSArray *v9;
  _MRSystemAppPlaybackQueue *v10;
  id v12;

  v5 = a4;
  v7 = a5;
  v12 = a3;
  v8 = a3;
  v9 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1);

  v10 = (_MRSystemAppPlaybackQueue *)MRSystemAppPlaybackQueueCreate(kCFAllocatorDefault, 5);
  MRSystemAppPlaybackQueueSetGenericTrackIdentifiers(v10, v9);
  MRSystemAppPlaybackQueueSetTracklistShuffleMode(v10, 1);
  MRSystemAppPlaybackQueueSetReplaceIntent(v10, 2);
  MRSystemAppPlaybackQueueSetIsRequestingImmediatePlayback(v10, v5);
  if (objc_msgSend(v7, "length", v12))
    MRSystemAppPlaybackQueueSetSiriAssetInfo(v10, v7);

  return v10;
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
