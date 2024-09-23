@implementation SBSAccidentalActivationMitigationClientSession

- (SBSAccidentalActivationMitigationClientSession)initWithBundleIdentifier:(id)a3
{
  return -[SBSAccidentalActivationMitigationClientSession initWithBundleIdentifier:callOutQueue:](self, "initWithBundleIdentifier:callOutQueue:", a3, MEMORY[0x1E0C80D38]);
}

- (SBSAccidentalActivationMitigationClientSession)initWithBundleIdentifier:(id)a3 callOutQueue:(id)a4
{
  id v7;
  id v8;
  SBSAccidentalActivationMitigationClientSession *v9;
  SBSAccidentalActivationMitigationClientSession *v10;
  SBSAccidentalActivationMitigationSessionServiceClient *v11;
  SBSAccidentalActivationMitigationSessionServiceClient *client;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SBSAccidentalActivationMitigationClientSession;
  v9 = -[SBSAccidentalActivationMitigationClientSession init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_lock._os_unfair_lock_opaque = 0;
    v11 = objc_alloc_init(SBSAccidentalActivationMitigationSessionServiceClient);
    client = v10->_client;
    v10->_client = v11;

    -[SBSAccidentalActivationMitigationSessionServiceClient setDelegate:](v10->_client, "setDelegate:", v10);
    objc_storeStrong((id *)&v10->_bundleIdentifier, a3);
    objc_storeStrong((id *)&v10->_callOutQueue, a4);
  }

  return v10;
}

- (void)addObserver:(id)a3
{
  void *v4;
  BOOL v5;
  NSHashTable *observers;
  NSHashTable *v7;
  NSHashTable *v8;
  id v9;

  v9 = a3;
  BSDispatchQueueAssert();
  v4 = v9;
  if (v9)
  {
    v5 = -[NSHashTable containsObject:](self->_observers, "containsObject:", v9);
    v4 = v9;
    if (!v5)
    {
      observers = self->_observers;
      if (!observers)
      {
        objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
        v7 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
        v8 = self->_observers;
        self->_observers = v7;

        observers = self->_observers;
      }
      -[NSHashTable addObject:](observers, "addObject:", v9);
      v4 = v9;
    }
  }

}

- (void)removeObserver:(id)a3
{
  NSHashTable *observers;
  id v5;

  v5 = a3;
  BSDispatchQueueAssert();
  if (v5)
    -[NSHashTable removeObject:](self->_observers, "removeObject:", v5);
  if (!-[NSHashTable count](self->_observers, "count"))
  {
    observers = self->_observers;
    self->_observers = 0;

  }
}

- (void)activateSessionWithDuration:(double)a3 accidentalActivationMitigationSessionCancellationPolicyClassName:(id)a4
{
  id v6;
  NSObject *v7;
  int v8;
  SBSAccidentalActivationMitigationClientSession *v9;
  __int16 v10;
  double v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  BSDispatchQueueAssert();
  SBLogCameraCaptureAccidentalActivationMitigationSession();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412802;
    v9 = self;
    v10 = 2048;
    v11 = a3;
    v12 = 2112;
    v13 = v6;
    _os_log_impl(&dword_18EB52000, v7, OS_LOG_TYPE_DEFAULT, "%@ activated session with duration: %f and cancellation policy: %@", (uint8_t *)&v8, 0x20u);
  }

  -[SBSAccidentalActivationMitigationSessionServiceClient activateSessionForBundleIdentifier:duration:accidentalActivationMitigationSessionCancellationPolicyClassName:](self->_client, "activateSessionForBundleIdentifier:duration:accidentalActivationMitigationSessionCancellationPolicyClassName:", self->_bundleIdentifier, v6, a3);
}

- (void)requestSessionCancellation
{
  NSObject *v3;
  NSObject *v4;
  int v5;
  SBSAccidentalActivationMitigationClientSession *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  BSDispatchQueueAssert();
  SBLogCameraCaptureAccidentalActivationMitigationSession();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = self;
    _os_log_impl(&dword_18EB52000, v3, OS_LOG_TYPE_DEFAULT, "%@ requested session cancellation", (uint8_t *)&v5, 0xCu);
  }

  if (-[SBSAccidentalActivationMitigationClientSession state](self, "state") == 1)
  {
    -[SBSAccidentalActivationMitigationSessionServiceClient requestSessionCancellation](self->_client, "requestSessionCancellation");
  }
  else
  {
    SBLogCameraCaptureAccidentalActivationMitigationSession();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 138412290;
      v6 = self;
      _os_log_impl(&dword_18EB52000, v4, OS_LOG_TYPE_DEFAULT, "%@ is not able to cancel the session because it is not active", (uint8_t *)&v5, 0xCu);
    }

  }
}

- (void)setState:(int64_t)a3
{
  os_unfair_lock_s *p_lock;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *callOutQueue;
  _QWORD v14[6];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_state == a3)
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    self->_lock_state = a3;
    os_unfair_lock_unlock(p_lock);
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = (void *)-[NSHashTable copy](self->_observers, "copy");
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      v10 = MEMORY[0x1E0C809B0];
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          v12 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v11);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            callOutQueue = self->_callOutQueue;
            v14[0] = v10;
            v14[1] = 3221225472;
            v14[2] = __59__SBSAccidentalActivationMitigationClientSession_setState___block_invoke;
            v14[3] = &unk_1E288D940;
            v14[4] = v12;
            v14[5] = self;
            dispatch_async(callOutQueue, v14);
          }
          ++v11;
        }
        while (v8 != v11);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v8);
    }

  }
}

uint64_t __59__SBSAccidentalActivationMitigationClientSession_setState___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accidentalActivationMitigationSessionStateDidChange:", *(_QWORD *)(a1 + 40));
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

- (void)mitigationSessionServiceClient:(id)a3 mitigationSessionDidTransitionToState:(int64_t)a4
{
  BSDispatchQueueAssertMain();
  -[SBSAccidentalActivationMitigationClientSession setState:](self, "setState:", a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_callOutQueue, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_client, 0);
}

@end
