@implementation FitnessDeviceManager

+ (id)instance
{
  if (qword_1000C9108 != -1)
    dispatch_once(&qword_1000C9108, &stru_1000AE060);
  return (id)qword_1000C9100;
}

+ (BOOL)shouldRestartCollecting
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  __CFString *v7;
  id v8;
  BOOL v9;
  uint64_t v10;
  _BOOL4 v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  NSObject *v15;
  int v17;
  const __CFString *v18;
  __int16 v19;
  void *v20;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("Fitness")));

  if (v3)
  {
    v5 = objc_opt_class(NSDictionary, v4);
    if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0)
    {
      v6 = v3;
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("Collecting")));
      v8 = -[__CFString count](v7, "count");
      v9 = v8 != 0;
      v10 = qword_1000C9178;
      v11 = os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT);
      if (v8)
      {
        if (v11)
        {
          v17 = 138412290;
          v18 = v7;
          v12 = "shouldRestartCollecting:YES %@";
          v13 = v10;
          v14 = 12;
LABEL_10:
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v17, v14);
        }
      }
      else if (v11)
      {
        LOWORD(v17) = 0;
        v12 = "shouldRestartCollecting:NO";
        v13 = v10;
        v14 = 2;
        goto LABEL_10;
      }

      goto LABEL_12;
    }
  }
  v15 = qword_1000C9178;
  v9 = 0;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 138412546;
    v18 = CFSTR("Fitness");
    v19 = 2112;
    v20 = v3;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "shouldRestartCollecting:NO - setting for key:%@ = %@", (uint8_t *)&v17, 0x16u);
    v9 = 0;
  }
LABEL_12:

  return v9;
}

- (void)storeCollectionState
{
  void *v3;
  void *v4;
  _UNKNOWN **v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  NSMutableDictionary *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[3];
  _QWORD v16[3];
  _QWORD v17[3];
  _QWORD v18[3];
  uint8_t buf[4];
  const __CFString *v20;
  __int16 v21;
  void *v22;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  v4 = (void *)qword_1000C9178;
  v5 = &AFSiriActivationBluetoothDeviceButtonPress_ptr;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    v18[0] = v3;
    v17[0] = CFSTR("Timestamp");
    v17[1] = CFSTR("Collecting");
    v6 = v4;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FitnessDeviceManager getRequestedTags](self, "getRequestedTags"));
    v18[1] = v7;
    v17[2] = CFSTR("WorkoutInSession");
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[FitnessDeviceManager workoutInSession](self, "workoutInSession")));
    v18[2] = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v18, v17, 3));
    *(_DWORD *)buf = 138412546;
    v20 = CFSTR("Fitness");
    v21 = 2112;
    v22 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Storing setting for key:%@ = %@", buf, 0x16u);

    v5 = &AFSiriActivationBluetoothDeviceButtonPress_ptr;
  }
  v10 = objc_opt_new(NSMutableDictionary);
  v16[0] = v3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FitnessDeviceManager getRequestedTags](self, "getRequestedTags", CFSTR("Timestamp"), CFSTR("Collecting")));
  v16[1] = v11;
  v15[2] = CFSTR("WorkoutInSession");
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5[262], "numberWithBool:", -[FitnessDeviceManager workoutInSession](self, "workoutInSession")));
  v16[2] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v16, v15, 3));
  -[NSMutableDictionary addEntriesFromDictionary:](v10, "addEntriesFromDictionary:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v14, "setObject:forKey:", v10, CFSTR("Fitness"));

}

- (void)loadCollectionState
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  __CFString *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  int v13;
  const __CFString *v14;
  __int16 v15;
  void *v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("Fitness")));

  if (v4 && (v6 = objc_opt_class(NSDictionary, v5), (objc_opt_isKindOfClass(v4, v6) & 1) != 0))
  {
    v7 = v4;
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("Timestamp")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("Collecting")));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("WorkoutInSession")));

    if (v9)
    {
      v11 = qword_1000C9178;
      if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 138412546;
        v14 = v8;
        v15 = 2112;
        v16 = v9;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Restoring collecting state started at %@: %@", (uint8_t *)&v13, 0x16u);
      }
      -[FitnessDeviceManager collectDataForQuantityTypeIdentifiers:isWorkout:](self, "collectDataForQuantityTypeIdentifiers:isWorkout:", v9, v10 != 0);
    }

  }
  else
  {
    v12 = qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138412546;
      v14 = CFSTR("Fitness");
      v15 = 2112;
      v16 = v4;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "loading collection state, not actionable - setting for key:%@ = %@", (uint8_t *)&v13, 0x16u);
    }
  }

}

