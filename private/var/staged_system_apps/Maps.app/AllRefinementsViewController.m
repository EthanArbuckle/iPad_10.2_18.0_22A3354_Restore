@implementation AllRefinementsViewController

- (AllRefinementsViewController)initWithViewModel:(id)a3 selectionSequenceNumber:(id)a4 resultRefinementsAnalyticsDelegate:(id)a5
{
  id v9;
  id v10;
  id v11;
  AllRefinementsViewController *v12;
  AllRefinementsViewController *v13;
  AllRefinementsViewModel *v14;
  AllRefinementsViewModel *copiedViewModel;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v22;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)AllRefinementsViewController;
  v12 = -[AllRefinementsViewController initWithNibName:bundle:](&v22, "initWithNibName:bundle:", 0, 0);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_viewModel, a3);
    v14 = (AllRefinementsViewModel *)objc_msgSend(v9, "copy");
    copiedViewModel = v13->_copiedViewModel;
    v13->_copiedViewModel = v14;

    objc_storeStrong((id *)&v13->_selectionSequenceNumber, a4);
    objc_storeWeak((id *)&v13->_analyticsDelegate, v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v13, "cardPresentationController"));
    objc_msgSend(v16, "setPresentedModally:", 1);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v13, "cardPresentationController"));
    objc_msgSend(v17, "setAllowsSwipeToDismiss:", 0);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v13, "cardPresentationController"));
    objc_msgSend(v18, "setDefaultContaineeLayout:", 5);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v13, "cardPresentationController"));
    objc_msgSend(v19, "setTakesAvailableHeight:", 1);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v13, "cardPresentationController"));
    objc_msgSend(v20, "setHideGrabber:", 1);

    -[AllRefinementsViewController setAccessibilityIdentifier:](v13, "setAccessibilityIdentifier:", CFSTR("AllRefinementsView"));
  }

  return v13;
}

- (double)heightForLayout:(unint64_t)a3
{
  void *v5;
  unint64_t v6;
  void *v8;
  unsigned int v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double result;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  objc_super v28;
  objc_super v29;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  v6 = (unint64_t)objc_msgSend(v5, "containerStyle");
  if (v6 > 7 || ((1 << v6) & 0xE3) == 0)
  {

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    objc_msgSend(v22, "availableHeight");
    v24 = v23;

    return v24;
  }
  else
  {

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[AllRefinementsViewController viewModel](self, "viewModel"));
    v9 = objc_msgSend(v8, "viewTakesFullHeight");

    if (v9)
    {
      -[ContaineeViewController heightForLayout:](&v29, "heightForLayout:", a3, v28.receiver, v28.super_class, self, AllRefinementsViewController);
      return v10 + 32.0;
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[AllRefinementsViewController collectionViewLayout](self, "collectionViewLayout"));
    objc_msgSend(v11, "collectionViewContentSize");
    v13 = v12;

    if (v13 <= 2.22044605e-16)
    {
      -[ContaineeViewController heightForLayout:](&v28, "heightForLayout:", 2, self, AllRefinementsViewController, v29.receiver, v29.super_class);
      return v10 + 32.0;
    }
    -[ContaineeViewController headerHeight](self, "headerHeight");
    v15 = v13 + v14;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    objc_msgSend(v16, "availableHeight");
    if (v15 < v17)
    {
      -[ContaineeViewController headerHeight](self, "headerHeight");
      v20 = v13 + v25;
    }
    else
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
      objc_msgSend(v18, "availableHeight");
      v20 = v19;

    }
    sub_1005EC2E4();
    v27 = v26;
    result = v20 + 32.0;
    if (v27 > v20 + 32.0)
      sub_1005EC2E4();
  }
  return result;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  double v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AllRefinementsViewController;
  -[ContaineeViewController viewDidLoad](&v6, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AllRefinementsViewController view](self, "view"));
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("AllRefinementsView"));

  -[AllRefinementsViewController addHeaderView](self, "addHeaderView");
  -[AllRefinementsViewController addCollectionView](self, "addCollectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AllRefinementsViewController collectionView](self, "collectionView"));
  objc_msgSend(v4, "frame");
  self->_collectionViewWidth = v5;

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double collectionViewWidth;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  void *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)AllRefinementsViewController;
  -[ContaineeViewController viewDidLayoutSubviews](&v19, "viewDidLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AllRefinementsViewController collectionViewLayout](self, "collectionViewLayout"));
  objc_msgSend(v3, "collectionViewContentSize");
  v5 = v4;
  -[ContaineeViewController headerHeight](self, "headerHeight");
  v7 = v5 + v6;

  if (v7 > 2.22044605e-16)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    -[AllRefinementsViewController heightForLayout:](self, "heightForLayout:", objc_msgSend(v8, "containeeLayout"));
    v10 = v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[AllRefinementsViewController collectionView](self, "collectionView"));
    objc_msgSend(v11, "setScrollEnabled:", v7 > v10);

  }
  collectionViewWidth = self->_collectionViewWidth;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[AllRefinementsViewController collectionView](self, "collectionView"));
  objc_msgSend(v13, "frame");
  v15 = v14;

  if (collectionViewWidth != v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[AllRefinementsViewController collectionView](self, "collectionView"));
    objc_msgSend(v16, "frame");
    self->_collectionViewWidth = v17;

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[AllRefinementsViewController collectionView](self, "collectionView"));
    objc_msgSend(v18, "reloadData");

  }
}

