@implementation UIScrollEvent

- (id)_init
{
  id v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIScrollEvent;
  v2 = -[UIEvent _init](&v5, sel__init);
  v3 = v2;
  if (v2)
    _UIScrollEventCommonInit(v2);
  return v3;
}

- (id)_initWithEvent:(__GSEvent *)a3 touches:(id)a4
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UIScrollEvent;
  v4 = -[UIEvent _init](&v7, sel__init, a3, a4);
  v5 = v4;
  if (v4)
    _UIScrollEventCommonInit(v4);
  return v5;
}

- (void)_setHIDEvent:(__IOHIDEvent *)a3
{
  const void *v6;
  BKSHIDEventPointerAttributes *v7;
  BKSHIDEventPointerAttributes *pointerAttributes;
  void *v9;
  CGFloat v10;
  CGFloat v11;
  int Phase;
  unint64_t v13;
  void *v14;
  NSObject *v15;
  unint64_t v16;
  NSObject *v17;
  objc_super v18;
  uint8_t buf[16];

  v18.receiver = self;
  v18.super_class = (Class)UIScrollEvent;
  -[UIEvent _setHIDEvent:](&v18, sel__setHIDEvent_);
  if (-[UIEvent _hidEvent](self, "_hidEvent"))
  {
    v6 = _UIEventHIDGetChildPointerEvent((uint64_t)a3);
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIScrollEvent.m"), 186, CFSTR("Invalid event structure for %@: missing child pointer HID event: %@"), objc_opt_class(), a3);

    }
    BKSHIDEventGetPointerAttributes();
    v7 = (BKSHIDEventPointerAttributes *)objc_claimAutoreleasedReturnValue();
    pointerAttributes = self->_pointerAttributes;
    self->_pointerAttributes = v7;

    _UIEventHIDUIWindowForHIDEvent();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v9, "_convertPointToSceneReferenceSpace:", _UIEventHIDConvertPointerLocation3DToWindow((uint64_t)v6, v9));
      self->_sceneReferenceLocation.x = v10;
      self->_sceneReferenceLocation.y = v11;
    }
    else
    {
      self->_sceneReferenceLocation = (CGPoint)*MEMORY[0x1E0C9D538];
    }
    if (os_variant_has_internal_diagnostics())
    {
      if (a3)
        goto LABEL_10;
      __UIFaultDebugAssertLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v15, OS_LOG_TYPE_FAULT, "unable to determine scrollEvent phase because the _hidEvent is nil", buf, 2u);
      }

    }
    else
    {
      if (a3)
      {
LABEL_10:
        Phase = IOHIDEventGetPhase();
        switch(Phase)
        {
          case 1:
            self->_phase = 2;
            if (self->_lastReceivedPhase == 3 && !-[UIScrollEvent _scrollType](self, "_scrollType"))
              self->_phase = 3;
            goto LABEL_29;
          case 2:
            v13 = 3;
            goto LABEL_28;
          case 3:
          case 5:
          case 6:
          case 7:
            goto LABEL_27;
          case 4:
            v13 = 4;
            goto LABEL_28;
          case 8:
            v13 = 5;
            goto LABEL_28;
          default:
            if (Phase != 128)
              goto LABEL_27;
            v13 = 1;
            goto LABEL_28;
        }
      }
      v16 = _scrollPhaseForHIDEvent___s_category;
      if (!_scrollPhaseForHIDEvent___s_category)
      {
        v16 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v16, (unint64_t *)&_scrollPhaseForHIDEvent___s_category);
      }
      v17 = *(NSObject **)(v16 + 8);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_185066000, v17, OS_LOG_TYPE_ERROR, "unable to determine scrollEvent phase because the _hidEvent is nil", buf, 2u);
      }
    }
LABEL_27:
    v13 = 0;
LABEL_28:
    self->_phase = v13;
  }
  else
  {
    self->_lastReceivedPhase = self->_phase;
    self->_phase = 0;
    self->_lastDeliveredPhase = 0;
    v9 = self->_pointerAttributes;
    self->_pointerAttributes = 0;
  }
LABEL_29:

}

- (BOOL)_shouldSendEvent
{
  unint64_t phase;

  phase = self->_phase;
  return (phase & 0xFFFFFFFFFFFFFFFELL) != 4 || phase != self->_lastReceivedPhase;
}

