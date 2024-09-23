@implementation THWIOSMovieRep

- (THWIOSMovieRep)initWithLayout:(id)a3 canvas:(id)a4
{
  THWIOSMovieRep *v4;
  THWIOSMovieRep *v5;
  THWIOSMovieRep *v6;
  THWFreeTransformableRepGestureTargetHandler *v7;
  void *v8;
  void *v9;
  void *v10;
  THWFreeTransformableRepGestureTargetHandler *v11;
  THWFreeTransformableRepGestureTargetHandler *freeTransformableHandler;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)THWIOSMovieRep;
  v4 = -[THWIOSMovieRep initWithLayout:canvas:](&v17, "initWithLayout:canvas:", a3, a4);
  v5 = v4;
  if (!v4)
  {
LABEL_7:
    v6 = v5;
    goto LABEL_8;
  }
  v6 = (THWIOSMovieRep *)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep movieInfo](v4, "movieInfo"));

  if (v6)
  {
    v7 = [THWFreeTransformableRepGestureTargetHandler alloc];
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep hostICC](v5, "hostICC"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "widgetHost"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "freeTransformRepHandler"));
    v11 = -[THWFreeTransformableRepGestureTargetHandler initWithFreeTransformableRep:handler:](v7, "initWithFreeTransformableRep:handler:", v5, v10);
    freeTransformableHandler = v5->_freeTransformableHandler;
    v5->_freeTransformableHandler = v11;

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v13, "addObserver:selector:name:object:", v5, "p_moviePlayerNowPlayingWillChange:", CFSTR("THWMPMoviePlayerNowPlayingMovieWillChangeNotification"), 0);

    if (-[THWIOSMovieRep isExpanded](v5, "isExpanded"))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep hostICC](v5, "hostICC"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "delegate"));
      v5->_progressTracker = (BCProgressTrackingRepTracker *)(id)TSUProtocolCast(&OBJC_PROTOCOL___BCProgressTrackingRepTracker, v15);

    }
    else
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep interactiveCanvasController](v5, "interactiveCanvasController"));
      v5->_progressTracker = (BCProgressTrackingRepTracker *)(id)TSUProtocolCast(&OBJC_PROTOCOL___BCProgressTrackingRepTracker, v14);
    }

    goto LABEL_7;
  }
LABEL_8:

  return v6;
}

- (void)dealloc
{
  void *v3;
  AVPlayerViewController *moviePlayerViewController;
  void *v5;
  THWPressableRepGestureTargetHandler *pressableHandler;
  NSArray *childReps;
  THWFreeTransformableRepGestureTargetHandler *freeTransformableHandler;
  objc_super v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  -[THWIOSMovieRep stop](self, "stop");
  moviePlayerViewController = self->_moviePlayerViewController;
  self->_moviePlayerViewController = 0;

  -[THWIOSMovieRep setChildReps:](self, "setChildReps:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep buttonControlRep](self, "buttonControlRep"));
  objc_msgSend(v5, "setDelegate:", 0);

  pressableHandler = self->_pressableHandler;
  self->_pressableHandler = 0;

  childReps = self->_childReps;
  self->_childReps = 0;

  freeTransformableHandler = self->_freeTransformableHandler;
  self->_freeTransformableHandler = 0;

  v9.receiver = self;
  v9.super_class = (Class)THWIOSMovieRep;
  -[THWIOSMovieRep dealloc](&v9, "dealloc");
}

- (BOOL)isPlaying
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep moviePlayerViewController](self, "moviePlayerViewController"));
  v3 = v2 != 0;

  return v3;
}

- (void)play
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  -[THWIOSMovieRep p_play](self, "p_play");
  v4 = objc_opt_class(THWAVTransportController, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep layout](self, "layout"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mediaListener"));
  v7 = TSUDynamicCast(v4, v6);
  v9 = (id)objc_claimAutoreleasedReturnValue(v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[THWAVController sharedController](THWAVController, "sharedController"));
  objc_msgSend(v8, "transportControllerDidStartPlaying:", v9);

}

- (void)pause
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  -[THWIOSMovieRep p_reportProgress](self, "p_reportProgress");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep moviePlayerViewController](self, "moviePlayerViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "player"));
  objc_msgSend(v4, "pause");

  v6 = objc_opt_class(THWAVTransportController, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep layout](self, "layout"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mediaListener"));
  v9 = TSUDynamicCast(v6, v8);
  v11 = (id)objc_claimAutoreleasedReturnValue(v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[THWAVController sharedController](THWAVController, "sharedController"));
  objc_msgSend(v10, "transportControllerDidPausePlaying:", v11);

}

- (void)stop
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  -[THWIOSMovieRep p_stop](self, "p_stop");
  v4 = objc_opt_class(THWAVTransportController, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep layout](self, "layout"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mediaListener"));
  v7 = TSUDynamicCast(v4, v6);
  v9 = (id)objc_claimAutoreleasedReturnValue(v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[THWAVController sharedController](THWAVController, "sharedController"));
  objc_msgSend(v8, "transportControllerDidStopPlaying:", v9);

}

- (THWMovieInfo)movieInfo
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = objc_opt_class(THWMovieInfo, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep info](self, "info"));
  v5 = TSUDynamicCast(v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return (THWMovieInfo *)v6;
}

- (void)setMoviePlayerViewController:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  if (self->_moviePlayerViewController)
    -[THWIOSMovieRep p_teardownPlayerIsTransferringToExpanded:](self, "p_teardownPlayerIsTransferringToExpanded:", 1);
  if (v12)
  {
    objc_storeStrong((id *)&self->_moviePlayerViewController, a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[AVPlayerViewController player](self->_moviePlayerViewController, "player"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentItem"));
    objc_msgSend(v5, "addObserver:selector:name:object:", self, "p_moviePlayerPlaybackDidFinish:", AVPlayerItemDidPlayToEndTimeNotification, v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v8, "addObserver:selector:name:object:", self, "p_vantageDidChange:", CFSTR("THVantageDidChangeNotification"), 0);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep moviePlayerViewController](self, "moviePlayerViewController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "player"));
    objc_msgSend(v10, "addObserver:forKeyPath:options:context:", self, CFSTR("status"), 1, off_538A00);

    -[THWIOSMovieRep setMoviePlayerControllerIsLoaded:](self, "setMoviePlayerControllerIsLoaded:", 1);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep layout](self, "layout"));
  objc_msgSend(v11, "invalidate");

}

