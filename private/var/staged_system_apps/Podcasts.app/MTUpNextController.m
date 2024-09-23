@implementation MTUpNextController

- (NSArray)items
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTUpNextController playerItems](self, "playerItems"));
  v3 = objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

+ (id)_filePath
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MTConstants sharedDocumentsDirectory](MTConstants, "sharedDocumentsDirectory"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("upnext_items.data")));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "path"));
  return v4;
}

- (MTUpNextController)initWithPlayerController:(id)a3
{
  id v4;
  MTUpNextController *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *workQueue;
  MTCoalescableWorkController *v8;
  MTCoalescableWorkController *saveController;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MTUpNextController;
  v5 = -[MTUpNextController init](&v11, "init");
  if (v5)
  {
    v6 = dispatch_queue_create("MTUpNextController.workQueue", 0);
    workQueue = v5->_workQueue;
    v5->_workQueue = (OS_dispatch_queue *)v6;

    v8 = (MTCoalescableWorkController *)objc_msgSend(objc_alloc((Class)MTCoalescableWorkController), "initWithWorkQueue:identifier:", v5->_workQueue, CFSTR("MTUpNextController.workQueue"));
    saveController = v5->_saveController;
    v5->_saveController = v8;

    objc_storeWeak((id *)&v5->_playerController, v4);
    -[MTUpNextController _restoreUpNext](v5, "_restoreUpNext");
  }

  return v5;
}

- (void)_restoreUpNext
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[6];
  uint8_t buf[8];
  uint8_t *v14;
  uint64_t v15;
  char v16;

  v3 = _MTLogCategoryPlayback(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Restoring Up Next", buf, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  -[MTUpNextController setPlayerItems:](self, "setPlayerItems:", v5);

  v6 = objc_msgSend((id)objc_opt_class(self), "unarchivedIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v9 = _MTLogCategoryPlayback(v7, v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Up Next Controller items after restore:", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  v14 = buf;
  v15 = 0x2020000000;
  v16 = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MTPlaybackIdentifierUtil sharedInstance](MTPlaybackIdentifierUtil, "sharedInstance"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100009564;
  v12[3] = &unk_1004AAF70;
  v12[4] = self;
  v12[5] = buf;
  objc_msgSend(v11, "fetchPlayerItemsForPlaybackQueueRequestIdentifiers:completion:", v7, v12);

  v14[24] = 1;
  _Block_object_dispose(buf, 8);

}

- (void)setPlayerItems:(id)a3
{
  objc_storeStrong((id *)&self->_playerItems, a3);
}

- (NSMutableArray)playerItems
{
  return self->_playerItems;
}

+ (id)_encodedUpNextClasses
{
  if (qword_100567540 != -1)
    dispatch_once(&qword_100567540, &stru_1004AAF48);
  return (id)qword_100567538;
}

- (void)addEpisodeUuidToUpNext:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[MTBaseEpisodeListManifest mediaItemForEpisodeWithUUID:](MTBaseEpisodeListManifest, "mediaItemForEpisodeWithUUID:", a3));
  -[MTUpNextController addPlayerItemToUpNext:](self, "addPlayerItemToUpNext:", v4);

}

- (void)addEpisodeUuidsToUpNext:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  MTUpNextController *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  void *v23;
  _BYTE v24[128];

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v17 = self;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v4, "count")));
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v19 != v9)
            objc_enumerationMutation(v6);
          v11 = (void *)objc_claimAutoreleasedReturnValue(+[MTBaseEpisodeListManifest mediaItemForEpisodeWithUUID:](MTBaseEpisodeListManifest, "mediaItemForEpisodeWithUUID:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i)));
          v12 = objc_msgSend(v5, "addObject:", v11);
          v14 = _MTLogCategoryPlayback(v12, v13);
          v15 = objc_claimAutoreleasedReturnValue(v14);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "title"));
            *(_DWORD *)buf = 138412290;
            v23 = v16;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "Added episode to array to add to Up Next Queue: %@", buf, 0xCu);

          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
      }
      while (v8);
    }

    -[MTUpNextController addPlayerItemsToUpNext:](v17, "addPlayerItemsToUpNext:", v5);
  }

}

