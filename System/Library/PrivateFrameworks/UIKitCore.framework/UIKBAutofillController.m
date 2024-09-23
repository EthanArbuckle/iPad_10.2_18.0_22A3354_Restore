@implementation UIKBAutofillController

- (NSMutableDictionary)autofillGroup
{
  AFUITargetDetectionController_Staging *targetDetectionController;
  NSMutableDictionary *v4;

  targetDetectionController = self->_targetDetectionController;
  if (targetDetectionController)
  {
    -[AFUITargetDetectionController_Staging autoFillGroup](targetDetectionController, "autoFillGroup");
    v4 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = self->_autofillGroup;
  }
  return v4;
}

- (NSMutableDictionary)fallbackAutofillGroup
{
  AFUITargetDetectionController_Staging *targetDetectionController;
  NSMutableDictionary *v4;

  targetDetectionController = self->_targetDetectionController;
  if (targetDetectionController)
  {
    -[AFUITargetDetectionController_Staging fallbackAutoFillGroup](targetDetectionController, "fallbackAutoFillGroup");
    v4 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = self->_fallbackAutofillGroup;
  }
  return v4;
}

- (int64_t)delegateNeedsAutofillMode
{
  AFUITargetDetectionController_Staging *targetDetectionController;
  int64_t result;

  targetDetectionController = self->_targetDetectionController;
  if (!targetDetectionController)
    return self->_delegateNeedsAutofillMode;
  result = -[AFUITargetDetectionController_Staging delegateNeedsAutofillMode](targetDetectionController, "delegateNeedsAutofillMode");
  if ((unint64_t)(result - 1) >= 0xA)
    return 0;
  return result;
}

+ (unint64_t)translateToTextInputAutofillMode:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 9)
    return 0;
  else
    return qword_186681940[a3 - 1];
}

- (void)setDelegateNeedsAutofillMode:(int64_t)a3
{
  AFUITargetDetectionController_Staging *targetDetectionController;

  targetDetectionController = self->_targetDetectionController;
  if (targetDetectionController)
  {
    if ((unint64_t)(a3 - 1) >= 0xA)
      a3 = 0;
    -[AFUITargetDetectionController_Staging setDelegateNeedsAutofillMode:](targetDetectionController, "setDelegateNeedsAutofillMode:", a3);
  }
  else
  {
    self->_delegateNeedsAutofillMode = a3;
  }
}

- (int64_t)needAutofillCandidate:(id)a3 delegateAsResponder:(id)a4 keyboardState:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  unsigned int v15;
  int64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  AFUITargetDetectionController_Staging *targetDetectionController;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[UIKBAutofillController autofillContextForInputDelegate:](self, "autofillContextForInputDelegate:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAutofillContext:", v11);
  objc_msgSend(v11, "objectForKey:", CFSTR("_automaticPasswordKeyboard"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "BOOLValue");

  objc_msgSend(v11, "objectForKey:", CFSTR("_acceptsLoginCredentials"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "BOOLValue");

  if (-[UIKBAutofillController _prohibitAutofill:needASPKeyboard:](self, "_prohibitAutofill:needASPKeyboard:", v8, v13))
    goto LABEL_2;
  if (v11)
  {
    -[UIKBAutofillController autofillGroup](self, "autofillGroup");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKey:", v11, CFSTR("UIAutofillContextKey"));

    if ((v13 | v15) == 1)
    {
      -[UIKBAutofillController autofillGroup](self, "autofillGroup");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "removeObjectForKey:", CFSTR("username"));

      -[UIKBAutofillController autofillGroup](self, "autofillGroup");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "removeObjectForKey:", CFSTR("password"));

      -[UIKBAutofillController autofillGroup](self, "autofillGroup");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "removeObjectForKey:", CFSTR("one-time-code"));

      v21 = v8;
      if ((objc_msgSend(v21, "__isKindOfUIResponder") & 1) == 0)
      {
        v22 = v9;

        v21 = v22;
      }
      -[UIKBAutofillController autofillGroup](self, "autofillGroup");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setObject:forKey:", v21, CFSTR("UIAutofillContextDelegateKey"));

      if ((v13 & 1) != 0)
      {
        v16 = 2;
        goto LABEL_15;
      }
      v16 = v15;
LABEL_14:
      if (!v16)
        goto LABEL_18;
      goto LABEL_15;
    }
  }
  targetDetectionController = self->_targetDetectionController;
  if (!targetDetectionController)
  {
    v16 = -[UIKBAutofillController _needAutofillCandidate:delegateAsResponder:](self, "_needAutofillCandidate:delegateAsResponder:", v8, v9);
    goto LABEL_14;
  }
  v16 = -[AFUITargetDetectionController_Staging autoFillModeForResponder:](targetDetectionController, "autoFillModeForResponder:", v8);
  if ((unint64_t)(v16 - 1) >= 0xA)
  {
LABEL_2:
    v16 = 0;
    goto LABEL_18;
  }
LABEL_15:
  -[UIKBAutofillController autofillContextForInputDelegate:](self, "autofillContextForInputDelegate:", v8);
  v25 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setAutofillContext:", v25);
  objc_msgSend(v10, "documentIdentifier");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    -[UIKBAutofillController autofillGroup](self, "autofillGroup");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "documentIdentifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setObject:forKey:", v28, CFSTR("UIAutofillUUIDKey"));

  }
  v11 = (void *)v25;
LABEL_18:

  return v16;
}

- (id)autofillContextForInputDelegate:(id)a3
{
  id v4;
  AFUITargetDetectionController_Staging *targetDetectionController;
  void *v6;
  void *v7;

  v4 = a3;
  targetDetectionController = self->_targetDetectionController;
  if (targetDetectionController)
  {
    -[AFUITargetDetectionController_Staging autoFillContextForResponder:](targetDetectionController, "autoFillContextForResponder:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "_autofillContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v7, "copy");

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)_prohibitAutofill:(id)a3 needASPKeyboard:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  int v7;
  char IsPasswordManagerExtension;
  int v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  char v14;
  char isKindOfClass;
  char v16;
  char v17;
  int v19;

  v4 = a4;
  v5 = a3;
  +[UIKeyboard keyboardBundleIdentifier](UIKeyboard, "keyboardBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.purplebuddy")) & 1) != 0
    || (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.PassbookUIService")) & 1) != 0)
  {
    v19 = 1;
  }
  else
  {
    v19 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.Spotlight"));
  }
  v7 = objc_msgSend((id)UIApp, "_isSpringBoard");
  IsPasswordManagerExtension = _UIApplicationIsPasswordManagerExtension();
  v9 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.SafariViewService"));
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.mobilesafari")) & 1) != 0
    || (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.DataActivation")) & 1) != 0)
  {
    v10 = 1;
  }
  else
  {
    v10 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.WebSheet"));
  }
  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "preferencesActions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isPasswordAutoFillAllowed");

  if (v13)
  {
    if (v4 && ((v9 | v10) & 1) != 0)
    {
      v14 = 0;
    }
    else
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      v16 = objc_msgSend(v5, "conformsToProtocol:", &unk_1EE0CE648);
      if ((v16 & 1) == 0 && (isKindOfClass & 1) == 0)
        v16 = objc_msgSend(v5, "_conformsToProtocolBETextInput");
      if (v19 | v7)
        v17 = 1;
      else
        v17 = IsPasswordManagerExtension;
      if (((v17 | v9) & 1) != 0)
        v14 = 1;
      else
        v14 = v10 & v16;
    }
  }
  else
  {
    v14 = 1;
  }

  return v14;
}

