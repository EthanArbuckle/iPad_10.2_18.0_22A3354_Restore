@implementation THWWebRep

- (THWWebRep)initWithLayout:(id)a3 canvas:(id)a4
{
  THWWebRep *v4;
  THWWebRep *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  THWPressableRepGestureTargetHandler *v11;
  void *v12;
  THWFreeTransformableRepGestureTargetHandler *v13;
  void *v14;
  void *v15;
  void *v16;
  THWFreeTransformableRepGestureTargetHandler *v17;
  THWFreeTransformableRepGestureTargetHandler *freeTransformableHandler;
  CGSize size;
  void *v20;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)THWWebRep;
  v4 = -[THWWebRep initWithLayout:canvas:](&v22, "initWithLayout:canvas:", a3, a4);
  v5 = v4;
  if (v4)
  {
    v4->_ownsWebView = 1;
    v6 = objc_opt_class(THInteractiveCanvasController);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebRep interactiveCanvasController](v5, "interactiveCanvasController"));
    TSUDynamicCast(v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "pressHandlerForPressableReps"));
    if (v10)
    {
      v11 = -[THWPressableRepGestureTargetHandler initWithPressableRep:pressHandler:]([THWPressableRepGestureTargetHandler alloc], "initWithPressableRep:pressHandler:", v5, v10);
      -[THWWebRep setPressableHandler:](v5, "setPressableHandler:", v11);

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebRep pressableHandler](v5, "pressableHandler"));
      objc_msgSend(v12, "setEnabledOnlyIfWidgetInteractionDisabledOnPage:", 1);

    }
    v13 = [THWFreeTransformableRepGestureTargetHandler alloc];
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebRep hostICC](v5, "hostICC"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "widgetHost"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "freeTransformRepHandler"));
    v17 = -[THWFreeTransformableRepGestureTargetHandler initWithFreeTransformableRep:handler:](v13, "initWithFreeTransformableRep:handler:", v5, v16);
    freeTransformableHandler = v5->_freeTransformableHandler;
    v5->_freeTransformableHandler = v17;

    v5->_stageAlmostCoversPage = -[THWWebRep p_stageAlmostCoversPage](v5, "p_stageAlmostCoversPage");
    size = CGRectNull.size;
    v5->_deferredStageViewFrame.origin = CGRectNull.origin;
    v5->_deferredStageViewFrame.size = size;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v20, "addObserver:selector:name:object:", v5, "handleNotificationVantageDidChange:", CFSTR("THVantageDidChangeNotification"), 0);

  }
  return v5;
}

- (void)dealloc
{
  THWPlatformWebViewProtocol *webView;
  THWWebBridgeController *bridgeController;
  TSWPassThroughView *stageView;
  THAnimationController *animationController;
  THWFreeTransformableRepGestureTargetHandler *freeTransformableHandler;
  THWPressableRepGestureTargetHandler *pressableHandler;
  CALayer *webViewPosterLayer;
  CALayer *canvasPosterLayer;
  PFDURLRequestScope *requestScope;
  objc_super v12;

  if (self->_ownsWebView)
    -[THWPlatformWebViewProtocol setWebViewDelegate:](self->_webView, "setWebViewDelegate:", 0);
  webView = self->_webView;
  self->_webView = 0;

  bridgeController = self->_bridgeController;
  self->_bridgeController = 0;

  stageView = self->_stageView;
  self->_stageView = 0;

  animationController = self->_animationController;
  self->_animationController = 0;

  freeTransformableHandler = self->_freeTransformableHandler;
  self->_freeTransformableHandler = 0;

  pressableHandler = self->_pressableHandler;
  self->_pressableHandler = 0;

  webViewPosterLayer = self->_webViewPosterLayer;
  self->_webViewPosterLayer = 0;

  canvasPosterLayer = self->_canvasPosterLayer;
  self->_canvasPosterLayer = 0;

  requestScope = self->_requestScope;
  self->_requestScope = 0;

  v12.receiver = self;
  v12.super_class = (Class)THWWebRep;
  -[THWWebRep dealloc](&v12, "dealloc");
}

+ (void)enumerateSubdomainsOfHost:(id)a3 usingBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  if (a4)
  {
    v6 = a4;
    v7 = a3;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("autoplay."), "stringByAppendingString:", v7));
    (*((void (**)(id, void *))a4 + 2))(v6, v8);

    v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("manual."), "stringByAppendingString:", v7));
    (*((void (**)(id, id))a4 + 2))(v6, v9);

  }
}

- (PFDURLRequestScope)requestScope
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  PFDURLRequestScope *v11;
  PFDURLRequestScope *requestScope;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  void *v21;

  if (!self->_requestScope)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebRep info](self, "info"));

    if (v3)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebRep info](self, "info"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "drmContext"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bookBundleURL"));
      v15 = 0;
      v16 = &v15;
      v17 = 0x3032000000;
      v18 = sub_18D1D0;
      v19 = sub_18D1E0;
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bookID"));
      v21 = v7;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v21, 1));
      v20 = objc_msgSend(v8, "mutableCopy");

      v9 = (void *)objc_opt_class(self);
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bookID"));
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_18D1E8;
      v14[3] = &unk_42A7E0;
      v14[4] = &v15;
      objc_msgSend(v9, "enumerateSubdomainsOfHost:usingBlock:", v10, v14);

      v11 = (PFDURLRequestScope *)objc_claimAutoreleasedReturnValue(+[PFDURLRequestScope requestScopeWithHosts:bookRootURL:context:](PFDURLRequestScope, "requestScopeWithHosts:bookRootURL:context:", v16[5], v6, v5));
      requestScope = self->_requestScope;
      self->_requestScope = v11;

      _Block_object_dispose(&v15, 8);
    }
  }
  return self->_requestScope;
}

- (void)willBeRemoved
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("THVantageDidChangeNotification"), 0);

  -[CALayer setDelegate:](self->_webViewPosterLayer, "setDelegate:", 0);
  -[CALayer setDelegate:](self->_canvasPosterLayer, "setDelegate:", 0);
  if (-[THWWebRep ownsWebView](self, "ownsWebView"))
    -[THWPlatformWebViewProtocol setWebViewDelegate:](self->_webView, "setWebViewDelegate:", 0);
}

- (void)willReplaceContentsFromRep:(id)a3
{
  id v4;
  uint64_t v5;
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
  id v16;

  v4 = a3;
  v5 = objc_opt_class(THWWebRep);
  TSUDynamicCast(v5, v4);
  v16 = (id)objc_claimAutoreleasedReturnValue(v6);

  v7 = v16;
  if (v16)
  {
    if ((objc_msgSend(v16, "ownsWebView") & 1) == 0)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWWebRep willReplaceContentsFromRep:]"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Web/THWWebRep.m"));
      objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, v10, 224, CFSTR("unexpected webView ownership before replacing contents"));

    }
    -[THWWebRep setIsWebContentLoaded:](self, "setIsWebContentLoaded:", objc_msgSend(v16, "isWebContentLoaded"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "bridgeController"));
    -[THWWebRep setBridgeController:](self, "setBridgeController:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebRep bridgeController](self, "bridgeController"));
    objc_msgSend(v12, "setJavascriptHandler:", self);

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "webView"));
    -[THWWebRep setWebView:](self, "setWebView:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[TSWPassThroughView layer](self->_stageView, "layer"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebRep webViewPosterLayer](self, "webViewPosterLayer"));
    objc_msgSend(v14, "addSublayer:", v15);

    -[THWWebRep setOwnsWebView:](self, "setOwnsWebView:", 0);
    v7 = v16;
  }

}

