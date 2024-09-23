@implementation CRLAnimatedGIFController

- (id)newRenderable
{
  id v2;
  void *v3;

  v2 = -[CRLAnimatedGIFController newLayer](self, "newLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCanvasRenderable renderableFromLayer:](CRLCanvasRenderable, "renderableFromLayer:", v2));

  return v3;
}

+ (BOOL)canInitWithDataType:(id)a3
{
  id v3;
  void *v4;
  unsigned __int8 v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CRLIngestionTypes supportedMovieAnimatedImageTypes](CRLIngestionTypes, "supportedMovieAnimatedImageTypes"));
  v5 = objc_msgSend(v3, "crl_conformsToAnyUTI:", v4);

  return v5;
}

- (CRLAnimatedGIFController)initWithImageSource:(CGImageSource *)a3 delegate:(id)a4
{
  id v6;
  CRLAnimatedGIFController *v7;
  uint64_t v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  CFStringRef Type;
  void *v14;
  uint64_t v15;
  double v16;
  id v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  double v24;
  uint64_t v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  double v32;
  uint64_t v33;
  id v34;
  void *v35;
  OpaqueCMClock *HostTimeClock;
  uint64_t v37;
  int v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  void *v43;
  void *v44;
  void *v45;
  dispatch_source_t v46;
  void *v47;
  NSObject *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  Float64 v55;
  id v56;
  void *v57;
  CMTime v59;
  _QWORD handler[4];
  id v61;
  id location;
  objc_super v63;
  _BYTE v64[24];

  v6 = a4;
  v63.receiver = self;
  v63.super_class = (Class)CRLAnimatedGIFController;
  v7 = -[CRLAnimatedGIFController init](&v63, "init");
  v8 = (uint64_t)v7;
  if (v7)
  {
    if (a3)
    {
      v7->_imageSource = a3;
      CFRetain(a3);
    }
    else
    {
      v9 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101262628);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E3B8EC();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101262648);
      v10 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E3B844(v10, v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLAnimatedGIFController initWithImageSource:delegate:]"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLAnimatedGIFController.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 139, 0, "invalid nil value for '%{public}s'", "imageSource");

    }
    Type = CGImageSourceGetType(*(CGImageSourceRef *)(v8 + 16));
    v14 = (void *)objc_claimAutoreleasedReturnValue(Type);
    *(_QWORD *)&v16 = objc_opt_class(v8, v15).n128_u64[0];
    if ((objc_msgSend(v17, "canInitWithDataType:", v14, v16) & 1) == 0)
    {
      v18 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101262668);
      v19 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E3B784(v19, v8);
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101262688);
      v20 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E3B6DC(v20, v18);
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLAnimatedGIFController initWithImageSource:delegate:]"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLAnimatedGIFController.m"));
      *(_QWORD *)&v24 = objc_opt_class(v8, v23).n128_u64[0];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v21, v22, 147, 0, "%@ can only play GIFs, PNGs or HEIC/Fs.", v24, v25);

    }
    if (CGImageSourceGetCount(*(CGImageSourceRef *)(v8 + 16)) <= 1)
    {
      v26 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012626A8);
      v27 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E3B628(v27, v8);
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012626C8);
      v28 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E3B580(v28, v26);
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLAnimatedGIFController initWithImageSource:delegate:]"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLAnimatedGIFController.m"));
      *(_QWORD *)&v32 = objc_opt_class(v8, v31).n128_u64[0];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v29, v30, 148, 0, "%@ can only play GIFs, HEIFs or PNGs with multiple frames.", v32, v33);

    }
    objc_storeWeak((id *)(v8 + 8), v6);
    v34 = objc_alloc_init((Class)NSMutableSet);
    v35 = *(void **)(v8 + 32);
    *(_QWORD *)(v8 + 32) = v34;

    objc_msgSend((id)v8, "p_prepareFrames");
    *(_DWORD *)(v8 + 56) = 0;
    __dmb(0xBu);
    HostTimeClock = CMClockGetHostTimeClock();
    v37 = CMTimebaseCreateWithSourceClock(kCFAllocatorDefault, HostTimeClock, (CMTimebaseRef *)(v8 + 64));
    if ((_DWORD)v37)
    {
      v38 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012626E8);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E3B4FC();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101262708);
      v39 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E3B454(v39, v38);
      v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLAnimatedGIFController initWithImageSource:delegate:]"));
      v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLAnimatedGIFController.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v40, v41, 160, 0, "CMTimebaseCreateWithMasterClock failed (%d)", v37);

    }
    if (!*(_QWORD *)(v8 + 64))
    {
      v42 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101262728);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E3B3C4();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101262748);
      v43 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E3B31C(v43, v42);
      v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLAnimatedGIFController initWithImageSource:delegate:]"));
      v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLAnimatedGIFController.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v44, v45, 161, 0, "invalid nil value for '%{public}s'", "_timebase");

    }
    v46 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)&_dispatch_main_q);
    v47 = *(void **)(v8 + 72);
    *(_QWORD *)(v8 + 72) = v46;

    objc_initWeak(&location, (id)v8);
    v48 = *(NSObject **)(v8 + 72);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1004A7354;
    handler[3] = &unk_10122D4C0;
    objc_copyWeak(&v61, &location);
    dispatch_source_set_event_handler(v48, handler);
    dispatch_resume(*(dispatch_object_t *)(v8 + 72));
    v49 = CMTimebaseAddTimerDispatchSource(*(CMTimebaseRef *)(v8 + 64), *(dispatch_source_t *)(v8 + 72));
    if ((_DWORD)v49)
    {
      v50 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101262768);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E3B298();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101262788);
      v51 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)v51, OS_LOG_TYPE_ERROR))
      {
        v52 = (void *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
        sub_100DEE33C(v52, (uint64_t)v64, v50, v51);
      }

      v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLAnimatedGIFController initWithImageSource:delegate:]"));
      v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLAnimatedGIFController.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v53, v54, 172, 0, "CMTimebaseAddTimerDispatchSource failed (%d)", v49);

    }
    *(_OWORD *)(v8 + 80) = *(_OWORD *)&kCMTimeZero.value;
    *(_QWORD *)(v8 + 96) = kCMTimeZero.epoch;
    objc_msgSend((id)v8, "absoluteDuration");
    CMTimeMakeWithSeconds(&v59, v55, 1000000000);
    *(CMTime *)(v8 + 104) = v59;
    *(_QWORD *)(v8 + 128) = *(_QWORD *)(v8 + 184);
    v56 = objc_alloc_init((Class)NSMutableSet);
    v57 = *(void **)(v8 + 136);
    *(_QWORD *)(v8 + 136) = v56;

    objc_destroyWeak(&v61);
    objc_destroyWeak(&location);

  }
  return (CRLAnimatedGIFController *)v8;
}

