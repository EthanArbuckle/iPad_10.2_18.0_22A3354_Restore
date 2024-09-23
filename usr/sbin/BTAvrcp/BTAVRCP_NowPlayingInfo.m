@implementation BTAVRCP_NowPlayingInfo

- (BTAVRCP_NowPlayingInfo)init
{
  char *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;
  _QWORD v15[3];

  v14.receiver = self;
  v14.super_class = (Class)BTAVRCP_NowPlayingInfo;
  v2 = -[BTAVRCP_NowPlayingInfo init](&v14, "init");
  if (v2)
  {
    v3 = objc_alloc((Class)NSSet);
    v15[0] = off_10001F048;
    v15[1] = off_10001F050;
    v15[2] = off_10001F058;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v15, 3));
    v5 = objc_msgSend(v3, "initWithArray:", v4);
    v6 = (void *)*((_QWORD *)v2 + 3);
    *((_QWORD *)v2 + 3) = v5;

    objc_storeStrong((id *)v2 + 5, off_10001F048);
    v2[8] = 0;
    *(_OWORD *)(v2 + 56) = xmmword_1000141F0;
    *((_QWORD *)v2 + 9) = 0x100000001;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v7, "addObserver:selector:name:object:", v2, "_infoDidChangeNotification", kMRMediaRemoteNowPlayingInfoDidChangeNotification, 0);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v8, "addObserver:selector:name:object:", v2, "_appDidChangeNotification:", kMRMediaRemoteNowPlayingApplicationDidChangeNotification, 0);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v9, "addObserver:selector:name:object:", v2, "_appIsPlayingDidChangeNotification:", kMRMediaRemoteNowPlayingApplicationIsPlayingDidChangeNotification, 0);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v10, "addObserver:selector:name:object:", v2, "_playbackQueueDidChangeNotification", MPMusicPlayerControllerQueueDidChangeNotification, 0);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v11, "addObserver:selector:name:object:", v2, "_activeOriginDidChangeNotification", kMRMediaRemoteActiveOriginDidChangeNotification, 0);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v12, "addObserver:selector:name:object:", v2, "_supportedCommandsDidChangeNotification", kMRMediaRemoteSupportedCommandsDidChangeNotification, 0);

    MRMediaRemoteRegisterForNowPlayingNotifications(&_dispatch_main_q);
    MRMediaRemoteSetWantsOriginChangeNotifications(1);
    MRMediaRemoteSetWantsSupportedCommandsChangedNotifications(1);
    objc_msgSend(v2, "_initializeState");
  }
  return (BTAVRCP_NowPlayingInfo *)v2;
}

- (void)_initializeState
{
  dispatch_queue_global_t global_queue;
  void *v4;
  BTAVRCP_Syncifier *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void **v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void *v15;
  BTAVRCP_NowPlayingInfo *v16;
  id v17;
  _QWORD v18[5];
  id v19;
  _QWORD v20[5];
  id v21;
  _QWORD v22[5];
  id v23;
  _QWORD v24[5];
  id v25;

  global_queue = dispatch_get_global_queue(2, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
  v5 = objc_alloc_init(BTAVRCP_Syncifier);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10000D950;
  v24[3] = &unk_100018BA8;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[BTAVRCP_Syncifier createSwitcher](v5, "createSwitcher"));
  v24[4] = self;
  v25 = v6;
  MRMediaRemoteGetNowPlayingInfoWithOptionalArtwork(0, 0, v4, v24);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10000D9E4;
  v22[3] = &unk_100018BD0;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[BTAVRCP_Syncifier createSwitcher](v5, "createSwitcher"));
  v22[4] = self;
  v23 = v7;
  MRMediaRemoteGetNowPlayingApplicationDisplayID(v4, v22);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10000DA78;
  v20[3] = &unk_100018C20;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[BTAVRCP_Syncifier createSwitcher](v5, "createSwitcher"));
  v20[4] = self;
  v21 = v8;
  MRMediaRemoteGetNowPlayingApplicationIsPlaying(v4, v20);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10000DB1C;
  v18[3] = &unk_100018C70;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[BTAVRCP_Syncifier createSwitcher](v5, "createSwitcher"));
  v18[4] = self;
  v19 = v9;
  MRMediaRemoteGetActiveOrigin(v4, v18);
  v12 = _NSConcreteStackBlock;
  v13 = 3221225472;
  v14 = sub_10000DBC0;
  v15 = &unk_100018C98;
  v10 = (id)objc_claimAutoreleasedReturnValue(-[BTAVRCP_Syncifier createSwitcher](v5, "createSwitcher"));
  v16 = self;
  v17 = v10;
  MRMediaRemoteCopySupportedCommands(v4, &v12);
  if (!-[BTAVRCP_Syncifier wait:](v5, "wait:", 3.0, v12, v13, v14, v15))
  {
    v11 = qword_10001F1C0;
    if (os_log_type_enabled((os_log_t)qword_10001F1C0, OS_LOG_TYPE_ERROR))
      sub_10001014C(v11);
  }

}

