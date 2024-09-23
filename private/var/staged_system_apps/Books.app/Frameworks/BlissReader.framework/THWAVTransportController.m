@implementation THWAVTransportController

+ (void)createTransportControllerForLayouts:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  double v11;
  void *v12;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(a3);
        v8 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v7);
        v9 = objc_opt_class(THWMovieLayout);
        *(_QWORD *)&v11 = TSUDynamicCast(v9, v8).n128_u64[0];
        if (v10)
        {
          v12 = v10;
          if (!objc_msgSend(v10, "mediaListener", v11))
          {
            v13 = objc_msgSend(+[THWAVController sharedController](THWAVController, "sharedController"), "newTransportController");
            objc_msgSend(v13, "setMovieLayout:", v12);
            objc_msgSend(v12, "setMediaListener:", v13);

          }
        }
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16, v11);
    }
    while (v5);
  }
}

+ (id)transportControllerLayoutsForLayouts:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  __objc2_class **p_superclass;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  double v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  double v20;
  void *v21;
  void *v22;
  THWButtonControlLayout *v23;
  THWAVTransportLayout *v24;
  id v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];

  v4 = +[NSMutableArray array](NSMutableArray, "array");
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v28;
    p_superclass = &OBJC_METACLASS___THHighlightLine.superclass;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v28 != v7)
          objc_enumerationMutation(a3);
        v10 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)v9);
        v11 = objc_opt_class(THWMovieLayout);
        *(_QWORD *)&v13 = TSUDynamicCast(v11, v10).n128_u64[0];
        if (v12)
        {
          v14 = v12;
          if (!objc_msgSend(v12, "mediaListener", v13))
          {
            v15 = objc_msgSend(+[THWAVController sharedController](THWAVController, "sharedController"), "newTransportController");
            objc_msgSend(v15, "setMovieLayout:", v14);
            objc_msgSend(v14, "setMediaListener:", v15);

          }
          v16 = objc_opt_class(p_superclass + 254);
          TSUDynamicCast(v16, objc_msgSend(v14, "mediaListener"));
          v18 = v17;
          v19 = objc_opt_class(THWMovieInfo);
          *(_QWORD *)&v20 = TSUDynamicCast(v19, objc_msgSend(v14, "info")).n128_u64[0];
          v22 = v21;
          if ((!objc_msgSend(v21, "isAudioOnly", v20)
             || objc_msgSend(v22, "isAudioOnly")
             && objc_msgSend(v22, "controlStyle") == 1
             && !objc_msgSend(v22, "posterImageData"))
            && !objc_msgSend(v18, "transportLayout"))
          {
            if ((objc_msgSend(v22, "isAudioOnly") & 1) != 0
              || (objc_msgSend(v14, "isExpanded") & 1) != 0
              || objc_msgSend(v22, "autoplayConfig")
              && (objc_msgSend(objc_msgSend(v22, "autoplayConfig"), "enabled") & 1) != 0)
            {
              v23 = 0;
            }
            else
            {
              v23 = -[THWControlLayout initWithTag:]([THWButtonControlLayout alloc], "initWithTag:", 0);
              -[THWButtonControlLayout invalidateFrame](v23, "invalidateFrame");
            }
            v24 = objc_alloc_init(THWAVTransportLayout);
            -[THWAVTransportLayout invalidateFrame](v24, "invalidateFrame");
            objc_msgSend(v18, "setPlayButtonLayout:", v23);
            objc_msgSend(v18, "setTransportLayout:", v24);
            -[THWAVTransportLayout setTransportController:](v24, "setTransportController:", v18);

            p_superclass = (__objc2_class **)(&OBJC_METACLASS___THHighlightLine + 8);
          }
          objc_msgSend(v4, "addObjectsFromArray:", objc_msgSend(objc_msgSend(v14, "mediaListener"), "controlLayouts"));
        }
        v9 = (char *)v9 + 1;
      }
      while (v6 != v9);
      v25 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v27, v31, 16, v13);
      v6 = v25;
    }
    while (v25);
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "p_hideUI:", self);
  -[THWAVTransportController p_cancelExitExpandedTimer](self, "p_cancelExitExpandedTimer");

  -[THWAVTransportLayout setTransportController:](self->_transportLayout, "setTransportController:", 0);
  v3.receiver = self;
  v3.super_class = (Class)THWAVTransportController;
  -[THWAVTransportController dealloc](&v3, "dealloc");
}

