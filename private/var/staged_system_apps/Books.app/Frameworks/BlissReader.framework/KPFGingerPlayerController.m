@implementation KPFGingerPlayerController

- (KPFGingerPlayerController)initWithKPFDocument:(id)a3 showLayer:(id)a4
{
  KPFGingerPlayerController *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)KPFGingerPlayerController;
  v6 = -[KPFGingerPlayerController init](&v8, "init");
  if (v6)
    v6->mSession = -[KPFSession initWithKPFDocument:showLayer:]([KPFSession alloc], "initWithKPFDocument:showLayer:", a3, a4);
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)KPFGingerPlayerController;
  -[KPFGingerPlayerController dealloc](&v3, "dealloc");
}

- (BOOL)isAnimating
{
  return -[KPFSession playbackState](self->mSession, "playbackState") == 1
      && -[KPFSession playbackState](self->mSession, "playbackState") == 6;
}

- (void)playPreparedShow
{
  if (-[KPFSession showLayer](self->mSession, "showLayer")
    && -[KPFSession playbackState](self->mSession, "playbackState") == 2)
  {
    -[KPFSession setupAndPlaySoundtrackAfterDelay:](self->mSession, "setupAndPlaySoundtrackAfterDelay:", 0.0);
    if (-[KPFGingerEvent isAutomatic](-[KPFGingerSlide currentEvent](-[KPFSession currentSlide](self->mSession, "currentSlide"), "currentEvent"), "isAutomatic"))
    {
      -[KPFGingerPlayerController p_triggerEvent](self, "p_triggerEvent");
    }
    -[KPFSession setPlaybackState:](self->mSession, "setPlaybackState:", 3);
  }
}

- (BOOL)isPlaying
{
  return -[KPFSession playbackState](self->mSession, "playbackState") == 3;
}

- (BOOL)isBackgroundSoundPlaying
{
  return -[KPFSession hasBackgroundSoundtrack](self->mSession, "hasBackgroundSoundtrack");
}

- (void)prepareWithEndShowHandler:(id)a3
{
  if (-[KPFSession showLayer](self->mSession, "showLayer", a3))
  {
    if (-[KPFSession playbackState](self->mSession, "playbackState") == 1)
    {
      -[CALayer setSublayers:](-[KPFSession showLayer](self->mSession, "showLayer"), "setSublayers:", 0);
      -[KPFGingerSlide renderSlideWithSession:](-[KPFSession currentSlide](self->mSession, "currentSlide"), "renderSlideWithSession:", self->mSession);
      -[KPFSession setPlaybackState:](self->mSession, "setPlaybackState:", 2);
    }
  }
}

- (void)endshow
{
  -[KPFSession setPlaybackState:](self->mSession, "setPlaybackState:", 6);
  -[KPFSession stopAllAnimations](self->mSession, "stopAllAnimations");
  -[KPFSession setPlaybackState:](self->mSession, "setPlaybackState:", 1);
}

- (void)tearDownShow
{
  if (-[KPFSession playbackState](self->mSession, "playbackState") == 1)
    -[CALayer setSublayers:](-[KPFSession showLayer](self->mSession, "showLayer"), "setSublayers:", 0);
}

- (BOOL)isTransitioningToStop
{
  unsigned int v3;

  v3 = -[KPFSession playbackState](self->mSession, "playbackState");
  if (v3 != 1)
    LOBYTE(v3) = -[KPFSession playbackState](self->mSession, "playbackState") == 6;
  return v3;
}

- (void)p_handleURL:(id)a3
{
  -[KPFPlayerControllerDelegateProtocol kpfPlayer:handleURL:](-[KPFGingerPlayerController kpfPlayerControllerDelegate](self, "kpfPlayerControllerDelegate"), "kpfPlayer:handleURL:", self, +[NSURL URLWithString:](NSURL, "URLWithString:", a3));
}

- (void)retreatToPreviousSlide
{
  -[KPFGingerPlayerController gotoSlideAtIndex:shouldAutoPlay:](self, "gotoSlideAtIndex:shouldAutoPlay:", -[KPFSession previousSlideIndex](self->mSession, "previousSlideIndex"), 1);
}

