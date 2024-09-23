@implementation CARUserAlerts

- (CARUserAlerts)initWithNotificationCenter:(id)a3
{
  id v5;
  CARUserAlerts *v6;
  CARUserAlerts *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSMutableArray *presentedBulletins;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v20;
  _QWORD v21[4];

  v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CARUserAlerts;
  v6 = -[CARUserAlerts init](&v20, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_notificationCenter, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CARUserAlerts notificationCenter](v7, "notificationCenter"));
    objc_msgSend(v8, "setDelegate:", v7);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CARUserAlerts notificationCenter](v7, "notificationCenter"));
    objc_msgSend(v9, "setWantsNotificationResponsesDelivered");

    v10 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    presentedBulletins = v7->_presentedBulletins;
    v7->_presentedBulletins = (NSMutableArray *)v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    if (CRIsInternalInstall())
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[CRBulletin notificationCategory](CRDNDEndAlert, "notificationCategory"));
      v21[0] = v13;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[CRBulletin notificationCategory](CRDNDEnteredGeofenceAlert, "notificationCategory"));
      v21[1] = v14;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[CRBulletin notificationCategory](CRDNDExitedGeofenceAlert, "notificationCategory"));
      v21[2] = v15;
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[CRBulletin notificationCategory](CRDNDNotDrivingAlert, "notificationCategory"));
      v21[3] = v16;
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v21, 4));
      objc_msgSend(v12, "addObjectsFromArray:", v17);

    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CARUserAlerts notificationCenter](v7, "notificationCenter"));
    objc_msgSend(v18, "setNotificationCategories:", v12);

  }
  return v7;
}

- (CARUserAlerts)init
{
  id v3;
  CARUserAlerts *v4;

  v3 = objc_msgSend(objc_alloc((Class)UNUserNotificationCenter), "initWithBundleIdentifier:", CFSTR("com.apple.CarKit.notifications"));
  v4 = -[CARUserAlerts initWithNotificationCenter:](self, "initWithNotificationCenter:", v3);

  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[UNUserNotificationCenter removeAllDeliveredNotifications](self->_notificationCenter, "removeAllDeliveredNotifications");
  v3.receiver = self;
  v3.super_class = (Class)CARUserAlerts;
  -[CARUserAlerts dealloc](&v3, "dealloc");
}

- (void)_showBulletin:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CARUserAlerts presentedBulletins](self, "presentedBulletins"));
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CARUserAlerts presentedBulletins](self, "presentedBulletins"));
  objc_msgSend(v6, "addObject:", v4);

  objc_sync_exit(v5);
  v7 = CarDNDWDLogging();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "title"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "recordID"));
    *(_DWORD *)buf = 138412802;
    v17 = v4;
    v18 = 2114;
    v19 = v9;
    v20 = 2112;
    v21 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Requesting bulletin %@ %{public}@ %@", buf, 0x20u);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CARUserAlerts notificationCenter](self, "notificationCenter"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "notificationRequest"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10000477C;
  v14[3] = &unk_1000B5080;
  v15 = v4;
  v13 = v4;
  objc_msgSend(v11, "addNotificationRequest:withCompletionHandler:", v12, v14);

}

- (void)dismissAlert:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  void *v21;

  v4 = a3;
  v5 = CarDNDWDLogging();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "recordID"));
    *(_DWORD *)buf = 138412546;
    v19 = v4;
    v20 = 2112;
    v21 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Dismissing banner %@ %@", buf, 0x16u);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CARUserAlerts notificationCenter](self, "notificationCenter"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "recordID"));
  v17 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v17, 1));
  objc_msgSend(v8, "removeDeliveredNotificationsWithIdentifiers:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CARUserAlerts notificationCenter](self, "notificationCenter"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "recordID"));
  v16 = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v16, 1));
  objc_msgSend(v11, "removePendingNotificationRequestsWithIdentifiers:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CARUserAlerts presentedBulletins](self, "presentedBulletins"));
  objc_sync_enter(v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CARUserAlerts presentedBulletins](self, "presentedBulletins"));
  objc_msgSend(v15, "removeObject:", v4);

  objc_sync_exit(v14);
}

- (void)dismissAlertsOfClass:(Class)a3
{
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[6];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CARUserAlerts presentedBulletins](self, "presentedBulletins"));
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CARUserAlerts presentedBulletins](self, "presentedBulletins"));
  v7 = objc_msgSend(v6, "copy");

  objc_sync_exit(v5);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100004A98;
  v8[3] = &unk_1000B50A8;
  v8[4] = self;
  v8[5] = a3;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v8);

}