- (void)updateAutofillContextForInputDelegate:(id)a3
{
  id v4;
  AFUITargetDetectionController_Staging *targetDetectionController;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  targetDetectionController = self->_targetDetectionController;
  v10 = v4;
  if (targetDetectionController)
  {
    -[AFUITargetDetectionController_Staging updateAutofillContextForResponder:](targetDetectionController, "updateAutofillContextForResponder:", v4);
  }
  else
  {
    -[UIKBAutofillController autofillContextForInputDelegate:](self, "autofillContextForInputDelegate:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBAutofillController autofillGroup](self, "autofillGroup");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v6)
    {
      objc_msgSend(v7, "setObject:forKey:", v6, CFSTR("UIAutofillContextKey"));

      -[UIKBAutofillController autofillGroup](self, "autofillGroup");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKey:", v10, CFSTR("UIAutofillContextDelegateKey"));
    }
    else
    {
      objc_msgSend(v7, "removeObjectForKey:", CFSTR("UIAutofillContextDelegateKey"));

      -[UIKBAutofillController autofillGroup](self, "autofillGroup");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeObjectForKey:", CFSTR("UIAutofillContextKey"));
    }

  }
}

- (UIKBAutofillController)init
{
  UIKBAutofillController *v2;
  void *v3;
  objc_class *v4;
  AFUITargetDetectionController_Staging *v5;
  AFUITargetDetectionController_Staging *targetDetectionController;
  uint64_t v7;
  NSMutableDictionary *autofillGroup;
  NSMutableDictionary *fallbackAutofillGroup;
  objc_super v11;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v11.receiver = self;
  v11.super_class = (Class)UIKBAutofillController;
  v2 = -[UIKBAutofillController init](&v11, sel_init);
  if (v2)
  {
    if ((_os_feature_enabled_impl() & 1) != 0
      || (_os_feature_enabled_impl() & 1) != 0
      || _os_feature_enabled_impl())
    {
      v13 = 0;
      v14 = &v13;
      v15 = 0x2050000000;
      v3 = (void *)qword_1ECD7F2A8;
      v16 = qword_1ECD7F2A8;
      if (!qword_1ECD7F2A8)
      {
        v12[0] = MEMORY[0x1E0C809B0];
        v12[1] = 3221225472;
        v12[2] = __getAFUITargetDetectionControllerClass_block_invoke;
        v12[3] = &unk_1E16B14C0;
        v12[4] = &v13;
        __getAFUITargetDetectionControllerClass_block_invoke((uint64_t)v12);
        v3 = (void *)v14[3];
      }
      v4 = objc_retainAutorelease(v3);
      _Block_object_dispose(&v13, 8);
      v5 = (AFUITargetDetectionController_Staging *)objc_alloc_init(v4);
      targetDetectionController = v2->_targetDetectionController;
      v2->_targetDetectionController = v5;

    }
    v2->_delegateNeedsAutofillMode = 0;
    v2->_shouldSaveAutofill = 0;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = objc_claimAutoreleasedReturnValue();
    autofillGroup = v2->_autofillGroup;
    v2->_autofillGroup = (NSMutableDictionary *)v7;

    fallbackAutofillGroup = v2->_fallbackAutofillGroup;
    v2->_fallbackAutofillGroup = 0;

  }
  return v2;
}

- (void)setFallbackAutofillGroup:(id)a3
{
  id v5;
  AFUITargetDetectionController_Staging *targetDetectionController;
  id v7;

  v5 = a3;
  targetDetectionController = self->_targetDetectionController;
  v7 = v5;
  if (targetDetectionController)
    -[AFUITargetDetectionController_Staging setFallbackAutoFillGroup:](targetDetectionController, "setFallbackAutoFillGroup:");
  else
    objc_storeStrong((id *)&self->_fallbackAutofillGroup, a3);

}

+ (id)preferredInsertionOrder
{
  _QWORD v3[32];

  v3[31] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("username");
  v3[1] = CFSTR("password");
  v3[2] = CFSTR("new-password");
  v3[3] = CFSTR("email");
  v3[4] = CFSTR("name");
  v3[5] = CFSTR("given-name");
  v3[6] = CFSTR("additional-name");
  v3[7] = CFSTR("family-name");
  v3[8] = CFSTR("street-address");
  v3[9] = CFSTR("address-line1");
  v3[10] = CFSTR("address-line2");
  v3[11] = CFSTR("address-level2");
  v3[12] = CFSTR("address-level1");
  v3[13] = CFSTR("address-level1+2");
  v3[14] = CFSTR("address-level3");
  v3[15] = CFSTR("country-name");
  v3[16] = CFSTR("postal-code");
  v3[17] = CFSTR("tel");
  v3[18] = CFSTR("bday");
  v3[19] = CFSTR("bday-day");
  v3[20] = CFSTR("bday-month");
  v3[21] = CFSTR("bday-year");
  v3[22] = CFSTR("cc-name");
  v3[23] = CFSTR("cc-given-name");
  v3[24] = CFSTR("cc-additional-name");
  v3[25] = CFSTR("cc-family-name");
  v3[26] = CFSTR("cc-number");
  v3[27] = CFSTR("cc-csc");
  v3[28] = CFSTR("cc-exp");
  v3[29] = CFSTR("cc-exp-month");
  v3[30] = CFSTR("cc-exp-year");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 31);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (int64_t)translateToUIAutofillMode:(unint64_t)a3
{
  if (a3 - 1 > 7)
    return 0;
  else
    return qword_186681990[a3 - 1];
}

- (int64_t)doTraits:(id)a3 matchTextContentType:(id)a4
{
  id v5;
  __CFString *v6;
  __CFString *v7;
  void *v10;
  char v11;
  __CFString *v12;
  void *v13;
  char v14;
  char v15;
  void *v16;
  char v17;
  unsigned int v18;
  int64_t v19;
  void *v20;
  char v21;
  unsigned int v23;

  v5 = a3;
  v6 = (__CFString *)a4;
  v7 = v6;
  if (!v5)
    goto LABEL_38;
  if (CFSTR("username") == v6)
  {
    objc_msgSend(v5, "textContentType");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqualToString:", v7);

    if ((v14 & 1) != 0)
      goto LABEL_36;
    if (objc_msgSend(v5, "keyboardType")
      && objc_msgSend(v5, "keyboardType") != 7
      && objc_msgSend(v5, "keyboardType") != 1)
    {
      goto LABEL_38;
    }
    objc_msgSend(v5, "textContentType");
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v12 == CFSTR("password") || objc_msgSend(v5, "autocorrectionType") != 1)
      goto LABEL_37;
    v15 = objc_msgSend(v5, "isSecureTextEntry");

    if ((v15 & 1) != 0)
      goto LABEL_38;
LABEL_42:
    v19 = 1;
    goto LABEL_39;
  }
  if (CFSTR("password") == v6)
    goto LABEL_28;
  if (CFSTR("one-time-code") == v6)
  {
    objc_msgSend(v5, "textContentType");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "isEqualToString:", v7);

    if ((v21 & 1) != 0)
      goto LABEL_36;
    if (objc_msgSend(v5, "keyboardType") && (objc_msgSend(v5, "isSecureTextEntry") & 1) == 0)
    {
      v23 = objc_msgSend(v5, "keyboardType");
      v19 = 1;
      if (v23 <= 0xB && ((1 << v23) & 0x930) != 0 || v23 == 127)
        goto LABEL_39;
      if (objc_msgSend(v5, "keyboardType") != 1)
        goto LABEL_38;
    }
    goto LABEL_42;
  }
  if (CFSTR("new-password") != v6)
  {
    if (CFSTR("email") != v6 && CFSTR("tel") != v6 && CFSTR("street-address") != v6)
      goto LABEL_38;
    objc_msgSend(v5, "textContentType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", v7);

    if ((v11 & 1) == 0)
    {
      if ((objc_msgSend(v5, "isSecureTextEntry") & 1) == 0)
      {
        objc_msgSend(v5, "textContentType");
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
LABEL_37:

          goto LABEL_38;
        }
        if (objc_msgSend(v5, "autocorrectionType") != 1 || (_UIIsPrivateMainBundle() & 1) != 0)
        {
          v12 = 0;
          goto LABEL_37;
        }
        goto LABEL_31;
      }
LABEL_38:
      v19 = 0;
      goto LABEL_39;
    }
LABEL_36:
    v19 = 2;
    goto LABEL_39;
  }
LABEL_28:
  objc_msgSend(v5, "textContentType");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isEqualToString:", v7);

  if ((v17 & 1) != 0)
    goto LABEL_36;
  if (!objc_msgSend(v5, "isSecureTextEntry")
    || (objc_msgSend(v5, "displaySecureTextUsingPlainText") & 1) != 0)
  {
    goto LABEL_38;
  }
LABEL_31:
  v18 = objc_msgSend(v5, "keyboardType");
  v19 = 1;
  if (v18 <= 0xB && ((1 << v18) & 0x930) != 0 || v18 == 127)
    goto LABEL_38;
LABEL_39:

  return v19;
}

- (id)textContentTypeForInputDelegate:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__141;
  v16 = __Block_byref_object_dispose__141;
  v17 = 0;
  -[UIKBAutofillController autofillGroup](self, "autofillGroup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __58__UIKBAutofillController_textContentTypeForInputDelegate___block_invoke;
  v9[3] = &unk_1E16BB100;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v9);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __58__UIKBAutofillController_textContentTypeForInputDelegate___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v8;
  id v9;

  v8 = a2;
  if (*(_QWORD *)(a1 + 32) == a3)
  {
    v9 = v8;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    v8 = v9;
    *a4 = 1;
  }

}

- (id)signupKeywordList
{
  if (qword_1ECD7F230 != -1)
    dispatch_once(&qword_1ECD7F230, &__block_literal_global_388);
  return (id)qword_1ECD7F228;
}

void __43__UIKBAutofillController_signupKeywordList__block_invoke()
{
  void *v0;

  v0 = (void *)qword_1ECD7F228;
  qword_1ECD7F228 = (uint64_t)&unk_1E1A94430;

}

- (id)loginKeywordList
{
  if (qword_1ECD7F240 != -1)
    dispatch_once(&qword_1ECD7F240, &__block_literal_global_207_1);
  return (id)qword_1ECD7F238;
}

void __42__UIKBAutofillController_loginKeywordList__block_invoke()
{
  void *v0;

  v0 = (void *)qword_1ECD7F238;
  qword_1ECD7F238 = (uint64_t)&unk_1E1A94448;

}

- (id)accessibilitySignupKeywordList
{
  if (qword_1ECD7F250 != -1)
    dispatch_once(&qword_1ECD7F250, &__block_literal_global_218_1);
  return (id)qword_1ECD7F248;
}

void __56__UIKBAutofillController_accessibilitySignupKeywordList__block_invoke()
{
  void *v0;

  v0 = (void *)qword_1ECD7F248;
  qword_1ECD7F248 = (uint64_t)&unk_1E1A94460;

}

- (id)accessibilityLoginKeywordList
{
  if (qword_1ECD7F260 != -1)
    dispatch_once(&qword_1ECD7F260, &__block_literal_global_221_0);
  return (id)qword_1ECD7F258;
}

void __55__UIKBAutofillController_accessibilityLoginKeywordList__block_invoke()
{
  void *v0;

  v0 = (void *)qword_1ECD7F258;
  qword_1ECD7F258 = (uint64_t)&unk_1E1A94478;

}

- (id)contactAutoFillKeywordsForKey:(id)a3 value:(id)a4 localizedKeywords:(id)a5
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

  v7 = a4;
  v8 = a3;
  objc_msgSend(a5, "componentsSeparatedByString:", CFSTR("|"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  _UIKitBundle();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_preferredEnglishLocalizationBundle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "localizedStringForKey:value:table:", v8, v7, CFSTR("Localizable"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "componentsSeparatedByString:", CFSTR("|"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", v9);
  objc_msgSend(v14, "addObjectsFromArray:", v13);
  v15 = (void *)objc_msgSend(v14, "copy");

  return v15;
}

- (id)searchKeywordSet
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__UIKBAutofillController_searchKeywordSet__block_invoke;
  block[3] = &unk_1E16B1B28;
  block[4] = self;
  if (qword_1ECD7F270 != -1)
    dispatch_once(&qword_1ECD7F270, block);
  return (id)qword_1ECD7F268;
}

void __42__UIKBAutofillController_searchKeywordSet__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v1 = *(void **)(a1 + 32);
  _UINSLocalizedStringWithDefaultValue(CFSTR("SEARCH_FIELD_SEARCH_TERMS"), CFSTR("search|query"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "contactAutoFillKeywordsForKey:value:localizedKeywords:", CFSTR("SEARCH_FIELD_SEARCH_TERMS"), CFSTR("search|query"), v4);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ECD7F268;
  qword_1ECD7F268 = v2;

}

- (id)addressKeywordSet
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__UIKBAutofillController_addressKeywordSet__block_invoke;
  block[3] = &unk_1E16B1B28;
  block[4] = self;
  if (qword_1ECD7F280 != -1)
    dispatch_once(&qword_1ECD7F280, block);
  return (id)qword_1ECD7F278;
}

void __43__UIKBAutofillController_addressKeywordSet__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v1 = *(void **)(a1 + 32);
  _UINSLocalizedStringWithDefaultValue(CFSTR("Address_FIELD_SEARCH_TERMS"), CFSTR("address|where|destination|location"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "contactAutoFillKeywordsForKey:value:localizedKeywords:", CFSTR("Address_FIELD_SEARCH_TERMS"), CFSTR("address|where|destination|location"), v4);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ECD7F278;
  qword_1ECD7F278 = v2;

}

- (id)phoneKeywordSet
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__UIKBAutofillController_phoneKeywordSet__block_invoke;
  block[3] = &unk_1E16B1B28;
  block[4] = self;
  if (qword_1ECD7F290 != -1)
    dispatch_once(&qword_1ECD7F290, block);
  return (id)qword_1ECD7F288;
}

