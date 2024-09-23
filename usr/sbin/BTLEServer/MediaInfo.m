@implementation MediaInfo

- (MediaInfo)init
{
  MediaInfo *v2;
  MediaInfo *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  MediaInfo *v8;
  MediaInfo *v9;
  MediaInfo *v10;
  MediaInfo *v11;
  void **v13;
  uint64_t v14;
  id (*v15)(uint64_t, uint64_t);
  void *v16;
  MediaInfo *v17;
  _QWORD v18[4];
  MediaInfo *v19;
  _QWORD v20[4];
  MediaInfo *v21;
  _QWORD v22[4];
  MediaInfo *v23;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)MediaInfo;
  v2 = -[MediaInfo init](&v24, "init");
  v3 = v2;
  if (v2)
  {
    v2->_currentPlaybackState = 0;
    v2->_currentSettings = ($8A243AA3C134A41ABEE9DB00E2BD061F)0x100000001;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, "mrSupportedCommandsDidChangeNotification", kMRMediaRemoteSupportedCommandsDidChangeNotification, 0);

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v5, "addObserver:selector:name:object:", v3, "mrApplicationDidChangeNotification:", kMRMediaRemoteNowPlayingApplicationDidChangeNotification, 0);

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v6, "addObserver:selector:name:object:", v3, "mrPlaybackStateDidChangeNotification:", kMRMediaRemoteNowPlayingApplicationPlaybackStateDidChangeNotification, 0);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v7, "addObserver:selector:name:object:", v3, "mrInfoDidChangeNotification", kMRMediaRemoteNowPlayingInfoDidChangeNotification, 0);

    MRMediaRemoteSetWantsSupportedCommandsChangedNotifications(1);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1000665B8;
    v22[3] = &unk_1000AE5C8;
    v8 = v3;
    v23 = v8;
    MRMediaRemoteCopySupportedCommands(&_dispatch_main_q, v22);
    MRMediaRemoteRegisterForNowPlayingNotifications(&_dispatch_main_q);

    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1000665E4;
    v20[3] = &unk_1000AE5F0;
    v9 = v8;
    v21 = v9;
    MRMediaRemoteGetNowPlayingApplicationDisplayID(&_dispatch_main_q, v20);

    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000665F0;
    v18[3] = &unk_1000AE618;
    v10 = v9;
    v19 = v10;
    MRMediaRemoteGetNowPlayingApplicationPlaybackState(&_dispatch_main_q, v18);

    v13 = _NSConcreteStackBlock;
    v14 = 3221225472;
    v15 = sub_1000665FC;
    v16 = &unk_1000AE640;
    v11 = v10;
    v17 = v11;
    MRMediaRemoteGetNowPlayingInfoWithOptionalArtwork(0, 0, &_dispatch_main_q, &v13);

    -[MediaInfo registerForAVNotifications](v11, "registerForAVNotifications", v13, v14, v15, v16);
  }
  return v3;
}

- (void)sendCommand:(unsigned __int8)a3
{
  uint64_t v3;
  void *v4;
  double v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;

  switch(a3)
  {
    case 0u:
      v3 = 0;
      goto LABEL_18;
    case 1u:
      v3 = 1;
      goto LABEL_18;
    case 2u:
      v3 = 2;
      goto LABEL_18;
    case 3u:
      v3 = 4;
      goto LABEL_18;
    case 4u:
      v3 = 5;
      goto LABEL_18;
    case 5u:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[AVSystemController sharedAVSystemController](AVSystemController, "sharedAVSystemController"));
      v6 = 1031798784;
      goto LABEL_9;
    case 6u:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[AVSystemController sharedAVSystemController](AVSystemController, "sharedAVSystemController"));
      v6 = -1115684864;
LABEL_9:
      LODWORD(v5) = v6;
      objc_msgSend(v4, "changeVolumeBy:forCategory:", CFSTR("Audio/Video"), v5, v4);

      return;
    case 7u:
      v3 = 7;
      goto LABEL_18;
    case 8u:
      v3 = 6;
      goto LABEL_18;
    case 9u:
      v14 = kMRMediaRemoteOptionSkipInterval;
      -[MediaInfo preferredIntervalForCommand:](self, "preferredIntervalForCommand:", 17);
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
      v15 = v7;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1));

      v9 = 17;
      goto LABEL_14;
    case 0xAu:
      v12 = kMRMediaRemoteOptionSkipInterval;
      -[MediaInfo preferredIntervalForCommand:](self, "preferredIntervalForCommand:", 18);
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
      v13 = v10;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1));

      v9 = 18;
LABEL_14:
      MRMediaRemoteSendCommand(v9, v8);

      return;
    case 0xBu:
      v3 = 21;
      goto LABEL_18;
    case 0xCu:
      v3 = 22;
      goto LABEL_18;
    case 0xDu:
      v3 = 23;