- (FitnessDeviceManager)init
{
  FitnessDeviceManager *v2;
  NSArray *registeredServices;
  NSArray *requestedQuantityTypes;
  NSArray *knownQuantityTypes;
  id v6;
  void *v7;
  CBCentralManager *v8;
  CBCentralManager *centralManager;
  NSMutableDictionary *v10;
  uint64_t v11;
  NSMutableDictionary *v12;
  NSMutableArray *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  NSObject *v22;
  id v23;
  __CFNotificationCenter *DarwinNotifyCenter;
  FitnessDeviceManager *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  objc_super v31;
  uint8_t buf[4];
  uint64_t v33;
  _QWORD v34[5];
  _BYTE v35[128];
  _QWORD v36[2];
  _QWORD v37[2];

  v31.receiver = self;
  v31.super_class = (Class)FitnessDeviceManager;
  v2 = -[FitnessDeviceManager init](&v31, "init");
  registeredServices = v2->_registeredServices;
  v2->_registeredServices = (NSArray *)&__NSArray0__struct;

  requestedQuantityTypes = v2->_requestedQuantityTypes;
  v2->_requestedQuantityTypes = (NSArray *)&__NSArray0__struct;

  knownQuantityTypes = v2->_knownQuantityTypes;
  v2->_knownQuantityTypes = (NSArray *)&__NSArray0__struct;

  v6 = objc_alloc((Class)CBCentralManager);
  v36[0] = CBCentralManagerOptionReceiveSystemEvents;
  v36[1] = CBManagerNeedsRestrictedStateOperation;
  v37[0] = &__kCFBooleanTrue;
  v37[1] = &__kCFBooleanTrue;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v37, v36, 2));
  v8 = (CBCentralManager *)objc_msgSend(v6, "initWithDelegate:queue:options:", v2, &_dispatch_main_q, v7);
  centralManager = v2->_centralManager;
  v2->_centralManager = v8;

  -[FitnessDeviceManager setupAudioRoutingControl](v2, "setupAudioRoutingControl");
  v10 = objc_opt_new(NSMutableDictionary);
  -[FitnessDeviceManager setServiceUUIDForSupportedHKQuantityType:](v2, "setServiceUUIDForSupportedHKQuantityType:", v10);

  -[FitnessDeviceManager setServiceUUID:forQuantityType:](v2, "setServiceUUID:forQuantityType:", CBUUIDHeartRateServiceString, HKQuantityTypeIdentifierHeartRate);
  v11 = CBUUIDCyclingSpeedAndCadenceServiceString;
  -[FitnessDeviceManager setServiceUUID:forQuantityType:](v2, "setServiceUUID:forQuantityType:", CBUUIDCyclingSpeedAndCadenceServiceString, HKQuantityTypeIdentifierCyclingCadence);
  -[FitnessDeviceManager setServiceUUID:forQuantityType:](v2, "setServiceUUID:forQuantityType:", v11, HKQuantityTypeIdentifierCyclingSpeed);
  -[FitnessDeviceManager setServiceUUID:forQuantityType:](v2, "setServiceUUID:forQuantityType:", v11, HKQuantityTypeIdentifierDistanceCycling);
  -[FitnessDeviceManager setServiceUUID:forQuantityType:](v2, "setServiceUUID:forQuantityType:", CBUUIDCyclingPowerServiceString, HKQuantityTypeIdentifierCyclingPower);
  v12 = objc_opt_new(NSMutableDictionary);
  -[FitnessDeviceManager setUnitForSupportedHKQuantityType:](v2, "setUnitForSupportedHKQuantityType:", v12);

  -[FitnessDeviceManager setUnit:forQuantityType:](v2, "setUnit:forQuantityType:", CFSTR("count/min"), HKQuantityTypeIdentifierHeartRate);
  -[FitnessDeviceManager setUnit:forQuantityType:](v2, "setUnit:forQuantityType:", CFSTR("count/min"), HKQuantityTypeIdentifierCyclingCadence);
  -[FitnessDeviceManager setUnit:forQuantityType:](v2, "setUnit:forQuantityType:", CFSTR("mi/hr"), HKQuantityTypeIdentifierCyclingSpeed);
  -[FitnessDeviceManager setUnit:forQuantityType:](v2, "setUnit:forQuantityType:", CFSTR("W"), HKQuantityTypeIdentifierCyclingPower);
  v26 = v2;
  -[FitnessDeviceManager setUnit:forQuantityType:](v2, "setUnit:forQuantityType:", CFSTR("m"), HKQuantityTypeIdentifierDistanceCycling);
  v13 = objc_opt_new(NSMutableArray);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v34[0] = HKQuantityTypeIdentifierCyclingCadence;
  v34[1] = HKQuantityTypeIdentifierCyclingSpeed;
  v34[2] = HKQuantityTypeIdentifierCyclingPower;
  v34[3] = HKQuantityTypeIdentifierDistanceCycling;
  v34[4] = HKQuantityTypeIdentifierHeartRate;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v34, 5));
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v28;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v28 != v17)
          objc_enumerationMutation(v14);
        v19 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)v18);
        v20 = objc_autoreleasePoolPush();
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[FitnessService hkQuantityTypeForIdentifier:](FitnessService, "hkQuantityTypeForIdentifier:", v19));
        if (v21)
        {
          -[NSMutableArray addObject:](v13, "addObject:", v21);
        }
        else
        {
          v22 = qword_1000C9178;
          if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v33 = v19;
            _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "FitnessDeviceManager init - Could not get HKQuantityType for %@", buf, 0xCu);
          }
        }

        objc_autoreleasePoolPop(v20);
        v18 = (char *)v18 + 1;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    }
    while (v16);
  }

  v23 = -[NSMutableArray copy](v13, "copy");
  -[FitnessDeviceManager setKnownQuantityTypes:](v26, "setKnownQuantityTypes:", v23);

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, v26, (CFNotificationCallback)sub_10004D1B0, CFSTR("com.apple.bluetooth.settings.fitness-device-pairing-state-changed"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  CFNotificationCenterAddObserver(DarwinNotifyCenter, v26, (CFNotificationCallback)sub_10004D1B8, CFSTR("HKHealthPeripheralStatusDidChangeNotification"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);

  return v26;
}

- (void)registerWithHealthKit:(BOOL)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  objc_class *v10;
  id v11;
  void *v12;
  HKActiveDataCollectionObserver *v13;
  HKActiveDataCollectionObserver *dataCollectionObserver;
  HKActiveDataCollectionObserver *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  HKQuantityTypeIdentifier v24;
  __int128 buf;
  Class (*v26)(uint64_t);
  void *v27;
  uint64_t *v28;

  if (!_os_feature_enabled_impl("Health", "pulse") || a3)
  {
    if (self->_dataCollectionObserver)
    {
      if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
        sub_1000704B0();
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[FitnessDeviceManager requestedQuantityTypes](self, "requestedQuantityTypes"));
      v8 = objc_msgSend(v7, "count") == 0;

      if (!v8)
        -[FitnessDeviceManager connectTaggedDevices](self, "connectTaggedDevices");
    }
    else
    {
      v20 = 0;
      v21 = &v20;
      v22 = 0x2050000000;
      v9 = (void *)qword_1000C9110;
      v23 = qword_1000C9110;
      if (!qword_1000C9110)
      {
        *(_QWORD *)&buf = _NSConcreteStackBlock;
        *((_QWORD *)&buf + 1) = 3221225472;
        v26 = sub_1000523F0;
        v27 = &unk_1000AD1C8;
        v28 = &v20;
        sub_1000523F0((uint64_t)&buf);
        v9 = (void *)v21[3];
      }
      v10 = objc_retainAutorelease(v9);
      _Block_object_dispose(&v20, 8);
      if (v10)
      {
        -[FitnessDeviceManager markFitnessTaskEnabled:](self, "markFitnessTaskEnabled:", 1);
        v11 = [v10 alloc];
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[FitnessDeviceManager hkHealthStore](self, "hkHealthStore"));
        v13 = (HKActiveDataCollectionObserver *)objc_msgSend(v11, "initWithHealthStore:", v12);
        dataCollectionObserver = self->_dataCollectionObserver;
        self->_dataCollectionObserver = v13;

        -[HKActiveDataCollectionObserver setDelegate:](self->_dataCollectionObserver, "setDelegate:", self);
        v15 = self->_dataCollectionObserver;
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[FitnessDeviceManager knownQuantityTypes](self, "knownQuantityTypes"));
        -[HKActiveDataCollectionObserver subscribeForQuantityTypes:](v15, "subscribeForQuantityTypes:", v16);

        v17 = (void *)qword_1000C9178;
        if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
        {
          v18 = v17;
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[FitnessDeviceManager knownQuantityTypes](self, "knownQuantityTypes"));
          LODWORD(buf) = 138412290;
          *(_QWORD *)((char *)&buf + 4) = v19;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "registerWithHealthKit - Registered Fitness callback with HealthKit for %@", (uint8_t *)&buf, 0xCu);

        }
      }
      else if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      {
        sub_100070484();
      }
    }
  }
  else
  {
    v5 = qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Starting HRM collection", (uint8_t *)&buf, 2u);
    }
    v24 = HKQuantityTypeIdentifierHeartRate;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v24, 1));
    -[FitnessDeviceManager collectDataForQuantityTypeIdentifiers:isWorkout:](self, "collectDataForQuantityTypeIdentifiers:isWorkout:", v6, 0);

  }
}

- (HKHealthStore)hkHealthStore
{
  void *v4;
  objc_class *v5;
  HKHealthStore *v6;
  HKHealthStore *fHKHealthStore;
  NSObject *v8;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  if (!self->fHKHealthStore)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x2050000000;
    v4 = (void *)qword_1000C9120;
    v13 = qword_1000C9120;
    if (!qword_1000C9120)
    {
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_1000524A4;
      v9[3] = &unk_1000AD1C8;
      v9[4] = &v10;
      sub_1000524A4((uint64_t)v9);
      v4 = (void *)v11[3];
    }
    v5 = objc_retainAutorelease(v4);
    _Block_object_dispose(&v10, 8);
    if (v5)
    {
      v6 = (HKHealthStore *)objc_alloc_init(v5);
      fHKHealthStore = self->fHKHealthStore;
      self->fHKHealthStore = v6;

      v8 = qword_1000C9178;
      if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v9[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Created HKHealthStore", (uint8_t *)v9, 2u);
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
    {
      sub_1000704E8();
    }
  }
  return self->fHKHealthStore;
}

- (id)hkUnitForHKQuantityType:(id)a3
{
  return -[NSMutableDictionary objectForKey:](self->_unitForSupportedHKQuantityType, "objectForKey:", a3);
}

- (id)createHKDataCollectorForHKQuantityType:(id)a3
{
  id v4;
  void *v5;
  objc_class *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2050000000;
  v5 = (void *)qword_1000C9128;
  v17 = qword_1000C9128;
  if (!qword_1000C9128)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100052558;
    v13[3] = &unk_1000AD1C8;
    v13[4] = &v14;
    sub_100052558((uint64_t)v13);
    v5 = (void *)v15[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v14, 8);
  if (v6)
  {
    v7 = [v6 alloc];
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[FitnessDeviceManager hkHealthStore](self, "hkHealthStore"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bundleIdentifier"));
    v11 = objc_msgSend(v7, "initWithHealthStore:bundleIdentifier:quantityType:", v8, v10, v4);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)isHKQuantityRequested:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FitnessDeviceManager requestedQuantityTypes](self, "requestedQuantityTypes"));
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (void)collectDataForQuantityTypeIdentifiers:(id)a3 isWorkout:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSMutableArray *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v4 = a4;
  v6 = a3;
  v7 = objc_opt_new(NSMutableArray);
  if (!v4)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[FitnessDeviceManager requestedQuantityTypes](self, "requestedQuantityTypes"));
    -[NSMutableArray addObjectsFromArray:](v7, "addObjectsFromArray:", v8);

  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v13);
        v15 = objc_autoreleasePoolPush();
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[FitnessService hkQuantityTypeForIdentifier:](FitnessService, "hkQuantityTypeForIdentifier:", v14, (_QWORD)v17));
        if (v16 && !-[FitnessDeviceManager isHKQuantityRequested:](self, "isHKQuantityRequested:", v16))
          -[NSMutableArray addObject:](v7, "addObject:", v16);

        objc_autoreleasePoolPop(v15);
        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

  -[FitnessDeviceManager collectDataForQuantityTypes:isWorkout:](self, "collectDataForQuantityTypes:isWorkout:", v7, v4);
}

