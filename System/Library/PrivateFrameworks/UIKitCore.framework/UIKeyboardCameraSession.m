@implementation UIKeyboardCameraSession

+ (UIKeyboardCameraSession)activeSession
{
  return (UIKeyboardCameraSession *)(id)_activeSession;
}

+ (BOOL)shouldShowTextSuggestionForResponder:(id)a3
{
  return 0;
}

+ (UIKeyboardCameraSession)sharedSession
{
  void *v2;
  UIKeyboardCameraSession *v3;
  void *v4;

  v2 = (void *)_activeSession;
  if (!_activeSession)
  {
    v3 = objc_alloc_init(UIKeyboardCameraSession);
    v4 = (void *)_activeSession;
    _activeSession = (uint64_t)v3;

    v2 = (void *)_activeSession;
  }
  return (UIKeyboardCameraSession *)v2;
}

+ (BOOL)isEnabled
{
  return +[UIKeyboardCameraViewController isEnabled](UIKeyboardCameraViewController, "isEnabled");
}

+ (BOOL)updatesGuideDuringRotation
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  +[_UIRemoteKeyboards sharedRemoteKeyboards](_UIRemoteKeyboards, "sharedRemoteKeyboards");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "keyboardWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rootViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "presentedViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = objc_msgSend(v6, "updatesGuideDuringRotation");
  else
    v7 = 0;

  return v7;
}

+ (id)_textContentTypesForDataDetection
{
  if (qword_1ECD7EFB8 != -1)
    dispatch_once(&qword_1ECD7EFB8, &__block_literal_global_344);
  return (id)_MergedGlobals_1130;
}

void __60__UIKeyboardCameraSession__textContentTypesForDataDetection__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[8];

  v2[7] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("tel");
  v2[1] = CFSTR("street-address");
  v2[2] = CFSTR("url");
  v2[3] = CFSTR("email");
  v2[4] = CFSTR("flight-number");
  v2[5] = CFSTR("shipment-tracking-number");
  v2[6] = CFSTR("date-time");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 7);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_1130;
  _MergedGlobals_1130 = v0;

}

