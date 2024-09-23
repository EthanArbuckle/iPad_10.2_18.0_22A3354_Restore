@implementation HIDApplePencilGen3Device

+ (unint64_t)btClockMask
{
  return 0xFFFFFFFLL;
}

+ (BOOL)hasWirelessCharging
{
  return 1;
}

- (HIDApplePencilGen3Device)initWithProperties:(id)a3 reports:(id)a4
{
  HIDApplePencilGen3Device *v4;
  double v5;

  v4 = -[HIDApplePencilGen2Device initWithProperties:reports:loggingIdentifier:](self, "initWithProperties:reports:loggingIdentifier:", a3, a4, CFSTR("Pencil3"));
  LODWORD(v5) = 15.0;
  -[HIDApplePencilGen3Device setPreferredInterval:](v4, "setPreferredInterval:", v5);
  -[HIDApplePencilGen3Device setLatency:](v4, "setLatency:", 65);
  -[HIDApplePencilGen2Device publishProperties](v4, "publishProperties");

  return v4;
}

- (id)newUserDevices:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[6];
  _QWORD v17[6];

  v4 = a3;
  v5 = -[HIDApplePencilGen2Device newDeviceMgntDevice:keyholeID:](self, "newDeviceMgntDevice:keyholeID:", v4, 0);
  v6 = -[HIDApplePencilGen2Device newTouchDevice:keyholeID:](self, "newTouchDevice:keyholeID:", v4, 1);
  v7 = -[HIDApplePencilGen3Device newMotionDevice:keyholeID:](self, "newMotionDevice:keyholeID:", v4, 2);
  v8 = -[HIDApplePencilGen3Device newHapticsDevice:keyholeID:](self, "newHapticsDevice:keyholeID:", v4, 3);
  v9 = -[HIDApplePencilGen2p5Device newFwUpgradeDevice:keyholeID:](self, "newFwUpgradeDevice:keyholeID:", v4, 5);
  v10 = -[HIDApplePencilGen2Device newForceDevice:keyholeID:](self, "newForceDevice:keyholeID:", v4, 8);

  if (!v5)
  {
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_10006AD6C();
    goto LABEL_21;
  }
  if (!v6)
  {
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_10006AD98();
    goto LABEL_21;
  }
  if (!v7)
  {
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_10006ADC4();
    goto LABEL_21;
  }
  if (!v8)
  {
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_10006ADF0();
    goto LABEL_21;
  }
  if (!v9)
  {
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_10006AE1C();
    goto LABEL_21;
  }
  if (!v10)
  {
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_10006AE48();
LABEL_21:
    v14 = 0;
    goto LABEL_8;
  }
  v16[0] = &off_1000B3420;
  v16[1] = &off_1000B3438;
  v17[0] = v5;
  v17[1] = v6;
  v16[2] = &off_1000B3450;
  v16[3] = &off_1000B3468;
  v17[2] = v7;
  v17[3] = v8;
  v16[4] = &off_1000B3480;
  v16[5] = &off_1000B3498;
  v17[4] = v9;
  v17[5] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v17, v16, 6));
  -[HIDApplePencilGen2Device setUserDevices:](self, "setUserDevices:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[HIDApplePencilGen2Device userDevices](self, "userDevices"));
  objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", &stru_1000AD400);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[HIDApplePencilGen2Device userDevices](self, "userDevices"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "allValues"));

LABEL_8:
  return v14;
}

- (id)newMotionDevice:(id)a3 keyholeID:(unsigned __int8)a4
{
  _OWORD v5[2];

  v5[0] = xmmword_1000863B1;
  *(_OWORD *)((char *)v5 + 12) = *(__int128 *)((char *)&xmmword_1000863B1 + 12);
  return -[HIDApplePencilDevice newUserDevice:descriptor:descriptorLength:keyholeID:](self, "newUserDevice:descriptor:descriptorLength:keyholeID:", a3, v5, 28, a4);
}

