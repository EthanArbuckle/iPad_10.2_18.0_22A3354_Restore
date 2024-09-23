@implementation SDSmartCoverMonitor

- (void)postNotification:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "postNotificationName:object:userInfo:", v3, 0, 0);

}

- (SDSmartCoverMonitor)init
{
  SDSmartCoverMonitor *v2;
  SDSmartCoverMonitor *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SDSmartCoverMonitor;
  v2 = -[SDSmartCoverMonitor init](&v5, "init");
  v3 = v2;
  if (v2)
  {
    *(_WORD *)&v2->_smartCoverIsClosed = 0;
    v2->_openStateIsEngaged = 0;
    v2->_lock._os_unfair_lock_opaque = 0;
    v2->_mHIDClient = 0;
    -[SDSmartCoverMonitor installSmartCoverMonitor](v2, "installSmartCoverMonitor");
  }
  return v3;
}

- (void)dealloc
{
  __IOHIDEventSystemClient *mHIDClient;
  objc_super v4;

  mHIDClient = self->_mHIDClient;
  if (mHIDClient)
    CFRelease(mHIDClient);
  v4.receiver = self;
  v4.super_class = (Class)SDSmartCoverMonitor;
  -[SDSmartCoverMonitor dealloc](&v4, "dealloc");
}

- (void)installSmartCoverMonitor
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  __IOHIDEventSystemClient *v10;
  __IOHIDEventSystemClient *mHIDClient;
  CFRunLoopRef Main;
  __IOHIDEventSystemClient *v13;
  uint8_t v14[8];
  _QWORD v15[2];
  _QWORD v16[2];

  v3 = SFDeviceClassCodeGet(self, a2);
  v4 = v3;
  v5 = daemon_log(v3);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v4 == 3)
  {
    if (v7)
    {
      *(_WORD *)v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Starting smart cover monitor", v14, 2u);
    }

    os_unfair_lock_lock(&self->_lock);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 65280));
    v15[0] = v8;
    v16[0] = CFSTR("PrimaryUsagePage");
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 6));
    v15[1] = v9;
    v16[1] = CFSTR("PrimaryUsage");
    v6 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v16, v15, 2));

    v10 = (__IOHIDEventSystemClient *)IOHIDEventSystemClientCreateWithType(kCFAllocatorDefault, 1, 0);
    self->_mHIDClient = v10;
    if (v10)
    {
      IOHIDEventSystemClientSetMatching(v10, v6);
      IOHIDEventSystemClientRegisterEventCallback(self->_mHIDClient, sub_10001BC80, 0, self);
      mHIDClient = self->_mHIDClient;
      Main = CFRunLoopGetMain();
      IOHIDEventSystemClientScheduleWithRunLoop(mHIDClient, Main, kCFRunLoopDefaultMode);
      v13 = self->_mHIDClient;
    }
    else
    {
      v13 = 0;
    }
    -[SDSmartCoverMonitor updateSmartCoverIsClosed:](self, "updateSmartCoverIsClosed:", -[SDSmartCoverMonitor isSmartCoverClosed:](self, "isSmartCoverClosed:", v13));
    os_unfair_lock_unlock(&self->_lock);
  }
  else if (v7)
  {
    *(_WORD *)v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Not starting smart cover monitor", v14, 2u);
  }

}

- (id)description
{
  id v3;
  unsigned int v4;
  const char *v5;
  id v6;
  id v8;
  id v9;

  v9 = 0;
  NSAppendPrintF(&v9, "-- SDSmartCoverMonitor --\n");
  v3 = v9;
  v8 = v3;
  v4 = -[SDSmartCoverMonitor smartCoverIsClosed](self, "smartCoverIsClosed");
  v5 = "no";
  if (v4)
    v5 = "yes";
  NSAppendPrintF(&v8, "Smart Cover Closed:           %@\n", v5);
  v6 = v8;

  return v6;
}

- (void)updateSmartCoverIsClosed:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  NSObject *v6;
  const __CFString *v7;
  int v8;
  const __CFString *v9;

  if (self->_smartCoverIsClosed != a3)
  {
    v3 = a3;
    v5 = daemon_log(self);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = CFSTR("NO");
      if (v3)
        v7 = CFSTR("YES");
      v8 = 138412290;
      v9 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "smartCoverIsClosed changed: closed %@", (uint8_t *)&v8, 0xCu);
    }

    self->_smartCoverIsClosed = v3;
    -[SDSmartCoverMonitor postNotification:](self, "postNotification:", CFSTR("com.apple.sharingd.SmartCoverClosedChanged"));
  }
}

