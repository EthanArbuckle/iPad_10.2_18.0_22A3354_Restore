@implementation TSDKnobTracker

- (TSDKnobTracker)initWithRep:(id)a3 knob:(id)a4
{
  TSDKnobTracker *v6;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)TSDKnobTracker;
  v6 = -[TSDKnobTracker init](&v12, sel_init);
  if (v6)
  {
    if (a3)
    {
      if (a4)
      {
LABEL_4:
        -[TSDKnobTracker setKnob:](v6, "setKnob:", a4);
        -[TSDKnobTracker setRep:](v6, "setRep:", a3);
        return v6;
      }
    }
    else
    {
      v8 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v9 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDKnobTracker initWithRep:knob:]");
      objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDKnobTracker.m"), 27, CFSTR("invalid nil value for '%s'"), "rep");
      if (a4)
        goto LABEL_4;
    }
    v10 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v11 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDKnobTracker initWithRep:knob:]");
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDKnobTracker.m"), 28, CFSTR("invalid nil value for '%s'"), "knob");
    goto LABEL_4;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  if (-[TSDRep currentKnobTracker](self->mRep, "currentKnobTracker") == self)
    -[TSDRep setCurrentKnobTracker:](self->mRep, "setCurrentKnobTracker:", 0);

  v3.receiver = self;
  v3.super_class = (Class)TSDKnobTracker;
  -[TSDKnobTracker dealloc](&v3, sel_dealloc);
}

- (void)setRep:(id)a3
{
  TSDRep *mRep;
  TSDRep *v6;

  mRep = self->mRep;
  if (mRep != a3)
  {
    if (-[TSDRep currentKnobTracker](mRep, "currentKnobTracker") == self)
      -[TSDRep setCurrentKnobTracker:](self->mRep, "setCurrentKnobTracker:", 0);

    v6 = (TSDRep *)a3;
    self->mRep = v6;
    -[TSDRep setCurrentKnobTracker:](v6, "setCurrentKnobTracker:", self);
  }
}

- (TSDInteractiveCanvasController)icc
{
  return -[TSDRep interactiveCanvasController](self->mRep, "interactiveCanvasController");
}

- (double)delay
{
  return 0.0;
}

- (void)moveKnobToCanvasPosition:(CGPoint)a3
{
  double y;
  double x;
  TSDRep *v6;

  y = a3.y;
  x = a3.x;
  v6 = -[TSDKnobTracker rep](self, "rep");
  if (v6)
  {
    -[TSDRep convertNaturalPointFromUnscaledCanvas:](v6, "convertNaturalPointFromUnscaledCanvas:", x, y);
    -[TSDKnobTracker moveKnobToRepPosition:](self, "moveKnobToRepPosition:");
  }
}

- (CGPoint)convertKnobPositionToUnscaledCanvas:(CGPoint)a3
{
  double v3;
  double v4;
  CGPoint result;

  -[TSDRep convertNaturalPointToUnscaledCanvas:](-[TSDKnobTracker rep](self, "rep"), "convertNaturalPointToUnscaledCanvas:", a3.x, a3.y);
  result.y = v4;
  result.x = v3;
  return result;
}

- (void)beginMovingKnob
{
  self->mDidBegin = 1;
}

- (void)endMovingKnob
{
  if (-[TSDRep currentKnobTracker](self->mRep, "currentKnobTracker") == self)
    -[TSDRep setCurrentKnobTracker:](self->mRep, "setCurrentKnobTracker:", 0);
}

- (CGRect)currentBoundsForStandardKnobs
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[TSDRep boundsForStandardKnobs](self->mRep, "boundsForStandardKnobs");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGAffineTransform)transformInRootForStandardKnobs
{
  CGAffineTransform *result;

  result = -[TSDRep layout](self->mRep, "layout");
  if (result)
    return (CGAffineTransform *)-[CGAffineTransform transformInRoot](result, "transformInRoot");
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  return result;
}

- (unint64_t)enabledKnobMask
{
  if (-[TSDKnobTracker shouldHideOtherKnobs](self, "shouldHideOtherKnobs"))
    return TSDMaskForKnob(-[TSDKnob tag](-[TSDKnobTracker knob](self, "knob"), "tag"));
  else
    return -1;
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
  return 1;
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
  self->mEndedOperationDueToESC = 1;
}

