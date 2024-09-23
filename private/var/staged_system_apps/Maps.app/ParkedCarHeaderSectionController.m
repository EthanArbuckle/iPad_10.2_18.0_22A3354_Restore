@implementation ParkedCarHeaderSectionController

- (ParkedCarHeaderSectionController)initWithParkedCar:(id)a3
{
  ParkedCarHeaderSectionController *v3;
  ParkedCarHeaderSectionController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ParkedCarHeaderSectionController;
  v3 = -[ParkedCarSectionController initWithParkedCar:](&v6, "initWithParkedCar:", a3);
  v4 = v3;
  if (v3)
    -[ParkedCarHeaderSectionController _commonInit](v3, "_commonInit");
  return v4;
}

- (void)_commonInit
{
  ParkedCarHeaderViewModel *v3;
  void *v4;
  void *v5;
  MUPlaceHeaderView *v6;
  MUPlaceHeaderView *headerView;
  ParkedCarHeaderViewModel *v8;

  v3 = [ParkedCarHeaderViewModel alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ParkedCarSectionController parkedCar](self, "parkedCar"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ParkedCarHeaderSectionController _headerSubtitle](self, "_headerSubtitle"));
  v8 = -[ParkedCarHeaderViewModel initWithParkedCar:subtitleText:](v3, "initWithParkedCar:subtitleText:", v4, v5);

  v6 = (MUPlaceHeaderView *)objc_msgSend(objc_alloc((Class)MUPlaceHeaderView), "initWithViewModel:trailingConstraintProvider:", v8, &stru_1011BF468);
  headerView = self->_headerView;
  self->_headerView = v6;

}

- (id)sectionView
{
  return self->_headerView;
}

- (void)updateFromParkedCar
{
  ParkedCarHeaderViewModel *v3;
  void *v4;
  ParkedCarHeaderViewModel *v5;
  id v6;

  v3 = [ParkedCarHeaderViewModel alloc];
  v6 = (id)objc_claimAutoreleasedReturnValue(-[ParkedCarSectionController parkedCar](self, "parkedCar"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ParkedCarHeaderSectionController _headerSubtitle](self, "_headerSubtitle"));
  v5 = -[ParkedCarHeaderViewModel initWithParkedCar:subtitleText:](v3, "initWithParkedCar:subtitleText:", v6, v4);
  -[MUPlaceHeaderView setViewModel:](self->_headerView, "setViewModel:", v5);

}

- (void)hideTitle:(BOOL)a3
{
  -[MUPlaceHeaderView hideTitle:](self->_headerView, "hideTitle:", a3);
}

- (void)updateTrailingConstraint
{
  -[MUPlaceHeaderView reloadTrailingConstraint](self->_headerView, "reloadTrailingConstraint");
}

- (id)_headerSubtitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  unsigned int v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  id v17;
  double v18;
  double v19;
  double v20;
  MKDistanceFormatter *distanceFormatter;
  MKDistanceFormatter *v22;
  MKDistanceFormatter *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ParkedCarSectionController parkedCar](self, "parkedCar"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "locationName"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastLocation"));

  if (!v6)
    goto LABEL_10;
  objc_msgSend(v6, "coordinate");
  v9 = 0;
  if (v8 < -180.0 || v8 > 180.0 || v7 < -90.0 || v7 > 90.0)
    goto LABEL_11;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
  v11 = objc_msgSend(v10, "isAuthorizedForPreciseLocation");

  if (!v11)
  {
LABEL_10:
    v9 = 0;
    goto LABEL_11;
  }
  objc_msgSend(v6, "coordinate");
  v13 = v12;
  v15 = v14;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[ParkedCarSectionController parkedCar](self, "parkedCar"));
  v17 = objc_msgSend(v16, "coordinate");
  v20 = GEOCalculateDistance(v17, v13, v15, v18, v19);

  distanceFormatter = self->_distanceFormatter;
  if (!distanceFormatter)
  {
    v22 = (MKDistanceFormatter *)objc_alloc_init((Class)MKDistanceFormatter);
    v23 = self->_distanceFormatter;
    self->_distanceFormatter = v22;

    -[MKDistanceFormatter setUnitStyle:](self->_distanceFormatter, "setUnitStyle:", 1);
    distanceFormatter = self->_distanceFormatter;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MKDistanceFormatter stringFromDistance:](distanceFormatter, "stringFromDistance:", v20));
LABEL_11:
  if (!objc_msgSend(v4, "length"))
  {
    if (!v9)
    {
      v26 = 0;
      goto LABEL_18;
    }
    goto LABEL_16;
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("Near %@ [ParkedCar Place Card]"), CFSTR("localized string not found"), 0));
  v26 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v25, v4));

  if (v9)
  {
    if (v26)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("PARKED_CAR_PLACE_CARD_LOCATION_AND_DISTANCE"), CFSTR("localized string not found"), 0));
      v29 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v28, v26, v9));

      v26 = (id)v29;
      goto LABEL_18;
    }
LABEL_16:
    v26 = v9;
  }
LABEL_18:

  return v26;
}

- (void)setActive:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ParkedCarHeaderSectionController;
  -[ParkedCarHeaderSectionController setActive:](&v4, "setActive:", a3);
  if (-[ParkedCarHeaderSectionController isActive](self, "isActive"))
    -[ParkedCarHeaderSectionController updateFromParkedCar](self, "updateFromParkedCar");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_distanceFormatter, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
}

@end
