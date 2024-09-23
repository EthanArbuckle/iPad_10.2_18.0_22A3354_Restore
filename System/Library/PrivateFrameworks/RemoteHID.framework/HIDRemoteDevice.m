@implementation HIDRemoteDevice

- (HIDRemoteDevice)initWithProperties:(id)a3
{
  HIDRemoteDevice *v3;
  dispatch_semaphore_t v4;
  HIDRemoteDevice *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HIDRemoteDevice;
  v3 = -[HIDUserDevice initWithProperties:](&v7, sel_initWithProperties_, a3);
  if (v3)
  {
    v4 = dispatch_semaphore_create(0);
    -[HIDRemoteDevice setSemaphore:](v3, "setSemaphore:", v4);

    v5 = v3;
  }

  return v3;
}

- (int)setReportHandler:(int)a3 reportID:(unsigned __int8)a4 status:(int)a5
{
  uint64_t v5;
  NSObject *v7;

  v5 = *(_QWORD *)&a5;
  if (-[HIDRemoteDevice waitForReport](self, "waitForReport", *(_QWORD *)&a3, a4))
  {
    -[HIDRemoteDevice setLastSetReportStatus:](self, "setLastSetReportStatus:", v5);
    -[HIDRemoteDevice semaphore](self, "semaphore");
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_semaphore_signal(v7);

  }
  else
  {
    LODWORD(v5) = -536870165;
  }
  return v5;
}

- (int)getReportHandler:(int)a3 reportID:(unsigned __int8)a4 report:(char *)a5 reportLength:(unint64_t)a6
{
  void *v9;
  NSObject *v10;

  if (!-[HIDRemoteDevice waitForReport](self, "waitForReport", *(_QWORD *)&a3, a4))
    return -536870165;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", a5, a6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HIDRemoteDevice setLastGetReport:](self, "setLastGetReport:", v9);

  -[HIDRemoteDevice semaphore](self, "semaphore");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_signal(v10);

  return 0;
}

- (id)description
{
  void *v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  objc_super v11;
  uint64_t entryID;

  entryID = 0;
  IORegistryEntryGetRegistryEntryID(-[HIDUserDevice service](self, "service"), &entryID);
  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = -[HIDRemoteDevice deviceID](self, "deviceID");
  v5 = entryID;
  v6 = -[HIDRemoteDevice handleReportCount](self, "handleReportCount");
  v7 = -[HIDRemoteDevice handleReportError](self, "handleReportError");
  v11.receiver = self;
  v11.super_class = (Class)HIDRemoteDevice;
  -[HIDUserDevice description](&v11, sel_description);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<HIDRemoteHIDUserDevice:%p id:%lld service:%llx handleReportCount:%u handleReportError:%u device:%@>"), self, v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (unint64_t)endpointID
{
  return self->_endpointID;
}

- (void)setEndpointID:(unint64_t)a3
{
  self->_endpointID = a3;
}

- (unint64_t)deviceID
{
  return self->_deviceID;
}

- (void)setDeviceID:(unint64_t)a3
{
  self->_deviceID = a3;
}

- (unsigned)transportVersion
{
  return self->_transportVersion;
}

- (void)setTransportVersion:(unsigned __int8)a3
{
  self->_transportVersion = a3;
}

- (unsigned)side
{
  return self->_side;
}

- (void)setSide:(unsigned __int8)a3
{
  self->_side = a3;
}

- (OS_dispatch_semaphore)semaphore
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 80, 1);
}

- (void)setSemaphore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSData)lastGetReport
{
  return (NSData *)objc_getProperty(self, a2, 88, 1);
}

- (void)setLastGetReport:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (int)lastSetReportStatus
{
  return self->_lastSetReportStatus;
}

- (void)setLastSetReportStatus:(int)a3
{
  self->_lastSetReportStatus = a3;
}

- (BOOL)waitForReport
{
  return self->_waitForReport;
}

- (void)setWaitForReport:(BOOL)a3
{
  self->_waitForReport = a3;
}

- (unsigned)handleReportCount
{
  return self->_handleReportCount;
}

- (void)setHandleReportCount:(unsigned int)a3
{
  self->_handleReportCount = a3;
}

- (unsigned)handleReportError
{
  return self->_handleReportError;
}

- (void)setHandleReportError:(unsigned int)a3
{
  self->_handleReportError = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastGetReport, 0);
  objc_storeStrong((id *)&self->_semaphore, 0);
}

@end
