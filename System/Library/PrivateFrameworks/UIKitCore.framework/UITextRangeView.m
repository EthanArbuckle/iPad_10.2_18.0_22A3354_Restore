@implementation UITextRangeView

- (UITextRangeView)initWithFrame:(CGRect)a3 selectionView:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  UITextRangeView *v10;
  UITextRangeView *v11;
  void *v12;
  void *v13;
  UIView *v14;
  uint64_t v15;
  UIView *m_rectContainerView;
  NSArray *v17;
  NSArray *m_rects;
  NSMutableArray *v19;
  NSMutableArray *m_rectViews;
  UIPointerInteraction *v21;
  UIPointerInteraction *pointerInteraction;
  UITextRangeView *v23;
  objc_super v25;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v25.receiver = self;
  v25.super_class = (Class)UITextRangeView;
  v10 = -[UIView initWithFrame:](&v25, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->m_selectionView, v9);
    objc_msgSend(v9, "interactionAssistant");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v11->m_container, v13);

    v14 = [UIView alloc];
    v15 = -[UIView initWithFrame:](v14, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    m_rectContainerView = v11->m_rectContainerView;
    v11->m_rectContainerView = (UIView *)v15;

    -[UIView setOpaque:](v11->m_rectContainerView, "setOpaque:", 0);
    -[UIView setUserInteractionEnabled:](v11->m_rectContainerView, "setUserInteractionEnabled:", 0);
    -[UIView addSubview:](v11, "addSubview:", v11->m_rectContainerView);
    v17 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
    m_rects = v11->m_rects;
    v11->m_rects = v17;

    v19 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    m_rectViews = v11->m_rectViews;
    v11->m_rectViews = v19;

    -[UIView setOpaque:](v11, "setOpaque:", 0);
    -[UIView setUserInteractionEnabled:](v11, "setUserInteractionEnabled:", 1);
    v21 = -[UIPointerInteraction initWithDelegate:]([UIPointerInteraction alloc], "initWithDelegate:", v11);
    pointerInteraction = v11->_pointerInteraction;
    v11->_pointerInteraction = v21;

    -[UIView addInteraction:](v11, "addInteraction:", v11->_pointerInteraction);
    v23 = v11;
  }

  return v11;
}

- (void)removeFromSuperview
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  -[UITextRangeView cancelDelayedActions](self, "cancelDelayedActions");
  -[UITextRangeView startGrabber](self, "startGrabber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  -[UITextRangeView endGrabber](self, "endGrabber");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeFromSuperview");

  -[UIView superview](self, "superview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    +[UITextMagnifierRanged sharedRangedMagnifier](UITextMagnifierRanged, "sharedRangedMagnifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "target");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      objc_msgSend(v6, "stopMagnifying:", 0);

  }
  -[UITextRangeView setIsScrolling:](self, "setIsScrolling:", 0);
  -[UITextRangeView setInGesture:](self, "setInGesture:", 0);
  v8.receiver = self;
  v8.super_class = (Class)UITextRangeView;
  -[UIView removeFromSuperview](&v8, sel_removeFromSuperview);
}

- (CGRect)_edgeHitRectForEdgeRect:(CGRect)a3 grabber:(id)a4 precision:(unint64_t)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v11;
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
  int v27;
  double v28;
  double v29;
  double v30;
  double v31;
  int v32;
  double v33;
  void *v34;
  void *v35;
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
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11 = a4;
  -[UITextRangeView container](self, "container");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "textInputView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_scaleFromLayerTransforms");
  v15 = v14;
  v17 = v16;

  if (v15 >= 1.0)
    v18 = v15;
  else
    v18 = 1.0;
  if (v17 >= 1.0)
    v19 = v17;
  else
    v19 = 1.0;
  if (a5 == 2)
  {
    v48.origin.x = x;
    v48.origin.y = y;
    v48.size.width = width;
    v48.size.height = height;
    v49 = CGRectInset(v48, -6.0 / v18, -6.0 / v19);
    v20 = v49.origin.x;
    v21 = v49.origin.y;
    v22 = v49.size.width;
    v23 = v49.size.height;
  }
  else if (v11 && !objc_msgSend(v11, "isVertical"))
  {
    v52.origin.x = x;
    v52.origin.y = y;
    v52.size.width = width;
    v52.size.height = height;
    v53 = CGRectInset(v52, -10.0 / v18, -30.0 / v19);
    v29 = v53.origin.x;
    v30 = v53.origin.y;
    v31 = v53.size.width;
    v23 = v53.size.height;
    v32 = objc_msgSend(v11, "isPointedRight");
    v21 = v30 + 0.0;
    v33 = -30.0 / v18;
    if (v32)
      v20 = v33 + v29;
    else
      v20 = v29 + 0.0;
    v22 = v31 - (v33 + 0.0);
  }
  else
  {
    v50.origin.x = x;
    v50.origin.y = y;
    v50.size.width = width;
    v50.size.height = height;
    v51 = CGRectInset(v50, -30.0 / v18, -10.0 / v19);
    v24 = v51.origin.x;
    v25 = v51.origin.y;
    v22 = v51.size.width;
    v26 = v51.size.height;
    v27 = objc_msgSend(v11, "isPointedDown");
    v20 = v24 + 0.0;
    v28 = -30.0 / v19;
    if (v27)
      v21 = v28 + v25;
    else
      v21 = v25 + 0.0;
    v23 = v26 - (v28 + 0.0);
  }
  -[UITextRangeView container](self, "container");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "textInputView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "convertRect:fromView:", self, v20, v21, v22, v23);
  v37 = v36;
  v39 = v38;
  v41 = v40;
  v43 = v42;

  v44 = v37;
  v45 = v39;
  v46 = v41;
  v47 = v43;
  result.size.height = v47;
  result.size.width = v46;
  result.origin.y = v45;
  result.origin.x = v44;
  return result;
}

- (CGRect)_startEdgeHitRectWithPrecision:(unint64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
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
  CGRect result;

  -[UITextRangeView startEdge](self, "startEdge");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[UITextRangeView startGrabber](self, "startGrabber");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextRangeView _edgeHitRectForEdgeRect:grabber:precision:](self, "_edgeHitRectForEdgeRect:grabber:precision:", v13, a3, v6, v8, v10, v12);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  v22 = v15;
  v23 = v17;
  v24 = v19;
  v25 = v21;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (CGRect)_endEdgeHitRectWithPrecision:(unint64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
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
  CGRect result;

  -[UITextRangeView endEdge](self, "endEdge");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[UITextRangeView endGrabber](self, "endGrabber");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextRangeView _edgeHitRectForEdgeRect:grabber:precision:](self, "_edgeHitRectForEdgeRect:grabber:precision:", v13, a3, v6, v8, v10, v12);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  v22 = v15;
  v23 = v17;
  v24 = v19;
  v25 = v21;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (CGRect)textRangeAdjustmentRectForEdge:(unint64_t)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
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
  CGRect result;

  if (a3)
    -[UITextRangeView endEdge](self, "endEdge");
  else
    -[UITextRangeView startEdge](self, "startEdge");
  v8 = v4;
  v9 = v5;
  v10 = v6;
  v11 = v7;
  -[UITextRangeView container](self, "container");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "textInputView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "convertRect:fromView:", self, v8, v9, v10, v11);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  v22 = v15;
  v23 = v17;
  v24 = v19;
  v25 = v21;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (id)textRangeAdjustmentViewForEdge:(unint64_t)a3
{
  return 0;
}

- (CGRect)paddedTextRangeAdjustmentHitRegionForEdge:(unint64_t)a3 precision:(unint64_t)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  if (a3)
    -[UITextRangeView _endEdgeHitRectWithPrecision:](self, "_endEdgeHitRectWithPrecision:", a4);
  else
    -[UITextRangeView _startEdgeHitRectWithPrecision:](self, "_startEdgeHitRectWithPrecision:", a4);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  uint64_t v7;
  _BOOL4 v8;
  double v9;
  CGFloat v10;
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
  double v21;
  CGFloat v22;
  CGFloat v24;
  CGFloat v25;
  CGPoint v26;
  CGPoint v27;
  CGRect v28;
  CGRect v29;

  y = a3.y;
  x = a3.x;
  v7 = objc_msgSend(a4, "_inputPrecision");
  v8 = -[UITextRangeView shouldHitTestGrabbers](self, "shouldHitTestGrabbers");
  if (v8)
  {
    -[UITextRangeView _startEdgeHitRectWithPrecision:](self, "_startEdgeHitRectWithPrecision:", v7);
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;
    -[UITextRangeView _endEdgeHitRectWithPrecision:](self, "_endEdgeHitRectWithPrecision:", v7);
    v24 = v18;
    v25 = v17;
    v20 = v19;
    v22 = v21;
    v28.origin.x = v10;
    v28.origin.y = v12;
    v28.size.width = v14;
    v28.size.height = v16;
    v26.x = x;
    v26.y = y;
    if (CGRectContainsPoint(v28, v26))
    {
      LOBYTE(v8) = 1;
    }
    else
    {
      v29.origin.y = v24;
      v29.origin.x = v25;
      v29.size.width = v20;
      v29.size.height = v22;
      v27.x = x;
      v27.y = y;
      LOBYTE(v8) = CGRectContainsPoint(v29, v27);
    }
  }
  return v8;
}

- (void)setMagnifierOrientation
{
  _BOOL8 v3;
  _BOOL8 v4;
  id v5;

  if (-[UITextRangeView baseIsStart](self, "baseIsStart"))
    v3 = -[UITextRangeView _endIsHorizontal](self, "_endIsHorizontal");
  else
    v3 = -[UITextRangeView _startIsHorizontal](self, "_startIsHorizontal");
  v4 = v3;
  +[UITextMagnifierRanged sharedRangedMagnifier](UITextMagnifierRanged, "sharedRangedMagnifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIsHorizontal:", v4);

}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v3;
  char v4;
  char isKindOfClass;
  char v6;
  void *v7;
  char v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  BOOL v13;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      isKindOfClass = 1;
    }
    else
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
    }
    objc_opt_class();
    v6 = objc_opt_isKindOfClass();
    if ((v6 & 1) != 0
      && (objc_msgSend(v3, "view"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          v8 = objc_opt_isKindOfClass(),
          v7,
          (v8 & 1) != 0))
    {
      objc_msgSend(v3, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "contentSize");
      v11 = v10;
      objc_msgSend(v9, "frame");
      v13 = v11 <= v12;

    }
    else
    {
      v13 = 1;
    }
    if ((isKindOfClass & 1) != 0)
      v4 = 1;
    else
      v4 = v6 & v13;
  }

  return v4;
}

