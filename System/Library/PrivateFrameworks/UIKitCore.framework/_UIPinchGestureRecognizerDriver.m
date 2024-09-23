@implementation _UIPinchGestureRecognizerDriver

- (_UIPinchGestureRecognizerDriver)init
{
  _UIPinchGestureRecognizerDriver *v2;
  _UIPinchGestureRecognizerDriver *v3;
  uint64_t v4;
  __int128 v5;
  _UIGestureRecognizerTransformAnalyzer *v6;
  _UIGestureRecognizerTransformAnalyzer *transformAnalyzer;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_UIPinchGestureRecognizerDriver;
  v2 = -[_UIGestureRecognizerDriver init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = MEMORY[0x1E0C9BAA8];
    v5 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v2->_transform.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v2->_transform.c = v5;
    *(_OWORD *)&v2->_transform.tx = *(_OWORD *)(v4 + 32);
    v2->_scaleThreshold = 1.0;
    v2->_hysteresis = 8.0;
    v6 = objc_alloc_init(_UIGestureRecognizerTransformAnalyzer);
    transformAnalyzer = v3->_transformAnalyzer;
    v3->_transformAnalyzer = v6;

    -[_UIGestureRecognizerTransformAnalyzer setPinchingWeight:](v3->_transformAnalyzer, "setPinchingWeight:", 4.0);
    -[_UIGestureRecognizerTransformAnalyzer setRotationWeight:](v3->_transformAnalyzer, "setRotationWeight:", 0.5);
    -[_UIGestureRecognizerTransformAnalyzer setTranslationWeight:](v3->_transformAnalyzer, "setTranslationWeight:", 0.5);
  }
  return v3;
}

- (void)reset
{
  uint64_t v3;
  __int128 v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIPinchGestureRecognizerDriver;
  -[_UIGestureRecognizerDriver reset](&v5, sel_reset);
  -[_UIGestureRecognizerTransformAnalyzer reset](self->_transformAnalyzer, "reset");
  v3 = MEMORY[0x1E0C9BAA8];
  v4 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&self->_transform.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&self->_transform.c = v4;
  *(_OWORD *)&self->_transform.tx = *(_OWORD *)(v3 + 32);
  self->_previousVelocity = 0.0;
  self->_velocity = 0.0;
  self->_lastNonZeroTimestampDelta = 0.0;
  *(_BYTE *)&self->_flags &= ~2u;
}

- (void)setScale:(double *)a1
{
  void *v4;
  void *v5;

  if (a1)
  {
    objc_msgSend(a1, "context");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "activeEventOfType:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      a1[5] = a1[12] * a1[5] / a2;
    a1[6] = a2;
    a1[12] = a2;
  }
}

- (BOOL)shouldReceiveComponent:(id)a3 withEvent:(id)a4
{
  return (*(_BYTE *)&self->_flags & 2) == 0;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  void *v6;
  double a;
  void *v8;
  double v9;
  double v10;
  CGFloat v11;
  id v12;

  -[_UIGestureRecognizerDriver context](self, "context", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "activeComponentsForEvent:", a4);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v12, "count") == 2)
  {
    if (self)
      a = self->_transform.a;
    else
      a = 0.0;
    self->_initialScale = a;
    objc_msgSend(v12, "allObjects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    _UIGestureRecognizerDistanceBetweenTouches(v8);
    self->_initialTouchDistance = v9 / self->_initialScale;

    objc_msgSend(a4, "timestamp");
    self->_lastEventTime = v10;
    self->_anchorPoint.x = _CentroidOfTouches(v12, 1);
    self->_anchorPoint.y = v11;
    self->_initialAnchorPoint = self->_anchorPoint;
    *(_BYTE *)&self->_flags |= 2u;
  }

}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double initialTouchDistance;
  CGFloat v12;
  double v13;
  double v14;
  double hysteresis;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  int v21;
  void *v22;
  void *v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  CGFloat v37;
  double v38;
  double v39;
  int v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;
  CGPoint v48;
  CGRect v49;

  v47 = *MEMORY[0x1E0C80C00];
  -[_UIGestureRecognizerDriver context](self, "context", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "activeComponentsForEvent:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count") == 2)
  {
    objc_msgSend(v7, "allObjects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    _UIGestureRecognizerDistanceBetweenTouches(v8);
    v10 = v9;

    -[_UIGestureRecognizerTransformAnalyzer analyzeTouches:](self->_transformAnalyzer, "analyzeTouches:", v7);
    if (-[_UIGestureRecognizerDriver state](self, "state"))
    {
      initialTouchDistance = self->_initialTouchDistance;
LABEL_4:
      v12 = v10 / initialTouchDistance;
      v13 = _CentroidOfTouches(v7, 1);
      -[_UIPinchGestureRecognizerDriver _applyScale:atLocation:touchDistance:withEvent:]((uint64_t)self, a4, v12, v13, v14, v10);
      goto LABEL_29;
    }
    hysteresis = self->_hysteresis;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v16 = v7;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v43;
      while (2)
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v43 != v19)
            objc_enumerationMutation(v16);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * i), "_isPointerTouch") & 1) != 0)
          {

            if (fabs(hysteresis + -8.0) <= 2.22044605e-16)
            {
              if (_UIInternalPreferencesRevisionOnce != -1)
                dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_4_20);
              v21 = _UIInternalPreferencesRevisionVar;
              hysteresis = 2.0;
              if (_UIInternalPreferencesRevisionVar >= 1)
              {
                v40 = _UIInternalPreference_PinchPointerTouchHysteresis;
                if (_UIInternalPreferencesRevisionVar != _UIInternalPreference_PinchPointerTouchHysteresis)
                {
                  while (v21 >= v40)
                  {
                    _UIInternalPreferenceSync(v21, &_UIInternalPreference_PinchPointerTouchHysteresis, (uint64_t)CFSTR("PinchPointerTouchHysteresis"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
                    v40 = _UIInternalPreference_PinchPointerTouchHysteresis;
                    if (v21 == _UIInternalPreference_PinchPointerTouchHysteresis)
                      goto LABEL_18;
                  }
                  hysteresis = *(double *)&qword_1EDDA7FA0;
                }
              }
            }
            goto LABEL_18;
          }
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
        if (v18)
          continue;
        break;
      }
    }

