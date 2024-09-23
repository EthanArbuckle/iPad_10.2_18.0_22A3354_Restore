@implementation UIKeyboardVisualModeManager

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIKeyboardVisualModeManager)init
{
  UIKeyboardVisualModeManager *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)UIKeyboardVisualModeManager;
  v2 = -[UIKeyboardVisualModeManager init](&v9, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_enhancedWindowingModeDidChange_, CFSTR("_UIWindowSceneEnhancedWindowingModeChanged"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v2, sel_keyboardCameraNotification_, CFSTR("_UIKeyboardCameraSessionWillPresent"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel_keyboardCameraNotification_, CFSTR("_UIKeyboardCameraSessionWillDismiss"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v2, sel_keyboardCameraNotification_, CFSTR("_UISubstituteKeyboardSessionWillPresent"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v2, sel_keyboardCameraNotification_, CFSTR("_UISubstituteKeyboardSessionWillDismiss"), 0);

  }
  return v2;
}

- (BOOL)useVisualModeWindowed
{
  _BOOL4 v3;
  _BOOL4 v4;
  NSObject *v5;
  _DWORD v7[2];
  __int16 v8;
  _BOOL4 v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = -[UIKeyboardVisualModeManager windowingModeEnabled](self, "windowingModeEnabled");
  v4 = v3 && -[UIKeyboardVisualModeManager visualMode](self, "visualMode") == 2;
  +[UIKeyboardVisualModeManager visualModeLog](UIKeyboardVisualModeManager, "visualModeLog");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v7[0] = 67109376;
    v7[1] = v4;
    v8 = 1024;
    v9 = v3;
    _os_log_debug_impl(&dword_185066000, v5, OS_LOG_TYPE_DEBUG, "useVisualModeWindowed: %d (windowingModeEnabled: %d)", (uint8_t *)v7, 0xEu);
  }

  return v4;
}

- (BOOL)windowingModeEnabled
{
  void *v3;
  void *v4;
  char v5;
  NSObject *v7;
  int v8;
  UIKeyboardVisualModeManager *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[UIKeyboardVisualModeManager delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UIKeyboardVisualModeManager delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "enhancedWindowingModeIsEnabled");

    return v5;
  }
  else
  {
    +[UIKeyboardVisualModeManager visualModeLog](UIKeyboardVisualModeManager, "visualModeLog");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 138412290;
      v9 = self;
      _os_log_error_impl(&dword_185066000, v7, OS_LOG_TYPE_ERROR, "Invalid UIKeyboardVisualModeManager (%@) configured without a datasource", (uint8_t *)&v8, 0xCu);
    }

    return 0;
  }
}

- (UIKeyboardVisualModeManagerDelegate)delegate
{
  return (UIKeyboardVisualModeManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

+ (id)visualModeLog
{
  if (qword_1ECD7DC80 != -1)
    dispatch_once(&qword_1ECD7DC80, &__block_literal_global_16_2);
  return (id)qword_1ECD7DC78;
}

+ (BOOL)softwareKeyboardAllowedForActiveKeyboardSceneDelegate
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  int v9;

  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 1;
  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "visualModeManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "windowingModeEnabled");

  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isKeyboardOnEmbeddedScreen");

  if (v6)
    v9 = objc_msgSend(a1, "windowingSoftwareKeyboardAllowed");
  else
    v9 = 1;
  if (((v8 | v9 ^ 1) & 1) != 0)
    return v8 & v9;
  else
    return objc_msgSend(a1, "softwareKeyboardAllowedOnExternalScreen");
}

void __44__UIKeyboardVisualModeManager_visualModeLog__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.UIKit", "KeyboardVisualMode");
  v1 = (void *)qword_1ECD7DC78;
  qword_1ECD7DC78 = (uint64_t)v0;

}

- (BOOL)shouldShowWithinAppWindow
{
  _BOOL4 v3;
  void *v4;
  char v5;

  v3 = -[UIKeyboardVisualModeManager useVisualModeWindowed](self, "useVisualModeWindowed");
  if (v3)
  {
    -[UIKeyboardVisualModeManager delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "showingInAppWindow");

    LOBYTE(v3) = v5;
  }
  return v3;
}

+ (BOOL)windowingSoftwareKeyboardAllowed
{
  return _os_feature_enabled_impl();
}

+ (BOOL)softwareKeyboardAllowedOnExternalScreen
{
  if (qword_1ECD7DC70 != -1)
    dispatch_once(&qword_1ECD7DC70, &__block_literal_global_224);
  return _MergedGlobals_1050;
}

