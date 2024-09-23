@implementation DMDLockdownUtilities

+ (NSDate)deviceLastCloudBackupDate
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = lockdown_connect(a1, a2);
  v3 = (void *)v2;
  if (v2)
  {
    v4 = (void *)lockdown_copy_value(v2, CFSTR("com.apple.mobile.backup"), CFSTR("LastCloudBackupDate"));
    lockdown_disconnect(v3);
    if (v4)
    {
      v5 = objc_opt_class(NSNumber);
      if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
      {
        v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(unint64_t)objc_msgSend(v4, "unsignedLongLongValue") + 978307200.0));
LABEL_8:

        return (NSDate *)v3;
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        sub_10007748C();
    }
    v3 = 0;
    goto LABEL_8;
  }
  return (NSDate *)v3;
}

+ (BOOL)setDeviceName:(id)a3 outError:(id *)a4
{
  id v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  BOOL v11;
  _QWORD v13[5];

  v5 = a3;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10004C2F0;
  v13[3] = &unk_1000BB2B8;
  v13[4] = a4;
  v6 = objc_retainBlock(v13);
  v8 = lockdown_connect(v6, v7);
  if (v8)
  {
    v9 = v8;
    v10 = lockdown_set_value(v8, 0, kLockdownDeviceNameKey, v5);
    lockdown_disconnect(v9);
    if (!v10)
    {
      v11 = 1;
      goto LABEL_7;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_1000774D0(v10);
  }
  ((void (*)(_QWORD *, uint64_t))v6[2])(v6, 2300);
  v11 = 0;
LABEL_7:

  return v11;
}

@end
