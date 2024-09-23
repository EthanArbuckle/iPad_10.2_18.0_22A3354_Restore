@implementation FlyoverTrayContaineeViewController

- (FlyoverTrayContaineeViewController)initWithMapItem:(id)a3
{
  id v5;
  FlyoverTrayContaineeViewController *v6;
  FlyoverTrayContaineeViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FlyoverTrayContaineeViewController;
  v6 = -[FlyoverTrayContaineeViewController initWithNibName:bundle:](&v9, "initWithNibName:bundle:", 0, 0);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_mapItem, a3);

  return v7;
}

- (void)resetFlyoverTour
{
  unsigned int v3;
  unint64_t v4;
  id WeakRetained;

  -[BackgroundColorButton setTitle:forState:](self->_tourButton, "setTitle:forState:", self->_startTourTitle, 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v3 = objc_msgSend(WeakRetained, "isFlyoverUnificationEnabled");
  v4 = 1;
  if (v3)
    v4 = 2;
  self->_tourButtonState = v4;

}

- (void)viewDidLoad
{
  id WeakRetained;
  unsigned __int8 v4;
  uint64_t v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FlyoverTrayContaineeViewController;
  -[ContaineeViewController viewDidLoad](&v7, "viewDidLoad");
  WeakRetained = (id)objc_claimAutoreleasedReturnValue(+[VKPlatform sharedPlatform](VKPlatform, "sharedPlatform"));
  v4 = objc_msgSend(WeakRetained, "supportsARMode");

  if ((v4 & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v5 = objc_msgSend(WeakRetained, "isFlyoverUnificationEnabled") ^ 1;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v6, "setPresentedModally:", v5);

  if ((v4 & 1) == 0)
  -[FlyoverTrayContaineeViewController _setupViews](self, "_setupViews");
  -[FlyoverTrayContaineeViewController _setupConstraints](self, "_setupConstraints");
}

- (void)_setupViews
{
  void *v3;
  void *v4;
  FlyoverTrayHeader *v5;
  double y;
  double width;
  double height;
  FlyoverTrayHeader *v9;
  FlyoverTrayHeader *headerView;
  FlyoverTrayHeader *v11;
  void *v12;
  void *v13;
  id WeakRetained;
  unsigned __int8 v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  unsigned int v21;
  UIView *v22;
  UIView *panelView;
  void *v24;
  BackgroundColorButton *v25;
  BackgroundColorButton *tourButton;
  void *v27;
  void *v28;
  id v29;
  unsigned __int8 v30;
  void *v31;
  void *v32;
  uint64_t *v33;
  unint64_t v34;
  id v35;
  id v36;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverTrayContaineeViewController view](self, "view"));
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverTrayContaineeViewController view](self, "view"));
  objc_msgSend(v4, "setAccessibilityIdentifier:", CFSTR("FlyoverTray"));

  v5 = [FlyoverTrayHeader alloc];
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v9 = -[FlyoverTrayHeader initWithFrame:](v5, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  headerView = self->_headerView;
  self->_headerView = v9;

  -[FlyoverTrayHeader setDelegate:](self->_headerView, "setDelegate:", self);
  -[FlyoverTrayHeader setTranslatesAutoresizingMaskIntoConstraints:](self->_headerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v11 = self->_headerView;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem name](self->_mapItem, "name"));
  -[FlyoverTrayHeader setTitle:](v11, "setTitle:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[VKPlatform sharedPlatform](VKPlatform, "sharedPlatform"));
  if ((objc_msgSend(v13, "supportsARMode") & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v15 = objc_msgSend(WeakRetained, "isFlyoverUnificationEnabled");

    if ((v15 & 1) == 0)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v17 = v16;
      v18 = CFSTR("Flyover [Minimized Card Subtitle]");
      goto LABEL_6;
    }
  }
  else
  {

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v17 = v16;
  v18 = CFSTR("Flyover Tour [Minimized Card Subtitle]");
LABEL_6:
  v36 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", v18, CFSTR("localized string not found"), 0));

  -[FlyoverTrayHeader setSubtitle:](self->_headerView, "setSubtitle:", v36);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverTrayContaineeViewController view](self, "view"));
  objc_msgSend(v19, "addSubview:", self->_headerView);

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[VKPlatform sharedPlatform](VKPlatform, "sharedPlatform"));
  v21 = objc_msgSend(v20, "supportsARMode");

  if (v21)
  {
    v22 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    panelView = self->_panelView;
    self->_panelView = v22;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_panelView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView setAccessibilityIdentifier:](self->_panelView, "setAccessibilityIdentifier:", CFSTR("FlyoverTrayPanel"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverTrayContaineeViewController view](self, "view"));
    objc_msgSend(v24, "addSubview:", self->_panelView);

    if (-[MKMapItem _hasFlyover](self->_mapItem, "_hasFlyover"))
    {
      v25 = (BackgroundColorButton *)objc_claimAutoreleasedReturnValue(+[BackgroundColorButton buttonWithType:](BackgroundColorButton, "buttonWithType:", 0));
      tourButton = self->_tourButton;
      self->_tourButton = v25;

      -[BackgroundColorButton setContentEdgeInsets:](self->_tourButton, "setContentEdgeInsets:", 0.0, 17.0, 0.0, 17.0);
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[BackgroundColorButton layer](self->_tourButton, "layer"));
      objc_msgSend(v27, "setCornerRadius:", 8.0);

      -[BackgroundColorButton setTranslatesAutoresizingMaskIntoConstraints:](self->_tourButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[BackgroundColorButton titleLabel](self->_tourButton, "titleLabel"));
      +[DynamicTypeWizard autorefreshLabel:withFontProvider:](DynamicTypeWizard, "autorefreshLabel:withFontProvider:", v28, &stru_1011AFBE8);

      -[BackgroundColorButton addTarget:action:forControlEvents:](self->_tourButton, "addTarget:action:forControlEvents:", self, "tourButtonTapped:", 64);
      if (qword_1014D1FC0 != -1)
        dispatch_once(&qword_1014D1FC0, &stru_1011AFC08);
      v29 = objc_loadWeakRetained((id *)&self->_delegate);
      v30 = objc_msgSend(v29, "isFlyoverUnificationEnabled");

      v31 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem _firstLocalizedCategoryName](self->_mapItem, "_firstLocalizedCategoryName"));
      v32 = v31;
      if ((v30 & 1) != 0)
      {
        v33 = &qword_1014D1FA8;
        v34 = 2;
      }
      else
      {
        if (v31)
        {
          v35 = objc_msgSend(v31, "length");
          v33 = &qword_1014D1FB0;
          if (!v35)
            v33 = &qword_1014D1FB8;
        }
        else
        {
          v33 = &qword_1014D1FB8;
        }
        v34 = 1;
      }
      objc_storeStrong((id *)&self->_startTourTitle, (id)*v33);
      -[BackgroundColorButton setTitle:forState:](self->_tourButton, "setTitle:forState:", self->_startTourTitle, 0);
      -[BackgroundColorButton setAccessibilityIdentifier:](self->_tourButton, "setAccessibilityIdentifier:", CFSTR("FlyoverTrayTourButton"));
      -[UIView addSubview:](self->_panelView, "addSubview:", self->_tourButton);
      self->_tourButtonState = v34;

    }
    -[FlyoverTrayContaineeViewController updateTheme](self, "updateTheme");
  }

}

