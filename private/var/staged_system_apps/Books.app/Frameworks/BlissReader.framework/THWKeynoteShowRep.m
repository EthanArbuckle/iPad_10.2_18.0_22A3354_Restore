@implementation THWKeynoteShowRep

- (THWKeynoteShowRep)initWithLayout:(id)a3 canvas:(id)a4
{
  THWKeynoteShowRep *v4;
  THWKeynoteShowRep *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)THWKeynoteShowRep;
  v4 = -[THWKeynoteShowRep initWithLayout:canvas:](&v7, "initWithLayout:canvas:", a3, a4);
  v5 = v4;
  if (v4)
  {
    v4->_ownsShow = 1;
    v4->_currentAbsolutePageIndex = 0x7FFFFFFFFFFFFFFFLL;
    -[THWKeynoteShowRep setSwipeLeftGR:](v4, "setSwipeLeftGR:", objc_msgSend(objc_alloc((Class)UISwipeGestureRecognizer), "initWithTarget:action:", v4, "p_handleSwipeGesture:"));
    -[UISwipeGestureRecognizer setDirection:](-[THWKeynoteShowRep swipeLeftGR](v5, "swipeLeftGR"), "setDirection:", 2);
    objc_msgSend(objc_msgSend(-[THWKeynoteShowRep interactiveCanvasController](v5, "interactiveCanvasController"), "canvasView"), "addGestureRecognizer:", -[THWKeynoteShowRep swipeLeftGR](v5, "swipeLeftGR"));
    -[THWKeynoteShowRep setSwipeRightGR:](v5, "setSwipeRightGR:", objc_msgSend(objc_alloc((Class)UISwipeGestureRecognizer), "initWithTarget:action:", v5, "p_handleSwipeGesture:"));
    -[UISwipeGestureRecognizer setDirection:](-[THWKeynoteShowRep swipeRightGR](v5, "swipeRightGR"), "setDirection:", 1);
    objc_msgSend(objc_msgSend(-[THWKeynoteShowRep interactiveCanvasController](v5, "interactiveCanvasController"), "canvasView"), "addGestureRecognizer:", -[THWKeynoteShowRep swipeRightGR](v5, "swipeRightGR"));
    -[NSNotificationCenter addObserver:selector:name:object:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", v5, "handleNotificationVantageWillChange:", CFSTR("THVantageWillChangeNotification"), 0);
    -[NSNotificationCenter addObserver:selector:name:object:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", v5, "handleNotificationVantageDidChange:", CFSTR("THVantageDidChangeNotification"), 0);
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[THWKeynoteShowRep setSwipeLeftGR:](self, "setSwipeLeftGR:", 0);
  -[THWKeynoteShowRep setSwipeRightGR:](self, "setSwipeRightGR:", 0);
  v3.receiver = self;
  v3.super_class = (Class)THWKeynoteShowRep;
  -[THWKeynoteShowRep dealloc](&v3, "dealloc");
}

- (TSWTransportControlClone)transportControlClone
{
  return (TSWTransportControlClone *)TSUProtocolCast(&OBJC_PROTOCOL___TSWTransportControlClone, self->_kpfPlayer);
}

- (NSArray)supportedGestureKinds
{
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;

  if (TSUSupportsTextInteraction(self, a2))
  {
    v5 = TSWPImmediatePress;
    v2 = &v5;
  }
  else
  {
    v4 = TSWPImmediateSingleTap;
    v2 = &v4;
  }
  return +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v2, 1);
}

- (void)playPreparedShow
{
  if (-[KPFPlayerControllerProtocol isTransitioningToStop](-[THWKeynoteShowRep kpfPlayer](self, "kpfPlayer"), "isTransitioningToStop"))-[KPFPlayerControllerProtocol prepareWithEndShowHandler:](-[THWKeynoteShowRep kpfPlayer](self, "kpfPlayer"), "prepareWithEndShowHandler:", 0);
  -[KPFPlayerControllerProtocol playPreparedShow](-[THWKeynoteShowRep kpfPlayer](self, "kpfPlayer"), "playPreparedShow");
  -[THWKeynoteShowRep setPlayingOnAbsolutePageIndex:](self, "setPlayingOnAbsolutePageIndex:", -[THWKeynoteShowRep currentAbsolutePageIndex](self, "currentAbsolutePageIndex"));
}

- (void)stopShow
{
  -[KPFPlayerControllerProtocol endshow](-[THWKeynoteShowRep kpfPlayer](self, "kpfPlayer"), "endshow");
}

- (void)wasAddedToParent
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWKeynoteShowRep;
  -[THWKeynoteShowRep wasAddedToParent](&v3, "wasAddedToParent");
  -[NSNotificationCenter addObserver:selector:name:object:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", self, "p_keynoteShowDidUpdate:", CFSTR("kTSWTransportControlCloneDidUpdateNotification"), 0);
}

- (void)willBeRemovedFromParent
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWKeynoteShowRep;
  -[THWKeynoteShowRep willBeRemovedFromParent](&v3, "willBeRemovedFromParent");
  -[NSNotificationCenter removeObserver:name:object:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "removeObserver:name:object:", self, CFSTR("kTSWTransportControlCloneDidUpdateNotification"), 0);
}

