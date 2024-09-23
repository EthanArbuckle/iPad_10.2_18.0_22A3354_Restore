@implementation CLDurianGATTTask

- (CLDurianGATTTask)init
{
  -[CLDurianGATTTask doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (CLDurianGATTTask)initWithCommand:(id)a3 serviceUUID:(id)a4 characteristicUUID:(id)a5 payload:(id)a6
{
  uint64_t v11;
  CLDurianGATTTask *v12;
  NSMutableData *v13;
  objc_super v15;

  if (objc_msgSend(a3, "opcode") == 219)
    v11 = -7;
  else
    v11 = 0;
  v15.receiver = self;
  v15.super_class = (Class)CLDurianGATTTask;
  v12 = -[CLDurianTask initWithCommand:desiredLatency:expectsResponse:completeOnPreemption:requiresMutex:](&v15, "initWithCommand:desiredLatency:expectsResponse:completeOnPreemption:requiresMutex:", a3, v11, 1, 0, 0);
  if (v12)
  {
    v12->_serviceUUID = (CBUUID *)a4;
    v12->_characteristicUUID = (CBUUID *)a5;
    if (a6)
      v13 = (NSMutableData *)objc_msgSend(a6, "mutableCopy");
    else
      v13 = (NSMutableData *)objc_alloc_init((Class)NSMutableData);
    v12->_payload = v13;
  }
  return v12;
}

- (NSData)characteristicPayload
{
  return &self->_payload->super;
}

- (void)appendPayloadData:(id)a3
{
  if (objc_msgSend(a3, "length"))
    -[NSMutableData appendData:](self->_payload, "appendData:", a3);
}

- (void)setPayloadData:(id)a3
{

  self->_payload = (NSMutableData *)objc_msgSend(a3, "copy");
}

- (id)nextPacketOfMaxSize:(unint64_t)a3
{
  NSObject *v5;
  NSUInteger v6;
  unint64_t v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  const char *v12;
  char v14;
  uint8_t buf[4];
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  NSUInteger v20;
  __int16 v21;
  unint64_t v22;
  __int16 v23;
  const char *v24;

  v14 = 0;
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
  v5 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v6 = -[NSMutableData length](self->_payload, "length");
    *(_DWORD *)buf = 68289539;
    v16 = 0;
    v17 = 2082;
    v18 = "";
    v19 = 2049;
    v20 = v6;
    v21 = 2049;
    v22 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#hawkeye #firmwareUpdate nextPacketOfMaxSize \", \"PayloadBytesLeftToSend\":%{private}lu, \"maxPacketSize\":%{private}lu}", buf, 0x26u);
  }
  v7 = a3 - 1;
  if (-[NSMutableData length](self->_payload, "length") <= v7)
  {
    v7 = -[NSMutableData length](self->_payload, "length");
    v14 = 1;
  }
  v8 = objc_msgSend(objc_alloc((Class)NSMutableData), "initWithBytes:length:", &v14, 1);
  objc_msgSend(v8, "appendData:", -[NSMutableData subdataWithRange:](self->_payload, "subdataWithRange:", 0, v7));
  -[NSMutableData replaceBytesInRange:withBytes:length:](self->_payload, "replaceBytesInRange:withBytes:length:", 0, v7, 0, 0);
  v9 = objc_msgSend(objc_alloc((Class)NSData), "initWithData:", v8);
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
  v10 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v11 = objc_msgSend(v9, "length");
    *(_DWORD *)buf = 68289795;
    v16 = 0;
    if (v14)
      v12 = "LAST fragment";
    else
      v12 = "fragment";
    v17 = 2082;
    v18 = "";
    v19 = 2049;
    v20 = (NSUInteger)v11;
    v21 = 2113;
    v22 = (unint64_t)v9;
    v23 = 2081;
    v24 = v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#hawkeye #firmwareUpdate nextPacketOfMaxSize \", \"packetLength\":%{private}lu, \"packetToSend\":%{private, location:escape_only}@, \"Sending\":%{private, location:escape_only}s}", buf, 0x30u);
  }
  return v9;
}

- (BOOL)doneSendingPayload
{
  return -[NSMutableData length](self->_payload, "length") == 0;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLDurianGATTTask;
  -[CLDurianTask dealloc](&v3, "dealloc");
}

- (CBUUID)serviceUUID
{
  return self->_serviceUUID;
}

- (CBUUID)characteristicUUID
{
  return self->_characteristicUUID;
}

- (CBCharacteristic)characteristic
{
  return (CBCharacteristic *)objc_getProperty(self, a2, 88, 1);
}

- (void)setCharacteristic:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

@end
