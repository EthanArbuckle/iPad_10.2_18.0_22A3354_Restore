@implementation MapsSaveRouteOfflineDownloadView

- (MapsSaveRouteOfflineDownloadView)initWithRegion:(id)a3 existingSubscription:(id)a4
{
  id v7;
  id v8;
  MapsSaveRouteOfflineDownloadView *v9;
  MapsSaveRouteOfflineDownloadView *v10;
  MapsSaveRouteOfflineDownloadView *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MapsSaveRouteOfflineDownloadView;
  v9 = -[MapsSaveRouteOfflineDownloadView init](&v13, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_region, a3);
    objc_storeStrong((id *)&v10->_existingSubscription, a4);
    -[MapsSaveRouteOfflineDownloadView _setupSubviews](v10, "_setupSubviews");
    -[MapsSaveRouteOfflineDownloadView _setupConstraints](v10, "_setupConstraints");
    -[MapsSaveRouteOfflineDownloadView _determineOfflineRegionInfo](v10, "_determineOfflineRegionInfo");
    v11 = v10;
  }

  return v10;
}

- (void)_setupSubviews
{
  TwoLinesContentView *v3;
  TwoLinesContentView *offlineDownloadView;
  UISwitch *v5;
  UISwitch *v6;
  UIImageView *v7;
  UIImageView *trailingImageView;
  void *v9;
  double v10;
  double v11;

  v3 = objc_alloc_init(TwoLinesContentView);
  offlineDownloadView = self->_offlineDownloadView;
  self->_offlineDownloadView = v3;

  -[TwoLinesContentView setTranslatesAutoresizingMaskIntoConstraints:](self->_offlineDownloadView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MapsSaveRouteOfflineDownloadView addSubview:](self, "addSubview:", self->_offlineDownloadView);
  v5 = (UISwitch *)objc_msgSend(objc_alloc((Class)UISwitch), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v6 = self->_switch;
  self->_switch = v5;

  -[UISwitch setOn:](self->_switch, "setOn:", 0);
  -[UISwitch sizeToFit](self->_switch, "sizeToFit");
  -[UISwitch setAccessibilityIdentifier:](self->_switch, "setAccessibilityIdentifier:", CFSTR("DownloadMapSwitch"));
  -[UISwitch setTranslatesAutoresizingMaskIntoConstraints:](self->_switch, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UISwitch setHidden:](self->_switch, "setHidden:", 1);
  -[MapsSaveRouteOfflineDownloadView addSubview:](self, "addSubview:", self->_switch);
  v7 = (UIImageView *)objc_alloc_init((Class)UIImageView);
  trailingImageView = self->_trailingImageView;
  self->_trailingImageView = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:", 5, 24.0));
  -[UIImageView setPreferredSymbolConfiguration:](self->_trailingImageView, "setPreferredSymbolConfiguration:", v9);

  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_trailingImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIImageView setHidden:](self->_trailingImageView, "setHidden:", 1);
  LODWORD(v10) = 1148846080;
  -[UIImageView setContentCompressionResistancePriority:forAxis:](self->_trailingImageView, "setContentCompressionResistancePriority:forAxis:", 0, v10);
  LODWORD(v11) = 1148846080;
  -[UIImageView setContentHuggingPriority:forAxis:](self->_trailingImageView, "setContentHuggingPriority:forAxis:", 0, v11);
  -[MapsSaveRouteOfflineDownloadView addSubview:](self, "addSubview:", self->_trailingImageView);
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
  NSArray *v15;
  NSArray *switchConstraints;
  void *v17;
  void *v18;
  void *v19;
  NSArray *v20;
  NSArray *trailingImageConstraints;
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
  _QWORD v40[8];

  v37 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesContentView topAnchor](self->_offlineDownloadView, "topAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSaveRouteOfflineDownloadView topAnchor](self, "topAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToAnchor:", v36));
  v40[0] = v35;
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesContentView bottomAnchor](self->_offlineDownloadView, "bottomAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSaveRouteOfflineDownloadView bottomAnchor](self, "bottomAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:", v33));
  v40[1] = v32;
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesContentView leadingAnchor](self->_offlineDownloadView, "leadingAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSaveRouteOfflineDownloadView leadingAnchor](self, "leadingAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:constant:", v30, 16.0));
  v40[2] = v29;
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesContentView trailingAnchor](self->_offlineDownloadView, "trailingAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSaveRouteOfflineDownloadView trailingAnchor](self, "trailingAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintLessThanOrEqualToAnchor:constant:", v27, -16.0));
  v40[3] = v26;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[UISwitch centerYAnchor](self->_switch, "centerYAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSaveRouteOfflineDownloadView centerYAnchor](self, "centerYAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:", v24));
  v40[4] = v23;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[UISwitch trailingAnchor](self->_switch, "trailingAnchor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSaveRouteOfflineDownloadView trailingAnchor](self, "trailingAnchor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:constant:", v3, -16.0));
  v40[5] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerYAnchor](self->_trailingImageView, "centerYAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSaveRouteOfflineDownloadView centerYAnchor](self, "centerYAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToAnchor:", v6));
  v40[6] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView trailingAnchor](self->_trailingImageView, "trailingAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSaveRouteOfflineDownloadView trailingAnchor](self, "trailingAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:constant:", v9, -16.0));
  v40[7] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v40, 8));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[UISwitch leadingAnchor](self->_switch, "leadingAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesContentView trailingAnchor](self->_offlineDownloadView, "trailingAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v13, 1.0));
  v39 = v14;
  v15 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v39, 1));
  switchConstraints = self->_switchConstraints;
  self->_switchConstraints = v15;

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView leadingAnchor](self->_trailingImageView, "leadingAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesContentView trailingAnchor](self->_offlineDownloadView, "trailingAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v18, 1.0));
  v38 = v19;
  v20 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v38, 1));
  trailingImageConstraints = self->_trailingImageConstraints;
  self->_trailingImageConstraints = v20;

}