- (void)willBeRemoved
{
  void *v3;
  void *v4;
  _QWORD block[5];

  -[THWIOSMovieRep setReparentingView:](self, "setReparentingView:", 0);
  -[THWIOSMovieRep setRemovePosterLayer:](self, "setRemovePosterLayer:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("THVantageDidChangeNotification"), 0);

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_2EA8;
  block[3] = &unk_426D30;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (THWPressableRepGestureTargetHandler)pressableHandler
{
  THWPressableRepGestureTargetHandler *pressableHandler;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  THWPressableRepGestureTargetHandler *v9;
  THWPressableRepGestureTargetHandler *v10;

  pressableHandler = self->_pressableHandler;
  if (!pressableHandler)
  {
    v4 = objc_opt_class(THInteractiveCanvasController, a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep interactiveCanvasController](self, "interactiveCanvasController"));
    v6 = TSUDynamicCast(v4, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "pressHandlerForPressableReps"));
    if (v8)
    {
      v9 = -[THWPressableRepGestureTargetHandler initWithPressableRep:pressHandler:]([THWPressableRepGestureTargetHandler alloc], "initWithPressableRep:pressHandler:", self, v8);
      v10 = self->_pressableHandler;
      self->_pressableHandler = v9;

      -[THWPressableRepGestureTargetHandler setEnabledOnlyIfWidgetInteractionDisabledOnPage:](self->_pressableHandler, "setEnabledOnlyIfWidgetInteractionDisabledOnPage:", 1);
    }

    pressableHandler = self->_pressableHandler;
  }
  return pressableHandler;
}

- (BOOL)directlyManagesLayerContent
{
  return 1;
}

- (BOOL)p_shouldShowPosterImage
{
  void *v3;
  void *v4;
  unsigned __int8 v5;
  unsigned int v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep interactiveCanvasController](self, "interactiveCanvasController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "widgetHost"));
  v5 = objc_msgSend(v4, "repIsPresentedExpanded:", self);

  if (-[THWIOSMovieRep isPlaying](self, "isPlaying") || -[THWIOSMovieRep isInFullscreen](self, "isInFullscreen"))
    v6 = !-[THWIOSMovieRep moviePlayerControllerIsLoaded](self, "moviePlayerControllerIsLoaded");
  else
    LOBYTE(v6) = 1;
  return v6 & (v5 ^ 1);
}

- (void)didUpdateLayer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)THWIOSMovieRep;
  -[THWIOSMovieRep didUpdateLayer:](&v12, "didUpdateLayer:", v4);
  if (-[THWIOSMovieRep p_shouldShowPosterImage](self, "p_shouldShowPosterImage"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep movieInfo](self, "movieInfo"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "posterImageData"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contents"));

    if (!v7 && v6)
      objc_msgSend(v4, "setContents:", +[TSDBitmapImageProvider CGImageForImageData:](TSDBitmapImageProvider, "CGImageForImageData:", v6));

  }
  else
  {
    objc_initWeak(&location, self);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_3184;
    v8[3] = &unk_426D58;
    v9 = v4;
    objc_copyWeak(&v10, &location);
    -[THWIOSMovieRep setRemovePosterLayer:](self, "setRemovePosterLayer:", v8);
    objc_destroyWeak(&v10);

    objc_destroyWeak(&location);
  }
  if (!UIAccessibilityIsInvertColorsEnabled())
    objc_msgSend(v4, "th_accessibilityUndoInvertColorsIfNecessary");

}

- (void)drawInContextWithoutEffects:(CGContext *)a3 withOpacity:(BOOL)a4 forAlphaOnly:(BOOL)a5 drawChildren:(BOOL)a6
{
  -[THWIOSMovieRep drawInContext:](self, "drawInContext:", a3, a4, a5, a6);
}

- (void)drawInContext:(CGContext *)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;

  CGContextSaveGState(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep layout](self, "layout"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "geometry"));
  v7 = TSDRectWithSize(objc_msgSend(v6, "size"));
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v21 = (id)objc_claimAutoreleasedReturnValue(+[TSDImageProviderPool sharedPool](TSDImageProviderPool, "sharedPool"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep movieInfo](self, "movieInfo"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "posterImageData"));
  if (v16)
  {
    v17 = objc_opt_class(TSDBitmapImageProvider, v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "providerForData:shouldValidate:", v16, 1));
    v19 = TSUDynamicCast(v17, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);

    if (v20)
    {
      objc_msgSend(v20, "drawImageInContext:rect:", a3, v7, v9, v11, v13);

    }
  }
  CGContextRestoreGState(a3);

}

- (BOOL)layerUpdatesPaused
{
  if (-[THWIOSMovieRep inFreeTransform](self, "inFreeTransform"))
    return 1;
  else
    return -[THWIOSMovieRep animating](self, "animating");
}

- (void)updateLayerGeometryFromLayout:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v10 = 0u;
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep layout](self, "layout"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "geometry"));
  -[THWIOSMovieRep computeDirectLayerFrame:andTransform:basedOnLayoutGeometry:](self, "computeDirectLayerFrame:andTransform:basedOnLayoutGeometry:", &v13, &v10, v6);

  v7 = v10;
  v8 = v11;
  v9 = v12;
  -[THWIOSMovieRep antiAliasDefeatLayerFrame:forTransform:](self, "antiAliasDefeatLayerFrame:forTransform:", &v13, &v7);
  v7 = v10;
  v8 = v11;
  v9 = v12;
  objc_msgSend(v4, "setIfDifferentFrame:orTransform:", &v7, v13, v14);

}

- (BOOL)wantsFullscreenOnlyDisplay
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  unsigned __int8 v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep movieLayout](self, "movieLayout"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "info"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "geometry"));
  objc_msgSend(v5, "size");
  if (v6 < 150.0)
  {
    v8 = 1;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep pressableHandler](self, "pressableHandler"));
    v8 = objc_msgSend(v7, "widgetInteractionDisabledOnPage");

  }
  return v8;
}

- (BOOL)wantsToHandleTapsWhenLocked
{
  return 1;
}

- (BOOL)shouldShowMediaReplaceUI
{
  return 0;
}

