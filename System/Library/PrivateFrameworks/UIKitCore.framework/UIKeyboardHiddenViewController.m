@implementation UIKeyboardHiddenViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (UIKeyboardHiddenViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  UIKeyboardHiddenViewController *v4;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v6;
  _SFPasswordViewController *autofillVC;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)UIKeyboardHiddenViewController;
  v4 = -[UIViewController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, a3, a4);
  if (v4)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v4, (CFNotificationCallback)UIKBLADarwinUIPresented, CFSTR("com.apple.LocalAuthentication.ui.presented"), 0, (CFNotificationSuspensionBehavior)0);
    v6 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v6, v4, (CFNotificationCallback)UIKBLADarwinUIDismissed, CFSTR("com.apple.LocalAuthentication.ui.dismissed"), 0, (CFNotificationSuspensionBehavior)0);
    objc_storeStrong((id *)&__UIKBCurrentHiddenViewController, v4);
    -[UIViewController setModalPresentationStyle:](v4, "setModalPresentationStyle:", 4);
    autofillVC = v4->_autofillVC;
    v4->_autofillVC = 0;

  }
  return v4;
}

- (void)dealloc
{
  void *v3;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v5;
  objc_super v6;

  if ((UIKeyboardHiddenViewController *)__UIKBCurrentHiddenViewController == self)
  {
    __UIKBCurrentHiddenViewController = 0;

  }
  if (self->_presentedAutofill)
  {
    +[UIPeripheralHost activeInstance](UIPeripheralHost, "activeInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setDeactivatedKeyboard:forScene:", 0, 0);

    self->_presentedAutofill = 0;
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.LocalAuthentication.ui.presented"), 0);
  v5 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v5, self, CFSTR("com.apple.LocalAuthentication.ui.dismissed"), 0);
  v6.receiver = self;
  v6.super_class = (Class)UIKeyboardHiddenViewController;
  -[UIViewController dealloc](&v6, sel_dealloc);
}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v6;
  id v7;
  UIKeyboardVCPresentationController *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[UIPresentationController initWithPresentedViewController:presentingViewController:]([UIKeyboardVCPresentationController alloc], "initWithPresentedViewController:presentingViewController:", v7, v6);

  return v8;
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v3 = a3;
  if (!self->_presentedAutofill)
  {
    if (!objc_msgSend((id)UIApp, "isSuspended")
      || (+[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate"), v5 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(v5, "containerWindow"), v6 = (void *)objc_claimAutoreleasedReturnValue(), v7 = objc_msgSend(v6, "_isHostedInAnotherProcess"), v6, v5, v7))
    {
      self->_presentedAutofill = 1;
      +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", self);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_preserveInputViewsWithId:animated:", v9, 1);

      +[UIPeripheralHost activeInstance](UIPeripheralHost, "activeInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setDeactivatedKeyboard:forScene:", 1, 0);

    }
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObserver:selector:name:object:", self, sel__deviceWillLock_, CFSTR("UIApplicationProtectedDataWillBecomeUnavailable"), 0);

  v12.receiver = self;
  v12.super_class = (Class)UIKeyboardHiddenViewController;
  -[UIViewController viewWillAppear:](&v12, sel_viewWillAppear_, v3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("UIApplicationProtectedDataWillBecomeUnavailable"), 0);

  v6.receiver = self;
  v6.super_class = (Class)UIKeyboardHiddenViewController;
  -[UIViewController viewWillDisappear:](&v6, sel_viewWillDisappear_, v3);
}

- (void)_localAuthenticationUIPresented
{
  void *v3;
  _QWORD v4[5];

  if (!self->_presentedAutofill && !+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
  {
    +[UIPeripheralHost activeInstance](UIPeripheralHost, "activeInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __65__UIKeyboardHiddenViewController__localAuthenticationUIPresented__block_invoke;
    v4[3] = &unk_1E16B1B28;
    v4[4] = self;
    objc_msgSend(v3, "performWithoutDeactivation:", v4);

  }
}

void __65__UIKeyboardHiddenViewController__localAuthenticationUIPresented__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_preserveInputViewsWithId:animated:", v2, 1);

}

- (void)_localAuthenticationUIDismissed
{
  void *v3;
  _QWORD v4[5];

  if (!self->_presentedAutofill)
  {
    +[UIPeripheralHost activeInstance](UIPeripheralHost, "activeInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __65__UIKeyboardHiddenViewController__localAuthenticationUIDismissed__block_invoke;
    v4[3] = &unk_1E16B1B28;
    v4[4] = self;
    objc_msgSend(v3, "performWithoutDeactivation:", v4);

  }
}

void __65__UIKeyboardHiddenViewController__localAuthenticationUIDismissed__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_restoreInputViewsWithId:animated:", v2, 1);

}

- (void)passwordViewControllerDidFinish:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  +[UITextEffectsWindow sharedTextEffectsWindowForWindowScene:](UITextEffectsWindow, "sharedTextEffectsWindowForWindowScene:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rootViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setDontDismissKeyboardOnScrolling:", 0);
  if (self->_presentedAutofill)
  {
    +[UIPeripheralHost activeInstance](UIPeripheralHost, "activeInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDeactivatedKeyboard:forScene:", 0, 0);

    self->_presentedAutofill = 0;
  }
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66__UIKeyboardHiddenViewController_passwordViewControllerDidFinish___block_invoke;
  v7[3] = &unk_1E16B1B28;
  v7[4] = self;
  _AttemptDismiss(self, v7);

}

void __66__UIKeyboardHiddenViewController_passwordViewControllerDidFinish___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  id v5;

  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "_restoreInputViewsWithId:animated:", v3, 1);

  if ((v4 & 1) == 0)
  {
    +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "restorePreservedInputViewsIfNecessary");

  }
}

