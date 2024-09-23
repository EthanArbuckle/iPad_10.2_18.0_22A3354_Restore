@implementation AXTelephonyNotificationHandler

- (void)_startObserving
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[VISAXNotificationHandler _notificationName](self, "_notificationName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__handleNotification_, v3, 0);

}

- (void)_handleNotification:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)MEMORY[0x24BDD16D0];
  v4 = a3;
  objc_msgSend(v3, "defaultCenter");
  objc_msgSend(v4, "name");
  objc_msgSend(v4, "object");
  objc_msgSend(v4, "userInfo");

  AXPerformBlockSynchronouslyOnMainThread();
}

- (void)_stopObserving
{
  id v3;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

}

- (id)_notificationTypeDescription
{
  return CFSTR("telephony");
}

@end
