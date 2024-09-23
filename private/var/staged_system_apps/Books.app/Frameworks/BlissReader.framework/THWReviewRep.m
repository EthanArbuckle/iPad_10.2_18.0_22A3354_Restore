@implementation THWReviewRep

- (THWReviewRep)initWithLayout:(id)a3 canvas:(id)a4
{
  THWReviewRep *v4;
  id v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)THWReviewRep;
  v4 = -[THWReviewRep initWithLayout:canvas:](&v7, "initWithLayout:canvas:", a3, a4);
  if (v4)
  {
    v4->_scrollableCanvasControllers = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v4->_cachedImages = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    if (-[THWReviewRep isExpanded](v4, "isExpanded"))
      v5 = objc_msgSend(-[THWReviewRep hostICC](v4, "hostICC"), "delegate");
    else
      v5 = -[THWReviewRep interactiveCanvasController](v4, "interactiveCanvasController");
    v4->_progressTracker = (BCProgressTrackingRepTracker *)TSUProtocolCast(&OBJC_PROTOCOL___BCProgressTrackingRepTracker, v5);
    v4->_tracksScore = 1;
    if (objc_msgSend(objc_msgSend(-[THWReviewRep hostICC](v4, "hostICC"), "widgetHost"), "freeTransformRepHandler"))
      v4->_freeTransformableHandler = -[THWFreeTransformableRepGestureTargetHandler initWithFreeTransformableRep:handler:]([THWFreeTransformableRepGestureTargetHandler alloc], "initWithFreeTransformableRep:handler:", v4, objc_msgSend(objc_msgSend(-[THWReviewRep hostICC](v4, "hostICC"), "widgetHost"), "freeTransformRepHandler"));
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_scrollableCanvasControllers, "enumerateKeysAndObjectsUsingBlock:", &stru_42A3C0);

  v3.receiver = self;
  v3.super_class = (Class)THWReviewRep;
  -[THWReviewRep dealloc](&v3, "dealloc");
}

- (THWPressableRepGestureTargetHandler)pressableHandler
{
  uint64_t v3;
  double v4;
  id v5;
  id v6;
  THWPressableRepGestureTargetHandler *v7;

  if (!self->_pressableHandler)
  {
    v3 = objc_opt_class(THInteractiveCanvasController);
    *(_QWORD *)&v4 = TSUDynamicCast(v3, -[THWReviewRep interactiveCanvasController](self, "interactiveCanvasController")).n128_u64[0];
    v6 = objc_msgSend(v5, "pressHandlerForPressableReps", v4);
    if (v6)
    {
      v7 = -[THWPressableRepGestureTargetHandler initWithPressableRep:pressHandler:]([THWPressableRepGestureTargetHandler alloc], "initWithPressableRep:pressHandler:", self, v6);
      self->_pressableHandler = v7;
      -[THWPressableRepGestureTargetHandler setEnabledOnlyIfWidgetInteractionDisabledOnPage:](v7, "setEnabledOnlyIfWidgetInteractionDisabledOnPage:", 1);
    }
  }
  return self->_pressableHandler;
}

- (void)willReplaceContentsFromRep:(id)a3
{
  uint64_t v5;
  void *v6;
  double v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)THWReviewRep;
  -[THWReviewRep willReplaceContentsFromRep:](&v9, "willReplaceContentsFromRep:");
  v5 = objc_opt_class(THWReviewRep);
  *(_QWORD *)&v7 = TSUDynamicCast(v5, a3).n128_u64[0];
  if (v6)
  {
    v8 = v6;
    if (objc_msgSend(v6, "isExpanded", v7))
    {
      -[THWReviewRep p_updateQuestionIndex:animate:](self, "p_updateQuestionIndex:animate:", objc_msgSend(objc_msgSend(v8, "layout"), "questionIndex"), 0);
      -[THWPagedCanvasController setPageIndex:animated:](self->_stageCanvasController, "setPageIndex:animated:", objc_msgSend(-[THWReviewRep layout](self, "layout"), "questionIndex"), 0);
      -[THWReviewRep p_refreshQuestions](self, "p_refreshQuestions");
    }
  }
}

- (void)updateFromLayout
{
  unsigned __int8 v3;
  char v4;
  char v5;
  CAShapeLayer *v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  double v17;
  uint64_t v18;
  id v19;
  double x;
  double y;
  double width;
  double height;
  double v24;
  double v25;
  double v26;
  double v27;
  float64x2_t v28;
  CGAffineTransform v29;
  CGAffineTransform v30;
  CGAffineTransform v31;
  objc_super v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;

  v32.receiver = self;
  v32.super_class = (Class)THWReviewRep;
  -[THWReviewRep updateFromLayout](&v32, "updateFromLayout");
  v3 = objc_msgSend(-[THWReviewRep layout](self, "layout"), "isExpanded");
  v4 = v3;
  if (!self->_stageFillLayer && (v3 & 1) == 0)
  {
    self->_stageFillLayer = (CALayer *)objc_alloc_init((Class)TSDNoDefaultImplicitActionLayer);
    -[CALayer setBackgroundColor:](self->_stageFillLayer, "setBackgroundColor:", objc_msgSend(+[TSUColor whiteColor](TSUColor, "whiteColor"), "CGColor"));
    -[CALayer setOpaque:](self->_stageFillLayer, "setOpaque:", 1);
    -[CALayer setDelegate:](self->_stageFillLayer, "setDelegate:", -[THWReviewRep interactiveCanvasController](self, "interactiveCanvasController"));
  }
  if (self->_stageStrokeLayer)
    v5 = 1;
  else
    v5 = v4;
  if ((v5 & 1) == 0)
  {
    v6 = (CAShapeLayer *)objc_alloc_init((Class)TSDNoDefaultImplicitActionShapeLayer);
    self->_stageStrokeLayer = v6;
    -[CAShapeLayer setFillColor:](v6, "setFillColor:", 0);
    -[CAShapeLayer setLineWidth:](self->_stageStrokeLayer, "setLineWidth:", 1.0);
    -[CAShapeLayer setStrokeColor:](self->_stageStrokeLayer, "setStrokeColor:", -[TSUColor CGColor](+[TSUColor colorWithWhite:alpha:](TSUColor, "colorWithWhite:alpha:", 0.0, 0.100000001), "CGColor"));
    -[CAShapeLayer setDelegate:](self->_stageStrokeLayer, "setDelegate:", -[THWReviewRep interactiveCanvasController](self, "interactiveCanvasController"));
  }
  objc_msgSend(-[THWReviewRep canvas](self, "canvas"), "viewScale");
  memset(&v31, 0, sizeof(v31));
  CGAffineTransformMakeScale(&v31, v7, v7);
  objc_msgSend(-[THWReviewRep layout](self, "layout"), "stageFrame");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v16 = TSDCenterOfRect(v8, v10, v12, v14);
  v28 = vaddq_f64(*(float64x2_t *)&v31.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v31.c, v17), *(float64x2_t *)&v31.a, v16));
  v33.origin.x = v9;
  v33.origin.y = v11;
  v33.size.width = v13;
  v33.size.height = v15;
  CGRectInset(v33, 1.0, 1.0);
  -[CALayer setBounds:](self->_stageFillLayer, "setBounds:", TSDRectWithSize(v18));
  -[CALayer setPosition:](self->_stageFillLayer, "setPosition:");
  v30 = v31;
  v19 = -[CALayer setAffineTransform:](self->_stageFillLayer, "setAffineTransform:", &v30);
  if (self->_stageStrokeLayer)
  {
    v34.origin.x = TSDRectWithSize(v19);
    x = v34.origin.x;
    y = v34.origin.y;
    width = v34.size.width;
    height = v34.size.height;
    v35 = CGRectInset(v34, 0.5, 0.5);
    v24 = v35.origin.x;
    v25 = v35.origin.y;
    v26 = v35.size.width;
    v27 = v35.size.height;
    -[CAShapeLayer setBounds:](self->_stageStrokeLayer, "setBounds:", x, y, width, height);
    -[CAShapeLayer setPath:](self->_stageStrokeLayer, "setPath:", -[TSDBezierPath CGPath](+[TSDBezierPath bezierPathWithRect:](TSDBezierPath, "bezierPathWithRect:", v24, v25, v26, v27), "CGPath"));
    -[CAShapeLayer setPosition:](self->_stageStrokeLayer, "setPosition:", *(_OWORD *)&v28);
    v29 = v31;
    -[CAShapeLayer setAffineTransform:](self->_stageStrokeLayer, "setAffineTransform:", &v29);
  }
}

- (void)viewScaleDidChange
{
  _BOOL8 v3;

  if (-[THWReviewRep pressableHandler](self, "pressableHandler"))
    v3 = -[THWPressableRepGestureTargetHandler widgetInteractionEnabled](-[THWReviewRep pressableHandler](self, "pressableHandler"), "widgetInteractionEnabled");
  else
    v3 = 1;
  -[THWPagedCanvasController setUserInteractionEnabled:](self->_stageCanvasController, "setUserInteractionEnabled:", v3);
}

- (void)addAdditionalChildLayersToArray:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)THWReviewRep;
  -[THWReviewRep addAdditionalChildLayersToArray:](&v5, "addAdditionalChildLayersToArray:");
  if (self->_stageFillLayer)
    objc_msgSend(a3, "addObject:");
  if (self->_stageStrokeLayer)
    objc_msgSend(a3, "addObject:");
}

