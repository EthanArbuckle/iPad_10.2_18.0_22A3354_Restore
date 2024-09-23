@implementation _UIFocusMovementPressGestureRecognizer

- (_UIFocusMovementPressGestureRecognizer)initWithCoder:(id)a3
{
  _UIFocusMovementPressGestureRecognizer *v3;
  _UIFocusMovementPressGestureRecognizer *v4;
  _UIFocusMovementPressGestureRecognizer *v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UIFocusMovementPressGestureRecognizer;
  v3 = -[UIGestureRecognizer initWithCoder:](&v8, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
  {
    v5 = v3;
    v6 = MEMORY[0x1E0C9AA60];
    -[UIGestureRecognizer setAllowedPressTypes:](v5, "setAllowedPressTypes:", MEMORY[0x1E0C9AA60]);
    -[_UIFocusMovementPressGestureRecognizer setAllowedTouchTypes:](v5, "setAllowedTouchTypes:", v6);
    -[UIGestureRecognizer setCancelsTouchesInView:](v5, "setCancelsTouchesInView:", 0);
    *((_BYTE *)&v5->super._gestureFlags + 8) &= ~0x20u;
    -[_UIFocusMovementPressGestureRecognizer configureDefaults](v5, "configureDefaults");

  }
  return v4;
}

- (_UIFocusMovementPressGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  _UIFocusMovementPressGestureRecognizer *v4;
  _UIFocusMovementPressGestureRecognizer *v5;
  _UIFocusMovementPressGestureRecognizer *v6;
  uint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_UIFocusMovementPressGestureRecognizer;
  v4 = -[UIGestureRecognizer initWithTarget:action:](&v9, sel_initWithTarget_action_, a3, a4);
  v5 = v4;
  if (v4)
  {
    v6 = v4;
    v7 = MEMORY[0x1E0C9AA60];
    -[UIGestureRecognizer setAllowedPressTypes:](v6, "setAllowedPressTypes:", MEMORY[0x1E0C9AA60]);
    -[_UIFocusMovementPressGestureRecognizer setAllowedTouchTypes:](v6, "setAllowedTouchTypes:", v7);
    -[UIGestureRecognizer setCancelsTouchesInView:](v6, "setCancelsTouchesInView:", 0);
    *((_BYTE *)&v6->super._gestureFlags + 8) &= ~0x20u;
    -[_UIFocusMovementPressGestureRecognizer configureDefaults](v6, "configureDefaults");

  }
  return v5;
}

- (BOOL)_isRecognizing
{
  return (unint64_t)(-[UIGestureRecognizer state](self, "state") - 1) < 2;
}

- (NSMutableOrderedSet)_trackedPresses
{
  NSMutableOrderedSet *trackedPresses;
  NSMutableOrderedSet *v4;
  NSMutableOrderedSet *v5;

  trackedPresses = self->_trackedPresses;
  if (!trackedPresses)
  {
    v4 = (NSMutableOrderedSet *)objc_opt_new();
    v5 = self->_trackedPresses;
    self->_trackedPresses = v4;

    trackedPresses = self->_trackedPresses;
  }
  return trackedPresses;
}

- (BOOL)_isGestureType:(int64_t)a3
{
  return a3 == 17;
}

- (void)setAllowedTouchTypes:(id)a3
{
  id v5;
  void *v6;
  objc_super v7;

  v5 = a3;
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFocusMovementPressGestureRecognizer.m"), 97, CFSTR("This gesture recognizer is not designed to work with touches."));

  }
  v7.receiver = self;
  v7.super_class = (Class)_UIFocusMovementPressGestureRecognizer;
  -[UIGestureRecognizer setAllowedTouchTypes:](&v7, sel_setAllowedTouchTypes_, v5);

}

- (BOOL)shouldReceiveEvent:(id)a3
{
  return objc_msgSend(a3, "type") == 3;
}

