@implementation UIHoverGestureRecognizer

- (BOOL)_shouldReceiveEvent:(id)a3
{
  return objc_msgSend(a3, "type") == 11;
}

- (void)setRequiresExclusiveTouchType:(BOOL)a3
{
  unint64_t v4;
  NSObject *v5;
  void *v6;
  UIHoverGestureRecognizer *v7;
  objc_class *v8;
  void *v9;
  __CFString *v10;
  uint8_t buf[4];
  __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v4 = setRequiresExclusiveTouchType____s_category;
    if (!setRequiresExclusiveTouchType____s_category)
    {
      v4 = __UILogCategoryGetNode("Hover", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v4, (unint64_t *)&setRequiresExclusiveTouchType____s_category);
    }
    v5 = *(id *)(v4 + 8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      if (self)
      {
        v6 = (void *)MEMORY[0x1E0CB3940];
        v7 = self;
        v8 = (objc_class *)objc_opt_class();
        NSStringFromClass(v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "stringWithFormat:", CFSTR("<%@: %p>"), v9, v7);
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v10 = CFSTR("(nil)");
      }
      *(_DWORD *)buf = 138412290;
      v12 = v10;
      _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_ERROR, "requiresExclusiveTouchType was called on the UIHoverGestureRecognizer %@ with an unsupported value of false. UIHoverGestureRecognizer currently does not support non-exclusive touch types. This value will be ignored.", buf, 0xCu);

    }
  }
}

- (void)_setPausesWhilePanning:(BOOL)a3
{
  self->_pausesWhilePanning = a3;
}

- (UIHoverGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  UIHoverGestureRecognizer *v4;
  UIHoverGestureRecognizer *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UIHoverGestureRecognizer;
  v4 = -[UIGestureRecognizer initWithTarget:action:](&v7, sel_initWithTarget_action_, a3, a4);
  v5 = v4;
  if (v4)
  {
    v4->_pausesWhilePanning = 1;
    -[UIGestureRecognizer _setAcceptsFailureRequiments:](v4, "_setAcceptsFailureRequiments:", 0);
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentTouch, 0);
  objc_storeStrong((id *)&self->_currentHoverEvent, 0);
}

- (void)setAllowedTouchTypes:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  unint64_t v10;
  NSObject *v11;
  void *v12;
  UIHoverGestureRecognizer *v13;
  objc_class *v14;
  void *v15;
  __CFString *v16;
  id v17;
  objc_super v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  __CFString *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((dyld_program_sdk_at_least() & 1) != 0)
  {
    v18.receiver = self;
    v18.super_class = (Class)UIHoverGestureRecognizer;
    -[UIGestureRecognizer setAllowedTouchTypes:](&v18, sel_setAllowedTouchTypes_, v4);
  }
  else
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    if (v6)
    {
      v7 = v6;
      v17 = v4;
      v8 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v20 != v8)
            objc_enumerationMutation(v5);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "integerValue") == 1)
          {
            v10 = setAllowedTouchTypes____s_category;
            if (!setAllowedTouchTypes____s_category)
            {
              v10 = __UILogCategoryGetNode("Hover", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
              atomic_store(v10, (unint64_t *)&setAllowedTouchTypes____s_category);
            }
            v11 = *(id *)(v10 + 8);
            if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            {
              if (self)
              {
                v12 = (void *)MEMORY[0x1E0CB3940];
                v13 = self;
                v14 = (objc_class *)objc_opt_class();
                NSStringFromClass(v14);
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v12, "stringWithFormat:", CFSTR("<%@: %p>"), v15, v13);
                v16 = (__CFString *)objc_claimAutoreleasedReturnValue();

              }
              else
              {
                v16 = CFSTR("(nil)");
              }
              *(_DWORD *)buf = 138412290;
              v24 = v16;
              _os_log_impl(&dword_185066000, v11, OS_LOG_TYPE_ERROR, "An invalid allowed touch type of UITouch.TouchType.indirect was set on the UIHoverGestureRecognizer %@. In a future release, this will render the gesture nonfunctional", buf, 0xCu);

            }
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
      }
      while (v7);

      v4 = v17;
    }
    else
    {

    }
  }

}

- (id)_setAllowedTouchTypes:(id)result
{
  objc_super v2;

  if (result)
  {
    v2.receiver = result;
    v2.super_class = (Class)UIHoverGestureRecognizer;
    return objc_msgSendSuper2(&v2, sel_setAllowedTouchTypes_, a2);
  }
  return result;
}