- (BOOL)textRangeAdjustmentInteraction:(id)a3 shouldBeginAtPoint:(CGPoint)a4
{
  return 1;
}

- (void)textRangeAdjustmentInteraction:(id)a3 didBeginAtPoint:(CGPoint)a4
{
  double y;
  double x;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  y = a4.y;
  x = a4.x;
  -[UITextRangeView setInGesture:](self, "setInGesture:", 1);
  -[UITextRangeView updateEdges](self, "updateEdges");
  WeakRetained = objc_loadWeakRetained((id *)&self->m_selectionView);
  objc_msgSend(WeakRetained, "interactionAssistant");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "_editMenuAssistant");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "_editMenuIsVisibleOrDismissedRecently") & 1) != 0)
  {
    objc_msgSend(v11, "_editMenuAssistant");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextRangeView setCommandsWereShowing:](self, "setCommandsWereShowing:", objc_msgSend(v9, "_hasTextReplacements") ^ 1);

  }
  else
  {
    -[UITextRangeView setCommandsWereShowing:](self, "setCommandsWereShowing:", 0);
  }

  -[UITextRangeView selectionView](self, "selectionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "hideSelectionCommands");

  -[UITextRangeView cancelDelayedActions](self, "cancelDelayedActions");
  objc_msgSend(v11, "rangeSelectionStarted:", x, y);

}

- (void)textRangeAdjustmentInteraction:(id)a3 selectionMoved:(CGPoint)a4 withTouchPoint:(CGPoint)a5
{
  double y;
  double x;
  double v7;
  double v8;
  void *v9;
  id WeakRetained;

  y = a5.y;
  x = a5.x;
  v7 = a4.y;
  v8 = a4.x;
  WeakRetained = objc_loadWeakRetained((id *)&self->m_selectionView);
  objc_msgSend(WeakRetained, "interactionAssistant");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "rangeSelectionMoved:withTouchPoint:", v8, v7, x, y);

}

- (void)textRangeAdjustmentInteraction:(id)a3 didEndAtPoint:(CGPoint)a4
{
  double y;
  double x;
  void *v7;
  id WeakRetained;

  y = a4.y;
  x = a4.x;
  -[UITextRangeView setInGesture:](self, "setInGesture:", 0);
  -[UITextRangeView cancelDelayedActions](self, "cancelDelayedActions");
  WeakRetained = objc_loadWeakRetained((id *)&self->m_selectionView);
  objc_msgSend(WeakRetained, "interactionAssistant");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rangeSelectionEnded:", x, y);

}

- (void)textRangeAdjustmentInteractionWasCancelled:(id)a3
{
  id WeakRetained;
  void *v5;

  -[UITextRangeView setInGesture:](self, "setInGesture:", 0);
  -[UITextRangeView cancelDelayedActions](self, "cancelDelayedActions");
  WeakRetained = objc_loadWeakRetained((id *)&self->m_selectionView);
  objc_msgSend(WeakRetained, "interactionAssistant");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rangeSelectionCanceled");

  -[UITextRangeView _updateGrabbersVisibility:animated:](self, "_updateGrabbersVisibility:animated:", 0, 0);
}

- (BOOL)textRangeAdjustmentInteractionShouldApplyTouchOffset:(id)a3
{
  return !-[UITextRangeView isDisplayingVerticalSelection](self, "isDisplayingVerticalSelection", a3);
}

- (BOOL)textRangeAdjustmentInteraction:(id)a3 shouldDisplayLoupeForTouchType:(int64_t)a4
{
  return 0;
}

- (unint64_t)loupeOrientationForTextRangeAdjustmentInteraction:(id)a3
{
  if (-[UITextRangeView isDisplayingVerticalSelection](self, "isDisplayingVerticalSelection", a3))
    return 2;
  else
    return 1;
}

- (CGRect)caretRectForTextRangeAdjustmentInteraction:(id)a3
{
  id WeakRetained;
  void *v4;
  void *v5;
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
  CGRect result;

  WeakRetained = objc_loadWeakRetained((id *)&self->m_selectionView);
  objc_msgSend(WeakRetained, "interactionAssistant");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeSelectionController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "caretRectForCursorPosition");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (id)containerCoordinateSpaceForTextRangeAdjustmentInteraction:(id)a3
{
  void *v3;
  void *v4;

  -[UITextRangeView container](self, "container", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textInputView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)updateAfterEffectiveModeChange
{
  -[UIView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", -[UITextRangeView shouldShowGrabbers](self, "shouldShowGrabbers"));
  -[UITextRangeView updateRectViews](self, "updateRectViews");
  -[UITextRangeView updateGrabbers](self, "updateGrabbers");
}

- (int)mode
{
  return self->m_mode;
}

- (void)setMode:(int)a3
{
  if (self->m_mode != a3)
  {
    self->m_mode = a3;
    -[UITextRangeView updateAfterEffectiveModeChange](self, "updateAfterEffectiveModeChange");
  }
}

- (UITextSelectionView)selectionView
{
  return (UITextSelectionView *)objc_loadWeakRetained((id *)&self->m_selectionView);
}

- (UITextInput)container
{
  return (UITextInput *)objc_loadWeakRetained((id *)&self->m_container);
}

- (NSArray)rects
{
  return self->m_rects;
}

- (void)updateEdges
{
  void *v2;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  void *v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  BOOL v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  void *v66;
  void *v67;
  void *v68;
  int v69;
  void *v70;
  double v71;
  double v72;
  double v73;
  _QWORD v74[5];
  uint64_t v75;
  double *v76;
  uint64_t v77;
  void *v78;
  __int128 v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;

  -[UITextRangeView container](self, "container");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textInputView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[UITextRangeView rects](self, "rects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[UITextSelectionRect startCustomSelectionPathFromRects:](UITextSelectionRect, "startCustomSelectionPathFromRects:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextRangeView setStartCustomPath:](self, "setStartCustomPath:", v7);

  +[UITextSelectionRect endCustomSelectionPathFromRects:](UITextSelectionRect, "endCustomSelectionPathFromRects:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextRangeView setEndCustomPath:](self, "setEndCustomPath:", v8);

  if (WebKitFramework)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[UITextRangeView rects](self, "rects");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[UITextSelectionRect startEdgeFromRects:](UITextSelectionRect, "startEdgeFromRects:", v9);
      -[UIView convertRect:fromView:](self, "convertRect:fromView:", v5);
      v11 = v10;
      v13 = v12;
      v15 = v14;
      v17 = v16;
      objc_msgSend(v5, "bounds");
      v85.origin.x = v18;
      v85.origin.y = v19;
      v85.size.width = v20;
      v85.size.height = v21;
      v80.origin.x = v11;
      v80.origin.y = v13;
      v80.size.width = v15;
      v80.size.height = v17;
      v81 = CGRectIntersection(v80, v85);
      -[UITextRangeView setStartEdge:](self, "setStartEdge:", v81.origin.x, v81.origin.y, v81.size.width, v81.size.height);

      -[UITextRangeView rects](self, "rects");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      +[UITextSelectionRect endEdgeFromRects:](UITextSelectionRect, "endEdgeFromRects:", v22);
      -[UIView convertRect:fromView:](self, "convertRect:fromView:", v5);
      v24 = v23;
      v26 = v25;
      v28 = v27;
      v30 = v29;
      objc_msgSend(v5, "bounds");
      v86.origin.x = v31;
      v86.origin.y = v32;
      v86.size.width = v33;
      v86.size.height = v34;
      v82.origin.x = v24;
      v82.origin.y = v26;
      v82.size.width = v28;
      v82.size.height = v30;
      v83 = CGRectIntersection(v82, v86);
      -[UITextRangeView setEndEdge:](self, "setEndEdge:", v83.origin.x, v83.origin.y, v83.size.width, v83.size.height);
LABEL_34:

      goto LABEL_35;
    }
  }
  if (!objc_msgSend(v5, "_usesAsynchronousProtocol"))
  {
    -[UITextRangeView startCustomPath](self, "startCustomPath");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextRangeView endCustomPath](self, "endCustomPath");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      objc_msgSend(v22, "boundingEdgeRect");
    }
    else
    {
      -[UITextRangeView rects](self, "rects");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      +[UITextSelectionRect startEdgeFromRects:](UITextSelectionRect, "startEdgeFromRects:", v2);
      -[UIView convertRect:fromView:](self, "convertRect:fromView:", v5);
    }
    -[UITextRangeView setStartEdge:](self, "setStartEdge:");
    if (v22)
    {
      if (v66)
      {
LABEL_28:
        objc_msgSend(v66, "boundingEdgeRect");
LABEL_31:
        -[UITextRangeView setEndEdge:](self, "setEndEdge:");
        if (!v66)

        goto LABEL_34;
      }
    }
    else
    {

      if (v66)
        goto LABEL_28;
    }
    -[UITextRangeView rects](self, "rects");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    +[UITextSelectionRect endEdgeFromRects:](UITextSelectionRect, "endEdgeFromRects:", v2);
    -[UIView convertRect:fromView:](self, "convertRect:fromView:", v5);
    goto LABEL_31;
  }
  -[UITextRangeView inverseScaleForView:](self, "inverseScaleForView:", v5);
  v36 = v35;
  -[UITextRangeView rects](self, "rects");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  +[UITextSelectionRect startEdgeFromRects:](UITextSelectionRect, "startEdgeFromRects:", v37);
  v73 = v38;
  v40 = v39;
  v42 = v41;
  v44 = v43;

  -[UITextRangeView rects](self, "rects");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  +[UITextSelectionRect endEdgeFromRects:](UITextSelectionRect, "endEdgeFromRects:", v45);
  v47 = v46;
  v49 = v48;
  v51 = v50;
  v53 = v52;

  v54 = 1.0;
  if (v42 >= v44)
    v55 = v36;
  else
    v55 = 1.0;
  v56 = v44 * v55;
  if (v42 < v44)
    v54 = v36;
  v57 = v42 * v54;
  v58 = v51 < v53;
  v59 = v49 + v53 - v36 * v53;
  v60 = v36 * v51;
  v61 = v47 + v51 - v36 * v51;
  if (v51 < v53)
    v62 = v53;
  else
    v62 = v36 * v53;
  if (v51 < v53)
    v63 = v60;
  else
    v63 = v51;
  if (v58)
    v64 = v49;
  else
    v64 = v59;
  if (v58)
    v65 = v61;
  else
    v65 = v47;
  -[UIView convertRect:fromView:](self, "convertRect:fromView:", v5, v73, v40, v57, v56, v60, v61, *(_QWORD *)&v73);
  -[UITextRangeView setStartEdge:](self, "setStartEdge:");
  -[UIView convertRect:fromView:](self, "convertRect:fromView:", v5, v65, v64, v63, v62);
  -[UITextRangeView setEndEdge:](self, "setEndEdge:");
