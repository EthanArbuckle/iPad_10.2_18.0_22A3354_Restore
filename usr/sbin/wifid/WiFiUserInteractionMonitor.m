@implementation WiFiUserInteractionMonitor

- (BOOL)isAVConferenceActive
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor rtTrafficAgent](self, "rtTrafficAgent"));
  v3 = objc_msgSend(v2, "isActive");

  return v3;
}

- (void)_handleManagedEventNotification
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1000261C4;
  v2[3] = &unk_1002335B0;
  v2[4] = self;
  managed_event_fetch(11, v2);
}

- (void)runPeriodicTasks
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  ifaddrs *v10;
  _DWORD *v11;
  _DWORD *ifa_data;
  const char *ifa_name;
  sockaddr *ifa_addr;
  id v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  void *v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  unint64_t v50;
  char *__s1a;
  char *__s1;
  ifaddrs *v53;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor periodicTasksLastRanAt](self, "periodicTasksLastRanAt"));
  objc_msgSend(v3, "timeIntervalSinceDate:", v4);
  v6 = v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor periodicTasksLastRanAt](self, "periodicTasksLastRanAt"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor periodicTasksLastRanAt](self, "periodicTasksLastRanAt"));

  if (!v8 || v6 >= 5.0)
  {
    -[WiFiUserInteractionMonitor setPeriodicTasksLastRanAt:](self, "setPeriodicTasksLastRanAt:", v3);
    if (self->_ctServerConnectionRef)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor cellularInterfaceName](self, "cellularInterfaceName"));

      if (v9)
      {
        v53 = 0;
        getifaddrs(&v53);
        v10 = v53;
        if (v53)
        {
          v11 = 0;
          ifa_data = 0;
          do
          {
            ifa_name = v10->ifa_name;
            if (ifa_name)
            {
              if (v10->ifa_data)
              {
                ifa_addr = v10->ifa_addr;
                if (ifa_addr)
                {
                  if (ifa_addr->sa_family == 18)
                  {
                    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor cellularInterfaceName](self, "cellularInterfaceName")));
                    v16 = strcmp(ifa_name, (const char *)objc_msgSend(v15, "UTF8String"));

                    if (!v16)
                      ifa_data = v10->ifa_data;
                    v17 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor monitoredInterfaceNames](self, "monitoredInterfaceNames"));
                    if (objc_msgSend(v17, "count"))
                    {
                      __s1a = v10->ifa_name;
                      v18 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor monitoredInterfaceNames](self, "monitoredInterfaceNames"));
                      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "allObjects"));
                      v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectAtIndexedSubscript:", 0)));
                      LODWORD(__s1a) = strcmp(__s1a, (const char *)objc_msgSend(v20, "UTF8String"));

                      if (!(_DWORD)__s1a)
                        v11 = v10->ifa_data;
                    }
                    else
                    {

                    }
                  }
                }
              }
            }
            v10 = v10->ifa_next;
          }
          while (v10);
          if (ifa_data)
          {
            v21 = (ifa_data[11] + ifa_data[10]);
            v22 = (ifa_data[7] + ifa_data[5]);
            v23 = -[WiFiUserInteractionMonitor cellularIfTotalBytes](self, "cellularIfTotalBytes");
            v24 = -[WiFiUserInteractionMonitor cellularIfTotalPackets](self, "cellularIfTotalPackets");
            if (!v7)
            {
              -[WiFiUserInteractionMonitor setCellularIfTotalBytes:](self, "setCellularIfTotalBytes:", v21);
              -[WiFiUserInteractionMonitor setCellularIfTotalPackets:](self, "setCellularIfTotalPackets:", v22);
              if (v11)
                goto LABEL_30;
              goto LABEL_38;
            }
            v25 = v24;
            v26 = v21 - v23;
            if (-[WiFiUserInteractionMonitor cellularIfTotalBytes](self, "cellularIfTotalBytes") < v21)
              -[WiFiUserInteractionMonitor setCellularL3MBPS:](self, "setCellularL3MBPS:", (double)v26 / v6 * 0.000000953674316);
            v27 = v22 - v25;
            -[WiFiUserInteractionMonitor setCellularIfTotalBytes:](self, "setCellularIfTotalBytes:", v21);
            if (-[WiFiUserInteractionMonitor cellularIfTotalPackets](self, "cellularIfTotalPackets") < v22)
              -[WiFiUserInteractionMonitor setCellularL3PPS:](self, "setCellularL3PPS:", (unint64_t)((double)v27 / v6));
            -[WiFiUserInteractionMonitor setCellularIfTotalPackets:](self, "setCellularIfTotalPackets:", v22);
            v28 = objc_autoreleasePoolPush();
            if (qword_10026DD20)
              objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: cellular data did %llu bytes (%llu packets) over %.3f seconds", "-[WiFiUserInteractionMonitor runPeriodicTasks]", v26, v27, *(_QWORD *)&v6);
          }
          else
          {
            v28 = objc_autoreleasePoolPush();
            if (qword_10026DD20)
              objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: failed to find if_data for cellular interface.", "-[WiFiUserInteractionMonitor runPeriodicTasks]", v39, v40, v41);
          }
          objc_autoreleasePoolPop(v28);
          if (v11)
          {
LABEL_30:
            v29 = (v11[11] + v11[10]);
            v30 = (v11[7] + v11[5]);
            v31 = -[WiFiUserInteractionMonitor wifiIfTotalBytes](self, "wifiIfTotalBytes");
            v32 = -[WiFiUserInteractionMonitor wifiIfTotalPackets](self, "wifiIfTotalPackets");
            __s1 = (char *)v11[10];
            v33 = -[WiFiUserInteractionMonitor wifiIfTotalInputBytes](self, "wifiIfTotalInputBytes");
            v49 = v11[11];
            v50 = v33;
            v34 = -[WiFiUserInteractionMonitor wifiIfTotalOutputBytes](self, "wifiIfTotalOutputBytes");
            v47 = v11[5];
            v48 = v34;
            v35 = -[WiFiUserInteractionMonitor wifiIfTotalInputPackets](self, "wifiIfTotalInputPackets");
            v46 = v11[7];
            v36 = -[WiFiUserInteractionMonitor wifiIfTotalOutputPackets](self, "wifiIfTotalOutputPackets");
            -[WiFiUserInteractionMonitor setWifiIfTotalInputBytes:](self, "setWifiIfTotalInputBytes:", v11[10]);
            -[WiFiUserInteractionMonitor setWifiIfTotalOutputBytes:](self, "setWifiIfTotalOutputBytes:", v11[11]);
            -[WiFiUserInteractionMonitor setWifiIfTotalInputPackets:](self, "setWifiIfTotalInputPackets:", v11[5]);
            -[WiFiUserInteractionMonitor setWifiIfTotalOutputPackets:](self, "setWifiIfTotalOutputPackets:", v11[7]);
            if (!v7)
            {
              -[WiFiUserInteractionMonitor setWifiIfTotalBytes:](self, "setWifiIfTotalBytes:", v29);
              -[WiFiUserInteractionMonitor setWifiIfTotalPackets:](self, "setWifiIfTotalPackets:", v30);
              goto LABEL_42;
            }
            v37 = v29 - v31;
            if (-[WiFiUserInteractionMonitor wifiIfTotalBytes](self, "wifiIfTotalBytes") < v29)
              -[WiFiUserInteractionMonitor setWifiL3MBPS:](self, "setWifiL3MBPS:", (double)v37 / v6 * 0.000000953674316);
            -[WiFiUserInteractionMonitor setWifiIfTotalBytes:](self, "setWifiIfTotalBytes:", v29);
            if (-[WiFiUserInteractionMonitor wifiIfTotalPackets](self, "wifiIfTotalPackets") < v30)
              -[WiFiUserInteractionMonitor setWifiL3PPS:](self, "setWifiL3PPS:", (unint64_t)((double)(v30 - v32) / v6));
            -[WiFiUserInteractionMonitor setWifiIfTotalPackets:](self, "setWifiIfTotalPackets:", v30);
            v38 = objc_autoreleasePoolPush();
            if (qword_10026DD20)
              objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: WiFi data did %llu(input:%llu output:%llu) bytes, %llu(input:%llu output:%llu) packets over %.3f seconds", "-[WiFiUserInteractionMonitor runPeriodicTasks]", v37, &__s1[-v50], v49 - v48, v30 - v32, v47 - v35, v46 - v36, *(_QWORD *)&v6);
LABEL_40:
            objc_autoreleasePoolPop(v38);
LABEL_42:
            freeifaddrs(v53);
            goto LABEL_43;
          }
LABEL_38:
          v38 = objc_autoreleasePoolPush();
          if (qword_10026DD20)
            objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: failed to find if_data for WiFi interface.", "-[WiFiUserInteractionMonitor runPeriodicTasks]", v39, v40, v41, v42, v43, v44, v45);
          goto LABEL_40;
        }
      }
    }
  }
LABEL_43:

}

- (NSMutableSet)monitoredInterfaceNames
{
  return self->_monitoredInterfaceNames;
}

- (NSString)cellularInterfaceName
{
  return self->_cellularInterfaceName;
}

- (NSDate)periodicTasksLastRanAt
{
  return self->_periodicTasksLastRanAt;
}

- (unint64_t)wifiIfTotalPackets
{
  return self->_wifiIfTotalPackets;
}

- (unint64_t)wifiIfTotalBytes
{
  return self->_wifiIfTotalBytes;
}

- (unint64_t)cellularIfTotalPackets
{
  return self->_cellularIfTotalPackets;
}

- (unint64_t)cellularIfTotalBytes
{
  return self->_cellularIfTotalBytes;
}

