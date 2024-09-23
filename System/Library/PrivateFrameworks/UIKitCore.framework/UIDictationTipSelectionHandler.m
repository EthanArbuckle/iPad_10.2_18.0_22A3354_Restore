@implementation UIDictationTipSelectionHandler

- (UIDictationTipSelectionHandler)initWithDelegate:(id)a3
{
  id v4;
  UIDictationTipSelectionHandler *v5;
  UIDictationTipSelectionHandler *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UIDictationTipSelectionHandler;
  v5 = -[UIDictationTipSelectionHandler init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[UIDictationTipSelectionHandler setDelegate:](v5, "setDelegate:", v4);

  return v6;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)signalSelectedText:(id)a3
{
  id WeakRetained;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;

  v17 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_msgSend(WeakRetained, "getDictationTipSignaled");

  if (v5 == 4)
  {
    _UILocalizedString(CFSTR("Dictation Selection Tip Body Standard"), (uint64_t)CFSTR("Standard description of selection tip"), CFSTR("While you dictate, say something like “Select 'see you later.'”"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "BOOLForPreferenceKey:", CFSTR("DictationTipContextual")) & 1) != 0)
    {

    }
    else
    {
      v8 = objc_msgSend(v17, "_containsEmojiOnly");

      if ((v8 & 1) == 0)
      {
LABEL_6:
        -[UIDictationTipSelectionHandler setSelectionText:](self, "setSelectionText:", v6);

        goto LABEL_7;
      }
    }
    v9 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v9, "replaceEmojiInStringWithEmojiDictationCommand:", v17);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    _UILocalizedFormat(CFSTR("Dictation Selection Tip Body Contextual"), (uint64_t)CFSTR("Contexual description of selection tip"), CFSTR("While you dictate, say Select ‘%@’"), v11, v12, v13, v14, v15, (uint64_t)v10);
    v16 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v16;
    goto LABEL_6;
  }
LABEL_7:

}

- (void)finalizeSelectionTip
{
  void *v3;
  id v4;

  -[UIDictationTipSelectionHandler delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  _UILocalizedString(CFSTR("Dictation Selection Tip Title"), (uint64_t)CFSTR("Title of the selection tip"), CFSTR("Select Text"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "finalizeTextWithTipType:title:andTipDescription:", 4, v3, self->_selectionText);

}

- (UIDictationTipHandlerDelegate)delegate
{
  return (UIDictationTipHandlerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSString)selectionText
{
  return self->_selectionText;
}

- (void)setSelectionText:(id)a3
{
  objc_storeStrong((id *)&self->_selectionText, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionText, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