- (BOOL)handleTouchAtLocation:(CGPoint)a3
{
  double y;
  double x;
  id v6;
  void *v7;
  id v8;
  KPFGingerEvent *v9;
  _QWORD v11[5];

  y = a3.y;
  x = a3.x;
  if (-[KPFSession playbackState](self->mSession, "playbackState") == 3
    || -[KPFSession playbackState](self->mSession, "playbackState") == 2)
  {
    v6 = -[KPFGingerEvent hyperlinkAtLocation:](-[KPFGingerSlide currentEvent](-[KPFSession currentSlide](self->mSession, "currentSlide"), "currentEvent"), "hyperlinkAtLocation:", x, y);
    v7 = v6;
    if (v6)
    {
      if (objc_msgSend(v6, "hasPrefix:", CFSTR("?slideid=")))
      {
        v8 = objc_msgSend(v7, "substringFromIndex:", 9);
        self->mHyperlinkSlideTag = (NSString *)v8;
        -[KPFGingerSlide renderHyperLinkedSlideWithSlideTag:withSession:](-[KPFSession currentSlide](self->mSession, "currentSlide"), "renderHyperLinkedSlideWithSlideTag:withSession:", v8, self->mSession);
        v9 = -[KPFGingerSlide hyperLinkedEvent](-[KPFSession currentSlide](self->mSession, "currentSlide"), "hyperLinkedEvent");
        v11[0] = _NSConcreteStackBlock;
        v11[1] = 3221225472;
        v11[2] = sub_913B8;
        v11[3] = &unk_426DD0;
        v11[4] = self;
        -[KPFGingerEvent setAnimationEndHandler:](v9, "setAnimationEndHandler:", v11);
        -[KPFGingerEvent animateWithSession:](-[KPFGingerSlide hyperLinkedEvent](-[KPFSession currentSlide](self->mSession, "currentSlide"), "hyperLinkedEvent"), "animateWithSession:", self->mSession);
        goto LABEL_19;
      }
      if (!objc_msgSend(v7, "isEqualToString:", CFSTR("?action=exitpresentation")))
      {
        if (!objc_msgSend(v7, "isEqualToString:", CFSTR("?action=retreat")))
        {
          if (objc_msgSend(v7, "isEqualToString:", CFSTR("?slide=first")))
          {
            -[KPFGingerPlayerController gotoFirstSlide](self, "gotoFirstSlide");
            goto LABEL_19;
          }
          if (objc_msgSend(v7, "isEqualToString:", CFSTR("?slide=last")))
          {
            -[KPFGingerPlayerController gotoLastSlide](self, "gotoLastSlide");
            goto LABEL_19;
          }
          if (objc_msgSend(v7, "isEqualToString:", CFSTR("?slide=next")))
          {
            -[KPFGingerPlayerController gotoNextSlide](self, "gotoNextSlide");
            goto LABEL_19;
          }
          if (!objc_msgSend(v7, "isEqualToString:", CFSTR("?slide=previous")))
          {
            -[KPFGingerPlayerController p_handleURL:](self, "p_handleURL:", v7);
            goto LABEL_19;
          }
        }
        -[KPFGingerPlayerController retreatToPreviousSlide](self, "retreatToPreviousSlide");
LABEL_19:
        LOBYTE(v7) = 1;
        return (char)v7;
      }
      LOBYTE(v7) = 1;
      -[KPFGingerPlayerController p_resetToFirstSlideAndShouldAutoPlay:](self, "p_resetToFirstSlideAndShouldAutoPlay:", 1);
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }
  return (char)v7;
}

- (void)pauseMediaPlayback
{
  -[KPFSession pauseMediaPlayback](self->mSession, "pauseMediaPlayback");
}

- (void)resumeMediaPlayback
{
  -[KPFSession resumeMediaPlayback](self->mSession, "resumeMediaPlayback");
}

- (void)pauseBackgroundSoundtrack
{
  -[KPFSession pauseBackgroundSoundtrack](self->mSession, "pauseBackgroundSoundtrack");
}

- (void)resumeBackgroundSoundtrack
{
  -[KPFSession resumeBackgroundSoundtrack](self->mSession, "resumeBackgroundSoundtrack");
}

- (id)accessibilityLabelForCurrentEvent
{
  id v3;

  v3 = +[NSMutableArray array](NSMutableArray, "array");
  objc_msgSend(v3, "addObject:", +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("Slide %1$lu of %2$lu"), &stru_43D7D8, 0), (char *)-[KPFSession currentSlideIndex](self->mSession, "currentSlideIndex") + 1, -[NSMutableArray count](-[KPFSession KPFSlideList](self->mSession, "KPFSlideList"), "count")));
  if (-[KPFGingerSlide eventCount](-[KPFSession currentSlide](self->mSession, "currentSlide"), "eventCount") >= 2)
    objc_msgSend(v3, "addObject:", +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("Build %1$lu of %2$lu"), &stru_43D7D8, 0), (char *)-[KPFGingerSlide curentEventIndex](-[KPFSession currentSlide](self->mSession, "currentSlide"), "curentEventIndex")+ 1, -[KPFGingerSlide eventCount](-[KPFSession currentSlide](self->mSession, "currentSlide"), "eventCount")));
  return objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
}