- (BOOL)isNetworkRecommendationAllowed
{
  void *v3;
  BOOL v4;
  uint64_t v6;
  uint64_t v7;

  if (!-[WiFiUserInteractionMonitor isSetupCompleted](self, "isSetupCompleted"))
  {
    v3 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: setup not completed. Not allowing recommendation.", "-[WiFiUserInteractionMonitor isNetworkRecommendationAllowed]", v6, v7);
    goto LABEL_8;
  }
  if (-[WiFiUserInteractionMonitor navigating](self, "navigating")
    || -[WiFiUserInteractionMonitor anyCallInProgress](self, "anyCallInProgress"))
  {
    v3 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: navigating(%d) or in call(%d). Not allowing recommendation.", "-[WiFiUserInteractionMonitor isNetworkRecommendationAllowed]", -[WiFiUserInteractionMonitor navigating](self, "navigating"), -[WiFiUserInteractionMonitor anyCallInProgress](self, "anyCallInProgress"));
LABEL_8:
    v4 = 0;
    goto LABEL_9;
  }
  if (-[WiFiUserInteractionMonitor isCellularInexpensive5G](self, "isCellularInexpensive5G"))
  {
    v3 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: cellular is 5G and inexpensive. Not allowing recommendation.", "-[WiFiUserInteractionMonitor isNetworkRecommendationAllowed]", v6, v7);
    goto LABEL_8;
  }
  if (-[WiFiUserInteractionMonitor isUsingSustainedCellularData](self, "isUsingSustainedCellularData"))
  {
    v3 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: in active cellular data usage. Allowing recommendation.", "-[WiFiUserInteractionMonitor isNetworkRecommendationAllowed]");
  }
  else if (-[WiFiUserInteractionMonitor isNetworkingAppInForeground](self, "isNetworkingAppInForeground"))
  {
    v3 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: in FG networking app. Allowing recommendation.", "-[WiFiUserInteractionMonitor isNetworkRecommendationAllowed]");
  }
  else
  {
    if (-[WiFiUserInteractionMonitor isInHomeScreen](self, "isInHomeScreen")
      || -[WiFiUserInteractionMonitor isInNonNetworkingApp](self, "isInNonNetworkingApp")
      || -[WiFiUserInteractionMonitor isCellularDataUsable](self, "isCellularDataUsable"))
    {
      return 0;
    }
    v3 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: in an app and no cellular. Allowing recommendation.", "-[WiFiUserInteractionMonitor isNetworkRecommendationAllowed]");
  }
  v4 = 1;
LABEL_9:
  objc_autoreleasePoolPop(v3);
  return v4;
}

- (BOOL)isUsingSustainedCellularData
{
  double v3;

  -[WiFiUserInteractionMonitor cellularL3MBPS](self, "cellularL3MBPS");
  return v3 > 2.0 || -[WiFiUserInteractionMonitor cellularL3PPS](self, "cellularL3PPS") > 0x28;
}

- (BOOL)isNetworkingAppInForeground
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (-[WiFiUserInteractionMonitor overrideApplicationState](self, "overrideApplicationState"))
  {
    v3 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: using overridden application state as %llu", "-[WiFiUserInteractionMonitor isNetworkingAppInForeground]", -[WiFiUserInteractionMonitor overrideApplicationState](self, "overrideApplicationState"));
    objc_autoreleasePoolPop(v3);
    return -[WiFiUserInteractionMonitor overrideApplicationState](self, "overrideApplicationState") & 1;
  }
  else if (-[WiFiUserInteractionMonitor isInHomeScreen](self, "isInHomeScreen")
         || -[WiFiUserInteractionMonitor isInNonNetworkingApp](self, "isInNonNetworkingApp"))
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor runningForegroundApps](self, "runningForegroundApps"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithSet:](NSMutableSet, "setWithSet:", v5));

    v4 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor runningNetworkingApps](self, "runningNetworkingApps"));
    objc_msgSend(v6, "intersectSet:", v4);

    LOBYTE(v4) = objc_msgSend(v6, "count") != 0;
  }
  return (char)v4;
}

- (void)setApplicationRunningState:(BOOL)a3 foregroundState:(BOOL)a4 andNetworkingState:(BOOL)a5 forBundleId:(id)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *i;
  void *v21;
  void (**v22)(_QWORD, _QWORD, _QWORD);
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v6 = a5;
  v7 = a4;
  v10 = a6;
  if (!v10)
    goto LABEL_25;
  v11 = objc_autoreleasePoolPush();
  if (a3)
  {
    if (v7)
    {
      if (qword_10026DD20)
        objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: %@ entered foreground", "-[WiFiUserInteractionMonitor setApplicationRunningState:foregroundState:andNetworkingState:forBundleId:]", v10);
      objc_autoreleasePoolPop(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor runningForegroundApps](self, "runningForegroundApps"));
      objc_msgSend(v12, "addObject:", v10);
    }
    else
    {
      if (qword_10026DD20)
        objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: %@ entered background", "-[WiFiUserInteractionMonitor setApplicationRunningState:foregroundState:andNetworkingState:forBundleId:]", v10);
      objc_autoreleasePoolPop(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor runningForegroundApps](self, "runningForegroundApps"));
      objc_msgSend(v12, "removeObject:", v10);
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor runningNetworkingApps](self, "runningNetworkingApps"));
    v15 = v14;
    if (v6)
    {
      objc_msgSend(v14, "addObject:", v10);
      goto LABEL_16;
    }
  }
  else
  {
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: %@ exited", "-[WiFiUserInteractionMonitor setApplicationRunningState:foregroundState:andNetworkingState:forBundleId:]", v10);
    objc_autoreleasePoolPop(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor runningForegroundApps](self, "runningForegroundApps"));
    objc_msgSend(v13, "removeObject:", v10);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor runningNetworkingApps](self, "runningNetworkingApps"));
    v15 = v14;
  }
  objc_msgSend(v14, "removeObject:", v10);
LABEL_16:

  -[WiFiUserInteractionMonitor _notifyCaptiveWithApplicationState:](self, "_notifyCaptiveWithApplicationState:", -[WiFiUserInteractionMonitor _applicationNotifyState](self, "_applicationNotifyState"));
  if (-[WiFiUserInteractionMonitor hasRealTimeAppProperty:](self, "hasRealTimeAppProperty:", v10))
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor clients](self, "clients"));
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(_QWORD *)v24 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
          v22 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "callback"));
          ((void (**)(_QWORD, id, uint64_t))v22)[2](v22, objc_msgSend(v21, "context"), 8);

        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v18);
    }

  }
LABEL_25:

}

- (NSMutableSet)runningNetworkingApps
{
  return self->_runningNetworkingApps;
}

- (void)_notifyCaptiveWithApplicationState:(unint64_t)a3
{
  dispatch_queue_global_t global_queue;
  NSObject *v5;
  void *v6;
  _QWORD block[5];

  if (dword_10026DC90)
  {
    global_queue = dispatch_get_global_queue(0, 0);
    v5 = objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100009DB4;
    block[3] = &unk_10022EA38;
    block[4] = a3;
    dispatch_async(v5, block);

  }
  else
  {
    v6 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "%s: notify token is null", "-[WiFiUserInteractionMonitor _notifyCaptiveWithApplicationState:]");
    objc_autoreleasePoolPop(v6);
  }
}

- (unint64_t)_applicationNotifyState
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL8 v6;
  unint64_t v7;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor runningNetworkingApps](self, "runningNetworkingApps"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithSet:](NSMutableSet, "setWithSet:", v3));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor runningForegroundApps](self, "runningForegroundApps"));
  objc_msgSend(v4, "minusSet:", v5);

  if (-[WiFiUserInteractionMonitor isDeviceLocked](self, "isDeviceLocked")
    || -[WiFiUserInteractionMonitor navigating](self, "navigating")
    || !-[WiFiUserInteractionMonitor isDisplayOn](self, "isDisplayOn")
    || -[WiFiUserInteractionMonitor isInNonNetworkingApp](self, "isInNonNetworkingApp"))
  {
    v6 = 0;
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor runningForegroundApps](self, "runningForegroundApps"));
    v6 = objc_msgSend(v9, "count") != 0;

  }
  if (objc_msgSend(v4, "count"))
    v7 = v6 | 2;
  else
    v7 = v6;

  return v7;
}

- (BOOL)isInNonNetworkingApp
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  if (!-[WiFiUserInteractionMonitor isInHomeScreen](self, "isInHomeScreen"))
  {
    v3 = objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor runningForegroundApps](self, "runningForegroundApps"));
    if (v3)
    {
      v4 = (void *)v3;
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor runningForegroundApps](self, "runningForegroundApps"));
      v6 = objc_msgSend(v5, "count");

      if (v6)
      {
        v18 = 0u;
        v19 = 0u;
        v16 = 0u;
        v17 = 0u;
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor runningForegroundApps](self, "runningForegroundApps"));
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allObjects"));

        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v17;
          while (2)
          {
            for (i = 0; i != v10; i = (char *)i + 1)
            {
              if (*(_QWORD *)v17 != v11)
                objc_enumerationMutation(v8);
              v13 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
              if (!+[WiFiUserInteractionMonitor checkIfMatchesNonNetworkingBundleIds:](WiFiUserInteractionMonitor, "checkIfMatchesNonNetworkingBundleIds:", v13)&& !+[WiFiUserInteractionMonitor checkIfMatchesHomeBundleIds:](WiFiUserInteractionMonitor, "checkIfMatchesHomeBundleIds:", v13))
              {

                return 0;
              }
            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
            if (v10)
              continue;
            break;
          }
        }

        v14 = objc_autoreleasePoolPush();
        if (qword_10026DD20)
          objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: currently no networking app is in the foreground", "-[WiFiUserInteractionMonitor isInNonNetworkingApp]");
        objc_autoreleasePoolPop(v14);
      }
    }
  }
  return 1;
}

- (BOOL)navigating
{
  return self->_navigating;
}

- (BOOL)isDisplayOn
{
  return self->_isDisplayOn;
}

- (BOOL)isDeviceLocked
{
  return self->_isDeviceLocked;
}

- (unint64_t)cellularL3PPS
{
  return self->_cellularL3PPS;
}

- (double)cellularL3MBPS
{
  return self->_cellularL3MBPS;
}

- (BOOL)anyCallInProgress
{
  return self->_anyCallInProgress;
}

+ (id)sharedInstance
{
  if (qword_10026DC88 != -1)
    dispatch_once(&qword_10026DC88, &stru_100233518);
  return (id)qword_10026DC80;
}

- (unint64_t)symptomBackgroundFlowProperties
{
  return self->_symptomBackgroundFlowProperties;
}

