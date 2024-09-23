@implementation UITouch

- (CGPoint)locationInView:(UIView *)view
{
  UIView *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGPoint result;

  v4 = view;
  -[UITouch window](self, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = _UITouchConvertLocationInWindowToView((uint64_t)v5, v4, self->_locationInWindow.x, self->_locationInWindow.y);
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.y = v10;
  result.x = v9;
  return result;
}

- (UIWindow)window
{
  return self->_window;
}

- (UITouchPhase)phase
{
  return self->_phase;
}

- (UITouchType)type
{
  return self->_type;
}

- (_UIGestureRecognizerContainer)_responder
{
  return self->_responder;
}

- (void)_addGestureRecognizer:(uint64_t)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  char v7;
  id v8;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 96);
    v8 = v3;
    if (!v4)
    {
      v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0);
      v6 = *(void **)(a1 + 96);
      *(_QWORD *)(a1 + 96) = v5;

      v4 = *(void **)(a1 + 96);
    }
    v7 = objc_msgSend(v4, "containsObject:", v8);
    v3 = v8;
    if ((v7 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 96), "addObject:", v8);
      v3 = v8;
    }
  }

}

- (void)_removeGestureRecognizer:(uint64_t)a1
{
  id v3;
  int v4;
  id v5;

  v3 = a2;
  if (a1)
  {
    v5 = v3;
    v4 = objc_msgSend(*(id *)(a1 + 96), "containsObject:", v3);
    v3 = v5;
    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 96), "removeObject:", v5);
      v3 = v5;
    }
  }

}

- (id)warpedIntoView
{
  if (a1)
    a1 = (id *)a1[11];
  return a1;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (void)_setRollAngle:(double)a3 resetPrevious:
{
  double v4;
  unint64_t v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  double v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v4 = a3;
    if ((a2 & 1) == 0)
      a3 = *(double *)(a1 + 248);
    *(double *)(a1 + 256) = a3;
    v6 = _setRollAngle_resetPrevious____s_category;
    if (!_setRollAngle_resetPrevious____s_category)
    {
      v6 = __UILogCategoryGetNode("Touch", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v6, (unint64_t *)&_setRollAngle_resetPrevious____s_category);
    }
    if ((*(_BYTE *)v6 & 1) != 0)
    {
      v7 = *(NSObject **)(v6 + 8);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v8 = 134218496;
        v9 = a1;
        v10 = 2048;
        v11 = v4;
        v12 = 1024;
        v13 = a2;
        _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_ERROR, "%p Set roll angle: %7.4f, resetPrevious: %d", (uint8_t *)&v8, 0x1Cu);
      }
    }
    *(double *)(a1 + 248) = v4;
  }
}

- (void)_setIsFirstTouchForView:(BOOL)a3
{
  *(_WORD *)&self->_touchFlags = *(_WORD *)&self->_touchFlags & 0xFFFE | a3;
}

- (void)_setIsPointerTouch:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_touchFlags = *(_WORD *)&self->_touchFlags & 0xFDFF | v3;
}

- (void)setInitialTouchTimestamp:(double)a3
{
  self->_initialTouchTimestamp = a3;
}

- (void)_setWindowServerHitTestWindow:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 360), a2);
}

- (void)setTapCount:(unint64_t)a3
{
  self->_tapCount = a3;
}

- (unsigned)_touchIdentifier
{
  return self->_touchIdentifier;
}

- (NSTimeInterval)timestamp
{
  return self->_timestamp;
}

- (int64_t)_edgeType
{
  return self->_edgeType;
}

- (CGPoint)_locationInSceneReferenceSpace
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGPoint result;

  -[UITouch window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[UITouch window](self, "window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITouch window](self, "window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_convertPointToSceneReferenceSpace:", -[UITouch _locationInWindow:]((double *)self, v5));
    v7 = v6;
    v9 = v8;

  }
  else
  {
    v7 = -[UITouch _locationInWindow:]((double *)self, 0);
    v9 = v10;
  }

  v11 = v7;
  v12 = v9;
  result.y = v12;
  result.x = v11;
  return result;
}

- (double)_locationInWindow:(double *)a1
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;

  v3 = a2;
  if (a1)
  {
    objc_msgSend(a1, "window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(a1, "window");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "convertPoint:toWindow:", v3, a1[14], a1[15]);
      v7 = v6;

    }
    else
    {
      v7 = a1[14];
      if (v3)
      {
        objc_msgSend(v3, "convertPoint:fromWindow:", 0, a1[14], a1[15]);
        v7 = v8;
      }
    }
  }
  else
  {
    v7 = 0.0;
  }

  return v7;
}

- (BOOL)_edgeForceActive
{
  __IOHIDEvent *hidEvent;

  hidEvent = self->_hidEvent;
  if (hidEvent)
    return ((unint64_t)IOHIDEventGetIntegerValue() >> 15) & 1;
  return (char)hidEvent;
}

- (unint64_t)_edgeAim
{
  return self->_edgeAim;
}

- (uint64_t)_supportsForce
{
  _BOOL8 v2;
  void *v3;

  if (!a1)
    return 0;
  if ((objc_msgSend(a1, "_isPointerTouch") & 1) != 0 || a1[43] == 2)
    return 1;
  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "_supportsForceTouch"))
    v2 = _AXSForceTouchEnabled() != 0;
  else
    v2 = 0;

  return v2;
}

- (BOOL)_isPointerTouch
{
  return (*(_WORD *)&self->_touchFlags >> 9) & 1;
}

