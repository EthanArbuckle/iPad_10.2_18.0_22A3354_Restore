@implementation ModalContaineeViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (ModalContaineeViewController)initWithChildViewController:(id)a3
{
  return -[ModalContaineeViewController initWithChildViewController:visualEffectDisabled:](self, "initWithChildViewController:visualEffectDisabled:", a3, 0);
}

- (ModalContaineeViewController)initWithChildViewController:(id)a3 visualEffectDisabled:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  ModalContaineeViewController *v8;
  _QWORD v10[4];
  id v11;

  v4 = a4;
  v6 = a3;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10041D334;
  v10[3] = &unk_1011B5AC8;
  v11 = (id)objc_claimAutoreleasedReturnValue(+[ModalCardHeaderConfiguration defaultModalCardHeaderConfiguration](ModalCardHeaderConfiguration, "defaultModalCardHeaderConfiguration"));
  v7 = v11;
  v8 = -[ModalContaineeViewController initWithChildViewController:visualEffectDisabled:headerViewConfigurationProvider:](self, "initWithChildViewController:visualEffectDisabled:headerViewConfigurationProvider:", v6, v4, v10);

  return v8;
}

- (ModalContaineeViewController)initWithChildViewController:(id)a3 visualEffectDisabled:(BOOL)a4 headerViewConfigurationProvider:(id)a5
{
  return -[ModalContaineeViewController initWithChildViewController:visualEffectDisabled:fullScreen:headerViewConfigurationProvider:](self, "initWithChildViewController:visualEffectDisabled:fullScreen:headerViewConfigurationProvider:", a3, a4, 0, a5);
}

- (ModalContaineeViewController)initWithChildViewController:(id)a3 visualEffectDisabled:(BOOL)a4 fullScreen:(BOOL)a5 headerViewConfigurationProvider:(id)a6
{
  _BOOL4 v7;
  _BOOL4 v8;
  id v11;
  id v12;
  ModalContaineeViewController *v13;
  ModalContaineeViewController *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id headerConfigurationProvider;
  objc_super v23;

  v7 = a5;
  v8 = a4;
  v11 = a3;
  v12 = a6;
  v23.receiver = self;
  v23.super_class = (Class)ModalContaineeViewController;
  v13 = -[ModalContaineeViewController initWithNibName:bundle:](&v23, "initWithNibName:bundle:", 0, 0);
  v14 = v13;
  if (v13)
  {
    if (v7)
    {
      -[ModalContaineeViewController setModalPresentationStyle:](v13, "setModalPresentationStyle:", 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v14, "cardPresentationController"));
      objc_msgSend(v15, "setWantsFullscreen:", 1);

    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v14, "cardPresentationController"));
    objc_msgSend(v16, "setPresentedModally:", 1);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v14, "cardPresentationController"));
    objc_msgSend(v17, "setTakesAvailableHeight:", 1);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v14, "cardPresentationController"));
    objc_msgSend(v18, "setBlurInCardView:", !v8);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v14, "cardPresentationController"));
    objc_msgSend(v19, "setAllowsSwipeToDismiss:", 0);

    objc_storeStrong((id *)&v14->_childVC, a3);
    v20 = objc_msgSend(v12, "copy");
    headerConfigurationProvider = v14->_headerConfigurationProvider;
    v14->_headerConfigurationProvider = v20;

  }
  return v14;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ModalContaineeViewController;
  -[ContaineeViewController viewDidLoad](&v3, "viewDidLoad");
  -[ModalContaineeViewController _setupViews](self, "_setupViews");
  -[ModalContaineeViewController _setupConstraints](self, "_setupConstraints");
}

- (void)setUseAdaptiveFont:(BOOL)a3
{
  if (self->_useAdaptiveFont != a3)
  {
    self->_useAdaptiveFont = a3;
    -[ModalCardHeaderView setUseAdaptiveFont:](self->_headerView, "setUseAdaptiveFont:");
  }
}

- (id)contentView
{
  return -[UIViewController view](self->_childVC, "view");
}