- (void)collectDataForQuantityTypes:(id)a3 isWorkout:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  FitnessDeviceManager *v15;
  uint64_t v16;
  NSObject *v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *i;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t v32[128];
  uint8_t buf[4];
  id v34;
  __int16 v35;
  id v36;

  v4 = a4;
  v6 = a3;
  v7 = objc_msgSend(v6, "count");
  if (!v4)
  {
    if (v7)
    {
      v13 = qword_1000C9178;
      if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v34 = v6;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "STARTING NON-WORKOUT COLLECTION FOR: %@", buf, 0xCu);
      }
      goto LABEL_20;
    }
    if (!-[FitnessDeviceManager workoutInSession](self, "workoutInSession"))
    {
LABEL_22:
      v18 = objc_msgSend(v6, "copy");
      -[FitnessDeviceManager setRequestedQuantityTypes:](self, "setRequestedQuantityTypes:", v18);

      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[FitnessDeviceManager registeredServices](self, "registeredServices", 0));
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v29;
        do
        {
          for (i = 0; i != v21; i = (char *)i + 1)
          {
            if (*(_QWORD *)v29 != v22)
              objc_enumerationMutation(v19);
            v24 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
            if (objc_msgSend(v24, "isFitnessClassicDevice"))
            {
              if (!-[FitnessDeviceManager workoutInSession](self, "workoutInSession"))
              {
                v25 = (void *)objc_claimAutoreleasedReturnValue(-[FitnessDeviceManager requestedQuantityTypes](self, "requestedQuantityTypes"));
                v26 = objc_msgSend(v25, "count");

                if (v26)
                  continue;
              }
            }
            v27 = (void *)objc_claimAutoreleasedReturnValue(-[FitnessDeviceManager requestedQuantityTypes](self, "requestedQuantityTypes"));
            objc_msgSend(v24, "updateRequestedQuantityTypes:", v27);

          }
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        }
        while (v21);
      }

      -[FitnessDeviceManager updateScan](self, "updateScan");
      -[FitnessDeviceManager disconnectDevicesWithoutRunningService](self, "disconnectDevicesWithoutRunningService");
      -[FitnessDeviceManager cancelStaleConnectionRequests](self, "cancelStaleConnectionRequests");
      -[FitnessDeviceManager storeCollectionState](self, "storeCollectionState");
      goto LABEL_34;
    }
    goto LABEL_13;
  }
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[FitnessDeviceManager requestedQuantityTypes](self, "requestedQuantityTypes"));
    v9 = objc_msgSend(v8, "count");

    if (v9)
    {
      -[FitnessDeviceManager setWorkoutInSession:](self, "setWorkoutInSession:", 1);
      v10 = (void *)qword_1000C9178;
      if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
      {
        v11 = v10;
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[FitnessDeviceManager requestedQuantityTypes](self, "requestedQuantityTypes"));
        *(_DWORD *)buf = 138412546;
        v34 = v12;
        v35 = 2112;
        v36 = v6;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "CHANGING WORKOUT FROM:%@ TO %@", buf, 0x16u);

      }
      goto LABEL_22;
    }
    if (objc_msgSend(v6, "count"))
      goto LABEL_17;
    if (!-[FitnessDeviceManager workoutInSession](self, "workoutInSession"))
      goto LABEL_36;
LABEL_13:
    -[FitnessDeviceManager setWorkoutInSession:](self, "setWorkoutInSession:", 0);
    -[FitnessDeviceManager setHeartRateScanDidTimeOut:](self, "setHeartRateScanDidTimeOut:", 0);
    v14 = qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "ENDING WORKOUT", buf, 2u);
    }
    v15 = self;
    v16 = 0;
    goto LABEL_21;
  }
  if (objc_msgSend(v6, "count"))
  {
LABEL_17:
    v17 = qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v34 = v6;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "STARTING WORKOUT FOR:%@", buf, 0xCu);
    }
    -[FitnessDeviceManager setWorkoutInSession:](self, "setWorkoutInSession:", 1);
LABEL_20:
    v15 = self;
    v16 = 1;
LABEL_21:
    -[FitnessDeviceManager markFitnessTaskEnabled:](v15, "markFitnessTaskEnabled:", v16);
    goto LABEL_22;
  }
  if (-[FitnessDeviceManager workoutInSession](self, "workoutInSession"))
    goto LABEL_13;
LABEL_36:
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
    sub_100070514();
LABEL_34:

}

- (id)findMatchingDistributedFitnessService:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v4 = a3;
  if (objc_msgSend(v4, "isDistributed"))
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[FitnessDeviceManager registeredServices](self, "registeredServices", 0));
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v12;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
          if ((objc_msgSend(v9, "matchesDistributedService:", v4) & 1) != 0)
          {
            v6 = v9;
            goto LABEL_13;
          }
        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_13:

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)registerFitnessService:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;

  v4 = a3;
  v5 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "service"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "UUID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "peripheral"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "name"));
    v17 = 138412546;
    v18 = v8;
    v19 = 2112;
    v20 = v10;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Registering service %@ for:“%@”", (uint8_t *)&v17, 0x16u);

  }
  if (objc_msgSend(v4, "isFitnessClassicDevice")
    && !-[FitnessDeviceManager workoutInSession](self, "workoutInSession")
    && (v11 = (void *)objc_claimAutoreleasedReturnValue(-[FitnessDeviceManager requestedQuantityTypes](self, "requestedQuantityTypes")),
        v12 = objc_msgSend(v11, "count"),
        v11,
        v12))
  {
    objc_msgSend(v4, "updateRequestedQuantityTypes:", &__NSArray0__struct);
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[FitnessDeviceManager requestedQuantityTypes](self, "requestedQuantityTypes"));
    objc_msgSend(v4, "updateRequestedQuantityTypes:", v13);

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[FitnessDeviceManager registeredServices](self, "registeredServices"));
  v15 = objc_msgSend(v14, "mutableCopy");

  objc_msgSend(v15, "addObject:", v4);
  v16 = objc_msgSend(v15, "copy");
  -[FitnessDeviceManager setRegisteredServices:](self, "setRegisteredServices:", v16);

}

- (void)centralManagerDidUpdateState:(id)a3
{
  void *v4;
  id v5;
  NSObject *v6;
  uint8_t v7[16];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FitnessDeviceManager centralManager](self, "centralManager", a3));
  v5 = objc_msgSend(v4, "state");

  if (v5 == (id)5)
  {
    v6 = qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "FitnessDeviceManager's CentralManager state is now POWERED ON", v7, 2u);
    }
    -[FitnessDeviceManager updateScan](self, "updateScan");
    -[FitnessDeviceManager migrateHKPairedHealthDevices](self, "migrateHKPairedHealthDevices");
  }
}

- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6
{
  id v7;
  unsigned int v8;
  void *v9;
  _BOOL4 v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;

  v7 = a4;
  v8 = -[FitnessDeviceManager shouldConnectDevice:](self, "shouldConnectDevice:", v7);
  v9 = (void *)qword_1000C9178;
  v10 = os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      v11 = v9;
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[FitnessDeviceManager connectStateStr:](FitnessDeviceManager, "connectStateStr:", objc_msgSend(v7, "state")));
      v19 = 138412802;
      v20 = v12;
      v21 = 2112;
      v22 = v13;
      v23 = 2112;
      v24 = v14;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "didDiscoverPeripheral %@ “%@” (%@), connecting", (uint8_t *)&v19, 0x20u);

    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
    -[FitnessDeviceManager connectPeripheral:](self, "connectPeripheral:", v15);

  }
  else if (v10)
  {
    v16 = v9;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name"));
    v19 = 138412546;
    v20 = v17;
    v21 = 2112;
    v22 = v18;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "didDiscoverPeripheral %@ “%@” -> UNTAGGED, NOT CONNECTING", (uint8_t *)&v19, 0x16u);

  }
}

- (void)centralManager:(id)a3 didUpdatePeripheralConnectionState:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  id v14;
  NSObject *v15;
  int v16;
  id v17;

  v5 = a4;
  if (objc_msgSend(v5, "state")
    || !-[FitnessDeviceManager shouldCollectFromDevice:](self, "shouldCollectFromDevice:", v5))
  {
    goto LABEL_18;
  }
  v6 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "name"));
    v16 = 138412290;
    v17 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "“%@” disconnected", (uint8_t *)&v16, 0xCu);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FitnessDeviceManager requestedQuantityTypes](self, "requestedQuantityTypes"));
  if (!objc_msgSend(v9, "count"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[FitnessDeviceManager getConnectedPeripheralUUIDsCollecting:andIdle:](self, "getConnectedPeripheralUUIDsCollecting:andIdle:", 1, 0));
    if (objc_msgSend(v11, "count"))
    {
      v12 = -[FitnessDeviceManager workoutInSession](self, "workoutInSession");

      if ((v12 & 1) != 0)
        goto LABEL_10;
    }
    else
    {

    }
LABEL_13:
    if (!-[FitnessDeviceManager workoutInSession](self, "workoutInSession"))
    {
      -[FitnessDeviceManager setRequestedQuantityTypes:](self, "setRequestedQuantityTypes:", &__NSArray0__struct);
      -[FitnessDeviceManager storeCollectionState](self, "storeCollectionState");
    }
    v15 = qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138412290;
      v17 = v5;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Removing fitness services for peripheral %@", (uint8_t *)&v16, 0xCu);
    }
    -[FitnessDeviceManager removeFitnessServicesForPeripheral:](self, "removeFitnessServicesForPeripheral:", v5);
    -[FitnessDeviceManager markFitnessTaskEnabled:](self, "markFitnessTaskEnabled:", 0);
    goto LABEL_18;
  }
  v10 = -[FitnessDeviceManager workoutInSession](self, "workoutInSession");

  if ((v10 & 1) == 0)
    goto LABEL_13;
LABEL_10:
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[FitnessDeviceManager requestedQuantityTypes](self, "requestedQuantityTypes"));
  v14 = objc_msgSend(v13, "count");

  if (v14)
    -[FitnessDeviceManager updateScan](self, "updateScan");
LABEL_18:

}

- (void)activeDataCollectionObserver:(id)a3 updatedCollectedTypes:(id)a4
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;

  v5 = a4;
  v6 = qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "FitnessDeviceManager callback from HK - collect %@", (uint8_t *)&v7, 0xCu);
  }
  -[FitnessDeviceManager collectDataForQuantityTypes:isWorkout:](self, "collectDataForQuantityTypes:isWorkout:", v5, 1);

}

+ (id)connectStateStr:(int64_t)a3
{
  if ((unint64_t)a3 > 3)
    return CFSTR("Unknown");
  else
    return *(&off_1000AE1B8 + a3);
}

- (void)removeFitnessServicesForPeripheral:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  id v17;
  NSMutableArray *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *j;
  id v23;
  FitnessDeviceManager *v24;
  NSMutableArray *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];

  v4 = a3;
  v5 = v4;
  if (v4 && !objc_msgSend(v4, "state"))
  {
    v24 = self;
    v25 = objc_opt_new(NSMutableArray);
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[FitnessDeviceManager registeredServices](self, "registeredServices"));
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v31 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i);
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "peripheral"));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
          v15 = objc_msgSend(v13, "isEqual:", v14);

          if (v15)
            -[NSMutableArray addObject:](v25, "addObject:", v11);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      }
      while (v8);
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[FitnessDeviceManager registeredServices](v24, "registeredServices"));
    v17 = objc_msgSend(v16, "mutableCopy");

    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v18 = v25;
    v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v27;
      do
      {
        for (j = 0; j != v20; j = (char *)j + 1)
        {
          if (*(_QWORD *)v27 != v21)
            objc_enumerationMutation(v18);
          objc_msgSend(v17, "removeObject:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)j));
        }
        v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
      }
      while (v20);
    }

    v23 = objc_msgSend(v17, "copy");
    -[FitnessDeviceManager setRegisteredServices:](v24, "setRegisteredServices:", v23);

  }
}

- (void)markFitnessTaskEnabled:(BOOL)a3
{
  void *v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  uint8_t v9[16];
  uint8_t buf[16];
  uint8_t v11[16];

  if (a3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[FitnessDeviceManager persistanceAssertion](self, "persistanceAssertion"));

    v5 = qword_1000C9178;
    v6 = os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (v6)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Fitness task already marked started", buf, 2u);
      }
    }
    else
    {
      if (v6)
      {
        *(_WORD *)v11 = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Mark fitness task started", v11, 2u);
      }
      v8 = (void *)os_transaction_create("com.apple.FitnessDeviceManager");
      -[FitnessDeviceManager setPersistanceAssertion:](self, "setPersistanceAssertion:", v8);

    }
  }
  else
  {
    v7 = qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Mark fitness task completed", v9, 2u);
    }
    -[FitnessDeviceManager setPersistanceAssertion:](self, "setPersistanceAssertion:", 0);
  }
}

- (id)getRequestedTags
{
  NSMutableArray *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = objc_opt_new(NSMutableArray);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FitnessDeviceManager requestedQuantityTypes](self, "requestedQuantityTypes", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v8), "identifier"));
        -[NSMutableArray addObject:](v3, "addObject:", v9);

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  v10 = -[NSMutableArray copy](v3, "copy");
  return v10;
}

- (void)connectTaggedDevices
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FitnessDeviceManager centralManager](self, "centralManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FitnessDeviceManager getRequestedTags](self, "getRequestedTags"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10004EB04;
  v5[3] = &unk_1000AE088;
  v5[4] = self;
  objc_msgSend(v3, "retrievePeripheralsWithTags:completion:", v4, v5);

}

