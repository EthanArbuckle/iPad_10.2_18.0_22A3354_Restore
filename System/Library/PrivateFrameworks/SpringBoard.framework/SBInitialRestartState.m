@implementation SBInitialRestartState

- (NSString)description
{
  return (NSString *)-[SBInitialRestartState descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBInitialRestartState succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBInitialRestartState descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  SBInitialRestartState *v11;

  -[SBInitialRestartState succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __63__SBInitialRestartState_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E8E9E820;
  v5 = v4;
  v10 = v5;
  v11 = self;
  v6 = (id)objc_msgSend(v5, "modifyBody:", v9);
  v7 = v5;

  return v7;
}

void __63__SBInitialRestartState_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(_BYTE *)(*(_QWORD *)(a1 + 40) + 8) == 0, CFSTR("isPasscodeLocked"));
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 10), CFSTR("isBlocked"));
  v4 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 9), CFSTR("isInLostMode"));
  v5 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 11), CFSTR("hasPasscodeSet"));
  v6 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 12), CFSTR("requiresSetup"));
  v7 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 13), CFSTR("shouldNeverLock"));
  v8 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 14), CFSTR("forSimulator"));
  v9 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 15), CFSTR("isLoginSession"));
  v10 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24), CFSTR("bootDefaults"));
  v11 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16));
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v11, "appendObject:withName:", v13, CFSTR("homeButtonType"));

}

- (BOOL)isAuthenticated
{
  return self->_isAuthenticated;
}

- (void)setAuthenticated:(BOOL)a3
{
  self->_isAuthenticated = a3;
}

- (BOOL)isInLostMode
{
  return self->_isInLostMode;
}

- (void)setInLostMode:(BOOL)a3
{
  self->_isInLostMode = a3;
}

- (BOOL)isBlocked
{
  return self->_isBlocked;
}

- (void)setBlocked:(BOOL)a3
{
  self->_isBlocked = a3;
}

- (BOOL)requiresSetup
{
  return self->_requiresSetup;
}

- (void)setRequiresSetup:(BOOL)a3
{
  self->_requiresSetup = a3;
}

- (BOOL)hasPasscodeSet
{
  return self->_hasPasscodeSet;
}

- (void)setHasPasscodeSet:(BOOL)a3
{
  self->_hasPasscodeSet = a3;
}

- (BOOL)shouldNeverLock
{
  return self->_shouldNeverLock;
}

- (void)setShouldNeverLock:(BOOL)a3
{
  self->_shouldNeverLock = a3;
}

- (BOOL)isLoginSession
{
  return self->_isLoginSession;
}

- (void)setLoginSession:(BOOL)a3
{
  self->_isLoginSession = a3;
}

- (SBBootDefaults)bootDefaults
{
  return self->_bootDefaults;
}

- (void)setBootDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_bootDefaults, a3);
}

- (BOOL)isForSimulator
{
  return self->_forSimulator;
}

- (void)setForSimulator:(BOOL)a3
{
  self->_forSimulator = a3;
}

- (int64_t)homeButtonType
{
  return self->_homeButtonType;
}

- (void)setHomeButtonType:(int64_t)a3
{
  self->_homeButtonType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bootDefaults, 0);
}

@end
