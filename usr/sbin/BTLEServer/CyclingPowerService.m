@implementation CyclingPowerService

+ (id)UUID
{
  return +[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CBUUIDCyclingPowerServiceString);
}

- (void)updateZeroDuplicateValues
{
  -[CyclingPowerService setSendZeroForDuplicates:](self, "setSendZeroForDuplicates:", 1);
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
        sub_10006B494(v8, self);
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
  void *v9;
  void *v10;
  objc_super v11;
  _QWORD v12[5];

  v11.receiver = self;
  v11.super_class = (Class)CyclingPowerService;
  -[FitnessService start](&v11, "start");
  self->_wheelDiameterInInches = 26.0;
  -[CyclingPowerService readWheelSize](self, "readWheelSize");
  -[CyclingPowerService updateZeroDuplicateValues](self, "updateZeroDuplicateValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CBUUIDSensorLocation));
  v12[0] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("0x2A65")));
  v12[1] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("0x2A66")));
  v12[2] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("0x2A63")));
  v12[3] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("0x2A64")));
  v12[4] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v12, 5));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService service](self, "service"));
  objc_msgSend(v9, "discoverCharacteristics:forService:", v8, v10);

}

- (BOOL)supportsHKQuantityType:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  BOOL v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  int v11;
  void *v13;
  unsigned int v14;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
  v6 = objc_msgSend(v5, "isEqualToString:", HKQuantityTypeIdentifierCyclingPower);

  if ((v6 & 1) == 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
    if (objc_msgSend(v8, "isEqualToString:", HKQuantityTypeIdentifierCyclingSpeed))
    {

    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
      v10 = objc_msgSend(v9, "isEqualToString:", HKQuantityTypeIdentifierDistanceCycling);

      if ((v10 & 1) == 0)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
        v14 = objc_msgSend(v13, "isEqualToString:", HKQuantityTypeIdentifierCyclingCadence);

        if (!v14)
        {
          v7 = 0;
          goto LABEL_8;
        }
        v11 = 8;
        goto LABEL_7;
      }
    }
    v11 = 4;
LABEL_7:
    v7 = (*(_DWORD *)&self->_sendZeroForDuplicates & v11) != 0;
    goto LABEL_8;
  }
  v7 = 1;
LABEL_8:

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
  void *v11;
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
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CyclingPowerService cyclingPowerMeasurementCharacteristic](self, "cyclingPowerMeasurementCharacteristic"));
  -[FitnessService setNotify:forCharacteristic:](self, "setNotify:forCharacteristic:", v3, v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CyclingPowerService cyclingPowerVectorCharacteristic](self, "cyclingPowerVectorCharacteristic"));
  -[FitnessService setNotify:forCharacteristic:](self, "setNotify:forCharacteristic:", v3, v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CyclingPowerService cyclingPowerControlPointCharacteristic](self, "cyclingPowerControlPointCharacteristic"));
  -[FitnessService setNotify:forCharacteristic:](self, "setNotify:forCharacteristic:", v3, v12);

}

- (id)getDeviceInformationService
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService manager](self, "manager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CBUUIDDeviceInformationServiceString));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "clientServiceForUUID:", v3));

  return v4;
}

- (void)createDistributedHKDeviceWithSecondary:(id)a3
{
  void *v4;
  objc_class *v5;
  unsigned int v6;
  CyclingPowerService *v7;
  CyclingPowerService *v8;
  unsigned int v9;
  CyclingPowerService *v10;
  void *v11;
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
  void *v23;
  void *v24;
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
  id v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  NSObject *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  NSObject *v57;
  id v58;
  id v59;
  id v60;
  void *v61;
  CyclingPowerService *v62;
  CyclingPowerService *v63;
  CyclingPowerService *v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t v68;
  _BYTE buf[24];
  void *v70;
  _BYTE v71[10];
  __int16 v72;
  void *v73;
  __int16 v74;
  void *v75;

  v63 = (CyclingPowerService *)a3;
  v65 = 0;
  v66 = &v65;
  v67 = 0x2050000000;
  v4 = (void *)qword_1000C9058;
  v68 = qword_1000C9058;
  if (!qword_1000C9058)
  {
    *(_QWORD *)buf = _NSConcreteStackBlock;
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = sub_10001E6EC;
    v70 = &unk_1000AD1C8;
    *(_QWORD *)v71 = &v65;
    sub_10001E6EC((uint64_t)buf);
    v4 = (void *)v66[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v65, 8);
  v62 = self;
  v6 = -[CyclingPowerService isSensorLocationLeft](self, "isSensorLocationLeft");
  v7 = v63;
  if (v6)
    v7 = self;
  v8 = v7;
  v9 = -[CyclingPowerService isSensorLocationLeft](self, "isSensorLocationLeft");
  v10 = v63;
  if (!v9)
    v10 = self;
  v64 = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](v8, "peripheral"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "name"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](v64, "peripheral"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "name"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/%@"), v12, v14));

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](v8, "peripheral"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "hkDevice"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "manufacturer"));
  v18 = v17;
  if (v17)
  {
    v60 = v17;
  }
  else
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](v64, "peripheral"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "hkDevice"));
    v60 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "manufacturer"));

  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](v8, "peripheral"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "hkDevice"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "model"));
  v24 = v23;
  if (v23)
  {
    v59 = v23;
  }
  else
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](v64, "peripheral"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "hkDevice"));
    v59 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "model"));

  }
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](v8, "peripheral"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "hkDevice"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "hardwareVersion"));
  v30 = v29;
  if (v29)
  {
    v58 = v29;
  }
  else
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](v64, "peripheral"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "hkDevice"));
    v58 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "hardwareVersion"));

  }
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](v8, "peripheral"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "hkDevice"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "firmwareVersion"));
  v36 = v35;
  if (v35)
  {
    v37 = v35;
  }
  else
  {
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](v64, "peripheral"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "hkDevice"));
    v37 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "firmwareVersion"));

  }
  if (v5)
  {
    v40 = [v5 alloc];
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](v8, "peripheral"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "identifier"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "UUIDString"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](v64, "peripheral"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "identifier"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "UUIDString"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/%@"), v43, v46));
    v48 = objc_msgSend(v40, "initWithName:manufacturer:model:hardwareVersion:firmwareVersion:softwareVersion:localIdentifier:UDIDeviceIdentifier:", v61, v60, v59, v58, v37, 0, v47, 0);

    v49 = (void *)qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
    {
      v50 = v49;
      v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "name"));
      v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "manufacturer"));
      v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "model"));
      v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "hardwareVersion"));
      v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "firmwareVersion"));
      v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "localIdentifier"));
      *(_DWORD *)buf = 138413570;
      *(_QWORD *)&buf[4] = v51;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v52;
      *(_WORD *)&buf[22] = 2112;
      v70 = v53;
      *(_WORD *)v71 = 2112;
      *(_QWORD *)&v71[2] = v54;
      v72 = 2112;
      v73 = v55;
      v74 = 2112;
      v75 = v56;
      _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "Created distributed HKDevice name:“%@” manufacturer:“%@” model:“%@” HW:“%@” FW:“%@” localID:“%@”", buf, 0x3Eu);

    }
    -[CyclingPowerService setComboHKDevice:](v62, "setComboHKDevice:", v48);
    -[CyclingPowerService setComboHKDevice:](v63, "setComboHKDevice:", v48);

  }
  else
  {
    v57 = qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_10006B558((uint64_t)v61, v57);
  }

}

