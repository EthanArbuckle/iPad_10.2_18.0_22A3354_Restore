@implementation UIKBInputDelegateManager

+ (BOOL)isAsyncTextInputEnabled
{
  BOOL v2;

  if (qword_1ECD7DC60 != -1)
    dispatch_once(&qword_1ECD7DC60, &__block_literal_global_223);
  if (qword_1ECD7DC58)
    v2 = 0;
  else
    v2 = _MergedGlobals_1049 == 0;
  if (v2)
    return _os_feature_enabled_impl();
  if (qword_1ECD7DC58 == 1 && _MergedGlobals_1049 == 0)
    return _os_feature_enabled_impl();
  else
    return 0;
}

- (void)updateSelectableInputDelegateIfNecessary
{
  void *v3;
  id v4;

  self->m_firstResponderAdoptsTextInput = 0;
  +[UIWindow _applicationKeyWindow](UIWindow, "_applicationKeyWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstResponder");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v4, "conformsToProtocol:", &unk_1EDE22B80))
    self->m_firstResponderAdoptsTextInput = 1;

}

- (id)delegateAsResponder
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  BOOL v11;

  -[UIKBInputDelegateManager keyInputDelegate](self, "keyInputDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_msgSend(v3, "window"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "screen"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "_userInterfaceIdiom"),
        v5,
        v4,
        v6 == 3))
  {
    v7 = v3;
  }
  else
  {
    objc_msgSend((id)UIApp, "keyWindow");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstResponder");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[UIKBInputDelegateManager forwardingInputDelegate](self, "forwardingInputDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[UIKBInputDelegateManager forwardingInputDelegate](self, "forwardingInputDelegate");
      v10 = objc_claimAutoreleasedReturnValue();

      v7 = (id)v10;
    }
    if (v7)
      v11 = 1;
    else
      v11 = v3 == 0;
    if (!v11)
      v7 = v3;

  }
  return v7;
}

- (id)delegateRespectingForwardingDelegate:(BOOL)a3
{
  UIKeyInput *WeakRetained;

  if (a3
    && -[UIKBInputDelegateManager shouldRespectForwardingInputDelegate](self, "shouldRespectForwardingInputDelegate"))
  {
    WeakRetained = (UIKeyInput *)objc_loadWeakRetained((id *)&self->_forwardingInputDelegate);
  }
  else
  {
    WeakRetained = self->_keyInputDelegate;
  }
  return WeakRetained;
}

- (BOOL)shouldRespectForwardingInputDelegate
{
  return self->_shouldRespectForwardingInputDelegate;
}

- (UIKeyInput)keyInputDelegate
{
  return (UIKeyInput *)-[UIKBInputDelegateManager delegateRespectingForwardingDelegate:](self, "delegateRespectingForwardingDelegate:", 1);
}

- (UIKeyInput)forwardingInputDelegate
{
  return (UIKeyInput *)objc_loadWeakRetained((id *)&self->_forwardingInputDelegate);
}

- (BOOL)hasAsyncCapableInputDelegate
{
  void *v2;
  BOOL v3;

  -[UIKBInputDelegateManager asyncCapableInputDelegate](self, "asyncCapableInputDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)setContinuousSpellCheckingEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  char v6;
  id v7;

  v3 = a3;
  -[UIKBInputDelegateManager keyInputDelegate](self, "keyInputDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[UIKBInputDelegateManager keyInputDelegate](self, "keyInputDelegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setContinuousSpellCheckingEnabled:", v3);

  }
}

- (void)setShouldRespectForwardingInputDelegate:(BOOL)a3
{
  self->_shouldRespectForwardingInputDelegate = a3;
}

- (void)clearForwardingInputDelegateAndResign:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;

  v3 = a3;
  -[UIKBInputDelegateManager forwardingInputDelegate](self, "forwardingInputDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (v3)
    {
      -[UIKBInputDelegateManager forwardingInputDelegate](self, "forwardingInputDelegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "resignFirstResponder");

    }
    -[UIKBInputDelegateManager setForwardingInputDelegate:](self, "setForwardingInputDelegate:", 0);
    self->m_originalDelegateConformanceType = 0;
  }
}

- (UITextInteractionAssistant)textInteractionAssistant
{
  void *v3;
  void *v4;
  void *v5;

  -[UIKBInputDelegateManager privateInputDelegate](self, "privateInputDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[UIKBInputDelegateManager privateInputDelegate](self, "privateInputDelegate");
  else
    -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "interactionAssistant");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (UITextInteractionAssistant *)v5;
}

- (id)privateInputDelegate
{
  if ((self->m_delegateConformanceType & 4) == 0)
    return 0;
  -[UIKBInputDelegateManager keyInputDelegate](self, "keyInputDelegate");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)markedText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
    v7 = v4;
    objc_msgSend(v4, "markedText");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  -[UIKBInputDelegateManager asyncWebKitInteractionDelegate](self, "asyncWebKitInteractionDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[UIKBInputDelegateManager asyncWebKitInteractionDelegate](self, "asyncWebKitInteractionDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "markedTextRange");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "markedTextRange");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "textInRange:", v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

LABEL_8:
  return v8;
}

- (id)endOfDocument
{
  void *v2;
  void *v3;

  -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endOfDocument");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)comparePosition:(id)a3 toPosition:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int64_t v9;

  v6 = a4;
  v7 = a3;
  -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "comparePosition:toPosition:", v7, v6);

  return v9;
}

- (id)beginningOfDocument
{
  void *v2;
  void *v3;

  -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "beginningOfDocument");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)textInputDelegate
{
  if ((self->m_delegateConformanceType & 2) == 0)
    return 0;
  -[UIKBInputDelegateManager keyInputDelegate](self, "keyInputDelegate");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)_hasMarkedText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v10;
  void *v11;
  void *v12;

  -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
    v7 = v4;
    v8 = objc_msgSend(v4, "hasMarkedText");
    goto LABEL_8;
  }
  -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  -[UIKBInputDelegateManager asyncWebKitInteractionDelegate](self, "asyncWebKitInteractionDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[UIKBInputDelegateManager asyncWebKitInteractionDelegate](self, "asyncWebKitInteractionDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "markedTextRange");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "textInRange:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v12, "length") != 0;

  }
  else
  {
    v8 = 0;
  }
LABEL_8:

  return v8;
}

- (id)textInputView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[UIKBInputDelegateManager asyncWebKitInteractionDelegate](self, "asyncWebKitInteractionDelegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
        -[UIKBInputDelegateManager asyncWebKitInteractionDelegate](self, "asyncWebKitInteractionDelegate");
      else
        -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  v7 = v4;
  objc_msgSend(v4, "textInputView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)asyncCapableInputDelegate
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      -[UIKBInputDelegateManager asyncWebKitInteractionDelegate](self, "asyncWebKitInteractionDelegate");
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v5 = v8;

  }
  return v5;
}

- (id)webInputDelegate
{
  id WeakRetained;
  UIKeyInput *v4;

  if (!+[UIKBInputDelegateManager isAsyncTextInputEnabled](UIKBInputDelegateManager, "isAsyncTextInputEnabled"))goto LABEL_7;
  if (!-[UIKBInputDelegateManager shouldRespectForwardingInputDelegate](self, "shouldRespectForwardingInputDelegate")
    || (WeakRetained = objc_loadWeakRetained((id *)&self->_forwardingInputDelegate),
        WeakRetained,
        !WeakRetained))
  {
    if ((self->m_delegateConformanceType & 0x800) != 0)
    {
      v4 = self->_keyInputDelegate;
      return v4;
    }
    goto LABEL_7;
  }
  if (!self->_forwardingInputDelegateConformsToBETextInput)
  {
LABEL_7:
    v4 = 0;
    return v4;
  }
  v4 = (UIKeyInput *)objc_loadWeakRetained((id *)&self->_forwardingInputDelegate);
  return v4;
}

- (UIAsyncTextInputClient)asyncInputDelegate
{
  id WeakRetained;
  UIKeyInput *v4;

  if (!+[UIKBInputDelegateManager isAsyncTextInputEnabled](UIKBInputDelegateManager, "isAsyncTextInputEnabled"))goto LABEL_7;
  if (!-[UIKBInputDelegateManager shouldRespectForwardingInputDelegate](self, "shouldRespectForwardingInputDelegate")
    || (WeakRetained = objc_loadWeakRetained((id *)&self->_forwardingInputDelegate),
        WeakRetained,
        !WeakRetained))
  {
    if ((self->m_delegateConformanceType & 0x400) != 0)
    {
      v4 = self->_keyInputDelegate;
      return v4;
    }
    goto LABEL_7;
  }
  if (!self->_forwardingInputDelegateConformsToAsyncTextInputClient)
  {
LABEL_7:
    v4 = 0;
    return v4;
  }
  v4 = (UIKeyInput *)objc_loadWeakRetained((id *)&self->_forwardingInputDelegate);
  return v4;
}

- (id)asyncWebKitInteractionDelegate
{
  id WeakRetained;
  UIKeyInput *v4;

  if (!-[UIKBInputDelegateManager shouldRespectForwardingInputDelegate](self, "shouldRespectForwardingInputDelegate")
    || (WeakRetained = objc_loadWeakRetained((id *)&self->_forwardingInputDelegate),
        WeakRetained,
        !WeakRetained))
  {
    if ((self->m_delegateConformanceType & 8) != 0)
    {
      v4 = self->_keyInputDelegate;
      return v4;
    }
    goto LABEL_6;
  }
  if (!self->_forwardingInputDelegateConformsToWKInteraction)
  {
LABEL_6:
    v4 = 0;
    return v4;
  }
  v4 = (UIKeyInput *)objc_loadWeakRetained((id *)&self->_forwardingInputDelegate);
  return v4;
}

- (void)_firstResponderDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "_isApplicationKeyWindow"))
  {
    self->m_firstResponderAdoptsTextInput = 0;
    objc_msgSend(v7, "userInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", CFSTR("UIWindowFirstResponderUserInfoKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0
      && objc_msgSend(v6, "conformsToProtocol:", &unk_1EDE22B80))
    {
      self->m_firstResponderAdoptsTextInput = 1;
    }

  }
}

- (UIView)automaticallySelectedOverlay
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;

  -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v6 = v4;
    objc_msgSend(v4, "unscaledView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  -[UIKBInputDelegateManager keyInputDelegate](self, "keyInputDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[UIKBInputDelegateManager keyInputDelegate](self, "keyInputDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "automaticallySelectedOverlay");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
LABEL_6:

  return (UIView *)v7;
}

- (UITextInputTraits)textInputTraits
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v3 = +[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI") ^ 1;
  -[UIKBInputDelegateManager privateInputDelegateRespectingForwardingDelegate:](self, "privateInputDelegateRespectingForwardingDelegate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "textInputTraits");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[UITextInputTraits traitsByAdoptingTraits:](UITextInputTraits, "traitsByAdoptingTraits:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v5, "conformsToProtocol:", &unk_1EDE222E8))
    {
      +[UITextInputTraits traitsByAdoptingTraits:](UITextInputTraits, "traitsByAdoptingTraits:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "overrideWithTraits:", v8);

    }
  }
  else
  {
    v7 = 0;
  }
  -[UIKBInputDelegateManager delegateRespectingForwardingDelegate:](self, "delegateRespectingForwardingDelegate:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    +[UITextInputTraits traitsByAdoptingTraits:](UITextInputTraits, "traitsByAdoptingTraits:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v7)
    {
      objc_msgSend(v7, "overrideWithTraits:", v10);

    }
    else
    {
      v7 = (void *)v10;
    }
  }

  return (UITextInputTraits *)v7;
}

