@implementation CRLMediaPlayerTimeController

- (CRLMediaPlayerTimeController)initWithPlayerController:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  CRLMediaPlayerTimeController *v9;
  CRLMediaPlayerTimeController *v10;
  objc_super v12;

  v5 = a3;
  if (!v5)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101237590);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF9C68();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012375B0);
    v6 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMediaPlayerTimeController initWithPlayerController:]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLMediaPlayerTimeController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 37, 0, "Invalid parameter not satisfying: %{public}s", "playerController != nil");

  }
  v12.receiver = self;
  v12.super_class = (Class)CRLMediaPlayerTimeController;
  v9 = -[CRLMediaPlayerTimeController init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->mPlayerController, a3);
    -[CRLMediaPlayerTimeController setUpdateInterval:](v10, "setUpdateInterval:", 1.0);
    -[CRLMediaPlayerController addObserver:forKeyPath:options:context:](v10->mPlayerController, "addObserver:forKeyPath:options:context:", v10, CFSTR("hasCurrentTime"), 4, off_1013D9600);
    v10->mObservingPlayerControllerHasCurrentTime = 1;
  }

  return v10;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  if (self->mObservingPlayerControllerHasCurrentTime)
    -[CRLMediaPlayerController removeObserver:forKeyPath:context:](self->mPlayerController, "removeObserver:forKeyPath:context:", self, CFSTR("hasCurrentTime"), off_1013D9600);
  if (self->mTimeObserver)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012375D0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF9CF4();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012375F0);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMediaPlayerTimeController dealloc]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLMediaPlayerTimeController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 53, 0, "expected nil value for '%{public}s'", "mTimeObserver");

  }
  v6.receiver = self;
  v6.super_class = (Class)CRLMediaPlayerTimeController;
  -[CRLMediaPlayerTimeController dealloc](&v6, "dealloc");
}

- (void)startObservingTime
{
  void *v3;
  void *v4;
  void *v5;

  if (self->mTimeObserver)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101237610);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF9D80();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101237630);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMediaPlayerTimeController startObservingTime]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLMediaPlayerTimeController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 59, 0, "expected nil value for '%{public}s'", "mTimeObserver");

  }
  -[CRLMediaPlayerTimeController p_createTimeObserver](self, "p_createTimeObserver");
  -[CRLMediaPlayerTimeController p_setTimeValuesWithoutScrubbing](self, "p_setTimeValuesWithoutScrubbing");
}

- (void)stopObservingTime
{
  -[CRLMediaPlayerTimeController p_teardownTimeObserver](self, "p_teardownTimeObserver");
  -[CRLMediaPlayerTimeController p_setTimeValuesWithoutScrubbing](self, "p_setTimeValuesWithoutScrubbing");
}

- (void)p_createTimeObserver
{
  int v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  double mUpdateInterval;
  void *v9;
  double v10;
  uint64_t v11;
  id *p_mTimeObserver;
  id mTimeObserver;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id location;
  uint8_t buf[4];
  double v23;
  __int16 v24;
  CRLMediaPlayerTimeController *v25;

  if (self->mTimeObserver)
  {
    v3 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101237650);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF9F48();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101237670);
    v4 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF9E98(v4, v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMediaPlayerTimeController p_createTimeObserver]"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLMediaPlayerTimeController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 74, 0, "expected nil value for '%{public}s'", "mTimeObserver");

  }
  if (qword_10147E5C8 != -1)
    dispatch_once(&qword_10147E5C8, &stru_101237690);
  v7 = off_1013DB560;
  if (os_log_type_enabled((os_log_t)off_1013DB560, OS_LOG_TYPE_DEFAULT))
  {
    mUpdateInterval = self->mUpdateInterval;
    *(_DWORD *)buf = 134218240;
    v23 = mUpdateInterval;
    v24 = 2048;
    v25 = self;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Creating time observer with interval %f for %p", buf, 0x16u);
  }
  objc_initWeak(&location, self);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMediaPlayerTimeController playerController](self, "playerController"));
  v10 = self->mUpdateInterval;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000F306C;
  v19[3] = &unk_10122D4C0;
  objc_copyWeak(&v20, &location);
  v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "addPeriodicTimeObserverForInterval:block:", v19, v10));
  mTimeObserver = self->mTimeObserver;
  p_mTimeObserver = &self->mTimeObserver;
  *p_mTimeObserver = (id)v11;

  if (!*p_mTimeObserver)
  {
    v14 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012376B0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF9E0C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012376D0);
    v15 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_ERROR))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DEE33C(v16, (uint64_t)buf, v14, v15);
    }

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMediaPlayerTimeController p_createTimeObserver]"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLMediaPlayerTimeController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v17, v18, 82, 0, "invalid nil value for '%{public}s'", "mTimeObserver");

  }
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

- (void)p_teardownTimeObserver
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id mTimeObserver;
  uint8_t buf[4];
  CRLMediaPlayerTimeController *v10;

  if (self->mTimeObserver)
    goto LABEL_11;
  +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_1012376F0);
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100DF9FD4();
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101237710);
  v3 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100DE7468(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMediaPlayerTimeController p_teardownTimeObserver]"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLMediaPlayerTimeController.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 86, 0, "invalid nil value for '%{public}s'", "mTimeObserver");

  if (self->mTimeObserver)
  {
LABEL_11:
    if (qword_10147E5C8 != -1)
      dispatch_once(&qword_10147E5C8, &stru_101237730);
    v6 = off_1013DB560;
    if (os_log_type_enabled((os_log_t)off_1013DB560, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v10 = self;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Tear down time observer for %p", buf, 0xCu);
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMediaPlayerTimeController playerController](self, "playerController"));
    objc_msgSend(v7, "removePeriodicTimeObserver:", self->mTimeObserver);

    mTimeObserver = self->mTimeObserver;
    self->mTimeObserver = 0;

  }
}