- (id)accessibilityRegionsForCurrentEvent
{
  return -[KPFGingerEvent accessibilityArray](-[KPFGingerSlide currentEvent](-[KPFSession currentSlide](self->mSession, "currentSlide"), "currentEvent"), "accessibilityArray");
}

- (void)gotoPreviousEvent
{
  if (-[KPFGingerSlide decrementCurrentEventIndex](-[KPFSession currentSlide](self->mSession, "currentSlide"), "decrementCurrentEventIndex"))
  {
    self->mQueuedTrigger = 0;
    -[KPFGingerSlide renderCurrentEventWithSession:](-[KPFSession currentSlide](self->mSession, "currentSlide"), "renderCurrentEventWithSession:", self->mSession);
    -[KPFSession setPlaybackState:](self->mSession, "setPlaybackState:", 3);
    if (-[KPFGingerEvent isAutomatic](-[KPFGingerSlide currentEvent](-[KPFSession currentSlide](self->mSession, "currentSlide"), "currentEvent"), "isAutomatic"))
    {
      -[KPFGingerPlayerController p_triggerEvent](self, "p_triggerEvent");
    }
  }
  else
  {
    -[KPFGingerPlayerController gotoPreviousSlide](self, "gotoPreviousSlide");
  }
}

- (void)gotoSlideAtIndex:(unint64_t)a3 shouldAutoPlay:(BOOL)a4
{
  _BOOL4 v4;
  BOOL v6;

  v4 = a4;
  -[KPFSession setSlideIndex:](self->mSession, "setSlideIndex:", a3);
  -[KPFGingerSlide renderSlideWithSession:](-[KPFSession currentSlide](self->mSession, "currentSlide"), "renderSlideWithSession:", self->mSession);
  -[KPFSession setPlaybackState:](self->mSession, "setPlaybackState:", 3);
  self->mQueuedTrigger = 0;
  if (-[KPFGingerEvent isAutomatic](-[KPFGingerSlide currentEvent](-[KPFSession currentSlide](self->mSession, "currentSlide"), "currentEvent"), "isAutomatic"))
  {
    v6 = !v4;
  }
  else
  {
    v6 = 1;
  }
  if (!v6)
    -[KPFGingerPlayerController p_triggerEvent](self, "p_triggerEvent");
}

- (void)p_goToSlideWithSlideTag:(id)a3
{
  -[KPFSession setSlideWithSlideTag:](self->mSession, "setSlideWithSlideTag:", a3);
  -[KPFGingerSlide renderSlideWithSession:](-[KPFSession currentSlide](self->mSession, "currentSlide"), "renderSlideWithSession:", self->mSession);
  -[KPFSession setPlaybackState:](self->mSession, "setPlaybackState:", 3);
  self->mQueuedTrigger = 0;
  if (-[KPFGingerEvent isAutomatic](-[KPFGingerSlide currentEvent](-[KPFSession currentSlide](self->mSession, "currentSlide"), "currentEvent"), "isAutomatic"))
  {
    -[KPFGingerPlayerController p_triggerEvent](self, "p_triggerEvent");
  }
}

- (void)gotoNextSlide
{
  if (-[KPFSession incrementCurrentSlideIndex](self->mSession, "incrementCurrentSlideIndex"))
  {
    -[KPFGingerSlide renderSlideWithSession:](-[KPFSession currentSlide](self->mSession, "currentSlide"), "renderSlideWithSession:", self->mSession);
    -[KPFSession setPlaybackState:](self->mSession, "setPlaybackState:", 3);
    self->mQueuedTrigger = 0;
    if (-[KPFGingerEvent isAutomatic](-[KPFGingerSlide currentEvent](-[KPFSession currentSlide](self->mSession, "currentSlide"), "currentEvent"), "isAutomatic"))
    {
      -[KPFGingerPlayerController p_triggerEvent](self, "p_triggerEvent");
    }
  }
}

