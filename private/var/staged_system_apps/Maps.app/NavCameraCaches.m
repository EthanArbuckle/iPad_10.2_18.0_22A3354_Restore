@implementation NavCameraCaches

- (NavCameraCaches)init
{
  NavCameraCaches *v2;
  GEOMapFeatureAccess *v3;
  GEOMapFeatureAccess *mapFeatureAccess;
  NavCameraCaches *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NavCameraCaches;
  v2 = -[NavCameraCaches init](&v7, "init");
  if (v2)
  {
    v3 = (GEOMapFeatureAccess *)objc_msgSend(objc_alloc((Class)GEOMapFeatureAccess), "initWithQueue:", &_dispatch_main_q);
    mapFeatureAccess = v2->_mapFeatureAccess;
    v2->_mapFeatureAccess = v3;

    -[GEOMapFeatureAccess setAllowNetworkTileLoad:](v2->_mapFeatureAccess, "setAllowNetworkTileLoad:", 1);
    v5 = v2;
  }

  return v2;
}

+ (id)cachesWithRoute:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  NavCameraCaches *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(NavCameraCaches);
  -[NavCameraCaches setCurrentRoute:](v7, "setCurrentRoute:", v6);

  -[NavCameraCaches setNavContex:](v7, "setNavContex:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavCameraCaches currentRoute](v7, "currentRoute"));
  v9 = objc_msgSend(v8, "stepsCount");

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray _navigation_newArrayWithDefaultValue:withCapacity:](NSArray, "_navigation_newArrayWithDefaultValue:withCapacity:", &off_10126E560, v9));
  -[NavCameraCaches setStepsWithCloseDistanceCache:](v7, "setStepsWithCloseDistanceCache:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray _navigation_newArrayWithDefaultValue:withCapacity:](NSArray, "_navigation_newArrayWithDefaultValue:withCapacity:", &off_10126E560, v9));
  -[NavCameraCaches setStepsWithNearDistanceCache:](v7, "setStepsWithNearDistanceCache:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray _navigation_newArrayWithDefaultValue:withCapacity:](NSArray, "_navigation_newArrayWithDefaultValue:withCapacity:", &off_10126E560, v9));
  -[NavCameraCaches setStepsWithRoundaboutCache:](v7, "setStepsWithRoundaboutCache:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray _navigation_newArrayWithDefaultValue:withCapacity:](NSArray, "_navigation_newArrayWithDefaultValue:withCapacity:", &off_10126E578, v9));
  -[NavCameraCaches setStepsWithRampCache:](v7, "setStepsWithRampCache:", v13);

  -[NavCameraCaches recalculateGroupedManeuversCaches](v7, "recalculateGroupedManeuversCaches");
  return v7;
}

- (void)recalculateGroupedManeuversCaches
{
  _QWORD v3[5];

  -[NavCameraCaches _calculateRouteGroupedManeuvers](self, "_calculateRouteGroupedManeuvers");
  -[NavCameraCaches _updateGroupedManeuverCounts](self, "_updateGroupedManeuverCounts");
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100671B40;
  v3[3] = &unk_1011AC860;
  v3[4] = self;
  -[NavCameraCaches _calculateRoadTileGroupedManeuversWithUpdateHandler:](self, "_calculateRoadTileGroupedManeuversWithUpdateHandler:", v3);
}

- (void)_updateGroupedManeuverCounts
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  NSArray *stepsWithRampCache;
  id v12;
  NSArray *stepsWithNearDistanceCache;
  char *v14;
  uint64_t v15;
  char *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavCameraCaches currentRoute](self, "currentRoute"));
  v4 = objc_msgSend(v3, "stepsCount");

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray _navigation_newArrayWithDefaultValue:withCapacity:](NSArray, "_navigation_newArrayWithDefaultValue:withCapacity:", &off_10126E560, v4));
  v6 = objc_msgSend(v5, "mutableCopy");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavCameraCaches stepsWithCloseDistanceCache](self, "stepsWithCloseDistanceCache"));
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100671DC4;
  v29[3] = &unk_1011BF628;
  v8 = v6;
  v30 = v8;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v29);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NavCameraCaches stepsWithRoundaboutCache](self, "stepsWithRoundaboutCache"));
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100671E10;
  v27[3] = &unk_1011BF628;
  v10 = v8;
  v28 = v10;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v27);

  stepsWithRampCache = self->_stepsWithRampCache;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100671E5C;
  v25[3] = &unk_1011BF628;
  v12 = v10;
  v26 = v12;
  -[NSArray enumerateObjectsUsingBlock:](stepsWithRampCache, "enumerateObjectsUsingBlock:", v25);
  stepsWithNearDistanceCache = self->_stepsWithNearDistanceCache;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100671EA8;
  v23[3] = &unk_1011BF628;
  v22 = v12;
  v24 = v22;
  -[NSArray enumerateObjectsUsingBlock:](stepsWithNearDistanceCache, "enumerateObjectsUsingBlock:", v23);
  if (objc_msgSend(v22, "count"))
  {
    v14 = (char *)objc_msgSend(v22, "count");
    if (v14)
    {
      v15 = 0;
      v16 = v14 - 1;
      do
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectAtIndexedSubscript:", v16));
        if (objc_msgSend(v17, "unsignedIntegerValue"))
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", ++v15));
        }
        else
        {
          if (v15)
            v19 = v15 + 1;
          else
            v19 = 0;
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v19));
          v15 = 0;
        }
        objc_msgSend(v22, "setObject:atIndexedSubscript:", v18, v16);

        --v16;
      }
      while (v16 != (char *)-1);
    }
  }
  -[NavCameraCaches setGroupedManeuverCounts:](self, "setGroupedManeuverCounts:", v22);
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[NavCameraCaches groupedManeuverCounts](self, "groupedManeuverCounts"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[NavCameraCaches navContex](self, "navContex"));
  objc_msgSend(v21, "setGroupedManeuverCounts:", v20);

}

