@implementation _UIKeyboardArbiterClientSpringBoard

- (_UIKeyboardArbiterClientSpringBoard)init
{
  _UIKeyboardArbiterClientSpringBoard *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIKeyboardArbiterClientSpringBoard;
  v2 = -[_UIKeyboardArbiterClientInputDestination init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_willLock_, CFSTR("_UISystemApplicationWillLockNotification"), 0);

  }
  return v2;
}

- (BOOL)allowedToShowKeyboard
{
  return 1;
}

- (void)forceKeyboardAway
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  +[_UIKeyboardChangedInformation informationForKeyboardDown](_UIKeyboardChangedInformationWithFencing, "informationForKeyboardDown");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIKeyboardArbiterClient arbiterProxy](self, "arbiterProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "copy");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56___UIKeyboardArbiterClientSpringBoard_forceKeyboardAway__block_invoke;
  v7[3] = &unk_1E16B1B50;
  v7[4] = self;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v4, "signalKeyboardClientChanged:onCompletion:", v5, v7);

}

- (BOOL)isSpotlight:(id)a3
{
  return 0;
}

- (void)preserveKeyboardWithId:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  +[_UIKeyboardChangedInformation informationForKeyboardPreserve:](_UIKeyboardChangedInformationWithFencing, "informationForKeyboardPreserve:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIKeyboardArbiterClient arbiterProxy](self, "arbiterProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "copy");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __62___UIKeyboardArbiterClientSpringBoard_preserveKeyboardWithId___block_invoke;
  v8[3] = &unk_1E16B1B50;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v5, "signalKeyboardClientChanged:onCompletion:", v6, v8);

}

- (void)restoreKeyboardWithId:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  +[_UIKeyboardChangedInformation informationForKeyboardRestore:](_UIKeyboardChangedInformationWithFencing, "informationForKeyboardRestore:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIKeyboardArbiterClient arbiterProxy](self, "arbiterProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "copy");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __61___UIKeyboardArbiterClientSpringBoard_restoreKeyboardWithId___block_invoke;
  v8[3] = &unk_1E16B1B50;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v5, "signalKeyboardClientChanged:onCompletion:", v6, v8);

}

- (void)userSelectedApp:(id)a3 onCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  int v14;
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6 && !objc_msgSend(v6, "isEqualToString:", &stru_1E16EDF20))
  {
    v11 = 0;
  }
  else
  {
    -[_UIKeyboardArbiterClient requiredScene](self, "requiredScene");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identityToken");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIKeyboardArbiterClientInputDestination setFocusedSceneIdentityStringOrIdentifier:](self, "setFocusedSceneIdentityStringOrIdentifier:", v10);

    -[_UIKeyboardArbiterClientInputDestination focusedSceneIdentityStringOrIdentifier](self, "focusedSceneIdentityStringOrIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  KeyboardArbiterClientLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v14 = 138412546;
    v15 = v6;
    v16 = 2112;
    v17 = v11;
    _os_log_debug_impl(&dword_185066000, v12, OS_LOG_TYPE_DEBUG, "-[_UIKeyboardArbiterClientSpringBoard userSelectedApp:onCompletion:]  Focus bundle: %@, focusedSceneIdentity: %@", (uint8_t *)&v14, 0x16u);
  }
  if (!v7)
    v7 = &__block_literal_global_79;

  -[_UIKeyboardArbiterClient arbiterProxy](self, "arbiterProxy");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "applicationShouldFocusWithBundle:onCompletion:", v6, v7);

}

- (void)userSelectedProcessIdentifier:(int)a3 withSceneIdentity:(id)a4 onCompletion:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  _DWORD v18[2];
  __int16 v19;
  void *v20;
  uint64_t v21;

  v6 = *(_QWORD *)&a3;
  v21 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = a4;
  objc_msgSend(v9, "stringRepresentation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    -[_UIKeyboardArbiterClient requiredScene](self, "requiredScene");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "identityToken");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIKeyboardArbiterClientInputDestination setFocusedSceneIdentityStringOrIdentifier:](self, "setFocusedSceneIdentityStringOrIdentifier:", v13);

    -[_UIKeyboardArbiterClientInputDestination focusedSceneIdentityStringOrIdentifier](self, "focusedSceneIdentityStringOrIdentifier");
    v14 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v14;
  }
  KeyboardArbiterClientLog();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    v18[0] = 67109378;
    v18[1] = v6;
    v19 = 2112;
    v20 = v10;
    _os_log_debug_impl(&dword_185066000, v15, OS_LOG_TYPE_DEBUG, "-[_UIKeyboardArbiterClientSpringBoard userSelectedProcessIdentifier:withSceneIdentity:onCompletion:]  Focus PID: %d, focusedSceneIdentity: %@", (uint8_t *)v18, 0x12u);
  }
  if (!v8)
    v8 = &__block_literal_global_6_1;

  -[_UIKeyboardArbiterClient arbiterProxy](self, "arbiterProxy");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKBArbiterClientFocusContext focusContextForSceneIdentity:window:](UIKBArbiterClientFocusContext, "focusContextForSceneIdentity:window:", v9, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "focusApplicationWithProcessIdentifier:context:onCompletion:", v6, v17, v8);
}

- (void)queue_keyboardIAVChanged:(double)a3 onComplete:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  double v11;

  v6 = a4;
  objc_msgSend((id)UIApp, "_systemAnimationFenceExemptQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __75___UIKeyboardArbiterClientSpringBoard_queue_keyboardIAVChanged_onComplete___block_invoke;
  v9[3] = &unk_1E16B44E8;
  v11 = a3;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "performAsync:", v9);

}

@end
