@implementation MTPlayerController

- (void)_invokeRestorationCompletions
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[MTPlayerController restorationQueue](self, "restorationQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100013950;
  block[3] = &unk_1004A6200;
  block[4] = self;
  dispatch_async(v3, block);

}

- (double)currentTime
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController player](self, "player"));
  objc_msgSend(v2, "currentTime");
  v4 = v3;

  return v4;
}

- (BOOL)isSeekingOrScrubbing
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController player](self, "player"));
  v3 = objc_msgSend(v2, "scrubbing");

  return v3;
}

- (BOOL)_openExternalItemIfNeededForManifest:(id)a3
{
  void *v4;
  _BOOL4 v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController _currentEpisodeForManifest:](self, "_currentEpisodeForManifest:", a3));
  v5 = -[MTPlayerController _shouldOpenExternalItemForEpisode:](self, "_shouldOpenExternalItemForEpisode:", v4);
  if (v5)
    -[MTPlayerController openExternalEpisode:](self, "openExternalEpisode:", v4);

  return v5;
}

- (void)_setPlaybackQueue:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  MTPlayerController *v7;

  v4 = a3;
  if (objc_msgSend(v4, "playbackDestination") == (id)1
    && !-[MTPlayerController isPlayerTargetLocal](self, "isPlayerTargetLocal"))
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100111D98;
    v5[3] = &unk_1004A8A78;
    v6 = v4;
    v7 = self;
    +[MTRemoteSetPlaybackQueueUtil setRemotePlaybackQueue:completion:](MTRemoteSetPlaybackQueueUtil, "setRemotePlaybackQueue:completion:", v6, v5);

  }
  else
  {
    -[MTPlayerController _setLocalPlaybackQueue:](self, "_setLocalPlaybackQueue:", v4);
  }

}

- (void)setArtworkProvider:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[MTPlayerController playbackQueueController](self, "playbackQueueController"));
  objc_msgSend(v5, "setArtworkProvider:", v4);

}

- (void)playerPeriodicUpdate
{
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = _MTLogCategoryPlayback(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "playerPeriodicUpdate", v5, 2u);
  }

  -[MTPlayerController updateEpisodeForPlayerUpdateForceSave:](self, "updateEpisodeForPlayerUpdateForceSave:", -[MTPlayerController isPlayingLocally](self, "isPlayingLocally") ^ 1);
}

+ (void)setDefaultInstance:(id)a3
{
  id v4;
  id v5;
  id v6;

  v6 = a3;
  objc_storeStrong((id *)&qword_100567560, a3);
  v4 = +[MTHandoffController sharedInstance](MTHandoffController, "sharedInstance");
  v5 = +[MTProcessorManager sharedInstance](MTProcessorManager, "sharedInstance");

}

- (void)playerHeadWillChange:(id)a3
{
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  float v10;
  double v11;
  void *v12;
  void *v13;
  float v14;
  double v15;
  void *v16;
  double v17;
  id v18;

  v18 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "userInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", IMAVPlayerNotificationKey_FromMediaRemote));
  v6 = objc_msgSend(v5, "BOOLValue");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController player](self, "player"));
  LODWORD(v5) = objc_msgSend(v7, "isPlaybackActive");

  if ((_DWORD)v5 && v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "userInfo"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", IMAVPlayerNotificationKey_NewPlayheadTime));
    objc_msgSend(v9, "floatValue");
    v11 = v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "userInfo"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", IMAVPlayerNotificationKey_OldPlayheadTime));
    objc_msgSend(v13, "floatValue");
    v15 = v14;

    -[MTPlayerController recordMTPlayerMetricsForCurrentItemWithCurrentTime:](self, "recordMTPlayerMetricsForCurrentItemWithCurrentTime:", v15);
    -[MTPlayerController setMetricsPlayStartPosition:](self, "setMetricsPlayStartPosition:", v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    objc_msgSend(v16, "timeIntervalSince1970");
    -[MTPlayerController setMetricsPlayStartTime:](self, "setMetricsPlayStartTime:", (uint64_t)(v17 * 1000.0));

  }
}

- (void)currentItemDidChange
{
  void *v3;
  double v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000D6F4;
  v7[3] = &unk_1004A6200;
  v7[4] = self;
  +[IMAVPlayer performOnMainQueue:](IMAVPlayer, "performOnMainQueue:", v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v3, "timeIntervalSince1970");
  -[MTPlayerController setMetricsPlayStartTime:](self, "setMetricsPlayStartTime:", (uint64_t)(v4 * 1000.0));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController player](self, "player"));
  objc_msgSend(v5, "currentTime");
  -[MTPlayerController setMetricsPlayStartPosition:](self, "setMetricsPlayStartPosition:");

  -[MTPlayerController _recordMetricsForItemDidChange](self, "_recordMetricsForItemDidChange");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController currentItem](self, "currentItem"));
  -[MTPlayerController beginObservingTranscriptIdentifierChangesForCurrentItem:](self, "beginObservingTranscriptIdentifierChangesForCurrentItem:", v6);

  -[MTPlayerController setHasReportedThisEpisode:](self, "setHasReportedThisEpisode:", 0);
}

- (void)setManifest:(id)a3 startPlayback:(BOOL)a4 forceLocal:(BOOL)a5 reason:(unint64_t)a6 interactive:(BOOL)a7 completion:(id)a8
{
  _BOOL8 v8;
  _BOOL8 v10;
  _BOOL8 v11;
  id v14;
  id v15;
  id v16;

  v8 = a7;
  v10 = a5;
  v11 = a4;
  v14 = a8;
  v15 = a3;
  v16 = (id)objc_claimAutoreleasedReturnValue(+[MTPlaybackContext contextWithReason:](MTPlaybackContext, "contextWithReason:", a6));
  objc_msgSend(v16, "setInteractive:", v8);
  -[MTPlayerController setManifest:startPlayback:forceLocal:context:completion:](self, "setManifest:startPlayback:forceLocal:context:completion:", v15, v11, v10, v16, v14);

}

- (void)_onQueueRestorePlayerManifestWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  uint8_t buf[4];
  id v19;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController restorationCompletions](self, "restorationCompletions"));
    v6 = objc_msgSend(v4, "copy");
    v7 = objc_retainBlock(v6);
    objc_msgSend(v5, "addObject:", v7);

    v10 = _MTLogCategoryPlayback(v8, v9);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController restorationCompletions](self, "restorationCompletions"));
      *(_DWORD *)buf = 134217984;
      v19 = objc_msgSend(v12, "count");
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Added manifest restoration completion. Count = %lu", buf, 0xCu);

    }
  }
  if (!-[MTPlayerController isManifestRestorationOngoing](self, "isManifestRestorationOngoing"))
  {
    -[MTPlayerController setIsManifestRestorationOngoing:](self, "setIsManifestRestorationOngoing:", 1);
    if (-[MTPlayerController isPlayerManifestRestored](self, "isPlayerManifestRestored"))
    {
      -[MTPlayerController _invokeRestorationCompletions](self, "_invokeRestorationCompletions");
    }
    else
    {
      v14 = objc_msgSend((id)objc_opt_class(self, v13), "_loadActivityForRestoration");
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_100010E98;
      v16[3] = &unk_1004A6640;
      v16[4] = self;
      v17 = (id)objc_claimAutoreleasedReturnValue(v14);
      v15 = v17;
      +[IMAVPlayer performOnMainQueue:](IMAVPlayer, "performOnMainQueue:", v16);

    }
  }

}

- (void)_restoreManifestIfNeededWithCompletion:(id)a3 useEmptyManifest:(BOOL)a4
{
  void (**v6)(_QWORD);
  void *v7;
  void *v8;
  MTItemListManifest *v9;
  _QWORD v10[4];
  void (**v11)(_QWORD);

  v6 = (void (**)(_QWORD))a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController player](self, "player"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "manifest"));

  if (v8)
  {
    if (v6)
      v6[2](v6);
  }
  else
  {
    if (a4
      || (v9 = (MTItemListManifest *)objc_claimAutoreleasedReturnValue(+[MTPlaybackQueueFactory playMyPodcastsWithOrder:](MTPlaybackQueueFactory, "playMyPodcastsWithOrder:", 0))) == 0)
    {
      v9 = -[MTItemListManifest initWithItems:]([MTItemListManifest alloc], "initWithItems:", &__NSArray0__struct);
    }
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100112CB0;
    v10[3] = &unk_1004A7948;
    v11 = v6;
    -[MTPlayerController setManifest:startPlayback:forceLocal:reason:interactive:completion:](self, "setManifest:startPlayback:forceLocal:reason:interactive:completion:", v9, 0, 1, 1, 0, v10);

  }
}

- (void)setPlaybackQueue:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  MTPlayerController *v8;

  v4 = a3;
  if ((objc_msgSend(v4, "validate") & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "manifest"));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100012848;
    v6[3] = &unk_1004A6640;
    v7 = v4;
    v8 = self;
    objc_msgSend(v5, "load:", v6);

  }
  else
  {
    objc_msgSend(v4, "finishWithStatus:", 3);
  }

}

- (BOOL)_shouldOpenExternalItemForEpisode:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v3 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "managedObjectContext"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100048144;
  v7[3] = &unk_1004A6F38;
  v9 = &v10;
  v5 = v3;
  v8 = v5;
  objc_msgSend(v4, "performBlockAndWait:", v7);

  LOBYTE(v4) = *((_BYTE *)v11 + 24);
  _Block_object_dispose(&v10, 8);

  return (char)v4;
}

- (void)setManifest:(id)a3 startPlayback:(BOOL)a4 forceLocal:(BOOL)a5 context:(id)a6 completion:(id)a7
{
  _BOOL4 v9;
  _BOOL4 v10;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;

  v9 = a5;
  v10 = a4;
  v15 = a3;
  v12 = a7;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[MTSetPlaybackQueueRequest requestWithContext:](MTSetPlaybackQueueRequest, "requestWithContext:", a6));
  objc_msgSend(v13, "setManifest:", v15);
  if (v10)
    v14 = objc_msgSend(v15, "isPlaceholder") ^ 1;
  else
    v14 = 0;
  objc_msgSend(v13, "setStartPlayback:", v14);
  objc_msgSend(v13, "setSuppressMetrics:", objc_msgSend(v15, "isPlaceholder"));
  objc_msgSend(v13, "setPlaybackDestination:", !v9);
  objc_msgSend(v13, "setCompletion:", v12);

  -[MTPlayerController setPlaybackQueue:](self, "setPlaybackQueue:", v13);
}

- (void)restorePlayerManifestWithCompletion:(id)a3
{
  id v4;
  dispatch_block_t v5;
  NSObject *v6;
  void **v7;
  uint64_t v8;
  id (*v9)(uint64_t);
  void *v10;
  MTPlayerController *v11;
  id v12;

  v7 = _NSConcreteStackBlock;
  v8 = 3221225472;
  v9 = sub_100048138;
  v10 = &unk_1004A63C8;
  v11 = self;
  v12 = a3;
  v4 = v12;
  v5 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_DEFAULT, 0, &v7);
  v6 = objc_claimAutoreleasedReturnValue(-[MTPlayerController restorationQueue](self, "restorationQueue", v7, v8, v9, v10, v11));
  dispatch_async(v6, v5);

}

- (void)restoreFromUserActivity:(id)a3 startPlayback:(BOOL)a4 reason:(unint64_t)a5 interactive:(BOOL)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19[2];
  BOOL v20;
  BOOL v21;
  id location;

  v12 = a3;
  v13 = a7;
  objc_initWeak(&location, self);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100004E14;
  v16[3] = &unk_1004ABA70;
  objc_copyWeak(v19, &location);
  v14 = v12;
  v20 = a4;
  v17 = v14;
  v19[1] = (id)a5;
  v21 = a6;
  v15 = v13;
  v18 = v15;
  +[MTPlayerManifest restoreActivity:completion:](MTPlayerManifest, "restoreActivity:completion:", v14, v16);

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);

}

