@implementation THWInteractiveImageWidgetRep

- (THWInteractiveImageWidgetRep)initWithLayout:(id)a3 canvas:(id)a4
{
  THWInteractiveImageWidgetRep *v4;
  THWInteractiveImageWidgetController *v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  THWOverlayableZoomableCanvasController *v15;
  THWOverlayableZoomableCanvasController *stageCanvasController;
  double v17;
  uint64_t v18;
  double v19;
  id v20;
  id v21;
  THWPressableRepGestureTargetHandler *v22;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)THWInteractiveImageWidgetRep;
  v4 = -[THWInteractiveImageWidgetRep initWithLayout:canvas:](&v24, "initWithLayout:canvas:", a3, a4);
  if (v4)
  {
    v4->_freeTransformableHandler = -[THWFreeTransformableRepGestureTargetHandler initWithFreeTransformableRep:handler:]([THWFreeTransformableRepGestureTargetHandler alloc], "initWithFreeTransformableRep:handler:", v4, objc_msgSend(objc_msgSend(-[THWInteractiveImageWidgetRep hostICC](v4, "hostICC"), "widgetHost"), "freeTransformRepHandler"));
    v5 = -[THWInteractiveImageWidgetController initWithLayout:]([THWInteractiveImageWidgetController alloc], "initWithLayout:", -[THWInteractiveImageWidgetRep layout](v4, "layout"));
    v4->_controller = v5;
    -[THWInteractiveImageWidgetController setDelegate:](v5, "setDelegate:", v4);
    v4->_borderColor = (CGColor *)objc_msgSend(+[TSUColor clearColor](TSUColor, "clearColor"), "CGColor");
    v4->_animationPreviousCalloutIndex = 0x7FFFFFFFFFFFFFFFLL;
    v6 = -[THWInteractiveImageWidgetRep layout](v4, "layout");
    objc_msgSend(v6, "stageFrame");
    objc_msgSend(v6, "rectInRoot:");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v15 = -[THWOverlayableZoomableCanvasController initWithFrame:documentRoot:delegate:]([THWOverlayableZoomableCanvasController alloc], "initWithFrame:documentRoot:delegate:", objc_msgSend(-[THWInteractiveImageWidgetRep interactiveCanvasController](v4, "interactiveCanvasController"), "documentRoot"), v4, v7, v9, v11, v13);
    v4->_stageCanvasController = v15;
    -[THWOverlayableZoomableCanvasController createLayerHostIfNeededWithFrame:](v15, "createLayerHostIfNeededWithFrame:", v8, v10, v12, v14);
    -[THWOverlayableZoomableCanvasController setDelegate:](v4->_stageCanvasController, "setDelegate:", v4);
    stageCanvasController = v4->_stageCanvasController;
    objc_msgSend(-[THWInteractiveImageWidgetRep canvas](v4, "canvas"), "viewScale");
    -[THWOverlayableZoomableCanvasController setNaturalFrame:scale:](stageCanvasController, "setNaturalFrame:scale:", v8, v10, v12, v14, v17);
    -[THWInteractiveImageWidgetRep p_setupInitialZoom](v4, "p_setupInitialZoom");
    -[THWInteractiveImageWidgetRep p_setupBorderAndBackground](v4, "p_setupBorderAndBackground");
    objc_msgSend(-[THWInteractiveImageWidgetRep layout](v4, "layout"), "setStageCanvasController:", v4->_stageCanvasController);
    v18 = objc_opt_class(THInteractiveCanvasController);
    *(_QWORD *)&v19 = TSUDynamicCast(v18, -[THWInteractiveImageWidgetRep interactiveCanvasController](v4, "interactiveCanvasController")).n128_u64[0];
    v21 = objc_msgSend(v20, "pressHandlerForPressableReps", v19);
    if (v21)
    {
      v22 = -[THWPressableRepGestureTargetHandler initWithPressableRep:pressHandler:]([THWPressableRepGestureTargetHandler alloc], "initWithPressableRep:pressHandler:", v4, v21);
      v4->_pressableHandler = v22;
      -[THWPressableRepGestureTargetHandler setEnabledOnlyIfWidgetInteractionDisabledOnPage:](v22, "setEnabledOnlyIfWidgetInteractionDisabledOnPage:", 1);
    }
    -[THWInteractiveImageWidgetRep widgetInteractionModeChanged](v4, "widgetInteractionModeChanged");
    if (-[THWInteractiveImageWidgetRep isExpanded](v4, "isExpanded"))
    {
      v4->_calloutsHidden = 1;
      v4->_wantsCachedImage = 1;
    }
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  self->mAnimationController = 0;
  -[THWInteractiveImageWidgetController setDelegate:](self->_controller, "setDelegate:", 0);

  -[THWImageCropAnimationController teardownWrapperLayer](self->_imageCropAnimationController, "teardownWrapperLayer");
  self->_imageCropAnimationController = 0;
  -[THWOverlayableZoomableCanvasController setDelegate:](self->_stageCanvasController, "setDelegate:", 0);
  -[THWOverlayableZoomableCanvasController teardownController](self->_stageCanvasController, "teardownController");
  -[THWOverlayableZoomableCanvasController teardownView](self->_stageCanvasController, "teardownView");

  v3.receiver = self;
  v3.super_class = (Class)THWInteractiveImageWidgetRep;
  -[THWInteractiveImageWidgetRep dealloc](&v3, "dealloc");
}

- (void)willBeRemoved
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWInteractiveImageWidgetRep;
  -[THWInteractiveImageWidgetRep willBeRemoved](&v3, "willBeRemoved");
  -[CALayer setDelegate:](self->_stageBackgroundLayer, "setDelegate:", 0);
}

- (CGRect)naturalBoundsForHitTesting
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  objc_msgSend(-[THWInteractiveImageWidgetRep layout](self, "layout"), "stageFrame");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (BOOL)p_createViewIfNeededWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id v8;
  void *v9;
  unsigned int v10;
  double v11;
  THWOverlayableZoomableCanvasController *stageCanvasController;
  double v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = -[THWInteractiveImageWidgetRep layout](self, "layout");
  if (self->_stageCanvasController)
  {
    v9 = v8;
    v10 = objc_msgSend(-[THWInteractiveImageWidgetRep layout](self, "layout"), "stageVisible");
    if (v10)
    {
      v10 = -[THWOverlayableZoomableCanvasController createViewIfNeededWithFrame:](self->_stageCanvasController, "createViewIfNeededWithFrame:", x, y, width, height);
      if (v10)
      {
        objc_msgSend(v9, "stageCornerRadius");
        -[CALayer setCornerRadius:](-[UIView layer](-[THWOverlayableZoomableCanvasController view](self->_stageCanvasController, "view"), "layer"), "setCornerRadius:", v11);
        -[THWOverlayableZoomableCanvasController setupImmediatePressGesture](self->_stageCanvasController, "setupImmediatePressGesture");
        stageCanvasController = self->_stageCanvasController;
        objc_msgSend(-[THWInteractiveImageWidgetRep canvas](self, "canvas"), "viewScale");
        -[THWOverlayableZoomableCanvasController setNaturalFrame:scale:](stageCanvasController, "setNaturalFrame:scale:", x, y, width, height, v13);
        -[THWInteractiveImageWidgetRep p_setupInitialZoom](self, "p_setupInitialZoom");
        -[THWInteractiveImageWidgetRep p_setupBorderAndBackground](self, "p_setupBorderAndBackground");
        -[THWInteractiveImageWidgetRep p_adjustScrollViewContentInsets](self, "p_adjustScrollViewContentInsets");
        -[THWInteractiveImageWidgetRep widgetInteractionModeChanged](self, "widgetInteractionModeChanged");
        LOBYTE(v10) = 1;
      }
    }
  }
  else
  {
    LOBYTE(v10) = 0;
  }
  return v10;
}

- (id)calloutReps
{
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v3 = +[NSMutableArray array](NSMutableArray, "array");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = objc_msgSend(-[THWInteractiveImageWidgetRep layout](self, "layout", 0), "calloutLayouts");
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = -[TSDInteractiveCanvasController repForLayout:](-[THWOverlayableZoomableCanvasController scrollContainerICC](self->_stageCanvasController, "scrollContainerICC"), "repForLayout:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v8));
        if (v9)
          objc_msgSend(v3, "addObject:", v9);
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }
  return v3;
}

- (void)setCalloutsVisible:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a4;
  v5 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = -[THWInteractiveImageWidgetRep calloutReps](self, "calloutReps", 0);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v11), "setVisible:animated:", v5, v4);
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }
  v12 = -[THWInteractiveImageWidgetRep p_sidebarRep](self, "p_sidebarRep");
  if (v12)
    objc_msgSend(v12, "setVisible:animated:", v5, v4);
  else
    objc_msgSend(objc_msgSend(-[THWInteractiveImageWidgetRep layout](self, "layout"), "sidebarLayout"), "setHidden:", v5 ^ 1);
}

- (unint64_t)viewportIndex
{
  return -[THWInteractiveImageWidgetController calloutIndex](-[THWInteractiveImageWidgetRep controller](self, "controller"), "calloutIndex");
}

- (BOOL)directlyManagesLayerContent
{
  return 1;
}

- (double)zoomDuration
{
  double v3;
  double result;

  -[THWInteractiveImageWidgetRep rotationDuration](self, "rotationDuration");
  if (v3 == 0.0)
    return 0.5;
  -[THWInteractiveImageWidgetRep rotationDuration](self, "rotationDuration");
  return result;
}

- (id)p_imageRep
{
  uint64_t v3;
  id result;

  v3 = objc_opt_class(TSDImageRep);
  TSUDynamicCast(v3, -[TSDInteractiveCanvasController repForInfo:](-[THWOverlayableZoomableCanvasController scrollContentICC](self->_stageCanvasController, "scrollContentICC"), "repForInfo:", objc_msgSend(-[THWInteractiveImageWidgetRep info](self, "info"), "backgroundImageInfo")));
  return result;
}

- (void)willReplaceContentsFromRep:(id)a3
{
  uint64_t v5;
  void *v6;
  double v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;

  v5 = objc_opt_class(THWInteractiveImageWidgetRep);
  *(_QWORD *)&v7 = TSUDynamicCast(v5, a3).n128_u64[0];
  if (v6)
  {
    v8 = v6;
    -[THWInteractiveImageWidgetRep setUseStoredViewportIndex:](self, "setUseStoredViewportIndex:", 1, v7);
    -[THWInteractiveImageWidgetRep setStoredViewportIndex:](self, "setStoredViewportIndex:", objc_msgSend(v8, "viewportIndex"));
    objc_msgSend(-[THWInteractiveImageWidgetRep layout](self, "layout"), "setSelectedCalloutIndex:", objc_msgSend(objc_msgSend(v8, "layout"), "selectedCalloutIndex"));
    -[THWInteractiveImageWidgetRep setStageBackgroundImage:](self, "setStageBackgroundImage:", objc_msgSend(v8, "stageBackgroundImage"));
    if (-[THWInteractiveImageWidgetRep isExpanded](self, "isExpanded"))
    {
      v9 = objc_msgSend(v8, "p_imageRep");

      self->_cachedImage = 0;
      self->_cachedImage = (TSDImageRepCachedSizedImage *)objc_msgSend(v9, "newCachedSizedImage");
    }
    else
    {
      v10 = -[THWInteractiveImageWidgetRep p_imageRep](self, "p_imageRep");
      objc_msgSend(v10, "pushDisableImageSizing");
      v11 = objc_msgSend(v8, "viewportIndex");
      if (v11 == (id)-[THWInteractiveImageWidgetController calloutIndex](self->_controller, "calloutIndex")
        || (v12 = objc_msgSend(objc_msgSend(v8, "p_imageRep"), "newCachedSizedImage")) == 0)
      {
        -[THWInteractiveImageWidgetController selectOption:force:animated:](self->_controller, "selectOption:force:animated:", objc_msgSend(v8, "viewportIndex"), 1, 0);
      }
      else
      {
        v13 = v12;
        objc_msgSend(v10, "useCachedSizedImage:", v12);

        -[THWInteractiveImageWidgetController selectOption:force:animated:](self->_controller, "selectOption:force:animated:", objc_msgSend(v8, "viewportIndex"), 1, 0);
        objc_msgSend(objc_msgSend(v10, "interactiveCanvasController"), "layoutIfNeeded");
        objc_msgSend(v10, "generateSizedImageOnBackgroundThread");
      }
    }
  }
}

- (void)replaceContentsFromRep:(id)a3
{
  uint64_t v5;
  void *v6;
  double v7;
  void *v8;

  v5 = objc_opt_class(THWInteractiveImageWidgetRep);
  *(_QWORD *)&v7 = TSUDynamicCast(v5, a3).n128_u64[0];
  if (v6)
  {
    v8 = v6;
    objc_msgSend(-[THWInteractiveImageWidgetRep layout](self, "layout"), "setSelectedCalloutIndex:", objc_msgSend(objc_msgSend(v6, "layout", v7), "selectedCalloutIndex"));
    -[THWExpandedRepController expandedRepControllerInvalidateChildrenInPanel:invalidateWPAuto:](self->_expandedRepController, "expandedRepControllerInvalidateChildrenInPanel:invalidateWPAuto:", 1, 1);
    -[THWInteractiveImageWidgetController selectOption:force:animated:](self->_controller, "selectOption:force:animated:", objc_msgSend(v8, "viewportIndex"), 1, 0);
  }
  if (!-[THWInteractiveImageWidgetRep isExpanded](self, "isExpanded", v7))
    objc_msgSend(-[THWInteractiveImageWidgetRep p_imageRep](self, "p_imageRep"), "popDisableImageSizing");
}

- (void)widgetInteractionModeChanged
{
  _BOOL8 v3;

  if (-[THWInteractiveImageWidgetRep pressableHandler](self, "pressableHandler"))
    v3 = -[THWPressableRepGestureTargetHandler widgetInteractionEnabled](-[THWInteractiveImageWidgetRep pressableHandler](self, "pressableHandler"), "widgetInteractionEnabled");
  else
    v3 = 1;
  -[THWInteractiveImageWidgetRep setUserInteractionEnabled:](self, "setUserInteractionEnabled:", v3);
}

- (void)viewScaleDidChange
{
  double v3;
  double v4;
  double v5;
  double v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  THWOverlayableZoomableCanvasController *stageCanvasController;
  double v17;
  id v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  objc_super v24;

  -[TSDInteractiveCanvasController contentOffset](-[THWOverlayableZoomableCanvasController scrollContentICC](-[THWInteractiveImageWidgetRep stageCanvasController](self, "stageCanvasController"), "scrollContentICC"), "contentOffset");
  v4 = v3;
  v6 = v5;
  v24.receiver = self;
  v24.super_class = (Class)THWInteractiveImageWidgetRep;
  -[THWInteractiveImageWidgetRep updateFromLayout](&v24, "updateFromLayout");
  v7 = -[THWInteractiveImageWidgetRep layout](self, "layout");
  objc_msgSend(-[THWInteractiveImageWidgetRep layout](self, "layout"), "stageFrame");
  objc_msgSend(v7, "rectInRoot:");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  stageCanvasController = self->_stageCanvasController;
  objc_msgSend(-[THWInteractiveImageWidgetRep interactiveCanvasController](self, "interactiveCanvasController"), "viewScale");
  -[THWOverlayableZoomableCanvasController setNaturalFrame:scale:](stageCanvasController, "setNaturalFrame:scale:", v9, v11, v13, v15, v17);
  -[THWInteractiveImageWidgetRep p_invalidateCalloutReps](self, "p_invalidateCalloutReps");
  v18 = objc_msgSend(-[THWInteractiveImageWidgetRep info](self, "info"), "calloutAtIndex:", -[THWInteractiveImageWidgetRep viewportIndex](self, "viewportIndex"));
  objc_msgSend(v18, "viewScale");
  v20 = TSDMultiplyPointScalar(v4, v6, v19);
  v22 = v21;
  objc_msgSend(v18, "viewScale");
  -[THWInteractiveImageWidgetRep p_updateDiagramWithZoom:offset:animated:previousCalloutIndex:completion:](self, "p_updateDiagramWithZoom:offset:animated:previousCalloutIndex:completion:", 0, -[THWInteractiveImageWidgetRep viewportIndex](self, "viewportIndex"), 0, v23, v20, v22);
}

