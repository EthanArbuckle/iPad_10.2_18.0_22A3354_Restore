@implementation DiskImageParamsLocked_XPC

- (DiskImageParamsLocked_XPC)initWithBackendXPC:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)DiskImageParamsLocked_XPC;
  return -[DiskImageParamsXPC initWithBackendXPC:](&v4, "initWithBackendXPC:", a3);
}

- (id)newWithPassphrase:(const char *)a3 error:(id *)a4
{
  void *v7;
  id v8;
  id v9;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageParamsXPC backendXPC](self, "backendXPC"));
  v8 = objc_msgSend(v7, "newUnlockedBackendXPCWithPassphrase:certificate:isNewImage:error:", a3, 0, 0, a4);

  if (!v8)
    return 0;
  v9 = +[DiskImageParamsXPC newWithUnlockedBackendXPC:error:](DiskImageParamsXPC, "newWithUnlockedBackendXPC:error:", v8, a4);
  if (v9)
    objc_msgSend(v9, "setBlockSize:", -[DiskImageParamsXPC blockSize](self, "blockSize"));

  return v9;
}

- (unique_ptr<const)getImageInfoWithExtra:(BOOL)a3 error:(id *)a4
{
  objc_msgSend((id)objc_claimAutoreleasedReturnValue(-[DiskImageParamsXPC backendXPC](self, "backendXPC", a3, a4)), "cryptoHeader");
  operator new();
}

@end
