@implementation RAPDirectionsReportContaineeViewController

- (RAPDirectionsReportContaineeViewController)initWithReport:(id)a3 directionsReportContext:(unint64_t)a4
{
  id v7;
  RAPDirectionsReportContaineeViewController *v8;
  RAPDirectionsReportContaineeViewController *v9;
  id *p_report;
  unint64_t context;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  UIViewController *v16;
  id v17;
  UIViewController *contentViewController;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  RAPReport *report;
  RAPDirectionsReportContaineeViewController *v29;
  RAPRouteListViewController *v30;
  objc_super v32;
  uint8_t buf[4];
  RAPReport *v34;

  v7 = a3;
  if (a4)
    goto LABEL_2;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReport _context](self->_report, "_context"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "directionsHistory"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "firstObject"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "recording"));

  if (!v25)
  {
LABEL_2:
    v32.receiver = self;
    v32.super_class = (Class)RAPDirectionsReportContaineeViewController;
    v8 = -[RAPDirectionsReportContaineeViewController init](&v32, "init");
    v9 = v8;
    if (!v8)
    {
LABEL_13:
      self = v9;
      v29 = self;
      goto LABEL_14;
    }
    v8->_context = a4;
    p_report = (id *)&v8->_report;
    objc_storeStrong((id *)&v8->_report, a3);
    context = v9->_context;
    if (context == 1)
    {
      v30 = -[RAPRouteListViewController initWithReport:delegate:]([RAPRouteListViewController alloc], "initWithReport:delegate:", *p_report, v9);
      contentViewController = v9->_contentViewController;
      v9->_contentViewController = &v30->super;
    }
    else
    {
      if (context)
      {
LABEL_12:
        -[ContaineeViewController setKeepOriginalSafeInsets:](v9, "setKeepOriginalSafeInsets:", 1);
        goto LABEL_13;
      }
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*p_report, "_context"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "directionsHistory"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "firstObject"));
      v15 = objc_claimAutoreleasedReturnValue(-[RAPDirectionsReportContaineeViewController _routeFeedbackViewControllerForRequest:](v9, "_routeFeedbackViewControllerForRequest:", v14));
      v16 = v9->_contentViewController;
      v9->_contentViewController = (UIViewController *)v15;

      v17 = objc_alloc((Class)UIBarButtonItem);
      contentViewController = (UIViewController *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController localizedStringForKey:value:table:](contentViewController, "localizedStringForKey:value:table:", CFSTR("[RAP Navigation] Cancel"), CFSTR("localized string not found"), 0));
      v20 = objc_msgSend(v17, "initWithTitle:style:target:action:", v19, 0, v9, "_cancelButtonPressed:");
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController navigationItem](v9->_contentViewController, "navigationItem"));
      objc_msgSend(v21, "setLeftBarButtonItem:", v20);

    }
    goto LABEL_12;
  }
  v26 = sub_100431F8C();
  v27 = objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
  {
    report = self->_report;
    *(_DWORD *)buf = 138412290;
    v34 = report;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_FAULT, "Tried to present RAPDirectionsReportContaineeVC, but didn't have a route in the report: %@", buf, 0xCu);
  }

  v29 = 0;
LABEL_14:

  return v29;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RAPDirectionsReportContaineeViewController;
  -[ContaineeViewController viewDidLoad](&v3, "viewDidLoad");
  -[RAPDirectionsReportContaineeViewController _setupViews](self, "_setupViews");
  -[RAPDirectionsReportContaineeViewController _setupConstraints](self, "_setupConstraints");
}

- (void)_setupViews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  UINavigationController *v7;
  void *v8;
  void *v9;
  void *v10;
  UINavigationController *navController;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v3, "setPresentedModally:", 1);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v4, "setTakesAvailableHeight:", 1);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v5, "setAllowsSwipeToDismiss:", 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v6, "setDefaultContaineeLayout:", 5);

  v7 = (UINavigationController *)objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", self->_contentViewController);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController view](v7, "view"));
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[RAPDirectionsReportContaineeViewController addChildViewController:](self, "addChildViewController:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RAPDirectionsReportContaineeViewController view](self, "view"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController view](v7, "view"));
  objc_msgSend(v9, "addSubview:", v10);

  -[UINavigationController didMoveToParentViewController:](v7, "didMoveToParentViewController:", self);
  navController = self->_navController;
  self->_navController = v7;

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
  _QWORD v24[4];

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController view](self->_navController, "view"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "topAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[RAPDirectionsReportContaineeViewController view](self, "view"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "topAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v20));
  v24[0] = v19;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController view](self->_navController, "view"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "leadingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[RAPDirectionsReportContaineeViewController view](self, "view"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "leadingAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v15));
  v24[1] = v14;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController view](self->_navController, "view"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "trailingAnchor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RAPDirectionsReportContaineeViewController view](self, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "trailingAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "constraintEqualToAnchor:", v5));
  v24[2] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController view](self->_navController, "view"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bottomAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RAPDirectionsReportContaineeViewController view](self, "view"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bottomAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v10));
  v24[3] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v24, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v12);

}