- (id)updateComboString:(id)a3 withValue:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  if (v6 && objc_msgSend(v6, "length"))
  {
    if (objc_msgSend(v6, "containsString:", CFSTR("/"))
      || objc_msgSend(v7, "isEqualToString:", v6))
    {
      v8 = v6;
    }
    else
    {
      if (-[CyclingPowerService isSensorLocationLeft](self, "isSensorLocationLeft"))
        v11 = v7;
      else
        v11 = v6;
      if (-[CyclingPowerService isSensorLocationLeft](self, "isSensorLocationLeft"))
        v12 = v6;
      else
        v12 = v7;
      v8 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/%@"), v11, v12));
    }
  }
  else
  {
    v8 = v7;
  }
  v9 = v8;

  return v9;
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
  unsigned int v12;
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
  void *v23;
  void *v24;
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
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  NSObject *log;
  void *v49;
  void *v50;
  void *v51;
  objc_super v52;
  uint8_t buf[4];
  void *v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  void *v62;
  __int16 v63;
  void *v64;

  v4 = a3;
  v52.receiver = self;
  v52.super_class = (Class)CyclingPowerService;
  -[FitnessService receiveDeviceInfoUpdateNotification:](&v52, "receiveDeviceInfoUpdateNotification:", v4);
  v5 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
    sub_10006B67C(v5, v4, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
  if (!objc_msgSend(v6, "isEqualToString:", CFSTR("DeviceInformationUpdate")))
    goto LABEL_29;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "UUIDString"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "valueForKey:", CFSTR("UUID")));
  v12 = objc_msgSend(v9, "isEqualToString:", v11);

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "valueForKey:", CFSTR("PnP")));

    if (v14)
      -[CyclingPowerService updateZeroDuplicateValues](self, "updateZeroDuplicateValues");
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "valueForKey:", CFSTR("ModelNumber")));

    if (v16)
    {
      -[CyclingPowerService updateZeroDuplicateValues](self, "updateZeroDuplicateValues");
      if (self->fDistributedPower)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[CyclingPowerService comboHKDevice](self, "comboHKDevice"));

        if (v17)
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[CyclingPowerService comboHKDevice](self, "comboHKDevice"));
          objc_msgSend(v18, "_setModel:", v16);

        }
      }
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "valueForKey:", CFSTR("FirmwareRevision")));

    if (v20)
    {
      if (self->fDistributedPower)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[CyclingPowerService comboHKDevice](self, "comboHKDevice"));

        if (v21)
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue(-[CyclingPowerService comboHKDevice](self, "comboHKDevice"));
          v23 = (void *)objc_claimAutoreleasedReturnValue(-[CyclingPowerService comboHKDevice](self, "comboHKDevice"));
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "firmwareVersion"));
          v25 = (void *)objc_claimAutoreleasedReturnValue(-[CyclingPowerService updateComboString:withValue:](self, "updateComboString:withValue:", v24, v20));
          objc_msgSend(v22, "_setFirmwareVersion:", v25);

        }
      }
    }
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "valueForKey:", CFSTR("HardwareRevision")));

    if (v27)
    {
      if (self->fDistributedPower)
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[CyclingPowerService comboHKDevice](self, "comboHKDevice"));

        if (v28)
        {
          v29 = (void *)objc_claimAutoreleasedReturnValue(-[CyclingPowerService comboHKDevice](self, "comboHKDevice"));
          v30 = (void *)objc_claimAutoreleasedReturnValue(-[CyclingPowerService comboHKDevice](self, "comboHKDevice"));
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "hardwareVersion"));
          v32 = (void *)objc_claimAutoreleasedReturnValue(-[CyclingPowerService updateComboString:withValue:](self, "updateComboString:withValue:", v31, v27));
          objc_msgSend(v29, "_setHardwareVersion:", v32);

        }
      }
    }
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "valueForKey:", CFSTR("ManufacturerName")));

    if (v6)
    {
      -[CyclingPowerService updateZeroDuplicateValues](self, "updateZeroDuplicateValues");
      if (self->fDistributedPower)
      {
        v34 = (void *)objc_claimAutoreleasedReturnValue(-[CyclingPowerService comboHKDevice](self, "comboHKDevice"));

        if (v34)
        {
          v35 = (void *)objc_claimAutoreleasedReturnValue(-[CyclingPowerService comboHKDevice](self, "comboHKDevice"));
          objc_msgSend(v35, "_setManufacturer:", v6);

        }
      }
    }
    if (self->fDistributedPower
      && (v36 = (void *)objc_claimAutoreleasedReturnValue(-[CyclingPowerService comboHKDevice](self, "comboHKDevice")),
          v36,
          v36))
    {
      v37 = (void *)qword_1000C9178;
      if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
      {
        log = v37;
        v51 = (void *)objc_claimAutoreleasedReturnValue(-[CyclingPowerService comboHKDevice](self, "comboHKDevice"));
        v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "name"));
        v50 = (void *)objc_claimAutoreleasedReturnValue(-[CyclingPowerService comboHKDevice](self, "comboHKDevice"));
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "manufacturer"));
        v49 = (void *)objc_claimAutoreleasedReturnValue(-[CyclingPowerService comboHKDevice](self, "comboHKDevice"));
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "model"));
        v47 = (void *)objc_claimAutoreleasedReturnValue(-[CyclingPowerService comboHKDevice](self, "comboHKDevice"));
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "hardwareVersion"));
        v41 = (void *)objc_claimAutoreleasedReturnValue(-[CyclingPowerService comboHKDevice](self, "comboHKDevice"));
        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "firmwareVersion"));
        v43 = (void *)objc_claimAutoreleasedReturnValue(-[CyclingPowerService comboHKDevice](self, "comboHKDevice"));
        v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "localIdentifier"));
        *(_DWORD *)buf = 138413570;
        v54 = v46;
        v55 = 2112;
        v56 = v38;
        v57 = 2112;
        v58 = v39;
        v59 = 2112;
        v60 = v40;
        v61 = 2112;
        v62 = v42;
        v63 = 2112;
        v64 = v44;
        _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Updated distributed HKDevice name:“%@” manufacturer:“%@” model:“%@” HW:“%@” FW:“%@” localID:“%@”", buf, 0x3Eu);

      }
    }
    else
    {
      v45 = (void *)qword_1000C9178;
      if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
        sub_10006B5CC(v45, self);
    }
LABEL_29:

  }
}

- (void)updateForSensorLocation
{
  void *v3;
  void *v4;
  CyclingPowerService *v5;
  CyclingPowerService *v6;
  CyclingPowerService *v7;

  if (self->fFeatureCharacteristicRead && self->fSensorLocationCharacteristicRead && self->fDistributedPower)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CyclingPowerService comboHKDevice](self, "comboHKDevice"));

    if (!v3)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[FitnessDeviceManager instance](FitnessDeviceManager, "instance"));
      v7 = (CyclingPowerService *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "findMatchingDistributedFitnessService:", self));

      v5 = v7;
      if (v7 && v7->fFeatureCharacteristicRead && v7->fSensorLocationCharacteristicRead)
      {
        if (-[CyclingPowerService isSensorLocationLeft](self, "isSensorLocationLeft"))
        {
          v7->fIsSecondary = 1;
          v6 = self;
        }
        else
        {
          self->fIsSecondary = 1;
          v6 = v7;
        }
        -[CyclingPowerService createDistributedHKDeviceWithSecondary:](v6, "createDistributedHKDeviceWithSecondary:");
        v5 = v7;
      }

    }
  }
}

- (id)sensorLocationString
{
  if ((self->fSensorLocation - 5) > 3u)
    return CFSTR("Unsupported");
  else
    return off_1000AD660[(char)(self->fSensorLocation - 5)];
}

- (void)updatedSensorLocationCharacteristicValue
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CyclingPowerService cyclingPowerSensorLocationCharacteristic](self, "cyclingPowerSensorLocationCharacteristic"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "value"));
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CyclingPowerService cyclingPowerSensorLocationCharacteristic](self, "cyclingPowerSensorLocationCharacteristic"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "value"));
    -[FitnessService readBytesFromNSData:into:startingAt:length:info:](self, "readBytesFromNSData:into:startingAt:length:info:", v7, &self->fSensorLocation, 0, 1, CFSTR("Cycling Power Sensor Location Characteristic Value"));

    v8 = (void *)qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
    {
      v9 = v8;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CyclingPowerService sensorLocationString](self, "sensorLocationString"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "name"));
      v14 = 138412546;
      v15 = v10;
      v16 = 2112;
      v17 = v12;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "updatedSensorLocationCharacteristicValue:%@ for “%@”", (uint8_t *)&v14, 0x16u);

    }
  }
  else
  {
    v13 = (void *)qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_10006B768(v13, self);
  }
  self->fSensorLocationCharacteristicRead = 1;
  -[CyclingPowerService updateForSensorLocation](self, "updateForSensorLocation");
}

- (void)updatedFeatureCharacteristicValue
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  const __CFString *v18;
  int v19;
  const __CFString *v20;
  _BYTE v21[24];
  const __CFString *v22;
  __int16 v23;
  const __CFString *v24;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CyclingPowerService cyclingPowerFeatureCharacteristic](self, "cyclingPowerFeatureCharacteristic"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "value"));
  v5 = objc_msgSend(v4, "length");

  if ((unint64_t)v5 > 3)
  {
    v8 = 4;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CyclingPowerService cyclingPowerFeatureCharacteristic](self, "cyclingPowerFeatureCharacteristic"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "value"));
    v8 = objc_msgSend(v7, "length");

    if (v8 <= 2)
    {
      v9 = (void *)qword_1000C9178;
      if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
        sub_10006B854(v9, self);
    }
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CyclingPowerService cyclingPowerFeatureCharacteristic](self, "cyclingPowerFeatureCharacteristic"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "value"));
  -[FitnessService readBytesFromNSData:into:startingAt:length:info:](self, "readBytesFromNSData:into:startingAt:length:info:", v11, &self->_sendZeroForDuplicates, 0, v8, CFSTR("Cycling Power Feature Characteristic Value"));

  self->fDistributedPower = (*(_DWORD *)&self->_sendZeroForDuplicates & 0x200000) != 0;
  v12 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    v13 = v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "name"));
    v16 = (void *)v15;
    if (self->fDistributedPower)
      v17 = &stru_1000AE858;
    else
      v17 = CFSTR("NON-");
    v18 = CFSTR("YES");
    v19 = *(_DWORD *)&self->_sendZeroForDuplicates;
    *(_DWORD *)v21 = 138413058;
    *(_QWORD *)&v21[4] = v15;
    if ((v19 & 4) != 0)
      v20 = CFSTR("YES");
    else
      v20 = CFSTR("NO");
    *(_QWORD *)&v21[14] = v17;
    *(_WORD *)&v21[12] = 2112;
    *(_WORD *)&v21[22] = 2112;
    v22 = v20;
    if ((v19 & 8) == 0)
      v18 = CFSTR("NO");
    v23 = 2112;
    v24 = v18;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "“%@” Features - %@DISTRIBUTED POWER:YES SPEED:%@ CADENCE:%@", v21, 0x2Au);

  }
  self->fFeatureCharacteristicRead = 1;
  -[CyclingPowerService updateForSensorLocation](self, "updateForSensorLocation", *(_OWORD *)v21, *(_QWORD *)&v21[16], v22);
  -[FitnessService featuresReadComplete](self, "featuresReadComplete");
}

- (BOOL)isDistributed
{
  return self->fDistributedPower;
}

