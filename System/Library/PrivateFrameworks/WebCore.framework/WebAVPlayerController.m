@implementation WebAVPlayerController

- (WebAVPlayerController)init
{
  WebAVPlayerController *v3;
  const void *v4;
  objc_super v6;

  if (_MergedGlobals_32())
  {
    v6.receiver = self;
    v6.super_class = (Class)WebAVPlayerController;
    v3 = -[WebAVPlayerController init](&v6, sel_init);
    if (v3)
    {
      if ((byte_1ECE81CAD & 1) == 0)
      {
        *(_QWORD *)algn_1ECE81CE8 = dlopen("/System/Library/Frameworks/AVKit.framework/AVKit", 2);
        byte_1ECE81CAD = 1;
      }
      qword_1ECE81CE0 = (uint64_t)objc_getClass("AVPlayerController");
      _MergedGlobals_32 = AVPlayerControllerFunction;
      v4 = (const void *)objc_msgSend(objc_alloc((Class)qword_1ECE81CE0), "init");
      -[WebAVPlayerController setPlayerControllerProxy:](v3, "setPlayerControllerProxy:", v4);
      if (v4)
        CFRelease(v4);
      v3->_liveStreamEventModePossible = 1;
      -[WebAVPlayerController addObserver:forKeyPath:options:context:](v3, "addObserver:forKeyPath:options:context:", v3, CFSTR("seekableTimeRanges"), 7, off_1ECE7B378);
      -[WebAVPlayerController addObserver:forKeyPath:options:context:](v3, "addObserver:forKeyPath:options:context:", v3, CFSTR("hasLiveStreamingContent"), 4, off_1ECE7B380);
      -[WebAVPlayerController addObserver:forKeyPath:options:context:](v3, "addObserver:forKeyPath:options:context:", v3, CFSTR("playingOnSecondScreen"), 1, off_1ECE7B388);
    }
  }
  else
  {

    return 0;
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[WebAVPlayerController removeObserver:forKeyPath:context:](self, "removeObserver:forKeyPath:context:", self, CFSTR("seekableTimeRanges"), off_1ECE7B378);
  -[WebAVPlayerController removeObserver:forKeyPath:context:](self, "removeObserver:forKeyPath:context:", self, CFSTR("hasLiveStreamingContent"), off_1ECE7B380);
  -[WebAVPlayerController removeObserver:forKeyPath:context:](self, "removeObserver:forKeyPath:context:", self, CFSTR("playingOnSecondScreen"), off_1ECE7B388);

  v3.receiver = self;
  v3.super_class = (Class)WebAVPlayerController;
  -[WebAVPlayerController dealloc](&v3, sel_dealloc);
}

- (id)player
{
  return self->_player.m_ptr;
}

- (id)currentItem
{
  return (id)objc_msgSend(self->_player.m_ptr, "currentItem");
}

- (void)play:(id)a3
{
  void *v4;

  if (-[WebAVPlayerController delegate](self, "delegate", a3))
  {
    v4 = -[WebAVPlayerController delegate](self, "delegate");
    (*(void (**)(void *))(*(_QWORD *)v4 + 64))(v4);
  }
}

- (void)pause:(id)a3
{
  void *v4;

  if (-[WebAVPlayerController delegate](self, "delegate", a3))
  {
    v4 = -[WebAVPlayerController delegate](self, "delegate");
    (*(void (**)(void *))(*(_QWORD *)v4 + 72))(v4);
  }
}

- (void)togglePlayback:(id)a3
{
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  if (-[WebAVPlayerController delegate](self, "delegate", a3))
  {
    v4 = -[WebAVPlayerController delegate](self, "delegate");
    v5 = (*(uint64_t (**)(void *))(*(_QWORD *)v4 + 304))(v4);
    v6 = *(_QWORD *)-[WebAVPlayerController delegate](self, "delegate");
    v7 = 64;
    if (v5)
      v7 = 72;
    (*(void (**)(void))(v6 + v7))();
  }
}

- (BOOL)isPlaying
{
  double v2;

  -[WebAVPlayerController rate](self, "rate");
  return v2 != 0.0;
}

- (void)setPlaying:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  uint64_t v6;

  v3 = a3;
  if (-[WebAVPlayerController delegate](self, "delegate"))
  {
    v5 = *(_QWORD *)-[WebAVPlayerController delegate](self, "delegate");
    v6 = 72;
    if (v3)
      v6 = 64;
    (*(void (**)(void))(v5 + v6))();
  }
}

- (void)delegate
{
  DefaultWeakPtrImpl *m_ptr;

  m_ptr = self->_delegate.m_impl.m_ptr;
  if (m_ptr)
    return (void *)*((_QWORD *)m_ptr + 1);
  else
    return 0;
}

- (void)setDelegate:(void *)a3
{
  uint64_t v5;
  unsigned int *v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int *m_ptr;
  unsigned int v11;
  unsigned int v12;

  if (a3)
  {
    v5 = *((_QWORD *)a3 + 1);
    if (v5)
      goto LABEL_18;
    v5 = WTF::fastCompactMalloc((WTF *)0x10);
    *(_DWORD *)v5 = 1;
    *(_QWORD *)(v5 + 8) = a3;
    v6 = (unsigned int *)*((_QWORD *)a3 + 1);
    *((_QWORD *)a3 + 1) = v5;
    if (!v6)
      goto LABEL_18;
    do
    {
      v7 = __ldaxr(v6);
      v8 = v7 - 1;
    }
    while (__stlxr(v8, v6));
    if (!v8)
    {
      atomic_store(1u, v6);
      WTF::fastFree((WTF *)v6, (void *)a2);
    }
    v5 = *((_QWORD *)a3 + 1);
    if (v5)
    {
LABEL_18:
      do
        v9 = __ldaxr((unsigned int *)v5);
      while (__stlxr(v9 + 1, (unsigned int *)v5));
    }
  }
  else
  {
    v5 = 0;
  }
  m_ptr = (unsigned int *)self->_delegate.m_impl.m_ptr;
  self->_delegate.m_impl.m_ptr = (DefaultWeakPtrImpl *)v5;
  if (m_ptr)
  {
    do
    {
      v11 = __ldaxr(m_ptr);
      v12 = v11 - 1;
    }
    while (__stlxr(v12, m_ptr));
    if (!v12)
    {
      atomic_store(1u, m_ptr);
      WTF::fastFree((WTF *)m_ptr, (void *)a2);
    }
  }
}

