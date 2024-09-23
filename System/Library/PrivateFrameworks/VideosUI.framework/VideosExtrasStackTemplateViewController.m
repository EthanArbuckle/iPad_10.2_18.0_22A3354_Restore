@implementation VideosExtrasStackTemplateViewController

- (BOOL)showsPlaceholder
{
  return 0;
}

- (VideosExtrasStackTemplateViewController)initWithDocument:(id)a3 options:(id)a4 context:(id)a5
{
  VideosExtrasStackTemplateViewController *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *viewControllers;
  NSMutableDictionary *v8;
  NSMutableDictionary *sizes;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)VideosExtrasStackTemplateViewController;
  v5 = -[VideosExtrasTemplateViewController initWithDocument:options:context:](&v12, sel_initWithDocument_options_context_, a3, a4, a5);
  if (v5)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    viewControllers = v5->_viewControllers;
    v5->_viewControllers = v6;

    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    sizes = v5->_sizes;
    v5->_sizes = v8;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", v5, sel__dynamicTypeDidChange, *MEMORY[0x1E0DC48E8], 0);

  }
  return v5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)VideosExtrasStackTemplateViewController;
  -[VideosExtrasTemplateViewController dealloc](&v4, sel_dealloc);
}

- (void)_dynamicTypeDidChange
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[UICollectionView visibleCells](self->_collectionView, "visibleCells");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v7), "viewController");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "collectionView");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "collectionViewLayout");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "invalidateLayout");
        objc_msgSend(v10, "prepareLayout");

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }
  -[UICollectionViewFlowLayout invalidateLayout](self->_collectionViewLayout, "invalidateLayout");

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  UICollectionViewFlowLayout *v8;
  UICollectionViewFlowLayout *collectionViewLayout;
  id v10;
  UICollectionView *v11;
  UICollectionView *collectionView;
  void *v13;
  void *v14;
  UICollectionView *v15;
  VideosExtrasBannerController *v16;
  void *v17;
  void *v18;
  VideosExtrasBannerController *v19;
  VideosExtrasBannerController *bannerViewController;
  VideosExtrasBannerController *v21;
  void *v22;
  void *v23;
  UICollectionView *v24;
  void *v25;
  void *v26;
  void *v27;
  UICollectionView *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[5];
  objc_super v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  v35.receiver = self;
  v35.super_class = (Class)VideosExtrasStackTemplateViewController;
  -[VideosExtrasTemplateViewController viewDidLoad](&v35, sel_viewDidLoad);
  -[VideosExtrasStackTemplateViewController templateElement](self, "templateElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "background");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasTemplateViewController configureBackgroundWithElements:](self, "configureBackgroundWithElements:", v5);

  -[VideosExtrasStackTemplateViewController templateElement](self, "templateElement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "documentBanner");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasElementViewController _configureBannerWithElement:](self, "_configureBannerWithElement:", v7);

  v8 = (UICollectionViewFlowLayout *)objc_alloc_init(MEMORY[0x1E0DC3610]);
  collectionViewLayout = self->_collectionViewLayout;
  self->_collectionViewLayout = v8;

  -[UICollectionViewFlowLayout setSectionInset:](self->_collectionViewLayout, "setSectionInset:", 10.0, 0.0, 10.0, 0.0);
  v10 = objc_alloc(MEMORY[0x1E0DC35B8]);
  v11 = (UICollectionView *)objc_msgSend(v10, "initWithFrame:collectionViewLayout:", self->_collectionViewLayout, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  collectionView = self->_collectionView;
  self->_collectionView = v11;

  -[UICollectionView setShowsVerticalScrollIndicator:](self->_collectionView, "setShowsVerticalScrollIndicator:", 0);
  -[UICollectionView setShowsHorizontalScrollIndicator:](self->_collectionView, "setShowsHorizontalScrollIndicator:", 0);
  -[UICollectionView setTranslatesAutoresizingMaskIntoConstraints:](self->_collectionView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UICollectionView registerClass:forCellWithReuseIdentifier:](self->_collectionView, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("VideosExtrasStackCollectionCellIdentifier"));
  -[UICollectionView registerClass:forSupplementaryViewOfKind:withReuseIdentifier:](self->_collectionView, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(), *MEMORY[0x1E0DC48A8], CFSTR("VideosExtrasStackCollectionHeaderIdentifier"));
  -[VideosExtrasStackTemplateViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addSubview:", self->_collectionView);

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView setBackgroundColor:](self->_collectionView, "setBackgroundColor:", v14);

  -[UICollectionView setDataSource:](self->_collectionView, "setDataSource:", self);
  -[UICollectionView setDelegate:](self->_collectionView, "setDelegate:", self);
  v15 = self->_collectionView;
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __54__VideosExtrasStackTemplateViewController_viewDidLoad__block_invoke;
  v34[3] = &unk_1E9FA0300;
  v34[4] = self;
  _MPUEnumerateItemsOfCollectionView(v15, 0, v34);
  v16 = [VideosExtrasBannerController alloc];
  -[VideosExtrasStackTemplateViewController templateElement](self, "templateElement");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "documentBanner");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[VideosExtrasBannerController initWithBannerElement:](v16, "initWithBannerElement:", v18);
  bannerViewController = self->_bannerViewController;
  self->_bannerViewController = v19;

  -[VideosExtrasBannerController setVignetteType:](self->_bannerViewController, "setVignetteType:", 4);
  v21 = self->_bannerViewController;
  -[VideosExtrasStackTemplateViewController view](self, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasBannerController installBannerOnView:anchoredToScrollView:](v21, "installBannerOnView:anchoredToScrollView:", v22, self->_collectionView);

  v23 = (void *)MEMORY[0x1E0CB3718];
  v24 = self->_collectionView;
  -[VideosExtrasStackTemplateViewController view](self, "view");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintsByAttachingView:toView:alongEdges:insets:", v24, v25, 14, *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = (void *)MEMORY[0x1E0CB3718];
  v28 = self->_collectionView;
  -[VideosExtrasStackTemplateViewController view](self, "view");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "safeAreaLayoutGuide");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v28, 3, 0, v30, 3, 1.0, 0.0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v26, "arrayByAddingObject:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasStackTemplateViewController view](self, "view");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "addConstraints:", v32);

}