- (void)setWindow:(id)a3
{
  UIWindow *v5;
  UIWindow *window;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat *p_y;
  double y;
  CGPoint *p_precisePreviousLocationInWindow;
  double x;
  UIWindow *v17;
  UIWindow *v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  uint64_t v26;
  BOOL v27;
  UIWindow *v28;

  v5 = (UIWindow *)a3;
  window = self->_window;
  if (window == v5)
    goto LABEL_9;
  v28 = v5;
  if (window)
  {
    -[UIWindow convertPoint:toWindow:](window, "convertPoint:toWindow:", v5, self->_locationInWindow.x, self->_locationInWindow.y);
    self->_locationInWindow.x = v7;
    self->_locationInWindow.y = v8;
    -[UIWindow convertPoint:toWindow:](self->_window, "convertPoint:toWindow:", v28, self->_previousLocationInWindow.x, self->_previousLocationInWindow.y);
    self->_previousLocationInWindow.x = v9;
    self->_previousLocationInWindow.y = v10;
    -[UIWindow convertPoint:toWindow:](self->_window, "convertPoint:toWindow:", v28, self->_preciseLocationInWindow.x, self->_preciseLocationInWindow.y);
    self->_preciseLocationInWindow.x = v11;
    self->_preciseLocationInWindow.y = v12;
    p_y = &self->_precisePreviousLocationInWindow.y;
    y = self->_precisePreviousLocationInWindow.y;
    p_precisePreviousLocationInWindow = &self->_precisePreviousLocationInWindow;
    x = self->_precisePreviousLocationInWindow.x;
    v17 = self->_window;
    v18 = v28;
  }
  else
  {
    if (!v5)
      goto LABEL_7;
    -[UIWindow convertPoint:fromWindow:](v5, "convertPoint:fromWindow:", 0, self->_locationInWindow.x, self->_locationInWindow.y);
    self->_locationInWindow.x = v19;
    self->_locationInWindow.y = v20;
    -[UIWindow convertPoint:fromWindow:](v28, "convertPoint:fromWindow:", 0, self->_previousLocationInWindow.x, self->_previousLocationInWindow.y);
    self->_previousLocationInWindow.x = v21;
    self->_previousLocationInWindow.y = v22;
    -[UIWindow convertPoint:toWindow:](v28, "convertPoint:toWindow:", 0, self->_preciseLocationInWindow.x, self->_preciseLocationInWindow.y);
    self->_preciseLocationInWindow.x = v23;
    self->_preciseLocationInWindow.y = v24;
    p_y = &self->_precisePreviousLocationInWindow.y;
    y = self->_precisePreviousLocationInWindow.y;
    p_precisePreviousLocationInWindow = &self->_precisePreviousLocationInWindow;
    x = self->_precisePreviousLocationInWindow.x;
    v17 = v28;
    v18 = 0;
  }
  -[UIWindow convertPoint:toWindow:](v17, "convertPoint:toWindow:", v18, x, y);
  p_precisePreviousLocationInWindow->x = v25;
  *(_QWORD *)p_y = v26;
LABEL_7:
  objc_storeStrong((id *)&self->_window, a3);
  -[UITouch _computeAzimuthAngleInWindow]((uint64_t)self);
  v27 = -[UITouch isDelayed](self, "isDelayed");
  v5 = v28;
  if (!v27)
    *(_WORD *)&self->_touchFlags &= ~0x20u;
LABEL_9:

}

- (BOOL)isDelayed
{
  return (*(_WORD *)&self->_touchFlags >> 2) & 1;
}

- (void)_computeAzimuthAngleInWindow
{
  double v2;
  id v3;

  if (a1)
  {
    if (*(_QWORD *)(a1 + 344) == 2)
    {
      v2 = *(double *)(a1 + 368);
      objc_msgSend((id)a1, "window");
      v3 = (id)objc_claimAutoreleasedReturnValue();
      *(double *)(a1 + 376) = _UITouchConvertCADisplayAzimuthAngleToWindow(v3, v2);

    }
    else
    {
      *(_QWORD *)(a1 + 376) = 0;
    }
  }
}

- (void)_updatePredictionsWithEvent:(_QWORD *)a1
{
  id v3;
  unint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint8_t v8[16];

  v3 = a2;
  if (a1 && a1[30])
  {
    if ((objc_msgSend(a1, "type") & 0xFFFFFFFFFFFFFFFDLL) != 0)
    {
      v4 = _updatePredictionsWithEvent____s_category;
      if (!_updatePredictionsWithEvent____s_category)
      {
        v4 = __UILogCategoryGetNode("Touch", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v4, (unint64_t *)&_updatePredictionsWithEvent____s_category);
      }
      if ((*(_BYTE *)v4 & 1) != 0)
      {
        v7 = *(NSObject **)(v4 + 8);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v8 = 0;
          _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_ERROR, "Clearing touch predictor during update", v8, 2u);
        }
      }
      v5 = (void *)a1[30];
      a1[30] = 0;

    }
    else
    {
      objc_msgSend(v3, "coalescedTouchesForTouch:", a1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITouch _updatePredictionsWithCoalescedTouches:]((uint64_t)a1, v6);

    }
  }

}

- (void)_willBeDispatchedAsEnded
{
  void *v2;

  if (a1 && (*(_WORD *)(a1 + 236) & 0x100) == 0)
  {
    if (*(double *)(a1 + 224) > 0.0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        +[_UIStatistics maxForce](_UIStatistics, "maxForce");
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "recordDistributionValue:", *(double *)(a1 + 224));

      }
    }
    *(_WORD *)(a1 + 236) |= 0x100u;
  }
}

- (id)_mutableForwardingRecord
{
  NSMutableArray *forwardingRecord;
  NSMutableArray *v4;
  NSMutableArray *v5;

  forwardingRecord = self->_forwardingRecord;
  if (!forwardingRecord)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v5 = self->_forwardingRecord;
    self->_forwardingRecord = v4;

    forwardingRecord = self->_forwardingRecord;
  }
  return forwardingRecord;
}

- (BOOL)_isAbandoningForwardingRecord
{
  return (*(_WORD *)&self->_touchFlags >> 4) & 1;
}

- (int64_t)_pathIndex
{
  return self->_pathIndex;
}

- (id)_clone
{
  UITouch *v3;

  v3 = objc_alloc_init(UITouch);
  -[UITouch _clonePropertiesToTouch:](self, "_clonePropertiesToTouch:", v3);
  return v3;
}

