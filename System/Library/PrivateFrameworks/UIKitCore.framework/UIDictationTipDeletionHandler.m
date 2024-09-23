@implementation UIDictationTipDeletionHandler

- (UIDictationTipDeletionHandler)initWithDelegate:(id)a3
{
  id v4;
  UIDictationTipDeletionHandler *v5;
  UIDictationTipDeletionHandler *v6;
  UIDelayedAction *v7;
  UIDelayedAction *finalizeAction;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UIDictationTipDeletionHandler;
  v5 = -[UIDictationTipDeletionHandler init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    -[UIDictationTipDeletionHandler setDelegate:](v5, "setDelegate:", v4);
    -[UIDictationTipDeletionHandler resetDeletionEventCount](v6, "resetDeletionEventCount");
    v7 = -[UIDelayedAction initWithTarget:action:userInfo:delay:]([UIDelayedAction alloc], "initWithTarget:action:userInfo:delay:", v6, sel_finalizeRecordedText, 0, 1.0);
    finalizeAction = v6->_finalizeAction;
    v6->_finalizeAction = v7;

    -[UIDictationTipDeletionHandler resetHandler](v6, "resetHandler");
  }

  return v6;
}

- (void)resetDeletionEventCount
{
  NSMutableString *v3;
  NSMutableString *cachedDeletedText;

  self->_deletionEventCount = 0;
  v3 = (NSMutableString *)objc_alloc_init(MEMORY[0x1E0CB37A0]);
  cachedDeletedText = self->_cachedDeletedText;
  self->_cachedDeletedText = v3;

}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)resetRecorder
{
  NSMutableString *v3;
  NSMutableString *deletionText;

  v3 = (NSMutableString *)objc_alloc_init(MEMORY[0x1E0CB37A0]);
  deletionText = self->_deletionText;
  self->_deletionText = v3;

  -[UIDelayedAction cancel](self->_finalizeAction, "cancel");
  self->_textRecorderStatus = 0;
}

- (void)resetHandler
{
  -[UIDictationTipDeletionHandler resetDeletionEventCount](self, "resetDeletionEventCount");
  -[UIDictationTipDeletionHandler resetRecorder](self, "resetRecorder");
}

- (void)setlastDeletionRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  int v6;

  length = a3.length;
  location = a3.location;
  v6 = LODWORD(a3.location) - LODWORD(self->_lastSelectedDeletionRange.location);
  if (v6 < 0)
    v6 = LODWORD(self->_lastSelectedDeletionRange.location) - LODWORD(a3.location);
  if (v6 >= 2)
    -[UIDictationTipDeletionHandler resetDeletionEventCount](self, "resetDeletionEventCount");
  self->_lastSelectedDeletionRange.location = location;
  self->_lastSelectedDeletionRange.length = length;
}

- (void)addDeletionEventCount:(id)a3 deletedTextRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  NSMutableString *cachedDeletedText;
  id v8;

  if (a3)
  {
    length = a4.length;
    location = a4.location;
    v8 = a3;
    -[UIDictationTipDeletionHandler setlastDeletionRange:](self, "setlastDeletionRange:", location, length);
    cachedDeletedText = self->_cachedDeletedText;
    ++self->_deletionEventCount;
    -[NSMutableString insertString:atIndex:](cachedDeletedText, "insertString:atIndex:", v8, 0);

  }
}

- (int64_t)currentDeletionEventCount
{
  return self->_deletionEventCount;
}

- (void)startRecodingText:(id)a3
{
  id WeakRetained;
  uint64_t v5;
  NSMutableString *v6;
  NSMutableString *deletionText;
  id v8;

  v8 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_msgSend(WeakRetained, "getDictationTipSignaled");

  if (v5 == 1)
  {
    -[UIDictationTipDeletionHandler resetRecorder](self, "resetRecorder");
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", self->_cachedDeletedText);
    v6 = (NSMutableString *)objc_claimAutoreleasedReturnValue();
    deletionText = self->_deletionText;
    self->_deletionText = v6;

    if ((unint64_t)objc_msgSend(v8, "length") >= 2)
      -[UIDictationTipDeletionHandler recordDictationTipText:](self, "recordDictationTipText:", v8);
  }

}

- (void)recordDictationTipText:(id)a3
{
  id WeakRetained;
  int64_t textRecorderStatus;
  id v6;

  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_msgSend(WeakRetained, "getDictationTipSignaled") == 1)
  {
    textRecorderStatus = self->_textRecorderStatus;

    if (textRecorderStatus != 2)
    {
      -[UIDelayedAction unschedule](self->_finalizeAction, "unschedule");
      -[NSMutableString insertString:atIndex:](self->_deletionText, "insertString:atIndex:", v6, 0);
      self->_textRecorderStatus = 1;
      -[UIDelayedAction touch](self->_finalizeAction, "touch");
    }
  }
  else
  {

  }
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
  _UILocalizedString(CFSTR("Dictation Deletion Tip Body Standard"), (uint64_t)CFSTR("Standard Description of the deletion tip"), CFSTR("While dictating, just say 'Delete...'"));
  v15 = (id)objc_claimAutoreleasedReturnValue();
  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "BOOLForPreferenceKey:", CFSTR("DictationTipContextual")) & 1) != 0)
  {

LABEL_4:
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "replaceEmojiInStringWithEmojiDictationCommand:", self->_deletionText);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _UILocalizedFormat(CFSTR("Dictation Deletion Tip Body Contextual"), (uint64_t)CFSTR("Contextual Description of the deletion tip"), CFSTR("While you dictate, say Delete ‘%@’"), v7, v8, v9, v10, v11, (uint64_t)v6);
    v12 = objc_claimAutoreleasedReturnValue();

    v15 = (id)v12;
    goto LABEL_5;
  }
  v4 = -[NSMutableString _containsEmojiOnly](self->_deletionText, "_containsEmojiOnly");

  if ((v4 & 1) != 0)
    goto LABEL_4;
LABEL_5:
  -[UIDictationTipDeletionHandler delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  _UILocalizedString(CFSTR("Dictation Deletion Tip Title"), (uint64_t)CFSTR("Title of the deletion tip"), CFSTR("Delete Text"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "finalizeTextWithTipType:title:andTipDescription:", 1, v14, v15);

  -[UIDictationTipDeletionHandler resetDeletionEventCount](self, "resetDeletionEventCount");
}

- (UIDictationTipHandlerDelegate)delegate
{
  return (UIDictationTipHandlerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSMutableString)deletionText
{
  return self->_deletionText;
}

- (void)setDeletionText:(id)a3
{
  objc_storeStrong((id *)&self->_deletionText, a3);
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

- (_NSRange)lastSelectedDeletionRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_lastSelectedDeletionRange.length;
  location = self->_lastSelectedDeletionRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setLastSelectedDeletionRange:(_NSRange)a3
{
  self->_lastSelectedDeletionRange = a3;
}

- (int64_t)deletionEventCount
{
  return self->_deletionEventCount;
}

- (void)setDeletionEventCount:(int64_t)a3
{
  self->_deletionEventCount = a3;
}

- (NSMutableString)cachedDeletedText
{
  return self->_cachedDeletedText;
}

- (void)setCachedDeletedText:(id)a3
{
  objc_storeStrong((id *)&self->_cachedDeletedText, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedDeletedText, 0);
  objc_storeStrong((id *)&self->_finalizeAction, 0);
  objc_storeStrong((id *)&self->_deletionText, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
