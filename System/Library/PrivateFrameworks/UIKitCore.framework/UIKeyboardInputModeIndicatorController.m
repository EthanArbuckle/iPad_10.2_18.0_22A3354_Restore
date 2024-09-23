@implementation UIKeyboardInputModeIndicatorController

- (void)keyboardWindowEnabled:(BOOL)a3
{
  _BOOL4 v3;
  unint64_t v5;
  NSObject *v6;
  const char *v7;
  int v8;
  const char *v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v3 = a3;
  v12 = *MEMORY[0x1E0C80C00];
  v5 = keyboardWindowEnabled____s_category;
  if (!keyboardWindowEnabled____s_category)
  {
    v5 = __UILogCategoryGetNode("InputModeIndicator", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v5, (unint64_t *)&keyboardWindowEnabled____s_category);
  }
  if ((*(_BYTE *)v5 & 1) != 0)
  {
    v6 = *(NSObject **)(v5 + 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = "N";
      if (v3)
        v7 = "Y";
      v8 = 136315394;
      v9 = "-[UIKeyboardInputModeIndicatorController keyboardWindowEnabled:]";
      v10 = 2080;
      v11 = v7;
      _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_ERROR, "%s enabled=%s", (uint8_t *)&v8, 0x16u);
    }
  }
  if (!v3)
    -[UIKeyboardInputModeIndicatorController clear](self, "clear");
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setIdleAction:(id)a3
{
  objc_storeStrong((id *)&self->_idleAction, a3);
}

- (void)clear
{
  void *v3;
  void *v4;

  -[UIKeyboardInputModeIndicatorController dismissIndicator](self, "dismissIndicator");
  -[UIKeyboardInputModeIndicatorController dismissAction](self, "dismissAction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  -[UIKeyboardInputModeIndicatorController setDismissAction:](self, "setDismissAction:", 0);
  -[UIKeyboardInputModeIndicatorController idleAction](self, "idleAction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancel");

  -[UIKeyboardInputModeIndicatorController setIdleAction:](self, "setIdleAction:", 0);
}

- (UIDelayedAction)idleAction
{
  return self->_idleAction;
}

- (void)dismissIndicator
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  unint64_t v7;
  UIDelayedAction *v8;
  unint64_t v9;
  UIDelayedAction *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (qword_1ECD7C8B8 != -1)
    dispatch_once(&qword_1ECD7C8B8, &__block_literal_global_12);
  -[UIKeyboardInputModeIndicatorController dismissAction](self, "dismissAction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  -[UIKeyboardInputModeIndicatorController setDismissAction:](self, "setDismissAction:", 0);
  v4 = qword_1ECD7C8C0;
  if (!qword_1ECD7C8C0)
  {
    v4 = __UILogCategoryGetNode("InputModeIndicator", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v4, (unint64_t *)&qword_1ECD7C8C0);
  }
  if ((*(_BYTE *)v4 & 1) != 0)
  {
    v11 = *(NSObject **)(v4 + 8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_185066000, v11, OS_LOG_TYPE_ERROR, "Dismiss indicator.", (uint8_t *)&v14, 2u);
    }
  }
  -[UIKeyboardInputModeIndicatorController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "keyboardInputModeIndicatorControllerDismissIndicator:", self);

  if (-[UIKeyboardInputModeIndicatorController enabled](self, "enabled"))
  {
    -[UIKeyboardInputModeIndicatorController idleAction](self, "idleAction");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = qword_1ECD7C8C8;
      if (!qword_1ECD7C8C8)
      {
        v7 = __UILogCategoryGetNode("InputModeIndicator", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v7, (unint64_t *)&qword_1ECD7C8C8);
      }
      if ((*(_BYTE *)v7 & 1) != 0)
      {
        v12 = *(NSObject **)(v7 + 8);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v14) = 0;
          _os_log_impl(&dword_185066000, v12, OS_LOG_TYPE_ERROR, "Reset idle timer.", (uint8_t *)&v14, 2u);
        }
      }
      -[UIKeyboardInputModeIndicatorController idleAction](self, "idleAction");
      v8 = (UIDelayedAction *)objc_claimAutoreleasedReturnValue();
      -[UIDelayedAction touch](v8, "touch");
    }
    else
    {
      v9 = qword_1ECD7C8D0;
      if (!qword_1ECD7C8D0)
      {
        v9 = __UILogCategoryGetNode("InputModeIndicator", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v9, (unint64_t *)&qword_1ECD7C8D0);
      }
      if ((*(_BYTE *)v9 & 1) != 0)
      {
        v13 = *(NSObject **)(v9 + 8);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          v14 = 134217984;
          v15 = dismissIndicator_idleTime;
          _os_log_impl(&dword_185066000, v13, OS_LOG_TYPE_ERROR, "Invoke idle action after %lf sec.", (uint8_t *)&v14, 0xCu);
        }
      }
      v10 = [UIDelayedAction alloc];
      v8 = -[UIDelayedAction initWithTarget:action:userInfo:delay:](v10, "initWithTarget:action:userInfo:delay:", self, sel_idle, 0, *(double *)&dismissIndicator_idleTime);
      -[UIKeyboardInputModeIndicatorController setIdleAction:](self, "setIdleAction:", v8);
    }

  }
}

