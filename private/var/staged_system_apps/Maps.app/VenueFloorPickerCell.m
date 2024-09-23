@implementation VenueFloorPickerCell

- (VenueFloorPickerCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  VenueFloorPickerCell *v7;
  VenueFloorPickerCell *v8;
  UIView *v9;
  UIView *selectionBackgroundView;
  void *v11;
  UILabel *v12;
  UILabel *floorNameLabel;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
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
  objc_super v55;
  _QWORD v56[8];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v55.receiver = self;
  v55.super_class = (Class)VenueFloorPickerCell;
  v7 = -[VenueFloorPickerCell initWithFrame:](&v55, "initWithFrame:");
  v8 = v7;
  if (v7)
  {
    -[VenueFloorPickerCell setAccessibilityIdentifier:](v7, "setAccessibilityIdentifier:", CFSTR("VenueFloorPickerCell"));
    v9 = (UIView *)objc_alloc_init((Class)UIView);
    selectionBackgroundView = v8->_selectionBackgroundView;
    v8->_selectionBackgroundView = v9;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v8->_selectionBackgroundView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView setAlpha:](v8->_selectionBackgroundView, "setAlpha:", 0.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[VenueFloorPickerCell contentView](v8, "contentView"));
    objc_msgSend(v11, "addSubview:", v8->_selectionBackgroundView);

    v12 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", x + 5.0, y, width + -10.0, height);
    floorNameLabel = v8->_floorNameLabel;
    v8->_floorNameLabel = v12;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v8->_floorNameLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[UILabel setBackgroundColor:](v8->_floorNameLabel, "setBackgroundColor:", v14);

    -[UILabel setTextAlignment:](v8->_floorNameLabel, "setTextAlignment:", 1);
    -[UILabel setBaselineAdjustment:](v8->_floorNameLabel, "setBaselineAdjustment:", 1);
    v15 = objc_msgSend((id)objc_opt_class(v8), "floorNameFont");
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    -[UILabel setFont:](v8->_floorNameLabel, "setFont:", v16);

    -[UILabel setAdjustsFontSizeToFitWidth:](v8->_floorNameLabel, "setAdjustsFontSizeToFitWidth:", 1);
    -[UILabel setMinimumScaleFactor:](v8->_floorNameLabel, "setMinimumScaleFactor:", 0.25);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[VenueFloorPickerCell contentView](v8, "contentView"));
    objc_msgSend(v17, "addSubview:", v8->_floorNameLabel);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[VenueFloorPickerCell contentView](v8, "contentView"));
    v19 = objc_msgSend(v18, "_maps_addHairlineAtBottomWithMargin:", 0.0);

    v53 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v8->_floorNameLabel, "leadingAnchor"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[VenueFloorPickerCell contentView](v8, "contentView"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "leadingAnchor"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "constraintEqualToAnchor:constant:", v52, 5.0));
    v56[0] = v51;
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v8->_floorNameLabel, "trailingAnchor"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[VenueFloorPickerCell contentView](v8, "contentView"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "trailingAnchor"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "constraintEqualToAnchor:constant:", v48, -5.0));
    v56[1] = v47;
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerYAnchor](v8->_floorNameLabel, "centerYAnchor"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[VenueFloorPickerCell contentView](v8, "contentView"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "centerYAnchor"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "constraintEqualToAnchor:", v44));
    v56[2] = v43;
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel heightAnchor](v8->_floorNameLabel, "heightAnchor"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[VenueFloorPickerCell contentView](v8, "contentView"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "heightAnchor"));
    LODWORD(v20) = 1144750080;
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintLessThanOrEqualToAnchor:constant:priority:", v40, -16.0, v20));
    v56[3] = v39;
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](v8->_selectionBackgroundView, "leadingAnchor"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[VenueFloorPickerCell contentView](v8, "contentView"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "leadingAnchor"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToAnchor:", v36));
    v56[4] = v35;
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](v8->_selectionBackgroundView, "trailingAnchor"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[VenueFloorPickerCell contentView](v8, "contentView"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "trailingAnchor"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintEqualToAnchor:", v32));
    v56[5] = v31;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](v8->_selectionBackgroundView, "topAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[VenueFloorPickerCell contentView](v8, "contentView"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "topAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v23));
    v56[6] = v24;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](v8->_selectionBackgroundView, "bottomAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[VenueFloorPickerCell contentView](v8, "contentView"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "bottomAnchor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:", v27));
    v56[7] = v28;
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v56, 8));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v29);

    -[VenueFloorPickerCell updateStyle](v8, "updateStyle");
  }
  return v8;
}