- (void)_calculateRouteGroupedManeuvers
{
  void *v2;
  void *v4;
  id v5;
  double Double;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  _UNKNOWN **v17;
  void *v18;
  void *v19;
  id v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  int v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  _BOOL4 v33;
  uint64_t v34;
  _UNKNOWN **v35;
  void *v36;
  double v37;
  double v38;
  id v39;
  id v40;
  id v41;
  NavCameraCaches *v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id obj;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavCameraCaches currentRoute](self, "currentRoute"));
  v5 = objc_msgSend(v4, "stepsCount");

  Double = GEOConfigGetDouble(MapsConfig_ManeuverGroupedStepCloseDistanceThresholdInMeters, off_1014B2DB8);
  v7 = GEOConfigGetDouble(MapsConfig_ManeuverGroupedStepNearDistanceThresholdInMeters, off_1014B2DC8);
  v8 = GEOConfigGetDouble(MapsConfig_ManeuverGroupedStepRoundaboutDistanceThresholdInMeters, off_1014B2DD8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray _navigation_newArrayWithDefaultValue:withCapacity:](NSArray, "_navigation_newArrayWithDefaultValue:withCapacity:", &off_10126E560, v5));
  v45 = objc_msgSend(v9, "mutableCopy");

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray _navigation_newArrayWithDefaultValue:withCapacity:](NSArray, "_navigation_newArrayWithDefaultValue:withCapacity:", &off_10126E560, v5));
  v44 = objc_msgSend(v10, "mutableCopy");

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray _navigation_newArrayWithDefaultValue:withCapacity:](NSArray, "_navigation_newArrayWithDefaultValue:withCapacity:", &off_10126E560, v5));
  v43 = objc_msgSend(v11, "mutableCopy");

  v42 = self;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NavCameraCaches currentRoute](self, "currentRoute"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "steps"));

  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  obj = v13;
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v49;
    v17 = &off_10126E590;
    do
    {
      v18 = 0;
      v46 = v15;
      do
      {
        if (*(_QWORD *)v49 != v16)
          objc_enumerationMutation(obj);
        v19 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * (_QWORD)v18);
        v20 = objc_msgSend(v19, "stepIndex");
        objc_msgSend(v19, "distance");
        if (v21 > 0.0)
        {
          objc_msgSend(v19, "distance");
          if (v22 <= Double)
            objc_msgSend(v45, "setObject:atIndexedSubscript:", v17, v20);
        }
        objc_msgSend(v19, "distance");
        if (v23 > 0.0)
        {
          objc_msgSend(v19, "distance");
          if (v24 <= v7)
            objc_msgSend(v44, "setObject:atIndexedSubscript:", v17, v20);
        }
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "geoStep"));
        v26 = objc_msgSend(v25, "maneuverType");
        if (v26 < 41
          || (v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "geoStep")),
              (int)objc_msgSend(v2, "maneuverType") >= 60))
        {
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "geoStep"));
          if (objc_msgSend(v30, "maneuverType") == 6)
          {
            objc_msgSend(v19, "distance");
            if (v31 <= 0.0)
            {

              if (v26 > 40)
LABEL_24:

              goto LABEL_36;
            }
            objc_msgSend(v19, "distance");
            v33 = v32 <= v8;
          }
          else
          {
            v34 = v16;
            v35 = v17;
            v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "geoStep"));
            if (objc_msgSend(v36, "maneuverType") != 7)
            {

              if (v26 > 40)
              v17 = v35;
              v16 = v34;
              v15 = v46;
              goto LABEL_36;
            }
            objc_msgSend(v19, "distance");
            if (v37 <= 0.0)
            {
              v33 = 0;
            }
            else
            {
              objc_msgSend(v19, "distance");
              v33 = v38 <= v8;
            }

            v17 = v35;
            v16 = v34;
            v15 = v46;
          }

          if (v26 <= 40)
          {

            if (!v33)
              goto LABEL_36;
LABEL_35:
            objc_msgSend(v43, "setObject:atIndexedSubscript:", v17, v20);
            goto LABEL_36;
          }

          if (v33)
            goto LABEL_35;
        }
        else
        {
          objc_msgSend(v19, "distance");
          if (v27 <= 0.0)
            goto LABEL_24;
          objc_msgSend(v19, "distance");
          v29 = v28;

          if (v29 <= v8)
            goto LABEL_35;
        }
