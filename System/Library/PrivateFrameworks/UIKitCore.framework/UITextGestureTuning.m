@implementation UITextGestureTuning

- (UITextGestureTuning)init
{
  UITextGestureTuning *v2;
  UITextGestureTuning *v3;
  UITextMagnifierTimeWeightedPoint *v4;
  UITextMagnifierTimeWeightedPoint *weightedPoint;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UITextGestureTuning;
  v2 = -[UITextGestureTuning init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_shouldIncludeConstantOffset = 1;
    v4 = objc_alloc_init(UITextMagnifierTimeWeightedPoint);
    weightedPoint = v3->_weightedPoint;
    v3->_weightedPoint = v4;

    v3->_lastTouchType = 0;
  }
  return v3;
}

- (CGPoint)pointForGestureState:(int64_t)a3 point:(CGPoint)a4 translation:(CGPoint)a5
{
  double v6;
  double v7;
  CGPoint result;

  if (a3 == 3)
    -[UITextGestureTuning pointIfPlacedCarefully:](self, "pointIfPlacedCarefully:", a4.x, a4.y);
  -[UITextGestureTuning touchAlignedPointForPoint:translation:](self, "touchAlignedPointForPoint:translation:");
  result.y = v7;
  result.x = v6;
  return result;
}

- (void)_reset
{
  self->_initialPosition = 0.0;
  self->_didBreakLineThreshold = 0;
}

- (void)assertInitialPositionFromTopOfCaret:(double)a3 distanceFromCaret:(CGPoint)a4
{
  CGFloat y;
  CGFloat x;

  y = a4.y;
  x = a4.x;
  -[UITextGestureTuning _reset](self, "_reset");
  self->_caretDistance.x = x;
  self->_caretDistance.y = y;
  self->_initialOffsetFromTopOfCaret = a3;
}

- (void)updateWithTouches:(id)a3 gestureState:(int64_t)a4
{
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  double v12;
  id v13;

  objc_msgSend(a3, "anyObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v13 = v6;
    objc_msgSend(v6, "_locationInSceneReferenceSpace");
    v8 = v7;
    v10 = v9;
    v11 = objc_msgSend(v13, "type");
    objc_msgSend(v13, "majorRadius");
    -[UITextGestureTuning updateVisibilityOffsetForGestureState:touchType:locationInSceneReferenceSpace:majorRadius:](self, "updateVisibilityOffsetForGestureState:touchType:locationInSceneReferenceSpace:majorRadius:", a4, v11, v8, v10, v12);
    v6 = v13;
  }

}

- (void)updateVisibilityOffsetForGestureState:(int64_t)a3 touchType:(int64_t)a4 locationInSceneReferenceSpace:(CGPoint)a5 majorRadius:(double)a6
{
  self->_lastTouchType = a4;
  -[UITextGestureTuning updateWeightedPointWithGestureState:location:](self, "updateWeightedPointWithGestureState:location:", a3, a5.x, a5.y, a6);
}

- (CGPoint)touchAlignedPointForPoint:(CGPoint)a3 translation:(CGPoint)a4
{
  CGFloat y;
  double x;
  void *v7;
  void *v8;
  int v9;
  double initialPosition;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  CGFloat v28;
  double MaxY;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  CGPoint result;
  CGRect v39;
  CGRect v40;

  y = a3.y;
  x = a3.x;
  if (!self->_lastTouchType)
  {
    +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController", a3.x, a3.y, a4.x, a4.y);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "preferencesActions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "BOOLForPreferenceKey:", CFSTR("YukonMagnifiersDisabled"));

    if (v9)
    {
      if (-[UITextGestureTuning includeTipProjection](self, "includeTipProjection")
        && self->_initialOffsetFromTopOfCaret < 8.0)
      {
        y = y + -8.0;
      }
      initialPosition = self->_initialPosition;
      if (initialPosition == 0.0)
      {
        self->_initialPosition = y;
        initialPosition = y;
      }
      v11 = y - initialPosition;
      if (v11 + self->_initialOffsetFromTopOfCaret < -2.0)
      {
        self->_initialPosition = y;
        self->_initialOffsetFromTopOfCaret = 0.0;
      }
      if (v11 <= 39.0)
      {
        v12 = -v11;
        if (self->_didBreakLineThreshold)
          v12 = -39.0;
      }
      else
      {
        self->_didBreakLineThreshold = 1;
        v12 = -39.0;
      }
      x = x - self->_caretDistance.x;
      y = y + v12 - self->_caretDistance.y;
      self->_lineBreakProgress = fmax(v11 / 39.0, 0.0);
      -[UITextGestureTuning containerCoordinateSpace](self, "containerCoordinateSpace");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        -[UITextGestureTuning gestureCoordinateSpace](self, "gestureCoordinateSpace");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          -[UITextGestureTuning gestureCoordinateSpace](self, "gestureCoordinateSpace");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[UITextGestureTuning containerCoordinateSpace](self, "containerCoordinateSpace");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "convertPoint:toCoordinateSpace:", v16, x, y);
          x = v17;
          y = v18;

        }
        -[UITextGestureTuning containerCoordinateSpace](self, "containerCoordinateSpace");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "bounds");
        v21 = v20;
        v23 = v22;
        v25 = v24;
        v27 = v26;

        v39.origin.x = v21;
        v39.origin.y = v23;
        v39.size.width = v25;
        v39.size.height = v27;
        v28 = fmax(CGRectGetMinY(v39), 0.0);
        v40.origin.x = v21;
        v40.origin.y = v23;
        v40.size.width = v25;
        v40.size.height = v27;
        MaxY = CGRectGetMaxY(v40);
        v30 = v28 + 1.0;
        if (y >= v28)
          v30 = y;
        if (v30 <= MaxY)
          y = v30;
        else
          y = MaxY + -1.0;
        -[UITextGestureTuning gestureCoordinateSpace](self, "gestureCoordinateSpace");
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        if (v31)
        {
          -[UITextGestureTuning gestureCoordinateSpace](self, "gestureCoordinateSpace");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          -[UITextGestureTuning containerCoordinateSpace](self, "containerCoordinateSpace");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "convertPoint:fromCoordinateSpace:", v33, x, y);
          x = v34;
          y = v35;

        }
      }
    }
  }
  v36 = x;
  v37 = y;
  result.y = v37;
  result.x = v36;
  return result;
}

