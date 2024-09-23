@implementation SBSystemApertureProximityBacklightPolicy

- (SBSystemApertureProximityBacklightPolicy)initWithConfiguration:(id)a3
{
  id v4;
  SBSystemApertureProximityBacklightPolicy *v5;
  uint64_t v6;
  SBHIDUISensorModeController *sensorModeController;
  uint64_t v8;
  SBProximitySettings *proximitySettings;
  uint64_t v10;
  SBSystemGestureManager *systemGestureManager;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SBSystemApertureProximityBacklightPolicy;
  v5 = -[SBDefaultProximityBacklightPolicy initWithConfiguration:](&v13, sel_initWithConfiguration_, v4);
  if (v5)
  {
    objc_msgSend(v4, "sensorModeController");
    v6 = objc_claimAutoreleasedReturnValue();
    sensorModeController = v5->_sensorModeController;
    v5->_sensorModeController = (SBHIDUISensorModeController *)v6;

    objc_msgSend(v4, "proximitySettings");
    v8 = objc_claimAutoreleasedReturnValue();
    proximitySettings = v5->_proximitySettings;
    v5->_proximitySettings = (SBProximitySettings *)v8;

    objc_msgSend(v4, "systemGestureManager");
    v10 = objc_claimAutoreleasedReturnValue();
    systemGestureManager = v5->_systemGestureManager;
    v5->_systemGestureManager = (SBSystemGestureManager *)v10;

    BKSHIDServicesSetObjectInProximityIgnoresTouches();
  }

  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[BSInvalidatable invalidate](self->_suppressSystemGestures, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SBSystemApertureProximityBacklightPolicy;
  -[SBDefaultProximityBacklightPolicy dealloc](&v3, sel_dealloc);
}

- (void)proximitySensorManager:(id)a3 objectWithinProximityDidChange:(BOOL)a4
{
  -[SBSystemApertureProximityBacklightPolicy proximitySensorManager:objectWithinProximityDidChange:detectionMode:](self, "proximitySensorManager:objectWithinProximityDidChange:detectionMode:", a3, a4, 3);
}

- (void)proximitySensorManager:(id)a3 shouldSuppressBacklightChanges:(BOOL)a4
{
  self->_suppressBacklightChanges = a4;
}

- (double)_nontelephonyTouchAllowanceGracePeriod
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  double v7;
  double v8;

  objc_msgSend(MEMORY[0x1E0D00D58], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sensorCharacteristics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "suggestedSystemApertureGracePeriodForScreenOff");
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[SBSystemApertureProximityBacklightPolicy _proximitySettings](self, "_proximitySettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "nonTelephonyTouchAllowanceGracePeriodDuration");
    v8 = v7;

  }
  else
  {
    v8 = (double)v5 / 1000.0;
  }

  return v8;
}

