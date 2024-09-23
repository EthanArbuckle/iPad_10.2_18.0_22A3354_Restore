@implementation BKThumbnailDirectory

- (BKThumbnailDirectory)initWithNibName:(id)a3 bundle:(id)a4
{
  BKThumbnailDirectory *v4;
  BKThumbnailDirectory *v5;
  double v6;
  id v7;
  void *v8;
  id v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)BKThumbnailDirectory;
  v4 = -[BKViewController initWithNibName:bundle:](&v11, "initWithNibName:bundle:", a3, a4);
  v5 = v4;
  if (v4)
  {
    *(_QWORD *)&v6 = objc_opt_class(v4).n128_u64[0];
    objc_msgSend(v7, "defaultCellAspectRatio", v6);
    -[BKThumbnailDirectory setCellAspectRatio:](v5, "setCellAspectRatio:");
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection bc_allAPITraits](UITraitCollection, "bc_allAPITraits"));
    v9 = -[BKThumbnailDirectory registerForTraitChanges:withAction:](v5, "registerForTraitChanges:withAction:", v8, "_traitCollectionDidChange:previousTraitCollection:");

  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[BKThumbnailDirectory releaseViews](self, "releaseViews");
  v3.receiver = self;
  v3.super_class = (Class)BKThumbnailDirectory;
  -[BKContentViewController dealloc](&v3, "dealloc");
}

- (void)releaseViews
{
  IMGridView *gridView;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BKThumbnailDirectory;
  -[BKContentViewController releaseViews](&v4, "releaseViews");
  -[IMGridView setDelegate:](self->_gridView, "setDelegate:", 0);
  -[IMGridView setDataSource:](self->_gridView, "setDataSource:", 0);
  gridView = self->_gridView;
  self->_gridView = 0;

}

- (void)loadView
{
  void *v3;
  id v4;
  IMGridView *v5;
  IMGridView *gridView;
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
  void *v19;
  void *v20;
  objc_super v21;
  _QWORD v22[4];

  v21.receiver = self;
  v21.super_class = (Class)BKThumbnailDirectory;
  -[BKThumbnailDirectory loadView](&v21, "loadView");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailDirectory view](self, "view"));
  v4 = objc_alloc((Class)IMGridView);
  objc_msgSend(v3, "bounds");
  v5 = (IMGridView *)objc_msgSend(v4, "initWithFrame:");
  gridView = self->_gridView;
  self->_gridView = v5;

  -[IMGridView setTranslatesAutoresizingMaskIntoConstraints:](self->_gridView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[IMGridView setDelegate:](self->_gridView, "setDelegate:", self);
  -[IMGridView setDataSource:](self->_gridView, "setDataSource:", self);
  -[IMGridView setLayoutDirection:](self->_gridView, "setLayoutDirection:", -[BKViewController layoutDirection](self, "layoutDirection"));
  objc_msgSend(v3, "addSubview:", self->_gridView);
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "safeAreaLayoutGuide"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[IMGridView leadingAnchor](self->_gridView, "leadingAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "leadingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:", v18));
  v22[0] = v17;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[IMGridView trailingAnchor](self->_gridView, "trailingAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "trailingAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v15));
  v22[1] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IMGridView topAnchor](self->_gridView, "topAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v9));
  v22[2] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[IMGridView bottomAnchor](self->_gridView, "bottomAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bottomAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:", v12));
  v22[3] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v22, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v14);

  -[BKThumbnailDirectory _updateColors](self, "_updateColors");
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BKThumbnailDirectory;
  -[BKThumbnailDirectory viewWillAppear:](&v4, "viewWillAppear:", a3);
  -[BKThumbnailDirectory reloadData](self, "reloadData");
  -[IMGridView flashScrollIndicators](self->_gridView, "flashScrollIndicators");
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BKThumbnailDirectory;
  -[BKContentViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  -[IMGridView flashScrollIndicators](self->_gridView, "flashScrollIndicators");
}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BKThumbnailDirectory;
  -[BKThumbnailDirectory viewDidLayoutSubviews](&v3, "viewDidLayoutSubviews");
  -[BKThumbnailDirectory adjustGridMetrics](self, "adjustGridMetrics");
}

- (void)animateRotationWithDuration:(double)a3
{
  -[IMGridView performRotationWithDuration:](self->_gridView, "performRotationWithDuration:", a3);
}

