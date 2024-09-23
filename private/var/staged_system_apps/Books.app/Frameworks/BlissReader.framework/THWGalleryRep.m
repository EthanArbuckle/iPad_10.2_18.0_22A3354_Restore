@implementation THWGalleryRep

- (THWGalleryRep)initWithLayout:(id)a3 canvas:(id)a4
{
  THWGalleryRep *v4;
  uint64_t v5;
  double v6;
  id v7;
  id v8;
  id v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)THWGalleryRep;
  v4 = -[THWGalleryRep initWithLayout:canvas:](&v11, "initWithLayout:canvas:", a3, a4);
  if (v4)
  {
    v5 = objc_opt_class(THInteractiveCanvasController);
    *(_QWORD *)&v6 = TSUDynamicCast(v5, -[THWGalleryRep interactiveCanvasController](v4, "interactiveCanvasController")).n128_u64[0];
    v8 = objc_msgSend(v7, "pressHandlerForPressableReps", v6);
    v4->_currentPage = 0x7FFFFFFFFFFFFFFFLL;
    if (v8)
      v4->_pressableHandler = -[THWPressableRepGestureTargetHandler initWithPressableRep:pressHandler:]([THWPressableRepGestureTargetHandler alloc], "initWithPressableRep:pressHandler:", v4, v8);
    if (-[THWGalleryRep isExpanded](v4, "isExpanded"))
      v9 = objc_msgSend(-[THWGalleryRep hostICC](v4, "hostICC"), "delegate");
    else
      v9 = -[THWGalleryRep interactiveCanvasController](v4, "interactiveCanvasController");
    v4->_progressTracker = (BCProgressTrackingRepTracker *)TSUProtocolCast(&OBJC_PROTOCOL___BCProgressTrackingRepTracker, v9);
    v4->_progressSet = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    if (objc_msgSend(objc_msgSend(-[THWGalleryRep hostICC](v4, "hostICC"), "widgetHost"), "freeTransformRepHandler"))
      v4->_freeTransformableHandler = -[THWFreeTransformableRepGestureTargetHandler initWithFreeTransformableRep:handler:]([THWFreeTransformableRepGestureTargetHandler alloc], "initWithFreeTransformableRep:handler:", v4, objc_msgSend(objc_msgSend(-[THWGalleryRep hostICC](v4, "hostICC"), "widgetHost"), "freeTransformRepHandler"));
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWGalleryRep;
  -[THWGalleryRep dealloc](&v3, "dealloc");
}

- (BOOL)p_supportZoom
{
  return objc_msgSend(-[THWGalleryRep layout](self, "layout"), "useZoom");
}

- (void)screenScaleDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWGalleryRep;
  -[THWGalleryRep screenScaleDidChange](&v3, "screenScaleDidChange");
  objc_msgSend(-[THWGalleryRep canvas](self, "canvas"), "contentsScale");
  -[CAShapeLayer setContentsScale:](self->_thumbnailHighlightLayer, "setContentsScale:");
}

- (double)p_integralScaledThumbnailHighlightWidth
{
  double v2;

  objc_msgSend(-[THWGalleryRep canvas](self, "canvas"), "viewScale");
  return round(v2 * 4.0);
}

- (id)p_highlightLayerForThumbnailSize:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGPath *Mutable;
  CGRect v17;
  CGRect v18;

  height = a3.height;
  width = a3.width;
  if (!self->_thumbnailHighlightLayer)
  {
    self->_thumbnailHighlightLayer = (CAShapeLayer *)objc_alloc_init((Class)CAShapeLayer);
    -[CAShapeLayer setDelegate:](self->_thumbnailHighlightLayer, "setDelegate:", +[THNoAnimationLayerDelegate sharedInstance](THNoAnimationLayerDelegate, "sharedInstance"));
    -[CAShapeLayer setAnchorPoint:](self->_thumbnailHighlightLayer, "setAnchorPoint:", CGPointZero.x, CGPointZero.y);
    -[CAShapeLayer setFillColor:](self->_thumbnailHighlightLayer, "setFillColor:", -[TSUColor CGColor](+[TSUColor colorWithRed:green:blue:alpha:](TSUColor, "colorWithRed:green:blue:alpha:", 1.0, 0.796078431, 0.211764706, 1.0), "CGColor"));
    -[CAShapeLayer setFillRule:](self->_thumbnailHighlightLayer, "setFillRule:", kCAFillRuleEvenOdd);
    objc_msgSend(-[THWGalleryRep canvas](self, "canvas"), "contentsScale");
    -[CAShapeLayer setContentsScale:](self->_thumbnailHighlightLayer, "setContentsScale:");
  }
  -[THWGalleryRep p_integralScaledThumbnailHighlightWidth](self, "p_integralScaledThumbnailHighlightWidth");
  v7 = v6;
  v8 = floor(width);
  v9 = floor(height);
  v10 = v8 + v6 * 2.0;
  v11 = v9 + v6 * 2.0;
  -[CAShapeLayer bounds](self->_thumbnailHighlightLayer, "bounds");
  if (v13 != v10 || v12 != v11)
  {
    Mutable = CGPathCreateMutable();
    v17.origin.x = v7;
    v17.origin.y = v7;
    v17.size.width = v8;
    v17.size.height = v9;
    CGPathAddRect(Mutable, 0, v17);
    v18.origin.x = 0.0;
    v18.origin.y = 0.0;
    v18.size.width = v8 + v7 * 2.0;
    v18.size.height = v9 + v7 * 2.0;
    CGPathAddRect(Mutable, 0, v18);
    -[CAShapeLayer setPath:](self->_thumbnailHighlightLayer, "setPath:", Mutable);
    CGPathRelease(Mutable);
    -[CAShapeLayer setBounds:](self->_thumbnailHighlightLayer, "setBounds:", 0.0, 0.0, v8 + v7 * 2.0, v9 + v7 * 2.0);
  }
  return self->_thumbnailHighlightLayer;
}

- (unint64_t)currentPage
{
  if (self->_currentPage == 0x7FFFFFFFFFFFFFFFLL)
    return (unint64_t)objc_msgSend(objc_msgSend(-[THWGalleryRep layout](self, "layout"), "pageControl"), "currentPage");
  else
    return self->_currentPage;
}

- (void)viewScaleDidChange
{
  -[THWGalleryRep p_updateStageCornerRadius](self, "p_updateStageCornerRadius");
  -[THWGalleryRep p_updateUserInteractionForController:](self, "p_updateUserInteractionForController:", self->_stageCanvasController);
  -[THWGalleryRep p_updateUserInteractionForController:](self, "p_updateUserInteractionForController:", self->_thumbnailTrackCanvasController);
}

- (void)p_updateStageCornerRadius
{
  double v3;
  double v4;
  double v5;

  objc_msgSend(-[THWGalleryRep layout](self, "layout"), "stageCornerRadius");
  v4 = v3;
  objc_msgSend(-[THWGalleryRep canvas](self, "canvas"), "viewScale");
  objc_msgSend(objc_msgSend(-[TSDInteractiveCanvasController layerHost](-[THWPagedCanvasController interactiveCanvasController](self->_stageCanvasController, "interactiveCanvasController"), "layerHost"), "clippingLayer"), "setCornerRadius:", v4 * v5);
}

- (BOOL)p_shouldPageOnGesture:(id)a3 toLeft:(BOOL *)a4 toRight:(BOOL *)a5
{
  if (a4)
    *a4 = 0;
  if (a5)
    *a5 = 0;
  return 0;
}

- (void)p_goToPage:(unint64_t)a3
{
  unint64_t v5;
  unint64_t v6;

  if (-[THWGalleryRep pageCountForPagedCanvasController:](self, "pageCountForPagedCanvasController:", self->_stageCanvasController) <= a3)objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWGalleryRep p_goToPage:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Gallery/THWGalleryRep.m"), 334, CFSTR("page index is out of bounds: %lu"), a3);
  v5 = -[THWPagedCanvasController pageIndex](self->_stageCanvasController, "pageIndex");
  if (v5 != a3)
  {
    if (v5 >= a3)
      v6 = v5 - a3;
    else
      v6 = a3 - v5;
    -[THWPagedCanvasController setMinimizeInfoChange:](self->_stageCanvasController, "setMinimizeInfoChange:", 1);
    -[THWPagedCanvasController setPageIndex:animated:](self->_stageCanvasController, "setPageIndex:animated:", a3, v6 < 2);
    if (v6 >= 2)
    {
      objc_msgSend(-[THWGalleryRep layout](self, "layout"), "updateCurrentItemIndex:", a3);
      -[THWExpandedRepController expandedRepControllerInvalidateChildrenInPanel:invalidateWPAuto:](self->_expandedRepController, "expandedRepControllerInvalidateChildrenInPanel:invalidateWPAuto:", 1, 0);
      -[THWGalleryRep p_relaxMinimizeInfosNextFrame](self, "p_relaxMinimizeInfosNextFrame");
    }
  }
}

- (BOOL)p_canMoveToNextPage
{
  char *v3;

  v3 = (char *)-[THWPagedCanvasController pageIndex](self->_stageCanvasController, "pageIndex") + 1;
  return v3 < (char *)-[THWGalleryRep pageCountForPagedCanvasController:](self, "pageCountForPagedCanvasController:", self->_stageCanvasController);
}

- (BOOL)p_moveToNextPage
{
  _BOOL4 v3;

  v3 = -[THWGalleryRep p_canMoveToNextPage](self, "p_canMoveToNextPage");
  if (v3)
    -[THWGalleryRep p_goToPage:](self, "p_goToPage:", (char *)-[THWPagedCanvasController pageIndex](self->_stageCanvasController, "pageIndex") + 1);
  return v3;
}

- (BOOL)p_canMoveToPreviousPage
{
  return -[THWPagedCanvasController pageIndex](self->_stageCanvasController, "pageIndex") != 0;
}

- (BOOL)p_moveToPreviousPage
{
  _BOOL4 v3;

  v3 = -[THWGalleryRep p_canMoveToPreviousPage](self, "p_canMoveToPreviousPage");
  if (v3)
    -[THWGalleryRep p_goToPage:](self, "p_goToPage:", (char *)-[THWPagedCanvasController pageIndex](self->_stageCanvasController, "pageIndex") - 1);
  return v3;
}

- (int)positionForChildView:(id)a3
{
  return 2;
}

- (unint64_t)hitTestOptions
{
  return 4;
}

