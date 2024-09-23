@implementation CyclingSpeedAndCadenceService

+ (id)UUID
{
  return +[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CBUUIDCyclingSpeedAndCadenceServiceString);
}

- (void)readWheelSize
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "customProperty:", CFSTR("wheelCircumferenceMM")));

  if (v4)
  {
    v5 = objc_alloc_init((Class)NSNumberFormatter);
    objc_msgSend(v5, "setNumberStyle:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "numberFromString:", v4));
    v7 = v6;
    if (v6)
    {
      self->_wheelDiameterInInches = (double)(int)objc_msgSend(v6, "intValue") * 0.0125318853;
    }
    else
    {
      v8 = (void *)qword_1000C9178;
      if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
        sub_100072AFC(v8, self, (uint64_t)v4);
    }

  }
}

- (BOOL)sendDuplicateReadingsAsZero
{
  return 1;
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
  _QWORD v10[3];

  v9.receiver = self;
  v9.super_class = (Class)CyclingSpeedAndCadenceService;
  -[FitnessService start](&v9, "start");
  *(_QWORD *)&self->_lastMeasurement.cumulative_wheel_revolution = 0;
  self->_lastMeasurement.cycling_last_crank_event_time = 0;
  self->_sendZeroForDuplicates = 1;
  self->_wheelDiameterInInches = 26.3796185;
  -[CyclingSpeedAndCadenceService readWheelSize](self, "readWheelSize");
  -[CyclingSpeedAndCadenceService updateZeroDuplicateValues](self, "updateZeroDuplicateValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("0x2A5C")));
  v10[0] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("0x2A5D")));
  v10[1] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("0x2A5B")));
  v10[2] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v10, 3));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService service](self, "service"));
  objc_msgSend(v7, "discoverCharacteristics:forService:", v6, v8);

}

- (BOOL)supportsHKQuantityType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  int *v8;
  BOOL v9;
  void *v11;
  unsigned int v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
  if (objc_msgSend(v5, "isEqualToString:", HKQuantityTypeIdentifierCyclingSpeed))
  {

LABEL_4:
    v8 = &OBJC_IVAR___CyclingSpeedAndCadenceService__wheelRevolutionDataSupported;
    goto LABEL_5;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
  v7 = objc_msgSend(v6, "isEqualToString:", HKQuantityTypeIdentifierDistanceCycling);

  if ((v7 & 1) != 0)
    goto LABEL_4;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
  v12 = objc_msgSend(v11, "isEqualToString:", HKQuantityTypeIdentifierCyclingCadence);

  if (!v12)
  {
    v9 = 0;
    goto LABEL_6;
  }
  v8 = &OBJC_IVAR___CyclingSpeedAndCadenceService__crankRevolutionDataSupported;
LABEL_5:
  v9 = *((_BYTE *)&self->super.super.super.isa + *v8) != 0;
LABEL_6:

  return v9;
}

- (void)updateZeroDuplicateValues
{
  -[CyclingSpeedAndCadenceService setSendZeroForDuplicates:](self, "setSendZeroForDuplicates:", 1);
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
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CyclingSpeedAndCadenceService;
  -[FitnessService receiveDeviceInfoUpdateNotification:](&v17, "receiveDeviceInfoUpdateNotification:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "UUIDString"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  NSLog(CFSTR("RECEIVE DEVICE INFO UPDATE NOTIFICATION - name:%@ device UUID:%@ notification userinfo:%@"), v5, v8, v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
  if ((objc_msgSend(v10, "isEqualToString:", CFSTR("DeviceInformationUpdate")) & 1) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "UUIDString"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "valueForKey:", CFSTR("UUID")));
    v16 = objc_msgSend(v13, "isEqualToString:", v15);

    if (v16)
      -[CyclingSpeedAndCadenceService updateZeroDuplicateValues](self, "updateZeroDuplicateValues");
  }
  else
  {

  }
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
  void *v11;
  int v12;
  const __CFString *v13;
  __int16 v14;
  void *v15;

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
    v12 = 138412546;
    v13 = v6;
    v14 = 2112;
    v15 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "collectData:%@ for “%@”", (uint8_t *)&v12, 0x16u);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CyclingSpeedAndCadenceService csMeasurementCharacteristic](self, "csMeasurementCharacteristic"));
  -[FitnessService setNotify:forCharacteristic:](self, "setNotify:forCharacteristic:", v3, v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CyclingSpeedAndCadenceService csControlPointCharacteristic](self, "csControlPointCharacteristic"));
  -[FitnessService setNotify:forCharacteristic:](self, "setNotify:forCharacteristic:", v3, v11);

}