- (void)proximitySensorManager:(id)a3 objectWithinProximityDidChange:(BOOL)a4 detectionMode:(int)a5
{
  _BOOL8 v6;
  id v8;
  BOOL v9;
  NSObject *v10;
  void *v11;
  NSTimer *touchAllowanceGracePeriodTimer;
  double v13;
  double v14;
  BOOL v15;
  char v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  NSTimer *v20;
  NSTimer *v21;
  _QWORD v22[4];
  id v23;
  id v24[2];
  id from;
  id location;
  uint8_t buf[4];
  _DWORD v28[7];

  v6 = a4;
  *(_QWORD *)&v28[5] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = !self->_suppressBacklightChanges || !v6;
  if (v9 || self->_objectThatCanPreventTouchesInProximity)
  {
    if (self->_objectInProximityAccordingToProxManager != v6)
    {
      self->_objectInProximityAccordingToProxManager = v6;
      if (self->_touchAllowanceGracePeriodTimer)
      {
        SBLogProximitySensor();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          NSStringFromBKSHIDServicesProximityDetectionMode();
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 67109378;
          v28[0] = v6;
          LOWORD(v28[1]) = 2114;
          *(_QWORD *)((char *)&v28[1] + 2) = v11;
          _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, "Canceling grace period due to incoming event (objectInProximity:%{BOOL}u mode:%{public}@)", buf, 0x12u);

        }
        -[NSTimer invalidate](self->_touchAllowanceGracePeriodTimer, "invalidate");
        touchAllowanceGracePeriodTimer = self->_touchAllowanceGracePeriodTimer;
        self->_touchAllowanceGracePeriodTimer = 0;

      }
      -[SBSystemApertureProximityBacklightPolicy _nontelephonyTouchAllowanceGracePeriod](self, "_nontelephonyTouchAllowanceGracePeriod");
      if (v6
        && (v14 = v13, v13 > 0.0)
        && ((v15 = -[SBSystemApertureProximityBacklightPolicy _isGracePeriodDisabledByEntitledApp](self, "_isGracePeriodDisabledByEntitledApp"), a5 != 6)? (v16 = 1): (v16 = v15), (v16 & 1) == 0))
      {
        objc_initWeak(&location, self);
        objc_initWeak(&from, v8);
        SBLogProximitySensor();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          *(double *)v28 = v14;
          _os_log_impl(&dword_1D0540000, v18, OS_LOG_TYPE_DEFAULT, "Scheduling grace period (%gs)", buf, 0xCu);
        }

        v19 = (void *)MEMORY[0x1E0C99E88];
        v22[0] = MEMORY[0x1E0C809B0];
        v22[1] = 3221225472;
        v22[2] = __112__SBSystemApertureProximityBacklightPolicy_proximitySensorManager_objectWithinProximityDidChange_detectionMode___block_invoke;
        v22[3] = &unk_1E8EBC8A8;
        objc_copyWeak(&v23, &location);
        v24[1] = *(id *)&v14;
        objc_copyWeak(v24, &from);
        objc_msgSend(v19, "scheduledTimerWithTimeInterval:repeats:block:", 0, v22, v14);
        v20 = (NSTimer *)objc_claimAutoreleasedReturnValue();
        v21 = self->_touchAllowanceGracePeriodTimer;
        self->_touchAllowanceGracePeriodTimer = v20;

        objc_destroyWeak(v24);
        objc_destroyWeak(&v23);
        objc_destroyWeak(&from);
        objc_destroyWeak(&location);
      }
      else
      {
        -[SBSystemApertureProximityBacklightPolicy _objectThatCanPreventTouchesWithinProximityDidChange:fromGracePeriod:](self, "_objectThatCanPreventTouchesWithinProximityDidChange:fromGracePeriod:", v6, 0);
      }
    }
  }
  else
  {
    SBLogProximitySensor();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v17, OS_LOG_TYPE_DEFAULT, "Suppresing prox -- backlight change suppression is active", buf, 2u);
    }

  }
}

void __112__SBSystemApertureProximityBacklightPolicy_proximitySensorManager_objectWithinProximityDidChange_detectionMode___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  id v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && objc_msgSend(v3, "isValid"))
  {
    SBLogProximitySensor();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 48);
      v9 = 134217984;
      v10 = v6;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Grace period finished (%gs)", (uint8_t *)&v9, 0xCu);
    }

    v7 = (void *)WeakRetained[12];
    WeakRetained[12] = 0;

    v8 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "_objectThatCanPreventTouchesWithinProximityDidChange:fromGracePeriod:", objc_msgSend(v8, "isObjectInProximity"), 1);

  }
}

- (void)_objectThatCanPreventTouchesWithinProximityDidChange:(BOOL)a3 fromGracePeriod:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  void *v7;
  _SBSystemApertureProximityTouchHandlingView *WeakRetained;
  _SBSystemApertureProximityTouchHandlingView *v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  double v18;
  SBSystemApertureProximityBacklightPolicy *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  double v24;
  double v25;
  NSObject *v26;
  int v27;
  double v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (self->_objectThatCanPreventTouchesInProximity != a3)
  {
    v4 = a4;
    v5 = a3;
    -[SBSystemApertureProximityBacklightPolicy delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = (_SBSystemApertureProximityTouchHandlingView *)objc_loadWeakRetained((id *)&self->_touchTrackingView);
    v9 = (_SBSystemApertureProximityTouchHandlingView *)objc_loadWeakRetained((id *)&self->_touchBlockingView);
    self->_objectThatCanPreventTouchesInProximity = v5;
    -[SBSystemApertureProximityBacklightPolicy _proximitySettings](self, "_proximitySettings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "allowTouchesInJindoWhenObjectInProximity");

    if (v5)
    {
      if (!WeakRetained)
        WeakRetained = -[_SBSystemApertureProximityTouchHandlingView initWithDelegate:hitTestsAsOpaque:]([_SBSystemApertureProximityTouchHandlingView alloc], "initWithDelegate:hitTestsAsOpaque:", self, v11 ^ 1u);
      -[SBSystemApertureProximityBacklightPolicy _proximitySettings](self, "_proximitySettings");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "colorScreenEdgeWhenObjectInProximity");

      if (v13)
      {
        -[_SBSystemApertureProximityTouchHandlingView layer](WeakRetained, "layer");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CEA478], "systemYellowColor");
        v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v14, "setBorderColor:", objc_msgSend(v15, "CGColor"));

        -[_SBSystemApertureProximityTouchHandlingView layer](WeakRetained, "layer");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setBorderWidth:", 3.0);

      }
      if (!v9)
        v9 = -[_SBSystemApertureProximityTouchHandlingView initWithDelegate:hitTestsAsOpaque:]([_SBSystemApertureProximityTouchHandlingView alloc], "initWithDelegate:hitTestsAsOpaque:", self, 1);
      objc_storeWeak((id *)&self->_touchTrackingView, WeakRetained);
      objc_storeWeak((id *)&self->_touchBlockingView, v9);
      objc_msgSend(v7, "systemApertureProximityBacklightPolicy:embedProximityTouchTrackingView:touchBlockingView:", self, WeakRetained, v9);
      if (v4)
      {
        SBLogProximitySensor();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v27) = 0;
          _os_log_impl(&dword_1D0540000, v17, OS_LOG_TYPE_DEFAULT, "Scheduling backlight factor to zero immediately because we already spent time on the grace period.", (uint8_t *)&v27, 2u);
        }

        -[SBSystemApertureProximityBacklightPolicy _startCancelingTouches](self, "_startCancelingTouches");
        v18 = 0.0;
        v19 = self;