- (void)willBeRemoved
{
  objc_super v3;

  if (self->_ownsShow)
  {
    -[KPFPlayerControllerProtocol endshow](self->_kpfPlayer, "endshow");
    -[KPFPlayerControllerProtocol tearDownShow](self->_kpfPlayer, "tearDownShow");
  }
  objc_msgSend(objc_msgSend(-[THWKeynoteShowRep interactiveCanvasController](self, "interactiveCanvasController"), "canvasView"), "removeGestureRecognizer:", -[THWKeynoteShowRep swipeLeftGR](self, "swipeLeftGR"));
  objc_msgSend(objc_msgSend(-[THWKeynoteShowRep interactiveCanvasController](self, "interactiveCanvasController"), "canvasView"), "removeGestureRecognizer:", -[THWKeynoteShowRep swipeRightGR](self, "swipeRightGR"));
  -[NSNotificationCenter removeObserver:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "removeObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)THWKeynoteShowRep;
  -[THWKeynoteShowRep willBeRemoved](&v3, "willBeRemoved");
}

- (void)updateFromLayout
{
  KPFPlayerControllerProtocol *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THWKeynoteShowRep;
  -[THWKeynoteShowRep updateFromLayout](&v4, "updateFromLayout");
  if (self->_ownsShow && !self->_kpfPlayer && objc_msgSend(-[THWKeynoteShowRep info](self, "info"), "sourceURL"))
  {
    self->_showLayer = (CALayer *)objc_alloc_init((Class)CALayer);
    -[CALayer setDelegate:](self->_showLayer, "setDelegate:", +[THNoAnimationLayerDelegate sharedInstance](THNoAnimationLayerDelegate, "sharedInstance"));
    -[CALayer setBounds:](self->_showLayer, "setBounds:", TSDRectWithSize(objc_msgSend(-[THWKeynoteShowRep layout](self, "layout"), "showSize")));
    -[UIScreen scale](+[UIScreen mainScreen](UIScreen, "mainScreen"), "scale");
    -[CALayer setContentsScale:](self->_showLayer, "setContentsScale:");
    v3 = +[KPFPlayer createPlayerWithKPFDocument:bundle:layer:](KPFPlayer, "createPlayerWithKPFDocument:bundle:layer:", objc_msgSend(-[THWKeynoteShowRep layout](self, "layout"), "kpfDocument"), +[NSBundle bundleWithURL:](NSBundle, "bundleWithURL:", objc_msgSend(-[THWKeynoteShowRep info](self, "info"), "sourceURL")), self->_showLayer);
    self->_kpfPlayer = v3;
    -[KPFPlayerControllerProtocol prepareWithEndShowHandler:](v3, "prepareWithEndShowHandler:", 0);
    if ((objc_opt_respondsToSelector(-[THWKeynoteShowRep kpfPlayer](self, "kpfPlayer"), "setKpfPlayerControllerDelegate:") & 1) != 0)-[KPFPlayerControllerProtocol setKpfPlayerControllerDelegate:](-[THWKeynoteShowRep kpfPlayer](self, "kpfPlayer"), "setKpfPlayerControllerDelegate:", self);
  }
}

- (void)willReplaceContentsFromRep:(id)a3
{
  uint64_t v5;
  void *v6;
  double v7;
  void *v8;

  v5 = objc_opt_class(THWKeynoteShowRep);
  *(_QWORD *)&v7 = TSUDynamicCast(v5, a3).n128_u64[0];
  if (v6)
  {
    v8 = v6;
    if ((objc_msgSend(v6, "ownsShow", v7) & 1) == 0)
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWKeynoteShowRep willReplaceContentsFromRep:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/THWKeynoteShowRep.m"), 195, CFSTR("unexpected show ownership before replacing contents"));
    objc_msgSend(-[THWKeynoteShowRep layout](self, "layout"), "setKpfDocument:", objc_msgSend(objc_msgSend(v8, "layout"), "kpfDocument"));
    -[THWKeynoteShowRep setKpfPlayer:](self, "setKpfPlayer:", objc_msgSend(v8, "kpfPlayer"));
    if ((objc_opt_respondsToSelector(-[THWKeynoteShowRep kpfPlayer](self, "kpfPlayer"), "setKpfPlayerControllerDelegate:") & 1) != 0)-[KPFPlayerControllerProtocol setKpfPlayerControllerDelegate:](-[THWKeynoteShowRep kpfPlayer](self, "kpfPlayer"), "setKpfPlayerControllerDelegate:", self);
    -[THWKeynoteShowRep setOwnsShow:](self, "setOwnsShow:", 0);
  }
}

- (void)replaceContentsFromRep:(id)a3
{
  uint64_t v5;
  void *v6;
  double v7;
  void *v8;

  v5 = objc_opt_class(THWKeynoteShowRep);
  *(_QWORD *)&v7 = TSUDynamicCast(v5, a3).n128_u64[0];
  if (v6)
  {
    v8 = v6;
    if (!objc_msgSend(v6, "ownsShow", v7) || -[THWKeynoteShowRep ownsShow](self, "ownsShow"))
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWKeynoteShowRep replaceContentsFromRep:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/THWKeynoteShowRep.m"), 215, CFSTR("unexpected show ownership while replacing contents"));
    -[THWKeynoteShowRep setShowLayer:](self, "setShowLayer:", objc_msgSend(v8, "showLayer"));
    objc_msgSend(-[THWKeynoteShowRep canvas](self, "canvas"), "invalidateLayers");
    objc_msgSend(v8, "setOwnsShow:", 0);
    -[THWKeynoteShowRep setOwnsShow:](self, "setOwnsShow:", 1);
  }
}

- (void)addAdditionalChildLayersToArray:(id)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CALayer *v18;
  CATransform3D v19;
  CATransform3D v20;

  if (self->_ownsShow && self->_showLayer)
  {
    -[THWKeynoteShowRep convertNaturalRectToLayerRelative:](self, "convertNaturalRectToLayerRelative:", TSDRectWithSize(objc_msgSend(-[THWKeynoteShowRep layout](self, "layout"), "frame")));
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    -[CALayer bounds](self->_showLayer, "bounds");
    v15 = THScaleNeededToFitSizeInSize(v13, v14, v10, v12);
    +[CATransaction begin](CATransaction, "begin");
    +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
    v16 = TSDCenterOfRect(v6, v8, v10, v12);
    -[CALayer setPosition:](-[THWKeynoteShowRep showLayer](self, "showLayer"), "setPosition:", v16, v17);
    CATransform3DMakeScale(&v20, v15, v15, 1.0);
    v18 = -[THWKeynoteShowRep showLayer](self, "showLayer");
    v19 = v20;
    -[CALayer setTransform:](v18, "setTransform:", &v19);
    +[CATransaction commit](CATransaction, "commit");
    objc_msgSend(a3, "addObject:", -[THWKeynoteShowRep showLayer](self, "showLayer"));
    if (-[KPFPlayerControllerProtocol isTransitioningToStop](-[THWKeynoteShowRep kpfPlayer](self, "kpfPlayer"), "isTransitioningToStop"))-[KPFPlayerControllerProtocol prepareWithEndShowHandler:](-[THWKeynoteShowRep kpfPlayer](self, "kpfPlayer"), "prepareWithEndShowHandler:", 0);
  }
}

