@implementation _SearchResultTableViewCell

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_SearchResultTableViewCell;
  -[_SearchResultTableViewCell prepareForReuse](&v3, "prepareForReuse");
  -[_SearchResultTableViewCell setAccessoryViewType:](self, "setAccessoryViewType:", 0);
  -[_SearchResultTableViewCell setAccessoryViewObject:](self, "setAccessoryViewObject:", 0);
  -[_SearchResultTableViewCell setAccessoryViewDelegate:](self, "setAccessoryViewDelegate:", 0);
}

+ (double)cellHeight
{
  void *v3;
  double v4;
  double v5;

  if (+[UIFont accessibilityTextEnabled](UIFont, "accessibilityTextEnabled"))
    return UITableViewAutomaticDimension;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system15](UIFont, "system15"));
  +[SearchResultTableViewCell estimatedCellHeight](SearchResultTableViewCell, "estimatedCellHeight");
  objc_msgSend(v3, "_mapkit_scaledValueForValue:");
  v5 = v4;

  return v5;
}

+ (double)cellHeightWithTraitCollection:(id)a3 numberOfLines:(unint64_t)a4 hasPlaceContext:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  id v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;

  v5 = a5;
  v8 = a3;
  if (objc_msgSend(v8, "userInterfaceIdiom") == (id)5)
  {
    if (a4)
    {
      v9 = sub_10094EC28();
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      objc_msgSend(v8, "displayScale");
      +[UILabel _maps_maximumHeightWithFont:numberOfLines:displayScale:](UILabel, "_maps_maximumHeightWithFont:numberOfLines:displayScale:", v10, 1);
      v12 = v11 + 9.0;

      if (a4 != 1)
      {
        v13 = sub_10094EC34();
        v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
        objc_msgSend(v8, "displayScale");
        +[UILabel _maps_maximumHeightWithFont:numberOfLines:displayScale:](UILabel, "_maps_maximumHeightWithFont:numberOfLines:displayScale:", v14, 1);
        v16 = v15;

        v12 = v12 + v16 * (double)(a4 - 1);
      }
    }
    else
    {
      v12 = 9.0;
    }
    v18 = fmax(v12, 36.0);
    if (v5)
    {
      objc_msgSend(v8, "displayScale");
      objc_msgSend(a1, "placeContextHeightWithDisplayScale:");
      v18 = v18 + v19;
    }
  }
  else
  {
    objc_msgSend(a1, "cellHeight");
    v18 = v17;
  }

  return v18;
}

+ (double)estimatedCellHeight
{
  return 94.0;
}

+ (double)estimatedTwoLinesCellHeight
{
  return 72.0;
}

+ (id)identifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class(a1);
  return NSStringFromClass(v2);
}

+ (id)accessibilityIdentifier
{
  objc_class *v2;
  NSString *v3;
  void *v4;
  void *v5;

  v2 = (objc_class *)objc_opt_class(a1);
  v3 = NSStringFromClass(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), v4, CFSTR("Accessibility")));

  return v5;
}

+ (double)placeContextHeightWithDisplayScale:(double)a3
{
  void *v4;
  double v5;
  double v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "placeContextLabelFont"));
  +[UILabel _maps_maximumHeightWithFont:numberOfLines:displayScale:](UILabel, "_maps_maximumHeightWithFont:numberOfLines:displayScale:", v4, 1, a3);
  v6 = v5;

  return v6;
}

+ (id)placeContextLabelFont
{
  return +[UIFont system15](UIFont, "system15");
}

+ (id)_delimiterString
{
  if (qword_1014D35C0 != -1)
    dispatch_once(&qword_1014D35C0, &stru_1011D8B68);
  return (id)qword_1014D35B8;
}

- (_SearchResultTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  _SearchResultTableViewCell *v4;
  _SearchResultTableViewCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_SearchResultTableViewCell;
  v4 = -[MapsThemeTableViewCell initWithStyle:reuseIdentifier:](&v7, "initWithStyle:reuseIdentifier:", a3, a4);
  v5 = v4;
  if (v4)
  {
    v4->_displaysDistanceAsSnippetLocationAboveThreshold = 1;
    -[_SearchResultTableViewCell customInit](v4, "customInit");
  }
  return v5;
}

