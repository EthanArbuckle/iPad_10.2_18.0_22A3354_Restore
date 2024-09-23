@implementation CarPlaceCardCardViewController

- (CarPlaceCardCardViewController)initWithSearchResult:(id)a3 style:(int64_t)a4 dataSource:(id)a5 delegate:(id)a6
{
  id v11;
  id v12;
  id v13;
  CarPlaceCardCardViewController *v14;
  CarPlaceCardCardViewController *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  _TtC4Maps31CarPlaceCardEVChargingViewModel *evChargingViewModel;
  objc_super v28;
  uint8_t buf[4];
  CarPlaceCardCardViewController *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  id v34;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v28.receiver = self;
  v28.super_class = (Class)CarPlaceCardCardViewController;
  v14 = -[CarPlaceCardCardViewController initWithNibName:bundle:](&v28, "initWithNibName:bundle:", 0, 0);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_searchResult, a3);
    objc_storeWeak((id *)&v15->_dataSource, v12);
    objc_storeWeak((id *)&v15->_delegate, v13);
    v15->_style = a4;
    v16 = sub_10043364C();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[CarPlaceCardCardViewController mapItem](v15, "mapItem"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "name"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[CarPlaceCardCardViewController mapItem](v15, "mapItem"));
      v21 = objc_msgSend(v20, "_muid");
      *(_DWORD *)buf = 138543875;
      v30 = v15;
      v31 = 2113;
      v32 = v19;
      v33 = 2049;
      v34 = v21;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "CarPlaceCard: placecard initialized (%{public}@) with mapItem: (name: %{private}@, muid: %{private}llu)", buf, 0x20u);

    }
    -[CarPlaceCardCardViewController _initializeGoButtonState](v15, "_initializeGoButtonState");
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[MapsExternalDevice sharedInstance](MapsExternalDevice, "sharedInstance"));
    v15->_navigationAidedDrivingEnabled = objc_msgSend(v22, "isNavigationAidedDrivingEnabled");

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[MapsExternalDevice sharedInstance](MapsExternalDevice, "sharedInstance"));
    v15->_handoffEnabled = objc_msgSend(v23, "destinationHandoffEnabled");

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v24, "addObserver:selector:name:object:", v15, "_externalDeviceUpdated:", CFSTR("MapsExternalDeviceUpdated"), 0);

  }
  v25 = objc_claimAutoreleasedReturnValue(-[CarPlaceCardCardViewController _createEVChargingViewModel](v15, "_createEVChargingViewModel"));
  evChargingViewModel = v15->_evChargingViewModel;
  v15->_evChargingViewModel = (_TtC4Maps31CarPlaceCardEVChargingViewModel *)v25;

  return v15;
}

- (void)dealloc
{
  NSTimer *etaUpdateTimer;
  NSTimer *openingHoursUpdateTimer;
  void *v5;
  MKETAProvider *etaProvider;
  objc_super v7;

  -[NSTimer invalidate](self->_etaUpdateTimer, "invalidate");
  etaUpdateTimer = self->_etaUpdateTimer;
  self->_etaUpdateTimer = 0;

  -[NSTimer invalidate](self->_openingHoursUpdateTimer, "invalidate");
  openingHoursUpdateTimer = self->_openingHoursUpdateTimer;
  self->_openingHoursUpdateTimer = 0;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "removeObserver:", self);

  -[MKETAProvider cancel](self->_etaProvider, "cancel");
  etaProvider = self->_etaProvider;
  self->_etaProvider = 0;

  v7.receiver = self;
  v7.super_class = (Class)CarPlaceCardCardViewController;
  -[CarPlaceCardCardViewController dealloc](&v7, "dealloc");
}

- (void)_initializeGoButtonState
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  MKETAProvider *v7;
  MKETAProvider *etaProvider;
  id v9;
  NSObject *v10;
  uint8_t v11[16];
  uint8_t buf[16];

  if (self->_style == 1)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult mapItem](self->_searchResult, "mapItem"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_detourInfo"));

    if (v4)
    {
      v5 = sub_10043364C();
      v6 = objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "CarPlaceCard: initializing with enabled go button due to having detourInfo", buf, 2u);
      }

      self->_goButtonEnabled = 1;
      self->_goButtonHidden = 0;
    }
    else
    {
      -[MKETAProvider removeObserver:](self->_etaProvider, "removeObserver:", self);
      -[MKETAProvider cancel](self->_etaProvider, "cancel");
      v7 = (MKETAProvider *)objc_msgSend(objc_alloc((Class)MKETAProvider), "initWithMapItem:", v3);
      etaProvider = self->_etaProvider;
      self->_etaProvider = v7;

      -[MKETAProvider setAllowsDistantETA:](self->_etaProvider, "setAllowsDistantETA:", 1);
      -[MKETAProvider addObserver:](self->_etaProvider, "addObserver:", self);
      v9 = sub_10043364C();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "CarPlaceCard: disabling go button while waiting for ETA", v11, 2u);
      }

      self->_goButtonEnabled = 0;
      self->_goButtonHidden = -[MKETAProvider isLikelyToReturnETA](self->_etaProvider, "isLikelyToReturnETA") ^ 1;
      -[CarPlaceCardCardViewController _startETAProviderIfNeeded](self, "_startETAProviderIfNeeded");
    }

  }
}

- (void)_startETAProviderIfNeeded
{
  id v3;
  NSObject *v4;
  MKETAProvider *etaProvider;
  int v6;
  MKETAProvider *v7;

  if (-[CarPlaceCardCardViewController isViewLoaded](self, "isViewLoaded"))
  {
    v3 = sub_10043364C();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      etaProvider = self->_etaProvider;
      v6 = 138543362;
      v7 = etaProvider;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "CarPlaceCard: starting ETA provider: %{public}@", (uint8_t *)&v6, 0xCu);
    }

    -[MKETAProvider start](self->_etaProvider, "start");
  }
}

