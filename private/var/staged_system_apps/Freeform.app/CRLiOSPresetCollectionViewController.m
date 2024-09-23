@implementation CRLiOSPresetCollectionViewController

- (CRLiOSPresetCollectionViewController)initWithPresetCollectionType:(unint64_t)a3 delegate:(id)a4
{
  id v6;
  CRLiOSPresetCollectionViewController *v7;
  CRLiOSPresetCollectionViewController *v8;
  CRLiOSShapePresetProvider *v9;
  CRLiOSShapePresetCollectionViewLayoutProvider *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  CRLiOSPresetCollectionViewLayout *v15;
  UICollectionViewDelegateFlowLayout *layout;
  CRLiOSPresetRenderer *v17;
  CRLiOSPresetRenderer *presetRenderer;
  objc_super v20;

  v6 = a4;
  v20.receiver = self;
  v20.super_class = (Class)CRLiOSPresetCollectionViewController;
  v7 = -[CRLiOSPresetCollectionViewController initWithNibName:bundle:](&v20, "initWithNibName:bundle:", 0, 0);
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_delegate, v6);
    v8->_presetCollectionType = a3;
    if (a3)
    {
      v9 = 0;
      v10 = 0;
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetCollectionViewController p_delegate](v8, "p_delegate"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "shapeCollectionDataSource"));

      v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetCollectionViewController p_delegate](v8, "p_delegate"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "shapeSearchResultsCollection"));

      v10 = -[CRLiOSShapePresetCollectionViewLayoutProvider initWithShapeCollectionDataSource:searchResultsCollection:]([CRLiOSShapePresetCollectionViewLayoutProvider alloc], "initWithShapeCollectionDataSource:searchResultsCollection:", v12, v14);
      v9 = -[CRLiOSShapePresetProvider initWithShapeCollectionDataSource:searchResultsCollection:]([CRLiOSShapePresetProvider alloc], "initWithShapeCollectionDataSource:searchResultsCollection:", v12, v14);

    }
    v15 = -[CRLiOSPresetCollectionViewLayout initWithPresetCollectionViewLayoutProvider:delegate:]([CRLiOSPresetCollectionViewLayout alloc], "initWithPresetCollectionViewLayoutProvider:delegate:", v10, v8);
    layout = v8->_layout;
    v8->_layout = (UICollectionViewDelegateFlowLayout *)v15;

    v17 = -[CRLiOSPresetRenderer initWithPresetProvider:]([CRLiOSPresetRenderer alloc], "initWithPresetProvider:", v9);
    presetRenderer = v8->_presetRenderer;
    v8->_presetRenderer = v17;

  }
  return v8;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CRLiOSPresetCollectionViewController;
  -[CRLiOSPresetCollectionViewController viewDidLoad](&v3, "viewDidLoad");
  -[CRLiOSPresetCollectionViewController p_setupCollectionView](self, "p_setupCollectionView");
  -[CRLiOSPresetCollectionViewController p_clearVisibleCellCache](self, "p_clearVisibleCellCache");
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRLiOSPresetCollectionViewController;
  -[CRLiOSPresetCollectionViewController viewWillAppear:](&v6, "viewWillAppear:", a3);
  if (-[CRLiOSPresetCollectionViewController p_presetsChanged](self, "p_presetsChanged"))
    -[CRLiOSPresetCollectionViewController p_handlePresetsChanged](self, "p_handlePresetsChanged");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetCollectionViewController p_backgroundColor](self, "p_backgroundColor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetCollectionViewController p_collectionView](self, "p_collectionView"));
  objc_msgSend(v5, "setBackgroundColor:", v4);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRLiOSPresetCollectionViewController;
  -[CRLiOSPresetCollectionViewController viewDidAppear:](&v5, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetCollectionViewController p_collectionView](self, "p_collectionView"));
  objc_msgSend(v4, "flashScrollIndicators");

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRLiOSPresetCollectionViewController;
  -[CRLiOSPresetCollectionViewController viewWillDisappear:](&v5, "viewWillDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "removeObserver:", self);

}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CRLiOSPresetCollectionViewController;
  -[CRLiOSPresetCollectionViewController viewDidDisappear:](&v4, "viewDidDisappear:", a3);
  -[CRLiOSPresetCollectionViewController cancelSwatchRenderingIfNeeded](self, "cancelSwatchRenderingIfNeeded");
}

