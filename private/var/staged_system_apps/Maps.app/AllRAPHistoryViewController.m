@implementation AllRAPHistoryViewController

- (AllRAPHistoryViewController)initWithReportSection:(unint64_t)a3 sectionTitle:(id)a4
{
  id v6;
  AllRAPHistoryViewController *v7;
  AllRAPHistoryViewController *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  ContainerHeaderView *v12;
  ContainerHeaderView *titleHeaderView;
  void *v14;
  void *v15;
  objc_super v17;

  v6 = a4;
  v17.receiver = self;
  v17.super_class = (Class)AllRAPHistoryViewController;
  v7 = -[AllRAPHistoryViewController initWithNibName:bundle:](&v17, "initWithNibName:bundle:", 0, 0);
  v8 = v7;
  if (v7)
  {
    v9 = (objc_class *)objc_opt_class(v7);
    v10 = NSStringFromClass(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    -[AllRAPHistoryViewController setAccessibilityIdentifier:](v8, "setAccessibilityIdentifier:", v11);

    v8->_reportSectionTypeForView = a3;
    v12 = -[ContainerHeaderView initWithFrame:]([ContainerHeaderView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    titleHeaderView = v8->_titleHeaderView;
    v8->_titleHeaderView = v12;

    -[ContainerHeaderView setTitle:](v8->_titleHeaderView, "setTitle:", v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v8, "cardPresentationController"));
    objc_msgSend(v14, "setPresentedModally:", 1);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v8, "cardPresentationController"));
    objc_msgSend(v15, "setTakesAvailableHeight:", 1);

  }
  return v8;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AllRAPHistoryViewController;
  -[ContaineeViewController viewDidLoad](&v9, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AllRAPHistoryViewController view](self, "view"));
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("AllRAPHistoryView"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGroupedBackgroundColor](UIColor, "systemGroupedBackgroundColor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AllRAPHistoryViewController view](self, "view"));
  objc_msgSend(v5, "setBackgroundColor:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v7 = sub_1002A8AA0(self) != 5;
  -[ContainerHeaderView setTranslatesAutoresizingMaskIntoConstraints:](self->_titleHeaderView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[ContainerHeaderView setDelegate:](self->_titleHeaderView, "setDelegate:", self);
  -[ContainerHeaderView setHeaderSize:](self->_titleHeaderView, "setHeaderSize:", v7);
  -[ContainerHeaderView setHairLineAlpha:](self->_titleHeaderView, "setHairLineAlpha:", 0.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[ContainerHeaderView setBackgroundColor:](self->_titleHeaderView, "setBackgroundColor:", v8);

  objc_msgSend(v6, "addSubview:", self->_titleHeaderView);
  -[AllRAPHistoryViewController _createCollectionViewLayout](self, "_createCollectionViewLayout");
  -[AllRAPHistoryViewController _setupConstraints](self, "_setupConstraints");

}

- (void)_setupConstraints
{
  void *v3;
  void *v4;
  void *v5;
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
  _QWORD v36[8];

  v34 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView topAnchor](self->_titleHeaderView, "topAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "topAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:", v33));
  v36[0] = v32;
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView leadingAnchor](self->_titleHeaderView, "leadingAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "leadingAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:", v29));
  v36[1] = v28;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView trailingAnchor](self->_titleHeaderView, "trailingAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "trailingAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:", v25));
  v36[2] = v24;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView bottomAnchor](self->_titleHeaderView, "bottomAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "bottomAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v21));
  v36[3] = v20;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView topAnchor](self->_collectionView, "topAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "topAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v17));
  v36[4] = v16;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView leadingAnchor](self->_collectionView, "leadingAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "leadingAnchor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:", v13));
  v36[5] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView trailingAnchor](self->_collectionView, "trailingAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "trailingAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintEqualToAnchor:", v6));
  v36[6] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView bottomAnchor](self->_collectionView, "bottomAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bottomAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v10));
  v36[7] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v36, 8));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v12);

}

- (void)_createCollectionViewLayout
{
  id v3;
  id v4;
  void *v5;
  UICollectionView *v6;
  void *v7;
  UICollectionView *collectionView;
  UICollectionView *v9;
  void *v10;
  UICollectionView *v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[5];

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1002C3C68;
  v14[3] = &unk_1011AFFC0;
  v14[4] = self;
  v3 = objc_msgSend(objc_alloc((Class)UICollectionViewCompositionalLayout), "initWithSectionProvider:", v14);
  v4 = objc_alloc((Class)UICollectionView);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AllRAPHistoryViewController view](self, "view"));
  objc_msgSend(v5, "bounds");
  v6 = (UICollectionView *)objc_msgSend(v4, "initWithFrame:collectionViewLayout:", v3);

  -[UICollectionView setTranslatesAutoresizingMaskIntoConstraints:](v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[UICollectionView setBackgroundColor:](v6, "setBackgroundColor:", v7);

  collectionView = self->_collectionView;
  self->_collectionView = v6;
  v9 = v6;

  -[UICollectionView setAccessibilityIdentifier:](self->_collectionView, "setAccessibilityIdentifier:", CFSTR("AllRAPHistoryCollectionView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  objc_msgSend(v10, "addSubview:", v9);

  v11 = self->_collectionView;
  v12 = objc_opt_class(TwoLinesCollectionViewInsetGroupedListCell);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[TwoLineCollectionViewListCell identifier](TwoLinesCollectionViewInsetGroupedListCell, "identifier"));
  -[UICollectionView registerClass:forCellWithReuseIdentifier:](v11, "registerClass:forCellWithReuseIdentifier:", v12, v13);

}

- (void)loadDataSource
{
  AllRAPHistoryDataSource *v3;
  AllRAPHistoryDataSource *reportsDataSource;

  v3 = -[AllRAPHistoryDataSource initWithCollectionView:reportSection:]([AllRAPHistoryDataSource alloc], "initWithCollectionView:reportSection:", self->_collectionView, self->_reportSectionTypeForView);
  reportsDataSource = self->_reportsDataSource;
  self->_reportsDataSource = v3;

  -[DataSource setDelegate:](self->_reportsDataSource, "setDelegate:", self);
  -[UICollectionView setDelegate:](self->_collectionView, "setDelegate:", self->_reportsDataSource);
  -[UICollectionView setDataSource:](self->_collectionView, "setDataSource:", self->_reportsDataSource);
  -[DataSource setActive:](self->_reportsDataSource, "setActive:", 1);
}

- (void)dataSource:(id)a3 itemTapped:(id)a4
{
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a4;
  v5 = objc_opt_class(RAPRecord);
  if ((objc_opt_isKindOfClass(v7, v5) & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
    objc_msgSend(v6, "viewController:presentReportDetail:fromEntryPoint:", self, v7, 39);

  }
}

- (void)headerViewButtonTapped:(id)a3 buttonType:(unint64_t)a4
{
  -[AllRAPHistoryViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportsDataSource, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_titleHeaderView, 0);
}

@end