- (void)setFocusHeading:(unint64_t)a3
{
  -[_UIFocusMovementPressGestureRecognizer setFocusHeading:omitStateUpdate:](self, "setFocusHeading:omitStateUpdate:", a3, 0);
}

- (void)setFocusHeading:(unint64_t)a3 omitStateUpdate:(BOOL)a4
{
  UIGestureRecognizerState v5;
  void *v7;
  UIGestureRecognizerState v8;
  _UIFocusMovementPressGestureRecognizer *v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  NSObject *v13;
  void *v14;
  _UIFocusMovementPressGestureRecognizer *v15;
  NSObject *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (self->_focusHeading == a3)
  {
    if (a3)
      return;
    v5 = -[UIGestureRecognizer state](self, "state", 0, a4);
    goto LABEL_11;
  }
  self->_focusHeading = a3;
  if (!a3)
  {
    v5 = -[UIGestureRecognizer state](self, "state", 0, a4);
    if ((unint64_t)(v5 - 1) >= 2)
    {
LABEL_11:
      if (v5)
        return;
      v9 = self;
      v10 = 5;
      goto LABEL_13;
    }
    -[_UIFocusMovementPressGestureRecognizer repeatingClock](self, "repeatingClock");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stopClock");

    v9 = self;
    v10 = 3;
LABEL_13:
    -[UIGestureRecognizer setState:](v9, "setState:", v10);
    return;
  }
  -[_UIFocusMovementPressGestureRecognizer setRepeatCount:](self, "setRepeatCount:", 0);
  -[_UIFocusMovementPressGestureRecognizer repeatingClock](self, "repeatingClock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "startClock");

  v8 = -[UIGestureRecognizer state](self, "state");
  if ((unint64_t)(v8 - 3) < 3)
  {
    v12 = setFocusHeading_omitStateUpdate____s_category;
    if (!setFocusHeading_omitStateUpdate____s_category)
    {
      v12 = __UILogCategoryGetNode("UIFocus", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v12, (unint64_t *)&setFocusHeading_omitStateUpdate____s_category);
    }
    v13 = *(NSObject **)(v12 + 8);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = (void *)MEMORY[0x1E0CB3940];
      v15 = self;
      v16 = v13;
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringWithFormat:", CFSTR("<%@: %p>"), v18, v15);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      *(_DWORD *)buf = 138412290;
      v21 = v19;
      _os_log_impl(&dword_185066000, v16, OS_LOG_TYPE_ERROR, "%@ received a heading update while in an end state. This is considered an implementation error in the gesture recognizer.", buf, 0xCu);

    }
  }
  else if ((unint64_t)v8 <= UIGestureRecognizerStateChanged && !a4)
  {
    v9 = self;
    v10 = 2;
    goto LABEL_13;
  }
}

- (void)reset
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIFocusMovementPressGestureRecognizer;
  -[UIGestureRecognizer reset](&v5, sel_reset);
  -[_UIFocusMovementPressGestureRecognizer repeatingClock](self, "repeatingClock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopClock");

  -[_UIFocusMovementPressGestureRecognizer _trackedPresses](self, "_trackedPresses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

  -[_UIFocusMovementPressGestureRecognizer setRepeatCount:](self, "setRepeatCount:", 0);
  self->_focusHeading = 0;
}