void __41__UIKBAutofillController_phoneKeywordSet__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v1 = *(void **)(a1 + 32);
  _UINSLocalizedStringWithDefaultValue(CFSTR("PHONE_FIELD_SEARCH_TERMS"), CFSTR("phone|mobile|telephone"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "contactAutoFillKeywordsForKey:value:localizedKeywords:", CFSTR("PHONE_FIELD_SEARCH_TERMS"), CFSTR("phone|mobile|telephone"), v4);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ECD7F288;
  qword_1ECD7F288 = v2;

}

- (id)emailKeywordSet
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__UIKBAutofillController_emailKeywordSet__block_invoke;
  block[3] = &unk_1E16B1B28;
  block[4] = self;
  if (qword_1ECD7F2A0 != -1)
    dispatch_once(&qword_1ECD7F2A0, block);
  return (id)qword_1ECD7F298;
}

void __41__UIKBAutofillController_emailKeywordSet__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v1 = *(void **)(a1 + 32);
  _UINSLocalizedStringWithDefaultValue(CFSTR("EMAIL_FIELD_SEARCH_TERMS"), CFSTR("email|e-mail"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "contactAutoFillKeywordsForKey:value:localizedKeywords:", CFSTR("EMAIL_FIELD_SEARCH_TERMS"), CFSTR("email|e-mail"), v4);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ECD7F298;
  qword_1ECD7F298 = v2;

}

- (id)processLocalizedString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    v18 = 0;
    objc_msgSend(v5, "_searchForLocalizedString:foundKey:foundTable:", v3, &v18, &v17);
    v6 = v18;
    v7 = v17;

    if (!v6)
      goto LABEL_5;
    if (!v7)
      goto LABEL_5;
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_preferredEnglishLocalizationBundle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "localizedStringForKey:value:table:", v6, v3, v7);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    if (!v10)
LABEL_5:
      v10 = v3;
    v11 = objc_msgSend(v10, "length");
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __49__UIKBAutofillController_processLocalizedString___block_invoke;
    v15[3] = &unk_1E16D5580;
    v12 = v4;
    v16 = v12;
    objc_msgSend(v10, "enumerateSubstringsInRange:options:usingBlock:", 0, v11, 3, v15);
    objc_msgSend(v10, "lowercaseString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v13);

  }
  return v4;
}

void __49__UIKBAutofillController_processLocalizedString___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "lowercaseString");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (id)textSignalsForResponder:(id)a3
{
  id v4;
  void *v5;
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
  void *v16;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "_viewControllerForAncestor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v6, "performSelector:", sel_textField);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v7, "placeholder");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIKBAutofillController processLocalizedString:](self, "processLocalizedString:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObjectsFromArray:", v9);

      }
    }

  }
  objc_msgSend(v4, "accessibilityHint");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBAutofillController processLocalizedString:](self, "processLocalizedString:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v11);

  objc_msgSend(v4, "accessibilityLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBAutofillController processLocalizedString:](self, "processLocalizedString:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v13);

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "performSelector:", sel_placeholder);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[UIKBAutofillController processLocalizedString:](self, "processLocalizedString:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObjectsFromArray:", v15);

    }
  }
  v16 = (void *)objc_msgSend(v5, "copy");

  return v16;
}