- (void)_deviceWillLock:(id)a3
{
  -[UIKeyboardHiddenViewController passwordViewControllerDidFinish:](self, "passwordViewControllerDidFinish:", 0);
}

- (BOOL)shouldPresentAsPopover
{
  void *v2;
  void *v3;
  BOOL v4;

  if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) != 1)
    return 0;
  +[UIWindow _applicationKeyWindow](UIWindow, "_applicationKeyWindow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "horizontalSizeClass") != 1;

  return v4;
}

- (void)presentSelfWithAnimation:(BOOL)a3
{
  void *v5;
  void *v6;
  _QWORD v7[5];
  BOOL v8;

  -[UIViewController setTransitioningDelegate:](self, "setTransitioningDelegate:", self);
  +[UITextEffectsWindow sharedTextEffectsWindowForWindowScene:](UITextEffectsWindow, "sharedTextEffectsWindowForWindowScene:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rootViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__UIKeyboardHiddenViewController_presentSelfWithAnimation___block_invoke;
  v7[3] = &unk_1E16B1B78;
  v7[4] = self;
  v8 = a3;
  objc_msgSend(v6, "presentViewController:animated:completion:", self, 0, v7);

}

uint64_t __59__UIKeyboardHiddenViewController_presentSelfWithAnimation___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 32), "_window");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_isHostedInAnotherProcess");

  if (v3)
  {
    v4 = *(id *)(a1 + 32);
    v5 = (void *)s_presentations;
    if (!s_presentations)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)s_presentations;
      s_presentations = v6;

      v5 = (void *)s_presentations;
    }
    objc_msgSend(v5, "addObject:", v4);

  }
  return objc_msgSend(*(id *)(a1 + 32), "presentAutofillVCWithAnimation:", *(unsigned __int8 *)(a1 + 40));
}

- (void)presentAutofillVCWithAnimation:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  +[UITextEffectsWindow sharedTextEffectsWindowForWindowScene:](UITextEffectsWindow, "sharedTextEffectsWindowForWindowScene:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rootViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setDontDismissKeyboardOnScrolling:", 1);
  -[_SFPasswordViewController setModalPresentationStyle:](self->_autofillVC, "setModalPresentationStyle:", 3);
  -[UIViewController setDefinesPresentationContext:](self, "setDefinesPresentationContext:", 1);
  -[UIKeyboardHiddenViewController presentViewController:](self, "presentViewController:", v3);

}

