@implementation SBDisplayBrightnessController

- (SBDisplayBrightnessController)initWithCoordinator:(id)a3
{
  id v5;
  SBDisplayBrightnessController *v6;
  SBDisplayBrightnessController *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  SBHIDValueModifyingButtonSetArbiter *v13;
  SBHIDValueModifyingButtonSetArbiter *buttonArbiter;
  void *v16;
  objc_super v17;
  _QWORD v18[5];

  v18[4] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDisplayBrightnessController.m"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("coordinator"));

  }
  v17.receiver = self;
  v17.super_class = (Class)SBDisplayBrightnessController;
  v6 = -[SBDisplayBrightnessController init](&v17, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeWeak((id *)&v6->_coordinator, v5);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 786544);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v8;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 4278255649);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18[1] = v9;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 786543);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v18[2] = v10;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 4278255648);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18[3] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = -[SBHIDValueModifyingButtonSetArbiter initWithHIDKeyPressEventUsages:initialRepeatDelay:subsequentRepeatDelay:]([SBHIDValueModifyingButtonSetArbiter alloc], "initWithHIDKeyPressEventUsages:initialRepeatDelay:subsequentRepeatDelay:", v12, 0.333000004, 0.0416666679);
    buttonArbiter = v7->_buttonArbiter;
    v7->_buttonArbiter = v13;

    -[SBHIDValueModifyingButtonSetArbiter setDelegate:](v7->_buttonArbiter, "setDelegate:", v7);
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[SBUIViewFloatSpringProperty invalidate](self->_brightnessProperty, "invalidate");
  -[SBDisplayBrightnessController _completeBrightnessTransaction](self, "_completeBrightnessTransaction");
  v3.receiver = self;
  v3.super_class = (Class)SBDisplayBrightnessController;
  -[SBDisplayBrightnessController dealloc](&v3, sel_dealloc);
}

+ (BOOL)handlesKeyCommands
{
  if (handlesKeyCommands_onceToken_0 != -1)
    dispatch_once(&handlesKeyCommands_onceToken_0, &__block_literal_global_128);
  return objc_msgSend((id)handlesKeyCommands_settings_0, "displayBrightnessKeyCommandsEnabled");
}

void __51__SBDisplayBrightnessController_handlesKeyCommands__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[SBElasticHUDDomain rootSettings](SBElasticHUDDomain, "rootSettings");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)handlesKeyCommands_settings_0;
  handlesKeyCommands_settings_0 = v0;

}

- (int64_t)brightnessRouteType
{
  return 1;
}

- (void)handleBrightnessKeyPressEvent:(__IOHIDEvent *)a3
{
  -[SBHIDValueModifyingButtonSetArbiter processKeyboardEvent:](self->_buttonArbiter, "processKeyboardEvent:", a3);
}

- (void)cancelBrightnessKeyPressEvent
{
  -[SBHIDValueModifyingButtonSetArbiter reset](self->_buttonArbiter, "reset");
}

- (BOOL)setBrightnessLevel:(float)a3 animated:(BOOL)a4
{
  -[SBDisplayBrightnessController _setBrightnessLevel:animated:](self, "_setBrightnessLevel:animated:", a4);
  return 1;
}

- (void)noteValueUpdatesWillBegin
{
  if (-[SBDisplayBrightnessController _isBrightnessPropertyRunning](self, "_isBrightnessPropertyRunning"))
    -[SBUIViewFloatSpringProperty invalidate](self->_brightnessProperty, "invalidate");
  -[SBDisplayBrightnessController _beginBrightnessTransaction](self, "_beginBrightnessTransaction");
}

- (void)noteValueUpdatesDidEnd
{
  if (-[SBDisplayBrightnessController _isBrightnessPropertyRunning](self, "_isBrightnessPropertyRunning"))
    -[SBUIViewFloatSpringProperty invalidate](self->_brightnessProperty, "invalidate");
  -[SBDisplayBrightnessController _completeBrightnessTransaction](self, "_completeBrightnessTransaction");
}