- (BOOL)updateEpisode:(id)a3 andPlayerItem:(id)a4 withElapsedTime:(double)a5 andDuration:(double)a6 onMediaItemWillChange:(BOOL)a7
{
  _BOOL4 v7;
  id v11;
  id v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  double v27;
  void *v28;
  unsigned int v29;
  void *v30;
  _BOOL8 v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  id v41;
  uint64_t v42;
  float v43;
  uint64_t v44;
  NSObject *v45;
  uint64_t v46;
  void *v47;
  const __CFString *v48;
  double v49;
  void *v50;
  unsigned int v51;
  double Current;
  double v53;
  double v54;
  void *v55;
  void *v56;
  double v57;
  _BOOL4 v58;
  void *v59;
  id v60;
  void (**platformSyncPlayheadChangeObserverBlock)(id, void *, _BOOL8);
  _QWORD v63[4];
  id v64;
  _QWORD v65[4];
  id v66;
  MTPlayerController *v67;
  uint8_t buf[4];
  const __CFString *v69;
  __int16 v70;
  double v71;
  __int16 v72;
  double v73;

  v7 = a7;
  v11 = a3;
  v12 = a4;
  if ((objc_msgSend(v12, "isPlaceholder") & 1) == 0
    && (!+[MTApplication localLibraryUpdatesDisabled](MTApplication, "localLibraryUpdatesDisabled")
     || +[PFClientUtil isRunningOnHomepod](PFClientUtil, "isRunningOnHomepod")))
  {
    objc_msgSend(v11, "endOfTrack");
    v14 = v13;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[MTAccountController sharedInstance](MTAccountController, "sharedInstance"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "activeAccount"));

    if (v14 > a5 || !v7)
    {
      if ((objc_msgSend(v12, "enqueuedByAnotherUser") & 1) != 0)
      {
        LOBYTE(v31) = 0;
LABEL_47:

        goto LABEL_48;
      }
      v32 = kMTEpisodePlayheadCutoffForPartiallyPlayed;
      if (kMTEpisodePlayheadCutoffForPartiallyPlayed >= a5)
      {
        v31 = 0;
      }
      else
      {
        if ((objc_msgSend(v11, "isUnplayed") & 1) != 0 || objc_msgSend(v11, "backCatalog"))
        {
          v33 = (void *)objc_claimAutoreleasedReturnValue(+[PodcastsStateCoordinator shared](_TtC8Podcasts24PodcastsStateCoordinator, "shared"));
          objc_msgSend(v33, "unsafeEpisodePlayedBeyondThresholdForFirstTime:from:", v11, 3);

          v31 = 1;
          objc_msgSend(v11, "setPlayState:manually:source:", 1, objc_msgSend(v11, "playStateManuallySet"), 9);
          +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
          v35 = v34;
          v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "podcast"));
          objc_msgSend(v36, "lastRemovedFromUpNextDate");
          v38 = v35 - v37;

          if (v38 > v32)
          {
            v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "podcast"));
            objc_msgSend(v39, "setLastRemovedFromUpNextDate:", 0.0);

            v31 = 1;
          }
        }
        else
        {
          v31 = 0;
        }
        if (!v11
          && (+[MTStoreIdentifier isEmpty:](MTStoreIdentifier, "isEmpty:", objc_msgSend(v12, "episodeStoreId")) & 1) == 0&& (+[MTStoreIdentifier isEmpty:](MTStoreIdentifier, "isEmpty:", objc_msgSend(v12, "podcastStoreId")) & 1) == 0&& (+[PFClientUtil isRunningOnHomepod](PFClientUtil, "isRunningOnHomepod") & 1) == 0)
        {
          v40 = (void *)objc_claimAutoreleasedReturnValue(+[PodcastsStateCoordinator shared](_TtC8Podcasts24PodcastsStateCoordinator, "shared"));
          v65[0] = _NSConcreteStackBlock;
          v65[1] = 3221225472;
          v65[2] = sub_100110270;
          v65[3] = &unk_1004AB938;
          v66 = v12;
          v67 = self;
          objc_msgSend(v40, "insertNewImplicitFollowIfNeededForPlayerItem:from:completion:", v66, 3, v65);

        }
      }
      v41 = objc_msgSend(v11, "playhead");
      if (vabdd_f64(a5, v43) > 0.2)
      {
        v44 = _MTLogCategoryPlayback(v41, v42);
        v45 = objc_claimAutoreleasedReturnValue(v44);
        if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
        {
          v46 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "uuid"));
          v47 = (void *)v46;
          v48 = CFSTR("unknown");
          if (v46)
            v48 = (const __CFString *)v46;
          *(_DWORD *)buf = 138412290;
          v69 = v48;
          _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_INFO, "Episode %@: Updating episode playhead and last date played", buf, 0xCu);

        }
        *(float *)&v49 = a5;
        objc_msgSend(v11, "setPlayhead:", v49);
        +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
        objc_msgSend(v11, "setLastDatePlayed:");
      }
      if (+[PFClientUtil isRunningOnHomepod](PFClientUtil, "isRunningOnHomepod"))
      {
        v50 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController compositeManifest](self, "compositeManifest"));
        v51 = objc_msgSend(v50, "networkUPPEnabled");

        if (v51)
        {
          Current = CFAbsoluteTimeGetCurrent();
          -[MTPlayerController lastPlaybackPositionSaveTime](self, "lastPlaybackPositionSaveTime");
          v54 = Current - v53;
          v55 = (void *)objc_claimAutoreleasedReturnValue(+[IMURLBag sharedInstance](IMURLBag, "sharedInstance"));
          v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "syncValueForKey:", kBagKeyUPPSyncInterval));
          objc_msgSend(v56, "doubleValue");
          v58 = v54 <= v57;

          if (!v58 || !~v31)
          {
            v59 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController playbackPositionController](self, "playbackPositionController"));
            v60 = objc_msgSend(v12, "episodeStoreId");
            v63[0] = _NSConcreteStackBlock;
            v63[1] = 3221225472;
            v63[2] = sub_100110524;
            v63[3] = &unk_1004A6AD8;
            v64 = v12;
            objc_msgSend(v59, "updatePlaybackPositionWithEpisodeStoreId:completed:position:account:completion:", v60, 0, v16, v63, a5);

            -[MTPlayerController setLastPlaybackPositionSaveTime:](self, "setLastPlaybackPositionSaveTime:", CFAbsoluteTimeGetCurrent());
          }
        }
      }
      platformSyncPlayheadChangeObserverBlock = (void (**)(id, void *, _BOOL8))self->_platformSyncPlayheadChangeObserverBlock;
      if (!platformSyncPlayheadChangeObserverBlock)
        goto LABEL_47;
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "uuid"));
      platformSyncPlayheadChangeObserverBlock[2](platformSyncPlayheadChangeObserverBlock, v23, v31);
LABEL_46:

      goto LABEL_47;
    }
    v19 = _MTLogCategoryPlayback(v17, v18);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "title"));
      *(_DWORD *)buf = 138412802;
      v69 = v21;
      v70 = 2048;
      v71 = a5;
      v72 = 2048;
      v73 = v14;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Marking episode %@ as played with elapsed time %f and endOfTrack time %f", buf, 0x20u);

    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 1));
    v23 = v22;
    if (v12)
      objc_msgSend(v22, "setObject:forKey:", v12, CFSTR("MTPlayerControllerEpisodeKey"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v24, "postNotificationName:object:userInfo:", CFSTR("MTPlayerControllerNotification_EpisodeMarkedAsPlayed"), self, v23);

    LODWORD(v25) = 0;
    objc_msgSend(v11, "setPlayhead:", v25);
    objc_msgSend(v12, "setPlayhead:", 0.0);
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "contentItem"));
    LODWORD(v27) = 0;
    objc_msgSend(v26, "setElapsedTime:playbackRate:", 0.0, v27);

    if ((objc_msgSend(v12, "enqueuedByAnotherUser") & 1) == 0)
    {
      if (v11
        && (+[PFClientUtil isRunningOnHomepod](PFClientUtil, "isRunningOnHomepod") & 1) == 0)
      {
        objc_msgSend(v11, "setPlayed:manually:source:", 1, 0, 9);
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "podcast"));
        objc_msgSend(v30, "updateCursorPosition:", 0);
      }
      else
      {
        if (!+[PFClientUtil isRunningOnHomepod](PFClientUtil, "isRunningOnHomepod"))
          goto LABEL_27;
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController compositeManifest](self, "compositeManifest"));
        v29 = objc_msgSend(v28, "networkUPPEnabled");

        if (!v29)
          goto LABEL_27;
        v30 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController playbackPositionController](self, "playbackPositionController"));
        objc_msgSend(v30, "updatePlaybackPositionWithEpisodeStoreId:completed:position:account:completion:", objc_msgSend(v12, "episodeStoreId"), 1, v16, &stru_1004AB8E8, 0.0);
      }

    }
LABEL_27:
    LOBYTE(v31) = 1;
    goto LABEL_46;
  }
  LOBYTE(v31) = 0;
LABEL_48:

  return v31;
}

- (id)currentItem
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController player](self, "player"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "currentItem"));

  return v3;
}

- (void)updateEpisodeForPlayerUpdateForceSave:(BOOL)a3
{
  unsigned __int8 v5;
  void *v6;
  unsigned int v7;
  unsigned __int8 v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  MTPlayerController *v26;
  double v27;
  double v28;
  BOOL v29;
  char v30;

  v21 = (id)objc_claimAutoreleasedReturnValue(-[MTPlayerController currentItem](self, "currentItem"));
  v5 = objc_msgSend(v21, "isPlaceholder");
  v6 = v21;
  if ((v5 & 1) == 0)
  {
    v7 = -[MTPlayerController isPlayingLocally](self, "isPlayingLocally");
    v8 = -[MTPlayerController isSeekingOrScrubbing](self, "isSeekingOrScrubbing");
    -[MTPlayerController currentTime](self, "currentTime");
    v10 = v9;
    objc_msgSend(v21, "duration");
    v6 = v21;
    if (v21)
    {
      if ((v8 & 1) == 0)
      {
        v12 = v11;
        if (v7)
        {
          if (!-[MTPlayerController hasReportedThisEpisode](self, "hasReportedThisEpisode"))
          {
            v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "storeReportingParams"));

            if (v13)
            {
              -[MTPlayerController setHasReportedThisEpisode:](self, "setHasReportedThisEpisode:", 1);
              v14 = (void *)objc_claimAutoreleasedReturnValue(+[MTStoreReportingController sharedInstance](MTStoreReportingController, "sharedInstance"));
              v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "storeReportingParams"));
              v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController userManifest](self, "userManifest"));
              objc_msgSend(v14, "reportPlaybackFromStore:reason:", v15, objc_msgSend(v16, "playReason"));

            }
          }
        }
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "episodeUuid"));
        if (objc_msgSend(v17, "length"))
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "mainOrPrivateContext"));

          v22[0] = _NSConcreteStackBlock;
          v22[1] = 3221225472;
          v22[2] = sub_10000F88C;
          v22[3] = &unk_1004AA8F8;
          v29 = a3;
          v23 = v19;
          v24 = v21;
          v30 = v7;
          v25 = v17;
          v26 = self;
          v27 = v10;
          v28 = v12;
          v20 = v19;
          objc_msgSend(v20, "performBlockAndWait:", v22);

        }
        else
        {
          -[MTPlayerController updateEpisode:andPlayerItem:withElapsedTime:andDuration:onMediaItemWillChange:](self, "updateEpisode:andPlayerItem:withElapsedTime:andDuration:onMediaItemWillChange:", 0, v21, 0, v10, v12);
        }

        v6 = v21;
      }
    }
  }

}

- (void)restoreFromUserActivity:(id)a3 withManifest:(id)a4 startPlayback:(BOOL)a5 reason:(unint64_t)a6 interactive:(BOOL)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24[2];
  BOOL v25;
  BOOL v26;
  id location;

  v14 = a3;
  v15 = a4;
  v16 = a8;
  objc_initWeak(&location, self);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10000E714;
  v20[3] = &unk_1004ABB00;
  v17 = v15;
  v21 = v17;
  v18 = v16;
  v23 = v18;
  v24[1] = (id)a6;
  v19 = v14;
  v22 = v19;
  objc_copyWeak(v24, &location);
  v25 = a5;
  v26 = a7;
  +[IMAVPlayer performOnMainQueue:](IMAVPlayer, "performOnMainQueue:", v20);
  objc_destroyWeak(v24);

  objc_destroyWeak(&location);
}

- (void)beginObservingTranscriptIdentifierChangesForCurrentItem:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  MTPropertyChangeQueryObserver *v11;
  MTPropertyChangeQueryObserver *transcriptIdentifierObserver;
  void *v13;
  MTPropertyChangeQueryObserver *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  uint64_t v18;

  v4 = a3;
  -[MTPropertyChangeQueryObserver stop](self->_transcriptIdentifierObserver, "stop");
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "episodeUuid"));
  if (objc_msgSend(v5, "length"))
  {
    v6 = objc_msgSend(v4, "isPlaceholder");

    if ((v6 & 1) == 0)
    {
      v7 = objc_alloc((Class)MTPropertyChangeQueryObserver);
      v8 = kMTEpisodeEntityName;
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "episodeUuid"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForEpisodeUuid:](MTEpisode, "predicateForEpisodeUuid:", v9));
      v11 = (MTPropertyChangeQueryObserver *)objc_msgSend(v7, "initWithEntityName:predicate:", v8, v10);
      transcriptIdentifierObserver = self->_transcriptIdentifierObserver;
      self->_transcriptIdentifierObserver = v11;

      v18 = kEpisodeTranscriptIdentifier;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v18, 1));
      -[MTPropertyChangeQueryObserver setPropertyKeys:](self->_transcriptIdentifierObserver, "setPropertyKeys:", v13);

      v14 = self->_transcriptIdentifierObserver;
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_10000ADC8;
      v16[3] = &unk_1004A8FB0;
      v17 = v4;
      v15 = -[MTPropertyChangeQueryObserver addResultsChangedHandler:](v14, "addResultsChangedHandler:", v16);
      -[MTPropertyChangeQueryObserver startObserving](self->_transcriptIdentifierObserver, "startObserving");

    }
  }
  else
  {

  }
}

- (void)_recordMetricsForItemDidChange
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  MTPlayerController *v13;
  id v14;

  if (+[MTPrivacyUtil allowReporting](MTPrivacyUtil, "allowReporting"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController currentItem](self, "currentItem"));
    v4 = v3;
    if (v3 && (objc_msgSend(v3, "isPlaceholder") & 1) == 0)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController compositeManifest](self, "compositeManifest"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "metricsContentIdentifier"));

      if (v6)
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "privateQueueContext"));

        v10[0] = _NSConcreteStackBlock;
        v10[1] = 3221225472;
        v10[2] = sub_100025424;
        v10[3] = &unk_1004A6C78;
        v11 = v8;
        v12 = v4;
        v13 = self;
        v14 = v6;
        v9 = v8;
        objc_msgSend(v9, "performBlock:", v10);

      }
    }

  }
}

- (MTUpNextController)upNextController
{
  return self->_upNextController;
}

- (id)_currentEpisodeForManifest:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v3 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = sub_10004689C;
  v21 = sub_100046AC4;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentItem"));
  v22 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "episode"));

  if (!v18[5])
  {
    v5 = objc_opt_class(MTBaseEpisodeListManifest);
    if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "initialEpisodeUuid"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mainOrPrivateContext"));

      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100111FBC;
      v13[3] = &unk_1004A6F10;
      v16 = &v17;
      v9 = v8;
      v14 = v9;
      v10 = v6;
      v15 = v10;
      objc_msgSend(v9, "performBlockAndWait:", v13);

    }
  }
  v11 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v11;
}