- (BOOL)canHandleGesture:(id)a3
{
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  _BOOL8 v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  CGPoint v18;
  CGRect v19;

  if (!self->_ownsShow)
  {
LABEL_8:
    LOBYTE(v11) = 0;
    return v11;
  }
  objc_msgSend(a3, "boundsLocationForICC:", -[THWKeynoteShowRep interactiveCanvasController](self, "interactiveCanvasController"));
  -[CALayer convertPoint:fromLayer:](self->_showLayer, "convertPoint:fromLayer:", objc_msgSend(objc_msgSend(-[THWKeynoteShowRep interactiveCanvasController](self, "interactiveCanvasController"), "layerHost"), "layer"), v5, v6);
  v8 = v7;
  v10 = v9;
  -[CALayer bounds](self->_showLayer, "bounds");
  v18.x = v8;
  v18.y = v10;
  v11 = CGRectContainsPoint(v19, v18);
  if (v11)
  {
    if (TSUSupportsTextInteraction(v11, v12)
      && (v13 = objc_msgSend(a3, "gestureKind"), v13 == (id)TSWPImmediatePress)
      || (v14 = objc_msgSend(a3, "gestureKind"), v14 == (id)TSWPImmediateSingleTap)
      || (v15 = objc_msgSend(a3, "gestureKind"), v15 == (id)TSWPImmediateDoubleTap)
      || (v16 = objc_msgSend(a3, "gestureKind"), v16 == (id)TSWPDoubleTapAndTouch))
    {
      LOBYTE(v11) = 1;
      return v11;
    }
    goto LABEL_8;
  }
  return v11;
}