- (void)addPlayerItemToUpNext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setEditingStyleFlags:", 3);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTUpNextController playerItems](self, "playerItems"));
    objc_msgSend(v6, "addObject:", v5);

    v7 = -[MTUpNextController _upNextDidChange](self, "_upNextDidChange");
    v9 = _MTLogCategoryPlayback(v7, v8);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "title"));
      v12 = 138412290;
      v13 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Added episode to Up Next Queue: %@", (uint8_t *)&v12, 0xCu);

    }
    -[MTUpNextController _reportUpNextChangeType:forPlayerItem:withData:](self, "_reportUpNextChangeType:forPlayerItem:withData:", CFSTR("add_to_up_next"), v5, 0);
  }

}

- (void)addPlayerItemsToUpNext:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint8_t v15[16];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v17;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v9), "setEditingStyleFlags:", 3);
          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v7);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTUpNextController playerItems](self, "playerItems"));
    objc_msgSend(v10, "addObjectsFromArray:", v5);

    v11 = -[MTUpNextController _upNextDidChange](self, "_upNextDidChange");
    v13 = _MTLogCategoryPlayback(v11, v12);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Added array of episodes to Up Next Queue", v15, 2u);
    }

    -[MTUpNextController _reportUpNextChangeType:forPlayerItems:withData:](self, "_reportUpNextChangeType:forPlayerItems:withData:", CFSTR("add_multiple_to_up_next"), v5, 0);
  }

}

- (void)addEpisodeUuidToPlayNext:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[MTBaseEpisodeListManifest mediaItemForEpisodeWithUUID:](MTBaseEpisodeListManifest, "mediaItemForEpisodeWithUUID:", a3));
  -[MTUpNextController addPlayerItemToUpNext:](self, "addPlayerItemToUpNext:", v4);

}

- (void)addEpisodeUuidsToPlayNext:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  MTUpNextController *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  void *v23;
  _BYTE v24[128];

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v17 = self;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v4, "count")));
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v19 != v9)
            objc_enumerationMutation(v6);
          v11 = (void *)objc_claimAutoreleasedReturnValue(+[MTBaseEpisodeListManifest mediaItemForEpisodeWithUUID:](MTBaseEpisodeListManifest, "mediaItemForEpisodeWithUUID:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i)));
          v12 = objc_msgSend(v5, "addObject:", v11);
          v14 = _MTLogCategoryPlayback(v12, v13);
          v15 = objc_claimAutoreleasedReturnValue(v14);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "title"));
            *(_DWORD *)buf = 138412290;
            v23 = v16;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "Added episode to array to add to Up Next Queue: %@", buf, 0xCu);

          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
      }
      while (v8);
    }

    -[MTUpNextController addPlayerItemsToPlayNext:](v17, "addPlayerItemsToPlayNext:", v5);
  }

}

- (void)addPlayerItemToPlayNext:(id)a3
{
  id v4;
  void *v5;
  char *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  char *v20;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setEditingStyleFlags:", 3);
    if (-[MTUpNextController isPlayingFromUpNext](self, "isPlayingFromUpNext"))
      v6 = (char *)-[MTUpNextController _currentUpNextIndex](self, "_currentUpNextIndex") + 1;
    else
      v6 = 0;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTUpNextController playerItems](self, "playerItems"));
    objc_msgSend(v7, "insertObject:atIndex:", v5, v6);

    v8 = -[MTUpNextController _upNextDidChange](self, "_upNextDidChange");
    v10 = _MTLogCategoryPlayback(v8, v9);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "title"));
      *(_DWORD *)buf = 138412546;
      v18 = v12;
      v19 = 2048;
      v20 = v6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Added episode to Play Next \bQueue: %@ at index: %lu", buf, 0x16u);

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v6, CFSTR("index")));
    v16 = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1));
    -[MTUpNextController _reportUpNextChangeType:forPlayerItem:withData:](self, "_reportUpNextChangeType:forPlayerItem:withData:", CFSTR("add_to_play_next"), v5, v14);

  }
}

