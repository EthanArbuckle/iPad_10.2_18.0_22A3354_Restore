@implementation THWSceneController

- (THWSceneController)initWithSceneInfo:(id)a3 frame:(CGRect)a4 delegate:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  THWSceneController *v11;
  THWSceneController *v12;
  objc_super v14;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v14.receiver = self;
  v14.super_class = (Class)THWSceneController;
  v11 = -[THWSceneController init](&v14, "init");
  v12 = v11;
  if (v11)
  {
    -[THWSceneController setSceneInfo:](v11, "setSceneInfo:", a3);
    -[THWSceneController setSceneFrame:](v12, "setSceneFrame:", x, y, width, height);
    -[THWSceneController setDelegate:](v12, "setDelegate:", a5);
  }
  return v12;
}

- (void)stopAnimation
{
  -[THWSceneView removeCameraAnimation](-[THWSceneController sceneView](self, "sceneView"), "removeCameraAnimation");
  -[THWSceneView stop:](-[THWSceneController sceneView](self, "sceneView"), "stop:", self);
}

- (void)dealloc
{
  objc_super v3;

  -[THWSceneView setDelegate:](self->_sceneView, "setDelegate:", 0);
  -[THWSceneController setSceneInfo:](self, "setSceneInfo:", 0);
  -[THWSceneController setSceneView:](self, "setSceneView:", 0);

  self->_cameraControlEventHandler = 0;
  -[THWSceneController setScene:](self, "setScene:", 0);
  -[THWSceneController setSceneWidgetTimeStamp:](self, "setSceneWidgetTimeStamp:", 0);
  -[THWSceneController setSingleTapGR:](self, "setSingleTapGR:", 0);
  v3.receiver = self;
  v3.super_class = (Class)THWSceneController;
  -[THWSceneController dealloc](&v3, "dealloc");
}

- (id)sceneLayer
{
  if (-[THWSceneController isLoaded](self, "isLoaded"))
    return -[THWSceneView layer](-[THWSceneController sceneView](self, "sceneView"), "layer");
  else
    return 0;
}

- (void)p_configureDiagnosticOverlayLayer
{
  NSUserDefaults *v3;

  v3 = +[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults");
  -[THWSceneView setShowsStatistics:](-[THWSceneController sceneView](self, "sceneView"), "setShowsStatistics:", -[NSUserDefaults BOOLForKey:](v3, "BOOLForKey:", kTHSceneWidgetFPSOverlayKey[0]));
}

- (void)p_addIdleAnimation
{
  unsigned int v3;

  v3 = -[THWSceneInfo idleAnimationBehavior](-[THWSceneController sceneInfo](self, "sceneInfo"), "idleAnimationBehavior");
  if (v3)
  {
    if (v3 == 1)
      -[THWSceneView rotateCameraContinuouslyWithEaseIn](-[THWSceneController sceneView](self, "sceneView"), "rotateCameraContinuouslyWithEaseIn");
    else
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWSceneController p_addIdleAnimation]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Scene/THWSceneController.m"), 250, CFSTR("Unrecognized idle animation behavior: %d"), -[THWSceneInfo idleAnimationBehavior](-[THWSceneController sceneInfo](self, "sceneInfo"), "idleAnimationBehavior"));
  }
}

