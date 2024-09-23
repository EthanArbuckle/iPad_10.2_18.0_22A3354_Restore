@implementation THWAdornmentController

- (THWAdornmentController)initWithExpandedRep:(id)a3 documentRoot:(id)a4
{
  THWAdornmentController *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)THWAdornmentController;
  v6 = -[THWAdornmentController init](&v8, "init");
  if (v6)
  {
    v6->_expandedRep = (THWExpandedRep *)a3;
    v6->_documentRoot = (TSKDocumentRoot *)a4;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  if (!-[THWAdornmentController tornDown](self, "tornDown"))
    -[THWAdornmentController teardown](self, "teardown");

  v3.receiver = self;
  v3.super_class = (Class)THWAdornmentController;
  -[THWAdornmentController dealloc](&v3, "dealloc");
}

- (void)teardown
{
  -[THWAdornmentCloseButton setTarget:action:](-[THWAdornmentController closeButton](self, "closeButton"), "setTarget:action:", 0, 0);
  -[THWAdornmentPanel teardown](self->_topPanel, "teardown");
  -[THWAdornmentPanel teardown](self->_bottomPanel, "teardown");
  -[THWAdornmentPanel teardown](self->_controlPanel, "teardown");
  -[THWAdornmentController setTornDown:](self, "setTornDown:", 1);
}

- (void)p_createViews
{
  id v3;
  TSDInteractiveCanvasController *v4;
  THShortTapGestureRecognizer *v5;
  id v6;
  THShortTapGestureRecognizer *v7;
  TSDInteractiveCanvasController *v8;
  THShortTapGestureRecognizer *v9;
  id v10;
  THShortTapGestureRecognizer *v11;
  THWAdornmentPanel *bottomPanel;
  uint64_t v13;
  THWAdornmentCloseButton *v14;

  if (self->_topPanel)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWAdornmentController p_createViews]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Drawables/THWAdornmentController.m"), 813, CFSTR("expected nil value for '%s'"), "_topPanel");
  if (self->_bottomPanel)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWAdornmentController p_createViews]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Drawables/THWAdornmentController.m"), 814, CFSTR("expected nil value for '%s'"), "_bottomPanel");
  if (self->_controlPanel)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWAdornmentController p_createViews]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Drawables/THWAdornmentController.m"), 815, CFSTR("expected nil value for '%s'"), "_controlPanel");
  if (self->_closeButton)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWAdornmentController p_createViews]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Drawables/THWAdornmentController.m"), 816, CFSTR("expected nil value for '%s'"), "_closeButton");
  if ((objc_opt_respondsToSelector(self->_expandedRep, "expandedAppearance") & 1) != 0)
    v3 = -[THWExpandedRep expandedAppearance](self->_expandedRep, "expandedAppearance");
  else
    v3 = &dword_0 + 1;
  -[THWAdornmentController setAppearance:](self, "setAppearance:", v3);
  if (-[THWExpandedRep expandedHasContentForPanel:](self->_expandedRep, "expandedHasContentForPanel:", 0))
  {
    self->_topPanel = -[THWAdornmentPanel initWithDelegate:kind:expandedRep:documentRoot:]([THWAdornmentPanel alloc], "initWithDelegate:kind:expandedRep:documentRoot:", self, 0, self->_expandedRep, -[THWAdornmentController documentRoot](self, "documentRoot"));
    if (-[THWAdornmentControllerDelegate adornmentController:allowWindowMoveForPanel:](-[THWAdornmentController delegate](self, "delegate"), "adornmentController:allowWindowMoveForPanel:", self, 0))-[TSWOverlayPanelView setAllowWindowMoveForPanel:](-[THWAdornmentPanel view](self->_topPanel, "view"), "setAllowWindowMoveForPanel:", 1);
  }
  if (-[THWExpandedRep expandedHasContentForPanel:](self->_expandedRep, "expandedHasContentForPanel:", 1))
  {
    self->_bottomPanel = -[THWAdornmentPanel initWithDelegate:kind:expandedRep:documentRoot:]([THWAdornmentPanel alloc], "initWithDelegate:kind:expandedRep:documentRoot:", self, 1, self->_expandedRep, -[THWAdornmentController documentRoot](self, "documentRoot"));
    if (-[THWAdornmentControllerDelegate adornmentController:allowWindowMoveForPanel:](-[THWAdornmentController delegate](self, "delegate"), "adornmentController:allowWindowMoveForPanel:", self, 1))-[TSWOverlayPanelView setAllowWindowMoveForPanel:](-[THWAdornmentPanel view](self->_bottomPanel, "view"), "setAllowWindowMoveForPanel:", 1);
    -[THWAutosizedCanvasController setupImmediatePressGesture](-[THWAdornmentPanel autosizedCanvasController](self->_bottomPanel, "autosizedCanvasController"), "setupImmediatePressGesture");
    v4 = -[THWAutosizedCanvasController interactiveCanvasController](-[THWAdornmentPanel autosizedCanvasController](self->_bottomPanel, "autosizedCanvasController"), "interactiveCanvasController");
    v5 = [THShortTapGestureRecognizer alloc];
    v6 = -[TSDInteractiveCanvasController gestureDispatcher](v4, "gestureDispatcher");
    v7 = -[THShortTapGestureRecognizer initWithGestureDispatcher:gestureKind:](v5, "initWithGestureDispatcher:gestureKind:", v6, TSDShortTap);
    objc_msgSend(-[TSDiOSCanvasViewController viewForGestureRecognizer:](-[THWAutosizedCanvasController canvasViewController](-[THWAdornmentPanel autosizedCanvasController](self->_bottomPanel, "autosizedCanvasController"), "canvasViewController"), "viewForGestureRecognizer:", v7), "addGestureRecognizer:", v7);
    -[THShortTapGestureRecognizer requireGestureRecognizerToFail:](v7, "requireGestureRecognizerToFail:", -[THWAutosizedCanvasController immediatePressGesture](-[THWAdornmentPanel autosizedCanvasController](self->_bottomPanel, "autosizedCanvasController"), "immediatePressGesture"));
  }
  if (-[THWExpandedRep expandedHasContentForPanel:](self->_expandedRep, "expandedHasContentForPanel:", 2))
  {
    self->_controlPanel = -[THWAdornmentPanel initWithDelegate:kind:expandedRep:documentRoot:]([THWAdornmentPanel alloc], "initWithDelegate:kind:expandedRep:documentRoot:", self, 2, self->_expandedRep, -[THWAdornmentController documentRoot](self, "documentRoot"));
    if (-[THWAdornmentControllerDelegate adornmentController:allowWindowMoveForPanel:](-[THWAdornmentController delegate](self, "delegate"), "adornmentController:allowWindowMoveForPanel:", self, 2))-[TSWOverlayPanelView setAllowWindowMoveForPanel:](-[THWAdornmentPanel view](self->_controlPanel, "view"), "setAllowWindowMoveForPanel:", 1);
    -[THWAutosizedCanvasController setupImmediatePressGesture](-[THWAdornmentPanel autosizedCanvasController](self->_controlPanel, "autosizedCanvasController"), "setupImmediatePressGesture");
    v8 = -[THWAutosizedCanvasController interactiveCanvasController](-[THWAdornmentPanel autosizedCanvasController](self->_controlPanel, "autosizedCanvasController"), "interactiveCanvasController");
    v9 = [THShortTapGestureRecognizer alloc];
    v10 = -[TSDInteractiveCanvasController gestureDispatcher](v8, "gestureDispatcher");
    v11 = -[THShortTapGestureRecognizer initWithGestureDispatcher:gestureKind:](v9, "initWithGestureDispatcher:gestureKind:", v10, TSDShortTap);
    objc_msgSend(-[TSDiOSCanvasViewController viewForGestureRecognizer:](-[THWAutosizedCanvasController canvasViewController](-[THWAdornmentPanel autosizedCanvasController](self->_controlPanel, "autosizedCanvasController"), "canvasViewController"), "viewForGestureRecognizer:", v11), "addGestureRecognizer:", v11);
    -[THShortTapGestureRecognizer requireGestureRecognizerToFail:](v11, "requireGestureRecognizerToFail:", -[THWAutosizedCanvasController immediatePressGesture](-[THWAdornmentPanel autosizedCanvasController](self->_controlPanel, "autosizedCanvasController"), "immediatePressGesture"));
  }
  -[TSWOverlayPanelView setBottomHairlineEnabled:](-[THWAdornmentPanel view](self->_topPanel, "view"), "setBottomHairlineEnabled:", 1);
  -[THWAdornmentController p_combineBottomAndControlPanels](self, "p_combineBottomAndControlPanels");
  bottomPanel = self->_bottomPanel;
  if (bottomPanel || (bottomPanel = self->_controlPanel) != 0)
    -[TSWOverlayPanelView setTopHairlineEnabled:](-[THWAdornmentPanel view](bottomPanel, "view"), "setTopHairlineEnabled:", 1);
  if (-[THWAdornmentController appearance](self, "appearance") == 1)
    v13 = -[THWAdornmentController hasRoomForPanels](self, "hasRoomForPanels") ^ 1;
  else
    v13 = 1;
  v14 = [THWAdornmentCloseButton alloc];
  -[THWAdornmentController closeButtonFrame](self, "closeButtonFrame");
  -[THWAdornmentController setCloseButton:](self, "setCloseButton:", -[THWAdornmentCloseButton initWithFrame:theme:](v14, "initWithFrame:theme:", v13));
  -[THWAdornmentCloseButton setTarget:action:](-[THWAdornmentController closeButton](self, "closeButton"), "setTarget:action:", self, "p_handleClose:");
  -[THWAdornmentCloseButton setEnabled:](-[THWAdornmentController closeButton](self, "closeButton"), "setEnabled:", 1);
}