- (void)buttonSetArbiter:(id)a3 performActionForButtonPage:(unsigned __int16)a4 usage:(unsigned __int16)a5
{
  int v5;
  int v6;
  id WeakRetained;
  int v9;
  int v10;
  SBDisplayBrightnessController *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v5 = a5;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_coordinator);
  v9 = v5 | (v6 << 16);
  if (v9 <= 786542)
  {
    if (v9 != -16711648)
    {
      v10 = -16711647;
      goto LABEL_6;
    }
LABEL_8:
    v14 = WeakRetained;
    v11 = self;
    v12 = 1;
    v13 = 0;
    goto LABEL_9;
  }
  if (v9 == 786543)
    goto LABEL_8;
  v10 = 786544;
LABEL_6:
  if (v9 == v10)
  {
    v14 = WeakRetained;
    v11 = self;
    v12 = 0;
    v13 = 1;
LABEL_9:
    objc_msgSend(WeakRetained, "brightnessController:performCoordinatedBrightnessChangeForIncrementKeyDown:decrementKeyDown:", v11, v12, v13);
    WeakRetained = v14;
  }

}

- (void)buttonSetArbiterDidReset:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_coordinator);
  objc_msgSend(WeakRetained, "brightnessController:performCoordinatedBrightnessChangeForIncrementKeyDown:decrementKeyDown:", self, 0, 0);

}

- (void)_beginBrightnessTransaction
{
  NSObject *v3;
  int v4;
  SBDisplayBrightnessController *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (!self->_brightnessTransaction)
  {
    SBLogBacklight();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = 138412290;
      v5 = self;
      _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_INFO, "%@ beginning brightness transaction", (uint8_t *)&v4, 0xCu);
    }

    self->_brightnessTransaction = (BKSDisplayBrightnessTransaction *)BKSDisplayBrightnessTransactionCreate();
  }
}

- (void)_completeBrightnessTransaction
{
  NSObject *v3;
  int v4;
  SBDisplayBrightnessController *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (self->_brightnessTransaction)
  {
    SBLogBacklight();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = 138412290;
      v5 = self;
      _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_INFO, "%@ completing brightness transaction", (uint8_t *)&v4, 0xCu);
    }

    CFRelease(self->_brightnessTransaction);
    self->_brightnessTransaction = 0;
  }
}

- (float)_effectiveCurrentTargetBrightness
{
  double v3;
  float result;

  if (-[SBDisplayBrightnessController _isBrightnessPropertyRunning](self, "_isBrightnessPropertyRunning"))
  {
    -[SBUIViewFloatSpringProperty input](self->_brightnessProperty, "input");
    return v3;
  }
  else
  {
    BKSDisplayBrightnessGetCurrent();
  }
  return result;
}

- (BOOL)_isBrightnessPropertyRunning
{
  SBUIViewFloatSpringProperty *brightnessProperty;

  brightnessProperty = self->_brightnessProperty;
  if (brightnessProperty)
    LOBYTE(brightnessProperty) = -[SBUIViewFloatSpringProperty isInvalidated](brightnessProperty, "isInvalidated") ^ 1;
  return (char)brightnessProperty;
}