- (void)replaceContentsFromRep:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  double v16;
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
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  void *v49;
  double v50;
  double v51;
  unsigned __int8 v52;
  void *v53;
  void *v54;

  v4 = a3;
  v5 = objc_opt_class(THWWebRep);
  TSUDynamicCast(v5, v4);
  v54 = (void *)objc_claimAutoreleasedReturnValue(v6);

  v7 = v54;
  if (v54)
  {
    if (!objc_msgSend(v54, "ownsWebView") || -[THWWebRep ownsWebView](self, "ownsWebView"))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWWebRep replaceContentsFromRep:]"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Web/THWWebRep.m"));
      objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, v10, 243, CFSTR("unexpected webView ownership while replacing contents"));

    }
    objc_msgSend(v54, "setOwnsWebView:", 0);
    -[THWWebRep setOwnsWebView:](self, "setOwnsWebView:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebRep stageView](self, "stageView"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebRep webView](self, "webView"));
    objc_msgSend(v11, "addSubview:", v12);

    v13 = OBJC_IVAR___TSDRep_mCanvas;
    v14 = *(void **)&self->super.TSDContainerRep_opaque[OBJC_IVAR___TSDRep_mCanvas];
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebRep layout](self, "layout"));
    objc_msgSend(v15, "webFrameInRoot");
    objc_msgSend(v14, "convertUnscaledToBoundsRect:");
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v23 = v22;
    objc_msgSend(*(id *)&self->super.TSDContainerRep_opaque[v13], "contentsScale");
    -[THWWebRep p_updateStageViewFrame:](self, "p_updateStageViewFrame:", TSDRoundedRectForScale(v17, v19, v21, v23, v24));

    -[THWPlatformWebViewProtocol setWebViewDelegate:](self->_webView, "setWebViewDelegate:", self);
    if (-[THWWebRep createdWebView](self, "createdWebView") && -[THWWebRep isExpanded](self, "isExpanded")
      || !objc_msgSend(v54, "isWebContentLoaded")
      || -[THWWebRep deferExposeWebView](self, "deferExposeWebView"))
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebRep webView](self, "webView"));
      objc_msgSend(v25, "setAlpha:", 0.0);

      v26 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebRep webView](self, "webView"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebRep stageView](self, "stageView"));
      objc_msgSend(v27, "bounds");
      v29 = v28;
      v31 = v30;
      v33 = v32;
      v35 = v34;
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebRep info](self, "info"));
      objc_msgSend(v36, "idealWebSize");
      objc_msgSend(v26, "setFrame:naturalSize:", v29, v31, v33, v35, v37, v38);

    }
    else
    {
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebRep webView](self, "webView"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebRep stageView](self, "stageView"));
      objc_msgSend(v40, "bounds");
      v42 = v41;
      v44 = v43;
      v46 = v45;
      v48 = v47;
      v49 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebRep info](self, "info"));
      objc_msgSend(v49, "idealWebSize");
      objc_msgSend(v39, "setFrame:naturalSize:", v42, v44, v46, v48, v50, v51);

      -[CALayer removeFromSuperlayer](self->_webViewPosterLayer, "removeFromSuperlayer");
    }
    v52 = -[THWWebRep isExpanded](self, "isExpanded");
    v7 = v54;
    if ((v52 & 1) == 0)
    {
      v53 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebRep interactiveCanvasController](self, "interactiveCanvasController"));
      objc_msgSend(v53, "layoutInvalidated");

      v7 = v54;
    }
  }

}

- (void)viewScaleDidChange
{
  void *v3;
  unsigned int v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebRep pressableHandler](self, "pressableHandler"));
  v4 = objc_msgSend(v3, "widgetInteractionDisabledOnPage");

  if (v4)
    -[THWWebRep p_pauseOnCanvas](self, "p_pauseOnCanvas");
}

- (BOOL)widgetInteractionAllowOnPageForCompact
{
  return 1;
}

- (BOOL)widgetInteractionAllowAutoplayForCompact
{
  return 1;
}

- (void)addAdditionalChildLayersToArray:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
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
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  uint64_t v27;
  void *v28;
  _BOOL4 playButtonPressed;
  uint64_t v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  void *v49;
  id v50;

  v4 = a3;
  if (!self->_stageView)
  {
    v50 = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebRep info](self, "info"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "autoplayConfig"));
    if ((objc_msgSend(v6, "enabled") & 1) != 0 || -[THWWebRep isExpanded](self, "isExpanded"))
    {

    }
    else
    {
      playButtonPressed = self->_playButtonPressed;

      if (!playButtonPressed)
      {
        v30 = OBJC_IVAR___TSDRep_mCanvas;
        v31 = *(void **)&self->super.TSDContainerRep_opaque[OBJC_IVAR___TSDRep_mCanvas];
        v32 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebRep layout](self, "layout"));
        objc_msgSend(v32, "stageFrame");
        objc_msgSend(v31, "convertUnscaledToBoundsRect:");
        v34 = v33;
        v36 = v35;
        v38 = v37;
        v40 = v39;
        objc_msgSend(*(id *)&self->super.TSDContainerRep_opaque[v30], "contentsScale");
        v42 = TSDRoundedRectForScale(v34, v36, v38, v40, v41);
        v44 = v43;
        v46 = v45;
        v48 = v47;

        v49 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebRep canvasPosterLayer](self, "canvasPosterLayer"));
        objc_msgSend(v49, "setFrame:", v42, v44, v46, v48);

        v27 = objc_claimAutoreleasedReturnValue(-[THWWebRep canvasPosterLayer](self, "canvasPosterLayer"));
        goto LABEL_6;
      }
    }
    v7 = OBJC_IVAR___TSDRep_mCanvas;
    v8 = *(void **)&self->super.TSDContainerRep_opaque[OBJC_IVAR___TSDRep_mCanvas];
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebRep layout](self, "layout"));
    objc_msgSend(v9, "webFrame");
    objc_msgSend(v8, "convertUnscaledToBoundsRect:");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    objc_msgSend(*(id *)&self->super.TSDContainerRep_opaque[v7], "contentsScale");
    v19 = TSDRoundedRectForScale(v11, v13, v15, v17, v18);
    v21 = v20;
    v23 = v22;
    v25 = v24;

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebRep webViewPosterLayer](self, "webViewPosterLayer"));
    objc_msgSend(v26, "setFrame:", v19, v21, v23, v25);

    v27 = objc_claimAutoreleasedReturnValue(-[THWWebRep webViewPosterLayer](self, "webViewPosterLayer"));
LABEL_6:
    v28 = (void *)v27;
    objc_msgSend(v50, "addObject:", v27);

    v4 = v50;
  }

}

- (CALayer)webViewPosterLayer
{
  CALayer *webViewPosterLayer;
  CALayer *v4;
  CALayer *v5;
  void *v6;
  void *v7;
  CALayer *v9;
  void *v10;

  webViewPosterLayer = self->_webViewPosterLayer;
  if (!webViewPosterLayer)
  {
    v4 = (CALayer *)objc_alloc_init((Class)TSDNoDefaultImplicitActionLayer);
    v5 = self->_webViewPosterLayer;
    self->_webViewPosterLayer = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebRep interactiveCanvasController](self, "interactiveCanvasController"));
    -[CALayer setDelegate:](self->_webViewPosterLayer, "setDelegate:", v6);

    -[CALayer setContentsGravity:](self->_webViewPosterLayer, "setContentsGravity:", kCAGravityResize);
    webViewPosterLayer = self->_webViewPosterLayer;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CALayer contents](webViewPosterLayer, "contents"));
  if (!v7 && self->_ownsWebView)
  {
    if (self->_suspendPosterRendering)
      return self->_webViewPosterLayer;
    v9 = self->_webViewPosterLayer;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebRep info](self, "info"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "defaultImage"));
    -[THWWebRep p_updateLayerContents:withImage:](self, "p_updateLayerContents:withImage:", v9, v10);

  }
  return self->_webViewPosterLayer;
}

- (CALayer)canvasPosterLayer
{
  CALayer *canvasPosterLayer;
  CALayer *v4;
  CALayer *v5;
  void *v6;
  void *v7;
  CALayer *v9;
  void *v10;

  canvasPosterLayer = self->_canvasPosterLayer;
  if (!canvasPosterLayer)
  {
    v4 = (CALayer *)objc_alloc_init((Class)TSDNoDefaultImplicitActionLayer);
    v5 = self->_canvasPosterLayer;
    self->_canvasPosterLayer = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebRep interactiveCanvasController](self, "interactiveCanvasController"));
    -[CALayer setDelegate:](self->_canvasPosterLayer, "setDelegate:", v6);

    -[CALayer setContentsGravity:](self->_canvasPosterLayer, "setContentsGravity:", kCAGravityResize);
    canvasPosterLayer = self->_canvasPosterLayer;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CALayer contents](canvasPosterLayer, "contents"));
  if (!v7 && self->_ownsWebView)
  {
    if (self->_suspendPosterRendering)
      return self->_canvasPosterLayer;
    v9 = self->_canvasPosterLayer;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebRep info](self, "info"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "placeholderImage"));
    -[THWWebRep p_updateLayerContents:withImage:](self, "p_updateLayerContents:withImage:", v9, v10);

  }
  return self->_canvasPosterLayer;
}