- (BOOL)isCompact
{
  uint64_t v3;
  double v4;
  void *v5;
  void *v6;

  v3 = objc_opt_class(THInteractiveCanvasController);
  *(_QWORD *)&v4 = TSUDynamicCast(v3, objc_msgSend(objc_msgSend(-[THWAVTransportLayout layoutController](-[THWAVTransportController transportLayout](self, "transportLayout"), "layoutController"), "canvas"), "canvasController")).n128_u64[0];
  v6 = v5;
  if ((objc_msgSend(v5, "isCompactWidth", v4) & 1) != 0)
    return 1;
  else
    return objc_msgSend(v6, "isCompactHeight");
}

- (double)onCanvasScale
{
  uint64_t v3;
  void *v4;
  double v5;
  double result;

  v3 = objc_opt_class(THInteractiveCanvasController);
  *(_QWORD *)&v5 = TSUDynamicCast(v3, objc_msgSend(objc_msgSend(-[THWAVTransportLayout layoutController](-[THWAVTransportController transportLayout](self, "transportLayout"), "layoutController"), "canvas"), "canvasController")).n128_u64[0];
  if (!v4)
    return 1.0;
  objc_msgSend(v4, "viewScale", v5);
  return result;
}

- (void)showTransportHUDFor:(id)a3
{
  uint64_t v5;
  double v6;
  id v7;

  v5 = objc_opt_class(THInteractiveCanvasController);
  *(_QWORD *)&v6 = TSUDynamicCast(v5, objc_msgSend(objc_msgSend(-[THWAVTransportLayout layoutController](-[THWAVTransportController transportLayout](self, "transportLayout"), "layoutController"), "canvas"), "canvasController")).n128_u64[0];
  -[THWAVTransportController setCurrentHudHost:](self, "setCurrentHudHost:", objc_msgSend(objc_msgSend(objc_msgSend(v7, "layerHost", v6), "viewController"), "im_ancestorViewControllerConformingToProtocol:", &OBJC_PROTOCOL___THHUDHosting));
  -[THHUDHosting showHUDForVendor:](-[THWAVTransportController currentHudHost](self, "currentHudHost"), "showHUDForVendor:", a3);
}

- (void)hideTransportHUDFor:(id)a3
{
  -[THHUDHosting hideHUDForVendor:](-[THWAVTransportController currentHudHost](self, "currentHudHost"), "hideHUDForVendor:", a3);
}

- (CGRect)frameOfHUDFor:(id)a3
{
  uint64_t v5;
  double v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGRect result;

  v5 = objc_opt_class(THInteractiveCanvasController);
  *(_QWORD *)&v6 = TSUDynamicCast(v5, objc_msgSend(objc_msgSend(-[THWAVTransportLayout layoutController](-[THWAVTransportController transportLayout](self, "transportLayout"), "layoutController"), "canvas"), "canvasController")).n128_u64[0];
  objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(v7, "layerHost", v6), "viewController"), "im_ancestorViewControllerConformingToProtocol:", &OBJC_PROTOCOL___THHUDHosting), "frameForHUDFromVendor:", a3);
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (void)viewScaleDidChange
{
  _BOOL8 v3;

  v3 = -[THWAVTransportController isCompact](self, "isCompact");
  if (v3 != -[THWAVTransportController isCurrentlyCompact](self, "isCurrentlyCompact"))
  {
    -[THWAVTransportController setIsCurrentlyCompact:](self, "setIsCurrentlyCompact:", v3);
    -[THWAVTransportUI compactnessChanged](-[THWAVTransportController transportUI](self, "transportUI"), "compactnessChanged");
  }
}

- (id)controlLayouts
{
  id v3;

  v3 = +[NSMutableArray array](NSMutableArray, "array");
  if (-[THWAVTransportController playButtonLayout](self, "playButtonLayout"))
    objc_msgSend(v3, "addObject:", -[THWAVTransportController playButtonLayout](self, "playButtonLayout"));
  if (-[THWAVTransportController transportLayout](self, "transportLayout"))
    objc_msgSend(v3, "addObject:", -[THWAVTransportController transportLayout](self, "transportLayout"));
  return v3;
}

