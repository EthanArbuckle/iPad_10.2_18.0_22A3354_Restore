@implementation RideBookingRideOptionSection

- (RideBookingRideOptionSection)initWithCollectionView:(id)a3 sectionIdentifier:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RideBookingRideOptionSection;
  return -[RoutePlanningOutlineSection initWithCollectionView:sectionIdentifier:](&v5, "initWithCollectionView:sectionIdentifier:", a3, a4);
}

- (id)cellForItemAtIndexPath:(id)a3
{
  id v4;
  UICollectionView *collectionView;
  objc_class *v6;
  NSString *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id *v11;
  id v12;
  _QWORD *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v20[4];
  _QWORD v21[3];
  _QWORD v22[4];
  _QWORD v23[2];

  v4 = a3;
  if (objc_msgSend(v4, "row"))
  {
    collectionView = self->super._collectionView;
    v6 = (objc_class *)objc_opt_class(RidesharingAppActionCollectionViewCell);
    v7 = NSStringFromClass(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView dequeueReusableCellWithReuseIdentifier:forIndexPath:](collectionView, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v8, v4));

    objc_msgSend(v9, "setDelegate:", self);
    if (-[RideBookingRideOptionSection applicationSectionIsExpanded](self, "applicationSectionIsExpanded"))
      v10 = 0;
    else
      v10 = 2;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100B15C50;
    v20[3] = &unk_1011B15B0;
    v11 = (id *)v21;
    v12 = v9;
    v21[0] = v12;
    v21[1] = self;
    v21[2] = v10;
    v13 = v20;
  }
  else
  {
    if (+[UIFont accessibilityTextEnabled](UIFont, "accessibilityTextEnabled"))
      v14 = CFSTR("RideBookingAX");
    else
      v14 = CFSTR("RideBooking");
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView dequeueReusableCellWithReuseIdentifier:forIndexPath:](self->super._collectionView, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v14, v4));

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideOptionSection parentDataSource](self, "parentDataSource"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "delegate"));
    objc_msgSend(v15, "setDelegate:", v17);

    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100B15B78;
    v22[3] = &unk_1011AC8B0;
    v11 = (id *)v23;
    v12 = v15;
    v23[0] = v12;
    v23[1] = self;
    v13 = v22;
  }
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v13);
  v18 = v12;

  return v18;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideOptionSection rideBookingRideOption](self, "rideBookingRideOption", a3));

  if (!v4)
    return 0;
  if (!-[RideBookingRideOptionSection applicationSectionIsExpanded](self, "applicationSectionIsExpanded")
    && self->_adjustedSectionOffset == 2)
  {
    return 2;
  }
  if (-[RideBookingRideOptionSection isLastRideOptionInSection](self, "isLastRideOptionInSection"))
    return 2;
  return 1;
}

- (int64_t)numberOfSections
{
  return 1;
}

- (double)estimatedItemHeight
{
  void *v3;
  RouteOverviewCell *v4;
  double Width;
  RouteOverviewCell *v6;
  double v7;
  double v8;
  double result;
  _QWORD v10[4];
  RouteOverviewCell *v11;
  RideBookingRideOptionSection *v12;
  CGRect v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideOptionSection rideBookingRideOption](self, "rideBookingRideOption"));

  if (v3)
  {
    v4 = -[RouteOverviewCell initWithFrame:]([RouteOverviewCell alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    -[UICollectionView bounds](self->super._collectionView, "bounds");
    Width = CGRectGetWidth(v13);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100B15DC8;
    v10[3] = &unk_1011AC8B0;
    v11 = v4;
    v12 = self;
    v6 = v4;
    -[RouteOverviewCell _maps_compressedSizeForWidth:withBlock:](v6, "_maps_compressedSizeForWidth:withBlock:", v10, Width);
    v8 = v7;

    return v8;
  }
  else
  {
    +[RouteOverviewCell minimumRidesharingHeight](RouteOverviewCell, "minimumRidesharingHeight");
  }
  return result;
}

- (id)listLayoutSectionConfigurationAtIndex:(int64_t)a3 layoutEnvironment:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  objc_super v13;

  v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)RideBookingRideOptionSection;
  v7 = -[RoutePlanningOutlineSection listLayoutSectionConfigurationAtIndex:layoutEnvironment:](&v13, "listLayoutSectionConfigurationAtIndex:layoutEnvironment:", a3, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  objc_msgSend(v8, "setSeparatorStyle:", 1);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100B15ED4;
  v11[3] = &unk_1011E2D68;
  v12 = v6;
  v9 = v6;
  objc_msgSend(v8, "setSeparatorInsetProvider:", v11);

  return v8;
}