- (void)setDismissAction:(id)a3
{
  objc_storeStrong((id *)&self->_dismissAction, a3);
}

- (UIDelayedAction)dismissAction
{
  return self->_dismissAction;
}

- (BOOL)enabled
{
  int v3;
  void *v4;
  void *v5;
  char v6;

  v3 = objc_msgSend((id)objc_opt_class(), "enabled");
  if (v3)
  {
    -[UIKeyboardInputModeIndicatorController delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[UIKeyboardInputModeIndicatorController delegate](self, "delegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "keyboardInputModeIndicatorControllerShouldPresentIndicator:", self);

      LOBYTE(v3) = v6;
    }
    else
    {
      LOBYTE(v3) = 1;
    }
  }
  return v3;
}

- (UIKeyboardInputModeIndicatorControllerDelegate)delegate
{
  return (UIKeyboardInputModeIndicatorControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

+ (BOOL)enabled
{
  return +[UIKeyboard isLanguageIndicatorEnabled](UIKeyboard, "isLanguageIndicatorEnabled");
}

void __58__UIKeyboardInputModeIndicatorController_dismissIndicator__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  id v3;

  _UIKitUserDefaults();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKey:", CFSTR("UIKeyboardInputModeIndicatorIdleTime"));
  v3 = (id)objc_claimAutoreleasedReturnValue();

  v1 = v3;
  if (v3)
  {
    objc_msgSend(v3, "doubleValue");
    v1 = v3;
    dismissIndicator_idleTime = v2;
  }

}

- (void)idle
{
  unint64_t v3;
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = idle___s_category;
  if (!idle___s_category)
  {
    v3 = __UILogCategoryGetNode("InputModeIndicator", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v3, (unint64_t *)&idle___s_category);
  }
  if ((*(_BYTE *)v3 & 1) != 0)
  {
    v4 = *(NSObject **)(v3 + 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 136315138;
      v6 = "-[UIKeyboardInputModeIndicatorController idle]";
      _os_log_impl(&dword_185066000, v4, OS_LOG_TYPE_ERROR, "%s", (uint8_t *)&v5, 0xCu);
    }
  }
  -[UIKeyboardInputModeIndicatorController presentIndicatorWithReason:force:](self, "presentIndicatorWithReason:force:", CFSTR("idle"), 0);
}

- (void)inputModeChanged
{
  unint64_t v3;
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = inputModeChanged___s_category;
  if (!inputModeChanged___s_category)
  {
    v3 = __UILogCategoryGetNode("InputModeIndicator", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v3, (unint64_t *)&inputModeChanged___s_category);
  }
  if ((*(_BYTE *)v3 & 1) != 0)
  {
    v4 = *(NSObject **)(v3 + 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 136315138;
      v6 = "-[UIKeyboardInputModeIndicatorController inputModeChanged]";
      _os_log_impl(&dword_185066000, v4, OS_LOG_TYPE_ERROR, "%s", (uint8_t *)&v5, 0xCu);
    }
  }
  -[UIKeyboardInputModeIndicatorController showIndicatorWithReason:force:](self, "showIndicatorWithReason:force:", CFSTR("input mode changed"), 1);
}

- (void)hardwareKeyboardDettached
{
  unint64_t v3;
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = hardwareKeyboardDettached___s_category;
  if (!hardwareKeyboardDettached___s_category)
  {
    v3 = __UILogCategoryGetNode("InputModeIndicator", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v3, (unint64_t *)&hardwareKeyboardDettached___s_category);
  }
  if ((*(_BYTE *)v3 & 1) != 0)
  {
    v4 = *(NSObject **)(v3 + 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 136315138;
      v6 = "-[UIKeyboardInputModeIndicatorController hardwareKeyboardDettached]";
      _os_log_impl(&dword_185066000, v4, OS_LOG_TYPE_ERROR, "%s", (uint8_t *)&v5, 0xCu);
    }
  }
  -[UIKeyboardInputModeIndicatorController clear](self, "clear");
}

- (void)keyPressed
{
  unint64_t v3;
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = keyPressed___s_category;
  if (!keyPressed___s_category)
  {
    v3 = __UILogCategoryGetNode("InputModeIndicator", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v3, (unint64_t *)&keyPressed___s_category);
  }
  if ((*(_BYTE *)v3 & 1) != 0)
  {
    v4 = *(NSObject **)(v3 + 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 136315138;
      v6 = "-[UIKeyboardInputModeIndicatorController keyPressed]";
      _os_log_impl(&dword_185066000, v4, OS_LOG_TYPE_ERROR, "%s", (uint8_t *)&v5, 0xCu);
    }
  }
  -[UIKeyboardInputModeIndicatorController dismissIndicator](self, "dismissIndicator");
}

- (void)willResignActive
{
  unint64_t v3;
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = willResignActive___s_category;
  if (!willResignActive___s_category)
  {
    v3 = __UILogCategoryGetNode("InputModeIndicator", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v3, (unint64_t *)&willResignActive___s_category);
  }
  if ((*(_BYTE *)v3 & 1) != 0)
  {
    v4 = *(NSObject **)(v3 + 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 136315138;
      v6 = "-[UIKeyboardInputModeIndicatorController willResignActive]";
      _os_log_impl(&dword_185066000, v4, OS_LOG_TYPE_ERROR, "%s", (uint8_t *)&v5, 0xCu);
    }
  }
  -[UIKeyboardInputModeIndicatorController clear](self, "clear");
}

- (void)inputModeSelectorDidOpen
{
  void *v3;

  -[UIKeyboardInputModeIndicatorController dismissAction](self, "dismissAction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  -[UIKeyboardInputModeIndicatorController setDismissAction:](self, "setDismissAction:", 0);
}

- (void)showIndicatorWithReason:(id)a3 force:(BOOL)a4
{
  void *v5;
  unint64_t v6;
  UIDelayedAction *v7;
  unint64_t v8;
  NSObject *v9;
  NSObject *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[UIKeyboardInputModeIndicatorController presentIndicatorWithReason:force:](self, "presentIndicatorWithReason:force:", a3, a4);
  -[UIKeyboardInputModeIndicatorController dismissAction](self, "dismissAction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = _MergedGlobals_925;
    if (!_MergedGlobals_925)
    {
      v6 = __UILogCategoryGetNode("InputModeIndicator", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v6, (unint64_t *)&_MergedGlobals_925);
    }
    if ((*(_BYTE *)v6 & 1) != 0)
    {
      v9 = *(NSObject **)(v6 + 8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v11) = 0;
        _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_ERROR, "Reset dismiss timer.", (uint8_t *)&v11, 2u);
      }
    }
    -[UIKeyboardInputModeIndicatorController dismissAction](self, "dismissAction");
    v7 = (UIDelayedAction *)objc_claimAutoreleasedReturnValue();
    -[UIDelayedAction touch](v7, "touch");
  }
  else
  {
    v8 = qword_1ECD7C8B0;
    if (!qword_1ECD7C8B0)
    {
      v8 = __UILogCategoryGetNode("InputModeIndicator", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v8, (unint64_t *)&qword_1ECD7C8B0);
    }
    if ((*(_BYTE *)v8 & 1) != 0)
    {
      v10 = *(NSObject **)(v8 + 8);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = 134217984;
        v12 = 0x3FF8000000000000;
        _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_ERROR, "Dismiss after %lf sec.", (uint8_t *)&v11, 0xCu);
      }
    }
    v7 = -[UIDelayedAction initWithTarget:action:userInfo:delay:]([UIDelayedAction alloc], "initWithTarget:action:userInfo:delay:", self, sel_dismissIndicator, 0, 1.5);
    -[UIKeyboardInputModeIndicatorController setDismissAction:](self, "setDismissAction:", v7);
  }

}

