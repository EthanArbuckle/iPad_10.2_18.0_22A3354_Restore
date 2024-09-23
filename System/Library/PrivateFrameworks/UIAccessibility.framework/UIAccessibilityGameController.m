@implementation UIAccessibilityGameController

+ (UIAccessibilityGameController)sharedGameController
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__UIAccessibilityGameController_sharedGameController__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedGameController_onceToken != -1)
    dispatch_once(&sharedGameController_onceToken, block);
  return (UIAccessibilityGameController *)(id)SharedController;
}

void __53__UIAccessibilityGameController_sharedGameController__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)SharedController;
  SharedController = v0;

}

- (UIAccessibilityGameController)init
{
  UIAccessibilityGameController *v2;
  void *v3;
  uint64_t v4;
  UIAccessibilityGamepadEventSource *eventSource;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  id v11;
  void *v12;
  uint64_t v13;
  GCController *controller;
  GCController *v15;
  void *v16;
  void *v17;
  objc_super v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
  v19.receiver = self;
  v19.super_class = (Class)UIAccessibilityGameController;
  v2 = -[UIAccessibilityGameController init](&v19, sel_init);
  if (v2)
  {
    v3 = (void *)objc_opt_new();
    v4 = objc_opt_new();
    eventSource = v2->_eventSource;
    v2->_eventSource = (UIAccessibilityGamepadEventSource *)v4;

    v25 = 0;
    v26 = &v25;
    v27 = 0x2050000000;
    v6 = (void *)getGCExtendedGamepadClass_softClass;
    v28 = getGCExtendedGamepadClass_softClass;
    if (!getGCExtendedGamepadClass_softClass)
    {
      v20 = MEMORY[0x1E0C809B0];
      v21 = 3221225472;
      v22 = (uint64_t)__getGCExtendedGamepadClass_block_invoke;
      v23 = &unk_1E3DFDD78;
      v24 = &v25;
      __getGCExtendedGamepadClass_block_invoke((uint64_t)&v20);
      v6 = (void *)v26[3];
    }
    v7 = objc_retainAutorelease(v6);
    _Block_object_dispose(&v25, 8);
    v8 = (void *)objc_msgSend([v7 alloc], "initWithIdentifier:", CFSTR("Apple Virtual Game Controller"));
    objc_msgSend(v8, "setGamepadEventSource:", v2->_eventSource);
    v25 = 0;
    v26 = &v25;
    v27 = 0x2050000000;
    v9 = (void *)getGCControllerClass_softClass;
    v28 = getGCControllerClass_softClass;
    if (!getGCControllerClass_softClass)
    {
      v20 = MEMORY[0x1E0C809B0];
      v21 = 3221225472;
      v22 = (uint64_t)__getGCControllerClass_block_invoke;
      v23 = &unk_1E3DFDD78;
      v24 = &v25;
      __getGCControllerClass_block_invoke((uint64_t)&v20);
      v9 = (void *)v26[3];
    }
    v10 = objc_retainAutorelease(v9);
    _Block_object_dispose(&v25, 8);
    v11 = [v10 alloc];
    v29[0] = v3;
    v29[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "initWithComponents:", v12);
    controller = v2->_controller;
    v2->_controller = (GCController *)v13;

    v15 = v2->_controller;
    v20 = 0;
    v21 = (uint64_t)&v20;
    v22 = 0x2020000000;
    v16 = get_publishCustomControllerSymbolLoc_ptr;
    v23 = get_publishCustomControllerSymbolLoc_ptr;
    if (!get_publishCustomControllerSymbolLoc_ptr)
    {
      v17 = (void *)GameControllerLibrary();
      v16 = dlsym(v17, "_publishCustomController");
      *(_QWORD *)(v21 + 24) = v16;
      get_publishCustomControllerSymbolLoc_ptr = v16;
    }
    _Block_object_dispose(&v20, 8);
    if (!v16)
      -[UIAccessibilityGameController init].cold.1();
    ((void (*)(GCController *))v16)(v15);

  }
  return v2;
}

