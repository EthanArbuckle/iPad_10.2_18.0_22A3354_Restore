@implementation _UIRotationGestureRecognizerDriver

- (_UIRotationGestureRecognizerDriver)init
{
  _UIRotationGestureRecognizerDriver *v2;
  _UIRotationGestureRecognizerDriver *v3;
  _UIGestureRecognizerTransformAnalyzer *v4;
  _UIGestureRecognizerTransformAnalyzer *transformAnalyzer;
  _UIGestureRecognizerTransformAnalyzer *v6;
  int *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_UIRotationGestureRecognizerDriver;
  v2 = -[_UIGestureRecognizerDriver init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_hysteresisEnabled = 1;
    v2->_preRecognitionWeight = 1.0;
    v2->_postRecognitionWeight = 1.0;
    v4 = objc_alloc_init(_UIGestureRecognizerTransformAnalyzer);
    transformAnalyzer = v3->_transformAnalyzer;
    v3->_transformAnalyzer = v4;

    v6 = v3->_transformAnalyzer;
    if ((unint64_t)(-[_UIGestureRecognizerDriver state](v3, "state") - 1) >= 2)
      v7 = &OBJC_IVAR____UIRotationGestureRecognizerDriver__preRecognitionWeight;
    else
      v7 = &OBJC_IVAR____UIRotationGestureRecognizerDriver__postRecognitionWeight;
    -[_UIGestureRecognizerTransformAnalyzer setRotationWeight:](v6, "setRotationWeight:", *(float *)((char *)&v3->super.super.isa + *v7));
    -[_UIGestureRecognizerTransformAnalyzer setPinchingWeight:](v3->_transformAnalyzer, "setPinchingWeight:", 0.25);
    -[_UIGestureRecognizerTransformAnalyzer setTranslationWeight:](v3->_transformAnalyzer, "setTranslationWeight:", 0.25);
  }
  return v3;
}

- (void)reset
{
  _UIGestureRecognizerTransformAnalyzer *transformAnalyzer;
  int *v4;
  NSArray *touches;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIRotationGestureRecognizerDriver;
  -[_UIGestureRecognizerDriver reset](&v6, sel_reset);
  -[_UIGestureRecognizerTransformAnalyzer reset](self->_transformAnalyzer, "reset");
  transformAnalyzer = self->_transformAnalyzer;
  if ((unint64_t)(-[_UIGestureRecognizerDriver state](self, "state") - 1) >= 2)
    v4 = &OBJC_IVAR____UIRotationGestureRecognizerDriver__preRecognitionWeight;
  else
    v4 = &OBJC_IVAR____UIRotationGestureRecognizerDriver__postRecognitionWeight;
  -[_UIGestureRecognizerTransformAnalyzer setRotationWeight:](transformAnalyzer, "setRotationWeight:", *(float *)((char *)&self->super.super.isa + *v4));
  self->_initialTouchAngle = 0.0;
  self->_currentTouchAngle = 0.0;
  self->_previousVelocity = 0.0;
  self->_velocity = 0.0;
  self->_currentRotationCount = 0;
  touches = self->_touches;
  self->_touches = 0;

  *(_BYTE *)&self->_flags &= ~1u;
}

- (uint64_t)setRotation:(uint64_t)result
{
  double v2;
  uint64_t v3;

  if (result)
  {
    v2 = *(double *)(result + 56) + a2;
    *(double *)(result + 48) = v2;
    *(_QWORD *)(result + 64) = 0;
    v3 = 0;
    if (v2 > 3.14159265)
    {
      do
      {
        ++v3;
        v2 = v2 + -6.28318531;
      }
      while (v2 > 3.14159265);
      *(_QWORD *)(result + 64) = v3;
      *(double *)(result + 48) = v2;
    }
    if (v2 < -3.14159265)
    {
      do
      {
        --v3;
        v2 = v2 + 6.28318531;
      }
      while (v2 < -3.14159265);
      *(_QWORD *)(result + 64) = v3;
      *(double *)(result + 48) = v2;
    }
  }
  return result;
}

- (uint64_t)_setPreRecognitionWeight:(uint64_t)result
{
  uint64_t v2;
  float v3;
  void *v4;
  int *v5;

  if (result)
  {
    v2 = result;
    if (*(float *)(result + 112) != a2)
    {
      v3 = a2;
      *(float *)(result + 112) = v3;
      v4 = *(void **)(result + 96);
      if ((unint64_t)(objc_msgSend((id)result, "state") - 1) >= 2)
        v5 = &OBJC_IVAR____UIRotationGestureRecognizerDriver__preRecognitionWeight;
      else
        v5 = &OBJC_IVAR____UIRotationGestureRecognizerDriver__postRecognitionWeight;
      return objc_msgSend(v4, "setRotationWeight:", *(float *)(v2 + *v5));
    }
  }
  return result;
}