- (void)playbackSessionInterface
{
  DefaultWeakPtrImpl *m_ptr;

  m_ptr = self->_playbackSessionInterface.m_impl.m_ptr;
  if (m_ptr)
    return (void *)*((_QWORD *)m_ptr + 1);
  else
    return 0;
}

- (void)setPlaybackSessionInterface:(void *)a3
{
  uint64_t v5;
  unsigned int *v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int *m_ptr;
  unsigned int v11;
  unsigned int v12;

  if (a3)
  {
    v5 = *((_QWORD *)a3 + 1);
    if (v5)
      goto LABEL_18;
    v5 = WTF::fastCompactMalloc((WTF *)0x10);
    *(_DWORD *)v5 = 1;
    *(_QWORD *)(v5 + 8) = a3;
    v6 = (unsigned int *)*((_QWORD *)a3 + 1);
    *((_QWORD *)a3 + 1) = v5;
    if (!v6)
      goto LABEL_18;
    do
    {
      v7 = __ldaxr(v6);
      v8 = v7 - 1;
    }
    while (__stlxr(v8, v6));
    if (!v8)
    {
      atomic_store(1u, v6);
      WTF::fastFree((WTF *)v6, (void *)a2);
    }
    v5 = *((_QWORD *)a3 + 1);
    if (v5)
    {
LABEL_18:
      do
        v9 = __ldaxr((unsigned int *)v5);
      while (__stlxr(v9 + 1, (unsigned int *)v5));
    }
  }
  else
  {
    v5 = 0;
  }
  m_ptr = (unsigned int *)self->_playbackSessionInterface.m_impl.m_ptr;
  self->_playbackSessionInterface.m_impl.m_ptr = (DefaultWeakPtrImpl *)v5;
  if (m_ptr)
  {
    do
    {
      v11 = __ldaxr(m_ptr);
      v12 = v11 - 1;
    }
    while (__stlxr(v12, m_ptr));
    if (!v12)
    {
      atomic_store(1u, m_ptr);
      WTF::fastFree((WTF *)m_ptr, (void *)a2);
    }
  }
}

- (double)defaultPlaybackRate
{
  return self->_defaultPlaybackRate;
}

- (void)setDefaultPlaybackRate:(double)a3
{
  -[WebAVPlayerController setDefaultPlaybackRate:fromJavaScript:](self, "setDefaultPlaybackRate:fromJavaScript:", 0, a3);
}

- (void)setDefaultPlaybackRate:(double)a3 fromJavaScript:(BOOL)a4
{
  _BOOL8 v5;
  void *v7;
  void *v8;

  if (self->_defaultPlaybackRate != a3)
  {
    v5 = a4;
    -[WebAVPlayerController willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("defaultPlaybackRate"));
    self->_defaultPlaybackRate = a3;
    -[WebAVPlayerController didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("defaultPlaybackRate"));
    if (!v5)
    {
      if (-[WebAVPlayerController delegate](self, "delegate"))
      {
        v7 = -[WebAVPlayerController delegate](self, "delegate");
        if ((*(double (**)(void *))(*(_QWORD *)v7 + 328))(v7) != self->_defaultPlaybackRate)
        {
          v8 = -[WebAVPlayerController delegate](self, "delegate");
          (*(void (**)(void *, double))(*(_QWORD *)v8 + 144))(v8, self->_defaultPlaybackRate);
        }
      }
    }
    if (-[WebAVPlayerController isPlaying](self, "isPlaying"))
      -[WebAVPlayerController setRate:fromJavaScript:](self, "setRate:fromJavaScript:", v5, self->_defaultPlaybackRate);
  }
}

- (double)rate
{
  return self->_rate;
}

- (void)setRate:(double)a3
{
  -[WebAVPlayerController setRate:fromJavaScript:](self, "setRate:fromJavaScript:", 0, a3);
}

- (void)setRate:(double)a3 fromJavaScript:(BOOL)a4
{
  _BOOL8 v5;
  void *v7;
  void *v8;

  if (self->_rate != a3)
  {
    v5 = a4;
    -[WebAVPlayerController willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("rate"));
    self->_rate = a3;
    -[WebAVPlayerController didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("rate"));
    if (self->_rate != 0.0)
    {
      -[WebAVPlayerController setDefaultPlaybackRate:fromJavaScript:](self, "setDefaultPlaybackRate:fromJavaScript:", v5);
      if (!v5)
      {
        if (-[WebAVPlayerController delegate](self, "delegate"))
        {
          v7 = -[WebAVPlayerController delegate](self, "delegate");
          if ((*(double (**)(void *))(*(_QWORD *)v7 + 336))(v7) != self->_rate)
          {
            v8 = -[WebAVPlayerController delegate](self, "delegate");
            (*(void (**)(void *, double))(*(_QWORD *)v8 + 152))(v8, self->_rate);
          }
        }
      }
    }
  }
}

