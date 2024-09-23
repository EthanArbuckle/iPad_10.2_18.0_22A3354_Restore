@implementation KmlClientAppStateObserver

- (void)dealloc
{
  objc_super v3;

  -[RBSProcessMonitor invalidate](self->_monitor, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)KmlClientAppStateObserver;
  -[KmlClientAppStateObserver dealloc](&v3, "dealloc");
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->delegate);
  objc_storeStrong((id *)&self->_predicates, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_monitor, 0);
}

@end