- (BOOL)isCellularDataUsable
{
  void *v3;
  void *v4;
  unsigned int v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor cellularDataStatusMap](self, "cellularDataStatusMap"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor cellularDataStatusMap](self, "cellularDataStatusMap"));
    v5 = objc_msgSend(v4, "containsObject:", CFSTR("WiFiCellularDataStatusNoLTE")) ^ 1;

  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (BOOL)isCellularInexpensive5G
{
  WiFiUserInteractionMonitor *v2;
  void *v3;
  void *v4;
  __CFString *v5;
  void *v6;

  v2 = self;
  if (-[WiFiUserInteractionMonitor overrideApplicationState](self, "overrideApplicationState"))
  {
    v3 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: using overridden inexpensive cellular state as 0x%llx", "-[WiFiUserInteractionMonitor isCellularInexpensive5G]", -[WiFiUserInteractionMonitor overrideApplicationState](v2, "overrideApplicationState"));
    objc_autoreleasePoolPop(v3);
    return (-[WiFiUserInteractionMonitor overrideApplicationState](v2, "overrideApplicationState") >> 7) & 1;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor cellularDataStatusMap](v2, "cellularDataStatusMap"));

    if (v4)
    {
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor cellularInterfaceName](v2, "cellularInterfaceName"));
      if (sub_100025E88(v5))
      {
        LOBYTE(v2) = 0;
      }
      else
      {
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor cellularDataStatusMap](v2, "cellularDataStatusMap"));
        LOBYTE(v2) = objc_msgSend(v6, "containsObject:", CFSTR("WiFiCellularDataStatus5GAvailable"));

      }
    }
    else
    {
      LOBYTE(v2) = 0;
    }
  }
  return (char)v2;
}

- (NSSet)cellularDataStatusMap
{
  return self->_cellularDataStatusMap;
}

- (void)setSymptomBackgroundFlowProperties:(unint64_t)a3
{
  self->_symptomBackgroundFlowProperties = a3;
}

- (void)setSymptomForegroundFlowProperties:(unint64_t)a3
{
  self->_symptomForegroundFlowProperties = a3;
}

- (void)setSymptomForegroundFlowClassification:(unsigned int)a3
{
  self->_symptomForegroundFlowClassification = a3;
}

- (void)setSymptomBackgroundFlowClassification:(unsigned int)a3
{
  self->_symptomBackgroundFlowClassification = a3;
}

- (void)setAppAwareDetails:(id)a3
{
  objc_storeStrong((id *)&self->_appAwareDetails, a3);
}

- (NSMutableArray)clients
{
  return self->_clients;
}

- (BOOL)isRealTimeAppActive
{
  void *v3;
  _BOOL8 v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  if (-[WiFiUserInteractionMonitor overrideApplicationState](self, "overrideApplicationState"))
  {
    v3 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: using overridden application state as %llu", "-[WiFiUserInteractionMonitor isRealTimeAppActive]", -[WiFiUserInteractionMonitor overrideApplicationState](self, "overrideApplicationState"));
    objc_autoreleasePoolPop(v3);
    return (-[WiFiUserInteractionMonitor overrideApplicationState](self, "overrideApplicationState") >> 6) & 1;
  }
  else if (-[WiFiUserInteractionMonitor isWiFiCallInProgress](self, "isWiFiCallInProgress")
         || (v5 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor rtTrafficAgent](self, "rtTrafficAgent")),
             v6 = objc_msgSend(v5, "isActive"),
             v5,
             (v6 & 1) != 0))
  {
LABEL_17:
    LOBYTE(v4) = 1;
  }
  else
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor runningForegroundApps](self, "runningForegroundApps"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allObjects"));

    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(v8);
          if (-[WiFiUserInteractionMonitor hasRealTimeAppProperty:](self, "hasRealTimeAppProperty:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i)))
          {

            goto LABEL_17;
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v10)
          continue;
        break;
      }
    }

    LOBYTE(v4) = -[WiFiUserInteractionMonitor _isSymptomTrackingRtTrafficForFlowNamed:withProperties:andClassification:](self, "_isSymptomTrackingRtTrafficForFlowNamed:withProperties:andClassification:", CFSTR("foreground"), -[WiFiUserInteractionMonitor symptomForegroundFlowProperties](self, "symptomForegroundFlowProperties"), -[WiFiUserInteractionMonitor symptomForegroundFlowClassification](self, "symptomForegroundFlowClassification"));
  }
  return v4;
}

- (BOOL)hasRealTimeAppProperty:(id)a3
{
  id v4;
  unsigned int v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  dispatch_semaphore_t v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  dispatch_time_t v16;
  void *v17;
  void *v18;
  _QWORD block[4];
  id v20;
  NSObject *v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v4 = a3;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = sub_10002FB48;
  v32 = sub_10002FA14;
  v33 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  if (!-[WiFiUserInteractionMonitor isSetupCompleted](self, "isSetupCompleted"))
    goto LABEL_7;
  v5 = !-[WiFiUserInteractionMonitor isFirstUserUnlocked](self, "isFirstUserUnlocked");
  if (!v4)
    LOBYTE(v5) = 1;
  if ((v5 & 1) != 0)
  {
LABEL_7:
    v10 = 0;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor appAttributes](self, "appAttributes"));
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", v4));
    v8 = (void *)v29[5];
    v29[5] = v7;

    v9 = (void *)v29[5];
    if (v9)
    {
      v10 = objc_msgSend(v9, "BOOLValue");
    }
    else
    {
      if (objc_opt_class(LSApplicationRecord))
      {
        v12 = dispatch_semaphore_create(0);
        v13 = objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor internalQueue](self, "internalQueue"));
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10016E408;
        block[3] = &unk_100233588;
        v14 = v4;
        v20 = v14;
        v22 = &v24;
        v23 = &v28;
        v15 = v12;
        v21 = v15;
        dispatch_async(v13, block);

        v16 = dispatch_time(0, 10000000);
        if (dispatch_semaphore_wait(v15, v16))
        {
          v17 = objc_autoreleasePoolPush();
          if (qword_10026DD20)
            objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: timed out waiting for LSApplicationRecord", "-[WiFiUserInteractionMonitor hasRealTimeAppProperty:]");
          objc_autoreleasePoolPop(v17);
        }
        else if (v29[5])
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor appAttributes](self, "appAttributes"));
          objc_msgSend(v18, "setObject:forKey:", v29[5], v14);

        }
      }
      v10 = *((_BYTE *)v25 + 24) != 0;
    }
  }
  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);

  return v10;
}

- (BOOL)isSetupCompleted
{
  void *v3;
  void *v4;
  unsigned int v5;
  const char *v6;

  if (&_BYSetupAssistantNeedsToRun && !-[WiFiUserInteractionMonitor setupCompleted](self, "setupCompleted"))
  {
    -[WiFiUserInteractionMonitor setSetupCompleted:](self, "setSetupCompleted:", BYSetupAssistantNeedsToRun() ^ 1);
    v3 = objc_autoreleasePoolPush();
    v4 = (void *)qword_10026DD20;
    if (qword_10026DD20)
    {
      v5 = -[WiFiUserInteractionMonitor setupCompleted](self, "setupCompleted");
      v6 = "not completed";
      if (v5)
        v6 = "completed";
      objc_msgSend(v4, "WFLog:message:", 3, "%s: Setup is %s", "-[WiFiUserInteractionMonitor isSetupCompleted]", v6);
    }
    objc_autoreleasePoolPop(v3);
  }
  else
  {
    -[WiFiUserInteractionMonitor setSetupCompleted:](self, "setSetupCompleted:", 1);
  }
  return -[WiFiUserInteractionMonitor setupCompleted](self, "setupCompleted");
}

- (BOOL)setupCompleted
{
  return self->_setupCompleted;
}

- (void)setSetupCompleted:(BOOL)a3
{
  self->_setupCompleted = a3;
}

- (BOOL)isFirstUserUnlocked
{
  return self->_isFirstUserUnlocked;
}

- (NSMutableDictionary)appAttributes
{
  return self->_appAttributes;
}

- (unsigned)symptomForegroundFlowClassification
{
  return self->_symptomForegroundFlowClassification;
}

- (unint64_t)symptomForegroundFlowProperties
{
  return self->_symptomForegroundFlowProperties;
}

- (BOOL)isWiFiCallInProgress
{
  void *v4;
  unsigned __int8 v5;

  if (-[WiFiUserInteractionMonitor wifiCallInProgress](self, "wifiCallInProgress"))
    return 1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor rtTrafficAgent](self, "rtTrafficAgent"));
  v5 = objc_msgSend(v4, "isActive");

  return v5;
}

- (WiFiUserInteractionMonitorNetworkAgent)rtTrafficAgent
{
  return self->_rtTrafficAgent;
}

- (BOOL)wifiCallInProgress
{
  return self->_wifiCallInProgress;
}

- (BOOL)_isSymptomTrackingRtTrafficForFlowNamed:(id)a3 withProperties:(unint64_t)a4 andClassification:(unsigned int)a5
{
  return (a5 & 0x1F) != 0;
}

- (BOOL)isInHomeScreen
{
  void *v3;
  _BOOL8 v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  if (-[WiFiUserInteractionMonitor overrideApplicationState](self, "overrideApplicationState"))
  {
    v3 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: using overridden application state as %llu", "-[WiFiUserInteractionMonitor isInHomeScreen]", -[WiFiUserInteractionMonitor overrideApplicationState](self, "overrideApplicationState"));
    objc_autoreleasePoolPop(v3);
    return (-[WiFiUserInteractionMonitor overrideApplicationState](self, "overrideApplicationState") >> 2) & 1;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor runningForegroundApps](self, "runningForegroundApps"));
    v6 = objc_msgSend(v5, "count");

    if (v6)
    {
      v17 = 0u;
      v18 = 0u;
      v15 = 0u;
      v16 = 0u;
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor runningForegroundApps](self, "runningForegroundApps"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allObjects"));

      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v16;
        while (2)
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(_QWORD *)v16 != v11)
              objc_enumerationMutation(v8);
            if (!+[WiFiUserInteractionMonitor checkIfMatchesHomeBundleIds:](WiFiUserInteractionMonitor, "checkIfMatchesHomeBundleIds:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i)))
            {
              LOBYTE(v4) = 0;
              goto LABEL_16;
            }
          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
          if (v10)
            continue;
          break;
        }
      }
      LOBYTE(v4) = 1;
LABEL_16:

    }
    else
    {
      v13 = objc_autoreleasePoolPush();
      if (qword_10026DD20)
        objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: no runningForegroundApps", "-[WiFiUserInteractionMonitor isInHomeScreen]");
      objc_autoreleasePoolPop(v13);
      LOBYTE(v4) = 1;
    }
  }
  return v4;
}

- (NSMutableSet)runningForegroundApps
{
  return self->_runningForegroundApps;
}

- (unint64_t)overrideApplicationState
{
  return self->_overrideApplicationState;
}

- (void)setWifiL3PPS:(unint64_t)a3
{
  self->_wifiL3PPS = a3;
}

- (void)setWifiL3MBPS:(double)a3
{
  self->_wifiL3MBPS = a3;
}

