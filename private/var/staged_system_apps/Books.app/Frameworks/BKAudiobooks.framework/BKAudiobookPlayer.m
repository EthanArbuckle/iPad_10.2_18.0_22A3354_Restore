@implementation BKAudiobookPlayer

+ (BKAudiobookPlayer)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1A76C;
  block[3] = &unk_390A0;
  block[4] = a1;
  if (qword_44EC8 != -1)
    dispatch_once(&qword_44EC8, block);
  return (BKAudiobookPlayer *)(id)qword_44ED0;
}

+ (BKAudiobookPlayer)shared
{
  return +[BKAudiobookPlayer sharedInstance](BKAudiobookPlayer, "sharedInstance");
}

+ (id)testInstance
{
  return objc_alloc_init((Class)a1);
}

- (BKAudiobookPlayer)init
{
  BKAudiobookPlayer *v2;
  BKAudiobookPlayer *v3;
  uint64_t v4;
  NSHashTable *observers;
  BKAudiobookSkipController *v6;
  BKAudiobookSkipController *skipController;
  NSArray *standardRates;
  NSArray *precisionRates;
  float v10;
  BKAudiobookPlayerDataSource *v11;
  BKAudiobookPlayerDataSource *dataSource;
  BKAudiobookBufferProducer *v13;
  BKAudiobookBufferProducer *bufferProducer;
  void *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)BKAudiobookPlayer;
  v2 = -[BKAudiobookPlayer init](&v17, "init");
  v3 = v2;
  if (v2)
  {
    v2->_accessLock._os_unfair_lock_opaque = 0;
    v4 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](NSHashTable, "weakObjectsHashTable"));
    observers = v3->_observers;
    v3->_observers = (NSHashTable *)v4;

    -[BKAudiobookPlayer _configureAudioSession](v3, "_configureAudioSession");
    *(int64x2_t *)&v3->_currentTrackIndex = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    v6 = -[BKAudiobookSkipController initWithAudiobookControls:]([BKAudiobookSkipController alloc], "initWithAudiobookControls:", v3);
    skipController = v3->_skipController;
    v3->_skipController = v6;

    -[BKAudiobookSkipController setBaseEventInterval:](v3->_skipController, "setBaseEventInterval:", 0.4);
    -[BKAudiobookSkipController accelerateToInterval:afterEventCount:](v3->_skipController, "accelerateToInterval:afterEventCount:", 6, 0.2);
    -[BKAudiobookSkipController setPlaySkipSoundEffect:](v3->_skipController, "setPlaySkipSoundEffect:", 1);
    v3->_audibleDRMGroupID = -1;
    v3->_secondsToRewindAfterInterruption = 0;
    standardRates = v3->_standardRates;
    v3->_standardRates = (NSArray *)&off_3A098;

    precisionRates = v3->_precisionRates;
    v3->_precisionRates = (NSArray *)&off_3A0B0;

    v3->_playbackSpeed = -1;
    -[BKAudiobookPlayer _initialVolume](v3, "_initialVolume");
    v3->_volume = v10;
    v11 = objc_alloc_init(BKAudiobookPlayerDataSource);
    dataSource = v3->_dataSource;
    v3->_dataSource = v11;

    -[BKAudiobookPlayerDataSource setDelegate:](v3->_dataSource, "setDelegate:", v3);
    v13 = objc_opt_new(BKAudiobookBufferProducer);
    bufferProducer = v3->_bufferProducer;
    v3->_bufferProducer = v13;

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v15, "addObserver:selector:name:object:", v3, "_resetPlayer:", AVAudioSessionMediaServicesWereResetNotification, 0);

  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[BKAudiobookPlayer stop](self, "stop");
  -[BKAudiobookPlayer setObservers:](self, "setObservers:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPlayer player](self, "player"));
  objc_msgSend(v3, "setDelegate:", 0);

  -[BKAudiobookPlayer setPlayer:](self, "setPlayer:", 0);
  v4.receiver = self;
  v4.super_class = (Class)BKAudiobookPlayer;
  -[BKAudiobookPlayer dealloc](&v4, "dealloc");
}

- (NSError)lastError
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPlayer player](self, "player"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "lastError"));

  return (NSError *)v3;
}

- (void)setCurrentAudiobook:(id)a3
{
  -[BKAudiobookPlayer setCurrentAudiobook:initialPosition:](self, "setCurrentAudiobook:initialPosition:", a3, 0.0);
}

- (void)setCurrentAudiobook:(id)a3 initialPosition:(double)a4
{
  BKAudiobook *v7;
  void *v8;
  void *v9;
  BKAVPlayer *v10;
  void *v11;
  BKAVPlayer *v12;
  int v13;
  int v14;
  void *v15;
  double v16;
  void *v17;
  int64_t v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  void *i;
  double v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t v33[128];
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  double v37;

  v7 = (BKAudiobook *)a3;
  if (self->_currentAudiobook != v7)
  {
    -[BKAudiobookPlayer _sendAudiobookWillChange](self, "_sendAudiobookWillChange");
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPlayer player](self, "player"));
    objc_msgSend(v8, "setDelegate:", 0);

    *(int64x2_t *)&self->_currentTrackIndex = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    objc_storeStrong((id *)&self->_currentAudiobook, a3);
    if (v7)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPlayer player](self, "player"));

      if (!v9)
      {
        v10 = [BKAVPlayer alloc];
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPlayer dataSource](self, "dataSource"));
        v12 = -[BKAVPlayer initWithResourceLoader:](v10, "initWithResourceLoader:", v11);
        -[BKAudiobookPlayer setPlayer:](self, "setPlayer:", v12);

        -[BKAudiobookPlayer volume](self, "volume");
        v14 = v13;
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPlayer player](self, "player"));
        LODWORD(v16) = v14;
        objc_msgSend(v15, "setVolume:", v16);

        v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPlayer player](self, "player"));
        objc_msgSend(v17, "playbackRate");
        v18 = +[BKAudiobookPlayer playbackSpeedFrom:](BKAudiobookPlayer, "playbackSpeedFrom:");

        if (v18 != -1)
          self->_playbackSpeed = v18;
      }
    }
    else
    {
      -[BKAudiobookPlayer setPlayer:](self, "setPlayer:", 0);
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPlayer player](self, "player"));
    objc_msgSend(v19, "setDelegate:", self);

    v20 = BKAudiobooksLog();
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobook title](self->_currentAudiobook, "title"));
      *(_DWORD *)buf = 138412546;
      v35 = v22;
      v36 = 2048;
      v37 = a4;
      _os_log_impl(&dword_0, v21, OS_LOG_TYPE_INFO, "setCurrentAudiobook: %@ initialPosition:%.1lf", buf, 0x16u);

    }
    self->_durationOfCurrentAudiobook = 0.0;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobook tracks](self->_currentAudiobook, "tracks", 0));
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v25; i = (char *)i + 1)
        {
          if (*(_QWORD *)v30 != v26)
            objc_enumerationMutation(v23);
          objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i), "duration");
          self->_durationOfCurrentAudiobook = v28 + self->_durationOfCurrentAudiobook;
        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v25);
    }

    -[BKAudiobookPlayer movePositionInCurrentAudiobook:completion:](self, "movePositionInCurrentAudiobook:completion:", 0, a4);
    -[BKAudiobookPlayer setListeningSessionStartTime:](self, "setListeningSessionStartTime:", a4);
    -[BKAudiobookPlayer _sendAudiobookDidChange](self, "_sendAudiobookDidChange");
  }

}

- (BOOL)isStreaming
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPlayer player](self, "player"));
  v3 = objc_msgSend(v2, "isStreaming");

  return v3;
}

- (BOOL)isStalling
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPlayer player](self, "player"));
  v3 = objc_msgSend(v2, "isStalling");

  return v3;
}

