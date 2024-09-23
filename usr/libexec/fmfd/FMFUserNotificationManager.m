@implementation FMFUserNotificationManager

+ (id)sharedInstance
{
  if (qword_1000B3698 != -1)
    dispatch_once(&qword_1000B3698, &stru_1000993A0);
  return (id)qword_1000B3690;
}

- (FMFUserNotificationManager)init
{
  FMFUserNotificationManager *v2;
  UNUserNotificationCenter *v3;
  UNUserNotificationCenter *userNotificationCenter;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FMFUserNotificationManager;
  v2 = -[FMFUserNotificationManager init](&v6, "init");
  if (v2)
  {
    v3 = (UNUserNotificationCenter *)objc_msgSend(objc_alloc((Class)UNUserNotificationCenter), "initWithBundleIdentifier:", CFSTR("com.apple.findmy"));
    userNotificationCenter = v2->_userNotificationCenter;
    v2->_userNotificationCenter = v3;

    -[UNUserNotificationCenter setDelegate:](v2->_userNotificationCenter, "setDelegate:", v2);
  }
  return v2;
}

- (void)postReceiveTriggerWithUUID:(id)a3 forFenceWithID:(id)a4 friendID:(id)a5 withText:(id)a6 forDate:(id)a7 triggerLocation:(id)a8 fenceLocation:(id)a9 completion:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v38;
  id v39;

  v36 = a10;
  v16 = a9;
  v17 = a8;
  v18 = a7;
  v19 = a6;
  v20 = a5;
  v21 = a4;
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "UUIDString"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@"), CFSTR("GEOFENCE_RECEIVE"), v22));

  v24 = objc_alloc_init((Class)UNMutableNotificationContent);
  objc_msgSend(v24, "setBody:", v19);

  objc_msgSend(v24, "setTitle:", &stru_10009B948);
  objc_msgSend(v24, "setCategoryIdentifier:", CFSTR("GEOFENCE_RECEIVE"));
  objc_msgSend(v24, "setDate:", v18);

  objc_msgSend(v24, "setThreadIdentifier:", v21);
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationSound defaultSound](UNNotificationSound, "defaultSound"));
  objc_msgSend(v24, "setSound:", v25);

  objc_msgSend(v24, "setInterruptionLevel:", 2);
  v39 = 0;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v17, 1, &v39));

  v27 = v39;
  v38 = v27;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v16, 1, &v38));

  v29 = v38;
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[FMFDataManager sharedInstance](FMFDataManager, "sharedInstance"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "followingHandleForServerId:", v20));

  v32 = objc_alloc_init((Class)NSMutableDictionary);
  objc_msgSend(v32, "fm_safeSetObject:forKey:", v21, CFSTR("locationAlertId"));

  objc_msgSend(v32, "fm_safeSetObject:forKey:", v20, CFSTR("friendServerId"));
  objc_msgSend(v32, "fm_safeSetObject:forKey:", v26, CFSTR("fenceTriggerLocation"));
  objc_msgSend(v32, "fm_safeSetObject:forKey:", v28, CFSTR("fenceLocation"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "identifier"));
  objc_msgSend(v32, "fm_safeSetObject:forKey:", v33, CFSTR("friendHandle"));

  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
  objc_msgSend(v32, "fm_safeSetObject:forKey:", v34, CFSTR("ShouldForwardToCompanionUserInfoKey"));

  objc_msgSend(v24, "setUserInfo:", v32);
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationRequest requestWithIdentifier:content:trigger:](UNNotificationRequest, "requestWithIdentifier:content:trigger:", v23, v24, 0));
  objc_msgSend(v35, "setDestinations:", 7);
  -[UNUserNotificationCenter addNotificationRequest:withCompletionHandler:](self->_userNotificationCenter, "addNotificationRequest:withCompletionHandler:", v35, v36);

}

