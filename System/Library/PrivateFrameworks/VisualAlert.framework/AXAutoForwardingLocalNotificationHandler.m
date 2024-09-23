@implementation AXAutoForwardingLocalNotificationHandler

- (AXAutoForwardingLocalNotificationHandler)initWithNotificationName:(id)a3 target:(id)a4 handler:(SEL)a5
{
  _QWORD v6[5];

  v6[1] = 3221225472;
  v6[2] = __84__AXAutoForwardingLocalNotificationHandler_initWithNotificationName_target_handler___block_invoke;
  v6[3] = &__block_descriptor_40_e40__32__0__NSString_8r_v16__NSDictionary_24l;
  v6[4] = a5;
  v6[0] = MEMORY[0x24BDAC760];
  return -[AXAutoForwardingLocalNotificationHandler initWithNotificationName:target:dispatcher:possibleHandlers:](self, "initWithNotificationName:target:dispatcher:possibleHandlers:", a3, a4, v6, a5, 0);
}

uint64_t __84__AXAutoForwardingLocalNotificationHandler_initWithNotificationName_target_handler___block_invoke(uint64_t a1)
{
  return *(_QWORD *)(a1 + 32);
}

- (AXAutoForwardingLocalNotificationHandler)initWithNotificationName:(id)a3 target:(id)a4 dispatcher:(id)a5 startObserving:(BOOL)a6
{
  void *v7;
  uint64_t v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;

  v7 = (void *)MEMORY[0x24BDBCE88];
  v8 = *MEMORY[0x24BDBCA98];
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithNotificationName_target_dispatcher_possibleHandlers_);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "raise:format:", v8, CFSTR("Can't initialize an instance of %@ with initializer %@. If you need to provide a complex dispatcher (i.e. if you have more than 1 possible handler), you need to use %@ and provide a list of all the handler selectors that might be returned by your dispatcher."), v10, v11, v12);

  return 0;
}

- (AXAutoForwardingLocalNotificationHandler)initWithNotificationName:(id)a3 target:(id)a4 dispatcher:(id)a5 possibleHandlers:(SEL)a6
{
  AXAutoForwardingLocalNotificationHandler *v7;
  size_t v8;
  unint64_t v9;
  SEL *v10;
  SEL *v11;
  unint64_t v12;
  uint64_t v13;
  SEL *v14;
  void *v15;
  char v16;
  void *v17;
  NSObject *v18;
  os_log_type_t v19;
  void *v20;
  void *v21;
  void *v22;
  AXAutoForwardingLocalNotificationHandler *v24;
  void *v25;
  void *v26;
  SEL *v27;
  objc_super v28;
  uint8_t buf[4];
  void *v30;
  uint64_t v31;
  uint64_t v32;

  v31 = *MEMORY[0x24BDAC8D0];
  v28.receiver = self;
  v28.super_class = (Class)AXAutoForwardingLocalNotificationHandler;
  v7 = -[VISAXNotificationHandler initWithNotificationName:target:dispatcher:startObserving:](&v28, sel_initWithNotificationName_target_dispatcher_startObserving_, a3, a4, a5, 0);
  if (v7)
  {
    v27 = 0;
    if (a6)
    {
      v8 = 0;
      v9 = 0;
      v27 = (SEL *)&v32;
      do
      {
        v10 = v27++;
        ++v9;
        v8 += 8;
      }
      while (*v10);
      if (v9)
      {
        v11 = (SEL *)malloc_type_malloc(v8, 0xCEE6D6EEuLL);
        v7->_possibleHandlers = v11;
        if (v11)
        {
          *v11 = a6;
          v27 = (SEL *)&v32;
          if (v9 >= 2)
          {
            v12 = v9 - 1;
            v13 = 1;
            do
            {
              v14 = v27++;
              v7->_possibleHandlers[v13++] = *v14;
              --v12;
            }
            while (v12);
          }
          v7->_possibleHandlersCount = v9;
        }
      }
    }
    objc_msgSend(MEMORY[0x24BE00710], "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "ignoreLogging");

    if ((v16 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BE00710], "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      AXLoggerForFacility();
      v18 = objc_claimAutoreleasedReturnValue();

      v19 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v18, v19))
      {
        AXColorizeFormatLog();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[AXAutoForwardingLocalNotificationHandler _notificationTypeDescription](v7, "_notificationTypeDescription");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[VISAXNotificationHandler _notificationName](v7, "_notificationName");
        v25 = v21;
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v7;
        _AXStringForArgs();
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v18, v19))
        {
          *(_DWORD *)buf = 138543362;
          v30 = v22;
          _os_log_impl(&dword_21FD32000, v18, v19, "%{public}@", buf, 0xCu);
        }

      }
    }
    -[AXAutoForwardingLocalNotificationHandler _startObserving](v7, "_startObserving", v24, v25, v26, v27);
    v7->super.super._valid = 1;
  }
  return v7;
}

