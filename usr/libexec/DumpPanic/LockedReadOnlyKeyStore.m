@implementation LockedReadOnlyKeyStore

- (BOOL)unlock
{
  _BOOL4 v3;
  int v4;
  int v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  intptr_t v9;
  uint64_t v10;
  objc_super v12;
  uint8_t buf[16];

  if (!&_MKBDeviceUnlockedSinceBoot)
  {
LABEL_2:
    v12.receiver = self;
    v12.super_class = (Class)LockedReadOnlyKeyStore;
    LOBYTE(v3) = -[ReadOnlyKeyStore unlock](&v12, "unlock");
    return v3;
  }
  v4 = MKBDeviceUnlockedSinceBoot(self, a2);
  if (v4 < 0)
  {
    v8 = qword_10003A5D8;
    v3 = os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR);
    if (!v3)
      return v3;
    *(_WORD *)buf = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Unable to get device lock state", buf, 2u);
  }
  else
  {
    v5 = v4;
    v6 = qword_10003A5D8;
    v7 = os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT);
    if (v5 == 1)
    {
      if (v7)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Device already after first unlock", buf, 2u);
      }
      goto LABEL_2;
    }
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Waiting for first unlock ...", buf, 2u);
    }
    v9 = dispatch_semaphore_wait((dispatch_semaphore_t)qword_10003A538, 0xFFFFFFFFFFFFFFFFLL);
    if (MKBDeviceUnlockedSinceBoot(v9, v10) == 1)
      goto LABEL_2;
  }
  LOBYTE(v3) = 0;
  return v3;
}

@end
