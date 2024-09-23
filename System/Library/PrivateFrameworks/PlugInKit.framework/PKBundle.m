@implementation PKBundle

- (void)set_bundle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (PKBundle)initWithXPCBundle:(id)a3
{
  id v4;
  PKBundle *v5;
  PKBundle *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKBundle;
  v5 = -[PKBundle init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[PKBundle set_bundle:](v5, "set_bundle:", v4);

  return v6;
}

- (PKBundle)initWithExecutableURL:(id)a3
{
  void *v4;
  PKBundle *v5;

  objc_msgSend(a3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PKBundle initWithExecutablePath:](self, "initWithExecutablePath:", v4);

  return v5;
}

- (PKBundle)initWithExecutablePath:(id)a3
{
  id v4;
  void *v5;
  PKBundle *v6;
  PKBundle *v7;

  v4 = objc_retainAutorelease(a3);
  objc_msgSend(v4, "UTF8String");
  v5 = (void *)xpc_bundle_create();
  if (xpc_bundle_get_property())
    v6 = -[PKBundle initWithXPCBundle:](self, "initWithXPCBundle:", v5);
  else
    v6 = -[PKBundle initWithPath:](self, "initWithPath:", v4);
  v7 = v6;

  return v7;
}

- (id)initForMainBundle
{
  void *main;
  PKBundle *v4;

  main = (void *)xpc_bundle_create_main();
  v4 = -[PKBundle initWithXPCBundle:](self, "initWithXPCBundle:", main);

  return v4;
}

- (PKBundle)initWithURL:(id)a3
{
  void *v4;
  PKBundle *v5;

  objc_msgSend(a3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PKBundle initWithPath:](self, "initWithPath:", v4);

  return v5;
}

- (PKBundle)initWithPath:(id)a3
{
  id v4;
  void *v5;
  PKBundle *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  id v17;

  v4 = objc_retainAutorelease(a3);
  objc_msgSend(v4, "UTF8String");
  v5 = (void *)xpc_bundle_create();
  if (xpc_bundle_get_property())
  {
    self = -[PKBundle initWithXPCBundle:](self, "initWithXPCBundle:", v5);
    v6 = self;
  }
  else
  {
    xpc_bundle_get_error();
    pklog_handle_for_category(1);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1AF277610();

    objc_msgSend(v4, "lastPathComponent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pathExtension");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("appex"));

    if (v10)
    {
      v11 = objc_alloc(MEMORY[0x1E0CA5848]);
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v4, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 0;
      v13 = (void *)objc_msgSend(v11, "initWithURL:error:", v12, &v17);
      v14 = v17;

      if (v13)
      {
        pklog_handle_for_category(1);
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          sub_1AF277580(v13);

      }
    }
    v6 = 0;
  }

  return v6;
}

- (id)stringProperty:(int)a3
{
  void *v3;
  uint64_t property;
  void *v5;

  -[PKBundle _bundle](self, "_bundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  property = xpc_bundle_get_property();

  if (property)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", property);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (NSDictionary)infoDictionary
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;

  -[PKBundle _bundle](self, "_bundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_bundle_get_info_dictionary();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    pklog_handle_for_category(1);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1AF27772C(self);

  }
  v6 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  if (!v6)
  {
    pklog_handle_for_category(1);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1AF27769C(self);

  }
  return (NSDictionary *)v6;
}

- (NSString)bundleIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[PKBundle _bundle](self, "_bundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_bundle_get_info_dictionary();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", xpc_dictionary_get_string(v3, "CFBundleIdentifier"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (NSString *)v4;
}

- (NSURL)url
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E98];
  -[PKBundle path](self, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileURLWithPath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v4;
}

- (NSString)path
{
  -[PKBundle stringProperty:](self, "stringProperty:", 2);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSString)supportPath
{
  void *v3;
  void *property;
  NSString *v5;
  NSString *supportPath;

  if (!self->_supportPath)
  {
    -[PKBundle _bundle](self, "_bundle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    property = (void *)xpc_bundle_get_property();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", property);
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    supportPath = self->_supportPath;
    self->_supportPath = v5;

    free(property);
  }
  return self->_supportPath;
}

- (id)bundleDirectory:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PKBundle supportPath](self, "supportPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)executablePath
{
  void *v3;

  -[PKBundle stringProperty:](self, "stringProperty:", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[PKBundle stringProperty:](self, "stringProperty:", 2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v3;
}

- (NSString)plugInsPath
{
  -[PKBundle bundleDirectory:](self, "bundleDirectory:", CFSTR("PlugIns"));
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (OS_xpc_object)_bundle
{
  return (OS_xpc_object *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__bundle, 0);
  objc_storeStrong((id *)&self->_supportPath, 0);
}

@end