- (void)addPlayerItemsToPlayNext:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  char *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  const __CFString *v23;
  void *v24;
  uint8_t buf[4];
  char *v26;
  _BYTE v27[128];

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v20;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v20 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v9), "setEditingStyleFlags:", 3, (_QWORD)v19);
          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
      }
      while (v7);
    }

    if (-[MTUpNextController isPlayingFromUpNext](self, "isPlayingFromUpNext"))
      v10 = (char *)-[MTUpNextController _currentUpNextIndex](self, "_currentUpNextIndex") + 1;
    else
      v10 = 0;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", v10, objc_msgSend(v5, "count", (_QWORD)v19)));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTUpNextController playerItems](self, "playerItems"));
    objc_msgSend(v12, "insertObjects:atIndexes:", v5, v11);

    v13 = -[MTUpNextController _upNextDidChange](self, "_upNextDidChange");
    v15 = _MTLogCategoryPlayback(v13, v14);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      v26 = v10;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Added array of episodes to Play Next Queue at index: %lu", buf, 0xCu);
    }

    v23 = CFSTR("starting_index");
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v10));
    v24 = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1));
    -[MTUpNextController _reportUpNextChangeType:forPlayerItems:withData:](self, "_reportUpNextChangeType:forPlayerItems:withData:", CFSTR("add_multiple_to_play_next"), v5, v18);

  }
}

- (BOOL)containsEpisodeUuid:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  unsigned __int8 v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTUpNextController playerItems](self, "playerItems"));
  v6 = objc_msgSend(v5, "copy");

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v7);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i), "episodeUuid", (_QWORD)v14));
        v12 = objc_msgSend(v11, "isEqualToString:", v4);

        if ((v12 & 1) != 0)
        {
          LOBYTE(v8) = 1;
          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

  return (char)v8;
}

- (void)removeEpisodeAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  unint64_t v20;

  if (-[MTUpNextController count](self, "count") > a3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTUpNextController playerItems](self, "playerItems"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndex:", a3));

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTUpNextController playerItems](self, "playerItems"));
    objc_msgSend(v7, "removeObjectAtIndex:", a3);

    v8 = -[MTUpNextController _upNextDidChange](self, "_upNextDidChange");
    v10 = _MTLogCategoryPlayback(v8, v9);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "title"));
      *(_DWORD *)buf = 138412546;
      v18 = v12;
      v19 = 2048;
      v20 = a3;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Removed item from Up Next Controller items: %@ from index: %lu", buf, 0x16u);

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3, CFSTR("index")));
    v16 = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1));
    -[MTUpNextController _reportUpNextChangeType:forPlayerItem:withData:](self, "_reportUpNextChangeType:forPlayerItem:withData:", CFSTR("remove_index"), v6, v14);

  }
}

- (void)removeEpisodesForUuid:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void **v16;
  uint64_t v17;
  BOOL (*v18)(uint64_t, void *, unint64_t);
  void *v19;
  id v20;
  MTUpNextController *v21;
  uint8_t buf[4];
  void *v23;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTUpNextController playerItems](self, "playerItems"));
  v16 = _NSConcreteStackBlock;
  v17 = 3221225472;
  v18 = sub_1000F75A8;
  v19 = &unk_1004AAF00;
  v20 = v4;
  v21 = self;
  v6 = v4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "indexesOfObjectsPassingTest:", &v16));

  if (objc_msgSend(v7, "firstIndex", v16, v17, v18, v19) != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTUpNextController playerItems](self, "playerItems"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v7, "firstIndex")));

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTUpNextController playerItems](self, "playerItems"));
    objc_msgSend(v10, "removeObjectsAtIndexes:", v7);

    v11 = -[MTUpNextController _upNextDidChange](self, "_upNextDidChange");
    v13 = _MTLogCategoryPlayback(v11, v12);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "title"));
      *(_DWORD *)buf = 138412290;
      v23 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Removed item from Up Next Controller items: %@", buf, 0xCu);

    }
    -[MTUpNextController _reportUpNextChangeType:forPlayerItem:withData:](self, "_reportUpNextChangeType:forPlayerItem:withData:", CFSTR("remove_uuid"), v9, 0);

  }
}

