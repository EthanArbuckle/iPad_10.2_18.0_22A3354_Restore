@implementation SBDynamicFlashlightActivityElementViewController

- (void)dealloc
{
  objc_super v3;

  -[NSTimer invalidate](self->_persistenceTimer, "invalidate");
  -[NSTimer invalidate](self->_dismissalTimer, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SBDynamicFlashlightActivityElementViewController;
  -[SBDynamicFlashlightActivityElementViewController dealloc](&v3, sel_dealloc);
}

- (SBDynamicFlashlightActivityElementViewController)initWithOptionsProvider:(id)a3 state:(id)a4 fixedWidth:(BOOL)a5
{
  id v9;
  id v10;
  SBDynamicFlashlightActivityElementViewController *v11;
  SBDynamicFlashlightActivityElementViewController *v12;
  void *v13;
  uint64_t v14;
  SBFFluidBehaviorSettings *fluidBehaviorSettings;
  NSObject *v16;
  uint64_t v17;
  CGFloat v18;
  CGFloat v19;
  objc_super v21;

  v9 = a3;
  v10 = a4;
  v21.receiver = self;
  v21.super_class = (Class)SBDynamicFlashlightActivityElementViewController;
  v11 = -[SBDynamicFlashlightActivityElementViewController init](&v21, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_fixedWidth = a5;
    objc_storeStrong((id *)&v11->_optionsProvider, a3);
    objc_msgSend(v9, "springAnimationSettings");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "copy");
    fluidBehaviorSettings = v12->_fluidBehaviorSettings;
    v12->_fluidBehaviorSettings = (SBFFluidBehaviorSettings *)v14;

    -[SBFFluidBehaviorSettings setName:](v12->_fluidBehaviorSettings, "setName:", CFSTR("Dynamic Flashlight"));
    SBLogFlashlightHUD();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      -[SBDynamicFlashlightActivityElementViewController initWithOptionsProvider:state:fixedWidth:].cold.1((uint64_t)v10, v16, v17);

    -[SBDynamicFlashlightActivityElementViewController _beamStateForState:currentBeamState:](v12, "_beamStateForState:currentBeamState:", v10, 1.0, 1.0);
    v12->_torchState.x = v18;
    v12->_torchState.y = v19;
    v12->_persistedState = v12->_torchState;
  }

  return v12;
}

- (SBDynamicFlashlightActivityElementView)elementView
{
  SBDynamicFlashlightActivityElementView *elementView;
  SBDynamicFlashlightActivityElementView *v4;
  SBDynamicFlashlightActivityElementView *v5;

  elementView = self->_elementView;
  if (!elementView)
  {
    v4 = -[SBDynamicFlashlightActivityElementView initWithBeamState:optionsProvider:]([SBDynamicFlashlightActivityElementView alloc], "initWithBeamState:optionsProvider:", self->_optionsProvider, self->_torchState.x, self->_torchState.y);
    v5 = self->_elementView;
    self->_elementView = v4;

    elementView = self->_elementView;
  }
  return elementView;
}

- (void)updateOrientation
{
  -[SBDynamicFlashlightActivityElementView setSensorShadowHidden:](self->_elementView, "setSensorShadowHidden:", (unint64_t)(-[SBDynamicFlashlightActivityElementViewController elementOrientation](self, "elementOrientation")- 3) < 2);
}

- (void)setElementOrientation:(int64_t)a3
{
  if (self->_elementOrientation != a3)
  {
    self->_elementOrientation = a3;
    -[SBDynamicFlashlightActivityElementViewController updateOrientation](self, "updateOrientation");
  }
}

