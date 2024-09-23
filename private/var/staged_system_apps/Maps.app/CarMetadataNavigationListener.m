@implementation CarMetadataNavigationListener

- (CarMetadataNavigationListener)initWithDelegate:(id)a3
{
  id v4;
  CarMetadataNavigationListener *v5;
  CarMetadataNavigationListener *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CarMetadataNavigationListener;
  v5 = -[CarMetadataNavigationListener init](&v9, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
    objc_msgSend(v7, "registerObserver:", v6);

  }
  return v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  objc_msgSend(v3, "unregisterObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)CarMetadataNavigationListener;
  -[CarMetadataNavigationListener dealloc](&v4, "dealloc");
}

- (void)_startRouteGuidanceUpdatesWithRoute:(id)a3
{
  id v4;
  CPRouteGuidance *v5;
  CPRouteGuidance *cpRouteGuidance;
  id v7;
  NSObject *v8;
  void *v9;
  unsigned int v10;
  int v11;
  void *v12;
  __int16 v13;
  unsigned int v14;

  v4 = a3;
  v5 = (CPRouteGuidance *)objc_alloc_init((Class)CPRouteGuidance);
  cpRouteGuidance = self->_cpRouteGuidance;
  self->_cpRouteGuidance = v5;

  -[CPRouteGuidance setSourceName:](self->_cpRouteGuidance, "setSourceName:", CFSTR("Apple Maps"));
  -[CPRouteGuidance setSourceSupportsRouteGuidance:](self->_cpRouteGuidance, "setSourceSupportsRouteGuidance:", 1);
  v7 = sub_1004AF8F0();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CPRouteGuidance sourceName](self->_cpRouteGuidance, "sourceName"));
    v10 = -[CPRouteGuidance sourceSupportsRouteGuidance](self->_cpRouteGuidance, "sourceSupportsRouteGuidance");
    v11 = 138412546;
    v12 = v9;
    v13 = 1024;
    v14 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Creating CPRouteGuidance. Source name: %@, supports route guidance: %d", (uint8_t *)&v11, 0x12u);

  }
  self->_cpGuidanceState = 1;
  -[CarMetadataNavigationListener _updateForNewRoute:](self, "_updateForNewRoute:", v4);

  -[CarMetadataNavigationListener _updateBeingShownInApp](self, "_updateBeingShownInApp");
}

- (void)_stopRouteGuidanceUpdates
{
  NSArray *activeManeuverGuidanceEvents;
  _CarMetadataGuidanceEventPair *activeLaneGuidanceEvent;
  CPRouteGuidance *cpRouteGuidance;
  id v6;
  id v7;
  NSObject *v8;
  uint8_t v9[16];

  activeManeuverGuidanceEvents = self->_activeManeuverGuidanceEvents;
  self->_activeManeuverGuidanceEvents = 0;

  activeLaneGuidanceEvent = self->_activeLaneGuidanceEvent;
  self->_activeLaneGuidanceEvent = 0;

  cpRouteGuidance = self->_cpRouteGuidance;
  self->_cpRouteGuidance = 0;

  v6 = objc_alloc_init((Class)CPRouteGuidance);
  objc_msgSend(v6, "setGuidanceState:", 0);
  v7 = sub_1004AF8F0();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Stopping CarPlay metadata updates.", v9, 2u);
  }

  -[CarMetadataNavigationListener _updateRouteGuidance:](self, "_updateRouteGuidance:", v6);
}

- (void)_updateRouteGuidance:(id)a3
{
  id v4;
  id WeakRetained;
  char v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  int v11;
  void *v12;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector(WeakRetained, "navigationListener:didUpdateRouteGuidance:");

  if ((v6 & 1) != 0)
  {
    v7 = sub_1004AF8F0();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_maps_description"));
      v11 = 138412290;
      v12 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Updating CPRouteGuidance: %@", (uint8_t *)&v11, 0xCu);

    }
    v10 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v10, "navigationListener:didUpdateRouteGuidance:", self, v4);

  }
}

