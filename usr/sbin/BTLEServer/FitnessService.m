@implementation FitnessService

+ (id)hkQuantityTypeForIdentifier:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v3 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2050000000;
  v4 = (void *)qword_1000C8FE0;
  v11 = qword_1000C8FE0;
  if (!qword_1000C8FE0)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100009EFC;
    v7[3] = &unk_1000AD1C8;
    v7[4] = &v8;
    sub_100009EFC((uint64_t)v7);
    v4 = (void *)v9[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v8, 8);
  if (v5)
    v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "quantityTypeForIdentifier:", v3));

  return v5;
}

+ (BOOL)manufacturer:(id)a3 andModel:(id)a4 matches:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  BOOL v16;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(CFSTR("ALL"), "caseInsensitiveCompare:", v9))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "componentsSeparatedByString:", CFSTR("/")));
    if (objc_msgSend(v10, "count") == (id)2)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", 0));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", 1));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "uppercaseString"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "uppercaseString"));
      v15 = objc_msgSend(v13, "hasPrefix:", v14);

      v16 = v15
         && (!objc_msgSend(CFSTR("ALL"), "caseInsensitiveCompare:", v12)
          || !objc_msgSend(v8, "caseInsensitiveCompare:", v12));

    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = 1;
  }

  return v16;
}

- (FitnessService)initWithManager:(id)a3 peripheral:(id)a4 service:(id)a5
{
  id v8;
  id v9;
  FitnessService *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  NSMutableDictionary *v16;
  NSMutableDictionary *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSDate *pairingTimestamp;
  objc_super v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;

  v8 = a4;
  v9 = a5;
  v27.receiver = self;
  v27.super_class = (Class)FitnessService;
  v10 = -[ClientService initWithManager:peripheral:service:](&v27, "initWithManager:peripheral:service:", a3, v8, v9);
  if (v10)
  {
    v11 = (void *)qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
    {
      v12 = v11;
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "name"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "UUID"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "UUIDString"));
      *(_DWORD *)buf = 138412546;
      v29 = v13;
      v30 = 2112;
      v31 = v15;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "FitnessService - initWithManager:peripheral:“%@” service:%@", buf, 0x16u);

    }
    -[ClientService setIsPrimary:](v10, "setIsPrimary:", 1);
    -[ClientService setPriority:](v10, "setPriority:", 8);
    v16 = objc_opt_new(NSMutableDictionary);
    -[FitnessService setHkDataCollectors:](v10, "setHkDataCollectors:", v16);

    v17 = objc_opt_new(NSMutableDictionary);
    -[FitnessService setHkDatumBuffers:](v10, "setHkDatumBuffers:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService manager](v10, "manager"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CBUUIDDeviceInformationServiceString));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "clientServiceForUUID:", v19));

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v21, "addObserver:selector:name:object:", v10, "receiveDeviceInfoUpdateNotification:", CFSTR("DeviceInformationUpdate"), v20);

    -[FitnessService createHKDevice](v10, "createHKDevice");
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "customProperty:", CFSTR("PairingTimestamp")));
    v23 = v22;
    if (v22)
    {
      objc_msgSend(v22, "doubleValue");
      v24 = objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"));
      pairingTimestamp = v10->_pairingTimestamp;
      v10->_pairingTimestamp = (NSDate *)v24;

    }
    -[FitnessService start](v10, "start");

  }
  return v10;
}

- (BOOL)updateHealthEnabled
{
  return 1;
}

- (BOOL)isFitnessClassicDevice
{
  return 0;
}

- (NSArray)alwaysCollectQuantityTypes
{
  if (qword_1000C8FD8 != -1)
    dispatch_once(&qword_1000C8FD8, &stru_1000AD150);
  return (NSArray *)(id)qword_1000C8FD0;
}

- (BOOL)supportsHKQuantityType:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));

  LOBYTE(v4) = objc_msgSend(v5, "hasTag:", v6);
  return (char)v4;
}

