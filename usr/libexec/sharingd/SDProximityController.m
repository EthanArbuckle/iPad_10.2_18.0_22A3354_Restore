@implementation SDProximityController

+ (SDProximityController)sharedController
{
  if (qword_1007C6650 != -1)
    dispatch_once(&qword_1007C6650, &stru_100715C70);
  return (SDProximityController *)(id)qword_1007C6658;
}

- (SDProximityController)init
{
  SDProximityController *v2;
  SDProximityController *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *deviceIdToDelegate;
  NSMutableDictionary *v6;
  NSMutableDictionary *deviceIdToPairingAgentDeviceID;
  NSMutableDictionary *v8;
  NSMutableDictionary *deviceIdToCurrentPreset;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SDProximityController;
  v2 = -[SDProximityController init](&v11, "init");
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    deviceIdToDelegate = v3->_deviceIdToDelegate;
    v3->_deviceIdToDelegate = v4;

    v6 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    deviceIdToPairingAgentDeviceID = v3->_deviceIdToPairingAgentDeviceID;
    v3->_deviceIdToPairingAgentDeviceID = v6;

    v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    deviceIdToCurrentPreset = v3->_deviceIdToCurrentPreset;
    v3->_deviceIdToCurrentPreset = v8;

    *(int64x2_t *)&v3->_currentRestartDelay = vdupq_n_s64(3uLL);
    v3->_currentRestartCount = 0;
    -[SDProximityController _runSession](v3, "_runSession");
  }
  return v3;
}

- (void)sender:(id)a3 notifyBluetoothSample:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;

  v6 = a4;
  v7 = a3;
  v8 = 2 * (objc_msgSend(v6, "deviceActionType") == 36);
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "deviceIdentifier"));
  -[SDProximityController sender:_notifyBluetoothSample:withId:forType:](self, "sender:_notifyBluetoothSample:withId:forType:", v7, v6, v9, v8);

}

- (void)sender:(id)a3 notifyBluetoothSample:(id)a4 forType:(unint64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = v8;
  if ((a5 | 2) == 3)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "deviceIdentifier"));
    -[SDProximityController sender:_notifyBluetoothSample:withId:forType:](self, "sender:_notifyBluetoothSample:withId:forType:", v11, v9, v10, a5);

  }
}

- (void)notifyDeviceLost:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  __int16 v11;
  void *v12;

  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  v5 = sub_1000804F4();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_deviceIdToDelegate, "allKeys"));
    v9 = 138412546;
    v10 = v4;
    v11 = 2112;
    v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "removing device: %@ from list: %@", (uint8_t *)&v9, 0x16u);

  }
  os_unfair_lock_unlock(&self->_lock);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "deviceIdentifier"));
  -[SDProximityController _removeDevice:](self, "_removeDevice:", v8);

}

- (void)clearDeviceList
{
  os_unfair_lock_s *p_lock;
  id v4;
  NSObject *v5;
  NSMutableDictionary *deviceIdToCurrentPreset;
  int v7;
  NSMutableDictionary *v8;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = sub_1000804F4();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    deviceIdToCurrentPreset = self->_deviceIdToCurrentPreset;
    v7 = 138412290;
    v8 = deviceIdToCurrentPreset;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "clearing deviceIdToCurrentPreset: %@", (uint8_t *)&v7, 0xCu);
  }

  -[NSMutableDictionary removeAllObjects](self->_deviceIdToCurrentPreset, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_deviceIdToDelegate, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_deviceIdToPairingAgentDeviceID, "removeAllObjects");
  os_unfair_lock_unlock(p_lock);
}

