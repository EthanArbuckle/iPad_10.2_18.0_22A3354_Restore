@implementation MTFeedUpdateManager

- (void)updateAllPodcastsNeedingRetry:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[MTFeedUpdateManager workQueue](self, "workQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100013B68;
  v7[3] = &unk_1004A63C8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)updateAllPodcastsUserInitiated:(BOOL)a3 forced:(BOOL)a4 source:(int64_t)a5 started:(id)a6
{
  id v10;
  NSObject *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  int64_t v15;
  BOOL v16;
  BOOL v17;

  v10 = a6;
  v11 = objc_claimAutoreleasedReturnValue(-[MTFeedUpdateManager workQueue](self, "workQueue"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100047F34;
  v13[3] = &unk_1004AA948;
  v16 = a3;
  v17 = a4;
  v14 = v10;
  v15 = a5;
  v13[4] = self;
  v12 = v10;
  dispatch_async(v11, v13);

}

- (MTFeedUpdateManager)init
{
  MTFeedUpdateManager *v2;
  uint64_t v3;
  MTFeedManager *feedManager;
  dispatch_queue_t v5;
  OS_dispatch_queue *workQueue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MTFeedUpdateManager;
  v2 = -[MTFeedUpdateManager init](&v8, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[MTFeedManager sharedInstance](MTFeedManager, "sharedInstance"));
    feedManager = v2->_feedManager;
    v2->_feedManager = (MTFeedManager *)v3;

    v5 = dispatch_queue_create("MTFeedUpdateManagerQueue", 0);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v5;

  }
  return v2;
}

- (void)_updateAllPodcastsUserInitiated:(BOOL)a3 forced:(BOOL)a4 useBackgroundFetch:(BOOL)a5 source:(int64_t)a6 startedUpdatesCallback:(id)a7
{
  _BOOL8 v8;
  _BOOL8 v9;
  _BOOL8 v10;
  id v12;
  _QWORD *v13;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  void *v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  _QWORD v27[5];
  id v28;
  int64_t v29;
  BOOL v30;
  BOOL v31;
  BOOL v32;
  uint8_t buf[8];
  _QWORD v34[4];
  id v35;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_1000EE0E4;
  v34[3] = &unk_1004A7948;
  v12 = a7;
  v35 = v12;
  v13 = objc_retainBlock(v34);
  if (sub_10004155C())
  {
    v14 = _MTLogCategoryFeedUpdate();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v16 = "Skipping feed update: disabled";
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, v16, buf, 2u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTFeedUpdateManager feedManager](self, "feedManager"));
  v18 = objc_msgSend(v17, "abortUpdatesIfNetworkUnreachable:", v10);

  if (v18)
  {
    v21 = _MTLogCategoryFeedUpdate();
    v15 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v16 = "Skipping feed update due to network not being reachable";
      goto LABEL_7;
    }
LABEL_8:

    ((void (*)(_QWORD *, _QWORD))v13[2])(v13, 0);
    goto LABEL_9;
  }
  if ((os_feature_enabled_batch_feed_fetch(v19, v20) & 1) != 0)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[IMURLBag sharedInstance](IMURLBag, "sharedInstance"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "batchFeedFetchIsEnabled"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[MTFeedUpdateManager workQueue](self, "workQueue"));
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_1000EE170;
    v27[3] = &unk_1004AABC8;
    v30 = v10;
    v31 = v9;
    v32 = v8;
    v27[4] = self;
    v29 = a6;
    v28 = v12;
    objc_msgSend(v22, "asyncValueOnQueue:withCompletion:", v23, v27);

  }
  else
  {
    v24 = _MTLogCategoryFeedUpdate();
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Batch fetch ff is off. Updating all podcasts through legacy path.", buf, 2u);
    }

    -[MTFeedUpdateManager _unsafe_updateAllPodcastsUserInitiated:forced:useBackgroundFetch:source:startedUpdatesCallback:](self, "_unsafe_updateAllPodcastsUserInitiated:forced:useBackgroundFetch:source:startedUpdatesCallback:", v10, v9, v8, a6, v12);
  }
LABEL_9:

}

