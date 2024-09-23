@implementation UIKeyboardPreferencesController

- (void)forwardInvocation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  v5 = &unk_1EE0CE828;
  if ((unint64_t)protocol_getMethodDescription((Protocol *)v5, (SEL)objc_msgSend(v4, "selector"), 1, 1).name)
  {
    objc_msgSend(MEMORY[0x1E0DBDCB0], "sharedPreferencesController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "forwardInvocation:", v4);

  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UIKeyboardPreferencesController;
    -[UIKeyboardPreferencesController forwardInvocation:](&v7, sel_forwardInvocation_, v4);
  }

}

- (BOOL)currentInputModeSupportsCrescendo
{
  void *v3;
  void *v4;
  uint64_t v5;
  BOOL v6;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;

  if (!-[UIKeyboardPreferencesController crescendoEnabled](self, "crescendoEnabled"))
    return 0;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textInputTraits");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "keyboardType");
  if ((objc_msgSend(v4, "isCarPlayIdiom") & 1) != 0)
    goto LABEL_5;
  if (!UIKeyboardGetCurrentIdiom())
  {
    v6 = 0;
    v8 = v5 > 0xB || ((1 << v5) & 0x930) == 0;
    if (!v8 || (_DWORD)v5 == 127)
      goto LABEL_6;
  }
  if (v5 == 127)
  {
LABEL_5:
    v6 = 0;
  }
  else
  {
    +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "currentInputMode");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "identifierWithLayouts");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = -[UIKeyboardPreferencesController inputModeSupportsCrescendo:](self, "inputModeSupportsCrescendo:", v11);
  }
LABEL_6:

  return v6;
}

- (BOOL)inputModeSupportsCrescendo:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;

  v3 = a3;
  if (!inputModeSupportsCrescendo__supportedModes)
  {
    getTUIKeyboardLayoutFactoryClass_0();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(getTUIKeyboardLayoutFactoryClass_0(), "crescendoLayouts");
    else
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("Dvorak"), CFSTR("QWERTY-Chickasaw"), CFSTR("QWERTY-Choctaw"), CFSTR("QWERTY-Mikmaw"), CFSTR("Osage-QWERTY"), CFSTR("Coptic"), CFSTR("Mandaic"), 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)inputModeSupportsCrescendo__supportedModes;
    inputModeSupportsCrescendo__supportedModes = v4;

  }
  KBStarLayoutString(v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend((id)inputModeSupportsCrescendo__supportedModes, "containsObject:", v6);

  return v7;
}

- (BOOL)crescendoEnabled
{
  return 1;
}