- (void)_setLocalPlaybackQueue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  MTCompositeManifest *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  unsigned int v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  MTPlayerController *v26;
  id v27[2];
  unsigned __int8 v28;
  id location;
  uint8_t buf[4];
  unsigned int v31;
  __int16 v32;
  id v33;

  v4 = a3;
  kdebug_trace(723518084, 0, 0, 0, 0);
  objc_initWeak(&location, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "manifest"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "context"));
  v7 = objc_msgSend(v4, "startPlayback");
  -[MTPlayerController setUserManifest:](self, "setUserManifest:", v5);
  v8 = -[MTCompositeManifest initWithUpNextManifest:userManifest:loadQueue:]([MTCompositeManifest alloc], "initWithUpNextManifest:userManifest:loadQueue:", self->_upNextManifest, v5, self->_loadQueue);
  -[MTPlayerController setCompositeManifest:](self, "setCompositeManifest:", v8);

  v9 = objc_msgSend(v6, "source");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController compositeManifest](self, "compositeManifest"));
  objc_msgSend(v10, "setPlayReason:", v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController userManifest](self, "userManifest"));
  objc_msgSend(v11, "setPlayReason:", v9);

  v14 = _MTLogCategoryPlayback(v12, v13);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = objc_msgSend(v4, "startPlayback");
    *(_DWORD *)buf = 67109376;
    v31 = v16;
    v32 = 2048;
    v33 = v9;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Performing local SetPlaybackQueue with startPlaying %d reason %lu", buf, 0x12u);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController player](self, "player"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController compositeManifest](self, "compositeManifest"));
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100018494;
  v22[3] = &unk_1004AB9D8;
  v19 = v4;
  v23 = v19;
  v20 = v5;
  v24 = v20;
  v21 = v6;
  v28 = v7;
  v27[1] = v9;
  v25 = v21;
  v26 = self;
  objc_copyWeak(v27, &location);
  objc_msgSend(v17, "setManifest:completion:", v18, v22);

  objc_destroyWeak(v27);
  objc_destroyWeak(&location);

}

- (MTCompositeManifest)compositeManifest
{
  return self->_compositeManifest;
}

- (void)_saveActivityForRestoration
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  _QWORD v12[5];
  id v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController currentActivity](self, "currentActivity"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 5));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "activityType"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("type"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "title"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("title"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userInfo"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("userInfo"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v3, "_suggestedActionType")));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("suggestedActionType"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_options"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("options"));

  v10 = objc_claimAutoreleasedReturnValue(-[MTPlayerController restorationQueue](self, "restorationQueue"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000177FC;
  v12[3] = &unk_1004A6640;
  v12[4] = self;
  v13 = v4;
  v11 = v4;
  dispatch_async(v10, v12);

}

- (MTPlayerController)initWithPlayer:(id)a3
{
  id v4;
  MTPlayerController *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  MTUpNextController *v10;
  MTUpNextManifest *v11;
  MTPlaybackQueueController *v12;
  uint64_t v13;
  MTMediaRemoteController *v14;
  id v15;
  void *v16;
  dispatch_queue_attr_t v17;
  NSObject *v18;
  dispatch_queue_t v19;
  dispatch_queue_t v20;
  dispatch_queue_t v21;
  MTCoreDataKeyRequestStorage *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  PFFairPlayInvalidationManager *v28;
  objc_super v30;

  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)MTPlayerController;
  v5 = -[MTPlayerController init](&v30, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v6, "addObserver:selector:name:object:", v5, "_updateCurrentActivityForPlayState", MTApplicationDidEnterBackgroundNotification, 0);
    objc_msgSend(v6, "addObserver:selector:name:object:", v5, "_updateCurrentActivityForPlayState", MTApplicationDidBecomeActiveNotification, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    -[MTPlayerController setRecordedPlayEventsForCurrentItem:](v5, "setRecordedPlayEventsForCurrentItem:", v7);

    +[IMPlayerManifest registerManifestForRestoration:](IMPlayerManifest, "registerManifestForRestoration:", objc_opt_class(MTEpisodeManifest));
    +[IMPlayerManifest registerManifestForRestoration:](IMPlayerManifest, "registerManifestForRestoration:", objc_opt_class(MTPodcastManifest));
    +[IMPlayerManifest registerManifestForRestoration:](IMPlayerManifest, "registerManifestForRestoration:", objc_opt_class(MTPlaylistManifest));
    +[IMPlayerManifest registerManifestForRestoration:](IMPlayerManifest, "registerManifestForRestoration:", objc_opt_class(MTUnplayedManifest));
    +[IMPlayerManifest registerManifestForRestoration:](IMPlayerManifest, "registerManifestForRestoration:", objc_opt_class(MTStoreManifest));
    +[IMPlayerManifest registerManifestForRestoration:](IMPlayerManifest, "registerManifestForRestoration:", objc_opt_class(MTListenNowManifest));
    +[IMPlayerManifest registerManifestForRestoration:](IMPlayerManifest, "registerManifestForRestoration:", objc_opt_class(MTSwiftEpisodeListManifest));
    +[IMPlayerManifest registerManifestForRestoration:](IMPlayerManifest, "registerManifestForRestoration:", objc_opt_class(MTNetworkMediaManifest));
    if (v4)
    {
      -[MTPlayerController setPlayer:](v5, "setPlayer:", v4);
    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[IMAVPlayer sharedPlayer](IMAVPlayer, "sharedPlayer"));
      -[MTPlayerController setPlayer:](v5, "setPlayer:", v8);

    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController player](v5, "player"));
    objc_msgSend(v9, "setCausalityObserver:", v5);

    v10 = -[MTUpNextController initWithPlayerController:]([MTUpNextController alloc], "initWithPlayerController:", v5);
    -[MTPlayerController setUpNextController:](v5, "setUpNextController:", v10);

    v11 = -[MTUpNextManifest initWithPlayerController:]([MTUpNextManifest alloc], "initWithPlayerController:", v5);
    -[MTPlayerController setUpNextManifest:](v5, "setUpNextManifest:", v11);

    v12 = -[MTPlaybackQueueController initWithPlayerController:]([MTPlaybackQueueController alloc], "initWithPlayerController:", v5);
    -[MTPlayerController setPlaybackQueueController:](v5, "setPlaybackQueueController:", v12);

    if ((os_feature_enabled_bluemoon(v13) & 1) == 0)
    {
      v14 = -[MTMediaRemoteController initWithPlayerController:]([MTMediaRemoteController alloc], "initWithPlayerController:", v5);
      -[MTPlayerController setMediaRemoteController:](v5, "setMediaRemoteController:", v14);

    }
    if (+[PFClientUtil isRunningOnHomepod](PFClientUtil, "isRunningOnHomepod"))
    {
      v15 = objc_alloc_init((Class)MTPlaybackPositionController);
      -[MTPlayerController setPlaybackPositionController:](v5, "setPlaybackPositionController:", v15);

    }
    -[MTPlayerController setLastPlaybackSaveTime:](v5, "setLastPlaybackSaveTime:", CFAbsoluteTimeGetCurrent());
    -[MTPlayerController setupPlayerNotifications](v5, "setupPlayerNotifications");
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    -[MTPlayerController setRestorationCompletions:](v5, "setRestorationCompletions:", v16);

    v17 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    v19 = dispatch_queue_create("MTPlayerController-RestorePlayerManifest", v18);
    -[MTPlayerController setRestorationQueue:](v5, "setRestorationQueue:", v19);

    v20 = dispatch_queue_create("com.apple.podcasts.MTPlayerController.dataAccessQueue", (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent);
    -[MTPlayerController setDataAccessQueue:](v5, "setDataAccessQueue:", v20);

    v21 = dispatch_queue_create("com.apple.podcasts.compositeManifest.loadingQueue", 0);
    -[MTPlayerController setLoadQueue:](v5, "setLoadQueue:", v21);

    -[MTPlayerController setIsManifestRestorationOngoing:](v5, "setIsManifestRestorationOngoing:", 0);
    v22 = objc_opt_new(MTCoreDataKeyRequestStorage);
    -[MTPlayerController setKeyStorage:](v5, "setKeyStorage:", v22);

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[MTLibrary sharedInstance](MTLibrary, "sharedInstance"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "secureDownloadRenewalManager"));
    -[MTPlayerController setSecureDownloadRenewalManager:](v5, "setSecureDownloadRenewalManager:", v24);

    v25 = objc_alloc((Class)PFFairPlayValidationManager);
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[MTLibrary sharedInstance](MTLibrary, "sharedInstance"));
    v27 = objc_msgSend(v25, "initWithEpisodeRemovalManager:", v26);
    -[MTPlayerController setValidationManager:](v5, "setValidationManager:", v27);

    v28 = objc_opt_new(PFFairPlayInvalidationManager);
    -[MTPlayerController setInvalidationManager:](v5, "setInvalidationManager:", v28);

    v5->_shouldFindSomethingToPlay = 1;
  }

  return v5;
}

- (void)currentItemWillChange:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  unsigned __int8 v25;
  void *v26;
  unsigned int v27;
  void *v28;
  void *v29;
  float v30;
  double v31;
  void *v32;
  unsigned int v33;
  void *v34;
  void *v35;
  unsigned __int8 v36;
  unsigned __int8 v37;
  void *v38;
  id v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  NSObject *v43;
  unsigned __int8 v44;
  void *v45;
  _QWORD block[4];
  id v47;
  MTPlayerController *v48;
  unsigned __int8 v49;
  unsigned __int8 v50;
  _QWORD v51[4];
  id v52;
  id v53;
  _QWORD v54[4];
  id v55;
  id v56;
  MTPlayerController *v57;
  uint64_t v58;
  uint64_t v59;
  uint8_t buf[16];

  v4 = a3;
  v6 = _MTLogCategoryPlayback(v4, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "currentItemWillChange", buf, 2u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", IMAVPlayerNotificationKey_OldMediaItem));

  v45 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController userManifest](self, "userManifest"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", IMAVPlayerNotificationKey_NewMediaItem));

  if (v9)
  {
    objc_msgSend(v9, "playhead");
    v13 = v12;
    objc_msgSend(v9, "duration");
    v15 = v14;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "mainQueueContext"));

    v54[0] = _NSConcreteStackBlock;
    v54[1] = 3221225472;
    v54[2] = sub_10010FEA4;
    v54[3] = &unk_1004AB878;
    v55 = v17;
    v18 = v9;
    v56 = v18;
    v57 = self;
    v58 = v13;
    v59 = v15;
    v19 = v17;
    objc_msgSend(v19, "performBlockAndWaitWithSave:", v54);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "privateQueueContext"));

    v51[0] = _NSConcreteStackBlock;
    v51[1] = 3221225472;
    v51[2] = sub_100110050;
    v51[3] = &unk_1004A6640;
    v52 = v21;
    v53 = v18;
    v22 = v21;
    objc_msgSend(v22, "performBlock:", v51);

  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "url"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "url"));
  if (objc_msgSend(v23, "isEqual:", v24))
  {
    v25 = objc_msgSend(v11, "enqueuedByAnotherUser");

    if ((v25 & 1) == 0)
    {
      objc_msgSend(v9, "playhead");
      objc_msgSend(v11, "setPlayhead:");
    }
  }
  else
  {

  }
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController player](self, "player"));
  v27 = objc_msgSend(v26, "isPlaybackRequested");

  if (v27)
  {
    -[MTPlayerController recordMetricsForCurrentItem](self, "recordMetricsForCurrentItem");
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectForKeyedSubscript:", IMAVPlayerNotificationKey_CurrentPlayheadTime));
    objc_msgSend(v29, "floatValue");
    v31 = v30;

    -[MTPlayerController recordMTPlayerMetricsForCurrentItemWithCurrentTime:](self, "recordMTPlayerMetricsForCurrentItemWithCurrentTime:", v31);
  }
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults _applePodcastsFoundationSharedUserDefaults](NSUserDefaults, "_applePodcastsFoundationSharedUserDefaults"));
  v33 = objc_msgSend(v32, "BOOLForKey:", kMTContinuousPlaybackEnabledKey);

  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "objectForKey:", IMAVPlayerNotificationKey_DidSleepAtAssetEnd));
  v36 = objc_msgSend(v35, "BOOLValue");

  v37 = 0;
  if (v33 && (v36 & 1) == 0)
  {
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController player](self, "player"));
    v37 = objc_msgSend(v38, "isPlaybackRequested");

  }
  if (v11)
  {
    v39 = objc_msgSend(v11, "upgradeToAlternatePaidVersionIfNeeded");
    v41 = v45;
    if ((_DWORD)v39)
    {
      v42 = _MTLogCategoryPlayback(v39, v40);
      v43 = objc_claimAutoreleasedReturnValue(v42);
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "We are upgrading the next item going into the player", buf, 2u);
      }

      objc_msgSend(v11, "invalidateAsset");
    }
  }
  else
  {
    v44 = -[MTPlayerController shouldFindSomethingToPlay](self, "shouldFindSomethingToPlay");
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001100BC;
    block[3] = &unk_1004AB8C8;
    v41 = v45;
    v47 = v45;
    v48 = self;
    v49 = v37;
    v50 = v44;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  }
}

- (void)_updateCurrentActivityForPlayState
{
  void *v3;
  unsigned int v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController player](self, "player"));
  v4 = objc_msgSend(v3, "isPlaybackRequested");

  if (v4)
    -[MTPlayerController _currentActivityBecomeCurrent](self, "_currentActivityBecomeCurrent");
}

- (BOOL)isPlayingLocally
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController player](self, "player"));
  v3 = objc_msgSend(v2, "isPlaybackRequested");

  return v3;
}

- (int64_t)_validatePlaybackRequest:(id)a3
{
  void *v4;
  void *v5;
  unsigned int v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  unsigned int v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  unsigned __int8 v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  unsigned int v28;
  int v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  id v44;
  _QWORD v45[6];
  _QWORD v46[4];
  id v47;
  uint64_t *v48;
  __int128 *p_buf;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t v53;
  uint8_t v54[4];
  id v55;
  __int128 buf;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;

  v44 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "manifest"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "context"));
  v6 = objc_msgSend(v5, "isInteractive");

  if (objc_msgSend(v4, "count"))
  {
    v7 = 1;
  }
  else
  {
    v8 = objc_opt_class(MTNetworkMediaManifest);
    if ((objc_opt_isKindOfClass(v4, v8) & 1) != 0)
    {
      if (objc_msgSend(v4, "hasOnlyPaidEpisodesWithoutSubscription"))
        v7 = 9;
      else
        v7 = 3;
    }
    else
    {
      v7 = 3;
    }
  }
  v9 = objc_opt_class(MTStoreManifest);
  if ((objc_opt_isKindOfClass(v4, v9) & 1) != 0)
  {
    if (objc_msgSend(v4, "loadStatus") == (id)2)
      v7 = 4;
  }
  else
  {
    v13 = objc_opt_class(MTNetworkMediaManifest);
    if ((objc_opt_isKindOfClass(v4, v13) & 1) == 0)
      goto LABEL_21;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentItem"));
    if (objc_msgSend(v14, "isExplicit"))
    {
      v15 = +[PFRestrictionsUtil isExplicitContentAllowed](PFRestrictionsUtil, "isExplicitContentAllowed");

      if (!v15)
        v7 = 4;
    }
    else
    {

    }
  }
  if (v7 == 4)
    v10 = v6;
  else
    v10 = 0;
  if (v10 == 1)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController player](self, "player"));
    objc_msgSend((id)objc_opt_class(v11), "performOnMainQueue:", &stru_1004AB9F8);

    v12 = 1;
    v7 = 4;
    goto LABEL_22;
  }