- (void)screenScaleDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWInteractiveImageWidgetRep;
  -[THWInteractiveImageWidgetRep screenScaleDidChange](&v3, "screenScaleDidChange");
  -[THWOverlayableZoomableCanvasController screenScaleDidChange](self->_stageCanvasController, "screenScaleDidChange");
  objc_msgSend(-[THWInteractiveImageWidgetRep canvas](self, "canvas"), "contentsScale");
  -[CALayer setContentsScale:](self->_stageBackgroundLayer, "setContentsScale:");
  -[THWInteractiveImageWidgetRep setStageBackgroundImage:](self, "setStageBackgroundImage:", 0);
}

- (void)didUpdateLayer:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THWInteractiveImageWidgetRep;
  -[THWInteractiveImageWidgetRep didUpdateLayer:](&v4, "didUpdateLayer:", a3);
  -[THWInteractiveImageWidgetRep p_updateStageBackgroundLayer](self, "p_updateStageBackgroundLayer");
}

- (void)p_updateStageBackgroundLayerFromLayout
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;

  v3 = -[THWInteractiveImageWidgetRep layout](self, "layout");
  objc_msgSend(-[THWInteractiveImageWidgetRep layout](self, "layout"), "stageFrame");
  objc_msgSend(v3, "rectInRoot:");
  v5 = v4;
  v7 = v6;
  -[CALayer setPosition:](self->_stageBackgroundLayer, "setPosition:", CGPointZero.x, CGPointZero.y);
  objc_msgSend(-[THWInteractiveImageWidgetRep canvas](self, "canvas"), "viewScale");
  TSDMultiplySizeScalar(v5, v7, v8);
  TSDRectWithSize(v9);
  -[CALayer setBounds:](self->_stageBackgroundLayer, "setBounds:", TSDRoundedRect(v10));
}

- (void)updateFromLayout
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWInteractiveImageWidgetRep;
  -[THWInteractiveImageWidgetRep updateFromLayout](&v3, "updateFromLayout");
  -[THWInteractiveImageWidgetRep p_updateStageBackgroundLayerFromLayout](self, "p_updateStageBackgroundLayerFromLayout");
}

- (BOOL)p_isStageBackgroundTransparent
{
  uint64_t v3;
  void *v4;
  double v5;
  void *v6;
  double v8;

  v3 = objc_opt_class(TSDFill);
  *(_QWORD *)&v5 = TSUDynamicCast(v3, objc_msgSend(-[THWInteractiveImageWidgetRep info](self, "info"), "backgroundFill")).n128_u64[0];
  if (!v4)
    return 1;
  v6 = v4;
  if (objc_msgSend(v4, "fillType", v5))
    return 0;
  objc_msgSend(objc_msgSend(v6, "referenceColor"), "alphaComponent");
  return v8 == 0.0;
}

- (void)p_updateStageBackgroundLayer
{
  CALayer *v3;
  double y;
  uint64_t v5;
  double v6;
  void *v7;
  void *v8;
  id v9;
  CGColorRef v10;
  TSUImage *stageBackgroundImage;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  _QWORD v17[7];

  if (!self->_stageBackgroundLayer)
  {
    v3 = (CALayer *)objc_alloc_init((Class)CALayer);
    self->_stageBackgroundLayer = v3;
    y = CGPointZero.y;
    -[CALayer setAnchorPoint:](v3, "setAnchorPoint:", CGPointZero.x, y);
    -[CALayer setPosition:](self->_stageBackgroundLayer, "setPosition:", CGPointZero.x, y);
    objc_msgSend(-[THWInteractiveImageWidgetRep canvas](self, "canvas"), "contentsScale");
    -[CALayer setContentsScale:](self->_stageBackgroundLayer, "setContentsScale:");
    -[CALayer setDelegate:](self->_stageBackgroundLayer, "setDelegate:", -[THWInteractiveImageWidgetRep interactiveCanvasController](self, "interactiveCanvasController"));
    -[THWOverlayableZoomableCanvasController setBackgroundLayer:](self->_stageCanvasController, "setBackgroundLayer:", self->_stageBackgroundLayer);
  }
  -[THWInteractiveImageWidgetRep p_updateStageBackgroundLayerFromLayout](self, "p_updateStageBackgroundLayerFromLayout");
  v5 = objc_opt_class(TSDFill);
  *(_QWORD *)&v6 = TSUDynamicCast(v5, objc_msgSend(-[THWInteractiveImageWidgetRep info](self, "info"), "backgroundFill")).n128_u64[0];
  v8 = v7;
  v9 = 0;
  v10 = 0;
  if (!-[THWInteractiveImageWidgetRep p_isStageBackgroundTransparent](self, "p_isStageBackgroundTransparent", v6) && v8)
  {
    if (objc_msgSend(v8, "fillType"))
    {
      stageBackgroundImage = self->_stageBackgroundImage;
      if (!stageBackgroundImage)
      {
        -[CALayer contentsScale](self->_stageBackgroundLayer, "contentsScale");
        v13 = fmin(v12, 1.0);
        objc_msgSend(objc_msgSend(-[THWInteractiveImageWidgetRep info](self, "info"), "stageGeometry"), "frame");
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472;
        v17[2] = sub_157D38;
        v17[3] = &unk_42A010;
        v17[4] = v8;
        v17[5] = TSDMultiplySizeScalar(v14, v15, v13);
        v17[6] = v16;
        -[THWInteractiveImageWidgetRep setStageBackgroundImage:](self, "setStageBackgroundImage:", +[TSUImage imageWithSize:drawnUsingBlock:](TSUImage, "imageWithSize:drawnUsingBlock:", v17));
        stageBackgroundImage = self->_stageBackgroundImage;
      }
      v9 = -[TSUImage CGImage](stageBackgroundImage, "CGImage");
      -[CALayer setContentsGravity:](self->_stageBackgroundLayer, "setContentsGravity:", kCAGravityResize);
      v10 = 0;
    }
    else
    {
      v10 = (CGColorRef)objc_msgSend(objc_msgSend(v8, "referenceColor"), "CGColor");
      v9 = 0;
    }
  }
  if (v10 != -[CALayer backgroundColor](self->_stageBackgroundLayer, "backgroundColor"))
    -[CALayer setBackgroundColor:](self->_stageBackgroundLayer, "setBackgroundColor:", v10);
  if (v9 != -[CALayer contents](self->_stageBackgroundLayer, "contents"))
    -[CALayer setContents:](self->_stageBackgroundLayer, "setContents:", v9);
}

- (void)addChildViewsToArray:(id)a3
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  THWOverlayableZoomableCanvasController *v15;
  double v16;
  UIView *v17;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWInteractiveImageWidgetRep addChildViewsToArray:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/InteractiveImage/THWInteractiveImageWidgetRep.m"), 587, CFSTR("This operation must only be performed on the main thread."));
  v5 = -[THWInteractiveImageWidgetRep layout](self, "layout");
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v5, "stageFrame");
    objc_msgSend(v6, "rectInRoot:");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    -[THWInteractiveImageWidgetRep p_createViewIfNeededWithFrame:](self, "p_createViewIfNeededWithFrame:");
    v15 = -[THWInteractiveImageWidgetRep stageCanvasController](self, "stageCanvasController");
    objc_msgSend(-[THWInteractiveImageWidgetRep canvas](self, "canvas"), "viewScale");
    -[THWOverlayableZoomableCanvasController setNaturalFrame:scale:](v15, "setNaturalFrame:scale:", v8, v10, v12, v14, v16);
    v17 = -[THWOverlayableZoomableCanvasController view](-[THWInteractiveImageWidgetRep stageCanvasController](self, "stageCanvasController"), "view");
    if (v17)
      objc_msgSend(a3, "addObject:", v17);
  }
}

- (id)viewControllerForView:(id)a3
{
  THWOverlayableZoomableCanvasController *v4;

  v4 = -[THWInteractiveImageWidgetRep stageCanvasController](self, "stageCanvasController");
  if (-[THWOverlayableZoomableCanvasController view](v4, "view") == a3)
    return -[THWOverlayableZoomableCanvasController viewController](v4, "viewController");
  else
    return 0;
}

- (int)positionForChildView:(id)a3
{
  return 2;
}

- (void)willRemoveChildView:(id)a3
{
  THWOverlayableZoomableCanvasController *stageCanvasController;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWInteractiveImageWidgetRep willRemoveChildView:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/InteractiveImage/THWInteractiveImageWidgetRep.m"), 645, CFSTR("This operation must only be performed on the main thread."));
  stageCanvasController = self->_stageCanvasController;
  if (stageCanvasController)
  {
    if (-[THWOverlayableZoomableCanvasController view](stageCanvasController, "view") == a3)
      -[THWOverlayableZoomableCanvasController teardownView](self->_stageCanvasController, "teardownView");
  }
}

- (double)baseViewScale
{
  double result;

  objc_msgSend(-[THWInteractiveImageWidgetRep layout](self, "layout"), "baseViewScale");
  return result;
}

- (CGPoint)p_clientScaledContentOffsetFromScrollview
{
  double v3;
  double v4;
  CGPoint result;

  -[THWOverlayableZoomableCanvasController contentOffset](-[THWInteractiveImageWidgetRep stageCanvasController](self, "stageCanvasController"), "contentOffset");
  -[THWInteractiveImageWidgetRep p_clientScaledFromScrollScaledPoint:](self, "p_clientScaledFromScrollScaledPoint:");
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)contentOffset
{
  double v2;
  double v3;
  CGPoint result;

  -[THWInteractiveImageWidgetRep p_clientScaledContentOffsetFromScrollview](self, "p_clientScaledContentOffsetFromScrollview");
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setViewScale:(double)a3 contentOffset:(CGPoint)a4 animated:(BOOL)a5 completion:(id)a6
{
  _BOOL4 v7;
  double y;
  double x;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;

  v7 = a5;
  y = a4.y;
  x = a4.x;
  -[THWInteractiveImageWidgetRep baseViewScale](self, "baseViewScale");
  v13 = v12;
  v14 = 0.0;
  if (v7)
  {
    -[THWInteractiveImageWidgetRep zoomDuration](self, "zoomDuration");
    v14 = v15;
  }
  -[THWInteractiveImageWidgetRep rotationDuration](self, "rotationDuration");
  if (v16 != 0.0)
  {
    -[THWInteractiveImageWidgetRep rotationDuration](self, "rotationDuration");
    v14 = v17;
  }
  -[THWInteractiveImageWidgetRep p_scrollScaledFromClientScaledPoint:](self, "p_scrollScaledFromClientScaledPoint:", x, y);
  -[THWOverlayableZoomableCanvasController setViewScale:contentOffset:animationDuration:completion:](-[THWInteractiveImageWidgetRep stageCanvasController](self, "stageCanvasController"), "setViewScale:contentOffset:animationDuration:completion:", a6, v13 * a3, v18, v19, v14);
}

- (void)addAlternateLayersForChildViewsToArray:(id)a3
{
  CALayer *v4;

  v4 = -[THWOverlayableZoomableCanvasController alternateLayerForView](self->_stageCanvasController, "alternateLayerForView");
  if (v4)
    objc_msgSend(a3, "addObject:", v4);
}

- (void)viewScrollWillChange
{
  -[THWOverlayableZoomableCanvasController setRasterize:](self->_stageCanvasController, "setRasterize:", 1);
}

- (void)viewScrollingEnded
{
  -[THWOverlayableZoomableCanvasController setRasterize:](self->_stageCanvasController, "setRasterize:", 0);
}

- (BOOL)expandableShouldPreloadExpanded
{
  return 1;
}

- (BOOL)expandedPanelUseDarkAppearance
{
  return 1;
}

- (id)expandedSupportedGestureKinds
{
  return +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", TSWPImmediatePress, 0);
}

- (THAnimationController)animationController
{
  THAnimationController *result;
  THAnimationController *v4;

  result = self->mAnimationController;
  if (!result)
  {
    v4 = objc_alloc_init(THAnimationController);
    self->mAnimationController = v4;
    -[THAnimationController addObserver:](v4, "addObserver:", self);
    -[THAnimationController setSource:](self->mAnimationController, "setSource:", self);
    -[THAnimationController setShadowFadeOutDurationScale:](self->mAnimationController, "setShadowFadeOutDurationScale:", 1.0);
    -[THAnimationController setShadowTransformDurationScale:](self->mAnimationController, "setShadowTransformDurationScale:", 0.5);
    return self->mAnimationController;
  }
  return result;
}

- (void)animationControllerSetupTarget:(id)a3
{
  uint64_t v5;
  double v6;
  uint64_t v7;

  v5 = objc_opt_class(THWInteractiveImageWidgetRep);
  *(_QWORD *)&v6 = TSUDynamicCast(v5, objc_msgSend(a3, "destination")).n128_u64[0];
  -[THWInteractiveImageWidgetRep p_setupImageCropAnimationControllerWithDestinationRep:](self, "p_setupImageCropAnimationControllerWithDestinationRep:", v7, v6);
}

- (void)p_teardownImageCropAnimationControllerWithDestinationRep:(id)a3
{
  objc_msgSend(a3, "p_teardownAsAnimationDestination");
  -[THWImageCropAnimationController setBackgroundLayer:](self->_imageCropAnimationController, "setBackgroundLayer:", 0);
  -[THWOverlayableZoomableCanvasController setBackgroundLayer:](self->_stageCanvasController, "setBackgroundLayer:", self->_stageBackgroundLayer);
  -[THWInteractiveImageWidgetRep p_updateStageBackgroundLayerFromLayout](self, "p_updateStageBackgroundLayerFromLayout");
  -[THWImageCropAnimationController teardownWrapperLayer](self->_imageCropAnimationController, "teardownWrapperLayer");

  self->_imageCropAnimationController = 0;
}

- (void)animationControllerTeardownTarget:(id)a3
{
  uint64_t v5;
  double v6;
  uint64_t v7;

  if (!-[THWFreeTransformController isFreeTransformInProgress](-[THWFreeTransformableRepGestureTargetHandler ftc](-[THWInteractiveImageWidgetRep freeTransformableHandler](self, "freeTransformableHandler"), "ftc"), "isFreeTransformInProgress"))
  {
    v5 = objc_opt_class(THWInteractiveImageWidgetRep);
    *(_QWORD *)&v6 = TSUDynamicCast(v5, objc_msgSend(a3, "destination")).n128_u64[0];
    -[THWInteractiveImageWidgetRep p_teardownImageCropAnimationControllerWithDestinationRep:](self, "p_teardownImageCropAnimationControllerWithDestinationRep:", v7, v6);
  }
  -[CALayer setSublayers:](-[THWInteractiveImageWidgetRep sourceOverlayLayer](self, "sourceOverlayLayer"), "setSublayers:", 0);
  -[THWInteractiveImageWidgetRep setSourceOverlayLayer:](self, "setSourceOverlayLayer:", 0);
}

- (void)animationControllerDidPresent:(id)a3
{
  uint64_t v5;
  THWInteractiveImageWidgetRep *v6;
  double v7;
  THWInteractiveImageWidgetRep *v8;
  _QWORD v9[6];

  v5 = objc_opt_class(THWInteractiveImageWidgetRep);
  *(_QWORD *)&v7 = TSUDynamicCast(v5, objc_msgSend(a3, "destination")).n128_u64[0];
  v8 = v6;
  if (v6 != self)
    -[THWInteractiveImageWidgetRep setCalloutsVisible:animated:](v6, "setCalloutsVisible:animated:", 0, 0, v7);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1583D0;
  v9[3] = &unk_426E28;
  v9[4] = v8;
  v9[5] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v9);
}

