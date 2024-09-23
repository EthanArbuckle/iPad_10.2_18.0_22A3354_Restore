void sub_100003254()
{
  char *pw_dir;
  uid_t v1;
  passwd *v2;
  char *v3;
  char *v4;
  char *v5;
  char *v6;
  char *v7;
  char *v8;
  uint64_t v9;
  _QWORD v10[7];
  char v11[1024];

  bzero(v11, 0x400uLL);
  pw_dir = getenv("HOME");
  if (!pw_dir)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
      sub_1000037FC();
    v1 = getuid();
    v2 = getpwuid(v1);
    if (!v2)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        sub_1000034F0();
LABEL_28:
      exit(1);
    }
    pw_dir = v2->pw_dir;
  }
  v3 = realpath_DARWIN_EXTSN(pw_dir, 0);
  if (!v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100003560();
    goto LABEL_28;
  }
  v4 = v3;
  if (!_set_user_dir_suffix("betaenrollmentd") || !confstr(65537, v11, 0x400uLL))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_1000035CC();
    goto LABEL_28;
  }
  v5 = realpath_DARWIN_EXTSN(v11, 0);
  if (!v5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100003638();
    goto LABEL_28;
  }
  v6 = v5;
  if (!confstr(65538, v11, 0x400uLL))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_1000036A4();
    goto LABEL_28;
  }
  v7 = realpath_DARWIN_EXTSN(v11, 0);
  if (!v7)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100003710();
    goto LABEL_28;
  }
  v8 = v7;
  v10[0] = "HOME";
  v10[1] = v4;
  v10[2] = "TMPDIR";
  v10[3] = v6;
  v10[4] = "DARWIN_CACHE_DIR";
  v10[5] = v7;
  v10[6] = 0;
  v9 = 0;
  if (sandbox_init_with_parameters("betaenrollmentd", 1, v10, &v9))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10000377C(&v9);
    goto LABEL_28;
  }
  free(v4);
  free(v6);
  free(v8);
}

void sub_100003494(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

int *sub_1000034AC()
{
  return __error();
}

void start()
{
  void *v0;
  void *v1;

  v0 = objc_autoreleasePoolPush();
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[SDDaemon sharedInstance](SDDaemon, "sharedInstance"));
  objc_msgSend(v1, "start");

  dispatch_main();
}

void sub_1000034F0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  getuid();
  sub_100003494((void *)&_mh_execute_header, &_os_log_default, v0, "failed to get passwd entry for uid %u", v1, v2, v3, v4, 0);
  sub_1000034A4();
}

void sub_100003560()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_1000034AC();
  sub_1000034B4();
  sub_100003494((void *)&_mh_execute_header, &_os_log_default, v0, "failed to resolve user's home directory: %{darwin.errno}d", v1, v2, v3, v4, v5);
  sub_1000034A4();
}

void sub_1000035CC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_1000034AC();
  sub_1000034B4();
  sub_100003494((void *)&_mh_execute_header, &_os_log_default, v0, "failed to initialize temporary directory: %{darwin.errno}d", v1, v2, v3, v4, v5);
  sub_1000034A4();
}

void sub_100003638()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_1000034AC();
  sub_1000034B4();
  sub_100003494((void *)&_mh_execute_header, &_os_log_default, v0, "failed to resolve temporary directory: %{darwin.errno}d", v1, v2, v3, v4, v5);
  sub_1000034A4();
}

void sub_1000036A4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_1000034AC();
  sub_1000034B4();
  sub_100003494((void *)&_mh_execute_header, &_os_log_default, v0, "failed to initialize cache directory: %{darwin.errno}d", v1, v2, v3, v4, v5);
  sub_1000034A4();
}

void sub_100003710()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_1000034AC();
  sub_1000034B4();
  sub_100003494((void *)&_mh_execute_header, &_os_log_default, v0, "failed to resolve cache directory: %{darwin.errno}d", v1, v2, v3, v4, v5);
  sub_1000034A4();
}

void sub_10000377C(uint64_t *a1)
{
  uint64_t v1;
  int v2;
  uint64_t v3;

  v1 = *a1;
  v2 = 136446210;
  v3 = v1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to enter sandbox: %{public}s", (uint8_t *)&v2, 0xCu);
}

void sub_1000037FC()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "$HOME not set, falling back to using getpwuid", v0, 2u);
  sub_1000034A4();
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "start");
}
