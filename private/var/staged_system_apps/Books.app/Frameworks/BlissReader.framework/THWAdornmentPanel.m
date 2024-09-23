@implementation THWAdornmentPanel

- (THWAdornmentPanel)initWithDelegate:(id)a3 kind:(int)a4 expandedRep:(id)a5 documentRoot:(id)a6
{
  THWAdornmentPanel *v10;
  THWAdornmentPanel *v11;
  TSWOverlayPanelView *v12;
  double v13;
  double v14;
  double v15;
  TSWOverlayPanelView *v16;
  TSDCanvasView *v17;
  id v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)THWAdornmentPanel;
  v10 = -[THWAdornmentPanel init](&v20, "init");
  v11 = v10;
  if (v10)
  {
    v10->_delegate = (THWAdornmentPanelDelegate *)a3;
    v10->_kind = a4;
    v10->_stackedControlContainer = -[THWStackedControlContainer initWithDelegate:]([THWStackedControlContainer alloc], "initWithDelegate:", v10);
    v11->_autosizedCanvasController = -[THWAutosizedCanvasController initWithDelegate:documentRoot:]([THWAutosizedCanvasController alloc], "initWithDelegate:documentRoot:", v11, a6);
    v11->_expandedRep = (THWExpandedRep *)a5;
    v12 = [TSWOverlayPanelView alloc];
    -[THWAdornmentPanelDelegate adornmentPanelWidth:](v11->_delegate, "adornmentPanelWidth:", v11);
    v14 = v13;
    -[THWAdornmentPanelDelegate adornmentPanelMinHeight:](v11->_delegate, "adornmentPanelMinHeight:", v11);
    v16 = -[TSWOverlayPanelView initWithFrame:](v12, "initWithFrame:", 0.0, 0.0, v14, v15);
    v11->_view = v16;
    -[TSWOverlayPanelView setAutoresizingMask:](v16, "setAutoresizingMask:", 2);
    -[TSWOverlayPanelView setTsdAlpha:](v11->_view, "setTsdAlpha:", 0.0);
    v17 = -[THWAutosizedCanvasController canvasView](v11->_autosizedCanvasController, "canvasView");
    -[TSDCanvasView setTsdBackgroundColor:](v17, "setTsdBackgroundColor:", objc_msgSend(+[TSUColor clearColor](TSUColor, "clearColor"), "platformColor"));
    -[TSDCanvasView setUserInteractionEnabled:](v17, "setUserInteractionEnabled:", 1);
    -[TSDCanvasView setClipsToBounds:](v17, "setClipsToBounds:", 0);
    -[TSDInteractiveCanvasController setCreateRepsForOffscreenLayouts:](-[THWAutosizedCanvasController interactiveCanvasController](v11->_autosizedCanvasController, "interactiveCanvasController"), "setCreateRepsForOffscreenLayouts:", 1);
    -[TSWOverlayPanelView addSubview:](v11->_view, "addSubview:", v17);
    if (v11->_stackedControlContainer)
      -[TSDInteractiveCanvasController setInfosToDisplay:](-[THWAutosizedCanvasController interactiveCanvasController](v11->_autosizedCanvasController, "interactiveCanvasController"), "setInfosToDisplay:", +[NSArray arrayWithObject:](NSArray, "arrayWithObject:"));
    if ((objc_opt_respondsToSelector(v11->_expandedRep, "expandedAppearanceForPanel:") & 1) != 0)
      v18 = -[THWExpandedRep expandedAppearanceForPanel:](v11->_expandedRep, "expandedAppearanceForPanel:", v11->_kind);
    else
      v18 = &dword_0 + 1;
    -[TSWOverlayPanelView setAppearance:](v11->_view, "setAppearance:", v18);
  }
  return v11;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWAdornmentPanel;
  -[THWAdornmentPanel dealloc](&v3, "dealloc");
}

- (void)teardown
{
  -[THWAutosizedCanvasController teardown](self->_autosizedCanvasController, "teardown");
}

- (id)interactiveCanvasController
{
  return -[THWAutosizedCanvasController interactiveCanvasController](self->_autosizedCanvasController, "interactiveCanvasController");
}

- (void)invalidateChildren
{
  objc_msgSend(objc_msgSend(objc_msgSend(-[THWAdornmentPanel interactiveCanvasController](self, "interactiveCanvasController"), "layoutController"), "layoutForInfo:", self->_stackedControlContainer), "invalidateChildren");
}