- (void)setWifiIfTotalPackets:(unint64_t)a3
{
  self->_wifiIfTotalPackets = a3;
}

- (void)setWifiIfTotalBytes:(unint64_t)a3
{
  self->_wifiIfTotalBytes = a3;
}

- (void)setPeriodicTasksLastRanAt:(id)a3
{
  objc_storeStrong((id *)&self->_periodicTasksLastRanAt, a3);
}

- (void)setCellularIfTotalPackets:(unint64_t)a3
{
  self->_cellularIfTotalPackets = a3;
}

- (void)setCellularIfTotalBytes:(unint64_t)a3
{
  self->_cellularIfTotalBytes = a3;
}

- (BOOL)isMediaPlaying
{
  return self->_isMediaPlaying;
}

- (BOOL)isCarPlay
{
  return self->_isCarPlay;
}

- (BOOL)isAirplayActiveOverInfra
{
  return self->_isAirplayActiveOverInfra;
}

- (id)_initPrivate
{
  WiFiUserInteractionMonitor *v2;
  void *v3;
  WiFiUserInteractionMonitor *v4;
  dispatch_queue_attr_t v5;
  NSObject *v6;
  dispatch_queue_t v7;
  void *v8;
  void *v9;
  void *f;
  void *v11;
  WiFiUserInteractionMonitorNetworkAgent *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *internalQueue;
  void *v27;
  _QWORD handler[4];
  WiFiUserInteractionMonitor *v29;
  _QWORD block[4];
  WiFiUserInteractionMonitor *v31;
  objc_super v32;

  v32.receiver = self;
  v32.super_class = (Class)WiFiUserInteractionMonitor;
  v2 = -[WiFiUserInteractionMonitor init](&v32, "init");
  if (!v2)
    goto LABEL_25;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  -[WiFiUserInteractionMonitor setClients:](v2, "setClients:", v3);

  v4 = (WiFiUserInteractionMonitor *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor clients](v2, "clients"));
  if (!v4)
    goto LABEL_21;
  v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = dispatch_queue_create("com.apple.wifid.WiFiUserInteractionMonitor", v6);
  -[WiFiUserInteractionMonitor setInternalQueue:](v2, "setInternalQueue:", v7);

  v4 = (WiFiUserInteractionMonitor *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor internalQueue](v2, "internalQueue"));
  if (!v4)
    goto LABEL_21;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  -[WiFiUserInteractionMonitor setMonitoredInterfaceNames:](v2, "setMonitoredInterfaceNames:", v8);

  v4 = (WiFiUserInteractionMonitor *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor monitoredInterfaceNames](v2, "monitoredInterfaceNames"));
  if (!v4)
    goto LABEL_21;
  -[WiFiUserInteractionMonitor setAnyCallInProgress:](v2, "setAnyCallInProgress:", 0);
  -[WiFiUserInteractionMonitor setWifiCallInProgress:](v2, "setWifiCallInProgress:", 0);
  -[WiFiUserInteractionMonitor setCallHostedOnThisDevice:](v2, "setCallHostedOnThisDevice:", 0);
  -[WiFiUserInteractionMonitor setIsCarPlay:](v2, "setIsCarPlay:", 0);
  -[WiFiUserInteractionMonitor setIsMediaPlaying:](v2, "setIsMediaPlaying:", 0);
  -[WiFiUserInteractionMonitor setIsAirplayActiveOverInfra:](v2, "setIsAirplayActiveOverInfra:", 0);
  if (&_managed_event_fetch)
  {
    if (!notify_register_mach_port(kSymptomManagedEventWiFiAppAwareNotification, &v2->_managedEventNotifyPort, 0, &v2->_managedEventNotifyToken))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor internalQueue](v2, "internalQueue"));
      f = (void *)dispatch_mach_create_f("com.apple.wifid.WiFiUserInteractionMonitor", v9, v2, sub_10002F940);
      -[WiFiUserInteractionMonitor setManagedEventDispatchPort:](v2, "setManagedEventDispatchPort:", f);

      v4 = (WiFiUserInteractionMonitor *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor managedEventDispatchPort](v2, "managedEventDispatchPort"));
      if (!v4)
        goto LABEL_21;
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor managedEventDispatchPort](v2, "managedEventDispatchPort"));
      dispatch_mach_connect(v11, -[WiFiUserInteractionMonitor managedEventNotifyPort](v2, "managedEventNotifyPort"), 0, 0);

      goto LABEL_9;
    }
LABEL_25:
    v4 = 0;
    goto LABEL_21;
  }
LABEL_9:
  -[WiFiUserInteractionMonitor setAppAwareDetails:](v2, "setAppAwareDetails:", 0);
  v12 = -[WiFiUserInteractionMonitorNetworkAgent initWithUUID:andDescription:]([WiFiUserInteractionMonitorNetworkAgent alloc], "initWithUUID:andDescription:", CFSTR("A2CB4344-1CC7-47EF-8D25-FB68B047620F"), CFSTR("APPLE80211KEY_REAL_TIME_MEDIA_TRAFFIC_UUID"));
  -[WiFiUserInteractionMonitor setRtTrafficAgent:](v2, "setRtTrafficAgent:", v12);

  v4 = (WiFiUserInteractionMonitor *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor rtTrafficAgent](v2, "rtTrafficAgent"));
  if (!v4)
    goto LABEL_21;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor rtTrafficAgent](v2, "rtTrafficAgent"));
  objc_msgSend(v13, "registerStateChangeCallback:withCallbackContext:", &stru_100233538, v2);

  notify_register_check("com.apple.airport.userNotification", &dword_10026DC90);
  -[WiFiUserInteractionMonitor setNavigating:](v2, "setNavigating:", 0);
  if (!objc_opt_class(GEONavigationListener))
    goto LABEL_13;
  v14 = objc_alloc((Class)GEONavigationListener);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor internalQueue](v2, "internalQueue"));
  v16 = objc_msgSend(v14, "initWithQueue:", v15);
  -[WiFiUserInteractionMonitor setNavigationListener:](v2, "setNavigationListener:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor navigationListener](v2, "navigationListener"));
  if (!v17)
  {
    v27 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "%s: unable to create navigation listener", "-[WiFiUserInteractionMonitor _initPrivate]");
    objc_autoreleasePoolPop(v27);
    goto LABEL_25;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor navigationListener](v2, "navigationListener"));
  objc_msgSend(v18, "setDelegate:", v2);

LABEL_13:
  if (objc_opt_class(CXCallObserver) && NSClassFromString(CFSTR("CXCallObserver")))
  {
    v19 = objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor internalQueue](v2, "internalQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10016CFA0;
    block[3] = &unk_10022E8F8;
    v31 = v2;
    dispatch_async(v19, block);

  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  -[WiFiUserInteractionMonitor setRunningForegroundApps:](v2, "setRunningForegroundApps:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  -[WiFiUserInteractionMonitor setRunningNetworkingApps:](v2, "setRunningNetworkingApps:", v21);

  -[WiFiUserInteractionMonitor setSetupCompleted:](v2, "setSetupCompleted:", 0);
  -[WiFiUserInteractionMonitor setInitialSetupCompleted:](v2, "setInitialSetupCompleted:", 0);
  v2->_ctServerConnectionRef = 0;
  if (&__CTServerConnectionCreateWithIdentifier)
  {
    v2->_ctServerConnectionRef = (__CTServerConnection *)_CTServerConnectionCreateWithIdentifier(kCFAllocatorDefault, CFSTR("com.apple.wifid.WiFiUserInteractionMonitor"), 0, 0);
    v22 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: created a CT server connection %p", "-[WiFiUserInteractionMonitor _initPrivate]", v2->_ctServerConnectionRef);
    objc_autoreleasePoolPop(v22);
  }
  -[WiFiUserInteractionMonitor setCellularL3MBPS:](v2, "setCellularL3MBPS:", 0.0);
  -[WiFiUserInteractionMonitor setCellularL3PPS:](v2, "setCellularL3PPS:", 0);
  -[WiFiUserInteractionMonitor setCellularIfTotalBytes:](v2, "setCellularIfTotalBytes:", 0);
  -[WiFiUserInteractionMonitor setCellularIfTotalPackets:](v2, "setCellularIfTotalPackets:", 0);
  -[WiFiUserInteractionMonitor setWifiL3MBPS:](v2, "setWifiL3MBPS:", 0.0);
  -[WiFiUserInteractionMonitor setWifiL3PPS:](v2, "setWifiL3PPS:", 0);
  -[WiFiUserInteractionMonitor setWifiIfTotalBytes:](v2, "setWifiIfTotalBytes:", 0);
  -[WiFiUserInteractionMonitor setWifiIfTotalPackets:](v2, "setWifiIfTotalPackets:", 0);
  -[WiFiUserInteractionMonitor setWifiIfTotalInputBytes:](v2, "setWifiIfTotalInputBytes:", 0);
  -[WiFiUserInteractionMonitor setWifiIfTotalOutputBytes:](v2, "setWifiIfTotalOutputBytes:", 0);
  -[WiFiUserInteractionMonitor setWifiIfTotalInputPackets:](v2, "setWifiIfTotalInputPackets:", 0);
  -[WiFiUserInteractionMonitor setWifiIfTotalOutputPackets:](v2, "setWifiIfTotalOutputPackets:", 0);
  -[WiFiUserInteractionMonitor setPeriodicTasksLastRanAt:](v2, "setPeriodicTasksLastRanAt:", 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  -[WiFiUserInteractionMonitor setOverrideNetworkState:](v2, "setOverrideNetworkState:", v23);

  -[WiFiUserInteractionMonitor setIsFirstUserUnlocked:](v2, "setIsFirstUserUnlocked:", 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  -[WiFiUserInteractionMonitor setAppAttributes:](v2, "setAppAttributes:", v24);

  -[WiFiUserInteractionMonitor setGameNotifyToken:](v2, "setGameNotifyToken:", 0);
  internalQueue = v2->_internalQueue;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10016D020;
  handler[3] = &unk_100233560;
  v4 = v2;
  v29 = v4;
  notify_register_dispatch("com.apple.system.console_mode_changed", &v2->_gameNotifyToken, internalQueue, handler);
  v2 = v29;
LABEL_21:

  return v4;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __CTServerConnection *ctServerConnectionRef;
  objc_super v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor managedEventDispatchPort](self, "managedEventDispatchPort"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor managedEventDispatchPort](self, "managedEventDispatchPort"));
    dispatch_mach_cancel();

  }
  if (-[WiFiUserInteractionMonitor managedEventNotifyToken](self, "managedEventNotifyToken"))
  {
    notify_cancel(-[WiFiUserInteractionMonitor managedEventNotifyToken](self, "managedEventNotifyToken"));
    -[WiFiUserInteractionMonitor setManagedEventNotifyToken:](self, "setManagedEventNotifyToken:", 0);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor callObserver](self, "callObserver"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor callObserver](self, "callObserver"));
    objc_msgSend(v6, "setDelegate:queue:", 0, 0);

    -[WiFiUserInteractionMonitor setCallObserver:](self, "setCallObserver:", 0);
  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor monitoredInterfaceNames](self, "monitoredInterfaceNames"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allObjects"));

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v24;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v24 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor rtTrafficAgent](self, "rtTrafficAgent"));

        if (v14)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor rtTrafficAgent](self, "rtTrafficAgent"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "registration"));
          objc_msgSend(v16, "removeNetworkAgentFromInterfaceNamed:", v13);

        }
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v10);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor monitoredInterfaceNames](self, "monitoredInterfaceNames"));
  objc_msgSend(v17, "removeAllObjects");

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v18, "removeObserver:", self);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor clients](self, "clients"));
  objc_msgSend(v19, "removeAllObjects");

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor overrideNetworkState](self, "overrideNetworkState"));
  objc_msgSend(v20, "removeAllObjects");

  ctServerConnectionRef = self->_ctServerConnectionRef;
  if (ctServerConnectionRef)
    CFRelease(ctServerConnectionRef);
  v22.receiver = self;
  v22.super_class = (Class)WiFiUserInteractionMonitor;
  -[WiFiUserInteractionMonitor dealloc](&v22, "dealloc");
}