LABEL_18:
    if (vabdd_f64(self->_initialTouchDistance * self->_initialScale, v10) > hysteresis)
    {
      -[_UIGestureRecognizerDriver context](self, "context");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "eventReceivingWindow");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "_usableBounds");
      v25 = v24;
      v27 = v26;
      v29 = v28;
      v31 = v30;
      v42 = 0u;
      v43 = 0u;
      v44 = 0u;
      v45 = 0u;
      v32 = v16;
      v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
      if (v33)
      {
        v34 = v33;
        v41 = v22;
        v35 = *(_QWORD *)v43;
        while (2)
        {
          for (j = 0; j != v34; ++j)
          {
            if (*(_QWORD *)v43 != v35)
              objc_enumerationMutation(v32);
            v48.x = -[UITouch _locationInWindow:](*(double **)(*((_QWORD *)&v42 + 1) + 8 * j), v23);
            v48.y = v37;
            v49.origin.x = v25;
            v49.origin.y = v27;
            v49.size.width = v29;
            v49.size.height = v31;
            if (!CGRectContainsPoint(v49, v48))
            {

              goto LABEL_29;
            }
          }
          v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
          if (v34)
            continue;
          break;
        }

        v22 = v41;
      }
      else
      {

      }
      v38 = self->_initialTouchDistance;
      v39 = -hysteresis;
      if (v38 > v10)
        v39 = hysteresis;
      initialTouchDistance = v38 - v39 / self->_initialScale;
      self->_initialTouchDistance = initialTouchDistance;
      goto LABEL_4;
    }
  }
LABEL_29:

}

- (void)_applyScale:(CGFloat)a3 atLocation:(double)a4 touchDistance:(double)a5 withEvent:(double)a6
{
  double v12;
  double v13;
  double v14;
  double v15;
  char v16;
  BOOL v17;
  double v19;
  uint64_t v20;
  double v21;
  __int128 v22;
  uint64_t v23;
  double v24;
  _BOOL4 v25;
  void *v26;
  double v27;
  double v28;
  char v29;
  CGAffineTransform v30;

  if (!a1)
    return;
  v12 = *(double *)(a1 + 96);
  objc_msgSend(a2, "timestamp");
  v14 = v13;
  v15 = *(double *)(a1 + 88);
  if (v15 == 1.0)
  {
    v16 = 0;
  }
  else
  {
    v17 = v15 <= 1.0 || v15 >= a3;
    v16 = (v15 >= 1.0 || v15 <= a3) && v17;
  }
  v19 = *(double *)(a1 + 56);
  *(double *)(a1 + 168) = a4;
  *(double *)(a1 + 176) = a5;
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a1 + 64);
  objc_msgSend(a2, "timestamp");
  *(_QWORD *)(a1 + 56) = v20;
  if (objc_msgSend(a2, "type") || objc_msgSend(*(id *)(a1 + 152), "dominantComponent") == 2)
  {
    v21 = v14 - v19;
    CGAffineTransformMakeScale(&v30, a3, a3);
    v22 = *(_OWORD *)&v30.c;
    *(_OWORD *)(a1 + 96) = *(_OWORD *)&v30.a;
    *(_OWORD *)(a1 + 112) = v22;
    *(_OWORD *)(a1 + 128) = *(_OWORD *)&v30.tx;
    if (objc_msgSend(a2, "type"))
    {
      v23 = objc_msgSend(a2, "type");
      v24 = a3 - v12;
      if (a3 - v12 < 0.0)
        v24 = -(a3 - v12);
      v25 = v23 == 14 && v24 > 0.0;
    }
    else
    {
      v25 = 1;
    }
    if (v21 <= 0.0)
    {
      if (v21 != 0.0 || (v21 = *(double *)(a1 + 80), v21 <= 0.0))
      {
        +[UIScreen mainScreen](UIScreen, "mainScreen");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "_refreshRate");
        v21 = v27;

      }
    }
    else
    {
      *(double *)(a1 + 80) = v21;
    }
    if (!v25)
      goto LABEL_31;
    v28 = (a3 - v12) / v21;
  }
  else
  {
    *(double *)(a1 + 40) = a6 / *(double *)(a1 + 96);
    v28 = 0.0;
  }
  *(double *)(a1 + 64) = v28;
