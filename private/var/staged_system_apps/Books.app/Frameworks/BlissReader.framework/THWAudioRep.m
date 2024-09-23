@implementation THWAudioRep

- (THWAudioRep)initWithLayout:(id)a3 canvas:(id)a4
{
  THWAudioRep *v4;
  THWAudioRep *v5;
  THWAVMediaListener *v6;
  double v7;
  double v8;
  double v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)THWAudioRep;
  v4 = -[THWAudioRep initWithLayout:canvas:](&v11, "initWithLayout:canvas:", a3, a4);
  v5 = v4;
  if (v4)
  {
    if (-[THWAudioRep movieInfo](v4, "movieInfo"))
    {
      -[THWAudioRep setPVolumeLevel:](v5, "setPVolumeLevel:", 1.0);
      -[THWAudioRep setPMuted:](v5, "setPMuted:", 0);
      v6 = -[THWMovieLayout mediaListener](-[THWAudioRep movieLayout](v5, "movieLayout"), "mediaListener");
      objc_msgSend(-[THWAudioRep movieInfo](v5, "movieInfo"), "endTime");
      v8 = v7;
      objc_msgSend(-[THWAudioRep movieInfo](v5, "movieInfo"), "startTime");
      -[THWAVMediaListener durationChanged:](v6, "durationChanged:", v8 - v9);
    }
    else
    {

      return 0;
    }
  }
  return v5;
}

- (THWMovieLayout)movieLayout
{
  uint64_t v3;
  THWMovieLayout *result;

  v3 = objc_opt_class(THWMovieLayout);
  TSUDynamicCast(v3, -[THWAudioRep layout](self, "layout"));
  return result;
}

- (THWPressableRepGestureTargetHandler)pressableHandler
{
  if (!-[THWAudioRep createdPressableHandler](self, "createdPressableHandler"))
  {
    -[THWAudioRep setCreatedPressableHandler:](self, "setCreatedPressableHandler:", 1);
    if (-[THWAudioRep wantsPressAction](self, "wantsPressAction"))
      self->_pressableHandler = -[THWPressableRepGestureTargetHandler initWithPressableRep:pressHandler:]([THWPressableRepGestureTargetHandler alloc], "initWithPressableRep:pressHandler:", self, self);
  }
  return self->_pressableHandler;
}

- (id)movieInfo
{
  uint64_t v3;
  id result;

  v3 = objc_opt_class(TSDMovieInfo);
  TSUDynamicCast(v3, -[THWAudioRep info](self, "info"));
  return result;
}

- (void)p_cleanupPlayerAndController
{
  NSTimer *mPlaybackTimer;
  NSNotificationCenter *v4;

  mPlaybackTimer = self->mPlaybackTimer;
  if (mPlaybackTimer)
  {
    -[NSTimer invalidate](mPlaybackTimer, "invalidate");

    self->mPlaybackTimer = 0;
  }
  if (-[THWAudioRep observingRate](self, "observingRate"))
  {
    -[AVPlayer removeObserver:forKeyPath:](self->mPlayer, "removeObserver:forKeyPath:", self, CFSTR("rate"));
    -[THWAudioRep setObservingRate:](self, "setObservingRate:", 0);
  }
  v4 = +[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter");
  -[NSNotificationCenter removeObserver:name:object:](v4, "removeObserver:name:object:", self, TSKAVPlayerControllerDidPlayToEndNotification, self->mPlayerController);
  -[TSKAVPlayerController teardown](self->mPlayerController, "teardown");

  self->mPlayer = 0;
  self->mPlayerController = 0;
}

- (void)dealloc
{
  objc_super v3;

  -[THWAudioRep p_cleanupPlayerAndController](self, "p_cleanupPlayerAndController");

  v3.receiver = self;
  v3.super_class = (Class)THWAudioRep;
  -[THWAudioRep dealloc](&v3, "dealloc");
}

- (void)willBeRemoved
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWAudioRep;
  -[THWAudioRep willBeRemoved](&v3, "willBeRemoved");
  -[THWAudioRep stop](self, "stop");

  self->_pressableHandler = 0;
  -[NSNotificationCenter removeObserver:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "removeObserver:", self);
  +[NSObject cancelPreviousPerformRequestsWithTarget:](NSObject, "cancelPreviousPerformRequestsWithTarget:", self);
}