- (CRLAnimatedGIFController)initWithData:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  CRLAnimatedGIFController *v8;

  v6 = a4;
  v7 = objc_msgSend(a3, "newCGImageSource");
  v8 = -[CRLAnimatedGIFController initWithImageSource:delegate:](self, "initWithImageSource:delegate:", v7, v6);

  if (v7)
    CFRelease(v7);
  return v8;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CGImageSource *imageSource;
  objc_super v10;

  if (self->_playing)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012627A8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E3B9FC();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012627C8);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLAnimatedGIFController dealloc]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLAnimatedGIFController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 194, 0, "Reached -dealloc without teardown being hit.");

  }
  if (-[NSMutableSet count](self->_layers, "count"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012627E8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E3B97C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101262808);
    v6 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLAnimatedGIFController dealloc]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLAnimatedGIFController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 195, 0, "Reached -dealloc with associated animated GIF layers.");

  }
  imageSource = self->_imageSource;
  if (imageSource)
    CFRelease(imageSource);
  v10.receiver = self;
  v10.super_class = (Class)CRLAnimatedGIFController;
  -[CRLAnimatedGIFController dealloc](&v10, "dealloc");
}

- (void)teardown
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSMutableSet *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  -[CRLDisplayLink invalidate](self->_displayLink, "invalidate");
  os_unfair_lock_lock(&self->_timebaseLock);
  v3 = CMTimebaseRemoveTimerDispatchSource(self->_timebase, (dispatch_source_t)self->_timebaseTimerSource);
  if ((_DWORD)v3)
  {
    v4 = v3;
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101262828);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E3BA7C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101262848);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLAnimatedGIFController teardown]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLAnimatedGIFController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 208, 0, "CMTimebaseRemoveTimerDispatchSource failed (%d)", v4);

  }
  dispatch_source_cancel((dispatch_source_t)self->_timebaseTimerSource);
  os_unfair_lock_unlock(&self->_timebaseLock);
  self->_playing = 0;
  -[CRLAnimatedGIFController p_updateDisplayLink](self, "p_updateDisplayLink");
  v8 = -[NSMutableSet copy](self->_layers, "copy");
  objc_msgSend(v8, "makeObjectsPerformSelector:withObject:", "setController:", 0);

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v9 = self->_observationTokens;
  v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        -[CRLAnimatedGIFController crl_removeObserverForToken:](self, "crl_removeObserverForToken:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i));
      }
      v11 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }

}

- (BOOL)canPlay
{
  return 1;
}

- (void)setPlaying:(BOOL)a3
{
  double v3;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  if (self->_playing != a3)
  {
    self->_playing = a3;
    if (a3)
    {
      -[CRLAnimatedGIFController absoluteCurrentTime](self, "absoluteCurrentTime");
      v6 = v5;
      -[CRLAnimatedGIFController startTime](self, "startTime");
      v8 = v7;
      -[CRLAnimatedGIFController endTime](self, "endTime");
      if (v6 < v8 || (v3 = v9 + -0.01, v6 > v3))
        -[CRLAnimatedGIFController p_setAbsoluteCurrentTime:](self, "p_setAbsoluteCurrentTime:", v8);
    }
    LODWORD(v3) = 1.0;
    if (!self->_playing)
      *(float *)&v3 = 0.0;
    -[CRLAnimatedGIFController setRate:](self, "setRate:", v3);
    -[CRLAnimatedGIFController p_updateDisplayLink](self, "p_updateDisplayLink");
  }
}

- (float)rate
{
  os_unfair_lock_s *p_timebaseLock;
  float Rate;

  p_timebaseLock = &self->_timebaseLock;
  os_unfair_lock_lock(&self->_timebaseLock);
  Rate = CMTimebaseGetRate(self->_timebase);
  os_unfair_lock_unlock(p_timebaseLock);
  return Rate;
}

- (void)setRate:(float)a3
{
  os_unfair_lock_s *p_timebaseLock;
  double v6;

  p_timebaseLock = &self->_timebaseLock;
  os_unfair_lock_lock(&self->_timebaseLock);
  *(float *)&v6 = a3;
  -[CRLAnimatedGIFController p_setRate:](self, "p_setRate:", v6);
  os_unfair_lock_unlock(p_timebaseLock);
}

- (void)p_setRate:(float)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = CMTimebaseSetRate(self->_timebase, a3);
  if ((_DWORD)v4)
  {
    v5 = v4;
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101262868);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E3BB00();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101262888);
    v6 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLAnimatedGIFController p_setRate:]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLAnimatedGIFController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 270, 0, "CMTimebaseSetRate failed (%d)", v5);

  }
  -[CRLAnimatedGIFController p_updateTimebaseTimerSourceNextFireTime](self, "p_updateTimebaseTimerSourceNextFireTime");
}

- (void)stopSynchronously
{
  -[CRLAnimatedGIFController setPlaying:](self, "setPlaying:", 0);
}

- (BOOL)hasCurrentTime
{
  return 1;
}

- (double)currentTime
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;

  -[CRLAnimatedGIFController absoluteCurrentTime](self, "absoluteCurrentTime");
  v4 = v3;
  -[CRLAnimatedGIFController startTime](self, "startTime");
  v6 = v4 - v5;
  -[CRLAnimatedGIFController endTime](self, "endTime");
  return sub_1003C65EC(v6, 0.0, v7);
}