- (void)updateScan
{
  FitnessDeviceManager *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  os_log_t *v9;
  void *v10;
  NSObject *v11;
  unsigned int v12;
  void *v13;
  id v14;
  id v15;
  __int128 v16;
  id v17;
  uint64_t v18;
  const __CFString *v19;
  void **p_cache;
  void *i;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  os_log_t v26;
  NSObject *v27;
  const __CFString *v28;
  id v29;
  void **v30;
  os_log_t *v31;
  void *v32;
  __int128 v33;
  FitnessDeviceManager *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _QWORD v39[5];
  uint8_t v40[128];
  uint8_t buf[4];
  _BYTE v42[14];

  v2 = self;
  if (-[CBCentralManager state](self->_centralManager, "state") == (id)5)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[FitnessDeviceManager centralManager](v2, "centralManager"));
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_10004F1B4;
    v39[3] = &unk_1000AE088;
    v39[4] = v2;
    objc_msgSend(v3, "retrievePeripheralsWithCustomProperties:completion:", &off_1000B3BD8, v39);

    if (!-[FitnessDeviceManager workoutInSession](v2, "workoutInSession"))
    {
      -[FitnessDeviceManager setHeartRateScanDidTimeOut:](v2, "setHeartRateScanDidTimeOut:", 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[FitnessDeviceManager requestedQuantityTypes](v2, "requestedQuantityTypes"));
      v5 = objc_msgSend(v4, "count");

      if (v5)
      {
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[FitnessDeviceManager centralManager](v2, "centralManager"));
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[FitnessDeviceManager requestedServices](v2, "requestedServices"));
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "retrieveConnectedPeripheralsWithServices:", v7));

        v9 = (os_log_t *)&qword_1000C9178;
        v10 = (void *)qword_1000C9178;
        if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
        {
          v11 = v10;
          v12 = objc_msgSend(v8, "count");
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[FitnessDeviceManager requestedServices](v2, "requestedServices"));
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v42 = v12;
          *(_WORD *)&v42[4] = 2112;
          *(_QWORD *)&v42[6] = v13;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Found %d connected peripherals with services: %@", buf, 0x12u);

        }
        v37 = 0u;
        v38 = 0u;
        v35 = 0u;
        v36 = 0u;
        v14 = v8;
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
        if (v15)
        {
          v17 = v15;
          v18 = *(_QWORD *)v36;
          v19 = CFSTR("Fitness");
          p_cache = &OBJC_METACLASS___HIDAppleSiriRemoteDevice.cache;
          *(_QWORD *)&v16 = 138412290;
          v33 = v16;
          v34 = v2;
          do
          {
            for (i = 0; i != v17; i = (char *)i + 1)
            {
              if (*(_QWORD *)v36 != v18)
                objc_enumerationMutation(v14);
              v22 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)i);
              v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "customProperty:", v19, v33));

              if (v23)
              {
                if (-[FitnessDeviceManager shouldConnectDevice:](v2, "shouldConnectDevice:", v22))
                {
                  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(p_cache + 243, "instance"));
                  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "identifier"));
                  objc_msgSend(v24, "connectOnce:", v25);

                }
                else
                {
                  if (-[FitnessDeviceManager shouldCollectFromDevice:](v2, "shouldCollectFromDevice:", v22))
                    continue;
                  v26 = *v9;
                  if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
                  {
                    v27 = v26;
                    v28 = v19;
                    v29 = v14;
                    v30 = p_cache;
                    v31 = v9;
                    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "name"));
                    *(_DWORD *)buf = v33;
                    *(_QWORD *)v42 = v32;
                    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Disconnecting disabled device: %@", buf, 0xCu);

                    v9 = v31;
                    p_cache = v30;
                    v14 = v29;
                    v19 = v28;
                    v2 = v34;

                  }
                  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "identifier"));
                  -[FitnessDeviceManager disconnectDevice:](v2, "disconnectDevice:", v24);
                }

              }
            }
            v17 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
          }
          while (v17);
        }

      }
    }
  }
}

- (void)updatePairedDevices:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  void *v26;
  _BYTE v27[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FitnessDeviceManager pairedFitnessDeviceUUIDS](self, "pairedFitnessDeviceUUIDS"));
  if (objc_msgSend(v5, "count"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[FitnessDeviceManager pairedFitnessDeviceUUIDS](self, "pairedFitnessDeviceUUIDS"));
    v7 = objc_msgSend(v6, "count");
    v8 = objc_msgSend(v4, "count");

    if (v7 > v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[FitnessDeviceManager pairedFitnessDeviceUUIDS](self, "pairedFitnessDeviceUUIDS"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:", v9));

      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v4));
      objc_msgSend(v10, "minusSet:", v11);

      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      v12 = v10;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v22;
        do
        {
          for (i = 0; i != v14; i = (char *)i + 1)
          {
            if (*(_QWORD *)v22 != v15)
              objc_enumerationMutation(v12);
            v17 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
            v18 = (void *)qword_1000C9178;
            if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
            {
              v19 = v18;
              v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "UUIDString"));
              *(_DWORD *)buf = 138412290;
              v26 = v20;
              _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Disconnecting unpaired device: %@", buf, 0xCu);

            }
            -[FitnessDeviceManager disconnectDevice:](self, "disconnectDevice:", v17);
          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
        }
        while (v14);
      }

    }
  }
  else
  {

  }
  -[FitnessDeviceManager setPairedFitnessDeviceUUIDS:](self, "setPairedFitnessDeviceUUIDS:", v4);

}

- (void)disconnectDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  _BYTE v35[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[ConnectionManager instance](ConnectionManager, "instance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "peripheralForIdentifier:", v4));

  if (v6)
  {
    v26 = v4;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FitnessDeviceManager registeredServices](self, "registeredServices"));
    v8 = objc_msgSend(v7, "copy");

    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v28 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "peripheral"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "identifier"));
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));

          if (v16 == v17)
          {
            v18 = (void *)qword_1000C9178;
            if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
            {
              v19 = v18;
              v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "debugDescription"));
              v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));
              *(_DWORD *)buf = 138412546;
              v32 = v20;
              v33 = 2112;
              v34 = v21;
              _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Unregistering service %@ for peripheral: %@", buf, 0x16u);

            }
            objc_msgSend(v14, "updateRequestedQuantityTypes:", &__NSArray0__struct);
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
      }
      while (v11);
    }

    v4 = v26;
    if ((objc_msgSend(v6, "hasTag:", CFSTR("FitnessClassic")) & 1) == 0)
    {
      v22 = (void *)qword_1000C9178;
      if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
      {
        v23 = v22;
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));
        *(_DWORD *)buf = 138412290;
        v32 = v24;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Disconnecting device: %@", buf, 0xCu);

      }
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[ConnectionManager instance](ConnectionManager, "instance"));
      objc_msgSend(v25, "cancelPeripheralConnectionForConnectOnceIdentifier:", v26);

    }
  }

}

- (void)disconnectDevicesWithoutRunningService
{
  void *v2;
  id v3;
  __int128 v4;
  id v5;
  uint64_t v6;
  void **p_cache;
  const __CFString *v8;
  os_log_t *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  os_log_t v14;
  NSObject *v15;
  uint64_t v16;
  void **v17;
  void *v18;
  const __CFString *v19;
  os_log_t *v20;
  void *v21;
  void *v22;
  __int128 v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  void *v32;
  _BYTE v33[128];

  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FitnessDeviceManager getConnectedPeripheralUUIDsCollecting:andIdle:](self, "getConnectedPeripheralUUIDsCollecting:andIdle:", 0, 1));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)v26;
    p_cache = &OBJC_METACLASS___HIDAppleSiriRemoteDevice.cache;
    v8 = CFSTR("FitnessClassic");
    v9 = (os_log_t *)&qword_1000C9178;
    *(_QWORD *)&v4 = 138412546;
    v23 = v4;
    do
    {
      v10 = 0;
      v24 = v5;
      do
      {
        if (*(_QWORD *)v26 != v6)
          objc_enumerationMutation(v2);
        v11 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(p_cache + 243, "instance", v23));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "peripheralForIdentifier:", v11));

        if (v13 && (objc_msgSend(v13, "hasTag:", v8) & 1) == 0)
        {
          v14 = *v9;
          if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
          {
            v15 = v14;
            v16 = v6;
            v17 = p_cache;
            v18 = v2;
            v19 = v8;
            v20 = v9;
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "name"));
            *(_DWORD *)buf = v23;
            v30 = v11;
            v31 = 2112;
            v32 = v21;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "No running service for %@ (%@), disconnecting", buf, 0x16u);

            v9 = v20;
            v8 = v19;
            v2 = v18;
            p_cache = v17;
            v6 = v16;
            v5 = v24;

          }
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(p_cache + 243, "instance"));
          objc_msgSend(v22, "cancelPeripheralConnectionForConnectOnceIdentifier:", v11);

        }
        v10 = (char *)v10 + 1;
      }
      while (v5 != v10);
      v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v5);
  }

}

- (void)cancelStaleConnectionRequests
{
  NSObject *v3;
  void *v4;
  _QWORD v5[5];
  uint8_t buf[16];

  v3 = qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Cleaning up stale connection requests", buf, 2u);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FitnessDeviceManager centralManager](self, "centralManager"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10004FC44;
  v5[3] = &unk_1000AE088;
  v5[4] = self;
  objc_msgSend(v4, "retrievePeripheralsWithCustomProperties:completion:", &off_1000B3BF0, v5);

}