- (void)_setupConstraints
{
  void *v3;
  unsigned __int8 v4;
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
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  void *v66;
  _QWORD v67[4];
  _QWORD v68[7];
  _QWORD v69[4];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[VKPlatform sharedPlatform](VKPlatform, "sharedPlatform"));
  v4 = objc_msgSend(v3, "supportsARMode");

  if ((v4 & 1) != 0)
  {
    v59 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverTrayHeader topAnchor](self->_headerView, "topAnchor"));
    v62 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverTrayContaineeViewController view](self, "view"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "topAnchor"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "constraintEqualToAnchor:", v56));
    v68[0] = v53;
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverTrayHeader leadingAnchor](self->_headerView, "leadingAnchor"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverTrayContaineeViewController view](self, "view"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "leadingAnchor"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "constraintEqualToAnchor:", v47));
    v68[1] = v46;
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverTrayHeader trailingAnchor](self->_headerView, "trailingAnchor"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverTrayContaineeViewController view](self, "view"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "trailingAnchor"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "constraintEqualToAnchor:", v43));
    v68[2] = v42;
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverTrayHeader bottomAnchor](self->_headerView, "bottomAnchor"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_panelView, "topAnchor"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToAnchor:", v40));
    v68[3] = v39;
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_panelView, "leadingAnchor"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverTrayContaineeViewController view](self, "view"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "leadingAnchor"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToAnchor:", v36));
    v68[4] = v35;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_panelView, "trailingAnchor"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverTrayContaineeViewController view](self, "view"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "trailingAnchor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToAnchor:", v7));
    v68[5] = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_panelView, "bottomAnchor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverTrayContaineeViewController view](self, "view"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bottomAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:", v11));
    v68[6] = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v68, 7));
    v65 = objc_msgSend(v13, "mutableCopy");

    if (-[MKMapItem _hasFlyover](self->_mapItem, "_hasFlyover"))
    {
      v63 = (void *)objc_claimAutoreleasedReturnValue(-[BackgroundColorButton leadingAnchor](self->_tourButton, "leadingAnchor"));
      v60 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_panelView, "leadingAnchor"));
      v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "constraintEqualToAnchor:constant:", v60, 16.0));
      v67[0] = v57;
      v54 = (void *)objc_claimAutoreleasedReturnValue(-[BackgroundColorButton trailingAnchor](self->_tourButton, "trailingAnchor"));
      v51 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_panelView, "trailingAnchor"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "constraintEqualToAnchor:constant:", v51, -16.0));
      v67[1] = v14;
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[BackgroundColorButton heightAnchor](self->_tourButton, "heightAnchor"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintGreaterThanOrEqualToConstant:", 52.0));
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[DynamicTypeWizard autoscaledConstraint:constant:withFontProvider:](DynamicTypeWizard, "autoscaledConstraint:constant:withFontProvider:", v16, &stru_1011AFBE8, 52.0));
      v67[2] = v17;
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[BackgroundColorButton titleLabel](self->_tourButton, "titleLabel"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "firstBaselineAnchor"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_panelView, "topAnchor"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v20));
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[DynamicTypeWizard autoscaledConstraint:constant:withFontProvider:](DynamicTypeWizard, "autoscaledConstraint:constant:withFontProvider:", v21, &stru_1011AFBE8, 32.0));
      v67[3] = v22;
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v67, 4));
      objc_msgSend(v65, "addObjectsFromArray:", v23);

    }
    v24 = v65;
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v65);
  }
  else
  {
    v66 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverTrayHeader topAnchor](self->_headerView, "topAnchor"));
    v64 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverTrayContaineeViewController view](self, "view"));
    v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "topAnchor"));
    v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "constraintEqualToAnchor:", v61));
    v69[0] = v58;
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverTrayHeader leadingAnchor](self->_headerView, "leadingAnchor"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverTrayContaineeViewController view](self, "view"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "leadingAnchor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "constraintEqualToAnchor:", v49));
    v69[1] = v25;
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverTrayHeader trailingAnchor](self->_headerView, "trailingAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverTrayContaineeViewController view](self, "view"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "trailingAnchor"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:", v28));
    v69[2] = v29;
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverTrayHeader bottomAnchor](self->_headerView, "bottomAnchor"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverTrayContaineeViewController view](self, "view"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "bottomAnchor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:", v32));
    v69[3] = v33;
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v69, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v34);

    v24 = v66;
  }

}