- (int64_t)type
{
  return 10;
}

- (int64_t)subtype
{
  return 0;
}

- (id)_cloneEvent
{
  UIScrollEvent *v2;
  id v3;
  uint64_t v4;
  void *v5;
  NSMapTable *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  UIScrollEvent *v13;
  void *v14;
  void *v15;
  void *v16;
  NSMapTable *obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  objc_super v23;
  _BYTE v24[128];
  uint64_t v25;

  v2 = self;
  v25 = *MEMORY[0x1E0C80C00];
  v23.receiver = self;
  v23.super_class = (Class)UIScrollEvent;
  v3 = -[UIEvent _cloneEvent](&v23, sel__cloneEvent);
  *((_QWORD *)v3 + 28) = v2->_phase;
  *((_OWORD *)v3 + 8) = v2->_sceneReferenceLocation;
  *((_QWORD *)v3 + 18) = v2->_lastDeliveredPhase;
  *((_QWORD *)v3 + 19) = v2->_lastReceivedPhase;
  objc_storeStrong((id *)v3 + 20, v2->_pointerAttributes);
  if (v2->_gestureRecognizersByWindow)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)*((_QWORD *)v3 + 15);
    *((_QWORD *)v3 + 15) = v4;

    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v6 = v2->_gestureRecognizersByWindow;
    v7 = -[NSMapTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v20;
      obj = v6;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v20 != v9)
            objc_enumerationMutation(obj);
          v11 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
          -[NSMapTable objectForKey:](v2->_gestureRecognizersByWindow, "objectForKey:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v2;
          v14 = (void *)*((_QWORD *)v3 + 15);
          v15 = (void *)objc_msgSend(v12, "mutableCopy");
          v16 = v14;
          v2 = v13;
          objc_msgSend(v16, "setObject:forKey:", v15, v11);

        }
        v6 = obj;
        v8 = -[NSMapTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      }
      while (v8);
    }
  }
  else
  {
    v6 = (NSMapTable *)*((_QWORD *)v3 + 15);
    *((_QWORD *)v3 + 15) = 0;
  }

  return v3;
}

- (void)_cleanupAfterDispatch
{
  _UIScrollEventAsyncDeliveryTarget *asyncDeliveryTarget;
  UIGestureRecognizer *asyncDeliveryGesture;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  objc_super v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  self->_isDoingAsyncDelivery = 0;
  if ((self->_phase & 0xFFFFFFFFFFFFFFFELL) == 4)
  {
    asyncDeliveryTarget = self->_asyncDeliveryTarget;
    self->_asyncDeliveryTarget = 0;

    asyncDeliveryGesture = self->_asyncDeliveryGesture;
    self->_asyncDeliveryGesture = 0;

  }
  if (self->_isCloneForAsyncDelivery)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    NSAllMapTableValues(self->_gestureRecognizersByWindow);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v23;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v23 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v9);
          v18 = 0u;
          v19 = 0u;
          v20 = 0u;
          v21 = 0u;
          v11 = v10;
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v19;
            do
            {
              v15 = 0;
              do
              {
                if (*(_QWORD *)v19 != v14)
                  objc_enumerationMutation(v11);
                v16 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v15);
                if (v16)
                  objc_msgSend(*(id *)(v16 + 176), "removeObject:", self);
                ++v15;
              }
              while (v13 != v15);
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
            }
            while (v13);
          }

          ++v9;
        }
        while (v9 != v7);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v7);
    }

  }
  v17.receiver = self;
  v17.super_class = (Class)UIScrollEvent;
  -[UIEvent _cleanupAfterDispatch](&v17, sel__cleanupAfterDispatch);
}

- (CGPoint)_convertPointFromSceneReferenceSpace:(CGPoint)a3 toView:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    -[UIScrollEvent _allWindows](self, "_allWindows");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "anyObject");
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v9, "_window");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "_convertPointFromSceneReferenceSpace:", x, y);
    x = v13;
    y = v14;
  }
  objc_msgSend(v9, "convertPoint:fromView:", 0, x, y);
  v16 = v15;
  v18 = v17;

  v19 = v16;
  v20 = v18;
  result.y = v20;
  result.x = v19;
  return result;
}

