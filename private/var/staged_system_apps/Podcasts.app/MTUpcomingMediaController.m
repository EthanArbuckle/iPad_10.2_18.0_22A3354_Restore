@implementation MTUpcomingMediaController

- (void)setSuggestedStationUuids:(id)a3
{
  id v4;
  MTCoalescableWorkController *suggestedStationsWorkController;
  id v6;
  _QWORD v7[4];
  id v8;
  MTUpcomingMediaController *v9;

  v4 = a3;
  suggestedStationsWorkController = self->_suggestedStationsWorkController;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000DBB4;
  v7[3] = &unk_1004A6640;
  v8 = v4;
  v9 = self;
  v6 = v4;
  -[MTCoalescableWorkController schedule:](suggestedStationsWorkController, "schedule:", v7);

}

- (MTUpcomingMediaController)init
{
  MTUpcomingMediaController *v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_t v5;
  MTCoalescableWorkController *v6;
  MTCoalescableWorkController *suggestedEpisodesWorkController;
  MTCoalescableWorkController *v8;
  MTCoalescableWorkController *suggestedStationsWorkController;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MTUpcomingMediaController;
  v2 = -[MTUpcomingMediaController init](&v11, "init");
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = dispatch_queue_create("MTUpcomingMediaController.upcoming_media_queue", v4);
    v6 = (MTCoalescableWorkController *)objc_msgSend(objc_alloc((Class)MTCoalescableWorkController), "initWithWorkQueue:identifier:", v5, CFSTR("MTUpcomingMediaController.setSuggestedEpisodes"));
    suggestedEpisodesWorkController = v2->_suggestedEpisodesWorkController;
    v2->_suggestedEpisodesWorkController = v6;

    v8 = (MTCoalescableWorkController *)objc_msgSend(objc_alloc((Class)MTCoalescableWorkController), "initWithWorkQueue:identifier:", v5, CFSTR("MTUpcomingMediaController.setSuggestedStations"));
    suggestedStationsWorkController = v2->_suggestedStationsWorkController;
    v2->_suggestedStationsWorkController = v8;

    v2->_pendingDeferredUpdate = 0;
  }
  return v2;
}

- (void)setSuggestedEpisodeUuids:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  MTUpcomingMediaController *v7;
  dispatch_time_t v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  id v12;

  v4 = a3;
  v5 = _MTLogCategorySiri(-[MTUpcomingMediaController setDeferredEpisodeUuids:](self, "setDeferredEpisodeUuids:", v4));
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v12 = objc_msgSend(v4, "count");
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Upcoming Media: Deferring update of %lu suggested episode UUIDs", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  v7 = self;
  objc_sync_enter(v7);
  if (!-[MTUpcomingMediaController pendingDeferredUpdate](v7, "pendingDeferredUpdate"))
  {
    -[MTUpcomingMediaController setPendingDeferredUpdate:](v7, "setPendingDeferredUpdate:", 1);
    v8 = dispatch_time(0, 10000000000);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000C2DC0;
    v9[3] = &unk_1004A9A58;
    v9[4] = v7;
    objc_copyWeak(&v10, (id *)buf);
    dispatch_after(v8, (dispatch_queue_t)&_dispatch_main_q, v9);
    objc_destroyWeak(&v10);
  }
  objc_sync_exit(v7);

  objc_destroyWeak((id *)buf);
}

- (void)setPendingDeferredUpdate:(BOOL)a3
{
  self->_pendingDeferredUpdate = a3;
}

- (void)setDeferredEpisodeUuids:(id)a3
{
  objc_storeStrong((id *)&self->_deferredEpisodeUuids, a3);
}

- (BOOL)pendingDeferredUpdate
{
  return self->_pendingDeferredUpdate;
}

- (void)_setSuggestedEpisodeUuidsImmediately:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  MTCoalescableWorkController *suggestedEpisodesWorkController;
  id v8;
  _QWORD v9[4];
  id v10;
  MTUpcomingMediaController *v11;
  uint8_t buf[4];
  id v13;

  v4 = a3;
  v5 = _MTLogCategorySiri(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v13 = objc_msgSend(v4, "count");
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Upcoming Media: Setting %lu suggested episode UUIDs", buf, 0xCu);
  }

  suggestedEpisodesWorkController = self->_suggestedEpisodesWorkController;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000C2F6C;
  v9[3] = &unk_1004A6640;
  v10 = v4;
  v11 = self;
  v8 = v4;
  -[MTCoalescableWorkController schedule:](suggestedEpisodesWorkController, "schedule:", v9);

}