- (id)movieLayout
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = objc_opt_class(THWMovieLayout, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep layout](self, "layout"));
  v5 = TSUDynamicCast(v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

- (void)setChildReps:(id)a3
{
  NSArray *v5;
  NSArray *v6;
  NSArray **p_childReps;
  unsigned __int8 v8;
  NSArray *v9;

  v5 = (NSArray *)a3;
  v6 = v5;
  p_childReps = &self->_childReps;
  if (self->_childReps != v5)
  {
    v9 = v5;
    v8 = -[NSArray isEqualToArray:](v5, "isEqualToArray:");
    v6 = v9;
    if ((v8 & 1) == 0)
    {
      -[NSArray makeObjectsPerformSelector:withObject:](*p_childReps, "makeObjectsPerformSelector:withObject:", "setParentRep:", 0);
      objc_storeStrong((id *)&self->_childReps, a3);
      -[NSArray makeObjectsPerformSelector:withObject:](*p_childReps, "makeObjectsPerformSelector:withObject:", "setParentRep:", self);
      v6 = v9;
    }
  }

}

- (BOOL)isVisibleOnCanvas
{
  void *v3;
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  CGFloat v20;
  _BOOL4 v21;
  CGFloat point;
  CGPoint v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep interactiveCanvasController](self, "interactiveCanvasController"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep interactiveCanvasController](self, "interactiveCanvasController"));
    objc_msgSend(v4, "visibleUnscaledRect");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;

    -[THWIOSMovieRep frameInUnscaledCanvas](self, "frameInUnscaledCanvas");
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v25.origin.x = v6;
    v25.origin.y = v8;
    v25.size.width = v10;
    v25.size.height = v12;
    v29.origin.x = v14;
    v29.origin.y = v16;
    v29.size.width = v18;
    v29.size.height = v20;
    v21 = CGRectIntersectsRect(v25, v29);
    if (v21 && v18 > v10)
    {
      v26.origin.x = v14;
      v26.origin.y = v16;
      v26.size.width = v18;
      v26.size.height = v20;
      point = CGRectGetMidX(v26);
      v27.origin.x = v14;
      v27.origin.y = v16;
      v27.size.width = v18;
      v27.size.height = v20;
      v24.y = CGRectGetMidY(v27);
      v28.origin.x = v6;
      v28.origin.y = v8;
      v28.size.width = v10;
      v28.size.height = v12;
      v24.x = point;
      LOBYTE(v21) = CGRectContainsPoint(v28, v24);
    }
  }
  else
  {
    LOBYTE(v21) = 0;
  }
  return v21;
}

- (BOOL)canHandleGesture:(id)a3
{
  return 0;
}

- (BOOL)handleGesture:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unsigned __int8 v12;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  unsigned int v17;
  void *v18;
  unsigned int v19;
  void *v20;
  void *v21;
  float v22;
  float v23;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep pressableHandler](self, "pressableHandler"));
  v6 = objc_msgSend(v5, "canHandleGesture:", v4);

  if (!v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "gestureKind"));
    v9 = (void *)TSWPImmediatePress;

    if (v8 != v9)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep freeTransformableHandler](self, "freeTransformableHandler"));
      goto LABEL_5;
    }
    v14 = objc_opt_class(UIGestureRecognizer, v10);
    v15 = TSUDynamicCast(v14, v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "view"));
    v17 = objc_msgSend(v16, "isAncestorScrollViewDragging");

    if (v17)
      objc_msgSend(v11, "cancel");
    if (objc_msgSend(v4, "gestureState") == 3)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep autoplayConfig](self, "autoplayConfig"));
      v19 = objc_msgSend(v18, "enabled");

      if (v19)
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep moviePlayerViewController](self, "moviePlayerViewController"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "player"));
        objc_msgSend(v21, "rate");
        v23 = v22;

        if (v23 != 0.0)
        {
          -[THWIOSMovieRep pause](self, "pause");
          goto LABEL_15;
        }
      }
      else if (-[THWIOSMovieRep isPlaying](self, "isPlaying"))
      {
        goto LABEL_15;
      }
      -[THWIOSMovieRep play](self, "play");
    }
LABEL_15:
    v12 = 1;
    goto LABEL_6;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep pressableHandler](self, "pressableHandler"));
LABEL_5:
  v11 = v7;
  v12 = objc_msgSend(v7, "handleGesture:", v4);
LABEL_6:

  return v12;
}

- (void)willBeginHandlingGesture:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep freeTransformableHandler](self, "freeTransformableHandler"));
  objc_msgSend(v5, "willBeginHandlingGesture:", v4);

}

- (BOOL)isExpanded
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep layout](self, "layout"));
  v3 = objc_msgSend(v2, "isExpanded");

  return v3;
}

- (BOOL)meetsStageDimensionRequirementForExpanded
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep layout](self, "layout"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "geometry"));
  objc_msgSend(v3, "size");
  v5 = v4;
  v7 = v6;

  return v7 < 660.0 || v5 < 960.0;
}

- (id)shadowPath
{
  return 0;
}

- (BOOL)freeTransformUseTracedShadowPath
{
  return 1;
}

- (void)freeTransformWillBegin
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep moviePlayerViewController](self, "moviePlayerViewController"));
  objc_msgSend(v3, "setShowsPlaybackControls:", 0);

  -[THWIOSMovieRep setInFreeTransform:](self, "setInFreeTransform:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep interactiveCanvasController](self, "interactiveCanvasController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep buttonControlRep](self, "buttonControlRep"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "layerForRep:", v5));

  if (v6)
  {
    +[CATransaction begin](CATransaction, "begin");
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_3A78;
    v8[3] = &unk_426D30;
    v7 = v6;
    v9 = v7;
    +[CATransaction setCompletionBlock:](CATransaction, "setCompletionBlock:", v8);
    objc_msgSend(v7, "addCABasicOpacityAnimationToValue:duration:removedOnCompletion:", 1, 0.0, 0.25);
    +[CATransaction commit](CATransaction, "commit");

  }
}

- (void)freeTransformDidEndPassedThreshold:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  -[THWIOSMovieRep setInFreeTransform:](self, "setInFreeTransform:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep interactiveCanvasController](self, "interactiveCanvasController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep buttonControlRep](self, "buttonControlRep"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "layerForRep:", v6));

  if (v7)
  {
    +[CATransaction begin](CATransaction, "begin");
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_3BC0;
    v12[3] = &unk_426D30;
    v8 = v7;
    v13 = v8;
    +[CATransaction setCompletionBlock:](CATransaction, "setCompletionBlock:", v12);
    objc_msgSend(v8, "addCABasicOpacityAnimationToValue:duration:removedOnCompletion:", 1, 1.0, 0.25);
    +[CATransaction commit](CATransaction, "commit");

  }
  if (!a3)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep autoplayConfig](self, "autoplayConfig"));
    v10 = objc_msgSend(v9, "enabled") ^ 1;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep moviePlayerViewController](self, "moviePlayerViewController"));
    objc_msgSend(v11, "setShowsPlaybackControls:", v10);

  }
}