- (void)viewDidLoad
{
  void *v3;
  double v4;
  CarAutohidingLabel *v5;
  CarAutohidingLabel *subtitleLabel;
  CarStarRatingView *v7;
  CarStarRatingView *ratingView;
  double v9;
  double v10;
  double v11;
  CarAutohidingLabel *v12;
  CarAutohidingLabel *sharingETALabel;
  id v14;
  CarStarRatingView *v15;
  void *v16;
  UIStackView *v17;
  UIStackView *textStackView;
  double v19;
  void *v20;
  double v21;
  CarAutohidingLabel *v22;
  CarAutohidingLabel *addressLabel;
  void *v24;
  void *v25;
  _TtC4Maps39CarEVChargingAvailabilityViewController *v26;
  void *v27;
  _TtC4Maps39CarEVChargingAvailabilityViewController *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  double y;
  double width;
  double height;
  UILabel *v40;
  UILabel *evChargingTitleLabel;
  double v42;
  double v43;
  void *v44;
  UILabel *v45;
  UILabel *evChargingAvailabilityLabel;
  double v47;
  double v48;
  void *v49;
  CarCardRoundedButton *v50;
  CarCardRoundedButton *evChargingMoreButton;
  double v52;
  double v53;
  double v54;
  id v55;
  double v56;
  double v57;
  double v58;
  UILabel *v59;
  UILabel *etaLabel;
  double v61;
  double v62;
  void *v63;
  UILabel *v64;
  UILabel *mainDescriptionLabel;
  double v66;
  double v67;
  double v68;
  void *v69;
  CarAdvisoriesView *v70;
  CarAdvisoriesView *routeAdvisoriesView;
  double v72;
  double v73;
  void *v74;
  CarMoreButton *v75;
  CarMoreButton *moreButton;
  double v77;
  double v78;
  double v79;
  void *v80;
  CarLoadingButton *v81;
  CarLoadingButton *goButton;
  double v83;
  double v84;
  void *v85;
  _TtC4Maps31CarPlaceCardEVChargingViewModel *evChargingViewModel;
  objc_super v87;
  _QWORD v88[3];

  v87.receiver = self;
  v87.super_class = (Class)CarPlaceCardCardViewController;
  -[CarPlaceCardCardViewController viewDidLoad](&v87, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarPlaceCardCardViewController view](self, "view"));
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("CarPlaceCard"));

  LODWORD(v4) = 1144635392;
  v5 = (CarAutohidingLabel *)objc_claimAutoreleasedReturnValue(-[CarPlaceCardCardViewController _createAutohidingTextlabelWithVerticalCompressionResistancePriority:](self, "_createAutohidingTextlabelWithVerticalCompressionResistancePriority:", v4));
  subtitleLabel = self->_subtitleLabel;
  self->_subtitleLabel = v5;

  -[CarAutohidingLabel setAccessibilityIdentifier:](self->_subtitleLabel, "setAccessibilityIdentifier:", CFSTR("SubtitleLabel"));
  v7 = objc_alloc_init(CarStarRatingView);
  ratingView = self->_ratingView;
  self->_ratingView = v7;

  -[CarStarRatingView setTranslatesAutoresizingMaskIntoConstraints:](self->_ratingView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v9) = 1148846080;
  -[CarStarRatingView setContentHuggingPriority:forAxis:](self->_ratingView, "setContentHuggingPriority:forAxis:", 1, v9);
  LODWORD(v10) = 1144684544;
  -[CarStarRatingView setContentCompressionResistancePriority:forAxis:](self->_ratingView, "setContentCompressionResistancePriority:forAxis:", 1, v10);
  LODWORD(v11) = 1144717312;
  v12 = (CarAutohidingLabel *)objc_claimAutoreleasedReturnValue(-[CarPlaceCardCardViewController _createAutohidingTextlabelWithVerticalCompressionResistancePriority:](self, "_createAutohidingTextlabelWithVerticalCompressionResistancePriority:", v11));
  sharingETALabel = self->_sharingETALabel;
  self->_sharingETALabel = v12;

  -[CarAutohidingLabel setAccessibilityIdentifier:](self->_sharingETALabel, "setAccessibilityIdentifier:", CFSTR("SharingETALabel"));
  v14 = objc_alloc((Class)UIStackView);
  v15 = self->_ratingView;
  v88[0] = self->_subtitleLabel;
  v88[1] = v15;
  v88[2] = self->_sharingETALabel;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v88, 3));
  v17 = (UIStackView *)objc_msgSend(v14, "initWithArrangedSubviews:", v16);
  textStackView = self->_textStackView;
  self->_textStackView = v17;

  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_textStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIStackView setAxis:](self->_textStackView, "setAxis:", 1);
  -[UIStackView setAlignment:](self->_textStackView, "setAlignment:", 1);
  -[UIStackView setDistribution:](self->_textStackView, "setDistribution:", 0);
  -[UIStackView setBaselineRelativeArrangement:](self->_textStackView, "setBaselineRelativeArrangement:", 1);
  -[UIStackView setSpacing:](self->_textStackView, "setSpacing:", 15.0);
  LODWORD(v19) = 1144750080;
  -[UIStackView setContentHuggingPriority:forAxis:](self->_textStackView, "setContentHuggingPriority:forAxis:", 1, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[CarPlaceCardCardViewController view](self, "view"));
  objc_msgSend(v20, "addSubview:", self->_textStackView);

  LODWORD(v21) = 1144619008;
  v22 = (CarAutohidingLabel *)objc_claimAutoreleasedReturnValue(-[CarPlaceCardCardViewController _createAutohidingTextlabelWithVerticalCompressionResistancePriority:](self, "_createAutohidingTextlabelWithVerticalCompressionResistancePriority:", v21));
  addressLabel = self->_addressLabel;
  self->_addressLabel = v22;

  -[CarAutohidingLabel setAccessibilityIdentifier:](self->_addressLabel, "setAccessibilityIdentifier:", CFSTR("AddressLabel"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[CarPlaceCardCardViewController view](self, "view"));
  objc_msgSend(v24, "addSubview:", self->_addressLabel);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[CarPlaceCardCardViewController evChargingViewModel](self, "evChargingViewModel"));
  if (v25)
  {
    if (-[CarPlaceCardCardViewController _shouldShowEVViewsInline](self, "_shouldShowEVViewsInline"))
    {
      v26 = [_TtC4Maps39CarEVChargingAvailabilityViewController alloc];
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[CarPlaceCardCardViewController evChargingViewModel](self, "evChargingViewModel"));
      v28 = -[CarEVChargingAvailabilityViewController initWithViewModal:](v26, "initWithViewModal:", v27);
      -[CarPlaceCardCardViewController setEvChargingAvailabilityVC:](self, "setEvChargingAvailabilityVC:", v28);

      v29 = (void *)objc_claimAutoreleasedReturnValue(-[CarPlaceCardCardViewController evChargingAvailabilityVC](self, "evChargingAvailabilityVC"));
      -[CarPlaceCardCardViewController addChildViewController:](self, "addChildViewController:", v29);

      v30 = (void *)objc_claimAutoreleasedReturnValue(-[CarPlaceCardCardViewController view](self, "view"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[CarPlaceCardCardViewController evChargingAvailabilityVC](self, "evChargingAvailabilityVC"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "view"));
      objc_msgSend(v30, "addSubview:", v32);

      v33 = (void *)objc_claimAutoreleasedReturnValue(-[CarPlaceCardCardViewController evChargingAvailabilityVC](self, "evChargingAvailabilityVC"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "view"));
      objc_msgSend(v34, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      v35 = (void *)objc_claimAutoreleasedReturnValue(-[CarPlaceCardCardViewController evChargingAvailabilityVC](self, "evChargingAvailabilityVC"));
      objc_msgSend(v35, "didMoveToParentViewController:", self);
    }
    else
    {
      v36 = objc_alloc((Class)UILabel);
      y = CGRectZero.origin.y;
      width = CGRectZero.size.width;
      height = CGRectZero.size.height;
      v40 = (UILabel *)objc_msgSend(v36, "initWithFrame:", CGRectZero.origin.x, y, width, height);
      evChargingTitleLabel = self->_evChargingTitleLabel;
      self->_evChargingTitleLabel = v40;

      -[UILabel setAccessibilityIdentifier:](self->_evChargingTitleLabel, "setAccessibilityIdentifier:", CFSTR("EVChargingTitleLabel"));
      -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_evChargingTitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      LODWORD(v42) = 1148846080;
      -[UILabel setContentHuggingPriority:forAxis:](self->_evChargingTitleLabel, "setContentHuggingPriority:forAxis:", 1, v42);
      LODWORD(v43) = 1144700928;
      -[UILabel setContentCompressionResistancePriority:forAxis:](self->_evChargingTitleLabel, "setContentCompressionResistancePriority:forAxis:", 0, v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue(-[CarPlaceCardCardViewController view](self, "view"));
      objc_msgSend(v44, "addSubview:", self->_evChargingTitleLabel);

      v45 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
      evChargingAvailabilityLabel = self->_evChargingAvailabilityLabel;
      self->_evChargingAvailabilityLabel = v45;

      -[UILabel setAccessibilityIdentifier:](self->_evChargingAvailabilityLabel, "setAccessibilityIdentifier:", CFSTR("EVChargingAvailabilityLabel"));
      -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_evChargingAvailabilityLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      LODWORD(v47) = 1148846080;
      -[UILabel setContentHuggingPriority:forAxis:](self->_evChargingAvailabilityLabel, "setContentHuggingPriority:forAxis:", 1, v47);
      LODWORD(v48) = 1144700928;
      -[UILabel setContentCompressionResistancePriority:forAxis:](self->_evChargingAvailabilityLabel, "setContentCompressionResistancePriority:forAxis:", 0, v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue(-[CarPlaceCardCardViewController view](self, "view"));
      objc_msgSend(v49, "addSubview:", self->_evChargingAvailabilityLabel);

      v50 = -[CarCardRoundedButton initWithFrame:]([CarCardRoundedButton alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
      evChargingMoreButton = self->_evChargingMoreButton;
      self->_evChargingMoreButton = v50;

      -[CarCardRoundedButton setAccessibilityIdentifier:](self->_evChargingMoreButton, "setAccessibilityIdentifier:", CFSTR("EVChargingMoreButton"));
      -[CarCardRoundedButton setTranslatesAutoresizingMaskIntoConstraints:](self->_evChargingMoreButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      LODWORD(v52) = 1132068864;
      -[CarCardRoundedButton setContentHuggingPriority:forAxis:](self->_evChargingMoreButton, "setContentHuggingPriority:forAxis:", 1, v52);
      LODWORD(v53) = 1148846080;
      -[CarCardRoundedButton setContentCompressionResistancePriority:forAxis:](self->_evChargingMoreButton, "setContentCompressionResistancePriority:forAxis:", 0, v53);
      LODWORD(v54) = 1148846080;
      -[CarCardRoundedButton setContentCompressionResistancePriority:forAxis:](self->_evChargingMoreButton, "setContentCompressionResistancePriority:forAxis:", 1, v54);
      -[CarCardRoundedButton addTarget:action:forControlEvents:](self->_evChargingMoreButton, "addTarget:action:forControlEvents:", self, "_evChargingMoreButtonPressed:", 64);
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[CarPlaceCardCardViewController view](self, "view"));
      objc_msgSend(v35, "addSubview:", self->_evChargingMoreButton);
    }

  }
  v55 = objc_alloc((Class)UILabel);
  v56 = CGRectZero.origin.y;
  v57 = CGRectZero.size.width;
  v58 = CGRectZero.size.height;
  v59 = (UILabel *)objc_msgSend(v55, "initWithFrame:", CGRectZero.origin.x, v56, v57, v58);
  etaLabel = self->_etaLabel;
  self->_etaLabel = v59;

  -[UILabel setAccessibilityIdentifier:](self->_etaLabel, "setAccessibilityIdentifier:", CFSTR("ETALabel"));
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_etaLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v61) = 1144733696;
  -[UILabel setContentHuggingPriority:forAxis:](self->_etaLabel, "setContentHuggingPriority:forAxis:", 1, v61);
  LODWORD(v62) = 1144733696;
  -[UILabel setContentCompressionResistancePriority:forAxis:](self->_etaLabel, "setContentCompressionResistancePriority:forAxis:", 0, v62);
  v63 = (void *)objc_claimAutoreleasedReturnValue(-[CarPlaceCardCardViewController view](self, "view"));
  objc_msgSend(v63, "addSubview:", self->_etaLabel);

  v64 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, v56, v57, v58);
  mainDescriptionLabel = self->_mainDescriptionLabel;
  self->_mainDescriptionLabel = v64;

  -[UILabel setAccessibilityIdentifier:](self->_mainDescriptionLabel, "setAccessibilityIdentifier:", CFSTR("MainDescriptionLabel"));
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_mainDescriptionLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v66) = 1148846080;
  -[UILabel setContentHuggingPriority:forAxis:](self->_mainDescriptionLabel, "setContentHuggingPriority:forAxis:", 1, v66);
  LODWORD(v67) = 1148829696;
  -[UILabel setContentCompressionResistancePriority:forAxis:](self->_mainDescriptionLabel, "setContentCompressionResistancePriority:forAxis:", 0, v67);
  LODWORD(v68) = 1144668160;
  -[UILabel setContentCompressionResistancePriority:forAxis:](self->_mainDescriptionLabel, "setContentCompressionResistancePriority:forAxis:", 1, v68);
  v69 = (void *)objc_claimAutoreleasedReturnValue(-[CarPlaceCardCardViewController view](self, "view"));
  objc_msgSend(v69, "addSubview:", self->_mainDescriptionLabel);

  v70 = -[CarAdvisoriesView initWithFrame:]([CarAdvisoriesView alloc], "initWithFrame:", CGRectZero.origin.x, v56, v57, v58);
  routeAdvisoriesView = self->_routeAdvisoriesView;
  self->_routeAdvisoriesView = v70;

  -[CarAdvisoriesView setTranslatesAutoresizingMaskIntoConstraints:](self->_routeAdvisoriesView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v72) = 1148846080;
  -[CarAdvisoriesView setContentHuggingPriority:forAxis:](self->_routeAdvisoriesView, "setContentHuggingPriority:forAxis:", 1, v72);
  LODWORD(v73) = 1144651776;
  -[CarAdvisoriesView setContentCompressionResistancePriority:forAxis:](self->_routeAdvisoriesView, "setContentCompressionResistancePriority:forAxis:", 1, v73);
  v74 = (void *)objc_claimAutoreleasedReturnValue(-[CarPlaceCardCardViewController view](self, "view"));
  objc_msgSend(v74, "addSubview:", self->_routeAdvisoriesView);

  v75 = -[CarCardRoundedButton initWithFrame:]([CarMoreButton alloc], "initWithFrame:", CGRectZero.origin.x, v56, v57, v58);
  moreButton = self->_moreButton;
  self->_moreButton = v75;

  -[CarMoreButton setTranslatesAutoresizingMaskIntoConstraints:](self->_moreButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v77) = 1132068864;
  -[CarMoreButton setContentHuggingPriority:forAxis:](self->_moreButton, "setContentHuggingPriority:forAxis:", 1, v77);
  LODWORD(v78) = 1148846080;
  -[CarMoreButton setContentCompressionResistancePriority:forAxis:](self->_moreButton, "setContentCompressionResistancePriority:forAxis:", 0, v78);
  LODWORD(v79) = 1148846080;
  -[CarMoreButton setContentCompressionResistancePriority:forAxis:](self->_moreButton, "setContentCompressionResistancePriority:forAxis:", 1, v79);
  -[CarMoreButton addTarget:action:forControlEvents:](self->_moreButton, "addTarget:action:forControlEvents:", self, "_moreButtonPressed:", 64);
  v80 = (void *)objc_claimAutoreleasedReturnValue(-[CarPlaceCardCardViewController view](self, "view"));
  objc_msgSend(v80, "addSubview:", self->_moreButton);

  v81 = -[CarCardRoundedButton initWithFrame:]([CarLoadingButton alloc], "initWithFrame:", CGRectZero.origin.x, v56, v57, v58);
  goButton = self->_goButton;
  self->_goButton = v81;

  -[CarLoadingButton setAccessibilityIdentifier:](self->_goButton, "setAccessibilityIdentifier:", CFSTR("GoButton"));
  -[CarLoadingButton setTranslatesAutoresizingMaskIntoConstraints:](self->_goButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v83) = 1148846080;
  -[CarLoadingButton setContentHuggingPriority:forAxis:](self->_goButton, "setContentHuggingPriority:forAxis:", 1, v83);
  LODWORD(v84) = 1148846080;
  -[CarLoadingButton setContentCompressionResistancePriority:forAxis:](self->_goButton, "setContentCompressionResistancePriority:forAxis:", 1, v84);
  -[CarLoadingButton addTarget:action:forControlEvents:](self->_goButton, "addTarget:action:forControlEvents:", self, "_goButtonPressed:", 64);
  v85 = (void *)objc_claimAutoreleasedReturnValue(-[CarPlaceCardCardViewController view](self, "view"));
  objc_msgSend(v85, "addSubview:", self->_goButton);

  -[CarPlaceCardCardViewController _setupConstraints](self, "_setupConstraints");
  -[CarPlaceCardCardViewController _setupStyling](self, "_setupStyling");
  -[CarPlaceCardCardViewController _updateContents](self, "_updateContents");
  -[CarPlaceCardCardViewController _captureAnalytics](self, "_captureAnalytics");
  -[CarPlaceCardCardViewController _startETAProviderIfNeeded](self, "_startETAProviderIfNeeded");
  evChargingViewModel = self->_evChargingViewModel;
  if (evChargingViewModel)
    -[CarPlaceCardEVChargingViewModel setObserver:](evChargingViewModel, "setObserver:", self);
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CarPlaceCardCardViewController;
  -[CarPlaceCardCardViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  self->_goButtonIsFocusable = 0;
  -[CarPlaceCardCardViewController _updateContents](self, "_updateContents");
  +[PPTNotificationCenter postNotificationIfNeededWithName:object:userInfo:](PPTNotificationCenter, "postNotificationIfNeededWithName:object:userInfo:", CFSTR("CarPlaceCardCardViewControllerDidAppearNotification"), self, 0);
  -[CarPlaceCardEVChargingViewModel setIsActive:](self->_evChargingViewModel, "setIsActive:", 1);
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CarPlaceCardCardViewController;
  -[CarPlaceCardCardViewController viewDidDisappear:](&v4, "viewDidDisappear:", a3);
  -[CarPlaceCardEVChargingViewModel setIsActive:](self->_evChargingViewModel, "setIsActive:", 0);
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
  CarAutohidingLabel *addressLabel;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  CarAutohidingLabel *v21;
  void *v22;
  void *v23;
  UILabel *v24;
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
  NSArray *v41;
  NSArray *evChargingSummaryViewConstraints;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  NSLayoutConstraint *v52;
  NSLayoutConstraint *etaLabelTrailingConstraint;
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
  NSLayoutConstraint *v64;
  NSLayoutConstraint *routeAdvisoriesHeightConstraint;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  UIStackView *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  CarAutohidingLabel *v152;
  CarAutohidingLabel *v153;
  void *v154;
  double v155;
  _QWORD v156[11];
  _QWORD v157[6];
  _QWORD v158[10];
  _QWORD v159[3];
  _QWORD v160[5];
  _QWORD v161[4];

  v154 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v144 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView firstBaselineAnchor](self->_textStackView, "firstBaselineAnchor"));
  v150 = (void *)objc_claimAutoreleasedReturnValue(-[CarPlaceCardCardViewController view](self, "view"));
  v138 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v150, "topAnchor"));
  v132 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v144, "constraintEqualToAnchor:constant:", v138, -1.0));
  v161[0] = v132;
  v121 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView leadingAnchor](self->_textStackView, "leadingAnchor"));
  v126 = (void *)objc_claimAutoreleasedReturnValue(-[CarPlaceCardCardViewController view](self, "view"));
  v116 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v126, "leadingAnchor"));
  v111 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v121, "constraintEqualToAnchor:constant:", v116, 10.0));
  v161[1] = v111;
  v106 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView trailingAnchor](self->_textStackView, "trailingAnchor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarPlaceCardCardViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "trailingAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "constraintEqualToAnchor:constant:", v4, -10.0));
  v161[2] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView bottomAnchor](self->_textStackView, "bottomAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarPlaceCardCardViewController view](self, "view"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bottomAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintLessThanOrEqualToAnchor:", v8));
  v161[3] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v161, 4));
  objc_msgSend(v154, "addObjectsFromArray:", v10);

  addressLabel = self->_addressLabel;
  v145 = self->_textStackView;
  v151 = (void *)objc_claimAutoreleasedReturnValue(-[CarAutohidingLabel firstBaselineAnchor](addressLabel, "firstBaselineAnchor"));
  v139 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView lastBaselineAnchor](v145, "lastBaselineAnchor"));
  LODWORD(v12) = 1144602624;
  v133 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v151, "constraintEqualToAnchor:constant:priority:", v139, 20.0, v12));
  v160[0] = v133;
  v127 = (void *)objc_claimAutoreleasedReturnValue(-[CarAutohidingLabel firstBaselineAnchor](self->_addressLabel, "firstBaselineAnchor"));
  v122 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView lastBaselineAnchor](v145, "lastBaselineAnchor"));
  v117 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v127, "constraintGreaterThanOrEqualToAnchor:constant:", v122, 14.0));
  v160[1] = v117;
  v112 = (void *)objc_claimAutoreleasedReturnValue(-[CarAutohidingLabel heightAnchor](self->_addressLabel, "heightAnchor"));
  v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v112, "constraintGreaterThanOrEqualToConstant:", 20.0));
  v160[2] = v107;
  v103 = (void *)objc_claimAutoreleasedReturnValue(-[CarAutohidingLabel leadingAnchor](self->_addressLabel, "leadingAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CarPlaceCardCardViewController view](self, "view"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "leadingAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v103, "constraintEqualToAnchor:constant:", v14, 10.0));
  v160[3] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CarAutohidingLabel trailingAnchor](self->_addressLabel, "trailingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CarPlaceCardCardViewController view](self, "view"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "trailingAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:constant:", v18, -10.0));
  v160[4] = v19;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v160, 5));
  objc_msgSend(v154, "addObjectsFromArray:", v20);

  v21 = self->_addressLabel;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CarPlaceCardCardViewController evChargingViewModel](self, "evChargingViewModel"));

  if (v22)
  {
    v152 = v21;
    if (-[CarPlaceCardCardViewController _shouldShowEVViewsInline](self, "_shouldShowEVViewsInline"))
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[CarPlaceCardCardViewController evChargingAvailabilityVC](self, "evChargingAvailabilityVC"));
      v24 = (UILabel *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "view"));

      v146 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](v24, "topAnchor"));
      v140 = (void *)objc_claimAutoreleasedReturnValue(-[CarAutohidingLabel lastBaselineAnchor](v21, "lastBaselineAnchor"));
      v134 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v146, "constraintEqualToAnchor:constant:", v140, 12.0));
      v159[0] = v134;
      v128 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v24, "leadingAnchor"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[CarPlaceCardCardViewController view](self, "view"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "leadingAnchor"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128, "constraintEqualToAnchor:constant:", v26, 10.0));
      v159[1] = v27;
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v24, "trailingAnchor"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[CarPlaceCardCardViewController view](self, "view"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "trailingAnchor"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:constant:", v30, -10.0));
      v159[2] = v31;
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v159, 3));
      objc_msgSend(v154, "addObjectsFromArray:", v32);

    }
    else
    {
      v147 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardRoundedButton topAnchor](self->_evChargingMoreButton, "topAnchor"));
      v141 = (void *)objc_claimAutoreleasedReturnValue(-[CarAutohidingLabel lastBaselineAnchor](v21, "lastBaselineAnchor"));
      v135 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v147, "constraintEqualToAnchor:constant:", v141, 6.0));
      v158[0] = v135;
      v129 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardRoundedButton heightAnchor](self->_evChargingMoreButton, "heightAnchor"));
      v123 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v129, "constraintEqualToConstant:", 30.0));
      v158[1] = v123;
      v118 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardRoundedButton widthAnchor](self->_evChargingMoreButton, "widthAnchor"));
      v113 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "constraintEqualToConstant:", 30.0));
      v158[2] = v113;
      v104 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardRoundedButton trailingAnchor](self->_evChargingMoreButton, "trailingAnchor"));
      v108 = (void *)objc_claimAutoreleasedReturnValue(-[CarPlaceCardCardViewController view](self, "view"));
      v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v108, "trailingAnchor"));
      v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "constraintEqualToAnchor:constant:", v100, -10.0));
      v158[3] = v97;
      v95 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_evChargingTitleLabel, "bottomAnchor"));
      v92 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_evChargingAvailabilityLabel, "topAnchor"));
      v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "constraintEqualToAnchor:constant:", v92, 2.0));
      v158[4] = v90;
      v86 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_evChargingTitleLabel, "leadingAnchor"));
      v88 = (void *)objc_claimAutoreleasedReturnValue(-[CarPlaceCardCardViewController view](self, "view"));
      v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "leadingAnchor"));
      v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "constraintEqualToAnchor:constant:", v83, 10.0));
      v158[5] = v81;
      v79 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_evChargingTitleLabel, "trailingAnchor"));
      v77 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardRoundedButton leadingAnchor](self->_evChargingMoreButton, "leadingAnchor"));
      v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "constraintLessThanOrEqualToAnchor:constant:", v77, -10.0));
      v158[6] = v75;
      v73 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_evChargingAvailabilityLabel, "bottomAnchor"));
      v71 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardRoundedButton bottomAnchor](self->_evChargingMoreButton, "bottomAnchor"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "constraintEqualToAnchor:", v71));
      v158[7] = v33;
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_evChargingAvailabilityLabel, "leadingAnchor"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[CarPlaceCardCardViewController view](self, "view"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "leadingAnchor"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:constant:", v36, 10.0));
      v158[8] = v37;
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_evChargingAvailabilityLabel, "trailingAnchor"));
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardRoundedButton leadingAnchor](self->_evChargingMoreButton, "leadingAnchor"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintLessThanOrEqualToAnchor:constant:", v39, -10.0));
      v158[9] = v40;
      v41 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v158, 10));
      evChargingSummaryViewConstraints = self->_evChargingSummaryViewConstraints;
      self->_evChargingSummaryViewConstraints = v41;

      objc_msgSend(v154, "addObjectsFromArray:", self->_evChargingSummaryViewConstraints);
      v24 = self->_evChargingAvailabilityLabel;
    }

    v21 = (CarAutohidingLabel *)v24;
  }
  v153 = v21;
  v148 = (void *)objc_claimAutoreleasedReturnValue(-[CarMoreButton topAnchor](self->_moreButton, "topAnchor"));
  v142 = (void *)objc_claimAutoreleasedReturnValue(-[CarAutohidingLabel lastBaselineAnchor](v21, "lastBaselineAnchor"));
  v136 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v148, "constraintGreaterThanOrEqualToAnchor:constant:", v142, 6.0));
  v157[0] = v136;
  v130 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_etaLabel, "bottomAnchor"));
  v124 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_mainDescriptionLabel, "topAnchor"));
  v119 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v130, "constraintEqualToAnchor:constant:", v124, 2.0));
  v157[1] = v119;
  v109 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_etaLabel, "leadingAnchor"));
  v114 = (void *)objc_claimAutoreleasedReturnValue(-[CarPlaceCardCardViewController view](self, "view"));
  v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v114, "leadingAnchor"));
  v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v109, "constraintEqualToAnchor:constant:", v101, 10.0));
  v157[2] = v98;
  v96 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_mainDescriptionLabel, "bottomAnchor"));
  v93 = (void *)objc_claimAutoreleasedReturnValue(-[CarMoreButton bottomAnchor](self->_moreButton, "bottomAnchor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "constraintEqualToAnchor:", v93));
  v157[3] = v43;
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_mainDescriptionLabel, "leadingAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[CarPlaceCardCardViewController view](self, "view"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "leadingAnchor"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "constraintEqualToAnchor:constant:", v46, 10.0));
  v157[4] = v47;
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_mainDescriptionLabel, "trailingAnchor"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_etaLabel, "trailingAnchor"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "constraintEqualToAnchor:", v49));
  v157[5] = v50;
  v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v157, 6));
  objc_msgSend(v154, "addObjectsFromArray:", v51);

  v52 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(-[CarPlaceCardCardViewController _createEtaLabelTrailingConstraint](self, "_createEtaLabelTrailingConstraint"));
  etaLabelTrailingConstraint = self->_etaLabelTrailingConstraint;
  self->_etaLabelTrailingConstraint = v52;

  objc_msgSend(v154, "addObject:", self->_etaLabelTrailingConstraint);
  v149 = (void *)objc_claimAutoreleasedReturnValue(-[CarMoreButton heightAnchor](self->_moreButton, "heightAnchor"));
  v143 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v149, "constraintEqualToConstant:", 30.0));
  v156[0] = v143;
  v137 = (void *)objc_claimAutoreleasedReturnValue(-[CarMoreButton widthAnchor](self->_moreButton, "widthAnchor"));
  v131 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v137, "constraintEqualToConstant:", 30.0));
  v156[1] = v131;
  v120 = (void *)objc_claimAutoreleasedReturnValue(-[CarMoreButton trailingAnchor](self->_moreButton, "trailingAnchor"));
  v125 = (void *)objc_claimAutoreleasedReturnValue(-[CarPlaceCardCardViewController view](self, "view"));
  v115 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v125, "trailingAnchor"));
  v110 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v120, "constraintEqualToAnchor:constant:", v115, -10.0));
  v156[2] = v110;
  v105 = (void *)objc_claimAutoreleasedReturnValue(-[CarMoreButton bottomAnchor](self->_moreButton, "bottomAnchor"));
  v102 = (void *)objc_claimAutoreleasedReturnValue(-[CarAdvisoriesView topAnchor](self->_routeAdvisoriesView, "topAnchor"));
  v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "constraintLessThanOrEqualToAnchor:constant:", v102, -6.0));
  v156[3] = v99;
  v91 = (void *)objc_claimAutoreleasedReturnValue(-[CarAdvisoriesView leadingAnchor](self->_routeAdvisoriesView, "leadingAnchor"));
  v94 = (void *)objc_claimAutoreleasedReturnValue(-[CarPlaceCardCardViewController view](self, "view"));
  v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "leadingAnchor"));
  v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "constraintEqualToAnchor:constant:", v89, 10.0));
  v156[4] = v87;
  v84 = (void *)objc_claimAutoreleasedReturnValue(-[CarAdvisoriesView trailingAnchor](self->_routeAdvisoriesView, "trailingAnchor"));
  v85 = (void *)objc_claimAutoreleasedReturnValue(-[CarPlaceCardCardViewController view](self, "view"));
  v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "trailingAnchor"));
  v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "constraintEqualToAnchor:constant:", v82, -10.0));
  v156[5] = v80;
  v78 = (void *)objc_claimAutoreleasedReturnValue(-[CarAdvisoriesView bottomAnchor](self->_routeAdvisoriesView, "bottomAnchor"));
  v76 = (void *)objc_claimAutoreleasedReturnValue(-[CarLoadingButton topAnchor](self->_goButton, "topAnchor"));
  v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "constraintLessThanOrEqualToAnchor:constant:", v76, -6.0));
  v156[6] = v74;
  v70 = (void *)objc_claimAutoreleasedReturnValue(-[CarLoadingButton leadingAnchor](self->_goButton, "leadingAnchor"));
  v72 = (void *)objc_claimAutoreleasedReturnValue(-[CarPlaceCardCardViewController view](self, "view"));
  v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "leadingAnchor"));
  v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "constraintEqualToAnchor:constant:", v69, 10.0));
  v156[7] = v68;
  v66 = (void *)objc_claimAutoreleasedReturnValue(-[CarLoadingButton trailingAnchor](self->_goButton, "trailingAnchor"));
  v67 = (void *)objc_claimAutoreleasedReturnValue(-[CarPlaceCardCardViewController view](self, "view"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "trailingAnchor"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "constraintEqualToAnchor:constant:", v54, -10.0));
  v156[8] = v55;
  v56 = (void *)objc_claimAutoreleasedReturnValue(-[CarLoadingButton heightAnchor](self->_goButton, "heightAnchor"));
  +[CarCardRoundedButton buttonMetrics](CarCardRoundedButton, "buttonMetrics");
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "constraintEqualToConstant:", v155));
  v156[9] = v57;
  v58 = (void *)objc_claimAutoreleasedReturnValue(-[CarLoadingButton bottomAnchor](self->_goButton, "bottomAnchor"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(-[CarPlaceCardCardViewController view](self, "view"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "bottomAnchor"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "constraintEqualToAnchor:constant:", v60, -10.0));
  v156[10] = v61;
  v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v156, 11));
  objc_msgSend(v154, "addObjectsFromArray:", v62);

  v63 = (void *)objc_claimAutoreleasedReturnValue(-[CarAdvisoriesView heightAnchor](self->_routeAdvisoriesView, "heightAnchor"));
  v64 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "constraintEqualToConstant:", 0.0));
  routeAdvisoriesHeightConstraint = self->_routeAdvisoriesHeightConstraint;
  self->_routeAdvisoriesHeightConstraint = v64;

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v154);
}

