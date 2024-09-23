@implementation GHSBloodPressureDevice

- (GHSBloodPressureDevice)initWithProperties:(id)a3 healthStore:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  GHSBloodPressureDevice *v12;
  GHSBloodPressureDevice *v13;
  objc_super v15;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[HKSampleType quantityTypeForIdentifier:](HKSampleType, "quantityTypeForIdentifier:", HKQuantityTypeIdentifierBloodPressureSystolic));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[HKSampleType quantityTypeForIdentifier:](HKSampleType, "quantityTypeForIdentifier:", HKQuantityTypeIdentifierBloodPressureDiastolic));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[HKSampleType quantityTypeForIdentifier:](HKSampleType, "quantityTypeForIdentifier:", HKQuantityTypeIdentifierHeartRate));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", v8, v9, v10, 0));

  v15.receiver = self;
  v15.super_class = (Class)GHSBloodPressureDevice;
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
  int v23;
  uint64_t v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  unsigned int v30;
  __int16 v31;
  int v32;
  __int16 v33;
  unsigned int v34;

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
    v23 = 141559299;
    v24 = 1752392040;
    v25 = 2113;
    v26 = v19;
    v27 = 1024;
    v28 = v12;
    v29 = 1024;
    v30 = a5;
    v31 = 1024;
    v32 = v10;
    v33 = 1024;
    v34 = a7;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Handle live health observation for peripheral \"%{private, mask.hash}@\": classType %u, observationType %u, userId %u, observationId %u", (uint8_t *)&v23, 0x2Eu);

  }
  if (v12 == 7)
  {
    if (a5 == 150020)
    {
      v20 = 1;
      if (-[GHSBloodPressureDevice extractHealthObservationBloodPressureWithStream:timestamp:isLive:](self, "extractHealthObservationBloodPressureWithStream:timestamp:isLive:", v14, v15, 1))
      {
        goto LABEL_18;
      }
    }
  }
  else if (v12 == 5)
  {
    if (a5 == 8410608
      && -[GHSBloodPressureDevice extractHealthObservationBloodPressureStatusWithStream:timestamp:](self, "extractHealthObservationBloodPressureStatusWithStream:timestamp:", v14, v15))
    {
      v20 = 1;
      goto LABEL_18;
    }
  }
  else if (v12 == 1 && a5 == 149546)
  {
    v20 = 1;
    if (-[GHSBloodPressureDevice extractHealthObservationHeartRateWithStream:timestamp:isLive:](self, "extractHealthObservationHeartRateWithStream:timestamp:isLive:", v14, v15, 1))
    {
      goto LABEL_18;
    }
  }
  v21 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
    sub_1000727E8(v21, self);
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
  int v21;
  uint64_t v22;
  __int16 v23;
  void *v24;

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
  if (v10 == 7)
  {
    if (a5 != 150020
      || !-[GHSBloodPressureDevice extractHealthObservationBloodPressureWithStream:timestamp:isLive:](self, "extractHealthObservationBloodPressureWithStream:timestamp:isLive:", v12, v13, 0))
    {
      goto LABEL_11;
    }
LABEL_10:
    v18 = 1;
    goto LABEL_14;
  }
  if (v10 == 1
    && a5 == 149546
    && -[GHSBloodPressureDevice extractHealthObservationHeartRateWithStream:timestamp:isLive:](self, "extractHealthObservationHeartRateWithStream:timestamp:isLive:", v12, v13, 0))
  {
    goto LABEL_10;
  }
LABEL_11:
  v19 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
    sub_10006AA7C(v19, self);
  v18 = 0;
LABEL_14:

  return v18;
}

