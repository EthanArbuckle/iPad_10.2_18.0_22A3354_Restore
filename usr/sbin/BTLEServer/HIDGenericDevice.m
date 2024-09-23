@implementation HIDGenericDevice

- (HIDGenericDevice)initWithProperties:(id)a3 reports:(id)a4
{
  id v6;
  HIDGenericDevice *v7;
  uint64_t v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HIDGenericDevice;
  v7 = -[HIDBluetoothDevice initWithProperties:reports:](&v10, "initWithProperties:reports:", v6, a4);
  if (v7)
  {
    v8 = IOHIDUserDeviceCreateWithOptions(kCFAllocatorDefault, v6, 1);
    v7->_device = (__IOHIDUserDevice *)v8;
    if (v8)
    {
      IOHIDUserDeviceRegisterGetReportWithReturnLengthCallback(v8, sub_1000660E4, v7);
      IOHIDUserDeviceRegisterSetReportCallback(v7->_device, sub_1000660FC, v7);
    }
    else
    {

      v7 = 0;
    }
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  if (-[HIDGenericDevice device](self, "device"))
    CFRelease(-[HIDGenericDevice device](self, "device"));
  v3.receiver = self;
  v3.super_class = (Class)HIDGenericDevice;
  -[HIDBluetoothDevice dealloc](&v3, "dealloc");
}

- (void)start
{
  id v3;
  __IOHIDUserDevice *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HIDGenericDevice;
  -[HIDBluetoothDevice start](&v6, "start");
  v3 = -[HIDBluetoothDevice allocHIDQueue](self, "allocHIDQueue");
  -[HIDGenericDevice setQueue:](self, "setQueue:", v3);

  v4 = -[HIDGenericDevice device](self, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HIDGenericDevice queue](self, "queue"));
  IOHIDUserDeviceScheduleWithDispatchQueue(v4, v5);

  -[HIDBluetoothDevice notifyDidStart](self, "notifyDidStart");
}

- (void)stop
{
  __IOHIDUserDevice *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HIDGenericDevice;
  -[HIDBluetoothDevice stop](&v7, "stop");
  v3 = -[HIDGenericDevice device](self, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HIDGenericDevice queue](self, "queue"));
  IOHIDUserDeviceUnscheduleFromDispatchQueue(v3, v4);

  v5 = objc_claimAutoreleasedReturnValue(-[HIDGenericDevice queue](self, "queue"));
  dispatch_set_context(v5, self);

  v6 = objc_claimAutoreleasedReturnValue(-[HIDGenericDevice queue](self, "queue"));
  dispatch_set_finalizer_f(v6, (dispatch_function_t)j__objc_msgSend_notifyDidStop_2);

  -[HIDGenericDevice setQueue:](self, "setQueue:", 0);
}

- (int)getReport:(char *)a3 reportLength:(int64_t *)a4 reportID:(unsigned __int8)a5 reportType:(int)a6
{
  -[HIDGenericDevice doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5, *(_QWORD *)&a6);
  return -536870212;
}

- (int)setReport:(char *)a3 reportLength:(int64_t)a4 reportID:(unsigned __int8)a5 reportType:(int)a6
{
  -[HIDGenericDevice doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5, *(_QWORD *)&a6);
  return -536870212;
}

- (__IOHIDUserDevice)device
{
  return self->_device;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
