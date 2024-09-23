@implementation NIServerDevicePresenceSession

- (id)getQueueForInputingData
{
  return *((id *)self + 10);
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_msgSend(objc_alloc((Class)NSMutableString), "initWithFormat:", CFSTR("NIServerDevicePresenceSession"));
  v4 = (void *)*((_QWORD *)self + 43);
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "description"));
    objc_msgSend(v3, "appendFormat:", CFSTR(" with Configuration: %@"), v5);

  }
  else
  {
    objc_msgSend(v3, "appendFormat:", CFSTR(" with Configuration: nil"));
  }
  return v3;
}

- (NIServerDevicePresenceSession)initWithResourcesManager:(id)a3 configuration:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  _QWORD *v16;
  id v17;
  void *v18;
  void *v19;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  _BOOL4 v32;
  void *v33;
  _QWORD *v34;
  _QWORD *v35;
  _QWORD *v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD *v39;
  uint64_t **v40;
  _QWORD *v41;
  uint64_t v42;
  _QWORD *v43;
  uint64_t v44;
  id *v45;
  uint64_t v46;
  std::__shared_weak_count *v47;
  unint64_t *v48;
  unint64_t v49;
  unsigned int v50;
  NSObject *v51;
  _BOOL4 v52;
  void *v54;
  void *v55;
  __int128 v56;
  int v57;
  __int16 v58;
  uint64_t v59;
  _QWORD v60[4];
  id v61;
  objc_super v62;
  _QWORD v63[2];
  _QWORD v64[2];
  _QWORD v65[3];
  _QWORD *v66;
  _QWORD v67[3];
  _QWORD *v68;
  id location[3];
  id *v70;

  v9 = a3;
  v10 = a4;
  v12 = objc_opt_class(v10, v11);
  if (v12 != objc_opt_class(NIDevicePresenceConfiguration, v13))
  {
    v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v54, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NIServerDevicePresenceSession.mm"), 89, CFSTR("NIServerDevicePresenceSession given invalid configuration."));

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "serverSessionIdentifier"));

  if (!v14)
  {
    v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v55, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NIServerDevicePresenceSession.mm"), 90, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("resourcesManager.serverSessionIdentifier"));

  }
  v62.receiver = self;
  v62.super_class = (Class)NIServerDevicePresenceSession;
  v15 = -[NIServerBaseSession initWithResourcesManager:configuration:error:](&v62, "initWithResourcesManager:configuration:error:", v9, v10, a5);
  v16 = v15;
  if (v15)
  {
    v17 = objc_msgSend(v10, "copy");
    v18 = (void *)*((_QWORD *)v15 + 43);
    *((_QWORD *)v15 + 43) = v17;

    if ((objc_msgSend(*((id *)v15 + 43), "monitoringOption") & 2) == 0)
    {
      if (v9)
      {
        objc_msgSend(v9, "protobufLogger");
      }
      else
      {
        location[0] = 0;
        location[1] = 0;
      }
      sub_1000145E8((uint64_t)v15 + 48, (__int128 *)location);
      v20 = (std::__shared_weak_count *)location[1];
      if (location[1])
      {
        v21 = (unint64_t *)((char *)location[1] + 8);
        do
          v22 = __ldaxr(v21);
        while (__stlxr(v22 - 1, v21));
        if (!v22)
        {
          ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
          std::__shared_weak_count::__release_weak(v20);
        }
      }
      v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "clientConnectionQueue"));
      v24 = (void *)*((_QWORD *)v15 + 10);
      *((_QWORD *)v15 + 10) = v23;

      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "serverSessionIdentifier"));
      v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "UUIDString"));
      v27 = (void *)*((_QWORD *)v15 + 11);
      *((_QWORD *)v15 + 11) = v26;

      *((_QWORD *)v15 + 39) = 0;
      v28 = objc_alloc_init((Class)SFDeviceDiscovery);
      v29 = (void *)*((_QWORD *)v15 + 12);
      *((_QWORD *)v15 + 12) = v28;

      if (objc_msgSend(*((id *)v15 + 43), "allowedDevices") == (id)2)
      {
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)v15 + 43), "innerBoundary"));
        if (objc_msgSend(v30, "devicePresencePreset") == (id)3)
        {

        }
        else
        {
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)v15 + 43), "innerBoundary"));
          v32 = objc_msgSend(v31, "devicePresencePreset") == (id)2;

          if (!v32)
            goto LABEL_23;
        }
        objc_initWeak(location, v15);
        v33 = (void *)*((_QWORD *)v15 + 12);
        v60[0] = _NSConcreteStackBlock;
        v60[1] = 3221225472;
        v60[2] = sub_100185014;
        v60[3] = &unk_1007FA0A0;
        objc_copyWeak(&v61, location);
        objc_msgSend(v33, "activateWithCompletion:", v60);
        objc_destroyWeak(&v61);
        objc_destroyWeak(location);
      }
