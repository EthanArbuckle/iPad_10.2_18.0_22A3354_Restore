@implementation PLCFNotificationOperatorComposition

- (id)operatorBlock
{
  return self->_operatorBlock;
}

- (int)stateToken
{
  return self->_stateToken;
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (BOOL)isStateRequired
{
  return self->_isStateRequired;
}

- (NSString)notificationName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (PLCFNotificationOperatorComposition)initWithWorkQueue:(id)a3 forNotification:(id)a4 requireState:(BOOL)a5 withBlock:(id)a6
{
  id v11;
  id v12;
  id v13;
  PLCFNotificationOperatorComposition *v14;
  PLCFNotificationOperatorComposition *v15;
  uint64_t v16;
  id operatorBlock;
  PLCFNotificationOperatorComposition *v18;
  objc_super v20;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)PLCFNotificationOperatorComposition;
  v14 = -[PLCFNotificationOperatorComposition init](&v20, sel_init);
  v15 = v14;
  if (!v14)
    goto LABEL_3;
  objc_storeStrong((id *)&v14->_workQueue, a3);
  v16 = MEMORY[0x1BCC9EB70](v13);
  operatorBlock = v15->_operatorBlock;
  v15->_operatorBlock = (id)v16;

  objc_storeStrong((id *)&v15->_notificationName, a4);
  v15->_isStateRequired = a5;
  v15->_stateToken = 0;
  if (!-[PLCFNotificationOperatorComposition listenForNotifications:](v15, "listenForNotifications:", 1))
  {
    -[PLCFNotificationOperatorComposition listenForNotifications:](v15, "listenForNotifications:", 0);
    v18 = 0;
  }
  else
  {
LABEL_3:
    v18 = v15;
  }

  return v18;
}

- (PLCFNotificationOperatorComposition)initWithOperator:(id)a3 forNotification:(id)a4 requireState:(BOOL)a5 withBlock:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  PLCFNotificationOperatorComposition *v14;

  v7 = a5;
  v10 = a3;
  v11 = a6;
  v12 = a4;
  objc_msgSend(v10, "workQueue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[PLCFNotificationOperatorComposition initWithWorkQueue:forNotification:requireState:withBlock:](self, "initWithWorkQueue:forNotification:requireState:withBlock:", v13, v12, v7, v11);

  if (v14)
    objc_storeWeak((id *)&v14->_operator, v10);

  return v14;
}

- (BOOL)listenForNotifications:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  const char *v6;
  __CFNotificationCenter *v8;
  __CFNotificationCenter *DarwinNotifyCenter;

  v3 = a3;
  if (-[PLCFNotificationOperatorComposition listeningForNotifications](self, "listeningForNotifications") != a3)
  {
    -[PLCFNotificationOperatorComposition setListeningForNotifications:](self, "setListeningForNotifications:", v3);
    if (v3)
    {
      if (-[PLCFNotificationOperatorComposition isStateRequired](self, "isStateRequired"))
      {
        -[PLCFNotificationOperatorComposition notificationName](self, "notificationName");
        v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v6 = (const char *)objc_msgSend(v5, "UTF8String");

        if (notify_register_check(v6, &self->_stateToken))
        {
          -[PLCFNotificationOperatorComposition setListeningForNotifications:](self, "setListeningForNotifications:", 0);
          return 0;
        }
      }
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)notificationCallback, (CFStringRef)-[PLCFNotificationOperatorComposition notificationName](self, "notificationName"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    }
    else
    {
      v8 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterRemoveObserver(v8, self, (CFNotificationName)-[PLCFNotificationOperatorComposition notificationName](self, "notificationName"), 0);
    }
  }
  return 1;
}

- (void)dealloc
{
  objc_super v3;

  -[PLCFNotificationOperatorComposition listenForNotifications:](self, "listenForNotifications:", 0);
  v3.receiver = self;
  v3.super_class = (Class)PLCFNotificationOperatorComposition;
  -[PLCFNotificationOperatorComposition dealloc](&v3, sel_dealloc);
}

- (void)setNotificationName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void)setOperatorBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)listeningForNotifications
{
  return self->_listeningForNotifications;
}

- (void)setListeningForNotifications:(BOOL)a3
{
  self->_listeningForNotifications = a3;
}

- (void)setStateToken:(int)a3
{
  self->_stateToken = a3;
}

- (PLOperator)operator
{
  return (PLOperator *)objc_loadWeakRetained((id *)&self->_operator);
}

- (void)setOperator:(id)a3
{
  objc_storeWeak((id *)&self->_operator, a3);
}

- (void)setWorkQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void)setIsStateRequired:(BOOL)a3
{
  self->_isStateRequired = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_operator);
  objc_storeStrong(&self->_operatorBlock, 0);
  objc_storeStrong((id *)&self->_notificationName, 0);
}

@end
