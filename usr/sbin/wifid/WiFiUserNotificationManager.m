@implementation WiFiUserNotificationManager

- (WiFiUserNotificationManager)initWithQueue:(id)a3 supportsWAPI:(BOOL)a4
{
  WiFiUserNotificationManager *v6;
  WiFiUserNotificationManager *v7;
  UNUserNotificationCenter *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)WiFiUserNotificationManager;
  v6 = -[WiFiUserNotificationManager init](&v10, "init");
  v7 = v6;
  if (v6)
  {
    v6->_queue = (OS_dispatch_queue *)a3;
    v6->_supportsWAPI = a4;
    v8 = (UNUserNotificationCenter *)objc_msgSend(objc_alloc((Class)UNUserNotificationCenter), "initWithBundleIdentifier:", CFSTR("com.apple.wifid.usernotification"));
    v7->_userNotificationCenterWiFi = v8;
    -[UNUserNotificationCenter setDelegate:](v8, "setDelegate:", v7);
    -[UNUserNotificationCenter requestAuthorizationWithOptions:completionHandler:](v7->_userNotificationCenterWiFi, "requestAuthorizationWithOptions:completionHandler:", 3, &stru_100232E98);
    -[UNUserNotificationCenter removeAllDeliveredNotifications](v7->_userNotificationCenterWiFi, "removeAllDeliveredNotifications");
    v7->_notificationMapping = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v7->_recentNotifications = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v7->_timeoutPeriod = 30;
    v7->_shouldTimeOutRecommendation = 1;
    v7->_deviceClass = MGGetSInt32Answer(CFSTR("DeviceClassNumber"), 0);
    v7->_notificationHistory = objc_alloc_init(WiFiUserNotificationHistory);
  }
  return v7;
}

- (void)dealloc
{
  id callback;
  NSObject *timeoutTimer;
  objc_super v5;

  callback = self->_callback;
  if (callback)
    _Block_release(callback);

  timeoutTimer = self->_timeoutTimer;
  if (timeoutTimer)
    dispatch_source_cancel(timeoutTimer);

  self->_queue = 0;
  v5.receiver = self;
  v5.super_class = (Class)WiFiUserNotificationManager;
  -[WiFiUserNotificationManager dealloc](&v5, "dealloc");
}

- (void)startListening
{
  void *v2;

  -[UNUserNotificationCenter setWantsNotificationResponsesDelivered](self->_userNotificationCenterWiFi, "setWantsNotificationResponsesDelivered");
  v2 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: listening for user notifications", "-[WiFiUserNotificationManager startListening]");
  objc_autoreleasePoolPop(v2);
}

+ (BOOL)canRepromptForNotificationType:(int)a3 blacklistType:(int)a4 atDate:(id)a5 count:(unint64_t)a6
{
  uint64_t v7;
  double v8;

  v7 = *(_QWORD *)&a4;
  objc_msgSend(a5, "timeIntervalSinceNow", *(_QWORD *)&a3);
  return -v8 > (double)+[WiFiUserNotificationManager defaultThrottlingPeriodForBlacklistingType:count:](WiFiUserNotificationManager, "defaultThrottlingPeriodForBlacklistingType:count:", v7, a6);
}

+ (unint64_t)defaultThrottlingPeriodForBlacklistingType:(int)a3 count:(unint64_t)a4
{
  unint64_t v4;
  uint64_t v5;

  v4 = 86400;
  v5 = 604800;
  if (a4 != 2)
    v5 = 2592000;
  if (a4 >= 2)
    v4 = v5;
  if (a3 == 1)
    return 2592000;
  else
    return v4;
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  void *v8;
  id v9;
  id v10;
  double v11;
  double v12;
  id v13;
  id v14;
  void *v15;
  double v16;
  unsigned int v17;
  int v18;
  int v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  id v28;
  id v29;
  NSObject *queue;
  id v31;
  id v32;
  void *v33;
  id v34;
  unsigned int v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  uint64_t v46;
  id v47;
  id v48;
  _QWORD block[6];
  int v50;
  int v51;

  if (self->_timeoutTimer)
  {
    v8 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: canceling timer", "-[WiFiUserNotificationManager userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:]");
    objc_autoreleasePoolPop(v8);
    dispatch_source_cancel((dispatch_source_t)self->_timeoutTimer);
  }
  v45 = objc_msgSend(objc_msgSend(objc_msgSend(a4, "notification", a3), "request"), "identifier");
  v9 = -[NSMutableDictionary objectForKey:](-[WiFiUserNotificationManager notificationMapping](self, "notificationMapping"), "objectForKey:", v45);
  v10 = objc_msgSend(v9, "objectForKey:", CFSTR("SSID"));
  objc_msgSend(-[NSMutableDictionary objectForKey:](-[WiFiUserNotificationManager recentNotifications](self, "recentNotifications"), "objectForKey:", v10), "timeIntervalSinceNow");
  v12 = v11;
  v13 = objc_msgSend(a4, "actionIdentifier");
  v14 = objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(a4, "notification"), "request"), "content"), "categoryIdentifier");
  v15 = objc_autoreleasePoolPush();
  v48 = v10;
  if (!v10)
  {
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "%s: ssid not found for notification (%@)", "-[WiFiUserNotificationManager userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:]", v45);
    objc_autoreleasePoolPop(v15);
    v26 = 0;
    v25 = 0;
    v22 = 0;
    goto LABEL_25;
  }
  v16 = -v12;
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: Handle action %@ for notification %@ (SSID: %@, category: %@) visibleDuration %f", "-[WiFiUserNotificationManager userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:]", v13, v45, v10, v14, *(_QWORD *)&v16);
  objc_autoreleasePoolPop(v15);
  v17 = objc_msgSend(v14, "isEqualToString:", CFSTR("joinalert"));
  v47 = a5;
  if ((v17 & 1) != 0)
  {
    v18 = 0;
    v19 = 0;
    v20 = 2;
LABEL_16:
    v46 = v20;
    goto LABEL_17;
  }
  if ((objc_msgSend(v14, "isEqualToString:", CFSTR("recommendation")) & 1) != 0)
  {
    v19 = 0;
    v18 = 1;
    v20 = 1;
    goto LABEL_16;
  }
  if ((objc_msgSend(v14, "isEqualToString:", CFSTR("lowdatamodealert")) & 1) != 0)
  {
    v18 = 0;
    v19 = 0;
    v20 = 3;
    goto LABEL_16;
  }
  if ((objc_msgSend(v14, "isEqualToString:", CFSTR("randommac")) & 1) != 0)
  {
    v18 = 0;
    v19 = 0;
    v20 = 4;
    goto LABEL_16;
  }
  if ((objc_msgSend(v14, "isEqualToString:", CFSTR("colocatedssid")) & 1) != 0)
  {
    v18 = 0;
    v46 = 5;
    v19 = 1;
  }
  else
  {
    if ((objc_msgSend(v14, "isEqualToString:", CFSTR("asktojoinpersonalhotspot")) & 1) != 0)
    {
      v25 = 1;
      v46 = 6;
      if ((objc_msgSend(v13, "isEqualToString:", CFSTR("join")) & 1) != 0)
      {
        v27 = v10;
        v22 = v10;
        v26 = 6;
        goto LABEL_37;
      }
      v19 = 0;
      v18 = 0;
      goto LABEL_27;
    }
    v36 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "%s: unknown notificationType for category %@", "-[WiFiUserNotificationManager userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:]", v14);
    objc_autoreleasePoolPop(v36);
    v18 = 0;
    v19 = 0;
    v46 = 0;
  }
