@implementation HRMService

+ (id)UUID
{
  return +[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CBUUIDHeartRateServiceString);
}

- (HRMService)initWithManager:(id)a3 peripheral:(id)a4 service:(id)a5
{
  HRMService *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HRMService;
  v5 = -[FitnessService initWithManager:peripheral:service:](&v8, "initWithManager:peripheral:service:", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](v5, "peripheral"));
  -[HRMService set_isFitnessClassicDevice:](v5, "set_isFitnessClassicDevice:", objc_msgSend(v6, "hasTag:", CFSTR("FitnessClassic")));

  -[HRMService refreshUpdateHealthEnabledStatus](v5, "refreshUpdateHealthEnabledStatus");
  return v5;
}

- (id)alwaysCollectQuantityTypes
{
  return -[HRMService _alwaysCollectQuantityTypes](self, "_alwaysCollectQuantityTypes");
}

- (BOOL)isFitnessClassicDevice
{
  return -[HRMService _isFitnessClassicDevice](self, "_isFitnessClassicDevice");
}

- (void)refreshUpdateHealthEnabledStatus
{
  void *v3;
  void *v4;
  NSArray *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "customProperty:", CFSTR("UpdateHealth")));
  -[HRMService set_updateHealthEnabled:](self, "set_updateHealthEnabled:", objc_msgSend(v4, "isEqualToString:", CFSTR("1")));

  v5 = objc_opt_new(NSArray);
  -[HRMService set_alwaysCollectQuantityTypes:](self, "set_alwaysCollectQuantityTypes:", v5);

}

- (void)start
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;
  _QWORD v10[2];

  v9.receiver = self;
  v9.super_class = (Class)HRMService;
  -[FitnessService start](&v9, "start");
  if (_os_feature_enabled_impl("Health", "pulse"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[FitnessService hkQuantityTypeForIdentifier:](FitnessService, "hkQuantityTypeForIdentifier:", HKQuantityTypeIdentifierHeartRate));
    -[HRMService setHkQuantityType:](self, "setHkQuantityType:", v3);

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CBUUIDHeartRateMeasurementCharacteristicString));
    v10[0] = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CBUUIDBodySensorLocationCharacteristicString));
    v10[1] = v5;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v10, 2));

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService service](self, "service"));
    objc_msgSend(v7, "discoverCharacteristics:forService:", v6, v8);

  }
}

- (BOOL)supportsHKQuantityType:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HRMService hkQuantityType](self, "hkQuantityType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
  v7 = objc_msgSend(v4, "isEqualToString:", v6);

  return v7;
}

- (void)collectData:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  const __CFString *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  int v13;
  const __CFString *v14;
  __int16 v15;
  void *v16;

  v3 = a3;
  v5 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    if (v3)
      v6 = CFSTR("ON");
    else
      v6 = CFSTR("OFF");
    v7 = v5;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "name"));
    v13 = 138412546;
    v14 = v6;
    v15 = 2112;
    v16 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "collectData:%@ for “%@”", (uint8_t *)&v13, 0x16u);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[HRMService heartRateMeasurementCharacteristic](self, "heartRateMeasurementCharacteristic"));
  v11 = objc_msgSend(v10, "isNotifying");

  if (v11 != v3)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[HRMService heartRateMeasurementCharacteristic](self, "heartRateMeasurementCharacteristic"));
    -[FitnessService setNotify:forCharacteristic:](self, "setNotify:forCharacteristic:", v3, v12);

  }
}

- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned int v21;
  void *v22;
  void *v23;
  void *v24;
  unsigned int v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  NSObject *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  id v45;
  id v46;
  uint64_t v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];

  v46 = a3;
  v8 = a4;
  v9 = a5;
  if (v9)
  {
    v10 = (void *)qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_10006E4A4(v10, v8, v9);
    goto LABEL_27;
  }
  v45 = v8;
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "characteristics"));
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v49;
    v15 = CBUUIDHeartRateMeasurementCharacteristicString;
    v47 = CBUUIDBodySensorLocationCharacteristicString;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v49 != v14)
          objc_enumerationMutation(v11);
        v17 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * (_QWORD)i);
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[HRMService heartRateMeasurementCharacteristic](self, "heartRateMeasurementCharacteristic"));
        if (v18)
        {

        }
        else
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "UUID"));
          v20 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", v15));
          v21 = objc_msgSend(v19, "isEqual:", v20);

          if (v21)
          {
            -[HRMService setHeartRateMeasurementCharacteristic:](self, "setHeartRateMeasurementCharacteristic:", v17);
            continue;
          }
        }
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[HRMService bodySensorLocationCharacteristic](self, "bodySensorLocationCharacteristic"));
        if (v22)
        {

        }
        else
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "UUID"));
          v24 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", v47));
          v25 = objc_msgSend(v23, "isEqual:", v24);

          if (v25)
          {
            -[HRMService setBodySensorLocationCharacteristic:](self, "setBodySensorLocationCharacteristic:", v17);
            if ((objc_msgSend(v17, "properties") & 2) != 0)
              objc_msgSend(v46, "readValueForCharacteristic:", v17);
          }
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
    }
    while (v13);
  }

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[HRMService heartRateMeasurementCharacteristic](self, "heartRateMeasurementCharacteristic"));
  if (!v26)
  {
    v27 = qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_10006E474(v27, v28, v29, v30, v31, v32, v33, v34);
  }
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[HRMService bodySensorLocationCharacteristic](self, "bodySensorLocationCharacteristic"));

  if (!v35)
  {
    v36 = qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_10006E444(v36, v37, v38, v39, v40, v41, v42, v43);
  }
  -[ClientService notifyDidStart](self, "notifyDidStart");
  v44 = (void *)objc_claimAutoreleasedReturnValue(+[FitnessDeviceManager instance](FitnessDeviceManager, "instance"));
  objc_msgSend(v44, "registerFitnessService:", self);

  v9 = 0;
  v8 = v45;