+ (id)keyboardCameraContentTypeForResponder:(id)a3
{
  id v4;
  __CFString *v5;
  __CFString *v6;
  uint64_t v7;
  id *v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;

  v4 = a3;
  v5 = &stru_1E16EDF20;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "textContentType");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (v6)
      goto LABEL_14;
  }
  else
  {
    v6 = v5;
    if (v5)
      goto LABEL_14;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
    goto LABEL_10;
  v7 = objc_msgSend(v4, "keyboardType");
  if (v7 == 3)
  {
    v8 = (id *)&UITextContentTypeURL;
    goto LABEL_13;
  }
  if (v7 == 5)
  {
    v8 = (id *)&UITextContentTypeTelephoneNumber;
    goto LABEL_13;
  }
  if (v7 != 7)
  {
LABEL_10:
    v6 = 0;
    goto LABEL_14;
  }
  v8 = (id *)&UITextContentTypeEmailAddress;
LABEL_13:
  v6 = (__CFString *)*v8;
LABEL_14:
  objc_msgSend(a1, "_textContentTypesForDataDetection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "containsObject:", v6))
    v10 = v6;
  else
    v10 = v5;
  v11 = v10;

  return v11;
}

- (void)showForResponder:(id)a3 sender:(id)a4 rtiConfiguration:(id)a5
{
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  char v15;
  char isKindOfClass;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a3;
  v9 = a4;
  v10 = a5;
  -[UIViewController presentingViewController](self->_keyboardCameraViewController, "presentingViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    goto LABEL_26;
  v12 = v21;
  if ((objc_msgSend(v12, "conformsToProtocol:", &unk_1EDE24D00) & 1) != 0)
  {
    if (v12)
    {
      objc_msgSend(v12, "textInputTraits");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v12;
LABEL_10:

      goto LABEL_11;
    }
  }
  else
  {

  }
  v14 = v12;
  if (!objc_msgSend(v14, "conformsToProtocol:", &unk_1EDE22370))
  {
    v13 = 0;
    goto LABEL_10;
  }
  if (v14)
  {
    +[UITextInputTraits traitsByAdoptingTraits:](UITextInputTraits, "traitsByAdoptingTraits:", v14);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  v13 = 0;
LABEL_11:

  objc_storeStrong((id *)&self->_responder, a3);
  if ((objc_msgSend(v12, "conformsToProtocol:", &unk_1EE0CE648) & 1) != 0
    || (objc_msgSend(v12, "conformsToProtocol:", &unk_1EE0CE288) & 1) != 0)
  {
    v15 = 1;
  }
  else
  {
    v15 = objc_msgSend(v12, "conformsToProtocol:", &unk_1EE0CE228);
  }
  self->_isWebResponder = v15;
  self->_isTextInputResponder = objc_msgSend(v12, "conformsToProtocol:", &unk_1EDE22B80);
  self->_respondsToKeyboardInputShouldInsertText = objc_opt_respondsToSelector() & 1;
  if ((objc_msgSend(v13, "isSingleLineDocument") & 1) != 0 || objc_msgSend(v13, "returnKeyType"))
  {
    isKindOfClass = 1;
  }
  else
  {
    NSClassFromString(CFSTR("MFComposeSubjectTextView"));
    isKindOfClass = objc_opt_isKindOfClass();
  }
  self->_isSingleLineDocument = isKindOfClass & 1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v17 = objc_msgSend(v13, "isSecureTextEntry");
  else
    v17 = 0;
  self->_isSecureFieldEditor = v17;
  objc_storeStrong(&self->_sender, a4);
  if (v10)
  {
    self->_isWebResponder = objc_msgSend(v10, "isWebKitInteractionView");
    self->_isSingleLineDocument = objc_msgSend(v10, "isSingleLineDocument");
    self->_shouldSuppressSoftwareKeyboard = objc_msgSend(v10, "shouldSuppressKeyboard");
  }
  -[UIKeyboardCameraSession _show](self, "_show");
  -[UIKeyboardCameraSession sessionAnalytics](self, "sessionAnalytics");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "didBegin");

  +[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "acceptAutocorrectionWithCompletionHandler:", 0);

  if (self->_isSecureFieldEditor)
  {
    objc_msgSend(v12, "_inputController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "clearText");

  }
LABEL_26:

}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;
  _QWORD v6[6];

  v6[5] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = CFSTR("UIWindowFirstResponderDidChangeNotification");
  v6[1] = CFSTR("UITextInputCurrentInputModeDidChangeNotification");
  v6[2] = CFSTR("UIApplicationDidEnterBackgroundNotification");
  v6[3] = CFSTR("UIApplicationWillResignActiveNotification");
  v6[4] = CFSTR("UIKeyboardPrivateWillHideNotification");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSNotificationCenter _uiRemoveObserver:names:](v3, self, v4);

  v5.receiver = self;
  v5.super_class = (Class)UIKeyboardCameraSession;
  -[UIKeyboardCameraSession dealloc](&v5, sel_dealloc);
}

- (BOOL)isPresented
{
  return -[UIPresentationController state](self->_presentationController, "state") == 2;
}

- (BOOL)isPresenting
{
  return -[UIPresentationController state](self->_presentationController, "state") == 1;
}

- (BOOL)isDismissing
{
  return -[UIPresentationController state](self->_presentationController, "state") == 3;
}

- (UITextInputSessionActionAnalytics)sessionAnalytics
{
  UITextInputSessionActionAnalytics *sessionAnalytics;
  UITextInputSessionActionAnalytics *v4;
  UITextInputSessionActionAnalytics *v5;

  sessionAnalytics = self->_sessionAnalytics;
  if (!sessionAnalytics)
  {
    v4 = objc_alloc_init(UITextInputSessionActionAnalytics);
    v5 = self->_sessionAnalytics;
    self->_sessionAnalytics = v4;

    -[UITextInputSessionActionAnalytics setDelegateSource:](self->_sessionAnalytics, "setDelegateSource:", self);
    sessionAnalytics = self->_sessionAnalytics;
  }
  return sessionAnalytics;
}

- (void)_makeResponderEditableIfNecessary
{
  void *v3;
  char v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  int v9;
  id v10;

  -[UIKeyboardCameraSession responder](self, "responder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isFirstResponder");

  -[UIKeyboardCameraSession responder](self, "responder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
LABEL_6:
    if ((v4 & 1) != 0)
      return;
    goto LABEL_7;
  }
  -[UIKeyboardCameraSession responder](self, "responder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isEditable") & 1) != 0 || !objc_msgSend(v7, "_shouldBecomeEditableUponFocus"))
  {

    goto LABEL_6;
  }
  objc_msgSend(v7, "setEditable:", 1);