- (void)dealloc
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v11;

  v3 = qword_10001F1C0;
  if (os_log_type_enabled((os_log_t)qword_10001F1C0, OS_LOG_TYPE_DEBUG))
    sub_100010188(v3, v4, v5, v6, v7, v8, v9, v10);
  MRMediaRemoteUnregisterForNowPlayingNotifications();
  MRMediaRemoteSetWantsOriginChangeNotifications(0);
  MRMediaRemoteSetWantsSupportedCommandsChangedNotifications(0);
  if (-[BTAVRCP_NowPlayingInfo mrActiveOrigin](self, "mrActiveOrigin"))
    CFRelease(-[BTAVRCP_NowPlayingInfo mrActiveOrigin](self, "mrActiveOrigin"));
  v11.receiver = self;
  v11.super_class = (Class)BTAVRCP_NowPlayingInfo;
  -[BTAVRCP_NowPlayingInfo dealloc](&v11, "dealloc");
}

- (void)_refreshInfo
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10000DD68;
  v2[3] = &unk_100018CC0;
  v2[4] = self;
  MRMediaRemoteGetNowPlayingInfoWithOptionalArtwork(0, 0, &_dispatch_main_q, v2);
}

- (void)_refreshApp
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10000DDCC;
  v2[3] = &unk_100018CE8;
  v2[4] = self;
  MRMediaRemoteGetNowPlayingApplicationDisplayID(&_dispatch_main_q, v2);
}

- (void)_refreshAppIsPlaying
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10000DE30;
  v2[3] = &unk_100018D10;
  v2[4] = self;
  MRMediaRemoteGetNowPlayingApplicationIsPlaying(&_dispatch_main_q, v2);
}

- (void)_refreshActiveOrigin
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10000DE98;
  v2[3] = &unk_100018D38;
  v2[4] = self;
  MRMediaRemoteGetActiveOrigin(&_dispatch_main_q, v2);
}

- (void)_refreshSupportedCommands
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10000DF00;
  v2[3] = &unk_100018D60;
  v2[4] = self;
  MRMediaRemoteCopySupportedCommands(&_dispatch_main_q, v2);
}

- (unint64_t)_getEncodingForMimeType:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("image/jpeg")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("image/png")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_infoDidChangeNotification
{
  -[BTAVRCP_NowPlayingInfo _refreshInfo](self, "_refreshInfo");
}

- (void)_appDidChangeNotification:(id)a3
{
  -[BTAVRCP_NowPlayingInfo _refreshApp](self, "_refreshApp", a3);
}

- (void)_appIsPlayingDidChangeNotification:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", kMRMediaRemoteNowPlayingApplicationIsPlayingUserInfoKey));
  v6 = objc_msgSend(v5, "BOOLValue");

  -[BTAVRCP_NowPlayingInfo _appIsPlayingDidChange:](self, "_appIsPlayingDidChange:", v6);
}

- (void)_playbackQueueDidChangeNotification
{
  -[BTAVRCP_NowPlayingInfo _playbackQueueDidChange](self, "_playbackQueueDidChange");
}

- (void)_activeOriginDidChangeNotification
{
  -[BTAVRCP_NowPlayingInfo _refreshActiveOrigin](self, "_refreshActiveOrigin");
}

