@implementation HIDKeyholeUserDevice

- (HIDKeyholeUserDevice)initWithProperties:(id)a3 hidDescriptor:(id)a4 keyholeID:(unsigned __int8)a5 delegate:(id)a6
{
  id v10;
  id v11;
  id v12;
  char *v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  int v19;
  HIDKeyholeUserDevice *v20;
  objc_super v22;
  uint8_t buf[4];
  int v24;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v22.receiver = self;
  v22.super_class = (Class)HIDKeyholeUserDevice;
  v13 = -[HIDKeyholeUserDevice init](&v22, "init");
  if (v13)
  {
    v14 = objc_msgSend(v10, "mutableCopy");
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v11, CFSTR("ReportDescriptor"));
    *(_WORD *)(v13 + 9) = 1023;
    v13[8] = a5;
    objc_storeWeak((id *)v13 + 3, v12);
    v15 = IOHIDUserDeviceCreateWithOptions(kCFAllocatorDefault, v14, 1);
    v16 = (void *)*((_QWORD *)v13 + 2);
    *((_QWORD *)v13 + 2) = v15;

    v17 = *((_QWORD *)v13 + 2);
    if (v17)
    {
      IOHIDUserDeviceRegisterSetReportCallback(v17, sub_100012D14, v13);
      IOHIDUserDeviceRegisterGetReportWithReturnLengthCallback(*((_QWORD *)v13 + 2), sub_100012D2C, v13);
      v18 = qword_1000C9178;
      if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
      {
        v19 = v13[8];
        *(_DWORD *)buf = 67109120;
        v24 = v19;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Created HIDKeyholeUserDevice with keyholeID %02X", buf, 8u);
      }
      v20 = v13;
    }
    else
    {
      v20 = 0;
    }

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (void)start:(id)a3
{
  OS_dispatch_queue **p_queue;
  id v5;
  id device;
  id v7;
  id v8;

  p_queue = &self->_queue;
  v8 = a3;
  v5 = objc_storeWeak((id *)p_queue, v8);
  device = self->_device;
  v7 = v5;
  IOHIDUserDeviceScheduleWithDispatchQueue(device, v8);

}

- (void)stop
{
  OS_dispatch_queue **p_queue;
  id WeakRetained;
  id device;
  id v6;

  p_queue = &self->_queue;
  WeakRetained = objc_loadWeakRetained((id *)&self->_queue);

  if (WeakRetained)
  {
    device = self->_device;
    v6 = objc_loadWeakRetained((id *)p_queue);
    IOHIDUserDeviceUnscheduleFromDispatchQueue(device, v6);

  }
}

- (int)getReport:(char *)a3 reportLength:(int64_t *)a4 reportID:(unsigned int)a5 reportType:(int)a6
{
  uint64_t v6;
  unint64_t v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  int64_t *v17;
  void *v18;
  id v19;
  NSObject *v20;
  int keyholeID;
  NSObject *v22;
  BOOL v23;
  int v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  NSObject *v31;
  id v32;
  int64_t v33;
  int v34;
  char *v36;
  id v37;
  uint8_t buf[4];
  _BYTE v39[10];
  int64_t v40;
  __int16 v41;
  unsigned int v42;
  __int16 v43;
  int v44;

  v6 = *(_QWORD *)&a6;
  -[HIDKeyholeUserDevice maxReportRetry](self, "maxReportRetry");
  v11 = 0;
  while (1)
  {
    if (v11)
    {
      v12 = qword_1000C9178;
      if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      {
        keyholeID = self->_keyholeID;
        *(_DWORD *)buf = 67109632;
        *(_DWORD *)v39 = v11;
        *(_WORD *)&v39[4] = 1024;
        *(_DWORD *)&v39[6] = a5;
        LOWORD(v40) = 1024;
        *(_DWORD *)((char *)&v40 + 2) = keyholeID;
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Retry #%u getting report (id=0x%02X, keyhole=0x%02X)", buf, 0x14u);
      }
    }
    kdebug_trace(730595768, a5, self->_keyholeID, 0, 0);
    if (-[HIDKeyholeUserDevice useKeyholeOnGet](self, "useKeyholeOnGet"))
    {
      *(_WORD *)buf = 0;
      buf[0] = -[HIDKeyholeUserDevice getReportKeyholeID](self, "getReportKeyholeID");
      buf[1] = a5;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", buf, 2));
      v14 = 0;
    }
    else
    {
      buf[0] = a5;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", buf, 1));
      v14 = -[HIDKeyholeUserDevice getReportKeyholeID](self, "getReportKeyholeID");
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[HIDKeyholeUserDevice delegate](self, "delegate", v36));
    v16 = objc_msgSend(v15, "setReportData:reportID:reportType:error:", v13, v14, v6, 0);

    if (v16 == -536870201)
    {
      v16 = -536870201;
      kdebug_trace(730595772, a5, self->_keyholeID, -536870201, 0);
      goto LABEL_28;
    }
    v36 = a3;
    v17 = a4;
    if (v16)
    {
      v22 = qword_1000C9178;
      if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      {
        v24 = self->_keyholeID;
        *(_DWORD *)buf = 67109632;
        *(_DWORD *)v39 = v16;
        *(_WORD *)&v39[4] = 1024;
        *(_DWORD *)&v39[6] = a5;
        LOWORD(v40) = 1024;
        *(_DWORD *)((char *)&v40 + 2) = v24;
        _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Set report failed (err=0x%02X, id=0x%02X, keyhole=0x%02X)", buf, 0x14u);
      }
      goto LABEL_17;
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[HIDKeyholeUserDevice delegate](self, "delegate"));
    v37 = 0;
    v16 = objc_msgSend(v18, "getReportData:reportID:reportType:error:", &v37, self->_keyholeID, v6, 0);
    v19 = v37;

    if (v16 == -536870201)
    {
      v16 = -536870201;
      v26 = self->_keyholeID;
      v27 = a5;
      v28 = -536870201;
      goto LABEL_27;
    }
    if (!v16)
      break;
    v20 = qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
    {
      v25 = self->_keyholeID;
      *(_DWORD *)buf = 67109632;
      *(_DWORD *)v39 = v16;
      *(_WORD *)&v39[4] = 1024;
      *(_DWORD *)&v39[6] = a5;
      LOWORD(v40) = 1024;
      *(_DWORD *)((char *)&v40 + 2) = v25;
      _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Get report failed (err=0x%02X, id=0x%02X, keyhole=0x%02X)", buf, 0x14u);
    }

LABEL_17:
    v23 = v11++ >= -[HIDKeyholeUserDevice maxReportRetry](self, "maxReportRetry");
    a4 = v17;
    a3 = v36;
    if (v23)
    {
      kdebug_trace(730595772, a5, self->_keyholeID, v16, 0);
      return v16;
    }
  }
  v29 = -[HIDKeyholeUserDevice useKeyholeOnGet](self, "useKeyholeOnGet") ^ 1;
  if ((unint64_t)objc_msgSend(v19, "length") + v29 <= *v17)
  {
    *v36 = a5;
    objc_msgSend(v19, "getBytes:length:", &v36[v29], *v17 - v29);
    v16 = 0;
    *v17 = (int64_t)objc_msgSend(v19, "length") + v29;
  }
  else
  {
    v30 = (void *)qword_1000C9178;
    v16 = -536870181;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
    {
      v31 = v30;
      v32 = objc_msgSend(v19, "length");
      v33 = *v17;
      v34 = self->_keyholeID;
      *(_DWORD *)buf = 134218752;
      *(_QWORD *)v39 = v32;
      *(_WORD *)&v39[8] = 2048;
      v40 = v33;
      v41 = 1024;
      v42 = a5;
      v43 = 1024;
      v44 = v34;
      _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "Invalid report length (actual=%lu, expected=%ld, id=0x%02X, keyhole=0x%02X)", buf, 0x22u);

    }
  }
  v26 = self->_keyholeID;
  v28 = v16;
  v27 = a5;
LABEL_27:
  kdebug_trace(730595772, v27, v26, v28, 0);

LABEL_28:
  return v16;
}