LABEL_18:
      MRMediaRemoteSendCommand(v3, 0);
      break;
    default:
      return;
  }
}

- (id)supportedCommands
{
  void *v3;
  $2825F4736939C4A6D3AD43837233062D v4;
  unsigned int var0;
  uint64_t IntegerValueForKey;
  CFIndex v7;
  uint64_t v8;
  uint64_t v9;
  const void *ValueAtIndex;
  int Command;
  _UNKNOWN **v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithObjects:](NSMutableSet, "setWithObjects:", &off_1000B3840, &off_1000B3858, 0));
  v4 = -[MediaInfo currentSettings](self, "currentSettings");
  var0 = v4.var0;
  IntegerValueForKey = HIDWORD(*(unint64_t *)&v4);
  if (-[MediaInfo currentSupportedCommands](self, "currentSupportedCommands")
    && CFArrayGetCount(-[MediaInfo currentSupportedCommands](self, "currentSupportedCommands")) >= 1)
  {
    v7 = 0;
    v8 = kMRMediaRemoteCommandInfoShuffleMode;
    v9 = kMRMediaRemoteCommandInfoRepeatMode;
    do
    {
      ValueAtIndex = CFArrayGetValueAtIndex(-[MediaInfo currentSupportedCommands](self, "currentSupportedCommands"), v7);
      Command = MRMediaRemoteCommandInfoGetCommand();
      v12 = &off_1000B3870;
      switch(Command)
      {
        case 0:
          goto LABEL_16;
        case 1:
          v12 = &off_1000B3888;
          goto LABEL_16;
        case 2:
          v12 = &off_1000B38A0;
          goto LABEL_16;
        case 4:
          v12 = &off_1000B38B8;
          goto LABEL_16;
        case 5:
          v12 = &off_1000B38D0;
          goto LABEL_16;
        case 6:
          v12 = &off_1000B3900;
          goto LABEL_16;
        case 7:
          v12 = &off_1000B38E8;
          goto LABEL_16;
        case 17:
          v12 = &off_1000B3918;
          goto LABEL_16;
        case 18:
          v12 = &off_1000B3930;
          goto LABEL_16;
        case 21:
          v12 = &off_1000B3948;
          goto LABEL_16;
        case 22:
          v12 = &off_1000B3960;
          goto LABEL_16;
        case 23:
          v12 = &off_1000B3978;
LABEL_16:
          objc_msgSend(v3, "addObject:", v12);
          break;
        case 25:
          var0 = MRMediaRemoteCommandInfoGetIntegerValueForKey(ValueAtIndex, v9, &off_1000B3870);
          break;
        case 26:
          IntegerValueForKey = MRMediaRemoteCommandInfoGetIntegerValueForKey(ValueAtIndex, v8, &off_1000B3870);
          break;
        default:
          break;
      }
      ++v7;
    }
    while (v7 < CFArrayGetCount(-[MediaInfo currentSupportedCommands](self, "currentSupportedCommands", v12)));
  }
  -[MediaInfo setCurrentSettings:](self, "setCurrentSettings:", var0 | (unint64_t)(IntegerValueForKey << 32));
  return v3;
}

- (id)playerName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MediaInfo currentIdentifier](self, "currentIdentifier"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MediaInfo currentIdentifier](self, "currentIdentifier"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationProxy applicationProxyForIdentifier:](LSApplicationProxy, "applicationProxyForIdentifier:", v4));

    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedName"));
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)playerPlaybackState
{
  float v3;
  _UNKNOWN **v4;
  float v5;
  float v6;

  -[MediaInfo playbackRate](self, "playbackRate");
  if (v3 < 0.0)
    return &off_1000B38A0;
  if (v3 == 0.0)
    return &off_1000B3870;
  v5 = v3;
  v4 = &off_1000B3888;
  if (v3 > 1.0)
  {
    -[MediaInfo defaultPlaybackRate](self, "defaultPlaybackRate");
    if (v5 != v6)
      return &off_1000B38B8;
  }
  return v4;
}

- (id)playerVolume
{
  void *v2;
  unsigned int v3;
  double v4;
  void *v5;
  int v7;

  v7 = 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AVSystemController sharedAVSystemController](AVSystemController, "sharedAVSystemController"));
  v3 = objc_msgSend(v2, "getVolume:forCategory:", &v7, CFSTR("Audio/Video"));

  if (v3)
  {
    LODWORD(v4) = v7;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v4));
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)playerElapsedTime
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

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MediaInfo currentInfo](self, "currentInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", kMRMediaRemoteNowPlayingInfoTimestamp));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MediaInfo currentInfo](self, "currentInfo"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", kMRMediaRemoteNowPlayingInfoElapsedTime));

    if (v6)
    {
      objc_msgSend(v6, "doubleValue");
      v8 = v7 + 0.0;
    }
    else
    {
      v8 = 0.0;
    }
    -[MediaInfo playbackRate](self, "playbackRate");
    if (v10 != 0.0)
    {
      v11 = v10;
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      objc_msgSend(v12, "timeIntervalSinceDate:", v4);
      v14 = v13;

      v8 = v8 + v14 * v11;
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v8));

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)queueIndex
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MediaInfo currentInfo](self, "currentInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", kMRMediaRemoteNowPlayingInfoQueueIndex));

  return v3;
}