- (void)gotoPreviousSlide
{
  unint64_t v3;
  KPFGingerSlide *v4;

  v3 = -[KPFGingerSlide curentEventIndex](-[KPFSession currentSlide](self->mSession, "currentSlide"), "curentEventIndex");
  v4 = -[KPFSession currentSlide](self->mSession, "currentSlide");
  if (v3)
    goto LABEL_2;
  if (!-[KPFGingerSlide curentEventIndex](v4, "curentEventIndex")
    && -[KPFSession decrementCurrentSlideIndex](self->mSession, "decrementCurrentSlideIndex"))
  {
    v4 = -[KPFSession currentSlide](self->mSession, "currentSlide");
LABEL_2:
    -[KPFGingerSlide renderSlideWithSession:](v4, "renderSlideWithSession:", self->mSession);
    -[KPFSession setPlaybackState:](self->mSession, "setPlaybackState:", 3);
    self->mQueuedTrigger = 0;
  }
}

- (void)gotoFirstSlide
{
  -[KPFGingerPlayerController gotoSlideAtIndex:shouldAutoPlay:](self, "gotoSlideAtIndex:shouldAutoPlay:", 0, 1);
}

- (void)gotoLastSlide
{
  -[KPFGingerPlayerController gotoSlideAtIndex:shouldAutoPlay:](self, "gotoSlideAtIndex:shouldAutoPlay:", (char *)-[NSMutableArray count](-[KPFSession KPFSlideList](self->mSession, "KPFSlideList"), "count") - 1, 1);
}

- (void)p_resetToFirstSlideAndShouldAutoPlay:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  +[NSObject cancelPreviousPerformRequestsWithTarget:](NSObject, "cancelPreviousPerformRequestsWithTarget:", self);
  -[KPFSession stopAllAnimations](self->mSession, "stopAllAnimations");
  -[KPFGingerPlayerController gotoSlideAtIndex:shouldAutoPlay:](self, "gotoSlideAtIndex:shouldAutoPlay:", 0, v3);
  -[KPFSession setupAndPlaySoundtrackAfterDelay:](self->mSession, "setupAndPlaySoundtrackAfterDelay:", 0.0);
  -[KPFSession setPlaybackState:](self->mSession, "setPlaybackState:", 2);
}

- (void)transportControlCloneGotoPrev
{
  if (-[KPFGingerPlayerController transportControlCloneCanGotoPrev](self, "transportControlCloneCanGotoPrev"))
    -[KPFGingerPlayerController gotoPreviousSlide](self, "gotoPreviousSlide");
  -[KPFGingerPlayerController p_announceStateUpdate](self, "p_announceStateUpdate");
}

- (void)transportControlCloneGotoNext
{
  if (-[KPFGingerPlayerController transportControlCloneCanGotoNext](self, "transportControlCloneCanGotoNext"))
    -[KPFGingerPlayerController gotoNextEvent](self, "gotoNextEvent");
  -[KPFGingerPlayerController p_announceStateUpdate](self, "p_announceStateUpdate");
}

- (void)transportControlCloneGotoFirst
{
  if (-[KPFGingerPlayerController transportControlCloneCanGotoFirst](self, "transportControlCloneCanGotoFirst"))
  {
    -[KPFGingerPlayerController p_resetToFirstSlideAndShouldAutoPlay:](self, "p_resetToFirstSlideAndShouldAutoPlay:", 0);
    -[KPFGingerPlayerController p_announceStateUpdate](self, "p_announceStateUpdate");
  }
}

- (void)transportControlCloneGotoLast
{
  if (-[KPFGingerPlayerController transportControlCloneCanGotoLast](self, "transportControlCloneCanGotoLast"))
    -[KPFGingerPlayerController gotoLastSlide](self, "gotoLastSlide");
  -[KPFGingerPlayerController p_announceStateUpdate](self, "p_announceStateUpdate");
}