- (int)setReport:(char *)a3 reportLength:(int64_t)a4 reportID:(unsigned int)a5 reportType:(int)a6
{
  uint64_t v6;
  unint64_t v11;
  __int128 v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  int v19;
  uint64_t v20;
  NSObject *v22;
  int v24;
  int keyholeID;
  __int128 v27;
  uint8_t buf[4];
  int v29;
  __int16 v30;
  unsigned int v31;
  __int16 v32;
  int v33;

  v6 = *(_QWORD *)&a6;
  -[HIDKeyholeUserDevice maxReportRetry](self, "maxReportRetry");
  v11 = 0;
  *(_QWORD *)&v12 = 67109632;
  v27 = v12;
  while (1)
  {
    if (v11)
    {
      v13 = qword_1000C9178;
      if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      {
        keyholeID = self->_keyholeID;
        *(_DWORD *)buf = v27;
        v29 = v11;
        v30 = 1024;
        v31 = a5;
        v32 = 1024;
        v33 = keyholeID;
        _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Retry #%u setting report (id=0x%02X, keyhole=0x%02X)", buf, 0x14u);
      }
    }
    if (a4 < 2)
    {
      v14 = 0;
    }
    else
    {
      v14 = a3[1];
      if (a4 != 2)
      {
        v15 = a3[2];
        goto LABEL_10;
      }
    }
    v15 = 0;
LABEL_10:
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:", a3, a4, 0, v27));
    v17 = self->_keyholeID;
    if ((_DWORD)v6 == 1)
    {
      kdebug_trace(730595752, a5, v17, v14, v15);
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[HIDKeyholeUserDevice delegate](self, "delegate"));
      v19 = objc_msgSend(v18, "sendOutputReportData:reportID:reportType:", v16, self->_keyholeID, 1);
      v20 = 730595756;
    }
    else
    {
      kdebug_trace(730595760, a5, v17, v14, v15);
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[HIDKeyholeUserDevice delegate](self, "delegate"));
      v19 = objc_msgSend(v18, "setReportData:reportID:reportType:error:", v16, self->_keyholeID, v6, 0);
      v20 = 730595764;
    }

    kdebug_trace(v20, a5, self->_keyholeID, v19, 0);
    if (v19 == -536870201 || v19 == 0)
      break;
    v22 = qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
    {
      v24 = self->_keyholeID;
      *(_DWORD *)buf = v27;
      v29 = v19;
      v30 = 1024;
      v31 = a5;
      v32 = 1024;
      v33 = v24;
      _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Set report failed (err=0x%02X, id=0x%02X, keyhole=0x%02X)", buf, 0x14u);
    }

    if (v11++ >= -[HIDKeyholeUserDevice maxReportRetry](self, "maxReportRetry"))
      return v19;
  }

  return v19;
}