- (id)queueCount
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MediaInfo currentInfo](self, "currentInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", kMRMediaRemoteNowPlayingInfoTotalQueueCount));

  return v3;
}

- (id)queueShuffleMode
{
  unsigned int v2;

  v2 = ((unint64_t)-[MediaInfo currentSettings](self, "currentSettings") >> 32) - 1;
  if (v2 > 2)
    return 0;
  else
    return (&off_1000AE660)[v2];
}

- (id)queueRepeatMode
{
  unsigned int v2;

  v2 = -[MediaInfo currentSettings](self, "currentSettings") - 1;
  if (v2 > 2)
    return 0;
  else
    return (&off_1000AE660)[v2];
}

- (id)trackArtist
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MediaInfo currentInfo](self, "currentInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", kMRMediaRemoteNowPlayingInfoArtist));

  return v3;
}

- (id)trackAlbum
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MediaInfo currentInfo](self, "currentInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", kMRMediaRemoteNowPlayingInfoAlbum));

  return v3;
}

- (id)trackTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MediaInfo currentInfo](self, "currentInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", kMRMediaRemoteNowPlayingInfoTitle));

  return v3;
}

- (id)trackDuration
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MediaInfo currentInfo](self, "currentInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", kMRMediaRemoteNowPlayingInfoDuration));

  return v3;
}

- (void)setCurrentSupportedCommands:(__CFArray *)a3
{
  __CFArray *currentSupportedCommands;
  __CFArray *v6;

  currentSupportedCommands = self->_currentSupportedCommands;
  if (currentSupportedCommands)
    CFRelease(currentSupportedCommands);
  if (a3)
    v6 = (__CFArray *)CFRetain(a3);
  else
    v6 = 0;
  self->_currentSupportedCommands = v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  MRMediaRemoteUnregisterForNowPlayingNotifications(-[MediaInfo unregisterForAVNotifications](self, "unregisterForAVNotifications"));
  MRMediaRemoteSetWantsSupportedCommandsChangedNotifications(0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  -[MediaInfo setCurrentSupportedCommands:](self, "setCurrentSupportedCommands:", 0);
  v4.receiver = self;
  v4.super_class = (Class)MediaInfo;
  -[MediaInfo dealloc](&v4, "dealloc");
}

- (void)registerForAVNotifications
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[2];

  v11[0] = AVSystemController_EffectiveVolumeDidChangeNotification;
  v11[1] = AVSystemController_ServerConnectionDiedNotification;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v11, 2));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[AVSystemController sharedAVSystemController](AVSystemController, "sharedAVSystemController"));
  objc_msgSend(v4, "setAttribute:forKey:error:", v3, AVSystemController_SubscribeToNotificationsAttribute, 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v6 = AVSystemController_EffectiveVolumeDidChangeNotification;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[AVSystemController sharedAVSystemController](AVSystemController, "sharedAVSystemController"));
  objc_msgSend(v5, "addObserver:selector:name:object:", self, "avEffectiveVolumeDidChangeNotification:", v6, v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v9 = AVSystemController_ServerConnectionDiedNotification;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[AVSystemController sharedAVSystemController](AVSystemController, "sharedAVSystemController"));
  objc_msgSend(v8, "addObserver:selector:name:object:", self, "avServerConnectionDiedNotification", v9, v10);

}

- (void)unregisterForAVNotifications
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, AVSystemController_ServerConnectionDiedNotification, 0);

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "removeObserver:name:object:", self, AVSystemController_EffectiveVolumeDidChangeNotification, 0);

}

- (void)supportedCommandsDidChange:(__CFArray *)a3
{
  id WeakRetained;

  -[MediaInfo setCurrentSupportedCommands:](self, "setCurrentSupportedCommands:", a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "supportedCommandsDidChange");

}

- (void)applicationDidChange:(id)a3
{
  id WeakRetained;

  if (!a3)
    a3 = CFSTR("com.apple.Music");
  -[MediaInfo setCurrentIdentifier:](self, "setCurrentIdentifier:", a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "mediaPlayerDidChange");

}