- (id)vendorName
{
  return CFSTR("Apple");
}

- (id)productCategory
{
  return CFSTR("Accessibility Game Controller");
}

- (id)identifier
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Accessibility game controller %p"), self);
}

- (void)pressButton:(id)a3
{
  id v4;
  void *v5;
  double v6;
  float v7;
  float v8;
  double v9;
  float v10;
  double v11;
  float v12;
  float v13;
  double v14;
  float v15;
  double v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;

  v4 = a3;
  get_GCGamepadEventImplClass();
  v5 = (void *)objc_opt_new();
  switch(objc_msgSend(v4, "button"))
  {
    case 1:
      LODWORD(v6) = 1.0;
      objc_msgSend(v5, "setButtonAValue:", v6);
      break;
    case 2:
      LODWORD(v6) = 1.0;
      objc_msgSend(v5, "setButtonBValue:", v6);
      break;
    case 3:
      LODWORD(v6) = 1.0;
      objc_msgSend(v5, "setButtonXValue:", v6);
      break;
    case 4:
      LODWORD(v6) = 1.0;
      objc_msgSend(v5, "setButtonYValue:", v6);
      break;
    case 5:
      LODWORD(v6) = 1.0;
      objc_msgSend(v5, "setButtonLeftShoulder:", v6);
      break;
    case 6:
      LODWORD(v6) = 1.0;
      objc_msgSend(v5, "setLeftTrigger:", v6);
      break;
    case 7:
      LODWORD(v6) = 1.0;
      objc_msgSend(v5, "setButtonRightShoulder:", v6);
      break;
    case 8:
      LODWORD(v6) = 1.0;
      objc_msgSend(v5, "setRightTrigger:", v6);
      break;
    case 9:
      LODWORD(v6) = 1.0;
      objc_msgSend(v5, "setDpadUpValue:", v6);
      break;
    case 10:
      LODWORD(v6) = 1.0;
      objc_msgSend(v5, "setDpadDownValue:", v6);
      break;
    case 11:
      LODWORD(v6) = 1.0;
      objc_msgSend(v5, "setDpadLeftValue:", v6);
      break;
    case 12:
      LODWORD(v6) = 1.0;
      objc_msgSend(v5, "setDpadRightValue:", v6);
      break;
    case 13:
      objc_msgSend(v4, "xMagnitude");
      v8 = v7;
      objc_msgSend(v4, "yMagnitude");
      v10 = *(float *)&v9;
      if (v8 <= 0.0)
      {
        *(float *)&v9 = fabsf(v8);
        objc_msgSend(v5, "setLeftThumbstickLeft:", v9);
      }
      else
      {
        *(float *)&v9 = v8;
        objc_msgSend(v5, "setLeftThumbstickRight:", v9);
      }
      if (v10 <= 0.0)
      {
        *(float *)&v11 = fabsf(v10);
        objc_msgSend(v5, "setLeftThumbstickDown:", v11);
      }
      else
      {
        *(float *)&v11 = v10;
        objc_msgSend(v5, "setLeftThumbstickUp:", v11);
      }
      break;
    case 14:
      objc_msgSend(v4, "xMagnitude");
      v13 = v12;
      objc_msgSend(v4, "yMagnitude");
      v15 = *(float *)&v14;
      if (v13 <= 0.0)
      {
        *(float *)&v14 = fabsf(v13);
        objc_msgSend(v5, "setRightThumbstickLeft:", v14);
      }
      else
      {
        *(float *)&v14 = v13;
        objc_msgSend(v5, "setRightThumbstickRight:", v14);
      }
      if (v15 <= 0.0)
      {
        *(float *)&v16 = fabsf(v15);
        objc_msgSend(v5, "setRightThumbstickDown:", v16);
      }
      else
      {
        *(float *)&v16 = v15;
        objc_msgSend(v5, "setRightThumbstickUp:", v16);
      }
      break;
    default:
      break;
  }
  -[UIAccessibilityGameController eventSource](self, "eventSource");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "publishGamepadEvent:", v5);
  v20 = v4;
  v21 = v17;
  v18 = v17;
  v19 = v4;
  AXPerformBlockOnMainThreadAfterDelay();

}