- (void)updatedCadenceMeasurementValue:(id *)a3 at:(id)a4
{
  id v6;
  void *v7;
  $E565BE7FF4DBC4B8C15830BDD601C5D9 *p_lastMeasurement;
  void *v9;
  int var4;
  int cycling_last_crank_event_time;
  BOOL v12;
  int v13;
  int v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  int var3;
  int v25;
  int cycling_crank_revolution;
  int v27;
  int v28;
  void *v29;
  __int16 v30;
  double v31;
  __int16 v32;
  int v33;
  __int16 v34;
  int v35;
  __int16 v36;
  int v37;
  __int16 v38;
  int v39;

  v6 = a4;
  v7 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
    sub_100072D00(v7, self);
  p_lastMeasurement = &self->_lastMeasurement;
  if (self->_lastMeasurement.cycling_crank_revolution || self->_lastMeasurement.cycling_last_crank_event_time)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[FitnessService hkQuantityTypeForIdentifier:](FitnessService, "hkQuantityTypeForIdentifier:", HKQuantityTypeIdentifierCyclingCadence));
    if (v9)
    {
      if (-[FitnessService isCollectingHKQuantityType:](self, "isCollectingHKQuantityType:", v9))
      {
        var4 = a3->var4;
        cycling_last_crank_event_time = self->_lastMeasurement.cycling_last_crank_event_time;
        v12 = __OFSUB__(var4, cycling_last_crank_event_time);
        v13 = var4 - cycling_last_crank_event_time;
        if (v13 < 0 != v12)
          v13 += 0x10000;
        if (v13)
        {
          v14 = a3->var3 - self->_lastMeasurement.cycling_crank_revolution;
          if (v14 >= 1)
          {
            v15 = (double)v13 * 0.0009765625;
            v16 = (double)v14 * 60.0 / v15;
            if (v16 < 0.0 || v16 >= 500.0)
            {
              v20 = (void *)qword_1000C9178;
              if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
              {
                v21 = v20;
                v22 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
                v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "name"));
                var3 = a3->var3;
                v25 = a3->var4;
                cycling_crank_revolution = p_lastMeasurement->cycling_crank_revolution;
                v27 = p_lastMeasurement->cycling_last_crank_event_time;
                v28 = 138413570;
                v29 = v23;
                v30 = 2048;
                v31 = v16;
                v32 = 1024;
                v33 = var3;
                v34 = 1024;
                v35 = v25;
                v36 = 1024;
                v37 = cycling_crank_revolution;
                v38 = 1024;
                v39 = v27;
                _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "“%@” Invalid cadence detected:%f rpm rev count=0x%04X timestamp=0x%04X previous rev count=0x%04X timestamp=0x%04X", (uint8_t *)&v28, 0x2Eu);

              }
            }
            else
            {
              v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", v6, -v15));
              -[FitnessService recordDatum:start:end:quantityType:](self, "recordDatum:start:end:quantityType:", v17, v6, v9, v16);
              -[FitnessService storeDatumsForQuantityType:](self, "storeDatumsForQuantityType:", v9);

            }
          }
        }
        else if (self->fCurrentDataIsDuplicate
               && -[CyclingSpeedAndCadenceService sendDuplicateReadingsAsZero](self, "sendDuplicateReadingsAsZero"))
        {
          -[FitnessService recordDatum:start:end:quantityType:](self, "recordDatum:start:end:quantityType:", v6, v6, v9, 0.0);
          -[FitnessService storeDatumsForQuantityType:](self, "storeDatumsForQuantityType:", v9);
        }
      }
      else
      {
        v19 = (void *)qword_1000C9178;
        if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
          sub_100072C6C(v19);
      }
    }
    else
    {
      v18 = (void *)qword_1000C9178;
      if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
        sub_100072BD8(v18);
    }

  }
  *(_DWORD *)&p_lastMeasurement->cycling_crank_revolution = *(_DWORD *)&a3->var3;

}

