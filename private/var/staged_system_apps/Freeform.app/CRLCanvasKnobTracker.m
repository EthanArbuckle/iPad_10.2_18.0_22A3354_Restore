@implementation CRLCanvasKnobTracker

- (CRLCanvasKnobTracker)initWithRep:(id)a3 knob:(id)a4
{
  id v6;
  id v7;
  CRLCanvasKnobTracker *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CRLCanvasKnobTracker;
  v8 = -[CRLCanvasKnobTracker init](&v16, "init");
  if (v8)
  {
    if (v6)
    {
      if (v7)
      {
LABEL_23:
        -[CRLCanvasKnobTracker setKnob:](v8, "setKnob:", v7);
        -[CRLCanvasKnobTracker setRep:](v8, "setRep:", v6);
        v8->_inputType = 1;
        goto LABEL_24;
      }
    }
    else
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10123FCA0);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E051C8();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10123FCC0);
      v9 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE8358(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasKnobTracker initWithRep:knob:]"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasKnobTracker.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 43, 0, "invalid nil value for '%{public}s'", "rep");

      if (v7)
        goto LABEL_23;
    }
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123FCE0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E0512C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123FD00);
    v12 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE8358(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasKnobTracker initWithRep:knob:]"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasKnobTracker.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 44, 0, "invalid nil value for '%{public}s'", "knob");

    goto LABEL_23;
  }
LABEL_24:

  return v8;
}

- (CRLCanvasKnobTracker)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CRLCanvasKnobTracker;
  return -[CRLCanvasKnobTracker init](&v3, "init");
}

- (void)dealloc
{
  CRLCanvasKnobTracker *v3;
  objc_super v4;

  v3 = (CRLCanvasKnobTracker *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep currentKnobTracker](self->_rep, "currentKnobTracker"));

  if (v3 == self)
    -[CRLCanvasRep setCurrentKnobTracker:](self->_rep, "setCurrentKnobTracker:", 0);
  v4.receiver = self;
  v4.super_class = (Class)CRLCanvasKnobTracker;
  -[CRLCanvasKnobTracker dealloc](&v4, "dealloc");
}

- (void)setRep:(id)a3
{
  CRLCanvasRep *v5;
  CRLCanvasRep *rep;
  CRLCanvasKnobTracker *v7;
  CRLCanvasRep *v8;

  v5 = (CRLCanvasRep *)a3;
  rep = self->_rep;
  if (rep != v5)
  {
    v8 = v5;
    v7 = (CRLCanvasKnobTracker *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep currentKnobTracker](rep, "currentKnobTracker"));

    if (v7 == self)
      -[CRLCanvasRep setCurrentKnobTracker:](self->_rep, "setCurrentKnobTracker:", 0);
    objc_storeStrong((id *)&self->_rep, a3);
    -[CRLCanvasRep setCurrentKnobTracker:](self->_rep, "setCurrentKnobTracker:", self);
    v5 = v8;
  }

}

- (CRLInteractiveCanvasController)icc
{
  return -[CRLCanvasRep interactiveCanvasController](self->_rep, "interactiveCanvasController");
}

- (NSSet)repsToTransform
{
  return +[NSSet setWithObject:](NSSet, "setWithObject:", self->_rep);
}

- (double)delay
{
  return 0.0;
}

- (void)moveKnobToCanvasPosition:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  id v7;

  y = a3.y;
  x = a3.x;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
  if (v6)
  {
    v7 = v6;
    objc_msgSend(v6, "convertNaturalPointFromUnscaledCanvas:", x, y);
    -[CRLCanvasKnobTracker moveKnobToRepPosition:](self, "moveKnobToRepPosition:");
    v6 = v7;
  }

}

- (CGPoint)convertKnobPositionToUnscaledCanvas:(CGPoint)a3
{
  double y;
  double x;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
  objc_msgSend(v5, "convertNaturalPointToUnscaledCanvas:", x, y);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.y = v11;
  result.x = v10;
  return result;
}

