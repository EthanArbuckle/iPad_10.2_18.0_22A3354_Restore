@implementation DIController2ClientDelegate

- (void)attachCompletedWithHandle:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, id);
  int v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  unsigned __int8 v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint8_t buf[4];
  int v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  id v26;

  v6 = a3;
  v7 = (void (**)(id, id))a4;
  v8 = *__error();
  if (sub_1000BF0BC())
  {
    v20 = 0;
    v9 = sub_1000BF044();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      v11 = 3;
    else
      v11 = 2;
    *(_DWORD *)buf = 68158210;
    v22 = 63;
    v23 = 2080;
    v24 = "-[DIController2ClientDelegate attachCompletedWithHandle:reply:]";
    v25 = 2114;
    v26 = v6;
    v12 = (char *)_os_log_send_and_compose_impl(v11, &v20, 0, 0, &_mh_execute_header, v10, 0, "%.*s: Received: %{public}@", buf, 28);

    if (v12)
    {
      fprintf(__stderrp, "%s\n", v12);
      free(v12);
    }
  }
  else
  {
    v13 = sub_1000BF044();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68158210;
      v22 = 63;
      v23 = 2080;
      v24 = "-[DIController2ClientDelegate attachCompletedWithHandle:reply:]";
      v25 = 2114;
      v26 = v6;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%.*s: Received: %{public}@", buf, 0x1Cu);
    }

  }
  *__error() = v8;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "xpcEndpoint"));

  if (v15)
  {
    v19 = 0;
    v16 = objc_msgSend(v6, "addToRefCountWithError:", &v19);
    v17 = v19;
    v18 = v17;
    if ((v16 & 1) == 0)
    {
      v7[2](v7, v17);

      goto LABEL_15;
    }

  }
  -[DIController2ClientDelegate setDeviceHandle:](self, "setDeviceHandle:", v6);
  v7[2](v7, 0);
LABEL_15:

}

- (DIDeviceHandle)deviceHandle
{
  return self->_deviceHandle;
}

- (void)setDeviceHandle:(id)a3
{
  objc_storeStrong((id *)&self->_deviceHandle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceHandle, 0);
}

@end
