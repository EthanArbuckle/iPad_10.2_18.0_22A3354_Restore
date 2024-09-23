@implementation DMDLostDeviceLocationManager

- (DMDLostDeviceLocationManager)init
{
  DMDLostDeviceLocationManager *v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_attr_t v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)DMDLostDeviceLocationManager;
  v2 = -[DMDLostDeviceLocationManager init](&v10, "init");
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_DEFAULT, 0);
    v6 = objc_claimAutoreleasedReturnValue(v5);

    v7 = dispatch_queue_create((const char *)objc_msgSend(CFSTR("DMDLDLMServiceQueue"), "UTF8String"), v6);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

  }
  return v2;
}

+ (DMDLostDeviceLocationManager)sharedManager
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004C69C;
  block[3] = &unk_1000BA638;
  block[4] = a1;
  if (qword_1000EB8E0 != -1)
    dispatch_once(&qword_1000EB8E0, block);
  return (DMDLostDeviceLocationManager *)(id)qword_1000EB8D8;
}

- (void)getCurrentLocationForOriginator:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[DMDLostDeviceLocationManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004C77C;
  block[3] = &unk_1000BB2E0;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

- (void)clearLastLocationRequestedDate
{
  void *v2;
  void *v3;
  NSFileCoordinator *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  uint64_t *v8;
  id v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[DMDPaths systemLostModeRequestPath](DMDPaths, "systemLostModeRequestPath"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v2, 0));

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v4 = objc_opt_new(NSFileCoordinator);
  v9 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10004CC18;
  v6[3] = &unk_1000BB308;
  v7 = 0;
  v8 = &v10;
  -[NSFileCoordinator coordinateWritingItemAtURL:options:error:byAccessor:](v4, "coordinateWritingItemAtURL:options:error:byAccessor:", v3, 1, &v9, v6);
  v5 = v9;

  if (!*((_BYTE *)v11 + 24) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100077580();

  _Block_object_dispose(&v10, 8);
}

- (NSString)lastLocationRequestedDateMessage
{
  void *v2;
  void *v3;
  NSFileCoordinator *v4;
  id v5;
  void *v6;
  void *v7;
  NSDateFormatter *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  NSBundle *v17;
  void *v18;
  void *v19;
  _QWORD v21[7];
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint8_t buf[4];
  id v40;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[DMDPaths systemLostModeRequestPath](DMDPaths, "systemLostModeRequestPath"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v2, 0));

  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = sub_10004D15C;
  v37 = sub_10004D16C;
  v38 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = sub_10004D15C;
  v27 = sub_10004D16C;
  v28 = 0;
  v4 = objc_opt_new(NSFileCoordinator);
  v22 = 0;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10004D174;
  v21[3] = &unk_1000BB330;
  v21[4] = &v29;
  v21[5] = &v23;
  v21[6] = &v33;
  -[NSFileCoordinator coordinateReadingItemAtURL:options:error:byAccessor:](v4, "coordinateReadingItemAtURL:options:error:byAccessor:", v3, 0, &v22, v21);
  v5 = v22;

  if (!*((_BYTE *)v30 + 24) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v40 = v5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Could not read device last located time interval: %@", buf, 0xCu);
  }
  v6 = (void *)v34[5];
  if (v6)
  {
    objc_msgSend(v6, "doubleValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v40 = v7;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Device last located on %{public}@. Creating localized message.", buf, 0xCu);
    }
    v8 = objc_opt_new(NSDateFormatter);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](NSLocale, "currentLocale"));
    -[NSDateFormatter setLocale:](v8, "setLocale:", v9);

    -[NSDateFormatter setTimeStyle:](v8, "setTimeStyle:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v8, "stringFromDate:", v7));
    -[NSDateFormatter setTimeStyle:](v8, "setTimeStyle:", 0);
    -[NSDateFormatter setDateStyle:](v8, "setDateStyle:", 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v8, "stringFromDate:", v7));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v24[5], "objectForKeyedSubscript:", CFSTR("originator")));
    if (!v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v24[5], "objectForKeyedSubscript:", CFSTR("organizationName")));
      v14 = v13;
      if (v13)
        v15 = v13;
      else
        v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v24[5], "objectForKeyedSubscript:", CFSTR("serverName")));
      v12 = v15;

    }
    v17 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(DMFConnection));
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("The location of this device was sent to %@ at %@ on %@."), &stru_1000BC2E0, CFSTR("DMFNotifications")));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v19, v12, v10, v11));

  }
  else
  {
    v16 = 0;
  }

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);

  return (NSString *)v16;
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  _BOOL8 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint8_t v21[16];

  v5 = a4;
  v6 = objc_claimAutoreleasedReturnValue(-[DMDLostDeviceLocationManager queue](self, "queue"));
  dispatch_assert_queue_V2(v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastObject"));
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v21 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Location Manager returned a location.", v21, 2u);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DMDLostDeviceLocationManager originator](self, "originator"));
  v9 = -[DMDLostDeviceLocationManager _updateLostModeFileForOriginator:](self, "_updateLostModeFileForOriginator:", v8);

  v10 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[DMDLostDeviceLocationManager completionBlock](self, "completionBlock"));
  -[DMDLostDeviceLocationManager _cleanupAfterResponseFromLocationManagerOrTimeout](self, "_cleanupAfterResponseFromLocationManagerOrTimeout");
  if (!v9)
  {
    v11 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v11)
    {
      sub_100077650(v11, v12, v13, v14, v15, v16, v17, v18);
      if (!v10)
        goto LABEL_9;
    }
    else if (!v10)
    {
      goto LABEL_9;
    }
    v19 = DMFErrorWithCodeAndUserInfo(603, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    ((void (**)(_QWORD, _QWORD, void *))v10)[2](v10, 0, v20);

    goto LABEL_9;
  }
  if (v10)
    ((void (**)(_QWORD, void *, _QWORD))v10)[2](v10, v7, 0);