+ (id)keyPathsForValuesAffectingPlaying
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("rate"));
}

- (void)beginScrubbing:(id)a3
{
  void *v4;

  self->_isScrubbing = 1;
  if (-[WebAVPlayerController delegate](self, "delegate", a3))
  {
    v4 = -[WebAVPlayerController delegate](self, "delegate");
    (*(void (**)(void *))(*(_QWORD *)v4 + 88))(v4);
  }
}

- (void)endScrubbing:(id)a3
{
  void *v4;

  self->_isScrubbing = 0;
  if (-[WebAVPlayerController delegate](self, "delegate", a3))
  {
    v4 = -[WebAVPlayerController delegate](self, "delegate");
    (*(void (**)(void *))(*(_QWORD *)v4 + 96))(v4);
  }
}

- (void)seekToTime:(double)a3
{
  void *v5;

  self->_seekToTime = a3;
  if (-[WebAVPlayerController delegate](self, "delegate"))
  {
    v5 = -[WebAVPlayerController delegate](self, "delegate");
    (*(void (**)(void *, double, double, double))(*(_QWORD *)v5 + 104))(v5, a3, 0.0, 0.0);
  }
}

- (void)seekToTime:(double)a3 toleranceBefore:(double)a4 toleranceAfter:(double)a5
{
  void *v9;

  self->_seekToTime = a3;
  if (-[WebAVPlayerController delegate](self, "delegate"))
  {
    v9 = -[WebAVPlayerController delegate](self, "delegate");
    (*(void (**)(void *, double, double, double))(*(_QWORD *)v9 + 104))(v9, a3, a4, a5);
  }
}

- (void)seekByTimeInterval:(double)a3
{
  -[WebAVPlayerController seekByTimeInterval:toleranceBefore:toleranceAfter:](self, "seekByTimeInterval:toleranceBefore:toleranceAfter:", a3, 0.0, 0.0);
}

- (void)seekByTimeInterval:(double)a3 toleranceBefore:(double)a4 toleranceAfter:(double)a5
{
  double v9;

  -[AVValueTiming currentValue](-[WebAVPlayerController timing](self, "timing"), "currentValue");
  -[WebAVPlayerController seekToTime:toleranceBefore:toleranceAfter:](self, "seekToTime:toleranceBefore:toleranceAfter:", v9 + a3, a4, a5);
}

- (double)currentTimeWithinEndTimes
{
  double result;

  -[AVValueTiming currentValue](-[WebAVPlayerController timing](self, "timing"), "currentValue");
  return result;
}

+ (id)keyPathsForValuesAffectingCurrentTimeWithinEndTimes
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("timing"));
}

- (BOOL)hasLiveStreamingContent
{
  double v3;

  if (-[WebAVPlayerController status](self, "status") != 2)
    return 0;
  -[WebAVPlayerController contentDuration](self, "contentDuration");
  return v3 == INFINITY;
}

+ (id)keyPathsForValuesAffectingHasLiveStreamingContent
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("contentDuration"), CFSTR("status"), 0);
}

- (double)maxTime
{
  double result;

  -[WebAVPlayerController contentDuration](self, "contentDuration");
  if (fabs(result) == INFINITY)
  {
    if (-[WebAVPlayerController hasSeekableLiveStreamingContent](self, "hasSeekableLiveStreamingContent")
      && -[WebAVPlayerController maxTiming](self, "maxTiming"))
    {
      -[AVValueTiming currentValue](-[WebAVPlayerController maxTiming](self, "maxTiming"), "currentValue");
    }
    else
    {
      return NAN;
    }
  }
  return result;
}

+ (id)keyPathsForValuesAffectingMaxTime
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("contentDuration"), CFSTR("hasSeekableLiveStreamingContent"), CFSTR("maxTiming"), 0);
}

- (double)minTime
{
  double result;

  if (!-[WebAVPlayerController hasSeekableLiveStreamingContent](self, "hasSeekableLiveStreamingContent")
    || !-[WebAVPlayerController minTiming](self, "minTiming"))
  {
    return 0.0;
  }
  -[AVValueTiming currentValue](-[WebAVPlayerController minTiming](self, "minTiming"), "currentValue");
  return result;
}

+ (id)keyPathsForValuesAffectingMinTime
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("hasSeekableLiveStreamingContent"), CFSTR("minTiming"), 0);
}

- (void)skipBackwardThirtySeconds:(id)a3
{
  int v4;
  double v5;
  int v6;
  CMTime *v7;
  NSArray *v8;
  uint64_t v9;
  CMTime *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  CMTime *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  CMTimeEpoch v24;
  __int128 v25;
  uint64_t v26;
  __int128 v27;
  CMTimeEpoch v28;
  __int128 v29;
  uint64_t v30;
  CMTimeRange v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v29 = 0uLL;
  v30 = 0;
  -[AVValueTiming currentValue](-[WebAVPlayerController timing](self, "timing", a3), "currentValue");
  PAL::softLinkCoreMediaCMTimeMakeWithSeconds((PAL *)0x3E8, v5, v4);
  v27 = 0uLL;
  v28 = 0;
  v25 = 0uLL;
  v26 = 0;
  PAL::softLinkCoreMediaCMTimeMake((PAL *)0x1E, 1, v6);
  *(_OWORD *)&v31.duration.timescale = 0uLL;
  *(_QWORD *)&v32 = 0;
  *(_OWORD *)&v31.start.value = v23;
  v31.start.epoch = v24;
  PAL::softLinkCoreMediaCMTimeSubtract((PAL *)&v31.duration.timescale, &v31.start, v7);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = -[WebAVPlayerController seekableTimeRanges](self, "seekableTimeRanges");
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v19, v34, 16);
  if (v9)
  {
    v11 = v9;
    v12 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if (v14)
        {
          objc_msgSend(v14, "CMTimeRangeValue");
        }
        else
        {
          v17 = 0u;
          v18 = 0u;
          v16 = 0u;
        }
        *(_OWORD *)&v31.start.value = v27;
        v31.start.epoch = v28;
        *(_OWORD *)&v31.duration.timescale = v16;
        v32 = v17;
        v33 = v18;
        if (PAL::softLinkCoreMediaCMTimeRangeContainsTime((PAL *)&v31.duration.timescale, &v31, v10))
        {
          *(_OWORD *)&v31.duration.timescale = v27;
          *(_QWORD *)&v32 = v28;
          -[WebAVPlayerController seekToTime:](self, "seekToTime:", PAL::softLinkCoreMediaCMTimeGetSeconds((PAL *)&v31.duration.timescale, v15));
          return;
        }
      }
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v19, v34, 16);
      if (v11)
        continue;
      break;
    }
  }
}