- (id)privateInputDelegateRespectingForwardingDelegate:(BOOL)a3
{
  if ((self->m_delegateConformanceType & 4) == 0)
    return 0;
  -[UIKBInputDelegateManager delegateRespectingForwardingDelegate:](self, "delegateRespectingForwardingDelegate:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)delegateConformanceType
{
  return self->m_delegateConformanceType;
}

- (id)inputSystemSourceSession
{
  void *v3;
  unint64_t m_originalDelegateConformanceType;
  void *v5;
  void *v6;

  if ((self->m_delegateConformanceType & 0x80) != 0
    || (-[UIKBInputDelegateManager forwardingInputDelegate](self, "forwardingInputDelegate"),
        (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
    && (m_originalDelegateConformanceType = self->m_originalDelegateConformanceType,
        v3,
        (m_originalDelegateConformanceType & 0x80) != 0))
  {
    -[UIKBInputDelegateManager delegateRespectingForwardingDelegate:](self, "delegateRespectingForwardingDelegate:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_rtiSourceSession");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)setDelegate:(id)a3
{
  UITextInteractionSelectableInputDelegate *selectableDelegate;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  UITextInteractionSelectableInputDelegate *v10;
  UITextInteractionSelectableInputDelegate *v11;
  id v12;

  v12 = a3;
  selectableDelegate = self->_selectableDelegate;
  self->_selectableDelegate = 0;

  objc_storeStrong((id *)&self->_keyInputDelegate, a3);
  -[UIKBInputDelegateManager storeDelegateConformance](self, "storeDelegateConformance");
  -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "interactionAssistant");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "externalInteractions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[UITextInteractionSelectableInputDelegate selectableInputDelegateWithTextInput:](UITextInteractionSelectableInputDelegate, "selectableInputDelegateWithTextInput:", v9);
    v10 = (UITextInteractionSelectableInputDelegate *)objc_claimAutoreleasedReturnValue();
    v11 = self->_selectableDelegate;
    self->_selectableDelegate = v10;

  }
  -[UIKBInputDelegateManager setShouldRespectForwardingInputDelegate:](self, "setShouldRespectForwardingInputDelegate:", 0);

}

- (void)storeDelegateConformance
{
  void *v3;
  int v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  NSObject *v9;
  void *v10;
  int v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  void *v17;
  int v18;
  unint64_t m_delegateConformanceType;
  void *v20;
  char v21;
  void *v22;
  int v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  self->m_delegateConformanceType = 0;
  -[UIKBInputDelegateManager keyInputDelegate](self, "keyInputDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "conformsToProtocol:", &unk_1EDE22B80);

  if (v4)
    self->m_delegateConformanceType |= 2uLL;
  -[UIKBInputDelegateManager keyInputDelegate](self, "keyInputDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "conformsToProtocol:", &unk_1EDE24D00);

  if (v6)
    self->m_delegateConformanceType |= 4uLL;
  if (+[UIKBInputDelegateManager isAsyncTextInputEnabled](UIKBInputDelegateManager, "isAsyncTextInputEnabled"))
  {
    -[UIKBInputDelegateManager keyInputDelegate](self, "keyInputDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "conformsToProtocol:", &unk_1EE0CE228);

    if (v8)
    {
      self->m_delegateConformanceType |= 0x720uLL;
      _UIKeyboardImplLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        -[UIKBInputDelegateManager keyInputDelegate](self, "keyInputDelegate");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = 138412290;
        v32 = v29;
        _os_log_debug_impl(&dword_185066000, v9, OS_LOG_TYPE_DEBUG, "Delegate: %@, conforms to UIAsyncTextInputClient", (uint8_t *)&v31, 0xCu);

      }
    }
    -[UIKBInputDelegateManager keyInputDelegate](self, "keyInputDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "conformsToProtocol:", &unk_1EE0CE288);

    if (v11)
    {
      self->m_delegateConformanceType |= 0x920uLL;
      _UIKeyboardImplLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        -[UIKBInputDelegateManager keyInputDelegate](self, "keyInputDelegate");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = 138412290;
        v32 = v30;
        _os_log_debug_impl(&dword_185066000, v12, OS_LOG_TYPE_DEBUG, "Delegate: %@, conforms to BETextInput", (uint8_t *)&v31, 0xCu);

      }
    }
  }
  -[UIKBInputDelegateManager keyInputDelegate](self, "keyInputDelegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "conformsToProtocol:", &unk_1EE0CE648);

  if (v14)
    self->m_delegateConformanceType |= 8uLL;
  -[UIKBInputDelegateManager keyInputDelegate](self, "keyInputDelegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "conformsToProtocol:", &unk_1EDE22370);

  if (v16)
    self->m_delegateConformanceType |= 1uLL;
  -[UIKBInputDelegateManager keyInputDelegate](self, "keyInputDelegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "conformsToProtocol:", &unk_1EDE223E8);

  m_delegateConformanceType = self->m_delegateConformanceType;
  if (v18)
  {
    m_delegateConformanceType |= 0x10uLL;
    self->m_delegateConformanceType = m_delegateConformanceType;
  }
  if ((m_delegateConformanceType & 4) != 0)
  {
    -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_opt_respondsToSelector();

    if ((v21 & 1) != 0)
      self->m_delegateConformanceType |= 0x20uLL;
  }
  -[UIKBInputDelegateManager keyInputDelegate](self, "keyInputDelegate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "conformsToProtocol:", &unk_1EDE21770);

  if (v23)
    self->m_delegateConformanceType |= 0x40uLL;
  -[UIKBInputDelegateManager keyInputDelegate](self, "keyInputDelegate");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_opt_respondsToSelector();

  if ((v25 & 1) != 0)
    self->m_delegateConformanceType |= 0x80uLL;
  -[UIKBInputDelegateManager keyInputDelegate](self, "keyInputDelegate");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[UIKBInputDelegateManager keyInputDelegate](self, "keyInputDelegate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "requiresKeyEvents");

    if (v28)
      self->m_delegateConformanceType |= 0x100uLL;
  }
  else
  {

  }
}

- (void)setKeyboardStateDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_keyboardStateDelegate, a3);
}

- (UIKBInputDelegateManager)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIKBInputDelegateManager;
  return -[UIKBInputDelegateManager init](&v3, sel_init);
}

void __51__UIKBInputDelegateManager_isAsyncTextInputEnabled__block_invoke()
{
  void *v0;
  id v1;

  qword_1ECD7DC58 = _UIDeviceNativeUserInterfaceIdiomIgnoringClassic();
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "bundleIdentifier");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  _MergedGlobals_1049 = objc_msgSend(v0, "isEqualToString:", CFSTR("com.apple.iBooks"));

}

- (BOOL)hasText
{
  void *v2;
  char v3;

  -[UIKBInputDelegateManager keyInputDelegate](self, "keyInputDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasText");

  return v3;
}

- (id)markedTextRange
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
    else
      -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v6 = v4;
  objc_msgSend(v4, "markedTextRange");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (CGRect)caretRectForPosition:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
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
  CGRect result;

  v4 = a3;
  -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
    else
      -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v8 = v6;
  objc_msgSend(v6, "caretRectForPosition:", v4);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  v17 = v10;
  v18 = v12;
  v19 = v14;
  v20 = v16;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (id)selectedTextRange
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
    else
      -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v6 = v4;
  objc_msgSend(v4, "selectedTextRange");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)setBaseWritingDirection:(int64_t)a3 forRange:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
    else
      -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9 = v7;
  objc_msgSend(v7, "setBaseWritingDirection:forRange:", a3, v10);

}

- (void)changedSelection
{
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  id v8;

  -[UIKBInputDelegateManager legacyInputDelegate](self, "legacyInputDelegate");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[UIKBInputDelegateManager legacyInputDelegate](self, "legacyInputDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      -[UIKBInputDelegateManager legacyInputDelegate](self, "legacyInputDelegate");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      -[UIKBInputDelegateManager legacyInputDelegate](self, "legacyInputDelegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "keyboardInputChangedSelection:", v7);

    }
  }
}

- (UIKeyboardInput)legacyInputDelegate
{
  if ((self->m_delegateConformanceType & 0x40) == 0)
    return (UIKeyboardInput *)0;
  -[UIKBInputDelegateManager keyInputDelegate](self, "keyInputDelegate");
  return (UIKeyboardInput *)(id)objc_claimAutoreleasedReturnValue();
}

- (unsigned)_characterBeforeCaretSelection
{
  void *v2;
  unsigned int v3;

  -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_characterBeforeCaretSelection");

  return v3;
}

- (UITextSelectionDisplayInteraction)selectionDisplayInteraction
{
  void *v2;
  void *v3;
  void *v4;

  -[UIKBInputDelegateManager delegateAsResponder](self, "delegateAsResponder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_responderForEditing");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_selectionDisplayInteraction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UITextSelectionDisplayInteraction *)v4;
}

- (void)setupResponderChangeListeners
{
  id v3;

  -[UIKBInputDelegateManager updateSelectableInputDelegateIfNecessary](self, "updateSelectableInputDelegateIfNecessary");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__firstResponderDidChange_, CFSTR("UIWindowFirstResponderDidChangeNotification"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_updateSelectableInputDelegateIfNecessary, CFSTR("_UIWindowDidBecomeApplicationKeyNotification"), 0);

}

- (BOOL)shouldSuppressUpdateCandidateView
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      -[UIKBInputDelegateManager asyncWebKitInteractionDelegate](self, "asyncWebKitInteractionDelegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[UIKBInputDelegateManager asyncWebKitInteractionDelegate](self, "asyncWebKitInteractionDelegate");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_7;
      }
LABEL_10:
      v9 = 0;
      goto LABEL_11;
    }
    -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v4;
  if ((objc_opt_respondsToSelector() & 1) == 0)
    goto LABEL_10;
  -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
  v8 = v7;
  v9 = objc_msgSend(v7, "shouldSuppressUpdateCandidateView");

LABEL_11:
  return v9;
}

- (void)clearDelegate
{
  UIKeyInput *keyInputDelegate;
  void *v4;
  void *v5;

  -[UIKBInputDelegateManager setSelectableDelegate:](self, "setSelectableDelegate:", 0);
  keyInputDelegate = self->_keyInputDelegate;
  self->_keyInputDelegate = 0;

  self->m_originalDelegateConformanceType = 0;
  -[UIKBInputDelegateManager forwardingInputDelegate](self, "forwardingInputDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[UIKBInputDelegateManager forwardingInputDelegate](self, "forwardingInputDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "resignFirstResponder");

    -[UIKBInputDelegateManager setForwardingInputDelegate:](self, "setForwardingInputDelegate:", 0);
  }
}

- (void)setForwardingInputDelegate:(id)a3
{
  UIKeyInput **p_forwardingInputDelegate;
  id v5;
  char v6;
  id WeakRetained;
  id v8;
  void *v9;
  id v10;

  p_forwardingInputDelegate = &self->_forwardingInputDelegate;
  v10 = a3;
  v5 = objc_storeWeak((id *)p_forwardingInputDelegate, v10);
  v6 = objc_msgSend(v10, "conformsToProtocol:", &unk_1EE0CE648);

  self->_forwardingInputDelegateConformsToWKInteraction = v6;
  if (+[UIKBInputDelegateManager isAsyncTextInputEnabled](UIKBInputDelegateManager, "isAsyncTextInputEnabled"))
  {
    WeakRetained = objc_loadWeakRetained((id *)p_forwardingInputDelegate);
    self->_forwardingInputDelegateConformsToAsyncTextInputClient = objc_msgSend(WeakRetained, "conformsToProtocol:", &unk_1EE0CE228);

    v8 = objc_loadWeakRetained((id *)p_forwardingInputDelegate);
    self->_forwardingInputDelegateConformsToBETextInput = objc_msgSend(v8, "conformsToProtocol:", &unk_1EE0CE288);

  }
  -[UIKBInputDelegateManager setShouldRespectForwardingInputDelegate:](self, "setShouldRespectForwardingInputDelegate:", v10 != 0);
  self->m_originalDelegateConformanceType = self->m_delegateConformanceType;
  -[UIKBInputDelegateManager storeDelegateConformance](self, "storeDelegateConformance");
  -[UIKBInputDelegateManager keyboardStateDelegate](self, "keyboardStateDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "didChangeForwardingInputDelegate:", v10);

  -[UIKBInputDelegateManager updateRespectForwardingInputDelegateFlagInDestination](self, "updateRespectForwardingInputDelegateFlagInDestination");
}

- (void)updateRespectForwardingInputDelegateFlagInDestination
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (+[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess"))
  {
    -[UIKBInputDelegateManager inputSystemSourceSession](self, "inputSystemSourceSession");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v6 = v3;
      objc_msgSend(v3, "textOperations");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setCustomInfoType:", 0x1E17501E0);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[UIKBInputDelegateManager shouldRespectForwardingInputDelegate](self, "shouldRespectForwardingInputDelegate"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setCustomInfo:", v5);

      objc_msgSend(v6, "flushOperations");
      v3 = v6;
    }

  }
}

- (BOOL)delegateAdoptsWebTextInputPrivate
{
  return (LOBYTE(self->m_delegateConformanceType) >> 5) & 1;
}

- (CGRect)selectionClipRect
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  double v9;
  double v10;
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
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGRect result;

  -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v8 = v5;
    objc_msgSend(v5, "selectionClipRect");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;
    goto LABEL_6;
  }
  -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  -[UIKBInputDelegateManager keyInputDelegate](self, "keyInputDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[UIKBInputDelegateManager keyInputDelegate](self, "keyInputDelegate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "_selectionClipRect");
    v10 = v22;
    v12 = v23;
    v14 = v24;
    v16 = v25;

  }
  else
  {
    v10 = *MEMORY[0x1E0C9D628];
    v12 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v14 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v16 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }
LABEL_6:

  v17 = v10;
  v18 = v12;
  v19 = v14;
  v20 = v16;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (id)privateKeyInputDelegate
{
  if ((self->m_delegateConformanceType & 0x10) == 0)
    return 0;
  -[UIKBInputDelegateManager keyInputDelegate](self, "keyInputDelegate");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (UITextInteractionSelectableInputDelegate)selectableDelegate
{
  uint64_t v3;
  void *v4;
  UITextInteractionSelectableInputDelegate *selectableDelegate;
  void *v6;
  UITextInteractionSelectableInputDelegate *v7;
  void *v8;
  void *v9;
  UITextInteractionSelectableInputDelegate *v10;
  UITextInteractionSelectableInputDelegate *v11;
  UITextInteractionSelectableInputDelegate *v12;
  UITextInteractionSelectableInputDelegate *v13;

  -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    selectableDelegate = self->_selectableDelegate;
    if (!selectableDelegate)
      goto LABEL_5;
    -[UITextInteractionSelectableInputDelegate textInput](selectableDelegate, "textInput");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = self->_selectableDelegate;
    if (v6 == v4)
    {
LABEL_7:
      v12 = v7;
LABEL_11:
      v13 = v12;

      v4 = v13;
      return (UITextInteractionSelectableInputDelegate *)v4;
    }
    if (!v7)
    {
LABEL_5:
      objc_msgSend(v4, "interactionAssistant");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "externalInteractions");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        +[UITextInteractionSelectableInputDelegate selectableInputDelegateWithTextInput:](UITextInteractionSelectableInputDelegate, "selectableInputDelegateWithTextInput:", v4);
        v10 = (UITextInteractionSelectableInputDelegate *)objc_claimAutoreleasedReturnValue();
        v11 = self->_selectableDelegate;
        self->_selectableDelegate = v10;

        v7 = self->_selectableDelegate;
        goto LABEL_7;
      }
    }
  }
  else
  {
    if (!self->m_firstResponderAdoptsTextInput)
    {
      v4 = 0;
      return (UITextInteractionSelectableInputDelegate *)v4;
    }
    -[UIKBInputDelegateManager delegateAsResponder](self, "delegateAsResponder");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      +[UITextInteractionSelectableInputDelegate selectableInputDelegateWithTextInput:](UITextInteractionSelectableInputDelegate, "selectableInputDelegateWithTextInput:", v4);
      v12 = (UITextInteractionSelectableInputDelegate *)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
  }
  return (UITextInteractionSelectableInputDelegate *)v4;
}

- (BOOL)canHandleInputDelegateCommandAction:(unint64_t)a3
{
  const char *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;
  char v10;
  void *v12;

  v4 = -[UIKBInputDelegateManager selectorForCommand:](self, "selectorForCommand:", a3);
  -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
      v6 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[UIKBInputDelegateManager asyncWebKitInteractionDelegate](self, "asyncWebKitInteractionDelegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        -[UIKBInputDelegateManager asyncWebKitInteractionDelegate](self, "asyncWebKitInteractionDelegate");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "canPerformAction:withSender:", v4, 0);
        goto LABEL_6;
      }
      -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
      v6 = objc_claimAutoreleasedReturnValue();
    }
  }
  v8 = (void *)v6;
  v9 = objc_opt_respondsToSelector();
LABEL_6:
  v10 = v9;

  return v10 & 1;
}