LABEL_9:

}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v5;
  NSObject *v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);

  v5 = a4;
  v6 = objc_claimAutoreleasedReturnValue(-[DMDLostDeviceLocationManager queue](self, "queue"));
  dispatch_assert_queue_V2(v6);

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100077684();
  v7 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[DMDLostDeviceLocationManager completionBlock](self, "completionBlock"));
  -[DMDLostDeviceLocationManager _cleanupAfterResponseFromLocationManagerOrTimeout](self, "_cleanupAfterResponseFromLocationManagerOrTimeout");
  if (v7)
    ((void (**)(_QWORD, _QWORD, id))v7)[2](v7, 0, v5);

}

- (void)_cleanupAfterResponseFromLocationManagerOrTimeout
{
  void *v3;
  NSObject *v4;
  NSObject *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DMDLostDeviceLocationManager locationManager](self, "locationManager"));
  objc_msgSend(v3, "stopUpdatingLocation");

  -[DMDLostDeviceLocationManager setLocationManager:](self, "setLocationManager:", 0);
  -[DMDLostDeviceLocationManager setCompletionBlock:](self, "setCompletionBlock:", 0);
  v4 = objc_claimAutoreleasedReturnValue(-[DMDLostDeviceLocationManager timeoutTimerDispatchSource](self, "timeoutTimerDispatchSource"));
  if (v4)
  {
    v5 = v4;
    dispatch_source_cancel(v4);
    -[DMDLostDeviceLocationManager setTimeoutTimerDispatchSource:](self, "setTimeoutTimerDispatchSource:", 0);
    v4 = v5;
  }

}

- (BOOL)_updateLostModeFileForOriginator:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSFileCoordinator *v6;
  id v7;
  id v8;
  BOOL v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t *v14;
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  uint8_t buf[4];
  id v25;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[DMDPaths systemLostModeRequestPath](DMDPaths, "systemLostModeRequestPath"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v4, 0));

  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v6 = objc_opt_new(NSFileCoordinator);
  v15 = 0;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10004D664;
  v11[3] = &unk_1000BB358;
  v13 = &v20;
  v7 = v3;
  v12 = v7;
  v14 = &v16;
  -[NSFileCoordinator coordinateWritingItemAtURL:options:error:byAccessor:](v6, "coordinateWritingItemAtURL:options:error:byAccessor:", v5, 0, &v15, v11);
  v8 = v15;

  if (!*((_BYTE *)v21 + 24) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v25 = v8;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Could not read device last located time interval for update: %@", buf, 0xCu);
  }
  v9 = *((_BYTE *)v17 + 24) != 0;

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);

  return v9;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (CLLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
  objc_storeStrong((id *)&self->_locationManager, a3);
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)originator
{
  return self->_originator;
}

- (void)setOriginator:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (OS_dispatch_source)timeoutTimerDispatchSource
{
  return self->_timeoutTimerDispatchSource;
}

- (void)setTimeoutTimerDispatchSource:(id)a3
{
  objc_storeStrong((id *)&self->_timeoutTimerDispatchSource, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeoutTimerDispatchSource, 0);
  objc_storeStrong((id *)&self->_originator, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