- (void)gotoEndOfSeekableRanges:(id)a3
{
  NSArray *v4;
  uint64_t v5;
  CMTimeRange *v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  uint64_t i;
  void *v11;
  CMTime *v12;
  double Seconds;
  __int128 v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = -[WebAVPlayerController seekableTimeRanges](self, "seekableTimeRanges", a3);
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v16, v23, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v17;
    v9 = NAN;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v4);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (v11)
          objc_msgSend(v11, "CMTimeRangeValue");
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        PAL::softLinkCoreMediaCMTimeRangeGetEnd((PAL *)&v20, v6);
        v20 = v14;
        *(_QWORD *)&v21 = v15;
        Seconds = PAL::softLinkCoreMediaCMTimeGetSeconds((PAL *)&v20, v12);
        if (Seconds > v9)
          v9 = Seconds;
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v16, v23, 16);
    }
    while (v7);
    -[WebAVPlayerController seekToTime:](self, "seekToTime:", v9);
  }
}

- (BOOL)isScrubbing
{
  return self->_isScrubbing;
}

- (BOOL)isSeeking
{
  return self->_isScrubbing;
}

- (double)seekToTime
{
  return self->_seekToTime;
}

+ (id)keyPathsForValuesAffectingCanScanForward
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("canPlay"));
}

- (void)beginScanningForward:(id)a3
{
  void *v4;

  if (-[WebAVPlayerController delegate](self, "delegate", a3))
  {
    v4 = -[WebAVPlayerController delegate](self, "delegate");
    (*(void (**)(void *))(*(_QWORD *)v4 + 120))(v4);
  }
}

- (void)endScanningForward:(id)a3
{
  void *v4;

  if (-[WebAVPlayerController delegate](self, "delegate", a3))
  {
    v4 = -[WebAVPlayerController delegate](self, "delegate");
    (*(void (**)(void *))(*(_QWORD *)v4 + 136))(v4);
  }
}

- (void)beginScanningBackward:(id)a3
{
  void *v4;

  if (-[WebAVPlayerController delegate](self, "delegate", a3))
  {
    v4 = -[WebAVPlayerController delegate](self, "delegate");
    (*(void (**)(void *))(*(_QWORD *)v4 + 128))(v4);
  }
}

- (void)endScanningBackward:(id)a3
{
  void *v4;

  if (-[WebAVPlayerController delegate](self, "delegate", a3))
  {
    v4 = -[WebAVPlayerController delegate](self, "delegate");
    (*(void (**)(void *))(*(_QWORD *)v4 + 136))(v4);
  }
}

- (BOOL)canSeekToBeginning
{
  CMTimeFlags v3;
  CMTimeEpoch v4;
  NSArray *v5;
  uint64_t v6;
  CMTime *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v13;
  uint64_t v14;
  CMTimeValue v15;
  CMTimeScale v16;
  CMTimeFlags v17;
  CMTimeEpoch v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  CMTime v23;
  __int128 v24;
  uint64_t v25;
  _BYTE v26[128];
  CMTimeValue v27;
  CMTimeScale v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (PAL::get_CoreMedia_kCMTimeIndefinite(void)::once != -1)
    dispatch_once(&PAL::get_CoreMedia_kCMTimeIndefinite(void)::once, &__block_literal_global_15_0);
  v27 = PAL::get_CoreMedia_kCMTimeIndefinite(void)::constantCoreMediakCMTimeIndefinite;
  v3 = HIDWORD(PAL::get_CoreMedia_kCMTimeIndefinite(void)::constantCoreMediakCMTimeIndefinite);
  v28 = DWORD2(PAL::get_CoreMedia_kCMTimeIndefinite(void)::constantCoreMediakCMTimeIndefinite);
  v4 = qword_1EE2E6938;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = -[WebAVPlayerController seekableTimeRanges](self, "seekableTimeRanges");
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v26, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if (v11)
        {
          objc_msgSend(v11, "CMTimeRangeValue");
        }
        else
        {
          v14 = 0;
          v13 = 0u;
        }
        v24 = v13;
        v25 = v14;
        v23.value = v27;
        v23.timescale = v28;
        v23.flags = v3;
        v23.epoch = v4;
        PAL::softLinkCoreMediaCMTimeMinimum((PAL *)&v24, &v23, v7);
        v27 = v15;
        v3 = v17;
        v28 = v16;
        v4 = v18;
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v26, 16);
    }
    while (v8);
  }
  return (v3 & 0x1D) == 1;
}