- (void)animationControllerDidPresentPostCommit:(id)a3
{

  self->mAnimationController = 0;
}

- (void)animationControllerDidAddContentAnimations:(id)a3 uniformTargetScale:(double)a4
{
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  double v11;

  objc_msgSend(a3, "animationDuration");
  v8 = v7;
  -[THWImageCropAnimationController addAnimationWithDuration:targetScale:](self->_imageCropAnimationController, "addAnimationWithDuration:targetScale:");
  v9 = objc_opt_class(THWInteractiveImageWidgetRep);
  TSUDynamicCast(v9, objc_msgSend(a3, "destination"));
  if (v10)
    v11 = a4;
  else
    v11 = 1.0;
  -[THWImageCropAnimationController addBackgroundAnimationWithDuration:targetScale:](self->_imageCropAnimationController, "addBackgroundAnimationWithDuration:targetScale:", v8, v11);
}

- (CGAffineTransform)freeTransform
{
  __int128 v5;
  CGAffineTransform *result;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;

  v5 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&retstr->c = v5;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  result = (CGAffineTransform *)-[THWFreeTransformController isFreeTransformInProgress](-[THWFreeTransformableRepGestureTargetHandler ftc](-[THWInteractiveImageWidgetRep freeTransformableHandler](self, "freeTransformableHandler"), "ftc"), "isFreeTransformInProgress");
  if ((_DWORD)result)
  {
    result = -[THWFreeTransformableRepGestureTargetHandler ftc](-[THWInteractiveImageWidgetRep freeTransformableHandler](self, "freeTransformableHandler"), "ftc");
    if (result)
    {
      result = (CGAffineTransform *)-[CGAffineTransform currentTransform](result, "currentTransform");
    }
    else
    {
      v9 = 0u;
      v10 = 0u;
      v8 = 0u;
    }
    v7 = v9;
    *(_OWORD *)&retstr->a = v8;
    *(_OWORD *)&retstr->c = v7;
    *(_OWORD *)&retstr->tx = v10;
  }
  return result;
}

- (BOOL)shouldAnimateTargetLayer:(id)a3
{
  return 0;
}

- (id)animationLayer
{
  id result;

  if (!-[THWFreeTransformController isFreeTransformInProgress](-[THWFreeTransformableRepGestureTargetHandler ftc](-[THWInteractiveImageWidgetRep freeTransformableHandler](self, "freeTransformableHandler"), "ftc"), "isFreeTransformInProgress"))return -[THWImageCropAnimationController wrapperLayer](self->_imageCropAnimationController, "wrapperLayer");
  result = -[THWFreeTransformController freeTransformLayer](-[THWFreeTransformableRepGestureTargetHandler ftc](-[THWInteractiveImageWidgetRep freeTransformableHandler](self, "freeTransformableHandler"), "ftc"), "freeTransformLayer");
  if (!result)
    return -[THWImageCropAnimationController wrapperLayer](self->_imageCropAnimationController, "wrapperLayer");
  return result;
}

- (id)shadowAnimationLayer
{
  if (-[THWFreeTransformController isFreeTransformInProgress](-[THWFreeTransformableRepGestureTargetHandler ftc](-[THWInteractiveImageWidgetRep freeTransformableHandler](self, "freeTransformableHandler"), "ftc"), "isFreeTransformInProgress"))
  {
    return -[THWFreeTransformController shadowLayer](-[THWFreeTransformableRepGestureTargetHandler ftc](-[THWInteractiveImageWidgetRep freeTransformableHandler](self, "freeTransformableHandler"), "ftc"), "shadowLayer");
  }
  else
  {
    return 0;
  }
}

- (BOOL)shouldFadeOutAnimationLayer:(id)a3
{
  return 0;
}

- (void)animatableDestinationSetupTarget:(id)a3
{
  uint64_t v4;
  double v5;
  uint64_t v6;

  v4 = objc_opt_class(THWInteractiveImageWidgetRep);
  *(_QWORD *)&v5 = TSUDynamicCast(v4, -[THWExpandedRepController expandedRepSourceRep](self->_expandedRepController, "expandedRepSourceRep")).n128_u64[0];
  if (!v6)
  {
    -[THWInteractiveImageWidgetRep p_supressRendering:](self, "p_supressRendering:", 0, v5);
    objc_msgSend(-[THWInteractiveImageWidgetRep interactiveCanvasController](self, "interactiveCanvasController"), "layoutIfNeeded");
    -[TSDInteractiveCanvasController layoutIfNeeded](-[THWOverlayableZoomableCanvasController scrollContainerICC](self->_stageCanvasController, "scrollContainerICC"), "layoutIfNeeded");
    -[TSDInteractiveCanvasController layoutIfNeeded](-[THWOverlayableZoomableCanvasController scrollContentICC](self->_stageCanvasController, "scrollContentICC"), "layoutIfNeeded");
  }
}

- (BOOL)shouldFadeInTargetLayer:(id)a3
{
  return 0;
}

- (id)targetLayer
{
  if (-[THWFreeTransformController isFreeTransformInProgress](-[THWFreeTransformableRepGestureTargetHandler ftc](-[THWInteractiveImageWidgetRep freeTransformableHandler](self, "freeTransformableHandler"), "ftc"), "isFreeTransformInProgress")&& !-[THWFreeTransformController passedThreshold](-[THWFreeTransformableRepGestureTargetHandler ftc](-[THWInteractiveImageWidgetRep freeTransformableHandler](self, "freeTransformableHandler"), "ftc"), "passedThreshold"))
  {
    return 0;
  }
  else
  {
    return -[THWInteractiveImageWidgetRep p_backgroundImageContentLayer](self, "p_backgroundImageContentLayer");
  }
}

- (CGRect)ftcTargetFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  if (-[THWFreeTransformController isFreeTransformInProgress](-[THWFreeTransformableRepGestureTargetHandler ftc](-[THWInteractiveImageWidgetRep freeTransformableHandler](self, "freeTransformableHandler"), "ftc"), "isFreeTransformInProgress"))
  {
    -[THWFreeTransformController completionTargetRect](-[THWFreeTransformableRepGestureTargetHandler ftc](-[THWInteractiveImageWidgetRep freeTransformableHandler](self, "freeTransformableHandler"), "ftc"), "completionTargetRect");
  }
  else
  {
    x = CGRectNull.origin.x;
    y = CGRectNull.origin.y;
    width = CGRectNull.size.width;
    height = CGRectNull.size.height;
  }
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BOOL)isExpanded
{
  return objc_msgSend(-[THWInteractiveImageWidgetRep layout](self, "layout"), "isExpanded");
}

- (BOOL)meetsStageDimensionRequirementForExpanded
{
  double v2;
  double v3;

  objc_msgSend(objc_msgSend(-[THWInteractiveImageWidgetRep layout](self, "layout"), "geometry"), "size");
  return v3 < 660.0 || v2 < 960.0;
}

- (id)shadowPath
{
  if (!-[THWInteractiveImageWidgetRep p_isStageBackgroundTransparent](self, "p_isStageBackgroundTransparent"))
    return -[THWImageCropAnimationController backgroundShadowPath](self->_imageCropAnimationController, "backgroundShadowPath");
  if (objc_msgSend(objc_msgSend(-[THWInteractiveImageWidgetRep info](self, "info"), "backgroundImageInfo"), "isOpaque"))return -[THWImageCropAnimationController sourceShadowPath](self->_imageCropAnimationController, "sourceShadowPath");
  return 0;
}

- (BOOL)freeTransformUseTracedShadowPath
{
  return objc_msgSend(objc_msgSend(-[THWInteractiveImageWidgetRep info](self, "info"), "backgroundImageInfo"), "isOpaque") ^ 1;
}

- (BOOL)isFreeTransformInProgress
{
  return -[THWFreeTransformController isFreeTransformInProgress](-[THWFreeTransformableRepGestureTargetHandler ftc](-[THWInteractiveImageWidgetRep freeTransformableHandler](self, "freeTransformableHandler"), "ftc"), "isFreeTransformInProgress");
}

- (void)freeTransformWillBegin
{
  uint64_t v3;
  double v4;
  uint64_t v5;

  v3 = objc_opt_class(THWInteractiveImageWidgetRep);
  *(_QWORD *)&v4 = TSUDynamicCast(v3, -[THWExpandedRepController expandedRepSourceRep](self->_expandedRepController, "expandedRepSourceRep")).n128_u64[0];
  -[THWInteractiveImageWidgetRep p_setupImageCropAnimationControllerWithDestinationRep:](self, "p_setupImageCropAnimationControllerWithDestinationRep:", v5, v4);
}

- (void)freeTransformDidEnd
{
  uint64_t v3;
  double v4;
  uint64_t v5;

  v3 = objc_opt_class(THWInteractiveImageWidgetRep);
  *(_QWORD *)&v4 = TSUDynamicCast(v3, -[THWExpandedRepController expandedRepSourceRep](self->_expandedRepController, "expandedRepSourceRep")).n128_u64[0];
  -[THWInteractiveImageWidgetRep p_teardownImageCropAnimationControllerWithDestinationRep:](self, "p_teardownImageCropAnimationControllerWithDestinationRep:", v5, v4);
}

- (id)styledRep
{
  uint64_t v3;
  id result;

  v3 = objc_opt_class(TSDStyledRep);
  TSUDynamicCast(v3, -[THWInteractiveImageWidgetRep p_backgroundImageRep](self, "p_backgroundImageRep"));
  return result;
}

- (CGRect)rectForCompletion
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  objc_msgSend(-[THWInteractiveImageWidgetRep layout](self, "layout"), "frameInParent");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (BOOL)p_isExpanding
{
  THWExpandedRepController *expandedRepController;

  expandedRepController = self->_expandedRepController;
  if (expandedRepController)
    LOBYTE(expandedRepController) = -[THWExpandedRepController expandedRepControllerState](expandedRepController, "expandedRepControllerState") == 1;
  return (char)expandedRepController;
}

- (void)expandedWillPresentWithController:(id)a3
{
  self->_expandedRepController = (THWExpandedRepController *)a3;
  if (-[THWInteractiveImageWidgetRep p_shouldSuppressRenderingDuringExpansion](self, "p_shouldSuppressRenderingDuringExpansion"))
  {
    -[THWInteractiveImageWidgetRep p_supressRendering:](self, "p_supressRendering:", 1);
  }
}

- (void)p_supressRendering:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[TSDInteractiveCanvasController setShouldSuppressRendering:animated:](-[THWOverlayableZoomableCanvasController scrollContainerICC](self->_stageCanvasController, "scrollContainerICC"), "setShouldSuppressRendering:animated:", a3, 0);
  -[TSDInteractiveCanvasController setShouldSuppressRendering:animated:](-[THWOverlayableZoomableCanvasController scrollContentICC](self->_stageCanvasController, "scrollContentICC"), "setShouldSuppressRendering:animated:", v3, 0);
  objc_msgSend(-[THWInteractiveImageWidgetRep interactiveCanvasController](self, "interactiveCanvasController"), "setShouldSuppressRendering:animated:", v3, 0);
}

- (void)expandedWidgetLayoutFrameDidChangeFromFrame:(CGRect)a3 toFrame:(CGRect)a4
{
  THWOverlayableZoomableCanvasController *v5;
  id v6;

  objc_msgSend(-[THWInteractiveImageWidgetRep layout](self, "layout", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height), "invalidateFrame");
  objc_msgSend(-[THWInteractiveImageWidgetRep interactiveCanvasController](self, "interactiveCanvasController"), "layoutIfNeeded");
  -[TSDInteractiveCanvasController layoutIfNeeded](-[THWOverlayableZoomableCanvasController scrollContainerICC](-[THWInteractiveImageWidgetRep stageCanvasController](self, "stageCanvasController"), "scrollContainerICC"), "layoutIfNeeded");
  -[TSDInteractiveCanvasController layoutIfNeeded](-[THWOverlayableZoomableCanvasController scrollContentICC](-[THWInteractiveImageWidgetRep stageCanvasController](self, "stageCanvasController"), "scrollContentICC"), "layoutIfNeeded");
  v5 = -[THWInteractiveImageWidgetRep stageCanvasController](self, "stageCanvasController");
  v6 = -[THWInteractiveImageWidgetRep layout](self, "layout");
  objc_msgSend(-[THWInteractiveImageWidgetRep layout](self, "layout"), "stageFrame");
  objc_msgSend(v6, "rectInRoot:");
  -[THWOverlayableZoomableCanvasController setNaturalFrame:scale:](v5, "setNaturalFrame:scale:");
  -[THWInteractiveImageWidgetRep updateDiagramAnimated:](self, "updateDiagramAnimated:", 0);
}

- (BOOL)expandedHasContentForPanel:(int)a3
{
  return objc_msgSend(-[THWInteractiveImageWidgetRep layout](self, "layout"), "hasContentForPanel:", *(_QWORD *)&a3);
}

- (id)expandedChildInfosForPanel:(int)a3
{
  return objc_msgSend(-[THWInteractiveImageWidgetRep layout](self, "layout"), "infosForPanel:", *(_QWORD *)&a3);
}

- (id)expandedAdditionalChildLayoutsForPanel:(int)a3
{
  return objc_msgSend(-[THWInteractiveImageWidgetRep layout](self, "layout"), "additionalLayoutsForPanel:", *(_QWORD *)&a3);
}

- (double)expandedMinHeightForPanel:(int)a3 withDefault:(double)a4
{
  if (a3 == 2)
  {
    if (objc_msgSend(-[THWInteractiveImageWidgetRep layout](self, "layout"), "hasContentForPanel:", 2)
      && !objc_msgSend(objc_msgSend(-[THWInteractiveImageWidgetRep layout](self, "layout"), "additionalLayoutsForPanel:", 2), "count"))
    {
      return 0.0;
    }
  }
  else if (a3 == 1
         && objc_msgSend(-[THWInteractiveImageWidgetRep layout](self, "layout"), "hasContentForPanel:", 1))
  {
    return 0.0;
  }
  return a4;
}