- (void)_updatePodcastsWithUUIDs:(id)a3 userInitiated:(BOOL)a4 forced:(BOOL)a5 useBackgroundFetch:(BOOL)a6 source:(int64_t)a7 startedUpdatesCallback:(id)a8
{
  id v14;
  id v15;
  _QWORD *v16;
  NSObject *v17;
  id v18;
  _QWORD *v19;
  _QWORD v20[5];
  id v21;
  id v22;
  int64_t v23;
  BOOL v24;
  BOOL v25;
  BOOL v26;
  _QWORD v27[4];
  id v28;

  v14 = a3;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100016DD8;
  v27[3] = &unk_1004A7948;
  v28 = a8;
  v15 = v28;
  v16 = objc_retainBlock(v27);
  v17 = objc_claimAutoreleasedReturnValue(-[MTFeedUpdateManager workQueue](self, "workQueue"));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100040ECC;
  v20[3] = &unk_1004AAC40;
  v24 = a4;
  v20[4] = self;
  v21 = v14;
  v25 = a5;
  v26 = a6;
  v22 = v16;
  v23 = a7;
  v18 = v14;
  v19 = v16;
  dispatch_async(v17, v20);

}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (BOOL)isPodcastUpdatable:(id)a3 userInitiated:(BOOL)a4 forced:(BOOL)a5
{
  _BOOL4 v6;
  id v7;
  void *v8;
  unsigned __int8 v9;
  void *v11;

  v6 = a4;
  v7 = a3;
  v8 = v7;
  if (v7 && (!objc_msgSend(v7, "isImplicitlyFollowed") || v6))
  {
    v9 = 1;
    if (!v6 && !a5)
    {
      if (+[MTStoreIdentifier isNotEmpty:](MTStoreIdentifier, "isNotEmpty:", objc_msgSend(v8, "storeCollectionId"))&& ((objc_msgSend(v8, "importing") & 1) != 0|| (objc_msgSend(v8, "feedUpdateNeedsRetry") & 1) != 0))
      {
        v9 = 1;
      }
      else
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[MTPodcast predicateForPeriodicallyUpdatablePodcasts](MTPodcast, "predicateForPeriodicallyUpdatablePodcasts"));
        v9 = objc_msgSend(v11, "evaluateWithObject:", v8);

      }
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)_updatePodcastWithUUID:(id)a3 userInitiated:(BOOL)a4 forced:(BOOL)a5 useBackgroundFetch:(BOOL)a6 source:(int64_t)a7 startedUpdateCallback:(id)a8
{
  -[MTFeedUpdateManager _updatePodcastWithUUID:userInitiated:forced:useBackgroundFetch:source:tryRedirectURL:startedUpdateCallback:](self, "_updatePodcastWithUUID:userInitiated:forced:useBackgroundFetch:source:tryRedirectURL:startedUpdateCallback:", a3, a4, a5, a6, a7, 1, a8);
}

- (void)_updatePodcastWithUUID:(id)a3 userInitiated:(BOOL)a4 forced:(BOOL)a5 useBackgroundFetch:(BOOL)a6 source:(int64_t)a7 tryRedirectURL:(BOOL)a8 startedUpdateCallback:(id)a9
{
  uint64_t v9;

  LOBYTE(v9) = a8;
  -[MTFeedUpdateManager _updatePodcastWithUUID:triggerBy:userInitiated:forced:forceBootstrap:useBackgroundFetch:source:tryRedirectURL:startedUpdateCallback:completion:](self, "_updatePodcastWithUUID:triggerBy:userInitiated:forced:forceBootstrap:useBackgroundFetch:source:tryRedirectURL:startedUpdateCallback:completion:", a3, 0, a4, a5, 0, a6, a7, v9, a9, 0);
}

