@implementation MBAppleCarePlugin

- (void)_logEventWithSubtype:(id)a3 code:(int64_t)a4
{
  NSObject *v6;
  _QWORD v7[3];
  uint8_t buf[4];
  id v9;
  __int16 v10;
  int64_t v11;

  if (!a3)
    sub_100088710();
  v6 = MBGetDefaultLog(self, a2);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v9 = a3;
    v10 = 2048;
    v11 = a4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Logging event for AppleCare: [backup, %@, %lu]", buf, 0x16u);
    _MBLog(CFSTR("INFO"), "Logging event for AppleCare: [backup, %@, %lu]", a3, a4);
  }
  v7[0] = CFSTR("backup");
  v7[1] = a3;
  v7[2] = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a4);
  logEventForAppleCare(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v7, 3));
}

- (id)endedBackupWithEngine:(id)a3 error:(id)a4
{
  const __CFString *v7;

  if ((objc_msgSend(a3, "isServiceEngine") & 1) != 0)
  {
    v7 = CFSTR("iCloudBackup");
  }
  else if ((objc_msgSend(a3, "isDeviceTransferEngine") & 1) != 0)
  {
    v7 = CFSTR("D2DBackup");
  }
  else if (objc_msgSend(a3, "isDriveEngine"))
  {
    v7 = CFSTR("iTunesBackup");
  }
  else
  {
    v7 = 0;
  }
  -[MBAppleCarePlugin _logEventWithSubtype:code:](self, "_logEventWithSubtype:code:", v7, objc_msgSend(a4, "code"));
  return 0;
}

- (id)endedRestoreWithPolicy:(id)a3 engine:(id)a4 error:(id)a5
{
  const __CFString *v8;

  if ((objc_msgSend(a4, "isServiceEngine", a3) & 1) != 0)
  {
    v8 = CFSTR("iCloudRestore");
  }
  else if ((objc_msgSend(a4, "isDeviceTransferEngine") & 1) != 0)
  {
    v8 = CFSTR("D2DRestore");
  }
  else if (objc_msgSend(a4, "isDriveEngine"))
  {
    v8 = CFSTR("iTunesRestore");
  }
  else
  {
    v8 = 0;
  }
  -[MBAppleCarePlugin _logEventWithSubtype:code:](self, "_logEventWithSubtype:code:", v8, objc_msgSend(a5, "code"));
  return 0;
}

@end