- (SEL)selectorForCommand:(unint64_t)a3
{
  void *v5;
  _BOOL4 v6;
  void *v7;
  SEL result;
  char **v9;
  char **v10;

  -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = 1;
  }
  else
  {
    -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v7 != 0;

  }
  switch(a3)
  {
    case 0uLL:
      v9 = &selRef_transposeCharacters;
      v10 = &selRef__transpose;
      goto LABEL_12;
    case 1uLL:
      v9 = &selRef_deleteInDirection_toGranularity_;
      v10 = &selRef__deleteForwardAndNotify_;
      goto LABEL_12;
    case 2uLL:
      v9 = &selRef_deleteInDirection_toGranularity_;
      v10 = &selRef__deleteByWord;
      goto LABEL_12;
    case 3uLL:
      v9 = &selRef_deleteInDirection_toGranularity_;
      v10 = &selRef__deleteForwardByWord;
      goto LABEL_12;
    case 4uLL:
      v9 = &selRef_deleteInDirection_toGranularity_;
      v10 = &selRef__deleteToStartOfLine;
      goto LABEL_12;
    case 5uLL:
      v9 = &selRef_deleteInDirection_toGranularity_;
      v10 = &selRef__deleteToEndOfLine;
      goto LABEL_12;
    case 6uLL:
      v9 = &selRef_deleteInDirection_toGranularity_;
      v10 = &selRef__deleteToEndOfParagraph;
LABEL_12:
      if (!v6)
        v9 = v10;
      result = *v9;
      break;
    default:
      return result;
  }
  return result;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char *v12;
  char v13;

  v6 = a4;
  -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {

  }
  else
  {
    -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      -[UIKBInputDelegateManager delegateAsResponder](self, "delegateAsResponder");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v9, "canPerformAction:withSender:", a3, v6);
      goto LABEL_13;
    }
  }
  if (sel_isEqual(a3, sel__moveUp_withHistory_)
    || sel_isEqual(a3, sel__moveDown_withHistory_)
    || sel_isEqual(a3, sel__moveLeft_withHistory_)
    || sel_isEqual(a3, sel__moveRight_withHistory_))
  {
    -[UIKBInputDelegateManager delegateAsResponder](self, "delegateAsResponder");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v9, "canPerformAction:withSender:", sel_moveInLayoutDirection_, v6))
    {
      v13 = 0;
      goto LABEL_13;
    }
    -[UIKBInputDelegateManager delegateAsResponder](self, "delegateAsResponder");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v12 = sel_extendInLayoutDirection_;
  }
  else
  {
    if (!sel_isEqual(a3, sel__moveToStartOfWord_withHistory_)
      && !sel_isEqual(a3, sel__moveToStartOfLine_withHistory_)
      && !sel_isEqual(a3, sel__moveToStartOfParagraph_withHistory_)
      && !sel_isEqual(a3, sel__moveToStartOfDocument_withHistory_)
      && !sel_isEqual(a3, sel__moveToEndOfWord_withHistory_)
      && !sel_isEqual(a3, sel__moveToEndOfParagraph_withHistory_)
      && !sel_isEqual(a3, sel__moveToEndOfLine_withHistory_)
      && !sel_isEqual(a3, sel__moveToEndOfDocument_withHistory_))
    {
      v13 = 0;
      goto LABEL_14;
    }
    -[UIKBInputDelegateManager delegateAsResponder](self, "delegateAsResponder");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "canPerformAction:withSender:", sel_moveInDirection_byGranularity_, v6) & 1) != 0)
    {
      v13 = 1;
      goto LABEL_13;
    }
    -[UIKBInputDelegateManager delegateAsResponder](self, "delegateAsResponder");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v12 = sel_extendInDirection_byGranularity_;
  }
  v13 = objc_msgSend(v10, "canPerformAction:withSender:", v12, v6);

LABEL_13:
LABEL_14:

  return v13;
}

- (BOOL)delegateRespondsToSelector:(SEL)a3
{
  void *v3;
  char v4;

  -[UIKBInputDelegateManager keyInputDelegate](self, "keyInputDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  return v4 & 1;
}

- (BOOL)continuousSpellCheckingEnabled
{
  void *v3;
  char v4;
  void *v5;
  char v6;

  -[UIKBInputDelegateManager keyInputDelegate](self, "keyInputDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0)
    return 0;
  -[UIKBInputDelegateManager keyInputDelegate](self, "keyInputDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "continuousSpellCheckingEnabled");

  return v6;
}

- (void)insertText:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint8_t v7[16];

  v4 = a3;
  if (os_variant_has_internal_diagnostics())
  {
    _UIKeyboardExtendedLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_DEFAULT, "inserting text", v7, 2u);
    }

  }
  -[UIKBInputDelegateManager privateInputDelegate](self, "privateInputDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBInputDelegateManager insertText:updateInputSource:](self, "insertText:updateInputSource:", v4, objc_msgSend(v5, "_textInputSource") != 3);

}

- (void)deleteBackward
{
  -[UIKBInputDelegateManager _deleteBackwardAndNotify:reinsertText:](self, "_deleteBackwardAndNotify:reinsertText:", 1, 0);
}

- (void)insertText:(id)a3 alternatives:(id)a4 style:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  unsigned __int8 v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  objc_class *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  _QWORD v25[6];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;

  v8 = a3;
  v9 = a4;
  if (os_variant_has_internal_diagnostics())
  {
    _UIKeyboardExtendedLog();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v25[0]) = 0;
      _os_log_impl(&dword_185066000, v24, OS_LOG_TYPE_DEFAULT, "inserting text", (uint8_t *)v25, 2u);
    }

  }
  -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_respondsToSelector();

  -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_opt_respondsToSelector();

  -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_opt_respondsToSelector();

  if (((v11 | v13) & 1) != 0 || (v15 & 1) != 0)
  {
    -[UIKBInputDelegateManager setInsideKeyInputDelegateCall:](self, "setInsideKeyInputDelegateCall:", 1);
    if (((v11 | v13) & 1) != 0)
    {
      v17 = (void *)objc_msgSend(objc_alloc((Class)off_1E1679D20), "initWithPrimaryString:alternativeStrings:isLowConfidence:", v8, v9, a5 == 1);
      v26 = 0;
      v27 = &v26;
      v28 = 0x2050000000;
      v18 = (void *)getBETextAlternativesClass_softClass;
      v29 = getBETextAlternativesClass_softClass;
      if (!getBETextAlternativesClass_softClass)
      {
        v25[0] = MEMORY[0x1E0C809B0];
        v25[1] = 3221225472;
        v25[2] = __getBETextAlternativesClass_block_invoke;
        v25[3] = &unk_1E16B14C0;
        v25[4] = &v26;
        __getBETextAlternativesClass_block_invoke((uint64_t)v25);
        v18 = (void *)v27[3];
      }
      v19 = objc_retainAutorelease(v18);
      _Block_object_dispose(&v26, 8);
      v20 = (void *)objc_msgSend([v19 alloc], "_initWithNSTextAlternatives:", v17);
      -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v21;
      if ((v13 & 1) != 0)
      {
        objc_msgSend(v21, "insertTextAlternatives:", v20);
      }
      else if ((v11 & 1) != 0)
      {
        objc_msgSend(v21, "insertText:textAlternatives:style:", v8, v20, a5);
      }

    }
    else
    {
      -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "insertText:alternatives:style:", v8, v9, a5);
    }

    -[UIKBInputDelegateManager keyboardStateDelegate](self, "keyboardStateDelegate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "updateTextInputKeyboardSource");

    -[UIKBInputDelegateManager setInsideKeyInputDelegateCall:](self, "setInsideKeyInputDelegateCall:", 0);
    -[UIKBInputDelegateManager keyboardStateDelegate](self, "keyboardStateDelegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "updateKeyboardStateForInsertion:", v8);
  }
  else
  {
    objc_msgSend(off_1E1679D20, "attributedText:withAlternativeTexts:style:", v8, v9, a5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBInputDelegateManager insertAttributedText:](self, "insertAttributedText:", v16);
  }

}

- (id)textInRange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
    else
      -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v8 = v6;
  objc_msgSend(v6, "textInRange:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)replaceRange:(id)a3 withText:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "replaceRange:withText:", v7, v6);

}

- (void)correctedTypedText:(id)a3 rangeOfReplacement:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "correctedTypedText:rangeOfReplacement:", v10, v6);

  }
}

- (void)replaceRange:(id)a3 oldText:(id)a4 withText:(id)a5 forReplaceAction:(int)a6
{
  id v10;
  id v11;
  id v12;
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
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  char v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  char v51;
  void *v52;
  void *v53;
  void *v54;
  NSObject *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  uint8_t buf[16];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (os_variant_has_internal_diagnostics())
  {
    _UIKeyboardExtendedLog();
    v55 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_185066000, v55, OS_LOG_TYPE_DEFAULT, "replacing text", buf, 2u);
    }

  }
  switch(a6)
  {
    case 0:
      -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13
        || (-[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate"),
            (v13 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {

LABEL_6:
        -[UIKBInputDelegateManager selectableDelegate](self, "selectableDelegate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "replaceRange:withText:", v10, v12);
        goto LABEL_35;
      }
      -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_opt_respondsToSelector();

      if ((v34 & 1) == 0)
        goto LABEL_6;
      -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "replaceRangeWithTextWithoutClosingTyping:replacementText:", v10, v12);
      goto LABEL_35;
    case 1:
      -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "selectedText");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v17, "length"))
        {
          -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "replaceSelectedText:withText:", v17, v12);
LABEL_28:

LABEL_30:
          goto LABEL_36;
        }
LABEL_29:
        -[UIKBInputDelegateManager insertText:](self, "insertText:", v12);
        goto LABEL_30;
      }
      -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (v29)
      {
        -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "selectedText");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (!objc_msgSend(v17, "length"))
          goto LABEL_29;
        -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_27:
        v18 = v31;
        objc_msgSend(v31, "replaceText:withText:", v17, v12);
        goto LABEL_28;
      }
      -[UIKBInputDelegateManager asyncWebKitInteractionDelegate](self, "asyncWebKitInteractionDelegate");
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      if (v35)
      {
        -[UIKBInputDelegateManager asyncWebKitInteractionDelegate](self, "asyncWebKitInteractionDelegate");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "selectedText");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (!objc_msgSend(v17, "length"))
          goto LABEL_29;
        -[UIKBInputDelegateManager asyncWebKitInteractionDelegate](self, "asyncWebKitInteractionDelegate");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_27;
      }
      -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "selectedTextRange");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        if (!objc_msgSend(v17, "isEmpty"))
          goto LABEL_40;
        -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "end");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "_rangeOfEnclosingWord:", v40);
        v41 = objc_claimAutoreleasedReturnValue();

        v17 = (void *)v41;
        if (v41)
        {
LABEL_40:
          -[UIKBInputDelegateManager keyboardStateDelegate](self, "keyboardStateDelegate");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "setShouldIgnoreTextInputChanges:", 1);

          -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "textInRange:", v17);
          v44 = (void *)objc_claimAutoreleasedReturnValue();

          -[UIKBInputDelegateManager selectableDelegate](self, "selectableDelegate");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "replaceRange:withText:", v17, v12);

          -[UIKBInputDelegateManager keyboardStateDelegate](self, "keyboardStateDelegate");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIKBInputDelegateManager keyboardStateDelegate](self, "keyboardStateDelegate");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "keyboardState");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "documentState");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "documentStateAfterReplacingText:withText:", v44, v12);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          if (v49)
          {
            objc_msgSend(v59, "setDocumentState:", v49);
          }
          else
          {
            v57 = (void *)MEMORY[0x1E0DBDB78];
            -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "documentStateOfDocument:", v56);
            v58 = v44;
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v59, "setDocumentState:", v53);

            v44 = v58;
          }

          -[UIKBInputDelegateManager keyboardStateDelegate](self, "keyboardStateDelegate");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "setShouldIgnoreTextInputChanges:", 0);

          goto LABEL_30;
        }
      }
      goto LABEL_44;
    case 2:
      -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "beginningOfDocument");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "endOfDocument");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "textRangeFromPosition:toPosition:", v21, v23);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "textInRange:", v17);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "length");

      if (!-[UIKBInputDelegateManager callShouldReplaceExtendedRange:withText:includeMarkedText:](self, "callShouldReplaceExtendedRange:withText:includeMarkedText:", v26, v12, 1))goto LABEL_30;
      -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "replaceRange:withText:", v17, v12);
      goto LABEL_28;
    case 3:
      if (!v12)
        goto LABEL_36;
      -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (v27)
      {
        if (!objc_msgSend(v11, "length"))
          goto LABEL_44;
        -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_34:
        v14 = v28;
        objc_msgSend(v28, "replaceDictatedText:withText:", v11, v12);
        goto LABEL_35;
      }
      -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      if (v32)
      {
        if (!objc_msgSend(v11, "length"))
          goto LABEL_44;
        -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_34;
      }
      -[UIKBInputDelegateManager asyncWebKitInteractionDelegate](self, "asyncWebKitInteractionDelegate");
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      if (v37)
      {
        if (!objc_msgSend(v11, "length"))
          goto LABEL_44;
        -[UIKBInputDelegateManager asyncWebKitInteractionDelegate](self, "asyncWebKitInteractionDelegate");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_34;
      }
      if (v10 && (objc_msgSend(v10, "isEmpty") & 1) == 0)
      {
        -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = objc_opt_respondsToSelector();

        if ((v51 & 1) != 0)
        {
          -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "replaceRangeWithTextWithoutClosingTyping:replacementText:", v10, v12);
        }
        else
        {
          -[UIKBInputDelegateManager selectableDelegate](self, "selectableDelegate");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "replaceRange:withText:", v10, v12);
        }

        -[UIKBInputDelegateManager keyboardStateDelegate](self, "keyboardStateDelegate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "updateKeyboardStateForReplacingText:withText:", v11, v12);
LABEL_35:

      }
      else
      {
LABEL_44:
        -[UIKBInputDelegateManager insertText:](self, "insertText:", v12);
      }
LABEL_36:

      return;
    default:
      goto LABEL_36;
  }
}