- (BOOL)control:(id)a3 isInteractionEnabledForRep:(id)a4
{
  if (-[THWReviewRep pressableHandler](self, "pressableHandler", a3, a4))
    return -[THWPressableRepGestureTargetHandler widgetInteractionEnabled](-[THWReviewRep pressableHandler](self, "pressableHandler"), "widgetInteractionEnabled");
  else
    return 1;
}

- (void)control:(id)a3 repWasAdded:(id)a4
{
  uint64_t v7;
  THWPagedCanvasController *stageCanvasController;
  double v9;
  uint64_t v10;
  double v11;
  id v12;
  uint64_t v13;
  double v14;
  THWReviewControlsRep *v15;
  id v16;
  uint64_t v17;
  double v18;
  id v19;
  THWPagedCanvasController *v20;

  switch((unint64_t)objc_msgSend(a3, "tag"))
  {
    case 0uLL:

      self->_stageCanvasController = 0;
      v10 = objc_opt_class(THWPagedCanvasControlRep);
      *(_QWORD *)&v11 = TSUDynamicCast(v10, a4).n128_u64[0];
      self->_stageCanvasController = (THWPagedCanvasController *)objc_msgSend(v12, "pagedCanvasController", v11);
      if (-[THWReviewRep performanceMode](self, "performanceMode"))
        -[THWPagedCanvasController setMinimizeInfoChange:](self->_stageCanvasController, "setMinimizeInfoChange:", 1);
      stageCanvasController = self->_stageCanvasController;
      goto LABEL_8;
    case 1uLL:
      v13 = objc_opt_class(THWReviewControlsRep);
      *(_QWORD *)&v14 = TSUDynamicCast(v13, a4).n128_u64[0];
      self->_controlsRep = v15;
      -[THWReviewControlsRep setDelegate:](v15, "setDelegate:", self, v14);
      -[THWReviewRep p_updateButtonStates](self, "p_updateButtonStates");
      return;
    case 3uLL:
      v16 = objc_msgSend(a3, "index");
      -[NSMutableDictionary removeObjectForKey:](self->_scrollableCanvasControllers, "removeObjectForKey:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v16));
      v17 = objc_opt_class(THWScrollableCanvasControlRep);
      *(_QWORD *)&v18 = TSUDynamicCast(v17, a4).n128_u64[0];
      v20 = (THWPagedCanvasController *)objc_msgSend(v19, "scrollableCanvasController", v18);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_scrollableCanvasControllers, "setObject:forKeyedSubscript:", v20, +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v16));
      -[THWPagedCanvasController setInstanceData:](v20, "setInstanceData:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v16));
      -[THWPagedCanvasController setUpdateCanvasSizeOnLayout:](v20, "setUpdateCanvasSizeOnLayout:", 1);
      stageCanvasController = v20;
      goto LABEL_8;
    case 4uLL:
    case 5uLL:
      v7 = objc_opt_class(THWControlContainerRep);
      *(_QWORD *)&v9 = TSUDynamicCast(v7, a4).n128_u64[0];
LABEL_8:
      -[THWPagedCanvasController setDelegate:](stageCanvasController, "setDelegate:", self, v9);
      break;
    default:
      return;
  }
}

