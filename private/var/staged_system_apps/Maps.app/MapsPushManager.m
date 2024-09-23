@implementation MapsPushManager

+ (id)defaultManager
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100684840;
  block[3] = &unk_1011ACF48;
  block[4] = a1;
  if (qword_1014D2D40 != -1)
    dispatch_once(&qword_1014D2D40, block);
  return (id)qword_1014D2D38;
}

- (MapsPushManager)init
{
  MapsPushManager *v2;
  IDSService *v3;
  IDSService *service;
  void *v5;
  MapsPushManager *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MapsPushManager;
  v2 = -[MapsPushManager init](&v8, "init");
  if (v2)
  {
    v3 = (IDSService *)objc_msgSend(objc_alloc((Class)IDSService), "initWithService:", CFSTR("com.apple.private.alloy.maps"));
    service = v2->_service;
    v2->_service = v3;

    -[IDSService addDelegate:queue:](v2->_service, "addDelegate:queue:", v2, &_dispatch_main_q);
    -[MapsPushManager _updateDevices](v2, "_updateDevices");
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSPMapsInstallState sharedState](MSPMapsInstallState, "sharedState"));
    objc_msgSend(v5, "registerMapsInstallStateObserver:", v2);

    v6 = v2;
  }

  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSPMapsInstallState sharedState](MSPMapsInstallState, "sharedState"));
  objc_msgSend(v3, "unregisterMapsInstallStateObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)MapsPushManager;
  -[MapsPushManager dealloc](&v4, "dealloc");
}

- (void)_updateDevices
{
  uint64_t Log;
  NSObject *v4;
  void *v5;
  id v6;
  id v7;
  void *i;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  MapsPushDevice *v19;
  uint64_t v20;
  NSObject *v21;
  NSArray *devices;
  MapsPushManager *v23;
  id obj;
  NSArray *v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint8_t v37[128];
  uint8_t buf[4];
  void *v39;

  v25 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v27 = DefaultLoggingSubsystem;
  Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "com.apple.Maps.devices");
  v4 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSService devices](self->_service, "devices"));
    *(_DWORD *)buf = 138412290;
    v39 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Updating devices from full list: %@", buf, 0xCu);

  }
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v23 = self;
  obj = (id)objc_claimAutoreleasedReturnValue(-[IDSService devices](self->_service, "devices"));
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v6)
  {
    v7 = v6;
    v26 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v33 != v26)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "modelIdentifier"));
        v11 = objc_msgSend(v10, "length");

        v30 = 0u;
        v31 = 0u;
        v28 = 0u;
        v29 = 0u;
        v12 = objc_msgSend(&off_101273AA0, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v29;
LABEL_10:
          v15 = 0;
          while (1)
          {
            if (*(_QWORD *)v29 != v14)
              objc_enumerationMutation(&off_101273AA0);
            v16 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v15);
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "modelIdentifier"));
            LOBYTE(v16) = objc_msgSend(v17, "hasPrefix:", v16);

            if ((v16 & 1) != 0)
              break;
            if (v13 == (id)++v15)
            {
              v13 = objc_msgSend(&off_101273AA0, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
              if (v13)
                goto LABEL_10;
              goto LABEL_16;
            }
          }
        }
        else
        {
LABEL_16:
          if (v11)
          {
            v18 = GEOFindOrCreateLog(v27, "com.apple.Maps.devices");
            v19 = (MapsPushDevice *)objc_claimAutoreleasedReturnValue(v18);
            if (os_log_type_enabled(&v19->super, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v39 = v9;
              _os_log_impl((void *)&_mh_execute_header, &v19->super, OS_LOG_TYPE_DEBUG, "Skipping device without proper modelIdentifier prefix: %@", buf, 0xCu);
            }
            goto LABEL_22;
          }
        }
        v20 = GEOFindOrCreateLog(v27, "com.apple.Maps.devices");
        v21 = objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v39 = v9;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "Adding device to list: %@", buf, 0xCu);
        }

        v19 = -[MapsPushDevice initWithIDSDevice:]([MapsPushDevice alloc], "initWithIDSDevice:", v9);
        -[NSArray addObject:](v25, "addObject:", v19);