+ (id)keyPathsForValuesAffectingCanSeekToBeginning
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("seekableTimeRanges"));
}

- (void)seekToBeginning:(id)a3
{
  void *v4;

  if (-[WebAVPlayerController delegate](self, "delegate", a3))
  {
    v4 = -[WebAVPlayerController delegate](self, "delegate");
    (*(void (**)(void *, double, double, double))(*(_QWORD *)v4 + 104))(v4, -INFINITY, 0.0, 0.0);
  }
}

- (BOOL)canSeekToEnd
{
  CMTimeFlags v3;
  CMTimeEpoch v4;
  NSArray *v5;
  uint64_t v6;
  CMTimeRange *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  CMTime *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  CMTimeValue v19;
  CMTimeScale v20;
  CMTimeFlags v21;
  CMTimeEpoch v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  CMTime v30;
  _BYTE v31[128];
  CMTimeValue v32;
  CMTimeScale v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (PAL::get_CoreMedia_kCMTimeIndefinite(void)::once != -1)
    dispatch_once(&PAL::get_CoreMedia_kCMTimeIndefinite(void)::once, &__block_literal_global_15_0);
  v32 = PAL::get_CoreMedia_kCMTimeIndefinite(void)::constantCoreMediakCMTimeIndefinite;
  v3 = HIDWORD(PAL::get_CoreMedia_kCMTimeIndefinite(void)::constantCoreMediakCMTimeIndefinite);
  v33 = DWORD2(PAL::get_CoreMedia_kCMTimeIndefinite(void)::constantCoreMediakCMTimeIndefinite);
  v4 = qword_1EE2E6938;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v5 = -[WebAVPlayerController seekableTimeRanges](self, "seekableTimeRanges");
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        if (v11)
        {
          objc_msgSend(v11, "CMTimeRangeValue");
        }
        else
        {
          v15 = 0u;
          v16 = 0u;
          v14 = 0u;
        }
        v27 = v14;
        v28 = v15;
        v29 = v16;
        PAL::softLinkCoreMediaCMTimeRangeGetEnd((PAL *)&v27, v7);
        v30.value = v32;
        v30.timescale = v33;
        v30.flags = v3;
        v30.epoch = v4;
        v27 = v17;
        *(_QWORD *)&v28 = v18;
        PAL::softLinkCoreMediaCMTimeMaximum[0]((PAL *)&v27, &v30, v12);
        v32 = v19;
        v3 = v21;
        v33 = v20;
        v4 = v22;
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v8);
  }
  return (v3 & 0x1D) == 1;
}

+ (id)keyPathsForValuesAffectingCanSeekToEnd
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("seekableTimeRanges"));
}

- (void)seekToEnd:(id)a3
{
  void *v4;

  if (-[WebAVPlayerController delegate](self, "delegate", a3))
  {
    v4 = -[WebAVPlayerController delegate](self, "delegate");
    (*(void (**)(void *, double, double, double))(*(_QWORD *)v4 + 104))(v4, INFINITY, 0.0, 0.0);
  }
}

- (BOOL)canSeekFrameBackward
{
  return 0;
}

- (BOOL)canSeekFrameForward
{
  return 0;
}

- (BOOL)hasMediaSelectionOptions
{
  return -[WebAVPlayerController hasAudioMediaSelectionOptions](self, "hasAudioMediaSelectionOptions")
      || -[WebAVPlayerController hasLegibleMediaSelectionOptions](self, "hasLegibleMediaSelectionOptions");
}

+ (id)keyPathsForValuesAffectingHasMediaSelectionOptions
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("hasAudioMediaSelectionOptions"), CFSTR("hasLegibleMediaSelectionOptions"), 0);
}

- (BOOL)hasAudioMediaSelectionOptions
{
  return -[NSArray count](-[WebAVPlayerController audioMediaSelectionOptions](self, "audioMediaSelectionOptions"), "count") > 1;
}

+ (id)keyPathsForValuesAffectingHasAudioMediaSelectionOptions
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("audioMediaSelectionOptions"));
}

- (BOOL)hasLegibleMediaSelectionOptions
{
  return -[NSArray count](-[WebAVPlayerController legibleMediaSelectionOptions](self, "legibleMediaSelectionOptions"), "count") > 2;
}

+ (id)keyPathsForValuesAffectingHasLegibleMediaSelectionOptions
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("legibleMediaSelectionOptions"));
}

- (WebAVMediaSelectionOption)currentAudioMediaSelectionOption
{
  return self->_currentAudioMediaSelectionOption;
}

- (void)setCurrentAudioMediaSelectionOption:(id)a3
{
  WebAVMediaSelectionOption *currentAudioMediaSelectionOption;
  void *v6;
  NSUInteger v7;
  NSUInteger v8;
  void *v9;

  currentAudioMediaSelectionOption = self->_currentAudioMediaSelectionOption;
  if (currentAudioMediaSelectionOption != a3)
  {

    self->_currentAudioMediaSelectionOption = (WebAVMediaSelectionOption *)a3;
    v6 = -[WebAVPlayerController delegate](self, "delegate");
    if (a3)
    {
      if (v6 && -[WebAVPlayerController audioMediaSelectionOptions](self, "audioMediaSelectionOptions"))
      {
        v7 = -[NSArray indexOfObject:](-[WebAVPlayerController audioMediaSelectionOptions](self, "audioMediaSelectionOptions"), "indexOfObject:", a3);
        if (v7 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v8 = v7;
          v9 = -[WebAVPlayerController delegate](self, "delegate");
          (*(void (**)(void *, NSUInteger))(*(_QWORD *)v9 + 160))(v9, v8);
        }
      }
    }
  }
}