- (__CTServerConnection)ctServerConnection
{
  return self->_ctServerConnectionRef;
}

- (void)startMonitoringInterface:(id)a3
{
  void *v4;
  unsigned __int8 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  if (v10)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor monitoredInterfaceNames](self, "monitoredInterfaceNames"));
    v5 = objc_msgSend(v4, "containsObject:", v10);

    if ((v5 & 1) == 0)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor monitoredInterfaceNames](self, "monitoredInterfaceNames"));
      objc_msgSend(v6, "addObject:", v10);

      v7 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor rtTrafficAgent](self, "rtTrafficAgent"));
      if (v7)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor rtTrafficAgent](self, "rtTrafficAgent"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "registration"));
        objc_msgSend(v9, "addNetworkAgentToInterfaceNamed:", v10);

      }
    }
  }

}

- (void)registerStateChangeCallback:(id)a3 withCallbackContext:(void *)a4
{
  void *v6;
  void *v7;
  id v8;
  WiFiUserInteractionMonitorClient *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = objc_autoreleasePoolPush();
  v7 = (void *)qword_10026DD20;
  if (qword_10026DD20)
  {
    v8 = objc_retainBlock(v11);
    objc_msgSend(v7, "WFLog:message:", 3, "%s: callback %@, context %@", "-[WiFiUserInteractionMonitor registerStateChangeCallback:withCallbackContext:]", v8, a4);

  }
  objc_autoreleasePoolPop(v6);
  v9 = objc_alloc_init(WiFiUserInteractionMonitorClient);
  -[WiFiUserInteractionMonitorClient setCallback:](v9, "setCallback:", v11);
  -[WiFiUserInteractionMonitorClient setContext:](v9, "setContext:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor clients](self, "clients"));
  objc_msgSend(v10, "addObject:", v9);

}

- (void)unregisterStateChangeCallback:(void *)a3
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *i;
  void *v11;
  id v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor clients](self, "clients", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (!v6)
  {
    v8 = v5;
    goto LABEL_13;
  }
  v7 = v6;
  v8 = 0;
  v9 = *(_QWORD *)v15;
  do
  {
    for (i = 0; i != v7; i = (char *)i + 1)
    {
      if (*(_QWORD *)v15 != v9)
        objc_enumerationMutation(v5);
      v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
      if (objc_msgSend(v11, "context") == a3)
      {
        v12 = v11;

        v8 = v12;
      }
    }
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  }
  while (v7);

  if (v8)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor clients](self, "clients"));
    objc_msgSend(v13, "removeObject:", v8);

LABEL_13:
  }
}

- (void)setCurrentDisplayState:(BOOL)a3 andLockState:(BOOL)a4
{
  _BOOL8 v4;

  v4 = a4;
  -[WiFiUserInteractionMonitor setIsDisplayOn:](self, "setIsDisplayOn:", a3);
  -[WiFiUserInteractionMonitor setIsDeviceLocked:](self, "setIsDeviceLocked:", v4);
  if (!-[WiFiUserInteractionMonitor isDeviceLocked](self, "isDeviceLocked")
    && -[WiFiUserInteractionMonitor isDisplayOn](self, "isDisplayOn"))
  {
    -[WiFiUserInteractionMonitor setIsFirstUserUnlocked:](self, "setIsFirstUserUnlocked:", 1);
  }
  -[WiFiUserInteractionMonitor _notifyCaptiveWithApplicationState:](self, "_notifyCaptiveWithApplicationState:", -[WiFiUserInteractionMonitor _applicationNotifyState](self, "_applicationNotifyState"));
}

- (void)setOverrideApplicationState:(unint64_t)a3
{
  void *v5;

  if (-[WiFiUserInteractionMonitor overrideApplicationState](self, "overrideApplicationState") != a3)
  {
    v5 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: setting override state to %llu", "-[WiFiUserInteractionMonitor setOverrideApplicationState:]", a3);
    objc_autoreleasePoolPop(v5);
    self->_overrideApplicationState = a3;
    -[WiFiUserInteractionMonitor _notifyCaptiveWithApplicationState:](self, "_notifyCaptiveWithApplicationState:", -[WiFiUserInteractionMonitor overrideApplicationState](self, "overrideApplicationState"));
  }
}

- (void)updateOverrideNetworkState:(id)a3 overrideValue:(unint64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  NSLog(CFSTR("updateOverrideNetworkState: ssid %@ state 0x%llx\n"), v10, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor overrideNetworkState](self, "overrideNetworkState"));
  v7 = v6;
  if (a4)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a4));
    objc_msgSend(v7, "setObject:forKey:", v8, v10);

LABEL_5:
    goto LABEL_6;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v10));

  if (v9)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor overrideNetworkState](self, "overrideNetworkState"));
    objc_msgSend(v7, "removeObjectForKey:", v10);
    goto LABEL_5;
  }
LABEL_6:

}

- (void)resetOverrideStates
{
  -[WiFiUserInteractionMonitor setOverrideApplicationState:](self, "setOverrideApplicationState:", 0);
  -[WiFiUserInteractionMonitor _notifyCaptiveWithApplicationState:](self, "_notifyCaptiveWithApplicationState:", -[WiFiUserInteractionMonitor _applicationNotifyState](self, "_applicationNotifyState"));
}

- (void)resetOverrideNetworkStates
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor overrideNetworkState](self, "overrideNetworkState"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor overrideNetworkState](self, "overrideNetworkState"));
    objc_msgSend(v4, "removeAllObjects");

    v5 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    -[WiFiUserInteractionMonitor setOverrideNetworkState:](self, "setOverrideNetworkState:", v5);

  }
}

- (void)dumpOverrideNetworkState
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor overrideNetworkState](self, "overrideNetworkState"));

  if (v3)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor overrideNetworkState](self, "overrideNetworkState"));
    NSLog(CFSTR("%s: overrideNetworkState %@\n"), "-[WiFiUserInteractionMonitor dumpOverrideNetworkState]", v4);

  }
}

- (void)resetBackgroundApps
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor runningNetworkingApps](self, "runningNetworkingApps"));
  objc_msgSend(v2, "removeAllObjects");

}

- (BOOL)isPriorityNetwork:(__WiFiNetwork *)a3
{
  const void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  BOOL v15;

  v5 = sub_10002B088(a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor overrideNetworkState](self, "overrideNetworkState"));
  if (v7
    && (v8 = (void *)v7,
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor overrideNetworkState](self, "overrideNetworkState")),
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", v6)),
        v10,
        v9,
        v8,
        v10))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor overrideNetworkState](self, "overrideNetworkState"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", v6));
    v13 = objc_msgSend(v12, "unsignedLongLongValue");

    v14 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: using overridden isPriorityNetwork state as 0x%llx", "-[WiFiUserInteractionMonitor isPriorityNetwork:]", v13);
    objc_autoreleasePoolPop(v14);
    v15 = v13 & 1;
  }
  else
  {
    v15 = sub_1000CF858((uint64_t)a3);
  }

  return v15;
}

- (BOOL)isPublicNetwork:(__WiFiNetwork *)a3
{
  CFDictionaryRef *v3;
  const void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;

  v3 = (CFDictionaryRef *)a3;
  v5 = sub_10002B088(a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor overrideNetworkState](self, "overrideNetworkState"));
  if (v7
    && (v8 = (void *)v7,
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor overrideNetworkState](self, "overrideNetworkState")),
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", v6)),
        v10,
        v9,
        v8,
        v10))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor overrideNetworkState](self, "overrideNetworkState"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", v6));
    v13 = (unint64_t)objc_msgSend(v12, "unsignedLongLongValue");

    v14 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: using overridden isPublicNetwork state as 0x%llx", "-[WiFiUserInteractionMonitor isPublicNetwork:]", v13);
    objc_autoreleasePoolPop(v14);
    v3 = (CFDictionaryRef *)((v13 >> 1) & 1);
  }
  else
  {
    LOBYTE(v3) = sub_1000CF9B0(v3) != 0;
  }

  return (char)v3;
}

- (BOOL)isLowQualityNetwork:(__WiFiNetwork *)a3
{
  uint64_t v3;
  const void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;

  v3 = (uint64_t)a3;
  v5 = sub_10002B088(a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor overrideNetworkState](self, "overrideNetworkState"));
  if (v7
    && (v8 = (void *)v7,
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor overrideNetworkState](self, "overrideNetworkState")),
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", v6)),
        v10,
        v9,
        v8,
        v10))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor overrideNetworkState](self, "overrideNetworkState"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", v6));
    v13 = (unint64_t)objc_msgSend(v12, "unsignedLongLongValue");

    v14 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: using overridden isLowQualityNetwork state as 0x%llx", "-[WiFiUserInteractionMonitor isLowQualityNetwork:]", v13);
    objc_autoreleasePoolPop(v14);
    v3 = (v13 >> 2) & 1;
  }
  else
  {
    LOBYTE(v3) = sub_1000CF9F0(v3);
  }

  return v3;
}

