@implementation ShareUserLocationActionHandler

+ (void)performAction:(id)a3 inContext:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  char isKindOfClass;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD *v15;
  void *v16;
  unsigned __int8 v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  _QWORD *v21;
  _QWORD v22[4];
  id v23;
  id v24;

  v5 = a4;
  v6 = a3;
  v7 = objc_opt_class(ShareUserLocationAction);
  isKindOfClass = objc_opt_isKindOfClass(v6, v7);

  if ((isKindOfClass & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "chrome"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "mapView"));
    if (objc_msgSend(v10, "isUserLocationVisible"))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "chrome"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "userLocationView"));

    }
    else
    {
      v12 = 0;
    }

    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100599784;
    v22[3] = &unk_1011B39F0;
    v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "appCoordinator"));
    v23 = v13;
    v14 = v12;
    v24 = v14;
    v15 = objc_retainBlock(v22);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
    v17 = objc_msgSend(v16, "isAuthorizedForPreciseLocation");

    if ((v17 & 1) != 0)
    {
      ((void (*)(_QWORD *, _QWORD))v15[2])(v15, 0);
    }
    else
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
      objc_msgSend(v18, "captureUserAction:onTarget:eventValue:", 56, 690, 0);

      v19 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_1005997D8;
      v20[3] = &unk_1011AE218;
      v21 = v15;
      objc_msgSend(v19, "requestTemporaryPreciseLocationAuthorizationWithPurposeKey:completion:", CFSTR("AppInfoTemporaryPreciseLocationAuthorizationForShareLocationPurposeKey"), v20);

    }
  }

}

@end
