@implementation SBLockScreenUnlockAndLaunchCaptureApplicationRequest

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBLockScreenUnlockAndLaunchCaptureApplicationRequest;
  v4 = -[SBLockScreenUnlockRequest copyWithZone:](&v7, sel_copyWithZone_, a3);
  -[SBLockScreenUnlockAndLaunchCaptureApplicationRequest launchActions](self, "launchActions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLaunchActions:", v5);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  NSSet *launchActions;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  SBLockScreenUnlockAndLaunchCaptureApplicationRequest *v17;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __64__SBLockScreenUnlockAndLaunchCaptureApplicationRequest_isEqual___block_invoke;
  v15[3] = &unk_1E8E9EA50;
  v7 = v4;
  v16 = v7;
  v17 = self;
  v8 = (id)objc_msgSend(v5, "appendEqualsBlocks:", v15, 0);
  launchActions = self->_launchActions;
  v13[0] = v6;
  v13[1] = 3221225472;
  v13[2] = __64__SBLockScreenUnlockAndLaunchCaptureApplicationRequest_isEqual___block_invoke_2;
  v13[3] = &unk_1E8EA4320;
  v14 = v7;
  v10 = v7;
  v11 = (id)objc_msgSend(v5, "appendObject:counterpart:", launchActions, v13);
  LOBYTE(launchActions) = objc_msgSend(v5, "isEqual");

  return (char)launchActions;
}

id __64__SBLockScreenUnlockAndLaunchCaptureApplicationRequest_isEqual___block_invoke(uint64_t a1)
{
  uint64_t v1;
  objc_super v3;

  v1 = *(_QWORD *)(a1 + 32);
  v3.receiver = *(id *)(a1 + 40);
  v3.super_class = (Class)SBLockScreenUnlockAndLaunchCaptureApplicationRequest;
  return objc_msgSendSuper2(&v3, sel_isEqual_, v1);
}

uint64_t __64__SBLockScreenUnlockAndLaunchCaptureApplicationRequest_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "launchActions");
}

- (id)description
{
  void *v3;
  id v4;
  id v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendSuper");
  v5 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_launchActions, CFSTR("launchActions"), 1);
  objc_msgSend(v3, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  unint64_t v6;
  _QWORD v8[5];

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = 3221225472;
  v8[2] = __60__SBLockScreenUnlockAndLaunchCaptureApplicationRequest_hash__block_invoke;
  v8[3] = &unk_1E8E9EAA0;
  v8[4] = self;
  v8[0] = MEMORY[0x1E0C809B0];
  v4 = (id)objc_msgSend(v3, "appendHashingBlocks:", v8, 0);
  v5 = (id)objc_msgSend(v3, "appendObject:", self->_launchActions);
  v6 = objc_msgSend(v3, "hash");

  return v6;
}

id __60__SBLockScreenUnlockAndLaunchCaptureApplicationRequest_hash__block_invoke(uint64_t a1)
{
  objc_super v2;

  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)SBLockScreenUnlockAndLaunchCaptureApplicationRequest;
  return objc_msgSendSuper2(&v2, sel_hash);
}

- (NSSet)launchActions
{
  return self->_launchActions;
}

- (void)setLaunchActions:(id)a3
{
  objc_storeStrong((id *)&self->_launchActions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_launchActions, 0);
}

@end
