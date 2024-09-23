@implementation BKWatchdogService

- (BOOL)isAlive
{
  return -[BKSystemShellSentinel collectiveWatchdogPing](self->_systemAppSentinel, "collectiveWatchdogPing");
}

- (BKWatchdogService)init
{
  BKWatchdogService *v2;
  uint64_t v3;
  BKSystemShellSentinel *systemAppSentinel;
  uint64_t v5;
  BKHIDSystemInterface *hidSystem;
  id v7;
  uint64_t v8;
  BKTVOutController *tvOutController;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)BKWatchdogService;
  v2 = -[BKWatchdogService init](&v11, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[BKSystemShellSentinel sharedInstance](BKSystemShellSentinel, "sharedInstance"));
    systemAppSentinel = v2->_systemAppSentinel;
    v2->_systemAppSentinel = (BKSystemShellSentinel *)v3;

    v5 = objc_claimAutoreleasedReturnValue(+[BKHIDSystemInterface sharedInstance](BKHIDSystemInterface, "sharedInstance"));
    hidSystem = v2->_hidSystem;
    v2->_hidSystem = (BKHIDSystemInterface *)v5;

    v7 = sub_10005FC2C();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    tvOutController = v2->_tvOutController;
    v2->_tvOutController = (BKTVOutController *)v8;

  }
  return v2;
}

- (void)registerClientsForMonitoring
{
  BKTVOutController *tvOutController;

  -[BKHIDSystemInterface registerWatchdog](self->_hidSystem, "registerWatchdog");
  tvOutController = self->_tvOutController;
  if (tvOutController)
    wd_endpoint_add_queue(tvOutController->_workQueue);
}

- (BKSystemShellSentinel)systemAppSentinel
{
  return self->_systemAppSentinel;
}

- (void)setSystemAppSentinel:(id)a3
{
  objc_storeStrong((id *)&self->_systemAppSentinel, a3);
}

- (BKHIDSystemInterface)hidSystem
{
  return self->_hidSystem;
}

- (void)setHidSystem:(id)a3
{
  objc_storeStrong((id *)&self->_hidSystem, a3);
}

- (BKTVOutController)tvOutController
{
  return self->_tvOutController;
}

- (void)setTvOutController:(id)a3
{
  objc_storeStrong((id *)&self->_tvOutController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tvOutController, 0);
  objc_storeStrong((id *)&self->_hidSystem, 0);
  objc_storeStrong((id *)&self->_systemAppSentinel, 0);
}

@end