- (void)_supportedCommandsDidChangeNotification
{
  -[BTAVRCP_NowPlayingInfo _refreshSupportedCommands](self, "_refreshSupportedCommands");
}

- (void)_infoDidChange:(id)a3
{
  id v4;

  v4 = a3;
  if (os_log_type_enabled((os_log_t)qword_10001F1C0, OS_LOG_TYPE_DEBUG))
    sub_1000101B8();
  -[BTAVRCP_NowPlayingInfo setMrInfo:](self, "setMrInfo:", v4);
  -[BTAVRCP_NowPlayingInfo _playbackStateDidChange](self, "_playbackStateDidChange");
  -[BTAVRCP_NowPlayingInfo _trackDidChange](self, "_trackDidChange");

}

- (void)_appDidChange:(id)a3
{
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;

  v4 = (__CFString *)a3;
  v5 = v4;
  v6 = off_10001F048;
  if (v4)
    v6 = v4;
  v7 = v6;
  if (os_log_type_enabled((os_log_t)qword_10001F1C0, OS_LOG_TYPE_DEBUG))
    sub_100010218();
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_NowPlayingInfo mrAppIdentifier](self, "mrAppIdentifier"));
  v9 = -[__CFString isEqualToString:](v7, "isEqualToString:", v8);

  if ((v9 & 1) == 0)
  {
    -[BTAVRCP_NowPlayingInfo setMrAppIdentifier:](self, "setMrAppIdentifier:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_NowPlayingInfo delegate](self, "delegate"));
    objc_msgSend(v10, "playerDidChange:", -[BTAVRCP_NowPlayingInfo playerId](self, "playerId"));

  }
}

- (void)_appIsPlayingDidChange:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = a3;
  v5 = qword_10001F1C0;
  if (os_log_type_enabled((os_log_t)qword_10001F1C0, OS_LOG_TYPE_DEBUG))
    sub_100010278(v3, v5, v6, v7, v8, v9, v10, v11);
  -[BTAVRCP_NowPlayingInfo setMrAppIsPlaying:](self, "setMrAppIsPlaying:", v3);
  -[BTAVRCP_NowPlayingInfo _playbackStateDidChange](self, "_playbackStateDidChange");
  -[BTAVRCP_NowPlayingInfo _trackDidChange](self, "_trackDidChange");
}

- (void)_playbackQueueDidChange
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v3 = qword_10001F1C0;
  if (os_log_type_enabled((os_log_t)qword_10001F1C0, OS_LOG_TYPE_DEBUG))
    sub_1000102F4(v3, v4, v5, v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_NowPlayingInfo delegate](self, "delegate"));
  objc_msgSend(v11, "playbackQueueDidChange");

}

- (void)_activeOriginDidChange:(void *)a3
{
  void *v5;

  v5 = (void *)qword_10001F1C0;
  if (os_log_type_enabled((os_log_t)qword_10001F1C0, OS_LOG_TYPE_DEBUG))
    sub_100010324(v5, a3);
  if (-[BTAVRCP_NowPlayingInfo mrActiveOrigin](self, "mrActiveOrigin") != a3)
  {
    if (-[BTAVRCP_NowPlayingInfo mrActiveOrigin](self, "mrActiveOrigin"))
      CFRelease(-[BTAVRCP_NowPlayingInfo mrActiveOrigin](self, "mrActiveOrigin"));
    -[BTAVRCP_NowPlayingInfo setMrActiveOrigin:](self, "setMrActiveOrigin:", a3);
    if (-[BTAVRCP_NowPlayingInfo mrActiveOrigin](self, "mrActiveOrigin"))
      CFRetain(-[BTAVRCP_NowPlayingInfo mrActiveOrigin](self, "mrActiveOrigin"));
  }
}