- (BOOL)isLoadingResources
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPlayer player](self, "player"));
  v3 = objc_msgSend(v2, "isLoadingResources");

  return v3;
}

- (NSNumber)timeRemainingInBuffer
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPlayer bufferProducer](self, "bufferProducer"));
  -[BKAudiobookPlayer positionInCurrentTrack](self, "positionInCurrentTrack");
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "timeRemainingInBufferFromTrackPosition:"));

  return (NSNumber *)v4;
}

- (BKAudiobookBufferInfo)bufferInfo
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPlayer bufferProducer](self, "bufferProducer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "bufferInfo"));

  return (BKAudiobookBufferInfo *)v3;
}

- (BKAudiobookTrack)currentTrack
{
  unint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;

  -[BKAudiobookPlayer currentTrackIndex](self, "currentTrackIndex");
  v3 = -[BKAudiobookPlayer currentTrackIndex](self, "currentTrackIndex");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPlayer currentAudiobook](self, "currentAudiobook"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tracks"));
  v6 = objc_msgSend(v5, "count");

  if (v3 >= (unint64_t)v6)
  {
    v10 = BKAudiobooksLog();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_21E6C();

    v9 = 0;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPlayer currentAudiobook](self, "currentAudiobook"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "tracks"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", -[BKAudiobookPlayer currentTrackIndex](self, "currentTrackIndex")));

  }
  return (BKAudiobookTrack *)v9;
}

- (BKAudiobookChapter)currentChapter
{
  unint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  uint8_t v15[16];

  if (!self->_currentAudiobook)
  {
LABEL_10:
    v9 = 0;
    return (BKAudiobookChapter *)v9;
  }
  -[BKAudiobookPlayer currentChapterIndex](self, "currentChapterIndex");
  v3 = -[BKAudiobookPlayer currentChapterIndex](self, "currentChapterIndex");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPlayer currentAudiobook](self, "currentAudiobook"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "chapters"));
  v6 = objc_msgSend(v5, "count");

  if (v3 >= (unint64_t)v6)
  {
    v10 = -[BKAudiobookPlayer currentChapterIndex](self, "currentChapterIndex");
    v11 = BKAudiobooksLog();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    v13 = v12;
    if (v10 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "current chapter requested but not set", v15, 2u);
      }
    }
    else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      sub_21F10();
    }

    goto LABEL_10;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPlayer currentAudiobook](self, "currentAudiobook"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "chapters"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", -[BKAudiobookPlayer currentChapterIndex](self, "currentChapterIndex")));

  return (BKAudiobookChapter *)v9;
}

- (void)_addTimeObserversForTrack:(id)a3
{
  id v4;
  void *v5;
  NSMutableArray *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSNumber *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSNumber *v28;
  void *v29;
  uint64_t v30;
  NSMutableArray *v31;
  id v32;
  id v33;
  uint64_t v34;
  void *i;
  void *v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  CMTime v42;
  CMTime v43;
  CMTime v44;
  CMTime time;
  _BYTE v46[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPlayer player](self, "player"));
  objc_msgSend(v5, "removeAllTimeObservers");

  v6 = objc_opt_new(NSMutableArray);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "alternateArtworkTimes"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectEnumerator"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "chapters"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectEnumerator"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "nextObject"));
  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "nextObject"));
  v13 = (void *)v12;
  while (v11 && v13)
  {
    objc_msgSend(v13, "timeRangeInTrack");
    time = v44;
    v14 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", CMTimeGetSeconds(&time));
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    objc_msgSend(v11, "doubleValue");
    v17 = v16;
    objc_msgSend(v15, "doubleValue");
    if (vabdd_f64(v17, v18) >= 0.01)
    {
      objc_msgSend(v11, "doubleValue");
      v23 = v22;
      objc_msgSend(v15, "doubleValue");
      if (v23 >= v24)
      {
        -[NSMutableArray addObject:](v6, "addObject:", v15);
        v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "nextObject"));
        v21 = v13;
        v13 = (void *)v26;
      }
      else
      {
        -[NSMutableArray addObject:](v6, "addObject:", v11);
        v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "nextObject"));
        v21 = v11;
        v11 = (void *)v25;
      }
    }
    else
    {
      -[NSMutableArray addObject:](v6, "addObject:", v11);
      v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "nextObject"));

      v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "nextObject"));
      v21 = v13;
      v13 = (void *)v20;
      v11 = (void *)v19;
    }

  }
  if (v11)
  {
    do
    {
      -[NSMutableArray addObject:](v6, "addObject:", v11);
      v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "nextObject"));

      v11 = (void *)v27;
    }
    while (v27);
  }
  if (v13)
  {
    do
    {
      objc_msgSend(v13, "timeRangeInTrack");
      v43 = v42;
      v28 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", CMTimeGetSeconds(&v43));
      v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
      -[NSMutableArray addObject:](v6, "addObject:", v29);
      v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "nextObject"));

      v13 = (void *)v30;
    }
    while (v30);
  }
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v31 = v6;
  v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v33; i = (char *)i + 1)
      {
        if (*(_QWORD *)v39 != v34)
          objc_enumerationMutation(v31);
        v36 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)i);
        v37 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPlayer player](self, "player", (_QWORD)v38));
        objc_msgSend(v36, "doubleValue");
        objc_msgSend(v37, "addTimeObserver:");

      }
      v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
    }
    while (v33);
  }

}

- (void)setCurrentChapterIndex:(unint64_t)a3
{
  -[BKAudiobookPlayer _setCurrentChapterIndex:offset:completion:](self, "_setCurrentChapterIndex:offset:completion:", a3, 0, 0.0);
}

- (void)_setCurrentPosition:(double)a3 track:(unint64_t)a4 chapter:(unint64_t)a5 completion:(id)a6
{
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23[4];
  uint8_t buf[4];
  unint64_t v25;
  __int16 v26;
  unint64_t v27;
  __int16 v28;
  double v29;

  v10 = a6;
  v11 = BKAudiobooksLog();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218496;
    v25 = a4;
    v26 = 2048;
    v27 = a5;
    v28 = 2048;
    v29 = a3;
    _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "_setCurrentPosition: (track,chapter,offset) = (%lu,%lu,%f)", buf, 0x20u);
  }

  if (self->_currentTrackIndex == a4)
  {
    -[BKAudiobookPlayer _updatePlayerWithOffsetInTrack:chapterIndex:hasTrackChanged:changedArtworkBlock:currentTimeCompletion:](self, "_updatePlayerWithOffsetInTrack:chapterIndex:hasTrackChanged:changedArtworkBlock:currentTimeCompletion:", a5, 0, 0, v10, a3);
  }
  else
  {
    self->_currentTrackIndex = a4;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPlayer currentAudiobook](self, "currentAudiobook"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "tracks"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectAtIndexedSubscript:", a4));

    objc_initWeak((id *)buf, self);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPlayer player](self, "player"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "assetURL"));
    v18 = -[BKAudiobookPlayer audibleDRMGroupID](self, "audibleDRMGroupID");
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1B5F4;
    v20[3] = &unk_39140;
    objc_copyWeak(v23, (id *)buf);
    v19 = v15;
    v21 = v19;
    v23[1] = (id)a4;
    v23[2] = *(id *)&a3;
    v23[3] = (id)a5;
    v22 = v10;
    objc_msgSend(v16, "setAssetURL:audibleDRMGroupID:completion:", v17, v18, v20);

    objc_destroyWeak(v23);
    objc_destroyWeak((id *)buf);

  }
}

