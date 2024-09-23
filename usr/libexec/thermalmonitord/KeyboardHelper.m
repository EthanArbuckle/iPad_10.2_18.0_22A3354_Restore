@implementation KeyboardHelper

- (KeyboardHelper)init
{
  KeyboardHelper *v2;
  KeyboardHelper *v3;
  id v4;
  uint64_t v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)KeyboardHelper;
  v2 = -[KeyboardHelper init](&v7, "init");
  v3 = v2;
  if (v2)
  {
    v2->_cachedIsKeyboardAttached = 0;
    v2->_cachedIsFolioAttached = 0;
    v2->_keyboardPortConnect = 0;
    v2->_keyboardPortDisconnect = 0;
    if (byte_1000A2484)
    {
      v6 = 0;
      qword_1000A2450 = (uint64_t)+[CLPCPolicyInterface createClient:](CLPCPolicyInterface, "createClient:", &v6);
      v4 = (id)qword_1000A2450;
      if (v6)
      {
        if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
          sub_100055E20();
      }
    }
    if (byte_1000A2DC0)
    {
      -[SensorExchangeHelper registerCLTMSensorIndex:forSMCKey:atSMCIndex:](+[SensorExchangeHelper sharedInstance](SensorExchangeHelper, "sharedInstance"), "registerCLTMSensorIndex:forSMCKey:atSMCIndex:", 28, CFSTR("zETM"), 28);
      dword_1000A2B30 = 0;
    }
  }
  return v3;
}

- (void)dealloc
{
  __CFRunLoopSource *RunLoopSource;
  __CFRunLoopSource *v4;
  objc_super v5;

  RunLoopSource = IONotificationPortGetRunLoopSource(self->_keyboardPortConnect);
  v4 = IONotificationPortGetRunLoopSource(self->_keyboardPortDisconnect);
  CFRunLoopRemoveSource((CFRunLoopRef)qword_1000A2470, RunLoopSource, kCFRunLoopDefaultMode);
  CFRunLoopRemoveSource((CFRunLoopRef)qword_1000A2470, v4, kCFRunLoopDefaultMode);
  IONotificationPortDestroy(self->_keyboardPortConnect);
  IONotificationPortDestroy(self->_keyboardPortDisconnect);
  v5.receiver = self;
  v5.super_class = (Class)KeyboardHelper;
  -[KeyboardHelper dealloc](&v5, "dealloc");
}

- (void)registerForKeyboardEvents
{
  IONotificationPort *v3;
  IONotificationPort *keyboardPortConnect;
  BOOL v5;
  __CFRunLoopSource *RunLoopSource;
  CFRunLoopSourceRef v7;
  BOOL v8;
  __CFRunLoopSource *v9;
  IONotificationPort *v10;
  const __CFDictionary *v11;
  kern_return_t v12;
  IONotificationPort *v13;
  const __CFDictionary *v14;

  self->_keyboardPortConnect = IONotificationPortCreate(kIOMainPortDefault);
  v3 = IONotificationPortCreate(kIOMainPortDefault);
  self->_keyboardPortDisconnect = v3;
  keyboardPortConnect = self->_keyboardPortConnect;
  if (keyboardPortConnect)
    v5 = v3 == 0;
  else
    v5 = 1;
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_100055E80();
  }
  else
  {
    RunLoopSource = IONotificationPortGetRunLoopSource(keyboardPortConnect);
    v7 = IONotificationPortGetRunLoopSource(self->_keyboardPortDisconnect);
    if (RunLoopSource)
      v8 = v7 == 0;
    else
      v8 = 1;
    if (v8)
    {
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
        sub_100055EB0();
    }
    else
    {
      v9 = v7;
      CFRunLoopAddSource((CFRunLoopRef)qword_1000A2470, RunLoopSource, kCFRunLoopDefaultMode);
      CFRunLoopAddSource((CFRunLoopRef)qword_1000A2470, v9, kCFRunLoopDefaultMode);
      v10 = self->_keyboardPortConnect;
      v11 = IOServiceMatching("AppleHIDKeyboardEventDriverV2");
      v12 = IOServiceAddMatchingNotification(v10, "IOServiceFirstMatch", v11, (IOServiceMatchingCallback)sub_10004BB7C, self, &self->_keyboardIteratorConnect);
      v13 = self->_keyboardPortConnect;
      v14 = IOServiceMatching("AppleHIDKeyboardEventDriverV2");
      if (!(v12 | IOServiceAddMatchingNotification(v13, "IOServiceTerminate", v14, (IOServiceMatchingCallback)sub_10004BB7C, self, &self->_keyboardIteratorDisconnect)))
      {
        sub_10004BB7C(self, self->_keyboardIteratorConnect);
        sub_10004BB7C(self, self->_keyboardIteratorDisconnect);
      }
    }
  }
}