LABEL_23:
      v59 = 0x3FF0000000000000;
      v57 = 16843009;
      v58 = 0;
      v34 = v16;
      v35 = operator new(0x118uLL);
      v35[1] = 0;
      v35[2] = 0;
      *v35 = off_10080A2E8;
      v36 = v34;
      location[0] = off_10080A338;
      location[1] = v36;
      v70 = location;
      v37 = v16[10];
      v38 = v16[11];
      v39 = v36;
      v67[0] = off_10080A3C8;
      v67[1] = v39;
      v68 = v67;
      v40 = v39;
      v65[0] = off_10080A458;
      v65[1] = v40;
      v66 = v65;
      sub_100265B2C(v35 + 3, &v57, location, v37, v38, v67, v65);
      v41 = v66;
      if (v66 == v65)
      {
        v42 = 4;
        v41 = v65;
      }
      else
      {
        if (!v66)
          goto LABEL_28;
        v42 = 5;
      }
      (*(void (**)(void))(*v41 + 8 * v42))();
LABEL_28:
      v43 = v68;
      if (v68 == v67)
      {
        v44 = 4;
        v43 = v67;
      }
      else
      {
        if (!v68)
          goto LABEL_33;
        v44 = 5;
      }
      (*(void (**)(void))(*v43 + 8 * v44))();
LABEL_33:
      v45 = v70;
      if (v70 == location)
      {
        v46 = 4;
        v45 = location;
      }
      else
      {
        if (!v70)
        {
LABEL_38:
          *(_QWORD *)&v56 = v35 + 3;
          *((_QWORD *)&v56 + 1) = v35;
          sub_10001B020((uint64_t)&v56, v35 + 3, (uint64_t)(v35 + 3));
          sub_1000145E8((uint64_t)(v40 + 13), &v56);
          v47 = (std::__shared_weak_count *)*((_QWORD *)&v56 + 1);
          if (*((_QWORD *)&v56 + 1))
          {
            v48 = (unint64_t *)(*((_QWORD *)&v56 + 1) + 8);
            do
              v49 = __ldaxr(v48);
            while (__stlxr(v49 - 1, v48));
            if (!v49)
            {
              ((void (*)(std::__shared_weak_count *))v47->__on_zero_shared)(v47);
              std::__shared_weak_count::__release_weak(v47);
            }
          }
          v50 = objc_msgSend((id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults")), "BOOLForKey:", CFSTR("EnableDevicePresenceMotionDetection"));
          v51 = qword_10085F520;
          v52 = os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT);
          if (v50)
          {
            if (v52)
            {
              LOWORD(location[0]) = 0;
              _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "#ses-devicepresence,Motion detection enabled by defaults write", (uint8_t *)location, 2u);
            }
            sub_100265F7C(v40[13]);
          }
          else if (v52)
          {
            LOWORD(location[0]) = 0;
            _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "#ses-devicepresence,no defaults write present for motion detection; motion detection will not be enabled",
              (uint8_t *)location,
              2u);
          }
          operator new();
        }
        v46 = 5;
      }
      (*((void (**)(void))*v45 + v46))();
      goto LABEL_38;
    }
    if (a5)
    {
      v63[0] = NSLocalizedFailureReasonErrorKey;
      v63[1] = NSLocalizedRecoverySuggestionErrorKey;
      v64[0] = CFSTR("Invalid monitoring option.");
      v64[1] = CFSTR("AlwaysOn is not currently supported, remove from configuration.");
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v64, v63, 2));
      v15 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5888, v19));

    }
    else
    {
      v15 = 0;
    }
  }

  return (NIServerDevicePresenceSession *)v15;
}

- (duration<long)nominalCycleRate
{
  return (duration<long long, std::ratio<1, 1000>>)2000;
}

- (id)lastConfiguration
{
  return *((id *)self + 43);
}

- (int64_t)_roseMotionStateToNIMotionActivityState:(int)a3
{
  dispatch_assert_queue_V2(*((dispatch_queue_t *)self + 10));
  if (a3 == 1)
    return 2;
  else
    return a3 == 2;
}

