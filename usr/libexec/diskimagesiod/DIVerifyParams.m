@implementation DIVerifyParams

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DIVerifyParams)initWithURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  DIVerifyParams *v8;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](NSArray, "array"));
  v8 = -[DIVerifyParams initWithURL:shadowURLs:error:](self, "initWithURL:shadowURLs:error:", v6, v7, a4);

  return v8;
}

- (DIVerifyParams)initWithURL:(id)a3 shadowURLs:(id)a4 error:(id *)a5
{
  id v8;
  DIVerifyParams *v9;
  DIVerifyParams *v10;
  void *v11;
  unsigned int v12;
  DIVerifyParams *v13;
  objc_super v15;

  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)DIVerifyParams;
  v9 = -[DIBaseParams initWithURL:error:](&v15, "initWithURL:error:", a3, a5);
  v10 = v9;
  if (!v9
    || -[DIBaseParams openExistingImageWithFlags:error:](v9, "openExistingImageWithFlags:error:", 0, a5)
    && (v11 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams shadowChain](v10, "shadowChain")),
        v12 = objc_msgSend(v11, "addShadowURLs:error:", v8, a5),
        v11,
        v12))
  {
    v13 = v10;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)shouldValidateShadows
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams shadowChain](self, "shadowChain"));
  v3 = objc_msgSend(v2, "shouldValidate");

  return v3;
}

- (void)setShouldValidateShadows:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[DIBaseParams shadowChain](self, "shadowChain"));
  objc_msgSend(v4, "setShouldValidate:", v3);

}

- (BOOL)verifyWithError:(id *)a3
{
  int v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  unsigned __int8 v13;
  int v15;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  DIClient2Controller_XPCHandler *v23;
  uint8_t buf[4];
  int v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  DIVerifyParams *v29;

  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = sub_100088C7C;
  v22 = sub_100088C8C;
  v23 = objc_alloc_init(DIClient2Controller_XPCHandler);
  v5 = *__error();
  if (sub_1000BF0BC())
  {
    v17 = 0;
    v6 = sub_1000BF044();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      v8 = 3;
    else
      v8 = 2;
    *(_DWORD *)buf = 68158210;
    v25 = 34;
    v26 = 2080;
    v27 = "-[DIVerifyParams verifyWithError:]";
    v28 = 2114;
    v29 = self;
    v15 = 28;
    v9 = (char *)_os_log_send_and_compose_impl(v8, &v17, 0, 0, &_mh_execute_header, v7, 0, "%.*s: entry: %{public}@", buf, v15);

    if (v9)
    {
      fprintf(__stderrp, "%s\n", v9);
      free(v9);
    }
  }
  else
  {
    v10 = sub_1000BF044();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68158210;
      v25 = 34;
      v26 = 2080;
      v27 = "-[DIVerifyParams verifyWithError:]";
      v28 = 2114;
      v29 = self;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%.*s: entry: %{public}@", buf, 0x1Cu);
    }

  }
  *__error() = v5;
  if ((objc_msgSend((id)v19[5], "connectWithError:", a3) & 1) != 0
    && -[DIBaseParams prepareImageWithXpcHandler:fileMode:error:](self, "prepareImageWithXpcHandler:fileMode:error:", v19[5], 2, a3))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v19[5], "remoteProxy"));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100088C94;
    v16[3] = &unk_100170E38;
    v16[4] = &v18;
    objc_msgSend(v12, "verifyWithParams:reply:", self, v16);

    v13 = objc_msgSend((id)v19[5], "completeCommandWithError:", a3);
  }
  else
  {
    v13 = 0;
  }
  _Block_object_dispose(&v18, 8);

  return v13;
}

@end
