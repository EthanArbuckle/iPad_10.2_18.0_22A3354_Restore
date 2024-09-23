@implementation VideosExtrasMainTemplateViewController

- (BOOL)showsPlaceholder
{
  return 0;
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

- (VideosExtrasMainTemplateViewController)initWithDocument:(id)a3 options:(id)a4 context:(id)a5
{
  VideosExtrasMainTemplateViewController *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VideosExtrasMainTemplateViewController;
  v5 = -[VideosExtrasTemplateViewController initWithDocument:options:context:](&v8, sel_initWithDocument_options_context_, a3, a4, a5);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v5, sel__dynamicTypeChanged, *MEMORY[0x1E0DC48E8], 0);

    -[VideosExtrasMainTemplateViewController _prepareCollectionView](v5, "_prepareCollectionView");
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
  v4.super_class = (Class)VideosExtrasMainTemplateViewController;
  -[VideosExtrasTemplateViewController dealloc](&v4, sel_dealloc);
}

- (void)_prepareCollectionView
{
  VideosExtrasMainMenuSectionMetrics *v3;
  VideosExtrasMainMenuSectionMetrics *mainMenuMetrics;
  UICollectionViewFlowLayout *v5;
  UICollectionViewFlowLayout *collectionViewLayout;
  id v7;
  UICollectionView *v8;
  UICollectionView *menuBarCollectionView;
  UICollectionView *v10;
  void *v11;
  id v12;

  v3 = objc_alloc_init(VideosExtrasMainMenuSectionMetrics);
  mainMenuMetrics = self->_mainMenuMetrics;
  self->_mainMenuMetrics = v3;

  -[VideosExtrasMainMenuSectionMetrics setDataSource:](self->_mainMenuMetrics, "setDataSource:", self);
  v5 = (UICollectionViewFlowLayout *)objc_alloc_init(MEMORY[0x1E0DC3610]);
  collectionViewLayout = self->_collectionViewLayout;
  self->_collectionViewLayout = v5;

  -[UICollectionViewFlowLayout setMinimumLineSpacing:](self->_collectionViewLayout, "setMinimumLineSpacing:", 0.0);
  v7 = objc_alloc(MEMORY[0x1E0DC35B8]);
  v8 = (UICollectionView *)objc_msgSend(v7, "initWithFrame:collectionViewLayout:", self->_collectionViewLayout, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  menuBarCollectionView = self->_menuBarCollectionView;
  self->_menuBarCollectionView = v8;

  -[UICollectionView setTranslatesAutoresizingMaskIntoConstraints:](self->_menuBarCollectionView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UICollectionView registerClass:forCellWithReuseIdentifier:](self->_menuBarCollectionView, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("VideosExtrasMenuBarItemIdentifier"));
  v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC4028]), "initWithPrivateStyle:", 11050);
  objc_msgSend(v12, "setComputesColorSettings:", 0);
  objc_msgSend(v12, "setSimulatesMasks:", 1);
  objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UICollectionView setShowsHorizontalScrollIndicator:](self->_menuBarCollectionView, "setShowsHorizontalScrollIndicator:", 0);
  -[UICollectionView setBackgroundView:](self->_menuBarCollectionView, "setBackgroundView:", v12);
  -[UICollectionView setShowsVerticalScrollIndicator:](self->_menuBarCollectionView, "setShowsVerticalScrollIndicator:", 0);
  v10 = self->_menuBarCollectionView;
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView setBackgroundColor:](v10, "setBackgroundColor:", v11);

  -[UICollectionView setDataSource:](self->_menuBarCollectionView, "setDataSource:", self);
  -[UICollectionView setDelegate:](self->_menuBarCollectionView, "setDelegate:", self);
  -[UICollectionViewFlowLayout setScrollDirection:](self->_collectionViewLayout, "setScrollDirection:", 1);
  -[UICollectionView setContentInset:](self->_menuBarCollectionView, "setContentInset:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
  objc_storeStrong((id *)&self->_menuBarView, self->_menuBarCollectionView);
  -[VideosExtrasMainTemplateViewController _recalculateSizes](self, "_recalculateSizes");

}