- (void)p_setAbsoluteCurrentTime:(double)a3
{
  os_unfair_lock_s *p_timebaseLock;
  OpaqueCMTimebase *timebase;
  CMTime time;

  p_timebaseLock = &self->_timebaseLock;
  os_unfair_lock_lock(&self->_timebaseLock);
  timebase = self->_timebase;
  CMTimeMakeWithSeconds(&time, a3, 1000000000);
  CMTimebaseSetTime(timebase, &time);
  os_unfair_lock_unlock(p_timebaseLock);
}

- (double)absoluteCurrentTime
{
  OpaqueCMClock *HostTimeClock;
  Float64 Rate;
  double Seconds;
  CMTime v7;
  CMTime time;
  CMTime v9;

  memset(&v9, 0, sizeof(v9));
  HostTimeClock = CMClockGetHostTimeClock();
  CMClockGetTime(&v9, HostTimeClock);
  os_unfair_lock_lock(&self->_timebaseLock);
  Rate = CMTimebaseGetRate(self->_timebase);
  v7 = v9;
  -[CRLAnimatedGIFController p_timebaseTimeForHostTime:rate:updatedRate:anchorTime:](self, "p_timebaseTimeForHostTime:rate:updatedRate:anchorTime:", &v7, 0, 0, Rate);
  Seconds = CMTimeGetSeconds(&time);
  os_unfair_lock_unlock(&self->_timebaseLock);
  return Seconds;
}

- (double)remainingTime
{
  double v3;
  double v4;
  double v5;

  -[CRLAnimatedGIFController absoluteDuration](self, "absoluteDuration");
  v4 = v3;
  -[CRLAnimatedGIFController currentTime](self, "currentTime");
  return v4 - v5;
}

- (double)absoluteDuration
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray lastObject](self->_frames, "lastObject"));
  objc_msgSend(v2, "time");
  v4 = v3;

  return v4;
}

- (double)duration
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  -[CRLAnimatedGIFController endTime](self, "endTime");
  v4 = v3;
  -[CRLAnimatedGIFController startTime](self, "startTime");
  v6 = v4 - v5;
  -[CRLAnimatedGIFController absoluteDuration](self, "absoluteDuration");
  v8 = v7;
  -[CRLAnimatedGIFController startTime](self, "startTime");
  return sub_1003C65EC(v6, 0.0, v8 - v9);
}

- (void)setStartTime:(double)a3
{
  os_unfair_lock_s *p_timebaseLock;
  CMTime v5;

  if (self->_startTime != a3)
  {
    self->_startTime = a3;
    p_timebaseLock = &self->_timebaseLock;
    os_unfair_lock_lock(&self->_timebaseLock);
    CMTimeMakeWithSeconds(&v5, self->_startTime, 1000000000);
    self->_timebaseStartTime = ($95D729B680665BEAEFA1D6FCA8238556)v5;
    -[CRLAnimatedGIFController p_updateTimebaseTimerSourceNextFireTime](self, "p_updateTimebaseTimerSourceNextFireTime");
    os_unfair_lock_unlock(p_timebaseLock);
  }
}

- (double)endTime
{
  double result;

  result = self->_endTime;
  if (result == 0.0)
    -[CRLAnimatedGIFController absoluteDuration](self, "absoluteDuration");
  return result;
}

- (void)setEndTime:(double)a3
{
  os_unfair_lock_s *p_timebaseLock;
  CMTime v5;

  if (self->_endTime != a3)
  {
    self->_endTime = a3;
    p_timebaseLock = &self->_timebaseLock;
    os_unfair_lock_lock(&self->_timebaseLock);
    CMTimeMakeWithSeconds(&v5, self->_endTime, 1000000000);
    self->_timebaseEndTime = ($95D729B680665BEAEFA1D6FCA8238556)v5;
    -[CRLAnimatedGIFController p_updateTimebaseTimerSourceNextFireTime](self, "p_updateTimebaseTimerSourceNextFireTime");
    os_unfair_lock_unlock(p_timebaseLock);
  }
}

- (void)setRepeatMode:(int64_t)a3
{
  double v4;

  if (self->_repeatMode != a3)
  {
    self->_repeatMode = a3;
    if (a3 != 2)
    {
      -[CRLAnimatedGIFController rate](self, "rate");
      if (*(float *)&v4 < 0.0)
      {
        LODWORD(v4) = 1.0;
        -[CRLAnimatedGIFController setRate:](self, "setRate:", v4);
      }
    }
    os_unfair_lock_lock(&self->_timebaseLock);
    self->_timebaseRepeatMode = self->_repeatMode;
    -[CRLAnimatedGIFController p_updateTimebaseTimerSourceNextFireTime](self, "p_updateTimebaseTimerSourceNextFireTime");
    os_unfair_lock_unlock(&self->_timebaseLock);
  }
}

- (void)beginScrubbing
{
  unint64_t scrubbingCount;
  float v4;
  double v5;
  Float64 v6;
  CMTime v7;

  scrubbingCount = self->_scrubbingCount;
  self->_scrubbingCount = scrubbingCount + 1;
  if (!scrubbingCount)
  {
    -[CRLAnimatedGIFController rate](self, "rate");
    self->_rateBeforeScrubbing = v4;
    -[CRLAnimatedGIFController willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("rate"));
    os_unfair_lock_lock(&self->_timebaseLock);
    LODWORD(v5) = 0;
    -[CRLAnimatedGIFController p_setRate:](self, "p_setRate:", v5);
    self->_timebaseStartTime = ($95D729B680665BEAEFA1D6FCA8238556)kCMTimeZero;
    -[CRLAnimatedGIFController absoluteDuration](self, "absoluteDuration");
    CMTimeMakeWithSeconds(&v7, v6, 1000000000);
    self->_timebaseEndTime = ($95D729B680665BEAEFA1D6FCA8238556)v7;
    self->_timebaseRepeatMode = 0;
    os_unfair_lock_unlock(&self->_timebaseLock);
    -[CRLAnimatedGIFController didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("rate"));
  }
}

