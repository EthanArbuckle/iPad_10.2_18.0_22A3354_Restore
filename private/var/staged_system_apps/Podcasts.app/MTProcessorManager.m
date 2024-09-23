@implementation MTProcessorManager

- (MTProcessorManager)init
{
  MTProcessorManager *v2;
  void *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *classMap;
  uint64_t v6;
  void *v7;
  int v8;
  __objc2_class **v9;
  id v10;
  int v11;
  __objc2_class **v12;
  void *v13;
  objc_super v15;
  _QWORD v16[4];
  _QWORD v17[4];

  v15.receiver = self;
  v15.super_class = (Class)MTProcessorManager;
  v2 = -[MTProcessorManager init](&v15, "init");
  if (v2)
  {
    v16[0] = &off_1004D58F0;
    v17[0] = objc_opt_class(MTEpisodeDeletionProcessor);
    v16[1] = &off_1004D5908;
    v17[1] = objc_opt_class(MTPlaylistIncludeAllProcessor);
    v16[2] = &off_1004D5920;
    v17[2] = objc_opt_class(MTPlaylistQueryManager);
    v16[3] = &off_1004D5938;
    v17[3] = objc_opt_class(MTUPPSyncProcessor);
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v17, v16, 4));
    v4 = (NSMutableDictionary *)objc_msgSend(v3, "mutableCopy");
    classMap = v2->_classMap;
    v2->_classMap = v4;

    v6 = objc_opt_class(MTSyncController);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = os_feature_enabled_debounced_asset_management(-[NSMutableDictionary setObject:forKey:](v2->_classMap, "setObject:forKey:", v7, &off_1004D5950));
    v9 = &off_1004A4370;
    if (!v8)
      v9 = off_1004A4320;
    v10 = -[NSMutableDictionary setObject:forKey:](v2->_classMap, "setObject:forKey:", objc_opt_class(*v9), &off_1004D5968);
    v11 = os_feature_enabled_debounced_asset_management(v10);
    v12 = off_1004A4368;
    if (!v11)
      v12 = off_1004A4318;
    -[NSMutableDictionary setObject:forKey:](v2->_classMap, "setObject:forKey:", objc_opt_class(*v12), &off_1004D5980);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v13, "addObserver:selector:name:object:", v2, "_playbackStateChanged:", IMAVPlayerNotification_StateDidChange, 0);

  }
  return v2;
}

- (void)startProcessors:(unint64_t)a3
{
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_classMap, "allKeys", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = (unint64_t)objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v9), "unsignedIntegerValue");
        if ((v10 & a3) != 0)
          -[MTProcessorManager _startProcessor:](self, "_startProcessor:", v10);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)_startProcessor:(unint64_t)a3
{
  NSMutableDictionary *classMap;
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  NSString *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  NSString *v14;
  int v15;
  void *v16;

  classMap = self->_classMap;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  v5 = -[NSMutableDictionary objectForKeyedSubscript:](classMap, "objectForKeyedSubscript:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sharedInstance"));
  v7 = objc_msgSend(v6, "isRunning");
  if ((v7 & 1) != 0)
  {
    v8 = _MTLogCategoryDefault(v7);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = NSStringFromClass((Class)v5);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      v15 = 138412290;
      v16 = v11;
      v12 = "%@ is already running";
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v15, 0xCu);

    }
  }
  else
  {
    v13 = _MTLogCategoryDefault(objc_msgSend(v6, "start"));
    v9 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v14 = NSStringFromClass((Class)v5);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v14);
      v15 = 138412290;
      v16 = v11;
      v12 = "%@ has been started";
      goto LABEL_6;
    }
  }

}

- (void)startAllProcessors
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100009918;
  block[3] = &unk_1004A6200;
  block[4] = self;
  if (qword_1005672A8 != -1)
    dispatch_once(&qword_1005672A8, block);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, IMAVPlayerNotification_StateDidChange, 0);

  v4.receiver = self;
  v4.super_class = (Class)MTProcessorManager;
  -[MTProcessorManager dealloc](&v4, "dealloc");
}

- (void)_playbackStateChanged:(id)a3
{
  void *v4;
  unsigned int v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTPlayerController defaultInstance](MTPlayerController, "defaultInstance", a3));
  v5 = objc_msgSend(v4, "isPlayingLocally");

  if (v5)
    -[MTProcessorManager startProcessorsForPlayback](self, "startProcessorsForPlayback");
}

- (void)startProcessorsForFeedUpdates
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005EF64;
  block[3] = &unk_1004A6200;
  block[4] = self;
  if (qword_1005672B0 != -1)
    dispatch_once(&qword_1005672B0, block);
}

- (void)startProcessorsForPlayback
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005F044;
  block[3] = &unk_1004A6200;
  block[4] = self;
  if (qword_1005672B8 != -1)
    dispatch_once(&qword_1005672B8, block);
}

- (void)startProcessorsForCarPlay
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005F124;
  block[3] = &unk_1004A6200;
  block[4] = self;
  if (qword_1005672C0 != -1)
    dispatch_once(&qword_1005672C0, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classMap, 0);
}

@end