- (void)_handleMotionStateChange:(int)a3
{
  uint64_t v3;
  NSObject *v5;
  void **v6;
  int64_t v7;
  int64_t v8;
  uint64_t v9;
  char v10;
  NSObject *v11;
  _BOOL4 v12;
  void *__p[2];
  char v14;
  uint8_t buf[4];
  void **v16;

  v3 = *(_QWORD *)&a3;
  dispatch_assert_queue_V2(*((dispatch_queue_t *)self + 10));
  v5 = (id)qword_10085F520;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    sub_1001CD9B8(v3, __p);
    v6 = v14 >= 0 ? __p : (void **)__p[0];
    *(_DWORD *)buf = 136315138;
    v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#ses-devicepresence,received new motion state %s", buf, 0xCu);
    if (v14 < 0)
      operator delete(__p[0]);
  }

  v7 = -[NIServerDevicePresenceSession _roseMotionStateToNIMotionActivityState:](self, "_roseMotionStateToNIMotionActivityState:", v3);
  v8 = v7;
  v9 = *((_QWORD *)self + 39);
  if (v9 != v7)
  {
    if (v7 == 1 && v9 == 2)
    {
      v10 = objc_opt_respondsToSelector(*((_QWORD *)self + 12), "triggerEnhancedDiscovery:");
      v11 = qword_10085F520;
      v12 = os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT);
      if ((v10 & 1) != 0)
      {
        if (v12)
        {
          LOWORD(__p[0]) = 0;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#ses-devicepresence,Stationary transition detected, starting double boost.", (uint8_t *)__p, 2u);
        }
        objc_msgSend(*((id *)self + 12), "triggerEnhancedDiscovery:useCase:completion:", CFSTR("device presence session configuration"), 131084, &stru_10080A268);
      }
      else if (v12)
      {
        LOWORD(__p[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#ses-devicepresence,double boost not available", (uint8_t *)__p, 2u);
      }
    }
    *((_QWORD *)self + 39) = v8;
  }
}

