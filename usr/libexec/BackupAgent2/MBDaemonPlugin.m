@implementation MBDaemonPlugin

- (id)startingBackupWithEngine:(id)a3
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint8_t v7[16];

  v3 = objc_msgSend(a3, "isDeviceTransferEngine");
  if ((v3 & 1) == 0)
  {
    v5 = MBGetDefaultLog(v3, v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Starting sync spinner for backup", v7, 2u);
      _MBLog(CFSTR("INFO"), "Starting sync spinner for backup");
    }
    SBSSetStatusBarShowsSyncActivity(1, 3000);
  }
  return 0;
}

- (id)endingBackupWithEngine:(id)a3
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint8_t v7[16];

  v3 = objc_msgSend(a3, "isDeviceTransferEngine");
  if ((v3 & 1) == 0)
  {
    v5 = MBGetDefaultLog(v3, v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Stopping sync spinner for backup", v7, 2u);
      _MBLog(CFSTR("INFO"), "Stopping sync spinner for backup");
    }
    SBSSetStatusBarShowsSyncActivity(0, 3000);
  }
  return 0;
}

- (id)preparingRestoreWithPolicy:(id)a3 engine:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  double Current;
  int v15;
  CFRunLoopRunResult v16;
  MBError *v17;
  NSObject *v18;
  uint8_t buf[8];
  _QWORD handler[5];
  uint8_t v22[8];
  uint8_t *v23;
  uint64_t v24;
  char v25;
  int out_token;

  v6 = objc_msgSend(a4, "isDeviceTransferEngine", a3);
  if ((v6 & 1) != 0
    || (v6 = objc_msgSend(objc_msgSend(a4, "settingsContext"), "shouldNotifySpringBoard"), !(_DWORD)v6))
  {
    v18 = MBGetDefaultLog(v6, v7);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v22 = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Not sending notification that a restore has started", v22, 2u);
      _MBLog(CFSTR("INFO"), "Not sending notification that a restore has started");
    }
    return 0;
  }
  out_token = 0;
  *(_QWORD *)v22 = 0;
  v23 = v22;
  v24 = 0x2020000000;
  v25 = 0;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10003B8C4;
  handler[3] = &unk_1000D97F0;
  handler[4] = v22;
  v8 = notify_register_dispatch("com.apple.SpringBoard.ReadyForRestore", &out_token, (dispatch_queue_t)&_dispatch_main_q, handler);
  if ((_DWORD)v8)
    objc_exception_throw(objc_msgSend(objc_alloc((Class)MBException), "initWithCode:format:", 1, CFSTR("notify_register_dispatch failed: %u"), v8));
  v10 = MBGetDefaultLog(v8, v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Sending notification that a restore has started", buf, 2u);
    _MBLog(CFSTR("INFO"), "Sending notification that a restore has started");
  }
  objc_msgSend(+[MBNotificationCenter sharedNotificationCenter](MBNotificationCenter, "sharedNotificationCenter"), "setState:forNotification:", 1, CFSTR("com.apple.MobileSync.BackupAgent.RestoreStarted"));
  v11 = objc_msgSend(+[MBNotificationCenter sharedNotificationCenter](MBNotificationCenter, "sharedNotificationCenter"), "postNotification:", CFSTR("com.apple.MobileSync.BackupAgent.RestoreStarted"));
  v13 = MBGetDefaultLog(v11, v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Waiting for notification from SpringBoard that it's ready for a restore", buf, 2u);
    _MBLog(CFSTR("DEFAULT"), "Waiting for notification from SpringBoard that it's ready for a restore");
  }
  Current = CFAbsoluteTimeGetCurrent();
  v15 = (int)(Current - CFAbsoluteTimeGetCurrent() + 90.0);
  if (v15 < 1 || v23[24])
  {
    v16 = 0;
  }
  else
  {
    do
    {
      v16 = CFRunLoopRunInMode(kCFRunLoopDefaultMode, (double)v15, 0);
      v15 = (int)(Current - CFAbsoluteTimeGetCurrent() + 90.0);
    }
    while (v15 >= 1 && !v23[24]);
  }
  objc_msgSend(+[MBNotificationCenter sharedNotificationCenter](MBNotificationCenter, "sharedNotificationCenter"), "setState:forNotification:", 0, CFSTR("com.apple.MobileSync.BackupAgent.RestoreStarted"));
  notify_cancel(out_token);
  if (v16 != kCFRunLoopRunTimedOut)
  {
    self->_restoreStarted = 1;
    _Block_object_dispose(v22, 8);
    return 0;
  }
  v17 = +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 1, CFSTR("Timeout waiting for SpringBoard notification from SpringBoard that it's ready for a restore"));
  _Block_object_dispose(v22, 8);
  return v17;
}

