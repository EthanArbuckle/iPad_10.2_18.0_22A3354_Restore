@implementation WBSAppReviewPromptManager

- (WBSAppReviewPromptManager)init
{

  return 0;
}

- (WBSAppReviewPromptManager)initWithPresenter:(id)a3 extensionsController:(id)a4
{
  id v6;
  id v7;
  WBSAppReviewPromptManager *v8;
  WBSAppReviewPromptManager *v9;
  WBSAppReviewPromptManager *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)WBSAppReviewPromptManager;
  v8 = -[WBSAppReviewPromptManager init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_presenter, v6);
    objc_storeStrong((id *)&v9->_webExtensionsController, a4);
    v10 = v9;
  }

  return v9;
}

- (void)didDismissReaderWithScrollPercentage:(double)a3 dateReaderOpened:(id)a4
{
  id v6;
  double v7;
  void *v8;
  char v9;
  id v10;

  v6 = a4;
  if (a3 >= 0.25)
  {
    v10 = v6;
    objc_msgSend(v6, "safari_timeIntervalUntilNow");
    v6 = v10;
    if (v7 >= 30.0)
    {
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "BOOLForKey:", CFSTR("DebugDidStayInReaderMinimumTime"));

      v6 = v10;
      if ((v9 & 1) == 0)
      {
        -[WBSAppReviewPromptManager _presentIfNeeded](self, "_presentIfNeeded");
        v6 = v10;
      }
    }
  }

}

- (void)_presentIfNeeded
{
  id WeakRetained;

  if (-[WBSAppReviewPromptManager _shouldPromptForReview](self, "_shouldPromptForReview"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);
    objc_msgSend(WeakRetained, "presentPromptForAppReviewPromptManager:", self);

  }
}

- (BOOL)_shouldPromptForReview
{
  void *v3;
  void *v4;
  uint64_t v5;
  char v6;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "BOOLForKey:", CFSTR("DebugSatisfiedUserPreferenceKey")) & 1) != 0
    || (-[WBSExtensionsController enabledExtensions](self->_webExtensionsController, "enabledExtensions"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "count"),
        v4,
        v5)
    || objc_msgSend(v3, "integerForKey:", *MEMORY[0x1E0D8A468]) > 1
    || (objc_msgSend(v3, "BOOLForKey:", CFSTR("DebugDidTapAtLeastTwoReadingListArticles")) & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    v6 = objc_msgSend(v3, "BOOLForKey:", *MEMORY[0x1E0D8A640]);
  }

  return v6;
}

- (WBSAppReviewPromptPresenting)presenter
{
  return (WBSAppReviewPromptPresenting *)objc_loadWeakRetained((id *)&self->_presenter);
}

- (void)setPresenter:(id)a3
{
  objc_storeWeak((id *)&self->_presenter, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presenter);
  objc_storeStrong((id *)&self->_webExtensionsController, 0);
}

@end