- (void)viewDidLoad
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VideosExtrasMainTemplateViewController;
  -[VideosExtrasTemplateViewController viewDidLoad](&v8, sel_viewDidLoad);
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[VideosExtrasMainTemplateViewController templateElement](self, "templateElement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "background");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[VideosExtrasMainTemplateViewController templateElement](self, "templateElement");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "background");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v7);

  }
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VideosExtrasMainTemplateViewController;
  -[VideosExtrasElementViewController viewWillAppear:](&v3, sel_viewWillAppear_, a3);
}

- (void)_prepareLayout
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VideosExtrasMainTemplateViewController;
  -[VideosExtrasElementViewController _prepareLayout](&v3, sel__prepareLayout);
  -[VideosExtrasMainTemplateViewController _recalculateSizes](self, "_recalculateSizes");
}

- (double)collectionViewHeight
{
  double result;

  -[NSLayoutConstraint constant](self->_collectionViewHeightConstraint, "constant");
  return result;
}

- (void)setCollectionViewHeight:(double)a3
{
  NSLayoutConstraint *collectionViewHeightConstraint;
  NSLayoutConstraint *v6;
  NSLayoutConstraint *v7;
  double v8;
  void *v9;
  id v10;

  collectionViewHeightConstraint = self->_collectionViewHeightConstraint;
  if (!collectionViewHeightConstraint)
  {
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_menuBarCollectionView, 8, 0, 0, 0, 1.0, a3);
    v6 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    v7 = self->_collectionViewHeightConstraint;
    self->_collectionViewHeightConstraint = v6;

    -[NSLayoutConstraint setIdentifier:](self->_collectionViewHeightConstraint, "setIdentifier:", CFSTR("collectionViewHeight"));
    -[UICollectionView addConstraint:](self->_menuBarCollectionView, "addConstraint:", self->_collectionViewHeightConstraint);
    collectionViewHeightConstraint = self->_collectionViewHeightConstraint;
  }
  -[NSLayoutConstraint constant](collectionViewHeightConstraint, "constant");
  if (v8 != a3)
    -[NSLayoutConstraint setConstant:](self->_collectionViewHeightConstraint, "setConstant:", a3);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "postNotificationName:object:", CFSTR("VideosExtrasMainTemplateBarHeightChangeNotification"), v9);

}

- (id)_menuItems
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[VideosExtrasMainTemplateViewController templateElement](self, "templateElement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "menuBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "items");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return -[VideosExtrasMainTemplateViewController numberOfItemsForSectionMetrics:](self, "numberOfItemsForSectionMetrics:", 0, a4);
}