- (void)updateTheme
{
  BackgroundColorButton *tourButton;
  void *v4;
  void *v5;
  BackgroundColorButton *v6;
  void *v7;
  void *v8;
  BackgroundColorButton *v9;
  void *v10;
  void *v11;
  BackgroundColorButton *v12;
  void *v13;
  id v14;

  if (-[MKMapItem _hasFlyover](self->_mapItem, "_hasFlyover"))
  {
    tourButton = self->_tourButton;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverTrayContaineeViewController theme](self, "theme"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "flyoverTourButtonBackgroundColor:", 0));
    -[BackgroundColorButton setBackgroundColor:forState:](tourButton, "setBackgroundColor:forState:", v5, 0);

    v6 = self->_tourButton;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverTrayContaineeViewController theme](self, "theme"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "flyoverTourButtonBackgroundColor:", 1));
    -[BackgroundColorButton setBackgroundColor:forState:](v6, "setBackgroundColor:forState:", v8, 1);

    v9 = self->_tourButton;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverTrayContaineeViewController theme](self, "theme"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "keyColor"));
    -[BackgroundColorButton setTitleColor:forState:](v9, "setTitleColor:forState:", v11, 0);

    v12 = self->_tourButton;
    v14 = (id)objc_claimAutoreleasedReturnValue(-[FlyoverTrayContaineeViewController theme](self, "theme"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "darkKeyColor"));
    -[BackgroundColorButton setTitleColor:forState:](v12, "setTitleColor:forState:", v13, 1);

  }
}

