@implementation MultiTouchDiagnostic

- (BOOL)runWithTimeout:(double)a3
{
  void *v5;
  OS_dispatch_group *v6;
  OS_dispatch_group *waitgroup;
  OS_dispatch_group *v8;
  OS_dispatch_group *v9;
  dispatch_time_t v10;
  BOOL success;

  self->_success = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDistributedNotificationCenter defaultCenter](NSDistributedNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "addObserver:selector:name:object:", self, "handleNotification:", CFSTR("com.apple.hidswdebug.mtrecorder.write.complete"), 0);
  objc_msgSend(v5, "postNotificationName:object:userInfo:options:", CFSTR("com.apple.hidswdebug.mtrecorder.write.start"), 0, 0, 3);
  v6 = (OS_dispatch_group *)dispatch_group_create();
  waitgroup = self->_waitgroup;
  self->_waitgroup = v6;

  v8 = self->_waitgroup;
  if (v8)
  {
    dispatch_group_enter((dispatch_group_t)v8);
    v9 = self->_waitgroup;
    v10 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    dispatch_group_wait((dispatch_group_t)v9, v10);
    objc_msgSend(v5, "removeObserver:", self);
    success = self->_success;
  }
  else
  {
    success = 0;
  }

  return success;
}

- (void)handleNotification:(id)a3
{
  self->_success = 1;
  dispatch_group_leave((dispatch_group_t)self->_waitgroup);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waitgroup, 0);
}

@end
