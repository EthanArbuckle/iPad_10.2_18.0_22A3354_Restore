@implementation CarSearchItemCell

+ (id)distanceFormatter
{
  if (qword_1014D2628 != -1)
    dispatch_once(&qword_1014D2628, &stru_1011B8500);
  return (id)qword_1014D2620;
}

+ (id)reuseIdentifier
{
  return CFSTR("CarSearchResultCellReuseIdentifier");
}

- (CarSearchItemCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CarSearchItemCell *v4;
  CarSearchItemCell *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CarSearchItemCell;
  v4 = -[CarSearchItemCell initWithStyle:reuseIdentifier:](&v8, "initWithStyle:reuseIdentifier:", a3, a4);
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchItemCell contentView](v4, "contentView"));
    objc_msgSend(v6, "setClipsToBounds:", 1);

    -[CarSearchItemCell setupSubviews](v5, "setupSubviews");
    -[CarSearchItemCell setupStyles](v5, "setupStyles");
  }
  return v5;
}

- (id)accessibilityIdentifier
{
  return CFSTR("CarSearchItemCell");
}

- (void)setupSubviews
{
  id v3;
  double y;
  double width;
  double height;
  UILabel *v7;
  UILabel *titleLabel;
  double v9;
  double v10;
  double v11;
  void *v12;
  UILabel *v13;
  UILabel *leadingSubtitleLabel;
  double v15;
  double v16;
  void *v17;
  UILabel *v18;
  UILabel *trailingSubtitleLabel;
  double v20;
  double v21;
  double v22;
  void *v23;
  CarStarRatingView *v24;
  CarStarRatingView *ratingView;
  double v26;
  double v27;
  void *v28;
  _TtC4Maps28CarSearchResultEVChargerView *v29;
  _TtC4Maps28CarSearchResultEVChargerView *evChargerInfoView;
  double v31;
  double v32;
  double v33;
  id v34;

  v3 = objc_alloc((Class)UILabel);
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v7 = (UILabel *)objc_msgSend(v3, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v7;

  -[UILabel setAccessibilityIdentifier:](self->_titleLabel, "setAccessibilityIdentifier:", CFSTR("TitleLabel"));
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v9) = 1148846080;
  -[UILabel setContentHuggingPriority:forAxis:](self->_titleLabel, "setContentHuggingPriority:forAxis:", 1, v9);
  LODWORD(v10) = 1148846080;
  -[UILabel setContentHuggingPriority:forAxis:](self->_titleLabel, "setContentHuggingPriority:forAxis:", 0, v10);
  LODWORD(v11) = 1148829696;
  -[UILabel setContentCompressionResistancePriority:forAxis:](self->_titleLabel, "setContentCompressionResistancePriority:forAxis:", 0, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchItemCell contentView](self, "contentView"));
  objc_msgSend(v12, "addSubview:", self->_titleLabel);

  v13 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  leadingSubtitleLabel = self->_leadingSubtitleLabel;
  self->_leadingSubtitleLabel = v13;

  -[UILabel setAccessibilityIdentifier:](self->_leadingSubtitleLabel, "setAccessibilityIdentifier:", CFSTR("LeadingSubtitleLabel"));
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_leadingSubtitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v15) = 1148846080;
  -[UILabel setContentHuggingPriority:forAxis:](self->_leadingSubtitleLabel, "setContentHuggingPriority:forAxis:", 1, v15);
  LODWORD(v16) = 1148846080;
  -[UILabel setContentHuggingPriority:forAxis:](self->_leadingSubtitleLabel, "setContentHuggingPriority:forAxis:", 0, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchItemCell contentView](self, "contentView"));
  objc_msgSend(v17, "addSubview:", self->_leadingSubtitleLabel);

  v18 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  trailingSubtitleLabel = self->_trailingSubtitleLabel;
  self->_trailingSubtitleLabel = v18;

  -[UILabel setAccessibilityIdentifier:](self->_trailingSubtitleLabel, "setAccessibilityIdentifier:", CFSTR("TrailingSubtitleLabel"));
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_trailingSubtitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v20) = 1148846080;
  -[UILabel setContentHuggingPriority:forAxis:](self->_trailingSubtitleLabel, "setContentHuggingPriority:forAxis:", 1, v20);
  LODWORD(v21) = 1144750080;
  -[UILabel setContentHuggingPriority:forAxis:](self->_trailingSubtitleLabel, "setContentHuggingPriority:forAxis:", 0, v21);
  LODWORD(v22) = 1148846080;
  -[UILabel setContentCompressionResistancePriority:forAxis:](self->_trailingSubtitleLabel, "setContentCompressionResistancePriority:forAxis:", 1, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchItemCell contentView](self, "contentView"));
  objc_msgSend(v23, "addSubview:", self->_trailingSubtitleLabel);

  v24 = objc_alloc_init(CarStarRatingView);
  ratingView = self->_ratingView;
  self->_ratingView = v24;

  -[CarStarRatingView setTranslatesAutoresizingMaskIntoConstraints:](self->_ratingView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v26) = 1148846080;
  -[CarStarRatingView setContentCompressionResistancePriority:forAxis:](self->_ratingView, "setContentCompressionResistancePriority:forAxis:", 1, v26);
  LODWORD(v27) = 1148846080;
  -[CarStarRatingView setContentHuggingPriority:forAxis:](self->_ratingView, "setContentHuggingPriority:forAxis:", 1, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchItemCell contentView](self, "contentView"));
  objc_msgSend(v28, "addSubview:", self->_ratingView);

  v29 = -[CarSearchResultEVChargerView initWithFrame:]([_TtC4Maps28CarSearchResultEVChargerView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  evChargerInfoView = self->_evChargerInfoView;
  self->_evChargerInfoView = v29;

  -[CarSearchResultEVChargerView setTranslatesAutoresizingMaskIntoConstraints:](self->_evChargerInfoView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v31) = 1148846080;
  -[CarSearchResultEVChargerView setContentHuggingPriority:forAxis:](self->_evChargerInfoView, "setContentHuggingPriority:forAxis:", 1, v31);
  LODWORD(v32) = 1144750080;
  -[CarSearchResultEVChargerView setContentHuggingPriority:forAxis:](self->_evChargerInfoView, "setContentHuggingPriority:forAxis:", 0, v32);
  LODWORD(v33) = 1148846080;
  -[CarSearchResultEVChargerView setContentCompressionResistancePriority:forAxis:](self->_evChargerInfoView, "setContentCompressionResistancePriority:forAxis:", 1, v33);
  v34 = (id)objc_claimAutoreleasedReturnValue(-[CarSearchItemCell contentView](self, "contentView"));
  objc_msgSend(v34, "addSubview:", self->_evChargerInfoView);

}

- (void)setupStyles
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
  id v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapsCar_fontForTextStyle:weight:](UIFont, "_mapsCar_fontForTextStyle:weight:", UIFontTextStyleCallout, UIFontWeightMedium));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchItemCell titleLabel](self, "titleLabel"));
  objc_msgSend(v4, "setFont:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchItemCell titleLabel](self, "titleLabel"));
  objc_msgSend(v6, "setTextColor:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchItemCell titleLabel](self, "titleLabel"));
  objc_msgSend(v7, "setAdjustsFontSizeToFitWidth:", 0);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapsCar_fontForTextStyle:weight:grade:](UIFont, "_mapsCar_fontForTextStyle:weight:grade:", UIFontTextStyleCaption2, 3, UIFontWeightRegular));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchItemCell leadingSubtitleLabel](self, "leadingSubtitleLabel"));
  objc_msgSend(v9, "setFont:", v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemPrimaryColor](UIColor, "_carSystemPrimaryColor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchItemCell leadingSubtitleLabel](self, "leadingSubtitleLabel"));
  objc_msgSend(v11, "setTextColor:", v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapsCar_fontForTextStyle:weight:grade:](UIFont, "_mapsCar_fontForTextStyle:weight:grade:", UIFontTextStyleCaption2, 3, UIFontWeightRegular));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchItemCell trailingSubtitleLabel](self, "trailingSubtitleLabel"));
  objc_msgSend(v13, "setFont:", v12);

  v15 = (id)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemPrimaryColor](UIColor, "_carSystemPrimaryColor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchItemCell trailingSubtitleLabel](self, "trailingSubtitleLabel"));
  objc_msgSend(v14, "setTextColor:", v15);

}