- (BOOL)matchesDistributedService:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  unsigned int v15;
  unsigned int v16;
  BOOL v17;

  v4 = a3;
  v6 = objc_opt_class(CyclingPowerService, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    v7 = v4;
    if (!objc_msgSend(v7, "isDistributed"))
      goto LABEL_14;
    if (!-[CyclingPowerService isDistributed](self, "isDistributed"))
      goto LABEL_14;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "peripheral"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "UUIDString"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "UUIDString"));
    v14 = objc_msgSend(v10, "isEqualToString:", v13);

    if ((v14 & 1) != 0)
      goto LABEL_14;
    v15 = -[FitnessService vendorID](self, "vendorID");
    if (v15 == objc_msgSend(v7, "vendorID")
      && (v16 = -[FitnessService productID](self, "productID"), v16 == objc_msgSend(v7, "productID")))
    {
      switch(self->fSensorLocation)
      {
        case 5u:
          if (v7[113] != 6)
            goto LABEL_14;
          goto LABEL_9;
        case 6u:
          if (v7[113] != 5)
            goto LABEL_14;
          goto LABEL_9;
        case 7u:
          if (v7[113] != 8)
            goto LABEL_14;
LABEL_9:
          v17 = 1;
          break;
        case 8u:
          v17 = v7[113] == 7;
          break;
        default:
          goto LABEL_14;
      }
    }
    else
    {
LABEL_14:
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void)updatedSpeedMeasurementValueForRevolutions:(unsigned int)a3 andWheelEventTime:(unsigned __int16)a4 timeStamp:(id)a5
{
  unsigned int v5;
  id v8;
  void *v9;
  $7BA25283B4A2BAE96EF4868D9054B6C0 *p_lastPowerMeasurementReading;
  uint64_t v11;
  uint64_t v12;
  int wheel_revolution_data_low;
  BOOL v14;
  int v15;
  double v16;
  double v17;
  double v18;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  int v24;
  int v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  __int16 v32;
  _BYTE v33[10];
  _BYTE v34[6];
  _BYTE v35[6];
  _DWORD v36[5];

  v5 = a4;
  v8 = a5;
  v9 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
  {
    v27 = v9;
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "name"));
    v30 = 138413570;
    v31 = v29;
    v32 = 1024;
    *(_DWORD *)v33 = a3;
    *(_WORD *)&v33[4] = 1024;
    *(_DWORD *)&v33[6] = a3;
    *(_WORD *)v34 = 1024;
    *(_DWORD *)&v34[2] = v5;
    *(_WORD *)v35 = 1024;
    *(_DWORD *)&v35[2] = v5;
    LOWORD(v36[0]) = 2048;
    *(double *)((char *)v36 + 2) = (double)v5 * 0.00048828125;
    _os_log_debug_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "“%@” READ CP Measurement SPEED, CumWheelRev:%d (0x%08X) last Wheel Event Time:%d (0x%04X) (%f in sec)", (uint8_t *)&v30, 0x2Eu);

  }
  p_lastPowerMeasurementReading = &self->lastPowerMeasurementReading;
  if (*(_DWORD *)&self->lastPowerMeasurementReading.accumulated_torque
    || LOWORD(self->lastPowerMeasurementReading.wheel_revolution_data))
  {
    v11 = objc_claimAutoreleasedReturnValue(+[FitnessService hkQuantityTypeForIdentifier:](FitnessService, "hkQuantityTypeForIdentifier:", HKQuantityTypeIdentifierCyclingSpeed));
    v12 = objc_claimAutoreleasedReturnValue(+[FitnessService hkQuantityTypeForIdentifier:](FitnessService, "hkQuantityTypeForIdentifier:", HKQuantityTypeIdentifierDistanceCycling));
    if (v11 | v12)
    {
      wheel_revolution_data_low = LOWORD(self->lastPowerMeasurementReading.wheel_revolution_data);
      v14 = __OFSUB__(v5, wheel_revolution_data_low);
      v15 = v5 - wheel_revolution_data_low;
      if (v15 < 0 != v14)
        v15 += 0x10000;
      if (v15)
      {
        v16 = (double)v15 * 0.00048828125;
        v17 = self->_wheelDiameterInInches
            * ((double)(int)(a3 - *(_DWORD *)&self->lastPowerMeasurementReading.accumulated_torque)
             * 3.14159265);
        v18 = v17 / v16 * 0.0568181818;
        if (v18 >= 0.0 && v18 < 200.0)
        {
          v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", v8, -v16));
          if (v11 && -[FitnessService isCollectingHKQuantityType:](self, "isCollectingHKQuantityType:", v11))
          {
            -[FitnessService recordDatum:start:end:quantityType:](self, "recordDatum:start:end:quantityType:", v26, v8, v11, v18);
            -[FitnessService storeDatumsForQuantityType:](self, "storeDatumsForQuantityType:", v11);
          }
          if (v12 && -[FitnessService isCollectingHKQuantityType:](self, "isCollectingHKQuantityType:", v12))
          {
            -[FitnessService recordDatum:start:end:quantityType:](self, "recordDatum:start:end:quantityType:", v26, v8, v12, v17 * 0.0254);
            -[FitnessService storeDatumsForQuantityType:](self, "storeDatumsForQuantityType:", v12);
          }

        }
        else
        {
          v20 = (void *)qword_1000C9178;
          if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
          {
            v21 = v20;
            v22 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "name"));
            v24 = *(_DWORD *)&p_lastPowerMeasurementReading->accumulated_torque;
            v25 = LOWORD(p_lastPowerMeasurementReading->wheel_revolution_data);
            v30 = 138413570;
            v31 = v23;
            v32 = 2048;
            *(double *)v33 = v18;
            *(_WORD *)&v33[8] = 1024;
            *(_DWORD *)v34 = a3;
            *(_WORD *)&v34[4] = 1024;
            *(_DWORD *)v35 = v5;
            *(_WORD *)&v35[4] = 1024;
            v36[0] = v24;
            LOWORD(v36[1]) = 1024;
            *(_DWORD *)((char *)&v36[1] + 2) = v25;
            _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "“%@” Invalid speed detected:%f rpm rev count=0x%08X timestamp=0x%04X previous rev count=0x%08X timestamp=0x%04X", (uint8_t *)&v30, 0x2Eu);

          }
        }
      }
      else if (self->fCurrentDataIsDuplicate
             && -[CyclingPowerService sendDuplicateReadingsAsZero](self, "sendDuplicateReadingsAsZero"))
      {
        if (-[FitnessService isCollectingHKQuantityType:](self, "isCollectingHKQuantityType:", v11))
        {
          -[FitnessService recordDatum:start:end:quantityType:](self, "recordDatum:start:end:quantityType:", v8, v8, v11, 0.0);
          -[FitnessService storeDatumsForQuantityType:](self, "storeDatumsForQuantityType:", v11);
        }
        if (v12 && -[FitnessService isCollectingHKQuantityType:](self, "isCollectingHKQuantityType:", v12))
        {
          -[FitnessService recordDatum:start:end:quantityType:](self, "recordDatum:start:end:quantityType:", v8, v8, v12, 0.0);
          -[FitnessService storeDatumsForQuantityType:](self, "storeDatumsForQuantityType:", v12);
        }
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
    {
      sub_10006B908();
    }

  }
}

- (void)updatedCadenceMeasurementValueForRevolutions:(unsigned __int16)a3 andCrankEventTime:(unsigned __int16)a4 timeStamp:(id)a5
{
  unsigned int v5;
  int v6;
  id v8;
  void *v9;
  $7BA25283B4A2BAE96EF4868D9054B6C0 *p_lastPowerMeasurementReading;
  void *v11;
  int last_wheel_event_time;
  BOOL v13;
  int v14;
  int v15;
  double v16;
  double v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  int wheel_revolution_data_high;
  int v27;
  int v28;
  void *v29;
  __int16 v30;
  _BYTE v31[10];
  _BYTE v32[6];
  _BYTE v33[6];
  _BYTE v34[10];

  v5 = a4;
  v6 = a3;
  v8 = a5;
  v9 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
  {
    v19 = v9;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "name"));
    v28 = 138413570;
    v29 = v21;
    v30 = 1024;
    *(_DWORD *)v31 = v6;
    *(_WORD *)&v31[4] = 1024;
    *(_DWORD *)&v31[6] = v6;
    *(_WORD *)v32 = 1024;
    *(_DWORD *)&v32[2] = v5;
    *(_WORD *)v33 = 1024;
    *(_DWORD *)&v33[2] = v5;
    *(_WORD *)v34 = 2048;
    *(double *)&v34[2] = (double)v5 * 0.0009765625;
    _os_log_debug_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "“%@” READ CP Measurement CADENCE, CrankRev:%d (0x%04X) last Crank Event Time:%d (0x%04X) (%f in sec)", (uint8_t *)&v28, 0x2Eu);

  }
  p_lastPowerMeasurementReading = &self->lastPowerMeasurementReading;
  if (HIWORD(self->lastPowerMeasurementReading.wheel_revolution_data)
    || self->lastPowerMeasurementReading.last_wheel_event_time)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[FitnessService hkQuantityTypeForIdentifier:](FitnessService, "hkQuantityTypeForIdentifier:", HKQuantityTypeIdentifierCyclingCadence));
    if (v11)
    {
      if (-[FitnessService isCollectingHKQuantityType:](self, "isCollectingHKQuantityType:", v11))
      {
        last_wheel_event_time = self->lastPowerMeasurementReading.last_wheel_event_time;
        v13 = __OFSUB__(v5, last_wheel_event_time);
        v14 = v5 - last_wheel_event_time;
        if (v14 < 0 != v13)
          v14 += 0x10000;
        if (v14)
        {
          v15 = v6 - HIWORD(self->lastPowerMeasurementReading.wheel_revolution_data);
          if (v15 >= 1)
          {
            v16 = (double)v14 * 0.0009765625;
            v17 = (double)v15 * 60.0 / v16;
            if (v17 < 0.0 || v17 >= 500.0)
            {
              v22 = (void *)qword_1000C9178;
              if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
              {
                v23 = v22;
                v24 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
                v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "name"));
                wheel_revolution_data_high = HIWORD(p_lastPowerMeasurementReading->wheel_revolution_data);
                v27 = p_lastPowerMeasurementReading->last_wheel_event_time;
                v28 = 138413570;
                v29 = v25;
                v30 = 2048;
                *(double *)v31 = v17;
                *(_WORD *)&v31[8] = 1024;
                *(_DWORD *)v32 = v6;
                *(_WORD *)&v32[4] = 1024;
                *(_DWORD *)v33 = v5;
                *(_WORD *)&v33[4] = 1024;
                *(_DWORD *)v34 = wheel_revolution_data_high;
                *(_WORD *)&v34[4] = 1024;
                *(_DWORD *)&v34[6] = v27;
                _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "“%@” Invalid cadence detected:%f rpm rev count=0x%04X timestamp=0x%04X previous rev count=0x%04X timestamp=0x%04X", (uint8_t *)&v28, 0x2Eu);

              }
            }
            else
            {
              v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", v8, -v16));
              -[FitnessService recordDatum:start:end:quantityType:](self, "recordDatum:start:end:quantityType:", v18, v8, v11, v17);
              -[FitnessService storeDatumsForQuantityType:](self, "storeDatumsForQuantityType:", v11);

            }
          }
        }
        else if (self->fCurrentDataIsDuplicate
               && -[CyclingPowerService sendDuplicateReadingsAsZero](self, "sendDuplicateReadingsAsZero"))
        {
          -[FitnessService recordDatum:start:end:quantityType:](self, "recordDatum:start:end:quantityType:", v8, v8, v11, 0.0);
          -[FitnessService storeDatumsForQuantityType:](self, "storeDatumsForQuantityType:", v11);
        }
      }
      else if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      {
        sub_10006B960();
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
    {
      sub_10006B934();
    }

  }
}

