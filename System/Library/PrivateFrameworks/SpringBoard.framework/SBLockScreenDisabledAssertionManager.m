@implementation SBLockScreenDisabledAssertionManager

- (SBLockScreenDisabledAssertionManager)init
{
  SBLockScreenDisabledAssertionManager *v2;
  NSMutableSet *v3;
  NSMutableSet *disableLockScreenIfPossibleAssertions;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBLockScreenDisabledAssertionManager;
  v2 = -[SBLockScreenDisabledAssertionManager init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    disableLockScreenIfPossibleAssertions = v2->_disableLockScreenIfPossibleAssertions;
    v2->_disableLockScreenIfPossibleAssertions = v3;

  }
  return v2;
}

- (NSString)description
{
  void *v3;
  id v4;
  id v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendBool:withName:", -[SBLockScreenDisabledAssertionManager isLockScreenDisabledForAssertion](self, "isLockScreenDisabledForAssertion"), CFSTR("lockScreenDisabled"));
  if (-[NSMutableSet count](self->_disableLockScreenIfPossibleAssertions, "count"))
    v5 = (id)objc_msgSend(v3, "appendObject:withName:", self->_disableLockScreenIfPossibleAssertions, CFSTR("assertions"));
  objc_msgSend(v3, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (void)addLockScreenDisableAssertion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_INFO, "Adding lock screen disable assertion %@", (uint8_t *)&v7, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithNonretainedObject:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet addObject:](self->_disableLockScreenIfPossibleAssertions, "addObject:", v6);

}

- (void)removeLockScreenDisableAssertion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_INFO, "Removing lock screen disable assertion %@", (uint8_t *)&v7, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithNonretainedObject:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet removeObject:](self->_disableLockScreenIfPossibleAssertions, "removeObject:", v6);

}

- (BOOL)isLockScreenDisabledForAssertion
{
  return -[NSMutableSet count](self->_disableLockScreenIfPossibleAssertions, "count") != 0;
}

- (BOOL)shouldAutoUnlockForSource:(int)a3
{
  void *v4;
  BOOL v5;

  +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance", *(_QWORD *)&a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isLockScreenActive"))
    v5 = -[SBLockScreenDisabledAssertionManager isLockScreenDisabledForAssertion](self, "isLockScreenDisabledForAssertion");
  else
    v5 = 0;

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disableLockScreenIfPossibleAssertions, 0);
}

@end