- (void)control:(id)a3 repWasAdded:(id)a4
{
  uint64_t v7;
  double v8;
  void *v9;
  void *v10;
  uint64_t v11;
  double v12;
  id v13;
  double v14;
  id v15;
  uint64_t v16;
  double v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  _BOOL8 v22;
  uint64_t v23;
  double v24;
  id v25;
  THWPagedCanvasController *v26;
  uint64_t v27;
  THWPagedCanvasController *stageCanvasController;
  double v29;

  switch((unint64_t)objc_msgSend(a3, "tag"))
  {
    case 0uLL:

      self->_stageCanvasController = 0;
      v11 = objc_opt_class(THWPagedCanvasControlRep);
      *(_QWORD *)&v12 = TSUDynamicCast(v11, a4).n128_u64[0];
      self->_stageCanvasController = (THWPagedCanvasController *)objc_msgSend(v13, "pagedCanvasController", v12);
      objc_msgSend(-[THWGalleryRep layout](self, "layout"), "stageCornerRadius");
      if (v14 <= 0.0)
        v15 = 0;
      else
        v15 = objc_msgSend(-[THWGalleryRep interactiveCanvasController](self, "interactiveCanvasController"), "currentlyScrolling");
      -[THWPagedCanvasController setRasterize:](self->_stageCanvasController, "setRasterize:", v15);
      -[THWPagedCanvasController setMinimizeInfoChange:](self->_stageCanvasController, "setMinimizeInfoChange:", 1);
      stageCanvasController = self->_stageCanvasController;
      goto LABEL_11;
    case 1uLL:

      self->_thumbnailTrackCanvasController = 0;
      v23 = objc_opt_class(THWPagedCanvasControlRep);
      *(_QWORD *)&v24 = TSUDynamicCast(v23, a4).n128_u64[0];
      v26 = (THWPagedCanvasController *)objc_msgSend(v25, "pagedCanvasController", v24);
      self->_thumbnailTrackCanvasController = v26;
      -[THWPagedCanvasController setDelegate:](v26, "setDelegate:", self);
      -[THWPagedCanvasController setDisableThreadedLayoutAndRenderDuringAnimation:](self->_thumbnailTrackCanvasController, "setDisableThreadedLayoutAndRenderDuringAnimation:", 0);
      break;
    case 3uLL:
    case 4uLL:
      v7 = objc_opt_class(THWPageControlRep);
      *(_QWORD *)&v8 = TSUDynamicCast(v7, a4).n128_u64[0];
      v10 = v9;
      objc_msgSend(v9, "setDelegate:", self, v8);
      objc_msgSend(v10, "setPageDirectlyToIndex:", 0);
      objc_msgSend(objc_msgSend(v10, "layout"), "setSpacing:", 9.0);
      break;
    case 5uLL:
      v27 = objc_opt_class(THWButtonControlRep);
      *(_QWORD *)&v29 = TSUDynamicCast(v27, a4).n128_u64[0];
LABEL_11:
      -[THWPagedCanvasController setDelegate:](stageCanvasController, "setDelegate:", self, v29);
      break;
    case 7uLL:
      v16 = objc_opt_class(THWZoomableCanvasControlRep);
      *(_QWORD *)&v17 = TSUDynamicCast(v16, a4).n128_u64[0];
      v19 = v18;
      objc_msgSend(objc_msgSend(v18, "zoomableCanvasController"), "setInstanceData:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a3, "index", v17)));
      objc_msgSend(objc_msgSend(v19, "zoomableCanvasController"), "setDelegate:", self);
      v20 = objc_msgSend(objc_msgSend(v19, "zoomableCanvasController"), "interactiveCanvasController");
      v21 = objc_msgSend(a3, "index");
      v22 = v21 == (id)-[THWPagedCanvasController pageIndex](self->_stageCanvasController, "pageIndex")
         && -[THWGalleryRep p_shouldSuppressRenderingDuringExpansion](self, "p_shouldSuppressRenderingDuringExpansion");
      objc_msgSend(v20, "setShouldSuppressRendering:animated:", v22, 0);
      break;
    default:
      return;
  }
}

- (void)control:(id)a3 repWillBeRemoved:(id)a4
{
  uint64_t v5;
  double v6;
  id v7;

  if (objc_msgSend(a3, "tag") == (char *)&dword_4 + 3)
  {
    v5 = objc_opt_class(THWZoomableCanvasControlRep);
    *(_QWORD *)&v6 = TSUDynamicCast(v5, a4).n128_u64[0];
    objc_msgSend(objc_msgSend(v7, "zoomableCanvasController", v6), "setDelegate:", 0);
  }
}

- (BOOL)control:(id)a3 isInteractionEnabledForRep:(id)a4
{
  if (-[THWGalleryRep pressableHandler](self, "pressableHandler", a3, a4))
    return -[THWPressableRepGestureTargetHandler widgetInteractionEnabled](-[THWGalleryRep pressableHandler](self, "pressableHandler"), "widgetInteractionEnabled");
  else
    return 1;
}

- (BOOL)pagedCanvasController:(id)a3 shouldDisableScrollingAtContentEdgesForScrollView:(id)a4
{
  return !-[THWGalleryRep isExpanded](self, "isExpanded", a3, a4);
}

- (BOOL)pagedCanvasController:(id)a3 shouldDisableScrollingWhenCursorIsHiddenForScrollView:(id)a4
{
  return !-[THWGalleryRep isExpanded](self, "isExpanded", a3, a4);
}

- (unint64_t)pageCountForPagedCanvasController:(id)a3
{
  if (!a3)
    return 0;
  if (self->_stageCanvasController == a3)
    return (unint64_t)objc_msgSend(-[THWGalleryRep layout](self, "layout"), "numberOfStagePages");
  if (self->_thumbnailTrackCanvasController != a3)
    return 0;
  return (unint64_t)objc_msgSend(-[THWGalleryRep layout](self, "layout"), "numberOfThumbnailTrackPages");
}

- (id)pagedCanvasController:(id)a3 infosToDisplayForPageRange:(_NSRange)a4
{
  if (!a3)
    return 0;
  if (self->_stageCanvasController == a3)
    return objc_msgSend(-[THWGalleryRep layout](self, "layout"), "infosForStagePages:", a4.location, a4.length);
  if (self->_thumbnailTrackCanvasController != a3)
    return 0;
  return objc_msgSend(-[THWGalleryRep layout](self, "layout"), "infosForThumbnailTrackPages:", a4.location, a4.length);
}

- (void)pagedCanvasController:(id)a3 mostVisiblePageChangedToPageIndex:(unint64_t)a4
{
  THWExpandedRepController *expandedRepController;

  if (a3 && self->_stageCanvasController == a3)
  {
    expandedRepController = self->_expandedRepController;
    if (expandedRepController)
      -[THWExpandedRepController expandedRepControllerAnimatePanel:withCrossFadeContent:backgroundLayout:duration:](expandedRepController, "expandedRepControllerAnimatePanel:withCrossFadeContent:backgroundLayout:duration:", 1, 0, 1, 0.15);
    else
      objc_msgSend(-[THWGalleryRep interactiveCanvasController](self, "interactiveCanvasController"), "forceBackgroundLayout");
    objc_msgSend(-[THWGalleryRep layout](self, "layout"), "updateCurrentItemIndex:", a4);
    -[TSDInteractiveCanvasController forceBackgroundLayout](-[THWPagedCanvasController interactiveCanvasController](self->_thumbnailTrackCanvasController, "interactiveCanvasController"), "forceBackgroundLayout");
    objc_msgSend(objc_msgSend(-[THWGalleryRep layout](self, "layout"), "pageControl"), "setCurrentPage:", a4);
    -[THWPagedCanvasController invalidateLayers](self->_thumbnailTrackCanvasController, "invalidateLayers");
  }
}

- (void)pagedCanvasController:(id)a3 didScrollToPageIndex:(unint64_t)a4
{
  id v7;
  void *v8;

  if (a3)
  {
    v7 = -[THWGalleryRep layout](self, "layout");
    v8 = v7;
    if (self->_stageCanvasController == a3)
    {
      -[THWGalleryRep p_relaxMinimizeInfosNextFrame](self, "p_relaxMinimizeInfosNextFrame");
      objc_msgSend(v8, "updateCurrentItemIndex:", a4);
      -[THWExpandedRepController expandedRepControllerInvalidateChildrenInPanel:invalidateWPAuto:](self->_expandedRepController, "expandedRepControllerInvalidateChildrenInPanel:invalidateWPAuto:", 1, 0);
      if (self->_thumbnailTrackCanvasController)
      {
        -[THWPagedCanvasController setPageIndex:](self->_thumbnailTrackCanvasController, "setPageIndex:", objc_msgSend(v8, "thumbnailPageIndexForItemIndex:", a4));
        -[THWPagedCanvasController invalidateLayers](self->_thumbnailTrackCanvasController, "invalidateLayers");
      }
      -[THWGalleryRep p_resetViewScaleForItemsExcept:](self, "p_resetViewScaleForItemsExcept:", -[THWGalleryRep currentItem](self, "currentItem"));
    }
    else if (self->_thumbnailTrackCanvasController == a3)
    {
      objc_msgSend(objc_msgSend(v7, "thumbnailPageControl"), "setCurrentPage:", a4);
    }
  }
}

- (id)pagedCanvasController:(id)a3 primaryTargetForGesture:(id)a4
{
  if (*((id *)self + 40) != a3)
    return 0;
  return self;
}

- (void)p_rasterizeCanvases:(BOOL)a3
{
  if (a3)
    objc_msgSend(-[THWGalleryRep layout](self, "layout"), "stageCornerRadius");
  -[THWPagedCanvasController setRasterize:](self->_stageCanvasController, "setRasterize:");
}

- (void)viewScrollWillChange
{
  -[THWGalleryRep p_rasterizeCanvases:](self, "p_rasterizeCanvases:", 1);
}

- (void)viewScrollingEnded
{
  -[THWGalleryRep p_rasterizeCanvases:](self, "p_rasterizeCanvases:", 0);
}

- (double)pagedCanvasControllerVerticalOverflow:(id)a3
{
  double result;

  if (self->_thumbnailTrackCanvasController != a3)
    return 0.0;
  objc_msgSend(-[THWGalleryRep layout](self, "layout"), "thumbnailTrackVerticalPadding");
  return result;
}

- (void)p_updateUserInteractionForController:(id)a3
{
  _BOOL8 v5;

  if (a3)
  {
    if (-[THWGalleryRep p_isExpanding](self, "p_isExpanding"))
    {
      v5 = 0;
    }
    else if (-[THWGalleryRep pressableHandler](self, "pressableHandler"))
    {
      v5 = -[THWPressableRepGestureTargetHandler widgetInteractionEnabled](-[THWGalleryRep pressableHandler](self, "pressableHandler"), "widgetInteractionEnabled");
    }
    else
    {
      v5 = 1;
    }
    objc_msgSend(a3, "setUserInteractionEnabled:", v5);
  }
}

- (void)pagedCanvasController:(id)a3 customizeLayerHost:(id)a4
{
  id v5;

  if (self->_stageCanvasController == a3)
  {
    v5 = -[THWGalleryRep layout](self, "layout");
    -[THWPagedCanvasController setPageIndex:animated:](self->_stageCanvasController, "setPageIndex:animated:", -[THWGalleryRep currentPage](self, "currentPage"), 0);
    if ((objc_msgSend(v5, "isExpanded") & 1) == 0)
      -[THWPagedCanvasController setupImmediatePressGestureWithSimultaneousGestures:](self->_stageCanvasController, "setupImmediatePressGestureWithSimultaneousGestures:", objc_msgSend(objc_msgSend(objc_msgSend(-[THWGalleryRep interactiveCanvasController](self, "interactiveCanvasController"), "layerHost"), "asiOSCVC"), "panGestureRecognizers"));
    -[THScrollView setHandleNaturally:](-[THWPagedCanvasController scrollView](self->_stageCanvasController, "scrollView"), "setHandleNaturally:", objc_msgSend(objc_msgSend(-[THWGalleryRep interactiveCanvasController](self, "interactiveCanvasController"), "widgetHost"), "widgetHostingShouldAllowNaturalHorizontalScrollForRep:", self));
    -[THWGalleryRep p_updateUserInteractionForController:](self, "p_updateUserInteractionForController:", self->_stageCanvasController);
    -[THWGalleryRep p_updateStageCornerRadius](self, "p_updateStageCornerRadius");
  }
  else if (self->_thumbnailTrackCanvasController == a3)
  {
    objc_msgSend(a3, "setPageIndex:animated:", objc_msgSend(objc_msgSend(-[THWGalleryRep layout](self, "layout"), "thumbnailPageControl"), "currentPage"), 0);
    -[THWPagedCanvasController setupImmediatePressGesture](self->_thumbnailTrackCanvasController, "setupImmediatePressGesture");
    objc_msgSend(objc_msgSend(-[TSDInteractiveCanvasController layerHost](-[THWPagedCanvasController interactiveCanvasController](self->_thumbnailTrackCanvasController, "interactiveCanvasController"), "layerHost"), "canvasLayer"), "setMasksToBounds:", 0);
    -[THScrollView setHandleNaturally:](-[THWPagedCanvasController scrollView](self->_thumbnailTrackCanvasController, "scrollView"), "setHandleNaturally:", objc_msgSend(objc_msgSend(-[THWGalleryRep interactiveCanvasController](self, "interactiveCanvasController"), "widgetHost"), "widgetHostingShouldAllowNaturalHorizontalScrollForRep:", self));
    -[THWGalleryRep p_updateUserInteractionForController:](self, "p_updateUserInteractionForController:", self->_thumbnailTrackCanvasController);
  }
}

- (BOOL)pagedCanvasControllerIsRelatedCanvasScrolling:(id)a3
{
  return objc_msgSend(-[THWGalleryRep interactiveCanvasController](self, "interactiveCanvasController", a3), "currentlyScrolling");
}

- (BOOL)pagedCanvasControllerDeferViewCreation:(id)a3
{
  return objc_msgSend(-[THWGalleryRep interactiveCanvasController](self, "interactiveCanvasController", a3), "currentlyScrolling");
}

- (BOOL)pagedCanvasController:(id)a3 allowsEditMenuForRep:(id)a4
{
  return 0;
}

- (BOOL)pagedCanvasController:(id)a3 shouldBeginEditingTHWPRep:(id)a4 withGesture:(id)a5
{
  return 0;
}

- (BOOL)pagedCanvasController:(id)a3 allowsHyperlinkWithGesture:(id)a4 forRep:(id)a5
{
  return 0;
}

- (BOOL)allowSelectionPopoverForPagedCanvasController:(id)a3
{
  return 0;
}

- (double)pagedCanvasControllerContentsScale:(id)a3
{
  double result;

  objc_msgSend(objc_msgSend(-[THWGalleryRep interactiveCanvasController](self, "interactiveCanvasController", a3), "canvas"), "contentsScale");
  return result;
}

- (double)pagedCanvasController:(id)a3 adjustScale:(double)a4 andFrame:(CGRect *)a5
{
  double Width;
  double v10;
  uint64_t v11;
  double v15;
  CGRect v17;

  if (!a5)
    return a4;
  Width = CGRectGetWidth(*a5);
  if (self->_stageCanvasController == a3)
  {
    objc_msgSend(-[THWGalleryRep layout](self, "layout", Width), "stageFrame");
  }
  else
  {
    v10 = Width;
    if (self->_thumbnailTrackCanvasController != a3)
      goto LABEL_7;
    objc_msgSend(-[THWGalleryRep layout](self, "layout"), "thumbnailTrackFrame");
  }
  v10 = CGRectGetWidth(*(CGRect *)&v11);
LABEL_7:
  if (v10 > 0.0)
  {
    objc_msgSend(objc_msgSend(-[THWGalleryRep interactiveCanvasController](self, "interactiveCanvasController"), "canvas"), "contentsScale");
    v17.origin.x = TSDRoundedRectForScale(a5->origin.x, a5->origin.y, a5->size.width, a5->size.height, v15);
    *a5 = v17;
    return CGRectGetWidth(v17) / v10;
  }
  return a4;
}

- (BOOL)pagedCanvasController:(id)a3 canvasViewShouldBecomeFirstResponder:(id)a4
{
  return 0;
}

- (id)pagedCanvasController:(id)a3 renderedPageIndexSetFromReps:(id)a4
{
  if (self->_stageCanvasController == a3)
    return objc_msgSend(-[THWGalleryRep layout](self, "layout"), "pageIndexesFromStageReps:", a4);
  else
    return 0;
}

- (BOOL)pagedCanvasControllerRestrictVisibleToRenderedContent:(id)a3
{
  return self->_stageCanvasController == a3;
}

- (BOOL)widgetInteractionAllowOnPageForCompact
{
  return 1;
}

- (id)p_itemAtIndex:(unint64_t)a3
{
  id v4;

  v4 = objc_msgSend(-[THWGalleryRep info](self, "info"), "items");
  if ((unint64_t)objc_msgSend(v4, "count") <= a3)
    return 0;
  else
    return objc_msgSend(v4, "objectAtIndex:", a3);
}

- (CALayer)pressableAnimationLayer
{
  return -[UIView layer](-[THWPagedCanvasController view](self->_stageCanvasController, "view"), "layer");
}

- (CALayer)pressableAnimationShadowLayer
{
  return 0;
}

- (int)pressableAction
{
  return 2;
}

- (BOOL)wantsPressAnimation
{
  return -[THWPressableRepGestureTargetHandler widgetInteractionDisabledOnPage](-[THWGalleryRep pressableHandler](self, "pressableHandler"), "widgetInteractionDisabledOnPage");
}

- (BOOL)wantsPressAction
{
  return 1;
}

- (BOOL)shouldRecognizePressOnRep:(id)a3
{
  return 1;
}

- (BOOL)shouldAnimateTargetLayer:(id)a3
{
  return 0;
}

- (id)animationLayer
{
  id result;

  if (!-[THWFreeTransformController isFreeTransformInProgress](-[THWFreeTransformableRepGestureTargetHandler ftc](-[THWGalleryRep freeTransformableHandler](self, "freeTransformableHandler"), "ftc"), "isFreeTransformInProgress"))return -[THWImageCropAnimationController wrapperLayer](self->_imageCropAnimationController, "wrapperLayer");
  result = -[THWFreeTransformController freeTransformLayer](-[THWFreeTransformableRepGestureTargetHandler ftc](-[THWGalleryRep freeTransformableHandler](self, "freeTransformableHandler"), "ftc"), "freeTransformLayer");
  if (!result)
    return -[THWImageCropAnimationController wrapperLayer](self->_imageCropAnimationController, "wrapperLayer");
  return result;
}

- (id)shadowAnimationLayer
{
  if (-[THWFreeTransformController isFreeTransformInProgress](-[THWFreeTransformableRepGestureTargetHandler ftc](-[THWGalleryRep freeTransformableHandler](self, "freeTransformableHandler"), "ftc"), "isFreeTransformInProgress"))
  {
    return -[THWFreeTransformController shadowLayer](-[THWFreeTransformableRepGestureTargetHandler ftc](-[THWGalleryRep freeTransformableHandler](self, "freeTransformableHandler"), "ftc"), "shadowLayer");
  }
  else
  {
    return 0;
  }
}

- (CGAffineTransform)shadowAnimationLayerDestinationTransform:(SEL)a3 uniformTargetScale:(id)a4
{
  __int128 v7;
  THWImageCropAnimationController *imageCropAnimationController;
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
  id v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  uint64_t v34;
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
  unint64_t v46;
  unint64_t v47;
  uint64_t v48;
  double v49;
  double v50;
  double v51;
  double v52;
  __n128 v53;
  double v54;
  __n128 v55;
  double v56;
  CGFloat v57;
  double v58;
  CGFloat v59;
  __n128 v60;
  __n128 v61;
  CGFloat v62;
  double v63;
  CGFloat v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  CGAffineTransform *result;
  id v70;
  __int128 v71;
  __int128 v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  CGAffineTransform v81;
  CGAffineTransform v82;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGAffineTransform v85;

  v7 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&retstr->c = v7;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  imageCropAnimationController = self->_imageCropAnimationController;
  if (imageCropAnimationController)
  {
    -[THWImageCropAnimationController sourceContentsRect](imageCropAnimationController, "sourceContentsRect", a4);
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;
    -[THWImageCropAnimationController targetContentsRect](self->_imageCropAnimationController, "targetContentsRect");
    v75 = v18;
    v77 = v17;
    v20 = v19;
    v22 = v21;
    v23 = objc_msgSend(-[THWGalleryRep shadowAnimationLayer](self, "shadowAnimationLayer"), "bounds");
    v25 = v24;
    v27 = v26;
    v28 = TSDMultiplyRectBySize(v23, v10, v12, v14, v16, v24, v26);
    v73 = v29;
    v74 = v28;
    v31 = v30;
    v79 = v32;
    v80 = v30;
    v33 = v32;
    v35 = TSDMultiplyRectBySize(v34, v77, v75, v20, v22, v25, v27);
    v37 = v36;
    v39 = v38;
    v76 = v40;
    v78 = v38;
    v41 = v40;
    v42 = TSDCenterOfRect(v74, v73, v31, v33);
    v44 = v43;
    v45 = TSDCenterOfRect(v35, v37, v39, v41);
    v47 = v46;
    v49 = TSDRectWithSize(v48);
    v53.n128_f64[0] = TSDCenterOfRect(v49, v50, v51, v52);
    v54 = v53.n128_f64[0];
    v56 = v55.n128_f64[0];
    v57 = TSDSubtractPoints(v53, v55, v42, v44);
    v59 = v58;
    v60.n128_f64[0] = v45;
    v61.n128_u64[0] = v47;
    v62 = TSDSubtractPoints(v60, v61, v54, v56);
    v64 = v63;
    CGAffineTransformMakeTranslation(retstr, v57, v59);
    CGAffineTransformMakeScale(&t2, v78 / v80, v76 / v79);
    v65 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&t1.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&t1.c = v65;
    *(_OWORD *)&t1.tx = *(_OWORD *)&retstr->tx;
    CGAffineTransformConcat(&v85, &t1, &t2);
    v66 = *(_OWORD *)&v85.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v85.a;
    *(_OWORD *)&retstr->c = v66;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v85.tx;
    CGAffineTransformMakeTranslation(&v82, v62, v64);
    v67 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&t1.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&t1.c = v67;
    *(_OWORD *)&t1.tx = *(_OWORD *)&retstr->tx;
    CGAffineTransformConcat(&v85, &t1, &v82);
    v68 = *(_OWORD *)&v85.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v85.a;
    *(_OWORD *)&retstr->c = v68;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v85.tx;
  }
  result = (CGAffineTransform *)self->_freeTransformableHandler;
  if (result)
  {
    v70 = -[CGAffineTransform ftc](result, "ftc", a4);
    if (v70)
      objc_msgSend(v70, "originalShadowTransform");
    else
      memset(&v81, 0, sizeof(v81));
    v71 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&t1.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&t1.c = v71;
    *(_OWORD *)&t1.tx = *(_OWORD *)&retstr->tx;
    result = CGAffineTransformConcat(&v85, &t1, &v81);
    v72 = *(_OWORD *)&v85.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v85.a;
    *(_OWORD *)&retstr->c = v72;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v85.tx;
  }
  return result;
}

- (BOOL)shouldFadeOutAnimationLayer:(id)a3
{
  return 0;
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
  result = (CGAffineTransform *)-[THWFreeTransformController isFreeTransformInProgress](-[THWFreeTransformableRepGestureTargetHandler ftc](-[THWGalleryRep freeTransformableHandler](self, "freeTransformableHandler"), "ftc"), "isFreeTransformInProgress");
  if ((_DWORD)result)
  {
    result = -[THWFreeTransformableRepGestureTargetHandler ftc](-[THWGalleryRep freeTransformableHandler](self, "freeTransformableHandler"), "ftc");
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

- (BOOL)shouldFadeInTargetLayer:(id)a3
{
  return 0;
}

- (id)targetLayer
{
  if (-[THWFreeTransformController isFreeTransformInProgress](-[THWFreeTransformableRepGestureTargetHandler ftc](-[THWGalleryRep freeTransformableHandler](self, "freeTransformableHandler"), "ftc"), "isFreeTransformInProgress")&& !-[THWFreeTransformController passedThreshold](-[THWFreeTransformableRepGestureTargetHandler ftc](-[THWGalleryRep freeTransformableHandler](self, "freeTransformableHandler"), "ftc"), "passedThreshold"))
  {
    return 0;
  }
  else
  {
    return -[THWGalleryRep p_currentImageContentLayer](self, "p_currentImageContentLayer");
  }
}

- (CGRect)ftcTargetFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  if (-[THWFreeTransformController isFreeTransformInProgress](-[THWFreeTransformableRepGestureTargetHandler ftc](-[THWGalleryRep freeTransformableHandler](self, "freeTransformableHandler"), "ftc"), "isFreeTransformInProgress"))
  {
    -[THWFreeTransformController completionTargetRect](-[THWFreeTransformableRepGestureTargetHandler ftc](-[THWGalleryRep freeTransformableHandler](self, "freeTransformableHandler"), "ftc"), "completionTargetRect");
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

- (BOOL)expandableShouldPreloadExpanded
{
  return 1;
}

- (id)hostICC
{
  return objc_msgSend(*(id *)&self->super.TSDContainerRep_opaque[OBJC_IVAR___TSDRep_mCanvas], "canvasController");
}

- (THAnimationController)animationController
{
  THAnimationController *result;
  THAnimationController *v4;

  result = self->_animationController;
  if (!result)
  {
    v4 = objc_alloc_init(THAnimationController);
    self->_animationController = v4;
    -[THAnimationController addObserver:](v4, "addObserver:", self);
    -[THAnimationController setSource:](self->_animationController, "setSource:", self);
    -[THAnimationController setShadowFadeOutDurationScale:](self->_animationController, "setShadowFadeOutDurationScale:", 1.0);
    -[THAnimationController setShadowTransformDurationScale:](self->_animationController, "setShadowTransformDurationScale:", 0.5);
    return self->_animationController;
  }
  return result;
}

- (void)p_setupImageCropAnimationControllerWithDestinationRep:(id)a3
{
  id v5;
  double v6;
  double v7;
  double v8;
  id v9;
  id v10;
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
  THWImageCropAnimationController *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;

  v5 = -[THWGalleryRep p_currentImageContentLayer](self, "p_currentImageContentLayer");
  if (v5 && !self->_imageCropAnimationController)
  {
    v9 = v5;
    v10 = -[THWGalleryRep currentItem](self, "currentItem");
    -[THWGalleryRep p_contentsRectForItem:](self, "p_contentsRectForItem:", v10);
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
    if (a3)
    {
      objc_msgSend(a3, "p_contentsRectForItem:", v10);
      v20 = v19;
      v22 = v21;
      v24 = v23;
      v26 = v25;
    }
    else
    {
      v24 = 1.0;
      v20 = 0.0;
      v22 = 0.0;
      v26 = 1.0;
    }
    v27 = -[THWImageCropAnimationController initWithImageContentLayer:]([THWImageCropAnimationController alloc], "initWithImageContentLayer:", v9);
    self->_imageCropAnimationController = v27;
    -[THWImageCropAnimationController setSourceContentsRect:](v27, "setSourceContentsRect:", v12, v14, v16, v18);
    objc_msgSend(-[THWGalleryRep layout](self, "layout"), "stageCornerRadius");
    v29 = v28;
    objc_msgSend(-[THWGalleryRep canvas](self, "canvas"), "viewScale");
    -[THWImageCropAnimationController setSourceCornerRadius:](self->_imageCropAnimationController, "setSourceCornerRadius:", v29 * v30);
    -[THWImageCropAnimationController setTargetContentsRect:](self->_imageCropAnimationController, "setTargetContentsRect:", v20, v22, v24, v26);
    objc_msgSend(objc_msgSend(a3, "layout"), "stageCornerRadius");
    v32 = v31;
    objc_msgSend(objc_msgSend(a3, "canvas"), "viewScale");
    -[THWImageCropAnimationController setTargetCornerRadius:](self->_imageCropAnimationController, "setTargetCornerRadius:", v32 * v33);
    -[THWImageCropAnimationController setCropDurationScale:](self->_imageCropAnimationController, "setCropDurationScale:", 0.5);
    -[THWImageCropAnimationController setCornerRadiusDurationScale:](self->_imageCropAnimationController, "setCornerRadiusDurationScale:", 0.5);
    -[THWImageCropAnimationController setupWrapperLayer](self->_imageCropAnimationController, "setupWrapperLayer");
  }
  else if (a3)
  {
    objc_msgSend(a3, "p_contentsRectForItem:", -[THWGalleryRep currentItem](self, "currentItem"));
    -[THWImageCropAnimationController setTargetContentsRect:](self->_imageCropAnimationController, "setTargetContentsRect:");
    objc_msgSend(objc_msgSend(a3, "layout"), "stageCornerRadius");
    v7 = v6;
    objc_msgSend(objc_msgSend(a3, "canvas"), "viewScale");
    -[THWImageCropAnimationController setTargetCornerRadius:](self->_imageCropAnimationController, "setTargetCornerRadius:", v7 * v8);
  }
}

- (void)animationControllerSetupTarget:(id)a3
{
  uint64_t v5;
  double v6;
  uint64_t v7;

  v5 = objc_opt_class(THWGalleryRep);
  *(_QWORD *)&v6 = TSUDynamicCast(v5, objc_msgSend(a3, "destination")).n128_u64[0];
  -[THWGalleryRep p_setupImageCropAnimationControllerWithDestinationRep:](self, "p_setupImageCropAnimationControllerWithDestinationRep:", v7, v6);
}

- (void)animationControllerTeardownTarget:(id)a3
{
  if (!-[THWFreeTransformController isFreeTransformInProgress](-[THWFreeTransformableRepGestureTargetHandler ftc](-[THWGalleryRep freeTransformableHandler](self, "freeTransformableHandler", a3), "ftc"), "isFreeTransformInProgress"))
  {
    -[THWImageCropAnimationController teardownWrapperLayer](self->_imageCropAnimationController, "teardownWrapperLayer");

    self->_imageCropAnimationController = 0;
  }
}

- (void)animationControllerDidPresent:(id)a3
{

  self->_animationController = 0;
}

- (void)animationControllerDidAddContentAnimations:(id)a3 uniformTargetScale:(double)a4
{
  THWImageCropAnimationController *imageCropAnimationController;

  imageCropAnimationController = self->_imageCropAnimationController;
  objc_msgSend(a3, "animationDuration");
  -[THWImageCropAnimationController addAnimationWithDuration:targetScale:](imageCropAnimationController, "addAnimationWithDuration:targetScale:");
}

- (void)expandedWillStartWidgetLayoutFrameResize:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  objc_msgSend(objc_msgSend(objc_msgSend(-[THWGalleryRep p_zoomableCanvasControlRepForItemIndex:](self, "p_zoomableCanvasControlRepForItemIndex:", -[THWPagedCanvasController pageIndex](self->_stageCanvasController, "pageIndex")), "zoomableCanvasController"), "interactiveCanvasController"), "viewScale");
  -[THWGalleryRep setResizeOriginalViewScale:](self, "setResizeOriginalViewScale:");
  -[THWGalleryRep setResizeOriginalLayoutFrame:](self, "setResizeOriginalLayoutFrame:", x, y, width, height);
  -[THWPagedCanvasController setPadInfos:](self->_stageCanvasController, "setPadInfos:", 0);
}

- (void)expandedDidEndWidgetLayoutFrameResize
{
  -[THWPagedCanvasController setPadInfos:](self->_stageCanvasController, "setPadInfos:", 1);
}

- (void)expandedWidgetLayoutFrameDidChangeFromFrame:(CGRect)a3 toFrame:(CGRect)a4
{
  double height;
  double width;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;
  double v13;
  double v14;
  id v15;
  id v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;

  height = a4.size.height;
  width = a4.size.width;
  -[THWPagedCanvasController forceStopScrollingAtCurrentPageIndex](self->_stageCanvasController, "forceStopScrollingAtCurrentPageIndex", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y);
  v7 = objc_msgSend(-[THWGalleryRep p_zoomableCanvasControlRepForItemIndex:](self, "p_zoomableCanvasControlRepForItemIndex:", -[THWPagedCanvasController pageIndex](self->_stageCanvasController, "pageIndex")), "zoomableCanvasController");
  objc_msgSend(v7, "setInResize:", 1);
  objc_msgSend(v7, "contentOffsetForAnchor:", 0.5, 0.5);
  v9 = v8;
  v11 = v10;
  v12 = -[THWGalleryRep layout](self, "layout");
  objc_msgSend(v12, "invalidateFrame");
  objc_msgSend(v12, "invalidateChildren");
  objc_msgSend(-[THWGalleryRep interactiveCanvasController](self, "interactiveCanvasController"), "layoutIfNeeded");
  -[THWPagedCanvasController invalidateLayoutsAndFrames](self->_stageCanvasController, "invalidateLayoutsAndFrames");
  -[TSDInteractiveCanvasController layoutIfNeeded](-[THWPagedCanvasController interactiveCanvasController](self->_stageCanvasController, "interactiveCanvasController"), "layoutIfNeeded");
  -[THWPagedCanvasController invalidateLayoutsAndFrames](self->_thumbnailTrackCanvasController, "invalidateLayoutsAndFrames");
  -[TSDInteractiveCanvasController layoutIfNeeded](-[THWPagedCanvasController interactiveCanvasController](self->_thumbnailTrackCanvasController, "interactiveCanvasController"), "layoutIfNeeded");
  if (v7)
  {
    objc_msgSend(objc_msgSend(v7, "interactiveCanvasController"), "layoutIfNeeded");
    objc_msgSend(objc_msgSend(v7, "interactiveCanvasController"), "viewScale");
    v14 = v13;
    v15 = -[THWGalleryRep p_itemAtIndex:](self, "p_itemAtIndex:", -[THWPagedCanvasController pageIndex](self->_stageCanvasController, "pageIndex"));
    if (v15)
    {
      v16 = v15;
      -[THWGalleryRep resizeOriginalViewScale](self, "resizeOriginalViewScale");
      v18 = v17;
      -[THWGalleryRep resizeOriginalLayoutFrame](self, "resizeOriginalLayoutFrame");
      v21 = v18 * THScaleNeededToFitSizeInSize(v19, v20, width, height);
      if (v21 <= 1.5)
        v22 = v21;
      else
        v22 = 1.5;
      objc_msgSend(-[THWGalleryRep layout](self, "layout"), "zoomableItemMinimumViewScaleForItem:", v16);
      if (v23 >= v22)
        v14 = v23;
      else
        v14 = v22;
    }
    objc_msgSend(v7, "setViewScale:contentOffset:anchor:", v14, v9, v11, 0.5, 0.5);
  }
  objc_msgSend(v7, "setInResize:", 0);
}

- (void)expandedWillPresentWithController:(id)a3
{
  self->_expandedRepController = (THWExpandedRepController *)a3;
}

- (id)expandedZoomableInteractiveCanvasController
{
  return objc_msgSend(-[THWGalleryRep p_zoomableCanvasControllerForItemIndex:](self, "p_zoomableCanvasControllerForItemIndex:", -[THWGalleryRep currentPage](self, "currentPage")), "interactiveCanvasController");
}

- (void)didPresentExpanded
{
  -[THWPagedCanvasController setMinimizeInfoChange:](self->_stageCanvasController, "setMinimizeInfoChange:", 0);
  objc_msgSend(objc_msgSend(-[THWGalleryRep p_zoomableCanvasControllerForItemIndex:](self, "p_zoomableCanvasControllerForItemIndex:", -[THWPagedCanvasController pageIndex](self->_stageCanvasController, "pageIndex")), "interactiveCanvasController"), "setShouldSuppressRendering:animated:", 0, 0);
}

- (void)didPresentExpandedPostCommit
{
  -[THWGalleryRep p_updateUserInteractionForController:](self, "p_updateUserInteractionForController:", self->_stageCanvasController);
  -[THWGalleryRep p_updateUserInteractionForController:](self, "p_updateUserInteractionForController:", self->_thumbnailTrackCanvasController);
}

- (int)expandedAppearance
{
  return 0;
}

- (int)expandedAppearanceForPanel:(int)a3
{
  return 0;
}

- (BOOL)expandedAllowFreeTransform
{
  id v2;

  v2 = objc_msgSend(-[THWGalleryRep p_zoomableCanvasControlRepForItemIndex:](self, "p_zoomableCanvasControlRepForItemIndex:", -[THWPagedCanvasController pageIndex](self->_stageCanvasController, "pageIndex")), "zoomableCanvasController");
  if (v2)
    return objc_msgSend(v2, "isZoomedOut");
  else
    return 1;
}

- (id)expandedRotationAnimationController
{
  return -[THWGalleryExpandedRotationController initWithRep:pagedCanvasController:zoomableCanvasController:]([THWGalleryExpandedRotationController alloc], "initWithRep:pagedCanvasController:zoomableCanvasController:", self, self->_stageCanvasController, -[THWGalleryRep p_zoomableCanvasControllerForItem:](self, "p_zoomableCanvasControllerForItem:", -[THWGalleryRep currentItem](self, "currentItem")));
}

- (BOOL)expandedHasContentForPanel:(int)a3
{
  return objc_msgSend(-[THWGalleryRep layout](self, "layout"), "expandedHasContentForPanel:", *(_QWORD *)&a3);
}

- (UIEdgeInsets)expandedStackedControlContainerInsetsForPanel:(int)a3 withDefault:(UIEdgeInsets)a4
{
  CGFloat right;
  double bottom;
  CGFloat left;
  double top;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  UIEdgeInsets result;

  right = a4.right;
  bottom = a4.bottom;
  left = a4.left;
  top = a4.top;
  if (a3 == 2)
  {
    -[THWGalleryRep expandedHasContentForPanel:](self, "expandedHasContentForPanel:", 1);
  }
  else if (a3 == 1)
  {
    if (-[THWGalleryRep expandedHasContentForPanel:](self, "expandedHasContentForPanel:", 2))
    {
      -[THWGalleryRep p_expandedPaddingAfterCaption](self, "p_expandedPaddingAfterCaption");
      bottom = fmax(v9, top) - top;
    }
    if (!objc_msgSend(-[THWGalleryRep layout](self, "layout"), "currentCaptionStorage"))
    {
      bottom = 0.0;
      top = 0.0;
    }
  }
  v10 = top;
  v11 = left;
  v12 = bottom;
  v13 = right;
  result.right = v13;
  result.bottom = v12;
  result.left = v11;
  result.top = v10;
  return result;
}

- (double)expandedMinHeightForPanel:(int)a3 withDefault:(double)result
{
  double v4;
  unsigned __int8 v6;
  id v7;

  v4 = result;
  if (a3 == 1)
  {
    v6 = -[THWGalleryRep expandedHasContentForPanel:](self, "expandedHasContentForPanel:", 2);
    result = 0.0;
    if ((v6 & 1) == 0)
    {
      v7 = objc_msgSend(-[THWGalleryRep layout](self, "layout", 0.0), "currentCaptionStorage");
      result = 0.0;
      if (v7)
        return v4;
    }
  }
  return result;
}

- (BOOL)expandedShouldCombineBottomAndControlPanels
{
  return 1;
}

- (id)expandedLayoutGeometryForLayout:(id)a3 inPanel:(int)a4 withWidth:(double)a5 insets:(UIEdgeInsets)a6
{
  void *v9;
  int *v10;
  double x;
  double y;
  double v13;
  double v14;
  double v15;

  v9 = (void *)TSUProtocolCast(&OBJC_PROTOCOL___THWControl, a3);
  if (v9)
  {
    v10 = (int *)objc_msgSend(v9, "tag");
    if (v10 == &dword_4)
    {
      if ((a4 - 1) <= 1)
      {
        x = CGPointZero.x;
        y = CGPointZero.y;
        v15 = 15.0;
        return objc_msgSend(objc_alloc((Class)TSDLayoutGeometry), "initWithFrame:", x, y, a5, v15);
      }
    }
    else if (v10 == (int *)((char *)&dword_0 + 1) && (a4 - 1) <= 1)
    {
      x = CGPointZero.x;
      y = CGPointZero.y;
      objc_msgSend(-[THWGalleryRep layout](self, "layout"), "thumbnailTrackSizeWithPanelWidth:", a5);
      a5 = v13;
      v15 = v14;
      return objc_msgSend(objc_alloc((Class)TSDLayoutGeometry), "initWithFrame:", x, y, a5, v15);
    }
  }
  return 0;
}

- (unsigned)expandedAlignmentForLayout:(id)a3 inPanel:(int)a4
{
  void *v4;
  void *v5;

  v4 = (void *)TSUProtocolCast(&OBJC_PROTOCOL___THWControl, a3);
  if (v4 && ((v5 = v4, objc_msgSend(v4, "tag") == (char *)&dword_0 + 1) || objc_msgSend(v5, "tag") == &dword_4))
    return 2;
  else
    return 4;
}

- (id)expandedChildInfosForPanel:(int)a3
{
  id v3;

  if (a3 == 1)
  {
    v3 = objc_msgSend(-[THWGalleryRep layout](self, "layout"), "sharedCaptionStorage");
  }
  else
  {
    if (a3)
      return 0;
    v3 = objc_msgSend(objc_msgSend(objc_msgSend(-[THWGalleryRep info](self, "info"), "adornmentInfo"), "title"), "containedStorage");
  }
  if (v3)
    return +[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v3);
  return 0;
}

- (id)expandedAdditionalChildLayoutsForPanel:(int)a3
{
  return objc_msgSend(-[THWGalleryRep layout](self, "layout"), "thumbnailTrackAdditionalLayoutsInExpandedPanel:", *(_QWORD *)&a3);
}

- (void)expandedContentHandleDoubleTapZoomDirectlyAtPoint:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;
  CGPoint v8;
  CGRect v9;

  y = a3.y;
  x = a3.x;
  objc_msgSend(-[THWGalleryRep layout](self, "layout"), "stageFrame");
  v6 = v9.origin.x;
  v7 = v9.origin.y;
  v8.x = x;
  v8.y = y;
  if (CGRectContainsPoint(v9, v8))
    -[THWGalleryRep p_toggleCurrentItemZoomableWithStageRelativeTouch:](self, "p_toggleCurrentItemZoomableWithStageRelativeTouch:", x - v6, y - v7);
}

- (double)expandedLeftRightInsetForTextLayout:(id)a3 inPanel:(int)a4
{
  uint64_t v4;
  uint64_t v5;
  double result;

  if (!a4)
    return 10.0;
  if (a4 != 1)
    return 0.0;
  objc_msgSend(-[THWGalleryRep layout](self, "layout", a3, v4, v5), "expandedLeftRightInsetForCaption");
  return result;
}

- (double)p_expandedPaddingAfterCaption
{
  int v2;
  double result;

  v2 = TSUPhoneUI(self, a2);
  result = 28.0;
  if (v2)
    return 10.0;
  return result;
}

- (double)expandedVerticalPaddingAfterForLayout:(id)a3 inPanel:(int)a4
{
  id v6;
  double result;

  if (a4 != 1)
    return 10.0;
  v6 = objc_msgSend(-[THWGalleryRep layout](self, "layout"), "currentCaptionStorage");
  if (!v6 || objc_msgSend(a3, "info") != v6)
    return 10.0;
  -[THWGalleryRep p_expandedPaddingAfterCaption](self, "p_expandedPaddingAfterCaption");
  return result;
}

- (BOOL)expandedIsRelatedCanvasScrolling
{
  return -[TSDInteractiveCanvasController currentlyScrolling](-[THWPagedCanvasController interactiveCanvasController](self->_stageCanvasController, "interactiveCanvasController"), "currentlyScrolling");
}

- (void)p_togglePanelDescriptionExpanded
{
  -[THWGalleryRep setPanelDescriptionExpanded:](self, "setPanelDescriptionExpanded:", -[THWGalleryRep panelDescriptionExpanded](self, "panelDescriptionExpanded") ^ 1);
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
  v7[2] = sub_13BC1C;
  v7[3] = &unk_426DD0;
  v7[4] = self;
  return -[THWTapGestureAction initWithAction:]([THWTapGestureAction alloc], "initWithAction:", v7);
}

- (unsigned)expandedMaxLineCountForTextLayout:(id)a3 inPanel:(int)a4 withDefault:(unsigned int)a5
{
  id v6;

  if (a4 == 1 && !self->_panelDescriptionExpanded)
  {
    v6 = objc_msgSend(-[THWGalleryRep layout](self, "layout", a3), "layoutController");
    if ((objc_msgSend(v6, "isCompactHeight") & 1) != 0)
    {
      return 2;
    }
    else if (objc_msgSend(v6, "isCompactWidth"))
    {
      return 5;
    }
  }
  return a5;
}

- (void)handleNavigateNextCommand
{
  -[THWGalleryRep p_moveToNextPage](self, "p_moveToNextPage");
}

- (void)handleNavigatePreviousCommand
{
  -[THWGalleryRep p_moveToPreviousPage](self, "p_moveToPreviousPage");
}

- (void)pageControl:(id)a3 didChangeInteractivelyFromPageIndex:(unint64_t)a4 toPageIndex:(unint64_t)a5
{
  id v8;
  id v9;
  unint64_t v10;

  v8 = objc_msgSend(a3, "layout");
  if (v8)
  {
    v9 = v8;
    if (v8 == objc_msgSend(-[THWGalleryRep layout](self, "layout"), "pageControl"))
    {
      v10 = a4 - a5;
      if ((uint64_t)(a4 - a5) < 0)
        v10 = a5 - a4;
      -[THWPagedCanvasController setPageIndex:animated:](self->_stageCanvasController, "setPageIndex:animated:", a5, v10 < 2);
    }
    else if (v9 == objc_msgSend(-[THWGalleryRep layout](self, "layout"), "thumbnailPageControl"))
    {
      -[THWPagedCanvasController setPageIndex:](self->_thumbnailTrackCanvasController, "setPageIndex:", a5);
    }
  }
}

- (__CTFont)pageControlCreateFont:(id)a3
{
  __CTFont *result;

  result = (__CTFont *)objc_msgSend(-[THWGalleryRep layout](self, "layout", a3), "createFontFromCaption");
  if (!result)
    return CTFontCreateWithName(CFSTR("LucidaGrande"), 0.0, 0);
  return result;
}

- (id)pageControlTextColor:(id)a3
{
  id result;

  result = objc_msgSend(-[THWGalleryRep layout](self, "layout", a3), "colorFromCaption");
  if (!result)
    return +[TSUColor colorWithWhite:alpha:](TSUColor, "colorWithWhite:alpha:", 0.0980392173, 1.0);
  return result;
}

- (id)pageControl:(id)a3 layerForState:(int)a4
{
  return -[THWGalleryRep pageControl:layerForState:pageIndex:](self, "pageControl:layerForState:pageIndex:", a3, *(_QWORD *)&a4, 0);
}

- (id)pageControl:(id)a3 layerForState:(int)a4 pageIndex:(unint64_t)a5
{
  id v7;
  unsigned int v8;
  id v9;
  double v10;
  id v11;

  if ((char *)objc_msgSend(objc_msgSend(a3, "layout"), "tag") - 3 > (_BYTE *)&dword_0 + 1)
    return 0;
  v7 = objc_msgSend(-[THWGalleryRep layout](self, "layout"), "colorFromCaption");
  v8 = objc_msgSend(-[THWGalleryRep layout](self, "layout"), "isExpanded");
  if (v8)
  {
    v9 = +[TSUColor whiteColor](TSUColor, "whiteColor");
  }
  else
  {
    if (v7)
      goto LABEL_7;
    v9 = +[TSUColor blackColor](TSUColor, "blackColor");
  }
  v7 = v9;
LABEL_7:
  if (a4 == 1)
  {
    v10 = 0.8;
    if (!v8)
      v10 = 1.0;
  }
  else
  {
    if (a4)
      return 0;
    v10 = 0.3;
    if (v8)
      v10 = 0.4;
  }
  v11 = objc_msgSend(v7, "colorWithAlphaComponent:", v10);
  if (v11)
    return +[THWPageControlRep dotLayerUsingColor:diameter:](THWPageControlRep, "dotLayerUsingColor:diameter:", v11, 7.0);
  return 0;
}

- (BOOL)isExpanded
{
  return objc_msgSend(-[THWGalleryRep layout](self, "layout"), "isExpanded");
}

- (BOOL)meetsStageDimensionRequirementForExpanded
{
  double v2;
  double v3;

  objc_msgSend(-[THWGalleryRep layout](self, "layout"), "stageFrame");
  return v3 < 660.0 || v2 < 960.0;
}

- (BOOL)isFreeTransformInProgress
{
  return -[THWFreeTransformController isFreeTransformInProgress](-[THWFreeTransformableRepGestureTargetHandler ftc](-[THWGalleryRep freeTransformableHandler](self, "freeTransformableHandler"), "ftc"), "isFreeTransformInProgress");
}

- (void)p_updateToPageIndex:(unint64_t)a3 usingCachedImagedFromRep:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;

  objc_msgSend(objc_msgSend(-[THWGalleryRep layout](self, "layout"), "pageControl"), "setCurrentPage:", a3);
  if (self->_stageCanvasController)
  {
    v7 = -[THWGalleryRep p_itemAtIndex:](self, "p_itemAtIndex:", a3);
    -[THWPagedCanvasController setPadInfos:](self->_stageCanvasController, "setPadInfos:", 0);
    -[THWPagedCanvasController setPageIndex:animated:](self->_stageCanvasController, "setPageIndex:animated:", a3, 0);
    -[TSDInteractiveCanvasController setShouldSuppressRendering:animated:](-[THWPagedCanvasController interactiveCanvasController](self->_stageCanvasController, "interactiveCanvasController"), "setShouldSuppressRendering:animated:", 1, 0);
    -[TSDInteractiveCanvasController layoutIfNeeded](-[THWPagedCanvasController interactiveCanvasController](self->_stageCanvasController, "interactiveCanvasController"), "layoutIfNeeded");
    v8 = -[THWGalleryRep p_imageRepForItem:](self, "p_imageRepForItem:", v7);
    v9 = objc_msgSend(a4, "p_imageRepForItem:", v7);
    if (v8)
    {
      if (v9)
      {
        v10 = objc_msgSend(v9, "newCachedSizedImage");
        if (v10)
        {
          v11 = v10;
          objc_msgSend(v8, "useCachedSizedImage:", v10);
          objc_msgSend(v8, "generateSizedImageOnBackgroundThread");

        }
      }
    }
    -[TSDInteractiveCanvasController setShouldSuppressRendering:animated:](-[THWPagedCanvasController interactiveCanvasController](self->_stageCanvasController, "interactiveCanvasController"), "setShouldSuppressRendering:animated:", 0, 0);
    -[TSDInteractiveCanvasController layoutIfNeeded](-[THWPagedCanvasController interactiveCanvasController](self->_stageCanvasController, "interactiveCanvasController"), "layoutIfNeeded");
  }
  else
  {
    self->_currentPage = a3;
  }
  objc_msgSend(-[THWGalleryRep interactiveCanvasController](self, "interactiveCanvasController"), "layoutIfNeeded");
}

- (void)freeTransformWillBegin
{
  uint64_t v3;
  double v4;
  void *v5;
  void *v6;

  objc_msgSend(-[THWGalleryRep p_currentImageRep](self, "p_currentImageRep"), "pauseLayerUpdates");
  v3 = objc_opt_class(THWGalleryRep);
  *(_QWORD *)&v4 = TSUDynamicCast(v3, -[THWExpandedRepController expandedRepSourceRep](self->_expandedRepController, "expandedRepSourceRep")).n128_u64[0];
  v6 = v5;
  objc_msgSend(v5, "p_updateToPageIndex:usingCachedImagedFromRep:", -[THWPagedCanvasController pageIndex](-[THWGalleryRep stageCanvasController](self, "stageCanvasController", v4), "pageIndex"), self);
  -[THWGalleryRep p_setupImageCropAnimationControllerWithDestinationRep:](self, "p_setupImageCropAnimationControllerWithDestinationRep:", v6);
}

- (id)shadowPath
{
  if (objc_msgSend(-[THWGalleryRep currentItem](self, "currentItem"), "isOpaque"))
    return -[THWImageCropAnimationController sourceShadowPath](self->_imageCropAnimationController, "sourceShadowPath");
  else
    return 0;
}

- (BOOL)freeTransformUseTracedShadowPath
{
  return objc_msgSend(-[THWGalleryRep currentItem](self, "currentItem"), "isOpaque") ^ 1;
}

- (void)freeTransformDidEnd
{
  -[THWPagedCanvasController setPadInfos:](self->_stageCanvasController, "setPadInfos:", 1);
  -[THWImageCropAnimationController teardownWrapperLayer](self->_imageCropAnimationController, "teardownWrapperLayer");

  self->_imageCropAnimationController = 0;
  objc_msgSend(-[THWGalleryRep p_currentImageRep](self, "p_currentImageRep"), "resumeLayerUpdatesAndLayoutImmediately");
}

- (CGRect)rectForCompletion
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  objc_msgSend(objc_msgSend(-[THWGalleryRep p_currentImageRep](self, "p_currentImageRep"), "layout"), "frameInParent");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (BOOL)canHandleGesture:(id)a3
{
  _BOOL4 v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  CGPoint v11;
  CGRect v12;

  if (-[THWFreeTransformableRepGestureTargetHandler canHandleGesture:](-[THWGalleryRep freeTransformableHandler](self, "freeTransformableHandler"), "canHandleGesture:", a3))
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    objc_msgSend(a3, "naturalLocationForRep:", self);
    v7 = v6;
    v9 = v8;
    objc_msgSend(-[THWGalleryRep layout](self, "layout"), "stageFrame");
    v11.x = v7;
    v11.y = v9;
    v5 = CGRectContainsPoint(v12, v11);
    if (v5)
      LOBYTE(v5) = -[THWPressableRepGestureTargetHandler canHandleGesture:](self->_pressableHandler, "canHandleGesture:", a3);
  }
  return v5;
}