- (void)updatedSpeedMeasurementValue:(id *)a3 at:(id)a4
{
  id v6;
  void *v7;
  $E565BE7FF4DBC4B8C15830BDD601C5D9 *p_lastMeasurement;
  uint64_t v9;
  uint64_t v10;
  int var2;
  int cycling_last_wheel_event_time;
  BOOL v13;
  int v14;
  double v15;
  double v16;
  double v17;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  unsigned int var1;
  int v24;
  unsigned int cumulative_wheel_revolution;
  int v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  __int16 v31;
  double v32;
  __int16 v33;
  unsigned int v34;
  __int16 v35;
  int v36;
  __int16 v37;
  unsigned int v38;
  __int16 v39;
  int v40;

  v6 = a4;
  v7 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
    sub_100072E40(v7, self);
  p_lastMeasurement = &self->_lastMeasurement;
  if (self->_lastMeasurement.cumulative_wheel_revolution || self->_lastMeasurement.cycling_last_wheel_event_time)
  {
    v9 = objc_claimAutoreleasedReturnValue(+[FitnessService hkQuantityTypeForIdentifier:](FitnessService, "hkQuantityTypeForIdentifier:", HKQuantityTypeIdentifierCyclingSpeed));
    v10 = objc_claimAutoreleasedReturnValue(+[FitnessService hkQuantityTypeForIdentifier:](FitnessService, "hkQuantityTypeForIdentifier:", HKQuantityTypeIdentifierDistanceCycling));
    if (v9 | v10)
    {
      var2 = a3->var2;
      cycling_last_wheel_event_time = self->_lastMeasurement.cycling_last_wheel_event_time;
      v13 = __OFSUB__(var2, cycling_last_wheel_event_time);
      v14 = var2 - cycling_last_wheel_event_time;
      if (v14 < 0 != v13)
        v14 += 0x10000;
      if (v14)
      {
        v15 = (double)v14 * 0.0009765625;
        v16 = self->_wheelDiameterInInches
            * ((double)(a3->var1 - self->_lastMeasurement.cumulative_wheel_revolution)
             * 3.14159265);
        v17 = v16 / v15 * 0.0568181818;
        if (v17 >= 0.0 && v17 < 200.0)
        {
          v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", v6, -v15));
          if (v9 && -[FitnessService isCollectingHKQuantityType:](self, "isCollectingHKQuantityType:", v9))
          {
            -[FitnessService recordDatum:start:end:quantityType:](self, "recordDatum:start:end:quantityType:", v28, v6, v9, v17);
            -[FitnessService storeDatumsForQuantityType:](self, "storeDatumsForQuantityType:", v9);
          }
          if (v10 && -[FitnessService isCollectingHKQuantityType:](self, "isCollectingHKQuantityType:", v10))
          {
            -[FitnessService recordDatum:start:end:quantityType:](self, "recordDatum:start:end:quantityType:", v28, v6, v10, v16 * 0.0254);
            -[FitnessService storeDatumsForQuantityType:](self, "storeDatumsForQuantityType:", v10);
          }

        }
        else
        {
          v19 = (void *)qword_1000C9178;
          if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
          {
            v20 = v19;
            v21 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "name"));
            var1 = a3->var1;
            v24 = a3->var2;
            cumulative_wheel_revolution = p_lastMeasurement->cumulative_wheel_revolution;
            v26 = p_lastMeasurement->cycling_last_wheel_event_time;
            v29 = 138413570;
            v30 = v22;
            v31 = 2048;
            v32 = v17;
            v33 = 1024;
            v34 = var1;
            v35 = 1024;
            v36 = v24;
            v37 = 1024;
            v38 = cumulative_wheel_revolution;
            v39 = 1024;
            v40 = v26;
            _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "“%@” Invalid speed detected:%f rpm rev count=0x%08X timestamp=0x%04X previous rev count=0x%08X timestamp=0x%04X", (uint8_t *)&v29, 0x2Eu);

          }
        }
      }
      else if (self->fCurrentDataIsDuplicate
             && -[CyclingSpeedAndCadenceService sendDuplicateReadingsAsZero](self, "sendDuplicateReadingsAsZero"))
      {
        if (-[FitnessService isCollectingHKQuantityType:](self, "isCollectingHKQuantityType:", v9))
        {
          -[FitnessService recordDatum:start:end:quantityType:](self, "recordDatum:start:end:quantityType:", v6, v6, v9, 0.0);
          -[FitnessService storeDatumsForQuantityType:](self, "storeDatumsForQuantityType:", v9);
        }
        if (v10 && -[FitnessService isCollectingHKQuantityType:](self, "isCollectingHKQuantityType:", v10))
        {
          -[FitnessService recordDatum:start:end:quantityType:](self, "recordDatum:start:end:quantityType:", v6, v6, v10, 0.0);
          -[FitnessService storeDatumsForQuantityType:](self, "storeDatumsForQuantityType:", v10);
        }
      }
    }
    else
    {
      v27 = (void *)qword_1000C9178;
      if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
        sub_100072DAC(v27);
    }

  }
  p_lastMeasurement->cumulative_wheel_revolution = a3->var1;
  p_lastMeasurement->cycling_last_wheel_event_time = a3->var2;

}