LABEL_31:
  if (objc_msgSend((id)a1, "state"))
    v29 = 1;
  else
    v29 = v16;
  if ((v29 & 1) == 0)
    -[_UIGestureRecognizerDriver _setState:notifyDelegate:](a1, 1, 1);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  void *v6;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  id v10;

  -[_UIGestureRecognizerDriver context](self, "context", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "activeComponentsForEvent:", a4);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v10, "count");
  if (v7)
  {
    if (v7 != 1 || (*(_BYTE *)&self->_flags & 1) == 0)
      goto LABEL_10;
    v8 = -[_UIGestureRecognizerDriver state](self, "state");
  }
  else
  {
    v8 = -[_UIGestureRecognizerDriver state](self, "state");
    if (!self)
      goto LABEL_10;
  }
  if (v8 == 1)
    v9 = 2;
  else
    v9 = 3;
  -[_UIGestureRecognizerDriver _setState:notifyDelegate:]((uint64_t)self, v9, 1);
LABEL_10:

}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;

  -[_UIGestureRecognizerDriver context](self, "context", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "activeComponentsForEvent:", a4);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v8, "count");
  if (!v7)
  {
    if (!self)
      goto LABEL_7;
LABEL_6:
    -[_UIGestureRecognizerDriver _setState:notifyDelegate:]((uint64_t)self, 3, 1);
    goto LABEL_7;
  }
  if (v7 == 1 && (*(_BYTE *)&self->_flags & 1) != 0)
    goto LABEL_6;
LABEL_7:

}

- (void)transformChangedWithEvent:(id)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double a;
  double v17;
  int64_t v18;
  uint64_t v19;
  _UIPinchGestureRecognizerDriver *v20;
  double v21;

  -[_UIGestureRecognizerDriver context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "locationInView:", 0);
  v7 = v6;
  v9 = v8;
  objc_msgSend(a3, "_allWindows");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "anyObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "convertPoint:toSceneReferenceCoordinatesFromView:", v11, v7, v9);
  v13 = v12;
  v15 = v14;

  switch(objc_msgSend(a3, "phase"))
  {
    case 1:
      if (self)
        a = self->_transform.a;
      else
        a = 0.0;
      self->_initialScale = a;
      objc_msgSend(a3, "timestamp");
      self->_lastEventTime = v17;
      self->_anchorPoint.x = v13;
      self->_anchorPoint.y = v15;
      self->_initialAnchorPoint.x = v13;
      self->_initialAnchorPoint.y = v15;
      break;
    case 2:
      objc_msgSend(a3, "scale");
      -[_UIPinchGestureRecognizerDriver _applyScale:atLocation:touchDistance:withEvent:]((uint64_t)self, a3, v21 * self->_initialScale, v13, v15, 0.0);
      break;
    case 3:
      v18 = -[_UIGestureRecognizerDriver state](self, "state");
      if (self)
      {
        if (v18 == 1)
          v19 = 2;
        else
          v19 = 3;
        v20 = self;
        goto LABEL_13;
      }
      break;
    case 4:
      if (self)
      {
        v20 = self;
        v19 = 3;
LABEL_13:
        -[_UIGestureRecognizerDriver _setState:notifyDelegate:]((uint64_t)v20, v19, 1);
      }
      break;
    default:
      return;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transformAnalyzer, 0);
}

@end
