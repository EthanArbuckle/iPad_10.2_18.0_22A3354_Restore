uint64_t start()
{
  void *v0;
  id v1;
  uint64_t v2;
  NSObject *v3;
  int v5;
  _DWORD v6[2];

  v0 = objc_autoreleasePoolPush();
  if ((_set_user_dir_suffix("com.apple.triald.system") & 1) == 0
    && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    v5 = *__error();
    v6[0] = 67109120;
    v6[1] = v5;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unable to set private sandbox for com.apple.triald.system, errno: %d", (uint8_t *)v6, 8u);
  }
  v1 = NSTemporaryDirectory();
  v2 = TRILogCategory_Server(v1);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v6[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "triald_system started", (uint8_t *)v6, 2u);
  }

  TRIDSystemServerRun();
  objc_autoreleasePoolPop(v0);
  return 0;
}