- (void)loadView
{
  void *v3;
  CGFloat v4;
  CGFloat v5;
  _SBDynamicFlashlightZeroDelayPanGestureRecognizer *v6;
  _SBDynamicFlashlightZeroDelayPanGestureRecognizer *panGestureRecognizer;
  CGFloat v8;
  CGFloat v9;

  -[SBDynamicFlashlightActivityElementViewController elementView](self, "elementView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBDynamicFlashlightActivityElementViewController setView:](self, "setView:", v3);

  -[SBDynamicFlashlightActivityElementView sizeThatFits:](self->_elementView, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  self->_preferredContentRect.origin.x = 0.0;
  self->_preferredContentRect.origin.y = 0.0;
  self->_preferredContentRect.size.width = v4;
  self->_preferredContentRect.size.height = v5;
  v6 = -[_SBDynamicFlashlightZeroDelayPanGestureRecognizer initWithTarget:action:]([_SBDynamicFlashlightZeroDelayPanGestureRecognizer alloc], "initWithTarget:action:", self, sel__panGestureHandler);
  panGestureRecognizer = self->_panGestureRecognizer;
  self->_panGestureRecognizer = v6;

  -[_SBDynamicFlashlightZeroDelayPanGestureRecognizer setName:](self->_panGestureRecognizer, "setName:", CFSTR("dynamicFlashlightPan"));
  -[_SBDynamicFlashlightZeroDelayPanGestureRecognizer _setHysteresis:](self->_panGestureRecognizer, "_setHysteresis:", 0.0);
  -[_SBDynamicFlashlightZeroDelayPanGestureRecognizer setDelegate:](self->_panGestureRecognizer, "setDelegate:", self);
  -[_SBDynamicFlashlightZeroDelayPanGestureRecognizer _setCanPanHorizontally:](self->_panGestureRecognizer, "_setCanPanHorizontally:", !self->_fixedWidth);
  -[SBDynamicFlashlightActivityElementView addGestureRecognizer:](self->_elementView, "addGestureRecognizer:", self->_panGestureRecognizer);
  -[SBDynamicFlashlightOptionsProvider gestureScaling](self->_optionsProvider, "gestureScaling");
  self->_gestureScaling.x = v8;
  self->_gestureScaling.y = v9;
}

- (void)viewIsAppearing:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBDynamicFlashlightActivityElementViewController;
  -[SBDynamicFlashlightActivityElementViewController viewIsAppearing:](&v4, sel_viewIsAppearing_, a3);
  -[SBDynamicFlashlightActivityElementViewController updateOrientation](self, "updateOrientation");
}

- (void)_animateUntracked:(id)a3 completion:(id)a4
{
  objc_msgSend(MEMORY[0x1E0CEABB0], "_animateUsingSpringBehavior:tracking:animations:completion:", self->_fluidBehaviorSettings, 0, a3, a4);
}

- (void)_animateTracked:(id)a3 completion:(id)a4
{
  objc_msgSend(MEMORY[0x1E0CEABB0], "_animateUsingSpringBehavior:tracking:animations:completion:", self->_fluidBehaviorSettings, 1, a3, a4);
}

- (CGPoint)_beamStateForState:(id)a3 currentBeamState:(CGPoint)a4
{
  CGFloat y;
  double x;
  id v7;
  double v8;
  id v9;
  double v10;
  double v11;
  SBDynamicFlashlightOptionsProvider *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  NSObject *v20;
  double v21;
  double v22;
  double v23;
  CGPoint result;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  v8 = 0.0;
  if (objc_msgSend(v7, "isOn"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = v7;
      objc_msgSend(v9, "initialIntensity");
      v11 = v10;
      v12 = self->_optionsProvider;
      -[SBDynamicFlashlightOptionsProvider minimumHWIntensity](v12, "minimumHWIntensity");
      v14 = v13;
      -[SBDynamicFlashlightOptionsProvider minimumIntensity](v12, "minimumIntensity");
      v16 = v15 + (v11 - v14) * (1.0 - v15) / (1.0 - v14);
      -[SBDynamicFlashlightOptionsProvider minimumIntensity](v12, "minimumIntensity");
      v18 = v17;

      v19 = fmax(v18, fmin(v16, 1.0));
      SBLogFlashlightHUD();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        -[SBDynamicFlashlightActivityElementViewController _beamStateForState:currentBeamState:].cold.1(v9, v20, v19);

      if (self->_fixedWidth)
        v21 = 0.95;
      else
        objc_msgSend(v9, "initialWidth");
      x = fmax(fmin(v21, 1.0), 0.0);
      v8 = fmax(fmin(v19, 1.0), 0.0);

    }
    else
    {
      v8 = y;
    }
  }

  v22 = x;
  v23 = v8;
  result.y = v23;
  result.x = v22;
  return result;
}

- (void)setState:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  CGPoint *p_torchState;
  double v8;
  CGFloat v9;
  double v10;
  double v11;
  double v12;
  _QWORD v13[5];

  v4 = a3;
  if (!-[SBDynamicFlashlightActivityElementViewController _hasActiveTouches](self, "_hasActiveTouches"))
  {
    SBLogFlashlightHUD();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[SBDynamicFlashlightActivityElementViewController setState:].cold.1((uint64_t)v4, v5, v6);

    p_torchState = &self->_torchState;
    -[SBDynamicFlashlightActivityElementViewController _beamStateForState:currentBeamState:](self, "_beamStateForState:currentBeamState:", v4, self->_torchState.x, self->_torchState.y);
    v9 = v8;
    v11 = v10;
    -[SBDynamicFlashlightOptionsProvider minimumIntensity](self->_optionsProvider, "minimumIntensity");
    if (v11 >= v12)
    {
      p_torchState->x = v9;
      self->_torchState.y = v11;
      -[SBDynamicFlashlightActivityElementViewController _invalidateDismissalTimer](self, "_invalidateDismissalTimer");
    }
    else if (-[SBDynamicFlashlightActivityElementViewController isBeamOn](self, "isBeamOn"))
    {
      -[SBDynamicFlashlightActivityElementViewController _saveTorchState](self, "_saveTorchState");
      p_torchState->x = v9;
      self->_torchState.y = 0.0;
      -[SBDynamicFlashlightActivityElementViewController _startDismissalTimer](self, "_startDismissalTimer");
    }
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __61__SBDynamicFlashlightActivityElementViewController_setState___block_invoke;
    v13[3] = &unk_1E8E9DED8;
    v13[4] = self;
    -[SBDynamicFlashlightActivityElementViewController _animateUntracked:completion:](self, "_animateUntracked:completion:", v13, 0);
  }

}