- (void)replaceRange:(id)a3 oldText:(id)a4 withAttributedText:(id)a5 forReplaceAction:(int)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  NSObject *v18;
  uint8_t v19[16];

  v9 = a3;
  v10 = a5;
  if (os_variant_has_internal_diagnostics())
  {
    _UIKeyboardExtendedLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_185066000, v18, OS_LOG_TYPE_DEFAULT, "replacing text", v19, 2u);
    }

    if (a6)
      goto LABEL_9;
  }
  else if (a6)
  {
    goto LABEL_9;
  }
  -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11
    || (-[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate"),
        (v11 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {

  }
  else
  {
    -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_opt_respondsToSelector();

    if ((v17 & 1) != 0)
    {
      -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
  }
  -[UIKBInputDelegateManager selectableDelegate](self, "selectableDelegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_opt_respondsToSelector();

  if ((v13 & 1) != 0)
  {
    -[UIKBInputDelegateManager selectableDelegate](self, "selectableDelegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
    v15 = v14;
    objc_msgSend(v14, "replaceRange:withAttributedText:", v9, v10);

  }
LABEL_9:

}

- (void)replaceSelectionOffset:(int64_t)a3 length:(unint64_t)a4 withAnnotatedString:(id)a5 relativeReplacementRange:(_NSRange)a6
{
  NSUInteger length;
  NSUInteger location;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  length = a6.length;
  location = a6.location;
  v17 = a5;
  -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = v17;
  if (!v11)
  {
    -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:
      v16 = v14;
      objc_msgSend(v14, "replaceSelectionOffset:length:withAnnotatedString:relativeReplacementRange:", a3, a4, v17, location, length);

      v12 = v17;
      goto LABEL_7;
    }
    -[UIKBInputDelegateManager asyncWebKitInteractionDelegate](self, "asyncWebKitInteractionDelegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = v17;
    if (v15)
    {
      -[UIKBInputDelegateManager asyncWebKitInteractionDelegate](self, "asyncWebKitInteractionDelegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
  }
LABEL_7:

}

- (void)transposeCharacters
{
  void *v3;
  void *v4;
  id v5;

  -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "transposeCharactersAroundSelection");
  }
  else
  {
    -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "transposeCharacters");
    }
    else
    {
      -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_transpose");
    }
  }

}

- (id)selectedText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
    v7 = v4;
    objc_msgSend(v4, "selectedText");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    return v6;
  }
  -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  -[UIKBInputDelegateManager asyncWebKitInteractionDelegate](self, "asyncWebKitInteractionDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[UIKBInputDelegateManager asyncWebKitInteractionDelegate](self, "asyncWebKitInteractionDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  return v6;
}

- (void)setSelectedTextRange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
    else
      -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v7 = v5;
  objc_msgSend(v5, "setSelectedTextRange:", v8);

}

- (void)setAttributedMarkedText:(id)a3 selectedRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  length = a4.length;
  location = a4.location;
  v11 = a3;
  -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
    else
      -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10 = v8;
  objc_msgSend(v8, "_setAttributedMarkedText:selectedRange:", v11, location, length);

}

- (id)selectionRectsForRange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
    else
      -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v8 = v6;
  objc_msgSend(v6, "selectionRectsForRange:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)hasMarkedText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
    v7 = v4;
    v8 = objc_msgSend(v4, "hasMarkedText");

    return v8;
  }
  -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  -[UIKBInputDelegateManager asyncWebKitInteractionDelegate](self, "asyncWebKitInteractionDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[UIKBInputDelegateManager asyncWebKitInteractionDelegate](self, "asyncWebKitInteractionDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  return 0;
}

- (void)unmarkText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[UIKBInputDelegateManager selectableDelegate](self, "selectableDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_unmarkText");

  -[UIKBInputDelegateManager keyboardStateDelegate](self, "keyboardStateDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBInputDelegateManager keyboardStateDelegate](self, "keyboardStateDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "keyboardState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "documentState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "documentStateAfterUnmarkingText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDocumentState:", v8);

  -[UIKBInputDelegateManager keyboardStateDelegate](self, "keyboardStateDelegate");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "clearInputForMarkedText");

}

- (id)attributedMarkedText
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v15;
  char v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;

  -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
    v11 = v6;
    if ((v5 & 1) != 0)
    {
      objc_msgSend(v6, "attributedMarkedText");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
    objc_msgSend(v6, "markedText");
    v13 = objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v13);
      v11 = (void *)v13;
      goto LABEL_13;
    }
    v11 = 0;
LABEL_12:
    v12 = 0;
    goto LABEL_13;
  }
  -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  -[UIKBInputDelegateManager asyncWebKitInteractionDelegate](self, "asyncWebKitInteractionDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[UIKBInputDelegateManager asyncWebKitInteractionDelegate](self, "asyncWebKitInteractionDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    -[UIKBInputDelegateManager asyncWebKitInteractionDelegate](self, "asyncWebKitInteractionDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_opt_respondsToSelector();

  -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "markedTextRange");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  if ((v16 & 1) != 0)
  {
    if (v17)
    {
      -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "markedTextRange");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "attributedTextInRange:", v21);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v12 = 0;
    }

    goto LABEL_13;
  }
  if (!v17)
    goto LABEL_12;
  -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "markedTextRange");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "textInRange:", v24);
  v25 = objc_claimAutoreleasedReturnValue();

  if (!v25)
  {
    v12 = 0;
    return v12;
  }
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v25);
  v11 = (void *)v25;
LABEL_13:

  return v12;
}

- (id)tintColor
{
  void *v2;
  void *v3;
  void *v4;

  -[UIKBInputDelegateManager delegateAsResponder](self, "delegateAsResponder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "tintColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v2, "_responderForEditing");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
      goto LABEL_9;
    do
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      objc_msgSend(v4, "nextResponder");
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      v4 = v3;
    }
    while (v3);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "tintColor");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
LABEL_9:
      v3 = 0;
    }

  }
  return v3;
}

- (id)_textSelectingContainer
{
  void *v3;
  void *v4;

  if (-[UIKBInputDelegateManager hasAsyncCapableInputDelegate](self, "hasAsyncCapableInputDelegate"))
  {
    -[UIKBInputDelegateManager asyncCapableInputDelegate](self, "asyncCapableInputDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_textSelectingContainer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (id)positionFromPosition:(id)a3 offset:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "positionFromPosition:offset:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)textRangeFromPosition:(id)a3 toPosition:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "textRangeFromPosition:toPosition:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (int64_t)baseWritingDirectionForPosition:(id)a3 inDirection:(int64_t)a4
{
  id v6;
  void *v7;
  int64_t v8;

  v6 = a3;
  -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "baseWritingDirectionForPosition:inDirection:", v6, a4);

  return v8;
}

- (int64_t)offsetFromPosition:(id)a3 toPosition:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int64_t v12;

  v6 = a3;
  v7 = a4;
  -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
    else
      -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11 = v9;
  v12 = objc_msgSend(v9, "offsetFromPosition:toPosition:", v6, v7);

  return v12;
}

- (id)_moveUp:(BOOL)a3 withHistory:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  v6 = a4;
  -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      -[UIKBInputDelegateManager selectableDelegate](self, "selectableDelegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_moveUp:withHistory:", v4, v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
    -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10 = v8;
  if (v4)
    objc_msgSend(v8, "extendInLayoutDirection:", 4);
  else
    objc_msgSend(v8, "moveInLayoutDirection:", 4);
  v11 = 0;
LABEL_9:

  return v11;
}

- (id)_moveDown:(BOOL)a3 withHistory:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  v6 = a4;
  -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      -[UIKBInputDelegateManager selectableDelegate](self, "selectableDelegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_moveDown:withHistory:", v4, v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
    -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10 = v8;
  if (v4)
    objc_msgSend(v8, "extendInLayoutDirection:", 5);
  else
    objc_msgSend(v8, "moveInLayoutDirection:", 5);
  v11 = 0;
LABEL_9:

  return v11;
}

- (id)_moveLeft:(BOOL)a3 withHistory:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  v6 = a4;
  -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      -[UIKBInputDelegateManager selectableDelegate](self, "selectableDelegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_moveLeft:withHistory:", v4, v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
    -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10 = v8;
  if (v4)
    objc_msgSend(v8, "extendInLayoutDirection:", 3);
  else
    objc_msgSend(v8, "moveInLayoutDirection:", 3);
  v11 = 0;
LABEL_9:

  return v11;
}

- (id)_moveRight:(BOOL)a3 withHistory:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  v6 = a4;
  -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      -[UIKBInputDelegateManager selectableDelegate](self, "selectableDelegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_moveRight:withHistory:", v4, v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
    -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10 = v8;
  if (v4)
    objc_msgSend(v8, "extendInLayoutDirection:", 2);
  else
    objc_msgSend(v8, "moveInLayoutDirection:", 2);
  v11 = 0;
LABEL_9:

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
  void *v12;

  v4 = a3;
  v6 = a4;
  -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v4)
      objc_msgSend(v8, "extendInStorageDirection:byGranularity:", 1, 1);
    else
      objc_msgSend(v8, "moveInStorageDirection:byGranularity:", 1, 1);
LABEL_10:
    v12 = 0;
    goto LABEL_11;
  }
  -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v11;
    if (v4)
      objc_msgSend(v11, "extendInDirection:byGranularity:", 1, 1);
    else
      objc_msgSend(v11, "moveInDirection:byGranularity:", 1, 1);
    goto LABEL_10;
  }
  -[UIKBInputDelegateManager selectableDelegate](self, "selectableDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_moveToStartOfWord:withHistory:", v4, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

  return v12;
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
  void *v12;

  v4 = a3;
  v6 = a4;
  -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v4)
      objc_msgSend(v8, "extendInStorageDirection:byGranularity:", 1, 3);
    else
      objc_msgSend(v8, "moveInStorageDirection:byGranularity:", 1, 3);
LABEL_10:
    v12 = 0;
    goto LABEL_11;
  }
  -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v11;
    if (v4)
      objc_msgSend(v11, "extendInDirection:byGranularity:", 1, 3);
    else
      objc_msgSend(v11, "moveInDirection:byGranularity:", 1, 3);
    goto LABEL_10;
  }
  -[UIKBInputDelegateManager selectableDelegate](self, "selectableDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_moveToStartOfParagraph:withHistory:", v4, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

  return v12;
}

- (id)_moveToStartOfLine:(BOOL)a3 withHistory:(id)a4
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
  -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v4)
      objc_msgSend(v8, "extendInStorageDirection:byGranularity:", 1, 4);
    else
      objc_msgSend(v8, "moveInStorageDirection:byGranularity:", 1, 4);
LABEL_10:
    v12 = 0;
    goto LABEL_11;
  }
  -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v11;
    if (v4)
      objc_msgSend(v11, "extendInDirection:byGranularity:", 1, 4);
    else
      objc_msgSend(v11, "moveInDirection:byGranularity:", 1, 4);
    goto LABEL_10;
  }
  -[UIKBInputDelegateManager selectableDelegate](self, "selectableDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_moveToStartOfLine:withHistory:", v4, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

  return v12;
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
  -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v4)
      objc_msgSend(v8, "extendInStorageDirection:byGranularity:", 1, 5);
    else
      objc_msgSend(v8, "moveInStorageDirection:byGranularity:", 1, 5);
LABEL_10:
    v12 = 0;
    goto LABEL_11;
  }
  -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v11;
    if (v4)
      objc_msgSend(v11, "extendInDirection:byGranularity:", 1, 5);
    else
      objc_msgSend(v11, "moveInDirection:byGranularity:", 1, 5);
    goto LABEL_10;
  }
  -[UIKBInputDelegateManager selectableDelegate](self, "selectableDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_moveToStartOfDocument:withHistory:", v4, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

  return v12;
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
  void *v12;

  v4 = a3;
  v6 = a4;
  -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v4)
      objc_msgSend(v8, "extendInStorageDirection:byGranularity:", 0, 1);
    else
      objc_msgSend(v8, "moveInStorageDirection:byGranularity:", 0, 1);
LABEL_10:
    v12 = 0;
    goto LABEL_11;
  }
  -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v11;
    if (v4)
      objc_msgSend(v11, "extendInDirection:byGranularity:", 0, 1);
    else
      objc_msgSend(v11, "moveInDirection:byGranularity:", 0, 1);
    goto LABEL_10;
  }
  -[UIKBInputDelegateManager selectableDelegate](self, "selectableDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_moveToEndOfWord:withHistory:", v4, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

  return v12;
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
  void *v12;

  v4 = a3;
  v6 = a4;
  -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v4)
      objc_msgSend(v8, "extendInStorageDirection:byGranularity:", 0, 3);
    else
      objc_msgSend(v8, "moveInStorageDirection:byGranularity:", 0, 3);
LABEL_10:
    v12 = 0;
    goto LABEL_11;
  }
  -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v11;
    if (v4)
      objc_msgSend(v11, "extendInDirection:byGranularity:", 0, 3);
    else
      objc_msgSend(v11, "moveInDirection:byGranularity:", 0, 3);
    goto LABEL_10;
  }
  -[UIKBInputDelegateManager selectableDelegate](self, "selectableDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_moveToEndOfParagraph:withHistory:", v4, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

  return v12;
}

- (id)_moveToEndOfLine:(BOOL)a3 withHistory:(id)a4
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
  -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v4)
      objc_msgSend(v8, "extendInStorageDirection:byGranularity:", 0, 4);
    else
      objc_msgSend(v8, "moveInStorageDirection:byGranularity:", 0, 4);
LABEL_10:
    v12 = 0;
    goto LABEL_11;
  }
  -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v11;
    if (v4)
      objc_msgSend(v11, "extendInDirection:byGranularity:", 0, 4);
    else
      objc_msgSend(v11, "moveInDirection:byGranularity:", 0, 4);
    goto LABEL_10;
  }
  -[UIKBInputDelegateManager selectableDelegate](self, "selectableDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_moveToEndOfLine:withHistory:", v4, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

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

  v4 = a3;
  v6 = a4;
  -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v4)
      objc_msgSend(v8, "extendInStorageDirection:byGranularity:", 0, 5);
    else
      objc_msgSend(v8, "moveInStorageDirection:byGranularity:", 0, 5);
LABEL_10:
    v12 = 0;
    goto LABEL_11;
  }
  -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v11;
    if (v4)
      objc_msgSend(v11, "extendInDirection:byGranularity:", 0, 5);
    else
      objc_msgSend(v11, "moveInDirection:byGranularity:", 0, 5);
    goto LABEL_10;
  }
  -[UIKBInputDelegateManager selectableDelegate](self, "selectableDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_moveToEndOfDocument:withHistory:", v4, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

  return v12;
}