LABEL_35:
  -[UITextRangeView rects](self, "rects");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "firstObject");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = objc_msgSend(v68, "isMemberOfClass:", objc_opt_class());

  if (v69)
  {
    v75 = 0;
    v76 = (double *)&v75;
    v77 = 0x3010000000;
    v78 = &unk_18685B0AF;
    v79 = *MEMORY[0x1E0C9D538];
    -[UITextRangeView rects](self, "rects");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v74[0] = MEMORY[0x1E0C809B0];
    v74[1] = 3221225472;
    v74[2] = __30__UITextRangeView_updateEdges__block_invoke;
    v74[3] = &unk_1E16E5CB0;
    v74[4] = &v75;
    objc_msgSend(v70, "enumerateObjectsUsingBlock:", v74);

    if (v76[5] > 0.0)
    {
      -[UITextRangeView endEdge](self, "endEdge");
      if (CGRectGetMidY(v84) > v76[5])
      {
        -[UITextRangeView startEdge](self, "startEdge");
        -[UITextRangeView setEndEdge:](self, "setEndEdge:", v76[4] - v71, v76[5] - v72);
      }
    }
    _Block_object_dispose(&v75, 8);
  }

}

void __30__UITextRangeView_updateEdges__block_invoke(uint64_t a1, void *a2)
{
  CGFloat MaxX;
  CGFloat MaxY;
  uint64_t v5;
  id v6;
  CGRect v7;
  CGRect v8;
  CGRect v9;
  CGRect v10;

  v6 = a2;
  objc_msgSend(v6, "rect");
  if (CGRectGetWidth(v7) > 0.0)
  {
    objc_msgSend(v6, "rect");
    if (CGRectGetMaxY(v8) > *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
    {
      objc_msgSend(v6, "rect");
      MaxX = CGRectGetMaxX(v9);
      objc_msgSend(v6, "rect");
      MaxY = CGRectGetMaxY(v10);
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      *(CGFloat *)(v5 + 32) = MaxX;
      *(CGFloat *)(v5 + 40) = MaxY;
    }
  }

}

- (void)setRects:(id)a3
{
  void *v4;
  uint64_t v5;
  id obj;

  obj = a3;
  if (objc_msgSend(obj, "count"))
  {
    if ((unint64_t)objc_msgSend(obj, "count") >= 0xB)
    {
      objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", obj);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "array");
      v5 = objc_claimAutoreleasedReturnValue();

      obj = (id)v5;
    }
    if (-[UITextRangeView isClearingRange](self, "isClearingRange"))
      -[UITextRangeView setShouldStayVisible:](self, "setShouldStayVisible:", 1);
    objc_storeStrong((id *)&self->m_rects, obj);
    -[UITextRangeView updateEdges](self, "updateEdges");
    -[UITextRangeView updateRectViews](self, "updateRectViews");
    -[UITextRangeView updateGrabbers](self, "updateGrabbers");
  }

}

- (void)updateSelectionWithDocumentPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v5;
  id WeakRetained;

  y = a3.y;
  x = a3.x;
  WeakRetained = objc_loadWeakRetained((id *)&self->m_selectionView);
  objc_msgSend(WeakRetained, "interactionAssistant");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateSelectionWithPoint:", x, y);

}

- (void)updateBaseIsStartWithDocumentPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
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
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  y = a3.y;
  x = a3.x;
  -[UITextRangeView container](self, "container");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "textInputView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView convertPoint:fromView:](self, "convertPoint:fromView:", v7, x, y);
  v9 = v8;
  v11 = v10;

  -[UITextRangeView startEdge](self, "startEdge");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  -[UITextRangeView endEdge](self, "endEdge");
  -[UITextRangeView setBaseIsStart:](self, "setBaseIsStart:", -[UITextRangeView pointCloserToEnd:startEdge:endEdge:](self, "pointCloserToEnd:startEdge:endEdge:", v9, v11, v13, v15, v17, v19, v20, v21, v22, v23));
}

- (void)updateBaseAndExtentPointsFromEdges
{
  CGPoint *p_m_basePoint;
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

  p_m_basePoint = &self->m_basePoint;
  if (-[UITextRangeView baseIsStart](self, "baseIsStart"))
  {
    -[UITextRangeView startEdge](self, "startEdge");
    p_m_basePoint->x = v5 + v4 * 0.5;
    self->m_basePoint.y = v7 + v6 * 0.5;
    -[UITextRangeView endEdge](self, "endEdge");
  }
  else
  {
    -[UITextRangeView endEdge](self, "endEdge");
    p_m_basePoint->x = v13 + v12 * 0.5;
    self->m_basePoint.y = v15 + v14 * 0.5;
    -[UITextRangeView startEdge](self, "startEdge");
  }
  self->m_extentPoint.x = v8 + v10 * 0.5;
  self->m_extentPoint.y = v9 + v11 * 0.5;
}

- (void)prepareForMagnification
{
  void *v3;
  void *v4;

  -[UITextRangeView setMagnifying:](self, "setMagnifying:", 1);
  -[UITextRangeView startGrabber](self, "startGrabber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsDotted:", 0);

  -[UITextRangeView endGrabber](self, "endGrabber");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsDotted:", 0);

  -[UITextRangeView updateGrabbers](self, "updateGrabbers");
}

- (void)doneMagnifying
{
  void *v3;
  void *v4;

  -[UITextRangeView setMagnifying:](self, "setMagnifying:", 0);
  -[UITextRangeView startGrabber](self, "startGrabber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsDotted:", 1);

  -[UITextRangeView endGrabber](self, "endGrabber");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsDotted:", 1);

  -[UITextRangeView updateGrabbers](self, "updateGrabbers");
}

- (void)willScroll
{
  -[UITextRangeView setIsScrolling:](self, "setIsScrolling:", 1);
  -[UITextRangeView updateDots](self, "updateDots");
}

- (void)didScroll
{
  -[UITextRangeView setIsScrolling:](self, "setIsScrolling:", 0);
  -[UITextRangeView updateDots](self, "updateDots");
}

- (void)scaleWillChange
{
  -[UITextRangeView setScaling:](self, "setScaling:", 1);
  -[UITextRangeView updateDots](self, "updateDots");
}

- (void)scaleDidChange
{
  -[UITextRangeView setScaling:](self, "setScaling:", 0);
  -[UITextRangeView updateDots](self, "updateDots");
}

- (void)willRotate
{
  -[UITextRangeView setRotating:](self, "setRotating:", 1);
  -[UITextRangeView updateDots](self, "updateDots");
}

- (void)didRotate
{
  -[UITextRangeView setRotating:](self, "setRotating:", 0);
  -[UITextRangeView performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_updateDots, 0, 0.0);
}

- (void)inputViewWillChange
{
  -[UITextRangeView setInputViewIsChanging:](self, "setInputViewIsChanging:", 1);
  -[UITextRangeView updateDots](self, "updateDots");
}

- (void)inputViewDidChange
{
  -[UITextRangeView setInputViewIsChanging:](self, "setInputViewIsChanging:", 0);
  -[UITextRangeView updateDots](self, "updateDots");
}

- (void)clearRangeAnimated:(BOOL)a3
{
  _BOOL4 v3;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  UISelectionGrabber *m_endGrabber;
  _QWORD v11[5];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  if (!-[UITextRangeView isClearingRange](self, "isClearingRange"))
  {
    if (v3 && !_AXSReduceMotionEnabled())
    {
      if (self->m_endGrabber)
        -[UITextRangeView setIsClearingRange:](self, "setIsClearingRange:", 1);
      v14 = 0u;
      v15 = 0u;
      v12 = 0u;
      v13 = 0u;
      v5 = self->m_rectViews;
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v13;
        do
        {
          v9 = 0;
          do
          {
            if (*(_QWORD *)v13 != v8)
              objc_enumerationMutation(v5);
            objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9++), "setHidden:", 1);
          }
          while (v7 != v9);
          v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        }
        while (v7);
      }

      if (self->m_endGrabber)
      {
        -[UISelectionGrabber transitionDot:completion:](self->m_startGrabber, "transitionDot:completion:", 2, 0);
        m_endGrabber = self->m_endGrabber;
        v11[0] = MEMORY[0x1E0C809B0];
        v11[1] = 3221225472;
        v11[2] = __38__UITextRangeView_clearRangeAnimated___block_invoke;
        v11[3] = &unk_1E16B1B28;
        v11[4] = self;
        -[UISelectionGrabber transitionDot:completion:](m_endGrabber, "transitionDot:completion:", 2, v11);
      }
      else
      {
        -[UITextRangeView removeFromSuperview](self, "removeFromSuperview");
      }
    }
    else
    {
      -[UITextRangeView removeFromSuperview](self, "removeFromSuperview");
    }
  }
}

uint64_t __38__UITextRangeView_clearRangeAnimated___block_invoke(uint64_t a1)
{
  if ((objc_msgSend(*(id *)(a1 + 32), "shouldStayVisible") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 32), "setShouldStayVisible:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setIsClearingRange:", 0);
}