- (void)setupWithModel:(id)a3 cellStyle:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  _TtC4Maps28CarSearchResultEVChargerView *evChargerInfoView;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  _TtC4Maps28CarSearchResultEVChargerView *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;

  v26 = a3;
  -[CarSearchItemCell setModel:](self, "setModel:", v26);
  -[CarSearchItemCell setCellStyle:](self, "setCellStyle:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchItemCell _firstLineString](self, "_firstLineString"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchItemCell titleLabel](self, "titleLabel"));
  objc_msgSend(v7, "setText:", v6);

  -[CarSearchItemCell _updateSubtitle](self, "_updateSubtitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchItemCell ratingView](self, "ratingView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "mapItem"));
  objc_msgSend(v8, "setupWithMapItem:", v9);

  v10 = -[CarSearchItemCell shouldShowRating](self, "shouldShowRating") ^ 1;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchItemCell ratingView](self, "ratingView"));
  objc_msgSend(v11, "setHidden:", v10);

  -[CarSearchItemCell _updateLabelColors:](self, "_updateLabelColors:", -[CarSearchItemCell isHighlighted](self, "isHighlighted"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "mapItem"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "_realTimeAvailableEVCharger"));

  v14 = +[EVChargerUtility realTimeEVChargerStatusWithEvCharger:](_TtC4Maps16EVChargerUtility, "realTimeEVChargerStatusWithEvCharger:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemSecondaryColor](UIColor, "_carSystemSecondaryColor"));
  if (-[CarSearchItemCell _hasRealTimeChargerInfo:](self, "_hasRealTimeChargerInfo:", v26))
  {
    if ((_DWORD)v14 == 1)
    {
      v16 = objc_claimAutoreleasedReturnValue(+[UIColor systemGreenColor](UIColor, "systemGreenColor"));

      v15 = (void *)v16;
    }
    -[CarSearchResultEVChargerView setTextAndIconColor:status:](self->_evChargerInfoView, "setTextAndIconColor:status:", v15, v14);
    evChargerInfoView = self->_evChargerInfoView;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "evChargerLabelText"));
    -[CarSearchResultEVChargerView updateContentsWithPlugStatus:displayString:](evChargerInfoView, "updateContentsWithPlugStatus:displayString:", v14, v18);