- (BOOL)yFovFixed
{
  double v3;

  if (!-[THWSceneController sceneView](self, "sceneView"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWSceneController yFovFixed]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Scene/THWSceneController.m"), 262, CFSTR("invalid nil value for '%s'"), "self.sceneView");
  objc_msgSend(objc_msgSend(-[THWSceneView pointOfView](-[THWSceneController sceneView](self, "sceneView"), "pointOfView"), "camera"), "yFov");
  return v3 != 0.0;
}

- (BOOL)shouldFillSize:(CGSize)a3 withinSize:(CGSize)a4
{
  double height;
  double width;
  double v6;
  double v7;
  double v9;
  BOOL result;

  height = a4.height;
  width = a4.width;
  v6 = a3.height;
  v7 = a3.width;
  if (!-[THWSceneController sceneView](self, "sceneView"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWSceneController shouldFillSize:withinSize:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Scene/THWSceneController.m"), 280, CFSTR("invalid nil value for '%s'"), "self.sceneView");
  objc_msgSend(objc_msgSend(-[THWSceneView pointOfView](-[THWSceneController sceneView](self, "sceneView"), "pointOfView"), "camera"), "yFov");
  result = v9 != 0.0;
  if (v7 / v6 < width / height)
    return v9 == 0.0;
  return result;
}

- (void)p_pauseIdleAnimationForRotation:(BOOL)a3
{
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWSceneController p_pauseIdleAnimationForRotation:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Scene/THWSceneController.m"), 314, CFSTR("Manipulating UI outside main thread."));
  if (-[THWSceneView scene](-[THWSceneController sceneView](self, "sceneView"), "scene"))
  {
    -[THWSceneView removeCameraAnimation](-[THWSceneController sceneView](self, "sceneView"), "removeCameraAnimation");
    -[THWSceneView pause:](-[THWSceneController sceneView](self, "sceneView"), "pause:", self);
    if (!a3)
      -[THWSceneController setUserInterruptedAnimation:](self, "setUserInterruptedAnimation:", 1);
  }
  else
  {
    -[THWSceneController setPlaySceneWhenLoaded:](self, "setPlaySceneWhenLoaded:", 0);
  }
  -[THWSceneController setIsPlaying:](self, "setIsPlaying:", 0);
}

- (void)pauseIdleAnimation
{
  -[THWSceneController p_pauseIdleAnimationForRotation:](self, "p_pauseIdleAnimationForRotation:", 0);
}

- (void)pauseIdleAnimationForRotation
{
  -[THWSceneController p_pauseIdleAnimationForRotation:](self, "p_pauseIdleAnimationForRotation:", 1);
}

- (void)playIdleAnimation
{
  if (!-[THWSceneController isPlaying](self, "isPlaying")
    && -[THWSceneView scene](-[THWSceneController sceneView](self, "sceneView"), "scene")
    && -[THWSceneControllerDelegate sceneControllerShouldAllowIdleAnimation:](-[THWSceneController delegate](self, "delegate"), "sceneControllerShouldAllowIdleAnimation:", self))
  {
    -[THWSceneController setIsPlaying:](self, "setIsPlaying:", 1);
    if (-[THWSceneController hasEmbeddedAnimation](self, "hasEmbeddedAnimation"))
      -[THWSceneView play:](-[THWSceneController sceneView](self, "sceneView"), "play:");
    else
      -[THWSceneController p_addIdleAnimation](self, "p_addIdleAnimation");
  }
}

- (void)resumeIdleAnimationIfNecessary
{
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWSceneController resumeIdleAnimationIfNecessary]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Scene/THWSceneController.m"), 366, CFSTR("Manipulating UI outside main thread."));
  if (-[THWSceneController isLoaded](self, "isLoaded")
    && -[THWSceneView scene](-[THWSceneController sceneView](self, "sceneView"), "scene"))
  {
    if (!-[THWSceneController userInterruptedAnimation](self, "userInterruptedAnimation"))
      -[THWSceneController playIdleAnimation](self, "playIdleAnimation");
  }
  else
  {
    -[THWSceneController setPlaySceneWhenLoaded:](self, "setPlaySceneWhenLoaded:", 1);
  }
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  -[THWSceneView setUserInteractionEnabled:](-[THWSceneController sceneView](self, "sceneView"), "setUserInteractionEnabled:", a3);
}

- (BOOL)userInteractionEnabled
{
  return -[THWSceneView isUserInteractionEnabled](-[THWSceneController sceneView](self, "sceneView"), "isUserInteractionEnabled");
}

- (void)p_setupSceneViewWithCancelHandler:(id)a3
{
  THWSceneView *v5;
  double v6;
  id v7;
  double v8;
  SCNScene *v9;
  THWSceneView *v10;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWSceneController p_setupSceneViewWithCancelHandler:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Scene/THWSceneController.m"), 409, CFSTR("Manipulating UI outside main thread."));
  -[THWSceneController setPlaySceneWhenLoaded:](self, "setPlaySceneWhenLoaded:", 0);
  -[THWSceneController setUserInterruptedAnimation:](self, "setUserInterruptedAnimation:", 0);
  v5 = [THWSceneView alloc];
  -[THWSceneController sceneFrame](self, "sceneFrame");
  v10 = -[THWSceneView initWithFrame:options:](v5, "initWithFrame:options:", 0);
  -[THWSceneView setBackgroundColor:](v10, "setBackgroundColor:", objc_msgSend(-[THWSceneControllerDelegate backgroundColorForSceneController:](-[THWSceneController delegate](self, "delegate"), "backgroundColorForSceneController:", self), "platformColor"));
  -[THWSceneControllerDelegate screenScaleForSceneController:](-[THWSceneController delegate](self, "delegate"), "screenScaleForSceneController:", self);
  objc_msgSend(-[THWSceneView layer](v10, "layer"), "setContentsScale:", v6);
  v7 = -[THWSceneView layer](v10, "layer");
  LODWORD(v8) = 0;
  objc_msgSend(v7, "setOpacity:", v8);
  -[THWSceneController setSceneView:](self, "setSceneView:", v10);
  v9 = -[THWSceneController scene](self, "scene");
  -[THWSceneView setDelegate:](-[THWSceneController sceneView](self, "sceneView"), "setDelegate:", self);
  if (v9)
  {
    -[THWSceneView scnWarmUpScene:abortHandler:](v10, "scnWarmUpScene:abortHandler:", v9, a3);
    +[SCNTransaction begin](SCNTransaction, "begin");
    -[THWSceneView setScene:](v10, "setScene:", v9);
    +[SCNTransaction commit](SCNTransaction, "commit");
  }
  -[THWSceneController setScene:](self, "setScene:", 0);

}

- (void)setupSceneView
{
  _QWORD v3[5];

  if (!self->_sceneView)
  {
    if (self->_scene)
    {
      v3[0] = _NSConcreteStackBlock;
      v3[1] = 3221225472;
      v3[2] = sub_19972C;
      v3[3] = &unk_42A8D0;
      v3[4] = self;
      -[THWSceneController p_setupSceneViewWithCancelHandler:](self, "p_setupSceneViewWithCancelHandler:", v3);
      -[THWSceneController p_didCreateView](self, "p_didCreateView");
    }
  }
}

- (void)p_crossfadeLayerOut:(id)a3 fadeLayerIn:(id)a4 completion:(id)a5
{
  CABasicAnimation *v8;
  double v9;
  CABasicAnimation *v10;
  double v11;
  _QWORD v12[5];

  if (!a3)
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWSceneController p_crossfadeLayerOut:fadeLayerIn:completion:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Scene/THWSceneController.m"), 471, CFSTR("invalid nil value for '%s'"), "fadeOutLayer");
    if (a4)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWSceneController p_crossfadeLayerOut:fadeLayerIn:completion:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Scene/THWSceneController.m"), 472, CFSTR("invalid nil value for '%s'"), "fadeInLayer");
    goto LABEL_3;
  }
  if (!a4)
    goto LABEL_5;
LABEL_3:
  +[CATransaction begin](CATransaction, "begin");
  +[CATransaction setAnimationDuration:](CATransaction, "setAnimationDuration:", 0.15);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_199968;
  v12[3] = &unk_427830;
  v12[4] = a5;
  +[CATransaction setCompletionBlock:](CATransaction, "setCompletionBlock:", v12);
  v8 = +[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("opacity"));
  LODWORD(v9) = 1.0;
  -[CABasicAnimation setToValue:](v8, "setToValue:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v9));
  -[CABasicAnimation setRemovedOnCompletion:](v8, "setRemovedOnCompletion:", 0);
  -[CABasicAnimation setFillMode:](v8, "setFillMode:", kCAFillModeForwards);
  objc_msgSend(a4, "addAnimation:forKey:", v8, CFSTR("opacity"));
  v10 = +[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("opacity"));
  LODWORD(v11) = 0.5;
  -[CABasicAnimation setToValue:](v10, "setToValue:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v11));
  -[CABasicAnimation setRemovedOnCompletion:](v10, "setRemovedOnCompletion:", 0);
  -[CABasicAnimation setFillMode:](v10, "setFillMode:", kCAFillModeForwards);
  objc_msgSend(a3, "addAnimation:forKey:", v10, CFSTR("opacity"));
  +[CATransaction commit](CATransaction, "commit");
}

- (void)didAddSceneView
{
  id v3;
  unsigned int v4;
  double v5;
  void **v6;
  uint64_t v7;
  id (*v8)(uint64_t, double);
  void *v9;
  id v10;
  THWSceneController *v11;

  v3 = -[THWSceneControllerDelegate placeholderLayerForSceneController:](-[THWSceneController delegate](self, "delegate"), "placeholderLayerForSceneController:", self);
  v4 = -[THWSceneControllerDelegate sceneControllerShouldAllowCrossfade:](-[THWSceneController delegate](self, "delegate"), "sceneControllerShouldAllowCrossfade:", self);
  v6 = _NSConcreteStackBlock;
  *(_QWORD *)&v5 = 3221225472;
  v7 = 3221225472;
  v8 = sub_199A40;
  v9 = &unk_426E28;
  v10 = v3;
  v11 = self;
  if (v4
    && v3
    && (objc_msgSend(v3, "isHidden", v6, v7, v8, v9, v10, v11) & 1) == 0
    && (objc_msgSend(v3, "opacity"), *(float *)&v5 > 0.0))
  {
    -[THWSceneController p_crossfadeLayerOut:fadeLayerIn:completion:](self, "p_crossfadeLayerOut:fadeLayerIn:completion:", v3, -[THWSceneView layer](-[THWSceneController sceneView](self, "sceneView"), "layer"), &v6);
  }
  else
  {
    sub_199A40((uint64_t)&v6, v5);
  }
}

- (void)setFrame:(CGRect)a3
{
  -[THWSceneController setFrame:overrideDisabled:](self, "setFrame:overrideDisabled:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)setFrame:(CGRect)a3 overrideDisabled:(BOOL)a4
{
  double height;
  double width;
  double y;
  double x;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  THWSceneView *v13;
  THWSceneView *v14;
  double v15;
  double v16;
  unsigned int v17;
  const CALayerContentsGravity *v18;
  CGRect v19;
  CGRect v20;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (a4 || !self->_disableFrameUpdate)
  {
    -[THWSceneController sceneFrame](self, "sceneFrame");
    v20.origin.x = v9;
    v20.origin.y = v10;
    v20.size.width = v11;
    v20.size.height = v12;
    v19.origin.x = x;
    v19.origin.y = y;
    v19.size.width = width;
    v19.size.height = height;
    if (!CGRectEqualToRect(v19, v20))
    {
      -[THWSceneController setSceneFrame:](self, "setSceneFrame:", x, y, width, height);
      v13 = -[THWSceneController sceneView](self, "sceneView");
      if (v13)
      {
        v14 = v13;
        -[THWSceneView frame](v13, "frame");
        v17 = -[THWSceneController shouldFillSize:withinSize:](self, "shouldFillSize:withinSize:", v15, v16, width, height);
        v18 = &kCAGravityResizeAspectFill;
        if (!v17)
          v18 = &kCAGravityResizeAspect;
        objc_msgSend(-[THWSceneView layer](v14, "layer"), "setContentsGravity:", *v18);
        -[THWSceneView setFrame:](v14, "setFrame:", x, y, width, height);
        -[THWSceneView setNeedsDisplay](-[THWSceneController sceneView](self, "sceneView"), "setNeedsDisplay");
      }
    }
  }
}

- (void)loadSceneDeferred
{
  _QWORD v3[6];

  if (-[THWSceneController isLoaded](self, "isLoaded"))
  {
    if (!-[THWSceneController isLoaded](self, "isLoaded"))
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWSceneController loadSceneDeferred]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Scene/THWSceneController.m"), 602, CFSTR("should already be loaded if background loading isn't supported"));
  }
  else
  {
    if (-[THWSceneController isLoading](self, "isLoading"))
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWSceneController loadSceneDeferred]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Scene/THWSceneController.m"), 572, CFSTR("already loading widget"));
    -[THWSceneController setIsLoading:](self, "setIsLoading:", 1);
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_199D34;
    v3[3] = &unk_426E28;
    v3[4] = objc_msgSend(-[THWSceneControllerDelegate documentRootForSceneController:](-[THWSceneController delegate](self, "delegate"), "documentRootForSceneController:", self), "accessController");
    v3[5] = self;
    objc_msgSend(+[TSKLowPriorityThreadDispatcher sharedLowPriorityDispatcher](TSKLowPriorityThreadDispatcher, "sharedLowPriorityDispatcher"), "dispatch:", v3);
  }
}

- (void)loadScene
{
  THWSceneInfo *v3;
  id v4;

  if (-[THWSceneController isLoaded](self, "isLoaded"))
  {
    if (!-[THWSceneController isLoaded](self, "isLoaded"))
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWSceneController loadScene]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Scene/THWSceneController.m"), 628, CFSTR("should already be loaded if background loading isn't supported"));
  }
  else
  {
    if (-[THWSceneController isLoading](self, "isLoading"))
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWSceneController loadScene]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Scene/THWSceneController.m"), 610, CFSTR("already loading widget"));
    -[THWSceneController setIsLoading:](self, "setIsLoading:", 1);
    v3 = -[THWSceneController sceneInfo](self, "sceneInfo");
    if (v3)
      v4 = -[THWSceneController p_loadSceneFromURL:](self, "p_loadSceneFromURL:", -[THWSceneInfo sourceURL](v3, "sourceURL"));
    else
      v4 = 0;
    -[THWSceneController setIsLoading:](self, "setIsLoading:", 0);
    -[THWSceneController setIsLoaded:](self, "setIsLoaded:", 1);
    -[THWSceneController setScene:](self, "setScene:", v4);
    -[THWSceneControllerDelegate sceneDidLoadForSceneController:](-[THWSceneController delegate](self, "delegate"), "sceneDidLoadForSceneController:", self);
  }
}

- (id)p_loadSceneFromURL:(id)a3
{
  NSNumber *v5;
  uint64_t v6;
  NSNumber *v7;
  NSNumber *v8;
  uint64_t v9;
  NSNumber *v10;
  uint64_t v11;
  NSNumber *v12;
  NSDictionary *v13;
  id v14;
  id v15;
  THWSceneController *v17;
  _QWORD v18[7];
  _QWORD v19[4];
  _QWORD v20[7];

  if (a3 && (objc_msgSend(a3, "isFileURL") & 1) != 0)
  {
    v17 = self;
    if (!-[NSFileManager fileExistsAtPath:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileExistsAtPath:", objc_msgSend(a3, "path")))objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWSceneController p_loadSceneFromURL:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Scene/THWSceneController.m"), 639, CFSTR("Could not find file: %@"), a3);
    v5 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1);
    v6 = SCNSceneSourceSkipConsistencyCheckKey;
    v7 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1);
    v8 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1);
    v9 = SCNSceneSourceCreateCameraIfAbsentKey;
    v10 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1);
    v11 = SCNSceneSourceCreateLightIfAbsentKey;
    v12 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1);
    v13 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v5, v6, v7, SCNSceneSourceCreateNormalsIfAbsentKey, v8, v9, v10, v11, v12, SCNSceneSourceAdjustInvalidCameraClippingPlanesKey, 0);
    v20[0] = 0;
    v20[1] = v20;
    v20[2] = 0x3052000000;
    v20[3] = sub_19A2DC;
    v20[4] = sub_19A2EC;
    v20[5] = 0;
    v19[0] = 0;
    v19[1] = v19;
    v19[2] = 0x2020000000;
    v19[3] = 0;
    v14 = objc_msgSend(objc_alloc((Class)SCNSceneSource), "initWithURL:options:", a3, v13);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_19A2F8;
    v18[3] = &unk_42A8F8;
    v18[5] = v19;
    v18[6] = v20;
    v18[4] = v17;
    v15 = objc_msgSend(v14, "sceneWithOptions:statusHandler:", v13, v18);
    -[THWSceneController setHasEmbeddedAnimation:](v17, "setHasEmbeddedAnimation:", objc_msgSend(objc_msgSend(v14, "IDsOfEntriesWithClass:", objc_opt_class(CAAnimation)), "count") != 0);
    _Block_object_dispose(v19, 8);
    _Block_object_dispose(v20, 8);
  }
  else
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWSceneController p_loadSceneFromURL:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Scene/THWSceneController.m"), 636, CFSTR("Expected sourceURL to be a local file-based URL"));
    return 0;
  }
  return v15;
}

