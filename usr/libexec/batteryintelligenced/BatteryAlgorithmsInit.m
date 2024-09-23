@implementation BatteryAlgorithmsInit

+ (id)sharedInstance
{
  if (qword_1000351B0 != -1)
    dispatch_once(&qword_1000351B0, &stru_10002C580);
  return (id)qword_1000351A8;
}

- (id)getDeviceModel
{
  int v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  int v8;
  uint64_t v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  int v14;
  NSObject *v15;
  size_t size;
  uint8_t buf[4];
  int v18;

  size = 0;
  v2 = sysctlbyname("hw.targettype", 0, &size, 0, 0);
  if (v2)
  {
    v8 = v2;
    v9 = qword_1000351B8;
    if (os_log_type_enabled((os_log_t)qword_1000351B8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v18 = v8;
      v10 = "Failed to read size (%d).";
      v11 = v9;
      v12 = 8;
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
    }
    return 0;
  }
  v3 = malloc_type_malloc(size, 0x100004077774924uLL);
  if (!v3)
  {
    v13 = qword_1000351B8;
    if (os_log_type_enabled((os_log_t)qword_1000351B8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v10 = "Failed to malloc.";
      v11 = v13;
      v12 = 2;
      goto LABEL_11;
    }
    return 0;
  }
  v4 = v3;
  v5 = sysctlbyname("hw.targettype", v3, &size, 0, 0);
  if (v5)
  {
    v14 = v5;
    v15 = qword_1000351B8;
    if (os_log_type_enabled((os_log_t)qword_1000351B8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v18 = v14;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Failed to read value (%d).", buf, 8u);
    }
    v6 = 0;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v4));
  }
  free(v4);
  return v6;
}

- (BatteryAlgorithmsInit)init
{
  BatteryAlgorithmsInit *v2;
  os_log_t v3;
  void *v4;
  NSObject *v5;
  CFMutableDictionaryRef v6;
  uint64_t v7;
  NSDictionary *battData;
  void *v9;
  NSMutableDictionary *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSMutableDictionary *smcKeys;
  uint64_t v19;
  NSMutableDictionary *deviceState;
  int v21;
  int v22;
  NSObject *v23;
  _BOOL8 v24;
  id v25;
  void *v26;
  uint64_t v27;
  unsigned int v28;
  NSObject *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  NSMutableDictionary *v36;
  NSMutableDictionary *preInitData;
  NSObject *v38;
  BatteryAlgorithmsInit *v39;
  void *v41;
  void *v42;
  objc_super v43;
  uint8_t buf[8];
  _QWORD v45[2];
  _QWORD v46[2];
  uint8_t v47[4];
  int v48;

  v43.receiver = self;
  v43.super_class = (Class)BatteryAlgorithmsInit;
  v2 = -[BatteryAlgorithmsInit init](&v43, "init");
  if (v2)
  {
    v3 = os_log_create("com.apple.batteryintelligence", "BatteryAlgoInputs");
    v4 = (void *)qword_1000351B8;
    qword_1000351B8 = (uint64_t)v3;

    v5 = qword_1000351B8;
    if (os_log_type_enabled((os_log_t)qword_1000351B8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Starting BatteryAlgorithmsInit", buf, 2u);
    }
    v6 = sub_1000174D8();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    battData = v2->_battData;
    v2->_battData = (NSDictionary *)v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryAlgorithmsInit battData](v2, "battData"));
    v10 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", CFSTR("BatteryData")));
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", CFSTR("ChargerData")));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", CFSTR("LifetimeData")));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", CFSTR("AlgoChemID")));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", CFSTR("Serial")));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", CFSTR("CycleCount")));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "objectForKey:", CFSTR("VacVoltageLimit")));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", CFSTR("TimeAtHighSoc")));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", CFSTR("TotalOperatingTime")));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v14, CFSTR("CycleCount"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v15, CFSTR("VacVoltageLimit"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v13, CFSTR("AlgoChemID"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v16, CFSTR("TimeAtHighSoc"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v41, CFSTR("Serial"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v17, CFSTR("TotalOperatingTime"));

    smcKeys = v2->_smcKeys;
    v2->_smcKeys = v10;

    v19 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    deviceState = v2->_deviceState;
    v2->_deviceState = (NSMutableDictionary *)v19;

    *(_QWORD *)buf = 0;
    v21 = IOPSGetBatteryHealthState(buf);
    if (v21)
    {
      v22 = v21;
      v23 = qword_1000351B8;
      if (os_log_type_enabled((os_log_t)qword_1000351B8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v47 = 67109120;
        v48 = v22;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Error fetching battery health state: %d", v47, 8u);
      }
      v24 = 1;
    }
    else
    {
      v25 = *(id *)buf;
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("IOPSBatteryHealthState")));
      v27 = objc_opt_class(NSNumber);
      if ((objc_opt_isKindOfClass(v26, v27) & 1) != 0)
      {
        v28 = objc_msgSend(v26, "intValue");

        v24 = v28 != 4;
      }
      else
      {
        v29 = qword_1000351B8;
        if (os_log_type_enabled((os_log_t)qword_1000351B8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v47 = 0;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Battery health info was not returned", v47, 2u);
        }

        v24 = 0;
      }
    }
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v24));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_deviceState, "setObject:forKeyedSubscript:", v30, CFSTR("BatteryAuthPass"));

    v31 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryAlgorithmsInit getDeviceModel](v2, "getDeviceModel"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_deviceState, "setObject:forKeyedSubscript:", v31, CFSTR("DeviceType"));

    v32 = objc_alloc((Class)NSMutableDictionary);
    v45[0] = CFSTR("smcData");
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryAlgorithmsInit smcKeys](v2, "smcKeys"));
    v45[1] = CFSTR("systemState");
    v46[0] = v33;
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryAlgorithmsInit deviceState](v2, "deviceState"));
    v46[1] = v34;
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v46, v45, 2));
    v36 = (NSMutableDictionary *)objc_msgSend(v32, "initWithDictionary:", v35);
    preInitData = v2->_preInitData;
    v2->_preInitData = v36;

    v38 = qword_1000351B8;
    if (os_log_type_enabled((os_log_t)qword_1000351B8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Done BatteryAlgorithmsInit", buf, 2u);
    }
    v39 = v2;
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10001D31C();
  }

  return v2;
}

- (void)fullInitDataRead
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004230;
  block[3] = &unk_10002C5A8;
  block[4] = self;
  if (qword_1000351C0 != -1)
    dispatch_once(&qword_1000351C0, block);
}

- (NSMutableDictionary)smcKeys
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (NSMutableDictionary)deviceState
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (NSMutableDictionary)sbcData
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (NSMutableDictionary)obcData
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (NSMutableDictionary)dailyData
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (NSDictionary)battData
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (NSMutableDictionary)preInitData
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (NSDictionary)fullInitData
{
  return (NSDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (BOOL)fullDataInitNeeded
{
  return self->_fullDataInitNeeded;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fullInitData, 0);
  objc_storeStrong((id *)&self->_preInitData, 0);
  objc_storeStrong((id *)&self->_battData, 0);
  objc_storeStrong((id *)&self->_dailyData, 0);
  objc_storeStrong((id *)&self->_obcData, 0);
  objc_storeStrong((id *)&self->_sbcData, 0);
  objc_storeStrong((id *)&self->_deviceState, 0);
  objc_storeStrong((id *)&self->_smcKeys, 0);
}

@end