- (void)reloadData
{
  id v3;

  -[CRLiOSPresetCollectionViewController p_clearVisibleCellCache](self, "p_clearVisibleCellCache");
  v3 = (id)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetCollectionViewController p_collectionView](self, "p_collectionView"));
  objc_msgSend(v3, "reloadData");

}

- (void)scrollToTop
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetCollectionViewController p_collectionView](self, "p_collectionView"));
  objc_msgSend(v2, "setContentOffset:", CGPointZero.x, CGPointZero.y);

}

- (void)scrollToBottom
{
  char *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (char *)-[CRLiOSPresetCollectionViewController p_numberOfSections](self, "p_numberOfSections") - 1;
  v4 = -[CRLiOSPresetCollectionViewController p_numberOfItemsInSection:](self, "p_numberOfItemsInSection:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetCollectionViewController p_collectionView](self, "p_collectionView"));
  objc_msgSend(v5, "layoutIfNeeded");

  v7 = (id)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetCollectionViewController p_collectionView](self, "p_collectionView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForItem:inSection:](NSIndexPath, "indexPathForItem:inSection:", v4 - 1, v3));
  objc_msgSend(v7, "scrollToItemAtIndexPath:atScrollPosition:animated:", v6, 4, 0);

}

- (void)accessibilityFocusFirstVisiblePreset
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1003A2EA4;
  v2[3] = &unk_10122D110;
  v2[4] = self;
  CRLAccessibilityPerformBlockOnMainThreadAfterDelay(v2, 0.1);
}

- (BOOL)isLowContrastWithBackgroundColor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetCollectionViewController p_presetRenderer](self, "p_presetRenderer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetCollectionViewController context](self, "context"));
  v7 = objc_msgSend(v5, "contextIsLowContrast:forBackgroundColor:", v6, v4);

  return v7;
}

- (unint64_t)presetCollectionType
{
  return -[CRLiOSPresetCollectionViewController p_presetCollectionType](self, "p_presetCollectionType");
}

- (void)setPresetsChanged
{
  -[CRLiOSPresetCollectionViewController setP_presetsChanged:](self, "setP_presetsChanged:", 1);
  if (-[CRLiOSPresetCollectionViewController isViewLoaded](self, "isViewLoaded"))
    -[CRLiOSPresetCollectionViewController p_handlePresetsChanged](self, "p_handlePresetsChanged");
}

- (void)cancelSwatchRenderingIfNeeded
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetCollectionViewController p_presetRenderer](self, "p_presetRenderer"));
  -[CRLiOSPresetCollectionViewController setP_cancelledSwatchRendering:](self, "setP_cancelledSwatchRendering:", objc_msgSend(v3, "cancelSwatchRenderingIfNeeded"));

}

- (UIEdgeInsets)swatchInsets
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  UIEdgeInsets result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetCollectionViewController p_presetRenderer](self, "p_presetRenderer"));
  objc_msgSend(v2, "swatchInsets");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (BOOL)shouldVerticallyDistributeEvenly
{
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetCollectionViewController p_layout](self, "p_layout"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetCollectionViewController context](self, "context"));
  v5 = objc_msgSend(v3, "shouldVerticallyDistributeEvenlyForContext:", v4);

  return v5;
}

- (void)presetCollectionViewDidLayoutSubviews:(id)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetCollectionViewController p_presetRenderer](self, "p_presetRenderer", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetCollectionViewController context](self, "context"));
  objc_msgSend(v5, "waitOnSwatchRenderingAndDeliverResultsIfNeededInContext:", v4);

}