- (int64_t)containsIndicationInText:(id)a3 withAccessibilityHints:(BOOL)a4
{
  id v6;
  void *v7;
  int64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (v6 && objc_msgSend(v6, "length"))
  {
    if (a4)
      -[UIKBAutofillController accessibilityLoginKeywordList](self, "accessibilityLoginKeywordList");
    else
      -[UIKBAutofillController loginKeywordList](self, "loginKeywordList");
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v25;
      v8 = 1;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v25 != v12)
            objc_enumerationMutation(v9);
          if ((objc_msgSend(v7, "localizedCaseInsensitiveContainsString:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i)) & 1) != 0)
          {
            v14 = v9;
            goto LABEL_29;
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
        if (v11)
          continue;
        break;
      }
    }

    if (a4)
      -[UIKBAutofillController accessibilitySignupKeywordList](self, "accessibilitySignupKeywordList");
    else
      -[UIKBAutofillController signupKeywordList](self, "signupKeywordList");
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v21;
      v8 = 2;
LABEL_21:
      v18 = 0;
      while (1)
      {
        if (*(_QWORD *)v21 != v17)
          objc_enumerationMutation(v14);
        if ((objc_msgSend(v7, "localizedCaseInsensitiveContainsString:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v18), (_QWORD)v20) & 1) != 0)break;
        if (v16 == ++v18)
        {
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
          if (v16)
            goto LABEL_21;
          goto LABEL_27;
        }
      }
    }
    else
    {
LABEL_27:
      v8 = 0;
    }

LABEL_29:
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (int64_t)signUpSignalFromButton:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;
  id v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  int64_t v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "titleForState:", objc_msgSend(v4, "state"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(v4, "titleLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "text");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v7 = -[UIKBAutofillController containsIndicationInText:withAccessibilityHints:](self, "containsIndicationInText:withAccessibilityHints:", v5, 0);
  if (!v7)
  {
    objc_msgSend(v4, "allTargets");
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v21)
    {
      v9 = *(_QWORD *)v28;
      v20 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v28 != v9)
            objc_enumerationMutation(v8);
          objc_msgSend(v4, "actionsForTarget:forControlEvent:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i), 64);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = 0u;
          v24 = 0u;
          v25 = 0u;
          v26 = 0u;
          v12 = v11;
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
          if (v13)
          {
            v14 = v13;
            v15 = *(_QWORD *)v24;
            while (2)
            {
              for (j = 0; j != v14; ++j)
              {
                if (*(_QWORD *)v24 != v15)
                  objc_enumerationMutation(v12);
                v17 = -[UIKBAutofillController containsIndicationInText:withAccessibilityHints:](self, "containsIndicationInText:withAccessibilityHints:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * j), 0);
                if (v17)
                {
                  v7 = v17;

                  goto LABEL_23;
                }
              }
              v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
              if (v14)
                continue;
              break;
            }
          }

          v9 = v20;
        }
        v21 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v21);
    }

    if (objc_msgSend(v5, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 0;
      objc_msgSend(v18, "_searchForLocalizedString:foundKey:foundTable:", v5, &v22, 0);
      v8 = v22;

      if (v8)
        v7 = -[UIKBAutofillController containsIndicationInText:withAccessibilityHints:](self, "containsIndicationInText:withAccessibilityHints:", v8, 0);
      else
        v7 = 0;
LABEL_23:

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (int64_t)signUpSignalFromViewControllerHierarchy:(id)a3
{
  id v4;
  objc_class *v5;
  void *v6;
  int64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _DWORD *v13;
  objc_class *v14;
  void *v15;
  uint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[UIKBAutofillController containsIndicationInText:withAccessibilityHints:](self, "containsIndicationInText:withAccessibilityHints:", v6, 0);

  if (!v7)
  {
    objc_msgSend(v4, "childViewControllers");
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v19;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_DWORD **)(*((_QWORD *)&v18 + 1) + 8 * v12);
          if ((objc_msgSend(v13, "isBeingPresented", (_QWORD)v18) & 1) != 0
            || (objc_msgSend(v13, "isMovingToParentViewController") & 1) != 0
            || v13 && ((v13[92] >> 1) & 3u) - 1 <= 1)
          {
            v14 = (objc_class *)objc_opt_class();
            NSStringFromClass(v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v7 = -[UIKBAutofillController containsIndicationInText:withAccessibilityHints:](self, "containsIndicationInText:withAccessibilityHints:", v15, 0);

            if (v7)
              goto LABEL_18;
          }
          else
          {
            v7 = -[UIKBAutofillController signUpSignalFromViewControllerHierarchy:](self, "signUpSignalFromViewControllerHierarchy:", v13);
          }
          ++v12;
        }
        while (v10 != v12);
        v16 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        v10 = v16;
      }
      while (v16);
    }
    else
    {
      v7 = 0;
    }
LABEL_18:

  }
  return v7;
}

- (int64_t)signUpSignalFromNavBarItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char isKindOfClass;
  void *v12;
  void *v13;
  int64_t v14;
  int64_t v15;
  void *v16;
  id v17;
  id v19;

  v4 = a3;
  objc_msgSend(v4, "navigationBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rightBarButtonItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "customView");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8)
    goto LABEL_19;
  v9 = (void *)v8;
  objc_msgSend(v7, "customView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0
    || (objc_msgSend(v7, "customView"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v12, "titleForState:", 0),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v12,
        !v13))
  {
LABEL_19:
    objc_msgSend(v7, "title");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
      goto LABEL_13;
    objc_msgSend(v7, "title");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
      goto LABEL_13;
  }
  if ((objc_msgSend(v4, "isNavigationBarHidden") & 1) == 0)
  {
    if (objc_msgSend(v13, "length"))
    {
      v14 = -[UIKBAutofillController containsIndicationInText:withAccessibilityHints:](self, "containsIndicationInText:withAccessibilityHints:", v13, 0);
      if (v14)
      {
        v15 = v14;
        goto LABEL_16;
      }
    }
  }
  if (!objc_msgSend(v13, "length"))
  {
LABEL_13:
    v15 = 0;
    goto LABEL_16;
  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  objc_msgSend(v16, "_searchForLocalizedString:foundKey:foundTable:", v13, &v19, 0);
  v17 = v19;

  if (v17)
    v15 = -[UIKBAutofillController containsIndicationInText:withAccessibilityHints:](self, "containsIndicationInText:withAccessibilityHints:", v17, 0);
  else
    v15 = 0;

LABEL_16:
  return v15;
}

- (int64_t)contactAutofillModeWithAutofillGroup:(id)a3 responders:(id)a4
{
  id v5;
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  _BOOL4 v26;
  void *v27;
  int v28;
  int v29;
  void *v30;
  int v31;
  UIKBAutofillController *v33;
  void *v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKey:", CFSTR("email"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = 5;
  }
  else
  {
    objc_msgSend(v5, "objectForKey:", CFSTR("tel"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v7 = 6;
    }
    else
    {
      objc_msgSend(v5, "objectForKey:", CFSTR("street-address"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        v7 = 7;
      }
      else
      {
        objc_msgSend(v5, "objectForKey:", CFSTR("UIAutofillContactHeuristicsKey"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          objc_msgSend(v5, "objectForKey:", CFSTR("UIAutofillContactHeuristicsKey"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          +[UITextInputTraits traitsByAdoptingTraits:lightweight:](UITextInputTraits, "traitsByAdoptingTraits:lightweight:", v11, 1);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIKBAutofillController textSignalsForResponder:](self, "textSignalsForResponder:", v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIKBAutofillController emailKeywordSet](self, "emailKeywordSet");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = _UIKBTextSignalsFoundInKeywordsList(v13, v14);

          if (v15)
          {
            objc_msgSend(v12, "keyboardType");
            v7 = 5;
          }
          else
          {
            v34 = v13;
            v33 = self;
            v38 = 0u;
            v39 = 0u;
            v36 = 0u;
            v37 = 0u;
            v16 = v13;
            v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
            v35 = v11;
            if (v17)
            {
              v18 = v17;
              v19 = 0;
              v20 = *(_QWORD *)v37;
              do
              {
                v21 = 0;
                do
                {
                  if (*(_QWORD *)v37 != v20)
                    objc_enumerationMutation(v16);
                  v22 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v21);
                  if (qword_1ECD7F2C0 != -1)
                    dispatch_once(&qword_1ECD7F2C0, &__block_literal_global_780_0);
                  v23 = (id)qword_1ECD7F2B8;
                  v24 = objc_msgSend(v23, "numberOfMatchesInString:options:range:", v22, 0, 0, objc_msgSend(v22, "length"));

                  v19 |= v24 != 0;
                  ++v21;
                }
                while (v18 != v21);
                v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
              }
              while (v18);
            }
            else
            {
              v19 = 0;
            }

            v7 = 5;
            v11 = v35;
            if (objc_msgSend(v12, "keyboardType") == 7)
            {
              v13 = v34;
            }
            else
            {
              v13 = v34;
              if ((v19 & 1) == 0)
              {
                -[UIKBAutofillController searchKeywordSet](v33, "searchKeywordSet");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                v26 = (_UIKBTextSignalsFoundInKeywordsList(v16, v25) & 1) == 0
                   && objc_msgSend(v12, "returnKeyType") != 6;

                -[UIKBAutofillController addressKeywordSet](v33, "addressKeywordSet");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                v28 = _UIKBTextSignalsFoundInKeywordsList(v16, v27);

                if (qword_1ECD7F2C8 != -1)
                  dispatch_once(&qword_1ECD7F2C8, &__block_literal_global_784);
                if (_MergedGlobals_1157)
                  v29 = v26;
                else
                  v29 = 1;
                if (v29 == 1 && (!v28 || objc_msgSend(v12, "keyboardType") == 10))
                {
                  -[UIKBAutofillController phoneKeywordSet](v33, "phoneKeywordSet", v33);
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  v31 = _UIKBTextSignalsFoundInKeywordsList(v16, v30);

                  if (v31 && objc_msgSend(v12, "keyboardType") != 3)
                    v7 = 6;
                  else
                    v7 = 0;
                }
                else
                {
                  v7 = 7;
                }
              }
            }
          }

        }
        else
        {
          v7 = 0;
        }
      }
    }
  }

  return v7;
}

- (BOOL)signupHintForUsername:(id)a3 password:(id)a4 responder:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  int64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char isKindOfClass;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  int64_t v28;
  char v29;
  BOOL v31;
  char v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  id v40;
  id v41;
  uint64_t v42;
  char v43;
  unint64_t v44;
  _QWORD v45[6];
  _QWORD v46[4];
  id v47;
  id v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t v52;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v8;
  else
    v11 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v9;
  else
    v12 = 0;
  objc_msgSend(v11, "accessibilityHint");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[UIKBAutofillController containsIndicationInText:withAccessibilityHints:](self, "containsIndicationInText:withAccessibilityHints:", v13, 1);

  if (v14)
    goto LABEL_13;
  objc_msgSend(v11, "accessibilityLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[UIKBAutofillController containsIndicationInText:withAccessibilityHints:](self, "containsIndicationInText:withAccessibilityHints:", v15, 1);

  if (v14)
    goto LABEL_13;
  objc_msgSend(v11, "accessibilityIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[UIKBAutofillController containsIndicationInText:withAccessibilityHints:](self, "containsIndicationInText:withAccessibilityHints:", v16, 1);

  if (v14)
    goto LABEL_13;
  objc_msgSend(v12, "accessibilityHint");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[UIKBAutofillController containsIndicationInText:withAccessibilityHints:](self, "containsIndicationInText:withAccessibilityHints:", v17, 1);

  if (v14)
    goto LABEL_13;
  objc_msgSend(v12, "accessibilityLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[UIKBAutofillController containsIndicationInText:withAccessibilityHints:](self, "containsIndicationInText:withAccessibilityHints:", v18, 1);

  if (v14
    || (objc_msgSend(v12, "accessibilityIdentifier"),
        v19 = (void *)objc_claimAutoreleasedReturnValue(),
        v14 = -[UIKBAutofillController containsIndicationInText:withAccessibilityHints:](self, "containsIndicationInText:withAccessibilityHints:", v19, 1), v19, v14))
  {
LABEL_13:
    v49 = 0;
    v50 = &v49;
    v51 = 0x2020000000;
    v52 = 0;
  }
  else
  {
    if (objc_msgSend(v8, "isFirstResponder")
      && (objc_opt_class(), isKindOfClass = objc_opt_isKindOfClass(), v22 = v8, (isKindOfClass & 1) != 0)
      || objc_msgSend(v9, "isFirstResponder")
      && (objc_opt_class(), v23 = objc_opt_isKindOfClass(), v22 = v9, (v23 & 1) != 0))
    {
      objc_msgSend(v22, "_viewControllerForAncestor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[UIKBAutofillController signUpSignalFromViewControllerHierarchy:](self, "signUpSignalFromViewControllerHierarchy:", v24);
    }
    else
    {
      v14 = 0;
      v24 = 0;
    }
    objc_msgSend(v24, "parentViewController");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v26 = objc_opt_isKindOfClass();

    if ((v26 & 1) != 0)
    {
      objc_msgSend(v24, "parentViewController");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = -[UIKBAutofillController signUpSignalFromNavBarItem:](self, "signUpSignalFromNavBarItem:", v27);

    }
    else
    {
      v28 = 0;
    }
    objc_opt_class();
    v29 = objc_opt_isKindOfClass();
    v31 = v28 == v14 && v28 != 0;
    v32 = v29 | v31;
    if (!v14)
    {
      +[UIWindow _applicationKeyWindow](UIWindow, "_applicationKeyWindow");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "rootViewController");
      v43 = v32;
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "presentedViewController");
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      v32 = v43;
      v14 = -[UIKBAutofillController signUpSignalFromViewControllerHierarchy:](self, "signUpSignalFromViewControllerHierarchy:", v35);

    }
    v49 = 0;
    v50 = &v49;
    v51 = 0x2020000000;
    v52 = 0;
    if ((v32 & 1) == 0 || !v14)
    {
      -[UIKBAutofillController autofillGroup](self, "autofillGroup");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "allValues");
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 3);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = MEMORY[0x1E0C809B0];
      v46[0] = MEMORY[0x1E0C809B0];
      v46[1] = 3221225472;
      v46[2] = __67__UIKBAutofillController_signupHintForUsername_password_responder___block_invoke;
      v46[3] = &unk_1E16D9040;
      v40 = v37;
      v47 = v40;
      v41 = v38;
      v48 = v41;
      objc_msgSend(v10, "enumerateObjectsWithOptions:usingBlock:", 2, v46);
      v44 = objc_msgSend(v41, "count");
      v45[0] = v39;
      v45[1] = 3221225472;
      v45[2] = __67__UIKBAutofillController_signupHintForUsername_password_responder___block_invoke_2;
      v45[3] = &unk_1E16D9068;
      v45[4] = self;
      v45[5] = &v49;
      objc_msgSend(v41, "enumerateObjectsUsingBlock:", v45);

      v42 = v50[3];
      if (v14)
      {
        if (v42 && v14 != v42 && v44 < 3)
          v14 = v50[3];
      }
      else
      {
        v14 = v50[3];
      }
    }
  }
  _Block_object_dispose(&v49, 8);

  return v14 == 2;
}

void __67__UIKBAutofillController_signupHintForUsername_password_responder___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;

  v6 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:"))
    *a4 = 1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 40), "insertObject:atIndex:", v6, 0);

}

uint64_t __67__UIKBAutofillController_signupHintForUsername_password_responder___block_invoke_2(uint64_t result, uint64_t a2, unint64_t a3, _BYTE *a4)
{
  uint64_t v4;

  if (a3 > 2 || (v4 = result, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24)))
  {
    *a4 = 1;
  }
  else
  {
    result = objc_msgSend(*(id *)(result + 32), "signUpSignalFromButton:", a2);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v4 + 40) + 8) + 24) = result;
  }
  return result;
}