- (void)updateDots
{
  void *v3;
  UISelectionGrabber *m_endGrabber;
  UISelectionGrabber *m_startGrabber;
  UISelectionGrabber *v6;

  if (-[UITextRangeView shouldShowGrabbers](self, "shouldShowGrabbers"))
  {
    -[UITextRangeView startGrabber](self, "startGrabber");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "updateDot");

    -[UITextRangeView endGrabber](self, "endGrabber");
    v6 = (UISelectionGrabber *)objc_claimAutoreleasedReturnValue();
    -[UISelectionGrabber updateDot](v6, "updateDot");
    m_endGrabber = v6;
  }
  else
  {
    -[UISelectionGrabber removeFromSuperview](self->m_startGrabber, "removeFromSuperview");
    -[UISelectionGrabber removeFromSuperview](self->m_endGrabber, "removeFromSuperview");
    m_startGrabber = self->m_startGrabber;
    self->m_startGrabber = 0;

    m_endGrabber = self->m_endGrabber;
    self->m_endGrabber = 0;
  }

}

- (void)startAnimating
{
  void *v3;
  id v4;

  -[UITextRangeView startGrabber](self, "startGrabber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAnimating:", 1);

  -[UITextRangeView endGrabber](self, "endGrabber");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAnimating:", 1);

}

- (void)stopAnimating
{
  void *v3;
  id v4;

  -[UITextRangeView startGrabber](self, "startGrabber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAnimating:", 0);

  -[UITextRangeView endGrabber](self, "endGrabber");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAnimating:", 0);

}

- (void)_updateGrabbersVisibility:(BOOL)a3 animated:(BOOL)a4
{
  void *v5;
  void *v6;
  _QWORD v7[5];
  BOOL v8;

  if (a4)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __54__UITextRangeView__updateGrabbersVisibility_animated___block_invoke;
    v7[3] = &unk_1E16B1B78;
    v8 = a3;
    v7[4] = self;
    +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v7, 0.15);
  }
  else
  {
    -[UITextRangeView startGrabber](self, "startGrabber", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "updateDot");

    -[UITextRangeView endGrabber](self, "endGrabber");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updateDot");

    -[UITextRangeView updateGrabbers](self, "updateGrabbers");
  }
}

uint64_t __54__UITextRangeView__updateGrabbersVisibility_animated___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;

  v2 = *(unsigned __int8 *)(a1 + 40);
  v3 = *(void **)(a1 + 32);
  if (v2)
    objc_msgSend(v3, "startAnimating");
  else
    objc_msgSend(v3, "stopAnimating");
  return objc_msgSend(*(id *)(a1 + 32), "updateGrabbers");
}

- (void)cancelDelayedActions
{
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:", self);
}

- (BOOL)pointCloserToEnd:(CGPoint)a3 startEdge:(CGRect)a4 endEdge:(CGRect)a5
{
  return sqrt((a5.origin.x + a5.size.width - a3.x) * (a5.origin.x + a5.size.width - a3.x)+ (a5.origin.y + a5.size.height - a3.y) * (a5.origin.y + a5.size.height - a3.y)) < sqrt((a4.origin.x - a3.x)* (a4.origin.x - a3.x)+ (a4.origin.y - a3.y)* (a4.origin.y - a3.y));
}

- (BOOL)autoscrolled
{
  id WeakRetained;
  void *v3;
  char v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->m_selectionView);
  objc_msgSend(WeakRetained, "interactionAssistant");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "autoscrolled");

  return v4;
}

- (void)animateHighlighterExpanderAnimation
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
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
  _BOOL4 v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v3 = self->m_rectViews;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (!v4)
    goto LABEL_20;
  v5 = v4;
  v6 = 0;
  v7 = *(_QWORD *)v34;
  do
  {
    for (i = 0; i != v5; ++i)
    {
      if (*(_QWORD *)v34 != v7)
        objc_enumerationMutation(v3);
      v6 += objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * i), "isHidden", (_QWORD)v33) ^ 1;
    }
    v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  }
  while (v5);

  if (v6 == 1)
  {
    -[NSMutableArray firstObject](self->m_rectViews, "firstObject");
    v3 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray layer](v3, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextRangeView animateHighlighterExpanderOnLayer:withOffset:](self, "animateHighlighterExpanderOnLayer:withOffset:", v9, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));

    -[NSMutableArray bounds](v3, "bounds");
    LODWORD(v9) = -[UITextRangeView _startIsHorizontal](self, "_startIsHorizontal");
    -[NSMutableArray frame](v3, "frame");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    -[UIView frame](self->m_startGrabber, "frame");
    if ((_DWORD)v9)
    {
      if (v18 < v11 + v15 * 0.5)
      {
LABEL_14:
        v20 = -[UITextRangeView _endIsHorizontal](self, "_endIsHorizontal");
        -[NSMutableArray frame](v3, "frame");
        v22 = v21;
        v24 = v23;
        v26 = v25;
        v28 = v27;
        -[UIView frame](self->m_endGrabber, "frame");
        if (v20)
        {
          if (v29 < v22 + v26 * 0.5)
            goto LABEL_19;
        }
        else if (v30 < v24 + v28 * 0.5)
        {
LABEL_19:
          -[UIView layer](self->m_startGrabber, "layer");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          -[UITextRangeView animateHighlighterDelayedFadeInOnLayer:](self, "animateHighlighterDelayedFadeInOnLayer:", v31);

          -[UIView layer](self->m_endGrabber, "layer");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          -[UITextRangeView animateHighlighterDelayedFadeInOnLayer:](self, "animateHighlighterDelayedFadeInOnLayer:", v32);

LABEL_20:
          return;
        }
        -[UIView frame](self->m_endGrabber, "frame");
        goto LABEL_19;
      }
    }
    else if (v19 < v13 + v17 * 0.5)
    {
      goto LABEL_14;
    }
    -[UIView frame](self->m_startGrabber, "frame");
    goto LABEL_14;
  }
}

