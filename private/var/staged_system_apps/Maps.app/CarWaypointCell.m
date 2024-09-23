@implementation CarWaypointCell

- (CarWaypointCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CarWaypointCell *v4;
  CarWaypointCell *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CarWaypointCell;
  v4 = -[CarWaypointCell initWithStyle:reuseIdentifier:](&v8, "initWithStyle:reuseIdentifier:", a3, a4);
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarWaypointCell contentView](v4, "contentView"));
    objc_msgSend(v6, "setClipsToBounds:", 1);

    -[CarWaypointCell _setupSubviews](v5, "_setupSubviews");
    -[CarWaypointCell _setupConstraints](v5, "_setupConstraints");
    -[CarWaypointCell _setupStyles](v5, "_setupStyles");
  }
  return v5;
}

- (void)_setupSubviews
{
  id v3;
  double y;
  double width;
  double height;
  UILabel *v7;
  UILabel *titleLabel;
  void *v9;
  UILabel *v10;
  UILabel *arrivalLabel;
  void *v12;
  UILabel *v13;
  UILabel *tapToRemoveLabel;
  id v15;

  v3 = objc_alloc((Class)UILabel);
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v7 = (UILabel *)objc_msgSend(v3, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v7;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarWaypointCell contentView](self, "contentView"));
  objc_msgSend(v9, "addSubview:", self->_titleLabel);

  v10 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  arrivalLabel = self->_arrivalLabel;
  self->_arrivalLabel = v10;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_arrivalLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CarWaypointCell contentView](self, "contentView"));
  objc_msgSend(v12, "addSubview:", self->_arrivalLabel);

  v13 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  tapToRemoveLabel = self->_tapToRemoveLabel;
  self->_tapToRemoveLabel = v13;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_tapToRemoveLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v15 = (id)objc_claimAutoreleasedReturnValue(-[CarWaypointCell contentView](self, "contentView"));
  objc_msgSend(v15, "addSubview:", self->_tapToRemoveLabel);

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
  _QWORD v38[9];

  v36 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](self->_titleLabel, "firstBaselineAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[CarWaypointCell contentView](self, "contentView"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "topAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToAnchor:constant:", v35, 20.0));
  v38[0] = v34;
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_titleLabel, "trailingAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[CarWaypointCell contentView](self, "contentView"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "trailingAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:constant:", v31, -6.0));
  v38[1] = v30;
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_titleLabel, "leadingAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[CarWaypointCell contentView](self, "contentView"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "leadingAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:constant:", v27, 6.0));
  v38[2] = v26;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](self->_arrivalLabel, "firstBaselineAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel lastBaselineAnchor](self->_titleLabel, "lastBaselineAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:constant:", v24, 14.0));
  v38[3] = v23;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_arrivalLabel, "trailingAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CarWaypointCell contentView](self, "contentView"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "trailingAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:constant:", v20, -6.0));
  v38[4] = v19;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_arrivalLabel, "leadingAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CarWaypointCell contentView](self, "contentView"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "leadingAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:constant:", v16, 6.0));
  v38[5] = v15;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](self->_tapToRemoveLabel, "firstBaselineAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel lastBaselineAnchor](self->_arrivalLabel, "lastBaselineAnchor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:constant:", v13, 14.0));
  v38[6] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_tapToRemoveLabel, "trailingAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarWaypointCell contentView](self, "contentView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "trailingAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintEqualToAnchor:constant:", v6, -6.0));
  v38[7] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_tapToRemoveLabel, "leadingAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarWaypointCell contentView](self, "contentView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "leadingAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:constant:", v10, 6.0));
  v38[8] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v38, 9));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v12);

}