- (void)tourButtonTapped:(id)a3
{
  id v4;
  unint64_t tourButtonState;
  id WeakRetained;
  id v7;
  id v8;

  v4 = a3;
  if (qword_1014D1FD8 != -1)
  {
    v8 = v4;
    dispatch_once(&qword_1014D1FD8, &stru_1011AFC28);
    v4 = v8;
  }
  tourButtonState = self->_tourButtonState;
  switch(tourButtonState)
  {
    case 3uLL:
      v7 = v4;
      -[BackgroundColorButton setTitle:forState:](self->_tourButton, "setTitle:forState:", qword_1014D1FC8, 0);
      self->_tourButtonState = 2;
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "flyoverTourResume");
      goto LABEL_9;
    case 2uLL:
      v7 = v4;
      -[BackgroundColorButton setTitle:forState:](self->_tourButton, "setTitle:forState:", qword_1014D1FD0, 0);
      self->_tourButtonState = 3;
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "flyoverTourPause");
      goto LABEL_9;
    case 1uLL:
      v7 = v4;
      -[BackgroundColorButton setTitle:forState:](self->_tourButton, "setTitle:forState:", qword_1014D1FC8, 0);
      self->_tourButtonState = 2;
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "flyoverTourPlay");
LABEL_9:

      v4 = v7;
      break;
  }

}

- (void)trayHeaderButtonDidTouchUpInside:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverTrayContaineeViewController delegate](self, "delegate", a3));
  objc_msgSend(v4, "viewControllerEndFlyover:", self);

  v6 = (id)objc_claimAutoreleasedReturnValue(-[FlyoverTrayContaineeViewController delegate](self, "delegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "appCoordinator"));
  objc_msgSend(v5, "exitFlyover");

}

- (void)trayHeaderDidReceiveTap
{
  void *v3;
  id WeakRetained;
  unsigned int v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[VKPlatform sharedPlatform](VKPlatform, "sharedPlatform"));
  if (objc_msgSend(v3, "supportsARMode"))
  {

  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v5 = objc_msgSend(WeakRetained, "isFlyoverUnificationEnabled");

    if (!v5)
      return;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  v7 = objc_msgSend(v6, "containeeLayout");

  if (v7 == (id)1)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    v10 = v8;
    v9 = 2;
    goto LABEL_9;
  }
  if (v7 == (id)2)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    v10 = v8;
    v9 = 1;
LABEL_9:
    objc_msgSend(v8, "wantsLayout:", v9);

  }
}

- (FlyoverTrayHeader)headerView
{
  return self->_headerView;
}

- (id)contentView
{
  return self->_tourButton;
}

- (double)heightForLayout:(unint64_t)a3
{
  void *v5;
  double v6;
  double v7;
  double result;
  BackgroundColorButton *tourButton;
  double v10;
  double v11;
  double v12;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v5, "bottomSafeOffset");
  v7 = v6;

  if (a3 == 1)
  {
LABEL_8:
    -[ContaineeViewController headerHeight](self, "headerHeight");
    return v7 + v12;
  }
  if (a3 == 5 || (result = -1.0, a3 == 2))
  {
    tourButton = self->_tourButton;
    if (tourButton)
    {
      -[BackgroundColorButton systemLayoutSizeFittingSize:](tourButton, "systemLayoutSizeFittingSize:", CGSizeZero.width, CGSizeZero.height);
      v11 = v10 + 15.0;
    }
    else
    {
      v11 = 15.0;
    }
    v7 = v7 + v11;
    goto LABEL_8;
  }
  return result;
}

- (FlyoverActionCoordination)delegate
{
  return (FlyoverActionCoordination *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_headerView, a3);
}

- (UIView)panelView
{
  return self->_panelView;
}

- (void)setPanelView:(id)a3
{
  objc_storeStrong((id *)&self->_panelView, a3);
}

- (BackgroundColorButton)tourButton
{
  return self->_tourButton;
}

- (void)setTourButton:(id)a3
{
  objc_storeStrong((id *)&self->_tourButton, a3);
}

- (unint64_t)tourButtonState
{
  return self->_tourButtonState;
}

- (void)setTourButtonState:(unint64_t)a3
{
  self->_tourButtonState = a3;
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (void)setMapItem:(id)a3
{
  objc_storeStrong((id *)&self->_mapItem, a3);
}

- (NSString)startTourTitle
{
  return self->_startTourTitle;
}

- (void)setStartTourTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startTourTitle, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_tourButton, 0);
  objc_storeStrong((id *)&self->_panelView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