- (id)_textElementAtIndex:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[VideosExtrasMainTemplateViewController _menuItems](self, "_menuItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_configureCell:(id)a3 forIndexPath:(id)a4
{
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
  id v16;

  v16 = a3;
  -[VideosExtrasMainTemplateViewController _textElementAtIndex:](self, "_textElementAtIndex:", objc_msgSend(a4, "item"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "textLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasMainMenuSectionMetrics fittingFontDescriptor](self->_mainMenuMetrics, "fittingFontDescriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0DC13B8]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "keyWindow");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "traitCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "preferredContentSizeCategory");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)v13 <= *MEMORY[0x1E0DC48C0])
  {
    v14 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithPreferredContentSizeCategory:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v7, "configureForIKTextElement:fontDescriptor:textStyle:capitalize:overrideWithTraitCollection:", v6, v8, v9, 0, v14);
  objc_msgSend(v16, "contentView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "invalidateIntrinsicContentSize");

}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("VideosExtrasMenuBarItemIdentifier"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasMainTemplateViewController _configureCell:forIndexPath:](self, "_configureCell:forIndexPath:", v7, v6);

  return v7;
}

- (BOOL)_collectionView:(id)a3 indexPathShouldDisplayAsSelected:(id)a4
{
  _BOOL4 hasHadMenuSelection;
  id v7;
  void *v8;
  char v9;

  hasHadMenuSelection = self->_hasHadMenuSelection;
  v7 = a4;
  if (hasHadMenuSelection)
  {
    objc_msgSend(a3, "indexPathsForSelectedItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "containsObject:", v7);

    v7 = v8;
  }
  else
  {
    v9 = -[VideosExtrasMainTemplateViewController _isFeatureItemAtIndexPath:](self, "_isFeatureItemAtIndexPath:", v7);
  }

  return v9;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v8;

  v8 = a4;
  objc_msgSend(v8, "setSelected:", -[VideosExtrasMainTemplateViewController _collectionView:indexPathShouldDisplayAsSelected:](self, "_collectionView:indexPathShouldDisplayAsSelected:", a3, a5));

}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  return !-[VideosExtrasMainTemplateViewController _collectionView:indexPathShouldDisplayAsSelected:](self, "_collectionView:indexPathShouldDisplayAsSelected:", a3, a4);
}

- (BOOL)_isFeatureItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[VideosExtrasMainTemplateViewController _menuItems](self, "_menuItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "item");

  objc_msgSend(v5, "objectAtIndex:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "attributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("type"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v8) = objc_msgSend(v9, "isEqualToString:", CFSTR("video"));
  return (char)v8;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!self->_hasHadMenuSelection)
  {
    self->_hasHadMenuSelection = 1;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    objc_msgSend(v6, "visibleCells", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v23 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          objc_msgSend(v6, "indexPathForCell:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setSelected:", -[VideosExtrasMainTemplateViewController _collectionView:indexPathShouldDisplayAsSelected:](self, "_collectionView:indexPathShouldDisplayAsSelected:", v6, v14));

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v10);
    }

  }
  -[VideosExtrasMainTemplateViewController _menuItems](self, "_menuItems");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectAtIndex:", objc_msgSend(v7, "item"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasMainTemplateViewController didSelectDelegate](self, "didSelectDelegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_opt_respondsToSelector();

  if ((v18 & 1) != 0)
  {
    -[VideosExtrasMainTemplateViewController didSelectDelegate](self, "didSelectDelegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "collectionView:didSelectItemAtIndexPath:", v6, v7);

  }
  if (-[VideosExtrasMainTemplateViewController _isFeatureItemAtIndexPath:](self, "_isFeatureItemAtIndexPath:", v7))
  {
    -[VideosExtrasTemplateViewController context](self, "context");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "extrasRootViewController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "popToFeatureOrMain");

  }
  else
  {
    objc_msgSend(v16, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", 2, 1, 0, 0, &__block_literal_global_123);
  }

}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  double v5;
  double v6;
  CGSize result;

  -[VideosExtrasMainMenuSectionMetrics sizeForCellAtIndex:](self->_mainMenuMetrics, "sizeForCellAtIndex:", objc_msgSend(a5, "item", a3, a4));
  result.height = v6;
  result.width = v5;
  return result;
}

- (int64_t)numberOfItemsForSectionMetrics:(id)a3
{
  void *v3;
  int64_t v4;

  -[VideosExtrasMainTemplateViewController _menuItems](self, "_menuItems", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (CGSize)sectionMetrics:(id)a3 sizeForItemAtIndex:(int64_t)a4 withFontDescriptor:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGSize result;

  v7 = a5;
  +[_VideosExtrasMainMenuItemCollectionViewCell _createLabelInCell:](_VideosExtrasMainMenuItemCollectionViewCell, "_createLabelInCell:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasMainTemplateViewController _textElementAtIndex:](self, "_textElementAtIndex:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0DC13B8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "keyWindow");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "traitCollection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "preferredContentSizeCategory");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  if ((unint64_t)v14 > *MEMORY[0x1E0DC48C0])
  {
    objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithPreferredContentSizeCategory:");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v8, "configureForIKTextElement:fontDescriptor:textStyle:capitalize:overrideWithTraitCollection:", v9, v7, v10, 0, v15);
  objc_msgSend(v8, "intrinsicContentSize");
  v17 = v16;
  objc_msgSend(v8, "font");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "userInterfaceIdiom");
  v21 = 40.0;
  if (!v20)
    v21 = 32.0;
  objc_msgSend(v18, "_scaledValueForValue:", v21);
  v23 = v22;
  objc_msgSend((id)*MEMORY[0x1E0DC4730], "keyWindow");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "safeAreaInsets");
  v26 = v23 + v25;

  v27 = v17;
  v28 = v26;
  result.height = v28;
  result.width = v27;
  return result;
}

- (NSIndexPath)indexPathOfFeaturedItem
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[VideosExtrasMainTemplateViewController _menuItems](self, "_menuItems");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v7, "attributes", (_QWORD)v13);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKey:", CFSTR("type"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("video"));

        if (v10)
        {
          objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", objc_msgSend(v2, "indexOfObject:", v7), 0);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v4)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return (NSIndexPath *)v11;
}