- (WebAVMediaSelectionOption)currentLegibleMediaSelectionOption
{
  return self->_currentLegibleMediaSelectionOption;
}

- (void)setCurrentLegibleMediaSelectionOption:(id)a3
{
  WebAVMediaSelectionOption *currentLegibleMediaSelectionOption;
  void *v6;
  NSUInteger v7;
  NSUInteger v8;
  void *v9;

  currentLegibleMediaSelectionOption = self->_currentLegibleMediaSelectionOption;
  if (currentLegibleMediaSelectionOption != a3)
  {

    self->_currentLegibleMediaSelectionOption = (WebAVMediaSelectionOption *)a3;
    v6 = -[WebAVPlayerController delegate](self, "delegate");
    if (a3)
    {
      if (v6 && -[WebAVPlayerController legibleMediaSelectionOptions](self, "legibleMediaSelectionOptions"))
      {
        v7 = -[NSArray indexOfObject:](-[WebAVPlayerController legibleMediaSelectionOptions](self, "legibleMediaSelectionOptions"), "indexOfObject:", a3);
        if (v7 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v8 = v7;
          v9 = -[WebAVPlayerController delegate](self, "delegate");
          (*(void (**)(void *, NSUInteger))(*(_QWORD *)v9 + 168))(v9, v8);
        }
      }
    }
  }
}

- (BOOL)isPlayingOnExternalScreen
{
  return -[WebAVPlayerController isExternalPlaybackActive](self, "isExternalPlaybackActive")
      || -[WebAVPlayerController isPlayingOnSecondScreen](self, "isPlayingOnSecondScreen");
}

+ (id)keyPathsForValuesAffectingPlayingOnExternalScreen
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("externalPlaybackActive"), CFSTR("playingOnSecondScreen"), 0);
}

- (void)setAllowsPictureInPicture:(BOOL)a3
{
  self->_allowsPictureInPicture = a3;
}

- (BOOL)isPictureInPicturePossible
{
  if (self->_allowsPictureInPicture)
    return !-[WebAVPlayerController isExternalPlaybackActive](self, "isExternalPlaybackActive");
  else
    return 0;
}

- (BOOL)isPictureInPictureInterrupted
{
  return self->_pictureInPictureInterrupted;
}

- (void)setPictureInPictureInterrupted:(BOOL)a3
{
  if (self->_pictureInPictureInterrupted != a3)
  {
    self->_pictureInPictureInterrupted = a3;
    if (a3)
      -[WebAVPlayerController setPlaying:](self, "setPlaying:", 0);
  }
}

- (BOOL)isMuted
{
  return self->_muted;
}

- (void)setMuted:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  if (self->_muted != a3)
  {
    v3 = a3;
    self->_muted = a3;
    if (-[WebAVPlayerController delegate](self, "delegate"))
    {
      v5 = -[WebAVPlayerController delegate](self, "delegate");
      (*(void (**)(void *, _BOOL8))(*(_QWORD *)v5 + 216))(v5, v3);
    }
  }
}

- (void)toggleMuted:(id)a3
{
  void *v4;

  if (-[WebAVPlayerController delegate](self, "delegate", a3))
  {
    v4 = -[WebAVPlayerController delegate](self, "delegate");
    (*(void (**)(void *))(*(_QWORD *)v4 + 208))(v4);
  }
}

- (double)volume
{
  void *v3;
  double result;

  if (!-[WebAVPlayerController delegate](self, "delegate"))
    return 0.0;
  v3 = -[WebAVPlayerController delegate](self, "delegate");
  (*(void (**)(void *))(*(_QWORD *)v3 + 448))(v3);
  return result;
}

- (void)setVolume:(double)a3
{
  void *v5;

  if (-[WebAVPlayerController delegate](self, "delegate"))
  {
    v5 = -[WebAVPlayerController delegate](self, "delegate");
    (*(void (**)(void *, double))(*(_QWORD *)v5 + 224))(v5, a3);
  }
}