- (void)_updateBeingShownInApp
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  v4 = objc_msgSend(v3, "state");

  -[CPRouteGuidance setBeingShownInApp:](self->_cpRouteGuidance, "setBeingShownInApp:", v4 == (id)4);
}

- (BOOL)_isTurnByTurn:(unint64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFELL) == 4;
}

- (id)_measurementForDistanceInMeters:(double)a3
{
  void *v4;
  uint64_t v5;
  float v6;
  float v7;
  uint64_t v8;
  void *v9;
  id v10;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](NSLocale, "currentLocale"));
  v5 = MNInstructionsCalculateDistanceUnits(objc_msgSend(v4, "_navigation_distanceUsesMetricSystem"), objc_msgSend(v4, "_navigation_useYardsForShortDistances"), 0, a3);
  v7 = v6;
  switch(v5)
  {
    case 0:
      v8 = objc_claimAutoreleasedReturnValue(+[NSUnitLength meters](NSUnitLength, "meters"));
      goto LABEL_9;
    case 1:
      v8 = objc_claimAutoreleasedReturnValue(+[NSUnitLength kilometers](NSUnitLength, "kilometers"));
      goto LABEL_9;
    case 2:
      v8 = objc_claimAutoreleasedReturnValue(+[NSUnitLength yards](NSUnitLength, "yards"));
      goto LABEL_9;
    case 3:
      v8 = objc_claimAutoreleasedReturnValue(+[NSUnitLength feet](NSUnitLength, "feet"));
      goto LABEL_9;
    case 4:
      goto LABEL_8;
    case 5:
      v7 = v6 * 0.25;
LABEL_8:
      v8 = objc_claimAutoreleasedReturnValue(+[NSUnitLength miles](NSUnitLength, "miles"));
LABEL_9:
      v9 = (void *)v8;
      break;
    default:
      v9 = 0;
      break;
  }
  v10 = objc_msgSend(objc_alloc((Class)NSMeasurement), "initWithDoubleValue:unit:", v9, v7);

  return v10;
}

- (void)_updateForNewRoute:(id)a3
{
  id v4;
  id v5;
  id v6;
  int v7;
  int v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  _CarMetadataGuidanceEventPair *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  _CarMetadataGuidanceEventPair *v19;
  void *v20;
  void *v21;
  id WeakRetained;
  char v23;
  id v24;
  id obj;
  id v26;
  id v27;
  uint64_t v28;
  void *v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];

  v4 = a3;
  v27 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v26 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v29 = v4;
  v30 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "composedGuidanceEvents"));
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = 0;
    v28 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v32 != v28)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarMetadataNavigationListener _cpManeuverForGuidanceEvent:route:](self, "_cpManeuverForGuidanceEvent:route:", v10, v29));
        v12 = v11;
        if (v11)
        {
          objc_msgSend(v11, "setIndex:", (unsigned __int16)v8);
          v13 = objc_opt_new(_CarMetadataGuidanceEventPair);
          -[_CarMetadataGuidanceEventPair setGuidanceEvent:](v13, "setGuidanceEvent:", v10);
          v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", objc_msgSend(v12, "index")));
          -[_CarMetadataGuidanceEventPair setCpIndex:](v13, "setCpIndex:", v14);

          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "uniqueID"));
          objc_msgSend(v30, "setObject:forKeyedSubscript:", v13, v15);

          objc_msgSend(v27, "addObject:", v12);
          ++v8;
        }
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[CarMetadataNavigationListener _cpLaneGuidanceForGuidanceEvent:](self, "_cpLaneGuidanceForGuidanceEvent:", v10));
        v17 = v16;
        if (v16)
        {
          v18 = v7 + 1;
          objc_msgSend(v16, "setIndex:", (unsigned __int16)v7);
          v19 = objc_opt_new(_CarMetadataGuidanceEventPair);
          -[_CarMetadataGuidanceEventPair setGuidanceEvent:](v19, "setGuidanceEvent:", v10);
          v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", objc_msgSend(v17, "index")));
          -[_CarMetadataGuidanceEventPair setCpIndex:](v19, "setCpIndex:", v20);

          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "uniqueID"));
          objc_msgSend(v30, "setObject:forKeyedSubscript:", v19, v21);

          objc_msgSend(v26, "addObject:", v17);
          v7 = v18;
        }

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v6);
  }

  objc_storeStrong((id *)&self->_cpManeuvers, v27);
  objc_storeStrong((id *)&self->_cpLaneGuidances, v26);
  objc_storeStrong((id *)&self->_guidanceEventLookup, v30);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v23 = objc_opt_respondsToSelector(WeakRetained, "navigationListener:didUpdateManeuvers:laneGuidances:");

  if ((v23 & 1) != 0)
  {
    v24 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v24, "navigationListener:didUpdateManeuvers:laneGuidances:", self, self->_cpManeuvers, self->_cpLaneGuidances);

  }
}

