@implementation FSDATaskMessage

- (void)logMessage:(id)a3
{
  sub_10000A798("%s\n", (const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String"));
}

- (void)prompt:(id)a3 replyHandler:(id)a4
{
  id v5;
  void (**v6)(id, const __CFString *, _QWORD);

  v5 = objc_retainAutorelease(a3);
  v6 = (void (**)(id, const __CFString *, _QWORD))a4;
  sub_10000A798("%s\n", (const char *)objc_msgSend(v5, "UTF8String"));
  v6[2](v6, CFSTR("Completed prompt"), 0);

}

- (void)promptTrueFalse:(id)a3 replyHandler:(id)a4
{
  id v5;
  void (**v6)(id, uint64_t, _QWORD);

  v5 = objc_retainAutorelease(a3);
  v6 = (void (**)(id, uint64_t, _QWORD))a4;
  sub_10000A798("%s\n", (const char *)objc_msgSend(v5, "UTF8String"));
  v6[2](v6, 1, 0);

}

- (void)completed:(id)a3 replyHandler:(id)a4
{
  void (**v7)(id, _QWORD, id);
  FSDATaskMessage *v8;
  id v9;

  v9 = a3;
  v7 = (void (**)(id, _QWORD, id))a4;
  sub_10000A798("Completed task with error %@\n", v9);
  v8 = self;
  objc_sync_enter(v8);
  if (v8->_dispatch_group && !v8->_didCompletion)
  {
    objc_storeStrong((id *)&v8->_exitError, a3);
    dispatch_group_leave((dispatch_group_t)v8->_dispatch_group);
  }
  v8->_didCompletion = 1;
  objc_sync_exit(v8);

  v7[2](v7, 0, v9);
}

- (OS_dispatch_group)dispatch_group
{
  return (OS_dispatch_group *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDispatch_group:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSError)exitError
{
  return (NSError *)objc_getProperty(self, a2, 24, 1);
}

- (void)setExitError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (BOOL)didCompletion
{
  return self->_didCompletion;
}

- (void)setDidCompletion:(BOOL)a3
{
  self->_didCompletion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exitError, 0);
  objc_storeStrong((id *)&self->_dispatch_group, 0);
}

@end
