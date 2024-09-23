@implementation UIKeyboardAutomatic

+ (id)activeInstance
{
  return (id)_MergedGlobals_7_13;
}

void __37__UIKeyboardAutomatic_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  void *v3;

  v1 = objc_alloc(*(Class *)(a1 + 32));
  v2 = objc_msgSend(v1, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v3 = (void *)_MergedGlobals_7_13;
  _MergedGlobals_7_13 = v2;

}

- (UIKeyboardAutomatic)initWithFrame:(CGRect)a3
{
  UIKeyboardAutomatic *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIKeyboardAutomatic;
  v3 = -[UIKeyboard initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel_willResume_, CFSTR("UIApplicationWillEnterForegroundNotification"), 0);
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel_didSuspend_, CFSTR("UIApplicationDidEnterBackgroundNotification"), 0);

  }
  return v3;
}

- (void)activate
{
  void *v3;
  void *v4;
  int v5;
  objc_super v6;

  +[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && !-[UIKeyboardAutomatic isActive](self, "isActive"))
  {
    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "automaticAppearanceReallyEnabled");

    if (!v5)
      return;
  }
  else
  {

  }
  v6.receiver = self;
  v6.super_class = (Class)UIKeyboardAutomatic;
  -[UIKeyboard activate](&v6, sel_activate);
}

- (BOOL)isActive
{
  void *v2;
  void *v3;
  char v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIKeyboardAutomatic;
  if (!-[UIKeyboard isActive](&v6, sel_isActive))
    return 0;
  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "responder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = 1;
  else
    v4 = UIKeyboardAutomaticIsOnScreen();

  return v4;
}

- (BOOL)isAutomatic
{
  return 1;
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__UIKeyboardAutomatic_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECD7B3F8 != -1)
    dispatch_once(&qword_1ECD7B3F8, block);
  return (id)_MergedGlobals_7_13;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = CFSTR("UIApplicationWillEnterForegroundNotification");
  v6[1] = CFSTR("UIApplicationDidEnterBackgroundNotification");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSNotificationCenter _uiRemoveObserver:names:](v3, self, v4);

  v5.receiver = self;
  v5.super_class = (Class)UIKeyboardAutomatic;
  -[UIKeyboard dealloc](&v5, sel_dealloc);
}

- (void)minimize
{
  id v2;

  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "minimize");

}

- (void)maximize
{
  id v2;

  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "maximize");

}

- (UIPeripheralAnimationGeometry)geometryForHeightDelta:(SEL)a3
{
  int64_t v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  CGFloat v23;
  uint64_t v24;
  __int128 v25;
  UIPeripheralAnimationGeometry *result;
  id v27;

  +[UIPeripheralHost sharedInstance](UIPeripheralHost, "sharedInstance");
  v27 = (id)objc_claimAutoreleasedReturnValue();
  retstr->outPosition = 0u;
  retstr->inPosition = 0u;
  retstr->bounds.origin = 0u;
  retstr->bounds.size = 0u;
  *(_OWORD *)&retstr->transform.a = 0u;
  *(_OWORD *)&retstr->transform.c = 0u;
  *(_OWORD *)&retstr->transform.tx = 0u;
  retstr->targetFrameHeightDelta = 0.0;
  v7 = -[UIView _keyboardOrientation](self, "_keyboardOrientation");
  retstr->bounds.origin.x = 0.0;
  retstr->bounds.origin.y = 0.0;
  +[UIKeyboard sizeForInterfaceOrientation:](UIKeyboard, "sizeForInterfaceOrientation:", v7);
  v9 = v8;
  v11 = v10;
  retstr->bounds.size.width = v8;
  retstr->bounds.size.height = v10;
  objc_msgSend(v27, "inputViews");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "inputAccessoryView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v27, "inputViews");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "inputAccessoryView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "frame");
    v11 = v11 + v16;
    retstr->bounds.size.height = v11;

  }
  objc_msgSend(v27, "containerWindow");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "bounds");
  v19 = v18;

  v20 = v9 * 0.5;
  v21 = v19 - v11 * 0.5;
  retstr->inPosition.x = v20;
  retstr->inPosition.y = v21;
  retstr->outPosition.x = v20;
  retstr->outPosition.y = v21 + a4;
  if (-[UIKeyboard isMinimized](self, "isMinimized"))
  {
    retstr->inPosition.y = v11 + v21;
    retstr->outPosition.y = v11 + v21 + a4;
  }
  if (objc_msgSend(v27, "isUndocked"))
  {
    objc_msgSend(v27, "adjustedPersistentOffset");
    CGAffineTransformMakeTranslation(&retstr->transform, v22, v23);
  }
  else
  {
    v24 = MEMORY[0x1E0C9BAA8];
    v25 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&retstr->transform.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&retstr->transform.c = v25;
    *(_OWORD *)&retstr->transform.tx = *(_OWORD *)(v24 + 32);
  }
  retstr->targetFrameHeightDelta = a4;

  return result;
}