- (void)_setupStyling
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
  uint64_t v16;
  void *v17;
  void *v18;
  double v19;
  UILabel *mainDescriptionLabel;
  void *v21;
  double v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  id v35;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapsCar_fontForTextStyle:weight:](UIFont, "_mapsCar_fontForTextStyle:weight:", UIFontTextStyleCaption2, UIFontWeightRegular));
  -[CarAutohidingLabel setFont:](self->_subtitleLabel, "setFont:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemPrimaryColor](UIColor, "_carSystemPrimaryColor"));
  -[CarAutohidingLabel setTextColor:](self->_subtitleLabel, "setTextColor:", v4);

  -[CarAutohidingLabel setLineBreakMode:](self->_subtitleLabel, "setLineBreakMode:", 4);
  -[CarAutohidingLabel setNumberOfLines:](self->_subtitleLabel, "setNumberOfLines:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapsCar_fontForTextStyle:traits:](UIFont, "_mapsCar_fontForTextStyle:traits:", UIFontTextStyleCaption1, 0x8000));
  -[CarAutohidingLabel setFont:](self->_addressLabel, "setFont:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemPrimaryColor](UIColor, "_carSystemPrimaryColor"));
  -[CarAutohidingLabel setTextColor:](self->_addressLabel, "setTextColor:", v6);

  -[CarAutohidingLabel setLineBreakMode:](self->_addressLabel, "setLineBreakMode:", 4);
  -[CarAutohidingLabel setNumberOfLines:](self->_addressLabel, "setNumberOfLines:", 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapsCar_fontForTextStyle:weight:](UIFont, "_mapsCar_fontForTextStyle:weight:", UIFontTextStyleFootnote, UIFontWeightMedium));
  -[UILabel setFont:](self->_evChargingTitleLabel, "setFont:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  -[UILabel setTextColor:](self->_evChargingTitleLabel, "setTextColor:", v8);

  -[UILabel setLineBreakMode:](self->_evChargingTitleLabel, "setLineBreakMode:", 4);
  -[UILabel setNumberOfLines:](self->_evChargingTitleLabel, "setNumberOfLines:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapsCar_fontForTextStyle:weight:](UIFont, "_mapsCar_fontForTextStyle:weight:", UIFontTextStyleCaption1, UIFontWeightRegular));
  -[UILabel setFont:](self->_evChargingAvailabilityLabel, "setFont:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  -[UILabel setTextColor:](self->_evChargingAvailabilityLabel, "setTextColor:", v10);

  -[UILabel setLineBreakMode:](self->_evChargingAvailabilityLabel, "setLineBreakMode:", 4);
  -[UILabel setNumberOfLines:](self->_evChargingAvailabilityLabel, "setNumberOfLines:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapsCar_fontForTextStyle:weight:](UIFont, "_mapsCar_fontForTextStyle:weight:", UIFontTextStyleCaption2, UIFontWeightRegular));
  -[CarAutohidingLabel setFont:](self->_sharingETALabel, "setFont:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemSecondaryColor](UIColor, "_carSystemSecondaryColor"));
  -[CarAutohidingLabel setTextColor:](self->_sharingETALabel, "setTextColor:", v12);

  -[CarAutohidingLabel setLineBreakMode:](self->_sharingETALabel, "setLineBreakMode:", 4);
  -[CarAutohidingLabel setNumberOfLines:](self->_sharingETALabel, "setNumberOfLines:", 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapsCar_fontForTextStyle:weight:](UIFont, "_mapsCar_fontForTextStyle:weight:", UIFontTextStyleFootnote, UIFontWeightMedium));
  -[UILabel setFont:](self->_etaLabel, "setFont:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  -[UILabel setTextColor:](self->_etaLabel, "setTextColor:", v14);

  -[UILabel setLineBreakMode:](self->_etaLabel, "setLineBreakMode:", 4);
  -[UILabel setNumberOfLines:](self->_etaLabel, "setNumberOfLines:", 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapsCar_fontForTextStyle:weight:](UIFont, "_mapsCar_fontForTextStyle:weight:", UIFontTextStyleCaption1, UIFontWeightRegular));
  v16 = 88;
  -[UILabel setFont:](self->_mainDescriptionLabel, "setFont:", v15);

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemPrimaryColor](UIColor, "_carSystemPrimaryColor"));
  -[UILabel setTextColor:](self->_mainDescriptionLabel, "setTextColor:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_mainDescriptionLabel, "font"));
  objc_msgSend(v18, "pointSize");
  mainDescriptionLabel = self->_mainDescriptionLabel;
  if (10.0 / v19 > 1.0)
  {
    -[UILabel setMinimumScaleFactor:](mainDescriptionLabel, "setMinimumScaleFactor:", 1.0);
  }
  else
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](mainDescriptionLabel, "font"));
    objc_msgSend(v21, "pointSize");
    -[UILabel setMinimumScaleFactor:](self->_mainDescriptionLabel, "setMinimumScaleFactor:", 10.0 / v22);

  }
  -[UILabel setAdjustsFontSizeToFitWidth:](self->_mainDescriptionLabel, "setAdjustsFontSizeToFitWidth:", 1);
  -[UILabel setLineBreakMode:](self->_mainDescriptionLabel, "setLineBreakMode:", 4);
  -[UILabel setNumberOfLines:](self->_mainDescriptionLabel, "setNumberOfLines:", 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](UIColor, "systemWhiteColor"));
  -[CarFocusableButton setNonFocusedTintColor:](self->_goButton, "setNonFocusedTintColor:", v23);

  v24 = sub_100C5548C(-[CarPlaceCardCardViewController isGoButtonEnabled](self, "isGoButtonEnabled"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  -[CarFocusableButton setNonFocusedBackgroundColor:](self->_goButton, "setNonFocusedBackgroundColor:", v25);

  v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapsCar_fontForTextStyle:weight:](UIFont, "_mapsCar_fontForTextStyle:weight:", UIFontTextStyleCallout, UIFontWeightBold));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[CarLoadingButton titleLabel](self->_goButton, "titleLabel"));
  objc_msgSend(v27, "setFont:", v26);

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[CarLoadingButton titleLabel](self->_goButton, "titleLabel"));
  objc_msgSend(v28, "setAdjustsFontSizeToFitWidth:", 1);

  v35 = (id)objc_claimAutoreleasedReturnValue(-[CarLoadingButton titleLabel](self->_goButton, "titleLabel"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "font"));
  objc_msgSend(v29, "pointSize");
  v31 = 10.0 / v30;
  v32 = 1.0;
  if (10.0 / v30 <= 1.0)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[CarLoadingButton titleLabel](self->_goButton, "titleLabel"));
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "font"));
    objc_msgSend((id)v16, "pointSize");
    v32 = 10.0 / v33;
  }
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[CarLoadingButton titleLabel](self->_goButton, "titleLabel"));
  objc_msgSend(v34, "setMinimumScaleFactor:", v32);

  if (v31 <= 1.0)
  {

  }
}