LABEL_7:
  -[UIKeyboardCameraSession responder](self, "responder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "canBecomeFirstResponder");

  if (v9)
  {
    *(_WORD *)&self->_shouldSuppressSoftwareKeyboard = 257;
    -[UIKeyboardCameraSession responder](self, "responder");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "becomeFirstResponder");

  }
}

- (void)_show
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  UIKeyboardCameraViewController *v8;
  UIKeyboardCameraViewController *keyboardCameraViewController;
  void *v10;
  void *v11;
  UIKeyboardCameraViewController *v12;
  UIKeyboardCameraSessionRTIConfiguration *v13;
  _QWORD v14[4];
  id v15;
  id location;

  if (+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
  {
    -[UIKeyboardCameraSession _makeResponderEditableIfNecessary](self, "_makeResponderEditableIfNecessary");
    v13 = objc_alloc_init(UIKeyboardCameraSessionRTIConfiguration);
    -[UIKeyboardCameraSessionRTIConfiguration setIsWebKitInteractionView:](v13, "setIsWebKitInteractionView:", self->_isWebResponder);
    -[UIKeyboardCameraSessionRTIConfiguration setIsSingleLineDocument:](v13, "setIsSingleLineDocument:", self->_isSingleLineDocument);
    -[UIKeyboardCameraSessionRTIConfiguration setShouldSuppressKeyboard:](v13, "setShouldSuppressKeyboard:", self->_shouldSuppressSoftwareKeyboard);
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "forwardKeyboardCameraEvent_startCameraInput:", v13);

    -[UIKeyboardCameraSession _textInputResponder](self, "_textInputResponder");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      if (self->_isSecureFieldEditor)
      {
        objc_msgSend(v4, "_inputController");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "clearText");

        objc_msgSend(v5, "textField");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setDisplaySecureTextUsingPlainText:", 1);

      }
    }
    -[UIKeyboardCameraSession _addObservers](self, "_addObservers");

  }
  else if (+[UIKeyboardCameraViewController isEnabled](UIKeyboardCameraViewController, "isEnabled"))
  {
    v8 = objc_alloc_init(UIKeyboardCameraViewController);
    keyboardCameraViewController = self->_keyboardCameraViewController;
    self->_keyboardCameraViewController = v8;

    -[UIKeyboardCameraViewController setDelegate:](self->_keyboardCameraViewController, "setDelegate:", self);
    -[UIKeyboardCameraSession responder](self, "responder");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKeyboardCameraSession keyboardCameraContentTypeForResponder:](UIKeyboardCameraSession, "keyboardCameraContentTypeForResponder:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardCameraViewController setTextContentType:](self->_keyboardCameraViewController, "setTextContentType:", v11);

    -[UIViewController setModalPresentationStyle:](self->_keyboardCameraViewController, "setModalPresentationStyle:", 4);
    -[UIViewController setTransitioningDelegate:](self->_keyboardCameraViewController, "setTransitioningDelegate:", self);
    objc_initWeak(&location, self);
    v12 = self->_keyboardCameraViewController;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __32__UIKeyboardCameraSession__show__block_invoke;
    v14[3] = &unk_1E16B44C0;
    objc_copyWeak(&v15, &location);
    -[UIKeyboardCameraViewController prepareWithCompletion:](v12, "prepareWithCompletion:", v14);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

void __32__UIKeyboardCameraSession__show__block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;
  id v3;

  if (a2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    if (WeakRetained)
    {
      v3 = WeakRetained;
      objc_msgSend(WeakRetained, "_keyboardCameraPreparationDidComplete");
      WeakRetained = v3;
    }

  }
}