uint64_t __61__SBDynamicFlashlightActivityElementViewController_setState___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1112), "setBeamState:", *(double *)(*(_QWORD *)(a1 + 32) + 968), *(double *)(*(_QWORD *)(a1 + 32) + 976));
}

- (void)_toggleBeamState
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = (a1 & 1) == 0;
  _os_log_debug_impl(&dword_1D0540000, a2, OS_LOG_TYPE_DEBUG, "_toggleBeamState to: %{BOOL}i", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_4();
}

uint64_t __68__SBDynamicFlashlightActivityElementViewController__toggleBeamState__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1112), "setTouching:", 0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1112), "setBeamState:", *(double *)(*(_QWORD *)(a1 + 32) + 968), *(double *)(*(_QWORD *)(a1 + 32) + 976));
}

- (double)currentIntensity
{
  return self->_torchState.y;
}

- (double)currentWidth
{
  if (self->_fixedWidth)
    return 0.95;
  else
    return self->_torchState.x;
}

- (BOOL)isExpanded
{
  return self->_expanded;
}

- (void)setExpanded:(BOOL)a3
{
  _BOOL8 v3;
  double v5;
  double v6;
  double v7;
  id v8;

  if (self->_expanded != a3)
  {
    v3 = a3;
    self->_expanded = a3;
    -[SBDynamicFlashlightActivityElementViewController elementView](self, "elementView");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[SBDynamicFlashlightActivityElementViewController currentIntensity](self, "currentIntensity");
    v6 = v5;
    -[SBDynamicFlashlightActivityElementViewController currentWidth](self, "currentWidth");
    objc_msgSend(v8, "setExpanded:intensity:width:", v3, v6, v7);

  }
}

- (void)setPanEnabled:(BOOL)a3
{
  -[_SBDynamicFlashlightZeroDelayPanGestureRecognizer setEnabled:](self->_panGestureRecognizer, "setEnabled:", a3);
}

- (BOOL)isBeamOn
{
  double y;
  double v3;

  y = self->_torchState.y;
  -[SBDynamicFlashlightOptionsProvider minimumIntensity](self->_optionsProvider, "minimumIntensity");
  return y >= v3;
}