- (void)p_updateLayerContents:(id)a3 withImage:(id)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  id v10;
  id v11;

  if (a3)
  {
    v6 = a4;
    v11 = a3;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebRep canvas](self, "canvas"));
    objc_msgSend(v7, "contentsScale");
    v9 = v8;

    v10 = objc_msgSend(v6, "CGImageForContentsScale:", v9);
    objc_msgSend(v11, "setContents:", v10);
    objc_msgSend(v11, "setContentsScale:", v9);

  }
}

- (void)screenScaleDidChange
{
  CALayer *webViewPosterLayer;
  void *v4;
  void *v5;
  CALayer *canvasPosterLayer;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)THWWebRep;
  -[THWWebRep screenScaleDidChange](&v9, "screenScaleDidChange");
  webViewPosterLayer = self->_webViewPosterLayer;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebRep info](self, "info"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "defaultImage"));
  -[THWWebRep p_updateLayerContents:withImage:](self, "p_updateLayerContents:withImage:", webViewPosterLayer, v5);

  canvasPosterLayer = self->_canvasPosterLayer;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebRep info](self, "info"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "placeholderImage"));
  -[THWWebRep p_updateLayerContents:withImage:](self, "p_updateLayerContents:withImage:", canvasPosterLayer, v8);

}

- (void)p_updateStageViewFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!-[THWWebRep isExpanding](self, "isExpanding"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebRep stageView](self, "stageView"));
    objc_msgSend(v8, "setFrame:", x, y, width, height);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebRep stageView](self, "stageView"));
    objc_msgSend(v9, "bounds");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebRep webViewPosterLayer](self, "webViewPosterLayer"));
    objc_msgSend(v18, "setFrame:", v11, v13, v15, v17);

    x = CGRectNull.origin.x;
    y = CGRectNull.origin.y;
    width = CGRectNull.size.width;
    height = CGRectNull.size.height;
  }
  -[THWWebRep setDeferredStageViewFrame:](self, "setDeferredStageViewFrame:", x, y, width, height);
}

- (void)addChildViewsToArray:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  THWPlatformWebViewProtocol *webView;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  dispatch_time_t v32;
  unsigned int v33;
  _QWORD block[5];

  v4 = a3;
  if (!-[THWWebRep isExpanded](self, "isExpanded"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebRep info](self, "info"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "autoplayConfig"));
    if ((objc_msgSend(v6, "enabled") & 1) != 0 || self->_playButtonPressed || self->_isWebContentLoaded)
    {

    }
    else
    {
      v33 = -[THWWebRep deferExposeWebView](self, "deferExposeWebView");

      if (!v33)
        goto LABEL_10;
    }
  }
  v7 = OBJC_IVAR___TSDRep_mCanvas;
  v8 = *(void **)&self->super.TSDContainerRep_opaque[OBJC_IVAR___TSDRep_mCanvas];
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebRep layout](self, "layout"));
  objc_msgSend(v9, "webFrameInRoot");
  objc_msgSend(v8, "convertUnscaledToBoundsRect:");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  objc_msgSend(*(id *)&self->super.TSDContainerRep_opaque[v7], "contentsScale");
  -[THWWebRep p_updateStageViewFrame:](self, "p_updateStageViewFrame:", TSDRoundedRectForScale(v11, v13, v15, v17, v18));

  if (self->_ownsWebView)
  {
    webView = self->_webView;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebRep stageView](self, "stageView"));
    objc_msgSend(v20, "bounds");
    v22 = v21;
    v24 = v23;
    v26 = v25;
    v28 = v27;
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebRep info](self, "info"));
    objc_msgSend(v29, "idealWebSize");
    -[THWPlatformWebViewProtocol setFrame:naturalSize:](webView, "setFrame:naturalSize:", v22, v24, v26, v28, v30, v31);

    if (-[THWWebRep deferExposeWebView](self, "deferExposeWebView"))
    {
      v32 = dispatch_time(0, 100000000);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_18E024;
      block[3] = &unk_426D30;
      block[4] = self;
      dispatch_after(v32, (dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
  objc_msgSend(v4, "addObject:", self->_stageView);
LABEL_10:

}

- (int)positionForChildView:(id)a3
{
  return 2;
}

- (TSWPassThroughView)stageView
{
  TSWPassThroughView *v3;
  TSWPassThroughView *stageView;
  void *v5;
  void *v6;
  void *v7;
  THWWebView *v8;
  void *v9;
  THWPlatformWebViewProtocol *v10;
  THWPlatformWebViewProtocol *webView;
  THWWebBridgeController *v12;
  THWWebBridgeController *bridgeController;

  if (!self->_stageView)
  {
    v3 = -[TSWPassThroughView initWithFrame:]([TSWPassThroughView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    stageView = self->_stageView;
    self->_stageView = v3;

    -[TSWPassThroughView setAcceptsHits:](self->_stageView, "setAcceptsHits:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TSWPassThroughView layer](self->_stageView, "layer"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebRep webViewPosterLayer](self, "webViewPosterLayer"));
    objc_msgSend(v5, "addSublayer:", v6);

    if (!self->_webView)
    {
      -[THWWebRep setCreatedWebView:](self, "setCreatedWebView:", 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebRep requestScope](self, "requestScope"));
      v8 = [THWWebView alloc];
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebRep p_filteredOutURLSchemes](self, "p_filteredOutURLSchemes"));
      v10 = -[THWWebView initWithfilteredOutURLSchemes:requestScope:](v8, "initWithfilteredOutURLSchemes:requestScope:", v9, v7);
      webView = self->_webView;
      self->_webView = v10;

      -[THWPlatformWebViewProtocol disableScrolling](self->_webView, "disableScrolling");
      -[THWPlatformWebViewProtocol hide](self->_webView, "hide");
      -[TSWPassThroughView addSubview:](self->_stageView, "addSubview:", self->_webView);

    }
    if (!self->_bridgeController)
    {
      v12 = -[THWWebBridgeController initWithView:]([THWWebBridgeController alloc], "initWithView:", self->_webView);
      bridgeController = self->_bridgeController;
      self->_bridgeController = v12;

      -[THWWebBridgeController setJavascriptHandler:](self->_bridgeController, "setJavascriptHandler:", self);
    }
  }
  return self->_stageView;
}

- (void)didAddChildView:(id)a3
{
  uint64_t v4;
  void *v5;
  unsigned int v6;
  TSWPassThroughView *v7;

  v7 = (TSWPassThroughView *)a3;
  if (self->_ownsWebView)
    -[THWPlatformWebViewProtocol setWebViewDelegate:](self->_webView, "setWebViewDelegate:", self);
  if (self->_stageView == v7 && self->_playButtonPressed && self->_ownsWebView
    || (v4 = objc_claimAutoreleasedReturnValue(-[THWWebRep webView](self, "webView"))) != 0
    && (v5 = (void *)v4, v6 = -[THWWebRep autoplayRequested](self, "autoplayRequested"), v5, v6))
  {
    -[THWWebRep p_startAutoplay](self, "p_startAutoplay");
    -[THWWebRep setAutoplayRequested:](self, "setAutoplayRequested:", 0);
  }

}

- (void)willRemoveChildView:(id)a3
{
  id v3;

  if (self->_ownsWebView)
  {
    v3 = (id)objc_claimAutoreleasedReturnValue(-[THWWebRep webView](self, "webView", a3));
    objc_msgSend(v3, "setWebViewDelegate:", 0);

  }
}

- (CALayer)pressableAnimationShadowLayer
{
  return 0;
}

- (BOOL)wantsPressAnimation
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebRep pressableHandler](self, "pressableHandler"));
  v3 = objc_msgSend(v2, "widgetInteractionDisabledOnPage");

  return v3;
}

- (BOOL)wantsPressAction
{
  BOOL v3;
  void *v4;

  if (-[THWWebRep meetsStageDimensionRequirementForExpanded](self, "meetsStageDimensionRequirementForExpanded"))
    return -[THWWebRep pressableAction](self, "pressableAction") != 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebRep pressableHandler](self, "pressableHandler"));
  if (objc_msgSend(v4, "widgetInteractionDisabledOnPage"))
    v3 = -[THWWebRep pressableAction](self, "pressableAction") != 0;
  else
    v3 = 0;

  return v3;
}

