@implementation SBCoverSheetSpotlightPresenter

- (SBCoverSheetSpotlightPresenter)initWithDelegate:(id)a3
{
  id v6;
  SBCoverSheetSpotlightPresenter *v7;
  SBCoverSheetSpotlightPresenter *v8;
  SBSearchPresenter *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  SBSearchPresenter *searchPresenter;
  void *v15;
  objc_super v16;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBCoverSheetSpotlightPresenter.m"), 39, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("delegate"));

  }
  v16.receiver = self;
  v16.super_class = (Class)SBCoverSheetSpotlightPresenter;
  v7 = -[SBCoverSheetSpotlightPresenter init](&v16, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_delegate, a3);
    v9 = [SBSearchPresenter alloc];
    objc_msgSend(MEMORY[0x1E0DAA470], "rootSettings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "coversheetPullToSearchSettings");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[SBSearchPresenter initWithSettings:identifier:](v9, "initWithSettings:identifier:", v11, CFSTR("CoverSheet"));
    searchPresenter = v8->_searchPresenter;
    v8->_searchPresenter = (SBSearchPresenter *)v12;

    -[SBSearchPresenter setSearchPresenterDelegate:](v8->_searchPresenter, "setSearchPresenterDelegate:", v8);
  }

  return v8;
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4;

  v4 = a3;
  -[SBCoverSheetSpotlightPresenter _setUpStartingScrollOffsetWithScrollView:](self, "_setUpStartingScrollOffsetWithScrollView:", v4);
  -[SBSearchPresenter scrollViewWillBeginDragging:](self->_searchPresenter, "scrollViewWillBeginDragging:", v4);

}

- (void)scrollViewDidScroll:(id)a3
{
  -[SBSearchPresenter scrollViewDidScroll:](self->_searchPresenter, "scrollViewDidScroll:", a3);
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4
{
  -[SBSearchPresenter scrollViewWillEndDragging:withVelocity:](self->_searchPresenter, "scrollViewWillEndDragging:withVelocity:", a3, a4.x, a4.y);
}

- (BOOL)isSpotlightPresented
{
  return -[SBSearchPresenter isPresenting](self->_searchPresenter, "isPresenting");
}

- (void)presentSpotlightAnimated:(BOOL)a3
{
  -[SBSearchPresenter presentSearchAnimated:](self->_searchPresenter, "presentSearchAnimated:", a3);
}

- (void)dismissSpotlightAnimated:(BOOL)a3
{
  -[SBSearchPresenter dismissSearchAnimated:](self->_searchPresenter, "dismissSearchAnimated:", a3);
}

- (id)searchPresentablesForPresenter:(id)a3
{
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  if (self->_spotlightViewController)
  {
    v5[0] = self->_spotlightViewController;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = (void *)MEMORY[0x1E0C9AA60];
  }
  return v3;
}

- (id)displayConfigurationForPresenter:(id)a3
{
  return (id)-[SBCoverSheetSpotlightPresenterDelegate displayConfigurationForSpotlightPresenter:](self->_delegate, "displayConfigurationForSpotlightPresenter:", self);
}

- (double)searchTopOffsetForSearchPresenter:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;

  -[SBCoverSheetSpotlightViewController view](self->_spotlightViewController, "view", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeAreaInsets");
  v6 = v5;
  -[SBSearchPresenter interactivePresentationMetrics](self->_searchPresenter, "interactivePresentationMetrics");
  v8 = v6 - v7;

  return v8;
}

- (BOOL)searchPresenterCanPresent:(id)a3
{
  return -[SBCoverSheetSpotlightPresenterDelegate spotlightPresenterAllowsPullToSearch:](self->_delegate, "spotlightPresenterAllowsPullToSearch:", self);
}

- (void)searchPresenterWillPresentSearch:(id)a3 animated:(BOOL)a4
{
  SBCoverSheetSpotlightViewController *spotlightViewController;
  _SBCoverSheetSpotlightViewController *v6;
  SBSpotlightPresentableViewController *v7;
  SBCoverSheetSpotlightViewController *v8;
  SBCoverSheetSpotlightViewController *v9;
  SBCoverSheetSpotlightViewController *v10;
  void *v11;

  spotlightViewController = self->_spotlightViewController;
  if (!spotlightViewController)
  {
    v6 = objc_alloc_init(_SBCoverSheetSpotlightViewController);
    -[SBSpotlightMultiplexingViewController setLegibilitySettings:](v6, "setLegibilitySettings:", self->_legibilitySettings);
    v7 = -[SBSpotlightPresentableViewController initWithSpotlightMultiplexingViewController:]([SBSpotlightPresentableViewController alloc], "initWithSpotlightMultiplexingViewController:", v6);
    -[SBSpotlightPresentableViewController setDelegate:](v7, "setDelegate:", self);
    v8 = -[SBCoverSheetSpotlightViewController initWithSpotlightViewController:]([SBCoverSheetSpotlightViewController alloc], "initWithSpotlightViewController:", v7);
    v9 = self->_spotlightViewController;
    self->_spotlightViewController = v8;

    v10 = self->_spotlightViewController;
    -[SBCoverSheetSpotlightPresenterDelegate displayConfigurationForSpotlightPresenter:](self->_delegate, "displayConfigurationForSpotlightPresenter:", self);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBCoverSheetSpotlightViewController setTargetDisplayConfiguration:](v10, "setTargetDisplayConfiguration:", v11);

    -[SBCoverSheetSpotlightViewController setDelegate:](self->_spotlightViewController, "setDelegate:", self);
    spotlightViewController = self->_spotlightViewController;
  }
  -[SBCoverSheetSpotlightPresenterDelegate spotlightPresenter:presentDismissableModalViewController:completion:](self->_delegate, "spotlightPresenter:presentDismissableModalViewController:completion:", self, spotlightViewController, 0);
}