- (void)p_cleanupFailedLoad
{
  -[THWSceneView stop:](-[THWSceneController sceneView](self, "sceneView"), "stop:", self);
}

- (void)p_setupCameraBehavior
{
  unsigned int v3;
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id v10;

  -[THWSceneController setCameraControlEventHandler:](self, "setCameraControlEventHandler:", -[THWSCNCameraControlEventHandler initWithSceneController:]([THWSCNCameraControlEventHandler alloc], "initWithSceneController:", self));
  -[THWSceneView setEventHandler:](-[THWSceneController sceneView](self, "sceneView"), "setEventHandler:", -[THWSceneController cameraControlEventHandler](self, "cameraControlEventHandler"));
  v3 = -[THWSceneInfo rotationConstraints](-[THWSceneController sceneInfo](self, "sceneInfo"), "rotationConstraints");
  if (v3)
  {
    if (v3 == 2)
    {
      v6 = -[THWSceneView eventHandler](-[THWSceneController sceneView](self, "sceneView"), "eventHandler");
      v7 = objc_opt_class(SCNCameraControlEventHandler);
      if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
        -[THWSceneView setEventHandlerStickyAxis:](-[THWSceneController sceneView](self, "sceneView"), "setEventHandlerStickyAxis:", 2);
    }
    else if (v3 == 1)
    {
      v4 = -[THWSceneView eventHandler](-[THWSceneController sceneView](self, "sceneView"), "eventHandler");
      v5 = objc_opt_class(SCNCameraControlEventHandler);
      if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
        objc_msgSend(-[THWSceneView eventHandler](-[THWSceneController sceneView](self, "sceneView"), "eventHandler"), "setGimbalLockMode:", 1);
    }
    else
    {
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWSceneController p_setupCameraBehavior]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Scene/THWSceneController.m"), 706, CFSTR("Unrecognized rotation constraint: %d"), -[THWSceneInfo rotationConstraints](-[THWSceneController sceneInfo](self, "sceneInfo"), "rotationConstraints"));
    }
  }
  v8 = -[THWSceneView eventHandler](-[THWSceneController sceneView](self, "sceneView"), "eventHandler");
  v9 = objc_opt_class(SCNCameraControlEventHandler);
  if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
  {
    v10 = -[THWSceneView eventHandler](-[THWSceneController sceneView](self, "sceneView"), "eventHandler");
    objc_msgSend(v10, "setEnableInertia:", 1);
    objc_msgSend(v10, "setFriction:", *(double *)&THWSceneInertialDampingNormal);
  }
}