LABEL_17:
  if ((objc_msgSend(v13, "isEqualToString:", CFSTR("join")) & 1) != 0)
  {
    v21 = objc_msgSend(v9, "objectForKey:", CFSTR("Recommendation"));
    if (v21)
    {
      v22 = v21;
      v23 = objc_msgSend(v9, "objectForKey:", CFSTR("Location"));
      a5 = v47;
      if (!v23)
      {
        v24 = objc_autoreleasePoolPush();
        if (qword_10026DD20)
          objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: location is not present", "-[WiFiUserNotificationManager userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:]");
        objc_autoreleasePoolPop(v24);
      }
      v25 = 1;
      -[WiFiUserNotificationManager _submitAnalyticsEventForRecommendation:action:visibleDuration:location:](self, "_submitAnalyticsEventForRecommendation:action:visibleDuration:location:", v22, 1, v23, v16);
      goto LABEL_24;
    }
    v37 = objc_autoreleasePoolPush();
    a5 = v47;
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "%s: recommendation not found for notification (%@)", "-[WiFiUserNotificationManager userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:]", v45);
    goto LABEL_91;
  }
  LODWORD(v25) = 0;
LABEL_27:
  if (objc_msgSend(v13, "isEqualToString:", CFSTR("settings")))
  {
    v28 = objc_msgSend(v9, "objectForKey:", CFSTR("Reason"));
    if (!v28)
    {
      v38 = objc_autoreleasePoolPush();
      a5 = v47;
      if (qword_10026DD20)
        objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "%s: notifyReason is nil", "-[WiFiUserNotificationManager userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:]");
      objc_autoreleasePoolPop(v38);
      v25 = 3;
      v27 = v48;
      v22 = v48;
      goto LABEL_36;
    }
    -[WiFiUserNotificationManager _submitAnalyticsEventForJoinAlertReason:action:visibleDuration:](self, "_submitAnalyticsEventForJoinAlertReason:action:visibleDuration:", objc_msgSend(v28, "integerValue"), 5, v16);
    v25 = 3;
    goto LABEL_34;
  }
  if (objc_msgSend(v13, "isEqualToString:", CFSTR("disconnect")))
  {
    v29 = objc_msgSend(v9, "objectForKey:", CFSTR("Reason"));
    if (v29)
    {
      -[WiFiUserNotificationManager _submitAnalyticsEventForJoinAlertReason:action:visibleDuration:](self, "_submitAnalyticsEventForJoinAlertReason:action:visibleDuration:", objc_msgSend(v29, "integerValue"), 4, v16);
    }
    else
    {
      v39 = objc_autoreleasePoolPush();
      if (qword_10026DD20)
        objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "%s: notifyReason is nil", "-[WiFiUserNotificationManager userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:]");
      objc_autoreleasePoolPop(v39);
    }
    v25 = 2;
LABEL_34:
    v27 = v48;
    v22 = v48;
LABEL_35:
    a5 = v47;
LABEL_36:
    v26 = v46;
    goto LABEL_37;
  }
  if (objc_msgSend(v13, "isEqualToString:", CFSTR("joincolocated")))
  {
    if (!objc_msgSend(v9, "objectForKey:", CFSTR("ToScanResult")))
    {
      v40 = objc_autoreleasePoolPush();
      if (qword_10026DD20)
        objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "%s: to scan result not found for notification (%@)", "-[WiFiUserNotificationManager userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:]", v45);
      objc_autoreleasePoolPop(v40);
      v25 = 0;
      v22 = 0;
      a5 = v47;
      goto LABEL_24;
    }
    a5 = v47;
    if (objc_msgSend(v9, "objectForKey:", CFSTR("FromScanResult")))
    {
      v25 = 1;
      v22 = v9;
LABEL_24:
      v26 = v46;
LABEL_25:
      v27 = v48;
      goto LABEL_37;
    }
    v37 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "%s: from scan result not found for notification (%@)", "-[WiFiUserNotificationManager userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:]", v45);
LABEL_91:
    objc_autoreleasePoolPop(v37);
    v25 = 0;
    v22 = 0;
    goto LABEL_24;
  }
  if ((objc_msgSend(v13, "isEqualToString:", CFSTR("com.apple.UNNotificationSilenceActionIdentifier")) & 1) == 0
    && !objc_msgSend(v13, "isEqualToString:", UNNotificationDismissActionIdentifier))
  {
    v35 = objc_msgSend(objc_msgSend(a4, "actionIdentifier"), "isEqualToString:", CFSTR("disablelowdata"));
    if (v35)
      v25 = 4;
    else
      v25 = 0;
    v27 = v10;
    if (v35)
      v22 = v10;
    else
      v22 = 0;
    goto LABEL_35;
  }
  if (v18)
  {
    v31 = objc_msgSend(v9, "objectForKey:", CFSTR("Recommendation"));
    if (v31)
    {
      v22 = v31;
      v32 = objc_msgSend(v9, "objectForKey:", CFSTR("Location"));
      a5 = v47;
      if (!v32)
      {
        v33 = objc_autoreleasePoolPush();
        if (qword_10026DD20)
          objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: location is not present", "-[WiFiUserNotificationManager userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:]");
        objc_autoreleasePoolPop(v33);
      }
      -[WiFiUserNotificationManager _submitAnalyticsEventForRecommendation:action:visibleDuration:location:](self, "_submitAnalyticsEventForRecommendation:action:visibleDuration:location:", v22, 2, v32, v16);
      v25 = 0;
      v26 = 1;
      goto LABEL_25;
    }
    v41 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "%s: recommendation not found for notification (%@)", "-[WiFiUserNotificationManager userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:]", v45);
    objc_autoreleasePoolPop(v41);
    v25 = 0;
    v22 = 0;
    v26 = 1;
LABEL_106:
    a5 = v47;
    v27 = v10;
    goto LABEL_37;
  }
  if (v17)
  {
    v34 = objc_msgSend(v9, "objectForKey:", CFSTR("Reason"));
    a5 = v47;
    if (v34)
    {
      v26 = 2;
      -[WiFiUserNotificationManager _submitAnalyticsEventForJoinAlertReason:action:visibleDuration:](self, "_submitAnalyticsEventForJoinAlertReason:action:visibleDuration:", objc_msgSend(v34, "integerValue"), 2, v16);
      v25 = 0;
    }
    else
    {
      v42 = objc_autoreleasePoolPush();
      if (qword_10026DD20)
        objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "%s: notifyReason is nil", "-[WiFiUserNotificationManager userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:]");
      objc_autoreleasePoolPop(v42);
      v25 = 0;
      v26 = 2;
    }
    v27 = v10;
    v22 = v10;
  }
  else
  {
    if (v19)
    {
      if (objc_msgSend(v9, "objectForKey:", CFSTR("ToScanResult")))
      {
        a5 = v47;
        if (objc_msgSend(v9, "objectForKey:", CFSTR("FromScanResult")))
        {
          v25 = 0;
          v26 = 5;
          v22 = v9;
        }
        else
        {
          v44 = objc_autoreleasePoolPush();
          if (qword_10026DD20)
            objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "%s: from scan result not found for notification (%@)", "-[WiFiUserNotificationManager userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:]", v45);
          objc_autoreleasePoolPop(v44);
          v25 = 0;
          v22 = 0;
          v26 = 5;
        }
        goto LABEL_25;
      }
      v43 = objc_autoreleasePoolPush();
      if (qword_10026DD20)
        objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "%s: to scan result not found for notification (%@)", "-[WiFiUserNotificationManager userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:]", v45);
      objc_autoreleasePoolPop(v43);
      v25 = 0;
      v22 = 0;
      v26 = 5;
      goto LABEL_106;
    }
    a5 = v47;
    if ((_DWORD)v25)
      v26 = 6;
    else
      v26 = v46;
    v27 = v10;
    if ((_DWORD)v25)
      v22 = v10;
    else
      v22 = 0;
    v25 = 0;
  }