LABEL_23:
        -[SBDefaultProximityBacklightPolicy _scheduleBacklightFactorToZeroAfterDebounceDuration:](v19, "_scheduleBacklightFactorToZeroAfterDebounceDuration:", v18);
        goto LABEL_24;
      }
      if (objc_msgSend(v7, "systemApertureProximityBacklightPolicyShouldConsiderSystemApertureInert:", self))
      {
        SBLogProximitySensor();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v27) = 0;
          _os_log_impl(&dword_1D0540000, v22, OS_LOG_TYPE_DEFAULT, "Scheduling backlight factor to zero after default duration (0.5s) because System Aperture is inert.", (uint8_t *)&v27, 2u);
        }

        -[SBSystemApertureProximityBacklightPolicy _startCancelingTouches](self, "_startCancelingTouches");
        -[SBDefaultProximityBacklightPolicy _scheduleBacklightFactorToZeroAfterDefaultDuration](self, "_scheduleBacklightFactorToZeroAfterDefaultDuration");
        goto LABEL_24;
      }
      -[SBSystemApertureProximityBacklightPolicy _proximitySettings](self, "_proximitySettings");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "initialBacklightDebounceDuration");
      v25 = v24;

      if (BSFloatGreaterThanFloat())
      {
        SBLogProximitySensor();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          v27 = 134217984;
          v28 = v25;
          _os_log_impl(&dword_1D0540000, v26, OS_LOG_TYPE_DEFAULT, "Scheduling backlight factor to zero after initialBacklightDebounceDuration (%gs) because System Aperture is active.", (uint8_t *)&v27, 0xCu);
        }

        -[SBSystemApertureProximityBacklightPolicy _startCancelingTouches](self, "_startCancelingTouches");
        v19 = self;
        v18 = v25;
        goto LABEL_23;
      }
    }
    else
    {
      -[SBSystemApertureProximityBacklightPolicy _stopCancelingTouches](self, "_stopCancelingTouches");
      self->_numberOfTouchesWhileObjectInProximity = 0;
      -[SBDefaultProximityBacklightPolicy _restoreBacklightFactor](self, "_restoreBacklightFactor");
      v20 = 0;
      v21 = 0;
      if (!((unint64_t)WeakRetained | (unint64_t)v9))
      {
LABEL_25:

        return;
      }
      objc_msgSend(v7, "systemApertureProximityBacklightPolicy:removeProximityTouchTrackingView:touchBlockingView:", self, WeakRetained, v9);
    }
LABEL_24:
    v20 = v9;
    v21 = WeakRetained;
    goto LABEL_25;
  }
}

- (BOOL)proximityBacklightPolicyTouchHandlingView:(id)a3 shouldConsumeTouchForHitTest:(CGPoint)a4 withEvent:(id)a5
{
  double y;
  double x;
  id v8;
  id WeakRetained;
  id v10;
  void *v11;
  char v12;
  void *v13;
  char v14;
  unint64_t v15;
  void *v16;
  char v17;
  _QWORD v19[2];

  y = a4.y;
  x = a4.x;
  v19[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_touchTrackingView);
  v10 = objc_loadWeakRetained((id *)&self->_touchBlockingView);
  -[SBSystemApertureProximityBacklightPolicy delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "systemApertureProximityBacklightPolicyShouldConsiderSystemApertureInert:", self);
  -[SBSystemApertureProximityBacklightPolicy _proximitySettings](self, "_proximitySettings");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "allowTouchesInJindoWhenObjectInProximity");

  if ((v12 & 1) == 0)
  {
    if (WeakRetained == v8)
    {
      v15 = self->_numberOfTouchesWhileObjectInProximity + 1;
      self->_numberOfTouchesWhileObjectInProximity = v15;
      if (v15 <= 2)
      {
        self->_isTrackingTouchPossiblyInJindoWithObjectInProximity = objc_msgSend(v11, "systemApertureProximityBacklightPolicy:isSystemApertureElementVisibleAtPoint:", self, x, y);
        v19[0] = *MEMORY[0x1E0C99860];
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBSystemApertureProximityBacklightPolicy performSelector:withObject:afterDelay:inModes:](self, "performSelector:withObject:afterDelay:inModes:", sel__scheduleBacklightFactorToZeroForTouchWithinSystemAperture, 0, v16, 0.0);

      }
    }
    else if (v10 == v8)
    {
      self->_isTrackingTouchPossiblyInJindoWithObjectInProximity = 0;
    }
  }
  if (v10 == v8)
    v17 = 1;
  else
    v17 = v14 ^ 1;

  return v17;
}

