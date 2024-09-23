uint64_t start()
{
  char *pw_dir;
  uid_t v1;
  passwd *v2;
  char *v3;
  char *v4;
  void *v5;
  id v6;
  id v7;
  char v9[1024];

  bzero(v9, 0x400uLL);
  pw_dir = getenv("HOME");
  if (!pw_dir)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
      sub_100003608();
    v1 = getuid();
    v2 = getpwuid(v1);
    if (!v2)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        sub_10000342C();
      exit(1);
    }
    pw_dir = v2->pw_dir;
  }
  v3 = realpath_DARWIN_EXTSN(pw_dir, 0);
  if (!v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_1000034A0();
    exit(1);
  }
  if (!_set_user_dir_suffix("com.apple.naturallanguaged") || !confstr(65537, v9, 0x400uLL))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100003518();
    exit(1);
  }
  v4 = realpath_DARWIN_EXTSN(v9, 0);
  if (!v4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100003590();
    exit(1);
  }
  free(v4);
  free(v3);
  v5 = objc_autoreleasePoolPush();
  v6 = objc_alloc_init((Class)TCTextServer);
  v7 = objc_msgSend(objc_alloc((Class)TCXPCServer), "initWithTextServer:", v6);
  objc_msgSend(v7, "run");

  objc_autoreleasePoolPop(v5);
  return 0;
}

void sub_100003414(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void sub_10000342C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  getuid();
  sub_100003414((void *)&_mh_execute_header, &_os_log_default, v0, "failed to get passwd entry for uid %u", v1, v2, v3, v4, 0);
  sub_100003424();
}

void sub_1000034A0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  __error();
  sub_100003414((void *)&_mh_execute_header, &_os_log_default, v0, "failed to resolve user's home directory: %{darwin.errno}d", v1, v2, v3, v4, 0);
  sub_100003424();
}

void sub_100003518()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  __error();
  sub_100003414((void *)&_mh_execute_header, &_os_log_default, v0, "failed to initialize temporary directory: %{darwin.errno}d", v1, v2, v3, v4, 0);
  sub_100003424();
}

void sub_100003590()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  __error();
  sub_100003414((void *)&_mh_execute_header, &_os_log_default, v0, "failed to resolve temporary directory: %{darwin.errno}d", v1, v2, v3, v4, 0);
  sub_100003424();
}

void sub_100003608()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "$HOME not set, falling back to using getpwuid", v0, 2u);
  sub_100003424();
}

id objc_msgSend_initWithTextServer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithTextServer:");
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "run");
}
