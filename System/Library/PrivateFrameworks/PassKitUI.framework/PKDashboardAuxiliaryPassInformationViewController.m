@implementation PKDashboardAuxiliaryPassInformationViewController

- (PKDashboardAuxiliaryPassInformationViewController)initWithItem:(id)a3 forPass:(id)a4
{
  id v6;
  id v7;
  PKAuxiliaryPassInformationDataSource *v8;
  PKDashboardDetailHeaderItemPresenter *v9;
  PKDashboardTextActionItemPresenter *v10;
  PKDashboardMapItemPresenter *v11;
  PKHeaderVerticalScrollingLayout *v12;
  void *v13;
  PKDashboardAuxiliaryPassInformationViewController *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSIndexPath *headerIndexPath;
  objc_super v23;
  _QWORD v24[4];

  v24[3] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  v8 = -[PKAuxiliaryPassInformationDataSource initWithItem:forPass:]([PKAuxiliaryPassInformationDataSource alloc], "initWithItem:forPass:", v7, v6);

  v9 = objc_alloc_init(PKDashboardDetailHeaderItemPresenter);
  v10 = objc_alloc_init(PKDashboardTextActionItemPresenter);
  v11 = objc_alloc_init(PKDashboardMapItemPresenter);
  v12 = objc_alloc_init(PKHeaderVerticalScrollingLayout);
  -[PKHeaderVerticalScrollingLayout setUseStickyHeader:](v12, "setUseStickyHeader:", 1);
  v24[0] = v9;
  v24[1] = v10;
  v24[2] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23.receiver = self;
  v23.super_class = (Class)PKDashboardAuxiliaryPassInformationViewController;
  v14 = -[PKDashboardViewController initWithDataSource:presenters:layout:](&v23, sel_initWithDataSource_presenters_layout_, v8, v13, v12);

  if (v14)
  {
    -[PKDashboardAuxiliaryPassInformationViewController navigationItem](v14, "navigationItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDashboardViewController setShouldUseClearNavigationBar:](v14, "setShouldUseClearNavigationBar:", 0);
    objc_msgSend(v15, "pkui_setupScrollEdgeChromelessAppearance");
    objc_msgSend(v15, "pkui_enableManualScrollEdgeAppearanceWithInitialProgress:", 0.0);
    -[PKDashboardAuxiliaryPassInformationViewController _barButtonItems](v14, "_barButtonItems");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setRightBarButtonItems:", v16);

    objc_msgSend(v15, "standardAppearance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "backgroundEffect");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDashboardDetailHeaderItemPresenter setOverlayEffect:](v9, "setOverlayEffect:", v18);

    objc_msgSend(v17, "shadowColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDashboardDetailHeaderItemPresenter setShadowColor:](v9, "setShadowColor:", v19);

    -[PKAuxiliaryPassInformationDataSource headerIndexPath](v8, "headerIndexPath");
    v20 = objc_claimAutoreleasedReturnValue();
    headerIndexPath = v14->_headerIndexPath;
    v14->_headerIndexPath = (NSIndexPath *)v20;

    objc_storeStrong((id *)&v14->_headerPresenter, v9);
  }

  return v14;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKDashboardAuxiliaryPassInformationViewController;
  -[PKDashboardViewController viewDidLoad](&v5, sel_viewDidLoad);
  self->_isHeaderPinned = 1;
  -[PKDashboardAuxiliaryPassInformationViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKDashboardViewController backgroundColor](PKDashboardViewController, "backgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

}

- (void)_updateNavigationBarIconForNavigationBarAppeared:(BOOL)a3
{
  _BOOL4 v3;
  UIImageView *titleIconImageView;
  PKAnimatedNavigationBarTitleView *titleView;
  void *v7;
  void *v8;
  double v9;
  double v10;
  PKAnimatedNavigationBarTitleView *v11;
  PKAnimatedNavigationBarTitleView *v12;
  void *v13;
  void *v14;
  NSString *titleText;
  id v16;

  v3 = a3;
  titleIconImageView = self->_titleIconImageView;
  if (titleIconImageView)
  {
    titleView = self->_titleView;
    if (v3)
    {
      if (!titleView)
      {
        -[PKDashboardAuxiliaryPassInformationViewController navigationController](self, "navigationController");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "navigationBar");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "frame");
        v10 = v9;

        v11 = -[PKAnimatedNavigationBarTitleView initWithFrame:]([PKAnimatedNavigationBarTitleView alloc], "initWithFrame:", 0.0, 0.0, v10, v10);
        v12 = self->_titleView;
        self->_titleView = v11;

        -[PKDashboardAuxiliaryPassInformationViewController navigationItem](self, "navigationItem");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "pkui_setCenterAlignedTitleView:", self->_titleView);

        titleView = self->_titleView;
        titleIconImageView = self->_titleIconImageView;
      }
    }
    else
    {
      titleIconImageView = 0;
    }
    -[PKAnimatedNavigationBarTitleView setTitleView:animated:](titleView, "setTitleView:animated:", titleIconImageView, 1);
  }
  else if (self->_titleText)
  {
    -[PKDashboardAuxiliaryPassInformationViewController navigationItem](self, "navigationItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v14;
    if (v3)
      titleText = self->_titleText;
    else
      titleText = 0;
    objc_msgSend(v14, "_setTitle:animated:", titleText, 1);

  }
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double merchantHeaderAnimationProgress;
  double headerHeight;
  double v19;
  uint64_t v20;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  double v27;
  void *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  PKDashboardAuxiliaryPassInformationViewController *v32;
  BOOL v33;
  objc_super v34;

  v34.receiver = self;
  v34.super_class = (Class)PKDashboardAuxiliaryPassInformationViewController;
  -[PKDashboardAuxiliaryPassInformationViewController viewWillLayoutSubviews](&v34, sel_viewWillLayoutSubviews);
  -[PKDashboardAuxiliaryPassInformationViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentOffset");
  v5 = v4;
  objc_msgSend(v3, "safeAreaInsets");
  v8 = v7;
  v9 = (double *)MEMORY[0x1E0DC49E8];
  if (self->_footer)
  {
    v10 = v6;
    -[PKDashboardViewControllerFooterContainer bounds](self->_footerContainer, "bounds");
    v12 = v11 - v10;
  }
  else
  {
    v12 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  }
  v13 = v9[1];
  v14 = v9[3];
  if (self->_isHeaderPinned)
  {
    v15 = self->_headerHeight - v8 - fmin(v5, 0.0);
    v16 = -v8;
  }
  else
  {
    v16 = *v9;
    v15 = *v9;
  }
  objc_msgSend(v3, "setVerticalScrollIndicatorInsets:", v15, v9[1], v12, v9[3]);
  objc_msgSend(v3, "setContentInset:", v16, v13, v12, v14);
  merchantHeaderAnimationProgress = self->_merchantHeaderAnimationProgress;
  headerHeight = self->_headerHeight;
  if (headerHeight <= 0.0)
  {
    self->_merchantHeaderAnimationProgress = 0.0;
    v19 = 0.0;
  }
  else
  {
    v19 = fmin(fmax(v5 / vabdd_f64(headerHeight, v8), 0.0), 1.0);
    self->_merchantHeaderAnimationProgress = v19;
    if (merchantHeaderAnimationProgress < 1.0 && v19 >= 1.0)
    {
      v20 = 1;
LABEL_18:
      -[PKDashboardAuxiliaryPassInformationViewController _updateNavigationBarIconForNavigationBarAppeared:](self, "_updateNavigationBarIconForNavigationBarAppeared:", v20);
      goto LABEL_19;
    }
  }
  if (merchantHeaderAnimationProgress >= 1.0 && v19 < 1.0)
  {
    v20 = 0;
    goto LABEL_18;
  }
LABEL_19:
  if (self->_headerIndexPath)
  {
    -[PKDashboardAuxiliaryPassInformationViewController collectionView](self, "collectionView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "cellForItemAtIndexPath:", self->_headerIndexPath);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        -[PKDashboardAuxiliaryPassInformationViewController _updateHeaderCellWithAnimationProgress:](self, "_updateHeaderCellWithAnimationProgress:", v23);
    }

  }
  if (self->_isHeaderPinned)
  {
    v24 = self->_merchantHeaderAnimationProgress;
    -[PKDashboardAuxiliaryPassInformationViewController navigationItem](self, "navigationItem");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    v27 = 1.0;
    if (v24 < 1.0)
      v27 = 0.0;
    objc_msgSend(v25, "_setManualScrollEdgeAppearanceProgress:", v27);

    if (merchantHeaderAnimationProgress > 0.35 && v19 <= 0.35 || merchantHeaderAnimationProgress < 0.35 && v19 >= 0.35)
    {
      -[PKDashboardAuxiliaryPassInformationViewController navigationController](self, "navigationController");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (v28)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v29 = (void *)MEMORY[0x1E0DC3F10];
          v30[0] = MEMORY[0x1E0C809B0];
          v30[1] = 3221225472;
          v30[2] = __75__PKDashboardAuxiliaryPassInformationViewController_viewWillLayoutSubviews__block_invoke;
          v30[3] = &unk_1E3E64908;
          v31 = v28;
          v32 = self;
          v33 = v19 >= 0.35;
          objc_msgSend(v29, "_animateUsingDefaultTimingWithOptions:animations:completion:", 6, v30, 0);

        }
      }

    }
  }

}

uint64_t __75__PKDashboardAuxiliaryPassInformationViewController_viewWillLayoutSubviews__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setNeedsNavigationBarUpdate");
  return objc_msgSend(*(id *)(a1 + 40), "_updateButtonConfigurationsDisablingBlur:", *(unsigned __int8 *)(a1 + 48));
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
  double v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PKDashboardAuxiliaryPassInformationViewController;
  -[PKDashboardAuxiliaryPassInformationViewController viewDidLayoutSubviews](&v13, sel_viewDidLayoutSubviews);
  -[PKDashboardAuxiliaryPassInformationViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  if (self->_footerContainer)
  {
    v7 = v4;
    v8 = v5;
    v9 = v6;
    objc_msgSend(v3, "safeAreaInsets");
    v11 = v10;
    -[PKDashboardViewControllerFooterContainer sizeThatFits:](self->_footerContainer, "sizeThatFits:", v8, v9);
    -[PKDashboardViewControllerFooterContainer setFrame:](self->_footerContainer, "setFrame:", 0.0, v7 + v9 - (v11 + v12), v8);
  }

}

- (void)updateContent
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  UIImageView *v13;
  UIImageView *titleIconImageView;
  NSString *v15;
  NSString *titleText;
  void *v17;
  PKDashboardViewControllerFooterView *footer;
  PKDashboardViewControllerFooterView *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  PKDashboardViewControllerFooterView *v24;
  PKDashboardViewControllerFooterView *v25;
  PKDashboardViewControllerFooterContainer *v26;
  PKDashboardViewControllerFooterContainer *footerContainer;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  objc_super v41;

  v41.receiver = self;
  v41.super_class = (Class)PKDashboardAuxiliaryPassInformationViewController;
  -[PKDashboardViewController updateContent](&v41, sel_updateContent);
  -[PKDashboardAuxiliaryPassInformationViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rightBarButtonItems");
  v4 = objc_claimAutoreleasedReturnValue();
  -[PKDashboardAuxiliaryPassInformationViewController _barButtonItems](self, "_barButtonItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((PKEqualObjects() & 1) == 0)
    objc_msgSend(v3, "setRightBarButtonItems:animated:", v5, 1);
  -[PKDashboardViewController dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "merchant");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = PKUIScreenScale();
  PKIconForMerchant(v7, 0, 0, 0, 35.0, 35.0, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "logoImageURL");
  v10 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "item");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  v39 = (void *)v10;
  v40 = (void *)v4;
  if (v9)
  {
    v13 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v9);
    titleIconImageView = self->_titleIconImageView;
    self->_titleIconImageView = v13;

    -[UIImageView setContentMode:](self->_titleIconImageView, "setContentMode:", 1);
    -[UIImageView _setContinuousCornerRadius:](self->_titleIconImageView, "_setContinuousCornerRadius:", 3.0);
    -[UIImageView setClipsToBounds:](self->_titleIconImageView, "setClipsToBounds:", 1);
    -[PKDashboardAuxiliaryPassInformationViewController _updateNavigationBarIconWithLogoURL:](self, "_updateNavigationBarIconWithLogoURL:", v10);
  }
  else
  {
    objc_msgSend(v11, "title");
    v15 = (NSString *)objc_claimAutoreleasedReturnValue();
    titleText = self->_titleText;
    self->_titleText = v15;

  }
  objc_msgSend(v12, "detailFooterLeadingTitle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v38 = v3;
    footer = self->_footer;
    if (!footer)
    {
      v19 = [PKDashboardViewControllerFooterView alloc];
      v20 = *MEMORY[0x1E0C9D648];
      v21 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      v22 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v23 = *(double *)(MEMORY[0x1E0C9D648] + 24);
      v24 = -[PKDashboardViewControllerFooterView initWithFrame:](v19, "initWithFrame:", *MEMORY[0x1E0C9D648], v21, v22, v23);
      v25 = self->_footer;
      self->_footer = v24;

      -[PKDashboardViewControllerFooterView setDetailNumberOfLines:](self->_footer, "setDetailNumberOfLines:", 2);
      v26 = -[PKDashboardViewControllerFooterContainer initWithFrame:]([PKDashboardViewControllerFooterContainer alloc], "initWithFrame:", v20, v21, v22, v23);
      footerContainer = self->_footerContainer;
      self->_footerContainer = v26;

      -[PKDashboardViewControllerFooterContainer setCurrentFooter:](self->_footerContainer, "setCurrentFooter:", self->_footer);
      -[PKDashboardAuxiliaryPassInformationViewController view](self, "view");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "addSubview:", self->_footerContainer);

      footer = self->_footer;
    }
    -[PKDashboardViewControllerFooterView leadingTitle](footer, "leadingTitle");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setText:", v17);

    -[PKDashboardViewControllerFooterView leadingDetail](self->_footer, "leadingDetail");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "detailFooterLeadingText");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setText:", v31);

    objc_msgSend(v12, "detailFooterTrailingTitle");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDashboardViewControllerFooterView trailingTitle](self->_footer, "trailingTitle");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setText:", v32);

    -[PKDashboardViewControllerFooterView trailingDetail](self->_footer, "trailingDetail");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "detailFooterTrailingText");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setText:", v35);

    v3 = v38;
  }
  -[PKDashboardAuxiliaryPassInformationViewController navigationItem](self, "navigationItem");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "navigationBarTitle");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setBackButtonTitle:", v37);

  objc_msgSend(v36, "setBackButtonDisplayMode:", 1);
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  objc_super v16;
  CGSize result;

  v8 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PKDashboardAuxiliaryPassInformationViewController;
  -[PKDashboardViewController collectionView:layout:sizeForItemAtIndexPath:](&v16, sel_collectionView_layout_sizeForItemAtIndexPath_, a3, a4, v8);
  v10 = v9;
  v12 = v11;
  if (self->_headerIndexPath && objc_msgSend(v8, "isEqual:") && self->_headerHeight != v12)
  {
    self->_headerHeight = v12;
    -[PKDashboardAuxiliaryPassInformationViewController view](self, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setNeedsLayout");

  }
  v14 = v10;
  v15 = v12;
  result.height = v15;
  result.width = v14;
  return result;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  objc_super v9;

  v6 = a4;
  v9.receiver = self;
  v9.super_class = (Class)PKDashboardAuxiliaryPassInformationViewController;
  -[PKDashboardViewController collectionView:cellForItemAtIndexPath:](&v9, sel_collectionView_cellForItemAtIndexPath_, a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_headerIndexPath)
  {
    if (objc_msgSend(v6, "isEqual:"))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        -[PKDashboardAuxiliaryPassInformationViewController _updateHeaderCellWithAnimationProgress:](self, "_updateHeaderCellWithAnimationProgress:", v7);
    }
  }

  return v7;
}