- (id)expandedLayoutGeometryForLayout:(id)a3 inPanel:(int)a4 withWidth:(double)a5 insets:(UIEdgeInsets)a6
{
  double right;
  double left;
  char *v10;

  right = a6.right;
  left = a6.left;
  v10 = (char *)objc_msgSend((id)TSUProtocolCast(&OBJC_PROTOCOL___THWControl, a3), "tag");
  if (a4 == 2 && v10 == (_BYTE *)&dword_0 + 3)
    return objc_msgSend(objc_alloc((Class)TSDLayoutGeometry), "initWithFrame:", CGPointZero.x, CGPointZero.y, a5 - left - right, 31.0);
  else
    return 0;
}

- (id)expandedRotationAnimationController
{
  return -[THWInteractiveImageExpandedRotationController initWithRep:canvas:stageCanvasController:]([THWInteractiveImageExpandedRotationController alloc], "initWithRep:canvas:stageCanvasController:", self, -[THWInteractiveImageWidgetRep canvas](self, "canvas"), -[THWInteractiveImageWidgetRep stageCanvasController](self, "stageCanvasController"));
}

- (BOOL)expandedPanelAllowVisible
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = -[THWInteractiveImageWidgetRep calloutReps](self, "calloutReps", 0);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)v6), "hovering") & 1) != 0)
          return 0;
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v4)
        continue;
      break;
    }
  }
  return 1;
}

- (void)updatedHovering
{
  -[THWExpandedRepController expandedRepControllerUpdatePanelVisibility](-[THWInteractiveImageWidgetRep expandedRepController](self, "expandedRepController"), "expandedRepControllerUpdatePanelVisibility");
}

- (BOOL)canHandleGesture:(id)a3
{
  id v5;
  unsigned int v6;

  v5 = objc_msgSend(a3, "gestureKind");
  if (-[THWPressableRepGestureTargetHandler canHandleGesture:](-[THWInteractiveImageWidgetRep pressableHandler](self, "pressableHandler"), "canHandleGesture:", a3))
  {
    goto LABEL_2;
  }
  v6 = -[THWInteractiveImageWidgetRep userInteractionEnabled](self, "userInteractionEnabled");
  if (!v6)
    return v6;
  if (-[THWFreeTransformableRepGestureTargetHandler canHandleGesture:](-[THWInteractiveImageWidgetRep freeTransformableHandler](self, "freeTransformableHandler"), "canHandleGesture:", a3)|| (objc_msgSend(-[THWInteractiveImageWidgetRep layout](self, "layout"), "isExpanded") & 1) == 0&& (objc_msgSend(v5, "isEqual:", TSDShortTap) & 1) != 0)
  {
LABEL_2:
    LOBYTE(v6) = 1;
  }
  else
  {
    v6 = -[THWInteractiveImageWidgetRep p_singleTapResetsToDefaultZoom](self, "p_singleTapResetsToDefaultZoom");
    if (v6)
    {
      v6 = objc_msgSend(v5, "isEqual:", TSWPImmediatePress);
      if (v6)
        LOBYTE(v6) = -[THWInteractiveImageWidgetRep viewportIndex](self, "viewportIndex") != 0;
    }
  }
  return v6;
}

- (BOOL)p_singleTapResetsToDefaultZoom
{
  return objc_msgSend(-[THWInteractiveImageWidgetRep layout](self, "layout"), "isExpanded") ^ 1;
}

- (BOOL)handleGesture:(id)a3
{
  id v5;
  THWPressableRepGestureTargetHandler *v6;
  unsigned int v7;
  uint64_t v8;
  double v9;
  id v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGPoint v22;
  CGRect v23;

  v5 = objc_msgSend(a3, "gestureKind");
  if (-[THWPressableRepGestureTargetHandler canHandleGesture:](-[THWInteractiveImageWidgetRep pressableHandler](self, "pressableHandler"), "canHandleGesture:", a3))
  {
    v6 = -[THWInteractiveImageWidgetRep pressableHandler](self, "pressableHandler");
LABEL_5:
    LOBYTE(v7) = -[THWPressableRepGestureTargetHandler handleGesture:](v6, "handleGesture:", a3);
    return v7;
  }
  if (-[THWFreeTransformableRepGestureTargetHandler canHandleGesture:](-[THWInteractiveImageWidgetRep freeTransformableHandler](self, "freeTransformableHandler"), "canHandleGesture:", a3))
  {
    v6 = -[THWInteractiveImageWidgetRep freeTransformableHandler](self, "freeTransformableHandler");
    goto LABEL_5;
  }
  if (objc_msgSend(a3, "gestureState") == 2
    && -[THWOverlayableZoomableCanvasController isDragging](-[THWInteractiveImageWidgetRep stageCanvasController](self, "stageCanvasController"), "isDragging")&& objc_msgSend(v5, "isEqualToString:", TSWPImmediatePress))
  {
    v8 = objc_opt_class(UIGestureRecognizer);
    *(_QWORD *)&v9 = TSUDynamicCast(v8, a3).n128_u64[0];
    objc_msgSend(v10, "cancel", v9);
  }
  if ((objc_msgSend(v5, "isEqual:", TSDShortTap) & 1) != 0
    || (v7 = objc_msgSend(v5, "isEqual:", TSWPImmediatePress)) != 0)
  {
    if (objc_msgSend(a3, "gestureState") == 3
      && !-[THWOverlayableZoomableCanvasController isDragging](-[THWInteractiveImageWidgetRep stageCanvasController](self, "stageCanvasController"), "isDragging"))
    {
      objc_msgSend(-[THWInteractiveImageWidgetRep layout](self, "layout"), "stageFrame");
      v12 = v11;
      v14 = v13;
      v16 = v15;
      v18 = v17;
      objc_msgSend(a3, "naturalLocationForRep:", self);
      v22.x = v19;
      v22.y = v20;
      v23.origin.x = v12;
      v23.origin.y = v14;
      v23.size.width = v16;
      v23.size.height = v18;
      if (CGRectContainsPoint(v23, v22))
        -[THWInteractiveImageWidgetController selectOption:](self->_controller, "selectOption:", 0);
    }
    LOBYTE(v7) = 1;
  }
  return v7;
}

- (void)willBeginHandlingGesture:(id)a3
{
  id v5;

  v5 = objc_msgSend(a3, "gestureKind");
  if (v5 == (id)TSDFreeTransform)
    -[THWFreeTransformableRepGestureTargetHandler willBeginHandlingGesture:](-[THWInteractiveImageWidgetRep freeTransformableHandler](self, "freeTransformableHandler"), "willBeginHandlingGesture:", a3);
}

- (void)p_togglePanelDescriptionExpanded
{
  -[THWInteractiveImageWidgetRep setPanelDescriptionExpanded:](self, "setPanelDescriptionExpanded:", -[THWInteractiveImageWidgetRep panelDescriptionExpanded](self, "panelDescriptionExpanded") ^ 1);
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
  v7[2] = sub_159170;
  v7[3] = &unk_426DD0;
  v7[4] = self;
  return -[THWTapGestureAction initWithAction:]([THWTapGestureAction alloc], "initWithAction:", v7);
}

- (void)handleNavigateNextCommand
{
  _BYTE *v3;
  _BYTE *v4;

  v3 = objc_msgSend(-[THWInteractiveImageWidgetRep layout](self, "layout"), "selectedCalloutIndex");
  if (v3 == (char *)objc_msgSend(-[THWInteractiveImageWidgetRep info](self, "info"), "calloutCount") - 1)
    v4 = 0;
  else
    v4 = v3 + 1;
  -[THWInteractiveImageWidgetController selectOption:](self->_controller, "selectOption:", v4);
}

- (void)handleNavigatePreviousCommand
{
  char *v3;
  char *v4;
  char *v5;

  v3 = (char *)objc_msgSend(-[THWInteractiveImageWidgetRep layout](self, "layout"), "selectedCalloutIndex");
  v4 = (char *)objc_msgSend(-[THWInteractiveImageWidgetRep info](self, "info"), "calloutCount");
  if (v3)
    v5 = v3;
  else
    v5 = v4;
  -[THWInteractiveImageWidgetController selectOption:](self->_controller, "selectOption:", v5 - 1);
}

- (void)handleNavigateCommandWithNumber:(unint64_t)a3
{
  unint64_t v5;

  if ((char *)objc_msgSend(-[THWInteractiveImageWidgetRep info](self, "info"), "calloutCount") - 1 >= (char *)a3)
    v5 = a3;
  else
    v5 = 0;
  -[THWInteractiveImageWidgetController selectOption:](self->_controller, "selectOption:", v5);
}

- (int)expandedAppearance
{
  return 0;
}

- (int)expandedAppearanceForPanel:(int)a3
{
  return 0;
}

- (unsigned)expandedMaxLineCountForTextLayout:(id)a3 inPanel:(int)a4 withDefault:(unsigned int)a5
{
  uint64_t v5;
  uint64_t v6;

  if (a4 == 1 && !self->_panelDescriptionExpanded)
  {
    if (objc_msgSend(-[THWInteractiveImageWidgetRep layout](self, "layout", a3, v5, v6), "isCompactHeight"))return 2;
    else
      return 5;
  }
  return a5;
}

- (UIEdgeInsets)expandedStackedControlContainerInsetsForPanel:(int)a3 withDefault:(UIEdgeInsets)a4
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  double v8;
  double v9;
  double v10;
  double v11;
  UIEdgeInsets result;

  right = a4.right;
  bottom = a4.bottom;
  left = a4.left;
  top = a4.top;
  if (a3 == 1)
  {
    if (objc_msgSend(objc_msgSend(-[THWInteractiveImageWidgetRep layout](self, "layout"), "infosForPanel:", 1), "count"))
    {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (a3 == 2)
  {
    if (objc_msgSend(objc_msgSend(-[THWInteractiveImageWidgetRep layout](self, "layout"), "additionalLayoutsForPanel:", 2), "count"))
    {
      top = 7.0;
      bottom = 6.0;
      right = 5.0;
      left = 5.0;
      goto LABEL_7;
    }
LABEL_6:
    top = TSDEdgeInsetsZero[0].f64[0];
    left = TSDEdgeInsetsZero[0].f64[1];
    bottom = TSDEdgeInsetsZero[1].f64[0];
    right = TSDEdgeInsetsZero[1].f64[1];
  }
LABEL_7:
  v8 = top;
  v9 = left;
  v10 = bottom;
  v11 = right;
  result.right = v11;
  result.bottom = v10;
  result.left = v9;
  result.top = v8;
  return result;
}

- (BOOL)expandedShouldCombineBottomAndControlPanels
{
  return 1;
}

- (BOOL)expandedContentAllowDoubleTapZoom
{
  return 1;
}

- (BOOL)expandedPanel:(int)a3 isVisibleWithDefault:(BOOL)a4
{
  uint64_t v4;
  uint64_t v5;

  if ((a3 - 1) > 1)
    return a4;
  else
    return objc_msgSend(-[THWInteractiveImageWidgetRep layout](self, "layout", v4, v5), "isCombinedPanelVisible");
}

- (void)expandedPanel:(int)a3 willAnimateToVisible:(BOOL)a4 duration:(double)a5
{
  if (a3 == 1)
    -[THWExpandedRepController expandedRepControllerAnimatePanel:withCrossFadeContent:backgroundLayout:duration:](self->_expandedRepController, "expandedRepControllerAnimatePanel:withCrossFadeContent:backgroundLayout:duration:", *(_QWORD *)&a3, 1, 0, a5);
}

- (void)expandedPanel:(int)a3 willChangeToVisible:(BOOL)a4
{
  if (a3 == 1)
  {
    objc_msgSend(-[THWInteractiveImageWidgetRep layout](self, "layout"), "setCaptionPanelVisible:", a4);
    -[THWExpandedRepController expandedRepControllerInvalidateChildrenInPanel:invalidateWPAuto:](self->_expandedRepController, "expandedRepControllerInvalidateChildrenInPanel:invalidateWPAuto:", 1, 0);
  }
}

- (BOOL)expandedContentHandlesDoubleTapZoomDirectly
{
  return 1;
}

- (void)expandedContentHandleDoubleTapZoomDirectlyAtPoint:(CGPoint)a3
{
  -[THWInteractiveImageWidgetController selectOption:](self->_controller, "selectOption:", 0, a3.x, a3.y);
}

- (BOOL)expandedWantsSingleTapBehavior
{
  if (-[THWInteractiveImageWidgetRep viewportIndex](self, "viewportIndex"))
    return 0;
  else
    return -[THWOverlayableZoomableCanvasController isZoomedOut](-[THWInteractiveImageWidgetRep stageCanvasController](self, "stageCanvasController"), "isZoomedOut");
}

- (BOOL)overlayableZoomableCanvasController:(id)a3 shouldDisableScrollingAtContentEdgesForScrollView:(id)a4
{
  return !-[THWInteractiveImageWidgetRep isExpanded](self, "isExpanded", a3, a4);
}

- (BOOL)overlayableZoomableCanvasController:(id)a3 shouldDisableScrollingWhenCursorIsHiddenForScrollView:(id)a4
{
  return !-[THWInteractiveImageWidgetRep isExpanded](self, "isExpanded", a3, a4);
}

- (id)documentRootForOverlayableZoomableCanvasController:(id)a3
{
  return objc_msgSend(-[THWInteractiveImageWidgetRep interactiveCanvasController](self, "interactiveCanvasController", a3), "documentRoot");
}

- (CGSize)sizeOfContentCanvasForOverlayableZoomableCanvasController:(id)a3
{
  double v3;
  double v4;
  CGSize result;

  objc_msgSend(-[THWInteractiveImageWidgetRep layout](self, "layout", a3), "zoomableCanvasSize");
  result.height = v4;
  result.width = v3;
  return result;
}

- (id)overlayableZoomableCanvasController:(id)a3 infosToDisplayForContentViewport:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  if (-[THWInteractiveImageWidgetRep stageCanvasController](self, "stageCanvasController") == a3)
    return objc_msgSend(-[THWInteractiveImageWidgetRep layout](self, "layout"), "infosForStageContentViewport:", x, y, width, height);
  else
    return 0;
}

- (id)infosToDisplayForContainerInOverlayableZoomableCanvasController:(id)a3
{
  if (self->_calloutsHidden)
    return 0;
  else
    return objc_msgSend(-[THWInteractiveImageWidgetRep layout](self, "layout", a3), "infosForContainer");
}

- (id)overlayableZoomableCanvasController:(id)a3 primaryTargetForGesture:(id)a4
{
  TSDInteractiveCanvasController *v6;
  uint64_t v7;
  THWInteractiveImageWidgetRep *v8;

  v6 = -[THWOverlayableZoomableCanvasController scrollContainerICC](-[THWInteractiveImageWidgetRep stageCanvasController](self, "stageCanvasController", a3), "scrollContainerICC");
  objc_msgSend(a4, "unscaledLocationForICC:", v6);
  v7 = TSUProtocolCast(&OBJC_PROTOCOL___TSDGestureTarget, -[TSDInteractiveCanvasController hitRep:withGesture:passingTest:](v6, "hitRep:withGesture:passingTest:", a4, &stru_42A030));
  if (v7)
    v8 = (THWInteractiveImageWidgetRep *)v7;
  else
    v8 = self;
  if (-[THWPressableRepGestureTargetHandler canHandleGesture:](-[THWInteractiveImageWidgetRep pressableHandler](self, "pressableHandler"), "canHandleGesture:", a4))
  {
    return -[THWInteractiveImageWidgetRep pressableHandler](self, "pressableHandler");
  }
  else
  {
    return v8;
  }
}