- (void)_updatePlayerWithOffsetInTrack:(double)a3 chapterIndex:(unint64_t)a4 hasTrackChanged:(BOOL)a5 changedArtworkBlock:(id)a6 currentTimeCompletion:(id)a7
{
  _BOOL4 v8;
  id v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  id v17;
  void *v18;
  id v19;

  v8 = a5;
  v19 = a6;
  v12 = a7;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPlayer player](self, "player"));
  objc_msgSend(v13, "currentTime");
  v15 = v14;

  if (v15 != a3)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPlayer player](self, "player"));
    objc_msgSend(v16, "setCurrentTime:completion:", v12, a3);

    if (self->_currentChapterIndex == a4)
      goto LABEL_7;
    goto LABEL_6;
  }
  if (self->_currentChapterIndex != a4)
  {
LABEL_6:
    self->_currentChapterIndex = a4;
    -[BKAudiobookPlayer _sendChapterDidChange](self, "_sendChapterDidChange");
    goto LABEL_7;
  }
  if (!v8)
  {
LABEL_12:
    v17 = objc_retainBlock(v12);
    v18 = v17;
    if (v17)
      (*((void (**)(id, uint64_t))v17 + 2))(v17, 1);

    goto LABEL_15;
  }
LABEL_7:
  if (-[BKAudiobookPlayer isPositionValid](self, "isPositionValid"))
    -[BKAudiobookPlayer _sendCurrentPositionDidChange](self, "_sendCurrentPositionDidChange");
  if (v8)
    -[BKAudiobookPlayer _sendArtworkDidChangeTo:](self, "_sendArtworkDidChangeTo:", v19);
  if (v15 == a3)
    goto LABEL_12;
LABEL_15:

}

- (void)_updateTimeBeforeCurrentTrackWithTrackIndex:(unint64_t)a3
{
  uint64_t i;
  void *v6;
  void *v7;
  double v8;

  self->_timeBeforeCurrentTrack = 0.0;
  if (a3)
  {
    for (i = 0; i != a3; ++i)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobook tracks](self->_currentAudiobook, "tracks"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", i));
      objc_msgSend(v7, "duration");
      self->_timeBeforeCurrentTrack = v8 + self->_timeBeforeCurrentTrack;

    }
  }
}

- (void)setCurrentTrackIndex:(unint64_t)a3
{
  -[BKAudiobookPlayer _setCurrentTrackIndex:offset:completion:](self, "_setCurrentTrackIndex:offset:completion:", a3, 0, 0.0);
}

- (void)_setCurrentTrackIndex:(unint64_t)a3 offset:(double)a4 completion:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  id v16;
  NSObject *v17;
  id v18;
  id v19;
  NSObject *v20;
  id v21;
  void *v22;

  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPlayer currentAudiobook](self, "currentAudiobook"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "tracks"));
  v11 = objc_msgSend(v10, "count");

  if ((unint64_t)v11 <= a3)
  {
    v16 = BKAudiobooksLog();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_22018();

    v18 = objc_retainBlock(v8);
    v14 = v18;
    if (v18)
      (*((void (**)(id, _QWORD))v18 + 2))(v18, 0);
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPlayer currentAudiobook](self, "currentAudiobook"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "tracks"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndexedSubscript:", a3));

    objc_msgSend(v14, "duration");
    if (v15 <= a4)
    {
      v19 = BKAudiobooksLog();
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        sub_21FB4();

      v21 = objc_retainBlock(v8);
      v22 = v21;
      if (v21)
        (*((void (**)(id, _QWORD))v21 + 2))(v21, 0);

    }
    else
    {
      -[BKAudiobookPlayer _setCurrentPosition:track:chapter:completion:](self, "_setCurrentPosition:track:chapter:completion:", a3, -[BKAudiobookPlayer _chapterAtOffset:inTrack:](self, "_chapterAtOffset:inTrack:", a3, a4), v8, a4);
    }
  }

}

- (BOOL)_setCurrentChapterIndex:(unint64_t)a3 offset:(double)a4 completion:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  id v16;
  NSObject *v17;
  id v18;
  id v19;
  NSObject *v20;
  id v21;
  void *v22;
  BOOL v23;
  CMTime v25;
  CMTime time;

  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPlayer currentAudiobook](self, "currentAudiobook"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "chapters"));
  v11 = objc_msgSend(v10, "count");

  if ((unint64_t)v11 <= a3)
  {
    v16 = BKAudiobooksLog();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_220DC();

    v18 = objc_retainBlock(v8);
    v14 = v18;
    if (v18)
      (*((void (**)(id, _QWORD))v18 + 2))(v18, 0);
    goto LABEL_14;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPlayer currentAudiobook](self, "currentAudiobook"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "chapters"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndexedSubscript:", a3));

  objc_msgSend(v14, "duration");
  if (v15 <= a4)
  {
    v19 = BKAudiobooksLog();
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_22078();

    v21 = objc_retainBlock(v8);
    v22 = v21;
    if (v21)
      (*((void (**)(id, _QWORD))v21 + 2))(v21, 0);

LABEL_14:
    v23 = 0;
    goto LABEL_17;
  }
  if (v14)
    objc_msgSend(v14, "timeRangeInTrack");
  else
    memset(&v25, 0, sizeof(v25));
  time = v25;
  -[BKAudiobookPlayer _setCurrentPosition:track:chapter:completion:](self, "_setCurrentPosition:track:chapter:completion:", objc_msgSend(v14, "albumTrackNumber"), a3, v8, CMTimeGetSeconds(&time) + a4);
  v23 = 1;
LABEL_17:

  return v23;
}

- (double)positionInCurrentAudiobook
{
  double v3;
  double v4;
  double v5;
  double result;

  -[BKAudiobookPlayer timeBeforeCurrentTrack](self, "timeBeforeCurrentTrack");
  v4 = v3;
  -[BKAudiobookPlayer positionInCurrentTrack](self, "positionInCurrentTrack");
  result = v4 + v5;
  if (self->_durationOfCurrentAudiobook < result)
    return self->_durationOfCurrentAudiobook;
  return result;
}

- (void)movePositionInCurrentAudiobook:(double)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  char *v9;
  char *v10;
  char *v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  id v17;
  NSObject *v18;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPlayer currentAudiobook](self, "currentAudiobook"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "tracks"));

  v9 = (char *)objc_msgSend(v8, "count");
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = 0.0;
    while (1)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", v11));
      objc_msgSend(v13, "duration");
      v15 = v12 + v14;
      if (v12 <= a3 && v15 > a3)
        break;

      ++v11;
      v12 = v15;
      if (v10 == v11)
        goto LABEL_9;
    }
    -[BKAudiobookPlayer _setCurrentTrackIndex:offset:completion:](self, "_setCurrentTrackIndex:offset:completion:", v11, v6, a3 - v12);

  }
  else
  {
LABEL_9:
    v17 = BKAudiobooksLog();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_2213C(self);

    -[BKAudiobookPlayer _setCurrentTrackIndex:offset:completion:](self, "_setCurrentTrackIndex:offset:completion:", 0, v6, 0.0);
  }

}

- (double)timeRemainingInCurrentAudiobook
{
  double v3;
  double v4;
  double v5;

  -[BKAudiobookPlayer durationOfCurrentAudiobook](self, "durationOfCurrentAudiobook");
  v4 = v3;
  -[BKAudiobookPlayer positionInCurrentAudiobook](self, "positionInCurrentAudiobook");
  return v4 - v5;
}

- (double)durationOfCurrentAudiobook
{
  return self->_durationOfCurrentAudiobook;
}

- (double)positionInCurrentTrack
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPlayer player](self, "player"));
  objc_msgSend(v2, "currentTime");
  v4 = v3;

  return v4;
}

- (void)movePositionInCurrentTrack:(double)a3 completion:(id)a4
{
  -[BKAudiobookPlayer _setCurrentTrackIndex:offset:completion:](self, "_setCurrentTrackIndex:offset:completion:", self->_currentTrackIndex, a4, a3);
}

