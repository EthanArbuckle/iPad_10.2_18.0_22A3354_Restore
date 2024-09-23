@implementation PUPhotoPinchGestureRecognizer

- (PUPhotoPinchGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  PUPhotoPinchGestureRecognizer *v4;
  PUPhotoPinchGestureRecognizer *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PUPhotoPinchGestureRecognizer;
  v4 = -[PUPhotoPinchGestureRecognizer initWithTarget:action:](&v7, sel_initWithTarget_action_, a3, a4);
  v5 = v4;
  if (v4)
    -[PUPhotoPinchGestureRecognizer setRotationHysteresisDegrees:](v4, "setRotationHysteresisDegrees:", 5.0);
  return v5;
}

- (void)reset
{
  CGSize v3;
  objc_super v4;

  self->_initialTouchLocationsSet = 0;
  v3 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
  self->_initialPinchRect.origin = (CGPoint)*MEMORY[0x1E0C9D628];
  self->_initialPinchRect.size = v3;
  -[PUPhotoPinchGestureRecognizer _setRotationFilter:](self, "_setRotationFilter:", 0);
  v4.receiver = self;
  v4.super_class = (Class)PUPhotoPinchGestureRecognizer;
  -[PUPhotoPinchGestureRecognizer reset](&v4, sel_reset);
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a4;
  v7 = a3;
  -[PUPhotoPinchGestureRecognizer _setTouchesNeedUpdate:](self, "_setTouchesNeedUpdate:", 1);
  v8.receiver = self;
  v8.super_class = (Class)PUPhotoPinchGestureRecognizer;
  -[PUPhotoPinchGestureRecognizer touchesBegan:withEvent:](&v8, sel_touchesBegan_withEvent_, v7, v6);

  -[PUPhotoPinchGestureRecognizer _updateIfNeeded](self, "_updateIfNeeded");
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a4;
  v7 = a3;
  -[PUPhotoPinchGestureRecognizer _setTouchesNeedUpdate:](self, "_setTouchesNeedUpdate:", 1);
  v8.receiver = self;
  v8.super_class = (Class)PUPhotoPinchGestureRecognizer;
  -[PUPhotoPinchGestureRecognizer touchesMoved:withEvent:](&v8, sel_touchesMoved_withEvent_, v7, v6);

}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a4;
  v7 = a3;
  -[PUPhotoPinchGestureRecognizer _setTouchesNeedUpdate:](self, "_setTouchesNeedUpdate:", 1);
  v8.receiver = self;
  v8.super_class = (Class)PUPhotoPinchGestureRecognizer;
  -[PUPhotoPinchGestureRecognizer touchesEnded:withEvent:](&v8, sel_touchesEnded_withEvent_, v7, v6);

}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a4;
  v7 = a3;
  -[PUPhotoPinchGestureRecognizer _setTouchesNeedUpdate:](self, "_setTouchesNeedUpdate:", 1);
  v8.receiver = self;
  v8.super_class = (Class)PUPhotoPinchGestureRecognizer;
  -[PUPhotoPinchGestureRecognizer touchesCancelled:withEvent:](&v8, sel_touchesCancelled_withEvent_, v7, v6);

}

- (void)setInitialPinchRect:(CGRect)a3
{
  CGRect *p_initialPinchRect;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  CGRect v14;

  p_initialPinchRect = &self->_initialPinchRect;
  self->_initialPinchRect = a3;
  if (self->_initialTouchLocationsSet)
  {
    -[PUPhotoPinchGestureRecognizer view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "convertRect:toView:", 0, p_initialPinchRect->origin.x, p_initialPinchRect->origin.y, p_initialPinchRect->size.width, p_initialPinchRect->size.height);
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;

    v14.origin.x = v7;
    v14.origin.y = v9;
    v14.size.width = v11;
    v14.size.height = v13;
    if (!CGRectIsEmpty(v14))
      AdjustPointsWithinRect(self->_initialTouchLocations, &self->_initialTouchLocations[1], v7, v9, v11, v13);
  }
}

- (CGPoint)adjustedInitialCenterInView:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGPoint result;

  v4 = a3;
  -[PUPhotoPinchGestureRecognizer _updateIfNeeded](self, "_updateIfNeeded");
  if (self->_initialTouchLocationsSet)
  {
    UIMidPointBetweenPoints();
    v7 = v5;
    v8 = v6;
    if (v4)
    {
      objc_msgSend(v4, "convertPoint:fromView:", 0, v5, v6);
      v7 = v9;
      v8 = v10;
    }
  }
  else
  {
    v7 = *MEMORY[0x1E0C9D538];
    v8 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }

  v11 = v7;
  v12 = v8;
  result.y = v12;
  result.x = v11;
  return result;
}

- (CGPoint)adjustedTranslationInView:(id)a3
{
  id v4;
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
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGPoint result;

  v4 = a3;
  -[PUPhotoPinchGestureRecognizer _updateIfNeeded](self, "_updateIfNeeded");
  if (self->_initialTouchLocationsSet)
  {
    UIMidPointBetweenPoints();
    v6 = v5;
    v8 = v7;
    UIMidPointBetweenPoints();
    v10 = v9;
    v12 = v11;
    if (v4)
    {
      objc_msgSend(v4, "convertPoint:fromView:", 0, v6, v8);
      v6 = v13;
      v8 = v14;
      objc_msgSend(v4, "convertPoint:fromView:", 0, v10, v12);
      v10 = v15;
      v12 = v16;
    }
    v17 = v10 - v6;
    v18 = v12 - v8;
  }
  else
  {
    v17 = *MEMORY[0x1E0C9D538];
    v18 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }

  v19 = v17;
  v20 = v18;
  result.y = v20;
  result.x = v19;
  return result;
}