- (BOOL)handleGesture:(id)a3
{
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  CGPoint v10;
  CGRect v11;

  objc_msgSend(a3, "naturalLocationForRep:", self);
  v6 = v5;
  v8 = v7;
  objc_msgSend(-[THWGalleryRep layout](self, "layout"), "stageFrame");
  v10.x = v6;
  v10.y = v8;
  if (CGRectContainsPoint(v11, v10)
    && -[THWPressableRepGestureTargetHandler handleGesture:](self->_pressableHandler, "handleGesture:", a3))
  {
    return 1;
  }
  else
  {
    return -[THWFreeTransformableRepGestureTargetHandler handleGesture:](-[THWGalleryRep freeTransformableHandler](self, "freeTransformableHandler"), "handleGesture:", a3);
  }
}

- (void)willBeginHandlingGesture:(id)a3
{
  id v5;

  v5 = objc_msgSend(a3, "gestureKind");
  if (v5 == (id)TSDFreeTransform)
    -[THWFreeTransformableRepGestureTargetHandler willBeginHandlingGesture:](-[THWGalleryRep freeTransformableHandler](self, "freeTransformableHandler"), "willBeginHandlingGesture:", a3);
}

- (void)buttonControlWasPressed:(id)a3
{
  id v4;

  v4 = objc_msgSend(a3, "layout");
  if (objc_msgSend(v4, "tag") == (char *)&dword_4 + 1)
    -[THWGalleryRep p_goToPage:](self, "p_goToPage:", objc_msgSend(v4, "index"));
}

