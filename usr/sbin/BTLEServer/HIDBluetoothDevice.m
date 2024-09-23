@implementation HIDBluetoothDevice

+ (id)hidDeviceWithProperties:(id)a3 reports:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  unsigned __int8 v15;
  __objc2_class **v16;
  unsigned int v17;
  uint64_t v18;
  __objc2_class **v19;
  objc_class *v20;
  id v21;
  void *v23;
  unsigned __int8 v24;
  void *v25;
  unsigned __int8 v26;
  void *v27;
  unsigned int v28;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("VendorIDSource")));
  if (objc_msgSend(v8, "unsignedCharValue") != 1)
  {

    goto LABEL_10;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("VendorID")));
  v10 = objc_msgSend(v9, "unsignedShortValue");

  if (v10 == 76)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ProductID")));
    v12 = objc_msgSend(v11, "unsignedShortValue");

    if (v12 > 620)
    {
      if ((v12 - 788) >= 2)
      {
        if (v12 == 1106)
        {
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Authenticated")));
          v28 = objc_msgSend(v27, "BOOLValue");

          if (!v28)
            goto LABEL_10;
          v16 = off_1000AC6C8;
          goto LABEL_28;
        }
        if (v12 != 621)
          goto LABEL_10;
      }
    }
    else
    {
      if (v12 <= 545)
      {
        if (v12 != 332)
        {
          if (v12 == 482)
          {
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Authenticated")));
            v15 = objc_msgSend(v14, "BOOLValue");

            if ((v15 & 1) != 0)
            {
              v16 = off_1000AC6C0;
              goto LABEL_28;
            }
          }
          goto LABEL_10;
        }
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Authenticated")));
        v26 = objc_msgSend(v25, "BOOLValue");

        if ((v26 & 1) == 0)
          goto LABEL_10;
        v16 = off_1000AC6B8;
LABEL_28:
        v20 = (objc_class *)objc_opt_class(*v16, v13);
        if (v20)
          goto LABEL_13;
        goto LABEL_10;
      }
      if (v12 == 546)
      {
        v16 = off_1000AC6B0;
        goto LABEL_28;
      }
      if (v12 != 614)
        goto LABEL_10;
    }
    if (!MGGetBoolAnswer(CFSTR("InternalBuild")))
      goto LABEL_10;
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Authenticated")));
    v24 = objc_msgSend(v23, "BOOLValue");

    if ((v24 & 1) == 0)
      goto LABEL_10;
    v16 = &off_1000AC6D0;
    goto LABEL_28;
  }
LABEL_10:
  v17 = objc_msgSend(a1, "reportsHaveMultipleReportIDs:", v7);
  v19 = off_1000AC6E0;
  if (!v17)
    v19 = &off_1000AC6E8;
  v20 = (objc_class *)objc_opt_class(*v19, v18);
LABEL_13:
  v21 = objc_msgSend([v20 alloc], "initWithProperties:reports:", v6, v7);

  return v21;
}

- (void)start
{
  id v2;

  -[HIDBluetoothDevice setState:](self, "setState:", 1);
  v2 = (id)objc_claimAutoreleasedReturnValue(+[PolicyManager instance](PolicyManager, "instance"));
  objc_msgSend(v2, "setActiveHIDDeviceCount:", (char *)objc_msgSend(v2, "activeHIDDeviceCount") + 1);

}

- (void)stop
{
  id v2;

  -[HIDBluetoothDevice setState:](self, "setState:", 3);
  v2 = (id)objc_claimAutoreleasedReturnValue(+[PolicyManager instance](PolicyManager, "instance"));
  objc_msgSend(v2, "setActiveHIDDeviceCount:", (char *)objc_msgSend(v2, "activeHIDDeviceCount") - 1);

}

- (id)desiredConnectionParameters
{
  ConnectionParameters *v2;
  double v3;
  double v4;
  double v5;

  v2 = objc_alloc_init(ConnectionParameters);
  LODWORD(v3) = 15.0;
  -[ConnectionParameters setMinInterval:](v2, "setMinInterval:", v3);
  LODWORD(v4) = 15.0;
  -[ConnectionParameters setPreferredInterval:](v2, "setPreferredInterval:", v4);
  LODWORD(v5) = 1140457472;
  -[ConnectionParameters setMaxInterval:](v2, "setMaxInterval:", v5);
  -[ConnectionParameters setMinCELength:](v2, "setMinCELength:", 2);
  -[ConnectionParameters setMaxCELength:](v2, "setMaxCELength:", 6);
  -[ConnectionParameters setPreferredPeripheralLatency:](v2, "setPreferredPeripheralLatency:", 4);
  -[ConnectionParameters setMaxPeripheralLatency:](v2, "setMaxPeripheralLatency:", 4);
  -[ConnectionParameters setTimeout:](v2, "setTimeout:", 1000);
  return v2;
}

