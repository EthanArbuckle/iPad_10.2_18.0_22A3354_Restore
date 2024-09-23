@implementation BSUIScreenshotViewController

- (BSUIScreenshotViewController)initWithScreenshots:(id)a3 andSelectedIndex:(int64_t)a4
{
  id v6;
  BSUIScreenshotViewController *v7;
  NSMutableArray *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  BSUIScreenshot *v15;
  BSUIScreenshot *v16;
  BSUIScreenshotLoader *v17;
  BSUIScreenshotLoader *screenshotLoader;
  void *v19;
  void *v20;
  id v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  objc_super v27;
  _BYTE v28[128];

  v6 = a3;
  v27.receiver = self;
  v27.super_class = (Class)BSUIScreenshotViewController;
  v7 = -[BSUIScreenshotViewController init](&v27, "init");
  if (v7)
  {
    v8 = objc_opt_new(NSMutableArray);
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v9 = v6;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v24;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v24 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)v13);
          v15 = [BSUIScreenshot alloc];
          v16 = -[BSUIScreenshot initWithDictionary:](v15, "initWithDictionary:", v14, (_QWORD)v23);
          -[NSMutableArray addObject:](v8, "addObject:", v16);

          v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v11);
    }

    objc_storeStrong((id *)&v7->_screenshots, v8);
    v7->_selectedIndex = a4;
    v7->_initialSelectedIndex = a4;
    v17 = -[BSUIScreenshotLoader initWithScreenshots:]([BSUIScreenshotLoader alloc], "initWithScreenshots:", v8);
    screenshotLoader = v7->_screenshotLoader;
    v7->_screenshotLoader = v17;

    -[BSUIScreenshotLoader setDelegate:](v7->_screenshotLoader, "setDelegate:", v7);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIScreenshotViewController navigationItem](v7, "navigationItem"));
    objc_msgSend(v19, "setLargeTitleDisplayMode:", 2);

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection bc_allAPITraits](UITraitCollection, "bc_allAPITraits"));
    v21 = -[BSUIScreenshotViewController registerForTraitChanges:withAction:](v7, "registerForTraitChanges:withAction:", v20, "_traitCollectionDidChange:previousTraitCollection:");

  }
  return v7;
}

+ (void)createAsync:(id)a3 :(int64_t)a4 :(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD *v12;
  _QWORD block[4];
  _QWORD *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  int64_t v19;

  v8 = a3;
  v9 = a5;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_4AC4;
  v15[3] = &unk_2E3F60;
  v18 = a1;
  v10 = v8;
  v16 = v10;
  v19 = a4;
  v11 = v9;
  v17 = v11;
  v12 = objc_retainBlock(v15);
  if (v12)
  {
    if (+[NSThread isMainThread](NSThread, "isMainThread"))
    {
      ((void (*)(_QWORD *))v12[2])(v12);
    }
    else
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_4B94;
      block[3] = &unk_2E3F88;
      v14 = v12;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    }
  }

}

- (void)viewDidLoad
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)BSUIScreenshotViewController;
  -[BSUIScreenshotViewController viewDidLoad](&v16, "viewDidLoad");
  -[BSUIScreenshotViewController _setupSubviews](self, "_setupSubviews");
  v3 = objc_msgSend(objc_alloc((Class)UISwipeGestureRecognizer), "initWithTarget:action:", self, "_swipeGestureRecognizer:");
  objc_msgSend(v3, "setDirection:", 8);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIScreenshotViewController view](self, "view"));
  objc_msgSend(v4, "addGestureRecognizer:", v3);

  -[BSUIScreenshotLoader startLoading](self->_screenshotLoader, "startLoading");
  v5 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 0, self, "_dismiss:");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIScreenshotViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v6, "setRightBarButtonItem:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIScreenshotViewController backgroundColor](self, "backgroundColor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIScreenshotViewController collectionView](self, "collectionView"));
  objc_msgSend(v8, "setBackgroundColor:", v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIScreenshotViewController collectionView](self, "collectionView"));
  objc_msgSend(v9, "setAlwaysBounceHorizontal:", 1);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIScreenshotViewController collectionView](self, "collectionView"));
  objc_msgSend(v10, "setShowsHorizontalScrollIndicator:", 0);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIScreenshotViewController collectionView](self, "collectionView"));
  objc_msgSend(v11, "setDecelerationRate:", UIScrollViewDecelerationRateFast);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIScreenshotViewController collectionView](self, "collectionView"));
  objc_msgSend(v12, "setRemembersLastFocusedIndexPath:", 1);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIScreenshotViewController collectionView](self, "collectionView"));
  objc_msgSend(v13, "setContentInsetAdjustmentBehavior:", 2);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIScreenshotViewController collectionView](self, "collectionView"));
  objc_msgSend(v14, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(BSUIScreenshotCell, v15), CFSTR("CellIdentifier"));

  -[BSUIScreenshotViewController _updateColors](self, "_updateColors");
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BSUIScreenshotViewController;
  -[BSUIScreenshotViewController viewWillAppear:](&v3, "viewWillAppear:", a3);
}

