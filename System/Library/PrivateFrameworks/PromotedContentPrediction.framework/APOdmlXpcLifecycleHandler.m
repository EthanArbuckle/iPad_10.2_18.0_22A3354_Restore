@implementation APOdmlXpcLifecycleHandler

- (APOdmlXpcLifecycleHandler)initWithActivity:(id)a3
{
  id v5;
  APOdmlXpcLifecycleHandler *v6;
  APOdmlXpcLifecycleHandler *v7;
  NSOperationQueue *v8;
  NSOperationQueue *workQueue;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)APOdmlXpcLifecycleHandler;
  v6 = -[APOdmlXpcLifecycleHandler init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_xpc_activity, a3);
    v7->_performDeferralCheck = 0;
    v8 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    workQueue = v7->_workQueue;
    v7->_workQueue = v8;

  }
  return v7;
}

- (BOOL)continueTask
{
  APOdmlXpcLifecycleHandler *v2;
  _xpc_activity_s *xpc_activity;
  BOOL v4;

  v2 = self;
  objc_sync_enter(v2);
  xpc_activity = v2->_xpc_activity;
  if (xpc_activity)
    v4 = xpc_activity_set_state(xpc_activity, 4);
  else
    v4 = 0;
  objc_sync_exit(v2);

  return v4;
}

- (BOOL)taskIsContinuing
{
  APOdmlXpcLifecycleHandler *v2;
  BOOL v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = xpc_activity_get_state(v2->_xpc_activity) == 4;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)finishTask
{
  OS_xpc_object *xpc_activity;

  xpc_activity = self->_xpc_activity;
  if (xpc_activity)
    LOBYTE(xpc_activity) = xpc_activity_set_state(xpc_activity, 5);
  return (char)xpc_activity;
}

- (BOOL)shouldDefer
{
  APOdmlXpcLifecycleHandler *v2;
  _xpc_activity_s *xpc_activity;
  BOOL should_defer;

  v2 = self;
  objc_sync_enter(v2);
  xpc_activity = v2->_xpc_activity;
  if (xpc_activity)
    should_defer = xpc_activity_should_defer(xpc_activity);
  else
    should_defer = 0;
  objc_sync_exit(v2);

  return should_defer;
}

- (BOOL)deferTask
{
  APOdmlXpcLifecycleHandler *v2;
  _xpc_activity_s *xpc_activity;
  BOOL v4;

  v2 = self;
  objc_sync_enter(v2);
  xpc_activity = v2->_xpc_activity;
  if (xpc_activity)
    v4 = xpc_activity_set_state(xpc_activity, 3);
  else
    v4 = 0;
  objc_sync_exit(v2);

  return v4;
}

- (BOOL)taskIsDeferred
{
  APOdmlXpcLifecycleHandler *v2;
  BOOL v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = xpc_activity_get_state(v2->_xpc_activity) == 3;
  objc_sync_exit(v2);

  return v3;
}

- (void)_backgroundDeferralCheck:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  dispatch_time_t v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = dispatch_time(0, 1000000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1B69F84E8;
  block[3] = &unk_1E6A29CD8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_after(v8, MEMORY[0x1E0C80D38], block);

}

- (void)startBackgroundDeferralCheckForTime:(id)a3 completionHandler:(id)a4
{
  NSDate *v6;
  APOdmlXpcLifecycleHandler *v7;
  NSDate *startDate;
  NSDate *v9;
  const char *v10;
  id v11;

  v6 = (NSDate *)a3;
  v7 = self;
  v11 = a4;
  objc_sync_enter(v7);
  v7->_performDeferralCheck = 1;
  startDate = v7->_startDate;
  v7->_startDate = v6;
  v9 = v6;

  objc_sync_exit(v7);
  objc_msgSend__backgroundDeferralCheck_completion_(v7, v10, (uint64_t)v7->_startDate, v11);

}

- (BOOL)taskCanContinueForTime:(id)a3
{
  id v4;
  APOdmlXpcLifecycleHandler *v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  char IsContinuing;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if ((objc_msgSend_isEqualToDate_(v4, v6, (uint64_t)v5->_startDate) & 1) != 0)
    IsContinuing = objc_msgSend_taskIsContinuing(v5, v7, v8);
  else
    IsContinuing = 0;
  objc_sync_exit(v5);

  return IsContinuing;
}

- (void)endBackgroundDeferralCheck
{
  NSDate *startDate;
  APOdmlXpcLifecycleHandler *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_performDeferralCheck = 0;
  startDate = obj->_startDate;
  obj->_startDate = 0;

  objc_sync_exit(obj);
}

- (OS_xpc_object)xpc_activity
{
  return self->_xpc_activity;
}

- (void)setXpc_activity:(id)a3
{
  objc_storeStrong((id *)&self->_xpc_activity, a3);
}

- (NSString)requestIdentifier
{
  return self->_requestIdentifier;
}

- (BOOL)performDeferralCheck
{
  return self->_performDeferralCheck;
}

- (void)setPerformDeferralCheck:(BOOL)a3
{
  self->_performDeferralCheck = a3;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
}

- (NSOperationQueue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_xpc_activity, 0);
}

@end