- (void)presentIndicatorWithReason:(id)a3 force:(BOOL)a4
{
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  id v13;

  v13 = a3;
  if (presentIndicatorWithReason_force__onceToken != -1)
    dispatch_once(&presentIndicatorWithReason_force__onceToken, &__block_literal_global_5);
  -[UIKeyboardInputModeIndicatorController idleAction](self, "idleAction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cancel");

  -[UIKeyboardInputModeIndicatorController setIdleAction:](self, "setIdleAction:", 0);
  if (a4)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardInputModeIndicatorController inputModeUpdateTime](self, "inputModeUpdateTime");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeIntervalSinceDate:", v9);
    v11 = v10;

    v7 = v11 >= *(double *)&presentIndicatorWithReason_force__indicatorTimeout;
  }
  if (-[UIKeyboardInputModeIndicatorController enabled](self, "enabled") && !v7)
  {
    -[UIKeyboardInputModeIndicatorController delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "keyboardInputModeIndicatorControllerPresentIndicator:reason:", self, v13);

  }
}

void __75__UIKeyboardInputModeIndicatorController_presentIndicatorWithReason_force___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  id v3;

  _UIKitUserDefaults();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKey:", CFSTR("UIKeyboardInputModeIndicatorTimeout"));
  v3 = (id)objc_claimAutoreleasedReturnValue();

  v1 = v3;
  if (v3)
  {
    objc_msgSend(v3, "doubleValue");
    v1 = v3;
    presentIndicatorWithReason_force__indicatorTimeout = v2;
  }

}

- (id)inputModeUpdateTime
{
  void *v2;
  void *v3;

  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inputModeUpdateTime");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idleAction, 0);
  objc_storeStrong((id *)&self->_dismissAction, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