- (void)p_setTimeValuesWithoutScrubbing
{
  void *v3;
  double v4;
  void *v5;
  double v6;
  void *v7;
  double v8;

  -[CRLMediaPlayerTimeController willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("absoluteCurrentTime"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMediaPlayerTimeController playerController](self, "playerController"));
  objc_msgSend(v3, "absoluteCurrentTime");
  self->mAbsoluteCurrentTime = v4;

  -[CRLMediaPlayerTimeController didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("absoluteCurrentTime"));
  -[CRLMediaPlayerTimeController willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("currentTime"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMediaPlayerTimeController playerController](self, "playerController"));
  objc_msgSend(v5, "currentTime");
  self->mCurrentTime = v6;

  -[CRLMediaPlayerTimeController didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("currentTime"));
  -[CRLMediaPlayerTimeController willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("remainingTime"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMediaPlayerTimeController playerController](self, "playerController"));
  objc_msgSend(v7, "remainingTime");
  self->mRemainingTime = v8;

  -[CRLMediaPlayerTimeController didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("remainingTime"));
}

- (void)setUpdateInterval:(double)a3
{
  if (self->mUpdateInterval != a3)
  {
    if (a3 < 0.0166666667)
      a3 = 0.0166666667;
    self->mUpdateInterval = a3;
    if (self->mTimeObserver)
    {
      -[CRLMediaPlayerTimeController p_teardownTimeObserver](self, "p_teardownTimeObserver");
      -[CRLMediaPlayerTimeController p_createTimeObserver](self, "p_createTimeObserver");
      -[CRLMediaPlayerTimeController p_setTimeValuesWithoutScrubbing](self, "p_setTimeValuesWithoutScrubbing");
    }
  }
}

- (void)setAbsoluteCurrentTime:(double)a3
{
  self->mAbsoluteCurrentTime = a3;
  -[CRLMediaPlayerTimeController p_beginScrubbingIfNeeded](self, "p_beginScrubbingIfNeeded");
  -[CRLMediaPlayerController scrubToTime:withTolerance:](self->mPlayerController, "scrubToTime:withTolerance:", self->mAbsoluteCurrentTime, self->mUpdateInterval);
}

- (void)setCurrentTime:(double)a3
{
  double mUpdateInterval;
  double v6;

  self->mCurrentTime = a3;
  -[CRLMediaPlayerTimeController p_beginScrubbingIfNeeded](self, "p_beginScrubbingIfNeeded");
  mUpdateInterval = self->mUpdateInterval;
  -[CRLMediaPlayerController startTime](self->mPlayerController, "startTime");
  -[CRLMediaPlayerController scrubToTime:withTolerance:](self->mPlayerController, "scrubToTime:withTolerance:", v6 + a3, mUpdateInterval);
}

- (void)p_beginScrubbingIfNeeded
{
  void *v3;
  void *v4;
  NSRunLoopMode v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMediaPlayerTimeController playerController](self, "playerController"));
  if ((objc_msgSend(v3, "isScrubbing") & 1) == 0)
  {
    objc_msgSend(v3, "beginScrubbing");
    v5 = NSDefaultRunLoopMode;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v5, 1));
    -[CRLMediaPlayerTimeController performSelector:withObject:afterDelay:inModes:](self, "performSelector:withObject:afterDelay:inModes:", "p_endScrubbing", 0, v4, 0.0);

  }
}

- (void)p_endScrubbing
{
  -[CRLMediaPlayerController endScrubbing](self->mPlayerController, "endScrubbing");
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v6;
  uint64_t v7;
  id v9;
  id v10;
  objc_super v11;

  if (off_1013D9600 == a6)
  {
    v9 = sub_100221E08(a4, 1, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, v6, v7, (uint64_t)&OBJC_PROTOCOL___CRLMediaPlayerController);
    v10 = (id)objc_claimAutoreleasedReturnValue(v9);
    if (objc_msgSend(v10, "hasCurrentTime"))
      -[CRLMediaPlayerTimeController p_setTimeValuesWithoutScrubbing](self, "p_setTimeValuesWithoutScrubbing");

  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)CRLMediaPlayerTimeController;
    -[CRLMediaPlayerTimeController observeValueForKeyPath:ofObject:change:context:](&v11, "observeValueForKeyPath:ofObject:change:context:", a3, a4, a5);
  }
}

- (double)absoluteCurrentTime
{
  return self->mAbsoluteCurrentTime;
}

- (double)currentTime
{
  return self->mCurrentTime;
}

- (double)remainingTime
{
  return self->mRemainingTime;
}

- (double)updateInterval
{
  return self->mUpdateInterval;
}

- (CRLMediaPlayerController)playerController
{
  return self->mPlayerController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mPlayerController, 0);
  objc_storeStrong(&self->mTimeObserver, 0);
}

@end