- (void)dealloc
{
  SEL *possibleHandlers;
  objc_super v4;

  -[VISAXNotificationHandler invalidate](self, "invalidate");
  possibleHandlers = self->_possibleHandlers;
  if (possibleHandlers)
    free(possibleHandlers);
  v4.receiver = self;
  v4.super_class = (Class)AXAutoForwardingLocalNotificationHandler;
  -[VISAXNotificationHandler dealloc](&v4, sel_dealloc);
}

- (void)processHandler:(SEL)a3
{
  __CFString *v5;
  void *v6;
  char v7;
  void *v8;
  NSObject *v9;
  os_log_type_t v10;
  void *v11;
  void *v12;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v14.receiver = self;
  v14.super_class = (Class)AXAutoForwardingLocalNotificationHandler;
  -[VISAXNotificationHandler processHandler:](&v14, sel_processHandler_);
  if (AXProcessIsSpringBoard())
  {
    -[AXAutoForwardingLocalNotificationHandler _forwardDistributedNotificationNameForHandler:](self, "_forwardDistributedNotificationNameForHandler:", a3);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE00710], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "ignoreLogging");

    if ((v7 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BE00710], "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      AXLoggerForFacility();
      v9 = objc_claimAutoreleasedReturnValue();

      v10 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v9, v10))
      {
        AXColorizeFormatLog();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        _AXStringForArgs();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, v10))
        {
          *(_DWORD *)buf = 138543362;
          v16 = v12;
          _os_log_impl(&dword_21FD32000, v9, v10, "%{public}@", buf, 0xCu);
        }

      }
    }
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, v5, 0, 0, 1u);

  }
}