- (void)_clonePropertiesToTouch:(id)a3
{
  id *v4;
  UIWindow *window;
  _UIGestureRecognizerContainer *responder;
  UIView *warpedIntoView;
  uint64_t v8;
  void *v9;
  char *v10;
  UIWindow *windowServerHitTestWindow;
  int v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  unsigned int v19;
  unsigned int v20;
  unsigned int v21;
  unsigned int v22;
  char *v23;

  v23 = (char *)a3;
  *((_DWORD *)v23 + 14) = self->_touchIdentifier;
  *((_QWORD *)v23 + 34) = *(_QWORD *)&self->_timestamp;
  *((_QWORD *)v23 + 50) = *(_QWORD *)&self->_initialTouchTimestamp;
  *((_QWORD *)v23 + 2) = self->_phase;
  *((_QWORD *)v23 + 3) = self->_tapCount;
  *((_QWORD *)v23 + 4) = self->_edgeType;
  *((_QWORD *)v23 + 5) = self->_edgeAim;
  *((_QWORD *)v23 + 6) = self->_precision;
  *((_QWORD *)v23 + 43) = self->_type;
  objc_storeStrong((id *)v23 + 42, self->_touchAuthenticationRecord);
  v4 = (id *)v23;
  window = self->_window;
  if (*((UIWindow **)v23 + 8) != window)
  {
    objc_storeStrong((id *)v23 + 8, window);
    v4 = (id *)v23;
  }
  responder = self->_responder;
  if (v4[9] != responder)
  {
    objc_storeStrong(v4 + 9, responder);
    objc_storeStrong((id *)v23 + 10, self->_cachedResponderView);
    v4 = (id *)v23;
  }
  warpedIntoView = self->_warpedIntoView;
  if (v4[11] != warpedIntoView)
  {
    objc_storeStrong(v4 + 11, warpedIntoView);
    v4 = (id *)v23;
  }
  if ((objc_msgSend(v4[12], "isEqualToArray:", self->_gestureRecognizers) & 1) == 0)
  {
    v8 = -[NSMutableArray mutableCopy](self->_gestureRecognizers, "mutableCopy");
    v9 = (void *)*((_QWORD *)v23 + 12);
    *((_QWORD *)v23 + 12) = v8;

  }
  v10 = v23;
  windowServerHitTestWindow = self->__windowServerHitTestWindow;
  if (*((UIWindow **)v23 + 45) != windowServerHitTestWindow)
  {
    objc_storeStrong((id *)v23 + 45, windowServerHitTestWindow);
    v10 = v23;
  }
  *((_OWORD *)v10 + 7) = self->_locationInWindow;
  *((_OWORD *)v10 + 9) = self->_preciseLocationInWindow;
  *((_QWORD *)v10 + 27) = *(_QWORD *)&self->_pressure;
  *((_QWORD *)v10 + 28) = *(_QWORD *)&self->_maxObservedPressure;
  *((_DWORD *)v10 + 58) = LODWORD(self->_zGradient);
  *(CGSize *)(v10 + 408) = self->_displacement;
  *((_OWORD *)v10 + 8) = self->_previousLocationInWindow;
  *((_OWORD *)v10 + 10) = self->_precisePreviousLocationInWindow;
  *((_QWORD *)v10 + 22) = *(_QWORD *)&self->_previousPressure;
  *((_QWORD *)v10 + 36) = *(_QWORD *)&self->_maximumPossiblePressure;
  *((_QWORD *)v10 + 23) = self->_pathIndex;
  v10[192] = self->_pathIdentity;
  *((_QWORD *)v10 + 25) = *(_QWORD *)&self->_pathMajorRadius;
  *((_QWORD *)v10 + 26) = *(_QWORD *)&self->_majorRadiusTolerance;
  v12 = *((_WORD *)v10 + 118) & 0xFFFE | *(_WORD *)&self->_touchFlags & 1;
  *((_WORD *)v10 + 118) = *((_WORD *)v10 + 118) & 0xFFFE | *(_WORD *)&self->_touchFlags & 1;
  v13 = v12 & 0xFFFFFFFD | (2 * ((*(_WORD *)&self->_touchFlags >> 1) & 1));
  *((_WORD *)v10 + 118) = v13;
  v14 = v13 & 0xFFFFFFFB | (4 * ((*(_WORD *)&self->_touchFlags >> 2) & 1));
  *((_WORD *)v10 + 118) = v14;
  v15 = v14 & 0xFFFFFFF7 | (8 * ((*(_WORD *)&self->_touchFlags >> 3) & 1));
  *((_WORD *)v10 + 118) = v15;
  v16 = v15 & 0xFFFFFFEF | (16 * ((*(_WORD *)&self->_touchFlags >> 4) & 1));
  *((_WORD *)v10 + 118) = v16;
  v17 = v16 & 0xFFFFFFDF | (32 * ((*(_WORD *)&self->_touchFlags >> 5) & 1));
  *((_WORD *)v10 + 118) = v17;
  v18 = v17 & 0xFFFFFFBF | (((*(_WORD *)&self->_touchFlags >> 6) & 1) << 6);
  *((_WORD *)v10 + 118) = v18;
  v19 = v18 & 0xFFFFFDFF | (((*(_WORD *)&self->_touchFlags >> 9) & 1) << 9);
  *((_WORD *)v10 + 118) = v19;
  v20 = v19 & 0xFFFFF7FF | (((*(_WORD *)&self->_touchFlags >> 11) & 1) << 11);
  *((_WORD *)v10 + 118) = v20;
  v21 = v20 & 0xFFFFEFFF | (((*(_WORD *)&self->_touchFlags >> 12) & 1) << 12);
  *((_WORD *)v10 + 118) = v21;
  v22 = v21 & 0xFFFFDFFF | (((*(_WORD *)&self->_touchFlags >> 13) & 1) << 13);
  *((_WORD *)v10 + 118) = v22;
  *((_WORD *)v10 + 118) = v22 & 0xBFFF | *(_WORD *)&self->_touchFlags & 0x4000;
  *((_QWORD *)v10 + 46) = *(_QWORD *)&self->_azimuthAngleInCADisplay;
  *((_QWORD *)v10 + 47) = *(_QWORD *)&self->_azimuthAngleInWindow;
  *((_QWORD *)v10 + 39) = *(_QWORD *)&self->_altitudeAngle;
  *((_QWORD *)v10 + 31) = *(_QWORD *)&self->_rollAngle;
  *((_QWORD *)v10 + 32) = *(_QWORD *)&self->_previousRollAngle;
  v10[268] = self->_needsRollUpdate;
  v10[269] = self->_hasRollUpdate;
  *((_QWORD *)v10 + 35) = self->_updateCorrelationToken;
  v10[265] = self->_needsForceUpdate;
  v10[266] = self->_hasForceUpdate;
  *((_QWORD *)v10 + 37) = self->_senderID;
  *((_QWORD *)v10 + 40) = self->_pointerSenderID;
  *((_QWORD *)v10 + 41) = self->_pointerSource;
  v10[267] = self->_forceStage;
  objc_msgSend(v10, "_setHidEvent:", self->_hidEvent);
  *((double *)v23 + 1) = (*((double *)v23 + 14) - *((double *)v23 + 16))
                       * (*((double *)v23 + 14) - *((double *)v23 + 16))
                       + (*((double *)v23 + 15) - *((double *)v23 + 17))
                       * (*((double *)v23 + 15) - *((double *)v23 + 17));

}

- (__IOHIDEvent)_hidEvent
{
  return self->_hidEvent;
}

- (void)setPhase:(int64_t)a3
{
  unint64_t v5;
  unint64_t v6;
  _UITouchPredictor *touchPredictor;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  UITouch *v14;
  int v15;
  UITouch *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = _MergedGlobals_1196;
  if (!_MergedGlobals_1196)
  {
    v5 = __UILogCategoryGetNode("Touch", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v5, (unint64_t *)&_MergedGlobals_1196);
  }
  if ((*(_BYTE *)v5 & 1) != 0)
  {
    v8 = *(NSObject **)(v5 + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = v8;
      -[UITouch _phaseDescription](self, "_phaseDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      _PhaseDescription(a3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 134218498;
      v16 = self;
      v17 = 2112;
      v18 = v10;
      v19 = 2112;
      v20 = v11;
      _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_ERROR, "%p Setting touch phase from %@ to %@", (uint8_t *)&v15, 0x20u);

    }
  }
  self->_phase = a3;
  if ((unint64_t)(a3 - 3) <= 1 && self->_touchPredictor)
  {
    v6 = qword_1ECD7FA08;
    if (!qword_1ECD7FA08)
    {
      v6 = __UILogCategoryGetNode("Touch", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v6, (unint64_t *)&qword_1ECD7FA08);
    }
    if ((*(_BYTE *)v6 & 1) != 0)
    {
      v12 = *(NSObject **)(v6 + 8);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = v12;
        _PhaseDescription(a3);
        v14 = (UITouch *)objc_claimAutoreleasedReturnValue();
        v15 = 138412290;
        v16 = v14;
        _os_log_impl(&dword_185066000, v13, OS_LOG_TYPE_ERROR, "Clearing touch predictor for: %@", (uint8_t *)&v15, 0xCu);

      }
    }
    touchPredictor = self->_touchPredictor;
    self->_touchPredictor = 0;

  }
  -[_UITouchPhaseChangeDelegate _touchPhaseChangedForTouch:](self->__phaseChangeDelegate, "_touchPhaseChangedForTouch:", self);
}