- (void)connectPeripheral:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  NSObject *v11;
  void *v12;
  __CFString *v13;
  int v14;
  id v15;
  __int16 v16;
  const __CFString *v17;

  v3 = a3;
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[ConnectionManager instance](ConnectionManager, "instance"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "peripheralForIdentifier:", v3));

    if (v5 && objc_msgSend(v5, "state") && objc_msgSend(v5, "state") != (id)3)
    {
      v12 = (void *)qword_1000C9178;
      if (!os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
        goto LABEL_11;
      v11 = v12;
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "name"));
      v14 = 138412546;
      v15 = v3;
      v16 = 2112;
      v17 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "ALREADY MARKED CONNECTED %@ “%@”", (uint8_t *)&v14, 0x16u);

    }
    else
    {
      v6 = (void *)qword_1000C9178;
      if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
      {
        v7 = v6;
        v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "name"));
        v9 = (void *)v8;
        v10 = CFSTR("(loading)");
        if (v8)
          v10 = (const __CFString *)v8;
        v14 = 138412546;
        v15 = v3;
        v16 = 2112;
        v17 = v10;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "CONNECTING %@ “%@”", (uint8_t *)&v14, 0x16u);

      }
      v11 = objc_claimAutoreleasedReturnValue(+[ConnectionManager instance](ConnectionManager, "instance"));
      -[NSObject connectOnce:connectionTimeoutEnabled:](v11, "connectOnce:connectionTimeoutEnabled:", v3, 0);
    }

LABEL_11:
    goto LABEL_14;
  }
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
    sub_1000706C0();
LABEL_14:

}

- (BOOL)isPeripheralConnected:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[ConnectionManager instance](ConnectionManager, "instance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "peripheralForIdentifier:", v3));

  if (v5)
    v6 = objc_msgSend(v5, "state") == (id)2;
  else
    v6 = 0;

  return v6;
}

- (BOOL)shouldConnectDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  BOOL v9;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_9;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));

  if (!v6
    || (objc_msgSend(v5, "hasTag:", CFSTR("FitnessClassic")) & 1) != 0
    || !-[FitnessDeviceManager shouldCollectFromDevice:](self, "shouldCollectFromDevice:", v5))
  {
    goto LABEL_9;
  }
  if (!_os_feature_enabled_impl("Health", "pulse"))
    goto LABEL_12;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[HKQuantityType quantityTypeForIdentifier:](HKQuantityType, "quantityTypeForIdentifier:", HKQuantityTypeIdentifierHeartRate));
  if (!-[FitnessDeviceManager isHKQuantityRequested:](self, "isHKQuantityRequested:", v7)
    || !objc_msgSend(v5, "hasTag:", HKQuantityTypeIdentifierHeartRate))
  {

    goto LABEL_12;
  }
  v8 = -[FitnessDeviceManager heartRateScanDidTimeOut](self, "heartRateScanDidTimeOut");

  if ((v8 & 1) == 0)
  {
LABEL_12:
    v9 = 1;
    goto LABEL_10;
  }
LABEL_9:
  v9 = 0;
LABEL_10:

  return v9;
}

- (BOOL)shouldCollectFromDevice:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *i;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  void *v24;
  _BYTE v25[128];

  v4 = a3;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FitnessDeviceManager requestedQuantityTypes](self, "requestedQuantityTypes", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (!v6)
    goto LABEL_17;
  v7 = *(_QWORD *)v20;
  while (2)
  {
    for (i = 0; i != v6; i = ((char *)i + 1))
    {
      if (*(_QWORD *)v20 != v7)
        objc_enumerationMutation(v5);
      v9 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
      v11 = objc_msgSend(v4, "hasTag:", v10);

      if (v11)
      {
        if (_os_feature_enabled_impl("Health", "pulse"))
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
          if ((objc_msgSend(v12, "isEqualToString:", HKQuantityTypeIdentifierHeartRate) & 1) != 0)
          {
            v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "customProperty:", CFSTR("UpdateHealth")));
            v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("1"));

            if ((v14 & 1) == 0)
            {
              v15 = (void *)qword_1000C9178;
              LOBYTE(v6) = 0;
              if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
              {
                v6 = v15;
                v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
                v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "UUIDString"));
                *(_DWORD *)buf = 138412290;
                v24 = v17;
                _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Skipping connection to peripheral %@. Peripheral disabled in Health Settings", buf, 0xCu);

                LOBYTE(v6) = 0;
              }
              goto LABEL_17;
            }
          }
          else
          {

          }
        }
        LOBYTE(v6) = 1;
        goto LABEL_17;
      }
    }
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    if (v6)
      continue;
    break;
  }
LABEL_17:

  return (char)v6;
}

- (BOOL)shouldForwardFitnessService:(id)a3 quantityType:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  char isKindOfClass;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  void *v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  BOOL v23;
  void *v24;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  const char *v33;
  void *v34;
  id v38;
  id obj;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  void *v49;
  _BYTE v50[128];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FitnessDeviceManager servicesForHKQuantityType:](self, "servicesForHKQuantityType:", v7));
  v9 = objc_msgSend(v8, "mutableCopy");

  objc_msgSend(v9, "removeObject:", v6);
  if (objc_msgSend(v9, "count"))
  {
    v11 = objc_opt_class(CyclingPowerService, v10);
    isKindOfClass = objc_opt_isKindOfClass(v6, v11);
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    obj = v9;
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
    if (v13)
    {
      v14 = v13;
      v38 = v9;
      v15 = *(_QWORD *)v41;
      while (2)
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(_QWORD *)v41 != v15)
            objc_enumerationMutation(obj);
          v17 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)i);
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier", v38));
          v19 = objc_msgSend(HKQuantityTypeIdentifierCyclingPower, "isEqualToString:", v18);

          if (v19)
          {
            if (objc_msgSend(v17, "wasPairedAfter:", v6)
              && objc_msgSend(v17, "latestSampleTimestampWithinSeconds:", 5.0)
              && (objc_msgSend(v6, "matchesDistributedService:", v17) & 1) == 0)
            {
              v24 = (void *)qword_1000C9178;
              if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
                goto LABEL_34;
              goto LABEL_36;
            }
          }
          else
          {
            v21 = objc_opt_class(CyclingPowerService, v20);
            v22 = objc_opt_isKindOfClass(v17, v21);
            if ((isKindOfClass & 1) != 0)
            {
              if ((v22 & 1) != 0)
              {
                if (objc_msgSend(v17, "wasPairedAfter:", v6)
                  && objc_msgSend(v17, "latestSampleTimestampWithinSeconds:", 5.0))
                {
                  v34 = (void *)qword_1000C9178;
                  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
                  {
                    v27 = v34;
                    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
                    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "peripheral"));
                    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "name"));
                    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "peripheral"));
                    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "name"));
                    *(_DWORD *)buf = 138412802;
                    v45 = v28;
                    v46 = 2112;
                    v47 = v30;
                    v48 = 2112;
                    v49 = v32;
                    v33 = "Ignoring %@ from power meter “%@” because power meter “%@” started earlier";
                    goto LABEL_35;
                  }
                  goto LABEL_36;
                }
              }
              else if (objc_msgSend(v17, "latestSampleTimestampWithinSeconds:", 5.0))
              {
                v26 = (void *)qword_1000C9178;
                if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
                {
                  v27 = v26;
                  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
                  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "peripheral"));
                  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "name"));
                  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "peripheral"));
                  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "name"));
                  *(_DWORD *)buf = 138412802;
                  v45 = v28;
                  v46 = 2112;
                  v47 = v30;
                  v48 = 2112;
                  v49 = v32;
                  v33 = "Ignoring %@ from power meter “%@” because “%@” is a dedicated sensor";
                  goto LABEL_35;
                }
                goto LABEL_36;
              }
            }
            else if ((v22 & 1) == 0
                   && objc_msgSend(v17, "wasPairedAfter:", v6)
                   && objc_msgSend(v17, "latestSampleTimestampWithinSeconds:", 5.0))
            {
              v24 = (void *)qword_1000C9178;
              if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
              {
LABEL_34:
                v27 = v24;
                v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
                v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "peripheral"));
                v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "name"));
                v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "peripheral"));
                v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "name"));
                *(_DWORD *)buf = 138412802;
                v45 = v28;
                v46 = 2112;
                v47 = v30;
                v48 = 2112;
                v49 = v32;
                v33 = "Ignoring %@ from “%@” because “%@” started earlier";