- (double)p_statusBarOffset
{
  return 0.0;
}

- (CGRect)closeButtonFrame
{
  CGFloat v3;
  CGFloat v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGRect result;

  v3 = CGRectGetMinX(self->_layoutFrame) + 5.0;
  v4 = CGRectGetMinY(self->_layoutFrame) + 0.0;
  -[THWAdornmentController p_statusBarOffset](self, "p_statusBarOffset");
  v6 = v4 + v5;
  v7 = 100.0;
  v8 = v3;
  v9 = 100.0;
  result.size.height = v9;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v8;
  return result;
}

- (void)p_updateCloseButton
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;

  -[THWAdornmentController closeButtonFrame](self, "closeButtonFrame");
  v4 = v3;
  v6 = v5;
  -[THWAdornmentCloseButton frame](-[THWAdornmentController closeButton](self, "closeButton"), "frame");
  -[THWAdornmentCloseButton setFrame:](-[THWAdornmentController closeButton](self, "closeButton"), "setFrame:", v4, v6, v7, v8);
  -[THWAdornmentCloseButton updateImage](-[THWAdornmentController closeButton](self, "closeButton"), "updateImage");
}

- (BOOL)attemptToPerformCloseButtonAction
{
  THWAdornmentCloseButton *v3;

  v3 = -[THWAdornmentController closeButton](self, "closeButton");
  if (v3)
  {
    if ((-[THWAdornmentCloseButton isHidden](-[THWAdornmentController closeButton](self, "closeButton"), "isHidden") & 1) != 0|| -[THWAdornmentController animatingVisibilityCount](self, "animatingVisibilityCount"))
    {
      LOBYTE(v3) = 0;
    }
    else
    {
      -[THWAdornmentCloseButton sendActionsForControlEvents:](-[THWAdornmentController closeButton](self, "closeButton"), "sendActionsForControlEvents:", 64);
      LOBYTE(v3) = 1;
    }
  }
  return (char)v3;
}

- (BOOL)p_panelVisible:(int)a3 default:(BOOL)a4 forced:(BOOL)a5
{
  _BOOL8 v5;
  uint64_t v6;

  v5 = a4;
  if (a5)
    return v5;
  v6 = *(_QWORD *)&a3;
  if ((objc_opt_respondsToSelector(self->_expandedRep, "expandedPanel:isVisibleWithDefault:", *(_QWORD *)&a3) & 1) == 0)
    return v5;
  else
    return -[THWExpandedRep expandedPanel:isVisibleWithDefault:](self->_expandedRep, "expandedPanel:isVisibleWithDefault:", v6, v5);
}