- (void)transportControlCloneToggleSound
{
  NSLog(CFSTR("sound toggle not implemented"), a2);
}

- (void)transportControlCloneEnableSound:(BOOL)a3
{
  NSLog(CFSTR("sound enable/disable not implemented"), a2, a3);
}

- (void)p_announceStateUpdate
{
  -[NSNotificationCenter postNotificationName:object:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "postNotificationName:object:", CFSTR("kTSWTransportControlCloneDidUpdateNotification"), self);
}

- (BOOL)transportControlCloneCanGotoPrev
{
  return -[KPFSession currentSlideIndex](self->mSession, "currentSlideIndex") != 0;
}

- (BOOL)transportControlCloneCanGotoNext
{
  unint64_t v3;

  v3 = -[KPFSession currentSlideIndex](self->mSession, "currentSlideIndex");
  return v3 < (unint64_t)-[NSMutableArray count](-[KPFSession KPFSlideList](self->mSession, "KPFSlideList"), "count");
}

- (BOOL)transportControlCloneCanGotoFirst
{
  return 1;
}

- (BOOL)transportControlCloneCanGotoLast
{
  return 0;
}

- (BOOL)transportControlCloneCanMute
{
  return 0;
}

- (unint64_t)transportControlCloneIndex
{
  return -[KPFSession currentSlideIndex](self->mSession, "currentSlideIndex");
}

- (unint64_t)transportControlCloneCount
{
  return (unint64_t)-[NSMutableArray count](-[KPFSession KPFSlideList](self->mSession, "KPFSlideList"), "count");
}

- (BOOL)transportControlCloneSupportsSound
{
  return 0;
}

- (id)hyperlinksRectArray
{
  id result;

  result = -[KPFGingerSlide currentEvent](-[KPFSession currentSlide](self->mSession, "currentSlide"), "currentEvent");
  if (result)
    return objc_msgSend(result, "hyperlinksRectArray");
  return result;
}

- (void)p_hyperlinkAnimationEnded
{
  -[KPFGingerPlayerController p_goToSlideWithSlideTag:](self, "p_goToSlideWithSlideTag:", self->mHyperlinkSlideTag);
}

- (void)p_animationEnded
{
  KPFGingerEvent *v3;
  unsigned int v4;
  unsigned int v5;
  KPFSession *mSession;

  v3 = -[KPFGingerSlide nextEvent](-[KPFSession currentSlide](self->mSession, "currentSlide"), "nextEvent");
  if (!v3)
  {
    if (!-[KPFSession nextSlide](self->mSession, "nextSlide"))
    {
      v4 = 0;
      goto LABEL_5;
    }
    v3 = -[KPFGingerSlide currentEvent](-[KPFSession nextSlide](self->mSession, "nextSlide"), "currentEvent");
  }
  v4 = -[KPFGingerEvent isAutomatic](v3, "isAutomatic");
LABEL_5:
  -[KPFSession setPlaybackState:](self->mSession, "setPlaybackState:", 5);
  if (self->mQueuedTrigger || v4)
  {
    -[KPFGingerPlayerController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "p_triggerEvent", 0, 0.0);
    self->mQueuedTrigger = 0;
  }
  else if (!-[KPFGingerSlide containsMovie](-[KPFSession currentSlide](self->mSession, "currentSlide"), "containsMovie")&& -[KPFSession playbackState](self->mSession, "playbackState") == 5)
  {
    v5 = -[KPFGingerSlide incrementCurrentEventIndex](-[KPFSession currentSlide](self->mSession, "currentSlide"), "incrementCurrentEventIndex");
    mSession = self->mSession;
    if (v5)
    {
      -[KPFGingerSlide renderCurrentEventWithSession:](-[KPFSession currentSlide](mSession, "currentSlide"), "renderCurrentEventWithSession:", self->mSession);
    }
    else
    {
      if (!-[KPFSession incrementCurrentSlideIndex](mSession, "incrementCurrentSlideIndex"))
      {
        -[KPFGingerPlayerController p_resetToFirstSlideAndShouldAutoPlay:](self, "p_resetToFirstSlideAndShouldAutoPlay:", 0);
        goto LABEL_12;
      }
      -[KPFGingerSlide renderSlideWithSession:](-[KPFSession currentSlide](self->mSession, "currentSlide"), "renderSlideWithSession:", self->mSession);
    }
    -[KPFSession setPlaybackState:](self->mSession, "setPlaybackState:", 3);
  }
LABEL_12:
  -[KPFGingerPlayerController p_announceStateUpdate](self, "p_announceStateUpdate");
}