- (BOOL)shouldRecognizePressOnRep:(id)a3
{
  void *v3;
  char v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebRep layout](self, "layout", a3));
  v4 = objc_msgSend(v3, "isExpanded") ^ 1;

  return v4;
}

- (int)pressableAction
{
  return 2;
}

- (void)webViewDidFinishLoad:(id)a3
{
  void *v4;
  unsigned int v5;
  dispatch_time_t v6;
  _QWORD block[5];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebRep info](self, "info", a3));
  v5 = objc_msgSend(v4, "exposurePolicy");

  if (!v5)
  {
    v6 = dispatch_time(0, 100000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_18E448;
    block[3] = &unk_426D30;
    block[4] = self;
    dispatch_after(v6, (dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (id)webThreadWebView:(id)a3 resource:(id)a4 willSendRequest:(id)a5 redirectResponse:(id)a6 fromDataSource:(id)a7
{
  id v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  id v16;

  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "URL"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "scheme"));
  v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("x-ibooks-th"));

  if ((v11 & 1) != 0)
    goto LABEL_6;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebRep info](self, "info"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "autoplayConfig"));
  if ((objc_msgSend(v13, "enabled") & 1) == 0)
  {

    goto LABEL_6;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebRep info](self, "info"));
  v15 = objc_msgSend(v14, "allowNetworkAccess");

  if (v15)
  {
LABEL_6:
    v16 = v8;
    goto LABEL_7;
  }
  v16 = 0;
LABEL_7:

  return v16;
}

- (void)p_webView:(id)a3 shouldStartLoadWithURL:(id)a4 navigationType:(int)a5 syncResponseHandler:(id)a6 asyncResponseHandler:(id)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void (**v15)(id, id);
  void *v16;
  void *v17;
  unsigned __int8 v18;
  void *v19;
  unsigned int v20;
  void *v21;
  unsigned int v22;
  void *v23;
  void *v24;
  id v25;
  unsigned __int8 v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  unsigned int v31;
  void *v32;
  void *v33;
  unsigned int v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  unsigned int v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  void *v47;
  void *v48;
  _QWORD v49[5];
  id v50;

  v11 = a4;
  v12 = a6;
  v13 = a7;
  v14 = v13;
  if (v12)
    v13 = v12;
  v15 = (void (**)(id, id))objc_retainBlock(v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebRep p_cachedLoadExternalContentApproval](self, "p_cachedLoadExternalContentApproval"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "scheme"));
  v18 = objc_msgSend(CFSTR("x-ibooks-th"), "isEqualToString:", v17);

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "absoluteString"));
  v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("about:blank"));

  if (v20)
    goto LABEL_4;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebRep bridgeController](self, "bridgeController"));
  v22 = objc_msgSend(v21, "handleURL:", v11);

  if (v22)
    goto LABEL_20;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebRep info](self, "info"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "autoplayConfig"));
  if (objc_msgSend(v24, "enabled"))
  {
    if ((v18 & 1) != 0)
    {

      v25 = &dword_0 + 1;
LABEL_12:
      v15[2](v15, v25);
      goto LABEL_21;
    }
    v26 = objc_msgSend(v16, "BOOLValue");

    if ((v26 & 1) != 0)
    {
LABEL_11:
      v25 = objc_msgSend(v16, "BOOLValue");
      goto LABEL_12;
    }
  }
  else
  {

  }
  if (objc_msgSend(v11, "isFileURL"))
  {
LABEL_20:
    v15[2](v15, 0);
    goto LABEL_21;
  }
  if (a5 != 5)
  {
    if (a5)
      goto LABEL_21;
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[TSKApplicationDelegate sharedDelegate](TSKApplicationDelegate, "sharedDelegate"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "validURLSchemes"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "scheme"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "lowercaseString"));
    v31 = objc_msgSend(v28, "containsObject:", v30);

    if (!v31)
      goto LABEL_20;
LABEL_19:
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[TSKApplicationDelegate sharedDelegate](TSKApplicationDelegate, "sharedDelegate"));
    objc_msgSend(v35, "openURL:", v11);

    goto LABEL_20;
  }
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "scheme"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "lowercaseString"));
  v34 = objc_msgSend(CFSTR("mailto"), "isEqualToString:", v33);

  if (v34)
    goto LABEL_19;
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[THApplicationDelegate sharedDelegate](THApplicationDelegate, "sharedDelegate"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "urlSchemesNotRequiringUserPrompt"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "scheme"));
  v39 = objc_msgSend(v37, "containsObject:", v38);

  if (v39)
  {
LABEL_4:
    v15[2](v15, (char *)&dword_0 + 1);
    goto LABEL_21;
  }
  if (v16)
    goto LABEL_11;
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebRep layout](self, "layout"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "layoutController"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "canvas"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "canvasController"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "layerHost"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "viewController"));

  v44 = (void *)objc_claimAutoreleasedReturnValue(+[THApplicationDelegate sharedDelegate](THApplicationDelegate, "sharedDelegate"));
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472;
  v49[2] = sub_18E90C;
  v49[3] = &unk_42A808;
  v49[4] = self;
  v45 = v14;
  v50 = v45;
  v46 = objc_msgSend(v44, "shouldAuthorizeURLToLoad:loadContext:completion:", v11, v47, v49);

  if (v12)
  {
    (*((void (**)(id, id))v12 + 2))(v12, v46);
  }
  else if ((_DWORD)v46)
  {
    (*((void (**)(id, uint64_t))v45 + 2))(v45, 1);
  }

LABEL_21:
}

- (BOOL)webView:(id)a3 shouldStartLoadWithURL:(id)a4 navigationType:(int)a5 deferredResponseHandler:(id)a6
{
  uint64_t v7;
  id v10;
  id v11;
  id v12;
  _QWORD v14[4];
  id v15;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v7 = *(_QWORD *)&a5;
  v10 = a3;
  v11 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 1;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_18EA6C;
  v16[3] = &unk_42A830;
  v16[4] = &v17;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_18EA7C;
  v14[3] = &unk_42A858;
  v12 = a6;
  v15 = v12;
  -[THWWebRep p_webView:shouldStartLoadWithURL:navigationType:syncResponseHandler:asyncResponseHandler:](self, "p_webView:shouldStartLoadWithURL:navigationType:syncResponseHandler:asyncResponseHandler:", v10, v11, v7, v16, v14);
  LOBYTE(v7) = *((_BYTE *)v18 + 24);

  _Block_object_dispose(&v17, 8);
  return v7;
}

- (BOOL)canHandleGesture:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  unsigned __int8 v7;
  void *v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebRep pressableHandler](self, "pressableHandler"));
  v6 = objc_msgSend(v5, "canHandleGesture:", v4);

  if ((v6 & 1) != 0)
  {
    v7 = 1;
  }
  else if (self->_ownsWebView)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebRep freeTransformableHandler](self, "freeTransformableHandler"));
    v7 = objc_msgSend(v8, "canHandleGesture:", v4);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)handleGesture:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  unsigned __int8 v10;
  void *v11;

  v4 = a3;
  if (!self->_ownsWebView)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWWebRep handleGesture:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Web/THWWebRep.m"));
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, v7, 752, CFSTR("shouldn't be handling gestures when we don't own the webView"));

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebRep pressableHandler](self, "pressableHandler"));
  v9 = objc_msgSend(v8, "handleGesture:", v4);

  if ((v9 & 1) != 0)
  {
    v10 = 1;
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebRep freeTransformableHandler](self, "freeTransformableHandler"));
    v10 = objc_msgSend(v11, "handleGesture:", v4);

  }
  return v10;
}

- (void)willBeginHandlingGesture:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "gestureKind"));
  v5 = (void *)TSDFreeTransform;

  if (v4 == v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebRep freeTransformableHandler](self, "freeTransformableHandler"));
    objc_msgSend(v6, "willBeginHandlingGesture:", v7);

  }
}