void __54__VideosExtrasStackTemplateViewController_viewDidLoad__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_viewControllerForIndexPath:", a2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "collectionViewLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "prepareLayout");

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)VideosExtrasStackTemplateViewController;
  -[VideosExtrasElementViewController viewWillAppear:](&v14, sel_viewWillAppear_, a3);
  -[UICollectionView reloadData](self->_collectionView, "reloadData");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[NSMutableDictionary allValues](self->_viewControllers, "allValues", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8), "contentScrollView");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v9, "reloadData");

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v6);
  }

}

- (id)contentScrollView
{
  return self->_collectionView;
}

- (id)templateElement
{
  void *v2;
  void *v3;

  -[VideosExtrasTemplateViewController document](self, "document");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "templateElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)sectionStyle
{
  void *v2;
  void *v3;
  void *v4;

  switch(-[VideosExtrasElementViewController extrasSize](self, "extrasSize"))
  {
    case 1uLL:
      +[VideosExtrasGridElementViewController mediumStackGridStyle](VideosExtrasGridElementViewController, "mediumStackGridStyle");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2uLL:
      +[VideosExtrasGridElementViewController largeStackGridStyle](VideosExtrasGridElementViewController, "largeStackGridStyle");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3uLL:
      +[VideosExtrasGridElementViewController extraLargeStackGridStyle](VideosExtrasGridElementViewController, "extraLargeStackGridStyle");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 4uLL:
      +[VideosExtrasGridElementViewController wideStackGridStyle](VideosExtrasGridElementViewController, "wideStackGridStyle");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      +[VideosExtrasGridElementViewController smallStackGridStyle](VideosExtrasGridElementViewController, "smallStackGridStyle");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      break;
  }
  v3 = v2;
  objc_msgSend(v2, "sectionHeaderStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_prepareLayout
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  uint64_t v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)VideosExtrasStackTemplateViewController;
  -[VideosExtrasElementViewController _prepareLayout](&v24, sel__prepareLayout);
  -[UICollectionView contentInset](self->_collectionView, "contentInset");
  v3 = -[VideosExtrasElementViewController isWide](self, "isWide");
  -[VideosExtrasStackTemplateViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeAreaInsets");
  v7 = v6;

  -[VideosExtrasStackTemplateViewController navigationController](self, "navigationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "view");
  v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v9, "safeAreaInsets");
  v11 = v10;

  -[VideosExtrasStackTemplateViewController parentViewController](self, "parentViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v9) = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[VideosExtrasStackTemplateViewController navigationController](self, "navigationController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "mainTemplateViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bounds");
    v17 = v16;

    v18 = 60.0;
    if (v17 > 60.0)
    {
      objc_msgSend(v14, "menuBarView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "bounds");
      v21 = v20;

      v18 = fmax(v21, 60.0);
    }

  }
  else
  {
    v18 = 60.0;
  }
  v22 = 112.0;
  if (v3)
    v22 = 260.0;
  -[UICollectionView setContentInset:](self->_collectionView, "setContentInset:", v22, v7, v18, v11);
  -[UICollectionView collectionViewLayout](self->_collectionView, "collectionViewLayout");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "invalidateLayout");

}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("VideosExtrasStackCollectionCellIdentifier"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setParentViewController:", self);
  -[VideosExtrasStackTemplateViewController _viewControllerForIndexPath:](self, "_viewControllerForIndexPath:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setViewController:", v8);
  return v7;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v8 = a5;
  objc_msgSend(a3, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", a4, CFSTR("VideosExtrasStackCollectionHeaderIdentifier"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "section");

  -[VideosExtrasStackTemplateViewController templateElement](self, "templateElement");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "collectionList");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "collections");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectAtIndex:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "header");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasStackTemplateViewController sectionStyle](self, "sectionStyle");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "configureForHeaderElement:headerStyle:", v15, v16);

  return v9;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGSize result;

  v8 = a3;
  v9 = a4;
  if (collectionView_layout_referenceSizeForHeaderInSection__onceToken_0 != -1)
    dispatch_once(&collectionView_layout_referenceSizeForHeaderInSection__onceToken_0, &__block_literal_global_124);
  -[VideosExtrasStackTemplateViewController templateElement](self, "templateElement");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "collectionList");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "collections");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectAtIndex:", a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "header");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)collectionView_layout_referenceSizeForHeaderInSection____sizingView_0;
    -[VideosExtrasStackTemplateViewController sectionStyle](self, "sectionStyle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "configureForHeaderElement:headerStyle:", v14, v16);

    objc_msgSend((id)collectionView_layout_referenceSizeForHeaderInSection____sizingView_0, "systemLayoutSizeFittingSize:", *MEMORY[0x1E0DC4FF8], *(double *)(MEMORY[0x1E0DC4FF8] + 8));
    v18 = v17;
    v20 = v19;
  }
  else
  {
    v18 = *MEMORY[0x1E0C9D820];
    v20 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }

  v21 = v18;
  v22 = v20;
  result.height = v22;
  result.width = v21;
  return result;
}

