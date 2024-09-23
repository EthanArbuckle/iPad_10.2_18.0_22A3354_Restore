@implementation CarMapWidgetETACardViewController

- (CarMapWidgetETACardViewController)initWithDestination:(unint64_t)a3
{
  CarMapWidgetETACardViewController *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CarMapWidgetETACardViewController;
  result = -[CarMapWidgetETACardViewController initWithNibName:bundle:](&v5, "initWithNibName:bundle:", 0, 0);
  if (result)
    result->_destination = a3;
  return result;
}

- (void)viewDidLoad
{
  void *v3;
  id v4;
  double y;
  double width;
  double height;
  UILabel *v8;
  UILabel *etaLabel;
  void *v10;
  double v11;
  double v12;
  double v13;
  UILabel *v14;
  UILabel *timeLabel;
  void *v16;
  double v17;
  double v18;
  double v19;
  UILabel *v20;
  UILabel *distanceLabel;
  void *v22;
  double v23;
  double v24;
  double v25;
  NSArray *v26;
  NSArray *currentArrangedSubviews;
  UIStackView *v28;
  UIStackView *labelStackView;
  double v30;
  double v31;
  void *v32;
  objc_super v33;
  UILabel *v34;

  v33.receiver = self;
  v33.super_class = (Class)CarMapWidgetETACardViewController;
  -[CarMapWidgetETACardViewController viewDidLoad](&v33, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapWidgetETACardViewController view](self, "view"));
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("CarMapWidgetETACardView"));

  v4 = objc_alloc((Class)UILabel);
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v8 = (UILabel *)objc_msgSend(v4, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  etaLabel = self->_etaLabel;
  self->_etaLabel = v8;

  -[UILabel setAccessibilityIdentifier:](self->_etaLabel, "setAccessibilityIdentifier:", CFSTR("ETALabel"));
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_etaLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapsCar_fontForTextStyle:weight:](UIFont, "_mapsCar_fontForTextStyle:weight:", UIFontTextStyleFootnote, UIFontWeightSemibold));
  -[UILabel setFont:](self->_etaLabel, "setFont:", v10);

  -[UILabel setTextAlignment:](self->_etaLabel, "setTextAlignment:", 1);
  LODWORD(v11) = 1148846080;
  -[UILabel setContentCompressionResistancePriority:forAxis:](self->_etaLabel, "setContentCompressionResistancePriority:forAxis:", 1, v11);
  LODWORD(v12) = 1148846080;
  -[UILabel setContentCompressionResistancePriority:forAxis:](self->_etaLabel, "setContentCompressionResistancePriority:forAxis:", 0, v12);
  LODWORD(v13) = 1144750080;
  -[UILabel setContentHuggingPriority:forAxis:](self->_etaLabel, "setContentHuggingPriority:forAxis:", 0, v13);
  v14 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  timeLabel = self->_timeLabel;
  self->_timeLabel = v14;

  -[UILabel setAccessibilityIdentifier:](self->_timeLabel, "setAccessibilityIdentifier:", CFSTR("TimeLabel"));
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_timeLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapsCar_fontForTextStyle:weight:](UIFont, "_mapsCar_fontForTextStyle:weight:", UIFontTextStyleFootnote, UIFontWeightSemibold));
  -[UILabel setFont:](self->_timeLabel, "setFont:", v16);

  LODWORD(v17) = 1148846080;
  -[UILabel setContentCompressionResistancePriority:forAxis:](self->_timeLabel, "setContentCompressionResistancePriority:forAxis:", 1, v17);
  LODWORD(v18) = 1148846080;
  -[UILabel setContentCompressionResistancePriority:forAxis:](self->_timeLabel, "setContentCompressionResistancePriority:forAxis:", 0, v18);
  LODWORD(v19) = 1144750080;
  -[UILabel setContentHuggingPriority:forAxis:](self->_timeLabel, "setContentHuggingPriority:forAxis:", 0, v19);
  v20 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  distanceLabel = self->_distanceLabel;
  self->_distanceLabel = v20;

  -[UILabel setAccessibilityIdentifier:](self->_distanceLabel, "setAccessibilityIdentifier:", CFSTR("DistanceLabel"));
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_distanceLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapsCar_fontForTextStyle:weight:](UIFont, "_mapsCar_fontForTextStyle:weight:", UIFontTextStyleFootnote, UIFontWeightSemibold));
  -[UILabel setFont:](self->_distanceLabel, "setFont:", v22);

  LODWORD(v23) = 1148846080;
  -[UILabel setContentCompressionResistancePriority:forAxis:](self->_distanceLabel, "setContentCompressionResistancePriority:forAxis:", 1, v23);
  LODWORD(v24) = 1148846080;
  -[UILabel setContentCompressionResistancePriority:forAxis:](self->_distanceLabel, "setContentCompressionResistancePriority:forAxis:", 0, v24);
  LODWORD(v25) = 1144750080;
  -[UILabel setContentHuggingPriority:forAxis:](self->_distanceLabel, "setContentHuggingPriority:forAxis:", 0, v25);
  v34 = self->_etaLabel;
  v26 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v34, 1));
  currentArrangedSubviews = self->_currentArrangedSubviews;
  self->_currentArrangedSubviews = v26;

  v28 = (UIStackView *)objc_msgSend(objc_alloc((Class)UIStackView), "initWithArrangedSubviews:", self->_currentArrangedSubviews);
  labelStackView = self->_labelStackView;
  self->_labelStackView = v28;

  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_labelStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v30) = 1148846080;
  -[UIStackView setContentCompressionResistancePriority:forAxis:](self->_labelStackView, "setContentCompressionResistancePriority:forAxis:", 0, v30);
  LODWORD(v31) = 1148846080;
  -[UIStackView setContentHuggingPriority:forAxis:](self->_labelStackView, "setContentHuggingPriority:forAxis:", 0, v31);
  -[UIStackView setSpacing:](self->_labelStackView, "setSpacing:", 12.0);
  -[UIStackView setAxis:](self->_labelStackView, "setAxis:", 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapWidgetETACardViewController view](self, "view"));
  objc_msgSend(v32, "addSubview:", self->_labelStackView);

  -[CarMapWidgetETACardViewController _setupConstraints](self, "_setupConstraints");
  -[CarMapWidgetETACardViewController _updateArrangedSubviewsIfNeeded](self, "_updateArrangedSubviewsIfNeeded");
  -[CarMapWidgetETACardViewController _updateContents](self, "_updateContents");
}

