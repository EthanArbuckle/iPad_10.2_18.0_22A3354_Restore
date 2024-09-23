@implementation UIViewServiceSessionManager

void __71___UIViewServiceSessionManager_startViewServiceSessionManagerAsPlugin___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;

  _UIMainBundleIdentifier();
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = -[_UIViewServiceSessionManager _initAsPlugIn:]([_UIViewServiceSessionManager alloc], "_initAsPlugIn:", *(unsigned __int8 *)(a1 + 32));
    v4 = (void *)__viewServiceSessionManager;
    __viewServiceSessionManager = (uint64_t)v3;

  }
}

void __68___UIViewServiceSessionManager_startViewServiceSessionWithDelegate___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;

  _UIMainBundleIdentifier();
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = -[_UIViewServiceSessionManager _initWithDelegate:]([_UIViewServiceSessionManager alloc], "_initWithDelegate:", *(_QWORD *)(a1 + 32));
    v4 = (void *)__viewServiceSessionManager;
    __viewServiceSessionManager = (uint64_t)v3;

  }
}

uint64_t __50___UIViewServiceSessionManager__initWithDelegate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startListener");
}

uint64_t __46___UIViewServiceSessionManager__initAsPlugIn___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startListener");
}

void __67___UIViewServiceSessionManager__registerSessionForDefaultDeputies___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, _OWORD *a5, void *a6)
{
  id *v10;
  void (**v11)(id, void *);
  id v12;
  id v13;
  id WeakRetained;
  void *v15;
  __int128 v16;
  void *v17;
  _OWORD v18[2];

  v10 = (id *)(a1 + 32);
  v11 = a6;
  v12 = a4;
  v13 = a2;
  WeakRetained = objc_loadWeakRetained(v10);
  objc_msgSend(WeakRetained, "uniqueIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = a5[1];
  v18[0] = *a5;
  v18[1] = v16;
  +[_UIViewServiceViewControllerOperator operatorWithRemoteViewControllerProxy:hostPID:hostBundleID:hostAuditToken:sessionIdentifier:](_UIViewServiceViewControllerOperator, "operatorWithRemoteViewControllerProxy:hostPID:hostBundleID:hostAuditToken:sessionIdentifier:", v13, a3, v12, v18, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "unregisterDeputyClass:", objc_opt_class());
  objc_msgSend(v17, "setDelegate:", WeakRetained);
  v11[2](v11, v17);

}

void __67___UIViewServiceSessionManager__registerSessionForDefaultDeputies___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  id *v8;
  void (**v9)(id, void *);
  id v10;
  void *v11;
  void *v12;
  id v13;
  id WeakRetained;

  v8 = (id *)(a1 + 32);
  v9 = a6;
  v10 = a2;
  WeakRetained = objc_loadWeakRetained(v8);
  objc_msgSend(WeakRetained, "uniqueIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIViewServiceTextEffectsOperator operatorWithRemoteViewControllerProxy:hostPID:sessionIdentifier:](_UIViewServiceTextEffectsOperator, "operatorWithRemoteViewControllerProxy:hostPID:sessionIdentifier:", v10, a3, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_loadWeakRetained(v8);
  objc_msgSend(v13, "unregisterDeputyClass:", objc_opt_class());

  v9[2](v9, v12);
}

void __63___UIViewServiceSessionManager__configureSessionForConnection___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObject:", WeakRetained);
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  }
  objc_msgSend(*(id *)(a1 + 32), "_startOrStopSystemsForBackgroundRunning");

}

uint64_t __71___UIViewServiceSessionManager__startOrStopSystemsForBackgroundRunning__block_invoke(uint64_t a1)
{
  uint64_t result;

  BSSetMainThreadPriorityFixedForUI();
  if (objc_msgSend(*(id *)(a1 + 32), "_hasActiveSessions"))
    return +[UIView _endSuspendingMotionEffectsForReason:](UIView, "_endSuspendingMotionEffectsForReason:", 0x1E175FE00);
  result = objc_msgSend((id)UIApp, "applicationState");
  if (result == 2)
    return +[UIView _beginSuspendingMotionEffectsForReason:](UIView, "_beginSuspendingMotionEffectsForReason:", 0x1E175FE00);
  return result;
}

@end
