@implementation SBAmbientAuthenticationIdleTimer

- (SBAmbientAuthenticationIdleTimer)init
{
  void *v3;
  void *v4;
  SBAmbientAuthenticationIdleTimer *v5;

  objc_msgSend(MEMORY[0x1E0DA9E80], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  v5 = -[SBAmbientAuthenticationIdleTimer _initWithKeyBag:attentionAwarenessClient:](self, "_initWithKeyBag:attentionAwarenessClient:", v3, v4);

  return v5;
}

- (id)_initWithKeyBag:(id)a3 attentionAwarenessClient:(id)a4
{
  id v7;
  id v8;
  SBAmbientAuthenticationIdleTimer *v9;
  SBAmbientAuthenticationIdleTimer *v10;
  void *v11;
  AWAttentionAwarenessClient *attentionClient;
  uint64_t v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id location;
  objc_super v19;

  v7 = a3;
  v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)SBAmbientAuthenticationIdleTimer;
  v9 = -[SBAmbientAuthenticationIdleTimer init](&v19, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_keybag, a3);
    *(_OWORD *)&v10->_maximumAuthenticatedInterval = xmmword_1D0E88A30;
    v10->_authenticated = 0x7FFFFFFFFFFFFFFFLL;
    objc_storeStrong((id *)&v10->_attentionClient, a4);
    -[SBAmbientAuthenticationIdleTimer _reconfigureAttentionClient](v10, "_reconfigureAttentionClient");
    -[SBFMobileKeyBag state](v10->_keybag, "state");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBAmbientAuthenticationIdleTimer _setAuthenticated:](v10, "_setAuthenticated:", objc_msgSend(v11, "isEffectivelyLocked") ^ 1);

    objc_initWeak(&location, v10);
    attentionClient = v10->_attentionClient;
    v13 = MEMORY[0x1E0C80D38];
    v14 = MEMORY[0x1E0C80D38];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __77__SBAmbientAuthenticationIdleTimer__initWithKeyBag_attentionAwarenessClient___block_invoke;
    v16[3] = &unk_1E8EA36F8;
    objc_copyWeak(&v17, &location);
    -[AWAttentionAwarenessClient setEventHandlerWithQueue:block:](attentionClient, "setEventHandlerWithQueue:block:", v13, v16);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

  return v10;
}

void __77__SBAmbientAuthenticationIdleTimer__initWithKeyBag_attentionAwarenessClient___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  id v6;
  id WeakRetained;
  id v8;

  v8 = a2;
  if ((objc_msgSend(v8, "eventMask") & 1) != 0)
  {
    v3 = objc_opt_class();
    v4 = v8;
    if (v3)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v5 = v4;
      else
        v5 = 0;
    }
    else
    {
      v5 = 0;
    }
    v6 = v5;

    if (v6)
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
      objc_msgSend(WeakRetained, "_handleAttentionLost:", v6);

    }
  }

}

- (void)dealloc
{
  objc_super v3;

  -[BSContinuousMachTimer invalidate](self->_authenticationLimitTimer, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SBAmbientAuthenticationIdleTimer;
  -[SBAmbientAuthenticationIdleTimer dealloc](&v3, sel_dealloc);
}

- (void)setMaximumAuthenticatedInterval:(double)a3
{
  NSObject *v4;
  double maximumAuthenticatedInterval;
  int v6;
  double v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (self->_maximumAuthenticatedInterval != a3)
  {
    self->_maximumAuthenticatedInterval = a3;
    SBLogAmbientAuthentication();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      maximumAuthenticatedInterval = self->_maximumAuthenticatedInterval;
      v6 = 134217984;
      v7 = maximumAuthenticatedInterval;
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "Maximum authentication interval changed to %f", (uint8_t *)&v6, 0xCu);
    }

    -[SBAmbientAuthenticationIdleTimer _recomputeAuthenticationLimitTimer](self, "_recomputeAuthenticationLimitTimer");
  }
}

- (void)setEnabled:(BOOL)a3
{
  NSObject *v4;
  _BOOL4 enabled;
  SBFMobileKeyBag *keybag;
  void *v7;
  _DWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (self->_enabled != a3)
  {
    self->_enabled = a3;
    SBLogAmbientAuthentication();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      enabled = self->_enabled;
      v8[0] = 67109120;
      v8[1] = enabled;
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "Enabled state changed to %{BOOL}u", (uint8_t *)v8, 8u);
    }

    keybag = self->_keybag;
    if (self->_enabled)
    {
      -[SBFMobileKeyBag addObserver:](keybag, "addObserver:", self);
      -[SBFMobileKeyBag state](self->_keybag, "state");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBAmbientAuthenticationIdleTimer _setAuthenticated:](self, "_setAuthenticated:", objc_msgSend(v7, "isEffectivelyLocked") ^ 1);

    }
    else
    {
      -[SBFMobileKeyBag removeObserver:](keybag, "removeObserver:", self);
    }
    -[SBAmbientAuthenticationIdleTimer _updateAttentionClientActive](self, "_updateAttentionClientActive");
    -[SBAmbientAuthenticationIdleTimer _recomputeAuthenticationLimitTimer](self, "_recomputeAuthenticationLimitTimer");
  }
}