- (void)_updateHeaderCellWithAnimationProgress:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setOverlayAlpha:", self->_merchantHeaderAnimationProgress);
  if (self->_isHeaderPinned && self->_merchantHeaderAnimationProgress >= 1.0)
    objc_msgSend(v4, "setOverlayAlpha:", 0.0);

}

- (void)_updateNavigationBarIconWithLogoURL:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  _QWORD v7[5];

  if (a3)
  {
    v4 = (void *)MEMORY[0x1E0D66EA8];
    v5 = a3;
    objc_msgSend(v4, "sharedImageAssetDownloader");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __89__PKDashboardAuxiliaryPassInformationViewController__updateNavigationBarIconWithLogoURL___block_invoke;
    v7[3] = &unk_1E3E75800;
    v7[4] = self;
    objc_msgSend(v6, "downloadFromUrl:completionHandler:", v5, v7);

  }
}

void __89__PKDashboardAuxiliaryPassInformationViewController__updateNavigationBarIconWithLogoURL___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;

  if (a2 && !a4)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "imageWithData:", a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __89__PKDashboardAuxiliaryPassInformationViewController__updateNavigationBarIconWithLogoURL___block_invoke_2;
      v7[3] = &unk_1E3E61388;
      v7[4] = *(_QWORD *)(a1 + 32);
      v8 = v5;
      dispatch_async(MEMORY[0x1E0C80D38], v7);

    }
  }
}