- (void)p_updateAdornmentVisibilityAnimated:(BOOL)a3 forced:(BOOL)a4 completionBlock:(id)a5
{
  _BOOL8 v6;
  _BOOL4 v7;
  _BOOL8 v9;
  _BOOL8 v10;
  _BOOL8 v11;
  _BOOL8 v12;
  _BOOL8 v13;
  _BOOL8 v14;
  double v15;
  double v16;
  double v17;
  double v18;
  unint64_t animatingVisibilityCount;
  id v20;
  double v21;
  _QWORD v22[10];
  _QWORD v23[5];
  BOOL v24;

  v6 = a4;
  v7 = a3;
  v9 = self->_adornmentsVisible && -[THWAdornmentController hasRoomForPanels](self, "hasRoomForPanels");
  v10 = -[THWAdornmentController p_panelVisible:default:forced:](self, "p_panelVisible:default:forced:", 0, v9, v6);
  v11 = self->_adornmentsVisible && -[THWAdornmentController hasRoomForPanels](self, "hasRoomForPanels");
  v12 = -[THWAdornmentController p_panelVisible:default:forced:](self, "p_panelVisible:default:forced:", 1, v11, v6);
  v13 = -[THWAdornmentController p_panelVisible:default:forced:](self, "p_panelVisible:default:forced:", 2, self->_controlsVisible, v6);
  v14 = v13;
  if (self->_buttonVisible)
    v15 = 1.0;
  else
    v15 = 0.0;
  if (v10)
    v16 = 1.0;
  else
    v16 = 0.0;
  if (v12)
    v17 = 1.0;
  else
    v17 = 0.0;
  if (v13)
    v18 = 1.0;
  else
    v18 = 0.0;
  if ((objc_opt_respondsToSelector(-[THWAdornmentController delegate](self, "delegate"), "shouldShowCloseButton") & 1) != 0
    && !-[THWAdornmentControllerDelegate shouldShowCloseButton](-[THWAdornmentController delegate](self, "delegate"), "shouldShowCloseButton"))
  {
    v15 = 0.0;
  }
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1350E8;
  v23[3] = &unk_427268;
  v23[4] = self;
  v24 = v10;
  if (v7)
  {
    animatingVisibilityCount = self->_animatingVisibilityCount;
    if (!animatingVisibilityCount)
    {
      -[TSWOverlayPanelView alphaAnimationWillBegin](-[THWAdornmentPanel view](-[THWAdornmentController topPanel](self, "topPanel"), "view"), "alphaAnimationWillBegin");
      -[TSWOverlayPanelView alphaAnimationWillBegin](-[THWAdornmentPanel view](-[THWAdornmentController bottomPanel](self, "bottomPanel"), "view"), "alphaAnimationWillBegin");
      -[TSWOverlayPanelView alphaAnimationWillBegin](-[THWAdornmentPanel view](-[THWAdornmentController controlPanel](self, "controlPanel"), "view"), "alphaAnimationWillBegin");
      animatingVisibilityCount = self->_animatingVisibilityCount;
    }
    self->_animatingVisibilityCount = animatingVisibilityCount + 1;
    +[CATransaction begin](CATransaction, "begin");
    +[CATransaction setAnimationTimingFunction:](CATransaction, "setAnimationTimingFunction:", +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseInEaseOut));
    +[CATransaction setAnimationDuration:](CATransaction, "setAnimationDuration:", 0.4);
    if ((objc_opt_respondsToSelector(self->_expandedRep, "expandedPanel:willAnimateToVisible:duration:") & 1) != 0)
    {
      if (self->_topPanel)
        -[THWExpandedRep expandedPanel:willAnimateToVisible:duration:](self->_expandedRep, "expandedPanel:willAnimateToVisible:duration:", 0, v10, 0.4);
      if (self->_bottomPanel)
        -[THWExpandedRep expandedPanel:willAnimateToVisible:duration:](self->_expandedRep, "expandedPanel:willAnimateToVisible:duration:", 1, v12, 0.4);
      if (self->_controlPanel)
        -[THWExpandedRep expandedPanel:willAnimateToVisible:duration:](self->_expandedRep, "expandedPanel:willAnimateToVisible:duration:", 2, v14, 0.4);
    }
    sub_1350E8((uint64_t)v23);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_135178;
    v22[3] = &unk_429EE8;
    *(double *)&v22[6] = v15;
    *(double *)&v22[7] = v16;
    *(double *)&v22[8] = v17;
    *(double *)&v22[9] = v18;
    v22[4] = self;
    v22[5] = a5;
    +[CATransaction setCompletionBlock:](CATransaction, "setCompletionBlock:", v22);
    -[THWAdornmentCloseButton setHidden:](-[THWAdornmentController closeButton](self, "closeButton"), "setHidden:", 0);
    -[TSWOverlayPanelView setHidden:](-[THWAdornmentPanel view](-[THWAdornmentController topPanel](self, "topPanel"), "view"), "setHidden:", 0);
    -[TSWOverlayPanelView setHidden:](-[THWAdornmentPanel view](-[THWAdornmentController bottomPanel](self, "bottomPanel"), "view"), "setHidden:", 0);
    -[TSWOverlayPanelView setHidden:](-[THWAdornmentPanel view](-[THWAdornmentController controlPanel](self, "controlPanel"), "view"), "setHidden:", 0);
    v20 = -[THWAdornmentCloseButton layer](-[THWAdornmentController closeButton](self, "closeButton"), "layer");
    v21 = 0.0;
    if (v15 == 0.0)
      v21 = 0.3;
    objc_msgSend(v20, "addCABasicOpacityAnimationToValue:duration:removedOnCompletion:", 0, v15, v21);
    objc_msgSend(-[TSWOverlayPanelView layer](-[THWAdornmentPanel view](-[THWAdornmentController topPanel](self, "topPanel"), "view"), "layer"), "addCABasicOpacityAnimationToValue:duration:removedOnCompletion:", 0, v16, 0.0);
    objc_msgSend(-[TSWOverlayPanelView layer](-[THWAdornmentPanel view](-[THWAdornmentController bottomPanel](self, "bottomPanel"), "view"), "layer"), "addCABasicOpacityAnimationToValue:duration:removedOnCompletion:", 0, v17, 0.0);
    objc_msgSend(-[TSWOverlayPanelView layer](-[THWAdornmentPanel view](-[THWAdornmentController controlPanel](self, "controlPanel"), "view"), "layer"), "addCABasicOpacityAnimationToValue:duration:removedOnCompletion:", 0, v18, 0.0);
  }
  else
  {
    +[CATransaction begin](CATransaction, "begin");
    +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
    sub_1350E8((uint64_t)v23);
    objc_msgSend(-[THWAdornmentCloseButton layer](-[THWAdornmentController closeButton](self, "closeButton"), "layer"), "removeAnimationForKey:", CFSTR("opacity"));
    objc_msgSend(-[TSWOverlayPanelView layer](-[THWAdornmentPanel view](-[THWAdornmentController topPanel](self, "topPanel"), "view"), "layer"), "removeAnimationForKey:", CFSTR("opacity"));
    objc_msgSend(-[TSWOverlayPanelView layer](-[THWAdornmentPanel view](-[THWAdornmentController bottomPanel](self, "bottomPanel"), "view"), "layer"), "removeAnimationForKey:", CFSTR("opacity"));
    objc_msgSend(-[TSWOverlayPanelView layer](-[THWAdornmentPanel view](-[THWAdornmentController controlPanel](self, "controlPanel"), "view"), "layer"), "removeAnimationForKey:", CFSTR("opacity"));
    -[THWAdornmentCloseButton setTsdAlpha:](-[THWAdornmentController closeButton](self, "closeButton"), "setTsdAlpha:", v15);
    -[TSWOverlayPanelView setTsdAlpha:](-[THWAdornmentPanel view](-[THWAdornmentController topPanel](self, "topPanel"), "view"), "setTsdAlpha:", v16);
    -[TSWOverlayPanelView setTsdAlpha:](-[THWAdornmentPanel view](-[THWAdornmentController bottomPanel](self, "bottomPanel"), "view"), "setTsdAlpha:", v17);
    -[TSWOverlayPanelView setTsdAlpha:](-[THWAdornmentPanel view](-[THWAdornmentController controlPanel](self, "controlPanel"), "view"), "setTsdAlpha:", v18);
    -[THWAdornmentCloseButton setHidden:](-[THWAdornmentController closeButton](self, "closeButton"), "setHidden:", v15 == 0.0);
    -[TSWOverlayPanelView setHidden:](-[THWAdornmentPanel view](-[THWAdornmentController topPanel](self, "topPanel"), "view"), "setHidden:", v16 == 0.0);
    -[TSWOverlayPanelView setHidden:](-[THWAdornmentPanel view](-[THWAdornmentController bottomPanel](self, "bottomPanel"), "view"), "setHidden:", v17 == 0.0);
    -[TSWOverlayPanelView setHidden:](-[THWAdornmentPanel view](-[THWAdornmentController controlPanel](self, "controlPanel"), "view"), "setHidden:", v18 == 0.0);
    if (a5)
      (*((void (**)(id))a5 + 2))(a5);
  }
  +[CATransaction commit](CATransaction, "commit");
}