LABEL_35:
                _os_log_debug_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, v33, buf, 0x20u);

              }
LABEL_36:
              v23 = 0;
              goto LABEL_37;
            }
          }
        }
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
        if (v14)
          continue;
        break;
      }
      v23 = 1;
LABEL_37:
      v9 = v38;
    }
    else
    {
      v23 = 1;
    }

  }
  else
  {
    v23 = 1;
  }

  return v23;
}

- (id)getConnectedPeripheralUUIDsCollecting:(BOOL)a3 andIdle:(BOOL)a4
{
  _BOOL4 v5;
  NSMutableArray *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  BOOL v12;
  void *i;
  void *v14;
  void *v15;
  id v16;
  _BOOL4 v17;
  char v18;
  void *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  v5 = a3;
  v7 = objc_opt_new(NSMutableArray);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FitnessDeviceManager registeredServices](self, "registeredServices", 0));
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v23;
    v12 = !a4;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "hkQuantityTypesCollecting"));
        v16 = objc_msgSend(v15, "count");

        if (v16)
          v17 = v5;
        else
          v17 = 0;
        if (v16)
          v18 = 1;
        else
          v18 = v12;
        if (v17 || (v18 & 1) == 0)
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "peripheral"));
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "identifier"));

          if (v20 && (-[NSMutableArray containsObject:](v7, "containsObject:", v20) & 1) == 0)
            -[NSMutableArray addObject:](v7, "addObject:", v20);

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v10);
  }

  return v7;
}

- (id)supportedQuantityTypesForServiceUUID:(id)a3
{
  id v4;
  NSMutableArray *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  void *v12;
  unsigned int v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v4 = a3;
  v5 = objc_opt_new(NSMutableArray);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_serviceUUIDForSupportedHKQuantityType, "allKeys", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_serviceUUIDForSupportedHKQuantityType, "objectForKey:", v11));
        v13 = objc_msgSend(v4, "isEqual:", v12);

        if (v13)
          -[NSMutableArray addObject:](v5, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)requestedServices
{
  NSMutableArray *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v3 = objc_opt_new(NSMutableArray);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FitnessDeviceManager requestedQuantityTypes](self, "requestedQuantityTypes", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_serviceUUIDForSupportedHKQuantityType, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v8)));
        if ((-[NSMutableArray containsObject:](v3, "containsObject:", v9) & 1) == 0)
          -[NSMutableArray addObject:](v3, "addObject:", v9);

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)servicesForHKQuantityType:(id)a3
{
  id v4;
  NSMutableArray *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  v5 = objc_opt_new(NSMutableArray);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FitnessDeviceManager registeredServices](self, "registeredServices", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v11, "supportsHKQuantityType:", v4))
          -[NSMutableArray addObject:](v5, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)hkQuantityTypesForService:(id)a3
{
  id v4;
  NSMutableArray *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v4 = a3;
  v5 = objc_opt_new(NSMutableArray);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "service", 0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "UUID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FitnessDeviceManager supportedQuantityTypesForServiceUUID:](self, "supportedQuantityTypesForServiceUUID:", v7));

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "peripheral"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifier"));
        v16 = objc_msgSend(v14, "hasTag:", v15);

        if (v16)
          -[NSMutableArray addObject:](v5, "addObject:", v13);
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

  return v5;
}

- (void)setServiceUUID:(id)a3 forQuantityType:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  BOOL v11;

  v6 = a3;
  v7 = a4;
  if (self->_serviceUUIDForSupportedHKQuantityType)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[FitnessService hkQuantityTypeForIdentifier:](FitnessService, "hkQuantityTypeForIdentifier:", v7));
    v9 = objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", v6));
    v10 = (void *)v9;
    if (v8)
      v11 = v9 == 0;
    else
      v11 = 1;
    if (!v11)
    {
      -[NSMutableDictionary setObject:forKey:](self->_serviceUUIDForSupportedHKQuantityType, "setObject:forKey:", v9, v8);
      if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
        sub_1000706EC();
    }

  }
}

- (void)setUnit:(id)a3 forQuantityType:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE buf[24];
  void *v19;
  _QWORD v20[3];

  v6 = a3;
  v7 = a4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2050000000;
  v8 = (void *)qword_1000C9130;
  v17 = qword_1000C9130;
  if (!qword_1000C9130)
  {
    *(_QWORD *)buf = _NSConcreteStackBlock;
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = sub_10005260C;
    v19 = &unk_1000AD1C8;
    v20[0] = &v14;
    sub_10005260C((uint64_t)buf);
    v8 = (void *)v15[3];
  }
  v9 = objc_retainAutorelease(v8);
  _Block_object_dispose(&v14, 8);
  if (self->_unitForSupportedHKQuantityType && v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[FitnessService hkQuantityTypeForIdentifier:](FitnessService, "hkQuantityTypeForIdentifier:", v7, v14));
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "unitFromString:", v6));
    v12 = (void *)v11;
    if (v10 && v11)
    {
      -[NSMutableDictionary setObject:forKey:](self->_unitForSupportedHKQuantityType, "setObject:forKey:", v11, v10);
      if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
        sub_10007074C();
    }
    else
    {
      v13 = qword_1000C9178;
      if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138413058;
        *(_QWORD *)&buf[4] = v6;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v12;
        *(_WORD *)&buf[22] = 2112;
        v19 = v7;
        LOWORD(v20[0]) = 2112;
        *(_QWORD *)((char *)v20 + 2) = v10;
        _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Could not register unit %@(%@) for qty %@(%@)", buf, 0x2Au);
      }
    }

  }
  else if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
  {
    sub_1000707AC();
  }

}

- (void)startHeartRateScanTimer
{
  void *v3;
  void *v4;
  void *v5;
  void **v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  id v10;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FitnessDeviceManager heartRateScanTimer](self, "heartRateScanTimer"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[FitnessDeviceManager heartRateScanTimer](self, "heartRateScanTimer"));
    objc_msgSend(v4, "invalidate");

  }
  -[FitnessDeviceManager setHeartRateScanDidTimeOut:](self, "setHeartRateScanDidTimeOut:", 0);
  location = 0;
  objc_initWeak(&location, self);
  v6 = _NSConcreteStackBlock;
  v7 = 3221225472;
  v8 = sub_1000514D0;
  v9 = &unk_1000AE0B0;
  objc_copyWeak(&v10, &location);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:repeats:block:](NSTimer, "scheduledTimerWithTimeInterval:repeats:block:", 0, &v6, 30.0));
  -[FitnessDeviceManager setHeartRateScanTimer:](self, "setHeartRateScanTimer:", v5, v6, v7, v8, v9);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)stopHeartRateScanTimer
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FitnessDeviceManager heartRateScanTimer](self, "heartRateScanTimer"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[FitnessDeviceManager heartRateScanTimer](self, "heartRateScanTimer"));
    objc_msgSend(v4, "invalidate");

    -[FitnessDeviceManager setHeartRateScanTimer:](self, "setHeartRateScanTimer:", 0);
  }
  -[FitnessDeviceManager setHeartRateScanDidTimeOut:](self, "setHeartRateScanDidTimeOut:", 1);
  -[FitnessDeviceManager cancelStaleConnectionRequests](self, "cancelStaleConnectionRequests");
}

