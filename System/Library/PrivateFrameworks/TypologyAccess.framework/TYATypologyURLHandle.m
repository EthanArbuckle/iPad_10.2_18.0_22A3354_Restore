@implementation TYATypologyURLHandle

- (TYATypologyURLHandle)initWithURL:(id)a3 sandboxExtensionToken:(id)a4
{
  id v7;
  id v8;
  TYATypologyURLHandle *v9;
  TYATypologyURLHandle *v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  objc_super v19;
  uint8_t buf[4];
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)TYATypologyURLHandle;
  v9 = -[TYATypologyURLHandle init](&v19, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_url, a3);
    v11 = v8;
    v12 = v11;
    if (v11 && objc_msgSend(v11, "length"))
    {
      v13 = objc_retainAutorelease(v12);
      objc_msgSend(v13, "UTF8String");
      v14 = sandbox_extension_consume();
      TYALog();
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v14 == -1)
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          -[TYATypologyURLHandle initWithURL:sandboxExtensionToken:].cold.1(v13, v16);

        v14 = -1;
      }
      else
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          v17 = objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
          *(_DWORD *)buf = 136380675;
          v21 = v17;
          _os_log_impl(&dword_227147000, v16, OS_LOG_TYPE_INFO, "Sandbox extension (%{private}s) consumed.", buf, 0xCu);
        }

      }
    }
    else
    {
      v14 = 0;
    }

    v10->_handle = v14;
  }

  return v10;
}

- (void)dealloc
{
  int v2;
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = *__error();
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_227147000, a1, OS_LOG_TYPE_ERROR, "Error releasing sandbox extension: %d", (uint8_t *)v3, 8u);
}

- (NSString)filename
{
  void *v2;
  void *v3;

  -[TYATypologyURLHandle url](self, "url");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)valid
{
  return self->_handle != -1;
}

- (NSURL)url
{
  return self->_url;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
}

- (void)initWithURL:(void *)a1 sandboxExtensionToken:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v3;
  int v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = objc_msgSend(objc_retainAutorelease(a1), "UTF8String");
  v4 = *__error();
  v5 = 136380931;
  v6 = v3;
  v7 = 1024;
  v8 = v4;
  _os_log_error_impl(&dword_227147000, a2, OS_LOG_TYPE_ERROR, "Error consuming (%{private}s) sandbox extension: %d", (uint8_t *)&v5, 0x12u);
}

@end