- (double)adjustedRotationInView:(id)a3
{
  double v4;
  double v5;
  PUGroupValueFilter *v6;
  PUAngleValueFilter *v7;
  PUInitialHysteresisValueFilter *v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  -[PUPhotoPinchGestureRecognizer _updateIfNeeded](self, "_updateIfNeeded", a3);
  if (!self->_initialTouchLocationsSet)
    return 0.0;
  v4 = atan2(self->_initialTouchLocations[1].y - self->_initialTouchLocations[0].y, self->_initialTouchLocations[1].x - self->_initialTouchLocations[0].x);
  v5 = atan2(self->_latestTouchLocations[1].y - self->_latestTouchLocations[0].y, self->_latestTouchLocations[1].x - self->_latestTouchLocations[0].x)- v4;
  -[PUPhotoPinchGestureRecognizer _rotationFilter](self, "_rotationFilter");
  v6 = (PUGroupValueFilter *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v7 = objc_alloc_init(PUAngleValueFilter);
    v8 = objc_alloc_init(PUInitialHysteresisValueFilter);
    -[PUPhotoPinchGestureRecognizer rotationHysteresisDegrees](self, "rotationHysteresisDegrees");
    -[PUInitialHysteresisValueFilter setThresholdValue:](v8, "setThresholdValue:", v9 / 180.0 * 3.14159265);
    v6 = objc_alloc_init(PUGroupValueFilter);
    v14[0] = v7;
    v14[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUGroupValueFilter setFilters:](v6, "setFilters:", v10);

    -[PUPhotoPinchGestureRecognizer _setRotationFilter:](self, "_setRotationFilter:", v6);
  }
  -[PUGroupValueFilter setInputValue:](v6, "setInputValue:", v5);
  -[PUGroupValueFilter outputValue](v6, "outputValue");
  v12 = v11;

  return v12;
}

- (double)adjustedScaleInView:(id)a3
{
  double v4;
  double v5;
  double v6;

  -[PUPhotoPinchGestureRecognizer _updateIfNeeded](self, "_updateIfNeeded", a3);
  if (!self->_initialTouchLocationsSet)
    return 0.0;
  UIDistanceBetweenPoints();
  v5 = v4;
  UIDistanceBetweenPoints();
  return v6 / v5;
}

- (CGPoint)adjustedTranslationVelocityInView:(id)a3
{
  double v3;
  double v4;
  CGPoint result;

  v3 = *MEMORY[0x1E0C9D538];
  v4 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  result.y = v4;
  result.x = v3;
  return result;
}

- (double)adjustedRotationVelocityInView:(id)a3
{
  return 0.0;
}

- (void)_updateIfNeeded
{
  uint64_t v3;
  char v4;
  char v5;
  CGPoint *v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGRect v13;

  if (-[PUPhotoPinchGestureRecognizer _touchesNeedUpdate](self, "_touchesNeedUpdate")
    && (unint64_t)-[PUPhotoPinchGestureRecognizer numberOfTouches](self, "numberOfTouches") >= 2)
  {
    -[PUPhotoPinchGestureRecognizer _setTouchesNeedUpdate:](self, "_setTouchesNeedUpdate:", 0);
    v3 = 0;
    v4 = 1;
    do
    {
      v5 = v4;
      v6 = &self->_latestTouchLocations[v3];
      -[PUPhotoPinchGestureRecognizer locationOfTouch:inView:](self, "locationOfTouch:inView:", v3, 0);
      v6->x = v7;
      v6->y = v8;
      if (!self->_initialTouchLocationsSet)
        self->_initialTouchLocations[v3] = *v6;
      v4 = 0;
      v3 = 1;
    }
    while ((v5 & 1) != 0);
    if (!self->_initialTouchLocationsSet)
    {
      -[PUPhotoPinchGestureRecognizer initialPinchRect](self, "initialPinchRect");
      x = v13.origin.x;
      y = v13.origin.y;
      width = v13.size.width;
      height = v13.size.height;
      if (!CGRectIsEmpty(v13))
        AdjustPointsWithinRect(self->_initialTouchLocations, &self->_initialTouchLocations[1], x, y, width, height);
      self->_initialTouchLocationsSet = 1;
    }
  }
}

- (double)rotationHysteresisDegrees
{
  return self->_rotationHysteresisDegrees;
}

- (void)setRotationHysteresisDegrees:(double)a3
{
  self->_rotationHysteresisDegrees = a3;
}

- (CGRect)initialPinchRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_initialPinchRect.origin.x;
  y = self->_initialPinchRect.origin.y;
  width = self->_initialPinchRect.size.width;
  height = self->_initialPinchRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BOOL)_touchesNeedUpdate
{
  return self->__touchesNeedUpdate;
}

- (void)_setTouchesNeedUpdate:(BOOL)a3
{
  self->__touchesNeedUpdate = a3;
}

- (PUValueFilter)_rotationFilter
{
  return self->__rotationFilter;
}

- (void)_setRotationFilter:(id)a3
{
  objc_storeStrong((id *)&self->__rotationFilter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__rotationFilter, 0);
}

@end
