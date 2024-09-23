@implementation STUDeviceLockProvider_iOS

- (STUDeviceLockProvider_iOS)init
{
  STUDeviceLockProvider_iOS *v2;
  STULockStatePropertyProvider_iOS *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STUDeviceLockProvider_iOS;
  v2 = -[STUDeviceLockProvider init](&v5, "init");
  if (v2)
  {
    v3 = objc_opt_new(STULockStatePropertyProvider_iOS);
    -[STULockStatePropertyProvider setDelegate:](v3, "setDelegate:", v2);
    -[STUDeviceLockProvider setBackingLockStateProvider:](v2, "setBackingLockStateProvider:", v3);

  }
  return v2;
}

@end
