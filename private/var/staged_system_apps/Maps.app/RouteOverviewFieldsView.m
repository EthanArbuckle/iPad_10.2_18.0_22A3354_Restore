@implementation RouteOverviewFieldsView

- (RouteOverviewFieldsView)initWithDelegate:(id)a3 waypointInfoProvider:(id)a4
{
  return -[RouteOverviewFieldsView initWithDelegate:waypointInfoProvider:editingMode:](self, "initWithDelegate:waypointInfoProvider:editingMode:", a3, a4, 1);
}

- (RouteOverviewFieldsView)initWithDelegate:(id)a3 waypointInfoProvider:(id)a4 editingMode:(unint64_t)a5
{
  id v8;
  id v9;
  RouteOverviewFieldsView *v10;
  RouteOverviewFieldsView *v11;
  RoutePlanningWaypointListView *v12;
  void *v13;
  RoutePlanningWaypointListView *v14;
  RoutePlanningWaypointListView *waypointListView;
  uint64_t IsEnabled_Maps420;
  uint64_t v17;
  uint64_t v18;
  uint64_t IsEnabled_DrivingMultiWaypointRoutes;
  uint64_t IsEnabled_Maps182;
  void *v21;
  void *v22;
  uint64_t v23;
  NSLayoutConstraint *waypointListViewBottomConstraint;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  RoutePlanningRefinementBarView *v34;
  void *v35;
  void *v36;
  RoutePlanningRefinementBarView *v37;
  RoutePlanningRefinementBarView *refinementBarView;
  double v39;
  double v40;
  void *v42;
  id v43;
  id v44;
  objc_super v45;
  _QWORD v46[3];

  v8 = a3;
  v9 = a4;
  v45.receiver = self;
  v45.super_class = (Class)RouteOverviewFieldsView;
  v10 = -[RouteOverviewFieldsView initWithFrame:](&v45, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_delegate, v8);
    v12 = [RoutePlanningWaypointListView alloc];
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "waypointsForFieldsView:", v11));
    v14 = -[RoutePlanningWaypointListView initWithWaypoints:editingMode:delegate:waypointInfoProvider:](v12, "initWithWaypoints:editingMode:delegate:waypointInfoProvider:", v13, a5, v8, v9);
    waypointListView = v11->_waypointListView;
    v11->_waypointListView = v14;

    IsEnabled_Maps420 = (uint64_t)objc_msgSend(v8, "transportTypeForFieldsView:", v11);
    v18 = 0;
    v43 = v9;
    v44 = v8;
    switch(IsEnabled_Maps420)
    {
      case 0:
        IsEnabled_DrivingMultiWaypointRoutes = MapsFeature_IsEnabled_DrivingMultiWaypointRoutes(IsEnabled_Maps420, v17);
        if ((IsEnabled_DrivingMultiWaypointRoutes & 1) == 0)
        {
          IsEnabled_Maps420 = MapsFeature_IsEnabled_Maps420(IsEnabled_DrivingMultiWaypointRoutes);
          if ((IsEnabled_Maps420 & 1) == 0)
            goto LABEL_6;
        }
        v18 = 1;
        break;
      case 1:
        IsEnabled_Maps182 = MapsFeature_IsEnabled_DrivingMultiWaypointRoutes(IsEnabled_Maps420, v17);
        goto LABEL_9;
      case 2:
LABEL_6:
        IsEnabled_Maps182 = MapsFeature_IsEnabled_Maps182(IsEnabled_Maps420);
        goto LABEL_9;
      case 5:
        IsEnabled_Maps182 = MapsFeature_IsEnabled_Maps420(IsEnabled_Maps420);
LABEL_9:
        v18 = IsEnabled_Maps182;
        break;
      default:
        break;
    }
    -[RoutePlanningWaypointListView setMprEnabled:](v11->_waypointListView, "setMprEnabled:", v18);
    -[RoutePlanningWaypointListView setTranslatesAutoresizingMaskIntoConstraints:](v11->_waypointListView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[RouteOverviewFieldsView addSubview:](v11, "addSubview:", v11->_waypointListView);
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointListView bottomAnchor](v11->_waypointListView, "bottomAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewFieldsView bottomAnchor](v11, "bottomAnchor"));
    v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v22));
    waypointListViewBottomConstraint = v11->_waypointListViewBottomConstraint;
    v11->_waypointListViewBottomConstraint = (NSLayoutConstraint *)v23;

    v42 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointListView topAnchor](v11->_waypointListView, "topAnchor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewFieldsView topAnchor](v11, "topAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintEqualToAnchor:", v25));
    v46[0] = v26;
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointListView leadingAnchor](v11->_waypointListView, "leadingAnchor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewFieldsView leadingAnchor](v11, "leadingAnchor"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:", v28));
    v46[1] = v29;
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointListView trailingAnchor](v11->_waypointListView, "trailingAnchor"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewFieldsView trailingAnchor](v11, "trailingAnchor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:", v31));
    v46[2] = v32;
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v46, 3));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v33);

    v34 = [RoutePlanningRefinementBarView alloc];
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewFieldsView delegate](v11, "delegate"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "currentRefinementsForFieldsView:", v11));
    v8 = v44;
    v37 = -[RoutePlanningRefinementBarView initWithDelegate:refinements:](v34, "initWithDelegate:refinements:", v44, v36);
    refinementBarView = v11->_refinementBarView;
    v11->_refinementBarView = v37;

    -[RoutePlanningRefinementBarView setTranslatesAutoresizingMaskIntoConstraints:](v11->_refinementBarView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v39) = 1148846080;
    -[RoutePlanningRefinementBarView setContentHuggingPriority:forAxis:](v11->_refinementBarView, "setContentHuggingPriority:forAxis:", 1, v39);
    LODWORD(v40) = 1148846080;
    -[RoutePlanningRefinementBarView setContentCompressionResistancePriority:forAxis:](v11->_refinementBarView, "setContentCompressionResistancePriority:forAxis:", 1, v40);
    -[RouteOverviewFieldsView _addRefinementsBar](v11, "_addRefinementsBar");
    v11->_hasRefinementsBar = 1;
    v9 = v43;
  }

  return v11;
}

