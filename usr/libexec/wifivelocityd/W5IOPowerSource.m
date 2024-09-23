@implementation W5IOPowerSource

- (W5IOPowerSource)init
{
  W5IOPowerSource *v2;
  NSObject *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)W5IOPowerSource;
  v2 = -[W5IOPowerSource init](&v5, "init");
  if (v2
    && (v3 = dispatch_queue_create("com.apple.wifivelocityd.iops", 0), (v2->_queue = (OS_dispatch_queue *)v3) != 0))
  {
    dispatch_queue_set_specific(v3, &v2->_queue, (void *)1, 0);
  }
  else
  {

    return 0;
  }
  return v2;
}

- (void)setUpdatedPowerSourceCallback:(id)a3
{
  NSObject *queue;
  _QWORD v6[6];

  if (dispatch_get_specific(&self->_queue))
  {

    self->_updatedPowerSourceCallback = objc_msgSend(a3, "copy");
  }
  else
  {
    queue = self->_queue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100033F38;
    v6[3] = &unk_1000D5C20;
    v6[4] = self;
    v6[5] = a3;
    dispatch_sync(queue, v6);
  }
}

- (void)setLowBatteryCallback:(id)a3
{
  NSObject *queue;
  _QWORD v6[6];

  if (dispatch_get_specific(&self->_queue))
  {

    self->_lowBatteryCallback = objc_msgSend(a3, "copy");
  }
  else
  {
    queue = self->_queue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100034004;
    v6[3] = &unk_1000D5C20;
    v6[4] = self;
    v6[5] = a3;
    dispatch_sync(queue, v6);
  }
}

- (void)dealloc
{
  NSObject *queue;
  objc_super v4;

  queue = self->_queue;
  if (queue)
    dispatch_release(queue);

  v4.receiver = self;
  v4.super_class = (Class)W5IOPowerSource;
  -[W5IOPowerSource dealloc](&v4, "dealloc");
}

- (void)startEventMonitoring
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000340FC;
  block[3] = &unk_1000D5C98;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)stopEventMonitoring
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100034618;
  block[3] = &unk_1000D5C98;
  block[4] = self;
  dispatch_async(queue, block);
}

- (double)internalBatteryLevel
{
  CFTypeRef v2;
  const void *v3;
  const __CFArray *v4;
  double v5;
  const __CFArray *v6;
  CFIndex v7;
  const void *ValueAtIndex;
  const __CFDictionary *v9;
  const __CFDictionary *v10;
  const void *Value;
  const __CFNumber *v12;
  const __CFNumber *v13;
  int v15;
  int valuePtr;

  v2 = IOPSCopyPowerSourcesInfo();
  if (!v2)
    return 0.0;
  v3 = v2;
  v4 = IOPSCopyPowerSourcesList(v2);
  v5 = 0.0;
  if (v4)
  {
    v6 = v4;
    if (CFArrayGetCount(v4) && CFArrayGetCount(v6) >= 1)
    {
      v7 = 0;
      while (1)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v6, v7);
        v9 = IOPSGetPowerSourceDescription(v3, ValueAtIndex);
        if (v9)
        {
          v10 = v9;
          Value = CFDictionaryGetValue(v9, CFSTR("Transport Type"));
          if (Value)
          {
            if (CFEqual(Value, CFSTR("Internal")))
              break;
          }
        }
        if (CFArrayGetCount(v6) <= ++v7)
          goto LABEL_12;
      }
      valuePtr = 0;
      v12 = (const __CFNumber *)CFDictionaryGetValue(v10, CFSTR("Current Capacity"));
      CFNumberGetValue(v12, kCFNumberSInt32Type, &valuePtr);
      v15 = 0;
      v13 = (const __CFNumber *)CFDictionaryGetValue(v10, CFSTR("Max Capacity"));
      CFNumberGetValue(v13, kCFNumberSInt32Type, &v15);
      v5 = (double)valuePtr / (double)v15 * 100.0;
    }
LABEL_12:
    CFRelease(v3);
  }
  else
  {
    v6 = (const __CFArray *)v3;
  }
  CFRelease(v6);
  return v5;
}

- (double)estimatedTimeRemaining
{
  NSObject *queue;
  double v3;
  _QWORD block[5];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100034850;
  block[3] = &unk_1000D5380;
  block[4] = &v6;
  dispatch_sync(queue, block);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (int64_t)powerSourceType
{
  NSObject *queue;
  int64_t v3;
  _QWORD block[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0x7FFFFFFFFFFFFFFFLL;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100034918;
  block[3] = &unk_1000D5380;
  block[4] = &v6;
  dispatch_sync(queue, block);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (int)batteryWarningLevel
{
  NSObject *queue;
  int v3;
  _QWORD block[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 1;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100034A3C;
  block[3] = &unk_1000D5380;
  block[4] = &v6;
  dispatch_sync(queue, block);
  v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)updatedPowerSourceCallback
{
  return self->_updatedPowerSourceCallback;
}

- (id)lowBatteryCallback
{
  return self->_lowBatteryCallback;
}

@end