- (void)viewDidLayoutSubviews
{
  unint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)BSUIScreenshotViewController;
  -[BSUIScreenshotViewController viewDidLayoutSubviews](&v14, "viewDidLayoutSubviews");
  if (-[BSUIScreenshotViewController initialSelectedIndex](self, "initialSelectedIndex") != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (-[BSUIScreenshotViewController initialSelectedIndex](self, "initialSelectedIndex") >= 1)
    {
      v3 = -[BSUIScreenshotViewController initialSelectedIndex](self, "initialSelectedIndex");
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIScreenshotViewController screenshots](self, "screenshots"));
      v5 = objc_msgSend(v4, "count");

      if (v3 < (unint64_t)v5)
      {
        v7 = objc_opt_class(UIStackView, v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIScreenshotViewController collectionView](self, "collectionView"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "superview"));
        v10 = BUDynamicCast(v7, v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

        objc_msgSend(v11, "layoutIfNeeded");
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIScreenshotViewController collectionView](self, "collectionView"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", -[BSUIScreenshotViewController initialSelectedIndex](self, "initialSelectedIndex"), 0));
        objc_msgSend(v12, "scrollToItemAtIndexPath:atScrollPosition:animated:", v13, 16, 0);

      }
    }
    -[BSUIScreenshotViewController setInitialSelectedIndex:](self, "setInitialSelectedIndex:", 0x7FFFFFFFFFFFFFFFLL);
  }
}

- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4
{
  unsigned int v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  id v10;

  v5 = objc_msgSend(a4, "bc_userInterfaceStyleDark", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIScreenshotViewController traitCollection](self, "traitCollection"));
  v7 = objc_msgSend(v6, "bc_userInterfaceStyleDark");

  if (v5 != v7)
    -[BSUIScreenshotViewController _updateColors](self, "_updateColors");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIScreenshotViewController collectionView](self, "collectionView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "collectionViewLayout"));
  objc_msgSend(v9, "invalidateLayout");

  v10 = (id)objc_claimAutoreleasedReturnValue(-[BSUIScreenshotViewController collectionView](self, "collectionView"));
  objc_msgSend(v10, "setNeedsLayout");

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  objc_super v12;

  height = a3.height;
  width = a3.width;
  v12.receiver = self;
  v12.super_class = (Class)BSUIScreenshotViewController;
  v7 = a4;
  -[BSUIScreenshotViewController viewWillTransitionToSize:withTransitionCoordinator:](&v12, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIScreenshotViewController collectionView](self, "collectionView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "collectionViewLayout"));
  objc_msgSend(v9, "invalidateLayout");

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIScreenshotViewController collectionView](self, "collectionView"));
  objc_msgSend(v10, "setNeedsLayout");

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_50B4;
  v11[3] = &unk_2E3FB0;
  v11[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v11, 0);

}

- (void)setNeedsColorUpdate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIScreenshotViewController backgroundColor](self, "backgroundColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIScreenshotViewController collectionView](self, "collectionView"));
  objc_msgSend(v4, "setBackgroundColor:", v3);

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIScreenshotViewController collectionView](self, "collectionView", 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "visibleCells"));

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIScreenshotViewController cellPlaceholderColor](self, "cellPlaceholderColor"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "imageView"));
        objc_msgSend(v13, "setBackgroundColor:", v12);

        v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[BSUIScreenshotViewController cellBorderColor](self, "cellBorderColor")));
        v15 = objc_msgSend(v14, "CGColor");
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "imageView"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "layer"));
        objc_msgSend(v17, "setBorderColor:", v15);

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v8);
  }

}

- (void)_doneButtonPressed
{
  -[BSUIScreenshotViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 0, 0);
}

- (id)backgroundColor
{
  return +[UIColor bc_booksBackground](UIColor, "bc_booksBackground");
}