- (CRLiOSPresetCollectionContext)context
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetCollectionViewController p_delegate](self, "p_delegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "contextWithPresetCollectionViewController:", self));

  return (CRLiOSPresetCollectionContext *)v4;
}

- (BOOL)presetCollectionViewLayoutShouldHighlightPresetAtIndexPath:(id)a3
{
  return 1;
}

- (void)presetCollectionViewLayoutDidHighlightPresetAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  objc_class *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetCollectionViewController p_collectionView](self, "p_collectionView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cellForItemAtIndexPath:", v4));

  objc_opt_class(UICollectionViewCell, v7);
  v14 = sub_1002220C8(v6, v8, 1, v9, v10, v11, v12, v13, (uint64_t)&OBJC_PROTOCOL___CRLiOSPresetCollectionViewCell);
  v16 = (id)objc_claimAutoreleasedReturnValue(v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "presetButton"));
  objc_msgSend(v15, "setHighlighted:", 1);

}

- (void)presetCollectionViewLayoutDidUnhighlightPresetAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  objc_class *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetCollectionViewController p_collectionView](self, "p_collectionView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cellForItemAtIndexPath:", v4));

  objc_opt_class(UICollectionViewCell, v7);
  v14 = sub_1002220C8(v6, v8, 1, v9, v10, v11, v12, v13, (uint64_t)&OBJC_PROTOCOL___CRLiOSPresetCollectionViewCell);
  v16 = (id)objc_claimAutoreleasedReturnValue(v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "presetButton"));
  objc_msgSend(v15, "setHighlighted:", 0);

}

- (void)presetCollectionViewLayoutDidSelectPresetAtIndexPath:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CRLiOSPresetCollectionViewController cancelSwatchRenderingIfNeeded](self, "cancelSwatchRenderingIfNeeded");
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetCollectionViewController p_delegate](self, "p_delegate"));
  objc_msgSend(v5, "presetCollectionViewController:didSelectPresetAtIndexPath:", self, v4);

}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return -[CRLiOSPresetCollectionViewController p_numberOfItemsInSection:](self, "p_numberOfItemsInSection:", a4);
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  objc_class *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v51;
  void *v52;
  void *v53;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetCollectionViewController context](self, "context"));
  v9 = objc_msgSend(v6, "section");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetCollectionViewController layout](self, "layout"));
  v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "cellReuseIdentifierForSection:context:", v9, v8));

  v52 = (void *)v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v11, v6));

  objc_opt_class(UICollectionViewCell, v13);
  v20 = sub_1002220C8(v12, v14, 1, v15, v16, v17, v18, v19, (uint64_t)&OBJC_PROTOCOL___CRLiOSPresetCollectionViewCell);
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);

  objc_msgSend(v21, "setExclusiveTouch:", 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "presetButton"));
  objc_msgSend(v22, "setHighlighted:", 0);

  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "presetButton"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "imageView"));
  objc_msgSend(v24, "setContentMode:", 1);

  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "contentView"));
  objc_msgSend(v25, "setUserInteractionEnabled:", 0);

  v51 = objc_msgSend(v6, "row");
  objc_opt_class(CRLiOSPresetCollectionViewLabeledCell, v26);
  v28 = sub_100221D0C(v27, v21);
  v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
  if (v29)
    -[CRLiOSPresetCollectionViewController p_setupUIInLabeledCell:atIndexPath:context:](self, "p_setupUIInLabeledCell:atIndexPath:context:", v29, v6, v8);
  objc_msgSend(v21, "setIsAccessibilityElement:", 1);
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetCollectionViewController p_presetRenderer](self, "p_presetRenderer"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "localizedAccessibilityNameForPresetAtIndexPath:context:", v6, v8));
  objc_msgSend(v21, "setAccessibilityLabel:", v31);

  v32 = objc_alloc((Class)NSMutableArray);
  v33 = objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v33, "localizedStringForKey:value:table:", CFSTR("Double tap to insert"), 0, 0));
  v53 = v34;
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v53, 1));
  v36 = objc_msgSend(v32, "initWithArray:", v35);

  v37 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetCollectionViewController context](self, "context"));
  LOBYTE(v33) = objc_msgSend(v37, "isSearching");

  if ((v33 & 1) == 0)
  {
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "localizedStringForKey:value:table:", CFSTR("Swipe left or right with three fingers to change pages."), 0, 0));
    objc_msgSend(v36, "addObject:", v39);

  }
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "componentsJoinedByString:", CFSTR(". ")));
  objc_msgSend(v21, "setAccessibilityHint:", v40);

  objc_msgSend(v21, "setTag:", v51);
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetCollectionViewController layout](self, "layout"));
  objc_msgSend(v41, "sizeOfPresetInSection:", objc_msgSend(v6, "section"));
  v43 = v42;
  v45 = v44;

  v46 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetCollectionViewController p_presetRenderer](self, "p_presetRenderer"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "presetButton"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetCollectionViewController p_backgroundColor](self, "p_backgroundColor"));
  objc_msgSend(v46, "renderSwatchInView:withSize:backgroundColor:atIndexPath:context:", v47, v48, v6, v8, v43, v45);

  v49 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetCollectionViewController p_visibleCells](self, "p_visibleCells"));
  objc_msgSend(v49, "addObject:", v21);

  return v21;
}