- (BOOL)isScrubbing
{
  return self->_scrubbingCount != 0;
}

- (void)scrubToTime:(double)a3 withTolerance:(double)a4
{
  -[CRLAnimatedGIFController scrubToTime:withTolerance:completionHandler:](self, "scrubToTime:withTolerance:completionHandler:", 0, a3, a4);
}

- (void)scrubToTime:(double)a3 withTolerance:(double)a4 completionHandler:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  __CFRunLoop *Main;
  id v12;
  _QWORD block[5];
  id v14;
  double v15;

  v7 = a5;
  if (!-[CRLAnimatedGIFController isScrubbing](self, "isScrubbing"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012628A8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E3BB84();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012628C8);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLAnimatedGIFController scrubToTime:withTolerance:completionHandler:]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLAnimatedGIFController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 408, 0, "Scrubbing to time when not known to be scrubbing!");

  }
  Main = CFRunLoopGetMain();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1004A8424;
  block[3] = &unk_1012313C0;
  v15 = a3;
  block[4] = self;
  v14 = v7;
  v12 = v7;
  CFRunLoopPerformBlock(Main, kCFRunLoopCommonModes, block);

}

- (void)endScrubbing
{
  unint64_t scrubbingCount;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  double v8;
  int64_t repeatMode;
  CMTime v10;

  scrubbingCount = self->_scrubbingCount;
  if (scrubbingCount)
    goto LABEL_11;
  +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_1012628E8);
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100E3BC04();
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101262908);
  v4 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100DE7468(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLAnimatedGIFController endScrubbing]"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLAnimatedGIFController.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 426, 0, "Uneven begin/end scrubbing calls!");

  scrubbingCount = self->_scrubbingCount;
  if (scrubbingCount)
  {
LABEL_11:
    v7 = scrubbingCount - 1;
    self->_scrubbingCount = v7;
    if (!v7)
    {
      -[CRLAnimatedGIFController willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("rate"));
      os_unfair_lock_lock(&self->_timebaseLock);
      CMTimeMakeWithSeconds(&v10, self->_startTime, 1000000000);
      self->_timebaseStartTime = ($95D729B680665BEAEFA1D6FCA8238556)v10;
      CMTimeMakeWithSeconds(&v10, self->_endTime, 1000000000);
      HIDWORD(v8) = HIDWORD(v10.value);
      *(_OWORD *)&self->_timebaseEndTime.value = *(_OWORD *)&v10.value;
      repeatMode = self->_repeatMode;
      self->_timebaseEndTime.epoch = v10.epoch;
      self->_timebaseRepeatMode = repeatMode;
      *(float *)&v8 = self->_rateBeforeScrubbing;
      -[CRLAnimatedGIFController p_setRate:](self, "p_setRate:", v8);
      os_unfair_lock_unlock(&self->_timebaseLock);
      -[CRLAnimatedGIFController didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("rate"));
    }
  }
}

- (BOOL)canFastReverse
{
  return 0;
}

- (BOOL)canFastForward
{
  return 0;
}

- (void)seekToBeginning
{
  -[CRLAnimatedGIFController startTime](self, "startTime");
  -[CRLAnimatedGIFController p_setAbsoluteCurrentTime:](self, "p_setAbsoluteCurrentTime:");
}

- (void)seekToEnd
{
  -[CRLAnimatedGIFController endTime](self, "endTime");
  -[CRLAnimatedGIFController p_setAbsoluteCurrentTime:](self, "p_setAbsoluteCurrentTime:");
}

- (double)timeForHostTime:(double)a3
{
  os_unfair_lock_s *p_timebaseLock;
  double Rate;
  double Seconds;
  CMTime v9;
  CMTime time;

  p_timebaseLock = &self->_timebaseLock;
  os_unfair_lock_lock(&self->_timebaseLock);
  Rate = CMTimebaseGetRate(self->_timebase);
  CMTimeMakeWithSeconds(&v9, a3, 1000000000);
  -[CRLAnimatedGIFController p_timebaseTimeForHostTime:rate:updatedRate:anchorTime:](self, "p_timebaseTimeForHostTime:rate:updatedRate:anchorTime:", &v9, 0, 0, Rate);
  Seconds = CMTimeGetSeconds(&time);
  os_unfair_lock_unlock(p_timebaseLock);
  return Seconds;
}

- (BOOL)hasNewImageForTime:(double)a3 sinceTime:(double)a4
{
  void *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  uint64_t v12;

  v12 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAnimatedGIFController p_frameAtTime:fromIndex:frameIndex:](self, "p_frameAtTime:fromIndex:frameIndex:", 0, &v12, a4));
  if (a3 < a4)
    v8 = 0;
  else
    v8 = v12;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAnimatedGIFController p_frameAtTime:fromIndex:frameIndex:](self, "p_frameAtTime:fromIndex:frameIndex:", v8, 0, a3));
  v10 = v9 != v7;

  return v10;
}

- (CGImage)imageForTime:(double)a3
{
  void *v3;
  CGImage *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAnimatedGIFController p_frameAtTime:fromIndex:frameIndex:](self, "p_frameAtTime:fromIndex:frameIndex:", 0, 0, a3));
  v4 = (CGImage *)objc_msgSend(v3, "image");

  return v4;
}

- (CGImage)imageForCurrentTime
{
  -[CRLAnimatedGIFController absoluteCurrentTime](self, "absoluteCurrentTime");
  return -[CRLAnimatedGIFController imageForTime:](self, "imageForTime:");
}