- (BOOL)isSensorLocationLeft
{
  return (self->fSensorLocation & 0xFD) == 5;
}

- (BOOL)isSensorLocationRight
{
  int fSensorLocation;

  fSensorLocation = self->fSensorLocation;
  return fSensorLocation == 6 || fSensorLocation == 8;
}

- (id)sensorLocationSideString
{
  if (-[CyclingPowerService isSensorLocationLeft](self, "isSensorLocationLeft"))
    return CFSTR("Left");
  if (-[CyclingPowerService isSensorLocationRight](self, "isSensorLocationRight"))
    return CFSTR("Right");
  return CFSTR("-");
}

- (double)powerBalanceForValue:(double)a3 otherService:(id)a4 otherValue:(double)a5
{
  id v8;
  double v9;
  double v10;

  v8 = a4;
  if (a3 + a5 <= 0.0)
    goto LABEL_9;
  if (!-[CyclingPowerService isSensorLocationLeft](self, "isSensorLocationLeft")
    || !objc_msgSend(v8, "isSensorLocationRight"))
  {
    if (-[CyclingPowerService isSensorLocationRight](self, "isSensorLocationRight")
      && objc_msgSend(v8, "isSensorLocationLeft"))
    {
      v9 = a5 * 100.0;
      goto LABEL_8;
    }
LABEL_9:
    v10 = 50.0;
    goto LABEL_10;
  }
  v9 = a3 * 100.0;
LABEL_8:
  v10 = v9 / (a3 + a5);
LABEL_10:

  return v10;
}

- (id)originatingHKDevice
{
  void *v3;
  void *v4;
  void *v5;

  if (-[CyclingPowerService isDistributed](self, "isDistributed")
    && (v3 = (void *)objc_claimAutoreleasedReturnValue(-[CyclingPowerService comboHKDevice](self, "comboHKDevice")),
        v3,
        v3))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CyclingPowerService comboHKDevice](self, "comboHKDevice"));
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "hkDevice"));

  }
  return v4;
}