- (BOOL)isPositionValid
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPlayer player](self, "player"));
  v3 = objc_msgSend(v2, "isCurrentTimeValid");

  return v3;
}

- (double)durationOfCurrentTrack
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPlayer currentTrack](self, "currentTrack"));
  objc_msgSend(v2, "duration");
  v4 = v3;

  return v4;
}

- (double)timeRemainingInCurrentTrack
{
  double v3;
  double v4;
  double v5;

  -[BKAudiobookPlayer durationOfCurrentTrack](self, "durationOfCurrentTrack");
  v4 = v3;
  -[BKAudiobookPlayer positionInCurrentTrack](self, "positionInCurrentTrack");
  return v4 - v5;
}

- (double)pausedDuration
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPlayer pausedTime](self, "pausedTime"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPlayer pausedTime](self, "pausedTime"));
    objc_msgSend(v4, "timeIntervalSinceDate:", v5);
    v7 = v6;

  }
  else
  {
    v7 = 0.0;
  }

  return v7;
}

- (double)positionInCurrentChapter
{
  void *v3;
  void *v4;
  Float64 Seconds;
  double v6;
  double v7;
  _BYTE v9[32];
  __int128 v10;
  CMTime time;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPlayer currentChapter](self, "currentChapter"));
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "timeRangeInTrack");
  }
  else
  {
    v10 = 0u;
    memset(v9, 0, sizeof(v9));
  }
  time = *(CMTime *)v9;
  Seconds = CMTimeGetSeconds(&time);
  -[BKAudiobookPlayer positionInCurrentTrack](self, "positionInCurrentTrack", Seconds, 0.0, *(_OWORD *)v9, *(_OWORD *)&v9[16], v10);
  v7 = v6 - Seconds;

  return v7;
}

- (void)movePositionInCurrentChapter:(double)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  id v10;
  NSObject *v11;
  id v12;
  void *v13;
  CMTime v14;
  CMTime time;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPlayer currentChapter](self, "currentChapter"));
  v8 = v7;
  if (a3 < 0.0 || (objc_msgSend(v7, "duration"), v9 <= a3))
  {
    v10 = BKAudiobooksLog();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_221D4();

    v12 = objc_retainBlock(v6);
    v13 = v12;
    if (v12)
      (*((void (**)(id, _QWORD))v12 + 2))(v12, 0);

  }
  else
  {
    if (v8)
      objc_msgSend(v8, "timeRangeInTrack");
    else
      memset(&v14, 0, sizeof(v14));
    time = v14;
    -[BKAudiobookPlayer _setCurrentPosition:track:chapter:completion:](self, "_setCurrentPosition:track:chapter:completion:", -[BKAudiobookPlayer currentTrackIndex](self, "currentTrackIndex"), -[BKAudiobookPlayer currentChapterIndex](self, "currentChapterIndex"), v6, CMTimeGetSeconds(&time) + a3);
  }

}

- (double)timeRemainingInCurrentChapter
{
  double v3;
  double v4;
  double v5;

  -[BKAudiobookPlayer durationOfCurrentChapter](self, "durationOfCurrentChapter");
  v4 = v3;
  -[BKAudiobookPlayer positionInCurrentChapter](self, "positionInCurrentChapter");
  return v4 - v5;
}

- (double)durationOfCurrentChapter
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPlayer currentChapter](self, "currentChapter"));
  objc_msgSend(v2, "duration");
  v4 = v3;

  return v4;
}

- (void)play
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[BKAudiobookPlayer player](self, "player"));
  objc_msgSend(v2, "play");

}

- (void)pause
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[BKAudiobookPlayer player](self, "player"));
  objc_msgSend(v2, "pause");

}

- (void)togglePlayPause
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[BKAudiobookPlayer player](self, "player"));
  objc_msgSend(v2, "togglePlayPause");

}

- (void)stop
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[BKAudiobookPlayer player](self, "player"));
  objc_msgSend(v2, "stop");

}

- (void)fadeIn:(double)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[BKAudiobookPlayer player](self, "player"));
  objc_msgSend(v4, "fadeIn:", a3);

}

- (void)fadeOut:(double)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[BKAudiobookPlayer player](self, "player"));
  objc_msgSend(v4, "fadeOut:", a3);

}

- (BOOL)playChapterAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  NSObject *v9;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPlayer currentAudiobook](self, "currentAudiobook"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "chapters"));
  v7 = objc_msgSend(v6, "count");

  if ((unint64_t)v7 > a3)
    return -[BKAudiobookPlayer playChapterAtIndex:offset:](self, "playChapterAtIndex:offset:", a3, 0.0);
  v8 = BKAudiobooksLog();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    sub_22240(self);

  return 0;
}

- (BOOL)playChapterAtIndex:(unint64_t)a3 offset:(double)a4
{
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  int v11;
  unint64_t v12;
  __int16 v13;
  double v14;

  v7 = BKAudiobooksLog();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 134218240;
    v12 = a3;
    v13 = 2048;
    v14 = a4;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "playChapterAtIndex:%lu offset:%f", (uint8_t *)&v11, 0x16u);
  }

  v9 = -[BKAudiobookPlayer _setCurrentChapterIndex:offset:completion:](self, "_setCurrentChapterIndex:offset:completion:", a3, 0, a4);
  if (v9)
    -[BKAudiobookPlayer play](self, "play");
  return v9;
}

- (BOOL)playNextChapter
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  id v7;
  id v9;
  NSObject *v10;
  uint8_t v11[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPlayer currentAudiobook](self, "currentAudiobook"));

  if (v3)
  {
    v4 = self->_currentChapterIndex + 1;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPlayer currentAudiobook](self, "currentAudiobook"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "chapters"));
    v7 = objc_msgSend(v6, "count");

    if (v4 < (unint64_t)v7)
    {
      -[BKAudiobookPlayer playChapterAtIndex:](self, "playChapterAtIndex:", v4);
      return 1;
    }
    v9 = BKAudiobooksLog();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "BKAudiobookPlayer stopping playback because there are no remaining chapters", v11, 2u);
    }

    -[BKAudiobookPlayer stop](self, "stop");
  }
  return 0;
}

- (BOOL)playPreviousChapter
{
  void *v3;
  unint64_t currentChapterIndex;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPlayer currentAudiobook](self, "currentAudiobook"));
  if (v3)
  {
    currentChapterIndex = self->_currentChapterIndex;

    if (currentChapterIndex)
    {
      -[BKAudiobookPlayer playChapterAtIndex:](self, "playChapterAtIndex:", self->_currentChapterIndex - 1);
      LOBYTE(v3) = 1;
    }
    else
    {
      LOBYTE(v3) = 0;
    }
  }
  return (char)v3;
}

- (BOOL)previousChapterOrRestartChapter
{
  void *v2;
  double v3;
  id v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  uint8_t v9[16];
  uint8_t buf[16];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[BKAudiobookPlayer sharedInstance](BKAudiobookPlayer, "sharedInstance"));
  objc_msgSend(v2, "positionInCurrentChapter");
  if (v3 <= 5.0 && objc_msgSend(v2, "currentChapterIndex"))
  {
    v4 = BKAudiobooksLog();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Within threshold. Going to previous chapter.", buf, 2u);
    }

    objc_msgSend(v2, "setCurrentChapterIndex:", (char *)objc_msgSend(v2, "currentChapterIndex") - 1);
  }
  else
  {
    v6 = BKAudiobooksLog();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Outside of threshold or no previous chapter. Restarting chapter.", v9, 2u);
    }

    objc_msgSend(v2, "movePositionInCurrentChapter:completion:", 0, 0.0);
  }

  return 1;
}