- (uint64_t)_setPostRecognitionWeight:(uint64_t)result
{
  uint64_t v2;
  float v3;
  void *v4;
  int *v5;

  if (result)
  {
    v2 = result;
    if (*(float *)(result + 116) != a2)
    {
      v3 = a2;
      *(float *)(result + 116) = v3;
      v4 = *(void **)(result + 96);
      if ((unint64_t)(objc_msgSend((id)result, "state") - 1) >= 2)
        v5 = &OBJC_IVAR____UIRotationGestureRecognizerDriver__preRecognitionWeight;
      else
        v5 = &OBJC_IVAR____UIRotationGestureRecognizerDriver__postRecognitionWeight;
      return objc_msgSend(v4, "setRotationWeight:", *(float *)(v2 + *v5));
    }
  }
  return result;
}

- (BOOL)shouldReceiveComponent:(id)a3 withEvent:(id)a4
{
  return (*(_BYTE *)&self->_flags & 1) == 0;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  void *v6;
  BOOL v7;
  void *v8;
  double v9;
  CGFloat v10;
  NSArray *v11;
  NSArray *touches;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double initialTouchAngle;
  int64_t currentRotationCount;
  int64_t v27;
  id v28;

  -[_UIGestureRecognizerDriver context](self, "context", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "activeComponentsForEvent:", a4);
  v28 = (id)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v28, "count") == 2;
  v8 = v28;
  if (v7)
  {
    objc_msgSend(a4, "timestamp");
    self->_lastTouchTime = v9;
    self->_anchorPoint.x = _CentroidOfTouches(v28, 1);
    self->_anchorPoint.y = v10;
    self->_initialAnchorPoint = self->_anchorPoint;
    objc_msgSend(v28, "allObjects");
    v11 = (NSArray *)objc_claimAutoreleasedReturnValue();
    touches = self->_touches;
    self->_touches = v11;

    *(_BYTE *)&self->_flags |= 1u;
    _UIGestureRecognizerDistanceBetweenTouches(self->_touches);
    self->_initialTouchDistance = v13;
    -[NSArray objectAtIndexedSubscript:](self->_touches, "objectAtIndexedSubscript:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "locationInView:", 0);
    v16 = v15;
    v18 = v17;

    -[NSArray objectAtIndexedSubscript:](self->_touches, "objectAtIndexedSubscript:", 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "locationInView:", 0);
    v21 = v20;
    v23 = v22;

    v24 = atan2(v18 - v23, v21 - v16);
    self->_initialTouchAngle = v24 + self->_initialTouchAngle - self->_currentTouchAngle;
    self->_currentTouchAngle = v24;
    initialTouchAngle = self->_initialTouchAngle;
    if (initialTouchAngle > 3.14159265)
    {
      currentRotationCount = self->_currentRotationCount;
      do
      {
        ++currentRotationCount;
        initialTouchAngle = initialTouchAngle + -6.28318531;
      }
      while (initialTouchAngle > 3.14159265);
      self->_currentRotationCount = currentRotationCount;
      self->_initialTouchAngle = initialTouchAngle;
    }
    v8 = v28;
    if (initialTouchAngle < -3.14159265)
    {
      v27 = self->_currentRotationCount;
      do
      {
        --v27;
        initialTouchAngle = initialTouchAngle + 6.28318531;
      }
      while (initialTouchAngle < -3.14159265);
      self->_currentRotationCount = v27;
      self->_initialTouchAngle = initialTouchAngle;
      v8 = v28;
    }
  }

}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  long double v19;
  double currentTouchAngle;
  uint64_t v21;
  int64_t currentRotationCount;
  double v23;
  double v24;
  double v25;
  uint64_t v26;
  double lastTouchTime;
  id v28;
  uint64_t v29;
  int64_t v30;
  uint64_t v31;
  uint64_t i;
  uint64_t v33;
  objc_class *v34;
  CGFloat v35;
  objc_class *v36;
  double v37;
  _UIGestureRecognizerTransformAnalyzer *transformAnalyzer;
  int *v39;
  void *v40;
  double v41;
  double v42;
  int v43;
  double v44;
  float v45;
  double v46;
  double initialTouchAngle;
  uint64_t v48;
  uint64_t v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  -[_UIGestureRecognizerDriver context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activeComponentsForEvent:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "count") != 2)
    goto LABEL_39;
  -[NSArray objectAtIndexedSubscript:](self->_touches, "objectAtIndexedSubscript:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "locationInView:", 0);
  v11 = v10;
  v13 = v12;

  -[NSArray objectAtIndexedSubscript:](self->_touches, "objectAtIndexedSubscript:", 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "locationInView:", 0);
  v16 = v15;
  v18 = v17;

  v19 = atan2(v13 - v18, v16 - v11);
  currentTouchAngle = self->_currentTouchAngle;
  v21 = 64;
  currentRotationCount = self->_currentRotationCount;
  v23 = v19 - currentTouchAngle;
  objc_msgSend(a4, "timestamp");
  v25 = v24;
  v26 = 72;
  lastTouchTime = self->_lastTouchTime;
  -[_UIGestureRecognizerTransformAnalyzer analyzeTouches:](self->_transformAnalyzer, "analyzeTouches:", v8);
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v28 = a3;
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
  if (v29)
  {
    v48 = 72;
    v49 = 64;
    v30 = currentRotationCount;
    v31 = *(_QWORD *)v51;
    while (2)
    {
      for (i = 0; i != v29; ++i)
      {
        if (*(_QWORD *)v51 != v31)
          objc_enumerationMutation(v28);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * i), "_isPointerTouch", v48, v49, (_QWORD)v50) & 1) != 0)
        {
          LOBYTE(v29) = 1;
          goto LABEL_12;
        }
      }
      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
      if (v29)
        continue;
      break;
    }