- (NSArray)gestureRecognizers
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_gestureRecognizers, "copy");
}

- (void)_setResponder:(id)a3
{
  _UIGestureRecognizerContainer *v5;
  UIView *cachedResponderView;
  BOOL v7;
  _UIGestureRecognizerContainer *v8;

  v5 = (_UIGestureRecognizerContainer *)a3;
  if (self->_responder != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_responder, a3);
    cachedResponderView = self->_cachedResponderView;
    self->_cachedResponderView = 0;

    v7 = -[UITouch isDelayed](self, "isDelayed");
    v5 = v8;
    if (!v7)
      *(_WORD *)&self->_touchFlags &= ~0x20u;
  }

}

- (unint64_t)_senderID
{
  return self->_senderID;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  unint64_t type;
  const __CFString *v13;
  unint64_t tapCount;
  uint64_t v15;
  void *v16;
  objc_super v18;
  CGPoint v19;
  CGPoint v20;

  -[UITouch _phaseDescription](self, "_phaseDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (_IsKindOfUIView((uint64_t)self->_responder))
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    NSStringFromCGPoint(self->_locationInWindow);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromCGPoint(self->_previousLocationInWindow);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITouch locationInView:](self, "locationInView:", self->_responder);
    NSStringFromCGPoint(v19);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITouch previousLocationInView:](self, "previousLocationInView:", self->_responder);
    NSStringFromCGPoint(v20);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("location in window: %@ previous location in window: %@ location in view: %@ previous location in view: %@"), v5, v6, v7, v8);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = &stru_1E16EDF20;
  }
  v10 = (void *)MEMORY[0x1E0CB3940];
  v18.receiver = self;
  v18.super_class = (Class)UITouch;
  -[UITouch description](&v18, sel_description);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  type = self->_type;
  if (type > 3)
    v13 = CFSTR("Unknown");
  else
    v13 = off_1E16DF288[type];
  tapCount = self->_tapCount;
  -[UITouch force](self, "force");
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%@ type: %@ phase: %@ tap count: %lu force: %0.3f window: %@ responder: %@ %@"), v11, v13, v3, tapCount, v15, self->_window, self->_responder, v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v16;
}

- (CGPoint)previousLocationInView:(UIView *)view
{
  UIView *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGPoint result;

  v4 = view;
  -[UITouch window](self, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = _UITouchConvertLocationInWindowToView((uint64_t)v5, v4, self->_previousLocationInWindow.x, self->_previousLocationInWindow.y);
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.y = v10;
  result.x = v9;
  return result;
}

- (id)_phaseDescription
{
  return _PhaseDescription(self->_phase);
}

- (CGFloat)force
{
  double v3;
  CGFloat result;

  v3 = -[UITouch _unclampedForce](self);
  -[UITouch maximumPossibleForce](self, "maximumPossibleForce");
  if (v3 < result)
    return v3;
  return result;
}

- (CGFloat)maximumPossibleForce
{
  int v3;
  CGFloat result;
  double maximumPossiblePressure;
  int64_t type;
  _BOOL4 v7;
  uint64_t v8;
  double v9;

  v3 = -[UITouch _supportsForce](self);
  result = 0.0;
  if (v3)
  {
    if (self)
    {
      maximumPossiblePressure = self->_maximumPossiblePressure;
      type = self->_type;
      v7 = -[UITouch _isPointerTouch](self, "_isPointerTouch", 0.0);
      v8 = 3;
      if (!v7)
        v8 = type;
      v9 = 60.0;
      if (v8 == 2)
        v9 = 120.0;
      if (v8 == 3)
        v9 = 115.0;
      return maximumPossiblePressure / v9;
    }
    else
    {
      return NAN;
    }
  }
  return result;
}

- (double)_unclampedForce
{
  double v1;
  double v3;
  double v4;
  float v5;
  double v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  double v10;
  double v11;

  v1 = 0.0;
  if (a1 && -[UITouch _supportsForce](a1))
  {
    objc_msgSend(a1, "_pressure");
    v4 = v3;
    _AXSForceTouchSensitivity();
    v6 = v5;
    v7 = a1[43];
    v8 = objc_msgSend(a1, "_isPointerTouch");
    v9 = 3;
    if (!v8)
      v9 = v7;
    v10 = 60.0;
    if (v9 == 2)
      v10 = 120.0;
    if (v9 == 3)
      v10 = 115.0;
    v11 = v4 / (v10 * v6);
    if (v11 >= 0.0)
      return v11;
    else
      return 0.0;
  }
  return v1;
}

- (void)_setHidEvent:(__IOHIDEvent *)a3
{
  __IOHIDEvent *hidEvent;

  hidEvent = self->_hidEvent;
  if (hidEvent != a3)
  {
    if (hidEvent)
      CFRelease(hidEvent);
    self->_hidEvent = a3;
    if (a3)
      CFRetain(a3);
  }
}

- (void)_setHitTestSecurityAnalysis:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 392), a2);
}

- (void)_setZGradient:(float)a3
{
  self->_zGradient = a3;
}

- (void)_setType:(int64_t)a3
{
  self->_type = a3;
}

- (void)_setSenderID:(unint64_t)a3
{
  self->_senderID = a3;
}

- (void)_setPathIndex:(int64_t)a3
{
  self->_pathIndex = a3;
}

- (void)_setPathIdentity:(unsigned __int8)a3
{
  self->_pathIdentity = a3;
}

- (void)_setEdgeType:(int64_t)a3
{
  self->_edgeType = a3;
}

- (void)_setEdgeAim:(unint64_t)a3
{
  self->_edgeAim = a3;
}

- (void)_updateWithChildEvent:(uint64_t)a1
{
  double v2;
  uint64_t v3;

  if (a1)
  {
    IOHIDEventGetFloatValue();
    -[UITouch _setAltitudeAngle:](a1, 1.57079633 - v2);
    IOHIDEventGetFloatValue();
    *(_QWORD *)(a1 + 368) = v3;
    -[UITouch _computeAzimuthAngleInWindow](a1);
  }
}