LABEL_9:

    goto LABEL_10;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchItemCell model](self, "model"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "chargerNumberString"));
  v21 = objc_msgSend(v20, "length");

  if (v21)
  {
    -[CarSearchResultEVChargerView setTextAndIconColor:status:](self->_evChargerInfoView, "setTextAndIconColor:status:", v15, 0);
    v22 = self->_evChargerInfoView;
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchItemCell model](self, "model"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "chargerNumberString"));
    -[CarSearchResultEVChargerView updateContentsWithPlugStatus:displayString:](v22, "updateContentsWithPlugStatus:displayString:", 0, v24);

    v25 = 0;
    if (objc_msgSend(v26, "isShowingStops"))
      v25 = objc_msgSend(v26, "isRecent");
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchResultEVChargerView leadingIcon](self->_evChargerInfoView, "leadingIcon"));
    objc_msgSend(v18, "setHidden:", v25);
    goto LABEL_9;
  }
LABEL_10:
  -[CarSearchItemCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");

}

- (BOOL)_hasRealTimeChargerInfo:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;

  v3 = a3;
  if (MapsFeature_IsEnabled_RealTimeEVCharger(v3, v4))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mapItem"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_geoMapItem"));
    v7 = objc_msgSend(v6, "_hasEVCharger");

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_updateSubtitle
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchItemCell _rightSecondLineString](self, "_rightSecondLineString"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchItemCell trailingSubtitleLabel](self, "trailingSubtitleLabel"));
  objc_msgSend(v4, "setText:", v3);

  v6 = (id)objc_claimAutoreleasedReturnValue(-[CarSearchItemCell _leftSecondLineString](self, "_leftSecondLineString"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchItemCell leadingSubtitleLabel](self, "leadingSubtitleLabel"));
  objc_msgSend(v5, "setText:", v6);

}

