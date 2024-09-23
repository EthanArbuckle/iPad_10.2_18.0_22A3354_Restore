@implementation RCOperationNotificationRetrySignal

- (RCOperationNotificationRetrySignal)initWithNotificationName:(id)a3 timeout:(double)a4
{
  id v7;
  RCOperationNotificationRetrySignal *v8;
  RCOperationNotificationRetrySignal *v9;
  NSObject *v10;
  RCOnce *v11;
  void *v12;
  NSObject *v13;
  RCOnce *v14;
  uint64_t v15;
  NSObject *notificationObserver;
  _QWORD v18[4];
  RCOnce *v19;
  NSObject *v20;
  objc_super v21;

  v7 = a3;
  v21.receiver = self;
  v21.super_class = (Class)RCOperationNotificationRetrySignal;
  v8 = -[RCOperationNotificationRetrySignal init](&v21, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_notificationName, a3);
    v9->_timeout = a4;
    v10 = dispatch_group_create();
    dispatch_group_enter(v10);
    objc_storeStrong((id *)&v9->_group, v10);
    v9->_timeoutTime = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
    v11 = -[RCOnce initWithOptions:]([RCOnce alloc], "initWithOptions:", 1);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __71__RCOperationNotificationRetrySignal_initWithNotificationName_timeout___block_invoke;
    v18[3] = &unk_1E470E040;
    v19 = v11;
    v20 = v10;
    v13 = v10;
    v14 = v11;
    objc_msgSend(v12, "addObserverForName:object:queue:usingBlock:", v7, 0, 0, v18);
    v15 = objc_claimAutoreleasedReturnValue();
    notificationObserver = v9->_notificationObserver;
    v9->_notificationObserver = v15;

  }
  return v9;
}

void __71__RCOperationNotificationRetrySignal_initWithNotificationName_timeout___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __71__RCOperationNotificationRetrySignal_initWithNotificationName_timeout___block_invoke_2;
  v2[3] = &unk_1E470DFF0;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "executeOnce:", v2);

}

void __71__RCOperationNotificationRetrySignal_initWithNotificationName_timeout___block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self->_notificationObserver);

  v4.receiver = self;
  v4.super_class = (Class)RCOperationNotificationRetrySignal;
  -[RCOperationNotificationRetrySignal dealloc](&v4, sel_dealloc);
}

- (void)onQueue:(id)a3 signal:(id)a4
{
  id v6;
  dispatch_time_t timeoutTime;
  OS_dispatch_group *group;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  group = self->_group;
  timeoutTime = self->_timeoutTime;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __53__RCOperationNotificationRetrySignal_onQueue_signal___block_invoke;
  v10[3] = &unk_1E470E068;
  v11 = v6;
  v9 = v6;
  RCDispatchGroupNotifyWithTimeout(group, a3, timeoutTime, v10);

}

uint64_t __53__RCOperationNotificationRetrySignal_onQueue_signal___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{%p notification=%@, timeout=%.2f}"), self, self->_notificationName, *(_QWORD *)&self->_timeout);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationName, 0);
  objc_storeStrong((id *)&self->_notificationObserver, 0);
  objc_storeStrong((id *)&self->_group, 0);
}

@end