- (void)_setAltitudeAngle:(uint64_t)a1
{
  unint64_t v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  double v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v4 = _setAltitudeAngle____s_category;
    if (!_setAltitudeAngle____s_category)
    {
      v4 = __UILogCategoryGetNode("Touch", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v4, (unint64_t *)&_setAltitudeAngle____s_category);
    }
    if ((*(_BYTE *)v4 & 1) != 0)
    {
      v5 = *(NSObject **)(v4 + 8);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v6 = 134218240;
        v7 = a1;
        v8 = 2048;
        v9 = a2;
        _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_ERROR, "%p Set altitude angle: %7.4f", (uint8_t *)&v6, 0x16u);
      }
    }
    *(double *)(a1 + 312) = a2;
  }
}

- (CGPoint)preciseLocationInView:(UIView *)view
{
  UIView *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGPoint result;

  v4 = view;
  -[UITouch window](self, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = _UITouchConvertLocationInWindowToView((uint64_t)v5, v4, self->_preciseLocationInWindow.x, self->_preciseLocationInWindow.y);
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.y = v10;
  result.x = v9;
  return result;
}

- (double)_pressure
{
  return self->_pressure;
}

- (CGFloat)majorRadius
{
  return self->_pathMajorRadius;
}

- (UIView)view
{
  _UIGestureRecognizerContainer *responder;
  UIView *cachedResponderView;
  UIView *v5;
  UIView *v6;
  uint64_t v7;
  UIView *v8;
  UIView *v9;

  responder = self->_responder;
  if (responder)
  {
    cachedResponderView = self->_cachedResponderView;
    if (cachedResponderView)
    {
      v5 = cachedResponderView;
    }
    else
    {
      v6 = responder;
      do
      {
        if ((_IsKindOfUIView((uint64_t)v6) & 1) != 0)
          break;
        -[UIView nextResponder](v6, "nextResponder");
        v7 = objc_claimAutoreleasedReturnValue();

        v6 = (UIView *)v7;
      }
      while (v7);
      v8 = self->_cachedResponderView;
      self->_cachedResponderView = v6;
      v9 = v6;

      v5 = self->_cachedResponderView;
    }
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)_gestureRecognizers
{
  return self->_gestureRecognizers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__hitTestSecurityAnalysis, 0);
  objc_storeStrong((id *)&self->__authenticationMessage, 0);
  objc_storeStrong((id *)&self->__windowServerHitTestWindow, 0);
  objc_storeStrong((id *)&self->__phaseChangeDelegate, 0);
  objc_storeStrong((id *)&self->_touchAuthenticationRecord, 0);
  objc_storeStrong((id *)&self->_touchPredictor, 0);
  objc_storeStrong((id *)&self->_forwardingRecord, 0);
  objc_storeStrong((id *)&self->_gestureRecognizers, 0);
  objc_storeStrong((id *)&self->_warpedIntoView, 0);
  objc_storeStrong((id *)&self->_cachedResponderView, 0);
  objc_storeStrong((id *)&self->_responder, 0);
  objc_storeStrong((id *)&self->_window, 0);
}

- (void)dealloc
{
  __IOHIDEvent *hidEvent;
  objc_super v4;

  hidEvent = self->_hidEvent;
  if (hidEvent)
    CFRelease(hidEvent);
  v4.receiver = self;
  v4.super_class = (Class)UITouch;
  -[UITouch dealloc](&v4, sel_dealloc);
}

- (void)_loadStateFromTouch:(id)a3
{
  _UIGestureRecognizerContainer *v5;
  _UIGestureRecognizerContainer *responder;
  id v7;

  self->_touchIdentifier = *((_DWORD *)a3 + 14);
  self->_timestamp = *((double *)a3 + 34);
  self->_phase = *((_QWORD *)a3 + 2);
  self->_tapCount = *((_QWORD *)a3 + 3);
  v5 = (_UIGestureRecognizerContainer *)*((id *)a3 + 9);
  responder = self->_responder;
  self->_responder = v5;
  v7 = a3;

  objc_storeStrong((id *)&self->_cachedResponderView, *((id *)v7 + 10));
  objc_storeStrong((id *)&self->_window, *((id *)v7 + 8));
  self->_locationInWindow = (CGPoint)*((_OWORD *)v7 + 7);
  self->_previousLocationInWindow = (CGPoint)*((_OWORD *)v7 + 8);
  self->_preciseLocationInWindow = (CGPoint)*((_OWORD *)v7 + 9);
  self->_precisePreviousLocationInWindow = (CGPoint)*((_OWORD *)v7 + 10);
  LODWORD(responder) = *((_DWORD *)v7 + 59);

  self->_touchFlags = ($AA67F7BCECD28A4E6697E4855137C5D0)responder;
}

- (void)setIsDelayed:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_touchFlags = *(_WORD *)&self->_touchFlags & 0xFFFB | v3;
}

- (void)_setPreviousTouch:(id)a3
{
  self->_previousLocationInWindow = (CGPoint)*((_OWORD *)a3 + 7);
  self->_precisePreviousLocationInWindow = (CGPoint)*((_OWORD *)a3 + 9);
  self->_previousPressure = *((double *)a3 + 27);
  self->_previousRollAngle = *((double *)a3 + 31);
  self->_movementMagnitudeSquared = (self->_locationInWindow.x - self->_previousLocationInWindow.x)
                                  * (self->_locationInWindow.x - self->_previousLocationInWindow.x)
                                  + (self->_locationInWindow.y - self->_previousLocationInWindow.y)
                                  * (self->_locationInWindow.y - self->_previousLocationInWindow.y);
}

- (int64_t)info
{
  return 0;
}

- (NSUInteger)tapCount
{
  return self->_tapCount;
}

- (CGPoint)precisePreviousLocationInView:(UIView *)view
{
  UIView *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGPoint result;

  v4 = view;
  -[UITouch window](self, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = _UITouchConvertLocationInWindowToView((uint64_t)v5, v4, self->_precisePreviousLocationInWindow.x, self->_precisePreviousLocationInWindow.y);
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.y = v10;
  result.x = v9;
  return result;
}

- (CGFloat)azimuthAngleInView:(UIView *)view
{
  UIView *v4;
  double azimuthAngleInWindow;
  void *v6;
  long double v7;
  long double v8;

  v4 = view;
  azimuthAngleInWindow = 0.0;
  if (self->_type == 2)
  {
    -[UITouch window](self, "window");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4 && v6)
    {
      -[UITouch azimuthUnitVectorInView:](self, "azimuthUnitVectorInView:", v4);
      azimuthAngleInWindow = atan2(v8, v7);
    }
    else
    {
      azimuthAngleInWindow = self->_azimuthAngleInWindow;
    }
  }

  return azimuthAngleInWindow;
}