- (void)setStationIntents:(id)a3
{
  MTUpcomingMediaController *v5;
  void **p_stationIntents;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;

  v14 = a3;
  v5 = self;
  objc_sync_enter(v5);
  p_stationIntents = (void **)&v5->_stationIntents;
  objc_storeStrong((id *)&v5->_stationIntents, a3);
  v7 = objc_claimAutoreleasedReturnValue(-[MTUpcomingMediaController episodeIntents](v5, "episodeIntents"));
  v8 = (void *)v7;
  if (v7)
    v9 = (void *)v7;
  else
    v9 = &__NSArray0__struct;
  v10 = v9;

  v11 = *p_stationIntents;
  if (!*p_stationIntents)
    v11 = &__NSArray0__struct;
  v12 = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "arrayByAddingObjectsFromArray:", v12));
  -[MTUpcomingMediaController setIntents:](v5, "setIntents:", v13);

  objc_sync_exit(v5);
}

- (void)setEpisodeIntents:(id)a3
{
  MTUpcomingMediaController *v5;
  NSArray *episodeIntents;
  NSArray *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;

  v13 = a3;
  v5 = self;
  objc_sync_enter(v5);
  objc_storeStrong((id *)&v5->_episodeIntents, a3);
  episodeIntents = v5->_episodeIntents;
  if (!episodeIntents)
    episodeIntents = (NSArray *)&__NSArray0__struct;
  v7 = episodeIntents;
  v8 = objc_claimAutoreleasedReturnValue(-[MTUpcomingMediaController stationIntents](v5, "stationIntents"));
  v9 = (void *)v8;
  if (v8)
    v10 = (void *)v8;
  else
    v10 = &__NSArray0__struct;
  v11 = v10;

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray arrayByAddingObjectsFromArray:](v7, "arrayByAddingObjectsFromArray:", v11));
  -[MTUpcomingMediaController setIntents:](v5, "setIntents:", v12);

  objc_sync_exit(v5);
}

- (void)setIntents:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  MTUpcomingMediaController *v22;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];

  v4 = a3;
  v22 = self;
  objc_sync_enter(v22);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v4, "count")));
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v25;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v25 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)v8);
        v10 = objc_msgSend(objc_alloc((Class)INShortcut), "initWithIntent:", v9);
        v11 = objc_msgSend(objc_alloc((Class)INRelevantShortcut), "initWithShortcut:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "mediaContainer"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "title"));

        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "keyImage"));
        v15 = objc_msgSend(objc_alloc((Class)INDefaultCardTemplate), "initWithTitle:", v13);
        objc_msgSend(v15, "setImage:", v14);
        objc_msgSend(v11, "setWatchTemplate:", v15);
        objc_msgSend(v5, "addObject:", v11);

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v6);
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[INRelevantShortcutStore defaultStore](INRelevantShortcutStore, "defaultStore"));
  objc_msgSend(v16, "setRelevantShortcuts:completionHandler:", v5, &stru_1004A9D08);

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSOrderedSet orderedSetWithArray:](NSOrderedSet, "orderedSetWithArray:", obj));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[INUpcomingMediaManager sharedManager](INUpcomingMediaManager, "sharedManager"));
  objc_msgSend(v18, "setPredictionMode:forType:", 1, 6);

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[INUpcomingMediaManager sharedManager](INUpcomingMediaManager, "sharedManager"));
  objc_msgSend(v19, "setPredictionMode:forType:", 1, 7);

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[INUpcomingMediaManager sharedManager](INUpcomingMediaManager, "sharedManager"));
  objc_msgSend(v20, "setPredictionMode:forType:", 1, 8);

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[INUpcomingMediaManager sharedManager](INUpcomingMediaManager, "sharedManager"));
  objc_msgSend(v21, "setSuggestedMediaIntents:", v17);

  objc_sync_exit(v22);
}

- (MTCoalescableWorkController)suggestedEpisodesWorkController
{
  return self->_suggestedEpisodesWorkController;
}

- (void)setSuggestedEpisodesWorkController:(id)a3
{
  objc_storeStrong((id *)&self->_suggestedEpisodesWorkController, a3);
}

- (MTCoalescableWorkController)suggestedStationsWorkController
{
  return self->_suggestedStationsWorkController;
}

- (void)setSuggestedStationsWorkController:(id)a3
{
  objc_storeStrong((id *)&self->_suggestedStationsWorkController, a3);
}

- (NSArray)episodeIntents
{
  return self->_episodeIntents;
}

- (NSArray)stationIntents
{
  return self->_stationIntents;
}

- (NSArray)deferredEpisodeUuids
{
  return self->_deferredEpisodeUuids;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deferredEpisodeUuids, 0);
  objc_storeStrong((id *)&self->_stationIntents, 0);
  objc_storeStrong((id *)&self->_episodeIntents, 0);
  objc_storeStrong((id *)&self->_suggestedStationsWorkController, 0);
  objc_storeStrong((id *)&self->_suggestedEpisodesWorkController, 0);
}

@end
