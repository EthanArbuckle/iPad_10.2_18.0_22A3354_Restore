@implementation CarPreciseLocationOffButtonCardViewController

- (CarPreciseLocationOffButtonCardViewController)initWithDelegate:(id)a3
{
  id v4;
  CarPreciseLocationOffButtonCardViewController *v5;
  CarPreciseLocationOffButtonCardViewController *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CarPreciseLocationOffButtonCardViewController;
  v5 = -[CarPreciseLocationOffButtonCardViewController initWithNibName:bundle:](&v11, "initWithNibName:bundle:", 0, 0);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
    if (objc_msgSend(v7, "isAuthorizedForPreciseLocation"))
    {
      -[CarPreciseLocationOffButtonCardViewController setShouldBeVisible:](v6, "setShouldBeVisible:", 0);
    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
      -[CarPreciseLocationOffButtonCardViewController setShouldBeVisible:](v6, "setShouldBeVisible:", objc_msgSend(v8, "isLocationServicesApproved"));

    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v9, "addObserver:selector:name:object:", v6, "locationManagerApprovalDidChange:", MKLocationManagerApprovalDidChangeNotification, 0);

  }
  return v6;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  objc_super v25;
  void *v26;

  v25.receiver = self;
  v25.super_class = (Class)CarPreciseLocationOffButtonCardViewController;
  -[CarPreciseLocationOffButtonCardViewController viewDidLoad](&v25, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarPreciseLocationOffButtonCardViewController view](self, "view"));
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("CarPreciseLocationOffButtonCard"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("CarPlay_PreciseLocationOffButton"), CFSTR("localized string not found"), 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CarPreciseLocationOffButton preciseLocationOffButtonWithTitle:](CarPreciseLocationOffButton, "preciseLocationOffButtonWithTitle:", v5));
  -[CarPreciseLocationOffButtonCardViewController setPreciseLocationOffButton:](self, "setPreciseLocationOffButton:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarPreciseLocationOffButtonCardViewController preciseLocationOffButton](self, "preciseLocationOffButton"));
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarPreciseLocationOffButtonCardViewController preciseLocationOffButton](self, "preciseLocationOffButton"));
  objc_msgSend(v8, "addTarget:action:forControlEvents:", self, "_buttonTapped:", 64);

  v9 = objc_alloc((Class)UIStackView);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarPreciseLocationOffButtonCardViewController preciseLocationOffButton](self, "preciseLocationOffButton"));
  v26 = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v26, 1));
  v12 = objc_msgSend(v9, "initWithArrangedSubviews:", v11);
  -[CarPreciseLocationOffButtonCardViewController setButtonStack:](self, "setButtonStack:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CarPreciseLocationOffButtonCardViewController buttonStack](self, "buttonStack"));
  objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CarPreciseLocationOffButtonCardViewController buttonStack](self, "buttonStack"));
  objc_msgSend(v14, "setAxis:", 1);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CarPreciseLocationOffButtonCardViewController buttonStack](self, "buttonStack"));
  objc_msgSend(v15, "setDistribution:", 2);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CarPreciseLocationOffButtonCardViewController buttonStack](self, "buttonStack"));
  objc_msgSend(v16, "setSpacing:", 2.0);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CarPreciseLocationOffButtonCardViewController buttonStack](self, "buttonStack"));
  objc_msgSend(v17, "setAccessibilityIdentifier:", CFSTR("CarPreciseLocationOffCard"));

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CarPreciseLocationOffButtonCardViewController view](self, "view"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CarPreciseLocationOffButtonCardViewController buttonStack](self, "buttonStack"));
  objc_msgSend(v18, "addSubview:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[CarPreciseLocationOffButtonCardViewController buttonStack](self, "buttonStack"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CarPreciseLocationOffButtonCardViewController view](self, "view"));
  LODWORD(v22) = 1148846080;
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "_maps_constraintsEqualToEdgesOfView:priority:", v21, v22));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "allConstraints"));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v24);

}

- (void)setShouldBeVisible:(BOOL)a3
{
  id WeakRetained;

  if (self->_shouldBeVisible != a3)
  {
    self->_shouldBeVisible = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "preciseLocationOffButtonCard:visibilityUpdated:", self, self->_shouldBeVisible);

  }
}

- (void)_buttonTapped:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[CarPreciseLocationOffButtonCardViewController delegate](self, "delegate", a3));
  objc_msgSend(v4, "preciseLocationOffButtonCardDidSelectAction:", self);

}

- (void)locationManagerApprovalDidChange:(id)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager", a3));
  if (objc_msgSend(v5, "isAuthorizedForPreciseLocation"))
  {
    -[CarPreciseLocationOffButtonCardViewController setShouldBeVisible:](self, "setShouldBeVisible:", 0);
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
    -[CarPreciseLocationOffButtonCardViewController setShouldBeVisible:](self, "setShouldBeVisible:", objc_msgSend(v4, "isLocationServicesApproved"));

  }
}

- (id)backgroundViewForCarCardLayout:(id *)a3 scale:(double)a4 userInterfaceStyle:(int64_t)a5
{

  return 0;
}

- ($3A137947DC24AF6DB667847AA8BD3130)cornerMaskForCarCardLayout:(SEL)a3
{
  $3A137947DC24AF6DB667847AA8BD3130 *result;

  retstr->var0 = 15;
  retstr->var1 = 14.0;
  retstr->var2 = kCACornerCurveContinuous;

  return result;
}

- (NSArray)focusOrderSubItems
{
  void *v2;
  void *v3;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CarPreciseLocationOffButtonCardViewController preciseLocationOffButton](self, "preciseLocationOffButton"));
  v5 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v5, 1));

  return (NSArray *)v3;
}

- (NSArray)preferredFocusEnvironments
{
  void *v2;
  void *v3;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CarPreciseLocationOffButtonCardViewController preciseLocationOffButton](self, "preciseLocationOffButton"));
  v5 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v5, 1));

  return (NSArray *)v3;
}

- (BOOL)isTransitioning
{
  return self->_transitioning;
}

- (void)setTransitioning:(BOOL)a3
{
  self->_transitioning = a3;
}

- (BOOL)shouldBeVisible
{
  return self->_shouldBeVisible;
}

- (CarPreciseLocationOffButtonCardViewControllerDelegate)delegate
{
  return (CarPreciseLocationOffButtonCardViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CarPreciseLocationOffButton)preciseLocationOffButton
{
  return self->_preciseLocationOffButton;
}

- (void)setPreciseLocationOffButton:(id)a3
{
  objc_storeStrong((id *)&self->_preciseLocationOffButton, a3);
}

- (UIStackView)buttonStack
{
  return self->_buttonStack;
}

- (void)setButtonStack:(id)a3
{
  objc_storeStrong((id *)&self->_buttonStack, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonStack, 0);
  objc_storeStrong((id *)&self->_preciseLocationOffButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
