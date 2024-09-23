@implementation SBAccidentalActivationMitigationSessionCoordinator

- (SBAccidentalActivationMitigationSessionCoordinator)initWithSuppressionManager:(id)a3 backlightController:(id)a4
{
  id v7;
  id v8;
  SBAccidentalActivationMitigationSessionCoordinator *v9;
  SBAccidentalActivationMitigationSessionCoordinator *v10;
  uint64_t v11;
  SBSAccidentalActivationMitigationSessionServiceServer *server;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SBAccidentalActivationMitigationSessionCoordinator;
  v9 = -[SBAccidentalActivationMitigationSessionCoordinator init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v9->_suppressionManager, a3);
    objc_storeStrong((id *)&v10->_backlightController, a4);
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0DAAD58]), "initWithDelegate:", v10);
    server = v10->_server;
    v10->_server = (SBSAccidentalActivationMitigationSessionServiceServer *)v11;

    -[SBSAccidentalActivationMitigationSessionServiceServer startServer](v10->_server, "startServer");
  }

  return v10;
}

- (void)addObserver:(id)a3
{
  id v4;
  BOOL v5;
  NSHashTable *observers;
  NSHashTable *v7;
  NSHashTable *v8;
  id v9;

  v4 = a3;
  if (v4)
  {
    v9 = v4;
    v5 = -[NSHashTable containsObject:](self->_observers, "containsObject:", v4);
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
  if (v5)
    -[NSHashTable removeObject:](self->_observers, "removeObject:", v5);
  if (!-[NSHashTable count](self->_observers, "count"))
  {
    observers = self->_observers;
    self->_observers = 0;

  }
}

- (BOOL)hasIdleTimerBehaviors
{
  void *v2;
  BOOL v3;

  -[SBAccidentalActivationMitigationSessionCoordinator hostSession](self, "hostSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "state") == 1;

  return v3;
}

- (SBAccidentalActivationMitigationHostSession)hostSession
{
  os_unfair_lock_s *p_lock;
  SBAccidentalActivationMitigationHostSession *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_lock_host_session;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setHostSession:(id)a3
{
  void *v5;
  char v6;
  id v7;

  v7 = a3;
  -[SBAccidentalActivationMitigationSessionCoordinator hostSession](self, "hostSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = BSEqualObjects();

  if ((v6 & 1) == 0)
  {
    os_unfair_lock_lock(&self->_lock);
    objc_storeStrong((id *)&self->_lock_host_session, a3);
    os_unfair_lock_unlock(&self->_lock);
  }

}

- (void)_publishDidStartMitigationSession:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "accidentalActivationMitigationSessionCoordinator:didStartMitigationSession:", self, v4);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)_publishDidCancelMitigationSession:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "accidentalActivationMitigationSessionCoordinator:didCancelMitigationSession:", self, v4);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)_publishDidMitigateMitigationSession:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "accidentalActivationMitigationSessionCoordinator:didMitigateMitigationSession:", self, v4);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)hostSessionDidRequestStartMitigation:(id)a3 outIdleTimer:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  SBAccidentalActivationMitigationSessionCoordinator *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  BSDispatchQueueAssertMain();
  SBLogCameraCaptureAccidentalActivationMitigationSession();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412546;
    v11 = self;
    v12 = 2112;
    v13 = v6;
    _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "%@ for session %@ requested start camera capture mitigation", (uint8_t *)&v10, 0x16u);
  }

  -[SBBacklightController addObserver:](self->_backlightController, "addObserver:", self);
  +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAccidentalActivationMitigationSessionCoordinator coordinatorRequestedIdleTimerBehavior:](self, "coordinatorRequestedIdleTimerBehavior:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "idleTimerProvider:didProposeBehavior:forReason:", self, v9, CFSTR("SBAccidentalActivationMitigationSessionActiveReason"));
  *a4 = (id)objc_claimAutoreleasedReturnValue();
  -[SBAccidentalActivationMitigationSessionCoordinator _publishDidStartMitigationSession:](self, "_publishDidStartMitigationSession:", v6);

}

