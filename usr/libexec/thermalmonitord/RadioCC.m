@implementation RadioCC

- (RadioCC)initWithRunLoopAndParams:(__CFRunLoop *)a3 withParams:(__CFDictionary *)a4
{
  return -[RadioCC initWithRunLoopAndParams:withMitigationType:withParams:](self, "initWithRunLoopAndParams:withMitigationType:withParams:", a3, 4, a4);
}

- (RadioCC)initWithRunLoopAndParams:(__CFRunLoop *)a3 withMitigationType:(int)a4 withParams:(__CFDictionary *)a5
{
  uint64_t v6;
  char *v8;
  char *v9;
  const void *Value;
  CFStringRef v11;
  NSObject *v12;
  _QWORD block[5];
  objc_super v15;

  v6 = *(_QWORD *)&a4;
  v15.receiver = self;
  v15.super_class = (Class)RadioCC;
  v8 = -[ComponentControl initWithCC::](&v15, "initWithCC::", *(_QWORD *)&a4, a5);
  v9 = v8;
  if (!v8)
    return (RadioCC *)v9;
  *((_DWORD *)v8 + 45) = -1;
  *(_QWORD *)(v8 + 148) = dispatch_queue_create("com.apple.ThermalMonitor.radio", 0);
  *(_QWORD *)(v9 + 164) = a3;
  if (a5 && CFDictionaryContainsKey(a5, CFSTR("componentNameDetail")))
  {
    Value = CFDictionaryGetValue(a5, CFSTR("componentNameDetail"));
    if (!Value)
    {
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
        sub_100050CDC();
      goto LABEL_8;
    }
    v11 = CFStringCreateWithFormat(0, 0, CFSTR("%d Radio%@"), v6, Value);
  }
  else
  {
    v11 = CFStringCreateWithFormat(0, 0, CFSTR("%d Radio"), v6);
  }
  *((_QWORD *)v9 + 6) = v11;
LABEL_8:
  *(_QWORD *)(v9 + 140) = CFDictionaryCreateMutable(kCFAllocatorDefault, 2, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  v12 = *(NSObject **)(v9 + 148);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100027B1C;
  block[3] = &unk_10007D248;
  block[4] = v9;
  dispatch_async(v12, block);
  if (notify_register_check("com.apple.cltm.radioNotification", (int *)v9 + 44))
  {
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_100050CB0();
  }
  else
  {
    objc_msgSend(v9, "sendRadioNotification");
  }
  objc_msgSend(v9, "updatePowerParameters:", a5);
  if (sub_100034168(a5, CFSTR("expectsCPMSSupport"), 0))
    objc_msgSend(v9, "setCPMSMitigationState:", 1);
  return (RadioCC *)v9;
}

- (void)dealloc
{
  const void *v3;
  objc_super v4;

  v3 = *(const void **)(&self->super.currentPower + 1);
  if (v3)
    CFRelease(v3);
  v4.receiver = self;
  v4.super_class = (Class)RadioCC;
  -[PidComponent dealloc](&v4, "dealloc");
}

- (void)defaultAction
{
  unsigned int previousValue;

  if (dword_10009A128 != self->super.previousValue)
  {
    -[RadioCC calculateMitigation](self, "calculateMitigation");
    -[RadioCC setMaxTransmitPower](self, "setMaxTransmitPower");
    previousValue = self->super.previousValue;
    if (previousValue - 100 <= 0xFFFFFF9C)
    {
      -[RadioCC sendRadioNotification](self, "sendRadioNotification");
      previousValue = self->super.previousValue;
    }
    dword_10009A128 = previousValue;
  }
}

- (void)defaultCPMSAction
{
  unsigned int previousValue;
  objc_super v4;

  if (self->radioNotificationToken != self->super.previousValue)
  {
    v4.receiver = self;
    v4.super_class = (Class)RadioCC;
    -[ComponentControl defaultCPMSAction](&v4, "defaultCPMSAction");
    previousValue = self->super.previousValue;
    if (previousValue - 100 <= 0xFFFFFF9C)
    {
      -[RadioCC sendRadioNotification](self, "sendRadioNotification");
      previousValue = self->super.previousValue;
    }
    self->radioNotificationToken = previousValue;
  }
}

- (void)sendRadioNotification
{
  unsigned int previousValue;
  uint64_t v3;

  previousValue = self->super.previousValue;
  if (previousValue <= 1)
    v3 = 1;
  else
    v3 = previousValue;
  if (notify_set_state(self->txPowerLimit, v3) && os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
    sub_100050D34();
  if (notify_post("com.apple.cltm.radioNotification"))
  {
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_100050D08();
  }
}

- (void)calculateMitigation
{
  NSObject *v2;
  _QWORD block[5];

  v2 = *(NSObject **)((char *)&self->radioPowerConfiguration + 4);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100027D98;
  block[3] = &unk_10007D248;
  block[4] = self;
  dispatch_async(v2, block);
}

- (void)createServerConnection
{
  const void *v3;
  OS_dispatch_queue *v4;
  OS_dispatch_queue *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  _QWORD v11[2];
  __int128 v12;
  uint64_t v13;
  uint8_t buf[4];
  OS_dispatch_queue *v15;

  v11[0] = 0;
  v12 = 0u;
  v13 = 0;
  v11[1] = self;
  v3 = *(OS_dispatch_queue **)((char *)&self->radioQueue + 4);
  if (v3)
    CFRelease(v3);
  v4 = (OS_dispatch_queue *)_CTServerConnectionCreateWithIdentifier(kCFAllocatorDefault, CFSTR("CLTM_Radio"), sub_100027F74, v11);
  *(OS_dispatch_queue **)((char *)&self->radioQueue + 4) = v4;
  if (v4)
  {
    if (byte_1000A2480)
    {
      v5 = v4;
      v6 = qword_1000A28A0;
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v15 = v5;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "<Notice> CT connection %p", buf, 0xCu);
      }
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
  {
    sub_100050DCC();
  }
  _CTServerConnectionAddToRunLoop(*(OS_dispatch_queue **)((char *)&self->radioQueue + 4), *(__CTServerConnection **)((char *)&self->serverConnection + 4), kCFRunLoopCommonModes);
  v7 = *(uint64_t *)((char *)&self->radioQueue + 4);
  v8 = kCTDaemonReadyNotification;
  if (_CTServerConnectionRegisterForNotification(v7, kCTDaemonReadyNotification))
  {
    v9 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_100050D60(v8, v9, v10);
  }
}

- (void)createConnectionToCT
{
  if (!-[ComponentControl isCPMSControlEnabled](self, "isCPMSControlEnabled"))
  {
    -[RadioCC createServerConnection](self, "createServerConnection");
    -[RadioCC initializeRadio](self, "initializeRadio");
  }
}

- (void)initializeRadio
{
  if (_CTServerConnectionSetMaxTemperature(*(OS_dispatch_queue **)((char *)&self->radioQueue + 4), 6200))
  {
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_100050E64();
  }
  else
  {
    -[RadioCC setMaxTransmitPower](self, "setMaxTransmitPower");
  }
}

- (void)setMaxTransmitPower
{
  NSObject *v2;
  _QWORD block[5];

  v2 = *(NSObject **)((char *)&self->radioPowerConfiguration + 4);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100028148;
  block[3] = &unk_10007D248;
  block[4] = self;
  dispatch_async(v2, block);
}

- (void)addRadioMitigations
{
  if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
    sub_100050F28();
}

- (void)calculateAdditionalRadioMitigations
{
  if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
    sub_100050F28();
}

- (void)setAdditionalRadioMitigations
{
  if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
    sub_100050F28();
}

- (void)setCPMSMitigationState:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)RadioCC;
  -[ComponentControl setCPMSMitigationState:](&v4, "setCPMSMitigationState:", a3);
  -[RadioCC createConnectionToCT](self, "createConnectionToCT");
}

