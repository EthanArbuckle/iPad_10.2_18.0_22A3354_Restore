@implementation GHSBloodGlucoseMeterDevice

- (GHSBloodGlucoseMeterDevice)initWithProperties:(id)a3 healthStore:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  GHSBloodGlucoseMeterDevice *v10;
  GHSBloodGlucoseMeterDevice *v11;
  objc_super v13;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[HKSampleType quantityTypeForIdentifier:](HKSampleType, "quantityTypeForIdentifier:", HKQuantityTypeIdentifierBloodGlucose));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", v8, 0));

  v13.receiver = self;
  v13.super_class = (Class)GHSBloodGlucoseMeterDevice;
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
    || !-[GHSBloodGlucoseMeterDevice extractHealthObservationBloodGlucoseWithStream:observationType:timestamp:isLive:](self, "extractHealthObservationBloodGlucoseWithStream:observationType:timestamp:isLive:", v14, v11, v15, 1))
  {
    v20 = (void *)qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_10006A9E4(v20, self);
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
    && -[GHSBloodGlucoseMeterDevice extractHealthObservationBloodGlucoseWithStream:observationType:timestamp:isLive:](self, "extractHealthObservationBloodGlucoseWithStream:observationType:timestamp:isLive:", v12, v9, v13, 0))
  {
    v18 = 1;
  }
  else
  {
    v19 = (void *)qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_10006AA7C(v19, self);
    v18 = 0;
  }

  return v18;
}

- (void)healthDataSyncBloodGlucose:(double)a3 unit:(id)a4 startTime:(id)a5 endTime:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  unsigned int v14;
  NSObject *v15;
  void *v16;
  void *v17;
  unsigned __int8 v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  _QWORD v27[5];
  void *v28;
  uint8_t buf[4];
  double v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[GHSBluetoothDevice debugLoggingEnabled](self, "debugLoggingEnabled"));
  v14 = objc_msgSend(v13, "BOOLValue");

  if (v14)
  {
    v15 = qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218498;
      v30 = a3;
      v31 = 2112;
      v32 = v10;
      v33 = 2112;
      v34 = v11;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "GHSS HealthDataSync bloodGlucose=%f, unit=%@, date=%@", buf, 0x20u);
    }
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[GHSBluetoothDevice peripheral](self, "peripheral"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "customProperty:", CFSTR("UpdateHealth")));
  v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("1"));

  if ((v18 & 1) != 0)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[HKQuantityType quantityTypeForIdentifier:](HKQuantityType, "quantityTypeForIdentifier:", HKQuantityTypeIdentifierBloodGlucose));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[HKUnit unitFromString:](HKUnit, "unitFromString:", v10));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v20, a3));

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[GHSBluetoothDevice hkDevice](self, "hkDevice"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[HKQuantitySample quantitySampleWithType:quantity:startDate:endDate:device:metadata:](HKQuantitySample, "quantitySampleWithType:quantity:startDate:endDate:device:metadata:", v19, v21, v11, v12, v22, 0));

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[GHSBluetoothDevice hkStore](self, "hkStore"));
    v28 = v23;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v28, 1));
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_100013E38;
    v27[3] = &unk_1000AD3C0;
    v27[4] = self;
    objc_msgSend(v24, "saveObjects:withCompletion:", v25, v27);

  }
  else
  {
    v26 = qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "GHSS HealthDataSync Skipped due to user configuration", buf, 2u);
    }
  }

}

- (BOOL)extractHealthObservationBloodGlucoseWithStream:(id)a3 observationType:(unsigned int)a4 timestamp:(id)a5 isLive:(BOOL)a6
{
  id v9;
  id v10;
  const __CFString *v11;
  BOOL v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v19;
  float v20;
  unsigned __int16 v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  void *v25;

  v9 = a3;
  v10 = a5;
  if (a4 != 160184)
  {
    v12 = 1;
    goto LABEL_17;
  }
  v21 = 0;
  v20 = 0.0;
  if (objc_msgSend(v9, "readUint16:", &v21))
  {
    if (v21 == 2130)
    {
      v11 = CFSTR("mg/dL");
    }
    else
    {
      if (v21 != 4722)
      {
        v19 = (void *)qword_1000C9178;
        if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
          sub_10006AC94(v19, self, &v21);
        v12 = 0;
        v11 = 0;
        goto LABEL_10;
      }
      v11 = CFSTR("mmol/L");
    }
  }
  else
  {
    v11 = 0;
  }
  v12 = 1;
LABEL_10:
  if ((objc_msgSend(v9, "readIEEEFloat:", &v20) & 1) == 0)
  {
    v13 = (void *)qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_10006ABFC(v13, self);
  }
  if (v20 == 0.0)
  {
    v14 = (void *)qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
    {
      v15 = v14;
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[GHSBluetoothDevice peripheral](self, "peripheral"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "name"));
      *(_DWORD *)buf = 141558275;
      v23 = 1752392040;
      v24 = 2113;
      v25 = v17;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Peripheral \"%{private, mask.hash}@\" observation value not saved due to invalid value", buf, 0x16u);

    }
  }
  else
  {
    -[GHSBloodGlucoseMeterDevice healthDataSyncBloodGlucose:unit:startTime:endTime:](self, "healthDataSyncBloodGlucose:unit:startTime:endTime:", v11, v10, v10, v20);
  }
LABEL_17:

  return v12;
}

@end
