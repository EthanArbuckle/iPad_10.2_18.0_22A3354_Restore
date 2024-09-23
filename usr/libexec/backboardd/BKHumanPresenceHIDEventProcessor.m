@implementation BKHumanPresenceHIDEventProcessor

- (BKHumanPresenceHIDEventProcessor)init
{
  BKHumanPresenceHIDEventProcessor *v2;
  uint64_t Serial;
  OS_dispatch_queue *queue;
  NSMutableDictionary *v5;
  NSMutableDictionary *queue_displayUUIDToSensorRecords;
  void *v7;
  BKIOHIDServiceMatcher *v8;
  BKIOHIDServiceMatcher *presenceServiceMatcher;
  BKIOHIDServiceMatcher *v10;
  BKIOHIDServiceMatcher *proximityServiceMatcher;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)BKHumanPresenceHIDEventProcessor;
  v2 = -[BKHumanPresenceHIDEventProcessor init](&v13, "init");
  if (v2)
  {
    Serial = BSDispatchQueueCreateSerial(CFSTR("com.apple.BKHumanPresenceHIDEventProcessor"));
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)Serial;

    v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    queue_displayUUIDToSensorRecords = v2->_queue_displayUUIDToSensorRecords;
    v2->_queue_displayUUIDToSensorRecords = v5;

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[BKHIDSystemInterface sharedInstance](BKHIDSystemInterface, "sharedInstance"));
    v8 = (BKIOHIDServiceMatcher *)objc_msgSend(objc_alloc((Class)BKIOHIDServiceMatcher), "initWithUsagePage:usage:builtIn:dataProvider:", 32, 17, 0, v7);
    presenceServiceMatcher = v2->_presenceServiceMatcher;
    v2->_presenceServiceMatcher = v8;

    -[BKIOHIDServiceMatcher startObserving:queue:](v2->_presenceServiceMatcher, "startObserving:queue:", v2, v2->_queue);
    v10 = (BKIOHIDServiceMatcher *)objc_msgSend(objc_alloc((Class)BKIOHIDServiceMatcher), "initWithUsagePage:usage:builtIn:dataProvider:", 32, 18, 0, v7);
    proximityServiceMatcher = v2->_proximityServiceMatcher;
    v2->_proximityServiceMatcher = v10;

    -[BKIOHIDServiceMatcher startObserving:queue:](v2->_proximityServiceMatcher, "startObserving:queue:", v2, v2->_queue);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[BKIOHIDServiceMatcher invalidate](self->_proximityServiceMatcher, "invalidate");
  -[BKIOHIDServiceMatcher invalidate](self->_presenceServiceMatcher, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)BKHumanPresenceHIDEventProcessor;
  -[BKHumanPresenceHIDEventProcessor dealloc](&v3, "dealloc");
}

- (NSString)description
{
  void *v3;
  id v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BSDescriptionBuilder builderWithObject:](BSDescriptionBuilder, "builderWithObject:", self));
  v4 = objc_msgSend(v3, "appendObject:withName:", self->_queue_displayUUIDToSensorRecords, CFSTR("sensors"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "build"));

  return (NSString *)v5;
}

- (void)matcher:(id)a3 servicesDidMatch:(id)a4
{
  id v5;
  id v6;
  id v7;
  __int128 v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  __CFString *v19;
  void *v20;
  _BKHIDHumanPresenceSensorRecord *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  _BYTE v31[128];

  v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v24;
    *(_QWORD *)&v8 = 138543618;
    v22 = v8;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v24 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)v11);
        v13 = BKLogCommon(v7);
        v14 = objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          v16 = (void *)objc_opt_class(self, v15);
          *(_DWORD *)buf = v22;
          v28 = v16;
          v29 = 2114;
          v30 = v12;
          v17 = v16;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%{public}@: found %{public}@", buf, 0x16u);

        }
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "displayUUID"));
        v19 = sub_10004B74C(v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue(v19);

        v21 = (_BKHIDHumanPresenceSensorRecord *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_queue_displayUUIDToSensorRecords, "objectForKey:", v20));
        if (!v21)
        {
          v21 = objc_alloc_init(_BKHIDHumanPresenceSensorRecord);
          -[NSMutableDictionary setObject:forKey:](self->_queue_displayUUIDToSensorRecords, "setObject:forKey:", v21, v20);
        }
        -[_BKHIDHumanPresenceSensorRecord addService:](v21, "addService:", v12, v22, (_QWORD)v23);

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      v9 = v7;
    }
    while (v7);
  }

}