- (BOOL)nextChapterOrRestartAudiobook
{
  void *v2;
  char *v3;
  void *v4;
  void *v5;
  char *v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  char *v10;
  uint8_t v12[16];
  uint8_t buf[16];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[BKAudiobookPlayer sharedInstance](BKAudiobookPlayer, "sharedInstance"));
  v3 = (char *)objc_msgSend(v2, "currentChapterIndex");
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "currentAudiobook"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "chapters"));
  v6 = (char *)objc_msgSend(v5, "count") - 1;

  v7 = BKAudiobooksLog();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v3 >= v6)
  {
    if (v9)
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "At the last chapter. Restarting from beginning.", v12, 2u);
    }

    v10 = 0;
  }
  else
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Going to next chapter.", buf, 2u);
    }

    v10 = (char *)objc_msgSend(v2, "currentChapterIndex") + 1;
  }
  objc_msgSend(v2, "setCurrentChapterIndex:", v10);

  return 1;
}

- (int64_t)state
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPlayer player](self, "player"));
  v3 = objc_msgSend(v2, "state");

  return (int64_t)v3;
}

- (BOOL)isPlaying
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPlayer player](self, "player"));
  v3 = objc_msgSend(v2, "isPlaying");

  return v3;
}

- (BOOL)isScrubbing
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPlayer player](self, "player"));
  v3 = objc_msgSend(v2, "isScrubbing");

  return v3;
}

- (void)setScrubbing:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  _QWORD v6[4];
  id v7;
  id location;

  v3 = a3;
  if (-[BKAudiobookPlayer isScrubbing](self, "isScrubbing") != a3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPlayer player](self, "player"));
    objc_msgSend(v5, "setScrubbing:", v3);

    objc_initWeak(&location, self);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1C8E4;
    v6[3] = &unk_38850;
    objc_copyWeak(&v7, &location);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

- (float)playbackRate
{
  void *v2;
  float v3;
  float v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPlayer player](self, "player"));
  objc_msgSend(v2, "playbackRate");
  v4 = v3;

  return v4;
}

- (void)setPlaybackRate:(float)a3
{
  void *v5;
  double v6;
  double v7;
  int64_t v8;
  _QWORD v9[4];
  id v10;
  id location;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPlayer player](self, "player"));
  *(float *)&v6 = a3;
  objc_msgSend(v5, "setPlaybackRate:", v6);

  *(float *)&v7 = a3;
  v8 = +[BKAudiobookPlayer playbackSpeedFrom:](BKAudiobookPlayer, "playbackSpeedFrom:", v7);
  if (v8 != -1)
    self->_playbackSpeed = v8;
  objc_initWeak(&location, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1CA1C;
  v9[3] = &unk_38850;
  objc_copyWeak(&v10, &location);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (float)volume
{
  void *v3;
  void *v4;
  float v5;
  float volume;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPlayer player](self, "player"));
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "volume");
    volume = v5;
  }
  else
  {
    volume = self->_volume;
  }

  return volume;
}

- (void)setVolume:(float)a3
{
  double v4;
  id v5;

  if (self->_volume != a3)
  {
    self->_volume = a3;
    v5 = (id)objc_claimAutoreleasedReturnValue(-[BKAudiobookPlayer player](self, "player"));
    *(float *)&v4 = a3;
    objc_msgSend(v5, "setVolume:", v4);

  }
}

- (int64_t)playbackSpeed
{
  return self->_playbackSpeed;
}

- (void)setPlaybackSpeed:(int64_t)a3
{
  +[BKAudiobookPlayer playbackRateFrom:](BKAudiobookPlayer, "playbackRateFrom:", a3);
  -[BKAudiobookPlayer setPlaybackRate:](self, "setPlaybackRate:");
}

+ (float)playbackRateFrom:(int64_t)a3
{
  id v3;
  NSObject *v4;
  float result;

  switch(a3)
  {
    case -1:
      v3 = BKAudiobooksLog();
      v4 = objc_claimAutoreleasedReturnValue(v3);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        sub_222DC();

      result = 1.0;
      break;
    case 0:
      result = 0.75;
      break;
    case 1:
      result = 1.0;
      break;
    case 2:
      result = 1.25;
      break;
    case 3:
      result = 1.5;
      break;
    case 4:
      result = 1.75;
      break;
    case 5:
      result = 2.0;
      break;
    default:
      result = 0.0;
      break;
  }
  return result;
}

+ (int64_t)playbackSpeedFrom:(float)a3
{
  double v3;

  v3 = a3;
  if (fabs(v3 + -0.75) < 0.00999999978)
    return 0;
  if (fabs(v3 + -1.0) < 0.00999999978)
    return 1;
  if (fabs(v3 + -1.25) < 0.00999999978)
    return 2;
  if (fabs(v3 + -1.5) < 0.00999999978)
    return 3;
  if (fabs(v3 + -1.75) < 0.00999999978)
    return 4;
  if (fabs(v3 + -2.0) >= 0.00999999978)
    return -1;
  return 5;
}

- (void)_configureAudioSession
{
  id v2;
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  v2 = BKAudiobooksLog();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "_configureAudioSession", v5, 2u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](AVAudioSession, "sharedInstance"));
  objc_msgSend(v4, "setCategory:mode:routeSharingPolicy:options:error:", AVAudioSessionCategoryPlayback, AVAudioSessionModeSpokenAudio, 1, 0, 0);

}

- (void)resetPlayer
{
  -[BKAudiobookPlayer _resetPlayer:](self, "_resetPlayer:", 0);
}

- (void)_resetPlayer:(id)a3
{
  id v4;
  _QWORD *v5;
  _QWORD block[4];
  _QWORD *v7;
  _QWORD v8[4];
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1CE60;
  v8[3] = &unk_38850;
  objc_copyWeak(&v9, &location);
  v5 = objc_retainBlock(v8);
  if (v5)
  {
    if (+[NSThread isMainThread](NSThread, "isMainThread"))
    {
      ((void (*)(_QWORD *))v5[2])(v5);
    }
    else
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1CEB4;
      block[3] = &unk_386C0;
      v7 = v5;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    }
  }

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

- (unint64_t)_chapterAtOffset:(double)a3 inTrack:(unint64_t)a4
{
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  _QWORD v13[6];
  CMTime v14;
  CMTime v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v7 = BKAudiobooksLog();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    sub_22308();

  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  memset(&v15, 0, sizeof(v15));
  CMTimeMake(&v15, (uint64_t)((a3 + 0.001) * 1000.0), 1000);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPlayer currentAudiobook](self, "currentAudiobook"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "chapters"));

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1D018;
  v13[3] = &unk_39168;
  v14 = v15;
  v13[4] = &v16;
  v13[5] = a4;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v13);
  v11 = v17[3];

  _Block_object_dispose(&v16, 8);
  return v11;
}

- (float)_initialVolume
{
  return 1.0;
}

- (void)addObserver:(id)a3
{
  os_unfair_lock_s *p_accessLock;
  id v5;
  void *v6;

  p_accessLock = &self->_accessLock;
  v5 = a3;
  os_unfair_lock_lock(p_accessLock);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPlayer observers](self, "observers"));
  objc_msgSend(v6, "addObject:", v5);

  os_unfair_lock_unlock(p_accessLock);
}

- (void)removeObserver:(id)a3
{
  os_unfair_lock_s *p_accessLock;
  id v5;
  void *v6;

  p_accessLock = &self->_accessLock;
  v5 = a3;
  os_unfair_lock_lock(p_accessLock);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPlayer observers](self, "observers"));
  objc_msgSend(v6, "removeObject:", v5);

  os_unfair_lock_unlock(p_accessLock);
}

