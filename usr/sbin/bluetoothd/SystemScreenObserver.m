@implementation SystemScreenObserver

- (SystemScreenObserver)init
{
  SystemScreenObserver *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SystemScreenObserver;
  result = -[SystemScreenObserver init](&v3, "init");
  if (result)
    result->_screenUndimmedChangeNotifyToken = -1;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[SystemScreenObserver invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SystemScreenObserver;
  -[SystemScreenObserver dealloc](&v3, "dealloc");
}

- (void)activateWithSystemMonitor:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  unsigned __int8 v8;
  uint64_t v9;
  _QWORD v10[5];
  unsigned __int8 v11;
  _QWORD handler[4];
  id v13;
  id location;

  v5 = a3;
  if (self->_screenUndimmedChangeNotifyToken == -1)
  {
    location = 0;
    objc_initWeak(&location, self);
    v6 = *(void **)(sub_10006BBEC() + 8);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1003B2DF0;
    handler[3] = &unk_10092BDF8;
    v7 = v6;
    objc_copyWeak(&v13, &location);
    notify_register_dispatch("com.apple.springboardservices.eventobserver.internalSBSEventObserverEventUndimmed", &self->_screenUndimmedChangeNotifyToken, v7, handler);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  objc_storeStrong((id *)&self->_systemMonitor, a3);
  v8 = objc_msgSend(v5, "screenOn");
  v9 = sub_10006BBEC();
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1003B2E8C;
  v10[3] = &unk_1009189E0;
  v10[4] = self;
  v11 = v8;
  sub_100041A34(v9, v10);

}

- (void)screenStateChanged:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  os_unfair_lock_s *v6;

  v3 = a3;
  v5 = sub_10006BBEC();
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(v5 + 8));
  v6 = (os_unfair_lock_s *)sub_100038E50();
  if (-[SystemScreenObserver screenOn](self, "screenOn") != v3)
  {
    -[SystemScreenObserver setScreenOn:](self, "setScreenOn:", v3);
    if (v6)
      sub_1002CECA0(v6, v3);
  }
}

- (void)invalidate
{
  int screenUndimmedChangeNotifyToken;

  -[SystemScreenObserver setSystemMonitor:](self, "setSystemMonitor:", 0);
  screenUndimmedChangeNotifyToken = self->_screenUndimmedChangeNotifyToken;
  if (screenUndimmedChangeNotifyToken != -1)
  {
    notify_cancel(screenUndimmedChangeNotifyToken);
    self->_screenUndimmedChangeNotifyToken = -1;
  }
}

- (BOOL)screenOn
{
  return self->_screenOn;
}

- (void)setScreenOn:(BOOL)a3
{
  self->_screenOn = a3;
}

- (CUSystemMonitor)systemMonitor
{
  return self->_systemMonitor;
}

- (void)setSystemMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_systemMonitor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemMonitor, 0);
}

@end
