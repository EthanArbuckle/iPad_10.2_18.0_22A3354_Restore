@implementation SKUIGiftThemePickerViewController

- (SKUIGiftThemePickerViewController)initWithGift:(id)a3 configuration:(id)a4
{
  id v6;
  id v7;
  SKUIGiftThemePickerViewController *v8;
  uint64_t v9;
  NSArray *themes;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIGiftThemePickerViewController initWithGift:configuration:].cold.1();
  }
  v15.receiver = self;
  v15.super_class = (Class)SKUIGiftThemePickerViewController;
  v8 = -[SKUIGiftStepViewController initWithGift:configuration:](&v15, sel_initWithGift_configuration_, v6, v7);
  if (v8)
  {
    objc_msgSend(v7, "themes");
    v9 = objc_claimAutoreleasedReturnValue();
    themes = v8->_themes;
    v8->_themes = (NSArray *)v9;

    objc_msgSend(v7, "addObserver:", v8);
    objc_msgSend(v7, "clientContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
      objc_msgSend(v11, "localizedStringForKey:inTable:", CFSTR("GIFTING_THEME_TITLE"), CFSTR("Gifting"));
    else
      +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("GIFTING_THEME_TITLE"), 0, CFSTR("Gifting"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIGiftThemePickerViewController setTitle:](v8, "setTitle:", v13);

    -[SKUIGiftThemePickerViewController setEdgesForExtendedLayout:](v8, "setEdgesForExtendedLayout:", 0);
  }

  return v8;
}

- (void)dealloc
{
  objc_super v3;

  -[SKUIGiftThemeCollectionView setDataSource:](self->_collectionView, "setDataSource:", 0);
  -[SKUIGiftThemeCollectionView setDelegate:](self->_collectionView, "setDelegate:", 0);
  -[UITapGestureRecognizer removeTarget:action:](self->_tapGestureRecognizer, "removeTarget:action:", self, 0);
  v3.receiver = self;
  v3.super_class = (Class)SKUIGiftThemePickerViewController;
  -[SKUIGiftThemePickerViewController dealloc](&v3, sel_dealloc);
}