- (BOOL)_wantsHoverEventsWhilePointerIsLocked
{
  return 0;
}

- (void)reset
{
  UIHoverEvent *currentHoverEvent;
  UITouch *currentTouch;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIHoverGestureRecognizer;
  -[UIGestureRecognizer reset](&v5, sel_reset);
  currentHoverEvent = self->_currentHoverEvent;
  self->_currentHoverEvent = 0;

  currentTouch = self->_currentTouch;
  self->_currentTouch = 0;

  self->_previousTrackpadFingerDownCount = 0;
  self->_trackpadFingerDownCount = 0;
}

- (BOOL)_shouldReceivePress:(id)a3
{
  return 0;
}

- (BOOL)_shouldReceiveTouch:(id)a3 withEvent:(id)a4
{
  UITouch *currentTouch;

  currentTouch = self->_currentTouch;
  return !currentTouch || currentTouch == a3;
}

- (void)_hoverEntered:(id)a3 withEvent:(id)a4
{
  UITouch *v6;
  id v7;
  unint64_t v8;
  UITouch *v9;
  UITouch *currentTouch;
  unint64_t v11;
  NSObject *v12;
  NSObject *v13;
  UITouch *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  int v18;
  UITouch *v19;
  __int16 v20;
  id v21;
  uint64_t v22;
  CGPoint v23;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = (UITouch *)a3;
  v7 = a4;
  v8 = _MergedGlobals_17_4;
  if (!_MergedGlobals_17_4)
  {
    v8 = __UILogCategoryGetNode("HoverGesture", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v8, (unint64_t *)&_MergedGlobals_17_4);
  }
  if ((*(_BYTE *)v8 & 1) != 0)
  {
    v12 = *(NSObject **)(v8 + 8);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v18 = 138412546;
      v19 = v6;
      v20 = 2112;
      v21 = v7;
      _os_log_impl(&dword_185066000, v12, OS_LOG_TYPE_ERROR, "_hoverEntered: %@ withEvent: %@", (uint8_t *)&v18, 0x16u);
    }
  }
  if (!self->_currentHoverEvent && -[UITouch count](v6, "count") == 1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_storeStrong((id *)&self->_currentHoverEvent, a4);
      -[UITouch anyObject](v6, "anyObject");
      v9 = (UITouch *)objc_claimAutoreleasedReturnValue();
      currentTouch = self->_currentTouch;
      self->_currentTouch = v9;

      self->_trackpadFingerDownCount = -[UIEvent _trackpadFingerDownCount](self->_currentHoverEvent, "_trackpadFingerDownCount");
      -[UIGestureRecognizer setState:](self, "setState:", 1);
      v11 = qword_1ECD7ACE0;
      if (!qword_1ECD7ACE0)
      {
        v11 = __UILogCategoryGetNode("HoverGesture", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v11, (unint64_t *)&qword_1ECD7ACE0);
      }
      if ((*(_BYTE *)v11 & 1) != 0)
      {
        v13 = *(NSObject **)(v11 + 8);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          v14 = self->_currentTouch;
          v15 = v13;
          -[UIGestureRecognizer view](self, "view");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[UITouch locationInView:](v14, "locationInView:", v16);
          NSStringFromCGPoint(v23);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = 138412546;
          v19 = v14;
          v20 = 2112;
          v21 = v17;
          _os_log_impl(&dword_185066000, v15, OS_LOG_TYPE_ERROR, "_hoverEntered: BEGAN with touch %@ at %@", (uint8_t *)&v18, 0x16u);

        }
      }
    }
  }

}