- (void)_updatePodcastWithUUID:(id)a3 triggerBy:(id)a4 userInitiated:(BOOL)a5 forced:(BOOL)a6 forceBootstrap:(BOOL)a7 useBackgroundFetch:(BOOL)a8 source:(int64_t)a9 tryRedirectURL:(BOOL)a10 startedUpdateCallback:(id)a11 completion:(id)a12
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD *v19;
  id v20;
  _QWORD *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  _QWORD v30[4];
  id v31;
  id v32;
  MTFeedUpdateManager *v33;
  id v34;
  _QWORD *v35;
  _QWORD *v36;
  id v37;
  _QWORD *v38;
  _QWORD *v39;
  _QWORD *v40;
  _QWORD *v41;
  int64_t v42;
  BOOL v43;
  BOOL v44;
  BOOL v45;
  BOOL v46;
  BOOL v47;
  _QWORD v48[4];
  _QWORD v49[5];
  id v50;
  _QWORD v51[5];
  id v52;
  _QWORD v53[3];
  char v54;
  _QWORD v55[4];
  id v56;
  id v57;
  _QWORD v58[4];
  id v59;

  v14 = a3;
  v15 = a4;
  v16 = a11;
  v17 = a12;
  v58[0] = _NSConcreteStackBlock;
  v58[1] = 3221225472;
  v58[2] = sub_1000377F0;
  v58[3] = &unk_1004A66E0;
  v18 = v16;
  v59 = v18;
  v55[0] = _NSConcreteStackBlock;
  v55[1] = 3221225472;
  v55[2] = sub_100037748;
  v55[3] = &unk_1004AAC68;
  v19 = objc_retainBlock(v58);
  v56 = v19;
  v20 = v17;
  v57 = v20;
  v21 = objc_retainBlock(v55);
  if (sub_10004155C())
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[FeedUpdaterObjcError feedUpdatesDisabled](_TtC18PodcastsFoundation20FeedUpdaterObjcError, "feedUpdatesDisabled"));
    ((void (*)(_QWORD *, void *))v21[2])(v21, v22);

  }
  else
  {
    v53[0] = 0;
    v53[1] = v53;
    v53[2] = 0x2020000000;
    v54 = 1;
    v51[0] = 0;
    v51[1] = v51;
    v51[2] = 0x3032000000;
    v51[3] = sub_1000467FC;
    v51[4] = sub_100046A74;
    v52 = 0;
    v49[0] = 0;
    v49[1] = v49;
    v49[2] = 0x3032000000;
    v49[3] = sub_1000467FC;
    v49[4] = sub_100046A74;
    v50 = 0;
    v48[0] = 0;
    v48[1] = v48;
    v48[2] = 0x2020000000;
    v48[3] = 0;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "importContext"));

    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_100037218;
    v30[3] = &unk_1004AACB8;
    v25 = v24;
    v31 = v25;
    v32 = v14;
    v33 = self;
    v43 = a5;
    v44 = a6;
    v38 = v53;
    v39 = v51;
    v45 = a10;
    v40 = v48;
    v41 = v49;
    v46 = a8;
    v42 = a9;
    v35 = v21;
    v36 = v19;
    v34 = v15;
    v47 = a7;
    v37 = v20;
    objc_msgSend(v25, "performBlock:", v30);

    _Block_object_dispose(v48, 8);
    _Block_object_dispose(v49, 8);

    _Block_object_dispose(v51, 8);
    _Block_object_dispose(v53, 8);
  }

}

- (MTFeedManager)feedManager
{
  return self->_feedManager;
}

- (void)updateAllPodcastsInBackgroundWithSource:(int64_t)a3 started:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  _QWORD block[5];
  id v13;
  int64_t v14;
  uint8_t buf[4];
  int64_t v16;

  v6 = a4;
  v7 = v6;
  if (a3)
  {
    v8 = _MTLogCategoryFeedUpdate(v6);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v16 = a3;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Updating all podcasts with non background source. %ld.", buf, 0xCu);
    }

  }
  v10 = objc_claimAutoreleasedReturnValue(-[MTFeedUpdateManager workQueue](self, "workQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000EBDE4;
  block[3] = &unk_1004A6918;
  v13 = v7;
  v14 = a3;
  block[4] = self;
  v11 = v7;
  dispatch_async(v10, block);

}

- (void)_fetchMediaAPIShowsExpectedToUpdate:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "importContext"));

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000EBEB4;
  v8[3] = &unk_1004A63C8;
  v9 = v5;
  v10 = v3;
  v6 = v3;
  v7 = v5;
  objc_msgSend(v7, "performBlock:", v8);

}

- (void)updateMediaAPIPodcastsExpectedToUpdateWithLimit:(int64_t)a3 started:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  int64_t v11;

  v6 = a4;
  v7 = objc_claimAutoreleasedReturnValue(-[MTFeedUpdateManager workQueue](self, "workQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000EC678;
  block[3] = &unk_1004A6918;
  v10 = v6;
  v11 = a3;
  block[4] = self;
  v8 = v6;
  dispatch_async(v7, block);

}

- (void)updateMediaAPIPodcastsExpectedToUpdate:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[MTFeedUpdateManager workQueue](self, "workQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000ECBB0;
  v7[3] = &unk_1004A63C8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_updateAllMediaAPIPodcastsUserInitiated:(BOOL)a3 source:(int64_t)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v7;
  _QWORD v8[5];
  id v9;
  int64_t v10;
  BOOL v11;

  v6 = a3;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000ECEFC;
  v8[3] = &unk_1004AAA38;
  v8[4] = self;
  v9 = a5;
  v11 = v6;
  v10 = a4;
  v7 = v9;
  +[BatchFeedRequestController fetchOutOfDateShowUUIDsWithIncludeImplicit:completionHandler:](_TtC18PodcastsFoundation26BatchFeedRequestController, "fetchOutOfDateShowUUIDsWithIncludeImplicit:completionHandler:", v6, v8);

}

- (void)updateAllMediaAPIPodcastsWithSource:(int64_t)a3 started:(id)a4
{
  id v6;
  _QWORD v7[4];
  id v8;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000ED190;
  v7[3] = &unk_1004AAA60;
  v8 = a4;
  v6 = v8;
  -[MTFeedUpdateManager _updateAllMediaAPIPodcastsUserInitiated:source:completion:](self, "_updateAllMediaAPIPodcastsUserInitiated:source:completion:", 0, a3, v7);

}

- (void)_updateAllNonMediaAPIPodcastsUserInitiated:(BOOL)a3 forced:(BOOL)a4 source:(int64_t)a5 started:(id)a6
{
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  MTFeedUpdateManager *v16;
  id v17;
  BOOL v18;
  BOOL v19;

  v9 = a6;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "importContext"));

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000ED274;
  v14[3] = &unk_1004AAA88;
  v18 = a3;
  v15 = v11;
  v16 = self;
  v19 = a4;
  v17 = v9;
  v12 = v9;
  v13 = v11;
  objc_msgSend(v13, "performBlock:", v14);

}