- (void)customInit
{
  void *v3;
  UILabel *v4;
  UILabel *titleLabel;
  void *v6;
  UILabel *v7;
  UILabel *secondLabel;
  void *v9;
  double v10;
  UILabel *v11;
  UILabel *v12;
  UILabel *secondPartLabel;
  void *v14;
  double v15;
  UILabel *v16;
  UILabel *v17;
  UILabel *secondPartDelimiterLabel;
  double v19;
  id v20;
  UILabel *v21;
  void *v22;
  NUIContainerStackView *v23;
  NUIContainerStackView *secondLabelStackView;
  UILabel *v25;
  UILabel *thirdLabel;
  void *v27;
  UIImageView *v28;
  UIImageView *contextualInformationImageView;
  double v30;
  void *v31;
  double v32;
  double v33;
  UILabel *v34;
  UILabel *contextualInformationLabel;
  void *v36;
  void *v37;
  id v38;
  UILabel *v39;
  void *v40;
  NUIContainerStackView *v41;
  NUIContainerStackView *contextualInformationStackView;
  uint64_t v43;
  double v44;
  id v45;
  void *v46;
  NUIContainerStackView *v47;
  NUIContainerStackView *labelStackView;
  double v49;
  double v50;
  id v51;
  void *v52;
  NUIContainerStackView *v53;
  NUIContainerStackView *containerStackView;
  uint64_t v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  id v62;
  void *v63;
  NUIContainerStackView *v64;
  NUIContainerStackView *rootStackView;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  NUIContainerStackView *v73;
  NUIContainerStackView *v74;
  _QWORD v75[3];
  _QWORD v76[2];
  _QWORD v77[3];

  self->_accessibilityEnabled = +[UIFont accessibilityTextEnabled](UIFont, "accessibilityTextEnabled");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[_SearchResultTableViewCell setBackgroundColor:](self, "setBackgroundColor:", v3);

  -[_SearchResultTableViewCell setClipsToBounds:](self, "setClipsToBounds:", 1);
  self->_displayDistanceIfValidCurrentLocation = 1;
  v4 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v4;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[UILabel setBackgroundColor:](self->_titleLabel, "setBackgroundColor:", v6);

  -[UILabel setAccessibilityIdentifier:](self->_titleLabel, "setAccessibilityIdentifier:", CFSTR("TitleLabel"));
  v7 = (UILabel *)objc_alloc_init((Class)UILabel);
  secondLabel = self->_secondLabel;
  self->_secondLabel = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[UILabel setBackgroundColor:](self->_secondLabel, "setBackgroundColor:", v9);

  LODWORD(v10) = 1144717312;
  -[UILabel setContentCompressionResistancePriority:forAxis:](self->_secondLabel, "setContentCompressionResistancePriority:forAxis:", 0, v10);
  -[UILabel setAccessibilityIdentifier:](self->_secondLabel, "setAccessibilityIdentifier:", CFSTR("SecondLabel"));
  v11 = self->_secondLabel;
  if (!self->_accessibilityEnabled)
  {
    v12 = (UILabel *)objc_alloc_init((Class)UILabel);
    secondPartLabel = self->_secondPartLabel;
    self->_secondPartLabel = v12;

    -[UILabel setAccessibilityIdentifier:](self->_secondPartLabel, "setAccessibilityIdentifier:", CFSTR("SecondPartLabel"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[UILabel setBackgroundColor:](self->_secondPartLabel, "setBackgroundColor:", v14);

    LODWORD(v15) = 1144750080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](self->_secondPartLabel, "setContentCompressionResistancePriority:forAxis:", 0, v15);
    v16 = (UILabel *)objc_claimAutoreleasedReturnValue(-[_SearchResultTableViewCell _delimiterLabel](self, "_delimiterLabel"));
    v17 = v11;
    secondPartDelimiterLabel = self->_secondPartDelimiterLabel;
    self->_secondPartDelimiterLabel = v16;

    LODWORD(v19) = 1144733696;
    -[UILabel setContentCompressionResistancePriority:forAxis:](self->_secondPartDelimiterLabel, "setContentCompressionResistancePriority:forAxis:", 0, v19);
    v20 = objc_alloc((Class)NUIContainerStackView);
    v21 = self->_secondPartDelimiterLabel;
    v77[0] = self->_secondLabel;
    v77[1] = v21;
    v77[2] = self->_secondPartLabel;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v77, 3));
    v23 = (NUIContainerStackView *)objc_msgSend(v20, "initWithArrangedSubviews:", v22);
    secondLabelStackView = self->_secondLabelStackView;
    self->_secondLabelStackView = v23;

    -[NUIContainerStackView setAxis:](self->_secondLabelStackView, "setAxis:", 0);
    -[NUIContainerStackView setDistribution:](self->_secondLabelStackView, "setDistribution:", 2);
    v11 = self->_secondLabelStackView;

  }
  v25 = (UILabel *)objc_alloc_init((Class)UILabel);
  thirdLabel = self->_thirdLabel;
  self->_thirdLabel = v25;

  v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[UILabel setBackgroundColor:](self->_thirdLabel, "setBackgroundColor:", v27);

  -[UILabel setAccessibilityIdentifier:](self->_thirdLabel, "setAccessibilityIdentifier:", CFSTR("ThirdLabel"));
  v28 = (UIImageView *)objc_alloc_init((Class)UIImageView);
  contextualInformationImageView = self->_contextualInformationImageView;
  self->_contextualInformationImageView = v28;

  if (sub_1002A8AA0(self) == 5)
    v30 = 12.0;
  else
    v30 = 20.0;
  -[UIImageView setMinimumLayoutSize:](self->_contextualInformationImageView, "setMinimumLayoutSize:", v30, v30);
  -[UIImageView setMaximumLayoutSize:](self->_contextualInformationImageView, "setMaximumLayoutSize:", v30, v30);
  -[UIImageView setContentMode:](self->_contextualInformationImageView, "setContentMode:", 1);
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[UIImageView setBackgroundColor:](self->_contextualInformationImageView, "setBackgroundColor:", v31);

  -[UIImageView setClipsToBounds:](self->_contextualInformationImageView, "setClipsToBounds:", 1);
  LODWORD(v32) = 1148846080;
  -[UIImageView setContentCompressionResistancePriority:forAxis:](self->_contextualInformationImageView, "setContentCompressionResistancePriority:forAxis:", 0, v32);
  LODWORD(v33) = 1144750080;
  -[UIImageView setContentHuggingPriority:forAxis:](self->_contextualInformationImageView, "setContentHuggingPriority:forAxis:", 0, v33);
  v34 = (UILabel *)objc_alloc_init((Class)UILabel);
  contextualInformationLabel = self->_contextualInformationLabel;
  self->_contextualInformationLabel = v34;

  -[UILabel setAccessibilityIdentifier:](self->_contextualInformationLabel, "setAccessibilityIdentifier:", CFSTR("ContextualInformationLabel"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[UILabel setBackgroundColor:](self->_contextualInformationLabel, "setBackgroundColor:", v36);

  v37 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  -[UILabel setTextColor:](self->_contextualInformationLabel, "setTextColor:", v37);

  v38 = objc_alloc((Class)NUIContainerStackView);
  v39 = self->_contextualInformationLabel;
  v76[0] = self->_contextualInformationImageView;
  v76[1] = v39;
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v76, 2));
  v41 = (NUIContainerStackView *)objc_msgSend(v38, "initWithArrangedSubviews:", v40);
  contextualInformationStackView = self->_contextualInformationStackView;
  self->_contextualInformationStackView = v41;

  -[NUIContainerStackView setDelegate:](self->_contextualInformationStackView, "setDelegate:", self);
  -[NUIContainerStackView setAxis:](self->_contextualInformationStackView, "setAxis:", 0);
  -[NUIContainerStackView setAlignment:](self->_contextualInformationStackView, "setAlignment:", 3);
  v43 = sub_1002A8AA0(self);
  v44 = 10.0;
  if (v43 == 5)
    v44 = 5.0;
  -[NUIContainerStackView _setTouchInsets:](self->_contextualInformationStackView, "_setTouchInsets:", -v44, -v44, -v44, -v44);
  -[NUIContainerStackView setSpacing:](self->_contextualInformationStackView, "setSpacing:", 4.0);
  v72 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "didTapOnPlaceContextWithViewModel:");
  -[NUIContainerStackView addGestureRecognizer:](self->_contextualInformationStackView, "addGestureRecognizer:");
  v45 = objc_alloc((Class)NUIContainerStackView);
  v75[0] = self->_titleLabel;
  v75[1] = v11;
  v75[2] = self->_thirdLabel;
  v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v75, 3));
  v47 = (NUIContainerStackView *)objc_msgSend(v45, "initWithArrangedSubviews:", v46);
  labelStackView = self->_labelStackView;
  self->_labelStackView = v47;

  -[NUIContainerStackView setDelegate:](self->_labelStackView, "setDelegate:", self);
  -[NUIContainerStackView setAxis:](self->_labelStackView, "setAxis:", 1);
  -[NUIContainerStackView setAlignment:](self->_labelStackView, "setAlignment:", 1);
  LODWORD(v49) = 1112014848;
  -[NUIContainerStackView setContentHuggingPriority:forAxis:](self->_labelStackView, "setContentHuggingPriority:forAxis:", 0, v49);
  LODWORD(v50) = 1112014848;
  -[NUIContainerStackView setContentCompressionResistancePriority:forAxis:](self->_labelStackView, "setContentCompressionResistancePriority:forAxis:", 0, v50);
  v51 = objc_alloc((Class)NUIContainerStackView);
  v74 = self->_labelStackView;
  v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v74, 1));
  v53 = (NUIContainerStackView *)objc_msgSend(v51, "initWithArrangedSubviews:", v52);
  containerStackView = self->_containerStackView;
  self->_containerStackView = v53;

  -[NUIContainerStackView setDelegate:](self->_containerStackView, "setDelegate:", self);
  -[NUIContainerStackView setAlignment:](self->_containerStackView, "setAlignment:", -[_SearchResultTableViewCell containerAlignment](self, "containerAlignment"));
  -[_SearchResultTableViewCell updateImageViewAlignmentAndSpacingIfNeeded](self, "updateImageViewAlignmentAndSpacingIfNeeded");
  -[NUIContainerStackView setLayoutMarginsRelativeArrangement:](self->_containerStackView, "setLayoutMarginsRelativeArrangement:", 1);
  v55 = sub_1002A8AA0(self);
  -[_SearchResultTableViewCell leadingMargin](self, "leadingMargin");
  v57 = v56;
  -[_SearchResultTableViewCell trailingMargin](self, "trailingMargin");
  v59 = v58;
  v60 = -1.0;
  if (v55 == 5)
    v60 = 4.5;
  v61 = 1.0;
  if (v55 == 5)
    v61 = 4.5;
  -[NUIContainerStackView setLayoutMargins:](self->_containerStackView, "setLayoutMargins:", v60, v57, v61, v59);
  -[NUIContainerStackView setInvalidatingIntrinsicContentSizeAlsoInvalidatesSuperview:](self->_containerStackView, "setInvalidatingIntrinsicContentSizeAlsoInvalidatesSuperview:", 1);
  v62 = objc_alloc((Class)NUIContainerStackView);
  v73 = self->_containerStackView;
  v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v73, 1));
  v64 = (NUIContainerStackView *)objc_msgSend(v62, "initWithArrangedSubviews:", v63);
  rootStackView = self->_rootStackView;
  self->_rootStackView = v64;

  -[NUIContainerStackView setDelegate:](self->_rootStackView, "setDelegate:", self);
  -[NUIContainerStackView setAxis:](self->_rootStackView, "setAxis:", 1);
  -[_SearchResultTableViewCell _updateDebugLabel](self, "_updateDebugLabel");
  -[_SearchResultTableViewCell updateFonts](self, "updateFonts");
  -[_SearchResultTableViewCell _updateSpacings](self, "_updateSpacings");
  if (self->_accessibilityEnabled)
    -[_SearchResultTableViewCell accessibilitySetup](self, "accessibilitySetup");
  v66 = (void *)objc_claimAutoreleasedReturnValue(-[_SearchResultTableViewCell contentView](self, "contentView"));
  objc_msgSend(v66, "addSubview:", self->_rootStackView);

  v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v67, "addObserver:selector:name:object:", self, "preferredContentSizeChanged:", UIContentSizeCategoryDidChangeNotification, 0);

  v68 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", v68);

  v69 = (void *)objc_claimAutoreleasedReturnValue(-[_SearchResultTableViewCell secondaryLabelColor](self, "secondaryLabelColor"));
  -[UILabel setTextColor:](self->_secondLabel, "setTextColor:", v69);

  v70 = (void *)objc_claimAutoreleasedReturnValue(-[_SearchResultTableViewCell secondaryLabelColor](self, "secondaryLabelColor"));
  -[UILabel setTextColor:](self->_secondPartLabel, "setTextColor:", v70);

  v71 = (void *)objc_claimAutoreleasedReturnValue(-[_SearchResultTableViewCell secondaryLabelColor](self, "secondaryLabelColor"));
  -[UILabel setTextColor:](self->_thirdLabel, "setTextColor:", v71);

}