- (CGPoint)_convertPointToSceneReferenceSpace:(CGPoint)a3 fromView:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    -[UIScrollEvent _allWindows](self, "_allWindows");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "anyObject");
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v9, "_window");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "convertPoint:toView:", 0, x, y);
  v14 = v12;
  v15 = v13;
  if (v11)
  {
    objc_msgSend(v11, "_convertPointToSceneReferenceSpace:", v12, v13);
    v14 = v16;
    v15 = v17;
  }

  v18 = v14;
  v19 = v15;
  result.y = v19;
  result.x = v18;
  return result;
}

- (unint64_t)_scrollType
{
  BKSHIDEventPointerAttributes *v2;
  BKSHIDEventPointerAttributes *v3;
  double v4;
  double v5;
  unint64_t v6;

  v2 = self->_pointerAttributes;
  v3 = v2;
  v6 = 1;
  if (v2)
  {
    if (-[BKSHIDEventPointerAttributes source](v2, "source") != 12
      && -[BKSHIDEventPointerAttributes source](v3, "source") == 11)
    {
      -[BKSHIDEventPointerAttributes digitizerSurfaceWidth](v3, "digitizerSurfaceWidth");
      if (v4 <= 0.0
        || (-[BKSHIDEventPointerAttributes digitizerSurfaceHeight](v3, "digitizerSurfaceHeight"), v5 <= 0.0))
      {
        v6 = 0;
      }
    }
  }

  return v6;
}

- (BOOL)_isHighResolution
{
  BKSHIDEventPointerAttributes *pointerAttributes;

  pointerAttributes = self->_pointerAttributes;
  if (pointerAttributes)
    LODWORD(pointerAttributes) = (-[BKSHIDEventPointerAttributes options](pointerAttributes, "options") >> 2) & 1;
  return (char)pointerAttributes;
}

- (unint64_t)_scrollDeviceCategory
{
  BKSHIDEventPointerAttributes *v3;
  BKSHIDEventPointerAttributes *v4;
  double v5;
  unint64_t v7;
  unint64_t v8;

  v3 = self->_pointerAttributes;
  v4 = v3;
  if (!v3)
    goto LABEL_15;
  if (-[BKSHIDEventPointerAttributes source](v3, "source") != 12)
  {
    if (-[BKSHIDEventPointerAttributes source](v4, "source") == 11)
    {
      v8 = -[UIScrollEvent _scrollType](self, "_scrollType");
      if (v8 == 1)
      {
        v7 = 3;
        goto LABEL_16;
      }
      if (!v8)
      {
        if (-[UIScrollEvent _isHighResolution](self, "_isHighResolution"))
          v7 = 4;
        else
          v7 = 5;
        goto LABEL_16;
      }
    }
LABEL_15:
    v7 = 0;
    goto LABEL_16;
  }
  -[BKSHIDEventPointerAttributes digitizerSurfaceHeight](v4, "digitizerSurfaceHeight");
  if (v5 != 3388211.0 && v5 > 3198156.0)
    v7 = 2;
  else
    v7 = 1;
LABEL_16:

  return v7;
}

- (double)_beganScrollTimestamp
{
  double result;

  -[BKSHIDEventPointerAttributes initialTouchTimestamp](self->_pointerAttributes, "initialTouchTimestamp");
  return result;
}

- (CGPoint)locationInView:(id)a3
{
  double v3;
  double v4;
  CGPoint result;

  -[UIScrollEvent _convertPointFromSceneReferenceSpace:toView:](self, "_convertPointFromSceneReferenceSpace:toView:", a3, self->_sceneReferenceLocation.x, self->_sceneReferenceLocation.y);
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGVector)_convertDeltaFromHIDDeviceSpaceToSceneReferenceSpaceIfNeeded:(CGVector)a3
{
  double dy;
  double dx;
  char v6;
  char v7;
  unint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGVector result;

  dy = a3.dy;
  dx = a3.dx;
  v6 = -[BKSHIDEventPointerAttributes options](self->_pointerAttributes, "options");
  if ((v6 & 0x40) != 0)
  {
    v7 = v6;
    v8 = _UIEventHIDGetInterfaceOrientationForEvent((uint64_t)self->super._hidEvent);
    if (v8 == 3)
      v9 = -dx;
    else
      v9 = dy;
    if (v8 == 3)
      v10 = dy;
    else
      v10 = dx;
    if (v8 == 4)
    {
      v9 = dx;
      v10 = -dy;
    }
    if (v8 >= 2)
      dy = v9;
    else
      dy = -dy;
    if (v8 >= 2)
      dx = v10;
    else
      dx = -dx;
    if ((v7 & 0x20) == 0)
    {
      dx = -dx;
      dy = -dy;
    }
  }
  v11 = dx;
  v12 = dy;
  result.dy = v12;
  result.dx = v11;
  return result;
}

