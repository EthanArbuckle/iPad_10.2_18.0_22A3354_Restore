@implementation KeychainItemUpgradeRequestServer

- (KeychainItemUpgradeRequestServer)initWithLockStateTracker:(id)a3
{
  id v4;
  KeychainItemUpgradeRequestServer *v5;
  KeychainItemUpgradeRequestController *v6;
  KeychainItemUpgradeRequestController *controller;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)KeychainItemUpgradeRequestServer;
  v5 = -[KeychainItemUpgradeRequestServer init](&v9, "init");
  if (v5)
  {
    v6 = -[KeychainItemUpgradeRequestController initWithLockStateTracker:]([KeychainItemUpgradeRequestController alloc], "initWithLockStateTracker:", v4);
    controller = v5->_controller;
    v5->_controller = v6;

  }
  return v5;
}

- (KeychainItemUpgradeRequestController)controller
{
  return (KeychainItemUpgradeRequestController *)objc_getProperty(self, a2, 8, 1);
}

- (void)setController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controller, 0);
}

+ (id)server
{
  if (qword_100340E88 != -1)
    dispatch_once(&qword_100340E88, &stru_1002DBA28);
  return (id)qword_100340E80;
}

@end