uint64_t __89__PKDashboardAuxiliaryPassInformationViewController__updateNavigationBarIconWithLogoURL___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1168), "setImage:", *(_QWORD *)(a1 + 40));
}

- ($85E40A55691FE2F31975A98F57E3065D)pkui_navigationStatusBarStyleDescriptor
{
  void *v3;
  void *v4;
  double merchantHeaderAnimationProgress;
  _BOOL8 v6;
  _BOOL8 v7;
  int64_t v8;
  $85E40A55691FE2F31975A98F57E3065D result;

  -[PKDashboardViewController dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "merchant");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  if (v4)
  {
    merchantHeaderAnimationProgress = self->_merchantHeaderAnimationProgress;

    if (merchantHeaderAnimationProgress < 0.35)
      v6 = 1;
  }

  v7 = v6;
  v8 = v6;
  result.var1 = v8;
  result.var0 = v7;
  return result;
}

- (void)_updateButtonConfigurationsDisablingBlur:(BOOL)a3
{
  BOOL v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = -[PKDashboardAuxiliaryPassInformationViewController _shouldBlurButtons](self, "_shouldBlurButtons");
  -[PKDashboardAuxiliaryPassInformationViewController _barButtonItems](self, "_barButtonItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    v9 = a3 || !v4;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "customView");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "contentView");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "configuration");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "background");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          if (a3)
            objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemFillColor");
          else
            objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setBackgroundColor:", v16);
          v15 = 0;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 1);
          v15 = objc_claimAutoreleasedReturnValue();
          v16 = (void *)v15;
        }
        objc_msgSend(v14, "setVisualEffect:", v15);

        objc_msgSend(v12, "setConfiguration:", v13);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }

}