LABEL_27:

}

- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v10)
  {
    v12 = (id)objc_claimAutoreleasedReturnValue(-[HRMService heartRateMeasurementCharacteristic](self, "heartRateMeasurementCharacteristic"));
    if (v12 == v9)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[HRMService heartRateMeasurementCharacteristic](self, "heartRateMeasurementCharacteristic"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "value"));

      if (v15)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[HRMService heartRateMeasurementCharacteristic](self, "heartRateMeasurementCharacteristic"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "value"));
        -[HRMService didUpdateHeartRateMeasurement:](self, "didUpdateHeartRateMeasurement:", v17);
        goto LABEL_12;
      }
    }
    else
    {

    }
    v13 = (id)objc_claimAutoreleasedReturnValue(-[HRMService bodySensorLocationCharacteristic](self, "bodySensorLocationCharacteristic"));
    if (v13 != v9)
    {

      goto LABEL_13;
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[HRMService bodySensorLocationCharacteristic](self, "bodySensorLocationCharacteristic"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "value"));

    if (!v19)
      goto LABEL_13;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[HRMService bodySensorLocationCharacteristic](self, "bodySensorLocationCharacteristic"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "value"));
    -[HRMService didUpdateBodySensorLocation:](self, "didUpdateBodySensorLocation:", v17);
LABEL_12:

    goto LABEL_13;
  }
  v11 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
    sub_10006E554(v11, v9, v10);
LABEL_13:

}

- (void)peripheral:(id)a3 didUpdateNotificationStateForCharacteristic:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (v9)
  {
    v10 = (void *)qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_10006E604(v10, v8, v9);
  }

}

- (void)didUpdateHeartRateMeasurement:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  unint64_t v8;
  double v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint8_t v13[12];
  unsigned __int16 v14;
  char v15;

  v4 = a3;
  if ((unint64_t)objc_msgSend(v4, "length") > 1)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
    v15 = 0;
    objc_msgSend(v4, "getBytes:length:", &v15, 1);
    v14 = 0;
    if ((v15 & 1) != 0)
      objc_msgSend(v4, "getBytes:range:", &v14, 1, 2);
    else
      v14 = *((unsigned __int8 *)objc_msgSend(objc_retainAutorelease(v4), "bytes") + 1);
    v7 = qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
      sub_10006E748(&v14, v7);
    if (v14)
    {
      if (-[HRMService _updateHealthEnabled](self, "_updateHealthEnabled"))
      {
        LOWORD(v8) = v14;
        v9 = (double)v8;
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[HRMService hkQuantityType](self, "hkQuantityType"));
        -[FitnessService recordDatum:start:end:quantityType:](self, "recordDatum:start:end:quantityType:", v6, v6, v10, v9);

        v11 = (void *)objc_claimAutoreleasedReturnValue(-[HRMService hkQuantityType](self, "hkQuantityType"));
        -[FitnessService storeDatumsForQuantityType:](self, "storeDatumsForQuantityType:", v11);

      }
    }
    else
    {
      v12 = qword_1000C9178;
      if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Ignoring invalid HR value", v13, 2u);
      }
    }

  }
  else
  {
    v5 = (void *)qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_10006E6B4(v5, v4);
  }

}

- (void)didUpdateBodySensorLocation:(id)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;

  v4 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "debugDescription"));
    v7 = 138412290;
    v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "HRM Service: Updated body sensor location: %@", (uint8_t *)&v7, 0xCu);

  }
}

- (CBCharacteristic)heartRateMeasurementCharacteristic
{
  return self->_heartRateMeasurementCharacteristic;
}

- (void)setHeartRateMeasurementCharacteristic:(id)a3
{
  objc_storeStrong((id *)&self->_heartRateMeasurementCharacteristic, a3);
}

- (CBCharacteristic)bodySensorLocationCharacteristic
{
  return self->_bodySensorLocationCharacteristic;
}

- (void)setBodySensorLocationCharacteristic:(id)a3
{
  objc_storeStrong((id *)&self->_bodySensorLocationCharacteristic, a3);
}

- (HKQuantityType)hkQuantityType
{
  return self->_hkQuantityType;
}

- (void)setHkQuantityType:(id)a3
{
  objc_storeStrong((id *)&self->_hkQuantityType, a3);
}

- (NSArray)_alwaysCollectQuantityTypes
{
  return self->__alwaysCollectQuantityTypes;
}

- (void)set_alwaysCollectQuantityTypes:(id)a3
{
  objc_storeStrong((id *)&self->__alwaysCollectQuantityTypes, a3);
}

- (BOOL)_updateHealthEnabled
{
  return self->__updateHealthEnabled;
}

- (void)set_updateHealthEnabled:(BOOL)a3
{
  self->__updateHealthEnabled = a3;
}

- (BOOL)_isFitnessClassicDevice
{
  return self->__isFitnessClassicDevice;
}

- (void)set_isFitnessClassicDevice:(BOOL)a3
{
  self->__isFitnessClassicDevice = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__alwaysCollectQuantityTypes, 0);
  objc_storeStrong((id *)&self->_hkQuantityType, 0);
  objc_storeStrong((id *)&self->_bodySensorLocationCharacteristic, 0);
  objc_storeStrong((id *)&self->_heartRateMeasurementCharacteristic, 0);
}

@end
