@implementation THHighlightGestureController

- (void)setUpGestureRecognizers
{
  THTimeoutDragGestureRecognizer *v3;
  THTimeoutDragGestureRecognizer *v4;
  THTimeoutLongPressGestureRecognizer *v5;

  if ((TSUSupportsTextInteraction(self, a2) & 1) == 0)
  {
    v3 = -[THTimeoutDragGestureRecognizer initWithTarget:action:]([THTimeoutDragGestureRecognizer alloc], "initWithTarget:action:", self, "p_highlightGesture:");
    -[THTimeoutDragGestureRecognizer setMinimumPressDuration:](v3, "setMinimumPressDuration:", 0.0);
    -[THTimeoutDragGestureRecognizer setMaximumPressDuration:](v3, "setMaximumPressDuration:", 1.60000002);
    -[THTimeoutDragGestureRecognizer setAllowedTouchTypes:](v3, "setAllowedTouchTypes:", &off_4698E0);
    -[THTimeoutDragGestureRecognizer setStylus:](v3, "setStylus:", 1);
    -[THTimeoutDragGestureRecognizer setDelegate:](v3, "setDelegate:", self);
    objc_msgSend(-[THInteractiveCanvasController canvasView](-[THHighlightGestureController interactiveCanvasController](self, "interactiveCanvasController"), "canvasView"), "addGestureRecognizer:", v3);
    -[THHighlightGestureController setStylusHighlightGestureRecognizer:](self, "setStylusHighlightGestureRecognizer:", v3);
    v4 = -[THTimeoutDragGestureRecognizer initWithTarget:action:]([THTimeoutDragGestureRecognizer alloc], "initWithTarget:action:", self, "p_highlightGesture:");
    -[THTimeoutDragGestureRecognizer setMinimumPressDuration:](v4, "setMinimumPressDuration:", 0.25);
    -[THTimeoutDragGestureRecognizer setMaximumPressDuration:](v4, "setMaximumPressDuration:", 0.600000024);
    -[THTimeoutDragGestureRecognizer setAllowableMovement:](v4, "setAllowableMovement:", 8.0);
    -[THTimeoutDragGestureRecognizer setDelegate:](v4, "setDelegate:", self);
    objc_msgSend(-[THInteractiveCanvasController canvasView](-[THHighlightGestureController interactiveCanvasController](self, "interactiveCanvasController"), "canvasView"), "addGestureRecognizer:", v4);
    -[THHighlightGestureController setHighlightGestureRecognizer:](self, "setHighlightGestureRecognizer:", v4);
    -[THTimeoutDragGestureRecognizer requireGestureRecognizerToFail:](-[THHighlightGestureController highlightGestureRecognizer](self, "highlightGestureRecognizer"), "requireGestureRecognizerToFail:", -[THHighlightGestureController stylusHighlightGestureRecognizer](self, "stylusHighlightGestureRecognizer"));
    objc_msgSend(objc_msgSend(objc_msgSend(-[THInteractiveCanvasController canvasView](-[THHighlightGestureController interactiveCanvasController](self, "interactiveCanvasController"), "canvasView"), "enclosingScrollView"), "panGestureRecognizer"), "requireGestureRecognizerToFail:", -[THHighlightGestureController stylusHighlightGestureRecognizer](self, "stylusHighlightGestureRecognizer"));
    v5 = -[THTimeoutLongPressGestureRecognizer initWithTarget:action:]([THTimeoutLongPressGestureRecognizer alloc], "initWithTarget:action:", self, "p_likelyHighlightGesture:");
    -[THTimeoutLongPressGestureRecognizer setAllowedTouchTypes:](v5, "setAllowedTouchTypes:", &off_4698F8);
    -[THTimeoutLongPressGestureRecognizer setMinimumPressDuration:](v5, "setMinimumPressDuration:", 0.25);
    -[THTimeoutLongPressGestureRecognizer setMaximumPressDuration:](v5, "setMaximumPressDuration:", 1.60000002);
    -[THTimeoutLongPressGestureRecognizer setAllowableMovement:](v5, "setAllowableMovement:", 8.0);
    -[THTimeoutLongPressGestureRecognizer setAllowedTouchTypes:](v5, "setAllowedTouchTypes:", &off_469910);
    -[THTimeoutLongPressGestureRecognizer setDelegate:](v5, "setDelegate:", self);
    objc_msgSend(-[THInteractiveCanvasController canvasView](-[THHighlightGestureController interactiveCanvasController](self, "interactiveCanvasController"), "canvasView"), "addGestureRecognizer:", v5);
    -[THHighlightGestureController setLikelyHighlightGestureRecognizer:](self, "setLikelyHighlightGestureRecognizer:", v5);
    -[THTimeoutLongPressGestureRecognizer requireGestureRecognizerToFail:](-[THHighlightGestureController likelyHighlightGestureRecognizer](self, "likelyHighlightGestureRecognizer"), "requireGestureRecognizerToFail:", -[THHighlightGestureController stylusHighlightGestureRecognizer](self, "stylusHighlightGestureRecognizer"));
    -[THTimeoutDragGestureRecognizer setDependentGestureRecognizer:](v4, "setDependentGestureRecognizer:", v5);
    -[THTimeoutDragGestureRecognizer setDependentGestureRecognizer:](v3, "setDependentGestureRecognizer:", v5);
  }
  -[THHighlightGestureController setMarginNotesGestureRecognizer:](self, "setMarginNotesGestureRecognizer:", objc_msgSend(objc_alloc((Class)UILongPressGestureRecognizer), "initWithTarget:action:", self, "p_marginNoteGesture:"));
  -[UILongPressGestureRecognizer setMinimumPressDuration:](-[THHighlightGestureController marginNotesGestureRecognizer](self, "marginNotesGestureRecognizer"), "setMinimumPressDuration:", 0.0);
  -[UILongPressGestureRecognizer setDelegate:](-[THHighlightGestureController marginNotesGestureRecognizer](self, "marginNotesGestureRecognizer"), "setDelegate:", self);
  -[THTimeoutDragGestureRecognizer requireGestureRecognizerToFail:](-[THHighlightGestureController highlightGestureRecognizer](self, "highlightGestureRecognizer"), "requireGestureRecognizerToFail:", -[THHighlightGestureController marginNotesGestureRecognizer](self, "marginNotesGestureRecognizer"));
  -[THTimeoutDragGestureRecognizer requireGestureRecognizerToFail:](-[THHighlightGestureController stylusHighlightGestureRecognizer](self, "stylusHighlightGestureRecognizer"), "requireGestureRecognizerToFail:", -[THHighlightGestureController marginNotesGestureRecognizer](self, "marginNotesGestureRecognizer"));
  objc_msgSend(-[THInteractiveCanvasController canvasView](-[THHighlightGestureController interactiveCanvasController](self, "interactiveCanvasController"), "canvasView"), "addGestureRecognizer:", -[THHighlightGestureController marginNotesGestureRecognizer](self, "marginNotesGestureRecognizer"));
}

