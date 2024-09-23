@implementation SKDiskImageAttachParams

- (SKDiskImageAttachParams)initWithParams:(id)a3
{
  id v5;
  SKDiskImageAttachParams *v6;
  SKDiskImageAttachParams *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SKDiskImageAttachParams;
  v6 = -[SKDiskImageAttachParams init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mountParams, a3);
    -[SKMountParams setForce:](v7->_mountParams, "setForce:", 1);
    -[SKMountParams setRecursive:](v7->_mountParams, "setRecursive:", 1);
    v7->_policy = 2;
    v7->_readOnly = -[SKMountParams readOnly](v7->_mountParams, "readOnly");
    *(_WORD *)&v7->_isManagedAttach = 0;
    -[SKMountParams addObserver:forKeyPath:options:context:](v7->_mountParams, "addObserver:forKeyPath:options:context:", v7, CFSTR("readOnly"), 1, 0);
  }

  return v7;
}

- (void)setReadOnly:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_readOnly = a3;
  -[SKDiskImageAttachParams mountParams](self, "mountParams");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setReadOnly:", v3);

}

- (void)setMountParams:(id)a3
{
  SKMountParams *v4;
  SKMountParams *mountParams;
  SKMountParams *v6;

  v4 = (SKMountParams *)a3;
  -[SKMountParams removeObserver:forKeyPath:](self->_mountParams, "removeObserver:forKeyPath:", self, CFSTR("readOnly"));
  mountParams = self->_mountParams;
  self->_mountParams = v4;
  v6 = v4;

  -[SKMountParams setForce:](self->_mountParams, "setForce:", 1);
  -[SKMountParams setRecursive:](self->_mountParams, "setRecursive:", 1);
  self->_readOnly = -[SKMountParams readOnly](self->_mountParams, "readOnly");
  -[SKMountParams addObserver:forKeyPath:options:context:](self->_mountParams, "addObserver:forKeyPath:options:context:", self, CFSTR("readOnly"), 1, 0);

}

- (void)setPolicy:(int64_t)a3
{
  -[SKMountParams setForce:](self->_mountParams, "setForce:", a3 == 2);
  self->_policy = a3;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8;
  void *v9;
  id v10;

  v10 = a4;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("readOnly")))
  {
    v8 = v10;
    if (v8)
    {
      v9 = v8;
      self->_readOnly = objc_msgSend(v8, "readOnly");

    }
  }

}

- (SKDiskImageAttachParams)init
{
  void *v3;
  SKDiskImageAttachParams *v4;

  v3 = (void *)objc_opt_new();
  v4 = -[SKDiskImageAttachParams initWithParams:](self, "initWithParams:", v3);

  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: { mountParams: \"%@\", readOnly: %d, policy: %ld }>"), v5, self->_mountParams, self->_readOnly, self->_policy);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)diAttachParamsWithURL:(id)a3 error:(id *)a4
{
  objc_class *v6;
  id v7;
  void *v8;
  id v9;

  v6 = (objc_class *)MEMORY[0x24BE2D090];
  v7 = a3;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithURL:error:", v7, a4);

  if (v8)
  {
    -[SKDiskImageAttachParams setupDIAttachParams:](self, "setupDIAttachParams:", v8);
    v9 = v8;
  }

  return v8;
}

- (id)diAttachParamsWithExistingParams:(id)a3 error:(id *)a4
{
  objc_class *v6;
  id v7;
  void *v8;
  id v9;

  v6 = (objc_class *)MEMORY[0x24BE2D090];
  v7 = a3;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithExistingParams:error:", v7, a4);

  if (v8)
  {
    -[SKDiskImageAttachParams setupDIAttachParams:](self, "setupDIAttachParams:", v8);
    v9 = v8;
  }

  return v8;
}

- (void)setupDIAttachParams:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  _BOOL4 v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "setAutoMount:", 0);
  if (-[SKDiskImageAttachParams readOnly](self, "readOnly"))
    v4 = 2;
  else
    v4 = 1;
  objc_msgSend(v9, "setFileMode:", v4);
  if (-[SKDiskImageAttachParams is4KBlockSize](self, "is4KBlockSize"))
    v5 = 4096;
  else
    v5 = 512;
  objc_msgSend(v9, "setRawBlockSize:", v5);
  v6 = -[SKDiskImageAttachParams stdinPassPhrase](self, "stdinPassPhrase");
  v7 = objc_msgSend(v9, "readPassphraseFlags");
  if (v6)
    v8 = v7 | 8;
  else
    v8 = v7;
  objc_msgSend(v9, "setReadPassphraseFlags:", v8);
  if (os_variant_has_internal_content())
    objc_msgSend(v9, "setEmulateExternalDisk:", -[SKDiskImageAttachParams emulateExternalDisk](self, "emulateExternalDisk"));

}

- (int64_t)policy
{
  return self->_policy;
}

- (SKMountParams)mountParams
{
  return self->_mountParams;
}

- (BOOL)readOnly
{
  return self->_readOnly;
}

- (BOOL)stdinPassPhrase
{
  return self->_stdinPassPhrase;
}

- (void)setStdinPassPhrase:(BOOL)a3
{
  self->_stdinPassPhrase = a3;
}

- (BOOL)isManagedAttach
{
  return self->_isManagedAttach;
}

- (void)setIsManagedAttach:(BOOL)a3
{
  self->_isManagedAttach = a3;
}

- (BOOL)is4KBlockSize
{
  return self->_is4KBlockSize;
}

- (void)setIs4KBlockSize:(BOOL)a3
{
  self->_is4KBlockSize = a3;
}

- (BOOL)emulateExternalDisk
{
  return self->_emulateExternalDisk;
}

- (void)setEmulateExternalDisk:(BOOL)a3
{
  self->_emulateExternalDisk = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mountParams, 0);
}

@end
