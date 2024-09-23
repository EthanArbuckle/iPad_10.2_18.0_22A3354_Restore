@implementation MNTraceRecordingData

+ (id)traceRecordingDataFromCompanionRouteDetails:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "hasRequest") && objc_msgSend(v5, "hasResponse"))
  {
    v6 = objc_alloc_init((Class)a1);
    v7 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "composedOrigin"));
    if (v8)
      objc_msgSend(v7, "addObject:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "composedDestination"));
    if (v9)
      objc_msgSend(v7, "addObject:", v9);
    v10 = objc_msgSend(v7, "copy");
    objc_msgSend(v6, "setWaypoints:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "request"));
    objc_msgSend(v6, "setInitialDirectionsRequest:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "response"));
    objc_msgSend(v6, "setInitialDirectionsResponse:", v12);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end