- (id)newHapticsDevice:(id)a3 keyholeID:(unsigned __int8)a4
{
  _OWORD v5[2];

  v5[0] = xmmword_1000863CD;
  *(_OWORD *)((char *)v5 + 14) = *(__int128 *)((char *)&xmmword_1000863CD + 14);
  return -[HIDApplePencilDevice newUserDevice:descriptor:descriptorLength:keyholeID:](self, "newUserDevice:descriptor:descriptorLength:keyholeID:", a3, v5, 30, a4);
}

- (int)sendOutputReportData:(id)a3 reportID:(unsigned __int8)a4 reportType:(int)a5
{
  uint64_t v5;
  uint64_t v6;
  id v8;
  id v9;
  _BYTE *v10;
  id v11;
  char *v12;
  char *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  int v20;
  objc_super v22;
  uint8_t buf[4];
  id v24;

  v5 = *(_QWORD *)&a5;
  v6 = a4;
  v8 = a3;
  v9 = v8;
  if ((_DWORD)v6 == 3)
  {
    v9 = objc_retainAutorelease(v8);
    v10 = objc_msgSend(v9, "bytes");
    if ((unint64_t)objc_msgSend(v9, "length") >= 9 && (*v10 & 0xFE) == 0x10)
    {
      v11 = objc_retainAutorelease(objc_msgSend(v9, "mutableCopy"));
      v12 = (char *)objc_msgSend(v11, "mutableBytes");
      if (*(_QWORD *)(v12 + 1))
      {
        v13 = v12;
        v14 = (void *)qword_1000C9178;
        if (os_signpost_enabled((os_log_t)qword_1000C9178))
        {
          v15 = v14;
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[HIDApplePencilGen2Device timestampSync](self, "timestampSync"));
          v17 = objc_msgSend(v16, "microsecToMachTime:", *(_QWORD *)(v13 + 1));
          *(_DWORD *)buf = 134349056;
          v24 = v17;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v15, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SendPencilFeedback", "%{public, signpost.description:begin_time}llu", buf, 0xCu);

        }
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[HIDApplePencilGen2Device timestampSync](self, "timestampSync"));
        *(_QWORD *)(v13 + 1) = objc_msgSend(v18, "applyInverseTimestampOffset:", *(_QWORD *)(v13 + 1));

      }
      v19 = objc_msgSend(v11, "copy");

      v9 = v19;
    }
  }
  v22.receiver = self;
  v22.super_class = (Class)HIDApplePencilGen3Device;
  v20 = -[HIDBluetoothDevice sendOutputReportData:reportID:reportType:](&v22, "sendOutputReportData:reportID:reportType:", v9, v6, v5);

  return v20;
}

- (void)setNormalConnParamDefaults
{
  void *v3;
  float v4;
  void *v5;
  double v6;
  uint64_t v7;
  id v8;

  v8 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("NormalConnInterval")));

  if (v3)
    v4 = (float)(int)objc_msgSend(v8, "integerForKey:", CFSTR("NormalConnInterval"));
  else
    v4 = 15.0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("NormalConnLatency")));

  if (v5)
    v7 = (uint64_t)objc_msgSend(v8, "integerForKey:", CFSTR("NormalConnLatency"));
  else
    v7 = 65;
  *(float *)&v6 = v4;
  -[HIDApplePencilGen3Device setPreferredInterval:](self, "setPreferredInterval:", v6);
  -[HIDApplePencilGen3Device setLatency:](self, "setLatency:", v7);

}

- (void)setChargingConnParamDefaults
{
  void *v3;
  float v4;
  void *v5;
  double v6;
  uint64_t v7;
  id v8;

  v8 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("ChargingConnInterval")));

  if (v3)
    v4 = (float)(int)objc_msgSend(v8, "integerForKey:", CFSTR("ChargingConnInterval"));
  else
    v4 = 15.0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("ChargingConnLatency")));

  if (v5)
    v7 = (uint64_t)objc_msgSend(v8, "integerForKey:", CFSTR("ChargingConnLatency"));
  else
    v7 = 7;
  *(float *)&v6 = v4;
  -[HIDApplePencilGen3Device setPreferredInterval:](self, "setPreferredInterval:", v6);
  -[HIDApplePencilGen3Device setLatency:](self, "setLatency:", v7);

}

