@implementation UIResponder

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__layeringSceneIdentity, 0);
}

- (BOOL)_resignIfContainsFirstResponder
{
  void *v3;
  UIResponder *v4;
  UIResponder *v5;
  void *v6;
  void *v7;
  int v8;

  -[UIResponder _responderWindow](self, "_responderWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_firstResponder");
  v4 = (UIResponder *)objc_claimAutoreleasedReturnValue();

  if (!v4 || v4 == self)
  {
    v5 = v4;
    if (v4 != self)
    {
LABEL_12:
      LOBYTE(v8) = 0;
      goto LABEL_14;
    }
  }
  else
  {
    do
    {
      if (!-[UIResponder _canResignIfContainsFirstResponder](v4, "_canResignIfContainsFirstResponder"))
      {
        LOBYTE(v8) = 0;
        v5 = v4;
        goto LABEL_14;
      }
      -[UIResponder nextResponder](v4, "nextResponder");
      v5 = (UIResponder *)objc_claimAutoreleasedReturnValue();

      if (!v5)
        break;
      v4 = v5;
    }
    while (v5 != self);
    if (v5 != self)
      goto LABEL_12;
  }
  -[UIResponder _responderWindow](self, "_responderWindow");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_firstResponder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "resignFirstResponder");
  if (v8 && objc_msgSend(v7, "_canBecomeFirstResponderWhenPossible"))
    objc_msgSend(v7, "_becomeFirstResponderWhenPossible");

LABEL_14:
  return v8;
}

- (BOOL)_canResignIfContainsFirstResponder
{
  return 1;
}

- (UIView)inputAccessoryView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[UIResponder nextResponder](self, "nextResponder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inputAccessoryView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "_nextResponderOverride");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[UIResponder nextResponder](self, "nextResponder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_overrideInputAccessoryViewNextResponderWithResponder:", v6);

  }
  return (UIView *)v4;
}

- (id)_responderWindow
{
  void *v2;
  void *v3;

  -[UIResponder nextResponder](self, "nextResponder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_responderWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_nextResponderOverride
{
  void *v2;
  void *v3;

  if ((*(_WORD *)&self->_responderFlags & 1) != 0)
  {
    objc_getAssociatedObject(self, &_MergedGlobals_1191);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "target");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (void)_clearRestorableResponderStatus
{
  void *v3;
  _QWORD v4[5];

  objc_getAssociatedObject(self, &_UIRestorableResponderKey);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "BOOLValue"))
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __46__UIResponder__clearRestorableResponderStatus__block_invoke;
    v4[3] = &unk_1E16C1E50;
    v4[4] = self;
    +[UIKeyboardSceneDelegate performOnControllers:](UIKeyboardSceneDelegate, "performOnControllers:", v4);
    objc_setAssociatedObject(self, &_UIRestorableResponderKey, 0, (void *)1);
  }

}

- (id)_intersectionOfRange:(id)a3 andRange:(id)a4
{
  id v6;
  id v7;
  UIResponder *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_msgSend(v6, "start");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "start");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[UIResponder comparePosition:toPosition:](v8, "comparePosition:toPosition:", v9, v10) == 1)
    v11 = v6;
  else
    v11 = v7;
  objc_msgSend(v11, "start");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "end");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "end");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[UIResponder comparePosition:toPosition:](v8, "comparePosition:toPosition:", v13, v14) == -1)
    v15 = v6;
  else
    v15 = v7;
  objc_msgSend(v15, "end");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIResponder textRangeFromPosition:toPosition:](v8, "textRangeFromPosition:toPosition:", v12, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)_textRangeFromNSRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;

  length = a3.length;
  location = a3.location;
  -[UIResponder _selectableText](self, "_selectableText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "beginningOfDocument");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "positionFromPosition:offset:", v6, location);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(v5, "endOfDocument");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  objc_msgSend(v5, "positionFromPosition:offset:", v10, length);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = v11;
  }
  else
  {
    objc_msgSend(v5, "endOfDocument");
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  v14 = v13;

  objc_msgSend(v5, "textRangeFromPosition:toPosition:", v10, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)_selectableText
{
  void *v3;
  void *v4;
  id v5;

  -[UIResponder _textSelectingContainer](self, "_textSelectingContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = self;
  v5 = v3;

  return v5;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[UIResponder _userActivity](self, "_userActivity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)MEMORY[0x186DC9484]();
    objc_msgSend((id)UIApp, "_removeResponder:forUserActivity:", self, v3);
    objc_autoreleasePoolPop(v4);
  }
  -[UIResponder _clearRestorableResponderStatus](self, "_clearRestorableResponderStatus");

  v5.receiver = self;
  v5.super_class = (Class)UIResponder;
  -[UIResponder dealloc](&v5, sel_dealloc);
}

- (void)_clearOverrideNextResponder
{
  void *v3;
  __int16 responderFlags;

  v3 = (void *)MEMORY[0x186DC9484](self, a2);
  responderFlags = (__int16)self->_responderFlags;
  if ((responderFlags & 2) != 0)
  {
    objc_setAssociatedObject(self, &unk_1ECD7F851, 0, (void *)1);
    responderFlags = *(_WORD *)&self->_responderFlags & 0xFFFD;
    *(_WORD *)&self->_responderFlags = responderFlags;
  }
  if ((responderFlags & 1) != 0)
  {
    objc_setAssociatedObject(self, &_MergedGlobals_1191, 0, (void *)1);
    *(_WORD *)&self->_responderFlags &= ~1u;
  }
  objc_autoreleasePoolPop(v3);
}

- (id)_userActivity
{
  return objc_getAssociatedObject(self, &kResponderUserActivityKey);
}

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
  id v6;
  void *v15;
  void *v16;
  BOOL v17;
  uint64_t v18;
  void *v19;
  void *v20;
  BOOL v21;
  char v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;

  v6 = sender;
  if (sel_paste_ == action)
  {
    v18 = +[UIResponder instanceMethodForSelector:](UIResponder, "instanceMethodForSelector:", sel_canPasteItemProviders_);
    if (v18 == -[UIResponder methodForSelector:](self, "methodForSelector:", sel_canPasteItemProviders_))
    {
      -[UIResponder _effectivePasteConfiguration](self, "_effectivePasteConfiguration");
      v23 = objc_claimAutoreleasedReturnValue();
      if (v23)
      {
        v24 = (void *)v23;
        +[UIPasteboard generalPasteboard](UIPasteboard, "generalPasteboard");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "itemProviders");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = _UICanPasteItemProviders(v24, v26);

        if ((v27 & 1) != 0)
          goto LABEL_42;
      }
    }
    else
    {
      +[UIPasteboard generalPasteboard](UIPasteboard, "generalPasteboard");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "itemProviders");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = -[UIResponder canPasteItemProviders:](self, "canPasteItemProviders:", v20);

      if (v21)
        goto LABEL_42;
    }
  }
  if (-[UIResponder _handleActivityItemsConfigurationCanPerformAction:sender:](self, "_handleActivityItemsConfigurationCanPerformAction:sender:", action, v6))
  {
LABEL_42:
    v17 = 1;
    goto LABEL_48;
  }
  if (sel__define_ == action
    || sel_define_ == action
    || sel__lookup_ == action
    || sel_lookup_ == action
    || sel__translate_ == action
    || sel__share_ == action
    || sel_share_ == action
    || sel__addShortcut_ == action
    || sel_addShortcut_ == action)
  {
    -[UIResponder _textServicesResponderProxy](self, "_textServicesResponderProxy");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = v15 && (objc_msgSend(v15, "canPerformAction:withSender:", action, v6) & 1) != 0;

  }
  else
  {
    if (sel_captureTextFromCamera_ == action)
    {
      if (!+[UIKeyboardCameraSession isEnabled](UIKeyboardCameraSession, "isEnabled"))
      {
        v17 = 0;
        goto LABEL_48;
      }
      v22 = -[UIResponder _requiresKeyboardWhenFirstResponder](self, "_requiresKeyboardWhenFirstResponder");
    }
    else if (sel__startWritingTools_ == action)
    {
      v22 = -[UIResponder _shouldDisplayWritingToolsCalloutBarItem](self, "_shouldDisplayWritingToolsCalloutBarItem");
    }
    else
    {
      v22 = objc_opt_respondsToSelector();
    }
    v17 = v22;
  }
LABEL_48:

  return v17;
}

- (BOOL)_handleActivityItemsConfigurationCanPerformAction:(SEL)a3 sender:(id)a4
{
  id v6;
  void *v8;
  BOOL v9;
  id v11;
  id v12;
  const UIActivityItemsConfigurationInteraction *v13;
  id v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;

  v6 = a4;
  if (sel__share_ == a3 || sel_copy_ == a3)
  {
    -[UIResponder _effectiveActivityItemsConfiguration](self, "_effectiveActivityItemsConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  if (!dyld_program_sdk_at_least() || !_UIActivityItemsConfigurationHasItems(v8))
  {
    v9 = 0;
    goto LABEL_13;
  }
  if (sel__share_ == a3)
  {
    v11 = v8;
    v12 = v6;
    if ((+[_UITextServiceSession availableTextServices](_UITextServiceSession, "availableTextServices") & 8) == 0)
      goto LABEL_24;
    if ((objc_opt_respondsToSelector() & 1) == 0)
      goto LABEL_20;
    v13 = &UIActivityItemsConfigurationInteractionShare;
LABEL_19:
    if (objc_msgSend(v11, "activityItemsConfigurationSupportsInteraction:", *v13))
    {
LABEL_20:
      v14 = v12;
      if ((objc_opt_respondsToSelector() & 1) != 0
        && (objc_msgSend(v14, "sender"),
            v15 = (void *)objc_claimAutoreleasedReturnValue(),
            v16 = objc_msgSend(v15, "__isKindOfUIResponder"),
            v15,
            v16)
        && (objc_msgSend(v14, "sender"), v17 = (void *)objc_claimAutoreleasedReturnValue(), (v18 = v17) != 0))
      {
        objc_msgSend(v17, "activityItemsConfiguration");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v19 != 0;

      }
      else
      {
        v9 = 1;
      }

      goto LABEL_27;
    }
LABEL_24:
    v9 = 0;
LABEL_27:

    goto LABEL_13;
  }
  if (sel_copy_ == a3)
  {
    v11 = v8;
    v12 = v6;
    if ((objc_opt_respondsToSelector() & 1) == 0)
      goto LABEL_20;
    v13 = &UIActivityItemsConfigurationInteractionCopy;
    goto LABEL_19;
  }
  v9 = 1;
LABEL_13:

  return v9;
}

- (BOOL)canPasteItemProviders:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[UIResponder _effectivePasteConfiguration](self, "_effectivePasteConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v7 = _UICanPasteItemProviders(v5, v4);
  else
    v7 = 0;

  return v7;
}

- (id)pasteConfiguration
{
  return objc_getAssociatedObject(self, &_pasteConfigurationKey);
}

- (BOOL)_ownsInputAccessoryView
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if (!-[UIResponder performSelector:](self, "performSelector:", sel_inputAccessoryView)
    || (v3 = -[UIResponder methodForSelector:](self, "methodForSelector:", sel_inputAccessoryView),
        v3 == +[UIResponder instanceMethodForSelector:](UIResponder, "instanceMethodForSelector:", sel_inputAccessoryView)))
  {
    v4 = -[UIResponder performSelector:](self, "performSelector:", sel_inputAccessoryViewController);
    if (v4)
    {
      v5 = -[UIResponder methodForSelector:](self, "methodForSelector:", sel_inputAccessoryViewController);
      LOBYTE(v4) = v5 != +[UIResponder instanceMethodForSelector:](UIResponder, "instanceMethodForSelector:", sel_inputAccessoryViewController);
    }
  }
  else
  {
    LOBYTE(v4) = 1;
  }
  return v4;
}

- (UIInputViewController)inputViewController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[UIResponder nextResponder](self, "nextResponder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inputViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "_nextResponderOverride");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[UIResponder nextResponder](self, "nextResponder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_overrideInputViewNextResponderWithResponder:", v6);

  }
  return (UIInputViewController *)v4;
}

- (UIInputViewController)inputAccessoryViewController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[UIResponder nextResponder](self, "nextResponder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inputAccessoryViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "_nextResponderOverride");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[UIResponder nextResponder](self, "nextResponder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_overrideInputAccessoryViewNextResponderWithResponder:", v6);

  }
  return (UIInputViewController *)v4;
}

- (UIResponder)nextResponder
{
  return 0;
}

- (BOOL)_disableAutomaticKeyboardUI
{
  void *v2;
  char v3;

  -[UIResponder nextResponder](self, "nextResponder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_disableAutomaticKeyboardUI");

  return v3;
}

- (UIView)inputView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[UIResponder nextResponder](self, "nextResponder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inputView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "_nextResponderOverride");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[UIResponder nextResponder](self, "nextResponder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_overrideInputViewNextResponderWithResponder:", v6);

  }
  return (UIView *)v4;
}

- (void)_overrideInputViewNextResponderWithResponder:(id)a3
{
  -[UIResponder _overrideNextResponderWithResponder:forType:](self, "_overrideNextResponderWithResponder:forType:", a3, 1);
}

- (void)_didChangeDeepestActionResponder
{
  objc_msgSend((id)UIApp, "_updateSerializableKeyCommandsForResponder:", self);
}

- (CGRect)_caretRect
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  -[UIResponder _asTextSelection](self, "_asTextSelection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "selectedTextRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "start");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v2, "caretRectForPosition:", v4);
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
  }
  else
  {
    v6 = *MEMORY[0x1E0C9D628];
    v8 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v10 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v12 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (FBSSceneIdentityToken)_layeringSceneIdentity
{
  return self->__layeringSceneIdentity;
}

uint64_t __36__UIResponder__endPinningInputViews__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_stopPinningInputViewsOnBehalfOfResponder:", *(_QWORD *)(a1 + 32));
}

- (BOOL)_requiresKeyboardWhenFirstResponder
{
  void *v3;
  void *v4;
  char v5;
  BOOL v6;

  -[UIResponder _keyboardResponder](self, "_keyboardResponder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  if (objc_msgSend(v3, "_conformsToProtocolUIKeyInput"))
  {
    if ((-[UIResponder _conformsToProtocolUIAsyncTextInputClient](self, "_conformsToProtocolUIAsyncTextInputClient")
       || -[UIResponder _conformsToProtocolBETextInput](self, "_conformsToProtocolBETextInput"))
      && (+[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance"),
          v4 = (void *)objc_claimAutoreleasedReturnValue(),
          v5 = objc_msgSend(v4, "hardwareKeyboardAttached"),
          v4,
          (v5 & 1) != 0)
      || (objc_opt_respondsToSelector() & 1) == 0
      || -[UIResponder isEditable](self, "isEditable"))
    {
      v6 = 1;
    }
  }

  return v6;
}

- (BOOL)_conformsToProtocolUIKeyInput
{
  unsigned int responderFlags;
  int v4;

  responderFlags = self->_responderFlags;
  if ((responderFlags & 0x10) == 0)
  {
    v4 = 16;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      if (-[UIResponder conformsToProtocol:](self, "conformsToProtocol:", &unk_1EDE22370))
        v4 = 48;
      else
        v4 = 16;
    }
    responderFlags = *(_WORD *)&self->_responderFlags & 0xFFCF | v4;
    *(_WORD *)&self->_responderFlags = *(_WORD *)&self->_responderFlags & 0xFFCF | v4;
  }
  return (responderFlags >> 5) & 1;
}

- (BOOL)_conformsToProtocolUIAsyncTextInputClient
{
  unsigned int responderFlags;
  int v4;

  responderFlags = self->_responderFlags;
  if ((responderFlags & 0x80) == 0)
  {
    if (+[UIKBInputDelegateManager isAsyncTextInputEnabled](UIKBInputDelegateManager, "isAsyncTextInputEnabled"))
    {
      v4 = 128;
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        if (-[UIResponder conformsToProtocol:](self, "conformsToProtocol:", &unk_1EE0CE228))
          v4 = 192;
        else
          v4 = 128;
      }
    }
    else
    {
      v4 = 128;
    }
    responderFlags = *(_WORD *)&self->_responderFlags & 0xFF3F | v4;
    *(_WORD *)&self->_responderFlags = *(_WORD *)&self->_responderFlags & 0xFF3F | v4;
  }
  return (responderFlags >> 6) & 1;
}

- (BOOL)_conformsToProtocolBETextInput
{
  unsigned int responderFlags;
  int v4;

  responderFlags = self->_responderFlags;
  if ((responderFlags & 0x200) == 0)
  {
    if (+[UIKBInputDelegateManager isAsyncTextInputEnabled](UIKBInputDelegateManager, "isAsyncTextInputEnabled"))
    {
      if (-[UIResponder conformsToProtocol:](self, "conformsToProtocol:", &unk_1EE0CE288))
        v4 = 768;
      else
        v4 = 512;
      responderFlags = *(_WORD *)&self->_responderFlags & 0xFCFF | v4;
    }
    else
    {
      responderFlags = *(_WORD *)&self->_responderFlags & 0xFCFF | 0x200;
    }
    *(_WORD *)&self->_responderFlags = responderFlags;
  }
  return (responderFlags >> 8) & 1;
}

- (BOOL)_containsResponder:(id)a3
{
  UIResponder *v4;
  UIResponder *v5;

  v4 = (UIResponder *)a3;
  while (v4)
  {
    if (v4 == self)
      break;
    v5 = v4;
    -[UIResponder nextResponder](v4, "nextResponder");
    v4 = (UIResponder *)objc_claimAutoreleasedReturnValue();

  }
  return v4 == self;
}

- (BOOL)isEditable
{
  void *v2;
  void *v3;
  BOOL v4;

  -[UIResponder __textInteractionFromAssistant](self, "__textInteractionFromAssistant");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "textInteractionMode") != 1;
  else
    v4 = 1;

  return v4;
}

- (id)__textInteractionFromAssistant
{
  void *v2;
  void *v3;

  -[UIResponder interactionAssistant](self, "interactionAssistant");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "interactions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (UITextInteractionAssistant)interactionAssistant
{
  return (UITextInteractionAssistant *)objc_getAssociatedObject(self, &_UITextInputImplicitInteractionAssistantKey);
}

- (BOOL)_requiresKeyboardResetOnReload
{
  return -[UIResponder _conformsToProtocolUIAsyncTextInputClient](self, "_conformsToProtocolUIAsyncTextInputClient")
      || -[UIResponder _conformsToProtocolBETextInput](self, "_conformsToProtocolBETextInput");
}

- (void)_preserveResponderOverridesWhilePerforming:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void (**v9)(void);

  v9 = (void (**)(void))a3;
  v4 = (void *)MEMORY[0x186DC9484]();
  -[UIResponder _currentOverrideClient](self, "_currentOverrideClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "target");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "types");

  v9[2]();
  if (v6 && (*(_WORD *)&self->_responderFlags & 1) == 0)
  {
    +[_UIResponder_Override overrideForResponder:withTarget:forType:](_UIResponder_Override, "overrideForResponder:withTarget:forType:", self, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setAssociatedObject(self, &_MergedGlobals_1191, v8, (void *)1);
    *(_WORD *)&self->_responderFlags |= 1u;

  }
  objc_autoreleasePoolPop(v4);

}

- (id)_currentOverrideClient
{
  if ((*(_WORD *)&self->_responderFlags & 1) == 0)
    return 0;
  objc_getAssociatedObject(self, &_MergedGlobals_1191);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
  forwardTouchMethod(self, (uint64_t)a2, touches, event, 4);
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
  forwardTouchMethod(self, (uint64_t)a2, touches, event, 0);
}

- (NSUndoManager)undoManager
{
  UIResponder *v3;
  UIResponder *v4;
  void *v5;

  -[UIResponder nextResponder](self, "nextResponder");
  v3 = (UIResponder *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = 0;
  if (v3 && v3 != self)
  {
    -[UIResponder undoManager](v3, "undoManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSUndoManager *)v5;
}

- (BOOL)_disableAutomaticKeyboardBehavior
{
  void *v2;
  char v3;

  -[UIResponder nextResponder](self, "nextResponder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_disableAutomaticKeyboardBehavior");

  return v3;
}

- (BOOL)_containedInAbsoluteResponderChain
{
  void *v2;
  char v3;

  -[UIResponder nextResponder](self, "nextResponder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_containedInAbsoluteResponderChain");

  return v3;
}

- (UIEditingInteractionConfiguration)editingInteractionConfiguration
{
  return 1;
}

- (id)_additionalTextInputLocales
{
  void *v2;
  void *v3;

  -[UIResponder nextResponder](self, "nextResponder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_additionalTextInputLocales");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)nextFirstResponder
{
  void *v2;
  uint64_t v3;

  -[UIResponder nextResponder](self, "nextResponder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    do
    {
      if ((objc_msgSend(v2, "isFirstResponder") & 1) == 0 && (objc_msgSend(v2, "_canBecomeFirstResponder") & 1) != 0)
        break;
      objc_msgSend(v2, "nextResponder");
      v3 = objc_claimAutoreleasedReturnValue();

      v2 = (void *)v3;
    }
    while (v3);
  }
  return v2;
}

- (BOOL)isFirstResponder
{
  UIResponder *v2;
  UIResponder *v3;

  v2 = self;
  -[UIResponder _firstResponder](self, "_firstResponder");
  v3 = (UIResponder *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = v3 == v2;

  return (char)v2;
}

- (BOOL)resignFirstResponder
{
  UIResponder *v3;
  void *v4;
  BOOL v5;
  UIResponder *v7;
  UIResponder *v8;
  void *v9;
  void *v10;
  void *v11;

  -[UIResponder _clearBecomeFirstResponderWhenCapable](self, "_clearBecomeFirstResponderWhenCapable");
  -[UIResponder _firstResponder](self, "_firstResponder");
  v3 = (UIResponder *)objc_claimAutoreleasedReturnValue();
  if (v3 == self && -[UIResponder canResignFirstResponder](self, "canResignFirstResponder"))
  {
    -[UIResponder _responderWindow](self, "_responderWindow");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "_isSettingFirstResponder") & 1) != 0)
    {
      if (!-[UIResponder _finishResignFirstResponderFromBecomeFirstResponder:](self, "_finishResignFirstResponderFromBecomeFirstResponder:", 1))
      {
        v5 = 0;
LABEL_21:

        goto LABEL_7;
      }
    }
    else
    {
      objc_msgSend(v4, "_setIsSettingFirstResponder:", 1);
      -[UIResponder nextFirstResponder](self, "nextFirstResponder");
      v7 = (UIResponder *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v4, "_wantsResponderWithoutKeyboard")
        && -[UIResponder _requiresKeyboardWhenFirstResponder](v7, "_requiresKeyboardWhenFirstResponder"))
      {
        do
        {
          -[UIResponder nextFirstResponder](v7, "nextFirstResponder");
          v8 = (UIResponder *)objc_claimAutoreleasedReturnValue();

          v7 = v8;
        }
        while (-[UIResponder _requiresKeyboardWhenFirstResponder](v8, "_requiresKeyboardWhenFirstResponder"));
      }
      else
      {
        v8 = v7;
      }
      -[UIResponder _responderWindow](self, "_responderWindow");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "windowScene");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "keyboardSceneDelegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
        objc_msgSend(v11, "setKeyWindowCandidate:", 0);
      if (v8 == self
        || !-[UIResponder becomeFirstResponder](v8, "becomeFirstResponder")
        || -[UIResponder isFirstResponder](self, "isFirstResponder"))
      {
        -[UIResponder _finishResignFirstResponder](self, "_finishResignFirstResponder");
        objc_msgSend((id)UIApp, "_updateSerializableKeyCommandsForResponder:", 0);
      }
      -[UIResponder _notifyFocusEngine](self, "_notifyFocusEngine");
      objc_msgSend(v4, "_setIsSettingFirstResponder:", 0);

    }
    -[UIResponder _endUpWritingToolsIfNecessaryForResignFirstResponder](self, "_endUpWritingToolsIfNecessaryForResignFirstResponder");
    v5 = 1;
    goto LABEL_21;
  }
  v5 = 0;
LABEL_7:

  return v5;
}

- (BOOL)becomeFirstResponder
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  UIResponder *v7;
  UIResponder *v8;
  uint64_t v9;
  void *v10;
  BOOL v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  _BOOL4 v18;
  char v19;
  int v20;
  unint64_t v21;
  NSObject *v22;
  NSObject *v23;
  id v24;
  int v25;
  int v26;
  uint8_t v28[24];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  -[UIResponder _responderWindow](self, "_responderWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "windowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "keyboardSceneDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v3, "_isSettingFirstResponder");
  if (!objc_msgSend(v3, "_suppressFirstResponderWhenUserInteractionDisabled")
    || (objc_msgSend(v3, "isUserInteractionEnabled") & 1) != 0)
  {
    v7 = self;
    -[UIResponder _firstResponder](v7, "_firstResponder");
    v8 = (UIResponder *)objc_claimAutoreleasedReturnValue();
    -[UIResponder firstResponder](v7, "firstResponder");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    v11 = 1;
    if (v8 == v7 || (UIResponder *)v9 == v7)
    {
LABEL_46:

      goto LABEL_47;
    }
    if (v9)
      v12 = (void *)v9;
    else
      v12 = v8;
    v13 = v12;
    if ((v6 & 1) == 0)
      objc_msgSend(v3, "_setIsSettingFirstResponder:", 1);
    objc_msgSend(v5, "localAuthenticationObserver");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "willTryToBecomeFirstResponder:", v7);
    if (v13 && !objc_msgSend(v13, "_canChangeFirstResponder:toResponder:", v13, v7)
      || !-[UIResponder _canBecomeFirstResponder](v7, "_canBecomeFirstResponder"))
    {
      goto LABEL_42;
    }
    objc_msgSend(v5, "_beginIgnoringReloadInputViews");
    if (v6)
      objc_msgSend(v13, "_finishResignFirstResponder");
    if (v3
      && v13
      && (objc_msgSend(v13, "_window"), v15 = (void *)objc_claimAutoreleasedReturnValue(), v15, v15 != v3)
      && (objc_msgSend(v13, "_window"),
          v16 = (void *)objc_claimAutoreleasedReturnValue(),
          v17 = objc_msgSend(v16, "_isTextEffectsWindow"),
          v16,
          (v17 & 1) == 0))
    {
      v21 = becomeFirstResponder___s_category;
      if (!becomeFirstResponder___s_category)
      {
        v21 = __UILogCategoryGetNode("View", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v21, (unint64_t *)&becomeFirstResponder___s_category);
      }
      v22 = *(NSObject **)(v21 + 8);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v23 = v22;
        *(_DWORD *)v28 = 138412290;
        *(_QWORD *)&v28[4] = objc_opt_class();
        v24 = *(id *)&v28[4];
        _os_log_impl(&dword_185066000, v23, OS_LOG_TYPE_ERROR, "First responder warning: '<%@>' rejected resignFirstResponder when being removed from hierarchy", v28, 0xCu);

      }
      -[UIResponder _setFirstResponder:](v7, "_setFirstResponder:", 0, *(_OWORD *)v28);

      v13 = 0;
      v18 = 1;
    }
    else
    {
      v18 = v13 == 0;
      if (v13)
        v19 = v6;
      else
        v19 = 1;
      if ((v19 & 1) == 0)
      {
        v18 = 0;
        v20 = 0;
        if (!objc_msgSend(v13, "resignFirstResponder"))
        {
LABEL_38:
          v26 = objc_msgSend(v5, "_endIgnoringReloadInputViews");
          -[UIResponder _setSuppressWritingToolsForRemoteKeyboard:](v7, "_setSuppressWritingToolsForRemoteKeyboard:", 0);
          if (v20)
          {
            v11 = 1;
            -[UIResponder _reloadInputViewsFromFirstResponder:](v7, "_reloadInputViewsFromFirstResponder:", 1);
            objc_msgSend((id)UIApp, "_updateSerializableKeyCommandsForResponder:", v7);
LABEL_43:
            objc_msgSend(v14, "didTryToBecomeFirstResponder:", v7);
            if ((v6 & 1) == 0)
              objc_msgSend(v3, "_setIsSettingFirstResponder:", 0);

            goto LABEL_46;
          }
          if (v26)
            objc_msgSend(v5, "forceReloadInputViews");
LABEL_42:
          v11 = 0;
          goto LABEL_43;
        }
      }
    }
    if (-[UIResponder _containedInAbsoluteResponderChain](v7, "_containedInAbsoluteResponderChain"))
    {
      -[UIResponder _becomeFirstResponder](v7, "_becomeFirstResponder");
      -[UIResponder _notifyFocusEngine](v7, "_notifyFocusEngine");
      v20 = 1;
    }
    else
    {
      v25 = -[UIResponder _becomeFirstResponderWhenPossible](v7, "_becomeFirstResponderWhenPossible");
      if (((v25 | v18) & 1) != 0)
      {
        v20 = v25;
      }
      else
      {
        if (!-[UIResponder _disableAutomaticKeyboardBehavior](v7, "_disableAutomaticKeyboardBehavior"))
          objc_msgSend(v5, "_reloadInputViewsForResponder:", 0);
        v20 = 0;
      }
    }
    goto LABEL_38;
  }
  objc_msgSend(v3, "_setLastFirstResponder:", self);
  v11 = 0;