- (void)animateHighlighterExpanderOnLayer:(id)a3 withOffset:(CGPoint)a4
{
  id v4;
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  float v13;
  __int128 v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  CATransform3D v20;
  CATransform3D v21;
  CATransform3D v22;

  v4 = a3;
  objc_msgSend(v4, "bounds");
  v6 = v5;
  objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("transform"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFrameInterval:", 0.0166666667);
  v8 = *MEMORY[0x1E0CD2B50];
  objc_msgSend(v7, "setFillMode:", *MEMORY[0x1E0CD2B50]);
  objc_msgSend(v4, "bounds");
  v11 = 1.0;
  v12 = 1.0;
  if (v9 > 0.0)
  {
    v13 = v6 + 300.0;
    if (v13 < 350.0)
      v13 = 350.0;
    v12 = v13 / v9;
  }
  if (v10 > 0.0)
    v11 = (v10 + 100.0) / v10;
  v14 = 0uLL;
  memset(&v22, 0, sizeof(v22));
  if (v4)
  {
    objc_msgSend(v4, "transform");
    v14 = 0uLL;
  }
  *(_OWORD *)&v21.m41 = v14;
  *(_OWORD *)&v21.m43 = v14;
  *(_OWORD *)&v21.m31 = v14;
  *(_OWORD *)&v21.m33 = v14;
  *(_OWORD *)&v21.m21 = v14;
  *(_OWORD *)&v21.m23 = v14;
  *(_OWORD *)&v21.m11 = v14;
  *(_OWORD *)&v21.m13 = v14;
  v20 = v22;
  CATransform3DScale(&v21, &v20, v12, v11, 1.0);
  v20 = v21;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", &v20);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFromValue:", v15);

  v20 = v22;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", &v20);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setToValue:", v16);

  objc_msgSend(v7, "setMass:", 1.0);
  objc_msgSend(v7, "setStiffness:", 445.100006);
  objc_msgSend(v7, "setDamping:", 36.6100006);
  objc_msgSend(v7, "settlingDuration");
  objc_msgSend(v7, "setDuration:");
  objc_msgSend(v4, "addAnimation:forKey:", v7, CFSTR("transform"));
  objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("cornerRadius"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setFromValue:", &unk_1E1A9A728);
  objc_msgSend(v17, "setToValue:", &unk_1E1A9A740);
  objc_msgSend(v17, "setMass:", 1.0);
  objc_msgSend(v17, "setStiffness:", 445.100006);
  objc_msgSend(v17, "setDamping:", 36.6100006);
  objc_msgSend(v7, "settlingDuration");
  objc_msgSend(v17, "setDuration:");
  objc_msgSend(v4, "addAnimation:forKey:", v17, CFSTR("cornerRadius"));
  objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("opacity"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setFrameInterval:", 0.0166666667);
  objc_msgSend(v18, "setFillMode:", v8);
  objc_msgSend(v18, "setFromValue:", &unk_1E1A9A740);
  objc_msgSend(v18, "setToValue:", &unk_1E1A9A758);
  objc_msgSend(v18, "setMass:", 1.0);
  objc_msgSend(v18, "setStiffness:", 445.100006);
  objc_msgSend(v18, "setDamping:", 36.6100006);
  objc_msgSend(v7, "settlingDuration");
  objc_msgSend(v18, "setDuration:");
  objc_msgSend(v4, "addAnimation:forKey:", v18, CFSTR("opacity"));
  LODWORD(v19) = 1.0;
  objc_msgSend(v4, "setOpacity:", v19);

}

- (void)animateHighlighterDelayedFadeInOnLayer:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = (void *)MEMORY[0x1E0CD2848];
  v4 = a3;
  objc_msgSend(v3, "animationWithKeyPath:", CFSTR("transform.scale"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFrameInterval:", 0.0166666667);
  v5 = *MEMORY[0x1E0CD2B50];
  objc_msgSend(v7, "setFillMode:", *MEMORY[0x1E0CD2B50]);
  objc_msgSend(v7, "setFromValue:", &unk_1E1A96150);
  objc_msgSend(v7, "setToValue:", &unk_1E1A9A758);
  objc_msgSend(v7, "setMass:", 1.0);
  objc_msgSend(v7, "setStiffness:", 586.0);
  objc_msgSend(v7, "setDamping:", 31.7);
  objc_msgSend(v7, "settlingDuration");
  objc_msgSend(v7, "setDuration:");
  objc_msgSend(v7, "setBeginTime:", CACurrentMediaTime() + 0.2);
  objc_msgSend(v4, "addAnimation:forKey:", v7, 0);
  objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("opacity"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFrameInterval:", 0.0166666667);
  objc_msgSend(v6, "setFillMode:", v5);
  objc_msgSend(v6, "setFromValue:", &unk_1E1A9A740);
  objc_msgSend(v6, "setToValue:", &unk_1E1A9A758);
  objc_msgSend(v6, "setMass:", 1.0);
  objc_msgSend(v6, "setStiffness:", 586.0);
  objc_msgSend(v6, "setDamping:", 31.7);
  objc_msgSend(v6, "settlingDuration");
  objc_msgSend(v6, "setDuration:");
  objc_msgSend(v6, "setBeginTime:", CACurrentMediaTime() + 0.2);
  objc_msgSend(v6, "setFillMode:", v5);
  objc_msgSend(v4, "addAnimation:forKey:", v6, 0);

}

- (void)beginMagnifying
{
  id v3;

  self->m_willBeginMagnifying = 0;
  -[UITextRangeView cancelDelayedActions](self, "cancelDelayedActions");
  +[UITextMagnifierRanged sharedRangedMagnifier](UITextMagnifierRanged, "sharedRangedMagnifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UITextRangeView setMagnifierOrientation](self, "setMagnifierOrientation");

}

- (CGRect)_selectionClipRect
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

  -[UITextRangeView container](self, "container");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
    goto LABEL_7;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v2, "_selectionClipRect");
      goto LABEL_6;
    }
LABEL_7:
    v7 = *MEMORY[0x1E0C9D628];
    v8 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v9 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v10 = *(double *)(MEMORY[0x1E0C9D628] + 24);
    goto LABEL_8;
  }
  objc_msgSend(v2, "selectionClipRect");
LABEL_6:
  v7 = v3;
  v8 = v4;
  v9 = v5;
  v10 = v6;
LABEL_8:

  v11 = v7;
  v12 = v8;
  v13 = v9;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)updateRectViews
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  char v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  int v15;
  double v16;
  double v17;
  double v18;
  double v19;
  UITextSelectionRectView *v20;
  void *v21;
  void *v22;
  double x;
  double y;
  double width;
  double height;
  BOOL IsNull;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  _BOOL4 v41;
  double v42;
  int v43;
  uint64_t v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  void *v60;
  double v61;
  double v62;
  void *v64;
  void *v65;
  double v66;
  double v67;
  uint64_t v68;
  void *v69;
  void *v70;
  unint64_t v71;
  void *v72;
  double v73;
  _BOOL4 v74;
  _BOOL4 v75;
  _BOOL4 v76;
  void *v77;
  CGFloat v78;
  id v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;

  if ((!-[UITextRangeView mode](self, "mode")
     || -[UITextRangeView mode](self, "mode") == 5
     || -[UITextRangeView mode](self, "mode") == 4)
    && !_AXSReduceMotionEnabled())
  {
    -[UITextRangeView container](self, "container");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "_conformsToProtocolUIAsyncTextInputClient") & 1) != 0)
    {
LABEL_6:

      goto LABEL_12;
    }
    -[UITextRangeView container](self, "container");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "_conformsToProtocolBETextInput");

    if ((v5 & 1) == 0)
    {
      -[UITextRangeView container](self, "container");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_opt_respondsToSelector();

      if ((v7 & 1) == 0
        || (-[UITextRangeView container](self, "container"),
            v8 = (void *)objc_claimAutoreleasedReturnValue(),
            v9 = objc_msgSend(v8, "_allowAnimatedUpdateSelectionRectViews"),
            v8,
            v9))
      {
        -[UIView layer](self->m_rectContainerView, "layer");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "animationForKey:", CFSTR("transition"));
        v3 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v3)
        {
          objc_msgSend(MEMORY[0x1E0CD28D0], "animation");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setFrameInterval:", 0.0333333333);
          objc_msgSend(v11, "setType:", *MEMORY[0x1E0CD3170]);
          objc_msgSend(v11, "setDuration:", 0.25);
          objc_msgSend(v11, "setFillMode:", *MEMORY[0x1E0CD2B50]);
          objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3038]);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setTimingFunction:", v12);

          -[UIView layer](self->m_rectContainerView, "layer");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addAnimation:forKey:", v11, CFSTR("transition"));

          v3 = 0;
        }
        goto LABEL_6;
      }
    }
  }
LABEL_12:
  v14 = -[NSArray count](self->m_rects, "count");
  v15 = v14 - -[NSMutableArray count](self->m_rectViews, "count");
  if (v15 >= 1)
  {
    v16 = *MEMORY[0x1E0C9D648];
    v17 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v18 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v19 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    do
    {
      v20 = -[UIView initWithFrame:]([UITextSelectionRectView alloc], "initWithFrame:", v16, v17, v18, v19);
      -[UIView setUserInteractionEnabled:](v20, "setUserInteractionEnabled:", 0);
      -[UIView addSubview:](self->m_rectContainerView, "addSubview:", v20);
      -[NSMutableArray addObject:](self->m_rectViews, "addObject:", v20);

      --v15;
    }
    while (v15);
  }
  -[UITextRangeView container](self, "container");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "textInputView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextRangeView _selectionClipRect](self, "_selectionClipRect");
  x = v80.origin.x;
  y = v80.origin.y;
  width = v80.size.width;
  height = v80.size.height;
  IsNull = CGRectIsNull(v80);
  if (!IsNull)
  {
    -[UIView convertRect:fromView:](self, "convertRect:fromView:", v22, x, y, width, height);
    x = v28;
    y = v29;
    width = v30;
    height = v31;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    +[UIKeyboard currentDocumentState](UIKeyboard, "currentDocumentState");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "autocorrectTextBackgroundColor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (v33)
    {
      objc_msgSend(v32, "autocorrectTextBackgroundColor");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIColor colorWithCGColor:](UIColor, "colorWithCGColor:", objc_msgSend(v34, "cgColor"));
      v77 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v21, "selectionHighlightColor");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    +[UIColor selectionHighlightColor](UIColor, "selectionHighlightColor");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v79 = v21;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v79, "selectionBorderColor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = v35 != 0;

  }
  else
  {
    v76 = 0;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v79, "selectionBorderWidth");
    v75 = v36 > 0.0;
  }
  else
  {
    v75 = 0;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v79, "selectionCornerRadius");
    v74 = v37 > 0.0;
  }
  else
  {
    v74 = 0;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v79, "selectionEdgeInsets");
    v41 = v40 != 0.0;
    if (v42 != 0.0)
      v41 = 1;
    if (v39 != 0.0)
      v41 = 1;
    v43 = v38 != 0.0 || v41;
  }
  else
  {
    v43 = 0;
  }
  if (-[NSArray count](self->m_rects, "count"))
  {
    v78 = width;
    v44 = 0;
    v73 = 0.2;
    while (1)
    {
      -[NSArray objectAtIndex:](self->m_rects, "objectAtIndex:", v44, *(_QWORD *)&v73);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "rect");
      v46 = v81.origin.x;
      v47 = v81.origin.y;
      v48 = v81.size.width;
      v49 = v81.size.height;
      v50 = CGRectGetWidth(v81);
      if (v50 <= 2.0 || v43 == 0)
      {
        if (!v22)
          goto LABEL_53;
      }
      else
      {
        objc_msgSend(v79, "selectionEdgeInsets");
        v46 = v46 + v53;
        v47 = v47 + v52;
        v48 = v48 - (v53 + v55);
        v49 = v49 - (v52 + v54);
        if (!v22)
          goto LABEL_53;
      }
      -[UIView convertRect:fromView:](self, "convertRect:fromView:", v22, v46, v47, v48, v49);
      v46 = v56;
      v47 = v57;
      v48 = v58;
      v49 = v59;
      if (!IsNull)
      {
        v82.origin.x = x;
        v82.size.width = v78;
        v82.origin.y = y;
        v82.size.height = height;
        v85.origin.x = v46;
        v85.origin.y = v47;
        v85.size.width = v48;
        v85.size.height = v49;
        v83 = CGRectIntersection(v82, v85);
        v46 = v83.origin.x;
        v47 = v83.origin.y;
        v48 = v83.size.width;
        v49 = v83.size.height;
      }
LABEL_53:
      -[NSMutableArray objectAtIndex:](self->m_rectViews, "objectAtIndex:", v44);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "frame");
      if (v62 != v48 || v61 != v49)
      {
        objc_msgSend(v60, "layer");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "removeAllAnimations");

      }
      if ((objc_msgSend(v45, "_drawsOwnHighlight") & 1) == 0)
      {
        v84.origin.x = v46;
        v84.origin.y = v47;
        v84.size.width = v48;
        v84.size.height = v49;
        if (!CGRectIsEmpty(v84) && UIRectIsDiscrete(v46, v47, v48, v49))
        {
          objc_msgSend(v60, "setHidden:", 0);
          objc_msgSend(v60, "setFrame:", v46, v47, v48, v49);
          objc_msgSend(v45, "_path");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "setPath:", v65);

          if (-[UITextRangeView mode](self, "mode") == 2)
          {
            v66 = 1.0;
            v67 = 0.0;
            goto LABEL_68;
          }
          if (-[UITextRangeView mode](self, "mode") == 3)
          {
            v66 = 0.0;
            v67 = 1.0;
LABEL_68:
            +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", v66, 0.0, v67, 0.15);
            v68 = objc_claimAutoreleasedReturnValue();
LABEL_69:
            v69 = (void *)v68;
            objc_msgSend(v60, "setSelectionColor:", v68);

          }
          else
          {
            if (-[UITextRangeView mode](self, "mode") == 5)
            {
              +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.5, v73);
              v68 = objc_claimAutoreleasedReturnValue();
              goto LABEL_69;
            }
            objc_msgSend(v60, "setSelectionColor:", v77);
          }
          if (v50 > 2.0)
          {
            if (v76)
            {
              objc_msgSend(v79, "selectionBorderColor");
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v60, "setSelectionBorderColor:", v70);

            }
            if (v75)
            {
              objc_msgSend(v79, "selectionBorderWidth");
              objc_msgSend(v60, "setSelectionBorderWidth:");
            }
            if (v74)
            {
              objc_msgSend(v79, "selectionCornerRadius");
              objc_msgSend(v60, "setSelectionCornerRadius:");
            }
          }
          goto LABEL_64;
        }
      }
      objc_msgSend(v60, "setHidden:", 1);