- (void)reloadDataIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (-[CRLiOSPresetCollectionViewController p_cancelledSwatchRendering](self, "p_cancelledSwatchRendering"))
  {
    -[CRLiOSPresetCollectionViewController setP_cancelledSwatchRendering:](self, "setP_cancelledSwatchRendering:", 0);
    -[CRLiOSPresetCollectionViewController reloadData](self, "reloadData");
  }
  else
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetCollectionViewController p_cellsMissingImages](self, "p_cellsMissingImages"));
    if (objc_msgSend(v6, "count"))
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetCollectionViewController p_visibleCells](self, "p_visibleCells"));
      objc_msgSend(v3, "removeObjectsInArray:", v6);

      v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetCollectionViewController p_indexPathsForCells:](self, "p_indexPathsForCells:", v6));
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetCollectionViewController p_collectionView](self, "p_collectionView"));
      objc_msgSend(v5, "reloadItemsAtIndexPaths:", v4);

    }
  }
}

- (void)p_setupCollectionView
{
  CRLiOSPresetCollectionView *v3;
  void *v4;
  void *v5;
  id v6;
  unint64_t v7;
  CRLiOSPresetCollectionContext *v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  CRLiOSPresetCollectionContext *v18;
  void *v19;
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
  id v38;

  v38 = (id)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetCollectionViewController layout](self, "layout"));
  v3 = -[CRLiOSPresetCollectionView initWithFrame:collectionViewLayout:]([CRLiOSPresetCollectionView alloc], "initWithFrame:collectionViewLayout:", v38, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[CRLiOSPresetCollectionView setDelaysContentTouches:](v3, "setDelaysContentTouches:", 0);
  -[CRLiOSPresetCollectionView setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CRLiOSPresetCollectionView setDataSource:](v3, "setDataSource:", self);
  -[CRLiOSPresetCollectionView setDelegate:](v3, "setDelegate:", v38);
  -[CRLiOSPresetCollectionView setPresetCollectionViewDelegate:](v3, "setPresetCollectionViewDelegate:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetCollectionViewController context](self, "context"));
  if (objc_msgSend(v38, "showsSubpageNavigator"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "subpageNavigatorItems"));
    v6 = objc_msgSend(v5, "count");

    if (v6)
    {
      v7 = 0;
      do
      {
        v8 = [CRLiOSPresetCollectionContext alloc];
        v9 = objc_msgSend(v4, "contextType");
        objc_msgSend(v4, "contentSize");
        v11 = v10;
        v13 = v12;
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "editingCoordinator"));
        v15 = objc_msgSend(v4, "isSearching");
        v16 = objc_msgSend(v4, "pageIndex");
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "traitCollection"));
        v18 = -[CRLiOSPresetCollectionContext initWithContextType:contentSize:editingCoordinator:isSearching:pageIndex:subpageIndex:traitCollection:](v8, "initWithContextType:contentSize:editingCoordinator:isSearching:pageIndex:subpageIndex:traitCollection:", v9, v14, v15, v16, v7, v17, v11, v13);

        -[CRLiOSPresetCollectionViewController p_registerNibsInCollectionView:layout:context:](self, "p_registerNibsInCollectionView:layout:context:", v3, v38, v18);
        ++v7;
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "subpageNavigatorItems"));
        v20 = objc_msgSend(v19, "count");

      }
      while (v7 < (unint64_t)v20);
    }
  }
  else
  {
    -[CRLiOSPresetCollectionViewController p_registerNibsInCollectionView:layout:context:](self, "p_registerNibsInCollectionView:layout:context:", v3, v38, v4);
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetCollectionViewController p_backgroundColor](self, "p_backgroundColor"));
  -[CRLiOSPresetCollectionView setBackgroundColor:](v3, "setBackgroundColor:", v21);

  -[CRLiOSPresetCollectionView setLayoutMargins:](v3, "setLayoutMargins:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
  -[CRLiOSPresetCollectionView setDragDelegate:](v3, "setDragDelegate:", self);
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetCollectionViewController view](self, "view"));
  objc_msgSend(v22, "addSubview:", v3);
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "safeAreaLayoutGuide"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "topAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetCollectionView topAnchor](v3, "topAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:", v25));
  objc_msgSend(v26, "setActive:", 1);

  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "bottomAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetCollectionView bottomAnchor](v3, "bottomAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:", v28));
  objc_msgSend(v29, "setActive:", 1);

  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "safeAreaLayoutGuide"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "leadingAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetCollectionView leadingAnchor](v3, "leadingAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:", v32));
  objc_msgSend(v33, "setActive:", 1);

  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "safeAreaLayoutGuide"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "trailingAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetCollectionView trailingAnchor](v3, "trailingAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintEqualToAnchor:", v36));
  objc_msgSend(v37, "setActive:", 1);

  -[CRLiOSPresetCollectionViewController setP_collectionView:](self, "setP_collectionView:", v3);
}

