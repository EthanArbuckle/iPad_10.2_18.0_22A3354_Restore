@implementation SBNotchedStatusBarProximityBacklightPolicy

- (SBNotchedStatusBarProximityBacklightPolicy)initWithConfiguration:(id)a3
{
  id v4;
  SBProximityTouchHandlingController *v5;
  void *v6;
  SBProximityTouchHandlingController *v7;
  SBNotchedStatusBarProximityBacklightPolicy *v8;

  v4 = a3;
  v5 = [SBProximityTouchHandlingController alloc];
  objc_msgSend(v4, "proximitySettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SBProximityTouchHandlingController initWithSettings:touchHandlingDelegate:](v5, "initWithSettings:touchHandlingDelegate:", v6, self);

  v8 = -[SBNotchedStatusBarProximityBacklightPolicy initWithConfiguration:touchHandlingController:](self, "initWithConfiguration:touchHandlingController:", v4, v7);
  return v8;
}

- (SBNotchedStatusBarProximityBacklightPolicy)initWithConfiguration:(id)a3 touchHandlingController:(id)a4
{
  id v6;
  id v7;
  SBNotchedStatusBarProximityBacklightPolicy *v8;
  uint64_t v9;
  SBProximitySettings *proximitySettings;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBNotchedStatusBarProximityBacklightPolicy;
  v8 = -[SBDefaultProximityBacklightPolicy initWithConfiguration:](&v12, sel_initWithConfiguration_, v6);
  if (v8)
  {
    objc_msgSend(v6, "proximitySettings");
    v9 = objc_claimAutoreleasedReturnValue();
    proximitySettings = v8->_proximitySettings;
    v8->_proximitySettings = (SBProximitySettings *)v9;

    objc_storeStrong((id *)&v8->_proxTouchHandlingController, a4);
  }

  return v8;
}

- (void)dealloc
{
  objc_super v3;

  -[SBProximityTouchHandlingController invalidate](self->_proxTouchHandlingController, "invalidate");
  -[SBNotchedStatusBarProximityBacklightPolicyEnablementCondition invalidate](self->_enablementCondition, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SBNotchedStatusBarProximityBacklightPolicy;
  -[SBDefaultProximityBacklightPolicy dealloc](&v3, sel_dealloc);
}

- (void)_scheduleBacklightFactorToZeroAfterDebounceDuration:(double)a3
{
  objc_super v5;

  if (BSFloatGreaterThanFloat())
  {
    v5.receiver = self;
    v5.super_class = (Class)SBNotchedStatusBarProximityBacklightPolicy;
    -[SBDefaultProximityBacklightPolicy _scheduleBacklightFactorToZeroAfterDebounceDuration:](&v5, sel__scheduleBacklightFactorToZeroAfterDebounceDuration_, a3);
  }
}

- (id)_createNewEnablementCondition
{
  return objc_alloc_init(SBNotchedStatusBarProximityBacklightPolicyEnablementCondition);
}

- (void)proximitySensorManager:(id)a3 objectWithinProximityDidChange:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  SBNotchedStatusBarProximityBacklightPolicyEnablementCondition *v8;
  SBNotchedStatusBarProximityBacklightPolicyEnablementCondition *enablementCondition;
  SBNotchedStatusBarProximityBacklightPolicyEnablementCondition *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a4;
  v7 = a3;
  if (self->_objectInProximity != v4)
  {
    v13 = v7;
    self->_objectInProximity = v4;
    if (v4)
    {
      if (self->_touchesReceivedWithObjectInProximity)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBNotchedStatusBarProximityBacklightPolicy.m"), 106, CFSTR("Expected _touchesReceivedWithObjectInProximity to be 0."));

      }
      if (self->_timesEnabledWithObjectInProximity)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBNotchedStatusBarProximityBacklightPolicy.m"), 107, CFSTR("Expected _timesEnabledWithObjectInProximity to be 0."));

      }
      -[SBNotchedStatusBarProximityBacklightPolicy _createNewEnablementCondition](self, "_createNewEnablementCondition");
      v8 = (SBNotchedStatusBarProximityBacklightPolicyEnablementCondition *)objc_claimAutoreleasedReturnValue();
      enablementCondition = self->_enablementCondition;
      self->_enablementCondition = v8;

      -[SBNotchedStatusBarProximityBacklightPolicyEnablementCondition setDelegate:](self->_enablementCondition, "setDelegate:", self);
      if (-[SBNotchedStatusBarProximityBacklightPolicyEnablementCondition isEnabled](self->_enablementCondition, "isEnabled"))
      {
        -[SBNotchedStatusBarProximityBacklightPolicy _debounceDurationForNumberOfTouchesReceivedWithObjectInProximity:](self, "_debounceDurationForNumberOfTouchesReceivedWithObjectInProximity:", 1);
        -[SBNotchedStatusBarProximityBacklightPolicy _scheduleBacklightFactorToZeroAfterDebounceDuration:](self, "_scheduleBacklightFactorToZeroAfterDebounceDuration:");
        -[SBNotchedStatusBarProximityBacklightPolicy _absorbTouchesBelowStatusBarHeight](self, "_absorbTouchesBelowStatusBarHeight");
      }
      else
      {
        -[SBDefaultProximityBacklightPolicy _scheduleBacklightFactorToZeroAfterDefaultDuration](self, "_scheduleBacklightFactorToZeroAfterDefaultDuration");
        -[SBNotchedStatusBarProximityBacklightPolicy _absorbTouchesFullScreen](self, "_absorbTouchesFullScreen");
      }
    }
    else
    {
      -[SBNotchedStatusBarProximityBacklightPolicy _stopAbsorbingTouches](self, "_stopAbsorbingTouches");
      -[SBNotchedStatusBarProximityBacklightPolicyEnablementCondition invalidate](self->_enablementCondition, "invalidate");
      v10 = self->_enablementCondition;
      self->_enablementCondition = 0;

      self->_timesEnabledWithObjectInProximity = 0;
      self->_touchesReceivedWithObjectInProximity = 0;
      -[SBDefaultProximityBacklightPolicy _restoreBacklightFactor](self, "_restoreBacklightFactor");
    }
    v7 = v13;
  }

}