- (int64_t)_needAutofillCandidate:(id)a3 delegateAsResponder:(id)a4
{
  id v5;
  int v6;
  int v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  void *v36;
  void *v37;
  void *v38;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  uint64_t v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  int64_t v55;
  uint64_t v56;
  unint64_t v57;
  uint64_t v58;
  void *v59;
  int64_t v60;
  int64_t v61;
  void *v62;
  int v63;
  BOOL v64;
  id v65;
  int v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  int64_t v79;
  void *v80;
  void *v81;
  void *v82;
  id v83;
  void *v84;
  uint64_t v85;
  unsigned int v86;
  void *v87;
  void *v88;
  void *v89;
  uint64_t v90;
  _BOOL4 v91;
  BOOL v92;
  char v93;
  _BOOL4 v94;
  int v95;
  char v96;
  void *v99;
  int v100;
  int64_t v101;
  void *v102;
  void *v103;
  _BOOL4 v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  int v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  int v119;
  int64_t v120;
  id v121;
  void *v122;
  void *v123;
  int64_t v124;
  void *v125;
  int64_t v126;
  void *v127;
  int64_t v128;
  void *v129;
  void *v130;
  void *v131;
  BOOL v132;
  void *v133;
  id v134;
  int64_t v135;
  void *v136;
  void *v137;
  id v138;
  id v139;
  void *v141;
  id v142;
  _QWORD v143[4];
  id v144;
  id v145;
  uint64_t *v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  uint64_t v151;
  uint64_t *v152;
  uint64_t v153;
  uint64_t v154;
  _BYTE v155[128];
  uint64_t v156;
  CGRect v157;
  CGRect v158;
  CGRect v159;
  CGRect v160;
  CGRect v161;

  v156 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v139 = a4;
  if (objc_msgSend(v5, "__isKindOfUIResponder"))
    v6 = objc_msgSend(v5, "conformsToProtocol:", &unk_1EDE222E8);
  else
    v6 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = objc_msgSend(v5, "conformsToProtocol:", &unk_1EDDCFD70);
  else
    v7 = 0;
  if (v6)
    v8 = v5;
  else
    v8 = 0;
  v136 = v5;
  if ((v6 | v7) == 1)
  {
    -[UIKBAutofillController clearAutofillGroup](self, "clearAutofillGroup");
    v138 = v5;
    v134 = v8;
    v151 = 0;
    v152 = &v151;
    v153 = 0x2020000000;
    v154 = 0x7FFFFFFFFFFFFFFFLL;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v134, "_gatherKeyResponders:indexOfSelf:visibilityTest:passingTest:subviewsTest:", v9, v152 + 3, &__block_literal_global_524_0, &__block_literal_global_525_0, &__block_literal_global_659);
    v137 = v9;
    if ((unint64_t)objc_msgSend(v9, "count") >= 3)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v141 = (void *)objc_claimAutoreleasedReturnValue();
      v149 = 0u;
      v150 = 0u;
      v147 = 0u;
      v148 = 0u;
      v10 = v9;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v147, v155, 16);
      if (v11)
      {
        v12 = *(_QWORD *)v148;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v148 != v12)
              objc_enumerationMutation(v10);
            v14 = *(void **)(*((_QWORD *)&v147 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v15 = v14;
              objc_msgSend(v15, "frame");
              if (!CGRectIsEmpty(v157))
              {
                objc_msgSend(v15, "bounds");
                objc_msgSend(v15, "convertRect:toView:", 0);
                v17 = v16;
                v19 = v18;
                v21 = v20;
                v23 = v22;
                objc_msgSend(v15, "window");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "window");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v25, "windowScene");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "coordinateSpace");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v24, "convertRect:toCoordinateSpace:", v27, v17, v19, v21, v23);
                v29 = v28;
                v31 = v30;
                v33 = v32;
                v35 = v34;

                objc_msgSend(v15, "window");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v36, "windowScene");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v37, "coordinateSpace");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v38, "bounds");
                v161.origin.x = v39;
                v161.origin.y = v40;
                v161.size.width = v41;
                v161.size.height = v42;
                v158.origin.x = v29;
                v158.origin.y = v31;
                v158.size.width = v33;
                v158.size.height = v35;
                v159 = CGRectIntersection(v158, v161);
                x = v159.origin.x;
                y = v159.origin.y;
                width = v159.size.width;
                height = v159.size.height;

                v160.origin.x = x;
                v160.origin.y = y;
                v160.size.width = width;
                v160.size.height = height;
                if (CGRectIsEmpty(v160))
                  objc_msgSend(v141, "addObject:", v15);
              }

            }
          }
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v147, v155, 16);
        }
        while (v11);
      }

      v47 = objc_msgSend(v10, "count");
      if ((unint64_t)(v47 - objc_msgSend(v141, "count")) >= 4)
        objc_msgSend(v10, "removeObjectsInArray:", v141);

      v9 = v137;
    }
    v152[3] = 0x7FFFFFFFFFFFFFFFLL;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v9, "count"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v143[0] = MEMORY[0x1E0C809B0];
    v143[1] = 3221225472;
    v143[2] = __69__UIKBAutofillController__needAutofillCandidate_delegateAsResponder___block_invoke_4;
    v143[3] = &unk_1E16D9110;
    v121 = v134;
    v144 = v121;
    v146 = &v151;
    v142 = v48;
    v145 = v142;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v143);
    -[UIKBAutofillController autofillGroup](self, "autofillGroup");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setObject:forKey:", v142, CFSTR("UIAutofillPossibleRespondersKey"));

    if (v152[3] == 0x7FFFFFFFFFFFFFFFLL)
    {
      v50 = 0;
      v133 = 0;
      v51 = 0;
      v52 = 0;
      v53 = v137;
    }
    else
    {
      v53 = v137;
      if (objc_msgSend(v142, "count"))
      {
        v56 = objc_msgSend(v142, "count");
        v57 = v152[3];
        if (v57)
        {
          objc_msgSend(v142, "objectAtIndex:", v57 - 1);
          v50 = objc_claimAutoreleasedReturnValue();
          v58 = 0;
          v57 = v152[3];
          if (v57 >= 2 && v56 >= 3)
          {
            objc_msgSend(v142, "objectAtIndex:", v57 - 2);
            v58 = objc_claimAutoreleasedReturnValue();
            v57 = v152[3];
          }
        }
        else
        {
          v50 = 0;
          v58 = 0;
        }
        v51 = 0;
        if (v56 >= 1 && v57 < v56 - 1)
        {
          objc_msgSend(v142, "objectAtIndex:", v57 + 1);
          v51 = objc_claimAutoreleasedReturnValue();
          v57 = v152[3];
        }
        v52 = 0;
        v133 = (void *)v58;
        if (v56 >= 2 && v57 < v56 - 2)
        {
          objc_msgSend(v142, "objectAtIndex:", v57 + 2);
          v52 = objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        v50 = 0;
        v133 = 0;
        v51 = 0;
        v52 = 0;
      }
    }
    +[UITextInputTraits traitsByAdoptingTraits:lightweight:](UITextInputTraits, "traitsByAdoptingTraits:lightweight:", v138, 1);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    if (v50)
    {
      +[UITextInputTraits traitsByAdoptingTraits:lightweight:](UITextInputTraits, "traitsByAdoptingTraits:lightweight:", v50, 1);
      v127 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v127 = 0;
    }
    if (v133)
    {
      +[UITextInputTraits traitsByAdoptingTraits:lightweight:](UITextInputTraits, "traitsByAdoptingTraits:lightweight:", v133, 1);
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      if (v51)
        goto LABEL_51;
    }
    else
    {
      v125 = 0;
      if (v51)
      {
LABEL_51:
        +[UITextInputTraits traitsByAdoptingTraits:lightweight:](UITextInputTraits, "traitsByAdoptingTraits:lightweight:", v51, 1);
        v129 = (void *)objc_claimAutoreleasedReturnValue();
        if (v52)
        {
LABEL_52:
          +[UITextInputTraits traitsByAdoptingTraits:lightweight:](UITextInputTraits, "traitsByAdoptingTraits:lightweight:", v52, 1);
          v123 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_56:
          v135 = -[UIKBAutofillController doTraits:matchTextContentType:](self, "doTraits:matchTextContentType:", v59);
          v126 = -[UIKBAutofillController doTraits:matchTextContentType:](self, "doTraits:matchTextContentType:", v59);
          v60 = -[UIKBAutofillController doTraits:matchTextContentType:](self, "doTraits:matchTextContentType:", v59);
          v61 = -[UIKBAutofillController doTraits:matchTextContentType:](self, "doTraits:matchTextContentType:", v59);
          v128 = -[UIKBAutofillController doTraits:matchTextContentType:](self, "doTraits:matchTextContentType:", v59);
          v120 = -[UIKBAutofillController doTraits:matchTextContentType:](self, "doTraits:matchTextContentType:", v59);
          v124 = -[UIKBAutofillController doTraits:matchTextContentType:](self, "doTraits:matchTextContentType:", v59);
          v132 = 0;
          v130 = (void *)v51;
          v131 = (void *)v50;
          v122 = (void *)v52;
          if (v61 && v61 > v135 && v61 > v126)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v132 = 0;
            }
            else
            {
              v132 = v61 == 2;
              -[UIKBAutofillController autofillGroup](self, "autofillGroup");
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v62, "setObject:forKey:", v138, CFSTR("one-time-code"));

              v53 = v137;
            }
          }
          v63 = dyld_program_sdk_at_least();
          if (v132)
            goto LABEL_63;
          v66 = v63;
          if (v135)
          {
            -[UIKBAutofillController autofillGroup](self, "autofillGroup");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v67, "setObject:forKey:", v138, CFSTR("username"));

            v65 = v59;
            v53 = v137;
            if (-[UIKBAutofillController doTraits:matchTextContentType:](self, "doTraits:matchTextContentType:", v129, CFSTR("new-password")) == 2)
            {
              -[UIKBAutofillController autofillGroup](self, "autofillGroup");
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v68, "setObject:forKey:", v51, CFSTR("new-password"));

LABEL_77:
              v64 = 0;
LABEL_78:
              v119 = 1;
LABEL_79:
              v53 = v137;
              goto LABEL_80;
            }
            if (-[UIKBAutofillController doTraits:matchTextContentType:](self, "doTraits:matchTextContentType:", v129, CFSTR("password")))
            {
              -[UIKBAutofillController autofillGroup](self, "autofillGroup");
              v72 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v72, "setObject:forKey:", v51, CFSTR("password"));

              v53 = v137;
              v73 = v52;
              if (-[UIKBAutofillController doTraits:matchTextContentType:](self, "doTraits:matchTextContentType:", v123, CFSTR("new-password")))
              {
LABEL_76:
                -[UIKBAutofillController autofillGroup](self, "autofillGroup");
                v74 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v74, "setObject:forKey:", v73, CFSTR("new-password"));

                goto LABEL_77;
              }
              if (v135 == 2)
                v100 = v66;
              else
                v100 = 0;
              if (v100 == 1)
              {
                v101 = -[UIKBAutofillController doTraits:matchTextContentType:](self, "doTraits:matchTextContentType:", v129, CFSTR("password"));
                v119 = 0;
LABEL_169:
                v64 = v101 == 2;
                goto LABEL_80;
              }
LABEL_156:
              v64 = 0;
              v119 = 0;
              goto LABEL_80;
            }
            if (-[UIKBAutofillController doTraits:matchTextContentType:](self, "doTraits:matchTextContentType:", v127, CFSTR("password"))&& !v125)
            {
              -[UIKBAutofillController autofillGroup](self, "autofillGroup");
              v99 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v99, "setObject:forKey:", v50, CFSTR("password"));

              v64 = 0;
              v119 = 0;
              goto LABEL_79;
            }
            v64 = 0;
            v104 = v127 != 0;