LABEL_22:

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v7);
  }

  devices = v23->_devices;
  v23->_devices = v25;

}

- (void)pushItem:(id)a3 toDevice:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t Log;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  NSObject *v25;
  IDSService *service;
  void *v27;
  void *v28;
  unsigned __int8 v29;
  id v30;
  id v31;
  uint64_t v32;
  void *v33;
  const __CFString *v34;
  uint64_t v35;
  uint8_t buf[4];
  id v37;
  __int16 v38;
  void *v39;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v7 || (objc_msgSend(v7, "isFake") & 1) == 0)
  {
    v9 = DefaultLoggingSubsystem;
    Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "com.apple.Maps.devices");
    v11 = objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "device"));
      *(_DWORD *)buf = 138412546;
      v37 = v6;
      v38 = 2112;
      v39 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Pushing item: %@ to device %@", buf, 0x16u);

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSService accounts](self->_service, "accounts"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "anyObject"));

    if (v14)
    {
      v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "pushSubmissionData"));
      v16 = (void *)v15;
      if (v15)
      {
        v34 = CFSTR("syncedBookmarkData");
        v35 = v15;
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1));
        if (v8)
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "device"));
          v19 = (void *)IDSCopyForDevice();

        }
        else
        {
          v19 = (void *)IDSCopyIDForAccount(v14);
        }
        v24 = GEOFindOrCreateLog(v9, "com.apple.Maps.devices");
        v25 = objc_claimAutoreleasedReturnValue(v24);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v37 = v17;
          v38 = 2112;
          v39 = v19;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "Sending message: %@ to destination: %@", buf, 0x16u);
        }

        service = self->_service;
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v19));
        v32 = IDSSendMessageOptionEncryptPayloadKey;
        v33 = &__kCFBooleanTrue;
        v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1));
        v31 = 0;
        v29 = -[IDSService sendMessage:toDestinations:priority:options:identifier:error:](service, "sendMessage:toDestinations:priority:options:identifier:error:", v17, v27, 300, v28, 0, &v31);
        v30 = v31;

        if ((v29 & 1) == 0)
          NSLog(CFSTR("Error sending message: %@"), v30);

      }
      else
      {
        v22 = GEOFindOrCreateLog(v9, "com.apple.Maps.devices");
        v23 = objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v37 = v6;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "No sync data for item: %@", buf, 0xCu);
        }

        NSLog(CFSTR("ERROR: No sync data..."));
      }

    }
    else
    {
      v20 = GEOFindOrCreateLog(v9, "com.apple.Maps.devices");
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "No valid account found", buf, 2u);
      }

      NSLog(CFSTR("No valid account found..."));
    }

  }
}