LABEL_21:
  v12 = 0;
LABEL_22:
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController _currentEpisodeForManifest:](self, "_currentEpisodeForManifest:", v4));
  if (v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentItem"));
    if (v17)
    {

    }
    else if ((objc_msgSend(v16, "isExternalType") & 1) == 0)
    {
      v18 = objc_msgSend(v16, "isRestricted");
      if ((v18 & 1) != 0)
      {
        v7 = 4;
      }
      else
      {
        v20 = _MTLogCategoryPlayback(v18, v19);
        v21 = objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf) = 134217984;
          *(_QWORD *)((char *)&buf + 4) = objc_msgSend(v16, "reasonForNotPlayable");
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Playback request failed with status notPlayable, MTEpisodeUnavailableReason %lu", (uint8_t *)&buf, 0xCu);
        }

        v7 = 5;
      }
    }
  }
  v50 = 0;
  v51 = &v50;
  v52 = 0x2020000000;
  v53 = 0;
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v57 = 0x3032000000;
  v58 = sub_10004689C;
  v59 = sub_100046AC4;
  v60 = 0;
  if (v16
    || (v22 = (void *)objc_claimAutoreleasedReturnValue(+[MTReachability sharedInstance](MTReachability, "sharedInstance")),
        v23 = objc_msgSend(v22, "isReachable"),
        v22,
        (v23 & 1) != 0))
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "managedObjectContext"));
    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472;
    v46[2] = sub_100112038;
    v46[3] = &unk_1004A70C8;
    v48 = &v50;
    v47 = v16;
    p_buf = &buf;
    objc_msgSend(v24, "performBlockAndWait:", v46);

    v25 = v51[3];
    if (!v25)
    {
      if (v7 == 1)
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndex:", 0));
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "priceType"));
        if (MTEpisodePriceTypeFromPersistentString() == 2)
        {
          v28 = objc_msgSend(v26, "paidSubscriptionActive");

          if (v28)
            v7 = 1;
          else
            v7 = 9;
        }
        else
        {

          v7 = 1;
        }

      }
      goto LABEL_57;
    }
  }
  else
  {
    v25 = 2;
    v51[3] = 2;
  }
  if (v25 == 1)
    v29 = v12;
  else
    v29 = 0;
  if (((v29 | v6 ^ 1) & 1) == 0)
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController player](self, "player"));
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472;
    v45[2] = sub_1001120A0;
    v45[3] = &unk_1004ABA20;
    v45[4] = &v50;
    v45[5] = &buf;
    objc_msgSend((id)objc_opt_class(v30), "performOnMainQueue:", v45);

  }
  v31 = objc_msgSend(v16, "isRestricted");
  if ((v31 & 1) != 0)
  {
    v7 = 4;
  }
  else
  {
    v33 = v51[3];
    if (v33 == 7)
    {
      v7 = 9;
    }
    else if (v33 == 2)
    {
      v7 = 11;
    }
    else
    {
      v34 = _MTLogCategoryPlayback(v31, v32);
      v35 = objc_claimAutoreleasedReturnValue(v34);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        v36 = objc_msgSend(v16, "reasonForNotPlayable");
        *(_DWORD *)v54 = 134217984;
        v55 = v36;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "Playback request failed with status notPlayable, MTEpisodeUnavailableReason %lu", v54, 0xCu);
      }

      v7 = 5;
    }
  }
LABEL_57:
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[MTAccountController sharedInstance](MTAccountController, "sharedInstance"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "activeDsid"));

  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentItem"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "priceType"));
  v41 = MTEpisodePriceTypeFromPersistentString();

  if ((v41 & 0xFFFFFFFFFFFFFFFELL) == 2 && !v38)
  {
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[MTAccountController sharedInstance](MTAccountController, "sharedInstance"));
    objc_msgSend(v42, "promptAccountAuthenticationWithDebugReason:forced:", CFSTR("MTPlayerController authentication request"), 1);

    v7 = 10;
  }
  if (v51[3] == 2 && !objc_msgSend(v44, "startPlayback"))
    v7 = 1;

  _Block_object_dispose(&buf, 8);
  _Block_object_dispose(&v50, 8);

  return v7;
}

+ (MTPlayerController)defaultInstance
{
  void *v2;
  unsigned int v3;
  NSObject *v4;
  uint8_t v6[16];

  if (+[PFClientUtil isRunningOnHomepod](PFClientUtil, "isRunningOnHomepod"))
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[MRSharedSettings currentSettings](MRSharedSettings, "currentSettings"));
    v3 = objc_msgSend(v2, "isMultiplayerHost");

    if (v3)
    {
      v4 = objc_claimAutoreleasedReturnValue(+[IMLogCategory player](IMLogCategory, "player"));
      if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v6 = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_FAULT, "HomePod attempted to access the shared player controller", v6, 2u);
      }

    }
  }
  return (MTPlayerController *)(id)qword_100567560;
}

- (void)setupPlayerNotifications
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;

  v17 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v3 = IMAVPlayerNotification_MediaItemWillChange;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController player](self, "player"));
  objc_msgSend(v17, "addObserver:selector:name:object:", self, "currentItemWillChange:", v3, v4);

  v5 = IMAVPlayerNotification_MediaItemDidChange;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController player](self, "player"));
  objc_msgSend(v17, "addObserver:selector:name:object:", self, "currentItemDidChange", v5, v6);

  v7 = IMAVPlayerNotification_StateDidChange;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController player](self, "player"));
  objc_msgSend(v17, "addObserver:selector:name:object:", self, "playbackStateDidChange:", v7, v8);

  v9 = IMAVPlayerNotification_PeriodicUpdate;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController player](self, "player"));
  objc_msgSend(v17, "addObserver:selector:name:object:", self, "playerPeriodicUpdate", v9, v10);

  v11 = IMAVPlayerNotification_ErrorDidOccur;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController player](self, "player"));
  objc_msgSend(v17, "addObserver:selector:name:object:", self, "playerErrorDidOccur:", v11, v12);

  v13 = IMAVPlayerNotification_FailedToPlayToEndTime;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController player](self, "player"));
  objc_msgSend(v17, "addObserver:selector:name:object:", self, "playerFailedToPlayToEndTime:", v13, v14);

  v15 = IMAVPlayerNotification_PlayerHeadWillChange;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController player](self, "player"));
  objc_msgSend(v17, "addObserver:selector:name:object:", self, "playerHeadWillChange:", v15, v16);

}

- (IMAVPlayer)player
{
  return self->_player;
}

- (MTPlayerManifest)userManifest
{
  return self->_userManifest;
}

- (MTUpNextManifest)upNextManifest
{
  return self->_upNextManifest;
}

- (void)setValidationManager:(id)a3
{
  objc_storeStrong((id *)&self->_validationManager, a3);
}

- (void)setUserManifest:(id)a3
{
  objc_storeStrong((id *)&self->_userManifest, a3);
}

- (void)setUpNextManifest:(id)a3
{
  objc_storeStrong((id *)&self->_upNextManifest, a3);
}

- (void)setUpNextController:(id)a3
{
  objc_storeStrong((id *)&self->_upNextController, a3);
}

- (void)setSecureDownloadRenewalManager:(id)a3
{
  objc_storeStrong((id *)&self->_secureDownloadRenewalManager, a3);
}

- (void)setRestorationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_restorationQueue, a3);
}

- (void)setRestorationCompletions:(id)a3
{
  objc_storeStrong((id *)&self->_restorationCompletions, a3);
}

- (void)setRecordedPlayEventsForCurrentItem:(id)a3
{
  objc_storeStrong((id *)&self->_recordedPlayEventsForCurrentItem, a3);
}

- (void)setPlayerManifestRestored:(BOOL)a3
{
  self->_playerManifestRestored = a3;
}

- (void)setPlayer:(id)a3
{
  objc_storeStrong((id *)&self->_player, a3);
}

- (void)setPlaybackQueueController:(id)a3
{
  objc_storeStrong((id *)&self->_playbackQueueController, a3);
}

- (void)setPlatformSyncPlayheadChangeObserverBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void)setMetricsPlayStartTime:(int64_t)a3
{
  self->_metricsPlayStartTime = a3;
}

- (void)setMetricsPlayStartPosition:(double)a3
{
  self->_metricsPlayStartPosition = a3;
}

- (void)setMediaRemoteController:(id)a3
{
  objc_storeStrong((id *)&self->_mediaRemoteController, a3);
}

- (void)setLoadQueue:(id)a3
{
  objc_storeStrong((id *)&self->_loadQueue, a3);
}

- (void)setLastPlaybackSaveTime:(double)a3
{
  self->_lastPlaybackSaveTime = a3;
}

- (void)setKeyStorage:(id)a3
{
  objc_storeStrong((id *)&self->_keyStorage, a3);
}

- (void)setIsManifestRestorationOngoing:(BOOL)a3
{
  self->_isManifestRestorationOngoing = a3;
}

- (void)setInvalidationManager:(id)a3
{
  objc_storeStrong((id *)&self->_invalidationManager, a3);
}

- (void)setHighlightsProvider:(id)a3
{
  objc_storeStrong((id *)&self->_highlightsProvider, a3);
}

- (void)setHasReportedThisEpisode:(BOOL)a3
{
  self->_hasReportedThisEpisode = a3;
}

- (void)setDataAccessQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dataAccessQueue, a3);
}

- (void)setCurrentActivity:(id)a3
{
  objc_storeStrong((id *)&self->_currentActivity, a3);
  -[MTPlayerController _updateCurrentActivityForPlayState](self, "_updateCurrentActivityForPlayState");
  -[MTPlayerController _saveActivityForRestoration](self, "_saveActivityForRestoration");
}

- (void)setCompositeManifest:(id)a3
{
  objc_storeStrong((id *)&self->_compositeManifest, a3);
}

- (OS_dispatch_queue)restorationQueue
{
  return self->_restorationQueue;
}

- (NSMutableArray)restorationCompletions
{
  return self->_restorationCompletions;
}

- (MTPlaybackQueueController)playbackQueueController
{
  return self->_playbackQueueController;
}

- (double)lastPlaybackSaveTime
{
  return self->_lastPlaybackSaveTime;
}

- (BOOL)isPlayerManifestRestored
{
  return self->_playerManifestRestored;
}

- (BOOL)isManifestRestorationOngoing
{
  return self->_isManifestRestorationOngoing;
}

- (MTPlayerController)init
{
  return -[MTPlayerController initWithPlayer:](self, "initWithPlayer:", 0);
}

- (NSUserActivity)currentActivity
{
  return self->_currentActivity;
}

- (void)_restoreDefaultManifestIfNeededWithCompletion:(id)a3
{
  -[MTPlayerController _restoreManifestIfNeededWithCompletion:useEmptyManifest:](self, "_restoreManifestIfNeededWithCompletion:useEmptyManifest:", a3, 0);
}

+ (BOOL)hasDefaultInstance
{
  return qword_100567560 != 0;
}

- (id)copy
{
  return (id)objc_claimAutoreleasedReturnValue(+[MTPlayerController defaultInstance](MTPlayerController, "defaultInstance"));
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  -[MTPlayerController tearDownPlayerNotifications](self, "tearDownPlayerNotifications");
  -[MTPropertyChangeQueryObserver stop](self->_transcriptIdentifierObserver, "stop");
  v4.receiver = self;
  v4.super_class = (Class)MTPlayerController;
  -[MTPlayerController dealloc](&v4, "dealloc");
}

- (void)tearDownPlayerNotifications
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

}

- (void)playerErrorDidOccur:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  _QWORD block[4];
  id v13;
  id v14;
  id location;

  v4 = a3;
  -[MTPlayerController playerFailure:shouldShowDialog:](self, "playerFailure:shouldShowDialog:", v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", IMAVPlayerNotificationKey_Error));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController player](self, "player"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "currentItem"));

  if (-[MTPlayerController isLicenseKeyIntegrityError:](self, "isLicenseKeyIntegrityError:", v6))
    -[MTPlayerController attemptToRecoverFromKeyError:](self, "attemptToRecoverFromKeyError:", v4);
  if (-[MTPlayerController isLicenseKeyExpiredError:](self, "isLicenseKeyExpiredError:", v6)
    && objc_msgSend(v8, "isLocal"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "episodeUuid"));
    if (objc_msgSend(v9, "length"))
    {
      v10 = (uint64_t)objc_msgSend(v8, "episodeStoreId");

      if (v10 >= 1)
      {
        objc_initWeak(&location, self);
        v11 = objc_claimAutoreleasedReturnValue(-[MTPlayerController dataAccessQueue](self, "dataAccessQueue"));
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10010EF78;
        block[3] = &unk_1004A9A58;
        v13 = v8;
        objc_copyWeak(&v14, &location);
        dispatch_async(v11, block);

        objc_destroyWeak(&v14);
        objc_destroyWeak(&location);
      }
    }
    else
    {

    }
  }

}