- (void)control:(id)a3 repWillBeRemoved:(id)a4
{
  id v6;

  if (-[THWReviewControlsRep layout](self->_controlsRep, "layout", a3, a4) == a3)
  {
    self->_controlsRep = 0;
  }
  else if (objc_msgSend(a3, "tag") == (char *)&dword_0 + 3)
  {
    v6 = objc_msgSend(a3, "index");
    objc_msgSend(-[NSMutableDictionary objectForKeyedSubscript:](self->_scrollableCanvasControllers, "objectForKeyedSubscript:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v6)), "setDelegate:", 0);
    -[NSMutableDictionary removeObjectForKey:](self->_scrollableCanvasControllers, "removeObjectForKey:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v6));
  }
}

- (void)performanceModeChanged
{
  if (!-[THWReviewRep performanceMode](self, "performanceMode"))
    -[THWReviewRep p_relaxMinimizeInfosNextFrame](self, "p_relaxMinimizeInfosNextFrame");
}

- (void)p_relaxMinimizeInfosNextFrame
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_167A88;
  v2[3] = &unk_426DD0;
  v2[4] = self;
  objc_msgSend(-[THWReviewRep interactiveCanvasController](self, "interactiveCanvasController"), "performBlockNextFrame:", v2);
}

- (void)viewScrollWillChange
{
  -[THWPagedCanvasController setRasterize:](self->_stageCanvasController, "setRasterize:", 1);
}

- (void)viewScrollingEnded
{
  -[THWPagedCanvasController setRasterize:](self->_stageCanvasController, "setRasterize:", 0);
}

- (BOOL)controlContainer:(id)a3 allowTrackingContainedRep:(id)a4
{
  if ((objc_opt_respondsToSelector(a4, "allowTrackingInControlContainer:") & 1) != 0)
    return objc_msgSend(a4, "allowTrackingInControlContainer:", a3);
  else
    return 0;
}

- (BOOL)pagedCanvasController:(id)a3 shouldDisableScrollingAtContentEdgesForScrollView:(id)a4
{
  return 1;
}

- (BOOL)pagedCanvasController:(id)a3 shouldDisableScrollingWhenCursorIsHiddenForScrollView:(id)a4
{
  return objc_msgSend(-[THWReviewRep layout](self, "layout", a3, a4), "isExpanded") ^ 1;
}

- (unint64_t)pageCountForPagedCanvasController:(id)a3
{
  if (self->_stageCanvasController == a3)
    return (unint64_t)objc_msgSend(-[THWReviewRep layout](self, "layout"), "numberOfStagePages");
  else
    return 0;
}

- (id)pagedCanvasController:(id)a3 infosToDisplayForPageRange:(_NSRange)a4
{
  if (self->_stageCanvasController == a3)
    return objc_msgSend(-[THWReviewRep layout](self, "layout"), "infosForStagePages:", a4.location, a4.length);
  else
    return 0;
}

- (void)p_updateQuestionIndex:(unint64_t)a3 animate:(BOOL)a4
{
  _BOOL4 v4;

  v4 = a4;
  if (objc_msgSend(-[THWReviewRep layout](self, "layout"), "questionIndex") != (id)a3)
  {
    objc_msgSend(-[THWReviewRep layout](self, "layout"), "setQuestionIndex:", a3);
    if (self->_expandedRepController
      && objc_msgSend(-[THWReviewRep layout](self, "layout"), "usePhoneLayout"))
    {
      if (v4)
        -[THWExpandedRepController expandedRepControllerAnimatePanel:withCrossFadeContent:backgroundLayout:duration:](self->_expandedRepController, "expandedRepControllerAnimatePanel:withCrossFadeContent:backgroundLayout:duration:", 0, 1, 1, 0.15);
      -[THWExpandedRepController expandedRepControllerInvalidateChildrenInPanel:invalidateWPAuto:](self->_expandedRepController, "expandedRepControllerInvalidateChildrenInPanel:invalidateWPAuto:", 0, 0);
    }
    -[THWReviewRep p_updatePersitentQuestionIndex:](self, "p_updatePersitentQuestionIndex:", a3);
    -[THWReviewRep p_updateButtonStates](self, "p_updateButtonStates");
  }
}

- (void)pagedCanvasController:(id)a3 mostVisiblePageChangedToPageIndex:(unint64_t)a4
{
  -[THWReviewRep p_updateQuestionIndex:animate:](self, "p_updateQuestionIndex:animate:", a4, 1);
}

- (void)pagedCanvasController:(id)a3 didScrollToPageIndex:(unint64_t)a4
{
  -[THWReviewRep p_updateQuestionIndex:animate:](self, "p_updateQuestionIndex:animate:", a4, 0);
  if (objc_msgSend(objc_msgSend(-[THWReviewRep info](self, "info"), "questions"), "count") == (id)a4)
    -[THWReviewRep p_checkAllAnswers](self, "p_checkAllAnswers");
}

- (id)pagedCanvasController:(id)a3 primaryTargetForGesture:(id)a4
{
  if (-[THWPressableRepGestureTargetHandler canHandleGesture:](-[THWReviewRep pressableHandler](self, "pressableHandler", a3), "canHandleGesture:", a4))
  {
    return -[THWReviewRep pressableHandler](self, "pressableHandler");
  }
  else
  {
    return 0;
  }
}

- (void)pagedCanvasController:(id)a3 customizeLayerHost:(id)a4
{
  double v6;
  _BOOL8 v7;

  if (self->_stageCanvasController == a3)
  {
    objc_msgSend(a3, "setPageIndex:animated:", objc_msgSend(-[THWReviewRep layout](self, "layout"), "questionIndex"), 0);
    objc_msgSend(-[THWReviewRep layout](self, "layout"), "stageCornerRadius");
    objc_msgSend(objc_msgSend(-[TSDInteractiveCanvasController layerHost](-[THWPagedCanvasController interactiveCanvasController](self->_stageCanvasController, "interactiveCanvasController"), "layerHost"), "clippingLayer"), "setCornerRadius:", v6);
    objc_msgSend(objc_msgSend(a4, "layer"), "setBackgroundColor:", objc_msgSend(+[TSUColor clearColor](TSUColor, "clearColor"), "CGColor"));
    objc_msgSend(objc_msgSend(-[TSDInteractiveCanvasController layerHost](-[THWPagedCanvasController interactiveCanvasController](self->_stageCanvasController, "interactiveCanvasController"), "layerHost"), "canvasLayer"), "setAllowsPinchZoom:", 0);
    if (-[THWReviewRep pressableHandler](self, "pressableHandler"))
      v7 = -[THWPressableRepGestureTargetHandler widgetInteractionEnabled](-[THWReviewRep pressableHandler](self, "pressableHandler"), "widgetInteractionEnabled");
    else
      v7 = 1;
    -[THWPagedCanvasController setUserInteractionEnabled:](self->_stageCanvasController, "setUserInteractionEnabled:", v7);
  }
}

- (BOOL)pagedCanvasControllerDeferViewCreation:(id)a3
{
  return objc_msgSend(-[THWReviewRep interactiveCanvasController](self, "interactiveCanvasController", a3), "currentlyScrolling");
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
  return 1;
}

- (double)pagedCanvasControllerContentsScale:(id)a3
{
  double result;

  objc_msgSend(objc_msgSend(-[THWReviewRep interactiveCanvasController](self, "interactiveCanvasController", a3), "canvas"), "contentsScale");
  return result;
}

- (BOOL)pagedCanvasControllerIsRelatedCanvasScrolling:(id)a3
{
  return objc_msgSend(-[THWReviewRep interactiveCanvasController](self, "interactiveCanvasController", a3), "currentlyScrolling");
}

- (BOOL)pagedCanvasController:(id)a3 canvasViewShouldBecomeFirstResponder:(id)a4
{
  return 0;
}

- (double)pagedCanvasController:(id)a3 adjustScale:(double)a4 andFrame:(CGRect *)a5
{
  double Width;
  double v10;
  double v11;
  CGRect v13;
  CGRect v14;

  if (a5)
  {
    Width = CGRectGetWidth(*a5);
    if (self->_stageCanvasController == a3)
    {
      objc_msgSend(-[THWReviewRep layout](self, "layout", Width), "stageFrame");
      Width = CGRectGetWidth(v13);
    }
    v10 = Width;
    if (Width > 0.0)
    {
      objc_msgSend(objc_msgSend(-[THWReviewRep interactiveCanvasController](self, "interactiveCanvasController"), "canvas"), "contentsScale");
      v14.origin.x = TSDRoundedRectForScale(a5->origin.x, a5->origin.y, a5->size.width, a5->size.height, v11);
      *a5 = v14;
      return CGRectGetWidth(v14) / v10;
    }
  }
  return a4;
}

- (void)reviewControls:(id)a3 buttonPressed:(int)a4
{
  unint64_t v5;
  char *v6;
  THWPagedCanvasController *stageCanvasController;
  unsigned int v8;
  uint64_t v9;
  char *v10;

  switch(a4)
  {
    case 2:
      v8 = -[THWReviewRep p_computeCheckButtonStateDisabled:](self, "p_computeCheckButtonStateDisabled:", 0);
      if (v8)
      {
        if (v8 == 3)
          -[THWReviewRep p_resetQuestions](self, "p_resetQuestions", v9);
        else
          -[THWReviewRep p_clearQuestionAnswer:](self, "p_clearQuestionAnswer:", -[THWReviewRep p_currentQuestion](self, "p_currentQuestion"));
      }
      else
      {
        -[THWReviewRep p_checkQuestionAnswer:](self, "p_checkQuestionAnswer:", -[THWReviewRep p_currentQuestion](self, "p_currentQuestion"));
      }
      break;
    case 1:
      v10 = (char *)objc_msgSend(-[THWReviewRep layout](self, "layout", a3), "numberOfStagePages");
      v6 = (char *)-[THWPagedCanvasController pageIndex](self->_stageCanvasController, "pageIndex") + 1;
      if (v6 < v10)
      {
        stageCanvasController = self->_stageCanvasController;
        goto LABEL_11;
      }
      break;
    case 0:
      v5 = -[THWPagedCanvasController pageIndex](self->_stageCanvasController, "pageIndex", a3);
      if (v5)
      {
        v6 = (char *)(v5 - 1);
        stageCanvasController = self->_stageCanvasController;
LABEL_11:
        -[THWPagedCanvasController setPageIndex:animated:](stageCanvasController, "setPageIndex:animated:", v6, 1);
      }
      break;
  }
}

- (id)pAnimationView
{
  return objc_msgSend(-[NSMutableDictionary objectForKeyedSubscript:](self->_scrollableCanvasControllers, "objectForKeyedSubscript:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[THWPagedCanvasController pageIndex](self->_stageCanvasController, "pageIndex"))), "mainView");
}

- (id)pAnimationLayer
{
  return objc_msgSend(-[THWReviewRep pAnimationView](self, "pAnimationView"), "layer");
}

- (BOOL)shouldAnimateTargetLayer:(id)a3
{
  return 0;
}

- (id)animationLayer
{
  id result;

  if (!-[THWFreeTransformController isFreeTransformInProgress](-[THWFreeTransformableRepGestureTargetHandler ftc](-[THWReviewRep freeTransformableHandler](self, "freeTransformableHandler"), "ftc"), "isFreeTransformInProgress"))return -[THWReviewRep pAnimationLayer](self, "pAnimationLayer");
  result = -[THWFreeTransformController freeTransformLayer](-[THWFreeTransformableRepGestureTargetHandler ftc](-[THWReviewRep freeTransformableHandler](self, "freeTransformableHandler"), "ftc"), "freeTransformLayer");
  if (!result)
    return -[THWReviewRep pAnimationLayer](self, "pAnimationLayer");
  return result;
}

- (void)reparentAnimationLayerIfBackedByView:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;

  v4 = -[THWReviewRep pAnimationView](self, "pAnimationView", a3);
  if (v4)
  {
    v5 = v4;
    v6 = -[TSDCanvasLayerHosting subviewsController](-[THWPagedCanvasController layerHost](self->_stageCanvasController, "layerHost"), "subviewsController");
    v7 = v5;
    objc_msgSend(v6, "addSubviews:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1));
  }
}

- (id)shadowAnimationLayer
{
  if (-[THWFreeTransformController isFreeTransformInProgress](-[THWFreeTransformableRepGestureTargetHandler ftc](-[THWReviewRep freeTransformableHandler](self, "freeTransformableHandler"), "ftc"), "isFreeTransformInProgress"))
  {
    return -[THWFreeTransformController shadowLayer](-[THWFreeTransformableRepGestureTargetHandler ftc](-[THWReviewRep freeTransformableHandler](self, "freeTransformableHandler"), "ftc"), "shadowLayer");
  }
  else
  {
    return 0;
  }
}

- (BOOL)shouldFadeOutAnimationLayer:(id)a3
{
  if (-[THWFreeTransformController isFreeTransformInProgress](-[THWFreeTransformableRepGestureTargetHandler ftc](-[THWReviewRep freeTransformableHandler](self, "freeTransformableHandler", a3), "ftc"), "isFreeTransformInProgress"))
  {
    return -[THWFreeTransformController passedThreshold](-[THWFreeTransformableRepGestureTargetHandler ftc](-[THWReviewRep freeTransformableHandler](self, "freeTransformableHandler"), "ftc"), "passedThreshold");
  }
  else
  {
    return 1;
  }
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
  result = (CGAffineTransform *)-[THWFreeTransformController isFreeTransformInProgress](-[THWFreeTransformableRepGestureTargetHandler ftc](-[THWReviewRep freeTransformableHandler](self, "freeTransformableHandler"), "ftc"), "isFreeTransformInProgress");
  if ((_DWORD)result)
  {
    result = -[THWFreeTransformableRepGestureTargetHandler ftc](-[THWReviewRep freeTransformableHandler](self, "freeTransformableHandler"), "ftc");
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

- (CALayer)pressableAnimationLayer
{
  return -[UIView layer](-[THWPagedCanvasController view](self->_stageCanvasController, "view"), "layer");
}

- (CALayer)pressableAnimationShadowLayer
{
  return 0;
}

- (BOOL)wantsPressAnimation
{
  return -[THWPressableRepGestureTargetHandler widgetInteractionDisabledOnPage](-[THWReviewRep pressableHandler](self, "pressableHandler"), "widgetInteractionDisabledOnPage");
}

- (BOOL)wantsPressAction
{
  _BOOL4 v3;

  if (-[THWReviewRep meetsStageDimensionRequirementForExpanded](self, "meetsStageDimensionRequirementForExpanded")
    || (v3 = -[THWPressableRepGestureTargetHandler widgetInteractionDisabledOnPage](-[THWReviewRep pressableHandler](self, "pressableHandler"), "widgetInteractionDisabledOnPage")))
  {
    LOBYTE(v3) = -[THWReviewRep pressableAction](self, "pressableAction") != 0;
  }
  return v3;
}

- (BOOL)shouldRecognizePressOnRep:(id)a3
{
  return objc_msgSend(-[THWReviewRep layout](self, "layout", a3), "isExpanded") ^ 1;
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

  objc_msgSend(-[THWReviewRep layout](self, "layout"), "stageFrame");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)queryScore:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;

  v4 = (void *)TSUProtocolCast(&OBJC_PROTOCOL___THWReviewSummaryLayoutDelegate, -[THWReviewRep layout](self, "layout"));
  if (v4)
  {
    v5 = v4;
    v6 = (double)(unint64_t)objc_msgSend(v4, "reviewSummaryCorrectCount");
    v7 = (double)(unint64_t)objc_msgSend(v5, "reviewSummaryQuestionCount");
    if (!a3)
      return;
    goto LABEL_3;
  }
  v6 = 0.0;
  v7 = 0.0;
  if (a3)
LABEL_3:
    (*((void (**)(id, NSNumber *, NSNumber *))a3 + 2))(a3, +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v6), +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v7));
}

- (BOOL)shouldFadeInTargetLayer:(id)a3
{
  return 1;
}

- (id)targetLayer
{
  if (-[THWFreeTransformController isFreeTransformInProgress](-[THWFreeTransformableRepGestureTargetHandler ftc](-[THWReviewRep freeTransformableHandler](self, "freeTransformableHandler"), "ftc"), "isFreeTransformInProgress")&& !-[THWFreeTransformController passedThreshold](-[THWFreeTransformableRepGestureTargetHandler ftc](-[THWReviewRep freeTransformableHandler](self, "freeTransformableHandler"), "ftc"), "passedThreshold"))
  {
    return 0;
  }
  else
  {
    return -[THWReviewRep pAnimationLayer](self, "pAnimationLayer");
  }
}

- (void)reparentTargetLayerIfBackedByView:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;

  v4 = -[THWReviewRep pAnimationView](self, "pAnimationView", a3);
  if (v4)
  {
    v5 = v4;
    v6 = -[TSDCanvasLayerHosting subviewsController](-[THWPagedCanvasController layerHost](self->_stageCanvasController, "layerHost"), "subviewsController");
    v7 = v5;
    objc_msgSend(v6, "addSubviews:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1));
  }
}

- (CGRect)ftcTargetFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  if (-[THWFreeTransformController isFreeTransformInProgress](-[THWFreeTransformableRepGestureTargetHandler ftc](-[THWReviewRep freeTransformableHandler](self, "freeTransformableHandler"), "ftc"), "isFreeTransformInProgress"))
  {
    -[THWFreeTransformController completionTargetRect](-[THWFreeTransformableRepGestureTargetHandler ftc](-[THWReviewRep freeTransformableHandler](self, "freeTransformableHandler"), "ftc"), "completionTargetRect");
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

- (id)hostICC
{
  return objc_msgSend(*(id *)&self->super.TSDContainerRep_opaque[OBJC_IVAR___TSDRep_mCanvas], "canvasController");
}

- (BOOL)expandedWantsContentsRectAnimation
{
  return 1;
}

- (BOOL)expandedPanelAlwaysVisible
{
  return 1;
}

- (BOOL)expandedIsRelatedCanvasScrolling
{
  return -[TSDInteractiveCanvasController currentlyScrolling](-[THWPagedCanvasController interactiveCanvasController](self->_stageCanvasController, "interactiveCanvasController"), "currentlyScrolling");
}

- (BOOL)expandedShouldDismissOnChangeFromSizeClassPairWithController:(id)a3 flowMode:(BOOL)a4
{
  id v5;
  void *v6;

  v5 = -[THWReviewRep layout](self, "layout", a3);
  if (v5)
  {
    v6 = v5;
    if ((objc_msgSend(v5, "isExpandedOnly") & 1) != 0)
      LOBYTE(v5) = 0;
    else
      LOBYTE(v5) = (objc_msgSend(v6, "usePhoneLayout") | a4) ^ 1;
  }
  return (char)v5;
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
    return self->_animationController;
  }
  return result;
}

- (void)animationControllerDidPresent:(id)a3
{

  self->_animationController = 0;
}

- (void)expandedWillPresentWithController:(id)a3
{
  self->_expandedRepController = (THWExpandedRepController *)a3;
}

- (unsigned)expandedMaxLineCountForTextLayout:(id)a3 inPanel:(int)a4 withDefault:(unsigned int)a5
{
  if (!a4 && objc_msgSend(-[THWReviewRep layout](self, "layout", a3), "usePhoneLayout"))
    return 1;
  return a5;
}

- (void)p_invalidateLayouts
{
  id v3;

  v3 = -[THWReviewRep layout](self, "layout");
  objc_msgSend(v3, "invalidateFrame");
  objc_msgSend(v3, "invalidateChildren");
  objc_msgSend(-[THWReviewRep interactiveCanvasController](self, "interactiveCanvasController"), "layoutIfNeeded");
  -[THWPagedCanvasController invalidateLayoutsAndFrames](-[THWReviewRep stageCanvasController](self, "stageCanvasController"), "invalidateLayoutsAndFrames");
  -[TSDInteractiveCanvasController layoutIfNeeded](-[THWPagedCanvasController interactiveCanvasController](-[THWReviewRep stageCanvasController](self, "stageCanvasController"), "interactiveCanvasController"), "layoutIfNeeded");
}

- (void)expandedWidgetLayoutFrameDidChangeFromFrame:(CGRect)a3 toFrame:(CGRect)a4
{
  -[THWReviewRep p_invalidateLayouts](self, "p_invalidateLayouts", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

- (int)expandedAppearance
{
  return 1;
}

- (int)expandedAppearanceForPanel:(int)a3
{
  return 1;
}

- (BOOL)expandedHasContentForPanel:(int)a3
{
  if (a3 == 1)
    return 1;
  if (a3)
    return 0;
  if ((objc_msgSend(-[THWReviewRep layout](self, "layout"), "usePhoneLayout") & 1) != 0)
    return 1;
  return objc_msgSend(-[THWReviewRep layout](self, "layout"), "hasTitle");
}

- (id)expandedLayoutGeometryForLayout:(id)a3 inPanel:(int)a4 withWidth:(double)a5 insets:(UIEdgeInsets)a6
{
  char *v9;
  double y;
  double v11;
  double v12;

  v9 = (char *)objc_msgSend((id)TSUProtocolCast(&OBJC_PROTOCOL___THWControl, a3), "tag");
  if (a4 != 1 || v9 != (_BYTE *)&dword_0 + 1)
    return 0;
  y = CGPointZero.y;
  objc_msgSend(-[THWReviewRep layout](self, "layout"), "controlsSizeWithPanelWidth:", a5);
  return objc_msgSend(objc_alloc((Class)TSDLayoutGeometry), "initWithFrame:", CGPointZero.x, y, v11, v12);
}

- (unsigned)expandedAlignmentForLayout:(id)a3 inPanel:(int)a4
{
  if (objc_msgSend((id)TSUProtocolCast(&OBJC_PROTOCOL___THWControl, a3), "tag") == (char *)&dword_0 + 1)
    return 2;
  else
    return 4;
}

- (id)expandedChildInfosForPanel:(int)a3
{
  id v5;
  unint64_t v6;
  id v7;
  id v8;

  if (a3)
    return 0;
  v5 = objc_msgSend(objc_msgSend(-[THWReviewRep info](self, "info"), "questions"), "count");
  v6 = -[THWPagedCanvasController pageIndex](self->_stageCanvasController, "pageIndex");
  if (objc_msgSend(-[THWReviewRep layout](self, "layout"), "usePhoneLayout") && (unint64_t)v5 >= 2)
  {
    v7 = -[THWReviewRep layout](self, "layout");
    if (v6 >= (unint64_t)v5)
    {
      v8 = objc_msgSend(v7, "summaryTitleStorage");
    }
    else
    {
      v8 = objc_msgSend(v7, "questionNumberStorageAtPageIndex:", v6);
      if (!v8)
        return 0;
    }
  }
  else
  {
    v8 = objc_msgSend(objc_msgSend(objc_msgSend(-[THWReviewRep info](self, "info"), "adornmentInfo"), "title"), "containedStorage");
    if (!v8)
      return 0;
  }
  return +[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v8);
}

- (id)expandedAdditionalChildLayoutsForPanel:(int)a3
{
  id v3;

  if (a3 == 1 && (v3 = objc_msgSend(-[THWReviewRep layout](self, "layout"), "controlsLayout")) != 0)
    return +[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v3);
  else
    return 0;
}

- (id)expandedRotationAnimationController
{
  return -[THWReviewRotationAnimationController initWithRep:]([THWReviewRotationAnimationController alloc], "initWithRep:", self);
}

- (CGSize)expandedMinimumContentSize
{
  double v2;
  double v3;
  CGSize result;

  objc_msgSend(-[THWReviewRep layout](self, "layout"), "minimumContentSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)didPresentExpandedPostCommit
{
  -[THWReviewRep p_invalidateLayouts](self, "p_invalidateLayouts");
}

- (BOOL)canHandleGesture:(id)a3
{
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  BOOL v10;
  id v11;
  CGPoint v12;
  CGRect v13;

  if (-[THWReviewRep isExpanded](self, "isExpanded")
    && -[THWFreeTransformableRepGestureTargetHandler canHandleGesture:](-[THWReviewRep freeTransformableHandler](self, "freeTransformableHandler"), "canHandleGesture:", a3)|| -[THWPressableRepGestureTargetHandler canHandleGesture:](-[THWReviewRep pressableHandler](self, "pressableHandler"), "canHandleGesture:", a3))
  {
    return 1;
  }
  objc_msgSend(a3, "naturalLocationForRep:", self);
  v7 = v6;
  v9 = v8;
  objc_msgSend(-[THWReviewRep layout](self, "layout"), "stageFrame");
  v12.x = v7;
  v12.y = v9;
  v10 = CGRectContainsPoint(v13, v12);
  v11 = objc_msgSend(a3, "gestureKind");
  return v11 == (id)TSWPImmediateDoubleTap && v10;
}

- (BOOL)handleGesture:(id)a3
{
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  _BOOL4 v9;
  id v10;
  CGPoint v13;
  CGRect v14;

  if ((!-[THWFreeTransformableRepGestureTargetHandler canHandleGesture:](-[THWReviewRep freeTransformableHandler](self, "freeTransformableHandler"), "canHandleGesture:", a3)|| !-[THWFreeTransformableRepGestureTargetHandler handleGesture:](-[THWReviewRep freeTransformableHandler](self, "freeTransformableHandler"), "handleGesture:", a3))&& (!-[THWPressableRepGestureTargetHandler canHandleGesture:](-[THWReviewRep pressableHandler](self, "pressableHandler"), "canHandleGesture:", a3)|| !-[THWPressableRepGestureTargetHandler handleGesture:](-[THWReviewRep pressableHandler](self, "pressableHandler"), "handleGesture:", a3)))
  {
    objc_msgSend(a3, "naturalLocationForRep:", self);
    v6 = v5;
    v8 = v7;
    objc_msgSend(-[THWReviewRep layout](self, "layout"), "stageFrame");
    v13.x = v6;
    v13.y = v8;
    v9 = CGRectContainsPoint(v14, v13);
    v10 = objc_msgSend(a3, "gestureKind");
    if (v10 != (id)TSWPImmediateDoubleTap || !v9)
      return 0;
    objc_msgSend(a3, "gestureState");
  }
  return 1;
}

- (void)willBeginHandlingGesture:(id)a3
{
  id v5;

  v5 = objc_msgSend(a3, "gestureKind");
  if (v5 == (id)TSDFreeTransform)
    -[THWFreeTransformableRepGestureTargetHandler willBeginHandlingGesture:](-[THWReviewRep freeTransformableHandler](self, "freeTransformableHandler"), "willBeginHandlingGesture:", a3);
}

- (id)reviewQuestion:(id)a3 cachedImageNamed:(id)a4
{
  id v6;

  if (!a4)
    return 0;
  v6 = -[NSMutableDictionary objectForKey:](self->_cachedImages, "objectForKey:", a4);
  if (!v6)
  {
    v6 = +[TSUImage imageNamed:inBundle:](TSUImage, "imageNamed:inBundle:", a4, THBundle());
    if (v6)
      -[NSMutableDictionary setObject:forKey:](self->_cachedImages, "setObject:forKey:", v6, a4);
  }
  return v6;
}

- (int)reviewQuestionInitialState:(id)a3
{
  id v5;
  id v6;
  id v7;
  id v8;
  int v9;

  v5 = -[THWReviewRep p_responseController](self, "p_responseController");
  v6 = objc_msgSend(objc_msgSend(a3, "questionLayout"), "question");
  v7 = objc_msgSend(v5, "newTemporateReviewResponseMOC");
  v8 = objc_msgSend(v5, "responseForQuestionID:temporaryMOC:", objc_msgSend(v6, "questionID"), v7);
  if (objc_msgSend(v8, "userHasCheckedAnswer"))
  {
    v9 = -[THWReviewRep p_evaluateAnswerToQuestion:updateScore:](self, "p_evaluateAnswerToQuestion:updateScore:", v6, 0);
  }
  else if (objc_msgSend(objc_msgSend(v8, "answerState"), "hasUserSelected"))
  {
    v9 = 2;
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (void)reviewQuestionDidUpdateState:(id)a3
{
  -[THWReviewRep p_updateButtonStates](self, "p_updateButtonStates", a3);
}

- (void)reviewQuestion:(id)a3 selectChoice:(unint64_t)a4
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  double v11;
  id v12;
  id v13;
  char *v14;
  char *v15;
  char *i;
  TSWReviewMultiChoiceAnswerState *v17;
  _QWORD v18[6];

  v7 = objc_msgSend(objc_msgSend(a3, "questionLayout"), "question");
  v8 = -[THWReviewRep p_responseController](self, "p_responseController");
  v9 = objc_msgSend(v8, "responseForQuestionID:", objc_msgSend(v7, "questionID"));
  v10 = objc_opt_class(TSWReviewMultiChoiceAnswerState);
  *(_QWORD *)&v11 = TSUDynamicCast(v10, objc_msgSend(v9, "answerState")).n128_u64[0];
  v13 = objc_msgSend(objc_msgSend(v12, "selectedChoices", v11), "mutableCopy");
  if (!v13)
    v13 = objc_alloc_init((Class)NSMutableIndexSet);
  if (objc_msgSend(v7, "cardinality") == 2)
  {
    if (objc_msgSend(v13, "containsIndex:", a4))
      objc_msgSend(v13, "removeIndex:", a4);
    else
      objc_msgSend(v13, "addIndex:", a4);
    v14 = (char *)objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(a3, "questionLayout"), "question"), "choices"), "count");
    if (v14)
    {
      v15 = v14;
      for (i = 0; i != v15; ++i)
      {
        if ((char *)a4 != i && objc_msgSend(a3, "reviewQuestionStateForChoiceIndex:", i) == 2)
          objc_msgSend(v13, "removeIndex:", i);
      }
    }
  }
  else
  {
    objc_msgSend(v13, "removeAllIndexes");
    objc_msgSend(v13, "addIndex:", a4);
  }
  objc_msgSend(a3, "setQuestionState:", 2);
  if (objc_msgSend(v13, "count"))
  {
    v17 = objc_alloc_init(TSWReviewMultiChoiceAnswerState);
    -[TSWReviewMultiChoiceAnswerState setSelectedChoices:](v17, "setSelectedChoices:", objc_msgSend(v13, "copy"));
  }
  else
  {
    v17 = 0;
  }
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_168EE0;
  v18[3] = &unk_426E28;
  v18[4] = v9;
  v18[5] = v17;
  objc_msgSend(v8, "mutateResponse:block:", v9, v18);

  -[THWReviewRep p_answersUpdated](self, "p_answersUpdated");
  objc_msgSend(a3, "reviewQuestionAnswerUpdated");
  -[THWReviewRep reviewQuestionInvalidateLayers:](self, "reviewQuestionInvalidateLayers:", a3);
}

- (int)reviewQuestion:(id)a3 radioStateForChoice:(unint64_t)a4 pressed:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  double v15;
  void *v16;
  int v17;

  v5 = a5;
  v9 = objc_msgSend(objc_msgSend(a3, "questionLayout"), "question");
  v10 = -[THWReviewRep reviewQuestionResponseController:](self, "reviewQuestionResponseController:", a3);
  v11 = objc_msgSend(v10, "newTemporateReviewResponseMOC");
  v12 = objc_msgSend(v10, "responseForQuestionID:temporaryMOC:", objc_msgSend(v9, "questionID"), v11);
  v13 = objc_opt_class(TSWReviewMultiChoiceAnswerState);
  *(_QWORD *)&v15 = TSUDynamicCast(v13, objc_msgSend(v12, "answerState")).n128_u64[0];
  v16 = v14;
  if (v5)
  {
    v17 = objc_msgSend(v9, "cardinality", v15) != 2
       || (objc_msgSend(objc_msgSend(v16, "selectedChoices"), "containsIndex:", a4) & 1) == 0;
  }
  else if (objc_msgSend(objc_msgSend(v14, "selectedChoices", v15), "containsIndex:", a4))
  {
    v17 = 2;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void)reviewQuestionInvalidateLayers:(id)a3
{
  -[TSDInteractiveCanvasController invalidateLayers](-[THWPagedCanvasController interactiveCanvasController](self->_stageCanvasController, "interactiveCanvasController", a3), "invalidateLayers");
}

- (BOOL)reviewQuestionIsCurrentlyInView:(id)a3
{
  id v4;

  v4 = objc_msgSend(objc_msgSend(a3, "questionLayout"), "questionIndex");
  return v4 == (id)-[THWPagedCanvasController pageIndex](self->_stageCanvasController, "pageIndex");
}

- (void)reviewQuestion:(id)a3 unassociateTargets:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  TSWReviewMatchingAnswerState *v11;
  id v12;
  id i;
  id v14;
  id v15;
  TSWReviewMatchingAnswerState *v16;
  _QWORD v17[6];

  v7 = objc_msgSend(objc_msgSend(a3, "questionLayout"), "question");
  v8 = -[THWReviewRep p_responseController](self, "p_responseController");
  v9 = objc_msgSend(v8, "newTemporateReviewResponseMOC");
  v10 = objc_msgSend(v8, "responseForQuestionID:", objc_msgSend(v7, "questionID"));
  v11 = -[THWReviewRep p_matchingAnswerStateForQuestion:temporaryMOC:](self, "p_matchingAnswerStateForQuestion:temporaryMOC:", a3, v9);
  if (!v11)
    v11 = objc_alloc_init(TSWReviewMatchingAnswerState);
  v12 = objc_msgSend(a4, "firstIndex");
  if (v12 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    for (i = v12; i != (id)0x7FFFFFFFFFFFFFFFLL; i = objc_msgSend(a4, "indexGreaterThanIndex:", i))
    {
      v14 = -[TSWReviewMatchingAnswerState placardForTarget:](v11, "placardForTarget:", i);
      if (v14 != (id)0x7FFFFFFFFFFFFFFFLL)
        -[TSWReviewMatchingAnswerState setTarget:forPlacard:](v11, "setTarget:forPlacard:", 0x7FFFFFFFFFFFFFFFLL, v14);
    }
  }
  objc_msgSend(a3, "setQuestionState:", 2);
  v15 = -[NSArray copy](-[TSWReviewMatchingAnswerState placardToTargetMap](v11, "placardToTargetMap"), "copy");
  v16 = objc_alloc_init(TSWReviewMatchingAnswerState);
  -[TSWReviewMatchingAnswerState setPlacardToTargetMap:](v16, "setPlacardToTargetMap:", v15);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_16921C;
  v17[3] = &unk_426E28;
  v17[4] = v10;
  v17[5] = v16;
  objc_msgSend(v8, "mutateResponse:block:", v10, v17);

  -[THWReviewRep p_answersUpdated](self, "p_answersUpdated");
  objc_msgSend(a3, "reviewQuestionAnswerUpdated");
  -[THWReviewRep reviewQuestionInvalidateLayers:](self, "reviewQuestionInvalidateLayers:", a3);
  -[THWReviewRep reviewQuestionDidUpdateState:](self, "reviewQuestionDidUpdateState:", a3);

}

- (void)reviewQuestion:(id)a3 associatePlacard:(unint64_t)a4 withTarget:(unint64_t)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  TSWReviewMatchingAnswerState *v13;
  id v14;
  uint64_t v15;
  id v16;
  TSWReviewMatchingAnswerState *v17;
  _QWORD v18[6];

  v9 = objc_msgSend(objc_msgSend(a3, "questionLayout"), "question");
  v10 = -[THWReviewRep p_responseController](self, "p_responseController");
  v11 = objc_msgSend(v10, "newTemporateReviewResponseMOC");
  v12 = objc_msgSend(v10, "responseForQuestionID:", objc_msgSend(v9, "questionID"));
  v13 = -[THWReviewRep p_matchingAnswerStateForQuestion:temporaryMOC:](self, "p_matchingAnswerStateForQuestion:temporaryMOC:", a3, v11);
  if (!v13)
    v13 = objc_alloc_init(TSWReviewMatchingAnswerState);
  v14 = -[TSWReviewMatchingAnswerState targetForPlacard:](v13, "targetForPlacard:", a4);
  v15 = 0x7FFFFFFFFFFFFFFFLL;
  if (a5 != 0x7FFFFFFFFFFFFFFFLL)
    v15 = -[TSWReviewMatchingAnswerState placardForTarget:](v13, "placardForTarget:", a5);
  if (v14 != (id)a5)
  {
    if (v14 != (id)0x7FFFFFFFFFFFFFFFLL && v15 != 0x7FFFFFFFFFFFFFFFLL)
      -[TSWReviewMatchingAnswerState setTarget:forPlacard:](v13, "setTarget:forPlacard:", v14);
    -[TSWReviewMatchingAnswerState setTarget:forPlacard:](v13, "setTarget:forPlacard:", a5, a4);
    objc_msgSend(a3, "setQuestionState:", 2);
    v16 = -[NSArray copy](-[TSWReviewMatchingAnswerState placardToTargetMap](v13, "placardToTargetMap"), "copy");
    v17 = objc_alloc_init(TSWReviewMatchingAnswerState);
    -[TSWReviewMatchingAnswerState setPlacardToTargetMap:](v17, "setPlacardToTargetMap:", v16);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_16940C;
    v18[3] = &unk_426E28;
    v18[4] = v12;
    v18[5] = v17;
    objc_msgSend(v10, "mutateResponse:block:", v12, v18);

  }
  -[THWReviewRep p_answersUpdated](self, "p_answersUpdated");
  objc_msgSend(a3, "reviewQuestionAnswerUpdated");
  -[THWReviewRep reviewQuestionInvalidateLayers:](self, "reviewQuestionInvalidateLayers:", a3);
  -[THWReviewRep reviewQuestionDidUpdateState:](self, "reviewQuestionDidUpdateState:", a3);

}

- (id)reviewQuestionDraggingHostView:(id)a3
{
  return objc_msgSend(-[THWReviewRep interactiveCanvasController](self, "interactiveCanvasController", a3), "canvasView");
}

- (id)p_matchingAnswerStateForQuestion:(id)a3 temporaryMOC:(id)a4
{
  id v4;
  uint64_t v5;
  id result;

  v4 = objc_msgSend(-[THWReviewRep p_responseController](self, "p_responseController"), "responseForQuestionID:temporaryMOC:", objc_msgSend(objc_msgSend(objc_msgSend(a3, "questionLayout"), "question"), "questionID"), a4);
  v5 = objc_opt_class(TSWReviewMatchingAnswerState);
  TSUDynamicCast(v5, objc_msgSend(v4, "answerState"));
  return result;
}

- (unint64_t)reviewQuestion:(id)a3 placardForTarget:(unint64_t)a4
{
  id v7;
  id v8;
  unint64_t v9;

  v7 = objc_msgSend(-[THWReviewRep p_responseController](self, "p_responseController"), "newTemporateReviewResponseMOC");
  v8 = -[THWReviewRep p_matchingAnswerStateForQuestion:temporaryMOC:](self, "p_matchingAnswerStateForQuestion:temporaryMOC:", a3, v7);
  if (v8)
    v9 = (unint64_t)objc_msgSend(v8, "placardForTarget:", a4);
  else
    v9 = 0x7FFFFFFFFFFFFFFFLL;

  return v9;
}

- (unint64_t)reviewQuestion:(id)a3 targetForPlacard:(unint64_t)a4
{
  id v7;
  id v8;
  unint64_t v9;

  v7 = objc_msgSend(-[THWReviewRep p_responseController](self, "p_responseController"), "newTemporateReviewResponseMOC");
  v8 = -[THWReviewRep p_matchingAnswerStateForQuestion:temporaryMOC:](self, "p_matchingAnswerStateForQuestion:temporaryMOC:", a3, v7);
  if (v8)
    v9 = (unint64_t)objc_msgSend(v8, "targetForPlacard:", a4);
  else
    v9 = 0x7FFFFFFFFFFFFFFFLL;

  return v9;
}

- (id)p_responseController
{
  uint64_t v3;
  id result;

  v3 = objc_opt_class(THDocumentRoot);
  TSUDynamicCast(v3, objc_msgSend(-[THWReviewRep interactiveCanvasController](self, "interactiveCanvasController"), "documentRoot"));
  return result;
}

- (id)p_dataController
{
  uint64_t v3;
  id result;

  v3 = objc_opt_class(THDocumentRoot);
  TSUDynamicCast(v3, objc_msgSend(-[THWReviewRep interactiveCanvasController](self, "interactiveCanvasController"), "documentRoot"));
  return result;
}

- (id)p_currentQuestion
{
  return objc_msgSend(-[THWReviewRep info](self, "info"), "questionAtIndex:", -[THWPagedCanvasController pageIndex](self->_stageCanvasController, "pageIndex"));
}

- (id)p_repForQuestion:(id)a3
{
  id v3;
  uint64_t v4;

  v3 = objc_msgSend(objc_msgSend(-[NSMutableDictionary objectForKeyedSubscript:](self->_scrollableCanvasControllers, "objectForKeyedSubscript:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(-[THWReviewRep info](self, "info"), "indexOfQuestion:", a3))), "interactiveCanvasController"), "repForLayout:", objc_msgSend(-[THWReviewRep layout](self, "layout"), "layoutForQuestion:", a3));
  v4 = objc_opt_class(TSDRep);
  return (id)TSUClassAndProtocolCast(v3, v4, 1);
}

- (id)p_repForPage:(unint64_t)a3
{
  id v4;
  uint64_t v5;
  id result;

  v4 = objc_msgSend(-[TSDInteractiveCanvasController layoutController](-[THWPagedCanvasController interactiveCanvasController](self->_stageCanvasController, "interactiveCanvasController"), "layoutController"), "layoutForInfo:", objc_msgSend(objc_msgSend(-[THWReviewRep layout](self, "layout"), "infosForStagePages:", a3, 1), "lastObject"));
  v5 = objc_opt_class(TSDRep);
  TSUDynamicCast(v5, -[TSDInteractiveCanvasController repForLayout:](-[THWPagedCanvasController interactiveCanvasController](self->_stageCanvasController, "interactiveCanvasController"), "repForLayout:", v4));
  return result;
}

- (int)p_evaluateAnswerToQuestion:(id)a3 updateScore:(BOOL)a4
{
  _BOOL8 v4;
  _QWORD v8[5];

  v4 = a4;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_169818;
  v8[3] = &unk_42A3E8;
  v8[4] = -[THWReviewRep p_repForQuestion:](self, "p_repForQuestion:");
  return objc_msgSend(a3, "evaluateAnswerWithResponseController:updateScore:choiceBlock:", -[THWReviewRep p_responseController](self, "p_responseController"), v4, v8);
}

- (void)p_updateButtonStates
{
  char *v3;
  char *v4;
  _BOOL8 v5;
  _BOOL8 v6;
  unsigned __int8 v7;

  v7 = 0;
  -[THWReviewControlsRep setCheckAnswerButtonState:](self->_controlsRep, "setCheckAnswerButtonState:", -[THWReviewRep p_computeCheckButtonStateDisabled:](self, "p_computeCheckButtonStateDisabled:", &v7));
  -[THWReviewControlsRep setCheckAnswerButtonDisabled:](self->_controlsRep, "setCheckAnswerButtonDisabled:", v7);
  v3 = (char *)objc_msgSend(-[THWReviewRep layout](self, "layout"), "questionCount");
  if (objc_msgSend(-[THWReviewRep layout](self, "layout"), "questionIndex") == (id)0x7FFFFFFFFFFFFFFFLL)
    v4 = 0;
  else
    v4 = (char *)objc_msgSend(-[THWReviewRep layout](self, "layout"), "questionIndex");
  v5 = v3 == (_BYTE *)&dword_0 + 1 || v4 == 0;
  -[THWReviewControlsRep setPrevButtonHidden:](self->_controlsRep, "setPrevButtonHidden:", v5);
  v6 = v4 >= v3 || v3 == (_BYTE *)&dword_0 + 1;
  -[THWReviewControlsRep setNextButtonHidden:](self->_controlsRep, "setNextButtonHidden:", v6);
}

- (int)p_computeCheckButtonStateDisabled:(BOOL *)a3
{
  id v5;
  char v6;
  id v7;
  void *v8;
  unsigned __int8 v9;

  v5 = -[THWPagedCanvasController pageIndex](self->_stageCanvasController, "pageIndex");
  if (v5 == objc_msgSend(objc_msgSend(-[THWReviewRep info](self, "info"), "questions"), "count"))
  {
    v6 = 0;
    LODWORD(v7) = 3;
    if (!a3)
      return (int)v7;
LABEL_15:
    *a3 = v6;
    return (int)v7;
  }
  v7 = -[THWReviewRep p_repForQuestion:](self, "p_repForQuestion:", -[THWReviewRep p_currentQuestion](self, "p_currentQuestion"));
  if (!v7)
  {
LABEL_14:
    v6 = 0;
    if (!a3)
      return (int)v7;
    goto LABEL_15;
  }
  v8 = v7;
  switch(objc_msgSend(v7, "questionState"))
  {
    case 0u:
    case 1u:
      LODWORD(v7) = 0;
      v6 = 1;
      if (a3)
        goto LABEL_15;
      break;
    case 2u:
      if ((objc_opt_respondsToSelector(v8, "reviewQuestionIsAnswerCheckable") & 1) == 0)
        goto LABEL_13;
      v9 = objc_msgSend(v8, "reviewQuestionIsAnswerCheckable");
      LODWORD(v7) = 0;
      v6 = v9 ^ 1;
      if (a3)
        goto LABEL_15;
      break;
    case 3u:
    case 4u:
    case 5u:
      v6 = 0;
      LODWORD(v7) = 1;
      if (a3)
        goto LABEL_15;
      break;
    case 6u:
      v6 = 0;
      LODWORD(v7) = 2;
      if (a3)
        goto LABEL_15;
      break;
    default:
LABEL_13:
      LODWORD(v7) = 0;
      goto LABEL_14;
  }
  return (int)v7;
}

- (BOOL)p_questionCanBeChecked:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  double v8;
  void *v9;
  void *v10;
  id v11;

  v4 = -[THWReviewRep p_responseController](self, "p_responseController");
  v5 = objc_msgSend(v4, "newTemporateReviewResponseMOC");
  v6 = objc_msgSend(v4, "responseForQuestionID:temporaryMOC:", objc_msgSend(a3, "questionID"), v5);
  if (v6)
  {
    if (objc_msgSend(a3, "type") == 2)
    {
      v7 = objc_opt_class(TSWReviewMatchingAnswerState);
      *(_QWORD *)&v8 = TSUDynamicCast(v7, objc_msgSend(v6, "answerState")).n128_u64[0];
      v10 = v9;
      if (!v9)
        objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", v8), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWReviewRep p_questionCanBeChecked:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Review/THWReviewRep.m"), 1561, CFSTR("invalid nil value for '%s'"), "matchingAnswerState");
      v11 = objc_msgSend(v10, "numSelectedTargets", v8);
      if (v11 != objc_msgSend(objc_msgSend(a3, "choices"), "count"))
        goto LABEL_6;
    }
    else if (!objc_msgSend(objc_msgSend(v6, "answerState"), "hasUserSelected"))
    {
LABEL_6:
      LOBYTE(v6) = 0;
      goto LABEL_9;
    }
    LODWORD(v6) = objc_msgSend(v6, "userHasCheckedAnswer") ^ 1;
  }
LABEL_9:

  return (char)v6;
}

- (void)p_checkQuestionAnswer:(id)a3
{
  id v5;
  id v6;
  _QWORD v7[5];

  v5 = -[THWReviewRep p_responseController](self, "p_responseController");
  v6 = objc_msgSend(v5, "responseForQuestionID:", objc_msgSend(a3, "questionID"));
  if (objc_msgSend(objc_msgSend(v6, "answerState"), "hasUserSelected"))
  {
    objc_msgSend(-[THWReviewRep p_repForQuestion:](self, "p_repForQuestion:", a3), "setQuestionState:", -[THWReviewRep p_evaluateAnswerToQuestion:updateScore:](self, "p_evaluateAnswerToQuestion:updateScore:", a3, 1));
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_169C38;
    v7[3] = &unk_426DD0;
    v7[4] = v6;
    objc_msgSend(v5, "mutateResponse:block:", v6, v7);
    -[THWReviewRep p_answersUpdated](self, "p_answersUpdated");
  }
}

- (void)p_clearQuestionAnswer:(id)a3
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = -[THWReviewRep p_responseController](self, "p_responseController");
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_169D04;
  v7[3] = &unk_426DD0;
  v8 = objc_msgSend(v5, "responseForQuestionID:", objc_msgSend(a3, "questionID"));
  objc_msgSend(v5, "mutateResponse:block:", v8, v7);
  objc_msgSend(-[THWReviewRep p_repForQuestion:](self, "p_repForQuestion:", a3), "setQuestionState:", 1);
  v6 = -[THWReviewRep p_repForQuestion:](self, "p_repForQuestion:", a3);
  -[THWReviewRep p_answersUpdated](self, "p_answersUpdated");
  objc_msgSend(v6, "reviewQuestionAnswerUpdated");
}

- (void)p_answersUpdated
{
  objc_msgSend(objc_msgSend(-[THWReviewRep layout](self, "layout"), "summaryLayout"), "answersUpdated");
  objc_msgSend(-[TSDInteractiveCanvasController canvas](-[THWPagedCanvasController interactiveCanvasController](self->_stageCanvasController, "interactiveCanvasController"), "canvas"), "invalidateLayers");
}

- (void)p_updatePersitentQuestionIndex:(unint64_t)a3
{
  id v5;
  _QWORD v6[6];

  v5 = -[THWReviewRep p_dataController](self, "p_dataController");
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_169E18;
  v6[3] = &unk_427240;
  v6[5] = a3;
  objc_msgSend(v5, "mutateReviewWidgetData:block:", objc_msgSend(v5, "reviewWidgetDataForWidgetID:", objc_msgSend(-[THWReviewRep info](self, "info"), "reviewID")), v6);
}

- (void)p_refreshQuestions
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = objc_msgSend(-[THWReviewRep info](self, "info"), "questions");
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = -[THWReviewRep p_repForQuestion:](self, "p_repForQuestion:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v7));
        v9 = objc_opt_class(TSDRep);
        v10 = (void *)TSUClassAndProtocolCast(v8, v9, 1);
        objc_msgSend(v10, "setQuestionState:", 0, &OBJC_PROTOCOL___THWReviewQuestionRep);
        objc_msgSend(v10, "updateChildrenFromLayout");
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }
  -[THWReviewRep p_answersUpdated](self, "p_answersUpdated");
}

- (void)p_resetQuestions
{
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  id v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  -[THWPagedCanvasController setPageIndex:animated:](self->_stageCanvasController, "setPageIndex:animated:", 0, -[THWPagedCanvasController pageIndex](self->_stageCanvasController, "pageIndex") < 3);
  v3 = -[THWReviewRep p_responseController](self, "p_responseController");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = objc_msgSend(-[THWReviewRep info](self, "info", 0), "questions");
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        v10 = -[THWReviewRep p_repForQuestion:](self, "p_repForQuestion:", v9);
        objc_msgSend(v10, "setQuestionState:", 1);
        objc_msgSend(v3, "removeResponseForQuestionID:", objc_msgSend(v9, "questionID"));
        if (v10)
          v11 = v10;
        else
          v11 = (void *)TSUProtocolCast(&OBJC_PROTOCOL___THWReviewQuestionLayout, objc_msgSend(-[THWReviewRep layout](self, "layout"), "layoutForQuestion:", v9));
        objc_msgSend(v11, "reviewQuestionAnswerUpdated");
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }
  -[THWReviewRep p_answersUpdated](self, "p_answersUpdated");
  -[BCProgressTrackingRepTracker resetAttemptForRep:](self->_progressTracker, "resetAttemptForRep:", self);
}