- (BOOL)handleGesture:(id)a3
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  double v13;
  double v14;
  unsigned int v15;
  KPFPlayerControllerProtocol *kpfPlayer;

  if (!self->_ownsShow)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWKeynoteShowRep handleGesture:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/THWKeynoteShowRep.m"), 280, CFSTR("shouldn't be handling gestures when we don't own the show"));
  v5 = objc_msgSend(a3, "gestureKind");
  v6 = (id)TSWPImmediateSingleTap;
  if (v5 != (id)TSWPImmediateSingleTap)
  {
    v7 = objc_msgSend(a3, "gestureKind");
    if (v7 != (id)TSWPImmediateDoubleTap)
    {
      v8 = objc_msgSend(a3, "gestureKind");
      if (v8 != (id)TSWPDoubleTapAndTouch)
      {
        v9 = objc_msgSend(a3, "gestureKind");
        if (v9 != (id)TSWPImmediatePress)
          objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWKeynoteShowRep handleGesture:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/THWKeynoteShowRep.m"), 281, CFSTR("don't know how to handle this gesture kind"));
      }
    }
  }
  if (objc_msgSend(a3, "gestureKind") == v6
    || (v10 = objc_msgSend(a3, "gestureKind"), v10 == (id)TSWPImmediateDoubleTap)
    || (v11 = objc_msgSend(a3, "gestureKind"), v11 == (id)TSWPDoubleTapAndTouch)
    || (v12 = objc_msgSend(a3, "gestureKind"), v12 == (id)TSWPImmediatePress))
  {
    if (objc_msgSend(a3, "gestureState") == 3)
    {
      objc_msgSend(a3, "boundsLocationForICC:", -[THWKeynoteShowRep interactiveCanvasController](self, "interactiveCanvasController"));
      -[CALayer convertPoint:fromLayer:](self->_showLayer, "convertPoint:fromLayer:", objc_msgSend(objc_msgSend(-[THWKeynoteShowRep interactiveCanvasController](self, "interactiveCanvasController"), "layerHost"), "layer"), v13, v14);
      if ((-[KPFPlayerControllerProtocol handleTouchAtLocation:](self->_kpfPlayer, "handleTouchAtLocation:") & 1) == 0)
      {
        v15 = -[KPFPlayerControllerProtocol transportControlCloneCanGotoNext](self->_kpfPlayer, "transportControlCloneCanGotoNext");
        kpfPlayer = self->_kpfPlayer;
        if (v15)
          -[KPFPlayerControllerProtocol transportControlCloneGotoNext](kpfPlayer, "transportControlCloneGotoNext");
        else
          -[KPFPlayerControllerProtocol transportControlCloneGotoFirst](kpfPlayer, "transportControlCloneGotoFirst");
      }
    }
  }
  return 1;
}