- (id)_prefixForForwardDistributedNotificationName
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VISAXNotificationHandler _notificationName](self, "_notificationName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VISAXNotificationHandler _target](self, "_target");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@__%@__%@__"), v5, v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_forwardDistributedNotificationNameForHandler:(SEL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x24BDD17C8];
  -[AXAutoForwardingLocalNotificationHandler _prefixForForwardDistributedNotificationName](self, "_prefixForForwardDistributedNotificationName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@%@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)_handleForwardDistributedNotificationWithName:(id)a3 object:(const void *)a4 userInfo:(id)a5
{
  id v6;
  void *v7;
  NSString *v8;
  SEL v9;
  BOOL v10;

  v6 = a3;
  -[AXAutoForwardingLocalNotificationHandler _prefixForForwardDistributedNotificationName](self, "_prefixForForwardDistributedNotificationName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "hasPrefix:", v7))
    goto LABEL_5;
  objc_msgSend(v6, "substringFromIndex:", objc_msgSend(v7, "length"));
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  v9 = NSSelectorFromString(v8);
  if (!v9)
  {

LABEL_5:
    _AXAssert();
    v10 = 0;
    goto LABEL_6;
  }
  -[AXAutoForwardingLocalNotificationHandler processHandler:](self, "processHandler:", v9);

  v10 = 1;
LABEL_6:

  return v10;
}

- (void)_startObserving
{
  uint64_t v3;
  Class v4;
  unint64_t v5;
  uint64_t (*v6)();
  __CFString *v7;
  void *v8;
  char v9;
  void *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t (*v15)();
  void *v16;
  void *v17;
  __CFNotificationCenter *DarwinNotifyCenter;
  AXAutoForwardingLocalNotificationHandler *v19;
  __CFString *v20;
  objc_super v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  if (AXProcessIsSpringBoard())
  {
    v21.receiver = self;
    v21.super_class = (Class)AXAutoForwardingLocalNotificationHandler;
    -[AXLocalNotificationHandler _startObserving](&v21, sel__startObserving);
  }
  else if (self->_possibleHandlers)
  {
    v3 = 64;
    if (self->_possibleHandlersCount)
    {
      v4 = 0;
      v5 = 0x24BE00000uLL;
      v6 = _HandleDistributedNotification;
      do
      {
        -[AXAutoForwardingLocalNotificationHandler _forwardDistributedNotificationNameForHandler:](self, "_forwardDistributedNotificationNameForHandler:", self->_possibleHandlers[(_QWORD)v4], v19, v20);
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v5 + 1808), "sharedInstance");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "ignoreLogging");

        if ((v9 & 1) == 0)
        {
          objc_msgSend(*(id *)(v5 + 1808), "identifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          AXLoggerForFacility();
          v11 = objc_claimAutoreleasedReturnValue();

          v12 = AXOSLogLevelFromAXLogLevel();
          if (os_log_type_enabled(v11, v12))
          {
            v13 = v3;
            v14 = v5;
            v15 = v6;
            AXColorizeFormatLog();
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = self;
            v20 = v7;
            _AXStringForArgs();
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v11, v12))
            {
              *(_DWORD *)buf = 138543362;
              v23 = v17;
              _os_log_impl(&dword_21FD32000, v11, v12, "%{public}@", buf, 0xCu);
            }

            v6 = v15;
            v5 = v14;
            v3 = v13;
          }

        }
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFNotificationCenterAddObserver(DarwinNotifyCenter, (const void *)self->super.super._observerIdentifier, (CFNotificationCallback)v6, v7, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

        v4 = (Class)((char *)v4 + 1);
      }
      while (v4 < *(Class *)((char *)&self->super.super.super.isa + v3));
    }
  }
}

- (void)_stopObserving
{
  unint64_t v3;
  __CFString *v4;
  void *v5;
  char v6;
  void *v7;
  NSObject *v8;
  os_log_type_t v9;
  void *v10;
  void *v11;
  __CFNotificationCenter *DarwinNotifyCenter;
  AXAutoForwardingLocalNotificationHandler *v13;
  __CFString *v14;
  objc_super v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if ((AXProcessIsSpringBoard() & 1) != 0)
  {
    v15.receiver = self;
    v15.super_class = (Class)AXAutoForwardingLocalNotificationHandler;
    -[AXLocalNotificationHandler _stopObserving](&v15, sel__stopObserving);
  }
  else if (self->_possibleHandlersCount)
  {
    v3 = 0;
    do
    {
      -[AXAutoForwardingLocalNotificationHandler _forwardDistributedNotificationNameForHandler:](self, "_forwardDistributedNotificationNameForHandler:", self->_possibleHandlers[v3], v13, v14);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE00710], "sharedInstance");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "ignoreLogging");

      if ((v6 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x24BE00710], "identifier");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        AXLoggerForFacility();
        v8 = objc_claimAutoreleasedReturnValue();

        v9 = AXOSLogLevelFromAXLogLevel();
        if (os_log_type_enabled(v8, v9))
        {
          AXColorizeFormatLog();
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = self;
          v14 = v4;
          _AXStringForArgs();
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v8, v9))
          {
            *(_DWORD *)buf = 138543362;
            v17 = v11;
            _os_log_impl(&dword_21FD32000, v8, v9, "%{public}@", buf, 0xCu);
          }

        }
      }
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterRemoveObserver(DarwinNotifyCenter, (const void *)self->super.super._observerIdentifier, v4, 0);

      ++v3;
    }
    while (v3 < self->_possibleHandlersCount);
  }
}

- (id)_notificationTypeDescription
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v2 = (void *)MEMORY[0x24BDD17C8];
  v6.receiver = self;
  v6.super_class = (Class)AXAutoForwardingLocalNotificationHandler;
  -[AXLocalNotificationHandler _notificationTypeDescription](&v6, sel__notificationTypeDescription);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("auto-forwarding %@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