- (BOOL)canBecomeFirstResponder
{
  return sub_1002A8AA0(self) == 5;
}

- (void)preferredContentSizeChanged:(id)a3
{
  id v4;

  -[_SearchResultTableViewCell updateFonts](self, "updateFonts", a3);
  -[_SearchResultTableViewCell _updateSpacings](self, "_updateSpacings");
  v4 = (id)objc_claimAutoreleasedReturnValue(-[_SearchResultTableViewCell contentView](self, "contentView"));
  objc_msgSend(v4, "setNeedsLayout");

}

- (void)accessibilitySetup
{
  double v3;
  double v4;
  double v5;

  -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 0);
  -[UILabel setNumberOfLines:](self->_secondLabel, "setNumberOfLines:", 0);
  -[UILabel setNumberOfLines:](self->_thirdLabel, "setNumberOfLines:", 0);
  -[_SearchResultTableViewCell leadingMargin](self, "leadingMargin");
  v4 = v3;
  -[_SearchResultTableViewCell trailingMargin](self, "trailingMargin");
  -[NUIContainerStackView setLayoutMargins:](self->_containerStackView, "setLayoutMargins:", 15.0, v4, 15.0, v5);
}

- (void)_updateSpacings
{
  void *v3;
  unint64_t v4;
  unint64_t v5;
  NUIContainerStackView *labelStackView;
  void *v7;
  id v8;

  if (sub_1002A8AA0(self) == 5)
  {
    -[_SearchResultTableViewCell horizontalSpacing](self, "horizontalSpacing");
    -[NUIContainerStackView setSpacing:](self->_containerStackView, "setSpacing:");
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[_SearchResultTableViewCell titleRegularFont](self, "titleRegularFont"));
    -[_SearchResultTableViewCell horizontalSpacing](self, "horizontalSpacing");
    objc_msgSend(v3, "_mapkit_scaledValueForValue:");
    -[NUIContainerStackView setSpacing:](self->_containerStackView, "setSpacing:");

    -[_SearchResultTableViewCell labelStackViewSpacing](self, "labelStackViewSpacing");
    -[NUIContainerStackView setSpacing:](self->_labelStackView, "setSpacing:");
    v4 = -[_SearchResultTableViewCell indexOfVisibleLabelAboveContextualInformationStackView](self, "indexOfVisibleLabelAboveContextualInformationStackView");
    if (v4 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v5 = v4;
      labelStackView = self->_labelStackView;
      v8 = (id)objc_claimAutoreleasedReturnValue(-[NUIContainerStackView arrangedSubviews](labelStackView, "arrangedSubviews"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndex:", v5));
      -[NUIContainerStackView setCustomSpacing:afterView:](labelStackView, "setCustomSpacing:afterView:", v7, 7.0);

    }
  }
}

- (unint64_t)indexOfVisibleLabelAboveContextualInformationStackView
{
  void *v3;
  unint64_t v4;
  _QWORD v6[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0x7FFFFFFFFFFFFFFFLL;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NUIContainerStackView arrangedSubviews](self->_labelStackView, "arrangedSubviews"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1008366B0;
  v6[3] = &unk_1011D8B90;
  v6[4] = self;
  v6[5] = &v7;
  v6[6] = &v11;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v6);

  if (*((_BYTE *)v8 + 24))
    v4 = v12[3];
  else
    v4 = 0x7FFFFFFFFFFFFFFFLL;
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(&v11, 8);
  return v4;
}

- (double)paddingAboveContextualInformationStackView
{
  return 8.0;
}

- (id)distanceString
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v8;
  void *v9;
  uint64_t v10;

  if (!-[_SearchResultTableViewCell displayDistanceIfValidCurrentLocation](self, "displayDistanceIfValidCurrentLocation"))
  {
    v6 = 0;
    return v6;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_SearchResultTableViewCell currentLocation](self, "currentLocation"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_SearchResultTableViewCell mapItem](self, "mapItem"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString distanceStringFromLocation:toMapItem:showsDistance:](NSString, "distanceStringFromLocation:toMapItem:showsDistance:", v3, v4, &self->_showDistance));

  if (!self->_showDistance)
  {
    if (-[_SearchResultTableViewCell displaysAsChainResult](self, "displaysAsChainResult"))
    {
      v6 = 0;
      goto LABEL_4;
    }
    if (-[_SearchResultTableViewCell displaysDistanceAsSnippetLocationAboveThreshold](self, "displaysDistanceAsSnippetLocationAboveThreshold"))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[_SearchResultTableViewCell mapItem](self, "mapItem"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_geoMapItem"));
      v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_resultSnippetLocationString"));

      v5 = (void *)v10;
    }
  }
  v6 = v5;
  v5 = v6;
LABEL_4:

  return v6;
}

- (void)addTransitLabel
{
  MKTransitInfoLabelView *transitInfoLabel;
  MKTransitInfoLabelView *v4;
  MKTransitInfoLabelView *v5;
  void *v6;

  transitInfoLabel = self->_transitInfoLabel;
  if (!transitInfoLabel)
  {
    v4 = (MKTransitInfoLabelView *)objc_alloc_init((Class)MKTransitInfoLabelView);
    v5 = self->_transitInfoLabel;
    self->_transitInfoLabel = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[MKTransitInfoLabelView setBackgroundColor:](self->_transitInfoLabel, "setBackgroundColor:", v6);

    transitInfoLabel = self->_transitInfoLabel;
  }
  if (-[NUIContainerStackView indexOfArrangedSubview:](self->_labelStackView, "indexOfArrangedSubview:", transitInfoLabel) == (id)0x7FFFFFFFFFFFFFFFLL)-[NUIContainerStackView addArrangedSubview:](self->_labelStackView, "addArrangedSubview:", self->_transitInfoLabel);
}

- (void)removeTransitLabel
{
  -[NUIContainerStackView removeArrangedSubview:](self->_labelStackView, "removeArrangedSubview:", self->_transitInfoLabel);
  -[MKTransitInfoLabelView removeFromSuperview](self->_transitInfoLabel, "removeFromSuperview");
}

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_SearchResultTableViewCell;
  -[_SearchResultTableViewCell layoutSubviews](&v4, "layoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_SearchResultTableViewCell contentView](self, "contentView"));
  objc_msgSend(v3, "bounds");
  -[NUIContainerStackView setFrame:](self->_rootStackView, "setFrame:");

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  CGSize result;

  width = a3.width;
  if (self->_accessibilityEnabled)
  {
    -[NUIContainerStackView sizeThatFits:](self->_rootStackView, "sizeThatFits:", a3.width, a3.height);
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system15](UIFont, "system15", a3.width, a3.height));
    objc_msgSend((id)objc_opt_class(self), "estimatedCellHeight");
    objc_msgSend(v7, "_mapkit_scaledValueForValue:");
    v9 = v8;

    v5 = width;
    v6 = v9;
  }
  result.height = v6;
  result.width = v5;
  return result;
}

- (CGSize)intrinsicContentSize
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  objc_super v19;
  CGSize result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_SearchResultTableViewCell contentView](self, "contentView"));
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v19.receiver = self;
  v19.super_class = (Class)_SearchResultTableViewCell;
  -[_SearchResultTableViewCell intrinsicContentSize](&v19, "intrinsicContentSize");
  v13 = v12;
  v15 = v14;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[_SearchResultTableViewCell contentView](self, "contentView"));
  objc_msgSend(v16, "setFrame:", v5, v7, v9, v11);

  v17 = v13;
  v18 = v15;
  result.height = v18;
  result.width = v17;
  return result;
}

- (void)setMapItem:(id)a3
{
  MKMapItem *v5;
  MKMapItem *v6;

  v5 = (MKMapItem *)a3;
  if (self->_mapItem != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_mapItem, a3);
    -[_SearchResultTableViewCell didUpdateMapItem](self, "didUpdateMapItem");
    v5 = v6;
  }

}