- (void)_keyboardCameraPreparationDidComplete
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _BOOL8 v12;
  UIKeyboardCameraViewController *keyboardCameraViewController;
  void *v14;
  _QWORD v15[4];
  id v16;
  id location;

  if (!+[_UIRemoteKeyboards enabled](_UIRemoteKeyboards, "enabled"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIKeyboardCameraSession.m"), 369, CFSTR("Keyboard Camera is being used without remote keyboards enabled"));

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("_UIKeyboardCameraSessionWillPresent"), self);

  -[UIPresentationController setDelegate:](self->_presentationController, "setDelegate:", self);
  +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "inputWindowRootViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "placement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  self->_presentingOverKeyboard = objc_msgSend(v7, "showsKeyboard");

  if (!self->_presentingOverKeyboard)
  {
    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v8, "forceCreateKeyboardWindow");

  }
  +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "inputWindowRootViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1 || !self->_presentingOverKeyboard;
  objc_initWeak(&location, self);
  keyboardCameraViewController = self->_keyboardCameraViewController;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __64__UIKeyboardCameraSession__keyboardCameraPreparationDidComplete__block_invoke;
  v15[3] = &unk_1E16B3F40;
  objc_copyWeak(&v16, &location);
  objc_msgSend(v11, "presentViewController:animated:completion:", keyboardCameraViewController, v12, v15);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

void __64__UIKeyboardCameraSession__keyboardCameraPreparationDidComplete__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "postNotificationName:object:", CFSTR("_UIKeyboardCameraSessionDidPresent"), WeakRetained);

  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_addObservers");
    v2 = WeakRetained;
  }

}

- (void)_keyboardAboutToHide:(id)a3
{
  void *v4;
  void *v5;
  char v6;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("UIKeyboardOriginatedFromRotationUserInfoKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if ((v6 & 1) == 0)
    -[UIKeyboardCameraSession keyboardCameraDidCancel](self, "keyboardCameraDidCancel");
}

- (void)_firstResponderDidChange:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("UIWindowFirstResponderUserInfoKey"));
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    -[UIKeyboardCameraSession keyboardCameraDidCancel](self, "keyboardCameraDidCancel");

}

- (void)_addObservers
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  +[UIWindow _applicationKeyWindow](UIWindow, "_applicationKeyWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__firstResponderDidChange_, CFSTR("UIWindowFirstResponderDidChangeNotification"), v3);

  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__inputModeDidChange_, CFSTR("UITextInputCurrentInputModeDidChangeNotification"), 0);
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__didEnterBackground_, CFSTR("UIApplicationDidEnterBackgroundNotification"), UIApp);
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__didEnterBackground_, CFSTR("UIApplicationWillResignActiveNotification"), UIApp);
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__keyboardAboutToHide_, CFSTR("UIKeyboardPrivateWillHideNotification"), 0);

}

- (id)_textInputResponder
{
  UIKeyInput *responder;

  if (self->_isTextInputResponder)
    responder = self->_responder;
  else
    responder = 0;
  return responder;
}

- (void)_updatePreviewWithString:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[UIKeyboardCameraSession _textInputResponder](self, "_textInputResponder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    if (!self->_respondsToKeyboardInputShouldInsertText
      || -[UIKeyInput keyboardInput:shouldInsertText:isMarkedText:](self->_responder, "keyboardInput:shouldInsertText:isMarkedText:", self->_responder, v6, 1))
    {
      objc_msgSend(v4, "setMarkedText:selectedRange:", v6, objc_msgSend(v6, "length"), 0);
    }
    if (+[UIKeyboard isInputSystemUI](UIKeyboard, "isInputSystemUI"))
    {
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "forwardKeyboardCameraEvent_updatePreviewText:asMarkedText:", v6, 1);

    }
  }

}