- (void)healthDataSyncBloodPressuresWithSystolicBP:(double)a3 systolicBPUnit:(id)a4 diastolicBP:(double)a5 diastolicBPUnit:(id)a6 startTime:(id)a7 endTime:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  unsigned __int8 v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
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
  NSObject *v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  id v45;
  _QWORD v46[5];
  void *v47;
  uint8_t buf[4];
  double v49;
  __int16 v50;
  id v51;
  __int16 v52;
  id v53;

  v14 = a4;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[GHSBluetoothDevice debugLoggingEnabled](self, "debugLoggingEnabled"));
  LODWORD(a7) = objc_msgSend(v18, "BOOLValue");

  if ((_DWORD)a7)
  {
    v19 = qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218498;
      v49 = a3;
      v50 = 2112;
      v51 = v14;
      v52 = 2112;
      v53 = v16;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "GHSS HealthDataSync systolicBP=%f, unit=%@, date=%@", buf, 0x20u);
    }
    v20 = qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218498;
      v49 = a5;
      v50 = 2112;
      v51 = v15;
      v52 = 2112;
      v53 = v16;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "GHSS HealthDataSync diastolicBP=%f, unit=%@, date=%@", buf, 0x20u);
    }
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[GHSBluetoothDevice peripheral](self, "peripheral"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "customProperty:", CFSTR("UpdateHealth")));
  v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("1"));

  if ((v23 & 1) != 0)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[HKUnit unitFromString:](HKUnit, "unitFromString:", v14));
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v24, a3));

    v44 = v14;
    v45 = v16;
    v25 = v17;
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[HKQuantityType quantityTypeForIdentifier:](HKQuantityType, "quantityTypeForIdentifier:", HKQuantityTypeIdentifierBloodPressureSystolic));
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[HKUnit unitFromString:](HKUnit, "unitFromString:", v15));
    v27 = objc_claimAutoreleasedReturnValue(+[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v26, a5));

    v43 = v15;
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[HKQuantityType quantityTypeForIdentifier:](HKQuantityType, "quantityTypeForIdentifier:", HKQuantityTypeIdentifierBloodPressureDiastolic));
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[GHSBluetoothDevice hkDevice](self, "hkDevice"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[HKQuantitySample quantitySampleWithType:quantity:startDate:endDate:device:metadata:](HKQuantitySample, "quantitySampleWithType:quantity:startDate:endDate:device:metadata:", v41, v42, v45, v17, v29, 0));

    v31 = (void *)objc_claimAutoreleasedReturnValue(-[GHSBluetoothDevice hkDevice](self, "hkDevice"));
    v32 = (void *)v27;
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[HKQuantitySample quantitySampleWithType:quantity:startDate:endDate:device:metadata:](HKQuantitySample, "quantitySampleWithType:quantity:startDate:endDate:device:metadata:", v28, v27, v45, v25, v31, 0));

    v34 = (void *)objc_claimAutoreleasedReturnValue(+[HKCorrelationType correlationTypeForIdentifier:](HKCorrelationType, "correlationTypeForIdentifier:", HKCorrelationTypeIdentifierBloodPressure));
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", v30, v33, 0));
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[GHSBluetoothDevice hkDevice](self, "hkDevice"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[HKCorrelation correlationWithType:startDate:endDate:objects:device:metadata:](HKCorrelation, "correlationWithType:startDate:endDate:objects:device:metadata:", v34, v45, v25, v35, v36, 0));

    v38 = (void *)objc_claimAutoreleasedReturnValue(-[GHSBluetoothDevice hkStore](self, "hkStore"));
    v47 = v37;
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v47, 1));
    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472;
    v46[2] = sub_100064F24;
    v46[3] = &unk_1000AD3C0;
    v46[4] = self;
    objc_msgSend(v38, "saveObjects:withCompletion:", v39, v46);

    v14 = v44;
    v15 = v43;

    v17 = v25;
    v16 = v45;

  }
  else
  {
    v40 = qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "GHSS HealthDataSync Skipped due to user configuration", buf, 2u);
    }
  }

}

- (void)healthDataSyncHeartRate:(double)a3 unit:(id)a4 startTime:(id)a5 endTime:(id)a6
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
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "GHSS HealthDataSync heartRate=%f, unit=%@, date=%@", buf, 0x20u);
    }
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[GHSBluetoothDevice peripheral](self, "peripheral"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "customProperty:", CFSTR("UpdateHealth")));
  v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("1"));

  if ((v18 & 1) != 0)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[HKQuantityType quantityTypeForIdentifier:](HKQuantityType, "quantityTypeForIdentifier:", HKQuantityTypeIdentifierHeartRate));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[HKUnit unitFromString:](HKUnit, "unitFromString:", v10));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v20, a3));

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[GHSBluetoothDevice hkDevice](self, "hkDevice"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[HKQuantitySample quantitySampleWithType:quantity:startDate:endDate:device:metadata:](HKQuantitySample, "quantitySampleWithType:quantity:startDate:endDate:device:metadata:", v19, v21, v11, v12, v22, 0));

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[GHSBluetoothDevice hkStore](self, "hkStore"));
    v28 = v23;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v28, 1));
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_100065258;
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

