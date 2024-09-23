@implementation _UIHomeAffordanceGateGestureRecognizer

+ (uint64_t)isAvailable
{
  uint64_t result;

  objc_opt_self();
  result = _os_feature_enabled_impl();
  if ((_DWORD)result)
    return _UIDeviceSupportsGlobalEdgeSwipeTouches();
  return result;
}

- (_UIHomeAffordanceGateGestureRecognizer)init
{
  void *v5;
  objc_super v6;

  objc_opt_self();
  if (!_os_feature_enabled_impl() || (_UIDeviceSupportsGlobalEdgeSwipeTouches() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIHomeAffordanceGateGestureRecognizer.m"), 43, CFSTR("Home affordance gate feature is disabled."));

  }
  v6.receiver = self;
  v6.super_class = (Class)_UIHomeAffordanceGateGestureRecognizer;
  return -[UIGestureRecognizer initWithTarget:action:](&v6, sel_initWithTarget_action_, 0, 0);
}

- (id)name
{
  return CFSTR("com.apple.UIKit.HomeAffordanceGate");
}

- (void)reset
{
  BSAbsoluteMachTimer *timeoutTimer;

  -[UITapRecognizer _reset](self->_tapRecognizer, "_reset");
  self->_didReceiveTouch = 0;
  -[BSAbsoluteMachTimer invalidate](self->_timeoutTimer, "invalidate");
  timeoutTimer = self->_timeoutTimer;
  self->_timeoutTimer = 0;

}

- (void)setState:(int64_t)a3
{
  void *v6;
  objc_super v7;

  if ((unint64_t)a3 > 5 || ((1 << a3) & 0x29) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIHomeAffordanceGateGestureRecognizer.m"), 62, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("state == UIGestureRecognizerStatePossible || state == UIGestureRecognizerStateEnded || state == UIGestureRecognizerStateFailed"));

  }
  -[BSAbsoluteMachTimer cancel](self->_timeoutTimer, "cancel");
  v7.receiver = self;
  v7.super_class = (Class)_UIHomeAffordanceGateGestureRecognizer;
  -[UIGestureRecognizer setState:](&v7, sel_setState_, a3);
}

- (void)setView:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  _UIInvalidatable *homeAffordanceObserver;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _UIInvalidatable *v13;
  _UIInvalidatable *v14;
  objc_super v15;

  -[UIGestureRecognizer view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15.receiver = self;
  v15.super_class = (Class)_UIHomeAffordanceGateGestureRecognizer;
  -[UIGestureRecognizer setView:](&v15, sel_setView_, a3);
  castToWindow(a3);
  objc_claimAutoreleasedReturnValue();
  castToWindow(v5);
  objc_claimAutoreleasedReturnValue();
  if (self)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObserver:name:object:", self, 0x1E1764CC0, v5);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObserver:name:object:", self, CFSTR("_UIWindowWillMoveToNilSceneNotification"), v5);

    homeAffordanceObserver = self->_homeAffordanceObserver;
    self->_homeAffordanceObserver = 0;

    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObserver:selector:name:object:", self, sel__windowDidMoveToScene_, 0x1E1764CC0, a3);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObserver:selector:name:object:", self, sel__windowDidMoveToNilScene_, CFSTR("_UIWindowWillMoveToNilSceneNotification"), a3);

      objc_msgSend(a3, "windowScene");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "_homeAffordanceSceneNotifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "registerHomeAffordanceObserver:inWindow:", self, a3);
      v13 = (_UIInvalidatable *)objc_claimAutoreleasedReturnValue();
      v14 = self->_homeAffordanceObserver;
      self->_homeAffordanceObserver = v13;

    }
  }

}

- (BOOL)shouldBeRequiredToFailByGestureRecognizer:(id)a3
{
  return 1;
}

- (BOOL)canBePreventedByGestureRecognizer:(id)a3
{
  return 0;
}