- (void)prepareForImplBoundsHeightChange:(double)a3 suppressNotification:(BOOL)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _OWORD v10[7];
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  if (!a4)
  {
    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "inputViews");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "inputView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v19 = 0;
      v17 = 0u;
      v18 = 0u;
      v15 = 0u;
      v16 = 0u;
      v13 = 0u;
      v14 = 0u;
      v12 = 0u;
      -[UIKeyboardAutomatic geometryForHeightDelta:](self, "geometryForHeightDelta:", a3);
      +[UIPeripheralHost sharedInstance](UIPeripheralHost, "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10[4] = v16;
      v10[5] = v17;
      v10[6] = v18;
      v11 = v19;
      v10[0] = v12;
      v10[1] = v13;
      v10[2] = v14;
      v10[3] = v15;
      objc_msgSend(v9, "postWillShowNotificationForGeometry:duration:", v10, 0.0);

    }
  }
}

- (void)implBoundsHeightChangeDone:(double)a3 suppressNotification:(BOOL)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _OWORD v11[7];
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;

  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "inputViews");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "inputView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    self->super.m_respondingToImplGeometryChange = 1;
    -[UIView frame](self, "frame");
    -[UIKeyboard setFrame:](self, "setFrame:");
    v20 = 0;
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v13 = 0u;
    -[UIKeyboardAutomatic geometryForHeightDelta:](self, "geometryForHeightDelta:", a3);
    self->super.m_respondingToImplGeometryChange = 0;
    if (!a4)
    {
      +[UIPeripheralHost sharedInstance](UIPeripheralHost, "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11[4] = v17;
      v11[5] = v18;
      v11[6] = v19;
      v12 = v20;
      v11[0] = v13;
      v11[1] = v14;
      v11[2] = v15;
      v11[3] = v16;
      objc_msgSend(v10, "postDidShowNotificationForGeometry:", v11);

    }
  }
}

