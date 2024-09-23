@implementation CarSmallWidgetNavigationModeController

- (void)_setupGuidanceCard
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarSmallWidgetNavigationModeController guidanceCard](self, "guidanceCard"));
  -[CarSmallWidgetNavigationModeController setContent:](self, "setContent:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarSmallWidgetNavigationModeController guidanceObserver](self, "guidanceObserver"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarSmallWidgetNavigationModeController guidanceCard](self, "guidanceCard"));
  objc_msgSend(v4, "addOutlet:forOwner:", v5, self);

  v7 = (id)objc_claimAutoreleasedReturnValue(-[CarSmallWidgetNavigationModeController guidanceObserver](self, "guidanceObserver"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarSmallWidgetNavigationModeController guidanceCard](self, "guidanceCard"));
  objc_msgSend(v7, "repeatAllUpdatesForOutlet:", v6);

}

- (BOOL)showsMapView
{
  return 0;
}

- (CarGuidanceCardViewController)guidanceCard
{
  CarGuidanceCardViewController *guidanceCard;
  CarGuidanceCardViewController *v4;
  CarGuidanceCardViewController *v5;

  guidanceCard = self->_guidanceCard;
  if (!guidanceCard)
  {
    v4 = -[CarGuidanceCardViewController initWithDestination:guidanceCardSizeProvider:interactionDelegate:]([CarGuidanceCardViewController alloc], "initWithDestination:guidanceCardSizeProvider:interactionDelegate:", 1, self, 0);
    v5 = self->_guidanceCard;
    self->_guidanceCard = v4;

    guidanceCard = self->_guidanceCard;
  }
  return guidanceCard;
}

- (GuidanceObserver)guidanceObserver
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "guidanceObserver"));

  return (GuidanceObserver *)v3;
}

- (void)setContent:(id)a3
{
  UIViewController *v5;
  UIViewController **p_content;
  UIViewController *content;
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
  _QWORD v43[5];

  v5 = (UIViewController *)a3;
  p_content = &self->_content;
  content = self->_content;
  if (content != v5)
  {
    if (content)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](content, "view"));
      objc_msgSend(v8, "removeFromSuperview");

    }
    objc_storeStrong((id *)&self->_content, a3);
    if (*p_content)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](*p_content, "view"));
      objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarSmallWidgetNavigationModeController view](self, "view"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](*p_content, "view"));
      objc_msgSend(v10, "addSubview:", v11);

      v42 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](*p_content, "view"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "leadingAnchor"));
      v41 = (void *)objc_claimAutoreleasedReturnValue(-[CarSmallWidgetNavigationModeController view](self, "view"));
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "safeAreaLayoutGuide"));
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "leadingAnchor"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "constraintEqualToAnchor:", v38));
      v43[0] = v37;
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](*p_content, "view"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "trailingAnchor"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[CarSmallWidgetNavigationModeController view](self, "view"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "safeAreaLayoutGuide"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "trailingAnchor"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:", v32));
      v43[1] = v31;
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](*p_content, "view"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "topAnchor"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[CarSmallWidgetNavigationModeController view](self, "view"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "safeAreaLayoutGuide"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "topAnchor"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintGreaterThanOrEqualToAnchor:", v26));
      v43[2] = v25;
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](*p_content, "view"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "bottomAnchor"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[CarSmallWidgetNavigationModeController view](self, "view"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "safeAreaLayoutGuide"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "bottomAnchor"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintLessThanOrEqualToAnchor:", v12));
      v43[3] = v13;
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](*p_content, "view"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "centerYAnchor"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[CarSmallWidgetNavigationModeController view](self, "view"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "safeAreaLayoutGuide"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "centerYAnchor"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:", v18));
      v43[4] = v19;
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v43, 5));
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v20);

    }
  }

}

- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  void *v5;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService", a3, a4));
  objc_msgSend(v5, "registerObserver:", self);

  -[CarSmallWidgetNavigationModeController _setupGuidanceCard](self, "_setupGuidanceCard");
}

- (void)resignTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  void *v5;
  void *v6;
  id v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService", a3, a4));
  objc_msgSend(v5, "unregisterObserver:", self);

  v7 = (id)objc_claimAutoreleasedReturnValue(-[CarSmallWidgetNavigationModeController guidanceObserver](self, "guidanceObserver"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarSmallWidgetNavigationModeController guidanceCard](self, "guidanceCard"));
  objc_msgSend(v7, "removeOutlet:", v6);

}

- (void)navigationService:(id)a3 didArriveAtWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5
{
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "route"));
  self->_hasArrived = objc_msgSend(v7, "isLegIndexOfLastLeg:", a5);

}

- (CGSize)availableSize
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGSize result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarSmallWidgetNavigationModeController view](self, "view"));
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarSmallWidgetNavigationModeController view](self, "view"));
  objc_msgSend(v8, "safeAreaInsets");
  v11 = v5 - (v9 + v10);
  v14 = v7 - (v12 + v13);

  v15 = v11;
  v16 = v14;
  result.height = v16;
  result.width = v15;
  return result;
}

- (unint64_t)maneuverViewLayoutType
{
  double v3;
  double v5;

  -[CarSmallWidgetNavigationModeController availableSize](self, "availableSize");
  if (v3 > 160.0)
    return 1;
  -[CarSmallWidgetNavigationModeController availableSize](self, "availableSize");
  return v5 < 100.0;
}

- (NSArray)carFocusOrderSequences
{
  return (NSArray *)&__NSArray0__struct;
}

- (ChromeViewController)chromeViewController
{
  return (ChromeViewController *)objc_loadWeakRetained((id *)&self->_chromeViewController);
}

- (void)setChromeViewController:(id)a3
{
  objc_storeWeak((id *)&self->_chromeViewController, a3);
}

- (UIViewController)content
{
  return self->_content;
}

- (void)setGuidanceCard:(id)a3
{
  objc_storeStrong((id *)&self->_guidanceCard, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_guidanceCard, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_destroyWeak((id *)&self->_chromeViewController);
}

@end
