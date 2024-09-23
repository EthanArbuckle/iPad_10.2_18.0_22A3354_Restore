@implementation PXPeopleMeViewController

- (PXPeopleMeViewController)initWithPerson:(id)a3 suggestionHandler:(id)a4
{
  id v7;
  id v8;
  PXPeopleMeViewController *v9;
  PXPeopleMeViewController *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXPeopleMeViewController;
  v9 = -[PXPeopleMeViewController init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_suggestedPerson, a3);
    objc_storeStrong((id *)&v10->_suggestionHandler, a4);
  }

  return v10;
}

- (PXPeopleMeViewController)initWithPerson:(id)a3 suggestionHandler:(id)a4 dismissHandler:(id)a5
{
  id v8;
  PXPeopleMeViewController *v9;
  uint64_t v10;
  id dismissHandler;

  v8 = a5;
  v9 = -[PXPeopleMeViewController initWithPerson:suggestionHandler:](self, "initWithPerson:suggestionHandler:", a3, a4);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    dismissHandler = v9->_dismissHandler;
    v9->_dismissHandler = (id)v10;

  }
  return v9;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  PXFeatureSpecManager *v6;
  void *v7;
  PXFeatureSpecManager *v8;
  void *v9;
  PXPeopleCandidateBannerView *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)PXPeopleMeViewController;
  -[PXPeopleMeViewController viewDidLoad](&v15, sel_viewDidLoad);
  PXLocalizedStringFromTable(CFSTR("PXPeopleMeTitle"), CFSTR("PhotosUICore"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleMeViewController setTitle:](self, "setTitle:", v3);

  -[PXPeopleMeViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidesBackButton:", 1);

  -[PXPeopleMeViewController suggestedPerson](self, "suggestedPerson");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController px_enableExtendedTraitCollection](self, "px_enableExtendedTraitCollection");
  v6 = [PXFeatureSpecManager alloc];
  -[UIViewController px_extendedTraitCollection](self, "px_extendedTraitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PXFeatureSpecManager initWithExtendedTraitCollection:](v6, "initWithExtendedTraitCollection:", v7);
  -[PXPeopleMeViewController setSpecManager:](self, "setSpecManager:", v8);

  -[PXPeopleMeViewController specManager](self, "specManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "registerChangeObserver:context:", self, SpecManagerObserverContext);

  v10 = -[PXPeopleCandidateBannerView initWithStyle:]([PXPeopleCandidateBannerView alloc], "initWithStyle:", 4);
  -[PXPeopleCandidateBannerView setAttribution:](v10, "setAttribution:", 3);
  -[PXPeopleCandidateBannerView setPerson:](v10, "setPerson:", v5);
  -[PXPeopleMeViewController specManager](self, "specManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "spec");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleCandidateBannerView setSpec:](v10, "setSpec:", v12);

  -[PXPeopleCandidateBannerView setDelegate:](v10, "setDelegate:", self);
  -[PXPeopleMeViewController setBannerView:](self, "setBannerView:", v10);
  -[PXPeopleMeViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addSubview:", v10);

  -[PXPeopleMeViewController delegate](self, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "peopleMeViewControllerDidUpdateSize:", self);

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PXPeopleMeViewController;
  -[PXPeopleMeViewController viewDidLayoutSubviews](&v13, sel_viewDidLayoutSubviews);
  -[PXPeopleMeViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[PXPeopleMeViewController bannerView](self, "bannerView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

}

- (double)preferredHeightForWidth:(double)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;

  -[PXPeopleMeViewController bannerView](self, "bannerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "sizeThatFits:", a3, 0.0);
    v7 = v6;
  }
  else
  {
    v7 = 60.0;
  }

  return v7;
}

- (void)_dismissViewControllerAsConfirmed:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void (**v6)(id, _BOOL8);

  v3 = a3;
  -[PXPeopleMeViewController dismissHandler](self, "dismissHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[PXPeopleMeViewController dismissHandler](self, "dismissHandler");
    v6 = (void (**)(id, _BOOL8))objc_claimAutoreleasedReturnValue();
    v6[2](v6, v3);

  }
  else
  {
    -[PXPeopleMeViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  }
}

- (void)_confirmMe:(id)a3
{
  void *v4;

  -[PXPeopleMeViewController suggestionHandler](self, "suggestionHandler", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "confirmSuggestedMePerson");

  -[PXPeopleMeViewController _dismissViewControllerAsConfirmed:](self, "_dismissViewControllerAsConfirmed:", 1);
}

- (void)_rejectMe:(id)a3
{
  void *v4;

  -[PXPeopleMeViewController suggestionHandler](self, "suggestionHandler", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rejectSuggestedMePerson");

  -[PXPeopleMeViewController _dismissViewControllerAsConfirmed:](self, "_dismissViewControllerAsConfirmed:", 0);
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v6 = a4;
  v9 = a3;
  if ((void *)SpecManagerObserverContext != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeopleMeViewController.m"), 267, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  if ((v6 & 1) != 0)
  {
    v15 = v9;
    -[PXPeopleMeViewController specManager](self, "specManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "spec");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPeopleMeViewController bannerView](self, "bannerView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setSpec:", v11);

    -[PXPeopleMeViewController delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "peopleMeViewControllerDidUpdateSize:", self);

    v9 = v15;
  }

}

- (void)bannerViewDidSelectPrimaryAction:(id)a3
{
  -[PXPeopleMeViewController _confirmMe:](self, "_confirmMe:", 0);
}

- (void)bannerViewDidSelectNotNow:(id)a3
{
  -[PXPeopleMeViewController _rejectMe:](self, "_rejectMe:", 0);
}

- (PXPeopleMeSuggestionHandler)suggestionHandler
{
  return self->_suggestionHandler;
}

- (id)dismissHandler
{
  return self->_dismissHandler;
}

- (void)setDismissHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 976);
}

- (PXPeopleMeViewControllerDelegate)delegate
{
  return (PXPeopleMeViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PHPerson)suggestedPerson
{
  return (PHPerson *)objc_getProperty(self, a2, 992, 1);
}

- (void)setSuggestedPerson:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 992);
}

- (PXPeopleCandidateBannerView)bannerView
{
  return self->_bannerView;
}

- (void)setBannerView:(id)a3
{
  objc_storeStrong((id *)&self->_bannerView, a3);
}

- (PXFeatureSpecManager)specManager
{
  return self->_specManager;
}

- (void)setSpecManager:(id)a3
{
  objc_storeStrong((id *)&self->_specManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specManager, 0);
  objc_storeStrong((id *)&self->_bannerView, 0);
  objc_storeStrong((id *)&self->_suggestedPerson, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_dismissHandler, 0);
  objc_storeStrong((id *)&self->_suggestionHandler, 0);
}

@end