- (BOOL)insertSupplementalItem:(id)a3 candidate:(id)a4 replacementRange:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    -[UIKBInputDelegateManager delegateAsResponder](self, "delegateAsResponder");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      -[UIKBInputDelegateManager delegateAsResponder](self, "delegateAsResponder");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "conformsToProtocol:", &unk_1EDE22B80);

      if (v17)
      {
        -[UIKBInputDelegateManager delegateAsResponder](self, "delegateAsResponder");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v11 = 0;
      }
    }
  }
  v12 = objc_opt_respondsToSelector();
  if ((v12 & 1) != 0)
  {
    if (v11)
    {
      -[UIKBInputDelegateManager keyboardStateDelegate](self, "keyboardStateDelegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "textWillChange:", v11);

      objc_msgSend(v9, "candidate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "_insertSupplementalItem:forString:replacementRange:", v8, v14, v10);

      -[UIKBInputDelegateManager keyboardStateDelegate](self, "keyboardStateDelegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "textSuggestionDidChange:", v11);
    }
    else
    {
      objc_msgSend(v9, "candidate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(0, "_insertSupplementalItem:forString:replacementRange:", v8, v15, v10);
    }

    -[UIKBInputDelegateManager keyboardStateDelegate](self, "keyboardStateDelegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "syncDocumentStateToInputDelegate");

  }
  return v12 & 1;
}

- (BOOL)insertTextSuggestion:(id)a3
{
  id v4;
  char isKindOfClass;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  BOOL v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  objc_class *v24;
  void *v25;
  void *v26;
  _QWORD v28[5];
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }
  -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v6)
      {
        -[UIKBInputDelegateManager delegateAsResponder](self, "delegateAsResponder");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v6)
          goto LABEL_8;
        -[UIKBInputDelegateManager delegateAsResponder](self, "delegateAsResponder");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "conformsToProtocol:", &unk_1EDE22B80);

        if (!v22)
        {
          v6 = 0;
          goto LABEL_8;
        }
        -[UIKBInputDelegateManager delegateAsResponder](self, "delegateAsResponder");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
  }
  if ((v6 == 0) | isKindOfClass & 1)
  {
LABEL_8:
    v7 = 1;
    goto LABEL_10;
  }
  -[UIKBInputDelegateManager keyboardStateDelegate](self, "keyboardStateDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "textWillChange:", v6);

  v7 = 0;
LABEL_10:
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "insertTextSuggestion:completionHandler:", v4, &__block_literal_global_1013);
LABEL_33:
    v12 = 1;
    goto LABEL_34;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "insertTextSuggestion:", v4);

      }
      else
      {
        objc_msgSend(v6, "insertTextSuggestion:", v4);
      }
      goto LABEL_33;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = v4;
      v11 = (void *)objc_msgSend(objc_alloc((Class)getBEAutoFillTextSuggestionClass()), "_initWithUIKitTextSuggestion:", v10);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v29 = 0;
        v30 = &v29;
        v31 = 0x2050000000;
        v23 = (void *)getBETextSuggestionClass_softClass;
        v32 = getBETextSuggestionClass_softClass;
        if (!getBETextSuggestionClass_softClass)
        {
          v28[0] = MEMORY[0x1E0C809B0];
          v28[1] = 3221225472;
          v28[2] = __getBETextSuggestionClass_block_invoke;
          v28[3] = &unk_1E16B14C0;
          v28[4] = &v29;
          __getBETextSuggestionClass_block_invoke((uint64_t)v28);
          v23 = (void *)v30[3];
        }
        v24 = objc_retainAutorelease(v23);
        _Block_object_dispose(&v29, 8);
        v11 = (void *)objc_msgSend([v24 alloc], "_initWithUIKitTextSuggestion:", v4);
        goto LABEL_32;
      }
      v10 = v4;
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "username");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        objc_msgSend(v10, "username");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setObject:forKeyedSubscript:", v17, CFSTR("username"));

      }
      objc_msgSend(v10, "password");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        objc_msgSend(v10, "password");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setObject:forKeyedSubscript:", v19, CFSTR("password"));

      }
      +[UIAutoFillTextSuggestion autoFillSuggestionWithContents:](UIAutoFillTextSuggestion, "autoFillSuggestionWithContents:", v15);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(objc_alloc((Class)getBEAutoFillTextSuggestionClass()), "_initWithUIKitTextSuggestion:", v20);

    }
LABEL_32:
    -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "insertTextSuggestion:", v11);

    goto LABEL_33;
  }
  v12 = 0;
LABEL_34:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v6, "isSecureTextEntry"))
    objc_msgSend(v6, "_forceObscureAllText");
  if ((v7 & 1) == 0)
  {
    -[UIKBInputDelegateManager keyboardStateDelegate](self, "keyboardStateDelegate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "textSuggestionDidChange:", v6);

  }
  return v12;
}

void __49__UIKBInputDelegateManager_insertTextSuggestion___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (objc_msgSend(v2, "count"))
  {
    _UIKeyboardImplLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = 138412290;
      v5 = v2;
      _os_log_impl(&dword_185066000, v3, OS_LOG_TYPE_DEFAULT, "Uninserted AutoFill types: %@", (uint8_t *)&v4, 0xCu);
    }

  }
}

- (void)insertAttributedText:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  v25 = a3;
  -[UIKBInputDelegateManager keyboardStateDelegate](self, "keyboardStateDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "keyboardState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "documentState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "selectedText");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend((id)v7, "length");

  -[UIKBInputDelegateManager setInsideKeyInputDelegateCall:](self, "setInsideKeyInputDelegateCall:", 1);
  -[UIKBInputDelegateManager keyInputDelegate](self, "keyInputDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBInputDelegateManager selectableDelegate](self, "selectableDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBInputDelegateManager privateInputDelegate](self, "privateInputDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[UIKBInputDelegateManager privateInputDelegate](self, "privateInputDelegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "insertAttributedText:", v25);
  }
  else
  {
    objc_msgSend(v25, "string");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      v13 = v10;
    else
      v13 = v9;
    objc_msgSend(v13, "insertText:", v12);
  }

  -[UIKBInputDelegateManager keyboardStateDelegate](self, "keyboardStateDelegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "updateTextInputKeyboardSource");

  -[UIKBInputDelegateManager setInsideKeyInputDelegateCall:](self, "setInsideKeyInputDelegateCall:", 0);
  v15 = objc_msgSend(v25, "length");
  if (v15)
  {
    v16 = v15;
    -[UIKBInputDelegateManager keyboardStateDelegate](self, "keyboardStateDelegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "string");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "substringWithRange:", 0, v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "updateKeyboardStateForInsertion:", v19);

  }
  -[UIKBInputDelegateManager privateInputDelegate](self, "privateInputDelegate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "_textInputSource");

  if (v21 != 2)
  {
    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "_textInputSessionAnalytics");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "string");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "didInsertText:relativeRangeBefore:", v24, 0, v8);

  }
}

- (void)insertDictationResult:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v7, "insertDictationResult:", v4);
  }
  else
  {
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "insertText:", v6);

    v4 = v5;
  }

}

- (BOOL)requiresKeyEvents
{
  void *v3;
  void *v4;
  char v5;

  -[UIKBInputDelegateManager keyInputDelegate](self, "keyInputDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[UIKBInputDelegateManager keyInputDelegate](self, "keyInputDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "requiresKeyEvents");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)handleKeyWebEvent:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[UIKBInputDelegateManager privateInputDelegate](self, "privateInputDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[UIKBInputDelegateManager privateInputDelegate](self, "privateInputDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleKeyWebEvent:", v7);

  }
}

- (void)handleKeyWebEvent:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  UIKeyEvent *v9;
  void *v10;
  uint64_t v11;
  objc_class *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  uint8_t buf[8];
  uint64_t v27;
  void (*v28)(uint64_t);
  void *v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;

  v6 = a3;
  v7 = a4;
  -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = -[UIKeyEvent initWithWebEvent:]([UIKeyEvent alloc], "initWithWebEvent:", v6);
    v31 = 0;
    v32 = &v31;
    v33 = 0x2050000000;
    v10 = (void *)getBEKeyEntryClass_softClass;
    v34 = getBEKeyEntryClass_softClass;
    v11 = MEMORY[0x1E0C809B0];
    if (!getBEKeyEntryClass_softClass)
    {
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      v27 = 3221225472;
      v28 = __getBEKeyEntryClass_block_invoke;
      v29 = &unk_1E16B14C0;
      v30 = &v31;
      __getBEKeyEntryClass_block_invoke((uint64_t)buf);
      v10 = (void *)v32[3];
    }
    v12 = objc_retainAutorelease(v10);
    _Block_object_dispose(&v31, 8);
    v13 = (void *)objc_msgSend([v12 alloc], "_initWithUIKitKeyEvent:", v9);
    -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v11;
    v24[1] = 3221225472;
    v24[2] = __68__UIKBInputDelegateManager_handleKeyWebEvent_withCompletionHandler___block_invoke;
    v24[3] = &unk_1E16C72A8;
    v25 = v7;
    objc_msgSend(v14, "handleKeyEntry:withCompletionHandler:", v13, v24);

    goto LABEL_7;
  }
  -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v9 = -[UIKeyEvent initWithWebEvent:]([UIKeyEvent alloc], "initWithWebEvent:", v6);
    -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __68__UIKBInputDelegateManager_handleKeyWebEvent_withCompletionHandler___block_invoke_2;
    v22[3] = &unk_1E16C72D0;
    v23 = v7;
    objc_msgSend(v16, "handleAsyncKeyEvent:withCompletionHandler:", v9, v22);

LABEL_7:
    goto LABEL_8;
  }
  -[UIKBInputDelegateManager privateInputDelegate](self, "privateInputDelegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_opt_respondsToSelector();

  if ((v18 & 1) != 0)
  {
    if (+[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess"))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "webkey event shouldn't be handled here", buf, 2u);
      }
    }
    else
    {
      -[UIKBInputDelegateManager privateInputDelegate](self, "privateInputDelegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __68__UIKBInputDelegateManager_handleKeyWebEvent_withCompletionHandler___block_invoke_1024;
      v20[3] = &unk_1E16C72F8;
      v21 = v7;
      objc_msgSend(v19, "handleKeyWebEvent:withCompletionHandler:", v6, v20);

    }
  }
  else
  {
    (*((void (**)(id, id, _QWORD))v7 + 2))(v7, v6, 0);
  }
LABEL_8:

}

void __68__UIKBInputDelegateManager_handleKeyWebEvent_withCompletionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  id v6;

  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "_uikitKeyEvent");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "webEvent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, uint64_t))(v4 + 16))(v4, v5, a3);

}

void __68__UIKBInputDelegateManager_handleKeyWebEvent_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  id v5;

  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "webEvent");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, uint64_t))(v4 + 16))(v4, v5, a3);

}

uint64_t __68__UIKBInputDelegateManager_handleKeyWebEvent_withCompletionHandler___block_invoke_1024(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_setMarkedText:(id)a3 selectedRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  id v8;

  length = a4.length;
  location = a4.location;
  v7 = a3;
  -[UIKBInputDelegateManager selectableDelegate](self, "selectableDelegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_setMarkedText:selectedRange:", v7, location, length);

}

- (void)_moveCurrentSelection:(int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = *(_QWORD *)&a3;
  -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v6;
  }
  else
  {
    -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[UIKBInputDelegateManager asyncWebKitInteractionDelegate](self, "asyncWebKitInteractionDelegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
      {
        -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
        v9 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "_moveCurrentSelection:", v3);
        goto LABEL_9;
      }
      -[UIKBInputDelegateManager asyncWebKitInteractionDelegate](self, "asyncWebKitInteractionDelegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v9 = v6;
  }
  objc_msgSend(v6, "moveByOffset:", (int)v3);
LABEL_9:

}

- (void)_deleteBackwardAndNotify:(BOOL)a3 reinsertText:(BOOL)a4 overrideOriginalContextBeforeInputWith:(id)a5
{
  _BOOL4 v6;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  _BOOL4 v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  id v52;

  v6 = a3;
  v8 = a5;
  v9 = v8;
  v47 = v6;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    -[UIKBInputDelegateManager keyboardStateDelegate](self, "keyboardStateDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "documentState");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "contextBeforeInput");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)objc_msgSend(v13, "copy");

  }
  v14 = objc_msgSend(v10, "length");
  -[UIKBInputDelegateManager keyboardStateDelegate](self, "keyboardStateDelegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "documentState");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "markedText");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "length");

  -[UIKBInputDelegateManager setInsideKeyInputDelegateCall:](self, "setInsideKeyInputDelegateCall:", 1);
  -[UIKBInputDelegateManager legacyInputDelegate](self, "legacyInputDelegate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v50 = v14;
  v51 = v10;
  v49 = v18;
  if (v19)
  {
    v20 = 0;
  }
  else
  {
    -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (a4)
    {
      v52 = 0;
      objc_msgSend(v21, "_expandSelectionToBackwardDeletionClusterWithReinsertionOut:", &v52);
      v20 = v52;
    }
    else
    {
      objc_msgSend(v21, "_expandSelectionToBackwardDeletionClusterWithReinsertionOut:", 0);
      v20 = 0;
    }

  }
  -[UIKBInputDelegateManager keyboardStateDelegate](self, "keyboardStateDelegate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "keyboardState");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "documentState");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "selectedText");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_msgSend(v26, "copy");

  v48 = objc_msgSend(v27, "length");
  -[UIKBInputDelegateManager keyInputDelegate](self, "keyInputDelegate");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBInputDelegateManager selectableDelegate](self, "selectableDelegate");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v31;
  if (v31)
    goto LABEL_13;
  if (v30)
  {
    v31 = v30;
LABEL_13:
    objc_msgSend(v31, "deleteInDirection:toGranularity:", 1, 0);
    goto LABEL_14;
  }
  if (v29)
  {
    objc_msgSend(v29, "_deleteBackwardAndNotify:", v47);
    if (!v20)
      goto LABEL_15;
    objc_msgSend(v29, "insertText:", v20);
  }
  else
  {
    objc_msgSend(v28, "_deleteBackwardAndNotify:", v47);
  }
LABEL_14:

LABEL_15:
  -[UIKBInputDelegateManager keyboardStateDelegate](self, "keyboardStateDelegate");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "updateTextInputKeyboardSource");

  -[UIKBInputDelegateManager setInsideKeyInputDelegateCall:](self, "setInsideKeyInputDelegateCall:", 0);
  -[UIKBInputDelegateManager keyboardStateDelegate](self, "keyboardStateDelegate");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "documentState");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "contextBeforeInput");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v36, "length");

  -[UIKBInputDelegateManager keyboardStateDelegate](self, "keyboardStateDelegate");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "documentState");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "markedText");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "length");

  if (v50 == v37 && v49 == v41)
  {
    -[UIKBInputDelegateManager keyboardStateDelegate](self, "keyboardStateDelegate");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "updateKeyboardStateForDeletion");

  }
  -[UIKBInputDelegateManager keyboardStateDelegate](self, "keyboardStateDelegate");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "documentState");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "markedText");
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v45)
  {
    if (v48)
    {
      +[UIKBAnalyticsDispatcher didDeleteBackwardText:](UIKBAnalyticsDispatcher, "didDeleteBackwardText:", v27);
    }
    else if (v50)
    {
      objc_msgSend(v51, "substringFromIndex:", objc_msgSend(v51, "_rangeOfBackwardDeletionClusterAtIndex:", v50 - 1));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIKBAnalyticsDispatcher didDeleteBackwardText:](UIKBAnalyticsDispatcher, "didDeleteBackwardText:", v46);

    }
  }

}