- (void)updatedPowerMeasurementValue:(id *)a3 timeStamp:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HKQuantityDatum **p_lastDistributedDatum;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  int v41;
  __int16 var0;
  void *v43;
  _BOOL4 v44;
  unint64_t v45;
  NSObject *v46;
  void *v47;
  void *v48;
  const __CFString *v49;
  const char *v50;
  NSObject *v51;
  uint32_t v52;
  void *v53;
  double v54;
  const __CFString *v55;
  void *v56;
  double v57;
  double v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  NSObject *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  HKQuantityDatum *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  double v78;
  double v79;
  void *v80;
  double v81;
  double v82;
  void *v83;
  void *v84;
  double v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  double v89;
  double v90;
  void *v91;
  void *v92;
  double v93;
  double v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  HKQuantityDatum *v104;
  void *v105;
  uint64_t v106;
  uint64_t v107;
  void *v108;
  void *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  void *v113;
  uint64_t v114;
  uint64_t v115;
  void *v116;
  void *v117;
  void *v118;
  uint64_t v119;
  uint64_t v120;
  void *v121;
  void *v122;
  uint64_t v123;
  uint64_t v124;
  void *v125;
  void *v126;
  void *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  void *v132;
  void *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  NSObject *loga;
  NSObject *logc;
  NSObject *logd;
  NSObject *log;
  NSObject *logb;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  NSObject *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  uint8_t buf[4];
  void *v173;
  __int16 v174;
  _BYTE v175[28];
  __int16 v176;
  uint64_t v177;
  __int16 v178;
  uint64_t v179;
  __int16 v180;
  double v181;
  __int16 v182;
  uint64_t v183;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[FitnessService hkQuantityTypeForIdentifier:](FitnessService, "hkQuantityTypeForIdentifier:", HKQuantityTypeIdentifierCyclingPower));
  if (v7 && -[FitnessService isCollectingHKQuantityType:](self, "isCollectingHKQuantityType:", v7))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[FitnessDeviceManager instance](FitnessDeviceManager, "instance"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "findMatchingDistributedFitnessService:", self));

    if (-[CyclingPowerService isDistributed](self, "isDistributed"))
    {
      if (v9)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[CyclingPowerService comboHKDevice](self, "comboHKDevice"));

        if (v10)
        {
          p_lastDistributedDatum = &self->_lastDistributedDatum;
          if (!self->_lastDistributedDatum)
            goto LABEL_42;
          v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lastDistributedDatum"));
          if (v12)
          {
            v13 = (void *)v12;
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lastDistributedDatum"));
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "dateInterval"));
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "startDate"));
            objc_msgSend(v6, "timeIntervalSinceDate:", v16);
            v18 = fabs(v17);

            if (v18 < 1.5)
            {
              v19 = (void *)objc_claimAutoreleasedReturnValue(-[HKQuantityDatum quantity](*p_lastDistributedDatum, "quantity"));
              objc_msgSend(v19, "_value");
              v21 = v20;
              v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lastDistributedDatum"));
              v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "quantity"));
              objc_msgSend(v23, "_value");
              -[CyclingPowerService powerBalanceForValue:otherService:otherValue:](self, "powerBalanceForValue:otherService:otherValue:", v9, v21, v24);
              v26 = v25;

              v27 = (void *)objc_claimAutoreleasedReturnValue(-[HKQuantityDatum quantity](*p_lastDistributedDatum, "quantity"));
              objc_msgSend(v27, "_value");
              v29 = v28;
              v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lastDistributedDatum"));
              v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "quantity"));
              objc_msgSend(v31, "_value");
              v33 = v29 + v32;

              if (v33 < 0.0 || v33 >= 5000.0)
              {
                v71 = (void *)qword_1000C9178;
                if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
                {
                  logb = v71;
                  v171 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
                  v143 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v171, "name"));
                  v165 = (void *)objc_claimAutoreleasedReturnValue(-[HKQuantityDatum quantity](*p_lastDistributedDatum, "quantity"));
                  objc_msgSend(v165, "_value");
                  v135 = v134;
                  v146 = (void *)objc_claimAutoreleasedReturnValue(-[CyclingPowerService sensorLocationSideString](self, "sensorLocationSideString"));
                  v155 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lastDistributedDatum"));
                  v150 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v155, "quantity"));
                  objc_msgSend(v150, "_value");
                  v137 = v136;
                  v138 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "peripheral"));
                  v139 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v138, "name"));
                  *(_DWORD *)buf = 138414082;
                  v173 = v143;
                  v174 = 2048;
                  *(_QWORD *)v175 = v135;
                  *(_WORD *)&v175[8] = 2114;
                  *(_QWORD *)&v175[10] = v146;
                  *(_WORD *)&v175[18] = 2048;
                  *(_QWORD *)&v175[20] = v137;
                  v176 = 2112;
                  v177 = (uint64_t)v139;
                  v178 = 2114;
                  v179 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "sensorLocationSideString"));
                  v140 = (void *)v179;
                  v180 = 2048;
                  v181 = v33;
                  v182 = 2048;
                  v183 = v26;
                  _os_log_error_impl((void *)&_mh_execute_header, logb, OS_LOG_TYPE_ERROR, "“%@” READ CP Measurement POWER distributed combined units qty:%f (%{public}@) + %f (“%@” - %{public}@) -> %f (INVALID VALUE) balance:%f", buf, 0x52u);

                }
              }
              else
              {
                v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lastDistributedDatum"));
                v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "dateInterval"));
                v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "startDate"));
                v37 = (void *)objc_claimAutoreleasedReturnValue(-[FitnessService createDatum:start:end:quantityType:](self, "createDatum:start:end:quantityType:", v36, v6, v7, v33));

                -[FitnessService recordDatum:forType:](self, "recordDatum:forType:", v37, v7);
                v38 = (void *)objc_claimAutoreleasedReturnValue(-[CyclingPowerService comboHKDevice](self, "comboHKDevice"));
                -[FitnessService storeDatumsForQuantityType:usingHKDevice:](self, "storeDatumsForQuantityType:usingHKDevice:", v7, v38);

                v39 = (void *)qword_1000C9178;
                if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
                {
                  log = v39;
                  v170 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
                  v142 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v170, "name"));
                  v164 = (void *)objc_claimAutoreleasedReturnValue(-[HKQuantityDatum quantity](*p_lastDistributedDatum, "quantity"));
                  objc_msgSend(v164, "_value");
                  v129 = v128;
                  v145 = (void *)objc_claimAutoreleasedReturnValue(-[CyclingPowerService sensorLocationSideString](self, "sensorLocationSideString"));
                  v154 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lastDistributedDatum"));
                  v149 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v154, "quantity"));
                  objc_msgSend(v149, "_value");
                  v131 = v130;
                  v141 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "peripheral"));
                  v132 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v141, "name"));
                  *(_DWORD *)buf = 138414082;
                  v173 = v142;
                  v174 = 2048;
                  *(_QWORD *)v175 = v129;
                  *(_WORD *)&v175[8] = 2114;
                  *(_QWORD *)&v175[10] = v145;
                  *(_WORD *)&v175[18] = 2048;
                  *(_QWORD *)&v175[20] = v131;
                  v176 = 2112;
                  v177 = (uint64_t)v132;
                  v178 = 2114;
                  v179 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "sensorLocationSideString"));
                  v133 = (void *)v179;
                  v180 = 2048;
                  v181 = v33;
                  v182 = 2048;
                  v183 = v26;
                  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "“%@” READ CP Measurement POWER distributed combined units qty:%f (%{public}@) + %f (“%@” - %{public}@) -> %f balance:%f", buf, 0x52u);

                }
              }
              objc_msgSend(v9, "setLastDistributedDatum:", 0);
              goto LABEL_42;
            }
          }
          v56 = (void *)objc_claimAutoreleasedReturnValue(-[HKQuantityDatum quantity](*p_lastDistributedDatum, "quantity"));
          objc_msgSend(v56, "_value");
          v58 = v57 + v57;

          if (v58 < 0.0 || v58 >= 5000.0)
          {
            v66 = (void *)qword_1000C9178;
            if (!os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
            {
LABEL_42:
              v72 = objc_claimAutoreleasedReturnValue(-[FitnessService createDatum:start:end:quantityType:](self, "createDatum:start:end:quantityType:", v6, v6, v7, (double)*((__int16 *)&a3->var0 + 1)));
              v73 = *p_lastDistributedDatum;
              *p_lastDistributedDatum = (HKQuantityDatum *)v72;

              v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lastDistributedDatum"));
              if (v74)
              {
                v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lastDistributedDatum"));
                v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "dateInterval"));
                v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "startDate"));
                objc_msgSend(v6, "timeIntervalSinceDate:", v77);
                v79 = fabs(v78);

                if (v79 >= 1.5)
                {
                  v102 = (void *)qword_1000C9178;
                  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
                    sub_10006BB3C(v102, self, (id *)&self->_lastDistributedDatum);
                }
                else
                {
                  v80 = (void *)objc_claimAutoreleasedReturnValue(-[HKQuantityDatum quantity](*p_lastDistributedDatum, "quantity"));
                  objc_msgSend(v80, "_value");
                  v82 = v81;
                  v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lastDistributedDatum"));
                  v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "quantity"));
                  objc_msgSend(v84, "_value");
                  -[CyclingPowerService powerBalanceForValue:otherService:otherValue:](self, "powerBalanceForValue:otherService:otherValue:", v9, v82, v85);
                  v87 = v86;

                  v88 = (void *)objc_claimAutoreleasedReturnValue(-[HKQuantityDatum quantity](*p_lastDistributedDatum, "quantity"));
                  objc_msgSend(v88, "_value");
                  v90 = v89;
                  v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lastDistributedDatum"));
                  v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "quantity"));
                  objc_msgSend(v92, "_value");
                  v94 = v90 + v93;

                  if (v94 < 0.0 || v94 >= 5000.0)
                  {
                    v103 = (void *)qword_1000C9178;
                    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
                    {
                      logd = v103;
                      v169 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
                      v148 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v169, "name"));
                      v163 = (void *)objc_claimAutoreleasedReturnValue(-[HKQuantityDatum quantity](*p_lastDistributedDatum, "quantity"));
                      objc_msgSend(v163, "_value");
                      v120 = v119;
                      v121 = (void *)objc_claimAutoreleasedReturnValue(-[CyclingPowerService sensorLocationSideString](self, "sensorLocationSideString"));
                      v153 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lastDistributedDatum"));
                      v122 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v153, "quantity"));
                      objc_msgSend(v122, "_value");
                      v124 = v123;
                      v125 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "peripheral"));
                      v126 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v125, "name"));
                      v127 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "sensorLocationSideString"));
                      *(_DWORD *)buf = 138414082;
                      v173 = v148;
                      v174 = 2048;
                      *(_QWORD *)v175 = v120;
                      *(_WORD *)&v175[8] = 2114;
                      *(_QWORD *)&v175[10] = v121;
                      *(_WORD *)&v175[18] = 2048;
                      *(_QWORD *)&v175[20] = v124;
                      v176 = 2112;
                      v177 = (uint64_t)v126;
                      v178 = 2114;
                      v179 = (uint64_t)v127;
                      v180 = 2048;
                      v181 = v94;
                      v182 = 2048;
                      v183 = v87;
                      _os_log_error_impl((void *)&_mh_execute_header, logd, OS_LOG_TYPE_ERROR, "“%@” READ CP Measurement POWER distributed combined units qty:%f (%{public}@) + %f (“%@” - %{public}@) -> %f (INVALID VALUE) balance:%f", buf, 0x52u);

                    }
                  }
                  else
                  {
                    v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lastDistributedDatum"));
                    v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "dateInterval"));
                    v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "startDate"));
                    v98 = (void *)objc_claimAutoreleasedReturnValue(-[FitnessService createDatum:start:end:quantityType:](self, "createDatum:start:end:quantityType:", v97, v6, v7, v94));

                    -[FitnessService recordDatum:forType:](self, "recordDatum:forType:", v98, v7);
                    v99 = (void *)objc_claimAutoreleasedReturnValue(-[CyclingPowerService comboHKDevice](self, "comboHKDevice"));
                    -[FitnessService storeDatumsForQuantityType:usingHKDevice:](self, "storeDatumsForQuantityType:usingHKDevice:", v7, v99);

                    v100 = (void *)qword_1000C9178;
                    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
                    {
                      logc = v100;
                      v168 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
                      v144 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v168, "name"));
                      v162 = (void *)objc_claimAutoreleasedReturnValue(-[HKQuantityDatum quantity](*p_lastDistributedDatum, "quantity"));
                      objc_msgSend(v162, "_value");
                      v112 = v111;
                      v113 = (void *)objc_claimAutoreleasedReturnValue(-[CyclingPowerService sensorLocationSideString](self, "sensorLocationSideString"));
                      v152 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lastDistributedDatum"));
                      v147 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v152, "quantity"));
                      objc_msgSend(v147, "_value");
                      v115 = v114;
                      v116 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "peripheral"));
                      v117 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v116, "name"));
                      v118 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "sensorLocationSideString"));
                      *(_DWORD *)buf = 138414082;
                      v173 = v144;
                      v174 = 2048;
                      *(_QWORD *)v175 = v112;
                      *(_WORD *)&v175[8] = 2114;
                      *(_QWORD *)&v175[10] = v113;
                      *(_WORD *)&v175[18] = 2048;
                      *(_QWORD *)&v175[20] = v115;
                      v176 = 2112;
                      v177 = (uint64_t)v117;
                      v178 = 2114;
                      v179 = (uint64_t)v118;
                      v180 = 2048;
                      v181 = v94;
                      v182 = 2048;
                      v183 = v87;
                      _os_log_debug_impl((void *)&_mh_execute_header, logc, OS_LOG_TYPE_DEBUG, "“%@” READ CP Measurement POWER distributed combined units qty:%f (%{public}@) + %f (“%@” - %{public}@) -> %f balance:%f", buf, 0x52u);

                    }
                  }
                  v104 = *p_lastDistributedDatum;
                  *p_lastDistributedDatum = 0;

                  objc_msgSend(v9, "setLastDistributedDatum:", 0);
                }
              }
              else
              {
                v101 = (void *)qword_1000C9178;
                if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
                  sub_10006BA34(v101, self, (id *)&self->_lastDistributedDatum);
              }
              goto LABEL_56;
            }
            v64 = v66;
            v167 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
            v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v167, "name"));
            v68 = (void *)objc_claimAutoreleasedReturnValue(-[HKQuantityDatum quantity](*p_lastDistributedDatum, "quantity"));
            objc_msgSend(v68, "_value");
            v70 = v69;
            v65 = (void *)objc_claimAutoreleasedReturnValue(-[CyclingPowerService sensorLocationSideString](self, "sensorLocationSideString"));
            *(_DWORD *)buf = 138413314;
            v173 = v67;
            v174 = 2048;
            *(_QWORD *)v175 = v70;
            *(_WORD *)&v175[8] = 2114;
            *(_QWORD *)&v175[10] = v65;
            *(_WORD *)&v175[18] = 2048;
            *(double *)&v175[20] = v58;
            v176 = 2048;
            v177 = 0x4049000000000000;
            _os_log_error_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_ERROR, "“%@” READ CP Measurement POWER distributed single unit doubling qty:%f (%{public}@) -> %f (INVALID VALUE) balance = %f", buf, 0x34u);

          }
          else
          {
            v59 = (void *)objc_claimAutoreleasedReturnValue(-[HKQuantityDatum dateInterval](*p_lastDistributedDatum, "dateInterval"));
            v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "startDate"));
            v61 = (void *)objc_claimAutoreleasedReturnValue(-[HKQuantityDatum dateInterval](*p_lastDistributedDatum, "dateInterval"));
            v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "endDate"));
            v166 = objc_claimAutoreleasedReturnValue(-[FitnessService createDatum:start:end:quantityType:](self, "createDatum:start:end:quantityType:", v60, v62, v7, v58));

            v63 = (void *)qword_1000C9178;
            if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
            {
              loga = v63;
              v161 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
              v151 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v161, "name"));
              v105 = (void *)objc_claimAutoreleasedReturnValue(-[HKQuantityDatum quantity](*p_lastDistributedDatum, "quantity"));
              objc_msgSend(v105, "_value");
              v107 = v106;
              v108 = (void *)objc_claimAutoreleasedReturnValue(-[CyclingPowerService sensorLocationSideString](self, "sensorLocationSideString"));
              v109 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject quantity](v166, "quantity"));
              objc_msgSend(v109, "_value");
              *(_DWORD *)buf = 138413314;
              v173 = v151;
              v174 = 2048;
              *(_QWORD *)v175 = v107;
              *(_WORD *)&v175[8] = 2114;
              *(_QWORD *)&v175[10] = v108;
              *(_WORD *)&v175[18] = 2048;
              *(_QWORD *)&v175[20] = v110;
              v176 = 2048;
              v177 = 0x4049000000000000;
              _os_log_debug_impl((void *)&_mh_execute_header, loga, OS_LOG_TYPE_DEBUG, "“%@” READ CP Measurement POWER distributed single unit doubling qty:%f (%{public}@) -> %f balance = %f", buf, 0x34u);

            }
            v64 = v166;
            -[FitnessService recordDatum:forType:](self, "recordDatum:forType:", v166, v7);
            v65 = (void *)objc_claimAutoreleasedReturnValue(-[CyclingPowerService comboHKDevice](self, "comboHKDevice"));
            -[FitnessService storeDatumsForQuantityType:usingHKDevice:](self, "storeDatumsForQuantityType:usingHKDevice:", v7, v65);
          }

          goto LABEL_42;
        }
      }
    }
    if (self->fCurrentDataIsDuplicate
      && -[CyclingPowerService sendDuplicateReadingsAsZero](self, "sendDuplicateReadingsAsZero"))
    {
      v40 = 0;
      v41 = 1;
    }
    else
    {
      v40 = *((__int16 *)&a3->var0 + 1);
      if ((unsigned __int16)(*((_WORD *)&a3->var0 + 1) >> 3) > 0x270u)
      {
        v53 = (void *)qword_1000C9178;
        if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
          sub_10006B98C(v53, self);
        goto LABEL_56;
      }
      v41 = 0;
    }
    -[FitnessService recordDatum:start:end:quantityType:](self, "recordDatum:start:end:quantityType:", v6, v6, v7, (double)v40);
    -[FitnessService storeDatumsForQuantityType:](self, "storeDatumsForQuantityType:", v7);
    var0 = (__int16)a3->var0;
    v43 = (void *)qword_1000C9178;
    v44 = os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG);
    if ((var0 & 1) != 0)
    {
      if (v44)
      {
        LOBYTE(v45) = a3->var1;
        v54 = (double)v45 * 0.5;
        v46 = v43;
        v47 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
        v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "name"));
        v55 = &stru_1000AE858;
        *(_DWORD *)buf = 138413058;
        v174 = 1024;
        v173 = v48;
        if (v41)
          v55 = CFSTR("DUPLICATE");
        *(_DWORD *)v175 = v40;
        *(_WORD *)&v175[4] = 2114;
        *(_QWORD *)&v175[6] = v55;
        *(_WORD *)&v175[14] = 2048;
        *(double *)&v175[16] = v54;
        v50 = "“%@” READ CP Measurement POWER non-distributed qty:%d %{public}@ balance:%f";
        v51 = v46;
        v52 = 38;
        goto LABEL_30;
      }
    }
    else if (v44)
    {
      v46 = v43;
      v47 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
      v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "name"));
      v49 = &stru_1000AE858;
      *(_DWORD *)buf = 138412802;
      v173 = v48;
      if (v41)
        v49 = CFSTR("DUPLICATE");
      v174 = 1024;
      *(_DWORD *)v175 = v40;
      *(_WORD *)&v175[4] = 2114;
      *(_QWORD *)&v175[6] = v49;
      v50 = "“%@” READ CP Measurement POWER non-distributed qty:%d %{public}@ (no balance data)";
      v51 = v46;
      v52 = 28;