- (void)serviceDidDisappear:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  void *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  int v16;
  id v17;
  __int16 v18;
  id v19;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v6 = BKLogCommon(v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v16 = 138543618;
    v17 = (id)objc_opt_class(self, v8);
    v18 = 2114;
    v19 = v4;
    v9 = v17;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%{public}@: removing %{public}@", (uint8_t *)&v16, 0x16u);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "displayUUID"));
  v11 = sub_10004B74C(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_queue_displayUUIDToSensorRecords, "objectForKey:", v12));
  objc_msgSend(v13, "removeService:", v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "services"));
  v15 = objc_msgSend(v14, "count");

  if (!v15)
    -[NSMutableDictionary removeObjectForKey:](self->_queue_displayUUIDToSensorRecords, "removeObjectForKey:", v12);

}

- (void)_setProximityInCentimeters:(double)a3 forDisplayUUID:(id)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  double v11;

  v6 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004B968;
  block[3] = &unk_1000EB798;
  block[4] = self;
  v10 = v6;
  v11 = a3;
  v8 = v6;
  dispatch_async(queue, block);

}

- (void)_setPresence:(BOOL)a3 forDisplayUUID:(id)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004B870;
  block[3] = &unk_1000EB2E8;
  block[4] = self;
  v10 = v6;
  v11 = a3;
  v8 = v6;
  dispatch_async(queue, block);

}

- (void)getStatus:(unint64_t *)a3 presence:(BOOL *)a4 proximityInCentimeters:(double *)a5 forDisplayUUID:(id)a6
{
  id v10;
  NSObject *queue;
  id v12;
  _QWORD block[5];
  id v14;
  BOOL *v15;
  double *v16;
  unint64_t *v17;

  v10 = a6;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004B7A0;
  block[3] = &unk_1000EAD08;
  block[4] = self;
  v14 = v10;
  v15 = a4;
  v16 = a5;
  v17 = a3;
  v12 = v10;
  dispatch_sync(queue, block);

}

- (int64_t)processEvent:(__IOHIDEvent *)a3 sender:(id)a4 dispatcher:(id)a5
{
  id v7;
  __IOHIDEvent *v8;
  int IntegerValue;
  double v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  void *v16;
  __CFString *v17;
  void *v18;
  double FloatValue;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  id v24;
  void *v25;
  __CFString *v26;
  _BYTE v28[24];

  v7 = a4;
  v8 = *a3;
  IntegerValue = IOHIDEventGetIntegerValue(v8, 1900544);
  if (!IntegerValue)
  {
    FloatValue = IOHIDEventGetFloatValue(v8, 1900545);
    v21 = BKLogCommon(v20);
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v28 = 138543618;
      *(_QWORD *)&v28[4] = objc_opt_class(self, v23);
      *(_WORD *)&v28[12] = 2048;
      *(double *)&v28[14] = FloatValue;
      v24 = *(id *)&v28[4];
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "%{public}@: human proximity event %g", v28, 0x16u);

    }
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "displayUUID"));
    v26 = sub_10004B74C(v25);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v26);

    -[BKHumanPresenceHIDEventProcessor _setProximityInCentimeters:forDisplayUUID:](self, "_setProximityInCentimeters:forDisplayUUID:", v18, FloatValue);
    goto LABEL_9;
  }
  if (IntegerValue == 3)
  {
    v10 = IOHIDEventGetFloatValue(v8, 1900545);
    v12 = BKLogCommon(v11);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v28 = 138543618;
      *(_QWORD *)&v28[4] = objc_opt_class(self, v14);
      *(_WORD *)&v28[12] = 2048;
      *(double *)&v28[14] = v10;
      v15 = *(id *)&v28[4];
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%{public}@: human presence event %g", v28, 0x16u);

    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "displayUUID"));
    v17 = sub_10004B74C(v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);

    -[BKHumanPresenceHIDEventProcessor _setPresence:forDisplayUUID:](self, "_setPresence:forDisplayUUID:", v10 > 0.0, v18, *(_OWORD *)v28, *(_QWORD *)&v28[16]);
LABEL_9:

  }
  return 0;
}

- (NSMutableDictionary)displayUUIDToSensorRecords
{
  return self->_queue_displayUUIDToSensorRecords;
}

- (void)setDisplayUUIDToSensorRecords:(id)a3
{
  objc_storeStrong((id *)&self->_queue_displayUUIDToSensorRecords, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (BKIOHIDServiceMatcher)presenceServiceMatcher
{
  return self->_presenceServiceMatcher;
}

- (void)setPresenceServiceMatcher:(id)a3
{
  objc_storeStrong((id *)&self->_presenceServiceMatcher, a3);
}

- (BKIOHIDServiceMatcher)proximityServiceMatcher
{
  return self->_proximityServiceMatcher;
}

- (void)setProximityServiceMatcher:(id)a3
{
  objc_storeStrong((id *)&self->_proximityServiceMatcher, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proximityServiceMatcher, 0);
  objc_storeStrong((id *)&self->_presenceServiceMatcher, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_queue_displayUUIDToSensorRecords, 0);
}

@end
