@implementation PAAccessReaderSandboxExtension

- (PAAccessReaderSandboxExtension)initWithToken:(id)a3 forPath:(id)a4 error:(id *)a5
{
  id v8;
  uint64_t v9;
  PAAccessReaderSandboxExtension *v10;

  v8 = a4;
  objc_msgSend(objc_retainAutorelease(a3), "bytes");
  v9 = sandbox_extension_consume();
  if (v9 == -1)
  {
    if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PAErrorDomain"), 7, 0);
      v10 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    self = -[PAAccessReaderSandboxExtension initWithHandle:forRootDirectory:](self, "initWithHandle:forRootDirectory:", v9, v8);
    v10 = self;
  }

  return v10;
}

- (PAAccessReaderSandboxExtension)initWithHandle:(int64_t)a3 forRootDirectory:(id)a4
{
  id v7;
  PAAccessReaderSandboxExtension *v8;
  PAAccessReaderSandboxExtension *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PAAccessReaderSandboxExtension;
  v8 = -[PAAccessReaderSandboxExtension init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_handle = a3;
    objc_storeStrong((id *)&v8->_path, a4);
  }

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  sandbox_extension_release();
  v3.receiver = self;
  v3.super_class = (Class)PAAccessReaderSandboxExtension;
  -[PAAccessReaderSandboxExtension dealloc](&v3, sel_dealloc);
}

- (NSString)path
{
  return self->_path;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
}

@end