- (void)_updateMoreButton
{
  void *v3;
  void *v4;
  unsigned __int8 v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("tel:")));
  v5 = objc_msgSend(v3, "canOpenURL:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult mapItem](self->_searchResult, "mapItem"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "phoneNumber"));

  if ((v5 & (v7 != 0)) != 0)
    v8 = 3;
  else
    v8 = 1;
  if (-[CarPlaceCardCardViewController isHandoffEnabled](self, "isHandoffEnabled")
    && !-[CarPlaceCardCardViewController _shouldHideNavigationRelatedInfo](self, "_shouldHideNavigationRelatedInfo"))
  {
    v8 |= 4uLL;
  }
  -[CarMoreButton setOptions:](self->_moreButton, "setOptions:", v8);
  -[CarPlaceCardCardViewController setShouldDisplayMoreButton:](self, "setShouldDisplayMoreButton:", v8 != 1);
}

- (void)_updateConstraints
{
  void *v3;
  NSLayoutConstraint *v4;
  NSLayoutConstraint *v5;
  void *v6;
  NSLayoutConstraint *v7;
  NSLayoutConstraint *etaLabelTrailingConstraint;

  if (-[CarPlaceCardCardViewController isViewLoaded](self, "isViewLoaded"))
  {
    if (self->_etaLabelTrailingConstraint)
    {
      etaLabelTrailingConstraint = self->_etaLabelTrailingConstraint;
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &etaLabelTrailingConstraint, 1));
      +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", v3);

    }
    v4 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(-[CarPlaceCardCardViewController _createEtaLabelTrailingConstraint](self, "_createEtaLabelTrailingConstraint"));
    v5 = self->_etaLabelTrailingConstraint;
    self->_etaLabelTrailingConstraint = v4;

    v7 = self->_etaLabelTrailingConstraint;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v6);

  }
}