- (id)buttonControl:(id)a3 imageForState:(int)a4 highlighted:(BOOL)a5
{
  id v6;
  id v7;

  v6 = objc_msgSend(a3, "layout");
  if (objc_msgSend(v6, "tag") == (char *)&dword_4 + 1
    && (v7 = objc_msgSend(-[THWGalleryRep p_itemAtIndex:](self, "p_itemAtIndex:", objc_msgSend(v6, "index")), "thumbnailImageData")) != 0)
  {
    return +[TSDBitmapImageProvider TSUImageForImageData:](TSDBitmapImageProvider, "TSUImageForImageData:", v7);
  }
  else
  {
    return 0;
  }
}

- (void)buttonControl:(id)a3 didUpdateLayer:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  id v10;
  void *v11;
  double v12;

  v6 = objc_msgSend(a3, "layout");
  if (objc_msgSend(v6, "tag") == (char *)&dword_4 + 1)
  {
    v7 = objc_msgSend(objc_msgSend(-[THWGalleryRep layout](self, "layout"), "pageControl"), "currentPage");
    if (v7 == objc_msgSend(v6, "index"))
    {
      objc_msgSend(a4, "setBorderWidth:", 0.0);
      objc_msgSend(a4, "bounds");
      v10 = -[THWGalleryRep p_highlightLayerForThumbnailSize:](self, "p_highlightLayerForThumbnailSize:", v8, v9);
      v11 = v10;
      if (v10)
      {
        if (objc_msgSend(v10, "superlayer") != a4)
        {
          objc_msgSend(v11, "removeFromSuperlayer");
          objc_msgSend(a4, "addSublayer:", v11);
        }
      }
      -[THWGalleryRep p_integralScaledThumbnailHighlightWidth](self, "p_integralScaledThumbnailHighlightWidth");
      objc_msgSend(v11, "setPosition:", -v12, -v12);
    }
    else
    {
      objc_msgSend(a4, "setBorderColor:", objc_msgSend(objc_msgSend(-[THWGalleryRep layout](self, "layout"), "thumbnailBorderColor"), "CGColor"));
      objc_msgSend(a4, "setBorderWidth:", 1.0);
    }
  }
}