- (CGVector)acceleratedDelta
{
  double dx;
  double dy;
  __IOHIDEvent *v5;
  double v6;
  double ChildScrollVector;
  double v8;
  double v9;
  CGVector result;

  dx = 0.0;
  dy = 0.0;
  if (!self->_isStiflingDeltas)
  {
    if (self->_hasSimulatedMomentumDelta)
    {
      dx = self->_simulatedMomentumDelta.dx;
      dy = self->_simulatedMomentumDelta.dy;
    }
    else
    {
      v5 = -[UIEvent _hidEvent](self, "_hidEvent", 0.0, 0.0);
      if (_UIEventHIDGetChildScrollEvent((uint64_t)v5))
      {
        ChildScrollVector = _UIEventGetChildScrollVector((uint64_t)v5);
      }
      else if (v5)
      {
        IOHIDEventGetFloatValue();
        ChildScrollVector = v8;
        IOHIDEventGetFloatValue();
        v6 = v9;
      }
      else
      {
        v6 = 0.0;
        ChildScrollVector = 0.0;
      }
      -[UIScrollEvent _convertDeltaFromHIDDeviceSpaceToSceneReferenceSpaceIfNeeded:](self, "_convertDeltaFromHIDDeviceSpaceToSceneReferenceSpaceIfNeeded:", ChildScrollVector, v6);
    }
  }
  result.dy = dy;
  result.dx = dx;
  return result;
}

- (CGVector)nonAcceleratedDelta
{
  double dx;
  double dy;
  double v5;
  double v6;
  double v7;
  double v8;
  CGVector result;

  dx = 0.0;
  dy = 0.0;
  if (!self->_isStiflingDeltas)
  {
    if (self->_hasSimulatedMomentumDelta)
    {
      dx = self->_simulatedMomentumDelta.dx;
      dy = self->_simulatedMomentumDelta.dy;
    }
    else
    {
      if (-[UIEvent _hidEvent](self, "_hidEvent", 0.0, 0.0))
      {
        IOHIDEventGetFloatValue();
        v6 = v5;
        IOHIDEventGetFloatValue();
        v8 = v7;
      }
      else
      {
        v8 = 0.0;
        v6 = 0.0;
      }
      -[UIScrollEvent _convertDeltaFromHIDDeviceSpaceToSceneReferenceSpaceIfNeeded:](self, "_convertDeltaFromHIDDeviceSpaceToSceneReferenceSpaceIfNeeded:", v6, v8);
    }
  }
  result.dy = dy;
  result.dx = dx;
  return result;
}