- (void)propagateIDSMessageOfType:(int64_t)a3 message:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *i;
  void *v12;
  uint64_t Log;
  NSObject *v14;
  IDSService *service;
  void *v16;
  int64_t v17;
  int64_t v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  id v24;
  id obj;
  uint64_t v26;
  uint64_t v27;
  id v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  void *v35;
  uint8_t buf[4];
  NSObject *v37;
  __int16 v38;
  void *v39;
  _BYTE v40[128];
  _QWORD v41[2];
  _QWORD v42[2];

  v6 = a4;
  v7 = v6;
  if (v6)
  {
    v24 = v6;
    v41[0] = CFSTR("GenericIDSMessageData");
    v41[1] = CFSTR("GenericIDSMessageType");
    v42[0] = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
    v42[1] = v8;
    v9 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v42, v41, 2));

    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue(-[IDSService devices](self->_service, "devices"));
    v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
    if (v28)
    {
      v27 = *(_QWORD *)v31;
      v10 = DefaultLoggingSubsystem;
      v26 = IDSSendMessageOptionEncryptPayloadKey;
      do
      {
        for (i = 0; i != v28; i = (char *)i + 1)
        {
          if (*(_QWORD *)v31 != v27)
            objc_enumerationMutation(obj);
          v12 = (void *)IDSCopyForDevice(*(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i));
          Log = GEOFindOrCreateLog(v10, "com.apple.Maps.devices");
          v14 = objc_claimAutoreleasedReturnValue(Log);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            v37 = v9;
            v38 = 2112;
            v39 = v12;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Sending message: %@ to destination: %@", buf, 0x16u);
          }

          service = self->_service;
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v12));
          v17 = a3;
          v18 = -[MapsPushManager _priorityForMessageOfType:](self, "_priorityForMessageOfType:", a3);
          v34 = v26;
          v35 = &__kCFBooleanTrue;
          v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1));
          v29 = 0;
          LOBYTE(service) = -[IDSService sendMessage:toDestinations:priority:options:identifier:error:](service, "sendMessage:toDestinations:priority:options:identifier:error:", v9, v16, v18, v19, 0, &v29);
          v20 = v29;

          if ((service & 1) == 0)
          {
            v21 = GEOFindOrCreateLog(v10, "com.apple.Maps.devices");
            v22 = objc_claimAutoreleasedReturnValue(v21);
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v37 = v20;
              _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Error sending message: %@", buf, 0xCu);
            }

          }
          a3 = v17;
        }
        v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
      }
      while (v28);
    }

    v7 = v24;
  }
  else
  {
    v23 = GEOFindOrCreateLog(DefaultLoggingSubsystem, "com.apple.Maps.devices");
    v9 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Can't send nil message", buf, 2u);
    }
  }

}

- (void)_handleGenericIDSMessage:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t Log;
  NSObject *v8;
  id WeakRetained;
  id v10;
  void *v11;
  id v12;
  int v13;
  id v14;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("GenericIDSMessageType")));
  v6 = objc_msgSend(v5, "integerValue");

  if (v6 == (id)2)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "clearRAPStatusChangeNotificationWithManager:", self);
LABEL_9:

    goto LABEL_10;
  }
  if (v6 == (id)1)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v10 = objc_alloc((Class)GEORPRapInfo);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("GenericIDSMessageData")));
    v12 = objc_msgSend(v10, "initWithData:", v11);
    objc_msgSend(WeakRetained, "pushManager:receivedRAPStatusChangeNotification:", self, v12);

    goto LABEL_9;
  }
  if (!v6)
  {
    Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "com.apple.Maps.devices");
    v8 = objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v13 = 138412290;
      v14 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Received unknown generic message: %@", (uint8_t *)&v13, 0xCu);
    }

  }
LABEL_10:

}

- (int64_t)_priorityForMessageOfType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 2)
    return 200;
  else
    return 300;
}

- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6
{
  void *v7;
  void (**v8)(_QWORD, _QWORD);
  id v9;

  v9 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsPushManager devicePushTokenCompletion](self, "devicePushTokenCompletion"));

  if (v7)
  {
    v8 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[MapsPushManager devicePushTokenCompletion](self, "devicePushTokenCompletion"));
    ((void (**)(_QWORD, id))v8)[2](v8, v9);

  }
  -[MapsPushManager setDevicePushTokenCompletion:](self, "setDevicePushTokenCompletion:", 0);

}