- (void)invalidateWPAuto
{
  id v2;
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v2 = objc_msgSend(objc_msgSend(-[THWAdornmentPanel interactiveCanvasController](self, "interactiveCanvasController"), "layoutController"), "layoutForInfo:", self->_stackedControlContainer);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = objc_msgSend(v2, "children", 0);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v7);
        v9 = objc_opt_class(TSWPLayout);
        *(_QWORD *)&v10 = TSUDynamicCast(v9, v8).n128_u64[0];
        v12 = v11;
        objc_msgSend(v11, "invalidateTextLayout", v10);
        objc_msgSend(v12, "invalidateMaxAutoGrowWidth");
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }
}

- (void)layoutIfNeeded
{
  objc_msgSend(-[THWAdornmentPanel interactiveCanvasController](self, "interactiveCanvasController"), "layoutIfNeeded");
}

- (void)invalidateLayoutsAndFrames
{
  -[THWAutosizedCanvasController invalidateLayoutsAndFrames](self->_autosizedCanvasController, "invalidateLayoutsAndFrames");
  -[THWAdornmentPanel p_unhideViewIfNeeded](self, "p_unhideViewIfNeeded");
}

- (double)height
{
  TSWOverlayPanelView *view;
  double v3;

  view = self->_view;
  if (!view)
    return 0.0;
  -[TSWOverlayPanelView frame](view, "frame");
  return v3;
}

- (void)p_unhideViewIfNeeded
{
  id v3;
  double v4;

  if (-[TSWOverlayPanelView isHidden](self->_view, "isHidden"))
  {
    -[TSWOverlayPanelView setHidden:](self->_view, "setHidden:", 0);
    v3 = -[TSWOverlayPanelView layer](self->_view, "layer");
    LODWORD(v4) = 0;
    objc_msgSend(v3, "setOpacity:", v4);
  }
}

- (void)animateWithCrossFadeContent:(BOOL)a3 backgroundLayout:(BOOL)a4 duration:(double)a5
{
  _BOOL4 v6;
  _BOOL4 v7;
  TSDInteractiveCanvasController *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  -[THWAdornmentPanel p_unhideViewIfNeeded](self, "p_unhideViewIfNeeded");
  *(_WORD *)&self->_hasBeenSizedDuringAnimation = 256;
  self->_animationDuration = a5;
  v9 = -[THWAutosizedCanvasController interactiveCanvasController](self->_autosizedCanvasController, "interactiveCanvasController");
  if (v6)
    -[TSDInteractiveCanvasController forceBackgroundLayout](v9, "forceBackgroundLayout");
  if (v7)
  {
    v10 = +[CATransition animation](CATransition, "animation");
    objc_msgSend(v10, "setType:", kCATransitionFade);
    objc_msgSend(v10, "setDuration:", a5);
    objc_msgSend(-[TSDCanvasView layer](-[THWAutosizedCanvasController canvasView](self->_autosizedCanvasController, "canvasView"), "layer"), "addAnimation:forKey:", v10, CFSTR("fadeAnimation"));
  }
}

- (id)autosizedCanvasController:(id)a3 geometryProviderForLayout:(id)a4
{
  if ((objc_opt_respondsToSelector(self->_expandedRep, "expandedLayoutGeometryProvider", a3) & 1) != 0)
    return -[THWExpandedRep expandedLayoutGeometryProvider](self->_expandedRep, "expandedLayoutGeometryProvider");
  else
    return 0;
}

- (id)autosizedCanvasController:(id)a3 primaryTargetForGesture:(id)a4
{
  if ((objc_opt_respondsToSelector(self->_expandedRep, "expandedPanel:primaryTargetForGesture:", a3) & 1) != 0)
    return -[THWExpandedRep expandedPanel:primaryTargetForGesture:](self->_expandedRep, "expandedPanel:primaryTargetForGesture:", self->_kind, a4);
  else
    return 0;
}

- (BOOL)autosizedCanvasControllerIsRelatedCanvasScrolling:(id)a3
{
  if ((objc_opt_respondsToSelector(self->_expandedRep, "expandedIsRelatedCanvasScrolling", a3) & 1) != 0)
    return -[THWExpandedRep expandedIsRelatedCanvasScrolling](self->_expandedRep, "expandedIsRelatedCanvasScrolling");
  else
    return 0;
}