- (void)didRotate
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_70830;
  v2[3] = &unk_1BEA38;
  v2[4] = self;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v2);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  double v8;
  double v9;
  _QWORD v10[5];
  _QWORD v11[6];
  objc_super v12;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  objc_msgSend(v7, "transitionDuration");
  v9 = v8;
  if (v8 > 0.0)
    -[IMGridView prepareToRotateWithDestinationSize:](self->_gridView, "prepareToRotateWithDestinationSize:", width, height);
  v12.receiver = self;
  v12.super_class = (Class)BKThumbnailDirectory;
  -[BKThumbnailDirectory viewWillTransitionToSize:withTransitionCoordinator:](&v12, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v10[4] = self;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_70960;
  v11[3] = &unk_1C0718;
  v11[4] = self;
  *(double *)&v11[5] = v9;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_70970;
  v10[3] = &unk_1BE8C8;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v11, v10);

}

- (void)setLayoutDirection:(int64_t)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BKThumbnailDirectory;
  -[BKViewController setLayoutDirection:](&v5, "setLayoutDirection:");
  -[IMGridView setLayoutDirection:](self->_gridView, "setLayoutDirection:", a3);
}

- (double)pNumColumnsForSize:(CGSize)a3
{
  double height;
  double width;
  CGFloat x;
  CGFloat y;
  CGFloat v8;
  CGFloat v9;
  double v10;
  int v11;
  double v12;
  _BOOL4 v13;
  int v14;
  CGRect v16;
  CGRect v17;

  height = a3.height;
  width = a3.width;
  -[IMGridView bounds](self->_gridView, "bounds");
  x = v16.origin.x;
  y = v16.origin.y;
  v8 = v16.size.width;
  v9 = v16.size.height;
  v10 = CGRectGetWidth(v16);
  v11 = 2;
  if (!-[BKThumbnailDirectory showSpreads](self, "showSpreads"))
  {
    -[BKThumbnailDirectory cellAspectRatio](self, "cellAspectRatio");
    if (v12 <= 1.0)
      v11 = 3;
    else
      v11 = 2;
  }
  if (!isMegaPad())
    goto LABEL_10;
  if (v10 > 1024.0)
  {
    v13 = 1;
    goto LABEL_11;
  }
  if (v10 == 1024.0)
  {
    v17.origin.x = x;
    v17.origin.y = y;
    v17.size.width = v8;
    v17.size.height = v9;
    v13 = CGRectGetHeight(v17) > 1024.0;
  }
  else
  {
LABEL_10:
    v13 = 0;
  }
LABEL_11:
  if (width / height < 1.0)
    v14 = v11;
  else
    v14 = v11 + 1;
  return (double)(v14 + v13);
}

- (void)adjustGridMetrics
{
  double v3;
  double width;
  double height;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGRect v12;

  if (-[BKThumbnailDirectory im_isCompactWidth](self, "im_isCompactWidth"))
    v3 = 16.0;
  else
    v3 = 32.0;
  -[IMGridView setGridInset:](self->_gridView, "setGridInset:", v3, v3, v3, v3);
  -[IMGridView setMinimumGridSpacing:](self->_gridView, "setMinimumGridSpacing:", v3, v3);
  -[IMGridView bounds](self->_gridView, "bounds");
  width = v12.size.width;
  height = v12.size.height;
  v6 = CGRectGetWidth(v12);
  -[IMGridView gridInset](self->_gridView, "gridInset");
  v8 = v6 - v7;
  -[IMGridView gridInset](self->_gridView, "gridInset");
  v10 = v8 - v9;
  -[BKThumbnailDirectory pNumColumnsForSize:](self, "pNumColumnsForSize:", width, height);
  if (v10 > 0.0)
  {
    -[BKThumbnailDirectory setCellWidth:](self, "setCellWidth:", floor((v10 - (v11 + -1.0) * v3) / v11));
    -[BKThumbnailDirectory cellSize](self, "cellSize");
    -[IMGridView setCellSize:](self->_gridView, "setCellSize:");
  }
}

+ (double)defaultCellAspectRatio
{
  return *(double *)&BKThumbnailDirectoryDefaultAspectRatio;
}

+ (CGSize)defaultCellSize
{
  int v3;
  double *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v3 = isPad(a1, a2);
  v4 = (double *)&BKThumbnailDirectoryCellWidth_iPad;
  if (!v3)
    v4 = (double *)&BKThumbnailDirectoryCellWidth_iPhone;
  v5 = *v4;
  objc_msgSend(a1, "defaultCellAspectRatio");
  *(float *)&v6 = v5 / v6;
  v7 = roundf(*(float *)&v6);
  v8 = v5;
  result.height = v7;
  result.width = v8;
  return result;
}