- (void)sender:(id)a3 _notifyBluetoothSample:(id)a4 withId:(id)a5 forType:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  unsigned int v13;
  int v14;
  os_unfair_lock_s *p_lock;
  NSMutableDictionary *deviceIdToDelegate;
  void *v17;
  void *v18;
  NSMutableDictionary *deviceIdToPairingAgentDeviceID;
  void *v20;
  id v21;
  id v22;
  double v23;
  void *v24;
  void *v25;
  id v26;
  NSDictionary *niSessions;
  _UNKNOWN **v28;
  id v29;
  double v30;
  void *v31;
  void *v32;
  id v33;
  double v34;
  void *v35;
  NSObject *v36;
  void *v37;
  id v38;
  int v39;
  id v40;
  NSObject *v41;
  id v42;
  unsigned int v43;
  id v44;
  double v45;
  void *v46;
  void *v47;
  int64_t v48;
  int64_t v49;
  NSDictionary *v50;
  void *v51;
  id v52;
  NSObject *v53;
  id v54;
  unsigned int v55;
  void *v56;
  int v57;
  _QWORD v58[2];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = objc_msgSend(v11, "rssi");
  if ((v13 & 0x80000000) == 0)
    goto LABEL_11;
  v14 = v13;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  deviceIdToDelegate = self->_deviceIdToDelegate;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "deviceIdentifier"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](deviceIdToDelegate, "setObject:forKeyedSubscript:", v10, v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "pairingAgentDeviceIdentifier"));
  deviceIdToPairingAgentDeviceID = self->_deviceIdToPairingAgentDeviceID;
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "deviceIdentifier"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](deviceIdToPairingAgentDeviceID, "setObject:forKeyedSubscript:", v18, v20);

  os_unfair_lock_unlock(&self->_lock);
  v21 = objc_msgSend(v11, "channel");
  switch(a6)
  {
    case 3uLL:
      v29 = objc_alloc((Class)NIBluetoothSample);
      v30 = (double)v14;
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "UUIDString"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "model"));
      v26 = objc_msgSend(v29, "initWithRSSI:identifier:model:channel:machContinuousTimeSeconds:", v31, v32, v21, v30, (double)mach_continuous_time());

      os_unfair_lock_lock(&self->_lock);
      niSessions = self->_niSessions;
      v28 = &off_10074B460;
      goto LABEL_8;
    case 2uLL:
      v33 = objc_alloc((Class)NIBluetoothSample);
      v34 = (double)v14;
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "UUIDString"));
      v26 = objc_msgSend(v33, "initWithRSSI:identifier:model:channel:machContinuousTimeSeconds:", v35, CFSTR("DovePeace"), v21, v34, (double)mach_continuous_time());

      os_unfair_lock_lock(&self->_lock);
      niSessions = self->_niSessions;
      v28 = &off_10074B448;
      goto LABEL_8;
    case 1uLL:
      v22 = objc_alloc((Class)NIBluetoothSample);
      v23 = (double)v14;
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "UUIDString"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "model"));
      v26 = objc_msgSend(v22, "initWithRSSI:identifier:model:channel:machContinuousTimeSeconds:", v24, v25, v21, v23, (double)mach_continuous_time());

      os_unfair_lock_lock(&self->_lock);
      niSessions = self->_niSessions;
      v28 = &off_10074B430;
