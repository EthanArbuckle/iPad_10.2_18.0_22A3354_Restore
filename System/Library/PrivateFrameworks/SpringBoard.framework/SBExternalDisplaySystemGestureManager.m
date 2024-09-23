@implementation SBExternalDisplaySystemGestureManager

- (SBExternalDisplaySystemGestureManager)initWithDisplayIdentity:(id)a3
{
  id v5;
  SBExternalDisplaySystemGestureManager *v6;
  void *v8;
  objc_super v9;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBExternalDisplaySystemGestureManager.m"), 18, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("displayIdentity"));

  }
  v9.receiver = self;
  v9.super_class = (Class)SBExternalDisplaySystemGestureManager;
  v6 = -[SBSystemGestureManager _initWithDisplayIdentity:](&v9, sel__initWithDisplayIdentity_, v5);

  return v6;
}

- (BOOL)_shouldEnableSystemGestureWithType:(unint64_t)a3
{
  BOOL result;
  char v4;

  result = 1;
  v4 = a3 - 12;
  if (a3 - 12 <= 0x38)
  {
    if (((1 << v4) & 0x10106003BE81341) != 0)
      return result;
    if (((1 << v4) & 0x180000000000) != 0)
      return SBFIsChamoisOverflowGestureAvailable();
  }
  if (a3 - 109 > 0x1D || ((1 << (a3 - 109)) & 0x20000003) == 0)
    return 0;
  return result;
}

@end
