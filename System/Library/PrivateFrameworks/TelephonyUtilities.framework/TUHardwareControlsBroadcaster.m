@implementation TUHardwareControlsBroadcaster

- (TUHardwareControlsBroadcaster)init
{
  TUHardwareControlsBroadcaster *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v7[16];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TUHardwareControlsBroadcaster;
  v2 = -[TUHardwareControlsBroadcaster init](&v8, sel_init);
  if (v2)
  {
    TUDefaultLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_19A50D000, v3, OS_LOG_TYPE_DEFAULT, "TUHardwareControlsBroadcaster starting to listen for hardware controls.", v7, 2u);
    }

    v2->_hidEventSystemClientRef = (__IOHIDEventSystemClient *)IOHIDEventSystemClientCreate();
    CFRunLoopGetCurrent();
    IOHIDEventSystemClientScheduleWithRunLoop();
    IOHIDEventSystemClientRegisterEventCallback();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", &unk_1E38E97B0, CFSTR("DeviceUsage"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);
    IOHIDEventSystemClientSetMatchingMultiple();

  }
  return v2;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[16];

  TUDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19A50D000, v3, OS_LOG_TYPE_DEFAULT, "TUHardwareControlsBroadcaster deallocating - stopping listening for hardware controls.", buf, 2u);
  }

  CFRunLoopGetCurrent();
  IOHIDEventSystemClientUnscheduleWithRunLoop();
  CFRelease(self->_hidEventSystemClientRef);
  v4.receiver = self;
  v4.super_class = (Class)TUHardwareControlsBroadcaster;
  -[TUHardwareControlsBroadcaster dealloc](&v4, sel_dealloc);
}

- (void)longPressTimerFired:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  TUHardwareControlsBroadcaster *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__TUHardwareControlsBroadcaster_longPressTimerFired___block_invoke;
  v6[3] = &unk_1E38A1388;
  v7 = v4;
  v8 = self;
  v5 = v4;
  TUGuaranteeExecutionOnMainThreadAsync(v6);

}

void __53__TUHardwareControlsBroadcaster_longPressTimerFired___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  __CFString *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:userInfo:", CFSTR("TUCarPlayHardwareControlEventNotification"), 0, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotification:", v3);

  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v3;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "TUHardwareControlsBroadcaster long press timer fired, posting: %@", (uint8_t *)&v7, 0xCu);
  }

  objc_msgSend(v2, "valueForKey:", CFSTR("kTUCarPlayHardwareControlButtonNameKey"));
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v6 == CFSTR("kTUCarPlayHardwareControlButtonWhiteTelephoneLongPress"))
    objc_msgSend(*(id *)(a1 + 40), "setEventTypeToIgnore:", CFSTR("kTUCarPlayHardwareControlButtonWhiteTelephone"));
  objc_msgSend(*(id *)(a1 + 32), "invalidate");

}

- (NSString)eventTypeToIgnore
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setEventTypeToIgnore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventTypeToIgnore, 0);
}

@end