- (void)dealloc
{
  objc_super v3;

  -[THHighlightGestureController setHighlightGestureRecognizer:](self, "setHighlightGestureRecognizer:", 0);
  -[THHighlightGestureController setLikelyHighlightGestureRecognizer:](self, "setLikelyHighlightGestureRecognizer:", 0);
  -[THHighlightGestureController setMarginNotesGestureRecognizer:](self, "setMarginNotesGestureRecognizer:", 0);
  -[THHighlightGestureController setCatalystNotesGestureRecognizer:](self, "setCatalystNotesGestureRecognizer:", 0);
  -[THHighlightGestureController setInteractiveCanvasController:](self, "setInteractiveCanvasController:", 0);
  -[THHighlightGestureController setStylusHighlightGestureRecognizer:](self, "setStylusHighlightGestureRecognizer:", 0);
  if (-[THHighlightGestureController trackingRep](self, "trackingRep"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THHighlightGestureController dealloc]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THHighlightGestureController.m"), 143, CFSTR("highlight gesture being torn down while tracking"));
  if (-[THHighlightGestureController trackingMarginNote](self, "trackingMarginNote"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THHighlightGestureController dealloc]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THHighlightGestureController.m"), 144, CFSTR("highlight gesture being torn down while tracking"));
  if (-[THHighlightGestureController trackingNotesOwner](self, "trackingNotesOwner"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THHighlightGestureController dealloc]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THHighlightGestureController.m"), 145, CFSTR("highlight gesture being torn down while tracking"));
  v3.receiver = self;
  v3.super_class = (Class)THHighlightGestureController;
  -[THHighlightGestureController dealloc](&v3, "dealloc");
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[THTimeoutDragGestureRecognizer setEnabled:](-[THHighlightGestureController highlightGestureRecognizer](self, "highlightGestureRecognizer"), "setEnabled:", a3);
  -[THTimeoutLongPressGestureRecognizer setEnabled:](-[THHighlightGestureController likelyHighlightGestureRecognizer](self, "likelyHighlightGestureRecognizer"), "setEnabled:", v3);
  -[UILongPressGestureRecognizer setEnabled:](-[THHighlightGestureController marginNotesGestureRecognizer](self, "marginNotesGestureRecognizer"), "setEnabled:", v3);
  -[UILongPressGestureRecognizer setEnabled:](-[THHighlightGestureController catalystNotesGestureRecognizer](self, "catalystNotesGestureRecognizer"), "setEnabled:", v3);
}

- (CGPoint)p_clampPointToLine:(CGPoint)a3
{
  double y;
  double x;
  THWPRep *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  THWPRep *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  __int128 v18;
  __int128 v19;
  CGPoint result;
  CGRect v21;

  y = a3.y;
  x = a3.x;
  v6 = -[THHighlightGestureController trackingRep](self, "trackingRep");
  -[THWPRep convertNaturalPointFromUnscaledCanvas:](-[THHighlightGestureController trackingRep](self, "trackingRep"), "convertNaturalPointFromUnscaledCanvas:", x, y);
  -[THWPRep pinToNaturalBounds:andLastLineFragment:](v6, "pinToNaturalBounds:andLastLineFragment:", 1);
  v8 = v7;
  v10 = v9;
  v18 = 0u;
  v19 = 0u;
  v11 = -[THHighlightGestureController trackingRep](self, "trackingRep");
  if (v11)
  {
    -[THWPRep lineMetricsAtPoint:](v11, "lineMetricsAtPoint:", v8, v10);
    v13 = 0;
    v12 = 0;
    v15 = 0;
    v14 = 0;
  }
  else
  {
    v15 = 0;
    v14 = 0;
    v13 = 0;
    v12 = 0;
    v18 = 0u;
    v19 = 0u;
  }
  if (!CGRectIsEmpty(*(CGRect *)&v12))
  {
    -[THWPRep convertNaturalRectToUnscaledCanvas:](-[THHighlightGestureController trackingRep](self, "trackingRep"), "convertNaturalRectToUnscaledCanvas:", v18, v19);
    y = CGRectGetMidY(v21);
  }
  v16 = x;
  v17 = y;
  result.y = v17;
  result.x = v16;
  return result;
}

- (void)p_beginMagnification:(id)a3 atPoint:(CGPoint)a4
{
  double v6;
  double v7;
  double v8;
  double v9;

  -[THHighlightGestureController p_clampPointToLine:](self, "p_clampPointToLine:", a4.x, a4.y);
  -[THInteractiveCanvasController convertUnscaledToBoundsPoint:](-[THHighlightGestureController interactiveCanvasController](self, "interactiveCanvasController"), "convertUnscaledToBoundsPoint:", v6, v7);
  self->mMagnifying = 1;
  objc_msgSend(+[TSWPTextMagnifierHorizontalRanged sharedRangedMagnifier](TSWPTextMagnifierHorizontalRanged, "sharedRangedMagnifier"), "beginMagnifyingTarget:magnificationPoint:offset:animated:", a3, 1, v8, v9, CGPointZero.x, CGPointZero.y);
  objc_msgSend(+[TSWPHyperlinkUIController sharedHyperlinkUIController](TSWPHyperlinkUIController, "sharedHyperlinkUIController"), "endUISession");
}

- (void)p_moveLoupe:(CGPoint)a3 inRep:(id)a4
{
  double v5;
  double v6;
  double v7;
  double v8;

  -[THHighlightGestureController p_clampPointToLine:](self, "p_clampPointToLine:", a4, a3.x, a3.y);
  -[THInteractiveCanvasController convertUnscaledToBoundsPoint:](-[THHighlightGestureController interactiveCanvasController](self, "interactiveCanvasController"), "convertUnscaledToBoundsPoint:", v5, v6);
  objc_msgSend(+[TSWPTextMagnifierHorizontalRanged sharedRangedMagnifier](TSWPTextMagnifierHorizontalRanged, "sharedRangedMagnifier"), "setMagnificationPoint:", v7, v8);
}

- (void)p_stopMagnification:(id)a3
{
  if (self->mMagnifying)
  {
    if (objc_msgSend(+[TSWPTextMagnifierHorizontalRanged sharedRangedMagnifier](TSWPTextMagnifierHorizontalRanged, "sharedRangedMagnifier", a3), "target"))
    {
      objc_msgSend(+[TSWPTextMagnifierHorizontalRanged sharedRangedMagnifier](TSWPTextMagnifierHorizontalRanged, "sharedRangedMagnifier"), "stopMagnifying:", 1);
      self->mMagnifying = 0;
    }
  }
}

- (void)handleHighlightState:(int64_t)a3 atPoint:(CGPoint)a4
{
  double y;
  double x;
  CGFloat v8;
  CGFloat v9;
  double v10;
  double v11;
  THWPHighlightController *v12;
  double v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  _BOOL4 mTrackingHighlight;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  y = a4.y;
  x = a4.x;
  -[THInteractiveCanvasController endEditing](-[THHighlightGestureController interactiveCanvasController](self, "interactiveCanvasController"), "endEditing");
  -[THInteractiveCanvasController convertBoundsToUnscaledPoint:](-[THHighlightGestureController interactiveCanvasController](self, "interactiveCanvasController"), "convertBoundsToUnscaledPoint:", x, y);
  v10 = v8;
  v11 = v9;
  switch(a3)
  {
    case 1:
      self->mHighlighting = 1;
      self->mLongPressGestureStartPoint.x = v8;
      self->mLongPressGestureStartPoint.y = v9;
      if (!-[THHighlightGestureController trackingRep](self, "trackingRep"))
      {
        v18 = objc_opt_class(THWPRep, v16);
        -[THHighlightGestureController setTrackingRep:](self, "setTrackingRep:", TSUDynamicCast(v18, -[THInteractiveCanvasController hitRep:](-[THHighlightGestureController interactiveCanvasController](self, "interactiveCanvasController"), "hitRep:", v10, v11)));
        if (!-[THHighlightGestureController trackingRep](self, "trackingRep"))
          objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THHighlightGestureController handleHighlightState:atPoint:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THHighlightGestureController.m"), 228, CFSTR("Gesture shouldn't have fired if we weren't over a text rep"));
        goto LABEL_15;
      }
      break;
    case 2:
      if (!self->mTrackingHighlight)
      {
LABEL_15:
        self->mTrackingHighlight = 1;
        -[THWPHighlightController beginDragHighlightAtPoint:](-[THWPRep highlightController](-[THHighlightGestureController trackingRep](self, "trackingRep"), "highlightController"), "beginDragHighlightAtPoint:", self->mLongPressGestureStartPoint.x, self->mLongPressGestureStartPoint.y);
      }
      -[THWPHighlightController moveDragHighlightToPoint:](-[THWPRep highlightController](-[THHighlightGestureController trackingRep](self, "trackingRep"), "highlightController"), "moveDragHighlightToPoint:", v10, v11);
      break;
    case 3:
      mTrackingHighlight = self->mTrackingHighlight;
      v12 = -[THWPRep highlightController](-[THHighlightGestureController trackingRep](self, "trackingRep"), "highlightController");
      v13 = v10;
      v14 = v11;
      if (mTrackingHighlight)
      {
        v15 = 1;
        goto LABEL_11;
      }
      if (-[THWPHighlightController isCanvasPointOnHighlight:](v12, "isCanvasPointOnHighlight:", v10, v11))
      {
        v20 = objc_opt_class(TSWPEditingController, v19);
        TSUDynamicCast(v20, -[THInteractiveCanvasController beginEditingRep:](-[THHighlightGestureController interactiveCanvasController](self, "interactiveCanvasController"), "beginEditingRep:", -[THHighlightGestureController trackingRep](self, "trackingRep")));
      }
      goto LABEL_12;
    case 4:
    case 5:
      -[THHighlightGestureController p_stopMagnification:](self, "p_stopMagnification:", -[THHighlightGestureController trackingRep](self, "trackingRep"));
      if (self->mTrackingHighlight)
      {
        v12 = -[THWPRep highlightController](-[THHighlightGestureController trackingRep](self, "trackingRep"), "highlightController");
        v13 = v10;
        v14 = v11;
        v15 = 0;
LABEL_11:
        -[THWPHighlightController endDragHighlightAtPoint:accept:](v12, "endDragHighlightAtPoint:accept:", v15, v13, v14);
      }
LABEL_12:
      *(_WORD *)&self->mHighlighting = 0;
      -[THHighlightGestureController setTrackingRep:](self, "setTrackingRep:", 0);
      break;
    default:
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THHighlightGestureController handleHighlightState:atPoint:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THHighlightGestureController.m"), 285, CFSTR("Unexpected gesture state"));
      break;
  }
}

- (void)p_highlightGesture:(id)a3
{
  id v5;
  double v6;
  double v7;
  CGFloat v8;
  CGFloat v9;
  double v10;
  double v11;
  THWPHighlightController *v12;
  double v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  _BOOL4 mTrackingHighlight;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unsigned int v25;
  uint64_t v26;
  void *v27;
  double v28;
  void *v29;
  double v30;
  double v31;

  -[THInteractiveCanvasController endEditing](-[THHighlightGestureController interactiveCanvasController](self, "interactiveCanvasController"), "endEditing");
  v5 = objc_msgSend(a3, "state");
  objc_msgSend(a3, "locationInView:", -[THInteractiveCanvasController canvasView](-[THHighlightGestureController interactiveCanvasController](self, "interactiveCanvasController"), "canvasView"));
  -[THInteractiveCanvasController convertBoundsToUnscaledPoint:](-[THHighlightGestureController interactiveCanvasController](self, "interactiveCanvasController"), "convertBoundsToUnscaledPoint:", v6, v7);
  v10 = v8;
  v11 = v9;
  switch((unint64_t)v5)
  {
    case 1uLL:
      self->mHighlighting = 1;
      self->mLongPressGestureStartPoint.x = v8;
      self->mLongPressGestureStartPoint.y = v9;
      if (!-[THHighlightGestureController trackingRep](self, "trackingRep"))
      {
        v17 = objc_opt_class(THWPRep, v16);
        -[THHighlightGestureController setTrackingRep:](self, "setTrackingRep:", ((uint64_t (*)(uint64_t, id))TSUDynamicCast)(v17, -[THInteractiveCanvasController hitRep:](-[THHighlightGestureController interactiveCanvasController](self, "interactiveCanvasController"), "hitRep:", v10, v11)));
        if (!-[THHighlightGestureController trackingRep](self, "trackingRep"))
          objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THHighlightGestureController p_highlightGesture:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THHighlightGestureController.m"), 303, CFSTR("Gesture shouldn't have fired if we weren't over a text rep"));
        if (-[THHighlightGestureController _shouldShowMagnifierForGesture:](self, "_shouldShowMagnifierForGesture:", a3))
        {
          -[THHighlightGestureController p_beginMagnification:atPoint:](self, "p_beginMagnification:atPoint:", -[THHighlightGestureController trackingRep](self, "trackingRep"), v10, v11);
        }
        if (-[THHighlightGestureController _shouldBeginImmediateHighlightForGesture:](self, "_shouldBeginImmediateHighlightForGesture:", a3))
        {
          goto LABEL_17;
        }
      }
      break;
    case 2uLL:
      if (-[THHighlightGestureController _shouldShowMagnifierForGesture:](self, "_shouldShowMagnifierForGesture:", a3))
        -[THHighlightGestureController p_moveLoupe:inRep:](self, "p_moveLoupe:inRep:", -[THHighlightGestureController trackingRep](self, "trackingRep"), v10, v11);
      v19 = objc_opt_class(THTimeoutDragGestureRecognizer, v18);
      TSUDynamicCast(v19, a3);
      if ((objc_msgSend(v20, "hasMovedDistance:", 10.6400003, 16.0) & 1) != 0
        || -[THHighlightGestureController _shouldBeginImmediateHighlightForGesture:](self, "_shouldBeginImmediateHighlightForGesture:", a3))
      {
        if (!self->mTrackingHighlight)
        {
LABEL_17:
          self->mTrackingHighlight = 1;
          -[THWPHighlightController beginDragHighlightAtPoint:](-[THWPRep highlightController](-[THHighlightGestureController trackingRep](self, "trackingRep"), "highlightController"), "beginDragHighlightAtPoint:", self->mLongPressGestureStartPoint.x, self->mLongPressGestureStartPoint.y);
        }
        -[THWPHighlightController moveDragHighlightToPoint:](-[THWPRep highlightController](-[THHighlightGestureController trackingRep](self, "trackingRep"), "highlightController"), "moveDragHighlightToPoint:", v10, v11);
      }
      else if (self->mTrackingHighlight)
      {
        -[THWPHighlightController endDragHighlightAtPoint:accept:](-[THWPRep highlightController](-[THHighlightGestureController trackingRep](self, "trackingRep"), "highlightController"), "endDragHighlightAtPoint:accept:", 0, v10, v11);
        self->mTrackingHighlight = 0;
      }
      break;
    case 3uLL:
      if (-[THHighlightGestureController _shouldShowMagnifierForGesture:](self, "_shouldShowMagnifierForGesture:", a3))
        -[THHighlightGestureController p_stopMagnification:](self, "p_stopMagnification:", -[THHighlightGestureController trackingRep](self, "trackingRep"));
      mTrackingHighlight = self->mTrackingHighlight;
      v12 = -[THWPRep highlightController](-[THHighlightGestureController trackingRep](self, "trackingRep"), "highlightController");
      if (mTrackingHighlight)
      {
        v13 = v10;
        v14 = v11;
        v15 = 1;
        goto LABEL_23;
      }
      if (-[THWPHighlightController isCanvasPointOnHighlight:](v12, "isCanvasPointOnHighlight:", v10, v11))
      {
        v23 = objc_opt_class(THTimeoutDragGestureRecognizer, v22);
        v25 = (objc_opt_isKindOfClass(a3, v23) & 1) != 0 ? objc_msgSend(a3, "isStylus") ^ 1 : 1;
        v26 = objc_opt_class(TSWPEditingController, v24);
        *(_QWORD *)&v28 = TSUDynamicCast(v26, -[THInteractiveCanvasController beginEditingRep:](-[THHighlightGestureController interactiveCanvasController](self, "interactiveCanvasController"), "beginEditingRep:", -[THHighlightGestureController trackingRep](self, "trackingRep"))).n128_u64[0];
        if (v27)
        {
          if (v25)
          {
            v29 = v27;
            -[THWPRep convertNaturalPointFromUnscaledCanvas:](-[THHighlightGestureController trackingRep](self, "trackingRep", v28), "convertNaturalPointFromUnscaledCanvas:", v10, v11);
            objc_msgSend(v29, "tappedInRep:point:tapCount:isTapHold:precise:", -[THHighlightGestureController trackingRep](self, "trackingRep"), 2, 0, 0, v30, v31);
          }
        }
      }
      goto LABEL_24;
    case 4uLL:
    case 5uLL:
      -[THHighlightGestureController p_stopMagnification:](self, "p_stopMagnification:", -[THHighlightGestureController trackingRep](self, "trackingRep"));
      if (self->mTrackingHighlight)
      {
        v12 = -[THWPRep highlightController](-[THHighlightGestureController trackingRep](self, "trackingRep"), "highlightController");
        v13 = v10;
        v14 = v11;
        v15 = 0;
LABEL_23:
        -[THWPHighlightController endDragHighlightAtPoint:accept:](v12, "endDragHighlightAtPoint:accept:", v15, v13, v14);
      }
LABEL_24:
      *(_WORD *)&self->mHighlighting = 0;
      -[THHighlightGestureController setTrackingRep:](self, "setTrackingRep:", 0);
      break;
    default:
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THHighlightGestureController p_highlightGesture:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THHighlightGestureController.m"), 391, CFSTR("Unexpected gesture state"));
      break;
  }
}

- (BOOL)_shouldShowMagnifierForGesture:(id)a3
{
  uint64_t v4;
  double v5;
  id v6;

  v4 = objc_opt_class(THTimeoutDragGestureRecognizer, a2);
  *(_QWORD *)&v5 = TSUDynamicCast(v4, a3).n128_u64[0];
  return objc_msgSend(v6, "isStylus", v5) ^ 1;
}

- (BOOL)_shouldBeginImmediateHighlightForGesture:(id)a3
{
  uint64_t v4;
  double v5;
  id v6;

  v4 = objc_opt_class(THTimeoutDragGestureRecognizer, a2);
  *(_QWORD *)&v5 = TSUDynamicCast(v4, a3).n128_u64[0];
  return objc_msgSend(v6, "isStylus", v5);
}

- (void)p_likelyHighlightGesture:(id)a3
{
  char *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  THTimeoutDragGestureRecognizer *mHighlightGestureRecognizer;
  double v17;
  double v18;
  double v19;

  v5 = (char *)objc_msgSend(a3, "state");
  if ((unint64_t)(v5 - 3) >= 3)
  {
    if (v5 == (_BYTE *)&dword_0 + 1)
    {
      objc_msgSend(a3, "locationInView:", -[THInteractiveCanvasController canvasView](-[THHighlightGestureController interactiveCanvasController](self, "interactiveCanvasController"), "canvasView"));
      -[THInteractiveCanvasController convertBoundsToUnscaledPoint:](-[THHighlightGestureController interactiveCanvasController](self, "interactiveCanvasController"), "convertBoundsToUnscaledPoint:", v6, v7);
      v9 = v8;
      v11 = v10;
      v13 = objc_opt_class(THWPRep, v12);
      *(_QWORD *)&v14 = TSUDynamicCast(v13, -[THInteractiveCanvasController hitRep:](-[THHighlightGestureController interactiveCanvasController](self, "interactiveCanvasController"), "hitRep:", v9, v11)).n128_u64[0];
      -[THHighlightGestureController setTrackingRep:](self, "setTrackingRep:", v15, v14);
      if (-[THHighlightGestureController _shouldShowMagnifierForGesture:](self, "_shouldShowMagnifierForGesture:", a3))
        -[THHighlightGestureController p_beginMagnification:atPoint:](self, "p_beginMagnification:atPoint:", -[THHighlightGestureController trackingRep](self, "trackingRep"), v9, v11);
      mHighlightGestureRecognizer = self->mHighlightGestureRecognizer;
      -[THTimeoutLongPressGestureRecognizer maximumPressDuration](-[THHighlightGestureController likelyHighlightGestureRecognizer](self, "likelyHighlightGestureRecognizer"), "maximumPressDuration");
      v18 = v17;
      -[THTimeoutLongPressGestureRecognizer minimumPressDuration](-[THHighlightGestureController likelyHighlightGestureRecognizer](self, "likelyHighlightGestureRecognizer"), "minimumPressDuration");
      -[THTimeoutDragGestureRecognizer resetCancelTimerWithTimeout:](mHighlightGestureRecognizer, "resetCancelTimerWithTimeout:", v18 - v19);
    }
  }
  else if (!self->mHighlighting)
  {
    -[THHighlightGestureController p_stopMagnification:](self, "p_stopMagnification:", -[THHighlightGestureController trackingRep](self, "trackingRep"));
    -[THHighlightGestureController setTrackingRep:](self, "setTrackingRep:", 0);
  }
}

- (id)p_marginNoteHitRep:(CGPoint)a3
{
  return -[THInteractiveCanvasController hitRep:withGesture:passingTest:](-[THHighlightGestureController interactiveCanvasController](self, "interactiveCanvasController"), "hitRep:withGesture:passingTest:", 0, &stru_428F70, a3.x, a3.y);
}

- (void)p_marginNoteGesture:(id)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  char *v11;
  double v12;
  double v13;
  id v14;
  AEMarginNote *v15;
  id v16;
  double v17;
  double v18;
  id v19;
  id v20;
  double v21;
  double v22;
  id v23;
  id v24;
  id v25;

  objc_msgSend(a3, "locationInView:", -[THInteractiveCanvasController canvasView](-[THHighlightGestureController interactiveCanvasController](self, "interactiveCanvasController"), "canvasView"));
  -[THInteractiveCanvasController convertBoundsToUnscaledPoint:](-[THHighlightGestureController interactiveCanvasController](self, "interactiveCanvasController"), "convertBoundsToUnscaledPoint:", v5, v6);
  v8 = v7;
  v10 = v9;
  v11 = (char *)objc_msgSend(a3, "state");
  if ((unint64_t)(v11 - 3) < 2)
  {
    -[THMarginNotesOwner convertCanvasPointToOwnerPoint:](-[THHighlightGestureController trackingNotesOwner](self, "trackingNotesOwner"), "convertCanvasPointToOwnerPoint:", v8, v10);
    v19 = objc_msgSend(-[THMarginNotesOwner marginNotesController](-[THHighlightGestureController trackingNotesOwner](self, "trackingNotesOwner"), "marginNotesController"), "marginNoteAtPoint:", v17, v18);
    v20 = objc_msgSend(v19, "annotation");
    if (v20 == -[AEMarginNote annotation](-[THHighlightGestureController trackingMarginNote](self, "trackingMarginNote"), "annotation"))
    {
      objc_msgSend((id)TSUProtocolCast(&OBJC_PROTOCOL___THInteractiveCanvasControllerDelegate, -[THInteractiveCanvasController delegate](-[THHighlightGestureController interactiveCanvasController](self, "interactiveCanvasController"), "delegate")), "interactiveCanvasControllerWillShowNoteEditor:", -[THHighlightGestureController interactiveCanvasController](self, "interactiveCanvasController"));
      -[THMarginNotesOwner showEditorForMarginNote:](-[THHighlightGestureController trackingNotesOwner](self, "trackingNotesOwner"), "showEditorForMarginNote:", v19);
    }
    objc_msgSend(-[THMarginNotesOwner marginNotesController](-[THHighlightGestureController trackingNotesOwner](self, "trackingNotesOwner"), "marginNotesController"), "unhighlightAllMarginNotes");
    -[THHighlightGestureController setTrackingMarginNote:](self, "setTrackingMarginNote:", 0);
    -[THHighlightGestureController setTrackingNotesOwner:](self, "setTrackingNotesOwner:", 0);
  }
  else
  {
    if (v11 == (_BYTE *)&dword_0 + 2)
    {
      -[THMarginNotesOwner convertCanvasPointToOwnerPoint:](-[THHighlightGestureController trackingNotesOwner](self, "trackingNotesOwner"), "convertCanvasPointToOwnerPoint:", v8, v10);
      v23 = objc_msgSend(-[THMarginNotesOwner marginNotesController](-[THHighlightGestureController trackingNotesOwner](self, "trackingNotesOwner"), "marginNotesController"), "marginNoteAtPoint:", v21, v22);
      v24 = objc_msgSend(v23, "annotation");
      v25 = -[AEMarginNote annotation](-[THHighlightGestureController trackingMarginNote](self, "trackingMarginNote"), "annotation");
      v16 = -[THMarginNotesOwner marginNotesController](-[THHighlightGestureController trackingNotesOwner](self, "trackingNotesOwner"), "marginNotesController");
      if (v24 != v25)
      {
        objc_msgSend(v16, "unhighlightAllMarginNotes");
        return;
      }
      v15 = (AEMarginNote *)v23;
    }
    else
    {
      if (v11 != (_BYTE *)&dword_0 + 1)
      {
        objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THHighlightGestureController p_marginNoteGesture:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THHighlightGestureController.m"), 492, CFSTR("Unexpected gesture state"));
        return;
      }
      -[THHighlightGestureController setTrackingNotesOwner:](self, "setTrackingNotesOwner:", objc_msgSend((id)TSUProtocolCast(&OBJC_PROTOCOL___THMarginNotesOwner, -[THHighlightGestureController p_marginNoteHitRep:](self, "p_marginNoteHitRep:", v8, v10)), "marginNotesOwner"));
      if (!-[THHighlightGestureController trackingNotesOwner](self, "trackingNotesOwner"))
        objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THHighlightGestureController p_marginNoteGesture:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THHighlightGestureController.m"), 460, CFSTR("Gesture shouldn't have fired if we weren't over a notes owner"));
      -[THMarginNotesOwner convertCanvasPointToOwnerPoint:](-[THHighlightGestureController trackingNotesOwner](self, "trackingNotesOwner"), "convertCanvasPointToOwnerPoint:", v8, v10);
      -[THHighlightGestureController setTrackingMarginNote:](self, "setTrackingMarginNote:", objc_msgSend(-[THMarginNotesOwner marginNotesController](-[THHighlightGestureController trackingNotesOwner](self, "trackingNotesOwner"), "marginNotesController"), "marginNoteAtPoint:", v12, v13));
      v14 = -[THMarginNotesOwner marginNotesController](-[THHighlightGestureController trackingNotesOwner](self, "trackingNotesOwner"), "marginNotesController");
      v15 = -[THHighlightGestureController trackingMarginNote](self, "trackingMarginNote");
      v16 = v14;
    }
    objc_msgSend(v16, "highlightMarginNote:", v15);
  }
}

- (void)p_catalystNoteGesture:(id)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  void *v16;
  void *v17;
  unsigned int v18;
  id v19;
  BOOL v20;
  void *v21;
  int *v22;

  objc_msgSend(a3, "locationInView:", -[THInteractiveCanvasController canvasView](-[THHighlightGestureController interactiveCanvasController](self, "interactiveCanvasController"), "canvasView"));
  v6 = v5;
  v8 = v7;
  -[THInteractiveCanvasController convertBoundsToUnscaledPoint:](-[THHighlightGestureController interactiveCanvasController](self, "interactiveCanvasController"), "convertBoundsToUnscaledPoint:", v5, v7);
  v10 = v9;
  v12 = v11;
  v14 = objc_opt_class(THWPRep, v13);
  *(_QWORD *)&v15 = TSUDynamicCast(v14, -[THInteractiveCanvasController hitRep:](-[THHighlightGestureController interactiveCanvasController](self, "interactiveCanvasController"), "hitRep:", v10, v12)).n128_u64[0];
  v17 = v16;
  v18 = objc_msgSend(objc_msgSend(v16, "highlightController", v15), "isCanvasPointOnHighlight:", v10, v12);
  v19 = objc_msgSend(objc_msgSend(v17, "highlightController"), "annotationAtUnscaledPoint:", v10, v12);
  if (v18)
    v20 = v19 == 0;
  else
    v20 = 1;
  if (!v20)
  {
    v21 = v19;
    v22 = (int *)objc_msgSend(a3, "state");
    if ((unint64_t)v22 - 1 >= 2 && v22 != &dword_4)
    {
      if (v22 == (int *)((char *)&dword_0 + 3))
        -[THInteractiveCanvasController presentMenuAtCanvasPoint:forAnnotationUUID:](-[THHighlightGestureController interactiveCanvasController](self, "interactiveCanvasController"), "presentMenuAtCanvasPoint:forAnnotationUUID:", objc_msgSend(v21, "annotationUuid"), v6, v8);
      else
        objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THHighlightGestureController p_catalystNoteGesture:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THHighlightGestureController.m"), 521, CFSTR("Unexpected gesture state"));
    }
  }
}

- (BOOL)p_shouldDragOwnInteraction:(CGPoint)a3 rep:(id)a4
{
  objc_msgSend(a4, "convertNaturalPointFromUnscaledCanvas:", a3.x, a3.y);
  return objc_msgSend(a4, "isPointInSelectedArea:");
}

- (BOOL)p_canHighlightAtPoint:(CGPoint)a3 inView:(id)a4
{
  double y;
  double x;
  THInteractiveCanvasController *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;

  y = a3.y;
  x = a3.x;
  v8 = -[THHighlightGestureController interactiveCanvasController](self, "interactiveCanvasController");
  if (-[THInteractiveCanvasController supportsWritingHighlights](v8, "supportsWritingHighlights")
    && (objc_msgSend(a4, "convertPoint:toView:", -[THInteractiveCanvasController canvasView](v8, "canvasView"), x, y),
        -[THInteractiveCanvasController convertBoundsToUnscaledPoint:](v8, "convertBoundsToUnscaledPoint:"),
        v10 = v9,
        v12 = v11,
        v14 = objc_opt_class(THWPRep, v13),
        TSUDynamicCast(v14, -[THInteractiveCanvasController hitRep:](-[THHighlightGestureController interactiveCanvasController](self, "interactiveCanvasController"), "hitRep:", v10, v12)), v15)&& (v16 = v15, !-[THHighlightGestureController p_shouldDragOwnInteraction:rep:](self, "p_shouldDragOwnInteraction:rep:", v15, v10, v12)))
  {
    return objc_msgSend(objc_msgSend(v16, "highlightController"), "shouldBeginDragHighlightAtPoint:", v10, v12);
  }
  else
  {
    return 0;
  }
}

- (BOOL)p_isLikelyHighlightTouchAtPoint:(CGPoint)a3 inView:(id)a4
{
  double y;
  double x;
  THInteractiveCanvasController *v7;
  double v8;
  double v9;
  CGFloat v10;
  CGFloat v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double MinX;
  CGFloat Width;
  CGPoint v19;
  CGRect v20;
  CGRect v21;

  y = a3.y;
  x = a3.x;
  v7 = -[THHighlightGestureController interactiveCanvasController](self, "interactiveCanvasController");
  objc_msgSend(a4, "convertPoint:toView:", -[THInteractiveCanvasController canvasView](v7, "canvasView"), x, y);
  -[THInteractiveCanvasController convertBoundsToUnscaledPoint:](v7, "convertBoundsToUnscaledPoint:");
  v10 = v8;
  v11 = v9;
  if (v7)
  {
    -[THInteractiveCanvasController wordMetricsAtPoint:](v7, "wordMetricsAtPoint:", v8, v9);
    v13 = 0;
    v12 = 0;
    v15 = 0;
    v14 = 0;
  }
  else
  {
    v15 = 0;
    v14 = 0;
    v13 = 0;
    v12 = 0;
  }
  MinX = CGRectGetMinX(*(CGRect *)&v12);
  v20.size.height = 0.0;
  v20.origin = 0u;
  v20.size.width = 0.0;
  Width = CGRectGetWidth(v20);
  v21.origin.x = MinX + -10.0;
  v21.origin.y = 0.0 - fmaxf(0.0, 10.0);
  *(float *)&Width = Width + -15.0;
  v21.size.width = fmaxf(*(float *)&Width, 35.0) + 10.0;
  v21.size.height = fmaxf(0.0, 8.0) + 0.0 - v21.origin.y;
  v19.x = v10;
  v19.y = v11;
  return CGRectContainsPoint(v21, v19);
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  id v19;
  id v20;
  double v21;
  double v22;

  if (!-[THInteractiveCanvasController supportsReadingHighlights](-[THHighlightGestureController interactiveCanvasController](self, "interactiveCanvasController"), "supportsReadingHighlights")|| (-[THInteractiveCanvasController currentlyScrolling](-[THHighlightGestureController interactiveCanvasController](self, "interactiveCanvasController"), "currentlyScrolling") & 1) != 0|| (-[THInteractiveCanvasController currentlyWaitingOnThreadedLayoutAndRender](-[THHighlightGestureController interactiveCanvasController](self, "interactiveCanvasController"), "currentlyWaitingOnThreadedLayoutAndRender") & 1) != 0)
  {
    return 0;
  }
  objc_msgSend(a4, "locationInView:", -[THInteractiveCanvasController canvasView](-[THHighlightGestureController interactiveCanvasController](self, "interactiveCanvasController"), "canvasView"));
  v9 = v8;
  v11 = v10;
  -[THInteractiveCanvasController convertBoundsToUnscaledPoint:](-[THHighlightGestureController interactiveCanvasController](self, "interactiveCanvasController"), "convertBoundsToUnscaledPoint:", v8, v10);
  v13 = v12;
  v15 = v14;
  if (-[THHighlightGestureController highlightGestureRecognizer](self, "highlightGestureRecognizer") == a3)
    return -[THHighlightGestureController p_canHighlightAtPoint:inView:](self, "p_canHighlightAtPoint:inView:", -[THInteractiveCanvasController canvasView](-[THHighlightGestureController interactiveCanvasController](self, "interactiveCanvasController"), "canvasView"), v9, v11);
  if (-[THHighlightGestureController stylusHighlightGestureRecognizer](self, "stylusHighlightGestureRecognizer") == a3)
  {
    v17 = objc_opt_class(THWPRep, v16);
    *(_QWORD *)&v18 = TSUDynamicCast(v17, -[THInteractiveCanvasController hitRep:](-[THHighlightGestureController interactiveCanvasController](self, "interactiveCanvasController"), "hitRep:", v9, v11)).n128_u64[0];
    if ((objc_msgSend(objc_msgSend(v19, "highlightController", v18), "isCanvasPointOnHighlight:", v9, v11) & 1) != 0)return 0;
    return -[THHighlightGestureController p_canHighlightAtPoint:inView:](self, "p_canHighlightAtPoint:inView:", -[THInteractiveCanvasController canvasView](-[THHighlightGestureController interactiveCanvasController](self, "interactiveCanvasController"), "canvasView"), v9, v11);
  }
  if (-[THHighlightGestureController likelyHighlightGestureRecognizer](self, "likelyHighlightGestureRecognizer") == a3)
  {
    if (-[THHighlightGestureController p_canHighlightAtPoint:inView:](self, "p_canHighlightAtPoint:inView:", -[THInteractiveCanvasController canvasView](-[THHighlightGestureController interactiveCanvasController](self, "interactiveCanvasController"), "canvasView"), v9, v11))
    {
      -[THInteractiveCanvasController canvasView](-[THHighlightGestureController interactiveCanvasController](self, "interactiveCanvasController"), "canvasView");
      return -[THHighlightGestureController p_isLikelyHighlightTouchAtPoint:inView:](self, "p_isLikelyHighlightTouchAtPoint:inView:", v9, v11);
    }
    return 0;
  }
  if (-[THHighlightGestureController marginNotesGestureRecognizer](self, "marginNotesGestureRecognizer") != a3)
  {
    if (-[THHighlightGestureController catalystNotesGestureRecognizer](self, "catalystNotesGestureRecognizer") != a3)
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THHighlightGestureController gestureRecognizer:shouldReceiveTouch:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THHighlightGestureController.m"), 631, CFSTR("Unexpected gesture"));
    return 0;
  }
  v20 = objc_msgSend((id)TSUProtocolCast(&OBJC_PROTOCOL___THMarginNotesOwner, -[THHighlightGestureController p_marginNoteHitRep:](self, "p_marginNoteHitRep:", v13, v15)), "marginNotesOwner");
  objc_msgSend(v20, "convertCanvasPointToOwnerPoint:", v13, v15);
  if (!v20)
    return 0;
  return objc_msgSend(objc_msgSend(v20, "marginNotesController"), "hasMarginNoteAtPoint:", v21, v22);
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return -[THHighlightGestureController likelyHighlightGestureRecognizer](self, "likelyHighlightGestureRecognizer", a3, a4) == a3|| -[THHighlightGestureController stylusHighlightGestureRecognizer](self, "stylusHighlightGestureRecognizer") == a3;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  return -[THHighlightGestureController likelyHighlightGestureRecognizer](self, "likelyHighlightGestureRecognizer") != a3
      || -[THTimeoutDragGestureRecognizer state](-[THHighlightGestureController highlightGestureRecognizer](self, "highlightGestureRecognizer"), "state") == 0;
}

- (CGPoint)dragGestureRecognizer:(id)a3 requiredMovementForTouch:(id)a4
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  id v15;
  double x;
  double y;
  CGPoint result;

  objc_msgSend(a4, "locationInView:", -[THInteractiveCanvasController canvasView](-[THHighlightGestureController interactiveCanvasController](self, "interactiveCanvasController"), "canvasView"));
  -[THInteractiveCanvasController convertBoundsToUnscaledPoint:](-[THHighlightGestureController interactiveCanvasController](self, "interactiveCanvasController"), "convertBoundsToUnscaledPoint:", v6, v7);
  v9 = v8;
  v11 = v10;
  v13 = objc_opt_class(THWPRep, v12);
  *(_QWORD *)&v14 = TSUDynamicCast(v13, -[THInteractiveCanvasController hitRep:](-[THHighlightGestureController interactiveCanvasController](self, "interactiveCanvasController"), "hitRep:", v9, v11)).n128_u64[0];
  if ((objc_msgSend(objc_msgSend(v15, "highlightController", v14), "isCanvasPointOnHighlight:", v9, v11) & 1) != 0
    || -[THHighlightGestureController _shouldBeginImmediateHighlightForGesture:](self, "_shouldBeginImmediateHighlightForGesture:", a3))
  {
    x = CGPointZero.x;
    y = CGPointZero.y;
  }
  else
  {
    y = 16.0;
    x = 10.6400003;
  }
  result.y = y;
  result.x = x;
  return result;
}