- (void)_hoverMoved:(id)a3 withEvent:(id)a4
{
  UITouch *v6;
  UIHoverEvent *v7;
  unint64_t v8;
  unint64_t v9;
  NSObject *v10;
  NSObject *v11;
  UITouch *currentTouch;
  NSObject *v13;
  void *v14;
  UIHoverEvent *v15;
  int v16;
  UITouch *v17;
  __int16 v18;
  UIHoverEvent *v19;
  uint64_t v20;
  CGPoint v21;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = (UITouch *)a3;
  v7 = (UIHoverEvent *)a4;
  v8 = qword_1ECD7ACE8;
  if (!qword_1ECD7ACE8)
  {
    v8 = __UILogCategoryGetNode("HoverGesture", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v8, (unint64_t *)&qword_1ECD7ACE8);
  }
  if ((*(_BYTE *)v8 & 1) != 0)
  {
    v10 = *(NSObject **)(v8 + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v16 = 138412546;
      v17 = v6;
      v18 = 2112;
      v19 = v7;
      _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_ERROR, "_hoverMoved: %@ withEvent: %@", (uint8_t *)&v16, 0x16u);
    }
  }
  if (self->_currentHoverEvent == v7
    && -[UITouch containsObject:](v6, "containsObject:", self->_currentTouch))
  {
    self->_previousTrackpadFingerDownCount = self->_trackpadFingerDownCount;
    self->_trackpadFingerDownCount = -[UIEvent _trackpadFingerDownCount](v7, "_trackpadFingerDownCount");
    -[UIGestureRecognizer setState:](self, "setState:", 2);
    v9 = qword_1ECD7ACF0;
    if (!qword_1ECD7ACF0)
    {
      v9 = __UILogCategoryGetNode("HoverGesture", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v9, (unint64_t *)&qword_1ECD7ACF0);
    }
    if ((*(_BYTE *)v9 & 1) != 0)
    {
      v11 = *(NSObject **)(v9 + 8);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        currentTouch = self->_currentTouch;
        v13 = v11;
        -[UIGestureRecognizer view](self, "view");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[UITouch locationInView:](currentTouch, "locationInView:", v14);
        NSStringFromCGPoint(v21);
        v15 = (UIHoverEvent *)objc_claimAutoreleasedReturnValue();
        v16 = 138412546;
        v17 = currentTouch;
        v18 = 2112;
        v19 = v15;
        _os_log_impl(&dword_185066000, v13, OS_LOG_TYPE_ERROR, "_hoverMoved: CHANGED with touch %@ at %@", (uint8_t *)&v16, 0x16u);

      }
    }
  }

}

- (void)_hoverExited:(id)a3 withEvent:(id)a4
{
  UITouch *v6;
  UIHoverEvent *v7;
  unint64_t v8;
  unint64_t v9;
  NSObject *v10;
  NSObject *v11;
  UITouch *currentTouch;
  NSObject *v13;
  void *v14;
  UIHoverEvent *v15;
  int v16;
  UITouch *v17;
  __int16 v18;
  UIHoverEvent *v19;
  uint64_t v20;
  CGPoint v21;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = (UITouch *)a3;
  v7 = (UIHoverEvent *)a4;
  v8 = qword_1ECD7ACF8;
  if (!qword_1ECD7ACF8)
  {
    v8 = __UILogCategoryGetNode("HoverGesture", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v8, (unint64_t *)&qword_1ECD7ACF8);
  }
  if ((*(_BYTE *)v8 & 1) != 0)
  {
    v10 = *(NSObject **)(v8 + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v16 = 138412546;
      v17 = v6;
      v18 = 2112;
      v19 = v7;
      _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_ERROR, "_hoverExited: %@ withEvent: %@", (uint8_t *)&v16, 0x16u);
    }
  }
  if (self->_currentHoverEvent == v7)
  {
    v9 = qword_1ECD7AD00;
    if (!qword_1ECD7AD00)
    {
      v9 = __UILogCategoryGetNode("HoverGesture", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v9, (unint64_t *)&qword_1ECD7AD00);
    }
    if ((*(_BYTE *)v9 & 1) != 0)
    {
      v11 = *(NSObject **)(v9 + 8);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        currentTouch = self->_currentTouch;
        v13 = v11;
        -[UIGestureRecognizer view](self, "view");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[UITouch locationInView:](currentTouch, "locationInView:", v14);
        NSStringFromCGPoint(v21);
        v15 = (UIHoverEvent *)objc_claimAutoreleasedReturnValue();
        v16 = 138412546;
        v17 = currentTouch;
        v18 = 2112;
        v19 = v15;
        _os_log_impl(&dword_185066000, v13, OS_LOG_TYPE_ERROR, "_hoverExited: ENDED with touch %@ at %@", (uint8_t *)&v16, 0x16u);

      }
    }
    -[UIHoverGestureRecognizer _resetInternalState](self, "_resetInternalState");
    -[UIGestureRecognizer setState:](self, "setState:", 3);
  }

}

