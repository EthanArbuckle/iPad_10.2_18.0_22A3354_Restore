@implementation NavTrafficIncidentReportSubmissionContaineeViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (NavTrafficIncidentReportSubmissionContaineeViewController)initWithItem:(id)a3 report:(id)a4
{
  id v7;
  id v8;
  NavTrafficIncidentReportSubmissionContaineeViewController *v9;
  NavTrafficIncidentReportSubmissionContaineeViewController *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)NavTrafficIncidentReportSubmissionContaineeViewController;
  v9 = -[NavTrafficIncidentReportSubmissionContaineeViewController initWithNibName:bundle:](&v15, "initWithNibName:bundle:", 0, 0);
  v10 = v9;
  if (v9)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v9, "cardPresentationController"));
    objc_msgSend(v11, "setBlurInCardView:", 0);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorNamed:](UIColor, "colorNamed:", CFSTR("NavigationMaterialColor")));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v10, "cardPresentationController"));
    objc_msgSend(v13, "setCardColor:", v12);

    objc_storeStrong((id *)&v10->_layoutItem, a3);
    objc_msgSend(v8, "submitWithCompletionHandler:", 0);
  }

  return v10;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  ContainerHeaderView *v5;
  ContainerHeaderView *headerView;
  void *v7;
  UILabel *v8;
  UILabel *primaryLabel;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  UIImageView *v15;
  UIImageView *imageView;
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
  objc_super v52;
  _QWORD v53[10];

  v52.receiver = self;
  v52.super_class = (Class)NavTrafficIncidentReportSubmissionContaineeViewController;
  -[ContaineeViewController viewDidLoad](&v52, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v3, "setPresentedModally:", 1);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v4, "setShouldHidePreviousCards:", 1);

  v5 = -[ContainerHeaderView initWithFrame:]([ContainerHeaderView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  headerView = self->_headerView;
  self->_headerView = v5;

  -[ContainerHeaderView setTranslatesAutoresizingMaskIntoConstraints:](self->_headerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[ContainerHeaderView setHairLineAlpha:](self->_headerView, "setHairLineAlpha:", 0.0);
  -[ContainerHeaderView setDelegate:](self->_headerView, "setDelegate:", self);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentReportSubmissionContaineeViewController view](self, "view"));
  objc_msgSend(v7, "addSubview:", self->_headerView);

  v8 = (UILabel *)objc_alloc_init((Class)UILabel);
  primaryLabel = self->_primaryLabel;
  self->_primaryLabel = v8;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_primaryLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Report [Nav Tray, Incident Report now]"), CFSTR("localized string not found"), 0));
  -[UILabel setText:](self->_primaryLabel, "setText:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _maps_systemFontWithFixedSize:](UIFont, "_maps_systemFontWithFixedSize:", 20.0));
  -[UILabel setFont:](self->_primaryLabel, "setFont:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  -[UILabel setTextColor:](self->_primaryLabel, "setTextColor:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentReportSubmissionContaineeViewController view](self, "view"));
  objc_msgSend(v14, "addSubview:", self->_primaryLabel);

  v15 = (UIImageView *)objc_alloc_init((Class)UIImageView);
  imageView = self->_imageView;
  self->_imageView = v15;

  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_imageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentReportSubmissionContaineeViewController view](self, "view"));
  objc_msgSend(v17, "addSubview:", self->_imageView);

  v50 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView leadingAnchor](self->_imageView, "leadingAnchor"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentReportSubmissionContaineeViewController view](self, "view"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "leadingAnchor"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "constraintEqualToAnchor:constant:", v49, 18.0));
  v53[0] = v48;
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView topAnchor](self->_imageView, "topAnchor"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentReportSubmissionContaineeViewController view](self, "view"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "topAnchor"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "constraintEqualToAnchor:constant:", v45, 20.0));
  v53[1] = v44;
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView widthAnchor](self->_imageView, "widthAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "constraintEqualToConstant:", 42.0));
  v53[2] = v42;
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView heightAnchor](self->_imageView, "heightAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToConstant:", 42.0));
  v53[3] = v40;
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView leadingAnchor](self->_headerView, "leadingAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView trailingAnchor](self->_imageView, "trailingAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintEqualToAnchor:", v38));
  v53[4] = v37;
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView trailingAnchor](self->_headerView, "trailingAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentReportSubmissionContaineeViewController view](self, "view"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "trailingAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintEqualToAnchor:", v34));
  v53[5] = v33;
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView topAnchor](self->_headerView, "topAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentReportSubmissionContaineeViewController view](self, "view"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "topAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:", v30));
  v53[6] = v29;
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_primaryLabel, "leadingAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView leadingAnchor](self->_headerView, "leadingAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:constant:", v27, 16.0));
  v53[7] = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_primaryLabel, "trailingAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentReportSubmissionContaineeViewController view](self, "view"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "trailingAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v21));
  v53[8] = v22;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_primaryLabel, "topAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView bottomAnchor](self->_headerView, "bottomAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:constant:", v24, -14.0));
  v53[9] = v25;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v53, 10));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v26);

  -[NavTrafficIncidentReportSubmissionContaineeViewController updateContent](self, "updateContent");
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NavTrafficIncidentReportSubmissionContaineeViewController;
  -[ContaineeViewController viewWillAppear:](&v4, "viewWillAppear:", a3);
  -[NavTrafficIncidentReportSubmissionContaineeViewController updateContent](self, "updateContent");
}

