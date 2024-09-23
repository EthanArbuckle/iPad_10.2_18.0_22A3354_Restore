@implementation VenueFloorCardViewController

- (VenueFloorCardViewController)initWithVenuesManager:(id)a3
{
  id v4;
  VenueFloorCardViewController *v5;
  VenueFloorCardViewController *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)VenueFloorCardViewController;
  v5 = -[VenueFloorCardViewController initWithNibName:bundle:](&v11, "initWithNibName:bundle:", 0, 0);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_venuesManager, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v6, "cardPresentationController"));
    objc_msgSend(v7, "setPresentedModally:", 1);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v6, "cardPresentationController"));
    objc_msgSend(v8, "setAllowsSwipeToDismiss:", 0);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v6, "cardPresentationController"));
    objc_msgSend(v9, "setShouldHidePreviousCards:", 1);

  }
  return v6;
}

- (VenueFloorCardViewController)initWithNibName:(id)a3 bundle:(id)a4
{

  return 0;
}

- (VenueFloorCardViewController)initWithCoder:(id)a3
{

  return 0;
}

- (void)handleCloseButtonTap
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[VenueFloorCardViewController venuesManager](self, "venuesManager"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "venueFloorViewController"));
  objc_msgSend(v2, "setOpen:", 0);

}

- (id)keyCommands
{
  void *v2;
  void *v3;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", UIKeyInputEscape, 0, "handleCloseButtonTap"));
  v5 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v5, 1));

  return v3;
}

- (void)viewDidLoad
{
  MapsThemeLabel *v2;
  void *v3;
  UILabel *v4;
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
  void *v32;
  _QWORD v33[4];
  id v34;
  id location;
  objc_super v36;
  _QWORD v37[7];

  v36.receiver = self;
  v36.super_class = (Class)VenueFloorCardViewController;
  -[ContaineeViewController viewDidLoad](&v36, "viewDidLoad");
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v2 = objc_opt_new(MapsThemeLabel);
  -[MapsThemeLabel setTranslatesAutoresizingMaskIntoConstraints:](v2, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[MapsThemeLabel setBackgroundColor:](v2, "setBackgroundColor:", v3);

  +[DynamicTypeWizard autorefreshLabel:withFontProvider:](DynamicTypeWizard, "autorefreshLabel:withFontProvider:", v2, &stru_1011E7BB8);
  objc_initWeak(&location, self);
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_10087384C;
  v33[3] = &unk_1011D9A90;
  objc_copyWeak(&v34, &location);
  -[MapsThemeLabel setTextColorProvider:](v2, "setTextColorProvider:", v33);
  -[MapsThemeLabel setAdjustsFontSizeToFitWidth:](v2, "setAdjustsFontSizeToFitWidth:", 1);
  -[MapsThemeLabel setMinimumScaleFactor:](v2, "setMinimumScaleFactor:", 0.5);
  -[VenueFloorCardViewController setFloorNameLabel:](self, "setFloorNameLabel:", v2);
  objc_msgSend(v32, "addSubview:", v2);
  v4 = objc_opt_new(UILabel);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[UILabel setBackgroundColor:](v4, "setBackgroundColor:", v5);

  +[DynamicTypeWizard autorefreshLabel:withFontProvider:](DynamicTypeWizard, "autorefreshLabel:withFontProvider:", v4, &stru_1011E7A78);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  -[UILabel setTextColor:](v4, "setTextColor:", v6);

  -[UILabel setAdjustsFontSizeToFitWidth:](v4, "setAdjustsFontSizeToFitWidth:", 1);
  -[UILabel setMinimumScaleFactor:](v4, "setMinimumScaleFactor:", 0.5);
  -[VenueFloorCardViewController setVenueNameLabel:](self, "setVenueNameLabel:", v4);
  objc_msgSend(v32, "addSubview:", v4);
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel topAnchor](v2, "topAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "topAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:constant:", v29, 17.0));
  v37[0] = v28;
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel leadingAnchor](v2, "leadingAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "leadingAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:constant:", v26, 20.0));
  v37[1] = v25;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel trailingAnchor](v2, "trailingAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "trailingAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:constant:", v23, -20.0));
  v37[2] = v22;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](v4, "topAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel bottomAnchor](v2, "bottomAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:constant:", v20, 2.0));
  v37[3] = v19;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v4, "leadingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "leadingAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:constant:", v17, 20.0));
  v37[4] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v4, "trailingAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "trailingAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:constant:", v9, -20.0));
  v37[5] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](v4, "bottomAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "bottomAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintLessThanOrEqualToAnchor:constant:", v12, -17.0));
  v37[6] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v37, 7));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[VenueFloorCardViewController view](self, "view"));
  objc_msgSend(v15, "setNeedsLayout");

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[VenueFloorCardViewController view](self, "view"));
  objc_msgSend(v16, "layoutIfNeeded");

  -[VenueFloorCardViewController updateContents](self, "updateContents");
  objc_destroyWeak(&v34);
  objc_destroyWeak(&location);

}