LABEL_64:

      if (-[NSArray count](self->m_rects, "count") <= ++v44)
      {
        v71 = v44;
        goto LABEL_82;
      }
    }
  }
  v71 = 0;
LABEL_82:
  while (-[NSMutableArray count](self->m_rectViews, "count") > v71)
  {
    -[NSMutableArray objectAtIndex:](self->m_rectViews, "objectAtIndex:", v71);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "setHidden:", 1);

    ++v71;
  }

}

- (BOOL)isDisplayingVerticalSelection
{
  if (-[UITextRangeView _startIsHorizontal](self, "_startIsHorizontal"))
    return !-[UITextRangeView _endIsHorizontal](self, "_endIsHorizontal");
  else
    return 1;
}

- (BOOL)_startIsHorizontal
{
  void *v2;
  BOOL v3;

  -[UITextRangeView rects](self, "rects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[UITextSelectionRect startIsHorizontal:](UITextSelectionRect, "startIsHorizontal:", v2);

  return v3;
}

- (BOOL)_endIsHorizontal
{
  void *v2;
  BOOL v3;

  -[UITextRangeView rects](self, "rects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[UITextSelectionRect endIsHorizontal:](UITextSelectionRect, "endIsHorizontal:", v2);

  return v3;
}

- (BOOL)shouldHitTestGrabbers
{
  return -[UITextRangeView mode](self, "mode") != 4 && -[UITextRangeView mode](self, "mode") != 5;
}

- (BOOL)shouldShowGrabbers
{
  return -[UITextRangeView mode](self, "mode") == 0;
}

- (void)updateGrabbers
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _BOOL4 v8;
  _BOOL4 v9;
  UISelectionGrabber *v10;
  UISelectionGrabber *v11;
  UISelectionGrabber *v12;
  uint64_t v13;
  UISelectionGrabber *v14;
  UISelectionGrabber *v15;
  UISelectionGrabber *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  UISelectionGrabber *m_startGrabber;
  UISelectionGrabber *m_endGrabber;
  uint64_t v26;
  CGFloat v30;
  CGFloat v31;
  double width;
  double height;
  uint64_t v34;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double MinX;
  BOOL v63;
  double v64;
  CGFloat v65;
  CGFloat v66;
  double MinY;
  CGFloat v68;
  CGFloat v69;
  double v70;
  double v71;
  CGFloat v72;
  CGFloat v73;
  CGFloat v74;
  double MaxX;
  double v76;
  CGFloat v77;
  double v78;
  CGFloat v79;
  double MaxY;
  double v81;
  BOOL v82;
  CGFloat v83;
  double v84;
  int v85;
  _BOOL4 v86;
  void *v87;
  BOOL IsNull;
  uint64_t v89;
  uint64_t *v90;
  void *v91;
  double v92;
  double v93;
  void *v94;
  void *v95;
  _BOOL8 v96;
  int v97;
  uint64_t v98;
  UISelectionGrabber *v99;
  _BOOL4 v100;
  void *v101;
  void *v102;
  void *v103;
  double v104;
  double v105;
  double v106;
  double v107;
  void *v108;
  _BOOL8 v109;
  int v110;
  uint64_t v111;
  UISelectionGrabber *v112;
  double v113;
  double v114;
  double v115;
  CGFloat v116;
  double v117;
  double v118;
  double v119;
  double v120;
  double v121;
  double v122;
  CGFloat y;
  CGFloat v124;
  CGFloat v125;
  CGFloat x;
  CGFloat rect;
  _QWORD v128[5];
  _QWORD v129[6];
  CGRect v130;
  CGRect v131;
  CGRect v132;
  CGRect v133;
  CGRect v134;
  CGRect v135;
  CGRect v136;
  CGRect v137;
  CGRect v138;
  CGRect v139;
  CGRect v140;
  CGRect v141;
  CGRect v142;
  CGRect v143;
  CGRect v144;
  CGRect v145;
  CGRect v146;
  CGRect v147;
  CGRect v148;
  CGRect v149;
  CGRect v150;
  CGRect v151;
  CGRect v152;
  CGRect v153;
  CGRect v154;
  CGRect v155;
  CGRect v156;
  CGRect v157;
  CGRect v158;
  CGRect v159;
  CGRect v160;
  CGRect v161;
  CGRect v162;
  CGRect v163;

  -[UITextRangeView selectionView](self, "selectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "shouldSuppressSelectionHandles");

  -[UITextRangeView container](self, "container");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    if (((objc_msgSend(v5, "_shouldSuppressSelectionHandles") | v4) & 1) != 0)
      goto LABEL_19;
  }
  else if ((v4 & 1) != 0)
  {
LABEL_19:
    -[UISelectionGrabber removeFromSuperview](self->m_startGrabber, "removeFromSuperview");
    -[UISelectionGrabber removeFromSuperview](self->m_endGrabber, "removeFromSuperview");
    m_startGrabber = self->m_startGrabber;
    self->m_startGrabber = 0;

    m_endGrabber = self->m_endGrabber;
    self->m_endGrabber = 0;

    goto LABEL_20;
  }
  if (!-[UITextRangeView shouldShowGrabbers](self, "shouldShowGrabbers"))
    goto LABEL_19;
  -[UITextRangeView rects](self, "rects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (!v7)
    goto LABEL_20;
  v8 = -[UITextRangeView _startIsHorizontal](self, "_startIsHorizontal");
  v9 = -[UITextRangeView _endIsHorizontal](self, "_endIsHorizontal");
  if (!self->m_startGrabber)
  {
    v10 = [UISelectionGrabber alloc];
    v11 = -[UISelectionGrabber initWithFrame:](v10, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v12 = self->m_startGrabber;
    self->m_startGrabber = v11;

    -[UISelectionGrabber setHidden:](self->m_startGrabber, "setHidden:", 1);
    if (v8)
      v13 = 0;
    else
      v13 = 3;
    -[UISelectionGrabber setOrientation:](self->m_startGrabber, "setOrientation:", v13);
  }
  if (!self->m_endGrabber)
  {
    v14 = [UISelectionGrabber alloc];
    v15 = -[UISelectionGrabber initWithFrame:](v14, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v16 = self->m_endGrabber;
    self->m_endGrabber = v15;

    -[UISelectionGrabber setHidden:](self->m_endGrabber, "setHidden:", 1);
    if (v9)
      v17 = 1;
    else
      v17 = 2;
    -[UISelectionGrabber setOrientation:](self->m_endGrabber, "setOrientation:", v17);
  }
  -[UIView window](self, "window");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[UIView window](self, "window");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "convertRect:toView:", self, 0.0, 0.0, 1.0, 1.0);
    v21 = v20;
    v23 = v22;

  }
  else
  {
    v23 = 1.0;
    v21 = 1.0;
  }
  -[UITextRangeView startEdge](self, "startEdge");
  if (v8)
  {
    v30 = -0.5;
    v31 = 0.0;
  }
  else
  {
    v30 = 0.0;
    v31 = -0.5;
  }
  v130 = CGRectInset(*(CGRect *)&v26, v30, v31);
  x = v130.origin.x;
  width = v130.size.width;
  height = v130.size.height;
  y = v130.origin.y;
  -[UITextRangeView endEdge](self, "endEdge");
  v38 = v23 * height;
  v39 = v21 * width;
  if (v8)
    v40 = v21 * width;
  else
    v40 = v23 * height;
  v114 = width;
  v117 = v40;
  if (v8)
    v41 = height;
  else
    v41 = v23 * height;
  rect = v41;
  if (v8)
    v42 = v21 * width;
  else
    v42 = width;
  v125 = v42;
  if (v9)
  {
    v131 = CGRectInset(*(CGRect *)&v34, -0.5, 0.0);
    v120 = v131.origin.y;
    v121 = v131.size.height;
    v122 = v21 * v131.size.width;
    v119 = v131.origin.x + v131.size.width - v21 * v131.size.width;
  }
  else
  {
    v132 = CGRectInset(*(CGRect *)&v34, 0.0, -0.5);
    v119 = v132.origin.x;
    v121 = v23 * v132.size.height;
    v122 = v132.size.width;
    v120 = v132.origin.y + v132.size.height - v23 * v132.size.height;
  }
  if (v8)
    v43 = v21;
  else
    v43 = v23;
  -[UITextRangeView container](self, "container");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "textInputView");
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  -[UITextRangeView _selectionClipRect](self, "_selectionClipRect");
  v46 = v133.origin.x;
  v47 = v133.origin.y;
  v48 = v133.size.width;
  v49 = v133.size.height;
  if (!CGRectIsNull(v133))
  {
    objc_msgSend(v45, "convertRect:toView:", self, v46, v47, v48, v49);
    v46 = v50;
    v47 = v51;
    v48 = v52;
    v49 = v53;
  }
  if (v45)
  {
    v134.origin.x = v46;
    v134.origin.y = v47;
    v134.size.width = v48;
    v134.size.height = v49;
    if (!CGRectIsNull(v134))
    {
      v118 = v43 * v117;
      if (v8)
      {
        v135.size.width = v125;
        v135.origin.x = x;
        v135.origin.y = y;
        v135.size.height = rect;
        MinX = CGRectGetMinX(v135);
        v136.origin.x = v46;
        v136.origin.y = v47;
        v136.size.width = v48;
        v136.size.height = v49;
        if (MinX >= CGRectGetMinX(v136))
        {
          v64 = v125;
          v66 = x;
          v65 = rect;
        }
        else
        {
          v137.origin.x = x;
          v137.origin.y = y;
          v137.size.width = v125;
          v137.size.height = rect;
          v115 = CGRectGetMinX(v137);
          v138.origin.x = v46;
          v138.origin.y = v47;
          v138.size.width = v48;
          v138.size.height = v49;
          v63 = v115 < CGRectGetMinX(v138) - v118;
          v64 = v125;
          v65 = rect;
          v66 = x;
          if (!v63)
          {
            v139.origin.x = v46;
            v139.origin.y = v47;
            v139.size.width = v48;
            v139.size.height = v49;
            v66 = CGRectGetMinX(v139);
            v64 = v39;
            v65 = height;
          }
        }
        v72 = v66;
        v73 = y;
        v116 = v64;
        v74 = v65;
        MaxX = CGRectGetMaxX(*(CGRect *)&v66);
        v145.origin.x = v46;
        v145.origin.y = v47;
        v145.size.width = v48;
        v145.size.height = v49;
        if (MaxX <= v118 + CGRectGetMaxX(v145))
        {
          v150.origin.x = v72;
          v150.origin.y = y;
          v150.size.width = v116;
          v150.size.height = v65;
          v84 = CGRectGetMaxX(v150);
          v151.origin.x = v46;
          v151.origin.y = v47;
          v151.size.width = v48;
          v151.size.height = v49;
          if (v84 >= CGRectGetMaxX(v151))
          {
            v152.origin.x = v46;
            v152.origin.y = v47;
            v152.size.width = v48;
            v152.size.height = v49;
            v76 = CGRectGetMaxX(v152) - v118;
            v71 = y;
          }
          else
          {
            v71 = y;
            v76 = v72;
          }
        }
        else
        {
          v71 = y;
          v76 = v72;
        }
      }
      else
      {
        v140.origin.x = x;
        v140.origin.y = y;
        v140.size.width = v125;
        v140.size.height = rect;
        MinY = CGRectGetMinY(v140);
        v141.origin.x = v46;
        v141.origin.y = v47;
        v141.size.width = v48;
        v141.size.height = v49;
        if (MinY >= CGRectGetMinY(v141))
        {
          v70 = v125;
          v68 = rect;
          v71 = y;
        }
        else
        {
          v142.origin.x = x;
          v142.origin.y = y;
          v142.size.width = v125;
          v68 = rect;
          v142.size.height = rect;
          v113 = CGRectGetMinY(v142);
          v143.origin.x = v46;
          v143.origin.y = v47;
          v143.size.width = v48;
          v143.size.height = v49;
          v69 = CGRectGetMinY(v143);
          v70 = v125;
          v71 = y;
          if (v113 >= v69 - v118)
          {
            v144.origin.x = v46;
            v144.origin.y = v47;
            v144.size.width = v48;
            v144.size.height = v49;
            v71 = CGRectGetMinY(v144);
            v70 = v114;
            v68 = v38;
          }
        }
        v76 = x;
        v77 = x;
        v78 = v71;
        v124 = v70;
        v79 = v68;
        MaxY = CGRectGetMaxY(*(CGRect *)(&v70 - 2));
        v146.origin.x = v46;
        v146.origin.y = v47;
        v146.size.width = v48;
        v146.size.height = v49;
        if (MaxY >= CGRectGetMaxY(v146))
        {
          v147.origin.x = x;
          v147.origin.y = v71;
          v147.size.width = v124;
          v147.size.height = v68;
          v81 = CGRectGetMaxY(v147);
          v148.origin.x = v46;
          v148.origin.y = v47;
          v148.size.width = v48;
          v148.size.height = v49;
          v82 = v81 > v118 + CGRectGetMaxY(v148);
          v83 = v125;
          if (!v82)
          {
            v149.origin.x = v46;
            v149.origin.y = v47;
            v149.size.width = v48;
            v149.size.height = v49;
            v71 = v118 + CGRectGetMaxY(v149);
          }
          goto LABEL_63;
        }
      }
      v83 = v125;
LABEL_63:
      v153.origin.x = v46;
      v153.origin.y = v47;
      v153.size.width = v48;
      v153.size.height = v49;
      v160.origin.x = v76;
      v160.origin.y = v71;
      v160.size.width = v83;
      v160.size.height = rect;
      v154 = CGRectIntersection(v153, v160);
      v60 = v154.origin.x;
      v58 = v154.origin.y;
      v59 = v154.size.width;
      v61 = v154.size.height;
      v154.origin.x = v46;
      v154.origin.y = v47;
      v154.size.width = v48;
      v154.size.height = v49;
      v161.origin.x = v119;
      v161.origin.y = v120;
      v161.size.height = v121;
      v161.size.width = v122;
      v155 = CGRectIntersection(v154, v161);
      v57 = v155.origin.x;
      v56 = v155.origin.y;
      v54 = v155.size.width;
      v55 = v155.size.height;
      goto LABEL_64;
    }
  }
  v55 = v121;
  v54 = v122;
  v57 = v119;
  v56 = v120;
  v58 = y;
  v59 = v125;
  v60 = x;
  v61 = rect;
LABEL_64:
  v85 = _AXSReduceMotionEnabled();
  if (-[UIView isHidden](self->m_startGrabber, "isHidden"))
  {
    v86 = 1;
  }
  else
  {
    -[UIView superview](self->m_startGrabber, "superview");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = v87 == 0;

  }
  v156.origin.x = v60;
  v156.origin.y = v58;
  v156.size.width = v59;
  v156.size.height = v61;
  IsNull = CGRectIsNull(v156);
  v89 = MEMORY[0x1E0C809B0];
  v90 = &qword_186677000;
  if (IsNull || !UIRectIsDiscrete(v60, v58, v59, v61))
  {
    if (v85)
      v97 = 1;
    else
      v97 = v86;
    if (v97)
      v98 = 0;
    else
      v98 = 2;
    v99 = self->m_startGrabber;
    v129[0] = v89;
    v129[1] = 3221225472;
    v129[2] = __33__UITextRangeView_updateGrabbers__block_invoke;
    v129[3] = &unk_1E16B1B28;
    v129[4] = self;
    -[UISelectionGrabber transitionDot:completion:](v99, "transitionDot:completion:", v98, v129, *(_QWORD *)&v113);
  }
  else
  {
    -[UIView frame](self->m_startGrabber, "frame");
    v162.origin.x = v60;
    v162.origin.y = v58;
    v162.size.width = v59;
    v162.size.height = v61;
    if (!CGRectEqualToRect(v157, v162))
      -[UITextRangeView _cancelGrabberTransitionOutAnimations:](self, "_cancelGrabberTransitionOutAnimations:", self->m_startGrabber);
    -[UITextRangeView startCustomPath](self, "startCustomPath", *(_QWORD *)&v113);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "setLineWidth:", v59);
    v92 = v59;
    v93 = v61;
    if (v91)
    {
      objc_msgSend(v91, "boundingRect");
      objc_msgSend(v45, "convertRect:toView:", self);
    }
    v94 = v45;
    -[UITextRangeView _setGrabber:bounds:center:](self, "_setGrabber:bounds:center:", self->m_startGrabber, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), v92, v93, v59 * 0.5 + v60, v61 * 0.5 + v58);
    if (v91)
      -[UIView setNeedsDisplay](self->m_startGrabber, "setNeedsDisplay");
    -[UISelectionGrabber setCustomPath:](self->m_startGrabber, "setCustomPath:", v91);
    -[UISelectionGrabber setHidden:](self->m_startGrabber, "setHidden:", 0);
    -[UISelectionGrabber updateDot](self->m_startGrabber, "updateDot");
    -[UIView superview](self->m_startGrabber, "superview");
    v95 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v95)
      -[UIView addSubview:](self, "addSubview:", self->m_startGrabber);
    if (v85)
      v96 = 0;
    else
      v96 = v86;
    -[UISelectionGrabber transitionDot:completion:](self->m_startGrabber, "transitionDot:completion:", v96, 0);

    v45 = v94;
    v90 = &qword_186677000;
  }
  if (-[UIView isHidden](self->m_endGrabber, "isHidden"))
  {
    v100 = 1;
  }
  else
  {
    -[UIView superview](self->m_endGrabber, "superview");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    v100 = v101 == 0;

  }
  v158.origin.x = v57;
  v158.origin.y = v56;
  v158.size.width = v54;
  v158.size.height = v55;
  if (CGRectIsNull(v158) || !UIRectIsDiscrete(v57, v56, v54, v55))
  {
    if (v85)
      v110 = 1;
    else
      v110 = v100;
    if (v110)
      v111 = 0;
    else
      v111 = 2;
    v112 = self->m_endGrabber;
    v128[0] = v89;
    v128[1] = v90[481];
    v128[2] = __33__UITextRangeView_updateGrabbers__block_invoke_2;
    v128[3] = &unk_1E16B1B28;
    v128[4] = self;
    -[UISelectionGrabber transitionDot:completion:](v112, "transitionDot:completion:", v111, v128);
  }
  else
  {
    -[UIView frame](self->m_endGrabber, "frame");
    v163.origin.x = v57;
    v163.origin.y = v56;
    v163.size.width = v54;
    v163.size.height = v55;
    if (!CGRectEqualToRect(v159, v163))
      -[UITextRangeView _cancelGrabberTransitionOutAnimations:](self, "_cancelGrabberTransitionOutAnimations:", self->m_endGrabber);
    v102 = v45;
    -[UITextRangeView endCustomPath](self, "endCustomPath");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "setLineWidth:", v54);
    -[UISelectionGrabber setCustomPath:](self->m_endGrabber, "setCustomPath:", v103);
    if (v103)
    {
      objc_msgSend(v103, "boundingRect");
      v57 = v104;
      v56 = v105;
      v54 = v106;
      v55 = v107;
    }
    -[UITextRangeView _setGrabber:bounds:center:](self, "_setGrabber:bounds:center:", self->m_endGrabber, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), v54, v55, v57 + v54 * 0.5, v56 + v55 * 0.5);
    -[UISelectionGrabber setHidden:](self->m_endGrabber, "setHidden:", 0);
    -[UISelectionGrabber updateDot](self->m_endGrabber, "updateDot");
    -[UIView superview](self->m_endGrabber, "superview");
    v108 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v108)
      -[UIView addSubview:](self, "addSubview:", self->m_endGrabber);
    if (v85)
      v109 = 0;
    else
      v109 = v100;
    -[UISelectionGrabber transitionDot:completion:](self->m_endGrabber, "transitionDot:completion:", v109, 0);

    v45 = v102;
  }