- (THInteractiveCanvasController)interactiveCanvasController
{
  return self->mInteractiveCanvasController;
}

- (void)setInteractiveCanvasController:(id)a3
{
  self->mInteractiveCanvasController = (THInteractiveCanvasController *)a3;
}

- (UILongPressGestureRecognizer)marginNotesGestureRecognizer
{
  return self->mMarginNotesGestureRecognizer;
}

- (void)setMarginNotesGestureRecognizer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (UILongPressGestureRecognizer)catalystNotesGestureRecognizer
{
  return self->mCatalystNotesGestureRecognizer;
}

- (void)setCatalystNotesGestureRecognizer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (THTimeoutDragGestureRecognizer)highlightGestureRecognizer
{
  return self->mHighlightGestureRecognizer;
}

- (void)setHighlightGestureRecognizer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (THTimeoutLongPressGestureRecognizer)likelyHighlightGestureRecognizer
{
  return self->mLikelyHighlightGestureRecognizer;
}

- (void)setLikelyHighlightGestureRecognizer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (AEMarginNote)trackingMarginNote
{
  return self->mTrackingMarginNote;
}

- (void)setTrackingMarginNote:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (THMarginNotesOwner)trackingNotesOwner
{
  return self->mTrackingNotesOwner;
}

- (void)setTrackingNotesOwner:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (THWPRep)trackingRep
{
  return self->mTrackingRep;
}

- (void)setTrackingRep:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (BOOL)handlingGesture
{
  return self->_handlingGesture;
}

- (THTimeoutDragGestureRecognizer)stylusHighlightGestureRecognizer
{
  return self->_stylusHighlightGestureRecognizer;
}

- (void)setStylusHighlightGestureRecognizer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

@end