- (void)_updateContents
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  CarStarRatingView *ratingView;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSArray *evChargingSummaryViewConstraints;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  int64_t v28;
  void *v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  void *v33;
  id v34;
  _BOOL4 goButtonIsFocusable;
  int64_t style;
  char v37;
  id v38;
  void *v39;
  unsigned int v40;
  _BOOL4 v41;
  _QWORD block[5];

  v3 = -[CarPlaceCardCardViewController _shouldHideNavigationRelatedInfo](self, "_shouldHideNavigationRelatedInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarPlaceCardCardViewController _subtitleString](self, "_subtitleString"));
  -[CarAutohidingLabel setAttributedText:](self->_subtitleLabel, "setAttributedText:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarAutohidingLabel attributedText](self->_subtitleLabel, "attributedText"));
  -[CarAutohidingLabel setHidden:](self->_subtitleLabel, "setHidden:", objc_msgSend(v5, "length") == 0);

  if (!self->_openingHoursUpdateTimer)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarPlaceCardCardViewController mapItem](self, "mapItem"));
    v7 = objc_msgSend(v6, "_hasBusinessHours");

    if (v7)
      -[CarPlaceCardCardViewController _scheduleOpeningHoursUpdate](self, "_scheduleOpeningHoursUpdate");
  }
  ratingView = self->_ratingView;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarPlaceCardCardViewController mapItem](self, "mapItem"));
  -[CarStarRatingView setupWithMapItem:](ratingView, "setupWithMapItem:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarPlaceCardCardViewController mapItem](self, "mapItem"));
  -[CarStarRatingView setHidden:](self->_ratingView, "setHidden:", objc_msgSend(v10, "_hasUserRatingScore") ^ 1);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarPlaceCardCardViewController mapItem](self, "mapItem"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "_addressFormattedAsShortenedAddress"));
  -[CarAutohidingLabel setText:](self->_addressLabel, "setText:", v12);

  if (!-[CarPlaceCardCardViewController _shouldShowEVViewsInline](self, "_shouldShowEVViewsInline"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CarPlaceCardCardViewController evChargingViewModel](self, "evChargingViewModel"));
    v14 = objc_msgSend(v13, "hasSummaryInfo");

    if ((v14 & 1) != 0)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[CarPlaceCardCardViewController evChargingViewModel](self, "evChargingViewModel"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "summaryTitle"));
      -[UILabel setText:](self->_evChargingTitleLabel, "setText:", v16);

      v17 = (void *)objc_claimAutoreleasedReturnValue(-[CarPlaceCardCardViewController evChargingViewModel](self, "evChargingViewModel"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "summaryDescription"));
      -[UILabel setAttributedText:](self->_evChargingAvailabilityLabel, "setAttributedText:", v18);

      v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithTextStyle:](UIImageSymbolConfiguration, "configurationWithTextStyle:", UIFontTextStyleFootnote));
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[MUEVChargingHelper evPlugIconWithConfiguration:](MUEVChargingHelper, "evPlugIconWithConfiguration:", v19));

      -[CarCardRoundedButton setImage:forState:](self->_evChargingMoreButton, "setImage:forState:", v20, 0);
    }
    -[UILabel setHidden:](self->_evChargingTitleLabel, "setHidden:", v14 ^ 1);
    -[UILabel setHidden:](self->_evChargingAvailabilityLabel, "setHidden:", v14 ^ 1);
    -[CarCardRoundedButton setHidden:](self->_evChargingMoreButton, "setHidden:", v14 ^ 1);
    if (-[NSArray count](self->_evChargingSummaryViewConstraints, "count"))
    {
      evChargingSummaryViewConstraints = self->_evChargingSummaryViewConstraints;
      if (v14)
        +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", evChargingSummaryViewConstraints);
      else
        +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", evChargingSummaryViewConstraints);
    }
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CarPlaceCardCardViewController _sharingETAString](self, "_sharingETAString"));
  -[CarAutohidingLabel setText:](self->_sharingETALabel, "setText:", v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CarAutohidingLabel attributedText](self->_sharingETALabel, "attributedText"));
  -[CarAutohidingLabel setHidden:](self->_sharingETALabel, "setHidden:", objc_msgSend(v23, "length") == 0);

  -[CarPlaceCardCardViewController _updateETA](self, "_updateETA");
  if (!self->_etaUpdateTimer && !-[CarPlaceCardCardViewController style](self, "style"))
    -[CarPlaceCardCardViewController _scheduleETAUpdate](self, "_scheduleETAUpdate");
  -[CarPlaceCardCardViewController _updateETARelatedContents](self, "_updateETARelatedContents");
  -[UILabel setHidden:](self->_etaLabel, "setHidden:", v3);
  -[UILabel setHidden:](self->_mainDescriptionLabel, "setHidden:", v3);
  -[CarPlaceCardCardViewController _updateMoreButton](self, "_updateMoreButton");
  -[CarMoreButton setHidden:](self->_moreButton, "setHidden:", -[CarPlaceCardCardViewController shouldDisplayMoreButton](self, "shouldDisplayMoreButton") ^ 1);
  if (-[CarPlaceCardCardViewController isLoading](self, "isLoading"))
  {
    -[CarLoadingButton setTitle:forState:](self->_goButton, "setTitle:forState:", 0, 0);
    -[CarLoadingButton setImage:forState:](self->_goButton, "setImage:forState:", 0, 0);
  }
  else
  {
    if (-[CarPlaceCardCardViewController isNavigationAidedDrivingEnabled](self, "isNavigationAidedDrivingEnabled"))
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[MapsExternalDevice sharedInstance](MapsExternalDevice, "sharedInstance"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "mapsDisplayName"));
      v26 = v25;
      if (v25)
      {
        v27 = v25;
      }
      else
      {
        v34 = sub_10076027C();
        v27 = (id)objc_claimAutoreleasedReturnValue(v34);
      }
      v32 = v27;

      -[CarLoadingButton setTitle:forState:](self->_goButton, "setTitle:forState:", v32, 0);
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _mapsCar_systemImageNamed:](UIImage, "_mapsCar_systemImageNamed:", CFSTR("square.and.arrow.up")));
    }
    else
    {
      v28 = -[CarPlaceCardCardViewController style](self, "style");
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v30 = v29;
      if (v28 == 1)
        v31 = CFSTR("Car_ADD_STOP_BUTTON");
      else
        v31 = CFSTR("Car_START_BUTTON");
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "localizedStringForKey:value:table:", v31, CFSTR("localized string not found"), 0));

      v33 = 0;
      if ((id)-[CarPlaceCardCardViewController style](self, "style") == (id)1)
        v33 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("plus.circle.fill")));
      -[CarLoadingButton setTitle:forState:](self->_goButton, "setTitle:forState:", v32, 0);
    }
    -[CarLoadingButton setImage:forState:](self->_goButton, "setImage:forState:", v33, 0);

  }
  goButtonIsFocusable = self->_goButtonIsFocusable;
  -[CarLoadingButton setLoading:](self->_goButton, "setLoading:", -[CarPlaceCardCardViewController isLoading](self, "isLoading"));
  -[CarLoadingButton setHidden:](self->_goButton, "setHidden:", -[CarPlaceCardCardViewController isGoButtonHidden](self, "isGoButtonHidden"));
  -[CarFocusableButton setEnabled:](self->_goButton, "setEnabled:", -[CarPlaceCardCardViewController isGoButtonEnabled](self, "isGoButtonEnabled"));
  style = self->_style;
  v37 = -[CarLoadingButton isEnabled](self->_goButton, "isEnabled");
  if (style == 1)
    v38 = sub_100C554E4(v37);
  else
    v38 = sub_100C5548C(v37);
  v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
  -[CarFocusableButton setNonFocusedBackgroundColor:](self->_goButton, "setNonFocusedBackgroundColor:", v39);

  if (-[CarPlaceCardCardViewController _isGoButtonFocusable](self, "_isGoButtonFocusable"))
  {
    v40 = -[CarPlaceCardCardViewController _canSafelyRequestFocusUpdate](self, "_canSafelyRequestFocusUpdate");
    if (!goButtonIsFocusable)
    {
      if (v40)
      {
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1005F751C;
        block[3] = &unk_1011AC860;
        block[4] = self;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
      }
    }
  }
  v41 = -[CarPlaceCardCardViewController _isGoButtonFocusable](self, "_isGoButtonFocusable");
  if (v41)
    LOBYTE(v41) = -[CarPlaceCardCardViewController _canSafelyRequestFocusUpdate](self, "_canSafelyRequestFocusUpdate");
  self->_goButtonIsFocusable = v41;
  -[CarPlaceCardCardViewController _updateRouteAdvisoriesStack](self, "_updateRouteAdvisoriesStack");
}

- (void)_updateRouteAdvisoriesStack
{
  void *v3;
  char v4;
  CarAdvisoriesView *routeAdvisoriesView;
  void *v6;
  void *v7;
  _BOOL8 v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarPlaceCardCardViewController dataSource](self, "dataSource"));
  v4 = objc_opt_respondsToSelector(v3, "currentRoute");

  if ((v4 & 1) != 0)
  {
    routeAdvisoriesView = self->_routeAdvisoriesView;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarPlaceCardCardViewController dataSource](self, "dataSource"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentRoute"));
    -[CarAdvisoriesView setRoute:](routeAdvisoriesView, "setRoute:", v7);

    if (-[CarAdvisoriesView count](self->_routeAdvisoriesView, "count"))
      v8 = -[CarPlaceCardCardViewController _shouldHideNavigationRelatedInfo](self, "_shouldHideNavigationRelatedInfo");
    else
      v8 = 1;
    -[NSLayoutConstraint setActive:](self->_routeAdvisoriesHeightConstraint, "setActive:", v8);
    -[CarAdvisoriesView setHidden:](self->_routeAdvisoriesView, "setHidden:", v8);
  }
}

- (void)_updateETARelatedContents
{
  int64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  GuidanceETA *latestETA;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  id v17;

  v3 = -[CarPlaceCardCardViewController style](self, "style");
  if (v3 == 1)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarPlaceCardCardViewController mapItem](self, "mapItem"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_maps_detourTextForIdiom:", 3));
    -[UILabel setText:](self->_etaLabel, "setText:", v9);

    latestETA = self->_latestETA;
    if (latestETA)
    {
      -[GuidanceETA remainingDistance](latestETA, "remainingDistance");
      v17 = (id)objc_claimAutoreleasedReturnValue(+[NSString _navigation_localizedStringForDistance:detail:unitFormat:locale:useMetric:useYards:](NSString, "_navigation_localizedStringForDistance:detail:unitFormat:locale:useMetric:useYards:", 0, 1, 0, 0, 0));
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("%@ miles away"), CFSTR("localized string not found"), 0));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v12, v17));
      -[UILabel setText:](self->_mainDescriptionLabel, "setText:", v13);