- (void)prepareForReuse
{
  _MKRouteETA *routeETA;
  NSTimer *delayedCalculatingTimer;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CarSearchItemCell;
  -[CarSearchItemCell prepareForReuse](&v5, "prepareForReuse");
  -[CarSearchItemCell setModel:](self, "setModel:", 0);
  routeETA = self->_routeETA;
  self->_routeETA = 0;

  -[CarSearchResultEVChargerView resetContents](self->_evChargerInfoView, "resetContents");
  self->_calculatingRouteETA = 0;
  -[NSTimer invalidate](self->_delayedCalculatingTimer, "invalidate");
  delayedCalculatingTimer = self->_delayedCalculatingTimer;
  self->_delayedCalculatingTimer = 0;

}

- (void)updateConstraints
{
  void *v3;
  uint64_t v4;
  unsigned int v5;
  double v6;
  UILabel **p_leadingSubtitleLabel;
  void *v8;
  uint64_t v9;
  unsigned int v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned int v21;
  UILabel **v22;
  id *p_ratingView;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSArray *v34;
  NSArray *currentConstraints;
  float v36;
  float v37;
  double v38;
  double v39;
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
  UILabel **v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  objc_super v69;
  _QWORD v70[3];
  _QWORD v71[8];

  v69.receiver = self;
  v69.super_class = (Class)CarSearchItemCell;
  -[CarSearchItemCell updateConstraints](&v69, "updateConstraints");
  if (self->_currentConstraints)
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:");
  v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](self->_titleLabel, "firstBaselineAnchor"));
  v64 = v3;
  v66 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchItemCell contentView](self, "contentView"));
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "topAnchor"));
  v62 = (void *)v4;
  v5 = -[CarSearchItemCell displaysThirdDetailLine](self, "displaysThirdDetailLine");
  v6 = 19.0;
  if (v5)
    v6 = 20.0;
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "constraintEqualToAnchor:constant:", v4, v6));
  v71[0] = v60;
  v55 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_titleLabel, "trailingAnchor"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchItemCell contentView](self, "contentView"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "trailingAnchor"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "constraintEqualToAnchor:constant:", v54, -6.0));
  v71[1] = v53;
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_titleLabel, "leadingAnchor"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchItemCell contentView](self, "contentView"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "leadingAnchor"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "constraintEqualToAnchor:constant:", v50, 6.0));
  v71[2] = v49;
  p_leadingSubtitleLabel = &self->_leadingSubtitleLabel;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](self->_leadingSubtitleLabel, "firstBaselineAnchor"));
  v48 = v8;
  v9 = objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](self->_titleLabel, "firstBaselineAnchor"));
  v47 = (void *)v9;
  v10 = -[CarSearchItemCell displaysThirdDetailLine](self, "displaysThirdDetailLine");
  v11 = 17.0;
  if (v10)
    v11 = 14.0;
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:constant:", v9, v11));
  v71[3] = v46;
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](*p_leadingSubtitleLabel, "leadingAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchItemCell contentView](self, "contentView"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "leadingAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "constraintEqualToAnchor:constant:", v43, 6.0));
  v71[4] = v42;
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](self->_trailingSubtitleLabel, "firstBaselineAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](*p_leadingSubtitleLabel, "firstBaselineAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToAnchor:", v40));
  v71[5] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_trailingSubtitleLabel, "leadingAnchor"));
  v59 = &self->_leadingSubtitleLabel;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](*p_leadingSubtitleLabel, "trailingAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:constant:", v14, 3.0));
  v71[6] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_trailingSubtitleLabel, "trailingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchItemCell contentView](self, "contentView"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "trailingAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintLessThanOrEqualToAnchor:constant:", v18, -6.0));
  v71[7] = v19;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v71, 8));
  objc_msgSend(v68, "addObjectsFromArray:", v20);

  if (-[CarSearchItemCell displaysThirdDetailLine](self, "displaysThirdDetailLine"))
  {
    v21 = -[CarSearchItemCell shouldShowRating](self, "shouldShowRating");
    v22 = &self->_leadingSubtitleLabel;
    p_ratingView = (id *)&self->_leadingSubtitleLabel;
    if (v21)
      p_ratingView = (id *)&self->_ratingView;
    v24 = *p_ratingView;
    v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "firstBaselineAnchor"));
    v65 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](*v59, "firstBaselineAnchor"));
    v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "constraintEqualToAnchor:constant:", v65, 14.0));
    v70[0] = v63;
    v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "leadingAnchor"));
    v61 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchItemCell contentView](self, "contentView"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "leadingAnchor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "constraintEqualToAnchor:constant:", v56, 6.0));
    v70[1] = v25;
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "trailingAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchItemCell contentView](self, "contentView"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "trailingAnchor"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintLessThanOrEqualToAnchor:constant:", v28, -6.0));
    v70[2] = v29;
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v70, 3));
    v31 = v68;
    objc_msgSend(v68, "addObjectsFromArray:", v30);

    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "firstBaselineAnchor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchItemCell _evChargerConstraints:](self, "_evChargerConstraints:", v32));

  }
  else
  {
    v22 = &self->_leadingSubtitleLabel;
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](*v59, "firstBaselineAnchor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchItemCell _evChargerConstraints:](self, "_evChargerConstraints:", v32));
    v31 = v68;
  }
  objc_msgSend(v31, "addObjectsFromArray:", v33);

  v34 = (NSArray *)objc_msgSend(v31, "copy");
  currentConstraints = self->_currentConstraints;
  self->_currentConstraints = v34;

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", self->_currentConstraints);
  v36 = 750.0;
  if ((id)-[CarSearchItemCell cellStyle](self, "cellStyle") == (id)2)
    v37 = 999.0;
  else
    v37 = 750.0;
  if ((id)-[CarSearchItemCell cellStyle](self, "cellStyle") != (id)2)
    v36 = 999.0;
  *(float *)&v38 = v37;
  -[UILabel setContentCompressionResistancePriority:forAxis:](*v22, "setContentCompressionResistancePriority:forAxis:", 0, v38);
  *(float *)&v39 = v36;
  -[UILabel setContentCompressionResistancePriority:forAxis:](self->_trailingSubtitleLabel, "setContentCompressionResistancePriority:forAxis:", 0, v39);

}