- (double)heightForLayout:(unint64_t)a3
{
  double v3;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;

  v3 = -1.0;
  if (a3 == 5)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[VenueFloorCardViewController venueNameLabel](self, "venueNameLabel"));
    -[VenueFloorCardViewController heightForLabel:](self, "heightForLabel:", v5);
    v7 = v6 + 17.0 + 2.0;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[VenueFloorCardViewController floorNameLabel](self, "floorNameLabel"));
    -[VenueFloorCardViewController heightForLabel:](self, "heightForLabel:", v8);
    v10 = v7 + v9;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    objc_msgSend(v11, "bottomSafeOffset");
    v3 = v10 + v12 + 17.0;

  }
  return v3;
}

- (int64_t)floatingControlsOptions
{
  return 64;
}

- (id)nameForFloorWithOrdinal:(signed __int16)a3 inBuilding:(id)a4
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "floorNames"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithShort:](NSNumber, "numberWithShort:", v4));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v6));

  return v7;
}

- (id)nameForFloorWithOrdinal:(signed __int16)a3 inBuildings:(id)a4
{
  uint64_t v4;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = a4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    while (2)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = objc_claimAutoreleasedReturnValue(-[VenueFloorCardViewController nameForFloorWithOrdinal:inBuilding:](self, "nameForFloorWithOrdinal:inBuilding:", v4, *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v10), (_QWORD)v14));
        if (v11)
        {
          v12 = (void *)v11;
          goto LABEL_11;
        }
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v8)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_11:

  return v12;
}

- (double)heightForLabel:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "font"));
  objc_msgSend(v4, "ascender");
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "font"));

  objc_msgSend(v7, "descender");
  v9 = v6 - v8;

  return v9;
}

- (void)updateContents
{
  void *v2;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL8 v16;
  void *v17;
  id v18;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[VenueFloorCardViewController venuesManager](self, "venuesManager"));
  v18 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "venueWithFocus"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VenueFloorCardViewController venuesManager](self, "venuesManager"));
  v6 = objc_msgSend(v5, "displayedFloorOrdinalForBuildingsInVenue:", v18);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "name"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[VenueFloorCardViewController venueNameLabel](self, "venueNameLabel"));
  objc_msgSend(v8, "setText:", v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[VenueFloorCardViewController venuesManager](self, "venuesManager"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "venueBuildingWithFocus"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[VenueFloorCardViewController nameForFloorWithOrdinal:inBuilding:](self, "nameForFloorWithOrdinal:inBuilding:", v6, v10));
  v12 = v11;
  if (!v11)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "buildings"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[VenueFloorCardViewController nameForFloorWithOrdinal:inBuildings:](self, "nameForFloorWithOrdinal:inBuildings:", v6, v2));
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[VenueFloorCardViewController floorNameLabel](self, "floorNameLabel"));
  objc_msgSend(v13, "setText:", v12);

  if (!v11)
  {

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[VenueFloorCardViewController venuesManager](self, "venuesManager"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "userLocationFloorOrdinal"));

  if (v15)
    v16 = objc_msgSend(v15, "shortValue") == (_DWORD)v6;
  else
    v16 = 0;
  -[VenueFloorCardViewController setIsUserLocation:](self, "setIsUserLocation:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[VenueFloorCardViewController floorNameLabel](self, "floorNameLabel"));
  objc_msgSend(v17, "updateTheme");

}

- (VenuesManager)venuesManager
{
  return (VenuesManager *)objc_loadWeakRetained((id *)&self->_venuesManager);
}

- (MapsThemeLabel)floorNameLabel
{
  return self->_floorNameLabel;
}

- (void)setFloorNameLabel:(id)a3
{
  objc_storeStrong((id *)&self->_floorNameLabel, a3);
}

- (UILabel)venueNameLabel
{
  return self->_venueNameLabel;
}

- (void)setVenueNameLabel:(id)a3
{
  objc_storeStrong((id *)&self->_venueNameLabel, a3);
}

- (BOOL)isUserLocation
{
  return self->_isUserLocation;
}

- (void)setIsUserLocation:(BOOL)a3
{
  self->_isUserLocation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_venueNameLabel, 0);
  objc_storeStrong((id *)&self->_floorNameLabel, 0);
  objc_destroyWeak((id *)&self->_venuesManager);
}

@end