- (void)didSelectItemAtIndexPath:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t Log;
  NSObject *v8;
  char *v9;
  id v10;
  id v11;
  uint8_t buf[4];
  char *v13;
  __int16 v14;
  id v15;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideOptionSection rideBookingRideOption](self, "rideBookingRideOption", a3));

  if (v4)
  {
    v11 = (id)objc_claimAutoreleasedReturnValue(-[RideBookingRideOptionSection parentDataSource](self, "parentDataSource"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "delegate"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideOptionSection rideBookingRideOption](self, "rideBookingRideOption"));
    objc_msgSend(v5, "didSelectRideOption:", v6);

  }
  else
  {
    Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "RideBooking");
    v8 = objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/TableViewDataSources/RideBookingRideOptionSection.m");
      v10 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("No ride option found"));
      *(_DWORD *)buf = 136315394;
      v13 = v9;
      v14 = 2112;
      v15 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "{RBError}{%s}: %@", buf, 0x16u);

    }
  }
}

- (void)ridesharingAppLargeIconTableViewCell:(id)a3 didSelectActionButton:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = (id)objc_claimAutoreleasedReturnValue(-[RideBookingRideOptionSection parentDataSource](self, "parentDataSource", a3, a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "delegate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideOptionSection rideBookingRideOptionStatus](self, "rideBookingRideOptionStatus"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "application"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
  objc_msgSend(v5, "didSelectFeedbackWithAppIdentifier:", v8);

}

- (void)ridesharingAppActionCollectionViewCellDidPerformAction:(id)a3
{
  id v4;
  id v5;
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
  id v17;

  v4 = a3;
  v17 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "status"));
  v5 = objc_msgSend(v4, "titleType");

  if ((unint64_t)v5 < 2)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "application"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "userActivity"));
    +[RideBookingDataCoordinator openRideBookingApplication:withUserActivity:](RideBookingDataCoordinator, "openRideBookingApplication:withUserActivity:", v6, v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    objc_msgSend(v8, "captureUserAction:onTarget:eventValue:", 6020, 304, 0);
LABEL_5:

    goto LABEL_6;
  }
  if (v5 == (id)2)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideOptionSection delegate](self, "delegate"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "application"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));
    objc_msgSend(v9, "didExpandSection:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "application"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "name"));
    objc_msgSend(v12, "captureUserAction:onTarget:eventValue:", 14008, 1401, v14);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideOptionSection parentDataSource](self, "parentDataSource"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "delegate"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideOptionSection parentDataSource](self, "parentDataSource"));
    objc_msgSend(v15, "dataSourceRequiresReload:", v16);

    goto LABEL_5;
  }
LABEL_6:

}

- (BOOL)isLastRideOptionInSection
{
  char *adjustedSectionOffset;
  void *v3;

  adjustedSectionOffset = (char *)self->_adjustedSectionOffset;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideOptionStatus rideOptions](self->_rideBookingRideOptionStatus, "rideOptions"));
  LOBYTE(adjustedSectionOffset) = adjustedSectionOffset == (char *)objc_msgSend(v3, "count") - 1;

  return (char)adjustedSectionOffset;
}

- (RideBookingRideOption)rideBookingRideOption
{
  unint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v3 = -[RideBookingRideOptionSection rideBookingRideOptionIndex](self, "rideBookingRideOptionIndex");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideOptionSection rideBookingRideOptions](self, "rideBookingRideOptions"));
  v5 = objc_msgSend(v4, "count");

  if (v3 >= (unint64_t)v5)
  {
    v7 = 0;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideOptionSection rideBookingRideOptions](self, "rideBookingRideOptions"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndex:", -[RideBookingRideOptionSection rideBookingRideOptionIndex](self, "rideBookingRideOptionIndex")));

  }
  return (RideBookingRideOption *)v7;
}

- (RideBookingOutlineController)parentDataSource
{
  return (RideBookingOutlineController *)objc_loadWeakRetained((id *)&self->_parentDataSource);
}

- (void)setParentDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_parentDataSource, a3);
}

- (RideBookingRideOptionSectionDelegate)delegate
{
  return (RideBookingRideOptionSectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)rideBookingRideOptionIndex
{
  return self->_rideBookingRideOptionIndex;
}

- (void)setRideBookingRideOptionIndex:(unint64_t)a3
{
  self->_rideBookingRideOptionIndex = a3;
}

- (NSArray)rideBookingRideOptions
{
  return self->_rideBookingRideOptions;
}

- (void)setRideBookingRideOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (RideBookingRideOptionStatus)rideBookingRideOptionStatus
{
  return self->_rideBookingRideOptionStatus;
}

- (void)setRideBookingRideOptionStatus:(id)a3
{
  objc_storeStrong((id *)&self->_rideBookingRideOptionStatus, a3);
}

- (int64_t)adjustedSectionOffset
{
  return self->_adjustedSectionOffset;
}

- (void)setAdjustedSectionOffset:(int64_t)a3
{
  self->_adjustedSectionOffset = a3;
}

- (BOOL)applicationSectionIsExpanded
{
  return self->_applicationSectionIsExpanded;
}

- (void)setApplicationSectionIsExpanded:(BOOL)a3
{
  self->_applicationSectionIsExpanded = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rideBookingRideOptionStatus, 0);
  objc_storeStrong((id *)&self->_rideBookingRideOptions, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_parentDataSource);
}

@end