LABEL_30:
      _os_log_debug_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEBUG, v50, buf, v52);

    }
LABEL_56:

  }
}

- (void)updatedMeasurementCharacteristicValue:(id)a3 at:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  char *v11;
  __int16 v12;
  __int16 v13;
  void *v14;
  void *v15;
  char *v16;
  void *v17;
  void *v18;
  __int16 v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  char *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  char *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  _BOOL4 v37;
  BOOL *p_fCurrentDataIsDuplicate;
  void *v39;
  void *v40;
  char *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  NSDate *v50;
  NSDate *firstDuplicateEventTimeStamp;
  double v52;
  int v53;
  void *v54;
  __int128 v55;
  void *v56;
  int v57;
  const __CFString *v58;
  const __CFString *v59;
  _BOOL4 v60;
  uint64_t v61;
  NSObject *log;
  void *v63;
  __int128 v64;
  __int128 v65;
  _DWORD v66[4];
  uint8_t buf[4];
  void *v68;
  __int16 v69;
  int v70;
  __int16 v71;
  const __CFString *v72;
  __int16 v73;
  const __CFString *v74;
  __int16 v75;
  _BOOL4 v76;
  __int16 v77;
  uint64_t v78;
  __int16 v79;
  int v80;

  v5 = a4;
  v66[0] = 0;
  v64 = 0u;
  v65 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CyclingPowerService cyclingPowerMeasurementCharacteristic](self, "cyclingPowerMeasurementCharacteristic"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "value"));
  v8 = -[FitnessService readBytesFromNSData:into:startingAt:length:info:](self, "readBytesFromNSData:into:startingAt:length:info:", v7, &v64, 0, 2, CFSTR("CPM - status flags"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CyclingPowerService cyclingPowerMeasurementCharacteristic](self, "cyclingPowerMeasurementCharacteristic"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "value"));
  v11 = (char *)-[FitnessService readBytesFromNSData:into:startingAt:length:info:](self, "readBytesFromNSData:into:startingAt:length:info:", v10, (char *)&v64 + 2, v8, 2, CFSTR("CPM - instantaneous power"))+ v8;

  v12 = v64;
  if ((v64 & 1) != 0)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CyclingPowerService cyclingPowerMeasurementCharacteristic](self, "cyclingPowerMeasurementCharacteristic"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "value"));
    v11 = &v11[-[FitnessService readBytesFromNSData:into:startingAt:length:info:](self, "readBytesFromNSData:into:startingAt:length:info:", v21, (char *)&v64 + 4, v11, 1, CFSTR("CPM - power balance"))];

    v12 = v64;
    if ((v64 & 4) == 0)
    {
LABEL_3:
      if ((v12 & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else if ((v64 & 4) == 0)
  {
    goto LABEL_3;
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CyclingPowerService cyclingPowerMeasurementCharacteristic](self, "cyclingPowerMeasurementCharacteristic"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "value"));
  v11 = &v11[-[FitnessService readBytesFromNSData:into:startingAt:length:info:](self, "readBytesFromNSData:into:startingAt:length:info:", v23, (char *)&v64 + 6, v11, 2, CFSTR("CPM - accumulated torque"))];

  v12 = v64;
  if ((v64 & 0x10) == 0)
  {
LABEL_4:
    v13 = v12;
    if ((v12 & 0x20) != 0)
      goto LABEL_5;
LABEL_10:
    v19 = v13;
    if ((v13 & 0x40) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_9:
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[CyclingPowerService cyclingPowerMeasurementCharacteristic](self, "cyclingPowerMeasurementCharacteristic"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "value"));
  v26 = &v11[-[FitnessService readBytesFromNSData:into:startingAt:length:info:](self, "readBytesFromNSData:into:startingAt:length:info:", v25, (char *)&v64 + 8, v11, 4, CFSTR("CPM - wheel revolutions"))];

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[CyclingPowerService cyclingPowerMeasurementCharacteristic](self, "cyclingPowerMeasurementCharacteristic"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "value"));
  v11 = &v26[-[FitnessService readBytesFromNSData:into:startingAt:length:info:](self, "readBytesFromNSData:into:startingAt:length:info:", v28, (unint64_t)&v64 | 0xC, v26, 2, CFSTR("CPM - wheel event time"))];

  v13 = v64;
  if ((v64 & 0x20) == 0)
    goto LABEL_10;
LABEL_5:
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CyclingPowerService cyclingPowerMeasurementCharacteristic](self, "cyclingPowerMeasurementCharacteristic"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "value"));
  v16 = &v11[-[FitnessService readBytesFromNSData:into:startingAt:length:info:](self, "readBytesFromNSData:into:startingAt:length:info:", v15, (unint64_t)&v64 | 0xE, v11, 2, CFSTR("CPM - crank revolutions"))];

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CyclingPowerService cyclingPowerMeasurementCharacteristic](self, "cyclingPowerMeasurementCharacteristic"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "value"));
  v11 = &v16[-[FitnessService readBytesFromNSData:into:startingAt:length:info:](self, "readBytesFromNSData:into:startingAt:length:info:", v18, &v65, v16, 2, CFSTR("CPM - crank event time"))];

  v19 = v64;
  if ((v64 & 0x40) != 0)
  {
LABEL_11:
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[CyclingPowerService cyclingPowerMeasurementCharacteristic](self, "cyclingPowerMeasurementCharacteristic"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "value"));
    v31 = &v11[-[FitnessService readBytesFromNSData:into:startingAt:length:info:](self, "readBytesFromNSData:into:startingAt:length:info:", v30, (char *)&v65 + 2, v11, 2, CFSTR("CPM - extreme force magnitude max"))];

    v32 = (void *)objc_claimAutoreleasedReturnValue(-[CyclingPowerService cyclingPowerMeasurementCharacteristic](self, "cyclingPowerMeasurementCharacteristic"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "value"));
    v11 = &v31[-[FitnessService readBytesFromNSData:into:startingAt:length:info:](self, "readBytesFromNSData:into:startingAt:length:info:", v33, (char *)&v65 + 4, v31, 2, CFSTR("CPM - extreme force magnitude min"))];

    v19 = v64;
  }
LABEL_12:
  if ((v19 & 0x80) != 0)
  {
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[CyclingPowerService cyclingPowerMeasurementCharacteristic](self, "cyclingPowerMeasurementCharacteristic"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "value"));
    v41 = &v11[-[FitnessService readBytesFromNSData:into:startingAt:length:info:](self, "readBytesFromNSData:into:startingAt:length:info:", v40, (char *)&v65 + 6, v11, 2, CFSTR("CPM - extreme torque magnitude max"))];

    v42 = (void *)objc_claimAutoreleasedReturnValue(-[CyclingPowerService cyclingPowerMeasurementCharacteristic](self, "cyclingPowerMeasurementCharacteristic"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "value"));
    v11 = &v41[-[FitnessService readBytesFromNSData:into:startingAt:length:info:](self, "readBytesFromNSData:into:startingAt:length:info:", v43, (char *)&v65 + 8, v41, 2, CFSTR("CPM - extreme torque magnitude min"))];

    v19 = v64;
    if ((v64 & 0x100) == 0)
    {
LABEL_14:
      if ((v19 & 0x200) == 0)
        goto LABEL_15;
      goto LABEL_25;
    }
  }
  else if ((v19 & 0x100) == 0)
  {
    goto LABEL_14;
  }
  *(_DWORD *)buf = 0;
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[CyclingPowerService cyclingPowerMeasurementCharacteristic](self, "cyclingPowerMeasurementCharacteristic"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "value"));
  v11 = &v11[-[FitnessService readBytesFromNSData:into:startingAt:length:info:](self, "readBytesFromNSData:into:startingAt:length:info:", v45, buf, v11, 4, CFSTR("CPM - extreme angles"))];

  WORD5(v65) = *(_WORD *)buf & 0xFFF;
  WORD6(v65) = (*(_DWORD *)buf >> 12) & 0xFFF;
  v19 = v64;
  if ((v64 & 0x200) == 0)
  {
LABEL_15:
    if ((v19 & 0x400) == 0)
      goto LABEL_16;
    goto LABEL_26;
  }