- (void)setNotify:(BOOL)a3 forCharacteristic:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  id v10;

  v4 = a3;
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    v10 = v6;
    v8 = objc_msgSend(v6, "properties");
    v7 = v10;
    if ((v8 & 0x10) != 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
      objc_msgSend(v9, "setNotifyValue:forCharacteristic:", v4, v10);

      v7 = v10;
    }
  }

}

- (void)featuresReadComplete
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[FitnessDeviceManager instance](FitnessDeviceManager, "instance"));
  objc_msgSend(v3, "registerFitnessService:", self);

}

- (void)start
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  objc_super v7;
  uint8_t buf[4];
  void *v9;
  __int16 v10;
  unsigned int v11;
  __int16 v12;
  unsigned int v13;

  v3 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "name"));
    *(_DWORD *)buf = 138412802;
    v9 = v6;
    v10 = 1024;
    v11 = -[FitnessService productID](self, "productID");
    v12 = 1024;
    v13 = -[FitnessService vendorID](self, "vendorID");
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "FitnessService starting for “%@” PID:0x%04X VID:0x%04X", buf, 0x18u);

  }
  v7.receiver = self;
  v7.super_class = (Class)FitnessService;
  -[ClientService start](&v7, "start");
}

- (void)stop
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  objc_super v7;
  uint8_t buf[4];
  void *v9;

  v3 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "name"));
    *(_DWORD *)buf = 138412290;
    v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "FitnessService stopping for “%@”", buf, 0xCu);

  }
  -[FitnessService updateRequestedQuantityTypes:](self, "updateRequestedQuantityTypes:", &__NSArray0__struct);
  v7.receiver = self;
  v7.super_class = (Class)FitnessService;
  -[ClientService stop](&v7, "stop");
}

- (void)updateRequestedQuantityTypes:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  void *j;
  uint64_t v25;
  void *v26;
  id v27;
  id v28;
  uint64_t v29;
  void *k;
  uint64_t v31;
  _BOOL4 v32;
  void *v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint8_t v49[128];
  uint8_t buf[4];
  void *v51;

  v4 = a3;
  v5 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name"));
    *(_DWORD *)buf = 138412290;
    v51 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "FitnessService.updateRequestedQuantityTypes:%@", buf, 0xCu);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FitnessService alwaysCollectQuantityTypes](self, "alwaysCollectQuantityTypes"));
  v10 = objc_msgSend(v9, "count");

  if (v10)
  {
    v11 = objc_msgSend(v4, "mutableCopy");
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[FitnessService alwaysCollectQuantityTypes](self, "alwaysCollectQuantityTypes"));
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(_QWORD *)v44 != v15)
            objc_enumerationMutation(v12);
          v17 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)i);
          if ((objc_msgSend(v4, "containsObject:", v17) & 1) == 0)
            objc_msgSend(v11, "addObject:", v17);
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
      }
      while (v14);
    }

  }
  else
  {
    v11 = v4;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_hkDataCollectors, "allKeys"));
  v19 = objc_msgSend(v18, "count");

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v20 = v11;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v40;
    do
    {
      for (j = 0; j != v22; j = (char *)j + 1)
      {
        if (*(_QWORD *)v40 != v23)
          objc_enumerationMutation(v20);
        v25 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)j);
        if (-[FitnessService supportsHKQuantityType:](self, "supportsHKQuantityType:", v25))
          -[FitnessService createDataCollectorForQuantityType:](self, "createDataCollectorForQuantityType:", v25);
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
    }
    while (v22);
  }

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[FitnessService hkQuantityTypesCollecting](self, "hkQuantityTypesCollecting", 0));
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v36;
    do
    {
      for (k = 0; k != v28; k = (char *)k + 1)
      {
        if (*(_QWORD *)v36 != v29)
          objc_enumerationMutation(v26);
        v31 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)k);
        if ((objc_msgSend(v20, "containsObject:", v31) & 1) == 0)
          -[FitnessService finishCollectionForQuantityType:](self, "finishCollectionForQuantityType:", v31);
      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
    }
    while (v28);
  }
  v32 = v19 == 0;

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_hkDataCollectors, "allKeys"));
  v34 = objc_msgSend(v33, "count");

  if (((v32 ^ (v34 != 0)) & 1) == 0)
    -[FitnessService collectData:](self, "collectData:", v34 != 0);

}