- (CGRect)rectForCompletion
{
  void *v3;
  void *v4;
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
  double v18;
  double v19;
  double v20;
  CGRect result;

  if (-[THWIOSMovieRep p_hasValidViewForFreeTransform](self, "p_hasValidViewForFreeTransform"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep moviePlayerViewController](self, "moviePlayerViewController"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "view"));
    objc_msgSend(v4, "frame");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;

  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep layout](self, "layout"));
    objc_msgSend(v3, "frameInParent");
    v6 = v13;
    v8 = v14;
    v10 = v15;
    v12 = v16;
  }

  v17 = v6;
  v18 = v8;
  v19 = v10;
  v20 = v12;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (BOOL)freeTransformShouldMoveAboveStatusBar
{
  return 1;
}

- (BOOL)freeTransformInteractionEnabledOverride
{
  return 1;
}

- (BOOL)expandedPanelStartsVisible
{
  return 0;
}

- (THAnimationController)animationController
{
  THAnimationController *animationController;
  THAnimationController *v4;
  THAnimationController *v5;

  animationController = self->_animationController;
  if (!animationController)
  {
    v4 = objc_alloc_init(THAnimationController);
    v5 = self->_animationController;
    self->_animationController = v4;

    -[THAnimationController addObserver:](self->_animationController, "addObserver:", self);
    -[THAnimationController setSource:](self->_animationController, "setSource:", self);
    animationController = self->_animationController;
  }
  return animationController;
}

- (void)expandableWillPresentExpanded
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = UIAccessibilityIsVoiceOverRunning() || UIAccessibilityIsSwitchControlRunning();
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep moviePlayerViewController](self, "moviePlayerViewController"));
  objc_msgSend(v4, "setShowsPlaybackControls:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep moviePlayerViewController](self, "moviePlayerViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
  objc_msgSend(v6, "setAccessibilityViewIsModal:", 1);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep moviePlayerViewController](self, "moviePlayerViewController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "view"));
  objc_msgSend(v8, "setShouldGroupAccessibilityChildren:", 1);

  v10 = (id)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep interactiveCanvasController](self, "interactiveCanvasController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "canvasView"));
  objc_msgSend(v9, "setAccessibilityElementsHidden:", 1);

}

- (void)expandableExpandedPresentationDidEnd
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep autoplayConfig](self, "autoplayConfig"));
  v4 = objc_msgSend(v3, "enabled") ^ 1;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep moviePlayerViewController](self, "moviePlayerViewController"));
  objc_msgSend(v5, "setShowsPlaybackControls:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep layout](self, "layout"));
  objc_msgSend(v6, "invalidate");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep moviePlayerViewController](self, "moviePlayerViewController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "view"));
  objc_msgSend(v8, "setAccessibilityViewIsModal:", 0);

  UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, self);
  v10 = (id)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep interactiveCanvasController](self, "interactiveCanvasController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "canvasView"));
  objc_msgSend(v9, "setAccessibilityElementsHidden:", 0);

}

- (int64_t)expandedWhitePointAdaptivityStyle
{
  return 3;
}

- (BOOL)p_hasValidViewForFreeTransform
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v13;
  BOOL v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep moviePlayerViewController](self, "moviePlayerViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "view"));
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep moviePlayerViewController](self, "moviePlayerViewController"));
  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep moviePlayerViewController](self, "moviePlayerViewController"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "view"));
    v13 = v6 > 0.0 && v11 != 0;
    v14 = v8 > 0.0 && v13;

  }
  else
  {
    v14 = 1;
  }

  return v14;
}

- (BOOL)shouldAnimateTargetLayer:(id)a3
{
  return 0;
}

- (id)animationLayer
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep freeTransformableHandler](self, "freeTransformableHandler"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "ftc"));
  v5 = objc_msgSend(v4, "isFreeTransformInProgress");

  if (!v5
    || (v6 = (void *)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep freeTransformableHandler](self, "freeTransformableHandler")),
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ftc")),
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "freeTransformLayer")),
        v7,
        v6,
        !v8))
  {
    if (!-[THWIOSMovieRep p_hasValidViewForFreeTransform](self, "p_hasValidViewForFreeTransform")
      || (v9 = (void *)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep moviePlayerViewController](self, "moviePlayerViewController")),
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "view")),
          v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "layer")),
          v10,
          v9,
          !v8))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep interactiveCanvasController](self, "interactiveCanvasController"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "layerForRep:", self));

    }
  }
  return v8;
}

- (id)shadowAnimationLayer
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep freeTransformableHandler](self, "freeTransformableHandler"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "ftc"));
  v5 = objc_msgSend(v4, "isFreeTransformInProgress");

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep freeTransformableHandler](self, "freeTransformableHandler"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ftc"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "shadowLayer"));

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (BOOL)shouldFadeOutAnimationLayer:(id)a3
{
  return 0;
}

- (CGAffineTransform)freeTransform
{
  __int128 v5;
  void *v6;
  void *v7;
  unsigned int v8;
  CGAffineTransform *result;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;

  v5 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&retstr->c = v5;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep freeTransformableHandler](self, "freeTransformableHandler"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ftc"));
  v8 = objc_msgSend(v7, "isFreeTransformInProgress");

  if (v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep freeTransformableHandler](self, "freeTransformableHandler"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "ftc"));
    v12 = v11;
    if (v11)
    {
      objc_msgSend(v11, "currentTransform");
    }
    else
    {
      v14 = 0u;
      v15 = 0u;
      v13 = 0u;
    }
    *(_OWORD *)&retstr->a = v13;
    *(_OWORD *)&retstr->c = v14;
    *(_OWORD *)&retstr->tx = v15;

  }
  return result;
}

- (BOOL)enforceAnimationLayer
{
  return 1;
}

- (BOOL)shouldFadeInTargetLayer:(id)a3
{
  return 0;
}