LABEL_11:
      return;
    }
    goto LABEL_12;
  }
  if (!v3)
  {
    if (self->_latestETA)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("00:00 ETA [CarPlay]"), CFSTR("localized string not found"), 0));
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceETA etaDateStringWithAMPMSymbol:allowTimeZone:](self->_latestETA, "etaDateStringWithAMPMSymbol:allowTimeZone:", 0, 0));
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, v6));
      -[UILabel setText:](self->_etaLabel, "setText:", v7);

    }
    else
    {
      -[UILabel setText:](self->_etaLabel, "setText:", 0);
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CarPlaceCardCardViewController dataSource](self, "dataSource"));
    v15 = objc_opt_respondsToSelector(v14, "routeMainDescriptionText");

    if ((v15 & 1) != 0)
    {
      v17 = (id)objc_claimAutoreleasedReturnValue(-[CarPlaceCardCardViewController dataSource](self, "dataSource"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "routeMainDescriptionText"));
      -[UILabel setText:](self->_mainDescriptionLabel, "setText:", v16);

      goto LABEL_11;
    }
LABEL_12:
    -[UILabel setText:](self->_mainDescriptionLabel, "setText:", 0);
  }
}

- (void)_captureAnalytics
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;

  v3 = sub_10043364C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarPlaceCardCardViewController mapItem](self, "mapItem"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "name"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarPlaceCardCardViewController mapItem](self, "mapItem"));
    v10 = 138478083;
    v11 = v6;
    v12 = 2049;
    v13 = objc_msgSend(v7, "_muid");
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "CarPlaceCard: placecard loaded and displayed with mapItem: (name: %{private}@, muid: %{private}llu)", (uint8_t *)&v10, 0x16u);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "chromeViewController"));
  objc_msgSend(v9, "captureUserAction:", 21);

}

- (void)setSearchResult:(id)a3
{
  SearchResult *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;

  v5 = (SearchResult *)a3;
  if (self->_searchResult != v5)
  {
    objc_storeStrong((id *)&self->_searchResult, a3);
    v6 = sub_10043364C();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarPlaceCardCardViewController mapItem](self, "mapItem"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "name"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarPlaceCardCardViewController mapItem](self, "mapItem"));
      v11 = 138478083;
      v12 = v9;
      v13 = 2049;
      v14 = objc_msgSend(v10, "_muid");
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "CarPlaceCard: placecard changed searchResult with mapItem: (name: %{private}@, muid: %{private}llu)", (uint8_t *)&v11, 0x16u);

    }
    -[CarPlaceCardCardViewController _initializeGoButtonState](self, "_initializeGoButtonState");
    -[CarPlaceCardCardViewController _updateContents](self, "_updateContents");
  }

}

- (MKMapItem)mapItem
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CarPlaceCardCardViewController searchResult](self, "searchResult"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "mapItem"));

  return (MKMapItem *)v3;
}

- (_MKLocalizedHoursBuilder)localizedHoursBuilder
{
  _MKLocalizedHoursBuilder *localizedHoursBuilder;
  id v4;
  void *v5;
  _MKLocalizedHoursBuilder *v6;
  _MKLocalizedHoursBuilder *v7;

  localizedHoursBuilder = self->_localizedHoursBuilder;
  if (!localizedHoursBuilder)
  {
    v4 = objc_alloc((Class)_MKLocalizedHoursBuilder);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarPlaceCardCardViewController mapItem](self, "mapItem"));
    v6 = (_MKLocalizedHoursBuilder *)objc_msgSend(v4, "initWithMapItem:localizedHoursStringOptions:", v5, 41);
    v7 = self->_localizedHoursBuilder;
    self->_localizedHoursBuilder = v6;

    localizedHoursBuilder = self->_localizedHoursBuilder;
  }
  return localizedHoursBuilder;
}

- (void)setShouldDisplayMoreButton:(BOOL)a3
{
  if (self->_shouldDisplayMoreButton != a3)
  {
    self->_shouldDisplayMoreButton = a3;
    -[CarPlaceCardCardViewController _updateConstraints](self, "_updateConstraints");
  }
}

- (void)setHasCardFinishedTransitioning:(BOOL)a3
{
  if (self->_hasCardFinishedTransitioning != a3)
  {
    self->_hasCardFinishedTransitioning = a3;
    if (a3)
      -[CarPlaceCardCardViewController _updateContents](self, "_updateContents");
  }
}

- (void)setLoading:(BOOL)a3
{
  id v4;
  NSObject *v5;
  __CFString *v6;
  __CFString *v7;
  int v8;
  __CFString *v9;

  if (self->_loading != a3)
  {
    self->_loading = a3;
    v4 = sub_10043364C();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      if (self->_loading)
        v6 = CFSTR("YES");
      else
        v6 = CFSTR("NO");
      v7 = v6;
      v8 = 138412290;
      v9 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "CarPlaceCard: setLoading: %@", (uint8_t *)&v8, 0xCu);

    }
    -[CarPlaceCardCardViewController _updateContents](self, "_updateContents");
  }
}

- (void)setGoButtonHidden:(BOOL)a3
{
  id v4;
  NSObject *v5;
  __CFString *v6;
  __CFString *v7;
  int v8;
  __CFString *v9;

  if (self->_goButtonHidden != a3)
  {
    self->_goButtonHidden = a3;
    v4 = sub_10043364C();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      if (self->_goButtonHidden)
        v6 = CFSTR("YES");
      else
        v6 = CFSTR("NO");
      v7 = v6;
      v8 = 138412290;
      v9 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "CarPlaceCard: setGoButtonHidden: %@", (uint8_t *)&v8, 0xCu);

    }
    -[CarPlaceCardCardViewController _updateContents](self, "_updateContents");
  }
}

- (void)setGoButtonEnabled:(BOOL)a3
{
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  __CFString *v8;
  __CFString *v9;
  int v10;
  __CFString *v11;

  if (self->_goButtonEnabled != a3)
  {
    self->_goButtonEnabled = a3;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "chromeViewController"));
    objc_msgSend(v5, "setNeedsFocusUpdate");

    v6 = sub_10043364C();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      if (self->_goButtonEnabled)
        v8 = CFSTR("YES");
      else
        v8 = CFSTR("NO");
      v9 = v8;
      v10 = 138412290;
      v11 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "CarPlaceCard: setGoButtonEnabled: %@", (uint8_t *)&v10, 0xCu);

    }
    +[PPTNotificationCenter postNotificationIfNeededWithName:object:userInfo:](PPTNotificationCenter, "postNotificationIfNeededWithName:object:userInfo:", CFSTR("CarPlaceCardCardViewControllerDidLoadRouteNotification"), self, 0);
    -[CarPlaceCardCardViewController _updateContents](self, "_updateContents");
  }
}

- (void)setNavigationAidedDrivingEnabled:(BOOL)a3
{
  id v4;
  NSObject *v5;
  __CFString *v6;
  __CFString *v7;
  int v8;
  __CFString *v9;

  if (self->_navigationAidedDrivingEnabled != a3)
  {
    self->_navigationAidedDrivingEnabled = a3;
    v4 = sub_10043364C();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      if (self->_navigationAidedDrivingEnabled)
        v6 = CFSTR("YES");
      else
        v6 = CFSTR("NO");
      v7 = v6;
      v8 = 138412290;
      v9 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "CarPlaceCard: setNavigationAidedDrivingEnabled %@", (uint8_t *)&v8, 0xCu);

    }
    if (self->_navigationAidedDrivingEnabled)
      -[CarPlaceCardCardViewController setGoButtonHidden:](self, "setGoButtonHidden:", 0);
    -[CarPlaceCardCardViewController _updateContents](self, "_updateContents");
  }
}

- (void)setHandoffEnabled:(BOOL)a3
{
  id v4;
  NSObject *v5;
  __CFString *v6;
  __CFString *v7;
  int v8;
  __CFString *v9;

  if (self->_handoffEnabled != a3)
  {
    self->_handoffEnabled = a3;
    v4 = sub_10043364C();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      if (self->_handoffEnabled)
        v6 = CFSTR("YES");
      else
        v6 = CFSTR("NO");
      v7 = v6;
      v8 = 138412290;
      v9 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "CarPlaceCard: setHandoffEnabled: %@", (uint8_t *)&v8, 0xCu);

    }
    -[CarPlaceCardCardViewController _updateContents](self, "_updateContents");
  }
}

- (int64_t)titleNumberOfLines
{
  if (-[CarAdvisoriesView count](self->_routeAdvisoriesView, "count") > 1)
    return 1;
  else
    return 3;
}

- (BOOL)_isGoButtonFocusable
{
  if (!-[CarPlaceCardCardViewController isViewLoaded](self, "isViewLoaded")
    || -[CarLoadingButton isLoading](self->_goButton, "isLoading")
    || (-[CarLoadingButton isHidden](self->_goButton, "isHidden") & 1) != 0)
  {
    return 0;
  }
  else
  {
    return -[CarLoadingButton isEnabled](self->_goButton, "isEnabled");
  }
}

- (BOOL)_canSafelyRequestFocusUpdate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v11;

  if (!-[CarPlaceCardCardViewController isViewLoaded](self, "isViewLoaded"))
    return 0;
  if (!-[CarPlaceCardCardViewController hasCardFinishedTransitioning](self, "hasCardFinishedTransitioning"))
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarPlaceCardCardViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "window"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rootViewController"));

  if (!v5)
    return 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarPlaceCardCardViewController view](self, "view"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "superview"));
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarPlaceCardCardViewController traitCollection](self, "traitCollection"));
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen _carScreen](UIScreen, "_carScreen"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "traitCollection"));

  }
  v9 = ((unint64_t)objc_msgSend(v8, "interactionModel") & 0xA) != 0;

  return v9;
}

- (void)_cancelScheduleETAUpdate
{
  id v3;
  NSObject *v4;
  NSTimer *etaUpdateTimer;
  NSTimer *v6;
  uint8_t v7[16];

  v3 = sub_10043364C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "CarPlaceCard: canceling ETA update timer", v7, 2u);
  }

  etaUpdateTimer = self->_etaUpdateTimer;
  if (etaUpdateTimer)
  {
    -[NSTimer invalidate](etaUpdateTimer, "invalidate");
    v6 = self->_etaUpdateTimer;
    self->_etaUpdateTimer = 0;

  }
}

- (void)_scheduleETAUpdate
{
  id v3;
  NSObject *v4;
  NSTimer *v5;
  NSTimer *etaUpdateTimer;
  uint8_t v7[16];

  v3 = sub_10043364C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "CarPlaceCard: scheduling ETA update timer", v7, 2u);
  }

  if (!self->_etaUpdateTimer)
  {
    v5 = (NSTimer *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "_updateETA", 0, 1, 15.0));
    etaUpdateTimer = self->_etaUpdateTimer;
    self->_etaUpdateTimer = v5;

  }
}

- (void)_updateETA
{
  void *v3;
  GuidanceETA *v4;
  GuidanceETA *latestETA;
  id v6;
  NSObject *v7;
  unint64_t v8;
  int v9;
  unint64_t v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarPlaceCardCardViewController dataSource](self, "dataSource"));
  v4 = (GuidanceETA *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "etaForCurrentRoute"));
  latestETA = self->_latestETA;
  self->_latestETA = v4;

  v6 = sub_10043364C();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = -[GuidanceETA remainingMinutes](self->_latestETA, "remainingMinutes");
    v9 = 134217984;
    v10 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "CarPlaceCard: eta update timer fired. new ETA remainingMinutes: %lu", (uint8_t *)&v9, 0xCu);
  }

  -[CarPlaceCardCardViewController _updateETARelatedContents](self, "_updateETARelatedContents");
  if (!self->_latestETA)
    -[CarPlaceCardCardViewController _cancelScheduleETAUpdate](self, "_cancelScheduleETAUpdate");
}

