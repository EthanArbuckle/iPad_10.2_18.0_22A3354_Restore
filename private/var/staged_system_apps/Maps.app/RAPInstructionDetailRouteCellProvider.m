@implementation RAPInstructionDetailRouteCellProvider

- (RAPInstructionDetailRouteCellProvider)initWithRoute:(id)a3
{
  id v5;
  RAPInstructionDetailRouteCellProvider *v6;
  RAPInstructionDetailRouteCellProvider *v7;
  TransitDirectionsStepsListDataSource *v8;
  TransitDirectionsStepsListDataSource *dataSource;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RAPInstructionDetailRouteCellProvider;
  v6 = -[RAPInstructionDetailRouteCellProvider init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_route, a3);
    v8 = -[TransitDirectionsStepsListDataSource initWithRoute:]([TransitDirectionsStepsListDataSource alloc], "initWithRoute:", v5);
    dataSource = v7->_dataSource;
    v7->_dataSource = v8;

  }
  return v7;
}

- (void)registerCellsForTableView:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;

  v3 = a3;
  +[TransitDirectionsCell registerCellsForTableView:](TransitDirectionsCell, "registerCellsForTableView:", v3);
  v4 = objc_opt_class(RAPDirectionsTableViewCell);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[DirectionsStepTableViewCell reuseIdentifier](RAPDirectionsTableViewCell, "reuseIdentifier"));
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", v4, v5);

  v6 = objc_opt_class(DirectionsStartEndTableViewCell);
  v7 = (id)objc_claimAutoreleasedReturnValue(+[DirectionsStartEndTableViewCell reuseIdentifier](DirectionsStartEndTableViewCell, "reuseIdentifier"));
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", v6, v7);

}

- (id)directionStepCellForTableView:(id)a3 step:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _BOOL8 v21;
  double v22;
  void *v23;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute steps](self->_route, "steps"));
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute steps](self->_route, "steps"));
  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lastObject"));

  if (v9 == v7 || v11 == v7)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[DirectionsStartEndTableViewCell reuseIdentifier](DirectionsStartEndTableViewCell, "reuseIdentifier"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", v13));

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute _maps_directionsWaypoints](self->_route, "_maps_directionsWaypoints"));
    v15 = v14;
    if (v9 == v7)
      v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "firstObject"));
    else
      v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "lastObject"));
    v23 = (void *)v16;
    objc_msgSend(v18, "configureForWaypoint:route:selectedVehicle:displayedInRoutePlanning:", v16, self->_route, 0, 0);

  }
  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[DirectionsStepTableViewCell reuseIdentifier](RAPDirectionsTableViewCell, "reuseIdentifier"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", v17));

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "geoStep"));
    if (objc_msgSend(v19, "hasManeuverType"))
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "geoStep"));
      v21 = objc_msgSend(v20, "maneuverType") != 0;

    }
    else
    {
      v21 = 0;
    }

    objc_msgSend(v18, "setRoute:step:stepIndex:alignToLeftEdgeIfNoManeuverSign:size:", self->_route, v7, objc_msgSend(v7, "stepIndex"), v21, 4);
    objc_msgSend(v6, "bounds");
    objc_msgSend(v18, "updateHeightForWidth:", v22);
  }

  return v18;
}

- (id)transitDirectionsCellForTableView:(id)a3 item:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  objc_class *v15;
  NSString *v16;

  v6 = a3;
  v7 = a4;
  v8 = objc_opt_class(TransitDirectionsListItem);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathWithIndex:](NSIndexPath, "indexPathWithIndex:", 1));
    v10 = (id)objc_claimAutoreleasedReturnValue(+[TransitDirectionsCell dequeueCellForListItem:fromTableView:atIndexPath:](TransitDirectionsCell, "dequeueCellForListItem:fromTableView:atIndexPath:", v7, v6, v9));
    -[RAPInstructionDetailRouteCellProvider _calculateLeadingInstructionMarginForTableView:](self, "_calculateLeadingInstructionMarginForTableView:", v6);
    -[TransitDirectionsStepsListDataSource leadingInstructionMargin](self->_dataSource, "leadingInstructionMargin");
    objc_msgSend(v10, "setLeadingInstructionMargin:");
    objc_msgSend(v10, "configureWithItem:", v7);
    objc_msgSend(v10, "setAccessoryType:", 0);
    v11 = objc_opt_class(TransitDirectionsInstructionsCell);
    if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stepView"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "detailButton"));
      objc_msgSend(v13, "setTitle:forState:", 0, 0);

    }
  }
  else
  {
    v14 = objc_alloc((Class)MKTableViewCell);
    v15 = (objc_class *)objc_opt_class(MKTableViewCell);
    v16 = NSStringFromClass(v15);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v10 = objc_msgSend(v14, "initWithStyle:reuseIdentifier:", 0, v9);
  }

  return v10;
}

- (void)_calculateLeadingInstructionMarginForTableView:(id)a3
{
  double v4;

  objc_msgSend(a3, "bounds");
  -[TransitDirectionsStepsListDataSource recalculateLeadingInstructionMarginForWidth:](self->_dataSource, "recalculateLeadingInstructionMarginForWidth:", v4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_route, 0);
}

@end