- (id)_cpManeuverForGuidanceEvent:(id)a3 route:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  CPManeuver *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char *v21;
  char *v22;
  char *v23;
  void *v24;
  _BYTE *v25;
  int v26;
  int v27;
  char v28;
  id v29;
  double v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v38;
  id v39;
  void *v40;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "hasSignGuidance"))
  {
    v8 = objc_msgSend(v6, "stepIndex");
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "steps"));
    if (v8 >= objc_msgSend(v9, "count"))
    {
      v11 = 0;
    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "steps"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v6, "stepIndex")));

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "maneuverJunction"));
    v12 = objc_opt_new(CPManeuver);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CarMetadataNavigationListener _cpTravelEstimatesForGuidanceEvent:route:](self, "_cpTravelEstimatesForGuidanceEvent:route:", v6, v7));
    -[CPManeuver setInitialTravelEstimates:](v12, "setInitialTravelEstimates:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CarMetadataNavigationListener _instructionVariantsForGuidanceEvent:route:](self, "_instructionVariantsForGuidanceEvent:route:", v6, v7));
    -[CPManeuver setInstructionVariants:](v12, "setInstructionVariants:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CarMetadataNavigationListener _attributedInstructionVariantsForGuidanceEvent:route:](self, "_attributedInstructionVariantsForGuidanceEvent:route:", v6, v7));
    -[CPManeuver setAttributedInstructionVariants:](v12, "setAttributedInstructionVariants:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CarMetadataNavigationListener _symbolImageForGuidanceEvent:](self, "_symbolImageForGuidanceEvent:", v6));
    -[CPManeuver setSymbolImage:](v12, "setSymbolImage:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "roadName"));
    if (v18)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "roadName"));
      v40 = v19;
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v40, 1));
      -[CPManeuver setRoadFollowingManeuverVariants:](v12, "setRoadFollowingManeuverVariants:", v20);

    }
    else
    {
      -[CPManeuver setRoadFollowingManeuverVariants:](v12, "setRoadFollowingManeuverVariants:", 0);
    }

    -[CPManeuver setManeuverType:](v12, "setManeuverType:", sub_1006C1370((int)objc_msgSend(v6, "maneuverType")));
    -[CPManeuver setTrafficSide:](v12, "setTrafficSide:", objc_msgSend(v6, "drivingSide") != 0);
    -[CPManeuver setJunctionType:](v12, "setJunctionType:", objc_msgSend(v13, "junctionType") != 0);
    v21 = (char *)objc_msgSend(v13, "numElements");
    if (v21)
    {
      v22 = v21;
      v38 = v7;
      v39 = v6;
      v23 = (char *)objc_msgSend(v13, "elements");
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", objc_msgSend(v13, "numElements")));
      v25 = v23 + 12;
      do
      {
        v26 = *((_DWORD *)v25 - 3);
        v27 = *((_DWORD *)v25 - 1);
        v28 = *v25;
        v29 = objc_alloc((Class)NSMeasurement);
        v30 = (double)v26;
        v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSUnitAngle degrees](NSUnitAngle, "degrees"));
        v32 = objc_msgSend(v29, "initWithDoubleValue:unit:", v31, v30);

        if ((v28 & 4) != 0 && v27 == 2)
          -[CPManeuver setJunctionExitAngle:](v12, "setJunctionExitAngle:", v32);
        else
          objc_msgSend(v24, "addObject:", v32);
        v25 += 16;

        --v22;
      }
      while (v22);
      -[CPManeuver setJunctionElementAngles:](v12, "setJunctionElementAngles:", v24);

      v7 = v38;
      v6 = v39;
    }
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "geoStep"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "exitNumber"));

    if (v34)
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "shieldInfo"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "shield"));

      if (objc_msgSend(v36, "length"))
        -[CPManeuver setExitInfo:](v12, "setExitInfo:", v36);

    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)_cpTravelEstimatesForGuidanceEvent:(id)a3 route:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  double *v20;
  uint64_t v21;
  uint64_t v22;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "distanceBetweenRouteCoordinate:andRouteCoordinate:", objc_msgSend(v5, "startValidRouteCoordinate"), objc_msgSend(v5, "endValidRouteCoordinate"));
  v7 = GEORoundedMeasurementForDistance(1);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v19 = 0;
  v20 = (double *)&v19;
  v21 = 0x2020000000;
  v22 = 0;
  v9 = objc_msgSend(v5, "startValidRouteCoordinate");
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1004B04F0;
  v15[3] = &unk_1011B8908;
  v10 = v5;
  v16 = v10;
  v11 = v6;
  v17 = v11;
  v18 = &v19;
  objc_msgSend(v11, "iterateTravelTimeRangesFromRouteCoordinate:etaRoute:handler:", v9, 0, v15);
  v12 = objc_alloc((Class)CPTravelEstimates);
  v13 = objc_msgSend(v12, "initWithDistanceRemaining:timeRemaining:", v8, v20[3]);

  _Block_object_dispose(&v19, 8);
  return v13;
}