- (void)control:(id)a3 repWasAdded:(id)a4
{
  uint64_t v6;
  double v7;
  id v8;

  if (!objc_msgSend(a3, "tag"))
  {
    v6 = objc_opt_class(THWButtonControlRep);
    *(_QWORD *)&v7 = TSUDynamicCast(v6, a4).n128_u64[0];
    objc_msgSend(v8, "setDelegate:", self, v7);
  }
}

- (void)createTransportUI
{
  if (!self->_transportUI)
  {
    if (objc_msgSend(-[THWMovieLayout movieInfo](-[THWAVTransportController movieLayout](self, "movieLayout"), "movieInfo"), "isAudioOnly"))-[THWAVTransportController setTransportUI:](self, "setTransportUI:", -[THWAVTransportUI initWithTransportController:]([THWAVAudioUI alloc], "initWithTransportController:", self));
    else
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWAVTransportController createTransportUI]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Movie/THWAVTransportController.m"), 248, CFSTR("Should never be asked to create a transport UI in this case"));
  }
}

- (id)playButtonRep
{
  uint64_t v3;
  id result;

  v3 = objc_opt_class(THWButtonControlRep);
  TSUDynamicCast(v3, objc_msgSend(objc_msgSend(-[THWButtonControlLayout layoutController](-[THWAVTransportController playButtonLayout](self, "playButtonLayout"), "layoutController"), "canvas"), "repForLayout:", -[THWAVTransportController playButtonLayout](self, "playButtonLayout")));
  return result;
}

- (THWAudioRep)audioRep
{
  uint64_t v3;
  THWAudioRep *result;

  v3 = objc_opt_class(THWAudioRep);
  TSUDynamicCast(v3, objc_msgSend(objc_msgSend(-[THWMovieLayout layoutController](-[THWAVTransportController movieLayout](self, "movieLayout"), "layoutController"), "canvas"), "repForLayout:", -[THWAVTransportController movieLayout](self, "movieLayout")));
  return result;
}

- (id)movieRep
{
  uint64_t v3;
  id result;

  v3 = objc_opt_class(THWIOSMovieRep);
  TSUDynamicCast(v3, objc_msgSend(objc_msgSend(-[THWMovieLayout layoutController](-[THWAVTransportController movieLayout](self, "movieLayout"), "layoutController"), "canvas"), "repForLayout:", -[THWAVTransportController movieLayout](self, "movieLayout")));
  return result;
}

- (TSKDocumentRoot)documentRoot
{
  TSKDocumentRoot *result;

  result = -[THWAVTransportController audioRep](self, "audioRep");
  if (result)
    return (TSKDocumentRoot *)objc_msgSend(-[THWAudioRep interactiveCanvasController](-[THWAVTransportController audioRep](self, "audioRep"), "interactiveCanvasController"), "documentRoot");
  return result;
}

- (id)computeLayoutGeometryForTransportLayout:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;

  -[THWMovieLayout validate](-[THWAVTransportController movieLayout](self, "movieLayout", a3), "validate");
  v4 = TSDRectWithSize(objc_msgSend(-[THWMovieLayout geometry](-[THWAVTransportController movieLayout](self, "movieLayout"), "geometry"), "size"));
  return objc_msgSend(objc_alloc((Class)TSDLayoutGeometry), "initWithFrame:", v4, v5, v6, v7);
}

- (id)layoutGeometryForLayout:(id)a3
{
  void *v4;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  v4 = (void *)TSUProtocolCast(&OBJC_PROTOCOL___THWControl, a3);
  if (!v4 || objc_msgSend(v4, "tag"))
    return 0;
  v6 = TSDRectWithSize(objc_msgSend(-[THWMovieLayout geometry](-[THWAVTransportController movieLayout](self, "movieLayout"), "geometry"), "size"));
  v8 = v7;
  v10 = v9;
  v12 = v11;
  if (-[THWAVTransportController shouldShowPlayButton](self, "shouldShowPlayButton"))
  {
    v6 = v6 + (v10 + -86.0) * 0.5;
    v8 = v8 + (v12 + -86.0) * 0.5;
    v13 = 86.0;
  }
  else
  {
    v13 = 0.1;
  }
  return objc_msgSend(objc_alloc((Class)TSDLayoutGeometry), "initWithFrame:", v6, v8, v13, v13);
}