- (BOOL)_shouldBlurButtons
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  -[PKDashboardViewController dataSource](self, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "merchant");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "heroImageURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (id)_barButtonItems
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  uint64_t v13;
  void (**v14)(_QWORD, void *, BOOL, void *);
  void (**v15)(void *, UIButton *);
  id v16;
  void (**v17)(_QWORD);
  void *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  UIButton *v24;
  UIButton *detailsButton;
  PKAlignedContentContainerView *v26;
  PKAlignedContentContainerView *detailsButtonContainer;
  void *v28;
  int *v29;
  void (**v30)(void *, void *, _QWORD, void *);
  void *v31;
  void *v32;
  void *v33;
  UIButton *v34;
  UIButton *phoneButton;
  PKAlignedContentContainerView *v36;
  PKAlignedContentContainerView *phoneButtonContainer;
  void *v38;
  int *v39;
  void (**v40)(void *, void *, _QWORD, void *);
  void *v41;
  void *v42;
  void *v43;
  UIButton *v44;
  UIButton *messageButton;
  PKAlignedContentContainerView *v46;
  PKAlignedContentContainerView *messageButtonContainer;
  void *v48;
  void *v49;
  void *v51;
  void *v52;
  void (**v53)(_QWORD, void *, BOOL, void *);
  void (**v54)(void *, UIButton *);
  _BOOL4 v55;
  _QWORD v56[4];
  id v57;
  _QWORD v58[4];
  id v59;
  _QWORD v60[4];
  id v61;
  id location;
  _QWORD v63[4];
  id v64;
  _QWORD v65[4];
  int64x2_t v66;
  _QWORD aBlock[4];
  BOOL v68;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PKDashboardViewController dataSource](self, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "merchant");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((objc_msgSend(v5, "useRawMerchantData") & 1) != 0)
    {
      v7 = 0;
    }
    else
    {
      objc_msgSend(v6, "mapsMerchant");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v9 != 0;

    }
    objc_msgSend(v6, "phoneNumber");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v10 != 0;

    objc_msgSend(v6, "businessChatURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = v11 != 0;

  }
  else
  {
    v55 = 0;
    v8 = 0;
    v7 = 0;
  }
  v12 = -[PKDashboardAuxiliaryPassInformationViewController _shouldBlurButtons](self, "_shouldBlurButtons");
  v13 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__PKDashboardAuxiliaryPassInformationViewController__barButtonItems__block_invoke;
  aBlock[3] = &__block_descriptor_33_e43___UIButton_28__0__UIImage_8B16__UIAction_20l;
  v68 = v12;
  v14 = (void (**)(_QWORD, void *, BOOL, void *))_Block_copy(aBlock);
  v65[0] = v13;
  v65[1] = 3221225472;
  v65[2] = __68__PKDashboardAuxiliaryPassInformationViewController__barButtonItems__block_invoke_2;
  v65[3] = &__block_descriptor_48_e49___PKAlignedContentContainerView_16__0__UIButton_8l;
  v66 = vdupq_n_s64(0x4040000000000000uLL);
  v15 = (void (**)(void *, UIButton *))_Block_copy(v65);
  v63[0] = v13;
  v63[1] = 3221225472;
  v63[2] = __68__PKDashboardAuxiliaryPassInformationViewController__barButtonItems__block_invoke_3;
  v63[3] = &unk_1E3E612E8;
  v16 = v3;
  v64 = v16;
  v17 = (void (**)(_QWORD))_Block_copy(v63);
  objc_initWeak(&location, self);
  if (v7)
  {
    if (objc_msgSend(v16, "count"))
      v17[2](v17);
    if (!self->_detailsButton)
    {
      -[PKDashboardViewController dataSource](self, "dataSource");
      v53 = v14;
      v54 = v15;
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "merchant");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "heroImageURL");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
        v20 = CFSTR("info");
      else
        v20 = CFSTR("info.circle");
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", v20, v4);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)MEMORY[0x1E0DC3428];
      v60[0] = MEMORY[0x1E0C809B0];
      v60[1] = 3221225472;
      v60[2] = __68__PKDashboardAuxiliaryPassInformationViewController__barButtonItems__block_invoke_4;
      v60[3] = &unk_1E3E62BD0;
      objc_copyWeak(&v61, &location);
      objc_msgSend(v22, "actionWithHandler:", v60);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v53[2](v53, v21, v19 == 0, v23);
      v24 = (UIButton *)objc_claimAutoreleasedReturnValue();
      detailsButton = self->_detailsButton;
      self->_detailsButton = v24;

      v54[2](v54, self->_detailsButton);
      v26 = (PKAlignedContentContainerView *)objc_claimAutoreleasedReturnValue();
      detailsButtonContainer = self->_detailsButtonContainer;
      self->_detailsButtonContainer = v26;

      objc_destroyWeak(&v61);
      v4 = v51;
      v14 = v53;
      v15 = v54;
    }
    v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", self->_detailsButtonContainer);
    objc_msgSend(v16, "addObject:", v28);

  }
  if (v8)
  {
    if (objc_msgSend(v16, "count"))
      v17[2](v17);
    v29 = &OBJC_IVAR___PKAccountBankAccountsViewController__applyController;
    if (!self->_phoneButton)
    {
      v30 = (void (**)(void *, void *, _QWORD, void *))v14;
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("phone.fill"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = (void *)MEMORY[0x1E0DC3428];
      v58[0] = MEMORY[0x1E0C809B0];
      v58[1] = 3221225472;
      v58[2] = __68__PKDashboardAuxiliaryPassInformationViewController__barButtonItems__block_invoke_5;
      v58[3] = &unk_1E3E62BD0;
      objc_copyWeak(&v59, &location);
      objc_msgSend(v32, "actionWithHandler:", v58);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v30[2](v30, v31, 0, v33);
      v34 = (UIButton *)objc_claimAutoreleasedReturnValue();
      phoneButton = self->_phoneButton;
      self->_phoneButton = v34;

      v15[2](v15, self->_phoneButton);
      v36 = (PKAlignedContentContainerView *)objc_claimAutoreleasedReturnValue();
      v29 = &OBJC_IVAR___PKAccountBankAccountsViewController__applyController;
      phoneButtonContainer = self->_phoneButtonContainer;
      self->_phoneButtonContainer = v36;

      objc_destroyWeak(&v59);
      v14 = (void (**)(_QWORD, void *, BOOL, void *))v30;
    }
    v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", *(Class *)((char *)&self->super.super.super.super.super.isa + v29[953]));
    objc_msgSend(v16, "addObject:", v38);

  }
  if (v55)
  {
    if (objc_msgSend(v16, "count"))
      v17[2](v17);
    v39 = &OBJC_IVAR___PKAccountBankAccountsViewController__applyController;
    if (!self->_messageButton)
    {
      v40 = (void (**)(void *, void *, _QWORD, void *))v14;
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("message.fill"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = (void *)MEMORY[0x1E0DC3428];
      v56[0] = MEMORY[0x1E0C809B0];
      v56[1] = 3221225472;
      v56[2] = __68__PKDashboardAuxiliaryPassInformationViewController__barButtonItems__block_invoke_6;
      v56[3] = &unk_1E3E62BD0;
      objc_copyWeak(&v57, &location);
      objc_msgSend(v42, "actionWithHandler:", v56);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v40[2](v40, v41, 0, v43);
      v44 = (UIButton *)objc_claimAutoreleasedReturnValue();
      messageButton = self->_messageButton;
      self->_messageButton = v44;

      v15[2](v15, self->_messageButton);
      v46 = (PKAlignedContentContainerView *)objc_claimAutoreleasedReturnValue();
      v39 = &OBJC_IVAR___PKAccountBankAccountsViewController__applyController;
      messageButtonContainer = self->_messageButtonContainer;
      self->_messageButtonContainer = v46;

      objc_destroyWeak(&v57);
      v14 = (void (**)(_QWORD, void *, BOOL, void *))v40;
    }
    v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", *(Class *)((char *)&self->super.super.super.super.super.isa + v39[955]));
    objc_msgSend(v16, "addObject:", v48);

  }
  v49 = (void *)objc_msgSend(v16, "copy");
  objc_destroyWeak(&location);

  return v49;
}

id __68__PKDashboardAuxiliaryPassInformationViewController__barButtonItems__block_invoke(uint64_t a1, void *a2, int a3, void *a4)
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double *v14;
  void *v15;
  void *v16;
  void *v17;

  v7 = (void *)MEMORY[0x1E0DC3520];
  v8 = a4;
  v9 = a2;
  objc_msgSend(v7, "plainButtonConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setImage:", v9);

  objc_msgSend(v10, "setCornerStyle:", 4);
  if (*(_BYTE *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "background");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setVisualEffect:", v11);

  }
  v13 = (void *)MEMORY[0x1E0DC3888];
  v14 = (double *)MEMORY[0x1E0DC1440];
  if (a3)
    v14 = (double *)MEMORY[0x1E0DC1420];
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", 14.0, *v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "configurationWithFont:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setPreferredSymbolConfigurationForImage:", v16);
  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithConfiguration:primaryAction:", v10, v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

PKAlignedContentContainerView *__68__PKDashboardAuxiliaryPassInformationViewController__barButtonItems__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  PKAlignedContentContainerView *v4;
  PKAlignedContentContainerView *v5;

  v3 = a2;
  v4 = [PKAlignedContentContainerView alloc];
  v5 = -[PKAlignedContentContainerView initWithContentView:alignment:size:](v4, "initWithContentView:alignment:size:", v3, *MEMORY[0x1E0D69C40], *(double *)(a1 + 32), *(double *)(a1 + 40));

  -[PKAlignedContentContainerView setFrame:](v5, "setFrame:", 0.0, 0.0, 32.0, 32.0);
  return v5;
}