- (void)handleButtonEvent:(__IOHIDEvent *)a3
{
  uint64_t IntegerValue;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  const char *v17;
  _BOOL8 v18;
  _BYTE v19[24];

  IntegerValue = IOHIDEventGetIntegerValue(a3, 196608);
  v6 = IOHIDEventGetIntegerValue(a3, 196609);
  if (IntegerValue == 65289 && v6 == 2)
  {
    v14 = IOHIDEventGetIntegerValue(a3, 196610);
    self->_flap1StateIsEngaged = v14 == 1;
    v15 = daemon_log(v14);
    v10 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v16 = "YES";
      if (self->_flap1StateIsEngaged)
        v17 = "YES";
      else
        v17 = "NO";
      if (!self->_openStateIsEngaged)
        v16 = "NO";
      *(_DWORD *)v19 = 136446466;
      *(_QWORD *)&v19[4] = v17;
      *(_WORD *)&v19[12] = 2082;
      *(_QWORD *)&v19[14] = v16;
      v13 = "flap1IsEngaged (updated) = %{public}s openIsEngaged = %{public}s";
      goto LABEL_21;
    }
  }
  else
  {
    if (IntegerValue != 65289 || v6 != 1)
      goto LABEL_23;
    v8 = IOHIDEventGetIntegerValue(a3, 196610);
    self->_openStateIsEngaged = v8 == 1;
    v9 = daemon_log(v8);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = "YES";
      if (self->_flap1StateIsEngaged)
        v12 = "YES";
      else
        v12 = "NO";
      if (!self->_openStateIsEngaged)
        v11 = "NO";
      *(_DWORD *)v19 = 136446466;
      *(_QWORD *)&v19[4] = v12;
      *(_WORD *)&v19[12] = 2082;
      *(_QWORD *)&v19[14] = v11;
      v13 = "flap1IsEngaged = %{public}s openIsEngaged (updated) = %{public}s";
LABEL_21:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v13, v19, 0x16u);
    }
  }

LABEL_23:
  v18 = self->_flap1StateIsEngaged && self->_openStateIsEngaged;
  -[SDSmartCoverMonitor updateSmartCoverIsClosed:](self, "updateSmartCoverIsClosed:", v18, *(_OWORD *)v19, *(_QWORD *)&v19[16]);
}

- (void)handleEvent:(__IOHIDEvent *)a3
{
  unsigned int v5;
  _BOOL8 v6;

  if (a3)
    CFRetain(a3);
  os_unfair_lock_lock(&self->_lock);
  v5 = -[SDSmartCoverMonitor smartCoverIsClosed](self, "smartCoverIsClosed");
  if (IOHIDEventGetType(a3) == 3)
    -[SDSmartCoverMonitor handleButtonEvent:](self, "handleButtonEvent:", a3);
  v6 = -[SDSmartCoverMonitor smartCoverIsClosed](self, "smartCoverIsClosed");
  if (v5 != v6)
    -[SDSmartCoverMonitor updateSmartCoverIsClosed:](self, "updateSmartCoverIsClosed:", v6);
  if (a3)
    CFRelease(a3);
  os_unfair_lock_unlock(&self->_lock);
}

- (BOOL)isSmartCoverClosed:(__IOHIDEventSystemClient *)a3
{
  CFArrayRef v4;
  unsigned int v5;
  uint64_t v6;
  char v7;
  BOOL v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  const char *v12;
  int v14;
  const char *v15;
  __int16 v16;
  const char *v17;

  if (!a3)
    return 0;
  v4 = IOHIDEventSystemClientCopyServices(a3);
  v5 = -[SDSmartCoverMonitor getSmartCoverState:usage:](self, "getSmartCoverState:usage:", v4, 1);
  v6 = -[SDSmartCoverMonitor getSmartCoverState:usage:](self, "getSmartCoverState:usage:", v4, 2);
  v7 = v6 | v5;
  v8 = (v6 | v5) == 3;
  self->_flap1StateIsEngaged = (v7 & 2) != 0;
  self->_openStateIsEngaged = v7 & 1;
  v9 = daemon_log(v6);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = "YES";
    if (self->_flap1StateIsEngaged)
      v12 = "YES";
    else
      v12 = "NO";
    if (!self->_openStateIsEngaged)
      v11 = "NO";
    v14 = 136446466;
    v15 = v12;
    v16 = 2082;
    v17 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "flap1IsEngaged = %{public}s openIsEngaged = %{public}s", (uint8_t *)&v14, 0x16u);
  }

  if (v4)
    CFRelease(v4);
  return v8;
}

- (unsigned)getSmartCoverState:(__CFArray *)a3 usage:(unsigned int)a4
{
  uint64_t v4;
  CFIndex Count;
  CFIndex v7;
  unsigned int v8;
  CFIndex i;
  const void *ValueAtIndex;
  const void *KeyboardEvent;
  uint64_t v12;
  const void *v13;
  int v14;

  if (!a3)
    return 0;
  v4 = *(_QWORD *)&a4;
  Count = CFArrayGetCount(a3);
  if (Count < 1)
    return 0;
  v7 = Count;
  v8 = 0;
  for (i = 0; i != v7; ++i)
  {
    ValueAtIndex = CFArrayGetValueAtIndex(a3, i);
    KeyboardEvent = (const void *)IOHIDEventCreateKeyboardEvent(kCFAllocatorDefault, 0, 65289, v4, 0, 0);
    v12 = IOHIDServiceClientCopyEvent(ValueAtIndex, 3, KeyboardEvent, 0);
    if (v12)
    {
      v13 = (const void *)v12;
      if (IOHIDEventGetIntegerValue(v12, 196610))
        v14 = v4;
      else
        v14 = 0;
      v8 |= v14;
      CFRelease(v13);
    }
    if (KeyboardEvent)
      CFRelease(KeyboardEvent);
  }
  return v8;
}

- (BOOL)smartCoverIsClosed
{
  return self->_smartCoverIsClosed;
}

@end