- (id)buttonControl:(id)a3 imageForState:(int)a4 highlighted:(BOOL)a5
{
  _BOOL4 v5;
  uint64_t v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;

  v5 = a5;
  v7 = THBundle();
  v8 = CFSTR("ib_media_btn_small_pause-N");
  if (v5)
    v8 = CFSTR("ib_media_btn_small_pause-P");
  v9 = CFSTR("ib_media_movie_play-N");
  if (v5)
    v9 = CFSTR("ib_media_movie_play-P");
  if (a4)
    v10 = v8;
  else
    v10 = v9;
  return +[TSUImage imageNamed:inBundle:](TSUImage, "imageNamed:inBundle:", v10, v7);
}

- (void)buttonControlWasPressed:(id)a3
{
  id v5;

  v5 = objc_msgSend(a3, "layout");
  if (!objc_msgSend(v5, "tag"))
  {
    if (objc_msgSend(a3, "state"))
    {
      -[THWAVTransportController pause](self, "pause");
    }
    else
    {
      -[THWAVTransportController play](self, "play");
      -[THWAVTransportController duration](self, "duration");
      -[THWAVTransportController durationChanged:](self, "durationChanged:");
    }
    objc_msgSend(v5, "invalidateFrame");
    -[THWMovieLayout invalidate](-[THWAVTransportController movieLayout](self, "movieLayout"), "invalidate");
  }
}

- (void)buttonControl:(id)a3 didUpdateLayer:(id)a4
{
  objc_msgSend(a4, "setMinificationFilter:", kCAFilterTrilinear);
  objc_msgSend(a4, "setMagnificationFilter:", kCAFilterTrilinear);
}

- (void)timeChanged:(double)a3
{
  -[THWAVTransportUI timeChanged:](-[THWAVTransportController transportUI](self, "transportUI"), "timeChanged:", a3);
}

- (void)durationChanged:(double)a3
{
  -[THWAVTransportUI durationChanged:](-[THWAVTransportController transportUI](self, "transportUI"), "durationChanged:", a3);
}

- (void)rateChanged:(double)a3
{
  -[THWAVTransportController configurePlayButtonForRate:](self, "configurePlayButtonForRate:");
  -[THWAVTransportUI rateChanged:](-[THWAVTransportController transportUI](self, "transportUI"), "rateChanged:", a3);
  if (-[THWAVTransportController isStopped](self, "isStopped"))
    -[THWButtonControlLayout invalidateFrame](-[THWAVTransportController playButtonLayout](self, "playButtonLayout"), "invalidateFrame");
  if (a3 == 0.0)
  {
    if (-[THWAVTransportController movieIsAtEnd](self, "movieIsAtEnd"))
      -[THWAVTransportController moviePlayedToEnd](self, "moviePlayedToEnd");
  }
}

- (void)mediaDidPlayToEnd
{
  -[THWAVTransportUI mediaDidPlayToEnd](-[THWAVTransportController transportUI](self, "transportUI"), "mediaDidPlayToEnd");
}

- (void)mediaWillBeRemoved
{
  -[THWAVTransportController p_cancelExitExpandedTimer](self, "p_cancelExitExpandedTimer");
  objc_msgSend(+[THWAVController sharedController](THWAVController, "sharedController"), "transportControllerDidBecomeInvalid:", self);
  -[THWAVTransportController setDelegate:](self, "setDelegate:", 0);
}