void __68__PKDashboardAuxiliaryPassInformationViewController__barButtonItems__block_invoke_3(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 6, 0, 0);
  objc_msgSend(v2, "setWidth:", 15.0);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v2);

}

void __68__PKDashboardAuxiliaryPassInformationViewController__barButtonItems__block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleInfoButtonTapped");

}

void __68__PKDashboardAuxiliaryPassInformationViewController__barButtonItems__block_invoke_5(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handlePhoneButtonTapped");

}

void __68__PKDashboardAuxiliaryPassInformationViewController__barButtonItems__block_invoke_6(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleMessageButtonTapped");

}

- (void)_handleMessageButtonTapped
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (PKStoreDemoModeEnabled())
  {
    PKUIStoreDemoGatewayViewController();
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[PKDashboardAuxiliaryPassInformationViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);
  }
  else
  {
    -[PKDashboardViewController dataSource](self, "dataSource");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "merchant");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "businessChatURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "openURL:configuration:completionHandler:", v4, 0, 0);

    }
  }

}

- (void)_handlePhoneButtonTapped
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (PKStoreDemoModeEnabled())
  {
    PKUIStoreDemoGatewayViewController();
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[PKDashboardAuxiliaryPassInformationViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);
  }
  else
  {
    -[PKDashboardViewController dataSource](self, "dataSource");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "merchant");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "phoneNumber");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      PKTelephoneURLFromPhoneNumber();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "openSensitiveURL:withOptions:", v5, 0);

    }
  }

}