- (id)_instructionVariantsForGuidanceEvent:(id)a3 route:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "secondarySignStrings"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1004B0648;
  v13[3] = &unk_1011B8958;
  v13[4] = self;
  v14 = v7;
  v15 = v6;
  v9 = v6;
  v10 = v7;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_geo_map:", v13));

  return v11;
}

- (id)_attributedInstructionVariantsForGuidanceEvent:(id)a3 route:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "secondarySignStrings"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1004B07E4;
  v13[3] = &unk_1011B8980;
  v13[4] = self;
  v14 = v7;
  v15 = v6;
  v9 = v6;
  v10 = v7;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_geo_map:", v13));

  return v11;
}

- (id)_symbolImageForGuidanceEvent:(id)a3
{
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _BYTE v14[496];
  _OWORD __src[31];

  memset(__src, 0, sizeof(__src));
  v3 = a3;
  MKDefaultGuidanceManeuverMetrics(__src);
  v4 = objc_msgSend(v3, "maneuverType");
  v5 = objc_msgSend(v3, "drivingSide");

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor lightGrayColor](UIColor, "lightGrayColor"));
  memcpy(v14, __src, sizeof(v14));
  v8 = MKManeuverArrowImage(v4, v5, v14, v6, v7, 0, *((double *)__src + 1), *(double *)&__src[1], 1.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection traitCollectionWithUserInterfaceStyle:](UITraitCollection, "traitCollectionWithUserInterfaceStyle:", 2));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "configuration"));
  v12 = objc_msgSend(v11, "configurationWithTraitCollection:", v10);

  return v9;
}