- (void)p_registerNibsInCollectionView:(id)a3 layout:(id)a4 context:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "cellRegistrationDictionary"));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allKeys", 0));
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v13));
        objc_msgSend(v6, "registerNib:forCellWithReuseIdentifier:", v14, v13);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

}

- (void)p_clearVisibleCellCache
{
  id v3;

  v3 = objc_alloc_init((Class)NSMutableArray);
  -[CRLiOSPresetCollectionViewController setP_visibleCells:](self, "setP_visibleCells:", v3);

}

- (unint64_t)p_numberOfSections
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetCollectionViewController layout](self, "layout"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetCollectionViewController context](self, "context"));
  v5 = objc_msgSend(v3, "numberOfSectionsInCollectionViewForContext:", v4);

  return (unint64_t)v5;
}

- (unint64_t)p_numberOfItemsInSection:(unint64_t)a3
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetCollectionViewController layout](self, "layout"));
  v5 = objc_msgSend(v4, "numberOfItemsInSection:", a3);

  return (unint64_t)v5;
}

- (id)p_editingCoordinator
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetCollectionViewController context](self, "context"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "editingCoordinator"));

  return v3;
}

- (id)p_backgroundColor
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetCollectionViewController p_delegate](self, "p_delegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "backgroundColorForPresetCollectionViewController:", self));

  return v4;
}