- (id)targetLayer
{
  void *v2;
  void *v3;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep freeTransformableHandler](self, "freeTransformableHandler"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "ftc"));
  v7 = objc_msgSend(v6, "isFreeTransformInProgress");
  if (v7
    && (v2 = (void *)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep freeTransformableHandler](self, "freeTransformableHandler")),
        v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "ftc")),
        !objc_msgSend(v3, "passedThreshold")))
  {
    v8 = 0;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep animationLayer](self, "animationLayer"));
    if (!v7)
      goto LABEL_7;
  }

LABEL_7:
  return v8;
}

- (CGRect)ftcTargetFrame
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  CGFloat x;
  double v9;
  CGFloat y;
  double v11;
  CGFloat width;
  double v13;
  CGFloat height;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep freeTransformableHandler](self, "freeTransformableHandler"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "ftc"));
  if ((objc_msgSend(v4, "isFreeTransformInProgress") & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep freeTransformableHandler](self, "freeTransformableHandler"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "ftc"));
    objc_msgSend(v6, "completionTargetRect");
    x = v7;
    y = v9;
    width = v11;
    height = v13;

  }
  else
  {
    x = CGRectNull.origin.x;
    y = CGRectNull.origin.y;
    width = CGRectNull.size.width;
    height = CGRectNull.size.height;
  }

  v15 = x;
  v16 = y;
  v17 = width;
  v18 = height;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (void)reparentTargetLayerIfBackedByView:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep reparentingView](self, "reparentingView", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep moviePlayerViewController](self, "moviePlayerViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
  objc_msgSend(v6, "addSubview:", v5);

}

- (void)animationControllerWillPresent:(id)a3
{
  -[THWIOSMovieRep setAnimating:](self, "setAnimating:", 1);
}

- (void)animationControllerDidPresent:(id)a3
{
  THAnimationController *animationController;
  _QWORD block[5];

  animationController = self->_animationController;
  self->_animationController = 0;

  -[THWIOSMovieRep setAnimating:](self, "setAnimating:", 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_4428;
  block[3] = &unk_426D30;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)addChildViewsToArray:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  unsigned int v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;

  v29 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep moviePlayerViewController](self, "moviePlayerViewController"));
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
  if (!v5)
    goto LABEL_4;
  v6 = (void *)v5;
  v7 = -[THWIOSMovieRep moviePlayerControllerIsLoaded](self, "moviePlayerControllerIsLoaded");

  if (v7)
  {
    -[THWIOSMovieRep frameInUnscaledCanvas](self, "frameInUnscaledCanvas");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep interactiveCanvasController](self, "interactiveCanvasController"));
    objc_msgSend(v16, "convertUnscaledToBoundsRect:", v9, v11, v13, v15);
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v24 = v23;

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep moviePlayerViewController](self, "moviePlayerViewController"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "view"));
    objc_msgSend(v26, "setFrame:", v18, v20, v22, v24);

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep moviePlayerViewController](self, "moviePlayerViewController"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "view"));
    objc_msgSend(v29, "addObject:", v28);

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[THWIOSMovieRep p_setMoviePlayerBackgroundColor:animated:](self, "p_setMoviePlayerBackgroundColor:animated:", v4, 0);
LABEL_4:

  }
}

- (BOOL)containerManagesChildView
{
  return 1;
}

- (void)willAddChildView:(id)a3 toView:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD block[5];

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "addSubview:", v7);
  -[THWIOSMovieRep setReparentingView:](self, "setReparentingView:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep moviePlayerViewController](self, "moviePlayerViewController"));
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "view"));

  if (v9 == v7)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_4700;
    block[3] = &unk_426D30;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)willRemoveChildView:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;

  v4 = a3;
  if (v4)
  {
    v7 = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep moviePlayerViewController](self, "moviePlayerViewController"));
    v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));

    v4 = v7;
    if (v6 == v7)
    {
      objc_msgSend(v7, "removeFromSuperview");
      v4 = v7;
    }
  }

}

- (TSDContainerInfo)containerInfo
{
  return 0;
}

- (BOOL)canSelectChildRep:(id)a3
{
  return 0;
}

- (void)updateChildrenFromLayout
{
  id v3;

  if (-[THWIOSMovieRep p_shouldShowPosterImage](self, "p_shouldShowPosterImage"))
  {
    v3 = (id)objc_claimAutoreleasedReturnValue(+[TSDContainerRep childrenFromLayoutInContainerRep:](TSDContainerRep, "childrenFromLayoutInContainerRep:", self));
    -[THWIOSMovieRep setChildReps:](self, "setChildReps:", v3);

  }
  else
  {
    -[THWIOSMovieRep setChildReps:](self, "setChildReps:", 0);
  }
}

- (id)hitRep:(CGPoint)a3 withGesture:(id)a4 passingTest:(id)a5
{
  return +[TSDContainerRep containerRep:hitRep:withGesture:passingTest:](TSDContainerRep, "containerRep:hitRep:withGesture:passingTest:", self, a4, a5, a3.x, a3.y);
}

- (void)control:(id)a3 repWasAdded:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v5 = a4;
  v7 = objc_opt_class(THWButtonControlRep, v6);
  v8 = TSUDynamicCast(v7, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  -[THWIOSMovieRep setButtonControlRep:](self, "setButtonControlRep:", v9);
  v10 = (id)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep buttonControlRep](self, "buttonControlRep"));
  objc_msgSend(v10, "setDelegate:", self);

}

- (void)control:(id)a3 repWillBeRemoved:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep buttonControlRep](self, "buttonControlRep"));

  if (v6 == v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep buttonControlRep](self, "buttonControlRep"));
    objc_msgSend(v7, "setDelegate:", 0);

    -[THWIOSMovieRep setButtonControlRep:](self, "setButtonControlRep:", 0);
  }
}

- (id)buttonControl:(id)a3 imageForState:(int)a4 highlighted:(BOOL)a5
{
  _BOOL4 v5;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  void *v12;

  v5 = a5;
  v7 = THBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = CFSTR("ib_media_btn_small_pause-N");
  if (v5)
    v9 = CFSTR("ib_media_btn_small_pause-P");
  v10 = CFSTR("ib_media_movie_play-P");
  if (!v5)
    v10 = CFSTR("ib_media_movie_play-N");
  if (a4)
    v11 = v9;
  else
    v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[TSUImage imageNamed:inBundle:](TSUImage, "imageNamed:inBundle:", v11, v8));

  return v12;
}

