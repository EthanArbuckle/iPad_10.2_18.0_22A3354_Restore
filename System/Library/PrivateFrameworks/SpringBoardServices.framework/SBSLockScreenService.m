@implementation SBSLockScreenService

- (SBSLockScreenService)init
{
  SBSLockScreenService *v2;
  SBSLockScreenService *v3;
  uint64_t v4;
  SBSLockScreenServiceConnection *lock_connection;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBSLockScreenService;
  v2 = -[SBSLockScreenService init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = objc_opt_new();
    lock_connection = v3->_lock_connection;
    v3->_lock_connection = (SBSLockScreenServiceConnection *)v4;

  }
  return v3;
}

- (void)dealloc
{
  void *v4;
  objc_super v5;

  if (self->_lock_connection)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSLockScreenService.m"), 229, CFSTR("invalidate not called before dealloc"));

  }
  v5.receiver = self;
  v5.super_class = (Class)SBSLockScreenService;
  -[SBSLockScreenService dealloc](&v5, sel_dealloc);
}

- (void)invalidate
{
  os_unfair_lock_s *p_lock;
  SBSLockScreenServiceConnection *lock_connection;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_connection = self->_lock_connection;
  self->_lock_connection = 0;

  os_unfair_lock_unlock(p_lock);
}

- (void)launchEmergencyDialerWithCompletion:(id)a3
{
  SBSLockScreenServiceConnection *v5;
  void *v6;
  id v7;

  v7 = a3;
  os_unfair_lock_lock(&self->_lock);
  v5 = self->_lock_connection;
  os_unfair_lock_unlock(&self->_lock);
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSLockScreenService.m"), 245, CFSTR("called launchEmergencyDialerWithCompletion: after invalidation"));

  }
  -[SBSLockScreenServiceConnection launchEmergencyDialerWithCompletion:](v5, "launchEmergencyDialerWithCompletion:", v7);

}

- (void)requestPasscodeUnlockUIWithOptions:(id)a3 withCompletion:(id)a4
{
  id v7;
  SBSLockScreenServiceConnection *v8;
  void *v9;
  id v10;

  v10 = a3;
  v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  v8 = self->_lock_connection;
  os_unfair_lock_unlock(&self->_lock);
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSLockScreenService.m"), 254, CFSTR("called requestPasscodeUnlockUIWithOptions:withCompletion: after invalidation"));

  }
  -[SBSLockScreenServiceConnection requestPasscodeUnlockUIWithOptions:withCompletion:](v8, "requestPasscodeUnlockUIWithOptions:withCompletion:", v10, v7);

}

- (void)requestPasscodeCheckUIWithOptions:(id)a3 withCompletion:(id)a4
{
  id v7;
  SBSLockScreenServiceConnection *v8;
  void *v9;
  id v10;

  v10 = a3;
  v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  v8 = self->_lock_connection;
  os_unfair_lock_unlock(&self->_lock);
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSLockScreenService.m"), 263, CFSTR("called requestPasscodeCheckUIWithOptions:withCompletion: after invalidation"));

  }
  -[SBSLockScreenServiceConnection requestPasscodeCheckUIWithOptions:withCompletion:](v8, "requestPasscodeCheckUIWithOptions:withCompletion:", v10, v7);

}

- (id)preventPasscodeLockWithReason:(id)a3
{
  id v5;
  SBSLockScreenServiceConnection *v6;
  void *v7;
  void *v8;
  void *v10;

  v5 = a3;
  os_unfair_lock_lock(&self->_lock);
  v6 = self->_lock_connection;
  os_unfair_lock_unlock(&self->_lock);
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSLockScreenService.m"), 272, CFSTR("called preventPasscodeLockWithReason: after invalidation"));

  }
  v7 = (void *)objc_msgSend(v5, "copy");
  -[SBSLockScreenServiceConnection preventPasscodeLockWithReason:](v6, "preventPasscodeLockWithReason:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)preventSpuriousScreenUndimWithReason:(id)a3
{
  id v5;
  SBSLockScreenServiceConnection *v6;
  void *v7;
  void *v8;
  void *v10;

  v5 = a3;
  os_unfair_lock_lock(&self->_lock);
  v6 = self->_lock_connection;
  os_unfair_lock_unlock(&self->_lock);
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSLockScreenService.m"), 281, CFSTR("called preventSpuriousScreenUndimWithReason: after invalidation"));

  }
  v7 = (void *)objc_msgSend(v5, "copy");
  -[SBSLockScreenServiceConnection preventSpuriousScreenUndimWithReason:](v6, "preventSpuriousScreenUndimWithReason:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)lockDeviceAnimated:(BOOL)a3 withCompletion:(id)a4
{
  _BOOL8 v4;
  SBSLockScreenServiceConnection *v7;
  void *v8;
  id v9;

  v4 = a3;
  v9 = a4;
  os_unfair_lock_lock(&self->_lock);
  v7 = self->_lock_connection;
  os_unfair_lock_unlock(&self->_lock);
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSLockScreenService.m"), 290, CFSTR("called lockDeviceAnimated:withCompletion: after invalidation"));

  }
  -[SBSLockScreenServiceConnection lockDeviceAnimated:withCompletion:](v7, "lockDeviceAnimated:withCompletion:", v4, v9);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_connection, 0);
}

@end