- (void)setShouldRepeat:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  unint64_t v6;
  NSObject *v7;
  void *v8;
  _UIFocusMovementPressGestureRecognizer *v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (self->_shouldRepeat != a3)
  {
    v3 = a3;
    self->_shouldRepeat = a3;
    -[_UIFocusMovementPressGestureRecognizer setRepeatCount:](self, "setRepeatCount:", 0);
    if (v3)
    {
      v5 = (void *)objc_opt_new();
      objc_msgSend(v5, "setDelegate:", self);
      -[_UIFocusMovementPressGestureRecognizer setRepeatingClock:](self, "setRepeatingClock:", v5);
      if (-[_UIFocusMovementPressGestureRecognizer _isRecognizing](self, "_isRecognizing"))
      {
        v6 = setShouldRepeat____s_category;
        if (!setShouldRepeat____s_category)
        {
          v6 = __UILogCategoryGetNode("UIFocus", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v6, (unint64_t *)&setShouldRepeat____s_category);
        }
        v7 = *(NSObject **)(v6 + 8);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          v8 = (void *)MEMORY[0x1E0CB3940];
          v9 = self;
          v10 = v7;
          v11 = (objc_class *)objc_opt_class();
          NSStringFromClass(v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "stringWithFormat:", CFSTR("<%@: %p>"), v12, v9);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          *(_DWORD *)buf = 138412290;
          v16 = v13;
          _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_DEFAULT, "Changed %@ to repeat while a gesture is recongizing. Repeating will start working on next recognition.", buf, 0xCu);

        }
      }

    }
    else
    {
      -[_UIFocusMovementPressGestureRecognizer repeatingClock](self, "repeatingClock");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stopClock");

      -[_UIFocusMovementPressGestureRecognizer setRepeatingClock:](self, "setRepeatingClock:", 0);
    }
  }
}

- (void)repeatingGestureClockDidTick:(id)a3
{
  unint64_t v4;
  NSObject *v5;
  void *v6;
  _UIFocusMovementPressGestureRecognizer *v7;
  objc_class *v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  _UIFocusMovementPressGestureRecognizer *v14;
  objc_class *v15;
  void *v16;
  uint8_t buf[4];
  __CFString *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (-[_UIFocusMovementPressGestureRecognizer _isRecognizing](self, "_isRecognizing", a3))
  {
    -[_UIFocusMovementPressGestureRecognizer setRepeatCount:](self, "setRepeatCount:", -[_UIFocusMovementPressGestureRecognizer repeatCount](self, "repeatCount") + 1);
    -[UIGestureRecognizer setState:](self, "setState:", 2);
  }
  else
  {
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      {
        if (self)
        {
          v13 = (void *)MEMORY[0x1E0CB3940];
          v14 = self;
          v15 = (objc_class *)objc_opt_class();
          NSStringFromClass(v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "stringWithFormat:", CFSTR("<%@: %p>"), v16, v14);
          v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v12 = CFSTR("(nil)");
        }
        *(_DWORD *)buf = 138412546;
        v18 = v12;
        v19 = 1024;
        v20 = -[UIGestureRecognizer state](self, "state");
        _os_log_fault_impl(&dword_185066000, v5, OS_LOG_TYPE_FAULT, "%@ received a repeating clock tick while not in a recognizing state. Current state: %d", buf, 0x12u);

      }
    }
    else
    {
      v4 = repeatingGestureClockDidTick____s_category;
      if (!repeatingGestureClockDidTick____s_category)
      {
        v4 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v4, (unint64_t *)&repeatingGestureClockDidTick____s_category);
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
        v11 = v10;
        *(_DWORD *)buf = 138412546;
        v18 = v10;
        v19 = 1024;
        v20 = -[UIGestureRecognizer state](self, "state");
        _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_ERROR, "%@ received a repeating clock tick while not in a recognizing state. Current state: %d", buf, 0x12u);

      }
    }

  }
}

- (unint64_t)focusHeadingForPresses:(id)a3
{
  return 0;
}

- (void)_startTrackingPresses:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_UIFocusMovementPressGestureRecognizer _trackedPresses](self, "_trackedPresses");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unionSet:", v4);

}

- (void)_stopTrackingPresses:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_UIFocusMovementPressGestureRecognizer _trackedPresses](self, "_trackedPresses");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "minusSet:", v4);

}

