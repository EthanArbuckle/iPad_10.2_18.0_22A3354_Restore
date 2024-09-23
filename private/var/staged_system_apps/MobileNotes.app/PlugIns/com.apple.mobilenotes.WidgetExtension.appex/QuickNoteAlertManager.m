@implementation QuickNoteAlertManager

+ (id)sharedInstance
{
  if (qword_10008E248[0] != -1)
    dispatch_once(qword_10008E248, &stru_1000819F0);
  return (id)qword_10008E240;
}

- (void)activateRemoteAlert
{
  id v3;
  id v4;
  id v5;
  SBSRemoteAlertHandle *remoteAlertHandle;
  id v7;

  if (!self->_remoteAlertHandle)
  {
    v7 = objc_msgSend(objc_alloc((Class)SBSRemoteAlertDefinition), "initWithServiceName:viewControllerClassName:", CFSTR("com.apple.SystemPaperViewService"), CFSTR("ViewController"));
    v3 = objc_alloc_init((Class)SBSRemoteAlertConfigurationContext);
    v4 = +[SBSRemoteAlertHandle newHandleWithDefinition:configurationContext:](SBSRemoteAlertHandle, "newHandleWithDefinition:configurationContext:", v7, v3);
    v5 = objc_alloc_init((Class)SBSRemoteAlertActivationContext);
    objc_msgSend(v4, "registerObserver:", self);
    objc_msgSend(v4, "activateWithContext:", v5);
    remoteAlertHandle = self->_remoteAlertHandle;
    self->_remoteAlertHandle = (SBSRemoteAlertHandle *)v4;

  }
}

- (void)remoteAlertHandleDidActivate:(id)a3
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = os_log_create("com.apple.notes", "SystemPaper");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    sub_100061138(v3, v4, v5, v6, v7, v8, v9, v10);

}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v4 = a3;
  v5 = os_log_create("com.apple.notes", "SystemPaper");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    sub_10006116C(v5, v6, v7, v8, v9, v10, v11, v12);

  -[QuickNoteAlertManager _cleanupRemoteAlertHandle:](self, "_cleanupRemoteAlertHandle:", v4);
}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _BOOL4 v9;
  NSObject *v10;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "domain"));
  if (objc_msgSend(v8, "isEqualToString:", SBSRemoteAlertHandleInvalidationErrorDomain))
  {
    if (!objc_msgSend(v6, "code") || objc_msgSend(v6, "code") == (id)5)
    {

      goto LABEL_11;
    }
    v9 = objc_msgSend(v6, "code") == (id)4;
  }
  else
  {
    v9 = 0;
  }

  if (!v6 || v9)
  {
LABEL_11:
    v10 = os_log_create("com.apple.notes", "SystemPaper");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      sub_1000611A0((uint64_t)v6, v10);
    goto LABEL_13;
  }
  v10 = os_log_create("com.apple.notes", "SystemPaper");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    sub_100061214((uint64_t)v6, v10);
LABEL_13:

  -[QuickNoteAlertManager _cleanupRemoteAlertHandle:](self, "_cleanupRemoteAlertHandle:", v7);
}

- (void)_cleanupRemoteAlertHandle:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  QuickNoteAlertManager *v7;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100005D8C;
  v5[3] = &unk_100081A18;
  v6 = a3;
  v7 = self;
  v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteAlertHandle, 0);
}

@end