- (void)p_checkAllAnswers
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = objc_msgSend(-[THWReviewRep info](self, "info", 0), "questions");
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if (-[THWReviewRep p_questionCanBeChecked:](self, "p_questionCanBeChecked:", v8))
          -[THWReviewRep p_checkQuestionAnswer:](self, "p_checkQuestionAnswer:", v8);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }
  v9 = (void *)TSUProtocolCast(&OBJC_PROTOCOL___THWReviewSummaryLayoutDelegate, -[THWReviewRep layout](self, "layout"));
  if (v9)
  {
    v10 = v9;
    if (objc_msgSend(v9, "reviewSummaryShouldShowResults"))
      -[BCProgressTrackingRepTracker scoreDidChangeForRep:score:total:](self->_progressTracker, "scoreDidChangeForRep:score:total:", self, +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "reviewSummaryCorrectCount")), +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "reviewSummaryQuestionCount")));
  }
}

- (CGSize)sizeOfCanvasForScrollableCanvasController:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  objc_msgSend(objc_msgSend(objc_msgSend(a3, "interactiveCanvasController"), "layoutController"), "rectOfTopLevelLayouts");
  v5 = 1.0;
  if (v3 <= 0.0)
    v6 = 1.0;
  else
    v6 = v3;
  if (v4 > 0.0)
    v5 = v4;
  result.height = v5;
  result.width = v6;
  return result;
}

