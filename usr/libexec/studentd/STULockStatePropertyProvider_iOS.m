@implementation STULockStatePropertyProvider_iOS

- (STULockStatePropertyProvider_iOS)init
{
  STULockStatePropertyProvider_iOS *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)STULockStatePropertyProvider_iOS;
  result = -[STULockStatePropertyProvider init](&v3, "init");
  if (result)
    result->mSpringBoardLockStateNotificationToken = -1;
  return result;
}

- (void)beginUpdating
{
  int *p_mSpringBoardLockStateNotificationToken;
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  void *v9;
  void **v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id location;
  objc_super v16;
  uint8_t buf[24];

  p_mSpringBoardLockStateNotificationToken = &self->mSpringBoardLockStateNotificationToken;
  if (self->mSpringBoardLockStateNotificationToken == -1)
  {
    v16.receiver = self;
    v16.super_class = (Class)STULockStatePropertyProvider_iOS;
    -[STULockStatePropertyProvider beginUpdating](&v16, "beginUpdating");
    objc_initWeak(&location, self);
    v4 = &_dispatch_main_q;
    v10 = _NSConcreteStackBlock;
    v11 = 3221225472;
    v12 = sub_100073A48;
    v13 = &unk_1000C9928;
    objc_copyWeak(&v14, &location);
    v5 = kSBSLockStateNotifyKey;
    v6 = notify_register_dispatch(kSBSLockStateNotifyKey, p_mSpringBoardLockStateNotificationToken, (dispatch_queue_t)&_dispatch_main_q, &v10);

    if ((_DWORD)v6)
    {
      *p_mSpringBoardLockStateNotificationToken = -1;
      if (qword_1000FC680 != -1)
        dispatch_once(&qword_1000FC680, &stru_1000CBDE0);
      v7 = (id)qword_1000FC678;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v8 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v5, v10, v11, v12, v13));
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v6));
        sub_10007E3F8(v8, v9, buf, v7);
      }

    }
    else
    {
      -[STULockStatePropertyProvider_iOS updateScreenLocked](self, "updateScreenLocked", v10, v11, v12, v13);
    }
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
}

- (void)endUpdating
{
  objc_super v3;

  if (self->mSpringBoardLockStateNotificationToken != -1)
  {
    v3.receiver = self;
    v3.super_class = (Class)STULockStatePropertyProvider_iOS;
    -[STULockStatePropertyProvider endUpdating](&v3, "endUpdating");
    notify_cancel(self->mSpringBoardLockStateNotificationToken);
    self->mSpringBoardLockStateNotificationToken = -1;
  }
}

- (void)updateScreenLocked
{
  uint64_t v4;
  _BOOL8 v5;

  if (+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v5 = SBSGetScreenLockStatus(0, v4) != 0;
    -[STULockStatePropertyProvider setScreenLocked:](self, "setScreenLocked:", v5);
  }
  else
  {
    -[STULockStatePropertyProvider_iOS performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", a2, 0, 0);
  }
}

@end