- (CGSize)cellSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  -[BKThumbnailDirectory cellWidth](self, "cellWidth");
  v4 = v3;
  -[BKThumbnailDirectory cellAspectRatio](self, "cellAspectRatio");
  v5 = v4;
  if (v6 > 0.0)
  {
    -[BKThumbnailDirectory cellAspectRatio](self, "cellAspectRatio");
    v5 = v4 / v7;
  }
  if (-[BKThumbnailDirectory showSpreads](self, "showSpreads"))
    v8 = v5 * 0.5;
  else
    v8 = v5;
  v9 = ceil(v4);
  v10 = ceil(v8);
  result.height = v10;
  result.width = v9;
  return result;
}

- (CGSize)imageSize
{
  _BOOL8 v3;
  _BOOL4 v4;
  uint64_t v5;
  int v6;
  double *v7;
  double *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  unsigned int v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGSize result;

  v3 = -[BKThumbnailDirectory showSpreads](self, "showSpreads");
  v4 = v3;
  v6 = isPad(v3, v5);
  v7 = (double *)&BKThumbnailDirectoryCellSpreadWidth_iPad;
  if (!v4)
    v7 = (double *)&BKThumbnailDirectoryCellWidth_iPad;
  v8 = (double *)&BKThumbnailDirectoryCellSpreadWidth_iPhone;
  if (!v4)
    v8 = (double *)&BKThumbnailDirectoryCellWidth_iPhone;
  if (!v6)
    v7 = v8;
  v9 = *v7;
  -[BKThumbnailDirectory cellAspectRatio](self, "cellAspectRatio");
  v10 = v9;
  if (v11 > 0.0)
  {
    -[BKThumbnailDirectory cellAspectRatio](self, "cellAspectRatio");
    v10 = v9 / v12;
  }
  v13 = -[BKThumbnailDirectory showSpreads](self, "showSpreads");
  v14 = v10 * 0.5;
  v15 = v9 * 0.5;
  if (!v13)
  {
    v15 = v9;
    v14 = v10;
  }
  v16 = ceil(v15);
  v17 = ceil(v14);
  result.height = v17;
  result.width = v16;
  return result;
}

- (Class)cellClass
{
  unsigned int v2;
  __objc2_class **v3;
  uint64_t v4;

  v2 = -[BKThumbnailDirectory showSpreads](self, "showSpreads");
  v3 = off_1BD450;
  if (!v2)
    v3 = off_1BD468;
  objc_opt_class(*v3);
  return (Class)(id)objc_claimAutoreleasedReturnValue(v4);
}

- (void)reloadData
{
  -[IMGridView reloadData](self->_gridView, "reloadData");
}

- (CGRect)frameForThumbnailAtLocation:(id)a3
{
  unint64_t v4;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGRect result;

  v4 = -[BKThumbnailDirectory indexForLocation:](self, "indexForLocation:", a3);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    x = CGRectNull.origin.x;
    y = CGRectNull.origin.y;
    width = CGRectNull.size.width;
    height = CGRectNull.size.height;
  }
  else
  {
    -[IMGridView rectForCellAtIndex:](self->_gridView, "rectForCellAtIndex:", v4);
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailDirectory view](self, "view"));
    objc_msgSend(v17, "convertRect:fromView:", self->_gridView, v10, v12, v14, v16);
    x = v18;
    y = v19;
    width = v20;
    height = v21;

  }
  v22 = x;
  v23 = y;
  v24 = width;
  v25 = height;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (void)scrollToLocation:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  id v6;

  v4 = -[BKThumbnailDirectory indexForLocation:](self, "indexForLocation:", a3);
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = v4;
    v6 = (id)objc_claimAutoreleasedReturnValue(-[BKThumbnailDirectory gridView](self, "gridView"));
    objc_msgSend(v6, "scrollToCellAtIndex:animated:", v5, 0);

  }
}

- (id)locationAtIndex:(unint64_t)a3
{
  return 0;
}

- (unint64_t)indexForLocation:(id)a3
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (int64_t)pageNumberForCellIndex:(unint64_t)a3
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (int64_t)leftPageNumberAtIndex:(unint64_t)a3
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (int64_t)rightPageNumberAtIndex:(unint64_t)a3
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)cell:(id)a3 matchesPageNumber:(int64_t)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;

  v6 = a3;
  if (-[BKThumbnailDirectory showSpreads](self, "showSpreads"))
  {
    v7 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "spreadView"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "leftPageView"));
    if (objc_msgSend(v9, "pageNumber") == (id)a4)
    {
      v10 = 1;
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "spreadView"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "rightPageView"));
      v10 = objc_msgSend(v12, "pageNumber") == (id)a4;

    }
  }
  else
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "pageView"));
    v10 = objc_msgSend(v7, "pageNumber") == (id)a4;
  }

  return v10;
}