LABEL_37:
  -[WiFiUserNotificationHistory handleNotificationResponseForSSID:type:response:](-[WiFiUserNotificationManager notificationHistory](self, "notificationHistory"), "handleNotificationResponseForSSID:type:response:", v27, v26, v25);
  if (self->_queue && -[WiFiUserNotificationManager callback](self, "callback"))
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100161884;
    block[3] = &unk_1002308F0;
    block[4] = self;
    block[5] = v22;
    v50 = v26;
    v51 = v25;
    dispatch_sync(queue, block);
  }
  if (a5)
    (*((void (**)(id))a5 + 2))(a5);
  -[WiFiUserNotificationManager setVisibleRequest:](self, "setVisibleRequest:", 0);
}

- (int)dispatchNotificationWithRecommendation:(id)a3 currentLocation:(id)a4 force:(BOOL)a5
{
  _BOOL4 v5;
  unsigned int v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  NSString *v15;
  id v16;
  const __CFString *v17;
  const __CFString *v18;
  NSString *v19;
  id v20;
  id v21;
  NSString *v22;
  id v23;
  void *v24;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[8];
  unsigned __int8 v29;
  _QWORD v30[6];
  _QWORD v31[7];
  BOOL v32;

  if (a3)
  {
    v5 = a5;
    v9 = -[WiFiUserNotificationHistory canPresentRecommendationForSSID:currentLocation:](-[WiFiUserNotificationManager notificationHistory](self, "notificationHistory"), "canPresentRecommendationForSSID:currentLocation:", objc_msgSend(a3, "SSID"), a4);
    v10 = v9;
    if (!v5 && v9)
    {
      v11 = objc_autoreleasePoolPush();
      if (qword_10026DD20)
        objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: unable to dispatch recommendation for %@, reason: %@", "-[WiFiUserNotificationManager dispatchNotificationWithRecommendation:currentLocation:force:]", objc_msgSend(a3, "SSID"), sub_1000BBE04(v10));
      objc_autoreleasePoolPop(v11);
      if (v10 == 2)
        -[WiFiUserNotificationHistory resetAttemptsForSSID:](-[WiFiUserNotificationManager notificationHistory](self, "notificationHistory"), "resetAttemptsForSSID:", objc_msgSend(a3, "SSID"));
      return v10;
    }
    if (v5)
    {
      v13 = objc_autoreleasePoolPush();
      if (qword_10026DD20)
        objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: forcing notification for %@", "-[WiFiUserNotificationManager dispatchNotificationWithRecommendation:currentLocation:force:]", a3);
      objc_autoreleasePoolPop(v13);
      v10 = 0;
    }
    if (-[WiFiUserNotificationManager visibleRequest](self, "visibleRequest"))
    {
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      v31[2] = sub_100161DC0;
      v31[3] = &unk_100232EE8;
      v31[4] = self;
      v31[5] = a3;
      v31[6] = a4;
      v32 = v5;
      -[UNUserNotificationCenter getDeliveredNotificationsWithCompletionHandler:](-[WiFiUserNotificationManager userNotificationCenterWiFi](self, "userNotificationCenterWiFi"), "getDeliveredNotificationsWithCompletionHandler:", v31);
      return v10;
    }
    if (objc_msgSend(objc_msgSend(a3, "network"), "source") == (id)2)
      v14 = -[WiFiUserNotificationManager shouldTimeOutRecommendation](self, "shouldTimeOutRecommendation");
    else
      v14 = 0;
    v15 = -[NSUUID UUIDString](+[NSUUID UUID](NSUUID, "UUID"), "UUIDString");
    v16 = objc_alloc_init((Class)UNMutableNotificationContent);
    if (self->_supportsWAPI)
      v17 = CFSTR("WIFI_RECOMMENDATION_TITLE_CH");
    else
      v17 = CFSTR("WIFI_RECOMMENDATION_TITLE");
    objc_msgSend(v16, "setTitle:", sub_10015B934((uint64_t)v17));
    if (objc_msgSend(objc_msgSend(a3, "network"), "source") == (id)1)
      v18 = CFSTR("WIFI_RECOMMENDATION_BODY_WALLET");
    else
      v18 = CFSTR("WIFI_RECOMMENDATION_BODY");
    v19 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", sub_10015B934((uint64_t)v18), objc_msgSend(objc_msgSend(a3, "network"), "SSID"));
    if (!self->_enableTestMode)
      goto LABEL_32;
    v20 = objc_msgSend(objc_msgSend(a3, "network"), "source");
    v21 = objc_msgSend(a3, "network");
    if (v20 == (id)2)
    {
      v22 = -[NSString stringByAppendingFormat:](v19, "stringByAppendingFormat:", CFSTR("\nSource: 3Bars\nScore: %lu\nAccessPoints: %lu\nBSSID: %@"), objc_msgSend(objc_msgSend(v21, "popularityScore"), "score"), objc_msgSend(objc_msgSend(objc_msgSend(a3, "network"), "accessPoints"), "count"), objc_msgSend(objc_msgSend(a3, "scannedNetwork"), "BSSID"));
    }
    else
    {
      if (objc_msgSend(v21, "source") != (id)1)
      {
LABEL_32:
        objc_msgSend(v16, "setBody:", v19);
        objc_msgSend(v16, "setCategoryIdentifier:", CFSTR("recommendation"));
        objc_msgSend(v16, "setShouldSuppressDefaultAction:", 1);
        v30[0] = 0;
        v30[1] = v30;
        v30[2] = 0x3052000000;
        v30[3] = sub_10002FAE8;
        v30[4] = sub_10002F9D0;
        v30[5] = self;
        v28[0] = _NSConcreteStackBlock;
        v28[1] = 3221225472;
        v28[2] = sub_100161F3C;
        v28[3] = &unk_100232F10;
        v29 = v14;
        v28[4] = v15;
        v28[5] = a3;
        v28[6] = a4;
        v28[7] = v30;
        -[UNUserNotificationCenter addNotificationRequest:withCompletionHandler:](-[WiFiUserNotificationManager userNotificationCenterWiFi](self, "userNotificationCenterWiFi"), "addNotificationRequest:withCompletionHandler:", +[UNNotificationRequest requestWithIdentifier:content:trigger:destinations:](UNNotificationRequest, "requestWithIdentifier:content:trigger:destinations:", v15, v16, 0, 5), v28);
        v23 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
        v24 = v23;
        if (a4)
          objc_msgSend(v23, "setObject:forKey:", a4, CFSTR("Location"));
        objc_msgSend(v24, "setObject:forKey:", a3, CFSTR("Recommendation"));
        objc_msgSend(v24, "setObject:forKey:", objc_msgSend(a3, "SSID"), CFSTR("SSID"));
        -[NSMutableDictionary setObject:forKey:](-[WiFiUserNotificationManager notificationMapping](self, "notificationMapping"), "setObject:forKey:", v24, v15);
        -[WiFiUserNotificationHistory presentedNotificationForSSID:type:currentLocation:](-[WiFiUserNotificationManager notificationHistory](self, "notificationHistory"), "presentedNotificationForSSID:type:currentLocation:", objc_msgSend(a3, "SSID"), 1, a4);
        -[WiFiUserNotificationManager setLastRecommendationLocation:](self, "setLastRecommendationLocation:", a4);
        if (v16)
          CFRelease(v16);
        _Block_object_dispose(v30, 8);
        return v10;
      }
      v22 = -[NSString stringByAppendingFormat:](v19, "stringByAppendingFormat:", CFSTR("\nSource: Wallet\nIdentifier: %@"), objc_msgSend(objc_msgSend(a3, "network"), "uniqueIdentifier"), v26, v27);
    }
    v19 = v22;
    goto LABEL_32;
  }
  v12 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "%s: nil recommendation", "-[WiFiUserNotificationManager dispatchNotificationWithRecommendation:currentLocation:force:]");
  objc_autoreleasePoolPop(v12);
  return 1;
}