- (void)_saveTorchState
{
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  NSStringFromCGPoint(*a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412290;
  v7 = v4;
  OUTLINED_FUNCTION_0_1(&dword_1D0540000, a3, v5, "_saveTorchState: %@", (uint8_t *)&v6);

}

- (void)_startPersistenceTimer
{
  double y;
  double v4;
  void *v5;
  double v6;
  double v7;
  NSTimer *v8;
  NSTimer *persistenceTimer;
  NSTimer *v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  id location;

  y = self->_torchState.y;
  -[SBDynamicFlashlightOptionsProvider minimumIntensity](self->_optionsProvider, "minimumIntensity");
  if (y >= v4)
  {
    objc_initWeak(&location, self);
    -[NSTimer invalidate](self->_persistenceTimer, "invalidate");
    v5 = (void *)MEMORY[0x1E0C99E88];
    -[SBDynamicFlashlightOptionsProvider persistenceDelay](self->_optionsProvider, "persistenceDelay");
    v7 = v6;
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __74__SBDynamicFlashlightActivityElementViewController__startPersistenceTimer__block_invoke;
    v15 = &unk_1E8E9FA90;
    objc_copyWeak(&v16, &location);
    objc_msgSend(v5, "scheduledTimerWithTimeInterval:repeats:block:", 0, &v12, v7);
    v8 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    persistenceTimer = self->_persistenceTimer;
    self->_persistenceTimer = v8;

    v10 = self->_persistenceTimer;
    -[SBDynamicFlashlightOptionsProvider persistenceDelay](self->_optionsProvider, "persistenceDelay", v12, v13, v14, v15);
    -[NSTimer setTolerance:](v10, "setTolerance:", v11 * 0.05);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
}

void __74__SBDynamicFlashlightActivityElementViewController__startPersistenceTimer__block_invoke(uint64_t a1, void *a2)
{
  _QWORD *WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained && (id)WeakRetained[136] == v5)
    objc_msgSend(WeakRetained, "_saveTorchState");

}

- (void)_invalidatePersistenceTimer
{
  NSTimer *persistenceTimer;

  -[NSTimer invalidate](self->_persistenceTimer, "invalidate");
  persistenceTimer = self->_persistenceTimer;
  self->_persistenceTimer = 0;

}

- (void)_startDismissalTimer
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1D0540000, v0, v1, "Starting dismissal timer...", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __72__SBDynamicFlashlightActivityElementViewController__startDismissalTimer__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_dismissalTimerDidFire:", v3);

}

- (void)_dismissalTimerDidFire:(id)a3
{
  NSTimer *v4;
  NSObject *v5;
  NSObject *p_super;
  id WeakRetained;
  _BOOL4 v8;
  _DWORD v9[2];
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = (NSTimer *)a3;
  SBLogFlashlightHUD();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[SBDynamicFlashlightActivityElementViewController _dismissalTimerDidFire:].cold.1();

  if (self->_dismissalTimer == v4 && !-[SBDynamicFlashlightActivityElementViewController isBeamOn](self, "isBeamOn"))
  {
    self->_shouldDismissWhenOff = 1;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "dynamicFlashlightViewControllerShouldDismiss");

    p_super = &self->_dismissalTimer->super;
    self->_dismissalTimer = 0;
  }
  else
  {
    SBLogFlashlightHUD();
    p_super = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEBUG))
    {
      v8 = self->_dismissalTimer == v4;
      v9[0] = 67109376;
      v9[1] = v8;
      v10 = 1024;
      v11 = !-[SBDynamicFlashlightActivityElementViewController isBeamOn](self, "isBeamOn");
      _os_log_debug_impl(&dword_1D0540000, p_super, OS_LOG_TYPE_DEBUG, "Ignoring dismissal timer! Right timer? %{BOOL}i, Beam off? %{BOOL}i", (uint8_t *)v9, 0xEu);
    }
  }

}

- (void)_invalidateDismissalTimer
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1D0540000, v0, v1, "Invalidating dismissal timer", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  return 0;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __89__SBDynamicFlashlightActivityElementViewController_gestureRecognizer_shouldReceiveTouch___block_invoke;
  v5[3] = &unk_1E8E9DED8;
  v5[4] = self;
  -[SBDynamicFlashlightActivityElementViewController _animateTracked:completion:](self, "_animateTracked:completion:", v5, 0);
  return 1;
}

uint64_t __89__SBDynamicFlashlightActivityElementViewController_gestureRecognizer_shouldReceiveTouch___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1112), "setTouching:", 1);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1112), "setBeamState:", *(double *)(*(_QWORD *)(a1 + 32) + 968), *(double *)(*(_QWORD *)(a1 + 32) + 976));
}

