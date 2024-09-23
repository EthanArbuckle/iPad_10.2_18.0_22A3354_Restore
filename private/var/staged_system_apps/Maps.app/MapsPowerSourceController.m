@implementation MapsPowerSourceController

+ (MapsPowerSourceController)sharedController
{
  if (qword_1014D3ED8 != -1)
    dispatch_once(&qword_1014D3ED8, &stru_1011E2078);
  return (MapsPowerSourceController *)(id)qword_1014D3ED0;
}

- (MapsPowerSourceController)init
{
  id v2;
  id v3;
  NSObject *v4;
  dispatch_queue_attr_t v5;
  NSObject *v6;
  dispatch_queue_attr_t v7;
  NSObject *v8;
  dispatch_queue_t v9;
  void *v10;
  dispatch_queue_attr_t v11;
  NSObject *v12;
  dispatch_queue_attr_t v13;
  NSObject *v14;
  dispatch_queue_t v15;
  void *v16;
  id v17;
  void *v18;
  _QWORD *v19;
  uint32_t v20;
  id v21;
  NSObject *v22;
  NSObject *v23;
  const char *v24;
  NSObject *v25;
  os_log_type_t v26;
  NSObject *v27;
  _QWORD block[4];
  id v30;
  _QWORD v31[4];
  id v32;
  id location;
  objc_super v34;
  uint8_t buf[4];
  id v36;

  v34.receiver = self;
  v34.super_class = (Class)MapsPowerSourceController;
  v2 = -[MapsPowerSourceController init](&v34, "init");
  if (v2)
  {
    v3 = sub_100ADD44C();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      v36 = v2;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Initializing", buf, 0xCu);
    }

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    v7 = dispatch_queue_attr_make_with_qos_class(v6, QOS_CLASS_UTILITY, 0);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    v9 = dispatch_queue_create("com.apple.Maps.MapsPowerSourceController.callback", v8);
    v10 = (void *)*((_QWORD *)v2 + 2);
    *((_QWORD *)v2 + 2) = v9;

    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    v13 = dispatch_queue_attr_make_with_qos_class(v12, QOS_CLASS_UTILITY, 0);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    v15 = dispatch_queue_create("com.apple.Maps.MapsPowerSourceController.isolation", v14);
    v16 = (void *)*((_QWORD *)v2 + 3);
    *((_QWORD *)v2 + 3) = v15;

    v17 = objc_msgSend(objc_alloc((Class)GEOObserverHashTable), "initWithProtocol:queue:", &OBJC_PROTOCOL___MapsPowerSourceObserver, *((_QWORD *)v2 + 2));
    v18 = (void *)*((_QWORD *)v2 + 4);
    *((_QWORD *)v2 + 4) = v17;

    objc_initWeak(&location, v2);
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_100ADD48C;
    v31[3] = &unk_1011BCB28;
    objc_copyWeak(&v32, &location);
    v19 = objc_retainBlock(v31);
    v20 = notify_register_dispatch("com.apple.system.powersources", (int *)v2 + 2, *((dispatch_queue_t *)v2 + 2), v19);
    v21 = sub_100ADD44C();
    v22 = objc_claimAutoreleasedReturnValue(v21);
    v23 = v22;
    if (v20)
    {
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134349056;
        v36 = v2;
        v24 = "[%{public}p] Failed to register for power source notifications";
        v25 = v23;
        v26 = OS_LOG_TYPE_ERROR;
LABEL_9:
        _os_log_impl((void *)&_mh_execute_header, v25, v26, v24, buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      v36 = v2;
      v24 = "[%{public}p] Successfully registered for power source notification";
      v25 = v23;
      v26 = OS_LOG_TYPE_INFO;
      goto LABEL_9;
    }

    v27 = *((_QWORD *)v2 + 2);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100ADD4B8;
    block[3] = &unk_1011AD260;
    objc_copyWeak(&v30, &location);
    dispatch_async(v27, block);
    objc_destroyWeak(&v30);

    objc_destroyWeak(&v32);
    objc_destroyWeak(&location);
  }
  return (MapsPowerSourceController *)v2;
}