- (void)dispatchNotificationWithRandomMAC:(id)a3
{
  void *v5;
  NSString *v6;
  id v7;
  const __CFString *v8;
  NSString *v9;
  id v10;
  NSMutableDictionary *v11;
  _QWORD v12[6];
  _QWORD v13[6];
  _QWORD v14[6];
  const __CFString *v15;
  id v16;

  if (a3)
  {
    if (-[WiFiUserNotificationManager visibleRequest](self, "visibleRequest"))
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_1001623B0;
      v14[3] = &unk_100232F38;
      v14[4] = self;
      v14[5] = a3;
      -[UNUserNotificationCenter getDeliveredNotificationsWithCompletionHandler:](-[WiFiUserNotificationManager userNotificationCenterWiFi](self, "userNotificationCenterWiFi"), "getDeliveredNotificationsWithCompletionHandler:", v14);
    }
    else
    {
      v6 = -[NSUUID UUIDString](+[NSUUID UUID](NSUUID, "UUID"), "UUIDString");
      v7 = objc_alloc_init((Class)UNMutableNotificationContent);
      if (self->_supportsWAPI)
        v8 = CFSTR("WIFI_RANDOM_MAC_TITLE_CH");
      else
        v8 = CFSTR("WIFI_RANDOM_MAC_TITLE");
      v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", sub_10015B934((uint64_t)v8), a3);
      v10 = sub_10015B934((uint64_t)CFSTR("WIFI_RANDOM_MAC_BODY"));
      objc_msgSend(v7, "setTitle:", v9);
      objc_msgSend(v7, "setBody:", v10);
      objc_msgSend(v7, "setCategoryIdentifier:", CFSTR("randommac"));
      objc_msgSend(v7, "setShouldSuppressDefaultAction:", 1);
      v13[0] = 0;
      v13[1] = v13;
      v13[2] = 0x3052000000;
      v13[3] = sub_10002FAE8;
      v13[4] = sub_10002F9D0;
      v13[5] = self;
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_100162498;
      v12[3] = &unk_100232F60;
      v12[4] = v6;
      v12[5] = v13;
      -[UNUserNotificationCenter addNotificationRequest:withCompletionHandler:](-[WiFiUserNotificationManager userNotificationCenterWiFi](self, "userNotificationCenterWiFi"), "addNotificationRequest:withCompletionHandler:", +[UNNotificationRequest requestWithIdentifier:content:trigger:destinations:](UNNotificationRequest, "requestWithIdentifier:content:trigger:destinations:", v6, v7, 0, 1), v12);
      v11 = -[WiFiUserNotificationManager notificationMapping](self, "notificationMapping");
      v15 = CFSTR("SSID");
      v16 = a3;
      -[NSMutableDictionary setObject:forKey:](v11, "setObject:forKey:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1), v6);
      -[NSMutableDictionary setObject:forKey:](-[WiFiUserNotificationManager recentNotifications](self, "recentNotifications"), "setObject:forKey:", +[NSDate date](NSDate, "date"), a3);
      if (v7)
        CFRelease(v7);
      _Block_object_dispose(v13, 8);
    }
  }
  else
  {
    v5 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "%s: nil ssid", "-[WiFiUserNotificationManager dispatchNotificationWithRandomMAC:]");
    objc_autoreleasePoolPop(v5);
  }
}

- (void)dispatchAccessoryJoinAlertForNetwork:(id)a3 unsecured:(BOOL)a4
{
  uint64_t v4;

  if (a4)
    v4 = 7;
  else
    v4 = 6;
  -[WiFiUserNotificationManager dispatchJoinAlertForNetwork:withProviderName:andReason:](self, "dispatchJoinAlertForNetwork:withProviderName:andReason:", a3, 0, v4);
}

- (void)dispatchJoinAlertForNetwork:(id)a3 withProviderName:(id)a4 andReason:(int)a5
{
  uint64_t v5;
  void *v9;
  NSString *v10;
  id v11;
  const __CFString *v12;
  NSString *v13;
  NSString *v14;
  const __CFString *v15;
  const __CFString *v16;
  NSString *v17;
  NSMutableDictionary *v18;
  _QWORD v19[6];
  _QWORD v20[6];
  _QWORD v21[7];
  int v22;
  _QWORD v23[2];
  _QWORD v24[2];

  v5 = *(_QWORD *)&a5;
  v9 = objc_autoreleasePoolPush();
  if (a3)
  {
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: ssid='%@' provider='%@'", "-[WiFiUserNotificationManager dispatchJoinAlertForNetwork:withProviderName:andReason:]", a3, a4);
    objc_autoreleasePoolPop(v9);
    if (-[WiFiUserNotificationManager visibleRequest](self, "visibleRequest"))
    {
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_100162990;
      v21[3] = &unk_100232FB0;
      v21[4] = self;
      v21[5] = a3;
      v21[6] = a4;
      v22 = v5;
      -[UNUserNotificationCenter getDeliveredNotificationsWithCompletionHandler:](-[WiFiUserNotificationManager userNotificationCenterWiFi](self, "userNotificationCenterWiFi"), "getDeliveredNotificationsWithCompletionHandler:", v21);
    }
    else
    {
      v10 = -[NSUUID UUIDString](+[NSUUID UUID](NSUUID, "UUID"), "UUIDString");
      v11 = objc_alloc_init((Class)UNMutableNotificationContent);
      if ((v5 & 0xFFFFFFFE) == 6)
      {
        if ((_DWORD)v5 == 7)
          v12 = CFSTR("WIFI_ACCESSORY_JOIN_ALERT_JOINED_WIFI_NETWORK_TITLE_UNSECURED");
        else
          v12 = CFSTR("WIFI_ACCESSORY_JOIN_ALERT_JOINED_WIFI_NETWORK_TITLE");
        v13 = (NSString *)sub_10015B934((uint64_t)v12);
        v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", sub_10015B934((uint64_t)CFSTR("WIFI_ACCESSORY_JOIN_ALERT_JOINED_NETWORK_BODY")), a3);
      }
      else
      {
        if (self->_supportsWAPI)
          v15 = CFSTR("WIFI_JOIN_ALERT_JOINED_WIFI_NETWORK_TITLE_CH");
        else
          v15 = CFSTR("WIFI_JOIN_ALERT_JOINED_WIFI_NETWORK_TITLE");
        v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", sub_10015B934((uint64_t)v15), a3);
        if (a4)
        {
          if (self->_supportsWAPI)
            v16 = CFSTR("WIFI_JOIN_ALERT_JOINED_PROVIDED_NETWORK_BODY_CH");
          else
            v16 = CFSTR("WIFI_JOIN_ALERT_JOINED_PROVIDED_NETWORK_BODY");
          v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", sub_10015B934((uint64_t)v16), a4);
        }
        else
        {
          v14 = (NSString *)sub_10015B934((uint64_t)CFSTR("WIFI_JOIN_ALERT_JOINED_NETWORK_BODY"));
        }
      }
      v17 = v14;
      if ((_DWORD)v5 == 6)
        objc_msgSend(v11, "setShouldIgnoreDoNotDisturb:", 1);
      objc_msgSend(v11, "setTitle:", v13);
      objc_msgSend(v11, "setBody:", v17);
      objc_msgSend(v11, "setShouldSuppressDefaultAction:", 1);
      objc_msgSend(v11, "setCategoryIdentifier:", CFSTR("joinalert"));
      v20[0] = 0;
      v20[1] = v20;
      v20[2] = 0x3052000000;
      v20[3] = sub_10002FAE8;
      v20[4] = sub_10002F9D0;
      v20[5] = self;
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_100162A90;
      v19[3] = &unk_100232F60;
      v19[4] = v10;
      v19[5] = v20;
      -[UNUserNotificationCenter addNotificationRequest:withCompletionHandler:](-[WiFiUserNotificationManager userNotificationCenterWiFi](self, "userNotificationCenterWiFi"), "addNotificationRequest:withCompletionHandler:", +[UNNotificationRequest requestWithIdentifier:content:trigger:destinations:](UNNotificationRequest, "requestWithIdentifier:content:trigger:destinations:", v10, v11, 0, 1), v19);
      v18 = -[WiFiUserNotificationManager notificationMapping](self, "notificationMapping");
      v23[0] = CFSTR("SSID");
      v23[1] = CFSTR("Reason");
      v24[0] = a3;
      v24[1] = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v5);
      -[NSMutableDictionary setObject:forKey:](v18, "setObject:forKey:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v24, v23, 2), v10);
      -[NSMutableDictionary setObject:forKey:](-[WiFiUserNotificationManager recentNotifications](self, "recentNotifications"), "setObject:forKey:", +[NSDate date](NSDate, "date"), a3);
      if (v11)
        CFRelease(v11);
      _Block_object_dispose(v20, 8);
    }
  }
  else
  {
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "%s: nil ssid", "-[WiFiUserNotificationManager dispatchJoinAlertForNetwork:withProviderName:andReason:]");
    objc_autoreleasePoolPop(v9);
  }
}