- (void)_supportedCommandsDidChange:(id)a3
{
  id v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t IntegerValueForKey;
  id v10;
  int Command;

  v4 = a3;
  if (os_log_type_enabled((os_log_t)qword_10001F1C0, OS_LOG_TYPE_DEBUG))
    sub_1000103C0();
  if (objc_msgSend(v4, "count"))
  {
    v5 = 0;
    v6 = kMRMediaRemoteCommandInfoShuffleMode;
    v7 = kMRMediaRemoteCommandInfoRepeatMode;
    v8 = 1;
    IntegerValueForKey = 1;
    do
    {
      v10 = objc_msgSend(v4, "objectAtIndex:", v5);
      Command = MRMediaRemoteCommandInfoGetCommand();
      if (Command == 26)
      {
        IntegerValueForKey = MRMediaRemoteCommandInfoGetIntegerValueForKey(v10, v6);
      }
      else if (Command == 25)
      {
        v8 = MRMediaRemoteCommandInfoGetIntegerValueForKey(v10, v7);
      }
      ++v5;
    }
    while (v5 < (unint64_t)objc_msgSend(v4, "count"));
  }
  else
  {
    IntegerValueForKey = 1;
    v8 = 1;
  }
  -[BTAVRCP_NowPlayingInfo _settingsDidChange:](self, "_settingsDidChange:", v8 | (unint64_t)(IntegerValueForKey << 32));

}

- (id)trackTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_NowPlayingInfo mrInfo](self, "mrInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", kMRMediaRemoteNowPlayingInfoTitle));

  return v3;
}

- (id)trackAlbum
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_NowPlayingInfo mrInfo](self, "mrInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", kMRMediaRemoteNowPlayingInfoAlbum));

  if (!v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_NowPlayingInfo mrInfo](self, "mrInfo"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", kMRMediaRemoteNowPlayingInfoRadioStationName));

  }
  return v4;
}

- (id)trackArtist
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_NowPlayingInfo mrInfo](self, "mrInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", kMRMediaRemoteNowPlayingInfoArtist));

  return v3;
}

- (id)trackGenre
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_NowPlayingInfo mrInfo](self, "mrInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", kMRMediaRemoteNowPlayingInfoGenre));

  return v3;
}

- (id)trackQueueIndex
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_NowPlayingInfo mrInfo](self, "mrInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", kMRMediaRemoteNowPlayingInfoQueueIndex));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v4, "unsignedIntValue") + 1));
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_NowPlayingInfo mrInfo](self, "mrInfo"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", kMRMediaRemoteNowPlayingInfoTrackNumber));

  }
  return v5;
}

- (id)trackQueueCount
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_NowPlayingInfo mrInfo](self, "mrInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", kMRMediaRemoteNowPlayingInfoQueueIndex));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_NowPlayingInfo mrInfo](self, "mrInfo"));
  v6 = v5;
  v7 = &kMRMediaRemoteNowPlayingInfoTotalTrackCount;
  if (v4)
    v7 = &kMRMediaRemoteNowPlayingInfoTotalQueueCount;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", *v7));

  return v8;
}

- (id)trackDuration
{
  void *v2;
  void *v3;
  double v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_NowPlayingInfo mrInfo](self, "mrInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", kMRMediaRemoteNowPlayingInfoDuration));

  if (v3)
  {
    objc_msgSend(v3, "doubleValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v4 * 1000.0));
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)trackPosition
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  float v10;
  float v11;
  void *v12;
  double v13;
  double v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_NowPlayingInfo mrInfo](self, "mrInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", kMRMediaRemoteNowPlayingInfoTimestamp));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_NowPlayingInfo mrInfo](self, "mrInfo"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", kMRMediaRemoteNowPlayingInfoElapsedTime));

    if (v6)
    {
      objc_msgSend(v6, "doubleValue");
      v8 = v7 * 1000.0 + 0.0;
    }
    else
    {
      v8 = 0.0;
    }
    -[BTAVRCP_NowPlayingInfo _playbackRate](self, "_playbackRate");
    if (v10 != 0.0)
    {
      v11 = v10;
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      objc_msgSend(v12, "timeIntervalSinceDate:", v4);
      v14 = v13;

      v8 = v8 + v14 * v11 * 1000.0;
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v8));

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)trackImageHandle
{
  void *v3;
  void *v4;
  NSString **p_currentArtworkIdentifier;
  NSString *currentArtworkIdentifier;
  void *v7;
  NSObject *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_NowPlayingInfo mrInfo](self, "mrInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", kMRMediaRemoteNowPlayingInfoArtworkIdentifier));

  if (v4)
  {
    currentArtworkIdentifier = self->_currentArtworkIdentifier;
    p_currentArtworkIdentifier = &self->_currentArtworkIdentifier;
    if ((objc_msgSend(v4, "isEqualToString:", currentArtworkIdentifier) & 1) == 0)
    {
      ++qword_10001F180;
      objc_storeStrong((id *)p_currentArtworkIdentifier, v4);
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%tu"), qword_10001F180));
  }
  else
  {
    v8 = qword_10001F1C0;
    if (os_log_type_enabled((os_log_t)qword_10001F1C0, OS_LOG_TYPE_ERROR))
      sub_100010420((uint64_t)self, v8);
    v7 = 0;
  }

  return v7;
}