- (BOOL)_hasActiveTouches
{
  return (unint64_t)(-[_SBDynamicFlashlightZeroDelayPanGestureRecognizer state](self->_panGestureRecognizer, "state")- 1) < 3;
}

- (void)_panGestureHandler
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1D0540000, v0, v1, "Panned beam to OFF, starting the timer", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

uint64_t __70__SBDynamicFlashlightActivityElementViewController__panGestureHandler__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1112), "setTouching:", 1);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1112), "setBeamState:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

uint64_t __70__SBDynamicFlashlightActivityElementViewController__panGestureHandler__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1112), "setTouching:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1112), "setBeamState:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 32), "_updatePreferredContentRectForUnconstrainedPoint:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

uint64_t __70__SBDynamicFlashlightActivityElementViewController__panGestureHandler__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __70__SBDynamicFlashlightActivityElementViewController__panGestureHandler__block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_updateDelegateStateAnimated:(BOOL)a3
{
  _BOOL8 v3;
  double v5;
  double x;
  double y;
  SBDynamicFlashlightOptionsProvider *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id WeakRetained;

  v3 = a3;
  v5 = 0.0;
  x = 0.0;
  if (-[SBDynamicFlashlightActivityElementViewController isBeamOn](self, "isBeamOn"))
  {
    y = self->_torchState.y;
    v8 = self->_optionsProvider;
    -[SBDynamicFlashlightOptionsProvider minimumIntensity](v8, "minimumIntensity");
    v10 = v9;
    -[SBDynamicFlashlightOptionsProvider minimumHWIntensity](v8, "minimumHWIntensity");
    x = 1.0;
    v12 = v11 + (y - v10) * (1.0 - v11) / (1.0 - v10);
    -[SBDynamicFlashlightOptionsProvider minimumHWIntensity](v8, "minimumHWIntensity");
    v14 = v13;

    v5 = fmax(v14, fmin(v12, 1.0));
    if (!self->_fixedWidth)
      x = self->_torchState.x;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "dynamicFlashlightViewControllerDidChangeIntensity:width:animated:", v3, v5, x);

}

- (void)_tapGestureHandler
{
  id v3;

  -[SBDynamicFlashlightActivityElementViewController _toggleBeamState](self, "_toggleBeamState");
  -[SBDynamicFlashlightActivityElementViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dynamicFlashlightViewControllerDidToggleFlashlight");

}

- (void)_updatePreferredContentRectForUnconstrainedPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  id v25;
  CGRect v26;

  y = a3.y;
  x = a3.x;
  -[SBDynamicFlashlightActivityElementViewController elementView](self, "elementView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));

  -[SBDynamicFlashlightOptionsProvider overshootClampFactor](self->_optionsProvider, "overshootClampFactor");
  v8 = v7;
  if (x >= 0.0)
  {
    if (x > 1.0)
      x = (v7 + 1.0 + -1.0) * tanh((x + -1.0) * 0.55 / (v7 + 1.0 + -1.0) + 0.0) + 1.0;
  }
  else
  {
    x = 0.0 - v7 + (0.0 - (0.0 - v7)) * (tanh((x - (0.0 - v7)) * 0.55 / (0.0 - (0.0 - v7)) + -0.55) + 1.0);
  }
  if (y >= 0.0)
  {
    if (y > 1.0)
      y = (v8 + 1.0 + -1.0) * tanh((y + -1.0) * 0.55 / (v8 + 1.0 + -1.0) + 0.0) + 1.0;
  }
  else
  {
    y = 0.0 - v8 + (0.0 - (0.0 - v8)) * (tanh((y - (0.0 - v8)) * 0.55 / (0.0 - (0.0 - v8)) + -0.55) + 1.0);
  }
  -[SBDynamicFlashlightActivityElementViewController _overshootForNormalized:](self, "_overshootForNormalized:", y);
  v10 = v9;
  -[SBDynamicFlashlightActivityElementViewController _overshootForNormalized:](self, "_overshootForNormalized:", x);
  if (v10 == 0.0 && v11 == 0.0)
  {
    SBRectWithSize();
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;
  }
  else
  {
    -[SBDynamicFlashlightOptionsProvider heightStretchFactor](self->_optionsProvider, "heightStretchFactor");
    -[SBDynamicFlashlightOptionsProvider widthStretchFactor](self->_optionsProvider, "widthStretchFactor");
    -[SBDynamicFlashlightActivityElementViewController traitCollection](self, "traitCollection");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "displayScale");
    UIRectRoundToScale();
    v13 = v21;
    v15 = v22;
    v17 = v23;
    v19 = v24;

  }
  v26.origin.x = v13;
  v26.origin.y = v15;
  v26.size.width = v17;
  v26.size.height = v19;
  if (!CGRectEqualToRect(self->_preferredContentRect, v26))
  {
    self->_preferredContentRect.origin.x = v13;
    self->_preferredContentRect.origin.y = v15;
    self->_preferredContentRect.size.width = v17;
    self->_preferredContentRect.size.height = v19;
    -[SBDynamicFlashlightActivityElementViewController delegate](self, "delegate");
    v25 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "dynamicFlashlightViewControllerDidChangePreferredContentRect");

  }
}