- (BOOL)kpfPlayer:(id)a3 handleURL:(id)a4
{
  void *v7;

  if (-[THWKeynoteShowRep kpfPlayer](self, "kpfPlayer") != a3)
    return 0;
  v7 = (void *)TSUProtocolCast(&OBJC_PROTOCOL___THWKeynoteShowRepDelegate, -[THWKeynoteShowRep parentRep](self, "parentRep"));
  return objc_msgSend(v7, "keynoteShowRep:handleURL:", self, a4);
}

- (id)p_documentNavigatorFromNotification:(id)a3
{
  uint64_t v4;
  id result;
  double v6;

  v4 = objc_opt_class(THDocumentNavigator);
  *(_QWORD *)&v6 = TSUDynamicCast(v4, objc_msgSend(a3, "object")).n128_u64[0];
  if (!result)
    return objc_msgSend((id)TSUProtocolCast(&OBJC_PROTOCOL___THVantageChangeInitiator, objc_msgSend(a3, "object", v6)), "documentNavigator");
  return result;
}

- (void)handleNotificationVantageWillChange:(id)a3
{
  id v4;

  if (self->_ownsShow)
  {
    v4 = objc_msgSend(objc_msgSend(a3, "userInfo"), "valueForKey:", CFSTR("THVantageChangeReason"));
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("THVantageChangeReasonBookOpen")) & 1) == 0
      && (objc_msgSend(v4, "isEqualToString:", CFSTR("THVantageChangeReasonScrolling")) & 1) == 0
      && (objc_msgSend(v4, "isEqualToString:", CFSTR("THVantageChangeReasonNavigation")) & 1) == 0)
    {
      -[KPFPlayerControllerProtocol pauseBackgroundSoundtrack](self->_kpfPlayer, "pauseBackgroundSoundtrack");
    }
  }
}