- (CGPoint)convertKnobPositionFromUnscaledCanvas:(CGPoint)a3
{
  double y;
  double x;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
  objc_msgSend(v5, "convertNaturalPointFromUnscaledCanvas:", x, y);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.y = v11;
  result.x = v10;
  return result;
}

- (void)beginMovingKnob
{
  self->_didBegin = 1;
}

- (void)endMovingKnob
{
  CRLCanvasKnobTracker *v3;

  v3 = (CRLCanvasKnobTracker *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep currentKnobTracker](self->_rep, "currentKnobTracker"));

  if (v3 == self)
    -[CRLCanvasRep setCurrentKnobTracker:](self->_rep, "setCurrentKnobTracker:", 0);
}

- (CGRect)currentBoundsForStandardKnobs
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[CRLCanvasRep boundsForStandardKnobs](self->_rep, "boundsForStandardKnobs");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGAffineTransform)transformInRootForStandardKnobs
{
  void *v4;
  CGAffineTransform *result;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self->_rep, "layout"));
  if (v4)
  {
    v6 = v4;
    objc_msgSend(v4, "transformInRoot");
    v4 = v6;
  }
  else
  {
    *(_OWORD *)&retstr->c = 0u;
    *(_OWORD *)&retstr->tx = 0u;
    *(_OWORD *)&retstr->a = 0u;
  }

  return result;
}

- (unint64_t)enabledKnobMask
{
  void *v3;
  unint64_t v4;

  if (!-[CRLCanvasKnobTracker shouldHideOtherKnobs](self, "shouldHideOtherKnobs"))
    return -1;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker knob](self, "knob"));
  v4 = sub_100260884((char)objc_msgSend(v3, "tag"));

  return v4;
}

- (BOOL)shouldHideOtherKnobs
{
  return 1;
}

- (BOOL)shouldHideSelectionHighlight
{
  return 1;
}

- (BOOL)allowHUDToDisplay
{
  return -[CRLCanvasKnobTracker inputType](self, "inputType") != 0;
}

- (BOOL)shouldUseKnobOffset
{
  return 1;
}

- (BOOL)shouldEndMovingKnobOnESC
{
  return 0;
}

- (void)willEndMovingKnobDueToESC
{
  self->_endedOperationDueToESC = 1;
}

- (void)i_setKnobOffset:(CGPoint)a3
{
  self->_knobOffset = a3;
}

- (void)i_resetCurrentPositionToKnobPositionIfAppropriate
{
  void *v3;
  id v4;

  if (!-[CRLCanvasKnobTracker didDrag](self, "didDrag"))
  {
    if (-[CRLCanvasKnobTracker dragEnding](self, "dragEnding"))
    {
      v4 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker knob](self, "knob"));
      objc_msgSend(v3, "position");
      objc_msgSend(v4, "convertNaturalPointToUnscaledCanvas:");
      -[CRLCanvasKnobTracker setCurrentPosition:](self, "setCurrentPosition:");

    }
  }
}

- (BOOL)i_shouldForceDrag
{
  return 0;
}

- (BOOL)wantsAutoscroll
{
  return 1;
}

- (double)unscaledStartAutoscrollThreshold
{
  return 20.0;
}

- (int)allowedAutoscrollDirections
{
  return 15;
}