- (double)_overshootForNormalized:(double)a3
{
  double v3;

  if (a3 < 0.0)
    return a3;
  v3 = 0.0;
  if (a3 > 1.0)
    return a3 + -1.0;
  return v3;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_accessibilitySetTorchState:(CGPoint)a3
{
  uint64_t v4;
  _QWORD v5[5];

  v4 = MEMORY[0x1E0C809B0];
  self->_torchState.x = fmax(fmin(a3.x, 1.0), 0.0);
  self->_torchState.y = fmax(fmin(a3.y, 1.0), 0.0);
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __80__SBDynamicFlashlightActivityElementViewController__accessibilitySetTorchState___block_invoke;
  v5[3] = &unk_1E8E9DED8;
  v5[4] = self;
  -[SBDynamicFlashlightActivityElementViewController _animateUntracked:completion:](self, "_animateUntracked:completion:", v5, 0);
  -[SBDynamicFlashlightActivityElementViewController _updateDelegateStateAnimated:](self, "_updateDelegateStateAnimated:", 1);
}

uint64_t __80__SBDynamicFlashlightActivityElementViewController__accessibilitySetTorchState___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1112), "setBeamState:", *(double *)(*(_QWORD *)(a1 + 32) + 968), *(double *)(*(_QWORD *)(a1 + 32) + 976));
}

- (BOOL)shouldDismissWhenOff
{
  return self->_shouldDismissWhenOff;
}

- (void)setElementView:(id)a3
{
  objc_storeStrong((id *)&self->_elementView, a3);
}

- (SBDynamicFlashlightActivityElementViewControllerDelegate)delegate
{
  return (SBDynamicFlashlightActivityElementViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)elementOrientation
{
  return self->_elementOrientation;
}

- (CGRect)preferredContentRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_preferredContentRect.origin.x;
  y = self->_preferredContentRect.origin.y;
  width = self->_preferredContentRect.size.width;
  height = self->_preferredContentRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_elementView, 0);
  objc_storeStrong((id *)&self->_dismissalTimer, 0);
  objc_storeStrong((id *)&self->_persistenceTimer, 0);
  objc_storeStrong((id *)&self->_gestureStartTime, 0);
  objc_storeStrong((id *)&self->_panGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_fluidBehaviorSettings, 0);
  objc_storeStrong((id *)&self->_optionsProvider, 0);
}

- (void)initWithOptionsProvider:(uint64_t)a1 state:(NSObject *)a2 fixedWidth:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_1(&dword_1D0540000, a2, a3, "VC: Initial state %@", (uint8_t *)&v3);
}

- (void)_beamStateForState:(double)a3 currentBeamState:.cold.1(void *a1, NSObject *a2, double a3)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  double v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "initialIntensity");
  v6 = 134218240;
  v7 = v5;
  v8 = 2048;
  v9 = a3;
  _os_log_debug_impl(&dword_1D0540000, a2, OS_LOG_TYPE_DEBUG, "VC: Converted Intensity from HW %0.3f -> View %0.3f", (uint8_t *)&v6, 0x16u);
}

- (void)setState:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_1(&dword_1D0540000, a2, a3, "setState: %@", (uint8_t *)&v3);
}

- (void)_dismissalTimerDidFire:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1D0540000, v0, v1, "Dismissal timer fired!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