- (id)hkQuantityTypesCollecting
{
  return -[NSMutableDictionary allKeys](self->_hkDataCollectors, "allKeys");
}

- (BOOL)isCollectingHKQuantityType:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FitnessService hkQuantityTypesCollecting](self, "hkQuantityTypesCollecting"));
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (unint64_t)readBytesFromNSData:(id)a3 into:(void *)a4 startingAt:(unint64_t)a5 length:(unint64_t)a6 info:(id)a7
{
  id v11;
  id v12;
  unsigned int v13;
  NSObject *v14;
  NSObject *v15;
  int v17;
  _BYTE v18[14];
  __int16 v19;
  int v20;
  __int16 v21;
  _BYTE v22[14];

  v11 = a3;
  v12 = a7;
  if ((unint64_t)objc_msgSend(v11, "length") <= a5)
  {
    v15 = qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
    {
      v17 = 138413058;
      *(_QWORD *)v18 = v12;
      *(_WORD *)&v18[8] = 1024;
      *(_DWORD *)&v18[10] = a5;
      v19 = 1024;
      v20 = a6;
      v21 = 2112;
      *(_QWORD *)v22 = v11;
      _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Out of range error trying to read %@ at index %d length %d from data %@", (uint8_t *)&v17, 0x22u);
    }
    a6 = 0;
  }
  else if (a6 + a5 <= (unint64_t)objc_msgSend(v11, "length"))
  {
    objc_msgSend(v11, "getBytes:range:", a4, a5, a6);
  }
  else
  {
    v13 = objc_msgSend(v11, "length") - a5;
    objc_msgSend(v11, "getBytes:range:", a4, a5, v13);
    v14 = qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
    {
      v17 = 67110146;
      *(_DWORD *)v18 = v13;
      *(_WORD *)&v18[4] = 2112;
      *(_QWORD *)&v18[6] = v12;
      v19 = 1024;
      v20 = a5;
      v21 = 1024;
      *(_DWORD *)v22 = a6;
      *(_WORD *)&v22[4] = 2112;
      *(_QWORD *)&v22[6] = v11;
      _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Could only read %d bytes from %@ at index %d instead of requested length %d from data %@", (uint8_t *)&v17, 0x28u);
    }
    a6 = v13;
  }

  return a6;
}

- (BOOL)isDistributed
{
  return 0;
}

- (BOOL)matchesDistributedService:(id)a3
{
  return 0;
}

- (id)createDatum:(double)a3 start:(id)a4 end:(id)a5 quantityType:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  void **v24;
  uint64_t v25;
  Class (*v26)(uint64_t);
  void *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2050000000;
  v12 = (void *)qword_1000C8FF0;
  v32 = qword_1000C8FF0;
  if (!qword_1000C8FF0)
  {
    v24 = _NSConcreteStackBlock;
    v25 = 3221225472;
    v26 = sub_100009FB0;
    v27 = &unk_1000AD1C8;
    v28 = &v29;
    sub_100009FB0((uint64_t)&v24);
    v12 = (void *)v30[3];
  }
  v13 = objc_retainAutorelease(v12);
  _Block_object_dispose(&v29, 8);
  v29 = 0;
  v30 = &v29;
  v31 = 0x2050000000;
  v14 = (void *)qword_1000C8FF8;
  v32 = qword_1000C8FF8;
  if (!qword_1000C8FF8)
  {
    v24 = _NSConcreteStackBlock;
    v25 = 3221225472;
    v26 = sub_10000A064;
    v27 = &unk_1000AD1C8;
    v28 = &v29;
    sub_10000A064((uint64_t)&v24);
    v14 = (void *)v30[3];
  }
  v15 = objc_retainAutorelease(v14);
  _Block_object_dispose(&v29, 8);
  if (v13 && v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[FitnessDeviceManager instance](FitnessDeviceManager, "instance"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "hkUnitForHKQuantityType:", v11));

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "quantityWithUnit:doubleValue:", v17, a3));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v20 = objc_msgSend(objc_alloc((Class)NSDateInterval), "initWithStartDate:endDate:", v9, v10);
    v21 = objc_msgSend([v15 alloc], "initWithIdentifier:dateInterval:quantity:resumeContext:", v19, v20, v18, 0);

  }
  else
  {
    v22 = (void *)qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_100069A64(v22, v11);
    v21 = 0;
  }

  return v21;
}