- (id)p_frameAtTime:(double)a3 fromIndex:(unint64_t)a4 frameIndex:(unint64_t *)a5
{
  double v9;
  double v10;
  void *v11;
  int64_t v12;
  int64_t v13;
  double v14;
  void *v15;
  double v16;
  int64_t v17;
  void *v18;
  double v19;

  -[CRLAnimatedGIFController absoluteDuration](self, "absoluteDuration");
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_frames, "objectAtIndexedSubscript:", a4));
  v12 = -[NSArray count](self->_frames, "count");
  if ((uint64_t)(a4 + 1) < v12)
  {
    v13 = v12;
    v14 = fmin(a3, v10 + -2.22044605e-16);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_frames, "objectAtIndexedSubscript:"));
    objc_msgSend(v15, "time");
    if (v16 >= v14)
    {
LABEL_6:
      if (a5)
        *a5 = a4;

    }
    else
    {
      v17 = v13 - 2;
      while (1)
      {
        v18 = v11;
        v11 = v15;

        if (v17 == a4)
          break;
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_frames, "objectAtIndexedSubscript:", a4 + 2));
        objc_msgSend(v15, "time");
        ++a4;
        if (v19 >= v14)
          goto LABEL_6;
      }
    }
  }
  return v11;
}

- (id)addPeriodicTimeObserverForInterval:(double)a3 block:(id)a4
{
  id v5;
  NSObject *v6;
  double v7;
  dispatch_time_t v8;

  v5 = a4;
  v6 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)&_dispatch_main_q);
  v7 = a3 * 1000000000.0;
  v8 = dispatch_time(0, (unint64_t)v7);
  dispatch_source_set_timer(v6, v8, (unint64_t)v7, (unint64_t)((double)(unint64_t)v7 * 0.25));
  dispatch_source_set_event_handler(v6, v5);

  dispatch_resume(v6);
  return v6;
}

- (void)removePeriodicTimeObserver:(id)a3
{
  dispatch_source_cancel((dispatch_source_t)a3);
}

- (void)addObservationToken:(id)a3
{
  -[NSMutableSet addObject:](self->_observationTokens, "addObject:", a3);
}

- (void)removeObservationToken:(id)a3
{
  -[NSMutableSet removeObject:](self->_observationTokens, "removeObject:", a3);
}

- (void)addLayer:(id)a3
{
  -[NSMutableSet addObject:](self->_layers, "addObject:", a3);
  -[CRLAnimatedGIFController p_updateDisplayLink](self, "p_updateDisplayLink");
}

- (void)removeLayer:(id)a3
{
  -[NSMutableSet removeObject:](self->_layers, "removeObject:", a3);
  -[CRLAnimatedGIFController p_updateDisplayLink](self, "p_updateDisplayLink");
}

- (id)newLayer
{
  CRLAnimatedGIFLayer *v3;

  v3 = objc_alloc_init(CRLAnimatedGIFLayer);
  -[CRLAnimatedGIFLayer setController:](v3, "setController:", self);
  return v3;
}

- (void)p_prepareFrames
{
  NSArray *v3;
  size_t Count;
  __int128 v5;
  size_t v6;
  size_t v7;
  char v8;
  double v9;
  __objc2_class_ro **p_info;
  const __CFDictionary *v11;
  const __CFDictionary *v12;
  const __CFNumber *Value;
  const __CFNumber *v14;
  uint64_t v15;
  unsigned int v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  CRLAnimatedGIFFrame *v23;
  NSObject *v24;
  char *v25;
  CRLAnimatedGIFFrame *v26;
  NSArray *frames;
  __int128 v28;
  NSArray *v29;
  uint64_t v30;
  uint64_t valuePtr;
  uint8_t buf[4];
  unsigned int v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  int v39;

  v3 = (NSArray *)objc_alloc_init((Class)NSMutableArray);
  Count = CGImageSourceGetCount(self->_imageSource);
  if (Count)
  {
    v6 = Count;
    v7 = 0;
    v8 = 1;
    v9 = 0.0;
    *(_QWORD *)&v5 = 67109378;
    v28 = v5;
    p_info = (__objc2_class_ro **)(&OBJC_METACLASS___CRLTabsAccessibility + 32);
    v29 = v3;
    do
    {
      v11 = CGImageSourceCopyPropertiesAtIndex(self->_imageSource, v7, 0);
      v12 = v11;
      if (!v7)
      {
        Value = (const __CFNumber *)CFDictionaryGetValue(v11, kCGImagePropertyPixelWidth);
        v14 = (const __CFNumber *)CFDictionaryGetValue(v12, kCGImagePropertyPixelHeight);
        v30 = 0;
        valuePtr = 0;
        CFNumberGetValue(Value, kCFNumberNSIntegerType, &valuePtr);
        CFNumberGetValue(v14, kCFNumberNSIntegerType, &v30);
        v15 = valuePtr * v6 * v30;
        if (v15 <= 0)
        {
          v16 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_101262928);
          v17 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109890;
            v33 = v16;
            v34 = 2082;
            v35 = "-[CRLAnimatedGIFController p_prepareFrames]";
            v36 = 2082;
            v37 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLAnimatedGIFController.m";
            v38 = 1024;
            v39 = 594;
            _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d We expect at least one pixel in the GIF.", buf, 0x22u);
          }
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_101262948);
          v18 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          {
            v24 = v18;
            v25 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
            *(_DWORD *)buf = v28;
            v33 = v16;
            v34 = 2114;
            v35 = v25;
            _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

          }
          v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLAnimatedGIFController p_prepareFrames]", v28));
          v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLAnimatedGIFController.m"));
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v19, v20, 594, 0, "We expect at least one pixel in the GIF.");

        }
        v8 &= v15 < 6500001;
        v3 = v29;
        p_info = &OBJC_METACLASS___CRLTabsAccessibility.info;
      }
      objc_msgSend(p_info + 421, "delayTimeForImageProperties:", v12, v28);
      v22 = v21;
      if (v12)
        CFRelease(v12);
      v23 = -[CRLAnimatedGIFFrame initWithImageSource:index:time:preloadImage:]([CRLAnimatedGIFFrame alloc], "initWithImageSource:index:time:preloadImage:", self->_imageSource, v7, v8 & 1, v9);
      -[NSArray addObject:](v3, "addObject:", v23);
      v9 = v9 + v22;

      ++v7;
    }
    while (v6 != v7);
  }
  else
  {
    v8 = 1;
    v9 = 0.0;
  }
  v26 = -[CRLAnimatedGIFFrame initWithImageSource:index:time:preloadImage:]([CRLAnimatedGIFFrame alloc], "initWithImageSource:index:time:preloadImage:", self->_imageSource, -1, v8 & 1, v9);
  -[NSArray addObject:](v3, "addObject:", v26);
  frames = self->_frames;
  self->_frames = v3;

}