- (CGVector)azimuthUnitVectorInView:(UIView *)view
{
  UIView *v4;
  UIView *v5;
  double v6;
  double v7;
  double azimuthAngleInWindow;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  CGVector result;

  v4 = view;
  v5 = v4;
  v6 = 0.0;
  v7 = 0.0;
  if (self->_type == 2)
  {
    azimuthAngleInWindow = self->_azimuthAngleInWindow;
    -[UIView window](v4, "window");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = v9;
    }
    else
    {
      -[UITouch window](self, "window");
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    v12 = v11;

    -[UITouch window](self, "window");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12 != v13)
      azimuthAngleInWindow = _UITouchConvertCADisplayAzimuthAngleToWindow(v12, self->_azimuthAngleInCADisplay);
    v6 = _UITouchAzimuthUnitVectorInView(v12, v5, azimuthAngleInWindow);
    v7 = v14;

  }
  v15 = v6;
  v16 = v7;
  result.dy = v16;
  result.dx = v15;
  return result;
}

- (CGFloat)altitudeAngle
{
  unint64_t v3;
  NSObject *v5;
  double altitudeAngle;
  int v7;
  UITouch *v8;
  __int16 v9;
  double v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = altitudeAngle___s_category[0];
  if (!altitudeAngle___s_category[0])
  {
    v3 = __UILogCategoryGetNode("Touch", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v3, altitudeAngle___s_category);
  }
  if ((*(_BYTE *)v3 & 1) != 0)
  {
    v5 = *(NSObject **)(v3 + 8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      altitudeAngle = self->_altitudeAngle;
      v7 = 134218240;
      v8 = self;
      v9 = 2048;
      v10 = altitudeAngle;
      _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_ERROR, "%p Altitude angle: %7.4f", (uint8_t *)&v7, 0x16u);
    }
  }
  return self->_altitudeAngle;
}

- (double)_rollAngle
{
  return self->_rollAngle;
}

- (float)_pathMajorRadius
{
  double v2;

  -[UITouch majorRadius](self, "majorRadius");
  return v2;
}

- (NSNumber)estimationUpdateIndex
{
  if (!self->_needsRollUpdate && !self->_hasRollUpdate && !self->_needsForceUpdate && !self->_hasForceUpdate)
    return (NSNumber *)0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", self->_updateCorrelationToken);
  return (NSNumber *)(id)objc_claimAutoreleasedReturnValue();
}

- (UITouchProperties)estimatedProperties
{
  UITouchProperties v2;
  unint64_t IntegerValue;
  _QWORD block[5];

  if ((*(_WORD *)&self->_touchFlags & 0x80) != 0)
    return 15;
  if (self->_needsForceUpdate)
  {
    if (self->_hasForceUpdate)
    {
LABEL_4:
      v2 = 0;
      goto LABEL_8;
    }
  }
  else if (!self->_hasForceUpdate)
  {
    goto LABEL_4;
  }
  v2 = 1;
LABEL_8:
  if (self->_needsRollUpdate)
  {
    if (self->_hasRollUpdate)
      goto LABEL_11;
    goto LABEL_10;
  }
  if (self->_hasRollUpdate)
LABEL_10:
    v2 |= 0x10uLL;
LABEL_11:
  if (self->_hidEvent)
  {
    IntegerValue = IOHIDEventGetIntegerValue();
    return (IntegerValue >> 28) & 2 | (IntegerValue >> 26) & 4 | v2 | (IOHIDEventGetIntegerValue() == 11);
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __30__UITouch_estimatedProperties__block_invoke;
    block[3] = &unk_1E16B1B28;
    block[4] = self;
    if (estimatedProperties_once != -1)
      dispatch_once(&estimatedProperties_once, block);
  }
  return v2;
}

void __30__UITouch_estimatedProperties__block_invoke(uint64_t a1)
{
  unint64_t v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = _UITouchStandardForceAmount_block_invoke___s_category;
  if (!_UITouchStandardForceAmount_block_invoke___s_category)
  {
    v2 = __UILogCategoryGetNode("Warning", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v2, (unint64_t *)&_UITouchStandardForceAmount_block_invoke___s_category);
  }
  v3 = *(NSObject **)(v2 + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = 136315394;
    v6 = "-[UITouch estimatedProperties]_block_invoke";
    v7 = 2112;
    v8 = v4;
    _os_log_impl(&dword_185066000, v3, OS_LOG_TYPE_ERROR, "%s Touch is missing a HID Event: %@", (uint8_t *)&v5, 0x16u);
  }
}

- (UITouchProperties)estimatedPropertiesExpectingUpdates
{
  UITouchProperties result;

  result = self->_needsForceUpdate && !self->_hasForceUpdate;
  if (self->_needsRollUpdate && !self->_hasRollUpdate)
    return result | 0x10;
  return result;
}

- (BOOL)_edgeForcePending
{
  __IOHIDEvent *hidEvent;

  hidEvent = self->_hidEvent;
  if (hidEvent)
    return ((unint64_t)IOHIDEventGetIntegerValue() >> 14) & 1;
  return (char)hidEvent;
}

- (void)_mightBeConsideredForForceSystemGesture
{
  void *v1;
  void *v2;
  uint64_t v3;
  double v4;
  _BOOL4 v5;
  CGRect v6;

  if (result)
  {
    v1 = result;
    if ((objc_msgSend(result, "_edgeForcePending") & 1) != 0
      || (result = (void *)objc_msgSend(v1, "_edgeForceActive"), (_DWORD)result))
    {
      objc_msgSend(*((id *)v1 + 8), "traitCollection");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v2, "forceTouchCapability");

      if (v3 == 2)
      {
        v4 = *((double *)v1 + 14);
        objc_msgSend(*((id *)v1 + 8), "bounds");
        v5 = v4 < CGRectGetMidX(v6);
        return (void *)(v5 ^ (objc_msgSend((id)UIApp, "userInterfaceLayoutDirection") != 0));
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

- (void)_updatePredictionsWithCoalescedTouches:(uint64_t)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (*(_QWORD *)(a1 + 240))
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(a1 + 240), "addTouch:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }
  }

}

- (_QWORD)_predictedTouchesWithEvent:(_QWORD *)a1
{
  id v3;
  void *v5;
  unint64_t v6;
  _UITouchPredictor *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint8_t v11[16];

  v3 = a2;
  if (a1)
  {
    if (objc_msgSend(a1, "phase") == 3
      || objc_msgSend(a1, "phase") == 4
      || (objc_msgSend(a1, "type") & 0xFFFFFFFFFFFFFFFDLL) != 0)
    {
      a1 = (_QWORD *)MEMORY[0x1E0C9AA60];
    }
    else
    {
      v5 = (void *)a1[30];
      if (!v5)
      {
        v6 = _predictedTouchesWithEvent____s_category;
        if (!_predictedTouchesWithEvent____s_category)
        {
          v6 = __UILogCategoryGetNode("Touch", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v6, (unint64_t *)&_predictedTouchesWithEvent____s_category);
        }
        if ((*(_BYTE *)v6 & 1) != 0)
        {
          v10 = *(NSObject **)(v6 + 8);
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v11 = 0;
            _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_ERROR, "Creating touch predictor", v11, 2u);
          }
        }
        v7 = objc_alloc_init(_UITouchPredictor);
        v8 = (void *)a1[30];
        a1[30] = v7;

        objc_msgSend(v3, "coalescedTouchesForTouch:", a1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[UITouch _updatePredictionsWithCoalescedTouches:]((uint64_t)a1, v9);

        v5 = (void *)a1[30];
      }
      objc_msgSend(v5, "predictedTouchesForTouch:", a1);
      a1 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    }
  }

  return a1;
}