- (void)_waitForRebootSignal
{
  id v2;
  uint64_t v3;
  BOOL v4;
  uint64_t v5;
  unint64_t v6;
  NSObject *v7;
  char v8;
  uint8_t buf[4];
  const __CFString *v10;
  __int16 v11;
  const __CFString *v12;

  v8 = 0;
  v2 = objc_msgSend(+[MBPersona personalPersonaWithError:](MBPersona, "personalPersonaWithError:", 0), "getBooleanValueForKey:keyExists:", CFSTR("RestoreShouldReboot"), &v8);
  if (v8)
    v4 = (_DWORD)v2 == 0;
  else
    v4 = 0;
  if (v4)
  {
    v5 = 0;
    v6 = 0;
    do
    {
      if (!(v5 + 24 * (v6 / 0x18)))
      {
        v7 = MBGetDefaultLog(v2, v3);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v10 = CFSTR("com.apple.MobileBackup");
          v11 = 2112;
          v12 = CFSTR("RestoreShouldReboot");
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Not rebooting after restore because %@ %@ preference is set - unset this preference to finish the restore", buf, 0x16u);
          _MBLog(CFSTR("DEFAULT"), "Not rebooting after restore because %@ %@ preference is set - unset this preference to finish the restore", CFSTR("com.apple.MobileBackup"), CFSTR("RestoreShouldReboot"));
        }
      }
      sleep(5u);
      v8 = 0;
      v2 = objc_msgSend(+[MBPersona personalPersonaWithError:](MBPersona, "personalPersonaWithError:", 0), "getBooleanValueForKey:keyExists:", CFSTR("RestoreShouldReboot"), &v8);
      if (!v8)
        break;
      ++v6;
      --v5;
    }
    while (!(_DWORD)v2);
  }
}

- (id)endedRestoreWithPolicy:(id)a3 engine:(id)a4 error:(id)a5
{
  id v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  uint8_t v12[16];
  uint8_t buf[16];

  -[MBDaemonPlugin _waitForRebootSignal](self, "_waitForRebootSignal", a3, a4, a5);
  v7 = objc_msgSend(a4, "isDeviceTransferEngine");
  if ((v7 & 1) == 0
    && self->_restoreStarted
    && (v7 = objc_msgSend(objc_msgSend(a4, "settingsContext"), "shouldNotifySpringBoard"), (_DWORD)v7))
  {
    v9 = MBGetDefaultLog(v7, v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Sending notification that a restore has ended", buf, 2u);
      _MBLog(CFSTR("INFO"), "Sending notification that a restore has ended");
    }
    objc_msgSend(+[MBNotificationCenter sharedNotificationCenter](MBNotificationCenter, "sharedNotificationCenter"), "postNotification:", CFSTR("com.apple.MobileSync.BackupAgent.kBackupAgentRestoreEnded"));
  }
  else
  {
    v10 = MBGetDefaultLog(v7, v8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Not sending notification that a restore has ended", v12, 2u);
      _MBLog(CFSTR("INFO"), "Not sending notification that a restore has ended");
    }
  }
  return 0;
}

@end