- (void)handleInputReportData:(id)a3 reportID:(unsigned __int8)a4 timestamp:(unint64_t)a5
{
  -[HIDBluetoothDevice doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5);
}

- (HIDBluetoothDevice)init
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[HIDBluetoothDevice init]"));
  +[NSException raise:format:](NSException, "raise:format:", NSInvalidArgumentException, CFSTR("Calling %@ is not allowed"), v3);

  return 0;
}

- (HIDBluetoothDevice)initWithProperties:(id)a3 reports:(id)a4
{
  HIDBluetoothDevice *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HIDBluetoothDevice;
  result = -[HIDBluetoothDevice init](&v5, "init", a3, a4);
  if (result)
    result->_state = 0;
  return result;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)HIDBluetoothDevice;
  -[HIDBluetoothDevice dealloc](&v2, "dealloc");
}

- (void)notifyDidStart
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100024E84;
  block[3] = &unk_1000AD230;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)notifyDidStop
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100024F34;
  block[3] = &unk_1000AD230;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)notifyDesiredConnectionParametersDidChange
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100024FD4;
  block[3] = &unk_1000AD230;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (int)getReportData:(id *)a3 reportID:(unsigned __int8)a4 reportType:(int)a5 error:(id *)a6
{
  uint64_t v7;
  uint64_t v8;
  void *v10;

  v7 = *(_QWORD *)&a5;
  v8 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[HIDBluetoothDevice service](self, "service"));
  LODWORD(a6) = objc_msgSend(v10, "readReportData:reportID:reportType:error:", a3, v8, v7, a6);

  return (int)a6;
}

- (int)setReportData:(id)a3 reportID:(unsigned __int8)a4 reportType:(int)a5 error:(id *)a6
{
  uint64_t v7;
  uint64_t v8;
  id v10;
  void *v11;

  v7 = *(_QWORD *)&a5;
  v8 = a4;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[HIDBluetoothDevice service](self, "service"));
  LODWORD(a6) = objc_msgSend(v11, "writeReportData:reportID:reportType:withResponse:error:", v10, v8, v7, 1, a6);

  return (int)a6;
}

- (int)sendOutputReportData:(id)a3 reportID:(unsigned __int8)a4 reportType:(int)a5
{
  uint64_t v5;
  uint64_t v6;
  id v8;
  void *v9;

  v5 = *(_QWORD *)&a5;
  v6 = a4;
  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[HIDBluetoothDevice service](self, "service"));
  LODWORD(v5) = objc_msgSend(v9, "writeReportData:reportID:reportType:withResponse:error:", v8, v6, v5, 0, 0);

  return v5;
}

- (id)allocHIDQueue
{
  dispatch_queue_attr_t v3;
  NSObject *v4;
  uint64_t v5;
  NSString *v6;
  id v7;
  dispatch_queue_t v8;

  v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("com.apple.%@"), objc_opt_class(self, v5));
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v6));
  v8 = dispatch_queue_create((const char *)objc_msgSend(v7, "UTF8String"), v4);

  return v8;
}

+ (BOOL)reportsHaveMultipleReportIDs:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *i;
  unsigned int v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v11;
    v6 = 0x7FFFFFFFFFFFFFFFLL;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v3);
        v8 = objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i), "ID", (_QWORD)v10);
        if (v6 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v6 = v8;
        }
        else if (v6 != v8)
        {
          LOBYTE(v4) = 1;
          goto LABEL_13;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_13:

  return (char)v4;
}

- (HIDServiceProtocol)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
  objc_storeStrong((id *)&self->_service, a3);
}

- (CBPeripheral)peripheral
{
  return self->_peripheral;
}

- (void)setPeripheral:(id)a3
{
  objc_storeStrong((id *)&self->_peripheral, a3);
}

- (unsigned)state
{
  return self->_state;
}

- (void)setState:(unsigned __int8)a3
{
  self->_state = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peripheral, 0);
  objc_storeStrong((id *)&self->_service, 0);
}

@end