- (void)overlayableZoomableCanvasController:(id)a3 willLayoutRep:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  double v9;
  void *v10;

  v6 = objc_msgSend(a4, "info", a3);
  if (v6 == objc_msgSend(-[THWInteractiveImageWidgetRep info](self, "info"), "backgroundImageInfo"))
  {
    v7 = objc_opt_class(TSDImageRep);
    *(_QWORD *)&v9 = TSUDynamicCast(v7, a4).n128_u64[0];
    if (v8)
    {
      v10 = v8;
      if (!self->_cachedImage && self->_wantsCachedImage)
        self->_cachedImage = (TSDImageRepCachedSizedImage *)objc_msgSend(v8, "newCachedSizedImageWithNaturalSize", v9);
      self->_wantsCachedImage = 0;
      if (self->_cachedImage)
      {
        objc_msgSend(v10, "useCachedSizedImage:", v9);
        objc_msgSend(v10, "generateSizedImageOnBackgroundThread");

        self->_cachedImage = 0;
      }
    }
  }
}

- (BOOL)overlayableZoomableCanvasControllerShouldResampleImages:(id)a3
{
  return !-[THWInteractiveImageWidgetRep isExpanded](self, "isExpanded", a3);
}

- (BOOL)overlayableZoomableCanvasController:(id)a3 allowsEditMenuForRep:(id)a4
{
  return 0;
}

- (BOOL)overlayableZoomableCanvasController:(id)a3 canvasViewShouldBecomeFirstResponder:(id)a4
{
  return 0;
}

- (id)additionalGestureTargetsForZoomableCanvasController:(id)a3 gesture:(id)a4
{
  if ((objc_opt_respondsToSelector(objc_msgSend(-[THWInteractiveImageWidgetRep interactiveCanvasController](self, "interactiveCanvasController", a3), "delegate"), "additionalGestureTargetsForInteractiveCanvasController:gesture:") & 1) != 0)return objc_msgSend(objc_msgSend(-[THWInteractiveImageWidgetRep interactiveCanvasController](self, "interactiveCanvasController"), "delegate"), "additionalGestureTargetsForInteractiveCanvasController:gesture:", -[THWInteractiveImageWidgetRep interactiveCanvasController](self, "interactiveCanvasController"), a4);
  else
    return 0;
}

- (BOOL)overlayableZoomableCanvasControllerDeferViewCreation:(id)a3
{
  return objc_msgSend(-[THWInteractiveImageWidgetRep interactiveCanvasController](self, "interactiveCanvasController", a3), "currentlyScrolling");
}

- (double)overlayableZoomableCanvasControllerContentsScale:(id)a3
{
  double result;

  objc_msgSend(objc_msgSend(-[THWInteractiveImageWidgetRep interactiveCanvasController](self, "interactiveCanvasController", a3), "canvas"), "contentsScale");
  return result;
}

- (BOOL)overlayableZoomableCanvasControllerIsRelatedCanvasScrolling:(id)a3
{
  return objc_msgSend(-[THWInteractiveImageWidgetRep interactiveCanvasController](self, "interactiveCanvasController", a3), "currentlyScrolling");
}

- (void)control:(id)a3 repWasAdded:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  double v8;
  void *v9;
  void *v10;

  v6 = objc_opt_class(THWInteractiveImageRadioPanelRep);
  if ((objc_opt_isKindOfClass(a4, v6) & 1) != 0)
  {
    v7 = objc_opt_class(THWInteractiveImageRadioPanelRep);
    *(_QWORD *)&v8 = TSUDynamicCast(v7, a4).n128_u64[0];
    v10 = v9;
    objc_msgSend(v9, "setTransportControlDelegate:", self->_controller, v8);
    -[THWInteractiveImageWidgetController setTransportControlsRep:](self->_controller, "setTransportControlsRep:", v10);
  }
}

- (void)control:(id)a3 repWillBeRemoved:(id)a4
{
  uint64_t v6;

  v6 = objc_opt_class(THWInteractiveImageRadioPanelRep, a2);
  if ((objc_opt_isKindOfClass(a4, v6) & 1) != 0)
    -[THWInteractiveImageWidgetController setTransportControlsRep:](self->_controller, "setTransportControlsRep:", 0);
}

- (CGPoint)convertContentPointToUnscaledOverlayPoint:(CGPoint)a3
{
  double v3;
  double v4;
  CGPoint result;

  -[THWOverlayableZoomableCanvasController unscaledContainerPointFromUnscaledContentPoint:](-[THWInteractiveImageWidgetRep stageCanvasController](self, "stageCanvasController"), "unscaledContainerPointFromUnscaledContentPoint:", a3.x, a3.y);
  result.y = v4;
  result.x = v3;
  return result;
}

- (id)calloutInfoForDisplay
{
  id result;

  result = objc_msgSend(-[THWInteractiveImageWidgetRep layout](self, "layout"), "selectedCalloutIndex");
  if (result)
    return objc_msgSend(objc_msgSend(-[THWInteractiveImageWidgetRep layout](self, "layout"), "info"), "calloutAtIndex:", objc_msgSend(-[THWInteractiveImageWidgetRep layout](self, "layout"), "selectedCalloutIndex"));
  return result;
}

- (unint64_t)selectedCalloutIndex
{
  return (unint64_t)objc_msgSend(-[THWInteractiveImageWidgetRep layout](self, "layout"), "selectedCalloutIndex");
}

- (void)applyScrollingPolicy
{
  _BOOL8 v3;

  v3 = -[THWInteractiveImageWidgetRep viewportIndex](self, "viewportIndex")
    || objc_msgSend(-[THWInteractiveImageWidgetRep layout](self, "layout"), "isExpanded");
  -[THWOverlayableZoomableCanvasController setScrollEnabled:](-[THWInteractiveImageWidgetRep stageCanvasController](self, "stageCanvasController"), "setScrollEnabled:", v3);
}

- (CALayer)pressableAnimationLayer
{
  return -[UIView layer](-[THWOverlayableZoomableCanvasController view](-[THWInteractiveImageWidgetRep stageCanvasController](self, "stageCanvasController"), "view"), "layer");
}

- (CALayer)pressableAnimationShadowLayer
{
  return 0;
}

- (BOOL)wantsPressAnimation
{
  return -[THWPressableRepGestureTargetHandler widgetInteractionDisabledOnPage](-[THWInteractiveImageWidgetRep pressableHandler](self, "pressableHandler"), "widgetInteractionDisabledOnPage");
}

- (BOOL)wantsPressAction
{
  _BOOL4 v3;

  if (-[THWInteractiveImageWidgetRep meetsStageDimensionRequirementForExpanded](self, "meetsStageDimensionRequirementForExpanded")|| (v3 = -[THWPressableRepGestureTargetHandler widgetInteractionDisabledOnPage](-[THWInteractiveImageWidgetRep pressableHandler](self, "pressableHandler"), "widgetInteractionDisabledOnPage")))
  {
    LOBYTE(v3) = -[THWInteractiveImageWidgetRep pressableAction](self, "pressableAction") != 0;
  }
  return v3;
}

- (BOOL)p_widgetInteractionDisabledOnPage
{
  return -[THWPressableRepGestureTargetHandler widgetInteractionDisabledOnPage](-[THWInteractiveImageWidgetRep pressableHandler](self, "pressableHandler"), "widgetInteractionDisabledOnPage");
}

- (BOOL)shouldRecognizePressOnRep:(id)a3
{
  return objc_msgSend(-[THWInteractiveImageWidgetRep layout](self, "layout", a3), "isExpanded") ^ 1;
}

- (int)pressableAction
{
  return 2;
}

- (CGRect)pressableNaturalBounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  objc_msgSend(-[THWInteractiveImageWidgetRep layout](self, "layout"), "stageFrame");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGAffineTransform)shadowAnimationLayerDestinationTransform:(SEL)a3 uniformTargetScale:(id)a4
{
  __int128 v8;
  id v9;
  BOOL v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  unsigned int v15;
  THWImageCropAnimationController *imageCropAnimationController;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  id v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  uint64_t v38;
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
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  __n128 v54;
  __n128 v55;
  __n128 v56;
  __n128 v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  CALayer *v65;
  double v66;
  double v67;
  double v68;
  double v69;
  unint64_t v70;
  unint64_t v71;
  uint64_t v72;
  double v73;
  double v74;
  double v75;
  double v76;
  __n128 v77;
  double v78;
  __n128 v79;
  double v80;
  CGFloat v81;
  double v82;
  CGFloat v83;
  __n128 v84;
  __n128 v85;
  CGFloat v86;
  double v87;
  CGFloat v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  THWFreeTransformController *v93;
  __int128 v94;
  CGAffineTransform *result;
  __int128 v96;
  double v97;
  double v98;
  double v99;
  double v100;
  unint64_t v101;
  double v102;
  unint64_t v103;
  double v104;
  double v105;
  CGAffineTransform v106;
  CGAffineTransform v107;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGAffineTransform v110;

  v8 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&retstr->c = v8;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  v9 = -[THWInteractiveImageWidgetRep shadowAnimationLayer](self, "shadowAnimationLayer", a4);
  if (self->_imageCropAnimationController)
    v10 = v9 == 0;
  else
    v10 = 1;
  if (!v10)
  {
    v11 = v9;
    objc_msgSend(v9, "bounds");
    v13 = v12;
    v102 = v14;
    v15 = -[THWInteractiveImageWidgetRep p_isStageBackgroundTransparent](self, "p_isStageBackgroundTransparent");
    imageCropAnimationController = self->_imageCropAnimationController;
    if (v15)
    {
      -[THWImageCropAnimationController sourceContentsRect](imageCropAnimationController, "sourceContentsRect");
      v18 = v17;
      v20 = v19;
      v22 = v21;
      v24 = v23;
      v25 = -[THWImageCropAnimationController targetContentsRect](self->_imageCropAnimationController, "targetContentsRect");
      v27 = v26;
      v28 = v13;
      v30 = v29;
      v98 = v31;
      v33 = v32;
      v34 = TSDMultiplyRectBySize(v25, v18, v20, v22, v24, v28, v102);
      v100 = v35;
      v104 = v37;
      v105 = v36;
      v39 = TSDMultiplyRectBySize(v38, v27, v30, v98, v33, v28, v102);
    }
    else
    {
      -[THWImageCropAnimationController backgroundSourceFrame](imageCropAnimationController, "backgroundSourceFrame");
      objc_msgSend(v11, "convertRect:fromLayer:", -[THWImageCropAnimationController wrapperLayer](self->_imageCropAnimationController, "wrapperLayer"), v45, v46, v47, v48);
      v50 = v49;
      v100 = v51;
      v104 = v53;
      v105 = v52;
      -[THWImageCropAnimationController backgroundTargetFrame](self->_imageCropAnimationController, "backgroundTargetFrame");
      v58 = TSDMultiplyRectScalar(v54, v55, v56, v57, 1.0 / a5);
      v60 = v59;
      v62 = v61;
      v64 = v63;
      v65 = -[THWImageCropAnimationController wrapperLayer](self->_imageCropAnimationController, "wrapperLayer");
      v66 = v62;
      v34 = v50;
      objc_msgSend(v11, "convertRect:fromLayer:", v65, v58, v60, v66, v64);
    }
    v97 = v40;
    v99 = v39;
    v43 = v41;
    v44 = v42;
    v67 = TSDCenterOfRect(v34, v100, v105, v104);
    v69 = v68;
    *(double *)&v70 = TSDCenterOfRect(v99, v97, v43, v44);
    v101 = v71;
    v103 = v70;
    v73 = TSDRectWithSize(v72);
    v77.n128_f64[0] = TSDCenterOfRect(v73, v74, v75, v76);
    v78 = v77.n128_f64[0];
    v80 = v79.n128_f64[0];
    v81 = TSDSubtractPoints(v77, v79, v67, v69);
    v83 = v82;
    v85.n128_u64[0] = v101;
    v84.n128_u64[0] = v103;
    v86 = TSDSubtractPoints(v84, v85, v78, v80);
    v88 = v87;
    CGAffineTransformMakeTranslation(retstr, v81, v83);
    CGAffineTransformMakeScale(&t2, v43 / v105, v44 / v104);
    v89 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&t1.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&t1.c = v89;
    *(_OWORD *)&t1.tx = *(_OWORD *)&retstr->tx;
    CGAffineTransformConcat(&v110, &t1, &t2);
    v90 = *(_OWORD *)&v110.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v110.a;
    *(_OWORD *)&retstr->c = v90;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v110.tx;
    CGAffineTransformMakeTranslation(&v107, v86, v88);
    v91 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&t1.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&t1.c = v91;
    *(_OWORD *)&t1.tx = *(_OWORD *)&retstr->tx;
    CGAffineTransformConcat(&v110, &t1, &v107);
    v92 = *(_OWORD *)&v110.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v110.a;
    *(_OWORD *)&retstr->c = v92;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v110.tx;
  }
  v93 = -[THWFreeTransformableRepGestureTargetHandler ftc](self->_freeTransformableHandler, "ftc", *(_QWORD *)&v97);
  if (v93)
    -[THWFreeTransformController originalShadowTransform](v93, "originalShadowTransform");
  else
    memset(&v106, 0, sizeof(v106));
  v94 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&t1.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&t1.c = v94;
  *(_OWORD *)&t1.tx = *(_OWORD *)&retstr->tx;
  result = CGAffineTransformConcat(&v110, &t1, &v106);
  v96 = *(_OWORD *)&v110.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v110.a;
  *(_OWORD *)&retstr->c = v96;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&v110.tx;
  return result;
}

- (void)p_setupAsAnimationDestination
{
  -[CALayer setHidden:](self->_stageBackgroundLayer, "setHidden:", 1);
}

- (void)p_teardownAsAnimationDestination
{
  -[CALayer setHidden:](self->_stageBackgroundLayer, "setHidden:", 0);
}