- (BOOL)webView:(id)a3 handleURL:(id)a4
{
  id v6;
  id v7;
  id v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[THWWebRep webView](self, "webView"));

  if (v8 == v7)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "scheme"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lowercaseString"));

    if (!objc_msgSend(v11, "isEqualToString:", CFSTR("ibooks"))
      || (v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "host")), v12, v12))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[TSKApplicationDelegate sharedDelegate](TSKApplicationDelegate, "sharedDelegate"));
      objc_msgSend(v13, "openURL:", v6);
      v9 = 0;
LABEL_6:

      goto LABEL_7;
    }
    if (-[THWWebRep isExpanded](self, "isExpanded"))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebRep interactiveCanvasController](self, "interactiveCanvasController"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "delegate"));
      v17 = TSUProtocolCast(&OBJC_PROTOCOL___THWExpandedViewController, v16);
      v13 = (void *)objc_claimAutoreleasedReturnValue(v17);

      v9 = v13 != 0;
      if (!v13)
        goto LABEL_6;
      objc_msgSend(v13, "handleHyperlinkWithURL:", v6);
    }
    else
    {
      v18 = objc_opt_class(THInteractiveCanvasController);
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebRep interactiveCanvasController](self, "interactiveCanvasController"));
      TSUDynamicCast(v18, v19);
      v13 = (void *)objc_claimAutoreleasedReturnValue(v20);

      objc_msgSend(v13, "performSelectorOnMainThread:withObject:waitUntilDone:", "handleHyperlinkWithURL:", v6, 0);
    }
    v9 = 1;
    goto LABEL_6;
  }
  v9 = 0;
LABEL_7:

  return v9;
}

- (BOOL)webView:(id)a3 shouldAcceptHitAtPoint:(CGPoint)a4 onView:(id)a5 withEvent:(id)a6
{
  double y;
  double x;
  id v9;
  unsigned int v10;
  void *v11;
  unsigned int v12;
  int v13;

  y = a4.y;
  x = a4.x;
  v9 = a5;
  if (-[THWWebRep stageAlmostCoversPage](self, "stageAlmostCoversPage"))
    v10 = !-[THWWebRep p_pointIsInRedZone:onView:](self, "p_pointIsInRedZone:onView:", v9, x, y);
  else
    v10 = 1;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebRep pressableHandler](self, "pressableHandler"));
  v12 = objc_msgSend(v11, "widgetInteractionDisabledOnPage");

  v13 = v10 & ~v12;
  if (-[THWWebRep isExpanded](self, "isExpanded"))
    v13 &= ~-[THWWebRep p_pointIsInRedZone:onView:](self, "p_pointIsInRedZone:onView:", v9, x, y);

  return v13;
}

- (void)expandedWillPresentWithController:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v4 = a3;
  -[THWWebRep setExpandedRepController:](self, "setExpandedRepController:", v4);
  v5 = objc_opt_class(THWWebRep);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "expandedRepSourceRep"));
  TSUDynamicCast(v5, v6);
  v11 = (id)objc_claimAutoreleasedReturnValue(v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "expandedRepSourceRep"));
  v9 = TSUProtocolCast(&OBJC_PROTOCOL___THWFreeTransformableRep, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  if (!v11 && objc_msgSend(v10, "isFreeTransformInProgress"))
    self->_suspendPosterRendering = 1;

}

- (int)expandedAppearance
{
  return 0;
}

- (int)expandedAppearanceForPanel:(int)a3
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

    -[THAnimationController setSource:](self->_animationController, "setSource:", self);
    -[THAnimationController addObserver:](self->_animationController, "addObserver:", self);
    animationController = self->_animationController;
  }
  return animationController;
}

- (BOOL)expandedHasContentForPanel:(int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = *(_QWORD *)&a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebRep info](self, "info"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "adornmentInfo"));
  LOBYTE(v3) = objc_msgSend(v5, "panelContentProviderHasContentForPanel:", v3);

  return v3;
}

- (id)expandedChildInfosForPanel:(int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = *(_QWORD *)&a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebRep info](self, "info"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "adornmentInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "panelContentProviderChildInfosForPanel:", v3));

  return v6;
}

- (BOOL)expandedHasRoomForPanelsWithHeight:(double)a3 inFrame:(CGRect)a4
{
  double height;
  double width;
  CGFloat y;
  CGFloat x;
  void *v9;
  double v10;
  double v11;
  CGRect v13;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebRep layout](self, "layout"));
  objc_msgSend(v9, "webSizeInStageSize:", width, height);
  v11 = v10;

  v13.origin.x = x;
  v13.origin.y = y;
  v13.size.width = width;
  v13.size.height = height;
  return CGRectGetHeight(v13) - v11 >= a3;
}

- (BOOL)expandedWantsButtonVisibleWhenNoPanels
{
  return 1;
}

- (void)expandedDidAppearPreAnimation
{
  -[THWWebRep setExpanding:](self, "setExpanding:", 1);
}

- (void)expandedDidPresentWithController:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_opt_respondsToSelector(v4, "expandableRepContainsHTMLContent:") & 1) != 0)
    objc_msgSend(v4, "expandableRepContainsHTMLContent:", self);

}

- (void)expandedWidgetLayoutFrameDidChangeFromFrame:(CGRect)a3 toFrame:(CGRect)a4
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[THWWebRep layout](self, "layout", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height));
  objc_msgSend(v4, "invalidateFrame");

}

- (void)didExitExpanded
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[THWWebRep bridgeController](self, "bridgeController"));
  objc_msgSend(v2, "tellBrowserToPauseAudioVisual");

}

- (void)didPresentExpanded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CALayer *webViewPosterLayer;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  CGRect v14;

  if (!self->_webView)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWWebRep didPresentExpanded]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Web/THWWebRep.m"));
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, v5, 926, CFSTR("invalid nil value for '%s'"), "_webView");

  }
  if (!self->_ownsWebView)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWWebRep didPresentExpanded]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Web/THWWebRep.m"));
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, v8, 927, CFSTR("we should own the web view after being expanded"));

  }
  -[THWWebRep setExpanding:](self, "setExpanding:", 0);
  -[THWWebRep deferredStageViewFrame](self, "deferredStageViewFrame");
  if (!CGRectIsNull(v14))
  {
    -[THWWebRep deferredStageViewFrame](self, "deferredStageViewFrame");
    -[THWWebRep p_updateStageViewFrame:](self, "p_updateStageViewFrame:");
  }
  if (self->_suspendPosterRendering)
  {
    self->_suspendPosterRendering = 0;
    webViewPosterLayer = self->_webViewPosterLayer;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebRep info](self, "info"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "defaultImage"));
    -[THWWebRep p_updateLayerContents:withImage:](self, "p_updateLayerContents:withImage:", webViewPosterLayer, v11);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebRep bridgeController](self, "bridgeController"));
  objc_msgSend(v12, "tellBrowserWillEnterWidgetMode:", 3);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebRep bridgeController](self, "bridgeController"));
  objc_msgSend(v13, "tellBrowserDidEnterWidgetMode:", 3);

  if (!self->_isWebContentLoaded)
    -[THWWebRep p_loadSourceURL](self, "p_loadSourceURL");
}

- (int)autoRotationMode
{
  return 3;
}

- (double)scaleForCenteredAutoRotateFromSize:(CGSize)a3 toSize:(CGSize)a4
{
  double height;
  double width;
  double v6;
  double v7;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  float v19;
  float v20;

  height = a4.height;
  width = a4.width;
  v6 = a3.height;
  v7 = a3.width;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebRep layout](self, "layout"));
  objc_msgSend(v9, "webSizeInStageSize:", v7, v6);
  v11 = v10;
  v13 = v12;

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebRep layout](self, "layout"));
  objc_msgSend(v14, "webSizeInStageSize:", width, height);
  v16 = v15;
  v18 = v17;

  v19 = v16 / v11;
  v20 = v18 / v13;
  return fminf(v19, v20);
}

- (CGPoint)translateForCenteredAutoRotateFromSize:(CGSize)a3 toSize:(CGSize)a4
{
  double x;
  double y;
  CGPoint result;

  x = CGPointZero.x;
  y = CGPointZero.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)expandedDidRotateTransitionToSize:(CGSize)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[THWWebRep layout](self, "layout", a3.width, a3.height));
  objc_msgSend(v3, "invalidateFrame");

}

