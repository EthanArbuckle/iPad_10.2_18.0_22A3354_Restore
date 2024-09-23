@implementation AEAudiobookReadingTimeTracker

+ (id)startTracking
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_88DA8;
  block[3] = &unk_1C0C98;
  block[4] = a1;
  if (qword_20F568 != -1)
    dispatch_once(&qword_20F568, block);
  return (id)qword_20F570;
}

+ (id)testInstanceWithPlayer:(id)a3 bcTracker:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend(objc_alloc((Class)a1), "initWithPlayer:", v7);

  objc_msgSend(v8, "setBcTracker:", v6);
  return v8;
}

- (AEAudiobookReadingTimeTracker)initWithPlayer:(id)a3
{
  id v5;
  AEAudiobookReadingTimeTracker *v6;
  AEAudiobookReadingTimeTracker *v7;
  void *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AEAudiobookReadingTimeTracker;
  v6 = -[AEAudiobookReadingTimeTracker init](&v10, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_player, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[AEAudiobookReadingTimeTracker player](v7, "player"));
    objc_msgSend(v8, "addObserver:", v7);

  }
  return v7;
}

- (void)player:(id)a3 audiobookWillChange:(id)a4
{
  void *v5;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AEAudiobookReadingTimeTracker sessionID](self, "sessionID", a3, a4));

  if (v5)
    -[AEAudiobookReadingTimeTracker _endReadingSessionForEventType:](self, "_endReadingSessionForEventType:", 9);
}

- (void)player:(id)a3 audiobookDidChange:(id)a4
{
  void *v5;

  if (objc_msgSend(a3, "state") == (char *)&dword_0 + 2)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[AEAudiobookReadingTimeTracker sessionID](self, "sessionID"));

    if (!v5)
      -[AEAudiobookReadingTimeTracker _beginReadingSessionForEventType:](self, "_beginReadingSessionForEventType:", 7);
  }
}

- (void)player:(id)a3 stateDidChangeFrom:(int64_t)a4 to:(int64_t)a5
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  void *v16;

  v7 = a3;
  if (a5 == 3)
  {
    v16 = v7;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[AEAudiobookReadingTimeTracker sessionID](self, "sessionID"));

    v7 = v16;
    if (v11)
    {
      v12 = objc_msgSend(v16, "isScrubbing");
      v7 = v16;
      if ((v12 & 1) == 0)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "skipController"));
        if (objc_msgSend(v13, "isSkipping"))
        {

        }
        else
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "skipController"));
          v15 = objc_msgSend(v14, "isSeeking");

          v7 = v16;
          if ((v15 & 1) != 0)
            goto LABEL_15;
          -[AEAudiobookReadingTimeTracker _endReadingSessionForEventType:](self, "_endReadingSessionForEventType:", 10);
        }
LABEL_14:
        v7 = v16;
      }
    }
  }
  else if (a5 == 2)
  {
    v16 = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[AEAudiobookReadingTimeTracker sessionID](self, "sessionID"));

    v7 = v16;
    if (!v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[AEAudiobookReadingTimeTracker pausedTime](self, "pausedTime"));

      if (v9)
        v10 = 11;
      else
        v10 = 7;
      -[AEAudiobookReadingTimeTracker _beginReadingSessionForEventType:](self, "_beginReadingSessionForEventType:", v10);
      goto LABEL_14;
    }
  }
LABEL_15:

}

- (void)_beginReadingSessionForEventType:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  unint64_t v19;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  -[AEAudiobookReadingTimeTracker setSessionID:](self, "setSessionID:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AEAudiobookReadingTimeTracker player](self, "player"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentAudiobook"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "assetID"));

  v9 = _AEBookPluginsAudiobookLog();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[AEAudiobookReadingTimeTracker sessionID](self, "sessionID"));
    v14 = 138543874;
    v15 = v11;
    v16 = 2112;
    v17 = v8;
    v18 = 2048;
    v19 = a3;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "beginReadingSession: %{public}@ assetID:%@ eventType:%lu", (uint8_t *)&v14, 0x20u);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[AEAudiobookReadingTimeTracker bcTracker](self, "bcTracker"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[AEAudiobookReadingTimeTracker sessionID](self, "sessionID"));
  objc_msgSend(v12, "trackReadingSessionBeganWithAssetID:sessionID:trackerEventType:readingFeatureFlags:completion:", v8, v13, a3, 1, 0);

}

- (void)_endReadingSessionForEventType:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  unint64_t v19;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AEAudiobookReadingTimeTracker player](self, "player"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentAudiobook"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "assetID"));

  v8 = _AEBookPluginsAudiobookLog();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[AEAudiobookReadingTimeTracker sessionID](self, "sessionID"));
    v14 = 138543874;
    v15 = v10;
    v16 = 2112;
    v17 = v7;
    v18 = 2048;
    v19 = a3;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "endReadingSession:%{public}@ assetID:%@ eventType:%lu", (uint8_t *)&v14, 0x20u);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[AEAudiobookReadingTimeTracker bcTracker](self, "bcTracker"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[AEAudiobookReadingTimeTracker sessionID](self, "sessionID"));
  objc_msgSend(v11, "trackReadingSessionEndedWithAssetID:sessionID:trackerEventType:readingFeatureFlags:completion:", v7, v12, a3, 1, 0);

  if (a3 == 10)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    -[AEAudiobookReadingTimeTracker setPausedTime:](self, "setPausedTime:", v13);

  }
  else
  {
    -[AEAudiobookReadingTimeTracker setPausedTime:](self, "setPausedTime:", 0);
  }
  -[AEAudiobookReadingTimeTracker setSessionID:](self, "setSessionID:", 0);

}

- (BKAudiobookPlayer)player
{
  return self->_player;
}

- (void)setPlayer:(id)a3
{
  objc_storeStrong((id *)&self->_player, a3);
}

- (NSDate)pausedTime
{
  return self->_pausedTime;
}

- (void)setPausedTime:(id)a3
{
  self->_pausedTime = (NSDate *)a3;
}

- (NSUUID)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
  objc_storeStrong((id *)&self->_sessionID, a3);
}

- (BCBookReadingTimeTracker)bcTracker
{
  return self->_bcTracker;
}

- (void)setBcTracker:(id)a3
{
  objc_storeStrong((id *)&self->_bcTracker, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bcTracker, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_player, 0);
}

@end