LABEL_8:
      v36 = objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](niSessions, "objectForKeyedSubscript:", v28));
      os_unfair_lock_unlock(p_lock);
      goto LABEL_9;
  }
  v38 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "model"));
  if ((objc_msgSend(v38, "isEqual:", CFSTR("AirPods1,1")) & 1) != 0
    || (objc_msgSend(v38, "isEqual:", CFSTR("AirPods1,3")) & 1) != 0
    || objc_msgSend(v38, "isEqual:", CFSTR("AirPodsPro1,1")))
  {

  }
  else
  {
    v42 = objc_msgSend(objc_alloc((Class)SFHeadphoneProduct), "initWithBluetoothModel:", v38);
    v43 = objc_msgSend(v42, "isAirPods");

    if (!v43)
    {

      goto LABEL_22;
    }
  }
  v39 = _os_feature_enabled_impl("Sharing", "AirPodsProxNiAsSampleProvider");

  if (!v39)
  {
LABEL_22:
    v44 = objc_alloc((Class)NIBluetoothSample);
    v45 = (double)v14;
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "UUIDString"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "model"));
    v26 = objc_msgSend(v44, "initWithRSSI:identifier:model:channel:machContinuousTimeSeconds:", v46, v47, v21, v45, (double)mach_continuous_time());

    v48 = -[SDProximityController _deviceToPreset:](self, "_deviceToPreset:", v11);
    if (!v48)
    {
      v54 = sub_1000804F4();
      v36 = objc_claimAutoreleasedReturnValue(v54);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        v55 = objc_msgSend(v11, "deviceActionType");
        v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "description"));
        v57 = 67109378;
        LODWORD(v58[0]) = v55;
        WORD2(v58[0]) = 2112;
        *(_QWORD *)((char *)v58 + 6) = v56;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "unexpected action type: %d for device: %@", (uint8_t *)&v57, 0x12u);

      }
      goto LABEL_10;
    }
    v49 = v48;
    os_unfair_lock_lock(&self->_lock);
    v50 = self->_niSessions;
    v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v49));
    v36 = objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v50, "objectForKeyedSubscript:", v51));

    os_unfair_lock_unlock(p_lock);
    v52 = sub_1000804F4();
    v53 = objc_claimAutoreleasedReturnValue(v52);
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
    {
      v57 = 138412290;
      v58[0] = v12;
      _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "Notify Bluetooth Sample with ID: %@, SDProximityController forwarding sample to NI", (uint8_t *)&v57, 0xCu);
    }

LABEL_9:
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject devicePresenceNotifier](v36, "devicePresenceNotifier"));
    objc_msgSend(v37, "notifyBluetoothSample:", v26);

LABEL_10:
    goto LABEL_11;
  }
  v40 = sub_1000804F4();
  v41 = objc_claimAutoreleasedReturnValue(v40);
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
  {
    v57 = 138412290;
    v58[0] = v12;
    _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEBUG, "Notify Bluetooth Sample with ID: %@, SDProximityController not sending to NI", (uint8_t *)&v57, 0xCu);
  }

LABEL_11:
}

- (unint64_t)checkDeviceRegion:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;
  NSMutableDictionary *deviceIdToCurrentPreset;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  unint64_t v11;
  NSMutableDictionary *v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  NSMutableDictionary *v16;
  void *v17;
  void *v18;
  unsigned __int8 v19;
  NSMutableDictionary *v20;
  void *v21;
  void *v22;
  unsigned int v23;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "deviceIdentifier"));

  if (v6)
  {
    deviceIdToCurrentPreset = self->_deviceIdToCurrentPreset;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "deviceIdentifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](deviceIdToCurrentPreset, "objectForKeyedSubscript:", v8));
    v10 = objc_msgSend(v9, "isEqual:", &off_10074B430);

    if ((v10 & 1) != 0)
    {
      v11 = 1;
    }
    else
    {
      v12 = self->_deviceIdToCurrentPreset;
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "deviceIdentifier"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", v13));
      v15 = objc_msgSend(v14, "isEqual:", &off_10074B448);

      if ((v15 & 1) != 0)
      {
        v11 = 2;
      }
      else
      {
        v16 = self->_deviceIdToCurrentPreset;
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "deviceIdentifier"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v16, "objectForKeyedSubscript:", v17));
        v19 = objc_msgSend(v18, "isEqual:", &off_10074B478);

        if ((v19 & 1) != 0)
        {
          v11 = 3;
        }
        else
        {
          v20 = self->_deviceIdToCurrentPreset;
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "deviceIdentifier"));
          v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v20, "objectForKeyedSubscript:", v21));
          v23 = objc_msgSend(v22, "isEqual:", &off_10074B460);

          if (v23)
            v11 = 4;
          else
            v11 = 0;
        }
      }
    }
  }
  else
  {
    v11 = 0;
  }
  os_unfair_lock_unlock(p_lock);

  return v11;
}

- (void)_notifyRegionLost:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = objc_alloc((Class)NSUUID);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "deviceIdentifier"));

  v7 = objc_msgSend(v5, "initWithUUIDString:", v6);
  -[SDProximityController _removeDevice:](self, "_removeDevice:", v7);

}