- (void)_configurePreferences
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;

  v2 = MGGetBoolAnswer();
  objc_msgSend(MEMORY[0x1E0DBDCB0], "sharedPreferencesController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C9AAB0];
  objc_msgSend(v3, "_configureKey:domain:defaultValue:", CFSTR("YukonMagnifiersDisabled"), CFSTR("com.apple.keyboard.preferences"), MEMORY[0x1E0C9AAB0]);

  objc_msgSend(MEMORY[0x1E0DBDCB0], "sharedPreferencesController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_configureKey:domain:defaultValue:", CFSTR("GesturesEnabled"), CFSTR("com.apple.keyboard.preferences"), v6);

  objc_msgSend(MEMORY[0x1E0DBDCB0], "sharedPreferencesController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_configureKey:domain:defaultValue:", CFSTR("HandwritingAutoConfirmationEnabled"), CFSTR("com.apple.InputModePreferences"), v4);

  objc_msgSend(MEMORY[0x1E0DBDCB0], "sharedPreferencesController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_configureKey:domain:defaultValue:", CFSTR("HandwritingAutoConfirmationMinTimeout"), CFSTR("com.apple.keyboard"), &unk_1E1A959F0);

  objc_msgSend(MEMORY[0x1E0DBDCB0], "sharedPreferencesController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_configureKey:domain:defaultValue:", CFSTR("HandwritingAutoConfirmationMaxTimeout"), CFSTR("com.apple.keyboard"), &unk_1E1A95A00);

  objc_msgSend(MEMORY[0x1E0DBDCB0], "sharedPreferencesController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C9AAA0];
  objc_msgSend(v10, "_configureKey:domain:defaultValue:", CFSTR("DidShowGestureKeyboardIntroduction"), CFSTR("com.apple.keyboard.preferences"), MEMORY[0x1E0C9AAA0]);

  objc_msgSend(MEMORY[0x1E0DBDCB0], "sharedPreferencesController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_configureKey:domain:defaultValue:", CFSTR("SwipeDeleteWordEnabled"), CFSTR("com.apple.keyboard"), v11);

  objc_msgSend(MEMORY[0x1E0DBDCB0], "sharedPreferencesController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_configureKey:domain:defaultValue:", CFSTR("RepeatDeleteWordEnabled"), CFSTR("com.apple.keyboard"), v11);

  objc_msgSend(MEMORY[0x1E0DBDCB0], "sharedPreferencesController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_configureKey:domain:defaultValue:", CFSTR("RepeatDeleteWordFirstDelay"), CFSTR("com.apple.keyboard"), &unk_1E1A95A10);

  objc_msgSend(MEMORY[0x1E0DBDCB0], "sharedPreferencesController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "_configureKey:domain:defaultValue:", CFSTR("RepeatDeleteWordRepeatInterfal"), CFSTR("com.apple.keyboard"), &unk_1E1A95A10);

  objc_msgSend(MEMORY[0x1E0DBDCB0], "sharedPreferencesController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "_configureKey:domain:defaultValue:", CFSTR("RepeatDeleteWordCountForDecrement"), CFSTR("com.apple.keyboard"), &unk_1E1A98178);

  if (+[UIKeyboard isRedesignedTextCursorEnabled](UIKeyboard, "isRedesignedTextCursorEnabled"))
    v17 = 1.0;
  else
    v17 = 2.0;
  objc_msgSend(MEMORY[0x1E0DBDCB0], "sharedPreferencesController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "_configureKey:domain:defaultValue:", CFSTR("DictationMenuReturnPauseInterval"), CFSTR("com.apple.keyboard"), v19);

  objc_msgSend(MEMORY[0x1E0DBDCB0], "sharedPreferencesController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "_configureKey:domain:defaultValue:", CFSTR("DetachHardwareKeyboardDelayInterval"), CFSTR("com.apple.keyboard"), &unk_1E1A98190);

  objc_msgSend(MEMORY[0x1E0DBDCB0], "sharedPreferencesController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "_configureKey:domain:defaultValue:", CFSTR("ShowPasswordKeyboardInVideo"), CFSTR("com.apple.keyboard"), v11);

  objc_msgSend(MEMORY[0x1E0DBDCB0], "sharedPreferencesController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "_configureKey:domain:defaultValue:", CFSTR("ShowKeyboardButtonOnDictationPopover"), CFSTR("com.apple.keyboard"), v11);

  objc_msgSend(MEMORY[0x1E0DBDCB0], "sharedPreferencesController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "_configureKey:domain:defaultValue:", CFSTR("DictationCommandTipsEnabled"), CFSTR("com.apple.keyboard"), v11);

  objc_msgSend(MEMORY[0x1E0DBDCB0], "sharedPreferencesController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "_configureKey:domain:defaultValue:", CFSTR("DictationWordwiseBackspaceEnabled"), CFSTR("com.apple.keyboard.preferences"), v4);

  objc_msgSend(MEMORY[0x1E0DBDCB0], "sharedPreferencesController");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "_configureKey:domain:defaultValue:", CFSTR("ShowDockItemTouchArea"), CFSTR("com.apple.keyboard.preferences"), v11);

  objc_msgSend(MEMORY[0x1E0DBDCB0], "sharedPreferencesController");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "_configureKey:domain:defaultValue:", CFSTR("KeyboardDockItemHitAreaReductionPercent"), CFSTR("com.apple.keyboard.preferences"), &unk_1E1A981A8);

  objc_msgSend(MEMORY[0x1E0DBDCB0], "sharedPreferencesController");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "_configureKey:domain:defaultValue:", CFSTR("DidShowInlineCompletionEducationTip"), CFSTR("com.apple.keyboard.preferences"), v11);

  objc_msgSend(MEMORY[0x1E0DBDCB0], "sharedPreferencesController");
  v28 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "_configureKey:domain:defaultValue:", CFSTR("InlineCompletionAcceptedBySpaceEventCount"), CFSTR("com.apple.keyboard.preferences"), &unk_1E1A981C0);

}

- (BOOL)BOOLForPreferenceKey:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  char v6;

  v3 = (void *)MEMORY[0x1E0DBDCB0];
  v4 = a3;
  objc_msgSend(v3, "sharedPreferencesController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLForPreferenceKey:", v4);

  return v6;
}

- (int64_t)visceral
{
  void *v2;
  int64_t v3;

  -[UIKeyboardPreferencesController valueForPreferenceKey:](self, "valueForPreferenceKey:", *MEMORY[0x1E0DBE448]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (id)valueForPreferenceKey:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0DBDCB0];
  v4 = a3;
  objc_msgSend(v3, "sharedPreferencesController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForPreferenceKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)sharedPreferencesController
{
  if (_MergedGlobals_1110 != -1)
    dispatch_once(&_MergedGlobals_1110, &__block_literal_global_309);
  return (id)qword_1ECD7EB50;
}

void __51__UIKeyboardPreferencesController_rivenSizeFactor___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  uint64_t v9;
  id v10;

  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_deviceInfoForKey:", CFSTR("main-screen-class"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_deviceInfoForKey:", CFSTR("ProductType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(&unk_1E1A93830, "containsObject:", v6);

  if ((v7 & 1) != 0 || (v4 & 0xFFFFFFFE) == 6)
  {
    +[UIScreen mainScreen](UIScreen, "mainScreen");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_pointsPerInch");
    rivenSizeFactor__ppi = v9;

  }
  objc_msgSend(*(id *)(a1 + 32), "valueForPreferenceKey:", *MEMORY[0x1E0DBE4F0]);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  qword_1ECD7EB58 = (int)objc_msgSend(v10, "intValue");

}

- (int64_t)handBias
{
  void *v2;
  int64_t v3;

  -[UIKeyboardPreferencesController valueForPreferenceKey:](self, "valueForPreferenceKey:", *MEMORY[0x1E0DBE1E0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(CFSTR("Left"), "isEqualToString:", v2) & 1) != 0)
    v3 = 2;
  else
    v3 = objc_msgSend(CFSTR("Right"), "isEqualToString:", v2);

  return v3;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v5 = &unk_1EE0CE828;
  if ((unint64_t)protocol_getMethodDescription((Protocol *)v5, a3, 1, 1).name)
  {
    objc_msgSend(MEMORY[0x1E0DBDCB0], "sharedPreferencesController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "methodSignatureForSelector:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)UIKeyboardPreferencesController;
    -[UIKeyboardPreferencesController methodSignatureForSelector:](&v9, sel_methodSignatureForSelector_, a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (BOOL)keyboardLanguageIndicatorEnabled
{
  _BOOL4 v3;

  v3 = +[UIKeyboard isRedesignedTextCursorEnabled](UIKeyboard, "isRedesignedTextCursorEnabled");
  if (v3)
    LOBYTE(v3) = -[UIKeyboardPreferencesController BOOLForPreferenceKey:](self, "BOOLForPreferenceKey:", CFSTR("KeyboardLanguageIndicatorEnabled"));
  return v3;
}

void __62__UIKeyboardPreferencesController_sharedPreferencesController__block_invoke()
{
  UIKeyboardPreferencesController *v0;
  void *v1;

  v0 = objc_alloc_init(UIKeyboardPreferencesController);
  v1 = (void *)qword_1ECD7EB50;
  qword_1ECD7EB50 = (uint64_t)v0;

}

- (UIKeyboardPreferencesController)init
{
  UIKeyboardPreferencesController *v2;
  UIKeyboardPreferencesController *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  UIKeyboardPreferencesController *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)UIKeyboardPreferencesController;
  v2 = -[UIKeyboardPreferencesController init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    -[UIKeyboardPreferencesController _configurePreferences](v2, "_configurePreferences");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *MEMORY[0x1E0DBE478];
    objc_msgSend(MEMORY[0x1E0DBDCB0], "sharedPreferencesController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel_preferencesControllerChanged_, v5, v6);

    v7 = v3;
  }

  return v3;
}

- (double)rivenSizeFactor:(double)a3
{
  unint64_t v4;
  BOOL v5;
  double result;
  double v7;
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__UIKeyboardPreferencesController_rivenSizeFactor___block_invoke;
  block[3] = &unk_1E16B1B28;
  block[4] = self;
  if (qword_1ECD7EB60 != -1)
    dispatch_once(&qword_1ECD7EB60, block);
  v4 = UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL;
  v5 = *(double *)&rivenSizeFactor__ppi > 0.0 && v4 == 1;
  result = *(double *)&rivenSizeFactor__ppi / 132.0;
  if (!v5)
    result = 1.0;
  if ((unint64_t)qword_1ECD7EB58 >= 2)
    result = 1.23484848;
  v7 = round(result * a3);
  if (a3 != 1.0)
    return v7;
  return result;
}

- (BOOL)isPasswordAutoFillAllowed
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "isPasswordAutoFillAllowed");
  else
    v3 = 1;

  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DBE478], 0);

  v4.receiver = self;
  v4.super_class = (Class)UIKeyboardPreferencesController;
  -[UIKeyboardPreferencesController dealloc](&v4, sel_dealloc);
}

- (void)preferencesControllerChanged:(id)a3
{
  id v3;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateDefaultsWithResults:", &__block_literal_global_68_0);

}

void __64__UIKeyboardPreferencesController_preferencesControllerChanged___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(a2, "objectForKey:", *MEMORY[0x1E0DBE2F8]);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleLastUsedInputMode:withNewInputMode:", 0, v4);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("UIKeyboardPreferencesDidUpdateNotification"), 0);

}

- (id)valueForKey:(int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = *(_QWORD *)&a3;
  objc_msgSend(MEMORY[0x1E0DBDCB0], "sharedPreferencesController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)BOOLForKey:(int)a3
{
  uint64_t v3;
  void *v4;

  v3 = *(_QWORD *)&a3;
  objc_msgSend(MEMORY[0x1E0DBDCB0], "sharedPreferencesController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "BOOLForKey:", v3);

  return v3;
}

- (void)synchronizePreferences
{
  id v2;

  objc_msgSend(MEMORY[0x1E0DBDCB0], "sharedPreferencesController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronizePreferences");

}

- (void)touchSynchronizePreferencesTimer
{
  id v2;

  objc_msgSend(MEMORY[0x1E0DBDCB0], "sharedPreferencesController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "touchSynchronizePreferencesTimer");

}

- (void)setValue:(id)a3 forKey:(int)a4
{
  uint64_t v4;
  void *v5;
  id v6;
  id v7;

  v4 = *(_QWORD *)&a4;
  v5 = (void *)MEMORY[0x1E0DBDCB0];
  v6 = a3;
  objc_msgSend(v5, "sharedPreferencesController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setValue:forKey:", v6, v4);

}

- (void)setValue:(id)a3 forPreferenceKey:(id)a4
{
  void *v5;
  id v6;
  id v7;
  id v8;

  v5 = (void *)MEMORY[0x1E0DBDCB0];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "sharedPreferencesController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forPreferenceKey:", v7, v6);

}

- (void)saveInputModes:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v4 = (void *)MEMORY[0x1E0DBDCB0];
  v5 = a3;
  objc_msgSend(v4, "sharedPreferencesController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateInputModes:", v5);

  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v7, "updateEnabledDictationLanguages:", 1);

  -[UIKeyboardPreferencesController touchSynchronizePreferencesTimer](self, "touchSynchronizePreferencesTimer");
  +[_UIKeyboardUsageTracking keyboardExtensionsOnDevice](_UIKeyboardUsageTracking, "keyboardExtensionsOnDevice");
}

- (void)setLanguageAwareInputModeLastUsed:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  id v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  int v45;
  int v46;
  int v47;
  uint64_t v48;
  void *v49;
  void *v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t i;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _QWORD v65[4];
  id v66;
  id v67;
  id v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t (*v73)(uint64_t, uint64_t);
  void (*v74)(uint64_t);
  id v75;
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    TIInputModeGetNormalizedIdentifier();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("emoji"));

    if (v5)
    {
      -[UIKeyboardPreferencesController preferencesActions](self, "preferencesActions");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "inputModeSelectionSequence");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v7, "count"))
      {
        objc_msgSend(v7, "firstObject");
        v8 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v8 = 0;
      }

      v3 = (id)v8;
    }
  }
  if (objc_msgSend(v3, "length"))
  {
    -[UIKeyboardPreferencesController valueForPreferenceKey:](self, "valueForPreferenceKey:", *MEMORY[0x1E0DBE2F8]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKeyboardInputMode keyboardInputModeWithIdentifier:](UIKeyboardInputMode, "keyboardInputModeWithIdentifier:", v3);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKeyboardInputMode keyboardInputModeWithIdentifier:](UIKeyboardInputMode, "keyboardInputModeWithIdentifier:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "inputModeContextIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      +[UIPeripheralHost sharedInstance](UIPeripheralHost, "sharedInstance");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "lastUsedInputModeForCurrentContext");
      v57 = (void *)objc_claimAutoreleasedReturnValue();

      if (v57)
      {
        objc_msgSend(v57, "identifier");
        v14 = objc_claimAutoreleasedReturnValue();

        v15 = (void *)v14;
        goto LABEL_14;
      }
      +[UIKeyboardInputMode keyboardInputModeWithIdentifier:](UIKeyboardInputMode, "keyboardInputModeWithIdentifier:", v9);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v57 = v10;
    }
    v15 = v9;
