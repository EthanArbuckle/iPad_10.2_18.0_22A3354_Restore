@implementation _UIDefaultsInterfaceStyleObserver

- (_UIDefaultsInterfaceStyleObserver)initWithNotificationName:(id)a3 darwinNotification:(const char *)a4
{
  id v7;
  _UIDefaultsInterfaceStyleObserver *v8;
  _UIDefaultsInterfaceStyleObserver *v9;
  _QWORD handler[4];
  _UIDefaultsInterfaceStyleObserver *v12;
  objc_super v13;

  v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_UIDefaultsInterfaceStyleObserver;
  v8 = -[_UIDefaultsInterfaceStyleObserver init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_notificationName, a3);
    v9->_notifyToken = -1;
    if (a4)
    {
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __81___UIDefaultsInterfaceStyleObserver_initWithNotificationName_darwinNotification___block_invoke;
      handler[3] = &unk_1E16BDB68;
      v12 = v9;
      notify_register_dispatch(a4, &v9->_notifyToken, MEMORY[0x1E0C80D38], handler);

    }
  }

  return v9;
}

- (void)observeUserDefaults:(id)a3 key:(id)a4
{
  objc_msgSend(a3, "addObserver:forKeyPath:options:context:", self, a4, 1, 0);
}

- (void)dealloc
{
  int notifyToken;
  objc_super v4;

  notifyToken = self->_notifyToken;
  if (notifyToken != -1)
    notify_cancel(notifyToken);
  v4.receiver = self;
  v4.super_class = (Class)_UIDefaultsInterfaceStyleObserver;
  -[_UIDefaultsInterfaceStyleObserver dealloc](&v4, sel_dealloc);
}

- (void)_didChange
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", self->_notificationName, 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationName, 0);
}

@end
