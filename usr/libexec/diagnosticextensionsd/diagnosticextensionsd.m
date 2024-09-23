uint64_t start()
{
  void *v0;
  void *v1;

  sub_100003144();
  v0 = objc_autoreleasePoolPush();
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_100004108);
  objc_autoreleasePoolPop(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop"));
  objc_msgSend(v1, "run");

  return 0;
}

void sub_100002D58(id a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(+[DEDDaemon sharedInstance](DEDDaemon, "sharedInstance"));
  objc_msgSend(v1, "start");

}

void sub_100002D8C()
{
  char *pw_dir;
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uid_t v9;
  passwd *v10;
  char *v11;
  char *v12;
  char *v13;
  char *v14;
  char *v15;
  char *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[7];
  char v21[1024];

  bzero(v21, 0x400uLL);
  pw_dir = getenv("HOME");
  if (!pw_dir)
  {
    if (qword_100008028 != -1)
      dispatch_once(&qword_100008028, &stru_100004148);
    v1 = qword_100008020;
    if (os_log_type_enabled((os_log_t)qword_100008020, OS_LOG_TYPE_DEBUG))
      sub_100003570(v1, v2, v3, v4, v5, v6, v7, v8);
    v9 = getuid();
    v10 = getpwuid(v9);
    if (!v10)
    {
      if (qword_100008028 != -1)
        dispatch_once(&qword_100008028, &stru_100004148);
      if (os_log_type_enabled((os_log_t)qword_100008020, OS_LOG_TYPE_ERROR))
        sub_100003274();
LABEL_44:
      exit(1);
    }
    pw_dir = v10->pw_dir;
  }
  v11 = realpath_DARWIN_EXTSN(pw_dir, 0);
  if (!v11)
  {
    if (qword_100008028 != -1)
      dispatch_once(&qword_100008028, &stru_100004148);
    if (os_log_type_enabled((os_log_t)qword_100008020, OS_LOG_TYPE_ERROR))
      sub_1000032E4();
    goto LABEL_44;
  }
  v12 = v11;
  if (!_set_user_dir_suffix("diagnosticextensionsd") || !confstr(65537, v21, 0x400uLL))
  {
    if (qword_100008028 != -1)
      dispatch_once(&qword_100008028, &stru_100004148);
    if (os_log_type_enabled((os_log_t)qword_100008020, OS_LOG_TYPE_ERROR))
      sub_100003350();
    goto LABEL_44;
  }
  v13 = realpath_DARWIN_EXTSN(v21, 0);
  if (!v13)
  {
    if (qword_100008028 != -1)
      dispatch_once(&qword_100008028, &stru_100004148);
    if (os_log_type_enabled((os_log_t)qword_100008020, OS_LOG_TYPE_ERROR))
      sub_1000033BC();
    goto LABEL_44;
  }
  v14 = v13;
  if (!confstr(65538, v21, 0x400uLL))
  {
    if (qword_100008028 != -1)
      dispatch_once(&qword_100008028, &stru_100004148);
    if (os_log_type_enabled((os_log_t)qword_100008020, OS_LOG_TYPE_ERROR))
      sub_100003428();
    goto LABEL_44;
  }
  v15 = realpath_DARWIN_EXTSN(v21, 0);
  if (!v15)
  {
    if (qword_100008028 != -1)
      dispatch_once(&qword_100008028, &stru_100004148);
    if (os_log_type_enabled((os_log_t)qword_100008020, OS_LOG_TYPE_ERROR))
      sub_100003494();
    goto LABEL_44;
  }
  v16 = v15;
  v20[0] = "HOME";
  v20[1] = v12;
  v20[2] = "TMPDIR";
  v20[3] = v14;
  v20[4] = "DARWIN_CACHE_DIR";
  v20[5] = v15;
  v20[6] = 0;
  v19 = 0;
  if (sandbox_init_with_parameters("diagnosticextensionsd", 1, v20, &v19))
  {
    if (qword_100008028 != -1)
      dispatch_once(&qword_100008028, &stru_100004148);
    v17 = qword_100008020;
    if (os_log_type_enabled((os_log_t)qword_100008020, OS_LOG_TYPE_ERROR))
      sub_100003500(&v19, v17, v18);
    goto LABEL_44;
  }
  free(v12);
  free(v14);
  free(v16);
}