LABEL_25:
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[CyclingPowerService cyclingPowerMeasurementCharacteristic](self, "cyclingPowerMeasurementCharacteristic"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "value"));
  v11 = &v11[-[FitnessService readBytesFromNSData:into:startingAt:length:info:](self, "readBytesFromNSData:into:startingAt:length:info:", v47, (char *)&v65 + 14, v11, 2, CFSTR("CPM - top dead spot angle"))];

  v19 = v64;
  if ((v64 & 0x400) == 0)
  {
LABEL_16:
    if ((v19 & 0x800) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
LABEL_26:
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[CyclingPowerService cyclingPowerMeasurementCharacteristic](self, "cyclingPowerMeasurementCharacteristic"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "value"));
  v11 = &v11[-[FitnessService readBytesFromNSData:into:startingAt:length:info:](self, "readBytesFromNSData:into:startingAt:length:info:", v49, v66, v11, 2, CFSTR("CPM - bottom dead spot angle"))];

  if ((v64 & 0x800) != 0)
  {
LABEL_17:
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[CyclingPowerService cyclingPowerMeasurementCharacteristic](self, "cyclingPowerMeasurementCharacteristic"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "value"));
    -[FitnessService readBytesFromNSData:into:startingAt:length:info:](self, "readBytesFromNSData:into:startingAt:length:info:", v35, (char *)v66 + 2, v11, 2, CFSTR("CPM - accumulated energy"));

  }
LABEL_18:
  if (WORD1(v64) == *((unsigned __int16 *)&self->lastPowerMeasurementReading.cycling_power_status_flags + 1))
  {
    v36 = *(_DWORD *)&self->_sendZeroForDuplicates & 0xC;
    v37 = v36 != 0;
    p_fCurrentDataIsDuplicate = &self->fCurrentDataIsDuplicate;
    self->fCurrentDataIsDuplicate = v37;
    if ((v12 & 0x10) == 0)
    {
      if ((v13 & 0x20) == 0)
        goto LABEL_21;
      goto LABEL_36;
    }
    if (v36 && DWORD2(v64) == *(_DWORD *)&self->lastPowerMeasurementReading.accumulated_torque)
    {
      v37 = WORD6(v64) == LOWORD(self->lastPowerMeasurementReading.wheel_revolution_data);
      goto LABEL_35;
    }
  }
  else
  {
    p_fCurrentDataIsDuplicate = &self->fCurrentDataIsDuplicate;
    self->fCurrentDataIsDuplicate = 0;
    if ((v12 & 0x10) == 0)
    {
      if ((v13 & 0x20) == 0)
        goto LABEL_43;
      goto LABEL_39;
    }
  }
  v37 = 0;
LABEL_35:
  *p_fCurrentDataIsDuplicate = v37;
  if ((v13 & 0x20) == 0)
  {
LABEL_21:
    if (!v37)
      goto LABEL_43;
    goto LABEL_41;
  }
LABEL_36:
  if (!v37)
    goto LABEL_40;
  if (HIWORD(v64) == HIWORD(self->lastPowerMeasurementReading.wheel_revolution_data))
  {
    v37 = (unsigned __int16)v65 == self->lastPowerMeasurementReading.last_wheel_event_time;
    goto LABEL_40;
  }
LABEL_39:
  v37 = 0;
LABEL_40:
  *p_fCurrentDataIsDuplicate = v37;
  if (!v37)
  {
LABEL_43:
    firstDuplicateEventTimeStamp = self->firstDuplicateEventTimeStamp;
    self->firstDuplicateEventTimeStamp = 0;
    goto LABEL_44;
  }
LABEL_41:
  if (!self->firstDuplicateEventTimeStamp)
  {
    v50 = (NSDate *)v5;
    firstDuplicateEventTimeStamp = self->firstDuplicateEventTimeStamp;
    self->firstDuplicateEventTimeStamp = v50;
LABEL_44:

  }
  if (*p_fCurrentDataIsDuplicate
    && -[CyclingPowerService sendZeroForDuplicates](self, "sendZeroForDuplicates")
    && (objc_msgSend(v5, "timeIntervalSinceDate:", self->firstDuplicateEventTimeStamp), v52 < 1.5))
  {
    v53 = 0;
  }
  else
  {
    if ((v12 & 0x10) != 0)
      -[CyclingPowerService updatedSpeedMeasurementValueForRevolutions:andWheelEventTime:timeStamp:](self, "updatedSpeedMeasurementValueForRevolutions:andWheelEventTime:timeStamp:", DWORD2(v64), WORD6(v64), v5);
    if ((v13 & 0x20) != 0)
      -[CyclingPowerService updatedCadenceMeasurementValueForRevolutions:andCrankEventTime:timeStamp:](self, "updatedCadenceMeasurementValueForRevolutions:andCrankEventTime:timeStamp:", HIWORD(v64), (unsigned __int16)v65, v5);
    -[CyclingPowerService updatedPowerMeasurementValue:timeStamp:](self, "updatedPowerMeasurementValue:timeStamp:", &v64, v5);
    v53 = 1;
  }
  v54 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
  {
    log = v54;
    v63 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "name"));
    v57 = SWORD1(v64);
    if ((v12 & 0x10) != 0)
      v58 = CFSTR("✓");
    else
      v58 = &stru_1000AE858;
    if ((v13 & 0x20) != 0)
      v59 = CFSTR("✓");
    else
      v59 = &stru_1000AE858;
    v60 = *p_fCurrentDataIsDuplicate;
    objc_msgSend(v5, "timeIntervalSinceDate:", self->firstDuplicateEventTimeStamp);
    *(_DWORD *)buf = 138413826;
    v68 = v56;
    v69 = 1024;
    v70 = v57;
    v71 = 2112;
    v72 = v58;
    v73 = 2112;
    v74 = v59;
    v75 = 1024;
    v76 = v60;
    v77 = 2048;
    v78 = v61;
    v79 = 1024;
    v80 = v53;
    _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "“%@” Measurement - POWER:%d SPEED:%@ CADENCE:%@ duplicate:%d secondsSinceFirstDuplicate:%f sending:%d", buf, 0x3Cu);

  }
  v55 = v65;
  *(_OWORD *)&self->lastPowerMeasurementReading.cycling_power_status_flags = v64;
  *(_OWORD *)&self->lastPowerMeasurementReading.last_wheel_event_time = v55;
  *(_DWORD *)&self->lastPowerMeasurementReading.min_angle = v66[0];

}

- (void)updatedVectorCharacteristicValue
{
  void *v3;
  void *v4;
  char *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  int v19;

  v19 = 0;
  v18 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CyclingPowerService cyclingPowerVectorCharacteristic](self, "cyclingPowerVectorCharacteristic"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "value"));
  v5 = -[FitnessService readBytesFromNSData:into:startingAt:length:info:](self, "readBytesFromNSData:into:startingAt:length:info:", v4, &v18, 0, 1, CFSTR("CPV - status flags"));

  v6 = v18;
  if ((v18 & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CyclingPowerService cyclingPowerVectorCharacteristic](self, "cyclingPowerVectorCharacteristic"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "value"));
    v11 = &v5[-[FitnessService readBytesFromNSData:into:startingAt:length:info:](self, "readBytesFromNSData:into:startingAt:length:info:", v10, (char *)&v18 + 2, v5, 2, CFSTR("CPV - crank revolutions"))];

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CyclingPowerService cyclingPowerVectorCharacteristic](self, "cyclingPowerVectorCharacteristic"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "value"));
    v5 = &v11[-[FitnessService readBytesFromNSData:into:startingAt:length:info:](self, "readBytesFromNSData:into:startingAt:length:info:", v13, (char *)&v18 + 4, v11, 2, CFSTR("CPV - crank time"))];

    v6 = v18;
    if ((v18 & 2) == 0)
    {
LABEL_3:
      if ((v6 & 4) == 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else if ((v18 & 2) == 0)
  {
    goto LABEL_3;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CyclingPowerService cyclingPowerVectorCharacteristic](self, "cyclingPowerVectorCharacteristic"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "value"));
  v5 = &v5[-[FitnessService readBytesFromNSData:into:startingAt:length:info:](self, "readBytesFromNSData:into:startingAt:length:info:", v15, (char *)&v18 + 6, v5, 2, CFSTR("CPV - first crank measurement angle"))];

  v6 = v18;
  if ((v18 & 4) == 0)
  {
LABEL_4:
    if ((v6 & 8) == 0)
      return;
    goto LABEL_5;
  }
LABEL_9:
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CyclingPowerService cyclingPowerVectorCharacteristic](self, "cyclingPowerVectorCharacteristic"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "value"));
  v5 = &v5[-[FitnessService readBytesFromNSData:into:startingAt:length:info:](self, "readBytesFromNSData:into:startingAt:length:info:", v17, &v19, v5, 2, CFSTR("CPV - instantaneous force magnitude array"))];

  if ((v18 & 8) == 0)
    return;