- (BOOL)infosChangeForViewportChangeInScrollableCanvasController:(id)a3
{
  return 0;
}

- (id)scrollableCanvasController:(id)a3 infosToDisplayForViewport:(CGRect)a4
{
  uint64_t v6;
  double v7;
  id v8;

  v6 = objc_opt_class(NSNumber);
  *(_QWORD *)&v7 = TSUDynamicCast(v6, objc_msgSend(a3, "instanceData")).n128_u64[0];
  return objc_msgSend(-[THWReviewRep layout](self, "layout"), "infosForScrollablePage:", objc_msgSend(v8, "unsignedIntegerValue", v7));
}

- (UIEdgeInsets)contentInsetsForScrollableCanvasController:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  v3 = TSDEdgeInsetsZero[0];
  v4 = TSDEdgeInsetsZero[1];
  v5 = TSDEdgeInsetsZero[2];
  v6 = TSDEdgeInsetsZero[3];
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (id)scrollableCanvasController:(id)a3 primaryTargetForGesture:(id)a4
{
  if (-[THWPressableRepGestureTargetHandler canHandleGesture:](-[THWReviewRep pressableHandler](self, "pressableHandler", a3), "canHandleGesture:", a4))
  {
    return -[THWReviewRep pressableHandler](self, "pressableHandler");
  }
  else
  {
    return 0;
  }
}