- (void)_showMapsDetailsViewController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *loadingMapsTimer;
  OS_dispatch_source *v8;
  OS_dispatch_source *v9;
  OS_dispatch_source *v10;
  NSObject *v11;
  dispatch_time_t v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  id v20[2];
  _QWORD handler[4];
  id v22;
  id location;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  if (!self->_loadingMapsViewController)
  {
    -[PKDashboardViewController dataSource](self, "dataSource");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "merchant");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mapsMerchant");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "identifier");

    if (v6)
    {
      self->_loadingMapsViewController = 1;
      loadingMapsTimer = self->_loadingMapsTimer;
      if (loadingMapsTimer)
      {
        dispatch_source_cancel(loadingMapsTimer);
        v8 = self->_loadingMapsTimer;
        self->_loadingMapsTimer = 0;

      }
      objc_initWeak(&location, self);
      v9 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, MEMORY[0x1E0C80D38]);
      v10 = self->_loadingMapsTimer;
      self->_loadingMapsTimer = v9;

      v11 = self->_loadingMapsTimer;
      v12 = dispatch_time(0, 1000000000);
      dispatch_source_set_timer(v11, v12, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
      v13 = self->_loadingMapsTimer;
      v14 = MEMORY[0x1E0C809B0];
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __83__PKDashboardAuxiliaryPassInformationViewController__showMapsDetailsViewController__block_invoke;
      handler[3] = &unk_1E3E61310;
      objc_copyWeak(&v22, &location);
      dispatch_source_set_event_handler(v13, handler);
      dispatch_resume((dispatch_object_t)self->_loadingMapsTimer);
      v15 = objc_alloc_init(MEMORY[0x1E0CC1808]);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v6);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = v16;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "_setMuids:", v17);

      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC17F0]), "initWithRequest:", v15);
      v19[0] = v14;
      v19[1] = 3221225472;
      v19[2] = __83__PKDashboardAuxiliaryPassInformationViewController__showMapsDetailsViewController__block_invoke_2;
      v19[3] = &unk_1E3E75898;
      objc_copyWeak(v20, &location);
      v19[4] = self;
      v20[1] = v6;
      objc_msgSend(v18, "startWithCompletionHandler:", v19);
      objc_destroyWeak(v20);

      objc_destroyWeak(&v22);
      objc_destroyWeak(&location);
    }

  }
}