- (void)viewDidAppear:(BOOL)a3
{
  double Double;
  void *v5;
  void *v6;
  void *v7;
  void **v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id location;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)NavTrafficIncidentReportSubmissionContaineeViewController;
  -[NavTrafficIncidentReportSubmissionContaineeViewController viewDidAppear:](&v14, "viewDidAppear:", a3);
  objc_initWeak(&location, self);
  Double = GEOConfigGetDouble(MapsConfig_TrafficIncidentsSelectionDismissDelay, off_1014B34E8);
  v8 = _NSConcreteStackBlock;
  v9 = 3221225472;
  v10 = sub_1003A72D4;
  v11 = &unk_1011ADF20;
  objc_copyWeak(&v12, &location);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:repeats:block:](NSTimer, "scheduledTimerWithTimeInterval:repeats:block:", 0, &v8, Double));
  -[NavTrafficIncidentReportSubmissionContaineeViewController setDismissTimer:](self, "setDismissTimer:", v5, v8, v9, v10, v11);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentLayoutItem incidentTypeAsString](self->_layoutItem, "incidentTypeAsString"));
  objc_msgSend(v6, "captureUserAction:onTarget:eventValue:", 112, 0, v7);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)updateContent
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentLayoutItem preferredConfirmationTitle](self->_layoutItem, "preferredConfirmationTitle"));
  -[ContainerHeaderView setTitle:](self->_headerView, "setTitle:", v3);

  v4 = (id)objc_claimAutoreleasedReturnValue(-[TrafficIncidentLayoutItem displayImage](self->_layoutItem, "displayImage"));
  -[UIImageView setImage:](self->_imageView, "setImage:", v4);

}

- (void)headerViewButtonTapped:(id)a3 buttonType:(unint64_t)a4
{
  void *v5;
  id v6;

  -[NavTrafficIncidentReportSubmissionContaineeViewController _dismiss](self, "_dismiss", a3, a4);
  v6 = (id)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentLayoutItem incidentTypeAsString](self->_layoutItem, "incidentTypeAsString"));
  objc_msgSend(v6, "captureUserAction:onTarget:eventValue:", 4, 740, v5);

}

- (double)heightForLayout:(unint64_t)a3
{
  double v3;
  double v5;
  double v6;
  void *v7;
  double v8;

  v3 = -1.0;
  if (a3 == 5)
  {
    -[ContaineeViewController headerHeight](self, "headerHeight");
    v6 = v5 + 16.0;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    objc_msgSend(v7, "bottomSafeOffset");
    v3 = v6 + v8;

  }
  return v3;
}

- (id)headerView
{
  return self->_headerView;
}

- (void)_cancelDismissTimer
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentReportSubmissionContaineeViewController dismissTimer](self, "dismissTimer"));
  objc_msgSend(v3, "invalidate");

  -[NavTrafficIncidentReportSubmissionContaineeViewController setDismissTimer:](self, "setDismissTimer:", 0);
}

- (void)_dismiss
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentReportSubmissionContaineeViewController dismissTimer](self, "dismissTimer"));
  objc_msgSend(v3, "invalidate");

  v4 = (id)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentReportSubmissionContaineeViewController reportingDelegate](self, "reportingDelegate"));
  objc_msgSend(v4, "incidentReportSubmissionContaineeDidFinish:", self);

}

- (NavTrafficIncidentReportSubmissionContaineeDelegate)reportingDelegate
{
  return (NavTrafficIncidentReportSubmissionContaineeDelegate *)objc_loadWeakRetained((id *)&self->_reportingDelegate);
}

- (void)setReportingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_reportingDelegate, a3);
}

- (NSTimer)dismissTimer
{
  return self->_dismissTimer;
}

- (void)setDismissTimer:(id)a3
{
  objc_storeStrong((id *)&self->_dismissTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dismissTimer, 0);
  objc_destroyWeak((id *)&self->_reportingDelegate);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_primaryLabel, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_layoutItem, 0);
}

@end