- (BOOL)buttonControlAdjustImageWhenHighlighted:(id)a3
{
  return 1;
}

- (void)buttonControlInteractionWillStart:(id)a3
{
  id v4;

  v4 = objc_msgSend(a3, "layout");
  if (objc_msgSend(v4, "tag") == (char *)&dword_4 + 1)
  {
    -[TSDInteractiveCanvasController setStaticLayoutAndRenderOnThread:](-[THWPagedCanvasController interactiveCanvasController](self->_stageCanvasController, "interactiveCanvasController"), "setStaticLayoutAndRenderOnThread:", 1);
    -[THWPagedCanvasController setPreloadPageIndex:](self->_stageCanvasController, "setPreloadPageIndex:", objc_msgSend(v4, "index"));
  }
}

- (void)buttonControlInteractionDidEnd:(id)a3
{
  if (objc_msgSend(objc_msgSend(a3, "layout"), "tag") == (char *)&dword_4 + 1)
  {
    -[TSDInteractiveCanvasController setStaticLayoutAndRenderOnThread:](-[THWPagedCanvasController interactiveCanvasController](self->_stageCanvasController, "interactiveCanvasController"), "setStaticLayoutAndRenderOnThread:", 0);
    -[THWPagedCanvasController setPreloadPageIndex:](self->_stageCanvasController, "setPreloadPageIndex:", 0x7FFFFFFFFFFFFFFFLL);
    if ((-[TSDInteractiveCanvasController currentlyScrolling](-[THWPagedCanvasController interactiveCanvasController](self->_stageCanvasController, "interactiveCanvasController"), "currentlyScrolling") & 1) == 0&& (-[TSDInteractiveCanvasController currentlyScrolling](-[THWPagedCanvasController interactiveCanvasController](self->_thumbnailTrackCanvasController, "interactiveCanvasController"), "currentlyScrolling") & 1) == 0)
    {
      -[THWGalleryRep pagedCanvasController:didScrollToPageIndex:](self, "pagedCanvasController:didScrollToPageIndex:", self->_stageCanvasController, -[THWPagedCanvasController pageIndex](self->_stageCanvasController, "pageIndex"));
    }
  }
}