- (void)setRelatedSection:(id)a3
{
  GEORelatedEntitySection *v5;
  GEORelatedEntitySection *v6;

  v5 = (GEORelatedEntitySection *)a3;
  if (self->_relatedSection != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_relatedSection, a3);
    -[_SearchResultTableViewCell didUpdateRelatedSection](self, "didUpdateRelatedSection");
    v5 = v6;
  }

}

- (void)setPublisherResult:(id)a3
{
  GEOPublisherResult *v5;
  GEOPublisherResult *v6;

  v5 = (GEOPublisherResult *)a3;
  if (self->_publisherResult != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_publisherResult, a3);
    v5 = v6;
    if (v6)
    {
      -[_SearchResultTableViewCell didUpdatePublisherResult](self, "didUpdatePublisherResult");
      v5 = v6;
    }
  }

}

- (void)setDebugString:(id)a3
{
  NSString *v5;
  NSString *v6;

  v5 = (NSString *)a3;
  if (self->_debugString != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_debugString, a3);
    -[_SearchResultTableViewCell _updateDebugLabel](self, "_updateDebugLabel");
    v5 = v6;
  }

}

- (void)needsUpdate
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_SearchResultTableViewCell window](self, "window"));

  if (v3)
  {
    -[_SearchResultTableViewCell updateContent](self, "updateContent");
    v4 = (id)objc_claimAutoreleasedReturnValue(-[_SearchResultTableViewCell contentView](self, "contentView"));
    objc_msgSend(v4, "setNeedsLayout");

  }
}

- (void)_clearModel
{
  MKMapItem *mapItem;
  GEOPublisherResult *publisherResult;

  mapItem = self->_mapItem;
  self->_mapItem = 0;

  publisherResult = self->_publisherResult;
  self->_publisherResult = 0;

}

- (id)_delimiterLabel
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc_init((Class)UILabel);
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("DelimiterLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  objc_msgSend(v3, "setBackgroundColor:", v4);

  v5 = objc_msgSend((id)objc_opt_class(self), "_delimiterString");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_msgSend(v3, "setText:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  objc_msgSend(v3, "setTextColor:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[_SearchResultTableViewCell secondaryLabelFont](self, "secondaryLabelFont"));
  objc_msgSend(v3, "setFont:", v8);

  objc_msgSend(v3, "setTextAlignment:", 0);
  return v3;
}

- (void)updateContent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL4 accessibilityEnabled;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL8 v17;
  UILabel *secondLabel;
  void *v19;
  void *v20;
  unsigned int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  unsigned int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  unsigned int v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  UILabel *secondPartDelimiterLabel;
  uint64_t v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  _QWORD v51[3];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_SearchResultTableViewCell mapItem](self, "mapItem"));
  if (v3)
  {

  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[_SearchResultTableViewCell publisherResult](self, "publisherResult"));

    if (!v4)
      return;
  }
  self->_showDistance = 0;
  self->_onlyDistanceOrEmpty = 1;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_SearchResultTableViewCell attributedTitleString](self, "attributedTitleString"));
  -[UILabel setAttributedText:](self->_titleLabel, "setAttributedText:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[_SearchResultTableViewCell attributedFirstPartDetailString](self, "attributedFirstPartDetailString"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[_SearchResultTableViewCell attributedSecondPartDetailString](self, "attributedSecondPartDetailString"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[_SearchResultTableViewCell delimiterColor](self, "delimiterColor"));
  -[UILabel setTextColor:](self->_secondPartDelimiterLabel, "setTextColor:", v8);

  accessibilityEnabled = self->_accessibilityEnabled;
  v10 = objc_msgSend(v6, "length");
  if (accessibilityEnabled)
  {
    if (v10)
    {
      if (objc_msgSend(v7, "length"))
      {
        v51[0] = v6;
        v11 = objc_alloc((Class)NSAttributedString);
        v12 = objc_msgSend((id)objc_opt_class(self), "_delimiterString");
        v49 = (void *)objc_claimAutoreleasedReturnValue(v12);
        v13 = objc_msgSend(v11, "initWithString:", v49);
        v51[1] = v13;
        v51[2] = v7;
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v51, 3));
        v15 = v7;
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[_SearchResultTableViewCell _concatenateAttributedStrings:](self, "_concatenateAttributedStrings:", v14));
        -[UILabel setAttributedText:](self->_secondLabel, "setAttributedText:", v16);

        v7 = v15;
        goto LABEL_15;
      }
      secondLabel = self->_secondLabel;
      v19 = v6;
    }
    else
    {
      secondLabel = self->_secondLabel;
      v19 = v7;
    }
    -[UILabel setAttributedText:](secondLabel, "setAttributedText:", v19);
  }
  else
  {
    if (v10)
      v17 = objc_msgSend(v7, "length") == 0;
    else
      v17 = 1;
    -[UILabel setHidden:](self->_secondPartDelimiterLabel, "setHidden:", v17);
    -[UILabel setAttributedText:](self->_secondLabel, "setAttributedText:", v6);
    -[UILabel setAttributedText:](self->_secondPartLabel, "setAttributedText:", v7);
  }
LABEL_15:
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[_SearchResultTableViewCell mapItem](self, "mapItem"));
  v21 = objc_msgSend(v20, "_hasTransitLabels");

  if (v21)
  {
    -[_SearchResultTableViewCell addTransitLabel](self, "addTransitLabel");
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[_SearchResultTableViewCell mapItem](self, "mapItem"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "_preloadedTransitInfo"));

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[_SearchResultTableViewCell mapItem](self, "mapItem"));
    if (v23)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "_preloadedTransitInfo"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[MKTransitInfoPreloader attributedTextFromPreload:view:](MKTransitInfoPreloader, "attributedTextFromPreload:view:", v25, self->_transitInfoLabel));
      -[MKTransitInfoLabelView setAttributedText:](self->_transitInfoLabel, "setAttributedText:", v26);

    }
    else
    {
      -[MKTransitInfoLabelView setMapItem:](self->_transitInfoLabel, "setMapItem:", v24);
    }

    goto LABEL_31;
  }
  -[_SearchResultTableViewCell removeTransitLabel](self, "removeTransitLabel");
  if (-[_SearchResultTableViewCell displaysAsChainResult](self, "displaysAsChainResult"))
  {
LABEL_31:
    -[UILabel setHidden:](self->_thirdLabel, "setHidden:", 1);
    goto LABEL_32;
  }
  v27 = -[_SearchResultTableViewCell shouldShowFallbackToAddressAndDistance](self, "shouldShowFallbackToAddressAndDistance");
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[_SearchResultTableViewCell attributedSubtitleString](self, "attributedSubtitleString"));
  -[UILabel setAttributedText:](self->_thirdLabel, "setAttributedText:", v28);

  -[UILabel setHidden:](self->_thirdLabel, "setHidden:", 0);
  if (v27)
  {
    v50 = v7;
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[_SearchResultTableViewCell distanceString](self, "distanceString"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[_SearchResultTableViewCell mapItem](self, "mapItem"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "_addressFormattedAsCity"));

    if (!v31
      || (v32 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel text](self->_titleLabel, "text")),
          v33 = objc_msgSend(v32, "isEqualToString:", v31),
          v32,
          v33))
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[_SearchResultTableViewCell mapItem](self, "mapItem"));
      v35 = objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "_addressFormattedAsSinglelineAddress"));

      v31 = (void *)v35;
    }
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 2));
    if (objc_msgSend(v31, "length"))
      objc_msgSend(v36, "addObject:", v31);
    if (objc_msgSend(v29, "length"))
      objc_msgSend(v36, "addObject:", v29);
    if ((unint64_t)objc_msgSend(v36, "count") > 1)
    {
      v41 = objc_msgSend((id)objc_opt_class(self), "_delimiterString");
      v37 = (void *)objc_claimAutoreleasedReturnValue(v41);
      -[UILabel setText:](self->_thirdLabel, "setText:", &stru_1011EB268);
      -[UILabel setHidden:](self->_thirdLabel, "setHidden:", 1);
      if (self->_accessibilityEnabled)
      {
        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "objectAtIndexedSubscript:", 0));
        v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "objectAtIndexedSubscript:", 1));
        v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@%@"), v42, v37, v43));
        -[UILabel setText:](self->_secondLabel, "setText:", v44);