- (id)_evChargerConstraints:(id)a3
{
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];

  if (!self->_evChargerInfoView)
    return &__NSArray0__struct;
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchResultEVChargerView firstBaselineAnchor](self->_evChargerInfoView, "firstBaselineAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:constant:", v4, 4.0));

  v22[0] = v20;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchResultEVChargerView leadingAnchor](self->_evChargerInfoView, "leadingAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchItemCell contentView](self, "contentView"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "leadingAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:constant:", v17, 6.0));
  v22[1] = v16;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchResultEVChargerView trailingAnchor](self->_evChargerInfoView, "trailingAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchItemCell contentView](self, "contentView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "trailingAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintLessThanOrEqualToAnchor:constant:", v8, -6.0));
  v22[2] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchResultEVChargerView bottomAnchor](self->_evChargerInfoView, "bottomAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchItemCell contentView](self, "contentView"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bottomAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintLessThanOrEqualToAnchor:constant:", v12, -4.0));
  v22[3] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v22, 4));
  objc_msgSend(v5, "addObjectsFromArray:", v14);

  return v5;
}

- (BOOL)displaysThirdDetailLine
{
  if (-[CarSearchItemCell shouldShowRating](self, "shouldShowRating"))
    return 1;
  else
    return -[CarSearchItemCell shouldShowThirdLine](self, "shouldShowThirdLine");
}