- (void)expandableExpandedPresentationDidEnd
{
  void *v3;
  unsigned int v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebRep pressableHandler](self, "pressableHandler"));
  v4 = objc_msgSend(v3, "widgetInteractionDisabledOnPage");

  if (v4)
    -[THWWebRep p_pauseOnCanvas](self, "p_pauseOnCanvas");
}

- (void)p_togglePanelDescriptionExpanded
{
  -[THWWebRep setPanelDescriptionExpanded:](self, "setPanelDescriptionExpanded:", -[THWWebRep panelDescriptionExpanded](self, "panelDescriptionExpanded") ^ 1);
  -[THWExpandedRepController expandedRepControllerAnimatePanel:withCrossFadeContent:backgroundLayout:duration:](self->_expandedRepController, "expandedRepControllerAnimatePanel:withCrossFadeContent:backgroundLayout:duration:", 1, 1, 0, 0.25);
  -[THWExpandedRepController expandedRepControllerInvalidateChildrenInPanel:invalidateWPAuto:](self->_expandedRepController, "expandedRepControllerInvalidateChildrenInPanel:invalidateWPAuto:", 1, 1);
}

- (id)expandedPanel:(int)a3 primaryTargetForGesture:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[9];

  if (a3 != 1)
    return 0;
  v7[7] = v4;
  v7[8] = v5;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_18F670;
  v7[3] = &unk_426D30;
  v7[4] = self;
  return -[THWTapGestureAction initWithAction:]([THWTapGestureAction alloc], "initWithAction:", v7);
}

- (unsigned)expandedMaxLineCountForTextLayout:(id)a3 inPanel:(int)a4 withDefault:(unsigned int)a5
{
  id v8;
  void *v9;
  void *v10;
  const char *v11;
  unsigned int v12;

  v8 = a3;
  if (a4 == 1 && !self->_panelDescriptionExpanded)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebRep layout](self, "layout"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "layoutController"));

    v11 = "isCompactHeight";
    if ((objc_opt_respondsToSelector(v10, "isCompactHeight") & 1) != 0)
    {
      v12 = 2;
    }
    else
    {
      v11 = "isCompactWidth";
      if ((objc_opt_respondsToSelector(v10, "isCompactWidth") & 1) == 0)
      {
LABEL_9:

        goto LABEL_10;
      }
      v12 = 5;
    }
    if (objc_msgSend(v10, "performSelector:", v11))
      a5 = v12;
    goto LABEL_9;
  }
LABEL_10:

  return a5;
}

- (BOOL)shouldAnimateTargetLayer:(id)a3
{
  void *v4;
  void *v5;
  unsigned __int8 v6;

  if (self->_stageView)
    return 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebRep freeTransformableHandler](self, "freeTransformableHandler", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ftc"));
  v6 = objc_msgSend(v5, "passedThreshold");

  return v6;
}

- (BOOL)shouldFadeOutAnimationLayer:(id)a3
{
  void *v4;
  void *v5;
  unsigned __int8 v6;

  if (self->_stageView)
    return 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebRep freeTransformableHandler](self, "freeTransformableHandler", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ftc"));
  v6 = objc_msgSend(v5, "passedThreshold");

  return v6;
}

- (id)animationLayer
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  CALayer *v8;
  TSWPassThroughView *stageView;
  CALayer *canvasPosterLayer;
  uint64_t v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebRep freeTransformableHandler](self, "freeTransformableHandler"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "ftc"));
  v5 = objc_msgSend(v4, "isFreeTransformInProgress");

  if (!v5
    || (v6 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebRep freeTransformableHandler](self, "freeTransformableHandler")),
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ftc")),
        v8 = (CALayer *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "freeTransformLayer")),
        v7,
        v6,
        !v8))
  {
    stageView = self->_stageView;
    if (!stageView
      || (v8 = (CALayer *)objc_claimAutoreleasedReturnValue(-[TSWPassThroughView layer](stageView, "layer"))) == 0)
    {
      canvasPosterLayer = self->_canvasPosterLayer;
      if (!canvasPosterLayer)
      {
        v11 = OBJC_IVAR___TSDRep_mCanvas;
        v12 = *(void **)&self->super.TSDContainerRep_opaque[OBJC_IVAR___TSDRep_mCanvas];
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebRep layout](self, "layout"));
        objc_msgSend(v13, "stageFrame");
        objc_msgSend(v12, "convertUnscaledToBoundsRect:");
        v15 = v14;
        v17 = v16;
        v19 = v18;
        v21 = v20;
        objc_msgSend(*(id *)&self->super.TSDContainerRep_opaque[v11], "contentsScale");
        v23 = TSDRoundedRectForScale(v15, v17, v19, v21, v22);
        v25 = v24;
        v27 = v26;
        v29 = v28;

        v30 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebRep canvasPosterLayer](self, "canvasPosterLayer"));
        objc_msgSend(v30, "setFrame:", v23, v25, v27, v29);

        v31 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebRep canvasPosterLayer](self, "canvasPosterLayer"));
        v32 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebRep info](self, "info"));
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "placeholderImage"));
        -[THWWebRep p_updateLayerContents:withImage:](self, "p_updateLayerContents:withImage:", v31, v33);

        canvasPosterLayer = self->_canvasPosterLayer;
      }
      v8 = canvasPosterLayer;
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

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebRep freeTransformableHandler](self, "freeTransformableHandler"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "ftc"));
  v5 = objc_msgSend(v4, "isFreeTransformInProgress");

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebRep freeTransformableHandler](self, "freeTransformableHandler"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ftc"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "shadowLayer"));

  }
  else
  {
    v8 = 0;
  }
  return v8;
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
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebRep freeTransformableHandler](self, "freeTransformableHandler"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ftc"));
  v8 = objc_msgSend(v7, "isFreeTransformInProgress");

  if (v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebRep freeTransformableHandler](self, "freeTransformableHandler"));
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

- (void)reparentAnimationLayerIfBackedByView:(id)a3
{
  void *v4;
  void *v5;
  TSWPassThroughView *stageView;

  if (self->_stageView)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebRep subviewsController](self, "subviewsController", a3));
    stageView = self->_stageView;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &stageView, 1));
    objc_msgSend(v4, "addSubviews:", v5);

  }
}

+ (BOOL)expandedAllowsFreeTransformForInfo:(id)a3
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

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebRep freeTransformableHandler](self, "freeTransformableHandler"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "ftc"));
  v7 = objc_msgSend(v6, "isFreeTransformInProgress");
  if (v7
    && (v2 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebRep freeTransformableHandler](self, "freeTransformableHandler")),
        v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "ftc")),
        !objc_msgSend(v3, "passedThreshold")))
  {
    v8 = 0;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebRep animationLayer](self, "animationLayer"));
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

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebRep freeTransformableHandler](self, "freeTransformableHandler"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "ftc"));
  if ((objc_msgSend(v4, "isFreeTransformInProgress") & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebRep freeTransformableHandler](self, "freeTransformableHandler"));
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
  TSWPassThroughView *stageView;

  if (self->_stageView)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebRep subviewsController](self, "subviewsController", a3));
    stageView = self->_stageView;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &stageView, 1));
    objc_msgSend(v4, "addSubviews:", v5);

  }
}

- (BOOL)shouldForceDisableCrossfadeFromSource:(id)a3
{
  return self->_suspendPosterRendering;
}

- (void)animationControllerDidPresent:(id)a3
{
  THAnimationController *animationController;

  animationController = self->_animationController;
  self->_animationController = 0;

}

- (BOOL)isExpanded
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebRep layout](self, "layout"));
  v3 = objc_msgSend(v2, "isExpanded");

  return v3;
}

- (BOOL)meetsStageDimensionRequirementForExpanded
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebRep layout](self, "layout"));
  objc_msgSend(v2, "stageFrame");
  v4 = v3;
  v6 = v5;

  return v6 < 660.0 || v4 < 960.0;
}

- (id)shadowPath
{
  return 0;
}

- (BOOL)freeTransformUseTracedShadowPath
{
  return 0;
}

- (BOOL)isFreeTransformInProgress
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebRep freeTransformableHandler](self, "freeTransformableHandler"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "ftc"));
  v4 = objc_msgSend(v3, "isFreeTransformInProgress");

  return v4;
}

- (CGRect)rectForCompletion
{
  void *v2;
  double v3;
  double v4;
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
  CGRect result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebRep layout](self, "layout"));
  objc_msgSend(v2, "frameInParent");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (BOOL)freeTransformInteractionEnabledOverride
{
  return 1;
}