- (void)buttonControlWasPressed:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  void *v7;
  id v8;

  if (-[THWIOSMovieRep wantsFullscreenOnlyDisplay](self, "wantsFullscreenOnlyDisplay", a3))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep interactiveCanvasController](self, "interactiveCanvasController"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep buttonControlRep](self, "buttonControlRep"));
    v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "layerForRep:", v5));

    LODWORD(v6) = 0;
    objc_msgSend(v8, "setOpacity:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep pressableHandler](self, "pressableHandler"));
    objc_msgSend(v7, "spoofGesture");

  }
  else
  {
    -[THWIOSMovieRep play](self, "play");
  }
}

- (void)p_stopAndInvalidate
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  -[THWIOSMovieRep p_reportProgress](self, "p_reportProgress");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep moviePlayerViewController](self, "moviePlayerViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "player"));
  objc_msgSend(v4, "pause");

  v6 = objc_opt_class(THWAVTransportController, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep layout](self, "layout"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mediaListener"));
  v9 = TSUDynamicCast(v6, v8);
  v11 = (id)objc_claimAutoreleasedReturnValue(v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[THWAVController sharedController](THWAVController, "sharedController"));
  objc_msgSend(v10, "transportControllerDidBecomeInvalid:", v11);

}

- (void)p_stop
{
  void *v3;
  id v4;

  -[THWIOSMovieRep p_reportProgress](self, "p_reportProgress");
  v4 = (id)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep moviePlayerViewController](self, "moviePlayerViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "player"));
  objc_msgSend(v3, "pause");

}

- (void)p_pause
{
  void *v3;
  id v4;

  -[THWIOSMovieRep p_reportProgress](self, "p_reportProgress");
  v4 = (id)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep moviePlayerViewController](self, "moviePlayerViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "player"));
  objc_msgSend(v3, "pause");

}

- (void)p_setMoviePlayerBackgroundColor:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void ***v6;
  void ***v7;
  void **v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  THWIOSMovieRep *v12;
  id v13;

  v4 = a4;
  v8 = _NSConcreteStackBlock;
  v9 = 3221225472;
  v10 = sub_4CC0;
  v11 = &unk_426D80;
  v12 = self;
  v5 = a3;
  v13 = v5;
  v6 = objc_retainBlock(&v8);
  v7 = v6;
  if (v4)
    +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v6, 0.25, v8, v9, v10, v11, v12);
  else
    ((void (*)(void ***))v6[2])(v6);

}

- (void)p_play
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  AVPlayerViewController *v15;
  AVPlayerViewController *moviePlayerViewController;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  if (self->_moviePlayerViewController)
  {
    v25 = (id)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep moviePlayerViewController](self, "moviePlayerViewController"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "player"));
    objc_msgSend(v3, "play");
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep movieInfo](self, "movieInfo"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "movieRemoteURL"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[AVPlayerItem playerItemWithURL:](AVPlayerItem, "playerItemWithURL:", v5));
    -[THWIOSMovieRep setPlayerItem:](self, "setPlayerItem:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep playerItem](self, "playerItem"));
    objc_msgSend(v7, "addObserver:selector:name:object:", self, "p_moviePlayerPlaybackDidFinish:", AVPlayerItemDidPlayToEndTimeNotification, v8);

    v9 = objc_alloc((Class)AVPlayer);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep playerItem](self, "playerItem"));
    v25 = objc_msgSend(v9, "initWithPlayerItem:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep movieInfo](self, "movieInfo"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "drmContext"));
    objc_msgSend(v25, "setAllowsExternalPlayback:", objc_msgSend(v12, "kiUanAfQBD5qIUraolUj") ^ 1);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep info](self, "info"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "drmContext"));

    if (objc_msgSend(v3, "kiUanAfQBD5qIUraolUj"))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep playerItem](self, "playerItem"));
      objc_msgSend(v3, "authorizeAVPlayerItemForPlayback:", v14);

    }
    v15 = (AVPlayerViewController *)objc_alloc_init((Class)AVPlayerViewController);
    moviePlayerViewController = self->_moviePlayerViewController;
    self->_moviePlayerViewController = v15;

    -[AVPlayerViewController setAllowsPictureInPicturePlayback:](self->_moviePlayerViewController, "setAllowsPictureInPicturePlayback:", 0);
    -[AVPlayerViewController setPlayer:](self->_moviePlayerViewController, "setPlayer:", v25);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep autoplayConfig](self, "autoplayConfig"));
    v18 = objc_msgSend(v17, "enabled") ^ 1;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep moviePlayerViewController](self, "moviePlayerViewController"));
    objc_msgSend(v19, "setShowsPlaybackControls:", v18);

    -[THWIOSMovieRep setMoviePlayerControllerIsLoaded:](self, "setMoviePlayerControllerIsLoaded:", 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v20, "addObserver:selector:name:object:", self, "p_vantageDidChange:", CFSTR("THVantageDidChangeNotification"), 0);

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep moviePlayerViewController](self, "moviePlayerViewController"));
    objc_msgSend(v21, "postNotificationName:object:", CFSTR("THWMPMoviePlayerNowPlayingMovieWillChangeNotification"), v22);

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep moviePlayerViewController](self, "moviePlayerViewController"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "player"));
    objc_msgSend(v24, "addObserver:forKeyPath:options:context:", self, CFSTR("status"), 1, off_538A00);

  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  char *v15;
  void *v16;
  void *v17;
  objc_super v18;
  _QWORD v19[5];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (off_538A00 == a6 && objc_msgSend(v10, "isEqualToString:", CFSTR("status")))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep moviePlayerViewController](self, "moviePlayerViewController"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "player"));
    v15 = (char *)objc_msgSend(v14, "status");

    if (v15 == (_BYTE *)&dword_0 + 1)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep moviePlayerViewController](self, "moviePlayerViewController"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "player"));
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_524C;
      v19[3] = &unk_426DA8;
      v19[4] = self;
      objc_msgSend(v17, "prerollAtRate:completionHandler:", v19, COERCE_DOUBLE((unint64_t)COERCE_UNSIGNED_INT(1.0)));

    }
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)THWIOSMovieRep;
    -[THWIOSMovieRep observeValueForKeyPath:ofObject:change:context:](&v18, "observeValueForKeyPath:ofObject:change:context:", v10, v11, v12, a6);
  }

}

