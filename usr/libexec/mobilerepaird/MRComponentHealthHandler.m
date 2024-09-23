@implementation MRComponentHealthHandler

- (id)_init
{
  MRComponentHealthHandler *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSArray *supportedComponentAuth;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;
  _QWORD v20[13];

  v19.receiver = self;
  v19.super_class = (Class)MRComponentHealthHandler;
  v2 = -[MRComponentHealthHandler init](&v19, "init");
  if (v2)
  {
    v18 = (void *)objc_opt_new(CRNFCStatus);
    v20[0] = v18;
    v17 = (void *)objc_opt_new(CRUWBStatus);
    v20[1] = v17;
    v16 = (void *)objc_opt_new(CRFaceIDStatus);
    v20[2] = v16;
    v15 = (void *)objc_opt_new(CRAudioStatus);
    v20[3] = v15;
    v3 = (void *)objc_opt_new(CRAudioCodecStatus);
    v20[4] = v3;
    v4 = (void *)objc_opt_new(CRRCamStatus);
    v20[5] = v4;
    v5 = (void *)objc_opt_new(CRBasebandStatus);
    v20[6] = v5;
    v6 = (void *)objc_opt_new(CRCameraAuth);
    v20[7] = v6;
    v7 = (void *)objc_opt_new(CRBluetoothStatus);
    v20[8] = v7;
    v8 = (void *)objc_opt_new(CRWifiStatus);
    v20[9] = v8;
    v9 = (void *)objc_opt_new(CRBatteryStatus);
    v20[10] = v9;
    v10 = (void *)objc_opt_new(CRDisplayStatus);
    v20[11] = v10;
    v11 = (void *)objc_opt_new(CRTouchIDStatus);
    v20[12] = v11;
    v12 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v20, 13));
    supportedComponentAuth = v2->supportedComponentAuth;
    v2->supportedComponentAuth = (NSArray *)v12;

  }
  return v2;
}

+ (id)sharedInstance
{
  if (qword_10001EAA8 != -1)
    dispatch_once(&qword_10001EAA8, &stru_1000186D8);
  return (id)qword_10001EAA0;
}

- (void)postComponentStatusEventFor:(unint64_t)a3 status:(unint64_t)a4 withReply:(id)a5
{
  void *v7;
  void (**v8)(id, uint64_t, _QWORD);

  v8 = (void (**)(id, uint64_t, _QWORD))a5;
  if (a3 - 3 <= 9)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[__objc2_class sharedSingleton](*off_100018720[a3 - 3], "sharedSingleton"));
    objc_msgSend(v7, "postComponentStatus:", a4);

  }
  v8[2](v8, 1, 0);

}

- (void)getCurrentSystemHealthStatusForComponentsInternal:(unint64_t)a3 WithReply:(id)a4
{
  void (**v6)(id, uint64_t, id, _QWORD);
  NSMutableDictionary *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  NSArray *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  void *v19;
  id v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  id v25;
  void (**v26)(id, uint64_t, id, _QWORD);
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[16];
  _BYTE v32[128];

  v6 = (void (**)(id, uint64_t, id, _QWORD))a4;
  v7 = objc_opt_new(NSMutableDictionary);
  v8 = (void *)MGCopyAnswer(CFSTR("DeviceClassNumber"), 0);
  v9 = objc_msgSend(v8, "intValue");

  v10 = (void *)objc_opt_new(CRRepairHistory);
  v11 = objc_msgSend(v10, "isSupportedIPad");

  if (v11)
  {
    v12 = handleForCategory(0);
    v9 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Enabling Parts and Service History for supported iPads", buf, 2u);
    }

    if (a3 != -1)
    {
      v13 = 0;
      goto LABEL_22;
    }
  }
  else
  {
    v13 = 0;
    if (a3 != -1 || (_DWORD)v9 != 1)
      goto LABEL_22;
  }
  v26 = v6;
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v14 = self->supportedComponentAuth;
  v15 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(_QWORD *)v28 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
        v20 = objc_msgSend(v19, "copyComponentStatus");
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "componentName"));

        if (v21)
        {
          v22 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v20));
          v23 = v22;
          if (!v22)
          {
            v9 = objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
            v23 = v9;
          }
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "componentName"));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v23, v24);

          if (!v22)
        }
      }
      v16 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v16);
  }

  v13 = 1;
  v6 = v26;
LABEL_22:
  v25 = -[NSMutableDictionary copy](v7, "copy");
  v6[2](v6, v13, v25, 0);

}

- (void)sendFailedComponentStats
{
  NSArray *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = self->supportedComponentAuth;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i);
        if (((unint64_t)objc_msgSend(v8, "copyComponentStatus", (_QWORD)v10) & 0x8000000000000000) != 0)
        {
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "componentName"));
          -[MRComponentHealthHandler sendDailyAnalyticsForModuleType:](self, "sendDailyAnalyticsForModuleType:", v9);

        }
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

- (void)sendDailyAnalyticsForModuleType:(id)a3
{
  id v3;
  _QWORD v4[4];
  id v5;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000AE68;
  v4[3] = &unk_100018700;
  v5 = a3;
  v3 = v5;
  AnalyticsSendEventLazy(CFSTR("com.apple.corerepair.UI"), v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->supportedComponentAuth, 0);
}

@end