- (void)viewDidLayoutSubviews
{
  unint64_t destination;
  void *v4;
  void *v5;
  void *v6;
  double Width;
  _BOOL8 v8;
  objc_super v9;
  CGRect v10;

  v9.receiver = self;
  v9.super_class = (Class)CarMapWidgetETACardViewController;
  -[CarMapWidgetETACardViewController viewDidLayoutSubviews](&v9, "viewDidLayoutSubviews");
  destination = self->_destination;
  if (destination == 1)
  {
    v8 = 0;
  }
  else
  {
    if (destination)
      return;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapWidgetETACardViewController view](self, "view"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "window"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "safeAreaLayoutGuide"));
    objc_msgSend(v6, "layoutFrame");
    Width = CGRectGetWidth(v10);

    v8 = Width > 298.0;
  }
  -[CarMapWidgetETACardViewController setShouldUseWideLayout:](self, "setShouldUseWideLayout:", v8);
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CarMapWidgetETACardViewController;
  -[CarMapWidgetETACardViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  -[CarMapWidgetETACardViewController _updateContents](self, "_updateContents");
  -[CarMapWidgetETACardViewController _applyDynamicScaling](self, "_applyDynamicScaling");
}

- (void)_setupConstraints
{
  void *v3;
  void *v4;
  void *v5;
  NSLayoutConstraint *v6;
  NSLayoutConstraint *topConstraint;
  void *v8;
  void *v9;
  void *v10;
  NSLayoutConstraint *v11;
  NSLayoutConstraint *bottomConstraint;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSLayoutConstraint *v23;
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
  _QWORD v37[7];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView firstBaselineAnchor](self->_labelStackView, "firstBaselineAnchor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapWidgetETACardViewController view](self, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topAnchor"));
  v6 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "constraintEqualToAnchor:constant:", v5, 19.0));
  topConstraint = self->_topConstraint;
  self->_topConstraint = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapWidgetETACardViewController view](self, "view"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bottomAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView lastBaselineAnchor](self->_labelStackView, "lastBaselineAnchor"));
  v11 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:constant:", v10, 11.0));
  bottomConstraint = self->_bottomConstraint;
  self->_bottomConstraint = v11;

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView centerXAnchor](self->_labelStackView, "centerXAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapWidgetETACardViewController view](self, "view"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "centerXAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintEqualToAnchor:", v34));
  v37[0] = v33;
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView leadingAnchor](self->_labelStackView, "leadingAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapWidgetETACardViewController view](self, "view"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "leadingAnchor"));
  LODWORD(v13) = 1132068864;
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:constant:priority:", v30, 24.0, v13));
  v37[1] = v29;
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView leadingAnchor](self->_labelStackView, "leadingAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapWidgetETACardViewController view](self, "view"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "leadingAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintGreaterThanOrEqualToAnchor:constant:", v26, 12.0));
  v37[2] = v25;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapWidgetETACardViewController view](self, "view"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "trailingAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView trailingAnchor](self->_labelStackView, "trailingAnchor"));
  LODWORD(v17) = 1132068864;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:constant:priority:", v16, 24.0, v17));
  v37[3] = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapWidgetETACardViewController view](self, "view"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "trailingAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView trailingAnchor](self->_labelStackView, "trailingAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintGreaterThanOrEqualToAnchor:constant:", v21, 12.0));
  v23 = self->_topConstraint;
  v37[4] = v22;
  v37[5] = v23;
  v37[6] = self->_bottomConstraint;
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v37, 7));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v24);

}