- (BOOL)extractHealthObservationBloodPressureWithStream:(id)a3 timestamp:(id)a4 isLive:(BOOL)a5
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  char v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  const __CFString *v56;
  const __CFString *v57;
  uint8_t v58;
  _BYTE v59[15];
  uint8_t v60;
  _BYTE v61[15];
  int v62;
  unsigned __int8 v63;
  __int16 v64;
  int v65;
  unsigned __int16 v66;
  unsigned int v67;
  __int16 v68;
  unsigned int v69;
  unsigned __int8 v70;
  uint8_t buf[4];
  uint64_t v72;
  __int16 v73;
  void *v74;
  __int16 v75;
  int v76;

  v7 = a3;
  v8 = a4;
  v70 = 0;
  if (objc_msgSend(v7, "readUint8:", &v70))
  {
    v9 = (void *)qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
    {
      v10 = v9;
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[GHSBluetoothDevice peripheral](self, "peripheral"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "name"));
      *(_DWORD *)buf = 141558531;
      v72 = 1752392040;
      v73 = 2113;
      v74 = v12;
      v75 = 1024;
      v76 = v70;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Compound observation for peripheral \"%{private, mask.hash}@\": numOfObservations %u", buf, 0x1Cu);

    }
  }
  v69 = 0;
  v68 = 0;
  v67 = 0;
  v66 = 0;
  v65 = 0;
  v64 = 0;
  v63 = 0;
  if (!v70)
  {
    v14 = 1;
    goto LABEL_51;
  }
  v56 = 0;
  v13 = 0;
  v57 = 0;
  v14 = 1;
  do
  {
    v62 = -1;
    if (objc_msgSend(v7, "readUint32:", &v62))
    {
      v15 = (void *)qword_1000C9178;
      if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
      {
        v16 = v15;
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[GHSBluetoothDevice peripheral](self, "peripheral"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "name"));
        *(_DWORD *)buf = 141558531;
        v72 = 1752392040;
        v73 = 2113;
        v74 = v18;
        v75 = 1024;
        v76 = v62;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Compound observation for peripheral \"%{private, mask.hash}@\": observationType %d", buf, 0x1Cu);

      }
    }
    v19 = objc_msgSend(v7, "readUint8:", &v63);
    v20 = qword_1000C9178;
    if (v19 && v63 == 1)
    {
      if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
      {
        v21 = v20;
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[GHSBluetoothDevice peripheral](self, "peripheral"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "name"));
        *(_DWORD *)buf = 141558531;
        v72 = 1752392040;
        v73 = 2113;
        v74 = v23;
        v75 = 1024;
        v76 = v63;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Compound observation for peripheral \"%{private, mask.hash}@\": observationClassType %d", buf, 0x1Cu);

      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
        sub_10007295C(&v60, v61, v20);
      v14 = 0;
    }
    switch(v62)
    {
      case 150023:
        if ((objc_msgSend(v7, "readUint16:", &v64) & 1) == 0)
        {
          v30 = (void *)qword_1000C9178;
          if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
          {
            v42 = v30;
            v43 = (void *)objc_claimAutoreleasedReturnValue(-[GHSBluetoothDevice peripheral](self, "peripheral"));
            v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "name"));
            *(_DWORD *)buf = 141558275;
            v72 = 1752392040;
            v73 = 2113;
            v74 = v44;
            _os_log_error_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "Compound observation for peripheral \"%{private, mask.hash}@\": unit parse failed", buf, 0x16u);

          }
        }
        if ((objc_msgSend(v7, "readUint32:", &v65) & 1) == 0)
        {
          v31 = (void *)qword_1000C9178;
          if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
          {
            v32 = v31;
            v33 = (void *)objc_claimAutoreleasedReturnValue(-[GHSBluetoothDevice peripheral](self, "peripheral"));
            v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "name"));
            *(_DWORD *)buf = 141558275;
            v72 = 1752392040;
            v73 = 2113;
            v74 = v34;
            _os_log_error_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "Compound observation for peripheral \"%{private, mask.hash}@\" value parse failed", buf, 0x16u);

          }
        }
        goto LABEL_46;
      case 150022:
        if (objc_msgSend(v7, "readUint16:", &v66))
        {
          v27 = CFSTR("mmHg");
          if (v66 == 3872)
            goto LABEL_33;
          v28 = (void *)qword_1000C9178;
          if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
          {
            v48 = v28;
            v49 = (void *)objc_claimAutoreleasedReturnValue(-[GHSBluetoothDevice peripheral](self, "peripheral"));
            v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "name"));
            *(_DWORD *)buf = 141558531;
            v72 = 1752392040;
            v73 = 2113;
            v74 = v50;
            v75 = 1024;
            v76 = v66;
            _os_log_error_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "Compound observation for peripheral \"%{private, mask.hash}@\": diastolicBP invalid Unit %d", buf, 0x1Cu);

          }
        }
        v27 = v56;
