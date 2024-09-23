@implementation GHSThermometerDevice

- (GHSThermometerDevice)initWithProperties:(id)a3 healthStore:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  GHSThermometerDevice *v10;
  GHSThermometerDevice *v11;
  objc_super v13;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[HKSampleType quantityTypeForIdentifier:](HKSampleType, "quantityTypeForIdentifier:", HKQuantityTypeIdentifierBodyTemperature));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", v8, 0));

  v13.receiver = self;
  v13.super_class = (Class)GHSThermometerDevice;
  v10 = -[GHSBluetoothDevice initWithProperties:healthStore:healthSampleTypes:](&v13, "initWithProperties:healthStore:healthSampleTypes:", v7, v6, v9);

  if (v10)
    v11 = v10;

  return v10;
}

- (BOOL)handleLiveHealthObservationsData:(id)a3 observationClassType:(unsigned __int8)a4 observationType:(unsigned int)a5 userID:(unsigned __int8)a6 observationID:(unsigned int)a7 timestamp:(id)a8
{
  int v10;
  uint64_t v11;
  int v12;
  id v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  int v22;
  uint64_t v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  int v29;
  __int16 v30;
  int v31;
  __int16 v32;
  unsigned int v33;

  v10 = a6;
  v11 = *(_QWORD *)&a5;
  v12 = a4;
  v14 = a3;
  v15 = a8;
  v16 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    v17 = v16;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[GHSBluetoothDevice peripheral](self, "peripheral"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "name"));
    v22 = 141559299;
    v23 = 1752392040;
    v24 = 2113;
    v25 = v19;
    v26 = 1024;
    v27 = v12;
    v28 = 1024;
    v29 = v11;
    v30 = 1024;
    v31 = v10;
    v32 = 1024;
    v33 = a7;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Handle live health observation for peripheral \"%{private, mask.hash}@\": classType %u, observationType %u, userId %u, observationId %u", (uint8_t *)&v22, 0x2Eu);

  }
  if (v12 != 1
    || !-[GHSThermometerDevice extractHealthObservationBodyTemperatureWithStream:observationType:timestamp:isLive:](self, "extractHealthObservationBodyTemperatureWithStream:observationType:timestamp:isLive:", v14, v11, v15, 1))
  {
    v20 = (void *)qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_1000700C0(v20);
    LOBYTE(v12) = 0;
  }

  return v12;
}

- (BOOL)handleStoredHealthObservationsData:(id)a3 observationClassType:(unsigned __int8)a4 observationType:(unsigned int)a5 userID:(unsigned __int8)a6 observationID:(unsigned int)a7 timestamp:(id)a8
{
  uint64_t v9;
  int v10;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  BOOL v18;
  void *v19;
  int v21;
  uint64_t v22;
  __int16 v23;
  void *v24;

  v9 = *(_QWORD *)&a5;
  v10 = a4;
  v12 = a3;
  v13 = a8;
  v14 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    v15 = v14;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[GHSBluetoothDevice peripheral](self, "peripheral"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "name"));
    v21 = 141558275;
    v22 = 1752392040;
    v23 = 2113;
    v24 = v17;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Handle stored health observation for peripheral \"%{private, mask.hash}@\", (uint8_t *)&v21, 0x16u);

  }
  if (v10 == 1
    && -[GHSThermometerDevice extractHealthObservationBodyTemperatureWithStream:observationType:timestamp:isLive:](self, "extractHealthObservationBodyTemperatureWithStream:observationType:timestamp:isLive:", v12, v9, v13, 0))
  {
    v18 = 1;
  }
  else
  {
    v19 = (void *)qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_100070154(v19);
    v18 = 0;
  }

  return v18;
}