- (CGRect)p_stageBackgroundFrameRelativeToImageContentLayer
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  v3 = -[THWInteractiveImageWidgetRep p_backgroundImageContentLayer](self, "p_backgroundImageContentLayer");
  -[CALayer bounds](self->_stageBackgroundLayer, "bounds");
  objc_msgSend(v3, "convertRect:fromLayer:", self->_stageBackgroundLayer);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (void)p_setupImageCropAnimationControllerWithDestinationRep:(id)a3
{
  id v5;
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
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  THWImageCropAnimationController *imageCropAnimationController;
  THWImageCropAnimationController *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  CALayer *v38;
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
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;

  v5 = -[THWInteractiveImageWidgetRep p_backgroundImageContentLayer](self, "p_backgroundImageContentLayer");
  objc_msgSend(a3, "setCalloutsVisible:animated:", 0, 0);
  -[THWInteractiveImageWidgetRep setCalloutsVisible:animated:](self, "setCalloutsVisible:animated:", 0, 0);
  if (v5 && !self->_imageCropAnimationController)
  {
    -[THWInteractiveImageWidgetRep p_backgroundImageContentsRect](self, "p_backgroundImageContentsRect");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    if (a3)
    {
      objc_msgSend(a3, "p_backgroundImageContentsRect");
      v19 = v18;
      v21 = v20;
      v23 = v22;
      v25 = v24;
    }
    else
    {
      v23 = 1.0;
      v19 = 0.0;
      v21 = 0.0;
      v25 = 1.0;
    }
    v31 = -[THWImageCropAnimationController initWithImageContentLayer:]([THWImageCropAnimationController alloc], "initWithImageContentLayer:", v5);
    self->_imageCropAnimationController = v31;
    -[THWImageCropAnimationController setSourceContentsRect:](v31, "setSourceContentsRect:", v11, v13, v15, v17);
    objc_msgSend(-[THWInteractiveImageWidgetRep layout](self, "layout"), "stageCornerRadius");
    v33 = v32;
    objc_msgSend(-[THWInteractiveImageWidgetRep canvas](self, "canvas"), "viewScale");
    -[THWImageCropAnimationController setSourceCornerRadius:](self->_imageCropAnimationController, "setSourceCornerRadius:", v33 * v34);
    -[THWImageCropAnimationController setTargetContentsRect:](self->_imageCropAnimationController, "setTargetContentsRect:", v19, v21, v23, v25);
    objc_msgSend(objc_msgSend(a3, "layout"), "stageCornerRadius");
    v36 = v35;
    objc_msgSend(objc_msgSend(a3, "canvas"), "viewScale");
    -[THWImageCropAnimationController setTargetCornerRadius:](self->_imageCropAnimationController, "setTargetCornerRadius:", v36 * v37);
    -[THWImageCropAnimationController setCropDurationScale:](self->_imageCropAnimationController, "setCropDurationScale:", 0.5);
    -[THWImageCropAnimationController setBackgroundDurationScale:](self->_imageCropAnimationController, "setBackgroundDurationScale:", 0.5);
    -[THWImageCropAnimationController setCornerRadiusDurationScale:](self->_imageCropAnimationController, "setCornerRadiusDurationScale:", 0.5);
    -[THWImageCropAnimationController setupWrapperLayer](self->_imageCropAnimationController, "setupWrapperLayer");
    v38 = -[THWImageCropAnimationController wrapperLayer](self->_imageCropAnimationController, "wrapperLayer");
    -[CALayer bounds](self->_stageBackgroundLayer, "bounds");
    -[CALayer convertRect:fromLayer:](v38, "convertRect:fromLayer:", self->_stageBackgroundLayer);
    v40 = v39;
    v42 = v41;
    v44 = v43;
    v46 = v45;
    -[THWOverlayableZoomableCanvasController setBackgroundLayer:](self->_stageCanvasController, "setBackgroundLayer:", 0);
    -[THWImageCropAnimationController setBackgroundLayer:](self->_imageCropAnimationController, "setBackgroundLayer:", self->_stageBackgroundLayer);
    -[CALayer setFrame:](self->_stageBackgroundLayer, "setFrame:", v40, v42, v44, v46);
    -[CALayer removeAllAnimations](self->_stageBackgroundLayer, "removeAllAnimations");
    objc_msgSend(a3, "p_setupAsAnimationDestination");
    v47 = v40;
    v48 = v42;
    v49 = v44;
    v50 = v46;
    if (a3)
    {
      objc_msgSend(a3, "p_stageBackgroundFrameRelativeToImageContentLayer");
      v47 = v51;
      v48 = v52;
      v49 = v53;
      v50 = v54;
    }
    -[THWImageCropAnimationController setBackgroundSourceFrame:](self->_imageCropAnimationController, "setBackgroundSourceFrame:", v40, v42, v44, v46);
    imageCropAnimationController = self->_imageCropAnimationController;
    v26 = v47;
    v27 = v48;
    v28 = v49;
    v29 = v50;
    goto LABEL_15;
  }
  if (a3)
  {
    objc_msgSend(a3, "p_backgroundImageContentsRect");
    if (a3 == self)
    {
      -[THWImageCropAnimationController sourceContentsRect](self->_imageCropAnimationController, "sourceContentsRect");
      -[THWImageCropAnimationController setTargetContentsRect:](self->_imageCropAnimationController, "setTargetContentsRect:");
      -[THWImageCropAnimationController sourceCornerRadius](self->_imageCropAnimationController, "sourceCornerRadius");
    }
    else
    {
      -[THWImageCropAnimationController setTargetContentsRect:](self->_imageCropAnimationController, "setTargetContentsRect:");
      objc_msgSend(objc_msgSend(a3, "layout"), "stageCornerRadius");
      v7 = v6;
      objc_msgSend(objc_msgSend(a3, "canvas"), "viewScale");
      v9 = v7 * v8;
    }
    -[THWImageCropAnimationController setTargetCornerRadius:](self->_imageCropAnimationController, "setTargetCornerRadius:", v9);
    objc_msgSend(a3, "p_stageBackgroundFrameRelativeToImageContentLayer");
    imageCropAnimationController = self->_imageCropAnimationController;
LABEL_15:
    -[THWImageCropAnimationController setBackgroundTargetFrame:](imageCropAnimationController, "setBackgroundTargetFrame:", v26, v27, v28, v29);
  }
}

- (CGPoint)p_scrollScaledFromClientScaledPoint:(CGPoint)a3
{
  double y;
  double x;
  double v5;
  double v6;
  double v7;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  -[THWInteractiveImageWidgetRep baseViewScale](self, "baseViewScale");
  v6 = TSDMultiplyPointScalar(x, y, v5);
  result.y = v7;
  result.x = v6;
  return result;
}

- (CGPoint)p_clientScaledFromScrollScaledPoint:(CGPoint)a3
{
  double y;
  double x;
  double v5;
  double v6;
  double v7;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  -[THWInteractiveImageWidgetRep baseViewScale](self, "baseViewScale");
  v6 = TSDMultiplyPointScalar(x, y, 1.0 / v5);
  result.y = v7;
  result.x = v6;
  return result;
}

- (UIEdgeInsets)p_insetsWithViewScale:(double)a3 viewportBounds:(CGRect)a4
{
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
  double v21;
  double v22;
  double v23;
  double v24;
  CGFloat x;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  double v29;
  double MidX;
  double v31;
  double v32;
  double MinX;
  double v34;
  double MidY;
  double v36;
  double v37;
  double MinY;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v47;
  double v48;
  double v49;
  double v50;
  CGFloat rect;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  UIEdgeInsets result;

  width = a4.size.width;
  height = a4.size.height;
  y = a4.origin.y;
  rect = a4.origin.x;
  -[THWInteractiveImageWidgetRep p_imageFrameWithViewScale:](self, "p_imageFrameWithViewScale:");
  v43 = v6;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[THWInteractiveImageWidgetRep p_calloutFrameWithViewScale:](self, "p_calloutFrameWithViewScale:", a3);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  -[THWInteractiveImageWidgetRep p_diagramFrameWithViewScale:](self, "p_diagramFrameWithViewScale:", a3);
  v49 = v22;
  v50 = v21;
  v47 = v24;
  v48 = v23;
  -[THWInteractiveImageWidgetRep p_bufferedHullFrameForImageFrame:calloutFrame:](self, "p_bufferedHullFrameForImageFrame:calloutFrame:", v43, v8, v10, v12, v14, v16, v18, v20);
  x = v52.origin.x;
  v26 = v52.origin.y;
  v27 = v52.size.width;
  v28 = v52.size.height;
  v29 = CGRectGetWidth(v52);
  v53.origin.x = rect;
  v53.origin.y = y;
  v53.size.width = width;
  v53.size.height = height;
  if (v29 >= CGRectGetWidth(v53))
  {
    v57.origin.x = x;
    v57.origin.y = v26;
    v57.size.width = v27;
    v57.size.height = v28;
    MinX = CGRectGetMinX(v57);
    v58.origin.x = rect;
    v58.origin.y = y;
    v58.size.width = width;
    v58.size.height = height;
    v31 = fmin(MinX, CGRectGetMinX(v58));
    v59.origin.x = x;
    v59.origin.y = v26;
    v59.size.width = v27;
    v59.size.height = v28;
    v32 = CGRectGetMaxX(v59) - v31;
  }
  else
  {
    v54.origin.x = x;
    v54.origin.y = v26;
    v54.size.width = v27;
    v54.size.height = v28;
    MidX = CGRectGetMidX(v54);
    v55.origin.x = rect;
    v55.origin.y = y;
    v55.size.width = width;
    v55.size.height = height;
    v31 = MidX + CGRectGetWidth(v55) * -0.5;
    v56.origin.x = rect;
    v56.origin.y = y;
    v56.size.width = width;
    v56.size.height = height;
    v32 = CGRectGetWidth(v56);
  }
  v60.origin.x = v31;
  v60.origin.y = v26;
  v60.size.width = v32;
  v60.size.height = v28;
  v34 = CGRectGetHeight(v60);
  v61.origin.x = rect;
  v61.origin.y = y;
  v61.size.width = width;
  v61.size.height = height;
  if (v34 >= CGRectGetHeight(v61))
  {
    v65.origin.x = v31;
    v65.origin.y = v26;
    v65.size.width = v32;
    v65.size.height = v28;
    MinY = CGRectGetMinY(v65);
    v66.origin.x = rect;
    v66.origin.y = y;
    v66.size.width = width;
    v66.size.height = height;
    v36 = fmin(MinY, CGRectGetMinY(v66));
    v67.origin.x = v31;
    v67.origin.y = v26;
    v67.size.width = v32;
    v67.size.height = v28;
    v37 = CGRectGetMaxY(v67) - v36;
  }
  else
  {
    v62.origin.x = v31;
    v62.origin.y = v26;
    v62.size.width = v32;
    v62.size.height = v28;
    MidY = CGRectGetMidY(v62);
    v63.origin.x = rect;
    v63.origin.y = y;
    v63.size.width = width;
    v63.size.height = height;
    v36 = MidY + CGRectGetHeight(v63) * -0.5;
    v64.origin.x = rect;
    v64.origin.y = y;
    v64.size.width = width;
    v64.size.height = height;
    v37 = CGRectGetHeight(v64);
  }
  -[THWInteractiveImageWidgetRep p_insetsForInnerFrame:inOuterFrame:](self, "p_insetsForInnerFrame:inOuterFrame:", v31, v36, v32, v37, v50, v49, v48, v47);
  result.right = v42;
  result.bottom = v41;
  result.left = v40;
  result.top = v39;
  return result;
}

- (double)p_maxCalloutViewScale
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  double v6;
  void *i;
  double v8;
  double result;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = objc_msgSend(-[THWInteractiveImageWidgetRep info](self, "info", 0), "calloutEnumerator");
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    v6 = 0.0;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i), "viewScale");
        v6 = fmax(v6, v8);
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }
  else
  {
    v6 = 0.0;
  }
  result = 1.0;
  if (v6 > 0.0)
    return v6;
  return result;
}