- (void)_removeDevice:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  NSMutableDictionary *deviceIdToCurrentPreset;
  id v8;
  NSObject *v9;
  NSMutableDictionary *v10;
  int v11;
  id v12;
  __int16 v13;
  NSMutableDictionary *v14;

  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary removeObjectForKey:](self->_deviceIdToDelegate, "removeObjectForKey:", v4);
  -[NSMutableDictionary removeObjectForKey:](self->_deviceIdToPairingAgentDeviceID, "removeObjectForKey:", v4);
  v5 = sub_1000804F4();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    deviceIdToCurrentPreset = self->_deviceIdToCurrentPreset;
    v11 = 138412546;
    v12 = v4;
    v13 = 2112;
    v14 = deviceIdToCurrentPreset;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "removing devicepresetid: %@ from presetidlist: %@", (uint8_t *)&v11, 0x16u);
  }

  v8 = sub_1000804F4();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[NSMutableDictionary count](self->_deviceIdToDelegate, "count")));
    v11 = 138412546;
    v12 = v4;
    v13 = 2112;
    v14 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "removing devicepresetid: %@ from delegatelist size: %@", (uint8_t *)&v11, 0x16u);

  }
  -[NSMutableDictionary removeObjectForKey:](self->_deviceIdToCurrentPreset, "removeObjectForKey:", v4);
  -[NSMutableDictionary removeObjectForKey:](self->_deviceIdToDelegate, "removeObjectForKey:", v4);
  os_unfair_lock_unlock(&self->_lock);

}

- (void)_triggerDeviceProximity:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;
  NSObject *v7;
  id v8;
  int v9;
  id v10;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_deviceIdToDelegate, "objectForKeyedSubscript:", v4));
  os_unfair_lock_unlock(&self->_lock);
  if (v6)
  {
    os_unfair_lock_lock(&self->_lock);
    v7 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_deviceIdToPairingAgentDeviceID, "objectForKeyedSubscript:", v4));
    os_unfair_lock_unlock(p_lock);
    objc_msgSend(v6, "proximityDeviceDidTrigger:", v7);
  }
  else
  {
    v8 = sub_1000804F4();
    v7 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412290;
      v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Don't have a delegate to call for device with identifier: %@", (uint8_t *)&v9, 0xCu);
    }
  }

}

- (void)_newDeviceOrRegion:(id)a3 region:(id)a4
{
  os_unfair_lock_s *p_lock;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;

  p_lock = &self->_lock;
  v7 = a4;
  v8 = a3;
  os_unfair_lock_lock(p_lock);
  v9 = objc_alloc((Class)NSUUID);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "deviceIdentifier"));

  v13 = objc_msgSend(v9, "initWithUUIDString:", v10);
  v11 = objc_msgSend(v7, "devicePresencePreset");

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v11));
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_deviceIdToCurrentPreset, "setObject:forKeyedSubscript:", v12, v13);

  os_unfair_lock_unlock(p_lock);
  -[SDProximityController _triggerDeviceProximity:](self, "_triggerDeviceProximity:", v13);

}