- (void)dispatchLowDataModeAlertForNetwork:(id)a3 withReason:(int)a4
{
  uint64_t v4;
  void *v7;
  void *v8;
  NSString *v9;
  id v10;
  id v11;
  const __CFString *v12;
  NSString *v13;
  NSMutableDictionary *v14;
  _QWORD v15[6];
  _QWORD v16[6];
  _QWORD v17[6];
  int v18;
  _QWORD v19[2];
  _QWORD v20[2];

  if (a3)
  {
    v4 = *(_QWORD *)&a4;
    if (-[WiFiUserNotificationManager visibleRequest](self, "visibleRequest"))
    {
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_100162F2C;
      v17[3] = &unk_100232FD8;
      v17[4] = self;
      v17[5] = a3;
      v18 = v4;
      -[UNUserNotificationCenter getDeliveredNotificationsWithCompletionHandler:](-[WiFiUserNotificationManager userNotificationCenterWiFi](self, "userNotificationCenterWiFi"), "getDeliveredNotificationsWithCompletionHandler:", v17);
    }
    else
    {
      if (-[NSMutableDictionary objectForKey:](-[WiFiUserNotificationManager recentNotifications](self, "recentNotifications"), "objectForKey:", a3))
      {
        v8 = objc_autoreleasePoolPush();
        if (qword_10026DD20)
          objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: showing the notification again for %@", "-[WiFiUserNotificationManager dispatchLowDataModeAlertForNetwork:withReason:]", a3);
        objc_autoreleasePoolPop(v8);
        -[NSMutableDictionary removeObjectForKey:](-[WiFiUserNotificationManager recentNotifications](self, "recentNotifications"), "removeObjectForKey:", a3);
      }
      v9 = -[NSUUID UUIDString](+[NSUUID UUID](NSUUID, "UUID"), "UUIDString");
      v10 = objc_alloc_init((Class)UNMutableNotificationContent);
      v11 = sub_10015B934((uint64_t)CFSTR("WIFI_LOW_DATA_MODE_ALERT_JOINED_NETWORK_TITLE"));
      if (-[WiFiUserNotificationManager deviceClass](self, "deviceClass") == 1)
      {
        v12 = CFSTR("WIFI_LOW_DATA_MODE_ALERT_JOINED_NETWORK_BODY_IPHONE");
      }
      else if (-[WiFiUserNotificationManager deviceClass](self, "deviceClass") == 3)
      {
        v12 = CFSTR("WIFI_LOW_DATA_MODE_ALERT_JOINED_NETWORK_BODY_IPAD");
      }
      else if (-[WiFiUserNotificationManager deviceClass](self, "deviceClass") == 2)
      {
        v12 = CFSTR("WIFI_LOW_DATA_MODE_ALERT_JOINED_NETWORK_BODY_IPOD");
      }
      else
      {
        v12 = CFSTR("WIFI_LOW_DATA_MODE_ALERT_JOINED_NETWORK_BODY");
      }
      v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", sub_10015B934((uint64_t)v12), a3);
      objc_msgSend(v10, "setTitle:", v11);
      objc_msgSend(v10, "setBody:", v13);
      objc_msgSend(v10, "setShouldSuppressDefaultAction:", 1);
      objc_msgSend(v10, "setCategoryIdentifier:", CFSTR("lowdatamodealert"));
      v16[0] = 0;
      v16[1] = v16;
      v16[2] = 0x3052000000;
      v16[3] = sub_10002FAE8;
      v16[4] = sub_10002F9D0;
      v16[5] = self;
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_100163020;
      v15[3] = &unk_100232F60;
      v15[4] = v9;
      v15[5] = v16;
      -[UNUserNotificationCenter addNotificationRequest:withCompletionHandler:](-[WiFiUserNotificationManager userNotificationCenterWiFi](self, "userNotificationCenterWiFi"), "addNotificationRequest:withCompletionHandler:", +[UNNotificationRequest requestWithIdentifier:content:trigger:destinations:](UNNotificationRequest, "requestWithIdentifier:content:trigger:destinations:", v9, v10, 0, 1), v15);
      v14 = -[WiFiUserNotificationManager notificationMapping](self, "notificationMapping");
      v19[0] = CFSTR("SSID");
      v19[1] = CFSTR("Reason");
      v20[0] = a3;
      v20[1] = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v4);
      -[NSMutableDictionary setObject:forKey:](v14, "setObject:forKey:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v20, v19, 2), v9);
      -[NSMutableDictionary setObject:forKey:](-[WiFiUserNotificationManager recentNotifications](self, "recentNotifications"), "setObject:forKey:", +[NSDate date](NSDate, "date"), a3);
      if (v10)
        CFRelease(v10);
      _Block_object_dispose(v16, 8);
    }
  }
  else
  {
    v7 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "%s: nil ssid", "-[WiFiUserNotificationManager dispatchLowDataModeAlertForNetwork:withReason:]");
    objc_autoreleasePoolPop(v7);
  }
}