- (id)scrollableCanvasHost
{
  return objc_msgSend(-[THWReviewRep interactiveCanvasController](self, "interactiveCanvasController"), "scrollableCanvasHost");
}

- (id)strokeLayerForScrollableCanvasController:(id)a3
{
  return 0;
}

- (id)maskLayerForScrollableCanvasController:(id)a3
{
  return 0;
}

- (BOOL)scrollableCanvasController:(id)a3 allowsEditMenuForRep:(id)a4
{
  return 0;
}

- (BOOL)scrollableCanvasController:(id)a3 shouldBeginEditingTHWPRep:(id)a4 withGesture:(id)a5
{
  return 0;
}

- (BOOL)scrollableCanvasController:(id)a3 allowsHyperlinkWithGesture:(id)a4 forRep:(id)a5
{
  return 0;
}

- (double)contentsScaleForScrollableCanvasController:(id)a3
{
  double result;

  objc_msgSend(-[THWReviewRep canvas](self, "canvas", a3), "contentsScale");
  return result;
}

- (BOOL)deferViewCreationForScrollableCanvasController:(id)a3
{
  return 0;
}

- (BOOL)allowSelectionPopover
{
  return 0;
}

- (id)scrollableCanvasController:(id)a3 actionForHyperlink:(id)a4 inRep:(id)a5 gesture:(id)a6
{
  void *v9;

  v9 = (void *)TSUProtocolCast(&OBJC_PROTOCOL___TSWPInteractiveCanvasControllerDelegate, objc_msgSend(-[THWReviewRep interactiveCanvasController](self, "interactiveCanvasController", a3), "delegate"));
  return objc_msgSend(v9, "actionForHyperlink:inRep:gesture:", a4, a5, a6);
}