LABEL_38:
        v7 = v50;
        goto LABEL_32;
      }
      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "objectAtIndexedSubscript:", 0));
      -[UILabel setText:](self->_secondLabel, "setText:", v45);

      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "objectAtIndexedSubscript:", 1));
      -[UILabel setText:](self->_secondPartLabel, "setText:", v46);

      v47 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
      -[UILabel setTextColor:](self->_secondLabel, "setTextColor:", v47);

      v48 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
      -[UILabel setTextColor:](self->_secondPartLabel, "setTextColor:", v48);

      secondPartDelimiterLabel = self->_secondPartDelimiterLabel;
      v39 = 0;
    }
    else
    {
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "firstObject"));
      -[UILabel setText:](self->_thirdLabel, "setText:", v37);
      -[UILabel setHidden:](self->_thirdLabel, "setHidden:", 0);
      -[UILabel setText:](self->_secondLabel, "setText:", &stru_1011EB268);
      -[UILabel setText:](self->_secondPartLabel, "setText:", &stru_1011EB268);
      secondPartDelimiterLabel = self->_secondPartDelimiterLabel;
      v39 = 1;
    }
    -[UILabel setHidden:](secondPartDelimiterLabel, "setHidden:", v39);
    goto LABEL_38;
  }
LABEL_32:
  -[NUIContainerStackView setAlignment:](self->_containerStackView, "setAlignment:", -[_SearchResultTableViewCell containerAlignment](self, "containerAlignment"));
  -[_SearchResultTableViewCell updateImageViewAlignmentAndSpacingIfNeeded](self, "updateImageViewAlignmentAndSpacingIfNeeded");
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[_SearchResultTableViewCell placeContextViewModel](self, "placeContextViewModel"));
  -[_SearchResultTableViewCell setupPlaceContextContent:](self, "setupPlaceContextContent:", v40);

}

- (void)setupPlaceContextContent:(id)a3
{
  double v4;
  double v5;
  double v6;
  id v7;

  v7 = a3;
  if (sub_1002A8AA0(self) == 5)
  {
    -[_SearchResultTableViewCell setupPlaceContextContent:inStackView:](self, "setupPlaceContextContent:inStackView:", v7, self->_labelStackView);

  }
  else
  {
    -[_SearchResultTableViewCell setupPlaceContextContent:inStackView:](self, "setupPlaceContextContent:inStackView:", v7, self->_rootStackView);

    -[_SearchResultTableViewCell leadingMargin](self, "leadingMargin");
    v5 = -v4;
    -[_SearchResultTableViewCell trailingMargin](self, "trailingMargin");
    -[NUIContainerStackView setCustomAlignmentRectInsets:](self->_contextualInformationStackView, "setCustomAlignmentRectInsets:", 0.0, v5, -14.3299999, -v6);
  }
}

- (void)setupPlaceContextContent:(id)a3 inStackView:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  NUIContainerStackView *contextualInformationStackView;
  UIImageView *contextualInformationImageView;
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
  id v23;

  v23 = a3;
  v6 = a4;
  if (v23)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[_SearchResultTableViewCell placeContextViewModel](self, "placeContextViewModel"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "image"));

    contextualInformationStackView = self->_contextualInformationStackView;
    contextualInformationImageView = self->_contextualInformationImageView;
    if (v8)
    {
      -[NUIContainerStackView insertArrangedSubview:atIndex:](contextualInformationStackView, "insertArrangedSubview:atIndex:", contextualInformationImageView, 0);
    }
    else
    {
      -[NUIContainerStackView removeArrangedSubview:](contextualInformationStackView, "removeArrangedSubview:", contextualInformationImageView);
      -[UIImageView removeFromSuperview](self->_contextualInformationImageView, "removeFromSuperview");
    }
    objc_msgSend(v6, "addArrangedSubview:", self->_contextualInformationStackView);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[_SearchResultTableViewCell placeContextViewModel](self, "placeContextViewModel"));
    -[NUIContainerStackView setUserInteractionEnabled:](self->_contextualInformationStackView, "setUserInteractionEnabled:", objc_msgSend(v11, "isTappable"));

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[_SearchResultTableViewCell placeContextViewModel](self, "placeContextViewModel"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "image"));
    -[UIImageView setImage:](self->_contextualInformationImageView, "setImage:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[_SearchResultTableViewCell placeContextViewModel](self, "placeContextViewModel"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "imageTintColor"));
    -[UIImageView setTintColor:](self->_contextualInformationImageView, "setTintColor:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[_SearchResultTableViewCell placeContextViewModel](self, "placeContextViewModel"));
    objc_msgSend(v16, "imageContinuousCornerRadius");
    -[UIImageView _setContinuousCornerRadius:](self->_contextualInformationImageView, "_setContinuousCornerRadius:");

    if (sub_1002A8AA0(self) == 5 && -[_SearchResultTableViewCell isSelected](self, "isSelected"))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[_SearchResultTableViewCell placeContextViewModel](self, "placeContextViewModel"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "highlightedAttributedString"));
      -[UILabel setAttributedText:](self->_contextualInformationLabel, "setAttributedText:", v18);

      v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
      -[UIImageView setTintColor:](self->_contextualInformationImageView, "setTintColor:", v19);
    }
    else
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[_SearchResultTableViewCell placeContextViewModel](self, "placeContextViewModel"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "attributedString"));
      -[UILabel setAttributedText:](self->_contextualInformationLabel, "setAttributedText:", v21);

      v19 = (void *)objc_claimAutoreleasedReturnValue(-[_SearchResultTableViewCell placeContextViewModel](self, "placeContextViewModel"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "imageTintColor"));
      -[UIImageView setTintColor:](self->_contextualInformationImageView, "setTintColor:", v22);

    }
  }
  else
  {
    objc_msgSend(v6, "removeArrangedSubview:", self->_contextualInformationStackView);
    -[NUIContainerStackView removeFromSuperview](self->_contextualInformationStackView, "removeFromSuperview");
  }

}

- (BOOL)shouldShowFallbackToAddressAndDistance
{
  void *v3;
  unsigned __int8 v4;
  void *v5;
  unsigned int v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_SearchResultTableViewCell mapItem](self, "mapItem"));
  v4 = objc_msgSend(v3, "_hasPriceRange");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_SearchResultTableViewCell mapItem](self, "mapItem"));
  v6 = objc_msgSend(v5, "_sampleSizeForUserRatingScore");

  if (self->_onlyDistanceOrEmpty)
    return (v6 == 0) & ~v4;
  else
    return 0;
}

- (id)_concatenateAttributedStrings:(id)a3
{
  id v3;
  NSMutableAttributedString *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = a3;
  v4 = objc_opt_new(NSMutableAttributedString);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v10, "length", (_QWORD)v12))
          -[NSMutableAttributedString appendAttributedString:](v4, "appendAttributedString:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (void)updateFonts
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_SearchResultTableViewCell titleFont](self, "titleFont"));
  -[UILabel setFont:](self->_titleLabel, "setFont:", v3);

  v6 = (id)objc_claimAutoreleasedReturnValue(-[_SearchResultTableViewCell secondaryLabelFont](self, "secondaryLabelFont"));
  -[UILabel setFont:](self->_secondLabel, "setFont:", v6);
  -[UILabel setFont:](self->_secondPartLabel, "setFont:", v6);
  -[UILabel setFont:](self->_secondPartDelimiterLabel, "setFont:", v6);
  -[UILabel setFont:](self->_transitDelimiterLabel, "setFont:", v6);
  -[UILabel setFont:](self->_thirdLabel, "setFont:", v6);
  v4 = objc_msgSend((id)objc_opt_class(self), "placeContextLabelFont");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  -[UILabel setFont:](self->_contextualInformationLabel, "setFont:", v5);

}

- (void)updateTheme
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_SearchResultTableViewCell;
  -[MapsThemeTableViewCell updateTheme](&v4, "updateTheme");
  -[_SearchResultTableViewCell updateContent](self, "updateContent");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_SearchResultTableViewCell contentView](self, "contentView"));
  objc_msgSend(v3, "setNeedsLayout");

}