- (void)contentIsReady
{
  void *v3;
  unsigned int v4;
  dispatch_time_t v5;
  _QWORD block[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebRep info](self, "info"));
  v4 = objc_msgSend(v3, "exposurePolicy");

  if (v4 == 1)
  {
    v5 = dispatch_time(0, 100000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_190010;
    block[3] = &unk_426D30;
    block[4] = self;
    dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (THWAutoplayConfig)autoplayConfig
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebRep info](self, "info"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "autoplayConfig"));

  return (THWAutoplayConfig *)v3;
}

- (BOOL)autoplayAllowed
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebRep pressableHandler](self, "pressableHandler"));
  v3 = objc_msgSend(v2, "widgetInteractionAllowAutoplay");

  return v3;
}

- (void)autoplayStart
{
  _QWORD activity_block[5];

  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472;
  activity_block[2] = sub_1900E8;
  activity_block[3] = &unk_426D30;
  activity_block[4] = self;
  _os_activity_initiate(&dword_0, "HTML Autoplay Start", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

- (void)autoplayStop
{
  _QWORD activity_block[5];

  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472;
  activity_block[2] = sub_190154;
  activity_block[3] = &unk_426D30;
  activity_block[4] = self;
  _os_activity_initiate(&dword_0, "HTML Autoplay Stop", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

- (void)autoplayPause
{
  _QWORD activity_block[5];

  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472;
  activity_block[2] = sub_1901C0;
  activity_block[3] = &unk_426D30;
  activity_block[4] = self;
  _os_activity_initiate(&dword_0, "HTML Autoplay Pause", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

- (BOOL)p_becameVisibleOnCanvas
{
  unsigned int v3;

  v3 = -[THWWebRep isVisibleOnCanvas](self, "isVisibleOnCanvas");
  if (v3)
    LOBYTE(v3) = !-[THWWebRep isExpanded](self, "isExpanded") && !self->_isWebContentLoaded;
  return v3;
}

- (void)p_autoplayIfDesired
{
  unsigned int v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[THWWebRep autoplayConfig](self, "autoplayConfig"));
  if (objc_msgSend(v4, "enabled"))
  {
    v3 = -[THWWebRep p_becameVisibleOnCanvas](self, "p_becameVisibleOnCanvas");

    if (v3)
      -[THWWebRep p_startAutoplay](self, "p_startAutoplay");
  }
  else
  {

  }
}

- (void)p_startAutoplay
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebRep webView](self, "webView"));

  if (v3)
    -[THWWebRep p_startAutoplayOnCanvas](self, "p_startAutoplayOnCanvas");
  else
    -[THWWebRep setAutoplayRequested:](self, "setAutoplayRequested:", 1);
}

- (void)p_pauseOnCanvas
{
  id v2;

  if (self->_ownsWebView && self->_isWebContentLoaded)
  {
    v2 = (id)objc_claimAutoreleasedReturnValue(-[THWWebRep bridgeController](self, "bridgeController"));
    objc_msgSend(v2, "tellBrowserToPauseAudioVisual");

  }
}

- (void)p_startAutoplayOnCanvas
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (self->_ownsWebView)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebRep webView](self, "webView"));

    if (!v3)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWWebRep p_startAutoplayOnCanvas]"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Web/THWWebRep.m"));
      objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, v6, 1406, CFSTR("invalid nil value for '%s'"), "self.webView");

    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebRep bridgeController](self, "bridgeController"));
    objc_msgSend(v7, "tellBrowserWillEnterWidgetMode:", 1);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebRep bridgeController](self, "bridgeController"));
    objc_msgSend(v8, "tellBrowserDidEnterWidgetMode:", 1);

    if (!self->_isWebContentLoaded)
      -[THWWebRep p_loadSourceURL](self, "p_loadSourceURL");
  }
}

- (void)handleNotificationVantageDidChange:(id)a3
{
  void *v4;
  id v5;

  if (self->_ownsWebView)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
    v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("THVantageChangeReason")));

    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("THVantageChangeReasonScrolling")) & 1) == 0
      && !objc_msgSend(v5, "isEqualToString:", CFSTR("THVantageChangeReasonWindowResize"))
      || (-[THWWebRep isVisibleOnCanvas](self, "isVisibleOnCanvas") & 1) == 0)
    {
      -[THWWebRep p_pauseOnCanvas](self, "p_pauseOnCanvas");
    }

  }
}

- (void)p_loadSourceURL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD activity_block[5];
  id v12;

  if (!-[THWWebBridgeController injectedWidgetObject](self->_bridgeController, "injectedWidgetObject"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWWebRep p_loadSourceURL]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Web/THWWebRep.m"));
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, v5, 1438, CFSTR("shouldn't load URL before wigdet object has been injected"));

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebRep info](self, "info"));
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sourceURL"));

  if ((objc_msgSend(v10, "isFileURL") & 1) == 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWWebRep p_loadSourceURL]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Web/THWWebRep.m"));
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, v9, 1441, CFSTR("can't handle non-file URLs"));

  }
  if (objc_msgSend(v10, "isFileURL"))
  {
    activity_block[0] = _NSConcreteStackBlock;
    activity_block[1] = 3221225472;
    activity_block[2] = sub_1906BC;
    activity_block[3] = &unk_426D80;
    activity_block[4] = self;
    v12 = v10;
    _os_activity_initiate(&dword_0, "HTML Widget Load URL", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

  }
}

- (id)p_filteredOutURLSchemes
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebRep info](self, "info"));
  if ((objc_msgSend(v3, "allowNetworkAccess") & 1) == 0)
  {

    goto LABEL_5;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebRep info](self, "info"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "autoplayConfig"));
  v6 = objc_msgSend(v5, "enabled");

  if (v6)
  {
LABEL_5:
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("ftp"), CFSTR("http"), CFSTR("https"), 0));
    return v7;
  }
  v7 = 0;
  return v7;
}

- (void)p_exposeWebView
{
  void *v3;
  _QWORD v4[5];

  if (-[THWWebRep ownsWebView](self, "ownsWebView"))
  {
    -[THWWebRep setDeferExposeWebView:](self, "setDeferExposeWebView:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebRep webView](self, "webView"));
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_1909FC;
    v4[3] = &unk_426D30;
    v4[4] = self;
    objc_msgSend(v3, "showAnimated:duration:completion:", 1, v4, 0.150000006);

  }
  else
  {
    -[THWWebRep setDeferExposeWebView:](self, "setDeferExposeWebView:", 1);
  }
}

- (void)p_play
{
  _QWORD activity_block[5];

  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472;
  activity_block[2] = sub_190AA8;
  activity_block[3] = &unk_426D30;
  activity_block[4] = self;
  _os_activity_initiate(&dword_0, "Play", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

- (void)buttonControlWasPressed:(id)a3
{
  void *v4;
  unsigned __int8 v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebRep pressableHandler](self, "pressableHandler", a3));
  v5 = objc_msgSend(v4, "widgetInteractionDisabledOnPage");

  if ((v5 & 1) != 0)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[THWWebRep pressableHandler](self, "pressableHandler"));
    objc_msgSend(v6, "spoofGesture");

  }
  else
  {
    -[THWWebRep p_play](self, "p_play");
  }
}

- (id)buttonControl:(id)a3 imageForState:(int)a4 highlighted:(BOOL)a5
{
  return 0;
}

- (void)buttonControl:(id)a3 didUpdateLayer:(id)a4
{
  id v5;
  id v6;
  double height;
  void *v8;
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
  CATransform3D v21;
  CATransform3D v22;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v5, "setContentsGravity:", kCAGravityResizeAspectFill);
  height = CGSizeZero.height;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "canvas"));

  objc_msgSend(v8, "viewScale");
  v10 = TSDMultiplySizeScalar(CGSizeZero.width, height, v9);
  v12 = v11;

  objc_msgSend(v5, "bounds");
  v15 = TSDShrinkSizeToFitInSize(v10, v12, v13, v14);
  v17 = v16;
  objc_msgSend(v5, "bounds");
  v20 = THScaleNeededToFitSizeInSize(v18, v19, v15, v17);
  CATransform3DMakeScale(&v22, v20, v20, 1.0);
  v21 = v22;
  objc_msgSend(v5, "setTransform:", &v21);

}