- (void)_runSession
{
  id v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  SDProximityController *v8;
  NSDictionary *v9;
  NSDictionary *niSessions;
  NISession *v11;
  NISession *niAirPodsSession;
  id v13;
  id v14;
  __int128 v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  NISession *v20;
  id v21;
  id v22;
  const __CFString *v23;
  uint64_t v24;
  id v25;
  id v26;
  id v27;
  id v28;
  NSObject *v29;
  SDProximityController *v30;
  void *v31;
  id v32;
  SDProximityController *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  NSObject *v38;
  NISession *v39;
  void *v40;
  __int128 v41;
  id v42;
  uint64_t v43;
  id v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint8_t buf[4];
  NISession *v51;
  __int16 v52;
  void *v53;
  _BYTE v54[128];
  _QWORD v55[4];
  _QWORD v56[4];

  v55[0] = &off_10074B430;
  v3 = objc_alloc_init((Class)NISession);
  v56[0] = v3;
  v55[1] = &off_10074B448;
  v4 = objc_alloc_init((Class)NISession);
  v56[1] = v4;
  v55[2] = &off_10074B478;
  v5 = objc_alloc_init((Class)NISession);
  v56[2] = v5;
  v55[3] = &off_10074B460;
  v6 = objc_alloc_init((Class)NISession);
  v56[3] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v56, v55, 4));

  v8 = self;
  os_unfair_lock_lock(&self->_lock);
  v9 = (NSDictionary *)objc_msgSend(v7, "copy");
  niSessions = self->_niSessions;
  self->_niSessions = v9;

  v11 = (NISession *)objc_alloc_init((Class)NISession);
  niAirPodsSession = self->_niAirPodsSession;
  self->_niAirPodsSession = v11;

  os_unfair_lock_unlock(&self->_lock);
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v13 = v7;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
  v42 = v13;
  if (v14)
  {
    v16 = v14;
    v43 = *(_QWORD *)v47;
    *(_QWORD *)&v15 = 138412546;
    v41 = v15;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v47 != v43)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)v17);
        v19 = objc_msgSend(objc_alloc((Class)NIRegionPredicate), "initWithName:devicePresencePreset:", CFSTR("sensorMax"), 5);
        v20 = (NISession *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", v18));
        v21 = 0;
        switch(objc_msgSend(v18, "intValue"))
        {
          case 1u:
            v22 = objc_alloc((Class)NIRegionPredicate);
            v23 = CFSTR("immediate");
            v24 = 1;
            goto LABEL_11;
          case 2u:
            v22 = objc_alloc((Class)NIRegionPredicate);
            v23 = CFSTR("near");
            v24 = 2;
            goto LABEL_11;
          case 3u:
            v22 = objc_alloc((Class)NIRegionPredicate);
            v23 = CFSTR("desk");
            v24 = 3;
            goto LABEL_11;
          case 6u:
            v22 = objc_alloc((Class)NIRegionPredicate);
            v23 = CFSTR("superImmediate");
            v24 = 6;
LABEL_11:
            v21 = objc_msgSend(v22, "initWithName:devicePresencePreset:", v23, v24, v41);
            break;
          default:
            break;
        }
        v25 = objc_alloc((Class)NIDevicePresenceConfiguration);
        v45 = 0;
        v26 = objc_msgSend(v25, "initWithInnerBoundary:outerBoundary:error:", v21, v19, &v45);
        v27 = v45;
        objc_msgSend(v26, "setAllowedDevices:", 0);
        -[NISession setDelegate:](v20, "setDelegate:", v8);
        v28 = sub_1000804F4();
        v29 = objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          v30 = v8;
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "description"));
          *(_DWORD *)buf = v41;
          v51 = v20;
          v52 = 2112;
          v53 = v31;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "starting nisession:%@, with configuration:%@", buf, 0x16u);

          v8 = v30;
          v13 = v42;
        }

        -[NISession runWithConfiguration:](v20, "runWithConfiguration:", v26);
        v17 = (char *)v17 + 1;
      }
      while (v16 != v17);
      v16 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
    }
    while (v16);
  }

  if (_os_feature_enabled_impl("Sharing", "AirPodsProxNiAsSampleProvider"))
  {
    v32 = objc_msgSend(objc_alloc((Class)NIRegionPredicate), "initWithName:devicePresencePreset:", CFSTR("immediate"), 1);
    v33 = v8;
    v34 = objc_msgSend(objc_alloc((Class)NIRegionPredicate), "initWithName:devicePresencePreset:", CFSTR("sensorMax"), 5);
    v44 = 0;
    v35 = objc_msgSend(objc_alloc((Class)NIDevicePresenceConfiguration), "initWithInnerBoundary:outerBoundary:error:", v32, v34, &v44);
    v36 = v44;
    objc_msgSend(v35, "setAllowedDevices:", 8);
    -[NISession setDelegate:](v33->_niAirPodsSession, "setDelegate:", v33);
    v37 = sub_1000804F4();
    v38 = objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      v39 = v33->_niAirPodsSession;
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "description"));
      *(_DWORD *)buf = 138412546;
      v51 = v39;
      v13 = v42;
      v52 = 2112;
      v53 = v40;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "starting nisession:%@, with configuration:%@", buf, 0x16u);

    }
    -[NISession runWithConfiguration:](v33->_niAirPodsSession, "runWithConfiguration:", v35);

  }
}