- (void)consumeBluetoothSample:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  unsigned int v10;
  NSObject *v11;
  NIDiscoveryToken *v12;
  void *v13;
  void *v14;
  NIDiscoveryToken *v15;
  void *v16;
  double v17;
  _BOOL4 v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  unsigned int v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  NINearbyObject *v28;
  void *v29;
  void *v30;
  _QWORD *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  int v40;
  id v41;
  NSObject *v42;
  void *v43;
  _BOOL4 v44;
  double v45;
  void *v46;
  BOOL v47;
  double v48;
  void *v49;
  void *v50;
  unsigned int v51;
  void *v52;
  double v53;
  double v55;
  dispatch_time_t v56;
  NIDiscoveryToken *v57;
  NSObject *v58;
  _QWORD *v59;
  _QWORD *v60;
  _QWORD *v61;
  void *v62;
  NSObject *v63;
  unint64_t v64;
  _QWORD handler[4];
  NIDiscoveryToken *v66;
  NSObject *v67;
  NIServerDevicePresenceSession *v68;
  id v69[2];
  id location;
  void *__p[2];
  char v72;
  void *v73;
  void *v74;
  uint64_t v75;
  id *v76;
  _BYTE buf[12];
  __int16 v78;
  unsigned int v79;
  __int16 v80;
  _BYTE v81[18];
  char v82;
  void *v83;
  void *v84;

  v4 = a3;
  dispatch_assert_queue_V2(*((dispatch_queue_t *)self + 10));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "model"));

    if (v6)
    {
      if ((objc_msgSend(*((id *)self + 43), "allowedDevices") & 8) != 0
        && +[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild")
        && os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEBUG))
      {
        sub_1003D2F24();
      }
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)self + 43), "token"));
      v8 = v7 == 0;

      if (v8)
      {
        v12 = [NIDiscoveryToken alloc];
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "dataUsingEncoding:", 4));
        v15 = -[NIDiscoveryToken initWithBytes:](v12, "initWithBytes:", v14);

      }
      else
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "model"));
        v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("NONE"));

        if (v10)
        {
          v11 = qword_10085F520;
          if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v4;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#ses-devicepresence,No model information while bt finding for sample: %@", buf, 0xCu);
          }
          goto LABEL_63;
        }
        v15 = (NIDiscoveryToken *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)self + 43), "token"));
      }
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)self + 43), "innerBoundary"));
      if (objc_msgSend(v16, "devicePresencePreset") == (id)3)
      {
        objc_msgSend(v4, "rssi");
        v18 = v17 < -61.0;

        if (v18)
        {
          v19 = (id)qword_10085F520;
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v4, "rssi");
            v21 = v20;
            v22 = objc_msgSend(v4, "channel");
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
            *(_DWORD *)buf = 134218754;
            *(_QWORD *)&buf[4] = v21;
            v78 = 1024;
            v79 = v22;
            v80 = 2112;
            *(_QWORD *)v81 = v23;
            *(_WORD *)&v81[8] = 2048;
            *(_QWORD *)&v81[10] = -[NIDiscoveryToken hash](v15, "hash");
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "#ses-devicepresence,Ignoring weak RSSI %f on channel %d for device: %@ (device hash: 0x%lx) because we cannot trust weak RSSI due to a BT FW bug", buf, 0x26u);

          }
          goto LABEL_63;
        }
      }
      else
      {

      }
      v73 = 0;
      v74 = 0;
      v75 = 0;
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "dataUsingEncoding:", 4));

      v26 = objc_msgSend(v25, "length");
      v27 = 0;
      if (v26)
      {
        sub_10003F150((unint64_t *)&v73, (size_t)v26);
        v27 = v73;
      }
      else if (v74 != v73)
      {
        v74 = v73;
      }
      objc_msgSend(v25, "getBytes:length:", v27, objc_msgSend(v25, "length"));
      std::mutex::lock((std::mutex *)((char *)self + 208));
      *(_QWORD *)buf = -[NIDiscoveryToken hash](v15, "hash");
      if (!sub_1000550B8((_QWORD *)self + 21, (unint64_t *)buf))
      {
        v28 = -[NINearbyObject initWithToken:]([NINearbyObject alloc], "initWithToken:", v15);
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
        -[NINearbyObject setDeviceIdentifier:](v28, "setDeviceIdentifier:", v29);

        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
        -[NINearbyObject setName:](v28, "setName:", v30);

        v76 = -[NIDiscoveryToken hash](v15, "hash");
        *(_QWORD *)buf = &v76;
        v31 = sub_100187E74((uint64_t)self + 168, (unint64_t *)&v76, (uint64_t)&unk_100472CF8, (_QWORD **)buf);
        v32 = (void *)v31[3];
        v31[3] = v28;

      }
      std::mutex::unlock((std::mutex *)((char *)self + 208));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "partIdentifier"));
      if (objc_msgSend(v33, "isEqualToString:", &stru_10081D5E0))
      {
        v34 = -[NIDiscoveryToken hash](v15, "hash");
      }
      else
      {
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "partIdentifier"));
        v34 = objc_msgSend(v35, "hash");

      }
      if (!v34
        && +[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild")
        && os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEBUG))
      {
        sub_1003D2EC4();
      }
      if (!-[NIServerDevicePresenceSession airPodsProxCardSampleTooOld:](self, "airPodsProxCardSampleTooOld:", v4))
      {
        objc_msgSend(v4, "machContinuousTimeSeconds");
        v37 = v36;
        objc_msgSend(v4, "rssi");
        v39 = v38;
        v40 = objc_msgSend(v4, "channel");
        v41 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "model")));
        sub_10000BF04(__p, (char *)objc_msgSend(v41, "UTF8String"));
        sub_100187824((uint64_t)buf, v40, (__int128 *)__p, (uint64_t)&v73, -[NIDiscoveryToken hash](v15, "hash"), (uint64_t)v34, v37, v39);
        if (v72 < 0)
          operator delete(__p[0]);

        objc_msgSend(*((id *)self + 8), "acceptBluetoothSample:", buf);
        sub_10021A320(*((std::string **)self + 15), (const std::string *)buf);
        v42 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, *((dispatch_queue_t *)self + 10));
        v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)self + 43), "innerBoundary"));
        v44 = objc_msgSend(v43, "devicePresencePreset") == (id)3;

        if (v44)
          v45 = 120.0;
        else
          v45 = 60.0;
        v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)self + 43), "token"));
        v47 = v46 == 0;

        v48 = 10.0;
        if (v47)
        {
          v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)self + 43), "innerBoundary"));
          if (objc_msgSend(v49, "devicePresencePreset") == (id)1)
          {
            v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "model"));
            v51 = -[NIServerDevicePresenceSession isAirPods:](self, "isAirPods:", CBProductIDFromNSString());

            if (v51)
              v48 = 5.0;
            else
              v48 = v45;
          }
          else
          {

            v48 = v45;
          }
        }
        v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
        objc_msgSend(v52, "doubleForKey:", CFSTR("NIDevicePresenceSampleTimeoutOverrideSeconds"));
        if (v53 >= 300.0 || v53 <= 1.0)
          v55 = v48;
        else
          v55 = v53;
        v56 = dispatch_walltime(0, (uint64_t)(v55 * 1000000000.0));
        dispatch_source_set_timer(v42, v56, (uint64_t)(v55 * 1000000000.0), 0);
        objc_initWeak(&location, self);
        handler[0] = _NSConcreteStackBlock;
        handler[1] = 3221225472;
        handler[2] = sub_100185F14;
        handler[3] = &unk_10080A290;
        objc_copyWeak(v69, &location);
        v69[1] = *(id *)&v55;
        v57 = v15;
        v66 = v57;
        v58 = v42;
        v67 = v58;
        v68 = self;
        dispatch_source_set_event_handler(v58, handler);
        v59 = (_QWORD *)((char *)self + 272);
        v76 = -[NIDiscoveryToken hash](v57, "hash");
        v60 = sub_1000550B8(v59, (unint64_t *)&v76);
        if (v60)
          dispatch_source_cancel((dispatch_source_t)v60[3]);
        v64 = -[NIDiscoveryToken hash](v57, "hash");
        v76 = (id *)&v64;
        v61 = sub_100188154((uint64_t)v59, &v64, (uint64_t)&unk_100472CF8, &v76);
        v62 = (void *)v61[3];
        v61[3] = v58;
        v63 = v58;

        dispatch_resume(v63);
        objc_destroyWeak(v69);
        objc_destroyWeak(&location);

        if (v83)
        {
          v84 = v83;
          operator delete(v83);
        }
        if (v82 < 0)
          operator delete(*(void **)&v81[4]);
      }

      if (v73)
      {
        v74 = v73;
        operator delete(v73);
      }

    }
    else if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
    {
      sub_1003D2E64();
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
  {
    sub_1003D2E04();
  }
LABEL_63:

}