- (uint64_t)_effectivelyAuthentic
{
  _QWORD *v1;
  void *v2;
  void *v3;
  uint64_t v4;

  if (result)
  {
    v1 = (_QWORD *)result;
    if (!_os_feature_enabled_impl())
      return 1;
    if (v1[2])
      return 1;
    v2 = (void *)v1[42];
    if (!v2 || (objc_msgSend(v2, "shouldAllowEvents") & 1) != 0)
    {
      return 1;
    }
    else
    {
      objc_msgSend(v1, "view");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v3, "_acceptsInauthenticTouches");

      return v4;
    }
  }
  return result;
}

+ (id)_createTouchesWithGSEvent:(__GSEvent *)a3 phase:(int64_t)a4 view:(id)a5
{
  id v6;
  UITouch *v7;
  void *v8;
  void *v9;

  v6 = a5;
  v7 = objc_alloc_init(UITouch);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithObjects:", v7, 0);
  -[UITouch setPhase:](v7, "setPhase:", a4);
  GSEventGetTimestamp();
  -[UITouch setTimestamp:](v7, "setTimestamp:");
  -[UITouch setTapCount:](v7, "setTapCount:", 1);
  objc_msgSend(v6, "window");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITouch setWindow:](v7, "setWindow:", v9);

  -[UITouch setView:](v7, "setView:", v6);
  GSEventGetLocationInWindow();
  -[UITouch _setLocationInWindow:resetPrevious:](v7, "_setLocationInWindow:resetPrevious:", 1);
  -[UITouch _setIsFirstTouchForView:](v7, "_setIsFirstTouchForView:", 1);

  return v8;
}

- (BOOL)_isFirstTouchForView
{
  return *(_WORD *)&self->_touchFlags & 1;
}

- (void)_setLocationInWindow:(CGPoint)a3 resetPrevious:(BOOL)a4
{
  if (self)
  {
    if (a4)
    {
      self->_previousLocationInWindow = a3;
      self->_precisePreviousLocationInWindow = a3;
    }
    else
    {
      self->_previousLocationInWindow = self->_locationInWindow;
      self->_precisePreviousLocationInWindow = self->_preciseLocationInWindow;
    }
    self->_locationInWindow = a3;
    self->_preciseLocationInWindow = a3;
  }
}

- (uint64_t)_shouldDeliverTouchForTouchesMoved
{
  uint64_t v1;
  __int16 v2;
  __int16 v3;
  void *v4;
  void *v5;
  __int16 v6;

  if (result)
  {
    v1 = result;
    v2 = *(_WORD *)(result + 236);
    if ((v2 & 0x20) == 0)
    {
      if (dyld_program_sdk_at_least())
      {
        v3 = *(_WORD *)(v1 + 236) | 0x40;
      }
      else
      {
        objc_msgSend((id)v1, "view");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          *(_WORD *)(v1 + 236) |= 0x40u;
        }
        else
        {
          objc_msgSend((id)v1, "window");
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v6 = 64;
          else
            v6 = 0;
          *(_WORD *)(v1 + 236) = *(_WORD *)(v1 + 236) & 0xFFBF | v6;

        }
        v3 = *(_WORD *)(v1 + 236);
      }
      v2 = v3 | 0x20;
      *(_WORD *)(v1 + 236) = v2;
    }
    if ((v2 & 0x40) != 0)
      return 1;
    else
      return *(double *)(v1 + 120) != *(double *)(v1 + 136) || *(double *)(v1 + 112) != *(double *)(v1 + 128);
  }
  return result;
}

- (void)_clearGestureRecognizers
{
  -[NSMutableArray removeAllObjects](self->_gestureRecognizers, "removeAllObjects");
}

- (double)_previousLocationInWindow:(double *)a1
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;

  v3 = a2;
  if (a1)
  {
    objc_msgSend(a1, "window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(a1, "window");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "convertPoint:toWindow:", v3, a1[16], a1[17]);
      v7 = v6;

    }
    else
    {
      v7 = a1[16];
      if (v3)
      {
        objc_msgSend(v3, "convertPoint:fromWindow:", 0, a1[16], a1[17]);
        v7 = v8;
      }
    }
  }
  else
  {
    v7 = 0.0;
  }

  return v7;
}

- (CGPoint)_previousLocationInSceneReferenceSpace
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGPoint result;

  -[UITouch window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[UITouch window](self, "window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITouch window](self, "window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_convertPointToSceneReferenceSpace:", -[UITouch _previousLocationInWindow:]((double *)self, v5));
    v7 = v6;
    v9 = v8;

  }
  else
  {
    v7 = -[UITouch _previousLocationInWindow:]((double *)self, 0);
    v9 = v10;
  }

  v11 = v7;
  v12 = v9;
  result.y = v12;
  result.x = v11;
  return result;
}

- (int64_t)_compareIndex:(id)a3
{
  id v4;
  int64_t v5;

  v4 = a3;
  if (objc_msgSend(v4, "_pathIndex") <= self->_pathIndex)
    v5 = objc_msgSend(v4, "_pathIndex") < self->_pathIndex;
  else
    v5 = -1;

  return v5;
}

- (void)_abandonForwardingRecord
{
  NSMutableArray *forwardingRecord;

  *(_WORD *)&self->_touchFlags |= 0x10u;
  forwardingRecord = self->_forwardingRecord;
  self->_forwardingRecord = 0;

}

- (id)_forwardingRecord
{
  return self->_forwardingRecord;
}

- (SEL)_responderSelectorForPhase:(int64_t)a3
{
  SEL result;

  result = 0;
  switch(a3)
  {
    case 0:
      result = sel_touchesBegan_withEvent_;
      break;
    case 1:
      result = sel_touchesMoved_withEvent_;
      break;
    case 3:
      result = sel_touchesEnded_withEvent_;
      break;
    case 4:
      result = sel_touchesCancelled_withEvent_;
      break;
    default:
      return result;
  }
  return result;
}

- (void)setWarpedIntoView:(uint64_t)a1
{
  id v4;
  id *v5;
  id v6;
  id v7;

  v4 = a2;
  if (a1)
  {
    v6 = *(id *)(a1 + 88);
    v5 = (id *)(a1 + 88);
    if (v6 != v4)
    {
      v7 = v4;
      objc_storeStrong(v5, a2);
      v4 = v7;
    }
  }

}