void __97__VideosExtrasStackTemplateViewController_collectionView_layout_referenceSizeForHeaderInSection___block_invoke()
{
  VideosExtrasCollectionReusableView *v0;
  void *v1;

  v0 = objc_alloc_init(VideosExtrasCollectionReusableView);
  v1 = (void *)collectionView_layout_referenceSizeForHeaderInSection____sizingView_0;
  collectionView_layout_referenceSizeForHeaderInSection____sizingView_0 = (uint64_t)v0;

}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;

  -[VideosExtrasStackTemplateViewController templateElement](self, "templateElement", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "collectionList");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "collections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  return v6;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return 1;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  void *v6;
  void *v7;
  double v8;
  double v9;
  CGFloat Width;
  double v11;
  double v12;
  CGSize result;
  CGRect v14;

  -[NSMutableDictionary objectForKey:](self->_sizes, "objectForKey:", a5, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "CGSizeValue");
    v9 = v8;
  }
  else
  {
    v9 = 1.0;
  }
  -[UICollectionView bounds](self->_collectionView, "bounds");
  Width = CGRectGetWidth(v14);

  v11 = Width;
  v12 = v9;
  result.height = v12;
  result.width = v11;
  return result;
}

- (id)_viewControllerForIndexPath:(id)a3
{
  id v4;
  VideosExtrasGridElementViewController *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  NSMutableDictionary *sizes;
  void *v22;

  v4 = a3;
  -[NSMutableDictionary objectForKey:](self->_viewControllers, "objectForKey:", v4);
  v5 = (VideosExtrasGridElementViewController *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[VideosExtrasStackTemplateViewController templateElement](self, "templateElement");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "collectionList");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "collections");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v4, "section"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = objc_alloc_init(VideosExtrasGridElementViewController);
    +[VideosExtrasGridElementViewController smallStackGridStyle](VideosExtrasGridElementViewController, "smallStackGridStyle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[VideosExtrasGridElementViewController setSmallStyle:](v5, "setSmallStyle:", v10);

    +[VideosExtrasGridElementViewController mediumStackGridStyle](VideosExtrasGridElementViewController, "mediumStackGridStyle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[VideosExtrasGridElementViewController setMediumStyle:](v5, "setMediumStyle:", v11);

    +[VideosExtrasGridElementViewController largeStackGridStyle](VideosExtrasGridElementViewController, "largeStackGridStyle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[VideosExtrasGridElementViewController setLargeStyle:](v5, "setLargeStyle:", v12);

    +[VideosExtrasGridElementViewController extraLargeStackGridStyle](VideosExtrasGridElementViewController, "extraLargeStackGridStyle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[VideosExtrasGridElementViewController setExtraLargeStyle:](v5, "setExtraLargeStyle:", v13);

    +[VideosExtrasGridElementViewController wideStackGridStyle](VideosExtrasGridElementViewController, "wideStackGridStyle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[VideosExtrasGridElementViewController setWideStyle:](v5, "setWideStyle:", v14);

    -[VideosExtrasGridElementViewController view](v5, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[VideosExtrasStackTemplateViewController view](self, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "frame");
    objc_msgSend(v15, "setBounds:", 0.0, 0.0);

    -[VideosExtrasGridElementViewController setViewElement:](v5, "setViewElement:", v9);
    -[VideosExtrasGridElementViewController setShelfStyle:](v5, "setShelfStyle:", 1);
    -[VideosExtrasGridElementViewController collectionView](v5, "collectionView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "collectionViewLayout");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "prepareLayout");

    -[VideosExtrasGridElementViewController preferredContentSize](v5, "preferredContentSize");
    if (*MEMORY[0x1E0C9D820] != v20 || *(double *)(MEMORY[0x1E0C9D820] + 8) != v19)
    {
      sizes = self->_sizes;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](sizes, "setObject:forKey:", v22, v4);

    }
    -[NSMutableDictionary setObject:forKey:](self->_viewControllers, "setObject:forKey:", v5, v4);

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bannerViewController, 0);
  objc_storeStrong((id *)&self->_sizes, 0);
  objc_storeStrong((id *)&self->_viewControllers, 0);
  objc_storeStrong((id *)&self->_collectionViewLayout, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
}

@end