LABEL_20:
}

uint64_t __33__UITextRangeView_updateGrabbers__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 536), "setHidden:", 1);
}

uint64_t __33__UITextRangeView_updateGrabbers__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 544), "setHidden:", 1);
}

- (void)_setGrabber:(id)a3 bounds:(CGRect)a4 center:(CGPoint)a5
{
  double y;
  double x;
  double height;
  double width;
  double v9;
  double v10;
  id v11;

  y = a5.y;
  x = a5.x;
  height = a4.size.height;
  width = a4.size.width;
  v9 = a4.origin.y;
  v10 = a4.origin.x;
  v11 = a3;
  objc_msgSend(v11, "setBounds:", v10, v9, width, height);
  objc_msgSend(v11, "setCenter:", x, y);

}

- (void)_cancelGrabberTransitionOutAnimations:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  objc_msgSend(v3, "layer");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAnimationForKey:", CFSTR("stemView transition out"));
  objc_msgSend(v6, "removeAnimationForKey:", CFSTR("stemView opacity transition out"));
  objc_msgSend(v3, "_dotView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "removeAnimationForKey:", CFSTR("dotView transition out"));
  objc_msgSend(v5, "removeAnimationForKey:", CFSTR("dotView opacity transition out"));

}

- (CGPoint)magnifierPoint
{
  _BOOL4 v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  _BOOL4 v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGPoint result;

  if (-[UITextRangeView baseIsStart](self, "baseIsStart"))
  {
    v3 = -[UITextRangeView _endIsHorizontal](self, "_endIsHorizontal");
    -[UITextRangeView endEdge](self, "endEdge");
    v5 = v4;
    -[UITextRangeView endEdge](self, "endEdge");
    v8 = v6 + v7;
    v9 = v6 + v7 * 0.5;
    if (v3)
      v10 = v9;
    else
      v10 = v8;
  }
  else
  {
    v11 = -[UITextRangeView _startIsHorizontal](self, "_startIsHorizontal");
    -[UITextRangeView startEdge](self, "startEdge");
    v5 = v12;
    -[UITextRangeView startEdge](self, "startEdge");
    if (v11)
      v10 = v13 + v14 * 0.5;
    else
      v10 = v13;
  }
  -[UITextRangeView container](self, "container");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "textInputView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    -[UITextRangeView container](self, "container");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "textInputView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView convertPoint:toView:](self, "convertPoint:toView:", v18, v5, v10);
    v5 = v19;
    v10 = v20;

  }
  v21 = v5;
  v22 = v10;
  result.y = v22;
  result.x = v21;
  return result;
}