+ (double)delayTimeForImageProperties:(__CFDictionary *)a3
{
  const __CFDictionary *Value;
  const __CFDictionary *v5;
  const __CFDictionary *v6;
  const void *v7;
  void *v8;
  const void *v9;
  double v10;
  uint64_t v11;
  const void *v12;
  CFStringRef v13;
  const __CFDictionary *v14;
  const __CFDictionary *v15;
  const void *v16;
  const void *v17;
  double v18;
  double v19;

  if (!a3)
    return 0.1;
  Value = (const __CFDictionary *)CFDictionaryGetValue(a3, kCGImagePropertyGIFDictionary);
  v5 = (const __CFDictionary *)CFDictionaryGetValue(a3, kCGImagePropertyHEICSDictionary);
  v6 = (const __CFDictionary *)CFDictionaryGetValue(a3, kCGImagePropertyPNGDictionary);
  if (Value)
  {
    v7 = CFDictionaryGetValue(Value, kCGImagePropertyGIFUnclampedDelayTime);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    if (!v8)
    {
      v9 = CFDictionaryGetValue(Value, kCGImagePropertyGIFDelayTime);
      v8 = (void *)objc_claimAutoreleasedReturnValue(v9);
      if (!v8)
        return 0.1;
    }
    objc_msgSend(v8, "doubleValue");
    if (v10 < 0.011)
    {
      v11 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 0.1));

      v8 = (void *)v11;
      if (!v11)
        return 0.1;
    }
LABEL_15:
    objc_msgSend(v8, "doubleValue");
    v19 = v18;

    return v19;
  }
  if (v5)
  {
    v12 = CFDictionaryGetValue(v5, kCGImagePropertyHEICSUnclampedDelayTime);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v12);
    if (v8)
      goto LABEL_15;
    v13 = kCGImagePropertyHEICSDelayTime;
    v14 = v5;
  }
  else
  {
    v15 = v6;
    if (!v6)
      return 0.1;
    v16 = CFDictionaryGetValue(v6, kCGImagePropertyAPNGUnclampedDelayTime);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v16);
    if (v8)
      goto LABEL_15;
    v13 = kCGImagePropertyAPNGDelayTime;
    v14 = v15;
  }
  v17 = CFDictionaryGetValue(v14, v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v17);
  if (v8)
    goto LABEL_15;
  return 0.1;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)p_timebaseTimeForHostTime:(SEL)a3 rate:(id *)a4 updatedRate:(double)a5 anchorTime:(double *)a6
{
  void *v13;
  void *v14;
  void *v15;
  CMClockRef HostTimeClock;
  OpaqueCMTimebase *timebase;
  __int128 v18;
  CMTimeEpoch epoch;
  CMTimeFlags flags;
  CMTimeEpoch v21;
  $95D729B680665BEAEFA1D6FCA8238556 *p_timebaseEndTime;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  int64_t timebaseRepeatMode;
  double v25;
  int64_t v26;
  CMTimeEpoch v27;
  CMClockOrTimebaseRef v28;
  const void *v29;
  void *v30;
  void *v31;
  void *v32;
  CMTimeEpoch v33;
  CMTime rhs;
  CMTime time2;
  CMTime time;
  CMTime v37;
  CMTimeValue value;
  CMTimeScale timescale;

  if ((a6 != 0) != (a7 != 0))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101262968);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E3BD14();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101262988);
    v13 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLAnimatedGIFController p_timebaseTimeForHostTime:rate:updatedRate:anchorTime:]"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLAnimatedGIFController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v15, 658, 0, "Should not be requesting an updated rate without also requesting an updated anchor time.");

  }
  HostTimeClock = CMClockGetHostTimeClock();
  memset(&v37, 0, sizeof(v37));
  timebase = self->_timebase;
  time = (CMTime)*a4;
  CMSyncConvertTime(&v37, &time, HostTimeClock, timebase);
  v18 = *(_OWORD *)&v37.value;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&v37.value;
  epoch = v37.epoch;
  retstr->var3 = v37.epoch;
  value = kCMTimeInvalid.value;
  flags = kCMTimeInvalid.flags;
  timescale = kCMTimeInvalid.timescale;
  v21 = kCMTimeInvalid.epoch;
  p_timebaseEndTime = &self->_timebaseEndTime;
  *(_OWORD *)&time.value = v18;
  time.epoch = epoch;
  time2 = (CMTime)self->_timebaseEndTime;
  result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeCompare(&time, &time2);
  if ((int)result >= 1)
  {
    *(_OWORD *)&retstr->var0 = *(_OWORD *)&p_timebaseEndTime->value;
    retstr->var3 = self->_timebaseEndTime.epoch;
    if ((unint64_t)a6 | (unint64_t)a7)
    {
      timebaseRepeatMode = self->_timebaseRepeatMode;
      if (timebaseRepeatMode)
      {
        if (timebaseRepeatMode == 2)
        {
          v25 = a5;
          if (a5 > 0.0)
            v25 = -a5;
        }
        else
        {
          v25 = a5;
          if (timebaseRepeatMode == 1)
          {
            v25 = a5;
            if (a5 > 0.0)
            {
              *(_OWORD *)&retstr->var0 = *(_OWORD *)&self->_timebaseStartTime.value;
              retstr->var3 = self->_timebaseStartTime.epoch;
              v25 = a5;
            }
          }
        }
        if (a5 > 0.0 && v25 != 0.0)
        {
          *(_OWORD *)&time2.value = *(_OWORD *)&p_timebaseEndTime->value;
          time2.epoch = self->_timebaseEndTime.epoch;
          *(_OWORD *)&rhs.value = *(_OWORD *)&v37.value;
          v33 = v37.epoch;
LABEL_52:
          rhs.epoch = v33;
          result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeSubtract(&time, &time2, &rhs);
          value = time.value;
          flags = time.flags;
          timescale = time.timescale;
          v27 = time.epoch;
          goto LABEL_27;
        }
        goto LABEL_26;
      }
LABEL_46:
      v25 = 0.0;
      goto LABEL_26;
    }
LABEL_25:
    v25 = a5;
    goto LABEL_26;
  }
  time = v37;
  time2 = (CMTime)self->_timebaseStartTime;
  result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeCompare(&time, &time2);
  if ((result & 0x80000000) == 0)
    goto LABEL_25;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self->_timebaseStartTime.value;
  retstr->var3 = self->_timebaseStartTime.epoch;
  if (!((unint64_t)a6 | (unint64_t)a7))
    goto LABEL_25;
  v26 = self->_timebaseRepeatMode;
  if (!v26)
    goto LABEL_46;
  if (v26 == 2)
  {
    v25 = a5;
    if (a5 < 0.0)
      v25 = -a5;
  }
  else
  {
    v25 = a5;
    if (v26 == 1)
    {
      v25 = a5;
      if (a5 < 0.0)
      {
        *(_OWORD *)&retstr->var0 = *(_OWORD *)&p_timebaseEndTime->value;
        retstr->var3 = self->_timebaseEndTime.epoch;
        v25 = a5;
      }
    }
  }
  if (a5 < 0.0 && v25 != 0.0)
  {
    time2 = v37;
    *(_OWORD *)&rhs.value = *(_OWORD *)&self->_timebaseStartTime.value;
    v33 = self->_timebaseStartTime.epoch;
    goto LABEL_52;
  }