- (id)p_indexPathsForCells:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v4, "count")));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetCollectionViewController p_collectionView](self, "p_collectionView", (_QWORD)v15));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "indexPathForCell:", v11));

        if (v13)
          objc_msgSend(v5, "addObject:", v13);

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)p_cellsMissingImages
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  unsigned int v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetCollectionViewController p_visibleCells](self, "p_visibleCells"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v3, "count")));

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetCollectionViewController p_visibleCells](self, "p_visibleCells"));
  v6 = objc_msgSend(v5, "copy");

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v26;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v26 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)v11);
        objc_opt_class(UICollectionViewCell, v8);
        v19 = sub_10022209C(v12, v13, 1, v14, v15, v16, v17, v18, (uint64_t)&OBJC_PROTOCOL___CRLiOSPresetCollectionViewCell);
        v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
        v21 = v20;
        if (v20)
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "presetButton"));
          v23 = objc_msgSend(v22, "crl_isPresetRenderingInvalid");

          if (v23)
            objc_msgSend(v4, "addObject:", v21);
        }

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v9);
  }

  return v4;
}

- (void)p_handlePresetsChanged
{
  -[CRLiOSPresetCollectionViewController setP_presetsChanged:](self, "setP_presetsChanged:", 0);
  -[CRLiOSPresetCollectionViewController reloadData](self, "reloadData");
}

- (BOOL)p_shouldUseDarkUI
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetCollectionViewController traitCollection](self, "traitCollection"));
  v3 = objc_msgSend(v2, "crl_isUserInterfaceStyleDark");

  return v3;
}

- (void)p_setupUIInLabeledCell:(id)a3 atIndexPath:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  double v18;
  void *v19;
  void *v20;
  unsigned int v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const __CFString *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  int v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  _QWORD v46[4];
  _QWORD v47[4];

  v8 = a3;
  v9 = a5;
  v10 = a4;
  v44 = objc_msgSend(v10, "section");
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "label"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetCollectionViewController p_presetRenderer](self, "p_presetRenderer"));
  v13 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedNameForPresetAtIndexPath:context:", v10, v9));

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetCollectionViewController p_presetRenderer](self, "p_presetRenderer"));
  v15 = v9;
  v16 = objc_msgSend(v14, "isDefaultLocalizedNameForPresetAtIndexPath:context:", v10, v9);

  objc_msgSend(v8, "setLabelHasDefaultLocalizedName:", v16);
  v17 = objc_alloc_init((Class)NSMutableParagraphStyle);
  objc_msgSend(v11, "setNumberOfLines:", 2);
  LODWORD(v18) = 0.5;
  objc_msgSend(v17, "setHyphenationFactor:", v18);
  objc_msgSend(v17, "setLineBreakMode:", 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 12.0));
  objc_msgSend(v17, "setLineSpacing:", 1.0);
  objc_msgSend(v17, "setAlignment:", 1);
  LODWORD(v14) = -[CRLiOSPresetCollectionViewController p_shouldUseDarkUI](self, "p_shouldUseDarkUI");
  v20 = v8;
  v21 = objc_msgSend(v8, "labelHasDefaultLocalizedName");
  if ((_DWORD)v14)
  {
    if (v21)
    {
      v22 = 0.556862772;
LABEL_6:
      v23 = objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", v22, v22, v22, 1.0));
      goto LABEL_8;
    }
  }
  else if (v21)
  {
    v22 = 0.643137276;
    goto LABEL_6;
  }
  v23 = objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
