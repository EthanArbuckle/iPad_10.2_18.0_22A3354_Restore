@implementation MFSuggestionController

+ (void)initialize
{
  if (qword_1005AA410 != -1)
    dispatch_once(&qword_1005AA410, &stru_100522C60);
}

- (MFSuggestionController)initWithDelegate:(id)a3 headerView:(id)a4
{
  id v6;
  id v7;
  MFSuggestionController *v8;
  MFSuggestionController *v9;
  SGFoundInSuggestionPresenter *v10;
  SGFoundInSuggestionPresenter *suggestionPresenter;
  uint64_t v12;
  EFScheduler *scheduler;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)MFSuggestionController;
  v8 = -[MFSuggestionController init](&v15, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    objc_storeWeak((id *)&v9->_headerView, v7);
    v10 = (SGFoundInSuggestionPresenter *)objc_alloc_init((Class)SGFoundInSuggestionPresenter);
    suggestionPresenter = v9->_suggestionPresenter;
    v9->_suggestionPresenter = v10;

    -[SGFoundInSuggestionPresenter setDelegate:](v9->_suggestionPresenter, "setDelegate:", v9);
    v12 = objc_claimAutoreleasedReturnValue(+[EFScheduler serialDispatchQueueSchedulerWithName:qualityOfService:](EFScheduler, "serialDispatchQueueSchedulerWithName:qualityOfService:", CFSTR("com.apple.mobilemail.MFSuggestionController"), 25));
    scheduler = v9->_scheduler;
    v9->_scheduler = (EFScheduler *)v12;

  }
  return v9;
}

- (id)createAnalysisOperation
{
  MFSuggestionAnalysisOperation *v3;
  void *v4;
  void *v5;
  MFSuggestionAnalysisOperation *v6;

  v3 = [MFSuggestionAnalysisOperation alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFSuggestionController suggestionPresenter](self, "suggestionPresenter"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFSuggestionController scheduler](self, "scheduler"));
  v6 = -[MFSuggestionAnalysisOperation initWithDelegate:presenter:scheduler:](v3, "initWithDelegate:presenter:scheduler:", self, v4, v5);

  return v6;
}

- (void)clearSuggestionsBannerAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;
  void *v6;

  v3 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_headerView);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MFSuggestionController suggestionBanner](self, "suggestionBanner"));
  objc_msgSend(WeakRetained, "removeHeaderBlock:animated:", v6, v3);

  -[MFSuggestionController setSuggestionBanner:](self, "setSuggestionBanner:", 0);
}

- (void)presentViewController:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFSuggestionController delegate](self, "delegate"));
  objc_msgSend(v4, "presentSuggestionViewController:", v5);

}

- (int64_t)suggestionsUIContext
{
  return 0;
}

- (void)suggestionPresenterWantsToShowBanner:(id)a3
{
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  char isKindOfClass;
  id WeakRetained;
  void *v14;
  id v15;

  v15 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFSuggestionController delegate](self, "delegate"));
  v5 = objc_msgSend(v4, "showsBanners");

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "banner"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MFSuggestionController suggestionBanner](self, "suggestionBanner"));

    if (v7)
    {
      v8 = (id)objc_claimAutoreleasedReturnValue(-[MFSuggestionController suggestionBanner](self, "suggestionBanner"));
      objc_msgSend(v8, "setBanner:", v6);
    }
    else
    {
      v8 = objc_msgSend(objc_alloc((Class)MFSuggestionBannerView), "initWithFrame:banner:", v6, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
      -[MFSuggestionController setSuggestionBanner:](self, "setSuggestionBanner:", v8);
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "suggestions"));
    if (objc_msgSend(v9, "count") == (id)1)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstObject"));
      v11 = objc_opt_class(MFListUnsubscribeSuggestion_iOS);
      isKindOfClass = objc_opt_isKindOfClass(v10, v11);

      if ((isKindOfClass & 1) != 0)
        objc_msgSend(v6, "setImages:", 0);
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_headerView);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MFSuggestionController suggestionBanner](self, "suggestionBanner"));
    objc_msgSend(WeakRetained, "insertHeaderBlock:atIndex:animated:", v14, 0, 1);

  }
}

- (void)suggestionPresenterWantsToHideBanner:(id)a3
{
  -[MFSuggestionController clearSuggestionsBannerAnimated:](self, "clearSuggestionsBannerAnimated:", 1);
}

- (id)viewControllerForPresentingFromBannerByPresenter:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MFSuggestionController delegate](self, "delegate", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "viewControllerForPresentingSuggestions"));

  return v4;
}

- (id)suggestionCategoryComparatorForManager:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue(+[EMListUnsubscribeSuggestion unsubscribeSuggestionComparator](EMListUnsubscribeSuggestion, "unsubscribeSuggestionComparator", a3));
}

- (EFScheduler)scheduler
{
  return self->_scheduler;
}

- (void)setScheduler:(id)a3
{
  objc_storeStrong((id *)&self->_scheduler, a3);
}

- (SGFoundInSuggestionPresenter)suggestionPresenter
{
  return self->_suggestionPresenter;
}

- (void)setSuggestionPresenter:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionPresenter, a3);
}

- (MFSuggestionHandlingDelegate)delegate
{
  return (MFSuggestionHandlingDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (MFMessageHeaderView)headerView
{
  return (MFMessageHeaderView *)objc_loadWeakRetained((id *)&self->_headerView);
}

- (void)setHeaderView:(id)a3
{
  objc_storeWeak((id *)&self->_headerView, a3);
}

- (MFSuggestionBannerView)suggestionBanner
{
  return self->_suggestionBanner;
}

- (void)setSuggestionBanner:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionBanner, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionBanner, 0);
  objc_destroyWeak((id *)&self->_headerView);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_suggestionPresenter, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
}

@end