- (void)connection:(id)a3 didFailToSendOutgoingMessage:(id)a4 error:(id)a5
{
  NSLog(CFSTR("Failed to get push token: %@"), a2, a3, a4, a5);
}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v5;
  void *v6;
  unsigned int v7;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t Log;
  NSObject *v31;
  id WeakRetained;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  void *v49;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topic"));
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.maps.icloud"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "userInfo"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("nid")));

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstObject"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "userInfo"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("prid")));

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "userInfo"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("mftoken")));

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "userInfo"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", CFSTR("aps")));

    if (v16)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "userInfo"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("aps")));

    }
    else
    {
      v18 = 0;
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "userInfo"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKey:", CFSTR("photoLiveness")));

    if (v20)
    {
      v43 = v14;
      v39 = v12;
      v40 = v10;
      v41 = v9;
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "userInfo"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("photoLiveness")));

      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("muid")));
      v24 = objc_alloc_init((Class)NSNumberFormatter);
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "numberFromString:", v23));
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[GEOMapURLBuilder URLForInternalBusiness:id:provider:](GEOMapURLBuilder, "URLForInternalBusiness:id:provider:", 0, objc_msgSend(v25, "unsignedLongValue"), 0));

      v42 = v18;
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("alert")));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("title")));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("body")));
      Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "MapsNotifications");
      v31 = objc_claimAutoreleasedReturnValue(Log);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412802;
        v45 = v28;
        v46 = 2112;
        v47 = v29;
        v48 = 2112;
        v49 = v23;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEBUG, "Did receive incoming message for ARP notification with title: %@, body: %@, and muid: %@", buf, 0x20u);
      }

      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "pushManager:receivedPhotoLivenessMUID:title:message:actionURL:", self, v23, v28, v29, v26);

      v10 = v40;
      v9 = v41;
      v12 = v39;
      goto LABEL_9;
    }
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKey:", CFSTR("category")));

    if (v33)
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("category")));
      if (objc_msgSend(v34, "isEqualToString:", CFSTR("ATTRIBUTION_NAME_CLEARED")))
      {
        v42 = v18;
        v43 = v14;
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("alert")));
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("title")));
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("body")));
        v38 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v38, "pushManager:receivedClearedPhotoAttributionNotificationWithTitle:message:", self, v36, v37);

LABEL_9:
LABEL_15:

        goto LABEL_16;
      }

    }
    -[MapsPushManager fetchProblemStatus:problemReportIDs:manifestToken:](self, "fetchProblemStatus:problemReportIDs:manifestToken:", v10, v12, v14);

    goto LABEL_15;
  }
LABEL_16:

}

- (void)setUpPushConnection
{
  unsigned int v3;
  id *v4;
  id v5;
  id v6;
  dispatch_queue_global_t global_queue;
  void *v8;
  id v9;

  v3 = -[MapsPushManager shouldUseDevAPNS](self, "shouldUseDevAPNS");
  v4 = (id *)&APSEnvironmentDevelopment;
  if (!v3)
    v4 = (id *)&APSEnvironmentProduction;
  v5 = *v4;
  v6 = objc_alloc((Class)APSConnection);
  global_queue = dispatch_get_global_queue(0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
  v9 = objc_msgSend(v6, "initWithEnvironmentName:namedDelegatePort:queue:", v5, CFSTR("com.apple.Maps.mapspushd.icloud"), v8);

  objc_msgSend(v9, "setDelegate:", self);
  -[MapsPushManager setApsConnection:](self, "setApsConnection:", v9);

}

- (BOOL)shouldUseDevAPNS
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "containerURLForSecurityApplicationGroupIdentifier:", CFSTR("group.com.apple.Maps")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "path"));
  v5 = _CFPreferencesGetAppBooleanValueWithContainer(CFSTR("__internal__PushManagerUseDevelopmentAPSEnvironment"), CFSTR("group.com.apple.Maps"), v4, 0) != 0;

  return v5;
}

- (void)setShouldUseDevAPNS:(BOOL)a3
{
  NSNumber *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "containerURLForSecurityApplicationGroupIdentifier:", CFSTR("group.com.apple.Maps")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "path"));
  _CFPreferencesSetAppValueWithContainer(CFSTR("__internal__PushManagerUseDevelopmentAPSEnvironment"), v3, CFSTR("group.com.apple.Maps"), v5);

}