- (CGPoint)convertFromMagnifierPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  -[UITextRangeView container](self, "container");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "textInputView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[UITextRangeView container](self, "container");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "textInputView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView convertPoint:fromView:](self, "convertPoint:fromView:", v9, x, y);
    x = v10;
    y = v11;

  }
  v12 = x;
  v13 = y;
  result.y = v13;
  result.x = v12;
  return result;
}

- (BOOL)areSelectionRectsVisible
{
  NSMutableArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->m_rectViews;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "isHidden", (_QWORD)v7))
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (double)inverseScaleForView:(id)a3
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v8;

  objc_msgSend(a3, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "transform");
    v5 = v8;
  }
  else
  {
    v5 = 0.0;
  }
  v6 = 1.0 / v5;

  return v6;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  const __CFString *v27;
  CGFloat v28;
  CGFloat v29;
  void *v30;
  CGPoint v32;
  CGPoint v33;
  CGRect v34;
  CGRect v35;

  v7 = a4;
  v8 = a5;
  -[UITextRangeView _startEdgeHitRectWithPrecision:](self, "_startEdgeHitRectWithPrecision:", 2);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  -[UITextRangeView _endEdgeHitRectWithPrecision:](self, "_endEdgeHitRectWithPrecision:", 2);
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;
  objc_msgSend(v7, "location");
  v32.x = v25;
  v32.y = v26;
  v34.origin.x = v10;
  v34.origin.y = v12;
  v34.size.width = v14;
  v34.size.height = v16;
  if (CGRectContainsPoint(v34, v32))
  {
    v27 = CFSTR("_UITextCursorStartGrabberRegion");
LABEL_5:
    +[UIPointerRegion regionWithRect:identifier:](UIPointerRegion, "regionWithRect:identifier:", v27, v10, v12, v14, v16);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_6;
  }
  objc_msgSend(v7, "location");
  v33.x = v28;
  v33.y = v29;
  v35.origin.x = v18;
  v35.origin.y = v20;
  v35.size.width = v22;
  v35.size.height = v24;
  v30 = v8;
  if (CGRectContainsPoint(v35, v33))
  {
    v10 = v18;
    v12 = v20;
    v14 = v22;
    v16 = v24;
    v27 = CFSTR("_UITextCursorEndGrabberRegion");
    goto LABEL_5;
  }
LABEL_6:

  return v30;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  return 0;
}

- (CGRect)startEdge
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->m_startEdge.origin.x;
  y = self->m_startEdge.origin.y;
  width = self->m_startEdge.size.width;
  height = self->m_startEdge.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setStartEdge:(CGRect)a3
{
  self->m_startEdge = a3;
}

- (CGRect)endEdge
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->m_endEdge.origin.x;
  y = self->m_endEdge.origin.y;
  width = self->m_endEdge.size.width;
  height = self->m_endEdge.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setEndEdge:(CGRect)a3
{
  self->m_endEdge = a3;
}

- (CGPoint)basePoint
{
  double x;
  double y;
  CGPoint result;

  x = self->m_basePoint.x;
  y = self->m_basePoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGPoint)extentPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->m_extentPoint.x;
  y = self->m_extentPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGPoint)initialExtentPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->m_initialExtentPoint.x;
  y = self->m_initialExtentPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setInitialExtentPoint:(CGPoint)a3
{
  self->m_initialExtentPoint = a3;
}

- (UISelectionGrabber)startGrabber
{
  return self->m_startGrabber;
}

- (void)setStartGrabber:(id)a3
{
  objc_storeStrong((id *)&self->m_startGrabber, a3);
}

- (UISelectionGrabber)endGrabber
{
  return self->m_endGrabber;
}

- (void)setEndGrabber:(id)a3
{
  objc_storeStrong((id *)&self->m_endGrabber, a3);
}

- (BOOL)animateUpdate
{
  return self->m_animateUpdate;
}

- (void)setAnimateUpdate:(BOOL)a3
{
  self->m_animateUpdate = a3;
}

- (BOOL)commandsWereShowing
{
  return self->m_commandsWereShowing;
}

- (void)setCommandsWereShowing:(BOOL)a3
{
  self->m_commandsWereShowing = a3;
}

- (BOOL)willBeginMagnifying
{
  return self->m_willBeginMagnifying;
}

- (void)setWillBeginMagnifying:(BOOL)a3
{
  self->m_willBeginMagnifying = a3;
}

- (BOOL)magnifying
{
  return self->m_magnifying;
}

- (void)setMagnifying:(BOOL)a3
{
  self->m_magnifying = a3;
}

- (BOOL)inGesture
{
  return self->m_inGesture;
}

- (void)setInGesture:(BOOL)a3
{
  self->m_inGesture = a3;
}

- (BOOL)isScrolling
{
  return self->m_scrolling;
}

- (void)setIsScrolling:(BOOL)a3
{
  self->m_scrolling = a3;
}

- (BOOL)scaling
{
  return self->m_scaling;
}

- (void)setScaling:(BOOL)a3
{
  self->m_scaling = a3;
}

- (BOOL)rotating
{
  return self->m_rotating;
}

- (void)setRotating:(BOOL)a3
{
  self->m_rotating = a3;
}

- (BOOL)inputViewIsChanging
{
  return self->m_inputViewIsChanging;
}

- (void)setInputViewIsChanging:(BOOL)a3
{
  self->m_inputViewIsChanging = a3;
}

- (BOOL)isClearingRange
{
  return self->m_isClearingRange;
}

- (void)setIsClearingRange:(BOOL)a3
{
  self->m_isClearingRange = a3;
}

- (BOOL)shouldStayVisible
{
  return self->m_shouldStayVisible;
}

- (void)setShouldStayVisible:(BOOL)a3
{
  self->m_shouldStayVisible = a3;
}

- (BOOL)baseIsStart
{
  return self->_baseIsStart;
}

- (void)setBaseIsStart:(BOOL)a3
{
  self->_baseIsStart = a3;
}

- (CGPoint)activeTouchPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_activeTouchPoint.x;
  y = self->_activeTouchPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (UISelectionGrabberCustomPath)startCustomPath
{
  return self->_startCustomPath;
}

- (void)setStartCustomPath:(id)a3
{
  objc_storeStrong((id *)&self->_startCustomPath, a3);
}

- (UISelectionGrabberCustomPath)endCustomPath
{
  return self->_endCustomPath;
}

- (void)setEndCustomPath:(id)a3
{
  objc_storeStrong((id *)&self->_endCustomPath, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endCustomPath, 0);
  objc_storeStrong((id *)&self->_startCustomPath, 0);
  objc_storeStrong((id *)&self->_pointerInteraction, 0);
  objc_storeStrong((id *)&self->m_endGrabber, 0);
  objc_storeStrong((id *)&self->m_startGrabber, 0);
  objc_storeStrong((id *)&self->m_rectContainerView, 0);
  objc_storeStrong((id *)&self->m_activeTouch, 0);
  objc_storeStrong((id *)&self->m_rectViews, 0);
  objc_storeStrong((id *)&self->m_rects, 0);
  objc_destroyWeak((id *)&self->m_container);
  objc_destroyWeak((id *)&self->m_selectionView);
}

@end