- (BOOL)wasPairedAfter:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSDate *pairingTimestamp;
  void *v8;
  BOOL v9;

  v4 = a3;
  v5 = v4;
  if (self->_pairingTimestamp)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pairingTimestamp"));

    if (v6)
    {
      pairingTimestamp = self->_pairingTimestamp;
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "pairingTimestamp"));
      v9 = -[NSDate compare:](pairingTimestamp, "compare:", v8) == NSOrderedAscending;

    }
    else
    {
      v9 = 1;
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)firstSampleTimestampOlderThan:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSDate *firstSampleTimestamp;
  void *v8;
  BOOL v9;

  v4 = a3;
  v5 = v4;
  if (self->_firstSampleTimestamp)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstSampleTimestamp"));

    if (v6)
    {
      firstSampleTimestamp = self->_firstSampleTimestamp;
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstSampleTimestamp"));
      v9 = -[NSDate compare:](firstSampleTimestamp, "compare:", v8) == NSOrderedAscending;

    }
    else
    {
      v9 = 1;
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)latestSampleTimestampWithinSeconds:(double)a3
{
  NSDate *latestSampleTimestamp;
  double v5;

  latestSampleTimestamp = self->_latestSampleTimestamp;
  if (latestSampleTimestamp)
  {
    -[NSDate timeIntervalSinceNow](latestSampleTimestamp, "timeIntervalSinceNow");
    LOBYTE(latestSampleTimestamp) = fabs(v5) < a3;
  }
  return (char)latestSampleTimestamp;
}

- (void)recordDatum:(id)a3 forType:(id)a4
{
  id v6;
  id v7;
  NSDate *v8;
  NSDate *latestSampleTimestamp;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  NSMutableDictionary *hkDatumBuffers;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  NSMutableDictionary *v25;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
    latestSampleTimestamp = self->_latestSampleTimestamp;
    self->_latestSampleTimestamp = v8;

    if (!self->_firstSampleTimestamp)
      objc_storeStrong((id *)&self->_firstSampleTimestamp, self->_latestSampleTimestamp);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[FitnessDeviceManager instance](FitnessDeviceManager, "instance"));
    v11 = objc_msgSend(v10, "shouldForwardFitnessService:quantityType:", self, v7);

    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_hkDatumBuffers, "objectForKey:", v7));
      v13 = v12;
      if (v12)
      {
        objc_msgSend(v12, "addObject:", v6);
      }
      else
      {
        v14 = (void *)qword_1000C9178;
        if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
        {
          v15 = v14;
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "name"));
          hkDatumBuffers = self->_hkDatumBuffers;
          v20 = 138412802;
          v21 = v16;
          v22 = 2112;
          v23 = v18;
          v24 = 2112;
          v25 = hkDatumBuffers;
          _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "recordDatum:forType:%@ “%@” datumBuffer not available (hkDatumBuffers:%@)", (uint8_t *)&v20, 0x20u);

        }
      }

    }
  }

}

- (void)recordDatum:(double)a3 start:(id)a4 end:(id)a5 quantityType:(id)a6
{
  id v10;
  id v11;

  v10 = a6;
  v11 = (id)objc_claimAutoreleasedReturnValue(-[FitnessService createDatum:start:end:quantityType:](self, "createDatum:start:end:quantityType:", a4, a5, v10, a3));
  -[FitnessService recordDatum:forType:](self, "recordDatum:forType:", v11, v10);

}