LABEL_12:
    currentRotationCount = v30;
    v26 = v48;
    v21 = v49;
  }

  if (fabs(v23) > 1.57079633)
  {
    v33 = *(uint64_t *)((char *)&self->super.super.isa + v21);
    if (v23 >= 0.0)
      v34 = (objc_class *)(v33 + 1);
    else
      v34 = (objc_class *)(v33 - 1);
    *(Class *)((char *)&self->super.super.isa + v21) = v34;
  }
  if (-[_UIGestureRecognizerDriver state](self, "state") || !self->_hysteresisEnabled)
    goto LABEL_19;
  objc_msgSend(v8, "allObjects");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  _UIGestureRecognizerDistanceBetweenTouches(v40);
  v42 = v41;

  if ((v29 & 1) != 0)
  {
    v43 = _UIInternalPreferenceUsesDefault_1((int *)&_UIInternalPreference_PointerTouchRotationHysteresis, (uint64_t)CFSTR("PointerTouchRotationHysteresis"));
    v44 = *(double *)&qword_1EDDA8148;
    if (v43)
      v44 = 1.0;
  }
  else
  {
    v44 = sqrt(fmin(fabs((v42 - self->_initialTouchDistance) / self->_initialTouchDistance), 1.0)) * 5.0 + 5.0;
  }
  v45 = v44;
  v46 = (float)(v45 * 0.017453);
  initialTouchAngle = self->_initialTouchAngle;
  if (vabdd_f64(initialTouchAngle, v19) > v46)
  {
    if (initialTouchAngle <= v19)
      v46 = -v46;
    self->_initialTouchAngle = initialTouchAngle - v46;
LABEL_19:
    self->_anchorPoint.x = _CentroidOfTouches(v8, 1);
    self->_anchorPoint.y = v35;
    self->_previousVelocity = self->_velocity;
    objc_msgSend(a4, "timestamp");
    *(Class *)((char *)&self->super.super.isa + v26) = v36;
    self->_currentTouchAngle = v19;
    if ((v29 & 1) != 0
      || -[_UIGestureRecognizerTransformAnalyzer dominantComponent](self->_transformAnalyzer, "dominantComponent") == 3)
    {
      v37 = v25 - lastTouchTime;
      if (v25 - lastTouchTime > 0.0)
      {
        v37 = (currentTouchAngle
             - self->_currentTouchAngle
             + (double)(*(unint64_t *)((char *)&self->super.super.isa + v21) - currentRotationCount) * 6.28318531)
            / v37;
        self->_velocity = v37;
      }
      if (!-[_UIGestureRecognizerDriver state](self, "state", v37))
      {
        -[_UIGestureRecognizerDriver _setState:notifyDelegate:]((uint64_t)self, 1, 1);
        transformAnalyzer = self->_transformAnalyzer;
        if ((unint64_t)(-[_UIGestureRecognizerDriver state](self, "state") - 1) >= 2)
          v39 = &OBJC_IVAR____UIRotationGestureRecognizerDriver__preRecognitionWeight;
        else
          v39 = &OBJC_IVAR____UIRotationGestureRecognizerDriver__postRecognitionWeight;
        -[_UIGestureRecognizerTransformAnalyzer setRotationWeight:](transformAnalyzer, "setRotationWeight:", *(float *)((char *)&self->super.super.isa + *v39));
      }
    }
    else
    {
      self->_initialTouchAngle = v23 + self->_initialTouchAngle;
      self->_velocity = 0.0;
    }
  }