- (CGVector)_adjustedDeltaForPanWithAcceleration:(BOOL)a3 honoringScrollDirectionPreference:(BOOL)a4
{
  int8x16_t v6;
  uint64_t v7;
  uint64_t v8;
  int8x16_t v9;
  BOOL v10;
  double v11;
  double v12;
  double v13;
  double v14;
  int v15;
  int8x16_t v16;
  BOOL v17;
  float64x2_t v18;
  int8x16_t v19;
  double v20;
  double v21;
  BOOL v22;
  unint64_t v23;
  BOOL v24;
  int v25;
  int8x16_t v26;
  double v27;
  double v28;
  int8x16_t v29;
  CGVector result;

  if (a3)
    -[UIScrollEvent acceleratedDelta](self, "acceleratedDelta");
  else
    -[UIScrollEvent nonAcceleratedDelta](self, "nonAcceleratedDelta");
  v26.i64[1] = v8;
  v29 = v6;
  if (-[UIScrollEvent _scrollType](self, "_scrollType", v7))
  {
    if (a4)
      goto LABEL_9;
    goto LABEL_6;
  }
  if (_UIInternalPreferencesRevisionOnce != -1)
    dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_4_20);
  v15 = _UIInternalPreferencesRevisionVar;
  v9.i64[0] = 3.0;
  v16 = v29;
  if (_UIInternalPreferencesRevisionVar >= 1)
  {
    v25 = _UIInternalPreference_DiscreteScrollMinimumDelta;
    if (_UIInternalPreferencesRevisionVar != _UIInternalPreference_DiscreteScrollMinimumDelta)
    {
      while (v15 >= v25)
      {
        _UIInternalPreferenceSync(v15, &_UIInternalPreference_DiscreteScrollMinimumDelta, (uint64_t)CFSTR("DiscreteScrollMinimumDelta"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
        v25 = _UIInternalPreference_DiscreteScrollMinimumDelta;
        if (v15 == _UIInternalPreference_DiscreteScrollMinimumDelta)
        {
          v16 = v29;
          v9.i64[0] = 3.0;
          goto LABEL_16;
        }
      }
      v9.i64[0] = qword_1EDDA8268;
      v16 = v29;
    }
  }
LABEL_16:
  v17 = fabs(*(double *)v16.i64) >= *(double *)v9.i64 || *(double *)v16.i64 == 0.0;
  v18.f64[0] = NAN;
  v18.f64[1] = NAN;
  v19 = (int8x16_t)vnegq_f64(v18);
  *(_QWORD *)&v20 = vbslq_s8(v19, v9, v16).u64[0];
  if (!v17)
    *(double *)v16.i64 = v20;
  v29.i64[0] = v16.i64[0];
  v21 = *(double *)v26.i64;
  v22 = fabs(*(double *)v26.i64) >= *(double *)v9.i64 || *(double *)v26.i64 == 0.0;
  v23 = vbslq_s8(v19, v9, v26).u64[0];
  if (!v22)
    v21 = *(double *)&v23;
  *(double *)v26.i64 = v21;
  if (!a4)
  {
LABEL_6:
    v10 = -[UIScrollEvent directionInvertedFromDevice](self, "directionInvertedFromDevice", v26.i64[0]);
    v12 = v27;
    v11 = *(double *)v29.i64;
    if (!v10)
    {
      v12 = -v27;
      v11 = -*(double *)v29.i64;
    }
    *(double *)v26.i64 = v12;
    *(double *)v29.i64 = v11;
  }
LABEL_9:
  if ((-[UIEvent _modifierFlags](self, "_modifierFlags", v26.i64[0]) & 0x20000) != 0
    && !-[UIScrollEvent _scrollType](self, "_scrollType"))
  {
    v24 = -[UIScrollEvent _isHighResolution](self, "_isHighResolution");
    v14 = v28;
    v13 = *(double *)v29.i64;
    if (!v24)
    {
      v14 = -*(double *)v29.i64;
      v13 = -v28;
    }
  }
  else
  {
    v14 = v28;
    v13 = *(double *)v29.i64;
  }
  result.dy = v14;
  result.dx = v13;
  return result;
}

- (CGVector)_adjustedAcceleratedDeltaInView:(id)a3
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
  CGVector result;

  v4 = a3;
  -[UIScrollEvent _adjustedDeltaForPanWithAcceleration:honoringScrollDirectionPreference:](self, "_adjustedDeltaForPanWithAcceleration:honoringScrollDirectionPreference:", 1, 1);
  v6 = v5;
  v8 = v7;
  -[UIScrollEvent _convertPointFromSceneReferenceSpace:toView:](self, "_convertPointFromSceneReferenceSpace:toView:", v4, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  v10 = v9;
  v12 = v11;
  -[UIScrollEvent _convertPointFromSceneReferenceSpace:toView:](self, "_convertPointFromSceneReferenceSpace:toView:", v4, v6, v8);
  v14 = v13;
  v16 = v15;

  v17 = v14 - v10;
  v18 = v16 - v12;
  result.dy = v18;
  result.dx = v17;
  return result;
}

- (BOOL)directionInvertedFromDevice
{
  return 1;
}

- (id)_gestureRecognizersForWindow:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  NSMapTable *gestureRecognizersByWindow;
  void *v10;

  v4 = a3;
  -[NSMapTable objectForKey:](self->_gestureRecognizersByWindow, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else if (self->_phase - 1 > 1)
  {
    v7 = 0;
  }
  else
  {
    -[UIScrollEvent _windowServerHitTestWindow](self, "_windowServerHitTestWindow");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    _UINonComponentEventHitTestGestureRecognizers(self, v8, (uint64_t)v8, self->_sceneReferenceLocation.x, self->_sceneReferenceLocation.y);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    gestureRecognizersByWindow = self->_gestureRecognizersByWindow;
    v10 = (void *)objc_msgSend(v7, "mutableCopy");
    -[NSMapTable setObject:forKey:](gestureRecognizersByWindow, "setObject:forKey:", v10, v4);

  }
  return v7;
}

- (void)_removeGestureRecognizer:(id)a3 fromComponents:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  NSAllMapTableValues(self->_gestureRecognizersByWindow);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "removeObject:", v5, (_QWORD)v11);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)_removeGestureRecognizersFromWindows
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  NSObject *v9;
  unint64_t v10;
  NSObject *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t v16[128];
  uint8_t buf[4];
  UIScrollEvent *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (os_variant_has_internal_diagnostics())
  {
    if (self->_isCloneForAsyncDelivery)
    {
      __UIFaultDebugAssertLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 134217984;
        v18 = self;
        _os_log_fault_impl(&dword_185066000, v9, OS_LOG_TYPE_FAULT, "Cloned scroll event for async delivery %p should never get _removeGestureRecognizersFromWindows", buf, 0xCu);
      }

    }
  }
  else if (self->_isCloneForAsyncDelivery)
  {
    v10 = _removeGestureRecognizersFromWindows___s_category;
    if (!_removeGestureRecognizersFromWindows___s_category)
    {
      v10 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v10, (unint64_t *)&_removeGestureRecognizersFromWindows___s_category);
    }
    v11 = *(NSObject **)(v10 + 8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v18 = self;
      _os_log_impl(&dword_185066000, v11, OS_LOG_TYPE_ERROR, "Cloned scroll event for async delivery %p should never get _removeGestureRecognizersFromWindows", buf, 0xCu);
    }
  }
  if (!-[UIScrollEvent _hasDeliveredTerminalPhase](self, "_hasDeliveredTerminalPhase") && !self->_isDoingAsyncDelivery)
  {
    v3 = (void *)objc_opt_new();
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    NSAllMapTableValues(self->_gestureRecognizersByWindow);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(v3, "unionSet:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12);
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v6);
    }

    -[UIScrollEvent _removeGestureRecognizersSendingCancelledEvent:](self, "_removeGestureRecognizersSendingCancelledEvent:", v3);
  }
  -[NSMapTable removeAllObjects](self->_gestureRecognizersByWindow, "removeAllObjects", (_QWORD)v12);
}

