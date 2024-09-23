@implementation BKAccelerometerClientUIApp

- (BKAccelerometerClientUIApp)initWithPid:(int)a3 sendRight:(id)a4 queue:(id)a5
{
  BKAccelerometerClientUIApp *v5;
  BKAccelerometerClientUIApp *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BKAccelerometerClientUIApp;
  v5 = -[BKAccelerometerClientUIApp initWithPid:sendRight:queue:](&v8, "initWithPid:sendRight:queue:", *(_QWORD *)&a3, a4, a5);
  v6 = v5;
  if (v5)
  {
    -[BKAccelerometerClient setPassiveOrientationEvents:](v5, "setPassiveOrientationEvents:", 0);
    v6->_lastOrientation = 0;
  }
  return v6;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BKAccelerometerClientUIApp;
  v4 = -[BKAccelerometerClient descriptionBuilderWithMultilinePrefix:](&v8, "descriptionBuilderWithMultilinePrefix:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = objc_msgSend(v5, "appendInt:withName:", LODWORD(self->_lastOrientation), CFSTR("lastOrientation"));
  return v5;
}

- (void)setWantsAccelerometerEvents:(BOOL)a3
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  if (a3)
  {
    v3 = sub_100010F8C();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_fault_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_FAULT, "BKAccelerometerClientUIApp doesn't support accelerometer events", v5, 2u);
    }

  }
}

- (void)_queue_invalidate
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)BKAccelerometerClientUIApp;
  -[BKAccelerometerClient _queue_invalidate](&v2, "_queue_invalidate");
}

- (void)handleOrientationEvent:(int64_t)a3 orientationLocked:(BOOL)a4
{
  uint64_t v7;
  uint64_t v8;
  const void *DeviceOrientationEventWithUsage;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  BKAccelerometerClientUIApp *v19;

  if (-[BKAccelerometerClient wantsOrientationEvents](self, "wantsOrientationEvents") && !a4)
  {
    if ((unint64_t)(a3 - 1) >= 6)
      v7 = 100;
    else
      v7 = (a3 + 100);
    v8 = mach_absolute_time();
    DeviceOrientationEventWithUsage = (const void *)IOHIDEventCreateDeviceOrientationEventWithUsage(0, v8, v7, 0);
    v10 = BKLogOrientationDevice(DeviceOrientationEventWithUsage);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = BSDeviceOrientationDescription(a3);
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      *(_DWORD *)buf = 138543618;
      v17 = v13;
      v18 = 2114;
      v19 = self;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Sending orientation: %{public}@ event to %{public}@", buf, 0x16u);

    }
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100079A14;
    v15[3] = &unk_1000EC138;
    v15[4] = self;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[BKSHIDEventDeferringResolution build:](BKSHIDEventDeferringResolution, "build:", v15));
    BKSendHIDEventToClientWithDestination(DeviceOrientationEventWithUsage, v14);
    CFRelease(DeviceOrientationEventWithUsage);
    self->_lastOrientation = a3;

  }
}

@end