LABEL_39:

}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  void *v6;
  int64_t v7;
  uint64_t v8;
  id v9;

  -[_UIGestureRecognizerDriver context](self, "context", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "activeComponentsForEvent:", a4);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v9, "count"))
  {
    v7 = -[_UIGestureRecognizerDriver state](self, "state");
    if (self)
    {
      if (v7 == 1)
        v8 = 2;
      else
        v8 = 3;
      -[_UIGestureRecognizerDriver _setState:notifyDelegate:]((uint64_t)self, v8, 1);
    }
  }

}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  if (self)
    -[_UIGestureRecognizerDriver _setState:notifyDelegate:]((uint64_t)self, 3, 1);
}

- (void)transformChangedWithEvent:(id)a3
{
  CGPoint *p_anchorPoint;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  CGFloat v13;
  CGFloat v14;
  double v15;
  int64_t currentRotationCount;
  double v17;
  double v18;
  double currentTouchAngle;
  double v20;
  double v21;
  double lastTouchTime;
  double v23;
  double v24;
  int64_t v25;
  int64_t v26;
  int v27;
  float v28;
  double v29;
  double v30;
  double v31;
  double v32;
  uint64_t v33;
  _UIRotationGestureRecognizerDriver *v34;

  p_anchorPoint = &self->_anchorPoint;
  -[_UIGestureRecognizerDriver context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "locationInView:", 0);
  v8 = v7;
  v10 = v9;
  objc_msgSend(a3, "_allWindows");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "anyObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "convertPoint:toSceneReferenceCoordinatesFromView:", v12, v8, v10);
  p_anchorPoint->x = v13;
  p_anchorPoint->y = v14;

  switch(objc_msgSend(a3, "phase"))
  {
    case 1:
      self->_initialTouchAngle = 0.0;
      self->_initialAnchorPoint = *p_anchorPoint;
      objc_msgSend(a3, "timestamp");
      self->_lastTouchTime = v15;
      break;
    case 2:
      self->_previousVelocity = self->_velocity;
      currentRotationCount = self->_currentRotationCount;
      objc_msgSend(a3, "rotation");
      v18 = v17;
      currentTouchAngle = self->_currentTouchAngle;
      objc_msgSend(a3, "timestamp");
      v21 = v20;
      lastTouchTime = self->_lastTouchTime;
      objc_msgSend(a3, "timestamp");
      self->_lastTouchTime = v23;
      v24 = vabdd_f64(v18, currentTouchAngle);
      if (v24 > 1.57079633)
      {
        v25 = self->_currentRotationCount;
        v24 = v18 - currentTouchAngle;
        if (v18 - currentTouchAngle >= 0.0)
          v26 = v25 + 1;
        else
          v26 = v25 - 1;
        self->_currentRotationCount = v26;
      }
      if (-[_UIGestureRecognizerDriver state](self, "state", v24))
        goto LABEL_19;
      v27 = _UIInternalPreferenceUsesDefault_1((int *)&_UIInternalPreference_TransformEventRotationHysteresis, (uint64_t)CFSTR("TransformEventRotationHysteresis"));
      v28 = *(double *)&qword_1EDDA8158;
      v29 = (float)(v28 * 0.017453);
      if (v27)
        v29 = 0.0174532924;
      v30 = -v18;
      if (v18 >= 0.0)
        v30 = v18;
      if (v30 > v29)
      {
LABEL_19:
        v31 = v21 - lastTouchTime;
        self->_currentTouchAngle = v18;
        if (v21 - lastTouchTime > 0.0)
        {
          v32 = -(currentTouchAngle - v18);
          if (currentTouchAngle - v18 >= 0.0)
            v32 = currentTouchAngle - v18;
          if (v32 > 0.0)
          {
            v31 = (currentTouchAngle - v18 + (double)(self->_currentRotationCount - currentRotationCount) * 6.28318531)
                / v31;
            self->_velocity = v31;
          }
        }
        if (!-[_UIGestureRecognizerDriver state](self, "state", v31))
        {
          v34 = self;
          v33 = 1;
          goto LABEL_27;
        }
      }
      break;
    case 3:
      if (-[_UIGestureRecognizerDriver state](self, "state") == 1)
        v33 = 2;
      else
        v33 = 3;
      v34 = self;
      goto LABEL_27;
    case 4:
      v34 = self;
      v33 = 3;
LABEL_27:
      -[_UIGestureRecognizerDriver _setState:notifyDelegate:]((uint64_t)v34, v33, 1);
      break;
    default:
      return;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touches, 0);
  objc_storeStrong((id *)&self->_transformAnalyzer, 0);
}

@end