- (CGRect)p_expandedViewportFrameInPortalRect:(CGRect)a3
{
  double height;
  double width;
  CGFloat x;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  double v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGFloat y;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  objc_msgSend(objc_msgSend(-[THWInteractiveImageWidgetRep info](self, "info"), "stageGeometry"), "frame");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v14 = THScaleNeededToFitSizeInSize(v10, v12, width, height);
  v15 = THRectCenterRectInRect(v7, v9, v11, v13, x, y, width, height);
  v19 = THRectMultiplyRectCenteredScalar(v15, v16, v17, v18, v14);
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (CGPoint)p_wingOffsetForPortalRect:(CGRect)a3
{
  double y;
  double x;
  __n128 v5;
  __n128 v6;
  double v7;
  double v8;
  CGPoint result;

  y = a3.origin.y;
  x = a3.origin.x;
  -[THWInteractiveImageWidgetRep p_expandedViewportFrameInPortalRect:](self, "p_expandedViewportFrameInPortalRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v7 = TSDSubtractPoints(v5, v6, x, y);
  result.y = v8;
  result.x = v7;
  return result;
}

- (id)p_backgroundImageRep
{
  return -[TSDInteractiveCanvasController repForInfo:](-[THWOverlayableZoomableCanvasController scrollContentICC](-[THWInteractiveImageWidgetRep stageCanvasController](self, "stageCanvasController"), "scrollContentICC"), "repForInfo:", objc_msgSend(-[THWInteractiveImageWidgetRep info](self, "info"), "backgroundImageInfo"));
}

- (id)p_backgroundImageContentLayer
{
  uint64_t v3;
  double v4;
  id v5;

  v3 = objc_opt_class(TSDImageRep);
  *(_QWORD *)&v4 = TSUDynamicCast(v3, -[THWInteractiveImageWidgetRep p_backgroundImageRep](self, "p_backgroundImageRep")).n128_u64[0];
  return objc_msgSend(v5, "contentsLayer", v4);
}

- (CGRect)p_backgroundImageContentsRect
{
  id v3;
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double width;
  double height;
  double v23;
  uint64_t v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  CGRect v33;
  CGRect v34;
  CGRect result;
  CGRect v36;

  v3 = -[THWInteractiveImageWidgetRep p_backgroundImageContentLayer](self, "p_backgroundImageContentLayer");
  if (v3)
  {
    v4 = v3;
    -[THWInteractiveImageWidgetRep p_portalFrame](self, "p_portalFrame");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    objc_msgSend(v4, "frame");
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v33.origin.x = v6;
    v33.origin.y = v8;
    v33.size.width = v10;
    v33.size.height = v12;
    v36.origin.x = v14;
    v36.origin.y = v16;
    v36.size.width = v18;
    v36.size.height = v20;
    v34 = CGRectIntersection(v33, v36);
    width = v34.size.width;
    height = v34.size.height;
    v23 = TSDSubtractPoints((__n128)v34.origin, *(__n128 *)&v34.origin.y, v14, v16);
    v26 = TSDRectWithOriginAndSize(v24, v23, v25, width, height) / v18;
    v28 = v27 / v20;
    v30 = v29 / v18;
    v32 = v31 / v20;
  }
  else
  {
    v30 = 1.0;
    v26 = 0.0;
    v28 = 0.0;
    v32 = 1.0;
  }
  result.size.height = v32;
  result.size.width = v30;
  result.origin.y = v28;
  result.origin.x = v26;
  return result;
}

- (void)p_setupBorderAndBackground
{
  id v3;
  CALayer *v4;
  uint64_t v5;
  void *v6;
  double v7;
  void *v8;
  double v9;

  v3 = -[THWInteractiveImageWidgetRep info](self, "info");
  v4 = -[THWOverlayableZoomableCanvasController layer](-[THWInteractiveImageWidgetRep stageCanvasController](self, "stageCanvasController"), "layer");
  objc_msgSend(-[THWInteractiveImageWidgetRep info](self, "info"), "stageCornerRadius");
  -[CALayer setCornerRadius:](v4, "setCornerRadius:");
  v5 = objc_opt_class(TSDStroke);
  *(_QWORD *)&v7 = TSUDynamicCast(v5, objc_msgSend(objc_msgSend(v3, "viewportStyle"), "valueForProperty:", 517)).n128_u64[0];
  if (v6)
  {
    v8 = v6;
    objc_msgSend(v6, "width", v7);
    -[CALayer setBorderWidth:](v4, "setBorderWidth:");
    -[CALayer setBorderColor:](v4, "setBorderColor:", objc_msgSend(objc_msgSend(v8, "color"), "CGColor"));
    -[THWInteractiveImageWidgetRep setBorderColor:](self, "setBorderColor:", objc_msgSend(objc_msgSend(v8, "color"), "CGColor"));
  }
  objc_msgSend(-[THWInteractiveImageWidgetRep info](self, "info", v7), "stageCornerRadius");
  -[CALayer setCornerRadius:](-[UIView layer](-[THWOverlayableZoomableCanvasController view](-[THWInteractiveImageWidgetRep stageCanvasController](self, "stageCanvasController"), "view"), "layer"), "setCornerRadius:", v9);
}

- (void)didExitExpanded
{
  -[CALayer setBorderColor:](-[THWOverlayableZoomableCanvasController layer](-[THWInteractiveImageWidgetRep stageCanvasController](self, "stageCanvasController"), "layer"), "setBorderColor:", -[THWInteractiveImageWidgetRep borderColor](self, "borderColor"));
}

- (void)didPresentExpanded
{
  -[CALayer setBorderColor:](-[THWOverlayableZoomableCanvasController layer](-[THWInteractiveImageWidgetRep stageCanvasController](self, "stageCanvasController"), "layer"), "setBorderColor:", objc_msgSend(+[TSUColor clearColor](TSUColor, "clearColor"), "CGColor"));
  objc_msgSend(-[THWInteractiveImageWidgetRep interactiveCanvasController](self, "interactiveCanvasController"), "setShouldSuppressRendering:animated:", 0, 0);
  -[TSDInteractiveCanvasController setShouldSuppressRendering:animated:](-[THWOverlayableZoomableCanvasController scrollContainerICC](self->_stageCanvasController, "scrollContainerICC"), "setShouldSuppressRendering:animated:", 0, 0);
  -[TSDInteractiveCanvasController setShouldSuppressRendering:animated:](-[THWOverlayableZoomableCanvasController scrollContentICC](self->_stageCanvasController, "scrollContentICC"), "setShouldSuppressRendering:animated:", 0, 0);
  self->_calloutsHidden = 0;
  -[THWOverlayableZoomableCanvasController updateContainerInfosToDisplay](self->_stageCanvasController, "updateContainerInfosToDisplay");
  -[TSDInteractiveCanvasController layoutIfNeeded](-[THWOverlayableZoomableCanvasController scrollContainerICC](self->_stageCanvasController, "scrollContainerICC"), "layoutIfNeeded");
}

- (CGRect)p_imageFrame
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  THWOverlayableZoomableCanvasController *v11;
  CGAffineTransform v12;
  CGRect v13;

  objc_msgSend(objc_msgSend(objc_msgSend(-[THWInteractiveImageWidgetRep info](self, "info"), "backgroundImageInfo"), "geometry"), "boundsBeforeRotation");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = -[THWInteractiveImageWidgetRep stageCanvasController](self, "stageCanvasController");
  if (v11)
    -[THWOverlayableZoomableCanvasController contentViewTransform](v11, "contentViewTransform");
  else
    memset(&v12, 0, sizeof(v12));
  v13.origin.x = v4;
  v13.origin.y = v6;
  v13.size.width = v8;
  v13.size.height = v10;
  return CGRectApplyAffineTransform(v13, &v12);
}

- (CGRect)p_imageFrameWithViewScale:(double)a3
{
  CGAffineTransform v4;
  CGAffineTransform v5;
  CGRect v6;

  memset(&v5, 0, sizeof(v5));
  CGAffineTransformMakeScale(&v5, a3, a3);
  objc_msgSend(objc_msgSend(objc_msgSend(-[THWInteractiveImageWidgetRep info](self, "info"), "backgroundImageInfo"), "geometry"), "boundsBeforeRotation");
  v4 = v5;
  return CGRectApplyAffineTransform(v6, &v4);
}

- (CGRect)p_diagramFrame
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  THWOverlayableZoomableCanvasController *v7;
  CGAffineTransform v8;
  CGRect v9;

  objc_msgSend(-[THWInteractiveImageWidgetRep info](self, "info"), "backgroundSize");
  v4 = v3;
  objc_msgSend(-[THWInteractiveImageWidgetRep info](self, "info"), "backgroundSize");
  v6 = v5;
  v7 = -[THWInteractiveImageWidgetRep stageCanvasController](self, "stageCanvasController");
  if (v7)
    -[THWOverlayableZoomableCanvasController contentViewTransform](v7, "contentViewTransform");
  else
    memset(&v8, 0, sizeof(v8));
  v9.origin.x = 0.0;
  v9.origin.y = 0.0;
  v9.size.width = v4;
  v9.size.height = v6;
  return CGRectApplyAffineTransform(v9, &v8);
}

- (CGRect)p_diagramFrameWithViewScale:(double)a3
{
  double v4;
  CGFloat v5;
  CGFloat v6;
  CGAffineTransform v7;
  CGAffineTransform v8;
  CGRect v9;

  memset(&v8, 0, sizeof(v8));
  CGAffineTransformMakeScale(&v8, a3, a3);
  objc_msgSend(-[THWInteractiveImageWidgetRep info](self, "info"), "backgroundSize");
  v5 = v4;
  objc_msgSend(-[THWInteractiveImageWidgetRep info](self, "info"), "backgroundSize");
  v9.size.height = v6;
  v7 = v8;
  v9.origin.x = 0.0;
  v9.origin.y = 0.0;
  v9.size.width = v5;
  return CGRectApplyAffineTransform(v9, &v7);
}

- (CGRect)p_calloutFrameWithViewScale:(double)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  objc_msgSend(-[THWInteractiveImageWidgetRep layout](self, "layout"), "calloutFrameWithViewScale:", a3);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)p_viewportFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[THWInteractiveImageWidgetRep p_portalFrame](self, "p_portalFrame");
  -[THWInteractiveImageWidgetRep p_expandedViewportFrameInPortalRect:](self, "p_expandedViewportFrameInPortalRect:");
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)p_portalFrame
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
  double v12;
  CGRect result;

  -[THWOverlayableZoomableCanvasController contentOffset](-[THWInteractiveImageWidgetRep stageCanvasController](self, "stageCanvasController"), "contentOffset");
  v4 = v3;
  -[THWOverlayableZoomableCanvasController contentOffset](-[THWInteractiveImageWidgetRep stageCanvasController](self, "stageCanvasController"), "contentOffset");
  v6 = v5;
  -[UIView bounds](-[THWOverlayableZoomableCanvasController view](-[THWInteractiveImageWidgetRep stageCanvasController](self, "stageCanvasController"), "view"), "bounds");
  v8 = v7;
  -[UIView bounds](-[THWOverlayableZoomableCanvasController view](-[THWInteractiveImageWidgetRep stageCanvasController](self, "stageCanvasController"), "view"), "bounds");
  v10 = v4;
  v11 = v6;
  v12 = v8;
  result.size.height = v9;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (CGRect)p_bufferedHullFrameForImageFrame:(CGRect)a3 calloutFrame:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v8;
  CGFloat v9;
  double v10;
  double MinX;
  double MinY;
  BOOL v13;
  double v14;
  double v15;
  double v16;
  double MaxX;
  double MaxY;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGFloat v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  CGFloat v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3.size.height;
  v9 = a3.size.width;
  v30 = a3.origin.x;
  v31 = a3.origin.y;
  v32 = CGRectUnion(a3, a4);
  v24 = v32.origin.y;
  v25 = v32.origin.x;
  v23 = v32.size.width;
  v26 = v32.size.height;
  v32.origin.x = x;
  v32.origin.y = y;
  v32.size.width = width;
  v32.size.height = height;
  v29 = 0.0;
  v10 = 0.0;
  if (CGRectGetWidth(v32) > 0.0)
  {
    v33.origin.x = x;
    v33.origin.y = y;
    v33.size.width = width;
    v33.size.height = height;
    MinX = CGRectGetMinX(v33);
    v34.origin.x = v30;
    v34.origin.y = v31;
    v34.size.width = v9;
    v34.size.height = v8;
    if (MinX >= CGRectGetMinX(v34))
      v10 = 0.0;
    else
      v10 = 30.0;
  }
  v35.origin.x = x;
  v35.origin.y = y;
  v35.size.width = width;
  v35.size.height = height;
  if (CGRectGetHeight(v35) > 0.0)
  {
    v36.origin.x = x;
    v36.origin.y = y;
    v36.size.width = width;
    v36.size.height = height;
    MinY = CGRectGetMinY(v36);
    v37.origin.x = v30;
    v37.origin.y = v31;
    v37.size.width = v9;
    v37.size.height = v8;
    v13 = MinY < CGRectGetMinY(v37);
    v14 = 0.0;
    if (v13)
      v14 = 30.0;
    v29 = v14;
  }
  v27 = v9;
  v28 = v8;
  v38.origin.x = x;
  v38.origin.y = y;
  v38.size.width = width;
  v38.size.height = height;
  v15 = 0.0;
  v16 = 0.0;
  if (CGRectGetWidth(v38) > 0.0)
  {
    v39.origin.x = x;
    v39.origin.y = y;
    v39.size.width = width;
    v39.size.height = height;
    MaxX = CGRectGetMaxX(v39);
    v40.origin.x = v30;
    v40.origin.y = v31;
    v40.size.width = v27;
    v40.size.height = v28;
    if (MaxX <= CGRectGetMaxX(v40))
      v16 = 0.0;
    else
      v16 = 30.0;
  }
  v41.origin.x = x;
  v41.origin.y = y;
  v41.size.width = width;
  v41.size.height = height;
  if (CGRectGetHeight(v41) > 0.0)
  {
    v42.origin.x = x;
    v42.origin.y = y;
    v42.size.width = width;
    v42.size.height = height;
    MaxY = CGRectGetMaxY(v42);
    v43.origin.x = v30;
    v43.origin.y = v31;
    v43.size.width = v27;
    v43.size.height = v28;
    if (MaxY <= CGRectGetMaxY(v43))
      v15 = 0.0;
    else
      v15 = 30.0;
  }
  v19 = v25 - v10;
  v20 = v24 - v29;
  v21 = v23 + v10 + v16;
  v22 = v26 + v29 + v15;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (UIEdgeInsets)p_insetsForInnerFrame:(CGRect)a3 inOuterFrame:(CGRect)a4
{
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  double MinY;
  double MinX;
  double MaxY;
  double v14;
  double MaxX;
  double v16;
  double v17;
  double v18;
  double v19;
  CGFloat height;
  CGFloat v21;
  double v22;
  double v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  UIEdgeInsets result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v7 = a3.size.height;
  v8 = a3.size.width;
  v9 = a3.origin.y;
  v10 = a3.origin.x;
  v21 = a4.size.width;
  MinY = CGRectGetMinY(a4);
  v24.origin.x = v10;
  v24.origin.y = v9;
  v24.size.width = v8;
  v24.size.height = v7;
  v23 = MinY - CGRectGetMinY(v24);
  v25.origin.x = x;
  v25.origin.y = y;
  v25.size.width = width;
  v25.size.height = height;
  MinX = CGRectGetMinX(v25);
  v26.origin.x = v10;
  v26.origin.y = v9;
  v26.size.width = v8;
  v26.size.height = v7;
  v22 = MinX - CGRectGetMinX(v26);
  v27.origin.x = v10;
  v27.origin.y = v9;
  v27.size.width = v8;
  v27.size.height = v7;
  MaxY = CGRectGetMaxY(v27);
  v28.origin.x = x;
  v28.origin.y = y;
  v28.size.width = v21;
  v28.size.height = height;
  v14 = MaxY - CGRectGetMaxY(v28);
  v29.origin.x = v10;
  v29.origin.y = v9;
  v29.size.width = v8;
  v29.size.height = v7;
  MaxX = CGRectGetMaxX(v29);
  v30.origin.x = x;
  v30.origin.y = y;
  v30.size.width = v21;
  v30.size.height = height;
  v16 = MaxX - CGRectGetMaxX(v30);
  v18 = v22;
  v17 = v23;
  v19 = v14;
  result.right = v16;
  result.bottom = v19;
  result.left = v18;
  result.top = v17;
  return result;
}

- (void)p_setupMinimumViewScale
{
  uint64_t v3;
  double v4;
  void *v5;
  void *v6;
  char *v7;
  char *v8;
  char *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;

  v3 = objc_opt_class(THWInteractiveImageWidgetInfo);
  *(_QWORD *)&v4 = TSUDynamicCast(v3, -[THWInteractiveImageWidgetRep info](self, "info")).n128_u64[0];
  v6 = v5;
  v7 = (char *)objc_msgSend(v5, "calloutCount", v4);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = 0.0;
    do
    {
      objc_msgSend(objc_msgSend(v6, "calloutAtIndex:", v9), "viewScale");
      if (v10 >= v11)
        v12 = v11;
      else
        v12 = v10;
      if (v10 == 0.0)
        v10 = v11;
      else
        v10 = v12;
      ++v9;
    }
    while (v8 != v9);
  }
  else
  {
    v10 = 0.0;
  }
  -[THWInteractiveImageWidgetRep baseViewScale](self, "baseViewScale");
  v14 = v10 * v13;
  if (v14 > 0.0)
    objc_msgSend(objc_msgSend(-[TSDInteractiveCanvasController canvasView](-[THWOverlayableZoomableCanvasController scrollContentICC](-[THWInteractiveImageWidgetRep stageCanvasController](self, "stageCanvasController"), "scrollContentICC"), "canvasView"), "canvasLayer"), "setMinimumPinchViewScale:", v14);
}

- (void)p_setupInitialZoom
{
  uint64_t v3;
  double v4;
  void *v5;
  void *v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;

  v3 = objc_opt_class(THWInteractiveImageWidgetInfo);
  *(_QWORD *)&v4 = TSUDynamicCast(v3, -[THWInteractiveImageWidgetRep info](self, "info")).n128_u64[0];
  v6 = v5;
  if (-[THWInteractiveImageWidgetRep useStoredViewportIndex](self, "useStoredViewportIndex", v4))
  {
    -[THWInteractiveImageWidgetController selectOption:force:animated:](self->_controller, "selectOption:force:animated:", -[THWInteractiveImageWidgetRep storedViewportIndex](self, "storedViewportIndex"), 1, 0);
  }
  else
  {
    v7 = objc_msgSend(v6, "calloutAtIndex:", -[THWInteractiveImageWidgetRep viewportIndex](self, "viewportIndex"));
    objc_msgSend(v7, "viewScale");
    v9 = v8;
    objc_msgSend(v7, "contentOffset");
    -[THWInteractiveImageWidgetRep p_updateDiagramWithZoom:offset:animated:previousCalloutIndex:completion:](self, "p_updateDiagramWithZoom:offset:animated:previousCalloutIndex:completion:", 0, -[THWInteractiveImageWidgetRep viewportIndex](self, "viewportIndex"), 0, v9, v10, v11);
  }
  -[THWInteractiveImageWidgetRep applyScrollingPolicy](self, "applyScrollingPolicy");
  -[THWInteractiveImageWidgetRep p_setupMinimumViewScale](self, "p_setupMinimumViewScale");
}