LABEL_47:

  return v11;
}

- (id)firstResponder
{
  void *v2;
  void *v3;

  -[UIResponder nextResponder](self, "nextResponder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstResponder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_firstResponder
{
  void *v2;
  void *v3;

  -[UIResponder nextResponder](self, "nextResponder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_firstResponder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_canBecomeFirstResponder
{
  int v2;

  v2 = -[UIResponder canBecomeFirstResponder](self, "canBecomeFirstResponder");
  if (v2)
    LOBYTE(v2) = objc_msgSend((id)UIApp, "_disableBecomeFirstResponder") ^ 1;
  return v2;
}

- (BOOL)canBecomeFirstResponder
{
  return 0;
}

- (BOOL)_canChangeFirstResponder:(id)a3 toResponder:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;

  v6 = a3;
  v7 = a4;
  -[UIResponder nextResponder](self, "nextResponder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
    v10 = objc_msgSend(v8, "_canChangeFirstResponder:toResponder:", v6, v7);
  else
    v10 = 1;

  return v10;
}

- (void)_notifyFocusEngine
{
  void *v3;
  id v4;

  -[UIResponder _responderWindow](self, "_responderWindow");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  +[_UIFocusSystemSceneComponent sceneComponentForEnvironment:](_UIFocusSystemSceneComponent, "sceneComponentForEnvironment:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_firstResponderDidUpdateFromResponder:", self);

}

- (BOOL)canResignFirstResponder
{
  return 1;
}

- (BOOL)_finishResignFirstResponderFromBecomeFirstResponder:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  UIResponder *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  BOOL v16;

  v3 = a3;
  -[UIResponder _responderWindow](self, "_responderWindow");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    +[UIWindow _applicationKeyWindow](UIWindow, "_applicationKeyWindow");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "windowScene");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "keyboardSceneDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "responder");
    v9 = (UIResponder *)objc_claimAutoreleasedReturnValue();

    if (v9 == self)
      v5 = v6;
    else
      v5 = 0;

  }
  objc_msgSend(v5, "windowScene");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "keyboardSceneDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "responder");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12 || !objc_msgSend(v11, "_isTrackingResponder:", self))
    goto LABEL_14;
  if (objc_msgSend(v11, "_isTrackingResponder:", self))
  {
    -[UIResponder _window](self, "_window");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_window");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13 != v14)
    {

      goto LABEL_12;
    }
    v15 = -[UIResponder _disableAutomaticKeyboardBehavior](self, "_disableAutomaticKeyboardBehavior");

    if (v15)
      goto LABEL_12;
    objc_msgSend(v11, "_reloadInputViewsForResponder:fromBecomeFirstResponder:", 0, v3);
LABEL_14:
    v16 = 1;
    goto LABEL_15;
  }
LABEL_12:
  v16 = 0;
LABEL_15:
  -[UIResponder _resignFirstResponder](self, "_resignFirstResponder");
  *(_WORD *)&self->_responderFlags &= ~8u;

  return v16;
}

- (void)_setFirstResponder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[UIResponder _willChangeToFirstResponder:](self, "_willChangeToFirstResponder:", v5);
  -[UIResponder nextResponder](self, "nextResponder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setFirstResponder:", v5);

  -[UIResponder _didChangeToFirstResponder:](self, "_didChangeToFirstResponder:", v5);
}

- (void)_resignFirstResponder
{
  -[UIResponder _setFirstResponder:](self, "_setFirstResponder:", 0);
}

- (BOOL)_finishResignFirstResponder
{
  return -[UIResponder _finishResignFirstResponderFromBecomeFirstResponder:](self, "_finishResignFirstResponderFromBecomeFirstResponder:", 0);
}

- (void)_reloadInputViewsFromFirstResponder:(BOOL)a3
{
  void *v4;
  void *v5;
  id v6;

  if (-[UIResponder shouldReloadInputViews](self, "shouldReloadInputViews", a3))
  {
    -[UIResponder _responderWindow](self, "_responderWindow");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "windowScene");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "keyboardSceneDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_reloadInputViewsForResponder:fromBecomeFirstResponder:", self, 1);

  }
}

- (BOOL)shouldReloadInputViews
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  BOOL v7;
  BOOL v8;
  uint64_t v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  char v32;
  unint64_t v33;
  NSObject *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  if (!-[UIResponder _disableAutomaticKeyboardBehavior](self, "_disableAutomaticKeyboardBehavior")
    && -[UIResponder isFirstResponder](self, "isFirstResponder"))
  {
    -[UIResponder _responderWindow](self, "_responderWindow");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "_isApplicationKeyWindow") & 1) != 0)
      goto LABEL_18;
    +[UIWindow _applicationKeyWindow](UIWindow, "_applicationKeyWindow");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3 == v4)
      goto LABEL_18;
    if (objc_msgSend(v3, "isKeyWindow"))
    {
      -[UIResponder inputAccessoryView](self, "inputAccessoryView");
      v5 = objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        v6 = (void *)v5;
        v7 = -[UIResponder _requiresKeyboardWhenFirstResponder](self, "_requiresKeyboardWhenFirstResponder");

        if (!v7)
          goto LABEL_18;
      }
      else
      {
        -[UIResponder inputAccessoryViewController](self, "inputAccessoryViewController");
        v9 = objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          v10 = (void *)v9;
          v11 = -[UIResponder _requiresKeyboardWhenFirstResponder](self, "_requiresKeyboardWhenFirstResponder");

          if (!v11)
            goto LABEL_18;
        }
      }
    }
    -[UIResponder _responderWindow](self, "_responderWindow");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "windowScene");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "keyboardSceneDelegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "keyWindowCandidate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3 != v15)
    {
      -[UIResponder _window](self, "_window");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "windowScene");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "keyboardSceneDelegate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "responder");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        objc_msgSend(v19, "_responderWindow");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "screen");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "screen");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21 != v22)
          goto LABEL_17;
      }
      -[UIResponder _window](self, "_window");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "screen");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "_userInterfaceIdiom");

      if (v19 || v25 != 3)
      {
        +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "_window");
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (v28 && !objc_msgSend(v28, "_isTextEffectsWindow"))
          goto LABEL_25;
        -[UIResponder _window](self, "_window");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "windowScene");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "keyboardSceneDelegate");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "automaticAppearanceEnabled");

        if ((v32 & 1) != 0)
        {
          v8 = 0;
        }
        else
        {
LABEL_25:
          v33 = shouldReloadInputViews___s_category;
          if (!shouldReloadInputViews___s_category)
          {
            v33 = __UILogCategoryGetNode("View", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v33, (unint64_t *)&shouldReloadInputViews___s_category);
          }
          v34 = *(NSObject **)(v33 + 8);
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            v35 = v34;
            -[UIResponder _window](self, "_window");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend((id)UIApp, "keyWindow");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = 138412546;
            v39 = v36;
            v40 = 2112;
            v41 = v37;
            _os_log_impl(&dword_185066000, v35, OS_LOG_TYPE_ERROR, "First responder issue detected: non-key window attempting reload - allowing due to manual keyboard (first responder window is %@, key window is %@)", (uint8_t *)&v38, 0x16u);

          }
          v8 = 1;
        }

      }
      else
      {
LABEL_17:
        v8 = 1;
      }

      goto LABEL_19;
    }
LABEL_18:
    v8 = 1;
LABEL_19:

    return v8;
  }
  return 0;
}

- (void)_becomeFirstResponder
{
  -[UIResponder _setFirstResponder:](self, "_setFirstResponder:", self);
}

- (BOOL)_becomeFirstResponderWhenPossible
{
  return 0;
}

+ (void)_cleanupAllStateRestorationTables
{
  objc_msgSend(a1, "_cleanupStateRestorationObjectIdentifierTrackingTables");

  qword_1ECD80188 = 0;
  qword_1ECD80168 = 0;
}

+ (void)_stopDeferredTrackingObjectsWithIdentifiers
{
  byte_1ECD80161 = 0;
}

+ (void)_cleanupStateRestorationObjectIdentifierTrackingTables
{

  qword_1ECD80180 = 0;
  objc_msgSend(a1, "_stopDeferredTrackingObjectsWithIdentifiers");
}

- (BOOL)__isKindOfUIResponder
{
  return 1;
}

- (BOOL)_suppressSoftwareKeyboard
{
  return (*(_WORD *)&self->_responderFlags >> 3) & 1;
}

- (id)inputDashboardViewController
{
  void *v3;
  int v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "shouldShowSmartReplyFeedbackInputDashboardViewController");

  if (!v4
    || (-[UIResponder _smartReplyFeedbackInputDashboardViewController](self, "_smartReplyFeedbackInputDashboardViewController"), (v5 = (id)objc_claimAutoreleasedReturnValue()) == 0))
  {
    -[UIResponder _writingToolsInputDashboardViewController](self, "_writingToolsInputDashboardViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v5 = v6;
    }
    else
    {
      -[UIResponder nextResponder](self, "nextResponder");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "inputDashboardViewController");
      v5 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "_nextResponderOverride");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
      {
        -[UIResponder nextResponder](self, "nextResponder");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "_overrideInputAccessoryViewNextResponderWithResponder:", v10);

      }
    }

  }
  return v5;
}

+ (void)_startDeferredTrackingObjectsWithIdentifiers
{
  byte_1ECD80161 = 1;
}

- (_NSRange)_nsrangeForTextRange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSUInteger v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSUInteger v11;
  NSUInteger v12;
  _NSRange result;

  v4 = a3;
  -[UIResponder _selectableText](self, "_selectableText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "start");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[UIResponder _indexForTextPosition:](self, "_indexForTextPosition:", v6);

  objc_msgSend(v4, "start");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "end");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v5, "offsetFromPosition:toPosition:", v8, v9);
  v11 = v7;
  v12 = v10;
  result.length = v12;
  result.location = v11;
  return result;
}

- (int)_indexForTextPosition:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;

  v4 = a3;
  -[UIResponder _selectableText](self, "_selectableText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "beginningOfDocument");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "offsetFromPosition:toPosition:", v6, v4);

  return v7;
}

- (BOOL)_hasMarkedText
{
  void *v2;
  char v3;
  void *v4;

  -[UIResponder _selectableText](self, "_selectableText");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "_usesAsynchronousProtocol")
    && (!+[UIKBInputDelegateManager isAsyncTextInputEnabled](UIKBInputDelegateManager, "isAsyncTextInputEnabled")|| objc_msgSend(v2, "conformsToProtocolCached:", &unk_1EE0CE288)|| objc_msgSend(v2, "conformsToProtocolCached:", &unk_1EE0CE228)))
  {
    v3 = objc_msgSend(v2, "hasMarkedText");
  }
  else
  {
    objc_msgSend(v2, "markedTextRange");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v4 != 0;

  }
  return v3;
}

- (BOOL)_usesAsynchronousProtocol
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;

  v3 = +[UIKBInputDelegateManager isAsyncTextInputEnabled](UIKBInputDelegateManager, "isAsyncTextInputEnabled");
  -[UIResponder _selectableText](self, "_selectableText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if ((objc_msgSend(v4, "conformsToProtocolCached:", &unk_1EE0CE228) & 1) != 0)
    {
      v6 = 1;
    }
    else
    {
      -[UIResponder _selectableText](self, "_selectableText");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v7, "conformsToProtocolCached:", &unk_1EE0CE288);

    }
  }
  else
  {
    v6 = objc_msgSend(v4, "conformsToProtocol:", &unk_1EE0CE648);
  }

  return v6;
}

- (CGRect)_selectionClipRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = *MEMORY[0x1E0C9D628];
  v3 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v4 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v5 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setRestorationIdentifier:(id)a3
{
  objc_setAssociatedObject(self, &kRestorationIdentifierAssociatedObjectKey, a3, (void *)1);
  _trackObjectWithIdentifier((uint64_t)self);
}

- (void)_windowBecameKey
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  id v7;

  -[UIResponder _window](self, "_window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_isSettingFirstResponder");

  if ((v4 & 1) == 0)
  {
    -[UIResponder _window](self, "_window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "windowScene");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "keyboardSceneDelegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    if (!-[UIResponder _isTransitioningFromView:](self, "_isTransitioningFromView:", self)
      || objc_msgSend(v7, "ignoresPinning"))
    {
      -[UIResponder reloadInputViews](self, "reloadInputViews");
    }

  }
}

- (BOOL)_isTransitioningFromView:(id)a3
{
  UIResponder *v3;
  void *v4;

  v3 = self;
  -[UIResponder nextResponder](self, "nextResponder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "_isTransitioningFromView:", v3);

  return (char)v3;
}

- (void)reloadInputViews
{
  void *v3;
  void *v4;
  id v5;

  if (-[UIResponder shouldReloadInputViews](self, "shouldReloadInputViews"))
  {
    -[UIResponder _responderWindow](self, "_responderWindow");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "windowScene");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "keyboardSceneDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_reloadInputViewsForResponder:", self);

  }
}

- (BOOL)_isViewController
{
  return 0;
}

- (BOOL)_isView
{
  return 0;
}

+ (unint64_t)_currentChangeIntent
{
  void *v5;

  if (pthread_main_np() != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UIResponder.m"), 807, CFSTR("Call must be made on main thread"));

  }
  return __changeIntent;
}

+ (id)_globalFirstResponder
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegateAsResponder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_editingDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v2, "delegateAsResponder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[UIWindow _externalKeyWindow](UIWindow, "_externalKeyWindow");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      +[UIWindow _applicationKeyWindow](UIWindow, "_applicationKeyWindow");
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v9 = v8;

    objc_msgSend(v9, "_responderForKeyEvents");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)_responderForEditing
{
  void *v3;
  void *v4;
  id v5;

  -[UIResponder _editingDelegate](self, "_editingDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = self;
  v5 = v3;

  return v5;
}

- (UIResponder)_editingDelegate
{
  return 0;
}

- (void)setActivityItemsConfiguration:(id)activityItemsConfiguration
{
  id v4;
  void *v5;
  id value;

  value = activityItemsConfiguration;
  -[UIResponder activityItemsConfiguration](self, "activityItemsConfiguration");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = value;
  if (v4 != value)
  {
    objc_setAssociatedObject(self, &kActivityItemsConfigurationKey, value, (void *)1);
    v5 = value;
  }

}

- (id)activityItemsConfiguration
{
  return objc_getAssociatedObject(self, &kActivityItemsConfigurationKey);
}

- (NSString)restorationIdentifier
{
  return (NSString *)objc_getAssociatedObject(self, &kRestorationIdentifierAssociatedObjectKey);
}

- (UITextInputMode)textInputMode
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  if (+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
    goto LABEL_13;
  -[UIResponder textInputContextIdentifier](self, "textInputContextIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
LABEL_12:

LABEL_13:
    -[UIResponder nextResponder](self, "nextResponder");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "textInputMode");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("UITextInputContextIdentifiers"));
  objc_msgSend(CFSTR("ID_"), "stringByAppendingString:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingString:", CFSTR("_SETTIME"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_10;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = v7;
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v11, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 0;
      if (v10)
        goto LABEL_9;
LABEL_11:

      goto LABEL_12;
    }
LABEL_10:
    v8 = 0;
    v11 = 0;
    goto LABEL_11;
  }
  v8 = v7;
  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "inputModeLastUsedForLanguage:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = 0;
  if (!v10)
    goto LABEL_11;
LABEL_9:

LABEL_14:
  return (UITextInputMode *)v10;
}

- (NSString)textInputContextIdentifier
{
  void *v2;
  void *v3;

  -[UIResponder nextResponder](self, "nextResponder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textInputContextIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)_beginPinningInputViews
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;

  -[UIResponder _window](self, "_window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "windowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "keyboardSceneDelegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v6;
  if (!v6)
  {
    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v7 = v5;
  objc_msgSend(v5, "_beginPinningInputViewsOnBehalfOfResponder:", self);

}

- (void)setUserActivity:(NSUserActivity *)userActivity
{
  NSUserActivity *v4;
  NSUserActivity *value;

  value = userActivity;
  -[UIResponder _userActivity](self, "_userActivity");
  v4 = (NSUserActivity *)objc_claimAutoreleasedReturnValue();
  if (v4 != value)
  {
    objc_setAssociatedObject(self, &kResponderUserActivityKey, value, (void *)1);
    if (v4)
      objc_msgSend((id)UIApp, "_removeResponder:forUserActivity:", self, v4);
    if (value)
      objc_msgSend((id)UIApp, "_addResponder:forUserActivity:", self, value);
  }

}

- (int64_t)_textInputSource
{
  void *v2;
  void *v3;
  int64_t v4;

  +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
    return __UIPlatformFallbackInputSource;
  +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "lastEventSource");

  return v4;
}

- (id)targetForAction:(SEL)action withSender:(id)sender
{
  return _UIResponderTargetForActionWithTestBlock(self, action, sender, &__block_literal_global_31);
}

- (id)_window
{
  void *v2;
  void *v3;

  -[UIResponder nextResponder](self, "nextResponder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_textColorForCaretSelection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  const __CFString *v10;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[UIResponder textColorForCaretSelection](self, "textColorForCaretSelection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[UIResponder _selectableText](self, "_selectableText");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v4, "selectedTextRange");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "end");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        objc_msgSend(v4, "endOfDocument");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7 && objc_msgSend(v4, "comparePosition:toPosition:", v7, v6) == -1)
        {
          v8 = v7;

          v6 = v8;
        }
        objc_msgSend(v4, "textStylingAtPosition:inDirection:", v6, 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v9 = 0;
      }
      if ((dyld_program_sdk_at_least() & 1) != 0)
        v10 = *(const __CFString **)off_1E1678D98;
      else
        v10 = CFSTR("UITextInputTextColorKey");
      objc_msgSend(v9, "objectForKey:", v10);
      v3 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v3 = 0;
    }

  }
  return v3;
}

- (id)_fontForCaretSelection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  const __CFString *v10;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[UIResponder fontForCaretSelection](self, "fontForCaretSelection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[UIResponder _selectableText](self, "_selectableText");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v4, "selectedTextRange");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "end");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        objc_msgSend(v4, "endOfDocument");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7 && objc_msgSend(v4, "comparePosition:toPosition:", v7, v6) == -1)
        {
          v8 = v7;

          v6 = v8;
        }
        objc_msgSend(v4, "textStylingAtPosition:inDirection:", v6, 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v9 = 0;
      }
      if ((dyld_program_sdk_at_least() & 1) != 0)
        v10 = *(const __CFString **)off_1E1678D90;
      else
        v10 = CFSTR("UITextInputTextFontKey");
      objc_msgSend(v9, "objectForKey:", v10);
      v3 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v3 = 0;
    }

  }
  return v3;
}

- (void)setPasteConfiguration:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  objc_setAssociatedObject(self, &_pasteConfigurationKey, v4, (void *)1);

}

- (unsigned)_characterAfterCaretSelection
{
  return -[UIResponder _characterInRelationToCaretSelection:](self, "_characterInRelationToCaretSelection:", 0);
}

- (unsigned)_characterInRelationToCaretSelection:(int)a3
{
  uint64_t v3;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  unsigned int v10;

  v3 = *(_QWORD *)&a3;
  -[UIResponder _selectableText](self, "_selectableText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectedTextRange");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6
    && (v7 = (void *)v6,
        objc_msgSend(v5, "selectedTextRange"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "isEmpty"),
        v8,
        v7,
        v9))
  {
    v10 = -[UIResponder _characterInRelationToRangedSelection:](self, "_characterInRelationToRangedSelection:", v3);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unsigned)_characterInRelationToRangedSelection:(int)a3
{
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  int v17;

  -[UIResponder _selectableText](self, "_selectableText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectedTextRange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    goto LABEL_4;
  if (a3 > -101)
  {
    if ((a3 & 0x80000000) == 0)
    {
      objc_msgSend(v4, "selectedTextRange");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "end");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (a3)
      {
        objc_msgSend(v4, "positionFromPosition:offset:", v8, a3);
        v9 = objc_claimAutoreleasedReturnValue();

        v8 = (void *)v9;
      }
      if (!v8)
        goto LABEL_17;
LABEL_11:
      objc_msgSend(v4, "positionFromPosition:offset:", v8, 1);
      v12 = objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v13 = (void *)v12;
        objc_msgSend(v4, "textRangeFromPosition:toPosition:", v8, v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "textInRange:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v15, "length"))
        {
          if (objc_msgSend(v15, "length") == 2
            && (v16 = objc_msgSend(v15, "characterAtIndex:", 0),
                v17 = objc_msgSend(v15, "characterAtIndex:", 1),
                (v16 & 0xFC00) == 0xD800)
            && (v17 & 0xFC00) == 0xDC00)
          {
            v6 = v17 + (v16 << 10) - 56613888;
          }
          else
          {
            v6 = objc_msgSend(v15, "characterAtIndex:", 0);
          }
        }
        else
        {
          v6 = 0;
        }

        goto LABEL_21;
      }
LABEL_17:
      v6 = 0;
LABEL_21:

      goto LABEL_22;
    }
LABEL_10:
    objc_msgSend(v4, "selectedTextRange");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "start");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "positionFromPosition:offset:", v11, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
      goto LABEL_17;
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_10;
LABEL_4:
  v6 = 0;
LABEL_22:

  return v6;
}

- (unsigned)_characterBeforeCaretSelection
{
  return -[UIResponder _characterInRelationToCaretSelection:](self, "_characterInRelationToCaretSelection:", 0xFFFFFFFFLL);
}