void __70__UIKeyboardVisualModeManager_softwareKeyboardAllowedOnExternalScreen__block_invoke()
{
  void *v0;
  id v1;

  if (qword_1ECD7DC88 != -1)
    dispatch_once(&qword_1ECD7DC88, &__block_literal_global_47_1);
  objc_msgSend(MEMORY[0x1E0DBDCA8], "sharedPreferencesController");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "valueForPreferenceKey:", CFSTR("ChamoisExternalSWKeyboard"));
  v1 = (id)objc_claimAutoreleasedReturnValue();

  _MergedGlobals_1050 = objc_msgSend(v1, "BOOLValue");
}

- (int)visualMode
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  unsigned int v13;
  void *v14;
  _BOOL4 v15;
  int v16;
  uint64_t v17;
  unsigned int v18;
  void *v19;
  BOOL v20;
  void *v21;
  NSObject *v22;
  unsigned int v24;
  unsigned int v25;
  _BOOL4 v26;
  unsigned int v27;
  uint8_t buf[4];
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = -[UIKeyboardVisualModeManager windowingModeEnabled](self, "windowingModeEnabled");
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v5, "_isHardwareKeyboardAvailable");

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v6, "isMinimized");

  -[UIKeyboardVisualModeManager delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v7, "expectedInputViewSetIsCustom");

  v26 = -[UIKeyboardVisualModeManager textEntryFocusOnExternalDisplay](self, "textEntryFocusOnExternalDisplay");
  v8 = -[UIKeyboardVisualModeManager expectedInputModeIsSpecialized](self, "expectedInputModeIsSpecialized");
  +[_UIRemoteKeyboards sharedRemoteKeyboards](_UIRemoteKeyboards, "sharedRemoteKeyboards");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "wantsAssistantWhileSuppressingKeyboard"))
  {
    +[_UIRemoteKeyboards sharedRemoteKeyboards](_UIRemoteKeyboards, "sharedRemoteKeyboards");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "disableBecomeFirstResponder");

  }
  else
  {
    v11 = 0;
  }

  +[UIKeyboardCameraSession activeSession](UIKeyboardCameraSession, "activeSession");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v12, "isPresented") & 1) != 0)
    v13 = 1;
  else
    v13 = objc_msgSend(v12, "isPresenting");
  +[UISubstituteKeyboardSession activeSession](UISubstituteKeyboardSession, "activeSession");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "isPresented"))
  {
    v15 = 1;
    if (v3)
      goto LABEL_9;
LABEL_14:
    v17 = 1;
    goto LABEL_33;
  }
  v15 = objc_msgSend(v14, "isPresenting") != 0;
  if (!v3)
    goto LABEL_14;
LABEL_9:
  if (v4)
  {
    if (v27)
    {
      if ((v25 | v8) == 1)
        v16 = v26;
      else
        v16 = v24;
      goto LABEL_26;
    }
    -[UIKeyboardVisualModeManager delegate](self, "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v19, "showingAccessoryViewOnly") & 1) == 0)
    {

      v16 = v24 & v26 | v11;
LABEL_26:
      v20 = v16 == 0;
LABEL_27:
      if (v20)
        v18 = 1;
      else
        v18 = 2;
      goto LABEL_30;
    }

  }
  else
  {
    if (!v27)
    {
      v20 = v11 == 0;
      goto LABEL_27;
    }
    if (!v26)
    {
      if (v25 | v8)
        v18 = 1;
      else
        v18 = 2;
      goto LABEL_30;
    }
  }
  v18 = 2;
LABEL_30:
  if (v13 | v15)
    v17 = 1;
  else
    v17 = v18;
LABEL_33:
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("visualMode %u -> %u (chamois: %d, initialized: %d, hw kb: %d, sw kb min: %d, custom iv %d, isExternal: %d, kb cam: %d, specialized: %d, wantsAssistant: %d)"), -[UIKeyboardVisualModeManager lastVisualMode](self, "lastVisualMode"), v17, v3, v4 != 0, v27, v24, v25, v26, v13, v8, v11);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[UIKeyboardVisualModeManager lastVisualMode](self, "lastVisualMode") != (_DWORD)v17)
  {
    -[UIKeyboardVisualModeManager setLastVisualMode:](self, "setLastVisualMode:", v17);
    +[UIKeyboardVisualModeManager visualModeLog](UIKeyboardVisualModeManager, "visualModeLog");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v29 = v21;
      _os_log_impl(&dword_185066000, v22, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }

  }
  return v17;
}