- (id)_cpLaneGuidanceForGuidanceEvent:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[5];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lanes"));
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lanes"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1004B0B78;
    v11[3] = &unk_1011B89D0;
    v11[4] = self;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_geo_map:", v11));

    v9 = (void *)objc_opt_new(CPLaneGuidance);
    objc_msgSend(v9, "setLanes:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (double)_angleForGeoLaneDirection:(int)a3
{
  double result;

  result = 0.0;
  if (a3 > 31)
  {
    if (a3 > 127)
    {
      if (a3 == 256)
      {
        return 180.0;
      }
      else if (a3 == 128)
      {
        return -45.0;
      }
    }
    else if (a3 == 32)
    {
      return -135.0;
    }
    else if (a3 == 64)
    {
      return -90.0;
    }
  }
  else if (a3 > 7)
  {
    if (a3 == 8)
    {
      return 135.0;
    }
    else if (a3 == 16)
    {
      return -180.0;
    }
  }
  else if (a3 == 2)
  {
    return 45.0;
  }
  else if (a3 == 4)
  {
    return 90.0;
  }
  return result;
}

- (int64_t)_maneuverStateForLocation:(id)a3 distanceToManeuver:(double)a4
{
  id v5;
  void *v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  int64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];

  v5 = a3;
  if (qword_1014D2640 != -1)
    dispatch_once(&qword_1014D2640, &stru_1011B89F0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "routeMatch"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "road"));
  v8 = objc_msgSend(v7, "roadClass");

  if (v8 - 2 > 6)
    v9 = 0;
  else
    v9 = qword_100E375A0[v8 - 2];
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](NSLocale, "currentLocale"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", NSLocaleMeasurementSystem));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1014D2638, "objectForKeyedSubscript:", v11));
  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v9));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", v13));

    if (v14)
    {
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v15 = v14;
      v16 = (int64_t)objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v16)
      {
        v17 = *(_QWORD *)v26;
        while (2)
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v26 != v17)
              objc_enumerationMutation(v15);
            v19 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
            if (objc_msgSend(v19, "count", (_QWORD)v25) == (id)2)
            {
              v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectAtIndexedSubscript:", 0));
              objc_msgSend(v20, "doubleValue");
              v22 = v21;

              if (v22 > a4)
              {
                v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectAtIndexedSubscript:", 1));
                v16 = objc_msgSend(v23, "unsignedCharValue");

                goto LABEL_19;
              }
            }
          }
          v16 = (int64_t)objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
          if (v16)
            continue;
          break;
        }
      }
LABEL_19:

    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (void)_updateStringArgument:(id)a3 route:(id)a4 guidanceEvent:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  uint64_t v17;
  void *v18;
  unsigned int v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a3;
  v7 = a4;
  v8 = a5;
  if (objc_msgSend(v22, "type") == 10)
  {
    v9 = objc_msgSend(v7, "legIndexForStepIndex:", objc_msgSend(v8, "stepIndex"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "legs"));
    v11 = objc_msgSend(v10, "count");

    if (v9 < v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "legs"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", v9));

      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "token"));
      v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("{Name}"));

      if (v15)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "destination"));
        v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "navDisplayName"));
      }
      else
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "token"));
        v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("{Address}"));

        if (!v19)
        {
LABEL_8:

          goto LABEL_9;
        }
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "destination"));
        v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "navDisplayAddress"));
      }
      v20 = (void *)v17;
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "stringFormat"));
      objc_msgSend(v21, "setOverrideValue:", v20);

      goto LABEL_8;
    }
  }
LABEL_9:

}

- (void)navigationService:(id)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  CPRouteGuidance *cpRouteGuidance;
  unsigned int v8;
  void *v9;
  id v10;

  v10 = a3;
  cpRouteGuidance = self->_cpRouteGuidance;
  if (!-[CarMetadataNavigationListener _isTurnByTurn:](self, "_isTurnByTurn:", a5))
  {
    if (!cpRouteGuidance)
      goto LABEL_9;
LABEL_8:
    -[CarMetadataNavigationListener _stopRouteGuidanceUpdates](self, "_stopRouteGuidanceUpdates");
    goto LABEL_9;
  }
  v8 = objc_msgSend(v10, "navigationTransportType");
  if ((cpRouteGuidance == 0) == (v8 == 0))
  {
    if (!v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "route"));
      -[CarMetadataNavigationListener _startRouteGuidanceUpdatesWithRoute:](self, "_startRouteGuidanceUpdatesWithRoute:", v9);

      goto LABEL_9;
    }
    goto LABEL_8;
  }
  if (!v8)
    -[CarMetadataNavigationListener _updateBeingShownInApp](self, "_updateBeingShownInApp");