- (void)_scheduleOpeningHoursUpdate
{
  NSTimer *v3;
  NSTimer *openingHoursUpdateTimer;

  if (!self->_openingHoursUpdateTimer)
  {
    v3 = (NSTimer *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "_updateOpeningHours", 0, 1, 900.0));
    openingHoursUpdateTimer = self->_openingHoursUpdateTimer;
    self->_openingHoursUpdateTimer = v3;

  }
}

- (void)_updateOpeningHours
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
  NSObject *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarPlaceCardCardViewController mapItem](self, "mapItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_businessHours"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndex:", 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarPlaceCardCardViewController mapItem](self, "mapItem"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "timeZone"));
  v9 = +[GEOMapItemOpenState _geoMapItemOpeningHoursOptionsForBusinessHours:compareDate:timeZone:](GEOMapItemOpenState, "_geoMapItemOpeningHoursOptionsForBusinessHours:compareDate:timeZone:", v5, v6, v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarPlaceCardCardViewController localizedHoursBuilder](self, "localizedHoursBuilder"));
  objc_msgSend(v10, "setGeoMapItemOpeningHourOptions:", v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarPlaceCardCardViewController _subtitleString](self, "_subtitleString"));
  -[CarAutohidingLabel setAttributedText:](self->_subtitleLabel, "setAttributedText:", v11);

  v12 = sub_10043364C();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CarAutohidingLabel attributedText](self->_subtitleLabel, "attributedText"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "string"));
    v16 = 138412290;
    v17 = v15;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "CarPlaceCard: updating opening hours to: %@", (uint8_t *)&v16, 0xCu);

  }
}

- (id)_visibleButtons
{
  void *v3;
  CarCardRoundedButton *evChargingMoreButton;
  id v5;

  if (-[CarPlaceCardCardViewController isViewLoaded](self, "isViewLoaded"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    if ((-[CarMoreButton isHidden](self->_moreButton, "isHidden") & 1) == 0)
      objc_msgSend(v3, "addObject:", self->_moreButton);
    if (-[CarPlaceCardCardViewController _isGoButtonFocusable](self, "_isGoButtonFocusable"))
      objc_msgSend(v3, "addObject:", self->_goButton);
    evChargingMoreButton = self->_evChargingMoreButton;
    if (evChargingMoreButton
      && (-[CarCardRoundedButton isHidden](evChargingMoreButton, "isHidden") & 1) == 0)
    {
      objc_msgSend(v3, "addObject:", self->_evChargingMoreButton);
    }
    v5 = objc_msgSend(v3, "copy");

  }
  else
  {
    v5 = &__NSArray0__struct;
  }
  return v5;
}

- (id)_attributesForPlainSubtitleString
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[2];

  v6[0] = NSFontAttributeName;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapsCar_fontForTextStyle:weight:](UIFont, "_mapsCar_fontForTextStyle:weight:", UIFontTextStyleCaption2, UIFontWeightRegular));
  v7[0] = v2;
  v6[1] = NSForegroundColorAttributeName;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  v7[1] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v7, v6, 2));

  return v4;
}

- (id)_subtitleString
{
  void *v3;
  unsigned int v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarPlaceCardCardViewController mapItem](self, "mapItem"));
  v4 = objc_msgSend(v3, "_hasChargerNumberString");

  if (v4)
  {
    v5 = objc_alloc((Class)NSAttributedString);
    v6 = (id)objc_claimAutoreleasedReturnValue(-[CarPlaceCardCardViewController mapItem](self, "mapItem"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_chargerNumberString"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarPlaceCardCardViewController _attributesForPlainSubtitleString](self, "_attributesForPlainSubtitleString"));
    v9 = objc_msgSend(v5, "initWithString:attributes:", v7, v8);

  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarPlaceCardCardViewController _localizedHours](self, "_localizedHours"));
    if (v10)
    {
      v6 = v10;
      v9 = v6;
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarPlaceCardCardViewController mapItem](self, "mapItem"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "_firstLocalizedCategoryName"));
      v13 = objc_msgSend(v12, "length");

      if (v13)
      {
        v14 = objc_alloc((Class)NSAttributedString);
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[CarPlaceCardCardViewController mapItem](self, "mapItem"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "_firstLocalizedCategoryName"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[CarPlaceCardCardViewController _attributesForPlainSubtitleString](self, "_attributesForPlainSubtitleString"));
        v9 = objc_msgSend(v14, "initWithString:attributes:", v16, v17);

        v6 = 0;
      }
      else
      {
        v6 = 0;
        v9 = 0;
      }
    }
  }

  return v9;
}

- (id)_sharingETAString
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CarPlaceCardCardViewController dataSource](self, "dataSource"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "automaticSharingContacts"));

  if (objc_msgSend(v3, "count"))
  {
    if (objc_msgSend(v3, "count") == (id)1)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contact"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "givenName"));

      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("CarPlay_PlaceCard_SharingAutomatically_OneContact"), CFSTR("localized string not found"), 0));
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, v6));

    }
    else
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("CarPlay_PlaceCard_SharingAutomatically"), CFSTR("localized string not found"), 0));
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v6, objc_msgSend(v3, "count")));
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_localizedHours
{
  void *v3;
  unsigned int v4;
  void *v5;
  id v6;
  void *v7;
  unsigned __int8 v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v15;
  void *v16;
  _QWORD v17[2];
  _QWORD v18[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarPlaceCardCardViewController mapItem](self, "mapItem"));
  v4 = objc_msgSend(v3, "_hasBusinessHours");

  if (!v4)
    return 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarPlaceCardCardViewController localizedHoursBuilder](self, "localizedHoursBuilder"));
  v6 = (id)((unint64_t)objc_msgSend(v5, "geoMapItemOpeningHourOptions") & 0x1CC);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarPlaceCardCardViewController localizedHoursBuilder](self, "localizedHoursBuilder"));
  v8 = objc_msgSend(v7, "geoMapItemOpeningHourOptions");

  if (v6)
  {
    v9 = objc_alloc((Class)NSAttributedString);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarPlaceCardCardViewController localizedHoursBuilder](self, "localizedHoursBuilder"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedOperatingHours"));
    v17[0] = NSFontAttributeName;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapsCar_fontForTextStyle:weight:](UIFont, "_mapsCar_fontForTextStyle:weight:", UIFontTextStyleCaption2, UIFontWeightRegular));
    v18[0] = v12;
    v17[1] = NSForegroundColorAttributeName;
    if ((v8 & 0x40) != 0)
      v13 = objc_claimAutoreleasedReturnValue(+[UIColor systemOrangeColor](UIColor, "systemOrangeColor"));
    else
      v13 = objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));
    v15 = (void *)v13;
    v18[1] = v13;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v18, v17, 2));
    v6 = objc_msgSend(v9, "initWithString:attributes:", v11, v16);

  }
  return v6;
}

- (id)_createEtaLabelTrailingConstraint
{
  unsigned int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = -[CarPlaceCardCardViewController shouldDisplayMoreButton](self, "shouldDisplayMoreButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_etaLabel, "trailingAnchor"));
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarMoreButton leadingAnchor](self->_moreButton, "leadingAnchor"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintLessThanOrEqualToAnchor:constant:", v5, -10.0));
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarPlaceCardCardViewController view](self, "view"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "trailingAnchor"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintEqualToAnchor:constant:", v7, -10.0));

  }
  return v6;
}

- (id)_createAutohidingTextlabelWithVerticalCompressionResistancePriority:(float)a3
{
  CarAutohidingLabel *v4;
  double v5;
  double v6;

  v4 = -[CarAutohidingLabel initWithFrame:]([CarAutohidingLabel alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[CarAutohidingLabel setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  *(float *)&v5 = a3;
  -[CarAutohidingLabel setContentCompressionResistancePriority:forAxis:](v4, "setContentCompressionResistancePriority:forAxis:", 1, v5);
  LODWORD(v6) = 1148846080;
  -[CarAutohidingLabel setContentHuggingPriority:forAxis:](v4, "setContentHuggingPriority:forAxis:", 1, v6);
  return v4;
}

- (void)_presentMoreOptions
{
  void *v3;
  id v4;
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
  id v22;
  id v23;
  uint64_t v24;
  void *v25;
  id v26;
  NSObject *v27;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[4];
  id v40;
  _QWORD v41[4];
  id v42;
  id location;
  uint8_t buf[4];
  id v45;
  _BYTE v46[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", 0, 0, 0));
  objc_msgSend(v3, "setModalPresentationStyle:", 5);
  objc_initWeak(&location, self);
  v4 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 3);
  if ((-[CarMoreButton options](self->_moreButton, "options") & 2) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Call [CarPlay]"), CFSTR("localized string not found"), 0));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarPlaceCardCardViewController mapItem](self, "mapItem"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v6, v8));

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _mapsCar_systemImageNamed:textStyle:](UIImage, "_mapsCar_systemImageNamed:textStyle:", CFSTR("phone.fill"), UIFontTextStyleTitle3));
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_1005F9500;
    v41[3] = &unk_1011AFA88;
    objc_copyWeak(&v42, &location);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[CarAlertAction actionWithTitle:image:handler:](CarAlertAction, "actionWithTitle:image:handler:", v9, v10, v41));

    objc_msgSend(v4, "addObject:", v11);
    objc_destroyWeak(&v42);

  }
  if ((-[CarMoreButton options](self->_moreButton, "options") & 4) != 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[MapsExternalDevice sharedInstance](MapsExternalDevice, "sharedInstance"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "mapsDisplayName"));

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    if (v13)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("Share destination [CarPlay]"), CFSTR("localized string not found"), 0));
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v15, v13));

    }
    else
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("Share destination to unknown headunit [CarPlay]"), CFSTR("localized string not found"), 0));
    }

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _mapsCar_systemImageNamed:textStyle:](UIImage, "_mapsCar_systemImageNamed:textStyle:", CFSTR("square.and.arrow.up"), UIFontTextStyleTitle3));
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_1005F9574;
    v39[3] = &unk_1011AFA88;
    objc_copyWeak(&v40, &location);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[CarAlertAction actionWithTitle:image:handler:](CarAlertAction, "actionWithTitle:image:handler:", v16, v17, v39));

    objc_msgSend(v4, "addObject:", v18);
    objc_destroyWeak(&v40);

  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("Cancel [CarPlay, No Route]"), CFSTR("localized string not found"), 0));
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_1005F9618;
  v37[3] = &unk_1011AFA88;
  objc_copyWeak(&v38, &location);
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v20, 1, v37));

  objc_msgSend(v4, "addObject:", v21);
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v22 = v4;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v33, v46, 16);
  if (v23)
  {
    v24 = *(_QWORD *)v34;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v34 != v24)
          objc_enumerationMutation(v22);
        objc_msgSend(v3, "addAction:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)v25));
        v25 = (char *)v25 + 1;
      }
      while (v23 != v25);
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v33, v46, 16);
    }
    while (v23);
  }

  v26 = sub_10043364C();
  v27 = objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    v28 = objc_msgSend(v22, "count");
    *(_DWORD *)buf = 134217984;
    v45 = v28;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "Presenting actionSheet with %ld options.", buf, 0xCu);
  }

  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_1005F9678;
  v30[3] = &unk_1011AD1E8;
  objc_copyWeak(&v32, &location);
  v29 = v3;
  v31 = v29;
  -[CarPlaceCardCardViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v29, 1, v30);

  objc_destroyWeak(&v32);
  objc_destroyWeak(&v38);

  objc_destroyWeak(&location);
}

