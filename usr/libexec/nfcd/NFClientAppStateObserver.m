@implementation NFClientAppStateObserver

- (void)dealloc
{
  objc_super v3;
  __int128 v4;
  uint64_t v5;

  if (!qword_10032ACB0)
  {
    v4 = off_1002E5E10;
    v5 = 0;
    qword_10032ACB0 = _sl_dlopen(&v4, 0);
  }
  if (qword_10032ACB0)
    -[RBSProcessMonitor invalidate](self->_monitor, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)NFClientAppStateObserver;
  -[NFClientAppStateObserver dealloc](&v3, "dealloc");
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_monitor, 0);
}

@end