- (BOOL)isRelatedCanvasScrollingForScrollableCanvasController:(id)a3
{
  return objc_msgSend(-[THWReviewRep interactiveCanvasController](self, "interactiveCanvasController", a3), "currentlyScrolling");
}

- (void)scrollableCanvasController:(id)a3 customizeLayerHost:(id)a4
{
  _BOOL8 v6;

  objc_msgSend(a3, "setupImmediatePressGestureWithSimultaneousGestures:", objc_msgSend(objc_msgSend(-[TSDInteractiveCanvasController layerHost](-[THWPagedCanvasController interactiveCanvasController](self->_stageCanvasController, "interactiveCanvasController", a3, a4), "layerHost"), "asiOSCVC"), "panGestureRecognizers"));
  if (-[THWReviewRep pressableHandler](self, "pressableHandler"))
    v6 = -[THWPressableRepGestureTargetHandler widgetInteractionEnabled](-[THWReviewRep pressableHandler](self, "pressableHandler"), "widgetInteractionEnabled");
  else
    v6 = 1;
  objc_msgSend(a3, "setUserInteractionEnabled:", v6);
}

- (BOOL)scrollableCanvasControllerUseOverlayScrollerOnly:(id)a3
{
  return 1;
}

- (id)bookNavigatorForScrollableCanvasController:(id)a3
{
  uint64_t v4;
  double v5;
  id v6;

  v4 = objc_opt_class(THInteractiveCanvasController);
  *(_QWORD *)&v5 = TSUDynamicCast(v4, -[THWReviewRep interactiveCanvasController](self, "interactiveCanvasController")).n128_u64[0];
  return objc_msgSend(v6, "bookNavigator", v5);
}