LABEL_5:
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CyclingPowerService cyclingPowerVectorCharacteristic](self, "cyclingPowerVectorCharacteristic"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "value"));
  -[FitnessService readBytesFromNSData:into:startingAt:length:info:](self, "readBytesFromNSData:into:startingAt:length:info:", v8, (char *)&v19 + 2, v5, 2, CFSTR("CPV - instantaneous torque magnitude array"));

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
  unsigned int v29;
  void *v30;
  void *v31;
  void *v32;
  unsigned int v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];

  v38 = a3;
  if (!a5)
  {
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "characteristics"));
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v41;
      v39 = CBUUIDSensorLocation;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v41 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[CyclingPowerService cyclingPowerSensorLocationCharacteristic](self, "cyclingPowerSensorLocationCharacteristic", v38));
          if (v14)
          {

          }
          else
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "UUID"));
            v16 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", v39));
            v17 = objc_msgSend(v15, "isEqual:", v16);

            if (v17)
            {
              -[CyclingPowerService setCyclingPowerSensorLocationCharacteristic:](self, "setCyclingPowerSensorLocationCharacteristic:", v13);
LABEL_15:
              -[FitnessService setNotify:forCharacteristic:](self, "setNotify:forCharacteristic:", 1, v13);
              objc_msgSend(v38, "readValueForCharacteristic:", v13);
              goto LABEL_29;
            }
          }
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[CyclingPowerService cyclingPowerFeatureCharacteristic](self, "cyclingPowerFeatureCharacteristic"));
          if (v18)
          {

          }
          else
          {
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "UUID"));
            v20 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("0x2A65")));
            v21 = objc_msgSend(v19, "isEqual:", v20);

            if (v21)
            {
              -[CyclingPowerService setCyclingPowerFeatureCharacteristic:](self, "setCyclingPowerFeatureCharacteristic:", v13);
              goto LABEL_15;
            }
          }
          v22 = (void *)objc_claimAutoreleasedReturnValue(-[CyclingPowerService cyclingPowerControlPointCharacteristic](self, "cyclingPowerControlPointCharacteristic"));
          if (v22)
          {

          }
          else
          {
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "UUID"));
            v24 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("0x2A66")));
            v25 = objc_msgSend(v23, "isEqual:", v24);

            if (v25)
            {
              -[CyclingPowerService setCyclingPowerControlPointCharacteristic:](self, "setCyclingPowerControlPointCharacteristic:", v13);
LABEL_28:
              -[FitnessService setNotify:forCharacteristic:](self, "setNotify:forCharacteristic:", 0, v13);
              goto LABEL_29;
            }
          }
          v26 = (void *)objc_claimAutoreleasedReturnValue(-[CyclingPowerService cyclingPowerMeasurementCharacteristic](self, "cyclingPowerMeasurementCharacteristic"));
          if (v26)
          {

          }
          else
          {
            v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "UUID"));
            v28 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("0x2A63")));
            v29 = objc_msgSend(v27, "isEqual:", v28);

            if (v29)
            {
              -[CyclingPowerService setCyclingPowerMeasurementCharacteristic:](self, "setCyclingPowerMeasurementCharacteristic:", v13);
              goto LABEL_28;
            }
          }
          v30 = (void *)objc_claimAutoreleasedReturnValue(-[CyclingPowerService cyclingPowerVectorCharacteristic](self, "cyclingPowerVectorCharacteristic"));
          if (v30)
          {

            goto LABEL_29;
          }
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "UUID"));
          v32 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("0x2A64")));
          v33 = objc_msgSend(v31, "isEqual:", v32);

          if (v33)
          {
            -[CyclingPowerService setCyclingPowerVectorCharacteristic:](self, "setCyclingPowerVectorCharacteristic:", v13);
            goto LABEL_28;
          }
LABEL_29:
          v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
      }
      while (v10);
    }

    -[ClientService notifyDidStart](self, "notifyDidStart");
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[CyclingPowerService cyclingPowerMeasurementCharacteristic](self, "cyclingPowerMeasurementCharacteristic"));

    if (!v34 && os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_10006BCA4();
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[CyclingPowerService cyclingPowerVectorCharacteristic](self, "cyclingPowerVectorCharacteristic", v38));

    if (!v35 && os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_10006BC78();
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[CyclingPowerService cyclingPowerFeatureCharacteristic](self, "cyclingPowerFeatureCharacteristic"));

    if (!v36 && os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_10006BC4C();
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[CyclingPowerService cyclingPowerControlPointCharacteristic](self, "cyclingPowerControlPointCharacteristic"));

    if (!v37 && os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_10006BC20();
  }

}

- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;

  v7 = a4;
  if (!a5)
  {
    v15 = v7;
    v8 = (id)objc_claimAutoreleasedReturnValue(-[CyclingPowerService cyclingPowerSensorLocationCharacteristic](self, "cyclingPowerSensorLocationCharacteristic"));

    if (v8 == v15)
    {
      -[CyclingPowerService updatedSensorLocationCharacteristicValue](self, "updatedSensorLocationCharacteristicValue");
      goto LABEL_12;
    }
    v9 = (id)objc_claimAutoreleasedReturnValue(-[CyclingPowerService cyclingPowerFeatureCharacteristic](self, "cyclingPowerFeatureCharacteristic"));

    if (v9 == v15)
    {
      -[CyclingPowerService updatedFeatureCharacteristicValue](self, "updatedFeatureCharacteristicValue");
      goto LABEL_12;
    }
    v10 = (id)objc_claimAutoreleasedReturnValue(-[CyclingPowerService cyclingPowerControlPointCharacteristic](self, "cyclingPowerControlPointCharacteristic"));

    if (v10 == v15)
    {
      -[CyclingPowerService updatedControlPointCharacteristicValue](self, "updatedControlPointCharacteristicValue");
      goto LABEL_12;
    }
    v11 = (id)objc_claimAutoreleasedReturnValue(-[CyclingPowerService cyclingPowerMeasurementCharacteristic](self, "cyclingPowerMeasurementCharacteristic"));

    if (v11 == v15)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "value"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
      -[CyclingPowerService updatedMeasurementCharacteristicValue:at:](self, "updatedMeasurementCharacteristicValue:at:", v13, v14);

      goto LABEL_12;
    }
    v12 = (id)objc_claimAutoreleasedReturnValue(-[CyclingPowerService cyclingPowerVectorCharacteristic](self, "cyclingPowerVectorCharacteristic"));

    v7 = v15;
    if (v12 == v15)
    {
      -[CyclingPowerService updatedVectorCharacteristicValue](self, "updatedVectorCharacteristicValue");
LABEL_12:
      v7 = v15;
    }
  }

}

- (CBCharacteristic)cyclingPowerMeasurementCharacteristic
{
  return self->_cyclingPowerMeasurementCharacteristic;
}

- (void)setCyclingPowerMeasurementCharacteristic:(id)a3
{
  objc_storeStrong((id *)&self->_cyclingPowerMeasurementCharacteristic, a3);
}

- (CBCharacteristic)cyclingPowerVectorCharacteristic
{
  return self->_cyclingPowerVectorCharacteristic;
}

- (void)setCyclingPowerVectorCharacteristic:(id)a3
{
  objc_storeStrong((id *)&self->_cyclingPowerVectorCharacteristic, a3);
}

- (CBCharacteristic)cyclingPowerFeatureCharacteristic
{
  return self->_cyclingPowerFeatureCharacteristic;
}

- (void)setCyclingPowerFeatureCharacteristic:(id)a3
{
  objc_storeStrong((id *)&self->_cyclingPowerFeatureCharacteristic, a3);
}

- (CBCharacteristic)cyclingPowerSensorLocationCharacteristic
{
  return self->_cyclingPowerSensorLocationCharacteristic;
}

- (void)setCyclingPowerSensorLocationCharacteristic:(id)a3
{
  objc_storeStrong((id *)&self->_cyclingPowerSensorLocationCharacteristic, a3);
}

- (CBCharacteristic)cyclingPowerControlPointCharacteristic
{
  return self->_cyclingPowerControlPointCharacteristic;
}

- (void)setCyclingPowerControlPointCharacteristic:(id)a3
{
  objc_storeStrong((id *)&self->_cyclingPowerControlPointCharacteristic, a3);
}

- ($871CC4E288729A363A5AD5845BFA35DE)featureFlags
{
  return *($871CC4E288729A363A5AD5845BFA35DE *)&self->_sendZeroForDuplicates;
}

- (void)setFeatureFlags:(id)a3
{
  *($871CC4E288729A363A5AD5845BFA35DE *)&self->_sendZeroForDuplicates = a3;
}

- (double)wheelDiameterInInches
{
  return self->_wheelDiameterInInches;
}

- (void)setWheelDiameterInInches:(double)a3
{
  self->_wheelDiameterInInches = a3;
}

- (HKQuantityDatum)lastDistributedDatum
{
  return self->_lastDistributedDatum;
}

- (void)setLastDistributedDatum:(id)a3
{
  objc_storeStrong((id *)&self->_lastDistributedDatum, a3);
}

- (HKDevice)comboHKDevice
{
  return self->_comboHKDevice;
}

- (void)setComboHKDevice:(id)a3
{
  objc_storeStrong((id *)&self->_comboHKDevice, a3);
}

- (BOOL)sendZeroForDuplicates
{
  return self->lastPowerMeasurementReading.bottom_dead_spot_angle;
}

- (void)setSendZeroForDuplicates:(BOOL)a3
{
  LOBYTE(self->lastPowerMeasurementReading.bottom_dead_spot_angle) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_comboHKDevice, 0);
  objc_storeStrong((id *)&self->_lastDistributedDatum, 0);
  objc_storeStrong((id *)&self->_cyclingPowerControlPointCharacteristic, 0);
  objc_storeStrong((id *)&self->_cyclingPowerSensorLocationCharacteristic, 0);
  objc_storeStrong((id *)&self->_cyclingPowerFeatureCharacteristic, 0);
  objc_storeStrong((id *)&self->_cyclingPowerVectorCharacteristic, 0);
  objc_storeStrong((id *)&self->_cyclingPowerMeasurementCharacteristic, 0);
  objc_storeStrong((id *)&self->firstDuplicateEventTimeStamp, 0);
}

@end