LABEL_14:
    v56 = v15;
    if ((UIKeyboardInputModesEqual(v3, v15) & 1) == 0)
    {
      TIInputModeGetNormalizedIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("emoji"));

      if ((v17 & 1) == 0)
      {
        if ((objc_msgSend(v58, "isExtensionInputMode") & 1) == 0
          && (objc_msgSend(v57, "isExtensionInputMode") & 1) == 0)
        {
          TIInputModeGetBaseLanguage();
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          TIInputModeGetBaseLanguage();
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v18, "isEqualToString:", v19);

          if ((v20 & 1) == 0)
          {
            v21 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "firstObject");
            v23 = objc_claimAutoreleasedReturnValue();
            v24 = (void *)v23;
            v25 = CFSTR("Unknown");
            if (v23)
              v25 = (const __CFString *)v23;
            objc_msgSend(v21, "stringWithFormat:", CFSTR("%@.%@"), *MEMORY[0x1E0DBE790], v25);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            TIStatisticGetKey();
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            TIStatisticScalarIncrement();

          }
        }
        +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "inputModeContextIdentifier");
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v29)
        {
          if (!+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
          {
            -[UIKeyboardPreferencesController preferencesActions](self, "preferencesActions");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "updateLastUsedInputMode:", v3);

          }
          +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "handleLastUsedInputMode:withNewInputMode:", 0, v3);

        }
        -[UIKeyboardPreferencesController preferencesActions](self, "preferencesActions");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "updateLastUsedLayout:", v3);

        -[UIKeyboardPreferencesController touchSynchronizePreferencesTimer](self, "touchSynchronizePreferencesTimer");
      }
    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardPreferencesController valueForPreferenceKey:](self, "valueForPreferenceKey:", *MEMORY[0x1E0DBE2F0]);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    TIInputModeGetLanguageWithRegion();
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = 0;
    v71 = &v70;
    v72 = 0x3032000000;
    v73 = __Block_byref_object_copy__119;
    v74 = __Block_byref_object_dispose__119;
    objc_msgSend(v34, "objectForKey:", v59);
    v75 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v58, "isExtensionInputMode"))
    {
      objc_msgSend(v58, "languageWithRegion");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), CFSTR("_"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      v65[0] = MEMORY[0x1E0C809B0];
      v65[1] = 3221225472;
      v65[2] = __69__UIKeyboardPreferencesController_setLanguageAwareInputModeLastUsed___block_invoke;
      v65[3] = &unk_1E16CD4F0;
      v37 = v36;
      v66 = v37;
      v69 = &v70;
      v38 = v3;
      v67 = v38;
      v39 = v33;
      v68 = v39;
      objc_msgSend(v34, "enumerateKeysAndObjectsUsingBlock:", v65);
      if (objc_msgSend(v39, "count"))
      {
        v59 = v37;
      }
      else
      {
        TIGetDefaultInputModesForLanguage();
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v40, "count"))
        {
          objc_msgSend(v40, "firstObject");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          TIInputModeGetLanguageWithRegion();
          v59 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v34, "objectForKey:", v59);
          v42 = objc_claimAutoreleasedReturnValue();
          v43 = (void *)v71[5];
          v71[5] = v42;

          if ((UIKeyboardInputModesEqual(v38, (void *)v71[5]) & 1) == 0)
            objc_msgSend(v39, "addObject:", v59);
        }
        else
        {
          v59 = v37;
        }

      }
    }
    else if ((UIKeyboardInputModesEqual(v3, (void *)v71[5]) & 1) == 0)
    {
      objc_msgSend(v33, "addObject:", v59);
    }
    if (UIKeyboardLayoutDefaultTypeForInputModeIsASCIICapable(v3))
    {
      objc_msgSend(v34, "objectForKey:", CFSTR("ASCIICapable"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = 0;
      v46 = UIKeyboardInputModesEqual(v3, v44) ^ 1;
    }
    else
    {
      objc_msgSend(v34, "objectForKey:", CFSTR("NonASCII"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = 0;
      v45 = UIKeyboardInputModesEqual(v3, v44) ^ 1;
    }

    if (objc_msgSend(v33, "count"))
      v47 = 1;
    else
      v47 = v46;
    if ((v47 | v45) == 1)
    {
      if (v34)
        v48 = objc_msgSend(v34, "mutableCopy");
      else
        v48 = objc_opt_new();
      v49 = (void *)v48;
      v63 = 0u;
      v64 = 0u;
      v61 = 0u;
      v62 = 0u;
      v50 = v33;
      v51 = v33;
      v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v61, v76, 16);
      if (v52)
      {
        v53 = *(_QWORD *)v62;
        do
        {
          for (i = 0; i != v52; ++i)
          {
            if (*(_QWORD *)v62 != v53)
              objc_enumerationMutation(v51);
            objc_msgSend(v49, "setObject:forKey:", v3, *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * i));
          }
          v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v61, v76, 16);
        }
        while (v52);
      }

      v33 = v50;
      if (v46)
        objc_msgSend(v49, "setObject:forKey:", v3, CFSTR("ASCIICapable"));
      if (v45)
        objc_msgSend(v49, "setObject:forKey:", v3, CFSTR("NonASCII"));
      -[UIKeyboardPreferencesController preferencesActions](self, "preferencesActions");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "updateLastUsedKeyboards:", v49);

      -[UIKeyboardPreferencesController touchSynchronizePreferencesTimer](self, "touchSynchronizePreferencesTimer");
    }
    _Block_object_dispose(&v70, 8);

  }
}