- (void)healthDataSyncBodyTemperature:(double)a3 unit:(id)a4 startTime:(id)a5 endTime:(id)a6 sensorLocType:(int64_t)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  unsigned int v16;
  NSObject *v17;
  void *v18;
  void *v19;
  unsigned __int8 v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  _QWORD v31[5];
  void *v32;
  NSString *v33;
  void *v34;
  uint8_t buf[4];
  double v36;
  __int16 v37;
  id v38;
  __int16 v39;
  id v40;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[GHSBluetoothDevice debugLoggingEnabled](self, "debugLoggingEnabled"));
  v16 = objc_msgSend(v15, "BOOLValue");

  if (v16)
  {
    v17 = qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218498;
      v36 = a3;
      v37 = 2112;
      v38 = v12;
      v39 = 2112;
      v40 = v13;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "GHSS HealthDataSync bodyTemperature=%f, unit=%@, date=%@", buf, 0x20u);
    }
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[GHSBluetoothDevice peripheral](self, "peripheral"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "customProperty:", CFSTR("UpdateHealth")));
  v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("1"));

  if ((v20 & 1) != 0)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[HKQuantityType quantityTypeForIdentifier:](HKQuantityType, "quantityTypeForIdentifier:", HKQuantityTypeIdentifierBodyTemperature));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[HKUnit unitFromString:](HKUnit, "unitFromString:", v12));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v22, a3));

    v33 = HKMetadataKeyBodyTemperatureSensorLocation;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a7));
    v34 = v24;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1));

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[GHSBluetoothDevice hkDevice](self, "hkDevice"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[HKQuantitySample quantitySampleWithType:quantity:startDate:endDate:device:metadata:](HKQuantitySample, "quantitySampleWithType:quantity:startDate:endDate:device:metadata:", v21, v23, v13, v14, v26, v25));

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[GHSBluetoothDevice hkStore](self, "hkStore"));
    v32 = v27;
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v32, 1));
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_10004C198;
    v31[3] = &unk_1000AD3C0;
    v31[4] = self;
    objc_msgSend(v28, "saveObjects:withCompletion:", v29, v31);

  }
  else
  {
    v30 = qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "GHSS HealthDataSync Skipped due to user configuration", buf, 2u);
    }
  }

}

- (BOOL)extractHealthObservationBodyTemperatureWithStream:(id)a3 observationType:(unsigned int)a4 timestamp:(id)a5 isLive:(BOOL)a6
{
  id v9;
  id v10;
  uint64_t v11;
  const __CFString *v12;
  BOOL v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  float v19;
  __int16 v20;

  v9 = a3;
  v10 = a5;
  if ((int)a4 > 188423)
  {
    if ((int)a4 > 188451)
    {
      switch(a4)
      {
        case 0x2E024u:
          v11 = 1;
          goto LABEL_26;
        case 0x2E028u:
          v11 = 5;
          goto LABEL_26;
        case 0x2E030u:
          v11 = 8;
          goto LABEL_26;
      }
    }
    else
    {
      switch(a4)
      {
        case 0x2E008u:
          v11 = 6;
          goto LABEL_26;
        case 0x2E00Cu:
          v11 = 3;
          goto LABEL_26;
        case 0x2E010u:
          v11 = 4;
          goto LABEL_26;
      }
    }
LABEL_44:
    v18 = (void *)qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_1000701E8(v18, self);
    v13 = 0;
    goto LABEL_40;
  }
  v11 = 2;
  if ((int)a4 > 150387)
  {
    switch(a4)
    {
      case 0x24B74u:
        goto LABEL_26;
      case 0x24B78u:
        v11 = 9;
        goto LABEL_26;
      case 0x2E004u:
        v11 = 7;
        goto LABEL_26;
    }
    goto LABEL_44;
  }
  if (a4 != 150344)
  {
    if (a4 == 150352)
    {
      v11 = 10;
    }
    else if (a4 != 150364)
    {
      goto LABEL_44;
    }
  }
LABEL_26:
  v20 = 0;
  v19 = 0.0;
  if (objc_msgSend(v9, "readUint16:", &v20))
  {
    if (v20 == 4416)
    {
      v12 = CFSTR("degF");
    }
    else
    {
      if (v20 != 6048)
      {
        v17 = (void *)qword_1000C9178;
        if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
          sub_1000703BC(v17, self);
        v13 = 0;
        v12 = 0;
        goto LABEL_33;
      }
      v12 = CFSTR("degC");
    }
  }
  else
  {
    v12 = 0;
  }
  v13 = 1;
LABEL_33:
  if ((objc_msgSend(v9, "readIEEEFloat:", &v19) & 1) == 0)
  {
    v14 = (void *)qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_100070328(v14);
  }
  if (v19 == 0.0)
  {
    v15 = (void *)qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_100070294(v15);
  }
  else
  {
    -[GHSThermometerDevice healthDataSyncBodyTemperature:unit:startTime:endTime:sensorLocType:](self, "healthDataSyncBodyTemperature:unit:startTime:endTime:sensorLocType:", v12, v10, v10, v11, v19);
  }
LABEL_40:

  return v13;
}

@end
