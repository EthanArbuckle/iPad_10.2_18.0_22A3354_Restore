@implementation GHSWeightScaleDevice

- (GHSWeightScaleDevice)initWithProperties:(id)a3 healthStore:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  GHSWeightScaleDevice *v12;
  GHSWeightScaleDevice *v13;
  objc_super v15;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[HKSampleType quantityTypeForIdentifier:](HKSampleType, "quantityTypeForIdentifier:", HKQuantityTypeIdentifierBodyMass));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[HKSampleType quantityTypeForIdentifier:](HKSampleType, "quantityTypeForIdentifier:", HKQuantityTypeIdentifierHeight));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[HKSampleType quantityTypeForIdentifier:](HKSampleType, "quantityTypeForIdentifier:", HKQuantityTypeIdentifierBodyMassIndex));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", v8, v9, v10, 0));

  v15.receiver = self;
  v15.super_class = (Class)GHSWeightScaleDevice;
  v12 = -[GHSBluetoothDevice initWithProperties:healthStore:healthSampleTypes:](&v15, "initWithProperties:healthStore:healthSampleTypes:", v7, v6, v11);

  if (v12)
    v13 = v12;

  return v12;
}

- (BOOL)handleLiveHealthObservationsData:(id)a3 observationClassType:(unsigned __int8)a4 observationType:(unsigned int)a5 userID:(unsigned __int8)a6 observationID:(unsigned int)a7 timestamp:(id)a8
{
  int v10;
  int v12;
  id v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  BOOL v20;
  void *v21;
  void *v22;
  int v24;
  uint64_t v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  unsigned int v31;
  __int16 v32;
  int v33;
  __int16 v34;
  unsigned int v35;

  v10 = a6;
  v12 = a4;
  v14 = a3;
  v15 = a8;
  v16 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    v17 = v16;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[GHSBluetoothDevice peripheral](self, "peripheral"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "name"));
    v24 = 141559299;
    v25 = 1752392040;
    v26 = 2113;
    v27 = v19;
    v28 = 1024;
    v29 = v12;
    v30 = 1024;
    v31 = a5;
    v32 = 1024;
    v33 = v10;
    v34 = 1024;
    v35 = a7;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Handle live health observation for peripheral \"%{private, mask.hash}@\": classType %u, observationType %u, userId %u, observationId %u", (uint8_t *)&v24, 0x2Eu);

  }
  if (v12 == 1)
  {
    switch(a5)
    {
      case 0x2E150u:
        v20 = 1;
        if (-[GHSWeightScaleDevice extractHealthObservationBodyMassIndexWithStream:timestamp:isLive:](self, "extractHealthObservationBodyMassIndexWithStream:timestamp:isLive:", v14, v15, 1))
        {
          goto LABEL_18;
        }
        break;
      case 0x2E144u:
        v20 = 1;
        if (-[GHSWeightScaleDevice extractHealthObservationBodyHeightWithStream:timestamp:isLive:](self, "extractHealthObservationBodyHeightWithStream:timestamp:isLive:", v14, v15, 1))
        {
          goto LABEL_18;
        }
        break;
      case 0x2E140u:
        v20 = 1;
        if (-[GHSWeightScaleDevice extractHealthObservationBodyMassWithStream:timestamp:isLive:](self, "extractHealthObservationBodyMassWithStream:timestamp:isLive:", v14, v15, 1))
        {
          goto LABEL_18;
        }
        break;
      default:
        v21 = (void *)qword_1000C9178;
        if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
          sub_1000723A8(v21);
        break;
    }
  }
  v22 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
    sub_1000700C0(v22);
  v20 = 0;
LABEL_18:

  return v20;
}