- (void)handleNotificationVantageDidChange:(id)a3
{
  id v5;
  id v6;
  _BOOL4 v7;
  THWKeynoteShowRep *v8;
  uint64_t v9;

  if (self->_ownsShow)
  {
    v5 = objc_msgSend(objc_msgSend(a3, "userInfo"), "valueForKey:", CFSTR("THVantageChangeReason"));
    v6 = objc_msgSend(-[THWKeynoteShowRep p_documentNavigatorFromNotification:](self, "p_documentNavigatorFromNotification:", a3), "currentAbsolutePageIndex");
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("THVantageChangeReasonScrolling")))
      v7 = v6 != (id)self->_currentAbsolutePageIndex;
    else
      v7 = 0;
    self->_currentAbsolutePageIndex = (unint64_t)v6;
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("THVantageChangeReasonNavigation")) & 1) == 0 && !v7)
    {
      if ((objc_msgSend(v5, "isEqualToString:", CFSTR("THVantageChangeReasonBookOpen")) & 1) == 0)
        -[KPFPlayerControllerProtocol resumeBackgroundSoundtrack](self->_kpfPlayer, "resumeBackgroundSoundtrack");
      return;
    }
    if (((-[KPFPlayerControllerProtocol isPlaying](-[THWKeynoteShowRep kpfPlayer](self, "kpfPlayer"), "isPlaying") & 1) != 0|| -[KPFPlayerControllerProtocol isBackgroundSoundPlaying](-[THWKeynoteShowRep kpfPlayer](self, "kpfPlayer"), "isBackgroundSoundPlaying"))&& (id)-[THWKeynoteShowRep playingOnAbsolutePageIndex](self, "playingOnAbsolutePageIndex") != v6)
    {
      -[KPFPlayerControllerProtocol pauseMediaPlayback](self->_kpfPlayer, "pauseMediaPlayback");
      -[KPFPlayerControllerProtocol pauseBackgroundSoundtrack](self->_kpfPlayer, "pauseBackgroundSoundtrack");
      v8 = self;
      v9 = 1;
      goto LABEL_17;
    }
    if (-[THWKeynoteShowRep wasStoppedByScrolling](self, "wasStoppedByScrolling")
      && (id)-[THWKeynoteShowRep playingOnAbsolutePageIndex](self, "playingOnAbsolutePageIndex") == v6)
    {
      -[KPFPlayerControllerProtocol resumeMediaPlayback](self->_kpfPlayer, "resumeMediaPlayback");
      -[KPFPlayerControllerProtocol resumeBackgroundSoundtrack](self->_kpfPlayer, "resumeBackgroundSoundtrack");
      v8 = self;
      v9 = 0;
LABEL_17:
      -[THWKeynoteShowRep setWasStoppedByScrolling:](v8, "setWasStoppedByScrolling:", v9);
    }
  }
}

- (void)p_handleSwipeGesture:(id)a3
{
  if (-[THWKeynoteShowRep swipeLeftGR](self, "swipeLeftGR") == a3)
  {
    -[KPFPlayerControllerProtocol gotoNextEvent](self->_kpfPlayer, "gotoNextEvent");
  }
  else if (-[THWKeynoteShowRep swipeRightGR](self, "swipeRightGR") == a3)
  {
    -[KPFPlayerControllerProtocol gotoPreviousSlide](self->_kpfPlayer, "gotoPreviousSlide");
  }
}

- (KPFPlayerControllerProtocol)kpfPlayer
{
  return self->_kpfPlayer;
}

- (void)setKpfPlayer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 288);
}

- (CALayer)showLayer
{
  return self->_showLayer;
}

- (void)setShowLayer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 296);
}

- (BOOL)ownsShow
{
  return self->_ownsShow;
}

- (void)setOwnsShow:(BOOL)a3
{
  self->_ownsShow = a3;
}

- (BOOL)wasStoppedByScrolling
{
  return self->_wasStoppedByScrolling;
}

- (void)setWasStoppedByScrolling:(BOOL)a3
{
  self->_wasStoppedByScrolling = a3;
}

- (unint64_t)playingOnAbsolutePageIndex
{
  return self->_playingOnAbsolutePageIndex;
}

- (void)setPlayingOnAbsolutePageIndex:(unint64_t)a3
{
  self->_playingOnAbsolutePageIndex = a3;
}

- (unint64_t)currentAbsolutePageIndex
{
  return self->_currentAbsolutePageIndex;
}

- (void)setCurrentAbsolutePageIndex:(unint64_t)a3
{
  self->_currentAbsolutePageIndex = a3;
}

- (UISwipeGestureRecognizer)swipeLeftGR
{
  return self->_swipeLeftGR;
}

- (void)setSwipeLeftGR:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 320);
}

- (UISwipeGestureRecognizer)swipeRightGR
{
  return self->_swipeRightGR;
}

- (void)setSwipeRightGR:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 328);
}

@end