- (id)devicePushToken
{
  NSObject *v3;
  void *v4;
  void *v5;
  dispatch_time_t v6;
  id v7;
  void **v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  NSObject *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = sub_100685DC4;
  v19 = sub_100685DD4;
  v20 = 0;
  v9 = _NSConcreteStackBlock;
  v10 = 3221225472;
  v11 = sub_100685DDC;
  v12 = &unk_1011BFAB8;
  v14 = &v15;
  v3 = dispatch_semaphore_create(0);
  v13 = v3;
  -[MapsPushManager setDevicePushTokenCompletion:](self, "setDevicePushTokenCompletion:", &v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSPMapsPushDaemonRemoteProxy sharedInstance](MSPMapsPushDaemonRemoteProxy, "sharedInstance", v9, v10, v11, v12));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsPushManager devicePushTokenCompletion](self, "devicePushTokenCompletion"));
  objc_msgSend(v4, "fetchDevicePushToken:", v5);

  v6 = dispatch_time(0, 1000000000);
  dispatch_semaphore_wait(v3, v6);
  -[MapsPushManager setDevicePushTokenCompletion:](self, "setDevicePushTokenCompletion:", 0);
  v7 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v7;
}

- (void)registerForMapsICloudPushTopic
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;

  if (+[MSPMapsInstallState isMapsAppInstalled](MSPMapsInstallState, "isMapsAppInstalled"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsPushManager apsConnection](self, "apsConnection"));

    if (!v3)
      -[MapsPushManager setUpPushConnection](self, "setUpPushConnection");
    v6 = CFSTR("com.apple.maps.icloud");
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v6, 1));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsPushManager apsConnection](self, "apsConnection"));
    objc_msgSend(v5, "_setEnabledTopics:", v4);

  }
}

- (id)_simulatedPlace
{
  id v2;

  v2 = objc_alloc_init((Class)GEOPDPlace);
  objc_msgSend(v2, "setMuid:", 0x8F98FC444E72B232);
  objc_msgSend(v2, "setResultProviderId:", 9902);
  objc_msgSend(v2, "setStatus:", 0);
  return v2;
}

- (id)_simulatedDetails
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = objc_alloc_init((Class)GEORPDetails);
  objc_msgSend(v3, "setDisplayStyle:", 2);
  objc_msgSend(v3, "setLocalizedTitle:", CFSTR("Location Updated"));
  objc_msgSend(v3, "setLocalizedDescription:", CFSTR("Thank you for the report you submitted on June 10, 2015. The information for the location “P T C R Jewellery Polishing” has been updated."));
  v4 = objc_alloc_init((Class)GEOMapRegion);
  objc_msgSend(v3, "setDisplayRegion:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "displayRegion"));
  objc_msgSend(v5, "setEastLng:", -0.109615239);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "displayRegion"));
  objc_msgSend(v6, "setNorthLat:", 51.5208347);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "displayRegion"));
  objc_msgSend(v7, "setSouthLat:", 51.5195643);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "displayRegion"));
  objc_msgSend(v8, "setWestLng:", -0.111656927);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MapsPushManager _simulatedPlace](self, "_simulatedPlace"));
  objc_msgSend(v3, "addPlace:", v9);

  return v3;
}

- (id)_simulatedProblemStatus
{
  id v3;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc_init((Class)GEORPProblemStatus);
  v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), rand());
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  objc_msgSend(v3, "setProblemId:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", -604800.0));
  objc_msgSend(v6, "timeIntervalSinceReferenceDate");
  objc_msgSend(v3, "setCreationDate:");

  objc_msgSend(v3, "setProblemState:", 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsPushManager _simulatedNotification](self, "_simulatedNotification"));
  objc_msgSend(v3, "setNotification:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MapsPushManager _simulatedDetails](self, "_simulatedDetails"));
  objc_msgSend(v3, "setDetails:", v8);

  return v3;
}

- (id)_simulatedNotification
{
  id v2;

  v2 = objc_alloc_init((Class)GEORPNotification);
  objc_msgSend(v2, "setLocalizedText:", CFSTR("The information for the location “P T C R Jewellery Polishing” has been updated."));
  objc_msgSend(v2, "setLocalizedTitle:", CFSTR("Problem Fixed"));
  return v2;
}

