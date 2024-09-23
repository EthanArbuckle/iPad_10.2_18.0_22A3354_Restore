@implementation SBVoiceCommandButton

- (SBVoiceCommandButton)init
{
  SBVoiceCommandButton *v2;
  uint64_t v3;
  SBSiriHardwareButtonInteraction *siriHardwareButtonInteraction;
  SBHIDButtonStateArbiter *v5;
  SBHIDButtonStateArbiter *buttonArbiter;
  SBHIDButtonStateArbiter *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBVoiceCommandButton;
  v2 = -[SBVoiceCommandButton init](&v10, sel_init);
  if (v2)
  {
    +[SBSiriHardwareButtonInteraction hardwareButtonInteractionForVoiceCommandButton](SBSiriHardwareButtonInteraction, "hardwareButtonInteractionForVoiceCommandButton");
    v3 = objc_claimAutoreleasedReturnValue();
    siriHardwareButtonInteraction = v2->_siriHardwareButtonInteraction;
    v2->_siriHardwareButtonInteraction = (SBSiriHardwareButtonInteraction *)v3;

    v5 = objc_alloc_init(SBHIDButtonStateArbiter);
    buttonArbiter = v2->_buttonArbiter;
    v2->_buttonArbiter = v5;

    -[SBHIDButtonStateArbiter setDelegate:](v2->_buttonArbiter, "setDelegate:", v2);
    v7 = v2->_buttonArbiter;
    -[SBSiriHardwareButtonInteraction hardwareButtonGestureParameters](v2->_siriHardwareButtonInteraction, "hardwareButtonGestureParameters");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "longPressTimeInterval");
    -[SBHIDButtonStateArbiter setLongPressTimeout:](v7, "setLongPressTimeout:");

  }
  return v2;
}

- (BOOL)_isPermittedToBegin
{
  void *v3;
  void *v4;
  char v5;

  -[SBVoiceCommandButton hardwareButtonCoordinator](self, "hardwareButtonCoordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBVoiceCommandButton hardwareButtonIdentifier](self, "hardwareButtonIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "buttonShouldStart:", v4);

  return v5;
}

- (void)handleButtonEvent:(__IOHIDEvent *)a3
{
  -[SBHIDButtonStateArbiter processEvent:](self->_buttonArbiter, "processEvent:", a3);
}

- (void)performActionsForButtonDown:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  if (-[SBVoiceCommandButton _isPermittedToBegin](self, "_isPermittedToBegin", a3))
  {
    self->_isLongPressRecognized = 0;
    -[SBSiriHardwareButtonInteraction consumeInitialPressDown](self->_siriHardwareButtonInteraction, "consumeInitialPressDown");
  }
  else
  {
    SBLogButtonsCombo();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "Siri VoiceCommand down ignored because coordinateor says no", v5, 2u);
    }

  }
}

- (void)performActionsForButtonLongPress:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  if (-[SBVoiceCommandButton _isPermittedToBegin](self, "_isPermittedToBegin", a3))
  {
    self->_isLongPressRecognized = 1;
    -[SBSiriHardwareButtonInteraction consumeLongPress](self->_siriHardwareButtonInteraction, "consumeLongPress");
  }
  else
  {
    SBLogButtonsCombo();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "Siri VoiceCommand long press ignored because coordinateor says no", v5, 2u);
    }

  }
}

- (void)performActionsForButtonUp:(id)a3
{
  BOOL v4;
  NSObject *v5;
  _BOOL4 v6;
  _BOOL4 isLongPressRecognized;
  _DWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = -[SBVoiceCommandButton _isPermittedToBegin](self, "_isPermittedToBegin", a3);
  SBLogButtonsCombo();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      isLongPressRecognized = self->_isLongPressRecognized;
      v8[0] = 67109120;
      v8[1] = isLongPressRecognized;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Siri VoiceCommand button up, (long press recognized:%{BOOL}u)", (uint8_t *)v8, 8u);
    }

    if (!self->_isLongPressRecognized)
      -[SBSiriHardwareButtonInteraction consumeSinglePressUp](self->_siriHardwareButtonInteraction, "consumeSinglePressUp");
    -[SBSiriHardwareButtonInteraction observeFinalPressUp](self->_siriHardwareButtonInteraction, "observeFinalPressUp");
  }
  else
  {
    if (v6)
    {
      LOWORD(v8[0]) = 0;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Siri VoiceCommand up ignored because coordinateor says no", (uint8_t *)v8, 2u);
    }

  }
}

- (void)cancelHardwareButtonPress
{
  -[SBHIDButtonStateArbiter reset](self->_buttonArbiter, "reset");
}

- (id)hardwareButtonIdentifier
{
  return CFSTR("VoiceCommand");
}

- (SBHardwareButtonCoordinator)hardwareButtonCoordinator
{
  return self->_hardwareButtonCoordinator;
}

- (void)setHardwareButtonCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_hardwareButtonCoordinator, a3);
}

- (SBHIDButtonStateArbiter)buttonArbiter
{
  return self->_buttonArbiter;
}

- (void)setButtonArbiter:(id)a3
{
  objc_storeStrong((id *)&self->_buttonArbiter, a3);
}

- (SBSiriHardwareButtonInteraction)siriHardwareButtonInteraction
{
  return self->_siriHardwareButtonInteraction;
}

- (void)setSiriHardwareButtonInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_siriHardwareButtonInteraction, a3);
}

- (BOOL)isLongPressRecognized
{
  return self->_isLongPressRecognized;
}

- (void)setIsLongPressRecognized:(BOOL)a3
{
  self->_isLongPressRecognized = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriHardwareButtonInteraction, 0);
  objc_storeStrong((id *)&self->_buttonArbiter, 0);
  objc_storeStrong((id *)&self->_hardwareButtonCoordinator, 0);
}

@end