- (id)cellPlaceholderColor
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0980392157, 0.22));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.976470588, 0.976470588, 0.988235294, 0.16));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_dynamicColorWithLightColor:darkColor:](UIColor, "bc_dynamicColorWithLightColor:darkColor:", v2, v3));

  return v4;
}

- (id)cellBorderColor
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.08));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.92));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_dynamicColorWithLightColor:darkColor:](UIColor, "bc_dynamicColorWithLightColor:darkColor:", v2, v3));

  return v4;
}

- (void)setSelectedIndex:(int64_t)a3
{
  if (self->_selectedIndex != a3)
    self->_selectedIndex = a3;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIScreenshotViewController screenshots](self, "screenshots", a3, a4));
  v5 = objc_msgSend(v4, "count");

  return (int64_t)v5;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;

  v6 = a4;
  v7 = a3;
  v9 = objc_opt_class(BSUIScreenshotCell, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("CellIdentifier"), v6));

  v11 = BUDynamicCast(v9, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIScreenshotViewController screenshots](self, "screenshots"));
  v14 = objc_msgSend(v6, "row");

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndexedSubscript:", v14));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIScreenshotViewController screenshotLoader](self, "screenshotLoader"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "imageForScreenshot:", v15));

  objc_msgSend(v12, "configureWithScreenshot:image:", v15, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIScreenshotViewController cellPlaceholderColor](self, "cellPlaceholderColor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "imageView"));
  objc_msgSend(v19, "setBackgroundColor:", v18);

  v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[BSUIScreenshotViewController cellBorderColor](self, "cellBorderColor")));
  v21 = objc_msgSend(v20, "CGColor");
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "imageView"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "layer"));
  objc_msgSend(v23, "setBorderColor:", v21);

  return v12;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5
{
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;

  +[BSUIScreenshotCell minimumLineSpacingWithRegularPad:](BSUIScreenshotCell, "minimumLineSpacingWithRegularPad:", -[BSUIScreenshotViewController _isRegularPad](self, "_isRegularPad", a3, a4, a5));
  v7 = v6;
  v9 = objc_opt_class(UICollectionViewFlowLayout, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIScreenshotViewController collectionView](self, "collectionView"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "collectionViewLayout"));
  v12 = BUDynamicCast(v9, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  objc_msgSend(v13, "setMinimumLineSpacing:", v7);
  return v7;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumInteritemSpacingForSectionAtIndex:(int64_t)a5
{
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;

  +[BSUIScreenshotCell minimumLineSpacingWithRegularPad:](BSUIScreenshotCell, "minimumLineSpacingWithRegularPad:", -[BSUIScreenshotViewController _isRegularPad](self, "_isRegularPad", a3, a4, a5));
  v7 = v6;
  v9 = objc_opt_class(UICollectionViewFlowLayout, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIScreenshotViewController collectionView](self, "collectionView"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "collectionViewLayout"));
  v12 = BUDynamicCast(v9, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  objc_msgSend(v13, "setMinimumInteritemSpacing:", v7);
  return v7;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  id v6;
  _BOOL8 v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  _BOOL8 v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  UIEdgeInsets result;

  v6 = a3;
  v7 = -[BSUIScreenshotViewController _isRegularPad](self, "_isRegularPad");
  objc_msgSend(v6, "bounds");
  v9 = v8;
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIScreenshotViewController screenshots](self, "screenshots"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "firstObject"));
  objc_msgSend(v13, "size");
  +[BSUIScreenshotCell sectionInsetForRegularPad:maxSize:artworkSize:](BSUIScreenshotCell, "sectionInsetForRegularPad:maxSize:artworkSize:", v7, v9, v11, v14, v15);
  v17 = v16;
  v19 = v18;
  v21 = v20;

  v22 = -[BSUIScreenshotViewController _isRegularPad](self, "_isRegularPad");
  objc_msgSend(v6, "bounds");
  v24 = v23;
  v26 = v25;

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIScreenshotViewController screenshots](self, "screenshots"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "lastObject"));
  objc_msgSend(v28, "size");
  +[BSUIScreenshotCell sectionInsetForRegularPad:maxSize:artworkSize:](BSUIScreenshotCell, "sectionInsetForRegularPad:maxSize:artworkSize:", v22, v24, v26, v29, v30);
  v32 = v31;
  v34 = v33;
  v36 = v35;

  if (v17 >= v32)
    v17 = v32;
  if (v21 >= v34)
    v21 = v34;
  v38 = objc_opt_class(UICollectionViewFlowLayout, v37);
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIScreenshotViewController collectionView](self, "collectionView"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "collectionViewLayout"));
  v41 = BUDynamicCast(v38, v40);
  v42 = (void *)objc_claimAutoreleasedReturnValue(v41);

  objc_msgSend(v42, "setSectionInset:", v17, v19, v21, v36);
  v43 = v17;
  v44 = v19;
  v45 = v21;
  v46 = v36;
  result.right = v46;
  result.bottom = v45;
  result.left = v44;
  result.top = v43;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v6;
  _BOOL8 v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  v6 = a3;
  v7 = -[BSUIScreenshotViewController _isRegularPad](self, "_isRegularPad");
  objc_msgSend(v6, "bounds");
  v9 = v8;
  v11 = v10;

  +[BSUIScreenshotCell itemSizeForRegularPad:maxSize:](BSUIScreenshotCell, "itemSizeForRegularPad:maxSize:", v7, v9, v11);
  result.height = v13;
  result.width = v12;
  return result;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v7 = a4;
  v5 = objc_msgSend(v7, "item");
  if (v5 != (id)-[BSUIScreenshotViewController selectedIndex](self, "selectedIndex"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIScreenshotViewController collectionView](self, "collectionView"));
    objc_msgSend(v6, "scrollToItemAtIndexPath:atScrollPosition:animated:", v7, 16, 1);

    -[BSUIScreenshotViewController setSelectedIndex:](self, "setSelectedIndex:", objc_msgSend(v7, "item"));
  }

}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  CGFloat v16;
  void *v17;
  void *v18;
  id v19;
  CGRect v20;
  CGRect v21;

  v4 = a3;
  objc_msgSend(v4, "contentOffset");
  v6 = v5;
  objc_msgSend(v4, "bounds");
  v7 = v6 + CGRectGetWidth(v20) * 0.5;
  objc_msgSend(v4, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v21.origin.x = v9;
  v21.origin.y = v11;
  v21.size.width = v13;
  v21.size.height = v15;
  v16 = CGRectGetHeight(v21) * 0.5;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIScreenshotViewController collectionView](self, "collectionView"));
  v19 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "indexPathForItemAtPoint:", v7, v16));

  v18 = v19;
  if (v19)
  {
    -[BSUIScreenshotViewController setSelectedIndex:](self, "setSelectedIndex:", objc_msgSend(v19, "item"));
    v18 = v19;
  }

}

