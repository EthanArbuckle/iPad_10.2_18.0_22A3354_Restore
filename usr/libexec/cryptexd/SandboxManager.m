@implementation SandboxManager

- (SandboxManager)init
{
  SandboxManager *v2;
  os_log_t v3;
  id v4;
  void *v5;
  uint64_t v7;
  objc_super v8;
  _OWORD v9[5];

  v8.receiver = self;
  v8.super_class = (Class)SandboxManager;
  v2 = -[SandboxManager init](&v8, "init");
  if (v2)
  {
    v3 = os_log_create("com.apple.libcryptex", "SandboxManager");
    -[SandboxManager setLog_handle:](v2, "setLog_handle:", v3);

    v4 = objc_alloc_init((Class)NSMutableDictionary);
    -[SandboxManager setSandboxHandles:](v2, "setSandboxHandles:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SandboxManager sandboxHandles](v2, "sandboxHandles"));
    if (!v5)
      sub_10003F9D4(&v7, v9);
  }
  return v2;
}

+ (id)getManager
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001F468;
  block[3] = &unk_100056298;
  block[4] = a1;
  if (qword_10005A858 != -1)
    dispatch_once(&qword_10005A858, block);
  return (id)qword_10005A860;
}

- (OS_os_log)log_handle
{
  return self->_log_handle;
}

- (void)setLog_handle:(id)a3
{
  objc_storeStrong((id *)&self->_log_handle, a3);
}

- (NSMutableDictionary)sandboxHandles
{
  return self->_sandboxHandles;
}

- (void)setSandboxHandles:(id)a3
{
  objc_storeStrong((id *)&self->_sandboxHandles, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sandboxHandles, 0);
  objc_storeStrong((id *)&self->_log_handle, 0);
}

@end