LABEL_9:

}

- (void)navigationService:(id)a3 didChangeNavigationState:(int)a4
{
  char v4;

  v4 = a4 - 1;
  if ((a4 - 1) <= 6 && ((0x73u >> v4) & 1) != 0)
    self->_cpGuidanceState = 0x2020501010106uLL >> (8 * v4);
}

- (void)navigationServiceDidFinishLocationUpdate:(id)a3
{
  id v4;
  CPRouteGuidance *cpRouteGuidance;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char *v11;
  void *v12;
  char *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  unsigned int v26;
  void *v27;
  double v28;
  double v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  CPRouteGuidance *v40;
  void *v41;
  void *v42;

  v4 = a3;
  cpRouteGuidance = self->_cpRouteGuidance;
  if (cpRouteGuidance)
  {
    -[CPRouteGuidance setGuidanceState:](cpRouteGuidance, "setGuidanceState:", self->_cpGuidanceState);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastLocation"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "roadName"));
    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "roadName"));
      v42 = v8;
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v42, 1));
      -[CPRouteGuidance setCurrentRoadNameVariants:](self->_cpRouteGuidance, "setCurrentRoadNameVariants:", v9);

    }
    else
    {
      -[CPRouteGuidance setCurrentRoadNameVariants:](self->_cpRouteGuidance, "setCurrentRoadNameVariants:", 0);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "route"));
    v11 = (char *)objc_msgSend(v4, "targetLegIndex");
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "legs"));
    v13 = (char *)objc_msgSend(v12, "count");

    if (v11 >= v13)
    {
      v14 = 0;
    }
    else
    {
      v14 = 0;
      do
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "legs"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectAtIndexedSubscript:", v11));

        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "destination"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "navDisplayName"));

        if (v18)
        {
          if (!v14)
            v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
          objc_msgSend(v14, "addObject:", v18);
        }

        ++v11;
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "legs"));
        v20 = (char *)objc_msgSend(v19, "count");

      }
      while (v11 < v20);
    }
    -[CPRouteGuidance setDestinationNameVariants:](self->_cpRouteGuidance, "setDestinationNameVariants:", v14);
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "displayEtaInfo"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "legInfos"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "firstObject"));

    -[CPRouteGuidance setTimeRemaining:](self->_cpRouteGuidance, "setTimeRemaining:", (double)(unint64_t)(60 * (_QWORD)objc_msgSend(v23, "remainingMinutes")));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "eta"));
    -[CPRouteGuidance setEstimatedTimeOfArrival:](self->_cpRouteGuidance, "setEstimatedTimeOfArrival:", v24);

    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "timeZone"));
    v26 = objc_msgSend(v25, "secondsFromGMT");
    -[CPRouteGuidance setDestinationTimeZoneOffsetMinutes:](self->_cpRouteGuidance, "setDestinationTimeZoneOffsetMinutes:", ((__int16)((34953 * (__int16)v26) >> 16) >> 5)+ (((v26 + ((-30583 * (__int16)v26) >> 16)) & 0x8000) >> 15));

    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "remainingDistanceInfo"));
    objc_msgSend(v27, "distanceRemainingToEndOfLeg");
    v29 = v28;

    v30 = objc_alloc((Class)NSMeasurement);
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSUnitLength meters](NSUnitLength, "meters"));
    v32 = objc_msgSend(v30, "initWithDoubleValue:unit:", v31, v29);
    -[CPRouteGuidance setDistanceRemaining:](self->_cpRouteGuidance, "setDistanceRemaining:", v32);

    v33 = (void *)objc_claimAutoreleasedReturnValue(-[CarMetadataNavigationListener _measurementForDistanceInMeters:](self, "_measurementForDistanceInMeters:", v29));
    -[CPRouteGuidance setDistanceRemainingDisplay:](self->_cpRouteGuidance, "setDistanceRemainingDisplay:", v33);

    v34 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray firstObject](self->_activeManeuverGuidanceEvents, "firstObject"));
    if (v34)
    {
      if (objc_msgSend(v4, "navigationState") == 2)
      {
        -[CPRouteGuidance setDistanceRemainingToNextManeuver:](self->_cpRouteGuidance, "setDistanceRemainingToNextManeuver:", self->_remainingDistanceToManeuver);
        -[CPRouteGuidance setDistanceRemainingToNextManeuverDisplay:](self->_cpRouteGuidance, "setDistanceRemainingToNextManeuverDisplay:", self->_displayRemainingDistanceToManeuver);
        -[NSMeasurement doubleValue](self->_remainingDistanceToManeuver, "doubleValue");
        -[CPRouteGuidance setManeuverState:](self->_cpRouteGuidance, "setManeuverState:", -[CarMetadataNavigationListener _maneuverStateForLocation:distanceToManeuver:](self, "_maneuverStateForLocation:distanceToManeuver:", v6));
      }
      else if (objc_msgSend(v4, "navigationState") == 1)
      {
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "routeMatch"));
        objc_msgSend(v35, "distanceFromRoute");
        v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSMeasurement _geo_distanceMeasurementForMeters:](NSMeasurement, "_geo_distanceMeasurementForMeters:"));

        -[CPRouteGuidance setDistanceRemainingToNextManeuver:](self->_cpRouteGuidance, "setDistanceRemainingToNextManeuver:", v36);
        v37 = GEORoundedDistanceMeasurement(v36);
        v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
        -[CPRouteGuidance setDistanceRemainingToNextManeuverDisplay:](self->_cpRouteGuidance, "setDistanceRemainingToNextManeuverDisplay:", v38);

      }
    }
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray _geo_map:](self->_activeManeuverGuidanceEvents, "_geo_map:", &stru_1011B8A30));
    -[CPRouteGuidance setCurrentManeuverIndexes:](self->_cpRouteGuidance, "setCurrentManeuverIndexes:", v39);
    v40 = self->_cpRouteGuidance;
    if (self->_activeLaneGuidanceEvent)
    {
      -[CPRouteGuidance setLaneGuidanceShowing:](v40, "setLaneGuidanceShowing:", 1);
      v41 = (void *)objc_claimAutoreleasedReturnValue(-[_CarMetadataGuidanceEventPair cpIndex](self->_activeLaneGuidanceEvent, "cpIndex"));
      -[CPRouteGuidance setCurrentLaneGuidanceIndex:](self->_cpRouteGuidance, "setCurrentLaneGuidanceIndex:", (unsigned __int16)objc_msgSend(v41, "intValue"));

    }
    else
    {
      -[CPRouteGuidance setLaneGuidanceShowing:](v40, "setLaneGuidanceShowing:", 0);
    }
    -[CPRouteGuidance setTotalManeuverCount:](self->_cpRouteGuidance, "setTotalManeuverCount:", (unsigned __int16)-[NSArray count](self->_cpManeuvers, "count"));
    -[CPRouteGuidance setTotalLaneGuidanceCount:](self->_cpRouteGuidance, "setTotalLaneGuidanceCount:", (unsigned __int16)-[NSArray count](self->_cpLaneGuidances, "count"));
    -[CarMetadataNavigationListener _updateRouteGuidance:](self, "_updateRouteGuidance:", self->_cpRouteGuidance);

  }
}

