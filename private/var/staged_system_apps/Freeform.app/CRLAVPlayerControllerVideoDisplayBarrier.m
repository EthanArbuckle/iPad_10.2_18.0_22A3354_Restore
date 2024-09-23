@implementation CRLAVPlayerControllerVideoDisplayBarrier

- (CRLAVPlayerControllerVideoDisplayBarrier)initWithPlayer:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  CRLAVPlayerControllerVideoDisplayBarrier *v9;
  CRLAVPlayerControllerVideoDisplayBarrier *v10;
  objc_super v12;

  v5 = a3;
  if (!v5)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124FD68);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E1DA30();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124FD88);
    v6 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLAVPlayerControllerVideoDisplayBarrier initWithPlayer:]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLAVPlayerController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 1656, 0, "invalid nil value for '%{public}s'", "player");

  }
  v12.receiver = self;
  v12.super_class = (Class)CRLAVPlayerControllerVideoDisplayBarrier;
  v9 = -[CRLAVPlayerControllerVideoDisplayBarrier init](&v12, "init");
  v10 = v9;
  if (v9)
    objc_storeStrong((id *)&v9->_player, a3);

  return v10;
}

- (void)dealloc
{
  OpaqueCMTimebase *timebase;
  objc_super v4;

  timebase = self->_timebase;
  if (timebase)
    CFRelease(timebase);
  v4.receiver = self;
  v4.super_class = (Class)CRLAVPlayerControllerVideoDisplayBarrier;
  -[CRLAVPlayerControllerVideoDisplayBarrier dealloc](&v4, "dealloc");
}

- (void)waitUntilAllVideoFramesAreDisplayed
{
  float v3;
  void *v4;
  void *v5;
  void *v6;
  float v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  unsigned __int8 v15;
  int v16;
  id v17;
  dispatch_semaphore_t v18;
  void *v19;
  dispatch_queue_global_t global_queue;
  NSObject *v21;
  NSObject *v22;
  id v23;
  _QWORD block[4];
  id v25;
  CRLAVPlayerControllerVideoDisplayBarrier *v26;
  NSObject *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];

  -[AVPlayer rate](self->_player, "rate");
  if (v3 != 0.0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124FDA8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E1DABC();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124FDC8);
    v4 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLAVPlayerControllerVideoDisplayBarrier waitUntilAllVideoFramesAreDisplayed]"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLAVPlayerController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 1680, 0, "The player must be stopped in order to wait for all video frames to be output.");

  }
  -[AVPlayer rate](self->_player, "rate");
  if (v7 == 0.0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[AVPlayer currentItem](self->_player, "currentItem"));
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "tracks"));
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v29;
      while (2)
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v29 != v12)
            objc_enumerationMutation(v9);
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i), "assetTrack"));
          v15 = objc_msgSend(v14, "hasMediaCharacteristic:", AVMediaCharacteristicVisual);

          if ((v15 & 1) != 0)
          {
            v16 = 1;
            goto LABEL_22;
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        if (v11)
          continue;
        break;
      }
    }
    v16 = 0;
LABEL_22:

    v17 = objc_msgSend(v8, "timebase");
    if (v16)
    {
      if (v17)
      {
        -[CRLAVPlayerControllerVideoDisplayBarrier setTimebase:](self, "setTimebase:", v17);
        v18 = dispatch_semaphore_create(0);
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[CADisplayLink displayLinkWithTarget:selector:](CADisplayLink, "displayLinkWithTarget:selector:", self, "p_outputForDisplayLink:"));
        global_queue = dispatch_get_global_queue(0, 0);
        v21 = objc_claimAutoreleasedReturnValue(global_queue);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1002FA354;
        block[3] = &unk_10122D3B0;
        v25 = v19;
        v26 = self;
        v22 = v18;
        v27 = v22;
        v23 = v19;
        dispatch_async(v21, block);

        dispatch_semaphore_wait(v22, 0xFFFFFFFFFFFFFFFFLL);
        -[CRLAVPlayerControllerVideoDisplayBarrier setTimebase:](self, "setTimebase:", 0);

      }
    }

  }
}

- (BOOL)p_allVideoFramesDisplayedAtHostTime:(id *)a3
{
  OpaqueCMTimebase *v5;
  OpaqueCMTimebase *v6;
  CMClockRef HostTimeClock;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  CMTime v13;
  CMTime time2;
  CMTime time;
  CMTime v16;

  v16 = kCMTimeInvalid;
  v5 = -[CRLAVPlayerControllerVideoDisplayBarrier timebase](self, "timebase");
  if (v5)
  {
    v6 = v5;
    HostTimeClock = CMClockGetHostTimeClock();
    time = (CMTime)*a3;
    CMSyncConvertTime(&v16, &time, HostTimeClock, v6);
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124FE68);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E1DBBC();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124FE88);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLAVPlayerControllerVideoDisplayBarrier p_allVideoFramesDisplayedAtHostTime:]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLAVPlayerController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 1785, 0, "Unable to determine item time because the item's timebase is NULL.");

  }
  -[CRLAVPlayerControllerVideoDisplayBarrier lastItemTime](self, "lastItemTime");
  time = v16;
  v11 = CMTimeCompare(&time, &time2) == 0;
  v13 = v16;
  -[CRLAVPlayerControllerVideoDisplayBarrier setLastItemTime:](self, "setLastItemTime:", &v13);
  return v11;
}

- (void)p_outputForDisplayLink:(id)a3
{
  id v4;
  Float64 v5;
  CMTime v6;
  CMTime v7;

  v4 = a3;
  memset(&v7, 0, sizeof(v7));
  objc_msgSend(v4, "timestamp");
  CMTimeMakeWithSeconds(&v7, v5, 1000000000);
  v6 = v7;
  if (-[CRLAVPlayerControllerVideoDisplayBarrier p_allVideoFramesDisplayedAtHostTime:](self, "p_allVideoFramesDisplayedAtHostTime:", &v6))
  {
    -[CRLAVPlayerControllerVideoDisplayBarrier setAllVideoFramesDisplayed:](self, "setAllVideoFramesDisplayed:", 1);
    objc_msgSend(v4, "invalidate");
  }

}

- (OpaqueCMTimebase)timebase
{
  return self->_timebase;
}

- (void)setTimebase:(OpaqueCMTimebase *)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (BOOL)allVideoFramesDisplayed
{
  return self->_allVideoFramesDisplayed;
}

- (void)setAllVideoFramesDisplayed:(BOOL)a3
{
  self->_allVideoFramesDisplayed = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lastItemTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 32);
  return self;
}

- (void)setLastItemTime:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_lastItemTime.epoch = a3->var3;
  *(_OWORD *)&self->_lastItemTime.value = v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_player, 0);
}

@end