- (void)loadView
{
  void *v3;
  UITapGestureRecognizer *tapGestureRecognizer;
  UITapGestureRecognizer *v5;
  UITapGestureRecognizer *v6;
  void *v7;
  void *v8;
  UIPageControl *v9;
  UIPageControl *pageControl;
  UIPageControl *v11;
  void *v12;
  UIPageControl *v13;
  void *v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  CGFloat v22;
  double v23;
  double v24;
  double v25;
  double v26;
  float v27;
  double v28;
  double MaxY;
  void *v30;
  uint64_t v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  SKUIGiftThemeBackgroundView *v39;
  CGRect v40;

  v39 = objc_alloc_init(SKUIGiftThemeBackgroundView);
  objc_msgSend(MEMORY[0x1E0DC3658], "_systemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIGiftThemeBackgroundView setBackgroundColor:](v39, "setBackgroundColor:", v3);

  -[SKUIGiftThemeBackgroundView setClipsToBounds:](v39, "setClipsToBounds:", 1);
  -[SKUIGiftThemePickerViewController setView:](self, "setView:", v39);
  tapGestureRecognizer = self->_tapGestureRecognizer;
  if (!tapGestureRecognizer)
  {
    v5 = (UITapGestureRecognizer *)objc_alloc_init(MEMORY[0x1E0DC3D80]);
    v6 = self->_tapGestureRecognizer;
    self->_tapGestureRecognizer = v5;

    -[UITapGestureRecognizer addTarget:action:](self->_tapGestureRecognizer, "addTarget:action:", self, sel__backgroundTapAction_);
    tapGestureRecognizer = self->_tapGestureRecognizer;
  }
  -[SKUIGiftThemeBackgroundView addGestureRecognizer:](v39, "addGestureRecognizer:", tapGestureRecognizer);
  -[SKUIGiftThemePickerViewController _collectionView](self, "_collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v8);

  -[SKUIGiftThemeBackgroundView addSubview:](v39, "addSubview:", v7);
  -[SKUIGiftThemeBackgroundView setScrollView:](v39, "setScrollView:", v7);
  if (!self->_pageControl)
  {
    v9 = (UIPageControl *)objc_alloc_init(MEMORY[0x1E0DC3A88]);
    pageControl = self->_pageControl;
    self->_pageControl = v9;

    -[UIPageControl setAutoresizingMask:](self->_pageControl, "setAutoresizingMask:", 13);
    v11 = self->_pageControl;
    -[UIPageControl tintColor](v11, "tintColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPageControl setCurrentPageIndicatorTintColor:](v11, "setCurrentPageIndicatorTintColor:", v12);

    -[UIPageControl setNumberOfPages:](self->_pageControl, "setNumberOfPages:", -[NSArray count](self->_themes, "count"));
    v13 = self->_pageControl;
    objc_msgSend(MEMORY[0x1E0DC3658], "systemMidGrayColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPageControl setPageIndicatorTintColor:](v13, "setPageIndicatorTintColor:", v14);

    -[UIPageControl sizeToFit](self->_pageControl, "sizeToFit");
  }
  -[SKUIGiftThemeBackgroundView bounds](v39, "bounds");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  -[UIPageControl frame](self->_pageControl, "frame");
  v24 = v23;
  v26 = v25;
  v27 = (v20 - v23) * 0.5;
  v28 = floorf(v27);
  v40.origin.x = v16;
  v40.origin.y = v18;
  v40.size.width = v20;
  v40.size.height = v22;
  MaxY = CGRectGetMaxY(v40);
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "userInterfaceIdiom");

  v32 = 3.0;
  if ((v31 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v32 = 25.0;
  -[UIPageControl setFrame:](self->_pageControl, "setFrame:", v28, MaxY - v32 - v26, v24, v26);
  -[SKUIGiftThemeBackgroundView addSubview:](v39, "addSubview:", self->_pageControl);
  -[SKUIGiftStepViewController giftConfiguration](self, "giftConfiguration");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "clientContext");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  -[SKUIGiftThemePickerViewController navigationItem](self, "navigationItem");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (v34)
    objc_msgSend(v34, "localizedStringForKey:inTable:", CFSTR("GIFTING_BACK_BUTTON"), CFSTR("Gifting"));
  else
    +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("GIFTING_BACK_BUTTON"), 0, CFSTR("Gifting"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setBackButtonTitle:", v36);

  v37 = objc_alloc_init(MEMORY[0x1E0DC34F0]);
  objc_msgSend(v37, "setAction:", sel__nextAction_);
  objc_msgSend(v37, "setTarget:", self);
  if (v34)
    objc_msgSend(v34, "localizedStringForKey:inTable:", CFSTR("GIFTING_NEXT_BUTTON"), CFSTR("Gifting"));
  else
    +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("GIFTING_NEXT_BUTTON"), 0, CFSTR("Gifting"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setTitle:", v38);

  objc_msgSend(v35, "setRightBarButtonItem:", v37);
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  SKUIGiftItemView *v7;
  void *v8;
  void *v9;
  SKUIGiftItemView *v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  void *v14;
  void *v15;
  UIImage *v16;
  UIImage *itemImage;
  objc_super v18;
  _QWORD v19[4];
  id v20;
  id location;

  v3 = a3;
  -[SKUIGiftStepViewController gift](self, "gift");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "item");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = [SKUIGiftItemView alloc];
    -[SKUIGiftStepViewController giftConfiguration](self, "giftConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "clientContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[SKUIGiftItemView initWithStyle:item:clientContext:](v7, "initWithStyle:item:clientContext:", 1, v6, v9);

    -[SKUIGiftItemView artworkContext](v10, "artworkContext");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (self->_itemImage)
      v13 = 1;
    else
      v13 = v11 == 0;
    if (!v13)
    {
      objc_initWeak(&location, self);
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __52__SKUIGiftThemePickerViewController_viewWillAppear___block_invoke;
      v19[3] = &unk_1E73A1EE0;
      objc_copyWeak(&v20, &location);
      -[SKUIGiftStepViewController loadItemArtworkWithArtworkContext:completionBlock:](self, "loadItemArtworkWithArtworkContext:completionBlock:", v12, v19);
      -[SKUIGiftStepViewController gift](self, "gift");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "item");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "placeholderImageForItem:", v15);
      v16 = (UIImage *)objc_claimAutoreleasedReturnValue();
      itemImage = self->_itemImage;
      self->_itemImage = v16;

      objc_destroyWeak(&v20);
      objc_destroyWeak(&location);
    }

  }
  v18.receiver = self;
  v18.super_class = (Class)SKUIGiftThemePickerViewController;
  -[SKUIGiftThemePickerViewController viewWillAppear:](&v18, sel_viewWillAppear_, v3);

}

void __52__SKUIGiftThemePickerViewController_viewWillAppear___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_setItemImage:error:", v6, v5);

}

- (void)viewWillLayoutSubviews
{
  id v3;

  -[SKUIGiftThemePickerViewController traitCollection](self, "traitCollection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[SKUIGiftThemePickerViewController _layoutCollectionViewWithTraits:](self, "_layoutCollectionViewWithTraits:", v3);

}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  _QWORD v4[5];

  self->_animatingScrollView = 1;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __95__SKUIGiftThemePickerViewController_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke;
  v4[3] = &unk_1E739FF90;
  v4[4] = self;
  objc_msgSend(a4, "animateAlongsideTransition:completion:", 0, v4);
}

uint64_t __95__SKUIGiftThemePickerViewController_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 1000) = 0;
  return result;
}

