@implementation UIDictationTipInsertionHandler

- (UIDictationTipInsertionHandler)initWithDelegate:(id)a3
{
  id v4;
  UIDictationTipInsertionHandler *v5;
  UIDictationTipInsertionHandler *v6;
  UIDelayedAction *v7;
  UIDelayedAction *finalizeAction;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UIDictationTipInsertionHandler;
  v5 = -[UIDictationTipInsertionHandler init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    -[UIDictationTipInsertionHandler setDelegate:](v5, "setDelegate:", v4);
    v7 = -[UIDelayedAction initWithTarget:action:userInfo:delay:]([UIDelayedAction alloc], "initWithTarget:action:userInfo:delay:", v6, sel_finalizeRecordedText, 0, 1.0);
    finalizeAction = v6->_finalizeAction;
    v6->_finalizeAction = v7;

    -[UIDictationTipInsertionHandler resetHandler](v6, "resetHandler");
  }

  return v6;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)resetHandler
{
  NSMutableString *v3;
  NSMutableString *insertionText;

  v3 = (NSMutableString *)objc_alloc_init(MEMORY[0x1E0CB37A0]);
  insertionText = self->_insertionText;
  self->_insertionText = v3;

  self->_textRecorderStatus = 0;
  -[UIDelayedAction cancel](self->_finalizeAction, "cancel");
}

- (void)finalizeRecordedText
{
  void *v3;
  char v4;
  id WeakRetained;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;

  self->_textRecorderStatus = 2;
  _UILocalizedString(CFSTR("Dictation Insertion Tip Body Standard"), (uint64_t)CFSTR("Standard description of the Insertion tip"), CFSTR("While you dictate, say something like Insert ”’super’ before 'happy'“"));
  v15 = (id)objc_claimAutoreleasedReturnValue();
  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "BOOLForPreferenceKey:", CFSTR("DictationTipContextual")) & 1) != 0)
  {

LABEL_4:
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "replaceEmojiInStringWithEmojiDictationCommand:", self->_insertionText);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _UILocalizedFormat(CFSTR("Dictation Insertion Tip Body Contextual"), (uint64_t)CFSTR("Contextual description of the Insertion tip"), CFSTR("While you dictate, say Insert '%@'"), v7, v8, v9, v10, v11, (uint64_t)v6);
    v12 = objc_claimAutoreleasedReturnValue();

    v15 = (id)v12;
    goto LABEL_5;
  }
  v4 = -[NSMutableString _containsEmojiOnly](self->_insertionText, "_containsEmojiOnly");

  if ((v4 & 1) != 0)
    goto LABEL_4;
LABEL_5:
  -[UIDictationTipInsertionHandler delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  _UILocalizedString(CFSTR("Dictation Insertion Tip Title"), (uint64_t)CFSTR("Title of the Insertion tip"), CFSTR("Insert Text"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "finalizeTextWithTipType:title:andTipDescription:", 2, v14, v15);

}

- (void)recordDictationTipText:(id)a3
{
  id WeakRetained;
  int64_t textRecorderStatus;
  id v6;

  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_msgSend(WeakRetained, "getDictationTipSignaled") == 2)
  {
    textRecorderStatus = self->_textRecorderStatus;

    if (textRecorderStatus != 2)
    {
      -[UIDelayedAction unschedule](self->_finalizeAction, "unschedule");
      -[NSMutableString appendString:](self->_insertionText, "appendString:", v6);
      self->_textRecorderStatus = 1;
      -[UIDelayedAction touch](self->_finalizeAction, "touch");
    }
  }
  else
  {

  }
}

- (void)startRecodingText:(id)a3
{
  id WeakRetained;
  uint64_t v5;
  id v6;

  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_msgSend(WeakRetained, "getDictationTipSignaled");

  if (v5 == 2)
  {
    -[UIDictationTipInsertionHandler resetHandler](self, "resetHandler");
    -[UIDictationTipInsertionHandler recordDictationTipText:](self, "recordDictationTipText:", v6);
  }

}

- (UIDictationTipHandlerDelegate)delegate
{
  return (UIDictationTipHandlerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSMutableString)insertionText
{
  return self->_insertionText;
}

- (void)setInsertionText:(id)a3
{
  objc_storeStrong((id *)&self->_insertionText, a3);
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
  objc_storeStrong((id *)&self->_insertionText, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
