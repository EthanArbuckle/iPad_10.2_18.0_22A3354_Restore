@implementation KTManagerWatchdogControl

- (KTManagerWatchdogControl)initWithDew:(id)a3
{
  id v4;
  KTManagerWatchdogControl *v5;
  KTManagerWatchdogControl *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)KTManagerWatchdogControl;
  v5 = -[KTManagerWatchdogControl init](&v8, "init");
  if (v5)
  {
    -[KTManagerWatchdogControl setMaybeDoFastExit:](v5, "setMaybeDoFastExit:", objc_msgSend(v4, "fastWatchdogExit"));
    v6 = v5;
  }

  return v5;
}

- (double)watchdogInterval
{
  return 300.0;
}

- (double)watchdogNiceWaitTime
{
  return 120.0;
}

- (BOOL)watchDogFastRudeExit
{
  return (os_variant_has_internal_diagnostics("kt-watchdog", a2) & 1) != 0
      || -[KTManagerWatchdogControl maybeDoFastExit](self, "maybeDoFastExit") && !arc4random_uniform(0x3E8u);
}

- (void)watchdogNiceExit
{
  NSObject *v2;
  uint8_t v3[16];

  if (qword_1002A4580 != -1)
    dispatch_once(&qword_1002A4580, &stru_10023D050);
  v2 = qword_1002A4588;
  if (os_log_type_enabled((os_log_t)qword_1002A4588, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "watchdogNiceExit", v3, 2u);
  }
  xpc_transaction_exit_clean();
}

- (void)watchdogRudeExitWithReason:(id)a3
{
  id v3;
  NSObject *v4;
  const char *v5;
  const char *v6;
  int v7;
  id v8;

  v3 = a3;
  if (qword_1002A4580 != -1)
    goto LABEL_8;
  while (1)
  {
    v4 = qword_1002A4588;
    if (os_log_type_enabled((os_log_t)qword_1002A4588, OS_LOG_TYPE_ERROR))
    {
      v7 = 138412290;
      v8 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "watchdogRudeExit: %@", (uint8_t *)&v7, 0xCu);
    }
    v5 = (const char *)objc_msgSend(objc_retainAutorelease(v3), "UTF8String");
    if (v5)
      v6 = v5;
    else
      v6 = "watchdog";
    abort_with_payload(26, 4711, 0, 0, v6, 0);
LABEL_8:
    dispatch_once(&qword_1002A4580, &stru_10023D070);
  }
}

- (BOOL)watchdogDisableDebuggerCheck
{
  return 0;
}

- (BOOL)maybeDoFastExit
{
  return self->_maybeDoFastExit;
}

- (void)setMaybeDoFastExit:(BOOL)a3
{
  self->_maybeDoFastExit = a3;
}

@end
