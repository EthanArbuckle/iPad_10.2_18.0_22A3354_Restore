int main(int argc, const char **argv, const char **envp)
{
  int v3;
  _BOOL4 v4;
  uint8_t v6[16];
  uint8_t v7[16];
  uint8_t buf[8];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "avconferenced started.", buf, 2u);
  }
  v3 = VCFeatureFlagManager_UseAvconferenced();
  v4 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v4)
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "avconferenced started.", v7, 2u);
    }
    AVConferenceServerStartInternal(1);
    -[NSRunLoop run](+[NSRunLoop mainRunLoop](NSRunLoop, "mainRunLoop"), "run");
  }
  else if (v4)
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "avconferenced main() is disabled.", v6, 2u);
  }
  return 0;
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainRunLoop");
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "run");
}
