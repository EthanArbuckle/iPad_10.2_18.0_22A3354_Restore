@implementation MetalDeviceInfo

+ (id)sharedInfo
{
  id v2;
  uint64_t v3;
  void *v4;
  objc_super v6;

  v2 = a1;
  objc_sync_enter(v2);
  if (!sharedDeviceInfo)
  {
    v6.receiver = v2;
    v6.super_class = (Class)&OBJC_METACLASS___MetalDeviceInfo;
    v3 = objc_msgSend(objc_msgSendSuper2(&v6, sel_alloc), "init");
    v4 = (void *)sharedDeviceInfo;
    sharedDeviceInfo = v3;

  }
  objc_sync_exit(v2);

  return (id)sharedDeviceInfo;
}

- (unint64_t)defaultStorageModeForDevice:(id)a3
{
  return 0;
}

- (unint64_t)defaultResourceOptionForDevice:(id)a3
{
  return 0;
}

- (BOOL)supportXR10ForDevice:(id)a3
{
  return 1;
}

- (BOOL)supportXR10
{
  return 1;
}

@end