- (void)p_handleClose:(id)a3
{
  if (!-[THWAdornmentController animatingVisibilityCount](self, "animatingVisibilityCount", a3))
    -[THWAdornmentControllerDelegate handleCloseForAdornmentController:](-[THWAdornmentController delegate](self, "delegate"), "handleCloseForAdornmentController:", self);
}

- (void)p_layoutPanels
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  THWAdornmentPanel *bottomPanel;
  double v11;
  TSWOverlayPanelView *v12;
  double v13;
  double v14;
  double v15;

  if (self->_panelLayoutDisabledCount)
    return;
  -[THWAdornmentControllerDelegate safeAreaInsetsForAdornmentController:](-[THWAdornmentController delegate](self, "delegate"), "safeAreaInsetsForAdornmentController:", self);
  v4 = v3;
  v7 = -v6;
  v9 = -v8;
  -[TSWOverlayPanelView setAdditionalBackgroundInset:](-[THWAdornmentPanel view](self->_topPanel, "view"), "setAdditionalBackgroundInset:", -v5, -v6, 0.0, -v8);
  bottomPanel = self->_bottomPanel;
  if (!bottomPanel)
  {
    v11 = -v4;
    bottomPanel = self->_controlPanel;
    goto LABEL_7;
  }
  v11 = -v4;
  if (!self->_controlPanel)
  {
LABEL_7:
    v12 = -[THWAdornmentPanel view](bottomPanel, "view");
    v14 = v7;
    v13 = v11;
    goto LABEL_8;
  }
  -[TSWOverlayPanelView setAdditionalBackgroundInset:](-[THWAdornmentPanel view](self->_controlPanel, "view"), "setAdditionalBackgroundInset:", 0.0, v7, v11, v9);
  v12 = -[THWAdornmentPanel view](self->_bottomPanel, "view");
  v13 = 0.0;
  v14 = v7;
LABEL_8:
  -[TSWOverlayPanelView setAdditionalBackgroundInset:](v12, "setAdditionalBackgroundInset:", 0.0, v14, v13, v9);
  -[THWAdornmentPanel layoutPanel](self->_topPanel, "layoutPanel");
  -[THWAdornmentPanel layoutPanel](self->_controlPanel, "layoutPanel");
  -[THWAdornmentPanel layoutPanel](self->_bottomPanel, "layoutPanel");
  if (self->_bottomPanel && self->_controlPanel)
  {
    if (-[THWAdornmentController p_combineBottomAndControlPanels](self, "p_combineBottomAndControlPanels"))
    {
      -[THWAdornmentPanel height](self->_controlPanel, "height");
      -[TSWOverlayPanelView setAdditionalShadowInset:](-[THWAdornmentPanel view](self->_bottomPanel, "view"), "setAdditionalShadowInset:", 0.0, 0.0, -v15, 0.0);
      -[TSWOverlayPanelView setBackdropGroupName:](-[THWAdornmentPanel view](self->_controlPanel, "view"), "setBackdropGroupName:", CFSTR("THWAdornmentControllerSharedBackdrop"));
      -[TSWOverlayPanelView setBackdropGroupName:](-[THWAdornmentPanel view](self->_bottomPanel, "view"), "setBackdropGroupName:", CFSTR("THWAdornmentControllerSharedBackdrop"));
    }
  }
}