LABEL_33:
        if ((objc_msgSend(v7, "readUint32:", &v67) & 1) == 0)
        {
          v29 = (void *)qword_1000C9178;
          if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
          {
            v39 = v29;
            v40 = (void *)objc_claimAutoreleasedReturnValue(-[GHSBluetoothDevice peripheral](self, "peripheral"));
            v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "name"));
            *(_DWORD *)buf = 141558275;
            v72 = 1752392040;
            v73 = 2113;
            v74 = v41;
            _os_log_error_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "Compound observation for peripheral \"%{private, mask.hash}@\" diastolicBP parse failed", buf, 0x16u);

          }
        }
        v56 = v27;
        goto LABEL_46;
      case 150021:
        if (objc_msgSend(v7, "readUint16:", &v68))
        {
          v24 = CFSTR("mmHg");
          if (v68 == 3872)
            goto LABEL_24;
          v25 = (void *)qword_1000C9178;
          if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
          {
            v45 = v25;
            v46 = (void *)objc_claimAutoreleasedReturnValue(-[GHSBluetoothDevice peripheral](self, "peripheral"));
            v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "name"));
            *(_DWORD *)buf = 141558531;
            v72 = 1752392040;
            v73 = 2113;
            v74 = v47;
            v75 = 1024;
            v76 = v66;
            _os_log_error_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "Compound observation for peripheral \"%{private, mask.hash}@\": systolicBP invalid Unit %d", buf, 0x1Cu);

          }
        }
        v24 = v57;
LABEL_24:
        if ((objc_msgSend(v7, "readUint32:", &v69) & 1) == 0)
        {
          v26 = (void *)qword_1000C9178;
          if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
          {
            v36 = v26;
            v37 = (void *)objc_claimAutoreleasedReturnValue(-[GHSBluetoothDevice peripheral](self, "peripheral"));
            v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "name"));
            *(_DWORD *)buf = 141558275;
            v72 = 1752392040;
            v73 = 2113;
            v74 = v38;
            _os_log_error_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "Compound observation for peripheral \"%{private, mask.hash}@\" systolicBP parse failed", buf, 0x16u);

          }
        }
        v57 = v24;
        goto LABEL_46;
    }
    v35 = qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_10007292C(&v58, v59, v35);
    v14 = 0;
LABEL_46:
    ++v13;
  }
  while (v13 < v70);
  if (v69 && v67)
  {
    -[GHSBloodPressureDevice healthDataSyncBloodPressuresWithSystolicBP:systolicBPUnit:diastolicBP:diastolicBPUnit:startTime:endTime:](self, "healthDataSyncBloodPressuresWithSystolicBP:systolicBPUnit:diastolicBP:diastolicBPUnit:startTime:endTime:", v57, v56, v8, v8, (double)v69, (double)v67);
    goto LABEL_53;
  }
