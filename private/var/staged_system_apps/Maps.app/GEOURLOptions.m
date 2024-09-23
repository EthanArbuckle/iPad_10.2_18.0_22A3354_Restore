@implementation GEOURLOptions

+ (id)accumulateObjects:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));
    v5 = objc_msgSend(v4, "copy");

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "subarrayWithRange:", 1, (char *)objc_msgSend(v3, "count", 0) - 1));
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v19 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v11, "hasEnableTraffic"))
            objc_msgSend(v5, "setEnableTraffic:", objc_msgSend(v11, "enableTraffic"));
          if (objc_msgSend(v11, "hasMapType"))
            objc_msgSend(v5, "setMapType:", objc_msgSend(v11, "mapType"));
          if (objc_msgSend(v11, "hasTransportType"))
            objc_msgSend(v5, "setTransportType:", objc_msgSend(v11, "transportType"));
          if (objc_msgSend(v11, "hasReferralIdentifier"))
          {
            v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "referralIdentifier"));
            objc_msgSend(v5, "setReferralIdentifier:", v12);

          }
          if (objc_msgSend(v11, "hasRouteHandle"))
          {
            v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "routeHandle"));
            objc_msgSend(v5, "setRouteHandle:", v13);

          }
          if (objc_msgSend(v11, "hasTimePoint"))
          {
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "timePoint"));
            objc_msgSend(v5, "setTimePoint:", v14);

          }
          if (objc_msgSend(v11, "hasConnectedToCar"))
            objc_msgSend(v5, "setConnectedToCar:", objc_msgSend(v11, "connectedToCar"));
          if (objc_msgSend(v11, "hasUserTrackingMode"))
          {
            objc_msgSend(v5, "setCamera:", 0);
            objc_msgSend(v5, "setCenterSpan:", 0);
            objc_msgSend(v5, "setUserTrackingMode:", objc_msgSend(v11, "userTrackingMode"));
          }
          if (objc_msgSend(v11, "hasCenterSpan"))
          {
            objc_msgSend(v5, "setCenterSpan:", 0);
            objc_msgSend(v5, "setHasUserTrackingMode:", 0);
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "centerSpan"));
            objc_msgSend(v5, "setCenterSpan:", v15);

          }
          if (objc_msgSend(v11, "hasCamera"))
          {
            objc_msgSend(v5, "setHasUserTrackingMode:", 0);
            objc_msgSend(v5, "setCenterSpan:", 0);
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "camera"));
            objc_msgSend(v5, "setCamera:", v16);

          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v8);
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