- (void)_deleteBackwardAndNotify:(BOOL)a3 reinsertText:(BOOL)a4
{
  -[UIKBInputDelegateManager _deleteBackwardAndNotify:reinsertText:overrideOriginalContextBeforeInputWith:](self, "_deleteBackwardAndNotify:reinsertText:overrideOriginalContextBeforeInputWith:", a3, a4, 0);
}

- (void)_deleteBackwardWhileOverridingContextAndNotifyAtEnd:(BOOL)a3 deletionCount:(unint64_t)a4 reinsertTextInLoop:(BOOL)a5
{
  _BOOL8 v5;
  unsigned int v7;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;

  v5 = a5;
  v7 = a3;
  -[UIKBInputDelegateManager keyboardStateDelegate](self, "keyboardStateDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "documentState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copy");

  v12 = a4 - v7;
  if (a4 == v7)
  {
    v14 = v11;
    if ((v7 & 1) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  do
  {
    objc_msgSend(v11, "contextBeforeInput");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBInputDelegateManager _deleteBackwardAndNotify:reinsertText:overrideOriginalContextBeforeInputWith:](self, "_deleteBackwardAndNotify:reinsertText:overrideOriginalContextBeforeInputWith:", 0, v5, v13);

    objc_msgSend(v11, "documentStateAfterDeletingBackward");
    v16 = (id)objc_claimAutoreleasedReturnValue();

    v14 = v16;
    v11 = v16;
    --v12;
  }
  while (v12);
  if ((v7 & 1) != 0)
  {
LABEL_4:
    v17 = v14;
    objc_msgSend(v14, "contextBeforeInput");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBInputDelegateManager _deleteBackwardAndNotify:reinsertText:overrideOriginalContextBeforeInputWith:](self, "_deleteBackwardAndNotify:reinsertText:overrideOriginalContextBeforeInputWith:", 1, 0, v15);

    v14 = v17;
  }
LABEL_5:

}

- (void)_deleteByWord
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v7 = v4;
    objc_msgSend(v4, "deleteInDirection:toGranularity:", 1, 1);
    goto LABEL_6;
  }
  -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  -[UIKBInputDelegateManager asyncWebKitInteractionDelegate](self, "asyncWebKitInteractionDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    -[UIKBInputDelegateManager asyncWebKitInteractionDelegate](self, "asyncWebKitInteractionDelegate");
  else
    -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_deleteByWord");
LABEL_6:

}

- (void)_deleteForwardByWord
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v7 = v4;
    objc_msgSend(v4, "deleteInDirection:toGranularity:", 0, 1);
    goto LABEL_6;
  }
  -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  -[UIKBInputDelegateManager asyncWebKitInteractionDelegate](self, "asyncWebKitInteractionDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    -[UIKBInputDelegateManager asyncWebKitInteractionDelegate](self, "asyncWebKitInteractionDelegate");
  else
    -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_deleteForwardByWord");
LABEL_6:

}

- (void)_deleteToStartOfLine
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v7 = v4;
    objc_msgSend(v4, "deleteInDirection:toGranularity:", 1, 4);
    goto LABEL_6;
  }
  -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  -[UIKBInputDelegateManager asyncWebKitInteractionDelegate](self, "asyncWebKitInteractionDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    -[UIKBInputDelegateManager asyncWebKitInteractionDelegate](self, "asyncWebKitInteractionDelegate");
  else
    -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_deleteToStartOfLine");
LABEL_6:

}

- (void)_deleteToEndOfLine
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v7 = v4;
    objc_msgSend(v4, "deleteInDirection:toGranularity:", 0, 4);
    goto LABEL_6;
  }
  -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  -[UIKBInputDelegateManager asyncWebKitInteractionDelegate](self, "asyncWebKitInteractionDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    -[UIKBInputDelegateManager asyncWebKitInteractionDelegate](self, "asyncWebKitInteractionDelegate");
  else
    -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_deleteToEndOfLine");
LABEL_6:

}

- (void)_deleteToEndOfParagraph
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v7 = v4;
    objc_msgSend(v4, "deleteInDirection:toGranularity:", 0, 3);
    goto LABEL_6;
  }
  -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  -[UIKBInputDelegateManager asyncWebKitInteractionDelegate](self, "asyncWebKitInteractionDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    -[UIKBInputDelegateManager asyncWebKitInteractionDelegate](self, "asyncWebKitInteractionDelegate");
  else
    -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_deleteToEndOfParagraph");
LABEL_6:

}

- (BOOL)_deleteForwardAndNotify:(BOOL)a3
{
  _BOOL8 v3;
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
  void *v18;

  v3 = a3;
  -[UIKBInputDelegateManager keyboardStateDelegate](self, "keyboardStateDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBInputDelegateManager keyboardStateDelegate](self, "keyboardStateDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "keyboardState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "documentState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "documentStateAfterDeletingForward");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDocumentState:", v9);

  -[UIKBInputDelegateManager setInsideKeyInputDelegateCall:](self, "setInsideKeyInputDelegateCall:", 1);
  -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBInputDelegateManager selectableDelegate](self, "selectableDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v15 = v13;
    objc_msgSend(v13, "deleteInDirection:toGranularity:", 0, 0);
    goto LABEL_6;
  }
  -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  -[UIKBInputDelegateManager asyncWebKitInteractionDelegate](self, "asyncWebKitInteractionDelegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
    -[UIKBInputDelegateManager asyncWebKitInteractionDelegate](self, "asyncWebKitInteractionDelegate");
  else
    -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "_deleteForwardAndNotify:", v3);
LABEL_6:

  -[UIKBInputDelegateManager keyboardStateDelegate](self, "keyboardStateDelegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "updateTextInputKeyboardSource");

  -[UIKBInputDelegateManager setInsideKeyInputDelegateCall:](self, "setInsideKeyInputDelegateCall:", 0);
  return 1;
}

- (unint64_t)_textLengthToDeleteBeforeSelectedRangeForSmartDelete
{
  void *v2;
  unint64_t v3;

  -[UIKBInputDelegateManager selectableDelegate](self, "selectableDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "_textLengthToDeleteBeforeSelectedRangeForSmartDelete");
  else
    v3 = 0;

  return v3;
}

- (id)__content
{
  void *v2;
  void *v3;

  -[UIKBInputDelegateManager privateInputDelegate](self, "privateInputDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_proxyTextInput");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_textRangeFromNSRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v5;
  void *v6;

  length = a3.length;
  location = a3.location;
  -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_textRangeFromNSRange:", location, length);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_setSelectionToPosition:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setSelectionToPosition:", v4);

}

- (BOOL)_selectionAtDocumentStart
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  BOOL v7;

  -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isSelectionAtDocumentStart");
  }
  else
  {
    -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "selectionAtDocumentStart");
    }
    else
    {
      -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "_selectionAtDocumentStart");
    }
  }
  v7 = v5;

  return v7;
}

- (void)applyAutocorrection:(id)a3 toString:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __79__UIKBInputDelegateManager_applyAutocorrection_toString_withCompletionHandler___block_invoke;
    v19[3] = &unk_1E16BB9F0;
    v13 = &v20;
    v20 = v10;
    objc_msgSend(v12, "replaceText:withText:options:completionHandler:", v8, v9, 0, v19);
  }
  else
  {
    -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __79__UIKBInputDelegateManager_applyAutocorrection_toString_withCompletionHandler___block_invoke_2;
      v17[3] = &unk_1E16BB9F0;
      v13 = &v18;
      v18 = v10;
      objc_msgSend(v12, "replaceText:withText:options:withCompletionHandler:", v8, v9, 0, v17);
    }
    else
    {
      -[UIKBInputDelegateManager asyncWebKitInteractionDelegate](self, "asyncWebKitInteractionDelegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __79__UIKBInputDelegateManager_applyAutocorrection_toString_withCompletionHandler___block_invoke_3;
      v15[3] = &unk_1E16BBA18;
      v13 = &v16;
      v16 = v10;
      objc_msgSend(v12, "applyAutocorrection:toString:withCompletionHandler:", v8, v9, v15);
    }
  }

}

void __79__UIKBInputDelegateManager_applyAutocorrection_toString_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_msgSend(a2, "firstObject");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "rect");
    (*(void (**)(uint64_t))(v2 + 16))(v2);

  }
}

void __79__UIKBInputDelegateManager_applyAutocorrection_toString_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_msgSend(a2, "firstObject");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "rect");
    (*(void (**)(uint64_t))(v2 + 16))(v2);

  }
}

uint64_t __79__UIKBInputDelegateManager_applyAutocorrection_toString_withCompletionHandler___block_invoke_3(uint64_t result, void *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 32);
  if (v2)
  {
    objc_msgSend(a2, "firstRect");
    return (*(uint64_t (**)(uint64_t))(v2 + 16))(v2);
  }
  return result;
}

- (void)applyAutocorrection:(id)a3 toString:(id)a4 shouldUnderline:(BOOL)a5 withCompletionHandler:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = a6;
  -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __95__UIKBInputDelegateManager_applyAutocorrection_toString_shouldUnderline_withCompletionHandler___block_invoke;
    v24[3] = &unk_1E16BB9F0;
    v25 = v12;
    objc_msgSend(v14, "replaceText:withText:options:completionHandler:", v11, v10, v7, v24);

    v15 = v25;
  }
  else
  {
    -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __95__UIKBInputDelegateManager_applyAutocorrection_toString_shouldUnderline_withCompletionHandler___block_invoke_2;
      v22[3] = &unk_1E16BB9F0;
      v23 = v12;
      objc_msgSend(v17, "replaceText:withText:options:withCompletionHandler:", v11, v10, v7, v22);

      v15 = v23;
    }
    else
    {
      -[UIKBInputDelegateManager asyncWebKitInteractionDelegate](self, "asyncWebKitInteractionDelegate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v18)
      {
        -[UIKBInputDelegateManager applyAutocorrection:toString:withCompletionHandler:](self, "applyAutocorrection:toString:withCompletionHandler:", v10, v11, v12);
        goto LABEL_8;
      }
      -[UIKBInputDelegateManager asyncWebKitInteractionDelegate](self, "asyncWebKitInteractionDelegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __95__UIKBInputDelegateManager_applyAutocorrection_toString_shouldUnderline_withCompletionHandler___block_invoke_3;
      v20[3] = &unk_1E16BBA18;
      v21 = v12;
      objc_msgSend(v19, "applyAutocorrection:toString:shouldUnderline:withCompletionHandler:", v10, v11, v7, v20);

      v15 = v21;
    }
  }

LABEL_8:
}

void __95__UIKBInputDelegateManager_applyAutocorrection_toString_shouldUnderline_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_msgSend(a2, "firstObject");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "rect");
    (*(void (**)(uint64_t))(v2 + 16))(v2);

  }
}

void __95__UIKBInputDelegateManager_applyAutocorrection_toString_shouldUnderline_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_msgSend(a2, "firstObject");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "rect");
    (*(void (**)(uint64_t))(v2 + 16))(v2);

  }
}

uint64_t __95__UIKBInputDelegateManager_applyAutocorrection_toString_shouldUnderline_withCompletionHandler___block_invoke_3(uint64_t result, void *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 32);
  if (v2)
  {
    objc_msgSend(a2, "firstRect");
    return (*(uint64_t (**)(uint64_t))(v2 + 16))(v2);
  }
  return result;
}

- (id)_rangeOfText:(id)a3 endingAtPosition:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_rangeOfText:endingAtPosition:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)requestDocumentContext:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *);
  void *v22;
  id v23;
  _QWORD v24[5];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;

  v6 = a3;
  v7 = a4;
  -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[UIKBInputDelegateManager asyncWebKitInteractionDelegate](self, "asyncWebKitInteractionDelegate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v17)
        goto LABEL_10;
      -[UIKBInputDelegateManager asyncWebKitInteractionDelegate](self, "asyncWebKitInteractionDelegate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v18 = v16;
    objc_msgSend(v16, "requestDocumentContext:completionHandler:", v6, v7);

    goto LABEL_10;
  }
  v25 = 0;
  v26 = &v25;
  v27 = 0x2050000000;
  v9 = (void *)getBETextDocumentRequestClass_softClass;
  v28 = getBETextDocumentRequestClass_softClass;
  v10 = MEMORY[0x1E0C809B0];
  if (!getBETextDocumentRequestClass_softClass)
  {
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __getBETextDocumentRequestClass_block_invoke;
    v24[3] = &unk_1E16B14C0;
    v24[4] = &v25;
    __getBETextDocumentRequestClass_block_invoke((uint64_t)v24);
    v9 = (void *)v26[3];
  }
  v11 = objc_retainAutorelease(v9);
  _Block_object_dispose(&v25, 8);
  v12 = (void *)objc_msgSend([v11 alloc], "_initWithUIKitDocumentRequest:", v6);
  v19 = v10;
  v20 = 3221225472;
  v21 = __69__UIKBInputDelegateManager_requestDocumentContext_completionHandler___block_invoke;
  v22 = &unk_1E16C7320;
  v23 = v7;
  v13 = _Block_copy(&v19);
  -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate", v19, v20, v21, v22);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "requestDocumentContext:completionHandler:", v12, v13);

LABEL_10:
}