- (BOOL)_isAllowedToReceiveGESEvents
{
  return 1;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  void *v7;
  CGFloat v8;
  CGFloat v9;
  _BOOL4 v10;
  unint64_t v11;
  UITapRecognizer *tapRecognizer;
  UITapRecognizer *v13;
  UITapRecognizer *v14;
  void *v15;
  CGFloat v16;
  CGFloat v17;
  BOOL v18;
  unint64_t v19;
  NSObject *v20;
  const char *v21;
  unint64_t v22;
  unint64_t v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  _QWORD v31[2];
  uint8_t buf[4];
  _UIHomeAffordanceGateGestureRecognizer *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;
  CGPoint v37;
  CGPoint v38;

  v36 = *MEMORY[0x1E0C80C00];
  if (self->_didReceiveTouch
    || objc_msgSend(a3, "count") != 1
    || (objc_msgSend(a3, "anyObject"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v7, "_locationInSceneReferenceSpace"),
        v37.x = v8,
        v37.y = v9,
        v10 = CGRectContainsPoint(self->_homeAffordanceFrame, v37),
        v7,
        !v10))
  {
    objc_msgSend(a3, "anyObject", a3, a4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_locationInSceneReferenceSpace");
    v38.x = v16;
    v38.y = v17;
    v18 = CGRectContainsPoint(self->_homeAffordanceFrame, v38);

    if (v18)
    {
      if (self->_didReceiveTouch)
      {
        v19 = qword_1ECD7AB58;
        if (!qword_1ECD7AB58)
        {
          v19 = __UILogCategoryGetNode("HomeAffordanceGestureGate", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v19, (unint64_t *)&qword_1ECD7AB58);
        }
        if ((*(_BYTE *)v19 & 1) == 0)
          goto LABEL_20;
        v20 = *(NSObject **)(v19 + 8);
        if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          goto LABEL_20;
        *(_DWORD *)buf = 134217984;
        v33 = self;
        v21 = "<%p> home affordance gate received the second touch";
      }
      else
      {
        if ((unint64_t)objc_msgSend(a3, "count") < 2)
          goto LABEL_20;
        v23 = qword_1ECD7AB60;
        if (!qword_1ECD7AB60)
        {
          v23 = __UILogCategoryGetNode("HomeAffordanceGestureGate", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v23, (unint64_t *)&qword_1ECD7AB60);
        }
        if ((*(_BYTE *)v23 & 1) == 0)
          goto LABEL_20;
        v20 = *(NSObject **)(v23 + 8);
        if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          goto LABEL_20;
        *(_DWORD *)buf = 134217984;
        v33 = self;
        v21 = "<%p> home affordance gate received too many simultaneous touches";
      }
    }
    else
    {
      v22 = qword_1ECD7AB50;
      if (!qword_1ECD7AB50)
      {
        v22 = __UILogCategoryGetNode("HomeAffordanceGestureGate", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v22, (unint64_t *)&qword_1ECD7AB50);
      }
      if ((*(_BYTE *)v22 & 1) == 0)
        goto LABEL_20;
      v20 = *(NSObject **)(v22 + 8);
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        goto LABEL_20;
      *(_DWORD *)buf = 134217984;
      v33 = self;
      v21 = "<%p> home affordance gate received touch outside of target region";
    }
    _os_log_impl(&dword_185066000, v20, OS_LOG_TYPE_ERROR, v21, buf, 0xCu);
LABEL_20:
    -[_UIHomeAffordanceGateGestureRecognizer setState:](self, "setState:", 5);
    return;
  }
  v11 = _MergedGlobals_5_8;
  if (!_MergedGlobals_5_8)
  {
    v11 = __UILogCategoryGetNode("HomeAffordanceGestureGate", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v11, (unint64_t *)&_MergedGlobals_5_8);
  }
  if ((*(_BYTE *)v11 & 1) != 0)
  {
    v24 = *(NSObject **)(v11 + 8);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v25 = (void *)MEMORY[0x1E0CB3B18];
      v26 = v24;
      objc_msgSend(a3, "anyObject");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "_locationInSceneReferenceSpace");
      v31[0] = v28;
      v31[1] = v29;
      objc_msgSend(v25, "valueWithBytes:objCType:", v31, "{CGPoint=dd}");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v33 = self;
      v34 = 2112;
      v35 = v30;
      _os_log_impl(&dword_185066000, v26, OS_LOG_TYPE_ERROR, "<%p> home affordance gate received the first touch in region: %@", buf, 0x16u);

    }
  }
  self->_didReceiveTouch = 1;
  tapRecognizer = self->_tapRecognizer;
  if (!tapRecognizer)
  {
    v13 = (UITapRecognizer *)objc_opt_new();
    v14 = self->_tapRecognizer;
    self->_tapRecognizer = v13;

    -[UITapRecognizer setDelegate:](self->_tapRecognizer, "setDelegate:", self);
    tapRecognizer = self->_tapRecognizer;
  }
  -[UITapRecognizer touchesBegan:withEvent:](tapRecognizer, "touchesBegan:withEvent:", a3, a4);
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  -[UITapRecognizer touchesMoved:withEvent:](self->_tapRecognizer, "touchesMoved:withEvent:", a3, a4);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  -[UITapRecognizer touchesEnded:withEvent:](self->_tapRecognizer, "touchesEnded:withEvent:", a3, a4);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  -[UITapRecognizer touchesCancelled:withEvent:](self->_tapRecognizer, "touchesCancelled:withEvent:", a3, a4);
}