- (BOOL)handleStoredHealthObservationsData:(id)a3 observationClassType:(unsigned __int8)a4 observationType:(unsigned int)a5 userID:(unsigned __int8)a6 observationID:(unsigned int)a7 timestamp:(id)a8
{
  int v10;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  BOOL v18;
  void *v19;
  void *v20;
  int v22;
  uint64_t v23;
  __int16 v24;
  void *v25;

  v10 = a4;
  v12 = a3;
  v13 = a8;
  v14 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    v15 = v14;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[GHSBluetoothDevice peripheral](self, "peripheral"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "name"));
    v22 = 141558275;
    v23 = 1752392040;
    v24 = 2113;
    v25 = v17;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Handle stored health observation for peripheral \"%{private, mask.hash}@\", (uint8_t *)&v22, 0x16u);

  }
  if (v10 != 1)
    goto LABEL_15;
  if (a5 == 188752)
  {
    if (!-[GHSWeightScaleDevice extractHealthObservationBodyMassIndexWithStream:timestamp:isLive:](self, "extractHealthObservationBodyMassIndexWithStream:timestamp:isLive:", v12, v13, 0))goto LABEL_15;
    goto LABEL_12;
  }
  if (a5 == 188740)
  {
    if (!-[GHSWeightScaleDevice extractHealthObservationBodyHeightWithStream:timestamp:isLive:](self, "extractHealthObservationBodyHeightWithStream:timestamp:isLive:", v12, v13, 0))goto LABEL_15;
LABEL_12:
    v18 = 1;
    goto LABEL_18;
  }
  if (a5 != 188736)
  {
    v19 = (void *)qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_1000724D4(v19);
    goto LABEL_15;
  }
  if (-[GHSWeightScaleDevice extractHealthObservationBodyMassWithStream:timestamp:isLive:](self, "extractHealthObservationBodyMassWithStream:timestamp:isLive:", v12, v13, 0))
  {
    goto LABEL_12;
  }
LABEL_15:
  v20 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
    sub_100072440(v20);
  v18 = 0;
LABEL_18:

  return v18;
}

- (void)healthDataSyncBodyMeasurement:(double)a3 measurementType:(id)a4 unit:(id)a5 startTime:(id)a6 endTime:(id)a7
{
  NSString *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  unsigned int v17;
  __CFString *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  unsigned __int8 v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[5];
  void *v33;
  uint8_t buf[4];
  __CFString *v35;
  __int16 v36;
  double v37;
  __int16 v38;
  id v39;
  __int16 v40;
  id v41;

  v12 = (NSString *)a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[GHSBluetoothDevice debugLoggingEnabled](self, "debugLoggingEnabled"));
  v17 = objc_msgSend(v16, "BOOLValue");

  if (v17)
  {
    if (HKQuantityTypeIdentifierBodyMass == v12)
    {
      v18 = CFSTR("BodyMass");
    }
    else if (HKQuantityTypeIdentifierHeight == v12)
    {
      v18 = CFSTR("BodyHeight");
    }
    else
    {
      v18 = HKQuantityTypeIdentifierBodyMassIndex == v12 ? CFSTR("BodyMassIndex") : CFSTR("Unknown");
    }
    v19 = qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      v35 = v18;
      v36 = 2048;
      v37 = a3;
      v38 = 2112;
      v39 = v13;
      v40 = 2112;
      v41 = v14;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "GHSS HealthDataSync %@=%f, unit=%@, date=%@", buf, 0x2Au);
    }
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[GHSBluetoothDevice peripheral](self, "peripheral"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "customProperty:", CFSTR("UpdateHealth")));
  v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("1"));

  if ((v22 & 1) != 0)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[HKQuantityType quantityTypeForIdentifier:](HKQuantityType, "quantityTypeForIdentifier:", v12));
    if (v13)
      v24 = objc_claimAutoreleasedReturnValue(+[HKUnit unitFromString:](HKUnit, "unitFromString:", v13));
    else
      v24 = objc_claimAutoreleasedReturnValue(+[HKUnit countUnit](HKUnit, "countUnit"));
    v26 = (void *)v24;
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v24, a3));

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[GHSBluetoothDevice hkDevice](self, "hkDevice"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[HKQuantitySample quantitySampleWithType:quantity:startDate:endDate:device:metadata:](HKQuantitySample, "quantitySampleWithType:quantity:startDate:endDate:device:metadata:", v23, v27, v14, v15, v28, 0));

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[GHSBluetoothDevice hkStore](self, "hkStore"));
    v33 = v29;
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v33, 1));
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_10006200C;
    v32[3] = &unk_1000AD3C0;
    v32[4] = self;
    objc_msgSend(v30, "saveObjects:withCompletion:", v31, v32);

  }
  else
  {
    v25 = qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "GHSS HealthDataSync Skipped due to user configuration", buf, 2u);
    }
  }

}