LABEL_155:
            v119 = v104;
            goto LABEL_80;
          }
          if (v50 && v60 == 2)
          {
            if (-[UIKBAutofillController doTraits:matchTextContentType:](self, "doTraits:matchTextContentType:", v127, CFSTR("new-password"))|| -[UIKBAutofillController doTraits:matchTextContentType:](self, "doTraits:matchTextContentType:", v127, CFSTR("password")))
            {
              if (-[UIKBAutofillController doTraits:matchTextContentType:](self, "doTraits:matchTextContentType:", v125, CFSTR("username")))
              {
                -[UIKBAutofillController autofillGroup](self, "autofillGroup");
                v69 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v69, "setObject:forKey:", v133, CFSTR("username"));

                v65 = v125;
                -[UIKBAutofillController autofillGroup](self, "autofillGroup");
                v70 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v70, "setObject:forKey:", v50, CFSTR("password"));

                -[UIKBAutofillController autofillGroup](self, "autofillGroup");
                v71 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v71, "setObject:forKey:", v138, CFSTR("new-password"));

                goto LABEL_77;
              }
            }
            else
            {
              if (!-[UIKBAutofillController doTraits:matchTextContentType:](self, "doTraits:matchTextContentType:", v129, CFSTR("new-password"))&& !-[UIKBAutofillController doTraits:matchTextContentType:](self, "doTraits:matchTextContentType:", v129, CFSTR("password")))
              {
                -[UIKBAutofillController autofillGroup](self, "autofillGroup");
                v116 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v116, "setObject:forKey:", v50, CFSTR("username"));

                v65 = v127;
                -[UIKBAutofillController autofillGroup](self, "autofillGroup");
                v117 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v117, "setObject:forKey:", v138, CFSTR("new-password"));

                goto LABEL_77;
              }
              if (-[UIKBAutofillController doTraits:matchTextContentType:](self, "doTraits:matchTextContentType:", v127, CFSTR("username")))
              {
                -[UIKBAutofillController autofillGroup](self, "autofillGroup");
                v113 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v113, "setObject:forKey:", v50, CFSTR("username"));

                v65 = v127;
                -[UIKBAutofillController autofillGroup](self, "autofillGroup");
                v114 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v114, "setObject:forKey:", v138, CFSTR("password"));

                -[UIKBAutofillController autofillGroup](self, "autofillGroup");
                v115 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v115, "setObject:forKey:", v51, CFSTR("new-password"));

                goto LABEL_77;
              }
            }
            goto LABEL_63;
          }
          if (!v126)
          {
            if ((objc_msgSend(v59, "isSecureTextEntry") & 1) == 0
              && -[UIKBAutofillController doTraits:matchTextContentType:](self, "doTraits:matchTextContentType:", v129, CFSTR("password")))
            {
              -[UIKBAutofillController autofillGroup](self, "autofillGroup");
              v102 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v102, "setObject:forKey:", v138, CFSTR("username"));

              v65 = v59;
              -[UIKBAutofillController autofillGroup](self, "autofillGroup");
              v103 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v103, "setObject:forKey:", v51, CFSTR("password"));

              v53 = v137;
              v73 = v52;
              if (-[UIKBAutofillController doTraits:matchTextContentType:](self, "doTraits:matchTextContentType:", v123, CFSTR("new-password")))
              {
                goto LABEL_76;
              }
              goto LABEL_156;
            }
LABEL_63:
            v64 = 0;
            v119 = 0;
LABEL_64:
            v65 = 0;
LABEL_80:
            if (v128 || v124 || v120)
            {
              if (v128 == 2)
              {
                -[UIKBAutofillController autofillGroup](self, "autofillGroup");
                v75 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v75, "setObject:forKey:", v138, CFSTR("email"));
              }
              else if (v124 == 2)
              {
                -[UIKBAutofillController autofillGroup](self, "autofillGroup");
                v75 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v75, "setObject:forKey:", v138, CFSTR("tel"));
              }
              else
              {
                -[UIKBAutofillController autofillGroup](self, "autofillGroup");
                v75 = (void *)objc_claimAutoreleasedReturnValue();
                if (v120 == 2)
                  objc_msgSend(v75, "setObject:forKey:", v138, CFSTR("street-address"));
                else
                  objc_msgSend(v75, "setObject:forKey:", v138, CFSTR("UIAutofillContactHeuristicsKey"));
              }

              v53 = v137;
            }
            -[UIKBAutofillController autofillGroup](self, "autofillGroup");
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            v79 = -[UIKBAutofillController contactAutofillModeWithAutofillGroup:responders:](self, "contactAutofillModeWithAutofillGroup:responders:", v78, v53);

            -[UIKBAutofillController autofillGroup](self, "autofillGroup");
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v80, "objectForKey:", CFSTR("one-time-code"));
            v81 = (void *)objc_claimAutoreleasedReturnValue();

            -[UIKBAutofillController autofillGroup](self, "autofillGroup");
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v82, "objectForKey:", CFSTR("username"));
            v83 = (id)objc_claimAutoreleasedReturnValue();

            -[UIKBAutofillController autofillGroup](self, "autofillGroup");
            v84 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v84, "objectForKey:", CFSTR("password"));
            v85 = objc_claimAutoreleasedReturnValue();

            if (v65)
            {
              if ((v86 = objc_msgSend(v65, "keyboardType"), v86 <= 0xB) && ((1 << v86) & 0x930) != 0 || v86 == 127)
              {
                if (v83 == v138)
                {
                  -[UIKBAutofillController autofillGroup](self, "autofillGroup");
                  v87 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v87, "removeObjectForKey:", CFSTR("username"));

                  -[UIKBAutofillController autofillGroup](self, "autofillGroup");
                  v88 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v88, "removeObjectForKey:", CFSTR("password"));

                  v83 = 0;
                  v85 = 0;
                }
                v64 = 1;
              }
            }
            -[UIKBAutofillController autofillGroup](self, "autofillGroup");
            v89 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v89, "objectForKey:", CFSTR("new-password"));
            v90 = objc_claimAutoreleasedReturnValue();

            if (v83)
              v91 = (v85 | v90) != 0;
            else
              v91 = 0;
            if (v83)
              v92 = v135 == 2;
            else
              v92 = 0;
            v93 = v92;
            if (v91 || (v93 & 1) != 0 || v85 && (unint64_t)(v126 - 1) <= 1)
            {
              v94 = !v64
                 && -[UIKBAutofillController signupHintForUsername:password:responder:](self, "signupHintForUsername:password:responder:", v83, v85, v137);
              v95 = v119;
              if (v90)
                v95 = 1;
              if ((v91 & (v95 | v94)) == 1)
              {
                if (self->_didOptOutOfAutofillSignup)
                {
                  v96 = 0;
                  v55 = 4;
                }
                else
                {
                  v96 = 0;
                  if (v83 == v139 || v83 == v138)
                    v55 = 3;
                  else
                    v55 = 2;
                }
              }
              else
              {
                v96 = 0;
                v55 = 1;
              }
            }
            else if (v132)
            {
              v96 = 0;
              v55 = 8;
            }
            else
            {
              v96 = 0;
              if (v79)
                v55 = v79;
              else
                v55 = 8;
              if (!v79 && !v81)
              {
                -[UIKBAutofillController clearAutofillGroup](self, "clearAutofillGroup");
                v96 = 1;
              }
            }

            _Block_object_dispose(&v151, 8);
            if ((v96 & 1) != 0)
              goto LABEL_140;
            goto LABEL_141;
          }
          if (v51
            && !-[UIKBAutofillController doTraits:matchTextContentType:](self, "doTraits:matchTextContentType:", v129, CFSTR("new-password")))
          {
            if (v50
              && -[UIKBAutofillController doTraits:matchTextContentType:](self, "doTraits:matchTextContentType:", v127, CFSTR("password")))
            {
              -[UIKBAutofillController autofillGroup](self, "autofillGroup");
              v105 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v105, "setObject:forKey:", v138, CFSTR("new-password"));

              -[UIKBAutofillController autofillGroup](self, "autofillGroup");
              v106 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v106, "setObject:forKey:", v50, CFSTR("password"));

              if (!v133)
              {
                v64 = 0;
                v65 = 0;
                goto LABEL_78;
              }
              v53 = v137;
              if (-[UIKBAutofillController doTraits:matchTextContentType:](self, "doTraits:matchTextContentType:", v125, CFSTR("username")))
              {
                -[UIKBAutofillController autofillGroup](self, "autofillGroup");
                v107 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v107, "setObject:forKey:", v133, CFSTR("username"));

                v65 = v125;
                goto LABEL_77;
              }
              v64 = 0;
              v65 = 0;
              v104 = 1;
              goto LABEL_155;
            }
          }
          else
          {
            -[UIKBAutofillController autofillGroup](self, "autofillGroup");
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v76, "setObject:forKey:", v138, CFSTR("password"));

            if (v51)
            {
              -[UIKBAutofillController autofillGroup](self, "autofillGroup");
              v77 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v77, "setObject:forKey:", v51, CFSTR("new-password"));

              v119 = 1;
              goto LABEL_163;
            }
          }
          v119 = 0;
LABEL_163:
          -[UIKBAutofillController autofillGroup](self, "autofillGroup");
          v108 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v108, "setObject:forKey:", v138, CFSTR("password"));

          v53 = v137;
          v65 = (id)v50;
          if (-[UIKBAutofillController doTraits:matchTextContentType:](self, "doTraits:matchTextContentType:", v127, CFSTR("username")))
          {
            -[UIKBAutofillController autofillGroup](self, "autofillGroup");
            v109 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v109, "setObject:forKey:", v50, CFSTR("username"));

            v65 = v127;
            if (v126 == 2)
              v110 = v66;
            else
              v110 = 0;
            if (v110 == 1)
            {
              v101 = -[UIKBAutofillController doTraits:matchTextContentType:](self, "doTraits:matchTextContentType:", v65, CFSTR("username"));
              v53 = v137;
              goto LABEL_169;
            }
          }
          else
          {
            if (-[UIKBAutofillController doTraits:matchTextContentType:](self, "doTraits:matchTextContentType:", v129, CFSTR("username")))
            {
              -[UIKBAutofillController autofillGroup](self, "autofillGroup");
              v111 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v111, "setObject:forKey:", v51, CFSTR("username"));

              v112 = v129;
            }
            else
            {
              if (!v50)
              {
                v64 = 0;
                goto LABEL_80;
              }
              if (-[UIKBAutofillController doTraits:matchTextContentType:](self, "doTraits:matchTextContentType:", v127, CFSTR("password")))
              {
                v64 = 0;
                goto LABEL_64;
              }
              -[UIKBAutofillController autofillGroup](self, "autofillGroup");
              v118 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v118, "setObject:forKey:", v50, CFSTR("username"));

              v112 = v127;
            }
            v65 = v112;
          }
          v64 = 0;
          goto LABEL_79;
        }