- (void)togglePlayPause
{
  -[THWAudioRep p_playPause:](self, "p_playPause:", self);
}

- (BOOL)containsPoint:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  double v6;
  CGPoint v11;

  y = a3.y;
  x = a3.x;
  if (objc_msgSend(-[THWAudioRep movieInfo](self, "movieInfo"), "posterImageData"))
  {
    -[THWAudioRep naturalBounds](self, "naturalBounds");
  }
  else
  {
    -[THWAudioRep naturalBounds](self, "naturalBounds");
    v6 = TSDCenterRectOverRect(CGPointZero.x);
  }
  v11.x = x;
  v11.y = y;
  return CGRectContainsPoint(*(CGRect *)&v6, v11);
}

- (void)viewScrollWillChange
{
  double v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THWAudioRep;
  -[THWAudioRep viewScrollWillChange](&v4, "viewScrollWillChange");
  -[THWAudioRep playbackRate](self, "playbackRate");
  if (v3 != 0.0)
    -[THWAudioRep stop](self, "stop");
}

- (void)drawInContext:(CGContext *)a3
{
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  id v13;
  const __CFString *v14;
  unsigned int v15;
  unsigned int v16;
  const __CFString *v17;
  const __CFString *v18;
  id v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  CGImage *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  CGFloat MidX;
  double MidY;
  double v38;
  CGPath *Mutable;
  CGRect v40;
  CGRect v41;
  CGRect v42;

  -[THWAudioRep naturalBounds](self, "naturalBounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v13 = -[THWAudioRep movieInfo](self, "movieInfo");
  if (!objc_msgSend(v13, "posterImageData") && objc_msgSend(v13, "controlStyle") != 1)
  {
    if (-[THWAudioRep isPlaying](self, "isPlaying"))
    {
      if (-[THWPressableRepGestureTargetHandler isPressableAtPoint](-[THWAudioRep pressableHandler](self, "pressableHandler"), "isPressableAtPoint"))
      {
        v14 = CFSTR("ib_media_btn_pause_bg_well-P");
      }
      else
      {
        v14 = CFSTR("ib_media_btn_pause_bg_well");
      }
    }
    else
    {
      v15 = -[THWAudioRep isPaused](self, "isPaused");
      v16 = -[THWPressableRepGestureTargetHandler isPressableAtPoint](-[THWAudioRep pressableHandler](self, "pressableHandler"), "isPressableAtPoint");
      v17 = CFSTR("ib_media_btn_audio-N");
      if (v16)
        v17 = CFSTR("ib_media_btn_audio-P");
      v18 = CFSTR("ib_media_btn_play_bg_well-P");
      if (!v16)
        v18 = CFSTR("ib_media_btn_play_bg_well");
      if (v15)
        v14 = v18;
      else
        v14 = v17;
    }
    v19 = +[TSUImage imageNamed:inBundle:](TSUImage, "imageNamed:inBundle:", v14, THBundle());
    v20 = TSDCenterRectOverRect(CGPointZero.x);
    v22 = v21;
    v24 = v23;
    v26 = v25;
    objc_msgSend(-[THWAudioRep canvas](self, "canvas"), "contentsScale");
    v27 = (CGImage *)objc_msgSend(v19, "CGImageForContentsScale:");
    v40.origin.x = v20;
    v40.origin.y = v22;
    v40.size.width = v24;
    v40.size.height = v26;
    CGContextDrawImage(a3, v40, v27);
    if (-[THWAudioRep isPlaying](self, "isPlaying") || -[THWAudioRep isPaused](self, "isPaused"))
    {
      objc_msgSend(v13, "endTime");
      v29 = v28;
      objc_msgSend(v13, "startTime");
      v31 = v29 - v30;
      -[THWAudioRep currentTime](self, "currentTime");
      v33 = v32;
      objc_msgSend(v13, "startTime");
      v35 = fmax((v33 - v34) / v31, 0.01);
      if (fabs(v35) >= 0.00999999978)
      {
        v41.origin.x = v6;
        v41.origin.y = v8;
        v41.size.width = v10;
        v41.size.height = v12;
        MidX = CGRectGetMidX(v41);
        v42.origin.x = v6;
        v42.origin.y = v8;
        v42.size.width = v10;
        v42.size.height = v12;
        MidY = CGRectGetMidY(v42);
        if (-[THWPressableRepGestureTargetHandler isPressed](-[THWAudioRep pressableHandler](self, "pressableHandler"), "isPressed"))
        {
          v38 = 0.5;
        }
        else
        {
          v38 = 1.0;
        }
        CGContextSetStrokeColorWithColor(a3, (CGColorRef)-[TSUColor CGColor](+[TSUColor colorWithRed:green:blue:alpha:](TSUColor, "colorWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, v38), "CGColor"));
        CGContextSetLineWidth(a3, 7.0);
        Mutable = CGPathCreateMutable();
        CGPathMoveToPoint(Mutable, 0, MidX, MidY + -17.82);
        CGPathAddArc(Mutable, 0, MidX, MidY, 17.82, -1.57079633, v35 * 3.14159265 * 2.0 + -1.57079633, 0);
        CGContextAddPath(a3, Mutable);
        CGContextStrokePath(a3);
        CFRelease(Mutable);
      }
    }
  }
}

- (double)playbackRate
{
  AVPlayer *mPlayer;
  float v3;

  mPlayer = self->mPlayer;
  if (!mPlayer)
    return 0.0;
  -[AVPlayer rate](mPlayer, "rate");
  return v3;
}

- (void)p_playPause:(id)a3
{
  if (-[THWAudioRep isPlaying](self, "isPlaying", a3))
    -[THWAudioRep pause](self, "pause");
  else
    -[THWAudioRep play](self, "play");
}

- (BOOL)isPlaying
{
  return self->mIsPlaying;
}

- (double)volumeLevel
{
  double result;

  -[THWAudioRep pVolumeLevel](self, "pVolumeLevel");
  return result;
}

- (BOOL)isMuted
{
  return -[THWAudioRep pMuted](self, "pMuted");
}

- (void)p_setPlaying:(BOOL)a3
{
  NSNotificationCenter *v4;
  NSNotificationCenter *v5;
  double v6;
  double v7;
  NSTimer *mPlaybackTimer;
  THWAVMediaListener *v9;

  if (self->mIsPlaying != a3)
  {
    self->mIsPlaying = a3;
    v4 = +[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter");
    v5 = v4;
    if (self->mIsPlaying)
    {
      objc_msgSend(+[TSKMoviePlaybackRegistry sharedMoviePlaybackRegistry](TSKMoviePlaybackRegistry, "sharedMoviePlaybackRegistry"), "objectWillBeginMoviePlayback:", self);
      -[NSNotificationCenter addObserver:selector:name:object:](v5, "addObserver:selector:name:object:", self, "p_playerDidPlayToEnd:", TSKAVPlayerControllerDidPlayToEndNotification, self->mPlayerController);
      if (-[THWAudioRep observingRate](self, "observingRate"))
        -[AVPlayer removeObserver:forKeyPath:](self->mPlayer, "removeObserver:forKeyPath:", self, CFSTR("rate"));
      -[THWAudioRep setObservingRate:](self, "setObservingRate:", 1);
      -[AVPlayer addObserver:forKeyPath:options:context:](self->mPlayer, "addObserver:forKeyPath:options:context:", self, CFSTR("rate"), 0, off_53F050);
      self->mPlaybackTimer = +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "timerDidTriggerTimeChangedUpdate", 0, 1, 0.0333333333);
      -[NSNotificationCenter addObserver:selector:name:object:](v5, "addObserver:selector:name:object:", self, "stop", UIApplicationDidEnterBackgroundNotification, 0);
      LODWORD(v6) = 1.0;
      -[AVPlayer setRate:](self->mPlayer, "setRate:", v6);
    }
    else
    {
      -[NSNotificationCenter removeObserver:name:object:](v4, "removeObserver:name:object:", self, TSKAVPlayerControllerDidPlayToEndNotification, self->mPlayerController);
      -[NSNotificationCenter removeObserver:name:object:](v5, "removeObserver:name:object:", self, UIApplicationDidEnterBackgroundNotification, 0);
      if (-[THWAudioRep observingRate](self, "observingRate"))
      {
        -[AVPlayer removeObserver:forKeyPath:](self->mPlayer, "removeObserver:forKeyPath:", self, CFSTR("rate"));
        -[THWAudioRep setObservingRate:](self, "setObservingRate:", 0);
      }
      mPlaybackTimer = self->mPlaybackTimer;
      if (mPlaybackTimer)
      {
        -[NSTimer invalidate](mPlaybackTimer, "invalidate");

        self->mPlaybackTimer = 0;
      }
      LODWORD(v7) = 0;
      -[AVPlayer setRate:](self->mPlayer, "setRate:", v7);
      objc_msgSend(+[TSKMoviePlaybackRegistry sharedMoviePlaybackRegistry](TSKMoviePlaybackRegistry, "sharedMoviePlaybackRegistry"), "objectDidEndMoviePlayback:", self);
    }
    -[THWAudioRep setNeedsDisplay](self, "setNeedsDisplay");
    v9 = -[THWMovieLayout mediaListener](-[THWAudioRep movieLayout](self, "movieLayout"), "mediaListener");
    -[THWAudioRep playbackRate](self, "playbackRate");
    -[THWAVMediaListener rateChanged:](v9, "rateChanged:");
  }
}

- (void)timerDidTriggerTimeChangedUpdate
{
  id v3;
  double v4;
  double v5;
  double v6;
  AVPlayer *mPlayer;
  AVPlayer *v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v3 = -[THWAudioRep ignoreTimeChangeUpdate](self, "ignoreTimeChangeUpdate");
  if (v4 <= 0.0)
  {
    mPlayer = self->mPlayer;
    if (mPlayer)
    {
      -[AVPlayer currentTime](mPlayer, "currentTime");
      v8 = self->mPlayer;
      v9 = (double)v14;
      if (v8)
      {
        -[AVPlayer currentTime](v8, "currentTime");
        v10 = (double)(int)v12;
LABEL_9:
        -[THWAudioRep timeChanged:](self, "timeChanged:", v9 / v10, v11, v12, v13, v14, v15, v16);
        return;
      }
    }
    else
    {
      v14 = 0;
      v15 = 0;
      v9 = 0.0;
      v16 = 0;
    }
    v11 = 0;
    v12 = 0;
    v10 = 0.0;
    v13 = 0;
    goto LABEL_9;
  }
  v5 = SFUGetMicroseconds(v3);
  -[THWAudioRep ignoreTimeChangeUpdate](self, "ignoreTimeChangeUpdate");
  if (v5 > v6)
    -[THWAudioRep setIgnoreTimeChangeUpdate:](self, "setIgnoreTimeChangeUpdate:", 0.0);
}

- (void)timeChanged:(double)a3
{
  id v4;

  -[THWAVMediaListener timeChanged:](-[THWMovieLayout mediaListener](-[THWAudioRep movieLayout](self, "movieLayout"), "mediaListener"), "timeChanged:", a3);
  v4 = -[THWAudioRep movieInfo](self, "movieInfo");
  if (-[THWAudioRep isPlaying](self, "isPlaying")
    && !objc_msgSend(v4, "posterImageData")
    && objc_msgSend(v4, "controlStyle") != 1)
  {
    -[THWAudioRep setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)p_play
{
  id v3;
  AVPlayerItem *v4;
  id v5;
  Float64 v6;
  double v7;
  Float64 v8;
  Float64 v9;
  Float64 v10;
  CMTime v11;
  CMTime v12;
  CMTime rhs;
  CMTime lhs;
  CMTime time;
  CMTime v16;
  CMTime v17;

  -[THWAudioRep setIsPaused:](self, "setIsPaused:", 0);
  v3 = -[THWAudioRep movieInfo](self, "movieInfo");
  -[THWAudioRep stop](self, "stop");
  v4 = +[AVPlayerItem playerItemWithAsset:](AVPlayerItem, "playerItemWithAsset:", objc_msgSend(v3, "makeAVAsset"));
  v5 = objc_msgSend(-[THWAudioRep movieInfo](self, "movieInfo"), "drmContext");
  if (v5 && (objc_msgSend(v5, "authorizeAVPlayerItemForPlayback:", v4) & 1) == 0)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWAudioRep p_play]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Movie/THWAudioRep.m"), 456, CFSTR("failed to authorize audio for playback"));
  -[THWAudioRep p_cleanupPlayerAndController](self, "p_cleanupPlayerAndController");
  memset(&v17, 0, sizeof(v17));
  objc_msgSend(v3, "startTime");
  CMTimeMakeWithSeconds(&v17, v6, 100);
  v16 = v17;
  -[AVPlayerItem setReversePlaybackEndTime:](v4, "setReversePlaybackEndTime:", &v16);
  objc_msgSend(v3, "endTime");
  if (v7 != 0.0)
  {
    memset(&v16, 0, sizeof(v16));
    objc_msgSend(v3, "endTime");
    CMTimeMakeWithSeconds(&v16, v8, 100);
    time = v16;
    -[AVPlayerItem setForwardPlaybackEndTime:](v4, "setForwardPlaybackEndTime:", &time);
  }
  memset(&v16, 0, sizeof(v16));
  if (v4)
    -[AVPlayerItem duration](v4, "duration");
  else
    memset(&lhs, 0, sizeof(lhs));
  -[THWAudioRep timeToBeginPlaybackAt](self, "timeToBeginPlaybackAt");
  CMTimeMakeWithSeconds(&rhs, v9, 100);
  CMTimeSubtract(&v16, &lhs, &rhs);
  time = v16;
  if (CMTimeGetSeconds(&time) < 0.2)
    -[THWAudioRep setTimeToBeginPlaybackAt:](self, "setTimeToBeginPlaybackAt:", 0.0);
  -[THWAudioRep timeToBeginPlaybackAt](self, "timeToBeginPlaybackAt");
  CMTimeMakeWithSeconds(&v12, v10, 100);
  time = kCMTimeZero;
  v11 = time;
  -[AVPlayerItem seekToTime:toleranceBefore:toleranceAfter:completionHandler:](v4, "seekToTime:toleranceBefore:toleranceAfter:completionHandler:", &v12, &time, &v11, 0);
  self->mPlayer = (AVPlayer *)objc_msgSend(objc_alloc((Class)AVPlayer), "initWithPlayerItem:", v4);
  if (!self->mPlayerController)
  {
    self->mPlayerController = (TSKAVPlayerController *)objc_msgSend(objc_alloc((Class)TSKAVPlayerController), "initWithPlayer:delegate:", self->mPlayer, self);
    -[TSKAVPlayerController setRepeatMode:](self->mPlayerController, "setRepeatMode:", TSKPlayerRepeatModeForMovieLoopOption(objc_msgSend(v3, "loopOption")));
  }
  -[THWAudioRep p_setPlaying:](self, "p_setPlaying:", 1);
  -[THWAudioRep setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)p_stop
{
  if (self->mPlayer)
  {
    -[THWAudioRep currentTime](self, "currentTime");
    -[THWAudioRep setTimeToBeginPlaybackAt:](self, "setTimeToBeginPlaybackAt:");
    -[THWAudioRep p_setPlaying:](self, "p_setPlaying:", 0);
    -[THWAudioRep p_cleanupPlayerAndController](self, "p_cleanupPlayerAndController");
    -[THWAudioRep timeToBeginPlaybackAt](self, "timeToBeginPlaybackAt");
    -[THWAudioRep timeChanged:](self, "timeChanged:");
    -[THWAudioRep setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)play
{
  uint64_t v3;
  double v4;
  uint64_t v5;

  -[THWAudioRep p_play](self, "p_play");
  v3 = objc_opt_class(THWAVTransportController);
  *(_QWORD *)&v4 = TSUDynamicCast(v3, -[THWMovieLayout mediaListener](-[THWAudioRep movieLayout](self, "movieLayout"), "mediaListener")).n128_u64[0];
  objc_msgSend(+[THWAVController sharedController](THWAVController, "sharedController", v4), "transportControllerDidStartPlaying:", v5);
}

- (void)pause
{
  uint64_t v3;
  double v4;
  uint64_t v5;

  if (self->mPlayer)
  {
    -[THWAudioRep p_stop](self, "p_stop");
    -[THWAudioRep setIsPaused:](self, "setIsPaused:", 1);
    v3 = objc_opt_class(THWAVTransportController);
    *(_QWORD *)&v4 = TSUDynamicCast(v3, -[THWMovieLayout mediaListener](-[THWAudioRep movieLayout](self, "movieLayout"), "mediaListener")).n128_u64[0];
    objc_msgSend(+[THWAVController sharedController](THWAVController, "sharedController", v4), "transportControllerDidPausePlaying:", v5);
  }
}

- (void)stop
{
  _QWORD v2[5];
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_145984;
  v3[3] = &unk_426DD0;
  v3[4] = self;
  if (+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    sub_145984((uint64_t)v3);
  }
  else
  {
    v2[0] = _NSConcreteStackBlock;
    v2[1] = 3221225472;
    v2[2] = sub_1459E4;
    v2[3] = &unk_427830;
    v2[4] = v3;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);
  }
}

- (void)changeCurrentTimeTo:(double)a3
{
  AVPlayer *mPlayer;
  __int128 v6;
  CMTimeEpoch v7;
  __int128 v8;
  CMTimeEpoch epoch;
  _QWORD v10[5];
  CMTime v11;

  if (self->mPlayer)
    -[THWAudioRep setIgnoreTimeChangeUpdate:](self, "setIgnoreTimeChangeUpdate:", SFUGetMicroseconds(self) + 100000.0);
  if (!-[THWAudioRep seeking](self, "seeking"))
  {
    -[THWAudioRep setSeeking:](self, "setSeeking:", 1);
    mPlayer = self->mPlayer;
    CMTimeMakeWithSeconds(&v11, a3, 100);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_145AF8;
    v10[3] = &unk_427130;
    v10[4] = self;
    v8 = *(_OWORD *)&kCMTimeZero.value;
    epoch = kCMTimeZero.epoch;
    v6 = v8;
    v7 = epoch;
    -[AVPlayer seekToTime:toleranceBefore:toleranceAfter:completionHandler:](mPlayer, "seekToTime:toleranceBefore:toleranceAfter:completionHandler:", &v11, &v8, &v6, v10);
  }
  if (!self->mPlayer)
    -[THWAudioRep setTimeToBeginPlaybackAt:](self, "setTimeToBeginPlaybackAt:", a3);
}

- (double)currentTime
{
  double result;
  AVPlayer *mPlayer;
  CMTime time;

  -[THWAudioRep timeToBeginPlaybackAt](self, "timeToBeginPlaybackAt");
  mPlayer = self->mPlayer;
  if (mPlayer)
  {
    -[AVPlayer currentTime](mPlayer, "currentTime");
    return CMTimeGetSeconds(&time);
  }
  return result;
}

- (void)p_playerDidPlayToEnd:(id)a3
{
  if (-[THWAudioRep isPlaying](self, "isPlaying", a3))
  {
    if (!objc_msgSend(-[THWAudioRep movieInfo](self, "movieInfo"), "loopOption"))
      -[THWAudioRep stop](self, "stop");
    objc_msgSend(-[THWAudioRep movieInfo](self, "movieInfo"), "startTime");
    -[THWAudioRep setTimeToBeginPlaybackAt:](self, "setTimeToBeginPlaybackAt:");
    -[THWAVMediaListener mediaDidPlayToEnd](-[THWMovieLayout mediaListener](-[THWAudioRep movieLayout](self, "movieLayout"), "mediaListener"), "mediaDidPlayToEnd");
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  float v7;
  __CFRunLoop *Main;
  objc_super v9;
  _QWORD block[5];

  if (off_53F050 == a6)
  {
    if (-[THWAudioRep isPlaying](self, "isPlaying", a3, a4, a5))
    {
      -[AVPlayer rate](self->mPlayer, "rate");
      if (v7 == 0.0)
      {
        Main = CFRunLoopGetMain();
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_145C80;
        block[3] = &unk_426DD0;
        block[4] = self;
        CFRunLoopPerformBlock(Main, kCFRunLoopCommonModes, block);
        CFRunLoopWakeUp(Main);
      }
    }
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)THWAudioRep;
    -[THWAudioRep observeValueForKeyPath:ofObject:change:context:](&v9, "observeValueForKeyPath:ofObject:change:context:", a3, a4, a5);
  }
}

- (void)pressableRepWasPressed:(id)a3 atPoint:(CGPoint)a4
{
  double v5;
  double v6;

  if (objc_msgSend(-[THWAudioRep movieInfo](self, "movieInfo", a3, a4.x, a4.y), "posterImageData"))
  {
    objc_msgSend(-[THWAudioRep movieInfo](self, "movieInfo"), "startTime");
    v6 = v5;
    if (-[THWAudioRep isPlaying](self, "isPlaying")
      && !objc_msgSend(-[THWAudioRep movieInfo](self, "movieInfo"), "loopOption"))
    {
      -[THWAudioRep changeCurrentTimeTo:](self, "changeCurrentTimeTo:", v6);
    }
    else if (-[THWAudioRep isPlaying](self, "isPlaying"))
    {
      -[THWAudioRep pause](self, "pause");
    }
    else
    {
      -[THWAudioRep changeCurrentTimeTo:](self, "changeCurrentTimeTo:", v6);
      -[THWAVMediaListener playMovie](-[THWMovieLayout mediaListener](-[THWAudioRep movieLayout](self, "movieLayout"), "mediaListener"), "playMovie");
    }
  }
  else
  {
    -[THWAVMediaListener mediaWasPressed](-[THWMovieLayout mediaListener](-[THWAudioRep movieLayout](self, "movieLayout"), "mediaListener"), "mediaWasPressed");
  }
}

- (CALayer)pressableAnimationLayer
{
  return (CALayer *)objc_msgSend(-[THWAudioRep interactiveCanvasController](self, "interactiveCanvasController"), "layerForRep:", self);
}

- (CALayer)pressableAnimationShadowLayer
{
  return 0;
}

- (BOOL)wantsPressAnimation
{
  return 1;
}

- (BOOL)wantsPressAction
{
  return 1;
}

- (BOOL)shouldRecognizePressOnRep:(id)a3
{
  return a3 == self;
}

- (BOOL)canExpand
{
  return 0;
}

- (BOOL)canHandleGesture:(id)a3
{
  return -[THWPressableRepGestureTargetHandler canHandleGesture:](-[THWAudioRep pressableHandler](self, "pressableHandler"), "canHandleGesture:", a3);
}

- (BOOL)handleGesture:(id)a3
{
  BOOL v4;

  v4 = -[THWPressableRepGestureTargetHandler handleGesture:](-[THWAudioRep pressableHandler](self, "pressableHandler"), "handleGesture:", a3);
  -[THWAudioRep setNeedsDisplay](self, "setNeedsDisplay");
  return v4;
}

- (TSDContainerInfo)containerInfo
{
  return 0;
}

- (BOOL)canSelectChildRep:(id)a3
{
  return 0;
}

- (void)setChildReps:(id)a3
{
  NSArray *childReps;
  NSArray *v6;

  childReps = self->_childReps;
  if (childReps != a3)
  {
    -[NSArray makeObjectsPerformSelector:withObject:](childReps, "makeObjectsPerformSelector:withObject:", "setParentRep:", 0);

    v6 = (NSArray *)a3;
    self->_childReps = v6;
    -[NSArray makeObjectsPerformSelector:withObject:](v6, "makeObjectsPerformSelector:withObject:", "setParentRep:", self);
  }
}

- (void)updateChildrenFromLayout
{
  -[THWAudioRep setChildReps:](self, "setChildReps:", +[TSDContainerRep childrenFromLayoutInContainerRep:](TSDContainerRep, "childrenFromLayoutInContainerRep:", self));
}

- (id)hitRep:(CGPoint)a3 withGesture:(id)a4 passingTest:(id)a5
{
  return +[TSDContainerRep containerRep:hitRep:withGesture:passingTest:](TSDContainerRep, "containerRep:hitRep:withGesture:passingTest:", self, a4, a5, a3.x, a3.y);
}

- (void)control:(id)a3 repWasAdded:(id)a4
{
  id v6;

  v6 = -[THWAudioRep layout](self, "layout");
  if (v6)
    objc_msgSend(objc_msgSend(v6, "mediaListener"), "control:repWasAdded:", a3, a4);
}

- (void)control:(id)a3 repWillBeRemoved:(id)a4
{
  id v6;

  v6 = -[THWAudioRep layout](self, "layout");
  if (v6)
    objc_msgSend(objc_msgSend(v6, "mediaListener"), "control:repWillBeRemoved:", a3, a4);
}

- (THWAutoplayConfig)autoplayConfig
{
  THWAutoplayConfig *result;

  result = (THWAutoplayConfig *)TSUProtocolCast(&OBJC_PROTOCOL___THWAutoplayableMedia, -[THWAudioRep info](self, "info"));
  if (result)
    return (THWAutoplayConfig *)-[THWAutoplayConfig autoplayConfig](result, "autoplayConfig");
  return result;
}

- (BOOL)autoplayAllowed
{
  return 1;
}

- (void)autoplayStart
{
  uint64_t v3;
  double v4;
  uint64_t v5;

  if (!-[THWAudioRep isPlaying](self, "isPlaying"))
  {
    -[THWAudioRep changeCurrentTimeTo:](self, "changeCurrentTimeTo:", 0.0);
    -[THWAudioRep p_play](self, "p_play");
    v3 = objc_opt_class(THWAVTransportController);
    *(_QWORD *)&v4 = TSUDynamicCast(v3, -[THWMovieLayout mediaListener](-[THWAudioRep movieLayout](self, "movieLayout"), "mediaListener")).n128_u64[0];
    objc_msgSend(+[THWAVController sharedController](THWAVController, "sharedController", v4), "transportControllerDidStartAutoplaying:", v5);
  }
}

- (void)autoplayStop
{
  _QWORD v2[5];
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_14611C;
  v3[3] = &unk_426DD0;
  v3[4] = self;
  if (+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    sub_14611C((uint64_t)v3);
  }
  else
  {
    v2[0] = _NSConcreteStackBlock;
    v2[1] = 3221225472;
    v2[2] = sub_1461A0;
    v2[3] = &unk_427830;
    v2[4] = v3;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);
  }
}

- (void)autoplayPause
{
  if (-[THWAudioRep isPlaying](self, "isPlaying"))
    -[THWAudioRep pause](self, "pause");
}

- (BOOL)handlingPress
{
  return self->_handlingPress;
}

- (void)setHandlingPress:(BOOL)a3
{
  self->_handlingPress = a3;
}

- (void)setPressableHandler:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 304);
}

- (BOOL)createdPressableHandler
{
  return self->_createdPressableHandler;
}

- (void)setCreatedPressableHandler:(BOOL)a3
{
  self->_createdPressableHandler = a3;
}

- (double)timeToBeginPlaybackAt
{
  return self->_timeToBeginPlaybackAt;
}

- (void)setTimeToBeginPlaybackAt:(double)a3
{
  self->_timeToBeginPlaybackAt = a3;
}

- (NSArray)childReps
{
  return self->_childReps;
}

- (double)pVolumeLevel
{
  return self->_pVolumeLevel;
}

- (void)setPVolumeLevel:(double)a3
{
  self->_pVolumeLevel = a3;
}

- (BOOL)pMuted
{
  return self->_pMuted;
}

- (void)setPMuted:(BOOL)a3
{
  self->_pMuted = a3;
}

- (BOOL)observingRate
{
  return self->_observingRate;
}

- (void)setObservingRate:(BOOL)a3
{
  self->_observingRate = a3;
}

- (BOOL)isPaused
{
  return self->_isPaused;
}

- (void)setIsPaused:(BOOL)a3
{
  self->_isPaused = a3;
}

- (double)ignoreTimeChangeUpdate
{
  return self->_ignoreTimeChangeUpdate;
}

- (void)setIgnoreTimeChangeUpdate:(double)a3
{
  self->_ignoreTimeChangeUpdate = a3;
}

- (BOOL)seeking
{
  return self->_seeking;
}

- (void)setSeeking:(BOOL)a3
{
  self->_seeking = a3;
}

@end