- (BOOL)p_pointIsInRedZone:(CGPoint)a3 onView:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  double v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  double width;
  double v19;
  double height;
  THWExpandedRepController *expandedRepController;
  unsigned int v22;
  double v23;
  CGFloat v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  double v29;
  double v30;
  double v31;
  CGFloat v32;
  void *v33;
  double v34;
  double v35;
  BOOL v36;
  BOOL v37;
  CGFloat v39;
  double v40;
  CGPoint v41;
  CGPoint v42;
  CGRect v43;
  CGRect v44;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  if (-[THWWebRep isExpanded](self, "isExpanded"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebRep interactiveCanvasController](self, "interactiveCanvasController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "delegate"));
    v10 = TSUProtocolCast(&OBJC_PROTOCOL___THWExpandedViewController, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "view"));
    objc_msgSend(v12, "bounds");
    v14 = v13;
    v16 = v15;
    width = v17;
    height = v19;

    expandedRepController = self->_expandedRepController;
    if (expandedRepController)
    {
      v22 = -[THWExpandedRepController expandedRepControllerHasRoomForPanels](expandedRepController, "expandedRepControllerHasRoomForPanels");
      v23 = 75.0;
      if (!v22)
        v23 = 0.0;
    }
    else
    {
      v23 = 75.0;
    }
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "view", v16 + v23, height - v23));
    objc_msgSend(v7, "convertPoint:toView:", v33, x, y);
    x = v34;
    v24 = v35;

    goto LABEL_11;
  }
  v24 = y;
  v25 = objc_opt_class(THDocumentViewController);
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebRep interactiveCanvasController](self, "interactiveCanvasController"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "delegate"));
  TSUDynamicCast(v25, v27);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v28);

  if (!v11)
  {
    v14 = CGRectZero.origin.x;
    v16 = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
    v39 = v16;
    v40 = height;
LABEL_11:
    v30 = width;
    v32 = v14;
    goto LABEL_12;
  }
  objc_msgSend(v11, "paginatedPageSize");
  v30 = floor(v29);
  height = floor(v31);
  width = v30 + -150.0;
  v40 = height + -75.0;
  v16 = 0.0;
  v14 = 75.0;
  v39 = 75.0;
  v32 = 0.0;
LABEL_12:

  v43.origin.x = v32;
  v43.origin.y = v16;
  v43.size.width = v30;
  v43.size.height = height;
  v41.x = x;
  v41.y = v24;
  v36 = CGRectContainsPoint(v43, v41);
  v44.origin.x = v14;
  v44.origin.y = v39;
  v44.size.height = v40;
  v44.size.width = width;
  v42.x = x;
  v42.y = v24;
  v37 = v36 & !CGRectContainsPoint(v44, v42);

  return v37;
}

- (BOOL)p_stageAlmostCoversPage
{
  BOOL v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;

  if (-[THWWebRep isExpanded](self, "isExpanded"))
    return 0;
  v4 = objc_opt_class(THDocumentViewController);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebRep interactiveCanvasController](self, "interactiveCanvasController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "delegate"));
  TSUDynamicCast(v4, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if (v8)
  {
    objc_msgSend(v8, "paginatedPageSize");
    v10 = v9;
    v12 = v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebRep layout](self, "layout"));
    objc_msgSend(v13, "stageFrame");
    v15 = v14;
    v17 = v16;

    v3 = v17 > v12 + -75.0 && v15 > v10 + -150.0;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)p_cachedLoadExternalContentApproval
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BEDocumentExternalLoadApprovalCache sharedInstance](BEDocumentExternalLoadApprovalCache, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebRep info](self, "info"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bookID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "cachedApprovalForBookID:", v5));

  return v6;
}

- (void)p_cacheLoadExternalContentApproval:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[BEDocumentExternalLoadApprovalCache sharedInstance](BEDocumentExternalLoadApprovalCache, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[THWWebRep info](self, "info"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bookID"));
  objc_msgSend(v7, "cachedApproval:forBookID:", v3, v6);

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

- (THWFreeTransformableRepGestureTargetHandler)freeTransformableHandler
{
  return self->_freeTransformableHandler;
}

- (THWPlatformWebViewProtocol)webView
{
  return self->_webView;
}

- (void)setWebView:(id)a3
{
  objc_storeStrong((id *)&self->_webView, a3);
}

- (THWWebBridgeController)bridgeController
{
  return self->_bridgeController;
}

- (void)setBridgeController:(id)a3
{
  objc_storeStrong((id *)&self->_bridgeController, a3);
}

- (void)setStageView:(id)a3
{
  objc_storeStrong((id *)&self->_stageView, a3);
}

- (void)setWebViewPosterLayer:(id)a3
{
  objc_storeStrong((id *)&self->_webViewPosterLayer, a3);
}

- (void)setCanvasPosterLayer:(id)a3
{
  objc_storeStrong((id *)&self->_canvasPosterLayer, a3);
}

- (BOOL)isWebContentLoaded
{
  return self->_isWebContentLoaded;
}

- (void)setIsWebContentLoaded:(BOOL)a3
{
  self->_isWebContentLoaded = a3;
}

- (BOOL)playButtonPressed
{
  return self->_playButtonPressed;
}

- (void)setPlayButtonPressed:(BOOL)a3
{
  self->_playButtonPressed = a3;
}

- (BOOL)ownsWebView
{
  return self->_ownsWebView;
}

- (void)setOwnsWebView:(BOOL)a3
{
  self->_ownsWebView = a3;
}

- (BOOL)createdWebView
{
  return self->_createdWebView;
}

- (void)setCreatedWebView:(BOOL)a3
{
  self->_createdWebView = a3;
}

- (BOOL)deferExposeWebView
{
  return self->_deferExposeWebView;
}

- (void)setDeferExposeWebView:(BOOL)a3
{
  self->_deferExposeWebView = a3;
}

- (BOOL)suspendPosterRendering
{
  return self->_suspendPosterRendering;
}

- (void)setSuspendPosterRendering:(BOOL)a3
{
  self->_suspendPosterRendering = a3;
}

- (THWPressableRepGestureTargetHandler)pressableHandler
{
  return self->_pressableHandler;
}

- (void)setPressableHandler:(id)a3
{
  objc_storeStrong((id *)&self->_pressableHandler, a3);
}

- (THWExpandedRepController)expandedRepController
{
  return self->_expandedRepController;
}

- (void)setExpandedRepController:(id)a3
{
  self->_expandedRepController = (THWExpandedRepController *)a3;
}

- (BOOL)panelDescriptionExpanded
{
  return self->_panelDescriptionExpanded;
}

- (void)setPanelDescriptionExpanded:(BOOL)a3
{
  self->_panelDescriptionExpanded = a3;
}

- (BOOL)autoplayRequested
{
  return self->_autoplayRequested;
}

- (void)setAutoplayRequested:(BOOL)a3
{
  self->_autoplayRequested = a3;
}

- (BOOL)isExpanding
{
  return self->_expanding;
}

- (void)setExpanding:(BOOL)a3
{
  self->_expanding = a3;
}

- (CGRect)deferredStageViewFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_deferredStageViewFrame.origin.x;
  y = self->_deferredStageViewFrame.origin.y;
  width = self->_deferredStageViewFrame.size.width;
  height = self->_deferredStageViewFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setDeferredStageViewFrame:(CGRect)a3
{
  self->_deferredStageViewFrame = a3;
}

- (void)setRequestScope:(id)a3
{
  objc_storeStrong((id *)&self->_requestScope, a3);
}

- (BOOL)stageAlmostCoversPage
{
  return self->_stageAlmostCoversPage;
}

- (void)setStageAlmostCoversPage:(BOOL)a3
{
  self->_stageAlmostCoversPage = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestScope, 0);
  objc_storeStrong((id *)&self->_pressableHandler, 0);
  objc_storeStrong((id *)&self->_canvasPosterLayer, 0);
  objc_storeStrong((id *)&self->_webViewPosterLayer, 0);
  objc_storeStrong((id *)&self->_stageView, 0);
  objc_storeStrong((id *)&self->_bridgeController, 0);
  objc_storeStrong((id *)&self->_webView, 0);
  objc_storeStrong((id *)&self->_animationController, 0);
  objc_storeStrong((id *)&self->_freeTransformableHandler, 0);
}

@end