- (id)_simulatedProblemResolutionResponse
{
  id v3;
  void *v4;

  v3 = objc_alloc_init((Class)GEORPProblemStatusResponse);
  objc_msgSend(v3, "setStatusCode:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsPushManager _simulatedProblemStatus](self, "_simulatedProblemStatus"));
  objc_msgSend(v3, "addProblemStatus:", v4);

  return v3;
}

- (void)simulateProblemResolution
{
  void *v3;
  dispatch_time_t v4;
  _QWORD v5[5];
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsPushManager _simulatedProblemResolutionResponse](self, "_simulatedProblemResolutionResponse"));
  if (v3)
  {
    v4 = dispatch_time(0, 10000000000);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1006862A4;
    v5[3] = &unk_1011AC8B0;
    v5[4] = self;
    v6 = v3;
    dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, v5);

  }
}

- (void)simulateRAPStatusChange
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;

  v10 = objc_alloc_init((Class)GEORPRapNotification);
  v3 = objc_alloc_init((Class)GEOLocalizedString);
  objc_msgSend(v3, "setStringValue:", CFSTR("title: Rap status change notification"));
  v4 = objc_alloc_init((Class)GEOLocalizedString);
  objc_msgSend(v4, "setStringValue:", CFSTR("text: Rap status change notification"));
  objc_msgSend(v10, "setTitle:", v3);
  objc_msgSend(v10, "setBody:", v4);
  v5 = objc_alloc_init((Class)GEORPRapResponse);
  objc_msgSend(v5, "setNotification:", v10);
  objc_msgSend(v5, "setResponseId:", CFSTR("responseId"));
  v6 = objc_alloc_init((Class)GEORPDisplayDetails);
  v7 = objc_alloc_init((Class)GEOLocalizedString);
  objc_msgSend(v7, "setStringValue:", CFSTR("Need More Information"));
  v8 = objc_alloc_init((Class)GEOLocalizedString);
  objc_msgSend(v8, "setStringValue:", CFSTR("We're stumped! We couldn't find any information about this business. Please send us a picture of the front door and any other details that can help us respond to your report."));
  objc_msgSend(v6, "setTitle:", v7);
  objc_msgSend(v6, "setBody:", v8);
  objc_msgSend(v5, "setDisplayDetails:", v6);
  v9 = objc_alloc_init((Class)GEORPRapInfo);
  objc_msgSend(v9, "setRapResponse:", v5);
  objc_msgSend(v9, "setRapId:", CFSTR("b4977ec0-4b44-11ed-a777-b33297611d8b"));
  objc_msgSend(v9, "setRapDisplayMenu:", 3);
  -[MapsPushManager sendRAPStatusChangeNotification:](self, "sendRAPStatusChangeNotification:", v9);

}

- (void)simulateUGCPhotoSubmissionResolution
{
  uint64_t Log;
  NSObject *v4;
  id v5;
  void *v6;
  void *v7;
  dispatch_time_t v8;
  id v9;
  _QWORD block[5];
  __CFString *v11;
  __CFString *v12;
  __CFString *v13;
  id v14;
  uint8_t buf[4];
  const __CFString *v16;

  Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "MapsNotifications");
  v4 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v16 = CFSTR("2258143483938644182");
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Simulating a successful photo submission resolution for muid: %@", buf, 0xCu);
  }

  v5 = objc_alloc_init((Class)NSNumberFormatter);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "numberFromString:", CFSTR("2258143483938644182")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[GEOMapURLBuilder URLForInternalBusiness:id:provider:](GEOMapURLBuilder, "URLForInternalBusiness:id:provider:", 0, objc_msgSend(v6, "unsignedLongValue"), 0));

  v8 = dispatch_time(0, 10000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100686628;
  block[3] = &unk_1011B04A8;
  block[4] = self;
  v11 = CFSTR("2258143483938644182");
  v12 = CFSTR("Your Photos Are Live");
  v13 = CFSTR("The photos you added of Agnes Restaurant & Cheesery are now visible to everyone.");
  v14 = v7;
  v9 = v7;
  dispatch_after(v8, (dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)simulateUGCPhotoAttributionClearedNotification
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "pushManager:receivedClearedPhotoAttributionNotificationWithTitle:message:", self, CFSTR("Choose a Different Nickname"), CFSTR("The nickname you chose for photo credit isn’t available. Choose a different nickname."));

}