- (BOOL)isBrowsablePlayer
{
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_NowPlayingInfo browsablePlayers](self, "browsablePlayers"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_NowPlayingInfo mrAppIdentifier](self, "mrAppIdentifier"));
  v5 = objc_msgSend(v3, "containsObject:", v4);

  return v5;
}

- (int)playerId
{
  if (-[BTAVRCP_NowPlayingInfo isBrowsablePlayer](self, "isBrowsablePlayer"))
    return 1;
  else
    return 2;
}

- (id)playerName
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_NowPlayingInfo mrAppIdentifier](self, "mrAppIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationProxy applicationProxyForIdentifier:](LSApplicationProxy, "applicationProxyForIdentifier:", v2));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedName"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedName"));
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mobileBluetoothBundle](NSBundle, "mobileBluetoothBundle"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("UNKNOWN_MEDIA_PLAYER"), CFSTR("Unknown Media Player"), 0));

  }
  return v5;
}

- (float)_playbackRate
{
  void *v3;
  void *v4;
  float v5;
  float v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_NowPlayingInfo mrInfo](self, "mrInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", kMRMediaRemoteNowPlayingInfoPlaybackRate));

  if (v4)
  {
    objc_msgSend(v4, "floatValue");
    v6 = v5;
  }
  else if (-[BTAVRCP_NowPlayingInfo mrAppIsPlaying](self, "mrAppIsPlaying"))
  {
    v6 = 1.0;
  }
  else
  {
    v6 = 0.0;
  }

  return v6;
}

- (float)_defaultPlaybackRate
{
  void *v2;
  void *v3;
  float v4;
  float v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_NowPlayingInfo mrInfo](self, "mrInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", kMRMediaRemoteNowPlayingInfoDefaultPlaybackRate));

  if (v3)
  {
    objc_msgSend(v3, "floatValue");
    v5 = v4;
  }
  else
  {
    v5 = 1.0;
  }

  return v5;
}

- (int64_t)playbackState
{
  float v3;
  float v5;
  float v6;

  if (!-[BTAVRCP_NowPlayingInfo mrAppIsPlaying](self, "mrAppIsPlaying"))
    return 2 * (-[BTAVRCP_NowPlayingInfo trackId](self, "trackId") != -1);
  -[BTAVRCP_NowPlayingInfo _playbackRate](self, "_playbackRate");
  if (v3 < 0.0)
    return 4;
  v5 = v3;
  if (v3 <= 1.0)
    return 1;
  -[BTAVRCP_NowPlayingInfo _defaultPlaybackRate](self, "_defaultPlaybackRate");
  if (v5 <= v6)
    return 1;
  else
    return 3;
}

- (void)_playbackStateDidChange
{
  void *v3;
  id v4;

  v3 = -[BTAVRCP_NowPlayingInfo playbackState](self, "playbackState");
  if (v3 != (void *)-[BTAVRCP_NowPlayingInfo currentPlaybackState](self, "currentPlaybackState"))
  {
    -[BTAVRCP_NowPlayingInfo setCurrentPlaybackState:](self, "setCurrentPlaybackState:", v3);
    v4 = (id)objc_claimAutoreleasedReturnValue(-[BTAVRCP_NowPlayingInfo delegate](self, "delegate"));
    objc_msgSend(v4, "playbackStateDidChange:", v3);

  }
}

