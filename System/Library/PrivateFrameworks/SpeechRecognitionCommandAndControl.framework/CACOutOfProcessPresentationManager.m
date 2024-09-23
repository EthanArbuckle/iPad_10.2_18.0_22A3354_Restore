@implementation CACOutOfProcessPresentationManager

- (CACOutOfProcessPresentationManager)init
{
  CACOutOfProcessPresentationManager *v2;
  uint64_t v3;
  uint64_t v4;
  CACAXNotificationObserver *v5;
  void *v6;
  void *v7;
  CACAXNotificationObserver *v8;
  CACAXNotificationObserver *observer;
  objc_super v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v11.receiver = self;
  v11.super_class = (Class)CACOutOfProcessPresentationManager;
  v2 = -[CACOutOfProcessPresentationManager init](&v11, sel_init);
  if (v2)
  {
    v3 = objc_msgSend((id)objc_opt_class(), "axNotification");
    if ((_DWORD)v3)
    {
      v4 = v3;
      v5 = [CACAXNotificationObserver alloc];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = v6;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[CACAXNotificationObserver initWithNotifications:](v5, "initWithNotifications:", v7);

      -[CACAXNotificationObserver setDelegate:](v8, "setDelegate:", v2);
      observer = v2->_observer;
      v2->_observer = v8;

    }
  }
  return v2;
}

- (void)presentWithData:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x24BE006F0];
  v4 = a3;
  objc_msgSend(v3, "server");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "showRemoteView:withData:", objc_msgSend((id)objc_opt_class(), "remoteViewType"), v4);

}

- (BOOL)isShowing
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BE006F0], "server");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isShowingRemoteView:", objc_msgSend((id)objc_opt_class(), "remoteViewType"));

  return v3;
}

- (BOOL)isOverlay
{
  return 0;
}

- (BOOL)isPhysiciallyInteractiveOverlay
{
  return 0;
}

- (void)hide
{
  id v2;

  objc_msgSend(MEMORY[0x24BE006F0], "server");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hideRemoteView:", objc_msgSend((id)objc_opt_class(), "remoteViewType"));

}

- (BOOL)isOutOfProcess
{
  return 1;
}

- (void)observer:(id)a3 didObserveNotification:(int)a4 notificationData:(void *)a5
{
  if (objc_msgSend((id)objc_opt_class(), "axNotification") == a4)
    -[CACOutOfProcessPresentationManager handleAXNotificationData:](self, "handleAXNotificationData:", a5);
}

- (CACAXNotificationObserver)observer
{
  return self->_observer;
}

- (void)setObserver:(id)a3
{
  objc_storeStrong((id *)&self->_observer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observer, 0);
}

+ (int64_t)remoteViewType
{
  objc_opt_class();
  OUTLINED_FUNCTION_0_0();
  return 0;
}

+ (int)axNotification
{
  objc_opt_class();
  OUTLINED_FUNCTION_0_0();
  return 0;
}

- (void)handleAXNotificationData:(void *)a3
{
  objc_opt_class();
  NSRequestConcreteImplementation();
}

@end
