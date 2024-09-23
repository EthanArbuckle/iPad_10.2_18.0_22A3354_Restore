@implementation BKDisplayBrightnessUpdateTransaction

- (BKDisplayBrightnessUpdateTransaction)initWithIdentifier:(id)a3 transactionManager:(id)a4
{
  id v6;
  id v7;
  BKDisplayBrightnessUpdateTransaction *v8;
  NSString *v9;
  NSString *identifier;
  uint64_t v11;
  OS_dispatch_queue *queue;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BKDisplayBrightnessUpdateTransaction;
  v8 = -[BKDisplayBrightnessUpdateTransaction init](&v14, "init");
  if (v8)
  {
    v9 = (NSString *)objc_msgSend(v6, "copy");
    identifier = v8->_identifier;
    v8->_identifier = v9;

    v11 = objc_claimAutoreleasedReturnValue(+[BKDisplayBrightnessUpdateTransaction _sharedQueue](BKDisplayBrightnessUpdateTransaction, "_sharedQueue"));
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v11;

    objc_storeStrong((id *)&v8->_transactionManager, a4);
    objc_msgSend(v7, "_beginUpdateTransaction:", v8);
  }

  return v8;
}

- (void)dealloc
{
  void *v4;
  NSString *v5;
  void *v6;
  uint64_t v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  objc_super v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  BKDisplayBrightnessUpdateTransaction *v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  void *v23;

  if (!self->_invalidated)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_invalidated == YES")));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v5 = NSStringFromSelector(a2);
      v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
      v8 = (objc_class *)objc_opt_class(self, v7);
      v9 = NSStringFromClass(v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      *(_DWORD *)buf = 138544642;
      v13 = v6;
      v14 = 2114;
      v15 = v10;
      v16 = 2048;
      v17 = self;
      v18 = 2114;
      v19 = CFSTR("BKDisplayBrightnessUpdateTransactionManager.m");
      v20 = 1024;
      v21 = 56;
      v22 = 2114;
      v23 = v4;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    _bs_set_crash_log_message(objc_msgSend(objc_retainAutorelease(v4), "UTF8String"));
    __break(0);
    JUMPOUT(0x100077E30);
  }
  v11.receiver = self;
  v11.super_class = (Class)BKDisplayBrightnessUpdateTransaction;
  -[BKDisplayBrightnessUpdateTransaction dealloc](&v11, "dealloc");
}

- (void)invalidate
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007819C;
  block[3] = &unk_1000ECDA8;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)_queue_setTimerWithTimeIntervalSinceNow:(double)a3
{
  BSAbsoluteMachTimer *timer;
  BSAbsoluteMachTimer *v6;
  BSAbsoluteMachTimer *v7;
  BSAbsoluteMachTimer *v8;
  OS_dispatch_queue *queue;
  _QWORD v10[5];

  -[BSAbsoluteMachTimer invalidate](self->_timer, "invalidate");
  timer = self->_timer;
  self->_timer = 0;

  if (a3 <= 0.0)
  {
    -[BKDisplayBrightnessUpdateTransaction _queue_invalidate](self, "_queue_invalidate");
  }
  else
  {
    v6 = (BSAbsoluteMachTimer *)objc_msgSend(objc_alloc((Class)BSAbsoluteMachTimer), "initWithIdentifier:", CFSTR("BKDisplayBrightnessUpdateTransaction"));
    v7 = self->_timer;
    self->_timer = v6;

    v8 = self->_timer;
    queue = self->_queue;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100078158;
    v10[3] = &unk_1000EC0C8;
    v10[4] = self;
    -[BSAbsoluteMachTimer scheduleWithFireInterval:leewayInterval:queue:handler:](v8, "scheduleWithFireInterval:leewayInterval:queue:handler:", queue, v10, a3, 0.0);
  }
}

- (void)_queue_invalidate
{
  BSAbsoluteMachTimer *timer;

  BSDispatchQueueAssert(self->_queue, a2);
  -[BSAbsoluteMachTimer invalidate](self->_timer, "invalidate");
  timer = self->_timer;
  self->_timer = 0;

  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    -[BKDisplayBrightnessUpdateTransactionManager _endUpdateTransaction:](self->_transactionManager, "_endUpdateTransaction:");
    if ((BKDisplayBrightnessUpdateTransaction *)qword_100117528 == self)
    {
      qword_100117528 = 0;

    }
  }
}

- (void)_queue_updateExpirationTimeWithIntervalSinceNow:(double)a3
{
  uint64_t v5;

  v5 = BSDispatchQueueAssert(self->_queue, a2);
  self->_expirationTime = BSAbsoluteMachTimeNow(v5) + a3;
  if (!self->_timer)
    -[BKDisplayBrightnessUpdateTransaction _queue_setTimerWithTimeIntervalSinceNow:](self, "_queue_setTimerWithTimeIntervalSinceNow:", a3);
}

- (NSString)description
{
  return (NSString *)-[BKDisplayBrightnessUpdateTransaction descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKDisplayBrightnessUpdateTransaction succinctDescriptionBuilder](self, "succinctDescriptionBuilder"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "build"));

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BSDescriptionBuilder builderWithObject:](BSDescriptionBuilder, "builderWithObject:", self));
  v4 = objc_msgSend(v3, "appendObject:withName:", self->_identifier, CFSTR("identifier"));
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKDisplayBrightnessUpdateTransaction descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "build"));

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_transactionManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (void)beginImplicitTransaction
{
  NSObject *v2;

  v2 = objc_claimAutoreleasedReturnValue(+[BKDisplayBrightnessUpdateTransaction _sharedQueue](BKDisplayBrightnessUpdateTransaction, "_sharedQueue"));
  dispatch_sync(v2, &stru_1000EC080);

}

+ (id)_sharedQueue
{
  if (qword_100117538 != -1)
    dispatch_once(&qword_100117538, &stru_1000EC0A0);
  return (id)qword_100117530;
}

@end