LABEL_36:
        v18 = (char *)v18 + 1;
      }
      while (v15 != v18);
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
    }
    while (v15);
  }

  v39 = objc_msgSend(v45, "copy");
  -[NavCameraCaches setStepsWithCloseDistanceCache:](v42, "setStepsWithCloseDistanceCache:", v39);

  v40 = objc_msgSend(v44, "copy");
  -[NavCameraCaches setStepsWithNearDistanceCache:](v42, "setStepsWithNearDistanceCache:", v40);

  v41 = objc_msgSend(v43, "copy");
  -[NavCameraCaches setStepsWithRoundaboutCache:](v42, "setStepsWithRoundaboutCache:", v41);

}

- (void)_calculateRoadTileGroupedManeuversWithUpdateHandler:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  double Double;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  id v17;
  void *v18;
  unint64_t v19;
  void *v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  id obj;
  _QWORD v31[5];
  id v32;
  void (**v33)(_QWORD);
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];

  v4 = (void (**)(_QWORD))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavCameraCaches currentRoute](self, "currentRoute"));
  v6 = objc_msgSend(v5, "stepsCount");

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray _navigation_newArrayWithDefaultValue:withCapacity:](NSArray, "_navigation_newArrayWithDefaultValue:withCapacity:", &off_10126E578, v6));
  v8 = objc_msgSend(v7, "mutableCopy");

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NavCameraCaches currentRoute](self, "currentRoute"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "steps"));

  Double = GEOConfigGetDouble(MapsConfig_ManeuverGroupedStepNearDistanceThresholdInMeters, off_1014B2DC8);
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = v10;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v36 != v14)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)i);
        v17 = objc_msgSend(v16, "stepIndex");
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", v17));
        v19 = (unint64_t)objc_msgSend(v18, "integerValue");

        if ((v19 & 0x8000000000000000) != 0)
        {
          objc_msgSend(v16, "distance");
          if (v21 > Double)
          {
            objc_msgSend(v8, "setObject:atIndexedSubscript:", &off_10126E560, v17);
            v4[2](v4);
          }
          v22 = (void *)objc_claimAutoreleasedReturnValue(-[NavCameraCaches currentRoute](self, "currentRoute"));
          objc_msgSend(v22, "pointAtRouteCoordinate:", objc_msgSend(v16, "endRouteCoordinate"));
          v24 = v23;
          v26 = v25;

          v27 = (void *)objc_claimAutoreleasedReturnValue(-[NavCameraCaches currentRoute](self, "currentRoute"));
          objc_msgSend(v27, "courseAtRouteCoordinateIndex:", objc_msgSend(v16, "endRouteCoordinate"));
          v29 = v28;

          v31[0] = _NSConcreteStackBlock;
          v31[1] = 3221225472;
          v31[2] = sub_100672648;
          v31[3] = &unk_1011BF650;
          v31[4] = self;
          v34 = v17;
          v32 = v8;
          v33 = v4;
          -[NavCameraCaches _roadForCoordinate:course:handler:](self, "_roadForCoordinate:course:handler:", v31, v24, v26, v29);

        }
        else
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_stepsWithRampCache, "objectAtIndexedSubscript:", v17));
          objc_msgSend(v8, "setObject:atIndexedSubscript:", v20, v17);

        }
      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v13);
  }

}