- (void)postBannerWithTitle:(id)a3 message:(id)a4 destinations:(unint64_t)a5
{
  id v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  CRBulletin *v12;
  int v13;
  id v14;
  __int16 v15;
  id v16;

  v8 = a3;
  v9 = a4;
  v10 = CarGeneralLogging(v9);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412546;
    v14 = v8;
    v15 = 2112;
    v16 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Internal: Presenting banner with title: %@, message: %@", (uint8_t *)&v13, 0x16u);
  }

  v12 = -[CRBulletin initWithTitle:message:destinations:]([CRBulletin alloc], "initWithTitle:message:destinations:", v8, v9, a5);
  -[CARUserAlerts _showBulletin:](self, "_showBulletin:", v12);

}

- (void)showDNDEnterGeofenceWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  uint8_t v8[16];

  v4 = a3;
  v5 = CarDNDWDLogging();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Internal: Presenting enter geofence notification", v8, 2u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CRDNDGeofenceAlert alertForEnteringGeofence:](CRDNDGeofenceAlert, "alertForEnteringGeofence:", 1));
  objc_msgSend(v7, "setActionHandler:", v4);

  -[CARUserAlerts _showBulletin:](self, "_showBulletin:", v7);
}

- (void)showDNDExitGeofenceWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  uint8_t v8[16];

  v4 = a3;
  v5 = CarDNDWDLogging();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Internal: Presenting exit geofence notification", v8, 2u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CRDNDGeofenceAlert alertForEnteringGeofence:](CRDNDGeofenceAlert, "alertForEnteringGeofence:", 0));
  objc_msgSend(v7, "setActionHandler:", v4);

  -[CARUserAlerts _showBulletin:](self, "_showBulletin:", v7);
}

- (void)showDNDEndNotificationWithText:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  CRDNDEndAlert *v10;
  uint8_t v11[16];

  v6 = a4;
  v7 = a3;
  v8 = CarDNDWDLogging();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Internal: Presenting Driving end notification", v11, 2u);
  }

  -[CARUserAlerts dismissAlertsOfClass:](self, "dismissAlertsOfClass:", objc_opt_class(CRDNDEndAlert));
  v10 = -[CRDNDEndAlert initWithText:]([CRDNDEndAlert alloc], "initWithText:", v7);

  -[CRBulletin setActionHandler:](v10, "setActionHandler:", v6);
  -[CARUserAlerts _showBulletin:](self, "_showBulletin:", v10);

}

- (void)showDNDNotDrivingAlertWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  CRDNDNotDrivingAlert *v7;
  uint8_t v8[16];

  v4 = a3;
  v5 = CarDNDWDLogging();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Internal: Presenting Not Driving Feedback Alert", v8, 2u);
  }

  -[CARUserAlerts dismissAlertsOfClass:](self, "dismissAlertsOfClass:", objc_opt_class(CRDNDNotDrivingAlert));
  v7 = objc_alloc_init(CRDNDNotDrivingAlert);
  -[CRBulletin setActionHandler:](v7, "setActionHandler:", v4);

  -[CARUserAlerts _showBulletin:](self, "_showBulletin:", v7);
}

- (void)userNotificationCenter:(id)a3 openSettingsForNotification:(id)a4
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;

  v4 = a4;
  v5 = CarDNDWDLogging();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "request"));
    v8 = 138412290;
    v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "User opened settings for %@", (uint8_t *)&v8, 0xCu);

  }
}

- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5
{
  id v6;
  void (**v7)(id, _QWORD);
  uint64_t v8;
  NSObject *v9;
  int v10;
  id v11;

  v6 = a4;
  v7 = (void (**)(id, _QWORD))a5;
  v8 = CarDNDWDLogging();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Will present notification %@", (uint8_t *)&v10, 0xCu);
  }

  v7[2](v7, 0);
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(_QWORD);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
  unsigned int v47;
  uint64_t v48;
  _BOOL4 v49;
  void *v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  NSObject *v57;
  _QWORD v58[4];
  id v59;
  _QWORD v60[4];
  id v61;
  uint8_t buf[4];
  void *v63;
  __int16 v64;
  void *v65;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(_QWORD))a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "actionIdentifier"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "notification"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "request"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifier"));

  v15 = ((uint64_t (*)(void))CarDNDWDLogging)();
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v63 = v14;
    v64 = 2114;
    v65 = v11;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Notification %@ response %{public}@", buf, 0x16u);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CARUserAlerts presentedBulletins](self, "presentedBulletins"));
  objc_sync_enter(v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CARUserAlerts presentedBulletins](self, "presentedBulletins"));
  v60[0] = _NSConcreteStackBlock;
  v60[1] = 3221225472;
  v60[2] = sub_100005560;
  v60[3] = &unk_1000B50D0;
  v19 = v14;
  v61 = v19;
  v20 = objc_msgSend(v18, "indexOfObjectPassingTest:", v60);

  objc_sync_exit(v17);
  if (v20 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[CARUserAlerts presentedBulletins](self, "presentedBulletins"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectAtIndexedSubscript:", v20));

    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "actionHandler"));
    LODWORD(v27) = v29 == 0;

    if ((_DWORD)v27)
    {
      v45 = ((uint64_t (*)(void))CarDNDWDLogging)();
      v46 = objc_claimAutoreleasedReturnValue(v45);
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "Bulletin has no action handler. Assuming this is a custom action.", buf, 2u);
      }

      v10[2](v10);
      goto LABEL_20;
    }
    v30 = objc_msgSend(v11, "isEqualToString:", UNNotificationDismissActionIdentifier);
    if ((_DWORD)v30)
    {
      v34 = CarDNDWDLogging(v30, v31, v32, v33);
      v35 = objc_claimAutoreleasedReturnValue(v34);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "User dismissed bulletin.", buf, 2u);
      }

      v40 = 1;
    }
    else
    {
      v47 = objc_msgSend(v11, "isEqualToString:", UNNotificationDefaultActionIdentifier);
      v48 = ((uint64_t (*)(void))CarDNDWDLogging)();
      v44 = objc_claimAutoreleasedReturnValue(v48);
      v49 = os_log_type_enabled((os_log_t)v44, OS_LOG_TYPE_DEFAULT);
      if (v47)
      {
        if (v49)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)v44, OS_LOG_TYPE_DEFAULT, "User selected default bulletin action.", buf, 2u);
        }
        goto LABEL_15;
      }
      if (v49)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v44, OS_LOG_TYPE_DEFAULT, "User selected custom action.", buf, 2u);
      }

      v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "actions"));
      v58[0] = _NSConcreteStackBlock;
      v58[1] = 3221225472;
      v58[2] = sub_1000055A0;
      v58[3] = &unk_1000B50F8;
      v51 = v11;
      v59 = v51;
      v40 = (uint64_t)objc_msgSend(v50, "indexOfObjectPassingTest:", v58);

      if (v40 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v56 = CarDNDWDLogging(v52, v53, v54, v55);
        v57 = objc_claimAutoreleasedReturnValue(v56);
        if (os_log_type_enabled(v57, OS_LOG_TYPE_FAULT))
          sub_100068544((uint64_t)v51, (uint64_t)v28, v57);

        v10[2](v10);
        goto LABEL_20;
      }

      if (v40 == 5)
      {
LABEL_16:
        v10[2](v10);
LABEL_20:

        goto LABEL_21;
      }
    }
    v41 = CarDNDWDLogging(v36, v37, v38, v39);
    v42 = objc_claimAutoreleasedReturnValue(v41);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v40));
      *(_DWORD *)buf = 138412290;
      v63 = v43;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "Sending additional action at index %@", buf, 0xCu);

    }
    v44 = objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "actionHandler"));
    (*(void (**)(uint64_t, uint64_t))(v44 + 16))(v44, v40);
LABEL_15:

    goto LABEL_16;
  }
  v25 = CarDNDWDLogging(v21, v22, v23, v24);
  v26 = objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
    sub_1000684D4((uint64_t)v19, v26);

  v10[2](v10);
LABEL_21:

}

- (id)_alertsOfClass:(Class)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CARUserAlerts presentedBulletins](self, "presentedBulletins"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000056A8;
  v10[3] = &unk_1000B5118;
  v10[4] = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "indexesOfObjectsPassingTest:", v10));

  if (objc_msgSend(v6, "count"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CARUserAlerts presentedBulletins](self, "presentedBulletins"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectsAtIndexes:", v6));

  }
  else
  {
    v8 = &__NSArray0__struct;
  }

  return v8;
}

- (void)_injectAlert:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CARUserAlerts presentedBulletins](self, "presentedBulletins"));
  objc_msgSend(v5, "addObject:", v4);

}

- (UNUserNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (NSMutableArray)presentedBulletins
{
  return self->_presentedBulletins;
}

- (void)setPresentedBulletins:(id)a3
{
  objc_storeStrong((id *)&self->_presentedBulletins, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentedBulletins, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
}

@end