- (id)_selectionDisplayInteraction
{
  void *v2;
  void *v3;

  objc_getAssociatedObject(self, &_UITextInputImplicitSelectionDisplayInteractionKey);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "weakObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_overrideNextResponderWithResponder:(id)a3 forType:(int64_t)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = (void *)MEMORY[0x186DC9484]();
  if (!-[UIResponder _containsResponder:](self, "_containsResponder:", v8))
  {
    if (v8)
    {
      +[_UIResponder_Override overrideForResponder:withTarget:forType:](_UIResponder_Override, "overrideForResponder:withTarget:forType:", self, v8, a4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
    objc_setAssociatedObject(self, &_MergedGlobals_1191, v7, (void *)1);
    *(_WORD *)&self->_responderFlags = *(_WORD *)&self->_responderFlags & 0xFFFE | (v7 != 0);

  }
  objc_autoreleasePoolPop(v6);

}

void __55___UIResponder_Override_Host_attachOverrider_forTypes___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  +[_UIResponder_Override_Host_Entry entryWithResponder:forType:](_UIResponder_Override_Host_Entry, "entryWithResponder:forType:", *(_QWORD *)(a1 + 40), a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (id)_overrideHost
{
  void *v3;

  if ((*(_WORD *)&self->_responderFlags & 2) != 0)
  {
    objc_getAssociatedObject(self, &unk_1ECD7F851);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[_UIResponder_Override_Host hostForResponder:](_UIResponder_Override_Host, "hostForResponder:", self);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setAssociatedObject(self, &unk_1ECD7F851, v3, (void *)1);
    *(_WORD *)&self->_responderFlags |= 2u;
  }
  return v3;
}

- (void)_endPinningInputViews
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __36__UIResponder__endPinningInputViews__block_invoke;
  v2[3] = &unk_1E16C1E50;
  v2[4] = self;
  +[UIKeyboardSceneDelegate performOnControllers:](UIKeyboardSceneDelegate, "performOnControllers:", v2);
}

+ (void)_updateStateRestorationIdentifierMap
{
  objc_msgSend((id)qword_1ECD80180, "enumerateObjectsUsingBlock:", &__block_literal_global_190_0);
  objc_msgSend((id)qword_1ECD80180, "removeAllObjects");
}

- (void)promptBackgroundViewDidUpdateConfiguration:(id)a3
{
  id v4;
  UIResponder *v5;
  UIResponder *v6;

  v4 = a3;
  v5 = self;
  v6 = -[UIResponder nextResponder](v5, sel_nextResponder);
  -[UIResponder promptBackgroundViewDidUpdateConfiguration:](v6, sel_promptBackgroundViewDidUpdateConfiguration_, v4);

}

- (BOOL)_allowsChangingFirstResponderForFocusUpdateWithContext:(id)a3
{
  return 1;
}

- (BOOL)_shouldSkipKeyCommand:(id)a3 forMovement:(int64_t)a4
{
  id v6;
  UIResponder *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  NSObject *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  NSObject *v18;
  objc_class *v19;
  void *v20;
  char v21;
  objc_class *v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if ((unint64_t)(a4 - 6) > 0xFFFFFFFFFFFFFFFDLL)
    goto LABEL_18;
  v7 = self;
  v8 = v7;
  if (qword_1ECD7CA78 == -1)
  {
    if (v7)
      goto LABEL_4;
    goto LABEL_6;
  }
  dispatch_once(&qword_1ECD7CA78, &__block_literal_global_18);
  if (v8)
  {
LABEL_4:
    while (1)
    {
      v9 = _MergedGlobals_933;
      if (v9 != objc_msgSend(v8, "methodForSelector:", sel__wantsPriorityOverFocusUpdates))
        break;
      objc_msgSend(v8, "nextResponder");
      v10 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v10;
      if (!v10)
        goto LABEL_6;
    }
    _UIIsPrivateMainBundle();
    if (dyld_program_sdk_at_least())
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL __legacyWantsPriorityOverFocusUpdate(UIResponder * _Nonnull __strong)");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(sel__wantsPriorityOverFocusUpdates);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject handleFailureInFunction:file:lineNumber:description:](v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("UIResponder_Focus.m"), 91, CFSTR("Class %@ implements %@, which is no longer supported."), v15, v16);

    }
    else
    {
      if (os_variant_has_internal_diagnostics())
      {
        __UIFaultDebugAssertLog();
        v12 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
          goto LABEL_16;
        v23 = (objc_class *)objc_opt_class();
        NSStringFromClass(v23);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(sel__wantsPriorityOverFocusUpdates);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v25 = v13;
        v26 = 2112;
        v27 = v20;
        _os_log_fault_impl(&dword_185066000, v12, OS_LOG_TYPE_FAULT, "Class %@ implements %@, which is no longer supported.  This will become an assert in a future version.", buf, 0x16u);
      }
      else
      {
        v17 = qword_1ECD7CA80;
        if (!qword_1ECD7CA80)
        {
          v17 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v17, (unint64_t *)&qword_1ECD7CA80);
        }
        v18 = *(NSObject **)(v17 + 8);
        if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
LABEL_17:
          v21 = objc_msgSend(v8, "_wantsPriorityOverFocusUpdates");

          if ((v21 & 1) == 0)
            goto LABEL_6;
LABEL_18:
          LOBYTE(v11) = 0;
          goto LABEL_19;
        }
        v12 = v18;
        v19 = (objc_class *)objc_opt_class();
        NSStringFromClass(v19);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(sel__wantsPriorityOverFocusUpdates);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v25 = v13;
        v26 = 2112;
        v27 = v20;
        _os_log_impl(&dword_185066000, v12, OS_LOG_TYPE_ERROR, "Class %@ implements %@, which is no longer supported.  This will become an assert in a future version.", buf, 0x16u);
      }

    }
LABEL_16:

    goto LABEL_17;
  }
LABEL_6:
  v11 = objc_msgSend(v6, "wantsPriorityOverSystemBehavior") ^ 1;
LABEL_19:

  return v11;
}

- (BOOL)_shouldForwardMovementToFocusEngine:(int64_t)a3
{
  if (!-[UIResponder conformsToProtocol:](self, "conformsToProtocol:", &unk_1EDE22370))
    return 1;
  if ((unint64_t)(a3 - 4) < 2)
    return !-[UIResponder isFirstResponder](self, "isFirstResponder");
  if (a3 == 3 && (objc_opt_respondsToSelector() & 1) != 0)
    return -[UIResponder isSingleLineDocument](self, "isSingleLineDocument");
  return 0;
}

- (id)_ui_findNavigatorResponder
{
  void *v2;
  void *v3;

  -[UIResponder nextResponder](self, "nextResponder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_ui_findNavigatorResponder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_effectiveActivityItemsConfigurationForSender:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;

  _UIResponderTargetForAction(self, sel_copy_, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "_effectiveActivityItemsConfiguration");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      v5 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v3, "activityItemsConfiguration");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;
LABEL_7:

  return v5;
}

- (id)_effectiveActivityItemsConfigurationAtLocation:(CGPoint)a3 inCoordinateSpace:(id)a4 sender:(id)a5
{
  double y;
  double x;
  id v9;
  id v10;
  void *v11;
  void *v12;

  y = a3.y;
  x = a3.x;
  v9 = a4;
  v10 = a5;
  _UIResponderTargetForAction(self, sel_copy_, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v11, "convertPoint:fromCoordinateSpace:", v9, x, y);
    objc_msgSend(v11, "_activityItemsConfigurationAtLocation:");
  }
  else
  {
    _activityItemsConfigurationForTarget(v11, v10);
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_firstNonnullActivityItemsConfigurationInResponderChainForLocation:(CGPoint)a3 inCoordinateSpace:(id)a4 skipPresentingViewControllers:(BOOL)a5 sender:(id)a6 target:(id *)a7
{
  CGFloat y;
  CGFloat x;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v20[4];
  id v21;
  uint64_t *v22;
  CGFloat v23;
  CGFloat v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  y = a3.y;
  x = a3.x;
  v12 = a4;
  v13 = a6;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__83;
  v29 = __Block_byref_object_dispose__83;
  v30 = 0;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __174__UIResponder_UIActivityItemsConfiguration___firstNonnullActivityItemsConfigurationInResponderChainForLocation_inCoordinateSpace_skipPresentingViewControllers_sender_target___block_invoke;
  v20[3] = &unk_1E16C6058;
  v23 = x;
  v24 = y;
  v14 = v12;
  v21 = v14;
  v22 = &v25;
  v15 = _Block_copy(v20);
  _UIResponderTargetForActionWithTestBlock(self, sel_copy_, self, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (a7)
    *a7 = objc_retainAutorelease(v16);
  v18 = (id)v26[5];

  _Block_object_dispose(&v25, 8);
  return v18;
}

BOOL __174__UIResponder_UIActivityItemsConfiguration___firstNonnullActivityItemsConfigurationInResponderChainForLocation_inCoordinateSpace_skipPresentingViewControllers_sender_target___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "_effectiveActivityItemsConfigurationAtLocation:inCoordinateSpace:sender:", *(_QWORD *)(a1 + 32), v6, *(double *)(a1 + 48), *(double *)(a1 + 56));
  else
    _activityItemsConfigurationForTarget(v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v8);

  return v8 != 0;
}

- (BOOL)_handleActivityItemsConfigurationDoesNotHandleSelector:(SEL)a3
{
  int v5;
  BOOL result;
  void *v7;
  int64_t v8;
  _QWORD v9[5];

  v5 = dyld_program_sdk_at_least();
  result = 0;
  if (v5 && sel_copy_ == a3)
  {
    -[UIResponder _effectiveActivityItemsConfigurationForSender:](self, "_effectiveActivityItemsConfigurationForSender:", self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = -[UIResponder _dataOwnerForCopy](self, "_dataOwnerForCopy");
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __100__UIResponder_UIActivityItemsConfiguration___handleActivityItemsConfigurationDoesNotHandleSelector___block_invoke;
      v9[3] = &unk_1E16B1B28;
      v9[4] = self;
      +[UIPasteboard _performAsDataOwner:block:](UIPasteboard, "_performAsDataOwner:block:", v8, v9);
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

void __100__UIResponder_UIActivityItemsConfiguration___handleActivityItemsConfigurationDoesNotHandleSelector___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_effectiveActivityItemsConfigurationForSender:", *(_QWORD *)(a1 + 32));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "itemProvidersForActivityItemsConfiguration");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIPasteboard generalPasteboard](UIPasteboard, "generalPasteboard");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setItemProviders:", v1);

}

- (BOOL)_handleActivityItemsConfigurationShare:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;

  v4 = a3;
  if (dyld_program_sdk_at_least())
  {
    -[UIResponder _effectiveActivityItemsConfigurationForSender:](self, "_effectiveActivityItemsConfigurationForSender:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[UIResponder _handleActivityItemsConfigurationShare:activityItemsConfiguration:](self, "_handleActivityItemsConfigurationShare:activityItemsConfiguration:", v4, v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)_handleActivityItemsConfigurationShare:(id)a3 activityItemsConfiguration:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  BOOL v11;
  id v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  id v31;
  id v32;
  uint64_t v33;
  void *i;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  id v40;
  uint64_t v41;
  NSObject *p_super;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  UIResponder *v51;
  UIResponder *v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  void *v58;
  double v59;
  void *v60;
  void *v61;
  UIResponder *v63;
  id v64;
  void *v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  uint8_t buf[16];
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v7)
    goto LABEL_4;
  v9 = v7;
  v10 = v6;
  if ((+[_UITextServiceSession availableTextServices](_UITextServiceSession, "availableTextServices") & 8) != 0
    && ((objc_opt_respondsToSelector() & 1) == 0
     || objc_msgSend(v9, "activityItemsConfigurationSupportsInteraction:", CFSTR("share"))))
  {
    v12 = v10;
    if ((objc_opt_respondsToSelector() & 1) != 0
      && (objc_msgSend(v12, "sender"),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          v14 = objc_msgSend(v13, "__isKindOfUIResponder"),
          v13,
          v14)
      && (objc_msgSend(v12, "sender"), (v15 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      v16 = v15;
      objc_msgSend(v15, "activityItemsConfiguration");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v17)
        goto LABEL_4;
    }
    else
    {

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v12, "_targetView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      _viewControllerToPresentFromBasedOnResponder(v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v19 = 0;
    }
    objc_msgSend(v19, "viewIfLoaded");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "_window");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v21)
    {
      _viewControllerToPresentFromBasedOnResponder(self);
      v22 = objc_claimAutoreleasedReturnValue();

      v19 = (void *)v22;
    }
    objc_msgSend(v19, "viewIfLoaded");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "_window");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v24)
    {
      -[UIResponder _window](self, "_window");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "rootViewController");
      v26 = objc_claimAutoreleasedReturnValue();

      v19 = (void *)v26;
    }
    objc_msgSend(v19, "viewIfLoaded");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "_window");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v28)
    {
      _UIActivityItemsConfigurationLog();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_185066000, v29, OS_LOG_TYPE_ERROR, "Could not derive a window scene from the responder returning an activity items configuration. Return a non-nil activity items configuration from a responder in a window scene to avoid this.", buf, 2u);
      }

      +[UIScene _mostActiveScene](UIScene, "_mostActiveScene");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v65 = v30;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v31 = v30;
      }
      else
      {
        objc_msgSend((id)UIApp, "connectedScenes");
        v66 = 0u;
        v67 = 0u;
        v68 = 0u;
        v69 = 0u;
        v32 = (id)objc_claimAutoreleasedReturnValue();
        v31 = (id)objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v66, v71, 16);
        if (v31)
        {
          v63 = self;
          v64 = v9;
          v33 = *(_QWORD *)v67;
          while (2)
          {
            for (i = 0; i != v31; i = (char *)i + 1)
            {
              if (*(_QWORD *)v67 != v33)
                objc_enumerationMutation(v32);
              v35 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * (_QWORD)i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v31 = v35;
                goto LABEL_35;
              }
            }
            v31 = (id)objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v66, v71, 16);
            if (v31)
              continue;
            break;
          }
LABEL_35:
          self = v63;
          v9 = v64;
        }

      }
      if (v31)
      {
        _preferredUIWindowInWindowScene(v31);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "rootViewController");
        v37 = objc_claimAutoreleasedReturnValue();

        v19 = (void *)v37;
      }

    }
    objc_msgSend(v19, "viewIfLoaded");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "_window");
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v39)
    {
      _UIActivityItemsConfigurationLog();
      p_super = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_185066000, p_super, OS_LOG_TYPE_ERROR, "Could not find a view controller to present a share sheet from. A share sheet will not be presented.", buf, 2u);
      }
      goto LABEL_56;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v40 = v12;
      objc_msgSend(v40, "_targetView");
      v41 = objc_claimAutoreleasedReturnValue();
      if (v41)
      {
        p_super = v41;
        objc_msgSend(v40, "_targetRect");
        -[NSObject convertRect:fromView:](p_super, "convertRect:fromView:", 0);
        v44 = v43;
        v46 = v45;
        v48 = v47;
        v50 = v49;

LABEL_55:
        v60 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D96D28]), "initWithActivityItemsConfiguration:", v9);
        objc_msgSend(v60, "popoverPresentationController");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "setSourceView:", p_super);
        objc_msgSend(v61, "setSourceRect:", v44, v46, v48, v50);
        objc_msgSend(v19, "presentViewController:animated:completion:", v60, 1, &__block_literal_global_197);

LABEL_56:
        v11 = 1;
        goto LABEL_57;
      }

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v51 = self;
      if (!v51)
      {
LABEL_53:
        objc_msgSend(v19, "view");
        p_super = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "view");
        v52 = (UIResponder *)objc_claimAutoreleasedReturnValue();
        -[UIResponder bounds](v52, "bounds");
        v54 = v57;
        objc_msgSend(v19, "view");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "bounds");
        v56 = v59;

        goto LABEL_54;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_53;
      -[UIResponder view](self, "view");
      v51 = (UIResponder *)objc_claimAutoreleasedReturnValue();
      if (!v51)
        goto LABEL_53;
    }
    v52 = v51;
    -[UIResponder bounds](v52, "bounds");
    v54 = v53;
    -[UIResponder bounds](v52, "bounds");
    v56 = v55;
    p_super = &v52->super;
LABEL_54:

    v46 = v56 * 0.5;
    v44 = v54 * 0.5;
    v50 = 1.0;
    v48 = 1.0;
    goto LABEL_55;
  }

LABEL_4:
  v11 = 0;
LABEL_57:

  return v11;
}

- (id)textInputSuggestionDelegate
{
  void *v2;
  void *v3;
  void *v4;

  -[UIResponder _selectableText](self, "_selectableText");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inputDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EDE925C8))
  {
    objc_msgSend(v2, "inputDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)set_textInputSource:(int64_t)a3
{
  void *v5;
  BOOL v6;
  uint64_t v7;
  UIResponder *v8;
  UIResponder *v9;
  id v10;

  +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (objc_opt_respondsToSelector() & 1) != 0 && -[UIResponder keyboardType](self, "keyboardType") == 122;
    if (a3 == 3 && v6)
      v7 = 2;
    else
      v7 = 5;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = self;
    else
      v8 = 0;
    v9 = v8;
    +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "updateEventSource:options:responder:", a3, v7, v9);

  }
  else
  {
    __UIPlatformFallbackInputSource = a3;
  }
}

- (_NSRange)_selectedNSRange
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  _NSRange result;

  -[UIResponder _selectableText](self, "_selectableText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "selectedTextRange");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = -[UIResponder _nsrangeForTextRange:](self, "_nsrangeForTextRange:", v5);
      v8 = v7;
    }
    else
    {
      v8 = 0;
      v6 = 0x7FFFFFFFFFFFFFFFLL;
    }

  }
  else
  {
    v8 = 0;
    v6 = 0x7FFFFFFFFFFFFFFFLL;
  }

  v9 = v6;
  v10 = v8;
  result.length = v10;
  result.location = v9;
  return result;
}

- (_NSRange)_selectedRangeWithinMarkedText
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSUInteger v13;
  NSUInteger v14;
  _NSRange result;

  -[UIResponder _selectableText](self, "_selectableText");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "selectedTextRange");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(v3, "markedTextRange");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      if (!v5
        || (objc_msgSend(v5, "start"),
            v7 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v4, "start"),
            v8 = (void *)objc_claimAutoreleasedReturnValue(),
            v9 = objc_msgSend(v3, "offsetFromPosition:toPosition:", v7, v8),
            v8,
            v7,
            v9 < 0))
      {
        v12 = 0;
        v9 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else
      {
        objc_msgSend(v4, "start");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "end");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v3, "offsetFromPosition:toPosition:", v10, v11);

      }
    }
    else
    {
      v12 = 0;
      v9 = 0x7FFFFFFFFFFFFFFFLL;
    }

  }
  else
  {
    v12 = 0;
    v9 = 0x7FFFFFFFFFFFFFFFLL;
  }

  v13 = v9;
  v14 = v12;
  result.length = v14;
  result.location = v13;
  return result;
}

- (void)_selectAll
{
  void *v2;
  id v3;

  -[UIResponder _selectableText](self, "_selectableText");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_fullRange");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSelectedTextRange:", v2);

}

- (unsigned)_characterInRelationToPosition:(id)a3 amount:(int)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  unsigned int v14;

  if (!a3)
    return 0;
  v6 = a3;
  -[UIResponder _selectableText](self, "_selectableText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "positionFromPosition:offset:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "positionFromPosition:offset:", v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textRangeFromPosition:toPosition:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textInRange:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "length"))
  {
    if (objc_msgSend(v11, "length") == 2
      && (v12 = objc_msgSend(v11, "characterAtIndex:", 0),
          v13 = objc_msgSend(v11, "characterAtIndex:", 1),
          (v12 & 0xFC00) == 0xD800)
      && (v13 & 0xFC00) == 0xDC00)
    {
      v14 = v13 + (v12 << 10) - 56613888;
    }
    else
    {
      v14 = objc_msgSend(v11, "characterAtIndex:", 0);
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)_wordContainingCaretSelection
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;

  -[UIResponder _selectableText](self, "_selectableText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectedTextRange");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "selectedTextRange");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEmpty");

    if (v6)
    {
      objc_msgSend(v3, "selectedTextRange");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "start");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIResponder _rangeOfEnclosingWord:](self, "_rangeOfEnclosingWord:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        objc_msgSend(v3, "textInRange:", v9);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v4 = 0;
      }

    }
    else
    {
      v4 = 0;
    }
  }

  return v4;
}

- (id)_fullText
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[UIResponder _selectableText](self, "_selectableText");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "beginningOfDocument");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endOfDocument");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textRangeFromPosition:toPosition:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "textInRange:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_setSelectionToPosition:(id)a3
{
  id v4;
  void *v5;
  id v6;

  if (a3)
  {
    v4 = a3;
    -[UIResponder _selectableText](self, "_selectableText");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "textRangeFromPosition:toPosition:", v4, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      objc_msgSend(v6, "setSelectedTextRange:", v5);

  }
}

- (BOOL)_selectionAtWordStart
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  BOOL v11;

  -[UIResponder _selectableText](self, "_selectableText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectedTextRange");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "start");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIResponder _rangeOfEnclosingWord:](self, "_rangeOfEnclosingWord:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "start");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "selectedTextRange");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "start");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v3, "comparePosition:toPosition:", v7, v9);

    v11 = v10 == 0;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)_selectionAtDocumentStart
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[UIResponder _selectableText](self, "_selectableText");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "selectedTextRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "start");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v2, "beginningOfDocument");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v2, "comparePosition:toPosition:", v5, v4) == 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)_selectionAtDocumentEnd
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[UIResponder _selectableText](self, "_selectableText");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "selectedTextRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "end");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v2, "endOfDocument");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v2, "comparePosition:toPosition:", v5, v4) == 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)_isEmptySelection
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[UIResponder _selectableText](self, "_selectableText");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "selectedTextRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "start");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "end");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v2, "comparePosition:toPosition:", v4, v5) == 0;

  return v6;
}

- (BOOL)_hasMarkedTextOrRangedSelection
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;

  -[UIResponder _selectableText](self, "_selectableText");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "markedTextRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    LOBYTE(v4) = 1;
  }
  else
  {
    objc_msgSend(v2, "selectedTextRange");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v2, "selectedTextRange");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v6, "isEmpty") ^ 1;

    }
    else
    {
      LOBYTE(v4) = 0;
    }

  }
  return v4;
}

- (void)_extendCurrentSelection:(int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;

  v3 = *(_QWORD *)&a3;
  -[UIResponder _selectableText](self, "_selectableText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_DWORD)v3)
  {
    v15 = v5;
    objc_msgSend(v5, "selectedTextRange");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = v15;
    if (v6)
    {
      objc_msgSend(v15, "selectedTextRange");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "start");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "selectedTextRange");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "end");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if ((int)v3 < 1)
      {
        -[UIResponder _clampedpositionFromPosition:offset:](self, "_clampedpositionFromPosition:offset:", v8, v3);
        v13 = objc_claimAutoreleasedReturnValue();
        v12 = v8;
        v8 = (void *)v13;
      }
      else
      {
        -[UIResponder _clampedpositionFromPosition:offset:](self, "_clampedpositionFromPosition:offset:", v10, v3);
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = v10;
        v10 = (void *)v11;
      }

      objc_msgSend(v15, "textRangeFromPosition:toPosition:", v8, v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setSelectedTextRange:", v14);

      v5 = v15;
    }
  }

}

- (void)_moveCurrentSelection:(int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v3 = *(_QWORD *)&a3;
  -[UIResponder _selectableText](self, "_selectableText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_DWORD)v3)
  {
    v14 = v5;
    objc_msgSend(v5, "selectedTextRange");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = v14;
    if (v6)
    {
      objc_msgSend(v14, "selectedTextRange");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isEmpty");

      if (v8)
      {
        objc_msgSend(v14, "selectedTextRange");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "start");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(v14, "selectedTextRange");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "end");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if ((int)v3 < 1)
          v3 = (v3 + 1);
        else
          v3 = (v3 - 1);
      }
      -[UIResponder _clampedpositionFromPosition:offset:](self, "_clampedpositionFromPosition:offset:", v10, v3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "textRangeFromPosition:toPosition:", v12, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
        objc_msgSend(v14, "setSelectedTextRange:", v13);

      v5 = v14;
    }
  }

}

- (void)_expandSelectionToBackwardDeletionClusterWithReinsertionOut:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  __CFString *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id *v23;
  id v24;

  -[UIResponder _selectableText](self, "_selectableText");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "selectedTextRange");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "start");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "end");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  if (!v4 || (objc_msgSend(v4, "isEmpty") & 1) != 0)
  {
    v8 = &stru_1E16EDF20;
    if (v7)
      goto LABEL_4;
LABEL_18:
    v19 = 0;
    v10 = 0;
    goto LABEL_29;
  }
  objc_msgSend(v24, "textInRange:", v4);
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_18;
LABEL_4:
  v23 = a3;
  v9 = v7;
  v10 = v7;
  while (1)
  {
    v11 = v8;
    v12 = -[__CFString length](v11, "length");
    if (v12)
    {
      v13 = v12;
      -[__CFString _rangeOfBackwardDeletionClusterAtIndex:](v11, "_rangeOfBackwardDeletionClusterAtIndex:", -[__CFString length](v11, "length") - 1);
      v15 = v14;
      v16 = v13 - v14;

      if (v13 != v15)
      {
        v8 = v11;
        v19 = v9;
        goto LABEL_20;
      }
    }
    else
    {

      v16 = 0;
    }
    v19 = v10;

    objc_msgSend(v24, "positionFromPosition:offset:", v19, -1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v24, "textRangeFromPosition:toPosition:", v10, v19);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        objc_msgSend(v24, "textInRange:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v18 = 0;
      }
    }
    else
    {
      v18 = 0;
      v17 = 0;
    }
    if (!objc_msgSend(v18, "length", v23))
      break;
    objc_msgSend(v18, "stringByAppendingString:", v11);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v9 = v19;
    if (!v10)
      goto LABEL_20;
  }

  v10 = 0;
  v8 = v11;
LABEL_20:
  v20 = v24;
  if (v23 && v16 >= 1)
  {
    v21 = v10;

    -[__CFString substringToIndex:](v8, "substringToIndex:", v16);
    *v23 = (id)objc_claimAutoreleasedReturnValue();
    v20 = v24;
    v19 = v21;
  }
  if (v19 != v7 && v19 && v6)
  {
    objc_msgSend(v20, "textRangeFromPosition:toPosition:", v19, v6);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
      objc_msgSend(v24, "setSelectedTextRange:", v22);

  }
LABEL_29:

}

- (void)_expandSelectionToStartOfWordBeforeCaretSelection
{
  -[UIResponder _expandSelectionToStartOfWordsBeforeCaretSelection:](self, "_expandSelectionToStartOfWordsBeforeCaretSelection:", 1);
}

- (void)_expandSelectionToStartOfWordsBeforeCaretSelection:(int)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[UIResponder _selectableText](self, "_selectableText");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "selectedTextRange");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a3 && v4)
  {
    objc_msgSend(v4, "start");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_positionAtStartOfWords:beforePosition:", a3, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v5, "end");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "textRangeFromPosition:toPosition:", v7, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setSelectedTextRange:", v9);

    }
  }

}