void __45__UIAccessibilityGameController_pressButton___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;

  get_GCGamepadEventImplClass();
  v9 = (id)objc_opt_new();
  switch(objc_msgSend(*(id *)(a1 + 32), "button"))
  {
    case 1:
      LODWORD(v2) = 0;
      objc_msgSend(v9, "setButtonAValue:", v2);
      break;
    case 2:
      LODWORD(v2) = 0;
      objc_msgSend(v9, "setButtonBValue:", v2);
      break;
    case 3:
      LODWORD(v2) = 0;
      objc_msgSend(v9, "setButtonXValue:", v2);
      break;
    case 4:
      LODWORD(v2) = 0;
      objc_msgSend(v9, "setButtonYValue:", v2);
      break;
    case 5:
      LODWORD(v2) = 0;
      objc_msgSend(v9, "setButtonLeftShoulder:", v2);
      break;
    case 6:
      LODWORD(v2) = 0;
      objc_msgSend(v9, "setLeftTrigger:", v2);
      break;
    case 7:
      LODWORD(v2) = 0;
      objc_msgSend(v9, "setButtonRightShoulder:", v2);
      break;
    case 8:
      LODWORD(v2) = 0;
      objc_msgSend(v9, "setRightTrigger:", v2);
      break;
    case 9:
      LODWORD(v2) = 0;
      objc_msgSend(v9, "setDpadUpValue:", v2);
      break;
    case 10:
      LODWORD(v2) = 0;
      objc_msgSend(v9, "setDpadDownValue:", v2);
      break;
    case 11:
      LODWORD(v2) = 0;
      objc_msgSend(v9, "setDpadLeftValue:", v2);
      break;
    case 12:
      LODWORD(v2) = 0;
      objc_msgSend(v9, "setDpadRightValue:", v2);
      break;
    case 13:
      LODWORD(v2) = 0;
      objc_msgSend(v9, "setLeftThumbstickUp:", v2);
      LODWORD(v3) = 0;
      objc_msgSend(v9, "setLeftThumbstickDown:", v3);
      LODWORD(v4) = 0;
      objc_msgSend(v9, "setLeftThumbstickLeft:", v4);
      LODWORD(v5) = 0;
      objc_msgSend(v9, "setLeftThumbstickRight:", v5);
      break;
    case 14:
      LODWORD(v2) = 0;
      objc_msgSend(v9, "setRightThumbstickUp:", v2);
      LODWORD(v6) = 0;
      objc_msgSend(v9, "setRightThumbstickDown:", v6);
      LODWORD(v7) = 0;
      objc_msgSend(v9, "setRightThumbstickLeft:", v7);
      LODWORD(v8) = 0;
      objc_msgSend(v9, "setRightThumbstickRight:", v8);
      break;
    default:
      break;
  }
  objc_msgSend(*(id *)(a1 + 40), "publishGamepadEvent:", v9);

}

- (UIAccessibilityGamepadEventSource)eventSource
{
  return self->_eventSource;
}

- (void)setEventSource:(id)a3
{
  objc_storeStrong((id *)&self->_eventSource, a3);
}

- (GCController)controller
{
  return self->_controller;
}

- (void)setController:(id)a3
{
  objc_storeStrong((id *)&self->_controller, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controller, 0);
  objc_storeStrong((id *)&self->_eventSource, 0);
}

- (void)init
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL _publishCustomControllerSoft(GCController *__strong)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("UIAccessibilityGameController.m"), 21, CFSTR("%s"), dlerror());

  __break(1u);
}

@end