- (void)setIdleTimerDuration:(double)a3
{
  NSObject *v4;
  double idleTimerDuration;
  int v6;
  double v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (self->_idleTimerDuration != a3)
  {
    self->_idleTimerDuration = a3;
    SBLogAmbientAuthentication();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      idleTimerDuration = self->_idleTimerDuration;
      v6 = 134217984;
      v7 = idleTimerDuration;
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "Updated idle timer duration to %f", (uint8_t *)&v6, 0xCu);
    }

    -[SBAmbientAuthenticationIdleTimer _reconfigureAttentionClient](self, "_reconfigureAttentionClient");
  }
}

- (void)keybag:(id)a3 extendedStateDidChange:(id)a4
{
  id v4;
  int v5;
  NSObject *v6;
  uint8_t buf[4];
  id v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a4;
  v5 = objc_msgSend(v4, "isEffectivelyLocked") ^ 1;
  SBLogAmbientAuthentication();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v8 = v4;
    v9 = 1024;
    v10 = v5;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "Extended keybag state did change to %@ isAuthenticated = %{BOOL}u", buf, 0x12u);
  }

  BSDispatchMain();
}

uint64_t __66__SBAmbientAuthenticationIdleTimer_keybag_extendedStateDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setAuthenticated:", *(unsigned __int8 *)(a1 + 40));
}

- (BOOL)_isAuthenticated
{
  return BSSettingFlagIsYes();
}

- (void)_setAuthenticated:(BOOL)a3
{
  _BOOL4 v3;
  int64_t v5;
  NSObject *v6;
  double v7;
  _DWORD v8[2];
  uint64_t v9;

  v3 = a3;
  v9 = *MEMORY[0x1E0C80C00];
  v5 = BSSettingFlagForBool();
  if (self->_authenticated != v5)
  {
    self->_authenticated = v5;
    SBLogAmbientAuthentication();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8[0] = 67109120;
      v8[1] = v3;
      _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "Authentication state changed to %{BOOL}u", (uint8_t *)v8, 8u);
    }

    if (BSSettingFlagIsYes())
    {
      BSContinuousMachTimeNow();
      self->_lastAuthenticationTime = v7;
    }
    -[SBAmbientAuthenticationIdleTimer _updateAttentionClientActive](self, "_updateAttentionClientActive");
    -[SBAmbientAuthenticationIdleTimer _recomputeAuthenticationLimitTimer](self, "_recomputeAuthenticationLimitTimer");
  }
}

- (void)_updateAttentionClientActive
{
  _BOOL8 v3;

  v3 = self->_enabled && -[SBAmbientAuthenticationIdleTimer _isAuthenticated](self, "_isAuthenticated");
  -[SBAmbientAuthenticationIdleTimer _setAttentionClientActive:](self, "_setAttentionClientActive:", v3);
}

- (void)_setAttentionClientActive:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  _BOOL4 v6;
  uint8_t v7[16];
  uint8_t buf[16];

  if (self->_attentionClientActive != a3)
  {
    v3 = a3;
    self->_attentionClientActive = a3;
    SBLogAmbientAuthentication();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v6)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Resuming attention client", buf, 2u);
      }

      -[AWAttentionAwarenessClient resumeWithError:](self->_attentionClient, "resumeWithError:", 0);
    }
    else
    {
      if (v6)
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Suspending attention client", v7, 2u);
      }

      -[AWAttentionAwarenessClient suspendWithError:](self->_attentionClient, "suspendWithError:", 0);
    }
  }
}