- (void)layoutInFrame:(CGRect)a3
{
  self->_layoutFrame = a3;
  -[THWAdornmentController p_layoutPanels](self, "p_layoutPanels");
  -[THWAdornmentController p_updateCloseButton](self, "p_updateCloseButton");
  -[THWAdornmentController invalidateLayouts](self, "invalidateLayouts");
  -[THWAdornmentController p_updateAdornmentVisibilityAnimated:forced:completionBlock:](self, "p_updateAdornmentVisibilityAnimated:forced:completionBlock:", 0, 0, 0);
}

- (void)addAdornmentViewsToView:(id)a3
{
  THWAdornmentPanel *topPanel;
  THWAdornmentPanel *bottomPanel;
  THWAdornmentPanel *controlPanel;

  +[CATransaction begin](CATransaction, "begin");
  if (!-[THWAdornmentController closeButton](self, "closeButton")
    || -[THWExpandedRep expandedHasContentForPanel:](self->_expandedRep, "expandedHasContentForPanel:", 0)&& !self->_topPanel|| -[THWExpandedRep expandedHasContentForPanel:](self->_expandedRep, "expandedHasContentForPanel:", 1)&& !self->_bottomPanel|| -[THWExpandedRep expandedHasContentForPanel:](self->_expandedRep, "expandedHasContentForPanel:", 2)&& !self->_controlPanel)
  {
    -[THWAdornmentController p_createViews](self, "p_createViews");
  }
  topPanel = self->_topPanel;
  if (topPanel)
    objc_msgSend(a3, "addSubview:", -[THWAdornmentPanel view](topPanel, "view"));
  bottomPanel = self->_bottomPanel;
  if (bottomPanel)
    objc_msgSend(a3, "addSubview:", -[THWAdornmentPanel view](bottomPanel, "view"));
  controlPanel = self->_controlPanel;
  if (controlPanel)
    objc_msgSend(a3, "addSubview:", -[THWAdornmentPanel view](controlPanel, "view"));
  if (self->_closeButton)
    objc_msgSend(a3, "addSubview:");
  if (self->_bottomPanel
    && self->_controlPanel
    && -[THWAdornmentController p_combineBottomAndControlPanels](self, "p_combineBottomAndControlPanels"))
  {
    -[TSWOverlayPanelView setShadowOpacity:](-[THWAdornmentPanel view](self->_controlPanel, "view"), "setShadowOpacity:", 0.0);
  }
  -[THWAdornmentController setAdornmentsVisible:buttonVisible:controlsVisible:forceVisibility:animated:completionBlock:](self, "setAdornmentsVisible:buttonVisible:controlsVisible:forceVisibility:animated:completionBlock:", 0, 0, 0, 0, 0, 0);
  +[CATransaction commit](CATransaction, "commit");
}