- (void)postTriggerWithUUID:(id)a3 forFenceWithID:(id)a4 followerID:(id)a5 withText:(id)a6 forDate:(id)a7 triggerLocation:(id)a8 fenceLocation:(id)a9 completion:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v38;
  id v39;

  v36 = a10;
  v16 = a9;
  v17 = a8;
  v18 = a7;
  v19 = a6;
  v20 = a5;
  v21 = a4;
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "UUIDString"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@"), CFSTR("GEOFENCE_TRIGGER"), v22));

  v24 = objc_alloc_init((Class)UNMutableNotificationContent);
  objc_msgSend(v24, "setBody:", v19);

  objc_msgSend(v24, "setTitle:", &stru_10009B948);
  objc_msgSend(v24, "setCategoryIdentifier:", CFSTR("GEOFENCE_TRIGGER"));
  objc_msgSend(v24, "setDate:", v18);

  objc_msgSend(v24, "setThreadIdentifier:", v21);
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationSound defaultSound](UNNotificationSound, "defaultSound"));
  objc_msgSend(v24, "setSound:", v25);

  objc_msgSend(v24, "setInterruptionLevel:", 2);
  v39 = 0;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v17, 1, &v39));

  v27 = v39;
  v38 = v27;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v16, 1, &v38));

  v29 = v38;
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[FMFDataManager sharedInstance](FMFDataManager, "sharedInstance"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "followerHandleForServerId:", v20));

  v32 = objc_alloc_init((Class)NSMutableDictionary);
  objc_msgSend(v32, "fm_safeSetObject:forKey:", v21, CFSTR("locationAlertId"));

  objc_msgSend(v32, "fm_safeSetObject:forKey:", v20, CFSTR("friendServerId"));
  objc_msgSend(v32, "fm_safeSetObject:forKey:", v26, CFSTR("fenceTriggerLocation"));
  objc_msgSend(v32, "fm_safeSetObject:forKey:", v28, CFSTR("fenceLocation"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "identifier"));
  objc_msgSend(v32, "fm_safeSetObject:forKey:", v33, CFSTR("friendHandle"));

  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
  objc_msgSend(v32, "fm_safeSetObject:forKey:", v34, CFSTR("ShouldForwardToCompanionUserInfoKey"));

  objc_msgSend(v24, "setUserInfo:", v32);
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationRequest requestWithIdentifier:content:trigger:](UNNotificationRequest, "requestWithIdentifier:content:trigger:", v23, v24, 0));
  objc_msgSend(v35, "setDestinations:", 7);
  -[UNUserNotificationCenter addNotificationRequest:withCompletionHandler:](self->_userNotificationCenter, "addNotificationRequest:withCompletionHandler:", v35, v36);

}

- (void)postConfirmationWithUUID:(id)a3 forFenceWithID:(id)a4 withText:(id)a5 forDate:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[2];
  _QWORD v24[2];

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "UUIDString"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@"), CFSTR("GEOFENCE_CONFIRMATION"), v16));

  v18 = objc_alloc_init((Class)UNMutableNotificationContent);
  objc_msgSend(v18, "setBody:", v14);

  objc_msgSend(v18, "setTitle:", &stru_10009B948);
  objc_msgSend(v18, "setCategoryIdentifier:", CFSTR("GEOFENCE_CONFIRMATION"));
  objc_msgSend(v18, "setDate:", v13);

  objc_msgSend(v18, "setThreadIdentifier:", v15);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationSound defaultSound](UNNotificationSound, "defaultSound"));
  objc_msgSend(v18, "setSound:", v19);

  v23[0] = CFSTR("locationAlertId");
  v23[1] = CFSTR("ShouldForwardToCompanionUserInfoKey");
  v24[0] = v15;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
  v24[1] = v20;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v24, v23, 2));
  objc_msgSend(v18, "setUserInfo:", v21);

  objc_msgSend(v18, "setInterruptionLevel:", 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationRequest requestWithIdentifier:content:trigger:](UNNotificationRequest, "requestWithIdentifier:content:trigger:", v17, v18, 0));
  objc_msgSend(v22, "setDestinations:", 7);
  -[UNUserNotificationCenter addNotificationRequest:withCompletionHandler:](self->_userNotificationCenter, "addNotificationRequest:withCompletionHandler:", v22, v12);

}

- (void)postNotification:(id)a3 andCategory:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  uint8_t buf[4];
  void *v15;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "UUIDString"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@"), v6, v9));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationRequest requestWithIdentifier:content:trigger:](UNNotificationRequest, "requestWithIdentifier:content:trigger:", v10, v7, 0));
  v12 = sub_100011D0C();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v15 = v11;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "FMFUserNotificationManager: handleAPSPushNotification message dictionary %@", buf, 0xCu);
  }

  objc_msgSend(v11, "setDestinations:", 7);
  -[UNUserNotificationCenter addNotificationRequest:withCompletionHandler:](self->_userNotificationCenter, "addNotificationRequest:withCompletionHandler:", v11, 0);

}

- (UNUserNotificationCenter)userNotificationCenter
{
  return self->_userNotificationCenter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userNotificationCenter, 0);
}

@end