- (void)willResume:(id)a3
{
  UIKeyboardAutomatic *v4;
  UIKeyboardAutomatic *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v15;
  void *v16;
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
  char v28;
  void *v29;
  id v30;

  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate", a3);
  v30 = (id)objc_claimAutoreleasedReturnValue();
  +[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard");
  v4 = (UIKeyboardAutomatic *)objc_claimAutoreleasedReturnValue();
  if (v4 != self)
  {

LABEL_3:
    if (+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
    {
      +[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard");
      v5 = (UIKeyboardAutomatic *)objc_claimAutoreleasedReturnValue();

      if (v5 == self)
        -[UIKeyboardAutomatic activate](self, "activate");
    }
    goto LABEL_20;
  }
  -[UIKeyboard window](self, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    goto LABEL_3;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKeyboardImpl suppressSetPersistentOffset:](UIKeyboardImpl, "suppressSetPersistentOffset:", 1);
  if (v7)
  {
    objc_msgSend(v7, "size");
    v9 = v8;
    v11 = v10;
    -[UIView frame](self, "frame");
    if (v9 != v13 || v11 != v12)
    {
      objc_msgSend(v7, "size");
      +[UIKBKeyplaneChangeContext keyplaneChangeContextWithSize:](UIKBKeyplaneChangeContext, "keyplaneChangeContextWithSize:");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKeyboardAutomatic _didChangeKeyplaneWithContext:](self, "_didChangeKeyplaneWithContext:", v15);

    }
  }
  -[UIKeyboardAutomatic activate](self, "activate");
  +[UIPeripheralHost sharedInstance](UIPeripheralHost, "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "responder");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "_requiresKeyboardWhenFirstResponder"))
  {
    objc_msgSend(v30, "updateRenderConfigForCurrentResponder");
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "setReceivedCandidatesInCurrentInputMode:", -[UIKeyboardAutomatic receivedCandidatesInCurrentInputMode](self, "receivedCandidatesInCurrentInputMode"));
    objc_msgSend(v18, "setShowsCandidateBar:", -[UIKeyboardAutomatic showsCandidateBar](self, "showsCandidateBar"));
    objc_msgSend(v18, "setShowsCandidateInline:", -[UIKeyboardAutomatic showsCandidateInline](self, "showsCandidateInline"));
    objc_msgSend(v18, "setDelegate:", 0);
    objc_msgSend(v17, "_keyboardResponder");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setDelegate:", v19);

    if ((objc_msgSend(v18, "_shouldSuppressSoftwareKeyboard") & 1) != 0)
      v20 = 1;
    else
      v20 = objc_msgSend(v18, "_shouldMinimizeForHardwareKeyboard");
    -[UIKeyboard setMinimized:](self, "setMinimized:", v20);
    objc_msgSend(v16, "moveToPersistentOffset");
    objc_msgSend(v16, "setKeyboardOnScreenNotifyKey:", -[UIKeyboard isMinimized](self, "isMinimized") ^ 1);
    +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "_trackInputModeIfNecessary:", v17);

    -[UIKeyboardAutomatic lastMatchedSupplementalCandidate](self, "lastMatchedSupplementalCandidate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setLastMatchedSupplementalCandidate:", v22);

    -[UIKeyboardAutomatic pendingSupplementalCandidateToInsert](self, "pendingSupplementalCandidateToInsert");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setPendingSupplementalCandidateToInsert:", v23);

    objc_msgSend(v18, "setLastChooseSupplementalItemToInsertCallbackIdentifier:", -[UIKeyboardAutomatic lastChooseSupplementalItemToInsertCallbackIdentifier](self, "lastChooseSupplementalItemToInsertCallbackIdentifier"));
  }
  else
  {
    objc_msgSend(v30, "forceOrderOutAutomaticExceptAccessoryView");
    v18 = v7;
  }
  +[UIKeyboardImpl suppressSetPersistentOffset:](UIKeyboardImpl, "suppressSetPersistentOffset:", 0);
  objc_msgSend(v30, "_updateContainerWindowLevel");

LABEL_20:
  if (-[UIKeyboard isMinimized](self, "isMinimized"))
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v24 = objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      v25 = (void *)v24;
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v26, "_shouldSuppressSoftwareKeyboard"))
      {

      }
      else
      {
        +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "_shouldMinimizeForHardwareKeyboard");

        if ((v28 & 1) == 0)
        {
          self->super.m_minimized = 0;
          objc_msgSend(v30, "maximizeWithAnimation:", 0);
        }
      }
    }
  }
  -[UIKeyboardAutomatic blinkAssertion](self, "blinkAssertion");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "invalidate");

  -[UIKeyboardAutomatic setBlinkAssertion:](self, "setBlinkAssertion:", 0);
}

