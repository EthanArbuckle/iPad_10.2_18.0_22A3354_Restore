@implementation UIDictationTipModelessInputHandler

- (UIDictationTipModelessInputHandler)initWithDelegate:(id)a3
{
  id v4;
  UIDictationTipModelessInputHandler *v5;
  UIDictationTipModelessInputHandler *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UIDictationTipModelessInputHandler;
  v5 = -[UIDictationTipModelessInputHandler init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[UIDictationTipModelessInputHandler setDelegate:](v5, "setDelegate:", v4);
  -[UIDictationTipModelessInputHandler resetDictationTipModelessHandlerSignalFlags](v6, "resetDictationTipModelessHandlerSignalFlags");

  return v6;
}

- (void)setShouldAttemptToShowModelessTip:(BOOL)a3
{
  self->_shouldAttemptToShowModelessTip = a3;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)resetDictationTipModelessHandlerSignalFlags
{
  -[UIDictationTipModelessInputHandler setModelessInputTipDictationStoppedSignal:](self, "setModelessInputTipDictationStoppedSignal:", 0);
  -[UIDictationTipModelessInputHandler setSoftwareKeyboardInteractionAfterDictationStoppedSignal:](self, "setSoftwareKeyboardInteractionAfterDictationStoppedSignal:", 0);
  -[UIDictationTipModelessInputHandler setShouldAttemptToShowModelessTip:](self, "setShouldAttemptToShowModelessTip:", 0);
}

- (void)setSoftwareKeyboardInteractionAfterDictationStoppedSignal:(BOOL)a3
{
  self->_softwareKeyboardInteractionAfterDictationStoppedSignal = a3;
}

- (void)setModelessInputTipDictationStoppedSignal:(BOOL)a3
{
  self->_modelessInputTipDictationStoppedSignal = a3;
}

- (void)processSoftwareKeyboardInteraction
{
  void *v3;
  char v4;

  -[UIDictationTipModelessInputHandler delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "dictationTipShown:", 6);

  if ((v4 & 1) == 0)
  {
    if (-[UIDictationTipModelessInputHandler modelessInputTipDictationStoppedSignal](self, "modelessInputTipDictationStoppedSignal"))
    {
      -[UIDictationTipModelessInputHandler setSoftwareKeyboardInteractionAfterDictationStoppedSignal:](self, "setSoftwareKeyboardInteractionAfterDictationStoppedSignal:", 1);
    }
  }
}

- (void)processUserInteractionEnded
{
  void *v3;
  char v4;

  -[UIDictationTipModelessInputHandler delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "dictationTipShown:", 6);

  if ((v4 & 1) == 0)
  {
    if (-[UIDictationTipModelessInputHandler modelessInputTipDictationStoppedSignal](self, "modelessInputTipDictationStoppedSignal"))
    {
      -[UIDictationTipModelessInputHandler userInteractionEndedDuringModelessInputTipDictationStoppedSignal](self, "userInteractionEndedDuringModelessInputTipDictationStoppedSignal");
    }
  }
}

- (void)userInteractionEndedDuringModelessInputTipDictationStoppedSignal
{
  -[UIDictationTipModelessInputHandler triggerAttemptToShowModelessTipFlag](self, "triggerAttemptToShowModelessTipFlag");
  if (-[UIDictationTipModelessInputHandler shouldShowModelessInputTip](self, "shouldShowModelessInputTip"))
    -[UIDictationTipModelessInputHandler showModelessInputTip](self, "showModelessInputTip");
}

- (void)triggerAttemptToShowModelessTipFlag
{
  if (-[UIDictationTipModelessInputHandler softwareKeyboardInteractionAfterDictationStoppedSignal](self, "softwareKeyboardInteractionAfterDictationStoppedSignal")&& -[UIDictationTipModelessInputHandler modelessInputTipDictationStoppedSignal](self, "modelessInputTipDictationStoppedSignal"))
  {
    -[UIDictationTipModelessInputHandler setShouldAttemptToShowModelessTip:](self, "setShouldAttemptToShowModelessTip:", 1);
  }
  else
  {
    -[UIDictationTipModelessInputHandler resetDictationTipModelessHandlerSignalFlags](self, "resetDictationTipModelessHandlerSignalFlags");
  }
}

- (BOOL)shouldShowModelessInputTip
{
  void *v3;
  int v4;
  void *v5;
  char v6;
  char v7;

  if (+[UIKeyboard isModelessActive](UIKeyboard, "isModelessActive")
    && (+[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController"), v3 = (void *)objc_claimAutoreleasedReturnValue(), v4 = objc_msgSend(v3, "BOOLForPreferenceKey:", CFSTR("DictationCommandTipsEnabled")), v3, v4))
  {
    +[UIDictationController activeInstance](UIDictationController, "activeInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "shouldSuppressSoftwareKeyboard");

    v7 = v6 ^ 1;
  }
  else
  {
    v7 = 0;
  }
  return v7 & -[UIDictationTipModelessInputHandler shouldAttemptToShowModelessTip](self, "shouldAttemptToShowModelessTip");
}

- (void)showModelessInputTip
{
  void *v3;
  void *v4;
  id v5;

  _UILocalizedString(CFSTR("ModelessInputTipTitle"), (uint64_t)CFSTR("Type and Speak"), CFSTR("Type and Speak"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  _UILocalizedString(CFSTR("ModelessInputTipDescription"), (uint64_t)CFSTR("You can edit text with the keyboard while you dictate."), CFSTR("You can edit text with the keyboard while you dictate."));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIDictationTipModelessInputHandler delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "finalizeTextWithTipType:title:andTipDescription:", 6, v5, v3);

  -[UIDictationTipModelessInputHandler resetDictationTipModelessHandlerSignalFlags](self, "resetDictationTipModelessHandlerSignalFlags");
}

- (UIDictationTipHandlerDelegate)delegate
{
  return (UIDictationTipHandlerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)modelessInputTipDictationStoppedSignal
{
  return self->_modelessInputTipDictationStoppedSignal;
}

- (BOOL)softwareKeyboardInteractionAfterDictationStoppedSignal
{
  return self->_softwareKeyboardInteractionAfterDictationStoppedSignal;
}

- (BOOL)shouldAttemptToShowModelessTip
{
  return self->_shouldAttemptToShowModelessTip;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
