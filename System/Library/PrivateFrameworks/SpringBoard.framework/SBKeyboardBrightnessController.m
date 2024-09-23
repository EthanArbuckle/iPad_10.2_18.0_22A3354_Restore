@implementation SBKeyboardBrightnessController

- (SBKeyboardBrightnessController)initWithCoordinator:(id)a3
{
  id v5;
  SBKeyboardBrightnessController *v6;
  SBKeyboardBrightnessController *v7;
  KeyboardBrightnessClient *v8;
  KeyboardBrightnessClient *keyboardBrightnessClient;
  SBHIDValueModifyingButtonSetArbiter *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  SBHIDValueModifyingButtonSetArbiter *buttonArbiter;
  void *v17;
  objc_super v18;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBKeyboardBrightnessController.m"), 35, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("coordinator"));

  }
  v18.receiver = self;
  v18.super_class = (Class)SBKeyboardBrightnessController;
  v6 = -[SBKeyboardBrightnessController init](&v18, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeWeak((id *)&v6->_coordinator, v5);
    v8 = (KeyboardBrightnessClient *)objc_alloc_init(MEMORY[0x1E0D15730]);
    keyboardBrightnessClient = v7->_keyboardBrightnessClient;
    v7->_keyboardBrightnessClient = v8;

    v10 = [SBHIDValueModifyingButtonSetArbiter alloc];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 786553);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v11;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 786554);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[SBHIDValueModifyingButtonSetArbiter initWithHIDKeyPressEventUsages:initialRepeatDelay:subsequentRepeatDelay:](v10, "initWithHIDKeyPressEventUsages:initialRepeatDelay:subsequentRepeatDelay:", v13, 0.333000004, 0.0416666679);
    buttonArbiter = v7->_buttonArbiter;
    v7->_buttonArbiter = (SBHIDValueModifyingButtonSetArbiter *)v14;

    -[SBHIDValueModifyingButtonSetArbiter setDelegate:](v7->_buttonArbiter, "setDelegate:", v7);
  }

  return v7;
}

+ (BOOL)handlesKeyCommands
{
  if (handlesKeyCommands_onceToken != -1)
    dispatch_once(&handlesKeyCommands_onceToken, &__block_literal_global_73);
  return objc_msgSend((id)handlesKeyCommands_settings, "keyboardBrightnessKeyCommandsEnabled");
}

void __52__SBKeyboardBrightnessController_handlesKeyCommands__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[SBElasticHUDDomain rootSettings](SBElasticHUDDomain, "rootSettings");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)handlesKeyCommands_settings;
  handlesKeyCommands_settings = v0;

}

- (int64_t)brightnessRouteType
{
  return 2;
}

- (void)handleBrightnessKeyPressEvent:(__IOHIDEvent *)a3
{
  -[SBHIDValueModifyingButtonSetArbiter processKeyboardEvent:](self->_buttonArbiter, "processKeyboardEvent:", a3);
}

- (void)cancelBrightnessKeyPressEvent
{
  -[SBHIDValueModifyingButtonSetArbiter reset](self->_buttonArbiter, "reset");
}

- (void)buttonSetArbiter:(id)a3 performActionForButtonPage:(unsigned __int16)a4 usage:(unsigned __int16)a5
{
  int v5;
  int v6;
  id WeakRetained;
  void *v10;
  SBKeyboardBrightnessController *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;

  v5 = a5;
  v6 = a4;
  v15 = a3;
  if (v6 != 12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBKeyboardBrightnessController.m"), 97, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("page == kHIDPage_Consumer"), v15);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_coordinator);
  v10 = WeakRetained;
  if (v5 == 122)
  {
    v11 = self;
    v12 = 0;
    v13 = 1;
    goto LABEL_7;
  }
  if (v5 == 121)
  {
    v11 = self;
    v12 = 1;
    v13 = 0;
LABEL_7:
    objc_msgSend(WeakRetained, "brightnessController:performCoordinatedBrightnessChangeForIncrementKeyDown:decrementKeyDown:", v11, v12, v13);
  }

}

- (void)buttonSetArbiterDidReset:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_coordinator);
  objc_msgSend(WeakRetained, "brightnessController:performCoordinatedBrightnessChangeForIncrementKeyDown:decrementKeyDown:", self, 0, 0);

}

- (float)_currentBrightness
{
  float result;

  -[KeyboardBrightnessClient brightnessForKeyboard:](self->_keyboardBrightnessClient, "brightnessForKeyboard:", *MEMORY[0x1E0D15740]);
  return result;
}

- (BOOL)_setBrightnessLevel:(float)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v7;
  double v8;
  uint64_t v10;

  v4 = a4;
  v7 = *MEMORY[0x1E0D15740];
  if (!-[KeyboardBrightnessClient isAmbientFeatureAvailableOnKeyboard:](self->_keyboardBrightnessClient, "isAmbientFeatureAvailableOnKeyboard:", *MEMORY[0x1E0D15740])|| (-[KeyboardBrightnessClient isBacklightSaturatedOnKeyboard:](self->_keyboardBrightnessClient, "isBacklightSaturatedOnKeyboard:", v7) & 1) != 0)
  {
    return 0;
  }
  if (v4)
    v10 = 150;
  else
    v10 = 0;
  *(float *)&v8 = a3;
  return -[KeyboardBrightnessClient setBrightness:fadeSpeed:commit:forKeyboard:](self->_keyboardBrightnessClient, "setBrightness:fadeSpeed:commit:forKeyboard:", v10, 1, v7, v8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonArbiter, 0);
  objc_storeStrong((id *)&self->_keyboardBrightnessClient, 0);
  objc_destroyWeak((id *)&self->_coordinator);
}

@end