- (void)navigationService:(id)a3 updateSignsWithInfo:(id)a4
{
  NSArray *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSArray *activeManeuverGuidanceEvents;
  NSArray *v13;
  void *v14;
  NSMeasurement *v15;
  NSMeasurement *remainingDistanceToManeuver;
  void *v17;
  NSMeasurement *v18;
  NSMeasurement *displayRemainingDistanceToManeuver;
  id v20;

  v20 = a4;
  v5 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "primarySign"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uniqueID"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_guidanceEventLookup, "objectForKeyedSubscript:", v7));
    if (v8)
      -[NSArray addObject:](v5, "addObject:", v8);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "secondarySign"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "uniqueID"));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_guidanceEventLookup, "objectForKeyedSubscript:", v10));
    if (v11)
      -[NSArray addObject:](v5, "addObject:", v11);

  }
  activeManeuverGuidanceEvents = self->_activeManeuverGuidanceEvents;
  self->_activeManeuverGuidanceEvents = v5;
  v13 = v5;

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "primarySign"));
  objc_msgSend(v14, "remainingDistance");
  v15 = (NSMeasurement *)objc_claimAutoreleasedReturnValue(+[NSMeasurement _geo_distanceMeasurementForMeters:](NSMeasurement, "_geo_distanceMeasurementForMeters:"));
  remainingDistanceToManeuver = self->_remainingDistanceToManeuver;
  self->_remainingDistanceToManeuver = v15;

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "primarySign"));
  v18 = (NSMeasurement *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "displayRemainingDistance"));
  displayRemainingDistanceToManeuver = self->_displayRemainingDistanceToManeuver;
  self->_displayRemainingDistanceToManeuver = v18;

}