- (void)windowSceneDidConnect:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBNotchedStatusBarProximityBacklightPolicy;
  v4 = a3;
  -[SBDefaultProximityBacklightPolicy windowSceneDidConnect:](&v5, sel_windowSceneDidConnect_, v4);
  -[SBProximityTouchHandlingController windowSceneDidConnect:](self->_proxTouchHandlingController, "windowSceneDidConnect:", v4, v5.receiver, v5.super_class);

}

- (void)didHitAllowedRegion:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  unint64_t v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;
  CGPoint v16;
  CGPoint v17;

  y = a3.y;
  x = a3.x;
  v15 = *MEMORY[0x1E0C80C00];
  if (!self->_objectInProximity)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBNotchedStatusBarProximityBacklightPolicy.m"), 145, CFSTR("Requires object in proximity."));

  }
  v6 = self->_touchesReceivedWithObjectInProximity + 1;
  self->_touchesReceivedWithObjectInProximity = v6;
  SBLogProximitySensor();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6 > 2)
  {
    if (v8)
    {
      v17.x = x;
      v17.y = y;
      NSStringFromCGPoint(v17);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412290;
      v14 = v10;
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "HIT allowed region (%@), and NOT allowed to reschedule backlight debounce timer because maximum touches reached.", (uint8_t *)&v13, 0xCu);

    }
  }
  else
  {
    if (v8)
    {
      v16.x = x;
      v16.y = y;
      NSStringFromCGPoint(v16);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412290;
      v14 = v9;
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "HIT allowed region (%@), and allowed to reschedule backlight debounce timer.", (uint8_t *)&v13, 0xCu);

    }
    -[SBNotchedStatusBarProximityBacklightPolicy _debounceDurationForNumberOfTouchesReceivedWithObjectInProximity:](self, "_debounceDurationForNumberOfTouchesReceivedWithObjectInProximity:", 0);
    -[SBNotchedStatusBarProximityBacklightPolicy _scheduleBacklightFactorToZeroAfterDebounceDuration:](self, "_scheduleBacklightFactorToZeroAfterDebounceDuration:");
  }
}