- (void)giftConfigurationController:(id)a3 didLoadImageForTheme:(id)a4
{
  NSUInteger v5;
  SKUIGiftThemeCollectionView *collectionView;
  void *v7;
  id v8;

  v5 = -[NSArray indexOfObjectIdenticalTo:](self->_themes, "indexOfObjectIdenticalTo:", a4);
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    collectionView = self->_collectionView;
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v5, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIGiftThemeCollectionView cellForItemAtIndexPath:](collectionView, "cellForItemAtIndexPath:", v7);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "reloadThemeHeaderImage");
  }
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSArray *themes;
  uint64_t v12;
  void *v13;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("0"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v8);

  -[SKUIGiftStepViewController giftConfiguration](self, "giftConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setGiftConfiguration:", v9);

  -[SKUIGiftStepViewController gift](self, "gift");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setGift:", v10);

  objc_msgSend(v7, "setItemImage:", self->_itemImage);
  themes = self->_themes;
  v12 = objc_msgSend(v6, "item");

  -[NSArray objectAtIndex:](themes, "objectAtIndex:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTheme:", v13);

  return v7;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return -[NSArray count](self->_themes, "count", a3, a4);
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  double v4;
  double v5;
  double v6;

  self->_animatingScrollView = 0;
  objc_msgSend(a3, "contentOffset");
  v5 = v4;
  -[SKUIGiftThemePickerViewController _cardWidth](self, "_cardWidth");
  -[SKUIGiftThemePickerViewController _setSelectedThemeIndex:animated:](self, "_setSelectedThemeIndex:animated:", (uint64_t)(v5 / v6), 1);
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  self->_animatingScrollView = 0;
}

- (void)scrollViewDidScroll:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  unint64_t v9;
  NSUInteger v10;
  unint64_t v11;

  if (!self->_animatingScrollView)
  {
    objc_msgSend(a3, "contentOffset");
    v5 = v4;
    -[SKUIGiftThemePickerViewController _cardWidth](self, "_cardWidth");
    *(float *)&v6 = v6 * 0.5;
    v7 = v5 + floorf(*(float *)&v6);
    if (v7 <= 0.00000011920929)
    {
      v11 = 0;
    }
    else
    {
      -[SKUIGiftThemePickerViewController _cardWidth](self, "_cardWidth");
      v9 = (uint64_t)(v7 / v8);
      v10 = -[NSArray count](self->_themes, "count");
      if (v10 - 1 >= v9)
        v11 = v9;
      else
        v11 = v10 - 1;
    }
    -[SKUIGiftThemePickerViewController _setSelectedThemeIndex:animated:](self, "_setSelectedThemeIndex:animated:", v11, 1);
  }
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  self->_animatingScrollView = 0;
}

- (void)_backgroundTapAction:(id)a3
{
  double v4;
  double v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  int64_t selectedThemeIndex;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;
  CGRect v21;

  v20 = a3;
  if (objc_msgSend(v20, "state") == 3)
  {
    -[SKUIGiftThemeCollectionView frame](self->_collectionView, "frame");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    selectedThemeIndex = self->_selectedThemeIndex;
    -[SKUIGiftThemePickerViewController view](self, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "locationInView:", v13);
    v15 = v14;

    if (v15 >= v5)
    {
      v21.origin.x = v5;
      v21.origin.y = v7;
      v21.size.width = v9;
      v21.size.height = v11;
      if (v15 > CGRectGetMaxX(v21) && selectedThemeIndex < -[NSArray count](self->_themes, "count") - 1)
        ++selectedThemeIndex;
    }
    else
    {
      selectedThemeIndex -= selectedThemeIndex > 0;
    }
    if (selectedThemeIndex != self->_selectedThemeIndex)
    {
      -[SKUIGiftThemeCollectionView contentOffset](self->_collectionView, "contentOffset");
      v17 = v16;
      -[SKUIGiftThemePickerViewController _cardWidth](self, "_cardWidth");
      v19 = v18 * (double)selectedThemeIndex;
      -[SKUIGiftThemePickerViewController _setSelectedThemeIndex:animated:](self, "_setSelectedThemeIndex:animated:", selectedThemeIndex, 1);
      self->_animatingScrollView = 1;
      -[SKUIGiftThemeCollectionView setContentOffset:animated:](self->_collectionView, "setContentOffset:animated:", 1, v19, v17);
    }
  }

}

