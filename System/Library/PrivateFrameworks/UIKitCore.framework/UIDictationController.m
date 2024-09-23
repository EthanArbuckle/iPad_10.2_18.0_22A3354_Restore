@implementation UIDictationController

- (UIKeyboardInputMode)currentInputModeForDictation
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  UIKeyboardInputMode *currentInputModeForDictation;
  UIKeyboardInputMode *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  uint64_t v13;

  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentInputMode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v5, "enabledInputModeIdentifiers");

  }
  currentInputModeForDictation = self->_currentInputModeForDictation;
  if (currentInputModeForDictation)
  {
    v8 = currentInputModeForDictation;
  }
  else
  {
    +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "currentInputMode");
    v8 = (UIKeyboardInputMode *)objc_claimAutoreleasedReturnValue();

  }
  +[UIKeyboardInputMode dictationInputMode](UIKeyboardInputMode, "dictationInputMode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[UIKeyboardInputMode isEqual:](v8, "isEqual:", v10);

  if (v11)
  {
    +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "currentInputModeInPreference");
    v13 = objc_claimAutoreleasedReturnValue();

    v8 = (UIKeyboardInputMode *)v13;
  }
  return v8;
}

+ (int)viewMode
{
  int v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  if (+[UIDictationUtilities _isUsingLargeFormatDictationUI](UIDictationUtilities, "_isUsingLargeFormatDictationUI"))
  {
    return 6;
  }
  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!+[UIDictationController starkSceneExists](UIDictationController, "starkSceneExists"))
    goto LABEL_7;
  objc_msgSend(v3, "containerWindow");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_7;
  v5 = (void *)v4;
  objc_msgSend(v3, "containerWindow");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "screen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "_userInterfaceIdiom");

  if (v8 == 3)
  {
    v2 = 0;
  }
  else
  {
LABEL_7:
    if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      if (+[UIKeyboardImpl isFloating](UIKeyboardImpl, "isFloating"))
      {
        v2 = 7;
      }
      else
      {
        objc_msgSend(v3, "inputViews");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "isSplit"))
          v2 = 4;
        else
          v2 = 3;

      }
    }
    else
    {
      v2 = 2;
    }
  }

  return v2;
}

+ (BOOL)starkSceneExists
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  +[UIScene _scenesIncludingInternal:](UIScene, "_scenesIncludingInternal:", 1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v11 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if (objc_msgSend(v6, "_hostsWindows"))
        {
          objc_msgSend(v6, "_screen");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = objc_msgSend(v7, "_userInterfaceIdiom");

          if (v8 == 3)
          {
            LOBYTE(v3) = 1;
            goto LABEL_12;
          }
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_12:

  return v3;
}

+ (id)sharedInstance
{
  void *v2;
  UIDictationController *v3;
  void *v4;

  v2 = (void *)gSharedInstance;
  if (!gSharedInstance)
  {
    v3 = objc_alloc_init(UIDictationController);
    v4 = (void *)gSharedInstance;
    gSharedInstance = (uint64_t)v3;

    v2 = (void *)gSharedInstance;
  }
  return v2;
}

- (id)dictationConnection
{
  UIDictationConnection *dictationConnection;
  UIDictationConnection *v4;
  UIDictationConnection *v5;

  dictationConnection = self->_dictationConnection;
  if (!dictationConnection)
  {
    v4 = objc_alloc_init(UIDictationConnection);
    v5 = self->_dictationConnection;
    self->_dictationConnection = v4;

    -[UIDictationConnection setDelegate:](self->_dictationConnection, "setDelegate:", self);
    -[UIDictationConnection setTokenFilter:](self->_dictationConnection, "setTokenFilter:", self);
    -[UIDictationConnection beginAvailabilityMonitoring](self->_dictationConnection, "beginAvailabilityMonitoring");
    dictationConnection = self->_dictationConnection;
  }
  return dictationConnection;
}

+ (BOOL)dictationIsFunctional
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  char v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "deviceStateIsLocked") & 1) != 0)
  {
    +[UIDictationConnectionPreferences sharedInstance](UIDictationConnectionPreferences, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "dictationIsEnabled");

    if (!v4)
      return 0;
  }
  else
  {

  }
  +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "dictationDisabledDueToTelephonyActivity");

  if ((v6 & 1) != 0)
    return 0;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "inputDelegateManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "keyInputDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v10, "_isPasscodeStyle") & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "currentInputModeForDictation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dictationLanguage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "dictationConnection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v14, "dictationIsAvailableForLanguage:", v13);

  }
  return v7;
}

- (BOOL)dictationDisabledDueToTelephonyActivity
{
  return -[_UIDictationTelephonyMonitor telephonyActivity](self->_monitor, "telephonyActivity");
}

+ (BOOL)fetchCurrentInputModeSupportsDictation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  uint64_t v12;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textInputTraits");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a1) = objc_msgSend(a1, "checkTraitsSupportDictation:", v4);

  if (!(_DWORD)a1)
    return 0;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    return 0;
  +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentInputModeForDictation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dictationLanguage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    v10 = objc_msgSend(v9, "supportsDictationLanguage:error:", v8, &v12);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)_resolvedIsDictationPossible
{
  _BOOL4 v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  BOOL v10;
  BOOL v11;
  uint64_t v13;

  v3 = -[UIDictationController remoteHasMicrophone](self, "remoteHasMicrophone");
  v4 = -[UIDictationController dictationEnabled](self, "dictationEnabled");
  -[UIDictationController currentInputModeForDictation](self, "currentInputModeForDictation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dictationLanguage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v13 = 0;
    v7 = -[UIDictationController supportsDictationLanguage:error:](self, "supportsDictationLanguage:error:", v6, &v13);
  }
  else
  {
    v7 = 0;
  }
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "textInputTraits");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = +[UIDictationController _checkTraitsSupportDictation:](UIDictationController, "_checkTraitsSupportDictation:", v9);

  v11 = v3 && v4 && v7 && v10;
  return v11;
}

- (BOOL)_allowsMicsInSearchField
{
  void *v3;
  void *v4;
  uint64_t v6;

  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = 0;
  LOBYTE(self) = -[UIDictationController supportsDictationLanguage:error:](self, "supportsDictationLanguage:error:", v4, &v6);

  return (char)self;
}

- (BOOL)supportsInputMode:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  BOOL v8;

  v6 = a3;
  if (+[UIDictationUtilities _isUsingLargeFormatDictationUI](UIDictationUtilities, "_isUsingLargeFormatDictationUI"))
  {
    objc_msgSend(v6, "defaultDictationLanguage");
  }
  else
  {
    objc_msgSend(v6, "languageWithRegion");
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[UIDictationController supportsDictationLanguage:error:](self, "supportsDictationLanguage:error:", v7, a4);
  return v8;
}

- (BOOL)supportsDictationLanguage:(id)a3 error:(id *)a4
{
  id v5;
  BOOL v6;
  BOOL v7;

  v5 = a3;
  if (+[UIDictationUtilities _isUsingLargeFormatDictationUI](UIDictationUtilities, "_isUsingLargeFormatDictationUI")&& ((objc_msgSend(v5, "isEqualToString:", CFSTR("zh_CN")) & 1) != 0|| (objc_msgSend(v5, "hasPrefix:", CFSTR("zh-Hans")) & 1) != 0))
  {
LABEL_8:
    v7 = 0;
    goto LABEL_9;
  }
  v6 = +[UIDictationConnection dictationIsSupportedForLanguageCode:error:](UIDictationConnection, "dictationIsSupportedForLanguageCode:error:", v5, a4);
  v7 = v6;
  if (a4 && !v6)
  {
    if (objc_msgSend(*a4, "code") == 1)
      +[UIDictationConnection cacheSupportedDictationLanguages](UIDictationConnection, "cacheSupportedDictationLanguages");
    goto LABEL_8;
  }
LABEL_9:

  return v7;
}

+ (BOOL)checkTraitsSupportDictation:(id)a3
{
  int v3;
  void *v4;
  char v5;

  v3 = objc_msgSend(a1, "_checkTraitsSupportDictation:", a3);
  if (v3)
  {
    +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "dictationEnabled");

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)dictationEnabled
{
  int v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;

  v2 = MGGetBoolAnswer();
  if (v2)
  {
    if (+[UIDictationConnection dictationRestricted](UIDictationConnection, "dictationRestricted"))
    {
      LOBYTE(v2) = 0;
      return v2;
    }
    v3 = (void *)qword_1ECD79670;
    if (!qword_1ECD79670)
    {
      +[UIDictationConnectionPreferences sharedInstance](UIDictationConnectionPreferences, "sharedInstance");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "dictationIsEnabled");

      +[UIDictationConnectionPreferences sharedInstance](UIDictationConnectionPreferences, "sharedInstance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "suppressDictationOptIn");

      +[UIWindow _applicationKeyWindow](UIWindow, "_applicationKeyWindow");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v9 = v8;
        v10 = (objc_msgSend(v8, "_isHostedInAnotherProcess") | v7) ^ 1;
      }
      else
      {
        +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "delegateAsResponder");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "_responderWindow");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (v13)
        {
          v15 = v13;
        }
        else
        {
          objc_msgSend(v11, "window");
          v15 = (id)objc_claimAutoreleasedReturnValue();
        }
        v9 = v15;

        v10 = (objc_msgSend(v9, "_isHostedInAnotherProcess") | v7) ^ 1;
        if (!v9)
        {
          LOBYTE(v2) = v5 | v10;
          return v2;
        }
      }
      v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", v5 | v10);
      v17 = (void *)qword_1ECD79670;
      qword_1ECD79670 = v16;

      v3 = (void *)qword_1ECD79670;
    }
    LOBYTE(v2) = objc_msgSend(v3, "BOOLValue");
  }
  return v2;
}

+ (BOOL)_checkTraitsSupportDictation:(id)a3
{
  id v3;
  unint64_t v4;
  BOOL v5;

  v3 = a3;
  v5 = MGGetBoolAnswer()
    && (+[UIDictationUtilities _isUsingLargeFormatDictationUI](UIDictationUtilities, "_isUsingLargeFormatDictationUI")|| (objc_msgSend(v3, "isSecureTextEntry") & 1) == 0)&& (((v4 = objc_msgSend(v3, "keyboardType"), v4 > 0xB) || ((1 << v4) & 0x9B8) == 0) && v4 != 127|| +[UIDictationUtilities _isUsingLargeFormatDictationUI](UIDictationUtilities, "_isUsingLargeFormatDictationUI")|| objc_msgSend(v3, "forceEnableDictation"))&& (objc_msgSend(v3, "forceDisableDictation") & 1) == 0&& objc_msgSend(v3, "keyboardAppearance") != 127;

  return v5;
}

- (BOOL)remoteHasMicrophone
{
  void *v2;
  char v3;

  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_remoteHasMicrophoneCapability");

  return v3;
}

- (void)setIgnoreKeyboardDidHideNotification:(BOOL)a3
{
  self->_ignoreKeyboardDidHideNotification = a3;
}

- (void)keyboardDidHide:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;

  +[UIDictationView activeInstance](UIDictationView, "activeInstance", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "switchingLanguage");

  if ((v5 & 1) == 0)
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[UIDictationController shouldStayInDictationInputMode](self, "shouldStayInDictationInputMode"))
    {
      -[UIDictationController setShouldStayInDictationInputMode:](self, "setShouldStayInDictationInputMode:", 0);
      -[UIDictationController keyboardInputModeToReturn](self, "keyboardInputModeToReturn");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setKeyboardInputMode:userInitiated:", v7, 0);

    }
    else if ((objc_msgSend(v6, "_shouldSuppressSoftwareKeyboard") & 1) == 0
           && (objc_msgSend(v6, "isInHardwareKeyboardMode") & 1) == 0
           && !-[UIDictationController ignoreKeyboardDidHideNotification](self, "ignoreKeyboardDidHideNotification"))
    {
      -[UIDictationController stopDictationIgnoreFinalizePhrases](self, "stopDictationIgnoreFinalizePhrases");
    }

  }
  -[UIDictationController setIgnoreKeyboardDidHideNotification:](self, "setIgnoreKeyboardDidHideNotification:", 0);
}

- (void)stopDictationIgnoreFinalizePhrases
{
  -[UIDictationController stopDictationIgnoreFinalizePhrases:](self, "stopDictationIgnoreFinalizePhrases:", 1);
}

- (BOOL)shouldStayInDictationInputMode
{
  return self->_shouldStayInDictationInputMode;
}

- (void)setIgnoreFinalizePhrases:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  _BOOL4 v8;
  uint64_t v9;

  v3 = a3;
  v9 = *MEMORY[0x1E0C80C00];
  self->_ignoreFinalizePhrases = a3;
  _UIDictationControllerLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315394;
    v6 = "-[UIDictationController setIgnoreFinalizePhrases:]";
    v7 = 1024;
    v8 = v3;
    _os_log_impl(&dword_185066000, v4, OS_LOG_TYPE_DEFAULT, "%s Setting ignoreFinalizePhrases flag %d", (uint8_t *)&v5, 0x12u);
  }

}

- (void)stopDictation:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v11;
  unint64_t reasonType;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  uint64_t v18;
  void *v19;
  __CFString *v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  const __CFString *v34;
  void *v35;
  void *v36;
  objc_class *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  id v43;
  NSString *v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  _QWORD v49[5];
  _QWORD v50[5];
  _BYTE buf[40];
  uint64_t v52;

  v3 = a3;
  v52 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend((id)objc_opt_class(), "shouldForwardEventsToInputSystemUI"))
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v43 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "forwardDictationEvent_stopDictation:", v3);

    return;
  }
  -[UIDictationController resetAdaptiveDeleteActivationLogic](self, "resetAdaptiveDeleteActivationLogic");
  +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "reasonType") == 15)
  {

LABEL_6:
    +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dictationTipController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "triggerModelessInputTipDictationStoppedSignal");

    goto LABEL_7;
  }
  +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "reasonType");

  if (v7 == 1)
    goto LABEL_6;
LABEL_7:
  if (-[UIDictationController state](self, "state") == 1 || -[UIDictationController state](self, "state") == 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[UIDictationController stopDictation:]");

    _UIDictationControllerLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = -[UIDictationController state](self, "state");
      reasonType = self->_reasonType;
      objc_msgSend((id)objc_opt_class(), "UIDictationStartStopReasonTypeDescription:", reasonType);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "-[UIDictationController stopDictation:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v11;
      *(_WORD *)&buf[18] = 2048;
      *(_QWORD *)&buf[20] = reasonType;
      *(_WORD *)&buf[28] = 2112;
      *(_QWORD *)&buf[30] = v13;
      _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_DEFAULT, "%s State: %d, reason: %lu, reason string: %@", buf, 0x26u);

    }
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "inputDelegateManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_textSelectingContainer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v16, "dictationRecordingDidEnd");
    if ((self->_reasonType | 8) == 0x19)
      v44 = self->_lastHypothesis;
    else
      v44 = 0;
    if (objc_msgSend((id)objc_opt_class(), "viewMode"))
    {
      v17 = +[UIDictationUtilities _isUsingLargeFormatDictationUI](UIDictationUtilities, "_isUsingLargeFormatDictationUI");
      v18 = 2;
      if (!v17)
        v18 = 0;
    }
    else
    {
      v18 = 1;
    }
    v42 = v18;
    -[UIDictationController smartLanguageSelectionOverrideLanguage](self, "smartLanguageSelectionOverrideLanguage");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      -[UIDictationController smartLanguageSelectionOverrideLanguage](self, "smartLanguageSelectionOverrideLanguage");
      v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v21 = 3;
    }
    else
    {
      -[UIDictationController detectedLanguage](self, "detectedLanguage");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        -[UIDictationController detectedLanguage](self, "detectedLanguage");
        v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v21 = 4;
      }
      else
      {
        -[UIDictationController initialDictationLanguage](self, "initialDictationLanguage");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (v23)
        {
          -[UIDictationController initialDictationLanguage](self, "initialDictationLanguage");
          v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v21 = -[UIDictationController dictationSourceType](self, "dictationSourceType");
        }
        else
        {
          v21 = 0;
          v20 = &stru_1E16EDF20;
        }
      }
    }
    +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "dismissSoftwareKeyboardIfNeeded");

    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "_hasMarkedText");

    if (v26)
    {
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "acceptAutocorrectionWithCompletionHandler:", 0);

    }
    objc_msgSend((id)objc_opt_class(), "UIDictationLanguageSourceType:", v21);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(getAFAnalyticsClass(), "sharedAnalytics");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v49[0] = CFSTR("stopDictation");
    +[UIDictationController UIDictationStartStopReasonTypeDescription:](UIDictationController, "UIDictationStartStopReasonTypeDescription:", self->_reasonType);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v50[0] = v30;
    v50[1] = v20;
    v49[1] = CFSTR("dictationLanguage");
    v49[2] = CFSTR("dictationLanguageSource");
    v50[2] = v28;
    v49[3] = CFSTR("keyboardLocaleIdentifier");
    -[UIDictationController currentKeyboardPrimaryLanguage](self, "currentKeyboardPrimaryLanguage");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v50[3] = v31;
    v49[4] = CFSTR("dictationUIInteractionIdentifier");
    -[UIDictationController interactionIdentifier](self, "interactionIdentifier");
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = (void *)v32;
    v34 = &stru_1E16EDF20;
    if (v32)
      v34 = (const __CFString *)v32;
    v50[4] = v34;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, v49, 5);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "logEventWithType:context:", 1405, v35);

    v45 = 0;
    v46 = &v45;
    v47 = 0x2050000000;
    v36 = (void *)getSISchemaDictationEndPointStopClass_softClass;
    v48 = getSISchemaDictationEndPointStopClass_softClass;
    if (!getSISchemaDictationEndPointStopClass_softClass)
    {
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __getSISchemaDictationEndPointStopClass_block_invoke;
      *(_QWORD *)&buf[24] = &unk_1E16B14C0;
      *(_QWORD *)&buf[32] = &v45;
      __getSISchemaDictationEndPointStopClass_block_invoke((uint64_t)buf);
      v36 = (void *)v46[3];
    }
    v37 = objc_retainAutorelease(v36);
    _Block_object_dispose(&v45, 8);
    v38 = objc_alloc_init(v37);
    objc_msgSend(v38, "setDictationEndPointType:", objc_msgSend((id)objc_opt_class(), "UIDictationStartStopReasonToInstrumentationDictationEndPointType:", self->_reasonType));
    -[AFAnalyticsTurnBasedInstrumentationContext emitInstrumentation:](self->_currentInstrumentationContext, "emitInstrumentation:", v38);
    -[UIDictationController dictationConnection](self, "dictationConnection");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIDictationController UIDictationStartStopReasonTypeDescription:](UIDictationController, "UIDictationStartStopReasonTypeDescription:", self->_reasonType);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "stopSpeech:activationType:result:suppressAlert:", v40, v42, v44, v3 ^ 1);

    -[UIDictationController dictationTipController](self, "dictationTipController");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setDismissalReasonType:", 1);

    -[UIDictationController setState:](self, "setState:", 3);
    -[UIDictationController cancelRecordingLimitTimer](self, "cancelRecordingLimitTimer");
    -[UIDictationController setCurrentKeyboardPrimaryLanguage:](self, "setCurrentKeyboardPrimaryLanguage:", &stru_1E16EDF20);
    if (objc_msgSend((id)objc_opt_class(), "viewMode") == 6)
      -[UIDictationController _displaySecureContentsAsPlainText:afterDelay:](self, "_displaySecureContentsAsPlainText:afterDelay:", 0, 2.0);
    -[UIDictationController clearKeyboardTrackpadModeIfNeeded](self, "clearKeyboardTrackpadModeIfNeeded");

  }
}

- (int)state
{
  return dword_1ECD79664;
}

- (unint64_t)reasonType
{
  return self->_reasonType;
}

- (void)stopDictationIgnoreFinalizePhrases:(BOOL)a3
{
  _BOOL8 v3;
  unint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v3 = a3;
  v19 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend((id)objc_opt_class(), "shouldForwardEventsToInputSystemUI"))
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "forwardDictationEvent_stopDictationIgnoreFinalizePhrases");

  }
  else
  {
    -[UIDictationController setIgnoreFinalizePhrases:](self, "setIgnoreFinalizePhrases:", 1);
    if (+[UIDictationController isRunning](UIDictationController, "isRunning"))
      v5 = -[UIDictationController specificReasonTypeFromApplicationDuringDictation](self, "specificReasonTypeFromApplicationDuringDictation");
    else
      v5 = 18;
    +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setReasonType:", v5);

    _UIDictationControllerLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      -[UIDictationController lastHypothesis](self, "lastHypothesis");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v16 = "-[UIDictationController stopDictationIgnoreFinalizePhrases:]";
      v17 = 2112;
      v18 = v8;
      _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_DEFAULT, "%s Last hypothesis: \"%@\", buf, 0x16u);

    }
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "textInputTraits");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "keyboardType");

    if (v11 == 126)
    {
      UIKeyboardGetCurrentInputMode();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      TIInputModeGetBaseLanguage();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIDictationController setLastMessageKeyboardLanguage:](self, "setLastMessageKeyboardLanguage:", v13);

    }
    -[UIDictationController stopDictation:](self, "stopDictation:", v3);
    -[UIDictationController _setFinalResultHandler:](self, "_setFinalResultHandler:", 0);
  }
}

+ (BOOL)shouldForwardEventsToInputSystemUI
{
  return +[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI");
}

- (void)setStartRangeOfCurrentHypothesis:(_NSRange)a3
{
  self->_startRangeOfCurrentHypothesis = a3;
}

- (void)setReasonType:(unint64_t)a3
{
  self->_reasonType = a3;
}

- (void)resetAdaptiveDeleteActivationLogic
{
  -[UIDictationController setShouldDeleteWordOnBackspaceTap:](self, "setShouldDeleteWordOnBackspaceTap:", 0);
  -[UIDictationController setStartRangeOfCurrentHypothesis:](self, "setStartRangeOfCurrentHypothesis:", 0x7FFFFFFFFFFFFFFFLL, 0);
}

- (void)setShouldDeleteWordOnBackspaceTap:(BOOL)a3
{
  self->_shouldDeleteWordOnBackspaceTap = a3;
}

- (NSString)lastHypothesis
{
  return self->_lastHypothesis;
}

- (BOOL)ignoreKeyboardDidHideNotification
{
  return self->_ignoreKeyboardDidHideNotification;
}

- (void)_setFinalResultHandler:(id)a3
{
  void *v4;
  id finalResultsOperation;

  v4 = _Block_copy(a3);
  finalResultsOperation = self->_finalResultsOperation;
  self->_finalResultsOperation = v4;

}

+ (void)onWillResignActive
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v2 = (void *)qword_1ECD79670;
  qword_1ECD79670 = 0;

  v3 = (void *)qword_1ECD79678;
  qword_1ECD79678 = 0;

  if (+[UIDictationController isRunning](UIDictationController, "isRunning"))
  {
    +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setReasonType:", 24);

    +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cancelDictation");

    if (+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
    {
      +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setShadowState:", 0);
    }
    else
    {
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "clearDictationMenuTimer");
    }

  }
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dismissDictationTip");

  +[UIDictationView activeInstance](UIDictationView, "activeInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "applicationWillResignActive");

  +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "releaseConnection");

  _MergedGlobals_35_1 = 0;
  +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPauseUpdatingHelperMessage:", 1);

}

+ (void)onDidBecomeActive
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  +[UIDictationController activeInstance](UIDictationController, "activeInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "wantsAvailabilityMonitoringWhenAppActive");

  if (v3)
  {
    +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictationConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "beginAvailabilityMonitoring");

  }
  _MergedGlobals_35_1 = 1;
  if (byte_1ECD7965A == 1)
  {
    +[UIDictationController activeInstance](UIDictationController, "activeInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "switchToDictationInputMode");

    byte_1ECD7965A = 0;
  }
  +[UIDictationController activeInstance](UIDictationController, "activeInstance");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPauseUpdatingHelperMessage:", 0);

}

- (BOOL)wantsAvailabilityMonitoringWhenAppActive
{
  return self->_wantsAvailabilityMonitoringWhenAppActive;
}

- (void)setPauseUpdatingHelperMessage:(BOOL)a3
{
  self->_pauseUpdatingHelperMessage = a3;
}

+ (id)activeInstance
{
  return (id)gSharedInstance;
}

- (BOOL)shouldSuppressSoftwareKeyboard
{
  return self->_shouldSuppressSoftwareKeyboard;
}

void __79__UIDictationController_keyboardWillChangeFromDelegate_toDelegate_shouldPause___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  uint64_t v11;
  id v12;

  if (*(_QWORD *)(a1 + 32)
    || (+[UIDictationController activeConnection](UIDictationController, "activeConnection"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        !v5))
  {
    if (!*(_QWORD *)(a1 + 40)
      && +[UIDictationController fetchCurrentInputModeSupportsDictation](UIDictationController, "fetchCurrentInputModeSupportsDictation")&& ((objc_opt_respondsToSelector() & 1) == 0 || (objc_msgSend(*(id *)(a1 + 32), "_isPasscodeStyle") & 1) == 0))
    {
      +[UIDictationController activeInstance](UIDictationController, "activeInstance");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "dictationConnection");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "beginAvailabilityMonitoring");

      +[UIDictationController activeInstance](UIDictationController, "activeInstance");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setWantsAvailabilityMonitoringWhenAppActive:", 1);
LABEL_13:

    }
  }
  else
  {
    +[UIDictationController activeInstance](UIDictationController, "activeInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictationConnection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cancelAvailabilityMonitoring");

    +[UIDictationController activeInstance](UIDictationController, "activeInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWantsAvailabilityMonitoringWhenAppActive:", 0);

    v9 = 0;
    if (+[UIKeyboard isModelessActive](UIKeyboard, "isModelessActive"))
    {
      +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v10, "isDictationPaused");

    }
    if (+[UIDictationController viewMode](UIDictationController, "viewMode") && (v9 & 1) == 0)
    {
      +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "releaseConnection");
      goto LABEL_13;
    }
  }
  if (!+[UIKeyboard isInputSystemUI](UIKeyboard, "isInputSystemUI"))
  {
    v11 = *(_QWORD *)(a1 + 32);
    +[UIDictationController activeInstance](UIDictationController, "activeInstance");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (v11)
      objc_msgSend(v12, "prepareStartDictationKeyboardGesturesForDelegate:", *(_QWORD *)(a1 + 32));
    else
      objc_msgSend(v12, "removeStartDictationKeyboardGestures");

  }
}

- (void)setWantsAvailabilityMonitoringWhenAppActive:(BOOL)a3
{
  self->_wantsAvailabilityMonitoringWhenAppActive = a3;
}

- (void)releaseConnection
{
  UIDictationConnection *dictationConnection;

  -[UIDictationConnection cancelAvailabilityMonitoring](self->_dictationConnection, "cancelAvailabilityMonitoring");
  -[UIDictationConnection setDelegate:](self->_dictationConnection, "setDelegate:", 0);
  dictationConnection = self->_dictationConnection;
  self->_dictationConnection = 0;

}

- (void)prepareStartDictationKeyboardGesturesForDelegate:(id)a3
{
  void *v4;
  int v5;
  id v6;

  v6 = a3;
  -[UIDictationController removeStartDictationKeyboardGestures](self, "removeStartDictationKeyboardGestures");
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hardwareKeyboardAttached");

  if (v5)
  {
    -[UIDictationController prepareDoubleTapShortcutGesture:](self, "prepareDoubleTapShortcutGesture:", v6);
    -[UIDictationController prepareVoiceCommandSingleTapGesture:](self, "prepareVoiceCommandSingleTapGesture:", v6);
  }

}

- (void)removeStartDictationKeyboardGestures
{
  _UITapTapHoldGestureRecognizer *hardwareShortcutRecognizer;
  void *v4;
  _UITapTapHoldGestureRecognizer *v5;
  _UIVoiceCommandButtonTapGestureRecognizer *hardwareVoiceCommandKeyRecognizer;
  void *v7;
  _UIVoiceCommandButtonTapGestureRecognizer *v8;

  hardwareShortcutRecognizer = self->_hardwareShortcutRecognizer;
  if (hardwareShortcutRecognizer)
  {
    -[UIGestureRecognizer view](hardwareShortcutRecognizer, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeGestureRecognizer:", self->_hardwareShortcutRecognizer);

    v5 = self->_hardwareShortcutRecognizer;
    self->_hardwareShortcutRecognizer = 0;

  }
  hardwareVoiceCommandKeyRecognizer = self->_hardwareVoiceCommandKeyRecognizer;
  if (hardwareVoiceCommandKeyRecognizer)
  {
    -[UIGestureRecognizer view](hardwareVoiceCommandKeyRecognizer, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeGestureRecognizer:", self->_hardwareVoiceCommandKeyRecognizer);

    v8 = self->_hardwareVoiceCommandKeyRecognizer;
    self->_hardwareVoiceCommandKeyRecognizer = 0;

  }
}

- (BOOL)dictationSearchFieldUISupportsTraitCollection:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = objc_msgSend(v3, "userInterfaceIdiom") == 1 || objc_msgSend(v3, "userInterfaceIdiom") == 0;

  return v4;
}

- (BOOL)dictationSearchFieldUIEnabled
{
  char v3;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  char v12;

  if (-[UIDictationController currentViewModeSupportsDictationMics](self, "currentViewModeSupportsDictationMics")
    && _UIIsPrivateMainBundle()
    && !-[UIDictationController dictationDisabledDueToTelephonyActivity](self, "dictationDisabledDueToTelephonyActivity"))
  {
    _UIKitUserDefaults();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend((id)objc_opt_class(), "_isDictationAllowedWithUserDefaults:", v5))
    {
      if ((objc_msgSend(v5, "BOOLForKey:", CFSTR("Dictation Enabled")) & 1) != 0)
        goto LABEL_13;
      +[UIDictationConnectionPreferences sharedInstance](UIDictationConnectionPreferences, "sharedInstance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "suppressDictationOptIn");

      if ((v7 & 1) == 0)
      {
        +[UIWindow _applicationKeyWindow](UIWindow, "_applicationKeyWindow");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        if (v8)
        {
          v10 = v8;
        }
        else
        {
          +[UIKeyboardImpl keyboardWindow](UIKeyboardImpl, "keyboardWindow");
          v10 = (id)objc_claimAutoreleasedReturnValue();
        }
        v11 = v10;

        v12 = objc_msgSend(v11, "_isHostedInAnotherProcess");
        if ((v12 & 1) == 0)
        {
LABEL_13:
          if (-[UIDictationController _allowsMicsInSearchField](self, "_allowsMicsInSearchField"))
          {
            v3 = 1;
LABEL_17:

            return v3;
          }
          if (os_variant_has_internal_diagnostics())
          {
            v3 = objc_msgSend(v5, "BOOLForKey:", CFSTR("UIDictationControllerForceDictationUIInSearchField"));
            goto LABEL_17;
          }
        }
      }
    }
    v3 = 0;
    goto LABEL_17;
  }
  return 0;
}

- (BOOL)currentViewModeSupportsDictationMics
{
  int v2;
  BOOL v3;

  v2 = +[UIDictationController viewMode](UIDictationController, "viewMode");
  if (v2)
    v3 = v2 == 6;
  else
    v3 = 1;
  return !v3;
}

+ (BOOL)_isDictationAllowedWithUserDefaults:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  objc_msgSend(v3, "objectForKey:", CFSTR("Dictation Allowed"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = objc_msgSend(v3, "BOOLForKey:", CFSTR("Dictation Allowed"));
  else
    v5 = 1;

  return v5;
}

- (void)dictationConnnectionDidChangeAvailability:(id)a3
{
  void *v4;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("reason");
  v6[0] = CFSTR("Dictation connection did change availability");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIDictationController postNotificationName:userInfo:](self, "postNotificationName:userInfo:", CFSTR("UIKeyboardDictationAvailabilityDidChangeNotification"), v4);

}

- (void)postNotificationName:(id)a3 userInfo:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  void *v22;
  id v23;
  id v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("UIKeyboardDictationAvailabilityDidChangeNotification")) & 1) != 0
    || (objc_msgSend(v5, "isEqualToString:", CFSTR("UIDictationControllerDictationDidFinish")) & 1) != 0
    || (objc_msgSend(v5, "isEqualToString:", CFSTR("UIKeyboardDidBeginDictationNotification")) & 1) != 0
    || (objc_msgSend(v5, "isEqualToString:", CFSTR("UIDictationControllerDidResumeNotification")) & 1) != 0
    || (objc_msgSend(v5, "isEqualToString:", CFSTR("UIDictationControllerDidPauseNotification")) & 1) != 0
    || objc_msgSend(v5, "isEqualToString:", CFSTR("UIDictationWillInsertHypothesisNotification")))
  {
    if (+[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess"))
    {
      if (objc_msgSend(v5, "isEqualToString:", CFSTR("UIKeyboardDictationAvailabilityDidChangeNotification")))
      {
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("reason"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        _UIDictationControllerLog();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v26 = "-[UIDictationController postNotificationName:userInfo:]";
          v27 = 2114;
          v28 = v7;
          _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_DEFAULT, "%s Dictation availability did change with reason: %{public}@", buf, 0x16u);
        }

      }
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "inputDelegateManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "inputSystemSourceSession");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        objc_msgSend(v11, "textOperations");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setCustomInfoType:", 0x1E1750220);
        v19 = CFSTR("selector");
        NSStringFromSelector(sel_postNotificationName_object_userInfo_);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v13;
        v23 = v5;
        v20 = CFSTR("notificationName");
        v21 = CFSTR("userInfo");
        if (v6)
          v14 = v6;
        else
          v14 = (id)MEMORY[0x1E0C9AA70];
        v24 = v14;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v19, 3);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setCustomInfo:", v15, v19, v20, v21, v22, v23);

        objc_msgSend(v11, "flushOperations");
      }

    }
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("UIKeyboardDidBeginDictationNotification")))
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("dictationLanguage"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setActiveDictationLanguage:", v16);

    }
    else
    {
      if (!objc_msgSend(v5, "isEqualToString:", CFSTR("UIDictationControllerDictationDidFinish")))
      {
LABEL_23:
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "postNotificationName:object:userInfo:", v5, 0, v6);

        goto LABEL_24;
      }
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setActiveDictationLanguage:", 0);
    }

    goto LABEL_23;
  }
LABEL_24:

}

+ (void)keyboardDidUpdateOnScreenStatus
{
  void *v2;
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v2, "_resolvedIsDictationPossible"))
  {

    goto LABEL_9;
  }
  v3 = +[UIKeyboard isOnScreen](UIKeyboard, "isOnScreen");

  if (!v3)
  {
LABEL_9:
    +[UIDictationController activeInstance](UIDictationController, "activeInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stopHelperMessageDisplayIfNeeded");

    +[UIDictationController activeInstance](UIDictationController, "activeInstance");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_endOfflineMetricsSession");
LABEL_10:
    v6 = v9;
    goto LABEL_11;
  }
  +[UIDictationController activeInstance](UIDictationController, "activeInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateHelperMessageDisplayIfNeeded");

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textInputTraits");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v9;
  if (v9)
  {
    if (UIKeyboardTypeSupportsDictationSpelling(objc_msgSend(v9, "dictationKeyboardType"))
      || (objc_msgSend(v9, "isSecureTextEntry") & 1) != 0
      || objc_msgSend(v9, "forceSpellingDictation"))
    {
      +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_beginOfflineMetricsSession");

    }
    goto LABEL_10;
  }
LABEL_11:

}

- (void)stopHelperMessageDisplayIfNeeded
{
  void *v2;
  id v3;

  if (-[UIDictationController _shouldUpdateHelperMessageDisplay](self, "_shouldUpdateHelperMessageDisplay"))
  {
    +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "inputDelegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v3, "_updateHelpMessageOverrideWithMessage:", 0);

  }
}

- (BOOL)_shouldUpdateHelperMessageDisplay
{
  if (objc_msgSend((id)objc_opt_class(), "viewMode") != 6)
    return 1;
  if (objc_msgSend((id)objc_opt_class(), "viewMode") == 6)
    return !-[UIDictationController pauseUpdatingHelperMessage](self, "pauseUpdatingHelperMessage");
  return 0;
}

- (void)_endOfflineMetricsSession
{
  int64_t lastOfflineDictationMetricEvent;
  id AFAggregatorClass;
  void *v5;
  id v7;

  if (self->_isOfflineMetricsSessionActive)
  {
    lastOfflineDictationMetricEvent = self->_lastOfflineDictationMetricEvent;
    if (lastOfflineDictationMetricEvent == 1)
    {
      AFAggregatorClass = getAFAggregatorClass();
      -[UIDictationController _currentLanguageForOfflineDictationMetrics](self, "_currentLanguageForOfflineDictationMetrics");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(AFAggregatorClass, "logDictationFollowedByContinueOccurredForLanguage:", v5);
    }
    else
    {
      if (lastOfflineDictationMetricEvent != 2 || self->_didUseOfflineDictation)
        goto LABEL_11;
      v7 = getAFAggregatorClass();
      -[UIDictationController _currentLanguageForOfflineDictationMetrics](self, "_currentLanguageForOfflineDictationMetrics");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logKeyboardInputFollowedByContinueOccurredForLanguage:", v5);
    }

LABEL_11:
    self->_isOfflineMetricsSessionActive = 0;
  }
}

+ (BOOL)isRunning
{
  _BOOL4 v2;
  uint64_t v3;

  v2 = +[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI");
  v3 = 12;
  if (v2)
    v3 = 8;
  return *(_DWORD *)&_MergedGlobals_35_1[v3] != 0;
}

+ (void)keyboardWillChangeFromDelegate:(id)a3 toDelegate:(id)a4 shouldPause:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void (**v14)(_QWORD);
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  id v21;
  id v22;

  v5 = a5;
  v7 = a3;
  v8 = a4;
  if (v7 != v8)
  {
    if (v7)
    {
      +[UIDictationController logCorrectionStatisticsForDelegate:reason:](UIDictationController, "logCorrectionStatisticsForDelegate:reason:", v7, 20);
      if (!+[UIDictationUtilities _isUsingLargeFormatDictationUI](UIDictationUtilities, "_isUsingLargeFormatDictationUI"))
      {
        +[UIDictationController activeInstance](UIDictationController, "activeInstance");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "_endOfflineMetricsSession");

      }
    }
    if (v8)
    {
      if (!+[UIDictationUtilities _isUsingLargeFormatDictationUI](UIDictationUtilities, "_isUsingLargeFormatDictationUI"))
      {
        +[UIDictationController activeInstance](UIDictationController, "activeInstance");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "_beginOfflineMetricsSession");

      }
      if (+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
      {
        +[UIDictationController activeInstance](UIDictationController, "activeInstance");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "prepareStartDictationKeyboardGesturesForDelegate:", v8);
LABEL_12:

        +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "forwardDictationEvent_handleDictationShouldPause:withNewDelagate:", v5, v8 != 0);

        goto LABEL_19;
      }
    }
    else if (+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
    {
      +[UIDictationController activeInstance](UIDictationController, "activeInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "removeStartDictationKeyboardGestures");
      goto LABEL_12;
    }
    if (!+[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess"))
    {
      +[UIDictationController activeInstance](UIDictationController, "activeInstance");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleDictationShouldPause:withNewDelagate:", v5, v8 != 0);

    }
    v17 = MEMORY[0x1E0C809B0];
    v18 = 3221225472;
    v19 = __79__UIDictationController_keyboardWillChangeFromDelegate_toDelegate_shouldPause___block_invoke;
    v20 = &unk_1E16B1B50;
    v21 = v8;
    v22 = v7;
    v14 = (void (**)(_QWORD))_Block_copy(&v17);
    +[UIDictationController activeInstance](UIDictationController, "activeInstance", v17, v18, v19, v20);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v14[2](v14);
    }
    else
    {
      +[UIPeripheralHost sharedInstance](UIPeripheralHost, "sharedInstance");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "queueDelayedTask:", v14);

    }
  }
LABEL_19:

}

- (void)setResigningFirstResponder:(BOOL)a3
{
  self->_resigningFirstResponder = a3;
}

- (void)handleDictationShouldPause:(BOOL)a3 withNewDelagate:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  NSObject *v7;
  void *v8;
  id v9;
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v4 = a4;
  v5 = a3;
  v12 = *MEMORY[0x1E0C80C00];
  if (+[UIDictationController isRunning](UIDictationController, "isRunning"))
  {
    if (v5)
    {
      -[UIDictationController setSkipAutomaticResumeDictation:](self, "setSkipAutomaticResumeDictation:", 1);
      _UIDictationControllerLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v11 = "-[UIDictationController handleDictationShouldPause:withNewDelagate:]";
        _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_DEFAULT, "%s Set skipAutomaticResumeDictation to YES", buf, 0xCu);
      }

      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "pauseDictationForResponderChange");

    }
    else if (-[UIDictationController isDictationPaused](self, "isDictationPaused") && v4)
    {
      if (!+[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess"))
      {
        +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
        v9 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "resumeDictationForResponderChange");

      }
    }
    else
    {
      -[UIDictationController setReasonType:](self, "setReasonType:", 20);
      -[UIDictationController cancelDictation](self, "cancelDictation");
    }
  }
}

- (void)_beginOfflineMetricsSession
{
  if (!self->_isOfflineMetricsSessionActive)
  {
    self->_lastOfflineDictationMetricEvent = 0;
    *(_WORD *)&self->_isOfflineMetricsSessionActive = 1;
  }
}

- (UIDictationController)init
{
  UIDictationController *v2;
  UIDictationController *v3;
  void *v4;
  UIDictationController *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  UIDictationConnectionPreferences *preferences;
  uint64_t v10;
  _UIDictationTelephonyMonitor *monitor;
  UIDictationTipController *v12;
  UIDictationTipController *dictationTipController;
  UIDictationCursorPositionRestorer *v14;
  UIDictationCursorPositionRestorer *cursorPositionRestorer;
  _UIAssertionController *v16;
  _UIAssertionController *assertionController;
  void *v18;
  int v19;
  UIImpactFeedbackGenerator *v20;
  void *v21;
  uint64_t v22;
  UIImpactFeedbackGenerator *feedbackGenerator;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t);
  void *v28;
  id v29;
  id location;
  objc_super v31;

  v31.receiver = self;
  v31.super_class = (Class)UIDictationController;
  v2 = -[UIDictationController init](&v31, sel_init);
  if (!v2)
    return 0;
  v3 = v2;
  if (+[UIDictationConnection isDictationAvailable](UIDictationConnection, "isDictationAvailable"))
  {
    if (notify_register_check("com.apple.keyboard.isDictationRunning", &v3->_dictationInputModeNotifierToken))
      v3->_dictationInputModeNotifierToken = -1;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", objc_opt_class(), sel_applicationDidBecomeActive, CFSTR("UIApplicationDidBecomeActiveNotification"), 0);
    objc_msgSend(v4, "addObserver:selector:name:object:", objc_opt_class(), sel_applicationWillResignActive, CFSTR("UIApplicationWillResignActiveNotification"), 0);
    objc_msgSend(v4, "addObserver:selector:name:object:", objc_opt_class(), sel_viewServiceDidBecomeActive, 0x1E1784AC0, 0);
    objc_msgSend(v4, "addObserver:selector:name:object:", objc_opt_class(), sel_viewServiceWillResignActive, 0x1E1784AE0, 0);
    objc_msgSend(v4, "addObserver:selector:name:object:", objc_opt_class(), sel_applicationDidEnterBackgroundNotification, CFSTR("UIApplicationDidEnterBackgroundNotification"), 0);
    objc_msgSend(v4, "addObserver:selector:name:object:", objc_opt_class(), sel_siriPreferencesChanged, 0x1E1747540, 0);
    objc_msgSend(v4, "addObserver:selector:name:object:", objc_opt_class(), sel_remoteMicrophoneCapabilityChanged, CFSTR("_UIDeviceRemoteHasMicrophoneDidChangeNotification"), 0);
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel_keyboardWillHide_, CFSTR("UIKeyboardPrivateWillHideNotification"), 0);
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel_keyboardDidHide_, CFSTR("UIKeyboardPrivateDidHideNotification"), 0);
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel_preferencesChanged_, *MEMORY[0x1E0DBE478], 0);
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel_sendButtonPressedInMessages_, CFSTR("CKMessageEntryViewSendButtonPressedNotification"), 0);
    if (+[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess"))
    {
      objc_msgSend(v4, "addObserver:selector:name:object:", objc_opt_class(), sel_keyboardDidShow, CFSTR("UIKeyboardDidShowNotification"), 0);
      objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel_rtiInputSessionWillChangeToNewProcess_, *MEMORY[0x1E0D87200], 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObserver:selector:name:object:", v3, sel__dictationDidRecieveDidBeginDictationNotification_, CFSTR("UIKeyboardDidBeginDictationNotification"), 0);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObserver:selector:name:object:", v3, sel__dictationDidRecieveDidFinishDictationNotification_, CFSTR("UIDictationControllerDictationDidFinish"), 0);

    }
    +[UIDictationConnectionPreferences sharedInstance](UIDictationConnectionPreferences, "sharedInstance");
    v8 = objc_claimAutoreleasedReturnValue();
    preferences = v3->_preferences;
    v3->_preferences = (UIDictationConnectionPreferences *)v8;

    v10 = objc_opt_new();
    monitor = v3->_monitor;
    v3->_monitor = (_UIDictationTelephonyMonitor *)v10;

    objc_initWeak(&location, v3);
    v25 = MEMORY[0x1E0C809B0];
    v26 = 3221225472;
    v27 = __29__UIDictationController_init__block_invoke;
    v28 = &unk_1E16B3F40;
    objc_copyWeak(&v29, &location);
    -[_UIDictationTelephonyMonitor setActivityChanged:](v3->_monitor, "setActivityChanged:", &v25);
    -[_UIDictationTelephonyMonitor start](v3->_monitor, "start", v25, v26, v27, v28);
    v12 = objc_alloc_init(UIDictationTipController);
    dictationTipController = v3->_dictationTipController;
    v3->_dictationTipController = v12;

    v14 = objc_alloc_init(UIDictationCursorPositionRestorer);
    cursorPositionRestorer = v3->_cursorPositionRestorer;
    v3->_cursorPositionRestorer = v14;

    _MergedGlobals_35_1[0] = 1;
    v3->_stateHandler = os_state_add_handler();
    v16 = -[_UIAssertionController initWithAssertionSubject:]([_UIAssertionController alloc], "initWithAssertionSubject:", v3);
    assertionController = v3->_assertionController;
    v3->_assertionController = v16;

    +[_UIDictationSettingsDomain rootSettings](_UIDictationSettingsDomain, "rootSettings");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "commandHapticFeedbackEnabled");

    if (v19)
    {
      v20 = [UIImpactFeedbackGenerator alloc];
      +[_UIDictationSettingsDomain rootSettings](_UIDictationSettingsDomain, "rootSettings");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = -[UIImpactFeedbackGenerator initWithStyle:view:](v20, "initWithStyle:view:", objc_msgSend(v21, "impactStyle"), 0);
      feedbackGenerator = v3->_feedbackGenerator;
      v3->_feedbackGenerator = (UIImpactFeedbackGenerator *)v22;

    }
    v5 = v3;
    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (void)inputSystemSessionWillEndForReason:(int64_t)a3
{
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  int64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if ((unint64_t)(a3 - 1) > 1)
  {
    _UIDictationControllerLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315394;
      v6 = "+[UIDictationController inputSystemSessionWillEndForReason:]";
      v7 = 2048;
      v8 = a3;
      _os_log_impl(&dword_185066000, v4, OS_LOG_TYPE_DEFAULT, "%s Unhandled UIDictationInputSystemSessionWillEndReason. Reason=%ld", (uint8_t *)&v5, 0x16u);
    }

  }
  else
  {
    objc_msgSend(a1, "onWillResignActive");
  }
}

- (void)endSmartLanguageSelectionOverride
{
  NSString *smartLanguageSelectionOverrideLanguage;
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  smartLanguageSelectionOverrideLanguage = self->_smartLanguageSelectionOverrideLanguage;
  if (smartLanguageSelectionOverrideLanguage)
  {
    self->_smartLanguageSelectionOverrideLanguage = 0;

    _UIDictationControllerLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = 136315138;
      v5 = "-[UIDictationController endSmartLanguageSelectionOverride]";
      _os_log_impl(&dword_185066000, v3, OS_LOG_TYPE_DEFAULT, "%s ended", (uint8_t *)&v4, 0xCu);
    }

  }
}

- (void)cancelDictationForResponderIfNeeded:(id)a3 wantsKeyboard:(BOOL)a4 isPencil:(BOOL)a5
{
  _BOOL4 v5;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  char v16;
  void *v17;
  char v18;
  char v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  char v29;
  void *v30;
  char isKindOfClass;
  uint64_t v32;
  void *v33;
  _BOOL4 v34;
  void *v35;
  id v36;

  v5 = a5;
  v36 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v36;
  else
    v8 = 0;
  v9 = v8;
  objc_msgSend(v9, "window");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "_isTextEffectsWindow") & 1) != 0)
  {
    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "inputViews");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "inputAccessoryView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v9, "isDescendantOfView:", v13);

    if (!v14)
      goto LABEL_57;
  }
  else
  {

  }
  if (+[UIDictationController isRunningInTypeAndTalkMode](UIDictationController, "isRunningInTypeAndTalkMode")&& ((objc_msgSend(v36, "isFirstResponder") & 1) != 0 || a4 || v5))
  {
    if ((objc_msgSend(v36, "isFirstResponder") & 1) == 0)
    {
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "updateIdleDetection:", 4);

    }
  }
  else if (+[UIDictationController isRunning](UIDictationController, "isRunning"))
  {
    if (!os_variant_has_internal_diagnostics())
      goto LABEL_64;
    if (qword_1ECD796A0 != -1)
      dispatch_once(&qword_1ECD796A0, &__block_literal_global_749);
    if (!byte_1ECD7965B)
    {
LABEL_64:
      objc_msgSend(v36, "_responderWindow");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "_isTextEffectsWindow");

      if ((v16 & 1) == 0)
      {
        if (!objc_msgSend((id)UIApp, "_isSpringBoard")
          || (objc_msgSend(v36, "_responderWindow"),
              v17 = (void *)objc_claimAutoreleasedReturnValue(),
              v18 = objc_msgSend(v17, "_isSystemGestureWindow"),
              v17,
              (v18 & 1) == 0))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v19 = objc_msgSend(v36, "_isMicButton");
          else
            v19 = 0;
          v21 = objc_msgSend(v9, "_disableDictationTouchCancellation");
          if (+[UIDictationController isRunningInTypeAndTalkMode](UIDictationController, "isRunningInTypeAndTalkMode")|| (v21 & 1) != 0|| (v19 & 1) != 0)
          {
            +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "inputDelegateManager");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "delegateAsResponder");
            v24 = (id)objc_claimAutoreleasedReturnValue();

            +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "inputDelegateManager");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "textInputView");
            v27 = (id)objc_claimAutoreleasedReturnValue();

            v28 = v36;
            if (v36)
            {
              while (1)
              {
                v29 = 0;
                v36 = v28;
                if (v28 == v24 || v28 == v27)
                  break;
                if (v9 && (objc_msgSend(v9, "_disableDictationTouchCancellation") & 1) != 0
                  || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
                  && (objc_msgSend(v36, "_isMicButton") & 1) != 0)
                {
                  v29 = 1;
                  break;
                }
                if (qword_1ECD796A8 != -1)
                  dispatch_once(&qword_1ECD796A8, &__block_literal_global_754);
                if (objc_msgSend(v36, "_conformsToProtocolUIKeyInput"))
                {
                  if (qword_1ECD796D0 && (objc_opt_isKindOfClass() & 1) != 0)
                  {
LABEL_51:
                    +[UIDictationController activeInstance](UIDictationController, "activeInstance", v30);
                    v33 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v33, "resetDictation");

                  }
LABEL_52:
                  v29 = 0;
                  break;
                }
                if (qword_1ECD796B0 && (objc_opt_isKindOfClass() & 1) != 0
                  || qword_1ECD796C0 && (objc_opt_isKindOfClass() & 1) != 0
                  || qword_1ECD796C8 && (objc_opt_isKindOfClass() & 1) != 0
                  || (objc_msgSend((id)objc_opt_class(), "isEventFromMessagesSendButton:inspectResponderChain:", v36, 0) & 1) != 0)
                {
                  goto LABEL_52;
                }
                v30 = v36;
                if (qword_1ECD796B8)
                {
                  isKindOfClass = objc_opt_isKindOfClass();
                  v30 = v36;
                  if ((isKindOfClass & 1) != 0)
                    goto LABEL_51;
                }
                objc_msgSend(v30, "nextResponder");
                v32 = objc_claimAutoreleasedReturnValue();

                v28 = (id)v32;
                if (!v32)
                  goto LABEL_47;
              }
              v34 = +[UIDictationController isRunningInTypeAndTalkMode](UIDictationController, "isRunningInTypeAndTalkMode");
              if ((v29 & 1) == 0 && v34)
              {
                +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v35, "updateIdleDetection:", 4);

              }
            }
            else
            {
LABEL_47:
              -[UIDictationController setReasonType:](self, "setReasonType:", 20);
              -[UIDictationController cancelDictation](self, "cancelDictation");
              v36 = 0;
            }

          }
          else if ((objc_msgSend((id)objc_opt_class(), "isEventFromMessagesSendButton:inspectResponderChain:", v36, 1) & 1) == 0)
          {
            -[UIDictationController stopAndCancelDictationWithReasonType:](self, "stopAndCancelDictationWithReasonType:", 20);
            -[UIDictationController resignFirstResponderWhenIdleIfNeeded](self, "resignFirstResponderWhenIdleIfNeeded");
          }
        }
      }
    }
  }
LABEL_57:

}

+ (BOOL)isRunningInTypeAndTalkMode
{
  int v2;
  void *v3;
  char v4;

  v2 = objc_msgSend(a1, "isRunning");
  if (v2)
  {
    +[UIKeyboardInputMode dictationInputMode](UIKeyboardInputMode, "dictationInputMode");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "usingTypeAndTalk");

    LOBYTE(v2) = v4;
  }
  return v2;
}

_DWORD *__29__UIDictationController_init__block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  _DWORD *v6;
  BOOL v7;
  uint64_t v8;

  if (*(_DWORD *)(a2 + 16) != 3)
    return 0;
  +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictationUIState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v3, 200, 0, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "length");
    v6 = 0;
    if (v4)
      v7 = v5 <= 4294967294;
    else
      v7 = 0;
    if (v7)
    {
      v8 = v5;
      v6 = malloc_type_malloc(v5 + 200, 0xFFE5E278uLL);
      *v6 = 1;
      __strlcpy_chk();
      v6[1] = v8;
      objc_msgSend(v4, "getBytes:length:", v6 + 50, v8);
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (UIDictationTipController)dictationTipController
{
  return self->_dictationTipController;
}

+ (void)logCorrectionStatisticsForDelegate:(id)a3 reason:(unint64_t)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  UIDictationConnectionCorrectionInfo *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  _BOOL4 v33;
  int v34;
  void *v35;
  _BOOL4 v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  void *v41;
  objc_class *v42;
  id v43;
  _BOOL4 v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t i;
  void *v49;
  void *v50;
  objc_class *v51;
  id v52;
  void *v53;
  _BOOL4 v54;
  void *v55;
  objc_class *v56;
  id v57;
  void *v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  id obj;
  id v66;
  uint64_t v67;
  uint64_t v68;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  id v74;
  id v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  _QWORD v80[4];
  id v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  uint64_t v86;
  uint64_t v87;
  void (*v88)(uint64_t);
  void *v89;
  uint64_t *v90;
  uint64_t v91;
  uint64_t *v92;
  uint64_t v93;
  uint64_t v94;
  _BYTE v95[128];
  _BYTE v96[128];
  uint64_t v97;

  v97 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v60 = v5;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "+[UIDictationController logCorrectionStatisticsForDelegate:reason:]");

    objc_msgSend(v5, "metadataDictionariesForDictationResults");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v62, "count"))
    {
      +[UIDictationController activeInstance](UIDictationController, "activeInstance");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "connectionForStatisticsLogging");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "logDidAcceptDictationResult:reasonType:", v62, a4);
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v82 = 0u;
      v83 = 0u;
      v84 = 0u;
      v85 = 0u;
      obj = v62;
      v68 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v96, 16);
      if (v68)
      {
        v67 = *(_QWORD *)v83;
        do
        {
          v6 = 0;
          do
          {
            if (*(_QWORD *)v83 != v67)
              objc_enumerationMutation(obj);
            v7 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * v6);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v8 = v7;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
              v74 = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
              v73 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
              v72 = (void *)objc_claimAutoreleasedReturnValue();
              v9 = objc_alloc_init(UIDictationConnectionCorrectionInfo);
              objc_msgSend(v8, "objectForKey:", CFSTR("recognizedTextInfo"));
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              -[UIDictationConnectionCorrectionInfo setRecognizedTextInfo:](v9, "setRecognizedTextInfo:", v10);

              objc_msgSend(v8, "objectForKey:", CFSTR("alternativesSelected"));
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              -[UIDictationConnectionCorrectionInfo setSelectedAlternativesInfo:](v9, "setSelectedAlternativesInfo:", v11);

              objc_msgSend(v8, "objectForKey:", CFSTR("alternativesSelectedCount"));
              v71 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                -[UIDictationConnectionCorrectionInfo setAlternativeSelectionCount:](v9, "setAlternativeSelectionCount:", objc_msgSend(v71, "intValue"));
              objc_msgSend(v8, "objectForKey:", CFSTR("characterModificationCount"));
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                -[UIDictationConnectionCorrectionInfo setCharacterModificationCount:](v9, "setCharacterModificationCount:", objc_msgSend(v70, "intValue"));
              objc_msgSend(v8, "objectForKey:", CFSTR("dictationInstrumentationContext"));
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "objectForKey:", CFSTR("characterInsertionCount"));
              v13 = (void *)objc_claimAutoreleasedReturnValue();

              if (v13)
              {
                objc_msgSend(v8, "objectForKey:", CFSTR("characterInsertionCount"));
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  -[UIDictationConnectionCorrectionInfo setCharacterInsertionCount:](v9, "setCharacterInsertionCount:", objc_msgSend(v14, "intValue"));
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s characterInsertionCount: %ld"), "+[UIDictationController logCorrectionStatisticsForDelegate:reason:]", -[UIDictationConnectionCorrectionInfo characterInsertionCount](v9, "characterInsertionCount"));

                }
                objc_msgSend(v8, "objectForKey:", CFSTR("insertions"));
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(a1, "convertEditValuesToHashByPosition:dictationResultEditType:", v15, CFSTR("insertion"));
                v16 = objc_claimAutoreleasedReturnValue();

                v74 = (id)v16;
              }
              objc_msgSend(v8, "objectForKey:", CFSTR("characterDeletionCount"));
              v17 = (void *)objc_claimAutoreleasedReturnValue();

              if (v17)
              {
                objc_msgSend(v8, "objectForKey:", CFSTR("characterDeletionCount"));
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  -[UIDictationConnectionCorrectionInfo setCharacterDeletionCount:](v9, "setCharacterDeletionCount:", objc_msgSend(v18, "intValue"));
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s characterDeletionCount: %ld"), "+[UIDictationController logCorrectionStatisticsForDelegate:reason:]", -[UIDictationConnectionCorrectionInfo characterDeletionCount](v9, "characterDeletionCount"));

                }
                objc_msgSend(v8, "objectForKey:", CFSTR("deletions"));
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(a1, "convertEditValuesToHashByPosition:dictationResultEditType:", v19, CFSTR("deletion"));
                v20 = objc_claimAutoreleasedReturnValue();

                v73 = (void *)v20;
              }
              objc_msgSend(v8, "objectForKey:", CFSTR("characterSubstitutionCount"));
              v21 = (void *)objc_claimAutoreleasedReturnValue();

              if (v21)
              {
                objc_msgSend(v8, "objectForKey:", CFSTR("characterSubstitutionCount"));
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  -[UIDictationConnectionCorrectionInfo setCharacterSubstitutionCount:](v9, "setCharacterSubstitutionCount:", objc_msgSend(v22, "intValue"));
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s characterSubstitutionCount: %ld"), "+[UIDictationController logCorrectionStatisticsForDelegate:reason:]", -[UIDictationConnectionCorrectionInfo characterSubstitutionCount](v9, "characterSubstitutionCount"));

                }
                objc_msgSend(v8, "objectForKey:", CFSTR("substitutions"));
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(a1, "convertEditValuesToHashByPosition:dictationResultEditType:", v23, CFSTR("substitutions"));
                v24 = objc_claimAutoreleasedReturnValue();

                v72 = (void *)v24;
              }
              if (v12)
              {
                objc_msgSend(a1, "logAutoPunctuationEdit:deletionValues:substitutionValues:withContext:", v74, v73, v72, v12);
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v66, "addEntriesFromDictionary:", v25);

              }
              objc_msgSend(v8, "objectForKey:", CFSTR("fullText"));
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              -[UIDictationConnectionCorrectionInfo setCorrectedText:](v9, "setCorrectedText:", v26);

              v27 = (void *)MEMORY[0x1E0CB3940];
              -[UIDictationConnectionCorrectionInfo correctedText](v9, "correctedText");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "stringWithFormat:", CFSTR("%s fullText: %@"), "+[UIDictationController logCorrectionStatisticsForDelegate:reason:]", v28);

              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s alternativeSelectionCount: %ld"), "+[UIDictationController logCorrectionStatisticsForDelegate:reason:]", -[UIDictationConnectionCorrectionInfo alternativeSelectionCount](v9, "alternativeSelectionCount"));
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s characterModificationCount: %ld"), "+[UIDictationController logCorrectionStatisticsForDelegate:reason:]", -[UIDictationConnectionCorrectionInfo characterModificationCount](v9, "characterModificationCount"));

              objc_msgSend(v8, "objectForKey:", CFSTR("correctionIdentifier"));
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "objectForKey:", CFSTR("dictationUIInteractionIdentifier"));
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "objectForKey:", CFSTR("speechRecognitionSource"));
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v32 = objc_msgSend(v31, "isEqualToString:", CFSTR("local"));

              v33 = -[UIDictationConnectionCorrectionInfo alternativeSelectionCount](v9, "alternativeSelectionCount")
                 || -[UIDictationConnectionCorrectionInfo characterModificationCount](v9, "characterModificationCount")
                 || -[UIDictationConnectionCorrectionInfo characterInsertionCount](v9, "characterInsertionCount")
                 || -[UIDictationConnectionCorrectionInfo characterDeletionCount](v9, "characterDeletionCount")
                 || -[UIDictationConnectionCorrectionInfo characterSubstitutionCount](v9, "characterSubstitutionCount") != 0;
              v34 = !v33;
              if (!v29)
                v34 = 1;
              if (((v34 | v32) & 1) == 0)
                objc_msgSend(v64, "sendSpeechCorrection:forIdentifier:", v9, v29);
              if ((v32 & v33) == 1)
              {
                objc_msgSend(getAFPreferencesClass_0(), "sharedPreferences");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                v36 = objc_msgSend(v35, "siriDataSharingOptInStatus") == 1;

                if (v36)
                {
                  objc_msgSend(v8, "objectForKey:", CFSTR("userEditedTextInfo"));
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  -[UIDictationConnectionCorrectionInfo setUserEditedTextInfo:](v9, "setUserEditedTextInfo:", v37);

                  objc_msgSend(v8, "objectForKey:", CFSTR("alternativesSelected"));
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                  v39 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                  v80[0] = MEMORY[0x1E0C809B0];
                  v80[1] = 3221225472;
                  v80[2] = __67__UIDictationController_logCorrectionStatisticsForDelegate_reason___block_invoke;
                  v80[3] = &unk_1E16D4590;
                  v40 = v39;
                  v81 = v40;
                  objc_msgSend(v38, "enumerateObjectsUsingBlock:", v80);
                  if (objc_msgSend(v40, "count"))
                  {
                    v91 = 0;
                    v92 = &v91;
                    v93 = 0x2050000000;
                    v41 = (void *)qword_1ECD79788;
                    v94 = qword_1ECD79788;
                    if (!qword_1ECD79788)
                    {
                      v86 = MEMORY[0x1E0C809B0];
                      v87 = 3221225472;
                      v88 = __getSISchemaUEIDictationAlternativeTextPairsSelectedClass_block_invoke;
                      v89 = &unk_1E16B14C0;
                      v90 = &v91;
                      __getSISchemaUEIDictationAlternativeTextPairsSelectedClass_block_invoke((uint64_t)&v86);
                      v41 = (void *)v92[3];
                    }
                    v42 = objc_retainAutorelease(v41);
                    _Block_object_dispose(&v91, 8);
                    v43 = objc_alloc_init(v42);
                    objc_msgSend(v43, "setAlternativeSelections:", v40);
                    objc_msgSend(v12, "emitInstrumentation:", v43);

                  }
                  objc_msgSend(v64, "sendSpeechCorrection:interactionIdentifier:", v9, v30);

                }
              }
              if (v12)
                v44 = v33;
              else
                v44 = 0;
              if (v44)
                objc_msgSend(v63, "addObject:", v12);

            }
            ++v6;
          }
          while (v68 != v6);
          v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v96, 16);
          v68 = v45;
        }
        while (v45);
      }

      v78 = 0u;
      v79 = 0u;
      v76 = 0u;
      v77 = 0u;
      v75 = v63;
      v46 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v76, v95, 16);
      if (v46)
      {
        v47 = *(_QWORD *)v77;
        do
        {
          for (i = 0; i != v46; ++i)
          {
            if (*(_QWORD *)v77 != v47)
              objc_enumerationMutation(v75);
            v49 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * i);
            v91 = 0;
            v92 = &v91;
            v93 = 0x2050000000;
            v50 = (void *)qword_1ECD79790;
            v94 = qword_1ECD79790;
            if (!qword_1ECD79790)
            {
              v86 = MEMORY[0x1E0C809B0];
              v87 = 3221225472;
              v88 = __getSISchemaDictationContentEditedClass_block_invoke;
              v89 = &unk_1E16B14C0;
              v90 = &v91;
              __getSISchemaDictationContentEditedClass_block_invoke((uint64_t)&v86);
              v50 = (void *)v92[3];
            }
            v51 = objc_retainAutorelease(v50);
            _Block_object_dispose(&v91, 8);
            v52 = objc_alloc_init(v51);
            objc_msgSend(v52, "setExists:", 1);
            objc_msgSend(getAFPreferencesClass_0(), "sharedPreferences");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            v54 = objc_msgSend(v53, "siriDataSharingOptInStatus") == 1;

            if (v54)
            {
              v91 = 0;
              v92 = &v91;
              v93 = 0x2050000000;
              v55 = (void *)qword_1ECD79798;
              v94 = qword_1ECD79798;
              if (!qword_1ECD79798)
              {
                v86 = MEMORY[0x1E0C809B0];
                v87 = 3221225472;
                v88 = __getSISchemaUEIDictationContentEditedTier1Class_block_invoke;
                v89 = &unk_1E16B14C0;
                v90 = &v91;
                __getSISchemaUEIDictationContentEditedTier1Class_block_invoke((uint64_t)&v86);
                v55 = (void *)v92[3];
              }
              v56 = objc_retainAutorelease(v55);
              _Block_object_dispose(&v91, 8);
              v57 = objc_alloc_init(v56);
              objc_msgSend(v49, "turnIdentifier");
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v66, "objectForKey:", v58);
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v57, "setAutoPunctuationEdits:", v59);

              objc_msgSend(v49, "emitInstrumentation:", v57);
            }
            objc_msgSend(v49, "emitInstrumentation:", v52);

          }
          v46 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v76, v95, 16);
        }
        while (v46);
      }

      objc_msgSend(v61, "releaseConnectionAfterStatisticsLogging");
    }

    v5 = v60;
  }

}

+ (id)activeConnection
{
  void *v2;
  void *v3;

  +[UIDictationController activeInstance](UIDictationController, "activeInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictationConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (float)maxRecordingLength
{
  _BOOL4 v2;
  float result;

  v2 = -[UIDictationController isDetectingUtterances](self, "isDetectingUtterances");
  result = 60.0;
  if (v2)
    return 30.0;
  return result;
}

+ (BOOL)usingServerManualEndpointingThreshold
{
  void *v2;
  char v3;

  +[UIDictationConnectionPreferences sharedInstance](UIDictationConnectionPreferences, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "ignoreServerManualEndpointingThreshold") ^ 1;

  return v3;
}

+ (double)serverManualEndpointingThreshold
{
  void *v2;
  void *v3;
  float v4;
  double v5;

  +[UIDictationConnectionPreferences sharedInstance](UIDictationConnectionPreferences, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "manualEndpointingThreshold");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "floatValue");
  v5 = v4;

  return v5;
}

void __29__UIDictationController_init__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = CFSTR("reason");
  v4[0] = CFSTR("Dictation controller init");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "postNotificationName:userInfo:", CFSTR("UIKeyboardDictationAvailabilityDidChangeNotification"), v2);

}

- (id)streamingOperations
{
  UIDictationStreamingOperations *v3;
  UIDictationStreamingOperations *streamingOperations;
  UIDictationStreamingOperations *v5;
  UIDictationStreamingOperations *v6;

  if (+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
  {
    v3 = 0;
  }
  else
  {
    streamingOperations = self->_streamingOperations;
    if (!streamingOperations)
    {
      v5 = objc_alloc_init(UIDictationStreamingOperations);
      v6 = self->_streamingOperations;
      self->_streamingOperations = v5;

      streamingOperations = self->_streamingOperations;
    }
    v3 = streamingOperations;
  }
  return v3;
}

+ (BOOL)supportsUndoCommandForCurrentDictationRequest
{
  int v2;

  v2 = objc_msgSend(a1, "supportsSiriDictationVoiceCommands");
  if (v2)
    LOBYTE(v2) = +[UIKeyboard isModelessActive](UIKeyboard, "isModelessActive");
  return v2;
}

+ (BOOL)canUndoOrRedo
{
  void *v3;
  char v4;

  +[UIDictationController activeInstance](UIDictationController, "activeInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "canUndoOrRedo") & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(a1, "supportsUndoCommandForCurrentDictationRequest");

  return v4;
}

+ (BOOL)isListening
{
  _BOOL4 v2;
  uint64_t v3;

  v2 = +[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI");
  v3 = 12;
  if (v2)
    v3 = 8;
  return *(_DWORD *)&_MergedGlobals_35_1[v3] == 2;
}

+ (BOOL)supportsSiriDictationVoiceCommands
{
  int v2;

  v2 = _os_feature_enabled_impl();
  if (v2)
    LOBYTE(v2) = MGGetSInt64Answer() > 31;
  return v2;
}

+ (BOOL)supportsSiriDictationVoiceCommandsUIRedesign
{
  if (+[UIKeyboard isInlineDictationGlowEffectEnabled](UIKeyboard, "isInlineDictationGlowEffectEnabled")
    && +[UIKeyboard isInlineDictationIndicatorEnabled](UIKeyboard, "isInlineDictationIndicatorEnabled"))
  {
    return _os_feature_enabled_impl();
  }
  else
  {
    return 0;
  }
}

+ (BOOL)supportsSiriDictationVoiceCommandsGazeDisambiguation
{
  return 0;
}

+ (id)serializedInterpretationFromTokens:(id)a3 transform:(__CFString *)a4 capitalization:(unint64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v8 = a3;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "textInputTraits");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "autocapitalizationType");

  objc_msgSend(a1, "serializedInterpretationFromTokens:transform:autocapitalization:capitalization:", v8, a4, v11, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)serializedInterpretationFromTokens:(id)a3 transform:(__CFString *)a4 autocapitalization:(int64_t)a5 capitalization:(unint64_t)a6
{
  char v6;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  unsigned int v35;
  int v36;
  unsigned int v37;
  int v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;

  v6 = a6;
  v49 = *MEMORY[0x1E0C80C00];
  +[UIDictationInterpretation serializedInterpretationFromTokens:transform:](UIDictationInterpretation, "serializedInterpretationFromTokens:transform:", a3, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 & 2) != 0)
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isShiftLocked");
    if (a5 == 3 || v10)
    {
      objc_msgSend(v8, "uppercaseString");
      v11 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (a5 != 1)
        goto LABEL_8;
      objc_msgSend(v8, "capitalizedString");
      v11 = objc_claimAutoreleasedReturnValue();
    }
    v12 = (void *)v11;

    v8 = v12;
LABEL_8:
    if (!objc_msgSend(v8, "length"))
    {
LABEL_16:

      goto LABEL_17;
    }
    +[UIDictationUtilities _properNameForString:](UIDictationUtilities, "_properNameForString:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!qword_1ECD79668)
    {
      v14 = -[UITextChecker _initWithAsynchronousLoading:]([UITextChecker alloc], "_initWithAsynchronousLoading:", 1);
      v15 = (void *)qword_1ECD79668;
      qword_1ECD79668 = (uint64_t)v14;

    }
    +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "language");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if ((v6 & 1) != 0 || !v13)
    {
      if ((v6 & 4) != 0 && byte_1ECD79659)
      {
        v35 = objc_msgSend(v8, "characterAtIndex:", 0);
        if (v35 > 0x7F)
          v36 = __maskrune(v35, 0x1000uLL);
        else
          v36 = *(_DWORD *)(MEMORY[0x1E0C80978] + 4 * v35 + 60) & 0x1000;
        if (!v36
          || !objc_msgSend((id)qword_1ECD79668, "canChangeCaseOfFirstLetterInString:toUpperCase:language:", v8, 1, v17))
        {
          goto LABEL_15;
        }
        objc_msgSend(v8, "substringToIndex:", 1);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "uppercaseString");
        v40 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if ((v6 & 1) != 0)
          goto LABEL_15;
        v37 = objc_msgSend(v8, "characterAtIndex:", 0);
        v38 = v37 > 0x7F ? __maskrune(v37, 0x8000uLL) : *(_DWORD *)(MEMORY[0x1E0C80978] + 4 * v37 + 60) & 0x8000;
        if ((v6 & 4) == 0
          || !v38
          || !objc_msgSend((id)qword_1ECD79668, "canChangeCaseOfFirstLetterInString:toUpperCase:language:", v8, 0, v17))
        {
          goto LABEL_15;
        }
        objc_msgSend(v8, "substringToIndex:", 1);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "lowercaseString");
        v40 = objc_claimAutoreleasedReturnValue();
      }
      v41 = (void *)v40;
      objc_msgSend(v8, "substringFromIndex:", 1);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "stringByAppendingString:", v42);
      v18 = (id)objc_claimAutoreleasedReturnValue();

      v8 = v39;
    }
    else
    {
      v18 = v13;
    }

    v8 = v18;
LABEL_15:

    goto LABEL_16;
  }
LABEL_17:
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "smartPunctuationController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "length"))
  {
    objc_msgSend(v20, "smartPunctuationOptions");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      objc_msgSend(v20, "smartPunctuationResultsForString:", v8);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v22, "count"))
      {
        v23 = (void *)objc_msgSend(v8, "mutableCopy");
        v44 = 0u;
        v45 = 0u;
        v46 = 0u;
        v47 = 0u;
        v43 = v22;
        v24 = v22;
        v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
        if (v25)
        {
          v26 = v25;
          v27 = *(_QWORD *)v45;
          do
          {
            for (i = 0; i != v26; ++i)
            {
              if (*(_QWORD *)v45 != v27)
                objc_enumerationMutation(v24);
              v29 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
              v30 = objc_msgSend(v29, "range");
              v32 = v31;
              objc_msgSend(v29, "replacementString");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "replaceCharactersInRange:withString:", v30, v32, v33);

            }
            v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
          }
          while (v26);
        }

        v8 = v23;
        v22 = v43;
      }

    }
  }

  return v8;
}

+ (BOOL)canPerformDictation
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  char v9;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isCurrentEditResponderInEditingMode");

  if (!v4)
    return 0;
  _UIKitUserDefaults();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(a1, "_isDictationAllowedWithUserDefaults:", v5)
    && (+[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "textInputTraits"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(a1, "checkTraitsSupportDictation:", v7),
        v7,
        v6,
        v8))
  {
    v9 = objc_msgSend(a1, "dictationIsFunctional");
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)logAutoPunctuationEdit:(id)a3 deletionValues:(id)a4 substitutionValues:(id)a5 withContext:(id)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  __CFString *v21;
  void *v22;
  objc_class *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  id v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  id obj;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _QWORD v48[5];
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  id v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v38 = a4;
  v37 = a5;
  v35 = a6;
  v33 = v10;
  objc_msgSend(a1, "stripNonPunctuationEditValues:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = (void *)objc_msgSend(v11, "mutableCopy");

  objc_msgSend(a1, "stripNonPunctuationEditValues:", v38);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = (void *)objc_msgSend(v12, "mutableCopy");

  objc_msgSend(a1, "stripNonPunctuationEditValues:", v37);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)objc_msgSend(v13, "mutableCopy");

  objc_msgSend(a1, "mergePunctuationInsertAndDeleteIntoSubstituteTypeForSameStartEnd:deleteEditValues:", v41, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v40, "allKeys");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "removeObjectsForKeys:", v14);

  objc_msgSend(v40, "allKeys");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "removeObjectsForKeys:", v15);

  v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v16, "addEntriesFromDictionary:", v41);
  objc_msgSend(v16, "addEntriesFromDictionary:", v39);
  objc_msgSend(v16, "addEntriesFromDictionary:", v36);
  objc_msgSend(v16, "addEntriesFromDictionary:", v40);
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v34 = v16;
  objc_msgSend(v16, "allValues");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v55, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v45 != v18)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
        objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("dictationResultEditType"));
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v49 = 0;
        v50 = &v49;
        v51 = 0x2050000000;
        v22 = (void *)getSISchemaAutoPunctuationEditClass_softClass;
        v52 = getSISchemaAutoPunctuationEditClass_softClass;
        if (!getSISchemaAutoPunctuationEditClass_softClass)
        {
          v48[0] = MEMORY[0x1E0C809B0];
          v48[1] = 3221225472;
          v48[2] = __getSISchemaAutoPunctuationEditClass_block_invoke;
          v48[3] = &unk_1E16B14C0;
          v48[4] = &v49;
          __getSISchemaAutoPunctuationEditClass_block_invoke((uint64_t)v48);
          v22 = (void *)v50[3];
        }
        v23 = objc_retainAutorelease(v22);
        _Block_object_dispose(&v49, 8);
        v24 = objc_alloc_init(v23);
        v25 = v24;
        if (v21 == CFSTR("insertion"))
        {
          objc_msgSend(v24, "setRecognizedPunctuation:", &stru_1E16EDF20);
          objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("text"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setCorrectedPunctuation:", v28);

        }
        else if (v21 == CFSTR("deletion"))
        {
          objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("text"));
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setRecognizedPunctuation:", v29);

          objc_msgSend(v25, "setCorrectedPunctuation:", &stru_1E16EDF20);
        }
        else
        {
          if (v21 != CFSTR("substitution"))
            goto LABEL_15;
          objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("original"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setRecognizedPunctuation:", v26);

          objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("replacement"));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setCorrectedPunctuation:", v27);

        }
        objc_msgSend(v43, "addObject:", v25);
LABEL_15:

      }
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v55, 16);
    }
    while (v17);
  }

  objc_msgSend(v35, "turnIdentifier");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = v30;
  v54 = v43;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return v31;
}

+ (id)stripNonPunctuationEditValues:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  v4 = (void *)objc_msgSend(v3, "mutableCopy");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__UIDictationController_stripNonPunctuationEditValues___block_invoke;
  v7[3] = &unk_1E16C55B8;
  v5 = v4;
  v8 = v5;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v7);

  return v5;
}

void __55__UIDictationController_stripNonPunctuationEditValues___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  __CFString *v6;
  __CFString *v7;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  id v16;

  v16 = a2;
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("dictationResultEditType"));
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 == CFSTR("insertion") || v6 == CFSTR("deletion"))
  {
    objc_msgSend(v5, "objectForKey:", CFSTR("text"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIDictationUtilities trackingPunctuations](UIDictationUtilities, "trackingPunctuations");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "containsObject:", v9);

    if ((v11 & 1) == 0)
      objc_msgSend(*(id *)(a1 + 32), "removeObjectForKey:", v16);
    goto LABEL_15;
  }
  if (v6 == CFSTR("substitution"))
  {
    objc_msgSend(v5, "objectForKey:", CFSTR("original"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", CFSTR("replacement"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIDictationUtilities trackingPunctuations](UIDictationUtilities, "trackingPunctuations");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v13, "containsObject:", v9) & 1) != 0)
    {
      +[UIDictationUtilities trackingPunctuations](UIDictationUtilities, "trackingPunctuations");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "containsObject:", v12);

      if ((v15 & 1) != 0)
        goto LABEL_14;
    }
    else
    {

    }
    objc_msgSend(*(id *)(a1 + 32), "removeObjectForKey:", v16);
LABEL_14:

LABEL_15:
  }

}

+ (id)mergePunctuationInsertAndDeleteIntoSubstituteTypeForSameStartEnd:(id)a3 deleteEditValues:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  int v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  const __CFString *v20;
  const __CFString *v21;
  id v22;
  void *v23;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v22 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v23 = v5;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  objc_msgSend(v5, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v26;
    v21 = CFSTR("substitution");
    v20 = CFSTR("dictationResultEditType");
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v26 != v9)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v6, "allKeys", v20, v21);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "containsObject:", v11);

        if (v13)
        {
          v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          objc_msgSend(v6, "objectForKeyedSubscript:", v11);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "objectForKeyedSubscript:", v11);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectForKey:", CFSTR("text"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectForKey:", CFSTR("text"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setObject:forKeyedSubscript:", v17, CFSTR("original"));
          objc_msgSend(v14, "setObject:forKeyedSubscript:", v18, CFSTR("replacement"));
          objc_msgSend(v14, "setObject:forKeyedSubscript:", v21, v20);
          objc_msgSend(v22, "setObject:forKeyedSubscript:", v14, v11);

        }
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v8);
  }

  return v22;
}

+ (id)convertEditValuesToHashByPosition:(id)a3 dictationResultEditType:(id)a4
{
  id v5;
  __CFString *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  BOOL v22;
  void *v23;
  __CFString *v25;
  id v26;
  id obj;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (__CFString *)a4;
  v7 = 0x1E0C99000uLL;
  v26 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = v5;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v8)
  {
    v9 = v8;
    v28 = *(_QWORD *)v30;
    v25 = v6;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v30 != v28)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        v12 = objc_alloc_init(*(Class *)(v7 + 3592));
        if (CFSTR("substitutions") == v6)
        {
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("original"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("start"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("original"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("end"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("original"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("text"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setObject:forKeyedSubscript:", v19, CFSTR("original"));

          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("replacement"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("text"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setObject:forKeyedSubscript:", v21, CFSTR("replacement"));

          v7 = 0x1E0C99000;
          v6 = v25;

          objc_msgSend(v12, "setObject:forKeyedSubscript:", CFSTR("substitution"), CFSTR("dictationResultEditType"));
        }
        else
        {
          objc_msgSend(v11, "objectForKey:", CFSTR("start"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectForKey:", CFSTR("end"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setObject:forKeyedSubscript:", v6, CFSTR("dictationResultEditType"));
          objc_msgSend(v11, "objectForKey:", CFSTR("text"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setObject:forKeyedSubscript:", v15, CFSTR("text"));

        }
        if (v13)
          v22 = v14 == 0;
        else
          v22 = 1;
        if (!v22)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("start%@end%@"), v13, v14);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "setObject:forKeyedSubscript:", v12, v23);

        }
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v9);
  }

  return v26;
}

void __67__UIDictationController_logCorrectionStatisticsForDelegate_reason___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  objc_class *v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("originalText"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("replacementText"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v15 = &v14;
  v16 = 0x2050000000;
  v8 = (void *)getASRSchemaASRConfusionPairTokenClass_softClass;
  v17 = getASRSchemaASRConfusionPairTokenClass_softClass;
  if (!getASRSchemaASRConfusionPairTokenClass_softClass)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __getASRSchemaASRConfusionPairTokenClass_block_invoke;
    v13[3] = &unk_1E16B14C0;
    v13[4] = &v14;
    __getASRSchemaASRConfusionPairTokenClass_block_invoke((uint64_t)v13);
    v8 = (void *)v15[3];
  }
  v9 = objc_retainAutorelease(v8);
  _Block_object_dispose(&v14, 8);
  v10 = objc_alloc_init(v9);
  v19[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setRecognizedTokens:", v11);

  v18 = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setCorrectedTokens:", v12);

  objc_msgSend(v10, "setRecognizedTokensStartIndex:", a3);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v10);

}

+ (unint64_t)reasonType:(id)a3
{
  id v4;
  void *v5;
  char v6;
  unint64_t v7;
  void *v8;
  char v9;
  void *v10;
  char v11;
  void *v12;
  char v13;
  void *v14;
  char v15;
  void *v16;
  char v17;
  void *v18;
  char v19;
  void *v20;
  char v21;
  void *v22;
  char v23;
  void *v24;
  char v25;
  void *v26;
  int v27;

  v4 = a3;
  objc_msgSend(v4, "invocationSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("UIDictationInputModeInvocationSourceMicButtonInSafariAddressBar"));

  if ((v6 & 1) != 0)
  {
    v7 = 10;
  }
  else
  {
    objc_msgSend(v4, "invocationSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("UIDictationInputModeInvocationSourceMicButtonInFirstResponderSafariAddressBar"));

    if ((v9 & 1) != 0)
    {
      v7 = 11;
    }
    else
    {
      objc_msgSend(v4, "invocationSource");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("UIDictationInputModeInvocationSourceUCBBar"));

      if ((v11 & 1) != 0)
      {
        v7 = 12;
      }
      else
      {
        objc_msgSend(v4, "invocationSource");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("UIDictationInputModeInvocationSourceMicButtonInMessagesTextField"));

        if ((v13 & 1) != 0)
        {
          v7 = 13;
        }
        else
        {
          objc_msgSend(v4, "invocationSource");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("UIDictationInputModeInvocationSourceLongPressGesture"));

          if ((v15 & 1) != 0)
          {
            v7 = 26;
          }
          else
          {
            objc_msgSend(v4, "invocationSource");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("UIDictationInputModeInvocationSourceMicButtonMicButtonInFirstResponderSearchBar"));

            if ((v17 & 1) != 0)
            {
              v7 = 9;
            }
            else
            {
              objc_msgSend(v4, "invocationSource");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("UIDictationInputModeInvocationSourceMicButtonInKeyboard"));

              if ((v19 & 1) != 0)
              {
                v7 = 1;
              }
              else
              {
                objc_msgSend(v4, "invocationSource");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("UIDictationInputModeInvocationSourceGenerativeField"));

                if ((v21 & 1) != 0)
                {
                  v7 = 30;
                }
                else
                {
                  objc_msgSend(v4, "invocationSource");
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("UIDictationInputModeInvocationSourceDictationPopUpUILanguageSwitcherIcon"));

                  if ((v23 & 1) != 0)
                  {
                    v7 = 28;
                  }
                  else
                  {
                    objc_msgSend(v4, "invocationSource");
                    v24 = (void *)objc_claimAutoreleasedReturnValue();
                    v25 = objc_msgSend(v24, "isEqualToString:", CFSTR("UIDictationInputModeInvocationSourceGlobalButtonOnDictationPlane"));

                    if ((v25 & 1) != 0)
                    {
                      v7 = 16;
                    }
                    else
                    {
                      objc_msgSend(v4, "invocationSource");
                      v26 = (void *)objc_claimAutoreleasedReturnValue();
                      v27 = objc_msgSend(v26, "isEqualToString:", CFSTR("UIDictationInputModeInvocationSourceMicButtonOnKeyboardWithInputSwitcher"));

                      if (v27)
                        v7 = objc_msgSend(a1, "specificReasonTypeMicButtonOnKeyboardWithInputSwitcher");
                      else
                        v7 = 18;
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  return v7;
}

+ (id)UIDictationStartStopReasonTypeDescription:(unint64_t)a3
{
  if (a3 - 1 > 0x1C)
    return CFSTR("Unknown");
  else
    return off_1E16D50B8[a3 - 1];
}

+ (id)UIDictationLanguageSourceType:(unint64_t)a3
{
  if (a3 - 1 > 3)
    return CFSTR("Unknown");
  else
    return off_1E16D51A0[a3 - 1];
}

- (void)setDictationInputMode:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  +[UIKeyboardInputMode dictationInputMode](UIKeyboardInputMode, "dictationInputMode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v12, "isEqual:", v4);

  if ((v5 & 1) == 0)
  {
    -[UIDictationController setCurrentInputModeForDictation:](self, "setCurrentInputModeForDictation:", v12);
    objc_msgSend(v12, "setLastUsedDictationLanguage");
    +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "currentInputMode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIDictationController setKeyboardInputModeToReturn:](self, "setKeyboardInputModeToReturn:", v7);

    if (!+[UIDictationUtilities _isUsingLargeFormatDictationUI](UIDictationUtilities, "_isUsingLargeFormatDictationUI")|| (+[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard"), v8 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(v8, "_window"), v9 = (void *)objc_claimAutoreleasedReturnValue(), v9, v8, v9))
    {
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIKeyboardInputMode dictationInputMode](UIKeyboardInputMode, "dictationInputMode");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setKeyboardInputMode:userInitiated:", v11, 0);

    }
  }

}

+ (BOOL)isTextViewOnStarkScreen:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;

  v3 = a3;
  if (objc_msgSend(v3, "__isKindOfUIResponder"))
  {
    objc_msgSend(v3, "_responderWindow");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "screen");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "_userInterfaceIdiom") == 3;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (BOOL)shouldHideSelectionUIForTextView:(id)a3
{
  return (objc_msgSend(a1, "isTextViewOnStarkScreen:", a3) & 1) != 0
      || +[UIDictationController viewMode](UIDictationController, "viewMode") == 6;
}

+ (BOOL)shouldHideCursorForTextView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;

  v4 = a3;
  if (objc_msgSend(a1, "isTextViewOnStarkScreen:", v4)
    && objc_msgSend(v4, "__isKindOfUIResponder"))
  {
    objc_msgSend(v4, "_responderWindow");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "screen");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "_capabilityForKey:", CFSTR("UIScreenCapabilityTouchLevelsKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "integerValue") == 2;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (BOOL)takesPressesBegan:(id)a3 forTextView:(id)a4
{
  id v6;
  char v7;

  v6 = a3;
  if (objc_msgSend(a1, "isTextViewOnStarkScreen:", a4))
  {
    if ((_UIPressesContainsPressType(v6, 4) & 1) != 0)
      v7 = 1;
    else
      v7 = _UIPressesContainsPressType(v6, 7);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (BOOL)takesPressesChanged:(id)a3 forTextView:(id)a4
{
  return 0;
}

+ (BOOL)takesPressesEnded:(id)a3 forTextView:(id)a4
{
  return 0;
}

- (BOOL)_shouldDeleteBackward
{
  if (-[UIDictationController performingStreamingEditingOperation](self, "performingStreamingEditingOperation")
    || !+[UIDictationController isRunning](UIDictationController, "isRunning")
    || +[UIDictationController isRunningInTypeAndTalkMode](UIDictationController, "isRunningInTypeAndTalkMode"))
  {
    return 1;
  }
  -[UIDictationController setDiscardNextHypothesis:](self, "setDiscardNextHypothesis:", 1);
  return 0;
}

+ (BOOL)shouldDeleteBackward
{
  void *v2;
  void *v3;
  char v4;

  +[UIDictationController activeInstance](UIDictationController, "activeInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
    return 1;
  +[UIDictationController activeInstance](UIDictationController, "activeInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_shouldDeleteBackward");

  return v4;
}

- (BOOL)_shouldInsertText:(id)a3
{
  void *v3;

  if (!-[UIDictationController performingStreamingEditingOperation](self, "performingStreamingEditingOperation", a3)
    && +[UIDictationController isRunning](UIDictationController, "isRunning"))
  {
    +[UIKeyboardInputMode dictationInputMode](UIKeyboardInputMode, "dictationInputMode");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "usingTypeAndTalk");

  }
  return 1;
}

+ (BOOL)shouldInsertText:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;

  v3 = a3;
  +[UIDictationController activeInstance](UIDictationController, "activeInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    +[UIDictationController activeInstance](UIDictationController, "activeInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "_shouldInsertText:", v3);

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

+ (id)serializedDictationPhrases:(id)a3
{
  void *v3;
  void *v4;

  +[UIDictationUtilities dictationPhrasesFromPhraseArray:](UIDictationUtilities, "dictationPhrasesFromPhraseArray:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textArray");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)bestInterpretationForDictationResult:(id)a3
{
  id v3;
  UIDictationSerializableResults *v4;
  void *v5;

  v3 = a3;
  v4 = -[UIDictationSerializableResults initWithArrayOfArrayOfStrings:]([UIDictationSerializableResults alloc], "initWithArrayOfArrayOfStrings:", v3);

  -[UIDictationSerializableResults bestText](v4, "bestText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (void)keyboardDidShow
{
  void *v2;
  void *v3;
  id v4;

  if (byte_1ECD7965A == 1)
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      byte_1ECD7965A = 0;
      +[UIDictationController activeInstance](UIDictationController, "activeInstance");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "switchToDictationInputMode");

    }
  }
}

+ (void)applicationDidEnterBackgroundNotification
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_endEnableDictationPromptAnimated:", 0);

  +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "logAppEnterBackground");

  if (v4)
  {
    objc_msgSend(getAFAnalyticsClass(), "sharedAnalytics");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = CFSTR("isSuspendedUnderLock");
    v6 = objc_msgSend((id)UIApp, "isSuspendedUnderLock");
    v7 = MEMORY[0x1E0C9AAA0];
    if (v6)
      v7 = MEMORY[0x1E0C9AAB0];
    v11[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "logEventWithType:context:", 2218, v8);

    +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setLogAppEnterBackground:", 0);

  }
}

+ (void)siriPreferencesChanged
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)qword_1ECD79670;
  qword_1ECD79670 = 0;

  v4 = (void *)qword_1ECD79678;
  qword_1ECD79678 = 0;

  objc_msgSend(a1, "keyboardDidUpdateOnScreenStatus");
  +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = CFSTR("reason");
  v8[0] = CFSTR("Dictation controller siri preferences changed");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:userInfo:", CFSTR("UIKeyboardDictationAvailabilityDidChangeNotification"), v6);

}

+ (void)remoteMicrophoneCapabilityChanged
{
  void *v2;
  void *v3;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "keyboardDidUpdateOnScreenStatus");
  +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = CFSTR("reason");
  v5[0] = CFSTR("Dictation controller remote microphone capability changed");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:userInfo:", CFSTR("UIKeyboardDictationAvailabilityDidChangeNotification"), v3);

}

+ (id)serializedInterpretationFromTokens:(id)a3 transform:(__CFString *)a4
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = objc_msgSend(v4, "count");
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v7 = 0;
    v8 = 0;
    while (1)
    {
      objc_msgSend(v4, "objectAtIndex:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) == 0
        || (objc_opt_respondsToSelector() & 1) == 0
        || (objc_opt_respondsToSelector() & 1) == 0)
      {
        break;
      }
      if ((v8 & 1) != 0 && (objc_msgSend(v9, "removeSpaceBefore") & 1) == 0)
        objc_msgSend(v6, "appendString:", CFSTR(" "));
      objc_msgSend(v9, "text");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "appendString:", v10);
      v8 = objc_msgSend(v9, "removeSpaceAfter") ^ 1;

      if (v5 == ++v7)
        goto LABEL_10;
    }

    v11 = 0;
  }
  else
  {
LABEL_10:
    objc_msgSend(v6, "_stringByApplyingTransform:", a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

+ (id)interpretation:(id)a3 forPhraseIndex:(unint64_t)a4 isShiftLocked:(BOOL)a5 autocapitalizationType:(int64_t)a6 useServerCapitalization:(BOOL)a7
{
  _BOOL4 v9;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  unsigned int v21;
  int v22;
  unsigned int v23;
  int v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;

  v9 = a5;
  v11 = a3;
  v12 = v11;
  if (a6 == 3 || v9)
  {
    objc_msgSend(v11, "uppercaseString");
    v13 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  if (a6 == 1)
  {
    objc_msgSend(v11, "capitalizedString");
    v13 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v14 = (void *)v13;

    v12 = v14;
  }
  if (!a4 && objc_msgSend(v12, "length"))
  {
    +[UIDictationUtilities _properNameForString:](UIDictationUtilities, "_properNameForString:", v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!qword_1ECD79680)
    {
      v16 = -[UITextChecker _initWithAsynchronousLoading:]([UITextChecker alloc], "_initWithAsynchronousLoading:", 1);
      v17 = (void *)qword_1ECD79680;
      qword_1ECD79680 = (uint64_t)v16;

    }
    +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "language");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15 || a7)
    {
      if (byte_1ECD79659)
      {
        v21 = objc_msgSend(v12, "characterAtIndex:", 0);
        if (v21 > 0x7F)
          v22 = __maskrune(v21, 0x1000uLL);
        else
          v22 = *(_DWORD *)(MEMORY[0x1E0C80978] + 4 * v21 + 60) & 0x1000;
        if (!v22
          || !objc_msgSend((id)qword_1ECD79680, "canChangeCaseOfFirstLetterInString:toUpperCase:language:", v12, 0, v19))
        {
          goto LABEL_30;
        }
        objc_msgSend(v12, "substringToIndex:", 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "uppercaseString");
        v26 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (a7)
          goto LABEL_30;
        v23 = objc_msgSend(v12, "characterAtIndex:", 0);
        v24 = v23 > 0x7F ? __maskrune(v23, 0x8000uLL) : *(_DWORD *)(MEMORY[0x1E0C80978] + 4 * v23 + 60) & 0x8000;
        if (!v24
          || !objc_msgSend((id)qword_1ECD79680, "canChangeCaseOfFirstLetterInString:toUpperCase:language:", v12, 0, v19))
        {
          goto LABEL_30;
        }
        objc_msgSend(v12, "substringToIndex:", 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "lowercaseString");
        v26 = objc_claimAutoreleasedReturnValue();
      }
      v27 = (void *)v26;
      objc_msgSend(v12, "substringFromIndex:", 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "stringByAppendingString:", v28);
      v20 = (id)objc_claimAutoreleasedReturnValue();

      v12 = v25;
    }
    else
    {
      v20 = v15;
    }

    v12 = v20;
LABEL_30:

  }
  return v12;
}

+ (void)performOperations:(id)a3 keyboardShifted:(BOOL)a4
{
  char v4;

  v4 = byte_1ECD79659;
  byte_1ECD79659 = a4;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  byte_1ECD79659 = v4;
}

+ (void)updateLandingView
{
  void *v2;
  void *v3;
  id v4;

  +[UIDictationLandingView activeInstance](UIDictationLandingView, "activeInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    +[UIDictationLandingView activeInstance](UIDictationLandingView, "activeInstance");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "updatePosition");

  }
}

+ (BOOL)remoteCanDictateCurrentInputMode
{
  void *v2;
  uint64_t v3;
  int v4;
  uint64_t v6;

  +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentInputModeForDictation");
  v3 = objc_claimAutoreleasedReturnValue();
  v6 = 0;
  v4 = objc_msgSend(v2, "supportsInputMode:error:", v3, &v6);

  LODWORD(v3) = objc_msgSend(v2, "dictationEnabled");
  LODWORD(v3) = objc_msgSend(v2, "remoteHasMicrophone") & v3 & v4;

  return v3;
}

- (id)languageCodeForAssistantLanguageCode:(id)a3
{
  id v3;
  __CFString *v4;
  void *v5;
  void *v6;
  __CFString *v7;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("intl")) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", CFSTR("default")) & 1) == 0)
  {
    objc_msgSend(v3, "componentsSeparatedByString:", CFSTR("-"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count") == 1)
    {
      v4 = (__CFString *)v3;
LABEL_13:

      goto LABEL_14;
    }
    objc_msgSend(v5, "objectAtIndex:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndex:", 1);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("ko"))
      && -[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("KR")))
    {

      v7 = CFSTR("KO");
    }
    else if (!v7)
    {
      v4 = v6;
      goto LABEL_12;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@"), v6, v7);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_12:
    goto LABEL_13;
  }
  v4 = CFSTR("en_US");
LABEL_14:

  return v4;
}

- (float)audioLevel
{
  void *v2;
  float v3;
  float v4;

  -[UIDictationController dictationConnection](self, "dictationConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "averagePower");
  v4 = v3;

  return v4;
}

- (BOOL)shouldUseDictationSearchFieldBehavior
{
  void *v3;
  void *v4;
  char v5;
  BOOL v6;

  +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inputDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (+[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess"))
  {
    v5 = -[UIDictationController _shouldUseDictationSearchFieldBehavior](self, "_shouldUseDictationSearchFieldBehavior");
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v6 = 0;
      goto LABEL_7;
    }
    v5 = objc_msgSend(v4, "showDictationButton");
  }
  v6 = v5;
LABEL_7:

  return v6;
}

- (BOOL)shouldOverrideManualEndpointingWithReturnKeyType:(int64_t)a3
{
  _BOOL4 v4;

  v4 = -[UIDictationController currentViewModeSupportsDictationMics](self, "currentViewModeSupportsDictationMics", a3);
  if (v4)
    LOBYTE(v4) = -[UIDictationController shouldUseDictationSearchFieldBehavior](self, "shouldUseDictationSearchFieldBehavior");
  return v4;
}

- (NSNumber)dictationRequestOrigin
{
  _BOOL4 v2;

  v2 = -[UIDictationController shouldUseDictationSearchFieldBehavior](self, "shouldUseDictationSearchFieldBehavior");
  return (NSNumber *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v2);
}

- (id)fieldIdentifierInputDelegate:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  __CFString *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = a3;
  objc_msgSend(v3, "textInputView");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    v6 = &stru_1E16EDF20;
    while (1)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), objc_opt_class());
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFString stringByAppendingString:](v6, "stringByAppendingString:", v7);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "superview");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v9)
        break;
      v10 = v9;
      v11 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v9, "subviews");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("%ld, "), objc_msgSend(v12, "indexOfObject:", v5));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFString stringByAppendingString:](v8, "stringByAppendingString:", v13);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

      v5 = v10;
    }

  }
  else
  {
    v8 = &stru_1E16EDF20;
  }

  return v8;
}

- (id)prefixTextForInputDelegate:(id)a3 wordCount:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  uint64_t v16;
  __CFString *v17;
  void *v18;

  v5 = a3;
  objc_msgSend(v5, "selectedTextRange");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "start");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = v7;
    v9 = v8;
    v10 = v8;
    if (a4)
    {
      v11 = v8;
      while (1)
      {
        objc_msgSend(v5, "tokenizer");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "positionFromPosition:toBoundary:inDirection:", v11, 1, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v10)
          break;
        objc_msgSend(v5, "tokenizer");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isPosition:withinTextUnit:inDirection:", v10, 1, 0);

        if ((v14 & 1) == 0)
        {
          objc_msgSend(v5, "tokenizer");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "positionFromPosition:toBoundary:inDirection:", v10, 1, 1);
          v16 = objc_claimAutoreleasedReturnValue();

          v10 = (void *)v16;
          if (!v16)
            break;
        }

        v11 = v10;
        if (!--a4)
          goto LABEL_11;
      }
      v10 = v11;
    }
LABEL_11:
    objc_msgSend(v5, "textRangeFromPosition:toPosition:", v10, v9);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "textInRange:", v18);
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = &stru_1E16EDF20;
  }

  return v17;
}

- (id)postfixTextForInputDelegate:(id)a3 wordCount:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  uint64_t v16;
  __CFString *v17;
  void *v18;

  v5 = a3;
  objc_msgSend(v5, "selectedTextRange");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "end");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = v7;
    v9 = v8;
    v10 = v8;
    if (a4)
    {
      v11 = v8;
      while (1)
      {
        objc_msgSend(v5, "tokenizer");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "positionFromPosition:toBoundary:inDirection:", v11, 1, 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v10)
          break;
        objc_msgSend(v5, "tokenizer");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isPosition:withinTextUnit:inDirection:", v10, 1, 1);

        if ((v14 & 1) == 0)
        {
          objc_msgSend(v5, "tokenizer");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "positionFromPosition:toBoundary:inDirection:", v10, 1, 0);
          v16 = objc_claimAutoreleasedReturnValue();

          v10 = (void *)v16;
          if (!v16)
            break;
        }

        v11 = v10;
        if (!--a4)
          goto LABEL_11;
      }
      v10 = v11;
    }
LABEL_11:
    objc_msgSend(v5, "textRangeFromPosition:toPosition:", v9, v10);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "textInRange:", v18);
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = &stru_1E16EDF20;
  }

  return v17;
}

- (id)selectedTextForInputDelegate:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;

  v3 = a3;
  objc_msgSend(v3, "selectedTextRange");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "start");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "end");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = &stru_1E16EDF20;
  if (v5
    && v6
    && objc_msgSend(v3, "comparePosition:toPosition:", v5, v6)
    && objc_msgSend(v3, "comparePosition:toPosition:", v5, v7) == -1)
  {
    objc_msgSend(v3, "textInRange:", v4);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (BOOL)useAutomaticEndpointing
{
  void *v2;
  void *v3;
  char v4;

  +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textInputTraits");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v3, "acceptsDictationSearchResults") & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "useAutomaticEndpointing");

  return v4;
}

- (id)_finalDictationStartLanguageCodeWithKeyboardInputMode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  __CFString *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v4 = a3;
  objc_msgSend(v4, "dictationLanguage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    if (+[UIDictationUtilities _isUsingLargeFormatDictationUI](UIDictationUtilities, "_isUsingLargeFormatDictationUI"))
    {
      objc_msgSend(v4, "languageWithRegion");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }
  }
  TIInputModeGetLanguage();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  TIInputModeGetRegion();
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend((id)objc_opt_class(), "viewMode"))
  {
    -[UIDictationConnectionPreferences languageCode](self->_preferences, "languageCode");
    v8 = objc_claimAutoreleasedReturnValue();

    v7 = 0;
    v6 = (void *)v8;
  }
  if (-[UIDictationController smartLanguageSelectionOverridden](self, "smartLanguageSelectionOverridden"))
  {
    -[UIDictationController smartLanguageSelectionOverrideLanguage](self, "smartLanguageSelectionOverrideLanguage");
    v9 = objc_claimAutoreleasedReturnValue();
LABEL_16:
    v11 = (void *)v9;

    v6 = v11;
    goto LABEL_17;
  }
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLocale");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "languageCode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("ko"))
    && -[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("KO")))
  {

    v7 = CFSTR("KR");
LABEL_15:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), v6, v7);
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  if (v7)
    goto LABEL_15;
LABEL_17:

  return v6;
}

- (void)dictationConnection:(id)a3 updateOptions:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  NSString *prefixTextForStart;
  NSString *selectionTextForStart;
  NSString *postfixTextForStart;
  void *v27;
  uint8_t buf[4];
  const char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "inputDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "textInputTraits");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "version"))
  {
    objc_msgSend(v5, "setVersion:", 1);
    -[UIDictationController currentInputModeForDictation](self, "currentInputModeForDictation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dictationLanguage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      if (+[UIDictationUtilities _isUsingLargeFormatDictationUI](UIDictationUtilities, "_isUsingLargeFormatDictationUI"))
      {
        objc_msgSend(v9, "languageWithRegion");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = 0;
      }
    }
    v27 = v7;
    TIInputModeGetLanguage();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    TIInputModeGetRegion();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setUseAutomaticEndpointing:", -[UIDictationController useAutomaticEndpointing](self, "useAutomaticEndpointing"));
    objc_msgSend(v9, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    TIInputModeGetVariant();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLayoutIdentifier:", v14);

    objc_msgSend(v5, "setReturnKeyType:", objc_msgSend(v8, "returnKeyType"));
    if (objc_msgSend((id)objc_opt_class(), "viewMode"))
    {
      if (objc_msgSend((id)objc_opt_class(), "viewMode") == 6)
        objc_msgSend(v5, "setActivationType:", 2);
    }
    else
    {
      -[UIDictationConnectionPreferences languageCode](self->_preferences, "languageCode");
      v15 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "setActivationType:", 1);
      objc_msgSend(v5, "setUseAutomaticEndpointing:", 1);
      objc_msgSend(v5, "setReturnKeyType:", 6);
      v12 = 0;
      v11 = (void *)v15;
    }
    -[UIDictationController activationIdentifier](self, "activationIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setActivationIdentifier:", v16);

    objc_msgSend(v5, "setLanguageCode:", v11);
    objc_msgSend(v5, "setRegionCode:", v12);
    -[UIDictationController fieldIdentifierInputDelegate:](self, "fieldIdentifierInputDelegate:", v27);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFieldIdentifier:", v17);

    objc_msgSend(v5, "setKeyboardType:", objc_msgSend(v8, "dictationKeyboardType"));
    v18 = +[UIDictationUtilities _isUsingLargeFormatDictationUI](UIDictationUtilities, "_isUsingLargeFormatDictationUI");
    if (v18)
    {
      if (UIKeyboardTypeSupportsDictationSpelling(objc_msgSend(v5, "keyboardType"))
        || (objc_msgSend(v8, "isSecureTextEntry") & 1) != 0)
      {
        v19 = 1;
      }
      else
      {
        v19 = objc_msgSend(v8, "forceSpellingDictation");
      }
    }
    else
    {
      v19 = 0;
    }
    objc_msgSend(v5, "setSecureInput:", v19);
    objc_msgSend(v5, "setAcceptsDictationSearchResults:", objc_msgSend(v8, "acceptsDictationSearchResults"));
    objc_msgSend(v5, "setPrefixText:", self->_prefixTextForStart);
    objc_msgSend(v5, "setSelectedText:", self->_selectionTextForStart);
    objc_msgSend(v5, "setPostfixText:", self->_postfixTextForStart);
    if (-[UIDictationController shouldOverrideManualEndpointingWithReturnKeyType:](self, "shouldOverrideManualEndpointingWithReturnKeyType:", objc_msgSend(v5, "returnKeyType")))
    {
      objc_msgSend(v5, "setUseAutomaticEndpointing:", 1);
    }
    if (objc_msgSend(v5, "useAutomaticEndpointing"))
    {
      _UIDictationControllerLog();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v29 = "-[UIDictationController dictationConnection:updateOptions:]";
        _os_log_impl(&dword_185066000, v20, OS_LOG_TYPE_DEFAULT, "%s Starting dictation with automatic endpointing", buf, 0xCu);
      }

      objc_msgSend(v5, "setReturnKeyType:", 6);
    }
    -[AFAnalyticsTurnBasedInstrumentationContext turnIdentifier](self->_currentInstrumentationContext, "turnIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTurnIdentifier:", v21);

    if (((v18 | _os_feature_enabled_impl() ^ 1) & 1) == 0)
    {
      objc_msgSend(getAFPreferencesClass_0(), "sharedPreferences");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setAutoPunctuation:", objc_msgSend(v22, "dictationAutoPunctuationEnabled"));

    }
    if (objc_msgSend(v11, "isEqualToString:", CFSTR("en"))
      && objc_msgSend(v12, "isEqualToString:", CFSTR("US"))
      && objc_msgSend((id)objc_opt_class(), "supportsSiriDictationVoiceCommands")
      && (objc_msgSend((id)objc_opt_class(), "supportsSiriDictationVoiceCommandsUIRedesign") & 1) != 0)
    {
      +[UIKeyboard keyboardBundleIdentifier](UIKeyboard, "keyboardBundleIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setShouldRecognizeCommands:", +[UIDictationUtilities supportsDictationVoiceEditingUIForBundleIdentifier:](UIDictationUtilities, "supportsDictationVoiceEditingUIForBundleIdentifier:", v23));

    }
    else
    {
      objc_msgSend(v5, "setShouldRecognizeCommands:", 0);
    }
    prefixTextForStart = self->_prefixTextForStart;
    self->_prefixTextForStart = 0;

    selectionTextForStart = self->_selectionTextForStart;
    self->_selectionTextForStart = 0;

    postfixTextForStart = self->_postfixTextForStart;
    self->_postfixTextForStart = 0;

    v7 = v27;
  }

}

- (void)completeStartConnection
{
  void *v3;

  -[UIDictationController dictationConnection](self, "dictationConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "start");

  self->_reasonType = 0;
}

- (void)startConnectionWithContinuation:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  -[UIDictationController setupForDictationStart](self, "setupForDictationStart");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57__UIDictationController_startConnectionWithContinuation___block_invoke;
  v6[3] = &unk_1E16B1D18;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[UIDictationController _completeStartDictationWithContinuation:](self, "_completeStartDictationWithContinuation:", v6);

}

uint64_t __57__UIDictationController_startConnectionWithContinuation___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "completeStartConnection");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)startDictationForFileAtURL:(id)a3 forInputModeIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __75__UIDictationController_startDictationForFileAtURL_forInputModeIdentifier___block_invoke;
  v10[3] = &unk_1E16B47A8;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[UIDictationController _completeStartDictationWithContinuation:](self, "_completeStartDictationWithContinuation:", v10);

}

uint64_t __75__UIDictationController_startDictationForFileAtURL_forInputModeIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeStartConnectionForFileAtURL:forInputModeIdentifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)completeStartConnectionForFileAtURL:(id)a3 forInputModeIdentifier:(id)a4
{
  void *v6;
  id v7;
  id v8;
  id v9;

  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%s Starting dictation connection from saved file for language code: %@"), "-[UIDictationController completeStartConnectionForFileAtURL:forInputModeIdentifier:]", v7);

  -[UIDictationController setState:](self, "setState:", 1);
  -[UIDictationController dictationConnection](self, "dictationConnection");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "startForFileAtURL:forLanguage:", v8, v7);

}

- (void)_completeStartDictationWithContinuation:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Calling _refreshVisibleRTIDocumentStateWithContinuation"), "-[UIDictationController _completeStartDictationWithContinuation:]");

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __65__UIDictationController__completeStartDictationWithContinuation___block_invoke;
  v6[3] = &unk_1E16D45B8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[UIDictationController _refreshVisibleRTIDocumentStateWithContinuation:](self, "_refreshVisibleRTIDocumentStateWithContinuation:", v6);

}

uint64_t __65__UIDictationController__completeStartDictationWithContinuation___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t result;

  v7 = a4;
  v8 = a3;
  v9 = objc_msgSend(a2, "copy");
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(v10 + 136);
  *(_QWORD *)(v10 + 136) = v9;

  v12 = objc_msgSend(v8, "copy");
  v13 = *(_QWORD *)(a1 + 32);
  v14 = *(void **)(v13 + 152);
  *(_QWORD *)(v13 + 152) = v12;

  v15 = objc_msgSend(v7, "copy");
  v16 = *(_QWORD *)(a1 + 32);
  v17 = *(void **)(v16 + 144);
  *(_QWORD *)(v16 + 144) = v15;

  objc_msgSend(*(id *)(a1 + 32), "setIsProcessingPotentialVoiceCommand:", 0);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Dictation options. prefixText: %@, postfixText: %@, selectedText: %@"), "-[UIDictationController _completeStartDictationWithContinuation:]_block_invoke", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 152), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 144));

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_setupHypothesisAsFinalResults
{
  BOOL ignoreFinalizePhrases;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  if (+[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess"))
    ignoreFinalizePhrases = self->_ignoreFinalizePhrases;
  else
    ignoreFinalizePhrases = 0;
  -[UIDictationController targetHypothesis](self, "targetHypothesis");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (!ignoreFinalizePhrases && !self->_finalResultsOperation && v4)
  {
    objc_initWeak(&location, self);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __55__UIDictationController__setupHypothesisAsFinalResults__block_invoke;
    v6[3] = &unk_1E16B1500;
    objc_copyWeak(&v8, &location);
    v7 = v5;
    -[UIDictationController _setFinalResultHandler:](self, "_setFinalResultHandler:", v6);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }

}

void __55__UIDictationController__setupHypothesisAsFinalResults__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  UIDictationSerializableResults *v4;
  void *v5;
  void *v6;
  UIDictationSerializableResults *v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "lastHypothesis");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "updateLastHypothesis:WithNewHypothesis:", v3, &stru_1E16EDF20);

  v4 = [UIDictationSerializableResults alloc];
  v8 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[UIDictationSerializableResults initWithArrayOfArrayOfStrings:](v4, "initWithArrayOfArrayOfStrings:", v6);

  objc_msgSend(WeakRetained, "insertSerializedDictationResult:withCorrectionIdentifier:", v7, 0);
  objc_msgSend(WeakRetained, "setIgnoreFinalizePhrases:", 1);

}

- (void)_runFinalizeOperation
{
  -[UIDictationController _runFinalizeOperation:](self, "_runFinalizeOperation:", 0);
}

- (void)_runFinalizeOperation:(BOOL)a3
{
  id finalResultsOperation;

  if (self->_finalResultsOperation)
  {
    -[UIDictationController performIgnoringDocumentChanges:](self, "performIgnoringDocumentChanges:");
    finalResultsOperation = self->_finalResultsOperation;
    self->_finalResultsOperation = 0;

    if (!a3)
      -[UIDictationController _stopStreamingAnimation](self, "_stopStreamingAnimation");
    -[UIDictationController setPendingEdits:](self, "setPendingEdits:", 0);
    -[UIDictationController setLastHypothesis:](self, "setLastHypothesis:", 0);
    -[UIDictationController setTargetHypothesis:](self, "setTargetHypothesis:", 0);
  }
}

- (void)endSessionIfNecessaryForTransitionFromState:(int)a3 toState:(int)a4
{
  _BOOL4 v7;
  void *v8;
  id finalResultsOperation;

  v7 = a3 != 6 && a4 == 0;
  if (a4 == 6 || v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Calling endSession on the connection"), "-[UIDictationController endSessionIfNecessaryForTransitionFromState:toState:]");

    -[UIDictationController dictationConnection](self, "dictationConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "endSession");

    if (a4 == 6)
    {
      finalResultsOperation = self->_finalResultsOperation;
      self->_finalResultsOperation = 0;

    }
  }
}

- (void)switchToKeyboardInputModeIfNeeded
{
  void *v3;
  BOOL v4;
  id v5;

  +[UIDictationView sharedInstance](UIDictationView, "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "switchingLanguage") & 1) == 0
    && !-[UIDictationController shouldStayInDictationInputMode](self, "shouldStayInDictationInputMode"))
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "isDictationMenuPresented") & 1) == 0)
    {
      v4 = +[UIKeyboard isModelessActive](UIKeyboard, "isModelessActive");

      if (v4)
        return;
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      -[UIDictationController keyboardInputModeToReturn](self, "keyboardInputModeToReturn");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setKeyboardInputMode:userInitiated:", v3, 0);
    }

  }
}

+ (BOOL)shouldForwardInInputSystemUI
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  BOOL v9;
  void *v10;
  char v11;

  if (!+[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess"))
    return 0;
  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "keyboardWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    objc_msgSend(v4, "inputDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_window");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7 != v3;

  }
  else
  {
    v8 = 1;
  }
  objc_msgSend(v5, "inputDelegateManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "shouldRespectForwardingInputDelegate");

  v9 = v8 & (v11 ^ 1);
  return v9;
}

- (void)resignFirstResponderWhenIdleIfNeeded
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  if (-[UIDictationController shouldSuppressSoftwareKeyboard](self, "shouldSuppressSoftwareKeyboard"))
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isDictationLanguageMenuPresented");

    if ((v4 & 1) == 0)
    {
      +[UIDictationLandingView sharedInstance](UIDictationLandingView, "sharedInstance");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stopLanding");

      +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "textInputTraits");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "returnKeyType");

      if (v8 == 6)
      {
        +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "performReturn");

      }
      -[UIDictationController setResigningFirstResponder:](self, "setResigningFirstResponder:", 1);
      if (objc_msgSend((id)objc_opt_class(), "shouldForwardInInputSystemUI"))
      {
        +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "inputDelegateManager");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "inputSystemSourceSession");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v12)
        {
LABEL_12:

          goto LABEL_13;
        }
        objc_msgSend(v12, "textOperations");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setCustomInfoType:", 0x1E1750220);
        v17 = CFSTR("selector");
        NSStringFromSelector(sel_resignFirstResponderWhenIdleIfNeeded);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v18[0] = v14;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setCustomInfo:", v15);

        objc_msgSend(v12, "flushOperations");
      }
      else
      {
        if ((objc_msgSend((id)objc_opt_class(), "isInputDelegateSafariAddressBar") & 1) != 0)
        {
          -[UIDictationController setResigningFirstResponder:](self, "setResigningFirstResponder:", 0);
LABEL_13:
          -[UIDictationController setShouldSuppressSoftwareKeyboard:](self, "setShouldSuppressSoftwareKeyboard:", 0);
          +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setKeyboardMinimizedByDictation:", 0);

          return;
        }
        +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "inputDelegate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "resignFirstResponder");
      }

      goto LABEL_12;
    }
  }
}

- (void)setShadowState:(int)a3
{
  NSObject *v4;
  const __CFString *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  _UIDictationControllerLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if (a3 > 6)
      v5 = CFSTR("Unknown state");
    else
      v5 = off_1E16D51C0[a3];
    v7 = 136315394;
    v8 = "-[UIDictationController setShadowState:]";
    v9 = 2112;
    v10 = v5;
    _os_log_impl(&dword_185066000, v4, OS_LOG_TYPE_DEFAULT, "%s State \"%@\", (uint8_t *)&v7, 0x16u);
  }

  dword_1ECD79660 = a3;
  if (a3 == 3 || !a3)
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "clearDictationMenuTimer");

  }
}

- (void)setAppState:(int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  const char *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v3 = *(_QWORD *)&a3;
  v19 = *MEMORY[0x1E0C80C00];
  if (+[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess")
    && +[UIKeyboard isMajelEnabled](UIKeyboard, "isMajelEnabled")
    && !-[UIDictationController isIgnoringRTIChanges](self, "isIgnoringRTIChanges"))
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "inputDelegateManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "inputSystemSourceSession");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      _UIDictationControllerLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v7, "documentTraits");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "appId");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 136315394;
        v16 = "-[UIDictationController setAppState:]";
        v17 = 2112;
        v18 = v10;
        _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_DEFAULT, "%s Invoking setShadowState. appID \"%@\", (uint8_t *)&v15, 0x16u);

      }
      objc_msgSend(v7, "textOperations");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(sel_setShadowState_);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, CFSTR("selector"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, CFSTR("state"));

      objc_msgSend(v11, "setCustomInfoType:", 0x1E1750220);
      objc_msgSend(v11, "setCustomInfo:", v12);
      objc_msgSend(v7, "flushOperations");

    }
  }
}

- (void)setState:(int)a3
{
  uint64_t v3;
  const __CFString *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  BOOL *p_ignoreFinalizePhrases;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  uint8_t buf[4];
  const char *v30;
  const __CFString *v31;
  _QWORD v32[2];

  v3 = *(_QWORD *)&a3;
  v32[1] = *MEMORY[0x1E0C80C00];
  if (a3 != 6 || dword_1ECD79664)
  {
    if (a3 > 6)
      v5 = CFSTR("Unknown state");
    else
      v5 = off_1E16D51C0[a3];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s State: %@"), "-[UIDictationController setState:]", v5);

    v6 = dword_1ECD79664;
    dword_1ECD79664 = v3;
    -[UIDictationController setAppState:](self, "setAppState:", v3);
    +[UIDictationView sharedInstance](UIDictationView, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDisplayDelegate:", 0);

    +[UIDictationView sharedInstance](UIDictationView, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setState:", v3);

    -[UIDictationController endSessionIfNecessaryForTransitionFromState:toState:](self, "endSessionIfNecessaryForTransitionFromState:toState:", v6, v3);
    if (!-[UIDictationController isDetectingUtterances](self, "isDetectingUtterances"))
    {
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIDictationController setIdleTimerDisabled:forReason:](self, "setIdleTimerDisabled:forReason:", (_DWORD)v3 != 0, v10);

    }
    if ((_DWORD)v3)
    {
      if ((_DWORD)v3 == 6)
        -[UIDictationController switchToKeyboardInputModeIfNeeded](self, "switchToKeyboardInputModeIfNeeded");
    }
    else
    {
      -[UIDictationController _runFinalizeOperation](self, "_runFinalizeOperation");
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "clearDictationMenuTimer");

      v31 = CFSTR("reason");
      v32[0] = CFSTR("Dictation controller did switch state");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIDictationController postNotificationName:userInfo:](self, "postNotificationName:userInfo:", CFSTR("UIKeyboardDictationAvailabilityDidChangeNotification"), v12);

      -[UIDictationController releaseConnectionAfterDictationRequest](self, "releaseConnectionAfterDictationRequest");
      if (-[UIDictationController isRecievingResults](self, "isRecievingResults"))
      {
        +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "inputDelegate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v14, "interactionAssistant");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "configureForSelectionMode");

        }
      }
      if (!self->_streamingAnimationActive)
      {
        -[UIDictationController setTargetHypothesis:](self, "setTargetHypothesis:", 0);
        -[UIDictationController setLastHypothesis:](self, "setLastHypothesis:", 0);
        -[UIDictationController setPendingEdits:](self, "setPendingEdits:", 0);
      }
      +[UIDictationView sharedInstance](UIDictationView, "sharedInstance");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "switchingLanguage");

      if ((v17 & 1) == 0)
      {
        -[UIDictationController resignFirstResponderWhenIdleIfNeeded](self, "resignFirstResponderWhenIdleIfNeeded");
        +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "clearDictationMenuTimer");

      }
      -[UIDictationController switchToKeyboardInputModeIfNeeded](self, "switchToKeyboardInputModeIfNeeded");
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "userInteractionDelegate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20 && -[UIDictationTipController modelessTipShown](self->_dictationTipController, "modelessTipShown"))
      {
        +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setUserInteractionDelegate:", 0);

      }
    }
    if (objc_msgSend((id)objc_opt_class(), "viewMode") == 6)
    {
      if ((v3 - 3) >= 3)
      {
        if ((_DWORD)v3)
        {
          if ((_DWORD)v3 != 6)
          {
            p_ignoreFinalizePhrases = &self->_ignoreFinalizePhrases;
            goto LABEL_33;
          }
          -[UIDictationController _displaySecureContentsAsPlainText:afterDelay:](self, "_displaySecureContentsAsPlainText:afterDelay:", 0, 2.0);
        }
        -[UIDictationController restoreTextFieldPlaceholder](self, "restoreTextFieldPlaceholder");
      }
      else
      {
        -[UIDictationController clearTextFieldPlaceholder](self, "clearTextFieldPlaceholder");
      }
    }
    p_ignoreFinalizePhrases = &self->_ignoreFinalizePhrases;
    if ((_DWORD)v3 == 3 && !self->_ignoreFinalizePhrases)
    {
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "clearDictationMenuTimer");

      +[UIDictationLandingView sharedInstance](UIDictationLandingView, "sharedInstance");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "startLandingIfNecessary");
      goto LABEL_35;
    }
LABEL_33:
    +[UIDictationLandingView sharedInstance](UIDictationLandingView, "sharedInstance");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v25;
    if ((_DWORD)v3 != 6)
    {
      objc_msgSend(v25, "stopLanding");

      if ((_DWORD)v3 == 2)
      {
        *p_ignoreFinalizePhrases = 0;
        +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
        v26 = objc_claimAutoreleasedReturnValue();
        -[NSObject inputDelegateManager](v26, "inputDelegateManager");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "selectionDisplayInteraction");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "_setGlowViewMode:", 1);

LABEL_40:
        return;
      }
      if (v3 <= 2)
        return;
LABEL_36:
      self->_shouldResumeDictation = 0;
      _UIDictationControllerLog();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v30 = "-[UIDictationController setState:]";
        _os_log_impl(&dword_185066000, v26, OS_LOG_TYPE_DEFAULT, "%s Set _shouldResumeDictation to NO", buf, 0xCu);
      }
      goto LABEL_40;
    }
    objc_msgSend(v25, "stopLandingForError");
LABEL_35:

    goto LABEL_36;
  }
}

- (void)errorAnimationDidFinish
{
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[UIDictationController errorAnimationDidFinish]");

  if (-[UIDictationController state](self, "state") == 6)
    -[UIDictationController setState:](self, "setState:", 0);
}

- (void)dealloc
{
  void *v3;
  int dictationInputModeNotifierToken;
  objc_super v5;

  -[UIDictationController stopHelperMessageDisplayIfNeeded](self, "stopHelperMessageDisplayIfNeeded");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", objc_opt_class());

  -[_UIDictationPrivacySheetController setPrivacyDelegate:](self->_dictationPrivacySheetController, "setPrivacyDelegate:", 0);
  -[UIDictationController removeStartDictationKeyboardGestures](self, "removeStartDictationKeyboardGestures");
  if (self->_stateHandler)
    os_state_remove_handler();
  dictationInputModeNotifierToken = self->_dictationInputModeNotifierToken;
  if (dictationInputModeNotifierToken != -1)
    notify_cancel(dictationInputModeNotifierToken);
  v5.receiver = self;
  v5.super_class = (Class)UIDictationController;
  -[UIDictationController dealloc](&v5, sel_dealloc);
}

- (void)cancelRecordingLimitTimer
{
  NSTimer *recordingLimitTimer;
  NSTimer *v4;

  recordingLimitTimer = self->_recordingLimitTimer;
  if (recordingLimitTimer)
  {
    -[NSTimer invalidate](recordingLimitTimer, "invalidate");
    v4 = self->_recordingLimitTimer;
    self->_recordingLimitTimer = 0;

  }
  -[UIDictationController stopIdleTimerResetTimer](self, "stopIdleTimerResetTimer");
}

- (void)stopDictationByTimer
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setReasonType:", 19);

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dismissDictationTip");

  -[UIDictationController stopDictation](self, "stopDictation");
  LODWORD(v4) = +[UIKeyboard isModelessActive](UIKeyboard, "isModelessActive");
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if ((_DWORD)v4)
  {
    objc_msgSend(v6, "clearDictationMenuTimer");
  }
  else
  {
    -[UIDictationController keyboardInputModeToReturn](self, "keyboardInputModeToReturn");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setKeyboardInputMode:userInitiated:", v5, 0);

  }
}

- (void)startRecordingLimitTimer
{
  void *v3;
  float v4;
  NSTimer *v5;
  NSTimer *recordingLimitTimer;
  NSTimer *v7;
  NSTimer *idleTimerResetTimer;

  -[UIDictationController cancelRecordingLimitTimer](self, "cancelRecordingLimitTimer");
  v3 = (void *)MEMORY[0x1E0C99E88];
  -[UIDictationController maxRecordingLength](self, "maxRecordingLength");
  objc_msgSend(v3, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_stopDictationByTimer, 0, 0, v4);
  v5 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  recordingLimitTimer = self->_recordingLimitTimer;
  self->_recordingLimitTimer = v5;

  if (-[UIDictationController isDetectingUtterances](self, "isDetectingUtterances"))
  {
    -[UIDictationController resetIdleTimer](self, "resetIdleTimer");
    -[UIDictationController stopIdleTimerResetTimer](self, "stopIdleTimerResetTimer");
    objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_resetIdleTimer, 0, 0, 20.0);
    v7 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    idleTimerResetTimer = self->_idleTimerResetTimer;
    self->_idleTimerResetTimer = v7;

  }
}

- (void)updateRecordingLimitTimerIfNeeded
{
  if (-[UIDictationController isDetectingUtterances](self, "isDetectingUtterances"))
    -[UIDictationController startRecordingLimitTimer](self, "startRecordingLimitTimer");
}

- (void)setIdleTimerDisabled:(BOOL)a3 forReason:(id)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  __CFString *v14;

  v4 = a3;
  v14 = (__CFString *)a4;
  if (+[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess"))
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "inputDelegateManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "inputSystemSourceSession");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v8, "textOperations");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, CFSTR("selector"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, CFSTR("disabled"));

      if (v14)
        v13 = v14;
      else
        v13 = &stru_1E16EDF20;
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v13, CFSTR("reason"));
      objc_msgSend(v9, "setCustomInfoType:", 0x1E1750220);
      objc_msgSend(v9, "setCustomInfo:", v10);
      objc_msgSend(v8, "flushOperations");

    }
  }
  else
  {
    objc_msgSend((id)UIApp, "_setIdleTimerDisabled:forReason:", v4, v14);
  }

}

- (void)resetIdleTimer
{
  objc_class *v3;
  void *v4;
  objc_class *v5;
  id v6;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIDictationController setIdleTimerDisabled:forReason:](self, "setIdleTimerDisabled:forReason:", 1, v4);

  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[UIDictationController setIdleTimerDisabled:forReason:](self, "setIdleTimerDisabled:forReason:", 0, v6);

}

- (void)stopIdleTimerResetTimer
{
  NSTimer *idleTimerResetTimer;
  NSTimer *v4;

  idleTimerResetTimer = self->_idleTimerResetTimer;
  if (idleTimerResetTimer)
  {
    -[NSTimer invalidate](idleTimerResetTimer, "invalidate");
    v4 = self->_idleTimerResetTimer;
    self->_idleTimerResetTimer = 0;

  }
}

- (id)connectionForStatisticsLogging
{
  if (self->_dictationConnection)
    self->_connectionWasAlreadyAliveForStatisticsLogging = 1;
  return -[UIDictationController dictationConnection](self, "dictationConnection");
}

- (BOOL)dataSharingDecided
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v2 = (void *)qword_1ECD79678;
  if (!qword_1ECD79678)
  {
    v3 = objc_alloc(MEMORY[0x1E0CB37E8]);
    objc_msgSend(getAFPreferencesClass_0(), "sharedPreferences");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "initWithBool:", objc_msgSend(v4, "siriDataSharingOptInStatus") != 0);
    v6 = (void *)qword_1ECD79678;
    qword_1ECD79678 = v5;

    v2 = (void *)qword_1ECD79678;
  }
  return objc_msgSend(v2, "BOOLValue");
}

- (void)dismissDictationView:(id)a3
{
  -[UIDictationController setState:](self, "setState:", 0);
}

- (void)setupForStreamingDictationStart
{
  void *v3;
  void *v4;
  id v5;

  -[UIDictationController setPreviousHypothesis:](self, "setPreviousHypothesis:", 0);
  -[UIDictationController setInsertionRange:](self, "setInsertionRange:", 0x7FFFFFFFFFFFFFFFLL, 0);
  -[UIDictationController setDiscardNextHypothesis:](self, "setDiscardNextHypothesis:", 0);
  -[UIDictationController streamingOperations](self, "streamingOperations");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inputDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dictationWillBeginInDocument:", v4);

}

- (void)setupForAsyncDelegate
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  if (+[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess"))
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "remoteTextInputPartner");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "forwardKeyboardOperation:object:", sel_setupForAsyncDelegate, 0);

  }
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "inputDelegate");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "_usesAsynchronousProtocol") && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v6 = v11;
    objc_msgSend(v6, "selectedTextRange");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "start");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIDictationController setSelectionStartWasInitiallyAtParagraphBoundaryForAsyncDelegate:](self, "setSelectionStartWasInitiallyAtParagraphBoundaryForAsyncDelegate:", objc_msgSend(v6, "isPosition:atBoundary:inDirection:", v8, 3, 1));

    objc_msgSend(v6, "selectedTextRange");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "end");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIDictationController setSelectionEndWasInitiallyAtParagraphBoundaryForAsyncDelegate:](self, "setSelectionEndWasInitiallyAtParagraphBoundaryForAsyncDelegate:", objc_msgSend(v6, "isPosition:atBoundary:inDirection:", v10, 3, 0));

    -[UIDictationController setInitialPreviousCharacterForAsyncDelegate:](self, "setInitialPreviousCharacterForAsyncDelegate:", (unsigned __int16)objc_msgSend(v6, "_characterInRelationToCaretSelection:", 0xFFFFFFFFLL));
    LOWORD(v9) = objc_msgSend(v6, "_characterInRelationToCaretSelection:", 0);

    -[UIDictationController setInitialCharacterAfterSelectionForAsyncDelegate:](self, "setInitialCharacterAfterSelectionForAsyncDelegate:", (unsigned __int16)v9);
  }

}

- (void)setupForDictationStart
{
  id v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[UIDictationController setupForDictationStart]");

  self->cancelledByWaitingForLocalResults = -[UIDictationController state](self, "state") == 4;
  if (-[UIDictationController state](self, "state"))
    -[UIDictationController cancelDictation](self, "cancelDictation");
  if (+[UIDictationController viewMode](UIDictationController, "viewMode")
    && +[UIDictationController viewMode](UIDictationController, "viewMode") != 6)
  {
    -[UIDictationController currentInputModeForDictation](self, "currentInputModeForDictation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictationLanguage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    v6 = -[UIDictationController supportsDictationLanguage:error:](self, "supportsDictationLanguage:error:", v5, &v12);
    v3 = v12;

    if (!v6)
      goto LABEL_10;
  }
  else
  {
    v3 = 0;
  }
  -[UIDictationController setLastRecognitionText:](self, "setLastRecognitionText:", 0);
  -[UIDictationController setLastCorrectionIdentifier:](self, "setLastCorrectionIdentifier:", 0);
  -[UIDictationController setState:](self, "setState:", 1);
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "forceShiftUpdate");
  byte_1ECD79659 = objc_msgSend(v7, "isShifted");
  self->_hasCheckedForLeadingSpaceOnce = 0;
  -[UIDictationController currentInputModeForDictation](self, "currentInputModeForDictation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dictationLanguage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend((id)objc_opt_class(), "viewMode"))
  {
    -[UIDictationConnectionPreferences languageCode](self->_preferences, "languageCode");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIDictationController languageCodeForAssistantLanguageCode:](self, "languageCodeForAssistantLanguageCode:", v10);
    v11 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v11;
  }
  -[UIDictationController setLanguage:](self, "setLanguage:", v9);
  -[UIDictationController startRecordingLimitTimer](self, "startRecordingLimitTimer");
  self->_recievingResults = 0;
  -[UIDictationController setupForStreamingDictationStart](self, "setupForStreamingDictationStart");
  -[UIDictationController setupForAsyncDelegate](self, "setupForAsyncDelegate");
  self->_ignoreUserInteraction = 1;

LABEL_10:
}

+ (BOOL)_applicationIsActive
{
  return _MergedGlobals_35_1;
}

- (void)_startDictationWithContinuation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSString *v9;
  NSString *selectedTextAtStart;
  void *v11;
  NSUInteger v12;
  NSUInteger v13;
  NSObject *v14;
  int v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "keyboardState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "documentState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "selectedText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (NSString *)objc_msgSend(v8, "copy");
  selectedTextAtStart = self->_selectedTextAtStart;
  self->_selectedTextAtStart = v9;

  objc_msgSend(v7, "contextBeforeInput");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "length");
  v13 = -[NSString length](self->_selectedTextAtStart, "length");
  self->_relativeRangeBefore.location = v12;
  self->_relativeRangeBefore.length = v13;

  if ((objc_msgSend((id)objc_opt_class(), "_applicationIsActive") & 1) != 0)
  {
    -[UIDictationController startConnectionWithContinuation:](self, "startConnectionWithContinuation:", v4);
  }
  else
  {
    _UIDictationControllerLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 136315138;
      v16 = "-[UIDictationController _startDictationWithContinuation:]";
      _os_log_impl(&dword_185066000, v14, OS_LOG_TYPE_DEFAULT, "%s Early return due to inactive application state", (uint8_t *)&v15, 0xCu);
    }

  }
}

+ (id)slsDictationLanguages
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(getAFPreferencesClass_0(), "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictationSLSLanguagesEnabled");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "keysOfEntriesPassingTest:", &__block_literal_global_597);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v11), "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR("-"), (_QWORD)v15);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v12);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v9);
    }

    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

uint64_t __46__UIDictationController_slsDictationLanguages__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "BOOLValue");
}

- (BOOL)isFallingBackToMonolingualDictation
{
  BOOL result;
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  int v7;
  void *v8;

  if (-[UIDictationController smartLanguageSelectionOverridden](self, "smartLanguageSelectionOverridden"))
    return 1;
  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "enabledDictationLanguages");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5 < 2)
    return 0;
  +[UIDictationConnectionPreferences sharedInstance](UIDictationConnectionPreferences, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isSmartLanguageSelectionEnabled");

  objc_msgSend((id)objc_opt_class(), "activeSLSDictationLanguages");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  result = 1;
  if (v8)
  {
    if (v7)
      return 0;
  }
  return result;
}

+ (BOOL)_isLowStorageForOnDeviceDictationAsset
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  BOOL v7;
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  objc_msgSend(v2, "attributesOfFileSystemForPath:error:", CFSTR("/private/var/MobileAsset/AssetsV2"), &v9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v9;

  if (!v3)
  {
    _UIDictationControllerLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v11 = "+[UIDictationController _isLowStorageForOnDeviceDictationAsset]";
      v12 = 2112;
      v13 = v4;
      _os_log_error_impl(&dword_185066000, v6, OS_LOG_TYPE_ERROR, "%s Error getting free disk space: %@", buf, 0x16u);
    }
    goto LABEL_6;
  }
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0CB2B00]);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
LABEL_6:
    v7 = 0;
    goto LABEL_7;
  }
  v7 = (unint64_t)-[NSObject unsignedLongLongValue](v5, "unsignedLongLongValue") >> 22 < 0x7D;
LABEL_7:

  return v7;
}

- (void)showLowStorageUserAlertWithLanguage:(id)a3
{
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD v38[4];
  id v39;
  _QWORD aBlock[5];
  _QWORD v41[2];
  _QWORD v42[3];

  v42[2] = *MEMORY[0x1E0C80C00];
  v5 = (__CFString *)a3;
  if (+[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess"))
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "inputDelegateManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "inputSystemSourceSession");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v8, "textOperations");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setCustomInfoType:", 0x1E1750220);
      v41[0] = CFSTR("selector");
      NSStringFromSelector(a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v41[1] = CFSTR("language");
      v42[0] = v10;
      v11 = &stru_1E16EDF20;
      if (v5)
        v11 = v5;
      v42[1] = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, v41, 2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setCustomInfo:", v12);

      objc_msgSend(v8, "flushOperations");
    }

  }
  else
  {
    -[UIDictationController _createDictationPresenterWindowIfNecessary](self, "_createDictationPresenterWindowIfNecessary");
    -[UIDictationController dictationPresenterWindow](self, "dictationPresenterWindow");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "makeKeyAndVisible");

    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __61__UIDictationController_showLowStorageUserAlertWithLanguage___block_invoke;
    aBlock[3] = &unk_1E16B3EC8;
    aBlock[4] = self;
    v14 = _Block_copy(aBlock);
    _UIKitBundle();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("Low Storage User Alert Body"), CFSTR("On-device Dictation is temporarily unavailable. You can still use Dictation, but 500 MB of space is needed to run all features."), CFSTR("Localizable"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "enabledDictationLanguages");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "count");

    if (v19 >= 2)
    {
      if (-[__CFString length](v5, "length"))
      {
        objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "displayNameForKey:value:", *MEMORY[0x1E0C997E8], v5);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21 && (objc_msgSend(v21, "isEqualToString:", v5) & 1) == 0)
        {
          v22 = (void *)MEMORY[0x1E0CB3940];
          _UIKitBundle();
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("Low Storage User Alert Body"), CFSTR("On-device Dictation is temporarily unavailable for %@. You can still use Dictation, but 500 MB of space is needed to run all features."), CFSTR("Localizable"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "stringWithFormat:", v24, v21);
          v25 = objc_claimAutoreleasedReturnValue();

          v16 = (void *)v25;
        }
      }
      else
      {
        v21 = 0;
      }

    }
    _UIKitBundle();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("Low Storage User Alert Title"), CFSTR("Low Storage"), CFSTR("Localizable"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v27, v16, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    _UIKitBundle();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("Low Storage User Alert Manage Storage"), CFSTR("Manage Storage"), CFSTR("Localizable"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __61__UIDictationController_showLowStorageUserAlertWithLanguage___block_invoke_2;
    v38[3] = &unk_1E16D5098;
    v31 = v14;
    v39 = v31;
    +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v30, 0, v38);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v28, "addAction:", v32);
    _UIKitBundle();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("Low Storage User Alert OK"), CFSTR("OK"), CFSTR("Localizable"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v34, 1, v31);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addAction:", v35);

    objc_msgSend(v28, "setPreferredAction:", v32);
    if (v28)
    {
      -[UIDictationController dictationPresenterWindow](self, "dictationPresenterWindow");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "rootViewController");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "presentViewController:animated:completion:", v28, 1, 0);

    }
  }

}

uint64_t __61__UIDictationController_showLowStorageUserAlertWithLanguage___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "dictationPresenterWindow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resignKeyWindow");

  objc_msgSend(*(id *)(a1 + 32), "dictationPresenterWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 1);

  return objc_msgSend(*(id *)(a1 + 32), "setDictationPresenterWindow:", 0);
}

void __61__UIDictationController_showLowStorageUserAlertWithLanguage___block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=General&path=STORAGE_MGMT"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "openSensitiveURL:withOptions:error:", v1, 0, 0);

}

- (void)startDictation
{
  -[UIDictationController startDictationWithContinuation:](self, "startDictationWithContinuation:", 0);
}

- (void)startDictationWithContinuation:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  _BOOL4 v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  unint64_t v55;
  NSObject *v56;
  void *v57;
  void *v58;
  void *v59;
  _BOOL4 v60;
  const __CFString *v61;
  NSObject *v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  void *v71;
  const __CFString *v72;
  void *v73;
  uint64_t v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  objc_class *v80;
  id v81;
  uint64_t v82;
  id v83;
  void *v84;
  objc_class *v85;
  id v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  NSObject *v97;
  void *v98;
  void *v99;
  id v100;
  uint64_t v101;
  uint64_t *v102;
  uint64_t v103;
  uint64_t v104;
  _QWORD v105[7];
  _QWORD v106[7];
  _BYTE buf[24];
  void *v108;
  _BYTE v109[10];
  __int16 v110;
  const __CFString *v111;
  uint64_t v112;

  v112 = *MEMORY[0x1E0C80C00];
  v100 = a3;
  if (objc_msgSend((id)objc_opt_class(), "shouldForwardEventsToInputSystemUI"))
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "forwardDictationEvent_startDictation");

    goto LABEL_64;
  }
  if (objc_msgSend((id)objc_opt_class(), "shouldForwardInInputSystemUI"))
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "inputDelegateManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "inputSystemSourceSession");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v6, "textInputView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "selectedTextRange");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "start");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "caretRectForPosition:", v10);
      objc_msgSend(v8, "convertRect:toView:", 0);
      v12 = v11;

      if (v12 > 2.0)
      {
        objc_msgSend(v7, "textOperations");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(sel_updateCaretRectInWindowIfNeeded);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, CFSTR("selector"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v12);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v16, CFSTR("caretRectInWindow.y"));

        objc_msgSend(v13, "setCustomInfoType:", 0x1E1750220);
        objc_msgSend(v13, "setCustomInfo:", v14);
        objc_msgSend(v7, "flushOperations");

      }
    }

  }
  -[UIDictationController resetAdaptiveDeleteActivationLogic](self, "resetAdaptiveDeleteActivationLogic");
  +[UIDictationConnectionPreferences sharedInstance](UIDictationConnectionPreferences, "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "dictationIsEnabled");

  if ((v18 & 1) != 0)
  {
    -[UIDictationController setCurrentLanguageVerbFirstCommandLanguageStatusCached:](self, "setCurrentLanguageVerbFirstCommandLanguageStatusCached:", 0);
    -[UIDictationController setHasSelectedTextRange:](self, "setHasSelectedTextRange:", 0);
    -[UIDictationController setVisibleRTIDocumentStateAtStart:](self, "setVisibleRTIDocumentStateAtStart:", 0);
    -[UIDictationController setVisibleRTIDocumentStateAtCommandRecognition:](self, "setVisibleRTIDocumentStateAtCommandRecognition:", 0);
    -[UIDictationController setVisibleContextBeforeInputAtCommandExecution:](self, "setVisibleContextBeforeInputAtCommandExecution:", 0);
    -[UIDictationController setCandidateDictationSerializableResults:](self, "setCandidateDictationSerializableResults:", 0);
    -[UIDictationController setDetectingUtterances:](self, "setDetectingUtterances:", 0);
    -[UIDictationController setShouldResumeDictation:](self, "setShouldResumeDictation:", 0);
    _UIDictationControllerLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "-[UIDictationController startDictationWithContinuation:]";
      _os_log_impl(&dword_185066000, v19, OS_LOG_TYPE_DEFAULT, "%s Set shouldResumeDictation to NO", buf, 0xCu);
    }

    -[UIDictationController setSkipAutomaticResumeDictation:](self, "setSkipAutomaticResumeDictation:", 0);
    -[UIDictationController setHasInsertedAtLeastOneSerializedDictationResult:](self, "setHasInsertedAtLeastOneSerializedDictationResult:", 0);
    -[UIDictationController setHaveReceivedFirstPartialResultForCurrentUtterance:](self, "setHaveReceivedFirstPartialResultForCurrentUtterance:", 0);
    _UIDictationControllerUndoRedoLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "-[UIDictationController startDictationWithContinuation:]";
      _os_log_impl(&dword_185066000, v20, OS_LOG_TYPE_DEFAULT, "%s Set haveReceivedFirstPartialResultForCurrentUtterance to NO", buf, 0xCu);
    }

    -[UIDictationController setHaveLeakedPartialResultForCommandUtterance:](self, "setHaveLeakedPartialResultForCommandUtterance:", 0);
    _UIDictationControllerUndoRedoLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "-[UIDictationController startDictationWithContinuation:]";
      _os_log_impl(&dword_185066000, v21, OS_LOG_TYPE_DEFAULT, "%s Setting haveLeakedPartialResultForCommandUtterance to NO", buf, 0xCu);
    }

    -[UIDictationController setSendButtonPressedDuringDictation:](self, "setSendButtonPressedDuringDictation:", 0);
    -[UIDictationController setShouldStayInDictationInputMode:](self, "setShouldStayInDictationInputMode:", 0);
    -[UIDictationController setLogAppEnterBackground:](self, "setLogAppEnterBackground:", 1);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "UUIDString");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIDictationController setInteractionIdentifier:](self, "setInteractionIdentifier:", v23);

    -[UIDictationController setModelessUsedAtLeastOnce:](self, "setModelessUsedAtLeastOnce:", 0);
    -[UIDictationController setLocalSpeechRecognitionForced:](self, "setLocalSpeechRecognitionForced:", 0);
    -[UIDictationController setSecureOfflineOnlySpeechRecognition:](self, "setSecureOfflineOnlySpeechRecognition:", 0);
    if (self->_enablementInstrumentationContext)
    {
      -[UIDictationController setCurrentInstrumentationContext:](self, "setCurrentInstrumentationContext:");
    }
    else
    {
      objc_msgSend(getAFAnalyticsClass(), "sharedAnalytics");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (void *)objc_msgSend(v25, "newTurnBasedInstrumentationContext");
      -[UIDictationController setCurrentInstrumentationContext:](self, "setCurrentInstrumentationContext:", v26);

    }
    -[UIDictationController setModelInfo:](self, "setModelInfo:", 0);
    -[UIDictationController setDetectedLanguage:](self, "setDetectedLanguage:", 0);
    -[UIDictationController setFallbackDictationLanguage:](self, "setFallbackDictationLanguage:", 0);
    -[UIDictationController setInitialDictationLanguage:](self, "setInitialDictationLanguage:", 0);
    +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "currentInputMode");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "primaryLanguage");
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = (void *)v29;
    if (v29)
      v31 = (const __CFString *)v29;
    else
      v31 = &stru_1E16EDF20;
    -[UIDictationController setCurrentKeyboardPrimaryLanguage:](self, "setCurrentKeyboardPrimaryLanguage:", v31);

    +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "currentInputMode");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "dictationLanguage");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIDictationController setInitialDictationLanguage:](self, "setInitialDictationLanguage:", v34);

    -[UIDictationController setDictationSourceType:](self, "setDictationSourceType:", 0);
    objc_msgSend((id)objc_opt_class(), "slsDictationLanguages");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIDictationController setDictationLanguages:](self, "setDictationLanguages:", v35);

    -[UIDictationController currentInputModeForDictation](self, "currentInputModeForDictation");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "dictationLanguage");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "_sessionIdentifier");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "UUIDString");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIDictationController preheatEuclidModelWithLanguageCode:clientID:](self, "preheatEuclidModelWithLanguageCode:clientID:", v37, v40);

    -[UIDictationController smartLanguageSelectionOverrideLanguage](self, "smartLanguageSelectionOverrideLanguage");
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    if (v41)
    {
      -[UIDictationController smartLanguageSelectionOverrideLanguage](self, "smartLanguageSelectionOverrideLanguage");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIDictationController setDictationSourceType:](self, "setDictationSourceType:", 3);
    }
    else
    {
      -[UIDictationController initialDictationLanguage](self, "initialDictationLanguage");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v99, "length"))
      {
        +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "keyboardLanguageForDictationLanguage:", v99);
        v43 = (void *)objc_claimAutoreleasedReturnValue();

        +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "currentInputMode");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "languageWithRegion");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v43, "isEqualToString:", v46))
          v47 = 1;
        else
          v47 = 2;
        -[UIDictationController setDictationSourceType:](self, "setDictationSourceType:", v47);

      }
    }
    if (!v99)
    {
      if (!os_variant_has_internal_diagnostics())
      {
        v55 = qword_1ECD79688;
        if (!qword_1ECD79688)
        {
          v55 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v55, (unint64_t *)&qword_1ECD79688);
        }
        v56 = *(NSObject **)(v55 + 8);
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_185066000, v56, OS_LOG_TYPE_ERROR, "dictationLanguage must not be nil or it's a programming error.", buf, 2u);
        }
        goto LABEL_63;
      }
      goto LABEL_71;
    }
    objc_msgSend((id)objc_opt_class(), "UIDictationLanguageSourceType:", -[UIDictationController dictationSourceType](self, "dictationSourceType"));
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "userInteractionDelegate");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v49 == 0;

    if (v50)
    {
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "setUserInteractionDelegate:", self);

    }
    +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "inputDelegateManager");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "asyncInputDelegate");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    if (v54)
    {

    }
    else
    {
      +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "inputDelegateManager");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "webInputDelegate");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = v59 == 0;

      if (v60)
      {
        +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v90, "inputDelegateManager");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v91, "asyncWebKitInteractionDelegate");
        v92 = (void *)objc_claimAutoreleasedReturnValue();

        if (v92)
        {
          v61 = CFSTR("async");
        }
        else
        {
          +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v93, "inputDelegate");
          v94 = (void *)objc_claimAutoreleasedReturnValue();

          if (v94)
            v61 = CFSTR("default");
          else
            v61 = CFSTR("no delegate");
        }
        goto LABEL_43;
      }
    }
    v61 = CFSTR("async interaction");
LABEL_43:
    _UIDictationControllerLog();
    v62 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
    {
      -[UIDictationController currentKeyboardPrimaryLanguage](self, "currentKeyboardPrimaryLanguage");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)&buf[4] = "-[UIDictationController startDictationWithContinuation:]";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v99;
      *(_WORD *)&buf[22] = 2112;
      v108 = v98;
      *(_WORD *)v109 = 2112;
      *(_QWORD *)&v109[2] = v63;
      v110 = 2112;
      v111 = v61;
      _os_log_impl(&dword_185066000, v62, OS_LOG_TYPE_DEFAULT, "%s Dictation Language %@ Source: %@ Keyboard Language %@, InputDelegateType: %@", buf, 0x34u);

    }
    objc_msgSend(getAFAnalyticsClass(), "sharedAnalytics");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v105[0] = CFSTR("startDictation");
    objc_msgSend((id)objc_opt_class(), "UIDictationStartStopReasonTypeDescription:", -[UIDictationController reasonType](self, "reasonType"));
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v106[0] = v65;
    v106[1] = v99;
    v105[1] = CFSTR("dictationLanguage");
    v105[2] = CFSTR("dictationLanguageSource");
    v106[2] = v98;
    v105[3] = CFSTR("dictationLanguages");
    -[UIDictationController dictationLanguages](self, "dictationLanguages");
    v66 = objc_claimAutoreleasedReturnValue();
    v67 = (void *)v66;
    v68 = MEMORY[0x1E0C9AA60];
    if (v66)
      v68 = v66;
    v106[3] = v68;
    v105[4] = CFSTR("keyboardLocaleIdentifier");
    -[UIDictationController currentKeyboardPrimaryLanguage](self, "currentKeyboardPrimaryLanguage");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v106[4] = v69;
    v105[5] = CFSTR("dictationUIInteractionIdentifier");
    -[UIDictationController interactionIdentifier](self, "interactionIdentifier");
    v70 = objc_claimAutoreleasedReturnValue();
    v71 = (void *)v70;
    if (v70)
      v72 = (const __CFString *)v70;
    else
      v72 = &stru_1E16EDF20;
    v106[5] = v72;
    v105[6] = CFSTR("dictationOptInStatus");
    objc_msgSend(getAFPreferencesClass_0(), "sharedPreferences");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = objc_msgSend(v73, "siriDataSharingOptInStatus");
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v75 = off_1ECD797A0;
    v108 = off_1ECD797A0;
    if (!off_1ECD797A0)
    {
      v76 = AssistantServicesLibrary_1();
      v75 = dlsym(v76, "AFSiriDataSharingOptInStatusGetName");
      *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v75;
      off_1ECD797A0 = v75;
    }
    _Block_object_dispose(buf, 8);
    if (v75)
    {
      ((void (*)(uint64_t))v75)(v74);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v106[6] = v77;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v106, v105, 7);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "logEventWithType:context:", 1404, v78);

      v101 = 0;
      v102 = &v101;
      v103 = 0x2050000000;
      v79 = (void *)qword_1ECD797A8;
      v104 = qword_1ECD797A8;
      if (!qword_1ECD797A8)
      {
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __getSISchemaInvocationClass_block_invoke;
        v108 = &unk_1E16B14C0;
        *(_QWORD *)v109 = &v101;
        __getSISchemaInvocationClass_block_invoke((uint64_t)buf);
        v79 = (void *)v102[3];
      }
      v80 = objc_retainAutorelease(v79);
      _Block_object_dispose(&v101, 8);
      v81 = objc_alloc_init(v80);
      if (+[UIDictationController viewMode](UIDictationController, "viewMode") == 6)
        v82 = 42;
      else
        v82 = objc_msgSend((id)objc_opt_class(), "UIDictationStartStopReasonToInstrumentationInvocationSourceType:", self->_reasonType);
      objc_msgSend(v81, "setInvocationSource:", v82);
      -[AFAnalyticsTurnBasedInstrumentationContext emitInstrumentation:](self->_currentInstrumentationContext, "emitInstrumentation:", v81);
      -[UIDictationController instrumentationDictationContextEmitInstrumentation](self, "instrumentationDictationContextEmitInstrumentation");
      v83 = objc_alloc_init((Class)getSISchemaUEILaunchContextClass());
      v101 = 0;
      v102 = &v101;
      v103 = 0x2050000000;
      v84 = (void *)qword_1ECD797B0;
      v104 = qword_1ECD797B0;
      if (!qword_1ECD797B0)
      {
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __getSISchemaUEILaunchStartedClass_block_invoke;
        v108 = &unk_1E16B14C0;
        *(_QWORD *)v109 = &v101;
        __getSISchemaUEILaunchStartedClass_block_invoke((uint64_t)buf);
        v84 = (void *)v102[3];
      }
      v85 = objc_retainAutorelease(v84);
      _Block_object_dispose(&v101, 8);
      v86 = objc_alloc_init(v85);
      objc_msgSend(v83, "setStartedOrChanged:", v86);

      objc_msgSend(v83, "startedOrChanged");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "setExists:", 1);

      -[AFAnalyticsTurnBasedInstrumentationContext emitInstrumentation:](self->_currentInstrumentationContext, "emitInstrumentation:", v83);
      if (+[UIDictationController viewMode](UIDictationController, "viewMode") == 6)
        -[UIDictationController _displaySecureContentsAsPlainText:afterDelay:](self, "_displaySecureContentsAsPlainText:afterDelay:", 1, 0.0);
      -[UIDictationController _startDictationWithContinuation:](self, "_startDictationWithContinuation:", v100);
      -[UIDictationController _markOfflineDictationInputMetricEvent](self, "_markOfflineDictationInputMetricEvent");
      +[UIDictationView sharedInstance](UIDictationView, "sharedInstance");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v88, "setSwitchingLanguage:", 0);

      -[UIDictationTipController reset](self->_dictationTipController, "reset");
      self->_dictationInputModeSwitchStarted = 0;
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "dismissDictationTip");

LABEL_63:
      goto LABEL_64;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *_AFSiriDataSharingOptInStatusGetName(AFSiriDataSharingOptInStatus)");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "handleFailureInFunction:file:lineNumber:description:", v96, CFSTR("UIDictationController.m"), 233, CFSTR("%s"), dlerror());

    __break(1u);
LABEL_71:
    __UIFaultDebugAssertLog();
    v97 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v97, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_185066000, v97, OS_LOG_TYPE_FAULT, "dictationLanguage must not be nil or it's a programming error.", buf, 2u);
    }

    goto LABEL_63;
  }
  _UIDictationControllerLog();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "-[UIDictationController startDictationWithContinuation:]";
    _os_log_error_impl(&dword_185066000, v24, OS_LOG_TYPE_ERROR, "%s Attempted to start dictation when not enabled", buf, 0xCu);
  }

LABEL_64:
}

- (void)setCurrentInstrumentationContext:(id)a3
{
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  objc_storeStrong((id *)&self->_currentInstrumentationContext, a3);
  v5 = +[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess");
  v6 = v13;
  if (v5)
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "inputDelegateManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "inputSystemSourceSession");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v9, "textOperations");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(sel_setCurrentInstrumentationContext_);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, CFSTR("selector"));

      objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, CFSTR("instrumentationContext"));
      objc_msgSend(v10, "setCustomInfoType:", 0x1E1750220);
      objc_msgSend(v10, "setCustomInfo:", v11);
      objc_msgSend(v9, "flushOperations");

    }
    v6 = v13;
  }

}

- (void)setLocalSpeechRecognitionForced:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = a3;
  self->_localSpeechRecognitionForced = a3;
  if (+[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess"))
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "inputDelegateManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "inputSystemSourceSession");
    v10 = (id)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v10, "textOperations");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(sel_setLocalSpeechRecognitionForced_);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("selector"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("forceOfflineRecognition"));

      objc_msgSend(v6, "setCustomInfoType:", 0x1E1750220);
      objc_msgSend(v6, "setCustomInfo:", v7);
      objc_msgSend(v10, "flushOperations");

    }
  }
}

- (void)setInteractionIdentifier:(id)a3
{
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  objc_storeStrong((id *)&self->_interactionIdentifier, a3);
  v5 = +[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess");
  v6 = v13;
  if (v5)
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "inputDelegateManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "inputSystemSourceSession");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v9, "textOperations");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(sel_setInteractionIdentifier_);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, CFSTR("selector"));

      objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, CFSTR("interactionIdentifier"));
      objc_msgSend(v10, "setCustomInfoType:", 0x1E1750220);
      objc_msgSend(v10, "setCustomInfo:", v11);
      objc_msgSend(v9, "flushOperations");

    }
    v6 = v13;
  }

}

- (void)switchToDictationLanguage:(id)a3
{
  -[UIDictationController switchToDictationLanguage:inputOptions:](self, "switchToDictationLanguage:inputOptions:", a3, 0);
}

- (void)switchToDictationLanguage:(id)a3 inputOptions:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _UNKNOWN **v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  int v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  char v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!objc_msgSend((id)objc_opt_class(), "shouldForwardEventsToInputSystemUI"))
  {
    if (!+[UIKeyboard isModelessActive](UIKeyboard, "isModelessActive"))
    {
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIDictationController keyboardInputModeToReturn](self, "keyboardInputModeToReturn");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setKeyboardInputMode:userInitiated:", v10, 0);

    }
    +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "overrideSmartLanguageSelection:", v6);

    v12 = &off_1E167A000;
    +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "keyboardLanguageForDictationLanguage:", v6);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    if (v14)
      v16 = (void *)v14;
    else
      v16 = v6;
    v17 = v16;

    -[UIDictationController keyboardInputModeToReturn](self, "keyboardInputModeToReturn");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "languageWithRegion");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v17, "isEqualToString:", v19);

    if (v20)
    {
      -[UIDictationController keyboardInputModeToReturn](self, "keyboardInputModeToReturn");
      v21 = (id)objc_claimAutoreleasedReturnValue();
      if (!v21)
      {
LABEL_28:

        goto LABEL_29;
      }
    }
    else
    {
      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "activeInputModes");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
      if (v24)
      {
        v25 = v24;
        v43 = v7;
        v21 = 0;
        v26 = *(_QWORD *)v45;
LABEL_13:
        v27 = 0;
        v28 = v21;
        while (1)
        {
          if (*(_QWORD *)v45 != v26)
            objc_enumerationMutation(v23);
          v21 = *(id *)(*((_QWORD *)&v44 + 1) + 8 * v27);

          objc_msgSend(v21, "languageWithRegion");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v17, "isEqualToString:", v29);

          if ((v30 & 1) != 0)
            break;
          ++v27;
          v28 = v21;
          if (v25 == v27)
          {
            v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
            if (v25)
              goto LABEL_13;

            v21 = 0;
            break;
          }
        }
        v7 = v43;
        v12 = &off_1E167A000;
      }
      else
      {
        v21 = 0;
      }

      if (!v21)
        goto LABEL_28;
    }
    objc_msgSend(v21, "setDictationLanguage:", v6);
    +[UIDictationView sharedInstance](UIDictationView, "sharedInstance");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setShowLanguageLabel:", 1);

    objc_msgSend(v12[476], "sharedInputModeController");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "currentInputMode");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKeyboardInputMode dictationInputMode](UIKeyboardInputMode, "dictationInputMode");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v33, "isEqual:", v34);

    if (v35)
    {
      objc_msgSend(v21, "setLastUsedDictationLanguage");
      objc_msgSend(v12[476], "sharedInputModeController");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setCurrentInputModeInPreference:", v21);

      +[UIKeyboardInputMode dictationInputMode](UIKeyboardInputMode, "dictationInputMode");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setCurrentInputModeForDictation:", v21);

      -[UIDictationController setCurrentInputModeForDictation:](self, "setCurrentInputModeForDictation:", v21);
      -[UIDictationController setKeyboardInputModeToReturn:](self, "setKeyboardInputModeToReturn:", v21);
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v38, "isInHardwareKeyboardMode");

      if (v39)
      {
        v40 = (void *)UIApp;
        objc_msgSend(v21, "automaticHardwareLayout");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "setHardwareKeyboardLayoutName:", v41);

      }
      -[UIDictationController setInputModeOptions:](self, "setInputModeOptions:", 0);
      -[UIDictationController startDictationWithContinuation:](self, "startDictationWithContinuation:", 0);
    }
    else
    {
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "setKeyboardInputMode:userInitiated:", v21, 1);

      -[UIDictationController switchToDictationInputModeWithTouch:withKeyboardInputMode:options:](self, "switchToDictationInputModeWithTouch:withKeyboardInputMode:options:", 0, v21, v7);
    }
    goto LABEL_28;
  }
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "forwardDictationEvent_switchToDictationLanguage:", v6);

LABEL_29:
}

- (void)presentEnablementAndDataSharingPromptIfNeeded:(id)a3
{
  void *v4;
  BOOL v5;
  void (**v6)(id, uint64_t);

  v6 = (void (**)(id, uint64_t))a3;
  +[UIDictationConnectionPreferences sharedInstance](UIDictationConnectionPreferences, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "dictationIsEnabled"))
  {

    goto LABEL_5;
  }
  v5 = -[UIDictationController dataSharingDecided](self, "dataSharingDecided");

  if (!v5)
  {
LABEL_5:
    -[UIDictationController dismissSoftwareKeyboardIfNeeded](self, "dismissSoftwareKeyboardIfNeeded");
    -[UIDictationController _presentEnablementAndDataSharingPromptIfNeeded:](self, "_presentEnablementAndDataSharingPromptIfNeeded:", v6);
    goto LABEL_6;
  }
  v6[2](v6, 1);
LABEL_6:

}

- (void)switchToDictationInputModeWithTouch:(id)a3 withKeyboardInputMode:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  int v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  unint64_t v37;
  uint64_t v38;
  _QWORD v39[5];
  id v40;
  id v41;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "inputDelegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    +[UIDictationConnectionPreferences sharedInstance](UIDictationConnectionPreferences, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "dictationIsEnabled"))
    {
      v14 = -[UIDictationController dataSharingDecided](self, "dataSharingDecided");

      if (v14)
      {
        -[UIDictationController _finalDictationStartLanguageCodeWithKeyboardInputMode:](self, "_finalDictationStartLanguageCodeWithKeyboardInputMode:", v9);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(getAFPreferencesClass_0(), "sharedPreferences");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_opt_respondsToSelector();

        if ((v17 & 1) != 0)
        {
          objc_msgSend(getAFPreferencesClass_0(), "sharedPreferences");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "performSelector:withObject:", sel_displayedLowStorageNotificationForLanguage_, v15);

          -[UIDictationController cachedDisplayLowStorageNotification](self, "cachedDisplayLowStorageNotification");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (v20)
          {
            -[UIDictationController setCachedDisplayLowStorageNotification:](self, "setCachedDisplayLowStorageNotification:", v20);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            -[UIDictationController setCachedDisplayLowStorageNotification:](self, "setCachedDisplayLowStorageNotification:", v21);

          }
          -[UIDictationController cachedDisplayLowStorageNotification](self, "cachedDisplayLowStorageNotification");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "objectForKey:", v15);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "BOOLValue");

          if (v19)
            v25 = 1;
          else
            v25 = v24;
          +[UIDictationConnectionPreferences sharedInstance](UIDictationConnectionPreferences, "sharedInstance");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v26, "isOnDeviceDictationSupportMissingAssetForLanguage:", v15);

          if (v27)
          {
            if ((v25 & 1) == 0
              && objc_msgSend((id)objc_opt_class(), "_isLowStorageForOnDeviceDictationAsset"))
            {
              -[UIDictationController dictationConnection](self, "dictationConnection");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "suppressLowStorageNotificationForLanguage:suppress:", v15, 1);

              -[UIDictationController cachedDisplayLowStorageNotification](self, "cachedDisplayLowStorageNotification");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "setObject:forKey:", MEMORY[0x1E0C9AAB0], v15);

              -[UIDictationController dictationConnection](self, "dictationConnection");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "requestOfflineDictationSupportForLanguage:completion:", v15, 0);

              -[UIDictationController showLowStorageUserAlertWithLanguage:](self, "showLowStorageUserAlertWithLanguage:", v15);
LABEL_25:

              goto LABEL_26;
            }
          }
          else if (v25)
          {
            -[UIDictationController dictationConnection](self, "dictationConnection");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "suppressLowStorageNotificationForLanguage:suppress:", v15, 0);

            -[UIDictationController cachedDisplayLowStorageNotification](self, "cachedDisplayLowStorageNotification");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "setObject:forKey:", MEMORY[0x1E0C9AAA0], v15);

          }
        }
        +[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "acceptAutocorrectionWithCompletionHandler:", 0);

        +[UIKeyboardInputMode dictationInputMode](UIKeyboardInputMode, "dictationInputMode");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "setTriggeringTouch:", v8);
        objc_msgSend(v34, "setCurrentInputModeForDictation:", v9);
        -[UIDictationController setCurrentInputModeForDictation:](self, "setCurrentInputModeForDictation:", v9);
        if (!objc_msgSend(v34, "viewControllerClass"))
        {
          -[UITouch _setPhaseChangeDelegate:]((uint64_t)v8, self);
          self->cancelledByWaitingForLocalResults = 0;
          if (-[UIDictationController isFallingBackToMonolingualDictation](self, "isFallingBackToMonolingualDictation"))
            v35 = 1;
          else
            v35 = objc_msgSend(v9, "isDisplayed") ^ 1;
          +[UIDictationView sharedInstance](UIDictationView, "sharedInstance");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "setShowLanguageLabel:", v35);

          -[UIDictationController setInputModeOptions:](self, "setInputModeOptions:", v10);
          v37 = +[UIDictationController reasonType:](UIDictationController, "reasonType:", v10);
          v38 = MEMORY[0x1E0C809B0];
          self->_reasonType = v37;
          v39[0] = v38;
          v39[1] = 3221225472;
          v39[2] = __91__UIDictationController_switchToDictationInputModeWithTouch_withKeyboardInputMode_options___block_invoke;
          v39[3] = &unk_1E16B47A8;
          v39[4] = self;
          v40 = v9;
          v41 = v8;
          -[UIDictationController startDictationWithContinuation:](self, "startDictationWithContinuation:", v39);

        }
        goto LABEL_25;
      }
    }
    else
    {

    }
    -[UIDictationController dismissSoftwareKeyboardIfNeeded](self, "dismissSoftwareKeyboardIfNeeded");
    -[UIDictationController _presentEnablementAndDataSharingPromptIfNeeded:](self, "_presentEnablementAndDataSharingPromptIfNeeded:", 0);
  }
LABEL_26:

}

void __91__UIDictationController_switchToDictationInputModeWithTouch_withKeyboardInputMode_options___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setDictationInputMode:", *(_QWORD *)(a1 + 40));
  if (*(_QWORD *)(a1 + 48))
  {
    +[UIDictationView sharedInstance](UIDictationView, "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "highlightEndpointButton");

  }
  v3 = *(void **)(a1 + 32);
  v5 = CFSTR("reason");
  v6[0] = CFSTR("Dictation controller did switch input mode");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:userInfo:", CFSTR("UIKeyboardDictationAvailabilityDidChangeNotification"), v4);

}

- (void)switchToDictationInputModeWithTouch:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentInputMode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIDictationInputModeOptions dictationInputModeOptionsWithInvocationSource:](UIDictationInputModeOptions, "dictationInputModeOptionsWithInvocationSource:", CFSTR("UIDictationInputModeInvocationSourceMicButtonInKeyboard"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIDictationController switchToDictationInputModeWithTouch:withKeyboardInputMode:options:](self, "switchToDictationInputModeWithTouch:withKeyboardInputMode:options:", v4, v5, v6);

}

- (void)switchToDictationInputModeWithTouch:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  int has_internal_diagnostics;
  int v9;
  void *v10;
  void *v11;
  NSObject *v12;
  unint64_t v13;
  NSObject *v14;
  uint8_t v15[16];
  uint8_t buf[16];

  v6 = a4;
  v7 = a3;
  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  v9 = objc_msgSend((id)objc_opt_class(), "shouldForwardEventsToInputSystemUI");
  if (has_internal_diagnostics)
  {
    if (v9)
    {
      __UIFaultDebugAssertLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v12, OS_LOG_TYPE_FAULT, "Forwarding event with UITouch is not supported", buf, 2u);
      }

    }
  }
  else if (v9)
  {
    v13 = switchToDictationInputModeWithTouch_options____s_category;
    if (!switchToDictationInputModeWithTouch_options____s_category)
    {
      v13 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v13, (unint64_t *)&switchToDictationInputModeWithTouch_options____s_category);
    }
    v14 = *(NSObject **)(v13 + 8);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_185066000, v14, OS_LOG_TYPE_ERROR, "Forwarding event with UITouch is not supported", v15, 2u);
    }
  }
  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "currentInputMode");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIDictationController switchToDictationInputModeWithTouch:withKeyboardInputMode:options:](self, "switchToDictationInputModeWithTouch:withKeyboardInputMode:options:", v7, v11, v6);

}

- (id)currentDictationLanguageForDisplay
{
  void *v3;
  void *v4;
  void *v5;

  if (-[UIDictationController smartLanguageSelectionOverridden](self, "smartLanguageSelectionOverridden"))
  {
    -[UIDictationController smartLanguageSelectionOverrideLanguage](self, "smartLanguageSelectionOverrideLanguage");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[UIDictationController currentInputModeForDictation](self, "currentInputModeForDictation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictationLanguage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    TIInputModeGetLanguageWithRegion();
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (void)showSoftwareKeyboardIfNeeded
{
  void *v3;
  int v4;
  void *v5;
  char v6;
  id v7;

  if (!-[UIDictationController shouldSuppressSoftwareKeyboard](self, "shouldSuppressSoftwareKeyboard"))
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isMinimized");

    if (v4)
    {
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "isInHardwareKeyboardMode");

      if ((v6 & 1) == 0)
      {
        -[UIDictationController setDidToggleSoftwareKeyboardVisibleForDictation:](self, "setDidToggleSoftwareKeyboardVisibleForDictation:", 1);
        +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
        v7 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "ejectKeyDown");

      }
    }
    else
    {
      -[UIDictationController setDidToggleSoftwareKeyboardVisibleForDictation:](self, "setDidToggleSoftwareKeyboardVisibleForDictation:", 0);
    }
  }
}

- (void)dismissSoftwareKeyboardIfNeeded
{
  void *v3;
  char v4;
  void *v5;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isMinimized");

  if (-[UIDictationController didToggleSoftwareKeyboardVisibleForDictation](self, "didToggleSoftwareKeyboardVisibleForDictation")&& (v4 & 1) == 0)
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ejectKeyDown");

  }
  -[UIDictationController setDidToggleSoftwareKeyboardVisibleForDictation:](self, "setDidToggleSoftwareKeyboardVisibleForDictation:", 0);
}

- (void)_displaySecureContentsAsPlainText:(BOOL)a3 afterDelay:(double)a4
{
  void *v4;
  id v5;
  id v6;

  if (!a3)
  {
    +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance", a4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "inputDelegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "isSecureTextEntry"))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v5 = v6;
        objc_msgSend(v5, "setDisplaySecureTextUsingPlainText:", 0);
        objc_msgSend(v5, "setDisplaySecureEditsUsingPlainText:", 0);
        objc_msgSend(v5, "_forceObscureAllText");

      }
    }

  }
}

- (void)clearTextFieldPlaceholder
{
  void *v3;
  objc_class *v4;
  id v5;
  void *v6;
  id v7;

  if (-[UIDictationController _shouldUpdateHelperMessageDisplay](self, "_shouldUpdateHelperMessageDisplay"))
  {
    +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "inputDelegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v4 = (objc_class *)MEMORY[0x1E0CB3498];
      v5 = v7;
      v6 = (void *)objc_msgSend([v4 alloc], "initWithString:", &stru_1E16EDF20);
      objc_msgSend(v5, "_setOverridePlaceholder:alignment:", v6, 4);
      self->_prevForceDisplayOverridePlaceholder = objc_msgSend(v5, "_forceDisplayOverridePlaceholder");
      objc_msgSend(v5, "setPlaceholder:", 0);
      objc_msgSend(v5, "_setForceDisplayOverridePlaceholder:", 0);

    }
  }
}

- (void)restoreTextFieldPlaceholder
{
  void *v3;
  id v4;
  id v5;

  if (-[UIDictationController _shouldUpdateHelperMessageDisplay](self, "_shouldUpdateHelperMessageDisplay"))
  {
    +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "inputDelegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v4 = v5;
      objc_msgSend(v4, "_setOverridePlaceholder:alignment:", 0, 4);
      objc_msgSend(v4, "_setForceDisplayOverridePlaceholder:", self->_prevForceDisplayOverridePlaceholder);

    }
  }
}

- (void)updateHelperMessageDisplayIfNeeded
{
  if (-[UIDictationController _resolvedIsDictationPossible](self, "_resolvedIsDictationPossible"))
    -[UIDictationController startHelperMessageDisplayIfNeeded](self, "startHelperMessageDisplayIfNeeded");
  else
    -[UIDictationController stopHelperMessageDisplayIfNeeded](self, "stopHelperMessageDisplayIfNeeded");
}

- (void)startHelperMessageDisplayIfNeeded
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  unint64_t v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _BOOL4 v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  __CFString *v32;
  const __CFString *v33;
  __CFString *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  __CFString *v42;
  const __CFString *v43;
  __CFString *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  _QWORD v61[2];
  _QWORD v62[2];
  void *v63;
  _QWORD v64[2];

  v64[1] = *MEMORY[0x1E0C80C00];
  if (-[UIDictationController _shouldUpdateHelperMessageDisplay](self, "_shouldUpdateHelperMessageDisplay"))
  {
    +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "inputDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_24:

      return;
    }
    v60 = v3;
    +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "textInputTraits");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_msgSend(v5, "dictationInfoKeyboardType");
    +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "currentKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "currentKey");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "interactionType") == 10;

    }
    else
    {
      v11 = 0;
    }

    +[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isFocused");

    +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "enabledDictationLanguages");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "count");

    if (v16 <= 1)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "preferredLocalizations");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "firstObject");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "currentInputModeForDictation");
      v57 = v3;
      v22 = v11;
      v23 = v6;
      v24 = v5;
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "dictationLanguage");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      v27 = (void *)MEMORY[0x1E0C99DC8];
      v64[0] = v20;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v64, 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = v26;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v63, 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "matchedLanguagesFromAvailableLanguages:forPreferredLanguages:", v28, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v30, "count") == 0;

      v5 = v24;
      v6 = v23;
      v11 = v22;
      v3 = v57;

    }
    else
    {
      v17 = 1;
    }
    if ((v11 | v13 ^ 1) == 1)
    {
      v31 = v60;
      objc_msgSend(v60, "_updateHelpMessageOverrideWithMessage:", 0);
LABEL_23:

      goto LABEL_24;
    }
    v59 = v5;
    if (UIKeyboardTypeSupportsDictationSpelling(v6)
      || (objc_msgSend(v5, "isSecureTextEntry") & 1) != 0
      || objc_msgSend(v5, "forceSpellingDictation"))
    {
      if (v17)
      {
        v32 = CFSTR("ATV_DICTATION_SPELLING_HELP_LANGUAGE");
        v33 = CFSTR("Help text for AppleTV spelling dictation with language");
        v34 = CFSTR("Hold %@ to spell in %@");
LABEL_16:
        _UILocalizedString(v32, (uint64_t)v33, v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "currentInputModeForDictation");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "dictationLanguage");
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v35, "hasPrefix:", CFSTR("%2$@")))
          v39 = 4;
        else
          v39 = 5;
        UIKeyboardDictationDisplayNameInUILanguage(v38, v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithValidatedFormat:validFormatSpecifiers:error:", v35, CFSTR("%@ %@"), 0, CFSTR("%@"), v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_22;
      }
      v42 = CFSTR("ATV_DICTATION_SPELLING_HELP");
      v43 = CFSTR("Help text for AppleTV spelling dictation");
      v44 = CFSTR("Hold %@ to spell");
    }
    else
    {
      if (v17)
      {
        v32 = CFSTR("ATV_DICTATION_GENERIC_HELP_LANGUAGE");
        v33 = CFSTR("Help text for AppleTV generic dictation with language");
        v34 = CFSTR("Hold %@ to dictate in %@");
        goto LABEL_16;
      }
      v42 = CFSTR("ATV_DICTATION_GENERIC_HELP");
      v43 = CFSTR("Help text for AppleTV generic dictation");
      v44 = CFSTR("Hold %@ to dictate");
    }
    _UILocalizedString(v42, (uint64_t)v43, v44);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_22:
    +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("mic.circle.fill"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "imageWithRenderingMode:", 2);
    v58 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(off_1E1679D28, "textAttachmentWithImage:", v58);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = (void *)objc_msgSend(v47, "mutableCopy");

    v49 = objc_msgSend(v41, "rangeOfString:", CFSTR("%@"));
    v51 = v50;
    objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleHeadline"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v60;
    objc_msgSend(v60, "_placeholderColor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v41);
    objc_msgSend(v54, "replaceCharactersInRange:withAttributedString:", v49, v51, v48);
    v55 = *(_QWORD *)off_1E1678D90;
    v61[0] = *(_QWORD *)off_1E1678D98;
    v61[1] = v55;
    v62[0] = v53;
    v62[1] = v52;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v62, v61, 2);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "addAttributes:range:", v56, 0, objc_msgSend(v54, "length"));

    objc_msgSend(v60, "_updateHelpMessageOverrideWithMessage:", v54);
    v5 = v59;
    goto LABEL_23;
  }
}

+ (BOOL)dictationInfoIsOnScreen
{
  int v2;
  uint64_t state64;

  v2 = dictationInfoIsOnScreen_token;
  if (!dictationInfoIsOnScreen_token)
  {
    notify_register_check("com.apple.keyboard.DictationInfoIsOnScreen", &dictationInfoIsOnScreen_token);
    v2 = dictationInfoIsOnScreen_token;
  }
  state64 = 0;
  notify_get_state(v2, &state64);
  return state64 & 1;
}

- (void)setDictationInfoOnScreenNotifyKey:(BOOL)a3
{
  _BOOL4 v3;
  int v4;
  uint64_t state64;

  v3 = a3;
  v4 = setDictationInfoOnScreenNotifyKey__token;
  if (!setDictationInfoOnScreenNotifyKey__token)
  {
    notify_register_check("com.apple.keyboard.DictationInfoIsOnScreen", &setDictationInfoOnScreenNotifyKey__token);
    v4 = setDictationInfoOnScreenNotifyKey__token;
  }
  state64 = 0;
  notify_get_state(v4, &state64);
  if (((((state64 & 1) == 0) ^ v3) & 1) == 0)
  {
    state64 = v3;
    notify_set_state(setDictationInfoOnScreenNotifyKey__token, v3);
  }
}

- (void)_createDictationPresenterWindowIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  UIApplicationRotationFollowingWindow *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  UIApplicationRotationFollowingController *v13;
  void *v14;
  void *v15;
  id v16;

  -[UIDictationController dictationPresenterWindow](self, "dictationPresenterWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scene");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_alloc_init(UIApplicationRotationFollowingWindow);
    -[UIDictationController setDictationPresenterWindow:](self, "setDictationPresenterWindow:", v6);

    -[UIDictationController dictationPresenterWindow](self, "dictationPresenterWindow");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setOpaque:", 0);

    -[UIDictationController dictationPresenterWindow](self, "dictationPresenterWindow");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIColor clearColor](UIColor, "clearColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBackgroundColor:", v9);

    -[UIDictationController dictationPresenterWindow](self, "dictationPresenterWindow");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setWindowScene:", v5);

    -[UIDictationController dictationPresenterWindow](self, "dictationPresenterWindow");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWindowLevel:", 2000.0);

    -[UIDictationController dictationPresenterWindow](self, "dictationPresenterWindow");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setHidden:", 1);

    v13 = objc_alloc_init(UIApplicationRotationFollowingController);
    -[UIApplicationRotationFollowingController setSizesWindowToScene:](v13, "setSizesWindowToScene:", 1);
    -[UIDictationController dictationPresenterWindow](self, "dictationPresenterWindow");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setRootViewController:", v13);

  }
  -[UIDictationController dictationPresenterWindow](self, "dictationPresenterWindow");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)UIApp, "keyWindow");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "_setSecure:", objc_msgSend(v15, "_isSecure"));

}

- (void)_logEnablementPromtMetricsWithStartDate:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  objc_class *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceDate:", v4);
  v7 = v6;

  v15 = 0;
  v16 = &v15;
  v17 = 0x2050000000;
  v8 = (void *)getSISchemaUEIDictationEnablementPromptShownClass_softClass;
  v18 = getSISchemaUEIDictationEnablementPromptShownClass_softClass;
  if (!getSISchemaUEIDictationEnablementPromptShownClass_softClass)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __getSISchemaUEIDictationEnablementPromptShownClass_block_invoke;
    v14[3] = &unk_1E16B14C0;
    v14[4] = &v15;
    __getSISchemaUEIDictationEnablementPromptShownClass_block_invoke((uint64_t)v14);
    v8 = (void *)v16[3];
  }
  v9 = objc_retainAutorelease(v8);
  _Block_object_dispose(&v15, 8);
  v10 = objc_alloc_init(v9);
  objc_msgSend(v10, "setIsDictationEnabled:", -[UIDictationController enablementLoggingIsDictationEnabled](self, "enablementLoggingIsDictationEnabled"));
  objc_msgSend(v10, "setIsLearnMoreButtonClicked:", -[UIDictationController enablementLoggingIsLearnMoreButtonClicked](self, "enablementLoggingIsLearnMoreButtonClicked"));
  objc_msgSend(v10, "setPromptVisibilityDurationInMs:", (uint64_t)(v7 * 1000.0));
  objc_msgSend(getAFAnalyticsClass(), "sharedAnalytics");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "newTurnBasedInstrumentationContext");

  objc_msgSend(v12, "emitInstrumentation:", v10);
  if (-[UIDictationController enablementLoggingIsDictationEnabled](self, "enablementLoggingIsDictationEnabled"))
    v13 = v12;
  else
    v13 = 0;
  objc_storeStrong((id *)&self->_enablementInstrumentationContext, v13);

}

- (void)_presentEnablementAndDataSharingPromptIfNeeded:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  DispatchGroupWrapper *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  DispatchGroupWrapper *v15;
  _QWORD v16[5];
  id v17;
  DispatchGroupWrapper *v18;
  id v19;
  _QWORD *v20;
  _QWORD *v21;
  char v22;
  _QWORD v23[7];
  _QWORD v24[3];
  char v25;
  _QWORD v26[3];
  char v27;
  _QWORD v28[3];
  char v29;

  v4 = a3;
  -[UIDictationController setEnablementLoggingIsDictationEnabled:](self, "setEnablementLoggingIsDictationEnabled:", 0);
  -[UIDictationController setEnablementLoggingIsLearnMoreButtonClicked:](self, "setEnablementLoggingIsLearnMoreButtonClicked:", 0);
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x2020000000;
  v29 = 0;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  v27 = 0;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  v25 = 0;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:", CFSTR("UIKeyboardWillPresentDictationEnablementPromptNotification"), 0);

  +[UIDictationConnectionPreferences sharedInstance](UIDictationConnectionPreferences, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressDataSharingOptIn");

  v9 = objc_alloc_init(DispatchGroupWrapper);
  if (+[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess"))
  {
    +[UIPeripheralHost sharedInstance](UIPeripheralHost, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDeactivatedKeyboard:forScene:", 1, 0);
  }
  else
  {
    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", self);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_preserveInputViewsWithId:animated:", v11, 1);

  }
  v12 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __72__UIDictationController__presentEnablementAndDataSharingPromptIfNeeded___block_invoke;
  v23[3] = &unk_1E16D4628;
  v23[4] = self;
  v23[5] = v28;
  v23[6] = v26;
  -[DispatchGroupWrapper executeWithDispatchGroup:](v9, "executeWithDispatchGroup:", v23);
  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __72__UIDictationController__presentEnablementAndDataSharingPromptIfNeeded___block_invoke_3;
  v16[3] = &unk_1E16D46C8;
  v22 = v8;
  v20 = v28;
  v16[4] = self;
  v13 = v5;
  v17 = v13;
  v14 = v4;
  v19 = v14;
  v15 = v9;
  v18 = v15;
  v21 = v24;
  -[DispatchGroupWrapper notify:](v15, "notify:", v16);

  _Block_object_dispose(v24, 8);
  _Block_object_dispose(v26, 8);
  _Block_object_dispose(v28, 8);

}

void __72__UIDictationController__presentEnablementAndDataSharingPromptIfNeeded___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;
  __int128 v8;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __72__UIDictationController__presentEnablementAndDataSharingPromptIfNeeded___block_invoke_2;
  v6[3] = &unk_1E16D4600;
  v8 = *(_OWORD *)(a1 + 40);
  v6[4] = v4;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "_presentAlertForDictationInputModeOfType:completionHandler:", 1, v6);

}

uint64_t __72__UIDictationController__presentEnablementAndDataSharingPromptIfNeeded___block_invoke_2(uint64_t a1, char a2, char a3)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a2;
  objc_msgSend(*(id *)(a1 + 32), "setEnablementLoggingIsDictationEnabled:", *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = a3;
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __72__UIDictationController__presentEnablementAndDataSharingPromptIfNeeded___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[5];
  id v15;
  id v16;
  __int128 v17;
  _QWORD v18[6];

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) || *(_BYTE *)(a1 + 80))
  {
    v2 = *(void **)(a1 + 48);
    v3 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __72__UIDictationController__presentEnablementAndDataSharingPromptIfNeeded___block_invoke_4;
    v18[3] = &unk_1E16D4678;
    v4 = *(_QWORD *)(a1 + 72);
    v18[4] = *(_QWORD *)(a1 + 32);
    v18[5] = v4;
    objc_msgSend(v2, "executeWithDispatchGroup:", v18);
    v14[0] = v3;
    v14[1] = 3221225472;
    v14[2] = __72__UIDictationController__presentEnablementAndDataSharingPromptIfNeeded___block_invoke_6;
    v14[3] = &unk_1E16D46A0;
    v17 = *(_OWORD *)(a1 + 64);
    v5 = *(void **)(a1 + 40);
    v6 = *(void **)(a1 + 48);
    v14[4] = *(_QWORD *)(a1 + 32);
    v15 = v5;
    v16 = *(id *)(a1 + 56);
    objc_msgSend(v6, "notify:", v14);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_logEnablementPromtMetricsWithStartDate:", *(_QWORD *)(a1 + 40));
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "postNotificationName:object:", CFSTR("UIKeyboardDidFinishPresentingDictationEnablementPromptNotification"), 0);

    if (+[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess"))
    {
      +[UIPeripheralHost sharedInstance](UIPeripheralHost, "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setDeactivatedKeyboard:forScene:", 0, 0);
    }
    else
    {
      +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", *(_QWORD *)(a1 + 32));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_restoreInputViewsWithId:animated:", v9, 1);

    }
    if (objc_msgSend(*(id *)(a1 + 32), "shouldSuppressSoftwareKeyboard"))
    {
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setKeyboardMinimizedByDictation:", 0);

      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "inputDelegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "resignFirstResponder");

    }
    v13 = *(_QWORD *)(a1 + 56);
    if (v13)
      (*(void (**)(uint64_t, _QWORD))(v13 + 16))(v13, 0);
  }
}

void __72__UIDictationController__presentEnablementAndDataSharingPromptIfNeeded___block_invoke_4(uint64_t a1, void *a2)
{
  void (**v3)(_QWORD);
  void *v4;
  _QWORD v5[4];
  void (**v6)(_QWORD);
  uint64_t v7;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "dataSharingDecided") & 1) != 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    v3[2](v3);
  }
  else
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __72__UIDictationController__presentEnablementAndDataSharingPromptIfNeeded___block_invoke_5;
    v5[3] = &unk_1E16D4650;
    v4 = *(void **)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    v6 = v3;
    objc_msgSend(v4, "_presentAlertForDictationInputModeOfType:completionHandler:", 2, v5);

  }
}

uint64_t __72__UIDictationController__presentEnablementAndDataSharingPromptIfNeeded___block_invoke_5(uint64_t a1, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __72__UIDictationController__presentEnablementAndDataSharingPromptIfNeeded___block_invoke_6(uint64_t a1)
{
  _BOOL8 v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    v2 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) != 0;
  else
    v2 = 0;
  objc_msgSend(*(id *)(a1 + 32), "_logEnablementPromtMetricsWithStartDate:", *(_QWORD *)(a1 + 40));
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("UIKeyboardDidFinishPresentingDictationEnablementPromptNotification"), 0);

  if (+[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess"))
  {
    +[UIPeripheralHost sharedInstance](UIPeripheralHost, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDeactivatedKeyboard:forScene:", 0, 0);
  }
  else
  {
    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", *(_QWORD *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_restoreInputViewsWithId:animated:", v5, 1);

  }
  v6 = *(_QWORD *)(a1 + 48);
  if (v6)
  {
    (*(void (**)(uint64_t, _BOOL8))(v6 + 16))(v6, v2);
    return;
  }
  if (v2)
  {
    if (objc_msgSend((id)objc_opt_class(), "shouldForwardInInputSystemUI"))
      goto LABEL_15;
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
      return;
    if (_MergedGlobals_35_1[0] != 1)
    {
LABEL_15:
      byte_1ECD7965A = 1;
    }
    else if (!*(_QWORD *)(a1 + 48))
    {
      objc_msgSend(*(id *)(a1 + 32), "switchToDictationInputMode");
    }
  }
}

- (void)_endEnableDictationPromptAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  _QWORD v6[5];

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0DBDB40], "dismissEnableDictationPrompt");
  -[UIDictationController dictationPrivacySheetController](self, "dictationPrivacySheetController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__UIDictationController__endEnableDictationPromptAnimated___block_invoke;
  v6[3] = &unk_1E16B1B28;
  v6[4] = self;
  objc_msgSend(v5, "dismissViewControllerAnimated:completion:", v3, v6);

}

uint64_t __59__UIDictationController__endEnableDictationPromptAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handlePrivacySheetDismissal");
}

- (void)presentAlertOfType:(int64_t)a3 withCompletion:(id)a4
{
  id v6;
  BOOL v7;
  uint64_t v8;
  uint64_t *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  unint64_t v24;
  NSObject *v25;
  NSObject *v26;
  _QWORD aBlock[5];
  id v28;
  id v29;
  _QWORD *v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  id v35;
  UIDictationController *v36;
  uint8_t *v37;
  _QWORD *v38;
  uint8_t buf[8];
  uint8_t *v40;
  uint64_t v41;
  char v42;
  _QWORD v43[3];
  char v44;

  v6 = a4;
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x2020000000;
  v44 = 0;
  v7 = +[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess");
  v8 = MEMORY[0x1E0C809B0];
  v9 = &qword_186677000;
  if (v7)
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend((id)UIApp, "keyWindow");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstResponder");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "inputAccessoryView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "inputAccessoryViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    v40 = buf;
    v41 = 0x2020000000;
    v42 = 0;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __59__UIDictationController_presentAlertOfType_withCompletion___block_invoke;
    v31[3] = &unk_1E16D4718;
    v37 = buf;
    v17 = v11;
    v32 = v17;
    v18 = v12;
    v33 = v18;
    v19 = v13;
    v34 = v19;
    v20 = v14;
    v38 = v43;
    v35 = v20;
    v36 = self;
    objc_msgSend(v15, "addObserverForName:object:queue:usingBlock:", CFSTR("UIWindowFirstResponderDidChangeNotification"), v17, v16, v31);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    _Block_object_dispose(buf, 8);
    v8 = MEMORY[0x1E0C809B0];
    v9 = &qword_186677000;
  }
  aBlock[0] = v8;
  aBlock[1] = v9[481];
  aBlock[2] = __59__UIDictationController_presentAlertOfType_withCompletion___block_invoke_3;
  aBlock[3] = &unk_1E16D4740;
  aBlock[4] = self;
  v30 = v43;
  v21 = v10;
  v28 = v21;
  v22 = v6;
  v29 = v22;
  v23 = _Block_copy(aBlock);
  if (a3 == 2)
  {
    -[UIDictationController _presentDataSharingOptInAlertWithCompletion:](self, "_presentDataSharingOptInAlertWithCompletion:", v23);
  }
  else if (a3 == 1)
  {
    -[UIDictationController _presentOptInAlertWithCompletion:](self, "_presentOptInAlertWithCompletion:", v23);
  }
  else if (os_variant_has_internal_diagnostics())
  {
    __UIFaultDebugAssertLog();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_185066000, v26, OS_LOG_TYPE_FAULT, "Asking to present a Dictation Alert for a type that doesn't exist", buf, 2u);
    }

  }
  else
  {
    v24 = presentAlertOfType_withCompletion____s_category;
    if (!presentAlertOfType_withCompletion____s_category)
    {
      v24 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v24, (unint64_t *)&presentAlertOfType_withCompletion____s_category);
    }
    v25 = *(NSObject **)(v24 + 8);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_185066000, v25, OS_LOG_TYPE_ERROR, "Asking to present a Dictation Alert for a type that doesn't exist", buf, 2u);
    }
  }

  _Block_object_dispose(v43, 8);
}

void __59__UIDictationController_presentAlertOfType_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  id v4;
  uint64_t v5;
  _QWORD block[4];
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  int8x16_t v12;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  if (!*(_BYTE *)(v1 + 24))
  {
    v3 = MEMORY[0x1E0C809B0];
    *(_BYTE *)(v1 + 24) = 1;
    block[0] = v3;
    block[1] = 3221225472;
    block[2] = __59__UIDictationController_presentAlertOfType_withCompletion___block_invoke_2;
    block[3] = &unk_1E16D46F0;
    v7 = *(id *)(a1 + 32);
    v8 = *(id *)(a1 + 40);
    v9 = *(id *)(a1 + 48);
    v4 = *(id *)(a1 + 56);
    v5 = *(_QWORD *)(a1 + 64);
    v10 = v4;
    v11 = v5;
    v12 = vextq_s8(*(int8x16_t *)(a1 + 72), *(int8x16_t *)(a1 + 72), 8uLL);
    dispatch_after(0, MEMORY[0x1E0C80D38], block);

  }
}

void __59__UIDictationController_presentAlertOfType_withCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "firstResponder");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(*(id *)(a1 + 40), "isEqual:") & 1) == 0)
  {
    v2 = *(void **)(a1 + 48);
    objc_msgSend(v6, "inputAccessoryView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "isEqual:", v3))
    {

    }
    else
    {
      v4 = *(void **)(a1 + 56);
      objc_msgSend(v6, "inputAccessoryViewController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v4) = objc_msgSend(v4, "isEqual:", v5);

      if ((v4 & 1) == 0)
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
        objc_msgSend(*(id *)(a1 + 64), "_endEnableDictationPromptAnimated:", 0);
      }
    }
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 0;

}

void __59__UIDictationController_presentAlertOfType_withCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void (**v11)(void);

  v11 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setDictationInfoOnScreenNotifyKey:", 0);
  objc_msgSend(*(id *)(a1 + 32), "presentingWindowForPrivacySheet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resignKeyWindow");

  if (+[UIDictationUtilities _isUsingLargeFormatDictationUI](UIDictationUtilities, "_isUsingLargeFormatDictationUI"))
  {
    objc_msgSend(*(id *)(a1 + 32), "dictationPresenterWindow");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "subviews");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndex:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeFromSuperview");

  }
  objc_msgSend(*(id *)(a1 + 32), "presentingWindowForPrivacySheet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHidden:", 1);

  objc_msgSend(*(id *)(a1 + 32), "setDictationPresenterWindow:", 0);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    v8 = (void *)MEMORY[0x1E0C9AAA0];
  }
  else
  {
    v11[2]();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObserver:", *(_QWORD *)(a1 + 40));

  }
  if (v8)
  {
    v10 = *(_QWORD *)(a1 + 48);
    if (v10)
      (*(void (**)(uint64_t, uint64_t))(v10 + 16))(v10, objc_msgSend(v8, "BOOLValue"));
  }

}

- (BOOL)shouldPresentOptInAlert
{
  void *v2;
  char v3;

  +[UIDictationConnectionPreferences sharedInstance](UIDictationConnectionPreferences, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "dictationIsEnabled") ^ 1;

  return v3;
}

- (void)_presentOptInAlertWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0DBDB40];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__UIDictationController__presentOptInAlertWithCompletion___block_invoke;
  v7[3] = &unk_1E16D4790;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "promptToEnableDictationWithCompletionHandler:", v7);

}

void __58__UIDictationController__presentOptInAlertWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD block[5];
  id v5;
  uint64_t v6;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__UIDictationController__presentOptInAlertWithCompletion___block_invoke_2;
  block[3] = &unk_1E16BD058;
  v5 = *(id *)(a1 + 40);
  v6 = a2;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __58__UIDictationController__presentOptInAlertWithCompletion___block_invoke_2(_QWORD *a1)
{
  void (**v1)(void);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id (*v5)(uint64_t);
  void *v6;
  uint64_t v7;
  void (**v8)(void);
  uint64_t v9;

  v3 = MEMORY[0x1E0C809B0];
  v4 = 3221225472;
  v5 = __58__UIDictationController__presentOptInAlertWithCompletion___block_invoke_3;
  v6 = &unk_1E16D4768;
  v1 = (void (**)(void))a1[5];
  v2 = a1[4];
  v9 = a1[6];
  v7 = v2;
  v8 = v1;
  v1[2]();

}

id __58__UIDictationController__presentOptInAlertWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  void *v3;

  v1 = *(_QWORD *)(a1 + 48);
  if (v1 == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "setEnablementLoggingIsLearnMoreButtonClicked:", 1);
    objc_msgSend(*(id *)(a1 + 32), "_presentPrivacySheetForType:completion:", 1, *(_QWORD *)(a1 + 40));
    v3 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v1 == 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)_presentDataSharingOptInAlertWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0DBDB40];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __69__UIDictationController__presentDataSharingOptInAlertWithCompletion___block_invoke;
  v7[3] = &unk_1E16C2BB8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "promptToEnableDataSharingWithCompletionHandler:", v7);

}

void __69__UIDictationController__presentDataSharingOptInAlertWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  _QWORD block[5];
  id v5;
  uint64_t v6;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__UIDictationController__presentDataSharingOptInAlertWithCompletion___block_invoke_2;
  block[3] = &unk_1E16B44E8;
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v6 = a2;
  block[4] = v2;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __69__UIDictationController__presentDataSharingOptInAlertWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v3;
  void *v4;

  if (*(_QWORD *)(a1 + 48) == 2)
    return objc_msgSend(*(id *)(a1 + 32), "_presentPrivacySheetForType:completion:", 2, *(_QWORD *)(a1 + 40));
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", 1);
  v4 = (void *)qword_1ECD79678;
  qword_1ECD79678 = v3;

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __69__UIDictationController__presentDataSharingOptInAlertWithCompletion___block_invoke_3()
{
  return MEMORY[0x1E0C9AAB0];
}

- (void)_presentAlertForDictationInputModeOfType:(int64_t)a3 completionHandler:(id)a4
{
  void (**v6)(id, uint64_t, _QWORD);
  void *v7;
  int v8;
  _QWORD v9[4];
  void (**v10)(id, uint64_t, _QWORD);
  int64_t v11;

  v6 = (void (**)(id, uint64_t, _QWORD))a4;
  if (a3 == 1
    && (+[UIDictationConnectionPreferences sharedInstance](UIDictationConnectionPreferences, "sharedInstance"), v7 = (void *)objc_claimAutoreleasedReturnValue(), v8 = objc_msgSend(v7, "dictationIsEnabled"), v7, v8))
  {
    v6[2](v6, 1, 0);
  }
  else
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __84__UIDictationController__presentAlertForDictationInputModeOfType_completionHandler___block_invoke;
    v9[3] = &unk_1E16D47F8;
    v11 = a3;
    v10 = v6;
    -[UIDictationController presentAlertOfType:withCompletion:](self, "presentAlertOfType:withCompletion:", a3, v9);

  }
}

uint64_t __84__UIDictationController__presentAlertForDictationInputModeOfType_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, BOOL))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2, *(_QWORD *)(a1 + 40) == 1);
}

- (id)presentingViewControllerForPrivacySheet
{
  void *v2;
  void *v3;

  -[UIDictationController dictationPresenterWindow](self, "dictationPresenterWindow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rootViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_presentPrivacySheetForType:(int64_t)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id privacySheetDismissalHandler;
  _UIDictationPrivacySheetController *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  UIVisualEffectView *v16;
  void *v17;
  UIVisualEffectView *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _UIDictationPrivacySheetController *v23;
  id v24;

  v6 = a4;
  -[UIDictationController _createDictationPresenterWindowIfNecessary](self, "_createDictationPresenterWindowIfNecessary");
  v7 = _Block_copy(v6);

  privacySheetDismissalHandler = self->_privacySheetDismissalHandler;
  self->_privacySheetDismissalHandler = v7;

  v9 = [_UIDictationPrivacySheetController alloc];
  if (a3 == 1)
  {
    v10 = -[_UIDictationPrivacySheetController initWithType:](v9, "initWithType:", 1);
  }
  else
  {
    v23 = -[_UIDictationPrivacySheetController initWithType:](v9, "initWithType:", 2);
    -[_UIDictationPrivacySheetController setPresentationDelegate:](v23, "setPresentationDelegate:", self);
    v10 = (uint64_t)v23;
  }
  v24 = (id)v10;
  -[UIDictationController setDictationPrivacySheetController:](self, "setDictationPrivacySheetController:", v10);
  -[UIDictationController dictationPrivacySheetController](self, "dictationPrivacySheetController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPrivacyDelegate:", self);

  -[UIDictationController dictationPrivacySheetController](self, "dictationPrivacySheetController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "presentationController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setDelegate:", self);

  -[UIDictationController presentingWindowForPrivacySheet](self, "presentingWindowForPrivacySheet");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "makeKeyAndVisible");

  if (+[UIDictationUtilities _isUsingLargeFormatDictationUI](UIDictationUtilities, "_isUsingLargeFormatDictationUI"))
  {
    -[UIDictationController presentingWindowForPrivacySheet](self, "presentingWindowForPrivacySheet");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = [UIVisualEffectView alloc];
    +[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[UIVisualEffectView initWithEffect:](v16, "initWithEffect:", v17);

    objc_msgSend(v15, "bounds");
    -[UIView setFrame:](v18, "setFrame:");
    objc_msgSend(v15, "insertSubview:atIndex:", v18, 0);

  }
  if (a3 == 1)
  {
    objc_msgSend(v24, "privacyPresenter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIDictationController presentingViewControllerForPrivacySheet](self, "presentingViewControllerForPrivacySheet");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setPresentingViewController:", v20);

    objc_msgSend(v24, "privacyPresenter");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "present");
  }
  else
  {
    -[UIDictationController presentingViewControllerForPrivacySheet](self, "presentingViewControllerForPrivacySheet");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIDictationController dictationPrivacySheetController](self, "dictationPrivacySheetController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "presentViewController:animated:completion:", v22, 1, 0);

  }
  -[UIDictationController setDictationInfoOnScreenNotifyKey:](self, "setDictationInfoOnScreenNotifyKey:", 1);

}

- (void)dictationPrivacySheetControllerDidFinish:(id)a3
{
  void *v4;
  _QWORD v5[5];

  -[UIDictationController presentingViewControllerForPrivacySheet](self, "presentingViewControllerForPrivacySheet", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __66__UIDictationController_dictationPrivacySheetControllerDidFinish___block_invoke;
  v5[3] = &unk_1E16B1B28;
  v5[4] = self;
  objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, v5);

}

void __66__UIDictationController_dictationPrivacySheetControllerDidFinish___block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__UIDictationController_dictationPrivacySheetControllerDidFinish___block_invoke_2;
  block[3] = &unk_1E16B1B28;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __66__UIDictationController_dictationPrivacySheetControllerDidFinish___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handlePrivacySheetDismissal");
}

- (void)_handlePrivacySheetDismissal
{
  void *v3;
  uint64_t v4;
  id privacySheetDismissalHandler;
  BOOL v6;
  _QWORD *v7;
  id v8;
  void (*v9)(void);
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t);
  void *v14;
  UIDictationController *v15;
  id v16;
  BOOL v17;

  -[UIDictationController dictationPrivacySheetController](self, "dictationPrivacySheetController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "sheetType");

  -[UIDictationController setDictationPrivacySheetController:](self, "setDictationPrivacySheetController:", 0);
  privacySheetDismissalHandler = self->_privacySheetDismissalHandler;
  if (privacySheetDismissalHandler)
  {
    v6 = v4 == 1;
    v7 = _Block_copy(privacySheetDismissalHandler);
    v8 = self->_privacySheetDismissalHandler;
    self->_privacySheetDismissalHandler = 0;

    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __53__UIDictationController__handlePrivacySheetDismissal__block_invoke;
    v14 = &unk_1E16D4820;
    v17 = v6;
    v15 = self;
    v16 = v7;
    v9 = (void (*)(void))v7[2];
    v10 = v7;
    v9();

  }
}

uint64_t __53__UIDictationController__handlePrivacySheetDismissal__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  if (*(_BYTE *)(a1 + 48) && (objc_msgSend((id)UIApp, "isSuspended") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_presentOptInAlertWithCompletion:", *(_QWORD *)(a1 + 40));
    return 0;
  }
  else
  {
    v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", 1);
    v3 = (void *)qword_1ECD79678;
    qword_1ECD79678 = v2;

    objc_msgSend(MEMORY[0x1E0DBDB40], "dismissedDataSharingWithResponse:", 0);
    return MEMORY[0x1E0C9AAB0];
  }
}

- (void)_handleDataSharingSheetDecision
{
  id privacySheetDismissalHandler;
  id v4;
  void (**v5)(id, void *);

  -[UIDictationController setDictationPrivacySheetController:](self, "setDictationPrivacySheetController:", 0);
  privacySheetDismissalHandler = self->_privacySheetDismissalHandler;
  if (privacySheetDismissalHandler)
  {
    v5 = (void (**)(id, void *))_Block_copy(privacySheetDismissalHandler);
    v4 = self->_privacySheetDismissalHandler;
    self->_privacySheetDismissalHandler = 0;

    v5[2](v5, &__block_literal_global_724);
  }
}

uint64_t __56__UIDictationController__handleDataSharingSheetDecision__block_invoke()
{
  return MEMORY[0x1E0C9AAB0];
}

- (void)_touchPhaseChangedForTouch:(id)a3
{
  uint64_t v4;
  void *v5;
  id v6;

  v4 = objc_msgSend(a3, "phase");
  if ((unint64_t)(v4 - 3) <= 1)
  {
    if (v4 == 3)
    {
      self->_reasonType = 7;
      -[UIDictationController stopDictation](self, "stopDictation");
    }
    else
    {
      -[UIDictationController cancelDictation](self, "cancelDictation");
    }
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[UIDictationController keyboardInputModeToReturn](self, "keyboardInputModeToReturn");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setKeyboardInputMode:userInitiated:", v5, 0);

  }
}

- (void)switchToDictationInputMode
{
  id v3;

  if (objc_msgSend((id)objc_opt_class(), "shouldForwardEventsToInputSystemUI"))
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "forwardDictationEvent_switchToDictationInputModeWithOptions:", 0);

  }
  else
  {
    -[UIDictationController switchToDictationInputModeWithTouch:options:](self, "switchToDictationInputModeWithTouch:options:", 0, 0);
  }
}

- (void)switchToDictationInputModeWithOptions:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (objc_msgSend((id)objc_opt_class(), "shouldForwardEventsToInputSystemUI"))
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "forwardDictationEvent_switchToDictationInputModeWithOptions:", v5);

  }
  else
  {
    -[UIDictationController switchToDictationInputModeWithTouch:options:](self, "switchToDictationInputModeWithTouch:options:", 0, v5);
  }

}

- (_NSRange)_getRangeOfString:(id)a3 inDocumentText:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  NSUInteger v12;
  NSUInteger v13;
  NSUInteger v14;
  NSUInteger v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, void *, void *);
  void *v19;
  id v20;
  id v21;
  _NSRange result;

  v5 = a3;
  v6 = (void *)objc_msgSend(a4, "mutableCopy");
  v7 = (void *)objc_msgSend(v5, "mutableCopy");

  if (qword_1ECD79698 != -1)
    dispatch_once(&qword_1ECD79698, &__block_literal_global_725);
  v8 = (void *)qword_1ECD79690;
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __58__UIDictationController__getRangeOfString_inDocumentText___block_invoke_734;
  v19 = &unk_1E16D4868;
  v20 = v6;
  v21 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", &v16);
  v11 = objc_msgSend(v10, "rangeOfString:", v9, v16, v17, v18, v19);
  v13 = v12;

  v14 = v11;
  v15 = v13;
  result.length = v15;
  result.location = v14;
  return result;
}

void __58__UIDictationController__getRangeOfString_inDocumentText___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[4];
  _QWORD v3[5];

  v3[4] = *MEMORY[0x1E0C80C00];
  v2[0] = &unk_1E1A98658;
  v2[1] = &unk_1E1A98688;
  v3[0] = &unk_1E1A98670;
  v3[1] = &unk_1E1A98670;
  v2[2] = &unk_1E1A986A0;
  v2[3] = &unk_1E1A986D0;
  v3[2] = &unk_1E1A986B8;
  v3[3] = &unk_1E1A986B8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 4);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECD79690;
  qword_1ECD79690 = v0;

}

uint64_t __58__UIDictationController__getRangeOfString_inDocumentText___block_invoke_734(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "_replaceOccurrencesOfCharacter:withCharacter:", objc_msgSend(v7, "longValue"), objc_msgSend(v6, "longValue"));
  v8 = *(void **)(a1 + 40);
  v9 = objc_msgSend(v7, "longValue");

  v10 = objc_msgSend(v6, "longValue");
  return objc_msgSend(v8, "_replaceOccurrencesOfCharacter:withCharacter:", v9, v10);
}

- (void)cancelDictation
{
  void *v3;
  void *v4;
  NSObject *v5;
  int v6;
  unint64_t reasonType;
  void *v8;
  void *v9;
  __CFString *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  void *v29;
  objc_class *v30;
  id v31;
  void *v32;
  void *v33;
  char v34;
  void *v35;
  char v36;
  void *v37;
  void *v38;
  BOOL v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  BOOL v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  _BOOL4 v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  NSObject *v54;
  id v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t v59;
  _QWORD v60[8];
  _QWORD v61[8];
  _BYTE buf[40];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend((id)objc_opt_class(), "shouldForwardEventsToInputSystemUI"))
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v55 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "forwardDictationEvent_cancelDictation");

  }
  else
  {
    -[UIDictationController resetAdaptiveDeleteActivationLogic](self, "resetAdaptiveDeleteActivationLogic");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[UIDictationController cancelDictation]");

    if (-[UIDictationController isIgnoringDocumentChanges](self, "isIgnoringDocumentChanges")
      && !self->_deferredCancellationRequested
      && !self->_recievingResults)
    {
      UIKeyboardGetCurrentInputMode();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      TIStatisticGetKeyForInputMode();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      TIStatisticScalarIncrement();

    }
    _UIDictationControllerLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = -[UIDictationController state](self, "state");
      reasonType = self->_reasonType;
      objc_msgSend((id)objc_opt_class(), "UIDictationStartStopReasonTypeDescription:", reasonType);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "-[UIDictationController cancelDictation]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v6;
      *(_WORD *)&buf[18] = 2048;
      *(_QWORD *)&buf[20] = reasonType;
      *(_WORD *)&buf[28] = 2112;
      *(_QWORD *)&buf[30] = v8;
      _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_DEFAULT, "%s State: %d, reason: %lu, reason string: %@", buf, 0x26u);

    }
    if (-[UIDictationController state](self, "state")
      && (!-[UIDictationController isIgnoringDocumentChanges](self, "isIgnoringDocumentChanges")
       || self->_deferredCancellationRequested))
    {
      -[UIDictationController smartLanguageSelectionOverrideLanguage](self, "smartLanguageSelectionOverrideLanguage");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        -[UIDictationController smartLanguageSelectionOverrideLanguage](self, "smartLanguageSelectionOverrideLanguage");
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v11 = 3;
      }
      else
      {
        -[UIDictationController detectedLanguage](self, "detectedLanguage");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          -[UIDictationController detectedLanguage](self, "detectedLanguage");
          v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v11 = 4;
        }
        else
        {
          -[UIDictationController initialDictationLanguage](self, "initialDictationLanguage");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
          {
            -[UIDictationController initialDictationLanguage](self, "initialDictationLanguage");
            v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v11 = -[UIDictationController dictationSourceType](self, "dictationSourceType");
          }
          else
          {
            v11 = 0;
            v10 = &stru_1E16EDF20;
          }
        }
      }
      objc_msgSend((id)objc_opt_class(), "UIDictationLanguageSourceType:", v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(getAFAnalyticsClass(), "sharedAnalytics");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v60[0] = CFSTR("cancelDictation");
      objc_msgSend((id)objc_opt_class(), "UIDictationStartStopReasonTypeDescription:", -[UIDictationController reasonType](self, "reasonType"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v61[0] = v16;
      v60[1] = CFSTR("dictationState");
      objc_msgSend((id)objc_opt_class(), "stringForState:", -[UIDictationController state](self, "state"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v61[1] = v17;
      v60[2] = CFSTR("isReceivingResults");
      v18 = -[UIDictationController isRecievingResults](self, "isRecievingResults");
      v19 = MEMORY[0x1E0C9AAA0];
      v20 = MEMORY[0x1E0C9AAB0];
      if (v18)
        v21 = MEMORY[0x1E0C9AAB0];
      else
        v21 = MEMORY[0x1E0C9AAA0];
      v61[2] = v21;
      v60[3] = CFSTR("lastRecognitionText");
      -[UIDictationController lastRecognitionText](self, "lastRecognitionText");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22)
        v23 = v20;
      else
        v23 = v19;
      v61[3] = v23;
      v60[4] = CFSTR("dictationLanguage");
      v60[5] = CFSTR("dictationLanguageSource");
      v61[4] = v10;
      v61[5] = v14;
      v60[6] = CFSTR("keyboardLocaleIdentifier");
      -[UIDictationController currentKeyboardPrimaryLanguage](self, "currentKeyboardPrimaryLanguage");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v61[6] = v24;
      v60[7] = CFSTR("dictationUIInteractionIdentifier");
      -[UIDictationController interactionIdentifier](self, "interactionIdentifier");
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = (void *)v25;
      v27 = &stru_1E16EDF20;
      if (v25)
        v27 = (const __CFString *)v25;
      v61[7] = v27;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v61, v60, 8);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "logEventWithType:context:", 1403, v28);

      v56 = 0;
      v57 = &v56;
      v58 = 0x2050000000;
      v29 = (void *)getSISchemaDictationEndPointCancelClass_softClass;
      v59 = getSISchemaDictationEndPointCancelClass_softClass;
      if (!getSISchemaDictationEndPointCancelClass_softClass)
      {
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __getSISchemaDictationEndPointCancelClass_block_invoke;
        *(_QWORD *)&buf[24] = &unk_1E16B14C0;
        *(_QWORD *)&buf[32] = &v56;
        __getSISchemaDictationEndPointCancelClass_block_invoke((uint64_t)buf);
        v29 = (void *)v57[3];
      }
      v30 = objc_retainAutorelease(v29);
      _Block_object_dispose(&v56, 8);
      v31 = objc_alloc_init(v30);
      objc_msgSend(v31, "setDictationEndPointType:", objc_msgSend((id)objc_opt_class(), "UIDictationStartStopReasonToInstrumentationDictationEndPointType:", self->_reasonType));
      -[AFAnalyticsTurnBasedInstrumentationContext emitInstrumentation:](self->_currentInstrumentationContext, "emitInstrumentation:", v31);
      self->_deferredCancellationRequested = 0;
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "inputDelegateManager");
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      v34 = objc_msgSend(v33, "hasAsyncCapableInputDelegate");
      objc_msgSend(v33, "keyInputDelegate");
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      if (v35)
        v36 = v34;
      else
        v36 = 1;
      if ((v36 & 1) == 0)
      {
        -[UIDictationController lastHypothesis](self, "lastHypothesis");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        if (v37)
        {
          -[UIDictationController targetHypothesis](self, "targetHypothesis");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = v38 == 0;

          if (!v39)
          {
            -[UIDictationController lastHypothesis](self, "lastHypothesis");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            -[UIDictationController _hypothesisRangeFromSelectionRange:inputDelegateManager:forHypothesis:](self, "_hypothesisRangeFromSelectionRange:inputDelegateManager:forHypothesis:", 0, v33, v40);
            v41 = (void *)objc_claimAutoreleasedReturnValue();

            +[UIDictationLandingView activeInstance](UIDictationLandingView, "activeInstance");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "superview");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v44 = v43 == 0;

            if (!v44)
            {
              -[UIDictationController _rangeByExtendingRange:backward:forward:inputDelegateManager:](self, "_rangeByExtendingRange:backward:forward:inputDelegateManager:", v41, +[UIDictationLandingView fallbackPlaceholderLength](UIDictationLandingView, "fallbackPlaceholderLength"), 0, v33);
              v45 = objc_claimAutoreleasedReturnValue();

              v41 = (void *)v45;
            }
            objc_msgSend(v33, "textInRange:", v41);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            if (v46)
            {
              -[UIDictationController lastHypothesis](self, "lastHypothesis");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              if (v47)
              {
                -[UIDictationController lastHypothesis](self, "lastHypothesis");
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                v49 = -[UIDictationController _getRangeOfString:inDocumentText:](self, "_getRangeOfString:inDocumentText:", v48, v46) == 0x7FFFFFFFFFFFFFFFLL;

                if (v49)
                {
                  -[UIDictationController setTargetHypothesis:](self, "setTargetHypothesis:", 0);
                  -[UIDictationController setLastHypothesis:](self, "setLastHypothesis:", 0);
                  -[UIDictationController setPendingEdits:](self, "setPendingEdits:", 0);
                  -[UIDictationController _stopStreamingAnimation](self, "_stopStreamingAnimation");
                }
              }
            }

          }
        }
      }
      -[UIDictationController _setupHypothesisAsFinalResults](self, "_setupHypothesisAsFinalResults");
      if (-[UIDictationController state](self, "state") == 2)
      {
        objc_msgSend(v33, "_textSelectingContainer");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v50, "dictationRecordingDidEnd");
        if (!self->_recievingResults)
        {
          UIKeyboardGetCurrentInputMode();
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          TIStatisticGetKeyForInputMode();
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          TIStatisticScalarIncrement();

        }
      }
      -[UIDictationController dictationConnection](self, "dictationConnection");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "cancelSpeech");

      -[UIDictationController setState:](self, "setState:", 0);
      -[UIDictationController cancelRecordingLimitTimer](self, "cancelRecordingLimitTimer");
      -[UIDictationController switchToKeyboardInputModeIfNeeded](self, "switchToKeyboardInputModeIfNeeded");
      -[UIDictationController postNotificationName:userInfo:](self, "postNotificationName:userInfo:", CFSTR("UIDictationControllerDictationDidFinish"), 0);
      -[UIDictationController setCurrentKeyboardPrimaryLanguage:](self, "setCurrentKeyboardPrimaryLanguage:", &stru_1E16EDF20);
      _UIDictationControllerUndoRedoLog();
      v54 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&buf[4] = "-[UIDictationController cancelDictation]";
        _os_log_impl(&dword_185066000, v54, OS_LOG_TYPE_DEFAULT, "%s Ending undo grouping if necessary", buf, 0xCu);
      }

      -[UIDictationController _endUndoGroupingIfNecessary](self, "_endUndoGroupingIfNecessary");
    }
  }
}

- (void)cancelDictationForTextStoreChangesInResponder:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;

  v7 = a3;
  if (!-[UIDictationController isDetectingUtterances](self, "isDetectingUtterances")
    && !-[UIDictationController isIgnoringDocumentChanges](self, "isIgnoringDocumentChanges"))
  {
    if (+[UIDictationController isRunning](UIDictationController, "isRunning"))
    {
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "inputDelegateManager");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "delegateAsResponder");
      v6 = (id)objc_claimAutoreleasedReturnValue();

      if (v6 == v7)
      {
        self->_deferredCancellationRequested = 1;
        -[UIDictationController _startStreamingAnimations](self, "_startStreamingAnimations");
      }
    }
  }

}

- (void)stopAndCancelDictationWithReasonType:(unint64_t)a3
{
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  unint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (+[UIDictationController isRunning](UIDictationController, "isRunning"))
  {
    _UIDictationControllerLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315394;
      v7 = "-[UIDictationController stopAndCancelDictationWithReasonType:]";
      v8 = 2048;
      v9 = a3;
      _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_DEFAULT, "%s reasonType=%lu", (uint8_t *)&v6, 0x16u);
    }

  }
  -[UIDictationController setReasonType:](self, "setReasonType:", a3);
  -[UIDictationController stopDictation](self, "stopDictation");
  -[UIDictationController cancelDictation](self, "cancelDictation");
}

void __84__UIDictationController_cancelDictationForResponderIfNeeded_wantsKeyboard_isPencil___block_invoke()
{
  void *v0;
  id v1;

  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "preferencesActions");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  byte_1ECD7965B = objc_msgSend(v0, "BOOLForPreferenceKey:", CFSTR("DictationDisableTapAnywhereToDisable"));

}

Class __84__UIDictationController_cancelDictationForResponderIfNeeded_wantsKeyboard_isPencil___block_invoke_2()
{
  Class result;

  qword_1ECD796B0 = (uint64_t)NSClassFromString(CFSTR("EMKOverlayView"));
  qword_1ECD796B8 = (uint64_t)NSClassFromString(CFSTR("NUIContainerStackView"));
  qword_1ECD796C0 = (uint64_t)NSClassFromString(CFSTR("MFMailComposeToField"));
  qword_1ECD796C8 = (uint64_t)NSClassFromString(CFSTR("MFComposeSubjectView"));
  result = NSClassFromString(CFSTR("CNComposeRecipientAtom"));
  qword_1ECD796D0 = (uint64_t)result;
  return result;
}

- (void)stopAndCancelDictationIfNeededWithReasonType:(unint64_t)a3
{
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  _BOOL4 v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (+[UIDictationController isRunning](UIDictationController, "isRunning"))
  {
    _UIDictationControllerLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315394;
      v7 = "-[UIDictationController stopAndCancelDictationIfNeededWithReasonType:]";
      v8 = 1024;
      v9 = -[UIDictationController isFinalizingRecognizedUtterance](self, "isFinalizingRecognizedUtterance");
      _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_DEFAULT, "%s isFinalizingRecognizedUtterance=%d", (uint8_t *)&v6, 0x12u);
    }

  }
  if (!-[UIDictationController isFinalizingRecognizedUtterance](self, "isFinalizingRecognizedUtterance"))
    -[UIDictationController stopAndCancelDictationWithReasonType:](self, "stopAndCancelDictationWithReasonType:", a3);
}

- (void)stopDictation
{
  self->_ignoreUserInteraction = 1;
  -[UIDictationController stopDictation:](self, "stopDictation:", 1);
  self->_ignoreUserInteraction = 0;
}

- (void)stopDictationAndResignFirstResponder
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  _UIDictationControllerLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[UIDictationController stopDictationAndResignFirstResponder]";
    _os_log_impl(&dword_185066000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  -[UIDictationController setShouldStayInDictationInputMode:](self, "setShouldStayInDictationInputMode:", 1);
  -[UIDictationController stopAndCancelDictationWithReasonType:](self, "stopAndCancelDictationWithReasonType:", 18);
  +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "inputDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resignFirstResponder");

}

- (void)forceDictationReturnToKeyboardInputMode
{
  void *v3;
  char v4;
  void *v5;
  id v6;

  +[UIDictationView sharedInstance](UIDictationView, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "switchingLanguage");

  if ((v4 & 1) == 0)
  {
    if (-[UIDictationController shouldStayInDictationInputMode](self, "shouldStayInDictationInputMode"))
    {
      -[UIDictationController setShouldStayInDictationInputMode:](self, "setShouldStayInDictationInputMode:", 0);
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      -[UIDictationController keyboardInputModeToReturn](self, "keyboardInputModeToReturn");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setKeyboardInputMode:userInitiated:", v5, 0);

    }
  }
}

- (BOOL)isIgnoringDocumentChanges
{
  return self->_updatingDocument > 0;
}

- (void)performIgnoringDocumentChanges:(id)a3
{
  ++self->_updatingDocument;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  --self->_updatingDocument;
}

- (BOOL)isIgnoringRTIChanges
{
  return self->_ignoreRTIChanges > 0;
}

- (void)performIgnoringRTIChanges:(id)a3
{
  ++self->_ignoreRTIChanges;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  --self->_ignoreRTIChanges;
}

+ (id)streamingHypothesisForPhrases:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(a3, "copy");
  objc_msgSend(v3, "setFromKeyboard:", 0);
  objc_msgSend(v3, "setTransform:", 0);
  objc_msgSend(v3, "setUseServerCapitalization:", 1);
  objc_msgSend(v3, "bestText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (__CFString)resultTransformForLanguageModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIDictationController language](self, "language");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "keyboardLanguageForDictationLanguage:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "isEqualToString:", CFSTR("zh_Hans")))
    {
      v8 = CFSTR("Traditional-Simplified");
      if ((objc_msgSend(v4, "isEqualToString:", CFSTR("zh_HK")) & 1) == 0
        && !objc_msgSend(v4, "isEqualToString:", CFSTR("zh_TW")))
      {
        v8 = 0;
      }
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("zh_Hant")))
    {
      if (objc_msgSend(v4, "hasSuffix:", CFSTR("CN")))
        v8 = CFSTR("Simplified-Traditional");
      else
        v8 = 0;
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)logDidAcceptDictationResult:(id)a3 reasonType:(unint64_t)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a3;
  -[UIDictationController dictationConnection](self, "dictationConnection");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  +[UIDictationController UIDictationStartStopReasonTypeDescription:](UIDictationController, "UIDictationStartStopReasonTypeDescription:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "logDidAcceptDictationResult:reason:result:correctionIdentifier:", v6, v7, self->_lastRecognitionText, self->_lastCorrectionIdentifier);

}

- (void)logDidAcceptReplacement:(id)a3 replacementLanguageCode:(id)a4 originalText:(id)a5 correctionIdentifier:(id)a6 interactionIdentifier:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  -[UIDictationController dictationConnection](self, "dictationConnection");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "logDidAcceptReplacement:replacementLanguageCode:originalText:correctionIdentifier:interactionIdentifier:", v16, v15, v14, v13, v12);

}

- (void)didShowAlternatives:(id)a3 correctionIdentifier:(id)a4 interactionIdentifier:(id)a5 instrumentationContext:(id)a6 dictationLanguage:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  objc_msgSend((id)objc_opt_class(), "instrumentationDictationAlternativesViewedWithInstrumentationContext:alternatives:dictationLanguage:", v13, v16, v12);

  -[UIDictationController dictationConnection](self, "dictationConnection");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "logDidShowAlternatives:correctionIdentifier:interactionIdentifier:", v16, v15, v14);

}

- (void)logAlternativeSelected:(id)a3 correctionIdentifier:(id)a4 interactionIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[UIDictationController dictationConnection](self, "dictationConnection");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "logDidSelectAlternative:correctionIdentifier:interactionIdentifier:", v10, v9, v8);

}

- (id)resultWithTrailingSpace:(id)a3
{
  return (id)objc_msgSend(a3, "arrayByAddingObject:", &unk_1E1A93EC0);
}

- (void)insertSerializedDictationResult:(id)a3 withCorrectionIdentifier:(id)a4
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t);
  void *v23;
  UIDictationController *v24;
  id v25;
  id v26;

  v18 = a3;
  v7 = a4;
  if (objc_msgSend((id)objc_opt_class(), "shouldForwardInInputSystemUI"))
  {
    v20 = MEMORY[0x1E0C809B0];
    v21 = 3221225472;
    v22 = __82__UIDictationController_insertSerializedDictationResult_withCorrectionIdentifier___block_invoke;
    v23 = &unk_1E16B47A8;
    v24 = self;
    v8 = v18;
    v25 = v8;
    v9 = v7;
    v26 = v9;
    -[UIDictationController performIgnoringDocumentChanges:](self, "performIgnoringDocumentChanges:", &v20);
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "inputDelegateManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "inputSystemSourceSession");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12 && !-[UIDictationController isIgnoringRTIChanges](self, "isIgnoringRTIChanges"))
    {
      objc_msgSend(v12, "textOperations");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v15 = (void *)objc_msgSend(v8, "copy");
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, CFSTR("dictationResult"));

        NSStringFromSelector(a2);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v16, CFSTR("selector"));

        if (v9)
          objc_msgSend(v14, "setObject:forKeyedSubscript:", v9, CFSTR("correctionIdentifier"));
        objc_msgSend(v13, "setCustomInfoType:", 0x1E1750220, v18, v20, v21, v22, v23, v24, v25);
        objc_msgSend(v13, "setCustomInfo:", v14);
        objc_msgSend(v12, "flushOperations");
        -[UIDictationController forceOOPDocumentStateSync](self, "forceOOPDocumentStateSync");
      }

    }
  }
  else
  {
    -[UIDictationController _insertSerializedDictationResult:withCorrectionIdentifier:](self, "_insertSerializedDictationResult:withCorrectionIdentifier:", v18, v7);
  }
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance", v18);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "touchDictationMenuTimer");

}

uint64_t __82__UIDictationController_insertSerializedDictationResult_withCorrectionIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_insertSerializedDictationResult:withCorrectionIdentifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_insertSerializedDictationResult:(id)a3 withCorrectionIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  int v15;
  int v16;
  void *v17;
  void *v18;
  UIDictationController *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSString *selectedTextAtStart;
  uint64_t v30;
  UIDictationController *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t i;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  UIDictationController *v46;
  int v47;
  id v48;
  id v49;
  id v50;
  void *v51;
  void *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint8_t v57[128];
  uint8_t buf[4];
  const char *v59;
  __int16 v60;
  int v61;
  __int16 v62;
  int v63;
  __int16 v64;
  int v65;
  __int16 v66;
  uint64_t v67;
  __int16 v68;
  uint64_t v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "inputDelegateManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "keyInputDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "inputDelegateManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "privateInputDelegate");
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "inputDelegateManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_textSelectingContainer");
  v13 = objc_claimAutoreleasedReturnValue();

  _UIDictationControllerLog();
  v14 = objc_claimAutoreleasedReturnValue();
  v52 = (void *)v13;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v49 = v7;
    v47 = objc_msgSend(v6, "showMultilingualAlternatives");
    v15 = objc_msgSend(v6, "lowConfidenceAboutLanguageDetection");
    v16 = objc_msgSend(v6, "allowsAlternatives");
    objc_msgSend(v6, "multilingualAlternatives");
    v17 = v6;
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = self;
    v20 = objc_msgSend(v18, "count");
    objc_msgSend(v17, "bestTextForMultilingualAlternatives");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136316418;
    v59 = "-[UIDictationController _insertSerializedDictationResult:withCorrectionIdentifier:]";
    v60 = 1024;
    v61 = v47;
    v62 = 1024;
    v63 = v15;
    v64 = 1024;
    v65 = v16;
    v66 = 2048;
    v67 = v20;
    self = v19;
    v68 = 2048;
    v69 = objc_msgSend(v21, "count");
    v7 = v49;
    _os_log_impl(&dword_185066000, v14, OS_LOG_TYPE_DEFAULT, "%s showMultilingualAlternatives=%d, lowConfidenceAboutLanguageDetection=%d, allowsAlternatives=%d, multilingualAlternatives count=%lu bestTextForMultilingualAlternatives=%lu", buf, 0x32u);

    v13 = (uint64_t)v52;
    v6 = v17;
  }

  -[UIDictationController instrumentationDictationTranscriptionMetadataEmitInstrumentationWithDictationResult:](self, "instrumentationDictationTranscriptionMetadataEmitInstrumentationWithDictationResult:", v6);
  v22 = v51;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Inserting into private input delegate: %@ public input delegate: %@"), "-[UIDictationController _insertSerializedDictationResult:withCorrectionIdentifier:]", v51, v13);

  objc_msgSend(v6, "bestText");
  v23 = (void *)v13;
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIDictationController setLastRecognitionText:](self, "setLastRecognitionText:", v24);

  -[UIDictationController setLastCorrectionIdentifier:](self, "setLastCorrectionIdentifier:", v7);
  if (!+[UIDictationController viewMode](UIDictationController, "viewMode"))
  {
    objc_msgSend(v6, "bestResults");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "bestText");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIDictationController setLastRecognitionText:](self, "setLastRecognitionText:", v26);

    objc_msgSend(v8, "inputDelegate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "insertDictationResult:withCorrectionIdentifier:", v25, v25);

    goto LABEL_7;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "dictationPhraseArray");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "insertDictationResult:", v25);
LABEL_7:

    goto LABEL_8;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v51, "insertDictationResult:withCorrectionIdentifier:", v6, v7);
  }
  else
  {
    objc_msgSend(v8, "inputDelegateManager");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "hasAsyncCapableInputDelegate");

    if (!v34)
    {
      objc_msgSend(v6, "bestText");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "insertText:", v25);
      goto LABEL_7;
    }
    v46 = self;
    v48 = v6;
    v50 = v7;
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    objc_msgSend(v6, "dictationPhraseArray");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
    if (v36)
    {
      v37 = v36;
      v38 = *(_QWORD *)v54;
      do
      {
        for (i = 0; i != v37; ++i)
        {
          if (*(_QWORD *)v54 != v38)
            objc_enumerationMutation(v35);
          v40 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
          objc_msgSend(v40, "alternativeInterpretations");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = objc_msgSend(v41, "count");

          if (v42)
          {
            objc_msgSend(v8, "inputDelegateManager");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "text");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "alternativeInterpretations");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "insertText:alternatives:style:", v44, v45, objc_msgSend(v40, "style"));

          }
          else
          {
            objc_msgSend(v40, "text");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "insertText:", v43);
          }

        }
        v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
      }
      while (v37);
    }

    v6 = v48;
    v7 = v50;
    self = v46;
    v22 = v51;
  }
LABEL_8:
  if (!-[UIDictationController hasInsertedAtLeastOneSerializedDictationResult](self, "hasInsertedAtLeastOneSerializedDictationResult"))-[UIDictationController setHasInsertedAtLeastOneSerializedDictationResult:](self, "setHasInsertedAtLeastOneSerializedDictationResult:", 1);
  objc_msgSend(v6, "bestText");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  selectedTextAtStart = self->_selectedTextAtStart;
  -[UIDictationController language](self, "language");
  v30 = objc_claimAutoreleasedReturnValue();
  v31 = self;
  v32 = (void *)v30;
  +[UIKBAnalyticsDispatcher didInsertText:relativeRangeBefore:selectedTextBefore:withLanguage:](UIKBAnalyticsDispatcher, "didInsertText:relativeRangeBefore:selectedTextBefore:withLanguage:", v28, v31->_relativeRangeBefore.location, v31->_relativeRangeBefore.length, selectedTextAtStart, v30);

  objc_msgSend(v8, "assertTextForDictation");
  objc_msgSend(v8, "syncDocumentStateToInputDelegate");
  objc_msgSend(v8, "_requestInputManagerSync");

}

- (void)_deleteBackwardIntoText
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0CB3940];
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inputDelegateManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "keyInputDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%s Deleting text from input delegate: %@"), "-[UIDictationController _deleteBackwardIntoText]", v5);

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "inputDelegateManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deleteBackward");

}

- (void)_clearExistingText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inputDelegateManager");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0CB3940];
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "inputDelegateManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "keyInputDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%s Clearing text from input delegate: %@"), "-[UIDictationController _clearExistingText]", v7);

  -[UIDictationController setCanUndoOrRedo:](self, "setCanUndoOrRedo:", 0);
  objc_msgSend(v11, "beginningOfDocument");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "endOfDocument");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "textRangeFromPosition:toPosition:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "replaceRange:withText:", v10, &stru_1E16EDF20);
  -[UIDictationController setCanUndoOrRedo:](self, "setCanUndoOrRedo:", 1);

}

- (void)finalizeDictationRecognitionWithPhrases:(id)a3 languageModel:(id)a4 correctionIdentifier:(id)a5 secureInput:(BOOL)a6 finalResult:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  void *v28;
  _BOOL8 v29;
  void *v30;
  _BOOL4 v31;
  void *v32;
  __CFString *v33;
  __CFString *v34;
  void *v35;
  void *v36;
  void *v37;
  __CFString *v38;
  __CFString *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  uint8_t buf[4];
  const char *v47;
  uint64_t v48;

  v7 = a7;
  v8 = a6;
  v48 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  if (self->_ignoreFinalizePhrases)
  {
    _UIDictationControllerLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v47 = "-[UIDictationController finalizeDictationRecognitionWithPhrases:languageModel:correctionIdentifier:secureInp"
            "ut:finalResult:]";
      _os_log_impl(&dword_185066000, v15, OS_LOG_TYPE_DEFAULT, "%s Finalize phrases ignored", buf, 0xCu);
    }

    if (+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
      -[UIDictationController setShadowState:](self, "setShadowState:", 0);
    else
      -[UIDictationController setState:](self, "setState:", 0);
    goto LABEL_32;
  }
  v45 = v13;
  -[UIDictationController setCanUndoOrRedo:](self, "setCanUndoOrRedo:", 0);
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "inputDelegateManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "asyncCapableInputDelegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "inputDelegateManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v18)
    objc_msgSend(v19, "asyncCapableInputDelegate");
  else
    objc_msgSend(v19, "asyncWebKitInteractionDelegate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v21, "willInsertFinalDictationResult");
  -[UIDictationController setSuppressDelegateTextInputDidChangeNotifications:](self, "setSuppressDelegateTextInputDidChangeNotifications:", 1, v21);
  -[UIDictationController lastHypothesis](self, "lastHypothesis");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIDictationController updateLastHypothesis:WithNewHypothesis:](self, "updateLastHypothesis:WithNewHypothesis:", v22, &stru_1E16EDF20);

  -[UIDictationController setSuppressDelegateTextInputDidChangeNotifications:](self, "setSuppressDelegateTextInputDidChangeNotifications:", 0);
  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "delegate");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_opt_respondsToSelector();

  if ((v25 & 1) != 0)
  {
    +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "delegate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "dictationRequestDidSucceed");

  }
  objc_msgSend(v12, "bestText");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v28, "length"))
    v29 = +[UIDictationUtilities needsTrailingSpaceForPhrases:secureInput:](UIDictationUtilities, "needsTrailingSpaceForPhrases:secureInput:", v12, v8);
  else
    v29 = 0;

  objc_msgSend(v12, "bestText");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v30, "length"))
  {
    v31 = +[UIDictationUtilities needsLeadingSpaceForPhrases:secureInput:](UIDictationUtilities, "needsLeadingSpaceForPhrases:secureInput:", v12, v8);

    if (v31)
    {
      -[UIDictationController setSuppressDelegateTextInputDidChangeNotifications:](self, "setSuppressDelegateTextInputDidChangeNotifications:", 1);
      -[UIDictationController lastHypothesis](self, "lastHypothesis");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = CFSTR(" ");
      -[UIDictationController updateLastHypothesis:WithNewHypothesis:](self, "updateLastHypothesis:WithNewHypothesis:", v32, CFSTR(" "));

      -[UIDictationController setSuppressDelegateTextInputDidChangeNotifications:](self, "setSuppressDelegateTextInputDidChangeNotifications:", 0);
      objc_msgSend(v16, "forceShiftUpdate");
      byte_1ECD79659 = objc_msgSend(v16, "isShifted");
      goto LABEL_22;
    }
  }
  else
  {

  }
  v33 = &stru_1E16EDF20;
LABEL_22:
  -[UIDictationController setCanUndoOrRedo:](self, "setCanUndoOrRedo:", 1);
  v34 = -[UIDictationController resultTransformForLanguageModel:](self, "resultTransformForLanguageModel:", v45);
  v35 = (void *)objc_msgSend(v12, "copy");
  objc_msgSend(v35, "setFromKeyboard:", 1);
  objc_msgSend(v35, "setTransform:", v34);
  if (!v7
    && -[UIDictationController hasInsertedAtLeastOneSerializedDictationResult](self, "hasInsertedAtLeastOneSerializedDictationResult"))
  {
    v8 = 1;
  }
  objc_msgSend(v35, "setUseServerCapitalization:", v8);
  objc_msgSend(v35, "setAddTrailingSpace:", v29);
  objc_msgSend(v35, "setIsFinalResult:", v7);
  objc_msgSend(v35, "bestText");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[__CFString stringByAppendingString:](v33, "stringByAppendingString:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIDictationController visibleContextBeforeInputAtCommandExecution](self, "visibleContextBeforeInputAtCommandExecution");
  v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v39 = v38;
  if (!v38)
    v38 = &stru_1E16EDF20;
  -[__CFString stringByAppendingString:](v38, "stringByAppendingString:", v37);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIDictationController setVisibleContextBeforeInputAtCommandExecution:](self, "setVisibleContextBeforeInputAtCommandExecution:", v40);

  -[UIDictationController insertSerializedDictationResult:withCorrectionIdentifier:](self, "insertSerializedDictationResult:withCorrectionIdentifier:", v35, v14);
  objc_msgSend(v16, "updateReturnKey:", 0);
  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "currentInputModeInPreference");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "updateLastUsedInputMode:", v43);

  -[UIDictationController setSelectionStartWasInitiallyAtParagraphBoundaryForAsyncDelegate:](self, "setSelectionStartWasInitiallyAtParagraphBoundaryForAsyncDelegate:", 0);
  -[UIDictationController setSelectionEndWasInitiallyAtParagraphBoundaryForAsyncDelegate:](self, "setSelectionEndWasInitiallyAtParagraphBoundaryForAsyncDelegate:", 0);
  -[UIDictationController setInitialPreviousCharacterForAsyncDelegate:](self, "setInitialPreviousCharacterForAsyncDelegate:", 0);
  -[UIDictationController setInitialCharacterAfterSelectionForAsyncDelegate:](self, "setInitialCharacterAfterSelectionForAsyncDelegate:", 0);
  if (!v7)
    self->_hasCheckedForLeadingSpaceOnce = 0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v44, "didInsertFinalDictationResult");

  v13 = v45;
LABEL_32:

}

- (void)finishDictationRecognitionWithPhrases:(id)a3 languageModel:(id)a4 correctionIdentifier:(id)a5 secureInput:(BOOL)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t);
  void *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  BOOL v30;
  uint8_t buf[4];
  const char *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (self->_ignoreFinalizePhrases)
  {
    _UIDictationControllerLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v32 = "-[UIDictationController finishDictationRecognitionWithPhrases:languageModel:correctionIdentifier:secureInput:]";
      _os_log_impl(&dword_185066000, v13, OS_LOG_TYPE_DEFAULT, "%s Finalize phrases ignored", buf, 0xCu);
    }

    -[UIDictationController setState:](self, "setState:", 0);
  }
  else
  {
    v14 = -[UIDictationController isRecievingResults](self, "isRecievingResults");
    if (!v14)
    {
      +[UIDictationController streamingHypothesisForPhrases:](UIDictationController, "streamingHypothesisForPhrases:", v10);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v15, "length"))
      {
        -[UIDictationController cancelDictation](self, "cancelDictation");

        goto LABEL_19;
      }

    }
    if (v10)
    {
      objc_msgSend(v10, "phrases");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "count") == 0;

    }
    else
    {
      v17 = 1;
    }
    +[UIDictationLandingView sharedInstance](UIDictationLandingView, "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setWillInsertResult:", !v17);

    if (v14)
    {
      -[UIDictationController streamingOperations](self, "streamingOperations");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "isNotEmpty");

      if (v20)
        v21 = 5;
      else
        v21 = 0;
    }
    else
    {
      v21 = 0;
    }
    objc_initWeak((id *)buf, self);
    v22 = MEMORY[0x1E0C809B0];
    v23 = 3221225472;
    v24 = __110__UIDictationController_finishDictationRecognitionWithPhrases_languageModel_correctionIdentifier_secureInput___block_invoke;
    v25 = &unk_1E16D48B0;
    objc_copyWeak(&v29, (id *)buf);
    v26 = v10;
    v27 = v11;
    v28 = v12;
    v30 = a6;
    -[UIDictationController _setFinalResultHandler:](self, "_setFinalResultHandler:", &v22);
    if (v17)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Recognition succeeded, but there were no results returned."), "-[UIDictationController finishDictationRecognitionWithPhrases:languageModel:correctionIdentifier:secureInput:]", v22, v23, v24, v25, v26, v27);

      v21 = 6;
    }
    -[UIDictationController setState:](self, "setState:", v21);

    objc_destroyWeak(&v29);
    objc_destroyWeak((id *)buf);
  }
LABEL_19:

}

void __110__UIDictationController_finishDictationRecognitionWithPhrases_languageModel_correctionIdentifier_secureInput___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "finalizeDictationRecognitionWithPhrases:languageModel:correctionIdentifier:secureInput:finalResult:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 64), 1);

}

- (id)_voiceCommandGrammarParseResultWithParsePackage:(id)a3 completeCommands:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  const __CFString *v13;
  uint64_t i;
  void *v15;
  void *v16;
  char v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  UIDictationController *v21;
  void *v22;
  unint64_t v23;
  BOOL v24;
  BOOL v25;
  BOOL v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  BOOL v32;
  id v33;
  void *v35;
  void *v36;
  id v37;
  id v38;
  int v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t v45[128];
  uint8_t buf[4];
  const char *v47;
  __int16 v48;
  id v49;
  uint64_t v50;

  v4 = a4;
  v50 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  _UIDictationControllerLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v47 = "-[UIDictationController _voiceCommandGrammarParseResultWithParsePackage:completeCommands:]";
    v48 = 2112;
    v49 = v6;
    _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_DEFAULT, "%s AFVoiceCommandGrammarParsePackage: %@", buf, 0x16u);
  }

  if (v6)
  {
    v37 = v6;
    objc_msgSend(v6, "nBestParses");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "firstObject");
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "parseCandidates");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    if (v9)
    {
      v10 = v9;
      v38 = 0;
      v40 = 0;
      v11 = *(_QWORD *)v42;
      v12 = !v4;
      v13 = CFSTR("Suppressor");
      v39 = v12;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v42 != v11)
            objc_enumerationMutation(v8);
          v15 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
          if ((objc_msgSend(v15, "isComplete") | v12) == 1)
          {
            objc_msgSend(v15, "commandId");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v16, "hasSuffix:", v13);

            if ((v17 & 1) == 0)
            {
              v18 = v11;
              v19 = v8;
              v20 = v13;
              objc_msgSend(v15, "commandId");
              v21 = self;
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = +[UIDictationController commandIdentifierWithStringIdentifier:](UIDictationController, "commandIdentifierWithStringIdentifier:", v22);

              self = v21;
              if (-[UIDictationController shouldSuppressPartialResults](v21, "shouldSuppressPartialResults"))
              {
                v24 = -[UIDictationController isSelectionBasedCommand:](v21, "isSelectionBasedCommand:", v23);
                v13 = v20;
                v8 = v19;
                v11 = v18;
                v12 = v39;
                if (v24)
                  goto LABEL_36;
              }
              else if (v38)
              {
                v13 = v20;
                v8 = v19;
                v11 = v18;
                v12 = v39;
                if (v40 == 14 && v23 == 15)
                  goto LABEL_36;
                v25 = v40 == 23;
                v26 = v23 == 25 && v40 == 23;
                if (v23 != 24)
                  v25 = 0;
                if (v26 || v25)
                {
LABEL_36:
                  v33 = v15;

                  v38 = v33;
                  goto LABEL_38;
                }
                if (v40 == 1)
                {
                  if ((v23 & 0xFFFFFFFFFFFFFFFELL) == 2)
                    goto LABEL_36;
                  v40 = 1;
                }
              }
              else
              {
                v27 = v15;
                v38 = v27;
                if (v23 == 1)
                {
                  v28 = v27;
                  objc_msgSend(v27, "commandId");
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  +[UIDictationUtilities dictationVoiceCommandParametersFromAFVoiceCommandGrammarParseCandidate:](UIDictationUtilities, "dictationVoiceCommandParametersFromAFVoiceCommandGrammarParseCandidate:", v28);
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v28, "voiceCommandUUID");
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  v32 = -[UIDictationController canApplyVoiceCommandWithIdentifier:parameters:commandUtteranceString:voiceCommandUUID:](v21, "canApplyVoiceCommandWithIdentifier:parameters:commandUtteranceString:voiceCommandUUID:", v29, v30, 0, v31);

                  if (v32)
                  {
                    v8 = v19;
                    goto LABEL_38;
                  }
                  v40 = 1;
                  self = v21;
                }
                else
                {
                  v40 = v23;
                }
                v13 = v20;
                v8 = v19;
                v11 = v18;
                v12 = v39;
              }
            }
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
        if (v10)
          continue;
        break;
      }
    }
    else
    {
      v38 = 0;
    }
LABEL_38:

    v6 = v37;
  }
  else
  {
    v38 = 0;
  }

  return v38;
}

- (BOOL)_shouldSuppressPartialForVoiceCommandGrammarParsePackage:(id)a3 commandPartialString:(id)a4
{
  return 0;
}

- (void)dictationConnection:(id)a3 finalizePhrases:(id)a4 languageModel:(id)a5 correctionIdentifier:(id)a6 secureInput:(BOOL)a7 finalResult:(BOOL)a8
{
  _BOOL8 v8;
  _BOOL8 v9;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  NSObject *v21;
  _BOOL4 v22;
  uint8_t buf[4];
  const char *v24;
  uint64_t v25;

  v8 = a8;
  v9 = a7;
  v25 = *MEMORY[0x1E0C80C00];
  v13 = a4;
  v14 = a5;
  v15 = a6;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[UIDictationController dictationConnection:finalizePhrases:languageModel:correctionIdentifier:secureInput:finalResult:]");

  v16 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v13, "bestText");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", CFSTR("%s Best interpretation: '%@'"), "-[UIDictationController dictationConnection:finalizePhrases:languageModel:correctionIdentifier:secureInput:finalResult:]", v17);

  +[UIDictationLandingView activeInstance](UIDictationLandingView, "activeInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v17) = objc_msgSend(v18, "canStopLanding");

  if ((_DWORD)v17)
  {
    +[UIDictationLandingView activeInstance](UIDictationLandingView, "activeInstance");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stopLanding");

  }
  v20 = -[UIDictationController isDetectingUtterances](self, "isDetectingUtterances");
  _UIDictationControllerLog();
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
  if (v20)
  {
    if (v22)
    {
      *(_DWORD *)buf = 136315138;
      v24 = "-[UIDictationController dictationConnection:finalizePhrases:languageModel:correctionIdentifier:secureInput:finalResult:]";
      _os_log_impl(&dword_185066000, v21, OS_LOG_TYPE_DEFAULT, "%s Finalizing detected utterance", buf, 0xCu);
    }

    self->_finalizingRecognizedUtterance = 1;
    -[UIDictationController finalizeDictationRecognitionWithPhrases:languageModel:correctionIdentifier:secureInput:finalResult:](self, "finalizeDictationRecognitionWithPhrases:languageModel:correctionIdentifier:secureInput:finalResult:", v13, v14, v15, v9, v8);
    -[UIDictationController _stopStreamingAnimation](self, "_stopStreamingAnimation");
    -[UIDictationController setTargetHypothesis:](self, "setTargetHypothesis:", 0);
    -[UIDictationController setLastHypothesis:](self, "setLastHypothesis:", 0);
    -[UIDictationController setPendingEdits:](self, "setPendingEdits:", 0);
    self->_finalizingRecognizedUtterance = 0;
  }
  else
  {
    if (v22)
    {
      *(_DWORD *)buf = 136315138;
      v24 = "-[UIDictationController dictationConnection:finalizePhrases:languageModel:correctionIdentifier:secureInput:finalResult:]";
      _os_log_impl(&dword_185066000, v21, OS_LOG_TYPE_DEFAULT, "%s Finalizing dictation result", buf, 0xCu);
    }

    -[UIDictationController finishDictationRecognitionWithPhrases:languageModel:correctionIdentifier:secureInput:](self, "finishDictationRecognitionWithPhrases:languageModel:correctionIdentifier:secureInput:", v13, v14, v15, v9);
  }
  self->_recievingResults = 0;

}

- (void)_stopStreamingAnimation
{
  CADisplayLink *streamingAnimationDisplayLink;

  -[CADisplayLink invalidate](self->_streamingAnimationDisplayLink, "invalidate");
  streamingAnimationDisplayLink = self->_streamingAnimationDisplayLink;
  self->_streamingAnimationDisplayLink = 0;

  self->_streamingAnimationActive = 0;
}

- (void)_startStreamingAnimations
{
  void *v3;
  CADisplayLink *v4;
  CADisplayLink *streamingAnimationDisplayLink;
  void *v6;
  double v7;
  CADisplayLink *v8;
  void *v9;

  if (!+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI")
    && !self->_streamingAnimationActive)
  {
    self->_streamingAnimationActive = 1;
    +[UIScreen mainScreen](UIScreen, "mainScreen");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "displayLinkWithTarget:selector:", self, sel__displayLinkFired_);
    v4 = (CADisplayLink *)objc_claimAutoreleasedReturnValue();
    streamingAnimationDisplayLink = self->_streamingAnimationDisplayLink;
    self->_streamingAnimationDisplayLink = v4;

    +[_UIDictationSettingsDomain rootSettings](_UIDictationSettingsDomain, "rootSettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "typewriterEffectFramesPerSecond");
    -[CADisplayLink setPreferredFramesPerSecond:](self->_streamingAnimationDisplayLink, "setPreferredFramesPerSecond:", (uint64_t)v7);

    v8 = self->_streamingAnimationDisplayLink;
    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CADisplayLink addToRunLoop:forMode:](v8, "addToRunLoop:forMode:", v9, *MEMORY[0x1E0C99860]);

    self->_lastAnimationUpdateTimeStamp = CACurrentMediaTime();
  }
}

- (void)_displayLinkFired:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double lastAnimationUpdateTimeStamp;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  objc_class *v17;
  id v18;
  void *v19;
  objc_class *v20;
  id v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  char v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  double v46;
  unint64_t v47;
  double v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  id obj;
  id v66;
  void *v67;
  void *v68;
  void *v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  uint64_t v74;
  uint64_t v75;
  void (*v76)(uint64_t);
  void *v77;
  uint64_t *v78;
  uint64_t v79;
  uint64_t *v80;
  uint64_t v81;
  uint64_t v82;
  _BYTE v83[128];
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (self->_streamingAnimationActive)
  {
    if (self->_deferredCancellationRequested)
    {
      -[UIDictationController cancelDictation](self, "cancelDictation");
      goto LABEL_54;
    }
    v68 = v4;
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v69)
    {
LABEL_53:

      v5 = v68;
      goto LABEL_54;
    }
    objc_msgSend(v68, "timestamp");
    v7 = v6;
    lastAnimationUpdateTimeStamp = self->_lastAnimationUpdateTimeStamp;
    -[UIDictationController pendingEdits](self, "pendingEdits");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v7 - lastAnimationUpdateTimeStamp;
    if (!objc_msgSend(v9, "count"))
    {
      -[UIDictationController lastHypothesis](self, "lastHypothesis");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v36, "length"))
      {
        +[_UIDictationSettingsDomain rootSettings](_UIDictationSettingsDomain, "rootSettings");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "typewriterEffectMinDurationBetweenHypotheses");
        v39 = v38;

        if (v10 < v39)
          goto LABEL_53;
LABEL_7:
        -[UIDictationController targetHypothesis](self, "targetHypothesis");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIDictationController lastHypothesis](self, "lastHypothesis");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v11, "isEqualToString:", v12) & 1) != 0)
        {
          -[UIDictationController pendingEdits](self, "pendingEdits");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "count");

          if (!v14)
          {
            -[UIDictationController _stopStreamingAnimation](self, "_stopStreamingAnimation");
            if (!-[UIDictationController state](self, "state"))
            {
              -[UIDictationController setTargetHypothesis:](self, "setTargetHypothesis:", 0);
              -[UIDictationController setLastHypothesis:](self, "setLastHypothesis:", 0);
              -[UIDictationController setPendingEdits:](self, "setPendingEdits:", 0);
            }
            if (-[UIDictationController state](self, "state") == 3)
            {
              +[UIDictationLandingView activeInstance](UIDictationLandingView, "activeInstance");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "startLandingIfNecessary");

            }
            v79 = 0;
            v80 = &v79;
            v81 = 0x2050000000;
            v16 = (void *)qword_1ECD797B8;
            v82 = qword_1ECD797B8;
            if (!qword_1ECD797B8)
            {
              v74 = MEMORY[0x1E0C809B0];
              v75 = 3221225472;
              v76 = __getSISchemaUEIDictationPartialResultUpdatedClass_block_invoke;
              v77 = &unk_1E16B14C0;
              v78 = &v79;
              __getSISchemaUEIDictationPartialResultUpdatedClass_block_invoke((uint64_t)&v74);
              v16 = (void *)v80[3];
            }
            v17 = objc_retainAutorelease(v16);
            _Block_object_dispose(&v79, 8);
            v66 = objc_alloc_init(v17);
            objc_msgSend(v66, "setExists:", 1);
            -[AFAnalyticsTurnBasedInstrumentationContext emitInstrumentation:](self->_currentInstrumentationContext, "emitInstrumentation:", v66);
            if (self->_dictationInputModeSwitchStarted)
            {
              self->_dictationInputModeSwitchStarted = 0;
              v18 = objc_alloc_init((Class)getSISchemaUEIDictationInputModeSwitchContextClass());
              v79 = 0;
              v80 = &v79;
              v81 = 0x2050000000;
              v19 = (void *)qword_1ECD797C0;
              v82 = qword_1ECD797C0;
              if (!qword_1ECD797C0)
              {
                v74 = MEMORY[0x1E0C809B0];
                v75 = 3221225472;
                v76 = __getSISchemaUEIDictationInputModeSwitchEndedClass_block_invoke;
                v77 = &unk_1E16B14C0;
                v78 = &v79;
                __getSISchemaUEIDictationInputModeSwitchEndedClass_block_invoke((uint64_t)&v74);
                v19 = (void *)v80[3];
              }
              v20 = objc_retainAutorelease(v19);
              _Block_object_dispose(&v79, 8);
              v21 = objc_alloc_init(v20);
              objc_msgSend(v21, "setExists:", 1);
              objc_msgSend(v18, "setEnded:", v21);
              -[AFAnalyticsTurnBasedInstrumentationContext emitInstrumentation:](self->_currentInstrumentationContext, "emitInstrumentation:", v18);

            }
            goto LABEL_52;
          }
        }
        else
        {

        }
        +[UIDictationLandingView activeInstance](UIDictationLandingView, "activeInstance");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "canStopLanding");

        if (v23)
        {
          +[UIDictationLandingView activeInstance](UIDictationLandingView, "activeInstance");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "stopLanding");

        }
        objc_msgSend(v69, "inputDelegateManager");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "selectedTextRange");
        v66 = (id)objc_claimAutoreleasedReturnValue();

        if (v66 && (objc_msgSend(v66, "isEmpty") & 1) == 0)
        {
          -[UIDictationController removeSelectedText](self, "removeSelectedText");
LABEL_52:

          goto LABEL_53;
        }
        -[UIDictationController pendingEdits](self, "pendingEdits");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "count");

        if (v27)
        {
          -[UIDictationController targetHypothesis](self, "targetHypothesis");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIDictationController previousHypothesis](self, "previousHypothesis");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v28, "isEqualToString:", v29);

          if ((v30 & 1) != 0)
            goto LABEL_33;
          -[UIDictationController previousHypothesis](self, "previousHypothesis");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIDictationController targetHypothesis](self, "targetHypothesis");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          +[_EditScriptRanged editScriptFromString:toString:chunkSize:orderAtomsAscending:operationPrecedence:options:](_EditScriptRanged, "editScriptFromString:toString:chunkSize:orderAtomsAscending:operationPrecedence:options:", v31, v32, 0, 1, -1, 0);
          v33 = (void *)objc_claimAutoreleasedReturnValue();

          -[UIDictationController pendingEdits](self, "pendingEdits");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "script");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "addObjectsFromArray:", v35);

        }
        else
        {
          -[UIDictationController lastHypothesis](self, "lastHypothesis");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIDictationController targetHypothesis](self, "targetHypothesis");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          +[_EditScriptRanged editScriptFromString:toString:chunkSize:orderAtomsAscending:operationPrecedence:options:](_EditScriptRanged, "editScriptFromString:toString:chunkSize:orderAtomsAscending:operationPrecedence:options:", v40, v41, 0, 1, -1, 0);
          v33 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v33, "script");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = (void *)objc_msgSend(v42, "mutableCopy");

          -[UIDictationController setPendingEdits:](self, "setPendingEdits:", v34);
        }

LABEL_33:
        -[UIDictationController pendingEdits](self, "pendingEdits");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = objc_msgSend(v43, "count");

        if (v44)
        {
          +[_UIDictationSettingsDomain rootSettings](_UIDictationSettingsDomain, "rootSettings");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "typewriterEffectStreamingCharacterInsertionRate");
          v47 = (unint64_t)(v10 * v46);

          if (v47)
          {
            objc_msgSend(v68, "timestamp");
            self->_lastAnimationUpdateTimeStamp = v48;
            -[UIDictationController lastHypothesis](self, "lastHypothesis");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            v67 = (void *)objc_msgSend(v49, "mutableCopy");

            v72 = 0u;
            v73 = 0u;
            v70 = 0u;
            v71 = 0u;
            -[UIDictationController pendingEdits](self, "pendingEdits");
            obj = (id)objc_claimAutoreleasedReturnValue();
            v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v83, 16);
            if (v50)
            {
              v51 = 0;
              v52 = *(_QWORD *)v71;
              while (2)
              {
                v53 = 0;
                v63 = v51;
                v64 = v50 + v51;
                v54 = v51 + 1;
                do
                {
                  if (*(_QWORD *)v71 != v52)
                    objc_enumerationMutation(obj);
                  v55 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * v53);
                  v56 = objc_msgSend(v55, "editRange");
                  v58 = v57;
                  objc_msgSend(v55, "replacementText");
                  v59 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v67, "replaceCharactersInRange:withString:", v56, v58, v59);

                  objc_msgSend(v55, "replacementText");
                  v60 = (void *)objc_claimAutoreleasedReturnValue();
                  LODWORD(v58) = objc_msgSend(v60, "isEqualToString:", &stru_1E16EDF20);

                  v47 += v58;
                  if (v47 <= v54 + v53)
                  {
                    v64 = v63 + v53 + 1;
                    goto LABEL_48;
                  }
                  ++v53;
                }
                while (v50 != v53);
                v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v83, 16);
                v51 = v64;
                if (v50)
                  continue;
                break;
              }
            }
            else
            {
              v64 = 0;
            }
LABEL_48:

            -[UIDictationController pendingEdits](self, "pendingEdits");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v61, "removeObjectsInRange:", 0, v64);

            if (self->_ignoreFinalizePhrases)
            {
              -[UIDictationController setLastHypothesis:](self, "setLastHypothesis:", v67);
            }
            else
            {
              -[UIDictationController lastHypothesis](self, "lastHypothesis");
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              -[UIDictationController updateLastHypothesis:WithNewHypothesis:](self, "updateLastHypothesis:WithNewHypothesis:", v62, v67);

            }
          }
        }
        else
        {
          -[UIDictationController _stopStreamingAnimation](self, "_stopStreamingAnimation");
        }
        goto LABEL_52;
      }

    }
    goto LABEL_7;
  }
LABEL_54:

}

- (id)_rangeByExtendingRange:(id)a3 backward:(int64_t)a4 forward:(int64_t)a5 inputDelegateManager:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;

  v9 = a3;
  v10 = a6;
  objc_msgSend(v9, "start");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (a4)
  {
    objc_msgSend(v10, "positionFromPosition:offset:", v11, -a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      objc_msgSend(v10, "beginningOfDocument");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  objc_msgSend(v9, "end");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (a5)
  {
    objc_msgSend(v10, "positionFromPosition:offset:", v13, a5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      objc_msgSend(v10, "endOfDocument");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  objc_msgSend(v10, "textRangeFromPosition:toPosition:", v12, v14);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  if (v15)
    v17 = (void *)v15;
  else
    v17 = v9;
  v18 = v17;

  return v18;
}

- (id)_hypothesisRangeFromSelectionRange:(id)a3 inputDelegateManager:(id)a4 forHypothesis:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (!v7)
  {
    objc_msgSend(v8, "selectedTextRange");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v7, "end");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)v10;
    objc_msgSend(v8, "positionFromPosition:offset:", v10, -objc_msgSend(v9, "length"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      objc_msgSend(v8, "beginningOfDocument");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "textRangeFromPosition:toPosition:", v12, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v8, "endOfDocument");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "textRangeFromPosition:toPosition:", v11, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (id)_getBestHypothesisRangeGivenHintRange:(id)a3 inputDelegateManager:(id)a4 hypothesisRange:(_NSRange *)a5 documentTextInRange:(id *)a6 forHypothesis:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  NSUInteger v19;
  uint64_t v20;
  NSUInteger v21;
  NSUInteger v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  NSUInteger v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  NSUInteger v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  uint64_t v36;
  NSUInteger v37;
  void *v39;
  void *v40;
  void *v41;
  _NSRange *v42;
  id *v43;
  uint64_t v44;
  id v45;
  NSUInteger v46;

  v12 = a3;
  v13 = a4;
  v14 = a7;
  if (v12)
  {
    if (a5)
      goto LABEL_3;
LABEL_45:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIDictationController.m"), 6517, CFSTR("outTextRange == nil"));

    if (a6)
      goto LABEL_4;
LABEL_46:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIDictationController.m"), 6518, CFSTR("outDocumentText == nil"));

    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIDictationController.m"), 6516, CFSTR("hintRange == nil"));

  if (!a5)
    goto LABEL_45;
LABEL_3:
  if (!a6)
    goto LABEL_46;
LABEL_4:
  v15 = v14;
  v16 = objc_msgSend(v15, "length");
  if (!objc_msgSend(v12, "isEmpty") || v16)
  {
    *a5 = (_NSRange)xmmword_186679030;
    *a6 = 0;
    objc_msgSend(v13, "textInRange:", v12);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v18 = -[UIDictationController _getRangeOfString:inDocumentText:](self, "_getRangeOfString:inDocumentText:", v15, v17);
      v20 = v18;
      v21 = v19;
      if (!v18 && v19 == v16)
      {
        v42 = a5;
        v43 = a6;
        v22 = 0;
        v46 = v16;
LABEL_41:
        v42->location = v22;
        v42->length = v46;
        v23 = objc_retainAutorelease(v17);
        *v43 = v23;
        v12 = v12;
        v17 = v12;
        goto LABEL_42;
      }
      v44 = v16;
      if (v18 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v43 = a6;
        v27 = objc_msgSend(v17, "length") - (v18 + v19);
        goto LABEL_17;
      }
      -[UIDictationController _rangeByExtendingRange:backward:forward:inputDelegateManager:](self, "_rangeByExtendingRange:backward:forward:inputDelegateManager:", v12, +[UIDictationLandingView fallbackPlaceholderLength](UIDictationLandingView, "fallbackPlaceholderLength"), 0, v13);
      v24 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "textInRange:", v24);
      v23 = (id)objc_claimAutoreleasedReturnValue();

      v25 = -[UIDictationController _getRangeOfString:inDocumentText:](self, "_getRangeOfString:inDocumentText:", v15, v23);
      v17 = 0;
      if (v23)
      {
        v20 = v25;
        if (v25 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v21 = v26;
          v43 = a6;
          v27 = objc_msgSend(v23, "length") - (v25 + v26);
          v17 = v23;
          v12 = (id)v24;
LABEL_17:
          v45 = v13;
          v46 = v21;
          v42 = a5;
          if (v20 < 1)
          {
            v22 = v20;
            v33 = v17;
            v32 = v12;
          }
          else
          {
            v22 = v20;
            while (1)
            {
              -[UIDictationController _rangeByExtendingRange:backward:forward:inputDelegateManager:](self, "_rangeByExtendingRange:backward:forward:inputDelegateManager:", v12, -1, 0, v13, v42);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "textInRange:", v28);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v30 = -[UIDictationController _getRangeOfString:inDocumentText:](self, "_getRangeOfString:inDocumentText:", v15, v29);
              if (!v29 || v30 == 0x7FFFFFFFFFFFFFFFLL)
              {
                v33 = v17;
                v32 = v12;
                goto LABEL_29;
              }
              v22 = v30;
              v46 = v31;
              v32 = v28;

              v33 = v29;
              if (!v22 && objc_msgSend(v33, "length") == v44)
                break;

              v12 = v32;
              v17 = v33;
              --v20;
              v13 = v45;
              if (!v20)
                goto LABEL_30;
            }
            v22 = 0;
LABEL_29:

            v13 = v45;
          }
LABEL_30:
          if (v27 < 1)
          {
            v17 = v33;
            v12 = v32;
          }
          else
          {
            while (1)
            {
              -[UIDictationController _rangeByExtendingRange:backward:forward:inputDelegateManager:](self, "_rangeByExtendingRange:backward:forward:inputDelegateManager:", v32, 0, -1, v13, v42);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "textInRange:", v34);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              v36 = -[UIDictationController _getRangeOfString:inDocumentText:](self, "_getRangeOfString:inDocumentText:", v15, v35);
              if (!v35 || v36 == 0x7FFFFFFFFFFFFFFFLL)
              {
                v17 = v33;
                v12 = v32;
                goto LABEL_40;
              }
              v22 = v36;
              v46 = v37;
              v12 = v34;

              v17 = v35;
              if (!v22 && objc_msgSend(v17, "length") == v44)
                break;

              v32 = v12;
              v33 = v17;
              --v27;
              v13 = v45;
              if (!v27)
                goto LABEL_41;
            }
            v22 = 0;
LABEL_40:

            v13 = v45;
          }
          goto LABEL_41;
        }
      }
      v12 = (id)v24;
    }
    else
    {
      v23 = 0;
    }
LABEL_42:

    goto LABEL_43;
  }
  a5->location = 0;
  a5->length = 0;
  *a6 = &stru_1E16EDF20;
  v12 = v12;
  v17 = v12;
LABEL_43:

  return v17;
}

- (void)resetLastHypothesis
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
  {
    _UIDictationControllerLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = 136315138;
      v5 = "-[UIDictationController resetLastHypothesis]";
      _os_log_impl(&dword_185066000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v4, 0xCu);
    }

    -[UIDictationController setLastHypothesis:](self, "setLastHypothesis:", 0);
  }
}

- (void)updateLastHypothesis:(id)a3 WithNewHypothesis:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  -[UIDictationController _updateLastHypothesis:WithNewHypothesis:](self, "_updateLastHypothesis:WithNewHypothesis:", v7, v8);
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "touchDictationMenuTimer");

  if (objc_msgSend((id)objc_opt_class(), "shouldForwardInInputSystemUI"))
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "inputDelegateManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "inputSystemSourceSession");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      if (-[UIDictationController isIgnoringRTIChanges](self, "isIgnoringRTIChanges"))
      {
        if (objc_msgSend(v8, "isEqualToString:", &stru_1E16EDF20))
        {
          objc_msgSend(v12, "textOperations");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setCustomInfoType:", 0x1E1750220);
          v20 = CFSTR("selector");
          NSStringFromSelector(sel_resetLastHypothesis);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v21[0] = v14;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setCustomInfo:", v15);

          objc_msgSend(v12, "flushOperations");
        }
      }
      else
      {
        objc_msgSend(v12, "textOperations");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setCustomInfoType:", 0x1E1750220);
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 3);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        if (v7)
          objc_msgSend(v17, "setObject:forKeyedSubscript:", v7, CFSTR("lastHypothesis"));
        if (v8)
          objc_msgSend(v18, "setObject:forKeyedSubscript:", v8, CFSTR("newHypothesis"));
        NSStringFromSelector(a2);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setObject:forKeyedSubscript:", v19, CFSTR("selector"));

        objc_msgSend(v16, "setCustomInfo:", v18);
        objc_msgSend(v12, "flushOperations");

      }
    }

  }
}

- (void)forceOOPDocumentStateSync
{
  void *v2;
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x1E0DBDC40]);
  objc_msgSend(v3, "setInsertionText:", &stru_1E16EDF20);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__UIDictationController_forceOOPDocumentStateSync__block_invoke;
  v6[3] = &unk_1E16B1B50;
  v7 = v2;
  v8 = v3;
  v4 = v3;
  v5 = v2;
  objc_msgSend(v5, "performOperations:withTextInputSource:", v6, 2);

}

uint64_t __50__UIDictationController_forceOOPDocumentStateSync__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performKeyboardOutput:", *(_QWORD *)(a1 + 40));
}

- (void)_updateLastHypothesis:(id)a3 WithNewHypothesis:(id)a4
{
  id v6;
  __CFString *v7;
  void *v8;
  void *v9;
  int v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  __CFString *v22;
  const __CFString *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD block[5];
  _QWORD v36[4];
  id v37;
  UIDictationController *v38;
  id v39;
  id v40;
  id v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint8_t buf[4];
  const char *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  uint64_t v50;
  const __CFString *v51;
  _QWORD v52[4];

  v52[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (__CFString *)a4;
  if (!-[UIDictationController _shouldApplyLastHypothesis](self, "_shouldApplyLastHypothesis"))
    goto LABEL_29;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "inputDelegateManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hasAsyncCapableInputDelegate");

  if (v7 && -[__CFString length](v7, "length"))
  {
    v11 = objc_msgSend(v6, "length");
    if (v11 > -[__CFString length](v7, "length"))
      v12 = 1;
    else
      v12 = 2;
    v51 = CFSTR("UIDictationGlowViewMode");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v52[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v52, &v51, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIDictationController postNotificationName:userInfo:](self, "postNotificationName:userInfo:", CFSTR("UIDictationWillInsertHypothesisNotification"), v14);
  }
  objc_msgSend(v8, "inputDelegateManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "selectedTextRange");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIDictationController setHasSelectedTextRange:](self, "setHasSelectedTextRange:", 0);
  objc_msgSend(v8, "inputDelegateManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (!v10)
  {
    -[UIDictationController _hypothesisRangeFromSelectionRange:inputDelegateManager:forHypothesis:](self, "_hypothesisRangeFromSelectionRange:inputDelegateManager:forHypothesis:", v16, v17, v6);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v43 = 0;
    v44 = 0;
    if (v19 && (!objc_msgSend(v19, "isEmpty") || objc_msgSend(v6, "length")))
    {
      objc_msgSend(v8, "inputDelegateManager");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = 0;
      -[UIDictationController _getBestHypothesisRangeGivenHintRange:inputDelegateManager:hypothesisRange:documentTextInRange:forHypothesis:](self, "_getBestHypothesisRangeGivenHintRange:inputDelegateManager:hypothesisRange:documentTextInRange:forHypothesis:", v19, v20, &v43, &v42, v6);
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = (__CFString *)v42;

      v19 = (void *)v21;
      if (v21)
      {
LABEL_14:
        if (v7)
          v23 = v7;
        else
          v23 = &stru_1E16EDF20;
        -[__CFString stringByReplacingCharactersInRange:withString:](v22, "stringByReplacingCharactersInRange:withString:", v43, v44, v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v36[0] = MEMORY[0x1E0C809B0];
        v36[1] = 3221225472;
        v36[2] = __65__UIDictationController__updateLastHypothesis_WithNewHypothesis___block_invoke;
        v36[3] = &unk_1E16B6F18;
        v37 = v8;
        v38 = self;
        v39 = v19;
        v40 = v6;
        v41 = v24;
        v25 = v24;
        -[UIDictationController performIgnoringDocumentChanges:](self, "performIgnoringDocumentChanges:", v36);

LABEL_22:
        goto LABEL_23;
      }
    }
    else
    {
      v43 = 0;
      v44 = 0;
      v22 = &stru_1E16EDF20;
      if (v19)
        goto LABEL_14;
    }
    _UIDictationControllerLog();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
    {
      -[UIDictationController lastHypothesis](self, "lastHypothesis");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v46 = "-[UIDictationController _updateLastHypothesis:WithNewHypothesis:]";
      v47 = 2112;
      v48 = v34;
      v49 = 2112;
      v50 = 0;
      _os_log_fault_impl(&dword_185066000, v26, OS_LOG_TYPE_FAULT, "%s Could not find the last hypothesis \"%@\" in range '%@'. The likely cause is that something modified the text store or the hypothesis during dictation. Canceling dictation", buf, 0x20u);

    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __65__UIDictationController__updateLastHypothesis_WithNewHypothesis___block_invoke_826;
    block[3] = &unk_1E16B1B28;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    goto LABEL_22;
  }
  objc_msgSend(v17, "replaceRange:oldText:withText:forReplaceAction:", 0, v6, v7, 3);
  v19 = v18;
LABEL_23:

  if (+[UIKeyboard isModelessActive](UIKeyboard, "isModelessActive"))
  {
    +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "currentPublicInputMode");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v28, "isExtensionInputMode") & 1) != 0)
    {
      v29 = -[__CFString isEqualToString:](v7, "isEqualToString:", &stru_1E16EDF20);

      if ((v29 & 1) == 0)
        objc_msgSend(v8, "_requestInputManagerSync");
    }
    else
    {

    }
  }
  objc_msgSend(v8, "inputDelegateManager");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "textInteractionAssistant");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setNeedsSelectionDisplayUpdate");

  objc_msgSend(v8, "_textChoicesAssistant");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "resetDictationChoices");

  objc_msgSend(v8, "_textChoicesAssistant");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "resetDictationUnderlines");

LABEL_29:
  -[UIDictationController setLastHypothesis:](self, "setLastHypothesis:", v7);

}

uint64_t __65__UIDictationController__updateLastHypothesis_WithNewHypothesis___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "inputDelegateManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "privateInputDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "set_textInputSource:", 2);

  objc_msgSend(*(id *)(a1 + 40), "setCanUndoOrRedo:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setTextInputChangesIgnored:", 1);
  objc_msgSend(*(id *)(a1 + 32), "inputDelegateManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "replaceRange:oldText:withText:forReplaceAction:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), 3);

  objc_msgSend(*(id *)(a1 + 32), "setTextInputChangesIgnored:", 0);
  objc_msgSend(*(id *)(a1 + 32), "updateReturnKey:", 0);
  objc_msgSend((id)objc_opt_class(), "updateLandingView");
  return objc_msgSend(*(id *)(a1 + 40), "setCanUndoOrRedo:", 1);
}

uint64_t __65__UIDictationController__updateLastHypothesis_WithNewHypothesis___block_invoke_826(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancelDictation");
}

- (BOOL)_shouldApplyLastHypothesis
{
  void *v2;
  void *v3;
  char v4;

  if (!+[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess"))
    return 1;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inputDelegateManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "shouldRespectForwardingInputDelegate");

  return v4;
}

- (void)setupToInsertResultForNewHypothesis:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  id v9;

  v4 = a3;
  v9 = v4;
  if (self->_streamingAnimationActive)
  {
    -[UIDictationController setTargetHypothesis:](self, "setTargetHypothesis:", v4);
  }
  else
  {
    -[UIDictationController lastHypothesis](self, "lastHypothesis");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
      -[UIDictationController setLastHypothesis:](self, "setLastHypothesis:", &stru_1E16EDF20);
    +[UIDictationLandingView activeInstance](UIDictationLandingView, "activeInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "canStopLanding");

    if (v7)
    {
      +[UIDictationLandingView activeInstance](UIDictationLandingView, "activeInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stopLanding");

    }
    -[UIDictationController setTargetHypothesis:](self, "setTargetHypothesis:", v9);
    -[UIDictationController _startStreamingAnimations](self, "_startStreamingAnimations");
  }

}

- (BOOL)languageSupportsAdaptiveDelete
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;

  if (+[UIKeyboard isModelessActive](UIKeyboard, "isModelessActive"))
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E1A93ED8);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)MEMORY[0x1E0C99DC8];
    -[UIDictationController language](self, "language");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localeWithLocaleIdentifier:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "languageCode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v3, "containsObject:", v7) ^ 1;
  }
  else
  {
    LOBYTE(v8) = 0;
  }
  return v8;
}

- (BOOL)dictationWordwiseBackspaceEnabled
{
  void *v2;
  char v3;

  if (qword_1ECD796D8 != -1)
    dispatch_once(&qword_1ECD796D8, &__block_literal_global_840);
  if (!byte_1ECD7965C)
    return 0;
  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForPreferenceKey:", CFSTR("DictationWordwiseBackspaceEnabled"));

  return v3;
}

uint64_t __58__UIDictationController_dictationWordwiseBackspaceEnabled__block_invoke()
{
  uint64_t result;

  result = _os_feature_enabled_impl();
  byte_1ECD7965C = result;
  return result;
}

- (void)dictationConnection:(id)a3 receivedInterpretation:(id)a4 languageModel:(id)a5 secureInput:(BOOL)a6
{
  _BOOL8 v6;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  char v37;
  NSObject *v38;
  NSObject *v39;
  NSObject *v40;
  NSObject *v41;
  _QWORD v42[5];
  uint8_t buf[4];
  const char *v44;
  uint64_t v45;

  v6 = a6;
  v45 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[UIDictationController dictationConnection:receivedInterpretation:languageModel:secureInput:]");

  if (objc_msgSend(v8, "length"))
  {
    if (self->_shouldResumeDictation)
    {
      _UIDictationControllerLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v44 = "-[UIDictationController dictationConnection:receivedInterpretation:languageModel:secureInput:]";
        _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_DEFAULT, "%s _shouldResumeDictation is YES. Early return", buf, 0xCu);
      }
    }
    else if (-[UIDictationController isProcessingPotentialVoiceCommand](self, "isProcessingPotentialVoiceCommand"))
    {
      _UIDictationControllerLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v44 = "-[UIDictationController dictationConnection:receivedInterpretation:languageModel:secureInput:]";
        _os_log_error_impl(&dword_185066000, v9, OS_LOG_TYPE_ERROR, "%s Received partial result while processing potential voice command. This partial result will be ignored.", buf, 0xCu);
      }
    }
    else
    {
      if (-[UIDictationController dictationWordwiseBackspaceEnabled](self, "dictationWordwiseBackspaceEnabled"))
      {
        +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setShouldDeleteWordOnBackspaceTap:", 1);

        if (-[UIDictationController startRangeOfCurrentHypothesis](self, "startRangeOfCurrentHypothesis") == 0x7FFFFFFFFFFFFFFFLL)
        {
          if (objc_msgSend((id)objc_opt_class(), "shouldForwardInInputSystemUI"))
          {
            +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "inputDelegateManager");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "inputSystemSourceSession");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "documentState");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v14, "selectedTextRange");
            -[UIDictationController setStartRangeOfCurrentHypothesis:](self, "setStartRangeOfCurrentHypothesis:", v15, v16);

          }
          else
          {
            +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "documentState");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v12, "_selectedTextRange");
            -[UIDictationController setStartRangeOfCurrentHypothesis:](self, "setStartRangeOfCurrentHypothesis:", v17, v18);
          }

        }
      }
      -[UIDictationController updateRecordingLimitTimerIfNeeded](self, "updateRecordingLimitTimerIfNeeded");
      if (!self->_hasCheckedForLeadingSpaceOnce)
      {
        self->_hasCheckedForLeadingSpaceOnce = 1;
        v42[0] = MEMORY[0x1E0C809B0];
        v42[1] = 3221225472;
        v42[2] = __94__UIDictationController_dictationConnection_receivedInterpretation_languageModel_secureInput___block_invoke;
        v42[3] = &unk_1E16D48F8;
        v42[4] = self;
        +[UIDictationUtilities selectionStartInfoWithBlock:](UIDictationUtilities, "selectionStartInfoWithBlock:", v42);
      }
      if (+[UIDictationUtilities needsLeadingSpaceForText:secureInput:previousCharacter:selectionStartIsStartOfParagraph:](UIDictationUtilities, "needsLeadingSpaceForText:secureInput:previousCharacter:selectionStartIsStartOfParagraph:", v8, v6, self->_previousCharacter, self->_selectionStartIsStartOfParagraph))
      {
        objc_msgSend(CFSTR(" "), "stringByAppendingString:", v8);
        v19 = objc_claimAutoreleasedReturnValue();

        v8 = (id)v19;
      }
      if (+[UIDictationUtilities needsTrailingSpaceForText:secureInput:](UIDictationUtilities, "needsTrailingSpaceForText:secureInput:", v8, v6))
      {
        objc_msgSend(v8, "stringByAppendingString:", CFSTR(" "));
        v20 = objc_claimAutoreleasedReturnValue();

        v8 = (id)v20;
      }
      self->_recievingResults = 1;
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "inputDelegateManager");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (!+[UIKeyboard isRedesignedTextCursorEnabled](UIKeyboard, "isRedesignedTextCursorEnabled"))
      {
        objc_msgSend(v22, "textInteractionAssistant");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "configureForHighlightMode");

      }
      objc_msgSend(v22, "selectedTextRange");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v22;
      -[NSObject beginningOfDocument](v9, "beginningOfDocument");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "start");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = -[NSObject offsetFromPosition:toPosition:](v9, "offsetFromPosition:toPosition:", v25, v26);

      objc_msgSend(v24, "start");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "end");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = -[NSObject offsetFromPosition:toPosition:](v9, "offsetFromPosition:toPosition:", v28, v29);

      if (-[UIDictationController discardNextHypothesis](self, "discardNextHypothesis"))
      {
        v31 = 0;
      }
      else
      {
        -[UIDictationController previousHypothesis](self, "previousHypothesis");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        if (v32)
        {
          -[UIDictationController previousHypothesis](self, "previousHypothesis");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend(v8, "isEqualToString:", v33) ^ 1;

        }
        else
        {
          v31 = 1;
        }

      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Hypothesis (willInsert: %d): '%@'"), "-[UIDictationController dictationConnection:receivedInterpretation:languageModel:secureInput:]", v31, v8);

      if (-[UIDictationController discardNextHypothesis](self, "discardNextHypothesis"))
      {
        -[UIDictationController setPreviousHypothesis:](self, "setPreviousHypothesis:", 0);
        -[UIDictationController setInsertionRange:](self, "setInsertionRange:", v27, v30);
        -[UIDictationController setDiscardNextHypothesis:](self, "setDiscardNextHypothesis:", 0);
      }
      else
      {
        -[UIDictationController previousHypothesis](self, "previousHypothesis");
        v34 = objc_claimAutoreleasedReturnValue();
        if (!v34
          || (v35 = (void *)v34,
              -[UIDictationController previousHypothesis](self, "previousHypothesis"),
              v36 = (void *)objc_claimAutoreleasedReturnValue(),
              v37 = objc_msgSend(v8, "isEqualToString:", v36),
              v36,
              v35,
              (v37 & 1) == 0))
        {
          if (!-[UIDictationController haveReceivedFirstPartialResultForCurrentUtterance](self, "haveReceivedFirstPartialResultForCurrentUtterance"))
          {
            _UIDictationControllerUndoRedoLog();
            v38 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315138;
              v44 = "-[UIDictationController dictationConnection:receivedInterpretation:languageModel:secureInput:]";
              _os_log_impl(&dword_185066000, v38, OS_LOG_TYPE_DEFAULT, "%s First partial result received for current utterance", buf, 0xCu);
            }

            _UIDictationControllerUndoRedoLog();
            v39 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315138;
              v44 = "-[UIDictationController dictationConnection:receivedInterpretation:languageModel:secureInput:]";
              _os_log_impl(&dword_185066000, v39, OS_LOG_TYPE_DEFAULT, "%s Ending undo grouping if necessary", buf, 0xCu);
            }

            -[UIDictationController _endUndoGroupingIfNecessary](self, "_endUndoGroupingIfNecessary");
            _UIDictationControllerUndoRedoLog();
            v40 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315138;
              v44 = "-[UIDictationController dictationConnection:receivedInterpretation:languageModel:secureInput:]";
              _os_log_impl(&dword_185066000, v40, OS_LOG_TYPE_DEFAULT, "%s Beginning undo grouping if necessary", buf, 0xCu);
            }

            -[UIDictationController _beginUndoGroupingIfNecessary](self, "_beginUndoGroupingIfNecessary");
            _UIDictationControllerUndoRedoLog();
            v41 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315138;
              v44 = "-[UIDictationController dictationConnection:receivedInterpretation:languageModel:secureInput:]";
              _os_log_impl(&dword_185066000, v41, OS_LOG_TYPE_DEFAULT, "%s Updating haveReceivedFirstPartialResultForCurrentUtterance to YES", buf, 0xCu);
            }

            -[UIDictationController setHaveReceivedFirstPartialResultForCurrentUtterance:](self, "setHaveReceivedFirstPartialResultForCurrentUtterance:", 1);
          }
          -[UIDictationController setupToInsertResultForNewHypothesis:](self, "setupToInsertResultForNewHypothesis:", v8);
          -[UIDictationController setPreviousHypothesis:](self, "setPreviousHypothesis:", v8);
        }
      }
    }

  }
}

uint64_t __94__UIDictationController_dictationConnection_receivedInterpretation_languageModel_secureInput___block_invoke(uint64_t result, __int16 a2, char a3)
{
  *(_WORD *)(*(_QWORD *)(result + 32) + 346) = a2;
  *(_BYTE *)(*(_QWORD *)(result + 32) + 338) = a3;
  return result;
}

- (id)dictationConnection:(id)a3 willFilterTokensWithLanguageModel:(id)a4 forFinalize:(BOOL)a5
{
  id v6;
  UIDictationConnectionFilterState *v7;
  __CFString *v8;

  v6 = a4;
  v7 = objc_alloc_init(UIDictationConnectionFilterState);
  v8 = -[UIDictationController resultTransformForLanguageModel:](self, "resultTransformForLanguageModel:", v6);

  -[UIDictationConnectionFilterState setTransform:](v7, "setTransform:", v8);
  return v7;
}

- (id)dictationBlockForToken:(id)a3
{
  void *v4;
  uint64_t (*v5)(uint64_t);
  uint64_t *p_aBlock;
  void *v7;
  void *v8;
  uint64_t v10;
  uint64_t aBlock;

  objc_msgSend(a3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("\\delete")) & 1) != 0
    || objc_msgSend(v4, "isEqualToString:", CFSTR("\\backspace")))
  {
    aBlock = MEMORY[0x1E0C809B0];
    v5 = __48__UIDictationController_dictationBlockForToken___block_invoke;
    p_aBlock = &aBlock;
  }
  else
  {
    if (!objc_msgSend(v4, "isEqualToString:", CFSTR("\\clear")))
    {
      v7 = 0;
      goto LABEL_5;
    }
    v10 = MEMORY[0x1E0C809B0];
    v5 = __48__UIDictationController_dictationBlockForToken___block_invoke_2;
    p_aBlock = &v10;
  }
  p_aBlock[1] = 3221225472;
  p_aBlock[2] = (uint64_t)v5;
  p_aBlock[3] = (uint64_t)&unk_1E16B1B28;
  p_aBlock[4] = (uint64_t)self;
  v7 = _Block_copy(p_aBlock);
LABEL_5:
  v8 = _Block_copy(v7);

  return v8;
}

uint64_t __48__UIDictationController_dictationBlockForToken___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_setupHypothesisAsFinalResults");
  objc_msgSend(*(id *)(a1 + 32), "_runFinalizeOperation:", 1);
  objc_msgSend(*(id *)(a1 + 32), "setLastHypothesis:", &stru_1E16EDF20);
  return objc_msgSend(*(id *)(a1 + 32), "_deleteBackwardIntoText");
}

uint64_t __48__UIDictationController_dictationBlockForToken___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_setupHypothesisAsFinalResults");
  objc_msgSend(*(id *)(a1 + 32), "_runFinalizeOperation:", 1);
  objc_msgSend(*(id *)(a1 + 32), "setLastHypothesis:", &stru_1E16EDF20);
  return objc_msgSend(*(id *)(a1 + 32), "_clearExistingText");
}

- (BOOL)dictationConnection:(id)a3 filterState:(id)a4 shouldCheckpointAtToken:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v7 = a4;
  -[UIDictationController dictationBlockForToken:](self, "dictationBlockForToken:", a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v7, "setPendingDictationCommand:", v10);

  }
  return v9 != 0;
}

- (void)dictationConnection:(id)a3 filterState:(id)a4 processFilteredToken:(id)a5 forFinalize:(BOOL)a6
{
  void *v9;
  void (**v10)(void);
  void *v11;
  id v12;

  v12 = a4;
  objc_msgSend(v12, "pendingDictationCommand");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIDictationController.m"), 6958, CFSTR("This should never be called unless there's a pending dictation command!"));

    if (a6)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (!a6)
  {
LABEL_3:
    objc_msgSend(v12, "pendingDictationCommand");
    v10 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v10[2]();

  }
LABEL_4:
  objc_msgSend(v12, "setPendingDictationCommand:", 0);

}

- (void)dictationConnection:(id)a3 didFilterTokensWithFilterState:(id)a4 forFinalize:(BOOL)a5
{
  void *v7;
  id v8;

  objc_msgSend(a4, "pendingDictationCommand", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIDictationController.m"), 6971, CFSTR("This should never be called with a pending dictation command!"));

  }
}

- (void)dictationConnectionWillStartRecording:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  objc_class *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  const __CFString *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[UIDictationController dictationConnectionWillStartRecording:]");

  -[UIDictationController setState:](self, "setState:", 2);
  objc_msgSend(getAFAnalyticsClass(), "sharedAnalytics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "logEventWithType:context:", 1417, 0);

  v6 = objc_alloc_init((Class)getSISchemaUEILaunchContextClass());
  v14 = 0;
  v15 = &v14;
  v16 = 0x2050000000;
  v7 = (void *)getSISchemaUEILaunchEndedClass_softClass;
  v17 = getSISchemaUEILaunchEndedClass_softClass;
  if (!getSISchemaUEILaunchEndedClass_softClass)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __getSISchemaUEILaunchEndedClass_block_invoke;
    v13[3] = &unk_1E16B14C0;
    v13[4] = &v14;
    __getSISchemaUEILaunchEndedClass_block_invoke((uint64_t)v13);
    v7 = (void *)v15[3];
  }
  v8 = objc_retainAutorelease(v7);
  _Block_object_dispose(&v14, 8);
  v9 = objc_alloc_init(v8);
  objc_msgSend(v6, "setEnded:", v9);

  objc_msgSend(v6, "ended");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setExists:", 1);

  -[AFAnalyticsTurnBasedInstrumentationContext emitInstrumentation:](self->_currentInstrumentationContext, "emitInstrumentation:", v6);
  v18 = CFSTR("dictationLanguage");
  -[UIDictationController currentDictationLanguageForDisplay](self, "currentDictationLanguageForDisplay");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIDictationController postNotificationName:userInfo:](self, "postNotificationName:userInfo:", CFSTR("UIKeyboardDidBeginDictationNotification"), v12);
}

- (void)dictationConnectionDidStartRecording:(id)a3
{
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[UIDictationController dictationConnectionDidStartRecording:]");

}

- (void)dictationConnection:(id)a3 didStartRecordingWithOptions:(id)a4
{
  id v5;
  NSObject *v6;
  const __CFString *v7;
  int v8;
  NSObject *v9;
  const __CFString *v10;
  _BOOL8 v11;
  void *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  const __CFString *v25;
  const __CFString *v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  const __CFString *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[UIDictationController dictationConnection:didStartRecordingWithOptions:]");

  self->_localSpeechRecognitionForced = objc_msgSend(v5, "forceOfflineRecognition");
  self->_secureOfflineOnlySpeechRecognition = objc_msgSend(v5, "secureOfflineOnly");
  _UIDictationControllerLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    if (objc_msgSend((id)objc_opt_class(), "canShareDictationData"))
      v7 = CFSTR("Yes");
    else
      v7 = CFSTR("No");
    *(_DWORD *)buf = 136315394;
    v28 = "-[UIDictationController dictationConnection:didStartRecordingWithOptions:]";
    v29 = 2112;
    v30 = v7;
    _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_DEFAULT, "%s Enhanced dictation logging enabled=%@", buf, 0x16u);
  }

  v8 = objc_msgSend(v5, "detectUtterances");
  if (v8)
    LOBYTE(v8) = objc_msgSend(v5, "continuousListening");
  self->_detectingUtterances = v8;
  _UIDictationControllerLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    if (-[UIDictationController isDetectingUtterances](self, "isDetectingUtterances"))
      v10 = CFSTR("Yes");
    else
      v10 = CFSTR("No");
    *(_DWORD *)buf = 136315394;
    v28 = "-[UIDictationController dictationConnection:didStartRecordingWithOptions:]";
    v29 = 2112;
    v30 = v10;
    _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_DEFAULT, "%s Utterances detection enabled=%@", buf, 0x16u);
  }

  if (self->_detectingUtterances)
  {
    -[UIDictationController startRecordingLimitTimer](self, "startRecordingLimitTimer");
    v11 = +[UIKeyboard isMajelEnabled](UIKeyboard, "isMajelEnabled");
    +[UIKeyboardInputMode dictationInputMode](UIKeyboardInputMode, "dictationInputMode");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setUsingTypeAndTalk:", v11);

    _UIDictationControllerLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      +[UIKeyboardInputMode dictationInputMode](UIKeyboardInputMode, "dictationInputMode");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "usingTypeAndTalk");
      *(_DWORD *)buf = 136315394;
      v28 = "-[UIDictationController dictationConnection:didStartRecordingWithOptions:]";
      v29 = 1024;
      LODWORD(v30) = v15;
      _os_log_impl(&dword_185066000, v13, OS_LOG_TYPE_DEFAULT, "%s usingTypeAndTalk = %d", buf, 0x12u);

    }
  }
  else
  {
    +[UIKeyboardInputMode dictationInputMode](UIKeyboardInputMode, "dictationInputMode");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "usingTypeAndTalk");

    if (!v17)
      goto LABEL_20;
    +[UIKeyboardInputMode dictationInputMode](UIKeyboardInputMode, "dictationInputMode");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setUsingTypeAndTalk:", 0);

    _UIDictationControllerLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v28 = "-[UIDictationController dictationConnection:didStartRecordingWithOptions:]";
      _os_log_fault_impl(&dword_185066000, v13, OS_LOG_TYPE_FAULT, "%s Failed to setup utterance detection.[FATAL] = ", buf, 0xCu);
    }
  }

LABEL_20:
  self->_ignoreUserInteraction = 0;
  if (+[UIKeyboard isMajelEnabled](UIKeyboard, "isMajelEnabled"))
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "dictationTipController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "resetShowModelessTipSignal");

    v25 = CFSTR("reason");
    v26 = CFSTR("Dictation connection did start recording");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIDictationController postNotificationName:userInfo:](self, "postNotificationName:userInfo:", CFSTR("UIKeyboardDictationAvailabilityDidChangeNotification"), v22);

  }
  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "_textInputSessionAnalytics");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "didDictationBegin:usesMultiModalDictation:", 1, self->_detectingUtterances);

}

- (void)dictationConnectionDidEndRecording:(id)a3
{
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[UIDictationController dictationConnectionDidEndRecording:]");

  if (-[UIDictationController state](self, "state") == 2
    && -[UIDictationInputModeOptions shouldStayInDictationInputModeIfAutoEndpointed](self->_inputModeOptions, "shouldStayInDictationInputModeIfAutoEndpointed")&& !+[UIKeyboard isModelessActive](UIKeyboard, "isModelessActive"))
  {
    -[UIDictationController setShouldStayInDictationInputMode:](self, "setShouldStayInDictationInputMode:", 1);
  }
  if (-[UIDictationController state](self, "state") != 3)
  {
    -[UIDictationController setState:](self, "setState:", 3);
    -[UIDictationController clearKeyboardTrackpadModeIfNeeded](self, "clearKeyboardTrackpadModeIfNeeded");
  }
}

- (void)dictationConnectionDidCancelRecording:(id)a3
{
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[UIDictationController dictationConnectionDidCancelRecording:]");

  -[UIDictationController setState:](self, "setState:", 0);
}

- (void)dictationConnection:(id)a3 didFailRecordingWithError:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[UIDictationController dictationConnection:didFailRecordingWithError:]");

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s error: %@"), "-[UIDictationController dictationConnection:didFailRecordingWithError:]", v15);
  v5 = v15;
  if (!self->cancelledByWaitingForLocalResults)
  {
    +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "dictationRequestDidFailWithError:", v15);

    }
    -[UIDictationController setState:](self, "setState:", 6);
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "inputDelegateManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "textInputDelegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_textSelectingContainer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v14, "dictationRecognitionFailed");

    v5 = v15;
  }

}

- (void)dictationConnection:(id)a3 didFailRecognitionWithError:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
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
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  _QWORD v53[4];
  id v54;
  _QWORD v55[4];
  id v56;
  _QWORD aBlock[6];

  v5 = a4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[UIDictationController dictationConnection:didFailRecognitionWithError:]");

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s error: %@"), "-[UIDictationController dictationConnection:didFailRecognitionWithError:]", v5);
  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictationRequestDidFailWithError:", v5);

  }
  -[UIDictationController setState:](self, "setState:", 6);
  +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "inputDelegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_textSelectingContainer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v13, "dictationRecognitionFailed");
  v14 = objc_msgSend(v5, "code");
  if ((unint64_t)(v14 - 2) <= 2)
  {
    v15 = v14;
    -[UIDictationController _createDictationPresenterWindowIfNecessary](self, "_createDictationPresenterWindowIfNecessary");
    -[UIDictationController dictationPresenterWindow](self, "dictationPresenterWindow");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "makeKeyAndVisible");

    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __73__UIDictationController_dictationConnection_didFailRecognitionWithError___block_invoke;
    aBlock[3] = &unk_1E16B3EC8;
    aBlock[4] = self;
    v17 = _Block_copy(aBlock);
    switch(v15)
    {
      case 4:
        v26 = (void *)MEMORY[0x1E0CB3940];
        _UIKitBundle();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("Dictation Supports On Device Only Body"), CFSTR("Your device requires voice input to be processed on %@, but supporting data has not been downloaded yet."), CFSTR("Localizable"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        +[UIDevice currentDevice](UIDevice, "currentDevice");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        _UILocalizedNameForIdiom(objc_msgSend(v29, "userInterfaceIdiom"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "stringWithFormat:", v28, v30);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        _UIKitBundle();
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("Dictation Supports On Device Only Title"), CFSTR("Dictation not ready"), CFSTR("Localizable"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        +[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v32, v23, 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        _UIKitBundle();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("Dictation Supports On Device Only Close"), CFSTR("Close"), CFSTR("Localizable"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v34, 1, v17);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addAction:", v35);

        _UIKitBundle();
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "localizedStringForKey:value:table:", CFSTR("Dictation Supports On Device Only Learn More"), CFSTR("Learn More…"), CFSTR("Localizable"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v53[0] = MEMORY[0x1E0C809B0];
        v53[1] = 3221225472;
        v53[2] = __73__UIDictationController_dictationConnection_didFailRecognitionWithError___block_invoke_3;
        v53[3] = &unk_1E16D5098;
        v54 = v17;
        +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v37, 0, v53);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addAction:", v38);

        v24 = v54;
        break;
      case 3:
        v39 = (void *)MEMORY[0x1E0CB3940];
        _UIKitBundle();
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "localizedStringForKey:value:table:", CFSTR("Dictation On Device Model Required Body"), CFSTR("An installed device management profile requires voice input to be processed on %@, but supporting data has not been downloaded yet."), CFSTR("Localizable"));
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        +[UIDevice currentDevice](UIDevice, "currentDevice");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        _UILocalizedNameForIdiom(objc_msgSend(v42, "userInterfaceIdiom"));
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "stringWithFormat:", v41, v43);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        _UIKitBundle();
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "localizedStringForKey:value:table:", CFSTR("Dictation On Device Model Required Title"), CFSTR("Dictation Unavailable"), CFSTR("Localizable"));
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        +[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v45, v23, 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        _UIKitBundle();
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "localizedStringForKey:value:table:", CFSTR("Dictation On Device Model Required Close"), CFSTR("Close"), CFSTR("Localizable"));
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v47, 1, v17);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addAction:", v48);

        _UIKitBundle();
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "localizedStringForKey:value:table:", CFSTR("Dictation On Device Model Required Learn More"), CFSTR("Learn More…"), CFSTR("Localizable"));
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v55[0] = MEMORY[0x1E0C809B0];
        v55[1] = 3221225472;
        v55[2] = __73__UIDictationController_dictationConnection_didFailRecognitionWithError___block_invoke_2;
        v55[3] = &unk_1E16D5098;
        v56 = v17;
        +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v50, 0, v55);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addAction:", v51);

        v24 = v56;
        break;
      case 2:
        _UIKitBundle();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("Dictation Soon Title"), CFSTR("You Can Start Using\nDictation Soon"), CFSTR("Localizable"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        _UIKitBundle();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("Dictation Soon Body"), CFSTR("New users are being added for Dictation every day. You will receive an alert when you can start\nusing Dictation."), CFSTR("Localizable"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        +[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v19, v21, 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        _UIKitBundle();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("Dictation Soon OK"), CFSTR("OK"), CFSTR("Localizable"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v24, 1, v17);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addAction:", v25);

        break;
      default:
LABEL_14:

        goto LABEL_15;
    }

    if (v22)
    {
      -[UIDictationController presentingViewControllerForPrivacySheet](self, "presentingViewControllerForPrivacySheet");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "presentViewController:animated:completion:", v22, 1, 0);

    }
    goto LABEL_14;
  }
LABEL_15:
  -[UIDictationController postNotificationName:userInfo:](self, "postNotificationName:userInfo:", CFSTR("UIDictationControllerDictationDidFinish"), 0);

}

uint64_t __73__UIDictationController_dictationConnection_didFailRecognitionWithError___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "dictationPresenterWindow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resignKeyWindow");

  objc_msgSend(*(id *)(a1 + 32), "dictationPresenterWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 1);

  return objc_msgSend(*(id *)(a1 + 32), "setDictationPresenterWindow:", 0);
}

void __73__UIDictationController_dictationConnection_didFailRecognitionWithError___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0CA5878];
  v6 = a2;
  objc_msgSend(v3, "defaultWorkspace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=General&path=Keyboard/DictationSettings"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "openSensitiveURL:withOptions:error:", v5, 0, 0);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __73__UIDictationController_dictationConnection_didFailRecognitionWithError___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0CA5878];
  v6 = a2;
  objc_msgSend(v3, "defaultWorkspace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=General&path=Keyboard/DictationSettings"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "openSensitiveURL:withOptions:error:", v5, 0, 0);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)dictationConnection:(id)a3 didBeginLocalRecognitionWithModelInfo:(id)a4
{
  void *v5;
  id v6;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = a4;
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%s"), "-[UIDictationController dictationConnection:didBeginLocalRecognitionWithModelInfo:]");

  -[UIDictationController setModelInfo:](self, "setModelInfo:", v6);
}

- (void)dictationConnectionDidCancelIncompatibleLocalRecognizer:(id)a3
{
  -[UIDictationController _setupHypothesisAsFinalResults](self, "_setupHypothesisAsFinalResults", a3);
  -[UIDictationController _runFinalizeOperation:](self, "_runFinalizeOperation:", 1);
}

- (id)_containingSearchBarForView:(id)a3
{
  id v3;
  uint64_t v4;

  v3 = a3;
  if (v3)
  {
    while (1)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      objc_msgSend(v3, "superview");
      v4 = objc_claimAutoreleasedReturnValue();

      v3 = (id)v4;
      if (!v4)
        goto LABEL_6;
    }
    v3 = v3;
  }
LABEL_6:

  return v3;
}

- (void)dictationConnection:(id)a3 didReceiveSearchResults:(id)a4 recognizedText:(id)a5 stable:(BOOL)a6 final:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;

  v7 = a7;
  v8 = a6;
  v18 = a4;
  v11 = a5;
  +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "inputDelegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_textSelectingContainer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIDictationController _containingSearchBarForView:](self, "_containingSearchBarForView:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    v17 = v15;

    v14 = v17;
  }
  if (_UIIsPrivateMainBundle() && (objc_opt_respondsToSelector() & 1) != 0)
    +[UIDictationConnection afDelegate:didReceiveSearchResults:recognizedText:stable:final:](UIDictationConnection, "afDelegate:didReceiveSearchResults:recognizedText:stable:final:", v14, v18, v11, v8, v7);

}

- (void)dictationConnection:(id)a3 didDetectLanguage:(id)a4
{
  -[UIDictationController setDetectedLanguage:](self, "setDetectedLanguage:", a4);
}

- (void)dictationConnectionDidCancel:(id)a3
{
  -[UIDictationController postNotificationName:userInfo:](self, "postNotificationName:userInfo:", CFSTR("UIDictationControllerDictationDidFinish"), 0);
}

- (void)dictationConnectionDidFinish:(id)a3
{
  void *v4;
  int v5;
  void *v6;

  if (self->_detectingUtterances)
  {
    +[UIDictationLandingView activeInstance](UIDictationLandingView, "activeInstance", a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "canStopLanding");

    if (v5)
    {
      +[UIDictationLandingView activeInstance](UIDictationLandingView, "activeInstance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stopLanding");

    }
    -[UIDictationController cancelDictation](self, "cancelDictation");
  }
  -[UIDictationController switchToKeyboardInputModeIfNeeded](self, "switchToKeyboardInputModeIfNeeded", a3);
  -[UIDictationController postNotificationName:userInfo:](self, "postNotificationName:userInfo:", CFSTR("UIDictationControllerDictationDidFinish"), 0);
}

- (void)setCandidateDictationSerializableResults:(id)a3
{
  UIDictationSerializableResults **p_candidateDictationSerializableResults;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  p_candidateDictationSerializableResults = &self->_candidateDictationSerializableResults;
  objc_storeStrong((id *)&self->_candidateDictationSerializableResults, a3);
  v7 = objc_msgSend((id)objc_opt_class(), "shouldForwardInInputSystemUI");
  v8 = v16;
  if (v7)
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "inputDelegateManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "inputSystemSourceSession");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11 && !-[UIDictationController isIgnoringRTIChanges](self, "isIgnoringRTIChanges"))
    {
      objc_msgSend(v11, "textOperations");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setCustomInfoType:", 0x1E1750220);
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (*p_candidateDictationSerializableResults)
        objc_msgSend(v13, "setObject:forKeyedSubscript:", *p_candidateDictationSerializableResults, CFSTR("candidateDictationSerializableResults"));
      NSStringFromSelector(a2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, CFSTR("selector"));

      objc_msgSend(v12, "setCustomInfo:", v14);
      objc_msgSend(v11, "flushOperations");

    }
    v8 = v16;
  }

}

- (void)dictationConnection:(id)a3 didReceiveCandidateDictationSerializableResults:(id)a4
{
  -[UIDictationController setCandidateDictationSerializableResults:](self, "setCandidateDictationSerializableResults:", a4);
}

- (void)dictationConnection:(id)a3 didReceivePartialPackage:(id)a4 nluResult:(id)a5 languageModel:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  int v25;
  const char *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = a3;
  objc_msgSend(v10, "recognition");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "oneBestTokenList");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIDictationController updateRecordingLimitTimerIfNeeded](self, "updateRecordingLimitTimerIfNeeded");
  _UIDictationControllerLog();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v11, "commandGrammarParsePackage");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 136315394;
    v26 = "-[UIDictationController dictationConnection:didReceivePartialPackage:nluResult:languageModel:]";
    v27 = 2112;
    v28 = v17;
    _os_log_impl(&dword_185066000, v16, OS_LOG_TYPE_DEFAULT, "%s Partial AFVoiceCommandGrammarParsePackage: %@", (uint8_t *)&v25, 0x16u);

  }
  objc_msgSend(v10, "potentialCommandUtterance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "recognition");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "oneBestTranscript");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "commandGrammarParsePackage");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v19) = -[UIDictationController _shouldSuppressPartialForVoiceCommandGrammarParsePackage:commandPartialString:](self, "_shouldSuppressPartialForVoiceCommandGrammarParsePackage:commandPartialString:", v21, v20);

  if ((_DWORD)v19)
  {
    -[UIDictationController setLastSuppressedCommandPartialTokens:](self, "setLastSuppressedCommandPartialTokens:", v15);
    objc_msgSend(v10, "potentialCommandPrecedingUtterance");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "recognition");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "oneBestTokenList");
    v24 = objc_claimAutoreleasedReturnValue();

    v15 = (void *)v24;
  }
  else
  {
    -[UIDictationController setLastSuppressedCommandPartialTokens:](self, "setLastSuppressedCommandPartialTokens:", 0);
  }
  objc_msgSend(v13, "synthesizeDidRecognizeTokens:languageModel:", v15, v12);

}

- (void)dictationConnection:(id)a3 didReceiveVoiceCommandCandidatePackage:(id)a4 nluResult:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  const char *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  _BOOL8 v21;
  NSObject *v22;
  _BOOL4 v23;
  const char *v24;
  id v25;
  id v26;
  NSObject *v27;
  _QWORD v28[5];
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[UIDictationController updateRecordingLimitTimerIfNeeded](self, "updateRecordingLimitTimerIfNeeded");
  objc_msgSend(v10, "commandGrammarParsePackage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  _UIDictationControllerLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v37 = "-[UIDictationController dictationConnection:didReceiveVoiceCommandCandidatePackage:nluResult:]";
    v38 = 2112;
    v39 = v11;
    _os_log_impl(&dword_185066000, v12, OS_LOG_TYPE_DEFAULT, "%s commandGrammarParsePackage: %@", buf, 0x16u);
  }

  -[UIDictationController _voiceCommandGrammarParseResultWithParsePackage:completeCommands:](self, "_voiceCommandGrammarParseResultWithParsePackage:completeCommands:", v11, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[UIDictationController isProcessingPotentialVoiceCommand](self, "isProcessingPotentialVoiceCommand"))
  {
    _UIDictationControllerLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      goto LABEL_21;
    *(_DWORD *)buf = 136315138;
    v37 = "-[UIDictationController dictationConnection:didReceiveVoiceCommandCandidatePackage:nluResult:]";
    v15 = "%s Skipping processing of potential voice command because we are already processing another one";
LABEL_16:
    _os_log_impl(&dword_185066000, v14, OS_LOG_TYPE_DEFAULT, v15, buf, 0xCu);
    goto LABEL_21;
  }
  if (!v13)
  {
    _UIDictationControllerLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      goto LABEL_21;
    *(_DWORD *)buf = 136315138;
    v37 = "-[UIDictationController dictationConnection:didReceiveVoiceCommandCandidatePackage:nluResult:]";
    v15 = "%s No command garmmar parse candidate was extracted, so skipping";
    goto LABEL_16;
  }
  +[UIDictationUtilities dictationVoiceCommandParametersFromAFVoiceCommandGrammarParseCandidate:](UIDictationUtilities, "dictationVoiceCommandParametersFromAFVoiceCommandGrammarParseCandidate:", v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "commandId");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "voiceCommandUUID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  _UIDictationControllerLog();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v37 = "-[UIDictationController dictationConnection:didReceiveVoiceCommandCandidatePackage:nluResult:]";
    v38 = 2112;
    v39 = v13;
    _os_log_impl(&dword_185066000, v19, OS_LOG_TYPE_DEFAULT, "%s commandGrammarParseCandidate: %@", buf, 0x16u);
  }

  _UIDictationControllerLog();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v37 = "-[UIDictationController dictationConnection:didReceiveVoiceCommandCandidatePackage:nluResult:]";
    _os_log_impl(&dword_185066000, v20, OS_LOG_TYPE_DEFAULT, "%s Setting isProcessingPotentialVoiceCommand to YES", buf, 0xCu);
  }

  -[UIDictationController setIsProcessingPotentialVoiceCommand:](self, "setIsProcessingPotentialVoiceCommand:", 1);
  v21 = -[UIDictationController haveReceivedFirstPartialResultForCurrentUtterance](self, "haveReceivedFirstPartialResultForCurrentUtterance");
  _UIDictationControllerUndoRedoLog();
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
  if (v21)
  {
    if (v23)
    {
      *(_DWORD *)buf = 136315138;
      v37 = "-[UIDictationController dictationConnection:didReceiveVoiceCommandCandidatePackage:nluResult:]";
      v24 = "%s Setting haveLeakedPartialResultForCommandUtterance to YES";
LABEL_19:
      _os_log_impl(&dword_185066000, v22, OS_LOG_TYPE_DEFAULT, v24, buf, 0xCu);
    }
  }
  else if (v23)
  {
    *(_DWORD *)buf = 136315138;
    v37 = "-[UIDictationController dictationConnection:didReceiveVoiceCommandCandidatePackage:nluResult:]";
    v24 = "%s Setting haveLeakedPartialResultForCommandUtterance to NO";
    goto LABEL_19;
  }

  -[UIDictationController setHaveLeakedPartialResultForCommandUtterance:](self, "setHaveLeakedPartialResultForCommandUtterance:", v21);
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __94__UIDictationController_dictationConnection_didReceiveVoiceCommandCandidatePackage_nluResult___block_invoke;
  v28[3] = &unk_1E16D4920;
  v28[4] = self;
  v29 = v17;
  v30 = v16;
  v31 = v18;
  v32 = v9;
  v33 = v8;
  v34 = v11;
  v35 = v13;
  v25 = v18;
  v26 = v16;
  v14 = v17;
  -[UIDictationController requestVisibleTextWithCompletionBlock:](self, "requestVisibleTextWithCompletionBlock:", v28);

LABEL_21:
  _UIDictationControllerUndoRedoLog();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v37 = "-[UIDictationController dictationConnection:didReceiveVoiceCommandCandidatePackage:nluResult:]";
    _os_log_impl(&dword_185066000, v27, OS_LOG_TYPE_DEFAULT, "%s Updating haveReceivedFirstPartialResultForCurrentUtterance to NO", buf, 0xCu);
  }

  -[UIDictationController setHaveReceivedFirstPartialResultForCurrentUtterance:](self, "setHaveReceivedFirstPartialResultForCurrentUtterance:", 0);
}

void __94__UIDictationController_dictationConnection_didReceiveVoiceCommandCandidatePackage_nluResult___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  NSObject *v30;
  uint64_t v31;
  int v32;
  const char *v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "setVisibleRTIDocumentStateAtCommandRecognition:", v4);
  objc_msgSend(v4, "documentState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "selectedText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setHasSelectedTextRange:", objc_msgSend(v6, "length") != 0);
  if (objc_msgSend(*(id *)(a1 + 32), "canApplyVoiceCommandWithIdentifier:parameters:commandUtteranceString:voiceCommandUUID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0, *(_QWORD *)(a1 + 56)))
  {
    v7 = objc_msgSend((id)objc_opt_class(), "commandIdentifierWithStringIdentifier:", *(_QWORD *)(a1 + 40));
    if (v7 != 21 && v7 != 27)
    {
      _UIDictationControllerUndoRedoLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v32 = 136315138;
        v33 = "-[UIDictationController dictationConnection:didReceiveVoiceCommandCandidatePackage:nluResult:]_block_invoke";
        _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_DEFAULT, "%s Command is neither undo nor redo, so ending and beginning undo grouping if necessary", (uint8_t *)&v32, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 32), "_endUndoGroupingIfNecessary");
      objc_msgSend(*(id *)(a1 + 32), "_beginUndoGroupingIfNecessary");
    }
    objc_msgSend(*(id *)(a1 + 64), "potentialCommandPrecedingUtterance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "recognition");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "phrases");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "count");

      if (v13)
      {
        v14 = *(void **)(a1 + 72);
        objc_msgSend(v10, "recognition");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "phrases");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "synthesizeDidRecognizePhrases:languageModel:correctionIdentifier:", v16, 0, 0);

      }
    }
    v17 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 80), "nBestParses");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "firstObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "utterance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = *(_QWORD *)(a1 + 40);
    if (objc_msgSend(*(id *)(a1 + 48), "count"))
      v22 = *(_QWORD *)(a1 + 48);
    else
      v22 = 0;
    v29 = objc_msgSend(v17, "handleASRVoiceCommandRecognizedWithUtterance:commandIdentifier:parameters:voiceCommandUUID:", v20, v21, v22, *(_QWORD *)(a1 + 56));

    if ((v29 & 1) == 0)
    {
      _UIDictationControllerLog();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v31 = *(_QWORD *)(a1 + 88);
        v32 = 136315394;
        v33 = "-[UIDictationController dictationConnection:didReceiveVoiceCommandCandidatePackage:nluResult:]_block_invoke";
        v34 = 2112;
        v35 = v31;
        _os_log_error_impl(&dword_185066000, v30, OS_LOG_TYPE_ERROR, "%s Command applicability check passed, command not handled. This should not happen: %@", (uint8_t *)&v32, 0x16u);
      }

      objc_msgSend(*(id *)(a1 + 32), "resetDictation");
    }
  }
  else
  {
    _UIDictationControllerLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v32 = 136315138;
      v33 = "-[UIDictationController dictationConnection:didReceiveVoiceCommandCandidatePackage:nluResult:]_block_invoke";
      _os_log_impl(&dword_185066000, v23, OS_LOG_TYPE_DEFAULT, "%s Setting isProcessingPotentialVoiceCommand to NO", (uint8_t *)&v32, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "setIsProcessingPotentialVoiceCommand:", 0);
    objc_msgSend(*(id *)(a1 + 32), "lastSuppressedCommandPartialTokens");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      v25 = *(void **)(a1 + 72);
      objc_msgSend(*(id *)(a1 + 32), "lastSuppressedCommandPartialTokens");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "synthesizeDidRecognizeTokens:languageModel:", v26, 0);

    }
    objc_msgSend(*(id *)(a1 + 64), "recognition");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "phrases");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 72), "dictationSerializedResultWithPhrases:languageModel:", v10, 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "dictationConnection:didReceiveCandidateDictationSerializableResults:", *(_QWORD *)(a1 + 72), v28);

  }
}

+ (void)didBeginEditingInTextView:(id)a3
{
  void *v3;
  id v4;

  if (+[UIDictationController isRunning](UIDictationController, "isRunning", a3))
  {
    +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cancelDictation");

  }
  +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWantsAvailabilityMonitoringWhenAppActive:", 1);

}

+ (id)stringForState:(int)a3
{
  if (a3 > 6)
    return CFSTR("Unknown state");
  else
    return off_1E16D51C0[a3];
}

+ (id)stringForViewMode:(int)a3
{
  if (a3 > 7)
    return CFSTR("Unknown state");
  else
    return off_1E16D51F8[a3];
}

+ (void)poppedLastStreamingOperation
{
  void *v2;
  int v3;
  id v4;

  +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "state");

  if (v3 == 5)
  {
    +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setState:", 0);

  }
}

- (BOOL)isRecievingResults
{
  return self->_recievingResults;
}

- (void)preheatIfNecessary
{
  void *v3;

  if (!-[UIDictationController hasPreheated](self, "hasPreheated"))
  {
    -[UIDictationController dictationConnection](self, "dictationConnection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "preheat");

    -[UIDictationController setHasPreheated:](self, "setHasPreheated:", 1);
  }
}

- (id)language
{
  NSString *v3;

  if (+[UIDictationController viewMode](UIDictationController, "viewMode"))
  {
    v3 = self->_language;
  }
  else
  {
    -[UIDictationConnectionPreferences languageCode](self->_preferences, "languageCode");
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)setLanguage:(id)a3
{
  NSString *v5;
  NSString **p_language;
  NSString *language;
  NSString *v8;

  v5 = (NSString *)a3;
  language = self->_language;
  p_language = &self->_language;
  if (language != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_language, a3);
    v5 = v8;
  }

}

- (void)prepareStartDictationKeyboardGestures
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  id v7;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hardwareKeyboardAttached");

  if (v4)
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "inputDelegateManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "keyInputDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIDictationController prepareStartDictationKeyboardGesturesForDelegate:](self, "prepareStartDictationKeyboardGesturesForDelegate:", v6);

  }
  else
  {
    -[UIDictationController removeStartDictationKeyboardGestures](self, "removeStartDictationKeyboardGestures");
  }
}

- (void)prepareDoubleTapShortcutGesture:(id)a3
{
  _UITapTapHoldGestureRecognizer *hardwareShortcutRecognizer;
  _UITapTapHoldGestureRecognizer *v5;
  _UITapTapHoldGestureRecognizer *v6;
  void *v7;
  id v8;
  void *v9;
  id *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;

  v14 = a3;
  hardwareShortcutRecognizer = self->_hardwareShortcutRecognizer;
  if (!hardwareShortcutRecognizer)
  {
    v5 = -[_UITapTapHoldGestureRecognizer initWithTarget:action:]([_UITapTapHoldGestureRecognizer alloc], "initWithTarget:action:", self, sel_dictationShortCutKey_);
    v6 = self->_hardwareShortcutRecognizer;
    self->_hardwareShortcutRecognizer = v5;

    -[UITapGestureRecognizer setIsSingleKeyPressGesture:](self->_hardwareShortcutRecognizer, "setIsSingleKeyPressGesture:", 1);
    hardwareShortcutRecognizer = self->_hardwareShortcutRecognizer;
  }
  -[UIGestureRecognizer view](hardwareShortcutRecognizer, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = v14;
    }
    else
    {
      objc_msgSend(v14, "textInputView");
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v9 = v8;
    if (!v8)
    {
      +[UIWindowScene _keyWindowScene]();
      v10 = (id *)objc_claimAutoreleasedReturnValue();
      -[UIWindowScene _keyWindow](v10);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v9, "addGestureRecognizer:", self->_hardwareShortcutRecognizer);

  }
  objc_msgSend(MEMORY[0x1E0DBDCA8], "sharedPreferencesController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "valueForPreferenceKey:", *MEMORY[0x1E0DBDF80]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (int)objc_msgSend(v12, "intValue");

  -[UIDictationController updateDoubleTapShortcutWithPreference:](self, "updateDoubleTapShortcutWithPreference:", v13);
}

- (void)prepareVoiceCommandSingleTapGesture:(id)a3
{
  _UIVoiceCommandButtonTapGestureRecognizer *hardwareVoiceCommandKeyRecognizer;
  _UIVoiceCommandButtonTapGestureRecognizer *v5;
  _UIVoiceCommandButtonTapGestureRecognizer *v6;
  void *v7;
  id v8;
  void *v9;
  id *v10;
  id v11;

  v11 = a3;
  hardwareVoiceCommandKeyRecognizer = self->_hardwareVoiceCommandKeyRecognizer;
  if (!hardwareVoiceCommandKeyRecognizer)
  {
    v5 = -[UITapGestureRecognizer initWithTarget:action:]([_UIVoiceCommandButtonTapGestureRecognizer alloc], "initWithTarget:action:", self, sel_voiceCommandSingleTapKey_);
    v6 = self->_hardwareVoiceCommandKeyRecognizer;
    self->_hardwareVoiceCommandKeyRecognizer = v5;

    -[UITapGestureRecognizer setIsSingleKeyPressGesture:](self->_hardwareVoiceCommandKeyRecognizer, "setIsSingleKeyPressGesture:", 1);
    -[UITapGestureRecognizer setMaximumTapDuration:](self->_hardwareVoiceCommandKeyRecognizer, "setMaximumTapDuration:", 0.25);
    hardwareVoiceCommandKeyRecognizer = self->_hardwareVoiceCommandKeyRecognizer;
  }
  -[UIGestureRecognizer view](hardwareVoiceCommandKeyRecognizer, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = v11;
    }
    else
    {
      objc_msgSend(v11, "textInputView");
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v9 = v8;
    if (!v8)
    {
      +[UIWindowScene _keyWindowScene]();
      v10 = (id *)objc_claimAutoreleasedReturnValue();
      -[UIWindowScene _keyWindow](v10);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v9, "addGestureRecognizer:", self->_hardwareVoiceCommandKeyRecognizer);

  }
  -[UITapGestureRecognizer setAllowedPressTypes:](self->_hardwareVoiceCommandKeyRecognizer, "setAllowedPressTypes:", &unk_1E1A93EF0);
  -[UIGestureRecognizer setAllowedTouchTypes:](self->_hardwareVoiceCommandKeyRecognizer, "setAllowedTouchTypes:", &unk_1E1A93F08);

}

- (void)updateDoubleTapShortcutWithPreference:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  if (self->_currentShortcutType != a3
    || (-[UIGestureRecognizer allowedPressTypes](self->_hardwareShortcutRecognizer, "allowedPressTypes"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "count"),
        v5,
        !v6))
  {
    v7 = (void *)MEMORY[0x1E0C9AA60];
    v8 = &unk_1E1A93F50;
    if (a3 == 1)
      v7 = &unk_1E1A93F68;
    else
      v8 = (void *)MEMORY[0x1E0C9AA60];
    if (a3)
      v9 = v8;
    else
      v9 = &unk_1E1A93F20;
    if (a3)
      v10 = v7;
    else
      v10 = &unk_1E1A93F38;
    -[UITapGestureRecognizer setAllowedPressTypes:](self->_hardwareShortcutRecognizer, "setAllowedPressTypes:", v9);
    -[UIGestureRecognizer setAllowedTouchTypes:](self->_hardwareShortcutRecognizer, "setAllowedTouchTypes:", v10);
    self->_currentShortcutType = a3;
  }
}

- (void)handleHardwareKeyboardGesture
{
  void *v2;
  int v3;
  id v4;

  if (+[UIDictationController isRunning](UIDictationController, "isRunning"))
  {
    +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stopDictation");

    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "clearDictationMenuTimer");
  }
  else
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "shouldShowDictationKey"))
    {
      v3 = objc_msgSend((id)objc_opt_class(), "dictationIsFunctional");

      if (!v3)
        return;
      +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "switchToDictationInputMode");
    }
  }

}

- (void)dictationShortCutKey:(id)a3
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "state") == 1)
  {
    if (+[UIDictationController isRunning](UIDictationController, "isRunning"))
      objc_msgSend(v4, "setState:", 4);
    -[UIDictationController setReasonType:](self, "setReasonType:", 21);
    -[UIDictationController handleHardwareKeyboardGesture](self, "handleHardwareKeyboardGesture");
  }
  if (objc_msgSend(v4, "state") == 3
    && (objc_msgSend(v4, "gestureType") != 1
     || +[UIDictationController isRunning](UIDictationController, "isRunning")))
  {
    -[UIDictationController setReasonType:](self, "setReasonType:", 21);
    -[UIDictationController handleHardwareKeyboardGesture](self, "handleHardwareKeyboardGesture");
  }

}

- (void)voiceCommandSingleTapKey:(id)a3
{
  _UIVoiceCommandButtonTapGestureRecognizer *v4;
  void *v5;
  double v6;
  double v7;
  NSObject *v8;
  uint64_t v9;
  double v10;
  int v11;
  const char *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  double v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = (_UIVoiceCommandButtonTapGestureRecognizer *)a3;
  if (-[UIGestureRecognizer state](v4, "state") == UIGestureRecognizerStateEnded
    && self->_hardwareVoiceCommandKeyRecognizer == v4)
  {
    -[_UIVoiceCommandButtonTapGestureRecognizer voiceCommandButtonTapDuration](v4, "voiceCommandButtonTapDuration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITapGestureRecognizer maximumTapDuration](self->_hardwareVoiceCommandKeyRecognizer, "maximumTapDuration");
    v7 = v6;
    _UIDictationControllerLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "doubleValue");
      v11 = 136315650;
      v12 = "-[UIDictationController voiceCommandSingleTapKey:]";
      v13 = 2048;
      v14 = v9;
      v15 = 2048;
      v16 = v7;
      _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_DEFAULT, "%s Triggered with: tapDuration=%f, maxTapDuration=%f", (uint8_t *)&v11, 0x20u);
    }

    if (v5)
    {
      objc_msgSend(v5, "doubleValue");
      if (v10 <= v7)
      {
        -[UIDictationController setReasonType:](self, "setReasonType:", 22);
        -[UIDictationController handleHardwareKeyboardGesture](self, "handleHardwareKeyboardGesture");
      }
    }

  }
}

- (void)preferencesChanged:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[6];

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hardwareKeyboardAttached");

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0DBDCA8], "sharedPreferencesController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "valueForPreferenceKey:", *MEMORY[0x1E0DBDF80]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (int)objc_msgSend(v7, "intValue");

    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __44__UIDictationController_preferencesChanged___block_invoke;
    v9[3] = &unk_1E16B1888;
    v9[4] = self;
    v9[5] = v8;
    dispatch_async(MEMORY[0x1E0C80D38], v9);
  }
}

uint64_t __44__UIDictationController_preferencesChanged___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateDoubleTapShortcutWithPreference:", *(_QWORD *)(a1 + 40));
}

- (id)_assistantCompatibleLanguageCodeForInputMode:(id)a3
{
  id v3;
  void *v4;
  __CFString *v5;
  id v6;

  v3 = a3;
  TIInputModeGetLanguage();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  TIInputModeGetRegion();
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "isEqualToString:", CFSTR("ko"))
    && -[__CFString isEqualToString:](v5, "isEqualToString:", CFSTR("KO")))
  {

    v5 = CFSTR("KR");
  }
  else if (!v5)
  {
    v6 = v4;
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), v4, v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v6;
}

- (id)_currentLanguageForOfflineDictationMetrics
{
  void *v3;
  void *v4;
  void *v5;

  -[UIDictationController currentInputModeForDictation](self, "currentInputModeForDictation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictationLanguage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIDictationController _assistantCompatibleLanguageCodeForInputMode:](self, "_assistantCompatibleLanguageCodeForInputMode:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_markOfflineDictationInputMetricEvent
{
  if (self->_isOfflineMetricsSessionActive)
  {
    self->_didUseOfflineDictation = 1;
    self->_lastOfflineDictationMetricEvent = 1;
  }
}

- (void)markKeyboardInputMetricEvent
{
  id AFAggregatorClass;
  void *v4;

  if (self->_isOfflineMetricsSessionActive)
  {
    if (self->_lastOfflineDictationMetricEvent == 1)
    {
      AFAggregatorClass = getAFAggregatorClass();
      -[UIDictationController _currentLanguageForOfflineDictationMetrics](self, "_currentLanguageForOfflineDictationMetrics");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(AFAggregatorClass, "logDictationFollowedByKeyboardInputOccurredForLanguage:", v4);

    }
    self->_lastOfflineDictationMetricEvent = 2;
  }
}

- (void)markDictationTipInputEvent
{
  self->_lastKeyboardMetricEvent = 2;
}

- (void)markDictationTipDeletionEvent:(id)a3 deletedTextRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;

  length = a4.length;
  location = a4.location;
  v7 = a3;
  if (self->_lastKeyboardMetricEvent != 3
    || !+[UIDictationController isRunning](UIDictationController, "isRunning"))
  {
    -[UIDictationTipController resetDeletionEventCount](self->_dictationTipController, "resetDeletionEventCount");
  }
  -[UIDictationTipController addDeletionEventCount:deletedTextRange:](self->_dictationTipController, "addDeletionEventCount:deletedTextRange:", v7, location, length);
  self->_lastKeyboardMetricEvent = 3;

}

- (void)markDictationTipKeyboardEventReset
{
  self->_lastKeyboardMetricEvent = 0;
}

- (int64_t)consecutiveKeyboardDeleteEventCount
{
  return -[UIDictationTipController currentDeletionEventCount](self->_dictationTipController, "currentDeletionEventCount");
}

- (void)markKeyboardDeleteMetricEvent
{
  id AFAggregatorClass;
  void *v4;

  if (self->_isOfflineMetricsSessionActive)
  {
    if (self->_lastOfflineDictationMetricEvent == 1)
    {
      AFAggregatorClass = getAFAggregatorClass();
      -[UIDictationController _currentLanguageForOfflineDictationMetrics](self, "_currentLanguageForOfflineDictationMetrics");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(AFAggregatorClass, "logDictationFollowedByKeyboardDeleteOccurredForLanguage:", v4);

    }
    self->_lastOfflineDictationMetricEvent = 3;
  }
}

- (void)markKeyboardDidReset
{
  if (self->_isOfflineMetricsSessionActive)
  {
    self->_didUseOfflineDictation = 0;
    self->_lastOfflineDictationMetricEvent = 0;
  }
}

- (void)overrideSmartLanguageSelection:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[2];
  _QWORD v13[2];
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[UIDictationController setSmartLanguageSelectionOverrideLanguage:](self, "setSmartLanguageSelectionOverrideLanguage:", v4);
  _UIDictationControllerLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v15 = "-[UIDictationController overrideSmartLanguageSelection:]";
    v16 = 2112;
    v17 = v4;
    _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_DEFAULT, "%s Dictation language: %@", buf, 0x16u);
  }

  objc_msgSend(getAFAnalyticsClass(), "sharedAnalytics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIDictationController smartLanguageSelectionOverrideLanguage](self, "smartLanguageSelectionOverrideLanguage", CFSTR("newLanguageCode"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  v12[1] = CFSTR("correctionIdentifier");
  -[UIDictationController lastCorrectionIdentifier](self, "lastCorrectionIdentifier");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  v10 = MEMORY[0x1E0C9AA70];
  if (v8)
    v10 = v8;
  v13[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "logEventWithType:context:", 2219, v11);

}

- (BOOL)smartLanguageSelectionOverridden
{
  void *v2;
  BOOL v3;

  -[UIDictationController smartLanguageSelectionOverrideLanguage](self, "smartLanguageSelectionOverrideLanguage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)rtiInputSessionWillChangeToNewProcess:(id)a3
{
  _QWORD block[5];

  if (+[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess", a3))
  {
    if (+[UIDictationController isRunning](UIDictationController, "isRunning"))
    {
      -[UIDictationController setAppState:](self, "setAppState:", 0);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __63__UIDictationController_rtiInputSessionWillChangeToNewProcess___block_invoke;
      block[3] = &unk_1E16B1B28;
      block[4] = self;
      dispatch_sync(MEMORY[0x1E0C80D38], block);
    }
  }
}

uint64_t __63__UIDictationController_rtiInputSessionWillChangeToNewProcess___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = +[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess");
  if ((_DWORD)result)
  {
    result = +[UIDictationController isRunning](UIDictationController, "isRunning");
    if ((_DWORD)result)
      return objc_msgSend(*(id *)(a1 + 32), "performIgnoringRTIChanges:", &__block_literal_global_943);
  }
  return result;
}

void __63__UIDictationController_rtiInputSessionWillChangeToNewProcess___block_invoke_2()
{
  id v0;

  +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stopDictationIgnoreFinalizePhrases");

}

+ (BOOL)isDictationSearchBarButtonVisible
{
  void *v2;
  void *v3;
  BOOL v4;

  +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inputDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v4 = (objc_opt_isKindOfClass() & 1) != 0
    && objc_msgSend(v3, "showDictationButton")
    && objc_msgSend(v3, "isEditing")
    && !objc_msgSend(v3, "hasText");

  return v4;
}

+ (id)textRelatedMetadataKeys
{
  if (qword_1ECD796E8 != -1)
    dispatch_once(&qword_1ECD796E8, &__block_literal_global_944);
  return (id)qword_1ECD796E0;
}

void __48__UIDictationController_textRelatedMetadataKeys__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("fullText"), CFSTR("originalText"), CFSTR("replacementText"), CFSTR("bestAlternatives"), CFSTR("bestText"), CFSTR("text"), CFSTR("text"), 0);
  v1 = (void *)qword_1ECD796E0;
  qword_1ECD796E0 = v0;

}

+ (id)arrayWithTextEntriesRemoved:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(a1, "arrayWithTextEntriesRemoved:", v11);
          v12 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(a1, "dictionaryWithTextEntriesRemoved:", v11, (_QWORD)v15);
            v12 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v12 = v11;
          }
        }
        v13 = v12;
        objc_msgSend(v5, "addObject:", v12, (_QWORD)v15);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  return v5;
}

+ (id)dictionaryWithTextEntriesRemoved:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  id v11;

  v4 = (void *)MEMORY[0x1E0C99E08];
  v5 = a3;
  objc_msgSend(v4, "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __58__UIDictationController_dictionaryWithTextEntriesRemoved___block_invoke;
  v9[3] = &unk_1E16D4988;
  v11 = a1;
  v7 = v6;
  v10 = v7;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v9);

  return v7;
}

void __58__UIDictationController_dictionaryWithTextEntriesRemoved___block_invoke(uint64_t a1, void *a2, void *a3)
{
  __CFString *v5;
  void *v6;
  char v7;
  void *v8;
  const __CFString *v9;
  uint64_t v10;
  __CFString *v11;
  id v12;

  v12 = a2;
  v5 = a3;
  objc_msgSend((id)objc_opt_class(), "textRelatedMetadataKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v12);

  if ((v7 & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend((id)objc_opt_class(), "arrayWithTextEntriesRemoved:", v5);
      v10 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_8:
        v8 = *(void **)(a1 + 32);
        v9 = v5;
        goto LABEL_9;
      }
      objc_msgSend((id)objc_opt_class(), "dictionaryWithTextEntriesRemoved:", v5);
      v10 = objc_claimAutoreleasedReturnValue();
    }
    v11 = (__CFString *)v10;

    v5 = v11;
    goto LABEL_8;
  }
  v8 = *(void **)(a1 + 32);
  v9 = CFSTR("*");
LABEL_9:
  objc_msgSend(v8, "setObject:forKey:", v9, v12);

}

+ (id)whitelistedDictationMetadataKeys
{
  if (qword_1ECD796F8 != -1)
    dispatch_once(&qword_1ECD796F8, &__block_literal_global_946);
  return (id)qword_1ECD796F0;
}

void __57__UIDictationController_whitelistedDictationMetadataKeys__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("characterModificationCount"), CFSTR("characterInsertionCount"), CFSTR("characterDeletionCount"), CFSTR("characterSubstitutionCount"), CFSTR("correctionIdentifier"), CFSTR("dictationUIInteractionIdentifier"), CFSTR("fullText"), CFSTR("speechRecognitionSource"), CFSTR("multilingualIsLowConfidence"), CFSTR("bestAlternatives"), CFSTR("bestText"), CFSTR("alternativesSelectedCount"), CFSTR("alternativesSelected"), CFSTR("insertions"), CFSTR("deletions"), CFSTR("substitutions"), CFSTR("insertion"),
         CFSTR("deletion"),
         0);
  v1 = (void *)qword_1ECD796F0;
  qword_1ECD796F0 = v0;

}

+ (id)whitelistedDictationDictionaryFromMetadata:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[UIDictationController whitelistedDictationMetadataKeys](UIDictationController, "whitelistedDictationMetadataKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v4, "containsObject:", v11, (_QWORD)v14))
        {
          objc_msgSend(v6, "objectForKeyedSubscript:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKey:", v12, v11);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  return v5;
}

+ (BOOL)shouldRemoveTextEntries:(id)a3
{
  id v4;
  void *v5;
  int v6;

  v4 = a3;
  if (objc_msgSend(a1, "canShareDictationData"))
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("speechRecognitionSource"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("local")))
      v6 = os_variant_has_internal_diagnostics() ^ 1;
    else
      LOBYTE(v6) = 0;

  }
  else
  {
    LOBYTE(v6) = 1;
  }

  return v6;
}

+ (BOOL)canShareDictationData
{
  void *v3;
  char v4;
  void *v5;
  int v6;
  BOOL v7;
  void *v9;

  objc_msgSend(a1, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isDetectingUtterances");

  if ((v4 & 1) == 0)
  {
    objc_msgSend(a1, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "secureOfflineOnlySpeechRecognition");

    if (!v6)
      return 1;
    if (os_variant_has_internal_diagnostics())
    {
      objc_msgSend(getAFPreferencesClass_0(), "sharedPreferences");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v9, "siriDataSharingOptInStatus") == 1;

      return v7;
    }
  }
  return 0;
}

+ (BOOL)shouldRemoveTextEntries
{
  return objc_msgSend(a1, "canShareDictationData") ^ 1;
}

+ (id)removeTextIfNeeded:(id)a3
{
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;

  v3 = (__CFString *)a3;
  if (v3 && (objc_msgSend((id)objc_opt_class(), "shouldRemoveTextEntries") & 1) != 0)
    v4 = CFSTR("*");
  else
    v4 = v3;
  v5 = v4;

  return v5;
}

+ (id)removeTextIfNeeded:(id)a3 metadata:(id)a4
{
  __CFString *v5;
  id v6;
  __CFString *v7;
  __CFString *v8;

  v5 = (__CFString *)a3;
  v6 = a4;
  if (v5 && (objc_msgSend((id)objc_opt_class(), "shouldRemoveTextEntries:", v6) & 1) != 0)
    v7 = CFSTR("*");
  else
    v7 = v5;
  v8 = v7;

  return v8;
}

+ (id)whitelistedDictationDictionariesFromMetadataDictionaries:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v9);
        objc_msgSend((id)objc_opt_class(), "whitelistedDictationDictionaryFromMetadata:", v10, (_QWORD)v16);
        v11 = objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          v12 = (void *)v11;
          if (objc_msgSend((id)objc_opt_class(), "shouldRemoveTextEntries:", v10))
          {
            objc_msgSend((id)objc_opt_class(), "dictionaryWithTextEntriesRemoved:", v12);
            v13 = objc_claimAutoreleasedReturnValue();

            v12 = (void *)v13;
          }
          objc_msgSend(v4, "addObject:", v12);

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)activeSLSDictationLanguages
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[5];
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint8_t v38[128];
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  uint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  if (!_os_feature_enabled_impl())
    return 0;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__124;
  v36 = __Block_byref_object_dispose__124;
  +[UIDictationConnectionPreferences sharedInstance](UIDictationConnectionPreferences, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictationSLSEnabledLanguages");
  v37 = (id)objc_claimAutoreleasedReturnValue();

  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend((id)v33[5], "count"))
  {
    _UIDictationControllerLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "preferencesActions");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "valueForPreferenceKey:", CFSTR("DictationLanguagesEnabled"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v33[5];
      *(_DWORD *)buf = 136315650;
      v40 = "+[UIDictationController activeSLSDictationLanguages]";
      v41 = 2112;
      v42 = v7;
      v43 = 2112;
      v44 = v8;
      _os_log_impl(&dword_185066000, v4, OS_LOG_TYPE_DEFAULT, "%s Getting dictation languages: enabledDictationLanguages %@ enabledSLSDictationLanguages %@", buf, 0x20u);

    }
  }
  else
  {
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __52__UIDictationController_activeSLSDictationLanguages__block_invoke;
    v31[3] = &unk_1E16D49D0;
    v31[4] = &v32;
    objc_msgSend(v3, "updateEnabledDictationAndSLSLanguagesWithCompletionBlock:", v31);
  }
  objc_msgSend((id)v33[5], "keysOfEntriesPassingTest:", &__block_literal_global_950);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v25, "count") >= 2)
  {
    v11 = (void *)MEMORY[0x1E0C99E20];
    objc_msgSend(v3, "enabledDictationLanguages");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (v12)
      v14 = v12;
    else
      v14 = MEMORY[0x1E0C9AA60];
    objc_msgSend(v11, "setWithArray:", v14, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v26, "intersectSet:", v25);
    if ((unint64_t)objc_msgSend(v26, "count") < 2)
    {
      v10 = 0;
LABEL_30:

      goto LABEL_31;
    }
    objc_msgSend(v3, "currentInputMode");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "languageWithRegion");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    objc_msgSend(v3, "enabledDictationLanguages");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v38, 16);
    if (v18)
    {
      v19 = 0;
      v20 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v28 != v20)
            objc_enumerationMutation(v17);
          v22 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
          objc_msgSend(v3, "keyboardLanguageForDictationLanguage:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "isEqualToString:", v16);

          if (v24)
          {
            if ((objc_msgSend(v26, "containsObject:", v22) & 1) != 0)
              goto LABEL_27;
            v19 = 1;
          }
        }
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v38, 16);
      }
      while (v18);

      if ((v19 & 1) != 0)
      {
        v10 = 0;
LABEL_29:

        goto LABEL_30;
      }
    }
    else
    {
LABEL_27:

    }
    objc_msgSend(v26, "allObjects");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_29;
  }
  v10 = 0;
LABEL_31:

  _Block_object_dispose(&v32, 8);
  return v10;
}

void __52__UIDictationController_activeSLSDictationLanguages__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  _UIDictationControllerLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315650;
    v9 = "+[UIDictationController activeSLSDictationLanguages]_block_invoke";
    v10 = 2112;
    v11 = v5;
    v12 = 2112;
    v13 = v6;
    _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_DEFAULT, "%s Generated since no existing defafult for SLS languages: enabledDictationLanguages %@ enabledSLSDictationLanguages %@", (uint8_t *)&v8, 0x20u);
  }

}

uint64_t __52__UIDictationController_activeSLSDictationLanguages__block_invoke_949(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "BOOLValue");
}

- (id)dictationUIState
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  const __CFString *v25;
  _BOOL4 v26;
  const __CFString *v27;
  void *v28;
  void *v30;
  __CFString *v31;
  _BOOL4 v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  _QWORD v39[8];
  _QWORD v40[10];

  v40[8] = *MEMORY[0x1E0C80C00];
  v39[0] = CFSTR("EnabledDictationLanguages");
  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "preferencesActions");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "valueForPreferenceKey:", CFSTR("DictationLanguagesEnabled"));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C9AA70];
  v36 = (void *)v3;
  if (v3)
    v5 = v3;
  else
    v5 = MEMORY[0x1E0C9AA70];
  v40[0] = v5;
  v39[1] = CFSTR("EnabledSLSDictationLanguages");
  objc_msgSend(getAFPreferencesClass_0(), "sharedPreferences");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "dictationSLSLanguagesEnabled");
  v6 = objc_claimAutoreleasedReturnValue();
  v34 = (void *)v6;
  if (v6)
    v7 = v6;
  else
    v7 = v4;
  v40[1] = v7;
  v39[2] = CFSTR("EffectiveEnabledDictationLanguages");
  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "enabledDictationLanguages");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  v10 = MEMORY[0x1E0C9AA60];
  if (v8)
    v10 = v8;
  v40[2] = v10;
  v39[3] = CFSTR("SmartLanguageSelectionOverridden");
  v32 = -[UIDictationController smartLanguageSelectionOverridden](self, "smartLanguageSelectionOverridden");
  if (v32)
  {
    v11 = (void *)MEMORY[0x1E0CB3940];
    -[UIDictationController smartLanguageSelectionOverrideLanguage](self, "smartLanguageSelectionOverrideLanguage");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("with %@"), v30);
    v12 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = CFSTR("No");
  }
  v31 = (__CFString *)v12;
  v40[3] = v12;
  v39[4] = CFSTR("CurrentKeyboardPrimaryLanguage");
  -[UIDictationController currentKeyboardPrimaryLanguage](self, "currentKeyboardPrimaryLanguage");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  v15 = CFSTR("Not set");
  if (v13)
    v15 = (const __CFString *)v13;
  v40[4] = v15;
  v39[5] = CFSTR("CurrentKeyboardLanguage");
  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "currentInputMode");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "primaryLanguage");
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v18;
  if (v18)
    v20 = (const __CFString *)v18;
  else
    v20 = &stru_1E16EDF20;
  v40[5] = v20;
  v39[6] = CFSTR("DictationLanguage");
  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "currentInputMode");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "dictationLanguage");
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = (void *)v23;
  if (v23)
    v25 = (const __CFString *)v23;
  else
    v25 = &stru_1E16EDF20;
  v40[6] = v25;
  v39[7] = CFSTR("IsFallingBackToMonolingualDictation");
  v26 = -[UIDictationController isFallingBackToMonolingualDictation](self, "isFallingBackToMonolingualDictation");
  v27 = CFSTR("Yes");
  if (!v26)
    v27 = CFSTR("No");
  v40[7] = v27;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 8);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {

  }
  return v28;
}

- (void)instrumentationDictationContextEmitInstrumentation
{
  void *v3;
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  void *v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _QWORD v44[5];
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v45 = 0;
  v46 = &v45;
  v47 = 0x2050000000;
  v3 = (void *)getSISchemaDictationContextClass_softClass;
  v48 = getSISchemaDictationContextClass_softClass;
  if (!getSISchemaDictationContextClass_softClass)
  {
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __getSISchemaDictationContextClass_block_invoke;
    v44[3] = &unk_1E16B14C0;
    v44[4] = &v45;
    __getSISchemaDictationContextClass_block_invoke((uint64_t)v44);
    v3 = (void *)v46[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v45, 8);
  v5 = objc_alloc_init(v4);
  v6 = (void *)objc_opt_class();
  -[UIDictationController currentKeyboardPrimaryLanguage](self, "currentKeyboardPrimaryLanguage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UIDictationInstrumentaionLocalIdentifierWithLocalString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setKeyboardLocale:", v8);

  v9 = (void *)objc_opt_class();
  -[UIDictationController initialDictationLanguage](self, "initialDictationLanguage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UIDictationInstrumentaionLocalIdentifierWithLocalString:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDictationLocale:", v11);

  -[UIDictationController smartLanguageSelectionOverrideLanguage](self, "smartLanguageSelectionOverrideLanguage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)objc_opt_class();
    -[UIDictationController smartLanguageSelectionOverrideLanguage](self, "smartLanguageSelectionOverrideLanguage");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "UIDictationInstrumentaionLocalIdentifierWithLocalString:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setUserSelectedLocale:", v15);

  }
  else
  {
    objc_msgSend(v5, "setUserSelectedLocale:", 0);
  }

  v16 = objc_alloc((Class)getSISchemaUUIDClass());
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "_sessionIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v16, "initWithNSUUID:", v18);
  objc_msgSend(v5, "setTextInputSessionId:", v19);

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "activeInputModes");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
  if (v22)
  {
    v23 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v41 != v23)
          objc_enumerationMutation(v21);
        v25 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        v26 = (void *)objc_opt_class();
        objc_msgSend(v25, "languageWithRegion");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "UIDictationInstrumentaionLocalIdentifierWithLocalString:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addKeyboardLocalesEnabled:", v28);

      }
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
    }
    while (v22);
  }

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController", 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "activeDictationLanguages");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v36, v49, 16);
  if (v31)
  {
    v32 = *(_QWORD *)v37;
    do
    {
      for (j = 0; j != v31; ++j)
      {
        if (*(_QWORD *)v37 != v32)
          objc_enumerationMutation(v30);
        objc_msgSend((id)objc_opt_class(), "UIDictationInstrumentaionLocalIdentifierWithLocalString:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * j));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addDictationLocalesEnabled:", v34);

      }
      v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v36, v49, 16);
    }
    while (v31);
  }

  +[UIKeyboard keyboardBundleIdentifier](UIKeyboard, "keyboardBundleIdentifier");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBundleId:", v35);

  -[AFAnalyticsTurnBasedInstrumentationContext emitInstrumentation:](self->_currentInstrumentationContext, "emitInstrumentation:", v5);
}

- (void)instrumentationDictationTranscriptionMetadataEmitInstrumentationWithDictationResult:(id)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  objc_class *v24;
  id v25;
  void *v26;
  void *v27;
  objc_class *v28;
  id v29;
  uint64_t v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;
  uint64_t v42;
  void (*v43)(uint64_t);
  void *v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v35 = a3;
  objc_msgSend(v35, "dictationPhraseArray");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "bestTextForMultilingualAlternatives");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  v5 = (void *)MEMORY[0x1E0C9AA60];
  if (v3)
    v5 = (void *)v3;
  v32 = v5;

  if (objc_msgSend(v35, "lowConfidenceAboutLanguageDetection")
    && objc_msgSend(v35, "showMultilingualAlternatives")
    && objc_msgSend(v32, "count"))
  {
    objc_msgSend(v35, "multilingualAlternatives");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7)
    {
      objc_msgSend(v35, "multilingualAlternatives");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndex:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "dominantLanguage");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = 0;
      v12 = 0;
    }
    else
    {
      v11 = 0;
      v12 = 0;
      v10 = 0;
    }
    v22 = 1;
  }
  else
  {
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v13 = v34;
    v11 = 0;
    v12 = 0;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v37, v50, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v38 != v15)
            objc_enumerationMutation(v13);
          v17 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
          if (objc_msgSend(v17, "style", v32) == 1)
          {
            objc_msgSend(v17, "text");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "componentsSeparatedByCharactersInSet:", v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v20, "count");

            v12 = (v12 + 1);
            v11 = (v11 + v21);
          }
        }
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v37, v50, 16);
      }
      while (v14);
    }

    v22 = 0;
    v10 = 0;
  }
  v46 = 0;
  v47 = &v46;
  v48 = 0x2050000000;
  v23 = (void *)qword_1ECD797C8;
  v49 = qword_1ECD797C8;
  if (!qword_1ECD797C8)
  {
    v41 = MEMORY[0x1E0C809B0];
    v42 = 3221225472;
    v43 = __getSISchemaDictationAlternativesPresentClass_block_invoke;
    v44 = &unk_1E16B14C0;
    v45 = &v46;
    __getSISchemaDictationAlternativesPresentClass_block_invoke((uint64_t)&v41);
    v23 = (void *)v47[3];
  }
  v24 = objc_retainAutorelease(v23);
  _Block_object_dispose(&v46, 8);
  v25 = objc_alloc_init(v24);
  objc_msgSend(v25, "setNumberOfUnderlines:", v12);
  objc_msgSend(v25, "setCountOfWordsUnderlined:", v11);
  if (v10)
  {
    objc_msgSend((id)objc_opt_class(), "UIDictationInstrumentaionLocalIdentifierWithLocalString:", v10);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setAlternativesLocale:", v26);

  }
  else
  {
    objc_msgSend(v25, "setAlternativesLocale:", 0);
  }
  objc_msgSend(v25, "setMultilingualIsLowConfidence:", v22, v32);
  v46 = 0;
  v47 = &v46;
  v48 = 0x2050000000;
  v27 = (void *)qword_1ECD797D0;
  v49 = qword_1ECD797D0;
  if (!qword_1ECD797D0)
  {
    v41 = MEMORY[0x1E0C809B0];
    v42 = 3221225472;
    v43 = __getSISchemaDictationTranscriptionMetadataClass_block_invoke;
    v44 = &unk_1E16B14C0;
    v45 = &v46;
    __getSISchemaDictationTranscriptionMetadataClass_block_invoke((uint64_t)&v41);
    v27 = (void *)v47[3];
  }
  v28 = objc_retainAutorelease(v27);
  _Block_object_dispose(&v46, 8);
  v29 = objc_alloc_init(v28);
  if (-[UIDictationController secureOfflineOnlySpeechRecognition](self, "secureOfflineOnlySpeechRecognition"))
    v30 = 1;
  else
    v30 = 2;
  objc_msgSend(v29, "setDictationModel:", v30);
  if (-[UIDictationController secureOfflineOnlySpeechRecognition](self, "secureOfflineOnlySpeechRecognition"))
  {
    -[UIDictationController modelInfo](self, "modelInfo");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setDictationModelVersion:", v31);

  }
  else
  {
    objc_msgSend(v29, "setDictationModelVersion:", 0);
  }
  objc_msgSend(v29, "setDictationAlternativesPresent:", v25);
  -[AFAnalyticsTurnBasedInstrumentationContext emitInstrumentation:](self->_currentInstrumentationContext, "emitInstrumentation:", v29);

}

+ (id)UIDictationInstrumentaionLocalIdentifierWithLocalString:(id)a3
{
  id v3;
  void *v4;
  objc_class *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v3 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2050000000;
  v4 = (void *)getSISchemaLocaleIdentifierClass_softClass;
  v14 = getSISchemaLocaleIdentifierClass_softClass;
  if (!getSISchemaLocaleIdentifierClass_softClass)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __getSISchemaLocaleIdentifierClass_block_invoke;
    v10[3] = &unk_1E16B14C0;
    v10[4] = &v11;
    __getSISchemaLocaleIdentifierClass_block_invoke((uint64_t)v10);
    v4 = (void *)v12[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v11, 8);
  v6 = objc_alloc_init(v5);
  TIInputModeGetBaseLanguage();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLanguageCode:", v7);

  TIInputModeGetRegion();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCountryCode:", v8);

  return v6;
}

+ (int)UIDictationStartStopReasonToInstrumentationInvocationSourceType:(unint64_t)a3
{
  if (a3 - 1 > 0x1B)
    return 0;
  else
    return dword_1866808CC[a3 - 1];
}

+ (int)UIDictationStartStopReasonToInstrumentationDictationEndPointType:(unint64_t)a3
{
  if (a3 - 1 > 0x1C)
    return 0;
  else
    return dword_18668093C[a3 - 1];
}

+ (void)instrumentationDictationAlternativesViewedWithInstrumentationContext:(id)a3 alternatives:(id)a4 dictationLanguage:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  objc_class *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
  {
    v20 = 0;
    v21 = &v20;
    v22 = 0x2050000000;
    v11 = (void *)getSISchemaDictationAlternativesViewedClass_softClass;
    v23 = getSISchemaDictationAlternativesViewedClass_softClass;
    if (!getSISchemaDictationAlternativesViewedClass_softClass)
    {
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __getSISchemaDictationAlternativesViewedClass_block_invoke;
      v19[3] = &unk_1E16B14C0;
      v19[4] = &v20;
      __getSISchemaDictationAlternativesViewedClass_block_invoke((uint64_t)v19);
      v11 = (void *)v21[3];
    }
    v12 = objc_retainAutorelease(v11);
    _Block_object_dispose(&v20, 8);
    v13 = objc_alloc_init(v12);
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("alternatives"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setCountOfAlternativesAvailable:", objc_msgSend(v14, "count"));

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("originalText"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "componentsSeparatedByCharactersInSet:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setCountOfWordsUnderlined:", objc_msgSend(v17, "count"));

    if (v10)
    {
      objc_msgSend(a1, "UIDictationInstrumentaionLocalIdentifierWithLocalString:", v10);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setAlternativesLocale:", v18);

    }
    else
    {
      objc_msgSend(v13, "setAlternativesLocale:", 0);
    }
    objc_msgSend(v8, "emitInstrumentation:", v13);

  }
}

+ (void)instrumentationDictationAlternativeSelectedWithInstrumentationContext:(id)a3 originalText:(id)a4 replacementText:(id)a5 replacementIndex:(unint64_t)a6 alternativesAvailableCount:(unint64_t)a7 dictationLanguage:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  objc_class *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[5];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a8;
  if (v14)
  {
    v25 = 0;
    v26 = &v25;
    v27 = 0x2050000000;
    v18 = (void *)getSISchemaDictationAlternativeSelectedClass_softClass;
    v28 = getSISchemaDictationAlternativeSelectedClass_softClass;
    if (!getSISchemaDictationAlternativeSelectedClass_softClass)
    {
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __getSISchemaDictationAlternativeSelectedClass_block_invoke;
      v24[3] = &unk_1E16B14C0;
      v24[4] = &v25;
      __getSISchemaDictationAlternativeSelectedClass_block_invoke((uint64_t)v24);
      v18 = (void *)v26[3];
    }
    v19 = objc_retainAutorelease(v18);
    _Block_object_dispose(&v25, 8);
    v20 = objc_alloc_init(v19);
    objc_msgSend(v20, "setAlternativeListPosition:", a6);
    objc_msgSend(v20, "setCountOfAlternativesAvailable:", a7);
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "componentsSeparatedByCharactersInSet:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setCountOfWordsReplaced:", objc_msgSend(v22, "count"));

    if (v17)
    {
      objc_msgSend(a1, "UIDictationInstrumentaionLocalIdentifierWithLocalString:", v17);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setAlternativesLocale:", v23);

    }
    else
    {
      objc_msgSend(v20, "setAlternativesLocale:", 0);
    }
    objc_msgSend(v14, "emitInstrumentation:", v20);

  }
}

- (void)optInButtonPressedForPresenter:(id)a3
{
  uint64_t v4;
  void *v5;
  id v6;

  v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", 1);
  v5 = (void *)qword_1ECD79678;
  qword_1ECD79678 = v4;

  -[UIDictationController _handleDataSharingSheetDecision](self, "_handleDataSharingSheetDecision");
  objc_msgSend(MEMORY[0x1E0DBDB40], "dismissedDataSharingWithResponse:", 1);
  -[UIDictationController presentingViewControllerForPrivacySheet](self, "presentingViewControllerForPrivacySheet");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)optOutButtonPressedForPresenter:(id)a3
{
  uint64_t v4;
  void *v5;
  id v6;

  v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", 1);
  v5 = (void *)qword_1ECD79678;
  qword_1ECD79678 = v4;

  -[UIDictationController _handleDataSharingSheetDecision](self, "_handleDataSharingSheetDecision");
  objc_msgSend(MEMORY[0x1E0DBDB40], "dismissedDataSharingWithResponse:", 3);
  -[UIDictationController presentingViewControllerForPrivacySheet](self, "presentingViewControllerForPrivacySheet");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, 0);

}

+ (BOOL)shouldPreferOnlineRecognition
{
  void *v2;
  void *v3;
  char v4;

  +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textInputTraits");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "preferOnlineDictation");

  return v4;
}

+ (BOOL)shouldPreferOnDeviceRecognition
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  char v6;

  if ((objc_msgSend(a1, "shouldPreferOnlineRecognition") & 1) != 0)
    return 0;
  +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textInputTraits");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "returnKeyType");

  if (v4 != 6)
    return 0;
  +[UIKeyboard keyboardBundleIdentifier](UIKeyboard, "keyboardBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(&unk_1E1A93F80, "containsObject:", v5);

  return v6;
}

+ (BOOL)isInputDelegateSafariAddressBar
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  if (!+[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess"))
  {
    +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "inputDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    NSClassFromString(CFSTR("UnifiedField"));
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_3;
LABEL_5:
    v5 = 0;
    goto LABEL_6;
  }
  +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_inputDelegateClassName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UnifiedField")) & 1) == 0)
    goto LABEL_5;
LABEL_3:
  +[UIKeyboard keyboardBundleIdentifier](UIKeyboard, "keyboardBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.mobilesafari"));

LABEL_6:
  return v5;
}

+ (BOOL)isEventFromMessagesSendButton:(id)a3 inspectResponderChain:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  v4 = a4;
  v5 = a3;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "textInputTraits");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "keyboardType");

  if (v8 == 126)
  {
    if (qword_1ECD79700 != -1)
      dispatch_once(&qword_1ECD79700, &__block_literal_global_986_0);
    do
    {
      if (qword_1ECD79708 && (objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v5, "accessibilityIdentification");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v10) = objc_msgSend(v9, "isEqualToString:", CFSTR("sendButton"));

      }
      else
      {
        LODWORD(v10) = 0;
      }
      if (((v10 | !v4) & 1) != 0)
        break;
      objc_msgSend(v5, "nextResponder");
      v10 = objc_claimAutoreleasedReturnValue();

      v5 = (id)v10;
    }
    while (v10);
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

Class __77__UIDictationController_isEventFromMessagesSendButton_inspectResponderChain___block_invoke()
{
  Class result;

  result = NSClassFromString(CFSTR("CKEntryViewButton"));
  qword_1ECD79708 = (uint64_t)result;
  return result;
}

- (void)sendButtonPressedInMessages:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _BOOL4 v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  const __CFString *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (+[UIDictationController isRunning](UIDictationController, "isRunning"))
  {
    -[UIDictationController setSendButtonPressedDuringDictation:](self, "setSendButtonPressedDuringDictation:", 1);
    -[UIDictationController dictationTipController](self, "dictationTipController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "signalDictationSendMessageTip");

  }
  v6 = (void *)objc_opt_class();
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "inputDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "logCorrectionStatisticsForDelegate:reason:", v8, 25);

  v16 = 0;
  v17 = &v16;
  v18 = 0x2050000000;
  v9 = (void *)getAFDictationDiscoverabilitySignalsStreamManagerClass_softClass;
  v19 = getAFDictationDiscoverabilitySignalsStreamManagerClass_softClass;
  if (!getAFDictationDiscoverabilitySignalsStreamManagerClass_softClass)
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __getAFDictationDiscoverabilitySignalsStreamManagerClass_block_invoke;
    v15[3] = &unk_1E16B14C0;
    v15[4] = &v16;
    __getAFDictationDiscoverabilitySignalsStreamManagerClass_block_invoke((uint64_t)v15);
    v9 = (void *)v17[3];
  }
  v10 = objc_retainAutorelease(v9);
  _Block_object_dispose(&v16, 8);
  _UIMainBundleIdentifier();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = CFSTR("dictation-active");
  v12 = -[UIDictationController isSendButtonPressedDuringDictation](self, "isSendButtonPressedDuringDictation");
  v13 = MEMORY[0x1E0C9AAA0];
  if (v12)
    v13 = MEMORY[0x1E0C9AAB0];
  v21[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sendSendMessageSentEventWithBundleIdentifier:context:userInfo:", v11, 0, v14);

}

- (unint64_t)specificReasonTypeFromApplicationDuringDictation
{
  if (-[UIDictationController isSendButtonPressedDuringDictation](self, "isSendButtonPressedDuringDictation"))
    return 25;
  else
    return 17;
}

+ (unint64_t)specificReasonTypeMicButtonOnKeyboard
{
  if (+[UIDictationController isDictationSearchBarButtonVisible](UIDictationController, "isDictationSearchBarButtonVisible"))
  {
    return 2;
  }
  if (+[UIDictationController isInputDelegateSafariAddressBar](UIDictationController, "isInputDelegateSafariAddressBar"))
  {
    return 3;
  }
  return 1;
}

+ (unint64_t)specificReasonTypeMicButtonOnKeyboardWithInputSwitcher
{
  if (+[UIDictationController isDictationSearchBarButtonVisible](UIDictationController, "isDictationSearchBarButtonVisible"))
  {
    return 5;
  }
  if (+[UIDictationController isInputDelegateSafariAddressBar](UIDictationController, "isInputDelegateSafariAddressBar"))
  {
    return 6;
  }
  return 4;
}

- (void)insertLastHypothesisAsFinalResultLocally
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  UIDictationSerializableResults *v8;
  UIDictationSerializableResults *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  -[UIDictationController lastHypothesis](self, "lastHypothesis");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[UIDictationController isRunning](UIDictationController, "isRunning"))
  {
    +[UIKeyboardInputMode dictationInputMode](UIKeyboardInputMode, "dictationInputMode");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "usingTypeAndTalk") & 1) != 0)
    {
      v5 = objc_msgSend(v3, "length");

      if (v5)
      {
        -[UIDictationController candidateDictationSerializableResults](self, "candidateDictationSerializableResults");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v6;
        if (v6)
        {
          v8 = v6;
        }
        else
        {
          v9 = [UIDictationSerializableResults alloc];
          v12 = v3;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v13[0] = v10;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = -[UIDictationSerializableResults initWithArrayOfArrayOfStrings:](v9, "initWithArrayOfArrayOfStrings:", v11);

        }
        -[UIDictationController setCandidateDictationSerializableResults:](self, "setCandidateDictationSerializableResults:", 0);
        -[UIDictationController finalizeDictationRecognitionWithPhrases:languageModel:correctionIdentifier:secureInput:finalResult:](self, "finalizeDictationRecognitionWithPhrases:languageModel:correctionIdentifier:secureInput:finalResult:", v8, &stru_1E16EDF20, 0, 0, 0);
        -[UIDictationController setLastHypothesis:](self, "setLastHypothesis:", 0);

      }
    }
    else
    {

    }
  }

}

- (BOOL)isDictationPaused
{
  return self->_shouldResumeDictation;
}

+ (BOOL)_shouldPerformPhrasesFinalizationIgnoringRTIChangesWithUserInteraction:(int64_t)a3
{
  return ((unint64_t)a3 > 7) | (0x3Cu >> a3) & 1;
}

- (void)_finalizePhrasesOnDictationPause
{
  void *v3;
  void *v4;
  UIDictationSerializableResults *v5;
  UIDictationSerializableResults *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  -[UIDictationController candidateDictationSerializableResults](self, "candidateDictationSerializableResults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    v6 = [UIDictationSerializableResults alloc];
    -[UIDictationController lastHypothesis](self, "lastHypothesis");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[UIDictationSerializableResults initWithArrayOfArrayOfStrings:](v6, "initWithArrayOfArrayOfStrings:", v9);

  }
  -[UIDictationController setCandidateDictationSerializableResults:](self, "setCandidateDictationSerializableResults:", 0);
  -[UIDictationController dictationConnection](self, "dictationConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIDictationController dictationConnection](self, "dictationConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIDictationController dictationConnection:finalizePhrases:languageModel:correctionIdentifier:secureInput:finalResult:](self, "dictationConnection:finalizePhrases:languageModel:correctionIdentifier:secureInput:finalResult:", v10, v5, &stru_1E16EDF20, 0, objc_msgSend(v11, "isSecureInput"), 0);

}

- (void)pauseDictation
{
  -[UIDictationController pauseDictationOnUserInteraction:](self, "pauseDictationOnUserInteraction:", 9);
}

- (void)pauseDictationOnUserInteraction:(int64_t)a3
{
  NSObject *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  _BOOL4 shouldResumeDictation;
  _QWORD v10[5];
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (+[UIDictationController isRunning](UIDictationController, "isRunning")
    && !self->_shouldResumeDictation
    && !-[UIDictationController dictationIsModifyingText](self, "dictationIsModifyingText"))
  {
    _UIDictationControllerLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v12 = "-[UIDictationController pauseDictationOnUserInteraction:]";
      _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_DEFAULT, "%s UIDictationController should pause dictation", buf, 0xCu);
    }

    -[UIDictationController _stopStreamingAnimation](self, "_stopStreamingAnimation");
    -[UIDictationController pauseSpeechRecognition](self, "pauseSpeechRecognition");
    -[UIDictationController lastHypothesis](self, "lastHypothesis");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _UIDictationControllerLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v12 = "-[UIDictationController pauseDictationOnUserInteraction:]";
      v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_DEFAULT, "%s lastHypothesis at beginUserInteraction: '%@'", buf, 0x16u);
    }

    if (objc_msgSend(v6, "length"))
    {
      if (objc_msgSend((id)objc_opt_class(), "_shouldPerformPhrasesFinalizationIgnoringRTIChangesWithUserInteraction:", a3))
      {
        v10[0] = MEMORY[0x1E0C809B0];
        v10[1] = 3221225472;
        v10[2] = __57__UIDictationController_pauseDictationOnUserInteraction___block_invoke;
        v10[3] = &unk_1E16B1B28;
        v10[4] = self;
        -[UIDictationController performIgnoringRTIChanges:](self, "performIgnoringRTIChanges:", v10);
      }
      else
      {
        -[UIDictationController _finalizePhrasesOnDictationPause](self, "_finalizePhrasesOnDictationPause");
      }
    }
    self->_shouldResumeDictation = 1;
    _UIDictationControllerLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      shouldResumeDictation = self->_shouldResumeDictation;
      *(_DWORD *)buf = 136315394;
      v12 = "-[UIDictationController pauseDictationOnUserInteraction:]";
      v13 = 1024;
      LODWORD(v14) = shouldResumeDictation;
      _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_DEFAULT, "%s _shouldResumeDictation=%d", buf, 0x12u);
    }

  }
}

uint64_t __57__UIDictationController_pauseDictationOnUserInteraction___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finalizePhrasesOnDictationPause");
}

- (void)resumeDictation
{
  NSObject *v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  uint8_t buf[4];
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend((id)objc_opt_class(), "shouldForwardEventsToInputSystemUI"))
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "forwardDictationEvent_resumeDictation");

  }
  else if (-[UIDictationController shouldResumeDictation](self, "shouldResumeDictation")
         && +[UIDictationController isRunning](UIDictationController, "isRunning"))
  {
    _UIDictationControllerLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v8 = "-[UIDictationController resumeDictation]";
      _os_log_impl(&dword_185066000, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
    }

    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    byte_1ECD79659 = objc_msgSend(v4, "isShifted");

    -[UIDictationController setupForAsyncDelegate](self, "setupForAsyncDelegate");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Calling _refreshVisibleRTIDocumentStateWithContinuation"), "-[UIDictationController resumeDictation]");

    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __40__UIDictationController_resumeDictation__block_invoke;
    v6[3] = &unk_1E16D4A38;
    v6[4] = self;
    -[UIDictationController _refreshVisibleRTIDocumentStateWithContinuation:](self, "_refreshVisibleRTIDocumentStateWithContinuation:", v6);
  }
}

uint64_t __40__UIDictationController_resumeDictation__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "resumeSpeechRecognitionWithPrefixText:postfixText:selectedText:", a2, a3, a4);
}

- (void)resetSpeechRecognition
{
  _BOOL4 shouldResumeDictation;
  NSObject *v4;
  id v5;
  _QWORD v6[5];
  uint8_t buf[4];
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  +[UIKeyboardInputMode dictationInputMode](UIKeyboardInputMode, "dictationInputMode");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "usingTypeAndTalk")
    && +[UIDictationController isRunning](UIDictationController, "isRunning"))
  {
    shouldResumeDictation = self->_shouldResumeDictation;

    if (!shouldResumeDictation)
    {
      _UIDictationControllerLog();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v8 = "-[UIDictationController resetSpeechRecognition]";
        _os_log_impl(&dword_185066000, v4, OS_LOG_TYPE_DEFAULT, "%s UIDictationController reset speech recognition, stopping streaming animation", buf, 0xCu);
      }

      -[UIDictationController _stopStreamingAnimation](self, "_stopStreamingAnimation");
      -[UIDictationController pauseSpeechRecognition](self, "pauseSpeechRecognition");
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Calling _refreshVisibleRTIDocumentStateWithContinuation"), "-[UIDictationController resetSpeechRecognition]");

      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __47__UIDictationController_resetSpeechRecognition__block_invoke;
      v6[3] = &unk_1E16D4A38;
      v6[4] = self;
      -[UIDictationController _refreshVisibleRTIDocumentStateWithContinuation:](self, "_refreshVisibleRTIDocumentStateWithContinuation:", v6);
    }
  }
  else
  {

  }
}

uint64_t __47__UIDictationController_resetSpeechRecognition__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "resumeSpeechRecognitionWithPrefixText:postfixText:selectedText:", a2, a3, a4);
}

- (void)resetDictation
{
  id v3;

  -[UIDictationController _stopStreamingAnimation](self, "_stopStreamingAnimation");
  -[UIDictationController setTargetHypothesis:](self, "setTargetHypothesis:", 0);
  -[UIDictationController setLastHypothesis:](self, "setLastHypothesis:", 0);
  -[UIDictationController setPendingEdits:](self, "setPendingEdits:", 0);
  +[UIDictationController activeInstance](UIDictationController, "activeInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resetSpeechRecognition");

}

- (BOOL)userInteractionShouldResetAdaptiveDeleteActivationLogic:(int64_t)a3
{
  return ((unint64_t)a3 < 6) & (0x3Bu >> a3);
}

- (BOOL)userInteractionShouldDismissDictationTip:(int64_t)a3
{
  return (unint64_t)(a3 - 3) < 3;
}

- (void)beginUserInteraction:(int64_t)a3
{
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  NSObject *v18;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  int64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[UIDictationController dictationTipController](self, "dictationTipController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDismissalReasonType:", 2);

  if (+[UIDictationController isRunning](UIDictationController, "isRunning")
    && !self->_ignoreUserInteraction)
  {
    _UIDictationControllerLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "-[UIDictationController beginUserInteraction:]";
      v22 = 2048;
      v23 = a3;
      _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_DEFAULT, "%s UIDictationController beginUserInteraction: %ld", buf, 0x16u);
    }

    if (-[UIDictationController userInteractionShouldResetAdaptiveDeleteActivationLogic:](self, "userInteractionShouldResetAdaptiveDeleteActivationLogic:", a3))
    {
      -[UIDictationController resetAdaptiveDeleteActivationLogic](self, "resetAdaptiveDeleteActivationLogic");
    }
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[UIDictationController userInteractionShouldDismissDictationTip:](self, "userInteractionShouldDismissDictationTip:", a3))
    {
      objc_msgSend(v8, "dismissDictationTip");
    }
    objc_msgSend(v8, "_clearDictationMenuTimer:", 0);
    -[UIDictationController updateRecordingLimitTimerIfNeeded](self, "updateRecordingLimitTimerIfNeeded");
    if ((unint64_t)a3 <= 1)
    {
      -[UIDictationController _removeUndoNotificationObservation](self, "_removeUndoNotificationObservation");
      objc_msgSend(v8, "_textChoicesAssistant");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "resetDictationChoices");

      objc_msgSend(v8, "_textChoicesAssistant");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "resetDictationUnderlines");

    }
    if (!-[UIDictationController shouldResumeDictation](self, "shouldResumeDictation"))
    {
      +[UIKeyboardInputMode dictationInputMode](UIKeyboardInputMode, "dictationInputMode");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "usingTypeAndTalk");

      if (v12)
      {
        _UIDictationControllerUndoRedoLog();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v21 = "-[UIDictationController beginUserInteraction:]";
          _os_log_impl(&dword_185066000, v13, OS_LOG_TYPE_DEFAULT, "%s Ending undo grouping if necessary", buf, 0xCu);
        }

        -[UIDictationController _endUndoGroupingIfNecessary](self, "_endUndoGroupingIfNecessary");
        -[UIDictationController pauseDictationOnUserInteraction:](self, "pauseDictationOnUserInteraction:", a3);
        if (!-[UIDictationController modelessUsedAtLeastOnce](self, "modelessUsedAtLeastOnce"))
        {
          +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "_textInputSessionAnalytics");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "didDictationBegin:usesMultiModalDictation:", 0, 1);

          -[UIDictationController setModelessUsedAtLeastOnce:](self, "setModelessUsedAtLeastOnce:", 1);
        }
        if (!self->_dictationInputModeSwitchStarted)
        {
          self->_dictationInputModeSwitchStarted = 1;
          v16 = objc_alloc_init((Class)getSISchemaUEIDictationInputModeSwitchContextClass());
          v17 = objc_alloc_init((Class)getSISchemaUEIDictationInputModeSwitchStartedClass());
          objc_msgSend(v17, "setExists:", 1);
          objc_msgSend(v16, "setStartedOrChanged:", v17);
          -[AFAnalyticsTurnBasedInstrumentationContext emitInstrumentation:](self->_currentInstrumentationContext, "emitInstrumentation:", v16);

        }
      }
      else
      {
        _UIDictationControllerLog();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v21 = "-[UIDictationController beginUserInteraction:]";
          _os_log_impl(&dword_185066000, v18, OS_LOG_TYPE_DEFAULT, "%s UIDictationController should stop dictation", buf, 0xCu);
        }

        -[UIDictationController stopAndCancelDictationWithReasonType:](self, "stopAndCancelDictationWithReasonType:", 0);
      }
    }

  }
  else if (!a3)
  {
    +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dictationTipController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "processSoftwareKeyboardInteraction");

  }
}

- (void)endUserInteraction
{
  void *v3;
  char v4;
  void *v5;
  NSObject *v6;
  id v7;
  uint8_t buf[4];
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (+[UIDictationController isRunning](UIDictationController, "isRunning"))
  {
    if (-[UIDictationController shouldResumeDictation](self, "shouldResumeDictation")
      && !-[UIDictationController skipAutomaticResumeDictation](self, "skipAutomaticResumeDictation"))
    {
      if (+[UIDictationController isRunningInTypeAndTalkMode](UIDictationController, "isRunningInTypeAndTalkMode"))
      {
        -[UIDictationController resumeDictation](self, "resumeDictation");
        self->_shouldAttemptToShowTips = 1;
      }
      else
      {
        _UIDictationControllerLog();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v9 = "-[UIDictationController endUserInteraction]";
          _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_DEFAULT, "%s Setting shouldResumeDictation to NO", buf, 0xCu);
        }

        -[UIDictationController setShouldResumeDictation:](self, "setShouldResumeDictation:", 0);
      }
    }
  }
  else
  {
    +[UIDictationLandingView activeInstance](UIDictationLandingView, "activeInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "hasActivePlaceholder");

    if ((v4 & 1) == 0)
    {
      +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "dictationTipController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "processUserInteractionEnded");

    }
  }
}

- (void)resumeSpeechRecognitionWithPrefixText:(id)a3 postfixText:(id)a4 selectedText:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  _BOOL4 shouldResumeDictation;
  int v14;
  const char *v15;
  __int16 v16;
  _BOOL4 v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[UIDictationController dictationConnection](self, "dictationConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "resumeSpeechRecognitionWithPrefixText:postfixText:selectedText:", v10, v9, v8);

  self->_shouldResumeDictation = 0;
  _UIDictationControllerLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    shouldResumeDictation = self->_shouldResumeDictation;
    v14 = 136315394;
    v15 = "-[UIDictationController resumeSpeechRecognitionWithPrefixText:postfixText:selectedText:]";
    v16 = 1024;
    v17 = shouldResumeDictation;
    _os_log_impl(&dword_185066000, v12, OS_LOG_TYPE_DEFAULT, "%s _shouldResumeDictation=%d", (uint8_t *)&v14, 0x12u);
  }

  -[UIDictationController setState:](self, "setState:", 2);
  if (self->_shouldAttemptToShowTips)
  {
    -[UIDictationTipController presentDelayedTipIfNeeded](self->_dictationTipController, "presentDelayedTipIfNeeded");
    self->_shouldAttemptToShowTips = 0;
  }
  -[UIDictationController postNotificationName:userInfo:](self, "postNotificationName:userInfo:", CFSTR("UIDictationControllerDidResumeNotification"), 0);
}

- (void)pauseSpeechRecognition
{
  void *v3;

  -[UIDictationController dictationConnection](self, "dictationConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pauseSpeechRecognition");

  -[UIDictationController postNotificationName:userInfo:](self, "postNotificationName:userInfo:", CFSTR("UIDictationControllerDidPauseNotification"), 0);
}

- (void)clearKeyboardTrackpadModeIfNeeded
{
  void *v2;
  void *v3;
  char v4;
  id v5;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isTrackpadMode"))
  {
    objc_msgSend(v5, "_layout");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "didEndTrackpadModeForServerSideDictation");

  }
  if ((objc_msgSend(v5, "isSyncingDictationLanguageForInputModeSwitch") & 1) == 0)
  {
    +[UIDictationView activeInstance](UIDictationView, "activeInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "switchingLanguage");

    if ((v4 & 1) == 0)
      objc_msgSend(v5, "clearDictationMenuTimer");
  }

}

- (void)removeSelectedText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  _QWORD v13[4];
  id v14;
  char v15;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inputDelegateManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectedTextRange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 && (objc_msgSend(v5, "isEmpty") & 1) == 0)
  {
    -[UIDictationController setCanUndoOrRedo:](self, "setCanUndoOrRedo:", 0);
    objc_msgSend(v3, "inputDelegateManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "hasAsyncCapableInputDelegate");

    v8 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __43__UIDictationController_removeSelectedText__block_invoke;
    v13[3] = &unk_1E16B1B78;
    v14 = v3;
    v15 = v7;
    -[UIDictationController performIgnoringDocumentChanges:](self, "performIgnoringDocumentChanges:", v13);
    if (v7)
    {
      v12[0] = v8;
      v12[1] = 3221225472;
      v12[2] = __43__UIDictationController_removeSelectedText__block_invoke_3;
      v12[3] = &unk_1E16BB2B0;
      v12[4] = self;
      -[UIDictationController _requestDocumentContextWithCompletionHandler:](self, "_requestDocumentContextWithCompletionHandler:", v12);
    }
    -[UIDictationController setCanUndoOrRedo:](self, "setCanUndoOrRedo:", 1);

  }
  objc_msgSend(v3, "dismissTextChoicePrompt");
  if (objc_msgSend((id)objc_opt_class(), "shouldForwardInInputSystemUI"))
  {
    objc_msgSend(v3, "inputDelegateManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "inputSystemSourceSession");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v10, "textOperations");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setEditingActionSelector:", sel_removeSelectedText);
      objc_msgSend(v10, "flushOperations");

    }
  }

}

void __43__UIDictationController_removeSelectedText__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t);
  void *v6;
  id v7;
  char v8;

  objc_msgSend(*(id *)(a1 + 32), "setTextInputChangesIgnored:", 1);
  v2 = *(void **)(a1 + 32);
  v3 = MEMORY[0x1E0C809B0];
  v4 = 3221225472;
  v5 = __43__UIDictationController_removeSelectedText__block_invoke_2;
  v6 = &unk_1E16B1B78;
  v8 = *(_BYTE *)(a1 + 40);
  v7 = v2;
  objc_msgSend(v7, "performOperations:withTextInputSource:", &v3, 2);
  objc_msgSend(*(id *)(a1 + 32), "setTextInputChangesIgnored:", 0, v3, v4, v5, v6);

}

void __43__UIDictationController_removeSelectedText__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  if (*(_BYTE *)(a1 + 40)
    || (objc_msgSend(*(id *)(a1 + 32), "inputDelegateManager"),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v2, "textInteractionAssistant"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        v2,
        !v3))
  {
    objc_msgSend(*(id *)(a1 + 32), "inputDelegateManager");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deleteBackward");
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "inputDelegateManager");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "insertText:", &stru_1E16EDF20);
  }

}

uint64_t __43__UIDictationController_removeSelectedText__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setupForAsyncDelegate");
}

- (BOOL)shouldSuppressPartialResults
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inputDelegateManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectedTextRange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEmpty"))
    v6 = -[UIDictationController hasSelectedTextRange](self, "hasSelectedTextRange");
  else
    v6 = 1;

  return v6;
}

- (BOOL)isSelectionBasedCommand:(unint64_t)a3
{
  return (a3 < 0x16) & (0x271508u >> a3);
}

- (BOOL)isSelectionRequiredForCommand:(unint64_t)a3
{
  return (a3 < 0x12) & (0x31508u >> a3);
}

- (BOOL)_isNonEmptyDocumentRequiredForCommand:(unint64_t)a3
{
  return a3 == 2
      || a3 == 15
      || -[UIDictationController isSelectionRequiredForCommand:](self, "isSelectionRequiredForCommand:");
}

- (void)requestVisibleTextWithCompletionBlock:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  objc_class *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v3 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2050000000;
  v4 = (void *)qword_1ECD797D8;
  v17 = qword_1ECD797D8;
  v5 = MEMORY[0x1E0C809B0];
  if (!qword_1ECD797D8)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __getRTIDocumentRequestClass_block_invoke;
    v13[3] = &unk_1E16B14C0;
    v13[4] = &v14;
    __getRTIDocumentRequestClass_block_invoke((uint64_t)v13);
    v4 = (void *)v15[3];
  }
  v6 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v14, 8);
  v7 = objc_alloc_init(v6);
  objc_msgSend(v7, "setFlags:", 9);
  objc_msgSend(v7, "setTextGranularity:", 1);
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "remoteTextInputPartnerPrivate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  v11[1] = 3221225472;
  v11[2] = __63__UIDictationController_requestVisibleTextWithCompletionBlock___block_invoke;
  v11[3] = &unk_1E16D4A60;
  v12 = v3;
  v10 = v3;
  objc_msgSend(v9, "_performDocumentRequest:completion:", v7, v11);

}

void __63__UIDictationController_requestVisibleTextWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __63__UIDictationController_requestVisibleTextWithCompletionBlock___block_invoke_2;
  v5[3] = &unk_1E16B1D18;
  v6 = v3;
  v7 = *(id *)(a1 + 32);
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

uint64_t __63__UIDictationController_requestVisibleTextWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  _UIDictationControllerLog();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315138;
      v8 = "-[UIDictationController requestVisibleTextWithCompletionBlock:]_block_invoke_2";
      _os_log_impl(&dword_185066000, v4, OS_LOG_TYPE_DEFAULT, "%s Received visible RTIDocumentState", (uint8_t *)&v7, 0xCu);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    +[UIKeyboard keyboardBundleIdentifier](UIKeyboard, "keyboardBundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 136315394;
    v8 = "-[UIDictationController requestVisibleTextWithCompletionBlock:]_block_invoke";
    v9 = 2112;
    v10 = v6;
    _os_log_error_impl(&dword_185066000, v4, OS_LOG_TYPE_ERROR, "%s Received nil RTIDocumentState, client: \"%@\", (uint8_t *)&v7, 0x16u);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_refreshVisibleRTIDocumentStateWithContinuation:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __73__UIDictationController__refreshVisibleRTIDocumentStateWithContinuation___block_invoke;
  v6[3] = &unk_1E16D4A88;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[UIDictationController requestVisibleTextWithCompletionBlock:](self, "requestVisibleTextWithCompletionBlock:", v6);

}

void __73__UIDictationController__refreshVisibleRTIDocumentStateWithContinuation___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  v3 = a2;
  objc_msgSend(v3, "documentState");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contextBeforeInput");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contextAfterInput");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "selectedText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setHasSelectedTextRange:", objc_msgSend(v6, "length") != 0);
  objc_msgSend(*(id *)(a1 + 32), "setVisibleRTIDocumentStateAtStart:", v3);

  objc_msgSend(*(id *)(a1 + 32), "setVisibleContextBeforeInputAtCommandExecution:", v4);
  objc_msgSend(*(id *)(a1 + 32), "setVisibleRTIDocumentStateAtCommandRecognition:", 0);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Dictation resume options. prefixText: %@, postfixText: %@, selectedText: %@"), "-[UIDictationController _refreshVisibleRTIDocumentStateWithContinuation:]_block_invoke", v4, v5, v6);

  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, void *, void *, void *))(v7 + 16))(v7, v4, v5, v6);

}

- (void)handleWKActionMoveAfter
{
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__UIDictationController_handleWKActionMoveAfter__block_invoke;
  v5[3] = &unk_1E16BB2B0;
  v6 = v3;
  v4 = v3;
  -[UIDictationController _requestDocumentContextWithCompletionHandler:](self, "_requestDocumentContextWithCompletionHandler:", v5);

}

void __48__UIDictationController_handleWKActionMoveAfter__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v3 = a2;
  v4 = objc_msgSend(v3, "selectedTextRange");
  v6 = objc_msgSend(v3, "directionalRangeForSelectionRange:", v4 + v5, 0);
  v8 = v7;

  objc_msgSend(*(id *)(a1 + 32), "inputDelegateManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __48__UIDictationController_handleWKActionMoveAfter__block_invoke_2;
  v10[3] = &unk_1E16B1B28;
  v11 = *(id *)(a1 + 32);
  objc_msgSend(v9, "adjustSelection:completionHandler:", v6, v8, v10);

}

uint64_t __48__UIDictationController_handleWKActionMoveAfter__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateForChangedSelection");
}

- (void)handleWKActionMoveBefore
{
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__UIDictationController_handleWKActionMoveBefore__block_invoke;
  v5[3] = &unk_1E16BB2B0;
  v6 = v3;
  v4 = v3;
  -[UIDictationController _requestDocumentContextWithCompletionHandler:](self, "_requestDocumentContextWithCompletionHandler:", v5);

}

void __49__UIDictationController_handleWKActionMoveBefore__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = objc_msgSend(v3, "directionalRangeForSelectionRange:", objc_msgSend(v3, "selectedTextRange"), 0);
  v6 = v5;

  objc_msgSend(*(id *)(a1 + 32), "inputDelegateManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __49__UIDictationController_handleWKActionMoveBefore__block_invoke_2;
  v8[3] = &unk_1E16B1B28;
  v9 = *(id *)(a1 + 32);
  objc_msgSend(v7, "adjustSelection:completionHandler:", v4, v6, v8);

}

uint64_t __49__UIDictationController_handleWKActionMoveBefore__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateForChangedSelection");
}

- (BOOL)currentLanguageIsVerbFirstCommandLanguage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  int v11;
  void *v12;
  void *v13;
  char v14;

  if (qword_1ECD79710 != -1)
    dispatch_once(&qword_1ECD79710, &__block_literal_global_999);
  -[UIDictationController currentLanguageVerbFirstCommandLanguageStatusCached](self, "currentLanguageVerbFirstCommandLanguageStatusCached");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = (void *)MEMORY[0x1E0C99DC8];
    -[UIDictationController language](self, "language");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localeWithLocaleIdentifier:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "languageCode");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    v9 = &stru_1E16EDF20;
    if (v7)
      v9 = (__CFString *)v7;
    v10 = v9;

    v11 = objc_msgSend((id)qword_1ECD79718, "containsObject:", v10);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v11 ^ 1u);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIDictationController setCurrentLanguageVerbFirstCommandLanguageStatusCached:](self, "setCurrentLanguageVerbFirstCommandLanguageStatusCached:", v12);
  }
  -[UIDictationController currentLanguageVerbFirstCommandLanguageStatusCached](self, "currentLanguageVerbFirstCommandLanguageStatusCached");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "BOOLValue");

  return v14;
}

void __66__UIDictationController_currentLanguageIsVerbFirstCommandLanguage__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("ja"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECD79718;
  qword_1ECD79718 = v0;

}

+ (id)firstParameterTextWithParameters:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  if (+[UIDictationController supportsSiriDictationVoiceCommands](UIDictationController, "supportsSiriDictationVoiceCommands"))
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Param0"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "text");
  }
  else
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("BuiltInLM.Dictation"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "objectForKey:", CFSTR("Text"));
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)secondParameterTextWithParameters:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  if (+[UIDictationController supportsSiriDictationVoiceCommands](UIDictationController, "supportsSiriDictationVoiceCommands"))
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Param1"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "text");
  }
  else
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("BuiltInLM.Dictation.2"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "objectForKey:", CFSTR("Text"));
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (unint64_t)commandIdentifierWithStringIdentifier:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  unint64_t v6;

  v3 = qword_1ECD79720;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&qword_1ECD79720, &__block_literal_global_1010_0);
  objc_msgSend((id)qword_1ECD79728, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "unsignedIntegerValue");
  return v6;
}

void __63__UIDictationController_commandIdentifierWithStringIdentifier___block_invoke()
{
  _BOOL4 v0;
  void *v1;
  void *v2;

  v0 = +[UIDictationController supportsSiriDictationVoiceCommands](UIDictationController, "supportsSiriDictationVoiceCommands");
  v1 = &unk_1E1A9B400;
  v2 = (void *)qword_1ECD79728;
  if (v0)
    v1 = &unk_1E1A9B3D8;
  qword_1ECD79728 = (uint64_t)v1;

}

- (void)clearSelectedTextAndLastDictationResult:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __65__UIDictationController_clearSelectedTextAndLastDictationResult___block_invoke;
  v3[3] = &unk_1E16B1B78;
  v3[4] = self;
  v4 = a3;
  -[UIDictationController performIgnoringDocumentChanges:](self, "performIgnoringDocumentChanges:", v3);
}

void __65__UIDictationController_clearSelectedTextAndLastDictationResult___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTextInputChangesIgnored:", 1);
  objc_msgSend(*(id *)(a1 + 32), "setCanUndoOrRedo:", 0);
  if (*(_BYTE *)(a1 + 40) && objc_msgSend(*(id *)(a1 + 32), "hasSelectedTextRange"))
  {
    objc_msgSend(v9, "inputDelegateManager");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "hasAsyncCapableInputDelegate");

    objc_msgSend(v9, "inputDelegateManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v3)
      objc_msgSend(v4, "deleteBackward");
    else
      objc_msgSend(v4, "insertText:", &stru_1E16EDF20);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "lastHypothesis");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "length");

    for (; v7; --v7)
    {
      objc_msgSend(v9, "inputDelegateManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "deleteBackward");

    }
    objc_msgSend(*(id *)(a1 + 32), "setLastHypothesis:", 0);
  }
  objc_msgSend(v9, "setTextInputChangesIgnored:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setCanUndoOrRedo:", 1);

}

- (void)searchString:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  id v23;

  v6 = a3;
  v7 = a4;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "inputDelegateManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hasAsyncCapableInputDelegate");

  if (!v10)
  {
    if (+[UIKeyboard inputUIOOP](UIKeyboard, "inputUIOOP"))
    {
      if (!+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
      {
        v13 = 0;
        v16 = 0;
LABEL_12:
        objc_msgSend(v13, "stringByReplacingOccurrencesOfString:withString:", CFSTR("’"), CFSTR("'"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v16, "stringByReplacingOccurrencesOfString:withString:", CFSTR("’"), CFSTR("'"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s contextBeforeInput: \n%@\ncontextAfterInput: \n%@"), "-[UIDictationController searchString:completionHandler:]", v19, v20);
        -[UIDictationController searchString:contextBefore:contextAfter:completionHandler:](self, "searchString:contextBefore:contextAfter:completionHandler:", v6, v19, v20, v7);

        goto LABEL_13;
      }
      -[UIDictationController visibleRTIDocumentStateAtCommandRecognition](self, "visibleRTIDocumentStateAtCommandRecognition");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "documentState");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "contextBeforeInput");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      -[UIDictationController visibleRTIDocumentStateAtCommandRecognition](self, "visibleRTIDocumentStateAtCommandRecognition");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "documentState");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "contextAfterInput");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[UIDictationController visibleContextBeforeInputAtCommandExecution](self, "visibleContextBeforeInputAtCommandExecution");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIDictationController visibleRTIDocumentStateAtCommandRecognition](self, "visibleRTIDocumentStateAtCommandRecognition");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "documentState");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
        -[UIDictationController visibleRTIDocumentStateAtCommandRecognition](self, "visibleRTIDocumentStateAtCommandRecognition");
      else
        -[UIDictationController visibleRTIDocumentStateAtStart](self, "visibleRTIDocumentStateAtStart");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "documentState");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "contextAfterInput");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_12;
  }
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __56__UIDictationController_searchString_completionHandler___block_invoke;
  v21[3] = &unk_1E16D4AD0;
  v21[4] = self;
  v22 = v6;
  v23 = v7;
  -[UIDictationController _requestDocumentContextWithCompletionHandler:](self, "_requestDocumentContextWithCompletionHandler:", v21);

LABEL_13:
}

void __56__UIDictationController_searchString_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = a2;
  v4 = objc_msgSend(v3, "selectedTextRange");
  objc_msgSend(*(id *)(a1 + 32), "setPreCommandExecutionPositionRange:", v4, v5);
  objc_msgSend(v3, "contextBefore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _stringForObject(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR("’"), CFSTR("'"));
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "contextAfter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  _stringForObject(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByReplacingOccurrencesOfString:withString:", CFSTR("’"), CFSTR("'"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "searchString:contextBefore:contextAfter:completionHandler:", *(_QWORD *)(a1 + 40), v11, v10, *(_QWORD *)(a1 + 48));
}

- (_NSRange)searchStringWithWordBoundariesValidation:(id)a3 substring:(id)a4 reverse:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  UIDictationWordsSeeker *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSUInteger v16;
  NSUInteger v17;
  uint64_t v18;
  NSUInteger v19;
  NSUInteger v20;
  _NSRange result;

  v5 = a5;
  v7 = a3;
  v8 = a4;
  v9 = objc_msgSend(v7, "rangeOfString:", v7);
  v11 = v10;
  v12 = -[UIDictationWordsSeeker initWithString:substring:reverse:]([UIDictationWordsSeeker alloc], "initWithString:substring:reverse:", v7, v8, v5);
  if (v5)
    v13 = 5;
  else
    v13 = 1;
  if (v11)
  {
    v14 = v11;
    while (1)
    {
      v15 = objc_msgSend(v7, "rangeOfString:options:range:", v8, v13, v9, v14);
      v17 = v16;
      if (v15 == 0x7FFFFFFFFFFFFFFFLL)
        break;
      v18 = v15;
      if (!-[UIDictationWordsSeeker validateWordBoundariesInRange:](v12, "validateWordBoundariesInRange:", v15, v16))
      {
        v9 = v5 ? 0 : v18 + v17;
        v14 = v5 ? v18 : v11 - (v18 + v17);
        if (v14)
          continue;
      }
      goto LABEL_18;
    }
  }
  else
  {
    v17 = 0;
  }
  v18 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_18:

  v19 = v18;
  v20 = v17;
  result.length = v20;
  result.location = v19;
  return result;
}

- (id)rangesForSearchStringWithWordBoundariesValidation:(id)a3 substring:(id)a4 reverse:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  UIDictationWordsSeeker *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v23;

  v5 = a5;
  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "rangeOfString:", v7);
  v11 = v10;
  v12 = -[UIDictationWordsSeeker initWithString:substring:reverse:]([UIDictationWordsSeeker alloc], "initWithString:substring:reverse:", v7, v8, v5);
  if (v5)
    v13 = 5;
  else
    v13 = 1;
  if (v11)
  {
    v14 = v11;
    do
    {
      v15 = objc_msgSend(v7, "rangeOfString:options:range:", v8, v13, v9, v14);
      if (v15 == 0x7FFFFFFFFFFFFFFFLL)
        break;
      v17 = v15;
      v18 = v16;
      if (-[UIDictationWordsSeeker validateWordBoundariesInRange:](v12, "validateWordBoundariesInRange:", v15, v16))
      {
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v17, v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "addObject:", v19);

      }
      v20 = v11 - (v17 + v18);
      v9 = v5 ? 0 : v17 + v18;
      v14 = v5 ? v17 : v20;
    }
    while (v14);
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v23);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (void)searchString:(id)a3 contextBefore:(id)a4 contextAfter:(id)a5 completionHandler:(id)a6
{
  UIDictationWordsSeeker *v10;
  id v11;
  void (**v12)(id, id, uint64_t, _QWORD);
  void *v13;
  uint64_t v14;
  void *v15;
  __CFString *v16;
  __CFString *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  UIDictationWordsSeeker *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;

  v30 = a3;
  v10 = (UIDictationWordsSeeker *)a4;
  v11 = a5;
  v12 = (void (**)(id, id, uint64_t, _QWORD))a6;
  if (qword_1ECD79738 != -1)
    dispatch_once(&qword_1ECD79738, &__block_literal_global_1121);
  -[UIDictationController language](self, "language");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  TIInputModeGetLanguage();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  v16 = &stru_1E16EDF20;
  if (v14)
    v16 = (__CFString *)v14;
  v17 = v16;

  if (objc_msgSend((id)qword_1ECD79730, "containsObject:", v17))
  {
    v18 = -[UIDictationWordsSeeker rangeOfString:options:](v10, "rangeOfString:options:", v30, 5);
    if (v18 == 0x7FFFFFFFFFFFFFFFLL || (v20 = v19) == 0)
    {
      v21 = objc_msgSend(v11, "rangeOfString:options:", v30, 1);
      v20 = v22;
      goto LABEL_20;
    }
LABEL_11:
    v21 = v18;
    if (!v12)
      goto LABEL_23;
    goto LABEL_22;
  }
  v18 = -[UIDictationController searchStringWithWordBoundariesValidation:substring:reverse:](self, "searchStringWithWordBoundariesValidation:substring:reverse:", v10, v30, 1);
  if (v18 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v20 = v23;
    if (v23)
      goto LABEL_11;
  }
  v24 = -[UIDictationController searchStringWithWordBoundariesValidation:substring:reverse:](self, "searchStringWithWordBoundariesValidation:substring:reverse:", v11, v30, 0);
  if (v24 == 0x7FFFFFFFFFFFFFFFLL || (v20 = v25) == 0)
  {
    v26 = objc_alloc_init(UIDictationWordsSeeker);
    v27 = -[UIDictationWordsSeeker rangeOfSubstring:fullString:reverse:](v26, "rangeOfSubstring:fullString:reverse:", v30, v10, 1);
    if (v27 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v20 = v28;
      if (v28)
      {
        v21 = v27;
        goto LABEL_21;
      }
    }
    v21 = -[UIDictationWordsSeeker rangeOfSubstring:fullString:reverse:](v26, "rangeOfSubstring:fullString:reverse:", v30, v11, 0);
    v20 = v29;

  }
  else
  {
    v21 = v24;
  }
LABEL_20:
  v26 = v10;
  v10 = 0;
LABEL_21:

  if (v12)
LABEL_22:
    v12[2](v12, v10, v21, v20);
LABEL_23:

}

void __83__UIDictationController_searchString_contextBefore_contextAfter_completionHandler___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("ja"), CFSTR("zh"), CFSTR("wuu"), CFSTR("yue"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECD79730;
  qword_1ECD79730 = v0;

}

+ (BOOL)canHandleCommandIdentifier:(unint64_t)a3
{
  if (a3 > 0x1B)
    return 0;
  if (((1 << a3) & 0xFF7DFFE) != 0)
    return 1;
  if (a3 == 19)
    return objc_msgSend(a1, "supportsSendVoiceCommand");
  else
    return 0;
}

+ (int)mapDictationCommandIdentifierToUEIcommandIdentifier:(unint64_t)a3
{
  if (a3 - 1 > 0x1A)
    return 0;
  else
    return dword_1866809B0[a3 - 1];
}

- (void)_restoreInsertionPointPositionWithKeyboard:(id)a3 originalPositionRange:(_NSRange)a4 targetRange:(_NSRange)a5 payloadRange:(_NSRange)a6 contextBefore:(BOOL)a7
{
  NSUInteger length;
  NSUInteger location;
  void *v10;
  void *v11;
  id v12;

  length = a4.length;
  location = a4.location;
  if (a7)
    location = a4.location - a5.length + a6.length;
  objc_msgSend(a3, "inputDelegateManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_textRangeFromNSRange:", location, length);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a3, "inputDelegateManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setSelectedTextRange:", v12);
}

- (void)_requestDocumentContextWithCompletionHandler:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  UIWKDocumentRequest *v7;

  v3 = a3;
  v7 = objc_alloc_init(UIWKDocumentRequest);
  -[UIWKDocumentRequest setFlags:](v7, "setFlags:", 133);
  if (_os_feature_enabled_impl())
    -[UIWKDocumentRequest setFlags:](v7, "setFlags:", -[UIWKDocumentRequest flags](v7, "flags") | 0x40);
  -[UIWKDocumentRequest setSurroundingGranularity:](v7, "setSurroundingGranularity:", 1);
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "inputDelegateManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "visibleTextRect");
  -[UIWKDocumentRequest setDocumentRect:](v7, "setDocumentRect:");

  objc_msgSend(v4, "inputDelegateManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "requestDocumentContext:completionHandler:", v7, v3);

}

- (void)_requestFullDocumentContextWithCompletionHandler:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  UIWKDocumentRequest *v8;

  v3 = a3;
  v8 = objc_alloc_init(UIWKDocumentRequest);
  -[UIWKDocumentRequest setFlags:](v8, "setFlags:", 133);
  -[UIWKDocumentRequest setSurroundingGranularity:](v8, "setSurroundingGranularity:", 5);
  if (_os_feature_enabled_impl())
    -[UIWKDocumentRequest setFlags:](v8, "setFlags:", -[UIWKDocumentRequest flags](v8, "flags") | 0x40);
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "inputDelegateManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textInputView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  -[UIWKDocumentRequest setDocumentRect:](v8, "setDocumentRect:");

  objc_msgSend(v4, "inputDelegateManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "requestDocumentContext:completionHandler:", v8, v3);

}

- (void)invalidateTextInputView
{
  void *v2;
  void *v3;
  id v4;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inputDelegateManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textInputView");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "layoutIfNeeded");
}

- (void)notifyDocumentStateChangedAndResumeDictation:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[UIDictationController invalidateTextInputView](self, "invalidateTextInputView");
  if (+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI")
    || !+[UIKeyboard inputUIOOP](UIKeyboard, "inputUIOOP"))
  {
    objc_msgSend(v5, "remoteTextInputPartner");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "documentStateChanged");

  }
  -[UIDictationController resumeDictation](self, "resumeDictation");

}

- (id)commandTargetStringWithDictationCommandIdentifier:(unint64_t)a3 parameters:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;

  v5 = a4;
  v6 = 0;
  if (a3 <= 0x17)
  {
    if (((1 << a3) & 0xC04AC2) != 0)
    {
      objc_msgSend((id)objc_opt_class(), "firstParameterTextWithParameters:", v5);
      v7 = objc_claimAutoreleasedReturnValue();
LABEL_6:
      v6 = (void *)v7;
      goto LABEL_7;
    }
    if (((1 << a3) & 0x30) != 0)
    {
      objc_msgSend((id)objc_opt_class(), "secondParameterTextWithParameters:", v5);
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
  }
LABEL_7:

  return v6;
}

+ (BOOL)supportsSendVoiceCommand
{
  void *v2;
  void *v3;
  char v4;
  BOOL v5;
  void *v6;
  void *v7;

  if (qword_1ECD79740 != -1)
    dispatch_once(&qword_1ECD79740, &__block_literal_global_1124_0);
  if (+[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess"))
  {
    v2 = (void *)qword_1ECD79748;
    +[UIKeyboard keyboardBundleIdentifier](UIKeyboard, "keyboardBundleIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v2, "containsObject:", v3);
  }
  else
  {
    if (+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
      return 1;
    if (qword_1ECD79750 != -1)
      dispatch_once(&qword_1ECD79750, &__block_literal_global_1130_0);
    if (!byte_1ECD7965D)
      return 0;
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "inputDelegateManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "textInputDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      v5 = 0;
      goto LABEL_6;
    }
    v4 = objc_msgSend(v3, "canPerformDictationAction:", CFSTR("UITextInputDictationActionTypeSend"));
  }
  v5 = v4;
LABEL_6:

  return v5;
}

void __49__UIDictationController_supportsSendVoiceCommand__block_invoke()
{
  void *v0;

  v0 = (void *)qword_1ECD79748;
  qword_1ECD79748 = (uint64_t)&unk_1E1A93F98;

}

void __49__UIDictationController_supportsSendVoiceCommand__block_invoke_2()
{
  void *v0;
  void *v1;
  id v2;

  v0 = (void *)qword_1ECD79748;
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  byte_1ECD7965D = objc_msgSend(v0, "containsObject:", v1);

}

- (void)_performStandardEditAction:(SEL)a3 sender:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a4;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "inputDelegateManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "delegateAsResponder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "canPerformAction:withSender:", a3, 0))
    objc_msgSend((id)UIApp, "sendAction:to:from:forEvent:", a3, v7, v8, 0);

}

- (id)_documentStateForCommandApplicability
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[UIDictationController visibleRTIDocumentStateAtCommandRecognition](self, "visibleRTIDocumentStateAtCommandRecognition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "documentState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[UIDictationController visibleRTIDocumentStateAtStart](self, "visibleRTIDocumentStateAtStart");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "documentState");
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (BOOL)hasTextMatchForString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  -[UIDictationController _documentStateForCommandApplicability](self, "_documentStateForCommandApplicability");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contextBeforeInput");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", CFSTR("’"), CFSTR("'"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "contextAfterInput");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", CFSTR("’"), CFSTR("'"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __47__UIDictationController_hasTextMatchForString___block_invoke;
  v11[3] = &unk_1E16D4B38;
  v11[4] = &v12;
  -[UIDictationController searchString:contextBefore:contextAfter:completionHandler:](self, "searchString:contextBefore:contextAfter:completionHandler:", v4, v7, v9, v11);
  LOBYTE(self) = *((_BYTE *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return (char)self;
}

uint64_t __47__UIDictationController_hasTextMatchForString___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a3 != 0x7FFFFFFFFFFFFFFFLL && a4 != 0)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  return result;
}

- (BOOL)canApplyVoiceCommandWithIdentifier:(id)a3 parameters:(id)a4 commandUtteranceString:(id)a5 voiceCommandUUID:(id)a6
{
  char *v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  BOOL v22;
  void *v23;
  void *v24;
  void *v25;
  BOOL v26;
  NSObject *v27;
  NSObject *v28;
  const char *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  uint64_t v39;
  void *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  id v44;
  _QWORD v45[5];
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  char v49;
  uint8_t buf[4];
  const char *v51;
  __int16 v52;
  char *v53;
  __int16 v54;
  NSObject *v55;
  __int16 v56;
  void *v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v10 = (char *)a3;
  v11 = a4;
  v44 = a5;
  v12 = a6;
  v13 = objc_msgSend((id)objc_opt_class(), "commandIdentifierWithStringIdentifier:", v10);
  v14 = objc_alloc_init((Class)getSISchemaUEIDictationVoiceCommandExecutedClass());
  objc_msgSend(v14, "setCommandType:", objc_msgSend((id)objc_opt_class(), "mapDictationCommandIdentifierToUEIcommandIdentifier:", v13));
  v15 = (void *)objc_msgSend(objc_alloc((Class)getSISchemaUUIDClass()), "initWithNSUUID:", v12);
  objc_msgSend(v14, "setVoiceCommandId:", v15);

  if (v13)
  {
    if ((objc_msgSend((id)objc_opt_class(), "canHandleCommandIdentifier:", v13) & 1) != 0)
    {
      -[UIDictationController _documentStateForCommandApplicability](self, "_documentStateForCommandApplicability");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "delegateAsResponder");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "_responderForEditing");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "undoManager");
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13 == 27)
      {
        if ((objc_msgSend(v42, "canRedo") & 1) == 0)
          goto LABEL_6;
      }
      else if (v13 == 21 && (objc_msgSend(v42, "canUndo") & 1) == 0)
      {
LABEL_6:
        _UIDictationControllerLog();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v51 = "-[UIDictationController canApplyVoiceCommandWithIdentifier:parameters:commandUtteranceString:voiceCommandUUID:]";
          _os_log_impl(&dword_185066000, v19, OS_LOG_TYPE_DEFAULT, "%s Command applicability check: command was undo or redo but undo manager says we can't", buf, 0xCu);
        }
        goto LABEL_42;
      }
      if (v43)
      {
        -[UIDictationController commandTargetStringWithDictationCommandIdentifier:parameters:](self, "commandTargetStringWithDictationCommandIdentifier:parameters:", v13, v11);
        v41 = objc_claimAutoreleasedReturnValue();
        if (-[UIDictationController isSelectionRequiredForCommand:](self, "isSelectionRequiredForCommand:", v13))
        {
          +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "inputDelegate");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "selectedTextRange");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v25, "isEmpty"))
          {
            v26 = -[UIDictationController hasSelectedTextRange](self, "hasSelectedTextRange");

            v27 = v41;
            if (!v26)
            {
              _UIDictationControllerLog();
              v28 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315394;
                v51 = "-[UIDictationController canApplyVoiceCommandWithIdentifier:parameters:commandUtteranceString:voiceCommandUUID:]";
                v52 = 2112;
                v53 = v10;
                v29 = "%s Command applicability check: no selection found for command with identifier: %@";
LABEL_26:
                _os_log_impl(&dword_185066000, v28, OS_LOG_TYPE_DEFAULT, v29, buf, 0x16u);
                goto LABEL_27;
              }
              goto LABEL_27;
            }
          }
          else
          {

            v27 = v41;
          }
LABEL_36:

          goto LABEL_37;
        }
        if (-[UIDictationController _isNonEmptyDocumentRequiredForCommand:](self, "_isNonEmptyDocumentRequiredForCommand:", v13)&& objc_msgSend(v43, "documentIsEmpty"))
        {
          _UIDictationControllerLog();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            v51 = "-[UIDictationController canApplyVoiceCommandWithIdentifier:parameters:commandUtteranceString:voiceCommandUUID:]";
            v52 = 2112;
            v53 = v10;
            v29 = "%s Command applicability check: document is empty but non-empty document required by command with identifier: %@";
            goto LABEL_26;
          }
LABEL_27:

LABEL_41:
          v19 = v41;
LABEL_42:

          objc_msgSend(v14, "setCommandStatus:", 3);
          -[AFAnalyticsTurnBasedInstrumentationContext emitInstrumentation:](self->_currentInstrumentationContext, "emitInstrumentation:", v14);
          v22 = 0;
          goto LABEL_43;
        }
        v27 = v41;
        if (!v41)
          goto LABEL_36;
        v46 = 0;
        v47 = &v46;
        v48 = 0x2020000000;
        v49 = 0;
        objc_msgSend(v43, "contextBeforeInput");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "stringByReplacingOccurrencesOfString:withString:", CFSTR("’"), CFSTR("'"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v43, "contextAfterInput");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "stringByReplacingOccurrencesOfString:withString:", CFSTR("’"), CFSTR("'"));
        v39 = objc_claimAutoreleasedReturnValue();

        v33 = v41;
        if (objc_msgSend(v44, "length"))
        {
          v35 = objc_msgSend(v31, "rangeOfString:options:", v44, 5);
          if (v35 != 0x7FFFFFFFFFFFFFFFLL && v35 + v34 == objc_msgSend(v31, "length"))
          {
            objc_msgSend(v31, "substringToIndex:", v35);
            v36 = objc_claimAutoreleasedReturnValue();

            v31 = (void *)v36;
            v33 = v41;
          }
        }
        v45[0] = MEMORY[0x1E0C809B0];
        v45[1] = 3221225472;
        v45[2] = __111__UIDictationController_canApplyVoiceCommandWithIdentifier_parameters_commandUtteranceString_voiceCommandUUID___block_invoke;
        v45[3] = &unk_1E16D4B38;
        v45[4] = &v46;
        -[UIDictationController searchString:contextBefore:contextAfter:completionHandler:](self, "searchString:contextBefore:contextAfter:completionHandler:", v33, v31, v39, v45, v39);
        if (!*((_BYTE *)v47 + 24))
        {
          _UIDictationControllerLog();
          v37 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315906;
            v51 = "-[UIDictationController canApplyVoiceCommandWithIdentifier:parameters:commandUtteranceString:voiceCommandUUID:]";
            v52 = 2112;
            v53 = v10;
            v54 = 2112;
            v55 = v41;
            v56 = 2112;
            v57 = v31;
            _os_log_impl(&dword_185066000, v37, OS_LOG_TYPE_DEFAULT, "%s Command applicability check: command target not found for command with identifier: %@, target: %@, context before \"%@\", buf, 0x2Au);
          }

          _Block_object_dispose(&v46, 8);
          goto LABEL_41;
        }

        _Block_object_dispose(&v46, 8);
      }
LABEL_37:
      v22 = 1;
LABEL_43:

      goto LABEL_44;
    }
    _UIDictationControllerLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v51 = v10;
      _os_log_impl(&dword_185066000, v21, OS_LOG_TYPE_DEFAULT, "UIDictationController unhandled command with identifier: %@", buf, 0xCu);
    }

    objc_msgSend(v14, "setCommandStatus:", 2);
    -[AFAnalyticsTurnBasedInstrumentationContext emitInstrumentation:](self->_currentInstrumentationContext, "emitInstrumentation:", v14);
  }
  else
  {
    _UIDictationControllerLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v51 = "-[UIDictationController canApplyVoiceCommandWithIdentifier:parameters:commandUtteranceString:voiceCommandUUID:]";
      v52 = 2112;
      v53 = v10;
      _os_log_impl(&dword_185066000, v20, OS_LOG_TYPE_DEFAULT, "%s Unknown command with identifier: %@", buf, 0x16u);
    }

    objc_msgSend(v14, "setCommandStatus:", 0);
    -[AFAnalyticsTurnBasedInstrumentationContext emitInstrumentation:](self->_currentInstrumentationContext, "emitInstrumentation:", v14);
  }
  v22 = 0;
LABEL_44:

  return v22;
}

uint64_t __111__UIDictationController_canApplyVoiceCommandWithIdentifier_parameters_commandUtteranceString_voiceCommandUUID___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a3 != 0x7FFFFFFFFFFFFFFFLL && a4 != 0)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  return result;
}

- (BOOL)_handleMultipleTextTargetsForText:(id)a3 payloadText:(id)a4 voiceCommandUUID:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  UITextInputController *v17;
  void *v18;
  void *v19;
  int v20;
  BOOL v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  UITextInputController *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t i;
  int v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t j;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v80;
  id v81;
  void *v82;
  void *v83;
  UIDictationController *v84;
  UITextInputController *v85;
  void *v86;
  void *v87;
  id obj;
  id v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  _QWORD v101[5];
  id v102;
  id v103;
  id v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  id v113;
  _BYTE v114[128];
  _BYTE v115[128];
  _QWORD v116[2];
  _BYTE v117[128];
  uint64_t v118;

  v118 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v89 = a4;
  v9 = a5;
  -[UIDictationController setCommandTargetRangeMatchingGazeRange:](self, "setCommandTargetRangeMatchingGazeRange:", 0);
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "inputDelegateManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hasAsyncCapableInputDelegate");

  v96 = v10;
  objc_msgSend(v10, "inputDelegateManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "keyInputDelegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_opt_respondsToSelector();

  v16 = 0;
  v17 = 0;
  if ((v15 & 1) != 0)
  {
    objc_msgSend(v10, "inputDelegateManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "keyInputDelegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "performSelector:", sel_textLayoutController);
    v17 = (UITextInputController *)objc_claimAutoreleasedReturnValue();

    -[_UITextLayoutControllerBase textInputController](v17);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v20 = objc_msgSend((id)objc_opt_class(), "supportsSiriDictationVoiceCommandsUIRedesign");
  v21 = 0;
  if (v16)
    v22 = 1;
  else
    v22 = v20;
  if ((v12 & 1) == 0 && v22)
  {
    v87 = v16;
    if (+[UIKeyboard inputUIOOP](UIKeyboard, "inputUIOOP"))
    {
      if (!+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
      {
        v28 = 0;
        v25 = 0;
LABEL_20:
        objc_msgSend(v25, "stringByReplacingOccurrencesOfString:withString:", CFSTR("’"), CFSTR("'"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v28, "stringByReplacingOccurrencesOfString:withString:", CFSTR("’"), CFSTR("'"));
        v37 = objc_claimAutoreleasedReturnValue();

        -[UIDictationController rangesForSearchStringWithWordBoundariesValidation:substring:reverse:](self, "rangesForSearchStringWithWordBoundariesValidation:substring:reverse:", v36, v8, objc_msgSend((id)objc_opt_class(), "supportsSiriDictationVoiceCommandsUIRedesign") ^ 1);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v86 = (void *)v37;
        -[UIDictationController rangesForSearchStringWithWordBoundariesValidation:substring:reverse:](self, "rangesForSearchStringWithWordBoundariesValidation:substring:reverse:", v37, v8, 0);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend(v38, "count");
        v41 = objc_msgSend(v39, "count") + v40;
        v42 = objc_msgSend((id)objc_opt_class(), "supportsSiriDictationVoiceCommandsUIRedesign") ^ 1;
        v21 = v41 > v42;
        if (v41 <= v42)
        {
          v62 = v36;
          v63 = v86;
          v16 = v87;
        }
        else
        {
          v84 = self;
          v85 = v17;
          v80 = v9;
          v81 = v8;
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          v109 = 0u;
          v110 = 0u;
          v111 = 0u;
          v112 = 0u;
          v82 = v39;
          v83 = v38;
          v116[0] = v38;
          v116[1] = v39;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v116, 2);
          obj = (id)objc_claimAutoreleasedReturnValue();
          v91 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v109, v117, 16);
          if (v91)
          {
            v90 = *(_QWORD *)v110;
            do
            {
              v43 = 0;
              do
              {
                if (*(_QWORD *)v110 != v90)
                  objc_enumerationMutation(obj);
                v92 = v43;
                v44 = *(void **)(*((_QWORD *)&v109 + 1) + 8 * v43);
                v105 = 0u;
                v106 = 0u;
                v107 = 0u;
                v108 = 0u;
                v45 = v44;
                v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v105, v115, 16);
                if (v46)
                {
                  v47 = v46;
                  v48 = *(_QWORD *)v106;
                  do
                  {
                    for (i = 0; i != v47; ++i)
                    {
                      if (*(_QWORD *)v106 != v48)
                        objc_enumerationMutation(v45);
                      v50 = objc_msgSend(*(id *)(*((_QWORD *)&v105 + 1) + 8 * i), "rangeValue");
                      v52 = v51;
                      if (v36)
                        v50 -= objc_msgSend(v36, "length");
                      objc_msgSend(v96, "inputDelegateManager");
                      v53 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v53, "textInputDelegate");
                      v54 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v54, "_rangeFromCurrentRangeWithDelta:", v50, v52);
                      v55 = (void *)objc_claimAutoreleasedReturnValue();

                      objc_msgSend(v94, "addObject:", v55);
                      v56 = (void *)MEMORY[0x1E0CB3B18];
                      objc_msgSend(v96, "inputDelegateManager");
                      v57 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v57, "textInputDelegate");
                      v58 = (void *)objc_claimAutoreleasedReturnValue();
                      v59 = objc_msgSend(v58, "_nsrangeForTextRange:", v55);
                      objc_msgSend(v56, "valueWithRange:", v59, v60);
                      v61 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v95, "addObject:", v61);

                    }
                    v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v105, v115, 16);
                  }
                  while (v47);
                }

                v36 = 0;
                v43 = v92 + 1;
              }
              while (v92 + 1 != v91);
              v36 = 0;
              v62 = 0;
              v91 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v109, v117, 16);
            }
            while (v91);
          }
          else
          {
            v62 = v36;
          }

          if (objc_msgSend((id)objc_opt_class(), "supportsSiriDictationVoiceCommandsUIRedesign"))
          {
            -[UIDictationController playVoiceCommandHapticFeedack](v84, "playVoiceCommandHapticFeedack");
            objc_msgSend(v96, "_textChoicesAssistant");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            v101[0] = MEMORY[0x1E0C809B0];
            v101[1] = 3221225472;
            v101[2] = __88__UIDictationController__handleMultipleTextTargetsForText_payloadText_voiceCommandUUID___block_invoke;
            v101[3] = &unk_1E16D4B60;
            v101[4] = v84;
            v9 = v80;
            v102 = v80;
            v65 = v94;
            v103 = v94;
            v104 = v96;
            objc_msgSend(v64, "decorateTextInRanges:replacementText:allowAutomaticReplacement:autoHide:voiceCommandTrackingUUID:withCompletionHandler:", v103, v89, 1, 0, v102, v101);

            v8 = v81;
          }
          else
          {
            objc_msgSend(v87, "removeAllTextAlternatives");
            objc_msgSend(v96, "inputDelegateManager");
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v66, "selectedTextRange");
            v93 = (void *)objc_claimAutoreleasedReturnValue();

            v99 = 0u;
            v100 = 0u;
            v97 = 0u;
            v98 = 0u;
            v67 = v94;
            v68 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v97, v114, 16);
            v8 = v81;
            if (v68)
            {
              v69 = v68;
              v70 = *(_QWORD *)v98;
              do
              {
                for (j = 0; j != v69; ++j)
                {
                  if (*(_QWORD *)v98 != v70)
                    objc_enumerationMutation(v67);
                  v72 = *(_QWORD *)(*((_QWORD *)&v97 + 1) + 8 * j);
                  objc_msgSend(v96, "inputDelegateManager");
                  v73 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v73, "textInRange:", v72);
                  v74 = (void *)objc_claimAutoreleasedReturnValue();

                  if ((objc_msgSend(v74, "isEqualToString:", v89) & 1) == 0)
                  {
                    objc_msgSend(v96, "inputDelegateManager");
                    v75 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v75, "setSelectedTextRange:", v72);

                    objc_msgSend(v96, "inputDelegateManager");
                    v76 = (void *)objc_claimAutoreleasedReturnValue();
                    v113 = v89;
                    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v113, 1);
                    v77 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v76, "insertText:alternatives:style:", v74, v77, 1);

                  }
                }
                v69 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v97, v114, 16);
              }
              while (v69);
            }

            objc_msgSend(v96, "inputDelegateManager");
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v78, "setSelectedTextRange:", v93);

            v9 = v80;
            v65 = v94;
          }

          v17 = v85;
          v63 = v86;
          v16 = v87;
          v21 = 1;
          v39 = v82;
          v38 = v83;
        }

        goto LABEL_54;
      }
      -[UIDictationController visibleRTIDocumentStateAtCommandRecognition](self, "visibleRTIDocumentStateAtCommandRecognition");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "documentState");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "contextBeforeInput");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      -[UIDictationController visibleRTIDocumentStateAtCommandRecognition](self, "visibleRTIDocumentStateAtCommandRecognition");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "documentState");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "contextAfterInput");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[UIDictationController visibleRTIDocumentStateAtCommandRecognition](self, "visibleRTIDocumentStateAtCommandRecognition");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "documentState");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (v30)
      {
        -[UIDictationController visibleRTIDocumentStateAtCommandRecognition](self, "visibleRTIDocumentStateAtCommandRecognition");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "documentState");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "contextBeforeInput");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        -[UIDictationController visibleContextBeforeInputAtCommandExecution](self, "visibleContextBeforeInputAtCommandExecution");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v33 = v17;

      -[UIDictationController visibleRTIDocumentStateAtCommandRecognition](self, "visibleRTIDocumentStateAtCommandRecognition");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "documentState");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (v27)
        -[UIDictationController visibleRTIDocumentStateAtCommandRecognition](self, "visibleRTIDocumentStateAtCommandRecognition");
      else
        -[UIDictationController visibleRTIDocumentStateAtStart](self, "visibleRTIDocumentStateAtStart");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "documentState");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "contextAfterInput");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = v33;
    }

    goto LABEL_20;
  }
LABEL_54:

  return v21;
}

uint64_t __88__UIDictationController__handleMultipleTextTargetsForText_payloadText_voiceCommandUUID___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  if (a2)
  {
    v3 = *(void **)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = (void *)MEMORY[0x1E0CB37E8];
    v6 = *(void **)(a1 + 48);
    v7 = a2;
    objc_msgSend(v5, "numberWithInt:", objc_msgSend(v6, "count"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "instrumentDictationVoiceCommandDisambiguationActionWithVoiceCommandUUID:disambiguationIndex:totalDisambiguationCount:", v4, v7, v8);

  }
  return objc_msgSend(*(id *)(a1 + 32), "notifyDocumentStateChangedAndResumeDictation:", *(_QWORD *)(a1 + 56));
}

- (void)instrumentDictationVoiceCommandUndoTapActionWithVoiceCommandUUID:(id)a3 undoTapAlternativeSelection:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  objc_class *v8;
  id v9;
  void *v10;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a4;
  v6 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2050000000;
  v7 = (void *)getSISchemaUEIDictationVoiceCommandUndoTapActionClass_softClass;
  v15 = getSISchemaUEIDictationVoiceCommandUndoTapActionClass_softClass;
  if (!getSISchemaUEIDictationVoiceCommandUndoTapActionClass_softClass)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __getSISchemaUEIDictationVoiceCommandUndoTapActionClass_block_invoke;
    v11[3] = &unk_1E16B14C0;
    v11[4] = &v12;
    __getSISchemaUEIDictationVoiceCommandUndoTapActionClass_block_invoke((uint64_t)v11);
    v7 = (void *)v13[3];
  }
  v8 = objc_retainAutorelease(v7);
  _Block_object_dispose(&v12, 8);
  v9 = objc_alloc_init(v8);
  v10 = (void *)objc_msgSend(objc_alloc((Class)getSISchemaUUIDClass()), "initWithNSUUID:", v6);
  objc_msgSend(v9, "setVoiceCommandId:", v10);

  objc_msgSend(v9, "setIsUndoTapAlternativeSelection:", v4);
  -[AFAnalyticsTurnBasedInstrumentationContext emitInstrumentation:](self->_currentInstrumentationContext, "emitInstrumentation:", v9);

}

- (void)instrumentDictationVoiceCommandDisambiguationActionWithVoiceCommandUUID:(id)a3 disambiguationIndex:(id)a4 totalDisambiguationCount:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  objc_class *v12;
  id v13;
  void *v14;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2050000000;
  v11 = (void *)getSISchemaUEIDictationVoiceCommandDisambiguationActionClass_softClass;
  v19 = getSISchemaUEIDictationVoiceCommandDisambiguationActionClass_softClass;
  if (!getSISchemaUEIDictationVoiceCommandDisambiguationActionClass_softClass)
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __getSISchemaUEIDictationVoiceCommandDisambiguationActionClass_block_invoke;
    v15[3] = &unk_1E16B14C0;
    v15[4] = &v16;
    __getSISchemaUEIDictationVoiceCommandDisambiguationActionClass_block_invoke((uint64_t)v15);
    v11 = (void *)v17[3];
  }
  v12 = objc_retainAutorelease(v11);
  _Block_object_dispose(&v16, 8);
  v13 = objc_alloc_init(v12);
  v14 = (void *)objc_msgSend(objc_alloc((Class)getSISchemaUUIDClass()), "initWithNSUUID:", v8);
  objc_msgSend(v13, "setVoiceCommandId:", v14);

  objc_msgSend(v13, "setDisambiguationType:", 1);
  objc_msgSend(v13, "setDisambiguationIndex:", objc_msgSend(v9, "intValue"));
  objc_msgSend(v13, "setTotalDisambiguationAlternatives:", objc_msgSend(v10, "intValue"));
  -[AFAnalyticsTurnBasedInstrumentationContext emitInstrumentation:](self->_currentInstrumentationContext, "emitInstrumentation:", v13);

}

- (void)_applyWKAlternativesPayload:(id)a3 toAbsoluteRanges:(id)a4 valueRangeToText:(id)a5 context:(id)a6 originalSelectedRange:(_NSRange)a7 completionHandler:(id)a8
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  NSUInteger length;
  NSUInteger location;
  _QWORD v33[4];
  id v34;
  UIDictationController *v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  NSUInteger v41;
  NSUInteger v42;

  length = a7.length;
  location = a7.location;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a8;
  v16 = a6;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "lastObject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "rangeValue");
  v21 = objc_msgSend(v16, "directionalRangeForSelectionRange:", v19, v20);
  v23 = v22;

  objc_msgSend(v17, "inputDelegateManager");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __135__UIDictationController__applyWKAlternativesPayload_toAbsoluteRanges_valueRangeToText_context_originalSelectedRange_completionHandler___block_invoke;
  v33[3] = &unk_1E16D4C00;
  v34 = v17;
  v35 = self;
  v36 = v14;
  v37 = v18;
  v38 = v12;
  v39 = v13;
  v41 = location;
  v42 = length;
  v40 = v15;
  v25 = v15;
  v26 = v13;
  v27 = v12;
  v28 = v18;
  v29 = v14;
  v30 = v17;
  objc_msgSend(v24, "adjustSelection:completionHandler:", v21, v23, v33);

}

void __135__UIDictationController__applyWKAlternativesPayload_toAbsoluteRanges_valueRangeToText_context_originalSelectedRange_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  __int128 v13;

  objc_msgSend(*(id *)(a1 + 32), "updateForChangedSelection");
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __135__UIDictationController__applyWKAlternativesPayload_toAbsoluteRanges_valueRangeToText_context_originalSelectedRange_completionHandler___block_invoke_2;
  v5[3] = &unk_1E16D4BD8;
  v2 = *(void **)(a1 + 40);
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  v8 = *(id *)(a1 + 64);
  v9 = *(id *)(a1 + 32);
  v13 = *(_OWORD *)(a1 + 88);
  v3 = *(id *)(a1 + 72);
  v4 = *(_QWORD *)(a1 + 40);
  v10 = v3;
  v11 = v4;
  v12 = *(id *)(a1 + 80);
  objc_msgSend(v2, "_requestDocumentContextWithCompletionHandler:", v5);

}

void __135__UIDictationController__applyWKAlternativesPayload_toAbsoluteRanges_valueRangeToText_context_originalSelectedRange_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  __int128 v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = a2;
  objc_msgSend(v3, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc((Class)off_1E1679D20);
  v25[0] = *(_QWORD *)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithPrimaryString:alternativeStrings:isLowConfidence:", v6, v8, 1);

  objc_msgSend(*(id *)(a1 + 56), "inputDelegateManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addTextAlternatives:", v9);

  v11 = objc_msgSend(v5, "directionalRangeForSelectionRange:", *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96));
  v13 = v12;

  objc_msgSend(*(id *)(a1 + 56), "inputDelegateManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __135__UIDictationController__applyWKAlternativesPayload_toAbsoluteRanges_valueRangeToText_context_originalSelectedRange_completionHandler___block_invoke_3;
  v17[3] = &unk_1E16D4BB0;
  v18 = *(id *)(a1 + 56);
  v15 = *(id *)(a1 + 64);
  v16 = *(_QWORD *)(a1 + 72);
  v19 = v15;
  v20 = v16;
  v21 = *(id *)(a1 + 48);
  v22 = *(id *)(a1 + 32);
  v24 = *(_OWORD *)(a1 + 88);
  v23 = *(id *)(a1 + 80);
  objc_msgSend(v14, "adjustSelection:completionHandler:", v11, v13, v17);

}

void __135__UIDictationController__applyWKAlternativesPayload_toAbsoluteRanges_valueRangeToText_context_originalSelectedRange_completionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  __int128 v9;

  objc_msgSend(*(id *)(a1 + 32), "updateForChangedSelection");
  objc_msgSend(*(id *)(a1 + 40), "removeLastObject");
  if (objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __135__UIDictationController__applyWKAlternativesPayload_toAbsoluteRanges_valueRangeToText_context_originalSelectedRange_completionHandler___block_invoke_4;
    v3[3] = &unk_1E16D4B88;
    v2 = *(void **)(a1 + 56);
    v4 = *(id *)(a1 + 48);
    v5 = v2;
    v6 = *(id *)(a1 + 40);
    v7 = *(id *)(a1 + 64);
    v9 = *(_OWORD *)(a1 + 80);
    v8 = *(id *)(a1 + 72);
    objc_msgSend(v4, "_requestDocumentContextWithCompletionHandler:", v3);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  }
}

uint64_t __135__UIDictationController__applyWKAlternativesPayload_toAbsoluteRanges_valueRangeToText_context_originalSelectedRange_completionHandler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_applyWKAlternativesPayload:toAbsoluteRanges:valueRangeToText:context:originalSelectedRange:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), a2, *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 64));
}

- (void)_handleWKMultipleTextTargetsForText:(id)a3 payloadText:(id)a4 voiceCommandUUID:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  char v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "inputDelegateManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "hasAsyncCapableInputDelegate");

  if ((v16 & 1) != 0)
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __108__UIDictationController__handleWKMultipleTextTargetsForText_payloadText_voiceCommandUUID_completionHandler___block_invoke;
    v17[3] = &unk_1E16D4C50;
    v17[4] = self;
    v18 = v10;
    v19 = v11;
    v20 = v14;
    v21 = v12;
    v22 = v13;
    -[UIDictationController _requestDocumentContextWithCompletionHandler:](self, "_requestDocumentContextWithCompletionHandler:", v17);

  }
  else
  {
    (*((void (**)(id, _QWORD))v13 + 2))(v13, 0);
  }

}

void __108__UIDictationController__handleWKMultipleTextTargetsForText_payloadText_voiceCommandUUID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  double x;
  double v36;
  double y;
  double v38;
  double width;
  double v40;
  double height;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t j;
  CGFloat v47;
  CGFloat v48;
  CGFloat v49;
  CGFloat v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  int v55;
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  void *v71;
  id obj;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  void *v77;
  uint64_t v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  uint64_t v83;
  void *v84;
  uint64_t v85;
  void *v86;
  id v87;
  uint64_t v88;
  _QWORD v89[4];
  id v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  _BYTE v103[128];
  _BYTE v104[128];
  _QWORD v105[2];
  _BYTE v106[128];
  uint64_t v107;
  CGRect v108;
  CGRect v109;
  CGRect v110;

  v107 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "contextBefore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _stringForObject(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR("’"), CFSTR("'"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "contextAfter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _stringForObject(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", CFSTR("’"), CFSTR("'"));
  v9 = objc_claimAutoreleasedReturnValue();

  v84 = v3;
  v83 = objc_msgSend(v3, "selectedTextRange");
  v11 = v10;
  objc_msgSend(*(id *)(a1 + 32), "rangesForSearchStringWithWordBoundariesValidation:substring:reverse:", v6, *(_QWORD *)(a1 + 40), objc_msgSend((id)objc_opt_class(), "supportsSiriDictationVoiceCommandsUIRedesign") ^ 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = (void *)v9;
  objc_msgSend(*(id *)(a1 + 32), "rangesForSearchStringWithWordBoundariesValidation:substring:reverse:", v9, *(_QWORD *)(a1 + 40), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "count");
  v15 = objc_msgSend(v13, "count") + v14;
  if (v15 <= (objc_msgSend((id)objc_opt_class(), "supportsSiriDictationVoiceCommandsUIRedesign") ^ 1))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
    v54 = v6;
  }
  else
  {
    v69 = v11;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v16 = objc_claimAutoreleasedReturnValue();
    v99 = 0u;
    v100 = 0u;
    v101 = 0u;
    v102 = 0u;
    v70 = v13;
    v71 = v12;
    v105[0] = v12;
    v105[1] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v105, 2);
    obj = (id)objc_claimAutoreleasedReturnValue();
    v74 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v99, v106, 16);
    if (v74)
    {
      v73 = *(_QWORD *)v100;
      v17 = 0x1E0CB3000uLL;
      v77 = (void *)v16;
      v78 = a1;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v100 != v73)
            objc_enumerationMutation(obj);
          v75 = v18;
          v19 = *(void **)(*((_QWORD *)&v99 + 1) + 8 * v18);
          v95 = 0u;
          v96 = 0u;
          v97 = 0u;
          v98 = 0u;
          v87 = v19;
          v88 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v95, v104, 16);
          if (v88)
          {
            v20 = *(_QWORD *)v96;
            v85 = *(_QWORD *)v96;
            v86 = v6;
            do
            {
              for (i = 0; i != v88; ++i)
              {
                if (*(_QWORD *)v96 != v20)
                  objc_enumerationMutation(v87);
                v22 = objc_msgSend(*(id *)(*((_QWORD *)&v95 + 1) + 8 * i), "rangeValue");
                v24 = v23;
                if (v6)
                {
                  v25 = v22 - objc_msgSend(v6, "length");
                  v26 = v6;
                }
                else
                {
                  v26 = v76;
                  v25 = v22;
                }
                objc_msgSend(v26, "substringWithRange:", v22, v24);
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                if ((objc_msgSend(v27, "isEqualToString:", *(_QWORD *)(a1 + 48)) & 1) == 0)
                {
                  v28 = v25;
                  v29 = v25 + v83;
                  v30 = v17;
                  objc_msgSend(*(id *)(v17 + 2840), "valueWithRange:", v29, v24);
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v81, "addObject:", v31);

                  objc_msgSend(v84, "characterRectsForCharacterRange:", v29, v24);
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v32, "firstObject");
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v33, "CGRectValue");
                  x = v34;
                  y = v36;
                  width = v38;
                  height = v40;

                  v93 = 0u;
                  v94 = 0u;
                  v91 = 0u;
                  v92 = 0u;
                  v42 = v32;
                  v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v91, v103, 16);
                  if (v43)
                  {
                    v44 = v43;
                    v45 = *(_QWORD *)v92;
                    do
                    {
                      for (j = 0; j != v44; ++j)
                      {
                        if (*(_QWORD *)v92 != v45)
                          objc_enumerationMutation(v42);
                        objc_msgSend(*(id *)(*((_QWORD *)&v91 + 1) + 8 * j), "CGRectValue");
                        v110.origin.x = v47;
                        v110.origin.y = v48;
                        v110.size.width = v49;
                        v110.size.height = v50;
                        v108.origin.x = x;
                        v108.origin.y = y;
                        v108.size.width = width;
                        v108.size.height = height;
                        v109 = CGRectUnion(v108, v110);
                        x = v109.origin.x;
                        y = v109.origin.y;
                        width = v109.size.width;
                        height = v109.size.height;
                      }
                      v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v91, v103, 16);
                    }
                    while (v44);
                  }

                  v17 = v30;
                  objc_msgSend(*(id *)(v30 + 2840), "valueWithCGRect:", x, y, width, height);
                  v51 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v80, "addObject:", v51);

                  objc_msgSend(*(id *)(v30 + 2840), "valueWithRange:", v29, v24);
                  v52 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v82, "setObject:forKey:", v27, v52);

                  objc_msgSend(*(id *)(v30 + 2840), "valueWithRange:", v28, v24);
                  v53 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v79, "addObject:", v53);

                  v16 = (uint64_t)v77;
                  objc_msgSend(v77, "addObject:", v27);

                  a1 = v78;
                  v20 = v85;
                  v6 = v86;
                }

              }
              v88 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v95, v104, 16);
            }
            while (v88);
          }

          v6 = 0;
          v18 = v75 + 1;
        }
        while (v75 + 1 != v74);
        v6 = 0;
        v54 = 0;
        v74 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v99, v106, 16);
      }
      while (v74);
    }
    else
    {
      v54 = v6;
    }

    v55 = objc_msgSend((id)objc_opt_class(), "supportsSiriDictationVoiceCommandsUIRedesign");
    v56 = *(void **)(a1 + 32);
    if (v55)
    {
      objc_msgSend(*(id *)(a1 + 32), "playVoiceCommandHapticFeedack");
      objc_msgSend(*(id *)(a1 + 56), "_textChoicesAssistant");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = *(_QWORD *)(a1 + 48);
      v89[0] = MEMORY[0x1E0C809B0];
      v89[1] = 3221225472;
      v89[2] = __108__UIDictationController__handleWKMultipleTextTargetsForText_payloadText_voiceCommandUUID_completionHandler___block_invoke_2;
      v89[3] = &unk_1E16D4C28;
      v59 = *(_QWORD *)(a1 + 64);
      v90 = *(id *)(a1 + 72);
      LOWORD(v68) = 1;
      v61 = v79;
      v60 = v80;
      objc_msgSend(v57, "decorateTextInRects:targetTextArray:replacementText:deltaRanges:originalSelectedRange:allowAutomaticReplacement:autoHide:voiceCommandUUID:withCompletionHandler:", v80, v16, v58, v79, v83, v69, v68, v59, v89);

      v62 = v90;
      v12 = v71;
      v63 = (void *)v16;
      v64 = v81;
      v65 = v82;
    }
    else
    {
      v66 = *(_QWORD *)(a1 + 48);
      v63 = (void *)v16;
      v65 = v82;
      v62 = (void *)objc_msgSend(v82, "copy");
      v67 = v66;
      v64 = v81;
      objc_msgSend(v56, "_applyWKAlternativesPayload:toAbsoluteRanges:valueRangeToText:context:originalSelectedRange:completionHandler:", v67, v81, v62, v84, v83, v69, *(_QWORD *)(a1 + 72));
      v12 = v71;
      v61 = v79;
      v60 = v80;
    }

    v13 = v70;
  }

}

uint64_t __108__UIDictationController__handleWKMultipleTextTargetsForText_payloadText_voiceCommandUUID_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_handleRecognizedCommandWithCommandIdentifier:(unint64_t)a3 parameters:(id)a4 strings:(id)a5 voiceCommandUUID:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  id v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  char *v39;
  void *v40;
  int v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  __CFString *v51;
  id v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  char *v59;
  void *v60;
  id v61;
  __CFString *v62;
  void *v63;
  int v64;
  void *v65;
  void *v66;
  int v67;
  dispatch_time_t v68;
  void *v69;
  id v70;
  _QWORD v71[5];
  id v72;
  _QWORD v73[5];
  id v74;
  id v75;
  id v76;
  _QWORD block[4];
  id v78;
  UIDictationController *v79;
  _QWORD v80[4];
  id v81;
  UIDictationController *v82;
  _QWORD v83[5];
  id v84;
  id v85;
  id v86;
  id v87;
  uint64_t *v88;
  unint64_t v89;
  _QWORD v90[5];
  id v91;
  id v92;
  id v93;
  id v94;
  uint64_t *v95;
  unint64_t v96;
  uint64_t v97;
  uint64_t *v98;
  uint64_t v99;
  uint64_t (*v100)(uint64_t, uint64_t);
  void (*v101)(uint64_t);
  uint64_t v102;
  _QWORD v103[5];
  id v104;
  id v105;
  id v106;
  _QWORD v107[5];
  id v108;
  id v109;
  id v110;
  id v111;
  _QWORD v112[4];
  id v113;
  UIDictationController *v114;
  unint64_t v115;

  v10 = a4;
  v70 = a5;
  v11 = a6;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "inputDelegateManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "textInputDelegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "inputDelegateManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "selectedTextRange");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v14, "_nsrangeForTextRange:", v16);
  -[UIDictationController setPreCommandExecutionPositionRange:](self, "setPreCommandExecutionPositionRange:", v17, v18);

  if (a3 == 21
    || (-[UIDictationController _addUndoNotificationObservationWithVoiceCommandUUID:](self, "_addUndoNotificationObservationWithVoiceCommandUUID:", v11), a3 != 26))
  {
    objc_msgSend(v12, "_textChoicesAssistant");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "resetDictationChoices");

    objc_msgSend(v12, "_textChoicesAssistant");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "resetDictationUnderlines");

    switch(a3)
    {
      case 6uLL:
      case 7uLL:
      case 9uLL:
      case 0xBuLL:
        objc_msgSend((id)objc_opt_class(), "firstParameterTextWithParameters:", v10);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v27;
        if (a3 == 11)
        {
          objc_msgSend(v27, "lowercaseString");
          v29 = objc_claimAutoreleasedReturnValue();
        }
        else if (a3 == 9)
        {
          objc_msgSend(v27, "capitalizedString");
          v29 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (a3 == 7)
            objc_msgSend(v27, "uppercaseString");
          else
            objc_msgSend((id)objc_opt_class(), "secondParameterTextWithParameters:", v10);
          v29 = objc_claimAutoreleasedReturnValue();
        }
        v43 = (void *)v29;
        v107[0] = MEMORY[0x1E0C809B0];
        v107[1] = 3221225472;
        v107[2] = __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_2;
        v107[3] = &unk_1E16D4CF0;
        v107[4] = self;
        v108 = v12;
        v109 = v28;
        v110 = v43;
        v111 = v11;
        v44 = v43;
        v31 = v28;
        -[UIDictationController _handleWKMultipleTextTargetsForText:payloadText:voiceCommandUUID:completionHandler:](self, "_handleWKMultipleTextTargetsForText:payloadText:voiceCommandUUID:completionHandler:", v31, v44, v111, v107);

        goto LABEL_44;
      case 8uLL:
      case 0xAuLL:
      case 0xCuLL:
        objc_msgSend(v12, "inputDelegateManager");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "selectedTextRange");
        v31 = (id)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "inputDelegateManager");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v32, "hasAsyncCapableInputDelegate");

        if (v33)
        {
          v112[0] = MEMORY[0x1E0C809B0];
          v112[1] = 3221225472;
          v112[2] = __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke;
          v112[3] = &unk_1E16D4C78;
          v115 = a3;
          v113 = v12;
          v114 = self;
          -[UIDictationController _requestDocumentContextWithCompletionHandler:](self, "_requestDocumentContextWithCompletionHandler:", v112);

          goto LABEL_44;
        }
        objc_msgSend(v12, "updateForChangedSelection");
        objc_msgSend(v12, "inputDelegateManager");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "textInRange:", v31);
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        switch(a3)
        {
          case 8uLL:
            objc_msgSend(v35, "uppercaseString");
            v36 = objc_claimAutoreleasedReturnValue();
            break;
          case 0xCuLL:
            objc_msgSend(v35, "lowercaseString");
            v36 = objc_claimAutoreleasedReturnValue();
            break;
          case 0xAuLL:
            objc_msgSend(v35, "capitalizedString");
            v36 = objc_claimAutoreleasedReturnValue();
            break;
          default:
            goto LABEL_43;
        }
        v45 = (void *)v36;

        v35 = v45;
LABEL_43:
        objc_msgSend(v12, "inputDelegateManager");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "insertText:", v35);

        -[UIDictationController notifyDocumentStateChangedAndResumeDictation:](self, "notifyDocumentStateChangedAndResumeDictation:", v12);
LABEL_44:

        break;
      case 0xEuLL:
        objc_msgSend((id)objc_opt_class(), "firstParameterTextWithParameters:", v10);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v103[0] = MEMORY[0x1E0C809B0];
        v103[1] = 3221225472;
        v103[2] = __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_7;
        v103[3] = &unk_1E16B2B68;
        v103[4] = self;
        v104 = v12;
        v105 = v38;
        v106 = v11;
        v20 = v38;
        -[UIDictationController _handleWKMultipleTextTargetsForText:payloadText:voiceCommandUUID:completionHandler:](self, "_handleWKMultipleTextTargetsForText:payloadText:voiceCommandUUID:completionHandler:", v20, 0x1E1749860, v106, v103);

        v24 = v104;
        goto LABEL_5;
      case 0xFuLL:
        -[UIDictationController playVoiceCommandHapticFeedack](self, "playVoiceCommandHapticFeedack");
        -[UIDictationController _performStandardEditAction:sender:](self, "_performStandardEditAction:sender:", sel_selectAll_, 0);
        goto LABEL_30;
      case 0x10uLL:
        v39 = sel_cut_;
        goto LABEL_28;
      case 0x11uLL:
        -[UIDictationController _performStandardEditAction:sender:](self, "_performStandardEditAction:sender:", sel_copy_, 0);
        objc_msgSend(v12, "dismissDictationMenu");
        objc_msgSend(v12, "presentDictationMenu");
        goto LABEL_30;
      case 0x12uLL:
        v39 = sel_paste_;
LABEL_28:
        -[UIDictationController _performStandardEditAction:sender:](self, "_performStandardEditAction:sender:", v39, 0);
LABEL_29:
        objc_msgSend(v12, "dismissDictationMenu");
LABEL_30:
        -[UIDictationController notifyDocumentStateChangedAndResumeDictation:](self, "notifyDocumentStateChangedAndResumeDictation:", v12);
        break;
      case 0x14uLL:
        +[UIDictationLandingView activeInstance](UIDictationLandingView, "activeInstance");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = objc_msgSend(v40, "canStopLanding");

        if (v41)
        {
          +[UIDictationLandingView activeInstance](UIDictationLandingView, "activeInstance");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "stopLanding");

        }
        +[UIDictationController activeInstance](UIDictationController, "activeInstance");
        v20 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "stopDictation");
        goto LABEL_6;
      case 0x15uLL:
        -[UIDictationController playVoiceCommandHapticFeedack](self, "playVoiceCommandHapticFeedack");
        -[UIDictationController _performDictationUndo](self, "_performDictationUndo");
        break;
      case 0x1BuLL:
        -[UIDictationController playVoiceCommandHapticFeedack](self, "playVoiceCommandHapticFeedack");
        -[UIDictationController _performDictationRedo](self, "_performDictationRedo");
        break;
      default:
        if (a3 != 22 && a3 != 5)
        {
          switch(a3)
          {
            case 0x13uLL:
              +[UIDictationLandingView sharedInstance](UIDictationLandingView, "sharedInstance");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v47, "stopLanding");

              +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v48, "performSendAction");
              goto LABEL_61;
            case 0x14uLL:
            case 0x15uLL:
            case 0x16uLL:
              goto LABEL_45;
            case 0x17uLL:
LABEL_56:
              v97 = 0;
              v98 = &v97;
              v99 = 0x3032000000;
              v100 = __Block_byref_object_copy__124;
              v101 = __Block_byref_object_dispose__124;
              objc_msgSend((id)objc_opt_class(), "firstParameterTextWithParameters:", v10);
              v102 = objc_claimAutoreleasedReturnValue();
              objc_msgSend((id)objc_opt_class(), "secondParameterTextWithParameters:", v10);
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              if (+[UIDictationUtilities shouldInsertSpaceBetweenStringA:andStringB:](UIDictationUtilities, "shouldInsertSpaceBetweenStringA:andStringB:", v57, v98[5]))
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), v57, v98[5], v70);
              }
              else
              {
                objc_msgSend(v57, "stringByAppendingString:", v98[5]);
              }
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              if (a3 == 23)
              {
                v61 = (id)v98[5];

                v62 = CFSTR("_placeholder_UIDictationTextAlternativesActionMoveAfter_D48B4A2E-2FBE-41EE-A266-3B7B3FB8F4DD_");
                v57 = v61;
                v60 = v62;
              }
              v83[0] = MEMORY[0x1E0C809B0];
              v83[1] = 3221225472;
              v83[2] = __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_15;
              v83[3] = &unk_1E16D4D90;
              v83[4] = self;
              v84 = v12;
              v52 = v57;
              v85 = v52;
              v53 = v60;
              v86 = v53;
              v87 = v11;
              v88 = &v97;
              v89 = a3;
              -[UIDictationController _handleWKMultipleTextTargetsForText:payloadText:voiceCommandUUID:completionHandler:](self, "_handleWKMultipleTextTargetsForText:payloadText:voiceCommandUUID:completionHandler:", v52, v53, v87, v83);

              v54 = v84;
              goto LABEL_52;
            case 0x18uLL:
              +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              v48 = v58;
              v59 = sel_moveToBeginningOfDocument_;
              goto LABEL_60;
            case 0x19uLL:
              +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              v48 = v58;
              v59 = sel_moveToEndOfDocument_;
LABEL_60:
              objc_msgSend(v58, "performTextOperationActionSelector:", v59);
LABEL_61:

              goto LABEL_30;
            case 0x1AuLL:
              goto LABEL_4;
            default:
              switch(a3)
              {
                case 1uLL:
                  objc_msgSend((id)objc_opt_class(), "firstParameterTextWithParameters:", v10);
                  v56 = (void *)objc_claimAutoreleasedReturnValue();
                  v73[0] = MEMORY[0x1E0C809B0];
                  v73[1] = 3221225472;
                  v73[2] = __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_24;
                  v73[3] = &unk_1E16B2B68;
                  v73[4] = self;
                  v74 = v12;
                  v75 = v56;
                  v76 = v11;
                  v20 = v56;
                  -[UIDictationController _handleWKMultipleTextTargetsForText:payloadText:voiceCommandUUID:completionHandler:](self, "_handleWKMultipleTextTargetsForText:payloadText:voiceCommandUUID:completionHandler:", v20, 0x1E1749840, v76, v73);

                  v24 = v74;
                  goto LABEL_5;
                case 2uLL:
                  objc_msgSend(v12, "inputDelegateManager");
                  v63 = (void *)objc_claimAutoreleasedReturnValue();
                  v64 = objc_msgSend(v63, "hasAsyncCapableInputDelegate");

                  if (v64)
                  {
                    v80[0] = MEMORY[0x1E0C809B0];
                    v80[1] = 3221225472;
                    v80[2] = __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_20;
                    v80[3] = &unk_1E16D4DE0;
                    v81 = v12;
                    v82 = self;
                    -[UIDictationController _requestFullDocumentContextWithCompletionHandler:](self, "_requestFullDocumentContextWithCompletionHandler:", v80);
                    v55 = v81;
                  }
                  else
                  {
                    -[UIDictationController playVoiceCommandHapticFeedack](self, "playVoiceCommandHapticFeedack");
                    objc_msgSend(v12, "handleClear");
                    v68 = dispatch_time(0, 160000000);
                    block[0] = MEMORY[0x1E0C809B0];
                    block[1] = 3221225472;
                    block[2] = __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_23;
                    block[3] = &unk_1E16B1B50;
                    v78 = v12;
                    v79 = self;
                    dispatch_after(v68, MEMORY[0x1E0C80D38], block);
                    v55 = v78;
                  }
                  goto LABEL_53;
                case 3uLL:
                  objc_msgSend(v12, "inputDelegateManager");
                  v65 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v65, "selectedTextRange");
                  v66 = (void *)objc_claimAutoreleasedReturnValue();
                  v67 = objc_msgSend(v66, "isEmpty");

                  if (v67)
                  {
                    objc_msgSend(v12, "handleDeleteWordWithExecutionContext:", 0);
                  }
                  else
                  {
                    objc_msgSend(v12, "inputDelegateManager");
                    v69 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v69, "deleteBackward");

                  }
                  goto LABEL_29;
                case 4uLL:
                  goto LABEL_56;
                default:
                  goto LABEL_45;
              }
              goto LABEL_45;
          }
        }
        v97 = 0;
        v98 = &v97;
        v99 = 0x3032000000;
        v100 = __Block_byref_object_copy__124;
        v101 = __Block_byref_object_dispose__124;
        objc_msgSend((id)objc_opt_class(), "firstParameterTextWithParameters:", v10);
        v102 = objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "secondParameterTextWithParameters:", v10);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        if (+[UIDictationUtilities shouldInsertSpaceBetweenStringA:andStringB:](UIDictationUtilities, "shouldInsertSpaceBetweenStringA:andStringB:", v98[5], v37))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), v98[5], v37, v70);
        }
        else
        {
          objc_msgSend((id)v98[5], "stringByAppendingString:", v37);
        }
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        if (a3 == 22)
        {
          v50 = (id)v98[5];

          v51 = CFSTR("_placeholder_UIDictationTextAlternativesActionMoveBefore_56C81A32-B231-496C-BAD4-559E159B46E8_");
          v49 = v51;
          v37 = v50;
        }
        v90[0] = MEMORY[0x1E0C809B0];
        v90[1] = 3221225472;
        v90[2] = __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_10;
        v90[3] = &unk_1E16D4D90;
        v90[4] = self;
        v91 = v12;
        v52 = v37;
        v92 = v52;
        v53 = v49;
        v93 = v53;
        v94 = v11;
        v95 = &v97;
        v96 = a3;
        -[UIDictationController _handleWKMultipleTextTargetsForText:payloadText:voiceCommandUUID:completionHandler:](self, "_handleWKMultipleTextTargetsForText:payloadText:voiceCommandUUID:completionHandler:", v52, v53, v94, v90);

        v54 = v91;
LABEL_52:

        _Block_object_dispose(&v97, 8);
        v55 = (void *)v102;
LABEL_53:

        break;
    }
  }
  else
  {
    objc_msgSend(v12, "_textChoicesAssistant");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "resetDictationUnderlines");

LABEL_4:
    objc_msgSend((id)objc_opt_class(), "firstParameterTextWithParameters:", v10);
    v20 = (id)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "integerValue");
    -[UIDictationController playVoiceCommandHapticFeedack](self, "playVoiceCommandHapticFeedack");
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "_textChoicesAssistant");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v71[0] = MEMORY[0x1E0C809B0];
    v71[1] = 3221225472;
    v71[2] = __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_30;
    v71[3] = &unk_1E16D4E58;
    v71[4] = self;
    v72 = v12;
    objc_msgSend(v23, "updateDictationChoicesFromPromptIndex:completionHandler:", v21, v71);

    v24 = v72;
LABEL_5:

LABEL_6:
  }
LABEL_45:
  -[UIDictationController setTargetHypothesis:](self, "setTargetHypothesis:", 0);
  -[UIDictationController setLastHypothesis:](self, "setLastHypothesis:", 0);
  -[UIDictationController setPendingEdits:](self, "setPendingEdits:", 0);
  self->_hasCheckedForLeadingSpaceOnce = 0;

}

void __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(a2, "selectedText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _stringForObject(v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "length"))
  {
    v4 = *(_QWORD *)(a1 + 48);
    switch(v4)
    {
      case 8:
        objc_msgSend(v8, "uppercaseString");
        v5 = objc_claimAutoreleasedReturnValue();
        goto LABEL_8;
      case 12:
        objc_msgSend(v8, "lowercaseString");
        v5 = objc_claimAutoreleasedReturnValue();
        goto LABEL_8;
      case 10:
        objc_msgSend(v8, "capitalizedString");
        v5 = objc_claimAutoreleasedReturnValue();
LABEL_8:
        v6 = (void *)v5;

        v8 = v6;
        break;
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "updateForChangedSelection");
  objc_msgSend(*(id *)(a1 + 32), "inputDelegateManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "insertText:", v8);

  objc_msgSend(*(id *)(a1 + 40), "notifyDocumentStateChangedAndResumeDictation:", *(_QWORD *)(a1 + 32));
}

void __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_2(uint64_t a1, int a2)
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[4];
  id v25;
  id v26;
  uint64_t v27;
  id v28;

  v3 = *(void **)(a1 + 32);
  if (a2)
  {
LABEL_2:
    objc_msgSend(v3, "notifyDocumentStateChangedAndResumeDictation:", *(_QWORD *)(a1 + 40));
    return;
  }
  v4 = objc_msgSend(v3, "_handleMultipleTextTargetsForText:payloadText:voiceCommandUUID:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  v5 = *(void **)(a1 + 32);
  if (v4)
  {
    if ((objc_msgSend((id)objc_opt_class(), "supportsSiriDictationVoiceCommandsUIRedesign") & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "commandTargetRangeMatchingGazeRange");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        objc_msgSend(*(id *)(a1 + 32), "commandTargetRangeMatchingGazeRange");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "rangeValue");
        v10 = v9;

        objc_msgSend(*(id *)(a1 + 40), "inputDelegateManager");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "_textRangeFromNSRange:", v8, v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 40), "inputDelegateManager");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setSelectedTextRange:", v12);

        objc_msgSend(*(id *)(a1 + 40), "updateForChangedSelection");
        objc_msgSend(*(id *)(a1 + 40), "inputDelegateManager");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "insertText:", *(_QWORD *)(a1 + 56));

        v15 = objc_msgSend(*(id *)(a1 + 32), "preCommandExecutionPositionRange") > v8;
        v16 = *(void **)(a1 + 32);
        v17 = *(_QWORD *)(a1 + 40);
        v18 = objc_msgSend(v16, "preCommandExecutionPositionRange");
        LOBYTE(v23) = v15;
        objc_msgSend(v16, "_restoreInsertionPointPositionWithKeyboard:originalPositionRange:targetRange:payloadRange:contextBefore:", v17, v18, v19, v8, v10, 0, objc_msgSend(*(id *)(a1 + 56), "length"), v23);

      }
      v3 = *(void **)(a1 + 32);
      goto LABEL_2;
    }
  }
  else
  {
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_3;
    v24[3] = &unk_1E16D4CC8;
    v20 = *(_QWORD *)(a1 + 48);
    v25 = *(id *)(a1 + 40);
    v21 = *(id *)(a1 + 56);
    v22 = *(_QWORD *)(a1 + 32);
    v26 = v21;
    v27 = v22;
    v28 = *(id *)(a1 + 48);
    objc_msgSend(v5, "searchString:completionHandler:", v20, v24);

  }
}

void __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_3(id *a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;

  v7 = a2;
  v8 = v7;
  if (a3 == 0x7FFFFFFFFFFFFFFFLL || !a4)
  {
    objc_msgSend(a1[6], "notifyDocumentStateChangedAndResumeDictation:", a1[4]);
  }
  else
  {
    if (v7)
      v9 = a3 - objc_msgSend(v7, "length");
    else
      LODWORD(v9) = a3;
    v10 = (int)v9;
    objc_msgSend(a1[4], "inputDelegateManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "hasAsyncCapableInputDelegate");

    objc_msgSend(a1[4], "inputDelegateManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v12)
    {
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_4;
      v26[3] = &unk_1E16B6F18;
      v27 = a1[4];
      v15 = a1[5];
      v16 = a1[6];
      v28 = v15;
      v29 = v16;
      v30 = v8;
      v31 = a1[7];
      objc_msgSend(v14, "adjustSelection:completionHandler:", v10, a4, v26);

    }
    else
    {
      objc_msgSend(v13, "textInputDelegate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "_rangeFromCurrentRangeWithDelta:", v10, a4);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(a1[4], "inputDelegateManager");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setSelectedTextRange:", v18);

      objc_msgSend(a1[4], "updateForChangedSelection");
      objc_msgSend(a1[4], "inputDelegateManager");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "insertText:", a1[5]);

      v21 = a1[6];
      v22 = a1[4];
      v23 = objc_msgSend(v21, "preCommandExecutionPositionRange");
      LOBYTE(v25) = v8 != 0;
      objc_msgSend(v21, "_restoreInsertionPointPositionWithKeyboard:originalPositionRange:targetRange:payloadRange:contextBefore:", v22, v23, v24, a3, a4, 0, objc_msgSend(a1[5], "length"), v25);
      objc_msgSend(a1[6], "notifyDocumentStateChangedAndResumeDictation:", a1[4]);

    }
  }

}

void __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "updateForChangedSelection");
  objc_msgSend(*(id *)(a1 + 32), "inputDelegateManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "insertText:", *(_QWORD *)(a1 + 40));

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_5;
  v4[3] = &unk_1E16D4CA0;
  v3 = *(void **)(a1 + 56);
  v5 = *(id *)(a1 + 48);
  v6 = v3;
  v7 = *(id *)(a1 + 64);
  v8 = *(id *)(a1 + 40);
  v9 = *(id *)(a1 + 32);
  objc_msgSend(v5, "_requestDocumentContextWithCompletionHandler:", v4);

}

void __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[5];
  id v13;

  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "preCommandExecutionPositionRange");
  v6 = v5;
  if (*(_QWORD *)(a1 + 40))
  {
    v7 = objc_msgSend(*(id *)(a1 + 48), "length");
    v4 = v4 - v7 + objc_msgSend(*(id *)(a1 + 56), "length");
  }
  v8 = objc_msgSend(v3, "directionalRangeForSelectionRange:", v4, v6);
  v10 = v9;
  objc_msgSend(*(id *)(a1 + 64), "inputDelegateManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_6;
  v12[3] = &unk_1E16B1B50;
  v12[4] = *(_QWORD *)(a1 + 32);
  v13 = *(id *)(a1 + 64);
  objc_msgSend(v11, "adjustSelection:completionHandler:", v8, v10, v12);

}

uint64_t __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "notifyDocumentStateChangedAndResumeDictation:", *(_QWORD *)(a1 + 40));
}

void __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_7(uint64_t a1, int a2)
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  uint64_t v19;

  v3 = *(void **)(a1 + 32);
  if (a2)
    goto LABEL_7;
  v4 = objc_msgSend(v3, "_handleMultipleTextTargetsForText:payloadText:voiceCommandUUID:", *(_QWORD *)(a1 + 48), 0x1E1749860, *(_QWORD *)(a1 + 56));
  v5 = *(void **)(a1 + 32);
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "commandTargetRangeMatchingGazeRange");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(*(id *)(a1 + 32), "commandTargetRangeMatchingGazeRange");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "rangeValue");
      v10 = v9;

      objc_msgSend(*(id *)(a1 + 40), "inputDelegateManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "_textRangeFromNSRange:", v8, v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 40), "inputDelegateManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setSelectedTextRange:", v12);

      objc_msgSend(*(id *)(a1 + 40), "updateForChangedSelection");
    }
    if ((objc_msgSend((id)objc_opt_class(), "supportsSiriDictationVoiceCommandsUIRedesign") & 1) == 0)
    {
      v3 = *(void **)(a1 + 32);
LABEL_7:
      objc_msgSend(v3, "notifyDocumentStateChangedAndResumeDictation:", *(_QWORD *)(a1 + 40));
    }
  }
  else
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_8;
    v17[3] = &unk_1E16D4D18;
    v14 = *(_QWORD *)(a1 + 48);
    v15 = *(id *)(a1 + 40);
    v16 = *(_QWORD *)(a1 + 32);
    v18 = v15;
    v19 = v16;
    objc_msgSend(v5, "searchString:completionHandler:", v14, v17);

  }
}

void __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_8(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  uint64_t v20;

  v7 = a2;
  v8 = v7;
  if (a3 == 0x7FFFFFFFFFFFFFFFLL || !a4)
  {
    objc_msgSend(*(id *)(a1 + 40), "notifyDocumentStateChangedAndResumeDictation:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    if (v7)
      LODWORD(a3) = a3 - objc_msgSend(v7, "length");
    objc_msgSend(*(id *)(a1 + 32), "inputDelegateManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "hasAsyncCapableInputDelegate");

    objc_msgSend(*(id *)(a1 + 32), "inputDelegateManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v10)
    {
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_9;
      v18[3] = &unk_1E16B1B50;
      v13 = *(id *)(a1 + 32);
      v14 = *(_QWORD *)(a1 + 40);
      v19 = v13;
      v20 = v14;
      objc_msgSend(v12, "adjustSelection:completionHandler:", (int)a3, a4, v18);

    }
    else
    {
      objc_msgSend(v11, "textInputDelegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "_rangeFromCurrentRangeWithDelta:", (int)a3, a4);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "inputDelegateManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setSelectedTextRange:", v16);

      objc_msgSend(*(id *)(a1 + 32), "updateForChangedSelection");
      objc_msgSend(*(id *)(a1 + 40), "notifyDocumentStateChangedAndResumeDictation:", *(_QWORD *)(a1 + 32));

    }
  }

}

uint64_t __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_9(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "updateForChangedSelection");
  return objc_msgSend(*(id *)(a1 + 40), "notifyDocumentStateChangedAndResumeDictation:", *(_QWORD *)(a1 + 32));
}

void __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_10(uint64_t a1, int a2)
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  BOOL v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  _QWORD v24[5];
  id v25;
  uint64_t v26;
  uint64_t v27;

  v3 = *(void **)(a1 + 32);
  if (a2)
    goto LABEL_2;
  v4 = objc_msgSend(v3, "_handleMultipleTextTargetsForText:payloadText:voiceCommandUUID:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  v5 = *(void **)(a1 + 32);
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "commandTargetRangeMatchingGazeRange");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(*(id *)(a1 + 32), "commandTargetRangeMatchingGazeRange");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "rangeValue");

      objc_msgSend(*(id *)(a1 + 40), "inputDelegateManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_textRangeFromNSRange:", v8, 0);
      v23 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 40), "inputDelegateManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setSelectedTextRange:", v23);

      objc_msgSend(*(id *)(a1 + 40), "updateForChangedSelection");
      if (*(_QWORD *)(a1 + 80) == 22)
      {
        objc_msgSend(*(id *)(a1 + 32), "notifyDocumentStateChangedAndResumeDictation:", *(_QWORD *)(a1 + 40));

        return;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ "), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      v15 = *(void **)(v14 + 40);
      *(_QWORD *)(v14 + 40) = v13;

      objc_msgSend(*(id *)(a1 + 40), "inputDelegateManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "insertText:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));

      v17 = objc_msgSend(*(id *)(a1 + 32), "preCommandExecutionPositionRange") > v8;
      v18 = *(void **)(a1 + 32);
      v19 = *(_QWORD *)(a1 + 40);
      v20 = objc_msgSend(v18, "preCommandExecutionPositionRange");
      LOBYTE(v22) = v17;
      objc_msgSend(v18, "_restoreInsertionPointPositionWithKeyboard:originalPositionRange:targetRange:payloadRange:contextBefore:", v19, v20, v21, 0, 0, 0, objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "length"), v22);

    }
    if ((objc_msgSend((id)objc_opt_class(), "supportsSiriDictationVoiceCommandsUIRedesign") & 1) == 0)
    {
      v3 = *(void **)(a1 + 32);
LABEL_2:
      objc_msgSend(v3, "notifyDocumentStateChangedAndResumeDictation:", *(_QWORD *)(a1 + 40));
    }
  }
  else
  {
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_11;
    v24[3] = &unk_1E16D4DB8;
    v11 = *(_QWORD *)(a1 + 80);
    v26 = *(_QWORD *)(a1 + 72);
    v27 = v11;
    v24[4] = v5;
    v12 = *(_QWORD *)(a1 + 48);
    v25 = *(id *)(a1 + 40);
    objc_msgSend(v5, "searchString:completionHandler:", v12, v24);

  }
}

void __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_11(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[4];
  id v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  uint64_t v34;

  v7 = a2;
  v8 = v7;
  if (a3 == 0x7FFFFFFFFFFFFFFFLL || !a4)
  {
    objc_msgSend(*(id *)(a1 + 32), "notifyDocumentStateChangedAndResumeDictation:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    if (v7)
      LODWORD(a3) = a3 - objc_msgSend(v7, "length");
    v9 = (int)a3;
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "inputDelegateManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "hasAsyncCapableInputDelegate");

    objc_msgSend(v10, "inputDelegateManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v12)
    {
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_12;
      v29[3] = &unk_1E16D4D68;
      v15 = v10;
      v16 = *(_QWORD *)(a1 + 32);
      v30 = v15;
      v31 = v16;
      v17 = *(_QWORD *)(a1 + 56);
      v33 = *(_QWORD *)(a1 + 48);
      v34 = v17;
      v32 = v8;
      objc_msgSend(v14, "adjustSelection:completionHandler:", v9, 0, v29);

    }
    else
    {
      objc_msgSend(v13, "textInputDelegate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "_rangeFromCurrentRangeWithDelta:", v9, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "inputDelegateManager");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setSelectedTextRange:", v19);

      objc_msgSend(v10, "updateForChangedSelection");
      if (*(_QWORD *)(a1 + 56) != 22)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ "), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v23 = *(void **)(v22 + 40);
        *(_QWORD *)(v22 + 40) = v21;

        objc_msgSend(v10, "inputDelegateManager");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "insertText:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));

        v25 = *(void **)(a1 + 32);
        v26 = objc_msgSend(v25, "preCommandExecutionPositionRange");
        LOBYTE(v28) = v8 != 0;
        objc_msgSend(v25, "_restoreInsertionPointPositionWithKeyboard:originalPositionRange:targetRange:payloadRange:contextBefore:", v10, v26, v27, 0, 0, 0, objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "length"), v28);
      }
      objc_msgSend(*(id *)(a1 + 32), "notifyDocumentStateChangedAndResumeDictation:", v10);

    }
  }

}

void __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_12(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  uint64_t v13;

  objc_msgSend(*(id *)(a1 + 32), "updateForChangedSelection");
  if (*(_QWORD *)(a1 + 64) == 22)
  {
    objc_msgSend(*(id *)(a1 + 40), "notifyDocumentStateChangedAndResumeDictation:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ "), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

    objc_msgSend(*(id *)(a1 + 32), "inputDelegateManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "insertText:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));

    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_13;
    v9[3] = &unk_1E16D4D40;
    v6 = *(void **)(a1 + 48);
    v10 = *(id *)(a1 + 40);
    v7 = v6;
    v8 = *(_QWORD *)(a1 + 56);
    v11 = v7;
    v13 = v8;
    v12 = *(id *)(a1 + 32);
    objc_msgSend(v10, "_requestDocumentContextWithCompletionHandler:", v9);

  }
}

void __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_13(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[5];
  id v12;

  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "preCommandExecutionPositionRange");
  v6 = v5;
  if (*(_QWORD *)(a1 + 40))
    v4 += objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "length");
  v7 = objc_msgSend(v3, "directionalRangeForSelectionRange:", v4, v6);
  v9 = v8;
  objc_msgSend(*(id *)(a1 + 48), "inputDelegateManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_14;
  v11[3] = &unk_1E16B1B50;
  v11[4] = *(_QWORD *)(a1 + 32);
  v12 = *(id *)(a1 + 48);
  objc_msgSend(v10, "adjustSelection:completionHandler:", v7, v9, v11);

}

uint64_t __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_14(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "notifyDocumentStateChangedAndResumeDictation:", *(_QWORD *)(a1 + 40));
}

void __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_15(uint64_t a1, int a2)
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  BOOL v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  _QWORD v29[4];
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v3 = *(void **)(a1 + 32);
  if (a2)
    goto LABEL_2;
  v4 = objc_msgSend(v3, "_handleMultipleTextTargetsForText:payloadText:voiceCommandUUID:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  v5 = *(void **)(a1 + 32);
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "commandTargetRangeMatchingGazeRange");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(*(id *)(a1 + 32), "commandTargetRangeMatchingGazeRange");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "rangeValue");
      v10 = v9;

      v11 = v8 + v10;
      objc_msgSend(*(id *)(a1 + 40), "inputDelegateManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "_textRangeFromNSRange:", v11, 0);
      v28 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 40), "inputDelegateManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setSelectedTextRange:", v28);

      objc_msgSend(*(id *)(a1 + 40), "updateForChangedSelection");
      if (*(_QWORD *)(a1 + 80) == 23)
      {
        objc_msgSend(*(id *)(a1 + 32), "notifyDocumentStateChangedAndResumeDictation:", *(_QWORD *)(a1 + 40));

        return;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" %@"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      v20 = *(void **)(v19 + 40);
      *(_QWORD *)(v19 + 40) = v18;

      objc_msgSend(*(id *)(a1 + 40), "inputDelegateManager");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "insertText:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));

      v22 = objc_msgSend(*(id *)(a1 + 32), "preCommandExecutionPositionRange") > v11;
      v23 = *(void **)(a1 + 32);
      v24 = *(_QWORD *)(a1 + 40);
      v25 = objc_msgSend(v23, "preCommandExecutionPositionRange");
      LOBYTE(v27) = v22;
      objc_msgSend(v23, "_restoreInsertionPointPositionWithKeyboard:originalPositionRange:targetRange:payloadRange:contextBefore:", v24, v25, v26, 0, 0, 0, objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "length"), v27);

    }
    if ((objc_msgSend((id)objc_opt_class(), "supportsSiriDictationVoiceCommandsUIRedesign") & 1) == 0)
    {
      v3 = *(void **)(a1 + 32);
LABEL_2:
      objc_msgSend(v3, "notifyDocumentStateChangedAndResumeDictation:", *(_QWORD *)(a1 + 40));
    }
  }
  else
  {
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_16;
    v29[3] = &unk_1E16D4DB8;
    v14 = *(_QWORD *)(a1 + 48);
    v15 = *(id *)(a1 + 40);
    v16 = *(_QWORD *)(a1 + 32);
    v30 = v15;
    v31 = v16;
    v17 = *(_QWORD *)(a1 + 80);
    v32 = *(_QWORD *)(a1 + 72);
    v33 = v17;
    objc_msgSend(v5, "searchString:completionHandler:", v14, v29);

  }
}

void __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_16(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD v31[4];
  id v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  uint64_t v36;

  v7 = a2;
  v8 = v7;
  if (a3 == 0x7FFFFFFFFFFFFFFFLL || !a4)
  {
    objc_msgSend(*(id *)(a1 + 40), "notifyDocumentStateChangedAndResumeDictation:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    if (v7)
      v9 = a3 + a4 - objc_msgSend(v7, "length");
    else
      LODWORD(v9) = a3 + a4;
    v10 = (int)v9;
    objc_msgSend(*(id *)(a1 + 32), "inputDelegateManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "hasAsyncCapableInputDelegate");

    objc_msgSend(*(id *)(a1 + 32), "inputDelegateManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v12)
    {
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_17;
      v31[3] = &unk_1E16D4D68;
      v15 = *(id *)(a1 + 32);
      v17 = *(_QWORD *)(a1 + 48);
      v16 = *(_QWORD *)(a1 + 56);
      v18 = *(_QWORD *)(a1 + 40);
      v32 = v15;
      v33 = v18;
      v35 = v17;
      v36 = v16;
      v34 = v8;
      objc_msgSend(v14, "adjustSelection:completionHandler:", v10, 0, v31);

    }
    else
    {
      objc_msgSend(v13, "textInputDelegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "_rangeFromCurrentRangeWithDelta:", v10, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "inputDelegateManager");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setSelectedTextRange:", v20);

      objc_msgSend(*(id *)(a1 + 32), "updateForChangedSelection");
      if (*(_QWORD *)(a1 + 56) != 23)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" %@"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v24 = *(void **)(v23 + 40);
        *(_QWORD *)(v23 + 40) = v22;

        objc_msgSend(*(id *)(a1 + 32), "inputDelegateManager");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "insertText:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));

        v27 = *(_QWORD *)(a1 + 32);
        v26 = *(void **)(a1 + 40);
        v28 = objc_msgSend(v26, "preCommandExecutionPositionRange");
        LOBYTE(v30) = v8 != 0;
        objc_msgSend(v26, "_restoreInsertionPointPositionWithKeyboard:originalPositionRange:targetRange:payloadRange:contextBefore:", v27, v28, v29, 0, 0, 0, objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "length"), v30);
      }
      objc_msgSend(*(id *)(a1 + 40), "notifyDocumentStateChangedAndResumeDictation:", *(_QWORD *)(a1 + 32));

    }
  }

}

void __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_17(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  uint64_t v13;

  objc_msgSend(*(id *)(a1 + 32), "updateForChangedSelection");
  if (*(_QWORD *)(a1 + 64) == 23)
  {
    objc_msgSend(*(id *)(a1 + 40), "notifyDocumentStateChangedAndResumeDictation:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" %@"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

    objc_msgSend(*(id *)(a1 + 32), "inputDelegateManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "insertText:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));

    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_18;
    v9[3] = &unk_1E16D4D40;
    v6 = *(void **)(a1 + 48);
    v10 = *(id *)(a1 + 40);
    v7 = v6;
    v8 = *(_QWORD *)(a1 + 56);
    v11 = v7;
    v13 = v8;
    v12 = *(id *)(a1 + 32);
    objc_msgSend(v10, "_requestDocumentContextWithCompletionHandler:", v9);

  }
}

void __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_18(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[5];
  id v12;

  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "preCommandExecutionPositionRange");
  v6 = v5;
  if (*(_QWORD *)(a1 + 40))
    v4 += objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "length");
  v7 = objc_msgSend(v3, "directionalRangeForSelectionRange:", v4, v6);
  v9 = v8;
  objc_msgSend(*(id *)(a1 + 48), "inputDelegateManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_19;
  v11[3] = &unk_1E16B1B50;
  v11[4] = *(_QWORD *)(a1 + 32);
  v12 = *(id *)(a1 + 48);
  objc_msgSend(v10, "adjustSelection:completionHandler:", v7, v9, v11);

}

uint64_t __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_19(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "notifyDocumentStateChangedAndResumeDictation:", *(_QWORD *)(a1 + 40));
}

void __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_20(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;

  v3 = a2;
  objc_msgSend(v3, "fullText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "directionalRangeForSelectionRange:", 0, objc_msgSend(v4, "length"));
  v7 = v6;

  objc_msgSend(*(id *)(a1 + 32), "inputDelegateManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_21;
  v11[3] = &unk_1E16B1B50;
  v9 = *(id *)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 40);
  v12 = v9;
  v13 = v10;
  objc_msgSend(v8, "adjustSelection:completionHandler:", v5, v7, v11);

}

void __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_21(uint64_t a1)
{
  void *v2;
  dispatch_time_t v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  objc_msgSend(*(id *)(a1 + 32), "updateForChangedSelection");
  objc_msgSend(*(id *)(a1 + 40), "playVoiceCommandHapticFeedack");
  objc_msgSend(*(id *)(a1 + 32), "inputDelegateManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deleteBackward");

  v3 = dispatch_time(0, 160000000);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_22;
  v6[3] = &unk_1E16B1B50;
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v7 = v4;
  v8 = v5;
  dispatch_after(v3, MEMORY[0x1E0C80D38], v6);

}

uint64_t __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_22(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "presentDictationUndoMenu");
  return objc_msgSend(*(id *)(a1 + 40), "notifyDocumentStateChangedAndResumeDictation:", *(_QWORD *)(a1 + 32));
}

uint64_t __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_23(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "presentDictationUndoMenu");
  return objc_msgSend(*(id *)(a1 + 40), "notifyDocumentStateChangedAndResumeDictation:", *(_QWORD *)(a1 + 32));
}

void __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_24(uint64_t a1, int a2)
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD v36[4];
  id v37;
  uint64_t v38;

  v3 = *(void **)(a1 + 32);
  if (a2)
    goto LABEL_7;
  v4 = objc_msgSend(v3, "_handleMultipleTextTargetsForText:payloadText:voiceCommandUUID:", *(_QWORD *)(a1 + 48), 0x1E1749840, *(_QWORD *)(a1 + 56));
  v5 = *(void **)(a1 + 32);
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "commandTargetRangeMatchingGazeRange");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(*(id *)(a1 + 32), "commandTargetRangeMatchingGazeRange");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "rangeValue");
      v10 = v9;

      objc_msgSend(*(id *)(a1 + 40), "inputDelegateManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "_textRangeFromNSRange:", v8, v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 40), "inputDelegateManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setSelectedTextRange:", v12);

      objc_msgSend(*(id *)(a1 + 40), "updateForChangedSelection");
      objc_msgSend(*(id *)(a1 + 40), "inputDelegateManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "textInputDelegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "inputDelegateManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "selectedTextRange");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v15, "_nsrangeForTextRange:", v17);
      v20 = v19;

      objc_msgSend(*(id *)(a1 + 40), "inputDelegateManager");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "deleteBackward");

      objc_msgSend(*(id *)(a1 + 40), "inputDelegateManager");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "textInputDelegate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "inputDelegateManager");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "selectedTextRange");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v23, "_nsrangeForTextRange:", v25);

      v27 = v18 + v20 - v26;
      LOBYTE(v22) = objc_msgSend(*(id *)(a1 + 32), "preCommandExecutionPositionRange") > v8;
      v28 = *(void **)(a1 + 32);
      v29 = *(_QWORD *)(a1 + 40);
      v30 = objc_msgSend(v28, "preCommandExecutionPositionRange");
      LOBYTE(v35) = (_BYTE)v22;
      objc_msgSend(v28, "_restoreInsertionPointPositionWithKeyboard:originalPositionRange:targetRange:payloadRange:contextBefore:", v29, v30, v31, 0, v27, 0, 0, v35);

    }
    if ((objc_msgSend((id)objc_opt_class(), "supportsSiriDictationVoiceCommandsUIRedesign") & 1) == 0)
    {
      v3 = *(void **)(a1 + 32);
LABEL_7:
      objc_msgSend(v3, "notifyDocumentStateChangedAndResumeDictation:", *(_QWORD *)(a1 + 40));
    }
  }
  else
  {
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_25;
    v36[3] = &unk_1E16D4D18;
    v32 = *(_QWORD *)(a1 + 48);
    v33 = *(id *)(a1 + 40);
    v34 = *(_QWORD *)(a1 + 32);
    v37 = v33;
    v38 = v34;
    objc_msgSend(v5, "searchString:completionHandler:", v32, v36);

  }
}

void __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_25(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD v38[4];
  id v39;
  uint64_t v40;
  id v41;

  v7 = a2;
  v8 = v7;
  if (a3 == 0x7FFFFFFFFFFFFFFFLL || !a4)
  {
    objc_msgSend(*(id *)(a1 + 40), "notifyDocumentStateChangedAndResumeDictation:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    if (v7)
      LODWORD(a3) = a3 - objc_msgSend(v7, "length");
    objc_msgSend(*(id *)(a1 + 32), "inputDelegateManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "hasAsyncCapableInputDelegate");

    v11 = (int)a3;
    objc_msgSend(*(id *)(a1 + 32), "inputDelegateManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v10)
    {
      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_26;
      v38[3] = &unk_1E16B47A8;
      v14 = *(id *)(a1 + 32);
      v15 = *(_QWORD *)(a1 + 40);
      v39 = v14;
      v40 = v15;
      v41 = v8;
      objc_msgSend(v13, "adjustSelection:completionHandler:", v11, a4, v38);

    }
    else
    {
      HIDWORD(v37) = v8 != 0;
      objc_msgSend(v12, "textInputDelegate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "_rangeFromCurrentRangeWithDelta:", v11, a4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "inputDelegateManager");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setSelectedTextRange:", v17);

      objc_msgSend(*(id *)(a1 + 32), "updateForChangedSelection");
      objc_msgSend(*(id *)(a1 + 32), "inputDelegateManager");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "textInputDelegate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "inputDelegateManager");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "selectedTextRange");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v20, "_nsrangeForTextRange:", v22);
      v25 = v24;

      objc_msgSend(*(id *)(a1 + 32), "inputDelegateManager");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "deleteBackward");

      objc_msgSend(*(id *)(a1 + 32), "inputDelegateManager");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "textInputDelegate");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "inputDelegateManager");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "selectedTextRange");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v28, "_nsrangeForTextRange:", v30);

      v32 = v23 + v25 - v31;
      v34 = *(_QWORD *)(a1 + 32);
      v33 = *(void **)(a1 + 40);
      v35 = objc_msgSend(v33, "preCommandExecutionPositionRange");
      LOBYTE(v37) = v8 != 0;
      objc_msgSend(v33, "_restoreInsertionPointPositionWithKeyboard:originalPositionRange:targetRange:payloadRange:contextBefore:", v34, v35, v36, 0, v32, 0, 0, v37);
      objc_msgSend(*(id *)(a1 + 40), "notifyDocumentStateChangedAndResumeDictation:", *(_QWORD *)(a1 + 32));

    }
  }

}

void __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_26(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "updateForChangedSelection");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_27;
  v6[3] = &unk_1E16D4E30;
  v2 = *(void **)(a1 + 40);
  v3 = *(id *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(void **)(a1 + 48);
  v7 = v3;
  v8 = v4;
  v9 = v5;
  objc_msgSend(v2, "_requestDocumentContextWithCompletionHandler:", v6);

}

void __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_27(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;

  v3 = objc_msgSend(a2, "selectedTextRange");
  v5 = v4;
  objc_msgSend(*(id *)(a1 + 32), "inputDelegateManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deleteBackward");

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_28;
  v8[3] = &unk_1E16D4E08;
  v7 = *(void **)(a1 + 48);
  v9 = *(id *)(a1 + 40);
  v10 = v7;
  v12 = v3;
  v13 = v5;
  v11 = *(id *)(a1 + 32);
  objc_msgSend(v9, "_requestDocumentContextWithCompletionHandler:", v8);

}

void __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_28(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[5];
  id v13;

  v3 = a2;
  v4 = objc_msgSend(v3, "selectedTextRange");
  v5 = objc_msgSend(*(id *)(a1 + 32), "preCommandExecutionPositionRange");
  v7 = v5;
  if (*(_QWORD *)(a1 + 40))
    v7 = v5 + v4 - (*(_QWORD *)(a1 + 56) + *(_QWORD *)(a1 + 64));
  v8 = objc_msgSend(v3, "directionalRangeForSelectionRange:", v7, v6);
  v10 = v9;

  objc_msgSend(*(id *)(a1 + 48), "inputDelegateManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_29;
  v12[3] = &unk_1E16B1B50;
  v12[4] = *(_QWORD *)(a1 + 32);
  v13 = *(id *)(a1 + 48);
  objc_msgSend(v11, "adjustSelection:completionHandler:", v8, v10, v12);

}

uint64_t __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_29(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "notifyDocumentStateChangedAndResumeDictation:", *(_QWORD *)(a1 + 40));
}

uint64_t __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_30(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "notifyDocumentStateChangedAndResumeDictation:", *(_QWORD *)(a1 + 40));
}

- (BOOL)_didRecognizeCommandWithIdentifier:(id)a3 strings:(id)a4 parameters:(id)a5 voiceCommandUUID:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[5];
  id v35;
  id v36;
  id v37;
  id v38;
  uint64_t v39;
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  id v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = objc_msgSend((id)objc_opt_class(), "commandIdentifierWithStringIdentifier:", v10);
  v15 = objc_alloc_init((Class)getSISchemaUEIDictationVoiceCommandExecutedClass());
  objc_msgSend(v15, "setCommandType:", objc_msgSend((id)objc_opt_class(), "mapDictationCommandIdentifierToUEIcommandIdentifier:", v14));
  v16 = (void *)objc_msgSend(objc_alloc((Class)getSISchemaUUIDClass()), "initWithNSUUID:", v13);
  objc_msgSend(v15, "setVoiceCommandId:", v16);

  if (objc_msgSend((id)objc_opt_class(), "shouldForwardInInputSystemUI"))
  {
    -[UIDictationController clearSelectedTextAndLastDictationResult:](self, "clearSelectedTextAndLastDictationResult:", -[UIDictationController isSelectionBasedCommand:](self, "isSelectionBasedCommand:", v14) ^ 1);
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "inputDelegateManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "inputSystemSourceSession");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend(v19, "textOperations");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(sel_didRecognizeCommandWithIdentifier_strings_parameters_voiceCommandUUID_gazeRangeAtCommandRecognitionTime_);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setObject:forKeyedSubscript:", v22, CFSTR("selector"));

      if (v10)
        objc_msgSend(v21, "setObject:forKeyedSubscript:", v10, CFSTR("identifier"));
      if (v11)
        objc_msgSend(v21, "setObject:forKeyedSubscript:", v11, CFSTR("strings"));
      if (v12)
      {
        objc_msgSend(v21, "setObject:forKeyedSubscript:", v12, CFSTR("parameters"));
        objc_msgSend(v21, "setObject:forKeyedSubscript:", v13, CFSTR("voiceCommandUUID"));
      }
      objc_msgSend(v20, "setCustomInfoType:", 0x1E1750220);
      objc_msgSend(v20, "setCustomInfo:", v21);
      objc_msgSend(v19, "flushOperations");

    }
    -[UIDictationController pauseDictation](self, "pauseDictation");
    -[UIDictationController setTargetHypothesis:](self, "setTargetHypothesis:", 0);
    -[UIDictationController setLastHypothesis:](self, "setLastHypothesis:", 0);
    -[UIDictationController setPendingEdits:](self, "setPendingEdits:", 0);
    self->_hasCheckedForLeadingSpaceOnce = 0;

  }
  else
  {
    v31 = v13;
    v23 = v10;
    v24 = v11;
    objc_msgSend((id)objc_opt_class(), "firstParameterTextWithParameters:", v12);
    v25 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "secondParameterTextWithParameters:", v12);
    v26 = objc_claimAutoreleasedReturnValue();
    +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "dictationTipController");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (void *)v26;
    v33 = (void *)v25;
    objc_msgSend(v28, "dictationCommandUsed:firstTargetString:secondTargetString:", v14, v25, v26);

    -[UIDictationController clearSelectedTextAndLastDictationResult:](self, "clearSelectedTextAndLastDictationResult:", -[UIDictationController isSelectionBasedCommand:](self, "isSelectionBasedCommand:", v14) ^ 1);
    if (!+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
      -[UIDictationController pauseDictation](self, "pauseDictation");
    _UIDictationControllerLog();
    v29 = objc_claimAutoreleasedReturnValue();
    v11 = v24;
    v10 = v23;
    v13 = v31;
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v41 = "-[UIDictationController _didRecognizeCommandWithIdentifier:strings:parameters:voiceCommandUUID:]";
      v42 = 2112;
      v43 = v23;
      v44 = 2112;
      v45 = v24;
      v46 = 2112;
      v47 = v12;
      _os_log_impl(&dword_185066000, v29, OS_LOG_TYPE_DEFAULT, "%s Recognized command %@ with strings %@ parameters %@", buf, 0x2Au);
    }

    -[UIDictationController invalidateTextInputView](self, "invalidateTextInputView");
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __96__UIDictationController__didRecognizeCommandWithIdentifier_strings_parameters_voiceCommandUUID___block_invoke;
    v34[3] = &unk_1E16D4E80;
    v34[4] = self;
    v39 = v14;
    v35 = v12;
    v36 = v24;
    v37 = v31;
    v38 = v15;
    -[UIDictationController requestVisibleTextWithCompletionBlock:](self, "requestVisibleTextWithCompletionBlock:", v34);

  }
  return 1;
}

uint64_t __96__UIDictationController__didRecognizeCommandWithIdentifier_strings_parameters_voiceCommandUUID___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setVisibleRTIDocumentStateAtCommandRecognition:", a2);
  objc_msgSend(*(id *)(a1 + 32), "_handleRecognizedCommandWithCommandIdentifier:parameters:strings:voiceCommandUUID:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 64), "setCommandStatus:", 1);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 648), "emitInstrumentation:", *(_QWORD *)(a1 + 64));
  _UIDictationControllerLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[UIDictationController _didRecognizeCommandWithIdentifier:strings:parameters:voiceCommandUUID:]_block_invoke";
    _os_log_impl(&dword_185066000, v3, OS_LOG_TYPE_DEFAULT, "%s Setting isProcessingPotentialVoiceCommand to NO", (uint8_t *)&v5, 0xCu);
  }

  return objc_msgSend(*(id *)(a1 + 32), "setIsProcessingPotentialVoiceCommand:", 0);
}

- (BOOL)handleCommandRecognizedWithPhrases:(id)a3 locale:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v6 = a3;
  v7 = a4;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  +[UIDictationCommandHandlerManager commandHandlerWithLocale:](UIDictationCommandHandlerManager, "commandHandlerWithLocale:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __67__UIDictationController_handleCommandRecognizedWithPhrases_locale___block_invoke;
  v10[3] = &unk_1E16D4EA8;
  v10[4] = self;
  v10[5] = &v11;
  objc_msgSend(v8, "recognizeCommandWithPhrases:completionHandler:", v6, v10);
  LOBYTE(self) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)self;
}

uint64_t __67__UIDictationController_handleCommandRecognizedWithPhrases_locale___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  if (a2)
  {
    v4 = result;
    result = objc_msgSend(*(id *)(result + 32), "didRecognizeCommandWithIdentifier:strings:parameters:voiceCommandUUID:gazeRangeAtCommandRecognitionTime:", a2, a3, a4, 0, 0);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v4 + 40) + 8) + 24) = result;
  }
  return result;
}

- (BOOL)handleASRVoiceCommandRecognizedWithUtterance:(id)a3 commandIdentifier:(id)a4 parameters:(id)a5 voiceCommandUUID:(id)a6
{
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v10 = (void *)MEMORY[0x1E0C99D20];
  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  objc_msgSend(v10, "arrayWithObjects:count:", &v17, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v14) = -[UIDictationController didRecognizeCommandWithIdentifier:strings:parameters:voiceCommandUUID:gazeRangeAtCommandRecognitionTime:](self, "didRecognizeCommandWithIdentifier:strings:parameters:voiceCommandUUID:gazeRangeAtCommandRecognitionTime:", v13, v15, v12, v11, 0, v17, v18);
  return (char)v14;
}

- (void)_dictationDidRecieveDidBeginDictationNotification:(id)a3
{
  if (!+[UIKeyboard inputUIOOP](UIKeyboard, "inputUIOOP", a3)
    || +[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess"))
  {
    notify_set_state(self->_dictationInputModeNotifierToken, 1uLL);
    notify_post("com.apple.keyboard.isDictationRunning");
  }
}

- (void)_dictationDidRecieveDidFinishDictationNotification:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  _UIDictationControllerUndoRedoLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315138;
    v10 = "-[UIDictationController _dictationDidRecieveDidFinishDictationNotification:]";
    _os_log_impl(&dword_185066000, v4, OS_LOG_TYPE_DEFAULT, "%s Ending undo grouping if necessary", (uint8_t *)&v9, 0xCu);
  }

  -[UIDictationController _endUndoGroupingIfNecessary](self, "_endUndoGroupingIfNecessary");
  if (!+[UIKeyboard inputUIOOP](UIKeyboard, "inputUIOOP")
    || +[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess"))
  {
    notify_set_state(self->_dictationInputModeNotifierToken, 0);
    notify_post("com.apple.keyboard.isDictationRunning");
  }
  if (!+[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess"))
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_textChoicesAssistant");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "resetDictationChoices");

    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_textChoicesAssistant");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cancelPendingDictationPromptDisplay");

  }
}

- (void)_beginUndoGroupingIfNecessary
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  const char *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (!-[UIDictationController isDictationUndoGroupingOpen](self, "isDictationUndoGroupingOpen"))
  {
    _UIDictationControllerUndoRedoLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136315138;
      v11 = "-[UIDictationController _beginUndoGroupingIfNecessary]";
      _os_log_impl(&dword_185066000, v3, OS_LOG_TYPE_DEFAULT, "%s Beginning undo grouping", (uint8_t *)&v10, 0xCu);
    }

    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "delegateAsResponder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_responderForEditing");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "undoManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "beginUndoGrouping");
    _UIDictationControllerUndoRedoLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_msgSend(v7, "groupingLevel");
      v10 = 136315394;
      v11 = "-[UIDictationController _beginUndoGroupingIfNecessary]";
      v12 = 2048;
      v13 = v9;
      _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_DEFAULT, "%s groupingLevel: %ld", (uint8_t *)&v10, 0x16u);
    }

    -[UIDictationController setIsDictationUndoGroupingOpen:](self, "setIsDictationUndoGroupingOpen:", 1);
  }
}

- (void)_endUndoGroupingIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  _BOOL4 v9;
  uint64_t v10;
  const char *v11;
  int v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (-[UIDictationController isDictationUndoGroupingOpen](self, "isDictationUndoGroupingOpen"))
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "delegateAsResponder");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_responderForEditing");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "undoManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v6, "groupingLevel");
    _UIDictationControllerUndoRedoLog();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7 < 1)
    {
      if (!v9)
      {
LABEL_10:

        -[UIDictationController setIsDictationUndoGroupingOpen:](self, "setIsDictationUndoGroupingOpen:", 0);
        return;
      }
      v12 = 136315394;
      v13 = "-[UIDictationController _endUndoGroupingIfNecessary]";
      v14 = 2048;
      v15 = objc_msgSend(v6, "groupingLevel");
      v11 = "%s isDictationUndoGroupingOpen was YES but groupingLevel was %ld, so we will forgo ending of the undo groupi"
            "ng (this is likely because a voice command caused the field to lose focus before dictation has fully had a c"
            "hance to finish)";
    }
    else
    {
      if (v9)
      {
        v12 = 136315138;
        v13 = "-[UIDictationController _endUndoGroupingIfNecessary]";
        _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_DEFAULT, "%s Ending undo grouping", (uint8_t *)&v12, 0xCu);
      }

      objc_msgSend(v6, "endUndoGrouping");
      _UIDictationControllerUndoRedoLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        goto LABEL_10;
      v10 = objc_msgSend(v6, "groupingLevel");
      v12 = 136315394;
      v13 = "-[UIDictationController _endUndoGroupingIfNecessary]";
      v14 = 2048;
      v15 = v10;
      v11 = "%s groupingLevel: %ld";
    }
    _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v12, 0x16u);
    goto LABEL_10;
  }
}

- (void)markDictationUndoEventWithVoiceCommandUUID:(id)a3 viaTapOnRevertBubble:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  id v8;

  v4 = a4;
  v8 = a3;
  if (self->_undoNotificationToken)
  {
    -[UIDictationController dictationConnection](self, "dictationConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updateVoiceCommandContextWithPrefixText:postfixText:selectedText:disambiguationActive:cursorInVisibleText:favorCommandSuppression:abortCommandSuppression:undoEvent:", 0, 0, 0, 0, 0, 0, 0, v7);

    -[UIDictationController _removeUndoNotificationObservation](self, "_removeUndoNotificationObservation");
  }
  -[UIDictationController instrumentDictationVoiceCommandUndoTapActionWithVoiceCommandUUID:undoTapAlternativeSelection:](self, "instrumentDictationVoiceCommandUndoTapActionWithVoiceCommandUUID:undoTapAlternativeSelection:", v8, v4);

}

- (void)_addUndoNotificationObservationWithVoiceCommandUUID:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  id undoNotificationToken;
  _QWORD v11[5];
  id v12;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0CB33B8];
  objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __77__UIDictationController__addUndoNotificationObservationWithVoiceCommandUUID___block_invoke;
  v11[3] = &unk_1E16D4ED0;
  v11[4] = self;
  v12 = v4;
  v8 = v4;
  objc_msgSend(v5, "addObserverForName:object:queue:usingBlock:", v6, 0, v7, v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  undoNotificationToken = self->_undoNotificationToken;
  self->_undoNotificationToken = v9;

}

uint64_t __77__UIDictationController__addUndoNotificationObservationWithVoiceCommandUUID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "markDictationUndoEventWithVoiceCommandUUID:viaTapOnRevertBubble:", *(_QWORD *)(a1 + 40), 0);
}

- (void)_removeUndoNotificationObservation
{
  void *v3;
  id undoNotificationToken;

  if (self->_undoNotificationToken)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:", self->_undoNotificationToken);

    undoNotificationToken = self->_undoNotificationToken;
    self->_undoNotificationToken = 0;

  }
}

- (void)_performDictationUndo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[UIDictationController pauseDictation](self, "pauseDictation");
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegateAsResponder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_responderForEditing");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "undoManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "canUndo"))
  {
    -[UIDictationController cursorPositionRestorer](self, "cursorPositionRestorer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __46__UIDictationController__performDictationUndo__block_invoke;
    v12[3] = &unk_1E16B1B50;
    v12[4] = self;
    v13 = v6;
    v10[0] = v8;
    v10[1] = 3221225472;
    v10[2] = __46__UIDictationController__performDictationUndo__block_invoke_1166;
    v10[3] = &unk_1E16B1B50;
    v10[4] = self;
    v11 = v3;
    objc_msgSend(v7, "saveCursorLocationAndRestoreAfterPerforming:completion:", v12, v10);

  }
  else
  {
    _UIDictationControllerUndoRedoLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v15 = "-[UIDictationController _performDictationUndo]";
      _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_DEFAULT, "%s undoManager says we can't undo", buf, 0xCu);
    }

    -[UIDictationController notifyDocumentStateChangedAndResumeDictation:](self, "notifyDocumentStateChangedAndResumeDictation:", v3);
  }

}

uint64_t __46__UIDictationController__performDictationUndo__block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  NSObject *v4;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  _UIDictationControllerUndoRedoLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[UIDictationController _performDictationUndo]_block_invoke";
    _os_log_impl(&dword_185066000, v2, OS_LOG_TYPE_DEFAULT, "%s Ending undo grouping if necessary", (uint8_t *)&v6, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "_endUndoGroupingIfNecessary");
  if (objc_msgSend(*(id *)(a1 + 32), "haveLeakedPartialResultForCommandUtterance"))
  {
    _UIDictationControllerUndoRedoLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315138;
      v7 = "-[UIDictationController _performDictationUndo]_block_invoke";
      _os_log_impl(&dword_185066000, v3, OS_LOG_TYPE_DEFAULT, "%s Performing extra [undoManager undo] to get rid of leaked partial", (uint8_t *)&v6, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 40), "undo");
  }
  _UIDictationControllerUndoRedoLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[UIDictationController _performDictationUndo]_block_invoke";
    _os_log_impl(&dword_185066000, v4, OS_LOG_TYPE_DEFAULT, "%s Performing [undoManager undo]", (uint8_t *)&v6, 0xCu);
  }

  return objc_msgSend(*(id *)(a1 + 40), "undo");
}

uint64_t __46__UIDictationController__performDictationUndo__block_invoke_1166(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "notifyDocumentStateChangedAndResumeDictation:", *(_QWORD *)(a1 + 40));
}

- (void)_performDictationRedo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[UIDictationController pauseDictation](self, "pauseDictation");
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegateAsResponder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_responderForEditing");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "undoManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "canRedo"))
  {
    -[UIDictationController cursorPositionRestorer](self, "cursorPositionRestorer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __46__UIDictationController__performDictationRedo__block_invoke;
    v12[3] = &unk_1E16B1B28;
    v13 = v6;
    v10[0] = v8;
    v10[1] = 3221225472;
    v10[2] = __46__UIDictationController__performDictationRedo__block_invoke_1167;
    v10[3] = &unk_1E16B1B50;
    v10[4] = self;
    v11 = v3;
    objc_msgSend(v7, "saveCursorLocationAndRestoreAfterPerforming:completion:", v12, v10);

  }
  else
  {
    _UIDictationControllerUndoRedoLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v15 = "-[UIDictationController _performDictationRedo]";
      _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_DEFAULT, "%s undoManager says we can't redo", buf, 0xCu);
    }

    -[UIDictationController notifyDocumentStateChangedAndResumeDictation:](self, "notifyDocumentStateChangedAndResumeDictation:", v3);
  }

}

uint64_t __46__UIDictationController__performDictationRedo__block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  _UIDictationControllerUndoRedoLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[UIDictationController _performDictationRedo]_block_invoke";
    _os_log_impl(&dword_185066000, v2, OS_LOG_TYPE_DEFAULT, "%s Performing [undoManager redo]", (uint8_t *)&v4, 0xCu);
  }

  return objc_msgSend(*(id *)(a1 + 32), "redo");
}

uint64_t __46__UIDictationController__performDictationRedo__block_invoke_1167(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "notifyDocumentStateChangedAndResumeDictation:", *(_QWORD *)(a1 + 40));
}

- (void)performTextReplacementForWebKitWithDeltaRange:(_NSRange)a3 targetText:(id)a4 replacementText:(id)a5 originalSelectedRange:(_NSRange)a6 voiceCommandDisambiguationSelectedIndex:(id)a7 voiceCommandDisambiguationTargetCount:(id)a8 voiceCommandUUID:(id)a9 completionHandler:(id)a10
{
  NSUInteger length;
  NSUInteger location;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  int v20;
  int v21;
  int v22;
  void *v23;
  NSUInteger v24;
  NSUInteger v25;
  NSUInteger v26;
  NSUInteger v27;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  UIDictationController *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  _QWORD *v38;
  NSUInteger v39;
  NSUInteger v40;
  char v41;
  char v42;
  _QWORD v43[7];

  length = a6.length;
  location = a6.location;
  v26 = a3.length;
  v27 = a3.location;
  v29 = a4;
  v14 = a5;
  v15 = a7;
  v16 = a8;
  v17 = a9;
  v28 = a10;
  -[UIDictationController instrumentDictationVoiceCommandDisambiguationActionWithVoiceCommandUUID:disambiguationIndex:totalDisambiguationCount:](self, "instrumentDictationVoiceCommandDisambiguationActionWithVoiceCommandUUID:disambiguationIndex:totalDisambiguationCount:", v17, v15, v16);
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "inputDelegateManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "hasAsyncCapableInputDelegate");

  if (v20)
  {
    v43[0] = 0;
    v43[1] = v43;
    v43[2] = 0x3010000000;
    v43[3] = &unk_18685B0AF;
    v43[4] = location;
    v43[5] = length;
    v21 = objc_msgSend(v14, "isEqualToString:", 0x1E1749840);
    v22 = objc_msgSend(v14, "isEqualToString:", 0x1E1749860);
    objc_msgSend(v18, "inputDelegateManager");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21 | v22)
      v24 = v26;
    else
      v24 = 0;
    v25 = v24;
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __233__UIDictationController_performTextReplacementForWebKitWithDeltaRange_targetText_replacementText_originalSelectedRange_voiceCommandDisambiguationSelectedIndex_voiceCommandDisambiguationTargetCount_voiceCommandUUID_completionHandler___block_invoke;
    v30[3] = &unk_1E16D4FC0;
    v31 = v18;
    v41 = v21;
    v32 = v14;
    v33 = self;
    v39 = v27;
    v40 = v26;
    v38 = v43;
    v37 = v28;
    v42 = v22;
    v34 = v29;
    v35 = v17;
    v36 = v15;
    objc_msgSend(v23, "adjustSelection:completionHandler:", v27, v25, v30);

    _Block_object_dispose(v43, 8);
  }

}

void __233__UIDictationController_performTextReplacementForWebKitWithDeltaRange_targetText_replacementText_originalSelectedRange_voiceCommandDisambiguationSelectedIndex_voiceCommandDisambiguationTargetCount_voiceCommandUUID_completionHandler___block_invoke(uint64_t a1)
{
  __CFString *v2;
  __CFString *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  id v16;
  __int128 v17;
  _QWORD v18[4];
  id v19;
  id v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  __int128 v28;
  _QWORD v29[4];
  id v30;
  __CFString *v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;

  objc_msgSend(*(id *)(a1 + 32), "updateForChangedSelection");
  v2 = (__CFString *)*(id *)(a1 + 40);
  v3 = v2;
  if (*(_BYTE *)(a1 + 112))
  {

    v4 = *(void **)(a1 + 48);
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __233__UIDictationController_performTextReplacementForWebKitWithDeltaRange_targetText_replacementText_originalSelectedRange_voiceCommandDisambiguationSelectedIndex_voiceCommandDisambiguationTargetCount_voiceCommandUUID_completionHandler___block_invoke_2;
    v29[3] = &unk_1E16D4F20;
    v3 = &stru_1E16EDF20;
    v30 = *(id *)(a1 + 32);
    v31 = &stru_1E16EDF20;
    v32 = *(_QWORD *)(a1 + 48);
    v17 = *(_OWORD *)(a1 + 80);
    v5 = *(void **)(a1 + 80);
    v34 = *(_OWORD *)(a1 + 96);
    v6 = v5;
    v33 = v17;
    objc_msgSend(v4, "_requestDocumentContextWithCompletionHandler:", v29);

  }
  else if (*(_BYTE *)(a1 + 113))
  {
    v7 = *(_QWORD *)(a1 + 80);
    if (v7)
      (*(void (**)(uint64_t, _QWORD))(v7 + 16))(v7, 0);
  }
  else
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DBDBE8]), "initWithCandidate:forInput:", v2, *(_QWORD *)(a1 + 56));
    objc_msgSend(*(id *)(a1 + 32), "inputDelegateManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "candidate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "input");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __233__UIDictationController_performTextReplacementForWebKitWithDeltaRange_targetText_replacementText_originalSelectedRange_voiceCommandDisambiguationSelectedIndex_voiceCommandDisambiguationTargetCount_voiceCommandUUID_completionHandler___block_invoke_5;
    v18[3] = &unk_1E16D4F98;
    v19 = v8;
    v12 = *(id *)(a1 + 32);
    v13 = *(_QWORD *)(a1 + 48);
    v20 = v12;
    v21 = v13;
    v14 = *(id *)(a1 + 64);
    v28 = *(_OWORD *)(a1 + 96);
    v15 = *(_QWORD *)(a1 + 88);
    v22 = v14;
    v27 = v15;
    v23 = *(id *)(a1 + 56);
    v24 = *(id *)(a1 + 40);
    v26 = *(id *)(a1 + 80);
    v25 = *(id *)(a1 + 72);
    v16 = v8;
    objc_msgSend(v9, "applyAutocorrection:toString:shouldUnderline:withCompletionHandler:", v10, v11, 1, v18);

  }
}

void __233__UIDictationController_performTextReplacementForWebKitWithDeltaRange_targetText_replacementText_originalSelectedRange_voiceCommandDisambiguationSelectedIndex_voiceCommandDisambiguationTargetCount_voiceCommandUUID_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;

  v3 = objc_msgSend(a2, "selectedTextRange");
  v5 = v4;
  objc_msgSend(*(id *)(a1 + 32), "inputDelegateManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "insertText:", *(_QWORD *)(a1 + 40));

  v7 = *(void **)(a1 + 48);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __233__UIDictationController_performTextReplacementForWebKitWithDeltaRange_targetText_replacementText_originalSelectedRange_voiceCommandDisambiguationSelectedIndex_voiceCommandDisambiguationTargetCount_voiceCommandUUID_completionHandler___block_invoke_3;
  v8[3] = &unk_1E16D4EF8;
  v12 = *(_OWORD *)(a1 + 72);
  v11 = *(_QWORD *)(a1 + 64);
  v13 = v3;
  v14 = v5;
  v9 = *(id *)(a1 + 32);
  v10 = *(id *)(a1 + 56);
  objc_msgSend(v7, "_requestDocumentContextWithCompletionHandler:", v8);

}

void __233__UIDictationController_performTextReplacementForWebKitWithDeltaRange_targetText_replacementText_originalSelectedRange_voiceCommandDisambiguationSelectedIndex_voiceCommandDisambiguationTargetCount_voiceCommandUUID_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v3 = a2;
  v4 = objc_msgSend(v3, "selectedTextRange");
  if ((*(_BYTE *)(a1 + 59) & 0x80) != 0)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32) += v4 - (*(_QWORD *)(a1 + 72) + *(_QWORD *)(a1 + 80));
  v5 = objc_msgSend(v3, "directionalRangeForSelectionRange:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  v7 = v6;

  objc_msgSend(*(id *)(a1 + 32), "inputDelegateManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __233__UIDictationController_performTextReplacementForWebKitWithDeltaRange_targetText_replacementText_originalSelectedRange_voiceCommandDisambiguationSelectedIndex_voiceCommandDisambiguationTargetCount_voiceCommandUUID_completionHandler___block_invoke_4;
  v9[3] = &unk_1E16B1BF8;
  v10 = *(id *)(a1 + 40);
  objc_msgSend(v8, "adjustSelection:completionHandler:", v5, v7, v9);

}

uint64_t __233__UIDictationController_performTextReplacementForWebKitWithDeltaRange_targetText_replacementText_originalSelectedRange_voiceCommandDisambiguationSelectedIndex_voiceCommandDisambiguationTargetCount_voiceCommandUUID_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __233__UIDictationController_performTextReplacementForWebKitWithDeltaRange_targetText_replacementText_originalSelectedRange_voiceCommandDisambiguationSelectedIndex_voiceCommandDisambiguationTargetCount_voiceCommandUUID_completionHandler___block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  __int128 v17;

  objc_msgSend(MEMORY[0x1E0DBDB48], "listWithAutocorrection:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_textChoicesAssistant");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addList:forCandidate:", v2, *(_QWORD *)(a1 + 32));

  objc_msgSend(*(id *)(a1 + 40), "_textChoicesAssistant");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trackUnderlineForWebKitCandidate:", *(_QWORD *)(a1 + 32));

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __233__UIDictationController_performTextReplacementForWebKitWithDeltaRange_targetText_replacementText_originalSelectedRange_voiceCommandDisambiguationSelectedIndex_voiceCommandDisambiguationTargetCount_voiceCommandUUID_completionHandler___block_invoke_6;
  v8[3] = &unk_1E16D4F70;
  v5 = *(void **)(a1 + 48);
  v9 = *(id *)(a1 + 40);
  v10 = *(id *)(a1 + 32);
  v6 = *(id *)(a1 + 56);
  v17 = *(_OWORD *)(a1 + 104);
  v7 = *(_QWORD *)(a1 + 96);
  v11 = v6;
  v16 = v7;
  v12 = *(id *)(a1 + 64);
  v13 = *(id *)(a1 + 72);
  v15 = *(id *)(a1 + 88);
  v14 = *(id *)(a1 + 80);
  objc_msgSend(v5, "_requestDocumentContextWithCompletionHandler:", v8);

}

void __233__UIDictationController_performTextReplacementForWebKitWithDeltaRange_targetText_replacementText_originalSelectedRange_voiceCommandDisambiguationSelectedIndex_voiceCommandDisambiguationTargetCount_voiceCommandUUID_completionHandler___block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  double v11;
  double x;
  double v13;
  double y;
  double v15;
  double width;
  double v17;
  double height;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  _QWORD v43[4];
  id v44;
  id v45;
  _QWORD v46[4];
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  uint64_t v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  void *v58;
  void *v59;
  _BYTE v60[128];
  uint64_t v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;

  v61 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "autocorrectedRanges");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "rangeValue");
  v8 = v7;

  objc_msgSend(v3, "characterRectsForCharacterRange:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "CGRectValue");
  x = v11;
  y = v13;
  width = v15;
  height = v17;

  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v19 = v9;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v55;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v55 != v22)
          objc_enumerationMutation(v19);
        objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1) + 8 * v23), "CGRectValue");
        v65.origin.x = v24;
        v65.origin.y = v25;
        v65.size.width = v26;
        v65.size.height = v27;
        v62.origin.x = x;
        v62.origin.y = y;
        v62.size.width = width;
        v62.size.height = height;
        v63 = CGRectUnion(v62, v65);
        x = v63.origin.x;
        y = v63.origin.y;
        width = v63.size.width;
        height = v63.size.height;
        ++v23;
      }
      while (v21 != v23);
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
    }
    while (v21);
  }

  v64.origin.x = x;
  v64.origin.y = y;
  v64.size.width = width;
  v64.size.height = height;
  if (CGRectIsEmpty(v64))
  {
    if ((*(_BYTE *)(a1 + 99) & 0x80) != 0)
    {
      v28 = objc_msgSend(*(id *)(a1 + 56), "length");
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 32) += objc_msgSend(*(id *)(a1 + 64), "length") - v28;
    }
    v29 = objc_msgSend(v3, "directionalRangeForSelectionRange:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40));
    v31 = v30;
    objc_msgSend(*(id *)(a1 + 32), "inputDelegateManager");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __233__UIDictationController_performTextReplacementForWebKitWithDeltaRange_targetText_replacementText_originalSelectedRange_voiceCommandDisambiguationSelectedIndex_voiceCommandDisambiguationTargetCount_voiceCommandUUID_completionHandler___block_invoke_9;
    v43[3] = &unk_1E16B2F48;
    v45 = *(id *)(a1 + 80);
    v44 = *(id *)(a1 + 72);
    objc_msgSend(v32, "adjustSelection:completionHandler:", v29, v31, v43);

    v33 = v45;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRect:", x, y, width, height);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_textChoicesAssistant");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = v33;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v59, 1);
    v41 = v8;
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "input");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = v35;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v58, 1);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "candidate");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = MEMORY[0x1E0C809B0];
    v46[1] = 3221225472;
    v46[2] = __233__UIDictationController_performTextReplacementForWebKitWithDeltaRange_targetText_replacementText_originalSelectedRange_voiceCommandDisambiguationSelectedIndex_voiceCommandDisambiguationTargetCount_voiceCommandUUID_completionHandler___block_invoke_7;
    v46[3] = &unk_1E16D4F48;
    v53 = *(_OWORD *)(a1 + 96);
    v52 = *(_QWORD *)(a1 + 88);
    v38 = v6;
    v39 = *(_QWORD *)(a1 + 48);
    v47 = *(id *)(a1 + 56);
    v48 = *(id *)(a1 + 64);
    v49 = v3;
    v50 = *(id *)(a1 + 32);
    v51 = *(id *)(a1 + 80);
    LOWORD(v40) = 256;
    objc_msgSend(v42, "decorateTextInRects:targetTextArray:replacementText:deltaRanges:originalSelectedRange:allowAutomaticReplacement:autoHide:voiceCommandUUID:withCompletionHandler:", v34, v36, v37, 0, v38, v41, v40, v39, v46);

  }
}

void __233__UIDictationController_performTextReplacementForWebKitWithDeltaRange_targetText_replacementText_originalSelectedRange_voiceCommandDisambiguationSelectedIndex_voiceCommandDisambiguationTargetCount_voiceCommandUUID_completionHandler___block_invoke_7(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  if ((*(_BYTE *)(a1 + 83) & 0x80) != 0)
  {
    v2 = objc_msgSend(*(id *)(a1 + 32), "length");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 32) += objc_msgSend(*(id *)(a1 + 40), "length") - v2;
  }
  v3 = objc_msgSend(*(id *)(a1 + 48), "directionalRangeForSelectionRange:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
  v5 = v4;
  objc_msgSend(*(id *)(a1 + 56), "inputDelegateManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __233__UIDictationController_performTextReplacementForWebKitWithDeltaRange_targetText_replacementText_originalSelectedRange_voiceCommandDisambiguationSelectedIndex_voiceCommandDisambiguationTargetCount_voiceCommandUUID_completionHandler___block_invoke_8;
  v7[3] = &unk_1E16B1BF8;
  v8 = *(id *)(a1 + 64);
  objc_msgSend(v6, "adjustSelection:completionHandler:", v3, v5, v7);

}

uint64_t __233__UIDictationController_performTextReplacementForWebKitWithDeltaRange_targetText_replacementText_originalSelectedRange_voiceCommandDisambiguationSelectedIndex_voiceCommandDisambiguationTargetCount_voiceCommandUUID_completionHandler___block_invoke_8(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __233__UIDictationController_performTextReplacementForWebKitWithDeltaRange_targetText_replacementText_originalSelectedRange_voiceCommandDisambiguationSelectedIndex_voiceCommandDisambiguationTargetCount_voiceCommandUUID_completionHandler___block_invoke_9(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)playVoiceCommandHapticFeedack
{
  UIImpactFeedbackGenerator *feedbackGenerator;
  id v3;

  feedbackGenerator = self->_feedbackGenerator;
  +[_UIDictationSettingsDomain rootSettings](_UIDictationSettingsDomain, "rootSettings");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "impactIntensity");
  -[UIImpactFeedbackGenerator impactOccurredWithIntensity:atLocation:](feedbackGenerator, "impactOccurredWithIntensity:atLocation:");

}

- (void)setDisambiguationActiveEnabled:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v3 = a3;
  self->_isDisambiguationUIActive = a3;
  -[UIDictationController dictationConnection](self, "dictationConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "supportNewVoiceEditingCommandSPI");

  -[UIDictationController dictationConnection](self, "dictationConnection");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      objc_msgSend(v10, "updateVoiceCommandContextWithPrefixText:postfixText:selectedText:disambiguationActive:cursorInVisibleText:favorCommandSuppression:abortCommandSuppression:undoEvent:", 0, 0, 0, v7, 0, v8, 0, 0);
    else
      objc_msgSend(v10, "updateVoiceCommandContextWithPrefixText:postfixText:selectedText:disambiguationActive:cursorInVisibleText:favorCommandSuppression:abortCommandSuppression:", 0, 0, 0, v7, 0, v8, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v9 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v9;
    if (v6)
      objc_msgSend(v10, "updateVoiceCommandContextWithPrefixText:postfixText:selectedText:disambiguationActive:cursorInVisibleText:favorCommandSuppression:abortCommandSuppression:undoEvent:", 0, 0, 0, v7, 0, 0, v9, 0);
    else
      objc_msgSend(v10, "updateVoiceCommandContextWithPrefixText:postfixText:selectedText:disambiguationActive:cursorInVisibleText:favorCommandSuppression:abortCommandSuppression:", 0, 0, 0, v7, 0, 0, v9);
  }

}

- (id)_obtainDisambiguationUIAssertion
{
  return -[_UIAssertionController vendAssertionOfType:initialState:](self->_assertionController, "vendAssertionOfType:initialState:", 42, 1);
}

- (BOOL)assertionActivationStateForType:(unint64_t)a3
{
  return a3 == 42 && self->_isDisambiguationUIActive;
}

- (void)assertionActivationStateChangedToState:(BOOL)a3 forType:(unint64_t)a4
{
  if (a4 == 42)
    -[UIDictationController setDisambiguationActiveEnabled:](self, "setDisambiguationActiveEnabled:", a3);
}

- (void)launchDictationFeedbackApp
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("dictationreporter://feedback"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)UIApp, "openURL:options:completionHandler:", v2, MEMORY[0x1E0C9AA70], &__block_literal_global_1174);

}

- (BOOL)enableEuclidAlternatives
{
  void *v2;
  char v3;

  +[UIDictationConnectionPreferences sharedInstance](UIDictationConnectionPreferences, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "enableEuclidAlternatives");

  return v3;
}

- (void)preheatEuclidModelWithLanguageCode:(id)a3 clientID:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[UIDictationController currentEuclidLanguage](self, "currentEuclidLanguage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v10, "isEqualToString:", v7);

  if ((v8 & 1) == 0)
  {
    -[UIDictationController setCurrentEuclidLanguage:](self, "setCurrentEuclidLanguage:", v10);
    -[UIDictationController dictationConnection](self, "dictationConnection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "preheatEuclidModelWithLanguageCode:clientID:", v10, v6);

  }
}

- (void)euclidPhoneticString:(id)a3 maxResultsCount:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a3;
  -[UIDictationController dictationConnection](self, "dictationConnection");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "euclidPhoneticString:maxResultsCount:completion:", v9, a4, v8);

}

- (void)logEuclidRequested
{
  id v3;

  v3 = objc_alloc_init((Class)getSISchemaUEIDictationEuclidSpeechAlternativesSelectedClass());
  objc_msgSend(v3, "setSpeechAlternativesType:", 1);
  -[AFAnalyticsTurnBasedInstrumentationContext emitInstrumentation:](self->_currentInstrumentationContext, "emitInstrumentation:", v3);

}

- (void)logEuclidSelection:(id)a3 suggestedTokens:(id)a4 correctedToken:(id)a5 selectedIndex:(int64_t)a6
{
  id v10;
  id v11;
  void *v12;
  objc_class *v13;
  id v14;
  void *v15;
  objc_class *v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(uint64_t);
  void *v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v26 = a3;
  v10 = a4;
  v25 = a5;
  v11 = objc_alloc_init((Class)getSISchemaUEIDictationEuclidSpeechAlternativesSelectedClass());
  objc_msgSend(v11, "setSpeechAlternativesType:", 2);
  objc_msgSend(v11, "setAlternativesIndexSelectedByUser:", a6);
  v36 = 0;
  v37 = &v36;
  v38 = 0x2050000000;
  v12 = (void *)qword_1ECD797E8;
  v39 = qword_1ECD797E8;
  if (!qword_1ECD797E8)
  {
    v31 = MEMORY[0x1E0C809B0];
    v32 = 3221225472;
    v33 = __getSISchemaUEIDictationEuclidSpeechAlternativesSelectedTier1Class_block_invoke;
    v34 = &unk_1E16B14C0;
    v35 = &v36;
    __getSISchemaUEIDictationEuclidSpeechAlternativesSelectedTier1Class_block_invoke((uint64_t)&v31);
    v12 = (void *)v37[3];
  }
  v13 = objc_retainAutorelease(v12);
  _Block_object_dispose(&v36, 8);
  v14 = objc_alloc_init(v13);
  v36 = 0;
  v37 = &v36;
  v38 = 0x2050000000;
  v15 = (void *)qword_1ECD797F0;
  v39 = qword_1ECD797F0;
  if (!qword_1ECD797F0)
  {
    v31 = MEMORY[0x1E0C809B0];
    v32 = 3221225472;
    v33 = __getSISchemaEuclidConfusionPairClass_block_invoke;
    v34 = &unk_1E16B14C0;
    v35 = &v36;
    __getSISchemaEuclidConfusionPairClass_block_invoke((uint64_t)&v31);
    v15 = (void *)v37[3];
  }
  v16 = objc_retainAutorelease(v15);
  _Block_object_dispose(&v36, 8);
  v17 = objc_alloc_init(v16);
  v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v19 = v10;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v27, v40, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v28;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v28 != v21)
          objc_enumerationMutation(v19);
        objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v22), "candidate", v25);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addObject:", v23);

        ++v22;
      }
      while (v20 != v22);
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v27, v40, 16);
    }
    while (v20);
  }

  objc_msgSend(v17, "setRecognizedToken:", v26);
  objc_msgSend(v17, "setSuggestedTokens:", v18);
  objc_msgSend(v25, "candidate");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setCorrectedToken:", v24);

  objc_msgSend(v14, "setConfusionPair:", v17);
  -[AFAnalyticsTurnBasedInstrumentationContext emitInstrumentation:](self->_currentInstrumentationContext, "emitInstrumentation:", v11);
  -[AFAnalyticsTurnBasedInstrumentationContext emitInstrumentation:](self->_currentInstrumentationContext, "emitInstrumentation:", v14);

}

- (NSString)activationIdentifier
{
  return self->_activationIdentifier;
}

- (void)setActivationIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 352);
}

- (NSString)smartLanguageSelectionOverrideLanguage
{
  return (NSString *)objc_getProperty(self, a2, 360, 1);
}

- (void)setSmartLanguageSelectionOverrideLanguage:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 360);
}

- (NSMutableArray)pendingEdits
{
  return self->_pendingEdits;
}

- (void)setPendingEdits:(id)a3
{
  objc_storeStrong((id *)&self->_pendingEdits, a3);
}

- (BOOL)performingStreamingEditingOperation
{
  return self->_performingStreamingEditingOperation;
}

- (void)setPerformingStreamingEditingOperation:(BOOL)a3
{
  self->_performingStreamingEditingOperation = a3;
}

- (NSString)previousHypothesis
{
  return self->_previousHypothesis;
}

- (void)setPreviousHypothesis:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 376);
}

- (void)setLastHypothesis:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 384);
}

- (NSString)targetHypothesis
{
  return self->_targetHypothesis;
}

- (void)setTargetHypothesis:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 392);
}

- (BOOL)discardNextHypothesis
{
  return self->_discardNextHypothesis;
}

- (void)setDiscardNextHypothesis:(BOOL)a3
{
  self->_discardNextHypothesis = a3;
}

- (_NSRange)insertionRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_insertionRange.length;
  location = self->_insertionRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setInsertionRange:(_NSRange)a3
{
  self->_insertionRange = a3;
}

- (BOOL)hasPreheated
{
  return self->_hasPreheated;
}

- (void)setHasPreheated:(BOOL)a3
{
  self->_hasPreheated = a3;
}

- (UIWindow)dictationPresenterWindow
{
  return self->_dictationPresenterWindow;
}

- (void)setDictationPresenterWindow:(id)a3
{
  objc_storeStrong((id *)&self->_dictationPresenterWindow, a3);
}

- (NSString)lastRecognitionText
{
  return self->_lastRecognitionText;
}

- (void)setLastRecognitionText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 416);
}

- (id)lastCorrectionIdentifier
{
  return self->_lastCorrectionIdentifier;
}

- (void)setLastCorrectionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 424);
}

- (NSString)interactionIdentifier
{
  return self->_interactionIdentifier;
}

- (NSString)lastMessageKeyboardLanguage
{
  return self->_lastMessageKeyboardLanguage;
}

- (void)setLastMessageKeyboardLanguage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 440);
}

- (BOOL)logAppEnterBackground
{
  return self->_logAppEnterBackground;
}

- (void)setLogAppEnterBackground:(BOOL)a3
{
  self->_logAppEnterBackground = a3;
}

- (BOOL)modelessUsedAtLeastOnce
{
  return self->_modelessUsedAtLeastOnce;
}

- (void)setModelessUsedAtLeastOnce:(BOOL)a3
{
  self->_modelessUsedAtLeastOnce = a3;
}

- (NSString)_inputDelegateClassName
{
  return self->__inputDelegateClassName;
}

- (void)set_inputDelegateClassName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 448);
}

- (BOOL)_shouldUseDictationSearchFieldBehavior
{
  return self->__shouldUseDictationSearchFieldBehavior;
}

- (void)set_shouldUseDictationSearchFieldBehavior:(BOOL)a3
{
  self->__shouldUseDictationSearchFieldBehavior = a3;
}

- (void)setShouldSuppressSoftwareKeyboard:(BOOL)a3
{
  self->_shouldSuppressSoftwareKeyboard = a3;
}

- (BOOL)resigningFirstResponder
{
  return self->_resigningFirstResponder;
}

- (void)setCurrentInputModeForDictation:(id)a3
{
  objc_storeStrong((id *)&self->_currentInputModeForDictation, a3);
}

- (UIKeyboardInputMode)keyboardInputModeToReturn
{
  return self->_keyboardInputModeToReturn;
}

- (void)setKeyboardInputModeToReturn:(id)a3
{
  objc_storeStrong((id *)&self->_keyboardInputModeToReturn, a3);
}

- (void)setShouldStayInDictationInputMode:(BOOL)a3
{
  self->_shouldStayInDictationInputMode = a3;
}

- (BOOL)haveReceivedFirstPartialResultForCurrentUtterance
{
  return self->_haveReceivedFirstPartialResultForCurrentUtterance;
}

- (void)setHaveReceivedFirstPartialResultForCurrentUtterance:(BOOL)a3
{
  self->_haveReceivedFirstPartialResultForCurrentUtterance = a3;
}

- (BOOL)haveLeakedPartialResultForCommandUtterance
{
  return self->_haveLeakedPartialResultForCommandUtterance;
}

- (void)setHaveLeakedPartialResultForCommandUtterance:(BOOL)a3
{
  self->_haveLeakedPartialResultForCommandUtterance = a3;
}

- (BOOL)isDictationUndoGroupingOpen
{
  return self->_isDictationUndoGroupingOpen;
}

- (void)setIsDictationUndoGroupingOpen:(BOOL)a3
{
  self->_isDictationUndoGroupingOpen = a3;
}

- (UIDictationCursorPositionRestorer)cursorPositionRestorer
{
  return self->_cursorPositionRestorer;
}

- (void)setCursorPositionRestorer:(id)a3
{
  objc_storeStrong((id *)&self->_cursorPositionRestorer, a3);
}

- (BOOL)isSendButtonPressedDuringDictation
{
  return self->_sendButtonPressedDuringDictation;
}

- (void)setSendButtonPressedDuringDictation:(BOOL)a3
{
  self->_sendButtonPressedDuringDictation = a3;
}

- (BOOL)hasInsertedAtLeastOneSerializedDictationResult
{
  return self->_hasInsertedAtLeastOneSerializedDictationResult;
}

- (void)setHasInsertedAtLeastOneSerializedDictationResult:(BOOL)a3
{
  self->_hasInsertedAtLeastOneSerializedDictationResult = a3;
}

- (BOOL)restoreStagedDictationOnIdle
{
  return self->_restoreStagedDictationOnIdle;
}

- (void)setRestoreStagedDictationOnIdle:(BOOL)a3
{
  self->_restoreStagedDictationOnIdle = a3;
}

- (NSTimer)idleTimerResetTimer
{
  return self->_idleTimerResetTimer;
}

- (void)setIdleTimerResetTimer:(id)a3
{
  objc_storeStrong((id *)&self->_idleTimerResetTimer, a3);
}

- (_NSRange)preCommandExecutionPositionRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_preCommandExecutionPositionRange.length;
  location = self->_preCommandExecutionPositionRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setPreCommandExecutionPositionRange:(_NSRange)a3
{
  self->_preCommandExecutionPositionRange = a3;
}

- (UIDictationSerializableResults)candidateDictationSerializableResults
{
  return self->_candidateDictationSerializableResults;
}

- (NSMutableDictionary)cachedDisplayLowStorageNotification
{
  return self->_cachedDisplayLowStorageNotification;
}

- (void)setCachedDisplayLowStorageNotification:(id)a3
{
  objc_storeStrong((id *)&self->_cachedDisplayLowStorageNotification, a3);
}

- (RTIDocumentState)visibleRTIDocumentStateAtStart
{
  return self->_visibleRTIDocumentStateAtStart;
}

- (void)setVisibleRTIDocumentStateAtStart:(id)a3
{
  objc_storeStrong((id *)&self->_visibleRTIDocumentStateAtStart, a3);
}

- (RTIDocumentState)visibleRTIDocumentStateAtCommandRecognition
{
  return self->_visibleRTIDocumentStateAtCommandRecognition;
}

- (void)setVisibleRTIDocumentStateAtCommandRecognition:(id)a3
{
  objc_storeStrong((id *)&self->_visibleRTIDocumentStateAtCommandRecognition, a3);
}

- (NSString)visibleContextBeforeInputAtCommandExecution
{
  return self->_visibleContextBeforeInputAtCommandExecution;
}

- (void)setVisibleContextBeforeInputAtCommandExecution:(id)a3
{
  objc_storeStrong((id *)&self->_visibleContextBeforeInputAtCommandExecution, a3);
}

- (BOOL)isProcessingPotentialVoiceCommand
{
  return self->_isProcessingPotentialVoiceCommand;
}

- (void)setIsProcessingPotentialVoiceCommand:(BOOL)a3
{
  self->_isProcessingPotentialVoiceCommand = a3;
}

- (BOOL)hasSelectedTextRange
{
  return self->_hasSelectedTextRange;
}

- (void)setHasSelectedTextRange:(BOOL)a3
{
  self->_hasSelectedTextRange = a3;
}

- (NSNumber)currentLanguageVerbFirstCommandLanguageStatusCached
{
  return self->_currentLanguageVerbFirstCommandLanguageStatusCached;
}

- (void)setCurrentLanguageVerbFirstCommandLanguageStatusCached:(id)a3
{
  objc_storeStrong((id *)&self->_currentLanguageVerbFirstCommandLanguageStatusCached, a3);
}

- (NSArray)lastSuppressedCommandPartialTokens
{
  return self->_lastSuppressedCommandPartialTokens;
}

- (void)setLastSuppressedCommandPartialTokens:(id)a3
{
  objc_storeStrong((id *)&self->_lastSuppressedCommandPartialTokens, a3);
}

- (AFAnalyticsTurnBasedInstrumentationContext)enablementInstrumentationContext
{
  return self->_enablementInstrumentationContext;
}

- (void)setEnablementInstrumentationContext:(id)a3
{
  objc_storeStrong((id *)&self->_enablementInstrumentationContext, a3);
}

- (BOOL)enablementLoggingIsDictationEnabled
{
  return self->_enablementLoggingIsDictationEnabled;
}

- (void)setEnablementLoggingIsDictationEnabled:(BOOL)a3
{
  self->_enablementLoggingIsDictationEnabled = a3;
}

- (BOOL)enablementLoggingIsLearnMoreButtonClicked
{
  return self->_enablementLoggingIsLearnMoreButtonClicked;
}

- (void)setEnablementLoggingIsLearnMoreButtonClicked:(BOOL)a3
{
  self->_enablementLoggingIsLearnMoreButtonClicked = a3;
}

- (NSValue)commandTargetRangeMatchingGazeRange
{
  return self->_commandTargetRangeMatchingGazeRange;
}

- (void)setCommandTargetRangeMatchingGazeRange:(id)a3
{
  objc_storeStrong((id *)&self->_commandTargetRangeMatchingGazeRange, a3);
}

- (NSString)currentEuclidLanguage
{
  return self->_currentEuclidLanguage;
}

- (void)setCurrentEuclidLanguage:(id)a3
{
  objc_storeStrong((id *)&self->_currentEuclidLanguage, a3);
}

- (_UIDictationPrivacySheetController)dictationPrivacySheetController
{
  return self->_dictationPrivacySheetController;
}

- (void)setDictationPrivacySheetController:(id)a3
{
  objc_storeStrong((id *)&self->_dictationPrivacySheetController, a3);
}

- (BOOL)didToggleSoftwareKeyboardVisibleForDictation
{
  return self->_didToggleSoftwareKeyboardVisibleForDictation;
}

- (void)setDidToggleSoftwareKeyboardVisibleForDictation:(BOOL)a3
{
  self->_didToggleSoftwareKeyboardVisibleForDictation = a3;
}

- (UIDictationInputModeOptions)inputModeOptions
{
  return self->_inputModeOptions;
}

- (void)setInputModeOptions:(id)a3
{
  objc_storeStrong((id *)&self->_inputModeOptions, a3);
}

- (NSString)detectedLanguage
{
  return self->_detectedLanguage;
}

- (void)setDetectedLanguage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 584);
}

- (NSArray)dictationLanguages
{
  return self->_dictationLanguages;
}

- (void)setDictationLanguages:(id)a3
{
  objc_storeStrong((id *)&self->_dictationLanguages, a3);
}

- (NSString)initialDictationLanguage
{
  return self->_initialDictationLanguage;
}

- (void)setInitialDictationLanguage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 600);
}

- (NSString)fallbackDictationLanguage
{
  return self->_fallbackDictationLanguage;
}

- (void)setFallbackDictationLanguage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 608);
}

- (unint64_t)dictationSourceType
{
  return self->_dictationSourceType;
}

- (void)setDictationSourceType:(unint64_t)a3
{
  self->_dictationSourceType = a3;
}

- (NSString)currentKeyboardPrimaryLanguage
{
  return self->_currentKeyboardPrimaryLanguage;
}

- (void)setCurrentKeyboardPrimaryLanguage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 624);
}

- (BOOL)selectionEndWasInitiallyAtParagraphBoundaryForAsyncDelegate
{
  return self->_selectionEndWasInitiallyAtParagraphBoundaryForAsyncDelegate;
}

- (void)setSelectionEndWasInitiallyAtParagraphBoundaryForAsyncDelegate:(BOOL)a3
{
  self->_selectionEndWasInitiallyAtParagraphBoundaryForAsyncDelegate = a3;
}

- (BOOL)selectionStartWasInitiallyAtParagraphBoundaryForAsyncDelegate
{
  return self->_selectionStartWasInitiallyAtParagraphBoundaryForAsyncDelegate;
}

- (void)setSelectionStartWasInitiallyAtParagraphBoundaryForAsyncDelegate:(BOOL)a3
{
  self->_selectionStartWasInitiallyAtParagraphBoundaryForAsyncDelegate = a3;
}

- (unsigned)initialPreviousCharacterForAsyncDelegate
{
  return self->_initialPreviousCharacterForAsyncDelegate;
}

- (void)setInitialPreviousCharacterForAsyncDelegate:(unsigned __int16)a3
{
  self->_initialPreviousCharacterForAsyncDelegate = a3;
}

- (unsigned)initialCharacterAfterSelectionForAsyncDelegate
{
  return self->_initialCharacterAfterSelectionForAsyncDelegate;
}

- (void)setInitialCharacterAfterSelectionForAsyncDelegate:(unsigned __int16)a3
{
  self->_initialCharacterAfterSelectionForAsyncDelegate = a3;
}

- (unint64_t)stateHandler
{
  return self->_stateHandler;
}

- (void)setStateHandler:(unint64_t)a3
{
  self->_stateHandler = a3;
}

- (BOOL)localSpeechRecognitionForced
{
  return self->_localSpeechRecognitionForced;
}

- (BOOL)secureOfflineOnlySpeechRecognition
{
  return self->_secureOfflineOnlySpeechRecognition;
}

- (void)setSecureOfflineOnlySpeechRecognition:(BOOL)a3
{
  self->_secureOfflineOnlySpeechRecognition = a3;
}

- (NSString)modelInfo
{
  return self->_modelInfo;
}

- (void)setModelInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 640);
}

- (BOOL)ignoreFinalizePhrases
{
  return self->_ignoreFinalizePhrases;
}

- (BOOL)shouldResumeDictation
{
  return self->_shouldResumeDictation;
}

- (void)setShouldResumeDictation:(BOOL)a3
{
  self->_shouldResumeDictation = a3;
}

- (BOOL)skipAutomaticResumeDictation
{
  return self->_skipAutomaticResumeDictation;
}

- (void)setSkipAutomaticResumeDictation:(BOOL)a3
{
  self->_skipAutomaticResumeDictation = a3;
}

- (BOOL)ignoreUserInteraction
{
  return self->_ignoreUserInteraction;
}

- (void)setIgnoreUserInteraction:(BOOL)a3
{
  self->_ignoreUserInteraction = a3;
}

- (BOOL)canUndoOrRedo
{
  return self->_canUndoOrRedo;
}

- (void)setCanUndoOrRedo:(BOOL)a3
{
  self->_canUndoOrRedo = a3;
}

- (BOOL)isDetectingUtterances
{
  return self->_detectingUtterances;
}

- (void)setDetectingUtterances:(BOOL)a3
{
  self->_detectingUtterances = a3;
}

- (BOOL)isFinalizingRecognizedUtterance
{
  return self->_finalizingRecognizedUtterance;
}

- (void)setFinalizingRecognizedUtterance:(BOOL)a3
{
  self->_finalizingRecognizedUtterance = a3;
}

- (BOOL)hasCheckedForLeadingSpaceOnce
{
  return self->_hasCheckedForLeadingSpaceOnce;
}

- (void)setHasCheckedForLeadingSpaceOnce:(BOOL)a3
{
  self->_hasCheckedForLeadingSpaceOnce = a3;
}

- (unsigned)previousCharacter
{
  return self->_previousCharacter;
}

- (void)setPreviousCharacter:(unsigned __int16)a3
{
  self->_previousCharacter = a3;
}

- (BOOL)selectionStartIsStartOfParagraph
{
  return self->_selectionStartIsStartOfParagraph;
}

- (void)setSelectionStartIsStartOfParagraph:(BOOL)a3
{
  self->_selectionStartIsStartOfParagraph = a3;
}

- (AFAnalyticsTurnBasedInstrumentationContext)currentInstrumentationContext
{
  return self->_currentInstrumentationContext;
}

- (BOOL)suppressDelegateTextInputDidChangeNotifications
{
  return self->_suppressDelegateTextInputDidChangeNotifications;
}

- (void)setSuppressDelegateTextInputDidChangeNotifications:(BOOL)a3
{
  self->_suppressDelegateTextInputDidChangeNotifications = a3;
}

- (BOOL)shouldDeleteWordOnBackspaceTap
{
  return self->_shouldDeleteWordOnBackspaceTap;
}

- (_NSRange)startRangeOfCurrentHypothesis
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_startRangeOfCurrentHypothesis.length;
  location = self->_startRangeOfCurrentHypothesis.location;
  result.length = length;
  result.location = location;
  return result;
}

- (BOOL)pauseUpdatingHelperMessage
{
  return self->_pauseUpdatingHelperMessage;
}

- (void)setDictationTipController:(id)a3
{
  objc_storeStrong((id *)&self->_dictationTipController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictationTipController, 0);
  objc_storeStrong((id *)&self->_currentInstrumentationContext, 0);
  objc_storeStrong((id *)&self->_modelInfo, 0);
  objc_storeStrong((id *)&self->_currentKeyboardPrimaryLanguage, 0);
  objc_storeStrong((id *)&self->_fallbackDictationLanguage, 0);
  objc_storeStrong((id *)&self->_initialDictationLanguage, 0);
  objc_storeStrong((id *)&self->_dictationLanguages, 0);
  objc_storeStrong((id *)&self->_detectedLanguage, 0);
  objc_storeStrong((id *)&self->_inputModeOptions, 0);
  objc_storeStrong((id *)&self->_dictationPrivacySheetController, 0);
  objc_storeStrong((id *)&self->_currentEuclidLanguage, 0);
  objc_storeStrong((id *)&self->_commandTargetRangeMatchingGazeRange, 0);
  objc_storeStrong((id *)&self->_enablementInstrumentationContext, 0);
  objc_storeStrong((id *)&self->_lastSuppressedCommandPartialTokens, 0);
  objc_storeStrong((id *)&self->_currentLanguageVerbFirstCommandLanguageStatusCached, 0);
  objc_storeStrong((id *)&self->_visibleContextBeforeInputAtCommandExecution, 0);
  objc_storeStrong((id *)&self->_visibleRTIDocumentStateAtCommandRecognition, 0);
  objc_storeStrong((id *)&self->_visibleRTIDocumentStateAtStart, 0);
  objc_storeStrong((id *)&self->_cachedDisplayLowStorageNotification, 0);
  objc_storeStrong((id *)&self->_candidateDictationSerializableResults, 0);
  objc_storeStrong((id *)&self->_idleTimerResetTimer, 0);
  objc_storeStrong((id *)&self->_cursorPositionRestorer, 0);
  objc_storeStrong((id *)&self->_keyboardInputModeToReturn, 0);
  objc_storeStrong((id *)&self->_currentInputModeForDictation, 0);
  objc_storeStrong((id *)&self->__inputDelegateClassName, 0);
  objc_storeStrong((id *)&self->_lastMessageKeyboardLanguage, 0);
  objc_storeStrong((id *)&self->_interactionIdentifier, 0);
  objc_storeStrong(&self->_lastCorrectionIdentifier, 0);
  objc_storeStrong((id *)&self->_lastRecognitionText, 0);
  objc_storeStrong((id *)&self->_dictationPresenterWindow, 0);
  objc_storeStrong((id *)&self->_targetHypothesis, 0);
  objc_storeStrong((id *)&self->_lastHypothesis, 0);
  objc_storeStrong((id *)&self->_previousHypothesis, 0);
  objc_storeStrong((id *)&self->_pendingEdits, 0);
  objc_storeStrong((id *)&self->_smartLanguageSelectionOverrideLanguage, 0);
  objc_storeStrong((id *)&self->_activationIdentifier, 0);
  objc_storeStrong(&self->_undoNotificationToken, 0);
  objc_storeStrong((id *)&self->_feedbackGenerator, 0);
  objc_storeStrong((id *)&self->_assertionController, 0);
  objc_storeStrong((id *)&self->_selectedTextAtStart, 0);
  objc_storeStrong((id *)&self->_hardwareVoiceCommandKeyRecognizer, 0);
  objc_storeStrong((id *)&self->_hardwareShortcutRecognizer, 0);
  objc_storeStrong(&self->_privacySheetDismissalHandler, 0);
  objc_storeStrong((id *)&self->_selectedAttributesForDictation, 0);
  objc_storeStrong((id *)&self->_postfixTextForStart, 0);
  objc_storeStrong((id *)&self->_selectionTextForStart, 0);
  objc_storeStrong((id *)&self->_prefixTextForStart, 0);
  objc_storeStrong((id *)&self->_monitor, 0);
  objc_storeStrong((id *)&self->_streamingAnimationDisplayLink, 0);
  objc_storeStrong(&self->_finalResultsOperation, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_streamingOperations, 0);
  objc_storeStrong((id *)&self->_recordingLimitTimer, 0);
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong((id *)&self->_dictationConnection, 0);
}

@end