- (BOOL)isInitialSetupCompleted
{
  BOOL v3;
  uint64_t v4;
  void *v5;
  void *v6;
  unsigned int v7;
  const char *v8;

  if (&_BYSetupAssistantNeedsToRun)
    v3 = &_BYSetupAssistantHasCompletedInitialRun == 0;
  else
    v3 = 1;
  if (v3 || -[WiFiUserInteractionMonitor initialSetupCompleted](self, "initialSetupCompleted"))
  {
    -[WiFiUserInteractionMonitor setInitialSetupCompleted:](self, "setInitialSetupCompleted:", 1);
  }
  else
  {
    if ((BYSetupAssistantHasCompletedInitialRun() & 1) != 0)
      v4 = 1;
    else
      v4 = BYSetupAssistantNeedsToRun() ^ 1;
    -[WiFiUserInteractionMonitor setInitialSetupCompleted:](self, "setInitialSetupCompleted:", v4);
    v5 = objc_autoreleasePoolPush();
    v6 = (void *)qword_10026DD20;
    if (qword_10026DD20)
    {
      v7 = -[WiFiUserInteractionMonitor initialSetupCompleted](self, "initialSetupCompleted");
      v8 = "not completed";
      if (v7)
        v8 = "completed";
      objc_msgSend(v6, "WFLog:message:", 3, "%s: Initial setup is %s", "-[WiFiUserInteractionMonitor isInitialSetupCompleted]", v8);
    }
    objc_autoreleasePoolPop(v5);
  }
  return -[WiFiUserInteractionMonitor initialSetupCompleted](self, "initialSetupCompleted");
}

- (BOOL)isUsingSustainedWiFiData
{
  double v3;

  -[WiFiUserInteractionMonitor wifiL3MBPS](self, "wifiL3MBPS");
  return v3 > 2.0 || -[WiFiUserInteractionMonitor wifiL3PPS](self, "wifiL3PPS") > 0x28;
}

- (BOOL)isAskToJoinAllowed
{
  void *v3;
  BOOL v4;
  uint64_t v6;
  uint64_t v7;

  if (!-[WiFiUserInteractionMonitor isSetupCompleted](self, "isSetupCompleted"))
  {
    v3 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: setup not completed. Not allowing ask-to-join.", "-[WiFiUserInteractionMonitor isAskToJoinAllowed]", v6, v7);
    goto LABEL_8;
  }
  if (-[WiFiUserInteractionMonitor navigating](self, "navigating")
    || -[WiFiUserInteractionMonitor anyCallInProgress](self, "anyCallInProgress"))
  {
    v3 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: navigating(%d) or in call(%d). Not allowing ask-to-join.", "-[WiFiUserInteractionMonitor isAskToJoinAllowed]", -[WiFiUserInteractionMonitor navigating](self, "navigating"), -[WiFiUserInteractionMonitor anyCallInProgress](self, "anyCallInProgress"));
LABEL_8:
    v4 = 0;
    goto LABEL_9;
  }
  if (!-[WiFiUserInteractionMonitor isNetworkingAppInForeground](self, "isNetworkingAppInForeground"))
    return 0;
  v3 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: in FG networking app. Allowing atj.", "-[WiFiUserInteractionMonitor isAskToJoinAllowed]");
  v4 = 1;
LABEL_9:
  objc_autoreleasePoolPop(v3);
  return v4;
}

- (BOOL)isPersonalHotspotRecommendationAllowed
{
  void *v3;
  uint64_t v5;
  uint64_t v6;

  if (!-[WiFiUserInteractionMonitor isSetupCompleted](self, "isSetupCompleted"))
  {
    v3 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: setup not completed. Not allowing recommendation.", "-[WiFiUserInteractionMonitor isPersonalHotspotRecommendationAllowed]", v5, v6);
    goto LABEL_8;
  }
  if (-[WiFiUserInteractionMonitor navigating](self, "navigating")
    || -[WiFiUserInteractionMonitor anyCallInProgress](self, "anyCallInProgress"))
  {
    v3 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: navigating(%d) or in call(%d). Not allowing recommendation.", "-[WiFiUserInteractionMonitor isPersonalHotspotRecommendationAllowed]", -[WiFiUserInteractionMonitor navigating](self, "navigating"), -[WiFiUserInteractionMonitor anyCallInProgress](self, "anyCallInProgress"));
LABEL_8:
    objc_autoreleasePoolPop(v3);
    return 0;
  }
  if (-[WiFiUserInteractionMonitor isCellularInexpensive5G](self, "isCellularInexpensive5G"))
  {
    v3 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: cellular is 5G and inexpensive. Not allowing recommendation.", "-[WiFiUserInteractionMonitor isPersonalHotspotRecommendationAllowed]", v5, v6);
    goto LABEL_8;
  }
  if (-[WiFiUserInteractionMonitor isDeviceLocked](self, "isDeviceLocked")
    || !-[WiFiUserInteractionMonitor isDisplayOn](self, "isDisplayOn"))
  {
    v3 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: Device locked or Display is OFF. Not allowing recommendation.", "-[WiFiUserInteractionMonitor isPersonalHotspotRecommendationAllowed]", v5, v6);
    goto LABEL_8;
  }
  return 1;
}

+ (id)getHomeBundleIds
{
  return &off_100254148;
}

+ (BOOL)checkIfMatchesHomeBundleIds:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v3 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[WiFiUserInteractionMonitor getHomeBundleIds](WiFiUserInteractionMonitor, "getHomeBundleIds"));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v4);
        v8 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lowercaseString", (_QWORD)v11));
        LOBYTE(v8) = objc_msgSend(v9, "containsString:", v8);

        if ((v8 & 1) != 0)
        {
          LOBYTE(v5) = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return (char)v5;
}

+ (id)getKnownNonNetworkingBundleIds
{
  return &off_100254160;
}

+ (BOOL)checkIfMatchesNonNetworkingBundleIds:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v3 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[WiFiUserInteractionMonitor getKnownNonNetworkingBundleIds](WiFiUserInteractionMonitor, "getKnownNonNetworkingBundleIds"));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v12 != v7)
        objc_enumerationMutation(v4);
      v9 = 1;
      if (objc_msgSend(v3, "rangeOfString:options:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8), 1, (_QWORD)v11) != (id)0x7FFFFFFFFFFFFFFFLL)
        break;
      if (v6 == (id)++v8)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v9 = 0;
  }

  return v9;
}

- (BOOL)isAnyCallInProgress
{
  void *v4;
  unsigned __int8 v5;

  if (-[WiFiUserInteractionMonitor anyCallInProgress](self, "anyCallInProgress"))
    return 1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor rtTrafficAgent](self, "rtTrafficAgent"));
  v5 = objc_msgSend(v4, "isActive");

  return v5;
}

- (BOOL)isCoPresenceActive
{
  void *v3;
  void *v4;
  BOOL v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor rtTrafficAgent](self, "rtTrafficAgent"));
  if (objc_msgSend(v3, "avcMinJB"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor rtTrafficAgent](self, "rtTrafficAgent"));
    v5 = (unint64_t)objc_msgSend(v4, "avcMinJB") < 0x15;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isCarModeActive
{
  if (-[WiFiUserInteractionMonitor carModeActive](self, "carModeActive"))
    return 1;
  else
    return -[WiFiUserInteractionMonitor navigating](self, "navigating");
}

- (BOOL)canTrigger11axPerfStudyForForegroundFlows
{
  return -[WiFiUserInteractionMonitor _canTrigger11axPerfStudyForFlowNamed:withProperties:andClassification:](self, "_canTrigger11axPerfStudyForFlowNamed:withProperties:andClassification:", CFSTR("foreground"), -[WiFiUserInteractionMonitor symptomForegroundFlowProperties](self, "symptomForegroundFlowProperties"), -[WiFiUserInteractionMonitor symptomForegroundFlowClassification](self, "symptomForegroundFlowClassification"));
}

- (BOOL)canTrigger11axPerfStudyForBackgroundFlows
{
  return -[WiFiUserInteractionMonitor _canTrigger11axPerfStudyForFlowNamed:withProperties:andClassification:](self, "_canTrigger11axPerfStudyForFlowNamed:withProperties:andClassification:", CFSTR("background"), -[WiFiUserInteractionMonitor symptomBackgroundFlowProperties](self, "symptomBackgroundFlowProperties"), -[WiFiUserInteractionMonitor symptomBackgroundFlowClassification](self, "symptomBackgroundFlowClassification"));
}