- (void)screenshotLoader:(id)a3 willLoadImageAtIndex:(unint64_t)a4 fromURL:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  id v17;

  v7 = a3;
  v8 = a5;
  v9 = JSALog();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
    v12 = 138543874;
    v13 = v7;
    v14 = 2114;
    v15 = v11;
    v16 = 2114;
    v17 = v8;
    _os_log_debug_impl(&dword_0, v10, OS_LOG_TYPE_DEBUG, "%{public}@ about to load screenshot at index %{public}@ from url %{public}@", (uint8_t *)&v12, 0x20u);

  }
}

- (void)screenshotLoader:(id)a3 loadedImage:(id)a4 forScreenshotAtIndex:(unint64_t)a5
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;

  v7 = a4;
  v9 = objc_opt_class(BSUIScreenshotCell, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIScreenshotViewController collectionView](self, "collectionView"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", a5, 0));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "cellForItemAtIndexPath:", v11));
  v13 = BUDynamicCast(v9, v12);
  v15 = (id)objc_claimAutoreleasedReturnValue(v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "imageView"));
  objc_msgSend(v14, "setImage:", v7);

}

- (void)screenshotLoader:(id)a3 failedToLoadImageforScreenshotAtIndex:(unint64_t)a4 withError:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  id v17;

  v7 = a3;
  v8 = a5;
  v9 = JSALog();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
    v12 = 138543874;
    v13 = v7;
    v14 = 2114;
    v15 = v11;
    v16 = 2114;
    v17 = v8;
    _os_log_error_impl(&dword_0, v10, OS_LOG_TYPE_ERROR, "%{public}@ failed to load screenshot at index %{public}@ with error %{public}@", (uint8_t *)&v12, 0x20u);

  }
}