void __69__UIKBInputDelegateManager_requestDocumentContext_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "_uikitDocumentContext");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)requestTextContextForAutocorrectionWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD aBlock[4];
  id v11;

  v4 = a3;
  -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __85__UIKBInputDelegateManager_requestTextContextForAutocorrectionWithCompletionHandler___block_invoke;
    aBlock[3] = &unk_1E16C7320;
    v11 = v4;
    v6 = _Block_copy(aBlock);
    -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "requestTextContextForAutocorrectionWithCompletionHandler:", v6);

  }
  else
  {
    -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "requestTextContextForAutocorrectionWithCompletionHandler:", v4);

    }
  }

}

void __85__UIKBInputDelegateManager_requestTextContextForAutocorrectionWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "_uikitDocumentContext");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)adjustSelection:(id)a3 completionHandler:(id)a4
{
  int64_t var1;
  int64_t var0;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  var1 = a3.var1;
  var0 = a3.var0;
  v10 = a4;
  -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "adjustSelectionByRange:completionHandler:", var0, var1, v10);
  }
  else
  {
    -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "adjustSelection:completionHandler:", var0, var1, v10);
    }
    else
    {
      -[UIKBInputDelegateManager asyncWebKitInteractionDelegate](self, "asyncWebKitInteractionDelegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "adjustSelectionWithDelta:completionHandler:", var0, var1, v10);
    }
  }

}

- (void)requestTextRectsForString:(id)a3 withCompletionHandler:(id)a4
{
  void (**v6)(id, void *);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = (void (**)(id, void *))a4;
  -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      v10 = (void *)objc_opt_new();
      v6[2](v6, v10);
      goto LABEL_6;
    }
    -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10 = v8;
  objc_msgSend(v8, "requestTextRectsForString:withCompletionHandler:", v11, v6);
LABEL_6:

}

- (CGRect)textFirstRect
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect result;

  -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[UIKBInputDelegateManager asyncWebKitInteractionDelegate](self, "asyncWebKitInteractionDelegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6)
      {
        v9 = *MEMORY[0x1E0C9D628];
        v11 = *(double *)(MEMORY[0x1E0C9D628] + 8);
        v13 = *(double *)(MEMORY[0x1E0C9D628] + 16);
        v15 = *(double *)(MEMORY[0x1E0C9D628] + 24);
        goto LABEL_8;
      }
      -[UIKBInputDelegateManager asyncWebKitInteractionDelegate](self, "asyncWebKitInteractionDelegate");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  v7 = v4;
  objc_msgSend(v4, "textFirstRect");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

LABEL_8:
  v16 = v9;
  v17 = v11;
  v18 = v13;
  v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (CGRect)textLastRect
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect result;

  -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[UIKBInputDelegateManager asyncWebKitInteractionDelegate](self, "asyncWebKitInteractionDelegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6)
      {
        v9 = *MEMORY[0x1E0C9D628];
        v11 = *(double *)(MEMORY[0x1E0C9D628] + 8);
        v13 = *(double *)(MEMORY[0x1E0C9D628] + 16);
        v15 = *(double *)(MEMORY[0x1E0C9D628] + 24);
        goto LABEL_8;
      }
      -[UIKBInputDelegateManager asyncWebKitInteractionDelegate](self, "asyncWebKitInteractionDelegate");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  v7 = v4;
  objc_msgSend(v4, "textLastRect");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

LABEL_8:
  v16 = v9;
  v17 = v11;
  v18 = v13;
  v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (BOOL)callKeyboardWillDismiss
{
  void *v3;
  char v4;
  void *v5;

  -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "keyboardWillDismiss");

  }
  return v4 & 1;
}

- (void)insertText:(id)a3 updateInputSource:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _BOOL4 v27;
  void *v28;
  void *v29;
  void *v30;
  _BOOL4 v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  id v41;

  v4 = a4;
  v41 = a3;
  -[UIKBInputDelegateManager keyboardStateDelegate](self, "keyboardStateDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "keyboardState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "documentState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "selectedText");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");

  -[UIKBInputDelegateManager keyboardStateDelegate](self, "keyboardStateDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "keyboardState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "documentState");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "selectedText");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "length");

  -[UIKBInputDelegateManager setInsideKeyInputDelegateCall:](self, "setInsideKeyInputDelegateCall:", 1);
  -[UIKBInputDelegateManager keyInputDelegate](self, "keyInputDelegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBInputDelegateManager selectableDelegate](self, "selectableDelegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBInputDelegateManager privateKeyInputDelegate](self, "privateKeyInputDelegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v19 = objc_msgSend(v18, "insertFilteredText:", v41);
    v21 = v20;
    if (!v4)
      goto LABEL_9;
    goto LABEL_8;
  }
  if (v17)
    v22 = v17;
  else
    v22 = v16;
  objc_msgSend(v22, "insertText:", v41);
  v21 = objc_msgSend(v41, "length");
  v19 = 0;
  if (v4)
  {
LABEL_8:
    -[UIKBInputDelegateManager keyboardStateDelegate](self, "keyboardStateDelegate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "updateTextInputKeyboardSource");

  }
LABEL_9:

  -[UIKBInputDelegateManager setInsideKeyInputDelegateCall:](self, "setInsideKeyInputDelegateCall:", 0);
  if (v21 && v19 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[UIKBInputDelegateManager keyboardStateDelegate](self, "keyboardStateDelegate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "substringWithRange:", v19, v21);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "updateKeyboardStateForInsertion:", v25);

  }
  -[UIKBInputDelegateManager privateInputDelegate](self, "privateInputDelegate");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v26, "_textInputSource") == 2)
  {
    v27 = 0;
  }
  else
  {
    +[UIKBAnalyticsDispatcher sharedInstance](UIKBAnalyticsDispatcher, "sharedInstance");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v28, "nextCandidateReplacementSource") == 2)
    {
      v27 = 1;
    }
    else
    {
      +[UIKBAnalyticsDispatcher sharedInstance](UIKBAnalyticsDispatcher, "sharedInstance");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v29, "nextCandidateReplacementSource") == 1;

    }
  }

  -[UIKBInputDelegateManager privateInputDelegate](self, "privateInputDelegate");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v30, "_textInputSource") == 5)
  {
    if (!+[UIKeyboard inputUIOOP](UIKeyboard, "inputUIOOP"))
    {

      goto LABEL_25;
    }
    v31 = +[UIKeyboard isInputSystemUI](UIKeyboard, "isInputSystemUI");
  }
  else
  {
    v31 = 0;
  }

  if (v27 || v31)
  {
LABEL_25:
    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "_textInputSessionAnalytics");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "didInsertText:relativeRangeBefore:selectedTextBefore:withLanguage:", v41, 0, v15, v10, 0);

  }
  +[UIKBAnalyticsDispatcher sharedInstance](UIKBAnalyticsDispatcher, "sharedInstance");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v34, "nextCandidateReplacementSource") != 3)
  {
    +[UIKBAnalyticsDispatcher sharedInstance](UIKBAnalyticsDispatcher, "sharedInstance");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v35, "nextCandidateReplacementSource") != 4)
    {
      +[UIKBAnalyticsDispatcher sharedInstance](UIKBAnalyticsDispatcher, "sharedInstance");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v36, "nextCandidateReplacementSource") != 5)
      {
        +[UIKBAnalyticsDispatcher sharedInstance](UIKBAnalyticsDispatcher, "sharedInstance");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v37, "nextCandidateReplacementSource") != 7)
        {
          +[UIKBAnalyticsDispatcher sharedInstance](UIKBAnalyticsDispatcher, "sharedInstance");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = objc_msgSend(v39, "nextCandidateReplacementSource");

          if (v40 != 6)
            goto LABEL_35;
          goto LABEL_34;
        }

      }
    }

  }
LABEL_34:
  +[UIKBAnalyticsDispatcher sharedInstance](UIKBAnalyticsDispatcher, "sharedInstance");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setNextCandidateReplacementPostCandidateInsertedText:", v41);

LABEL_35:
}

- (void)insertTextAfterSelection:(id)a3
{
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
  id v14;

  v14 = a3;
  -[UIKBInputDelegateManager keyboardStateDelegate](self, "keyboardStateDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBInputDelegateManager keyboardStateDelegate](self, "keyboardStateDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "keyboardState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "documentState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "documentStateAfterInsertingTextAfterSelection:", v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDocumentState:", v8);

  -[UIKBInputDelegateManager keyboardStateDelegate](self, "keyboardStateDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "clearInputForMarkedText");

  -[UIKBInputDelegateManager setInsideKeyInputDelegateCall:](self, "setInsideKeyInputDelegateCall:", 1);
  -[UIKBInputDelegateManager keyInputDelegate](self, "keyInputDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBInputDelegateManager selectableDelegate](self, "selectableDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11)
    v11 = v10;
  objc_msgSend(v11, "insertText:", v14);
  -[UIKBInputDelegateManager keyboardStateDelegate](self, "keyboardStateDelegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "updateTextInputKeyboardSource");

  -[UIKBInputDelegateManager setInsideKeyInputDelegateCall:](self, "setInsideKeyInputDelegateCall:", 0);
  -[UIKBInputDelegateManager _moveCurrentSelection:](self, "_moveCurrentSelection:", -objc_msgSend(v14, "length"));

}

- (void)unmarkText:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  -[UIKBInputDelegateManager keyboardStateDelegate](self, "keyboardStateDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShouldIgnoreTextInputChanges:", 1);

  -[UIKBInputDelegateManager keyboardStateDelegate](self, "keyboardStateDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBInputDelegateManager keyboardStateDelegate](self, "keyboardStateDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "keyboardState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "documentState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "documentStateAfterSettingMarkedText:selectedRange:", v4, objc_msgSend(v4, "length"), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDocumentState:", v10);

  -[UIKBInputDelegateManager selectableDelegate](self, "selectableDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_setMarkedText:selectedRange:", v4, objc_msgSend(v4, "length"), 0);

  -[UIKBInputDelegateManager unmarkText](self, "unmarkText");
  -[UIKBInputDelegateManager keyboardStateDelegate](self, "keyboardStateDelegate");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setShouldIgnoreTextInputChanges:", 0);

}

- (void)handleClearWithInsertBeforeAdvance:(id)a3
{
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
  id v14;

  v14 = a3;
  -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "beginningOfDocument");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "endOfDocument");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textRangeFromPosition:toPosition:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "textInRange:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "length");

  if (-[UIKBInputDelegateManager callShouldReplaceExtendedRange:withText:includeMarkedText:](self, "callShouldReplaceExtendedRange:withText:includeMarkedText:", v12, v14, 1))
  {
    -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "replaceRange:withText:", v9, v14);

  }
}

- (BOOL)callShouldReplaceExtendedRange:(int64_t)a3 withText:(id)a4 includeMarkedText:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  char v10;
  void *v11;
  char v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  unint64_t v37;
  uint64_t v38;
  int64_t v39;
  unint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;

  v5 = a5;
  v8 = a4;
  -[UIKBInputDelegateManager legacyInputDelegate](self, "legacyInputDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[UIKBInputDelegateManager privateInputDelegate](self, "privateInputDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) != 0)
    {
      -[UIKBInputDelegateManager privateInputDelegate](self, "privateInputDelegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "selectionRange");
      v16 = v15;
    }
    else
    {
      v24 = (void *)objc_opt_class();
      -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "selectedTextRange");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v24, "rangeForTextRange:document:", v25, v26);
      v16 = v27;

    }
    if (v5)
    {
      v28 = (void *)objc_opt_class();
      -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "markedTextRange");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v28, "rangeForTextRange:document:", v30, v31);
      v34 = v33;

      v35 = v16;
      v16 = v34;
    }
    else
    {
      v35 = 0;
      v32 = v14;
    }
    if (v16)
    {
      v35 = v16;
      v37 = v32;
    }
    else
    {
      v37 = v14;
    }
    v38 = v35 + a3;
    if (v37 >= a3)
      v39 = a3;
    else
      v39 = v37;
    v40 = v37 - v39;
    v41 = v39 + v35;
    if (a3 < 0)
    {
      v42 = v37;
    }
    else
    {
      v38 = v41;
      v42 = v40;
    }
    if (v37 == 0x7FFFFFFFFFFFFFFFLL)
      v43 = v35;
    else
      v43 = v38;
    if (v37 == 0x7FFFFFFFFFFFFFFFLL)
      v44 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v44 = v42;
    -[UIKBInputDelegateManager legacyInputDelegate](self, "legacyInputDelegate");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBInputDelegateManager legacyInputDelegate](self, "legacyInputDelegate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v45, "keyboardInput:shouldReplaceTextInRange:replacementText:", v21, v44, v43, v8);
    goto LABEL_29;
  }
  -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_opt_respondsToSelector();

  if ((v18 & 1) != 0)
  {
    -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v5)
    {
      objc_msgSend(v19, "markedTextRange");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v21, "isEmpty"))
      {
        -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "selectedTextRange");
        v23 = objc_claimAutoreleasedReturnValue();

        v21 = (void *)v23;
      }
    }
    else
    {
      objc_msgSend(v19, "selectedTextRange");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v21, "isEmpty");
    }
    -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "start");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "positionFromPosition:offset:", v48, -a3);
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    if (v45)
    {
      -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "end");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "textRangeFromPosition:toPosition:", v45, v50);
      v51 = objc_claimAutoreleasedReturnValue();

      if (!v51)
      {
        v36 = 1;
        goto LABEL_30;
      }
      -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v52, "shouldChangeTextInRange:replacementText:", v51, v8);

      v21 = (void *)v51;
    }
    else
    {
      v36 = 1;
    }
LABEL_29:

LABEL_30:
    goto LABEL_31;
  }
  v36 = 1;
LABEL_31:

  return v36;
}

