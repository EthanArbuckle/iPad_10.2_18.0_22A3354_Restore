@implementation CAKPFPlayerController

- (CAKPFPlayerController)initWithKPFDocument:(id)a3 showLayer:(id)a4
{
  CAKPFPlayerController *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CAKPFPlayerController;
  v6 = -[CAKPFPlayerController init](&v8, "init");
  if (v6)
    v6->mSession = -[CAKPFSession initWithKPFDocument:showLayer:]([CAKPFSession alloc], "initWithKPFDocument:showLayer:", a3, a4);
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CAKPFPlayerController;
  -[CAKPFPlayerController dealloc](&v3, "dealloc");
}

- (void)prepareWithEndShowHandler:(id)a3
{
  if (-[CAKPFSession playbackState](self->mSession, "playbackState") == 1)
  {
    self->mEndShowHandler = objc_msgSend(a3, "copy");
    -[CALayer setSublayers:](-[CAKPFSession showLayer](self->mSession, "showLayer"), "setSublayers:", 0);
    -[CAKPFSession setPlaybackStatus:](self->mSession, "setPlaybackStatus:", 2);
    -[KPFEvent renderEventWithSession:](-[CAKPFSession currentEvent](self->mSession, "currentEvent"), "renderEventWithSession:", self->mSession);
    -[CAKPFSession setPlaybackStatus:](self->mSession, "setPlaybackStatus:", 1);
    -[CAKPFSession setPlaybackState:](self->mSession, "setPlaybackState:", 2);
  }
}

- (BOOL)isTransitioningToStop
{
  unsigned int v3;

  v3 = -[CAKPFSession playbackState](self->mSession, "playbackState");
  if (v3 != 1)
    LOBYTE(v3) = -[CAKPFSession playbackState](self->mSession, "playbackState") == 4;
  return v3;
}

- (void)playPreparedShow
{
  if (-[CAKPFSession playbackState](self->mSession, "playbackState") == 2)
  {
    -[CAKPFPlayerController p_playSoundtrack](self, "p_playSoundtrack");
    if (-[KPFEvent isAutomatic](-[CAKPFSession currentEvent](self->mSession, "currentEvent"), "isAutomatic"))
      -[CAKPFPlayerController p_triggerNextEvent](self, "p_triggerNextEvent");
    -[CAKPFSession setPlaybackState:](self->mSession, "setPlaybackState:", 3);
  }
}

- (BOOL)isPlaying
{
  return -[CAKPFSession playbackState](self->mSession, "playbackState") == 3;
}

- (BOOL)isBackgroundSoundPlaying
{
  return -[KPFMovie isPlaying](self->mSoundtrack, "isPlaying");
}