- (ModalCardHeaderView)headerView
{
  ModalCardHeaderView *headerView;
  ModalCardHeaderView *v4;
  uint64_t (**v5)(_QWORD, _QWORD, _QWORD);
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  ModalCardHeaderView *v11;
  ModalCardHeaderView *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;

  headerView = self->_headerView;
  if (!headerView)
  {
    v4 = [ModalCardHeaderView alloc];
    v5 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[ModalContaineeViewController headerConfigurationProvider](self, "headerConfigurationProvider"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    v7 = objc_msgSend(v6, "containerStyle");
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ModalContaineeViewController traitCollection](self, "traitCollection"));
    v9 = ((uint64_t (**)(_QWORD, id, void *))v5)[2](v5, v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = -[ModalCardHeaderView initWithConfiguration:](v4, "initWithConfiguration:", v10);
    v12 = self->_headerView;
    self->_headerView = v11;

    -[ModalCardHeaderView setTranslatesAutoresizingMaskIntoConstraints:](self->_headerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[ModalCardHeaderView setUseAdaptiveFont:](self->_headerView, "setUseAdaptiveFont:", self->_useAdaptiveFont);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ModalCardHeaderView titleLabel](self->_headerView, "titleLabel"));
    objc_msgSend(v13, "setTextAlignment:", 4);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ModalCardHeaderView leadingButton](self->_headerView, "leadingButton"));
    objc_msgSend(v14, "setHidden:", 1);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[ModalCardHeaderView trailingButton](self->_headerView, "trailingButton"));
    v16 = sub_1009A992C();
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    objc_msgSend(v15, "setTitle:forState:", v17, 0);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[ModalCardHeaderView trailingButton](self->_headerView, "trailingButton"));
    objc_msgSend(v18, "addTarget:action:forControlEvents:", self, "headerViewCloseTapped:", 64);

    headerView = self->_headerView;
  }
  return headerView;
}

- (void)_setupViews
{
  void *v3;
  unsigned __int8 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  if (!-[ContainerViewController delaysFirstCardPresentation]_0()
    || (v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController")),
        v4 = objc_msgSend(v3, "wantsFullscreen"),
        v3,
        (v4 & 1) == 0))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ModalContaineeViewController view](self, "view"));
    objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  }
  if (self->_childVC)
  {
    -[ModalContaineeViewController addChildViewController:](self, "addChildViewController:");
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](self->_childVC, "view"));
    objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ModalContaineeViewController view](self, "view"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](self->_childVC, "view"));
    objc_msgSend(v7, "addSubview:", v8);

    -[UIViewController didMoveToParentViewController:](self->_childVC, "didMoveToParentViewController:", self);
  }
  v10 = (id)objc_claimAutoreleasedReturnValue(-[ModalContaineeViewController view](self, "view"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ModalContaineeViewController headerView](self, "headerView"));
  objc_msgSend(v10, "addSubview:", v9);

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
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  _QWORD v40[7];

  v39 = (void *)objc_claimAutoreleasedReturnValue(-[ModalContaineeViewController headerView](self, "headerView"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "topAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[ModalContaineeViewController view](self, "view"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "safeAreaLayoutGuide"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "topAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToAnchor:", v35));
  v40[0] = v34;
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[ModalContaineeViewController headerView](self, "headerView"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "bottomAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](self->_childVC, "view"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "topAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:", v30));
  v40[1] = v29;
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[ModalContaineeViewController headerView](self, "headerView"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "leadingAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[ModalContaineeViewController view](self, "view"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "leadingAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:", v25));
  v40[2] = v24;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[ModalContaineeViewController headerView](self, "headerView"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "trailingAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[ModalContaineeViewController view](self, "view"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "trailingAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v20));
  v40[3] = v19;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](self->_childVC, "view"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "leadingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[ModalContaineeViewController view](self, "view"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "leadingAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v15));
  v40[4] = v14;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](self->_childVC, "view"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "trailingAnchor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ModalContaineeViewController view](self, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "trailingAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "constraintEqualToAnchor:", v5));
  v40[5] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](self->_childVC, "view"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bottomAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ModalContaineeViewController view](self, "view"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bottomAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v10));
  v40[6] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v40, 7));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v12);

}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v6;
  uint64_t (**v7)(_QWORD, _QWORD, _QWORD);
  void *v8;
  uint64_t v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)ModalContaineeViewController;
  v6 = a3;
  -[ModalContaineeViewController willTransitionToTraitCollection:withTransitionCoordinator:](&v11, "willTransitionToTraitCollection:withTransitionCoordinator:", v6, a4);
  v7 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[ModalContaineeViewController headerConfigurationProvider](self, "headerConfigurationProvider", v11.receiver, v11.super_class));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  v9 = ((uint64_t (**)(_QWORD, id, id))v7)[2](v7, objc_msgSend(v8, "containerStyle"), v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  -[ModalCardHeaderView setConfiguration:](self->_headerView, "setConfiguration:", v10);
}