- (void)updatedMeasurementCharacteristicValue:(id)a3 at:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  unint64_t v8;
  char v9;
  BOOL *p_fCurrentDataIsDuplicate;
  char v11;
  void *v12;
  void *v13;
  char *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  char v18;
  void *v19;
  void *v20;
  char *v21;
  void *v22;
  void *v23;
  _BOOL4 v24;
  NSDate *firstDuplicateEventTimeStamp;
  NSDate *v26;
  double v27;
  _BOOL4 v28;
  void *v29;
  uint64_t v30;
  const __CFString *v31;
  const __CFString *v32;
  void *v33;
  void *v34;
  _BOOL4 v35;
  unsigned int v36;
  uint64_t v37;
  const __CFString *v38;
  const __CFString *v39;
  void *v40;
  NSObject *log;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  const __CFString *v48;
  __int16 v49;
  const __CFString *v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  _BOOL4 v54;
  __int16 v55;
  unsigned int v56;
  __int16 v57;
  uint64_t v58;
  __int16 v59;
  _BOOL4 v60;

  v5 = a4;
  v43 = 0;
  v44 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CyclingSpeedAndCadenceService csMeasurementCharacteristic](self, "csMeasurementCharacteristic"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "value"));
  v8 = -[FitnessService readBytesFromNSData:into:startingAt:length:info:](self, "readBytesFromNSData:into:startingAt:length:info:", v7, &v43, 0, 1, CFSTR("CSCM - flags"));

  v9 = v43;
  if ((v43 & 1) != 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CyclingSpeedAndCadenceService csMeasurementCharacteristic](self, "csMeasurementCharacteristic"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "value"));
    v14 = (char *)-[FitnessService readBytesFromNSData:into:startingAt:length:info:](self, "readBytesFromNSData:into:startingAt:length:info:", v13, (char *)&v43 + 4, v8, 4, CFSTR("CSCM - wheel revs"))+ v8;

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CyclingSpeedAndCadenceService csMeasurementCharacteristic](self, "csMeasurementCharacteristic"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "value"));
    v17 = -[FitnessService readBytesFromNSData:into:startingAt:length:info:](self, "readBytesFromNSData:into:startingAt:length:info:", v16, &v44, v14, 2, CFSTR("CSCM - wheel event time"));

    if ((v43 & 2) == 0)
    {
      p_fCurrentDataIsDuplicate = &self->fCurrentDataIsDuplicate;
      v18 = 1;
      self->fCurrentDataIsDuplicate = 1;
      goto LABEL_9;
    }
    v8 = (unint64_t)&v14[v17];
  }
  else if ((v43 & 2) == 0)
  {
    p_fCurrentDataIsDuplicate = &self->fCurrentDataIsDuplicate;
    v11 = 1;
    self->fCurrentDataIsDuplicate = 1;
    goto LABEL_20;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CyclingSpeedAndCadenceService csMeasurementCharacteristic](self, "csMeasurementCharacteristic"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "value"));
  v21 = (char *)-[FitnessService readBytesFromNSData:into:startingAt:length:info:](self, "readBytesFromNSData:into:startingAt:length:info:", v20, (char *)&v44 + 2, v8, 2, CFSTR("CSCM - crank revs"))+ v8;

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CyclingSpeedAndCadenceService csMeasurementCharacteristic](self, "csMeasurementCharacteristic"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "value"));
  -[FitnessService readBytesFromNSData:into:startingAt:length:info:](self, "readBytesFromNSData:into:startingAt:length:info:", v23, (char *)&v44 + 4, v21, 2, CFSTR("CSCM - crank event time"));

  p_fCurrentDataIsDuplicate = &self->fCurrentDataIsDuplicate;
  self->fCurrentDataIsDuplicate = 1;
  if ((v9 & 1) == 0)
  {
LABEL_16:
    v24 = WORD1(v44) == self->_lastMeasurement.cycling_crank_revolution
       && WORD2(v44) == self->_lastMeasurement.cycling_last_crank_event_time;
LABEL_19:
    v11 = 0;
    *p_fCurrentDataIsDuplicate = v24;
    if (!v24)
      goto LABEL_14;
    goto LABEL_20;
  }
  v18 = 0;
