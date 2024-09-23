@implementation DIBaseAgentXPCHandler

- (void)createConnection
{
  unsigned int v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  void *v24;

  v3 = -[DIBaseXPCHandler isPrivileged](self, "isPrivileged");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseXPCHandler serviceName](self, "serviceName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingString:", CFSTR(".xpc")));

  v6 = *__error();
  if (sub_1000BF0BC())
  {
    v18 = 0;
    v7 = sub_1000BF044();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      v9 = 3;
    else
      v9 = 2;
    *(_DWORD *)buf = 68158210;
    v20 = 41;
    v21 = 2080;
    v22 = "-[DIBaseAgentXPCHandler createConnection]";
    v23 = 2114;
    v24 = v5;
    v17 = 28;
    v10 = (char *)_os_log_send_and_compose_impl(v9, &v18, 0, 0, &_mh_execute_header, v8, 0, "%.*s: Creating connection to %{public}@", buf, v17);

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
      *(_DWORD *)buf = 68158210;
      v20 = 41;
      v21 = 2080;
      v22 = "-[DIBaseAgentXPCHandler createConnection]";
      v23 = 2114;
      v24 = v5;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%.*s: Creating connection to %{public}@", buf, 0x1Cu);
    }

  }
  if (v3)
    v13 = 4096;
  else
    v13 = 0;
  *__error() = v6;
  v14 = objc_msgSend(objc_alloc((Class)NSXPCConnection), "initWithMachServiceName:options:", v5, v13);
  -[DIBaseXPCHandler setConnection:](self, "setConnection:", v14);

  -[DIBaseAgentXPCHandler setConnectionMode](self, "setConnectionMode");
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseXPCHandler remoteObjectInterface](self, "remoteObjectInterface"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseXPCHandler connection](self, "connection"));
  objc_msgSend(v16, "setRemoteObjectInterface:", v15);

}

@end