LABEL_55:
        v123 = 0;
        goto LABEL_56;
      }
    }
    v129 = 0;
    if (v52)
      goto LABEL_52;
    goto LABEL_55;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_respondsToSelector() & 1) == 0 && (objc_opt_respondsToSelector() & 1) == 0)
  {
LABEL_140:
    v55 = 0;
    goto LABEL_141;
  }
  -[UIKBAutofillController autofillGroup](self, "autofillGroup");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setObject:forKey:", v139, CFSTR("one-time-code"));

  v55 = 8;
LABEL_141:

  return v55;
}

BOOL __69__UIKBAutofillController__needAutofillCandidate_delegateAsResponder___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  double v4;
  _BOOL8 v5;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = v2;
    v5 = 0;
    if ((objc_msgSend(v3, "isHidden") & 1) == 0)
    {
      objc_msgSend(v3, "alpha");
      if (v4 != 0.0)
        v5 = 1;
    }

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

BOOL __69__UIKBAutofillController__needAutofillCandidate_delegateAsResponder___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;
  id v4;
  void *v5;
  CGRect v7;
  CGRect v8;

  v2 = a2;
  if (objc_msgSend(v2, "_requiresKeyboardWhenFirstResponder")
    && ((objc_msgSend(v2, "conformsToProtocol:", &unk_1EDE22B80) & 1) != 0 || (objc_opt_respondsToSelector() & 1) != 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_msgSend(v2, "frame"), !CGRectIsEmpty(v7)))
    {
      v3 = 1;
      goto LABEL_13;
    }
LABEL_10:
    v3 = 0;
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_10;
  v4 = v2;
  objc_msgSend(v4, "allTargets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v4, "frame");
    v3 = !CGRectIsEmpty(v8);
  }
  else
  {
    v3 = 0;
  }

LABEL_13:
  return v3;
}

BOOL __69__UIKBAutofillController__needAutofillCandidate_delegateAsResponder___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;
  void *v4;

  v2 = a2;
  if ((objc_msgSend(v2, "_requiresKeyboardWhenFirstResponder") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v2, "allTargets");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v4, "count") == 0;

    }
    else
    {
      v3 = 1;
    }
  }

  return v3;
}

void __69__UIKBAutofillController__needAutofillCandidate_delegateAsResponder___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;

  v5 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v3 = v5;
    if (*(id *)(a1 + 32) == v5)
    {
      v4 = objc_msgSend(*(id *)(a1 + 40), "count");
      v3 = v5;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v4;
    }
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
  }

}

- (void)clearAutofillGroup
{
  AFUITargetDetectionController_Staging *targetDetectionController;
  void *v4;

  targetDetectionController = self->_targetDetectionController;
  if (targetDetectionController)
  {
    -[AFUITargetDetectionController_Staging clearAutoFillGroup](targetDetectionController, "clearAutoFillGroup");
  }
  else
  {
    -[UIKBAutofillController autofillGroup](self, "autofillGroup");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeAllObjects");

    self->_didOptOutOfAutofillSignup = 0;
  }
}

- (void)clearFallbackAutofillGroup
{
  -[UIKBAutofillController setFallbackAutofillGroup:](self, "setFallbackAutofillGroup:", 0);
  self->_didOptOutOfAutofillSignup = 0;
}

- (BOOL)containsUsernamePasswordPairsInAutofillGroup:(id)a3
{
  id v4;
  AFUITargetDetectionController_Staging *targetDetectionController;
  char v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  targetDetectionController = self->_targetDetectionController;
  if (targetDetectionController)
  {
    v6 = -[AFUITargetDetectionController_Staging containsUsernamePasswordPairsInAutoFillGroup:](targetDetectionController, "containsUsernamePasswordPairsInAutoFillGroup:", v4);
  }
  else if (v4)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("username"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("password"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v6 = 1;
      }
      else
      {
        objc_msgSend(v4, "objectForKey:", CFSTR("new-password"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v9 != 0;

      }
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)preferFallbackAutofillGroup
{
  AFUITargetDetectionController_Staging *targetDetectionController;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  char v9;
  void *v10;
  BOOL v11;

  targetDetectionController = self->_targetDetectionController;
  if (targetDetectionController)
  {
    LOBYTE(v4) = -[AFUITargetDetectionController_Staging shouldPreferFallbackAutoFillGroup](targetDetectionController, "shouldPreferFallbackAutoFillGroup");
  }
  else
  {
    -[UIKBAutofillController fallbackAutofillGroup](self, "fallbackAutofillGroup");
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (void *)v4;
      -[UIKBAutofillController fallbackAutofillGroup](self, "fallbackAutofillGroup");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "count");

      if (v7)
      {
        -[UIKBAutofillController autofillGroup](self, "autofillGroup");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = -[UIKBAutofillController containsUsernamePasswordPairsInAutofillGroup:](self, "containsUsernamePasswordPairsInAutofillGroup:", v8);

        -[UIKBAutofillController fallbackAutofillGroup](self, "fallbackAutofillGroup");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = -[UIKBAutofillController containsUsernamePasswordPairsInAutofillGroup:](self, "containsUsernamePasswordPairsInAutofillGroup:", v10);

        LOBYTE(v4) = v11 & ~v9;
      }
      else
      {
        LOBYTE(v4) = 0;
      }
    }
  }
  return v4;
}

- (void)handleAutofillCredentialSaveIfNeeded:(id)a3 fromASP:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  AFUITargetDetectionController_Staging *targetDetectionController;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;

  v4 = a4;
  v6 = a3;
  targetDetectionController = self->_targetDetectionController;
  if (!targetDetectionController)
  {
    if (-[UIKBAutofillController preferFallbackAutofillGroup](self, "preferFallbackAutofillGroup"))
      -[UIKBAutofillController fallbackAutofillGroup](self, "fallbackAutofillGroup");
    else
      -[UIKBAutofillController autofillGroup](self, "autofillGroup");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (!v8)
    {
LABEL_26:
      -[UIKBAutofillController clearFallbackAutofillGroup](self, "clearFallbackAutofillGroup");

      goto LABEL_27;
    }
    objc_msgSend(v8, "objectForKey:", CFSTR("username"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v10, "text");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
    objc_msgSend(v9, "objectForKey:", CFSTR("new-password"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      objc_msgSend(v9, "objectForKey:", CFSTR("password"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v12, "text");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v11)
        goto LABEL_23;
    }
    else
    {
      v24 = 0;
      if (!v11)
        goto LABEL_23;
    }
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v11;
    objc_msgSend(v11, "stringByTrimmingCharactersInSet:", v13);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v14, "length") || !v24)
    {
LABEL_22:

      v11 = v23;
      goto LABEL_23;
    }
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
    v22 = v10;
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "stringByTrimmingCharactersInSet:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "length");

    v10 = v22;
    v11 = v23;
    if (v17)
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("UIAutofillContextKey"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("_WebViewURL"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = objc_alloc_init((Class)get_SFAppPasswordSavingViewControllerClass());
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v25[0] = MEMORY[0x1E0C809B0];
        v25[1] = 3221225472;
        v25[2] = __71__UIKBAutofillController_handleAutofillCredentialSaveIfNeeded_fromASP___block_invoke_2;
        v25[3] = &unk_1E16B3FD8;
        v26 = v14;
        objc_msgSend(v26, "credentialsSubmittedForWebsiteURL:user:password:passwordIsAutoGenerated:completionHandler:", v13, v23, v24, v4, v25);

      }
      goto LABEL_22;
    }
LABEL_23:
    -[UIKBAutofillController autofillGroup](self, "autofillGroup");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "allKeysForObject:", v6);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "count");

    if (v21)
      -[UIKBAutofillController clearAutofillGroup](self, "clearAutofillGroup");

    goto LABEL_26;
  }
  -[AFUITargetDetectionController_Staging saveAutoFillCredentialIfNeeded:passwordIsAutoGenerated:block:](targetDetectionController, "saveAutoFillCredentialIfNeeded:passwordIsAutoGenerated:block:", v6, v4, &__block_literal_global_663);
LABEL_27:

}

void __71__UIKBAutofillController_handleAutofillCredentialSaveIfNeeded_fromASP___block_invoke(uint64_t a1, void *a2)
{
  UIKeyboardSafariPresentCredentialPickerVC(a2);
}

void __71__UIKBAutofillController_handleAutofillCredentialSaveIfNeeded_fromASP___block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
    UIKeyboardSafariPresentCredentialPickerVC(*(void **)(a1 + 32));
}

- (void)handleWebviewCredentialsSaveForResponder:(id)a3 WebsiteURL:(id)a4 user:(id)a5 password:(id)a6 passwordIsAutoGenerated:(BOOL)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  id v14;
  AFUITargetDetectionController_Staging *targetDetectionController;
  id v16;
  _QWORD v17[4];
  id v18;

  v7 = a7;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  targetDetectionController = self->_targetDetectionController;
  if (targetDetectionController)
  {
    -[AFUITargetDetectionController_Staging saveWebviewCredentialsForResponder:WebsiteURL:user:password:passwordIsAutoGenerated:block:](targetDetectionController, "saveWebviewCredentialsForResponder:WebsiteURL:user:password:passwordIsAutoGenerated:block:", a3, v12, v13, v14, v7, &__block_literal_global_670);
  }
  else
  {
    v16 = objc_alloc_init((Class)get_SFAppPasswordSavingViewControllerClass());
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __116__UIKBAutofillController_handleWebviewCredentialsSaveForResponder_WebsiteURL_user_password_passwordIsAutoGenerated___block_invoke_2;
      v17[3] = &unk_1E16B3FD8;
      v18 = v16;
      objc_msgSend(v18, "credentialsSubmittedForWebsiteURL:user:password:passwordIsAutoGenerated:completionHandler:", v12, v13, v14, v7, v17);

    }
  }

}

void __116__UIKBAutofillController_handleWebviewCredentialsSaveForResponder_WebsiteURL_user_password_passwordIsAutoGenerated___block_invoke(uint64_t a1, void *a2)
{
  UIKeyboardSafariPresentCredentialPickerVC(a2);
}

void __116__UIKBAutofillController_handleWebviewCredentialsSaveForResponder_WebsiteURL_user_password_passwordIsAutoGenerated___block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
    UIKeyboardSafariPresentCredentialPickerVC(*(void **)(a1 + 32));
}