- (unint64_t)_trackHash
{
  void *v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  unint64_t v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_NowPlayingInfo mrInfo](self, "mrInfo"));

  if (v3)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_NowPlayingInfo mrInfo](self, "mrInfo"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "objectForKeyedSubscript:", kMRMediaRemoteNowPlayingInfoAlbum));
    v4 = (unint64_t)objc_msgSend(v30, "hash");
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_NowPlayingInfo mrInfo](self, "mrInfo"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectForKeyedSubscript:", kMRMediaRemoteNowPlayingInfoArtist));
    v5 = (unint64_t)objc_msgSend(v28, "hash") ^ v4;
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_NowPlayingInfo mrInfo](self, "mrInfo"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKeyedSubscript:", kMRMediaRemoteNowPlayingInfoTitle));
    v6 = (unint64_t)objc_msgSend(v26, "hash");
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_NowPlayingInfo mrInfo](self, "mrInfo"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectForKeyedSubscript:", kMRMediaRemoteNowPlayingInfoGenre));
    v7 = v5 ^ v6 ^ (unint64_t)objc_msgSend(v24, "hash");
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_NowPlayingInfo mrInfo](self, "mrInfo"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKeyedSubscript:", kMRMediaRemoteNowPlayingInfoQueueIndex));
    v8 = (unint64_t)objc_msgSend(v22, "hash");
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_NowPlayingInfo mrInfo](self, "mrInfo"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", kMRMediaRemoteNowPlayingInfoTotalQueueCount));
    v10 = v8 ^ (unint64_t)objc_msgSend(v9, "hash");
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_NowPlayingInfo mrInfo](self, "mrInfo"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", kMRMediaRemoteNowPlayingInfoTrackNumber));
    v13 = v7 ^ v10 ^ (unint64_t)objc_msgSend(v12, "hash");
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_NowPlayingInfo mrInfo](self, "mrInfo"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", kMRMediaRemoteNowPlayingInfoTotalTrackCount));
    v16 = (unint64_t)objc_msgSend(v15, "hash");
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_NowPlayingInfo mrInfo](self, "mrInfo"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", kMRMediaRemoteNowPlayingInfoDuration));
    v19 = v13 ^ v16 ^ (unint64_t)objc_msgSend(v18, "hash");

  }
  else if (-[BTAVRCP_NowPlayingInfo isBrowsablePlayer](self, "isBrowsablePlayer"))
  {
    return -1;
  }
  else
  {
    return -[BTAVRCP_NowPlayingInfo mrAppIsPlaying](self, "mrAppIsPlaying") - 1;
  }
  return v19;
}

- (unint64_t)trackId
{
  unsigned int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  unint64_t v13;

  v3 = -[BTAVRCP_NowPlayingInfo isBrowsablePlayer](self, "isBrowsablePlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_NowPlayingInfo mrInfo](self, "mrInfo"));
  v5 = v4;
  if (v3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", kMRMediaRemoteNowPlayingInfoUniqueIdentifier));

    if (v6)
      goto LABEL_7;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_NowPlayingInfo mrInfo](self, "mrInfo"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", kMRMediaRemoteNowPlayingInfoiTunesStoreIdentifier));

    if (v6)
      goto LABEL_7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_NowPlayingInfo mrInfo](self, "mrInfo"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", kMRMediaRemoteNowPlayingInfoExternalContentIdentifier));

    if (v6
      || (v9 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_NowPlayingInfo mrInfo](self, "mrInfo")),
          v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", kMRMediaRemoteNowPlayingInfoiTunesStoreSubscriptionAdamIdentifier)), v9, v6)|| (v10 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_NowPlayingInfo mrInfo](self, "mrInfo")), v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", kMRMediaRemoteNowPlayingInfoRadioStationIdentifier)), v10, v6))
    {
LABEL_7:
      v11 = objc_opt_class(NSNumber);
      if ((objc_opt_isKindOfClass(v6, v11) & 1) != 0)
        v12 = objc_msgSend(v6, "unsignedLongLongValue");
      else
        v12 = objc_msgSend(v6, "hash");
      v13 = (unint64_t)v12;

    }
    else
    {
      return -1;
    }
  }
  else if (v4)
  {

    return 0;
  }
  else
  {
    return -[BTAVRCP_NowPlayingInfo mrAppIsPlaying](self, "mrAppIsPlaying") - 1;
  }
  return v13;
}