- (void)p_teardownPlayerIsTransferringToExpanded:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  AVPlayerViewController *moviePlayerViewController;
  id v13;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep moviePlayerViewController](self, "moviePlayerViewController"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v6, "removeObserver:name:object:", self, 0, self->_moviePlayerViewController);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep playerItem](self, "playerItem"));
    objc_msgSend(v7, "removeObserver:name:object:", self, 0, v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[AVPlayerViewController player](self->_moviePlayerViewController, "player"));
    objc_msgSend(v9, "removeObserver:forKeyPath:", self, CFSTR("status"));

    if (!a3)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[AVPlayerViewController player](self->_moviePlayerViewController, "player"));
      objc_msgSend(v10, "pause");

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[AVPlayerViewController view](self->_moviePlayerViewController, "view"));
    objc_msgSend(v11, "removeFromSuperview");

    moviePlayerViewController = self->_moviePlayerViewController;
    self->_moviePlayerViewController = 0;

    -[THWIOSMovieRep setMoviePlayerControllerIsLoaded:](self, "setMoviePlayerControllerIsLoaded:", 0);
  }
  v13 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v13, "removeObserver:name:object:", self, CFSTR("THVantageDidChangeNotification"), 0);

}

- (void)p_vantageDidChange:(id)a3
{
  void *v4;
  unsigned int v5;
  unsigned int v6;
  id v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForKey:", CFSTR("THVantageChangeReason")));

  v5 = objc_msgSend(v7, "isEqualToString:", CFSTR("THVantageChangeReasonRotation"));
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("THVantageChangeReasonScrolling")) & 1) != 0
    || (v6 = objc_msgSend(v7, "isEqualToString:", CFSTR("THVantageChangeReasonPresentationMode"))) != 0)
  {
    v6 = -[THWIOSMovieRep isVisibleOnCanvas](self, "isVisibleOnCanvas");
  }
  if (((v5 | v6) & 1) == 0)
    -[THWIOSMovieRep p_pause](self, "p_pause");

}

- (void)p_moviePlayerNowPlayingWillChange:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep moviePlayerViewController](self, "moviePlayerViewController"));
  if (v4)
  {
    v5 = (void *)v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "object"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep moviePlayerViewController](self, "moviePlayerViewController"));

    if (v6 != v7)
    {
      -[THWIOSMovieRep p_teardownPlayerIsTransferringToExpanded:](self, "p_teardownPlayerIsTransferringToExpanded:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep layout](self, "layout"));
      objc_msgSend(v8, "invalidate");

    }
  }

}

- (void)p_moviePlayerPlaybackDidFinish:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  CMTimeEpoch epoch;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AVPlayerViewController player](self->_moviePlayerViewController, "player"));
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentItem"));
  if (!v6)
    goto LABEL_11;
  v7 = (void *)v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[AVPlayerViewController player](self->_moviePlayerViewController, "player"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "currentItem"));

  if (v8 == v10)
  {
    -[THWIOSMovieRep p_reportProgress](self, "p_reportProgress");
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep movieInfo](self, "movieInfo"));
    if (objc_msgSend(v5, "loopOption"))
    {
      if (objc_msgSend(v5, "loopOption") != (char *)&dword_0 + 1)
      {
LABEL_11:

        goto LABEL_12;
      }
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep moviePlayerViewController](self, "moviePlayerViewController"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "player"));
      v17 = *(_OWORD *)&kCMTimeZero.value;
      epoch = kCMTimeZero.epoch;
      objc_msgSend(v12, "seekToTime:", &v17);

      v13 = (void *)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep moviePlayerViewController](self, "moviePlayerViewController"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "player"));
      objc_msgSend(v14, "play");

    }
    else
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep moviePlayerViewController](self, "moviePlayerViewController"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "player"));
      v17 = *(_OWORD *)&kCMTimeZero.value;
      epoch = kCMTimeZero.epoch;
      objc_msgSend(v16, "seekToTime:", &v17);

      if (-[THWIOSMovieRep isInFullscreen](self, "isInFullscreen")
        && !-[THWIOSMovieRep animatedFromFullscreen](self, "animatedFromFullscreen")
        || -[THWIOSMovieRep inFreeTransform](self, "inFreeTransform"))
      {
        goto LABEL_11;
      }
      -[THWIOSMovieRep setAnimatedFromFullscreen:](self, "setAnimatedFromFullscreen:", 0);
      -[THWIOSMovieRep p_teardownPlayerIsTransferringToExpanded:](self, "p_teardownPlayerIsTransferringToExpanded:", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep layout](self, "layout"));
      objc_msgSend(v13, "invalidate");
    }

    goto LABEL_11;
  }
LABEL_12:

}

- (void)buttonControl:(id)a3 didUpdateLayer:(id)a4
{
  id v4;

  v4 = a4;
  objc_msgSend(v4, "setMinificationFilter:", kCAFilterTrilinear);
  objc_msgSend(v4, "setMagnificationFilter:", kCAFilterTrilinear);

}

- (CALayer)pressableAnimationLayer
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep interactiveCanvasController](self, "interactiveCanvasController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "layerForRep:", self));

  return (CALayer *)v4;
}

- (CALayer)pressableAnimationShadowLayer
{
  return 0;
}

- (BOOL)wantsPressAction
{
  _BOOL4 v3;

  if (-[THWIOSMovieRep meetsStageDimensionRequirementForExpanded](self, "meetsStageDimensionRequirementForExpanded")
    || (v3 = -[THWIOSMovieRep wantsFullscreenOnlyDisplay](self, "wantsFullscreenOnlyDisplay")))
  {
    LOBYTE(v3) = -[THWIOSMovieRep pressableAction](self, "pressableAction") != 0;
  }
  return v3;
}

- (BOOL)shouldRecognizePressOnRep:(id)a3
{
  void *v3;
  char v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep layout](self, "layout", a3));
  v4 = objc_msgSend(v3, "isExpanded") ^ 1;

  return v4;
}

- (int)pressableAction
{
  void *v2;
  int v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep autoplayConfig](self, "autoplayConfig"));
  if (objc_msgSend(v2, "enabled"))
    v3 = 0;
  else
    v3 = 2;

  return v3;
}

- (BOOL)widgetInteractionAllowOnPageForCompact
{
  return 1;
}

- (BOOL)widgetInteractionAllowAutoplayForCompact
{
  return 1;
}