- (void)_recomputeAuthenticationLimitTimer
{
  NSObject *v3;
  double v4;
  double v5;
  double lastAuthenticationTime;
  double v7;
  double v8;
  NSObject *v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  void (**v13)(_QWORD);
  uint64_t v14;
  BSContinuousMachTimer **p_authenticationLimitTimer;
  BSContinuousMachTimer *authenticationLimitTimer;
  BSContinuousMachTimer *v17;
  uint64_t v18;
  id v19;
  NSObject *v20;
  uint8_t v21[16];
  _QWORD v22[4];
  void (**v23)(_QWORD);
  _QWORD v24[4];
  id v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  double v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (-[BSContinuousMachTimer isScheduled](self->_authenticationLimitTimer, "isScheduled"))
  {
    SBLogAmbientAuthentication();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "Invalidating authentication limit timer", buf, 2u);
    }

  }
  -[BSContinuousMachTimer invalidate](self->_authenticationLimitTimer, "invalidate");
  if (-[SBAmbientAuthenticationIdleTimer _isAuthenticated](self, "_isAuthenticated")
    && -[SBAmbientAuthenticationIdleTimer isEnabled](self, "isEnabled"))
  {
    BSContinuousMachTimeNow();
    v5 = v4;
    lastAuthenticationTime = self->_lastAuthenticationTime;
    -[SBAmbientAuthenticationIdleTimer maximumAuthenticatedInterval](self, "maximumAuthenticatedInterval");
    v8 = v7;
    SBLogAmbientAuthentication();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = lastAuthenticationTime + v8 - v5;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      -[SBAmbientAuthenticationIdleTimer maximumAuthenticatedInterval](self, "maximumAuthenticatedInterval");
      *(_DWORD *)buf = 134218240;
      v27 = v11;
      v28 = 2048;
      v29 = v10;
      _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "Updating authentication limit timer. maxInterval = %f remainingInterval = %f", buf, 0x16u);
    }

    objc_initWeak((id *)buf, self);
    v12 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __70__SBAmbientAuthenticationIdleTimer__recomputeAuthenticationLimitTimer__block_invoke;
    v24[3] = &unk_1E8E9DF28;
    objc_copyWeak(&v25, (id *)buf);
    v13 = (void (**)(_QWORD))MEMORY[0x1D17E5550](v24);
    if (v10 <= 0.0)
    {
      SBLogAmbientAuthentication();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v21 = 0;
        _os_log_impl(&dword_1D0540000, v20, OS_LOG_TYPE_DEFAULT, "Authentication limit in the past; locking immediately",
          v21,
          2u);
      }

      v13[2](v13);
    }
    else
    {
      v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0D01720]), "initWithIdentifier:", CFSTR("com.apple.SpringBoard.AmbientAuthentication"));
      authenticationLimitTimer = self->_authenticationLimitTimer;
      p_authenticationLimitTimer = &self->_authenticationLimitTimer;
      *p_authenticationLimitTimer = (BSContinuousMachTimer *)v14;

      v17 = *p_authenticationLimitTimer;
      v18 = MEMORY[0x1E0C80D38];
      v19 = MEMORY[0x1E0C80D38];
      v22[0] = v12;
      v22[1] = 3221225472;
      v22[2] = __70__SBAmbientAuthenticationIdleTimer__recomputeAuthenticationLimitTimer__block_invoke_2;
      v22[3] = &unk_1E8EA3720;
      v23 = v13;
      -[BSContinuousMachTimer scheduleWithFireInterval:leewayInterval:queue:handler:](v17, "scheduleWithFireInterval:leewayInterval:queue:handler:", v18, v22, v10, 1.0);

    }
    objc_destroyWeak(&v25);
    objc_destroyWeak((id *)buf);
  }
}

void __70__SBAmbientAuthenticationIdleTimer__recomputeAuthenticationLimitTimer__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
  int v3;
  id *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained;
    v3 = objc_msgSend(WeakRetained, "isEnabled");
    v2 = v4;
    if (v3)
    {
      objc_msgSend(v4[1], "lockSkippingGracePeriod:", 0);
      v2 = v4;
    }
  }

}

uint64_t __70__SBAmbientAuthenticationIdleTimer__recomputeAuthenticationLimitTimer__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  SBLogAmbientAuthentication();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_DEFAULT, "Authentication limit reached. Locking", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_reconfigureAttentionClient
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0CFEC08]);
  objc_msgSend(v3, "setIdentifier:", CFSTR("com.apple.SpringBoard.AmbientAuthentication"));
  objc_msgSend(v3, "setEventMask:", 4095);
  objc_msgSend(v3, "setAttentionLostEventMask:", 0);
  objc_msgSend(v3, "setSamplingInterval:", 4.0);
  -[SBAmbientAuthenticationIdleTimer idleTimerDuration](self, "idleTimerDuration");
  objc_msgSend(v3, "setAttentionLostTimeout:");
  SBLogAmbientAuthentication();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "Updating attention client with configuration %{public}@", (uint8_t *)&v5, 0xCu);
  }

  -[AWAttentionAwarenessClient setConfiguration:](self->_attentionClient, "setConfiguration:", v3);
}

- (void)_handleAttentionLost:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  SBLogAmbientAuthentication();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = -[SBAmbientAuthenticationIdleTimer isEnabled](self, "isEnabled");
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "Attention lost. isEnabled = %{BOOL}u", (uint8_t *)v6, 8u);
  }

  if (-[SBAmbientAuthenticationIdleTimer isEnabled](self, "isEnabled"))
  {
    SBLogAmbientAuthentication();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v6[0]) = 0;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Locking due to attention loss", (uint8_t *)v6, 2u);
    }

    -[SBFMobileKeyBag lockSkippingGracePeriod:](self->_keybag, "lockSkippingGracePeriod:", 0);
  }
}

- (double)maximumAuthenticatedInterval
{
  return self->_maximumAuthenticatedInterval;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (double)idleTimerDuration
{
  return self->_idleTimerDuration;
}

- (BOOL)_isAttentionClientActive
{
  return self->_attentionClientActive;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attentionClient, 0);
  objc_storeStrong((id *)&self->_authenticationLimitTimer, 0);
  objc_storeStrong((id *)&self->_keybag, 0);
}

@end
