@implementation _PGBackgroundPIPServiceConnectionTarget

- (_PGBackgroundPIPServiceConnectionTarget)initWithConnection:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  _PGBackgroundPIPServiceConnectionTarget *v9;
  _PGBackgroundPIPServiceConnectionTarget *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_PGBackgroundPIPServiceConnectionTarget;
  v9 = -[_PGBackgroundPIPServiceConnectionTarget init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_connection, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
    v10->_lock._os_unfair_lock_opaque = 0;
  }

  return v10;
}

- (NSString)activitySessionIdentifier
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_lock_activitySessionIdentifier;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSString)bundleIdentifier
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_lock_bundleIdentifier;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (int64_t)state
{
  os_unfair_lock_s *p_lock;
  int64_t lock_state;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_state = self->_lock_state;
  os_unfair_lock_unlock(p_lock);
  return lock_state;
}

- (void)transitionToStateIfPossible:(int64_t)a3
{
  NSObject *v5;
  void *v6;
  int64_t lock_state;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  _PGBackgroundPIPServiceConnectionTarget *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  PGLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromPGBackgroundPIPAuthorizationState(a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 136315650;
    v13 = "-[_PGBackgroundPIPServiceConnectionTarget transitionToStateIfPossible:]";
    v14 = 2114;
    v15 = v6;
    v16 = 2114;
    v17 = self;
    _os_log_impl(&dword_1B0CD6000, v5, OS_LOG_TYPE_DEFAULT, "%s requestedState: %{public}@ for %{public}@", (uint8_t *)&v12, 0x20u);

  }
  os_unfair_lock_lock(&self->_lock);
  lock_state = self->_lock_state;
  if (lock_state >= a3)
  {
    os_unfair_lock_unlock(&self->_lock);
    if (lock_state <= a3)
      return;
    PGLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromPGBackgroundPIPAuthorizationState(a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 136315650;
      v13 = "-[_PGBackgroundPIPServiceConnectionTarget transitionToStateIfPossible:]";
      v14 = 2114;
      v15 = v9;
      v16 = 2114;
      v17 = self;
      _os_log_impl(&dword_1B0CD6000, v8, OS_LOG_TYPE_DEFAULT, "%s Refusing requestedState: %{public}@ for %{public}@", (uint8_t *)&v12, 0x20u);

    }
  }
  else
  {
    self->_lock_state = a3;
    os_unfair_lock_unlock(&self->_lock);
    if (a3 == 5)
    {
      if (-[_PGBackgroundPIPServiceConnectionTarget isConnectionActive](self, "isConnectionActive"))
        -[BSServiceConnection invalidate](self->_connection, "invalidate");
      -[_PGBackgroundPIPServiceConnectionTarget delegate](self, "delegate");
      v8 = objc_claimAutoreleasedReturnValue();
      -[NSObject backgroundPIPTargetDidInvalidate:](v8, "backgroundPIPTargetDidInvalidate:", self);
    }
    else
    {
      -[BSServiceConnection remoteTarget](self->_connection, "remoteTarget");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "transitionToState:", v11);

      if (a3 != 1)
        return;
      -[_PGBackgroundPIPServiceConnectionTarget delegate](self, "delegate");
      v8 = objc_claimAutoreleasedReturnValue();
      -[NSObject backgroundPIPTargetRequestsAuthorization:](v8, "backgroundPIPTargetRequestsAuthorization:", self);
    }
  }

}

- (BOOL)isConnectionActive
{
  void *v2;
  BOOL v3;

  -[BSServiceConnection remoteTarget](self->_connection, "remoteTarget");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)grantAuthorizationForActivitySessionWithIdentifier:(id)a3 bundleIdentifier:(id)a4
{
  id v7;
  id v8;

  v8 = a3;
  v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_state)
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    objc_storeStrong((id *)&self->_lock_activitySessionIdentifier, a3);
    objc_storeStrong((id *)&self->_lock_bundleIdentifier, a4);
    os_unfair_lock_unlock(&self->_lock);
    -[_PGBackgroundPIPServiceConnectionTarget transitionToStateIfPossible:](self, "transitionToStateIfPossible:", 1);
  }

}

- (void)revokeAuthorization
{
  -[_PGBackgroundPIPServiceConnectionTarget transitionToStateIfPossible:](self, "transitionToStateIfPossible:", 5);
}

- (void)invalidate
{
  -[_PGBackgroundPIPServiceConnectionTarget transitionToStateIfPossible:](self, "transitionToStateIfPossible:", 5);
}

- (NSString)description
{
  os_unfair_lock_s *p_lock;
  unint64_t lock_state;
  NSString *v5;
  void *v6;
  NSString *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_state = self->_lock_state;
  v5 = self->_lock_activitySessionIdentifier;
  NSStringFromPGBackgroundPIPAuthorizationState(lock_state);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = self->_lock_bundleIdentifier;
  os_unfair_lock_unlock(p_lock);
  v8 = (void *)MEMORY[0x1E0CB3940];
  v12.receiver = self;
  v12.super_class = (Class)_PGBackgroundPIPServiceConnectionTarget;
  -[_PGBackgroundPIPServiceConnectionTarget description](&v12, sel_description);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@ cxn: %@ activitySessionIdentifier: %@ bundleId: %@ state: %@"), v9, self->_connection, v5, v7, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (_PGBackgroundPIPServiceConnectionTargetDelegate)delegate
{
  return (_PGBackgroundPIPServiceConnectionTargetDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_lock_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_lock_activitySessionIdentifier, 0);
}

@end