- (BOOL)callShouldDeleteBackwardWithCount:(unint64_t)a3
{
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  char v27;
  void *v28;

  -[UIKBInputDelegateManager keyboardStateDelegate](self, "keyboardStateDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShouldIgnoreTextInputChanges:", 1);

  -[UIKBInputDelegateManager legacyInputDelegate](self, "legacyInputDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    if (a3 >= 2)
    {
      -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_extendCurrentSelection:", -(int)a3);

      -[UIKBInputDelegateManager legacyInputDelegate](self, "legacyInputDelegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKBInputDelegateManager legacyInputDelegate](self, "legacyInputDelegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "keyboardInputShouldDelete:", v10);

      -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "_setCaretSelectionAtEndOfSelection");

      -[UIKBInputDelegateManager keyboardStateDelegate](self, "keyboardStateDelegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "syncDocumentStateToInputDelegate");
LABEL_16:

      goto LABEL_17;
    }
    -[UIKBInputDelegateManager legacyInputDelegate](self, "legacyInputDelegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBInputDelegateManager legacyInputDelegate](self, "legacyInputDelegate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v13, "keyboardInputShouldDelete:", v26);
LABEL_15:
    v11 = v27;

    goto LABEL_16;
  }
  -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_opt_respondsToSelector();

  if ((v15 & 1) != 0)
  {
    -[UIKBInputDelegateManager selectedTextRange](self, "selectedTextRange");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "isEmpty"))
    {
      -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "start");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKBInputDelegateManager beginningOfDocument](self, "beginningOfDocument");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v16, "comparePosition:toPosition:", v17, v18);

      if (v19)
      {
        -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "start");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "positionFromPosition:offset:", v21, -1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (v22)
        {
          -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "end");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "textRangeFromPosition:toPosition:", v22, v24);
          v25 = objc_claimAutoreleasedReturnValue();

          v13 = v23;
        }
        else
        {
          v25 = 0;
        }

        v13 = (void *)v25;
      }
    }
    if (!v13)
    {
      v11 = 1;
      goto LABEL_16;
    }
    -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "shouldChangeTextInRange:replacementText:", v13, &stru_1E16EDF20);
    goto LABEL_15;
  }
  v11 = 1;
LABEL_17:
  -[UIKBInputDelegateManager keyboardStateDelegate](self, "keyboardStateDelegate");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setShouldIgnoreTextInputChanges:", 0);

  return v11;
}

- (void)addTextAlternatives:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  id v17;

  v17 = a3;
  -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addTextAlternatives:", v17);

  }
  -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:
      v16 = v9;
      objc_msgSend(v9, "addTextAlternatives:", v17);

    }
  }
  else
  {
    -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_opt_respondsToSelector();

      if ((v12 & 1) != 0)
      {
        -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      }
    }
    else
    {
      -[UIKBInputDelegateManager asyncWebKitInteractionDelegate](self, "asyncWebKitInteractionDelegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v13)
      {
        -[UIKBInputDelegateManager privateInputDelegate](self, "privateInputDelegate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      }
      -[UIKBInputDelegateManager asyncWebKitInteractionDelegate](self, "asyncWebKitInteractionDelegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_opt_respondsToSelector();

      if ((v15 & 1) != 0)
      {
        -[UIKBInputDelegateManager asyncWebKitInteractionDelegate](self, "asyncWebKitInteractionDelegate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      }
    }
  }

}

- (CGRect)visibleTextRect
{
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  double v8;
  double x;
  double v10;
  double y;
  double v12;
  double width;
  double v14;
  double height;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  void *v26;
  void *v27;
  char isKindOfClass;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  CGRect v37;
  CGRect result;

  -[UIKBInputDelegateManager asyncCapableInputDelegate](self, "asyncCapableInputDelegate");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3
    || (v4 = (void *)v3,
        -[UIKBInputDelegateManager asyncCapableInputDelegate](self, "asyncCapableInputDelegate"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_opt_respondsToSelector(),
        v5,
        v4,
        (v6 & 1) == 0))
  {
    -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
    v25 = objc_claimAutoreleasedReturnValue();
    if (v25
      && (v26 = (void *)v25,
          -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate"),
          v27 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          isKindOfClass = objc_opt_isKindOfClass(),
          v27,
          v26,
          (isKindOfClass & 1) != 0))
    {
      -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "visibleTextRect");
    }
    else
    {
      -[UIKBInputDelegateManager selectionClipRect](self, "selectionClipRect");
      x = v37.origin.x;
      y = v37.origin.y;
      width = v37.size.width;
      height = v37.size.height;
      if (!CGRectIsNull(v37))
        goto LABEL_12;
      -[UIKBInputDelegateManager textInputView](self, "textInputView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "bounds");
    }
    x = v29;
    y = v30;
    width = v31;
    height = v32;
    goto LABEL_11;
  }
  -[UIKBInputDelegateManager asyncCapableInputDelegate](self, "asyncCapableInputDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unobscuredContentRect");
  x = v8;
  y = v10;
  width = v12;
  height = v14;

  -[UIKBInputDelegateManager textInteractionAssistant](self, "textInteractionAssistant");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isEditing");

  if (v18)
  {
    -[UIKBInputDelegateManager keyboardStateDelegate](self, "keyboardStateDelegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBInputDelegateManager textInputView](self, "textInputView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "subtractKeyboardFrameFromRect:inView:", v20, x, y, width, height);
    x = v21;
    y = v22;
    width = v23;
    height = v24;

LABEL_11:
  }
LABEL_12:
  v33 = x;
  v34 = y;
  v35 = width;
  v36 = height;
  result.size.height = v36;
  result.size.width = v35;
  result.origin.y = v34;
  result.origin.x = v33;
  return result;
}

+ (_NSRange)rangeForTextRange:(id)a3 document:(id)a4
{
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSUInteger v12;
  NSUInteger v13;
  _NSRange result;

  v4 = a3;
  if (a3)
  {
    v5 = a4;
    v6 = v4;
    objc_msgSend(v5, "beginningOfDocument");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "start");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (id)objc_msgSend(v5, "offsetFromPosition:toPosition:", v7, v8);

    objc_msgSend(v6, "start");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "end");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(v5, "offsetFromPosition:toPosition:", v9, v10);
  }
  else
  {
    v11 = 0;
  }
  v12 = (NSUInteger)v4;
  v13 = v11;
  result.length = v13;
  result.location = v12;
  return result;
}

- (BOOL)shouldDeleteForward
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _BOOL8 v9;
  _BOOL8 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;

  -[UIKBInputDelegateManager legacyInputDelegate](self, "legacyInputDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0)
  {
    -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_opt_respondsToSelector();

    if ((v20 & 1) != 0)
    {
      -[UIKBInputDelegateManager selectedTextRange](self, "selectedTextRange");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v16, "isEmpty"))
      {
        -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "end");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIKBInputDelegateManager endOfDocument](self, "endOfDocument");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v21, "comparePosition:toPosition:", v22, v23);

        if (v24)
        {
          -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "end");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "positionFromPosition:offset:", v26, 1);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          if (v27)
          {
            -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "start");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "textRangeFromPosition:toPosition:", v29, v27);
            v30 = objc_claimAutoreleasedReturnValue();

            v16 = v28;
          }
          else
          {
            v30 = 0;
          }

          v16 = (void *)v30;
        }
      }
      if (!v16)
      {
        LOBYTE(v10) = 1;
        goto LABEL_17;
      }
      -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "shouldChangeTextInRange:replacementText:", v16, &stru_1E16EDF20);
LABEL_16:
      LOBYTE(v10) = v18;

LABEL_17:
      return v10;
    }
    goto LABEL_11;
  }
  v5 = (void *)objc_opt_class();
  -[UIKBInputDelegateManager selectedTextRange](self, "selectedTextRange");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "rangeForTextRange:document:", v6, v7);
  v10 = v9;

  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_11:
    LOBYTE(v10) = 1;
    return v10;
  }
  if (v10)
    goto LABEL_5;
  -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBInputDelegateManager selectedTextRange](self, "selectedTextRange");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "end");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBInputDelegateManager endOfDocument](self, "endOfDocument");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v11, "comparePosition:toPosition:", v13, v14);

  v10 = 1;
  if (v15)
  {
LABEL_5:
    -[UIKBInputDelegateManager legacyInputDelegate](self, "legacyInputDelegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBInputDelegateManager legacyInputDelegate](self, "legacyInputDelegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "keyboardInput:shouldReplaceTextInRange:replacementText:", v17, v8, v10, &stru_1E16EDF20);
    goto LABEL_16;
  }
  return v10;
}

- (BOOL)selectionIsEndOfWord
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  -[UIKBInputDelegateManager selectedTextRange](self, "selectedTextRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && (objc_msgSend(v3, "_isRanged") & 1) == 0)
  {
    -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "start");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_rangeOfEnclosingWord:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "end");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "end");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "comparePosition:toPosition:", v10, v11))
      {
        v5 = 0;
      }
      else
      {
        -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "textInRange:", v8);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = objc_msgSend(v13, "length") != 0;

      }
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

- (void)collapseSelectionAndAdjustByOffset:(int64_t)a3
{
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  char v20;
  id v21;

  -[UIKBInputDelegateManager keyboardStateDelegate](self, "keyboardStateDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShouldIgnoreTextInputChanges:", 1);

  if (!-[UIKBInputDelegateManager hasAsyncCapableInputDelegate](self, "hasAsyncCapableInputDelegate"))
  {
    -[UIKBInputDelegateManager selectedTextRange](self, "selectedTextRange");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "end");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (a3 && v10)
    {
      -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "positionFromPosition:offset:", v10, a3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        v13 = v12;

        v10 = v13;
      }

    }
    else if (!v10)
    {
LABEL_17:

      goto LABEL_18;
    }
    -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "textRangeFromPosition:toPosition:", v10, v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      -[UIKBInputDelegateManager setSelectedTextRange:](self, "setSelectedTextRange:", v15);
      -[UIKBInputDelegateManager keyboardStateDelegate](self, "keyboardStateDelegate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "syncDocumentStateToInputDelegate");

    }
    goto LABEL_17;
  }
  -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:
    v10 = v8;
    objc_msgSend(v8, "moveByOffset:", a3);
    goto LABEL_17;
  }
  -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_opt_respondsToSelector();

  if ((v18 & 1) != 0)
  {
    -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  -[UIKBInputDelegateManager asyncWebKitInteractionDelegate](self, "asyncWebKitInteractionDelegate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_opt_respondsToSelector();

  if ((v20 & 1) != 0)
  {
    -[UIKBInputDelegateManager asyncWebKitInteractionDelegate](self, "asyncWebKitInteractionDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
LABEL_18:
  -[UIKBInputDelegateManager keyboardStateDelegate](self, "keyboardStateDelegate");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setShouldIgnoreTextInputChanges:", 0);

}

- (void)moveSelectionToEndOfWord
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  -[UIKBInputDelegateManager selectedTextRange](self, "selectedTextRange");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "end");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_rangeOfEnclosingWord:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "end");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "end");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v6, "comparePosition:toPosition:", v7, v8);

      if (v9 == -1)
      {
        -[UIKBInputDelegateManager keyboardStateDelegate](self, "keyboardStateDelegate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setShouldIgnoreTextInputChanges:", 1);

        -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "end");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "end");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "textRangeFromPosition:toPosition:", v12, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIKBInputDelegateManager setSelectedTextRange:](self, "setSelectedTextRange:", v14);

        -[UIKBInputDelegateManager keyboardStateDelegate](self, "keyboardStateDelegate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "syncDocumentStateToInputDelegate");

        -[UIKBInputDelegateManager keyboardStateDelegate](self, "keyboardStateDelegate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setShouldIgnoreTextInputChanges:", 0);

      }
    }
  }
  else
  {
    v5 = 0;
  }

}

- (BOOL)selectionIsWord
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  -[UIKBInputDelegateManager selectedTextRange](self, "selectedTextRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "start");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBInputDelegateManager beginningOfDocument](self, "beginningOfDocument");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "comparePosition:toPosition:", v5, v6))
  {
    -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "tokenizer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "start");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isPosition:atBoundary:inDirection:", v9, 1, 1);

    if (!v10)
    {
      v11 = 0;
      goto LABEL_9;
    }
  }
  else
  {

  }
  -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "end");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBInputDelegateManager endOfDocument](self, "endOfDocument");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "comparePosition:toPosition:", v13, v14))
  {
    -[UIKBInputDelegateManager textInputDelegate](self, "textInputDelegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "tokenizer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "end");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v16, "isPosition:atBoundary:inDirection:", v17, 1, 0);

  }
  else
  {
    v11 = 1;
  }

LABEL_9:
  return v11;
}

- (void)shiftKeyStateChangedFrom:(int)a3 to:(int)a4
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  char v14;
  void *v15;
  unint64_t v16;
  unint64_t v17;
  id v18;

  -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (a3 == 3)
      v8 = 2;
    else
      v8 = a3 == 1;
    if (a4 == 3)
      v9 = 2;
    else
      v9 = a4 == 1;
    if (v8 != v9)
    {
      -[UIKBInputDelegateManager webInputDelegate](self, "webInputDelegate");
      v18 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "shiftKeyStateChangedFromState:toState:", v8, v9);
LABEL_27:

    }
  }
  else
  {
    -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      -[UIKBInputDelegateManager privateInputDelegate](self, "privateInputDelegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_opt_respondsToSelector();

      if ((v14 & 1) == 0)
        return;
      -[UIKBInputDelegateManager privateInputDelegate](self, "privateInputDelegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (a3 == 3)
        v16 = 0x10000;
      else
        v16 = (unint64_t)(a3 == 1) << 17;
      if (a4 == 3)
        v17 = 0x10000;
      else
        v17 = (unint64_t)(a4 == 1) << 17;
      v18 = v15;
      objc_msgSend(v15, "modifierFlagsDidChangeFrom:to:", v16, v17);
      goto LABEL_27;
    }
    if (a3 == 3)
      v11 = 2;
    else
      v11 = a3 == 1;
    if (a4 == 3)
      v12 = 2;
    else
      v12 = a4 == 1;
    if (v11 != v12)
    {
      -[UIKBInputDelegateManager asyncInputDelegate](self, "asyncInputDelegate");
      v18 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "shiftKeyStateChangedFrom:to:", v11, v12);
      goto LABEL_27;
    }
  }
}

- (UIKeyboardImplStateProtocol)keyboardStateDelegate
{
  return (UIKeyboardImplStateProtocol *)objc_loadWeakRetained((id *)&self->_keyboardStateDelegate);
}

- (void)setKeyInputDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_keyInputDelegate, a3);
}

- (void)setSelectableDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_selectableDelegate, a3);
}

- (BOOL)insideKeyInputDelegateCall
{
  return self->_insideKeyInputDelegateCall;
}

- (void)setInsideKeyInputDelegateCall:(BOOL)a3
{
  self->_insideKeyInputDelegateCall = a3;
}

- (void)setAsyncInputDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_asyncInputDelegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asyncInputDelegate, 0);
  objc_destroyWeak((id *)&self->_forwardingInputDelegate);
  objc_storeStrong((id *)&self->_selectableDelegate, 0);
  objc_storeStrong((id *)&self->_keyInputDelegate, 0);
  objc_destroyWeak((id *)&self->_keyboardStateDelegate);
}

@end