- (void)storeDatumsForQuantityType:(id)a3 usingHKDevice:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *log;
  _QWORD v34[4];
  id v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  void *v48;
  _BYTE v49[128];

  v6 = a3;
  v29 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_hkDataCollectors, "objectForKey:", v6));
  v30 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_hkDatumBuffers, "objectForKey:", v6));
  v9 = v8;
  if (v7)
    v10 = v8 == 0;
  else
    v10 = 1;
  if (v10)
  {
    v11 = (void *)qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
    {
      v12 = v11;
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "identifier"));
      *(_DWORD *)buf = 138412802;
      v42 = v7;
      v43 = 2112;
      v44 = v9;
      v45 = 2112;
      v46 = v13;
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "storeDatumsForQuantityType: Missing dataCollector:%@ or datumBuffer:%@ for qty:%@", buf, 0x20u);

    }
  }
  else if (objc_msgSend(v8, "count"))
  {
    v27 = v9;
    v28 = v7;
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v14 = v9;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v38;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v38 != v17)
            objc_enumerationMutation(v14);
          v19 = (void *)qword_1000C9178;
          if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
          {
            v20 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)v18);
            log = v19;
            v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "identifier"));
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "name"));
            v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "quantity"));
            objc_msgSend(v32, "_value");
            v23 = v22;
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "quantity"));
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "_unit"));
            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "unitString"));
            *(_DWORD *)buf = 138413058;
            v42 = v31;
            v43 = 2112;
            v44 = v21;
            v45 = 2048;
            v46 = v23;
            v47 = 2112;
            v48 = v26;
            _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "storeDatumForQuantityType:%@ - device:“%@”: value:%f %@", buf, 0x2Au);

          }
          v18 = (char *)v18 + 1;
        }
        while (v16 != v18);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
      }
      while (v16);
    }

    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_100008D04;
    v34[3] = &unk_1000AD178;
    v35 = v29;
    v36 = v30;
    v7 = v28;
    objc_msgSend(v28, "insertDatums:device:metadata:completion:", v14, v35, 0, v34);
    objc_msgSend(v14, "removeAllObjects");

    v9 = v27;
  }

}

- (void)storeDatumsForQuantityType:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "hkDevice"));
  -[FitnessService storeDatumsForQuantityType:usingHKDevice:](self, "storeDatumsForQuantityType:usingHKDevice:", v4, v5);

}

- (void)storeAllDatums
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_hkDataCollectors, "allKeys", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        -[FitnessService storeDatumsForQuantityType:](self, "storeDatumsForQuantityType:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)v7));
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)finishCollectionForQuantityType:(id)a3
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
  id v13;
  id v14;
  void *v15;
  void **v16;
  uint64_t v17;
  void (*v18)(uint64_t, int, void *);
  void *v19;
  id v20;
  id v21;
  _BYTE buf[12];
  __int16 v23;
  void *v24;

  v4 = a3;
  v5 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v8;
    v23 = 2112;
    v24 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Finishing data collection on %@ for %@", buf, 0x16u);

  }
  -[FitnessService storeDatumsForQuantityType:](self, "storeDatumsForQuantityType:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FitnessService hkDataCollectors](self, "hkDataCollectors"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", v4));

  v12 = objc_alloc((Class)HKDataCollectorState);
  v13 = objc_msgSend(v12, "initWithType:priority:", 1, HKDataCollectorPriorityDefault + 10);
  objc_msgSend(v11, "setState:", v13);
  *(_QWORD *)buf = 0;
  objc_initWeak((id *)buf, self);
  v16 = _NSConcreteStackBlock;
  v17 = 3221225472;
  v18 = sub_10000910C;
  v19 = &unk_1000AD1A0;
  objc_copyWeak(&v21, (id *)buf);
  v14 = v4;
  v20 = v14;
  objc_msgSend(v11, "finishWithCompletion:", &v16);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[FitnessService hkDataCollectors](self, "hkDataCollectors", v16, v17, v18, v19));
  objc_msgSend(v15, "removeObjectForKey:", v14);

  objc_destroyWeak(&v21);
  objc_destroyWeak((id *)buf);

}

