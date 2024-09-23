@implementation CAKPFSession

- (CAKPFSession)initWithKPFDocument:(id)a3 showLayer:(id)a4
{
  CAKPFSession *v6;
  CALayer *v7;
  NSUserDefaults *v8;
  unsigned int v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CAKPFSession;
  v6 = -[CAKPFSession init](&v11, "init");
  if (v6)
  {
    v7 = (CALayer *)a4;
    v6->mShowLayer = v7;
    -[CALayer setMasksToBounds:](v7, "setMasksToBounds:", 1);
    -[CALayer setEdgeAntialiasingMask:](v6->mShowLayer, "setEdgeAntialiasingMask:", 0);
    v6->mKPFDocument = (KPFDocument *)a3;
    v6->mPlaybackState = 1;
    v6->mBreadCrumbTrail = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v6->mAnimationRegistry = objc_alloc_init(KPFAnimationRegistry);
    v8 = +[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults");
    v9 = -[NSUserDefaults BOOLForKey:](v8, "BOOLForKey:", kTHEnableKeynoteDebugging);
    v6->mIsDebuggingEnabled = v9;
    if (v9)
    {
      v6->mStatusLayer = (CALayer *)objc_alloc_init((Class)CALayer);
      -[CAKPFSession layoutIfNeeded](v6, "layoutIfNeeded");
      -[CALayer insertSublayer:above:](-[CALayer superlayer](v6->mShowLayer, "superlayer"), "insertSublayer:above:", v6->mStatusLayer, v6->mShowLayer);
      -[CAKPFSession setPlaybackStatus:](v6, "setPlaybackStatus:", 2);
    }
  }
  return v6;
}

- (TSDMetalLayer)sharedMetalLayer
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  TSDMetalLayer *v8;

  objc_sync_enter(self);
  if (!self->_sharedMetalLayer)
  {
    +[CATransaction begin](CATransaction, "begin");
    +[CATransaction activateBackground:](CATransaction, "activateBackground:", +[NSThread isMainThread](NSThread, "isMainThread") ^ 1);
    +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
    v3 = objc_alloc((Class)TSDMetalLayer);
    -[CALayer bounds](self->mShowLayer, "bounds");
    v8 = (TSDMetalLayer *)objc_msgSend(v3, "initWithFrame:isOpaque:isWideGamut:delegate:metalDevice:", 1, 0, 0, -[CAKPFSession metalDevice](self, "metalDevice"), v4, v5, v6, v7);
    self->_sharedMetalLayer = v8;
    -[CALayer addSublayer:](self->mShowLayer, "addSublayer:", v8);
    +[CATransaction commit](CATransaction, "commit");
  }
  objc_sync_exit(self);
  return self->_sharedMetalLayer;
}