- (id)_positionWithinRange:(id)a3 farthestInDirection:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v6 = a3;
  -[UIResponder _selectableText](self, "_selectableText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (a4 == 1)
  {
    objc_msgSend(v6, "start");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else if (a4)
  {
    if (!v6)
    {
      v10 = 0;
      goto LABEL_8;
    }
    objc_msgSend(v7, "positionWithinRange:farthestInDirection:", v6, a4);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v6, "end");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v9;
LABEL_8:

  return v10;
}

- (int64_t)_opposingDirectionFromDirection:(int64_t)a3
{
  int64_t result;

  result = a3;
  if ((unint64_t)a3 <= 5)
    return qword_1866818E8[a3];
  return result;
}

- (id)_positionFromPosition:(id)a3 pastTextUnit:(int64_t)a4 inDirection:(int64_t)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  id v17;

  v8 = a3;
  -[UIResponder _selectableText](self, "_selectableText");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v10 = -3;
    while (!__CFADD__(v10++, 1))
    {
      objc_msgSend(v9, "tokenizer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "positionFromPosition:toBoundary:inDirection:", v8, a4, a5);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v13)
      {
        v17 = 0;
        v8 = 0;
        goto LABEL_12;
      }
      objc_msgSend(v9, "tokenizer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "isPosition:atBoundary:inDirection:", v13, a4, a5))
      {

LABEL_11:
        v17 = v13;
        v8 = v17;
        goto LABEL_12;
      }
      objc_msgSend(v9, "tokenizer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isPosition:atBoundary:inDirection:", v13, a4, -[UIResponder _opposingDirectionFromDirection:](self, "_opposingDirectionFromDirection:", a5));

      v8 = v13;
      if (v16)
        goto LABEL_11;
    }
  }
  v17 = 0;
LABEL_12:

  return v17;
}

- (id)_positionAtStartOfWords:(unint64_t)a3 beforePosition:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;
  void *v20;

  v6 = a4;
  -[UIResponder _selectableText](self, "_selectableText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (a3 && v6)
  {
    objc_msgSend(v7, "tokenizer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "rangeEnclosingPosition:withGranularity:inDirection:", v6, 1, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      objc_msgSend(v8, "tokenizer");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "positionFromPosition:toBoundary:inDirection:", v6, 1, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v19)
      {
        v10 = 0;
        goto LABEL_13;
      }
      objc_msgSend(v8, "tokenizer");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "rangeEnclosingPosition:withGranularity:inDirection:", v19, 1, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10)
        goto LABEL_13;
    }
    objc_msgSend(v10, "start");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (a3 >= 2)
    {
      v12 = a3 - 1;
      while (1)
      {
        objc_msgSend(v8, "tokenizer");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "positionFromPosition:toBoundary:inDirection:", v11, 1, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v14)
          break;
        objc_msgSend(v8, "tokenizer");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "positionFromPosition:toBoundary:inDirection:", v14, 1, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v16)
          break;

        v11 = v16;
        if (!--v12)
          goto LABEL_12;
      }
    }
    v16 = v11;
LABEL_12:
    v6 = v16;

    v10 = v6;
  }
  else
  {
    v6 = v6;
    v10 = v6;
  }
LABEL_13:

  return v10;
}

- (void)_setCaretSelectionAtEndOfSelection
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[UIResponder _selectableText](self, "_selectableText");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "selectedTextRange");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "end");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "end");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "textRangeFromPosition:toPosition:", v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSelectedTextRange:", v6);

  }
}

- (void)_deleteByWord
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  -[UIResponder _selectableText](self, "_selectableText");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "selectedTextRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "inputDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textWillChange:", v10);

  if (objc_msgSend(v3, "isEmpty"))
  {
    objc_msgSend(v3, "start");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_positionAtStartOfWords:beforePosition:", 1, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v3, "end");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "textRangeFromPosition:toPosition:", v6, v7);
      v8 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v8;
    }

  }
  -[UIResponder _deleteTextRange:](self, "_deleteTextRange:", v3);
  objc_msgSend(v10, "inputDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "textDidChange:", v10);

}

- (void)_deleteForwardByWord
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  -[UIResponder _selectableText](self, "_selectableText");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "selectedTextRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "inputDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textWillChange:", v18);

  if (objc_msgSend(v3, "isEmpty"))
  {
    -[UIResponder _selectableText](self, "_selectableText");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v3)
    {
      objc_msgSend(v5, "tokenizer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "end");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "rangeEnclosingPosition:withGranularity:inDirection:", v8, 1, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
        goto LABEL_4;
      objc_msgSend(v6, "tokenizer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "end");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "positionFromPosition:toBoundary:inDirection:", v15, 1, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        objc_msgSend(v6, "tokenizer");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "rangeEnclosingPosition:withGranularity:inDirection:", v16, 1, 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
LABEL_4:
          objc_msgSend(v3, "start");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "end");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "textRangeFromPosition:toPosition:", v10, v11);
          v12 = objc_claimAutoreleasedReturnValue();

          v3 = (void *)v12;
        }
      }
    }

  }
  -[UIResponder _deleteTextRange:](self, "_deleteTextRange:", v3);
  objc_msgSend(v18, "inputDelegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "textDidChange:", v18);

}

- (void)_deleteToStartOfLine
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  -[UIResponder _selectableText](self, "_selectableText");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "selectedTextRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "inputDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textWillChange:", v13);

  if (objc_msgSend(v3, "isEmpty"))
  {
    objc_msgSend(v13, "tokenizer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "start");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "positionFromPosition:toBoundary:inDirection:", v6, 4, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v3, "start");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v13, "comparePosition:toPosition:", v8, v7);

      if (v9 == 1)
      {
        objc_msgSend(v3, "start");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "textRangeFromPosition:toPosition:", v7, v10);
        v11 = objc_claimAutoreleasedReturnValue();

        v3 = (void *)v11;
      }
    }

  }
  -[UIResponder _deleteTextRange:](self, "_deleteTextRange:", v3);
  objc_msgSend(v13, "inputDelegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "textDidChange:", v13);

}

- (void)_deleteToEndOfLine
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  -[UIResponder _selectableText](self, "_selectableText");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "selectedTextRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "inputDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textWillChange:", v13);

  if (objc_msgSend(v3, "isEmpty"))
  {
    objc_msgSend(v13, "tokenizer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "end");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "positionFromPosition:toBoundary:inDirection:", v6, 4, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v3, "end");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v13, "comparePosition:toPosition:", v7, v8);

      if (v9 == 1)
      {
        objc_msgSend(v3, "end");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "textRangeFromPosition:toPosition:", v10, v7);
        v11 = objc_claimAutoreleasedReturnValue();

        v3 = (void *)v11;
      }
    }

  }
  -[UIResponder _deleteTextRange:](self, "_deleteTextRange:", v3);
  objc_msgSend(v13, "inputDelegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "textDidChange:", v13);

}

- (void)_deleteToEndOfParagraph
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  -[UIResponder _selectableText](self, "_selectableText");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "selectedTextRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "inputDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textWillChange:", v13);

  if (objc_msgSend(v3, "isEmpty"))
  {
    objc_msgSend(v13, "tokenizer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "end");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "positionFromPosition:toBoundary:inDirection:", v6, 3, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v3, "end");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v13, "comparePosition:toPosition:", v7, v8);

      if (v9 == 1)
      {
        objc_msgSend(v3, "end");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "textRangeFromPosition:toPosition:", v10, v7);
        v11 = objc_claimAutoreleasedReturnValue();

        v3 = (void *)v11;
      }
    }

  }
  -[UIResponder _deleteTextRange:](self, "_deleteTextRange:", v3);
  objc_msgSend(v13, "inputDelegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "textDidChange:", v13);

}

- (void)_deleteTextRange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  id v8;
  id v9;

  v4 = a3;
  -[UIResponder _selectableText](self, "_selectableText");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "selectedTextRange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSelectedTextRange:", v4);

  objc_msgSend(v9, "selectedTextRange");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEmpty");

  if ((v7 & 1) == 0)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v8 = v9;
      if (objc_msgSend(v8, "keyboardInputShouldDelete:", v8))
        objc_msgSend(v8, "deleteBackward");
      else
        objc_msgSend(v8, "setSelectedTextRange:", v5);

    }
    else
    {
      objc_msgSend(v9, "deleteBackward");
    }
  }

}

- (void)_deleteBackwardAndNotify:(BOOL)a3
{
  id v3;

  -[UIResponder _keyInput](self, "_keyInput", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deleteBackward");

}

- (void)_deleteForwardAndNotify:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  -[UIResponder _selectableText](self, "_selectableText", a3);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "selectedTextRange");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "inputDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textWillChange:", v14);

  if (objc_msgSend(v4, "isEmpty"))
  {
    objc_msgSend(v14, "tokenizer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "end");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "positionFromPosition:toBoundary:inDirection:", v7, 0, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "end");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v14, "comparePosition:toPosition:", v8, v9);

      if (v10 == 1)
      {
        objc_msgSend(v4, "end");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "textRangeFromPosition:toPosition:", v11, v8);
        v12 = objc_claimAutoreleasedReturnValue();

        v4 = (void *)v12;
      }
    }

  }
  -[UIResponder _deleteTextRange:](self, "_deleteTextRange:", v4);
  objc_msgSend(v14, "inputDelegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "textDidChange:", v14);

}

- (void)_transpose
{
  void *v2;
  void *v3;
  void *v4;
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
  void *v17;
  void *v18;
  id v19;

  -[UIResponder _selectableText](self, "_selectableText");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "selectedTextRange");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEmpty"))
  {
    objc_msgSend(v19, "inputDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "textWillChange:", v19);

    objc_msgSend(v19, "tokenizer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "start");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "positionFromPosition:toBoundary:inDirection:", v5, 0, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "tokenizer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "end");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "positionFromPosition:toBoundary:inDirection:", v8, 0, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6 && v9)
    {
      objc_msgSend(v2, "start");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "textRangeFromPosition:toPosition:", v6, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v2, "end");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "textRangeFromPosition:toPosition:", v12, v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11 && v13)
      {
        objc_msgSend(v19, "textInRange:", v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "textInRange:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "stringByAppendingString:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "textRangeFromPosition:toPosition:", v6, v9);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
          objc_msgSend(v19, "replaceRange:withText:", v17, v16);

      }
    }
    objc_msgSend(v19, "inputDelegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "textDidChange:", v19);

  }
}

- (void)_replaceCurrentWordWithText:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[UIResponder _selectableText](self, "_selectableText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectedTextRange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "start");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIResponder _rangeOfEnclosingWord:](self, "_rangeOfEnclosingWord:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    objc_msgSend(v4, "replaceRange:withText:", v7, v8);

}

- (void)_replaceDocumentWithText:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[UIResponder _selectableText](self, "_selectableText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIResponder _fullRange](self, "_fullRange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((objc_msgSend(v5, "isEmpty") & 1) == 0)
      objc_msgSend(v4, "replaceRange:withText:", v6, &stru_1E16EDF20);
    objc_msgSend(v4, "insertText:", v7);
  }

}

- (void)_scrollRectToVisible:(CGRect)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  double height;
  double width;
  double y;
  double x;
  void *v9;
  void *v10;
  id v11;

  v4 = a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIResponder _selectableText](self, "_selectableText");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "textInputView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v9, "performSelector:", sel__enclosingScrollerIncludingSelf);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "convertRect:fromView:", v9, x, y, width, height);
    objc_msgSend(v10, "scrollRectToVisible:animated:", v4);

  }
}

- (id)_normalizedStringForRangeComparison:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "_stringByReplacingCharacter:withCharacter:", 160, 32);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_stringByReplacingCharacter:withCharacter:", 8217, 39);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "_stringByReplacingCharacter:withCharacter:", 8216, 39);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_rangeOfText:(id)a3 endingAtPosition:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  unsigned int v17;
  void *v18;
  unint64_t v19;
  void *v21;
  void *v22;

  v6 = a3;
  v7 = a4;
  -[UIResponder _selectableText](self, "_selectableText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
  {
    objc_msgSend(v8, "_rangeOfEnclosingWord:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v8, "textInRange:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
    if (objc_msgSend(v10, "isEqualToString:", v6))
    {
      v12 = v9;
      v11 = v12;
LABEL_29:

      goto LABEL_30;
    }
    objc_msgSend(v8, "positionFromPosition:offset:", v7, -objc_msgSend(v6, "length"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      objc_msgSend(v8, "beginningOfDocument");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "textRangeFromPosition:toPosition:", v13, v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v8, "textInRange:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = objc_msgSend(v15, "length");
      if (v16 <= objc_msgSend(v6, "length"))
      {
        v12 = v14;
        v10 = v15;
LABEL_25:
        -[UIResponder _normalizedStringForRangeComparison:](self, "_normalizedStringForRangeComparison:", v10);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIResponder _normalizedStringForRangeComparison:](self, "_normalizedStringForRangeComparison:", v6);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v21, "isEqualToString:", v22))
          v11 = v12;
        else
          v11 = 0;

        goto LABEL_29;
      }
      v17 = 0;
      while (1)
      {
        v18 = v13;
        objc_msgSend(v8, "positionFromPosition:offset:", v13, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v13)
          break;
        if (objc_msgSend(v8, "comparePosition:toPosition:", v13, v7) != -1)
        {

          break;
        }
        objc_msgSend(v8, "textRangeFromPosition:toPosition:", v13, v7);
        v12 = (id)objc_claimAutoreleasedReturnValue();

        if (!v12)
          goto LABEL_24;
        objc_msgSend(v8, "textInRange:", v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        v19 = objc_msgSend(v10, "length");
        if (v19 > objc_msgSend(v6, "length"))
        {
          v14 = v12;
          v15 = v10;
          if (v17++ < 9)
            continue;
        }
        goto LABEL_25;
      }

      v13 = 0;
    }
    else
    {
      v15 = v10;
    }
LABEL_24:

    v12 = 0;
    v10 = 0;
    goto LABEL_25;
  }
  objc_msgSend(v8, "textRangeFromPosition:toPosition:", v7, v7);
  v11 = (id)objc_claimAutoreleasedReturnValue();
LABEL_30:

  return v11;
}

- (id)_rangeOfTextUnit:(int64_t)a3 enclosingPosition:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  if (v6)
  {
    -[UIResponder _selectableText](self, "_selectableText");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "tokenizer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "rangeEnclosingPosition:withGranularity:inDirection:", v6, a3, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      objc_msgSend(v7, "tokenizer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "rangeEnclosingPosition:withGranularity:inDirection:", v6, a3, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_rangeOfEnclosingWord:(id)a3
{
  return -[UIResponder _rangeOfTextUnit:enclosingPosition:](self, "_rangeOfTextUnit:enclosingPosition:", 1, a3);
}

- (id)_rangeOfLineEnclosingPosition:(id)a3
{
  return -[UIResponder _rangeOfTextUnit:enclosingPosition:](self, "_rangeOfTextUnit:enclosingPosition:", 4, a3);
}

- (id)_rangeOfSentenceEnclosingPosition:(id)a3
{
  return -[UIResponder _rangeOfTextUnit:enclosingPosition:](self, "_rangeOfTextUnit:enclosingPosition:", 2, a3);
}

- (id)_rangeOfParagraphEnclosingPosition:(id)a3
{
  return -[UIResponder _rangeOfTextUnit:enclosingPosition:](self, "_rangeOfTextUnit:enclosingPosition:", 3, a3);
}

- (id)_fullRange
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[UIResponder _selectableText](self, "_selectableText");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "beginningOfDocument");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endOfDocument");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textRangeFromPosition:toPosition:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_rangeSpanningTextUnit:(int64_t)a3 andPosition:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;

  v6 = a4;
  if (v6)
  {
    -[UIResponder _selectableText](self, "_selectableText");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIResponder _rangeOfTextUnit:enclosingPosition:](self, "_rangeOfTextUnit:enclosingPosition:", a3, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
LABEL_16:

      goto LABEL_17;
    }
    objc_msgSend(v7, "tokenizer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 1;
    objc_msgSend(v9, "positionFromPosition:toBoundary:inDirection:", v6, a3, 1);
    v11 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v11;
    if (!v11)
    {
      objc_msgSend(v7, "tokenizer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "positionFromPosition:toBoundary:inDirection:", v6, a3, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
      {
        v15 = 0;
        goto LABEL_11;
      }
      v10 = 0;
    }
    objc_msgSend(v7, "tokenizer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "rangeEnclosingPosition:withGranularity:inDirection:", v12, a3, v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v15, "start");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        v17 = v7;
        v18 = v16;
        v19 = v6;
LABEL_13:
        objc_msgSend(v17, "textRangeFromPosition:toPosition:", v18, v19);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:

        goto LABEL_16;
      }
      goto LABEL_14;
    }
LABEL_11:
    objc_msgSend(v15, "end");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v17 = v7;
      v18 = v6;
      v19 = v16;
      goto LABEL_13;
    }
LABEL_14:
    v8 = 0;
    goto LABEL_15;
  }
  v8 = 0;
LABEL_17:

  return v8;
}

- (BOOL)_range:(id)a3 containsRange:(id)a4
{
  id v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;
  NSRange v13;
  NSRange v17;
  NSRange v18;

  v6 = a4;
  v7 = -[UIResponder _nsrangeForTextRange:](self, "_nsrangeForTextRange:", a3);
  v9 = v8;
  v10 = -[UIResponder _nsrangeForTextRange:](self, "_nsrangeForTextRange:", v6);
  v12 = v11;

  if (!v12)
    return v10 >= v7 && v10 - v7 < v9;
  v17.location = v7;
  v17.length = v9;
  v18.location = v10;
  v18.length = v12;
  v13 = NSIntersectionRange(v17, v18);
  return v10 == v13.location && v12 == v13.length;
}

- (BOOL)_range:(id)a3 intersectsRange:(id)a4
{
  id v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;
  NSRange v14;
  NSRange v15;

  v6 = a4;
  v7 = -[UIResponder _nsrangeForTextRange:](self, "_nsrangeForTextRange:", a3);
  v9 = v8;
  v10 = -[UIResponder _nsrangeForTextRange:](self, "_nsrangeForTextRange:", v6);
  v12 = v11;

  v14.location = v7;
  v14.length = v9;
  v15.location = v10;
  v15.length = v12;
  return NSIntersectionRange(v14, v15).length != 0;
}

- (BOOL)_range:(id)a3 isEqualToRange:(id)a4
{
  id v6;
  id v7;
  void *v8;
  BOOL v9;
  UIResponder *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 == v7)
  {
    v9 = 1;
  }
  else
  {
    v9 = 0;
    if (v6 && v7)
    {
      v10 = self;
      objc_msgSend(v6, "start");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "start");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[UIResponder comparePosition:toPosition:](v10, "comparePosition:toPosition:", v11, v12);

      objc_msgSend(v6, "end");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "end");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v13 | -[UIResponder comparePosition:toPosition:](v10, "comparePosition:toPosition:", v14, v15);

      v9 = v16 == 0;
    }
  }

  return v9;
}

- (id)_findBoundaryPositionClosestToPosition:(id)a3 withGranularity:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;

  v6 = a3;
  v7 = v6;
  if (a4 == 5)
  {
    -[UIResponder _findDocumentBoundaryFromPosition:](self, "_findDocumentBoundaryFromPosition:", v6);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else if (a4 == 1)
  {
    -[UIResponder _findPleasingWordBoundaryFromPosition:](self, "_findPleasingWordBoundaryFromPosition:", v6);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = v6;
  }
  v9 = v8;

  return v9;
}

- (id)_findPleasingWordBoundaryFromPosition:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  int v15;
  void *v16;

  v4 = a3;
  -[UIResponder _selectableText](self, "_selectableText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tokenizer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isPosition:atBoundary:inDirection:", v4, 4, 0))
    goto LABEL_2;
  v9 = objc_msgSend(v6, "isPosition:withinTextUnit:inDirection:", v4, 1, 0);
  objc_msgSend(v5, "tokenizer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v9)
  {
    v15 = objc_msgSend(v10, "isPosition:atBoundary:inDirection:", v4, 1, 1);

    if (!v15)
    {
      objc_msgSend(v5, "tokenizer");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "positionFromPosition:toBoundary:inDirection:", v4, 1, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
        goto LABEL_12;
      objc_msgSend(v5, "endOfDocument");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    }
LABEL_2:
    v7 = v4;
LABEL_3:
    v8 = v7;
    goto LABEL_12;
  }
  objc_msgSend(v10, "rangeEnclosingPosition:withGranularity:inDirection:", v4, 1, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "start");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v5, "offsetFromPosition:toPosition:", v13, v4);

  if (v14 > 1)
    objc_msgSend(v12, "end");
  else
    objc_msgSend(v12, "start");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_12:
  return v8;
}

- (id)_findDocumentBoundaryFromPosition:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v4 = a3;
  -[UIResponder _selectableText](self, "_selectableText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "beginningOfDocument");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endOfDocument");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "offsetFromPosition:toPosition:", v6, v4);
  v9 = objc_msgSend(v5, "offsetFromPosition:toPosition:", v4, v7);

  if (v8 <= v9)
    v10 = v6;
  else
    v10 = v7;
  v11 = v10;

  return v11;
}

- (id)_underlineRectsByDocumentLineForSelectionRange:(id)a3
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
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;

  v4 = a3;
  -[UIResponder _selectableText](self, "_selectableText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tokenizer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "start");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rangeEnclosingPosition:withGranularity:inDirection:", v7, 4, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "end");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rangeEnclosingPosition:withGranularity:inDirection:", v9, 4, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8
    || !v10
    || (objc_msgSend(v8, "isEmpty") & 1) != 0
    || (objc_msgSend(v10, "isEmpty") & 1) != 0
    || (objc_msgSend(v8, "isEqual:", v10) & 1) != 0)
  {
    goto LABEL_9;
  }
  objc_msgSend(v8, "start");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "start");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "isEqual:", v12))
  {

LABEL_9:
    objc_msgSend(v5, "selectionRectsForRange:", v4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  objc_msgSend(v8, "end");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "end");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v13, "isEqual:", v14);

  if (v28)
    goto LABEL_9;
  v15 = (void *)objc_opt_new();
  objc_msgSend(v4, "start");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "end");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textRangeFromPosition:toPosition:", v17, v18);
  v19 = objc_claimAutoreleasedReturnValue();

  v29 = (void *)v19;
  -[UIResponder _updateSelectedRects:byTrimmingWhitespaceInRange:inDocument:](self, "_updateSelectedRects:byTrimmingWhitespaceInRange:inDocument:", v15, v19, v5);
  objc_msgSend(v8, "end");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rangeEnclosingPosition:withGranularity:inDirection:", v20, 4, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    while ((objc_msgSend(v21, "isEqual:", v10) & 1) == 0)
    {
      objc_msgSend(v21, "end");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "rangeEnclosingPosition:withGranularity:inDirection:", v22, 4, 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v23, "isEqual:", v21))
      {

        break;
      }
      objc_msgSend(v5, "selectionRectsForRange:", v21);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addObjectsFromArray:", v24);

      v21 = v23;
      if (!v23)
        break;
    }

  }
  objc_msgSend(v10, "start");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "end");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textRangeFromPosition:toPosition:", v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
    -[UIResponder _updateSelectedRects:byTrimmingWhitespaceInRange:inDocument:](self, "_updateSelectedRects:byTrimmingWhitespaceInRange:inDocument:", v15, v27, v5);

LABEL_10:
  return v15;
}

- (void)_updateSelectedRects:(id)a3 byTrimmingWhitespaceInRange:(id)a4 inDocument:(id)a5
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
  id v18;

  v18 = a3;
  v7 = a4;
  v8 = a5;
  v9 = v8;
  if (v7)
  {
    objc_msgSend(v8, "textInRange:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringByTrimmingCharactersInSet:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v12, "length"))
    {
      objc_msgSend(v7, "start");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "positionFromPosition:offset:", v13, objc_msgSend(v12, "length"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "start");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "textRangeFromPosition:toPosition:", v15, v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        objc_msgSend(v9, "selectionRectsForRange:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addObjectsFromArray:", v17);

      }
    }

  }
}

- (id)_rangeOfSmartSelectionIncludingRange:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  int v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  _QWORD v61[5];
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  void *v65;
  __int128 v66;

  v4 = a3;
  if (v4)
  {
    -[UIResponder _selectableText](self, "_selectableText");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v4;
    objc_msgSend(v5, "tokenizer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "start");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "positionFromPosition:toBoundary:inDirection:", v8, 2, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v60 = v4;
    if (v9)
    {
      v11 = v9;
    }
    else
    {
      objc_msgSend(v5, "beginningOfDocument");
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    v12 = v11;

    objc_msgSend(v6, "start");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v5, "offsetFromPosition:toPosition:", v12, v13);

    if (v14 >= 65)
    {
      objc_msgSend(v6, "start");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "positionFromPosition:offset:", v15, -64);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "positionFromPosition:toBoundary:inDirection:", v16, 1, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
      {
        objc_msgSend(v6, "start");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "positionFromPosition:offset:", v17, -64);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "positionFromPosition:toBoundary:inDirection:", v18, 0, 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(v6, "start");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v5, "comparePosition:toPosition:", v12, v19);

      if (v20 == 1)
      {
        objc_msgSend(v6, "start");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "positionFromPosition:toBoundary:inDirection:", v21, 0, 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v22;
        if (v22)
        {
          v24 = v22;
        }
        else
        {
          objc_msgSend(v6, "start");
          v24 = (id)objc_claimAutoreleasedReturnValue();
        }
        v25 = v24;

        v12 = v25;
      }
    }
    objc_msgSend(v6, "end");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "positionFromPosition:toBoundary:inDirection:", v26, 2, 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if (v27)
    {
      v29 = v27;
    }
    else
    {
      objc_msgSend(v5, "endOfDocument");
      v29 = (id)objc_claimAutoreleasedReturnValue();
    }
    v30 = v29;

    objc_msgSend(v6, "end");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v5, "offsetFromPosition:toPosition:", v31, v30);

    if (v32 >= 65)
    {
      objc_msgSend(v6, "end");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "positionFromPosition:offset:", v33, 64);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "positionFromPosition:toBoundary:inDirection:", v34, 1, 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v30)
      {
        objc_msgSend(v6, "end");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "positionFromPosition:offset:", v35, 64);
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "positionFromPosition:toBoundary:inDirection:", v36, 0, 1);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(v6, "end");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v5, "comparePosition:toPosition:", v37, v30);

      if (v38 == 1)
      {
        objc_msgSend(v6, "end");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "positionFromPosition:toBoundary:inDirection:", v39, 0, 0);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = v40;
        if (v40)
        {
          v42 = v40;
        }
        else
        {
          objc_msgSend(v6, "end");
          v42 = (id)objc_claimAutoreleasedReturnValue();
        }
        v43 = v42;

        v30 = v43;
      }
    }
    v59 = v7;
    objc_msgSend(v5, "textRangeFromPosition:toPosition:", v12, v30);
    v44 = objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) == 0
      || (v45 = objc_msgSend(v5, "keyboardType"), v46 = 420, v45 != 3) && v45 != 10 && v45 != 120)
    {
      v46 = 428;
    }
    objc_msgSend(v5, "beginningOfDocument");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = v12;
    v48 = objc_msgSend(v5, "offsetFromPosition:toPosition:", v47, v12);

    v49 = -[UIResponder _nsrangeForTextRange:](self, "_nsrangeForTextRange:", v6);
    v51 = v50;
    v57 = (void *)v44;
    objc_msgSend(v5, "textInRange:", v44);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = 0;
    v63 = &v62;
    v64 = 0x3010000000;
    v65 = &unk_18685B0AF;
    v66 = xmmword_186679030;
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v61[0] = MEMORY[0x1E0C809B0];
    v61[1] = 3221225472;
    v61[2] = __74__UIResponder_UITextInput_Internal___rangeOfSmartSelectionIncludingRange___block_invoke;
    v61[3] = &unk_1E16D8F88;
    v61[4] = &v62;
    objc_msgSend(v53, "smartSelectionForTextInDocument:inRange:options:completion:", v52, v49 - v48, v51, v46, v61);

    v54 = v63[4];
    if (v54 != 0x7FFFFFFFFFFFFFFFLL && v63[5])
    {
      v63[4] = v54 + v48;
      -[UIResponder _textRangeFromNSRange:](self, "_textRangeFromNSRange:");
      v55 = objc_claimAutoreleasedReturnValue();

      v6 = (id)v55;
    }
    _Block_object_dispose(&v62, 8);

    v4 = v60;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t __74__UIResponder_UITextInput_Internal___rangeOfSmartSelectionIncludingRange___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  v3 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  *(_QWORD *)(v3 + 32) = a2;
  *(_QWORD *)(v3 + 40) = a3;
  return result;
}