- (BOOL)extractHealthObservationBodyMassWithStream:(id)a3 timestamp:(id)a4 isLive:(BOOL)a5
{
  id v7;
  id v8;
  const __CFString *v9;
  BOOL v10;
  void *v11;
  float v12;
  void *v13;
  void *v15;
  float v16;
  __int16 v17;

  v7 = a3;
  v8 = a4;
  v17 = 0;
  v16 = 0.0;
  if (!objc_msgSend(v7, "readUint16:", &v17))
  {
    v9 = 0;
    goto LABEL_7;
  }
  if (v17 == 1731)
  {
    v9 = CFSTR("g");
    goto LABEL_7;
  }
  if (v17 == 1760)
  {
    v9 = CFSTR("lb");
LABEL_7:
    v10 = 1;
    goto LABEL_8;
  }
  v15 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
    sub_10007256C(v15);
  v10 = 0;
  v9 = 0;
LABEL_8:
  if ((objc_msgSend(v7, "readIEEEFloat:", &v16) & 1) == 0)
  {
    v11 = (void *)qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_100070328(v11);
    if (v17 == 1731)
    {
      v10 = 0;
      v12 = v16 * 1000.0;
      v16 = v16 * 1000.0;
      goto LABEL_15;
    }
    v10 = 0;
  }
  v12 = v16;
LABEL_15:
  if (v12 == 0.0)
  {
    v13 = (void *)qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_100070294(v13);
  }
  else
  {
    -[GHSWeightScaleDevice healthDataSyncBodyMeasurement:measurementType:unit:startTime:endTime:](self, "healthDataSyncBodyMeasurement:measurementType:unit:startTime:endTime:", HKQuantityTypeIdentifierBodyMass, v9, v8, v8, v12);
  }

  return v10;
}

- (BOOL)extractHealthObservationBodyHeightWithStream:(id)a3 timestamp:(id)a4 isLive:(BOOL)a5
{
  id v7;
  id v8;
  const __CFString *v9;
  BOOL v10;
  void *v11;
  float v12;
  void *v13;
  void *v15;
  float v16;
  __int16 v17;

  v7 = a3;
  v8 = a4;
  v17 = 0;
  v16 = 0.0;
  if (!objc_msgSend(v7, "readUint16:", &v17))
  {
    v9 = 0;
    goto LABEL_7;
  }
  if (v17 == 1297)
  {
    v9 = CFSTR("m");
    goto LABEL_7;
  }
  if (v17 == 1376)
  {
    v9 = CFSTR("in");
LABEL_7:
    v10 = 1;
    goto LABEL_8;
  }
  v15 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
    sub_10007256C(v15);
  v10 = 0;
  v9 = 0;
LABEL_8:
  if ((objc_msgSend(v7, "readIEEEFloat:", &v16) & 1) == 0)
  {
    v11 = (void *)qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_100070328(v11);
    if (v17 == 1297)
    {
      v10 = 0;
      v12 = v16 / 100.0;
      v16 = v16 / 100.0;
      goto LABEL_15;
    }
    v10 = 0;
  }
  v12 = v16;
LABEL_15:
  if (v12 == 0.0)
  {
    v13 = (void *)qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_100070294(v13);
  }
  else
  {
    -[GHSWeightScaleDevice healthDataSyncBodyMeasurement:measurementType:unit:startTime:endTime:](self, "healthDataSyncBodyMeasurement:measurementType:unit:startTime:endTime:", HKQuantityTypeIdentifierHeight, v9, v8, v8, v12);
  }

  return v10;
}

- (BOOL)extractHealthObservationBodyMassIndexWithStream:(id)a3 timestamp:(id)a4 isLive:(BOOL)a5
{
  id v7;
  id v8;
  unsigned int v9;
  unsigned int v10;
  void *v11;
  void *v12;
  void *v13;
  float v15;
  __int16 v16;

  v7 = a3;
  v8 = a4;
  v16 = 0;
  v15 = 0.0;
  v9 = objc_msgSend(v7, "readUint16:", &v16);
  if (v16 == 7747)
    v10 = 0;
  else
    v10 = v9;
  if (v10 == 1)
  {
    v11 = (void *)qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_10007256C(v11);
  }
  if ((objc_msgSend(v7, "readIEEEFloat:", &v15) & 1) == 0)
  {
    v12 = (void *)qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_100070328(v12);
  }
  if (v15 == 0.0)
  {
    v13 = (void *)qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_100070294(v13);
  }
  else
  {
    -[GHSWeightScaleDevice healthDataSyncBodyMeasurement:measurementType:unit:startTime:endTime:](self, "healthDataSyncBodyMeasurement:measurementType:unit:startTime:endTime:", HKQuantityTypeIdentifierBodyMassIndex, 0, v8, v8, v15);
  }

  return v10 ^ 1;
}

@end