- (void)handleSingleTapInSceneView
{
  -[THWSceneControllerDelegate handleSingleTapInSceneForSceneController:](-[THWSceneController delegate](self, "delegate"), "handleSingleTapInSceneForSceneController:", self);
}

- (void)p_setupGestureRecognizers
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  void *v19;
  void *v20;
  THWSceneController *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  -[THWSceneController setSingleTapGR:](self, "setSingleTapGR:", objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "handleSingleTapInSceneView"));
  -[THWSceneView addGestureRecognizer:](-[THWSceneController sceneView](self, "sceneView"), "addGestureRecognizer:", -[THWSceneController singleTapGR](self, "singleTapGR"));
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v21 = self;
  v3 = objc_msgSend(-[THWSceneView eventHandler](-[THWSceneController sceneView](self, "sceneView"), "eventHandler"), "gestureRecognizers");
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v23;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v23 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)v7);
        v9 = objc_opt_class(UIPinchGestureRecognizer);
        if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
          objc_msgSend(v8, "setEnabled:", 0);
        v10 = objc_opt_class(UILongPressGestureRecognizer);
        if ((objc_opt_isKindOfClass(v8, v10) & 1) != 0)
          objc_msgSend(v8, "setEnabled:", 0);
        v11 = objc_opt_class(UIPanGestureRecognizer);
        if ((objc_opt_isKindOfClass(v8, v11) & 1) != 0)
        {
          v12 = objc_opt_class(UIPanGestureRecognizer);
          *(_QWORD *)&v13 = TSUDynamicCast(v12, v8).n128_u64[0];
          v15 = v14;
          if (objc_msgSend(v14, "minimumNumberOfTouches", v13) == (char *)&dword_0 + 1
            && (unint64_t)objc_msgSend(v15, "maximumNumberOfTouches") >= 2)
          {
            objc_msgSend(v15, "setMaximumNumberOfTouches:", 1);
          }
        }
        v16 = objc_opt_class(UITapGestureRecognizer);
        if ((objc_opt_isKindOfClass(v8, v16) & 1) != 0)
        {
          v17 = objc_opt_class(UITapGestureRecognizer);
          *(_QWORD *)&v18 = TSUDynamicCast(v17, v8).n128_u64[0];
          v20 = v19;
          if (objc_msgSend(v19, "numberOfTapsRequired", v18) == (char *)&dword_0 + 2)
            -[UITapGestureRecognizer requireGestureRecognizerToFail:](-[THWSceneController singleTapGR](v21, "singleTapGR"), "requireGestureRecognizerToFail:", v20);
        }
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v5);
  }
}