- (void)_cleanupKeyboardCameraAndShouldInsertText:(BOOL)a3
{
  void *v5;
  uint64_t v6;
  NSUInteger v7;
  _BOOL4 v8;
  void *v9;
  uint64_t v10;
  void *v11;
  char v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSString *keyboardCameraCandidateString;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;

  if (!self->_didCleanup)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObserver:", self);

    -[UIKeyboardCameraSession _textInputResponder](self, "_textInputResponder");
    v6 = objc_claimAutoreleasedReturnValue();
    v22 = (id)v6;
    if (a3)
    {
      v7 = -[NSString length](self->_keyboardCameraCandidateString, "length");
      v8 = v7 != 0;
      if (v22 && v7)
      {
        objc_msgSend(v22, "inputDelegate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "textWillChange:", v22);

        v8 = 1;
      }
      else if (!v22)
      {
        v12 = 1;
        if (!v7)
          goto LABEL_22;
        goto LABEL_19;
      }
    }
    else
    {
      v8 = 0;
      v10 = 0;
      if (!v6)
        goto LABEL_27;
    }
    if (!self->_isWebResponder || self->_isSingleLineDocument)
    {
      if (v8)
      {
        objc_msgSend(v22, "unmarkText");
        if (+[UIKeyboard isInputSystemUI](UIKeyboard, "isInputSystemUI"))
        {
          +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "forwardKeyboardCameraEvent_updatePreviewText:asMarkedText:", self->_keyboardCameraCandidateString, 0);

        }
        if (self->_isSecureFieldEditor)
          objc_msgSend(v22, "_obscureAllText");
LABEL_25:
        objc_msgSend(v22, "inputDelegate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "textDidChange:", v22);

LABEL_26:
        -[UIKeyboardCameraSession sessionAnalytics](self, "sessionAnalytics");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "didInsertText:relativeRangeBefore:", self->_keyboardCameraCandidateString, 0, 0);

        v10 = 1;
        goto LABEL_27;
      }
      -[UIKeyboardCameraSession _updatePreviewWithString:](self, "_updatePreviewWithString:", &stru_1E16EDF20);
      objc_msgSend(v22, "unmarkText");
      if (self->_isSecureFieldEditor)
        objc_msgSend(v22, "_obscureAllText");
LABEL_22:
      v10 = 0;
LABEL_27:
      -[UIKeyboardCameraSession sessionAnalytics](self, "sessionAnalytics");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "writeAnalytics");

      -[UIKeyboardCameraViewController textContentType](self->_keyboardCameraViewController, "textContentType");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIKBAnalyticsDispatcher keyboardCameraSessionEndedForTextContentType:didFindText:didInsertText:sender:](UIKBAnalyticsDispatcher, "keyboardCameraSessionEndedForTextContentType:didFindText:didInsertText:sender:", v20, self->_didFindText, v10, self->_sender);
      self->_shouldSuppressSoftwareKeyboard = 0;
      keyboardCameraCandidateString = self->_keyboardCameraCandidateString;
      self->_keyboardCameraCandidateString = 0;

      self->_didCleanup = 1;
      return;
    }
    v12 = 0;
    if (!v8)
      goto LABEL_22;
LABEL_19:
    if (+[UIKeyboard isInputSystemUI](UIKeyboard, "isInputSystemUI"))
    {
      v13 = objc_alloc_init(MEMORY[0x1E0DBDC40]);
      objc_msgSend(v13, "insertText:", self->_keyboardCameraCandidateString);
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __69__UIKeyboardCameraSession__cleanupKeyboardCameraAndShouldInsertText___block_invoke;
      v23[3] = &unk_1E16B1B50;
      v24 = v14;
      v25 = v13;
      v15 = v13;
      v16 = v14;
      objc_msgSend(v16, "performOperations:withTextInputSource:", v23, 7);

    }
    else
    {
      -[UIKeyInput insertText:](self->_responder, "insertText:", self->_keyboardCameraCandidateString);
    }
    if ((v12 & 1) != 0)
      goto LABEL_26;
    goto LABEL_25;
  }
}