- (BOOL)_consumeBeforeDeliveryToGestureRecognizers:(id)a3 inWindow:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  _BYTE *v9;
  NSMutableSet *outstandingSnapshotEventsForAsyncDelivery;
  NSMutableSet *v11;
  NSMutableSet *v12;
  _UIScrollEventAsyncDeliveryTarget *v13;
  _BYTE *v14;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  _UIScrollEventAsyncDeliveryTarget *v22;
  _UIScrollEventAsyncDeliveryTarget *asyncDeliveryTarget;
  _UIScrollEventAsyncDeliveryTarget *v24;
  uint64_t v25;
  _QWORD v26[5];
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (self->_isCloneForAsyncDelivery)
    goto LABEL_2;
  if (!self->_asyncDeliveryTarget)
  {
    if (self->_phase - 1 > 1)
      goto LABEL_21;
    v25 = 168;
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v16 = v6;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v30;
      while (2)
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v30 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(v21, "_asyncDeliveryTargetForScrollEvent:", self);
            v22 = (_UIScrollEventAsyncDeliveryTarget *)objc_claimAutoreleasedReturnValue();
            if (v22)
            {
              asyncDeliveryTarget = self->_asyncDeliveryTarget;
              self->_asyncDeliveryTarget = v22;
              v24 = v22;

              objc_storeStrong((id *)&self->_asyncDeliveryGesture, v21);
              goto LABEL_20;
            }
          }
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
        if (v18)
          continue;
        break;
      }
    }