- (void)addHeaderView
{
  ModalCardHeaderView *v3;
  void *v4;
  ModalCardHeaderView *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
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
  _QWORD v35[4];

  v3 = [ModalCardHeaderView alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[ModalCardHeaderConfiguration defaultModalCardHeaderConfiguration](ModalCardHeaderConfiguration, "defaultModalCardHeaderConfiguration"));
  v5 = -[ModalCardHeaderView initWithConfiguration:](v3, "initWithConfiguration:", v4);

  -[ModalCardHeaderView setAccessibilityIdentifier:](v5, "setAccessibilityIdentifier:", CFSTR("AllRefinementsHeader"));
  -[ModalCardHeaderView setUseAdaptiveFont:](v5, "setUseAdaptiveFont:", 1);
  -[ModalCardHeaderView setTranslatesAutoresizingMaskIntoConstraints:](v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AllRefinementsViewController viewModel](self, "viewModel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "displayName"));
  -[ModalCardHeaderView setTitle:](v5, "setTitle:", v7);

  if (MapsFeature_IsEnabled_SearchAndDiscovery(v8))
  {
    -[AllRefinementsViewController _setupTopLeadingButton:filters:](self, "_setupTopLeadingButton:filters:", v5, -[AllRefinementsViewController _checkIfFiltersAreSelected](self, "_checkIfFiltersAreSelected"));
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ModalCardHeaderView leadingButton](v5, "leadingButton"));
    v10 = sub_1009A98D8();
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    objc_msgSend(v9, "setTitle:forState:", v11, 0);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ModalCardHeaderView leadingButton](v5, "leadingButton"));
    objc_msgSend(v12, "addTarget:action:forControlEvents:", self, "didTapOnCancel:", 64);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ModalCardHeaderView trailingButton](v5, "trailingButton"));
  v14 = sub_1009A99D4();
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  objc_msgSend(v13, "setTitle:forState:", v15, 0);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[ModalCardHeaderView trailingButton](v5, "trailingButton"));
  objc_msgSend(v16, "addTarget:action:forControlEvents:", self, "didTapOnApply:", 64);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  objc_msgSend(v17, "addSubview:", v5);

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[ModalCardHeaderView leadingAnchor](v5, "leadingAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "leadingAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintEqualToAnchor:", v32));
  v35[0] = v31;
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[ModalCardHeaderView trailingAnchor](v5, "trailingAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "trailingAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:", v28));
  v35[1] = v27;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[ModalCardHeaderView topAnchor](v5, "topAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "topAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:", v19));
  v35[2] = v20;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[ModalCardHeaderView bottomAnchor](v5, "bottomAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "bottomAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v23));
  v35[3] = v24;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v35, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v25);

  -[AllRefinementsViewController setModalHeaderView:](self, "setModalHeaderView:", v5);
  -[AllRefinementsViewController updateHeaderHairlineAnimated:](self, "updateHeaderHairlineAnimated:", 0);

}