- (BOOL)shouldShowRating
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchItemCell model](self, "model"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "rating"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchItemCell model](self, "model"));
    v6 = (objc_msgSend(v5, "shouldShowChargerlabel") & 1) == 0
      && (id)-[CarSearchItemCell cellStyle](self, "cellStyle") != (id)1;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)shouldShowThirdLine
{
  void *v3;
  BOOL v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchItemCell model](self, "model"));
  if (objc_msgSend(v3, "shouldShowChargerlabel"))
    v4 = (id)-[CarSearchItemCell cellStyle](self, "cellStyle") != (id)1;
  else
    v4 = 0;

  return v4;
}

- (BOOL)hasChargerNumberString
{
  void *v2;
  void *v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchItemCell model](self, "model"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "chargerNumberString"));
  v4 = v3 != 0;

  return v4;
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)CarSearchItemCell;
  -[CarSearchItemCell setHighlighted:animated:](&v6, "setHighlighted:animated:", a3, a4);
  -[CarSearchItemCell _updateLabelColors:](self, "_updateLabelColors:", v4);
}

- (void)_updateLabelColors:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  uint64_t v18;
  id v19;

  v3 = a3;
  if (a3)
    v5 = objc_claimAutoreleasedReturnValue(+[UIColor _carSystemFocusLabelColor](UIColor, "_carSystemFocusLabelColor"));
  else
    v5 = objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  v6 = (void *)v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchItemCell titleLabel](self, "titleLabel"));
  objc_msgSend(v7, "setTextColor:", v6);

  if ((id)-[CarSearchItemCell cellStyle](self, "cellStyle") == (id)2)
    v8 = objc_claimAutoreleasedReturnValue(+[UIColor systemGreenColor](UIColor, "systemGreenColor"));
  else
    v8 = objc_claimAutoreleasedReturnValue(+[UIColor _carSystemPrimaryColor](UIColor, "_carSystemPrimaryColor"));
  v19 = (id)v8;
  v9 = (void *)v8;
  if (v3)
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemFocusLabelColor](UIColor, "_carSystemFocusLabelColor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchItemCell leadingSubtitleLabel](self, "leadingSubtitleLabel"));
  objc_msgSend(v10, "setTextColor:", v9);

  if (v3)
  {

    v11 = objc_claimAutoreleasedReturnValue(+[UIColor _carSystemFocusLabelColor](UIColor, "_carSystemFocusLabelColor"));
  }
  else
  {
    v11 = objc_claimAutoreleasedReturnValue(+[UIColor _carSystemPrimaryColor](UIColor, "_carSystemPrimaryColor"));
  }
  v12 = (void *)v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchItemCell trailingSubtitleLabel](self, "trailingSubtitleLabel"));
  objc_msgSend(v13, "setTextColor:", v12);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchItemCell ratingView](self, "ratingView"));
  objc_msgSend(v14, "setHighlighted:", v3);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchItemCell model](self, "model"));
  if (!objc_msgSend(v15, "isRecent"))
    goto LABEL_18;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchItemCell model](self, "model"));
  v17 = objc_msgSend(v16, "isShowingStops");

  if (v17)
  {
    if (v3)
      v18 = objc_claimAutoreleasedReturnValue(+[UIColor _carSystemFocusLabelColor](UIColor, "_carSystemFocusLabelColor"));
    else
      v18 = objc_claimAutoreleasedReturnValue(+[UIColor _carSystemPrimaryColor](UIColor, "_carSystemPrimaryColor"));
    v15 = (void *)v18;
    -[CarSearchResultEVChargerView updateLabelColors:](self->_evChargerInfoView, "updateLabelColors:", v18);
LABEL_18:

  }
}

