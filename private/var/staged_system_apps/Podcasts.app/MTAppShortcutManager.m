@implementation MTAppShortcutManager

- (void)updateSpringboardShortcuts
{
  void *v3;
  id v4;
  NSObject *v5;
  _QWORD block[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v4 = objc_msgSend(v3, "applicationState");

  if (v4 == (id)2)
  {
    -[MTAppShortcutManager _beginBackgroundTask](self, "_beginBackgroundTask");
    v5 = objc_claimAutoreleasedReturnValue(-[MTAppShortcutManager workQueue](self, "workQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10006F98C;
    block[3] = &unk_1004A6200;
    block[4] = self;
    dispatch_async(v5, block);

  }
}

- (void)startObservingChanges
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  if ((id)-[MTAppShortcutManager shortcutsKind](self, "shortcutsKind") == (id)1)
  {
    objc_msgSend(v7, "addObserver:selector:name:object:", self, "updateShortcutItems", IMAVPlayerNotification_StateDidChange, 0);
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[PodcastsPlayerAdapter sharedInstance](_TtC8Podcasts21PodcastsPlayerAdapter, "sharedInstance"));
    if (os_feature_enabled_bluemoon())
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedPlaybackController](UIApplication, "sharedPlaybackController"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTSharedPlaybackController kIsPlayingKeyPath](MTSharedPlaybackController, "kIsPlayingKeyPath"));
      objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, v5, 3, 0);

    }
    else
    {
      objc_msgSend(v7, "addObserver:selector:name:object:", self, "playerStateChanged:", IMAVPlayerNotification_StateDidChange, 0);
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "PlayerNotification_JumpDurationDidChange_String"));
    objc_msgSend(v7, "addObserver:selector:name:object:", self, "updateShortcutItems", v6, 0);

  }
  objc_msgSend(v7, "addObserver:selector:name:object:", self, "updateShortcutItems", CFSTR("MTSyncControllerOperationCompleted"), 0);

}

- (MTAppShortcutManager)init
{
  MTAppShortcutManager *v2;
  MTAppShortcutManager *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *workQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTAppShortcutManager;
  v2 = -[MTAppShortcutManager init](&v7, "init");
  v3 = v2;
  if (v2)
  {
    v2->_backgroundTaskIdentifier = UIBackgroundTaskInvalid;
    v4 = dispatch_queue_create("MTAppShortcutManager-updateShortcutItems", 0);
    workQueue = v3->_workQueue;
    v3->_workQueue = (OS_dispatch_queue *)v4;

    -[MTAppShortcutManager startObservingChanges](v3, "startObservingChanges");
  }
  return v3;
}

- (void)updateShortcutItems
{
  unint64_t v3;

  v3 = -[MTAppShortcutManager shortcutsKind](self, "shortcutsKind");
  if (v3 == 1)
  {
    -[MTAppShortcutManager updateSpringboardShortcuts](self, "updateSpringboardShortcuts");
  }
  else if (!v3)
  {
    -[MTAppShortcutManager updateDockShortcuts](self, "updateDockShortcuts");
  }
}

- (unint64_t)shortcutsKind
{
  return 1;
}

- (void)dealloc
{
  objc_super v3;

  -[MTAppShortcutManager stopObservingChanges](self, "stopObservingChanges");
  v3.receiver = self;
  v3.super_class = (Class)MTAppShortcutManager;
  -[MTAppShortcutManager dealloc](&v3, "dealloc");
}

- (void)stopObservingChanges
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

}

- (void)playerStateChanged:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", IMAVPlayerNotificationKey_NewPlayerState));

  v5 = v6;
  if (v6)
  {
    -[MTAppShortcutManager updateMacPlaybackShortcutItemsForPlaybackState:](self, "updateMacPlaybackShortcutItemsForPlaybackState:", objc_msgSend(v6, "integerValue") == (id)1);
    v5 = v6;
  }

}