- (id)allObservers
{
  os_unfair_lock_s *p_accessLock;
  void *v4;
  void *v5;

  p_accessLock = &self->_accessLock;
  os_unfair_lock_lock(&self->_accessLock);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPlayer observers](self, "observers"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allObjects"));

  os_unfair_lock_unlock(p_accessLock);
  return v5;
}

- (void)_sendAudiobookWillChange
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t v17[128];
  uint8_t buf[4];
  void *v19;

  v3 = BKAudiobooksLog();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPlayer currentAudiobook](self, "currentAudiobook"));
    *(_DWORD *)buf = 138412290;
    v19 = v5;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "observer: audiobook will change = %@", buf, 0xCu);

  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPlayer allObservers](self, "allObservers", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v11, "player:audiobookWillChange:") & 1) != 0)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPlayer currentAudiobook](self, "currentAudiobook"));
          objc_msgSend(v11, "player:audiobookWillChange:", self, v12);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

}

- (void)_sendAudiobookDidChange
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t v17[128];
  uint8_t buf[4];
  void *v19;

  v3 = BKAudiobooksLog();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPlayer currentAudiobook](self, "currentAudiobook"));
    *(_DWORD *)buf = 138412290;
    v19 = v5;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "observer: audiobook did change = %@", buf, 0xCu);

  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPlayer allObservers](self, "allObservers", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v11, "player:audiobookDidChange:") & 1) != 0)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPlayer currentAudiobook](self, "currentAudiobook"));
          objc_msgSend(v11, "player:audiobookDidChange:", self, v12);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

}

- (void)_sendChapterDidChange
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t v16[128];
  uint8_t buf[4];
  unint64_t v18;

  v3 = BKAudiobooksLog();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v18 = -[BKAudiobookPlayer currentChapterIndex](self, "currentChapterIndex");
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "observer: chapter = %lu", buf, 0xCu);
  }

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPlayer allObservers](self, "allObservers", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v10, "player:chapterDidChange:") & 1) != 0)
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPlayer currentChapter](self, "currentChapter"));
          objc_msgSend(v10, "player:chapterDidChange:", self, v11);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  -[BKAudiobookPlayer _sendBufferedTimeRangesDidChange](self, "_sendBufferedTimeRangesDidChange");
}

- (void)_sendArtworkDidChangeTo:(id)a3
{
  uint64_t (**v4)(_QWORD);
  void *v5;
  id v6;
  __int128 v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *i;
  void *v12;
  id v13;
  NSObject *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  uint64_t v21;
  _BYTE v22[128];

  v4 = (uint64_t (**)(_QWORD))a3;
  if (self->_supportsAlternateArtwork)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPlayer allObservers](self, "allObservers"));
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
    if (v6)
    {
      v8 = v6;
      v9 = 0;
      v10 = *(_QWORD *)v17;
      *(_QWORD *)&v7 = 134217984;
      v15 = v7;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v5);
          v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
          if ((objc_opt_respondsToSelector(v12, "player:artworkDidChange:") & 1) != 0)
          {
            if (v4 && !v9)
            {
              v13 = BKAudiobooksLog();
              v14 = objc_claimAutoreleasedReturnValue(v13);
              if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = v15;
                v21 = 0;
                _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "observer: artwork = %p", buf, 0xCu);
              }

              v9 = v4[2](v4);
            }
            objc_msgSend(v12, "player:artworkDidChange:", self, v9, v15);
          }
        }
        v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
      }
      while (v8);
    }

  }
}

- (id)_stateString
{
  int64_t v2;

  v2 = -[BKAudiobookPlayer state](self, "state");
  if ((unint64_t)(v2 - 1) > 3)
    return CFSTR("unknown");
  else
    return off_391B0[v2 - 1];
}

- (void)_sendStateDidChangeFrom:(int64_t)a3 to:(int64_t)a4
{
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  void *v22;

  v7 = BKAudiobooksLog();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPlayer _stateString](self, "_stateString"));
    *(_DWORD *)buf = 138412290;
    v22 = v9;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "observer: state = %@", buf, 0xCu);

  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPlayer allObservers](self, "allObservers", 0));
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v15, "player:stateDidChangeFrom:to:") & 1) != 0)
          objc_msgSend(v15, "player:stateDidChangeFrom:to:", self, a3, a4);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v12);
  }

}

- (void)_sendCurrentPositionDidChange
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  double v11;
  double v12;
  unint64_t v13;
  double v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v3 = BKAudiobooksLog();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    sub_22378(self);

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPlayer allObservers](self, "allObservers", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v10, "player:currentPositionDidChange:inChapter:absolutePosition:") & 1) != 0)
        {
          -[BKAudiobookPlayer positionInCurrentChapter](self, "positionInCurrentChapter");
          v12 = v11;
          v13 = -[BKAudiobookPlayer currentChapterIndex](self, "currentChapterIndex");
          -[BKAudiobookPlayer positionInCurrentAudiobook](self, "positionInCurrentAudiobook");
          objc_msgSend(v10, "player:currentPositionDidChange:inChapter:absolutePosition:", self, v13, v12, v14);
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

}

- (void)_sendPlaybackRateDidChange
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t v16[128];
  uint8_t buf[4];
  uint64_t v18;

  v3 = BKAudiobooksLog();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    -[BKAudiobookPlayer positionInCurrentChapter](self, "positionInCurrentChapter");
    *(_DWORD *)buf = 134217984;
    v18 = v5;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "observer: position = %f", buf, 0xCu);
  }

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPlayer allObservers](self, "allObservers", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v11, "player:playbackRateDidChange:") & 1) != 0)
        {
          -[BKAudiobookPlayer playbackRate](self, "playbackRate");
          objc_msgSend(v11, "player:playbackRateDidChange:", self);
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

- (void)_sendPlayerFailedWithError:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  v5 = BKAudiobooksLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    sub_223E4();

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPlayer allObservers](self, "allObservers", 0));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v12, "player:failedWithError:") & 1) != 0)
          objc_msgSend(v12, "player:failedWithError:", self, v4);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (void)_sendPlayerStalledWithError:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  v5 = BKAudiobooksLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    sub_22444();

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPlayer allObservers](self, "allObservers", 0));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v12, "player:playbackStalledWithError:") & 1) != 0)
          objc_msgSend(v12, "player:playbackStalledWithError:", self, v4);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (void)_sendReachedEndOfAudiobook
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t v17[128];
  uint8_t buf[4];
  void *v19;

  v3 = BKAudiobooksLog();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPlayer currentAudiobook](self, "currentAudiobook"));
    *(_DWORD *)buf = 138412290;
    v19 = v5;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "observer: audiobook = %@", buf, 0xCu);

  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPlayer allObservers](self, "allObservers", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v11, "player:reachedEndOfAudiobook:") & 1) != 0)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPlayer currentAudiobook](self, "currentAudiobook"));
          objc_msgSend(v11, "player:reachedEndOfAudiobook:", self, v12);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

}

- (void)_sendIsScrubbing
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v3 = BKAudiobooksLog();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    sub_224A4(self);

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPlayer allObservers](self, "allObservers", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v10, "player:isScrubbing:") & 1) != 0)
          objc_msgSend(v10, "player:isScrubbing:", self, -[BKAudiobookPlayer isScrubbing](self, "isScrubbing"));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)_sendIsStallingAndIsLoadingResources
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = BKAudiobooksLog();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    sub_224A4(self);

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPlayer allObservers](self, "allObservers", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v10, "player:isStalling:isLoadingResources:") & 1) != 0)
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPlayer player](self, "player"));
          v12 = objc_msgSend(v11, "isStalling");
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPlayer player](self, "player"));
          objc_msgSend(v10, "player:isStalling:isLoadingResources:", self, v12, objc_msgSend(v13, "isLoadingResources"));

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

}