- (BOOL)moveEpisodeFrom:(unint64_t)a3 to:(unint64_t)a4
{
  unint64_t v7;
  BOOL result;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[2];
  _QWORD v22[2];
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  unint64_t v26;
  __int16 v27;
  unint64_t v28;

  if (-[MTUpNextController count](self, "count") <= a3)
    return 0;
  v7 = -[MTUpNextController count](self, "count");
  result = 0;
  if (a3 != a4 && v7 > a4)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTUpNextController playerItems](self, "playerItems"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndex:", a3));

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTUpNextController playerItems](self, "playerItems"));
    objc_msgSend(v11, "removeObjectAtIndex:", a3);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTUpNextController playerItems](self, "playerItems"));
    objc_msgSend(v12, "insertObject:atIndex:", v10, a4);

    v13 = -[MTUpNextController _upNextDidChange](self, "_upNextDidChange");
    v15 = _MTLogCategoryPlayback(v13, v14);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "title"));
      *(_DWORD *)buf = 138412802;
      v24 = v17;
      v25 = 2048;
      v26 = a3;
      v27 = 2048;
      v28 = a4;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Moved episode %@ in Up Next Controller items from index %lu to index %lu", buf, 0x20u);

    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3, CFSTR("from")));
    v21[1] = CFSTR("to");
    v22[0] = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
    v22[1] = v19;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v22, v21, 2));
    -[MTUpNextController _reportUpNextChangeType:forPlayerItem:withData:](self, "_reportUpNextChangeType:forPlayerItem:withData:", CFSTR("move"), v10, v20);

    return 1;
  }
  return result;
}

- (void)clear
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint8_t v8[16];

  -[MTUpNextController _reportUpNextChangeType:forPlayerItem:withData:](self, "_reportUpNextChangeType:forPlayerItem:withData:", CFSTR("clear"), 0, 0);
  v3 = -[MTUpNextController count](self, "count");
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTUpNextController playerItems](self, "playerItems"));
    objc_msgSend(v5, "removeAllObjects");

    v3 = -[MTUpNextController _upNextDidChange](self, "_upNextDidChange");
  }
  v6 = _MTLogCategoryPlayback(v3, v4);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Cleared all items from Up Next Controller items", v8, 2u);
  }

}

- (void)clearQueueItems
{
  id v3;
  uint64_t v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  uint8_t v12[8];
  _QWORD v13[5];

  -[MTUpNextController _reportUpNextChangeType:forPlayerItem:withData:](self, "_reportUpNextChangeType:forPlayerItem:withData:", CFSTR("clearQueueItems"), 0, 0);
  v3 = -[MTUpNextController count](self, "count");
  if (v3)
  {
    v5 = -[MTUpNextController isPlayingFromUpNext](self, "isPlayingFromUpNext");
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTUpNextController playerItems](self, "playerItems"));
    v7 = v6;
    if (v5)
    {
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_1000F79F4;
      v13[3] = &unk_1004AAF28;
      v13[4] = self;
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "indexesOfObjectsPassingTest:", v13));

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTUpNextController playerItems](self, "playerItems"));
      objc_msgSend(v9, "removeObjectsAtIndexes:", v8);

    }
    else
    {
      objc_msgSend(v6, "removeAllObjects");

    }
    v3 = -[MTUpNextController _upNextDidChange](self, "_upNextDidChange");
  }
  v10 = _MTLogCategoryPlayback(v3, v4);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Cleared all queued items from Up Next Controller items, leaving currently playing if applicable", v12, 2u);
  }

}

- (BOOL)isPlayingFromUpNext
{
  void *v2;
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTUpNextController playerController](self, "playerController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "compositeManifest"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "upNextManifest"));
  v5 = objc_msgSend(v3, "isPlayingFromManifest:", v4);

  return v5;
}

- (unint64_t)upNextOffset
{
  return -[MTUpNextController isPlayingFromUpNext](self, "isPlayingFromUpNext");
}

- (BOOL)hasItemsInQueue
{
  unint64_t v3;

  v3 = -[MTUpNextController count](self, "count");
  return v3 > -[MTUpNextController upNextOffset](self, "upNextOffset");
}

