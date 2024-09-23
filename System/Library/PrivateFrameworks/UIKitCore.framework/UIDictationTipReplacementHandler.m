@implementation UIDictationTipReplacementHandler

- (UIDictationTipReplacementHandler)initWithDelegate:(id)a3
{
  id v4;
  UIDictationTipReplacementHandler *v5;
  UIDictationTipReplacementHandler *v6;
  UIDelayedAction *v7;
  UIDelayedAction *finalizeAction;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UIDictationTipReplacementHandler;
  v5 = -[UIDictationTipReplacementHandler init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    -[UIDictationTipReplacementHandler setDelegate:](v5, "setDelegate:", v4);
    v7 = -[UIDelayedAction initWithTarget:action:userInfo:delay:]([UIDelayedAction alloc], "initWithTarget:action:userInfo:delay:", v6, sel_finalizeRecordedText, 0, 1.0);
    finalizeAction = v6->_finalizeAction;
    v6->_finalizeAction = v7;

    -[UIDictationTipReplacementHandler resetHandler](v6, "resetHandler");
  }

  return v6;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)resetHandler
{
  NSString *replacementTargetText;
  NSMutableString *v4;
  NSMutableString *replacementText;

  replacementTargetText = self->_replacementTargetText;
  self->_replacementTargetText = (NSString *)&stru_1E16EDF20;

  v4 = (NSMutableString *)objc_alloc_init(MEMORY[0x1E0CB37A0]);
  replacementText = self->_replacementText;
  self->_replacementText = v4;

  -[UIDelayedAction cancel](self->_finalizeAction, "cancel");
  self->_textRecorderStatus = 0;
}

- (void)startRecodingText:(id)a3
{
  id WeakRetained;
  uint64_t v5;
  id v6;
  NSString *v7;
  NSString *replacementTargetText;
  id v9;

  v9 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_msgSend(WeakRetained, "getDictationTipSignaled");

  if (!v5)
  {
    -[UIDictationTipReplacementHandler resetHandler](self, "resetHandler");
    v6 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v6, "replaceEmojiInStringWithEmojiDictationCommand:", v9);
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    replacementTargetText = self->_replacementTargetText;
    self->_replacementTargetText = v7;

    self->_textRecorderStatus = 1;
  }

}

- (void)recordDictationTipText:(id)a3
{
  id WeakRetained;
  int64_t textRecorderStatus;
  id v6;

  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_msgSend(WeakRetained, "getDictationTipSignaled"))
  {

  }
  else
  {
    textRecorderStatus = self->_textRecorderStatus;

    if (textRecorderStatus != 2)
    {
      -[UIDelayedAction unschedule](self->_finalizeAction, "unschedule");
      -[NSMutableString appendString:](self->_replacementText, "appendString:", v6);
      self->_textRecorderStatus = 1;
      -[UIDelayedAction touch](self->_finalizeAction, "touch");
    }
  }

}

- (void)finalizeRecordedText
{
  void *v3;
  int v4;
  NSString *replacementTargetText;
  id WeakRetained;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  self->_textRecorderStatus = 2;
  _UILocalizedString(CFSTR("Dictation Replacement Tip Body Standard"), (uint64_t)CFSTR("Standard description of the Replacement tip"), CFSTR("To edit text while dictating, just say 'Change... to...'"));
  v16 = (id)objc_claimAutoreleasedReturnValue();
  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLForPreferenceKey:", CFSTR("DictationTipContextual"));

  if (v4)
  {
    replacementTargetText = self->_replacementTargetText;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "replaceEmojiInStringWithEmojiDictationCommand:", self->_replacementText);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    _UILocalizedFormat(CFSTR("Dictation Replacement Tip Body Contextual"), (uint64_t)CFSTR("Contextual description of the Replacement tip"), CFSTR("To edit your message while you dictate, say “Replace ‘%@’ with ‘%@'"), v7, v8, v9, v10, v11, (uint64_t)replacementTargetText);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[UIDictationTipReplacementHandler delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  _UILocalizedString(CFSTR("Dictation Replacement Tip Title"), (uint64_t)CFSTR("Title of the Replacement tip"), CFSTR("Replace Text"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "finalizeTextWithTipType:title:andTipDescription:", 0, v14, v16);

}

- (UIDictationTipHandlerDelegate)delegate
{
  return (UIDictationTipHandlerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSString)replacementTargetText
{
  return self->_replacementTargetText;
}

- (void)setReplacementTargetText:(id)a3
{
  objc_storeStrong((id *)&self->_replacementTargetText, a3);
}

- (NSMutableString)replacementText
{
  return self->_replacementText;
}

- (void)setReplacementText:(id)a3
{
  objc_storeStrong((id *)&self->_replacementText, a3);
}

- (UIDelayedAction)finalizeAction
{
  return self->_finalizeAction;
}

- (void)setFinalizeAction:(id)a3
{
  objc_storeStrong((id *)&self->_finalizeAction, a3);
}

- (int64_t)textRecorderStatus
{
  return self->_textRecorderStatus;
}

- (void)setTextRecorderStatus:(int64_t)a3
{
  self->_textRecorderStatus = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finalizeAction, 0);
  objc_storeStrong((id *)&self->_replacementText, 0);
  objc_storeStrong((id *)&self->_replacementTargetText, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