- (BOOL)_canTrigger11axPerfStudyForFlowNamed:(id)a3 withProperties:(unint64_t)a4 andClassification:(unsigned int)a5
{
  char v5;
  unsigned int v6;
  id v7;
  void *v8;
  int v9;
  unsigned int v10;
  unsigned int v11;
  BOOL v13;

  v5 = a5;
  v6 = a4;
  v7 = a3;
  if ((v5 & 0x1F) != 0)
  {
    v8 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: app-aware flow:%@ latency:0x%x jitter:0x%x lossTolerance:0x%x duration:0x%x requiredBandwidth:0x%x preferredBandwidth:0x%x", "-[WiFiUserInteractionMonitor _canTrigger11axPerfStudyForFlowNamed:withProperties:andClassification:]", v7, v6, (v6 >> 1), (v6 >> 2), (v6 >> 3), (v6 >> 4), (v6 >> 5));
    objc_autoreleasePoolPop(v8);
    v9 = ((v6 >> 2) & 1) + ((v6 >> 3) & 1);
    v10 = v9 + ((v6 >> 1) & 1);
    v11 = v9 + ((v6 >> 4) & 1);
    v13 = v10 > 2 || v11 > 2 || (v6 & 0xC00) != 0;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)_updateCallState
{
  WiFiUserInteractionMonitor *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  int v7;
  char v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unsigned int v23;
  void *v24;
  const char *v25;
  void *v26;
  char v27;
  void *v28;
  id v29;
  id v30;
  uint64_t v31;
  void *j;
  void *v33;
  void (**v34)(_QWORD, _QWORD, _QWORD);
  uint64_t v35;
  WiFiUserInteractionMonitor *v36;
  id v37;
  id obj;
  void *v39;
  void *v40;
  int v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];
  _BYTE v56[128];

  v2 = self;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor callObserver](self, "callObserver"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "calls"));

  obj = v4;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v41 = 0;
    v8 = 0;
    v9 = *(_QWORD *)v51;
    v35 = *(_QWORD *)v51;
    v36 = v2;
    do
    {
      v10 = 0;
      v37 = v6;
      do
      {
        if (*(_QWORD *)v51 != v9)
          objc_enumerationMutation(obj);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * (_QWORD)v10), "hasConnected"))
        {
          v40 = v10;
          v11 = objc_autoreleasePoolPush();
          if (qword_10026DD20)
            objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: call has connected", "-[WiFiUserInteractionMonitor _updateCallState]");
          objc_autoreleasePoolPop(v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter callCenterWithQueue:](TUCallCenter, "callCenterWithQueue:", v2->_internalQueue));
          v46 = 0u;
          v47 = 0u;
          v48 = 0u;
          v49 = 0u;
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "currentCalls"));
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
          if (v14)
          {
            v15 = v14;
            v39 = v12;
            v16 = *(_QWORD *)v47;
            do
            {
              for (i = 0; i != v15; i = (char *)i + 1)
              {
                if (*(_QWORD *)v47 != v16)
                  objc_enumerationMutation(v13);
                v18 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)i);
                v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "providerContext"));
                v20 = objc_autoreleasePoolPush();
                if (qword_10026DD20)
                  objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: call context %@", "-[WiFiUserInteractionMonitor _updateCallState]", v19);
                objc_autoreleasePoolPop(v20);
                v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKey:", CFSTR("kCallSubType")));
                if (objc_msgSend(v21, "isEqualToString:", CFSTR("kCallSubTypeWifi")))
                {
                  v22 = objc_autoreleasePoolPush();
                  if (qword_10026DD20)
                    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: call is connected over WiFi", "-[WiFiUserInteractionMonitor _updateCallState]");
                  objc_autoreleasePoolPop(v22);
                  v41 = 1;
                }
                v23 = objc_msgSend(v18, "isHostedOnCurrentDevice");
                v24 = objc_autoreleasePoolPush();
                if (qword_10026DD20)
                {
                  if (v23)
                    v25 = "%s: Call is hosted on this device";
                  else
                    v25 = "%s: Call is not hosted on this device";
                  objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, v25, "-[WiFiUserInteractionMonitor _updateCallState]");
                }
                v7 |= v23;
                objc_autoreleasePoolPop(v24);

              }
              v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
            }
            while (v15);
            v8 = 1;
            v2 = v36;
            v6 = v37;
            v9 = v35;
            v12 = v39;
          }

          v10 = v40;
        }
        v10 = (char *)v10 + 1;
      }
      while (v10 != v6);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
    v41 = 0;
    v8 = 0;
  }

  if (-[WiFiUserInteractionMonitor anyCallInProgress](v2, "anyCallInProgress") && (v8 & 1) == 0)
  {
    v26 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: call has ended", "-[WiFiUserInteractionMonitor _updateCallState]");
    objc_autoreleasePoolPop(v26);
  }
  v27 = v8 ^ -[WiFiUserInteractionMonitor anyCallInProgress](v2, "anyCallInProgress");
  if ((v27 & 1) != 0)
    -[WiFiUserInteractionMonitor setAnyCallInProgress:](v2, "setAnyCallInProgress:", v8 & 1);
  if (((v41 ^ -[WiFiUserInteractionMonitor wifiCallInProgress](v2, "wifiCallInProgress")) & 1) != 0)
  {
    -[WiFiUserInteractionMonitor setWifiCallInProgress:](v2, "setWifiCallInProgress:", v41 & 1);
    if ((v7 & 1) == -[WiFiUserInteractionMonitor callHostedOnThisDevice](v2, "callHostedOnThisDevice"))
      goto LABEL_46;
  }
  else if (((v7 ^ -[WiFiUserInteractionMonitor callHostedOnThisDevice](v2, "callHostedOnThisDevice")) & 1) == 0)
  {
    if ((v27 & 1) == 0)
      return;
    goto LABEL_46;
  }
  -[WiFiUserInteractionMonitor setCallHostedOnThisDevice:](v2, "setCallHostedOnThisDevice:", v7 & 1);
LABEL_46:
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor clients](v2, "clients"));
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v42, v54, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v43;
    do
    {
      for (j = 0; j != v30; j = (char *)j + 1)
      {
        if (*(_QWORD *)v43 != v31)
          objc_enumerationMutation(v28);
        v33 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)j);
        v34 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "callback"));
        ((void (**)(_QWORD, id, uint64_t))v34)[2](v34, objc_msgSend(v33, "context"), 2);

      }
      v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v42, v54, 16);
    }
    while (v30);
  }

}

- (BOOL)_isCellularDataAllowedForApp:(id)a3
{
  id v4;
  BOOL v5;
  __CTServerConnection *ctServerConnectionRef;
  const __CFBoolean *Value;
  const __CFBoolean *v8;
  CFTypeID v9;
  void *v11;
  CFDictionaryRef theDict;

  v4 = a3;
  theDict = 0;
  v5 = 1;
  if (v4)
  {
    ctServerConnectionRef = self->_ctServerConnectionRef;
    if (ctServerConnectionRef)
    {
      _CTServerConnectionCopyCellularUsagePolicy(ctServerConnectionRef, v4, &theDict);
      if (theDict)
      {
        Value = (const __CFBoolean *)CFDictionaryGetValue(theDict, kCTCellularUsagePolicyDataAllowed);
        if (Value)
        {
          v8 = Value;
          v9 = CFGetTypeID(Value);
          if (v9 == CFBooleanGetTypeID() && !CFBooleanGetValue(v8))
          {
            v11 = objc_autoreleasePoolPush();
            if (qword_10026DD20)
              objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: cellular data usage not allowed for %@", "-[WiFiUserInteractionMonitor _isCellularDataAllowedForApp:]", v4);
            objc_autoreleasePoolPop(v11);
            v5 = 0;
          }
          else
          {
            v5 = 1;
          }
        }
        CFRelease(theDict);
      }
    }
  }

  return v5;
}

- (id)_stateInfo
{
  void *v3;
  void *v4;
  void *v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;
  const __CFString *v24;
  const __CFString *v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  void *v29;
  const __CFString *v30;
  const __CFString *v31;
  const __CFString *v32;
  const __CFString *v33;
  void *v34;
  void *v35;
  const __CFString *v36;
  const __CFString *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%p@%@"), self, v4));
  v6 = (objc_class *)objc_opt_class(self);
  v7 = NSStringFromClass(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor appAwareDetails](self, "appAwareDetails"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("AppAwareDetails"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("0x%llx"), -[WiFiUserInteractionMonitor symptomForegroundFlowProperties](self, "symptomForegroundFlowProperties")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("ForegroundFlows"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("0x%llx"), -[WiFiUserInteractionMonitor symptomBackgroundFlowProperties](self, "symptomBackgroundFlowProperties")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("BackgroundFlows"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("0x%x"), -[WiFiUserInteractionMonitor symptomForegroundFlowClassification](self, "symptomForegroundFlowClassification")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("ForegroundClassification"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("0x%x"), -[WiFiUserInteractionMonitor symptomBackgroundFlowClassification](self, "symptomBackgroundFlowClassification")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("BackgroundClassification"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor runningForegroundApps](self, "runningForegroundApps"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("ForegroundApps"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor runningNetworkingApps](self, "runningNetworkingApps"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("NetworkingApps"));

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor monitoredInterfaceNames](self, "monitoredInterfaceNames"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("InterfaceNames"));

  if (-[WiFiUserInteractionMonitor isSetupCompleted](self, "isSetupCompleted"))
    v17 = CFSTR("YES");
  else
    v17 = CFSTR("NO");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("IsSetupCompleted"));
  if (-[WiFiUserInteractionMonitor navigating](self, "navigating"))
    v18 = CFSTR("YES");
  else
    v18 = CFSTR("NO");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("IsNavigating"));
  if (-[WiFiUserInteractionMonitor isInHomeScreen](self, "isInHomeScreen"))
    v19 = CFSTR("YES");
  else
    v19 = CFSTR("NO");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("IsInHomeScreen"));
  if (-[WiFiUserInteractionMonitor isAnyCallInProgress](self, "isAnyCallInProgress"))
    v20 = CFSTR("YES");
  else
    v20 = CFSTR("NO");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("IsAnyCallInProgress"));
  if (-[WiFiUserInteractionMonitor isWiFiCallInProgress](self, "isWiFiCallInProgress"))
    v21 = CFSTR("YES");
  else
    v21 = CFSTR("NO");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("IsWiFiCallInProgress"));
  if (-[WiFiUserInteractionMonitor isCallHostedOnThisDevice](self, "isCallHostedOnThisDevice"))
    v22 = CFSTR("YES");
  else
    v22 = CFSTR("NO");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("IsCallHostedOnThisDevice"));
  if (-[WiFiUserInteractionMonitor isInNonNetworkingApp](self, "isInNonNetworkingApp"))
    v23 = CFSTR("YES");
  else
    v23 = CFSTR("NO");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("IsInNonNetworkingApp"));
  if (-[WiFiUserInteractionMonitor isNetworkingAppInForeground](self, "isNetworkingAppInForeground"))
    v24 = CFSTR("YES");
  else
    v24 = CFSTR("NO");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("IsNetworkingAppInForeground"));
  if (-[WiFiUserInteractionMonitor isRealTimeAppActive](self, "isRealTimeAppActive"))
    v25 = CFSTR("YES");
  else
    v25 = CFSTR("NO");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("IsRealTimeAppActive"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor rtTrafficAgent](self, "rtTrafficAgent"));
  if (objc_msgSend(v26, "isActive"))
    v27 = CFSTR("YES");
  else
    v27 = CFSTR("NO");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("IsAVConferenceActive"));

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor rtTrafficAgent](self, "rtTrafficAgent"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%llums"), objc_msgSend(v28, "avcMinJB")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("AVCMinJitterBuffer"));

  if (-[WiFiUserInteractionMonitor isCoPresenceActive](self, "isCoPresenceActive"))
    v30 = CFSTR("YES");
  else
    v30 = CFSTR("NO");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("IsCoPresenceActive"));
  if (-[WiFiUserInteractionMonitor isCellularDataUsable](self, "isCellularDataUsable"))
    v31 = CFSTR("YES");
  else
    v31 = CFSTR("NO");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v31, CFSTR("IsCellularDataUsable"));
  if (-[WiFiUserInteractionMonitor isUsingSustainedCellularData](self, "isUsingSustainedCellularData"))
    v32 = CFSTR("YES");
  else
    v32 = CFSTR("NO");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("IsUsingCellularData"));
  if (-[WiFiUserInteractionMonitor isCellularInexpensive5G](self, "isCellularInexpensive5G"))
    v33 = CFSTR("YES");
  else
    v33 = CFSTR("NO");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("IsCellularInexpensive5G"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor overrideNetworkState](self, "overrideNetworkState"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "description"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v35, CFSTR("overrideNetworkState"));

  if (-[WiFiUserInteractionMonitor isAskToJoinAllowed](self, "isAskToJoinAllowed"))
    v36 = CFSTR("YES");
  else
    v36 = CFSTR("NO");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v36, CFSTR("IsAskToJoinAllowed"));
  if (-[WiFiUserInteractionMonitor isNetworkRecommendationAllowed](self, "isNetworkRecommendationAllowed"))
    v37 = CFSTR("YES");
  else
    v37 = CFSTR("NO");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v37, CFSTR("IsNetworkRecommendationAllowed"));
  -[WiFiUserInteractionMonitor cellularL3MBPS](self, "cellularL3MBPS");
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%.2fMBps/%llupps"), v38, -[WiFiUserInteractionMonitor cellularL3PPS](self, "cellularL3PPS")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v39, CFSTR("CellularUsage"));

  -[WiFiUserInteractionMonitor wifiL3MBPS](self, "wifiL3MBPS");
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%.2fMBps/%llupps"), v40, -[WiFiUserInteractionMonitor wifiL3PPS](self, "wifiL3PPS")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v41, CFSTR("WiFiUsage"));

  return v3;
}

