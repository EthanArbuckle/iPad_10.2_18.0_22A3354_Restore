@implementation _UISystemGestureGateGestureRecognizer

- (BOOL)canBePreventedByGestureRecognizer:(id)a3
{
  return 0;
}

- (BOOL)shouldBeRequiredToFailByGestureRecognizer:(id)a3
{
  if (self->_systemGestureGateType)
    return objc_msgSend(a3, "_requiresSystemGesturesToFail");
  else
    return 0;
}

- (void)_resetGestureRecognizer
{
  void *v3;
  void *v4;
  objc_super v5;

  *((_BYTE *)self + 273) &= ~2u;
  self->_lastTouchTime = 0.0;
  -[UIGestureRecognizer view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UISystemGestureGateGestureRecognizer _notifyWindowNoLongerAwaitingSystemGestureNotification:](self, "_notifyWindowNoLongerAwaitingSystemGestureNotification:", v4);

  -[_UISystemGestureGateGestureRecognizer _cancelTimeoutTimerIfNeeded](self, "_cancelTimeoutTimerIfNeeded");
  v5.receiver = self;
  v5.super_class = (Class)_UISystemGestureGateGestureRecognizer;
  -[UIGestureRecognizer _resetGestureRecognizer](&v5, sel__resetGestureRecognizer);
}

- (void)_cancelTimeoutTimerIfNeeded
{
  NSObject *delayTimeoutTimer;
  OS_dispatch_source *v4;

  delayTimeoutTimer = self->_delayTimeoutTimer;
  if (delayTimeoutTimer)
  {
    dispatch_source_cancel(delayTimeoutTimer);
    v4 = self->_delayTimeoutTimer;
    self->_delayTimeoutTimer = 0;

  }
}

- (void)_notifyWindowNoLongerAwaitingSystemGestureNotification:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[UIGestureRecognizer _activeEvents](self, "_activeEvents", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v10, "_windowNoLongerAwaitingSystemGestureNotification:", v4);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (_UISystemGestureGateGestureRecognizer)initWithWindow:(id)a3 type:(unsigned __int8)a4
{
  int v4;
  id v6;
  _UISystemGestureGateGestureRecognizer *v7;
  void *v8;
  objc_super v10;
  objc_super v11;
  objc_super v12;
  objc_super v13;
  objc_super v14;

  v4 = a4;
  v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_UISystemGestureGateGestureRecognizer;
  v7 = -[UIGestureRecognizer initWithTarget:action:](&v14, sel_initWithTarget_action_, 0, 0);
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v7, sel__systemGestureStateChanged_, 0x1E1764C00, v6);

    *((_BYTE *)v7 + 273) = *((_BYTE *)v7 + 273) & 0xFE | objc_msgSend(v6, "_systemGestureRecognitionIsPossible");
    -[UIGestureRecognizer _setAcceptsFailureRequiments:](v7, "_setAcceptsFailureRequiments:", 0);
    v7->_systemGestureGateType = v4;
    if (v4 == 1)
    {
      v13.receiver = v7;
      v13.super_class = (Class)_UISystemGestureGateGestureRecognizer;
      -[UIGestureRecognizer setDelaysTouchesBegan:](&v13, sel_setDelaysTouchesBegan_, 0);
      v12.receiver = v7;
      v12.super_class = (Class)_UISystemGestureGateGestureRecognizer;
      -[UIGestureRecognizer setDelaysTouchesEnded:](&v12, sel_setDelaysTouchesEnded_, 0, v10.receiver, v10.super_class);
    }
    else
    {
      v11.receiver = v7;
      v11.super_class = (Class)_UISystemGestureGateGestureRecognizer;
      -[UIGestureRecognizer setDelaysTouchesBegan:](&v11, sel_setDelaysTouchesBegan_, 1);
      -[UIGestureRecognizer setDelaysTouchesEnded:](&v10, sel_setDelaysTouchesEnded_, 1, v7, _UISystemGestureGateGestureRecognizer);
    }
  }

  return v7;
}