- (void)attemptToRecoverFromKeyError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  id location;

  v4 = a3;
  +[PFBugReporterBridge reportKeyIntegrityError](_TtC18PodcastsFoundation19PFBugReporterBridge, "reportKeyIntegrityError");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController player](self, "player"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentItem"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[PFFairPlayRolloutController sharedInstance](PFFairPlayRolloutController, "sharedInstance"));
  v8 = objc_msgSend(v7, "isEnabled");

  if (v8)
  {
    v9 = objc_alloc((Class)PFFairPlayAsset);
    v10 = objc_msgSend(v6, "episodeStoreId");
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "asset"));
    v12 = objc_msgSend(v9, "initWithAdamID:avAsset:", v10, v11);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController invalidationManager](self, "invalidationManager"));
    v14 = objc_msgSend(v13, "removeKeyFor:", v12);

    objc_initWeak(&location, self);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController invalidationManager](self, "invalidationManager"));
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10010F56C;
    v20[3] = &unk_1004AB828;
    objc_copyWeak(&v21, &location);
    objc_msgSend(v15, "removalAllFairPlayKeysWithCompletion:", v20);

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);

  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController keyStorage](self, "keyStorage"));
    objc_msgSend(v16, "removeKeyDataForStoreTrackID:", objc_msgSend(v6, "episodeStoreId"));

    objc_initWeak(&location, self);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController keyStorage](self, "keyStorage"));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10010F664;
    v18[3] = &unk_1004AB0D0;
    objc_copyWeak(&v19, &location);
    objc_msgSend(v17, "removeAllKeyDataWithCompletion:", v18);

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

}

- (void)playerFailedToPlayToEndTime:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", IMAVPlayerNotificationKey_Error));

  -[MTPlayerController playerFailure:shouldShowDialog:](self, "playerFailure:shouldShowDialog:", v4, objc_msgSend(v6, "code") == (id)-11870);
}

- (BOOL)isLicenseKeyExpiredError:(id)a3
{
  id v3;
  void *v4;
  unsigned __int8 v5;

  v3 = a3;
  if (objc_msgSend(v3, "code") == (id)-42800)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "domain"));
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("CoreMediaErrorDomain"));

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isLicenseKeyIntegrityError:(id)a3
{
  id v3;
  void *v4;
  unsigned __int8 v5;

  v3 = a3;
  if (objc_msgSend(v3, "code") == (id)-42803)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "domain"));
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("CoreMediaErrorDomain"));

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)playerFailure:(id)a3 shouldShowDialog:(BOOL)a4
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  void *i;
  void *v33;
  void *v34;
  void *v35;
  unsigned int v36;
  NSString *v37;
  id WeakRetained;
  BOOL v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  _QWORD v49[5];
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint8_t v55[128];
  uint8_t buf[4];
  uint64_t v57;
  __int16 v58;
  void *v59;

  v4 = a4;
  v46 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "userInfo"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", IMAVPlayerNotificationKey_Error));

  objc_msgSend(v47, "recordMetrics");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController player](self, "player"));
  -[MTPlayerController player:willStopWithReason:initiator:](self, "player:willStopWithReason:initiator:", v6, 10, 2);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController player](self, "player"));
  -[MTPlayerController player:didStopWithReason:initiator:](self, "player:didStopWithReason:initiator:", v7, 10, 2);

  v8 = v47;
  if (objc_msgSend(v47, "code") != (id)-11819)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController player](self, "player"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "currentItem"));

    v12 = _MTLogCategoryPlayback(v10, v11);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "episode"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "uuid"));
      *(_DWORD *)buf = 138412546;
      v57 = (uint64_t)v15;
      v58 = 2112;
      v59 = v47;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Player failure for episode with uuid %@ with error %@", buf, 0x16u);

    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "userInfo"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", IMAVPlayerNotificationKey_PlaybackInterrupted));
    v18 = objc_msgSend(v17, "BOOLValue");

    if ((v4 & v18) == 1)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "episode"));
      v20 = (uint64_t)objc_msgSend(v19, "reasonForNotPlayable");

      v23 = _MTLogCategoryPlayback(v21, v22);
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "episode"));
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "uuid"));
        *(_DWORD *)buf = 134218242;
        v57 = v20;
        v58 = 2112;
        v59 = v26;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Reason for player failure: %lu for episode with uuid %@", buf, 0x16u);

      }
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController player](self, "player"));
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "playerItem"));

      v53 = 0u;
      v54 = 0u;
      v51 = 0u;
      v52 = 0u;
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "errorLog"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "events"));

      v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
      if (v30)
      {
        v31 = *(_QWORD *)v52;
        do
        {
          for (i = 0; i != v30; i = (char *)i + 1)
          {
            if (*(_QWORD *)v52 != v31)
              objc_enumerationMutation(v29);
            v33 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * (_QWORD)i);
            v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "errorDomain"));
            v35 = (void *)objc_claimAutoreleasedReturnValue(+[MTStandardKeyRequestHandler keyRequestLicenseErrorDomain](MTStandardKeyRequestHandler, "keyRequestLicenseErrorDomain"));
            v36 = objc_msgSend(v34, "isEqualToString:", v35);

            if (v36)
            {
              if (objc_msgSend(v33, "errorStatusCode") == (id)-1002)
              {
                v20 = 8;
              }
              else if (objc_msgSend(v33, "errorStatusCode") == (id)-1004)
              {
                v20 = 9;
              }
              else if (objc_msgSend(v33, "errorStatusCode") == (id)-1014)
              {
                v20 = 10;
              }
            }
          }
          v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
        }
        while (v30);
      }

      if (-[MTPlayerController isLicenseKeyIntegrityError:](self, "isLicenseKeyIntegrityError:", v47))
        v20 = 13;
      if (!v20)
      {
        if (objc_msgSend(v47, "code") == (id)-11870)
        {
          v20 = 6;
        }
        else if (-[MTPlayerController isLicenseKeyExpiredError:](self, "isLicenseKeyExpiredError:", v47))
        {
          v20 = 8;
        }
        else if (objc_msgSend(v47, "code") == (id)-1009 || objc_msgSend(v47, "code") == (id)-1005)
        {
          v20 = 2;
        }
        else
        {
          v37 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "domain"));
          if (v37 == NSURLErrorDomain)
            v20 = 4;
          else
            v20 = 5;

        }
      }
      WeakRetained = objc_loadWeakRetained((id *)&self->_dialogProxy);
      v39 = WeakRetained == 0;

      if (v39)
      {
        objc_initWeak((id *)buf, self);
        v42 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisodeUnavailableUtil sharedInstance](MTEpisodeUnavailableUtil, "sharedInstance"));
        v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "author"));
        v49[0] = _NSConcreteStackBlock;
        v49[1] = 3221225472;
        v49[2] = sub_10010FE24;
        v49[3] = &unk_1004AB850;
        v49[4] = self;
        objc_copyWeak(&v50, (id *)buf);
        objc_msgSend(v42, "showDialogForReason:podcastTitle:completion:", v20, v43, v49);

        objc_destroyWeak(&v50);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        v40 = objc_loadWeakRetained((id *)&self->_dialogProxy);
        v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "author"));
        objc_msgSend(v40, "proxyShouldShowDialogForReason:podcastTitle:", v20, v41);

      }
    }

    v8 = v47;
  }

}

- (void)player:(id)a3 willStopWithReason:(unint64_t)a4 initiator:(unint64_t)a5
{
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;

  v8 = _MTLogCategoryPlayback(self, a2);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = NSPersistentStringFromMTStopReason(a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = NSPersistentStringFromMTPlaybackAdjustmentInitiator(a5);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v20 = 138412546;
    v21 = v11;
    v22 = 2112;
    v23 = v13;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Will stop player (reason: %@, initiator: %@)", (uint8_t *)&v20, 0x16u);

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[MetricsActivity shared](_TtC8ShelfKit15MetricsActivity, "shared"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stopType"));

  if (v15)
  {
    v18 = _MTLogCategoryPlayback(v16, v17);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      LOWORD(v20) = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Notification is _during_ an existing stop cause. Assuming first-receiver was the trigger and ignoring this event.", (uint8_t *)&v20, 2u);
    }

  }
  else
  {
    -[MTPlayerController reportStopReason:withInitiator:](self, "reportStopReason:withInitiator:", a4, a5);
  }
}

- (void)player:(id)a3 didStopWithReason:(unint64_t)a4 initiator:(unint64_t)a5
{
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;

  v8 = _MTLogCategoryPlayback(self, a2);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = NSPersistentStringFromMTStopReason(a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = NSPersistentStringFromMTPlaybackAdjustmentInitiator(a5);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v20 = 138412546;
    v21 = v11;
    v22 = 2112;
    v23 = v13;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Did stop player (reason: %@, initiator: %@)", (uint8_t *)&v20, 0x16u);

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[MetricsActivity shared](_TtC8ShelfKit15MetricsActivity, "shared"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stopType"));

  if (v15)
  {
    v18 = objc_claimAutoreleasedReturnValue(-[MTPlayerController player](self, "player"));
    -[NSObject currentTime](v18, "currentTime");
    -[MTPlayerController recordMTPlayerMetricsForCurrentItemWithCurrentTime:](self, "recordMTPlayerMetricsForCurrentItemWithCurrentTime:");
  }
  else
  {
    v19 = _MTLogCategoryPlayback(v16, v17);
    v18 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      LOWORD(v20) = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Playback stop was already recorded, skipping reporting", (uint8_t *)&v20, 2u);
    }
  }

}

- (void)player:(id)a3 failedToStopWithReason:(unint64_t)a4 initiator:(unint64_t)a5
{
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;

  v7 = _MTLogCategoryPlayback(self, a2);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = NSPersistentStringFromMTStopReason(a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = NSPersistentStringFromMTPlaybackAdjustmentInitiator(a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = 138412546;
    v14 = v10;
    v15 = 2112;
    v16 = v12;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Failed to stop player (reason: %@, initiator: %@)", (uint8_t *)&v13, 0x16u);

  }
}

- (void)playbackStateDidChange:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  float v14;
  float v15;
  void *v16;
  void *v17;
  float v18;
  float v19;
  void *v20;
  float v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  unsigned __int8 v26;
  void *v27;
  void *v28;
  double v29;
  void (*v30)(uint64_t);
  void ***v31;
  void **v32;
  void **v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  void **v38;
  void **v39;
  uint8_t buf[16];

  v4 = a3;
  v6 = _MTLogCategoryPlayback(v4, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "playbackStateDidChange", buf, 2u);
  }

  if (!-[MTPlayerController isPlayingLocally](self, "isPlayingLocally"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController userManifest](self, "userManifest"));
    v9 = objc_msgSend(v8, "userActivityContainsPlayhead");

    if (v9)
      -[MTPlayerController _saveActivityForRestoration](self, "_saveActivityForRestoration");
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[MTBaseProcessor sharedInstance](MTUPPSyncProcessor, "sharedInstance"));
    objc_msgSend(v10, "playerPaused");

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController currentItem](self, "currentItem"));
    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", IMAVPlayerNotificationKey_OldPlayheadTime));
      objc_msgSend(v13, "floatValue");
      v15 = v14;

      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", IMAVPlayerNotificationKey_CurrentPlayheadTime));
      objc_msgSend(v17, "floatValue");
      v19 = v18;

      v20 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController player](self, "player"));
      if (objc_msgSend(v20, "state") == (id)2)
        v21 = v15;
      else
        v21 = v19;
      v22 = v21;

      -[MTPlayerController recordMTPlayerMetricsForCurrentItemWithCurrentTime:](self, "recordMTPlayerMetricsForCurrentItemWithCurrentTime:", v22);
      -[MTPlayerController recordMetricsForCurrentItem](self, "recordMetricsForCurrentItem");
    }
  }
  -[MTPlayerController _updateCurrentActivityForPlayState](self, "_updateCurrentActivityForPlayState");
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "mainOrPrivateContext"));

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController currentItem](self, "currentItem"));
  -[MTPlayerController updateEpisodeForPlayerUpdateForceSave:](self, "updateEpisodeForPlayerUpdateForceSave:", 1);
  v26 = -[MTPlayerController isPlayingLocally](self, "isPlayingLocally");
  if (v25)
  {
    if ((v26 & 1) != 0)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController player](self, "player"));
      objc_msgSend(v27, "currentTime");
      -[MTPlayerController setMetricsPlayStartPosition:](self, "setMetricsPlayStartPosition:");

      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      objc_msgSend(v28, "timeIntervalSince1970");
      -[MTPlayerController setMetricsPlayStartTime:](self, "setMetricsPlayStartTime:", (uint64_t)(v29 * 1000.0));

      v38 = _NSConcreteStackBlock;
      v30 = sub_100110DA4;
      v31 = &v38;
    }
    else
    {
      v39 = _NSConcreteStackBlock;
      v30 = sub_100110D3C;
      v31 = &v39;
    }
    v31[1] = (void **)3221225472;
    v31[2] = (void **)v30;
    v31[3] = (void **)&unk_1004A6640;
    v32 = v24;
    v31[4] = v32;
    v33 = v25;
    v31[5] = v33;
    objc_msgSend(v32, "performBlock:", v31);

    if (-[MTPlayerController isPlayingLocally](self, "isPlayingLocally"))
    {
      v34 = objc_msgSend(v33, "upgradeToAlternatePaidVersionIfNeeded");
      if ((_DWORD)v34)
      {
        v36 = _MTLogCategoryPlayback(v34, v35);
        v37 = objc_claimAutoreleasedReturnValue(v36);
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "We are upgrading the currently playing item after a pause/play", buf, 2u);
        }

        -[MTPlayerController pauseLocalPlayer](self, "pauseLocalPlayer");
        objc_msgSend(v33, "invalidateAsset");
        objc_msgSend(v33, "setPlayhead:", 0.0);
        -[MTPlayerController playLocalPlayer](self, "playLocalPlayer");
      }
    }
  }

}

- (BOOL)shouldPresentNowPlayingForItem:(id)a3 presentationType:(unint64_t)a4
{
  if (a4 == 2)
    return 1;
  if (a4 == 1)
    return objc_msgSend(a3, "isVideo");
  return 0;
}

- (void)openExternalEpisode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController player](self, "player"));
  v6 = (void *)objc_opt_class(v5);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100110EF0;
  v8[3] = &unk_1004A6200;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "performOnMainQueue:", v8);

}

- (BOOL)playWithReason:(unint64_t)a3
{
  return -[MTPlayerController playWithReason:interruptEvent:](self, "playWithReason:interruptEvent:", a3, 0);
}

