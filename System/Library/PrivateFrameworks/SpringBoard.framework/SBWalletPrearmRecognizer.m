@implementation SBWalletPrearmRecognizer

- (SBWalletPrearmRecognizer)initWithDelegate:(id)a3
{
  id v4;
  SBWalletPrearmRecognizer *v5;
  SBWalletPrearmRecognizer *v6;
  double v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBWalletPrearmRecognizer;
  v5 = -[SBWalletPrearmRecognizer init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    -[SBWalletPrearmRecognizer _computeDoubleTapTimeout](v5, "_computeDoubleTapTimeout");
    v6->_timeout = v7;
    objc_storeWeak((id *)&v6->_delegate, v4);
  }

  return v6;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[16];

  if (!self->_invalidated && self->_timer)
  {
    PKLegacyStockholmLog();
    SBLogLockScreenMesaWalletPreArm();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_INFO, "Deallocated while active", buf, 2u);
    }

    -[SBWalletPrearmRecognizer _invalidateForFailureReason:](self, "_invalidateForFailureReason:", 0);
  }
  v4.receiver = self;
  v4.super_class = (Class)SBWalletPrearmRecognizer;
  -[SBWalletPrearmRecognizer dealloc](&v4, sel_dealloc);
}

- (void)startRecognizing
{
  NSObject *v3;
  double v4;
  BSAbsoluteMachTimer *v5;
  BSAbsoluteMachTimer *timer;
  BSAbsoluteMachTimer *v7;
  double v8;
  id v9;
  void *v11;
  double timeout;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  double v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (self->_invalidated)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBWalletPrearmRecognizer.m"), 59, CFSTR("Cannot start recognizing an invalidated recognizer."));

  }
  timeout = self->_timeout;
  PKLegacyStockholmLog();
  SBLogLockScreenMesaWalletPreArm();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = self->_timeout;
    *(_DWORD *)buf = 134217984;
    v16 = v4;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_INFO, "Beginning recognition with timeout: %f", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  v5 = (BSAbsoluteMachTimer *)objc_msgSend(objc_alloc(MEMORY[0x1E0D01690]), "initWithIdentifier:", CFSTR("SBWalletPrearmRecognizer.timer"), *(_QWORD *)&timeout);
  timer = self->_timer;
  self->_timer = v5;

  v7 = self->_timer;
  v8 = self->_timeout;
  v9 = MEMORY[0x1E0C80D38];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __44__SBWalletPrearmRecognizer_startRecognizing__block_invoke;
  v13[3] = &unk_1E8E9EEC8;
  objc_copyWeak(&v14, (id *)buf);
  -[BSAbsoluteMachTimer scheduleWithFireInterval:leewayInterval:queue:handler:](v7, "scheduleWithFireInterval:leewayInterval:queue:handler:", MEMORY[0x1E0C80D38], v13, v8, 0.0);

  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);
}

void __44__SBWalletPrearmRecognizer_startRecognizing__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_invalidateForFailureReason:", 0);

}

- (void)invalidate
{
  NSObject *v3;
  uint8_t v4[16];

  PKLegacyStockholmLog();
  SBLogLockScreenMesaWalletPreArm();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_INFO, "Invalidated by caller", v4, 2u);
  }

  -[SBWalletPrearmRecognizer _invalidate](self, "_invalidate");
}

- (void)menuButtonSinglePress
{
  NSObject *v3;
  _BOOL4 v4;
  _BOOL8 v5;
  uint8_t buf[4];
  _BOOL4 v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v5 = self->_timer != 0;
  PKLegacyStockholmLog();
  SBLogLockScreenMesaWalletPreArm();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = self->_timer != 0;
    *(_DWORD *)buf = 67109120;
    v7 = v4;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_INFO, "SinglePressReceived (timer active? %d)", buf, 8u);
  }

  if (self->_timer)
    -[SBWalletPrearmRecognizer _invalidateForFailureReason:](self, "_invalidateForFailureReason:", 1, v5);
}

- (void)menuButtonDoublePress
{
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  void *v6;
  _BOOL8 v7;
  uint8_t buf[4];
  _BOOL4 v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v7 = self->_timer != 0;
  PKLegacyStockholmLog();
  SBLogLockScreenMesaWalletPreArm();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = self->_timer != 0;
    *(_DWORD *)buf = 67109120;
    v9 = v4;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_INFO, "DoublePressReceived (timer active? %d)", buf, 8u);
  }

  if (self->_timer)
  {
    PKLegacyStockholmLog();
    SBLogLockScreenMesaWalletPreArm();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_INFO, "Recognized", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("SBBiometricEventTimestampNotificationPrearmMatch"), 0, 0);

    -[SBWalletPrearmRecognizer _invalidateForSuccess](self, "_invalidateForSuccess");
  }
}

- (void)_invalidateForFailureReason:(unint64_t)a3
{
  __CFString *v5;
  NSObject *v6;
  __CFString *v7;
  id WeakRetained;
  __CFString *v9;
  uint8_t buf[4];
  __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (a3)
    v5 = CFSTR("SinglePress");
  else
    v5 = CFSTR("Timeout");
  v9 = v5;
  PKLegacyStockholmLog();
  SBLogLockScreenMesaWalletPreArm();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = v5;
    *(_DWORD *)buf = 138412290;
    v11 = v7;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_INFO, "Failed for %@", buf, 0xCu);

  }
  -[SBWalletPrearmRecognizer _invalidate](self, "_invalidate", v9);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "walletPrearmRecognizer:didFailToRecognizeForReason:", self, a3);

}

- (void)_invalidateForSuccess
{
  id WeakRetained;

  -[SBWalletPrearmRecognizer _invalidate](self, "_invalidate");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "walletPrearmRecognizerDidRecognize:", self);

}

- (void)_invalidate
{
  BSAbsoluteMachTimer *timer;

  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    -[BSAbsoluteMachTimer invalidate](self->_timer, "invalidate");
    timer = self->_timer;
    self->_timer = 0;

  }
}

- (double)_computeDoubleTapTimeout
{
  void *v2;
  uint64_t v3;
  double v4;
  float v5;
  double result;

  v2 = (void *)_AXSTripleClickCopyOptions();
  v3 = objc_msgSend(v2, "count");

  if (v3)
    v4 = 2.0;
  else
    v4 = 1.0;
  _AXSHomeClickSpeed();
  result = v4 * v5;
  if (result < 0.349999994)
    return 0.349999994;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