- (void)searchPresenterDidPresentSearch:(id)a3
{
  -[SBCoverSheetSpotlightPresenterDelegate spotlightPresenterDidPresentSearch:](self->_delegate, "spotlightPresenterDidPresentSearch:", self);
}

- (void)searchPresenterWillDismissSearch:(id)a3 animated:(BOOL)a4
{
  if (self->_spotlightViewController)
    -[SBCoverSheetSpotlightPresenterDelegate spotlightPresenter:dismissDismissableModalViewController:animated:completion:](self->_delegate, "spotlightPresenter:dismissDismissableModalViewController:animated:completion:");
}

void __76__SBCoverSheetSpotlightPresenter_searchPresenterWillDismissSearch_animated___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "invalidate");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  *(_QWORD *)(v2 + 24) = 0;

}

- (void)searchPresenterDidDismissSearch:(id)a3
{
  -[SBCoverSheetSpotlightPresenterDelegate spotlightPresenterDidDismissSearch:](self->_delegate, "spotlightPresenterDidDismissSearch:", self);
}

- (void)spotlightPresentableViewControllerShouldDismiss:(id)a3
{
  -[SBCoverSheetSpotlightPresenter dismissSpotlightAnimated:](self, "dismissSpotlightAnimated:", 1);
}

- (id)backgroundViewForSpotlightPresentableViewController:(id)a3
{
  SBCoverSheetSpotlightBackgroundView *v4;
  void *v5;

  v4 = objc_alloc_init(SBCoverSheetSpotlightBackgroundView);
  -[SBCoverSheetSpotlightViewController view](self->_spotlightViewController, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  -[SBCoverSheetSpotlightBackgroundView setFrame:](v4, "setFrame:");

  return v4;
}

- (void)coverSheetSpotlightViewControllerShouldDismiss:(id)a3 animated:(BOOL)a4
{
  -[SBCoverSheetSpotlightPresenter dismissSpotlightAnimated:](self, "dismissSpotlightAnimated:", a4);
}

- (void)coverSheetSpotlightViewControllerAddContentView:(id)a3
{
  -[SBCoverSheetSpotlightPresenterDelegate spotlightPresenterAddContentView:](self->_delegate, "spotlightPresenterAddContentView:", self);
}

- (void)coverSheetSpotlightViewControllerRemoveContentView:(id)a3
{
  -[SBCoverSheetSpotlightPresenterDelegate spotlightPresenterRemoveContentView:](self->_delegate, "spotlightPresenterRemoveContentView:", self);
}

- (void)_setUpStartingScrollOffsetWithScrollView:(id)a3
{
  SBSearchPresenter *searchPresenter;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  searchPresenter = self->_searchPresenter;
  v5 = a3;
  -[SBSearchPresenter interactivePresentationMetrics](searchPresenter, "interactivePresentationMetrics");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(v5, "adjustedContentInset");
  v13 = v12;

  -[SBSearchPresenter setInteractivePresentationMetrics:](self->_searchPresenter, "setInteractivePresentationMetrics:", v13, v7, v9, v11);
}

- (double)strength
{
  return self->_strength;
}

- (void)setStrength:(double)a3
{
  self->_strength = a3;
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (void)setLegibilitySettings:(id)a3
{
  objc_storeStrong((id *)&self->_legibilitySettings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_searchPresenter, 0);
  objc_storeStrong((id *)&self->_spotlightViewController, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

@end