- (void)mediaWasPressed
{
  _QWORD activity_block[5];

  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472;
  activity_block[2] = sub_1B6834;
  activity_block[3] = &unk_426DD0;
  activity_block[4] = self;
  _os_activity_initiate(&dword_0, "Media Pressed", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

- (void)willExitExpandedShouldPause:(BOOL)a3
{
  _BOOL4 v3;
  double v5;

  v3 = a3;
  -[THWAVTransportController p_cancelExitExpandedTimer](self, "p_cancelExitExpandedTimer");
  objc_msgSend(objc_msgSend(-[THWMovieLayout info](-[THWAVTransportController movieLayout](self, "movieLayout"), "info"), "geometry"), "size");
  if (-[THWAVTransportUI shouldPlayOnMainCanvasWithSize:](-[THWAVTransportController transportUI](self, "transportUI"), "shouldPlayOnMainCanvasWithSize:", v5))
  {
    if (v3)
      -[THWAVTransportController pause](self, "pause");
  }
  else
  {
    -[THWAVTransportController stop](self, "stop");
  }
}

- (void)didExitExpanded
{
  -[THWAVTransportController setDelegate:](self, "setDelegate:", 0);
}

- (void)moviePlayedToEnd
{
  if (-[THWAVTransportController delegate](self, "delegate"))
  {
    if (!-[THWAVTransportController exitingExpanded](self, "exitingExpanded"))
      -[THWAVTransportController p_cancelExitExpandedTimer](self, "p_cancelExitExpandedTimer");
  }
}

- (BOOL)movieIsAtEnd
{
  double v3;
  double v4;
  double v5;

  -[THWAVTransportController duration](self, "duration");
  v4 = v3;
  -[THWAVTransportController currentTime](self, "currentTime");
  return v4 - v5 < 0.2;
}

- (BOOL)isStopped
{
  return 1;
}

- (double)duration
{
  double v3;
  double v4;
  double v5;

  objc_msgSend(-[THWMovieLayout movieInfo](-[THWAVTransportController movieLayout](self, "movieLayout"), "movieInfo"), "endTime");
  v4 = v3;
  objc_msgSend(-[THWMovieLayout movieInfo](-[THWAVTransportController movieLayout](self, "movieLayout"), "movieInfo"), "startTime");
  return v4 - v5;
}

- (double)currentTime
{
  double result;

  if (!-[THWAVTransportController audioRep](self, "audioRep"))
    return 0.0;
  -[THWAudioRep currentTime](-[THWAVTransportController audioRep](self, "audioRep"), "currentTime");
  return result;
}

- (BOOL)movieIsPlaying
{
  THWAudioRep *v3;

  v3 = -[THWAVTransportController audioRep](self, "audioRep");
  if (v3)
    LOBYTE(v3) = -[THWAudioRep isPlaying](-[THWAVTransportController audioRep](self, "audioRep"), "isPlaying");
  return (char)v3;
}

- (void)toggleMute
{
  unsigned int v3;

  v3 = -[THWAVTransportController isMuted](self, "isMuted");
  if (-[THWAVTransportController audioRep](self, "audioRep"))
    -[THWAudioRep setMuted:](-[THWAVTransportController audioRep](self, "audioRep"), "setMuted:", v3 ^ 1);
}

- (BOOL)isMuted
{
  THWAudioRep *v3;

  v3 = -[THWAVTransportController audioRep](self, "audioRep");
  if (v3)
    LOBYTE(v3) = -[THWAudioRep isMuted](-[THWAVTransportController audioRep](self, "audioRep"), "isMuted");
  return (char)v3;
}

- (void)play
{
  _QWORD activity_block[5];

  if (-[THWAVTransportController audioRep](self, "audioRep"))
  {
    activity_block[0] = _NSConcreteStackBlock;
    activity_block[1] = 3221225472;
    activity_block[2] = sub_1B6B54;
    activity_block[3] = &unk_426DD0;
    activity_block[4] = self;
    _os_activity_initiate(&dword_0, "Audio Rep Play", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
  }
}

- (void)pause
{
  _QWORD activity_block[5];

  if (-[THWAVTransportController audioRep](self, "audioRep"))
  {
    activity_block[0] = _NSConcreteStackBlock;
    activity_block[1] = 3221225472;
    activity_block[2] = sub_1B6BE4;
    activity_block[3] = &unk_426DD0;
    activity_block[4] = self;
    _os_activity_initiate(&dword_0, "Audio Rep Pause", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
  }
}

- (void)stop
{
  _QWORD v3[5];
  _QWORD activity_block[5];

  if (-[THWAVTransportController audioRep](self, "audioRep"))
  {
    activity_block[0] = _NSConcreteStackBlock;
    activity_block[1] = 3221225472;
    activity_block[2] = sub_1B6CC8;
    activity_block[3] = &unk_426DD0;
    activity_block[4] = self;
    _os_activity_initiate(&dword_0, "Audio Rep Stop", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
  }
  if (-[THWAVTransportController movieRep](self, "movieRep"))
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_1B6CE0;
    v3[3] = &unk_426DD0;
    v3[4] = self;
    _os_activity_initiate(&dword_0, "Movie Rep Stop", OS_ACTIVITY_FLAG_DEFAULT, v3);
  }
  -[THWAVTransportUI mediaDidStop](-[THWAVTransportController transportUI](self, "transportUI"), "mediaDidStop");
}

- (void)togglePlayPause
{
  _QWORD activity_block[5];

  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472;
  activity_block[2] = sub_1B6D5C;
  activity_block[3] = &unk_426DD0;
  activity_block[4] = self;
  _os_activity_initiate(&dword_0, "Toggle Play Pause", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

- (void)changeCurrentTimeTo:(double)a3
{
  if (-[THWAVTransportController audioRep](self, "audioRep"))
    -[THWAudioRep changeCurrentTimeTo:](-[THWAVTransportController audioRep](self, "audioRep"), "changeCurrentTimeTo:", a3);
}

- (void)exitExpanded
{
  -[THWAVTransportController setExitingExpanded:](self, "setExitingExpanded:", 1);
  if (!-[THWAVTransportController delegate](self, "delegate"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWAVTransportController exitExpanded]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Movie/THWAVTransportController.m"), 640, CFSTR("invalid nil value for '%s'"), "self.delegate");
  -[THWAVTransportControllerDelegate exitAVPresentation:](-[THWAVTransportController delegate](self, "delegate"), "exitAVPresentation:", self);
  -[THWAVTransportController p_cancelExitExpandedTimer](self, "p_cancelExitExpandedTimer");
  if (!-[THWMovieLayout isIntroMedia](-[THWAVTransportController movieLayout](self, "movieLayout"), "isIntroMedia"))
    -[THWAVTransportController setDelegate:](self, "setDelegate:", 0);
  -[THWAVTransportController setExitingExpanded:](self, "setExitingExpanded:", 0);
}

- (int)controlStyle
{
  return objc_msgSend(-[THWMovieLayout movieInfo](-[THWAVTransportController movieLayout](self, "movieLayout"), "movieInfo"), "controlStyle");
}

- (void)p_cancelExitExpandedTimer
{
  -[NSTimer invalidate](-[THWAVTransportController exitExpandedTimer](self, "exitExpandedTimer"), "invalidate");
  -[THWAVTransportController setExitExpandedTimer:](self, "setExitExpandedTimer:", 0);
}

- (THWButtonControlLayout)playButtonLayout
{
  return self->_playButtonLayout;
}

- (void)setPlayButtonLayout:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (THWMovieLayout)movieLayout
{
  return self->_movieLayout;
}

- (void)setMovieLayout:(id)a3
{
  self->_movieLayout = (THWMovieLayout *)a3;
}

- (THWAVTransportLayout)transportLayout
{
  return self->_transportLayout;
}

- (void)setTransportLayout:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (THWAVTransportUI)transportUI
{
  return self->_transportUI;
}

- (void)setTransportUI:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (THWAVTransportControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (THWAVTransportControllerDelegate *)a3;
}

- (NSTimer)exitExpandedTimer
{
  return self->_exitExpandedTimer;
}

- (void)setExitExpandedTimer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (BOOL)exitingExpanded
{
  return self->_exitingExpanded;
}

- (void)setExitingExpanded:(BOOL)a3
{
  self->_exitingExpanded = a3;
}

- (BOOL)isCurrentlyCompact
{
  return self->_isCurrentlyCompact;
}

- (void)setIsCurrentlyCompact:(BOOL)a3
{
  self->_isCurrentlyCompact = a3;
}

- (THHUDHosting)currentHudHost
{
  return self->_currentHudHost;
}

- (void)setCurrentHudHost:(id)a3
{
  self->_currentHudHost = (THHUDHosting *)a3;
}

@end