- (BOOL)isInteresetedInSample:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  v5 = (unint64_t)objc_msgSend(*((id *)self + 43), "allowedDevices");
  if (v5 < 6 && ((0x33u >> v5) & 1) != 0)
    goto LABEL_8;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "model"));
  if (objc_msgSend(v6, "isEqualToString:", &stru_10081D5E0))
  {

LABEL_8:
    LOBYTE(self) = 0;
    goto LABEL_9;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "model"));

  if (!v7)
    goto LABEL_8;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "model"));
  v9 = CBProductIDFromNSString();

  if (objc_msgSend(*((id *)self + 43), "allowedDevices") == (id)8)
  {
    LOBYTE(self) = -[NIServerDevicePresenceSession isAirPods:](self, "isAirPods:", v9);
  }
  else if ((objc_msgSend(*((id *)self + 43), "allowedDevices") & 8) != 0)
  {
    LOBYTE(self) = 1;
  }
  else
  {
    LOBYTE(self) = 0;
    if (((v9 - 8194) > 0x24 || ((1 << (v9 - 2)) & 0x1C7BB7FF9BLL) == 0)
      && (_DWORD)v9 != 666
      && (_DWORD)v9 != 671)
    {
      LODWORD(self) = !sub_1001862C0(v9);
    }
  }
LABEL_9:

  return (char)self;
}

- (BOOL)isInterestedInSamplesForDevice:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  unsigned __int8 v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  BOOL v19;
  unsigned int v20;
  unsigned int v21;
  void *v23;
  int v24;
  void *v25;
  __int16 v26;
  void *v27;

  v4 = a3;
  v5 = (unint64_t)objc_msgSend(*((id *)self + 43), "allowedDevices");
  if (v5 < 6 && ((0x33u >> v5) & 1) != 0)
    goto LABEL_12;
  if (!objc_msgSend(v4, "rssi"))
  {
    v14 = (id)qword_10085F520;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "idsDeviceID"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "model"));
      v24 = 138412546;
      v25 = v15;
      v26 = 2112;
      v27 = v16;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#ses-devicepresence,Dropping BT RSSI sample for device: %@ which is of model: %@ because reported RSSI is UNKNOWN", (uint8_t *)&v24, 0x16u);

    }
    goto LABEL_11;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)self + 43), "token"));

  v7 = (void *)*((_QWORD *)self + 43);
  if (v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "token"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectInRawTokenOPACKDictForKey:", &off_10082BF08));

    v10 = objc_msgSend(v9, "length");
    if (v10 != (id)6)
    {
      if (v10 != (id)7)
      {
        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
          sub_1003D2F84();
        v13 = 0;
        goto LABEL_20;
      }
      v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "subdataWithRange:", 1, (char *)objc_msgSend(v9, "length") - 1));

      v9 = (void *)v11;
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "btAddressData"));
    v13 = objc_msgSend(v9, "isEqualToData:", v12);

LABEL_20:
    goto LABEL_29;
  }
  if ((objc_msgSend(v7, "allowedDevices") & 8) == 0)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "idsDeviceID"));

    if (!v17)
      goto LABEL_12;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "model"));

    if (v18)
    {
      v19 = ((unint64_t)objc_msgSend(v4, "deviceFlags") & 0x380) == 0;
LABEL_26:
      v13 = !v19;
      goto LABEL_29;
    }
    v14 = (id)qword_10085F520;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "idsDeviceID"));
      v24 = 138412290;
      v25 = v23;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#ses-devicepresence,Dropping BT RSSI sample for device: %@ which does not have model info", (uint8_t *)&v24, 0xCu);

    }
LABEL_11:

LABEL_12:
    v13 = 0;
    goto LABEL_29;
  }
  v13 = 0;
  v20 = objc_msgSend(v4, "productID") - 8194;
  if (v20 <= 0x22 && ((1 << v20) & 0x472863101) != 0)
  {
    v21 = objc_msgSend(v4, "productID");
    v19 = v21 == 8223 || v21 == 8202;
    goto LABEL_26;
  }
LABEL_29:

  return v13;
}

- (BOOL)supportsCameraAssistance
{
  return +[NIPlatformInfo supportsARKit](NIPlatformInfo, "supportsARKit");
}

- (BOOL)supportsDevicePresence
{
  return 1;
}

- (BOOL)supportsSessionObservers
{
  return 1;
}

- (id)configure
{
  NSObject *v3;
  uint64_t v4;
  NIServerSessionResourceManager *v5;
  void *v6;
  NINearbyUpdatesEngine *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  std::__shared_weak_count *v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  NINearbyUpdatesEngine *v14;
  id v15;
  void *v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  id v21;
  uint64_t v22;
  std::__shared_weak_count *v23;
  objc_super v24;
  uint8_t buf[4];
  uint64_t v26;

  dispatch_assert_queue_V2(*((dispatch_queue_t *)self + 10));
  if (!*((_QWORD *)self + 43))
    sub_1003D2FE4();
  v3 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *((_QWORD *)self + 43);
    *(_DWORD *)buf = 138412290;
    v26 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#ses-devicepresence,Configure. Configuration given: %@", buf, 0xCu);
  }
  v24.receiver = self;
  v24.super_class = (Class)NIServerDevicePresenceSession;
  v5 = -[NIServerBaseSession resourcesManager](&v24, "resourcesManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  if (*((_QWORD *)self + 8))
    goto LABEL_15;
  v7 = [NINearbyUpdatesEngine alloc];
  v8 = *((_QWORD *)self + 43);
  v9 = *((_QWORD *)self + 10);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "analytics"));
  v11 = (std::__shared_weak_count *)*((_QWORD *)self + 7);
  v22 = *((_QWORD *)self + 6);
  v23 = v11;
  if (v11)
  {
    p_shared_owners = (unint64_t *)&v11->__shared_owners_;
    do
      v13 = __ldxr(p_shared_owners);
    while (__stxr(v13 + 1, p_shared_owners));
  }
  v21 = 0;
  v14 = -[NINearbyUpdatesEngine initWithConfiguration:queue:delegate:dataSource:analyticsManager:protobufLogger:error:](v7, "initWithConfiguration:queue:delegate:dataSource:analyticsManager:protobufLogger:error:", v8, v9, self, self, v10, &v22, &v21);
  v15 = v21;
  v16 = (void *)*((_QWORD *)self + 8);
  *((_QWORD *)self + 8) = v14;

  v17 = v23;
  if (v23)
  {
    v18 = (unint64_t *)&v23->__shared_owners_;
    do
      v19 = __ldaxr(v18);
    while (__stlxr(v19 - 1, v18));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
  }

  if (*((_QWORD *)self + 8))
  {

LABEL_15:
    v15 = 0;
  }

  return v15;
}

- (id)run
{
  NIServerSessionResourceManager *v3;
  void *v4;
  char *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  std::string *v11;
  double v12;
  id v13;
  std::string __p;
  objc_super v16;

  dispatch_assert_queue_V2(*((dispatch_queue_t *)self + 10));
  v16.receiver = self;
  v16.super_class = (Class)NIServerDevicePresenceSession;
  v3 = -[NIServerBaseSession resourcesManager](&v16, "resourcesManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (char *)objc_msgSend(*((id *)self + 43), "allowedDevices");
  if ((unint64_t)(v5 - 6) < 0xA || (unint64_t)(v5 - 2) < 2)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)self + 43), "token"));

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "devicePresenceResource"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "internalObserver"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)self + 43), "token"));
      objc_msgSend(v8, "startHighPriorityScanningForToken:forConsumer:", v9, self);

    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "devicePresenceResource"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "internalObserver"));
      objc_msgSend(v8, "startLeechingForConsumer:", self);
    }

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lifecycleSupervisor"));
  objc_msgSend(v10, "runWithConfigurationCalled");

  v11 = (std::string *)*((_QWORD *)self + 15);
  v12 = sub_10000883C();
  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "clientProcessNameBestGuess")));
  sub_10000BF04(&__p, (char *)objc_msgSend(v13, "UTF8String"));
  sub_10021A314(v11, &__p, v12);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);

  *((_BYTE *)self + 72) = 1;
  return 0;
}