- (BOOL)playWithReason:(unint64_t)a3 interruptEvent:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;

  v4 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MTPlaybackContext contextWithReason:](MTPlaybackContext, "contextWithReason:", a3));
  objc_msgSend(v6, "setPresentationType:", 0);
  objc_msgSend(v6, "setInterruptEvent:", v4);
  LOBYTE(v4) = -[MTPlayerController playWithContext:](self, "playWithContext:", v6);

  return v4;
}

- (BOOL)playWithContext:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController player](self, "player"));
  v6 = objc_msgSend(v5, "play");

  -[MTPlayerController _performAfterPlay:playbackStarted:](self, "_performAfterPlay:playbackStarted:", v4, v6);
  return (char)v6;
}

- (void)stopWithReason:(unint64_t)a3 initiator:(unint64_t)a4
{
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[MTPlayerController player](self, "player"));
  objc_msgSend(v6, "stopWithReason:initiator:", a3, a4);

}

- (void)playWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController player](self, "player"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100111130;
  v11[3] = &unk_1004AB960;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "play:interruptionEvent:", v11, objc_msgSend(v10, "interruptEvent"));

}

- (void)_performAfterPlay:(id)a3 playbackStarted:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[2];
  _QWORD v18[2];

  v4 = a4;
  v6 = a3;
  v7 = objc_msgSend(v6, "source");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController userManifest](self, "userManifest"));
  v17[0] = CFSTR("interactive");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v6, "isInteractive")));
  v17[1] = CFSTR("play_source");
  v18[0] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MTStoreReportingController reportingStringForPlayReason:](MTStoreReportingController, "reportingStringForPlayReason:", v7));
  v18[1] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v18, v17, 2));
  +[IMMetrics recordUserAction:dataSource:withData:](IMMetrics, "recordUserAction:dataSource:withData:", CFSTR("play"), v8, v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[MetricsActivity shared](_TtC8ShelfKit15MetricsActivity, "shared"));
  objc_msgSend(v12, "setPlayReason:", v7);

  if (v4)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController currentItem](self, "currentItem"));
    v14 = -[MTPlayerController shouldPresentNowPlayingForItem:presentationType:](self, "shouldPresentNowPlayingForItem:presentationType:", v13, objc_msgSend(v6, "presentationType"));

    if (v14)
    {
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_10011136C;
      v15[3] = &unk_1004A6640;
      v15[4] = self;
      v16 = v6;
      +[IMAVPlayer performOnMainQueue:](IMAVPlayer, "performOnMainQueue:", v15);

    }
  }

}

- (void)playItemAtIndex:(unint64_t)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[MTPlayerController compositeManifest](self, "compositeManifest"));
  objc_msgSend(v4, "setCurrentIndex:", a3);

}

- (BOOL)pauseLocalPlayerWithInitiator:(unint64_t)a3
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController player](self, "player"));
  LOBYTE(a3) = objc_msgSend(v4, "pauseWithInitiator:", a3);

  return a3;
}

- (void)pauseLocalPlayer
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[MTPlayerController player](self, "player"));
  objc_msgSend(v2, "pause");

}

- (void)pausePlayerTarget
{
  if (-[MTPlayerController isPlayerTargetLocal](self, "isPlayerTargetLocal"))
    -[MTPlayerController pauseLocalPlayer](self, "pauseLocalPlayer");
  else
    -[MTPlayerController _performMediaRemoteCommand:](self, "_performMediaRemoteCommand:", 1);
}

- (void)seekToTime:(double)a3
{
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;

  if (-[MTPlayerController isPlayerTargetLocal](self, "isPlayerTargetLocal"))
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[MTPlayerController player](self, "player"));
    objc_msgSend(v7, "setCurrentTime:", a3);

  }
  else
  {
    v8 = kMRMediaRemoteOptionPlaybackPosition;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3));
    v9 = v5;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1));

    -[MTPlayerController _performMediaRemoteCommand:options:](self, "_performMediaRemoteCommand:options:", 24, v6);
  }
}

- (void)pausePlayerTargetWithInitiator:(unint64_t)a3
{
  id v5;

  if (-[MTPlayerController isPlayerTargetLocal](self, "isPlayerTargetLocal"))
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[MTPlayerController player](self, "player"));
    objc_msgSend(v5, "pauseWithInitiator:", a3);

  }
  else
  {
    -[MTPlayerController _performMediaRemoteCommand:](self, "_performMediaRemoteCommand:", 1);
  }
}

- (void)playLocalPlayer
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[MTPlayerController player](self, "player"));
  objc_msgSend(v2, "play");

}

- (void)playPlayerTarget
{
  if (-[MTPlayerController isPlayerTargetLocal](self, "isPlayerTargetLocal"))
    -[MTPlayerController playLocalPlayer](self, "playLocalPlayer");
  else
    -[MTPlayerController _performMediaRemoteCommand:](self, "_performMediaRemoteCommand:", 0);
}

- (void)stopLocalPlayer
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[MTPlayerController player](self, "player"));
  objc_msgSend(v2, "stop");

}

- (void)stopLocalPlayerWithReason:(unint64_t)a3 initiator:(unint64_t)a4
{
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[MTPlayerController player](self, "player"));
  objc_msgSend(v6, "stopWithReason:initiator:", a3, a4);

}

- (void)stopPlayerTarget
{
  uint64_t v3;

  if (-[MTPlayerController isPlayerTargetLocal](self, "isPlayerTargetLocal"))
    -[MTPlayerController stopLocalPlayer](self, "stopLocalPlayer", v3);
  else
    -[MTPlayerController _performMediaRemoteCommand:](self, "_performMediaRemoteCommand:", 3);
}

- (void)stopPlayerTargetWithReason:(unint64_t)a3 initiator:(unint64_t)a4
{
  -[MTPlayerController reportStopReason:withInitiator:](self, "reportStopReason:withInitiator:", a3, a4);
  -[MTPlayerController stopLocalPlayer](self, "stopLocalPlayer");
}

- (void)setCurrentTime:(double)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[MTPlayerController player](self, "player"));
  objc_msgSend(v4, "setCurrentTime:", a3);

}

- (void)resolveActivePlayerPathWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  NSErrorUserInfoKey v10;
  const __CFString *v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController playerPath](self, "playerPath"));
  if (v5)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1001118B0;
    v8[3] = &unk_1004AB988;
    v9 = v4;
    objc_msgSend(v5, "resolveWithCompletion:", v8);
    v6 = v9;
LABEL_5:

    goto LABEL_6;
  }
  if (v4)
  {
    v10 = NSLocalizedDescriptionKey;
    v11 = CFSTR("No PlayerPath to resolve.");
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("MTPlayerControllerErrorDomain"), -1, v7));

    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v6);
    goto LABEL_5;
  }
LABEL_6:

}

- (BOOL)isPlayerTargetLocal
{
  void *v2;
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController playerPath](self, "playerPath"));
  v3 = v2;
  if (v2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "route"));
    v5 = objc_msgSend(v4, "isDeviceRoute");

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (id)playingEpisodeUuid
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController currentItem](self, "currentItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "episodeUuid"));

  return v3;
}

- (BOOL)isPlayingEpisodeUuid:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController playingEpisodeUuid](self, "playingEpisodeUuid"));
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  return v6;
}

- (BOOL)volumeControlAvailable
{
  return 0;
}

- (void)presentNowPlayingAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(+[MTApplication sharedApplication](MTApplication, "sharedApplication"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "delegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "appController"));
  objc_msgSend(v5, "presentNowPlayingAnimated:", v3);

}

- (void)dismissNowPlayingAnimated:(BOOL)a3
{
  -[MTPlayerController dismissNowPlayingAnimated:completion:](self, "dismissNowPlayingAnimated:completion:", a3, 0);
}

- (void)playManifest:(id)a3 context:(id)a4 completion:(id)a5
{
  -[MTPlayerController setManifest:startPlayback:context:completion:](self, "setManifest:startPlayback:context:completion:", a3, 1, a4, a5);
}

- (void)setManifest:(id)a3 context:(id)a4 completion:(id)a5
{
  -[MTPlayerController setManifest:startPlayback:context:completion:](self, "setManifest:startPlayback:context:completion:", a3, 0, a4, a5);
}

- (void)setManifest:(id)a3 startPlayback:(BOOL)a4 context:(id)a5 completion:(id)a6
{
  -[MTPlayerController setManifest:startPlayback:forceLocal:context:completion:](self, "setManifest:startPlayback:forceLocal:context:completion:", a3, a4, 0, a5, a6);
}

- (void)setManifestAsDryRun:(id)a3 reason:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;

  v8 = a5;
  v9 = a3;
  v11 = (id)objc_claimAutoreleasedReturnValue(+[MTPlaybackContext contextWithReason:](MTPlaybackContext, "contextWithReason:", a4));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MTSetPlaybackQueueRequest requestWithContext:](MTSetPlaybackQueueRequest, "requestWithContext:", v11));
  objc_msgSend(v10, "setManifest:", v9);

  objc_msgSend(v10, "setDryRun:", 1);
  objc_msgSend(v10, "setStartPlayback:", 1);
  objc_msgSend(v10, "setCompletion:", v8);

  -[MTPlayerController setPlaybackQueue:](self, "setPlaybackQueue:", v10);
}

- (void)setManifest:(id)a3 startPlayback:(BOOL)a4 destination:(unint64_t)a5 context:(id)a6 completion:(id)a7
{
  _BOOL8 v9;
  id v12;
  id v13;
  id v14;

  v9 = a4;
  v12 = a7;
  v13 = a3;
  v14 = (id)objc_claimAutoreleasedReturnValue(+[MTSetPlaybackQueueRequest requestWithContext:](MTSetPlaybackQueueRequest, "requestWithContext:", a6));
  objc_msgSend(v14, "setManifest:", v13);

  objc_msgSend(v14, "setStartPlayback:", v9);
  objc_msgSend(v14, "setPlaybackDestination:", a5);
  objc_msgSend(v14, "setCompletion:", v12);

  -[MTPlayerController setPlaybackQueue:](self, "setPlaybackQueue:", v14);
}

- (void)setManifest:(id)a3 reason:(unint64_t)a4 interactive:(BOOL)a5 completion:(id)a6
{
  -[MTPlayerController setManifest:startPlayback:forceLocal:reason:interactive:completion:](self, "setManifest:startPlayback:forceLocal:reason:interactive:completion:", a3, 0, 0, a4, a5, a6);
}

- (void)setManifest:(id)a3 startPlayback:(BOOL)a4 reason:(unint64_t)a5 interactive:(BOOL)a6 completion:(id)a7
{
  -[MTPlayerController setManifest:startPlayback:forceLocal:reason:interactive:completion:](self, "setManifest:startPlayback:forceLocal:reason:interactive:completion:", a3, a4, 0, a5, a6, a7);
}

- (void)playManifest:(id)a3 reason:(unint64_t)a4 interactive:(BOOL)a5 completion:(id)a6
{
  -[MTPlayerController setManifest:startPlayback:forceLocal:reason:interactive:completion:](self, "setManifest:startPlayback:forceLocal:reason:interactive:completion:", a3, 1, 0, a4, a5, a6);
}

- (void)playManifest:(id)a3 reason:(unint64_t)a4 interactive:(BOOL)a5 presentationType:(unint64_t)a6 completion:(id)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;

  v8 = a5;
  v12 = a7;
  v13 = a3;
  v14 = (id)objc_claimAutoreleasedReturnValue(+[MTPlaybackContext contextWithReason:](MTPlaybackContext, "contextWithReason:", a4));
  objc_msgSend(v14, "setPresentationType:", a6);
  objc_msgSend(v14, "setInteractive:", v8);
  -[MTPlayerController setManifest:startPlayback:context:completion:](self, "setManifest:startPlayback:context:completion:", v13, 1, v14, v12);

}

- (void)playManifest:(id)a3 reason:(unint64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[MTPlaybackContext contextWithReason:](MTPlaybackContext, "contextWithReason:", a4));
  -[MTPlayerController setManifest:startPlayback:context:completion:](self, "setManifest:startPlayback:context:completion:", v6, 1, v7, 0);

}

- (BOOL)_promptToClearUpNextIfNeededForRequest:(id)a3
{
  id v4;
  void *v5;
  _BYTE *v6;
  void *v7;
  _BYTE *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  BOOL v12;
  int64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController upNextController](self, "upNextController"));
  v6 = objc_msgSend(v5, "count");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController upNextController](self, "upNextController"));
  v8 = objc_msgSend(v7, "upNextOffset");

  if (objc_msgSend(v4, "playbackDestination"))
    v9 = -[MTPlayerController isPlayerTargetLocal](self, "isPlayerTargetLocal");
  else
    v9 = 1;
  if (v6 == v8)
    goto LABEL_9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "context"));
  if ((objc_msgSend(v10, "isInteractive") & 1) == 0)
    goto LABEL_8;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "context"));
  if (objc_msgSend(v11, "upNextQueueIntent"))
  {

LABEL_8:
    goto LABEL_9;
  }
  if (objc_msgSend(v4, "playbackDestination") != (id)1)
    v9 = 0;

  if (v9 == 1)
  {
    v14 = v6 - v8;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("CLEAR_QUEUE_PROMPT_TITLE"), &stru_1004C6D40, 0));

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("CLEAR_QUEUE_PROMPT_MESSAGE"), &stru_1004C6D40, 0));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v18, v14));

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController player](self, "player"));
    v21 = (void *)objc_opt_class(v20);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100112330;
    v24[3] = &unk_1004A6C78;
    v24[4] = self;
    v25 = v4;
    v26 = v16;
    v27 = v19;
    v22 = v19;
    v23 = v16;
    objc_msgSend(v21, "performOnMainQueue:", v24);

    v12 = 1;
    goto LABEL_10;
  }
LABEL_9:
  v12 = 0;
LABEL_10:

  return v12;
}

- (void)_showGenericPromptToClearUpNextWithRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("CLEAR_QUEUE_PROMPT_TITLE"), &stru_1004C6D40, 0));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("CLEAR_QUEUE_PROMPT_MESSAGE"), &stru_1004C6D40, 0));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v8, 1));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController player](self, "player"));
  v11 = (void *)objc_opt_class(v10);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100112510;
  v15[3] = &unk_1004A6C78;
  v15[4] = self;
  v16 = v4;
  v17 = v6;
  v18 = v9;
  v12 = v9;
  v13 = v6;
  v14 = v4;
  objc_msgSend(v11, "performOnMainQueue:", v15);

}

