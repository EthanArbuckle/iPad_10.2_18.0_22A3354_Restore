@implementation UITextInputSessionActionAnalytics(IATextInputActionsMetadataObservingDelegate)

- (IATextInputActionsInputMode)inputMode
{
  void *v3;
  objc_class *v4;
  id v5;
  NSString *overrideInputModeString;
  NSString *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  int64_t overrideSource;
  NSObject *v18;
  void *v19;
  unint64_t v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  __int128 buf;
  Class (*v32)(uint64_t);
  void *v33;
  uint64_t *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v27 = 0;
  v28 = &v27;
  v29 = 0x2050000000;
  v3 = (void *)qword_1ECD7E2B0;
  v30 = qword_1ECD7E2B0;
  if (!qword_1ECD7E2B0)
  {
    *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
    *((_QWORD *)&buf + 1) = 3221225472;
    v32 = __getIATextInputActionsInputModeClass_block_invoke;
    v33 = &unk_1E16B14C0;
    v34 = &v27;
    __getIATextInputActionsInputModeClass_block_invoke((uint64_t)&buf);
    v3 = (void *)v28[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v27, 8);
  v5 = objc_alloc_init(v4);
  overrideInputModeString = self->_overrideInputModeString;
  if (overrideInputModeString)
  {
    v7 = overrideInputModeString;
    UITextInputSessionLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(buf) = 138477827;
      *(_QWORD *)((char *)&buf + 4) = v7;
      _os_log_debug_impl(&dword_185066000, v8, OS_LOG_TYPE_DEBUG, "[UITextInputSessionActionAnalytics] inputMode - overrode with '%{private}@'", (uint8_t *)&buf, 0xCu);
    }

LABEL_10:
    TIInputModeGetLanguage();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLanguage:", v12);

    TIInputModeGetRegion();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setRegion:", v13);

    TIInputModeGetVariant();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setKeyboardVariant:", v14);

    v27 = 0;
    v28 = &v27;
    v29 = 0x2050000000;
    v15 = (void *)qword_1ECD7E2B8;
    v30 = qword_1ECD7E2B8;
    if (!qword_1ECD7E2B8)
    {
      *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
      *((_QWORD *)&buf + 1) = 3221225472;
      v32 = __getTIInputModeFunctionsClass_block_invoke;
      v33 = &unk_1E16B14C0;
      v34 = &v27;
      __getTIInputModeFunctionsClass_block_invoke((uint64_t)&buf);
      v15 = (void *)v28[3];
    }
    v16 = objc_retainAutorelease(v15);
    _Block_object_dispose(&v27, 8);
    if ((objc_opt_respondsToSelector() & (v16 != 0)) == 1)
      objc_msgSend(v5, "setInputModeIdentifier:", objc_msgSend(v16, "performSelector:withObject:", sel_TIInputModeGetFullInputModeIdentifier_, v7, v27));
    if (self->_useOverrideSourceCounter < 1)
    {
      v20 = -[UITextInputSessionActionAnalytics _getActiveTextInputSource](self, "_getActiveTextInputSource") - 1;
      if (v20 > 7)
        overrideSource = 0;
      else
        overrideSource = qword_18667DFC8[v20];
      UITextInputSessionLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        _UITextInputActionsSourceString(overrideSource);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf) = 138477827;
        *(_QWORD *)((char *)&buf + 4) = v26;
        _os_log_debug_impl(&dword_185066000, v18, OS_LOG_TYPE_DEBUG, "[UITextInputSessionActionAnalytics] inputMode - source '%{private}@'", (uint8_t *)&buf, 0xCu);

      }
    }
    else
    {
      overrideSource = self->_overrideSource;
      UITextInputSessionLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        _UITextInputActionsSourceString(overrideSource);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf) = 138477827;
        *(_QWORD *)((char *)&buf + 4) = v19;
        _os_log_debug_impl(&dword_185066000, v18, OS_LOG_TYPE_DEBUG, "[UITextInputSessionActionAnalytics] inputMode - overrode source with '%{private}@'", (uint8_t *)&buf, 0xCu);

      }
    }

    if (overrideSource == 3)
    {
      TIInputModeGetComponentsFromIdentifier();
      v21 = objc_claimAutoreleasedReturnValue();
      -[NSObject objectForKey:](v21, "objectForKey:", CFSTR("hw"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setKeyboardLayout:", v22);

    }
    else
    {
      TIInputModeGetSWLayout();
      v21 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setKeyboardLayout:", v21);
    }
    goto LABEL_28;
  }
  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController", v27);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "currentInputMode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identifierWithLayouts");
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();

  UITextInputSessionLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138477827;
    *(_QWORD *)((char *)&buf + 4) = v7;
    _os_log_debug_impl(&dword_185066000, v11, OS_LOG_TYPE_DEBUG, "[UITextInputSessionActionAnalytics] inputMode - fetched '%{private}@'", (uint8_t *)&buf, 0xCu);
  }

  if (v7)
    goto LABEL_10;
  UITextInputSessionLog();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    LOWORD(buf) = 0;
    _os_log_error_impl(&dword_185066000, v21, OS_LOG_TYPE_ERROR, "[UITextInputSessionActionAnalytics] inputMode - nil inputMode", (uint8_t *)&buf, 2u);
  }
  v7 = 0;
LABEL_28:

  UITextInputSessionLog();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v5, "description");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138477827;
    *(_QWORD *)((char *)&buf + 4) = v25;
    _os_log_debug_impl(&dword_185066000, v23, OS_LOG_TYPE_DEBUG, "[UITextInputSessionActionAnalytics] inputMode - returning '%{private}@'", (uint8_t *)&buf, 0xCu);

  }
  return (IATextInputActionsInputMode *)v5;
}

- (NSDictionary)keyboardTrialParameters
{
  NSObject *v3;
  NSDictionary *keyboardTrialParameters;
  int v6;
  NSDictionary *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  UITextInputSessionLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    keyboardTrialParameters = self->_keyboardTrialParameters;
    v6 = 138477827;
    v7 = keyboardTrialParameters;
    _os_log_debug_impl(&dword_185066000, v3, OS_LOG_TYPE_DEBUG, "[UITextInputSessionActionAnalytics] keyboardTrialParameters - returning '%{private}@'", (uint8_t *)&v6, 0xCu);
  }

  return self->_keyboardTrialParameters;
}

@end