- (void)dealloc
{
  id v3;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[4];
  MapsPowerSourceController *v7;

  v3 = sub_100ADD44C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Deallocating", buf, 0xCu);
  }

  notify_cancel(self->_anyPowerSourceToken);
  v5.receiver = self;
  v5.super_class = (Class)MapsPowerSourceController;
  -[MapsPowerSourceController dealloc](&v5, "dealloc");
}

- (void)registerObserver:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  int v7;
  MapsPowerSourceController *v8;
  __int16 v9;
  id v10;

  v4 = a3;
  v5 = sub_100ADD44C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = 134349314;
    v8 = self;
    v9 = 2112;
    v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[%{public}p] Registering observer: %@", (uint8_t *)&v7, 0x16u);
  }

  -[GEOObserverHashTable registerObserver:](self->_powerSourceObservers, "registerObserver:", v4);
}

- (void)unregisterObserver:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  int v7;
  MapsPowerSourceController *v8;
  __int16 v9;
  id v10;

  v4 = a3;
  v5 = sub_100ADD44C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = 134349314;
    v8 = self;
    v9 = 2112;
    v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[%{public}p] Unregistering observer: %@", (uint8_t *)&v7, 0x16u);
  }

  -[GEOObserverHashTable unregisterObserver:](self->_powerSourceObservers, "unregisterObserver:", v4);
}

- (int64_t)chargingState
{
  NSObject *isolationQueue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100ADD7D0;
  v5[3] = &unk_1011ADF48;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_updateChargingState
{
  id v3;
  NSObject *v4;
  const void *v5;
  const void *v6;
  const __CFArray *v7;
  const __CFArray *v8;
  CFIndex v9;
  const void *ValueAtIndex;
  CFDictionaryRef v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  const char *v20;
  void *v21;
  unsigned int v22;
  CFDictionaryRef v23;
  id v24;
  NSObject *v25;
  void *v26;
  unsigned __int8 v27;
  id v28;
  id v29;
  NSObject *v30;
  NSObject *v31;
  id v32;
  NSObject *v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *isolationQueue;
  id v38;
  NSObject *v39;
  __CFString *v40;
  __CFString *v41;
  uint64_t v42;
  char v43;
  _QWORD v44[7];
  _QWORD v45[5];
  _QWORD block[5];
  uint8_t v47[4];
  MapsPowerSourceController *v48;
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  __CFString *v52;
  _BYTE buf[24];
  char v54;

  v3 = sub_100ADD44C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    *(_QWORD *)&buf[4] = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Updating charging state", buf, 0xCu);
  }

  v5 = (const void *)IOPSCopyPowerSourcesByType(0);
  v6 = v5;
  if (v5)
  {
    v7 = IOPSCopyPowerSourcesList(v5);
    v8 = v7;
    if (v7)
    {
      if (CFArrayGetCount(v7) >= 1)
      {
        v43 = 0;
        v9 = 0;
        v42 = 2;
        while (1)
        {
          ValueAtIndex = CFArrayGetValueAtIndex(v8, v9);
          v11 = IOPSGetPowerSourceDescription(v6, ValueAtIndex);
          v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
          v13 = sub_100ADD44C();
          v14 = objc_claimAutoreleasedReturnValue(v13);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 134349314;
            *(_QWORD *)&buf[4] = self;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v12;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "[%{public}p] Checking power source: %@", buf, 0x16u);
          }

          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", CFSTR("Type")));
          if ((objc_msgSend(v15, "isEqualToString:", CFSTR("InternalBattery")) & 1) == 0)
            break;
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", CFSTR("Is Charging")));
          if (objc_msgSend(v16, "BOOLValue"))
          {

          }
          else
          {
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", CFSTR("Show Charging UI")));
            v22 = objc_msgSend(v21, "BOOLValue");

            if (!v22)
            {
              v28 = sub_100ADD44C();
              v18 = objc_claimAutoreleasedReturnValue(v28);
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 134349056;
                *(_QWORD *)&buf[4] = self;
                v19 = v18;
                v20 = "[%{public}p] Power source is not charging; ignoring";
LABEL_14:
                _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, v20, buf, 0xCu);
              }
              goto LABEL_15;
            }
          }
          v23 = IOPSCopyExternalPowerAdapterDetails();
          v24 = sub_100ADD44C();
          v25 = objc_claimAutoreleasedReturnValue(v24);
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 134349314;
            *(_QWORD *)&buf[4] = self;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v23;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "[%{public}p] Checking adapter details: %@", buf, 0x16u);
          }

          v26 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKey:](v23, "objectForKey:", CFSTR("IsWireless")));
          v27 = objc_msgSend(v26, "BOOLValue");

          if ((v27 & 1) != 0)
          {

            v43 = 1;
            v35 = 3;
            goto LABEL_33;
          }
          v43 = 1;