- (void)volumeChanged:(double)a3
{
  -[WebAVPlayerController willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("volume"), a3);
  -[WebAVPlayerController didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("volume"));
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  void *v7;
  void *v9;
  void *v10;
  void *v11;
  CMTimeRange *v12;
  void *v13;
  CMTime *v14;
  CMTimeRange v15;
  CMTimeRange v16;
  CMTimeRange v17;
  CMTimeRange v18;

  if (off_1ECE7B378 == a6)
  {
    v9 = (void *)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CC8], a4);
    v10 = (void *)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8]);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        memset(&v16, 0, sizeof(v16));
        if (objc_msgSend(v9, "count"))
        {
          v11 = (void *)objc_msgSend(v9, "firstObject");
          if (v11)
            objc_msgSend(v11, "CMTimeRangeValue");
          else
            memset(&v16, 0, sizeof(v16));
        }
        else
        {
          if (PAL::get_CoreMedia_kCMTimeRangeInvalid(void)::once != -1)
            dispatch_once(&PAL::get_CoreMedia_kCMTimeRangeInvalid(void)::once, &__block_literal_global_12_1);
          v16 = *(CMTimeRange *)PAL::get_CoreMedia_kCMTimeRangeInvalid(void)::constantCoreMediakCMTimeRangeInvalid;
        }
        memset(&v15.start.epoch, 0, 32);
        if (objc_msgSend(v10, "count", 0, 0))
        {
          v13 = (void *)objc_msgSend(v10, "firstObject");
          if (v13)
            objc_msgSend(v13, "CMTimeRangeValue");
          else
            memset(&v15, 0, sizeof(v15));
        }
        else
        {
          if (PAL::get_CoreMedia_kCMTimeRangeInvalid(void)::once != -1)
            dispatch_once(&PAL::get_CoreMedia_kCMTimeRangeInvalid(void)::once, &__block_literal_global_12_1);
          v15 = *(CMTimeRange *)PAL::get_CoreMedia_kCMTimeRangeInvalid(void)::constantCoreMediakCMTimeRangeInvalid;
        }
        v18 = v16;
        v17 = v15;
        if (!PAL::softLinkCoreMediaCMTimeRangeEqual((PAL *)&v18, &v17, v12))
        {
          if ((v15.start.flags & 1) != 0
            && (v15.duration.flags & 1) != 0
            && !v15.duration.epoch
            && (v15.duration.value & 0x8000000000000000) == 0
            && (v16.start.flags & 1) != 0
            && (v16.duration.flags & 1) != 0
            && !v16.duration.epoch
            && (v16.duration.value & 0x8000000000000000) == 0
            && self->_liveStreamEventModePossible)
          {
            v18 = v15;
            *(_OWORD *)&v17.start.value = *(_OWORD *)&v16.start.value;
            v17.start.epoch = v16.start.epoch;
            if (!PAL::softLinkCoreMediaCMTimeRangeContainsTime((PAL *)&v18, &v17, v14))
              self->_liveStreamEventModePossible = 0;
          }
          -[WebAVPlayerController updateMinMaxTiming](self, "updateMinMaxTiming", *(_OWORD *)&v15.start.value);
        }
      }
    }
  }
  else if (off_1ECE7B380 == a6)
  {
    -[WebAVPlayerController updateMinMaxTiming](self, "updateMinMaxTiming", a3, a4, a5);
  }
  else if (off_1ECE7B388 == a6)
  {
    v7 = -[WebAVPlayerController delegate](self, "delegate", a3, a4, a5);
    if (v7)
      (*(void (**)(void *, BOOL))(*(_QWORD *)v7 + 232))(v7, self->_playingOnSecondScreen);
  }
}

- (void)updateMinMaxTiming
{
  id v3;
  void *AVValueTimingClass;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  if (-[WebAVPlayerController hasLiveStreamingContent](self, "hasLiveStreamingContent"))
  {
    if (-[NSArray count](-[WebAVPlayerController seekableTimeRanges](self, "seekableTimeRanges"), "count"))
    {
      v3 = -[NSArray firstObject](-[WebAVPlayerController seekableTimeRanges](self, "seekableTimeRanges"), "firstObject");
      if (v3)
        objc_msgSend(v3, "CMTimeRangeValue");
    }
  }
  AVValueTimingClass = (void *)getAVValueTimingClass();
  -[WebAVPlayerController minTime](self, "minTime");
  v5 = objc_msgSend(AVValueTimingClass, "valueTimingWithAnchorValue:anchorTimeStamp:rate:");
  v6 = (void *)getAVValueTimingClass();
  -[WebAVPlayerController maxTime](self, "maxTime");
  v7 = objc_msgSend(v6, "valueTimingWithAnchorValue:anchorTimeStamp:rate:");
  -[WebAVPlayerController setMinTiming:](self, "setMinTiming:", v5);
  -[WebAVPlayerController setMaxTiming:](self, "setMaxTiming:", v7);
}

- (BOOL)hasSeekableLiveStreamingContent
{
  AVValueTiming *v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  LODWORD(v3) = -[WebAVPlayerController hasLiveStreamingContent](self, "hasLiveStreamingContent");
  if ((_DWORD)v3)
  {
    v3 = -[WebAVPlayerController minTiming](self, "minTiming");
    if (v3)
    {
      v3 = -[WebAVPlayerController maxTiming](self, "maxTiming");
      if (v3)
      {
        -[WebAVPlayerController liveUpdateInterval](self, "liveUpdateInterval");
        if ((v4 & 0x7FFFFFFFFFFFFFFFuLL) > 0x7FEFFFFFFFFFFFFFLL
          || (-[WebAVPlayerController liveUpdateInterval](self, "liveUpdateInterval"), v5 <= 1.0)
          || (-[WebAVPlayerController seekableTimeRangesLastModifiedTime](self, "seekableTimeRangesLastModifiedTime"),
              v6 == 0.0))
        {
          LOBYTE(v3) = 0;
        }
        else
        {
          objc_msgSend((id)getAVValueTimingClass(), "currentTimeStamp");
          v8 = v7;
          -[AVValueTiming valueForTimeStamp:](-[WebAVPlayerController minTiming](self, "minTiming"), "valueForTimeStamp:", v7);
          v10 = v9;
          -[AVValueTiming valueForTimeStamp:](-[WebAVPlayerController maxTiming](self, "maxTiming"), "valueForTimeStamp:", v8);
          LOBYTE(v3) = v11 - v10 > 30.0;
        }
      }
    }
  }
  return (char)v3;
}

+ (id)keyPathsForValuesAffectingHasSeekableLiveStreamingContent
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("hasLiveStreamingContent"), CFSTR("minTiming"), CFSTR("maxTiming"), CFSTR("seekableTimeRangesLastModifiedTime"), 0);
}

- (AVPlayerController)playerControllerProxy
{
  return (AVPlayerController *)objc_getProperty(self, a2, 96, 1);
}

- (void)setPlayerControllerProxy:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (BOOL)canScanBackward
{
  return self->_canScanBackward;
}

- (void)setCanScanBackward:(BOOL)a3
{
  self->_canScanBackward = a3;
}

- (BOOL)hasContentChapters
{
  return self->_hasContentChapters;
}

- (BOOL)canPlay
{
  return self->_canPlay;
}