- (id)_clampedpositionFromPosition:(id)a3 offset:(int)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;

  v6 = a3;
  v7 = v6;
  if (a4)
  {
    -[UIResponder _selectableText](self, "_selectableText");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (a4 < 1)
    {
      objc_msgSend(v8, "positionFromPosition:offset:", v7, a4);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      if (!v10)
      {
        objc_msgSend(v9, "beginningOfDocument");
        v11 = objc_claimAutoreleasedReturnValue();
        goto LABEL_8;
      }
    }
    else
    {
      objc_msgSend(v8, "positionFromPosition:offset:", v7, a4);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      if (!v10)
      {
        objc_msgSend(v9, "endOfDocument");
        v11 = objc_claimAutoreleasedReturnValue();
LABEL_8:
        v10 = (id)v11;
      }
    }

    goto LABEL_10;
  }
  v10 = v6;
LABEL_10:

  return v10;
}

- (id)_rangeFromCurrentRangeWithDelta:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSUInteger v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;

  length = a3.length;
  location = a3.location;
  -[UIResponder _selectableText](self, "_selectableText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectedTextRange");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (location | length)
  {
    v9 = length + location;
    objc_msgSend(v6, "start");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "end");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (location)
    {
      objc_msgSend(v5, "positionFromPosition:offset:", v10, location);
      v12 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v12;
      if (!v12)
      {
        if ((location & 0x8000000000000000) != 0)
          objc_msgSend(v5, "beginningOfDocument");
        else
          objc_msgSend(v5, "endOfDocument");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
    if (v9)
    {
      objc_msgSend(v5, "positionFromPosition:offset:", v11, v9);
      v13 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v13;
      if (!v13)
      {
        if ((v9 & 0x8000000000000000) != 0)
        {
          v14 = v10;
        }
        else
        {
          objc_msgSend(v5, "endOfDocument");
          v14 = (id)objc_claimAutoreleasedReturnValue();
        }
        v11 = v14;
      }
    }
    objc_msgSend(v5, "textRangeFromPosition:toPosition:", v10, v11);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v15;
    if (v15)
      v17 = (void *)v15;
    else
      v17 = v7;
    v8 = v17;

  }
  else
  {
    v8 = v6;
  }

  return v8;
}

- (void)_updateSelectionWithTextRange:(id)a3 withAffinityDownstream:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  -[UIResponder _selectableText](self, "_selectableText");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_setSelectedTextRange:withAffinityDownstream:", v6, v4);

}

- (id)_setSelectionRangeWithHistory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;

  v4 = a3;
  -[UIResponder _selectableText](self, "_selectableText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cursor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    goto LABEL_19;
  if (objc_msgSend(v4, "anchor") == 1)
  {
    objc_msgSend(v4, "cursor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    objc_msgSend(v4, "setEnd:", v7);
    goto LABEL_6;
  }
  v8 = objc_msgSend(v4, "anchor");
  objc_msgSend(v4, "cursor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStart:", v7);
  if (v8 != 2)
    goto LABEL_5;
LABEL_6:

  objc_msgSend(v4, "start");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "end");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v5, "comparePosition:toPosition:", v9, v10);

  if (v11 >= 1)
  {
    if (objc_msgSend(v4, "anchor") == 1)
      v12 = 2;
    else
      v12 = 1;
    objc_msgSend(v4, "setAnchor:", v12);
  }
  objc_msgSend(v4, "start");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "end");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textRangeFromPosition:toPosition:", v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIResponder _updateSelectionWithTextRange:withAffinityDownstream:](self, "_updateSelectionWithTextRange:withAffinityDownstream:", v15, objc_msgSend(v4, "affinityDownstream"));
  if (objc_msgSend(v4, "anchor"))
  {
    if (objc_msgSend(v4, "anchor") == 1)
      objc_msgSend(v5, "_lastRectForRange:", v15);
    else
      objc_msgSend(v5, "firstRectForRange:", v15);
    objc_msgSend(v5, "_scrollRectToVisible:animated:", 0);
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *MEMORY[0x1E0DD9898];
    -[UIResponder webView](self, "webView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "postNotificationName:object:", v17, v18);

  }
LABEL_19:

  return v4;
}

- (id)_setHistory:(id)a3 withExtending:(BOOL)a4 withAnchor:(int)a5 withAffinityDownstream:(BOOL)a6
{
  _BOOL8 v6;
  uint64_t v7;
  _BOOL4 v8;
  UITextInputArrowKeyHistory *v10;
  UITextInputArrowKeyHistory *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;

  v6 = a6;
  v7 = *(_QWORD *)&a5;
  v8 = a4;
  v10 = (UITextInputArrowKeyHistory *)a3;
  if (v10)
  {
    v11 = v10;
    if (!v8)
      -[UITextInputArrowKeyHistory setAnchor:](v10, "setAnchor:", 0);
  }
  else
  {
    v11 = objc_alloc_init(UITextInputArrowKeyHistory);
  }
  -[UIResponder _selectableText](self, "_selectableText");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "selectedTextRange");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "start");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInputArrowKeyHistory setStart:](v11, "setStart:", v14);

  objc_msgSend(v12, "selectedTextRange");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "end");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInputArrowKeyHistory setEnd:](v11, "setEnd:", v16);

  v17 = -[UITextInputArrowKeyHistory anchor](v11, "anchor");
  objc_msgSend(v12, "selectedTextRange");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if ((_DWORD)v7 == 2)
  {
    if (v17 == 1)
    {
LABEL_7:
      objc_msgSend(v18, "end");
      v20 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
  }
  else if (v17 != 2)
  {
    goto LABEL_7;
  }
  objc_msgSend(v18, "start");
  v20 = objc_claimAutoreleasedReturnValue();
LABEL_10:
  v21 = (void *)v20;
  -[UITextInputArrowKeyHistory setCursor:](v11, "setCursor:", v20);

  -[UITextInputArrowKeyHistory startPosition](v11, "startPosition");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v22)
  {
    -[UITextInputArrowKeyHistory cursor](v11, "cursor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextInputArrowKeyHistory setStartPosition:](v11, "setStartPosition:", v23);

    if (v8)
      goto LABEL_12;
LABEL_16:
    v7 = 0;
LABEL_17:
    -[UITextInputArrowKeyHistory setAnchor:](v11, "setAnchor:", v7);
    goto LABEL_18;
  }
  if (!v8)
    goto LABEL_16;
LABEL_12:
  if (!-[UITextInputArrowKeyHistory anchor](v11, "anchor")
    || -[UIResponder _isEmptySelection](self, "_isEmptySelection"))
  {
    goto LABEL_17;
  }
LABEL_18:
  -[UITextInputArrowKeyHistory setAffinityDownstream:](v11, "setAffinityDownstream:", v6);

  return v11;
}

- (id)_moveToStartOfWord:(BOOL)a3 withHistory:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  void *v32;
  void *v33;
  char v34;
  void *v35;
  void *v36;

  v4 = a3;
  v6 = a4;
  -[UIResponder _selectableText](self, "_selectableText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "selectedTextRange");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v26 = 0;
    v9 = v6;
    goto LABEL_9;
  }
  -[UIResponder _setHistory:withExtending:withAnchor:withAffinityDownstream:](self, "_setHistory:withExtending:withAnchor:withAffinityDownstream:", v6, v4, 2, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setAmount:", 0);
  objc_msgSend(v7, "tokenizer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cursor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "isPosition:withinTextUnit:inDirection:", v11, 1, 1);

  if ((v12 & 1) != 0)
    goto LABEL_7;
  objc_msgSend(v7, "tokenizer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cursor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "positionFromPosition:toBoundary:inDirection:", v14, 1, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
LABEL_4:
    objc_msgSend(v7, "tokenizer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cursor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "isPosition:withinTextUnit:inDirection:", v17, 1, 1);

    if ((v18 & 1) == 0)
    {
      objc_msgSend(v7, "tokenizer");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "cursor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "positionFromPosition:toBoundary:inDirection:", v20, 1, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setCursor:", v21);

    }
LABEL_7:
    objc_msgSend(v7, "tokenizer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cursor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "positionFromPosition:toBoundary:inDirection:", v23, 1, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCursor:", v24);

    objc_msgSend(v9, "cursor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setStartPosition:", v25);

    -[UIResponder _setSelectionRangeWithHistory:](self, "_setSelectionRangeWithHistory:", v9);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  objc_msgSend(v9, "cursor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  while (1)
  {
    objc_msgSend(v7, "beginningOfDocument");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v7, "comparePosition:toPosition:", v29, v15);

    if (!v30)
      break;
    if (v28 && !objc_msgSend(v7, "comparePosition:toPosition:", v28, v15))
    {
      objc_msgSend(v7, "beginningOfDocument");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setCursor:", v35);

      objc_msgSend(v9, "cursor");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setStartPosition:", v36);

      break;
    }
    v31 = v15;

    objc_msgSend(v7, "tokenizer");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "positionFromPosition:toBoundary:inDirection:", v31, 3, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "tokenizer");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "isPosition:atBoundary:inDirection:", v15, 3, 1);

    v28 = v31;
    if ((v34 & 1) == 0)
    {
      objc_msgSend(v9, "setCursor:", v15);

      goto LABEL_4;
    }
  }
  -[UIResponder _setSelectionRangeWithHistory:](self, "_setSelectionRangeWithHistory:", v9);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  return v26;
}

- (id)_moveToEndOfWord:(BOOL)a3 withHistory:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v4 = a3;
  v6 = a4;
  -[UIResponder _selectableText](self, "_selectableText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "selectedTextRange");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[UIResponder _setHistory:withExtending:withAnchor:withAffinityDownstream:](self, "_setHistory:withExtending:withAnchor:withAffinityDownstream:", v6, v4, 1, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setAmount:", 0);
    objc_msgSend(v7, "tokenizer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cursor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isPosition:withinTextUnit:inDirection:", v11, 1, 0);

    if ((v12 & 1) == 0)
    {
      objc_msgSend(v7, "tokenizer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "cursor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "positionFromPosition:toBoundary:inDirection:", v14, 1, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
        objc_msgSend(v9, "setCursor:", v15);

    }
    objc_msgSend(v7, "tokenizer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cursor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "positionFromPosition:toBoundary:inDirection:", v17, 1, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCursor:", v18);

    objc_msgSend(v9, "cursor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v19)
    {
      objc_msgSend(v7, "endOfDocument");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setCursor:", v20);

    }
    objc_msgSend(v9, "cursor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setStartPosition:", v21);

    -[UIResponder _setSelectionRangeWithHistory:](self, "_setSelectionRangeWithHistory:", v9);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = 0;
    v9 = v6;
  }

  return v22;
}

- (id)_moveToStartOfLine:(BOOL)a3 withHistory:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;

  v4 = a3;
  v6 = a4;
  -[UIResponder _selectableText](self, "_selectableText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "selectedTextRange");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = objc_msgSend(v6, "affinityDownstream");
    -[UIResponder _setHistory:withExtending:withAnchor:withAffinityDownstream:](self, "_setHistory:withExtending:withAnchor:withAffinityDownstream:", v6, v4, 2, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setAmount:", 0);
    objc_msgSend(v7, "tokenizer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "selectedTextRange");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "end");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "isPosition:atBoundary:inDirection:", v13, 3, 1) & 1) == 0)
    {
      if ((v9 & 1) != 0)
      {
        objc_msgSend(v7, "tokenizer");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "cursor");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v14, "isPosition:atBoundary:inDirection:", v15, 4, 1);

        if ((v16 & 1) != 0)
          goto LABEL_10;
      }
      else
      {

      }
      objc_msgSend(v7, "tokenizer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "cursor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "positionFromPosition:toBoundary:inDirection:", v12, 4, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setCursor:", v13);
    }

LABEL_10:
    objc_msgSend(v10, "cursor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setStartPosition:", v18);

    -[UIResponder _setSelectionRangeWithHistory:](self, "_setSelectionRangeWithHistory:", v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  v17 = 0;
  v10 = v6;
LABEL_11:

  return v17;
}

- (id)_moveToEndOfLine:(BOOL)a3 withHistory:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;

  v4 = a3;
  v6 = a4;
  -[UIResponder _selectableText](self, "_selectableText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "selectedTextRange");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = objc_msgSend(v6, "affinityDownstream");
    -[UIResponder _setHistory:withExtending:withAnchor:withAffinityDownstream:](self, "_setHistory:withExtending:withAnchor:withAffinityDownstream:", v6, v4, 1, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setAmount:", 0);
    objc_msgSend(v7, "tokenizer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "selectedTextRange");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "end");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "isPosition:atBoundary:inDirection:", v13, 3, 0) & 1) == 0)
    {
      if (v9)
      {

      }
      else
      {
        objc_msgSend(v7, "tokenizer");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "cursor");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v15, "isPosition:atBoundary:inDirection:", v16, 4, 0);

        if ((v17 & 1) != 0)
        {
LABEL_9:
          objc_msgSend(v10, "cursor");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setStartPosition:", v18);

          -[UIResponder _setSelectionRangeWithHistory:](self, "_setSelectionRangeWithHistory:", v10);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_10;
        }
      }
      objc_msgSend(v7, "tokenizer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "cursor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "positionFromPosition:toBoundary:inDirection:", v12, 4, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setCursor:", v13);
    }

    goto LABEL_9;
  }
  v14 = 0;
  v10 = v6;
LABEL_10:

  return v14;
}

- (id)_moveToStartOfParagraph:(BOOL)a3 withHistory:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v4 = a3;
  v6 = a4;
  -[UIResponder _selectableText](self, "_selectableText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "selectedTextRange");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[UIResponder _setHistory:withExtending:withAnchor:withAffinityDownstream:](self, "_setHistory:withExtending:withAnchor:withAffinityDownstream:", v6, v4, 2, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setAmount:", 0);
    objc_msgSend(v7, "tokenizer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cursor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isPosition:atBoundary:inDirection:", v11, 3, 1);

    if (v12)
    {
      objc_msgSend(v9, "cursor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "positionFromPosition:toBoundary:inDirection:", v13, 0, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
        objc_msgSend(v9, "setCursor:", v14);

    }
    objc_msgSend(v9, "cursor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "positionFromPosition:toBoundary:inDirection:", v15, 3, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCursor:", v16);

    objc_msgSend(v9, "cursor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setStartPosition:", v17);

    -[UIResponder _setSelectionRangeWithHistory:](self, "_setSelectionRangeWithHistory:", v9);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18 = 0;
    v9 = v6;
  }

  return v18;
}

- (id)_moveToEndOfParagraph:(BOOL)a3 withHistory:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v4 = a3;
  v6 = a4;
  -[UIResponder _selectableText](self, "_selectableText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "selectedTextRange");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[UIResponder _setHistory:withExtending:withAnchor:withAffinityDownstream:](self, "_setHistory:withExtending:withAnchor:withAffinityDownstream:", v6, v4, 1, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setAmount:", 0);
    objc_msgSend(v7, "tokenizer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cursor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isPosition:atBoundary:inDirection:", v11, 3, 0);

    if (v12)
    {
      objc_msgSend(v9, "cursor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "positionFromPosition:toBoundary:inDirection:", v13, 0, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
        objc_msgSend(v9, "setCursor:", v14);

    }
    objc_msgSend(v9, "cursor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "positionFromPosition:toBoundary:inDirection:", v15, 3, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCursor:", v16);

    objc_msgSend(v9, "cursor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setStartPosition:", v17);

    -[UIResponder _setSelectionRangeWithHistory:](self, "_setSelectionRangeWithHistory:", v9);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18 = 0;
    v9 = v6;
  }

  return v18;
}

- (id)_moveToStartOfDocument:(BOOL)a3 withHistory:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  v6 = a4;
  -[UIResponder _selectableText](self, "_selectableText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "selectedTextRange");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[UIResponder _setHistory:withExtending:withAnchor:withAffinityDownstream:](self, "_setHistory:withExtending:withAnchor:withAffinityDownstream:", v6, v4, 2, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setAmount:", 0);
    objc_msgSend(v7, "beginningOfDocument");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCursor:", v10);

    objc_msgSend(v9, "cursor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setStartPosition:", v11);

    -[UIResponder _setSelectionRangeWithHistory:](self, "_setSelectionRangeWithHistory:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v9;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)_moveToEndOfDocument:(BOOL)a3 withHistory:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;

  v4 = a3;
  v6 = a4;
  -[UIResponder _selectableText](self, "_selectableText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "selectedTextRange");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[UIResponder _setHistory:withExtending:withAnchor:withAffinityDownstream:](self, "_setHistory:withExtending:withAnchor:withAffinityDownstream:", v6, v4, 1, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setAmount:", 0);
    objc_msgSend(v7, "endOfDocument");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCursor:", v10);

    objc_msgSend(v9, "cursor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setStartPosition:", v11);

    objc_msgSend(v7, "tokenizer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cursor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "isPosition:atBoundary:inDirection:", v13, 4, 3);

    if (v14)
      objc_msgSend(v9, "setAffinityDownstream:", 1);
    -[UIResponder _setSelectionRangeWithHistory:](self, "_setSelectionRangeWithHistory:", v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
    v9 = v6;
  }

  return v15;
}

- (id)_moveUp:(BOOL)a3 withHistory:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;

  v4 = a3;
  v6 = a4;
  -[UIResponder _selectableText](self, "_selectableText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "selectedTextRange");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (v6)
      v9 = objc_msgSend(v6, "affinityDownstream");
    else
      v9 = -[UIResponder _selectionAffinity](self, "_selectionAffinity") == 0;
    -[UIResponder _setHistory:withExtending:withAnchor:withAffinityDownstream:](self, "_setHistory:withExtending:withAnchor:withAffinityDownstream:", v6, v4, 2, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "setAmount:", objc_msgSend(v11, "amount") + 1);
    objc_msgSend(v11, "cursor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "beginningOfDocument");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v7, "comparePosition:toPosition:", v12, v13);

    if (v14)
    {
      objc_msgSend(v11, "startPosition");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "amount") > 0)
        v16 = 4;
      else
        v16 = 5;
      v17 = objc_msgSend(v11, "amount");
      if (v17 >= 0)
        v18 = v17;
      else
        v18 = -v17;
      objc_msgSend(v7, "_positionFromPosition:inDirection:offset:withAffinityDownstream:", v15, v16, v18, objc_msgSend(v11, "affinityDownstream"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "cursor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v7, "comparePosition:toPosition:", v20, v19);

      if (v21)
      {
        objc_msgSend(v11, "setCursor:", v19);
      }
      else
      {
        objc_msgSend(v7, "beginningOfDocument");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setCursor:", v22);

        objc_msgSend(v11, "setAmount:", objc_msgSend(v11, "amount") - 1);
      }

    }
    else
    {
      objc_msgSend(v11, "setAmount:", objc_msgSend(v11, "amount") - 1);
    }
    -[UIResponder _setSelectionRangeWithHistory:](self, "_setSelectionRangeWithHistory:", v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
    v11 = v6;
  }

  return v10;
}

- (id)_moveDown:(BOOL)a3 withHistory:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;

  v4 = a3;
  v6 = a4;
  -[UIResponder _selectableText](self, "_selectableText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "selectedTextRange");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (v6)
      v9 = objc_msgSend(v6, "affinityDownstream");
    else
      v9 = -[UIResponder _selectionAffinity](self, "_selectionAffinity") == 0;
    -[UIResponder _setHistory:withExtending:withAnchor:withAffinityDownstream:](self, "_setHistory:withExtending:withAnchor:withAffinityDownstream:", v6, v4, 1, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "setAmount:", objc_msgSend(v11, "amount") - 1);
    objc_msgSend(v11, "cursor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "endOfDocument");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v7, "comparePosition:toPosition:", v12, v13);

    if (v14)
    {
      objc_msgSend(v11, "startPosition");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "amount") > 0)
        v16 = 4;
      else
        v16 = 5;
      v17 = objc_msgSend(v11, "amount");
      if (v17 >= 0)
        v18 = v17;
      else
        v18 = -v17;
      objc_msgSend(v7, "_positionFromPosition:inDirection:offset:withAffinityDownstream:", v15, v16, v18, objc_msgSend(v11, "affinityDownstream"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "cursor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v7, "comparePosition:toPosition:", v20, v19);

      if (v21)
      {
        objc_msgSend(v11, "setCursor:", v19);
      }
      else
      {
        objc_msgSend(v7, "endOfDocument");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setCursor:", v22);

        objc_msgSend(v11, "setAmount:", objc_msgSend(v11, "amount") + 1);
      }

    }
    else
    {
      objc_msgSend(v11, "setAmount:", objc_msgSend(v11, "amount") + 1);
    }
    -[UIResponder _setSelectionRangeWithHistory:](self, "_setSelectionRangeWithHistory:", v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
    v11 = v6;
  }

  return v10;
}

- (id)_moveLeft:(BOOL)a3 withHistory:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a3;
  v6 = a4;
  -[UIResponder _selectableText](self, "_selectableText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "selectedTextRange");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[UIResponder _setHistory:withExtending:withAnchor:withAffinityDownstream:](self, "_setHistory:withExtending:withAnchor:withAffinityDownstream:", v6, v4, 2, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setAmount:", 0);
    objc_msgSend(v7, "selectedTextRange");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEmpty");

    if ((v11 & 1) != 0 || v4)
    {
      objc_msgSend(v9, "cursor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "positionFromPosition:inDirection:offset:", v12, 3, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setCursor:", v13);

    }
    objc_msgSend(v9, "cursor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setStartPosition:", v14);

    -[UIResponder _setSelectionRangeWithHistory:](self, "_setSelectionRangeWithHistory:", v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
    v9 = v6;
  }

  return v15;
}

- (id)_moveRight:(BOOL)a3 withHistory:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a3;
  v6 = a4;
  -[UIResponder _selectableText](self, "_selectableText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "selectedTextRange");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[UIResponder _setHistory:withExtending:withAnchor:withAffinityDownstream:](self, "_setHistory:withExtending:withAnchor:withAffinityDownstream:", v6, v4, 1, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setAmount:", 0);
    objc_msgSend(v7, "selectedTextRange");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEmpty");

    if ((v11 & 1) != 0 || v4)
    {
      objc_msgSend(v9, "cursor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "positionFromPosition:inDirection:offset:", v12, 2, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setCursor:", v13);

    }
    objc_msgSend(v9, "cursor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setStartPosition:", v14);

    -[UIResponder _setSelectionRangeWithHistory:](self, "_setSelectionRangeWithHistory:", v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
    v9 = v6;
  }

  return v15;
}

- (id)_positionFromPosition:(id)a3 inDirection:(int64_t)a4 offset:(int64_t)a5 withAffinityDownstream:(BOOL)a6
{
  id v9;
  void *v10;
  void *v11;

  v9 = a3;
  -[UIResponder _selectableText](self, "_selectableText");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "positionFromPosition:inDirection:offset:", v9, a4, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)_setSelectedTextRange:(id)a3 withAffinityDownstream:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;

  v4 = a4;
  v7 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[UIResponder setSelectedTextRange:withAffinityDownstream:](self, "setSelectedTextRange:withAffinityDownstream:", v7, v4);
  }
  else
  {
    -[UIResponder _selectableText](self, "_selectableText");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSelectedTextRange:", v7);

  }
}

- (int64_t)_selectionAffinity
{
  void *v2;
  int64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  -[UIResponder _selectableText](self, "_selectableText");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    objc_msgSend(v2, "tokenizer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "selectedTextRange");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "start");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isPosition:atBoundary:inDirection:", v6, 3, 1))
    {

    }
    else
    {
      objc_msgSend(v2, "tokenizer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "selectedTextRange");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "end");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v7, "isPosition:atBoundary:inDirection:", v9, 4, 2);

      if ((v10 & 1) != 0)
      {
        v3 = 1;
        goto LABEL_8;
      }
    }
    v3 = 0;
    goto LABEL_8;
  }
  v3 = objc_msgSend(v2, "selectionAffinity");
LABEL_8:

  return v3;
}

- (void)_setGestureRecognizers
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  UITextPhraseBoundaryInteraction *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[UIResponder _setInternalGestureRecognizers](self, "_setInternalGestureRecognizers");
  }
  else
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "markedTextOverlay");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeFromSuperview");
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    objc_msgSend(v4, "interactions", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(v4, "removeInteraction:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i));
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v7);
    }

    -[UIResponder _selectableText](self, "_selectableText");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "interactionAssistant");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      objc_msgSend(v11, "setGestureRecognizers");
    }
    else if (objc_msgSend(v10, "_hasMarkedText"))
    {
      if (objc_msgSend(v3, "hasEditableMarkedText"))
      {
        objc_msgSend(v10, "markedTextRange");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "firstRectForRange:", v13);
        objc_msgSend(v4, "setFrame:");

        objc_msgSend(v10, "textInputView");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addSubview:", v4);

        v15 = -[UITextPhraseBoundaryInteraction initWithTextInput:]([UITextPhraseBoundaryInteraction alloc], "initWithTextInput:", v10);
        objc_msgSend(v4, "addInteraction:", v15);

      }
    }

  }
}