- (int)numberOfFields
{
  uint64_t v3;
  objc_super v5;
  objc_super v6;

  v3 = objc_opt_class(RadioPowerCC, a2);
  if ((objc_opt_isKindOfClass(self, v3) & 1) != 0)
  {
    v6.receiver = self;
    v6.super_class = (Class)RadioCC;
    return -[ComponentControl numberOfFields](&v6, "numberOfFields");
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)RadioCC;
    return -[ComponentControl numberOfFields](&v5, "numberOfFields") + 1;
  }
}

- (__CFString)copyHeaderForIndex:(int)a3
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  objc_super v8;
  objc_super v9;
  objc_super v10;

  v3 = *(_QWORD *)&a3;
  v10.receiver = self;
  v10.super_class = (Class)RadioCC;
  if (-[ComponentControl numberOfFields](&v10, "numberOfFields") > a3
    || (v6 = objc_opt_class(RadioPowerCC, v5), (objc_opt_isKindOfClass(self, v6) & 1) != 0))
  {
    v9.receiver = self;
    v9.super_class = (Class)RadioCC;
    return -[ComponentControl copyHeaderForIndex:](&v9, "copyHeaderForIndex:", v3);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)RadioCC;
    if (-[ComponentControl numberOfFields](&v8, "numberOfFields") == (_DWORD)v3)
      return CFSTR("Radio - txPowerLimit/10");
    else
      return 0;
  }
}

- (__CFString)copyFieldCurrentValueForIndex:(int)a3
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  objc_super v8;
  objc_super v9;
  objc_super v10;

  v3 = *(_QWORD *)&a3;
  v10.receiver = self;
  v10.super_class = (Class)RadioCC;
  if (-[ComponentControl numberOfFields](&v10, "numberOfFields") > a3
    || (v6 = objc_opt_class(RadioPowerCC, v5), (objc_opt_isKindOfClass(self, v6) & 1) != 0))
  {
    v9.receiver = self;
    v9.super_class = (Class)RadioCC;
    return -[ComponentControl copyFieldCurrentValueForIndex:](&v9, "copyFieldCurrentValueForIndex:", v3);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)RadioCC;
    if (-[ComponentControl numberOfFields](&v8, "numberOfFields") == (_DWORD)v3)
      return (__CFString *)CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("%d"), (SHIDWORD(self->runLoop) / 10));
    else
      return 0;
  }
}

@end