- (void)p_didCreateView
{
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWSceneController p_didCreateView]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Scene/THWSceneController.m"), 758, CFSTR("Manipulating UI outside main thread."));
  if (-[THWSceneView scene](-[THWSceneController sceneView](self, "sceneView"), "scene"))
  {
    -[THWSceneController p_setupCameraBehavior](self, "p_setupCameraBehavior");
    if (-[THWSceneController playSceneWhenLoaded](self, "playSceneWhenLoaded"))
    {
      -[THWSceneController setPlaySceneWhenLoaded:](self, "setPlaySceneWhenLoaded:", 0);
      -[THWSceneController resumeIdleAnimationIfNecessary](self, "resumeIdleAnimationIfNecessary");
    }
    -[THWSceneController p_configureDiagnosticOverlayLayer](self, "p_configureDiagnosticOverlayLayer");
  }
  else
  {
    -[THWSceneController p_cleanupFailedLoad](self, "p_cleanupFailedLoad");
  }
}

- (void)renderer:(id)a3 didRenderScene:(id)a4 atTime:(double)a5
{
  self->_hasRendered = 1;
}

- (THWSceneControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (THWSceneControllerDelegate *)a3;
}

- (THPageAffordanceHosting)canvasPageAffordanceHost
{
  return self->_canvasPageAffordanceHost;
}