- (void)updateMacPlaybackShortcutItemsForPlaybackState:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;

  v3 = a3;
  v17 = (id)objc_claimAutoreleasedReturnValue(+[PodcastsPlayerAdapter sharedInstance](_TtC8Podcasts21PodcastsPlayerAdapter, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v5 = objc_alloc((Class)UIApplicationShortcutItem);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = v6;
  if (v3)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("EPISODE_ACTION_PAUSE"), &stru_1004C6D40, 0));
    v9 = objc_msgSend(v5, "initWithType:localizedTitle:", CFSTR("kMTShortcutItemTypePause"), v8);
    objc_msgSend(v4, "addObject:", v9);

    v10 = objc_alloc((Class)UIApplicationShortcutItem);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForSkipForward"));
    v12 = objc_msgSend(v10, "initWithType:localizedTitle:", CFSTR("kMTShortcutItemTypeSkipForward"), v11);
    objc_msgSend(v4, "addObject:", v12);

    v13 = objc_alloc((Class)UIApplicationShortcutItem);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForSkipBackwards"));
    v14 = objc_msgSend(v13, "initWithType:localizedTitle:", CFSTR("kMTShortcutItemTypeSkipBackward"), v7);
    objc_msgSend(v4, "addObject:", v14);
  }
  else
  {
    v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("EPISODE_ACTION_PLAY"), &stru_1004C6D40, 0));
    v15 = objc_msgSend(v5, "initWithType:localizedTitle:", CFSTR("kMTShortcutItemTypePlay"), v14);
    objc_msgSend(v4, "addObject:", v15);

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  objc_msgSend(v16, "setShortcutItems:", v4);

}

- (void)updateDockShortcuts
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[PodcastsPlayerAdapter sharedInstance](_TtC8Podcasts21PodcastsPlayerAdapter, "sharedInstance"));
  -[MTAppShortcutManager updateMacPlaybackShortcutItemsForPlaybackState:](self, "updateMacPlaybackShortcutItemsForPlaybackState:", objc_msgSend(v3, "isTargetPlaying"));

}

- (void)performActionForShortcutItem:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  unsigned int v11;
  void *v12;
  unsigned int v13;
  void *v14;
  unsigned int v15;
  void *v16;
  unsigned int v17;
  void *v18;
  unsigned int v19;
  void *v20;
  unsigned int v21;
  id v22;

  v22 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[PodcastsPlayerAdapter sharedInstance](_TtC8Podcasts21PodcastsPlayerAdapter, "sharedInstance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "type"));
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("kMTShortcutItemTypeSearchStore"));

  if (v9)
  {
    -[MTAppShortcutManager performSearchAction:](self, "performSearchAction:", v6);
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "type"));
    v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("kMTShortcutItemTypeCheckNewEpisodes"));

    if (v11)
    {
      -[MTAppShortcutManager performEpisodeUpdateAction:](self, "performEpisodeUpdateAction:", v6);
    }
    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "type"));
      v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("kMTShortcutItemTypeStation"));

      if (v13)
      {
        -[MTAppShortcutManager performPlayActionForShortcutItem:completionHandler:](self, "performPlayActionForShortcutItem:completionHandler:", v22, v6);
      }
      else
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "type"));
        v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("kMTShortcutItemTypePlay"));

        if (v15)
        {
          objc_msgSend(v7, "playWithCompletion:", 0);
        }
        else
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "type"));
          v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("kMTShortcutItemTypePause"));

          if (v17)
          {
            objc_msgSend(v7, "pauseWithCompletion:", 0);
          }
          else
          {
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "type"));
            v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("kMTShortcutItemTypeSkipForward"));

            if (v19)
            {
              objc_msgSend(v7, "jumpForwardsWithCompletion:", 0);
            }
            else
            {
              v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "type"));
              v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("kMTShortcutItemTypeSkipBackward"));

              if (v21)
                objc_msgSend(v7, "jumpBackwardsWithCompletion:", 0);
            }
          }
        }
      }
    }
  }

}

- (void)performSearchAction:(id)a3
{
  void (**v3)(id, uint64_t);
  void *v4;
  id v5;

  v3 = (void (**)(id, uint64_t))a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[MTURLResolver searchUrlForSearchText:](MTURLResolver, "searchUrlForSearchText:", 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  objc_msgSend(v4, "openURL:options:completionHandler:", v5, &__NSDictionary0__struct, 0);

  v3[2](v3, 1);
}

- (void)performEpisodeUpdateAction:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id *v7;
  _QWORD v8[4];
  void *v9;
  _QWORD v10[4];
  void *v11;
  _QWORD v12[4];
  id v13;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTFeedUpdateManager sharedInstance](MTFeedUpdateManager, "sharedInstance"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10006FE20;
  v12[3] = &unk_1004A7948;
  v5 = v3;
  v13 = v5;
  objc_msgSend(v4, "updateAllPodcastsUserInitiated:forced:source:started:", 1, 1, 3, v12);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MTApplication appController](MTApplication, "appController"));
  if (objc_msgSend(v6, "isMyPodcastsTabSelected"))
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10006FE34;
    v10[3] = &unk_1004A6200;
    v7 = &v11;
    v11 = v6;
    objc_msgSend(v6, "selectMyPodcastsTabAndPopToRoot:animated:completion:", 1, 1, v10);
  }
  else
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10006FE78;
    v8[3] = &unk_1004A6200;
    v7 = &v9;
    v9 = v6;
    objc_msgSend(v6, "selectUnplayedTabAndPopToRoot:animated:completion:", 1, 1, v8);
  }

}