- (void)_callDestination
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult mapItem](self->_searchResult, "mapItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "phoneNumber"));

  if (v4 && objc_msgSend(v4, "length"))
  {
    sub_1005F98A0(v4);
  }
  else if (-[SearchResult isAddressBookResult](self->_searchResult, "isAddressBookResult"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult address](self->_searchResult, "address"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contact"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "phoneNumbers"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "value"));

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringValue"));
    sub_1005F98A0(v10);

  }
  else
  {
    v11 = sub_10043364C();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult mapItem](self->_searchResult, "mapItem"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "phoneNumber"));
      v16 = 138412290;
      v17 = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "CarPlaceCard tried to call POI, but failed. Number: %@", (uint8_t *)&v16, 0xCu);

    }
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CarPlaceCardCardViewController delegate](self, "delegate"));
  objc_msgSend(v15, "placeCardDidSelectCall:", self);

}

- (BOOL)_shouldHideNavigationRelatedInfo
{
  unsigned int v3;
  void *v4;

  if (-[CarPlaceCardCardViewController isNavigationAidedDrivingEnabled](self, "isNavigationAidedDrivingEnabled")
    || -[CarPlaceCardCardViewController isGoButtonHidden](self, "isGoButtonHidden"))
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
    v3 = objc_msgSend(v4, "isAuthorizedForPreciseLocation") ^ 1;

  }
  return v3;
}

- (id)_createEVChargingViewModel
{
  void *v3;
  _TtC4Maps31CarPlaceCardEVChargingViewModel *v4;
  void *v5;
  void *v6;
  _TtC4Maps31CarPlaceCardEVChargingViewModel *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarPlaceCardCardViewController mapItem](self, "mapItem"));

  if (v3)
  {
    v4 = [_TtC4Maps31CarPlaceCardEVChargingViewModel alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarPlaceCardCardViewController mapItem](self, "mapItem"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[VGVirtualGarageService sharedService](VGVirtualGarageService, "sharedService"));
    v7 = -[CarPlaceCardEVChargingViewModel initWithMapItem:virtualGarageService:](v4, "initWithMapItem:virtualGarageService:", v5, v6);

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (BOOL)_shouldShowEVViewsInline
{
  void *v2;
  void *v3;
  double v4;
  BOOL v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen _carScreen](UIScreen, "_carScreen"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "currentMode"));
  objc_msgSend(v3, "size");
  v5 = v4 >= 1000.0;

  return v5;
}

- (void)_moreButtonPressed:(id)a3
{
  id v4;
  NSObject *v5;
  unint64_t v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  unint64_t v11;

  v4 = sub_10043364C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = -[CarMoreButton options](self->_moreButton, "options");
    v10 = 134217984;
    v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "CarPlaceCard 'More' button pressed with options: %lu", (uint8_t *)&v10, 0xCu);
  }

  if ((~-[CarMoreButton options](self->_moreButton, "options") & 6) != 0)
  {
    if ((-[CarMoreButton options](self->_moreButton, "options") & 2) != 0)
    {
      -[CarPlaceCardCardViewController _callDestination](self, "_callDestination");
    }
    else if ((-[CarMoreButton options](self->_moreButton, "options") & 4) != 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarPlaceCardCardViewController delegate](self, "delegate"));
      objc_msgSend(v9, "placeCardDidSelectHandoff:", self);

    }
    else
    {
      v7 = sub_10043364C();
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v10) = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "CarPlaceCard: pressed _moreButton with invalid options", (uint8_t *)&v10, 2u);
      }

    }
  }
  else
  {
    -[CarPlaceCardCardViewController _presentMoreOptions](self, "_presentMoreOptions");
  }
}

- (void)startNavigation
{
  -[CarPlaceCardCardViewController _goButtonPressed:](self, "_goButtonPressed:", 0);
}

- (void)_goButtonPressed:(id)a3
{
  unsigned int v4;
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  uint8_t v9[16];
  uint8_t buf[16];

  v4 = -[CarPlaceCardCardViewController isNavigationAidedDrivingEnabled](self, "isNavigationAidedDrivingEnabled", a3);
  v5 = sub_10043364C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "CarPlaceCard go button pressed, NAD active -> handing off", buf, 2u);
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarPlaceCardCardViewController delegate](self, "delegate"));
    objc_msgSend(v8, "placeCardDidSelectHandoff:", self);
  }
  else
  {
    if (v7)
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "CarPlaceCard go button pressed, NAD inactive -> starting nav", v9, 2u);
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarPlaceCardCardViewController delegate](self, "delegate"));
    objc_msgSend(v8, "placeCardDidSelectGo:", self);
  }

}

- (void)_evChargingMoreButtonPressed:(id)a3
{
  id v4;
  NSObject *v5;
  _TtC4Maps39CarEVChargingAvailabilityViewController *v6;
  uint64_t v7;
  _TtC4Maps39CarEVChargingAvailabilityViewController *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t v13[16];

  v4 = sub_10043364C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "CarPlaceCard EVCharging More button pressed", v13, 2u);
  }

  if (!-[CarPlaceCardCardViewController _shouldShowEVViewsInline](self, "_shouldShowEVViewsInline"))
  {
    v6 = [_TtC4Maps39CarEVChargingAvailabilityViewController alloc];
    v7 = objc_claimAutoreleasedReturnValue(-[CarPlaceCardCardViewController evChargingViewModel](self, "evChargingViewModel"));
    v8 = -[CarEVChargingAvailabilityViewController initWithViewModal:](v6, "initWithViewModal:", v7);
    -[CarPlaceCardCardViewController setEvChargingAvailabilityVC:](self, "setEvChargingAvailabilityVC:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarPlaceCardCardViewController evChargingAvailabilityVC](self, "evChargingAvailabilityVC"));
    objc_msgSend(v9, "configureForModalPresentation");

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarPlaceCardCardViewController delegate](self, "delegate"));
    LOBYTE(v7) = objc_opt_respondsToSelector(v10, "placeCard:wantsToPresentEVAvailability:");

    if ((v7 & 1) != 0)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarPlaceCardCardViewController delegate](self, "delegate"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[CarPlaceCardCardViewController evChargingAvailabilityVC](self, "evChargingAvailabilityVC"));
      objc_msgSend(v11, "placeCard:wantsToPresentEVAvailability:", self, v12);

    }
  }
}

- (void)_externalDeviceUpdated:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  v4 = sub_10043364C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "CarPlaceCard _externalDeviceUpdated", v8, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MapsExternalDevice sharedInstance](MapsExternalDevice, "sharedInstance"));
  -[CarPlaceCardCardViewController setNavigationAidedDrivingEnabled:](self, "setNavigationAidedDrivingEnabled:", objc_msgSend(v6, "isNavigationAidedDrivingEnabled"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MapsExternalDevice sharedInstance](MapsExternalDevice, "sharedInstance"));
  -[CarPlaceCardCardViewController setHandoffEnabled:](self, "setHandoffEnabled:", objc_msgSend(v7, "destinationHandoffEnabled"));

}

- (NSArray)preferredFocusEnvironments
{
  void *v3;
  CarLoadingButton *goButton;

  if (-[CarPlaceCardCardViewController isViewLoaded](self, "isViewLoaded")
    && -[CarPlaceCardCardViewController _isGoButtonFocusable](self, "_isGoButtonFocusable"))
  {
    goButton = self->_goButton;
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &goButton, 1));
  }
  else
  {
    v3 = &__NSArray0__struct;
  }
  return (NSArray *)v3;
}

- (NSArray)focusOrderSubItems
{
  return (NSArray *)-[CarPlaceCardCardViewController _visibleButtons](self, "_visibleButtons");
}

- (void)ETAProviderUpdated:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  double v8;
  double v9;
  int v10;
  uint64_t v11;

  v4 = a3;
  v5 = sub_10043364C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "etaTravelTime");
    v10 = 134217984;
    v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "CarPlaceCard: ETAProviderUpdated: etaTravelTime: %f", (uint8_t *)&v10, 0xCu);
  }

  if (self->_style == 1 && self->_etaTravelTime == 0.0)
  {
    objc_msgSend(v4, "etaTravelTime");
    if (v8 > 0.0)
    {
      objc_msgSend(v4, "etaTravelTime");
      self->_etaTravelTime = v9;
      -[CarPlaceCardCardViewController setGoButtonEnabled:](self, "setGoButtonEnabled:", 1);
      -[CarPlaceCardCardViewController setGoButtonHidden:](self, "setGoButtonHidden:", 0);
      objc_msgSend(v4, "cancel");
    }
  }

}

- (BOOL)isLoading
{
  return self->_loading;
}

- (BOOL)isGoButtonEnabled
{
  return self->_goButtonEnabled;
}

- (BOOL)isGoButtonHidden
{
  return self->_goButtonHidden;
}

- (BOOL)hasCardFinishedTransitioning
{
  return self->_hasCardFinishedTransitioning;
}

- (SearchResult)searchResult
{
  return self->_searchResult;
}

- (CarPlaceCardCardViewControllerDataSource)dataSource
{
  return (CarPlaceCardCardViewControllerDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (CarPlaceCardCardViewControllerDelegate)delegate
{
  return (CarPlaceCardCardViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (BOOL)isNavigationAidedDrivingEnabled
{
  return self->_navigationAidedDrivingEnabled;
}

- (BOOL)isHandoffEnabled
{
  return self->_handoffEnabled;
}

- (BOOL)shouldDisplayMoreButton
{
  return self->_shouldDisplayMoreButton;
}

- (void)setLocalizedHoursBuilder:(id)a3
{
  objc_storeStrong((id *)&self->_localizedHoursBuilder, a3);
}

- (_TtC4Maps31CarPlaceCardEVChargingViewModel)evChargingViewModel
{
  return self->_evChargingViewModel;
}

- (void)setEvChargingViewModel:(id)a3
{
  objc_storeStrong((id *)&self->_evChargingViewModel, a3);
}

- (_TtC4Maps39CarEVChargingAvailabilityViewController)evChargingAvailabilityVC
{
  return self->_evChargingAvailabilityVC;
}

- (void)setEvChargingAvailabilityVC:(id)a3
{
  objc_storeStrong((id *)&self->_evChargingAvailabilityVC, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_evChargingAvailabilityVC, 0);
  objc_storeStrong((id *)&self->_evChargingViewModel, 0);
  objc_storeStrong((id *)&self->_localizedHoursBuilder, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_searchResult, 0);
  objc_storeStrong((id *)&self->_openingHoursUpdateTimer, 0);
  objc_storeStrong((id *)&self->_etaProvider, 0);
  objc_storeStrong((id *)&self->_latestETA, 0);
  objc_storeStrong((id *)&self->_etaUpdateTimer, 0);
  objc_storeStrong((id *)&self->_routeAdvisoriesHeightConstraint, 0);
  objc_storeStrong((id *)&self->_etaLabelTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_goButton, 0);
  objc_storeStrong((id *)&self->_routeAdvisoriesView, 0);
  objc_storeStrong((id *)&self->_moreButton, 0);
  objc_storeStrong((id *)&self->_sharingETALabel, 0);
  objc_storeStrong((id *)&self->_mainDescriptionLabel, 0);
  objc_storeStrong((id *)&self->_etaLabel, 0);
  objc_storeStrong((id *)&self->_evChargingDetailViewConstraints, 0);
  objc_storeStrong((id *)&self->_evChargingSummaryViewConstraints, 0);
  objc_storeStrong((id *)&self->_evChargingMoreButton, 0);
  objc_storeStrong((id *)&self->_evChargingAvailabilityLabel, 0);
  objc_storeStrong((id *)&self->_evChargingTitleLabel, 0);
  objc_storeStrong((id *)&self->_addressLabel, 0);
  objc_storeStrong((id *)&self->_ratingView, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_textStackView, 0);
}

@end