- (void)condition:(id)a3 enablementDidChange:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  unint64_t v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  uint8_t v12[16];
  uint8_t buf[16];

  v4 = a4;
  v7 = a3;
  if (self->_objectInProximity)
  {
    if (!v4)
      goto LABEL_11;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBNotchedStatusBarProximityBacklightPolicy.m"), 162, CFSTR("Requires object in proximity."));

    if (!v4)
      goto LABEL_11;
  }
  v8 = self->_timesEnabledWithObjectInProximity + 1;
  self->_timesEnabledWithObjectInProximity = v8;
  SBLogProximitySensor();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8 > 2)
  {
    if (v10)
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "Condition changed to allow prox touch handling, but NOT allowed to reschedule backlight debounce timer because max enablements reached.", v12, 2u);
    }

  }
  else
  {
    if (v10)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "Condition changed to allow prox touch handling, and allowed to reschedule backlight debounce timer.", buf, 2u);
    }

    -[SBNotchedStatusBarProximityBacklightPolicy _debounceDurationForNumberOfTouchesReceivedWithObjectInProximity:](self, "_debounceDurationForNumberOfTouchesReceivedWithObjectInProximity:", 0);
    -[SBNotchedStatusBarProximityBacklightPolicy _scheduleBacklightFactorToZeroAfterDebounceDuration:](self, "_scheduleBacklightFactorToZeroAfterDebounceDuration:");
  }
  -[SBNotchedStatusBarProximityBacklightPolicy _absorbTouchesBelowStatusBarHeight](self, "_absorbTouchesBelowStatusBarHeight");
LABEL_11:

}

- (void)_absorbTouchesBelowStatusBarHeight
{
  SBProximityTouchHandlingController *proxTouchHandlingController;

  proxTouchHandlingController = self->_proxTouchHandlingController;
  -[SBNotchedStatusBarProximityBacklightPolicyEnablementCondition enabledStatusBarHeight](self->_enablementCondition, "enabledStatusBarHeight");
  -[SBProximityTouchHandlingController setStatusBarHeight:](proxTouchHandlingController, "setStatusBarHeight:");
  -[SBProximityTouchHandlingController setAbsorbTouchesBelowStatusBar:](self->_proxTouchHandlingController, "setAbsorbTouchesBelowStatusBar:", 1);
}

- (void)_absorbTouchesFullScreen
{
  -[SBProximityTouchHandlingController setStatusBarHeight:](self->_proxTouchHandlingController, "setStatusBarHeight:", 0.0);
  -[SBProximityTouchHandlingController setAbsorbTouchesBelowStatusBar:](self->_proxTouchHandlingController, "setAbsorbTouchesBelowStatusBar:", 1);
}

- (void)_stopAbsorbingTouches
{
  -[SBProximityTouchHandlingController setAbsorbTouchesBelowStatusBar:](self->_proxTouchHandlingController, "setAbsorbTouchesBelowStatusBar:", 0);
}

- (double)_debounceDurationForNumberOfTouchesReceivedWithObjectInProximity:(BOOL)a3
{
  unint64_t touchesReceivedWithObjectInProximity;
  void *v4;
  double v5;
  double v6;

  touchesReceivedWithObjectInProximity = self->_touchesReceivedWithObjectInProximity;
  if (a3 && !touchesReceivedWithObjectInProximity)
  {
    -[SBNotchedStatusBarProximityBacklightPolicy _proximitySettings](self, "_proximitySettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "initialBacklightDebounceDuration");
LABEL_6:
    v6 = v5;

    return v6;
  }
  v6 = 0.0;
  if (touchesReceivedWithObjectInProximity <= 2)
  {
    -[SBNotchedStatusBarProximityBacklightPolicy _proximitySettings](self, "_proximitySettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "subsequentBacklightDebounceDuration");
    goto LABEL_6;
  }
  return v6;
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
  objc_storeStrong((id *)&self->_enablementCondition, 0);
  objc_storeStrong((id *)&self->_proxTouchHandlingController, 0);
}

@end