- (void)reloadCellAtIndex:(unint64_t)a3
{
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[IMGridView cellForIndex:](self->_gridView, "cellForIndex:"));
  -[BKThumbnailDirectory configureCell:atIndex:](self, "configureCell:atIndex:", v5, a3);

}

- (void)adjustToNewSize:(CGSize)a3
{
  -[IMGridView prepareToRotateWithDestinationSize:](self->_gridView, "prepareToRotateWithDestinationSize:", a3.width, a3.height);
  -[BKThumbnailDirectory animateRotationWithDuration:](self, "animateRotationWithDuration:", 0.0);
  -[BKThumbnailDirectory didRotate](self, "didRotate");
}

- (void)setThumbnail:(id)a3 forPage:(int64_t)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  if (a3)
  {
    v6 = objc_alloc((Class)NSIndexSet);
    v7 = -[IMGridView rangeOfVisibleCells](self->_gridView, "rangeOfVisibleCells");
    v12 = objc_msgSend(v6, "initWithIndexesInRange:", v7, v8);
    v9 = objc_msgSend(v12, "firstIndex");
    if (v9 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v10 = v9;
      while (1)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[IMGridView cellForIndex:](self->_gridView, "cellForIndex:", v10));
        if (-[BKThumbnailDirectory cell:matchesPageNumber:](self, "cell:matchesPageNumber:", v11, a4))
          break;
        v10 = objc_msgSend(v12, "indexGreaterThanIndex:", v10);

        if (v10 == (id)0x7FFFFFFFFFFFFFFFLL)
          goto LABEL_9;
      }
      -[IMGridView reloadCellAtIndex:](self->_gridView, "reloadCellAtIndex:", v10);

    }
LABEL_9:

  }
}

- (id)thumbnailForPageNumber:(int64_t)a3 size:(CGSize)a4
{
  double height;
  double width;
  void *v8;
  void *v9;

  height = a4.height;
  width = a4.width;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKDirectoryContent directoryDelegate](self, "directoryDelegate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "thumbnailDirectory:thumbnailForPage:size:context:", self, a3, self, width, height));

  return v9;
}

- (void)updateVisibleArtwork
{
  void *v3;
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKDirectoryContent directoryDelegate](self, "directoryDelegate"));
  objc_msgSend(v3, "thumbnailDirectory:cancelPreviousRenderRequestsWithContext:", self, self);

  v4 = (char *)-[IMGridView rangeOfVisibleCells](self->_gridView, "rangeOfVisibleCells");
  if (v4 < &v4[v5])
  {
    v6 = v4;
    v7 = v5;
    do
    {
      -[BKThumbnailDirectory reloadCellAtIndex:](self, "reloadCellAtIndex:", v6++);
      --v7;
    }
    while (v7);
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_msgSend(v4, "isDragging") & 1) == 0
    && (objc_msgSend(v4, "isDecelerating") & 1) == 0)
  {
    -[BKThumbnailDirectory updateVisibleArtwork](self, "updateVisibleArtwork");
  }

}

- (int64_t)gridView:(id)a3 numberOfColumnsForSize:(CGSize)a4
{
  double v4;

  -[BKThumbnailDirectory pNumColumnsForSize:](self, "pNumColumnsForSize:", a3, a4.width, a4.height);
  return (uint64_t)v4;
}

- (int64_t)numberOfCellsInGridView:(id)a3
{
  return 0;
}