- (void)presentViewController:(BOOL)a3
{
  -[UIViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", self->_autofillVC, a3, 0);
}

- (BOOL)_formSheetObeysContentContainerSize
{
  return 1;
}

- (void)_sceneDidChange
{
  void *v3;
  void *v4;
  char v5;
  _QWORD v6[5];
  char v7;

  -[UIViewController presentingViewController](self, "presentingViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (!self->_processingSceneDidChange)
    {
      self->_processingSceneDidChange = 1;
      +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "snapshotting") ^ 1;

      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __49__UIKeyboardHiddenViewController__sceneDidChange__block_invoke;
      v6[3] = &unk_1E16B1B78;
      v7 = v5;
      v6[4] = self;
      _AttemptDismiss(self, v6);
    }
  }
}

uint64_t __49__UIKeyboardHiddenViewController__sceneDidChange__block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = result;
  if (*(_BYTE *)(result + 40))
    result = objc_msgSend(*(id *)(result + 32), "presentSelfWithAnimation:", 0);
  *(_BYTE *)(*(_QWORD *)(v1 + 32) + 977) = 0;
  return result;
}

- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  objc_super v17;
  CGSize result;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  if (-[UIKeyboardHiddenViewController shouldPresentAsPopover](self, "shouldPresentAsPopover"))
  {
    -[UIViewController presentationController](self, "presentationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sizeForChildContentContainer:withParentContainerSize:", v7, width, height);
    v10 = v9;
    v12 = v11;

  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)UIKeyboardHiddenViewController;
    -[UIViewController sizeForChildContentContainer:withParentContainerSize:](&v17, sel_sizeForChildContentContainer_withParentContainerSize_, v7, width, height);
    v10 = v13;
    v12 = v14;
  }

  v15 = v10;
  v16 = v12;
  result.height = v16;
  result.width = v15;
  return result;
}

- (_SFPasswordViewController)autofillVC
{
  return self->_autofillVC;
}

- (void)setAutofillVC:(id)a3
{
  objc_storeStrong((id *)&self->_autofillVC, a3);
}

- (BOOL)presentedAutofill
{
  return self->_presentedAutofill;
}

- (void)setPresentedAutofill:(BOOL)a3
{
  self->_presentedAutofill = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autofillVC, 0);
}

void __65__UIKeyboardHiddenViewController_Autofill_presentViewController___block_invoke(uint64_t a1, int a2)
{
  _QWORD *v3;
  _QWORD v4[5];
  _QWORD *v5;
  char v6;

  if (a2)
  {
    v3 = *(_QWORD **)(a1 + 32);
    if (v3 && v3[15])
    {
      v4[0] = MEMORY[0x1E0C809B0];
      v4[1] = 3221225472;
      v4[2] = __65__UIKeyboardHiddenViewController_Autofill_presentViewController___block_invoke_2;
      v4[3] = &unk_1E16B4008;
      v4[4] = *(_QWORD *)(a1 + 40);
      v5 = v3;
      v6 = *(_BYTE *)(a1 + 48);
      _AttemptDismiss(v5, v4);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "presentViewController:animated:completion:");
    }
  }
}

uint64_t __65__UIKeyboardHiddenViewController_Autofill_presentViewController___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), 0);
}

void __59__UIKeyboardHiddenViewController_Autofill_isValidedString___block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3780], "illegalCharacterSet");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_1158;
  _MergedGlobals_1158 = v0;

  v2 = (void *)_MergedGlobals_1158;
  objc_msgSend(MEMORY[0x1E0CB3500], "controlCharacterSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "formUnionWithCharacterSet:", v3);

  v4 = (void *)_MergedGlobals_1158;
  objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "formUnionWithCharacterSet:", v5);

}

@end