- (void)setCanvasPageAffordanceHost:(id)a3
{
  self->_canvasPageAffordanceHost = (THPageAffordanceHosting *)a3;
}

- (BOOL)disableFrameUpdate
{
  return self->_disableFrameUpdate;
}

- (void)setDisableFrameUpdate:(BOOL)a3
{
  self->_disableFrameUpdate = a3;
}

- (BOOL)hasRendered
{
  return self->_hasRendered;
}

- (THWSceneView)sceneView
{
  return self->_sceneView;
}

- (void)setSceneView:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (THWSceneInfo)sceneInfo
{
  return self->_sceneInfo;
}

- (void)setSceneInfo:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (BOOL)isPlaying
{
  return self->_isPlaying;
}

- (void)setIsPlaying:(BOOL)a3
{
  self->_isPlaying = a3;
}

- (UITapGestureRecognizer)singleTapGR
{
  return self->_singleTapGR;
}

- (void)setSingleTapGR:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (BOOL)playSceneWhenLoaded
{
  return self->_playSceneWhenLoaded;
}

- (void)setPlaySceneWhenLoaded:(BOOL)a3
{
  self->_playSceneWhenLoaded = a3;
}

- (BOOL)userInterruptedAnimation
{
  return self->_userInterruptedAnimation;
}