- (id)documentNavigatorForScrollableCanvasController:(id)a3
{
  uint64_t v4;
  double v5;
  id v6;

  v4 = objc_opt_class(THInteractiveCanvasController);
  *(_QWORD *)&v5 = TSUDynamicCast(v4, -[THWReviewRep interactiveCanvasController](self, "interactiveCanvasController")).n128_u64[0];
  return objc_msgSend(v6, "documentNavigator", v5);
}

- (id)p_currentScrollableCanvasController
{
  return -[NSMutableDictionary objectForKeyedSubscript:](self->_scrollableCanvasControllers, "objectForKeyedSubscript:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[THWPagedCanvasController pageIndex](self->_stageCanvasController, "pageIndex")));
}

- (void)freeTransformWillBegin
{
  objc_msgSend(-[THWReviewRep pAnimationView](self, "pAnimationView"), "setTsdBackgroundColor:", objc_msgSend(+[TSUColor whiteColor](TSUColor, "whiteColor"), "platformColor"));
}

- (void)freeTransformDidEnd
{
  objc_msgSend(-[THWReviewRep pAnimationView](self, "pAnimationView"), "setTsdBackgroundColor:", objc_msgSend(+[TSUColor clearColor](TSUColor, "clearColor"), "platformColor"));
}

- (BOOL)isFreeTransformInProgress
{
  return -[THWFreeTransformController isFreeTransformInProgress](-[THWFreeTransformableRepGestureTargetHandler ftc](-[THWReviewRep freeTransformableHandler](self, "freeTransformableHandler"), "ftc"), "isFreeTransformInProgress");
}

- (id)transformLayer
{
  return -[THWReviewRep pAnimationLayer](self, "pAnimationLayer");
}

- (BOOL)isExpanded
{
  return objc_msgSend(-[THWReviewRep layout](self, "layout"), "isExpanded");
}

- (BOOL)meetsStageDimensionRequirementForExpanded
{
  return 1;
}

- (id)shadowPath
{
  objc_msgSend(-[THWReviewRep transformLayer](self, "transformLayer"), "bounds");
  return +[TSDBezierPath bezierPathWithRect:](TSDBezierPath, "bezierPathWithRect:");
}

- (BOOL)freeTransformUseTracedShadowPath
{
  return 0;
}

- (CGRect)rectForCompletion
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  objc_msgSend(-[THWReviewRep layout](self, "layout"), "frameInParent");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (BOOL)canExpand
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWReviewRep;
  return -[THWReviewRep canExpand](&v3, "canExpand");
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

- (NSMutableDictionary)cachedImages
{
  return self->_cachedImages;
}

- (THWReviewControlsRep)controlsRep
{
  return self->_controlsRep;
}

- (CALayer)stageFillLayer
{
  return self->_stageFillLayer;
}

- (CAShapeLayer)stageStrokeLayer
{
  return self->_stageStrokeLayer;
}

- (THWExpandedRepController)expandedRepController
{
  return self->_expandedRepController;
}

- (void)setPressableHandler:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 352);
}

- (BCProgressTrackingRepTracker)progressTracker
{
  return self->_progressTracker;
}

- (NSMutableDictionary)scrollableCanvasControllers
{
  return self->_scrollableCanvasControllers;
}

@end