- (void)playbackStateDidChange:(unsigned int)a3
{
  id WeakRetained;

  -[MediaInfo setCurrentPlaybackState:](self, "setCurrentPlaybackState:", *(_QWORD *)&a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "mediaStateDidChange");

}

- (void)infoDidChange:(id)a3
{
  id WeakRetained;

  -[MediaInfo setCurrentInfo:](self, "setCurrentInfo:", a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "mediaInfoDidChange");

}

- (void)volumeDidChangeForCategory:(id)a3
{
  id WeakRetained;

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("Audio/Video")))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "mediaVolumeDidChange");

  }
}

- (void)mrSupportedCommandsDidChangeNotification
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1000673EC;
  v2[3] = &unk_1000AE5C8;
  v2[4] = self;
  MRMediaRemoteCopySupportedCommands(&_dispatch_main_q, v2);
}

- (void)mrApplicationDidChangeNotification:(id)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100067470;
  v3[3] = &unk_1000AE5F0;
  v3[4] = self;
  MRMediaRemoteGetNowPlayingApplicationDisplayID(&_dispatch_main_q, v3);
}

- (void)mrPlaybackStateDidChangeNotification:(id)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000674D4;
  v3[3] = &unk_1000AE618;
  v3[4] = self;
  MRMediaRemoteGetNowPlayingApplicationPlaybackState(&_dispatch_main_q, v3);
}

- (void)mrInfoDidChangeNotification
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100067540;
  v2[3] = &unk_1000AE640;
  v2[4] = self;
  MRMediaRemoteGetNowPlayingInfoWithOptionalArtwork(0, 0, &_dispatch_main_q, v2);
}

- (void)avEffectiveVolumeDidChangeNotification:(id)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", AVSystemController_EffectiveVolumeNotificationParameter_Category));
  -[MediaInfo volumeDidChangeForCategory:](self, "volumeDidChangeForCategory:", v4);

}

- (void)avServerConnectionDiedNotification
{
  -[MediaInfo unregisterForAVNotifications](self, "unregisterForAVNotifications");
  -[MediaInfo registerForAVNotifications](self, "registerForAVNotifications");
}

- (float)playbackRate
{
  void *v3;
  void *v4;
  float v5;
  float v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MediaInfo currentInfo](self, "currentInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", kMRMediaRemoteNowPlayingInfoPlaybackRate));

  if (v4)
  {
    objc_msgSend(v4, "floatValue");
    v6 = v5;
  }
  else if (-[MediaInfo currentPlaybackState](self, "currentPlaybackState") == 1)
  {
    v6 = 1.0;
  }
  else
  {
    v6 = 0.0;
  }

  return v6;
}

- (float)defaultPlaybackRate
{
  void *v2;
  void *v3;
  float v4;
  float v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MediaInfo currentInfo](self, "currentInfo"));
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

- (double)preferredIntervalForCommand:(unsigned int)a3
{
  CFIndex v5;
  const void *ValueAtIndex;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;

  if (CFArrayGetCount(-[MediaInfo currentSupportedCommands](self, "currentSupportedCommands")) < 1)
  {
LABEL_5:
    v7 = 0;
  }
  else
  {
    v5 = 0;
    while (1)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(-[MediaInfo currentSupportedCommands](self, "currentSupportedCommands"), v5);
      if (MRMediaRemoteCommandInfoGetCommand() == a3)
        break;
      if (++v5 >= CFArrayGetCount(-[MediaInfo currentSupportedCommands](self, "currentSupportedCommands")))
        goto LABEL_5;
    }
    v7 = (void *)MRMediaRemoteCommandInfoCopyValueForKey(ValueAtIndex, kMRMediaRemoteCommandInfoPreferredIntervalsKey);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "doubleValue");
    v11 = v10;
  }
  else
  {
    v11 = 15.0;
  }

  return v11;
}

- (__CFArray)currentSupportedCommands
{
  return self->_currentSupportedCommands;
}

- (MediaInfoDelegate)delegate
{
  return (MediaInfoDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)currentIdentifier
{
  return self->_currentIdentifier;
}

- (void)setCurrentIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_currentIdentifier, a3);
}

- (unsigned)currentPlaybackState
{
  return self->_currentPlaybackState;
}

- (void)setCurrentPlaybackState:(unsigned int)a3
{
  self->_currentPlaybackState = a3;
}

- (NSDictionary)currentInfo
{
  return self->_currentInfo;
}

- (void)setCurrentInfo:(id)a3
{
  objc_storeStrong((id *)&self->_currentInfo, a3);
}

- ($2825F4736939C4A6D3AD43837233062D)currentSettings
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_currentSettings;
}

- (void)setCurrentSettings:(id)a3
{
  self->_currentSettings = ($8A243AA3C134A41ABEE9DB00E2BD061F)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentInfo, 0);
  objc_storeStrong((id *)&self->_currentIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