- (void)configureCell:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;
  _BOOL8 v12;
  void *v13;
  int64_t v14;
  int64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
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
  int64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;

  v6 = a3;
  if (v6)
  {
    v43 = v6;
    -[BKThumbnailDirectory imageSize](self, "imageSize");
    v8 = v7;
    v10 = v9;
    if (-[BKThumbnailDirectory showSpreads](self, "showSpreads"))
    {
      v11 = v43;
      v12 = -[BKThumbnailDirectory hidesSpine](self, "hidesSpine");
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "spreadView"));
      objc_msgSend(v13, "setHidesSpine:", v12);

      v14 = -[BKThumbnailDirectory leftPageNumberAtIndex:](self, "leftPageNumberAtIndex:", a4);
      v15 = -[BKThumbnailDirectory rightPageNumberAtIndex:](self, "rightPageNumberAtIndex:", a4);
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "spreadView"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "leftPageView"));
      objc_msgSend(v17, "setPageNumber:", v14);

      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "spreadView"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "rightPageView"));
      objc_msgSend(v19, "setPageNumber:", v15);

      v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKDirectoryContent pageTitleForPageNumber:](self, "pageTitleForPageNumber:", v14));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "spreadView"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "leftPageView"));
      objc_msgSend(v22, "setPageTitle:", v20);

      v23 = (void *)objc_claimAutoreleasedReturnValue(-[BKDirectoryContent pageTitleForPageNumber:](self, "pageTitleForPageNumber:", v15));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "spreadView"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "rightPageView"));
      objc_msgSend(v25, "setPageTitle:", v23);

      v26 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailDirectory thumbnailForPageNumber:size:](self, "thumbnailForPageNumber:size:", v14, v8, v10));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "spreadView"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "leftPageView"));
      objc_msgSend(v28, "setImage:", v26);

      v29 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailDirectory thumbnailForPageNumber:size:](self, "thumbnailForPageNumber:size:", v15, v8, v10));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "spreadView"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "rightPageView"));
      objc_msgSend(v31, "setImage:", v29);

      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "spreadView"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "leftPageView"));
      objc_msgSend(v33, "setShowsPageNumber:", 1);

      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "spreadView"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "rightPageView"));
      objc_msgSend(v35, "setShowsPageNumber:", 1);

      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "spreadView"));
      objc_msgSend(v36, "setNeedsLayout");
    }
    else
    {
      v37 = -[BKThumbnailDirectory pageNumberForCellIndex:](self, "pageNumberForCellIndex:", a4);
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailDirectory thumbnailForPageNumber:size:](self, "thumbnailForPageNumber:size:", v37, v8, v10));
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "pageView"));
      objc_msgSend(v39, "setImage:", v38);

      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "pageView"));
      objc_msgSend(v40, "setPageNumber:", v37);

      v41 = (void *)objc_claimAutoreleasedReturnValue(-[BKDirectoryContent pageTitleForPageNumber:](self, "pageTitleForPageNumber:", v37));
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "pageView"));
      objc_msgSend(v42, "setPageTitle:", v41);

      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "pageView"));
      objc_msgSend(v36, "setShowsPageNumber:", 1);
    }

    v6 = v43;
  }

}

- (id)gridView:(id)a3 cellForIndex:(int64_t)a4
{
  id v6;
  double v7;
  double v8;

  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dequeueReusableCell"));
  if (!v6)
  {
    -[BKThumbnailDirectory cellSize](self, "cellSize");
    v6 = objc_msgSend(objc_alloc(-[BKThumbnailDirectory cellClass](self, "cellClass")), "initWithFrame:", 0.0, 0.0, v7, v8);
  }
  -[BKThumbnailDirectory configureCell:atIndex:](self, "configureCell:atIndex:", v6, a4);
  return v6;
}

- (void)gridView:(id)a3 didSelectItemAtIndex:(int64_t)a4
{
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[BKThumbnailDirectory locationAtIndex:](self, "locationAtIndex:", a4));
  -[BKDirectoryContent didSelectLocation:](self, "didSelectLocation:", v5);

}

- (void)_updateColors
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailDirectory theme](self, "theme"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "backgroundColorForTraitEnvironment:", self));

  v4 = (uint64_t)v6;
  if (!v6)
    v4 = objc_claimAutoreleasedReturnValue(+[UIColor bc_booksBackground](UIColor, "bc_booksBackground"));
  v7 = (id)v4;
  -[IMGridView setBackgroundColor:](self->_gridView, "setBackgroundColor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailDirectory viewIfLoaded](self, "viewIfLoaded"));
  objc_msgSend(v5, "setBackgroundColor:", v7);

}

- (void)setTheme:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BKThumbnailDirectory;
  -[BKContentViewController setTheme:](&v4, "setTheme:", a3);
  -[BKThumbnailDirectory _updateColors](self, "_updateColors");
}

- (double)cellAspectRatio
{
  return self->_cellAspectRatio;
}

- (void)setCellAspectRatio:(double)a3
{
  self->_cellAspectRatio = a3;
}

- (BOOL)showSpreads
{
  return self->_showSpreads;
}

- (void)setShowSpreads:(BOOL)a3
{
  self->_showSpreads = a3;
}

- (BOOL)hidesSpine
{
  return self->_hidesSpine;
}

- (void)setHidesSpine:(BOOL)a3
{
  self->_hidesSpine = a3;
}

- (IMGridView)gridView
{
  return self->_gridView;
}

- (double)cellWidth
{
  return self->_cellWidth;
}

- (void)setCellWidth:(double)a3
{
  self->_cellWidth = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gridView, 0);
}

@end