- (void)p_triggerEvent
{
  unsigned int v3;
  KPFSession *mSession;
  KPFGingerEvent *v5;
  _QWORD v6[5];

  if (-[KPFSession playbackState](self->mSession, "playbackState") == 2)
    -[KPFSession setPlaybackState:](self->mSession, "setPlaybackState:", 3);
  if (-[KPFGingerSlide containsMovie](-[KPFSession currentSlide](self->mSession, "currentSlide"), "containsMovie")
    && -[KPFGingerSlide mediaPlaybackIsPaused](-[KPFSession currentSlide](self->mSession, "currentSlide"), "mediaPlaybackIsPaused"))
  {
    -[KPFGingerSlide resumeMediaPlayback](-[KPFSession currentSlide](self->mSession, "currentSlide"), "resumeMediaPlayback");
    return;
  }
  if (-[KPFSession playbackState](self->mSession, "playbackState") == 5)
  {
    v3 = -[KPFGingerSlide incrementCurrentEventIndex](-[KPFSession currentSlide](self->mSession, "currentSlide"), "incrementCurrentEventIndex");
    mSession = self->mSession;
    if (v3)
    {
      -[KPFGingerSlide renderCurrentEventWithSession:](-[KPFSession currentSlide](mSession, "currentSlide"), "renderCurrentEventWithSession:", self->mSession);
LABEL_11:
      -[KPFSession setPlaybackState:](self->mSession, "setPlaybackState:", 3);
      goto LABEL_13;
    }
    if (-[KPFSession incrementCurrentSlideIndex](mSession, "incrementCurrentSlideIndex"))
    {
      -[KPFGingerSlide renderSlideWithSession:](-[KPFSession currentSlide](self->mSession, "currentSlide"), "renderSlideWithSession:", self->mSession);
      goto LABEL_11;
    }
    -[KPFGingerPlayerController p_resetToFirstSlideAndShouldAutoPlay:](self, "p_resetToFirstSlideAndShouldAutoPlay:", 0);
  }
LABEL_13:
  if (!self->mQueuedTrigger)
  {
    if (-[KPFGingerEvent isMoviePlaying](-[KPFGingerSlide currentEvent](-[KPFSession currentSlide](self->mSession, "currentSlide"), "currentEvent"), "isMoviePlaying")|| -[KPFGingerEvent isAnimating](-[KPFGingerSlide currentEvent](-[KPFSession currentSlide](self->mSession, "currentSlide"), "currentEvent"), "isAnimating"))
    {
      self->mQueuedTrigger = 1;
    }
    else if (-[KPFSession playbackState](self->mSession, "playbackState") == 3)
    {
      v5 = -[KPFGingerSlide currentEvent](-[KPFSession currentSlide](self->mSession, "currentSlide"), "currentEvent");
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_91CAC;
      v6[3] = &unk_426DD0;
      v6[4] = self;
      -[KPFGingerEvent setAnimationEndHandler:](v5, "setAnimationEndHandler:", v6);
      -[KPFSession setPlaybackState:](self->mSession, "setPlaybackState:", 4);
      -[KPFGingerSlide animateSlideWithSession:](-[KPFSession currentSlide](self->mSession, "currentSlide"), "animateSlideWithSession:", self->mSession);
    }
  }
}

- (BOOL)allowsShowToEndInternally
{
  return self->mAllowsShowToEndInternally;
}

- (void)setAllowsShowToEndInternally:(BOOL)a3
{
  self->mAllowsShowToEndInternally = a3;
}

- (BOOL)playsAutomaticEvents
{
  return self->mPlaysAutomaticEvents;
}

- (void)setPlaysAutomaticEvents:(BOOL)a3
{
  self->mPlaysAutomaticEvents = a3;
}

- (KPFPlayerControllerDelegateProtocol)kpfPlayerControllerDelegate
{
  return self->kpfPlayerControllerDelegate;
}

- (void)setKpfPlayerControllerDelegate:(id)a3
{
  self->kpfPlayerControllerDelegate = (KPFPlayerControllerDelegateProtocol *)a3;
}

@end