- (void)_startCancelingTouches
{
  SBSystemGestureManager *systemGestureManager;
  BSInvalidatable *v4;
  BSInvalidatable *suppressSystemGestures;
  id v6;

  if (!self->_suppressSystemGestures)
  {
    BKSHIDServicesCancelTouchesOnMainDisplay();
    systemGestureManager = self->_systemGestureManager;
    +[SBSystemGestureManager deviceHardwareButtonGestureTypes](SBSystemGestureManager, "deviceHardwareButtonGestureTypes");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[SBSystemGestureManager acquireSystemGestureDisableAssertionForReason:exceptSystemGestureTypes:](systemGestureManager, "acquireSystemGestureDisableAssertionForReason:exceptSystemGestureTypes:", CFSTR("objectInProximity"), v6);
    v4 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    suppressSystemGestures = self->_suppressSystemGestures;
    self->_suppressSystemGestures = v4;

  }
}

- (void)_stopCancelingTouches
{
  BSInvalidatable *suppressSystemGestures;

  -[BSInvalidatable invalidate](self->_suppressSystemGestures, "invalidate");
  suppressSystemGestures = self->_suppressSystemGestures;
  self->_suppressSystemGestures = 0;

}

- (BOOL)_isGracePeriodDisabledByEntitledApp
{
  SBSystemApertureProximityBacklightPolicy *v2;
  id WeakRetained;

  v2 = self;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  LOBYTE(v2) = objc_msgSend(WeakRetained, "systemApertureProximityBacklightPolicyShouldDisableGracePeriod:", v2);

  return (char)v2;
}

- (void)_scheduleBacklightFactorToZeroForTouchWithinSystemAperture
{
  void *v3;
  double v4;
  double v5;
  NSObject *v6;
  int v7;
  double v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (self->_isTrackingTouchPossiblyInJindoWithObjectInProximity)
  {
    self->_isTrackingTouchPossiblyInJindoWithObjectInProximity = 0;
    -[SBSystemApertureProximityBacklightPolicy _proximitySettings](self, "_proximitySettings");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "subsequentBacklightDebounceDuration");
    v5 = v4;

    SBLogProximitySensor();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 134217984;
      v8 = v5;
      _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "Scheduling backlight factor to zero after subsequentBacklightDebounceDuration (%.3f) because System Aperture is active and either did handle or could have handled touch.", (uint8_t *)&v7, 0xCu);
    }

    if (BSFloatGreaterThanFloat())
      -[SBDefaultProximityBacklightPolicy _scheduleBacklightFactorToZeroAfterDebounceDuration:](self, "_scheduleBacklightFactorToZeroAfterDebounceDuration:", v5);
  }
}

- (SBSystemApertureProximityBacklightPolicyDelegate)delegate
{
  return (SBSystemApertureProximityBacklightPolicyDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isSystemApertureBacklightPolicy
{
  return self->_systemApertureBacklightPolicy;
}

- (void)setSystemApertureBacklightPolicy:(BOOL)a3
{
  self->_systemApertureBacklightPolicy = a3;
}

- (SBProximitySettings)_proximitySettings
{
  return self->_proximitySettings;
}

- (void)_setProximitySettings:(id)a3
{
  objc_storeStrong((id *)&self->_proximitySettings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proximitySettings, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_touchAllowanceGracePeriodTimer, 0);
  objc_destroyWeak((id *)&self->_touchBlockingView);
  objc_destroyWeak((id *)&self->_touchTrackingView);
  objc_storeStrong((id *)&self->_suppressSystemGestures, 0);
  objc_storeStrong((id *)&self->_systemGestureManager, 0);
  objc_storeStrong((id *)&self->_sensorModeController, 0);
}

@end