- (id)_firstLineString
{
  int64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = -[CarSearchItemCell cellStyle](self, "cellStyle");
  if (v3 != 2)
  {
    if (v3 == 1)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchItemCell model](self, "model"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mapItem"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_addressFormattedAsName"));

      goto LABEL_6;
    }
    if (v3)
    {
      v5 = 0;
      return v5;
    }
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchItemCell model](self, "model"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstLine"));
LABEL_6:

  return v5;
}

- (id)_leftSecondLineString
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = -[CarSearchItemCell cellStyle](self, "cellStyle");
  if (v3 < 2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchItemCell model](self, "model"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "secondLine"));
LABEL_6:

    return v5;
  }
  if (v3 == 2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchItemCell model](self, "model"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mapItem"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_maps_detourTextForIdiom:", 3));

    goto LABEL_6;
  }
  v5 = 0;
  return v5;
}

- (id)_rightSecondLineString
{
  int64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = -[CarSearchItemCell cellStyle](self, "cellStyle");
  if (v3 == 2)
  {
    v7 = objc_claimAutoreleasedReturnValue(-[CarSearchItemCell _detourDistanceString](self, "_detourDistanceString"));
LABEL_8:
    v6 = (void *)v7;
    return v6;
  }
  if (v3 == 1)
  {
    v7 = objc_claimAutoreleasedReturnValue(-[CarSearchItemCell _etaString](self, "_etaString"));
    goto LABEL_8;
  }
  if (v3)
  {
    v6 = 0;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchItemCell model](self, "model"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mapItem"));
    if (v5)
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchItemCell _etaString](self, "_etaString"));
    else
      v6 = 0;

  }
  return v6;
}

- (id)_etaString
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  NSString *v9;
  _MKRouteETA *routeETA;
  double v11;
  void *v12;

  if (self->_calculatingRouteETA)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Calculating... [CarPlay]"), CFSTR("localized string not found"), 0));

    if (v4)
      goto LABEL_3;
LABEL_8:
    v12 = 0;
    return v12;
  }
  routeETA = self->_routeETA;
  if (!routeETA)
    goto LABEL_8;
  -[_MKRouteETA travelTime](routeETA, "travelTime");
  if (v11 <= 0.0)
    goto LABEL_8;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString _maps_stringWithRemainingTime:](NSString, "_maps_stringWithRemainingTime:"));
  if (!v4)
    goto LABEL_8;
LABEL_3:
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchItemCell traitCollection](self, "traitCollection"));
  v6 = objc_msgSend(v5, "layoutDirection");

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR(".[List view details separator]"), CFSTR("localized string not found"), 0));

  if (v6 == (id)1)
    v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v8);
  else
    v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v8, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v9);

  return v12;
}

- (id)_detourDistanceString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _MKRouteETA *routeETA;
  double v10;
  double v11;
  void *v12;
  void *v13;

  if (self->_calculatingRouteETA)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Calculating... [CarPlay]"), CFSTR("localized string not found"), 0));
  }
  else
  {
    routeETA = self->_routeETA;
    if (!routeETA
      || (-[_MKRouteETA distance](routeETA, "distance"), v10 <= 0.0)
      || (v11 = v10, (id)-[CarSearchItemCell cellStyle](self, "cellStyle") != (id)2))
    {
      v4 = 0;
      return v4;
    }
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString _navigation_localizedStringForDistance:detail:unitFormat:locale:useMetric:useYards:](NSString, "_navigation_localizedStringForDistance:detail:unitFormat:locale:useMetric:useYards:", 0, 1, 0, 0, 0, v11));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("%@ miles away"), CFSTR("localized string not found"), 0));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v13, v3));

  }
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchItemCell _leftSecondLineString](self, "_leftSecondLineString"));

    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR(" · [List view details separator]"), CFSTR("localized string not found"), 0));

      v8 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), v7, v4));
      v4 = (void *)v8;
    }
  }
  return v4;
}