- (id)pauseWithSource:(int64_t)a3
{
  void *v4;
  NIServerSessionResourceManager *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  double v15;
  objc_super v17;

  dispatch_assert_queue_V2(*((dispatch_queue_t *)self + 10));
  *((_BYTE *)self + 72) = 0;
  sub_100186C64((uint64_t)self + 128);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerDevicePresenceSession _disableAllServicesAndSendHangupSignal:](self, "_disableAllServicesAndSendHangupSignal:", 0));
  v17.receiver = self;
  v17.super_class = (Class)NIServerDevicePresenceSession;
  v5 = -[NIServerBaseSession resourcesManager](&v17, "resourcesManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lifecycleSupervisor"));
  objc_msgSend(v7, "pauseCalled");

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "devicePresenceResource"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "internalObserver"));
  objc_msgSend(v9, "stopLeechingForConsumer:", self);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)self + 43), "token"));
  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "devicePresenceResource"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "internalObserver"));
    objc_msgSend(v12, "stopHighPriorityScanning");

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)self + 43), "token"));

  if (v13)
  {
    v14 = *((_QWORD *)self + 15);
    v15 = sub_10000883C();
    sub_10021A4D8(v14, v15);
  }

  return v4;
}

- (id)disableAllServices
{
  NIServerSessionResourceManager *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NIServerDevicePresenceSession;
  v3 = -[NIServerBaseSession resourcesManager](&v8, "resourcesManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "devicePresenceResource"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "internalObserver"));
  objc_msgSend(v6, "stopLeechingForConsumer:", self);

  return (id)objc_claimAutoreleasedReturnValue(-[NIServerDevicePresenceSession _disableAllServicesAndSendHangupSignal:](self, "_disableAllServicesAndSendHangupSignal:", 1));
}

- (void)invalidate
{
  id v3;
  void *v4;
  uint64_t v5;
  double v6;
  objc_super v7;

  dispatch_assert_queue_V2(*((dispatch_queue_t *)self + 10));
  *((_BYTE *)self + 72) = 0;
  sub_100186C64((uint64_t)self + 128);
  objc_msgSend(*((id *)self + 12), "invalidate");
  sub_100265CD4(*((_QWORD *)self + 13));
  v3 = -[NIServerDevicePresenceSession disableAllServices](self, "disableAllServices");
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)self + 43), "token"));

  if (v4)
  {
    v5 = *((_QWORD *)self + 15);
    v6 = sub_10000883C();
    sub_10021A4D8(v5, v6);
  }
  v7.receiver = self;
  v7.super_class = (Class)NIServerDevicePresenceSession;
  -[NIServerBaseSession invalidate](&v7, "invalidate");
}

- (id)_disableAllServicesAndSendHangupSignal:(BOOL)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NIServerDevicePresenceSession;
  v4 = -[NIServerBaseSession disableAllServices](&v8, "disableAllServices", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  sub_100186C64((uint64_t)self + 128);
  objc_msgSend(*((id *)self + 8), "invalidate");
  v6 = (void *)*((_QWORD *)self + 8);
  *((_QWORD *)self + 8) = 0;

  return v5;
}

- (id)discoveryTokenFromIdentifier:(unint64_t)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerDevicePresenceSession objectFromIdentifier:](self, "objectFromIdentifier:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "discoveryToken"));

  return v4;
}

- (optional<unsigned)identifierFromDiscoveryToken:(id)a3
{
  id v3;
  _BOOL8 v4;
  optional<unsigned long long> result;

  v3 = objc_msgSend(a3, "hash");
  v4 = 1;
  result.__engaged_ = v4;
  result.var0 = ($BEC950A715106DE229A2E4BA1089E24D)v3;
  return result;
}

- (id)objectFromIdentifier:(unint64_t)a3
{
  std::mutex *v4;
  _QWORD *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v15;

  v15 = a3;
  v4 = (std::mutex *)((char *)self + 208);
  std::mutex::lock((std::mutex *)((char *)self + 208));
  v5 = sub_1000550B8((_QWORD *)self + 21, &v15);
  if (v5)
  {
    v6 = (id)v5[3];
  }
  else
  {
    v7 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003D300C((uint64_t)&v15, v7, v8, v9, v10, v11, v12, v13);
    v6 = 0;
  }
  std::mutex::unlock(v4);
  return v6;
}

- (void)processVisionInput:(id)a3
{
  id v4;

  v4 = a3;
  dispatch_assert_queue_V2(*((dispatch_queue_t *)self + 10));
  objc_msgSend(*((id *)self + 8), "acceptVisionInput:", v4);

}