- (void)p_adjustScrollViewContentInsets
{
  double v3;
  double v4;
  double v5;
  double v6;

  -[THWInteractiveImageWidgetRep p_portalFrame](self, "p_portalFrame");
  -[TSDInteractiveCanvasController viewScale](-[THWOverlayableZoomableCanvasController scrollContentICC](-[THWInteractiveImageWidgetRep stageCanvasController](self, "stageCanvasController"), "scrollContentICC"), "viewScale");
  -[THWInteractiveImageWidgetRep p_insetsWithViewScale:viewportBounds:](self, "p_insetsWithViewScale:viewportBounds:");
  -[THWOverlayableZoomableCanvasController setContentInset:](-[THWInteractiveImageWidgetRep stageCanvasController](self, "stageCanvasController"), "setContentInset:", v3, v4, v5, v6);
}

- (void)p_invalidateCalloutReps
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];

  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = objc_msgSend(-[THWInteractiveImageWidgetRep layout](self, "layout", 0), "calloutLayouts");
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * (_QWORD)v6), "invalidateFrame");
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }
}

- (void)p_updateDiagramWithZoom:(double)a3 offset:(CGPoint)a4 animated:(BOOL)a5 previousCalloutIndex:(unint64_t)a6 completion:(id)a7
{
  double x;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  TSDInteractiveCanvasController *v22;
  uint64_t v23;

  x = a4.x;
  -[THWInteractiveImageWidgetRep setTargetViewScale:](self, "setTargetViewScale:");
  v13 = TSDRoundedPoint(x);
  v15 = v14;
  -[THWInteractiveImageWidgetRep baseViewScale](self, "baseViewScale");
  v17 = v16 * a3;
  -[THWInteractiveImageWidgetRep p_scrollScaledFromClientScaledPoint:](self, "p_scrollScaledFromClientScaledPoint:", v13, v15);
  v20 = v18;
  v21 = v19;
  if (a5)
  {
    self->_animationPreviousCalloutIndex = a6;
    v22 = -[THWOverlayableZoomableCanvasController scrollContainerICC](-[THWInteractiveImageWidgetRep stageCanvasController](self, "stageCanvasController"), "scrollContainerICC");
    -[THWInteractiveImageWidgetRep setAnimatingCallouts:](self, "setAnimatingCallouts:", 1, _NSConcreteStackBlock, 3221225472, sub_15B4C0, &unk_42A058, self, v22, a7, a6);
    objc_msgSend(-[TSDInteractiveCanvasController trackingController](v22, "trackingController"), "pushDisableUpdates");
    objc_msgSend(objc_msgSend(-[THWInteractiveImageWidgetRep interactiveCanvasController](self, "interactiveCanvasController"), "trackingController"), "pushDisableUpdates");
    objc_msgSend(-[TSDInteractiveCanvasController trackingController](-[THWOverlayableZoomableCanvasController scrollContentICC](-[THWInteractiveImageWidgetRep stageCanvasController](self, "stageCanvasController"), "scrollContentICC"), "trackingController"), "pushDisableUpdates");
    +[CATransaction begin](CATransaction, "begin");
    -[TSDInteractiveCanvasController beginAnimations:context:](-[THWOverlayableZoomableCanvasController scrollContentICC](self->_stageCanvasController, "scrollContentICC"), "beginAnimations:context:", CFSTR("view-scale"), 0);
    -[TSDInteractiveCanvasController beginAnimations:context:](v22, "beginAnimations:context:", CFSTR("callout-bounds"), 0);
    -[THWInteractiveImageWidgetRep zoomDuration](self, "zoomDuration");
    -[TSDInteractiveCanvasController setAnimationDuration:](v22, "setAnimationDuration:");
    -[TSDInteractiveCanvasController setAnimationUseRepFiltering:](v22, "setAnimationUseRepFiltering:", 1);
    objc_msgSend(-[THWInteractiveImageWidgetRep layout](self, "layout"), "setViewScale:contentOffset:animated:", 1, v17, v20, v21);
    -[THWInteractiveImageWidgetRep setViewScale:contentOffset:animated:completion:](self, "setViewScale:contentOffset:animated:completion:", 1, &v23, a3, v13, v15);
    -[THWInteractiveImageWidgetRep p_invalidateCalloutReps](self, "p_invalidateCalloutReps");
    objc_msgSend(objc_msgSend(-[THWInteractiveImageWidgetRep layout](self, "layout"), "sidebarLayout"), "updateCallout:", -[THWInteractiveImageWidgetRep calloutInfoForDisplay](self, "calloutInfoForDisplay"));
    -[TSDInteractiveCanvasController layoutIfNeeded](v22, "layoutIfNeeded");
    -[TSDInteractiveCanvasController commitAnimations](v22, "commitAnimations");
    -[TSDInteractiveCanvasController commitAnimations](-[THWOverlayableZoomableCanvasController scrollContentICC](self->_stageCanvasController, "scrollContentICC"), "commitAnimations");
    -[THWInteractiveImageWidgetRep setAnimatingCallouts:](self, "setAnimatingCallouts:", 0);
    +[CATransaction commit](CATransaction, "commit");
    self->_animationPreviousCalloutIndex = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    objc_msgSend(-[THWInteractiveImageWidgetRep layout](self, "layout"), "setViewScale:contentOffset:animated:", 0, v17, v18, v19);
    -[THWInteractiveImageWidgetRep setViewScale:contentOffset:animated:completion:](self, "setViewScale:contentOffset:animated:completion:", 0, 0, a3, v13, v15);
    -[THWInteractiveImageWidgetRep p_invalidateCalloutReps](self, "p_invalidateCalloutReps");
    objc_msgSend(objc_msgSend(-[THWInteractiveImageWidgetRep layout](self, "layout"), "sidebarLayout"), "updateCallout:", -[THWInteractiveImageWidgetRep calloutInfoForDisplay](self, "calloutInfoForDisplay"));
    objc_msgSend(objc_msgSend(-[THWInteractiveImageWidgetRep layout](self, "layout"), "sidebarLayout"), "clearPreviousCallout");
    -[THWInteractiveImageWidgetRep p_adjustScrollViewContentInsets](self, "p_adjustScrollViewContentInsets");
    if (a7)
      (*((void (**)(id, uint64_t))a7 + 2))(a7, 1);
  }
}

- (id)p_sidebarRep
{
  uint64_t v3;
  id result;

  v3 = objc_opt_class(THWInteractiveImageSidebarRep);
  TSUDynamicCast(v3, -[TSDInteractiveCanvasController repForLayout:](-[THWOverlayableZoomableCanvasController scrollContainerICC](self->_stageCanvasController, "scrollContainerICC"), "repForLayout:", objc_msgSend(-[THWInteractiveImageWidgetRep layout](self, "layout"), "sidebarLayout")));
  return result;
}

- (void)p_updateDiagramAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v5;
  uint64_t v7;
  double v8;
  id v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;

  v5 = a3;
  v7 = objc_opt_class(THWInteractiveImageWidgetInfo);
  *(_QWORD *)&v8 = TSUDynamicCast(v7, -[THWInteractiveImageWidgetRep info](self, "info")).n128_u64[0];
  v10 = objc_msgSend(v9, "calloutAtIndex:", -[THWInteractiveImageWidgetRep viewportIndex](self, "viewportIndex", v8));
  objc_msgSend(v10, "viewScale");
  v12 = v11;
  objc_msgSend(v10, "contentOffset");
  -[THWInteractiveImageWidgetRep p_updateDiagramWithZoom:offset:animated:previousCalloutIndex:completion:](self, "p_updateDiagramWithZoom:offset:animated:previousCalloutIndex:completion:", v5, -[THWInteractiveImageWidgetRep viewportIndex](self, "viewportIndex"), a4, v12, v13, v14);
}

- (void)updateDiagramAnimated:(BOOL)a3
{
  -[THWInteractiveImageWidgetRep p_updateDiagramAnimated:completion:](self, "p_updateDiagramAnimated:completion:", a3, 0);
}

- (void)changeToViewport:(unint64_t)a3 previousCalloutIndex:(unint64_t)a4 contentOffset:(CGPoint)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  id v9;
  _QWORD v10[5];

  v6 = a6;
  v9 = objc_msgSend(-[THWInteractiveImageWidgetRep info](self, "info"), "calloutAtIndex:", a3);
  -[THWOverlayableZoomableCanvasController setScrollEnabled:](-[THWInteractiveImageWidgetRep stageCanvasController](self, "stageCanvasController"), "setScrollEnabled:", 0);
  objc_msgSend(-[THWInteractiveImageWidgetRep layout](self, "layout"), "updateSelectedCallout:", v9);
  objc_msgSend(v9, "viewScale");
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_15B780;
  v10[3] = &unk_427130;
  v10[4] = self;
  -[THWInteractiveImageWidgetRep p_updateDiagramWithZoom:offset:animated:previousCalloutIndex:completion:](self, "p_updateDiagramWithZoom:offset:animated:previousCalloutIndex:completion:", v6, a4, v10);
}

- (void)selectedCalloutIndexUpdatedAnimated:(BOOL)a3
{
  _BOOL4 v3;
  THWExpandedRepController *expandedRepController;

  v3 = a3;
  -[THWInteractiveImageWidgetRep setPanelDescriptionExpanded:](self, "setPanelDescriptionExpanded:", 0);
  if (v3)
  {
    expandedRepController = self->_expandedRepController;
    -[THWInteractiveImageWidgetRep zoomDuration](self, "zoomDuration");
    -[THWExpandedRepController expandedRepControllerAnimatePanel:withCrossFadeContent:backgroundLayout:duration:](expandedRepController, "expandedRepControllerAnimatePanel:withCrossFadeContent:backgroundLayout:duration:", 1, 1, 0);
  }
  -[THWExpandedRepController expandedRepControllerInvalidateChildrenInPanel:invalidateWPAuto:](self->_expandedRepController, "expandedRepControllerInvalidateChildrenInPanel:invalidateWPAuto:", 1, 1);
}

- (BOOL)userInteractionEnabled
{
  return objc_msgSend(-[TSDInteractiveCanvasController canvasView](-[THWOverlayableZoomableCanvasController scrollContainerICC](-[THWInteractiveImageWidgetRep stageCanvasController](self, "stageCanvasController"), "scrollContainerICC"), "canvasView"), "isUserInteractionEnabled");
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  _BOOL8 v4;

  if (a3)
  {
    if (-[THWInteractiveImageWidgetRep pressableHandler](self, "pressableHandler"))
      v4 = -[THWPressableRepGestureTargetHandler widgetInteractionEnabled](-[THWInteractiveImageWidgetRep pressableHandler](self, "pressableHandler"), "widgetInteractionEnabled");
    else
      v4 = 1;
  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(-[TSDInteractiveCanvasController canvasView](-[THWOverlayableZoomableCanvasController scrollContainerICC](-[THWInteractiveImageWidgetRep stageCanvasController](self, "stageCanvasController"), "scrollContainerICC"), "canvasView"), "setUserInteractionEnabled:", v4);
}

- (void)interactiveImageCalloutUpdatedHovering:(id)a3
{
  -[THWInteractiveImageWidgetRep updatedHovering](self, "updatedHovering", a3);
}

- (CGPoint)interactiveImageCallout:(id)a3 convertContentPointToUnscaledOverlayPoint:(CGPoint)a4
{
  double v4;
  double v5;
  CGPoint result;

  -[THWInteractiveImageWidgetRep convertContentPointToUnscaledOverlayPoint:](self, "convertContentPointToUnscaledOverlayPoint:", a3, a4.x, a4.y);
  result.y = v5;
  result.x = v4;
  return result;
}

- (BOOL)interactiveImageCalloutIsAnimating:(id)a3
{
  return -[THWInteractiveImageWidgetRep animatingCallouts](self, "animatingCallouts", a3);
}

- (void)interactiveImageCalloutPressed:(id)a3
{
  -[THWInteractiveImageWidgetController selectOption:](self->_controller, "selectOption:", objc_msgSend(-[THWInteractiveImageWidgetRep info](self, "info"), "indexOfCallout:", objc_msgSend(objc_msgSend(a3, "layout"), "calloutInfo")));
}

- (BOOL)interactiveImageCalloutIsScrollViewDragging:(id)a3
{
  return objc_msgSend(-[TSDInteractiveCanvasController canvasView](-[THWOverlayableZoomableCanvasController scrollContentICC](self->_stageCanvasController, "scrollContentICC", a3), "canvasView"), "isAncestorScrollViewDragging");
}

- (THWFreeTransformableRepGestureTargetHandler)freeTransformableHandler
{
  return self->_freeTransformableHandler;
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

- (THWOverlayableZoomableCanvasController)stageCanvasController
{
  return self->_stageCanvasController;
}

- (void)setStageCanvasController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 312);
}

- (BOOL)animatingCallouts
{
  return self->_animatingCallouts;
}

- (void)setAnimatingCallouts:(BOOL)a3
{
  self->_animatingCallouts = a3;
}

- (THWInteractiveImageWidgetController)controller
{
  return self->_controller;
}

- (void)setController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 320);
}

- (double)targetViewScale
{
  return self->_targetViewScale;
}

- (void)setTargetViewScale:(double)a3
{
  self->_targetViewScale = a3;
}

- (CALayer)sourceOverlayLayer
{
  return self->_sourceOverlayLayer;
}

- (void)setSourceOverlayLayer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 336);
}

- (BOOL)useStoredViewportIndex
{
  return self->_useStoredViewportIndex;
}

- (void)setUseStoredViewportIndex:(BOOL)a3
{
  self->_useStoredViewportIndex = a3;
}

- (unint64_t)storedViewportIndex
{
  return self->_storedViewportIndex;
}

- (void)setStoredViewportIndex:(unint64_t)a3
{
  self->_storedViewportIndex = a3;
}

- (THWPressableRepGestureTargetHandler)pressableHandler
{
  return self->_pressableHandler;
}

- (void)setPressableHandler:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 352);
}

- (THWImageCropAnimationController)imageCropAnimationController
{
  return self->_imageCropAnimationController;
}

- (void)setImageCropAnimationController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 360);
}

- (THWExpandedRepController)expandedRepController
{
  return self->_expandedRepController;
}

- (double)rotationDuration
{
  return self->_rotationDuration;
}

- (void)setRotationDuration:(double)a3
{
  self->_rotationDuration = a3;
}

- (CGColor)borderColor
{
  return self->_borderColor;
}

- (void)setBorderColor:(CGColor *)a3
{
  self->_borderColor = a3;
}

- (BOOL)calloutsHidden
{
  return self->_calloutsHidden;
}

- (void)setCalloutsHidden:(BOOL)a3
{
  self->_calloutsHidden = a3;
}

- (TSDImageRepCachedSizedImage)cachedImage
{
  return self->_cachedImage;
}

- (void)setCachedImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 392);
}

- (BOOL)wantsCachedImage
{
  return self->_wantsCachedImage;
}

- (void)setWantsCachedImage:(BOOL)a3
{
  self->_wantsCachedImage = a3;
}

- (CALayer)stageBackgroundLayer
{
  return self->_stageBackgroundLayer;
}

- (void)setStageBackgroundLayer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 400);
}

- (TSUImage)stageBackgroundImage
{
  return self->_stageBackgroundImage;
}

- (void)setStageBackgroundImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 408);
}

- (BOOL)panelDescriptionExpanded
{
  return self->_panelDescriptionExpanded;
}

- (void)setPanelDescriptionExpanded:(BOOL)a3
{
  self->_panelDescriptionExpanded = a3;
}

@end