- (void)setUserInterruptedAnimation:(BOOL)a3
{
  self->_userInterruptedAnimation = a3;
}

- (BOOL)hasEmbeddedAnimation
{
  return self->_hasEmbeddedAnimation;
}

- (void)setHasEmbeddedAnimation:(BOOL)a3
{
  self->_hasEmbeddedAnimation = a3;
}

- (BOOL)shouldStopLoading
{
  return self->_shouldStopLoading;
}

- (void)setShouldStopLoading:(BOOL)a3
{
  self->_shouldStopLoading = a3;
}

- (BOOL)isLoading
{
  return self->_isLoading;
}

- (void)setIsLoading:(BOOL)a3
{
  self->_isLoading = a3;
}

- (BOOL)isLoaded
{
  return self->_isLoaded;
}

- (void)setIsLoaded:(BOOL)a3
{
  self->_isLoaded = a3;
}

- (SCNScene)scene
{
  return self->_scene;
}

- (void)setScene:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (BOOL)animating
{
  return self->_animating;
}

- (void)setAnimating:(BOOL)a3
{
  self->_animating = a3;
}

- (CGRect)sceneFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_sceneFrame.origin.x;
  y = self->_sceneFrame.origin.y;
  width = self->_sceneFrame.size.width;
  height = self->_sceneFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setSceneFrame:(CGRect)a3
{
  self->_sceneFrame = a3;
}

- (NSDate)sceneWidgetTimeStamp
{
  return self->_sceneWidgetTimeStamp;
}

- (void)setSceneWidgetTimeStamp:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- (THWSCNCameraControlEventHandler)cameraControlEventHandler
{
  return self->_cameraControlEventHandler;
}

- (void)setCameraControlEventHandler:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

@end