- (void)_sendBufferedTimeRangesDidChange
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  unint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPlayer bufferProducer](self, "bufferProducer"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPlayer currentChapter](self, "currentChapter"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPlayer bufferedStartTimes](self, "bufferedStartTimes"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPlayer bufferedDurations](self, "bufferedDurations"));
  objc_msgSend(v3, "updateWithChapter:bufferedTrackPositions:bufferedTrackDurations:", v4, v5, v6);

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPlayer allObservers](self, "allObservers", 0));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v12, "player:bufferedPositionsDidChangeInChapter:bufferInfo:") & 1) != 0)
        {
          v13 = -[BKAudiobookPlayer currentChapterIndex](self, "currentChapterIndex");
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPlayer bufferInfo](self, "bufferInfo"));
          objc_msgSend(v12, "player:bufferedPositionsDidChangeInChapter:bufferInfo:", self, v13, v14);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

}

- (void)player:(id)a3 stateChangedFrom:(int64_t)a4 to:(int64_t)a5
{
  id v8;
  id v9;
  NSObject *v10;
  __CFString *v11;
  void *v12;
  __CFString *v13;
  void *v14;
  id v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;

  v8 = a3;
  v9 = BKAudiobooksLog();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = NSStringFromBKAudiobookPlayerState(a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = NSStringFromBKAudiobookPlayerState(a5);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v17 = 138412546;
    v18 = v12;
    v19 = 2112;
    v20 = v14;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "Player state changed from %@ to %@", (uint8_t *)&v17, 0x16u);

  }
  v15 = (id)objc_claimAutoreleasedReturnValue(-[BKAudiobookPlayer player](self, "player"));

  if (v15 == v8)
  {
    if ((unint64_t)a5 >= 3)
    {
      if (a5 == 3)
      {
        if (a4 != 3)
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
          -[BKAudiobookPlayer setPausedTime:](self, "setPausedTime:", v16);

        }
        goto LABEL_9;
      }
      if (a5 != 4)
      {
LABEL_9:
        -[BKAudiobookPlayer _sendStateDidChangeFrom:to:](self, "_sendStateDidChangeFrom:to:", a4, a5);
        return;
      }
      -[BKAudiobookPlayer setCurrentTrackIndex:](self, "setCurrentTrackIndex:", 0);
    }
    -[BKAudiobookPlayer setPausedTime:](self, "setPausedTime:", 0);
    goto LABEL_9;
  }
}

- (void)player:(id)a3 positionDidChange:(double)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[BKAudiobookPlayer player](self, "player"));

  if (v6 == v5)
    -[BKAudiobookPlayer _sendCurrentPositionDidChange](self, "_sendCurrentPositionDidChange");
}

- (void)player:(id)a3 failedWithError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[BKAudiobookPlayer player](self, "player"));

  if (v7 == v9)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPlayer _playerErrorWithPlayer:error:](self, "_playerErrorWithPlayer:error:", v9, v6));
    -[BKAudiobookPlayer _sendPlayerFailedWithError:](self, "_sendPlayerFailedWithError:", v8);

  }
}

- (void)player:(id)a3 playbackStalledWithError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[BKAudiobookPlayer player](self, "player"));

  if (v7 == v9)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPlayer _playerErrorWithPlayer:error:](self, "_playerErrorWithPlayer:error:", v9, v6));
    -[BKAudiobookPlayer _sendPlayerStalledWithError:](self, "_sendPlayerStalledWithError:", v8);

  }
}

- (id)_playerErrorWithPlayer:(id)a3 error:(id)a4
{
  NSObject *v5;
  void *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  void *v12;
  unsigned int v13;
  id v14;
  id v15;
  void *v16;
  char *v17;
  char v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  id v24;
  NSErrorUserInfoKey v25;
  NSObject *v26;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "assetNetworkError"));
  if (v6)
  {
    v7 = BKAudiobooksLog();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_225F0();

    v9 = v5;
    v10 = 1;
    v5 = v6;
LABEL_5:

    v11 = 0;
    goto LABEL_13;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject domain](v5, "domain"));
  v13 = objc_msgSend(v12, "isEqualToString:", AVFoundationErrorDomain);

  if (v13)
  {
    v14 = -[NSObject code](v5, "code");
    if (v14 == (id)-11819)
    {
      v24 = BKAudiobooksLog();
      v9 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        sub_225C4();
      v10 = 3;
      goto LABEL_5;
    }
    if (v14 == (id)-11835)
    {
      v15 = BKAudiobooksLog();
      v9 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        sub_22598();
      v10 = 2;
      goto LABEL_5;
    }
  }
  v10 = 0;
  v11 = 1;
LABEL_13:
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject domain](v5, "domain"));
  if (!objc_msgSend(v16, "isEqualToString:", BLErrorDomain))
  {

    if (!v11)
      goto LABEL_20;
LABEL_23:
    v20 = BKAudiobooksLog();
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      sub_2251C();

    v10 = 0;
    if (v5)
      goto LABEL_21;
LABEL_26:
    v19 = 0;
    goto LABEL_27;
  }
  v17 = (char *)-[NSObject code](v5, "code");

  if (v17 == stru_20.segname)
    v18 = 0;
  else
    v18 = v11;
  if (v17 == stru_20.segname)
    v10 = 5;
  if ((v18 & 1) != 0)
    goto LABEL_23;
LABEL_20:
  if (!v5)
    goto LABEL_26;
LABEL_21:
  v25 = NSUnderlyingErrorKey;
  v26 = v5;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1));
LABEL_27:
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("BKAudiobookPlayerErrorDomain"), v10, v19));

  return v22;
}

- (void)player:(id)a3 stallingStateDidChange:(BOOL)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[BKAudiobookPlayer player](self, "player"));

  if (v6 == v5)
    -[BKAudiobookPlayer _sendIsStallingAndIsLoadingResources](self, "_sendIsStallingAndIsLoadingResources");
}

- (void)player:(id)a3 loadingResourcesStateDidChange:(BOOL)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[BKAudiobookPlayer player](self, "player"));

  if (v6 == v5)
    -[BKAudiobookPlayer _sendIsStallingAndIsLoadingResources](self, "_sendIsStallingAndIsLoadingResources");
}

- (void)player:(id)a3 didReachPosition:(double)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  unint64_t v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  void *v19;
  double v20;
  _QWORD v21[4];
  id v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t v28[128];
  uint8_t buf[4];
  double v30;

  v6 = a3;
  v7 = BKAudiobooksLog();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v30 = a4;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "handling boundary time: %.1f", buf, 0xCu);
  }

  v9 = (id)objc_claimAutoreleasedReturnValue(-[BKAudiobookPlayer player](self, "player"));
  if (v9 == v6)
  {
    if (objc_msgSend(v6, "isScrubbing"))
    {
      objc_msgSend(v6, "pause");
    }
    else
    {
      v10 = -[BKAudiobookPlayer _chapterAtOffset:inTrack:](self, "_chapterAtOffset:inTrack:", self->_currentTrackIndex, a4);
      if (v10 == self->_currentChapterIndex)
      {
        v11 = BKAudiobooksLog();
        v12 = objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          sub_2266C();

      }
      else
      {
        self->_currentChapterIndex = v10;
        -[BKAudiobookPlayer _sendChapterDidChange](self, "_sendChapterDidChange");
        -[BKAudiobookPlayer _sendCurrentPositionDidChange](self, "_sendCurrentPositionDidChange");
      }
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPlayer currentTrack](self, "currentTrack"));
      if (objc_msgSend(v13, "hasAlternateArtwork"))
      {
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "alternateArtworkTimes"));
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v25;
          while (2)
          {
            for (i = 0; i != v16; i = (char *)i + 1)
            {
              if (*(_QWORD *)v25 != v17)
                objc_enumerationMutation(v14);
              v19 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
              objc_msgSend(v19, "doubleValue");
              if (vabdd_f64(v20, a4) < 0.01)
              {
                v21[0] = _NSConcreteStackBlock;
                v21[1] = 3221225472;
                v21[2] = sub_1EF58;
                v21[3] = &unk_39190;
                v22 = v13;
                v23 = v19;
                -[BKAudiobookPlayer _sendArtworkDidChangeTo:](self, "_sendArtworkDidChangeTo:", v21);

                goto LABEL_22;
              }
            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
            if (v16)
              continue;
            break;
          }
        }