- (void)_setMarkedText:(id)a3 selectedRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  objc_class *v7;
  id v8;
  id v9;

  length = a4.length;
  location = a4.location;
  v7 = (objc_class *)MEMORY[0x1E0CB3498];
  v8 = a3;
  v9 = (id)objc_msgSend([v7 alloc], "initWithString:", v8);

  -[UIResponder _setAttributedMarkedText:selectedRange:](self, "_setAttributedMarkedText:selectedRange:", v9, location, length);
}

- (void)_setAttributedMarkedText:(id)a3 selectedRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  int v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  length = a4.length;
  location = a4.location;
  v7 = a3;
  -[UIResponder _selectableText](self, "_selectableText");
  v26 = (id)objc_claimAutoreleasedReturnValue();
  v8 = -[UIResponder _hasMarkedText](self, "_hasMarkedText");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v26, "setAttributedMarkedText:selectedRange:", v7, location, length);
  }
  else
  {
    objc_msgSend(v7, "string");
    v9 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v26, "setMarkedText:selectedRange:", v9, location, length);
    v7 = (id)v9;
  }

  v10 = -[UIResponder _hasMarkedText](self, "_hasMarkedText");
  if (v8 != v10)
  {
    if (+[UITextSelectionDisplayInteraction isModernSelectionViewEnabled](UITextSelectionDisplayInteraction, "isModernSelectionViewEnabled"))
    {
      objc_msgSend(v26, "_selectionDisplayInteraction");
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = v26;
      v13 = (void *)v11;
    }
    else
    {
      v13 = 0;
      v12 = v26;
    }
    objc_msgSend(v12, "_setGestureRecognizers");
    -[UIResponder _textSelectingContainer](self, "_textSelectingContainer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "interactionAssistant");
    v19 = objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      v20 = (void *)v19;
      -[UIResponder _textSelectingContainer](self, "_textSelectingContainer");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "interactionAssistant");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "externalInteractions");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        -[UIResponder _textSelectingContainer](self, "_textSelectingContainer");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "interactionAssistant");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "deactivateSelection");

        objc_msgSend(v26, "_setSelectionDisplayInteraction:", v13);
      }
    }
    else
    {

    }
    goto LABEL_15;
  }
  if (v10)
  {
    -[UIResponder _textSelectingContainer](self, "_textSelectingContainer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "interactionAssistant");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "markedTextOverlay");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v26, "markedTextRange");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "firstRectForRange:", v17);
      objc_msgSend(v13, "setFrame:");

LABEL_15:
    }
  }

}

- (void)_unmarkText
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  -[UIResponder _selectableText](self, "_selectableText");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[UIResponder _hasMarkedText](self, "_hasMarkedText");
  objc_msgSend(v13, "unmarkText");
  if (v3)
  {
    if (+[UITextSelectionDisplayInteraction isModernSelectionViewEnabled](UITextSelectionDisplayInteraction, "isModernSelectionViewEnabled"))
    {
      objc_msgSend(v13, "_selectionDisplayInteraction");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }
    objc_msgSend(v13, "_setGestureRecognizers");
    -[UIResponder _textSelectingContainer](self, "_textSelectingContainer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "interactionAssistant");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)v6;
      -[UIResponder _textSelectingContainer](self, "_textSelectingContainer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "interactionAssistant");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "externalInteractions");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        -[UIResponder _textSelectingContainer](self, "_textSelectingContainer");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "interactionAssistant");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "deactivateSelection");

        objc_msgSend(v13, "_setSelectionDisplayInteraction:", v4);
      }
    }
    else
    {

    }
  }

}

- (BOOL)_shouldPerformUICalloutBarButtonReplaceAction:(SEL)a3 forText:(id)a4 checkAutocorrection:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  void *v8;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  char v14;

  v5 = a5;
  v7 = a4;
  v8 = v7;
  if (sel_promptForReplace_ != a3 && sel__promptForReplace_ != a3)
  {
    if (sel__transliterateChinese_ == a3)
    {
      v14 = UIKeyboardEnabledInputModesAllowChineseTransliterationForText(v7);
      goto LABEL_13;
    }
    goto LABEL_11;
  }
  if (v5
    && (+[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "autocorrectSpellingEnabled"),
        v10,
        !v11)
    || (objc_msgSend(v8, "_containsCJScriptsOnly") & 1) != 0)
  {
LABEL_11:
    v14 = 0;
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "componentsSeparatedByCharactersInSet:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (unint64_t)objc_msgSend(v13, "count") < 8;
LABEL_13:

  return v14;
}

- (int64_t)selectionAffinity
{
  return 0;
}

- (CGRect)_lastRectForRange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
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
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGRect result;

  v4 = a3;
  -[UIResponder _selectableText](self, "_selectableText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tokenizer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "end");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "positionFromPosition:toBoundary:inDirection:", v7, 4, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v4, "start");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "comparePosition:toPosition:", v9, v8) < 0)
    {
      objc_msgSend(v4, "end");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v5, "comparePosition:toPosition:", v8, v10);

      if (v11 < 0)
      {
        objc_msgSend(v4, "end");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "textRangeFromPosition:toPosition:", v8, v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "firstRectForRange:", v25);
        v13 = v26;
        v15 = v27;
        v17 = v28;
        v19 = v29;

        goto LABEL_6;
      }
    }
    else
    {

    }
  }
  objc_msgSend(v5, "firstRectForRange:", v4);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
LABEL_6:

  v20 = v13;
  v21 = v15;
  v22 = v17;
  v23 = v19;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (id)textInputView
{
  void *v2;
  void *v3;

  -[UIResponder nextResponder](self, "nextResponder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textInputView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_setSelectionDisplayInteraction:(id)a3
{
  id v4;

  +[_UITextInputImplicitObjectWrapper wrapperForObject:](_UITextInputImplicitObjectWrapper, "wrapperForObject:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(self, &_UITextInputImplicitSelectionDisplayInteractionKey, v4, (void *)1);

}

- (void)__createInteractionAssistantIfNecessaryWithMode:(int64_t)a3
{
  void *v5;
  UITextInteractionAssistant *v6;
  id v7;

  objc_getAssociatedObject(self, &_UITextInputImplicitInteractionAssistantKey);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    if (-[UIResponder conformsToProtocol:](self, "conformsToProtocol:", &unk_1EDE22B80))
    {
      v6 = -[UITextInteractionAssistant initWithView:textInteractionMode:]([UITextInteractionAssistant alloc], "initWithView:textInteractionMode:", self, a3);
      objc_setAssociatedObject(self, &_UITextInputImplicitInteractionAssistantKey, v6, (void *)1);
      v5 = v6;
    }
    else
    {
      v5 = 0;
    }
  }
  v7 = v5;
  if ((objc_msgSend(v5, "isValid") & 1) == 0)
    objc_msgSend(v7, "activate");

}

- (void)__prepareInteractionAssistantIfNecessary
{
  void *v2;
  void *v3;
  char v4;
  void *v5;

  objc_getAssociatedObject(self, &_UITextInputImplicitInteractionAssistantKey);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v5 = v2;
    v4 = objc_msgSend(v2, "isValid");
    v3 = v5;
    if ((v4 & 1) == 0)
    {
      objc_msgSend(v5, "activate");
      v3 = v5;
    }
  }

}

- (void)__tearDownInteractionAssistantIfNecessary
{
  id v2;

  objc_getAssociatedObject(self, &_UITextInputImplicitInteractionAssistantKey);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate");

}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
  forwardTouchMethod(self, (uint64_t)a2, touches, event, 1);
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
  forwardTouchMethod(self, (uint64_t)a2, touches, event, 3);
}

- (id)_nextKeyResponder
{
  return 0;
}

- (id)_previousKeyResponder
{
  return 0;
}

- (BOOL)_isRootForKeyResponderCycle
{
  return 0;
}

- (id)_textServicesResponderProxy
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[UIResponder __textInteractionFromAssistant](self, "__textInteractionFromAssistant");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "interactionWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "responder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_targetCanPerformBlock:(id)a3
{
  unsigned int (**v4)(id, UIResponder *);
  UIResponder *v5;
  void *v6;

  v4 = (unsigned int (**)(id, UIResponder *))a3;
  if (v4[2](v4, self))
  {
    v5 = self;
  }
  else if (-[UIResponder __isKindOfUIResponder](self, "__isKindOfUIResponder"))
  {
    -[UIResponder nextResponder](self, "nextResponder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v6, "_targetCanPerformBlock:", v4);
      v5 = (UIResponder *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)validateCommand:(UICommand *)command
{
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  UICommand *v8;

  v8 = command;
  if (-[UICommand action](v8, "action") == sel_undo_)
  {
    -[UIResponder _undoManagerForValidatingUndoRedoCommands](self, "_undoManagerForValidatingUndoRedoCommands");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "undoMenuItemTitle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
LABEL_9:
      -[UICommand setTitle:](v8, "setTitle:", v5);
LABEL_12:

      goto LABEL_13;
    }
    v6 = CFSTR("Undo");
LABEL_11:
    _UINSLocalizedStringWithDefaultValue(v6, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICommand setTitle:](v8, "setTitle:", v7);

    goto LABEL_12;
  }
  if (-[UICommand action](v8, "action") == sel_redo_)
  {
    -[UIResponder _undoManagerForValidatingUndoRedoCommands](self, "_undoManagerForValidatingUndoRedoCommands");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "redoMenuItemTitle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      goto LABEL_9;
    v6 = CFSTR("Redo");
    goto LABEL_11;
  }
  if (-[UICommand action](v8, "action") == sel_captureTextFromCamera_
    && -[UIResponder _conformsToProtocolUIKeyInput](self, "_conformsToProtocolUIKeyInput"))
  {
    +[UIAction _textFromCameraTitleForResponder:](UIAction, "_textFromCameraTitleForResponder:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICommand setTitle:](v8, "setTitle:", v4);
LABEL_13:

  }
}

- (void)_define:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UIResponder _textServicesResponderProxy](self, "_textServicesResponderProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_define:", v4);

}

- (void)_lookup:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UIResponder _textServicesResponderProxy](self, "_textServicesResponderProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_lookup:", v4);

}

- (void)_translate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UIResponder _textServicesResponderProxy](self, "_textServicesResponderProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_translate:", v4);

}

- (void)_share:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (!-[UIResponder _handleActivityItemsConfigurationShare:](self, "_handleActivityItemsConfigurationShare:"))
  {
    -[UIResponder _textServicesResponderProxy](self, "_textServicesResponderProxy");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_share:", v5);

  }
}

- (void)_addShortcut:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UIResponder _textServicesResponderProxy](self, "_textServicesResponderProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_addShortcut:", v4);

}

- (void)doesNotRecognizeSelector:(SEL)a3
{
  void *v5;
  int64_t v6;
  objc_super v7;
  _QWORD v8[5];

  if (dyld_program_sdk_at_least()
    && sel_paste_ == a3
    && (-[UIResponder _effectivePasteConfiguration](self, "_effectivePasteConfiguration"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v6 = -[UIResponder _dataOwnerForPaste](self, "_dataOwnerForPaste");
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __40__UIResponder_doesNotRecognizeSelector___block_invoke;
      v8[3] = &unk_1E16B1B28;
      v8[4] = self;
      +[UIPasteboard _performAsDataOwner:block:](UIPasteboard, "_performAsDataOwner:block:", v6, v8);
    }
  }
  else if (!-[UIResponder _handleActivityItemsConfigurationDoesNotHandleSelector:](self, "_handleActivityItemsConfigurationDoesNotHandleSelector:", a3))
  {
    v7.receiver = self;
    v7.super_class = (Class)UIResponder;
    -[UIResponder doesNotRecognizeSelector:](&v7, sel_doesNotRecognizeSelector_, a3);
  }
}

void __40__UIResponder_doesNotRecognizeSelector___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  +[UIPasteboard generalPasteboard](UIPasteboard, "generalPasteboard");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "itemProviders");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "pasteItemProviders:", v2);

}

+ (BOOL)_callBecomeFirstResponder:(id)a3 withIntent:(unint64_t)a4
{
  id v7;
  uint64_t v8;
  char v9;
  void *v11;

  v7 = a3;
  if (pthread_main_np() != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UIResponder.m"), 815, CFSTR("Call must be made on main thread"));

  }
  v8 = __changeIntent;
  __changeIntent = a4;
  v9 = objc_msgSend(v7, "becomeFirstResponder");
  __changeIntent = v8;

  return v9;
}

+ (BOOL)_callResignFirstResponder:(id)a3 withIntent:(unint64_t)a4
{
  id v7;
  uint64_t v8;
  char v9;
  void *v11;

  v7 = a3;
  if (pthread_main_np() != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UIResponder.m"), 828, CFSTR("Call must be made on main thread"));

  }
  v8 = __changeIntent;
  __changeIntent = a4;
  v9 = objc_msgSend(v7, "resignFirstResponder");
  __changeIntent = v8;

  return v9;
}

- (id)_currentOverrideHost
{
  if ((*(_WORD *)&self->_responderFlags & 2) == 0)
    return 0;
  objc_getAssociatedObject(self, &unk_1ECD7F851);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_clearOverrideHost
{
  void *v3;

  if ((*(_WORD *)&self->_responderFlags & 2) != 0)
  {
    v3 = (void *)MEMORY[0x186DC9484]();
    objc_setAssociatedObject(self, &unk_1ECD7F851, 0, (void *)1);
    *(_WORD *)&self->_responderFlags &= ~2u;
    objc_autoreleasePoolPop(v3);
  }
}

- (id)_captureOverrideState
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  -[UIResponder _currentOverrideClient](self, "_currentOverrideClient");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "target");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "types");
  if (v3)
  {
    v8[0] = v3;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[1] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_restoreOverrideState:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  if ((*(_WORD *)&self->_responderFlags & 1) == 0)
  {
    v9 = v4;
    v5 = v4;
    if (v5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v5, "count") == 2)
      {
        objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        +[_UIResponder_Override overrideForResponder:withTarget:forType:](_UIResponder_Override, "overrideForResponder:withTarget:forType:", self, v6, (int)objc_msgSend(v7, "intValue"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        objc_setAssociatedObject(self, &_MergedGlobals_1191, v8, (void *)1);
        *(_WORD *)&self->_responderFlags |= 1u;

      }
    }

    v4 = v9;
  }

}

- (void)_overrideInputAccessoryViewNextResponderWithResponder:(id)a3
{
  -[UIResponder _overrideNextResponderWithResponder:forType:](self, "_overrideNextResponderWithResponder:forType:", a3, 2);
}

uint64_t __46__UIResponder__clearRestorableResponderStatus__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_clearPreservedInputViewsWithRestorableResponder:", *(_QWORD *)(a1 + 32));
}

- (void)_tagAsRestorableResponder
{
  objc_setAssociatedObject(self, &_UIRestorableResponderKey, MEMORY[0x1E0C9AAB0], (void *)1);
}

- (id)recentsAccessoryView
{
  void *v2;
  void *v3;

  -[UIResponder nextResponder](self, "nextResponder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recentsAccessoryView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_keyCommandForEvent:(id)a3
{
  return -[UIResponder _keyCommandForEvent:target:](self, "_keyCommandForEvent:target:", a3, 0);
}

- (id)_keyCommandForEvent:(id)a3 target:(id *)a4
{
  id v6;
  id v7;
  _UIMenuLeafValidation *v8;
  uint64_t v9;
  _UIMenuLeafValidation *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  id v19;
  uint64_t *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  uint64_t *v24;
  uint64_t *v25;
  _QWORD *v26;
  _QWORD aBlock[4];
  _UIMenuLeafValidation *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  _QWORD v48[5];

  v6 = a3;
  if (objc_msgSend(v6, "type") == 4)
  {
    v7 = v6;
    v48[0] = 0;
    v48[1] = v48;
    v48[2] = 0x2020000000;
    v48[3] = 0;
    v8 = objc_alloc_init(_UIMenuLeafValidation);
    v42 = 0;
    v43 = &v42;
    v44 = 0x3032000000;
    v45 = __Block_byref_object_copy__162;
    v46 = __Block_byref_object_dispose__162;
    v47 = 0;
    v36 = 0;
    v37 = &v36;
    v38 = 0x3032000000;
    v39 = __Block_byref_object_copy__162;
    v40 = __Block_byref_object_dispose__162;
    v41 = 0;
    v30 = 0;
    v31 = &v30;
    v32 = 0x3032000000;
    v33 = __Block_byref_object_copy__162;
    v34 = __Block_byref_object_dispose__162;
    v9 = MEMORY[0x1E0C809B0];
    v35 = 0;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __42__UIResponder__keyCommandForEvent_target___block_invoke;
    aBlock[3] = &unk_1E16DE068;
    v29 = &v30;
    v10 = v8;
    v28 = v10;
    v11 = _Block_copy(aBlock);
    v21[0] = v9;
    v21[1] = 3221225472;
    v21[2] = __42__UIResponder__keyCommandForEvent_target___block_invoke_2;
    v21[3] = &unk_1E16DE090;
    v12 = v7;
    v22 = v12;
    v24 = &v42;
    v13 = v11;
    v23 = v13;
    v25 = &v36;
    v26 = v48;
    -[UIResponder _enumerateKeyCommandsInChainWithOptions:usingBlock:](self, "_enumerateKeyCommandsInChainWithOptions:usingBlock:", 0, v21);
    if (!v37[5])
    {
      v14 = (void *)v43[5];
      v17[0] = v9;
      v17[1] = 3221225472;
      v17[2] = __42__UIResponder__keyCommandForEvent_target___block_invoke_3;
      v17[3] = &unk_1E16DE0B8;
      v19 = v13;
      v18 = v12;
      v20 = &v36;
      objc_msgSend(v14, "enumerateObjectsUsingBlock:", v17);

    }
    if (a4)
      *a4 = objc_retainAutorelease((id)v31[5]);
    v15 = (id)v37[5];

    _Block_object_dispose(&v30, 8);
    _Block_object_dispose(&v36, 8);

    _Block_object_dispose(&v42, 8);
    _Block_object_dispose(v48, 8);

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

BOOL __42__UIResponder__keyCommandForEvent_target___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _BOOL8 v9;

  v3 = (void *)UIApp;
  v4 = a2;
  objc_msgSend(v3, "_unswizzledTargetInChainForAction:sender:", objc_msgSend(v4, "action"), v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  objc_msgSend(*(id *)(a1 + 32), "validatedCommandForTarget:command:alternate:sender:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v4, 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    v9 = (objc_msgSend(v8, "attributes") & 1) == 0;
  else
    v9 = 0;

  return v9;
}

void __42__UIResponder__keyCommandForEvent_target___block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;

  v19 = a2;
  v6 = objc_msgSend(v19, "action");
  v7 = v19;
  if (v6 || (v8 = objc_msgSend(v19, "_buttonType"), v7 = v19, v8))
  {
    v9 = objc_msgSend(*(id *)(a1 + 32), "_matchFidelityForKeyCommand:", v7);
    v10 = v9;
    if (v9)
    {
      if (v9 == 3)
      {
        v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v12 = *(void **)(v11 + 40);
        *(_QWORD *)(v11 + 40) = 0;

        if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 40) + 16))())
        {
          objc_msgSend(v19, "_setTriggeringEvent:", *(_QWORD *)(a1 + 32));
          objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a2);
          *a3 = 1;
        }
      }
      else
      {
        v13 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
        if (v9 <= v13)
        {
          if (v9 == v13)
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v19);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v19);
          v14 = objc_claimAutoreleasedReturnValue();
          v15 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
          v16 = *(void **)(v15 + 40);
          *(_QWORD *)(v15 + 40) = v14;

        }
      }
    }
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v18 = *(_QWORD *)(v17 + 24);
    if (v18 <= v10)
      v18 = v10;
    *(_QWORD *)(v17 + 24) = v18;
    v7 = v19;
  }

}

void __42__UIResponder__keyCommandForEvent_target___block_invoke_3(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;

  v7 = a2;
  if ((*(unsigned int (**)(void))(a1[5] + 16))())
  {
    objc_msgSend(v7, "_setTriggeringEvent:", a1[4]);
    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a2);
    *a4 = 1;
  }

}

- (void)_enumerateKeyCommandsInChainWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  char v4;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  void (**v11)(void *, void *, void *);
  void *v12;
  UIResponder *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t k;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  uint64_t v50;
  void *m;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t n;
  uint64_t v58;
  id v59;
  id v60;
  void *v61;
  void (**v62)(id, _QWORD, uint8_t *);
  char v63;
  uint64_t v64;
  uint64_t v65;
  id obj;
  id obja;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  _QWORD aBlock[4];
  id v93;
  id v94;
  uint64_t v95;
  BOOL v96;
  _BYTE v97[128];
  _BYTE v98[128];
  void *v99;
  _BYTE v100[128];
  _BYTE v101[128];
  _BYTE v102[128];
  uint8_t v103[128];
  uint8_t buf[4];
  void *v105;
  uint64_t v106;

  v4 = a3;
  v106 = *MEMORY[0x1E0C80C00];
  v62 = (void (**)(id, _QWORD, uint8_t *))a4;
  if (qword_1ECD7F860 != -1)
    dispatch_once(&qword_1ECD7F860, &__block_literal_global_447);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 517);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend((id)UIApp, "_disableLayoutAwareShortcuts") & 1) == 0
    && dyld_program_sdk_at_least()
    && (+[UIDevice currentDevice](UIDevice, "currentDevice"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "_isHardwareKeyboardAvailable"),
        v8,
        v9))
  {
    v10 = objc_msgSend((id)UIApp, "_hardwareKeyboard:", 0);
  }
  else
  {
    v10 = 0;
  }
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__UIResponder__enumerateKeyCommandsInChainWithOptions_usingBlock___block_invoke_2;
  aBlock[3] = &unk_1E16DE0E0;
  v59 = v7;
  v93 = v59;
  v95 = v10;
  v96 = (v4 & 8) != 0;
  v60 = v6;
  v94 = v60;
  v11 = (void (**)(void *, void *, void *))_Block_copy(aBlock);
  objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 517);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = self;
  v63 = v4;
  v61 = v12;
  if (!v13)
  {
LABEL_35:
    if ((v4 & 0x20) == 0)
      goto LABEL_63;
    goto LABEL_42;
  }
  v14 = v13;
  while (!objc_msgSend(v12, "containsObject:", v14))
  {
    objc_msgSend(v12, "addObject:", v14);
    if ((v4 & 1) != 0 && v14 == (void *)UIApp)
    {
      objc_msgSend(v14, "keyCommands");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v14, "_keyCommands");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v90 = 0u;
    v91 = 0u;
    v88 = 0u;
    v89 = 0u;
    obj = v15;
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v88, v103, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v89;
      do
      {
        v19 = 0;
        v64 = v17;
        do
        {
          if (*(_QWORD *)v89 != v18)
            objc_enumerationMutation(obj);
          v20 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * v19);
          v11[2](v11, v20, v14);
          if ((v4 & 2) == 0)
          {
            v86 = 0u;
            v87 = 0u;
            v84 = 0u;
            v85 = 0u;
            objc_msgSend(v20, "alternates");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v84, v102, 16);
            if (v22)
            {
              v23 = v22;
              v24 = *(_QWORD *)v85;
              do
              {
                for (i = 0; i != v23; ++i)
                {
                  if (*(_QWORD *)v85 != v24)
                    objc_enumerationMutation(v21);
                  objc_msgSend(v20, "_keyCommandUsingAlternate:", *(_QWORD *)(*((_QWORD *)&v84 + 1) + 8 * i));
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  v11[2](v11, v26, v14);

                }
                v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v84, v102, 16);
              }
              while (v23);
            }

            v4 = v63;
            v17 = v64;
          }
          ++v19;
        }
        while (v19 != v17);
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v88, v103, 16);
      }
      while (v17);
    }

    if (byte_1ECD7F858)
      v27 = 2;
    else
      v27 = 0;
    objc_msgSend(v14, "_nextResponderUsingTraversalStrategy:", v27);
    v28 = objc_claimAutoreleasedReturnValue();

    v14 = (void *)v28;
    v12 = v61;
    if (!v28)
      goto LABEL_35;
  }
  v29 = qword_1ECD7F868;
  if (!qword_1ECD7F868)
  {
    v29 = __UILogCategoryGetNode("View", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v29, (unint64_t *)&qword_1ECD7F868);
  }
  v30 = *(NSObject **)(v29 + 8);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v105 = v14;
    _os_log_impl(&dword_185066000, v30, OS_LOG_TYPE_ERROR, "Responder chain warning: %@ has already been seen in the chain; ending traversal. Please check your nextResponder overrides.",
      buf,
      0xCu);
  }

  if ((v4 & 0x20) != 0)
  {
LABEL_42:
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "inputDelegateManager");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "keyInputDelegate");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (v33)
    {
      if (qword_1ECD7F878 != -1)
        dispatch_once(&qword_1ECD7F878, &__block_literal_global_136_2);
      v82 = 0u;
      v83 = 0u;
      v80 = 0u;
      v81 = 0u;
      v34 = (id)qword_1ECD7F870;
      v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v80, v101, 16);
      if (v35)
      {
        v36 = v35;
        v37 = *(_QWORD *)v81;
        do
        {
          for (j = 0; j != v36; ++j)
          {
            if (*(_QWORD *)v81 != v37)
              objc_enumerationMutation(v34);
            v11[2](v11, *(void **)(*((_QWORD *)&v80 + 1) + 8 * j), (void *)UIApp);
          }
          v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v80, v101, 16);
        }
        while (v36);
      }

    }
    if (qword_1ECD7F888 != -1)
      dispatch_once(&qword_1ECD7F888, &__block_literal_global_164_1);
    v78 = 0u;
    v79 = 0u;
    v76 = 0u;
    v77 = 0u;
    v39 = (id)qword_1ECD7F880;
    v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v76, v100, 16);
    if (v40)
    {
      v41 = v40;
      v42 = *(_QWORD *)v77;
      do
      {
        for (k = 0; k != v41; ++k)
        {
          if (*(_QWORD *)v77 != v42)
            objc_enumerationMutation(v39);
          v11[2](v11, *(void **)(*((_QWORD *)&v76 + 1) + 8 * k), (void *)UIApp);
        }
        v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v76, v100, 16);
      }
      while (v41);
    }

  }