- (NSString)description
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserInteractionMonitor _stateInfo](self, "_stateInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "description"));

  return (NSString *)v3;
}

- (void)navigationListener:(id)a3 didChangeNavigationState:(unint64_t)a4 transportType:(int)a5
{
  unsigned int v7;
  void *v8;
  unint64_t v9;
  void *v10;
  id v11;

  v11 = a3;
  if ((a4 == 2) != -[WiFiUserInteractionMonitor navigating](self, "navigating"))
  {
    if (a4 == 2)
      v7 = 0;
    else
      v7 = -[WiFiUserInteractionMonitor navigating](self, "navigating");
    v8 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: navigating %d", "-[WiFiUserInteractionMonitor navigationListener:didChangeNavigationState:transportType:]", a4 == 2);
    objc_autoreleasePoolPop(v8);
    -[WiFiUserInteractionMonitor setNavigating:](self, "setNavigating:", a4 == 2);
    if (v7)
    {
      if (-[WiFiUserInteractionMonitor overrideApplicationState](self, "overrideApplicationState"))
      {
        v9 = -[WiFiUserInteractionMonitor overrideApplicationState](self, "overrideApplicationState");
        v10 = objc_autoreleasePoolPush();
        if (qword_10026DD20)
          objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: using overridden application state as %llu to notify captive", "-[WiFiUserInteractionMonitor navigationListener:didChangeNavigationState:transportType:]", -[WiFiUserInteractionMonitor overrideApplicationState](self, "overrideApplicationState"));
        objc_autoreleasePoolPop(v10);
      }
      else
      {
        v9 = -[WiFiUserInteractionMonitor _applicationNotifyState](self, "_applicationNotifyState");
      }
      -[WiFiUserInteractionMonitor _notifyCaptiveWithApplicationState:](self, "_notifyCaptiveWithApplicationState:", v9);
    }
  }

}

- (void)callObserver:(id)a3 callChanged:(id)a4
{
  -[WiFiUserInteractionMonitor _updateCallState](self, "_updateCallState", a3, a4);
}

- (void)setIsCarPlay:(BOOL)a3
{
  self->_isCarPlay = a3;
}

- (void)setIsMediaPlaying:(BOOL)a3
{
  self->_isMediaPlaying = a3;
}

- (void)setIsAirplayActiveOverInfra:(BOOL)a3
{
  self->_isAirplayActiveOverInfra = a3;
}

- (unsigned)symptomBackgroundFlowClassification
{
  return self->_symptomBackgroundFlowClassification;
}

- (GEONavigationListener)navigationListener
{
  return self->_navigationListener;
}

- (void)setNavigationListener:(id)a3
{
  objc_storeStrong((id *)&self->_navigationListener, a3);
}

- (void)setIsDisplayOn:(BOOL)a3
{
  self->_isDisplayOn = a3;
}

- (void)setIsDeviceLocked:(BOOL)a3
{
  self->_isDeviceLocked = a3;
}

- (void)setNavigating:(BOOL)a3
{
  self->_navigating = a3;
}

- (unsigned)managedEventNotifyPort
{
  return self->_managedEventNotifyPort;
}

- (void)setManagedEventNotifyPort:(unsigned int)a3
{
  self->_managedEventNotifyPort = a3;
}

- (int)managedEventNotifyToken
{
  return self->_managedEventNotifyToken;
}

- (void)setManagedEventNotifyToken:(int)a3
{
  self->_managedEventNotifyToken = a3;
}

- (OS_dispatch_mach)managedEventDispatchPort
{
  return self->_managedEventDispatchPort;
}

- (void)setManagedEventDispatchPort:(id)a3
{
  objc_storeStrong((id *)&self->_managedEventDispatchPort, a3);
}

- (NSDictionary)appAwareDetails
{
  return self->_appAwareDetails;
}

- (void)setRtTrafficAgent:(id)a3
{
  objc_storeStrong((id *)&self->_rtTrafficAgent, a3);
}

- (CXCallObserver)callObserver
{
  return self->_callObserver;
}

- (void)setCallObserver:(id)a3
{
  objc_storeStrong((id *)&self->_callObserver, a3);
}

- (void)setAnyCallInProgress:(BOOL)a3
{
  self->_anyCallInProgress = a3;
}

- (void)setWifiCallInProgress:(BOOL)a3
{
  self->_wifiCallInProgress = a3;
}

- (BOOL)callHostedOnThisDevice
{
  return self->_callHostedOnThisDevice;
}

- (void)setCallHostedOnThisDevice:(BOOL)a3
{
  self->_callHostedOnThisDevice = a3;
}

- (void)setRunningForegroundApps:(id)a3
{
  objc_storeStrong((id *)&self->_runningForegroundApps, a3);
}

- (void)setRunningNetworkingApps:(id)a3
{
  objc_storeStrong((id *)&self->_runningNetworkingApps, a3);
}

- (BOOL)initialSetupCompleted
{
  return self->_initialSetupCompleted;
}

- (void)setInitialSetupCompleted:(BOOL)a3
{
  self->_initialSetupCompleted = a3;
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (void)setInternalQueue:(id)a3
{
  objc_storeStrong((id *)&self->_internalQueue, a3);
}

- (void)setClients:(id)a3
{
  objc_storeStrong((id *)&self->_clients, a3);
}

- (void)setMonitoredInterfaceNames:(id)a3
{
  objc_storeStrong((id *)&self->_monitoredInterfaceNames, a3);
}

- (NSMutableDictionary)overrideNetworkState
{
  return self->_overrideNetworkState;
}

- (void)setOverrideNetworkState:(id)a3
{
  objc_storeStrong((id *)&self->_overrideNetworkState, a3);
}

- (void)setCellularL3PPS:(unint64_t)a3
{
  self->_cellularL3PPS = a3;
}

- (void)setCellularL3MBPS:(double)a3
{
  self->_cellularL3MBPS = a3;
}

- (unint64_t)wifiL3PPS
{
  return self->_wifiL3PPS;
}

- (double)wifiL3MBPS
{
  return self->_wifiL3MBPS;
}

- (unint64_t)wifiIfTotalInputPackets
{
  return self->_wifiIfTotalInputPackets;
}

- (void)setWifiIfTotalInputPackets:(unint64_t)a3
{
  self->_wifiIfTotalInputPackets = a3;
}

- (unint64_t)wifiIfTotalOutputPackets
{
  return self->_wifiIfTotalOutputPackets;
}

- (void)setWifiIfTotalOutputPackets:(unint64_t)a3
{
  self->_wifiIfTotalOutputPackets = a3;
}

- (unint64_t)wifiIfTotalInputBytes
{
  return self->_wifiIfTotalInputBytes;
}

- (void)setWifiIfTotalInputBytes:(unint64_t)a3
{
  self->_wifiIfTotalInputBytes = a3;
}

- (unint64_t)wifiIfTotalOutputBytes
{
  return self->_wifiIfTotalOutputBytes;
}

- (void)setWifiIfTotalOutputBytes:(unint64_t)a3
{
  self->_wifiIfTotalOutputBytes = a3;
}

- (void)setIsFirstUserUnlocked:(BOOL)a3
{
  self->_isFirstUserUnlocked = a3;
}

- (void)setAppAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_appAttributes, a3);
}

- (int)gameNotifyToken
{
  return self->_gameNotifyToken;
}

- (void)setGameNotifyToken:(int)a3
{
  self->_gameNotifyToken = a3;
}

- (BOOL)carModeActive
{
  return self->_carModeActive;
}

- (void)setCarModeActive:(BOOL)a3
{
  self->_carModeActive = a3;
}

- (BOOL)isInGameMode
{
  return self->_isInGameMode;
}

- (void)setIsInGameMode:(BOOL)a3
{
  self->_isInGameMode = a3;
}

- (void)setCellularInterfaceName:(id)a3
{
  objc_storeStrong((id *)&self->_cellularInterfaceName, a3);
}

- (void)setCellularDataStatusMap:(id)a3
{
  objc_storeStrong((id *)&self->_cellularDataStatusMap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellularDataStatusMap, 0);
  objc_storeStrong((id *)&self->_cellularInterfaceName, 0);
  objc_storeStrong((id *)&self->_appAttributes, 0);
  objc_storeStrong((id *)&self->_overrideNetworkState, 0);
  objc_storeStrong((id *)&self->_periodicTasksLastRanAt, 0);
  objc_storeStrong((id *)&self->_monitoredInterfaceNames, 0);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_runningNetworkingApps, 0);
  objc_storeStrong((id *)&self->_runningForegroundApps, 0);
  objc_storeStrong((id *)&self->_callObserver, 0);
  objc_storeStrong((id *)&self->_rtTrafficAgent, 0);
  objc_storeStrong((id *)&self->_appAwareDetails, 0);
  objc_storeStrong((id *)&self->_managedEventDispatchPort, 0);
  objc_storeStrong((id *)&self->_navigationListener, 0);
}

@end
