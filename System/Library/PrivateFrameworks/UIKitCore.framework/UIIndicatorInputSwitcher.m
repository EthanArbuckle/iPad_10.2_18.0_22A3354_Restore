@implementation UIIndicatorInputSwitcher

- (BOOL)isVisible
{
  return self->super.super.m_state != 0;
}

- (BOOL)isVisibleOrHiding
{
  void *v2;
  BOOL v3;

  -[UIIndicatorInputSwitcher inputModeSelectorAssertion](self, "inputModeSelectorAssertion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)dismissSwitcher:(BOOL)a3
{
  void *v4;
  void *v5;

  -[UIIndicatorInputSwitcher inputModeSelectorAssertion](self, "inputModeSelectorAssertion", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  -[UIIndicatorInputSwitcher setInputModeSelectorAssertion:](self, "setInputModeSelectorAssertion:", 0);
  -[UIIndicatorInputSwitcher inputModeAssertion](self, "inputModeAssertion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidate");

  -[UIIndicatorInputSwitcher setInputModeAssertion:](self, "setInputModeAssertion:", 0);
}

- (void)dismissSwitcherWithDelay:(double)a3
{
  dispatch_time_t v4;
  _QWORD block[5];

  self->super.super.m_state = 0;
  v4 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__UIIndicatorInputSwitcher_dismissSwitcherWithDelay___block_invoke;
  block[3] = &unk_1E16B1B28;
  block[4] = self;
  dispatch_after(v4, MEMORY[0x1E0C80D38], block);
}

uint64_t __53__UIIndicatorInputSwitcher_dismissSwitcherWithDelay___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissSwitcher:", 0);
}

- (BOOL)switchMode:(id)a3 withHUD:(BOOL)a4 withDelay:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  void *v8;
  uint64_t v9;
  int m_state;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL8 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v25[2];
  _QWORD v26[3];

  v5 = a4;
  v26[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  -[UIInlineInputSwitcher updateInputModes:withHUD:](self, "updateInputModes:withHUD:", v7, v5);
  -[UIInlineInputSwitcher availableInputModes](self, "availableInputModes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (!v9)
    goto LABEL_13;
  -[UIInputSwitcher setLoadedIdentifier:](self, "setLoadedIdentifier:", v7);
  m_state = self->super.super.m_state;
  if (m_state != 2)
  {
    if (m_state != 1)
    {
      if (!m_state)
      {
        -[UIInputSwitcher touchShowSwitcherTimer](self, "touchShowSwitcherTimer");
        self->super.super.m_state = 1;
      }
      goto LABEL_8;
    }
    self->super.super.m_state = 2;
  }
  -[UIInputSwitcher cancelShowSwitcherTimer](self, "cancelShowSwitcherTimer");
LABEL_8:
  -[UIIndicatorInputSwitcher inputModeAssertion](self, "inputModeAssertion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_activeAssertionController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "activeInputModeAssertionWithReason:", CFSTR("UIInputSwitcher"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIIndicatorInputSwitcher setInputModeAssertion:](self, "setInputModeAssertion:", v14);

  }
  -[UIIndicatorInputSwitcher inputModeSelectorAssertion](self, "inputModeSelectorAssertion");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    v16 = +[UIDictationController isRunning](UIDictationController, "isRunning");
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "_activeAssertionController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = CFSTR("_UITextCursorKeyboardIndicatorUserInfoKey");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v25[1] = CFSTR("_UITextCursorInputModeSwitcherUserInfoKey");
    v26[0] = v19;
    v26[1] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "inputModeSelectorAssertionWithReason:userInfo:", CFSTR("UIInputSwticher"), v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIIndicatorInputSwitcher setInputModeSelectorAssertion:](self, "setInputModeSelectorAssertion:", v21);

  }
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "_activeAssertionController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "_updateSubjectWithAssertionState");

LABEL_13:
  return v9 != 0;
}

- (UITextCursorAssertion)inputModeSelectorAssertion
{
  return self->_inputModeSelectorAssertion;
}

- (void)setInputModeSelectorAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_inputModeSelectorAssertion, a3);
}

- (UITextCursorAssertion)inputModeAssertion
{
  return self->_inputModeAssertion;
}

- (void)setInputModeAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_inputModeAssertion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputModeAssertion, 0);
  objc_storeStrong((id *)&self->_inputModeSelectorAssertion, 0);
}

@end