- (void)layoutPanel
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  _QWORD v11[5];
  _QWORD v12[9];
  CGRect v13;
  CGRect v14;

  -[THWAutosizedCanvasController canvasLayoutSize](self->_autosizedCanvasController, "canvasLayoutSize");
  if (!self->_hasBeenSized)
    -[THWAdornmentPanelDelegate adornmentPanelWidth:](self->_delegate, "adornmentPanelWidth:", self);
  -[THWAdornmentPanelDelegate adornmentPanel:frameForSize:](self->_delegate, "adornmentPanel:frameForSize:", self);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[TSWOverlayPanelView frame](self->_view, "frame");
  v14.origin.x = v4;
  v14.origin.y = v6;
  v14.size.width = v8;
  v14.size.height = v10;
  if (CGRectEqualToRect(v13, v14))
  {
    if (self->_hasBeenSizedDuringAnimation)
      self->_animatingPanel = 0;
    self->_hasBeenSizedDuringAnimation = 0;
  }
  else if (self->_animatingPanel && self->_animationDuration > 0.0)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_133DC0;
    v12[3] = &unk_427178;
    v12[4] = self;
    *(double *)&v12[5] = v4;
    *(double *)&v12[6] = v6;
    *(double *)&v12[7] = v8;
    *(double *)&v12[8] = v10;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_133DD4;
    v11[3] = &unk_427130;
    v11[4] = self;
    +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v12, v11);
  }
  else
  {
    +[CATransaction begin](CATransaction, "begin");
    +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
    -[TSWOverlayPanelView setFrame:](self->_view, "setFrame:", v4, v6, v8, v10);
    +[CATransaction commit](CATransaction, "commit");
    *(_WORD *)&self->_hasBeenSizedDuringAnimation = 0;
  }
}

- (void)p_didLayout
{
  self->_hasBeenSized = 1;
  if (self->_animatingPanel)
    self->_hasBeenSizedDuringAnimation = 1;
  -[THWAdornmentPanelDelegate adornmentPanelDidLayout:](self->_delegate, "adornmentPanelDidLayout:", self);
}

- (void)autosizedCanvasControllerDidResize:(id)a3
{
  if (+[NSThread isMainThread](NSThread, "isMainThread", a3))
    -[THWAdornmentPanel p_didLayout](self, "p_didLayout");
}