uint64_t __69__UIKeyboardCameraSession__cleanupKeyboardCameraAndShouldInsertText___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performKeyboardOutput:", *(_QWORD *)(a1 + 40));
}

- (void)_dismissKeyboardCamera
{
  void *v3;
  void *v4;
  _BOOL8 v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  id location;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("_UIKeyboardCameraSessionWillDismiss"), self);

  objc_initWeak(&location, self);
  -[UIViewController presentingViewController](self->_keyboardCameraViewController, "presentingViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1 || !self->_presentingOverKeyboard;
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __49__UIKeyboardCameraSession__dismissKeyboardCamera__block_invoke;
  v10 = &unk_1E16B3F40;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v4, "dismissViewControllerAnimated:completion:", v5, &v7);
  if (+[UIKeyboard isInputSystemUI](UIKeyboard, "isInputSystemUI", v7, v8, v9, v10))
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "forwardKeyboardCameraEvent_selfDestruct");

  }
  objc_destroyWeak(&v11);

  objc_destroyWeak(&location);
}

void __49__UIKeyboardCameraSession__dismissKeyboardCamera__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "postNotificationName:object:", CFSTR("_UIKeyboardCameraSessionDidDismiss"), WeakRetained);

  if (WeakRetained)
  {
    v2 = (void *)WeakRetained[1];
    WeakRetained[1] = 0;

  }
  v3 = (void *)_activeSession;
  _activeSession = 0;

}

- (void)keyboardCameraDidUpdateString:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id obj;
  id obja;

  obj = a3;
  if (objc_msgSend(obj, "length"))
    self->_didFindText = 1;
  if (self->_isSingleLineDocument)
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(obj, "componentsSeparatedByCharactersInSet:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "componentsJoinedByString:", CFSTR(" "));
    v6 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v6;
  }
  else
  {
    v7 = obj;
  }
  obja = v7;
  objc_storeStrong((id *)&self->_keyboardCameraCandidateString, v7);
  -[UIKeyboardCameraSession _textInputResponder](self, "_textInputResponder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if (self->_isWebResponder)
    {
      if (!self->_isSingleLineDocument)
        goto LABEL_13;
      objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(obja, "componentsSeparatedByCharactersInSet:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "componentsJoinedByString:", CFSTR(" "));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_storeStrong((id *)&self->_keyboardCameraCandidateString, v11);
      v12 = v11;
    }
    else
    {
      v12 = obja;
    }
    obja = v12;
    -[UIKeyboardCameraSession _updatePreviewWithString:](self, "_updatePreviewWithString:");
    if (self->_isSecureFieldEditor)
      objc_msgSend(v8, "_unobscureAllText");
  }
LABEL_13:

}

- (void)keyboardCameraDidAccept
{
  -[UIKeyboardCameraSession _cleanupKeyboardCameraAndShouldInsertText:](self, "_cleanupKeyboardCameraAndShouldInsertText:", 1);
  -[UIKeyboardCameraSession _dismissKeyboardCamera](self, "_dismissKeyboardCamera");
}

- (void)keyboardCameraDidCancel
{
  _BOOL4 v3;

  v3 = +[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI");
  -[UIKeyboardCameraSession _cleanupKeyboardCameraAndShouldInsertText:](self, "_cleanupKeyboardCameraAndShouldInsertText:", 0);
  if (v3)
    -[UIKeyboardCameraSession endActiveSession](self, "endActiveSession");
  else
    -[UIKeyboardCameraSession _dismissKeyboardCamera](self, "_dismissKeyboardCamera");
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  UIViewControllerAnimatedTransitioning *animationController;

  if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1)
    animationController = self->_animationController;
  else
    animationController = 0;
  return animationController;
}

