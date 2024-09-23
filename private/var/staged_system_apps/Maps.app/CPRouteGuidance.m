@implementation CPRouteGuidance

- (id)_maps_description
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
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

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 10));
  v4 = NSStringFromCPGuidanceState(-[CPRouteGuidance guidanceState](self, "guidanceState"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = NSStringFromCPManeuverState(-[CPRouteGuidance maneuverState](self, "maneuverState"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ | %@"), v5, v7));
  objc_msgSend(v3, "addObject:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CPRouteGuidance currentRoadNameVariants](self, "currentRoadNameVariants"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "componentsJoinedByString:", CFSTR(", ")));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Road name: %@"), v10));
  objc_msgSend(v3, "addObject:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CPRouteGuidance destinationNameVariants](self, "destinationNameVariants"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "componentsJoinedByString:", CFSTR(", ")));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Destination name: %@"), v13));
  objc_msgSend(v3, "addObject:", v14);

  -[CPRouteGuidance timeRemaining](self, "timeRemaining");
  v16 = v15;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CPRouteGuidance estimatedTimeOfArrival](self, "estimatedTimeOfArrival"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Time remaining: %gs | ETA: %@"), v16, v17));
  objc_msgSend(v3, "addObject:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Time zone offset minutes: %d"), (int)-[CPRouteGuidance destinationTimeZoneOffsetMinutes](self, "destinationTimeZoneOffsetMinutes")));
  objc_msgSend(v3, "addObject:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[CPRouteGuidance distanceRemaining](self, "distanceRemaining"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CPRouteGuidance distanceRemainingDisplay](self, "distanceRemainingDisplay"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Distance remaining: %@ | Display: %@"), v20, v21));
  objc_msgSend(v3, "addObject:", v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CPRouteGuidance distanceRemainingToNextManeuver](self, "distanceRemainingToNextManeuver"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[CPRouteGuidance distanceRemainingToNextManeuverDisplay](self, "distanceRemainingToNextManeuverDisplay"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Maneuver distance remaining: %@ | Display: %@"), v23, v24));
  objc_msgSend(v3, "addObject:", v25);

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[CPRouteGuidance currentManeuverIndexes](self, "currentManeuverIndexes"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "componentsJoinedByString:", CFSTR(", ")));
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Current maneuver indexes: %@"), v27));
  objc_msgSend(v3, "addObject:", v28);

  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Lane guidance showing: %d"), -[CPRouteGuidance laneGuidanceShowing](self, "laneGuidanceShowing")));
  objc_msgSend(v3, "addObject:", v29);

  if (-[CPRouteGuidance laneGuidanceShowing](self, "laneGuidanceShowing"))
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Current lane guidance index: %d"), -[CPRouteGuidance currentLaneGuidanceIndex](self, "currentLaneGuidanceIndex")));
    objc_msgSend(v3, "addObject:", v30);

  }
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Being shown in app: %d"), -[CPRouteGuidance beingShownInApp](self, "beingShownInApp")));
  objc_msgSend(v3, "addObject:", v31);

  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "componentsJoinedByString:", CFSTR("\n")));
  return v32;
}

@end