- (id)desiredConnectionParameters
{
  id v3;
  void *v4;
  float v5;
  float v6;
  float v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HIDApplePencilGen3Device;
  v3 = -[HIDApplePencilGen2Device desiredConnectionParameters](&v9, "desiredConnectionParameters");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  -[HIDApplePencilGen3Device preferredInterval](self, "preferredInterval");
  objc_msgSend(v4, "setMinInterval:");
  -[HIDApplePencilGen3Device preferredInterval](self, "preferredInterval");
  objc_msgSend(v4, "setPreferredInterval:");
  objc_msgSend(v4, "setPreferredPeripheralLatency:", -[HIDApplePencilGen3Device latency](self, "latency"));
  objc_msgSend(v4, "setMaxPeripheralLatency:", -[HIDApplePencilGen3Device latency](self, "latency"));
  v5 = (float)(int)(objc_msgSend(v4, "preferredPeripheralLatency") + 1);
  objc_msgSend(v4, "preferredInterval");
  v7 = (float)((float)(v6 * v5) * 4.0) + 1.0;
  if (v7 < 2000.0)
    v7 = 2000.0;
  objc_msgSend(v4, "setTimeout:", (int)v7);
  return v4;
}

- (void)chargerStateChanged:(unsigned __int8)a3
{
  uint64_t v3;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  _BOOL8 v9;
  objc_super v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  void *v14;

  v3 = a3;
  v5 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[HIDApplePencilDevice loggingIdentifier](self, "loggingIdentifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[HIDChargerNotifier stateToStr:](HIDChargerNotifier, "stateToStr:", v3));
    *(_DWORD *)buf = 138412546;
    v12 = v7;
    v13 = 2112;
    v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ received HID charger notification: %@", buf, 0x16u);

  }
  if ((_DWORD)v3 == 1)
    -[HIDApplePencilGen3Device setChargingConnParamDefaults](self, "setChargingConnParamDefaults");
  else
    -[HIDApplePencilGen3Device setNormalConnParamDefaults](self, "setNormalConnParamDefaults");
  v9 = (_DWORD)v3 == 1;
  -[HIDBluetoothDevice notifyDesiredConnectionParametersDidChange](self, "notifyDesiredConnectionParametersDidChange");
  -[HIDApplePencilGen2Device notifyPencilOnChargerState:](self, "notifyPencilOnChargerState:", v9);
  -[HIDApplePencilGen3Device notifyDownstreamOnChargerState:](self, "notifyDownstreamOnChargerState:", v9);
  v10.receiver = self;
  v10.super_class = (Class)HIDApplePencilGen3Device;
  -[HIDApplePencilGen2Device chargeStateCollection:](&v10, "chargeStateCollection:", v9);
}

- (void)pairingInfoCompleted
{
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;

  v3 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[HIDApplePencilDevice loggingIdentifier](self, "loggingIdentifier"));
    v6 = 138412290;
    v7 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@ received pairing info", (uint8_t *)&v6, 0xCu);

  }
}

- (void)authCompleted:(BOOL)a3
{
  void *v5;

  v5 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
    sub_10006AE74(v5, self, a3);
}

- (void)notifyDownstreamOnChargerState:(BOOL)a3
{
  void *v3;
  _BYTE v4[2];

  v4[0] = -1;
  v4[1] = a3;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HIDApplePencilGen2Device deviceMgntUserDevice](self, "deviceMgntUserDevice"));
  objc_msgSend(v3, "handleInputReport:reportLength:", v4, 2);

}

- (void)checkAndLogHostInputReportCollision:(unsigned __int8)a3 reportID:(unsigned __int8)a4
{
  NSObject *v4;

  if (!a3 && a4 == 255)
  {
    v4 = qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_10006AF34(v4);
  }
}

- (float)preferredInterval
{
  return self->_preferredInterval;
}

- (void)setPreferredInterval:(float)a3
{
  self->_preferredInterval = a3;
}

- (int)latency
{
  return self->_latency;
}

- (void)setLatency:(int)a3
{
  self->_latency = a3;
}

@end