- (void)registerForFolioEvents
{
  __IOHIDEventSystemClient *hidClient;
  const __CFArray *v4;
  const __CFArray *v5;
  int Count;
  CFIndex v7;
  uint64_t v8;
  const void *ValueAtIndex;
  const void *v10;
  const void *KeyboardEvent;
  NSObject *v12;
  uint64_t v13;
  const void *v14;
  NSObject *v15;
  uint8_t v16;
  _BYTE v17[15];
  uint8_t v18;
  _BYTE v19[7];
  _QWORD v20[2];
  _QWORD v21[2];

  self->_hidClient = (__IOHIDEventSystemClient *)IOHIDEventSystemClientCreate(kCFAllocatorDefault, a2);
  v20[0] = CFSTR("PrimaryUsagePage");
  v20[1] = CFSTR("PrimaryUsage");
  v21[0] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 11);
  v21[1] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 1);
  IOHIDEventSystemClientSetMatching(self->_hidClient, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v21, v20, 2));
  IOHIDEventSystemClientRegisterEventCallback(self->_hidClient, sub_10004C1D8, self, 0);
  IOHIDEventSystemClientScheduleWithRunLoop(self->_hidClient, qword_1000A2470, kCFRunLoopDefaultMode);
  hidClient = self->_hidClient;
  if (hidClient)
  {
    v4 = IOHIDEventSystemClientCopyServices(hidClient);
    if (v4)
    {
      v5 = v4;
      if (CFArrayGetCount(v4) >= 1)
      {
        Count = CFArrayGetCount(v5);
        if (Count >= 1)
        {
          v7 = 0;
          v8 = Count;
          do
          {
            ValueAtIndex = CFArrayGetValueAtIndex(v5, v7);
            if (ValueAtIndex)
            {
              v10 = ValueAtIndex;
              KeyboardEvent = (const void *)IOHIDEventCreateKeyboardEvent(kCFAllocatorDefault, 0, 65289, 17, 0, 0);
              if (!KeyboardEvent)
              {
                v12 = qword_1000A28A0;
                if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
                  sub_100055F44(&v18, v19, v12);
              }
              v13 = IOHIDServiceClientCopyEvent(v10, 3, KeyboardEvent, 0);
              if (v13)
              {
                v14 = (const void *)v13;
                -[KeyboardHelper updateFolioState:](self, "updateFolioState:", IOHIDEventGetIntegerValue(v13, 196610) != 0);
                CFRelease(v14);
              }
              else
              {
                v15 = qword_1000A28A0;
                if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
                  sub_100055F10(&v16, v17, v15);
              }
              CFRelease(KeyboardEvent);
            }
            ++v7;
          }
          while (v8 != v7);
        }
      }
      CFRelease(v5);
    }
    else if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
    {
      sub_100055EE0();
    }
  }
}

- (void)updateKeyboardState
{
  _BOOL4 v3;

  v3 = -[KeyboardHelper isKeyboardConnected](self, "isKeyboardConnected");
  if (self->_cachedIsKeyboardAttached != v3)
  {
    self->_cachedIsKeyboardAttached = v3;
    if (v3)
      -[KeyboardHelper isR18xKeyboardAttached](self, "isR18xKeyboardAttached");
    -[KeyboardHelper updateSensorExchangeKey](self, "updateSensorExchangeKey");
  }
}