- (void)willReplaceContentsFromRep:(id)a3
{
  uint64_t v5;
  void *v6;
  double v7;
  id v8;
  THWPagedCanvasController *stageCanvasController;

  v5 = objc_opt_class(THWGalleryRep);
  *(_QWORD *)&v7 = TSUDynamicCast(v5, a3).n128_u64[0];
  if (v6)
  {
    v8 = objc_msgSend(objc_msgSend(v6, "stageCanvasController", v7), "pageIndex");
    objc_msgSend(objc_msgSend(-[THWGalleryRep layout](self, "layout"), "pageControl"), "setCurrentPage:", v8);
    stageCanvasController = self->_stageCanvasController;
    if (stageCanvasController)
    {
      -[THWPagedCanvasController setPageIndex:animated:](stageCanvasController, "setPageIndex:animated:", v8, 0);
      -[TSDInteractiveCanvasController layoutIfNeeded](-[THWPagedCanvasController interactiveCanvasController](self->_stageCanvasController, "interactiveCanvasController"), "layoutIfNeeded");
    }
    else
    {
      self->_currentPage = (unint64_t)v8;
    }
  }
}

- (void)replaceContentsFromRep:(id)a3
{
  -[THWPagedCanvasController setPadInfos:](self->_stageCanvasController, "setPadInfos:", 1);
}