- (void)addCollectionView
{
  AllRefinementsViewController *v2;
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
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
  AllRefinementsDataSource *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  AllRefinementsDataSource *v32;
  Class isa;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  _QWORD v46[4];
  id v47;
  id location;
  _QWORD v49[4];

  v2 = self;
  objc_initWeak(&location, self);
  v3 = objc_alloc((Class)UICollectionViewCompositionalLayout);
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = sub_1004280AC;
  v46[3] = &unk_1011B5F50;
  objc_copyWeak(&v47, &location);
  v4 = objc_msgSend(v3, "initWithSectionProvider:", v46);
  -[AllRefinementsViewController setCollectionViewLayout:](v2, "setCollectionViewLayout:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AllRefinementsViewController collectionViewLayout](v2, "collectionViewLayout"));
  v6 = objc_opt_class(AllRefinementsSectionBackground);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[AllRefinementsSectionBackground decorationViewKind](AllRefinementsSectionBackground, "decorationViewKind"));
  objc_msgSend(v5, "registerClass:forDecorationViewOfKind:", v6, v7);

  v8 = objc_alloc((Class)UICollectionView);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[AllRefinementsViewController collectionViewLayout](v2, "collectionViewLayout"));
  v10 = objc_msgSend(v8, "initWithFrame:collectionViewLayout:", v9, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[AllRefinementsViewController setCollectionView:](v2, "setCollectionView:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[AllRefinementsViewController collectionView](v2, "collectionView"));
  objc_msgSend(v11, "setAccessibilityIdentifier:", CFSTR("AllRefinementsCollectionView"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[AllRefinementsViewController collectionView](v2, "collectionView"));
  objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[AllRefinementsViewController collectionView](v2, "collectionView"));
  objc_msgSend(v14, "setBackgroundColor:", v13);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[AllRefinementsViewController collectionView](v2, "collectionView"));
  objc_msgSend(v15, "setAlwaysBounceVertical:", 1);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](v2, "contentView"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[AllRefinementsViewController collectionView](v2, "collectionView"));
  objc_msgSend(v16, "addSubview:", v17);

  v45 = (void *)objc_claimAutoreleasedReturnValue(-[AllRefinementsViewController collectionView](v2, "collectionView"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "leadingAnchor"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](v2, "contentView"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "leadingAnchor"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "constraintEqualToAnchor:", v42));
  v49[0] = v41;
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[AllRefinementsViewController collectionView](v2, "collectionView"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "trailingAnchor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](v2, "contentView"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "trailingAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintEqualToAnchor:", v37));
  v49[1] = v36;
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[AllRefinementsViewController collectionView](v2, "collectionView"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "topAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](v2, "contentView"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "topAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:", v19));
  v49[2] = v20;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[AllRefinementsViewController collectionView](v2, "collectionView"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "bottomAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](v2, "contentView"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "bottomAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v24));
  v49[3] = v25;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v49, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v26);

  v27 = [AllRefinementsDataSource alloc];
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[AllRefinementsViewController collectionView](v2, "collectionView"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[AllRefinementsViewController viewModel](v2, "viewModel"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[AllRefinementsViewController selectionSequenceNumber](v2, "selectionSequenceNumber"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[AllRefinementsViewController analyticsDelegate](v2, "analyticsDelegate"));
  v32 = -[AllRefinementsDataSource initWithCollectionView:viewModel:scrollViewDelegate:selectionSequenceNumber:analyticsDelegate:viewModelDelegate:](v27, "initWithCollectionView:viewModel:scrollViewDelegate:selectionSequenceNumber:analyticsDelegate:viewModelDelegate:", v28, v29, v2, v30, v31, v2);
  v2 = (AllRefinementsViewController *)((char *)v2 + 168);
  isa = v2->super.super.super.super.super.super.isa;
  v2->super.super.super.super.super.super.isa = (Class)v32;

  -[objc_class displayRefinements](v2->super.super.super.super.super.super.isa, "displayRefinements");
  objc_destroyWeak(&v47);
  objc_destroyWeak(&location);
}

- (void)dismiss
{
  -[ContaineeViewController handleDismissAction:](self, "handleDismissAction:", 0);
}

- (void)updateHeaderHairlineAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  unsigned int v6;
  double v7;
  _QWORD v8[5];
  _QWORD v9[5];

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AllRefinementsViewController modalHeaderView](self, "modalHeaderView"));

  if (v5)
  {
    v6 = -[UICollectionView _maps_shouldShowTopHairline](self->_collectionView, "_maps_shouldShowTopHairline");
    v7 = 0.0;
    if (v6)
      v7 = 1.0;
    v8[4] = self;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1004281EC;
    v9[3] = &unk_1011B22D8;
    v9[4] = self;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10042823C;
    v8[3] = &unk_1011B2300;
    +[UIScrollView _maps_updateTopHairlineAlpha:animated:getter:setter:](UIScrollView, "_maps_updateTopHairlineAlpha:animated:getter:setter:", v3, v9, v8, v7);
  }
}

