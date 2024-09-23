@implementation TSDDaemon

- (TSDDaemon)init
{
  TSDDaemon *v2;
  DaemonServiceMatcher *v3;
  unsigned __int8 v4;
  _BOOL4 v5;
  objc_super v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;

  v7.receiver = self;
  v7.super_class = (Class)TSDDaemon;
  v2 = -[TSDDaemon init](&v7, "init");
  if (v2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "TSDDaemon waiting for daemon service to become available\n", buf, 2u);
    }
    v3 = objc_alloc_init(DaemonServiceMatcher);
    v4 = -[DaemonServiceMatcher waitForService](v3, "waitForService");
    v5 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
    if ((v4 & 1) != 0)
    {
      if (v5)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "TSDDaemon daemon service matched and available\n", buf, 2u);
      }
      -[TSDDaemon start](v2, "start");
    }
    else
    {
      if (v5)
      {
        *(_DWORD *)buf = 136316418;
        v9 = "serviceIsAvailable";
        v10 = 2048;
        v11 = 0;
        v12 = 2048;
        v13 = 0;
        v14 = 2080;
        v15 = "";
        v16 = 2080;
        v17 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/TSDDaemon.m";
        v18 = 1024;
        v19 = 47;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
      }

      v2 = 0;
    }

  }
  return v2;
}

- (void)start
{
  _QWORD v3[5];
  uint8_t buf[16];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "TSDDaemon waiting for clock manager to become available\n", buf, 2u);
  }
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10001E3E8;
  v3[3] = &unk_10003C4B0;
  v3[4] = self;
  +[TSDClockManager notifyWhenClockManagerIsAvailable:](TSDClockManager, "notifyWhenClockManagerIsAvailable:", v3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_daemonServiceServer, 0);
  objc_storeStrong((id *)&self->_diagnosticsManager, 0);
}

@end
