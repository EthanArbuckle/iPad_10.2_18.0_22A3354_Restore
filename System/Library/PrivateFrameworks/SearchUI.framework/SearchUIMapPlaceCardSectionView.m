@implementation SearchUIMapPlaceCardSectionView

- (id)setupContentView
{
  void *v3;
  void *v4;
  SearchUIMapsViewController *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  SearchUIMapsViewController *v10;
  void *v11;
  void *v12;

  -[SearchUIMapPlaceCardSectionView updateTintColorProvider](self, "updateTintColorProvider");
  -[SearchUIMapPlaceCardSectionView setDelegate:](self, "setDelegate:", self);
  -[SearchUICardSectionView rowModel](self, "rowModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cardSection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = [SearchUIMapsViewController alloc];
  objc_msgSend(v4, "mapsData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "shouldSearchDirectionsAlongCurrentRoute");
  -[SearchUICardSectionView feedbackDelegate](self, "feedbackDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUICardSectionView rowModel](self, "rowModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[SearchUIMapsViewController initWithMapsData:searchAlongTheRoute:feedbackListener:queryId:](v5, "initWithMapsData:searchAlongTheRoute:feedbackListener:queryId:", v6, v7, v8, objc_msgSend(v9, "queryId"));

  -[MUPlaceViewController setPlaceViewControllerDelegate:](v10, "setPlaceViewControllerDelegate:", self);
  -[MUPlaceViewController setScrollEnabled:](v10, "setScrollEnabled:", 0);
  -[SearchUIMapPlaceCardSectionView setMapViewController:](self, "setMapViewController:", v10);
  -[SearchUIMapsViewController view](v10, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBackgroundColor:", 0);

  -[SearchUIMapsViewController view](v10, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SearchUIMapPlaceCardSectionView;
  -[SearchUIMapPlaceCardSectionView traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  -[SearchUIMapPlaceCardSectionView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "hasDifferentColorAppearanceComparedToTraitCollection:", v4))
  {

LABEL_4:
    -[SearchUIMapPlaceCardSectionView tlk_updateWithCurrentAppearance](self, "tlk_updateWithCurrentAppearance");
    goto LABEL_5;
  }
  -[SearchUIMapPlaceCardSectionView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "_vibrancy");
  v8 = objc_msgSend(v4, "_vibrancy");

  if (v7 != v8)
    goto LABEL_4;
LABEL_5:

}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SearchUIMapPlaceCardSectionView;
  -[SearchUIMapPlaceCardSectionView didMoveToWindow](&v3, sel_didMoveToWindow);
  -[SearchUIMapPlaceCardSectionView tlk_updateWithCurrentAppearance](self, "tlk_updateWithCurrentAppearance");
}

- (void)tlk_updateForAppearance:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SearchUIMapPlaceCardSectionView;
  -[SearchUIMapPlaceCardSectionView tlk_updateForAppearance:](&v4, sel_tlk_updateForAppearance_, a3);
  -[SearchUIMapPlaceCardSectionView updateTintColorProvider](self, "updateTintColorProvider");
}

- (void)updateTintColorProvider
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(MEMORY[0x1E0DBD910], "bestAppearanceForView:", self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0D47400];
  if ((objc_msgSend(v2, "isVibrant") & 1) != 0)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __58__SearchUIMapPlaceCardSectionView_updateTintColorProvider__block_invoke;
    v4[3] = &unk_1EA1F80C0;
    v5 = v2;
    objc_msgSend(v3, "setTintColorProvider:", v4);

  }
  else
  {
    objc_msgSend(v3, "setTintColorProvider:", 0);
  }

}

id __58__SearchUIMapPlaceCardSectionView_updateTintColorProvider__block_invoke(uint64_t a1)
{
  if ((objc_msgSend(*(id *)(a1 + 32), "isDark") & 1) != 0)
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)containerView:(id)a3 willMeasureArrangedSubviewsFittingSize:(CGSize)a4 forReason:(int64_t)a5
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SearchUIMapPlaceCardSectionView;
  -[SearchUICardSectionView containerView:willMeasureArrangedSubviewsFittingSize:forReason:](&v5, sel_containerView_willMeasureArrangedSubviewsFittingSize_forReason_, a3, a5, a4.width, a4.height);
}

- (CGSize)containerView:(id)a3 systemLayoutSizeFittingSize:(CGSize)a4 forArrangedSubview:(id)a5
{
  double width;
  id v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  CGSize result;

  width = a4.width;
  v7 = a5;
  -[SearchUICardSectionView contentView](self, "contentView");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v7)
  {
    -[SearchUIMapPlaceCardSectionView mapViewController](self, "mapViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v14) = 1148846080;
    LODWORD(v15) = 1112014848;
    objc_msgSend(v13, "_systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", width, 0.0, v14, v15);
    v9 = v16;
    v10 = v17;

    if (v10 == 0.0)
    {
      if (+[SearchUIUtilities isIpad](SearchUIUtilities, "isIpad"))
      {
        v10 = 0.1;
      }
      else
      {
        -[SearchUIMapPlaceCardSectionView tlks_screen](self, "tlks_screen");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "bounds");
        v10 = v19;

      }
    }
  }
  else
  {
    v9 = *MEMORY[0x1E0CFAA88];
    v10 = *(double *)(MEMORY[0x1E0CFAA88] + 8);
  }
  v11 = v9;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)placeViewControllerDidUpdateHeight:(id)a3
{
  _QWORD block[5];

  if (!-[SearchUIMapPlaceCardSectionView alreadyDispatchedOnMainQueue](self, "alreadyDispatchedOnMainQueue", a3))
  {
    -[SearchUIMapPlaceCardSectionView setAlreadyDispatchedOnMainQueue:](self, "setAlreadyDispatchedOnMainQueue:", 1);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __70__SearchUIMapPlaceCardSectionView_placeViewControllerDidUpdateHeight___block_invoke;
    block[3] = &unk_1EA1F62F0;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

uint64_t __70__SearchUIMapPlaceCardSectionView_placeViewControllerDidUpdateHeight___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidateIntrinsicContentSize");

  objc_msgSend(*(id *)(a1 + 32), "didInvalidateSizeAnimate:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setAlreadyDispatchedOnMainQueue:", 0);
}

- (void)placeViewController:(id)a3 requestPasscodeUnlockWithCompletion:(id)a4
{
  +[SearchUIUtilities requestDeviceUnlock:](SearchUIUtilities, "requestDeviceUnlock:", a4);
}

- (BOOL)isReportAProblemAvailable
{
  return 1;
}

- (SearchUIMapsViewController)mapViewController
{
  return (SearchUIMapsViewController *)objc_getProperty(self, a2, 800, 1);
}

- (void)setMapViewController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 800);
}

- (BOOL)alreadyDispatchedOnMainQueue
{
  return self->_alreadyDispatchedOnMainQueue;
}

- (void)setAlreadyDispatchedOnMainQueue:(BOOL)a3
{
  self->_alreadyDispatchedOnMainQueue = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapViewController, 0);
}

@end