- (void)_updateDebugLabel
{
  NSString *debugString;
  UILabel *debugLabel;
  UILabel *v5;
  UILabel *v6;
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
  UILabel *v19;

  debugString = self->_debugString;
  debugLabel = self->_debugLabel;
  if (debugString)
  {
    if (!debugLabel)
    {
      v5 = (UILabel *)objc_alloc_init((Class)UILabel);
      v6 = self->_debugLabel;
      self->_debugLabel = v5;

      -[UILabel setAccessibilityIdentifier:](self->_debugLabel, "setAccessibilityIdentifier:", CFSTR("SearchCellDebug"));
      -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_debugLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system11](UIFont, "system11"));
      -[UILabel setFont:](self->_debugLabel, "setFont:", v7);

      v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor redColor](UIColor, "redColor"));
      -[UILabel setTextColor:](self->_debugLabel, "setTextColor:", v8);

      -[UILabel setAlpha:](self->_debugLabel, "setAlpha:", 0.5);
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
      -[UILabel setBackgroundColor:](self->_debugLabel, "setBackgroundColor:", v9);

      v10 = (void *)objc_claimAutoreleasedReturnValue(-[_SearchResultTableViewCell contentView](self, "contentView"));
      objc_msgSend(v10, "addSubview:", self->_debugLabel);

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_debugLabel, "leadingAnchor"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[_SearchResultTableViewCell contentView](self, "contentView"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "leadingAnchor"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:constant:", v13, 10.0));
      objc_msgSend(v14, "setActive:", 1);

      v15 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_debugLabel, "bottomAnchor"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[_SearchResultTableViewCell contentView](self, "contentView"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "bottomAnchor"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:constant:", v17, -2.0));
      objc_msgSend(v18, "setActive:", 1);

      debugString = self->_debugString;
      debugLabel = self->_debugLabel;
    }
    -[UILabel setText:](debugLabel, "setText:", debugString);
  }
  else if (debugLabel)
  {
    -[UILabel removeFromSuperview](debugLabel, "removeFromSuperview");
    v19 = self->_debugLabel;
    self->_debugLabel = 0;

  }
}

- (id)titleFont
{
  id v2;
  void *v3;

  if (sub_1002A8AA0(self) == 5)
  {
    v2 = sub_10094EC28();
    v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system20AdaptiveSemibold](UIFont, "system20AdaptiveSemibold"));
  }
  return v3;
}

- (id)titleHighlightFont
{
  id v2;
  void *v3;

  if (sub_1002A8AA0(self) == 5)
  {
    v2 = sub_10094EC28();
    v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system20AdaptiveSemibold](UIFont, "system20AdaptiveSemibold"));
  }
  return v3;
}

- (id)titleRegularFont
{
  id v2;
  void *v3;

  if (sub_1002A8AA0(self) == 5)
  {
    v2 = sub_10094EC28();
    v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system20Adaptive](UIFont, "system20Adaptive"));
  }
  return v3;
}

- (id)secondaryLabelFont
{
  id v2;
  void *v3;

  if (sub_1002A8AA0(self) == 5)
  {
    v2 = sub_10094EC34();
    v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system15](UIFont, "system15"));
  }
  return v3;
}

- (id)secondaryLabelColor
{
  void *v3;

  if (sub_1002A8AA0(self) == 5 || -[_SearchResultTableViewCell displaysAsChainResult](self, "displaysAsChainResult"))
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  else
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  return v3;
}

- (double)leadingMargin
{
  sub_1002A8AA0(self);
  return 16.0;
}

- (unint64_t)numberOfLines
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel text](self->_titleLabel, "text"));
  v4 = objc_msgSend(v3, "length");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel text](self->_secondLabel, "text"));
  v6 = objc_msgSend(v5, "length");

  v7 = 1;
  if (v4)
    v7 = 2;
  if (v6)
    v8 = v7;
  else
    v8 = v4 != 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel text](self->_thirdLabel, "text"));
  if (objc_msgSend(v9, "length"))
  {

    return ++v8;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MKTransitInfoLabelView text](self->_transitInfoLabel, "text"));
  v11 = objc_msgSend(v10, "length");

  if (v11)
    return ++v8;
  return v8;
}

- (int64_t)containerAlignment
{
  if (sub_1002A8AA0(self) == 5)
    return 1;
  else
    return 3;
}

- (double)horizontalSpacing
{
  uint64_t v2;
  double result;

  v2 = sub_1002A8AA0(self);
  result = 10.0;
  if (v2 == 5)
    return 8.0;
  return result;
}

- (double)trailingMargin
{
  return 10.0;
}

- (void)didUpdateMapItem
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_SearchResultTableViewCell window](self, "window"));

  if (v3)
  {
    -[_SearchResultTableViewCell updateContent](self, "updateContent");
    -[_SearchResultTableViewCell _updateSpacings](self, "_updateSpacings");
  }
}

- (void)didUpdatePublisherResult
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_SearchResultTableViewCell window](self, "window"));

  if (v3)
    -[_SearchResultTableViewCell updateContent](self, "updateContent");
}

- (void)didUpdateRelatedSection
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_SearchResultTableViewCell window](self, "window"));

  if (v3)
    -[_SearchResultTableViewCell updateContent](self, "updateContent");
}

- (id)attributedTitleString
{
  id v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  const __CFString *v10;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[_SearchResultTableViewCell mapItem](self, "mapItem"));

  if (v3)
  {
    if (-[_SearchResultTableViewCell displaysAsChainResult](self, "displaysAsChainResult"))
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[_SearchResultTableViewCell mapItem](self, "mapItem"));
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_addressFormattedAsName"));
    }
    else
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[_SearchResultTableViewCell relatedSection](self, "relatedSection"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
      v7 = v6;
      if (v6)
      {
        v5 = v6;
      }
      else
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[_SearchResultTableViewCell mapItem](self, "mapItem"));
        v5 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "name"));

      }
    }

    v9 = objc_alloc((Class)NSAttributedString);
    if (v5)
      v10 = v5;
    else
      v10 = &stru_1011EB268;
    v3 = objc_msgSend(v9, "initWithString:", v10);

  }
  return v3;
}

- (id)attributedSubtitleString
{
  void *v3;
  __CFString *v4;
  id v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  NSAttributedStringKey v24;
  void *v25;
  _QWORD v26[2];
  _QWORD v27[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_SearchResultTableViewCell hoursBuilderForSearchCell](self, "hoursBuilderForSearchCell"));
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedOperatingHours"));

  v5 = objc_alloc((Class)NSMutableAttributedString);
  if (v4)
    v6 = v4;
  else
    v6 = &stru_1011EB268;
  v26[0] = NSForegroundColorAttributeName;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  v27[0] = v7;
  v26[1] = NSFontAttributeName;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system15](UIFont, "system15"));
  v27[1] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v27, v26, 2));
  v10 = objc_msgSend(v5, "initWithString:attributes:", v6, v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[_SearchResultTableViewCell hoursBuilderForSearchCell](self, "hoursBuilderForSearchCell"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedOpenState"));

  v13 = -[__CFString rangeOfString:](v4, "rangeOfString:", v12);
  if (v13 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v15 = v13;
    v16 = v14;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[_SearchResultTableViewCell hoursBuilderForSearchCell](self, "hoursBuilderForSearchCell"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    objc_msgSend(v17, "updateHoursLabelColorWithDefaultLabelColor:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[_SearchResultTableViewCell hoursBuilderForSearchCell](self, "hoursBuilderForSearchCell"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "hoursStateLabelColor"));

    v24 = NSForegroundColorAttributeName;
    v25 = v20;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1));
    objc_msgSend(v10, "addAttributes:range:", v21, v15, v16);

  }
  v22 = objc_msgSend(v10, "copy");

  return v22;
}

- (id)ratingsAttributedString
{
  void *v3;
  void *v4;
  MKMapItem *mapItem;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_SearchResultTableViewCell theme](self, "theme"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MKInfoCardThemeManager themeWithThemeType:](MKInfoCardThemeManager, "themeWithThemeType:", objc_msgSend(v3, "infoCardThemeType")));

  mapItem = self->_mapItem;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system15](UIFont, "system15"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MKRatingStringBuilder ratingAndReviewSummaryAttributedStringForMapItem:textColor:font:theme:](MKRatingStringBuilder, "ratingAndReviewSummaryAttributedStringForMapItem:textColor:font:theme:", mapItem, v6, v7, v4));

  return v8;
}