LABEL_51:
  v51 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    v52 = v51;
    v53 = (void *)objc_claimAutoreleasedReturnValue(-[GHSBluetoothDevice peripheral](self, "peripheral"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "name"));
    *(_DWORD *)buf = 141558275;
    v72 = 1752392040;
    v73 = 2113;
    v74 = v54;
    _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "Peripheral \"%{private, mask.hash}@\" observation value not saved due to invalid value", buf, 0x16u);

  }
LABEL_53:

  return v14 & 1;
}

- (BOOL)extractHealthObservationBloodPressureStatusWithStream:(id)a3 timestamp:(id)a4
{
  id v5;
  __int128 v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  __int128 v21;
  int v22;
  int v23;
  unsigned __int8 v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  int v30;

  v5 = a3;
  v24 = 0;
  if (objc_msgSend(v5, "readUint8:", &v24))
  {
    v7 = (void *)qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
    {
      v8 = v7;
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[GHSBluetoothDevice peripheral](self, "peripheral"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "name"));
      *(_DWORD *)buf = 141558531;
      v26 = 1752392040;
      v27 = 2113;
      v28 = v10;
      v29 = 1024;
      v30 = v24;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Status for peripheral \"%{private, mask.hash}@\": numOfObservations %u", buf, 0x1Cu);

    }
  }
  v22 = 0;
  v23 = 0;
  if (v24)
  {
    v11 = 0;
    *(_QWORD *)&v6 = 141558531;
    v21 = v6;
    do
    {
      if (objc_msgSend(v5, "readUint32:", &v23, v21))
      {
        v12 = (void *)qword_1000C9178;
        if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
        {
          v13 = v12;
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[GHSBluetoothDevice peripheral](self, "peripheral"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "name"));
          *(_DWORD *)buf = v21;
          v26 = 1752392040;
          v27 = 2113;
          v28 = v15;
          v29 = 1024;
          v30 = v23;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Status for peripheral \"%{private, mask.hash}@\": %d", buf, 0x1Cu);

        }
      }
      if (objc_msgSend(v5, "readUint32:", &v22))
      {
        v16 = (void *)qword_1000C9178;
        if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
        {
          v17 = v16;
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[GHSBluetoothDevice peripheral](self, "peripheral"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "name"));
          *(_DWORD *)buf = v21;
          v26 = 1752392040;
          v27 = 2113;
          v28 = v19;
          v29 = 1024;
          v30 = v22;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Status for peripheral \"%{private, mask.hash}@\": %d", buf, 0x1Cu);

        }
      }
      ++v11;
    }
    while (v11 < v24);
  }

  return 1;
}

- (BOOL)extractHealthObservationHeartRateWithStream:(id)a3 timestamp:(id)a4 isLive:(BOOL)a5
{
  id v7;
  id v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v17;
  unsigned __int16 v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  void *v22;

  v7 = a3;
  v8 = a4;
  v18 = 0;
  v17 = 0;
  if (!objc_msgSend(v7, "readUint16:", &v18))
  {
LABEL_6:
    v9 = 0;
    goto LABEL_7;
  }
  if (v18 != 2720)
  {
    v10 = (void *)qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_100072A24(v10, self, &v18);
    goto LABEL_6;
  }
  v9 = CFSTR("bpm");
LABEL_7:
  if ((objc_msgSend(v7, "readUint32:", &v17) & 1) == 0)
  {
    v11 = (void *)qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
    {
      v12 = v11;
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[GHSBluetoothDevice peripheral](self, "peripheral"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "name"));
      *(_DWORD *)buf = 141558275;
      v20 = 1752392040;
      v21 = 2113;
      v22 = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Observation value for peripheral \"%{private, mask.hash}@\": parse failed", buf, 0x16u);

    }
  }
  if (v17)
  {
    -[GHSBloodPressureDevice healthDataSyncHeartRate:unit:startTime:endTime:](self, "healthDataSyncHeartRate:unit:startTime:endTime:", v9, v8, v8, (double)v17);
  }
  else
  {
    v15 = (void *)qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_10007298C(v15, self);
  }

  return 1;
}

@end