- (void)didTapOnClear:(id)a3
{
  void *v4;
  id v5;
  AllRefinementsDataSource *dataSource;
  void *v7;
  id v8;

  -[AllRefinementsViewController _clearCurrentSelection](self, "_clearCurrentSelection", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AllRefinementsViewController copiedViewModel](self, "copiedViewModel"));
  v5 = objc_msgSend(v4, "copy");
  -[AllRefinementsViewController setViewModel:](self, "setViewModel:", v5);

  dataSource = self->_dataSource;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AllRefinementsViewController viewModel](self, "viewModel"));
  -[AllRefinementsDataSource reloadCollectionView:](dataSource, "reloadCollectionView:", v7);

  v8 = (id)objc_claimAutoreleasedReturnValue(-[AllRefinementsViewController modalHeaderView](self, "modalHeaderView"));
  -[AllRefinementsViewController _setupTopLeadingButton:filters:](self, "_setupTopLeadingButton:filters:", v8, 0);

}

- (void)didTapOnCancel:(id)a3
{
  -[ContaineeViewController handleDismissAction:](self, "handleDismissAction:", a3);
  -[AllRefinementsViewController _sendAnalyticsForEvent:](self, "_sendAnalyticsForEvent:", 0);
}

- (void)didTapOnApply:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[ContaineeViewController handleDismissAction:](self, "handleDismissAction:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AllRefinementsViewController allRefinementsDelegate](self, "allRefinementsDelegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AllRefinementsViewController viewModel](self, "viewModel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AllRefinementsViewController dataSource](self, "dataSource"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "selectionSequenceNumber"));
  objc_msgSend(v4, "allRefinementsApplyViewModel:selectionSequenceNumber:", v5, v7);

  -[AllRefinementsViewController _sendAnalyticsForEvent:](self, "_sendAnalyticsForEvent:", 1);
}

- (void)scrollViewDidScroll:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AllRefinementsViewController;
  -[ContaineeViewController scrollViewDidScroll:](&v4, "scrollViewDidScroll:", a3);
  -[AllRefinementsViewController updateHeaderHairlineAnimated:](self, "updateHeaderHairlineAnimated:", 1);
}

- (void)_sendAnalyticsForEvent:(unint64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AllRefinementsViewController viewModel](self, "viewModel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sections"));
  if (objc_msgSend(v6, "count") == (id)1)
    v7 = 2;
  else
    v7 = 1;

  v8 = (id)objc_claimAutoreleasedReturnValue(-[AllRefinementsViewController analyticsDelegate](self, "analyticsDelegate"));
  objc_msgSend(v8, "logRefinementsEvent:fromSource:", a3, v7);

}