- (void)_hoverCancelled:(id)a3 withEvent:(id)a4
{
  UITouch *v6;
  UIHoverEvent *v7;
  unint64_t v8;
  unint64_t v9;
  NSObject *v10;
  NSObject *v11;
  UITouch *currentTouch;
  NSObject *v13;
  void *v14;
  UIHoverEvent *v15;
  int v16;
  UITouch *v17;
  __int16 v18;
  UIHoverEvent *v19;
  uint64_t v20;
  CGPoint v21;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = (UITouch *)a3;
  v7 = (UIHoverEvent *)a4;
  v8 = qword_1ECD7AD08;
  if (!qword_1ECD7AD08)
  {
    v8 = __UILogCategoryGetNode("HoverGesture", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v8, (unint64_t *)&qword_1ECD7AD08);
  }
  if ((*(_BYTE *)v8 & 1) != 0)
  {
    v10 = *(NSObject **)(v8 + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v16 = 138412546;
      v17 = v6;
      v18 = 2112;
      v19 = v7;
      _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_ERROR, "_hoverCancelled: %@ withEvent: %@", (uint8_t *)&v16, 0x16u);
    }
  }
  if (self->_currentHoverEvent == v7)
  {
    v9 = qword_1ECD7AD10;
    if (!qword_1ECD7AD10)
    {
      v9 = __UILogCategoryGetNode("HoverGesture", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v9, (unint64_t *)&qword_1ECD7AD10);
    }
    if ((*(_BYTE *)v9 & 1) != 0)
    {
      v11 = *(NSObject **)(v9 + 8);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        currentTouch = self->_currentTouch;
        v13 = v11;
        -[UIGestureRecognizer view](self, "view");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[UITouch locationInView:](currentTouch, "locationInView:", v14);
        NSStringFromCGPoint(v21);
        v15 = (UIHoverEvent *)objc_claimAutoreleasedReturnValue();
        v16 = 138412546;
        v17 = currentTouch;
        v18 = 2112;
        v19 = v15;
        _os_log_impl(&dword_185066000, v13, OS_LOG_TYPE_ERROR, "_hoverCancelled: CANCELLED with touch %@ at %@", (uint8_t *)&v16, 0x16u);

      }
    }
    -[UIHoverGestureRecognizer _resetInternalState](self, "_resetInternalState");
    -[UIGestureRecognizer setState:](self, "setState:", 4);
  }

}

- (void)_resetInternalState
{
  UIHoverEvent *currentHoverEvent;
  UITouch *currentTouch;

  currentHoverEvent = self->_currentHoverEvent;
  self->_currentHoverEvent = 0;

  currentTouch = self->_currentTouch;
  self->_currentTouch = 0;

  self->_previousTrackpadFingerDownCount = self->_trackpadFingerDownCount;
  self->_trackpadFingerDownCount = 0;
}

- (CGPoint)locationInView:(id)a3
{
  UITouch *currentTouch;
  double v4;
  double v5;
  CGPoint result;

  currentTouch = self->_currentTouch;
  if (currentTouch)
  {
    -[UITouch locationInView:](currentTouch, "locationInView:", a3);
  }
  else
  {
    v4 = *MEMORY[0x1E0C9D538];
    v5 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }
  result.y = v5;
  result.x = v4;
  return result;
}

- (CGPoint)_preciseLocationInView:(id)a3
{
  UITouch *currentTouch;
  double v4;
  double v5;
  CGPoint result;

  currentTouch = self->_currentTouch;
  if (currentTouch)
  {
    -[UITouch preciseLocationInView:](currentTouch, "preciseLocationInView:", a3);
  }
  else
  {
    v4 = *MEMORY[0x1E0C9D538];
    v5 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }
  result.y = v5;
  result.x = v4;
  return result;
}

- (CAPoint3D)_location3DInView:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CAPoint3D result;

  -[UIHoverGestureRecognizer locationInView:](self, "locationInView:", a3);
  v5 = v4;
  v7 = v6;
  -[UIHoverGestureRecognizer _hoverHeight](self, "_hoverHeight");
  v9 = v8;
  v10 = v5;
  v11 = v7;
  result.z = v9;
  result.y = v11;
  result.x = v10;
  return result;
}

- (BOOL)_affectedByGesture:(id)a3
{
  id v4;
  char isKindOfClass;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)UIHoverGestureRecognizer;
  if (-[UIGestureRecognizer _affectedByGesture:](&v7, sel__affectedByGesture_, v4))
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (BOOL)canPreventGestureRecognizer:(id)a3
{
  return 0;
}

- (BOOL)canBePreventedByGestureRecognizer:(id)a3
{
  return 0;
}