- (void)endshow
{
  _QWORD activity_block[5];

  if (-[CAKPFSession playbackState](self->mSession, "playbackState") == 3)
  {
    activity_block[0] = _NSConcreteStackBlock;
    activity_block[1] = 3221225472;
    activity_block[2] = sub_6E2DC;
    activity_block[3] = &unk_426DD0;
    activity_block[4] = self;
    _os_activity_initiate(&dword_0, "KPFPlayer End Show", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
  }
}

- (void)tearDownShow
{
  if (-[CAKPFSession playbackState](self->mSession, "playbackState") == 4)
  {
    -[CALayer setSublayers:](-[CAKPFSession showLayer](self->mSession, "showLayer"), "setSublayers:", 0);
    -[CAKPFSession setPlaybackState:](self->mSession, "setPlaybackState:", 1);
    -[CAKPFSession tearDown](self->mSession, "tearDown");
  }
}

- (void)gotoNextEvent
{
  _QWORD activity_block[5];

  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472;
  activity_block[2] = sub_6E3E4;
  activity_block[3] = &unk_426DD0;
  activity_block[4] = self;
  _os_activity_initiate(&dword_0, "KPFPlayer Next Event", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

- (void)gotoPreviousEvent
{
  _QWORD activity_block[5];

  if (-[KPFDocument showMode](-[CAKPFSession KPFDocument](self->mSession, "KPFDocument"), "showMode") != 2)
  {
    activity_block[0] = _NSConcreteStackBlock;
    activity_block[1] = 3221225472;
    activity_block[2] = sub_6E4AC;
    activity_block[3] = &unk_426DD0;
    activity_block[4] = self;
    _os_activity_initiate(&dword_0, "KPFPlayer Previous Event", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
  }
}

- (void)p_gotoEventIndex:(unint64_t)a3 skipBreadCrumb:(BOOL)a4 shouldAutoPlay:(BOOL)a5
{
  _QWORD activity_block[6];
  BOOL v6;
  BOOL v7;

  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472;
  activity_block[2] = sub_6E5B4;
  activity_block[3] = &unk_4281F0;
  activity_block[4] = self;
  activity_block[5] = a3;
  v6 = a4;
  v7 = a5;
  _os_activity_initiate(&dword_0, "KPFPlayer Goto Event Index", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

- (void)gotoEventIndex:(unint64_t)a3
{
  -[CAKPFPlayerController p_gotoEventIndex:skipBreadCrumb:shouldAutoPlay:](self, "p_gotoEventIndex:skipBreadCrumb:shouldAutoPlay:", a3, 0, 1);
}

- (void)retreatToPreviousSlide
{
  -[CAKPFPlayerController p_gotoEventIndex:skipBreadCrumb:shouldAutoPlay:](self, "p_gotoEventIndex:skipBreadCrumb:shouldAutoPlay:", -[KPFDocument eventIndexForSlideIndex:](-[CAKPFSession KPFDocument](self->mSession, "KPFDocument"), "eventIndexForSlideIndex:", -[CAKPFSession previousSlideIndex](self->mSession, "previousSlideIndex")), 1, 1);
}

- (void)gotoFirstEvent
{
  _QWORD activity_block[5];

  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472;
  activity_block[2] = sub_6E708;
  activity_block[3] = &unk_426DD0;
  activity_block[4] = self;
  _os_activity_initiate(&dword_0, "KPFPlayer First Event", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

- (void)resetToFirstEventAndShouldAutoPlay:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  +[NSObject cancelPreviousPerformRequestsWithTarget:](NSObject, "cancelPreviousPerformRequestsWithTarget:", self);
  -[CAKPFSession resetBreadCrumbs](self->mSession, "resetBreadCrumbs");
  -[CAKPFSession setPlaybackState:](self->mSession, "setPlaybackState:", 2);
  -[CAKPFPlayerController p_gotoEventIndex:skipBreadCrumb:shouldAutoPlay:](self, "p_gotoEventIndex:skipBreadCrumb:shouldAutoPlay:", 0, 0, v3);
}

- (void)gotoLastEvent
{
  _QWORD activity_block[5];

  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472;
  activity_block[2] = sub_6E7CC;
  activity_block[3] = &unk_426DD0;
  activity_block[4] = self;
  _os_activity_initiate(&dword_0, "KPFPlayer Last Event", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

- (void)gotoSlideIndex:(unint64_t)a3
{
  _QWORD v3[6];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_6E860;
  v3[3] = &unk_427240;
  v3[4] = self;
  v3[5] = a3;
  _os_activity_initiate(&dword_0, "KPFPlayer Goto Slide", OS_ACTIVITY_FLAG_DEFAULT, v3);
}

- (void)gotoPreviousSlide
{
  _QWORD activity_block[5];

  if (-[KPFDocument showMode](-[CAKPFSession KPFDocument](self->mSession, "KPFDocument"), "showMode") != 2)
  {
    activity_block[0] = _NSConcreteStackBlock;
    activity_block[1] = 3221225472;
    activity_block[2] = sub_6E91C;
    activity_block[3] = &unk_426DD0;
    activity_block[4] = self;
    _os_activity_initiate(&dword_0, "KPFPlayer Previous Slide", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
  }
}

- (BOOL)isAnimating
{
  return -[KPFEvent isAnimating](-[CAKPFSession currentEvent](self->mSession, "currentEvent"), "isAnimating");
}

- (void)stopAllAnimations
{
  KPFMovie *mSoundtrack;

  -[KPFEvent stopAllAnimations](-[CAKPFSession currentEvent](self->mSession, "currentEvent"), "stopAllAnimations");
  mSoundtrack = self->mSoundtrack;
  if (mSoundtrack)
  {
    -[KPFMovie stop](mSoundtrack, "stop");

    self->mSoundtrack = 0;
  }
}

- (void)pauseMediaPlayback
{
  -[KPFEvent pauseMoviePlayback](-[CAKPFSession currentEvent](self->mSession, "currentEvent"), "pauseMoviePlayback");
  if (-[KPFMovie isPlaying](self->mSoundtrack, "isPlaying"))
    -[KPFMovie pause](self->mSoundtrack, "pause");
}

- (void)resumeMediaPlayback
{
  -[KPFMovie resume](self->mSoundtrack, "resume");
}

- (void)pauseBackgroundSoundtrack
{
  if (-[KPFMovie isPlaying](self->mSoundtrack, "isPlaying"))
    -[KPFMovie pause](self->mSoundtrack, "pause");
}

- (void)resumeBackgroundSoundtrack
{
  -[KPFMovie resume](self->mSoundtrack, "resume");
}

- (void)showThumbnail
{
  double v3;
  double v4;
  double v5;
  double v6;
  id v7;

  v7 = objc_alloc_init((Class)CALayer);
  -[CALayer bounds](-[CAKPFSession showLayer](self->mSession, "showLayer"), "bounds");
  objc_msgSend(v7, "setBounds:");
  -[CALayer bounds](-[CAKPFSession showLayer](self->mSession, "showLayer"), "bounds");
  objc_msgSend(v7, "setPosition:", TSDCenterOfRect(v3, v4, v5, v6));
  objc_msgSend(v7, "setContents:", -[KPFDocument thumbnailImage](-[CAKPFSession KPFDocument](self->mSession, "KPFDocument"), "thumbnailImage"));
  -[CALayer setSublayers:](-[CAKPFSession showLayer](self->mSession, "showLayer"), "setSublayers:", 0);
  -[CALayer addSublayer:](-[CAKPFSession showLayer](self->mSession, "showLayer"), "addSublayer:", v7);

}

- (id)hyperlinksRectArray
{
  id result;

  result = -[CAKPFSession currentEvent](self->mSession, "currentEvent");
  if (result)
    return objc_msgSend(result, "hyperlinksRectArray");
  return result;
}

- (BOOL)handleTouchAtLocation:(CGPoint)a3
{
  char v3;
  _QWORD v5[6];
  CGPoint v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_6EC70;
  v5[3] = &unk_428218;
  v6 = a3;
  v5[4] = self;
  v5[5] = &v7;
  _os_activity_initiate(&dword_0, "KPF Player Handle Touch", OS_ACTIVITY_FLAG_DEFAULT, v5);
  v3 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v3;
}

- (id)accessibilityLabelForCurrentEvent
{
  return +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("%1$lu of %2$lu"), &stru_43D7D8, 0), (char *)-[CAKPFSession currentEventIndex](self->mSession, "currentEventIndex") + 1, -[KPFDocument eventCount](-[CAKPFSession KPFDocument](self->mSession, "KPFDocument"), "eventCount"));
}

- (id)accessibilityRegionsForCurrentEvent
{
  return -[KPFEvent accessibilityArray](-[CAKPFSession currentEvent](self->mSession, "currentEvent"), "accessibilityArray");
}

- (void)layoutIfNeeded
{
  -[CAKPFSession layoutIfNeeded](self->mSession, "layoutIfNeeded");
}

- (void)transportControlCloneGotoPrev
{
  _QWORD activity_block[5];

  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472;
  activity_block[2] = sub_6EEB4;
  activity_block[3] = &unk_426DD0;
  activity_block[4] = self;
  _os_activity_initiate(&dword_0, "KPFPlayer Transport Previous", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

- (void)transportControlCloneGotoNext
{
  _QWORD activity_block[5];

  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472;
  activity_block[2] = sub_6EF58;
  activity_block[3] = &unk_426DD0;
  activity_block[4] = self;
  _os_activity_initiate(&dword_0, "KPFPlayer Transport Next", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

- (void)transportControlCloneGotoFirst
{
  _QWORD activity_block[5];

  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472;
  activity_block[2] = sub_6EFFC;
  activity_block[3] = &unk_426DD0;
  activity_block[4] = self;
  _os_activity_initiate(&dword_0, "KPFPlayer Transport First", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

- (void)transportControlCloneGotoLast
{
  _QWORD activity_block[5];

  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472;
  activity_block[2] = sub_6F0A4;
  activity_block[3] = &unk_426DD0;
  activity_block[4] = self;
  _os_activity_initiate(&dword_0, "KPFPlayer Transport Last", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

- (void)transportControlCloneToggleSound
{
  NSLog(CFSTR("sound toggle not implemented"), a2);
  -[CAKPFPlayerController p_announceStateUpdate](self, "p_announceStateUpdate");
}

- (void)transportControlCloneEnableSound:(BOOL)a3
{
  NSLog(CFSTR("sound enable/disable not implemented"), a2, a3);
  -[CAKPFPlayerController p_announceStateUpdate](self, "p_announceStateUpdate");
}

- (void)transportControlCloneGotoIndex:(unint64_t)a3
{
  _QWORD v3[6];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_6F1A0;
  v3[3] = &unk_427240;
  v3[4] = self;
  v3[5] = a3;
  _os_activity_initiate(&dword_0, "KPFPlayer Transport Goto Index", OS_ACTIVITY_FLAG_DEFAULT, v3);
}

- (void)p_announceStateUpdate
{
  -[NSNotificationCenter postNotificationName:object:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "postNotificationName:object:", CFSTR("kTSWTransportControlCloneDidUpdateNotification"), self);
}

- (BOOL)transportControlCloneCanGotoPrev
{
  unint64_t v3;

  v3 = -[CAKPFSession visibleEventIndex](-[CAKPFPlayerController session](self, "session"), "visibleEventIndex");
  if (v3)
    LOBYTE(v3) = -[KPFDocument showMode](-[CAKPFSession KPFDocument](-[CAKPFPlayerController session](self, "session"), "KPFDocument"), "showMode") != 2;
  return v3;
}

- (BOOL)transportControlCloneCanGotoNext
{
  char *v3;

  v3 = -[CAKPFSession visibleEventIndex](-[CAKPFPlayerController session](self, "session"), "visibleEventIndex");
  return v3 < (char *)-[KPFDocument eventCount](-[CAKPFSession KPFDocument](-[CAKPFPlayerController session](self, "session"), "KPFDocument"), "eventCount")- 1&& -[KPFDocument showMode](-[CAKPFSession KPFDocument](-[CAKPFPlayerController session](self, "session"), "KPFDocument"), "showMode") != 2;
}

- (BOOL)transportControlCloneCanGotoFirst
{
  unint64_t v3;

  v3 = -[CAKPFSession visibleEventIndex](-[CAKPFPlayerController session](self, "session"), "visibleEventIndex");
  if (v3)
    LOBYTE(v3) = -[KPFDocument showMode](-[CAKPFSession KPFDocument](-[CAKPFPlayerController session](self, "session"), "KPFDocument"), "showMode") != 2;
  return v3;
}

- (BOOL)transportControlCloneCanGotoLast
{
  char *v3;

  v3 = -[CAKPFSession visibleEventIndex](-[CAKPFPlayerController session](self, "session"), "visibleEventIndex");
  return v3 < (char *)-[KPFDocument eventCount](-[CAKPFSession KPFDocument](-[CAKPFPlayerController session](self, "session"), "KPFDocument"), "eventCount")- 1&& -[KPFDocument showMode](-[CAKPFSession KPFDocument](-[CAKPFPlayerController session](self, "session"), "KPFDocument"), "showMode") != 2;
}

- (BOOL)transportControlCloneCanMute
{
  return 0;
}

- (unint64_t)transportControlCloneIndex
{
  return -[KPFDocument slideIndexForEventIndex:](-[CAKPFSession KPFDocument](-[CAKPFPlayerController session](self, "session"), "KPFDocument"), "slideIndexForEventIndex:", -[CAKPFSession visibleEventIndex](-[CAKPFPlayerController session](self, "session"), "visibleEventIndex"));
}

- (unint64_t)transportControlCloneCount
{
  return -[KPFDocument slideCount](-[CAKPFSession KPFDocument](-[CAKPFPlayerController session](self, "session"), "KPFDocument"), "slideCount");
}

- (BOOL)transportControlCloneSupportsSound
{
  return 0;
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

- (CAKPFSession)session
{
  return self->mSession;
}

- (KPFMovie)soundTrack
{
  return self->mSoundtrack;
}

- (KPFPlayerControllerDelegateProtocol)kpfPlayerControllerDelegate
{
  return self->kpfPlayerControllerDelegate;
}

- (void)setKpfPlayerControllerDelegate:(id)a3
{
  self->kpfPlayerControllerDelegate = (KPFPlayerControllerDelegateProtocol *)a3;
}

- (void)p_handleURL:(id)a3
{
  -[KPFPlayerControllerDelegateProtocol kpfPlayer:handleURL:](-[CAKPFPlayerController kpfPlayerControllerDelegate](self, "kpfPlayerControllerDelegate"), "kpfPlayer:handleURL:", self, +[NSURL URLWithString:](NSURL, "URLWithString:", a3));
}

- (void)p_playSoundtrack
{
  KPFMovie *mSoundtrack;
  KPFMovie *v4;

  if (-[KPFDocument soundtrackName](-[CAKPFSession KPFDocument](self->mSession, "KPFDocument"), "soundtrackName"))
  {
    mSoundtrack = self->mSoundtrack;
    if (mSoundtrack)
    {
      -[KPFMovie stop](mSoundtrack, "stop");

      self->mSoundtrack = 0;
    }
    v4 = -[KPFDocument newSoundtrack](-[CAKPFSession KPFDocument](self->mSession, "KPFDocument"), "newSoundtrack");
    self->mSoundtrack = v4;
    -[KPFMovie playAfterDelay:](v4, "playAfterDelay:", 0.0);
  }
}

- (void)p_animationEnded
{
  KPFEvent *v3;
  KPFEvent *v4;

  v3 = -[CAKPFSession nextEvent](self->mSession, "nextEvent");
  if (v3)
  {
    v4 = v3;
    -[CAKPFSession setPlaybackStatus:](self->mSession, "setPlaybackStatus:", 4);
    if (self->mQueuedTrigger || -[KPFEvent isAutomatic](v4, "isAutomatic"))
    {
      -[CAKPFPlayerController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "p_triggerNextEvent", 0, 0.0);
      self->mQueuedTrigger = 0;
    }
    else if (!-[KPFEvent containsMovie](-[CAKPFSession currentEvent](self->mSession, "currentEvent"), "containsMovie"))
    {
      -[CAKPFSession setPlaybackStatus:](self->mSession, "setPlaybackStatus:", 2);
      -[KPFEvent tearDown](-[CAKPFSession currentEvent](self->mSession, "currentEvent"), "tearDown");
      if (-[CAKPFSession incrementCurrentEventIndex](self->mSession, "incrementCurrentEventIndex"))
      {
        -[KPFEvent renderEventWithSession:](-[CAKPFSession currentEvent](self->mSession, "currentEvent"), "renderEventWithSession:", self->mSession);
        -[CAKPFSession setPlaybackStatus:](self->mSession, "setPlaybackStatus:", 1);
      }
    }

    -[CAKPFPlayerController p_announceStateUpdate](self, "p_announceStateUpdate");
  }
  else
  {
    -[CAKPFPlayerController endshow](self, "endshow");
  }
}

- (void)p_triggerNextEvent
{
  _QWORD activity_block[5];

  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472;
  activity_block[2] = sub_6F5C8;
  activity_block[3] = &unk_426DD0;
  activity_block[4] = self;
  _os_activity_initiate(&dword_0, "KPFPlayer Trigger Next Event", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

@end