void __83__PKDashboardAuxiliaryPassInformationViewController__showMapsDetailsViewController__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id *v2;
  NSObject *v3;
  id v4;
  id *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (id *)WeakRetained;
  if (WeakRetained)
  {
    v3 = *((_QWORD *)WeakRetained + 159);
    v5 = v2;
    if (v3)
    {
      dispatch_source_cancel(v3);
      v4 = v5[159];
      v5[159] = 0;

      v2 = v5;
    }
    objc_msgSend(v2[163], "pkui_updateConfigurationShowingActivityIndicator:", 1);
    v2 = v5;
  }

}

void __83__PKDashboardAuxiliaryPassInformationViewController__showMapsDetailsViewController__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;
  id v13[2];

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83__PKDashboardAuxiliaryPassInformationViewController__showMapsDetailsViewController__block_invoke_3;
  block[3] = &unk_1E3E75870;
  objc_copyWeak(v13, (id *)(a1 + 40));
  block[4] = *(_QWORD *)(a1 + 32);
  v11 = v6;
  v7 = *(void **)(a1 + 48);
  v12 = v5;
  v13[1] = v7;
  v8 = v5;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(v13);
}

void __83__PKDashboardAuxiliaryPassInformationViewController__showMapsDetailsViewController__block_invoke_3(uint64_t a1)
{
  NSObject **WeakRetained;
  NSObject **v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  void *v10;
  uint64_t v11;
  PKMerchantMapViewController *v12;
  void *v13;
  void *v14;
  PKMerchantMapViewController *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  __int16 v25;
  __CFString *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 56));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained[159];
    if (v4)
    {
      dispatch_source_cancel(v4);
      v5 = v3[159];
      v3[159] = 0;

    }
    *((_BYTE *)v3 + 1264) = 0;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1304), "pkui_updateConfigurationShowingActivityIndicator:", 0);
    if (*(_QWORD *)(a1 + 40)
      || (objc_msgSend(*(id *)(a1 + 48), "mapItems"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v11 = objc_msgSend(v10, "count"),
          v10,
          !v11))
    {
      PKLogFacilityTypeGetObject();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = *(_QWORD *)(a1 + 64);
        v8 = *(void **)(a1 + 40);
        if (v8)
        {
          objc_msgSend(v8, "localizedDescription");
          v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v9 = CFSTR("no map items.");
        }
        v23 = 134218242;
        v24 = v7;
        v25 = 2112;
        v26 = v9;
        _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "PKDashboardAuxiliaryPassInformationViewController: MKLocalSearch could not resolve merchant maps for mapsID: %llu. Error: %@", (uint8_t *)&v23, 0x16u);
        if (v8)

      }
      v17 = (void *)MEMORY[0x1E0DC3450];
      PKLocalizedPaymentString(CFSTR("DASHBOARD_MAPS_MERCHANT_ERROR"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "alertControllerWithTitle:message:preferredStyle:", 0, v18, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = (void *)MEMORY[0x1E0DC3448];
      PKLocalizedPaymentString(CFSTR("DASHBOARD_MAPS_MERCHANT_ERROR_OK_BUTTON"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "actionWithTitle:style:handler:", v21, 0, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addAction:", v22);

      objc_msgSend(v3, "presentViewController:animated:completion:", v19, 1, 0);
    }
    else
    {
      v12 = [PKMerchantMapViewController alloc];
      objc_msgSend(*(id *)(a1 + 48), "mapItems");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "firstObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[PKMerchantMapViewController initWithMapItem:](v12, "initWithMapItem:", v14);

      objc_msgSend(v3, "navigationController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "pushViewController:animated:", v15, 1);

    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageButton, 0);
  objc_storeStrong((id *)&self->_phoneButton, 0);
  objc_storeStrong((id *)&self->_detailsButton, 0);
  objc_storeStrong((id *)&self->_messageButtonContainer, 0);
  objc_storeStrong((id *)&self->_phoneButtonContainer, 0);
  objc_storeStrong((id *)&self->_detailsButtonContainer, 0);
  objc_storeStrong((id *)&self->_loadingMapsTimer, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
  objc_storeStrong((id *)&self->_headerIndexPath, 0);
  objc_storeStrong((id *)&self->_contactAvatarManager, 0);
  objc_storeStrong((id *)&self->_headerPresenter, 0);
  objc_storeStrong((id *)&self->_titleIconImageView, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
  objc_storeStrong((id *)&self->_footerContainer, 0);
  objc_storeStrong((id *)&self->_footer, 0);
}

@end
