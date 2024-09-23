void start()
{
  void *v0;
  void *v1;
  id v2;
  void *v3;

  sub_10000354C();
  v0 = objc_autoreleasePoolPush();
  NSLog(CFSTR("inputanalyticsd started!"));
  setlinebuf(__stdoutp);
  v1 = objc_autoreleasePoolPush();
  v2 = objc_alloc_init((Class)IASStandaloneServer);
  v3 = (void *)qword_100008000;
  qword_100008000 = (uint64_t)v2;

  objc_autoreleasePoolPop(v1);
  NSLog(CFSTR("inputanalyticsd dispatching main"));
  dispatch_main();
}

void sub_10000354C()
{
  char *pw_dir;
  uid_t v1;
  passwd *v2;
  char *v3;
  char *v4;
  char *v5;
  char *v6;
  char v7[1024];

  bzero(v7, 0x400uLL);
  pw_dir = getenv("HOME");
  if (!pw_dir)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
      sub_100003894();
    v1 = getuid();
    v2 = getpwuid(v1);
    if (!v2)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        sub_1000036D4();
LABEL_19:
      exit(1);
    }
    pw_dir = v2->pw_dir;
  }
  v3 = realpath_DARWIN_EXTSN(pw_dir, 0);
  if (!v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100003744();
    goto LABEL_19;
  }
  v4 = v3;
  if (!_set_user_dir_suffix("com.apple.inputanalyticsd") || !confstr(65537, v7, 0x400uLL))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_1000037B4();
    goto LABEL_19;
  }
  v5 = realpath_DARWIN_EXTSN(v7, 0);
  if (!v5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100003824();
    goto LABEL_19;
  }
  v6 = v5;
  free(v4);
  free(v6);
}

void sub_1000036B4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

int *sub_1000036CC()
{
  return __error();
}

void sub_1000036D4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  getuid();
  sub_1000036B4((void *)&_mh_execute_header, &_os_log_default, v0, "failed to get passwd entry for uid %u", v1, v2, v3, v4, 0);
  sub_1000036C4();
}

void sub_100003744()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_1000036CC();
  sub_1000036B4((void *)&_mh_execute_header, &_os_log_default, v0, "failed to resolve user's home directory: %{darwin.errno}d", v1, v2, v3, v4, 0);
  sub_1000036C4();
}

void sub_1000037B4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_1000036CC();
  sub_1000036B4((void *)&_mh_execute_header, &_os_log_default, v0, "failed to initialize temporary directory: %{darwin.errno}d", v1, v2, v3, v4, 0);
  sub_1000036C4();
}

void sub_100003824()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_1000036CC();
  sub_1000036B4((void *)&_mh_execute_header, &_os_log_default, v0, "failed to resolve temporary directory: %{darwin.errno}d", v1, v2, v3, v4, 0);
  sub_1000036C4();
}

void sub_100003894()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "$HOME not set, falling back to using getpwuid", v0, 2u);
  sub_1000036C4();
}