- (uint64_t)_isStationaryRelativeToTouches:(uint64_t)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t i;
  uint64_t v10;
  double v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v14;
      v8 = 0.0;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v4);
          v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
          if (v8 < *(double *)(v10 + 8))
            v8 = *(double *)(v10 + 8);
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v6);
    }
    else
    {
      v8 = 0.0;
    }
    v11 = *(double *)(a1 + 8);
    if (v11 == 0.0)
      a1 = v8 > 2.0;
    else
      a1 = v11 < v8 * 0.1;
  }

  return a1;
}

- (id)_rehitTest
{
  if (a1)
  {
    -[UITouch _rehitTestWithEvent:constrainingToCurrentWindow:]((uint64_t)a1, 0, 0);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (id)_rehitTestWithEvent:(char)a3 constrainingToCurrentWindow:
{
  void *v6;
  id v7;
  id v8;
  double v9;
  void *v10;
  _QWORD v12[5];

  if (!a1)
    return 0;
  v6 = *(void **)(a1 + 64);
  v7 = *(id *)(a1 + 360);
  v8 = a2;
  objc_msgSend((id)a1, "majorRadius");
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __59__UITouch__rehitTestWithEvent_constrainingToCurrentWindow___block_invoke;
  v12[3] = &unk_1E16DF228;
  v12[4] = a1;
  _UIHitTestGestureContainer((uint64_t)v8, v6, (uint64_t)v7, a3, (uint64_t)v12, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __59__UITouch__rehitTestWithEvent_constrainingToCurrentWindow___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "locationInView:", a2);
}

- (void)_clearForWindowIfNeeded:(uint64_t)a1
{
  objc_class *v4;
  const char *Name;
  objc_class *v6;
  const char *v7;
  unint64_t v8;
  NSObject *v9;
  NSObject *v10;
  int v11;
  const char *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v4 = (objc_class *)objc_opt_class();
    Name = class_getName(v4);
    v6 = (objc_class *)objc_opt_class();
    v7 = class_getName(v6);
    v8 = _clearForWindowIfNeeded____s_category;
    if (!_clearForWindowIfNeeded____s_category)
    {
      v8 = __UILogCategoryGetNode("EventEnvironment", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v8, (unint64_t *)&_clearForWindowIfNeeded____s_category);
    }
    v9 = *(NSObject **)(v8 + 8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = v9;
      v11 = 136447234;
      v12 = Name;
      v13 = 2050;
      v14 = a1;
      v15 = 2082;
      v16 = v7;
      v17 = 2050;
      v18 = a2;
      v19 = 1026;
      v20 = objc_msgSend(a2, "_contextId");
      _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_DEFAULT, "Clearing window reference from touch: <%{public}s: %{public}p>; window: <%{public}s: %{public}p>, contextId: 0x%{public}X",
        (uint8_t *)&v11,
        0x30u);

    }
    if (*(void **)(a1 + 64) == a2)
    {
      *(_QWORD *)(a1 + 64) = 0;

    }
    if (*(void **)(a1 + 360) == a2)
    {
      *(_QWORD *)(a1 + 360) = 0;

    }
  }
}

- (void)_clearForReenteringHoverInWindow:(id)a3
{
  UIWindow *v5;
  _UIGestureRecognizerContainer *responder;
  UIView *cachedResponderView;
  UIWindow *windowServerHitTestWindow;
  UIWindow *v9;
  UIView *warpedIntoView;
  NSMutableArray *forwardingRecord;

  v5 = (UIWindow *)a3;
  objc_storeStrong((id *)&self->_window, a3);
  responder = self->_responder;
  self->_responder = 0;

  cachedResponderView = self->_cachedResponderView;
  self->_cachedResponderView = 0;

  windowServerHitTestWindow = self->__windowServerHitTestWindow;
  self->__windowServerHitTestWindow = v5;
  v9 = v5;

  warpedIntoView = self->_warpedIntoView;
  self->_warpedIntoView = 0;

  *(_WORD *)&self->_touchFlags = *(_WORD *)&self->_touchFlags & 0x204 | ((~*(_WORD *)&self->_touchFlags & 5) == 0);
  self->_tapCount = 0;
  forwardingRecord = self->_forwardingRecord;
  self->_forwardingRecord = 0;

  self->_eaten = 0;
}

- (BOOL)_originatesFromPointerEvent
{
  if (-[UITouch _isPointerTouch](self, "_isPointerTouch"))
    return 1;
  if (self)
    return self->_pointerSource != 0;
  return 0;
}

- (BOOL)_isRestingTouch
{
  return (*(_WORD *)&self->_touchFlags >> 11) & 1;
}

- (void)_setIsRestingTouch:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_touchFlags = *(_WORD *)&self->_touchFlags & 0xF7FF | v3;
}

- (BOOL)_isTapToClick
{
  return (*(_WORD *)&self->_touchFlags >> 12) & 1;
}

- (void)_setIsTapToClick:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  *(_WORD *)&self->_touchFlags = *(_WORD *)&self->_touchFlags & 0xEFFF | v3;
}

- (unint64_t)_eventComponentType
{
  return 0;
}

- (_UIEventComponentPhaseValue)_eventComponentPhase
{
  int64_t phase;
  void *v3;
  void *v4;

  phase = self->_phase;
  _eventComponentPhaseMapping_1();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _eventComponentPhaseForUnderlyingValue(phase, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (_UIEventComponentPhaseValue *)v4;
}

- (void)_setEventComponentPhase:(id)a3
{
  self->_phase = objc_msgSend(a3, "underlyingValue");
}

- (id)_eventComponentPhaseForValue:(int64_t)a3
{
  void *v4;
  void *v5;

  _eventComponentPhaseMapping_1();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _eventComponentPhaseForValue(a3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unsigned)_pathIdentity
{
  return self->_pathIdentity;
}

- (CGFloat)majorRadiusTolerance
{
  return self->_majorRadiusTolerance;
}

- (float)_zGradient
{
  return self->_zGradient;
}

- (unint64_t)_pointerSenderID
{
  return self->_pointerSenderID;
}

- (void)_setPointerSenderID:(unint64_t)a3
{
  self->_pointerSenderID = a3;
}

- (unsigned)_forceStage
{
  return self->_forceStage;
}

- (void)_setForceStage:(unsigned __int8)a3
{
  self->_forceStage = a3;
}

- (_UISTouchAuthenticationRecord)_touchAuthenticationRecord
{
  return self->_touchAuthenticationRecord;
}

- (void)_setTouchAuthenticationRecord:(id)a3
{
  objc_storeStrong((id *)&self->_touchAuthenticationRecord, a3);
}

- (void)_setPhaseChangeDelegate:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 352), a2);
}

- (double)initialTouchTimestamp
{
  return self->_initialTouchTimestamp;
}

@end
