@implementation UIKBLocalAuthenticationObserver

- (void)willTryToBecomeFirstResponder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  id v8;

  v8 = a3;
  if (+[UIKeyboard isInputSystemUI](UIKeyboard, "isInputSystemUI")
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v8, "_rtiSourceSession");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBLocalAuthenticationObserver uuidOfSessionEndedDuringLocalAuthentication](self, "uuidOfSessionEndedDuringLocalAuthentication");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

    if (v7)
      -[UIKBLocalAuthenticationObserver setIsRestoringPreLocalAuthenticationDelegate:](self, "setIsRestoringPreLocalAuthenticationDelegate:", 1);

  }
}

- (void)didTryToBecomeFirstResponder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  id v8;

  v8 = a3;
  if (+[UIKeyboard isInputSystemUI](UIKeyboard, "isInputSystemUI")
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v8, "_rtiSourceSession");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBLocalAuthenticationObserver uuidOfSessionEndedDuringLocalAuthentication](self, "uuidOfSessionEndedDuringLocalAuthentication");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

    if (v7)
      -[UIKBLocalAuthenticationObserver setIsRestoringPreLocalAuthenticationDelegate:](self, "setIsRestoringPreLocalAuthenticationDelegate:", 0);

  }
}

- (UIKBLocalAuthenticationObserver)init
{
  UIKBLocalAuthenticationObserver *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIKBLocalAuthenticationObserver;
  v2 = -[UIKBLocalAuthenticationObserver init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__startListeningForLAUINotificationsIfNeeded, CFSTR("UIApplicationDidBecomeActiveNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v2, sel__stopListeningForLAUINotifications, CFSTR("UIApplicationDidEnterBackgroundNotification"), 0);

    -[UIKBLocalAuthenticationObserver _startListeningForLAUINotificationsIfNeeded](v2, "_startListeningForLAUINotificationsIfNeeded");
  }
  return v2;
}

- (void)_startListeningForLAUINotificationsIfNeeded
{
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v4;

  if (!self->_isListeningForLAUINotifications)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)UIKBLADarwinUIPresented_0, CFSTR("com.apple.LocalAuthentication.ui.presented"), 0, (CFNotificationSuspensionBehavior)0);
    v4 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v4, self, (CFNotificationCallback)UIKBLADarwinUIDismissed_0, CFSTR("com.apple.LocalAuthentication.ui.dismissed"), 0, (CFNotificationSuspensionBehavior)0);
    self->_isListeningForLAUINotifications = 1;
  }
}