LABEL_22:

      }
    }
  }

}

- (void)playerCurrentItemEnded:(id)a3
{
  id v4;
  id v5;
  id v6;
  NSObject *v7;
  char *v8;
  void *v9;
  void *v10;
  char *v11;
  id v12;
  NSObject *v13;
  __int16 v14[8];
  uint8_t buf[16];

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[BKAudiobookPlayer player](self, "player"));

  if (v5 == v4)
  {
    v6 = BKAudiobooksLog();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "playerCurrentItemEnded:", buf, 2u);
    }

    v8 = (char *)-[BKAudiobookPlayer currentTrackIndex](self, "currentTrackIndex") + 1;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPlayer currentAudiobook](self, "currentAudiobook"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "tracks"));
    v11 = (char *)objc_msgSend(v10, "count");

    if (v8 >= v11)
    {
      v12 = BKAudiobooksLog();
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14[0] = 0;
        _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "playerCurrentItemEnded: stopping audiobook playback as there are no remaining tracks", (uint8_t *)v14, 2u);
      }

      -[BKAudiobookPlayer stop](self, "stop");
      -[BKAudiobookPlayer _sendReachedEndOfAudiobook](self, "_sendReachedEndOfAudiobook");
    }
    else
    {
      -[BKAudiobookPlayer setCurrentTrackIndex:](self, "setCurrentTrackIndex:", v8);
      -[BKAudiobookPlayer play](self, "play");
    }
  }
}

- (void)player:(id)a3 loadedTimeRangesDidChange:(id)a4 durations:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  v11 = (id)objc_claimAutoreleasedReturnValue(-[BKAudiobookPlayer player](self, "player"));

  if (v11 == v10)
  {
    v12 = objc_msgSend(v8, "count");
    if (v12 == objc_msgSend(v9, "count"))
    {
      -[BKAudiobookPlayer setBufferedStartTimes:](self, "setBufferedStartTimes:", v8);
      -[BKAudiobookPlayer setBufferedDurations:](self, "setBufferedDurations:", v9);
      -[BKAudiobookPlayer _sendBufferedTimeRangesDidChange](self, "_sendBufferedTimeRangesDidChange");
    }
    else
    {
      v13 = BKAudiobooksLog();
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        sub_226A4();

    }
  }

}

- (void)playerWasInterrupted:(id)a3
{
  double v4;

  if (self->_secondsToRewindAfterInterruption)
  {
    -[BKAudiobookPlayer positionInCurrentAudiobook](self, "positionInCurrentAudiobook", a3);
    -[BKAudiobookPlayer movePositionInCurrentAudiobook:completion:](self, "movePositionInCurrentAudiobook:completion:", 0, fmax(v4 - (double)self->_secondsToRewindAfterInterruption, 0.0));
  }
}

- (void)player:(id)a3 bitrateChangedFrom:(float)a4 to:(float)a5
{
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  double v14;
  double v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPlayer allObservers](self, "allObservers", a3, 0));
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v13, "player:bitRateChangedFrom:to:") & 1) != 0)
        {
          *(float *)&v14 = a4;
          *(float *)&v15 = a5;
          objc_msgSend(v13, "player:bitRateChangedFrom:to:", self, v14, v15);
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

}

- (void)player:(id)a3 volumeDidChange:(float)a4
{
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  double v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  self->_volume = a4;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPlayer allObservers](self, "allObservers", a3, 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v11, "player:volumeDidChange:") & 1) != 0)
        {
          *(float *)&v12 = a4;
          objc_msgSend(v11, "player:volumeDidChange:", self, v12);
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

}

- (id)mediaItem
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPlayer currentAudiobook](self, "currentAudiobook"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "representativeItem"));

  return v3;
}

- (BKAudiobook)currentAudiobook
{
  return self->_currentAudiobook;
}

- (unint64_t)currentTrackIndex
{
  return self->_currentTrackIndex;
}

- (unint64_t)currentChapterIndex
{
  return self->_currentChapterIndex;
}

- (double)listeningSessionStartTime
{
  return self->_listeningSessionStartTime;
}

- (void)setListeningSessionStartTime:(double)a3
{
  self->_listeningSessionStartTime = a3;
}

- (int)audibleDRMGroupID
{
  return self->_audibleDRMGroupID;
}

- (void)setAudibleDRMGroupID:(int)a3
{
  self->_audibleDRMGroupID = a3;
}

- (BKAudiobookSkipController)skipController
{
  return self->_skipController;
}

- (NSArray)standardRates
{
  return self->_standardRates;
}

- (void)setStandardRates:(id)a3
{
  objc_storeStrong((id *)&self->_standardRates, a3);
}

- (NSArray)precisionRates
{
  return self->_precisionRates;
}

- (void)setPrecisionRates:(id)a3
{
  objc_storeStrong((id *)&self->_precisionRates, a3);
}

- (BKAudiobookPlayerDataSource)dataSource
{
  return self->_dataSource;
}

- (unint64_t)secondsToRewindAfterInterruption
{
  return self->_secondsToRewindAfterInterruption;
}

- (void)setSecondsToRewindAfterInterruption:(unint64_t)a3
{
  self->_secondsToRewindAfterInterruption = a3;
}

- (BOOL)supportsAlternateArtwork
{
  return self->_supportsAlternateArtwork;
}

- (void)setSupportsAlternateArtwork:(BOOL)a3
{
  self->_supportsAlternateArtwork = a3;
}

- (BKAVPlayer)player
{
  return self->_player;
}

- (void)setPlayer:(id)a3
{
  objc_storeStrong((id *)&self->_player, a3);
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (double)timeBeforeCurrentTrack
{
  return self->_timeBeforeCurrentTrack;
}

- (void)setTimeBeforeCurrentTrack:(double)a3
{
  self->_timeBeforeCurrentTrack = a3;
}

- (_NSRange)currentChapterRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_currentChapterRange.length;
  location = self->_currentChapterRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setCurrentChapterRange:(_NSRange)a3
{
  self->_currentChapterRange = a3;
}

- (NSArray)bufferedStartTimes
{
  return self->_bufferedStartTimes;
}

- (void)setBufferedStartTimes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSArray)bufferedDurations
{
  return self->_bufferedDurations;
}

- (void)setBufferedDurations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (BKAudiobookBufferProducer)bufferProducer
{
  return self->_bufferProducer;
}

- (void)setBufferProducer:(id)a3
{
  objc_storeStrong((id *)&self->_bufferProducer, a3);
}

- (NSDate)pausedTime
{
  return self->_pausedTime;
}

- (void)setPausedTime:(id)a3
{
  objc_storeStrong((id *)&self->_pausedTime, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pausedTime, 0);
  objc_storeStrong((id *)&self->_bufferProducer, 0);
  objc_storeStrong((id *)&self->_bufferedDurations, 0);
  objc_storeStrong((id *)&self->_bufferedStartTimes, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_precisionRates, 0);
  objc_storeStrong((id *)&self->_standardRates, 0);
  objc_storeStrong((id *)&self->_skipController, 0);
  objc_storeStrong((id *)&self->_currentAudiobook, 0);
}

@end