LABEL_63:
  buf[0] = 0;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "allKeys");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("self"), 0);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v99 = v46;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v99, 1);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "sortedArrayUsingDescriptors:", v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  v74 = 0u;
  v75 = 0u;
  v72 = 0u;
  v73 = 0u;
  v49 = v48;
  obja = (id)objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v72, v98, 16);
  if (obja)
  {
    v50 = *(_QWORD *)v73;
    v65 = *(_QWORD *)v73;
    do
    {
      for (m = 0; m != obja; m = (char *)m + 1)
      {
        if (*(_QWORD *)v73 != v50)
          objc_enumerationMutation(v49);
        v52 = *(_QWORD *)(*((_QWORD *)&v72 + 1) + 8 * (_QWORD)m);
        v68 = 0u;
        v69 = 0u;
        v70 = 0u;
        v71 = 0u;
        objc_msgSend(v60, "objectForKeyedSubscript:", v52);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v68, v97, 16);
        if (!v54)
          goto LABEL_79;
        v55 = v54;
        v56 = *(_QWORD *)v69;
        while (2)
        {
          for (n = 0; n != v55; ++n)
          {
            if (*(_QWORD *)v69 != v56)
              objc_enumerationMutation(v53);
            v58 = *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * n);
            if ((v63 & 0x14) != 0x10)
            {
              if ((objc_msgSend(v44, "containsObject:", *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * n)) & 1) != 0)
                continue;
              objc_msgSend(v44, "addObject:", v58);
            }
            v62[2](v62, v58, buf);
            if (buf[0])
            {

              v12 = v61;
              goto LABEL_85;
            }
          }
          v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v68, v97, 16);
          if (v55)
            continue;
          break;
        }
LABEL_79:

        if ((v63 & 4) == 0)
          objc_msgSend(v44, "removeAllObjects");
        v50 = v65;
        v12 = v61;
      }
      obja = (id)objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v72, v98, 16);
    }
    while (obja);
  }
LABEL_85:

}

uint64_t __66__UIResponder__enumerateKeyCommandsInChainWithOptions_usingBlock___block_invoke()
{
  uint64_t result;

  result = dyld_program_sdk_at_least();
  byte_1ECD7F858 = result;
  return result;
}

void __66__UIResponder__enumerateKeyCommandsInChainWithOptions_usingBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  int v7;
  void *v8;
  _BOOL4 v9;
  _BOOL8 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;

  v16 = a2;
  v5 = a3;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v16) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v16);
    v6 = *(_QWORD *)(a1 + 48);
    if (v6)
    {
      if (_UIInternalPreferencesRevisionOnce != -1)
        dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_4_20);
      v7 = _UIInternalPreferencesRevisionVar;
      v8 = v16;
      if (_UIInternalPreferencesRevisionVar < 1
        || (v15 = _UIInternalPreference_EnableLayoutAwareShortcutsAutomatic,
            _UIInternalPreferencesRevisionVar == _UIInternalPreference_EnableLayoutAwareShortcutsAutomatic))
      {
        v9 = 0;
      }
      else
      {
        while (1)
        {
          v9 = v7 < v15;
          if (v7 < v15)
            break;
          _UIInternalPreferenceSync(v7, &_UIInternalPreference_EnableLayoutAwareShortcutsAutomatic, (uint64_t)CFSTR("EnableLayoutAwareShortcutsAutomatic"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
          v15 = _UIInternalPreference_EnableLayoutAwareShortcutsAutomatic;
          v8 = v16;
          if (v7 == _UIInternalPreference_EnableLayoutAwareShortcutsAutomatic)
            goto LABEL_7;
        }
        v8 = v16;
      }
LABEL_7:
      if (byte_1ECD76674)
        v10 = v9;
      else
        v10 = 0;
      objc_msgSend(v8, "_localizeWithGSKeyboard:automatically:force:", v6, v10, 0);
    }
    if (objc_msgSend(v16, "action") || objc_msgSend(v16, "_buttonType"))
    {
      v11 = (void *)objc_msgSend(v16, "_mutableCopyIfNeeded");
      objc_msgSend(v11, "_setOriginatingResponder:", v5);
      if (*(_BYTE *)(a1 + 56))
      {
        v12 = &unk_1E1A99BB8;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v11, "_enumerationPriority"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        v14 = v13;
        objc_msgSend(v13, "addObject:", v11);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v14, v12);
      }

    }
  }

}

void __66__UIResponder__enumerateKeyCommandsInChainWithOptions_usingBlock___block_invoke_135()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _QWORD v28[17];

  v28[15] = *MEMORY[0x1E0C80C00];
  +[UICommand _defaultCommandForAction:](UIKeyCommand, "_defaultCommandForAction:", sel_undo_);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v22;
  +[UICommand _defaultCommandForAction:](UIKeyCommand, "_defaultCommandForAction:", sel_redo_);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v21;
  +[UICommand _defaultCommandForAction:](UIKeyCommand, "_defaultCommandForAction:", sel_cut_);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v28[2] = v20;
  +[UICommand _defaultCommandForAction:](UIKeyCommand, "_defaultCommandForAction:", sel_copy_);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v28[3] = v19;
  +[UICommand _defaultCommandForAction:](UIKeyCommand, "_defaultCommandForAction:", sel_paste_);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v28[4] = v18;
  +[UICommand _defaultCommandForAction:](UIKeyCommand, "_defaultCommandForAction:", sel_pasteAndMatchStyle_);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v28[5] = v17;
  +[UICommand _defaultCommandForAction:](UIKeyCommand, "_defaultCommandForAction:", sel_selectAll_);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v28[6] = v0;
  +[UICommand _defaultCommandForAction:](UIKeyCommand, "_defaultCommandForAction:", sel_increaseSize_);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v28[7] = v1;
  +[UICommand _defaultCommandForAction:](UIKeyCommand, "_defaultCommandForAction:", sel_decreaseSize_);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v28[8] = v2;
  +[UICommand _defaultCommandForAction:](UIKeyCommand, "_defaultCommandForAction:", sel_toggleBoldface_);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v28[9] = v3;
  +[UICommand _defaultCommandForAction:](UIKeyCommand, "_defaultCommandForAction:", sel_toggleItalics_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v28[10] = v4;
  +[UICommand _defaultCommandForAction:](UIKeyCommand, "_defaultCommandForAction:", sel_toggleUnderline_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v28[11] = v5;
  +[UICommand _defaultCommandForAction:](UIKeyCommand, "_defaultCommandForAction:", sel_startDictation_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v28[12] = v6;
  +[UICommand _defaultCommandForAction:](UIKeyCommand, "_defaultCommandForAction:", sel_orderFrontCharacterPalette_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v28[13] = v7;
  +[UICommand _defaultCommandForAction:](UIKeyCommand, "_defaultCommandForAction:", sel__handleLegacyEmojiKeyboardShortcut_);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v28[14] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", v9, 1);
  v11 = (void *)qword_1ECD7F870;
  qword_1ECD7F870 = v10;

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v12 = (id)qword_1ECD7F870;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v24;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v24 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v16++), "_setEnumerationPriority:", -1);
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v14);
  }

}

void __66__UIResponder__enumerateKeyCommandsInChainWithOptions_usingBlock___block_invoke_2_163()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  _QWORD v17[6];

  v17[5] = *MEMORY[0x1E0C80C00];
  +[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", CFSTR(" "), 11468800, sel__nopSelector_);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v0;
  +[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", CFSTR("UIKeyInputUpArrow"), 0x100000, sel__nopSelector_);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v1;
  +[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", CFSTR("UIKeyInputDownArrow"), 0x100000, sel__nopSelector_);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v2;
  +[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", CFSTR("UIKeyInputLeftArrow"), 0x100000, sel__nopSelector_);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17[3] = v3;
  +[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", CFSTR("UIKeyInputRightArrow"), 0x100000, sel__nopSelector_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17[4] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 5);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)qword_1ECD7F880;
  qword_1ECD7F880 = v5;

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = (id)qword_1ECD7F880;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "_setEnumerationPriority:", -1, (_QWORD)v12);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (BOOL)_enableAutomaticKeyboardPressDone
{
  void *v2;
  char v3;

  -[UIResponder nextResponder](self, "nextResponder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_enableAutomaticKeyboardPressDone");

  return v3;
}

- (BOOL)_isHostingRemoteContent
{
  return 0;
}

- (id)_nextResponderThatCanBecomeFirstResponder
{
  UIResponder *v2;
  uint64_t v3;

  v2 = self;
  if (v2)
  {
    do
    {
      if (-[UIResponder isFirstResponder](v2, "isFirstResponder"))
        break;
      if (-[UIResponder canBecomeFirstResponder](v2, "canBecomeFirstResponder"))
        break;
      -[UIResponder nextResponder](v2, "nextResponder");
      v3 = objc_claimAutoreleasedReturnValue();

      v2 = (UIResponder *)v3;
    }
    while (v3);
  }
  return v2;
}

- (BOOL)_nextResponderChainContainsResponder:(id)a3
{
  UIResponder *v5;
  UIResponder *v6;
  BOOL i;
  UIResponder *v8;
  void *v10;

  v5 = (UIResponder *)a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIResponder.m"), 1508, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("nextResponder"));

  }
  v6 = self;
  for (i = v6 != 0; v6; i = v6 != 0)
  {
    if (v6 == v5)
      break;
    v8 = v6;
    -[UIResponder nextResponder](v6, "nextResponder");
    v6 = (UIResponder *)objc_claimAutoreleasedReturnValue();

  }
  return i;
}

- (BOOL)_isPinningInputViews
{
  char v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __35__UIResponder__isPinningInputViews__block_invoke;
  v4[3] = &unk_1E16DE108;
  v4[4] = self;
  v4[5] = &v5;
  +[UIKeyboardSceneDelegate performOnControllers:](UIKeyboardSceneDelegate, "performOnControllers:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __35__UIResponder__isPinningInputViews__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "_isPinningInputViewsOnBehalfOfResponder:", *(_QWORD *)(a1 + 32));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) |= result;
  return result;
}

- (void)_handleKeyEvent:(__GSEvent *)a3
{
  id v4;

  -[UIResponder nextResponder](self, "nextResponder");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_handleKeyEvent:", a3);

}

- (void)_handleKeyUIEvent:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UIResponder nextResponder](self, "nextResponder");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_handleKeyUIEvent:", v4);

}

- (void)_handleGameControllerEvent:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UIResponder nextResponder](self, "nextResponder");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_handleGameControllerEvent:", v4);

}

- (BOOL)_wantsPriorityOverFocusUpdates
{
  void *v2;
  char v3;

  -[UIResponder nextResponder](self, "nextResponder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_wantsPriorityOverFocusUpdates");

  return v3;
}

- (void)_completeForwardingTouches:(id)a3 phase:(int64_t)a4 event:(id)a5 index:(unint64_t)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  unint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  NSObject *v27;
  unint64_t v28;
  NSObject *v29;
  int v30;
  const char *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  if (os_variant_has_internal_diagnostics())
  {
    if ((unint64_t)a4 > 4 || ((1 << a4) & 0x1A) == 0)
    {
      __UIFaultDebugAssertLog();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
      {
        v30 = 136315138;
        v31 = "-[UIResponder _completeForwardingTouches:phase:event:index:]";
        _os_log_fault_impl(&dword_185066000, v26, OS_LOG_TYPE_FAULT, "Unexpected touch phase in %s", (uint8_t *)&v30, 0xCu);
      }

    }
  }
  else if ((unint64_t)a4 > 4 || ((1 << a4) & 0x1A) == 0)
  {
    v21 = qword_1ECD7F890;
    if (!qword_1ECD7F890)
    {
      v21 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v21, (unint64_t *)&qword_1ECD7F890);
    }
    v22 = *(NSObject **)(v21 + 8);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v30 = 136315138;
      v31 = "-[UIResponder _completeForwardingTouches:phase:event:index:]";
      _os_log_impl(&dword_185066000, v22, OS_LOG_TYPE_ERROR, "Unexpected touch phase in %s", (uint8_t *)&v30, 0xCu);
    }
  }
  -[UIResponder nextResponder](self, "nextResponder");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "anyObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_forwardingRecord");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");
  if (v15 <= a6)
    goto LABEL_27;
  v16 = v15;
  while (1)
  {
    objc_msgSend(v14, "objectAtIndex:", a6);
    v17 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v12)
    {
      objc_msgSend(v17, "responder");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12 == v19)
        break;
    }
    objc_msgSend(v18, "setResponder:", 0);
    v20 = 0;
LABEL_14:

    ++a6;
    v12 = v20;
    if (v16 == a6)
      goto LABEL_28;
  }
  if (!v18)
  {
    if (a4 > 0)
      goto LABEL_23;
    goto LABEL_13;
  }
  if (v18[3] >= a4 && (a4 != 1 || v18[4] != 1))
  {
LABEL_13:
    objc_msgSend(v12, "nextResponder");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  v18[3] = a4;
  v18[4] = a4;
LABEL_23:
  objc_msgSend(v18, "responder");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    objc_msgSend(v13, "_eventComponentPhase");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v13, "_responderSelectorForPhase:", objc_msgSend(v24, "value"));

    if (os_variant_has_internal_diagnostics())
    {
      if (!v25)
      {
        __UIFaultDebugAssertLog();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
        {
          v30 = 136315138;
          v31 = "-[UIResponder _completeForwardingTouches:phase:event:index:]";
          _os_log_fault_impl(&dword_185066000, v27, OS_LOG_TYPE_FAULT, "Unexpected touch phase in %s", (uint8_t *)&v30, 0xCu);
        }

      }
    }
    else if (!v25)
    {
      v28 = qword_1ECD7F898;
      if (!qword_1ECD7F898)
      {
        v28 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v28, (unint64_t *)&qword_1ECD7F898);
      }
      v29 = *(NSObject **)(v28 + 8);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        v30 = 136315138;
        v31 = "-[UIResponder _completeForwardingTouches:phase:event:index:]";
        _os_log_impl(&dword_185066000, v29, OS_LOG_TYPE_ERROR, "Unexpected touch phase in %s", (uint8_t *)&v30, 0xCu);
      }
    }
    ((void (*)(void *, uint64_t, id, id))objc_msgSend(v12, "methodForSelector:", v25))(v23, v25, v10, v11);
    objc_msgSend(v23, "_completeForwardingTouches:phase:event:index:", v10, a4, v11, a6 + 1);

  }
LABEL_27:
  v20 = v12;
LABEL_28:

}

- (void)_completeForwardingTouches:(id)a3 phase:(int64_t)a4 event:(id)a5
{
  -[UIResponder _completeForwardingTouches:phase:event:index:](self, "_completeForwardingTouches:phase:event:index:", a3, a4, a5, 0);
}

- (int64_t)_availableTextServices
{
  void *v2;
  int64_t v3;

  -[UIResponder nextResponder](self, "nextResponder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_availableTextServices");

  return v3;
}

- (BOOL)_canShowTextServiceForType:(int64_t)a3
{
  return (a3 & ~-[UIResponder _availableTextServices](self, "_availableTextServices")) == 0;
}

- (id)_showServiceForType:(int64_t)a3 withContext:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  -[UIResponder nextResponder](self, "nextResponder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_showServiceForType:withContext:", a3, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_showServiceForText:(id)a3 type:(int64_t)a4 fromRect:(CGRect)a5 inView:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  id v13;
  id v14;
  void *v15;
  void *v16;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v13 = a6;
  v14 = a3;
  -[UIResponder nextResponder](self, "nextResponder");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "_showServiceForText:type:fromRect:inView:", v14, a4, v13, x, y, width, height);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)_showServiceForText:(id)a3 selectedTextRange:(_NSRange)a4 type:(int64_t)a5 fromRect:(CGRect)a6 inView:(id)a7
{
  double height;
  double width;
  double y;
  double x;
  NSUInteger length;
  NSUInteger location;
  id v16;
  id v17;
  void *v18;
  void *v19;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  length = a4.length;
  location = a4.location;
  v16 = a7;
  v17 = a3;
  -[UIResponder nextResponder](self, "nextResponder");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "_showServiceForText:selectedTextRange:type:fromRect:inView:", v17, location, length, a5, v16, x, y, width, height);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (void)pressesBegan:(NSSet *)presses withEvent:(UIPressesEvent *)event
{
  forwardTouchMethod(self, (uint64_t)a2, presses, event, 0);
}

- (void)pressesChanged:(NSSet *)presses withEvent:(UIPressesEvent *)event
{
  forwardTouchMethod(self, (uint64_t)a2, presses, event, 1);
}

- (void)pressesEnded:(NSSet *)presses withEvent:(UIPressesEvent *)event
{
  forwardTouchMethod(self, (uint64_t)a2, presses, event, 3);
}

- (void)pressesCancelled:(NSSet *)presses withEvent:(UIPressesEvent *)event
{
  forwardTouchMethod(self, (uint64_t)a2, presses, event, 4);
}

- (id)_primaryContentResponder
{
  void *v2;
  void *v3;

  -[UIResponder nextResponder](self, "nextResponder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_primaryContentResponder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (CGRect)_responderSelectionRectForWindow:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v3 = *MEMORY[0x1E0C9D648];
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)_responderExternalTouchRectForWindow:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  if (a3)
  {
    objc_msgSend(a3, "frame");
  }
  else
  {
    v3 = *MEMORY[0x1E0C9D648];
    v4 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v5 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (id)_responderSelectionContainerViewForResponder:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[UIResponder nextResponder](self, "nextResponder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_responderSelectionContainerViewForResponder:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_responderSelectionImage
{
  if (qword_1ECD7F8A8 != -1)
    dispatch_once(&qword_1ECD7F8A8, &__block_literal_global_572);
  return (id)qword_1ECD7F8A0;
}

void __39__UIResponder__responderSelectionImage__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  CGRect v6;
  CGRect v7;

  _UIGraphicsBeginImageContextWithOptions(0, 0, 23.0, 23.0, 0.0);
  +[UIColor blueColor](UIColor, "blueColor");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setStroke");

  v6.origin.x = 0.0;
  v6.origin.y = 0.0;
  v6.size.width = 23.0;
  v6.size.height = 23.0;
  v7 = CGRectInset(v6, 2.5, 2.5);
  +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v7.origin.x, v7.origin.y, v7.size.width, v7.size.height, 10.0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLineWidth:", 5.0);
  objc_msgSend(v5, "stroke");
  _UIGraphicsGetImageFromCurrentImageContext(0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  objc_msgSend(v1, "resizableImageWithCapInsets:", 11.0, 11.0, 11.0, 11.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "imageWithAlignmentRectInsets:", -7.0, -7.0, -7.0, -7.0);
  v3 = objc_claimAutoreleasedReturnValue();

  v4 = (void *)qword_1ECD7F8A0;
  qword_1ECD7F8A0 = v3;

}

- (BOOL)_supportsBecomeFirstResponderWhenPossible
{
  return 0;
}

- (BOOL)_shouldRestorationInputViewsOnlyWhenKeepingFirstResponder
{
  return 0;
}

- (CGRect)_rectToScrollToVisibleInCellInWindow:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v3 = *MEMORY[0x1E0C9D628];
  v4 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v5 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v6 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)_checkIsText:(BOOL *)a3 isSecure:(BOOL *)a4 isEditable:(BOOL *)a5 isFormatted:(BOOL *)a6
{
  int v11;
  BOOL v12;
  char v13;
  BOOL v14;
  void *v15;
  void *v16;

  v11 = -[UIResponder conformsToProtocol:](self, "conformsToProtocol:", &unk_1EDE222E8);
  v12 = v11;
  if (!v11)
  {
    v14 = 0;
    v13 = 0;
    if (!a3)
      goto LABEL_17;
LABEL_16:
    *a3 = v12;
    goto LABEL_17;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v13 = -[UIResponder isSecureTextEntry](self, "isSecureTextEntry");
  }
  else
  {
    +[UITextInputTraits traitsByAdoptingTraits:](UITextInputTraits, "traitsByAdoptingTraits:", self);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
      v13 = objc_msgSend(v15, "isSecureTextEntry");
    else
      v13 = 0;

  }
  v14 = (objc_opt_respondsToSelector() & 1) != 0 && -[UIResponder isEditable](self, "isEditable");
  if (-[UIResponder canPerformAction:withSender:](self, "canPerformAction:withSender:", sel_toggleBoldface_, 0)
    || -[UIResponder canPerformAction:withSender:](self, "canPerformAction:withSender:", sel_toggleItalics_, 0))
  {
    LOBYTE(v11) = 1;
    if (!a3)
      goto LABEL_17;
    goto LABEL_16;
  }
  LOBYTE(v11) = -[UIResponder canPerformAction:withSender:](self, "canPerformAction:withSender:", sel_toggleUnderline_, 0);
  if (a3)
    goto LABEL_16;
LABEL_17:
  if (a4)
    *a4 = v13;
  if (a5)
    *a5 = v14;
  if (a6)
    *a6 = v11;
}

- (BOOL)_disallowsPresentationOfKeyboardShortcutHUD
{
  void *v2;
  char v3;

  -[UIResponder nextResponder](self, "nextResponder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_disallowsPresentationOfKeyboardShortcutHUD");

  return v3;
}

- (BOOL)_alwaysRequireInlineCandidateView
{
  void *v2;
  char v3;

  -[UIResponder nextResponder](self, "nextResponder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_alwaysRequireInlineCandidateView");

  return v3;
}

- (BOOL)_isHardwareKeyboardBehaviorEnabled
{
  void *v2;
  char v3;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isInHardwareKeyboardMode");

  return v3;
}

- (void)pasteItemProviders:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if ((dyld_program_sdk_at_least() & 1) == 0)
  {
    -[UIResponder _nextResponderUsingTraversalStrategy:](self, "_nextResponderUsingTraversalStrategy:", 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
      objc_msgSend(v5, "pasteItemProviders:", v8);

  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIResponder.m"), 1896, CFSTR("pasteItemProviders: must be overridden if pasteConfiguration is not nil."));

}

- (id)_responderChainDescription
{
  return _UIResponderChainDescription(self, 0);
}

- (id)_targetActionResponderChainDescription
{
  return _UIResponderChainDescription(self, 2);
}

- (int64_t)_dragDataOwner
{
  void *v3;
  void *v4;
  void *v5;

  objc_getAssociatedObject(self, &_dragDataOwnerKey);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "integerValue");

  if (!v4)
  {
    -[UIResponder nextResponder](self, "nextResponder");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[UIResponder nextResponder](self, "nextResponder");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (void *)objc_msgSend(v5, "_dragDataOwner");

    }
  }
  return (int64_t)v4;
}

- (void)_setDragDataOwner:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(self, &_dragDataOwnerKey, v4, (void *)1);

}

- (int64_t)_dropDataOwner
{
  void *v3;
  void *v4;
  void *v5;

  objc_getAssociatedObject(self, &_dropDataOwnerKey);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "integerValue");

  if (!v4)
  {
    -[UIResponder nextResponder](self, "nextResponder");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[UIResponder nextResponder](self, "nextResponder");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (void *)objc_msgSend(v5, "_dropDataOwner");

    }
  }
  return (int64_t)v4;
}

- (void)_setDropDataOwner:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(self, &_dropDataOwnerKey, v4, (void *)1);

}

- (int64_t)_dataOwnerForCopy
{
  void *v3;
  void *v4;
  void *v5;

  objc_getAssociatedObject(self, &_dataOwnerForCopyKey);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "integerValue");

  if (!v4)
  {
    -[UIResponder nextResponder](self, "nextResponder");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[UIResponder nextResponder](self, "nextResponder");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (void *)objc_msgSend(v5, "_dataOwnerForCopy");

    }
  }
  return (int64_t)v4;
}

- (void)_setDataOwnerForCopy:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(self, &_dataOwnerForCopyKey, v4, (void *)1);

}

- (int64_t)_dataOwnerForPaste
{
  void *v3;
  void *v4;
  void *v5;

  objc_getAssociatedObject(self, &_dataOwnerForPasteKey);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "integerValue");

  if (!v4)
  {
    -[UIResponder nextResponder](self, "nextResponder");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[UIResponder nextResponder](self, "nextResponder");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (void *)objc_msgSend(v5, "_dataOwnerForPaste");

    }
  }
  return (int64_t)v4;
}

- (void)_setDataOwnerForPaste:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(self, &_dataOwnerForPasteKey, v4, (void *)1);

}

+ (void)clearTextInputContextIdentifier:(NSString *)identifier
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (objc_class *)MEMORY[0x1E0C99EA0];
  v4 = identifier;
  v7 = (id)objc_msgSend([v3 alloc], "initWithSuiteName:", CFSTR("UITextInputContextIdentifiers"));
  objc_msgSend(CFSTR("ID_"), "stringByAppendingString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "stringByAppendingString:", CFSTR("_SETTIME"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObjectForKey:", v5);
  objc_msgSend(v7, "removeObjectForKey:", v6);

}

- (void)reloadInputViewsWithoutReset
{
  void *v3;
  void *v4;
  id v5;

  if (-[UIResponder shouldReloadInputViews](self, "shouldReloadInputViews"))
  {
    -[UIResponder _window](self, "_window");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "windowScene");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "keyboardSceneDelegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "_setReloadInputViewsForcedIsAllowed:", 0);
    objc_msgSend(v5, "_reloadInputViewsForResponder:", self);
    objc_msgSend(v5, "_setReloadInputViewsForcedIsAllowed:", 1);

  }
}

