@implementation PPTWaitForMigrationTest

- (void)iterationCheck
{
  void *v3;
  id v4;
  NSObject *v5;
  dispatch_time_t v6;
  _QWORD block[5];
  uint8_t buf[16];

  if (-[PPTBasicTest running](self, "running"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[PPTBasicTest asset](self, "asset"));

    if (v3)
    {
      -[PPTBasicTest finishPPTTestWithResult:](self, "finishPPTTestWithResult:", 0);
    }
    else
    {
      v4 = sub_1001DA41C();
      v5 = objc_claimAutoreleasedReturnValue(v4);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Migrated asset not found. Rechecking after 3s", buf, 2u);
      }

      v6 = dispatch_time(0, 3000000000);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000AA55C;
      block[3] = &unk_1008E72C0;
      block[4] = self;
      dispatch_after(v6, (dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
}

- (void)startTest
{
  -[PPTBasicTest setTestTimeout:](self, "setTestTimeout:", 120);
  -[PPTBasicTest setRunning:](self, "setRunning:", 1);
  -[PPTWaitForMigrationTest iterationCheck](self, "iterationCheck");
}

@end