- (void)handleInputReport:(char *)a3 reportLength:(int64_t)a4
{
  IOHIDUserDeviceHandleReport(self->_device, a3, a4);
}

- (void)handleInputReport:(char *)a3 reportLength:(int64_t)a4 timestamp:(unint64_t)a5
{
  IOHIDUserDeviceHandleReportWithTimeStamp((IOHIDUserDeviceRef)self->_device, a5, (const uint8_t *)a3, a4);
}

- (void)dealloc
{
  void *v3;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[4];
  unsigned int v7;

  v3 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    *(_DWORD *)buf = 67109120;
    v7 = -[HIDKeyholeUserDevice keyholeID](self, "keyholeID");
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Deallocating HIDKeyholeUserDevice with keyholeID %02X", buf, 8u);

  }
  -[HIDKeyholeUserDevice stop](self, "stop");
  v5.receiver = self;
  v5.super_class = (Class)HIDKeyholeUserDevice;
  -[HIDKeyholeUserDevice dealloc](&v5, "dealloc");
}

- (unsigned)keyholeID
{
  return self->_keyholeID;
}

- (unsigned)getReportKeyholeID
{
  return self->_getReportKeyholeID;
}

- (void)setGetReportKeyholeID:(unsigned __int8)a3
{
  self->_getReportKeyholeID = a3;
}

- (unsigned)maxReportRetry
{
  return self->_maxReportRetry;
}

- (void)setMaxReportRetry:(unsigned __int8)a3
{
  self->_maxReportRetry = a3;
}

- (BOOL)useKeyholeOnGet
{
  return self->_useKeyholeOnGet;
}

- (void)setUseKeyholeOnGet:(BOOL)a3
{
  self->_useKeyholeOnGet = a3;
}

- (id)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
  objc_storeStrong(&self->_device, a3);
}

- (HIDBluetoothDevice)delegate
{
  return (HIDBluetoothDevice *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_loadWeakRetained((id *)&self->_queue);
}

- (void)setQueue:(id)a3
{
  objc_storeWeak((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_queue);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_device, 0);
}

@end