- (void)sendRAPStatusChangeNotification:(id)a3
{
  id v4;
  void *v5;
  id WeakRetained;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "data"));
  -[MapsPushManager propagateIDSMessageOfType:message:](self, "propagateIDSMessageOfType:message:", 1, v5);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "pushManager:receivedRAPStatusChangeNotification:", self, v4);

}

- (void)fetchProblemStatus:(id)a3 problemReportIDs:(id)a4 manifestToken:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  MapsPushManager *v26;
  id v27;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc_init((Class)GEORPProblemStatusRequest);
  objc_msgSend(v11, "setStatusNotificationId:", v10);

  v12 = objc_msgSend(v9, "mutableCopy");
  objc_msgSend(v11, "setProblemIds:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[GEORPUserCredentials _credentialsForPrimaryICloudAccount](GEORPUserCredentials, "_credentialsForPrimaryICloudAccount"));
  objc_msgSend(v11, "setUserCredentials:", v13);

  v14 = objc_alloc_init((Class)GEORPClientCapabilities);
  objc_msgSend(v11, "setClientCapabilities:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "clientCapabilities"));
  objc_msgSend(v15, "setHasConstrainedProblemStatusSize:", 0);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "clientCapabilities"));
  objc_msgSend(v16, "setHasNoOptInRequest:", 1);

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "clientCapabilities"));
  v19 = objc_msgSend(v18, "transitMarketSupport");
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "clientCapabilities"));
  objc_msgSend(v20, "setTransitMarketSupport:", v19);

  objc_msgSend(v11, "populateAnalyticsMetadata");
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[GEOUtilityService sharedService](GEOUtilityService, "sharedService"));
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100686924;
  v24[3] = &unk_1011BFB28;
  v25 = v11;
  v26 = self;
  v27 = v8;
  v22 = v8;
  v23 = v11;
  objc_msgSend(v21, "getCurrentGeoServicesState:callback:", &_dispatch_main_q, v24);

}

+ (id)fakeDevicesFromNames:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  unsigned int v11;
  const __CFString *v12;
  FakeMapsPushDevice *v13;
  id obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v3, "count")));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lowercaseString"));
        v11 = objc_msgSend(v10, "hasSuffix:", CFSTR("ipad"));

        if (v11)
          v12 = CFSTR("iPad4,1");
        else
          v12 = CFSTR("iPhone5,3");
        v13 = -[FakeMapsPushDevice initWithName:model:]([FakeMapsPushDevice alloc], "initWithName:model:", v9, v12);
        objc_msgSend(v4, "addObject:", v13);

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

  return v4;
}

- (void)service:(id)a3 activeAccountsChanged:(id)a4
{
  uint64_t Log;
  NSObject *v6;
  uint8_t v7[16];

  Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "com.apple.Maps.devices");
  v6 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Active Accounts changed", v7, 2u);
  }

  -[MapsPushManager _updateDevices](self, "_updateDevices");
}