- (void)_roadForCoordinate:(id)a3 course:(double)a4 handler:(id)a5
{
  double var1;
  double var0;
  id v9;
  GEOMapFeatureAccess *mapFeatureAccess;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD *v15;
  double v16;
  double v17;
  double v18;
  _QWORD v19[4];

  var1 = a3.var1;
  var0 = a3.var0;
  v9 = a5;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  v19[3] = 0x4039000000000000;
  mapFeatureAccess = self->_mapFeatureAccess;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1006727E0;
  v13[3] = &unk_1011BF678;
  v16 = var0;
  v17 = var1;
  v18 = a4;
  v15 = v19;
  v11 = v9;
  v14 = v11;
  v12 = -[GEOMapFeatureAccess findRoadsNear:radius:handler:completionHandler:](mapFeatureAccess, "findRoadsNear:radius:handler:completionHandler:", v13, 0, var0, var1, 50.0);

  _Block_object_dispose(v19, 8);
}

- (NSArray)stepsWithRampCache
{
  return self->_stepsWithRampCache;
}

- (void)setStepsWithRampCache:(id)a3
{
  objc_storeStrong((id *)&self->_stepsWithRampCache, a3);
}

- (NSArray)stepsWithCloseDistanceCache
{
  return self->_stepsWithCloseDistanceCache;
}

- (void)setStepsWithCloseDistanceCache:(id)a3
{
  objc_storeStrong((id *)&self->_stepsWithCloseDistanceCache, a3);
}

- (NSArray)stepsWithNearDistanceCache
{
  return self->_stepsWithNearDistanceCache;
}

- (void)setStepsWithNearDistanceCache:(id)a3
{
  objc_storeStrong((id *)&self->_stepsWithNearDistanceCache, a3);
}

- (NSArray)stepsWithRoundaboutCache
{
  return self->_stepsWithRoundaboutCache;
}

- (void)setStepsWithRoundaboutCache:(id)a3
{
  objc_storeStrong((id *)&self->_stepsWithRoundaboutCache, a3);
}

- (NSArray)groupedManeuverCounts
{
  return self->_groupedManeuverCounts;
}

- (void)setGroupedManeuverCounts:(id)a3
{
  objc_storeStrong((id *)&self->_groupedManeuverCounts, a3);
}

- (GEOComposedRoute)currentRoute
{
  return self->_currentRoute;
}

- (void)setCurrentRoute:(id)a3
{
  objc_storeStrong((id *)&self->_currentRoute, a3);
}

- (GEOMapFeatureAccess)mapFeatureAccess
{
  return self->_mapFeatureAccess;
}

- (void)setMapFeatureAccess:(id)a3
{
  objc_storeStrong((id *)&self->_mapFeatureAccess, a3);
}

- (VKNavContext)navContex
{
  return self->_navContex;
}

- (void)setNavContex:(id)a3
{
  objc_storeStrong((id *)&self->_navContex, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navContex, 0);
  objc_storeStrong((id *)&self->_mapFeatureAccess, 0);
  objc_storeStrong((id *)&self->_currentRoute, 0);
  objc_storeStrong((id *)&self->_groupedManeuverCounts, 0);
  objc_storeStrong((id *)&self->_stepsWithRoundaboutCache, 0);
  objc_storeStrong((id *)&self->_stepsWithNearDistanceCache, 0);
  objc_storeStrong((id *)&self->_stepsWithCloseDistanceCache, 0);
  objc_storeStrong((id *)&self->_stepsWithRampCache, 0);
}

@end