- (void)enhancedWindowingModeDidChange:(id)a3
{
  UIKeyboardVisualModeManager *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  _BOOL8 v9;
  void *v10;
  uint64_t v11;
  int v12;
  UIKeyboardVisualModeManager *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  UIKeyboardVisualModeManager *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = (UIKeyboardVisualModeManager *)a3;
  -[UIKeyboardVisualModeManager delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[UIKeyboardVisualModeManager visualModeLog](UIKeyboardVisualModeManager, "visualModeLog");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      -[UIKeyboardVisualModeManager userInfo](v4, "userInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412802;
      v13 = v4;
      v14 = 2112;
      v15 = v8;
      v16 = 2112;
      v17 = self;
      _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_DEFAULT, "enhancedWindowingModeChangeNotification: %@ info: %@ received by %@", (uint8_t *)&v12, 0x20u);

    }
    v9 = -[UIKeyboardVisualModeManager windowingModeEnabled](self, "windowingModeEnabled");
    -[UIKeyboardVisualModeManager delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "visualModeManager:observedEnhancedWindowingModeEnabledDidChange:", self, v9);

    v11 = -[UIKeyboardVisualModeManager visualMode](self, "visualMode");
    -[UIKeyboardVisualModeManager delegate](self, "delegate");
    v7 = objc_claimAutoreleasedReturnValue();
    -[NSObject visualModeManager:didChangeToMode:](v7, "visualModeManager:didChangeToMode:", self, v11);
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v12 = 138412290;
    v13 = self;
    _os_log_error_impl(&dword_185066000, v7, OS_LOG_TYPE_ERROR, "Invalid UIKeyboardVisualModeManager (%@) configured without a delegate", (uint8_t *)&v12, 0xCu);
  }

}

- (void)keyboardCameraNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  int v11;
  UIKeyboardVisualModeManager *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  UIKeyboardVisualModeManager *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[UIKeyboardVisualModeManager delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[UIKeyboardVisualModeManager delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "enhancedWindowingModeIsAvailable");

    +[UIKeyboardVisualModeManager visualModeLog](UIKeyboardVisualModeManager, "visualModeLog");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v7)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v11 = 136315650;
        v12 = (UIKeyboardVisualModeManager *)"-[UIKeyboardVisualModeManager keyboardCameraNotification:]";
        v13 = 2112;
        v14 = v4;
        v15 = 2112;
        v16 = self;
        _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_DEFAULT, "%s: %@ received by %@", (uint8_t *)&v11, 0x20u);
      }

      -[UIKeyboardVisualModeManager delegate](self, "delegate");
      v9 = objc_claimAutoreleasedReturnValue();
      -[NSObject visualModeManager:didChangeToMode:](v9, "visualModeManager:didChangeToMode:", self, -[UIKeyboardVisualModeManager visualMode](self, "visualMode"));
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      -[UIKeyboardVisualModeManager delegate](self, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412546;
      v12 = self;
      v13 = 2112;
      v14 = v10;
      _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_INFO, "Ignoring Keyboard Camera notification for (%@), enhanced windowing is not available on (%@)", (uint8_t *)&v11, 0x16u);

    }
  }
  else
  {
    +[UIKeyboardVisualModeManager visualModeLog](UIKeyboardVisualModeManager, "visualModeLog");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11 = 138412290;
      v12 = self;
      _os_log_error_impl(&dword_185066000, v9, OS_LOG_TYPE_ERROR, "Invalid UIKeyboardVisualModeManager (%@) configured without a delegate", (uint8_t *)&v11, 0xCu);
    }
  }

}

- (BOOL)textEntryFocusOnExternalDisplay
{
  void *v3;
  void *v4;
  char v5;
  NSObject *v7;
  int v8;
  UIKeyboardVisualModeManager *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[UIKeyboardVisualModeManager delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UIKeyboardVisualModeManager delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "textEntryFocusOnExternalDisplay");

    return v5;
  }
  else
  {
    +[UIKeyboardVisualModeManager visualModeLog](UIKeyboardVisualModeManager, "visualModeLog");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 138412290;
      v9 = self;
      _os_log_error_impl(&dword_185066000, v7, OS_LOG_TYPE_ERROR, "Invalid UIKeyboardVisualModeManager (%@) configured without a datasource", (uint8_t *)&v8, 0xCu);
    }

    return 0;
  }
}

- (BOOL)expectedInputModeIsSpecialized
{
  void *v3;
  void *v4;
  char v5;
  NSObject *v7;
  int v8;
  UIKeyboardVisualModeManager *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[UIKeyboardVisualModeManager delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UIKeyboardVisualModeManager delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "expectedInputModeIsSpecialized");

    return v5;
  }
  else
  {
    +[UIKeyboardVisualModeManager visualModeLog](UIKeyboardVisualModeManager, "visualModeLog");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 138412290;
      v9 = self;
      _os_log_error_impl(&dword_185066000, v7, OS_LOG_TYPE_ERROR, "Invalid UIKeyboardVisualModeManager (%@) configured without a datasource", (uint8_t *)&v8, 0xCu);
    }

    return 0;
  }
}

- (int)lastVisualMode
{
  return self->_lastVisualMode;
}

- (void)setLastVisualMode:(int)a3
{
  self->_lastVisualMode = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