LABEL_8:
  v43 = (void *)v23;
  v46[0] = NSParagraphStyleAttributeName;
  v46[1] = NSForegroundColorAttributeName;
  v47[0] = v17;
  v47[1] = v23;
  v46[2] = NSFontAttributeName;
  v46[3] = NSKernAttributeName;
  v47[2] = v19;
  v47[3] = &off_1012CCD78;
  v24 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v47, v46, 4));
  v25 = (void *)v24;
  v26 = v13;
  v45 = v11;
  if (!v13)
  {
    v42 = (void *)v24;
    v41 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101257AB0);
    v27 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E2AA18(v41, v27);
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101257AD0);
    v28 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE81F0(v28, v41);
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSPresetCollectionViewController p_setupUIInLabeledCell:atIndexPath:context:]"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSPresetCollectionViewController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v29, v30, 455, 0, "invalid nil value for '%{public}s'", "localizedName");

    v26 = &stru_1012A72B0;
    v11 = v45;
    v25 = v42;
  }
  v31 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:attributes:", v26, v25);
  objc_msgSend(v11, "setAttributedText:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetCollectionViewController p_layout](self, "p_layout"));
  objc_msgSend(v32, "additionalHeightForItemInSection:context:", v44, v15);
  v34 = v33 - 30.0;
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "labelVerticalSpacingConstraint"));
  objc_msgSend(v35, "setConstant:", v34);

  v36 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetCollectionViewController p_layout](self, "p_layout"));
  objc_msgSend(v36, "horizontalInsetForItemInSection:context:", v44, v15);
  v38 = v37;

  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "presetViewLeadingConstraint"));
  objc_msgSend(v39, "setConstant:", v38);

  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "presetViewTrailingConstraint"));
  objc_msgSend(v40, "setConstant:", v38);

}

- (id)collectionView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5
{
  id v7;
  id v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;

  v7 = a3;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetCollectionViewController p_delegate](self, "p_delegate"));
  v10 = objc_msgSend(v9, "allowsInsertDrag");

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetCollectionViewController p_delegate](self, "p_delegate"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "itemsForBeginningDragSessionForPresetCollectionViewController:forCollectionView:atIndexPath:", self, v7, v8));

  }
  else
  {
    v12 = &__NSArray0__struct;
  }

  return v12;
}

- (id)collectionView:(id)a3 dragPreviewParametersForItemAtIndexPath:(id)a4
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc_init((Class)UIDragPreviewParameters);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  objc_msgSend(v4, "setBackgroundColor:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPath](UIBezierPath, "bezierPath"));
  objc_msgSend(v4, "setShadowPath:", v6);

  return v4;
}

- (void)collectionView:(id)a3 dragSessionWillBegin:(id)a4
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetCollectionViewController presentingViewController](self, "presentingViewController", a3, a4));
  objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (CRLiOSPresetCollectionView)p_collectionView
{
  return self->_collectionView;
}

- (void)setP_collectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
}

- (CRLiOSPresetCollectionViewControllerDelegate)p_delegate
{
  return (CRLiOSPresetCollectionViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setP_delegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UICollectionViewDelegateFlowLayout)p_layout
{
  return self->_layout;
}

- (unint64_t)p_presetCollectionType
{
  return self->_presetCollectionType;
}

- (void)setP_presetCollectionType:(unint64_t)a3
{
  self->_presetCollectionType = a3;
}

- (CRLiOSPresetRenderer)p_presetRenderer
{
  return self->_presetRenderer;
}

- (BOOL)p_presetsChanged
{
  return self->_presetsChanged;
}

- (void)setP_presetsChanged:(BOOL)a3
{
  self->_presetsChanged = a3;
}

- (NSMutableArray)p_visibleCells
{
  return self->_visibleCells;
}

- (void)setP_visibleCells:(id)a3
{
  objc_storeStrong((id *)&self->_visibleCells, a3);
}

- (UIGestureRecognizer)p_currentDragGestureRecognizer
{
  return self->_currentDragGestureRecognizer;
}

- (void)setP_currentDragGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_currentDragGestureRecognizer, a3);
}

- (BOOL)p_cancelledSwatchRendering
{
  return self->_cancelledSwatchRendering;
}

- (void)setP_cancelledSwatchRendering:(BOOL)a3
{
  self->_cancelledSwatchRendering = a3;
}

- (CRLiOSPresetCollectionViewLabeledCell)p_longPressedCell
{
  return self->_longPressedCell;
}

- (void)p_setLongPressedCell:(id)a3
{
  objc_storeStrong((id *)&self->_longPressedCell, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_longPressedCell, 0);
  objc_storeStrong((id *)&self->_currentDragGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_visibleCells, 0);
  objc_storeStrong((id *)&self->_presetRenderer, 0);
  objc_storeStrong((id *)&self->_layout, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_collectionView, 0);
}

@end