- (void)_verifyTrackingPresses:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  NSObject *v10;
  NSObject *v11;
  uint8_t v12[16];
  uint8_t buf[16];

  v5 = (void *)objc_msgSend(a3, "mutableCopy");
  -[_UIFocusMovementPressGestureRecognizer _trackedPresses](self, "_trackedPresses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "minusSet:", v7);

  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend((id)UIApp, "_isSpringBoard");
    if (_UIIsPrivateMainBundle())
    {
      objc_msgSend((id)UIApp, "_isSpringBoard");
      objc_msgSend((id)UIApp, "_isSpringBoard");
    }
    if (dyld_program_sdk_at_least())
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFocusMovementPressGestureRecognizer.m"), 249, CFSTR("Found untracked presses that are not in the began phase."));

    }
    else if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v11, OS_LOG_TYPE_FAULT, "Found untracked presses that are not in the began phase. This may leave views in an invalid state and user interaction might be impacted. This will become an assert in a future version.", buf, 2u);
      }

    }
    else
    {
      v9 = _verifyTrackingPresses____s_category;
      if (!_verifyTrackingPresses____s_category)
      {
        v9 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v9, (unint64_t *)&_verifyTrackingPresses____s_category);
      }
      v10 = *(NSObject **)(v9 + 8);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_ERROR, "Found untracked presses that are not in the began phase. This may leave views in an invalid state and user interaction might be impacted. This will become an assert in a future version.", v12, 2u);
      }
    }
  }

}

- (void)_updateForPresses:(id)a3 action:(unint64_t)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  id v10;

  v10 = a3;
  switch(a4)
  {
    case 2uLL:
      -[_UIFocusMovementPressGestureRecognizer _verifyTrackingPresses:](self, "_verifyTrackingPresses:", v10);
      break;
    case 1uLL:
      -[_UIFocusMovementPressGestureRecognizer _verifyTrackingPresses:](self, "_verifyTrackingPresses:", v10);
      -[_UIFocusMovementPressGestureRecognizer _stopTrackingPresses:](self, "_stopTrackingPresses:", v10);
      break;
    case 0uLL:
      -[_UIFocusMovementPressGestureRecognizer _startTrackingPresses:](self, "_startTrackingPresses:", v10);
      break;
  }
  -[_UIFocusMovementPressGestureRecognizer _trackedPresses](self, "_trackedPresses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    -[_UIFocusMovementPressGestureRecognizer _trackedPresses](self, "_trackedPresses");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[_UIFocusMovementPressGestureRecognizer focusHeadingForPresses:](self, "focusHeadingForPresses:", v8);

    -[_UIFocusMovementPressGestureRecognizer setFocusHeading:omitStateUpdate:](self, "setFocusHeading:omitStateUpdate:", v9, a4 != 0);
  }
  else
  {
    -[_UIFocusMovementPressGestureRecognizer setFocusHeading:](self, "setFocusHeading:", 0);
  }

}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  -[_UIFocusMovementPressGestureRecognizer _updateForPresses:action:](self, "_updateForPresses:action:", a3, 0);
}

- (void)pressesChanged:(id)a3 withEvent:(id)a4
{
  -[_UIFocusMovementPressGestureRecognizer _updateForPresses:action:](self, "_updateForPresses:action:", a3, 2);
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  -[_UIFocusMovementPressGestureRecognizer _updateForPresses:action:](self, "_updateForPresses:action:", a3, 1);
}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  -[_UIFocusMovementPressGestureRecognizer _updateForPresses:action:](self, "_updateForPresses:action:", a3, 1);
}

- (unint64_t)focusHeading
{
  return self->_focusHeading;
}

- (BOOL)shouldRepeat
{
  return self->_shouldRepeat;
}

- (int64_t)repeatCount
{
  return self->_repeatCount;
}

- (void)setRepeatCount:(int64_t)a3
{
  self->_repeatCount = a3;
}

- (_UIRepeatingGestureClock)repeatingClock
{
  return self->_repeatingClock;
}

- (void)setRepeatingClock:(id)a3
{
  objc_storeStrong((id *)&self->_repeatingClock, a3);
}

- (void)_setTrackedPresses:(id)a3
{
  objc_storeStrong((id *)&self->_trackedPresses, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackedPresses, 0);
  objc_storeStrong((id *)&self->_repeatingClock, 0);
}

@end
