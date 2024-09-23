@implementation KTActualLockStateProvider

+ (BOOL)getIsLocked
{
  int v2;

  v2 = MKBGetDeviceLockState(0, a2);
  return v2 != 3 && v2 != 0;
}

- (KTActualLockStateProvider)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)KTActualLockStateProvider;
  return -[KTActualLockStateProvider init](&v3, "init");
}

- (BOOL)queryAKSLocked
{
  void *v2;

  v2 = (void *)objc_opt_class(self, a2);
  return _objc_msgSend(v2, "getIsLocked");
}

- (BOOL)hasBeenUnlocked
{
  int v2;
  int v5;

  v5 = 0;
  v2 = sub_1000C8B94(0, &v5);
  return (v5 & 6) != 0 && v2 == 0;
}

@end
