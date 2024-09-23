@implementation DMDPowerAssertion

+ (id)assertionForOperation:(id)a3
{
  id v4;
  __CFString *v5;
  id v6;
  uint64_t v8;

  if (a3)
  {
    v4 = a3;
    v5 = (__CFString *)objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:arguments:", v4, &v8);

  }
  else
  {
    v5 = CFSTR("unknown");
  }
  v6 = objc_msgSend(objc_alloc((Class)a1), "initForOperation:", v5);

  return v6;
}

- (id)initForOperation:(id)a3
{
  id v5;
  DMDPowerAssertion *v6;
  DMDPowerAssertion *v7;
  id v8;
  NSObject *v9;
  _QWORD block[4];
  DMDPowerAssertion *v12;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DMDPowerAssertion;
  v6 = -[DMDPowerAssertion init](&v13, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_operation, a3);
    v8 = _assertionQueue();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10005DDAC;
    block[3] = &unk_1000BA4B0;
    v12 = v7;
    dispatch_sync(v9, block);

  }
  return v7;
}

- (void)dealloc
{
  id v3;
  NSObject *v4;
  objc_super v5;
  _QWORD block[5];

  if (!self->_isParked)
  {
    v3 = _assertionQueue();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10005DE44;
    block[3] = &unk_1000BA4B0;
    block[4] = self;
    dispatch_sync(v4, block);

  }
  v5.receiver = self;
  v5.super_class = (Class)DMDPowerAssertion;
  -[DMDPowerAssertion dealloc](&v5, "dealloc");
}

- (void)park
{
  id v3;
  NSObject *v4;
  _QWORD block[5];

  v3 = _assertionQueue();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005DEBC;
  block[3] = &unk_1000BA4B0;
  block[4] = self;
  dispatch_sync(v4, block);

}

- (void)unpark
{
  id v3;
  NSObject *v4;
  _QWORD block[5];

  v3 = _assertionQueue();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005DF90;
  block[3] = &unk_1000BA4B0;
  block[4] = self;
  dispatch_sync(v4, block);

}

- (void)_retain
{
  uint64_t v3;
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;

  v3 = qword_1000EBA68;
  if (!qword_1000EBA68)
  {
    IOPMAssertionCreateWithDescription(CFSTR("PreventUserIdleSystemSleep"), CFSTR("dmd activity"), 0, 0, 0, 3600.0, CFSTR("TimeoutActionTurnOff"), (IOPMAssertionID *)&dword_1000EBA70);
    v3 = qword_1000EBA68;
  }
  qword_1000EBA68 = v3 + 1;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMDPowerAssertion operation](self, "operation"));
    v10 = 138543362;
    v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Beginning power assertion, operation: %{public}@", (uint8_t *)&v10, 0xCu);

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[DMDUserSwitchStakeholder sharedStakeholder](DMDUserSwitchStakeholder, "sharedStakeholder"));
  v6 = objc_msgSend(v5, "inEDUMode");

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DMDPowerAssertion operation](self, "operation"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserSwitchBlockingTask taskWithName:reason:](UMUserSwitchBlockingTask, "taskWithName:reason:", CFSTR("DMDSwitchBlockingTask"), v7));
    -[DMDPowerAssertion setBlockingTask:](self, "setBlockingTask:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[DMDPowerAssertion blockingTask](self, "blockingTask"));
    objc_msgSend(v9, "begin");

  }
}

- (void)_release
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  int v7;
  void *v8;

  if (!--qword_1000EBA68)
    IOPMAssertionRelease(dword_1000EBA70);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[DMDPowerAssertion operation](self, "operation"));
    v7 = 138543362;
    v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Ending power assertion, operation: %{public}@", (uint8_t *)&v7, 0xCu);

  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[DMDUserSwitchStakeholder sharedStakeholder](DMDUserSwitchStakeholder, "sharedStakeholder"));
  v5 = objc_msgSend(v4, "inEDUMode");

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[DMDPowerAssertion blockingTask](self, "blockingTask"));
    objc_msgSend(v6, "end");

  }
}

- (BOOL)isParked
{
  return self->_isParked;
}

- (void)setIsParked:(BOOL)a3
{
  self->_isParked = a3;
}

- (NSString)operation
{
  return self->_operation;
}

- (void)setOperation:(id)a3
{
  objc_storeStrong((id *)&self->_operation, a3);
}

- (UMUserSwitchBlockingTask)blockingTask
{
  return self->_blockingTask;
}

- (void)setBlockingTask:(id)a3
{
  objc_storeStrong((id *)&self->_blockingTask, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blockingTask, 0);
  objc_storeStrong((id *)&self->_operation, 0);
}

@end