- (void)performPlayActionForShortcutItem:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userInfo"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("stationUuid")));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userInfo"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("episodeUuid")));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MTPlaybackQueueFactory playStationUuid:episodeUuid:](MTPlaybackQueueFactory, "playStationUuid:episodeUuid:", v8, v10));
  if (os_feature_enabled_bluemoon(v11))
  {
    v12 = (id)objc_claimAutoreleasedReturnValue(+[UIApplication sharedPlaybackController](UIApplication, "sharedPlaybackController"));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100070070;
    v17[3] = &unk_1004A7948;
    v18 = v5;
    v13 = v5;
    objc_msgSend(v12, "playManifest:waitingForEngine:completion:", v11, 1, v17);

  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[MTPlayerController defaultInstance](MTPlayerController, "defaultInstance"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10007008C;
    v15[3] = &unk_1004A7948;
    v16 = v5;
    v12 = v5;
    objc_msgSend(v14, "playManifest:reason:interactive:presentationType:completion:", v11, 10, 1, 2, v15);

    v13 = v16;
  }

}

- (void)_beginBackgroundTask
{
  MTAppShortcutManager *v2;
  void *v3;
  _QWORD v4[5];

  v2 = self;
  objc_sync_enter(v2);
  -[MTAppShortcutManager setUpdateCount:](v2, "setUpdateCount:", (char *)-[MTAppShortcutManager updateCount](v2, "updateCount") + 1);
  if (-[MTAppShortcutManager backgroundTaskIdentifier](v2, "backgroundTaskIdentifier") == UIBackgroundTaskInvalid)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_100070188;
    v4[3] = &unk_1004A6200;
    v4[4] = v2;
    -[MTAppShortcutManager setBackgroundTaskIdentifier:](v2, "setBackgroundTaskIdentifier:", objc_msgSend(v3, "beginBackgroundTaskWithName:expirationHandler:", CFSTR("MTAppShortcutManager"), v4));

  }
  objc_sync_exit(v2);

}

- (void)_endBackgroundTask
{
  -[MTAppShortcutManager _endBackgroundTask:](self, "_endBackgroundTask:", 0);
}

- (void)_endBackgroundTask:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  MTAppShortcutManager *obj;

  v3 = a3;
  obj = self;
  objc_sync_enter(obj);
  -[MTAppShortcutManager setUpdateCount:](obj, "setUpdateCount:", (char *)-[MTAppShortcutManager updateCount](obj, "updateCount") - 1);
  if ((!-[MTAppShortcutManager updateCount](obj, "updateCount") || v3)
    && -[MTAppShortcutManager backgroundTaskIdentifier](obj, "backgroundTaskIdentifier") != UIBackgroundTaskInvalid)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    objc_msgSend(v4, "endBackgroundTask:", -[MTAppShortcutManager backgroundTaskIdentifier](obj, "backgroundTaskIdentifier"));

    -[MTAppShortcutManager setBackgroundTaskIdentifier:](obj, "setBackgroundTaskIdentifier:", UIBackgroundTaskInvalid);
  }
  if (-[MTAppShortcutManager backgroundTaskIdentifier](obj, "backgroundTaskIdentifier") == UIBackgroundTaskInvalid)
    -[MTAppShortcutManager setUpdateCount:](obj, "setUpdateCount:", 0);
  objc_sync_exit(obj);

}

- (id)_fetchShortcutItems
{
  return -[MTAppShortcutManager _fetchStationShortcutItems](self, "_fetchStationShortcutItems");
}

- (id)_fetchStationShortcutItems
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = sub_100046624;
  v14 = sub_100046994;
  v15 = 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "privateQueueContext"));

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100070390;
  v7[3] = &unk_1004A6B98;
  v4 = v3;
  v8 = v4;
  v9 = &v10;
  objc_msgSend(v4, "performBlockAndWait:", v7);
  v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v5;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v7;
  void *v8;
  unsigned int v9;

  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MTSharedPlaybackController kIsPlayingKeyPath](MTSharedPlaybackController, "kIsPlayingKeyPath"));
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if (v9)
    -[MTAppShortcutManager updateShortcutItems](self, "updateShortcutItems");
}

- (unint64_t)backgroundTaskIdentifier
{
  return self->_backgroundTaskIdentifier;
}

- (void)setBackgroundTaskIdentifier:(unint64_t)a3
{
  self->_backgroundTaskIdentifier = a3;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (unint64_t)updateCount
{
  return self->_updateCount;
}

- (void)setUpdateCount:(unint64_t)a3
{
  self->_updateCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
}

@end