- (CGSize)sizeOfCanvasForZoomableCanvasController:(id)a3
{
  double v3;
  double v4;
  CGSize result;

  objc_msgSend(-[THWGalleryRep layout](self, "layout"), "zoomableCanvasSizeForItem:", -[THWGalleryRep p_itemForZoomableCanvasController:](self, "p_itemForZoomableCanvasController:", a3));
  result.height = v4;
  result.width = v3;
  return result;
}

- (id)zoomableCanvasController:(id)a3 infosToDisplayForViewport:(CGRect)a4
{
  id result;

  result = objc_msgSend(-[THWGalleryRep p_itemForZoomableCanvasController:](self, "p_itemForZoomableCanvasController:", a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height), "imageInfo");
  if (result)
    return +[NSArray arrayWithObject:](NSArray, "arrayWithObject:", result);
  return result;
}

- (id)infosToDisplayForContainerInZoomableCanvasController:(id)a3
{
  return +[NSArray array](NSArray, "array", a3);
}

- (BOOL)zoomableCanvasController:(id)a3 allowsEditMenuForRep:(id)a4
{
  return 0;
}

- (double)zoomableCanvasControllerContentsScale:(id)a3
{
  double result;

  objc_msgSend(-[THWGalleryRep canvas](self, "canvas", a3), "contentsScale");
  return result;
}

- (void)zoomableCanvasControllerCustomizeLayerHost:(id)a3
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

  v5 = -[THWGalleryRep p_itemForZoomableCanvasController:](self, "p_itemForZoomableCanvasController:");
  objc_msgSend(-[THWGalleryRep layout](self, "layout"), "zoomableItemMinimumViewScaleForItem:", v5);
  v7 = v6;
  objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(a3, "interactiveCanvasController"), "layerHost"), "canvasLayer"), "unscaledSize");
  v8 = TSDRectWithSize(-[THWGalleryRep p_updateMinMaxViewScaleForItem:forceMinScale:](self, "p_updateMinMaxViewScaleForItem:forceMinScale:", v5, 0));
  v12 = TSDCenterOfRect(v8, v9, v10, v11);
  objc_msgSend(a3, "setViewScale:contentOffset:anchor:", v7, v12, v13, 0.5, 0.5);
}

- (BOOL)zoomableCanvasControllerIsRelatedCanvasScrolling:(id)a3
{
  return -[TSDInteractiveCanvasController currentlyScrolling](-[THWPagedCanvasController interactiveCanvasController](self->_stageCanvasController, "interactiveCanvasController", a3), "currentlyScrolling");
}

- (unint64_t)p_itemIndexForZoomableCanvasController:(id)a3
{
  uint64_t v4;
  double v5;
  id v6;

  v4 = objc_opt_class(NSNumber);
  *(_QWORD *)&v5 = TSUDynamicCast(v4, objc_msgSend(a3, "instanceData")).n128_u64[0];
  return (unint64_t)objc_msgSend(v6, "unsignedIntegerValue", v5);
}

- (id)p_itemForZoomableCanvasController:(id)a3
{
  return objc_msgSend(-[THWGalleryRep info](self, "info"), "itemAtIndex:", -[THWGalleryRep p_itemIndexForZoomableCanvasController:](self, "p_itemIndexForZoomableCanvasController:", a3));
}