- (void)changeDynamicLayoutsForReps:(id)a3
{
  _BOOL4 didBegin;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  unsigned int v13;

  -[CRLCanvasKnobTracker i_resetCurrentPositionToKnobPositionIfAppropriate](self, "i_resetCurrentPositionToKnobPositionIfAppropriate", a3);
  didBegin = self->_didBegin;
  if (!self->_didBegin)
  {
    self->_didBegin = 1;
    -[CRLCanvasKnobTracker beginMovingKnob](self, "beginMovingKnob");
  }
  if (!-[CRLCanvasKnobTracker didDrag](self, "didDrag") && !-[CRLCanvasKnobTracker dragEnding](self, "dragEnding"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker knob](self, "knob"));
    objc_msgSend(v5, "position");
    v7 = v6;
    v9 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
    -[CRLCanvasKnobTracker currentPosition](self, "currentPosition");
    objc_msgSend(v10, "convertNaturalPointFromUnscaledCanvas:");
    if (sub_10005FDF0(v7, v9, v11, v12))
    {
      v13 = -[CRLCanvasKnobTracker i_shouldForceDrag](self, "i_shouldForceDrag");

      if (!v13)
        goto LABEL_7;
    }
    else
    {

    }
    -[CRLCanvasKnobTracker setDidDrag:](self, "setDidDrag:", 1);
    if (!didBegin)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_7:
  if (!didBegin)
  {
LABEL_9:
    -[CRLCanvasKnobTracker currentPosition](self, "currentPosition");
    -[CRLCanvasKnobTracker moveKnobToCanvasPosition:](self, "moveKnobToCanvasPosition:");
    return;
  }
LABEL_8:
  if (-[CRLCanvasKnobTracker didDrag](self, "didDrag"))
    goto LABEL_9;
}

- (BOOL)shouldOpenCommandGroupToCommitChangesForReps:(id)a3
{
  return 0;
}

- (void)commitChangesForReps:(id)a3
{
  if (self->_didBegin)
    -[CRLCanvasKnobTracker endMovingKnob](self, "endMovingKnob", a3);
}

- (BOOL)supportsAlignmentGuides
{
  return 0;
}

- (BOOL)operationShouldBeDynamic
{
  return 1;
}

- (BOOL)traceIfDesiredForBeginOperation
{
  return 1;
}

- (BOOL)traceIfDesiredForEndOperation
{
  return 1;
}

- (id)repsToHide
{
  NSSet *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  uint64_t v11;

  v3 = objc_opt_new(NSSet);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "parentRep"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "layout"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "layout"));
  v9 = objc_msgSend(v6, "childLayoutIsCurrentlyHiddenWhileManipulating:", v8);

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
    v11 = objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v10));

    v3 = (NSSet *)v11;
  }

  return v3;
}

- (int64_t)inputType
{
  return self->_inputType;
}

- (void)setInputType:(int64_t)a3
{
  self->_inputType = a3;
}

- (CRLCanvasRep)rep
{
  return self->_rep;
}

- (BOOL)isInspectorDrivenTracking
{
  return self->_isInspectorDrivenTracking;
}

- (void)setIsInspectorDrivenTracking:(BOOL)a3
{
  self->_isInspectorDrivenTracking = a3;
}

- (CRLCanvasKnob)knob
{
  return self->_knob;
}

- (void)setKnob:(id)a3
{
  objc_storeStrong((id *)&self->_knob, a3);
}

- (BOOL)didBegin
{
  return self->_didBegin;
}

- (BOOL)didDrag
{
  return self->_didDrag;
}

- (void)setDidDrag:(BOOL)a3
{
  self->_didDrag = a3;
}

- (CGPoint)currentPosition
{
  double x;
  double y;
  CGPoint result;

  x = self->_currentPosition.x;
  y = self->_currentPosition.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setCurrentPosition:(CGPoint)a3
{
  self->_currentPosition = a3;
}

- (BOOL)dragEnding
{
  return self->_dragEnding;
}

- (void)setDragEnding:(BOOL)a3
{
  self->_dragEnding = a3;
}

- (BOOL)endedOperationDueToESC
{
  return self->_endedOperationDueToESC;
}

- (CGPoint)knobOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_knobOffset.x;
  y = self->_knobOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CRLCanvasAutoscroll)autoscroll
{
  return self->_autoscroll;
}

- (void)setAutoscroll:(id)a3
{
  objc_storeStrong((id *)&self->_autoscroll, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autoscroll, 0);
  objc_storeStrong((id *)&self->_knob, 0);
  objc_storeStrong((id *)&self->_rep, 0);
}

@end