- (void)service:(id)a3 devicesChanged:(id)a4
{
  uint64_t Log;
  NSObject *v6;
  uint8_t v7[16];

  Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "com.apple.Maps.devices");
  v6 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Devices changed", v7, 2u);
  }

  -[MapsPushManager _updateDevices](self, "_updateDevices");
}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t Log;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  unsigned __int8 v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  unsigned __int8 v31;
  uint64_t v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  NSObject *v40;
  id WeakRetained;
  uint64_t v42;
  NSObject *v43;
  uint64_t v44;
  void *v46;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  uint8_t v57[128];
  uint8_t buf[4];
  id v59;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v44 = DefaultLoggingSubsystem;
  Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "com.apple.Maps.devices");
  v14 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v59 = v11;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Received message: %@", buf, 0xCu);
  }

  v46 = v12;
  v47 = v9;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "deviceForFromID:", v12));
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v16 = v10;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "nearbyDevices"));
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v53;
LABEL_5:
    v21 = 0;
    while (1)
    {
      if (*(_QWORD *)v53 != v20)
        objc_enumerationMutation(v17);
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * v21), "uniqueID", v44));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "uniqueID"));
      v24 = objc_msgSend(v22, "isEqualToString:", v23);

      if ((v24 & 1) != 0)
        break;
      if (v19 == (id)++v21)
      {
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
        if (v19)
          goto LABEL_5;
        goto LABEL_11;
      }
    }
  }
  else
  {
LABEL_11:

    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "devices"));
    v25 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
    if (!v25)
    {
LABEL_19:

      v32 = GEOFindOrCreateLog(v44, "com.apple.Maps.devices");
      v33 = objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEBUG, "Unexpected iCloud account. Ignoring.", buf, 2u);
      }

      NSLog(CFSTR("Unexpected iCloud account. Ignoring..."));
      goto LABEL_24;
    }
    v26 = v25;
    v27 = *(_QWORD *)v49;
LABEL_13:
    v28 = 0;
    while (1)
    {
      if (*(_QWORD *)v49 != v27)
        objc_enumerationMutation(v17);
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * v28), "uniqueID", v44));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "uniqueID"));
      v31 = objc_msgSend(v29, "isEqualToString:", v30);

      if ((v31 & 1) != 0)
        break;
      if (v26 == (id)++v28)
      {
        v26 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
        if (v26)
          goto LABEL_13;
        goto LABEL_19;
      }
    }
  }

  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("GenericIDSMessageType")));
  if (v34)
  {
    -[MapsPushManager _handleGenericIDSMessage:](self, "_handleGenericIDSMessage:", v11);
LABEL_24:
    v35 = v47;
    v36 = v16;
    goto LABEL_32;
  }
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("syncedBookmarkData")));

  v36 = v16;
  if (v37)
  {
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("syncedBookmarkData")));
    v39 = GEOFindOrCreateLog(v44, "com.apple.Maps.devices");
    v40 = objc_claimAutoreleasedReturnValue(v39);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEBUG, "Passing data to delegate", buf, 2u);
    }

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "pushManager:gotPushData:", self, v38);

    v35 = v47;
  }
  else
  {
    v42 = GEOFindOrCreateLog(v44, "com.apple.Maps.devices");
    v43 = objc_claimAutoreleasedReturnValue(v42);
    v35 = v47;
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEBUG, "Unexpected message body. Ignoring.", buf, 2u);
    }

    NSLog(CFSTR("Unexpected message body. Ignoring..."));
  }
LABEL_32:

}

- (void)mapsInstallStateDidChange:(BOOL)a3
{
  void *v4;
  void *v5;
  const __CFString *v6;

  if (a3)
  {
    -[MapsPushManager registerForMapsICloudPushTopic](self, "registerForMapsICloudPushTopic");
  }
  else
  {
    v6 = CFSTR("com.apple.maps.icloud");
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v6, 1));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsPushManager apsConnection](self, "apsConnection"));
    objc_msgSend(v5, "_setIgnoredTopics:", v4);

  }
}

- (NSArray)devices
{
  return self->_devices;
}

- (MapsPushDelegate)delegate
{
  return (MapsPushDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (APSConnection)apsConnection
{
  return self->_apsConnection;
}

- (void)setApsConnection:(id)a3
{
  objc_storeStrong((id *)&self->_apsConnection, a3);
}

- (id)devicePushTokenCompletion
{
  return self->_devicePushTokenCompletion;
}

- (void)setDevicePushTokenCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_devicePushTokenCompletion, 0);
  objc_storeStrong((id *)&self->_apsConnection, 0);
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_service, 0);
}

@end