- (BOOL)_isPaused
{
  UITouch *currentTouch;
  objc_super v5;

  currentTouch = self->_currentTouch;
  if (currentTouch && (unint64_t)(-[UITouch phase](currentTouch, "phase") - 3) >= 5)
    return -[UIHoverGestureRecognizer _pausesWhilePanning](self, "_pausesWhilePanning");
  v5.receiver = self;
  v5.super_class = (Class)UIHoverGestureRecognizer;
  return -[UIGestureRecognizer _isPaused](&v5, sel__isPaused);
}

- (double)_rollAngle
{
  UIHoverEvent *currentHoverEvent;

  currentHoverEvent = self->_currentHoverEvent;
  if (currentHoverEvent)
    return currentHoverEvent->_hoverRollAngle;
  else
    return 0.0;
}

- (CGFloat)altitudeAngle
{
  UIHoverEvent *currentHoverEvent;

  currentHoverEvent = self->_currentHoverEvent;
  if (currentHoverEvent)
    return 1.57079633 - currentHoverEvent->_hoverAltitudeAngle;
  else
    return 0.0;
}

- (CGFloat)azimuthAngleInView:(UIView *)view
{
  UIView *v4;
  double v5;
  long double v6;
  long double v7;

  v4 = view;
  v5 = 0.0;
  if (self->_currentHoverEvent)
  {
    -[UIHoverGestureRecognizer _azimuthUnitVectorInView:](self, "_azimuthUnitVectorInView:", v4);
    if (v6 != 0.0 || v7 != 0.0)
      v5 = atan2(v7, v6);
  }

  return v5;
}

- (CGVector)azimuthUnitVectorInView:(UIView *)view
{
  UIView *v4;
  void *v5;
  void *v6;
  id v7;
  double v8;
  double v9;
  void *v10;
  UIHoverEvent *currentHoverEvent;
  double hoverAzimuthAngle;
  double v13;
  double v14;
  double v15;
  double v16;
  CGVector result;

  if (self->_currentHoverEvent)
  {
    v4 = view;
    -[UIView window](v4, "window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = v5;
    }
    else
    {
      -[UIGestureRecognizer view](self, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "window");
      v7 = (id)objc_claimAutoreleasedReturnValue();

    }
    currentHoverEvent = self->_currentHoverEvent;
    if (currentHoverEvent)
      hoverAzimuthAngle = currentHoverEvent->_hoverAzimuthAngle;
    else
      hoverAzimuthAngle = 0.0;
    v13 = _UITouchConvertCADisplayAzimuthAngleToWindow(v7, hoverAzimuthAngle);
    v8 = _UITouchAzimuthUnitVectorInView(v7, v4, v13);
    v9 = v14;

  }
  else
  {
    v8 = 0.0;
    v9 = 0.0;
  }
  v15 = v8;
  v16 = v9;
  result.dy = v16;
  result.dx = v15;
  return result;
}

- (double)_hoverHeight
{
  UIHoverEvent *currentHoverEvent;

  currentHoverEvent = self->_currentHoverEvent;
  if (currentHoverEvent)
    return currentHoverEvent->_positionZ;
  else
    return 0.0;
}

- (double)_hoverTouchTimestamp
{
  double result;

  -[UITouch timestamp](self->_currentTouch, "timestamp");
  return result;
}

- (double)_maximumHoverHeight
{
  UIHoverEvent *currentHoverEvent;

  currentHoverEvent = self->_currentHoverEvent;
  if (currentHoverEvent)
    return currentHoverEvent->_maximumPositionZ;
  else
    return 0.0;
}

- (CGFloat)zOffset
{
  double v3;
  double v4;
  double v5;
  CGFloat result;

  -[UIHoverGestureRecognizer _hoverHeight](self, "_hoverHeight");
  v4 = v3;
  -[UIHoverGestureRecognizer _maximumHoverHeight](self, "_maximumHoverHeight");
  if (v5 == 0.0)
    v5 = 15.0;
  result = v4 / v5;
  if (result > 1.0)
    return 1.0;
  return result;
}

- (BOOL)_pausesWhilePanning
{
  return self->_pausesWhilePanning;
}

- (int64_t)_previousTrackpadFingerDownCount
{
  return self->_previousTrackpadFingerDownCount;
}

- (int64_t)_trackpadFingerDownCount
{
  return self->_trackpadFingerDownCount;
}

@end
