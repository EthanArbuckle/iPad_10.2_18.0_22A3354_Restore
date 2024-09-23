@implementation DIBaseAgentDelegate

- (void)createListener
{
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  char *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  id v14;
  int v15;
  uint64_t v16;
  uint8_t buf[4];
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  void *v22;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseServiceDelegate serviceName](self, "serviceName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByAppendingString:", CFSTR(".xpc")));

  v5 = *__error();
  if (sub_1000BF0BC())
  {
    v16 = 0;
    v6 = sub_1000BF044();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      v8 = 3;
    else
      v8 = 2;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseServiceDelegate serviceName](self, "serviceName"));
    *(_DWORD *)buf = 68158210;
    v18 = 37;
    v19 = 2080;
    v20 = "-[DIBaseAgentDelegate createListener]";
    v21 = 2114;
    v22 = v9;
    v15 = 28;
    v10 = (char *)_os_log_send_and_compose_impl(v8, &v16, 0, 0, &_mh_execute_header, v7, 0, "%.*s: Creating NSXPC listener on %{public}@", buf, v15);

    if (v10)
    {
      fprintf(__stderrp, "%s\n", v10);
      free(v10);
    }
  }
  else
  {
    v11 = sub_1000BF044();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseServiceDelegate serviceName](self, "serviceName"));
      *(_DWORD *)buf = 68158210;
      v18 = 37;
      v19 = 2080;
      v20 = "-[DIBaseAgentDelegate createListener]";
      v21 = 2114;
      v22 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%.*s: Creating NSXPC listener on %{public}@", buf, 0x1Cu);

    }
  }
  *__error() = v5;
  v14 = objc_msgSend(objc_alloc((Class)NSXPCListener), "initWithMachServiceName:", v4);
  -[DIBaseServiceDelegate setListener:](self, "setListener:", v14);

}

@end