- (id)attributedFirstPartDetailString
{
  __CFString *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  __CFString *v23;
  id v24;
  const __CFString *v25;
  _QWORD v27[2];
  _QWORD v28[2];
  _QWORD v29[3];
  NSAttributedStringKey v30;
  __CFString *v31;
  _QWORD v32[2];
  _QWORD v33[2];

  if (-[_SearchResultTableViewCell displaysAsChainResult](self, "displaysAsChainResult"))
  {
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue(-[_SearchResultTableViewCell secondaryLabelColor](self, "secondaryLabelColor"));
    v4 = objc_alloc((Class)NSMutableAttributedString);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[_SearchResultTableViewCell mapItem](self, "mapItem"));
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_addressFormattedAsCity"));
    v7 = (void *)v6;
    if (v6)
      v8 = (const __CFString *)v6;
    else
      v8 = &stru_1011EB268;
    v32[0] = NSForegroundColorAttributeName;
    v32[1] = NSFontAttributeName;
    v33[0] = v3;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system15](UIFont, "system15"));
    v33[1] = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v33, v32, 2));
    v11 = objc_msgSend(v4, "initWithString:attributes:", v8, v10);

    v12 = objc_alloc((Class)NSAttributedString);
    v13 = objc_msgSend((id)objc_opt_class(self), "_delimiterString");
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v30 = NSForegroundColorAttributeName;
    v31 = v3;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1));
    v16 = objc_msgSend(v12, "initWithString:attributes:", v14, v15);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[_SearchResultTableViewCell ratingsAttributedString](self, "ratingsAttributedString"));
    v29[0] = v17;
    v29[1] = v16;
    v29[2] = v11;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v29, 3));
    v19 = (id)objc_claimAutoreleasedReturnValue(-[_SearchResultTableViewCell _concatenateAttributedStrings:](self, "_concatenateAttributedStrings:", v18));

  }
  else
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[_SearchResultTableViewCell mapItem](self, "mapItem"));
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "_firstLocalizedCategoryName"));

    if (-[_SearchResultTableViewCell prefersAddressOverCategory](self, "prefersAddressOverCategory"))
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[_SearchResultTableViewCell mapItem](self, "mapItem"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[_SearchResultTableViewCell shortenedAddressStringForMapItem:](self, "shortenedAddressStringForMapItem:", v21));

      if (objc_msgSend(v22, "length"))
      {
        v23 = v22;

        v3 = v23;
      }

    }
    if (-[__CFString length](v3, "length"))
      self->_onlyDistanceOrEmpty = 0;
    v24 = objc_alloc((Class)NSMutableAttributedString);
    if (v3)
      v25 = v3;
    else
      v25 = &stru_1011EB268;
    v11 = (id)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor", NSForegroundColorAttributeName));
    v28[0] = v11;
    v27[1] = NSFontAttributeName;
    v16 = (id)objc_claimAutoreleasedReturnValue(+[UIFont system15](UIFont, "system15"));
    v28[1] = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v28, v27, 2));
    v19 = objc_msgSend(v24, "initWithString:attributes:", v25, v17);
  }

  return v19;
}

- (id)shortenedAddressStringForMapItem:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v3 = a3;
  if (objc_msgSend(v3, "_venueFeatureType") != (id)4)
  {
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_addressFormattedAsShortenedAddress"));
    goto LABEL_5;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_venueInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "parent"));
  v6 = objc_msgSend(v5, "featureType");

  if (v6 == 2)
  {
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "venueLabelWithContext:", 2));
LABEL_5:
    v8 = (void *)v7;
    goto LABEL_10;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_geoMapItem"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "addressObject"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "venueShortAddress"));
  v12 = v11;
  if (v11)
    v13 = v11;
  else
    v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "venueLabelWithContext:", 0));
  v8 = v13;

LABEL_10:
  return v8;
}

- (id)hoursBuilderForSearchCell
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_SearchResultTableViewCell mapItem](self, "mapItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "hoursBuilderForSearchResultCellForOptions:conciseStyle:", 128, 0));

  return v3;
}

- (id)attributedSecondPartDetailString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  MKMapItem *mapItem;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  __CFString *v13;
  void *v14;
  id v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v29;
  void *v30;
  NSAttributedStringKey v31;
  void *v32;
  _QWORD v33[2];
  _QWORD v34[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_SearchResultTableViewCell distanceString](self, "distanceString"));
  if (objc_msgSend(v4, "length"))
    objc_msgSend(v3, "addObject:", v4);
  if (!-[_SearchResultTableViewCell displaysAsChainResult](self, "displaysAsChainResult"))
  {
    v7 = -[MKMapItem _hasPriceDescription](self->_mapItem, "_hasPriceDescription");
    mapItem = self->_mapItem;
    if ((v7 & 1) != 0)
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem _priceDescription](mapItem, "_priceDescription"));
    else
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem _priceRangeString](mapItem, "_priceRangeString"));
    v10 = v9;
    if (objc_msgSend(v9, "length"))
      objc_msgSend(v3, "addObject:", v10);

    goto LABEL_13;
  }
  if (!-[_SearchResultTableViewCell _showOpenStateLabel](self, "_showOpenStateLabel"))
  {
LABEL_13:
    v6 = 0;
    goto LABEL_14;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_SearchResultTableViewCell hoursBuilderForSearchCell](self, "hoursBuilderForSearchCell"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedOpenState"));

  if (objc_msgSend(v6, "length"))
    objc_msgSend(v3, "addObject:", v6);
LABEL_14:
  v11 = objc_msgSend((id)objc_opt_class(self), "_delimiterString");
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v30 = v3;
  v13 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "componentsJoinedByString:", v12));
  if (-[__CFString length](v13, "length") && !self->_showDistance)
    self->_onlyDistanceOrEmpty = 0;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  v15 = objc_alloc((Class)NSMutableAttributedString);
  if (v13)
    v16 = v13;
  else
    v16 = &stru_1011EB268;
  v33[0] = NSForegroundColorAttributeName;
  v33[1] = NSFontAttributeName;
  v34[0] = v14;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system15](UIFont, "system15"));
  v34[1] = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v34, v33, 2));
  v19 = objc_msgSend(v15, "initWithString:attributes:", v16, v18);

  if (objc_msgSend(v6, "length"))
  {
    v20 = -[__CFString rangeOfString:](v13, "rangeOfString:", v6);
    if (v20 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v22 = v20;
      v29 = v21;
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[_SearchResultTableViewCell hoursBuilderForSearchCell](self, "hoursBuilderForSearchCell"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
      objc_msgSend(v23, "updateHoursLabelColorWithDefaultLabelColor:", v24);

      v25 = (void *)objc_claimAutoreleasedReturnValue(-[_SearchResultTableViewCell hoursBuilderForSearchCell](self, "hoursBuilderForSearchCell"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "hoursStateLabelColor"));

      v31 = NSForegroundColorAttributeName;
      v32 = v26;
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1));
      objc_msgSend(v19, "addAttributes:range:", v27, v22, v29);

    }
  }

  return v19;
}

- (id)delimiterColor
{
  return +[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor");
}

- (double)labelStackViewSpacing
{
  return 0.0;
}

- (BOOL)_showOpenStateLabel
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_SearchResultTableViewCell hoursBuilderForSearchCell](self, "hoursBuilderForSearchCell"));
  v3 = objc_msgSend(v2, "geoMapItemOpeningHourOptions");

  return (v3 & 0x64) != 0;
}

- (void)setAccessoryViewType:(int64_t)a3
{
  void *v4;
  id v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  __CFString *v21;
  __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;

  self->_accessoryViewType = a3;
  switch(a3)
  {
    case 1:
      v27 = (id)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 0));
      objc_msgSend(v27, "setBounds:", 0.0, 0.0, 30.0, 30.0);
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
      v5 = objc_msgSend(v4, "userInterfaceIdiom");
      v6 = CFSTR("plus");
      if (v5 == (id)5)
        v6 = CFSTR("plus.circle");
      v7 = v6;

      v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", v7));
      objc_msgSend(v27, "setImage:forState:", v8, 0);

      v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:](UIImageSymbolConfiguration, "configurationWithPointSize:", 20.0));
      objc_msgSend(v27, "setPreferredSymbolConfiguration:forImageInState:", v9, 0);

      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "theme"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "keyColor"));
      objc_msgSend(v27, "setTintColor:", v11);

      v12 = CFSTR("AccessoryAddButton");
      goto LABEL_10;
    case 2:
      v27 = (id)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 0));
      objc_msgSend(v27, "setBounds:", 0.0, 0.0, 30.0, 30.0);
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("arrow.up.backward.circle")));
      objc_msgSend(v27, "setImage:forState:", v13, 0);

      v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:](UIImageSymbolConfiguration, "configurationWithPointSize:", 20.0));
      objc_msgSend(v27, "setPreferredSymbolConfiguration:forImageInState:", v14, 0);

      v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
      objc_msgSend(v27, "setTintColor:", v15);

      v12 = CFSTR("AccessoryQueryAcceleratorButton");
      goto LABEL_10;
    case 3:
      v27 = (id)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 0));
      objc_msgSend(v27, "setBounds:", 0.0, 0.0, 30.0, 30.0);
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("checkmark")));
      objc_msgSend(v27, "setImage:forState:", v16, 0);

      v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:](UIImageSymbolConfiguration, "configurationWithPointSize:", 20.0));
      objc_msgSend(v27, "setPreferredSymbolConfiguration:forImageInState:", v17, 0);

      v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
      objc_msgSend(v27, "setTintColor:", v18);

      v12 = CFSTR("AccessoryCheckmarkButton");
      goto LABEL_10;
    case 4:
      v27 = (id)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 0));
      objc_msgSend(v27, "setBounds:", 0.0, 0.0, 30.0, 30.0);
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
      v20 = objc_msgSend(v19, "userInterfaceIdiom");
      v21 = CFSTR("pin");
      if (v20 == (id)5)
        v21 = CFSTR("pin.circle");
      v22 = v21;

      v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", v22));
      objc_msgSend(v27, "setImage:forState:", v23, 0);

      v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:](UIImageSymbolConfiguration, "configurationWithPointSize:", 20.0));
      objc_msgSend(v27, "setPreferredSymbolConfiguration:forImageInState:", v24, 0);

      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "theme"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "keyColor"));
      objc_msgSend(v27, "setTintColor:", v26);

      v12 = CFSTR("AccessoryPinButton");
