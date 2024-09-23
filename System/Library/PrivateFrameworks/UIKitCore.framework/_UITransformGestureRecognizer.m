@implementation _UITransformGestureRecognizer

- (id)_driver
{
  _UIGestureRecognizerDriver *composedDriver;
  _UIPinchGestureRecognizerDriver *v4;
  _UIPinchGestureRecognizerDriver *pinchDriver;
  _UIRotationGestureRecognizerDriver *v6;
  _UIRotationGestureRecognizerDriver *rotationDriver;
  _UIRotationGestureRecognizerDriver *v8;
  void *v9;
  _UIGestureRecognizerDriver *v10;
  _UIGestureRecognizerDriver *v11;
  _UIPinchGestureRecognizerDriver *v12;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  composedDriver = self->_composedDriver;
  if (!composedDriver)
  {
    v4 = (_UIPinchGestureRecognizerDriver *)objc_opt_new();
    pinchDriver = self->_pinchDriver;
    self->_pinchDriver = v4;

    v6 = (_UIRotationGestureRecognizerDriver *)objc_opt_new();
    rotationDriver = self->_rotationDriver;
    self->_rotationDriver = v6;

    v8 = self->_rotationDriver;
    v14[0] = self->_pinchDriver;
    v14[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    _UIGestureRecognizerComposeParallelDrivers(v9);
    v10 = (_UIGestureRecognizerDriver *)objc_claimAutoreleasedReturnValue();
    v11 = self->_composedDriver;
    self->_composedDriver = v10;

    v12 = self->_pinchDriver;
    if (v12)
      *(_BYTE *)&v12->_flags |= 1u;
    composedDriver = self->_composedDriver;
  }
  return composedDriver;
}

- (CGPoint)locationInView:(id)a3
{
  double v3;
  double v4;
  CGPoint result;

  -[UIGestureRecognizer _convertPoint:fromSceneReferenceCoordinatesToView:](self, "_convertPoint:fromSceneReferenceCoordinatesToView:", a3, -[_UITransformGestureRecognizer _anchorPoint]((uint64_t)self).f64[0]);
  result.y = v4;
  result.x = v3;
  return result;
}

- (float64x2_t)_anchorPoint
{
  uint64_t v1;
  float64x2_t v2;
  float64x2_t v3;
  float64x2_t *v4;
  float64x2_t v5;

  if (a1)
  {
    v1 = *(_QWORD *)(a1 + 272);
    v2 = 0uLL;
    v3 = 0uLL;
    if (v1)
      v3 = *(float64x2_t *)(v1 + 168);
    v4 = *(float64x2_t **)(a1 + 280);
    if (v4)
      v2 = v4[8];
    v5 = vaddq_f64(v3, v2);
    __asm { FMOV            V1.2D, #0.5 }
    return vaddq_f64(vmulq_f64(v5, _Q1), *(float64x2_t *)(a1 + 296));
  }
  else
  {
    return (float64x2_t)0;
  }
}

- (void)reset
{
  _UIPinchGestureRecognizerDriver *pinchDriver;
  _UIRotationGestureRecognizerDriver *rotationDriver;

  pinchDriver = self->_pinchDriver;
  if (pinchDriver)
    pinchDriver->_hysteresis = 8.0;
  rotationDriver = self->_rotationDriver;
  if (rotationDriver)
    rotationDriver->_hysteresisEnabled = 1;
  self->_eventTranslation = (CGPoint)*MEMORY[0x1E0C9D538];
}

- (void)_stateUpdatedForDriver:(id)a3 previousState:(int64_t)a4
{
  uint64_t v6;
  _UIPinchGestureRecognizerDriver *pinchDriver;
  _UIRotationGestureRecognizerDriver *rotationDriver;

  v6 = objc_msgSend(a3, "state");
  if ((unint64_t)(a4 - 1) >= 2 && (unint64_t)(v6 - 3) >= 0xFFFFFFFFFFFFFFFELL)
  {
    if ((unint64_t)(-[_UIGestureRecognizerDriver state](self->_pinchDriver, "state") - 1) <= 1
      && (unint64_t)(-[_UIGestureRecognizerDriver state](self->_rotationDriver, "state") - 1) >= 2)
    {
      rotationDriver = self->_rotationDriver;
      if (rotationDriver)
        rotationDriver->_hysteresisEnabled = 0;
    }
    else if ((unint64_t)(-[_UIGestureRecognizerDriver state](self->_rotationDriver, "state") - 1) <= 1
           && (unint64_t)(-[_UIGestureRecognizerDriver state](self->_rotationDriver, "state") - 1) >= 2)
    {
      pinchDriver = self->_pinchDriver;
      if (pinchDriver)
        pinchDriver->_hysteresis = 0.0;
    }
  }
}

- (void)_transformChangedWithEvent:(id)a3
{
  CGPoint *p_eventTranslation;
  CGFloat v4;
  CGFloat v5;

  p_eventTranslation = &self->_eventTranslation;
  objc_msgSend(a3, "translation");
  p_eventTranslation->x = v4;
  p_eventTranslation->y = v5;
}

- (double)scale
{
  _UIPinchGestureRecognizerDriver *pinchDriver;

  pinchDriver = self->_pinchDriver;
  if (pinchDriver)
    return pinchDriver->_transform.a;
  else
    return 0.0;
}

- (double)rotation
{
  _UIRotationGestureRecognizerDriver *rotationDriver;

  rotationDriver = self->_rotationDriver;
  if (rotationDriver)
    return rotationDriver->_initialTouchAngle
         - rotationDriver->_currentTouchAngle
         + (double)rotationDriver->_currentRotationCount * 6.28318531;
  else
    return 0.0;
}

- (CGPoint)translation
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGPoint result;

  -[UIGestureRecognizer view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UITransformGestureRecognizer translationInView:](self, "translationInView:", v3);
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.y = v9;
  result.x = v8;
  return result;
}

- (CGAffineTransform)transform
{
  CGAffineTransform *result;
  id v5;

  -[UIGestureRecognizer view](self, "view");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[_UITransformGestureRecognizer transformInView:](self, "transformInView:", v5);

  return result;
}

- (CGAffineTransform)transformInView:(SEL)a3
{
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  CGFloat v18;
  __int128 v19;
  __int128 v20;
  CGAffineTransform *result;
  __int128 v22;
  CGAffineTransform v23;
  CGAffineTransform v24;

  -[_UITransformGestureRecognizer scale](self, "scale");
  v8 = v7;
  -[_UITransformGestureRecognizer translationInView:](self, "translationInView:", a4);
  v10 = v9;
  v12 = v11;
  v13 = MEMORY[0x1E0C9BAA8];
  v14 = *MEMORY[0x1E0C9BAA8];
  v15 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&retstr->c = v15;
  v16 = *(_OWORD *)(v13 + 32);
  *(_OWORD *)&retstr->tx = v16;
  *(_OWORD *)&v24.a = v14;
  *(_OWORD *)&v24.c = v15;
  *(_OWORD *)&v24.tx = v16;
  CGAffineTransformScale(retstr, &v24, v8, v8);
  -[_UITransformGestureRecognizer rotation](self, "rotation");
  v17 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v23.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v23.c = v17;
  *(_OWORD *)&v23.tx = *(_OWORD *)&retstr->tx;
  CGAffineTransformRotate(&v24, &v23, v18);
  v19 = *(_OWORD *)&v24.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v24.a;
  *(_OWORD *)&retstr->c = v19;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&v24.tx;
  v20 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v23.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v23.c = v20;
  *(_OWORD *)&v23.tx = *(_OWORD *)&retstr->tx;
  result = CGAffineTransformTranslate(&v24, &v23, v10, v12);
  v22 = *(_OWORD *)&v24.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v24.a;
  *(_OWORD *)&retstr->c = v22;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&v24.tx;
  return result;
}

- (CGPoint)translationInView:(id)a3
{
  _UIPinchGestureRecognizerDriver *pinchDriver;
  double v6;
  double v7;
  double v8;
  double *p_x;
  _UIRotationGestureRecognizerDriver *rotationDriver;
  double v11;
  double *v12;
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
  CGPoint result;

  if (self)
  {
    pinchDriver = self->_pinchDriver;
    v6 = 0.0;
    v7 = 0.0;
    v8 = 0.0;
    if (pinchDriver)
    {
      p_x = &pinchDriver->_initialAnchorPoint.x;
      v8 = *p_x;
      v7 = p_x[1];
    }
    rotationDriver = self->_rotationDriver;
    v11 = 0.0;
    if (rotationDriver)
    {
      v12 = &rotationDriver->_initialAnchorPoint.x;
      v11 = *v12;
      v6 = v12[1];
    }
    v13 = (v8 + v11) * 0.5;
    v14 = (v7 + v6) * 0.5;
  }
  else
  {
    v14 = 0.0;
    v13 = 0.0;
  }
  -[UIGestureRecognizer _convertPoint:fromSceneReferenceCoordinatesToView:](self, "_convertPoint:fromSceneReferenceCoordinatesToView:", a3, v13, v14);
  v16 = v15;
  v18 = v17;
  -[UIGestureRecognizer _convertPoint:fromSceneReferenceCoordinatesToView:](self, "_convertPoint:fromSceneReferenceCoordinatesToView:", a3, -[_UITransformGestureRecognizer _anchorPoint]((uint64_t)self).f64[0]);
  v20 = v19 - v16;
  v22 = v21 - v18;
  result.y = v22;
  result.x = v20;
  return result;
}

- (BOOL)_isGestureType:(int64_t)a3
{
  return a3 == 18 || a3 == 20;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_composedDriver, 0);
  objc_storeStrong((id *)&self->_rotationDriver, 0);
  objc_storeStrong((id *)&self->_pinchDriver, 0);
}

@end