- (BOOL)_checkIfFiltersAreSelected
{
  void *v2;
  void *v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AllRefinementsViewController viewModel](self, "viewModel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "sections"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100428594;
  v5[3] = &unk_1011B5FC8;
  v5[4] = &v6;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (void)_clearCurrentSelection
{
  void *v3;
  id v4;

  if (MapsFeature_IsEnabled_SearchAndDiscovery(self))
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(-[AllRefinementsViewController copiedViewModel](self, "copiedViewModel"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sections"));
    objc_msgSend(v3, "enumerateObjectsUsingBlock:", &stru_1011B6008);

  }
}

- (void)_setupTopLeadingButton:(id)a3 filters:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  AllRefinementsViewController *v17;
  const char *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;

  v4 = a4;
  v26 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "leadingButton"));
  objc_msgSend(v6, "removeTarget:action:forControlEvents:", self, "didTapOnClear:", 64);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "leadingButton"));
  objc_msgSend(v7, "removeTarget:action:forControlEvents:", self, "didTapOnCancel:", 64);

  if (v4)
  {
    v8 = sub_1009A9884();
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "leadingButton"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "titleLabel"));
    objc_msgSend(v11, "setText:", v9);

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "leadingButton"));
    v13 = sub_1009A9884();
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    objc_msgSend(v12, "setTitle:forState:", v14, 0);

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "leadingButton"));
    v16 = v15;
    v17 = self;
    v18 = "didTapOnClear:";
  }
  else
  {
    v19 = sub_1009A98D8();
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "leadingButton"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "titleLabel"));
    objc_msgSend(v22, "setText:", v20);

    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "leadingButton"));
    v24 = sub_1009A98D8();
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    objc_msgSend(v23, "setTitle:forState:", v25, 0);

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "leadingButton"));
    v16 = v15;
    v17 = self;
    v18 = "didTapOnCancel:";
  }
  objc_msgSend(v15, "addTarget:action:forControlEvents:", v17, v18, 64);

}

- (void)refinementViewModelDidChange
{
  void *v3;
  void *v4;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  if (MapsFeature_IsEnabled_SearchAndDiscovery(self))
  {
    v6 = 0;
    v7 = &v6;
    v8 = 0x2020000000;
    v9 = 0;
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[AllRefinementsViewModel sections](self->_viewModel, "sections"));
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100428ACC;
    v5[3] = &unk_1011B6030;
    v5[4] = self;
    v5[5] = &v6;
    objc_msgSend(v3, "enumerateObjectsUsingBlock:", v5);

    v4 = (void *)objc_claimAutoreleasedReturnValue(-[AllRefinementsViewController modalHeaderView](self, "modalHeaderView"));
    -[AllRefinementsViewController _setupTopLeadingButton:filters:](self, "_setupTopLeadingButton:filters:", v4, *((unsigned __int8 *)v7 + 24));

    _Block_object_dispose(&v6, 8);
  }
}

- (AllRefinementsViewControllerDelegate)allRefinementsDelegate
{
  return (AllRefinementsViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_allRefinementsDelegate);
}

- (void)setAllRefinementsDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_allRefinementsDelegate, a3);
}

- (AllRefinementsViewModel)viewModel
{
  return self->_viewModel;
}

- (void)setViewModel:(id)a3
{
  objc_storeStrong((id *)&self->_viewModel, a3);
}

- (AllRefinementsViewModel)copiedViewModel
{
  return self->_copiedViewModel;
}

- (void)setCopiedViewModel:(id)a3
{
  objc_storeStrong((id *)&self->_copiedViewModel, a3);
}

- (UICollectionViewLayout)collectionViewLayout
{
  return self->_collectionViewLayout;
}

- (void)setCollectionViewLayout:(id)a3
{
  objc_storeStrong((id *)&self->_collectionViewLayout, a3);
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
}

- (AllRefinementsDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (ModalCardHeaderView)modalHeaderView
{
  return self->_modalHeaderView;
}

- (void)setModalHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_modalHeaderView, a3);
}

- (NSNumber)selectionSequenceNumber
{
  return self->_selectionSequenceNumber;
}

- (void)setSelectionSequenceNumber:(id)a3
{
  objc_storeStrong((id *)&self->_selectionSequenceNumber, a3);
}

- (ResultRefinementsAnalytics)analyticsDelegate
{
  return (ResultRefinementsAnalytics *)objc_loadWeakRetained((id *)&self->_analyticsDelegate);
}

- (void)setAnalyticsDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_analyticsDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_analyticsDelegate);
  objc_storeStrong((id *)&self->_selectionSequenceNumber, 0);
  objc_storeStrong((id *)&self->_modalHeaderView, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_collectionViewLayout, 0);
  objc_storeStrong((id *)&self->_copiedViewModel, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_destroyWeak((id *)&self->_allRefinementsDelegate);
}

@end
