@implementation SBContinuityLockStateProvider

- (BOOL)isUILocked
{
  return 0;
}

- (void)addLockStateObserver:(id)a3
{
  id v5;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBContinuityLockStateProvider.m"), 22, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("observer"));

  }
}

- (void)removeLockStateObserver:(id)a3
{
  id v5;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBContinuityLockStateProvider.m"), 27, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("observer"));

  }
}

@end