- (id)animationControllerForDismissedController:(id)a3
{
  UIViewControllerAnimatedTransitioning *animationController;

  if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1)
    animationController = self->_animationController;
  else
    animationController = 0;
  return animationController;
}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v7;
  id v8;
  UIKeyboardCameraPadPresentationController *v9;
  void *animationController;
  UIKeyboardCameraOverlayPresentationController *v11;

  v7 = a4;
  v8 = a3;
  if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    v9 = -[UIPresentationController initWithPresentedViewController:presentingViewController:]([UIKeyboardCameraPadPresentationController alloc], "initWithPresentedViewController:presentingViewController:", v8, v7);

    -[UIKeyboardCameraPadPresentationController setDimmingViewDelegate:](v9, "setDimmingViewDelegate:", self);
    objc_storeStrong((id *)&self->_presentationController, v9);
    animationController = self->_animationController;
    self->_animationController = (UIViewControllerAnimatedTransitioning *)v9;
  }
  else
  {
    v11 = -[UIPresentationController initWithPresentedViewController:presentingViewController:]([UIKeyboardCameraOverlayPresentationController alloc], "initWithPresentedViewController:presentingViewController:", v8, v7);

    animationController = self->_presentationController;
    self->_presentationController = &v11->super;
  }

  -[UIKeyboardCameraBasePresentationController setPresentingOverKeyboard:](self->_presentationController, "setPresentingOverKeyboard:", self->_presentingOverKeyboard);
  return self->_presentationController;
}

- (void)presentationControllerDidDismiss:(id)a3
{
  UIKeyboardCameraViewController *v4;
  UIKeyboardCameraViewController *keyboardCameraViewController;
  UIKeyboardCameraViewController *v6;

  objc_msgSend(a3, "presentedViewController");
  v4 = (UIKeyboardCameraViewController *)objc_claimAutoreleasedReturnValue();
  keyboardCameraViewController = self->_keyboardCameraViewController;

  if (v4 == keyboardCameraViewController)
  {
    -[UIKeyboardCameraSession _cleanupKeyboardCameraAndShouldInsertText:](self, "_cleanupKeyboardCameraAndShouldInsertText:", 0);
    v6 = self->_keyboardCameraViewController;
    self->_keyboardCameraViewController = 0;

  }
}

- (id)_delegateAsResponder
{
  return self->_responder;
}

- (id)_sessionIdentifier
{
  void *v2;
  void *v3;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_sessionIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)_overrideTextInputSource
{
  return 7;
}

- (void)endActiveSession
{
  void *v3;
  void *v4;
  UIKeyboardCameraViewController *keyboardCameraViewController;
  void *v6;
  id v7;

  -[UIKeyboardCameraSession _textInputResponder](self, "_textInputResponder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v3;
  if (v3 && self->_isSecureFieldEditor)
  {
    objc_msgSend(v3, "textField");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDisplaySecureTextUsingPlainText:", 0);

    objc_msgSend(v7, "_obscureAllText");
  }
  if (self->_shouldResignFirstResponderWhenDone && objc_msgSend(v7, "isFirstResponder"))
    objc_msgSend(v7, "resignFirstResponder");
  self->_shouldResignFirstResponderWhenDone = 0;
  keyboardCameraViewController = self->_keyboardCameraViewController;
  self->_keyboardCameraViewController = 0;

  self->_shouldSuppressSoftwareKeyboard = 0;
  v6 = (void *)_activeSession;
  _activeSession = 0;

}

- (BOOL)shouldSuppressSoftwareKeyboard
{
  return self->_shouldSuppressSoftwareKeyboard;
}

- (void)setShouldSuppressSoftwareKeyboard:(BOOL)a3
{
  self->_shouldSuppressSoftwareKeyboard = a3;
}

- (UIKeyInput)responder
{
  return self->_responder;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responder, 0);
  objc_storeStrong((id *)&self->_sessionAnalytics, 0);
  objc_storeStrong(&self->_sender, 0);
  objc_storeStrong((id *)&self->_keyboardCameraCandidateString, 0);
  objc_storeStrong((id *)&self->_animationController, 0);
  objc_storeStrong((id *)&self->_presentationController, 0);
  objc_storeStrong((id *)&self->_keyboardCameraViewController, 0);
}

@end
