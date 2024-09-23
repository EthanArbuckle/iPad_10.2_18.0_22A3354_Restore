@implementation AXLocalNotificationHandler

- (void)_startObservingWithObject:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  unint64_t observerIdentifier;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];

  v4 = (void *)MEMORY[0x24BDD16D0];
  v5 = a3;
  objc_msgSend(v4, "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  observerIdentifier = self->super._observerIdentifier;
  -[VISAXNotificationHandler _notificationName](self, "_notificationName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __56__AXLocalNotificationHandler__startObservingWithObject___block_invoke;
  v11[3] = &__block_descriptor_40_e24_v16__0__NSNotification_8l;
  v11[4] = observerIdentifier;
  objc_msgSend(v6, "addObserverForName:object:queue:usingBlock:", v8, v5, v9, v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[AXLocalNotificationHandler _setOpaqueObserver:](self, "_setOpaqueObserver:", v10);
}

void __56__AXLocalNotificationHandler__startObservingWithObject___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  +[VISAXNotificationHandler _safelyGetObserverForIdentifier:](VISAXNotificationHandler, "_safelyGetObserverForIdentifier:", v2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "_handleNotificationWithName:object:userInfo:", v4, v5, v6);
}

- (void)_stopObservingWithObject:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x24BDD16D0];
  v5 = a3;
  objc_msgSend(v4, "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXLocalNotificationHandler _opaqueObserver](self, "_opaqueObserver");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VISAXNotificationHandler _notificationName](self, "_notificationName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:name:object:", v7, v8, v5);

  -[AXLocalNotificationHandler _setOpaqueObserver:](self, "_setOpaqueObserver:", 0);
}

- (void)_startObserving
{
  -[AXLocalNotificationHandler _startObservingWithObject:](self, "_startObservingWithObject:", 0);
}

- (void)_stopObserving
{
  -[AXLocalNotificationHandler _stopObservingWithObject:](self, "_stopObservingWithObject:", 0);
}

- (id)_notificationTypeDescription
{
  return CFSTR("local");
}

- (id)_opaqueObserver
{
  return self->_opaqueObserver;
}

- (void)_setOpaqueObserver:(id)a3
{
  objc_storeStrong(&self->_opaqueObserver, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_opaqueObserver, 0);
}

@end