- (void)_nextAction:(id)a3
{
  void *v4;
  SKUIGiftConfirmViewController *v5;
  void *v6;
  SKUIGiftConfirmViewController *v7;
  void *v8;
  void *v9;
  id v10;

  -[SKUIGiftStepViewController gift](self, "gift", a3);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[NSArray objectAtIndex:](self->_themes, "objectAtIndex:", self->_selectedThemeIndex);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTheme:", v4);
  v5 = [SKUIGiftConfirmViewController alloc];
  -[SKUIGiftStepViewController giftConfiguration](self, "giftConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SKUIGiftConfirmViewController initWithGift:configuration:](v5, "initWithGift:configuration:", v10, v6);

  -[SKUIGiftStepViewController operationQueue](self, "operationQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIGiftStepViewController setOperationQueue:](v7, "setOperationQueue:", v8);

  -[SKUIGiftThemePickerViewController navigationController](self, "navigationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pushViewController:animated:", v7, 1);

}

- (double)_cardHeight:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  double v7;
  void *v8;
  double v9;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  if ((v6 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    if (-[SKUIGiftThemePickerViewController _isIPadLarge](self, "_isIPadLarge"))
      v7 = 684.0;
    else
      v7 = 440.0;
  }
  else if (objc_msgSend(v4, "userInterfaceIdiom") || objc_msgSend(v4, "verticalSizeClass") != 1)
  {
    -[SKUIGiftThemePickerViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bounds");
    v7 = v9 + -63.0;

  }
  else
  {
    v7 = 284.0;
  }

  return v7;
}

- (double)_cardWidth
{
  _BOOL4 v2;
  void *v3;
  uint64_t v4;
  float v5;
  float v6;
  float v7;

  v2 = -[SKUIGiftThemePickerViewController _isIPadLarge](self, "_isIPadLarge");
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  v5 = 5.0;
  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v5 = 25.0;
  v6 = (float)(v5 * 2.0) + 397.0;
  v7 = (float)(v5 * 2.0) + 262.0;
  if (v2)
    return v6;
  return v7;
}

- (id)_collectionView
{
  SKUIGiftThemeCollectionView *collectionView;
  SKUIGiftThemeCollectionView *v4;
  void *v5;
  SKUIGiftThemeCollectionView *v6;
  SKUIGiftThemeCollectionView *v7;

  collectionView = self->_collectionView;
  if (!collectionView)
  {
    v4 = [SKUIGiftThemeCollectionView alloc];
    -[SKUIGiftThemePickerViewController _flowLayout](self, "_flowLayout");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[SKUIGiftThemeCollectionView initWithFrame:collectionViewLayout:](v4, "initWithFrame:collectionViewLayout:", v5, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v7 = self->_collectionView;
    self->_collectionView = v6;

    -[SKUIGiftThemeCollectionView registerClass:forCellWithReuseIdentifier:](self->_collectionView, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("0"));
    -[SKUIGiftThemeCollectionView setAlwaysBounceHorizontal:](self->_collectionView, "setAlwaysBounceHorizontal:", 1);
    -[SKUIGiftThemeCollectionView setClipsToBounds:](self->_collectionView, "setClipsToBounds:", 0);
    -[SKUIGiftThemeCollectionView setDataSource:](self->_collectionView, "setDataSource:", self);
    -[SKUIGiftThemeCollectionView setDelegate:](self->_collectionView, "setDelegate:", self);
    -[SKUIGiftThemeCollectionView setPagingEnabled:](self->_collectionView, "setPagingEnabled:", 1);
    -[SKUIGiftThemeCollectionView setShowsHorizontalScrollIndicator:](self->_collectionView, "setShowsHorizontalScrollIndicator:", 0);
    collectionView = self->_collectionView;
  }
  return collectionView;
}

- (double)_collectionViewWidth:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  double v7;
  void *v8;
  double v9;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  if ((v6 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    if (-[SKUIGiftThemePickerViewController _isIPadLarge](self, "_isIPadLarge"))
      v7 = 784.0;
    else
      v7 = 540.0;
  }
  else if (objc_msgSend(v4, "userInterfaceIdiom") || objc_msgSend(v4, "verticalSizeClass") != 1)
  {
    -[SKUIGiftThemePickerViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bounds");
    v7 = v9;

  }
  else
  {
    v7 = 414.0;
  }

  return v7;
}

- (id)_flowLayout
{
  SKUIGiftThemePickerFlowLayout *flowLayout;
  SKUIGiftThemePickerFlowLayout *v4;
  SKUIGiftThemePickerFlowLayout *v5;

  flowLayout = self->_flowLayout;
  if (!flowLayout)
  {
    v4 = objc_alloc_init(SKUIGiftThemePickerFlowLayout);
    v5 = self->_flowLayout;
    self->_flowLayout = v4;

    -[UICollectionViewFlowLayout setMinimumInteritemSpacing:](self->_flowLayout, "setMinimumInteritemSpacing:", 0.0);
    -[UICollectionViewFlowLayout setMinimumLineSpacing:](self->_flowLayout, "setMinimumLineSpacing:", 0.0);
    -[UICollectionViewFlowLayout setScrollDirection:](self->_flowLayout, "setScrollDirection:", 1);
    flowLayout = self->_flowLayout;
  }
  return flowLayout;
}

- (BOOL)_isIPadLarge
{
  void *v2;
  uint64_t v3;
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  CGRect v14;
  CGRect v15;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  if ((v3 & 0xFFFFFFFFFFFFFFFBLL) != 1)
    return 0;
  objc_msgSend(MEMORY[0x1E0DC3F98], "keyWindow");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v14.origin.x = v6;
  v14.origin.y = v8;
  v14.size.width = v10;
  v14.size.height = v12;
  if (CGRectGetWidth(v14) < 1024.0)
    return 0;
  v15.origin.x = v6;
  v15.origin.y = v8;
  v15.size.width = v10;
  v15.size.height = v12;
  return CGRectGetHeight(v15) >= 1024.0;
}

- (void)_layoutCollectionViewWithTraits:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  id v16;

  v4 = a3;
  -[SKUIGiftThemePickerViewController _scrollInsetHorizontal:](self, "_scrollInsetHorizontal:", v4);
  v6 = v5;
  -[SKUIGiftThemePickerViewController _cardHeight:](self, "_cardHeight:", v4);
  v8 = v7;
  -[SKUIGiftThemePickerViewController _flowLayout](self, "_flowLayout");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIGiftThemePickerViewController _cardWidth](self, "_cardWidth");
  objc_msgSend(v9, "setItemSize:");

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "userInterfaceIdiom");

  if ((v11 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v12 = 52.0;
  else
    v12 = 22.0;
  -[SKUIGiftThemePickerViewController _collectionViewWidth:](self, "_collectionViewWidth:", v4);
  v14 = v13;

  -[SKUIGiftThemePickerViewController _collectionView](self, "_collectionView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFrame:", v6, v12, v14 + v6 * -2.0, v8);

  -[SKUIGiftThemePickerViewController _collectionView](self, "_collectionView");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setVisibleBoundsInsets:", 0.0, -v6, 0.0, -v6);

}

- (double)_scrollInsetHorizontal:(id)a3
{
  double v4;
  double v5;
  double v6;

  -[SKUIGiftThemePickerViewController _collectionViewWidth:](self, "_collectionViewWidth:", a3);
  v5 = v4;
  -[SKUIGiftThemePickerViewController _cardWidth](self, "_cardWidth");
  return (v5 - v6) * 0.5;
}

- (void)_setItemImage:(id)a3 error:(id)a4
{
  id v6;
  void *v7;
  UIImage **p_itemImage;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    -[SKUIGiftThemeCollectionView visibleCells](self->_collectionView, "visibleCells");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    p_itemImage = &self->_itemImage;
    objc_storeStrong((id *)p_itemImage, a3);
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v15;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v15 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v13++), "setItemImage:", *p_itemImage, (_QWORD)v14);
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v11);
    }

  }
}

- (void)_setSelectedThemeIndex:(int64_t)a3 animated:(BOOL)a4
{
  self->_selectedThemeIndex = a3;
  -[SKUIGiftThemePickerFlowLayout setCurrentPage:](self->_flowLayout, "setCurrentPage:");
  -[UIPageControl setCurrentPage:](self->_pageControl, "setCurrentPage:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_themes, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_pageControl, 0);
  objc_storeStrong((id *)&self->_itemImage, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_flowLayout, 0);
}

- (void)initWithGift:configuration:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIGiftThemePickerViewController initWithGift:configuration:]";
}

@end