- (void)updateWaypointsList
{
  GCDTimer *waypointsListUpdateTimer;
  GCDTimer *v4;
  void *v5;
  RoutePlanningWaypointListView **p_waypointListView;
  void *v7;
  void *v8;
  void *v9;
  uint64_t IsEnabled_Maps420;
  uint64_t v11;
  uint64_t v12;
  uint64_t IsEnabled_DrivingMultiWaypointRoutes;
  uint64_t IsEnabled_Maps182;

  waypointsListUpdateTimer = self->_waypointsListUpdateTimer;
  if (waypointsListUpdateTimer)
  {
    -[GCDTimer invalidate](waypointsListUpdateTimer, "invalidate");
    v4 = self->_waypointsListUpdateTimer;
    self->_waypointsListUpdateTimer = 0;

  }
  self->_estimatedHeight = 0.0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewFieldsView overrideWaypoints](self, "overrideWaypoints"));
  if (v5)
  {
    p_waypointListView = &self->_waypointListView;
    -[RoutePlanningWaypointListView setWaypoints:](self->_waypointListView, "setWaypoints:", v5);
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewFieldsView delegate](self, "delegate"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "waypointsForFieldsView:", self));
    p_waypointListView = &self->_waypointListView;
    -[RoutePlanningWaypointListView setWaypoints:](self->_waypointListView, "setWaypoints:", v8);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewFieldsView delegate](self, "delegate"));
  IsEnabled_Maps420 = (uint64_t)objc_msgSend(v9, "transportTypeForFieldsView:", self);
  v12 = 0;
  switch(IsEnabled_Maps420)
  {
    case 0:
      IsEnabled_DrivingMultiWaypointRoutes = MapsFeature_IsEnabled_DrivingMultiWaypointRoutes(IsEnabled_Maps420, v11);
      if ((IsEnabled_DrivingMultiWaypointRoutes & 1) == 0)
      {
        IsEnabled_Maps420 = MapsFeature_IsEnabled_Maps420(IsEnabled_DrivingMultiWaypointRoutes);
        if ((IsEnabled_Maps420 & 1) == 0)
          goto LABEL_10;
      }
      v12 = 1;
      break;
    case 1:
      IsEnabled_Maps182 = MapsFeature_IsEnabled_DrivingMultiWaypointRoutes(IsEnabled_Maps420, v11);
      goto LABEL_13;
    case 2:
LABEL_10:
      IsEnabled_Maps182 = MapsFeature_IsEnabled_Maps182(IsEnabled_Maps420);
      goto LABEL_13;
    case 5:
      IsEnabled_Maps182 = MapsFeature_IsEnabled_Maps420(IsEnabled_Maps420);
LABEL_13:
      v12 = IsEnabled_Maps182;
      break;
    default:
      break;
  }
  -[RoutePlanningWaypointListView setMprEnabled:](*p_waypointListView, "setMprEnabled:", v12);

  -[RoutePlanningWaypointListView refreshWaypointDisplay](*p_waypointListView, "refreshWaypointDisplay");
}