- (void)updateAllNonMediaAPIPodcastsWithSource:(int64_t)a3 started:(id)a4
{
  -[MTFeedUpdateManager _updateAllNonMediaAPIPodcastsUserInitiated:forced:source:started:](self, "_updateAllNonMediaAPIPodcastsUserInitiated:forced:source:started:", 0, 0, a3, a4);
}

- (void)updatePodcastsWithUUIDs:(id)a3 userInitiated:(BOOL)a4 source:(int64_t)a5 started:(id)a6
{
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  int64_t v18;
  BOOL v19;

  v10 = a3;
  v11 = a6;
  v12 = objc_claimAutoreleasedReturnValue(-[MTFeedUpdateManager workQueue](self, "workQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000ED6B4;
  block[3] = &unk_1004AAA10;
  block[4] = self;
  v16 = v10;
  v19 = a4;
  v17 = v11;
  v18 = a5;
  v13 = v11;
  v14 = v10;
  dispatch_async(v12, block);

}

- (void)updatePodcastWithUUID:(id)a3 userInitiated:(BOOL)a4 source:(int64_t)a5 completion:(id)a6
{
  -[MTFeedUpdateManager _updatePodcastWithUUID:triggerBy:userInitiated:forced:forceBootstrap:source:completion:](self, "_updatePodcastWithUUID:triggerBy:userInitiated:forced:forceBootstrap:source:completion:", a3, 0, a4, 0, 0, a5, a6);
}

- (void)updatePodcastWithUUID:(id)a3 userInitiated:(BOOL)a4 forced:(BOOL)a5 forceBootstrap:(BOOL)a6 source:(int64_t)a7 completion:(id)a8
{
  -[MTFeedUpdateManager _updatePodcastWithUUID:triggerBy:userInitiated:forced:forceBootstrap:source:completion:](self, "_updatePodcastWithUUID:triggerBy:userInitiated:forced:forceBootstrap:source:completion:", a3, 0, a4, a5, a6, a7, a8);
}

- (void)_updatePodcastWithUUID:(id)a3 triggerBy:(id)a4 userInitiated:(BOOL)a5 forced:(BOOL)a6 forceBootstrap:(BOOL)a7 source:(int64_t)a8 completion:(id)a9
{
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  int64_t v26;
  BOOL v27;
  BOOL v28;
  BOOL v29;

  v15 = a3;
  v16 = a4;
  v17 = a9;
  v18 = objc_claimAutoreleasedReturnValue(-[MTFeedUpdateManager workQueue](self, "workQueue"));
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1000ED84C;
  v22[3] = &unk_1004AAAB0;
  v27 = a5;
  v28 = a6;
  v22[4] = self;
  v23 = v15;
  v24 = v16;
  v25 = v17;
  v29 = a7;
  v26 = a8;
  v19 = v16;
  v20 = v15;
  v21 = v17;
  dispatch_async(v18, v22);

}

- (void)updatePodcastWithStoreId:(int64_t)a3 triggerBy:(id)a4 userInitiated:(BOOL)a5 forced:(BOOL)a6 source:(int64_t)a7 completion:(id)a8
{
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  int64_t v24;
  int64_t v25;
  BOOL v26;
  BOOL v27;

  v13 = a4;
  v14 = a8;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "importContext"));

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000EDAD8;
  v20[3] = &unk_1004AAAD8;
  v23 = v14;
  v24 = a3;
  v21 = v16;
  v22 = v13;
  v26 = a5;
  v27 = a6;
  v25 = a7;
  v17 = v13;
  v18 = v14;
  v19 = v16;
  objc_msgSend(v19, "performBlock:", v20);

}