- (void)setShouldUseWideLayout:(BOOL)a3
{
  if (self->_shouldUseWideLayout != a3)
  {
    self->_shouldUseWideLayout = a3;
    -[CarMapWidgetETACardViewController _updateArrangedSubviewsIfNeeded](self, "_updateArrangedSubviewsIfNeeded");
    -[CarMapWidgetETACardViewController _updateContents](self, "_updateContents");
  }
}

- (void)_updateArrangedSubviewsIfNeeded
{
  void *v2;
  unsigned int v4;
  void *v5;
  UILabel *timeLabel;
  UILabel *etaLabel;
  _QWORD v8[3];

  v4 = -[CarMapWidgetETACardViewController shouldUseWideLayout](self, "shouldUseWideLayout");
  if (v4)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceETA arrivalBatteryCharge](self->_latestETA, "arrivalBatteryCharge"));
    if (!v2)
    {
      timeLabel = self->_timeLabel;
      v8[0] = self->_etaLabel;
      v8[1] = timeLabel;
      v8[2] = self->_distanceLabel;
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v8, 3));
      goto LABEL_6;
    }
  }
  etaLabel = self->_etaLabel;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &etaLabel, 1));
  if (v4)
LABEL_6:

  if ((objc_msgSend(v5, "isEqualToArray:", self->_currentArrangedSubviews) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_currentArrangedSubviews, v5);
    -[UIStackView _maps_setArrangedSubviews:](self->_labelStackView, "_maps_setArrangedSubviews:", v5);
    -[UIStackView setNeedsLayout](self->_labelStackView, "setNeedsLayout");
    -[UIStackView layoutIfNeeded](self->_labelStackView, "layoutIfNeeded");
  }

}

- (void)_updateContents
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
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
  _QWORD block[5];

  if (self->_latestETA)
  {
    if (-[CarMapWidgetETACardViewController shouldUseWideLayout](self, "shouldUseWideLayout")
      && (v3 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceETA arrivalBatteryCharge](self->_latestETA, "arrivalBatteryCharge")),
          v3,
          v3))
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapsCar_fontForTextStyle:weight:](UIFont, "_mapsCar_fontForTextStyle:weight:", UIFontTextStyleFootnote, UIFontWeightSemibold));
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceETA arrivalWithBatteryChargeStringWithFont:includingAMPMSymbols:](self->_latestETA, "arrivalWithBatteryChargeStringWithFont:includingAMPMSymbols:", v4, 0));
      -[UILabel setAttributedText:](self->_etaLabel, "setAttributedText:", v5);

    }
    else
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceETA arrivalTimeExpandedStringIncludingAMPMSymbols:](self->_latestETA, "arrivalTimeExpandedStringIncludingAMPMSymbols:", 0));
      -[UILabel setText:](self->_etaLabel, "setText:", v4);
    }

    -[GuidanceETA remainingDistance](self->_latestETA, "remainingDistance");
    if (v6 >= 0.0)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceETA distanceValue](self->_latestETA, "distanceValue"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceETA distanceUnit](self->_latestETA, "distanceUnit"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v7, v8));
      -[UILabel setText:](self->_distanceLabel, "setText:", v9);

      v10 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceETA distanceValue](self->_latestETA, "distanceValue"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceETA distanceUnitAccessibility](self->_latestETA, "distanceUnitAccessibility"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v10, v11));
      -[UILabel setAccessibilityLabel:](self->_distanceLabel, "setAccessibilityLabel:", v12);

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceETA timeValue](self->_latestETA, "timeValue"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceETA timeUnit](self->_latestETA, "timeUnit"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v13, v14));
    -[UILabel setText:](self->_timeLabel, "setText:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceETA timeValue](self->_latestETA, "timeValue"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceETA timeUnitAccessibility](self->_latestETA, "timeUnitAccessibility"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v16, v17));
    -[UILabel setAccessibilityLabel:](self->_timeLabel, "setAccessibilityLabel:", v18);

    -[UIStackView setNeedsLayout](self->_labelStackView, "setNeedsLayout");
    -[UIStackView layoutIfNeeded](self->_labelStackView, "layoutIfNeeded");
    if (-[UILabel isTextTruncated](self->_etaLabel, "isTextTruncated"))
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100957A4C;
      block[3] = &unk_1011AC860;
      block[4] = self;
      if (qword_1014D3A58 != -1)
        dispatch_once(&qword_1014D3A58, block);
    }
  }
}