LABEL_9:
  v24 = HIDWORD(v43) == self->_lastMeasurement.cumulative_wheel_revolution
     && (unsigned __int16)v44 == self->_lastMeasurement.cycling_last_wheel_event_time;
  *p_fCurrentDataIsDuplicate = v24;
  if ((v18 & 1) == 0)
  {
    if (!v24)
      goto LABEL_19;
    goto LABEL_16;
  }
  v11 = 1;
  if (!v24)
  {
LABEL_14:
    firstDuplicateEventTimeStamp = self->firstDuplicateEventTimeStamp;
    self->firstDuplicateEventTimeStamp = 0;
LABEL_22:

    goto LABEL_23;
  }
LABEL_20:
  if (!self->firstDuplicateEventTimeStamp)
  {
    v26 = (NSDate *)v5;
    firstDuplicateEventTimeStamp = self->firstDuplicateEventTimeStamp;
    self->firstDuplicateEventTimeStamp = v26;
    goto LABEL_22;
  }
LABEL_23:
  v28 = 1;
  if (*p_fCurrentDataIsDuplicate)
  {
    if (-[CyclingSpeedAndCadenceService sendZeroForDuplicates](self, "sendZeroForDuplicates"))
    {
      objc_msgSend(v5, "timeIntervalSinceDate:", self->firstDuplicateEventTimeStamp);
      if (v27 < 1.5)
        v28 = 0;
    }
  }
  v29 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
  {
    log = v29;
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
    v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "name"));
    if (self->_wheelRevolutionDataSupported)
      v31 = CFSTR("✓");
    else
      v31 = CFSTR("0");
    v39 = v31;
    v40 = (void *)v30;
    if (self->_crankRevolutionDataSupported)
      v32 = CFSTR("✓");
    else
      v32 = CFSTR("0");
    v38 = v32;
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[CyclingSpeedAndCadenceService csMeasurementCharacteristic](self, "csMeasurementCharacteristic"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "value"));
    v35 = *p_fCurrentDataIsDuplicate;
    v36 = -[CyclingSpeedAndCadenceService sendZeroForDuplicates](self, "sendZeroForDuplicates");
    objc_msgSend(v5, "timeIntervalSinceDate:", self->firstDuplicateEventTimeStamp);
    *(_DWORD *)buf = 138414082;
    v46 = v40;
    v47 = 2112;
    v48 = v39;
    v49 = 2112;
    v50 = v38;
    v51 = 2112;
    v52 = v34;
    v53 = 1024;
    v54 = v35;
    v55 = 1024;
    v56 = v36;
    v57 = 2048;
    v58 = v37;
    v59 = 1024;
    v60 = v28;
    _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "“%@” Measurement - SPEED:%@ CADENCE:%@ (%@) duplicate:%d sendZeroForDuplicates:%d secondsSinceFirstDuplicate:%f sending:%d", buf, 0x46u);

    if (!v28)
      goto LABEL_34;
  }
  else if (!v28)
  {
    goto LABEL_34;
  }
  if ((v9 & 1) != 0)
    -[CyclingSpeedAndCadenceService updatedSpeedMeasurementValue:at:](self, "updatedSpeedMeasurementValue:at:", &v43, v5);
  if ((v11 & 1) == 0)
    -[CyclingSpeedAndCadenceService updatedCadenceMeasurementValue:at:](self, "updatedCadenceMeasurementValue:at:", &v43, v5);
LABEL_34:

}