LABEL_20:

    if (!self->_asyncDeliveryTarget)
    {
LABEL_21:
      objc_msgSend(v6, "count", v25);
LABEL_2:
      v8 = 0;
      goto LABEL_7;
    }
  }
  v9 = -[UIScrollEvent _cloneEvent](self, "_cloneEvent", v25);
  v9[185] = 1;
  self->_isDoingAsyncDelivery = 1;
  outstandingSnapshotEventsForAsyncDelivery = self->_outstandingSnapshotEventsForAsyncDelivery;
  if (!outstandingSnapshotEventsForAsyncDelivery)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v11 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    v12 = self->_outstandingSnapshotEventsForAsyncDelivery;
    self->_outstandingSnapshotEventsForAsyncDelivery = v11;

    outstandingSnapshotEventsForAsyncDelivery = self->_outstandingSnapshotEventsForAsyncDelivery;
  }
  -[NSMutableSet addObject:](outstandingSnapshotEventsForAsyncDelivery, "addObject:", v9);
  v13 = self->_asyncDeliveryTarget;
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __69__UIScrollEvent__consumeBeforeDeliveryToGestureRecognizers_inWindow___block_invoke;
  v26[3] = &unk_1E16B2B40;
  v26[4] = self;
  v27 = v9;
  v28 = v7;
  v14 = v9;
  -[_UIScrollEventAsyncDeliveryTarget _asynchronouslyDeliverScrollEvent:completion:](v13, "_asynchronouslyDeliverScrollEvent:completion:", v14, v26);

  v8 = 1;
LABEL_7:

  return v8;
}

uint64_t __69__UIScrollEvent__consumeBeforeDeliveryToGestureRecognizers_inWindow___block_invoke(uint64_t a1, int a2)
{
  uint64_t result;
  void *v6;

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 192), "containsObject:", *(_QWORD *)(a1 + 40));
  if ((_DWORD)result)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 192), "removeObject:", *(_QWORD *)(a1 + 40));
    if ((unint64_t)(objc_msgSend(*(id *)(a1 + 40), "phase") - 1) <= 2 && a2 != 0)
      objc_msgSend(*(id *)(a1 + 40), "_beginStiflingDeltas");
    objc_msgSend((id)UIApp, "_gestureEnvironment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIGestureEnvironment _updateForEvent:window:]((uint64_t)v6, *(void **)(a1 + 40), *(_QWORD *)(a1 + 48));

    if (a2)
      objc_msgSend(*(id *)(a1 + 40), "_endStiflingDeltas");
    return objc_msgSend(*(id *)(a1 + 40), "_cleanupAfterDispatch");
  }
  return result;
}

- (void)_beginStiflingDeltas
{
  CGVector *p_stifledDelta;
  CGFloat v4;
  CGFloat v5;

  p_stifledDelta = &self->_stifledDelta;
  -[UIScrollEvent acceleratedDelta](self, "acceleratedDelta");
  p_stifledDelta->dx = v4;
  p_stifledDelta->dy = v5;
  self->_isStiflingDeltas = 1;
}

- (void)_endStiflingDeltas
{
  self->_stifledDelta.dx = 0.0;
  self->_stifledDelta.dy = 0.0;
  self->_isStiflingDeltas = 0;
}

- (void)_simulateMomentumWithDelta:(CGVector)a3 inView:(id)a4
{
  double dy;
  double dx;
  double v7;
  double v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;

  dy = a3.dy;
  dx = a3.dx;
  self->_hasSimulatedMomentumDelta = 1;
  v7 = *MEMORY[0x1E0C9D538];
  v8 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v9 = a4;
  -[UIScrollEvent _convertPointToSceneReferenceSpace:fromView:](self, "_convertPointToSceneReferenceSpace:fromView:", v9, v7, v8);
  v11 = v10;
  v13 = v12;
  -[UIScrollEvent _convertPointToSceneReferenceSpace:fromView:](self, "_convertPointToSceneReferenceSpace:fromView:", v9, dx, dy);
  v15 = v14;
  v17 = v16;

  self->_simulatedMomentumDelta.dx = v15 - v11;
  self->_simulatedMomentumDelta.dy = v17 - v13;
}

