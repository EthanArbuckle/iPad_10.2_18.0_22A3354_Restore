@implementation NCLayoutLoopDetector

- (NCLayoutLoopDetector)init
{
  NCLayoutLoopDetector *v2;
  NCLayoutLoopDetector *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  NSMutableArray *notificationLayoutsInProgress;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *queue;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)NCLayoutLoopDetector;
  v2 = -[NCLayoutLoopDetector init](&v12, sel_init);
  v3 = v2;
  if (v2)
  {
    -[NCLayoutLoopDetector _savedNotificationLayoutsInProgress](v2, "_savedNotificationLayoutsInProgress");
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
      v5 = (void *)v4;
    else
      v5 = (void *)MEMORY[0x24BDBD1A8];
    v6 = objc_msgSend(v5, "mutableCopy");
    notificationLayoutsInProgress = v3->_notificationLayoutsInProgress;
    v3->_notificationLayoutsInProgress = (NSMutableArray *)v6;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("com.apple.UserNotificationsKit.NCLayoutLoopDetector", v8);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v9;

  }
  return v3;
}

- (BOOL)layoutInProgressContainsNotificationRequest:(id)a3
{
  NSMutableArray *notificationLayoutsInProgress;
  void *v4;

  notificationLayoutsInProgress = self->_notificationLayoutsInProgress;
  objc_msgSend(a3, "notificationIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(notificationLayoutsInProgress) = -[NSMutableArray containsObject:](notificationLayoutsInProgress, "containsObject:", v4);

  return (char)notificationLayoutsInProgress;
}

- (void)addNotificationRequestToLayoutsInProgress:(id)a3
{
  id v4;
  NSMutableArray *notificationLayoutsInProgress;
  void *v6;
  NSMutableArray *v7;
  void *v8;
  id v9;

  v4 = a3;
  notificationLayoutsInProgress = self->_notificationLayoutsInProgress;
  v9 = v4;
  objc_msgSend(v4, "notificationIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(notificationLayoutsInProgress) = -[NSMutableArray containsObject:](notificationLayoutsInProgress, "containsObject:", v6);

  if ((notificationLayoutsInProgress & 1) == 0)
  {
    v7 = self->_notificationLayoutsInProgress;
    objc_msgSend(v9, "notificationIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v7, "addObject:", v8);

    -[NCLayoutLoopDetector _saveNotificationLayoutsInProgress](self, "_saveNotificationLayoutsInProgress");
  }

}

- (void)removeNotificationRequestFromLayoutsInProgress:(id)a3
{
  id v4;
  NSMutableArray *notificationLayoutsInProgress;
  void *v6;
  NSMutableArray *v7;
  void *v8;
  id v9;

  v4 = a3;
  notificationLayoutsInProgress = self->_notificationLayoutsInProgress;
  v9 = v4;
  objc_msgSend(v4, "notificationIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(notificationLayoutsInProgress) = -[NSMutableArray containsObject:](notificationLayoutsInProgress, "containsObject:", v6);

  if ((_DWORD)notificationLayoutsInProgress)
  {
    v7 = self->_notificationLayoutsInProgress;
    objc_msgSend(v9, "notificationIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray removeObject:](v7, "removeObject:", v8);

    -[NCLayoutLoopDetector _saveNotificationLayoutsInProgress](self, "_saveNotificationLayoutsInProgress");
  }

}

- (id)_savedNotificationLayoutsInProgress
{
  void *v2;
  void *v3;
  void *v4;

  objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("NCNotificationLayoutsInProgress"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  UNSafeCast();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_saveNotificationLayoutsInProgress
{
  void *v3;
  NSObject *queue;
  id v5;
  _QWORD block[4];
  id v7;

  if (-[NSMutableArray count](self->_notificationLayoutsInProgress, "count"))
  {
    v3 = (void *)-[NSMutableArray copy](self->_notificationLayoutsInProgress, "copy");
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __58__NCLayoutLoopDetector__saveNotificationLayoutsInProgress__block_invoke;
    block[3] = &unk_24D270110;
    v7 = v3;
    v5 = v3;
    dispatch_async(queue, block);

  }
  else
  {
    dispatch_async((dispatch_queue_t)self->_queue, &__block_literal_global_1);
  }
}

void __58__NCLayoutLoopDetector__saveNotificationLayoutsInProgress__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", *(_QWORD *)(a1 + 32), CFSTR("NCNotificationLayoutsInProgress"));

}

void __58__NCLayoutLoopDetector__saveNotificationLayoutsInProgress__block_invoke_2()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "removeObjectForKey:", CFSTR("NCNotificationLayoutsInProgress"));

}

- (NSMutableArray)notificationLayoutsInProgress
{
  return (NSMutableArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setNotificationLayoutsInProgress:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_notificationLayoutsInProgress, 0);
}

@end