- (void)updatesEngine:(id)a3 object:(id)a4 didUpdateRegion:(id)a5 previousRegion:(id)a6 regionTransitionSuppressed:(BOOL)a7
{
  id v12;
  id v13;
  unint64_t v14;
  unint64_t v15;
  void *v16;
  NSObject *v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;

  v12 = a3;
  v13 = a4;
  v14 = (unint64_t)a5;
  v15 = (unint64_t)a6;
  v16 = (void *)v15;
  if (*((id *)self + 8) != v12)
    __assert_rtn("-[NIServerDevicePresenceSession updatesEngine:object:didUpdateRegion:previousRegion:regionTransitionSuppressed:]", "NIServerDevicePresenceSession.mm", 750, "engine == _updatesEngine");
  if (v14 | v15 && !a7)
  {
    v17 = *((_QWORD *)self + 10);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100187188;
    v18[3] = &unk_10080A2B8;
    v18[4] = self;
    v19 = (id)v14;
    v20 = v16;
    v21 = v13;
    dispatch_async(v17, v18);

  }
}

- (void)updatesEngine:(id)a3 didUpdateNearbyObjects:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)self + 43), "token"));

  if (v6)
  {
    v7 = *((_QWORD *)self + 10);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100187380;
    v8[3] = &unk_1007FA518;
    v8[4] = self;
    v9 = v5;
    dispatch_async(v7, v8);

  }
}

- (BOOL)airPodsProxCardSampleTooOld:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  double v9;
  double v11;
  double v12;
  double v13;
  double v14;
  NSObject *v15;
  int v17;
  double v18;
  __int16 v19;
  double v20;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)self + 43), "innerBoundary"));
  if (objc_msgSend(v5, "devicePresencePreset") == (id)1)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "model"));
    v7 = -[NIServerDevicePresenceSession isAirPods:](self, "isAirPods:", CBProductIDFromNSString());

    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      objc_msgSend(v8, "doubleForKey:", CFSTR("NIDevicePresenceMaxSampleAgeOverrideSeconds"));
      if (v9 >= 600.0 || v9 <= 1.0)
        v11 = 5.0;
      else
        v11 = v9;
      v12 = sub_10000883C();
      objc_msgSend(v4, "machContinuousTimeSeconds");
      v14 = v13;
      LOBYTE(v7) = v13 < v12 - v11;
      if (v13 < v12 - v11)
      {
        v15 = qword_10085F520;
        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_INFO))
        {
          v17 = 134218240;
          v18 = v14;
          v19 = 2048;
          v20 = v11;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "#ses-devicepresence,Ignoring sample with a timestamp of %f, which is more than %f seconds old.", (uint8_t *)&v17, 0x16u);
        }
      }

    }
  }
  else
  {

    LOBYTE(v7) = 0;
  }

  return v7;
}

- (BOOL)isAirPods:(unsigned int)a3
{
  return (a3 - 8194 < 0x23) & (0x452863001uLL >> (a3 - 2));
}

- (NIDevicePresenceConfiguration)configuration
{
  return (NIDevicePresenceConfiguration *)objc_getProperty(self, a2, 344, 1);
}

- (void).cxx_destruct
{
  uint64_t v3;

  objc_storeStrong((id *)self + 43, 0);
  objc_storeStrong((id *)self + 40, 0);
  sub_10018839C((uint64_t)self + 272);
  std::mutex::~mutex((std::mutex *)((char *)self + 208));
  sub_10018839C((uint64_t)self + 168);
  sub_1001878CC((uint64_t)self + 128);
  v3 = *((_QWORD *)self + 15);
  *((_QWORD *)self + 15) = 0;
  if (v3)
    sub_100187DC4((uint64_t)self + 120, v3);
  sub_10001AE68((uint64_t)self + 104);
  objc_storeStrong((id *)self + 12, 0);
  objc_storeStrong((id *)self + 11, 0);
  objc_storeStrong((id *)self + 10, 0);
  objc_storeStrong((id *)self + 8, 0);
  sub_10001AE68((uint64_t)self + 48);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 6) = 0;
  *((_QWORD *)self + 7) = 0;
  *((_QWORD *)self + 13) = 0;
  *((_QWORD *)self + 14) = 0;
  *((_QWORD *)self + 15) = 0;
  *((_BYTE *)self + 128) = 0;
  *((_BYTE *)self + 160) = 0;
  *(_OWORD *)((char *)self + 168) = 0u;
  *(_OWORD *)((char *)self + 184) = 0u;
  *((_DWORD *)self + 50) = 1065353216;
  *((_QWORD *)self + 26) = 850045863;
  *(_OWORD *)((char *)self + 216) = 0u;
  *(_OWORD *)((char *)self + 232) = 0u;
  *(_OWORD *)((char *)self + 248) = 0u;
  *((_QWORD *)self + 33) = 0;
  *((_OWORD *)self + 17) = 0u;
  *((_OWORD *)self + 18) = 0u;
  *((_DWORD *)self + 76) = 1065353216;
  *((_BYTE *)self + 328) = 0;
  *((_BYTE *)self + 336) = 0;
  return self;
}

@end