void __69__UIKeyboardPreferencesController_setLanguageAwareInputModeLastUsed___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  if ((objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", v8) & 1) != 0
    || (v6 = *(void **)(a1 + 32),
        TIInputModeGetBaseLanguage(),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        LODWORD(v6) = objc_msgSend(v6, "isEqualToString:", v7),
        v7,
        (_DWORD)v6))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a3);
    if ((UIKeyboardInputModesEqual(*(void **)(a1 + 40), v5) & 1) == 0)
      objc_msgSend(*(id *)(a1 + 48), "addObject:", v8);
  }

}

- (BOOL)allEnabledInputModesAreValid
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0DBDCB0], "sharedPreferencesController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "allEnabledInputModesAreValid");

  return v3;
}

- (BOOL)spaceConfirmationEnabled
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  char v8;

  UIKeyboardGetCurrentInputMode();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  TIInputModeGetBaseLanguage();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("zh")) & 1) != 0
    || objc_msgSend(v4, "isEqualToString:", CFSTR("ja")))
  {
    TIInputModeGetVariant();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(&unk_1E1A93848, "containsObject:", v5))
    {
      -[UIKeyboardPreferencesController valueForPreferenceKey:](self, "valueForPreferenceKey:", *MEMORY[0x1E0DBE500]);
      v6 = objc_claimAutoreleasedReturnValue();
      if (v6)
        v7 = (void *)v6;
      else
        v7 = (void *)MEMORY[0x1E0C9AAB0];
      v8 = objc_msgSend(v7, "BOOLValue");

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (BOOL)enableProKeyboard
{
  void *v2;
  void *v3;
  char v4;
  void *v5;
  double v6;

  -[UIKeyboardPreferencesController valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("KeyboardUseProLayout"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = objc_msgSend(v2, "BOOLValue");
  }
  else
  {
    +[UIScreen mainScreen](UIScreen, "mainScreen");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_referenceBounds");
    v4 = v6 == 1366.0;

  }
  return v4;
}

- (void)setEnableProKeyboard:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  char v6;
  id v7;

  v3 = a3;
  -[UIKeyboardPreferencesController preferencesActions](self, "preferencesActions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[UIKeyboardPreferencesController preferencesActions](self, "preferencesActions");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "updateEnableProKeyboard:", v3);

  }
}

- (void)setHandBias:(int64_t)a3
{
  const __CFString *v3;
  const __CFString *v4;
  id v5;

  v3 = CFSTR("None");
  if (a3 == 1)
    v3 = CFSTR("Right");
  if (a3 == 2)
    v4 = CFSTR("Left");
  else
    v4 = v3;
  -[UIKeyboardPreferencesController preferencesActions](self, "preferencesActions");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateKeyboardHandBias:", v4);

}

- (int64_t)compactAssistantBarPersistentLocation
{
  void *v2;
  int64_t v3;

  -[UIKeyboardPreferencesController valueForPreferenceKey:](self, "valueForPreferenceKey:", *MEMORY[0x1E0DBDE78]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (int)objc_msgSend(v2, "intValue");

  return v3;
}

- (void)setCompactAssistantBarPersistentLocation:(int64_t)a3
{
  id v4;

  -[UIKeyboardPreferencesController preferencesActions](self, "preferencesActions");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateCompactAssistantBarPersistentLocation:", a3);

}

- (BOOL)isFirstReachableKeyboardInteraction
{
  return -[UIKeyboardPreferencesController BOOLForPreferenceKey:](self, "BOOLForPreferenceKey:", CFSTR("KeyboardReachableFirstInteraction"));
}

- (void)performedFirstReachableKeyboardInteraction
{
  void *v3;
  char v4;
  id v5;

  -[UIKeyboardPreferencesController preferencesActions](self, "preferencesActions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[UIKeyboardPreferencesController preferencesActions](self, "preferencesActions");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "updateDidPerformFirstReachableKeyboardInteraction");

  }
}

- (void)setVisceral:(int64_t)a3
{
  void *v4;
  id v5;

  -[UIKeyboardPreferencesController preferencesActions](self, "preferencesActions");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateVisceral:", v4);

}

- (void)setEnabledDictationLanguages:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[UIKeyboardPreferencesController preferencesActions](self, "preferencesActions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[UIKeyboardPreferencesController preferencesActions](self, "preferencesActions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updateEnabledDictationLanguages:", v7);

  }
}

- (void)setLastUsedDictationLanguages:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[UIKeyboardPreferencesController preferencesActions](self, "preferencesActions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[UIKeyboardPreferencesController preferencesActions](self, "preferencesActions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updateLastUsedDictationLanguages:", v7);

  }
}