- (void)didSuspend:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance", a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardAutomatic setReceivedCandidatesInCurrentInputMode:](self, "setReceivedCandidatesInCurrentInputMode:", objc_msgSend(v9, "receivedCandidatesInCurrentInputMode"));
  -[UIKeyboardAutomatic setShowsCandidateBar:](self, "setShowsCandidateBar:", objc_msgSend(v9, "showsCandidateBar"));
  -[UIKeyboardAutomatic setShowsCandidateInline:](self, "setShowsCandidateInline:", objc_msgSend(v9, "showsCandidateInline"));
  objc_msgSend(v9, "lastMatchedSupplementalCandidate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardAutomatic setLastMatchedSupplementalCandidate:](self, "setLastMatchedSupplementalCandidate:", v4);

  objc_msgSend(v9, "pendingSupplementalCandidateToInsert");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardAutomatic setPendingSupplementalCandidateToInsert:](self, "setPendingSupplementalCandidateToInsert:", v5);

  -[UIKeyboardAutomatic setLastChooseSupplementalItemToInsertCallbackIdentifier:](self, "setLastChooseSupplementalItemToInsertCallbackIdentifier:", objc_msgSend(v9, "lastChooseSupplementalItemToInsertCallbackIdentifier"));
  if (objc_msgSend(v9, "caretBlinks"))
  {
    objc_msgSend(v9, "_activeAssertionController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "nonBlinkingAssertionWithReason:", CFSTR("UIKeyboardAutomatic Suspend/Resume"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardAutomatic setBlinkAssertion:](self, "setBlinkAssertion:", v7);

  }
  +[UIPeripheralHost sharedInstance](UIPeripheralHost, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setKeyboardOnScreenNotifyKey:", 0);

}

- (BOOL)_isAutomaticKeyboard
{
  return 1;
}

- (void)_didChangeKeyplaneWithContext:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  if (objc_msgSend(v4, "sizeDidChange") && objc_msgSend(v4, "isDynamicLayout"))
    -[UIView layoutIfNeeded](self, "layoutIfNeeded");
  v5.receiver = self;
  v5.super_class = (Class)UIKeyboardAutomatic;
  -[UIKeyboard _didChangeKeyplaneWithContext:](&v5, sel__didChangeKeyplaneWithContext_, v4);

}

- (BOOL)showsCandidateBar
{
  return self->showsCandidateBar;
}

- (void)setShowsCandidateBar:(BOOL)a3
{
  self->showsCandidateBar = a3;
}

- (BOOL)showsCandidateInline
{
  return self->showsCandidateInline;
}

- (void)setShowsCandidateInline:(BOOL)a3
{
  self->showsCandidateInline = a3;
}

- (BOOL)receivedCandidatesInCurrentInputMode
{
  return self->receivedCandidatesInCurrentInputMode;
}

- (void)setReceivedCandidatesInCurrentInputMode:(BOOL)a3
{
  self->receivedCandidatesInCurrentInputMode = a3;
}

- (UITextCursorAssertion)blinkAssertion
{
  return self->_blinkAssertion;
}

- (void)setBlinkAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_blinkAssertion, a3);
}

- (_UIStringAndPositionPair)lastMatchedSupplementalCandidate
{
  return self->_lastMatchedSupplementalCandidate;
}

- (void)setLastMatchedSupplementalCandidate:(id)a3
{
  objc_storeStrong((id *)&self->_lastMatchedSupplementalCandidate, a3);
}

- (_UIStringAndPositionPair)pendingSupplementalCandidateToInsert
{
  return self->_pendingSupplementalCandidateToInsert;
}

- (void)setPendingSupplementalCandidateToInsert:(id)a3
{
  objc_storeStrong((id *)&self->_pendingSupplementalCandidateToInsert, a3);
}

- (unint64_t)lastChooseSupplementalItemToInsertCallbackIdentifier
{
  return self->_lastChooseSupplementalItemToInsertCallbackIdentifier;
}

- (void)setLastChooseSupplementalItemToInsertCallbackIdentifier:(unint64_t)a3
{
  self->_lastChooseSupplementalItemToInsertCallbackIdentifier = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingSupplementalCandidateToInsert, 0);
  objc_storeStrong((id *)&self->_lastMatchedSupplementalCandidate, 0);
  objc_storeStrong((id *)&self->_blinkAssertion, 0);
}

@end