- (BOOL)isR18xKeyboardAttached
{
  unsigned int v2;
  io_object_t v3;
  _BYTE v5[6];

  if (!self->_cachedIsKeyboardAttached)
    goto LABEL_6;
  v2 = sub_1000340B8("AppleOrionManager", 0, 0);
  if (v2)
  {
    v3 = v2;
    if (!sub_100034380(v2, CFSTR("IOAccessoryDigitalID"), v5, (id)6) || (v5[4] & 1) == 0)
    {
      IOObjectRelease(v3);
LABEL_6:
      LOBYTE(v2) = 0;
      return v2;
    }
    LOBYTE(v2) = 1;
  }
  return v2;
}

- (BOOL)isKeyboardConnected
{
  io_registry_entry_t v2;
  io_registry_entry_t v3;
  _BOOL4 v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v2 = sub_1000340B8("AppleHIDKeyboardEventDriverV2", 0, 0);
  v3 = sub_1000340B8("IOAccessoryIDBusHIDDevice", 0, 0);
  if (v2)
  {
    v4 = sub_100003320(v2, CFSTR("RequiresCompassResetOnConnect"));
    if (v3)
      return v4 | sub_100003320(v3, CFSTR("RequiresCompassResetOnConnect"));
  }
  else
  {
    v5 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_100055FE8(v5, v6, v7, v8, v9, v10, v11, v12);
    v4 = 0;
    if (v3)
      return v4 | sub_100003320(v3, CFSTR("RequiresCompassResetOnConnect"));
  }
  v13 = qword_1000A28A0;
  if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
    sub_100055F78(v13, v14, v15, v16, v17, v18, v19, v20);
  return v4;
}

- (void)updateFolioState:(BOOL)a3
{
  if (self->_cachedIsFolioAttached != a3)
  {
    self->_cachedIsFolioAttached = a3;
    -[KeyboardHelper updateSensorExchangeKey](self, "updateSensorExchangeKey");
  }
}

- (void)updateSensorExchangeKey
{
  unsigned int v2;
  NSObject *v3;
  uint64_t v4;
  __int16 v5;
  int v6;

  v2 = self->_cachedIsKeyboardAttached | (2 * self->_cachedIsFolioAttached);
  if (byte_1000A2480)
  {
    v3 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(v4) = 67109376;
      HIDWORD(v4) = v2;
      v5 = 1024;
      v6 = dword_1000A2458;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "<Notice> KeyboardHelper updating SDTK - NewValue: %u PreviousValue: %u", (uint8_t *)&v4, 0xEu);
    }
  }
  if (dword_1000A2458 != v2)
  {
    dword_1000A2458 = v2;
    *(float *)&dword_1000A2B30 = (float)v2;
    v4 = 0;
    switch(v2)
    {
      case 2u:
        if (qword_1000A2450)
        {
          objc_msgSend((id)qword_1000A2450, "setDockMode:options:error:", 1, 2, &v4);
          if (v4)
          {
            if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
              sub_100056118();
          }
        }
        break;
      case 1u:
        if (qword_1000A2450)
        {
          objc_msgSend((id)qword_1000A2450, "setDockMode:options:error:", 1, 1, &v4);
          if (v4)
          {
            if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
              sub_1000560B8();
          }
        }
        break;
      case 0u:
        if (qword_1000A2450)
        {
          objc_msgSend((id)qword_1000A2450, "setDockMode:options:error:", 0, 0, &v4);
          if (v4)
          {
            if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
              sub_100056058();
          }
        }
        break;
    }
  }
}

- (void)getInitialFolioState
{
  const void *KeyboardEvent;
  uint64_t v4;
  const void *v5;

  qword_1000A2E48 = IOHIDEventSystemCreate(kCFAllocatorDefault, a2);
  if (!qword_1000A2E48 && os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
    sub_100056178();
  KeyboardEvent = (const void *)IOHIDEventCreateKeyboardEvent(0, 0, 65289, 17, 0, 0);
  v4 = IOHIDEventSystemCopyEvent(qword_1000A2E48, 3, KeyboardEvent, 0);
  if (v4)
  {
    v5 = (const void *)v4;
    -[KeyboardHelper updateFolioState:](self, "updateFolioState:", IOHIDEventGetIntegerValue(v4, 196610) != 0);
    CFRelease(v5);
  }
  CFRelease(KeyboardEvent);
}

@end