- (void)updateWeightedPointWithGestureState:(int64_t)a3 location:(CGPoint)a4
{
  double y;
  double x;

  y = a4.y;
  x = a4.x;
  if ((unint64_t)(a3 - 2) >= 2)
  {
    if (a3 != 1)
      return;
    -[UITextMagnifierTimeWeightedPoint clearHistory](self->_weightedPoint, "clearHistory");
  }
  -[UITextMagnifierTimeWeightedPoint addPoint:](self->_weightedPoint, "addPoint:", x, y);
}

- (CGPoint)pointIfPlacedCarefully:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;
  double v8;
  double v9;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  if (-[UITextMagnifierTimeWeightedPoint isPlacedCarefully](self->_weightedPoint, "isPlacedCarefully"))
  {
    -[UITextMagnifierTimeWeightedPoint diffFromLastPoint](self->_weightedPoint, "diffFromLastPoint");
    x = x + v6;
    y = y + v7;
  }
  v8 = x;
  v9 = y;
  result.y = v9;
  result.x = v8;
  return result;
}

- (UICoordinateSpace)containerCoordinateSpace
{
  return (UICoordinateSpace *)objc_loadWeakRetained((id *)&self->_containerCoordinateSpace);
}

- (void)setContainerCoordinateSpace:(id)a3
{
  objc_storeWeak((id *)&self->_containerCoordinateSpace, a3);
}

- (UICoordinateSpace)gestureCoordinateSpace
{
  return (UICoordinateSpace *)objc_loadWeakRetained((id *)&self->_gestureCoordinateSpace);
}

- (void)setGestureCoordinateSpace:(id)a3
{
  objc_storeWeak((id *)&self->_gestureCoordinateSpace, a3);
}

- (BOOL)shouldUseLineThreshold
{
  return self->_shouldUseLineThreshold;
}

- (void)setShouldUseLineThreshold:(BOOL)a3
{
  self->_shouldUseLineThreshold = a3;
}

- (BOOL)shouldIncludeConstantOffset
{
  return self->_shouldIncludeConstantOffset;
}

- (void)setShouldIncludeConstantOffset:(BOOL)a3
{
  self->_shouldIncludeConstantOffset = a3;
}

- (BOOL)includeTipProjection
{
  return self->_includeTipProjection;
}

- (void)setIncludeTipProjection:(BOOL)a3
{
  self->_includeTipProjection = a3;
}

- (BOOL)strongerBiasAgainstUp
{
  return self->_strongerBiasAgainstUp;
}

- (void)setStrongerBiasAgainstUp:(BOOL)a3
{
  self->_strongerBiasAgainstUp = a3;
}

- (BOOL)didBreakLineThreshold
{
  return self->_didBreakLineThreshold;
}

- (double)initialPosition
{
  return self->_initialPosition;
}

- (double)lineBreakProgress
{
  return self->_lineBreakProgress;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_gestureCoordinateSpace);
  objc_destroyWeak((id *)&self->_containerCoordinateSpace);
  objc_storeStrong((id *)&self->_weightedPoint, 0);
}

@end