- (void)_systemGestureStateChanged:(id)a3
{
  void *v4;
  char v5;
  char v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  id v14;

  v14 = a3;
  objc_msgSend(v14, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_systemGestureRecognitionIsPossible");
  v6 = v5;
  v7 = *((_BYTE *)self + 273);
  if ((v7 & 1) != 0 && (v5 & 1) == 0)
  {
    if ((*((_BYTE *)self + 273) & 2) != 0)
    {
      *((_BYTE *)self + 273) &= ~2u;
      -[UIGestureRecognizer view](self, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_window");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UISystemGestureGateGestureRecognizer _notifyWindowNoLongerAwaitingSystemGestureNotification:](self, "_notifyWindowNoLongerAwaitingSystemGestureNotification:", v9);

    }
    objc_msgSend(v14, "userInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "valueForKey:", 0x1E1764C20);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "BOOLValue");

    if (v12)
      v13 = 3;
    else
      v13 = 5;
    -[UIGestureRecognizer setState:](self, "setState:", v13);
    v7 = *((_BYTE *)self + 273);
  }
  *((_BYTE *)self + 273) = v7 & 0xFE | v6;

}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  objc_msgSend(v7, "touchesForGestureRecognizer:", self);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v28;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v28 != v11)
        objc_enumerationMutation(v8);
      if (objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v12), "phase") < 3)
        goto LABEL_22;
      if (v10 == ++v12)
      {
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
        if (v10)
          goto LABEL_3;
        break;
      }
    }
  }

  if ((*((_BYTE *)self + 273) & 1) != 0)
  {
    *((_BYTE *)self + 273) |= 2u;
    self->_lastTouchTime = CACurrentMediaTime();
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v8 = v6;
    v13 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v24;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v24 != v15)
            objc_enumerationMutation(v8);
          v17 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v16);
          -[UIGestureRecognizer view](self, "view", (_QWORD)v23);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "_window");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
            v20 = *(void **)(v17 + 360);
          else
            v20 = 0;
          v21 = v20;
          objc_msgSend(v7, "_addWindowAwaitingLatentSystemGestureNotification:deliveredToEventWindow:", v19, v21);

          ++v16;
        }
        while (v14 != v16);
        v22 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
        v14 = v22;
      }
      while (v22);
    }
LABEL_22:

    goto LABEL_23;
  }
  -[UIGestureRecognizer setState:](self, "setState:", 5);
LABEL_23:

}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  id v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  OS_dispatch_source *v22;
  OS_dispatch_source *delayTimeoutTimer;
  NSObject *v24;
  dispatch_time_t v25;
  NSObject *v26;
  _QWORD handler[4];
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t v33[128];
  uint8_t buf[4];
  _UISystemGestureGateGestureRecognizer *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((*((_BYTE *)self + 273) & 2) != 0)
  {
    v8 = touchesBegan_withEvent____s_category[0];
    if (!touchesBegan_withEvent____s_category[0])
    {
      v8 = __UILogCategoryGetNode("SystemGestureGate", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v8, touchesBegan_withEvent____s_category);
    }
    v9 = *(NSObject **)(v8 + 8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = v9;
      -[_UISystemGestureGateGestureRecognizer _gateGestureTypeString](self, "_gateGestureTypeString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to receive system gesture state notification before next touch"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v35 = self;
      v36 = 2112;
      v37 = v11;
      v38 = 2112;
      v39 = v12;
      _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_DEFAULT, "<%p> %@: %@", buf, 0x20u);

    }
  }
  if ((*((_BYTE *)self + 273) & 1) == 0)
    -[UIGestureRecognizer setState:](self, "setState:", 5);
  if (-[UIGestureRecognizer numberOfTouches](self, "numberOfTouches") >= 2)
    -[UIGestureRecognizer setState:](self, "setState:", 5);
  if (!self->_systemGestureGateType)
  {
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v13 = v6;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v30 != v16)
            objc_enumerationMutation(v13);
          v18 = *(id *)(*((_QWORD *)&v29 + 1) + 8 * i);
          objc_msgSend(v18, "view");
          v19 = objc_claimAutoreleasedReturnValue();
          if (v19)
          {
            v20 = (void *)v19;
            while (!objc_msgSend(v20, "_shouldDelayTouchForSystemGestures:", v18))
            {
              objc_msgSend(v20, "superview");
              v21 = objc_claimAutoreleasedReturnValue();

              v20 = (void *)v21;
              if (!v21)
                goto LABEL_20;
            }

          }
          else
          {
LABEL_20:

            -[UIGestureRecognizer ignoreTouch:forEvent:](self, "ignoreTouch:forEvent:", v18, v7);
          }
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v15);
    }

  }
  if (-[UIGestureRecognizer numberOfTouches](self, "numberOfTouches"))
  {
    if (!self->_delayTimeoutTimer)
    {
      v22 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, MEMORY[0x1E0C80D38]);
      delayTimeoutTimer = self->_delayTimeoutTimer;
      self->_delayTimeoutTimer = v22;

      v24 = self->_delayTimeoutTimer;
      v25 = dispatch_time(0, 750000000);
      dispatch_source_set_timer(v24, v25, 0xFFFFFFFFFFFFFFFFLL, 0);
      objc_initWeak((id *)buf, self);
      v26 = self->_delayTimeoutTimer;
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __64___UISystemGestureGateGestureRecognizer_touchesBegan_withEvent___block_invoke;
      handler[3] = &unk_1E16B3F40;
      objc_copyWeak(&v28, (id *)buf);
      dispatch_source_set_event_handler(v26, handler);
      dispatch_activate((dispatch_object_t)self->_delayTimeoutTimer);
      objc_destroyWeak(&v28);
      objc_destroyWeak((id *)buf);
    }
  }
  else
  {
    -[UIGestureRecognizer setState:](self, "setState:", 5);
  }

}