- (double)_touchSloppinessFactor
{
  void *v2;
  double v3;
  double v4;

  -[UIGestureRecognizer view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_touchSloppinessFactor");
  v4 = v3;

  return v4;
}

- (BOOL)tapIsPossibleForTapRecognizer:(id)a3
{
  return 1;
}

- (void)tapRecognizerFailedToRecognizeTap:(id)a3
{
  unint64_t v4;
  NSObject *v5;
  int v6;
  _UIHomeAffordanceGateGestureRecognizer *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = tapRecognizerFailedToRecognizeTap____s_category;
  if (!tapRecognizerFailedToRecognizeTap____s_category)
  {
    v4 = __UILogCategoryGetNode("HomeAffordanceGestureGate", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v4, (unint64_t *)&tapRecognizerFailedToRecognizeTap____s_category);
  }
  if ((*(_BYTE *)v4 & 1) != 0)
  {
    v5 = *(NSObject **)(v4 + 8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 134217984;
      v7 = self;
      _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_ERROR, "<%p> Home affordance gate failed to recognize tap.", (uint8_t *)&v6, 0xCu);
    }
  }
  -[_UIHomeAffordanceGateGestureRecognizer setState:](self, "setState:", 5);
}

- (void)tapRecognizerRecognizedTap:(id)a3
{
  int has_internal_diagnostics;
  BSAbsoluteMachTimer *timeoutTimer;
  BSAbsoluteMachTimer *v6;
  BSAbsoluteMachTimer *v7;
  BSAbsoluteMachTimer *v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  unint64_t v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  id location[2];

  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  timeoutTimer = self->_timeoutTimer;
  if (has_internal_diagnostics)
  {
    if (timeoutTimer)
    {
      __UIFaultDebugAssertLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      {
        LOWORD(location[0]) = 0;
        _os_log_fault_impl(&dword_185066000, v11, OS_LOG_TYPE_FAULT, "The timer must not run at this point", (uint8_t *)location, 2u);
      }

    }
  }
  else if (timeoutTimer)
  {
    v12 = tapRecognizerRecognizedTap____s_category;
    if (!tapRecognizerRecognizedTap____s_category)
    {
      v12 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v12, (unint64_t *)&tapRecognizerRecognizedTap____s_category);
    }
    v13 = *(NSObject **)(v12 + 8);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_185066000, v13, OS_LOG_TYPE_ERROR, "The timer must not run at this point", (uint8_t *)location, 2u);
    }
  }
  v6 = (BSAbsoluteMachTimer *)objc_msgSend(objc_alloc(MEMORY[0x1E0D01690]), "initWithIdentifier:", CFSTR("com.apple.UIKit.HomeAffordanceGateTimer"));
  v7 = self->_timeoutTimer;
  self->_timeoutTimer = v6;

  objc_initWeak(location, self);
  v8 = self->_timeoutTimer;
  v9 = MEMORY[0x1E0C80D38];
  v10 = MEMORY[0x1E0C80D38];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __69___UIHomeAffordanceGateGestureRecognizer_tapRecognizerRecognizedTap___block_invoke;
  v14[3] = &unk_1E16CCA18;
  objc_copyWeak(&v15, location);
  -[BSAbsoluteMachTimer scheduleWithFireInterval:leewayInterval:queue:handler:](v8, "scheduleWithFireInterval:leewayInterval:queue:handler:", v9, v14, 0.5, 0.0);

  objc_destroyWeak(&v15);
  objc_destroyWeak(location);
}

