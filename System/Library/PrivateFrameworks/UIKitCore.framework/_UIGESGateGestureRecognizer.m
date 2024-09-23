@implementation _UIGESGateGestureRecognizer

- (_UIGESGateGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  _UIGESGateGestureRecognizer *v4;
  _UIGESGateGestureRecognizer *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIGESGateGestureRecognizer;
  v4 = -[UIGestureRecognizer initWithTarget:action:](&v7, sel_initWithTarget_action_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[UIGestureRecognizer _setAcceptsFailureRequiments:](v4, "_setAcceptsFailureRequiments:", 0);
    -[UIGestureRecognizer setDelaysTouchesBegan:](v5, "setDelaysTouchesBegan:", 1);
    -[UIGestureRecognizer setName:](v5, "setName:", CFSTR("com.apple.UIKit.GESGate"));
  }
  return v5;
}

- (BOOL)shouldBeRequiredToFailByGestureRecognizer:(id)a3
{
  return objc_msgSend(a3, "_wantsGESEvents") ^ 1;
}

- (BOOL)_isAllowedToReceiveGESEvents
{
  return 1;
}

- (BOOL)_shouldReceiveTouch:(id)a3 withEvent:(id)a4
{
  char v4;
  unint64_t v5;
  NSObject *v7;
  uint8_t v8[16];

  v4 = objc_msgSend((id)UIApp, "_applicationWantsGESEvents", a3, a4);
  if ((v4 & 1) == 0)
  {
    v5 = _shouldReceiveTouch_withEvent____s_category;
    if (!_shouldReceiveTouch_withEvent____s_category)
    {
      v5 = __UILogCategoryGetNode("Gesture", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v5, (unint64_t *)&_shouldReceiveTouch_withEvent____s_category);
    }
    if ((*(_BYTE *)v5 & 1) != 0)
    {
      v7 = *(NSObject **)(v5 + 8);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_ERROR, "Disabling GES Gate because the application is not currently set to receive GES events", v8, 2u);
      }
    }
  }
  return v4;
}

- (BOOL)canBePreventedByGestureRecognizer:(id)a3
{
  return 0;
}

- (BOOL)canPreventGestureRecognizer:(id)a3
{
  return objc_msgSend(a3, "_wantsGESEvents") ^ 1;
}

- (BOOL)_validateTouchesFailingIfNeeded:(_BOOL8)result
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  unint64_t v8;
  NSObject *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t buf[136];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v2 = (void *)result;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v3 = a2;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, buf, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v11;
      while (2)
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v11 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "_hidEvent", (_QWORD)v10);
          if (IOHIDEventGetPhase() != 128)
          {

            objc_msgSend(v2, "setState:", 5);
            v8 = _validateTouchesFailingIfNeeded____s_category[0];
            if (!_validateTouchesFailingIfNeeded____s_category[0])
            {
              v8 = __UILogCategoryGetNode("Gesture", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
              atomic_store(v8, _validateTouchesFailingIfNeeded____s_category);
            }
            if ((*(_BYTE *)v8 & 1) != 0)
            {
              v9 = *(NSObject **)(v8 + 8);
              if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_ERROR, "Opening GES Gate due to receiving touches without phase (kIOHIDEventPhaseMayBegin)", buf, 2u);
              }
            }
            return objc_msgSend(v2, "state", (_QWORD)v10) == 5;
          }
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, buf, 16);
        if (v5)
          continue;
        break;
      }
    }

    return objc_msgSend(v2, "state", (_QWORD)v10) == 5;
  }
  return result;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  -[_UIGESGateGestureRecognizer _validateTouchesFailingIfNeeded:]((_BOOL8)self, a3);
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  -[_UIGESGateGestureRecognizer _validateTouchesFailingIfNeeded:]((_BOOL8)self, a3);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  void *v5;
  uint64_t v6;
  unint64_t v7;
  NSObject *v8;
  uint8_t v9[16];

  if (!-[_UIGESGateGestureRecognizer _validateTouchesFailingIfNeeded:]((_BOOL8)self, a3))
  {
    -[UIGestureRecognizer _allActiveTouches](self, "_allActiveTouches");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (!v6)
    {
      -[UIGestureRecognizer setState:](self, "setState:", 3);
      v7 = touchesEnded_withEvent____s_category_0;
      if (!touchesEnded_withEvent____s_category_0)
      {
        v7 = __UILogCategoryGetNode("Gesture", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v7, (unint64_t *)&touchesEnded_withEvent____s_category_0);
      }
      if ((*(_BYTE *)v7 & 1) != 0)
      {
        v8 = *(NSObject **)(v7 + 8);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v9 = 0;
          _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_ERROR, "Closing GES Gate because all touches ended with phase (kIOHIDEventPhaseMayBegin)", v9, 2u);
        }
      }
    }
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  void *v5;
  uint64_t v6;
  unint64_t v7;
  NSObject *v8;
  uint8_t v9[16];

  if (!-[_UIGESGateGestureRecognizer _validateTouchesFailingIfNeeded:]((_BOOL8)self, a3))
  {
    -[UIGestureRecognizer _allActiveTouches](self, "_allActiveTouches");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (!v6)
    {
      -[UIGestureRecognizer setState:](self, "setState:", 4);
      v7 = touchesCancelled_withEvent____s_category;
      if (!touchesCancelled_withEvent____s_category)
      {
        v7 = __UILogCategoryGetNode("Gesture", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v7, (unint64_t *)&touchesCancelled_withEvent____s_category);
      }
      if ((*(_BYTE *)v7 & 1) != 0)
      {
        v8 = *(NSObject **)(v7 + 8);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v9 = 0;
          _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_ERROR, "Opening GES Gate due to receiving touches cancelled", v9, 2u);
        }
      }
    }
  }
}

@end