- (id)_alertControllerForClearingOrKeepingUpNextWithRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  MTPlayerController *v23;
  _QWORD v24[4];
  id v25;
  MTPlayerController *v26;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", 0, 0, 1));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("QUEUE_KEEP_CONFIRM"), &stru_1004C6D40, 0));
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1001127F0;
  v24[3] = &unk_1004A7F20;
  v8 = v4;
  v25 = v8;
  v26 = self;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v7, 0, v24));

  objc_msgSend(v5, "addAction:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("QUEUE_CLEAR_CONFIRM"), &stru_1004C6D40, 0));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1001128A0;
  v21[3] = &unk_1004A7F20;
  v12 = v8;
  v22 = v12;
  v23 = self;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v11, 0, v21));

  objc_msgSend(v5, "addAction:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("Cancel"), &stru_1004C6D40, 0));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100112950;
  v19[3] = &unk_1004A9420;
  v20 = v12;
  v16 = v12;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v15, 1, v19));

  objc_msgSend(v5, "addAction:", v17);
  return v5;
}

- (void)clearPlayerManifestWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  self->_shouldFindSomethingToPlay = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController player](self, "player"));
  objc_msgSend(v5, "setManifest:completion:", 0, 0);

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100112A08;
  v7[3] = &unk_1004A63C8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[MTPlayerController _restoreManifestIfNeededWithCompletion:useEmptyManifest:](self, "_restoreManifestIfNeededWithCompletion:useEmptyManifest:", v7, 1);

}

- (void)_restoreEmptyManifestIfNeededWithCompletion:(id)a3
{
  -[MTPlayerController _restoreManifestIfNeededWithCompletion:useEmptyManifest:](self, "_restoreManifestIfNeededWithCompletion:useEmptyManifest:", a3, 1);
}

- (void)_currentActivityBecomeCurrent
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController currentActivity](self, "currentActivity"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController currentActivity](self, "currentActivity"));
    objc_msgSend(v4, "setDelegate:", self);

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController currentActivity](self, "currentActivity"));
    objc_msgSend(v5, "setSupportsContinuationStreams:", 1);

    v6 = (id)objc_claimAutoreleasedReturnValue(-[MTPlayerController currentActivity](self, "currentActivity"));
    objc_msgSend(v6, "becomeCurrent");

  }
}

+ (id)_loadActivityForRestoration
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  void *v30;
  id v31;
  uint8_t buf[4];
  void *v33;
  _QWORD v34[10];

  v2 = objc_msgSend((id)objc_opt_class(a1), "_activityRestorationPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfURL:](NSData, "dataWithContentsOfURL:", v3));
  if (v4)
  {
    v34[0] = objc_opt_class(NSArray);
    v34[1] = objc_opt_class(NSData);
    v34[2] = objc_opt_class(NSDate);
    v34[3] = objc_opt_class(NSDictionary);
    v34[4] = objc_opt_class(NSNull);
    v34[5] = objc_opt_class(NSNumber);
    v34[6] = objc_opt_class(NSSet);
    v34[7] = objc_opt_class(NSString);
    v34[8] = objc_opt_class(NSURL);
    v34[9] = objc_opt_class(NSUUID);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v34, 10));
    v6 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v5));

    v30 = (void *)v6;
    v31 = 0;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v6, v4, &v31));
    v8 = v31;
    v10 = v8;
    if (v8)
    {
      v11 = _MTLogCategoryPlayback(v8, v9);
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v33 = v10;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to restore activity with error %@", buf, 0xCu);
      }

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("type")));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("title")));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("userInfo")));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("suggestedActionType")));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("options")));
    if (v13)
    {
      v18 = objc_opt_class(NSString);
      v19 = objc_opt_class(v18);
      if ((objc_opt_isKindOfClass(v13, v19) & 1) == 0)
      {

        v13 = 0;
      }
    }
    if (v14)
    {
      v20 = objc_opt_class(NSString);
      v21 = objc_opt_class(v20);
      if ((objc_opt_isKindOfClass(v14, v21) & 1) == 0)
      {

        v14 = 0;
      }
    }
    if (v15)
    {
      v22 = objc_opt_class(NSDictionary);
      v23 = objc_opt_class(v22);
      if ((objc_opt_isKindOfClass(v15, v23) & 1) == 0)
      {

        v15 = 0;
      }
    }
    if (v16)
    {
      v24 = objc_opt_class(NSNumber);
      v25 = objc_opt_class(v24);
      if ((objc_opt_isKindOfClass(v16, v25) & 1) == 0)
      {

        v16 = 0;
      }
    }
    if (v17)
    {
      v26 = objc_opt_class(NSDictionary);
      v27 = objc_opt_class(v26);
      if ((objc_opt_isKindOfClass(v17, v27) & 1) == 0)
      {

        v17 = 0;
      }
    }
    if (v13)
    {
      v28 = objc_msgSend(objc_alloc((Class)NSUserActivity), "_initWithTypeIdentifier:suggestedActionType:options:", v13, objc_msgSend(v16, "integerValue"), v17);
      objc_msgSend(v28, "setTitle:", v14);
      objc_msgSend(v28, "setUserInfo:", v15);
    }
    else
    {
      v28 = 0;
    }

  }
  else
  {
    v28 = 0;
  }

  return v28;
}

+ (id)_activityRestorationPath
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MTConstants sharedDocumentsDirectory](MTConstants, "sharedDocumentsDirectory"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("play_queue_restoration.data")));

  return v3;
}

- (void)_localPlayerPath
{
  const void *v2;
  const void *v3;
  void *v4;

  v2 = (const void *)MRNowPlayingClientCreate(0, kMTApplicationBundleIdentifier);
  v3 = (const void *)MRNowPlayingPlayerCreate(kPodcastsPlayerID, kPodcastsPlayerID);
  v4 = (void *)MRNowPlayingPlayerPathCreate(0, v2, v3);
  if (v2)
    CFRelease(v2);
  if (v3)
    CFRelease(v3);
  return v4;
}

- (void)_performMediaRemoteCommand:(unsigned int)a3 options:(id)a4
{
  uint64_t v4;
  id v6;
  _QWORD v7[5];
  id v8;
  int v9;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  if (-[MTPlayerController isPlayerTargetLocal](self, "isPlayerTargetLocal"))
  {
    -[MTPlayerController _sendMediaRemoteCommand:toPlayer:](self, "_sendMediaRemoteCommand:toPlayer:", v4, -[MTPlayerController _localPlayerPath](self, "_localPlayerPath"));
  }
  else
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1001132A0;
    v7[3] = &unk_1004ABB28;
    v7[4] = self;
    v9 = v4;
    v8 = v6;
    -[MTPlayerController resolveActivePlayerPathWithCompletion:](self, "resolveActivePlayerPathWithCompletion:", v7);

  }
}

- (void)_performMediaRemoteCommand:(unsigned int)a3
{
  -[MTPlayerController _performMediaRemoteCommand:options:](self, "_performMediaRemoteCommand:options:", *(_QWORD *)&a3, 0);
}

- (void)_sendMediaRemoteCommand:(unsigned int)a3 toPlayer:(void *)a4
{
  -[MTPlayerController _sendMediaRemoteCommand:toPlayer:options:](self, "_sendMediaRemoteCommand:toPlayer:options:", *(_QWORD *)&a3, a4, 0);
}

- (void)_sendMediaRemoteCommand:(unsigned int)a3 toPlayer:(void *)a4 options:(id)a5
{
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  dispatch_queue_global_t global_queue;
  void *v11;
  uint64_t v12;
  void *v13;

  v6 = *(_QWORD *)&a3;
  v7 = a5;
  v12 = kMRMediaRemoteOptionDirectUserInteraction;
  v13 = &__kCFBooleanTrue;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1));
  v9 = objc_msgSend(v8, "mutableCopy");

  if (v7)
    objc_msgSend(v9, "addEntriesFromDictionary:", v7);
  global_queue = dispatch_get_global_queue(0, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
  MRMediaRemoteSendCommandToPlayer(v6, v9, a4, 0, v11, &stru_1004ABB68);

}

- (void)recordMTPlayerMetricsForCurrentItemWithCurrentTime:(double)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _BOOL8 v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  const __CFString *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  uint64_t v44;
  NSObject *v45;
  const __CFString *v46;
  void *v47;
  unsigned __int8 v48;
  void *v49;
  uint64_t v50;
  NSObject *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  MTEpisodeMetricDataSource *v56;
  void *v57;
  void *v58;
  MTEpisodeMetricDataSource *v59;
  id v60;
  void *v61;
  void *v62;
  _QWORD v63[4];
  id v64;
  MTEpisodeMetricDataSource *v65;
  id v66;
  uint8_t buf[4];
  id v68;
  __int16 v69;
  void *v70;
  __int16 v71;
  uint64_t v72;
  __int16 v73;
  double v74;
  __int16 v75;
  void *v76;
  _QWORD v77[8];
  _QWORD v78[8];

  if (+[MTPrivacyUtil allowReporting](MTPrivacyUtil, "allowReporting"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController currentItem](self, "currentItem"));
    v6 = v5;
    if (!v5
      || !objc_msgSend(v5, "podcastStoreId")
      || (-[MTPlayerController metricsPlayStartPosition](self, "metricsPlayStartPosition"), v8 = a3 - v7, v8 < 0.5))
    {
LABEL_40:

      return;
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[MTReachability sharedInstance](MTReachability, "sharedInstance"));
    v10 = objc_msgSend(v9, "isReachable") ^ 1;

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[MTAccountController sharedInstance](MTAccountController, "sharedInstance"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "activeAccount"));
    v13 = v12 != 0;

    v78[0] = CFSTR("com.apple.podcasts");
    v77[0] = CFSTR("app");
    v77[1] = CFSTR("playStartTime");
    v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", -[MTPlayerController metricsPlayStartTime](self, "metricsPlayStartTime")));
    v78[1] = v62;
    v77[2] = CFSTR("playStartPosition");
    -[MTPlayerController metricsPlayStartPosition](self, "metricsPlayStartPosition");
    v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    v78[2] = v61;
    v77[3] = CFSTR("playDuration");
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v8));
    v78[3] = v14;
    v77[4] = CFSTR("playbackSpeed");
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController player](self, "player"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v15, "playbackSpeed")));
    v78[4] = v16;
    v77[5] = CFSTR("contentType");
    v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "priceType"));
    v18 = (void *)v17;
    v19 = &stru_1004C6D40;
    if (v17)
      v19 = (const __CFString *)v17;
    v78[5] = v19;
    v77[6] = CFSTR("isOffline");
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v10));
    v78[6] = v20;
    v77[7] = CFSTR("isSignedIn");
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v13));
    v78[7] = v21;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v78, v77, 8));
    v23 = objc_msgSend(v22, "mutableCopy");

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[MetricsActivity shared](_TtC8ShelfKit15MetricsActivity, "shared"));
    v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "playContext"));
    v26 = (void *)v25;
    if (v25)
      v27 = (const __CFString *)v25;
    else
      v27 = &stru_1004C6D40;
    objc_msgSend(v23, "setObject:forKeyedSubscript:", v27, CFSTR("playContext"));

    v28 = (void *)objc_claimAutoreleasedReturnValue(+[MetricsActivity shared](_TtC8ShelfKit15MetricsActivity, "shared"));
    v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "stopContext"));
    v30 = (void *)v29;
    if (v29)
      v31 = (const __CFString *)v29;
    else
      v31 = &stru_1004C6D40;
    objc_msgSend(v23, "setObject:forKeyedSubscript:", v31, CFSTR("stopReason"));

    v32 = (void *)objc_claimAutoreleasedReturnValue(+[MetricsActivity shared](_TtC8ShelfKit15MetricsActivity, "shared"));
    v33 = objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "stopType"));
    v34 = (void *)v33;
    if (v33)
      v35 = (const __CFString *)v33;
    else
      v35 = &stru_1004C6D40;
    objc_msgSend(v23, "setObject:forKeyedSubscript:", v35, CFSTR("stopType"));

    NSLog(CFSTR("!!! Clearing stopInfo"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[MetricsActivity shared](_TtC8ShelfKit15MetricsActivity, "shared"));
    objc_msgSend(v36, "clearStopInfo");

    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "stringForKey:", CFSTR("canary")));

    if (objc_msgSend(v38, "length"))
      objc_msgSend(v23, "setObject:forKeyedSubscript:", v38, CFSTR("canary"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController highlightsProvider](self, "highlightsProvider"));
    if ((objc_msgSend(v39, "isSharedContentWithContentAdamId:", objc_msgSend(v6, "episodeStoreId")) & 1) == 0)
    {
      v40 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController highlightsProvider](self, "highlightsProvider"));
      if (!objc_msgSend(v40, "isSharedContentWithContentAdamId:", objc_msgSend(v6, "podcastStoreId")))
      {
        v47 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController highlightsProvider](self, "highlightsProvider"));
        v48 = objc_msgSend(v47, "isSharedContentWithContentAdamId:", objc_msgSend(v6, "channelStoreId"));

        if ((v48 & 1) == 0)
          goto LABEL_23;
        goto LABEL_22;
      }

    }
LABEL_22:
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
    objc_msgSend(v23, "setObject:forKeyedSubscript:", v41, CFSTR("sharedContent"));