void sub_100003144()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;

  if (_set_user_dir_suffix("com.apple.diagnosticextensionsd"))
  {
    if (qword_100008028 != -1)
      dispatch_once(&qword_100008028, &stru_100004148);
    v0 = qword_100008020;
    if (os_log_type_enabled((os_log_t)qword_100008020, OS_LOG_TYPE_DEBUG))
      sub_1000035A4(v0, v1, v2, v3, v4, v5, v6, v7);
  }
  else
  {
    if (qword_100008028 != -1)
      dispatch_once(&qword_100008028, &stru_100004148);
    v8 = qword_100008020;
    if (os_log_type_enabled((os_log_t)qword_100008020, OS_LOG_TYPE_ERROR))
      sub_1000035D8(v8);
  }
}

void sub_1000031F8(id a1)
{
  qword_100008020 = (uint64_t)os_log_create("com.apple.diagnosticextensionsd", "sandbox");
}

void sub_100003224(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

int *sub_100003244()
{
  return __error();
}

void sub_10000324C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_100003268(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_100003274()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  getuid();
  sub_100003224((void *)&_mh_execute_header, v0, v1, "failed to get passwd entry for uid %u", v2, v3, v4, v5, 0);
  sub_100003238();
}

void sub_1000032E4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003244();
  sub_10000325C();
  sub_100003224((void *)&_mh_execute_header, v0, v1, "failed to resolve user's home directory: %{darwin.errno}d", v2, v3, v4, v5, v6);
  sub_100003238();
}

void sub_100003350()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003244();
  sub_10000325C();
  sub_100003224((void *)&_mh_execute_header, v0, v1, "failed to initialize temporary directory: %{darwin.errno}d", v2, v3, v4, v5, v6);
  sub_100003238();
}

void sub_1000033BC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003244();
  sub_10000325C();
  sub_100003224((void *)&_mh_execute_header, v0, v1, "failed to resolve temporary directory: %{darwin.errno}d", v2, v3, v4, v5, v6);
  sub_100003238();
}

void sub_100003428()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003244();
  sub_10000325C();
  sub_100003224((void *)&_mh_execute_header, v0, v1, "failed to initialize cache directory: %{darwin.errno}d", v2, v3, v4, v5, v6);
  sub_100003238();
}

void sub_100003494()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100003244();
  sub_10000325C();
  sub_100003224((void *)&_mh_execute_header, v0, v1, "failed to resolve cache directory: %{darwin.errno}d", v2, v3, v4, v5, v6);
  sub_100003238();
}

void sub_100003500(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;

  v3 = *a1;
  v4 = 136446210;
  v5 = v3;
  sub_100003268((void *)&_mh_execute_header, a2, a3, "Failed to enter sandbox: %{public}s", (uint8_t *)&v4);
}

void sub_100003570(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000324C((void *)&_mh_execute_header, a1, a3, "$HOME not set, falling back to using getpwuid", a5, a6, a7, a8, 0);
}

void sub_1000035A4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000324C((void *)&_mh_execute_header, a1, a3, "Configured sandboxed temporary directory", a5, a6, a7, a8, 0);
}

void sub_1000035D8(NSObject *a1)
{
  int *v2;
  char *v3;
  uint64_t v4;
  int v5;
  char *v6;

  v2 = __error();
  v3 = strerror(*v2);
  v5 = 136315138;
  v6 = v3;
  sub_100003268((void *)&_mh_execute_header, a1, v4, "Failed to configure sandbox temporary directory, error %s", (uint8_t *)&v5);
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentRunLoop");
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "run");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "start");
}