- (void)_setupStyles
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapsCar_fontForTextStyle:weight:](UIFont, "_mapsCar_fontForTextStyle:weight:", UIFontTextStyleCallout, UIFontWeightMedium));
  -[UILabel setFont:](self->_titleLabel, "setFont:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", v4);

  -[UILabel setAdjustsFontSizeToFitWidth:](self->_titleLabel, "setAdjustsFontSizeToFitWidth:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapsCar_fontForTextStyle:weight:grade:](UIFont, "_mapsCar_fontForTextStyle:weight:grade:", UIFontTextStyleCaption2, 3, UIFontWeightRegular));
  -[UILabel setFont:](self->_arrivalLabel, "setFont:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemPrimaryColor](UIColor, "_carSystemPrimaryColor"));
  -[UILabel setTextColor:](self->_arrivalLabel, "setTextColor:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapsCar_fontForTextStyle:weight:](UIFont, "_mapsCar_fontForTextStyle:weight:", UIFontTextStyleCaption2, UIFontWeightRegular));
  -[UILabel setFont:](self->_tapToRemoveLabel, "setFont:", v7);

  v8 = (id)objc_claimAutoreleasedReturnValue(+[UIColor externalSystemRedColor](UIColor, "externalSystemRedColor"));
  -[UILabel setTextColor:](self->_tapToRemoveLabel, "setTextColor:", v8);

}

- (void)setupWithWaypoint:(id)a3 etaInfo:(id)a4 isRemovable:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  _UNKNOWN **v11;
  void *v12;
  unsigned int v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  unsigned __int8 v28;
  void *v29;
  id v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  void *v41;
  _BYTE v42[128];

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "name"));
  -[UILabel setText:](self->_titleLabel, "setText:", v10);

  v11 = MKPlaceCollectionsLogicController_ptr;
  if (!v5)
  {
    -[UILabel setText:](self->_tapToRemoveLabel, "setText:", 0);
    if (!v9)
      goto LABEL_8;
LABEL_18:
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[GuidanceETA etaStringFromEtaLegInfo:includingAMPMSymbols:](GuidanceETA, "etaStringFromEtaLegInfo:includingAMPMSymbols:", v9, 1));
    goto LABEL_22;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
  v13 = objc_msgSend(v12, "supportsTouchInteractionModel");

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v15 = v14;
  if (v13)
    v16 = CFSTR("Car_Waypoint_TapToRemove");
  else
    v16 = CFSTR("Car_Waypoint_SelectToRemove");
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", v16, CFSTR("localized string not found"), 0));
  -[UILabel setText:](self->_tapToRemoveLabel, "setText:", v17);

  if (v9)
    goto LABEL_18;
LABEL_8:
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "displayEtaInfo"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "legInfos"));

  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v37;
LABEL_10:
    v24 = 0;
    while (1)
    {
      if (*(_QWORD *)v37 != v23)
        objc_enumerationMutation(v20);
      v25 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v24);
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "waypointID"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "uniqueID"));
      v28 = objc_msgSend(v26, "isEqual:", v27);

      if ((v28 & 1) != 0)
        break;
      if (v22 == (id)++v24)
      {
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
        if (v22)
          goto LABEL_10;
        goto LABEL_16;
      }
    }
    v9 = v25;

    v11 = MKPlaceCollectionsLogicController_ptr;
    if (!v9)
      goto LABEL_19;
    goto LABEL_18;
  }
LABEL_16:

  v11 = MKPlaceCollectionsLogicController_ptr;
LABEL_19:
  v30 = sub_10043364C();
  v31 = objc_claimAutoreleasedReturnValue(v30);
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "shortDescription"));
    *(_DWORD *)buf = 138412290;
    v41 = v32;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "Failed to get etaInfo for waypoint: %@", buf, 0xCu);

  }
  v29 = 0;
  v9 = 0;
LABEL_22:
  if (objc_msgSend(v29, "length"))
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11[307], "mainBundle"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("[Navigation] <time> ETA"), CFSTR("localized string not found"), 0));
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v34, v29));

    v29 = v33;
  }
  else
  {
    v35 = 0;
  }

  -[UILabel setText:](self->_arrivalLabel, "setText:", v35);
}

- (BOOL)displaysThirdDetailLine
{
  return 1;
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)CarWaypointCell;
  -[CarWaypointCell setHighlighted:animated:](&v6, "setHighlighted:animated:", a3, a4);
  -[CarWaypointCell _updateLabelColors:](self, "_updateLabelColors:", v4);
}

- (void)_updateLabelColors:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  if (a3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemFocusLabelColor](UIColor, "_carSystemFocusLabelColor"));
    -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", v4);

    v5 = objc_claimAutoreleasedReturnValue(+[UIColor _carSystemFocusLabelColor](UIColor, "_carSystemFocusLabelColor"));
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", v6);

    v5 = objc_claimAutoreleasedReturnValue(+[UIColor _carSystemPrimaryColor](UIColor, "_carSystemPrimaryColor"));
  }
  v7 = (id)v5;
  -[UILabel setTextColor:](self->_arrivalLabel, "setTextColor:", v5);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapToRemoveLabel, 0);
  objc_storeStrong((id *)&self->_arrivalLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_contactImageView, 0);
}

@end
