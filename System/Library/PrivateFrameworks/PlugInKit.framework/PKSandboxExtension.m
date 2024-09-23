@implementation PKSandboxExtension

- (PKSandboxExtension)initWithExtension:(id)a3 provider:(id)a4
{
  id v7;
  id v8;
  PKSandboxExtension *v9;
  PKSandboxExtension *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKSandboxExtension;
  v9 = -[PKSandboxExtension init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_token, a3);
    v10->_handle = -1;
    objc_storeStrong((id *)&v10->_provider, a4);
  }

  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[PKSandboxExtension expel](self, "expel");
  v3.receiver = self;
  v3.super_class = (Class)PKSandboxExtension;
  -[PKSandboxExtension dealloc](&v3, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[PKSandboxExtension token](self, "token");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "token");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToString:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)consume
{
  void *v3;
  id v4;
  int64_t v5;
  NSObject *v6;
  NSObject *v7;

  if (-[PKSandboxExtension handle](self, "handle") == -1)
  {
    -[PKSandboxExtension provider](self, "provider");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSandboxExtension token](self, "token");
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[PKSandboxExtension setHandle:](self, "setHandle:", objc_msgSend(v3, "sandbox_extension_consume:", objc_msgSend(v4, "UTF8String")));

    v5 = -[PKSandboxExtension handle](self, "handle");
    pklog_handle_for_category(4);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v5 == -1)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        sub_1AF2777D0(v7);
    }
    else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      sub_1AF277858(self, (const char *)v7);
    }

  }
}

- (void)expel
{
  void *v3;
  int v4;
  NSObject *v5;
  char *v6;

  if (-[PKSandboxExtension handle](self, "handle") != -1)
  {
    -[PKSandboxExtension provider](self, "provider");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "sandbox_extension_release:", -[PKSandboxExtension handle](self, "handle"));

    pklog_handle_for_category(4);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (char *)v5;
    if (v4)
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        sub_1AF277918(self, v6);
    }
    else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      sub_1AF2778B8(self, v6);
    }

    -[PKSandboxExtension setHandle:](self, "setHandle:", -1);
  }
}

- (int64_t)handle
{
  return self->_handle;
}

- (void)setHandle:(int64_t)a3
{
  self->_handle = a3;
}

- (NSString)token
{
  return self->_token;
}

- (PKSandboxProvider)provider
{
  return self->_provider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_token, 0);
}

@end