- (void)setRouteETA:(id)a3 animated:(BOOL)a4
{
  double v5;
  double v6;
  void *v7;
  NSTimer *delayedCalculatingTimer;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "travelTime");
  if (v5 >= 0.0 || !self->_routeETA)
  {
    objc_msgSend(v9, "travelTime");
    if (v6 < 0.0)
      v7 = 0;
    else
      v7 = v9;
    objc_storeStrong((id *)&self->_routeETA, v7);
    self->_calculatingRouteETA = 0;
    -[NSTimer invalidate](self->_delayedCalculatingTimer, "invalidate");
    delayedCalculatingTimer = self->_delayedCalculatingTimer;
    self->_delayedCalculatingTimer = 0;

    -[CarSearchItemCell _updateSubtitle](self, "_updateSubtitle");
  }

}

- (void)_refreshRouteETAIfCalculating
{
  NSTimer *delayedCalculatingTimer;

  if (self->_calculatingRouteETA)
    -[CarSearchItemCell _updateSubtitle](self, "_updateSubtitle");
  delayedCalculatingTimer = self->_delayedCalculatingTimer;
  self->_delayedCalculatingTimer = 0;

}

- (void)expectUpdatedRouteETA
{
  NSTimer *v3;
  NSTimer *delayedCalculatingTimer;
  _QWORD v5[4];
  id v6;
  id location;

  if (!self->_routeETA && (!self->_calculatingRouteETA || !self->_delayedCalculatingTimer))
  {
    self->_calculatingRouteETA = 1;
    objc_initWeak(&location, self);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1004A1270;
    v5[3] = &unk_1011ADF20;
    objc_copyWeak(&v6, &location);
    v3 = (NSTimer *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:repeats:block:](NSTimer, "scheduledTimerWithTimeInterval:repeats:block:", 0, v5, 0.5));
    delayedCalculatingTimer = self->_delayedCalculatingTimer;
    self->_delayedCalculatingTimer = v3;

    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

- (CarSearchItemCellModel)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
  objc_storeStrong((id *)&self->_model, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)leadingSubtitleLabel
{
  return self->_leadingSubtitleLabel;
}

- (void)setLeadingSubtitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_leadingSubtitleLabel, a3);
}

- (UILabel)trailingSubtitleLabel
{
  return self->_trailingSubtitleLabel;
}

- (void)setTrailingSubtitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_trailingSubtitleLabel, a3);
}

- (_TtC4Maps28CarSearchResultEVChargerView)evChargerInfoView
{
  return self->_evChargerInfoView;
}

- (void)setEvChargerInfoView:(id)a3
{
  objc_storeStrong((id *)&self->_evChargerInfoView, a3);
}

- (CarStarRatingView)ratingView
{
  return self->_ratingView;
}

- (void)setRatingView:(id)a3
{
  objc_storeStrong((id *)&self->_ratingView, a3);
}

- (int64_t)cellStyle
{
  return self->_cellStyle;
}

- (void)setCellStyle:(int64_t)a3
{
  self->_cellStyle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ratingView, 0);
  objc_storeStrong((id *)&self->_evChargerInfoView, 0);
  objc_storeStrong((id *)&self->_trailingSubtitleLabel, 0);
  objc_storeStrong((id *)&self->_leadingSubtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_currentConstraints, 0);
  objc_storeStrong((id *)&self->_delayedCalculatingTimer, 0);
  objc_storeStrong((id *)&self->_routeETA, 0);
}

@end