- (BOOL)_sendEventToGestureRecognizer:(id)a3
{
  objc_msgSend(a3, "_componentsChanged:withEvent:", 0, self);
  return 1;
}

- (void)_wasDeliveredToGestureRecognizers
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIScrollEvent;
  -[UIEvent _wasDeliveredToGestureRecognizers](&v3, sel__wasDeliveredToGestureRecognizers);
  self->_lastDeliveredPhase = self->_phase;
}

- (BOOL)_hasDeliveredTerminalPhase
{
  return (self->_lastDeliveredPhase & 0xFFFFFFFFFFFFFFFELL) == 4;
}

- (void)_removeGestureRecognizersSendingCancelledEvent:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  unint64_t phase;
  _BYTE *v11;
  _UIScrollEventAsyncDeliveryTarget *asyncDeliveryTarget;
  _BYTE *v13;
  _UIScrollEventAsyncDeliveryTarget *v14;
  UIGestureRecognizer *asyncDeliveryGesture;
  id v16;
  _QWORD v17[5];
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v20;
    v16 = v4;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        if (v9 && (*(_QWORD *)(v9 + 8) & 0x200000000) != 0)
        {
          phase = self->_phase;
          self->_phase = 5;
          -[UIScrollEvent _sendEventToGestureRecognizer:](self, "_sendEventToGestureRecognizer:", v9);
          self->_phase = phase;
        }
        if ((UIGestureRecognizer *)v9 == self->_asyncDeliveryGesture
          && !self->_isCloneForAsyncDelivery
          && !-[UIScrollEvent _hasDeliveredTerminalPhase](self, "_hasDeliveredTerminalPhase"))
        {
          if (-[NSMutableSet count](self->_outstandingSnapshotEventsForAsyncDelivery, "count"))
            -[NSMutableSet removeAllObjects](self->_outstandingSnapshotEventsForAsyncDelivery, "removeAllObjects");
          if (self->_asyncDeliveryTarget)
          {
            v11 = -[UIScrollEvent _cloneEvent](self, "_cloneEvent");
            v11[185] = 1;
            *((_QWORD *)v11 + 28) = 5;
            asyncDeliveryTarget = self->_asyncDeliveryTarget;
            v17[0] = MEMORY[0x1E0C809B0];
            v17[1] = 3221225472;
            v17[2] = __64__UIScrollEvent__removeGestureRecognizersSendingCancelledEvent___block_invoke;
            v17[3] = &unk_1E16B2218;
            v17[4] = self;
            v18 = v11;
            v13 = v11;
            -[_UIScrollEventAsyncDeliveryTarget _asynchronouslyDeliverScrollEvent:completion:](asyncDeliveryTarget, "_asynchronouslyDeliverScrollEvent:completion:", v13, v17);
            v14 = self->_asyncDeliveryTarget;
            self->_asyncDeliveryTarget = 0;

            asyncDeliveryGesture = self->_asyncDeliveryGesture;
            self->_asyncDeliveryGesture = 0;

            v4 = v16;
          }
        }
        -[UIScrollEvent _removeGestureRecognizer:fromComponents:](self, "_removeGestureRecognizer:fromComponents:", v9, 0);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v6);
  }

}

void __64__UIScrollEvent__removeGestureRecognizersSendingCancelledEvent___block_invoke()
{
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
}

- (id)_allWindows
{
  void *v2;
  void *v3;

  -[UIScrollEvent _windowServerHitTestWindow](self, "_windowServerHitTestWindow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)_windowServerHitTestWindow
{
  -[UIEvent _hidEvent](self, "_hidEvent");
  return _UIEventHIDUIWindowForHIDEvent();
}

- (unint64_t)phase
{
  return self->_phase;
}

- (CGVector)_stifledDelta
{
  double dx;
  double dy;
  CGVector result;

  dx = self->_stifledDelta.dx;
  dy = self->_stifledDelta.dy;
  result.dy = dy;
  result.dx = dx;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outstandingSnapshotEventsForAsyncDelivery, 0);
  objc_storeStrong((id *)&self->_asyncDeliveryGesture, 0);
  objc_storeStrong((id *)&self->_asyncDeliveryTarget, 0);
  objc_storeStrong((id *)&self->_pointerAttributes, 0);
  objc_storeStrong((id *)&self->_gestureRecognizersByWindow, 0);
}

@end
