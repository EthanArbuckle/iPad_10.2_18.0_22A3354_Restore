@implementation BTWatchdog

- (void)beginTransaction
{
  void *v2;
  BTWatchdog *obj;

  obj = self;
  objc_sync_enter(obj);
  -[BTWatchdog setIsTransacting:](obj, "setIsTransacting:", 1);
  -[BTWatchdog setTransactionCount:](obj, "setTransactionCount:", (char *)-[BTWatchdog transactionCount](obj, "transactionCount") + 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BTWatchdog timer](obj, "timer"));

  if (!v2)
    -[BTWatchdog _startTimer](obj, "_startTimer");
  objc_sync_exit(obj);

}

- (void)endTransaction
{
  BTWatchdog *obj;

  obj = self;
  objc_sync_enter(obj);
  -[BTWatchdog setIsTransacting:](obj, "setIsTransacting:", 0);
  objc_sync_exit(obj);

}

- (void)_startTimer
{
  dispatch_queue_global_t global_queue;
  NSObject *v4;
  dispatch_source_t v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  dispatch_time_t v9;
  NSObject *v10;
  _QWORD v11[5];
  _QWORD handler[5];

  global_queue = dispatch_get_global_queue(17, 0);
  v4 = objc_claimAutoreleasedReturnValue(global_queue);
  v5 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v4);
  -[BTWatchdog setTimer:](self, "setTimer:", v5);

  v6 = objc_claimAutoreleasedReturnValue(-[BTWatchdog timer](self, "timer"));
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100005178;
  handler[3] = &unk_100008558;
  handler[4] = self;
  dispatch_source_set_event_handler(v6, handler);

  v7 = objc_claimAutoreleasedReturnValue(-[BTWatchdog timer](self, "timer"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100005180;
  v11[3] = &unk_100008558;
  v11[4] = self;
  dispatch_source_set_cancel_handler(v7, v11);

  v8 = objc_claimAutoreleasedReturnValue(-[BTWatchdog timer](self, "timer"));
  v9 = dispatch_time(0, 10000000000);
  dispatch_source_set_timer(v8, v9, 0x2540BE400uLL, 0x3B9ACA00uLL);

  v10 = objc_claimAutoreleasedReturnValue(-[BTWatchdog timer](self, "timer"));
  dispatch_resume(v10);

}

- (void)_stopTimer
{
  NSObject *v2;

  v2 = objc_claimAutoreleasedReturnValue(-[BTWatchdog timer](self, "timer"));
  dispatch_source_cancel(v2);

}

- (void)_timerEvent
{
  id v2;
  BTWatchdog *obj;

  obj = self;
  objc_sync_enter(obj);
  v2 = -[BTWatchdog timerTransactionCount](obj, "timerTransactionCount");
  if (v2 == (id)-[BTWatchdog transactionCount](obj, "transactionCount"))
  {
    if (-[BTWatchdog isTransacting](obj, "isTransacting"))
      -[BTWatchdog _timeout](obj, "_timeout");
    else
      -[BTWatchdog _stopTimer](obj, "_stopTimer");
  }
  else
  {
    -[BTWatchdog setTimerTransactionCount:](obj, "setTimerTransactionCount:", -[BTWatchdog transactionCount](obj, "transactionCount"));
  }
  objc_sync_exit(obj);

}

- (void)_timeout
{
  uint64_t v2;

  v2 = getpid();
  WriteStackshotReportWithPID(CFSTR("Watchdog timeout"), 195948557, v2);
  abort();
}

- (BOOL)isTransacting
{
  return self->_isTransacting;
}

- (void)setIsTransacting:(BOOL)a3
{
  self->_isTransacting = a3;
}

- (unint64_t)transactionCount
{
  return self->_transactionCount;
}

- (void)setTransactionCount:(unint64_t)a3
{
  self->_transactionCount = a3;
}

- (unint64_t)timerTransactionCount
{
  return self->_timerTransactionCount;
}

- (void)setTimerTransactionCount:(unint64_t)a3
{
  self->_timerTransactionCount = a3;
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
}

@end