- (void)_recalculateSizes
{
  void *v3;
  UICollectionView *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  UICollectionViewFlowLayout *collectionViewLayout;
  UICollectionViewFlowLayout *v12;
  id v13;
  CGRect v14;

  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E0DC4B10]);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E0DC4A98]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = self->_menuBarCollectionView;
  -[VideosExtrasMainTemplateViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v6 = fabs(CGRectGetWidth(v14));

  -[VideosExtrasMainMenuSectionMetrics setDesiredFontDescriptor:](self->_mainMenuMetrics, "setDesiredFontDescriptor:", v13);
  -[VideosExtrasMainMenuSectionMetrics setMinimumFontDescriptor:](self->_mainMenuMetrics, "setMinimumFontDescriptor:", v3);
  -[VideosExtrasMainMenuSectionMetrics setMinimumCellSpacing:](self->_mainMenuMetrics, "setMinimumCellSpacing:", 20.0);
  v7 = 40.0;
  if (v6 <= 480.0)
    v7 = 30.0;
  if (v6 >= 1024.0)
    v7 = 55.0;
  -[VideosExtrasMainMenuSectionMetrics setDesiredCellSpacing:](self->_mainMenuMetrics, "setDesiredCellSpacing:", v7);
  -[VideosExtrasMainMenuSectionMetrics setDesiredWidth:](self->_mainMenuMetrics, "setDesiredWidth:", v6);
  -[VideosExtrasMainMenuSectionMetrics updateSizes](self->_mainMenuMetrics, "updateSizes");
  -[VideosExtrasMainMenuSectionMetrics totalFittingSize](self->_mainMenuMetrics, "totalFittingSize");
  v9 = v8;
  -[VideosExtrasMainTemplateViewController setCollectionViewHeight:](self, "setCollectionViewHeight:", v10);
  if (v9 >= v6)
  {
    -[UICollectionView setScrollEnabled:](v4, "setScrollEnabled:", 1);
    collectionViewLayout = self->_collectionViewLayout;
    -[VideosExtrasMainMenuSectionMetrics fittingCellSpacing](self->_mainMenuMetrics, "fittingCellSpacing");
  }
  else
  {
    -[UICollectionView setScrollEnabled:](v4, "setScrollEnabled:", 0);
    collectionViewLayout = self->_collectionViewLayout;
  }
  UIEdgeInsetsMakeWithEdges();
  -[UICollectionViewFlowLayout setSectionInset:](collectionViewLayout, "setSectionInset:");
  v12 = self->_collectionViewLayout;
  -[VideosExtrasMainMenuSectionMetrics fittingCellSpacing](self->_mainMenuMetrics, "fittingCellSpacing");
  -[UICollectionViewFlowLayout setMinimumInteritemSpacing:](v12, "setMinimumInteritemSpacing:");
  -[UICollectionViewFlowLayout invalidateLayout](self->_collectionViewLayout, "invalidateLayout");

}

- (UIView)menuBarView
{
  return self->_menuBarView;
}

- (UICollectionViewDelegate)didSelectDelegate
{
  return (UICollectionViewDelegate *)objc_loadWeakRetained((id *)&self->_didSelectDelegate);
}

- (void)setDidSelectDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_didSelectDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_didSelectDelegate);
  objc_storeStrong((id *)&self->_menuBarView, 0);
  objc_storeStrong((id *)&self->_menuBarCollectionView, 0);
  objc_storeStrong((id *)&self->_collectionViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_collectionViewLayout, 0);
  objc_storeStrong((id *)&self->_mainMenuMetrics, 0);
}

@end