- (void)setDictationAutoPunctuation:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  char v6;
  void *v7;
  id v8;

  v3 = a3;
  -[UIKeyboardPreferencesController preferencesActions](self, "preferencesActions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[UIKeyboardPreferencesController preferencesActions](self, "preferencesActions");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "updateDictationAutoPunctuation:", v7);

  }
}

- (BOOL)isPreferenceKeyLockedDown:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  char v6;

  v3 = (void *)MEMORY[0x1E0DBDCB0];
  v4 = a3;
  objc_msgSend(v3, "sharedPreferencesController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isPreferenceKeyLockedDown:", v4);

  return v6;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  void *v5;
  BOOL v6;
  objc_super v8;

  v5 = &unk_1EE0CE828;
  v6 = 1;
  if (!(unint64_t)protocol_getMethodDescription((Protocol *)v5, a3, 1, 1).name)
  {
    v8.receiver = self;
    v8.super_class = (Class)UIKeyboardPreferencesController;
    v6 = -[UIKeyboardPreferencesController respondsToSelector:](&v8, sel_respondsToSelector_, a3);
  }

  return v6;
}

- (BOOL)useHardwareGlobeKeyAsEmojiKey
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  BOOL v7;

  -[UIKeyboardPreferencesController valueForPreferenceKey:](self, "valueForPreferenceKey:", *MEMORY[0x1E0DBDF88]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enabledInputModeIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 && (unint64_t)objc_msgSend(v5, "count") >= 3)
    v6 = objc_msgSend(v3, "BOOLValue");
  else
    v6 = -[UIKeyboardPreferencesController defaultGlobeAsEmojiKeySetting](self, "defaultGlobeAsEmojiKeySetting");
  v7 = v6;

  return v7;
}

- (BOOL)defaultGlobeAsEmojiKeySetting
{
  void *v2;
  void *v3;
  int IsEmojiInputModeActive;
  char v5;
  int v6;
  void *v7;
  int v8;
  void *v9;

  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enabledInputModeIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  IsEmojiInputModeActive = UIKeyboardIsEmojiInputModeActive();
  if (objc_msgSend(v3, "count") == 2 && (IsEmojiInputModeActive & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    if (objc_msgSend(v3, "count") == 3)
      v6 = IsEmojiInputModeActive;
    else
      v6 = 0;
    if (v6 == 1
      && (+[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v8 = objc_msgSend(v7, "isCapsLockASCIIToggle"),
          v7,
          v8))
    {
      +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v9, "capsLockKeyHasLanguageSwitchLabel");

    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (id)inputModeUpdateTime
{
  void *v2;
  id v3;

  -[UIKeyboardPreferencesController valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("KeyboardInputModeUpdateDate"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

@end
