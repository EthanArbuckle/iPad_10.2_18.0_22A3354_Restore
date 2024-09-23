@implementation WebLowPowerModeObserver

- (BOOL)isLowPowerModeEnabled
{
  return self->_isLowPowerModeEnabled;
}

- (WebLowPowerModeObserver)initWithNotifier:(void *)a3
{
  WebLowPowerModeObserver *v4;
  WebLowPowerModeObserver *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WebLowPowerModeObserver;
  v4 = -[WebLowPowerModeObserver init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_notifier = a3;
    v4->_isLowPowerModeEnabled = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3898], "processInfo"), "isLowPowerModeEnabled");
    v6 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    objc_msgSend(v6, "addObserver:selector:name:object:", v5, sel__didReceiveLowPowerModeChange, *MEMORY[0x1E0CB3048], 0);
  }
  return v5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0CB3048], 0);
  v4.receiver = self;
  v4.super_class = (Class)WebLowPowerModeObserver;
  -[WebLowPowerModeObserver dealloc](&v4, sel_dealloc);
}

- (void)_didReceiveLowPowerModeChange
{
  _QWORD *v3;
  _QWORD *v4;

  self->_isLowPowerModeEnabled = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3898], "processInfo"), "isLowPowerModeEnabled");
  CFRetain(self);
  v3 = (_QWORD *)WTF::fastMalloc((WTF *)0x18);
  *v3 = &off_1E3331780;
  v3[1] = self;
  v3[2] = self;
  v4 = v3;
  WTF::callOnMainThread();
  if (v4)
    (*(void (**)(_QWORD *))(*v4 + 8))(v4);
}

- (void)notifier
{
  return self->_notifier;
}

- (void)setNotifier:(void *)a3
{
  self->_notifier = a3;
}

- (_QWORD)_didReceiveLowPowerModeChange
{
  const void *v2;

  *a1 = &off_1E3331780;
  v2 = (const void *)a1[2];
  a1[2] = 0;
  if (v2)
    CFRelease(v2);
  return a1;
}

- (uint64_t)_didReceiveLowPowerModeChange
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  NSObject *v4;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(result + 8);
  v2 = *(_QWORD *)(v1 + 16);
  if (v2)
  {
    v3 = *(unsigned __int8 *)(v1 + 8);
    v4 = qword_1ECE7C680;
    if (os_log_type_enabled((os_log_t)qword_1ECE7C680, OS_LOG_TYPE_DEFAULT))
    {
      v5[0] = 67109120;
      v5[1] = v3;
      _os_log_impl(&dword_1940B8000, v4, OS_LOG_TYPE_DEFAULT, "Low power mode state has changed to %d", (uint8_t *)v5, 8u);
    }
    return (*(uint64_t (**)(_QWORD, BOOL))(**(_QWORD **)(v2 + 8) + 16))(*(_QWORD *)(v2 + 8), v3 != 0);
  }
  return result;
}

@end