- (void)_determineOfflineRegionInfo
{
  void *v3;
  GEOMapRegion *region;
  GEOCancellable *v5;
  GEOCancellable *sizeEstimationRequest;
  _QWORD v7[4];
  id v8;
  id location;

  if (self->_existingSubscription)
  {
    self->_offlineState = 4;
    -[MapsSaveRouteOfflineDownloadView _update](self, "_update");
  }
  else
  {
    self->_offlineState = 1;
    -[MapsSaveRouteOfflineDownloadView _update](self, "_update");
    objc_initWeak(&location, self);
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
    region = self->_region;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100B8FA58;
    v7[3] = &unk_1011B0F78;
    objc_copyWeak(&v8, &location);
    v5 = (GEOCancellable *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "determineEstimatedSizeForSubscriptionWithRegion:completionHandler:", region, v7));
    sizeEstimationRequest = self->_sizeEstimationRequest;
    self->_sizeEstimationRequest = v5;

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

- (void)_update
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSArray *switchConstraints;
  NSArray *trailingImageConstraints;

  switch(self->_offlineState)
  {
    case 0:
      v3 = objc_claimAutoreleasedReturnValue(+[TwoLinesContentViewModelComposer cellModelForSavedRouteUnavailableOfflineRegion:](TwoLinesContentViewModelComposer, "cellModelForSavedRouteUnavailableOfflineRegion:", self->_region));
      goto LABEL_6;
    case 1:
      v3 = objc_claimAutoreleasedReturnValue(+[TwoLinesContentViewModelComposer cellModelForSavedRouteCalculatingOfflineRegion:](TwoLinesContentViewModelComposer, "cellModelForSavedRouteCalculatingOfflineRegion:", self->_region));
      goto LABEL_6;
    case 2:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[TwoLinesContentViewModelComposer cellModelForSavedRouteOfflineDownload:estimatedSizeInBytes:](TwoLinesContentViewModelComposer, "cellModelForSavedRouteOfflineDownload:estimatedSizeInBytes:", self->_region, self->_estimatedRegionSizeInBytes));
      -[TwoLinesContentView setViewModel:](self->_offlineDownloadView, "setViewModel:", v4);

      v5 = 1;
      -[UISwitch setOn:](self->_switch, "setOn:", 1);
      -[UISwitch setEnabled:](self->_switch, "setEnabled:", 1);
      v6 = 0;
      goto LABEL_9;
    case 3:
      v3 = objc_claimAutoreleasedReturnValue(+[TwoLinesContentViewModelComposer cellModelForSavedRouteCalculatingFailureForOfflineRegion:](TwoLinesContentViewModelComposer, "cellModelForSavedRouteCalculatingFailureForOfflineRegion:", self->_region));
LABEL_6:
      v7 = (void *)v3;
      -[TwoLinesContentView setViewModel:](self->_offlineDownloadView, "setViewModel:", v3);

      -[UISwitch setOn:](self->_switch, "setOn:", 0);
      -[UISwitch setEnabled:](self->_switch, "setEnabled:", 0);
      goto LABEL_7;
    case 4:
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[MapDataSubscriptionInfo subscription](self->_existingSubscription, "subscription"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "region"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[TwoLinesContentViewModelComposer cellModelForSavedRouteOfflineRegion:coveredByExistingSubscription:](TwoLinesContentViewModelComposer, "cellModelForSavedRouteOfflineRegion:coveredByExistingSubscription:", v9, self->_existingSubscription));
      -[TwoLinesContentView setViewModel:](self->_offlineDownloadView, "setViewModel:", v10);

      v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGreenColor](UIColor, "systemGreenColor"));
      -[UIImageView setTintColor:](self->_trailingImageView, "setTintColor:", v11);

      v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("checkmark.circle")));
      -[UIImageView setImage:](self->_trailingImageView, "setImage:", v12);

      -[UIImageView sizeToFit](self->_trailingImageView, "sizeToFit");
      v5 = 0;
      v6 = 1;
      goto LABEL_9;
    default:
LABEL_7:
      v6 = 0;
      v5 = 1;
LABEL_9:
      if ((_DWORD)v6 != -[UISwitch isHidden](self->_switch, "isHidden"))
      {
        switchConstraints = self->_switchConstraints;
        if ((_DWORD)v6)
          +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", switchConstraints);
        else
          +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", switchConstraints);
        -[UISwitch setHidden:](self->_switch, "setHidden:", v6);
      }
      if ((_DWORD)v5 != -[UIImageView isHidden](self->_trailingImageView, "isHidden"))
      {
        trailingImageConstraints = self->_trailingImageConstraints;
        if ((_DWORD)v5)
          +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", trailingImageConstraints);
        else
          +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", trailingImageConstraints);
        -[UIImageView setHidden:](self->_trailingImageView, "setHidden:", v5);
      }
      return;
  }
}

- (BOOL)shouldDownload
{
  if (self->_offlineState == 2)
    return -[UISwitch isOn](self->_switch, "isOn");
  else
    return 0;
}

- (int64_t)estimatedRegionSizeInBytes
{
  return self->_estimatedRegionSizeInBytes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingImageConstraints, 0);
  objc_storeStrong((id *)&self->_switchConstraints, 0);
  objc_storeStrong((id *)&self->_existingSubscription, 0);
  objc_storeStrong((id *)&self->_trailingImageView, 0);
  objc_storeStrong((id *)&self->_switch, 0);
  objc_storeStrong((id *)&self->_offlineDownloadView, 0);
  objc_storeStrong((id *)&self->_sizeEstimationRequest, 0);
  objc_storeStrong((id *)&self->_region, 0);
}

@end