- (void)trackResponderForAutofillIfNeeded:(id)a3
{
  int64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  _BOOL8 v27;
  id v28;

  v28 = a3;
  v4 = -[UIKBAutofillController delegateNeedsAutofillMode](self, "delegateNeedsAutofillMode");
  v5 = v28;
  if (!v4)
  {
    -[UIKBAutofillController autofillGroup](self, "autofillGroup");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("password"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && v7)
    {
      v8 = v7;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v9 = v28;
      else
        v9 = 0;
      v10 = v9;
      objc_msgSend(v10, "frame");
      objc_msgSend(v10, "convertRect:toView:", 0);
      v12 = v11;
      v14 = v13;
      v16 = v15;
      v18 = v17;

      objc_msgSend(v8, "frame");
      objc_msgSend(v8, "convertRect:toView:", 0);
      v20 = v19;
      v22 = v21;
      v24 = v23;
      v26 = v25;

      v27 = v14 + v18 * 0.5 > v22 + v26 * 0.5 || v12 + v16 * 0.5 > v20 + v24 * 0.5;
      -[UIKBAutofillController setShouldSaveAutofill:](self, "setShouldSaveAutofill:", v27);
    }

    v5 = v28;
  }

}

- (BOOL)shouldLoadASPForResponder:(id)a3
{
  id v4;
  AFUITargetDetectionController_Staging *targetDetectionController;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  BOOL v13;

  v4 = a3;
  targetDetectionController = self->_targetDetectionController;
  if (targetDetectionController)
  {
    v6 = -[AFUITargetDetectionController_Staging shouldLoadASPForResponder:](targetDetectionController, "shouldLoadASPForResponder:", v4);
  }
  else
  {
    -[UIKBAutofillController autofillGroup](self, "autofillGroup");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", CFSTR("username"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIKBAutofillController autofillGroup](self, "autofillGroup");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", CFSTR("password"));
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (v10 == v4)
    {
      v13 = 1;
    }
    else
    {
      -[UIKBAutofillController autofillGroup](self, "autofillGroup");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKey:", CFSTR("new-password"));
      v12 = (id)objc_claimAutoreleasedReturnValue();
      v13 = v12 == v4;

    }
    if (v8)
      v6 = v13;
    else
      v6 = 0;
  }

  return v6;
}

- (void)didOptOutOfAutofillSignup
{
  if (self->_targetDetectionController)
    -[AFUITargetDetectionController_Staging didOptOutOfAutoFillSignup](self->_targetDetectionController, "didOptOutOfAutoFillSignup");
  else
    self->_didOptOutOfAutofillSignup = 1;
}

- (void)showASPInTextField:(id)a3 isRightToLeft:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  AFUITargetDetectionController_Staging *targetDetectionController;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  _BOOL8 v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  char v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD v40[2];

  v4 = a4;
  v40[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  targetDetectionController = self->_targetDetectionController;
  if (targetDetectionController)
  {
    -[AFUITargetDetectionController_Staging showASPInTextField:isRightToLeft:](targetDetectionController, "showASPInTextField:isRightToLeft:", v6, v4);
  }
  else
  {
    objc_msgSend(v6, "frame");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    objc_msgSend(v6, "rightView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "size");
    v18 = v17;
    objc_msgSend(v6, "leftView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "size");
    v21 = v9 + v20;
    v22 = v13 - (v18 + v20);
    v23 = v11 + 0.0;

    v24 = v4 || objc_msgSend(v6, "textAlignment") == 2;
    v39 = *(_QWORD *)off_1E1678D90;
    objc_msgSend(v6, "font");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = v25;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, &v39, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "text");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "sizeWithAttributes:", v26);
    v29 = v28;

    +[UIKBASPCoverView ASPCoverView:withFrame:isRightToLeft:withTextWidth:](UIKBASPCoverView, "ASPCoverView:withFrame:isRightToLeft:withTextWidth:", 1, v24, v21, v23, v22, v15, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "frame");
    +[UIKBASPCoverView ASPCoverView:withFrame:isRightToLeft:withTextWidth:](UIKBASPCoverView, "ASPCoverView:withFrame:isRightToLeft:withTextWidth:", 0, v24);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBAutofillController autofillGroup](self, "autofillGroup");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "objectForKey:", CFSTR("UIAutofillASPOptInKey"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "BOOLValue");

    if ((v34 & 1) == 0)
    {
      objc_msgSend(v6, "backgroundColor");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKBAutofillController setTextFieldOrigColor:](self, "setTextFieldOrigColor:", v35);

      -[UIKBAutofillController autofillGroup](self, "autofillGroup");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setObject:forKey:", v37, CFSTR("UIAutofillASPOptInKey"));

    }
    if (dyld_program_sdk_at_least())
      v38 = 3;
    else
      v38 = 1;
    objc_msgSend(v6, "_setContentCoverViewMode:", v38);
    objc_msgSend(v6, "_setContentCoverView:", v30);
    objc_msgSend(v6, "_setBackgroundCoverViewMode:", v38);
    objc_msgSend(v6, "_setBackgroundCoverView:", v31);

  }
}

- (void)clearASPVisualEffectsInTextField:(id)a3
{
  AFUITargetDetectionController_Staging *targetDetectionController;
  id v4;
  void *v5;
  id v6;

  targetDetectionController = self->_targetDetectionController;
  v4 = a3;
  v6 = v4;
  if (targetDetectionController)
  {
    -[AFUITargetDetectionController_Staging clearASPVisualEffectsInTextField:](targetDetectionController, "clearASPVisualEffectsInTextField:", v4);
  }
  else
  {
    objc_msgSend(v4, "_setContentCoverViewMode:", 0);
    objc_msgSend(v6, "_setContentCoverView:", 0);
    objc_msgSend(v6, "_backgroundCoverView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeFromSuperview");

    objc_msgSend(v6, "_setBackgroundCoverView:", 0);
  }

}

- (void)_clearASPInTextField:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[UIKBAutofillController autofillGroup](self, "autofillGroup");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObjectForKey:", CFSTR("UIAutofillASPOptInKey"));

  -[UIKBAutofillController removeTemporaryTextColorFromTextField:](self, "removeTemporaryTextColorFromTextField:", v5);
  -[UIKBAutofillController clearASPVisualEffectsInTextField:](self, "clearASPVisualEffectsInTextField:", v5);
  objc_msgSend(v5, "setText:", &stru_1E16EDF20);

}

- (void)clearASPInPasswordFields
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[UIKBAutofillController autofillGroup](self, "autofillGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("password"));
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[UIKBAutofillController _clearASPInTextField:](self, "_clearASPInTextField:", v6);
  -[UIKBAutofillController autofillGroup](self, "autofillGroup");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("new-password"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[UIKBAutofillController _clearASPInTextField:](self, "_clearASPInTextField:", v5);

}

- (void)optOutASPInTextField
{
  AFUITargetDetectionController_Staging *targetDetectionController;
  void *v4;
  id v5;

  targetDetectionController = self->_targetDetectionController;
  if (targetDetectionController)
  {
    -[AFUITargetDetectionController_Staging optOutASPInPasswordFields](targetDetectionController, "optOutASPInPasswordFields");
  }
  else
  {
    -[UIKBAutofillController clearASPInPasswordFields](self, "clearASPInPasswordFields");
    -[UIKBAutofillController autofillGroup](self, "autofillGroup");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("UIAutofillASPOptInKey"));

  }
}

- (void)enumeratePasswordFieldsUsingBlock:(id)a3
{
  void (**v4)(_QWORD, void *);
  AFUITargetDetectionController_Staging *targetDetectionController;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void (**v10)(_QWORD, void *);

  v4 = (void (**)(_QWORD, void *))a3;
  targetDetectionController = self->_targetDetectionController;
  if (targetDetectionController)
  {
    v10 = v4;
    -[AFUITargetDetectionController_Staging enumeratePasswordFieldsUsingBlock:](targetDetectionController, "enumeratePasswordFieldsUsingBlock:", v4);
LABEL_9:
    v4 = v10;
    goto LABEL_10;
  }
  if (v4)
  {
    v10 = v4;
    -[UIKBAutofillController autofillGroup](self, "autofillGroup");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("password"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10[2](v10, v7);
    -[UIKBAutofillController autofillGroup](self, "autofillGroup");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", CFSTR("new-password"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10[2](v10, v9);

    goto LABEL_9;
  }
LABEL_10:

}

- (void)addTemporaryTextColorToTextField:(id)a3
{
  AFUITargetDetectionController_Staging *targetDetectionController;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  targetDetectionController = self->_targetDetectionController;
  v4 = a3;
  v5 = v4;
  if (targetDetectionController)
  {
    -[AFUITargetDetectionController_Staging addTemporaryTextColorToTextField:](targetDetectionController, "addTemporaryTextColorToTextField:", v4);
  }
  else
  {
    objc_msgSend(v4, "textLayoutController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "documentRange");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = *(_QWORD *)off_1E1678D98;
    +[UIColor blackColor](UIColor, "blackColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v8;
    v11[1] = *(_QWORD *)off_1E1678C50;
    +[UIColor clearColor](UIColor, "clearColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addRenderingAttributes:forRange:", v10, v7);

    objc_msgSend(v5, "setNeedsDisplay");
    v5 = v6;
  }

}

- (void)removeTemporaryTextColorFromTextField:(id)a3
{
  AFUITargetDetectionController_Staging *targetDetectionController;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  targetDetectionController = self->_targetDetectionController;
  v4 = a3;
  v5 = v4;
  if (targetDetectionController)
  {
    -[AFUITargetDetectionController_Staging removeTemporaryTextColorFromTextField:](targetDetectionController, "removeTemporaryTextColorFromTextField:", v4);
  }
  else
  {
    objc_msgSend(v4, "textLayoutController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "documentRange");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)off_1E1678C50;
    v10[0] = *(_QWORD *)off_1E1678D98;
    v10[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeRenderingAttributes:forRange:", v9, v7);

    objc_msgSend(v5, "setNeedsDisplay");
    v5 = v6;
  }

}

- (UIColor)textFieldOrigColor
{
  return self->_textFieldOrigColor;
}

- (void)setTextFieldOrigColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)shouldSaveAutofill
{
  return self->_shouldSaveAutofill;
}

- (void)setShouldSaveAutofill:(BOOL)a3
{
  self->_shouldSaveAutofill = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textFieldOrigColor, 0);
  objc_storeStrong((id *)&self->_fallbackAutofillGroup, 0);
  objc_storeStrong((id *)&self->_autofillGroup, 0);
  objc_storeStrong((id *)&self->_targetDetectionController, 0);
}

- (void)_setAutofillGroup:(id)a3
{
  objc_storeStrong((id *)&self->_autofillGroup, a3);
}

@end