- (id)sessionIDForInputDelegate:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  if (!+[UIKeyboard isInputSystemUI](UIKeyboard, "isInputSystemUI")
    && (-[UIKBLocalAuthenticationObserver delegateResignedDuringLocalAuthentication](self, "delegateResignedDuringLocalAuthentication"), v5 = (id)objc_claimAutoreleasedReturnValue(), v5, v5 == v4))
  {
    -[UIKBLocalAuthenticationObserver uuidOfDelegateResignedDuringLocalAuthentication](self, "uuidOfDelegateResignedDuringLocalAuthentication");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (UIKeyInput)delegateResignedDuringLocalAuthentication
{
  return (UIKeyInput *)objc_loadWeakRetained((id *)&self->_delegateResignedDuringLocalAuthentication);
}

- (BOOL)localAuthenticationPresented
{
  return self->_localAuthenticationPresented;
}

- (void)inputDelegateWillTeardown:(id)a3 sessionUUID:(id)a4
{
  id v6;
  _BOOL4 v7;
  _BOOL4 v8;
  id v9;

  v9 = a3;
  v6 = a4;
  v7 = +[UIKeyboard isInputSystemUI](UIKeyboard, "isInputSystemUI");
  v8 = -[UIKBLocalAuthenticationObserver localAuthenticationPresented](self, "localAuthenticationPresented");
  if (v7)
  {
    if (v8)
      -[UIKBLocalAuthenticationObserver setUuidOfSessionEndedDuringLocalAuthentication:](self, "setUuidOfSessionEndedDuringLocalAuthentication:", v6);
  }
  else if (v8)
  {
    -[UIKBLocalAuthenticationObserver setDelegateResignedDuringLocalAuthentication:](self, "setDelegateResignedDuringLocalAuthentication:", v9);
    -[UIKBLocalAuthenticationObserver setUuidOfDelegateResignedDuringLocalAuthentication:](self, "setUuidOfDelegateResignedDuringLocalAuthentication:", v6);
  }

}

- (void)dealloc
{
  objc_super v3;

  -[UIKBLocalAuthenticationObserver _stopListeningForLAUINotifications](self, "_stopListeningForLAUINotifications");
  v3.receiver = self;
  v3.super_class = (Class)UIKBLocalAuthenticationObserver;
  -[UIKBLocalAuthenticationObserver dealloc](&v3, sel_dealloc);
}

- (BOOL)_applicationStateIsActive
{
  void *v2;
  char v3;

  if (!objc_msgSend((id)UIApp, "applicationState"))
    return 1;
  +[UIWindow _applicationKeyWindow](UIWindow, "_applicationKeyWindow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_isHostedInAnotherProcess");

  return v3;
}

- (void)_localAuthenticationPresented
{
  BOOL v3;
  void *v4;
  id v5;

  -[UIKBLocalAuthenticationObserver setLocalAuthenticationPresented:](self, "setLocalAuthenticationPresented:", 1);
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "textInputTraitsNeedAutofill")
    || !-[UIKBLocalAuthenticationObserver _applicationStateIsActive](self, "_applicationStateIsActive"))
  {
    goto LABEL_8;
  }
  if (!+[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess"))
  {

    goto LABEL_7;
  }
  v3 = +[UIKeyboard usesInputSystemUIForAutoFillOnlyWithRTI](UIKeyboard, "usesInputSystemUIForAutoFillOnlyWithRTI");

  if (v3)
  {
LABEL_7:
    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_preserveInputViewsWithId:animated:reset:", v4, 1, 0);

LABEL_8:
  }
}

- (void)_localAuthenticationDismissed
{
  void *v3;
  void *v4;
  void *v5;

  -[UIKBLocalAuthenticationObserver setLocalAuthenticationPresented:](self, "setLocalAuthenticationPresented:", 0);
  if (+[UIKeyboard isInputSystemUI](UIKeyboard, "isInputSystemUI")
    && !-[UIKBLocalAuthenticationObserver _applicationStateIsActive](self, "_applicationStateIsActive"))
  {
    -[UIKBLocalAuthenticationObserver setInputUIResuming:](self, "setInputUIResuming:", 1);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__applicationResumed_, CFSTR("UIApplicationResumedNotification"), UIApp);

  }
  if (!+[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess")
    || +[UIKeyboard usesInputSystemUIForAutoFillOnlyWithRTI](UIKeyboard, "usesInputSystemUIForAutoFillOnlyWithRTI"))
  {
    -[UIKBLocalAuthenticationObserver setIsRestoringInputViews:](self, "setIsRestoringInputViews:", 1);
    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_restoreInputViewsWithId:animated:", v5, 1);

    -[UIKBLocalAuthenticationObserver setIsRestoringInputViews:](self, "setIsRestoringInputViews:", 0);
  }
}

- (void)_applicationResumed:(id)a3
{
  id v4;

  -[UIKBLocalAuthenticationObserver setInputUIResuming:](self, "setInputUIResuming:", 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("UIApplicationResumedNotification"), 0);

}

- (BOOL)localAuthenticationPresentedOrBeingRecoveredFrom
{
  return -[UIKBLocalAuthenticationObserver localAuthenticationPresented](self, "localAuthenticationPresented")
      || -[UIKBLocalAuthenticationObserver isRestoringPreLocalAuthenticationDelegate](self, "isRestoringPreLocalAuthenticationDelegate")|| -[UIKBLocalAuthenticationObserver isRestoringInputViews](self, "isRestoringInputViews")|| -[UIKBLocalAuthenticationObserver inputUIResuming](self, "inputUIResuming");
}

- (void)_stopListeningForLAUINotifications
{
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v4;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.LocalAuthentication.ui.presented"), 0);
  v4 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v4, self, CFSTR("com.apple.LocalAuthentication.ui.dismissed"), 0);
  self->_isListeningForLAUINotifications = 0;
}

- (void)setLocalAuthenticationPresented:(BOOL)a3
{
  self->_localAuthenticationPresented = a3;
}

- (void)setDelegateResignedDuringLocalAuthentication:(id)a3
{
  objc_storeWeak((id *)&self->_delegateResignedDuringLocalAuthentication, a3);
}

- (NSUUID)uuidOfDelegateResignedDuringLocalAuthentication
{
  return self->_uuidOfDelegateResignedDuringLocalAuthentication;
}

- (void)setUuidOfDelegateResignedDuringLocalAuthentication:(id)a3
{
  objc_storeStrong((id *)&self->_uuidOfDelegateResignedDuringLocalAuthentication, a3);
}

- (NSUUID)uuidOfSessionEndedDuringLocalAuthentication
{
  return self->_uuidOfSessionEndedDuringLocalAuthentication;
}

- (void)setUuidOfSessionEndedDuringLocalAuthentication:(id)a3
{
  objc_storeStrong((id *)&self->_uuidOfSessionEndedDuringLocalAuthentication, a3);
}

- (BOOL)isRestoringPreLocalAuthenticationDelegate
{
  return self->_isRestoringPreLocalAuthenticationDelegate;
}

- (void)setIsRestoringPreLocalAuthenticationDelegate:(BOOL)a3
{
  self->_isRestoringPreLocalAuthenticationDelegate = a3;
}

- (BOOL)inputUIResuming
{
  return self->_inputUIResuming;
}

- (void)setInputUIResuming:(BOOL)a3
{
  self->_inputUIResuming = a3;
}

- (BOOL)isRestoringInputViews
{
  return self->_isRestoringInputViews;
}

- (void)setIsRestoringInputViews:(BOOL)a3
{
  self->_isRestoringInputViews = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuidOfSessionEndedDuringLocalAuthentication, 0);
  objc_storeStrong((id *)&self->_uuidOfDelegateResignedDuringLocalAuthentication, 0);
  objc_destroyWeak((id *)&self->_delegateResignedDuringLocalAuthentication);
}

@end