+ (id)reuseIdentifier
{
  return CFSTR("VenueFloorPickerCellIdentifier");
}

+ (double)cellHeight
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "floorNameFont"));
  objc_msgSend(v2, "ascender");
  v4 = v3;
  objc_msgSend(v2, "descender");
  v6 = v4 - v5 + 16.0;

  return v6;
}

+ (id)floorNameFont
{
  return +[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:weight:contentSizeCategory:symbolicTraits:](UIFont, "_mapkit_preferredFontForTextStyleInTableViewCell:weight:contentSizeCategory:symbolicTraits:", UIFontTextStyleBody, UIContentSizeCategoryLarge, 0, UIFontWeightMedium);
}

- (NSString)floorName
{
  return -[UILabel text](self->_floorNameLabel, "text");
}

- (void)setFloorName:(id)a3
{
  -[UILabel setText:](self->_floorNameLabel, "setText:", a3);
}

- (void)setIsUserLocation:(BOOL)a3
{
  self->_isUserLocation = a3;
  -[VenueFloorPickerCell updateStyle](self, "updateStyle");
}

- (void)setLacksSearchResults:(BOOL)a3
{
  self->_lacksSearchResults = a3;
  -[VenueFloorPickerCell updateStyle](self, "updateStyle");
}

- (void)setSelected:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VenueFloorPickerCell;
  -[VenueFloorPickerCell setSelected:](&v4, "setSelected:", a3);
  -[VenueFloorPickerCell updateStyle](self, "updateStyle");
}

- (void)setShowSelection:(BOOL)a3
{
  self->_showSelection = a3;
  if (-[VenueFloorPickerCell isSelected](self, "isSelected"))
    -[VenueFloorPickerCell updateStyle](self, "updateStyle");
}

- (void)updateStyle
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  id v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tertiarySystemFillColor](UIColor, "tertiarySystemFillColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[VenueFloorPickerCell selectionBackgroundView](self, "selectionBackgroundView"));
  objc_msgSend(v4, "setBackgroundColor:", v3);

  if (-[VenueFloorPickerCell isUserLocation](self, "isUserLocation"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[VenueFloorPickerCell theme](self, "theme"));
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "keyColor"));
LABEL_5:
    v7 = (void *)v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[VenueFloorPickerCell floorNameLabel](self, "floorNameLabel"));
    objc_msgSend(v8, "setTextColor:", v7);

    goto LABEL_7;
  }
  if (-[VenueFloorPickerCell lacksSearchResults](self, "lacksSearchResults"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[VenueFloorPickerCell theme](self, "theme"));
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "venueFloorPickerLackingSearchResultsTextColor"));
    goto LABEL_5;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MapsTheme floatingControlsTintColor](MapsTheme, "floatingControlsTintColor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[VenueFloorPickerCell floorNameLabel](self, "floorNameLabel"));
  objc_msgSend(v7, "setTextColor:", v5);
LABEL_7:

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[VenueFloorPickerCell floorNameLabel](self, "floorNameLabel"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "textColor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[VenueFloorPickerCell floorNameLabel](self, "floorNameLabel"));
  objc_msgSend(v11, "setHighlightedTextColor:", v10);

  v12 = 0.0;
  if (-[VenueFloorPickerCell isSelected](self, "isSelected"))
  {
    if (-[VenueFloorPickerCell showSelection](self, "showSelection"))
      v12 = 1.0;
    else
      v12 = 0.0;
  }
  v13 = (id)objc_claimAutoreleasedReturnValue(-[VenueFloorPickerCell selectionBackgroundView](self, "selectionBackgroundView"));
  objc_msgSend(v13, "setAlpha:", v12);

}

- (NSNumber)floorOrdinal
{
  return self->_floorOrdinal;
}

- (void)setFloorOrdinal:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (UILabel)floorNameLabel
{
  return self->_floorNameLabel;
}

- (void)setFloorNameLabel:(id)a3
{
  objc_storeStrong((id *)&self->_floorNameLabel, a3);
}

- (UIView)selectionBackgroundView
{
  return self->_selectionBackgroundView;
}

- (void)setSelectionBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_selectionBackgroundView, a3);
}

- (BOOL)isUserLocation
{
  return self->_isUserLocation;
}

- (BOOL)lacksSearchResults
{
  return self->_lacksSearchResults;
}

- (BOOL)showSelection
{
  return self->_showSelection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionBackgroundView, 0);
  objc_storeStrong((id *)&self->_floorNameLabel, 0);
  objc_storeStrong((id *)&self->_floorOrdinal, 0);
}

@end