- (void)_notifier:(id)a3 homeAffordanceFrameDidChange:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  unint64_t v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  _QWORD v14[4];
  uint8_t buf[4];
  _UIHomeAffordanceGateGestureRecognizer *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v19 = *MEMORY[0x1E0C80C00];
  v9 = _notifier_homeAffordanceFrameDidChange____s_category_0;
  if (!_notifier_homeAffordanceFrameDidChange____s_category_0)
  {
    v9 = __UILogCategoryGetNode("HomeAffordanceGestureGate", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v9, (unint64_t *)&_notifier_homeAffordanceFrameDidChange____s_category_0);
  }
  if ((*(_BYTE *)v9 & 1) != 0)
  {
    v10 = *(NSObject **)(v9 + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = (void *)MEMORY[0x1E0CB3B18];
      *(CGFloat *)v14 = x;
      *(CGFloat *)&v14[1] = y;
      *(CGFloat *)&v14[2] = width;
      *(CGFloat *)&v14[3] = height;
      v12 = v10;
      objc_msgSend(v11, "valueWithBytes:objCType:", v14, "{CGRect={CGPoint=dd}{CGSize=dd}}");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v16 = self;
      v17 = 2112;
      v18 = v13;
      _os_log_impl(&dword_185066000, v12, OS_LOG_TYPE_ERROR, "<%p> Home affordance frame updated: %@", buf, 0x16u);

    }
  }
  self->_homeAffordanceFrame.origin.x = x;
  self->_homeAffordanceFrame.origin.y = y;
  self->_homeAffordanceFrame.size.width = width;
  self->_homeAffordanceFrame.size.height = height;
}

- (void)_notifier:(id)a3 homeAffordanceDoubleTapGestureDidSucceed:(BOOL)a4
{
  _BOOL8 v4;
  unint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  _UIHomeAffordanceGateGestureRecognizer *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v4 = a4;
  v16 = *MEMORY[0x1E0C80C00];
  v6 = _notifier_homeAffordanceDoubleTapGestureDidSucceed____s_category_0;
  if (!_notifier_homeAffordanceDoubleTapGestureDidSucceed____s_category_0)
  {
    v6 = __UILogCategoryGetNode("HomeAffordanceGestureGate", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v6, (unint64_t *)&_notifier_homeAffordanceDoubleTapGestureDidSucceed____s_category_0);
  }
  if ((*(_BYTE *)v6 & 1) != 0)
  {
    v8 = *(NSObject **)(v6 + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = (void *)MEMORY[0x1E0CB37E8];
      v10 = v8;
      objc_msgSend(v9, "numberWithBool:", v4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 134218242;
      v13 = self;
      v14 = 2112;
      v15 = v11;
      _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_ERROR, "<%p> Home affordance double tap did succeed: %@", (uint8_t *)&v12, 0x16u);

    }
  }
  if (v4)
    v7 = 3;
  else
    v7 = 5;
  -[_UIHomeAffordanceGateGestureRecognizer setState:](self, "setState:", v7);
}

- (void)_windowDidMoveToScene:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _UIInvalidatable *v9;
  _UIInvalidatable *homeAffordanceObserver;
  void *v11;
  id v12;
  void *v13;
  objc_class *v14;
  void *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  objc_class *v19;
  void *v20;
  __CFString *v21;
  id v22;

  objc_msgSend(a3, "object");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  -[UIGestureRecognizer view](self, "view");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v22;
  if (v22 != v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v22;
    if (v12)
    {
      v13 = (void *)MEMORY[0x1E0CB3940];
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", CFSTR("<%@: %p>"), v15, v12);
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v16 = CFSTR("(nil)");
    }

    objc_msgSend(v12, "windowScene");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v18 = (void *)MEMORY[0x1E0CB3940];
      v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringWithFormat:", CFSTR("<%@: %p>"), v20, v17);
      v21 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v21 = CFSTR("(nil)");
    }
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIHomeAffordanceGateGestureRecognizer.m"), 197, CFSTR("Window scene notification is out of sync with home affordance gate: %@; window; %@; windowScene: %@;"),
      self,
      v16,
      v21);

    v6 = v22;
  }
  objc_msgSend(v6, "windowScene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_homeAffordanceSceneNotifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "registerHomeAffordanceObserver:inWindow:", self, v22);
  v9 = (_UIInvalidatable *)objc_claimAutoreleasedReturnValue();
  homeAffordanceObserver = self->_homeAffordanceObserver;
  self->_homeAffordanceObserver = v9;

}

- (void)_windowDidMoveToNilScene:(id)a3
{
  _UIInvalidatable *homeAffordanceObserver;

  homeAffordanceObserver = self->_homeAffordanceObserver;
  self->_homeAffordanceObserver = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeAffordanceObserver, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_tapRecognizer, 0);
}

@end