- (double)p_percentElapsed
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double Seconds;
  double v15;
  CMTime time;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep moviePlayerViewController](self, "moviePlayerViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "player"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep movieInfo](self, "movieInfo"));
    objc_msgSend(v5, "endTime");
    v7 = v6;
    objc_msgSend(v5, "startTime");
    v9 = v7 - v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep moviePlayerViewController](self, "moviePlayerViewController"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "player"));
    v12 = v11;
    if (v11)
      objc_msgSend(v11, "currentTime");
    else
      memset(&time, 0, sizeof(time));
    Seconds = CMTimeGetSeconds(&time);

    objc_msgSend(v5, "startTime");
    if (v9 == 0.0)
      v13 = 0.0;
    else
      v13 = (Seconds - v15) / v9;

  }
  else
  {
    v13 = 0.0;
  }

  return v13;
}

- (void)p_reportProgress
{
  double v3;
  BCProgressTrackingRepTracker *progressTracker;
  id v5;

  -[THWIOSMovieRep p_percentElapsed](self, "p_percentElapsed");
  if (v3 != 0.0)
  {
    progressTracker = self->_progressTracker;
    v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    -[BCProgressTrackingRepTracker progressDidChangeForRep:percent:](progressTracker, "progressDidChangeForRep:percent:", self, v5);

  }
}

- (THWAutoplayConfig)autoplayConfig
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep info](self, "info"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "autoplayConfig"));

  return (THWAutoplayConfig *)v3;
}

- (BOOL)autoplayAllowed
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep pressableHandler](self, "pressableHandler"));
  v3 = objc_msgSend(v2, "widgetInteractionAllowAutoplay");

  return v3;
}

- (void)autoplayStart
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  float v7;
  float v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  __int128 v18;
  CMTimeEpoch epoch;

  v3 = objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep moviePlayerViewController](self, "moviePlayerViewController"));
  if (!v3)
    goto LABEL_3;
  v4 = (void *)v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep moviePlayerViewController](self, "moviePlayerViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "player"));
  objc_msgSend(v6, "rate");
  v8 = v7;

  if (v8 == 0.0)
  {
LABEL_3:
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep moviePlayerViewController](self, "moviePlayerViewController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "player"));
    v18 = *(_OWORD *)&kCMTimeZero.value;
    epoch = kCMTimeZero.epoch;
    objc_msgSend(v10, "seekToTime:", &v18);

    -[THWIOSMovieRep p_play](self, "p_play");
    v12 = objc_opt_class(THWAVTransportController, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep layout](self, "layout"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "mediaListener"));
    v15 = TSUDynamicCast(v12, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[THWAVController sharedController](THWAVController, "sharedController"));
    objc_msgSend(v17, "transportControllerDidStartAutoplaying:", v16);

  }
}

- (void)autoplayStop
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  CMTimeEpoch epoch;

  if (-[THWIOSMovieRep isPlaying](self, "isPlaying"))
  {
    -[THWIOSMovieRep p_pause](self, "p_pause");
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep moviePlayerViewController](self, "moviePlayerViewController"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "player"));
    v12 = *(_OWORD *)&kCMTimeZero.value;
    epoch = kCMTimeZero.epoch;
    objc_msgSend(v4, "seekToTime:", &v12);

    v6 = objc_opt_class(THWAVTransportController, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[THWIOSMovieRep layout](self, "layout"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mediaListener"));
    v9 = TSUDynamicCast(v6, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[THWAVController sharedController](THWAVController, "sharedController"));
    objc_msgSend(v11, "transportControllerDidStopAutoplaying:", v10);

  }
}

- (void)autoplayPause
{
  if (-[THWIOSMovieRep isPlaying](self, "isPlaying"))
    -[THWIOSMovieRep p_pause](self, "p_pause");
}

- (THWFreeTransformableRepGestureTargetHandler)freeTransformableHandler
{
  return self->_freeTransformableHandler;
}

- (AVPlayerViewController)moviePlayerViewController
{
  return self->_moviePlayerViewController;
}

- (AVPlayerItem)playerItem
{
  return self->_playerItem;
}

- (void)setPlayerItem:(id)a3
{
  objc_storeStrong((id *)&self->_playerItem, a3);
}

- (BOOL)handlingPress
{
  return self->_handlingPress;
}

- (void)setHandlingPress:(BOOL)a3
{
  self->_handlingPress = a3;
}

- (BOOL)tracksScore
{
  return self->_tracksScore;
}

- (NSArray)childReps
{
  return self->_childReps;
}

- (THWButtonControlRep)buttonControlRep
{
  return self->_buttonControlRep;
}

- (void)setButtonControlRep:(id)a3
{
  self->_buttonControlRep = (THWButtonControlRep *)a3;
}

- (void)setPressableHandler:(id)a3
{
  objc_storeStrong((id *)&self->_pressableHandler, a3);
}

- (BOOL)animating
{
  return self->_animating;
}

- (void)setAnimating:(BOOL)a3
{
  self->_animating = a3;
}

- (BOOL)inFreeTransform
{
  return self->_inFreeTransform;
}

- (void)setInFreeTransform:(BOOL)a3
{
  self->_inFreeTransform = a3;
}

- (UIView)reparentingView
{
  return self->_reparentingView;
}

- (void)setReparentingView:(id)a3
{
  self->_reparentingView = (UIView *)a3;
}

- (BOOL)isInFullscreen
{
  return self->_isInFullscreen;
}

- (void)setIsInFullscreen:(BOOL)a3
{
  self->_isInFullscreen = a3;
}

- (BOOL)animatedFromFullscreen
{
  return self->_animatedFromFullscreen;
}

- (void)setAnimatedFromFullscreen:(BOOL)a3
{
  self->_animatedFromFullscreen = a3;
}

- (BOOL)moviePlayerControllerIsLoaded
{
  return self->_moviePlayerControllerIsLoaded;
}

- (void)setMoviePlayerControllerIsLoaded:(BOOL)a3
{
  self->_moviePlayerControllerIsLoaded = a3;
}

- (id)removePosterLayer
{
  return self->_removePosterLayer;
}

- (void)setRemovePosterLayer:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 336);
}

- (BCProgressTrackingRepTracker)progressTracker
{
  return self->_progressTracker;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_removePosterLayer, 0);
  objc_storeStrong((id *)&self->_pressableHandler, 0);
  objc_storeStrong((id *)&self->_childReps, 0);
  objc_storeStrong((id *)&self->_playerItem, 0);
  objc_storeStrong((id *)&self->_moviePlayerViewController, 0);
  objc_storeStrong((id *)&self->_freeTransformableHandler, 0);
  objc_storeStrong((id *)&self->_animationController, 0);
}

@end