- (void)navigationService:(id)a3 showLaneDirections:(id)a4
{
  _CarMetadataGuidanceEventPair *v5;
  _CarMetadataGuidanceEventPair *activeLaneGuidanceEvent;
  _CarMetadataGuidanceEventPair *v7;

  v5 = (_CarMetadataGuidanceEventPair *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "uniqueID", a3));
  v7 = v5;
  if (v5)
    v5 = (_CarMetadataGuidanceEventPair *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_guidanceEventLookup, "objectForKeyedSubscript:", v5));
  activeLaneGuidanceEvent = self->_activeLaneGuidanceEvent;
  self->_activeLaneGuidanceEvent = v5;

}

- (void)navigationService:(id)a3 hideLaneDirectionsForId:(id)a4
{
  _CarMetadataGuidanceEventPair *activeLaneGuidanceEvent;

  activeLaneGuidanceEvent = self->_activeLaneGuidanceEvent;
  self->_activeLaneGuidanceEvent = 0;

}

- (void)navigationService:(id)a3 didReroute:(id)a4 rerouteReason:(unint64_t)a5
{
  -[CarMetadataNavigationListener _updateForNewRoute:](self, "_updateForNewRoute:", a4);
}

- (void)navigationService:(id)a3 didSwitchToNewTransportType:(int)a4 newRoute:(id)a5 traffic:(id)a6
{
  id v10;
  id v11;
  id v12;

  v12 = a3;
  v10 = a5;
  v11 = a6;
  if (a4)
  {
    -[CarMetadataNavigationListener _stopRouteGuidanceUpdates](self, "_stopRouteGuidanceUpdates");
  }
  else if (self->_cpRouteGuidance)
  {
    -[CarMetadataNavigationListener _updateForNewRoute:](self, "_updateForNewRoute:", v10);
  }
  else
  {
    -[CarMetadataNavigationListener _startRouteGuidanceUpdatesWithRoute:](self, "_startRouteGuidanceUpdatesWithRoute:", v10);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeLaneGuidanceEvent, 0);
  objc_storeStrong((id *)&self->_displayRemainingDistanceToManeuver, 0);
  objc_storeStrong((id *)&self->_remainingDistanceToManeuver, 0);
  objc_storeStrong((id *)&self->_activeManeuverGuidanceEvents, 0);
  objc_storeStrong((id *)&self->_guidanceEventLookup, 0);
  objc_storeStrong((id *)&self->_cpLaneGuidances, 0);
  objc_storeStrong((id *)&self->_cpManeuvers, 0);
  objc_storeStrong((id *)&self->_cpRouteGuidance, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
