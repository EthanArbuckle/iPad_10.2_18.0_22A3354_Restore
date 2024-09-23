@implementation RouteTrafficFeaturesUpdater

- (void)updateTrafficFeatures:(id)a3 onRoute:(id)a4 forLocation:(id)a5
{
  id v8;
  id v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  id v14;

  v14 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v9, "speed");
  if (v10 >= 0.0 && (objc_msgSend(v9, "locationUnreliable") & 1) == 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "routeMatch"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[RouteTrafficFeaturesUpdater _nearestTrafficCameraInFeatures:onRoute:ofType:fromCoordinate:](self, "_nearestTrafficCameraInFeatures:onRoute:ofType:fromCoordinate:", v14, v8, 1, objc_msgSend(v11, "routeCoordinate")));

    objc_msgSend(v9, "speed");
    objc_msgSend(v12, "setIsAboveSpeedThreshold:", v13 > (double)objc_msgSend(v12, "speedThreshold"));

  }
}

- (id)_nearestTrafficCameraInFeatures:(id)a3 onRoute:(id)a4 ofType:(int64_t)a5 fromCoordinate:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  double v15;
  void *i;
  void *v17;
  id v18;
  double v19;
  double v20;
  id v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v9 = a3;
  v10 = a4;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v11)
  {
    v12 = v11;
    v13 = 0;
    v14 = *(_QWORD *)v24;
    v15 = 3.40282347e38;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v14)
          objc_enumerationMutation(v9);
        v17 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v17, "isCamera"))
        {
          v18 = v17;
          if (objc_msgSend(v18, "type") == (id)a5
            && (objc_msgSend(v18, "navigationState") == (id)2 || objc_msgSend(v18, "navigationState") == (id)1)
            && ((objc_msgSend(v10, "distanceFromPoint:toPoint:", a6, objc_msgSend(v18, "routeOffset")), v19 >= 0.0)
              ? (v20 = v19)
              : (v20 = -v19),
                v20 < v15))
          {
            v21 = v18;

            v13 = v21;
          }
          else
          {
            v20 = v15;
          }

          v15 = v20;
        }
      }
      v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v12);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

@end