- (void)setupAudioRoutingControl
{
  void *v3;
  void *v4;
  objc_class *v5;
  id v6;
  void *v7;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FitnessDeviceManager audioRoutingControl](self, "audioRoutingControl"));

  if (!v3)
  {
    v9 = 0;
    v10 = &v9;
    v11 = 0x2050000000;
    v4 = (void *)qword_1000C9138;
    v12 = qword_1000C9138;
    if (!qword_1000C9138)
    {
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_1000526C0;
      v8[3] = &unk_1000AD1C8;
      v8[4] = &v9;
      sub_1000526C0((uint64_t)v8);
      v4 = (void *)v10[3];
    }
    v5 = objc_retainAutorelease(v4);
    _Block_object_dispose(&v9, 8);
    if (v5)
    {
      v6 = objc_alloc_init(v5);
      -[FitnessDeviceManager setAudioRoutingControl:](self, "setAudioRoutingControl:", v6);

      v7 = (void *)objc_claimAutoreleasedReturnValue(-[FitnessDeviceManager audioRoutingControl](self, "audioRoutingControl"));
      objc_msgSend(v7, "activateWithCompletion:", &stru_1000AE0D0);

    }
    else if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
    {
      sub_10007081C();
    }
  }
}

- (void)notifyHRMSessionStateChanged
{
  void *v3;
  _BOOL8 v4;
  NSObject *v5;
  void *v6;

  if (-[FitnessDeviceManager workoutInSession](self, "workoutInSession"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[HKQuantityType quantityTypeForIdentifier:](HKQuantityType, "quantityTypeForIdentifier:", HKQuantityTypeIdentifierHeartRate));
    v4 = -[FitnessDeviceManager isHKQuantityRequested:](self, "isHKQuantityRequested:", v3);

  }
  else
  {
    v4 = 0;
  }
  v5 = qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
    sub_1000708C8(v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FitnessDeviceManager audioRoutingControl](self, "audioRoutingControl"));
  objc_msgSend(v6, "hrmSessionStateChanged:completion:", v4, &stru_1000AE0F0);

}

- (BOOL)isHKHeartRateEnabled
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "persistentDomainForName:", kHKPrivacyPreferencesDomain));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", kHKPrivacyPreferencesKeyEnableHeartRate));
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "BOOLValue");
  else
    v6 = 1;

  return v6;
}

- (void)handleDevicePairingChangeCallback
{
  NSObject *v3;
  void *v4;
  id v5;
  uint8_t v6[16];

  v3 = qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "A fitness device's pairing state changed", v6, 2u);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FitnessDeviceManager knownQuantityTypes](self, "knownQuantityTypes"));
  v5 = objc_msgSend(v4, "count");

  if (v5)
    -[FitnessDeviceManager updateScan](self, "updateScan");
}

- (void)handlePeripheralStatusChangeCallback
{
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[8];
  _BYTE v18[128];

  v3 = qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "A fitness device's UpdateHealth state changed", buf, 2u);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[HKQuantityType quantityTypeForIdentifier:](HKQuantityType, "quantityTypeForIdentifier:", HKQuantityTypeIdentifierHeartRate));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FitnessDeviceManager servicesForHKQuantityType:](self, "servicesForHKQuantityType:", v4));

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v10), "refreshUpdateHealthEnabledStatus", (_QWORD)v13);
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    }
    while (v8);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FitnessDeviceManager knownQuantityTypes](self, "knownQuantityTypes"));
  v12 = objc_msgSend(v11, "count");

  if (v12)
    -[FitnessDeviceManager updateScan](self, "updateScan");

}

- (void)migrateHKPairedHealthDevices
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  id location;

  if (_os_feature_enabled_impl("Health", "pulse"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "persistentDomainForName:", CFSTR("com.apple.BTLEServer")));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("HRM_MIGRATION_COMPLETE")));
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("1")) & 1) == 0)
    {
      if (+[HKHealthStore isHealthDataAvailable](HKHealthStore, "isHealthDataAvailable"))
      {
        location = 0;
        objc_initWeak(&location, self);
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[FitnessDeviceManager hkHealthStore](self, "hkHealthStore"));
        v7[0] = _NSConcreteStackBlock;
        v7[1] = 3221225472;
        v7[2] = sub_100051C2C;
        v7[3] = &unk_1000AE168;
        objc_copyWeak(&v10, &location);
        v8 = v4;
        v9 = v3;
        objc_msgSend(v6, "healthPeripheralsWithFilter:handler:", 1, v7);

        objc_destroyWeak(&v10);
        objc_destroyWeak(&location);
      }
    }

  }
}

- (CBCentralManager)centralManager
{
  return self->_centralManager;
}

- (void)setCentralManager:(id)a3
{
  objc_storeStrong((id *)&self->_centralManager, a3);
}

- (void)setHkHealthStore:(id)a3
{
  objc_storeStrong((id *)&self->_hkHealthStore, a3);
}

- (OS_os_transaction)persistanceAssertion
{
  return self->_persistanceAssertion;
}

- (void)setPersistanceAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_persistanceAssertion, a3);
}

- (HKActiveDataCollectionObserver)dataCollectionObserver
{
  return self->_dataCollectionObserver;
}

- (void)setDataCollectionObserver:(id)a3
{
  objc_storeStrong((id *)&self->_dataCollectionObserver, a3);
}

- (NSArray)registeredServices
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setRegisteredServices:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSArray)requestedQuantityTypes
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setRequestedQuantityTypes:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSArray)knownQuantityTypes
{
  return (NSArray *)objc_getProperty(self, a2, 72, 1);
}

- (void)setKnownQuantityTypes:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSMutableDictionary)serviceUUIDForSupportedHKQuantityType
{
  return self->_serviceUUIDForSupportedHKQuantityType;
}

- (void)setServiceUUIDForSupportedHKQuantityType:(id)a3
{
  objc_storeStrong((id *)&self->_serviceUUIDForSupportedHKQuantityType, a3);
}

- (NSMutableDictionary)unitForSupportedHKQuantityType
{
  return self->_unitForSupportedHKQuantityType;
}

- (void)setUnitForSupportedHKQuantityType:(id)a3
{
  objc_storeStrong((id *)&self->_unitForSupportedHKQuantityType, a3);
}

- (NSArray)pairedFitnessDeviceUUIDS
{
  return (NSArray *)objc_getProperty(self, a2, 96, 1);
}

- (void)setPairedFitnessDeviceUUIDS:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (BOOL)workoutInSession
{
  return self->_workoutInSession;
}

- (void)setWorkoutInSession:(BOOL)a3
{
  self->_workoutInSession = a3;
}

- (NSTimer)heartRateScanTimer
{
  return self->_heartRateScanTimer;
}

- (void)setHeartRateScanTimer:(id)a3
{
  objc_storeStrong((id *)&self->_heartRateScanTimer, a3);
}

- (BOOL)heartRateScanDidTimeOut
{
  return self->_heartRateScanDidTimeOut;
}

- (void)setHeartRateScanDidTimeOut:(BOOL)a3
{
  self->_heartRateScanDidTimeOut = a3;
}

- (AAAudioRoutingControl)audioRoutingControl
{
  return self->_audioRoutingControl;
}

- (void)setAudioRoutingControl:(id)a3
{
  objc_storeStrong((id *)&self->_audioRoutingControl, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioRoutingControl, 0);
  objc_storeStrong((id *)&self->_heartRateScanTimer, 0);
  objc_storeStrong((id *)&self->_pairedFitnessDeviceUUIDS, 0);
  objc_storeStrong((id *)&self->_unitForSupportedHKQuantityType, 0);
  objc_storeStrong((id *)&self->_serviceUUIDForSupportedHKQuantityType, 0);
  objc_storeStrong((id *)&self->_knownQuantityTypes, 0);
  objc_storeStrong((id *)&self->_requestedQuantityTypes, 0);
  objc_storeStrong((id *)&self->_registeredServices, 0);
  objc_storeStrong((id *)&self->_dataCollectionObserver, 0);
  objc_storeStrong((id *)&self->_persistanceAssertion, 0);
  objc_storeStrong((id *)&self->_hkHealthStore, 0);
  objc_storeStrong((id *)&self->_centralManager, 0);
  objc_storeStrong((id *)&self->fHKHealthStore, 0);
}

@end