- (void)setCanPlay:(BOOL)a3
{
  self->_canPlay = a3;
}

- (BOOL)canPause
{
  return self->_canPause;
}

- (void)setCanPause:(BOOL)a3
{
  self->_canPause = a3;
}

- (BOOL)canTogglePlayback
{
  return self->_canTogglePlayback;
}

- (void)setCanTogglePlayback:(BOOL)a3
{
  self->_canTogglePlayback = a3;
}

- (BOOL)canSeek
{
  return self->_canSeek;
}

- (void)setCanSeek:(BOOL)a3
{
  self->_canSeek = a3;
}

- (double)contentDuration
{
  return self->_contentDuration;
}

- (void)setContentDuration:(double)a3
{
  self->_contentDuration = a3;
}

- (CGSize)contentDimensions
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGSize result;

  objc_copyStruct(v4, &self->_contentDimensions, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setContentDimensions:(CGSize)a3
{
  CGSize v3;

  v3 = a3;
  objc_copyStruct(&self->_contentDimensions, &v3, 16, 1, 0);
}

- (BOOL)hasEnabledAudio
{
  return self->_hasEnabledAudio;
}

- (void)setHasEnabledAudio:(BOOL)a3
{
  self->_hasEnabledAudio = a3;
}

- (BOOL)hasEnabledVideo
{
  return self->_hasEnabledVideo;
}

- (void)setHasEnabledVideo:(BOOL)a3
{
  self->_hasEnabledVideo = a3;
}

- (BOOL)hasVideo
{
  return self->_hasVideo;
}

- (void)setHasVideo:(BOOL)a3
{
  self->_hasVideo = a3;
}

- (double)contentDurationWithinEndTimes
{
  return self->_contentDurationWithinEndTimes;
}

- (void)setContentDurationWithinEndTimes:(double)a3
{
  self->_contentDurationWithinEndTimes = a3;
}

- (NSArray)loadedTimeRanges
{
  return (NSArray *)objc_getProperty(self, a2, 120, 1);
}

- (void)setLoadedTimeRanges:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (AVValueTiming)timing
{
  return (AVValueTiming *)objc_getProperty(self, a2, 136, 1);
}

- (void)setTiming:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (NSArray)seekableTimeRanges
{
  return (NSArray *)objc_getProperty(self, a2, 144, 1);
}

- (void)setSeekableTimeRanges:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (NSArray)audioMediaSelectionOptions
{
  return (NSArray *)objc_getProperty(self, a2, 152, 1);
}

- (void)setAudioMediaSelectionOptions:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (NSArray)legibleMediaSelectionOptions
{
  return (NSArray *)objc_getProperty(self, a2, 160, 1);
}

- (void)setLegibleMediaSelectionOptions:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (BOOL)isPlayingOnSecondScreen
{
  return self->_playingOnSecondScreen;
}

- (void)setPlayingOnSecondScreen:(BOOL)a3
{
  self->_playingOnSecondScreen = a3;
}

- (BOOL)isExternalPlaybackActive
{
  return self->_externalPlaybackActive;
}

- (void)setExternalPlaybackActive:(BOOL)a3
{
  self->_externalPlaybackActive = a3;
}

- (int64_t)externalPlaybackType
{
  return self->_externalPlaybackType;
}

- (void)setExternalPlaybackType:(int64_t)a3
{
  self->_externalPlaybackType = a3;
}

- (NSString)externalPlaybackAirPlayDeviceLocalizedName
{
  return (NSString *)objc_getProperty(self, a2, 176, 1);
}

- (void)setExternalPlaybackAirPlayDeviceLocalizedName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (BOOL)allowsExternalPlayback
{
  return self->_allowsExternalPlayback;
}

- (void)setAllowsExternalPlayback:(BOOL)a3
{
  self->_allowsExternalPlayback = a3;
}

- (double)seekableTimeRangesLastModifiedTime
{
  return self->_seekableTimeRangesLastModifiedTime;
}

- (void)setSeekableTimeRangesLastModifiedTime:(double)a3
{
  self->_seekableTimeRangesLastModifiedTime = a3;
}

- (double)liveUpdateInterval
{
  return self->_liveUpdateInterval;
}

- (void)setLiveUpdateInterval:(double)a3
{
  self->_liveUpdateInterval = a3;
}

- (AVValueTiming)minTiming
{
  return self->_minTiming;
}

- (void)setMinTiming:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 200);
}

- (AVValueTiming)maxTiming
{
  return self->_maxTiming;
}

- (void)setMaxTiming:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 208);
}

- (void).cxx_destruct
{
  void *m_ptr;
  unsigned int *v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int *v7;
  unsigned int v8;
  unsigned int v9;

  m_ptr = self->_player.m_ptr;
  self->_player.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
  v4 = (unsigned int *)self->_playbackSessionInterface.m_impl.m_ptr;
  self->_playbackSessionInterface.m_impl.m_ptr = 0;
  if (v4)
  {
    do
    {
      v5 = __ldaxr(v4);
      v6 = v5 - 1;
    }
    while (__stlxr(v6, v4));
    if (!v6)
    {
      atomic_store(1u, v4);
      WTF::fastFree((WTF *)v4, (void *)a2);
    }
  }
  v7 = (unsigned int *)self->_delegate.m_impl.m_ptr;
  self->_delegate.m_impl.m_ptr = 0;
  if (v7)
  {
    do
    {
      v8 = __ldaxr(v7);
      v9 = v8 - 1;
    }
    while (__stlxr(v9, v7));
    if (!v9)
    {
      atomic_store(1u, v7);
      WTF::fastFree((WTF *)v7, (void *)a2);
    }
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 9) = 0;
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

@end