LABEL_26:
  v27 = v21;
LABEL_27:
  *(_OWORD *)&time.value = *(_OWORD *)&kCMTimeInvalid.value;
  time.epoch = v21;
  if (!a7 || (flags & 1) == 0)
  {
LABEL_31:
    if (!a6)
      goto LABEL_33;
    goto LABEL_32;
  }
  v28 = CMTimebaseCopySource(self->_timebase);
  if (v28)
  {
    v29 = v28;
    time2 = (CMTime)*a4;
    rhs.value = value;
    rhs.timescale = timescale;
    rhs.flags = flags;
    rhs.epoch = v27;
    CMTimeAdd(&time, &time2, &rhs);
    rhs = time;
    CMSyncConvertTime(&time2, &rhs, HostTimeClock, v29);
    time = time2;
    CFRelease(v29);
    goto LABEL_31;
  }
  +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_1012629A8);
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100E3BC84();
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_1012629C8);
  v30 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100DE7468(v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLAnimatedGIFController p_timebaseTimeForHostTime:rate:updatedRate:anchorTime:]"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLAnimatedGIFController.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v31, v32, 727, 0, "invalid nil value for '%{public}s'", "masterClockOrTimebase");

  if (a6)
LABEL_32:
    *a6 = v25;
LABEL_33:
  if (a7)
    *(CMTime *)a7 = time;
  return result;
}

- (void)p_updateTimebaseTimerSourceNextFireTime
{
  void *v3;
  void *v4;
  void *v5;
  double Rate;
  uint64_t v7;
  OpaqueCMTimebase *timebase;
  NSObject *timebaseTimerSource;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  CMTime fireTime;
  CMTime v16;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012629E8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E3BE18();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101262A08);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLAnimatedGIFController p_updateTimebaseTimerSourceNextFireTime]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLAnimatedGIFController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 749, 0, "This operation must only be performed on the main thread.");

  }
  v16 = kCMTimeInvalid;
  Rate = CMTimebaseGetRate(self->_timebase);
  if (Rate <= 0.0)
  {
    if (Rate >= 0.0)
      goto LABEL_16;
    v7 = 80;
  }
  else
  {
    v7 = 104;
  }
  v16 = *(CMTime *)((char *)&self->super.isa + v7);
LABEL_16:
  timebase = self->_timebase;
  timebaseTimerSource = self->_timebaseTimerSource;
  fireTime = v16;
  v10 = CMTimebaseSetTimerDispatchSourceNextFireTime(timebase, timebaseTimerSource, &fireTime, 0);
  if ((_DWORD)v10)
  {
    v11 = v10;
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101262A28);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E3BD94();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101262A48);
    v12 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLAnimatedGIFController p_updateTimebaseTimerSourceNextFireTime]"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLAnimatedGIFController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 762, 0, "CMTimebaseSetTimerDispatchSourceNextFireTime failed (%d)", v11);

  }
}