- (UITextInputAssistantItem)inputAssistantItem
{
  void *v3;

  if ((*(_WORD *)&self->_responderFlags & 4) == 0
    || (objc_getAssociatedObject(self, &_UIResponderInputAssistantItem),
        (v3 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    +[UIAssistantBarButtonItemProvider systemDefaultAssistantItem](UIAssistantBarButtonItemProvider, "systemDefaultAssistantItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *(_WORD *)&self->_responderFlags = *(_WORD *)&self->_responderFlags & 0xFFFB | (4 * (v3 != 0));
    objc_setAssociatedObject(self, &_UIResponderInputAssistantItem, v3, (void *)1);
  }
  return (UITextInputAssistantItem *)v3;
}

- (void)_setSuppressSoftwareKeyboard:(BOOL)a3
{
  __int16 responderFlags;
  __int16 v4;
  id v5;

  responderFlags = (__int16)self->_responderFlags;
  if (((((responderFlags & 8) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v4 = 8;
    else
      v4 = 0;
    *(_WORD *)&self->_responderFlags = responderFlags & 0xFFF7 | v4;
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_suppressSoftwareKeyboardStateChangedIgnoringPolicyDelegate:", 1);

  }
}

- (void)captureTextFromCamera:(id)sender
{
  void *v4;
  void *v5;
  id v6;

  v6 = sender;
  -[UIResponder _keyboardResponder](self, "_keyboardResponder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    +[UIKeyboardCameraSession sharedSession](UIKeyboardCameraSession, "sharedSession");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "showForResponder:sender:rtiConfiguration:", v4, v6, 0);

  }
}

- (NSArray)keyCommands
{
  return 0;
}

void __37___UIResponder_Override_Host_dealloc__block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  if (a2 == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "overridden");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_overrideInputAccessoryViewNextResponderWithResponder:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    if (a2 != 1)
      return;
    objc_msgSend(*(id *)(a1 + 32), "overridden");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_overrideInputViewNextResponderWithResponder:", *(_QWORD *)(a1 + 40));
  }

}

- (void)_rebuildStateRestorationIdentifierPath
{
  id v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    _rebuildStateRestorationIdentifierPath(self, v3);

  }
  else if (_UIStateRestorationDebugLogEnabled())
  {
    NSLog(CFSTR("%s: Warning: called on a UIResponder which isn't a View Controller: %@"), "-[UIResponder(StateRestoration) _rebuildStateRestorationIdentifierPath]", self);
  }
}

+ (id)objectWithRestorationIdentifierPath:(id)a3
{
  id result;

  if (!qword_1ECD80188)
    return (id)objc_msgSend((id)qword_1ECD80190, "objectForKey:", a3);
  result = (id)objc_msgSend((id)qword_1ECD80188, "objectForKey:", a3);
  if (!result)
    return (id)objc_msgSend((id)qword_1ECD80190, "objectForKey:", a3);
  return result;
}

- (id)_restorationIdentifierPath
{
  id result;

  result = -[UIResponder restorationIdentifier](self, "restorationIdentifier");
  if (result)
    return (id)objc_msgSend((id)_restorationIdentifierPathArrayForResponder(self), "componentsJoinedByString:", CFSTR("/"));
  return result;
}

void __69__UIResponder_StateRestoration___updateStateRestorationIdentifierMap__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;

  v3 = _restorationIdentifierForObject(a2);
  if (v3)
  {
    v4 = (uint64_t)v3;
    v5 = (id)qword_1ECD80188;
    if (!qword_1ECD80188)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      qword_1ECD80188 = (uint64_t)v5;
    }
    _putObjectIdentifierIntoRestorationIdentifierMap(a2, v4, v5);
  }
  else if (_UIStateRestorationDebugLogEnabled())
  {
    NSLog(CFSTR("%s: WARNING! Object added to _objectsWithIdentifiers for tracking, but has no restoration identifier. Skipping: %@"), "+[UIResponder(StateRestoration) _updateStateRestorationIdentifierMap]_block_invoke", a2);
  }
}

+ (void)_setRestoredIdentifierPathForObject:(id)a3 identifierPath:(id)a4
{
  void *v6;
  id v7;

  v6 = (void *)objc_msgSend(a4, "componentsSeparatedByString:", CFSTR("/"));
  if (objc_msgSend(v6, "count"))
  {
    v7 = (id)qword_1ECD80168;
    if (!qword_1ECD80168)
    {
      v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      qword_1ECD80168 = (uint64_t)v7;
    }
    objc_msgSend(v7, "setObject:forKey:", v6, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%p"), a3));
    objc_msgSend(v6, "lastObject");
    _trackObjectWithIdentifier((uint64_t)a3);
  }
  else if (_UIStateRestorationDebugLogEnabled())
  {
    NSLog(CFSTR("%s: Warning: identifier path results in 0 identifiers in array. Passed in path: %@, object %@"), "+[UIResponder(StateRestoration) _setRestoredIdentifierPathForObject:identifierPath:]", a4, a3);
  }
}

- (BOOL)_supportsImagePaste
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  int v13;
  char v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  UIResponder *v19;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  id v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  -[UIResponder pasteConfiguration](self, "pasteConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    objc_msgSend(v3, "acceptableTypeIdentifiers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v6)
    {
      v7 = v6;
      v21 = v4;
      v8 = 0;
      v9 = *(_QWORD *)v23;
      v10 = *MEMORY[0x1E0CEC580];
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v23 != v9)
            objc_enumerationMutation(v5);
          objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "conformsToType:", v10);

          if (v13)
            v8 = 1;
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v7);

      v4 = v21;
      if ((v8 & 1) != 0)
      {
        v14 = 1;
        goto LABEL_19;
      }
    }
    else
    {

    }
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v14 = -[UIResponder supportsImagePaste](self, "supportsImagePaste");
  }
  else
  {
    if (_supportsImagePaste_onceToken != -1)
      dispatch_once(&_supportsImagePaste_onceToken, &__block_literal_global_55_1);
    v15 = objc_alloc_init(MEMORY[0x1E0CB36C8]);
    objc_msgSend((id)*MEMORY[0x1E0CEC580], "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "registerDataRepresentationForTypeIdentifier:visibility:loadHandler:", v16, 0, &__block_literal_global_56_3);

    v26 = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 5.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIPasteboard _pinItemProviders:forPasteboardNamed:withExpirationDate:](UIPasteboard, "_pinItemProviders:forPasteboardNamed:withExpirationDate:", v17, CFSTR("com.apple.UIKit.pboard.general"), v18);

    -[UIResponder targetForAction:withSender:](self, "targetForAction:withSender:", sel_paste_, 0);
    v19 = (UIResponder *)objc_claimAutoreleasedReturnValue();

    +[UIPasteboard _clearPinnedItemProvidersForPasteboardNamed:](UIPasteboard, "_clearPinnedItemProvidersForPasteboardNamed:", CFSTR("com.apple.UIKit.pboard.general"));
    v14 = v19 == self;

  }
LABEL_19:

  return v14;
}

void __55__UIResponder__UIStickerExtension___supportsImagePaste__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", CFSTR("iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mNk+M9QDwADhgGAWjR9awAAAABJRU5ErkJggg=="), 0);
  v1 = (void *)_supportsImagePaste_imgData;
  _supportsImagePaste_imgData = v0;

}

uint64_t __55__UIResponder__UIStickerExtension___supportsImagePaste__block_invoke_2(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t, _QWORD))(a2 + 16))(a2, _supportsImagePaste_imgData, 0);
  return 0;
}

- (void)_insertItemFromProvider:(id)a3 completionHandler:(id)a4
{
  void (**v6)(id, BOOL);
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  dispatch_time_t v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, BOOL))a4;
  v16 = a3;
  v7 = (void *)MEMORY[0x1E0C99D20];
  v8 = a3;
  objc_msgSend(v7, "arrayWithObjects:count:", &v16, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 0.5, v16, v17);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIPasteboard _pinItemProviders:forPasteboardNamed:withExpirationDate:](UIPasteboard, "_pinItemProviders:forPasteboardNamed:withExpirationDate:", v9, CFSTR("com.apple.UIKit.pboard.general"), v10);

  -[UIResponder targetForAction:withSender:](self, "targetForAction:withSender:", sel_paste_, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = objc_msgSend(v11, "conformsToProtocol:", &unk_1EE0CE648);

    if (v13)
    {
      objc_msgSend(v12, "pasteWithCompletionHandler:", &__block_literal_global_170_1);
      if (!v6)
        goto LABEL_7;
    }
    else
    {
      objc_msgSend(v12, "paste:", 0);
      v15 = dispatch_time(0, 500000000);
      dispatch_after(v15, MEMORY[0x1E0C80D38], &__block_literal_global_171_0);
      if (!v6)
        goto LABEL_7;
    }
    goto LABEL_6;
  }
  +[UIPasteboard generalPasteboard](UIPasteboard, "generalPasteboard");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "_clearPinnedItemProviders");
  if (v6)
LABEL_6:
    v6[2](v6, v12 != 0);
LABEL_7:

}

void __78__UIResponder__UIStickerExtension___insertItemFromProvider_completionHandler___block_invoke()
{
  id v0;

  +[UIPasteboard generalPasteboard](UIPasteboard, "generalPasteboard");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "_clearPinnedItemProviders");

}

void __78__UIResponder__UIStickerExtension___insertItemFromProvider_completionHandler___block_invoke_2()
{
  id v0;

  +[UIPasteboard generalPasteboard](UIPasteboard, "generalPasteboard");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "_clearPinnedItemProviders");

}

- (BOOL)_supportsWritingTools
{
  id WTWritingToolsViewControllerClass;
  void *v4;
  int v5;
  BOOL v6;
  BOOL v7;

  WTWritingToolsViewControllerClass = getWTWritingToolsViewControllerClass();
  if (!WTWritingToolsViewControllerClass
    || !objc_msgSend(WTWritingToolsViewControllerClass, "isAvailable"))
  {
    return 0;
  }
  -[UIResponder _textInputForWritingTools](self, "_textInputForWritingTools");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4
    || -[UIResponder _writingToolsBehavior](self, "_writingToolsBehavior") == -1
    || -[UIResponder _isEditableForWritingTools](self, "_isEditableForWritingTools")
    && !objc_msgSend(v4, "hasText"))
  {
    v7 = 0;
  }
  else
  {
    v5 = MKBGetDeviceLockState();
    if (v5)
      v6 = v5 == 3;
    else
      v6 = 1;
    v7 = v6;
  }

  return v7;
}

- (id)_textInputForWritingTools
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[UIResponder _firstResponder](self, "_firstResponder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_textInteraction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v2, "_textInteraction");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v2, "_selectionDisplayInteraction");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      v7 = 0;
      goto LABEL_6;
    }
    objc_msgSend(v2, "_selectionDisplayInteraction");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v6 = v4;
  objc_msgSend(v4, "textInput");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
  return v7;
}

- (int64_t)_writingToolsBehavior
{
  void *v2;
  int64_t v3;

  -[UIResponder _textInputForWritingTools](self, "_textInputForWritingTools");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "writingToolsBehavior");
  else
    v3 = 0;

  return v3;
}

- (BOOL)_isEditableForWritingTools
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  -[UIResponder _textInputForWritingTools](self, "_textInputForWritingTools");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = objc_msgSend(v3, "isEditable");
  }
  else
  {
    -[UIResponder _textInteraction](self, "_textInteraction");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[UIResponder _textInteraction](self, "_textInteraction");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v6, "textInteractionMode") == 0;

    }
    else
    {
      v4 = 1;
    }
  }

  return v4;
}

- (id)_writingToolsDelegate
{
  void *v3;
  void *v4;
  id v5;

  -[UIResponder _textInputForWritingTools](self, "_textInputForWritingTools");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_msgSend(v3, "textLayoutManager"), v4 = (void *)objc_claimAutoreleasedReturnValue(), v4, !v4)
    || -[UIResponder _writingToolsBehavior](self, "_writingToolsBehavior") == 2
    || (objc_opt_respondsToSelector() & 1) == 0)
  {
    v5 = 0;
  }
  else
  {
    v5 = v3;
  }

  return v5;
}

- (BOOL)_shouldDisplayWritingToolsCandidateOptions
{
  BOOL v3;
  void *v4;
  void *v5;

  if (!-[UIResponder _supportsWritingTools](self, "_supportsWritingTools"))
    return 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return 0;
  -[UIResponder _writingToolsDelegate](self, "_writingToolsDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4
    && ((objc_opt_respondsToSelector() & 1) == 0 || objc_msgSend(v4, "wantsWritingToolsInlineEditing"))
    && -[UIResponder _textIsLargeEnoughToUseWritingTools](self, "_textIsLargeEnoughToUseWritingTools"))
  {
    -[UIResponder _writingToolsViewController](self, "_writingToolsViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v5 == 0;

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (BOOL)_shouldDisplayWritingToolsCalloutBarItem
{
  void *v3;
  id v4;
  void *v5;
  BOOL v6;

  -[UIResponder _writingToolsDelegate](self, "_writingToolsDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    if (objc_msgSend(v4, "_supportsWritingTools"))
    {
      objc_msgSend(v4, "_writingToolsViewController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5 == 0;

    }
    else
    {
      v6 = 0;
    }
  }
  else
  {
    if (!-[UIResponder _supportsWritingTools](self, "_supportsWritingTools"))
    {
      v6 = 0;
      goto LABEL_9;
    }
    -[UIResponder _writingToolsViewController](self, "_writingToolsViewController");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v6 = v4 == 0;
  }

LABEL_9:
  return v6;
}

- (void)_startWritingTools:(id)a3
{
  -[UIResponder _startWritingToolsWithTool:prompt:sender:](self, "_startWritingToolsWithTool:prompt:sender:", CFSTR("WTUIRequestedToolNone"), 0, a3);
}

- (void)_startWritingToolsWithTool:(id)a3 sender:(id)a4
{
  -[UIResponder _startWritingToolsWithTool:prompt:entryPoint:inputContextHistory:sender:](self, "_startWritingToolsWithTool:prompt:entryPoint:inputContextHistory:sender:", a3, 0, 0, 0, a4);
}

- (void)_startWritingToolsWithTool:(id)a3 prompt:(id)a4 sender:(id)a5
{
  -[UIResponder _startWritingToolsWithTool:prompt:entryPoint:inputContextHistory:sender:](self, "_startWritingToolsWithTool:prompt:entryPoint:inputContextHistory:sender:", a3, a4, 0, 0, a5);
}

- (void)_startWritingToolsWithTool:(id)a3 prompt:(id)a4 entryPoint:(id)a5 inputContextHistory:(id)a6 sender:(id)a7
{
  __CFString *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  unint64_t v21;
  NSObject *v22;
  int v23;
  UIResponder *v24;
  __int16 v25;
  UIResponder *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v11 = (__CFString *)a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (-[UIResponder _supportsWritingTools](self, "_supportsWritingTools"))
  {
    v15 = objc_alloc((Class)getWTWritingToolsViewControllerClass());
    if (v14)
      v16 = objc_msgSend(v15, "_initWithRequestedTool:baseResponse:entryPoint:inputContextHistory:", v11, v12, v13, v14);
    else
      v16 = objc_msgSend(v15, "initWithRequestedTool:prompt:", v11, v12);
    v17 = (void *)v16;
    -[UIResponder _setWritingToolsViewController:](self, "_setWritingToolsViewController:", v16);
    -[UIResponder _textInputForWritingTools](self, "_textInputForWritingTools");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_variant_has_internal_diagnostics())
    {
      if (!v18)
      {
        __UIFaultDebugAssertLog();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
        {
          v23 = 138412546;
          v24 = self;
          v25 = 2048;
          v26 = self;
          _os_log_fault_impl(&dword_185066000, v20, OS_LOG_TYPE_FAULT, "<%@:%p> can not find UITextInput", (uint8_t *)&v23, 0x16u);
        }

      }
    }
    else if (!v18)
    {
      v21 = _startWritingToolsWithTool_prompt_entryPoint_inputContextHistory_sender____s_category;
      if (!_startWritingToolsWithTool_prompt_entryPoint_inputContextHistory_sender____s_category)
      {
        v21 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v21, (unint64_t *)&_startWritingToolsWithTool_prompt_entryPoint_inputContextHistory_sender____s_category);
      }
      v22 = *(NSObject **)(v21 + 8);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v23 = 138412546;
        v24 = self;
        v25 = 2048;
        v26 = self;
        _os_log_impl(&dword_185066000, v22, OS_LOG_TYPE_ERROR, "<%@:%p> can not find UITextInput", (uint8_t *)&v23, 0x16u);
      }
    }
    objc_msgSend(v17, "setSourceResponder:sourceTextInput:", self, v18);
    -[UIResponder _writingToolsDelegate](self, "_writingToolsDelegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setWritingToolsDelegate:", v19);

    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v18, "willPresentWritingTools");
    objc_msgSend(v17, "startWritingTools");
    if (v11 != CFSTR("WTUIRequestedToolNone"))
      -[UIResponder _playInvocationAnimation](self, "_playInvocationAnimation");

  }
}

- (void)_endWritingTools
{
  id v2;

  -[UIResponder _writingToolsViewController](self, "_writingToolsViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endWritingTools");

}

- (void)_endUpWritingToolsIfNecessaryForResignFirstResponder
{
  void *v3;

  -[UIResponder _writingToolsInputDashboardViewController](self, "_writingToolsInputDashboardViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[UIResponder _endWritingTools](self, "_endWritingTools");
}

- (void)_writingToolsDidEnd
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[UIResponder _textInputForWritingTools](self, "_textInputForWritingTools");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[UIResponder _setWritingToolsViewController:](self, "_setWritingToolsViewController:", 0);
  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "systemInputAssistantViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInputAssistantButtonItemsForResponder:", self);

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "writingToolsDidEnd");

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "didDismissWritingTools");

}

- (void)_setWritingToolsWantsKeyboardSuppression:(BOOL)a3
{
  -[UIResponder _setWritingToolsWantsKeyboardSuppression:suppressAssistant:](self, "_setWritingToolsWantsKeyboardSuppression:suppressAssistant:", a3, 1);
}

- (void)_setWritingToolsWantsKeyboardSuppression:(BOOL)a3 suppressAssistant:(BOOL)a4
{
  _BOOL8 v5;
  void *v6;
  void *v7;
  void *v8;
  id value;

  if (a3)
  {
    v5 = !a4;
    +[_UIRemoteKeyboards sharedRemoteKeyboards](_UIRemoteKeyboards, "sharedRemoteKeyboards");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWantsAssistantWhileSuppressingKeyboard:", v5);

    +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "vendKeyboardSuppressionAssertionForReason:type:", CFSTR("WritingTools"), 0);
    value = (id)objc_claimAutoreleasedReturnValue();

    objc_setAssociatedObject(self, &kKeyboardSuppressionAssertionKey, value, (void *)1);
  }
  else
  {
    +[_UIRemoteKeyboards sharedRemoteKeyboards](_UIRemoteKeyboards, "sharedRemoteKeyboards", a3, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWantsAssistantWhileSuppressingKeyboard:", 0);

    objc_setAssociatedObject(self, &kKeyboardSuppressionAssertionKey, 0, (void *)1);
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    value = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(value, "generateCandidates");
  }

}

- (BOOL)_writingToolsWantsKeyboardSuppression
{
  void *v2;
  BOOL v3;

  objc_getAssociatedObject(self, &kKeyboardSuppressionAssertionKey);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (UIPredictiveViewController)_writingToolsInputDashboardViewController
{
  return (UIPredictiveViewController *)objc_getAssociatedObject(self, &kWritingToolsInputDashboardViewControllerKey);
}

- (void)_setWritingToolsInputDashboardViewController:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_setAssociatedObject(self, &kWritingToolsInputDashboardViewControllerKey, a3, (void *)1);
  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "systemInputAssistantViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInputAssistantButtonItemsForResponder:", self);

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateAssistantView");

}

- (UIPredictiveViewController)_smartReplyFeedbackInputDashboardViewController
{
  _UISmartReplyFeedbackInputDashboardViewController *v3;

  objc_getAssociatedObject(self, &kSmartReplyFeedbackInputDashboardViewControllerKey);
  v3 = (_UISmartReplyFeedbackInputDashboardViewController *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v3 = objc_alloc_init(_UISmartReplyFeedbackInputDashboardViewController);
    -[UIResponder _setSmartReplyFeedbackInputDashboardViewController:](self, "_setSmartReplyFeedbackInputDashboardViewController:", v3);
  }
  return (UIPredictiveViewController *)v3;
}

- (void)_setSmartReplyFeedbackInputDashboardViewController:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_setAssociatedObject(self, &kSmartReplyFeedbackInputDashboardViewControllerKey, a3, (void *)1);
  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "systemInputAssistantViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInputAssistantButtonItemsForResponder:", self);

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateAssistantView");

}

- (id)_textSuggestionsForWritingTools
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  _UINSLocalizedStringWithDefaultValue(CFSTR("Proofread"), CFSTR("Proofread"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UITextSuggestion textSuggestionWithInputText:searchText:customInfoType:](UITextSuggestionWithAction, "textSuggestionWithInputText:searchText:customInfoType:", v3, v3, 0x10000);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTarget:", self);
  objc_msgSend(v4, "setAction:", sel__startProofreading);
  +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("text.magnifyingglass"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImage:", v5);

  _UINSLocalizedStringWithDefaultValue(CFSTR("Rewrite"), CFSTR("Rewrite"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[UITextSuggestion textSuggestionWithInputText:searchText:customInfoType:](UITextSuggestionWithAction, "textSuggestionWithInputText:searchText:customInfoType:", v6, v6, 0x10000);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTarget:", self);
  objc_msgSend(v7, "setAction:", sel__startRewriting);
  +[UIImage _systemImageNamed:](UIImage, "_systemImageNamed:", CFSTR("pencil.arrow.trianglehead.clockwise"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setImage:", v8);

  +[UITextSuggestion textSuggestionWithInputText:searchText:customInfoType:](UITextSuggestionWithAction, "textSuggestionWithInputText:searchText:customInfoType:", 0, 0, 0x10000);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTarget:", self);
  objc_msgSend(v9, "setAction:", sel__startWritingTools_);
  +[UIImageSymbolConfiguration configurationPreferringMulticolor](UIImageSymbolConfiguration, "configurationPreferringMulticolor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIImage _systemImageNamed:withConfiguration:](UIImage, "_systemImageNamed:withConfiguration:", CFSTR("_gm"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setImage:", v11);

  v14[0] = v4;
  v14[1] = v7;
  v14[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_trailingPredictiveCandidateForWritingTools
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  if (((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) != 1
     || +[UIKeyboardImpl isFloating](UIKeyboardImpl, "isFloating"))
    && (-[UIResponder _writingToolsViewController](self, "_writingToolsViewController"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_opt_respondsToSelector(),
        v3,
        (v4 & 1) != 0))
  {
    -[UIResponder _writingToolsViewController](self, "_writingToolsViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "trailingPredictiveCandidate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)_assistantBarButtonItemForWritingToolsWithStyle:(int64_t)a3
{
  void *v5;
  char v6;
  void *v7;
  void *v8;

  -[UIResponder _writingToolsViewController](self, "_writingToolsViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[UIResponder _writingToolsViewController](self, "_writingToolsViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "assistantBarButtonItemWithStyle:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (BOOL)_isDisplayingWritingToolsSessionInUCB
{
  void *v3;
  void *v4;
  char v5;

  -[UIResponder _writingToolsInputDashboardViewController](self, "_writingToolsInputDashboardViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && -[UIResponder _writingToolsWantsKeyboardSuppression](self, "_writingToolsWantsKeyboardSuppression"))
  {
    +[_UIRemoteKeyboards sharedRemoteKeyboards](_UIRemoteKeyboards, "sharedRemoteKeyboards");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "wantsAssistantWhileSuppressingKeyboard");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_setWritingToolsViewController:(id)a3
{
  id v3;

  objc_setAssociatedObject(self, &KWritingToolsViewControllerKey, a3, (void *)1);
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "generateCandidates");

}

- (id)_writingToolsViewController
{
  return objc_getAssociatedObject(self, &KWritingToolsViewControllerKey);
}

- (void)_setSuppressWritingToolsForRemoteKeyboard:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[UIResponder _writingToolsViewController](self, "_writingToolsViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "setSuppressWritingToolsForRemoteKeyboard:", v3);

}

- (void)_startProofreading
{
  -[UIResponder _startWritingToolsWithTool:prompt:sender:](self, "_startWritingToolsWithTool:prompt:sender:", CFSTR("WTUIRequestedToolProofreading"), 0, 0);
}

- (void)_startRewriting
{
  -[UIResponder _startWritingToolsWithTool:prompt:sender:](self, "_startWritingToolsWithTool:prompt:sender:", CFSTR("WTUIRequestedToolRewriting"), 0, 0);
}

- (BOOL)_textIsLargeEnoughToUseWritingTools
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  int v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  float v17;
  BOOL v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;

  -[UIResponder _textInputForWritingTools](self, "_textInputForWritingTools");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "conformsToProtocolCached:", &unk_1EE0CE288))
  {
    v3 = v2;
    objc_msgSend(v3, "selectedTextRange");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "start");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "caretRectForPosition:", v5);
    v7 = v6;

    objc_msgSend(v4, "end");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "caretRectForPosition:", v8);
    v10 = v9;

LABEL_5:
    v17 = v7 - v10;
    v18 = fabsf(v17) > 2.0;
    goto LABEL_13;
  }
  v11 = objc_msgSend(v2, "conformsToProtocolCached:", &unk_1EE0CE648);
  objc_msgSend(v2, "selectedTextRange");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v12;
  if (v11)
  {
    objc_msgSend(v12, "start");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "caretRectForPosition:", v13);
    v7 = v14;

    objc_msgSend(v4, "end");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "caretRectForPosition:", v15);
    v10 = v16;

    goto LABEL_5;
  }
  objc_msgSend(v2, "tokenizer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "start");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    objc_msgSend(v19, "rangeEnclosingPosition:withGranularity:inDirection:", v20, 4, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = 0;
  }
  objc_msgSend(v4, "end");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "end");
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = (void *)v23;
  v18 = 0;
  if (v22 && v23)
    v18 = objc_msgSend(v2, "comparePosition:toPosition:", v22, v23) == 1;

LABEL_13:
  return v18;
}

- (void)_playInvocationAnimation
{
  void *v3;
  _QWORD v4[5];
  _QWORD v5[5];

  -[UIResponder _setCommonUIInvocationAnimationNeeded:](self, "_setCommonUIInvocationAnimationNeeded:", 1);
  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateRenderConfigForResponder:", self);

  v4[4] = self;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __60__UIResponder_WritingToolsSupport___playInvocationAnimation__block_invoke;
  v5[3] = &unk_1E16B1B28;
  v5[4] = self;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __60__UIResponder_WritingToolsSupport___playInvocationAnimation__block_invoke_2;
  v4[3] = &unk_1E16B3FD8;
  +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v5, v4, 3.0);
}

void __60__UIResponder_WritingToolsSupport___playInvocationAnimation__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_setCommonUIInvocationAnimationNeeded:", 0);
  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateRenderConfigForResponder:", *(_QWORD *)(a1 + 32));

}

uint64_t __60__UIResponder_WritingToolsSupport___playInvocationAnimation__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setCommonUIInvocationAnimationNeeded:", 0);
}

- (BOOL)_commonUIInvocationAnimationNeeded
{
  void *v2;
  char v3;

  objc_getAssociatedObject(self, &kCommonUIInvocationAnimationNeededKey);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)_setCommonUIInvocationAnimationNeeded:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(self, &kCommonUIInvocationAnimationNeededKey, v4, (void *)1);

}

@end