- (void)_applyDynamicScaling
{
  if (self->_destination == 1)
  {
    -[CarMapWidgetETACardViewController _scaleFonts](self, "_scaleFonts");
    -[CarMapWidgetETACardViewController _scaleConstraints](self, "_scaleConstraints");
  }
}

- (void)_scaleFonts
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapWidgetETACardViewController view](self, "view"));
  objc_msgSend(v3, "_car_dynamicPointScaleValue");
  v5 = v4;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapsCar_fontForTextStyle:weight:](UIFont, "_mapsCar_fontForTextStyle:weight:", UIFontTextStyleFootnote, UIFontWeightSemibold));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_maps_scaledFontForScaleFactor:", v5));
  -[UILabel setFont:](self->_etaLabel, "setFont:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapsCar_fontForTextStyle:weight:](UIFont, "_mapsCar_fontForTextStyle:weight:", UIFontTextStyleFootnote, UIFontWeightSemibold));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_maps_scaledFontForScaleFactor:", v5));
  -[UILabel setFont:](self->_timeLabel, "setFont:", v9);

  v11 = (id)objc_claimAutoreleasedReturnValue(+[UIFont _mapsCar_fontForTextStyle:weight:](UIFont, "_mapsCar_fontForTextStyle:weight:", UIFontTextStyleFootnote, UIFontWeightSemibold));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "_maps_scaledFontForScaleFactor:", v5));
  -[UILabel setFont:](self->_distanceLabel, "setFont:", v10);

}

- (void)_scaleConstraints
{
  void *v3;
  double v4;
  double v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapWidgetETACardViewController view](self, "view"));
  objc_msgSend(v3, "_car_dynamicPointScaleValue");
  v5 = v4;

  -[NSLayoutConstraint setConstant:](self->_topConstraint, "setConstant:", v5 * 19.0);
  -[NSLayoutConstraint setConstant:](self->_bottomConstraint, "setConstant:", v5 * 11.0);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CarMapWidgetETACardViewController;
  v4 = a3;
  -[CarMapWidgetETACardViewController traitCollectionDidChange:](&v10, "traitCollectionDidChange:", v4);
  v5 = objc_msgSend(v4, "userInterfaceStyle", v10.receiver, v10.super_class);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapWidgetETACardViewController traitCollection](self, "traitCollection"));
  v7 = objc_msgSend(v6, "userInterfaceStyle");

  if (v5 != v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapWidgetETACardViewController traitCollection](self, "traitCollection"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapWidgetETACardViewController _effectForInterfaceStyle:](self, "_effectForInterfaceStyle:", objc_msgSend(v8, "userInterfaceStyle")));
    -[CarVisualEffectView setEffect:](self->_dashboardBackgroundView, "setEffect:", v9);

  }
}

- (void)setLatestETA:(id)a3
{
  void *v3;
  GuidanceETA *v6;
  GuidanceETA *latestETA;
  void *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  GuidanceETA *v12;

  v6 = (GuidanceETA *)a3;
  latestETA = self->_latestETA;
  if (latestETA == v6)
    goto LABEL_14;
  v12 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceETA arrivalBatteryCharge](latestETA, "arrivalBatteryCharge"));
  if (v8)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceETA arrivalBatteryCharge](v12, "arrivalBatteryCharge"));
    if (!v3)
    {
      v9 = 1;
LABEL_9:

      goto LABEL_10;
    }
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceETA arrivalBatteryCharge](self->_latestETA, "arrivalBatteryCharge"));
  if (v10)
  {
    v9 = 0;
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceETA arrivalBatteryCharge](v12, "arrivalBatteryCharge"));
    v9 = v11 != 0;

  }
  if (v8)
    goto LABEL_9;