- (void)dispatchNotificationWithColocatedScanResult:(id)a3 fromScanResult:(id)a4
{
  void *v7;
  NSString *v8;
  id v9;
  const __CFString *v10;
  const __CFString *v11;
  NSString *v12;
  NSString *v13;
  NSString *v14;
  NSString *v15;
  UNNotificationRequest *v16;
  NSMutableDictionary *v17;
  id v18;
  void *v19;
  _QWORD v20[6];
  _QWORD v21[6];
  _QWORD v22[5];
  _QWORD v23[7];
  _QWORD v24[3];
  _QWORD v25[3];

  if (!objc_msgSend(a3, "networkName"))
  {
    v7 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "%s: nil toScanResult.networkName", "-[WiFiUserNotificationManager dispatchNotificationWithColocatedScanResult:fromScanResult:]");
    goto LABEL_9;
  }
  if (!objc_msgSend(a4, "networkName"))
  {
    v7 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "%s: nil fromScanResult.networkName", "-[WiFiUserNotificationManager dispatchNotificationWithColocatedScanResult:fromScanResult:]");
LABEL_9:
    objc_autoreleasePoolPop(v7);
    return;
  }
  if (-[WiFiUserNotificationManager visibleRequest](self, "visibleRequest"))
  {
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10016362C;
    v23[3] = &unk_100233000;
    v23[4] = self;
    v23[5] = a3;
    v23[6] = a4;
    -[UNUserNotificationCenter getDeliveredNotificationsWithCompletionHandler:](-[WiFiUserNotificationManager userNotificationCenterWiFi](self, "userNotificationCenterWiFi"), "getDeliveredNotificationsWithCompletionHandler:", v23);
    return;
  }
  v8 = -[NSUUID UUIDString](+[NSUUID UUID](NSUUID, "UUID"), "UUIDString");
  v9 = objc_alloc_init((Class)UNMutableNotificationContent);
  if (self->_supportsWAPI)
    v10 = CFSTR("WIFI_COLOCATED_SSID_TITLE_CH");
  else
    v10 = CFSTR("WIFI_COLOCATED_SSID_TITLE");
  if (self->_supportsWAPI)
    v11 = CFSTR("WIFI_COLOCATED_SSID_BODY_CH");
  else
    v11 = CFSTR("WIFI_COLOCATED_SSID_BODY");
  v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", sub_10015B934((uint64_t)v10), objc_msgSend(a3, "networkName"));
  v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", sub_10015B934((uint64_t)v11), objc_msgSend(a3, "networkName"));
  if (os_variant_has_internal_content("com.apple.WiFiManager"))
  {
    v14 = -[NSUserDefaults objectForKey:](+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"), "objectForKey:", CFSTR("ColocatedSSIDNotificationTitleOverride"));
    if (v14)
      v12 = v14;
    v15 = -[NSUserDefaults objectForKey:](+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"), "objectForKey:", CFSTR("ColocatedSSIDNotificationBodyOverride"));
    if (v15)
      v13 = v15;
  }
  objc_msgSend(v9, "setTitle:", v12);
  objc_msgSend(v9, "setBody:", v13);
  objc_msgSend(v9, "setShouldSuppressDefaultAction:", 1);
  objc_msgSend(v9, "setCategoryIdentifier:", CFSTR("colocatedssid"));
  v16 = +[UNNotificationRequest requestWithIdentifier:content:trigger:destinations:](UNNotificationRequest, "requestWithIdentifier:content:trigger:destinations:", v8, v9, 0, 1);
  v17 = -[WiFiUserNotificationManager notificationMapping](self, "notificationMapping");
  v24[0] = CFSTR("SSID");
  v25[0] = objc_msgSend(a3, "networkName");
  v24[1] = CFSTR("ToScanResult");
  v25[1] = objc_msgSend(a3, "scanRecord");
  v24[2] = CFSTR("FromScanResult");
  v25[2] = objc_msgSend(a4, "scanRecord");
  -[NSMutableDictionary setObject:forKey:](v17, "setObject:forKey:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v25, v24, 3), v8);
  -[NSMutableDictionary setObject:forKey:](-[WiFiUserNotificationManager recentNotifications](self, "recentNotifications"), "setObject:forKey:", +[NSDate date](NSDate, "date"), objc_msgSend(a3, "networkName"));
  if (!os_variant_has_internal_content("com.apple.WiFiManager")
    || (v18 = -[NSUserDefaults objectForKey:](+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"), "objectForKey:", CFSTR("ColocatedSSIDNotificationTestAction"))) == 0)
  {
    v21[0] = 0;
    v21[1] = v21;
    v21[2] = 0x3052000000;
    v21[3] = sub_10002FAE8;
    v21[4] = sub_10002F9D0;
    v21[5] = self;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100163780;
    v20[3] = &unk_100232F60;
    v20[4] = v8;
    v20[5] = v21;
    -[UNUserNotificationCenter addNotificationRequest:withCompletionHandler:](-[WiFiUserNotificationManager userNotificationCenterWiFi](self, "userNotificationCenterWiFi"), "addNotificationRequest:withCompletionHandler:", v16, v20);
    _Block_object_dispose(v21, 8);
    if (!v9)
      return;
    goto LABEL_28;
  }
  v19 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: Will invoke -[UNUserNotificationCenter didReceiveNotificationResponse:withCompletionHandler:] with test action %@", "-[WiFiUserNotificationManager dispatchNotificationWithColocatedScanResult:fromScanResult:]", v18);
  objc_autoreleasePoolPop(v19);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100163720;
  v22[3] = &unk_10022EEE8;
  v22[4] = v18;
  -[WiFiUserNotificationManager userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:](self, "userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:", -[WiFiUserNotificationManager userNotificationCenterWiFi](self, "userNotificationCenterWiFi"), +[UNNotificationResponse responseWithNotification:actionIdentifier:](UNNotificationResponse, "responseWithNotification:actionIdentifier:", +[UNNotification notificationWithRequest:date:sourceIdentifier:intentIdentifiers:](UNNotification, "notificationWithRequest:date:sourceIdentifier:intentIdentifiers:", v16, +[NSDate date](NSDate, "date"), &stru_100238178, &__NSArray0__struct), v18), v22);
  if (v9)
LABEL_28:
    CFRelease(v9);
}

- (int)dispatchNotificationWithAskToJoinHotspotRecommendation:(id)a3
{
  void *v6;
  unsigned __int8 v7;
  NSString *v8;
  id v9;
  id v10;
  _QWORD v11[7];
  unsigned __int8 v12;
  _QWORD v13[6];
  _QWORD v14[5];

  if (a3)
  {
    if (-[WiFiUserNotificationManager visibleRequest](self, "visibleRequest"))
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_100163B2C;
      v14[3] = &unk_100233028;
      v14[4] = self;
      -[UNUserNotificationCenter getDeliveredNotificationsWithCompletionHandler:](-[WiFiUserNotificationManager userNotificationCenterWiFi](self, "userNotificationCenterWiFi"), "getDeliveredNotificationsWithCompletionHandler:", v14);
      return 5;
    }
    else
    {
      v7 = -[WiFiUserNotificationManager shouldTimeOutRecommendation](self, "shouldTimeOutRecommendation");
      v8 = -[NSUUID UUIDString](+[NSUUID UUID](NSUUID, "UUID"), "UUIDString");
      v9 = objc_alloc_init((Class)UNMutableNotificationContent);
      objc_msgSend(v9, "setTitle:", sub_10015B934((uint64_t)CFSTR("PERSONAL_HOTSPOT_NEARBY_BANNER_TITLE")));
      objc_msgSend(v9, "setBody:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", sub_10015B934((uint64_t)CFSTR("PERSONAL_HOTSPOT_NEARBY_BANNER_BODY")), a3));
      objc_msgSend(v9, "setCategoryIdentifier:", CFSTR("asktojoinpersonalhotspot"));
      objc_msgSend(v9, "setShouldSuppressDefaultAction:", 1);
      objc_msgSend(v9, "setIcon:", +[UNNotificationIcon iconNamed:](UNNotificationIcon, "iconNamed:", CFSTR("personal-hotspot")));
      v13[0] = 0;
      v13[1] = v13;
      v13[2] = 0x3052000000;
      v13[3] = sub_10002FAE8;
      v13[4] = sub_10002F9D0;
      v13[5] = self;
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_100163C10;
      v11[3] = &unk_100233050;
      v11[5] = a3;
      v11[6] = v13;
      v12 = v7;
      v11[4] = v8;
      -[UNUserNotificationCenter addNotificationRequest:withCompletionHandler:](-[WiFiUserNotificationManager userNotificationCenterWiFi](self, "userNotificationCenterWiFi"), "addNotificationRequest:withCompletionHandler:", +[UNNotificationRequest requestWithIdentifier:content:trigger:destinations:](UNNotificationRequest, "requestWithIdentifier:content:trigger:destinations:", v8, v9, 0, 1), v11);
      v10 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
      objc_msgSend(v10, "setObject:forKey:", a3, CFSTR("SSID"));
      objc_msgSend(v10, "setObject:forKey:", &off_100253A88, CFSTR("type"));
      -[NSMutableDictionary setObject:forKey:](-[WiFiUserNotificationManager notificationMapping](self, "notificationMapping"), "setObject:forKey:", v10, v8);
      -[NSMutableDictionary setObject:forKey:](-[WiFiUserNotificationManager recentNotifications](self, "recentNotifications"), "setObject:forKey:", +[NSDate date](NSDate, "date"), a3);
      if (v9)
        CFRelease(v9);
      _Block_object_dispose(v13, 8);
      return 0;
    }
  }
  else
  {
    v6 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "%s: nil SSID", "-[WiFiUserNotificationManager dispatchNotificationWithAskToJoinHotspotRecommendation:]");
    objc_autoreleasePoolPop(v6);
    return 1;
  }
}

- (void)registerCallback:(id)a3 withContext:(void *)a4
{
  -[WiFiUserNotificationManager setCallback:](self, "setCallback:", _Block_copy(a3));
  -[WiFiUserNotificationManager setCallbackContext:](self, "setCallbackContext:", a4);
}

- (void)dismissJoinAlerts
{
  id v3;
  void *v4;
  id v5;
  unsigned int v6;
  id v7;
  id v8;
  void *v9;
  void (**v10)(id, uint64_t, _QWORD, uint64_t, void *);
  NSObject *timeoutTimer;

  if (-[WiFiUserNotificationManager visibleRequest](self, "visibleRequest"))
  {
    -[UNUserNotificationCenter removeAllDeliveredNotifications](-[WiFiUserNotificationManager userNotificationCenterWiFi](self, "userNotificationCenterWiFi"), "removeAllDeliveredNotifications");
    v3 = -[NSMutableDictionary objectForKey:](-[WiFiUserNotificationManager notificationMapping](self, "notificationMapping"), "objectForKey:", -[WiFiUserNotificationManager visibleRequest](self, "visibleRequest"));
    if (v3)
    {
      v4 = v3;
      v5 = objc_msgSend(v3, "objectForKey:", CFSTR("type"));
      if (v5)
      {
        v6 = objc_msgSend(v5, "integerValue");
        v7 = objc_msgSend(v4, "objectForKey:", CFSTR("SSID"));
        if (v6 == 6)
        {
          v8 = v7;
          if (v7)
          {
            v9 = objc_autoreleasePoolPush();
            if (qword_10026DD20)
              objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: Dismissing join alert for %@", "-[WiFiUserNotificationManager dismissJoinAlerts]", -[WiFiUserNotificationManager visibleRequest](self, "visibleRequest"));
            objc_autoreleasePoolPop(v9);
            v10 = -[WiFiUserNotificationManager callback](self, "callback");
            ((void (**)(id, uint64_t, id, uint64_t, void *))v10)[2](v10, 6, v8, 5, -[WiFiUserNotificationManager callbackContext](self, "callbackContext"));
            timeoutTimer = self->_timeoutTimer;
            if (timeoutTimer)
              dispatch_source_cancel(timeoutTimer);
            -[WiFiUserNotificationManager setVisibleRequest:](self, "setVisibleRequest:", 0);
            -[NSMutableDictionary removeAllObjects](-[WiFiUserNotificationManager notificationMapping](self, "notificationMapping"), "removeAllObjects");
          }
        }
      }
    }
  }
}

- (void)enableTestMode:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  if (self->_enableTestMode != a3)
  {
    v3 = a3;
    v5 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: test mode %d", "-[WiFiUserNotificationManager enableTestMode:]", v3);
    objc_autoreleasePoolPop(v5);
    self->_enableTestMode = v3;
  }
}

- (void)_startTimerForNotificationWithUserInfo:(id)a3
{
  OS_dispatch_source *timeoutTimer;
  void *v6;
  OS_dispatch_source *v7;
  NSObject *v8;
  NSObject *v9;
  dispatch_time_t v10;
  _QWORD v11[5];
  _QWORD handler[6];

  timeoutTimer = self->_timeoutTimer;
  v6 = objc_autoreleasePoolPush();
  if (timeoutTimer)
  {
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: previous timer already in progress, bailing for new userInfo %@", "-[WiFiUserNotificationManager _startTimerForNotificationWithUserInfo:]", a3);
    objc_autoreleasePoolPop(v6);
  }
  else
  {
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: starting timer for userInfo %@", "-[WiFiUserNotificationManager _startTimerForNotificationWithUserInfo:]", a3);
    objc_autoreleasePoolPop(v6);
    v7 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_queue);
    self->_timeoutTimer = v7;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1001640E0;
    handler[3] = &unk_10022EB70;
    handler[4] = self;
    handler[5] = a3;
    dispatch_source_set_event_handler((dispatch_source_t)v7, handler);
    v8 = self->_timeoutTimer;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1001640EC;
    v11[3] = &unk_10022EEE8;
    v11[4] = self;
    dispatch_source_set_cancel_handler(v8, v11);
    v9 = self->_timeoutTimer;
    v10 = dispatch_time(0, 1000000000 * self->_timeoutPeriod);
    dispatch_source_set_timer(v9, v10, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_activate((dispatch_object_t)self->_timeoutTimer);
  }
}

- (void)_timeoutTimerDidFire:(id)a3
{
  NSObject *timeoutTimer;
  id v6;
  void *v7;
  id v8;
  id v9;
  void (**v10)(id, id, id, uint64_t, void *);
  id v11;
  double v12;
  double v13;
  id v14;
  void *v15;
  id v16;

  timeoutTimer = self->_timeoutTimer;
  if (timeoutTimer)
    dispatch_source_cancel(timeoutTimer);
  v6 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("identifier"));
  v7 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: timeout timer fired for identifier %@ (self.visibleRequest %@)", "-[WiFiUserNotificationManager _timeoutTimerDidFire:]", v6, -[WiFiUserNotificationManager visibleRequest](self, "visibleRequest"));
  objc_autoreleasePoolPop(v7);
  if (-[NSString isEqualToString:](-[WiFiUserNotificationManager visibleRequest](self, "visibleRequest"), "isEqualToString:", v6))
  {
    v8 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("ssid"));
    v9 = objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("type")), "integerValue");
    v16 = v6;
    -[UNUserNotificationCenter removeDeliveredNotificationsWithIdentifiers:](-[WiFiUserNotificationManager userNotificationCenterWiFi](self, "userNotificationCenterWiFi"), "removeDeliveredNotificationsWithIdentifiers:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v16, 1));
    v10 = -[WiFiUserNotificationManager callback](self, "callback");
    v10[2](v10, v9, v8, 5, -[WiFiUserNotificationManager callbackContext](self, "callbackContext"));
    v11 = -[NSMutableDictionary objectForKey:](-[WiFiUserNotificationManager notificationMapping](self, "notificationMapping"), "objectForKey:", v6);
    objc_msgSend(-[NSMutableDictionary objectForKey:](-[WiFiUserNotificationManager recentNotifications](self, "recentNotifications"), "objectForKey:", v8), "timeIntervalSinceNow");
    v13 = -v12;
    if ((_DWORD)v9 == 1)
    {
      v14 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("location"));
      if (!v14)
      {
        v15 = objc_autoreleasePoolPush();
        if (qword_10026DD20)
          objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: location is not present", "-[WiFiUserNotificationManager _timeoutTimerDidFire:]");
        objc_autoreleasePoolPop(v15);
      }
      -[WiFiUserNotificationManager _submitAnalyticsEventForRecommendation:action:visibleDuration:location:](self, "_submitAnalyticsEventForRecommendation:action:visibleDuration:location:", objc_msgSend(v11, "objectForKey:", CFSTR("Recommendation")), 3, v14, v13);
    }
    else if ((_DWORD)v9 == 2)
    {
      -[WiFiUserNotificationManager _submitAnalyticsEventForJoinAlertReason:action:visibleDuration:](self, "_submitAnalyticsEventForJoinAlertReason:action:visibleDuration:", objc_msgSend(objc_msgSend(v11, "objectForKey:", CFSTR("Reason")), "integerValue"), 3, v13);
    }
    -[WiFiUserNotificationHistory handleNotificationResponseForSSID:type:response:](-[WiFiUserNotificationManager notificationHistory](self, "notificationHistory"), "handleNotificationResponseForSSID:type:response:", v8, v9, 5);
    -[WiFiUserNotificationManager setVisibleRequest:](self, "setVisibleRequest:", 0);
    -[NSMutableDictionary removeAllObjects](-[WiFiUserNotificationManager notificationMapping](self, "notificationMapping"), "removeAllObjects");
  }
}