- (void)_setBrightnessLevel:(float)a3 animated:(BOOL)a4
{
  SBUIViewFloatSpringProperty *v6;
  void *v7;
  int v8;
  int v9;
  int v10;
  double v11;
  double v12;
  double v13;
  float v14;
  double v15;
  id v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  double v24;
  double v25;
  double v26;
  SBUIViewFloatSpringProperty *v27;
  _QWORD v28[4];
  id v29;
  float v30;
  _QWORD v31[4];
  id v32;
  id location;
  _QWORD v34[4];
  id v35;
  double v36;
  _QWORD v37[4];
  SBUIViewFloatSpringProperty *v38;
  float v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    if (-[SBDisplayBrightnessController _isBrightnessPropertyRunning](self, "_isBrightnessPropertyRunning"))
    {
      v6 = self->_brightnessProperty;
      v7 = (void *)MEMORY[0x1E0CEABB0];
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __62__SBDisplayBrightnessController__setBrightnessLevel_animated___block_invoke;
      v37[3] = &unk_1E8EA1BB8;
      v38 = v6;
      v39 = a3;
      v8 = *MEMORY[0x1E0CD23C0];
      v9 = *(_DWORD *)(MEMORY[0x1E0CD23C0] + 4);
      v10 = *(_DWORD *)(MEMORY[0x1E0CD23C0] + 8);
      v27 = v6;
      LODWORD(v11) = v8;
      LODWORD(v12) = v9;
      LODWORD(v13) = v10;
      objc_msgSend(v7, "sb_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 0, v37, v11, v12, v13);

    }
    else
    {
      BKSDisplayBrightnessGetCurrent();
      v15 = v14;
      if ((BSFloatEqualToFloat() & 1) == 0)
      {
        v16 = objc_alloc_init(MEMORY[0x1E0DAC2A8]);
        v17 = (void *)MEMORY[0x1E0CEABB0];
        v18 = MEMORY[0x1E0C809B0];
        v34[0] = MEMORY[0x1E0C809B0];
        v34[1] = 3221225472;
        v34[2] = __62__SBDisplayBrightnessController__setBrightnessLevel_animated___block_invoke_2;
        v34[3] = &unk_1E8E9DE88;
        v19 = v16;
        v35 = v19;
        v36 = v15;
        objc_msgSend(v17, "performWithoutAnimation:", v34);
        -[SBDisplayBrightnessController _beginBrightnessTransaction](self, "_beginBrightnessTransaction");
        objc_initWeak(&location, self);
        v20 = (void *)MEMORY[0x1E0CEABB0];
        v40[0] = v19;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v31[0] = v18;
        v31[1] = 3221225472;
        v31[2] = __62__SBDisplayBrightnessController__setBrightnessLevel_animated___block_invoke_3;
        v31[3] = &unk_1E8E9DF28;
        objc_copyWeak(&v32, &location);
        objc_msgSend(v20, "_createTransformerWithInputAnimatableProperties:presentationValueChangedCallback:", v21, v31);

        objc_storeStrong((id *)&self->_brightnessProperty, v16);
        v22 = (void *)MEMORY[0x1E0CEABB0];
        v28[0] = v18;
        v28[1] = 3221225472;
        v28[2] = __62__SBDisplayBrightnessController__setBrightnessLevel_animated___block_invoke_4;
        v28[3] = &unk_1E8EA1BB8;
        v23 = v19;
        v29 = v23;
        v30 = a3;
        LODWORD(v24) = *MEMORY[0x1E0CD23C0];
        LODWORD(v25) = *(_DWORD *)(MEMORY[0x1E0CD23C0] + 4);
        LODWORD(v26) = *(_DWORD *)(MEMORY[0x1E0CD23C0] + 8);
        objc_msgSend(v22, "sb_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 0, v28, v24, v25, v26);

        objc_destroyWeak(&v32);
        objc_destroyWeak(&location);

      }
    }
  }
  else
  {
    BKSDisplayBrightnessSet();
  }
}

uint64_t __62__SBDisplayBrightnessController__setBrightnessLevel_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setInput:", *(float *)(a1 + 40));
}

uint64_t __62__SBDisplayBrightnessController__setBrightnessLevel_animated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setInput:", *(double *)(a1 + 40));
}

void __62__SBDisplayBrightnessController__setBrightnessLevel_animated___block_invoke_3(uint64_t a1)
{
  id *WeakRetained;
  id v2;
  void *v3;
  id v4;
  id v5;
  id *v6;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    v2 = WeakRetained[4];
    v3 = v2;
    if (v2 && !objc_msgSend(v2, "isInvalidated"))
    {
      objc_msgSend(v3, "input");
      objc_msgSend(v3, "output");
      BKSDisplayBrightnessSet();
      if (BSFloatEqualToFloat())
      {
        objc_msgSend(v3, "invalidate");
        v5 = v6[4];
        v6[4] = 0;

        objc_msgSend(v6, "_completeBrightnessTransaction");
      }
    }
    else
    {
      v4 = v6[4];
      v6[4] = 0;

    }
    WeakRetained = v6;
  }

}

uint64_t __62__SBDisplayBrightnessController__setBrightnessLevel_animated___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setInput:", *(float *)(a1 + 40));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_brightnessProperty, 0);
  objc_storeStrong((id *)&self->_buttonArbiter, 0);
  objc_destroyWeak((id *)&self->_coordinator);
}

@end