- (void)updatedFeatureCharacteristicValue
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  _BOOL4 crankRevolutionDataSupported;
  const __CFString *v13;
  __int16 v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  const __CFString *v20;

  v14 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CyclingSpeedAndCadenceService csFeatureCharacteristic](self, "csFeatureCharacteristic"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "value"));
  -[FitnessService readBytesFromNSData:into:startingAt:length:info:](self, "readBytesFromNSData:into:startingAt:length:info:", v4, &v14, 0, 2, CFSTR("CSCF - flags"));

  v5 = v14;
  self->_wheelRevolutionDataSupported = v14 & 1;
  self->_crankRevolutionDataSupported = (v5 & 2) != 0;
  v6 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "name"));
    v10 = (void *)v9;
    v11 = CFSTR("YES");
    crankRevolutionDataSupported = self->_crankRevolutionDataSupported;
    if (self->_wheelRevolutionDataSupported)
      v13 = CFSTR("YES");
    else
      v13 = CFSTR("NO");
    *(_DWORD *)buf = 138412802;
    v16 = v9;
    v17 = 2112;
    if (!crankRevolutionDataSupported)
      v11 = CFSTR("NO");
    v18 = v13;
    v19 = 2112;
    v20 = v11;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "“%@” Features - SPEED:%@ CADENCE:%@", buf, 0x20u);

  }
  -[FitnessService featuresReadComplete](self, "featuresReadComplete");
}

- (void)updatedControlPointCharacteristicValue
{
  void *v2;

  v2 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
    sub_100072EEC(v2);
}

- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5
{
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned int v21;
  void *v22;
  void *v23;
  void *v24;
  unsigned int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];

  v32 = a3;
  if (!a5)
  {
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "characteristics"));
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v34;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v34 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[CyclingSpeedAndCadenceService csFeatureCharacteristic](self, "csFeatureCharacteristic"));
          if (v14)
          {

          }
          else
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "UUID"));
            v16 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("0x2A5C")));
            v17 = objc_msgSend(v15, "isEqual:", v16);

            if (v17)
            {
              -[CyclingSpeedAndCadenceService setCsFeatureCharacteristic:](self, "setCsFeatureCharacteristic:", v13);
              -[FitnessService setNotify:forCharacteristic:](self, "setNotify:forCharacteristic:", 1, v13);
              objc_msgSend(v32, "readValueForCharacteristic:", v13);
              goto LABEL_20;
            }
          }
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[CyclingSpeedAndCadenceService csMeasurementCharacteristic](self, "csMeasurementCharacteristic"));
          if (v18)
          {

          }
          else
          {
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "UUID"));
            v20 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("0x2A5B")));
            v21 = objc_msgSend(v19, "isEqual:", v20);

            if (v21)
            {
              -[CyclingSpeedAndCadenceService setCsMeasurementCharacteristic:](self, "setCsMeasurementCharacteristic:", v13);
LABEL_19:
              -[FitnessService setNotify:forCharacteristic:](self, "setNotify:forCharacteristic:", 0, v13);
              goto LABEL_20;
            }
          }
          v22 = (void *)objc_claimAutoreleasedReturnValue(-[CyclingSpeedAndCadenceService csControlPointCharacteristic](self, "csControlPointCharacteristic"));
          if (v22)
          {

            goto LABEL_20;
          }
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "UUID"));
          v24 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("0x2A5D")));
          v25 = objc_msgSend(v23, "isEqual:", v24);

          if (v25)
          {
            -[CyclingSpeedAndCadenceService setCsControlPointCharacteristic:](self, "setCsControlPointCharacteristic:", v13);
            goto LABEL_19;
          }
LABEL_20:
          v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v10);
    }

    -[ClientService notifyDidStart](self, "notifyDidStart");
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[CyclingSpeedAndCadenceService csMeasurementCharacteristic](self, "csMeasurementCharacteristic"));

    if (!v26)
    {
      v27 = (void *)qword_1000C9178;
      if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
        sub_1000730B8(v27);
    }
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[CyclingSpeedAndCadenceService csFeatureCharacteristic](self, "csFeatureCharacteristic"));

    if (!v28)
    {
      v29 = (void *)qword_1000C9178;
      if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
        sub_100073024(v29);
    }
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[CyclingSpeedAndCadenceService csControlPointCharacteristic](self, "csControlPointCharacteristic"));

    if (!v30)
    {
      v31 = (void *)qword_1000C9178;
      if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
        sub_100072F90(v31);
    }
  }

}

- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;

  v7 = a4;
  if (!a5)
  {
    v13 = v7;
    v8 = (id)objc_claimAutoreleasedReturnValue(-[CyclingSpeedAndCadenceService csFeatureCharacteristic](self, "csFeatureCharacteristic"));

    if (v8 == v13)
      -[CyclingSpeedAndCadenceService updatedFeatureCharacteristicValue](self, "updatedFeatureCharacteristicValue");
    v9 = (id)objc_claimAutoreleasedReturnValue(-[CyclingSpeedAndCadenceService csMeasurementCharacteristic](self, "csMeasurementCharacteristic"));

    if (v9 == v13)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "value"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
      -[CyclingSpeedAndCadenceService updatedMeasurementCharacteristicValue:at:](self, "updatedMeasurementCharacteristicValue:at:", v10, v11);

    }
    v12 = (id)objc_claimAutoreleasedReturnValue(-[CyclingSpeedAndCadenceService csControlPointCharacteristic](self, "csControlPointCharacteristic"));

    v7 = v13;
    if (v12 == v13)
    {
      -[CyclingSpeedAndCadenceService updatedControlPointCharacteristicValue](self, "updatedControlPointCharacteristicValue");
      v7 = v13;
    }
  }

}

- (CBCharacteristic)csMeasurementCharacteristic
{
  return self->_csMeasurementCharacteristic;
}

- (void)setCsMeasurementCharacteristic:(id)a3
{
  objc_storeStrong((id *)&self->_csMeasurementCharacteristic, a3);
}

- (CBCharacteristic)csFeatureCharacteristic
{
  return self->_csFeatureCharacteristic;
}

- (void)setCsFeatureCharacteristic:(id)a3
{
  objc_storeStrong((id *)&self->_csFeatureCharacteristic, a3);
}

- (CBCharacteristic)csControlPointCharacteristic
{
  return self->_csControlPointCharacteristic;
}

- (void)setCsControlPointCharacteristic:(id)a3
{
  objc_storeStrong((id *)&self->_csControlPointCharacteristic, a3);
}

- ($609C494B4ED383A073B3BF77BC831FED)lastMeasurement
{
  $E565BE7FF4DBC4B8C15830BDD601C5D9 *p_lastMeasurement;
  uint64_t v3;
  uint64_t v4;
  $609C494B4ED383A073B3BF77BC831FED result;

  p_lastMeasurement = &self->_lastMeasurement;
  v3 = *(_QWORD *)&self->_lastMeasurement.cycling_speed_cadence_flags;
  v4 = *(_QWORD *)&p_lastMeasurement->cycling_last_wheel_event_time;
  result.var2 = v4;
  result.var3 = WORD1(v4);
  result.var4 = WORD2(v4);
  result.var0 = ($B457590F2E91A24430F091323247A31F)v3;
  result.var1 = HIDWORD(v3);
  return result;
}

- (void)setLastMeasurement:(id)a3
{
  self->_lastMeasurement = ($E565BE7FF4DBC4B8C15830BDD601C5D9)a3;
}

- (double)wheelDiameterInInches
{
  return self->_wheelDiameterInInches;
}

- (void)setWheelDiameterInInches:(double)a3
{
  self->_wheelDiameterInInches = a3;
}

- (BOOL)wheelRevolutionDataSupported
{
  return self->_wheelRevolutionDataSupported;
}

- (void)setWheelRevolutionDataSupported:(BOOL)a3
{
  self->_wheelRevolutionDataSupported = a3;
}

- (BOOL)crankRevolutionDataSupported
{
  return self->_crankRevolutionDataSupported;
}

- (void)setCrankRevolutionDataSupported:(BOOL)a3
{
  self->_crankRevolutionDataSupported = a3;
}

- (BOOL)sendZeroForDuplicates
{
  return self->_sendZeroForDuplicates;
}

- (void)setSendZeroForDuplicates:(BOOL)a3
{
  self->_sendZeroForDuplicates = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_csControlPointCharacteristic, 0);
  objc_storeStrong((id *)&self->_csFeatureCharacteristic, 0);
  objc_storeStrong((id *)&self->_csMeasurementCharacteristic, 0);
  objc_storeStrong((id *)&self->firstDuplicateEventTimeStamp, 0);
}

@end