- (void)_updatePodcastWithUUID:(id)a3 userInitiated:(BOOL)a4 useBackgroundFetch:(BOOL)a5 source:(int64_t)a6
{
  -[MTFeedUpdateManager _updatePodcastWithUUID:userInitiated:forced:useBackgroundFetch:source:startedUpdateCallback:](self, "_updatePodcastWithUUID:userInitiated:forced:useBackgroundFetch:source:startedUpdateCallback:", a3, a4, 0, a5, a6, 0);
}

- (void)_updatePodcastWithUUID:(id)a3 userInitiated:(BOOL)a4 useBackgroundFetch:(BOOL)a5 source:(int64_t)a6 tryRedirectURL:(BOOL)a7
{
  -[MTFeedUpdateManager _updatePodcastWithUUID:userInitiated:forced:useBackgroundFetch:source:tryRedirectURL:startedUpdateCallback:](self, "_updatePodcastWithUUID:userInitiated:forced:useBackgroundFetch:source:tryRedirectURL:startedUpdateCallback:", a3, a4, 0, a5, a6, a7, 0);
}

- (BOOL)isPodcastUpdatable:(id)a3 userInitiated:(BOOL)a4
{
  return -[MTFeedUpdateManager isPodcastUpdatable:userInitiated:forced:](self, "isPodcastUpdatable:userInitiated:forced:", a3, a4, 0);
}

- (void)_unsafe_updateAllPodcastsUserInitiated:(BOOL)a3 forced:(BOOL)a4 useBackgroundFetch:(BOOL)a5 source:(int64_t)a6 startedUpdatesCallback:(id)a7
{
  _BOOL4 v10;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  MTFeedUpdateManager *v23;
  id v24;
  _QWORD *v25;
  int64_t v26;
  BOOL v27;
  BOOL v28;
  BOOL v29;
  _QWORD v30[5];
  id v31;

  v10 = a3;
  v12 = a7;
  if (v10)
    v13 = objc_claimAutoreleasedReturnValue(+[MTPodcast predicateForNotHiddenPodcasts](MTPodcast, "predicateForNotHiddenPodcasts"));
  else
    v13 = objc_claimAutoreleasedReturnValue(+[MTPodcast predicateForNotHiddenNotImplicitlyFollowedPodcasts](MTPodcast, "predicateForNotHiddenNotImplicitlyFollowedPodcasts"));
  v14 = (void *)v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "importContext"));

  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = sub_1000467FC;
  v30[4] = sub_100046A74;
  v31 = 0;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000EDE68;
  v20[3] = &unk_1004AAB28;
  v17 = v16;
  v21 = v17;
  v18 = v14;
  v22 = v18;
  v23 = self;
  v27 = v10;
  v28 = a4;
  v29 = a5;
  v25 = v30;
  v26 = a6;
  v19 = v12;
  v24 = v19;
  objc_msgSend(v17, "performBlock:", v20);

  _Block_object_dispose(v30, 8);
}

- (void)_updatePodcastsWithUUIDs:(id)a3 userInitiated:(BOOL)a4 useBackgroundFetch:(BOOL)a5 source:(int64_t)a6 startedUpdatesCallback:(id)a7
{
  -[MTFeedUpdateManager _updatePodcastsWithUUIDs:userInitiated:forced:useBackgroundFetch:source:startedUpdatesCallback:](self, "_updatePodcastsWithUUIDs:userInitiated:forced:useBackgroundFetch:source:startedUpdatesCallback:", a3, a4, 0, a5, a6, a7);
}

- (void)_updatePodcastWithUUID:(id)a3 triggerBy:(id)a4 userInitiated:(BOOL)a5 forced:(BOOL)a6 forceBootstrap:(BOOL)a7 useBackgroundFetch:(BOOL)a8 source:(int64_t)a9 completion:(id)a10
{
  uint64_t v10;

  LOBYTE(v10) = 1;
  -[MTFeedUpdateManager _updatePodcastWithUUID:triggerBy:userInitiated:forced:forceBootstrap:useBackgroundFetch:source:tryRedirectURL:startedUpdateCallback:completion:](self, "_updatePodcastWithUUID:triggerBy:userInitiated:forced:forceBootstrap:useBackgroundFetch:source:tryRedirectURL:startedUpdateCallback:completion:", a3, a4, a5, a6, a7, a8, a9, v10, 0, a10);
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedManager, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

@end