- (int64_t)_deviceToPreset:(id)a3
{
  id v3;
  int64_t v4;
  unsigned int v6;
  id v7;
  id v8;
  unsigned __int8 v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  unsigned __int8 v13;

  v3 = a3;
  if (objc_msgSend(v3, "deviceActionType") == 24
    || objc_msgSend(v3, "deviceActionType") == 5)
  {
    goto LABEL_3;
  }
  v6 = objc_msgSend(v3, "deviceActionType");
  v4 = 1;
  if (v6 != 11 && v6 != 33)
  {
    if (objc_msgSend(v3, "deviceActionType") == 36
      || (objc_msgSend(v3, "needsSetup") & 1) != 0)
    {
      goto LABEL_3;
    }
    v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "model"));
    if ((objc_msgSend(v7, "isEqual:", CFSTR("AirPods1,1")) & 1) != 0
      || (objc_msgSend(v7, "isEqual:", CFSTR("AirPods1,3")) & 1) != 0
      || (objc_msgSend(v7, "isEqual:", CFSTR("AirPodsPro1,1")) & 1) != 0
      || (objc_msgSend(v7, "isEqual:", CFSTR("PowerbeatsPro1,1")) & 1) != 0
      || objc_msgSend(v7, "isEqual:", CFSTR("Device1,8202")))
    {

LABEL_3:
      v4 = 1;
      goto LABEL_4;
    }
    v8 = objc_msgSend(objc_alloc((Class)SFHeadphoneProduct), "initWithBluetoothModel:", v7);
    v9 = objc_msgSend(v8, "showsStatus");

    if ((v9 & 1) != 0)
      goto LABEL_3;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "model"));
    v11 = objc_msgSend(v10, "isEqual:", CFSTR("Device1,21760"));

    if ((v11 & 1) != 0)
      goto LABEL_3;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "model"));
    v13 = objc_msgSend(&off_10074FA00, "containsObject:", v12);

    if ((v13 & 1) != 0)
      v4 = 2;
    else
      v4 = (objc_msgSend(v3, "deviceFlags") >> 11) & 1;
  }
LABEL_4:

  return v4;
}

- (NSMutableDictionary)deviceIdToCurrentPreset
{
  return self->_deviceIdToCurrentPreset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceIdToCurrentPreset, 0);
  objc_storeStrong((id *)&self->_deviceIdToPairingAgentDeviceID, 0);
  objc_storeStrong((id *)&self->_deviceIdToDelegate, 0);
  objc_storeStrong((id *)&self->_niAirPodsSession, 0);
  objc_storeStrong((id *)&self->_niSessions, 0);
}

- (void)sessionBegan
{
  os_unfair_lock_s *p_lock;
  id v4;
  NSObject *v5;
  unint64_t currentRestartDelay;
  int v7;
  unint64_t v8;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = sub_1000804F4();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    currentRestartDelay = self->_currentRestartDelay;
    v7 = 134217984;
    v8 = currentRestartDelay;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "session started, resetting previous delay: %llu", (uint8_t *)&v7, 0xCu);
  }

  self->_currentRestartDelay = self->_defaultRestartDelay;
  os_unfair_lock_unlock(p_lock);
}