LABEL_23:
    if (objc_msgSend(v6, "isAppleMusicEpisode"))
    {
      v66 = 0;
      v42 = (void *)objc_claimAutoreleasedReturnValue(+[MTMusicSubscriptionInfoLoader loadIfNeededAndReturnError:](MTMusicSubscriptionInfoLoader, "loadIfNeededAndReturnError:", &v66));
      v43 = v66;
      if (v43)
      {
        v44 = _MTLogCategoryMetrics();
        v45 = objc_claimAutoreleasedReturnValue(v44);
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v68 = v43;
          _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "Unable to get Music Subscription Info with error: %@", buf, 0xCu);
        }

      }
      else
      {
        objc_msgSend(v23, "setObject:forKeyedSubscript:", v42, CFSTR("musicSubscriptionData"));
      }

    }
    else if (objc_msgSend(v6, "isAppleNewsEpisode"))
    {
      if (objc_msgSend(v6, "paidSubscriptionActive"))
        v46 = CFSTR("news+");
      else
        v46 = CFSTR("none");
      objc_msgSend(v23, "setObject:forKeyedSubscript:", v46, CFSTR("newsSubscriptionData"));
    }
    v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)-[MTPlayerController metricsPlayStartTime](self, "metricsPlayStartTime") / 1000.0));
    v50 = _MTLogCategoryMetrics();
    v51 = objc_claimAutoreleasedReturnValue(v50);
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      v52 = (void *)objc_claimAutoreleasedReturnValue(+[AMSDefaults metricsCanaryIdentifier](AMSDefaults, "metricsCanaryIdentifier"));
      -[MTPlayerController metricsPlayStartPosition](self, "metricsPlayStartPosition");
      v54 = v53;
      v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "title"));
      *(_DWORD *)buf = 138413314;
      v68 = v52;
      v69 = 2112;
      v70 = v49;
      v71 = 2048;
      v72 = v54;
      v73 = 2048;
      v74 = v8;
      v75 = 2112;
      v76 = v55;
      _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "canary: %@, playStartTime: %@, playStartPosition: %f, playDuration: %f, item: %@", buf, 0x34u);

    }
    v56 = -[MTEpisodeMetricDataSource initWithPlayerItem:]([MTEpisodeMetricDataSource alloc], "initWithPlayerItem:", v6);
    v57 = (void *)objc_claimAutoreleasedReturnValue(+[AnalyticsIdentifierManager sharedInstance](_TtC18PodcastsFoundation26AnalyticsIdentifierManager, "sharedInstance"));
    v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "identifierPromise"));
    v63[0] = _NSConcreteStackBlock;
    v63[1] = 3221225472;
    v63[2] = sub_100113C44;
    v63[3] = &unk_1004A6878;
    v64 = v23;
    v65 = v56;
    v59 = v56;
    v60 = v23;
    objc_msgSend(v58, "addFinishBlock:", v63);

    goto LABEL_40;
  }
}

- (void)recordMetricsForCurrentItem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  MTPlayerController *v19;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController currentItem](self, "currentItem"));
  v4 = v3;
  if (v3 && (objc_msgSend(v3, "isPlaceholder") & 1) == 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController player](self, "player"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "playerItem"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController recordedPlayEventsForCurrentItem](self, "recordedPlayEventsForCurrentItem"));
    objc_sync_enter(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "url"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController lastRecordedItemURL](self, "lastRecordedItemURL"));
    v10 = objc_msgSend(v9, "isEqual:", v8);

    if ((v10 & 1) == 0)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController recordedPlayEventsForCurrentItem](self, "recordedPlayEventsForCurrentItem"));
      objc_msgSend(v11, "removeAllObjects");

      -[MTPlayerController setLastRecordedItemURL:](self, "setLastRecordedItemURL:", v8);
    }

    objc_sync_exit(v7);
    if (v6)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "privateQueueContext"));

      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_100113F48;
      v15[3] = &unk_1004A6C78;
      v16 = v6;
      v17 = v13;
      v18 = v4;
      v19 = self;
      v14 = v13;
      objc_msgSend(v14, "performBlock:", v15);

    }
  }

}

- (void)recordMetricsEventForAccessLog:(id)a3 playerItem:(id)a4
{
  id v6;
  MTEpisodeMetricDataSource *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  if ((objc_msgSend(v6, "isPlaceholder") & 1) == 0)
  {
    v7 = -[MTEpisodeMetricDataSource initWithPlayerItem:]([MTEpisodeMetricDataSource alloc], "initWithPlayerItem:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MTPlayMetricsEvent eventWithAccessLog:dataSource:](MTPlayMetricsEvent, "eventWithAccessLog:dataSource:", v13, v7));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController recordedPlayEventsForCurrentItem](self, "recordedPlayEventsForCurrentItem"));
    objc_sync_enter(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController recordedPlayEventsForCurrentItem](self, "recordedPlayEventsForCurrentItem"));
    v11 = objc_msgSend(v10, "containsObject:", v8);

    if ((v11 & 1) == 0)
    {
      objc_msgSend(v8, "record");
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController recordedPlayEventsForCurrentItem](self, "recordedPlayEventsForCurrentItem"));
      objc_msgSend(v12, "addObject:", v8);

    }
    objc_sync_exit(v9);

  }
}

- (void)recordMetricsEventForErrorLog:(id)a3 withEpisode:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char isKindOfClass;
  _UNKNOWN **v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  const __CFString *v24;
  uint64_t v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[7];
  _QWORD v33[7];

  v5 = a3;
  v32[0] = CFSTR("date");
  v6 = a4;
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "date"));
  v8 = objc_opt_class(NSDate);
  v9 = objc_opt_class(v8);
  v31 = (void *)v7;
  isKindOfClass = objc_opt_isKindOfClass(v7, v9);
  if ((isKindOfClass & 1) != 0)
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "date"));
    objc_msgSend(v29, "timeIntervalSinceReferenceDate");
    v11 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  }
  else
  {
    v11 = &off_1004D60B8;
  }
  v30 = v11;
  v33[0] = v11;
  v32[1] = CFSTR("uri");
  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "URI"));
  v13 = (void *)v12;
  if (v12)
    v14 = (const __CFString *)v12;
  else
    v14 = &stru_1004C6D40;
  v33[1] = v14;
  v32[2] = CFSTR("server_address");
  v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "serverAddress"));
  v16 = (void *)v15;
  if (v15)
    v17 = (const __CFString *)v15;
  else
    v17 = &stru_1004C6D40;
  v33[2] = v17;
  v32[3] = CFSTR("playback_session_id");
  v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "playbackSessionID"));
  v19 = (void *)v18;
  if (v18)
    v20 = (const __CFString *)v18;
  else
    v20 = &stru_1004C6D40;
  v33[3] = v20;
  v32[4] = CFSTR("error_status_code");
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v5, "errorStatusCode")));
  v33[4] = v21;
  v32[5] = CFSTR("error_domain");
  v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "errorDomain"));
  v23 = (void *)v22;
  if (v22)
    v24 = (const __CFString *)v22;
  else
    v24 = &stru_1004C6D40;
  v33[5] = v24;
  v32[6] = CFSTR("error_comment");
  v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "errorComment"));
  v26 = (void *)v25;
  if (v25)
    v27 = (const __CFString *)v25;
  else
    v27 = &stru_1004C6D40;
  v33[6] = v27;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v33, v32, 7));
  +[IMMetrics recordUserAction:dataSource:withData:](IMMetrics, "recordUserAction:dataSource:withData:", CFSTR("play_error"), v6, v28);

  if ((isKindOfClass & 1) != 0)
  {

  }
}

- (void)userActivity:(id)a3 didReceiveInputStream:(id)a4 outputStream:(id)a5
{
  void *v6;
  id v7;

  v7 = a5;
  -[MTPlayerController reportStopReason:withInitiator:](self, "reportStopReason:withInitiator:", 6, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController player](self, "player"));
  objc_msgSend(v6, "pause");

  objc_msgSend(v7, "close");
}

- (void)reportStopReason:(unint64_t)a3 withInitiator:(unint64_t)a4
{
  void *v6;
  id v7;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MetricsActivity shared](_TtC8ShelfKit15MetricsActivity, "shared"));
  objc_msgSend(v6, "setStopReason:", a3);

  v7 = (id)objc_claimAutoreleasedReturnValue(+[MetricsActivity shared](_TtC8ShelfKit15MetricsActivity, "shared"));
  objc_msgSend(v7, "setInitiator:", a4);

}

- (void)updateUPPEpisodeUuid:(id)a3 bookmarkTime:(double)a4
{
  void *v6;
  void *v7;
  unsigned int v8;
  id v9;

  v9 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController currentItem](self, "currentItem"));
  if (v6)
  {
    if (!-[MTPlayerController isPlayingLocally](self, "isPlayingLocally"))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "episodeUuid"));
      v8 = objc_msgSend(v9, "isEqualToString:", v7);

      if (v8)
        -[MTPlayerController setCurrentTime:](self, "setCurrentTime:", a4);
    }
  }

}

- (MTPlayerFailureDialogProxy)dialogProxy
{
  return (MTPlayerFailureDialogProxy *)objc_loadWeakRetained((id *)&self->_dialogProxy);
}

- (void)setDialogProxy:(id)a3
{
  objc_storeWeak((id *)&self->_dialogProxy, a3);
}

- (MPCPlayerPath)playerPath
{
  return self->_playerPath;
}

- (void)setPlayerPath:(id)a3
{
  objc_storeStrong((id *)&self->_playerPath, a3);
}

- (BOOL)isPlayingFullScreenVideo
{
  return self->_isPlayingFullScreenVideo;
}

- (void)setIsPlayingFullScreenVideo:(BOOL)a3
{
  self->_isPlayingFullScreenVideo = a3;
}

- (HighlightsProviderObjCProtocol)highlightsProvider
{
  return self->_highlightsProvider;
}

- (MTNowPlayingArtworkProvider)artworkProvider
{
  return self->_artworkProvider;
}

- (id)platformSyncPlayheadChangeObserverBlock
{
  return self->_platformSyncPlayheadChangeObserverBlock;
}

- (NSString)previousPlayingEpisodeUuid
{
  return self->_previousPlayingEpisodeUuid;
}

- (void)setPreviousPlayingEpisodeUuid:(id)a3
{
  objc_storeStrong((id *)&self->_previousPlayingEpisodeUuid, a3);
}

- (BOOL)hasReportedThisEpisode
{
  return self->_hasReportedThisEpisode;
}

- (int64_t)metricsPlayStartTime
{
  return self->_metricsPlayStartTime;
}

- (double)metricsPlayStartPosition
{
  return self->_metricsPlayStartPosition;
}

- (MTPlaybackPositionController)playbackPositionController
{
  return self->_playbackPositionController;
}

- (void)setPlaybackPositionController:(id)a3
{
  objc_storeStrong((id *)&self->_playbackPositionController, a3);
}

- (double)lastPlaybackPositionSaveTime
{
  return self->_lastPlaybackPositionSaveTime;
}

- (void)setLastPlaybackPositionSaveTime:(double)a3
{
  self->_lastPlaybackPositionSaveTime = a3;
}

- (MTMediaRemoteController)mediaRemoteController
{
  return self->_mediaRemoteController;
}

- (BOOL)shouldFindSomethingToPlay
{
  return self->_shouldFindSomethingToPlay;
}

- (void)setShouldFindSomethingToPlay:(BOOL)a3
{
  self->_shouldFindSomethingToPlay = a3;
}

- (OS_dispatch_queue)dataAccessQueue
{
  return self->_dataAccessQueue;
}

- (OS_dispatch_queue)loadQueue
{
  return self->_loadQueue;
}

- (NSTimer)setPlaybackQueueRequestTimeoutTimer
{
  return self->_setPlaybackQueueRequestTimeoutTimer;
}

- (void)setSetPlaybackQueueRequestTimeoutTimer:(id)a3
{
  objc_storeStrong((id *)&self->_setPlaybackQueueRequestTimeoutTimer, a3);
}

- (NSMutableSet)recordedPlayEventsForCurrentItem
{
  return self->_recordedPlayEventsForCurrentItem;
}

- (NSURL)lastRecordedItemURL
{
  return self->_lastRecordedItemURL;
}

- (void)setLastRecordedItemURL:(id)a3
{
  objc_storeStrong((id *)&self->_lastRecordedItemURL, a3);
}

- (MTCoreDataKeyRequestStorage)keyStorage
{
  return self->_keyStorage;
}

- (MTSecureDownloadRenewalManager)secureDownloadRenewalManager
{
  return self->_secureDownloadRenewalManager;
}

- (PFFairPlayValidationManager)validationManager
{
  return self->_validationManager;
}

- (PFFairPlayInvalidationManager)invalidationManager
{
  return self->_invalidationManager;
}

- (MTPropertyChangeQueryObserver)transcriptIdentifierObserver
{
  return self->_transcriptIdentifierObserver;
}

- (void)setTranscriptIdentifierObserver:(id)a3
{
  objc_storeStrong((id *)&self->_transcriptIdentifierObserver, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transcriptIdentifierObserver, 0);
  objc_storeStrong((id *)&self->_invalidationManager, 0);
  objc_storeStrong((id *)&self->_validationManager, 0);
  objc_storeStrong((id *)&self->_secureDownloadRenewalManager, 0);
  objc_storeStrong((id *)&self->_keyStorage, 0);
  objc_storeStrong((id *)&self->_lastRecordedItemURL, 0);
  objc_storeStrong((id *)&self->_recordedPlayEventsForCurrentItem, 0);
  objc_storeStrong((id *)&self->_setPlaybackQueueRequestTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_restorationCompletions, 0);
  objc_storeStrong((id *)&self->_loadQueue, 0);
  objc_storeStrong((id *)&self->_dataAccessQueue, 0);
  objc_storeStrong((id *)&self->_restorationQueue, 0);
  objc_storeStrong((id *)&self->_currentActivity, 0);
  objc_storeStrong((id *)&self->_mediaRemoteController, 0);
  objc_storeStrong((id *)&self->_playbackPositionController, 0);
  objc_storeStrong((id *)&self->_previousPlayingEpisodeUuid, 0);
  objc_storeStrong(&self->_platformSyncPlayheadChangeObserverBlock, 0);
  objc_storeStrong((id *)&self->_artworkProvider, 0);
  objc_storeStrong((id *)&self->_highlightsProvider, 0);
  objc_storeStrong((id *)&self->_userManifest, 0);
  objc_storeStrong((id *)&self->_upNextManifest, 0);
  objc_storeStrong((id *)&self->_compositeManifest, 0);
  objc_storeStrong((id *)&self->_playbackQueueController, 0);
  objc_storeStrong((id *)&self->_upNextController, 0);
  objc_storeStrong((id *)&self->_playerPath, 0);
  objc_storeStrong((id *)&self->_player, 0);
  objc_destroyWeak((id *)&self->_dialogProxy);
}

@end