- (MTLDevice)metalDevice
{
  MTLDevice *result;

  result = self->mMetalDevice;
  if (!result)
  {
    result = (MTLDevice *)MTLCreateSystemDefaultDevice();
    self->mMetalDevice = result;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[KPFEvent tearDown](self->mCurrentEvent, "tearDown");
  -[TSDMetalLayer tearDown](self->_sharedMetalLayer, "tearDown");
  v3.receiver = self;
  v3.super_class = (Class)CAKPFSession;
  -[CAKPFSession dealloc](&v3, "dealloc");
}

- (void)tearDown
{
  -[KPFEvent tearDown](self->mCurrentEvent, "tearDown");

  self->mCurrentEvent = 0;
}

- (unint64_t)visibleEventIndex
{
  if (self->mPlaybackStatus == 4)
    return -[CAKPFSession nextEventIndexAfterCurrent](self, "nextEventIndexAfterCurrent");
  else
    return self->mCurrentEventIndex;
}

- (int64_t)nextEventIndexAfterCurrent
{
  char *mCurrentEventIndex;
  _BYTE *v4;

  mCurrentEventIndex = (char *)self->mCurrentEventIndex;
  if (mCurrentEventIndex <= (char *)-[KPFDocument eventCount](self->mKPFDocument, "eventCount") - 1)
  {
    v4 = (_BYTE *)self->mCurrentEventIndex;
    if (v4 == (char *)-[KPFDocument eventCount](self->mKPFDocument, "eventCount") - 1)
      return -[KPFDocument isLooping](self->mKPFDocument, "isLooping") - 1;
    else
      return self->mCurrentEventIndex + 1;
  }
  return (int64_t)mCurrentEventIndex;
}

- (KPFEvent)nextEvent
{
  KPFEvent *result;
  int64_t v4;

  result = self->mNextEvent;
  if (!result)
  {
    v4 = -[CAKPFSession nextEventIndexAfterCurrent](self, "nextEventIndexAfterCurrent");
    if (v4 == -1)
    {
      return self->mNextEvent;
    }
    else
    {
      result = -[KPFDocument newEventAtIndex:](self->mKPFDocument, "newEventAtIndex:", v4);
      self->mNextEvent = result;
    }
  }
  return result;
}

- (BOOL)incrementCurrentEventIndex
{
  unint64_t v3;
  void *v4;
  KPFEvent *v5;

  v3 = -[CAKPFSession nextEventIndexAfterCurrent](self, "nextEventIndexAfterCurrent");
  if (v3 != -1)
  {
    v4 = -[KPFDocument slideIndexForEventIndex:](self->mKPFDocument, "slideIndexForEventIndex:", self->mCurrentEventIndex);
    -[KPFEvent tearDown](self->mCurrentEvent, "tearDown");

    v5 = -[KPFDocument newEventAtIndex:](self->mKPFDocument, "newEventAtIndex:", v3);
    self->mCurrentEventIndex = v3;
    self->mCurrentEvent = v5;
    if (v4 != (void *)-[KPFDocument slideIndexForEventIndex:](self->mKPFDocument, "slideIndexForEventIndex:", v3))
      -[NSMutableArray addObject:](self->mBreadCrumbTrail, "addObject:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v4));

    self->mNextEvent = 0;
  }
  return v3 != -1;
}

- (BOOL)decrementCurrentEventIndex
{
  void *v3;
  unint64_t mCurrentEventIndex;
  _BOOL4 v5;

  v3 = -[KPFDocument slideIndexForEventIndex:](self->mKPFDocument, "slideIndexForEventIndex:", self->mCurrentEventIndex);
  mCurrentEventIndex = self->mCurrentEventIndex;
  if (!mCurrentEventIndex)
  {
    v5 = -[KPFDocument isLooping](self->mKPFDocument, "isLooping");
    if (!v5)
      return v5;
    mCurrentEventIndex = -[KPFDocument eventCount](self->mKPFDocument, "eventCount");
  }
  self->mCurrentEventIndex = mCurrentEventIndex - 1;
  if (v3 != (void *)-[KPFDocument slideIndexForEventIndex:](self->mKPFDocument, "slideIndexForEventIndex:"))
    -[NSMutableArray addObject:](self->mBreadCrumbTrail, "addObject:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v3));
  -[KPFEvent tearDown](self->mCurrentEvent, "tearDown");

  self->mCurrentEvent = 0;
  self->mNextEvent = 0;
  LOBYTE(v5) = 1;
  return v5;
}

- (KPFEvent)currentEvent
{
  KPFEvent *result;

  result = self->mCurrentEvent;
  if (!result)
  {
    result = -[KPFDocument newEventAtIndex:](self->mKPFDocument, "newEventAtIndex:", self->mCurrentEventIndex);
    self->mCurrentEvent = result;
  }
  return result;
}

- (void)setEventIndex:(unint64_t)a3 skipBreadCrumb:(BOOL)a4
{
  unint64_t v7;
  unint64_t v8;

  if (-[KPFDocument eventCount](self->mKPFDocument, "eventCount") > a3)
  {
    v7 = -[KPFDocument slideIndexForEventIndex:](self->mKPFDocument, "slideIndexForEventIndex:", self->mCurrentEventIndex);
    if (self->mPlaybackStatus == 4)
    {
      -[NSMutableArray addObject:](self->mBreadCrumbTrail, "addObject:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v7));
      v7 = -[KPFDocument slideIndexForEventIndex:](self->mKPFDocument, "slideIndexForEventIndex:", -[CAKPFSession nextEventIndexAfterCurrent](self, "nextEventIndexAfterCurrent"));
    }
    self->mCurrentEventIndex = a3;
    v8 = -[KPFDocument slideIndexForEventIndex:](self->mKPFDocument, "slideIndexForEventIndex:", a3);
    if (!a4 && v7 != v8)
      -[NSMutableArray addObject:](self->mBreadCrumbTrail, "addObject:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v7));
    -[KPFEvent tearDown](self->mCurrentEvent, "tearDown");

    self->mCurrentEvent = 0;
    self->mNextEvent = 0;
  }
}

- (void)setPlaybackStatus:(int)a3
{
  id v5;
  const __CFString *v6;
  CFTimeInterval v7;

  self->mPlaybackStatus = a3;
  if (self->mIsDebuggingEnabled)
  {
    +[CATransaction begin](CATransaction, "begin");
    +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
    if ((a3 - 3) >= 2)
    {
      if (a3 == 2)
      {
        v5 = +[TSUColor orangeColor](TSUColor, "orangeColor");
        v6 = CFSTR("Playback status: Preparing...");
      }
      else
      {
        v5 = +[TSUColor greenColor](TSUColor, "greenColor");
        v6 = CFSTR("Playback status: Ready");
      }
    }
    else
    {
      v5 = +[TSUColor redColor](TSUColor, "redColor");
      v6 = CFSTR("Playback status: Animating...");
    }
    -[CALayer setBackgroundColor:](self->mStatusLayer, "setBackgroundColor:", objc_msgSend(v5, "CGColor"));
    v7 = CACurrentMediaTime();
    NSLog(CFSTR("%f - %@"), *(_QWORD *)&v7, v6);
    +[CATransaction flush](CATransaction, "flush");
    +[CATransaction commit](CATransaction, "commit");
  }
}

- (void)layoutIfNeeded
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  -[CALayer bounds](self->mShowLayer, "bounds");
  v4 = 25.0 / v3;
  -[CALayer frame](self->mShowLayer, "frame");
  v6 = v4 * v5;
  -[CALayer frame](self->mShowLayer, "frame");
  v8 = v6 + v7;
  -[CALayer frame](self->mShowLayer, "frame");
  v10 = v9;
  -[CALayer frame](self->mShowLayer, "frame");
  -[CALayer setFrame:](self->mStatusLayer, "setFrame:", v8, v10 + v11 + v6 * -2.0, v6, v6);
}

- (unint64_t)previousSlideIndex
{
  signed int v3;
  unint64_t v5;

  v3 = objc_msgSend(-[NSMutableArray lastObject](self->mBreadCrumbTrail, "lastObject"), "intValue");
  if (self->mPlaybackStatus == 4)
    return -[KPFDocument slideIndexForEventIndex:](self->mKPFDocument, "slideIndexForEventIndex:", self->mCurrentEventIndex);
  v5 = v3;
  -[NSMutableArray removeLastObject](self->mBreadCrumbTrail, "removeLastObject");
  return v5;
}

- (void)resetBreadCrumbs
{
  -[NSMutableArray removeAllObjects](self->mBreadCrumbTrail, "removeAllObjects");
}

- (unint64_t)currentEventIndex
{
  return self->mCurrentEventIndex;
}

- (int)playbackState
{
  return self->mPlaybackState;
}

- (void)setPlaybackState:(int)a3
{
  self->mPlaybackState = a3;
}

- (CALayer)showLayer
{
  return self->mShowLayer;
}

- (KPFDocument)KPFDocument
{
  return self->mKPFDocument;
}

- (BOOL)isDebuggingEnabled
{
  return self->mIsDebuggingEnabled;
}

- (int)playbackStatus
{
  return self->mPlaybackStatus;
}

- (KPFAnimationRegistry)animationRegistry
{
  return self->mAnimationRegistry;
}

- (void)setSharedMetalLayer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

@end