- (id)autosizedCanvasController:(id)a3 delegateConformingToProtocol:(id)a4 forRep:(id)a5
{
  id result;

  result = objc_msgSend(a5, "parentRep", a3);
  if (result)
  {
    if (protocol_isEqual((Protocol *)a4, (Protocol *)&OBJC_PROTOCOL___TSDLayoutGeometryProvider)
      && (objc_opt_respondsToSelector(self->_expandedRep, "expandedLayoutGeometryProvider") & 1) != 0)
    {
      return -[THWExpandedRep expandedLayoutGeometryProvider](self->_expandedRep, "expandedLayoutGeometryProvider");
    }
    else if (-[THWExpandedRep conformsToProtocol:](self->_expandedRep, "conformsToProtocol:", a4))
    {
      return self->_expandedRep;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (BOOL)autosizedCanvasController:(id)a3 allowsEditMenuForRep:(id)a4
{
  return 0;
}

- (BOOL)autosizedCanvasController:(id)a3 allowsSelectionForRep:(id)a4
{
  return 0;
}

- (BOOL)allowSelectionPopoverForAutosizedCanvasController:(id)a3
{
  return 0;
}

- (id)controlContainerChildInfosForLayout:(id)a3
{
  return -[THWExpandedRep expandedChildInfosForPanel:](self->_expandedRep, "expandedChildInfosForPanel:", self->_kind);
}

- (id)controlContainerAdditionalChildLayouts:(id)a3
{
  if ((objc_opt_respondsToSelector(self->_expandedRep, "expandedAdditionalChildLayoutsForPanel:", a3) & 1) != 0)
    return -[THWExpandedRep expandedAdditionalChildLayoutsForPanel:](self->_expandedRep, "expandedAdditionalChildLayoutsForPanel:", self->_kind);
  else
    return 0;
}

- (double)stackedControlContainerWidth:(id)a3
{
  double result;

  -[THWAdornmentPanelDelegate adornmentPanelWidth:](self->_delegate, "adornmentPanelWidth:", self);
  return result;
}

- (CGPoint)stackedControlContainerOrigin:(id)a3
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

- (UIEdgeInsets)stackedControlContainerInsets:(id)a3
{
  char v4;
  double v5;
  double v6;
  double v7;
  double v8;
  UIEdgeInsets result;

  v4 = objc_opt_respondsToSelector(self->_expandedRep, "expandedStackedControlContainerInsetsForPanel:withDefault:");
  v5 = 10.0;
  v6 = 10.0;
  v7 = 10.0;
  v8 = 10.0;
  if ((v4 & 1) != 0)
    -[THWExpandedRep expandedStackedControlContainerInsetsForPanel:withDefault:](self->_expandedRep, "expandedStackedControlContainerInsetsForPanel:withDefault:", self->_kind, 10.0, 10.0, 10.0, 10.0);
  result.right = v5;
  result.bottom = v6;
  result.left = v7;
  result.top = v8;
  return result;
}

- (double)stackedControlContainer:(id)a3 verticalPaddingAfter:(id)a4
{
  double result;

  if ((objc_opt_respondsToSelector(self->_expandedRep, "expandedVerticalPaddingAfterForLayout:inPanel:", a3) & 1) == 0)
    return 10.0;
  -[THWExpandedRep expandedVerticalPaddingAfterForLayout:inPanel:](self->_expandedRep, "expandedVerticalPaddingAfterForLayout:inPanel:", a4, self->_kind);
  return result;
}

- (double)stackedControlContainer:(id)a3 verticalPaddingBefore:(id)a4
{
  return 0.0;
}

- (double)stackedControlContainer:(id)a3 verticalSpacingAfter:(id)a4
{
  return 0.0;
}

- (double)stackedControlContainer:(id)a3 verticalSpacingBefore:(id)a4
{
  return 0.0;
}

- (id)stackedControlContainer:(id)a3 layoutGeometryForLayout:(id)a4
{
  THWExpandedRep *expandedRep;
  uint64_t kind;

  if ((objc_opt_respondsToSelector(self->_expandedRep, "expandedLayoutGeometryForLayout:inPanel:withWidth:insets:") & 1) == 0)
    return 0;
  -[THWAdornmentPanel stackedControlContainerInsets:](self, "stackedControlContainerInsets:", a3);
  expandedRep = self->_expandedRep;
  kind = self->_kind;
  -[THWAdornmentPanelDelegate adornmentPanelWidth:](self->_delegate, "adornmentPanelWidth:", self);
  return -[THWExpandedRep expandedLayoutGeometryForLayout:inPanel:withWidth:insets:](expandedRep, "expandedLayoutGeometryForLayout:inPanel:withWidth:insets:", a4, kind);
}

- (unsigned)stackedControlContainer:(id)a3 alignmentForLayout:(id)a4
{
  if ((objc_opt_respondsToSelector(self->_expandedRep, "expandedAlignmentForLayout:inPanel:", a3) & 1) != 0)
    return -[THWExpandedRep expandedAlignmentForLayout:inPanel:](self->_expandedRep, "expandedAlignmentForLayout:inPanel:", a4, self->_kind);
  else
    return 4;
}

- (id)p_styleProviderForLayout:(id)a3 inPanel:(int)a4
{
  THWAdornmentWPStyleProvider *v5;
  _BOOL8 v6;

  v5 = -[THWAdornmentWPStyleProvider initWithStorage:]([THWAdornmentWPStyleProvider alloc], "initWithStorage:", objc_msgSend(a3, "info"));
  if (-[TSWOverlayPanelView appearance](self->_view, "appearance"))
    v6 = -[TSWOverlayPanelView appearance](self->_view, "appearance") == 2
      && -[THWAdornmentPanelDelegate adornmentPanelBackgroundAppearance:](-[THWAdornmentPanel delegate](self, "delegate"), "adornmentPanelBackgroundAppearance:", self) == 0;
  else
    v6 = 1;
  -[THWAdornmentWPStyleProvider setUseDarkAppearance:](v5, "setUseDarkAppearance:", v6);
  -[THWAdornmentPanelDelegate adornmentPanelFontSize:](self->_delegate, "adornmentPanelFontSize:", self);
  -[THWAdornmentWPStyleProvider setFontSize:](v5, "setFontSize:");
  -[THWAdornmentWPStyleProvider setFontName:](v5, "setFontName:", -[THWAdornmentPanelDelegate adornmentPanelFontName:](self->_delegate, "adornmentPanelFontName:", self));
  -[THWAdornmentWPStyleProvider setTextAlignment:](v5, "setTextAlignment:", 0);
  return v5;
}

- (id)stackedControlContainer:(id)a3 styleProviderForLayout:(id)a4
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  _BOOL4 v20;

  v7 = -[THWAdornmentPanel p_styleProviderForLayout:inPanel:](self, "p_styleProviderForLayout:inPanel:", a4, self->_kind);
  v8 = -[THWAdornmentPanel stackedControlContainer:alignmentForLayout:](self, "stackedControlContainer:alignmentForLayout:", a3, a4);
  if (self->_kind)
  {
    v9 = v8;
    v10 = 0.0;
  }
  else
  {
    v11 = objc_msgSend(objc_alloc((Class)TSWPText), "initWithParagraphStyle:", objc_msgSend(v7, "paragraphStyleAtParIndex:effectiveRange:", 0, 0));
    objc_msgSend(v11, "setStyleProvider:", v7);
    objc_msgSend(v11, "measureStorage:", objc_msgSend(a4, "info"));
    v13 = v12;
    -[THWAdornmentPanel stackedControlContainerWidth:](self, "stackedControlContainerWidth:", a3);
    v15 = v14;
    -[THWAdornmentPanel stackedControlContainerInsets:](self, "stackedControlContainerInsets:", a3);
    v18 = (v15 - v16 - v17 - v13) * 0.5;
    -[THWAdornmentPanelDelegate adornmentPanelTitleLeftIndent:](self->_delegate, "adornmentPanelTitleLeftIndent:", self);
    v20 = v18 > v19;
    if (v18 <= v19)
      v10 = v19;
    else
      v10 = 0.0;
    v9 = (2 * v20);

  }
  objc_msgSend(v7, "setTextAlignment:", v9);
  objc_msgSend(v7, "setLeftIndent:", v10);
  return v7;
}

- (BOOL)stackedControlContainer:(id)a3 allowsLastLineTruncationForLayout:(id)a4
{
  return 1;
}

- (unsigned)stackedControlContainer:(id)a3 maxLineCountForLayout:(id)a4
{
  uint64_t v6;

  if (self->_kind)
  {
    v6 = 0;
  }
  else if (TSUPadUI())
  {
    v6 = 1;
  }
  else
  {
    v6 = 10;
  }
  if ((objc_opt_respondsToSelector(self->_expandedRep, "expandedMaxLineCountForTextLayout:inPanel:withDefault:", a3) & 1) != 0)
    return -[THWExpandedRep expandedMaxLineCountForTextLayout:inPanel:withDefault:](self->_expandedRep, "expandedMaxLineCountForTextLayout:inPanel:withDefault:", a4, self->_kind, v6);
  else
    return v6;
}

- (double)stackedControlContainer:(id)a3 leftRightInsetForTextLayout:(id)a4
{
  double result;

  if ((objc_opt_respondsToSelector(self->_expandedRep, "expandedLeftRightInsetForTextLayout:inPanel:", a3) & 1) == 0)
    return 10.0;
  -[THWExpandedRep expandedLeftRightInsetForTextLayout:inPanel:](self->_expandedRep, "expandedLeftRightInsetForTextLayout:inPanel:", a4, self->_kind);
  return result;
}

- (double)stackedControlContainerMinHeight:(id)a3
{
  double result;

  if (self->_kind > 1u)
    return 0.0;
  -[THWAdornmentPanelDelegate adornmentPanelMinHeight:](self->_delegate, "adornmentPanelMinHeight:", self);
  return result;
}

- (unsigned)stackedControlContainerVerticalAlignment:(id)a3
{
  return self->_kind < 2u;
}

- (THWAdornmentPanelDelegate)delegate
{
  return self->_delegate;
}

- (TSWOverlayPanelView)view
{
  return self->_view;
}

- (THWAutosizedCanvasController)autosizedCanvasController
{
  return self->_autosizedCanvasController;
}

- (THWStackedControlContainer)stackedControlContainer
{
  return self->_stackedControlContainer;
}

- (BOOL)hasBeenSized
{
  return self->_hasBeenSized;
}

- (int)kind
{
  return self->_kind;
}

- (THWExpandedRep)expandedRep
{
  return self->_expandedRep;
}

- (BOOL)hasBeenSizedDuringAnimation
{
  return self->_hasBeenSizedDuringAnimation;
}

- (BOOL)animatingPanel
{
  return self->_animatingPanel;
}

- (double)animationDuration
{
  return self->_animationDuration;
}

@end
