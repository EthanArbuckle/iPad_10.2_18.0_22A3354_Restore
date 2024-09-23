@implementation MarkUserLocationActionHandler

+ (void)performAction:(id)a3 inContext:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  char isKindOfClass;
  _QWORD *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  _QWORD *v18;
  _QWORD v19[4];
  id v20;

  v5 = a4;
  v6 = a3;
  v7 = objc_opt_class(MarkUserLocationAction);
  isKindOfClass = objc_opt_isKindOfClass(v6, v7);

  if ((isKindOfClass & 1) != 0)
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100B9AFAC;
    v19[3] = &unk_1011E7798;
    v20 = v5;
    v9 = objc_retainBlock(v19);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
    if (objc_msgSend(v10, "isAuthorizedForPreciseLocation"))
    {

    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
      v12 = objc_msgSend(v11, "isLocationServicesApproved");

      if (v12)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
        objc_msgSend(v13, "captureUserAction:onTarget:eventValue:", 56, 691, 0);

        v14 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472;
        v17[2] = sub_100B9B1E8;
        v17[3] = &unk_1011AE218;
        v18 = v9;
        objc_msgSend(v14, "requestTemporaryPreciseLocationAuthorizationWithPurposeKey:completion:", CFSTR("AppInfoTemporaryPreciseLocationAuthorizationForMarkLocationPurposeKey"), v17);

        v15 = v18;
LABEL_7:

        goto LABEL_8;
      }
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "lastLocation"));
    ((void (*)(_QWORD *, void *))v9[2])(v9, v16);

    goto LABEL_7;
  }
LABEL_8:

}

@end