- (id)adornmentTrackingRects
{
  id v3;
  unsigned int v4;
  TSWOverlayPanelView *v5;
  double v6;
  double v7;
  THWAdornmentPanel *bottomPanel;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  double v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  uint64_t v31;
  double v32;
  double y;
  double v34;
  THWAdornmentPanel *controlPanel;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  CGRect v43;
  CGRect v44;

  v3 = +[NSMutableArray array](NSMutableArray, "array");
  if (self->_topPanel)
  {
    v4 = -[THWAdornmentPanel hasBeenSized](-[THWAdornmentController topPanel](self, "topPanel"), "hasBeenSized");
    v5 = -[THWAdornmentPanel view](-[THWAdornmentController topPanel](self, "topPanel"), "view");
    if (v4)
    {
      -[TSWOverlayPanelView frame](v5, "frame");
    }
    else
    {
      objc_msgSend(-[TSWOverlayPanelView superview](v5, "superview"), "frame");
      v6 = 0.0;
      v7 = 0.0;
    }
    objc_msgSend(v3, "addObject:", +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", v6, v7));
  }
  bottomPanel = self->_bottomPanel;
  if (bottomPanel)
  {
    if (self->_controlPanel)
    {
      if (-[THWAdornmentPanel hasBeenSized](bottomPanel, "hasBeenSized"))
      {
        -[TSWOverlayPanelView frame](-[THWAdornmentPanel view](self->_bottomPanel, "view"), "frame");
        v10 = v9;
        v12 = v11;
        v14 = v13;
        v16 = v15;
      }
      else
      {
        objc_msgSend(-[TSWOverlayPanelView superview](-[THWAdornmentPanel view](-[THWAdornmentController bottomPanel](self, "bottomPanel"), "view"), "superview"), "frame");
        v12 = v20 + -44.0;
        objc_msgSend(-[TSWOverlayPanelView superview](-[THWAdornmentPanel view](-[THWAdornmentController bottomPanel](self, "bottomPanel"), "view"), "superview"), "frame");
        v14 = v21;
        v10 = 0.0;
        v16 = 44.0;
      }
      if (-[THWAdornmentPanel hasBeenSized](self->_controlPanel, "hasBeenSized"))
      {
        -[TSWOverlayPanelView frame](-[THWAdornmentPanel view](self->_controlPanel, "view"), "frame");
        v23 = v22;
        v25 = v24;
        v27 = v26;
        v29 = v28;
      }
      else
      {
        objc_msgSend(-[TSWOverlayPanelView superview](-[THWAdornmentPanel view](-[THWAdornmentController controlPanel](self, "controlPanel"), "view"), "superview"), "frame");
        v25 = v30 + -44.0;
        objc_msgSend(-[TSWOverlayPanelView superview](-[THWAdornmentPanel view](-[THWAdornmentController controlPanel](self, "controlPanel"), "view"), "superview"), "frame");
        v27 = v31;
        v23 = 0;
        v29 = 0x4046000000000000;
      }
      v43.origin.x = v10;
      v43.origin.y = v12;
      v43.size.width = v14;
      v43.size.height = v16;
      v32 = v25;
      v44 = CGRectUnion(v43, *(CGRect *)&v23);
      y = v44.origin.y;
      goto LABEL_23;
    }
    if (-[THWAdornmentPanel hasBeenSized](bottomPanel, "hasBeenSized"))
    {
      -[TSWOverlayPanelView frame](-[THWAdornmentPanel view](self->_bottomPanel, "view"), "frame");
      v19 = v18;
    }
    else
    {
      objc_msgSend(-[TSWOverlayPanelView superview](-[THWAdornmentPanel view](-[THWAdornmentController bottomPanel](self, "bottomPanel"), "view"), "superview"), "frame");
      v19 = v34 + -44.0;
      objc_msgSend(-[TSWOverlayPanelView superview](-[THWAdornmentPanel view](-[THWAdornmentController bottomPanel](self, "bottomPanel"), "view"), "superview"), "frame");
      v17 = 0.0;
    }
    objc_msgSend(v3, "addObject:", +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", v17, v19));
  }
  controlPanel = self->_controlPanel;
  if (controlPanel)
  {
    if (-[THWAdornmentPanel hasBeenSized](controlPanel, "hasBeenSized"))
    {
      -[TSWOverlayPanelView frame](-[THWAdornmentPanel view](self->_controlPanel, "view"), "frame");
      y = v36;
    }
    else
    {
      objc_msgSend(-[TSWOverlayPanelView superview](-[THWAdornmentPanel view](-[THWAdornmentController controlPanel](self, "controlPanel"), "view"), "superview"), "frame");
      y = v37 + -44.0;
      objc_msgSend(-[TSWOverlayPanelView superview](-[THWAdornmentPanel view](-[THWAdornmentController controlPanel](self, "controlPanel"), "view"), "superview"), "frame");
      v44.origin.x = 0.0;
      v44.size.height = 44.0;
    }
LABEL_23:
    objc_msgSend(v3, "addObject:", +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", v44.origin.x, y, v44.size.width, v44.size.height));
  }
  if (!self->_topPanel && -[THWAdornmentController closeButton](self, "closeButton"))
  {
    -[THWAdornmentCloseButton frame](-[THWAdornmentController closeButton](self, "closeButton"), "frame");
    v39 = v38;
    objc_msgSend(-[THWAdornmentCloseButton superview](-[THWAdornmentController closeButton](self, "closeButton"), "superview"), "frame");
    v41 = v40;
    -[THWAdornmentCloseButton frame](-[THWAdornmentController closeButton](self, "closeButton"), "frame");
    objc_msgSend(v3, "addObject:", +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", 0.0, v39, v41));
  }
  return v3;
}

- (void)controllerWillAnimateToSize:(CGSize)a3 duration:(double)a4 inFrame:(CGRect)a5
{
  uint64_t v7;

  self->_layoutFrame = a5;
  ++self->_panelLayoutDisabledCount;
  v7 = 1;
  -[THWAdornmentPanel animateWithCrossFadeContent:backgroundLayout:duration:](self->_topPanel, "animateWithCrossFadeContent:backgroundLayout:duration:", 1, 0, a4, a3.height);
  -[THWAdornmentPanel animateWithCrossFadeContent:backgroundLayout:duration:](self->_bottomPanel, "animateWithCrossFadeContent:backgroundLayout:duration:", 1, 0, a4);
  -[THWAdornmentPanel animateWithCrossFadeContent:backgroundLayout:duration:](self->_controlPanel, "animateWithCrossFadeContent:backgroundLayout:duration:", 1, 0, a4);
  -[THWAdornmentController invalidateLayouts](self, "invalidateLayouts");
  if (!-[THWAdornmentController adornmentsVisible](self, "adornmentsVisible"))
    v7 = -[THWAdornmentController hasRoomForPanels](self, "hasRoomForPanels") ^ 1;
  -[THWAdornmentController setAdornmentsVisible:](self, "setAdornmentsVisible:", v7);
  --self->_panelLayoutDisabledCount;
  -[THWAdornmentController p_layoutPanels](self, "p_layoutPanels");
}

- (void)invalidateLayouts
{
  -[THWAdornmentPanel invalidateLayoutsAndFrames](self->_topPanel, "invalidateLayoutsAndFrames");
  -[THWAdornmentPanel invalidateLayoutsAndFrames](self->_bottomPanel, "invalidateLayoutsAndFrames");
  -[THWAdornmentPanel invalidateLayoutsAndFrames](self->_controlPanel, "invalidateLayoutsAndFrames");
  -[THWAdornmentPanel layoutIfNeeded](self->_topPanel, "layoutIfNeeded");
  -[THWAdornmentPanel layoutIfNeeded](self->_bottomPanel, "layoutIfNeeded");
  -[THWAdornmentPanel layoutIfNeeded](self->_controlPanel, "layoutIfNeeded");
  -[THWAdornmentController p_updateCloseButton](self, "p_updateCloseButton");
}

- (void)toggleVisibility
{
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWAdornmentController toggleVisibility]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Drawables/THWAdornmentController.m"), 1292, CFSTR("Manipulating UI outside main thread."));
  -[THWAdornmentController setAdornmentsVisible:animated:completionBlock:](self, "setAdornmentsVisible:animated:completionBlock:", -[THWAdornmentController adornmentsVisible](self, "adornmentsVisible") ^ 1, 1, 0);
}

- (BOOL)p_combineBottomAndControlPanels
{
  if ((objc_opt_respondsToSelector(self->_expandedRep, "expandedShouldCombineBottomAndControlPanels") & 1) != 0)
    return -[THWExpandedRep expandedShouldCombineBottomAndControlPanels](self->_expandedRep, "expandedShouldCombineBottomAndControlPanels");
  else
    return 0;
}

- (BOOL)p_controlsVisibleWithAdornmentsVisible:(BOOL)a3
{
  return !-[THWAdornmentController p_combineBottomAndControlPanels](self, "p_combineBottomAndControlPanels") || a3;
}

- (void)setAdornmentsVisible:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  self->_adornmentsVisible = a3;
  self->_buttonVisible = -[THWAdornmentController p_forceButtonVisible](self, "p_forceButtonVisible") || a3;
  self->_controlsVisible = -[THWAdornmentController p_controlsVisibleWithAdornmentsVisible:](self, "p_controlsVisibleWithAdornmentsVisible:", v3);
  -[THWAdornmentController p_updateAdornmentVisibilityAnimated:forced:completionBlock:](self, "p_updateAdornmentVisibilityAnimated:forced:completionBlock:", 0, 0, 0);
}

- (void)updateVisibility
{
  -[THWAdornmentController p_updateAdornmentVisibilityAnimated:forced:completionBlock:](self, "p_updateAdornmentVisibilityAnimated:forced:completionBlock:", 0, 0, 0);
}

- (void)setAdornmentsVisible:(BOOL)a3 animated:(BOOL)a4 completionBlock:(id)a5
{
  -[THWAdornmentController setAdornmentsVisible:buttonVisible:controlsVisible:forceVisibility:animated:completionBlock:](self, "setAdornmentsVisible:buttonVisible:controlsVisible:forceVisibility:animated:completionBlock:", a3, a3, -[THWAdornmentController p_controlsVisibleWithAdornmentsVisible:](self, "p_controlsVisibleWithAdornmentsVisible:"), 0, a4, a5);
}

- (void)setAdornmentsVisible:(BOOL)a3 buttonVisible:(BOOL)a4 controlsVisible:(BOOL)a5 forceVisibility:(BOOL)a6 animated:(BOOL)a7 completionBlock:(id)a8
{
  _BOOL8 v9;
  _BOOL8 v10;

  v9 = a7;
  v10 = a6;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWAdornmentController setAdornmentsVisible:buttonVisible:controlsVisible:forceVisibility:animated:completionBlock:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Drawables/THWAdornmentController.m"), 1337, CFSTR("Manipulating UI outside main thread."));
  self->_adornmentsVisible = a3;
  if (!v10)
  {
    a4 |= -[THWAdornmentController p_forceButtonVisible](self, "p_forceButtonVisible");
    a5 |= a3;
  }
  self->_buttonVisible = a4;
  self->_controlsVisible = a5;
  -[THWAdornmentController p_updateAdornmentVisibilityAnimated:forced:completionBlock:](self, "p_updateAdornmentVisibilityAnimated:forced:completionBlock:", v9, v10, a8);
}

- (BOOL)hasRoomForPanels
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;

  if ((objc_opt_respondsToSelector(self->_expandedRep, "expandedHasRoomForPanelsWithHeight:inFrame:") & 1) == 0)
    return 1;
  -[THWAdornmentPanel layoutIfNeeded](self->_topPanel, "layoutIfNeeded");
  -[THWAdornmentPanel layoutIfNeeded](self->_bottomPanel, "layoutIfNeeded");
  -[THWAdornmentPanel layoutIfNeeded](self->_controlPanel, "layoutIfNeeded");
  -[THWAdornmentPanel height](self->_topPanel, "height");
  v4 = v3;
  -[THWAdornmentPanel height](self->_bottomPanel, "height");
  v6 = v4 + v5;
  -[THWAdornmentPanel height](self->_controlPanel, "height");
  v8 = v6 + v7;
  if (v8 == 0.0)
    v8 = 44.0;
  return -[THWExpandedRep expandedHasRoomForPanelsWithHeight:inFrame:](self->_expandedRep, "expandedHasRoomForPanelsWithHeight:inFrame:", v8, self->_layoutFrame.origin.x, self->_layoutFrame.origin.y, self->_layoutFrame.size.width, self->_layoutFrame.size.height);
}

- (BOOL)p_forceButtonVisible
{
  if ((objc_opt_respondsToSelector(self->_expandedRep, "expandedWantsButtonVisibleWhenNoPanels") & 1) != 0
    && !-[THWAdornmentController hasRoomForPanels](self, "hasRoomForPanels"))
  {
    return -[THWExpandedRep expandedWantsButtonVisibleWhenNoPanels](self->_expandedRep, "expandedWantsButtonVisibleWhenNoPanels");
  }
  else
  {
    return 0;
  }
}

- (double)adornmentPanelMinHeight:(id)a3
{
  double v5;
  double result;

  if (objc_msgSend(a3, "kind") >= 3)
    v5 = 0.0;
  else
    v5 = 44.0;
  if ((objc_opt_respondsToSelector(self->_expandedRep, "expandedMinHeightForPanel:withDefault:") & 1) == 0)
    return v5;
  -[THWExpandedRep expandedMinHeightForPanel:withDefault:](self->_expandedRep, "expandedMinHeightForPanel:withDefault:", objc_msgSend(a3, "kind"), v5);
  return result;
}

- (CGRect)adornmentPanel:(id)a3 frameForSize:(CGSize)a4
{
  uint64_t v6;
  double v7;
  double v8;
  CGFloat v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGFloat MinX;
  double MinY;
  unsigned int v16;
  double v17;
  double v18;
  double v19;
  double MaxY;
  double v21;
  double v22;
  double v23;
  double v24;
  CGRect v25;
  CGRect v26;
  CGRect result;

  TSDRoundedSize(a4.width);
  v7 = TSDRectWithSize(v6);
  v9 = v8;
  v11 = v10;
  -[THWAdornmentController adornmentPanelMinHeight:](self, "adornmentPanelMinHeight:", a3, v7);
  v13 = fmax(v11, v12);
  MinX = CGRectGetMinX(self->_layoutFrame);
  MinY = CGRectGetMinY(self->_layoutFrame);
  v16 = objc_msgSend(a3, "kind");
  if (v16 == 2)
  {
    MaxY = CGRectGetMaxY(self->_layoutFrame);
    v26.origin.x = MinX;
    v26.origin.y = MinY;
    v26.size.width = v9;
    v26.size.height = v13;
    MinY = MaxY - CGRectGetHeight(v26);
  }
  else if (v16 == 1)
  {
    v17 = CGRectGetMaxY(self->_layoutFrame);
    v25.origin.x = MinX;
    v25.origin.y = MinY;
    v25.size.width = v9;
    v25.size.height = v13;
    v18 = v17 - CGRectGetHeight(v25);
    -[THWAdornmentPanel height](self->_controlPanel, "height");
    MinY = v18 - v19;
  }
  v21 = MinX;
  v22 = MinY;
  v23 = v9;
  v24 = v13;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (BOOL)adornmentDisablePanelAnimation:(id)a3
{
  return self->_disablePanelFrameAnimation;
}

- (void)adornmentPanelDidLayout:(id)a3
{
  -[THWAdornmentController p_layoutPanels](self, "p_layoutPanels", a3);
  if ((objc_opt_respondsToSelector(-[THWAdornmentController delegate](self, "delegate"), "updateTrackingRectsForAdornmentController:") & 1) != 0)-[THWAdornmentControllerDelegate updateTrackingRectsForAdornmentController:](-[THWAdornmentController delegate](self, "delegate"), "updateTrackingRectsForAdornmentController:", self);
}

- (double)adornmentPanelWidth:(id)a3
{
  return self->_layoutFrame.size.width;
}

- (double)adornmentPanelFontSize:(id)a3
{
  unsigned int v3;
  double result;

  v3 = objc_msgSend(a3, "kind");
  result = 10.0;
  if (v3 < 3)
    return 14.0;
  return result;
}

- (id)adornmentPanelFontName:(id)a3
{
  id v3;
  uint64_t v4;

  v3 = objc_msgSend(a3, "kind");
  if ((_DWORD)v3 || !TSUPhoneUI(v3, v4))
    return 0;
  else
    return objc_msgSend(+[TSUFont systemFontOfSize:](TSUFont, "systemFontOfSize:", 14.0), "fontName");
}

- (double)adornmentPanelTitleLeftIndent:(id)a3
{
  return 34.0;
}

- (id)p_panelForKind:(int)a3
{
  if (a3 > 2)
    return 0;
  else
    return (id)*((_QWORD *)&self->_topPanel + a3);
}

- (void)invalidateChildrenInPanel:(int)a3
{
  objc_msgSend(-[THWAdornmentController p_panelForKind:](self, "p_panelForKind:", *(_QWORD *)&a3), "invalidateChildren");
}

- (void)invalidateWPAutoInPanel:(int)a3
{
  objc_msgSend(-[THWAdornmentController p_panelForKind:](self, "p_panelForKind:", *(_QWORD *)&a3), "invalidateWPAuto");
}

- (double)heightForPanel:(int)a3 allowDefault:(BOOL)a4
{
  id v6;
  double result;
  BOOL v8;

  v6 = -[THWAdornmentController p_panelForKind:](self, "p_panelForKind:");
  objc_msgSend(v6, "height");
  if (v6)
    v8 = 0;
  else
    v8 = a4;
  if (v8 && a3 < 3)
    return 44.0;
  return result;
}

- (void)animatePanel:(int)a3 withCrossFadeContent:(BOOL)a4 backgroundLayout:(BOOL)a5 duration:(double)a6
{
  objc_msgSend(-[THWAdornmentController p_panelForKind:](self, "p_panelForKind:", *(_QWORD *)&a3), "animateWithCrossFadeContent:backgroundLayout:duration:", a4, a5, a6);
}

- (BOOL)disablePanelFrameAnimation
{
  return self->_disablePanelFrameAnimation;
}

- (void)setDisablePanelFrameAnimation:(BOOL)a3
{
  self->_disablePanelFrameAnimation = a3;
}

- (BOOL)adornmentsVisible
{
  return self->_adornmentsVisible;
}

- (BOOL)buttonVisible
{
  return self->_buttonVisible;
}

- (void)setButtonVisible:(BOOL)a3
{
  self->_buttonVisible = a3;
}

- (BOOL)controlsVisible
{
  return self->_controlsVisible;
}

- (void)setControlsVisible:(BOOL)a3
{
  self->_controlsVisible = a3;
}

- (THWAdornmentControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (THWAdornmentControllerDelegate *)a3;
}

- (THWExpandedRep)expandedRep
{
  return self->_expandedRep;
}

- (TSKDocumentRoot)documentRoot
{
  return self->_documentRoot;
}

- (void)setDocumentRoot:(id)a3
{
  self->_documentRoot = (TSKDocumentRoot *)a3;
}

- (THWAdornmentCloseButton)closeButton
{
  return self->_closeButton;
}

- (void)setCloseButton:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (double)animationDuration
{
  return self->_animationDuration;
}

- (void)setAnimationDuration:(double)a3
{
  self->_animationDuration = a3;
}

- (CGRect)layoutFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_layoutFrame.origin.x;
  y = self->_layoutFrame.origin.y;
  width = self->_layoutFrame.size.width;
  height = self->_layoutFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setLayoutFrame:(CGRect)a3
{
  self->_layoutFrame = a3;
}

- (unint64_t)panelLayoutDisabledCount
{
  return self->_panelLayoutDisabledCount;
}

- (void)setPanelLayoutDisabledCount:(unint64_t)a3
{
  self->_panelLayoutDisabledCount = a3;
}

- (int)appearance
{
  return self->_appearance;
}

- (void)setAppearance:(int)a3
{
  self->_appearance = a3;
}

- (unint64_t)animatingVisibilityCount
{
  return self->_animatingVisibilityCount;
}

- (void)setAnimatingVisibilityCount:(unint64_t)a3
{
  self->_animatingVisibilityCount = a3;
}

- (THWAdornmentPanel)topPanel
{
  return self->_topPanel;
}

- (THWAdornmentPanel)bottomPanel
{
  return self->_bottomPanel;
}

- (THWAdornmentPanel)controlPanel
{
  return self->_controlPanel;
}

- (BOOL)tornDown
{
  return self->_tornDown;
}

- (void)setTornDown:(BOOL)a3
{
  self->_tornDown = a3;
}

@end