- (void)_trackDidChange
{
  void *v3;
  id v4;

  v3 = -[BTAVRCP_NowPlayingInfo _trackHash](self, "_trackHash");
  if (v3 != (void *)-[BTAVRCP_NowPlayingInfo currentTrackHash](self, "currentTrackHash"))
  {
    -[BTAVRCP_NowPlayingInfo setCurrentTrackHash:](self, "setCurrentTrackHash:", v3);
    v4 = (id)objc_claimAutoreleasedReturnValue(-[BTAVRCP_NowPlayingInfo delegate](self, "delegate"));
    objc_msgSend(v4, "trackDidChange:", -[BTAVRCP_NowPlayingInfo trackId](self, "trackId"));

  }
}

- (void)_settingsDidChange:(id)a3
{
  id v5;

  if (a3.var0 != -[BTAVRCP_NowPlayingInfo currentSettings](self, "currentSettings")
    || a3.var1 != (unint64_t)-[BTAVRCP_NowPlayingInfo currentSettings](self, "currentSettings") >> 32)
  {
    -[BTAVRCP_NowPlayingInfo setCurrentSettings:](self, "setCurrentSettings:", a3);
    v5 = (id)objc_claimAutoreleasedReturnValue(-[BTAVRCP_NowPlayingInfo delegate](self, "delegate"));
    objc_msgSend(v5, "settingsDidChange:", -[BTAVRCP_NowPlayingInfo currentSettings](self, "currentSettings"));

  }
}

- (BOOL)isLocalOrigin
{
  return MROriginIsLocalOrigin(-[BTAVRCP_NowPlayingInfo mrActiveOrigin](self, "mrActiveOrigin")) != 0;
}

- (BOOL)isMusicApp
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_NowPlayingInfo mrAppIdentifier](self, "mrAppIdentifier"));
  v3 = objc_msgSend(v2, "isEqualToString:", off_10001F048);

  return v3;
}

- (id)encodings
{
  return &off_100019C00;
}

- (id)widths
{
  return &off_100019C18;
}

- (id)heights
{
  return &off_100019C30;
}

- (BTAVRCP_NowPlayingInfoDelegate)delegate
{
  return (BTAVRCP_NowPlayingInfoDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSSet)browsablePlayers
{
  return self->_browsablePlayers;
}

- (NSDictionary)mrInfo
{
  return self->_mrInfo;
}

- (void)setMrInfo:(id)a3
{
  objc_storeStrong((id *)&self->_mrInfo, a3);
}

- (NSString)mrAppIdentifier
{
  return self->_mrAppIdentifier;
}

- (void)setMrAppIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_mrAppIdentifier, a3);
}

- (BOOL)mrAppIsPlaying
{
  return self->_mrAppIsPlaying;
}

- (void)setMrAppIsPlaying:(BOOL)a3
{
  self->_mrAppIsPlaying = a3;
}

- (void)mrActiveOrigin
{
  return self->_mrActiveOrigin;
}

- (void)setMrActiveOrigin:(void *)a3
{
  self->_mrActiveOrigin = a3;
}

- (int64_t)currentPlaybackState
{
  return self->_currentPlaybackState;
}

- (void)setCurrentPlaybackState:(int64_t)a3
{
  self->_currentPlaybackState = a3;
}

- (unint64_t)currentTrackHash
{
  return self->_currentTrackHash;
}

- (void)setCurrentTrackHash:(unint64_t)a3
{
  self->_currentTrackHash = a3;
}

- ($2825F4736939C4A6D3AD43837233062D)currentSettings
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_currentSettings;
}

- (void)setCurrentSettings:(id)a3
{
  self->_currentSettings = ($8A243AA3C134A41ABEE9DB00E2BD061F)a3;
}

- (NSString)currentArtworkIdentifier
{
  return self->_currentArtworkIdentifier;
}

- (void)setCurrentArtworkIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_currentArtworkIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentArtworkIdentifier, 0);
  objc_storeStrong((id *)&self->_mrAppIdentifier, 0);
  objc_storeStrong((id *)&self->_mrInfo, 0);
  objc_storeStrong((id *)&self->_browsablePlayers, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