- (void)hostSessionDidRequestCancelMitigation:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  SBAccidentalActivationMitigationSessionCoordinator *v12;
  id v13;
  uint8_t buf[4];
  SBAccidentalActivationMitigationSessionCoordinator *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  BSDispatchQueueAssertMain();
  SBLogCameraCaptureAccidentalActivationMitigationSession();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v15 = self;
    v16 = 2112;
    v17 = v4;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "%@ for session %@ requested camera capture mitigation cancellation", buf, 0x16u);
  }

  +[SBIdleTimerGlobalCoordinator sharedInstance](SBIdleTimerGlobalCoordinator, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resetIdleTimerForReason:", CFSTR("SBAccidentalActivationMitigationSessionCancelledReason"));

  objc_initWeak((id *)buf, self);
  +[SBMainSwitcherControllerCoordinator sharedInstance](SBMainSwitcherControllerCoordinator, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __92__SBAccidentalActivationMitigationSessionCoordinator_hostSessionDidRequestCancelMitigation___block_invoke;
  v11 = &unk_1E8E9F280;
  objc_copyWeak(&v13, (id *)buf);
  v12 = self;
  objc_msgSend(v7, "configureSwitcherStateForAccidentalActivationMitigationSession:completion:", v4, &v8);

  -[SBAccidentalActivationMitigationSessionCoordinator _publishDidCancelMitigationSession:](self, "_publishDidCancelMitigationSession:", v4, v8, v9, v10, v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);

}

void __92__SBAccidentalActivationMitigationSessionCoordinator_hostSessionDidRequestCancelMitigation___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObserver:", WeakRetained);

}

- (void)hostSessionDidRequestMitigateAccidentalActivation:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  SBAccidentalActivationMitigationSessionCoordinator *v16;
  id v17;
  _QWORD v18[5];
  id v19;
  uint8_t buf[4];
  SBAccidentalActivationMitigationSessionCoordinator *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  BSDispatchQueueAssertMain();
  SBLogCameraCaptureAccidentalActivationMitigationSession();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v21 = self;
    v22 = 2112;
    v23 = v4;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "%@ for session %@ requested camera capture mitigation", buf, 0x16u);
  }

  if (objc_msgSend(v4, "mitigatedEarly"))
  {
    +[SBIdleTimerGlobalCoordinator sharedInstance](SBIdleTimerGlobalCoordinator, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "resetIdleTimerForReason:", CFSTR("SBAccidentalActivationMitigationSessionMitigatedReason"));

  }
  +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isUILocked");

  objc_initWeak((id *)buf, self);
  if (v8)
  {
    +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "coverSheetViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __104__SBAccidentalActivationMitigationSessionCoordinator_hostSessionDidRequestMitigateAccidentalActivation___block_invoke;
    v18[3] = &unk_1E8E9F280;
    objc_copyWeak(&v19, (id *)buf);
    v18[4] = self;
    objc_msgSend(v10, "activateMainPageWithCompletion:", v18);

    objc_destroyWeak(&v19);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    +[SBMainSwitcherControllerCoordinator sharedInstance](SBMainSwitcherControllerCoordinator, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __104__SBAccidentalActivationMitigationSessionCoordinator_hostSessionDidRequestMitigateAccidentalActivation___block_invoke_2;
    v15 = &unk_1E8E9F280;
    objc_copyWeak(&v17, (id *)buf);
    v16 = self;
    objc_msgSend(v11, "configureSwitcherStateForAccidentalActivationMitigationSession:completion:", v4, &v12);

    objc_destroyWeak(&v17);
    objc_destroyWeak((id *)buf);
  }
  -[SBAccidentalActivationMitigationSessionCoordinator _publishDidMitigateMitigationSession:](self, "_publishDidMitigateMitigationSession:", v4, v12, v13, v14, v15);

}