LABEL_21:

          if (++v9 >= CFArrayGetCount(v8))
            goto LABEL_34;
        }
        v17 = sub_100ADD44C();
        v18 = objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134349056;
          *(_QWORD *)&buf[4] = self;
          v19 = v18;
          v20 = "[%{public}p] Power source is not internal; ignoring";
          goto LABEL_14;
        }
LABEL_15:

        goto LABEL_21;
      }
      v43 = 0;
      v35 = 2;
LABEL_33:
      v42 = v35;
LABEL_34:
      CFRelease(v6);
      CFRelease(v8);
      if ((v43 & 1) != 0)
        v36 = v42;
      else
        v36 = 1;
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      v54 = 0;
      isolationQueue = self->_isolationQueue;
      v44[0] = _NSConcreteStackBlock;
      v44[1] = 3221225472;
      v44[2] = sub_100ADDE14;
      v44[3] = &unk_1011B3B40;
      v44[4] = self;
      v44[5] = buf;
      v44[6] = v36;
      dispatch_sync(isolationQueue, v44);
      v38 = sub_100ADD44C();
      v39 = objc_claimAutoreleasedReturnValue(v38);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
          v40 = CFSTR("YES");
        else
          v40 = CFSTR("NO");
        v41 = v40;
        *(_DWORD *)v47 = 134349570;
        v48 = self;
        v49 = 2048;
        v50 = v36;
        v51 = 2112;
        v52 = v41;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "[%{public}p] Calculated charging state: %ld, didChange: %@", v47, 0x20u);

      }
      if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
        -[GEOObserverHashTable powerSourceController:didUpdateChargingState:](self->_powerSourceObservers, "powerSourceController:didUpdateChargingState:", self, v36);
      _Block_object_dispose(buf, 8);
    }
    else
    {
      CFRelease(v6);
      v32 = sub_100ADD44C();
      v33 = objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134349056;
        *(_QWORD *)&buf[4] = self;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "[%{public}p] Could not copy power sources list", buf, 0xCu);
      }

      v34 = self->_isolationQueue;
      v45[0] = _NSConcreteStackBlock;
      v45[1] = 3221225472;
      v45[2] = sub_100ADDE08;
      v45[3] = &unk_1011AC860;
      v45[4] = self;
      dispatch_sync(v34, v45);
      -[GEOObserverHashTable powerSourceController:didUpdateChargingState:](self->_powerSourceObservers, "powerSourceController:didUpdateChargingState:", self, 0);
    }
  }
  else
  {
    v29 = sub_100ADD44C();
    v30 = objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134349056;
      *(_QWORD *)&buf[4] = self;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "[%{public}p] Could not copy power sources by type", buf, 0xCu);
    }

    v31 = self->_isolationQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100ADDDFC;
    block[3] = &unk_1011AC860;
    block[4] = self;
    dispatch_sync(v31, block);
    -[GEOObserverHashTable powerSourceController:didUpdateChargingState:](self->_powerSourceObservers, "powerSourceController:didUpdateChargingState:", self, 0);
  }
}

- (void)_handleNotifyCallback
{
  id v3;
  NSObject *v4;
  int v5;
  MapsPowerSourceController *v6;

  v3 = sub_100ADD44C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = 134349056;
    v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Got update notification", (uint8_t *)&v5, 0xCu);
  }

  -[MapsPowerSourceController _updateChargingState](self, "_updateChargingState");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_powerSourceObservers, 0);
  objc_storeStrong((id *)&self->_isolationQueue, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
}

@end