- (void)_submitAnalyticsEventForRecommendation:(id)a3 action:(unint64_t)a4 visibleDuration:(double)a5 location:(id)a6
{
  id v10;
  NSNumber *v11;
  id v12;
  NSNumber *v13;
  double v14;
  uint64_t v15;

  v10 = objc_msgSend(objc_msgSend(a3, "scannedNetwork"), "BSSID");
  if (objc_msgSend(objc_msgSend(a3, "network"), "popularityScore"))
    v11 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(objc_msgSend(objc_msgSend(a3, "network"), "popularityScore"), "score"));
  else
    v11 = 0;
  v12 = objc_msgSend(objc_msgSend(a3, "network"), "source");
  if (a6)
  {
    objc_msgSend(a6, "coordinate");
    v13 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    objc_msgSend(a6, "coordinate");
    a6 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v14);
  }
  else
  {
    v13 = 0;
  }
  if (v12 == (id)2)
    v15 = 1;
  else
    v15 = 2 * (v12 == (id)1);
  +[TBAnalytics captureEvent:](TBAnalytics, "captureEvent:", +[TBJoinAnalyticsEvent joinRecommendationEventWithSource:action:BSSID:latitude:longitude:score:visibleDuration:](TBJoinAnalyticsEvent, "joinRecommendationEventWithSource:action:BSSID:latitude:longitude:score:visibleDuration:", v15, a4, v10, v13, a6, v11, +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", llround(a5))));
}

- (void)_submitAnalyticsEventForJoinAlertReason:(int)a3 action:(unint64_t)a4 visibleDuration:(double)a5
{
  uint64_t v5;
  uint64_t v6;

  v5 = (a3 - 1);
  if (v5 >= 3)
    v6 = 0;
  else
    v6 = v5 + 3;
  +[TBAnalytics captureEvent:](TBAnalytics, "captureEvent:", +[TBJoinAnalyticsEvent joinAlertEventWithSource:action:visibleDuration:](TBJoinAnalyticsEvent, "joinAlertEventWithSource:action:visibleDuration:", v6, a4, +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", llround(a5))));
}

- (void)reset
{
  void *v3;
  void *v4;
  void *v5;

  v3 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: resetting states", "-[WiFiUserNotificationManager reset]");
  objc_autoreleasePoolPop(v3);
  v4 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: last recommendation location %@", "-[WiFiUserNotificationManager reset]", -[WiFiUserNotificationManager lastRecommendationLocation](self, "lastRecommendationLocation"));
  objc_autoreleasePoolPop(v4);
  -[WiFiUserNotificationManager setLastRecommendationLocation:](self, "setLastRecommendationLocation:", 0);
  v5 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: recentNotifications %@", "-[WiFiUserNotificationManager reset]", -[WiFiUserNotificationManager recentNotifications](self, "recentNotifications"));
  objc_autoreleasePoolPop(v5);
  -[NSMutableDictionary removeAllObjects](-[WiFiUserNotificationManager recentNotifications](self, "recentNotifications"), "removeAllObjects");
  -[WiFiUserNotificationHistory reset](-[WiFiUserNotificationManager notificationHistory](self, "notificationHistory"), "reset");
}

- (id)callback
{
  return self->_callback;
}

- (void)setCallback:(id)a3
{
  self->_callback = a3;
}

- (void)callbackContext
{
  return self->_callbackContext;
}

- (void)setCallbackContext:(void *)a3
{
  self->_callbackContext = a3;
}

- (NSMutableDictionary)notificationMapping
{
  return self->_notificationMapping;
}

- (void)setNotificationMapping:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (UNUserNotificationCenter)userNotificationCenterWiFi
{
  return self->_userNotificationCenterWiFi;
}

- (void)setUserNotificationCenterWiFi:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (NSString)visibleRequest
{
  return self->_visibleRequest;
}

- (void)setVisibleRequest:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (NSMutableDictionary)recentNotifications
{
  return self->_recentNotifications;
}

- (void)setRecentNotifications:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (OS_dispatch_source)timeoutTimer
{
  return self->_timeoutTimer;
}

- (void)setTimeoutTimer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (unint64_t)timeoutPeriod
{
  return self->_timeoutPeriod;
}

- (void)setTimeoutPeriod:(unint64_t)a3
{
  self->_timeoutPeriod = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  self->_queue = (OS_dispatch_queue *)a3;
}

- (BOOL)supportsWAPI
{
  return self->_supportsWAPI;
}

- (void)setSupportsWAPI:(BOOL)a3
{
  self->_supportsWAPI = a3;
}

- (BOOL)shouldTimeOutRecommendation
{
  return self->_shouldTimeOutRecommendation;
}

- (void)setShouldTimeOutRecommendation:(BOOL)a3
{
  self->_shouldTimeOutRecommendation = a3;
}

- (int)deviceClass
{
  return self->_deviceClass;
}

- (void)setDeviceClass:(int)a3
{
  self->_deviceClass = a3;
}

- (CLLocation)lastRecommendationLocation
{
  return self->_lastRecommendationLocation;
}

- (void)setLastRecommendationLocation:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (WiFiUserNotificationHistory)notificationHistory
{
  return self->_notificationHistory;
}

- (void)setNotificationHistory:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (BOOL)enableTestMode
{
  return self->_enableTestMode;
}

- (void)setEnableTestMode:(BOOL)a3
{
  self->_enableTestMode = a3;
}

@end