- (void)restart
{
  os_unfair_lock_s *p_lock;
  unint64_t v4;
  id v5;
  NSObject *v6;
  unint64_t currentRestartCount;
  NSUInteger v8;
  NSDictionary *niSessions;
  NISession *niAirPodsSession;
  unint64_t currentRestartDelay;
  id v12;
  NSObject *v13;
  dispatch_time_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  _QWORD block[5];
  uint8_t buf[4];
  unint64_t v20;
  __int16 v21;
  NSUInteger v22;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_currentRestartCount + 1;
  self->_currentRestartCount = v4;
  if (v4 >= -[NSDictionary count](self->_niSessions, "count"))
  {
    niSessions = self->_niSessions;
    self->_niSessions = 0;

    niAirPodsSession = self->_niAirPodsSession;
    self->_niAirPodsSession = 0;

    self->_currentRestartCount = 0;
    currentRestartDelay = self->_currentRestartDelay;
    self->_currentRestartDelay = 2 * currentRestartDelay;
    os_unfair_lock_unlock(p_lock);
    v12 = sub_1000804F4();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v20 = currentRestartDelay;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "restarting session with delay: %llu (s)", buf, 0xCu);
    }

    v14 = dispatch_time(0, 1000000000 * currentRestartDelay);
    v16 = SFMainQueue(v14, v15);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100081A98;
    block[3] = &unk_1007146D8;
    block[4] = self;
    dispatch_after(v14, v17, block);

  }
  else
  {
    os_unfair_lock_unlock(p_lock);
    v5 = sub_1000804F4();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      currentRestartCount = self->_currentRestartCount;
      v8 = -[NSDictionary count](self->_niSessions, "count");
      *(_DWORD *)buf = 134218240;
      v20 = currentRestartCount;
      v21 = 2048;
      v22 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "restart count is: %llu out of %lu", buf, 0x16u);
    }

  }
}

- (void)sessionDidStartRunning:(id)a3
{
  -[SDProximityController sessionBegan](self, "sessionBegan", a3);
}

- (void)session:(id)a3 didUpdateNearbyObjects:(id)a4
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = sub_1000804F4();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "didUpdateNearbyObjects", v6, 2u);
  }

}

- (void)session:(id)a3 didDiscoverNearbyObject:(id)a4
{
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  int v8;
  id v9;

  v4 = a4;
  v5 = sub_1000804F4();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "deviceIdentifier")));
    v8 = 136315138;
    v9 = objc_msgSend(v7, "UTF8String");
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "didDiscoverNearbyObject object: %s", (uint8_t *)&v8, 0xCu);

  }
}

- (void)session:(id)a3 object:(id)a4 didUpdateRegion:(id)a5 previousRegion:(id)a6
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  int v15;
  id v16;
  __int16 v17;
  id v18;

  v8 = a4;
  v9 = a5;
  v10 = sub_1000804F4();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "deviceIdentifier")));
    v13 = objc_msgSend(v12, "UTF8String");
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "description")));
    v15 = 136315394;
    v16 = v13;
    v17 = 2080;
    v18 = objc_msgSend(v14, "UTF8String");
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "didUpdateRegion object: %s newRegion: %s", (uint8_t *)&v15, 0x16u);

  }
  if (v9 && objc_msgSend(v9, "devicePresencePreset") != (id)5)
    -[SDProximityController _newDeviceOrRegion:region:](self, "_newDeviceOrRegion:region:", v8, v9);
  else
    -[SDProximityController _notifyRegionLost:](self, "_notifyRegionLost:", v8);

}

- (void)session:(id)a3 didFailWithError:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;

  v5 = a4;
  v6 = sub_1000804F4();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "didFailWithError error: %@", (uint8_t *)&v8, 0xCu);
  }

  -[SDProximityController restart](self, "restart");
}

- (void)session:(id)a3 didInvalidateWithError:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;

  v5 = a4;
  v6 = sub_1000804F4();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "didInvalidateWithError  error: %@", (uint8_t *)&v8, 0xCu);
  }

  -[SDProximityController restart](self, "restart");
}

- (void)sessionWasSuspended:(id)a3
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = sub_1000804F4();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "sessionWasSuspended waiting for ended suspension to resume. This should happen when bt is toggled back on", v5, 2u);
  }

}

- (void)sessionSuspensionEnded:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = sub_1000804F4();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "sessionSuspensionEnded attempting to resume", v6, 2u);
  }

  -[SDProximityController restart](self, "restart");
}

@end