- (id)_routeFeedbackViewControllerForRequest:(id)a3
{
  void *v4;
  void *v5;
  RAPWebBundleQuestion *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  RAPRouteFeedbackViewController *v11;
  void *v12;
  void *v13;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "recording"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReport initialQuestion](self->_report, "initialQuestion"));

  if (!v5)
  {
    v6 = -[RAPWebBundleQuestion initWithReport:directionsRecording:]([RAPWebBundleQuestion alloc], "initWithReport:directionsRecording:", self->_report, v4);
    -[RAPReport setInitialQuestion:](self->_report, "setInitialQuestion:", v6);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReport initialQuestion](self->_report, "initialQuestion"));
  v8 = objc_opt_class(RAPWebBundleQuestion);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
    v9 = v7;
  else
    v9 = 0;
  v10 = v9;

  objc_msgSend(v10, "setDirectionsRecording:", v4);
  v11 = -[RAPRouteFeedbackViewController initWithReport:recording:delegate:]([RAPRouteFeedbackViewController alloc], "initWithReport:recording:delegate:", self->_report, v4, self);
  -[RAPRouteFeedbackViewController setAllowsScrolling:](v11, "setAllowsScrolling:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGroupedBackgroundColor](UIColor, "systemGroupedBackgroundColor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RAPRouteFeedbackViewController view](v11, "view"));
  objc_msgSend(v13, "setBackgroundColor:", v12);

  return v11;
}

- (void)_cancelButtonPressed:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  uint8_t v10[16];

  v4 = a3;
  v5 = sub_100431F8C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "_cancelButtonPressed: will dismiss directionsReportContaineeVC", v10, 2u);
  }

  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 10109, 31, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  v8 = objc_msgSend(v7, "usingSheetPresentation");

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController containeeDelegate](self, "containeeDelegate"));
    objc_msgSend(v9, "containeeViewControllerGoToPreviousState:withSender:", self, v4);

  }
  else
  {
    -[RAPDirectionsReportContaineeViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  }

}

- (void)routeFeedbackViewControllerDidDismiss:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  uint8_t v9[16];

  v4 = sub_100431F8C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "routeFeedbackViewControllerDidDismiss: will dismiss the card", v9, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  v7 = objc_msgSend(v6, "usingSheetPresentation");

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController containeeDelegate](self, "containeeDelegate"));
    objc_msgSend(v8, "containeeViewControllerGoToPreviousState:withSender:", self, 0);

  }
  else
  {
    -[RAPDirectionsReportContaineeViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  }
}

- (double)heightForLayout:(unint64_t)a3
{
  void *v3;
  double v4;
  double v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController", a3));
  objc_msgSend(v3, "availableHeight");
  v5 = v4;

  return v5;
}

- (void)rapRouteListViewControllerDidDismiss:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  uint8_t v9[16];

  v4 = sub_100431F8C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "rapRouteListViewControllerDidDismiss: will dismiss directionsReportContaineeVC", v9, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  v7 = objc_msgSend(v6, "usingSheetPresentation");

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController containeeDelegate](self, "containeeDelegate"));
    objc_msgSend(v8, "containeeViewControllerGoToPreviousState:withSender:", self, 0);

  }
  else
  {
    -[RAPDirectionsReportContaineeViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  }
}

- (void)rapRouteListViewController:(id)a3 didSelectRequest:(id)a4
{
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[RAPDirectionsReportContaineeViewController _routeFeedbackViewControllerForRequest:](self, "_routeFeedbackViewControllerForRequest:", a4));
  -[UINavigationController pushViewController:animated:](self->_navController, "pushViewController:animated:", v5, 1);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navController, 0);
  objc_storeStrong((id *)&self->_contentViewController, 0);
  objc_storeStrong((id *)&self->_report, 0);
}

@end