- (void)setNeedsUpdateWaypointsList
{
  id v3;
  GCDTimer *v4;
  GCDTimer *waypointsListUpdateTimer;
  _QWORD v6[4];
  id v7;
  id location;

  if (!self->_waypointsListUpdateTimer)
  {
    objc_initWeak(&location, self);
    v3 = &_dispatch_main_q;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1009BD938;
    v6[3] = &unk_1011AE190;
    objc_copyWeak(&v7, &location);
    v4 = (GCDTimer *)objc_claimAutoreleasedReturnValue(+[GCDTimer scheduledTimerWithTimeInterval:queue:block:](GCDTimer, "scheduledTimerWithTimeInterval:queue:block:", &_dispatch_main_q, v6, 2.22044605e-16));
    waypointsListUpdateTimer = self->_waypointsListUpdateTimer;
    self->_waypointsListUpdateTimer = v4;

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

- (void)updateRefinements
{
  GCDTimer *refinementsUpdateTimer;
  GCDTimer *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  refinementsUpdateTimer = self->_refinementsUpdateTimer;
  if (refinementsUpdateTimer)
  {
    -[GCDTimer invalidate](refinementsUpdateTimer, "invalidate");
    v4 = self->_refinementsUpdateTimer;
    self->_refinementsUpdateTimer = 0;

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewFieldsView delegate](self, "delegate"));
  if (objc_msgSend(v5, "transportTypeForFieldsView:", self) == (id)4)
    v6 = GEOConfigGetBOOL(MapsConfig_RoutePlanningUseTransportTypeButtons, off_1014B4F88) ^ 1;
  else
    v6 = 1;

  -[RouteOverviewFieldsView setHasRefinementsBar:](self, "setHasRefinementsBar:", v6);
  self->_estimatedHeight = 0.0;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[RouteOverviewFieldsView delegate](self, "delegate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "currentRefinementsForFieldsView:", self));
  -[RoutePlanningRefinementBarView setRefinements:](self->_refinementBarView, "setRefinements:", v7);

}

- (void)setNeedsUpdateRefinements
{
  id v3;
  GCDTimer *v4;
  GCDTimer *refinementsUpdateTimer;
  _QWORD v6[4];
  id v7;
  id location;

  if (!self->_refinementsUpdateTimer)
  {
    objc_initWeak(&location, self);
    v3 = &_dispatch_main_q;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1009BDB48;
    v6[3] = &unk_1011AE190;
    objc_copyWeak(&v7, &location);
    v4 = (GCDTimer *)objc_claimAutoreleasedReturnValue(+[GCDTimer scheduledTimerWithTimeInterval:queue:block:](GCDTimer, "scheduledTimerWithTimeInterval:queue:block:", &_dispatch_main_q, v6, 2.22044605e-16));
    refinementsUpdateTimer = self->_refinementsUpdateTimer;
    self->_refinementsUpdateTimer = v4;

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

- (void)setHasRefinementsBar:(BOOL)a3
{
  if (self->_hasRefinementsBar != a3)
  {
    self->_hasRefinementsBar = a3;
    if (a3)
      -[RouteOverviewFieldsView _addRefinementsBar](self, "_addRefinementsBar");
    else
      -[RouteOverviewFieldsView _removeRefinementsBar](self, "_removeRefinementsBar");
  }
}

- (double)estimatedHeight
{
  double result;
  double v4;

  result = self->_estimatedHeight;
  if (result <= 0.0)
  {
    -[RouteOverviewFieldsView systemLayoutSizeFittingSize:](self, "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height);
    result = v4;
    self->_estimatedHeight = v4;
  }
  return result;
}

- (BOOL)hasExpandedWaypoints
{
  return -[RoutePlanningWaypointListView hasExpandedStops](self->_waypointListView, "hasExpandedStops");
}

- (void)expandWaypointsIfNeeded
{
  self->_estimatedHeight = 0.0;
  -[RoutePlanningWaypointListView expandStopsIfNeeded](self->_waypointListView, "expandStopsIfNeeded");
}

- (void)collapseWaypointsIfNeeded
{
  self->_estimatedHeight = 0.0;
  -[RoutePlanningWaypointListView collapseStopsIfNeeded](self->_waypointListView, "collapseStopsIfNeeded");
}

- (void)reset
{
  self->_estimatedHeight = 0.0;
  -[RoutePlanningWaypointListView setWaypoints:](self->_waypointListView, "setWaypoints:", &__NSArray0__struct);
  -[RoutePlanningWaypointListView collapseStopsIfNeeded](self->_waypointListView, "collapseStopsIfNeeded");
  -[RoutePlanningRefinementBarView setRefinements:](self->_refinementBarView, "setRefinements:", &__NSArray0__struct);
  -[RoutePlanningRefinementBarView resetScrollPosition](self->_refinementBarView, "resetScrollPosition");
}

- (void)_pressedTiming
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[RouteOverviewFieldsView delegate](self, "delegate"));
  objc_msgSend(v3, "didTapTimingInFieldsView:", self);

}

- (void)_addRefinementsBar
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
  _QWORD v16[4];

  -[RouteOverviewFieldsView addSubview:](self, "addSubview:", self->_refinementBarView);
  self->_estimatedHeight = 0.0;
  -[NSLayoutConstraint setActive:](self->_waypointListViewBottomConstraint, "setActive:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningRefinementBarView leadingAnchor](self->_refinementBarView, "leadingAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewFieldsView leadingAnchor](self, "leadingAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:", v14));
  v16[0] = v13;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningRefinementBarView trailingAnchor](self->_refinementBarView, "trailingAnchor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewFieldsView trailingAnchor](self, "trailingAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "constraintEqualToAnchor:", v4));
  v16[1] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningRefinementBarView topAnchor](self->_refinementBarView, "topAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointListView bottomAnchor](self->_waypointListView, "bottomAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToAnchor:constant:", v7, 12.0));
  v16[2] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningRefinementBarView bottomAnchor](self->_refinementBarView, "bottomAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RouteOverviewFieldsView bottomAnchor](self, "bottomAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:", v10));
  v16[3] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v16, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v12);

}

- (void)_removeRefinementsBar
{
  self->_estimatedHeight = 0.0;
  -[RoutePlanningRefinementBarView removeFromSuperview](self->_refinementBarView, "removeFromSuperview");
  -[NSLayoutConstraint setActive:](self->_waypointListViewBottomConstraint, "setActive:", 1);
}

- (RoutePlanningWaypointListView)waypointListView
{
  return self->_waypointListView;
}

- (RouteOverviewFieldsViewDelegate)delegate
{
  return (RouteOverviewFieldsViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSArray)overrideWaypoints
{
  return self->_overrideWaypoints;
}

- (void)setOverrideWaypoints:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (BOOL)hasRefinementsBar
{
  return self->_hasRefinementsBar;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideWaypoints, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_waypointListView, 0);
  objc_storeStrong((id *)&self->_waypointListViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_waypointsListUpdateTimer, 0);
  objc_storeStrong((id *)&self->_refinementsUpdateTimer, 0);
  objc_storeStrong((id *)&self->_refinementBarView, 0);
}

@end