- (void)handleDismissAction:(id)a3
{
  -[ModalContaineeViewController headerViewCloseTapped:](self, "headerViewCloseTapped:", a3);
}

- (void)willChangeContainerStyle:(unint64_t)a3
{
  uint64_t (**v5)(_QWORD, _QWORD, _QWORD);
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ModalContaineeViewController;
  -[ContaineeViewController willChangeContainerStyle:](&v9, "willChangeContainerStyle:");
  v5 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[ModalContaineeViewController headerConfigurationProvider](self, "headerConfigurationProvider"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ModalContaineeViewController traitCollection](self, "traitCollection"));
  v7 = ((uint64_t (**)(_QWORD, unint64_t, void *))v5)[2](v5, a3, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  -[ModalCardHeaderView setConfiguration:](self->_headerView, "setConfiguration:", v8);

}

- (double)heightForLayout:(unint64_t)a3
{
  double v3;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;

  v3 = -1.0;
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ModalContaineeViewController childHeightProvider](self, "childHeightProvider"));

    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[ModalContaineeViewController childHeightProvider](self, "childHeightProvider"));
      objc_msgSend(v6, "fittingHeight");
      v8 = v7;
      -[ContaineeViewController headerHeight](self, "headerHeight");
      v3 = v8 + v9;
    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
      objc_msgSend(v6, "availableHeight");
      v3 = v10;
    }

  }
  return v3;
}

- (void)shoulDismissForVerticalSwipe_nonUIKitCardsOnly
{
  -[ModalContaineeViewController _dismissContainee](self, "_dismissContainee");
}

- (void)_dismissContainee
{
  void *v3;
  void *v4;
  void *v5;
  void (**v6)(void);

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v3, "dismiss:", 1);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ModalContaineeViewController blockAlongDismissContainee](self, "blockAlongDismissContainee"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ModalContaineeViewController blockAlongDismissContainee](self, "blockAlongDismissContainee"));
    v6 = (void (**)(void))objc_msgSend(v5, "copy");

    -[ModalContaineeViewController setBlockAlongDismissContainee:](self, "setBlockAlongDismissContainee:", 0);
    v6[2]();

  }
}

- (void)headerViewCloseTapped:(id)a3
{
  -[ModalContaineeViewController _dismissContainee](self, "_dismissContainee", a3);
}

- (unint64_t)maxLayoutForEdgeInsetsUpdate
{
  return 2;
}

- (UIViewController)childVC
{
  return self->_childVC;
}

- (id)blockAlongDismissContainee
{
  return self->_blockAlongDismissContainee;
}

- (void)setBlockAlongDismissContainee:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (HeightProviding)childHeightProvider
{
  return (HeightProviding *)objc_loadWeakRetained((id *)&self->_childHeightProvider);
}

- (void)setChildHeightProvider:(id)a3
{
  objc_storeWeak((id *)&self->_childHeightProvider, a3);
}

- (BOOL)useAdaptiveFont
{
  return self->_useAdaptiveFont;
}

- (id)headerConfigurationProvider
{
  return self->_headerConfigurationProvider;
}

- (void)setHeaderConfigurationProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_headerConfigurationProvider, 0);
  objc_destroyWeak((id *)&self->_childHeightProvider);
  objc_storeStrong(&self->_blockAlongDismissContainee, 0);
  objc_storeStrong((id *)&self->_childVC, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
}

@end
