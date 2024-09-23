@implementation PLSandboxedURL

- (void)_initSandboxExtensionToken:(id)a3 consume:(BOOL)a4
{
  _BOOL4 v4;
  NSString *v6;
  NSString *sandboxExtensionToken;

  v4 = a4;
  v6 = (NSString *)objc_msgSend(a3, "copy");
  sandboxExtensionToken = self->_sandboxExtensionToken;
  self->_sandboxExtensionToken = v6;

  if (v4)
    -[PLSandboxedURL _commonPLSandboxedURLInitialize](self, "_commonPLSandboxedURLInitialize");
}

- (PLSandboxedURL)initWithURL:(id)a3 sandboxExtensionToken:(id)a4 consume:(BOOL)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  PLSandboxedURL *v10;
  PLSandboxedURL *v11;
  objc_super v13;

  if (a3)
  {
    v6 = a5;
    v8 = a3;
    -[PLSandboxedURL _initSandboxExtensionToken:consume:](self, "_initSandboxExtensionToken:consume:", a4, v6);
    objc_msgSend(v8, "absoluteString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v13.receiver = self;
    v13.super_class = (Class)PLSandboxedURL;
    v10 = -[PLSandboxedURL initWithString:](&v13, sel_initWithString_, v9);

    self = v10;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)initFileURLWithPath:(id)a3 sandboxExtensionToken:(id)a4 consume:(BOOL)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  PLSandboxedURL *v10;
  objc_super v12;

  if (a3)
  {
    v6 = a5;
    v8 = a3;
    -[PLSandboxedURL _initSandboxExtensionToken:consume:](self, "_initSandboxExtensionToken:consume:", a4, v6);
    v12.receiver = self;
    v12.super_class = (Class)PLSandboxedURL;
    v9 = -[PLSandboxedURL initFileURLWithPath:](&v12, sel_initFileURLWithPath_, v8);

    self = (PLSandboxedURL *)v9;
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)_commonPLSandboxedURLInitialize
{
  if (-[NSString length](self->_sandboxExtensionToken, "length"))
  {
    -[NSString UTF8String](self->_sandboxExtensionToken, "UTF8String");
    self->_sandboxExtensionHandle = sandbox_extension_consume();
  }
}

- (void)dealloc
{
  objc_super v3;

  if ((self->_sandboxExtensionHandle & 0x8000000000000000) == 0)
    sandbox_extension_release();
  v3.receiver = self;
  v3.super_class = (Class)PLSandboxedURL;
  -[PLSandboxedURL dealloc](&v3, sel_dealloc);
}

- (PLSandboxedURL)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  PLSandboxedURL *v6;
  objc_super v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sandboxExtensionToken"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSandboxedURL _initSandboxExtensionToken:consume:](self, "_initSandboxExtensionToken:consume:", v5, 1);

  v8.receiver = self;
  v8.super_class = (Class)PLSandboxedURL;
  v6 = -[PLSandboxedURL initWithCoder:](&v8, sel_initWithCoder_, v4);

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PLSandboxedURL;
  v4 = a3;
  -[PLSandboxedURL encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_sandboxExtensionToken, CFSTR("sandboxExtensionToken"), v5.receiver, v5.super_class);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sandboxExtensionToken, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
