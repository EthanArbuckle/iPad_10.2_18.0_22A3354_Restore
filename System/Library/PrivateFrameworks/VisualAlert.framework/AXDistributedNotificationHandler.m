@implementation AXDistributedNotificationHandler

- (void)_startObserving
{
  __CFNotificationCenter *DarwinNotifyCenter;
  const void *observerIdentifier;
  __CFString *v5;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  observerIdentifier = (const void *)self->super._observerIdentifier;
  -[VISAXNotificationHandler _notificationName](self, "_notificationName");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, observerIdentifier, (CFNotificationCallback)_HandleDistributedNotification, v5, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

}

- (void)_stopObserving
{
  __CFNotificationCenter *DarwinNotifyCenter;
  const void *observerIdentifier;
  __CFString *v5;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  observerIdentifier = (const void *)self->super._observerIdentifier;
  -[VISAXNotificationHandler _notificationName](self, "_notificationName");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, observerIdentifier, v5, 0);

}

+ (void)postDistributedNotificationWithName:(id)a3
{
  __CFString *v3;
  void *v4;
  char v5;
  void *v6;
  NSObject *v7;
  os_log_type_t v8;
  void *v9;
  void *v10;
  __CFNotificationCenter *DarwinNotifyCenter;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = (__CFString *)a3;
  objc_msgSend(MEMORY[0x24BE00710], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "ignoreLogging");

  if ((v5 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BE00710], "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    AXLoggerForFacility();
    v7 = objc_claimAutoreleasedReturnValue();

    v8 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v7, v8))
    {
      AXColorizeFormatLog();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      _AXStringForArgs();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, v8))
      {
        *(_DWORD *)buf = 138543362;
        v13 = v10;
        _os_log_impl(&dword_21FD32000, v7, v8, "%{public}@", buf, 0xCu);
      }

    }
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, v3, 0, 0, 1u);

}

- (id)_notificationTypeDescription
{
  return CFSTR("distributed");
}

@end
