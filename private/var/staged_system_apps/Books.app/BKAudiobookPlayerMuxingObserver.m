@implementation BKAudiobookPlayerMuxingObserver

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10018D340;
  block[3] = &unk_1008E7458;
  block[4] = a1;
  if (qword_1009F5178 != -1)
    dispatch_once(&qword_1009F5178, block);
  return (id)qword_1009F5180;
}

- (BKAudiobookPlayerMuxingObserver)init
{
  BKAudiobookPlayerMuxingObserver *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BKAudiobookPlayerMuxingObserver;
  v2 = -[BKAudiobookPlayerMuxingObserver init](&v6, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[BKAudiobookPlayer sharedInstance](BKAudiobookPlayer, "sharedInstance"));
    objc_msgSend(v3, "addObserver:", v2);

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[BCAudioMuxingCoordinator sharedInstance](BCAudioMuxingCoordinator, "sharedInstance"));
    objc_msgSend(v4, "addAudioMuxingObserver:", v2);

  }
  return v2;
}

- (void)audioPlaybackWillStart:(id)a3
{
  BKAudiobookPlayerMuxingObserver *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  int v9;
  BKAudiobookPlayerMuxingObserver *v10;

  v4 = (BKAudiobookPlayerMuxingObserver *)a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[BKAudiobookNowPlayingAdaptor sharedInstance](BKAudiobookNowPlayingAdaptor, "sharedInstance"));
  objc_msgSend(v5, "setAudiobookPlayerActiveOutput:", v4 == self);

  if (v4 != self)
  {
    v6 = BCAudiobooksAppLog();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138543362;
      v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Pausing audiobook playback because another object is going to start playing: %{public}@", (uint8_t *)&v9, 0xCu);
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[BKAudiobookPlayer sharedInstance](BKAudiobookPlayer, "sharedInstance"));
    objc_msgSend(v8, "pause");

  }
}

- (void)player:(id)a3 stateDidChangeFrom:(int64_t)a4 to:(int64_t)a5
{
  id v6;

  if (a5 == 2)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(+[BCAudioMuxingCoordinator sharedInstance](BCAudioMuxingCoordinator, "sharedInstance", a3, a4));
    objc_msgSend(v6, "notifyPlaybackWillStart:", self);

  }
}

@end
