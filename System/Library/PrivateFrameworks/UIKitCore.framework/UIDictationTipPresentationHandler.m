@implementation UIDictationTipPresentationHandler

- (UIDictationTipPresentationHandler)init
{
  UIDictationTipPresentationHandler *v2;
  UIDictationTipPresentationHandler *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIDictationTipPresentationHandler;
  v2 = -[UIDictationTipPresentationHandler init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_isShowingTip = 0;
    -[UIDictationTipPresentationHandler resetHandler](v2, "resetHandler");
  }
  return v3;
}

- (void)resetHandler
{
  -[UIDictationTipPresentationHandler setTipPresentedInCurrentDictationSession:](self, "setTipPresentedInCurrentDictationSession:", 0);
  -[UIDictationTipPresentationHandler resetDictationTipSignal](self, "resetDictationTipSignal");
}

- (void)setTipPresentedInCurrentDictationSession:(BOOL)a3
{
  self->_tipPresentedInCurrentDictationSession = a3;
}

- (void)resetDictationTipSignal
{
  self->_dictationTipSignaled = 9;
}

- (BOOL)dictationTipShownOverLimit:(int64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;

  objc_msgSend(MEMORY[0x1E0DBDCA8], "sharedPreferencesController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForPreferenceKey:", *MEMORY[0x1E0DBDEE0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "integerValue");
  LOBYTE(a3) = v7 <= -[UIDictationTipPresentationHandler dictationTipDisplayCount:](self, "dictationTipDisplayCount:", a3);

  return a3;
}

- (BOOL)shouldSignalDictationTip:(int64_t)a3
{
  return 0;
}

- (int64_t)getDictationTipSignaled
{
  return self->_dictationTipSignaled;
}

- (void)signalTipPresentedInCurrentDictationSession
{
  self->_tipPresentedInCurrentDictationSession = 1;
}

- (BOOL)tipShownLastWeek
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;

  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForPreferenceKey:", CFSTR("DictationOneTipPerDayEnabled"));

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DBDCA8], "sharedPreferencesController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "valueForPreferenceKey:", *MEMORY[0x1E0DBDED8]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    LOBYTE(v3) = (objc_opt_isKindOfClass() & 1) != 0
              && (objc_msgSend(MEMORY[0x1E0C99D68], "date"),
                  v6 = (void *)objc_claimAutoreleasedReturnValue(),
                  objc_msgSend(v6, "timeIntervalSinceDate:", v5),
                  v8 = v7,
                  v6,
                  v8 < 604800.0);

  }
  return v3;
}

- (BOOL)dictationCommandTipsEnabled
{
  void *v2;
  char v3;

  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForPreferenceKey:", CFSTR("DictationCommandTipsEnabled"));

  return v3;
}

- (int64_t)dictationTipDisplayCount:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;

  +[UIDictationTipController dictationTipPreferenceKey:](UIDictationTipController, "dictationTipPreferenceKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "valueForPreferenceKey:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "integerValue");

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isShowingTip
{
  return self->_isShowingTip;
}

- (void)setIsShowingTip:(BOOL)a3
{
  self->_isShowingTip = a3;
}

- (int64_t)dictationTipSignaled
{
  return self->_dictationTipSignaled;
}

- (void)setDictationTipSignaled:(int64_t)a3
{
  self->_dictationTipSignaled = a3;
}

- (BOOL)tipPresentedInCurrentDictationSession
{
  return self->_tipPresentedInCurrentDictationSession;
}

@end