- (void)createDataCollectorForQuantityType:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  NSMutableDictionary *hkDatumBuffers;
  NSMutableArray *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  id v21;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_hkDataCollectors, "objectForKey:", v4));
  if (v5)
  {
    v6 = (void *)v5;
    v7 = objc_alloc((Class)HKDataCollectorState);
    v8 = objc_msgSend(v7, "initWithType:priority:", 2, HKDataCollectorPriorityDefault + 10);
    objc_msgSend(v6, "setState:", v8);
    goto LABEL_3;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[FitnessDeviceManager instance](FitnessDeviceManager, "instance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "createHKDataCollectorForHKQuantityType:", v4));

  if (v6)
  {
    if (_os_feature_enabled_impl("Health", "pulse"))
    {
      v10 = objc_alloc((Class)HKDataCollectorState);
      v11 = objc_msgSend(v10, "initWithType:priority:", 2, HKDataCollectorPriorityDefault + 10);
      objc_msgSend(v6, "setState:", v11);

    }
    -[NSMutableDictionary setObject:forKey:](self->_hkDataCollectors, "setObject:forKey:", v6, v4);
    hkDatumBuffers = self->_hkDatumBuffers;
    v13 = objc_opt_new(NSMutableArray);
    -[NSMutableDictionary setObject:forKey:](hkDatumBuffers, "setObject:forKey:", v13, v4);

    v14 = (void *)qword_1000C9178;
    if (!os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
      goto LABEL_4;
    v15 = v14;
    v8 = (id)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "name"));
    v18 = 138412546;
    v19 = v16;
    v20 = 2112;
    v21 = v4;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Created data collector for device “%@” quantity type %@", (uint8_t *)&v18, 0x16u);

LABEL_3:
LABEL_4:

    goto LABEL_5;
  }
  v17 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
    sub_100069BF0(v17, self, (uint64_t)v4);
LABEL_5:

}

- (void)createHKDevice
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
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
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *log;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t v53;
  _BYTE buf[24];
  void *v55;
  _BYTE v56[10];
  __int16 v57;
  void *v58;
  __int16 v59;
  void *v60;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "hkDevice"));

    if (v5)
    {
      v6 = (void *)qword_1000C9178;
      if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
      {
        v7 = v6;
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "name"));
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v9;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "HKDevice for %@ already exists", buf, 0xCu);

      }
    }
    else
    {
      v50 = 0;
      v51 = &v50;
      v52 = 0x2050000000;
      v11 = (void *)qword_1000C9000;
      v53 = qword_1000C9000;
      if (!qword_1000C9000)
      {
        *(_QWORD *)buf = _NSConcreteStackBlock;
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = sub_10000A118;
        v55 = &unk_1000AD1C8;
        *(_QWORD *)v56 = &v50;
        sub_10000A118((uint64_t)buf);
        v11 = (void *)v51[3];
      }
      v12 = objc_retainAutorelease(v11);
      _Block_object_dispose(&v50, 8);
      if (v12)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService manager](self, "manager"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CBUUIDDeviceInformationServiceString));
        v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "clientServiceForUUID:", v14));

        self->_vendorID = (unsigned __int16)objc_msgSend(v49, "vendorID");
        self->_productID = (unsigned __int16)objc_msgSend(v49, "productID");
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
        v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "name"));

        v16 = [v12 alloc];
        v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "manufacturerName"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "modelNumber"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "hardwareRevision"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "firmwareRevision"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "softwareRevision"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "identifier"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "UUIDString"));
        v24 = objc_msgSend(v16, "initWithName:manufacturer:model:hardwareVersion:firmwareVersion:softwareVersion:localIdentifier:UDIDeviceIdentifier:", v46, v47, v17, v18, v19, v20, v23, 0);
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
        objc_msgSend(v25, "setHkDevice:", v24);

        v26 = (void *)qword_1000C9178;
        if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
        {
          log = v26;
          v48 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
          v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "hkDevice"));
          v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "name"));
          v44 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
          v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "hkDevice"));
          v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "manufacturer"));
          v42 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
          v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "hkDevice"));
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "model"));
          v28 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "hkDevice"));
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "hardwareVersion"));
          v31 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "hkDevice"));
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "firmwareVersion"));
          v34 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
          v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "hkDevice"));
          v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "localIdentifier"));
          *(_DWORD *)buf = 138413570;
          *(_QWORD *)&buf[4] = v39;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v38;
          *(_WORD *)&buf[22] = 2112;
          v55 = v27;
          *(_WORD *)v56 = 2112;
          *(_QWORD *)&v56[2] = v30;
          v57 = 2112;
          v58 = v33;
          v59 = 2112;
          v60 = v36;
          _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Created HKDevice name:“%@” manufacturer:“%@” model:“%@” HW:“%@” FW:“%@” localID:“%@”", buf, 0x3Eu);

        }
      }
      else
      {
        v37 = (void *)qword_1000C9178;
        if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
          sub_100069CEC(v37, self);
      }
    }
  }
  else
  {
    v10 = qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_100069CAC(v10);
  }
}

- (void)receiveDeviceInfoUpdateNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
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
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("DeviceInformationUpdate")) & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "UUIDString"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "valueForKey:", CFSTR("UUID")));
    v11 = objc_msgSend(v8, "isEqualToString:", v10);

    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "hkDevice"));

      if (v13)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "valueForKey:", CFSTR("ModelNumber")));

        if (v15)
          objc_msgSend(v13, "_setModel:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "valueForKey:", CFSTR("FirmwareRevision")));

        if (v17)
          objc_msgSend(v13, "_setFirmwareVersion:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "valueForKey:", CFSTR("HardwareRevision")));

        if (v19)
          objc_msgSend(v13, "_setHardwareVersion:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "valueForKey:", CFSTR("ManufacturerName")));

        if (v21)
          objc_msgSend(v13, "_setManufacturer:", v21);
        v22 = (void *)qword_1000C9178;
        if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
        {
          v23 = v22;
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "name"));
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "manufacturer"));
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "model"));
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "hardwareVersion"));
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "firmwareVersion"));
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localIdentifier"));
          v30 = 138413570;
          v31 = v24;
          v32 = 2112;
          v33 = v25;
          v34 = 2112;
          v35 = v26;
          v36 = 2112;
          v37 = v27;
          v38 = 2112;
          v39 = v28;
          v40 = 2112;
          v41 = v29;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Updated HKDevice name:“%@” manufacturer:“%@” model:“%@” HW:“%@” FW:“%@” localID:“%@”", (uint8_t *)&v30, 0x3Eu);

        }
      }

    }
  }
  else
  {

  }
}

- (unsigned)vendorID
{
  return self->_vendorID;
}

- (unsigned)productID
{
  return self->_productID;
}

- (NSMutableDictionary)hkDataCollectors
{
  return self->_hkDataCollectors;
}

- (void)setHkDataCollectors:(id)a3
{
  objc_storeStrong((id *)&self->_hkDataCollectors, a3);
}

- (NSMutableDictionary)hkDatumBuffers
{
  return self->_hkDatumBuffers;
}

- (void)setHkDatumBuffers:(id)a3
{
  objc_storeStrong((id *)&self->_hkDatumBuffers, a3);
}

- (NSDate)pairingTimestamp
{
  return self->_pairingTimestamp;
}

- (void)setPairingTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_pairingTimestamp, a3);
}

- (NSDate)firstSampleTimestamp
{
  return self->_firstSampleTimestamp;
}

- (void)setFirstSampleTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_firstSampleTimestamp, a3);
}

- (NSDate)latestSampleTimestamp
{
  return self->_latestSampleTimestamp;
}

- (void)setLatestSampleTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_latestSampleTimestamp, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latestSampleTimestamp, 0);
  objc_storeStrong((id *)&self->_firstSampleTimestamp, 0);
  objc_storeStrong((id *)&self->_pairingTimestamp, 0);
  objc_storeStrong((id *)&self->_hkDatumBuffers, 0);
  objc_storeStrong((id *)&self->_hkDataCollectors, 0);
}

@end