- (void)p_updateMinMaxViewScaleForItem:(id)a3 forceMinScale:(BOOL)a4
{
  _BOOL4 v4;
  double v7;
  double v8;
  id v9;
  id v10;

  v4 = a4;
  objc_msgSend(-[THWGalleryRep layout](self, "layout"), "zoomableItemMinimumViewScaleForItem:", a3);
  v8 = v7;
  v9 = -[THWGalleryRep p_zoomableCanvasControllerForItem:](self, "p_zoomableCanvasControllerForItem:", a3);
  v10 = objc_msgSend(objc_msgSend(objc_msgSend(v9, "interactiveCanvasController"), "layerHost"), "canvasLayer");
  objc_msgSend(v10, "setMinimumPinchViewScale:", v8);
  objc_msgSend(v10, "setMaximumPinchViewScale:", fmax(v8, 1.5));
  objc_msgSend(v10, "setAllowsPinchZoom:", 1);
  if (v4)
    objc_msgSend(objc_msgSend(v9, "interactiveCanvasController"), "setViewScale:", v8);
}

- (void)p_toggleCurrentItemZoomableWithStageRelativeTouch:(CGPoint)a3
{
  double y;
  double x;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  double v11;
  double v12;
  id v13;
  double v14;
  double v15;
  uint64_t v16;
  int v17;
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

  y = a3.y;
  x = a3.x;
  v6 = -[THWGalleryRep currentItem](self, "currentItem");
  if (v6)
  {
    v7 = v6;
    v8 = -[THWGalleryRep p_zoomableCanvasControllerForItem:](self, "p_zoomableCanvasControllerForItem:", v6);
    v9 = objc_msgSend(v8, "interactiveCanvasController");
    v10 = -[THWGalleryRep layout](self, "layout");
    objc_msgSend(v9, "viewScale");
    v12 = v11;
    v13 = objc_msgSend(v10, "zoomableItemMinimumViewScaleForItem:", v7);
    v15 = v14;
    v17 = TSUPhoneUI(v13, v16);
    v18 = 1.5;
    v19 = 1.0;
    if (!v17)
      v19 = 1.5;
    if (v15 >= v19)
      v19 = v15;
    v20 = vabdd_f64(v19, v15);
    if (v19 + v19 <= 1.5)
      v18 = v19 + v19;
    if (v20 >= 0.00999999978)
      v21 = v19;
    else
      v21 = v18;
    objc_msgSend(v9, "contentOffset");
    v23 = x / v12 + v22;
    v25 = y / v12 + v24;
    if (v12 >= (v15 + v21) * 0.5)
      v26 = v15;
    else
      v26 = v21;
    objc_msgSend(objc_msgSend(v8, "scrollView"), "bounds");
    objc_msgSend(v9, "setViewScale:contentOffset:clampOffset:animated:", 1, 1, v26, v23 - v27 * 0.5 / v26, v25 - v28 * 0.5 / v26);
  }
}

- (id)p_currentImageRep
{
  return -[THWGalleryRep p_imageRepForItem:](self, "p_imageRepForItem:", -[THWGalleryRep p_itemAtIndex:](self, "p_itemAtIndex:", objc_msgSend(objc_msgSend(-[THWGalleryRep layout](self, "layout"), "pageControl"), "currentPage")));
}

- (id)p_imageRepForItem:(id)a3
{
  TSDInteractiveCanvasController *v5;
  id v6;
  id v7;
  uint64_t v8;
  id result;

  v5 = -[THWPagedCanvasController interactiveCanvasController](self->_stageCanvasController, "interactiveCanvasController");
  v6 = objc_msgSend(-[TSDInteractiveCanvasController layoutController](v5, "layoutController"), "layoutForInfo:", objc_msgSend(a3, "imageInfo"));
  if (!v6)
  {
    if (!-[THWGalleryRep p_supportZoom](self, "p_supportZoom"))
      return 0;
    v5 = (TSDInteractiveCanvasController *)objc_msgSend(-[THWGalleryRep p_zoomableCanvasControllerForItem:](self, "p_zoomableCanvasControllerForItem:", a3), "interactiveCanvasController");
    v6 = objc_msgSend(-[TSDInteractiveCanvasController layoutController](v5, "layoutController"), "layoutForInfo:", objc_msgSend(a3, "imageInfo"));
    if (!v6)
      return 0;
  }
  v7 = v6;
  v8 = objc_opt_class(TSDImageRep);
  TSUDynamicCast(v8, objc_msgSend(-[TSDInteractiveCanvasController canvas](v5, "canvas"), "repForLayout:", v7));
  return result;
}

- (id)p_layerForItem:(id)a3
{
  id v3;

  v3 = -[THWGalleryRep p_imageRepForItem:](self, "p_imageRepForItem:", a3);
  return objc_msgSend(objc_msgSend(v3, "interactiveCanvasController"), "layerForRep:", v3);
}

- (id)p_currentImageContentLayer
{
  return objc_msgSend(-[THWGalleryRep p_currentImageRep](self, "p_currentImageRep"), "contentsLayer");
}

- (CGRect)p_contentsRectForItem:(id)a3
{
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
  double v15;
  CGRect result;

  if (a3)
  {
    if ((objc_msgSend(-[THWGalleryRep layout](self, "layout"), "isExpanded") & 1) != 0)
    {
      v4 = 1.0;
      v5 = 0.0;
      v6 = 0.0;
      v7 = 1.0;
    }
    else
    {
      objc_msgSend(objc_msgSend(a3, "imageInfo"), "naturalSize");
      v9 = v8;
      v11 = v10;
      objc_msgSend(a3, "cropRect");
      v5 = v12 / v9;
      v6 = v13 / v11;
      v4 = v14 / v9;
      v7 = v15 / v11;
    }
  }
  else
  {
    v4 = 1.0;
    v5 = 0.0;
    v6 = 0.0;
    v7 = 1.0;
  }
  result.size.height = v7;
  result.size.width = v4;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (id)p_zoomableCanvasControlRepForItemIndex:(unint64_t)a3
{
  uint64_t v5;
  id result;

  v5 = objc_opt_class(THWZoomableCanvasControlRep);
  TSUDynamicCast(v5, -[TSDInteractiveCanvasController repForLayout:](-[THWPagedCanvasController interactiveCanvasController](self->_stageCanvasController, "interactiveCanvasController"), "repForLayout:", objc_msgSend(-[THWGalleryRep layout](self, "layout"), "zoomableCanvasControlLayoutForItemIndex:", a3)));
  return result;
}

- (id)p_zoomableCanvasControllerForItemIndex:(unint64_t)a3
{
  return objc_msgSend(-[THWGalleryRep p_zoomableCanvasControlRepForItemIndex:](self, "p_zoomableCanvasControlRepForItemIndex:", a3), "zoomableCanvasController");
}

- (id)p_zoomableCanvasControllerForItem:(id)a3
{
  return objc_msgSend(-[THWGalleryRep p_zoomableCanvasControlRepForItemIndex:](self, "p_zoomableCanvasControlRepForItemIndex:", objc_msgSend(-[THWGalleryRep info](self, "info"), "indexOfItem:", a3)), "zoomableCanvasController");
}

- (void)p_resetViewScaleForItemsExcept:(id)a3
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  if (-[THWGalleryRep p_supportZoom](self, "p_supportZoom"))
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v5 = objc_msgSend(-[THWGalleryRep info](self, "info", 0), "items");
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v5);
          v10 = *(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v9);
          if (v10 != a3)
            -[THWGalleryRep p_updateMinMaxViewScaleForItem:forceMinScale:](self, "p_updateMinMaxViewScaleForItem:forceMinScale:", v10, 1);
          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v7);
    }
  }
}

- (BOOL)p_shouldSuppressRenderingDuringExpansion
{
  _BOOL8 v3;
  uint64_t v4;

  LODWORD(v3) = -[THWGalleryRep p_isExpanding](self, "p_isExpanding");
  if (v3)
  {
    v4 = objc_opt_class(THWGalleryRep);
    TSUDynamicCast(v4, -[THWExpandedRepController expandedRepSourceRep](self->_expandedRepController, "expandedRepSourceRep"));
    LOBYTE(v3) = v3;
  }
  return v3;
}

- (BOOL)p_isExpanding
{
  THWExpandedRepController *expandedRepController;

  expandedRepController = self->_expandedRepController;
  if (expandedRepController)
    LOBYTE(expandedRepController) = -[THWExpandedRepController expandedRepControllerState](expandedRepController, "expandedRepControllerState") == 1;
  return (char)expandedRepController;
}

- (void)p_relaxMinimizeInfosNextFrame
{
  THWExpandedRepController *expandedRepController;
  _QWORD v4[5];

  expandedRepController = self->_expandedRepController;
  if (!expandedRepController
    || -[THWExpandedRepController expandedRepControllerState](expandedRepController, "expandedRepControllerState") == 2)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_13CF38;
    v4[3] = &unk_426DD0;
    v4[4] = self;
    objc_msgSend(-[THWGalleryRep interactiveCanvasController](self, "interactiveCanvasController"), "performBlockNextFrame:", v4);
  }
}

- (id)currentItem
{
  return -[THWGalleryRep p_itemAtIndex:](self, "p_itemAtIndex:", -[THWPagedCanvasController pageIndex](self->_stageCanvasController, "pageIndex"));
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

- (THWPagedCanvasController)stageCanvasController
{
  return self->_stageCanvasController;
}

- (THWPagedCanvasController)thumbnailTrackCanvasController
{
  return self->_thumbnailTrackCanvasController;
}

- (THWPressableRepGestureTargetHandler)pressableHandler
{
  return self->_pressableHandler;
}

- (BCProgressTrackingRepTracker)progressTracker
{
  return self->_progressTracker;
}

- (NSMutableSet)progressSet
{
  return self->_progressSet;
}

- (void)setProgressSet:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 352);
}

- (THWExpandedRepController)expandedRepController
{
  return self->_expandedRepController;
}

- (THWImageCropAnimationController)imageCropAnimationController
{
  return self->_imageCropAnimationController;
}

- (double)resizeOriginalViewScale
{
  return self->_resizeOriginalViewScale;
}

- (void)setResizeOriginalViewScale:(double)a3
{
  self->_resizeOriginalViewScale = a3;
}

- (CGRect)resizeOriginalLayoutFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_resizeOriginalLayoutFrame.origin.x;
  y = self->_resizeOriginalLayoutFrame.origin.y;
  width = self->_resizeOriginalLayoutFrame.size.width;
  height = self->_resizeOriginalLayoutFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setResizeOriginalLayoutFrame:(CGRect)a3
{
  self->_resizeOriginalLayoutFrame = a3;
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