- (void)setDelaysTouchesBegan:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;
  _QWORD block[4];
  BOOL v7;

  v3 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63___UISystemGestureGateGestureRecognizer_setDelaysTouchesBegan___block_invoke;
  block[3] = &__block_descriptor_33_e5_v8__0l;
  v7 = a3;
  if (setDelaysTouchesBegan__once != -1)
    dispatch_once(&setDelaysTouchesBegan__once, block);
  v5.receiver = self;
  v5.super_class = (Class)_UISystemGestureGateGestureRecognizer;
  -[UIGestureRecognizer setDelaysTouchesBegan:](&v5, sel_setDelaysTouchesBegan_, v3);
}

- (_UISystemGestureGateGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("_UISystemGestureGateGestureRecognizer must be initialized with initWithWindow:"));

  return 0;
}

- (_UISystemGestureGateGestureRecognizer)initWithCoder:(id)a3
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("_UISystemGestureGateGestureRecognizer must be initialized with initWithWindow:"));

  return 0;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, 0x1E1764C00, 0);

  -[_UISystemGestureGateGestureRecognizer _cancelTimeoutTimerIfNeeded](self, "_cancelTimeoutTimerIfNeeded");
  v4.receiver = self;
  v4.super_class = (Class)_UISystemGestureGateGestureRecognizer;
  -[UIGestureRecognizer dealloc](&v4, sel_dealloc);
}

- (void)setDelaysTouchesEnded:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;
  _QWORD block[4];
  BOOL v7;

  v3 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63___UISystemGestureGateGestureRecognizer_setDelaysTouchesEnded___block_invoke;
  block[3] = &__block_descriptor_33_e5_v8__0l;
  v7 = a3;
  if (setDelaysTouchesEnded__once != -1)
    dispatch_once(&setDelaysTouchesEnded__once, block);
  v5.receiver = self;
  v5.super_class = (Class)_UISystemGestureGateGestureRecognizer;
  -[UIGestureRecognizer setDelaysTouchesEnded:](&v5, sel_setDelaysTouchesEnded_, v3);
}

- (void)_timeOut
{
  unint64_t v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  _UISystemGestureGateGestureRecognizer *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (-[UIGestureRecognizer state](self, "state") == UIGestureRecognizerStatePossible)
  {
    v3 = _timeOut___s_category;
    if (!_timeOut___s_category)
    {
      v3 = __UILogCategoryGetNode("SystemGestureGate", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v3, (unint64_t *)&_timeOut___s_category);
    }
    v4 = *(NSObject **)(v3 + 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = v4;
      -[_UISystemGestureGateGestureRecognizer _gateGestureTypeString](self, "_gateGestureTypeString");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("System gesture gate timed out."));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 134218498;
      v9 = self;
      v10 = 2112;
      v11 = v6;
      v12 = 2112;
      v13 = v7;
      _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_ERROR, "<%p> %@: %@", (uint8_t *)&v8, 0x20u);

    }
    -[UIGestureRecognizer setState:](self, "setState:", 5);
  }
}

+ (BOOL)_supportsDefaultTouchTypes
{
  return 1;
}

+ (BOOL)_supportsDefaultPressTypes
{
  return 0;
}

- (BOOL)_isAllowedToReceiveGESEvents
{
  return 1;
}

- (BOOL)canPreventGestureRecognizer:(id)a3
{
  return objc_msgSend(a3, "_requiresSystemGesturesToFail");
}

- (id)_gateGestureTypeString
{
  __CFString *v2;

  if (self->_systemGestureGateType)
    v2 = CFSTR("Gesture");
  else
    v2 = CFSTR("Touch");
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delayTimeoutTimer, 0);
}

@end