- (void)beginUpdates
{
  -[MTUpNextController setUpdateCount:](self, "setUpdateCount:", (char *)-[MTUpNextController updateCount](self, "updateCount") + 1);
}

- (void)endUpdates
{
  -[MTUpNextController setUpdateCount:](self, "setUpdateCount:", (char *)-[MTUpNextController updateCount](self, "updateCount") - 1);
  if (!-[MTUpNextController updateCount](self, "updateCount"))
    -[MTUpNextController _upNextDidChange](self, "_upNextDidChange");
}

- (unint64_t)count
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTUpNextController playerItems](self, "playerItems"));
  v3 = objc_msgSend(v2, "count");

  return (unint64_t)v3;
}

- (unint64_t)_currentUpNextIndex
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTUpNextController playerController](self, "playerController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "upNextManifest"));
  v4 = objc_msgSend(v3, "currentIndex");

  return (unint64_t)v4;
}

- (void)_reportUpNextChangeType:(id)a3 forPlayerItem:(id)a4 withData:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  MTUpNextController *v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_claimAutoreleasedReturnValue(-[MTUpNextController workQueue](self, "workQueue"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000F7CC4;
  v15[3] = &unk_1004A6C78;
  v16 = v8;
  v17 = v10;
  v18 = self;
  v19 = v9;
  v12 = v9;
  v13 = v10;
  v14 = v8;
  dispatch_async(v11, v15);

}

- (void)_reportUpNextChangeType:(id)a3 forPlayerItems:(id)a4 withData:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  MTUpNextController *v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_claimAutoreleasedReturnValue(-[MTUpNextController workQueue](self, "workQueue"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000F7E6C;
  v15[3] = &unk_1004A6C78;
  v16 = v8;
  v17 = v10;
  v18 = self;
  v19 = v9;
  v12 = v9;
  v13 = v10;
  v14 = v8;
  dispatch_async(v11, v15);

}

- (id)_encodedUpNext
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTUpNextController playerItems](self, "playerItems"));
  v5 = objc_msgSend(v4, "copy");

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[MTPlaybackIdentifierUtil sharedInstance](MTPlaybackIdentifierUtil, "sharedInstance", (_QWORD)v15));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "requestIdentifierForPlayerItem:", v11));

        objc_msgSend(v3, "addObject:", v13);
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  return v3;
}

- (void)_upNextDidChange
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  if (!-[MTUpNextController updateCount](self, "updateCount"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v3, "postNotificationName:object:", CFSTR("MTUpNextControllerItemsDidChange"), self);

    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTUpNextController saveController](self, "saveController"));
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1000F8150;
    v5[3] = &unk_1004A6200;
    v5[4] = self;
    objc_msgSend(v4, "schedule:", v5);

  }
}

+ (id)unarchivedIdentifiers
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  BOOL v10;
  id v11;
  uint64_t v13;

  v3 = objc_msgSend((id)objc_opt_class(a1), "_encodedUpNextClasses");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = objc_msgSend((id)objc_opt_class(a1), "_filePath");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](NSData, "dataWithContentsOfFile:", v6));
  v13 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v4, v7, &v13));
  v9 = v13;

  if (v8)
    v10 = v9 == 0;
  else
    v10 = 0;
  if (v10)
    v11 = objc_msgSend(v8, "copy");
  else
    v11 = &__NSArray0__struct;

  return v11;
}

- (MTPlayerController)playerController
{
  return (MTPlayerController *)objc_loadWeakRetained((id *)&self->_playerController);
}

- (void)setPlayerController:(id)a3
{
  objc_storeWeak((id *)&self->_playerController, a3);
}

- (unint64_t)updateCount
{
  return self->_updateCount;
}

- (void)setUpdateCount:(unint64_t)a3
{
  self->_updateCount = a3;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (MTCoalescableWorkController)saveController
{
  return self->_saveController;
}

- (void)setSaveController:(id)a3
{
  objc_storeStrong((id *)&self->_saveController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_saveController, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_playerItems, 0);
  objc_destroyWeak((id *)&self->_playerController);
}

@end