- (void)i_setKnobOffset:(CGPoint)a3
{
  self->mKnobOffset = a3;
}

- (void)i_resetCurrentPositionToKnobPositionIfAppropriate
{
  TSDRep *v3;

  if (!-[TSDKnobTracker didDrag](self, "didDrag"))
  {
    if (-[TSDKnobTracker dragEnding](self, "dragEnding"))
    {
      v3 = -[TSDKnobTracker rep](self, "rep");
      -[TSDKnob position](-[TSDKnobTracker knob](self, "knob"), "position");
      -[TSDRep convertNaturalPointToUnscaledCanvas:](v3, "convertNaturalPointToUnscaledCanvas:");
      -[TSDKnobTracker setCurrentPosition:](self, "setCurrentPosition:");
    }
  }
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
  _BOOL4 mDidBegin;
  double v5;
  double v6;
  double v7;
  double v8;
  TSDRep *v9;
  double v10;
  double v11;

  -[TSDKnobTracker i_resetCurrentPositionToKnobPositionIfAppropriate](self, "i_resetCurrentPositionToKnobPositionIfAppropriate", a3);
  mDidBegin = self->mDidBegin;
  if (!self->mDidBegin)
  {
    self->mDidBegin = 1;
    -[TSDKnobTracker beginMovingKnob](self, "beginMovingKnob");
  }
  if (!-[TSDKnobTracker didDrag](self, "didDrag") && !-[TSDKnobTracker dragEnding](self, "dragEnding"))
  {
    -[TSDKnob position](-[TSDKnobTracker knob](self, "knob"), "position");
    v6 = v5;
    v8 = v7;
    v9 = -[TSDKnobTracker rep](self, "rep");
    -[TSDKnobTracker currentPosition](self, "currentPosition");
    -[TSDRep convertNaturalPointFromUnscaledCanvas:](v9, "convertNaturalPointFromUnscaledCanvas:");
    if (!TSDNearlyEqualPoints(v6, v8, v10, v11))
      -[TSDKnobTracker setDidDrag:](self, "setDidDrag:", 1);
  }
  if (!mDidBegin || -[TSDKnobTracker didDrag](self, "didDrag"))
  {
    -[TSDKnobTracker currentPosition](self, "currentPosition");
    -[TSDKnobTracker moveKnobToCanvasPosition:](self, "moveKnobToCanvasPosition:");
  }
}

- (BOOL)shouldOpenCommandGroupToCommitChangesForReps:(id)a3
{
  return 0;
}

- (BOOL)supportsAlignmentGuides
{
  return 0;
}

- (BOOL)operationShouldBeDynamic
{
  return 1;
}

- (TSDRep)rep
{
  return self->mRep;
}

- (BOOL)isInspectorDrivenTracking
{
  return self->mIsInspectorDrivenTracking;
}

- (void)setIsInspectorDrivenTracking:(BOOL)a3
{
  self->mIsInspectorDrivenTracking = a3;
}

- (TSDKnob)knob
{
  return self->mKnob;
}

- (void)setKnob:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (BOOL)didBegin
{
  return self->mDidBegin;
}

- (BOOL)didDrag
{
  return self->mDidDrag;
}

- (void)setDidDrag:(BOOL)a3
{
  self->mDidDrag = a3;
}

- (CGPoint)currentPosition
{
  double x;
  double y;
  CGPoint result;

  x = self->mCurrentPosition.x;
  y = self->mCurrentPosition.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setCurrentPosition:(CGPoint)a3
{
  self->mCurrentPosition = a3;
}

- (BOOL)dragEnding
{
  return self->mDragEnding;
}

- (void)setDragEnding:(BOOL)a3
{
  self->mDragEnding = a3;
}

- (BOOL)endedOperationDueToESC
{
  return self->mEndedOperationDueToESC;
}

- (CGPoint)knobOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->mKnobOffset.x;
  y = self->mKnobOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (TSDAutoscroll)autoscroll
{
  return self->mAutoscroll;
}

- (void)setAutoscroll:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

@end