LABEL_10:
      objc_msgSend(v27, "setAccessibilityIdentifier:", v12);
      if (!v27)
        goto LABEL_12;
      objc_msgSend(v27, "addTarget:action:forControlEvents:", self, "didTapAccessoryViewButton:", 0x2000);
      break;
    default:
LABEL_12:
      v27 = 0;
      break;
  }
  objc_msgSend(v27, "setAccessibilityIdentifier:", CFSTR("AccessoryButton"));
  -[_SearchResultTableViewCell setAccessoryView:](self, "setAccessoryView:", v27);

}

- (void)didTapAccessoryViewButton:(id)a3
{
  int64_t v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[_SearchResultTableViewCell accessoryViewDelegate](self, "accessoryViewDelegate", a3));
  v4 = -[_SearchResultTableViewCell accessoryViewType](self, "accessoryViewType");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_SearchResultTableViewCell accessoryViewObject](self, "accessoryViewObject"));
  objc_msgSend(v6, "didTapOnAccessoryView:withType:object:", self, v4, v5);

}

- (void)didTapOnPlaceContextWithViewModel:(id)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[_SearchResultTableViewCell placeContextViewModelDelegate](self, "placeContextViewModelDelegate", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_SearchResultTableViewCell placeContextViewModel](self, "placeContextViewModel"));
  objc_msgSend(v5, "didTapOnPlaceContextWithViewModel:parentView:", v4, self);

}

- (PersonalizedItem)personalizedItemForQuickActionMenu
{
  void *v3;
  SearchResult *v4;
  void *v5;
  SearchResult *v6;
  SearchResultMapItem *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_SearchResultTableViewCell mapItem](self, "mapItem"));

  if (v3)
  {
    v4 = [SearchResult alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[_SearchResultTableViewCell mapItem](self, "mapItem"));
    v6 = -[SearchResult initWithMapItem:](v4, "initWithMapItem:", v5);

    v7 = -[SearchResultMapItemBase initWithSearchResult:]([SearchResultMapItem alloc], "initWithSearchResult:", v6);
  }
  else
  {
    v7 = 0;
  }
  return (PersonalizedItem *)v7;
}

- (void)prepareForActionMenuPresentation
{
  -[_SearchResultTableViewCell set_mapkit_forceSeparatorFrameToCGRectZero:](self, "set_mapkit_forceSeparatorFrameToCGRectZero:", 1);
}

- (AutocompleteCellAccessoryDelegate)accessoryViewDelegate
{
  return (AutocompleteCellAccessoryDelegate *)objc_loadWeakRetained((id *)&self->_accessoryViewDelegate);
}

- (void)setAccessoryViewDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_accessoryViewDelegate, a3);
}

- (id)accessoryViewObject
{
  return self->_accessoryViewObject;
}

- (void)setAccessoryViewObject:(id)a3
{
  objc_storeStrong(&self->_accessoryViewObject, a3);
}

- (int64_t)accessoryViewType
{
  return self->_accessoryViewType;
}

- (PlaceContextViewModelCellDelegate)placeContextViewModelDelegate
{
  return (PlaceContextViewModelCellDelegate *)objc_loadWeakRetained((id *)&self->_placeContextViewModelDelegate);
}

- (void)setPlaceContextViewModelDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_placeContextViewModelDelegate, a3);
}

- (PlaceContextViewModel)placeContextViewModel
{
  return self->_placeContextViewModel;
}

- (void)setPlaceContextViewModel:(id)a3
{
  objc_storeStrong((id *)&self->_placeContextViewModel, a3);
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (NSString)debugString
{
  return self->_debugString;
}

- (UILayoutGuide)contentLayoutGuide
{
  return self->_contentLayoutGuide;
}

- (BOOL)displaysAsChainResult
{
  return self->_displaysAsChainResult;
}

- (void)setDisplaysAsChainResult:(BOOL)a3
{
  self->_displaysAsChainResult = a3;
}

- (BOOL)displaysDistanceAsSnippetLocationAboveThreshold
{
  return self->_displaysDistanceAsSnippetLocationAboveThreshold;
}

- (void)setDisplaysDistanceAsSnippetLocationAboveThreshold:(BOOL)a3
{
  self->_displaysDistanceAsSnippetLocationAboveThreshold = a3;
}

- (BOOL)prefersAddressOverCategory
{
  return self->_prefersAddressOverCategory;
}

- (void)setPrefersAddressOverCategory:(BOOL)a3
{
  self->_prefersAddressOverCategory = a3;
}

- (GEOLocation)currentLocation
{
  return self->_currentLocation;
}

- (void)setCurrentLocation:(id)a3
{
  objc_storeStrong((id *)&self->_currentLocation, a3);
}

- (BOOL)displayDistanceIfValidCurrentLocation
{
  return self->_displayDistanceIfValidCurrentLocation;
}

- (void)setDisplayDistanceIfValidCurrentLocation:(BOOL)a3
{
  self->_displayDistanceIfValidCurrentLocation = a3;
}

- (GEOSearchCategory)searchCategory
{
  return self->_searchCategory;
}

- (void)setSearchCategory:(id)a3
{
  objc_storeStrong((id *)&self->_searchCategory, a3);
}

- (GEORelatedEntitySection)relatedSection
{
  return self->_relatedSection;
}

- (GEOPublisherResult)publisherResult
{
  return self->_publisherResult;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publisherResult, 0);
  objc_storeStrong((id *)&self->_relatedSection, 0);
  objc_storeStrong((id *)&self->_searchCategory, 0);
  objc_storeStrong((id *)&self->_currentLocation, 0);
  objc_storeStrong((id *)&self->_contentLayoutGuide, 0);
  objc_storeStrong((id *)&self->_debugString, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_placeContextViewModel, 0);
  objc_destroyWeak((id *)&self->_placeContextViewModelDelegate);
  objc_storeStrong(&self->_accessoryViewObject, 0);
  objc_destroyWeak((id *)&self->_accessoryViewDelegate);
  objc_storeStrong((id *)&self->_contextualInformationStackView, 0);
  objc_storeStrong((id *)&self->_secondLabelStackView, 0);
  objc_storeStrong((id *)&self->_labelStackView, 0);
  objc_storeStrong((id *)&self->_containerStackView, 0);
  objc_storeStrong((id *)&self->_rootStackView, 0);
  objc_storeStrong((id *)&self->_transitInfoLabel, 0);
  objc_storeStrong((id *)&self->_debugLabel, 0);
  objc_storeStrong((id *)&self->_contextualInformationLabel, 0);
  objc_storeStrong((id *)&self->_contextualInformationImageView, 0);
  objc_storeStrong((id *)&self->_thirdLabel, 0);
  objc_storeStrong((id *)&self->_transitDelimiterLabel, 0);
  objc_storeStrong((id *)&self->_secondPartDelimiterLabel, 0);
  objc_storeStrong((id *)&self->_secondPartLabel, 0);
  objc_storeStrong((id *)&self->_secondLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