- (void)p_timebaseTimeDidChangeToStartOrEndTime
{
  void *v3;
  void *v4;
  void *v5;
  OpaqueCMClock *HostTimeClock;
  double Rate;
  CMTimeEpoch epoch;
  void *v9;
  OpaqueCMTimebase *timebase;
  NSObject *timebaseTimerSource;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  OpaqueCMTimebase *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v23;
  CMTime immediateSourceTime;
  CMTime fireTime;
  CMTime v26;
  CMTime v27;
  double v28;
  CMTime v29;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101262A68);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E3BFA0();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101262A88);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLAnimatedGIFController p_timebaseTimeDidChangeToStartOrEndTime]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLAnimatedGIFController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 766, 0, "This operation must only be performed on the main thread.");

  }
  memset(&v29, 0, sizeof(v29));
  HostTimeClock = CMClockGetHostTimeClock();
  CMClockGetTime(&v29, HostTimeClock);
  os_unfair_lock_lock(&self->_timebaseLock);
  Rate = CMTimebaseGetRate(self->_timebase);
  v28 = Rate;
  v23 = *(_OWORD *)&kCMTimeInvalid.value;
  *(_OWORD *)&v27.value = *(_OWORD *)&kCMTimeInvalid.value;
  epoch = kCMTimeInvalid.epoch;
  v27.epoch = epoch;
  memset(&v26, 0, sizeof(v26));
  fireTime = v29;
  -[CRLAnimatedGIFController p_timebaseTimeForHostTime:rate:updatedRate:anchorTime:](self, "p_timebaseTimeForHostTime:rate:updatedRate:anchorTime:", &fireTime, &v28, &v27, Rate);
  os_unfair_lock_unlock(&self->_timebaseLock);
  if (v28 == Rate || v28 != 0.0)
  {
    if ((v27.flags & 1) != 0)
    {
      -[CRLAnimatedGIFController willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("rate"), v28);
      os_unfair_lock_lock(&self->_timebaseLock);
      timebase = self->_timebase;
      timebaseTimerSource = self->_timebaseTimerSource;
      *(_OWORD *)&fireTime.value = v23;
      fireTime.epoch = epoch;
      v12 = CMTimebaseSetTimerDispatchSourceNextFireTime(timebase, timebaseTimerSource, &fireTime, 0);
      if ((_DWORD)v12)
      {
        v13 = v12;
        +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101262AA8);
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100E3BF1C();
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101262AC8);
        v14 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DE7468(v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLAnimatedGIFController p_timebaseTimeDidChangeToStartOrEndTime]"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLAnimatedGIFController.m"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v16, 792, 0, "CMTimebaseSetTimerDispatchSourceNextFireTime failed (%d)", v13);

      }
      v17 = self->_timebase;
      fireTime = v26;
      immediateSourceTime = v27;
      v18 = CMTimebaseSetRateAndAnchorTime(v17, v28, &fireTime, &immediateSourceTime);
      if ((_DWORD)v18)
      {
        v19 = v18;
        +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101262AE8);
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100E3BE98();
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101262B08);
        v20 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DE7468(v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLAnimatedGIFController p_timebaseTimeDidChangeToStartOrEndTime]"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLAnimatedGIFController.m"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v21, v22, 796, 0, "CMTimebaseSetRateAndAnchorTime failed (%d)", v19);

      }
      -[CRLAnimatedGIFController p_updateTimebaseTimerSourceNextFireTime](self, "p_updateTimebaseTimerSourceNextFireTime");
      os_unfair_lock_unlock(&self->_timebaseLock);
      -[CRLAnimatedGIFController didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("rate"));
    }
  }
  else
  {
    -[CRLAnimatedGIFController setPlaying:](self, "setPlaying:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAnimatedGIFController delegate](self, "delegate"));
    objc_msgSend(v9, "playbackDidStopForPlayerController:", self);

  }
}

- (void)p_updateDisplayLink
{
  if (-[NSMutableSet count](self->_layers, "count") && self->_playing)
  {
    if (!self->_displayLink)
      -[CRLAnimatedGIFController p_enableDisplayLink](self, "p_enableDisplayLink");
  }
  else if (self->_displayLink)
  {
    -[CRLAnimatedGIFController p_disableDisplayLink](self, "p_disableDisplayLink");
  }
}

- (void)p_enableDisplayLink
{
  int v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  CRLDisplayLink *v8;
  CRLDisplayLink *v9;
  CRLDisplayLink *displayLink;
  void **v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  id location;

  if (self->_displayLinkCounter)
  {
    v3 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101262B28);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E3C0C8();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101262B48);
    v4 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E3C020(v4, v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLAnimatedGIFController p_enableDisplayLink]"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLAnimatedGIFController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 820, 0, "Double-enabling display link");

    v7 = self->_displayLinkCounter + 1;
  }
  else
  {
    v7 = 1;
  }
  self->_displayLinkCounter = v7;
  objc_initWeak(&location, self);
  v8 = [CRLDisplayLink alloc];
  v11 = _NSConcreteStackBlock;
  v12 = 3221225472;
  v13 = sub_1004AA3B8;
  v14 = &unk_101262B70;
  objc_copyWeak(&v15, &location);
  v9 = -[CRLDisplayLink initWithHandler:](v8, "initWithHandler:", &v11);
  displayLink = self->_displayLink;
  self->_displayLink = v9;

  -[CRLDisplayLink setPaused:](self->_displayLink, "setPaused:", 0, v11, v12, v13, v14);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (void)p_disableDisplayLink
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  CRLDisplayLink *displayLink;

  if (self->_displayLinkCounter == 1)
  {
    v3 = 0;
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101262B90);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E3C148();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101262BB0);
    v4 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLAnimatedGIFController p_disableDisplayLink]"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLAnimatedGIFController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 831, 0, "Disabling display link unexpectedly!");

    v3 = self->_displayLinkCounter - 1;
  }
  self->_displayLinkCounter = v3;
  -[CRLDisplayLink invalidate](self->_displayLink, "invalidate");
  displayLink = self->_displayLink;
  self->_displayLink = 0;

}

- (void)p_displayLinkDidTrigger
{
  void *v3;
  void *v4;
  void *v5;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101262BD0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E3C1C8();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101262BF0);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLAnimatedGIFController p_displayLinkDidTrigger]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLAnimatedGIFController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 838, 0, "This operation must only be performed on the main thread.");

  }
  -[CRLAnimatedGIFController p_updateLayers](self, "p_updateLayers");
}

- (void)p_updateLayers
{
  void *v3;
  void *v4;
  void *v5;
  NSMutableSet *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101262C10);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E3C248();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101262C30);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLAnimatedGIFController p_updateLayers]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLAnimatedGIFController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 843, 0, "This operation must only be performed on the main thread.");

  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_layers;
  v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i), "setNeedsDisplay", (_QWORD)v11);
      }
      v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)isPlaying
{
  return self->_playing;
}

- (double)startTime
{
  return self->_startTime;
}

- (int64_t)repeatMode
{
  return self->_repeatMode;
}

- (float)volume
{
  return self->_volume;
}

- (void)setVolume:(float)a3
{
  self->_volume = a3;
}

- (BOOL)isFastForwarding
{
  return self->_fastForwarding;
}

- (void)setFastForwarding:(BOOL)a3
{
  self->_fastForwarding = a3;
}

- (BOOL)isFastReversing
{
  return self->_fastReversing;
}

- (void)setFastReversing:(BOOL)a3
{
  self->_fastReversing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_observationTokens, 0);
  objc_storeStrong((id *)&self->_timebaseTimerSource, 0);
  objc_storeStrong((id *)&self->_layers, 0);
  objc_storeStrong((id *)&self->_frames, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