- (BOOL)_isRegularPad
{
  void *v2;
  void *v4;
  char *v5;
  void *v6;
  BOOL v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIScreenshotViewController traitCollection](self, "traitCollection"));
  v5 = (char *)objc_msgSend(v4, "userInterfaceIdiom");
  if (v5 == (_BYTE *)&dword_0 + 1
    || (v2 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIScreenshotViewController traitCollection](self, "traitCollection")),
        objc_msgSend(v2, "userInterfaceIdiom") == (char *)&dword_4 + 1))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIScreenshotViewController traitCollection](self, "traitCollection"));
    v7 = objc_msgSend(v6, "horizontalSizeClass") == (char *)&dword_0 + 2;

    if (v5 == (_BYTE *)&dword_0 + 1)
      goto LABEL_7;
  }
  else
  {
    v7 = 0;
  }

LABEL_7:
  return v7;
}

- (void)_swipeGestureRecognizer:(id)a3
{
  if (objc_msgSend(a3, "state") == (char *)&dword_0 + 3)
    -[BSUIScreenshotViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)_dismiss:(id)a3
{
  -[BSUIScreenshotViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)_setupSubviews
{
  id v3;
  BSUIScreenshotCollectionViewFlowLayout *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
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
  _QWORD v41[4];
  void *v42;

  v3 = objc_alloc((Class)UICollectionView);
  v4 = objc_opt_new(BSUIScreenshotCollectionViewFlowLayout);
  v5 = objc_msgSend(v3, "initWithFrame:collectionViewLayout:", v4, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[BSUIScreenshotViewController setCollectionView:](self, "setCollectionView:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIScreenshotViewController view](self, "view"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "backgroundColor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIScreenshotViewController collectionView](self, "collectionView"));
  objc_msgSend(v8, "setBackgroundColor:", v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIScreenshotViewController collectionView](self, "collectionView"));
  objc_msgSend(v9, "setDelegate:", self);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIScreenshotViewController collectionView](self, "collectionView"));
  objc_msgSend(v10, "setDataSource:", self);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIScreenshotViewController collectionView](self, "collectionView"));
  objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIScreenshotViewController collectionView](self, "collectionView"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "widthAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIScreenshotViewController view](self, "view"));
  objc_msgSend(v14, "bounds");
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToConstant:", v15));
  objc_msgSend(v16, "setActive:", 1);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIScreenshotViewController collectionView](self, "collectionView"));
  v42 = v17;
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v42, 1));

  v18 = objc_msgSend(objc_alloc((Class)UIStackView), "initWithArrangedSubviews:", v40);
  v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[BSUIScreenshotViewController backgroundColor](self, "backgroundColor")));
  v20 = objc_msgSend(v19, "CGColor");
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "layer"));
  objc_msgSend(v21, "setBackgroundColor:", v20);

  objc_msgSend(v18, "setAxis:", 0);
  objc_msgSend(v18, "setDistribution:", 3);
  objc_msgSend(v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIScreenshotViewController view](self, "view"));
  objc_msgSend(v22, "addSubview:", v18);

  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "leadingAnchor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIScreenshotViewController view](self, "view"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "leadingAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintEqualToAnchor:", v37));
  v41[0] = v36;
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "trailingAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIScreenshotViewController view](self, "view"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "trailingAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:", v33));
  v41[1] = v32;
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "topAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIScreenshotViewController view](self, "view"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "topAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:constant:", v25, 0.0));
  v41[2] = v26;
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "bottomAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIScreenshotViewController view](self, "view"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "bottomAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:", v29));
  v41[3] = v30;
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v41, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v31);

}

- (void)_updateColors
{
  -[BSUIScreenshotViewController setNeedsStatusBarAppearanceUpdate](self, "setNeedsStatusBarAppearanceUpdate");
  -[BSUIScreenshotViewController setNeedsColorUpdate](self, "setNeedsColorUpdate");
}

- (NSArray)screenshots
{
  return self->_screenshots;
}

- (void)setScreenshots:(id)a3
{
  objc_storeStrong((id *)&self->_screenshots, a3);
}

- (int64_t)selectedIndex
{
  return self->_selectedIndex;
}

- (int64_t)initialSelectedIndex
{
  return self->_initialSelectedIndex;
}

- (void)setInitialSelectedIndex:(int64_t)a3
{
  self->_initialSelectedIndex = a3;
}

- (BSUIScreenshotLoader)screenshotLoader
{
  return self->_screenshotLoader;
}

- (void)setScreenshotLoader:(id)a3
{
  objc_storeStrong((id *)&self->_screenshotLoader, a3);
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_screenshotLoader, 0);
  objc_storeStrong((id *)&self->_screenshots, 0);
}

@end