void __104__SBAccidentalActivationMitigationSessionCoordinator_hostSessionDidRequestMitigateAccidentalActivation___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObserver:", WeakRetained);

}

void __104__SBAccidentalActivationMitigationSessionCoordinator_hostSessionDidRequestMitigateAccidentalActivation___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObserver:", WeakRetained);

}

- (id)serverDidRequestCreateHostSessionUponConnection:(id)a3
{
  id v4;
  SBAccidentalActivationMitigationHostSession *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v11;
  SBAccidentalActivationMitigationSessionCoordinator *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  BSDispatchQueueAssertMain();
  v5 = -[SBAccidentalActivationMitigationHostSession initWithSuppressionManager:]([SBAccidentalActivationMitigationHostSession alloc], "initWithSuppressionManager:", self->_suppressionManager);
  -[SBAccidentalActivationMitigationSessionCoordinator setHostSession:](self, "setHostSession:", v5);
  -[SBAccidentalActivationMitigationSessionCoordinator hostSession](self, "hostSession");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", self);

  -[SBAccidentalActivationMitigationSessionCoordinator hostSession](self, "hostSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:", self);

  SBLogCameraCaptureAccidentalActivationMitigationSession();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[SBAccidentalActivationMitigationSessionCoordinator hostSession](self, "hostSession");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 134218498;
    v12 = self;
    v13 = 2112;
    v14 = v9;
    v15 = 2112;
    v16 = v4;
    _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "%p created host session %@ from server %@", (uint8_t *)&v11, 0x20u);

  }
  return v5;
}

- (void)serverDidRequestDestroyNonActiveHostSessionUponDisconnection:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  SBAccidentalActivationMitigationSessionCoordinator *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  BSDispatchQueueAssertMain();
  SBLogCameraCaptureAccidentalActivationMitigationSession();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[SBAccidentalActivationMitigationSessionCoordinator hostSession](self, "hostSession");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 134218498;
    v9 = self;
    v10 = 2112;
    v11 = v6;
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "%p requested destruction of non-active host session %@ from server %@", (uint8_t *)&v8, 0x20u);

  }
  -[SBAccidentalActivationMitigationSessionCoordinator hostSession](self, "hostSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObserver:", self);

  -[SBAccidentalActivationMitigationSessionCoordinator setHostSession:](self, "setHostSession:", 0);
}

- (void)accidentalActivationMitigationSessionStateDidChange:(id)a3
{
  if ((objc_msgSend(a3, "state") & 0xFFFFFFFFFFFFFFFELL) == 2)
    -[SBAccidentalActivationMitigationSessionCoordinator setHostSession:](self, "setHostSession:", 0);
}

- (id)coordinatorRequestedIdleTimerBehavior:(id)a3
{
  return +[SBIdleTimerBehavior behaviorWithDuration:mode:warnMode:](SBIdleTimerBehavior, "behaviorWithDuration:mode:warnMode:", 3, 2, 2);
}

- (void)backlightController:(id)a3 willTransitionToBacklightState:(int64_t)a4 source:(int64_t)a5
{
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[SBAccidentalActivationMitigationSessionCoordinator hostSession](self, "hostSession", a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "state");

  if (a4 == 1 && v8 == 1)
  {
    SBLogCameraCaptureAccidentalActivationMitigationSession();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      -[SBAccidentalActivationMitigationSessionCoordinator hostSession](self, "hostSession");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412290;
      v13 = v10;
      _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "SBAccidentalActivationMitigationSessionCoordinator mitigated session: %@ early for reason: backlight turned on", (uint8_t *)&v12, 0xCu);

    }
    -[SBAccidentalActivationMitigationSessionCoordinator hostSession](self, "hostSession");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "requestSessionMitigateEarly");

  }
}

- (void)setHasIdleTimerBehaviors:(BOOL)a3
{
  self->_hasIdleTimerBehaviors = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_host_session, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_backlightController, 0);
  objc_storeStrong((id *)&self->_suppressionManager, 0);
  objc_storeStrong((id *)&self->_server, 0);
}

@end