LABEL_10:

  objc_storeStrong((id *)&self->_latestETA, a3);
  if (v9 && -[CarMapWidgetETACardViewController isViewLoaded](self, "isViewLoaded"))
    -[CarMapWidgetETACardViewController _updateArrangedSubviewsIfNeeded](self, "_updateArrangedSubviewsIfNeeded");
  -[CarMapWidgetETACardViewController _updateContents](self, "_updateContents");
  v6 = v12;
LABEL_14:

}

- (id)backgroundViewForCarCardLayout:(id *)a3 scale:(double)a4 userInterfaceStyle:(int64_t)a5
{
  void *v6;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapWidgetETACardViewController _cardBackgroundView](self, "_cardBackgroundView", a3, a5, a4));

  return v6;
}

- ($3A137947DC24AF6DB667847AA8BD3130)cornerMaskForCarCardLayout:(SEL)a3
{
  $3A137947DC24AF6DB667847AA8BD3130 *result;

  retstr->var0 = 15;
  retstr->var1 = 5.0;
  retstr->var2 = kCACornerCurveContinuous;

  return result;
}

- (id)_effectForInterfaceStyle:(int64_t)a3
{
  uint64_t v3;

  if (a3 == 1)
    v3 = 14;
  else
    v3 = 18;
  return +[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", v3);
}

- (id)_cardBackgroundView
{
  CarMapWidgetETACardViewController *v2;
  unint64_t destination;
  id *p_hybridICBackgroundView;
  id hybridICBackgroundView;
  CarVisualEffectView *v6;
  id v7;
  void *v8;
  void *v9;
  CarDynamicBlurView *v10;
  id v11;

  v2 = self;
  destination = self->_destination;
  if (destination == 1)
  {
    p_hybridICBackgroundView = (id *)&self->_hybridICBackgroundView;
    hybridICBackgroundView = self->_hybridICBackgroundView;
    if (!hybridICBackgroundView)
    {
      v10 = -[CarDynamicBlurView initWithBlurViewContext:delegate:]([CarDynamicBlurView alloc], "initWithBlurViewContext:delegate:", 0, 0);
      v11 = *p_hybridICBackgroundView;
      *p_hybridICBackgroundView = v10;

      objc_msgSend(*p_hybridICBackgroundView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(*p_hybridICBackgroundView, "setUserInteractionEnabled:", 0);
      goto LABEL_7;
    }
LABEL_8:
    self = (CarMapWidgetETACardViewController *)hybridICBackgroundView;
    return self;
  }
  if (!destination)
  {
    p_hybridICBackgroundView = (id *)&self->_dashboardBackgroundView;
    hybridICBackgroundView = self->_dashboardBackgroundView;
    if (!hybridICBackgroundView)
    {
      v6 = -[CarVisualEffectView initWithFrame:]([CarVisualEffectView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
      v7 = *p_hybridICBackgroundView;
      *p_hybridICBackgroundView = v6;

      objc_msgSend(*p_hybridICBackgroundView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(*p_hybridICBackgroundView, "setUserInteractionEnabled:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapWidgetETACardViewController traitCollection](v2, "traitCollection"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapWidgetETACardViewController _effectForInterfaceStyle:](v2, "_effectForInterfaceStyle:", objc_msgSend(v8, "userInterfaceStyle")));
      objc_msgSend(*p_hybridICBackgroundView, "setEffect:", v9);

      objc_msgSend(*p_hybridICBackgroundView, "setAllowsBlurring:", 1);
LABEL_7:
      hybridICBackgroundView = *p_hybridICBackgroundView;
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  return self;
}

- (NSArray)focusOrderSubItems
{
  return (NSArray *)&__NSArray0__struct;
}

- (NSArray)preferredFocusEnvironments
{
  return (NSArray *)&__NSArray0__struct;
}

- (GuidanceETA)latestETA
{
  return self->_latestETA;
}

- (BOOL)shouldUseWideLayout
{
  return self->_shouldUseWideLayout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latestETA, 0);
  objc_storeStrong((id *)&self->_hybridICBackgroundView, 0);
  objc_storeStrong((id *)&self->_dashboardBackgroundView, 0);
  objc_storeStrong((id *)&self->_labelStackView, 0);
  objc_storeStrong((id *)&self->_currentArrangedSubviews, 0);
  objc_storeStrong((id *)&self->_bottomConstraint, 0);
  objc_storeStrong((id *)&self->_topConstraint, 0);
  objc_storeStrong((id *)&self->_distanceLabel, 0);
  objc_storeStrong((id *)&self->_timeLabel, 0);
  objc_storeStrong((id *)&self->_etaLabel, 0);
}

@end
