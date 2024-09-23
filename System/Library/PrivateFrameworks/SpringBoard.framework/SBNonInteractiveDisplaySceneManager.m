@implementation SBNonInteractiveDisplaySceneManager

- (SBNonInteractiveDisplaySceneManager)initWithReference:(id)a3 sceneIdentityProvider:(id)a4 presentationBinder:(id)a5 snapshotBehavior:(unint64_t)a6
{
  SBNonInteractiveDisplaySceneManager *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBNonInteractiveDisplaySceneManager;
  v6 = -[SBSceneManager initWithReference:sceneIdentityProvider:presentationBinder:snapshotBehavior:](&v10, sel_initWithReference_sceneIdentityProvider_presentationBinder_snapshotBehavior_, a3, a4, a5, a6);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v6, sel__externalCoverSheetVisibilityDidPresent_, CFSTR("SBExternalDisplayCoverSheetDidPresent"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v6, sel__externalCoverSheetVisibilityDidDismiss_, CFSTR("SBExternalDisplayCoverSheetDidDismiss"), 0);

  }
  return v6;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("SBExternalDisplayCoverSheetDidPresent"), 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("SBExternalDisplayCoverSheetDidDismiss"), 0);

  v5.receiver = self;
  v5.super_class = (Class)SBNonInteractiveDisplaySceneManager;
  -[SBSceneManager dealloc](&v5, sel_dealloc);
}

- (BOOL)_shouldAutoHostScene:(id)a3
{
  return 1;
}

- (id)externalApplicationSceneHandles
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBNonInteractiveDisplaySceneManager;
  -[SBSceneManager externalApplicationSceneHandles](&v3, sel_externalApplicationSceneHandles);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isSuspendedUnderLock
{
  BSDispatchQueueAssertMain();
  return -[SBSuspendedUnderLockManager isSuspendedUnderLock](self->_lazy_suspendedUnderLockManager, "isSuspendedUnderLock");
}

- (void)setSuspendedUnderLock:(BOOL)a3
{
  -[SBNonInteractiveDisplaySceneManager setSuspendedUnderLock:alongsideWillChangeBlock:alongsideDidChangeBlock:](self, "setSuspendedUnderLock:alongsideWillChangeBlock:alongsideDidChangeBlock:", a3, 0, 0);
}

- (void)setSuspendedUnderLock:(BOOL)a3 alongsideWillChangeBlock:(id)a4 alongsideDidChangeBlock:(id)a5
{
  _BOOL8 v6;
  id v8;
  SBSuspendedUnderLockManager *lazy_suspendedUnderLockManager;
  SBSuspendedUnderLockManager *v10;
  void *v11;
  void *v12;
  SBSuspendedUnderLockManager *v13;
  SBSuspendedUnderLockManager *v14;
  id v15;

  v6 = a3;
  v15 = a4;
  v8 = a5;
  BSDispatchQueueAssertMain();
  lazy_suspendedUnderLockManager = self->_lazy_suspendedUnderLockManager;
  if (!lazy_suspendedUnderLockManager)
  {
    v10 = [SBSuspendedUnderLockManager alloc];
    +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "eventQueue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[SBSuspendedUnderLockManager initWithDelegate:eventQueue:](v10, "initWithDelegate:eventQueue:", self, v12);
    v14 = self->_lazy_suspendedUnderLockManager;
    self->_lazy_suspendedUnderLockManager = v13;

    lazy_suspendedUnderLockManager = self->_lazy_suspendedUnderLockManager;
  }
  -[SBSuspendedUnderLockManager setSuspendedUnderLock:alongsideWillChangeBlock:alongsideDidChangeBlock:](lazy_suspendedUnderLockManager, "setSuspendedUnderLock:alongsideWillChangeBlock:alongsideDidChangeBlock:", v6, v15, v8);

}

- (void)_externalCoverSheetVisibilityDidPresent:(id)a3
{
  -[SBNonInteractiveDisplaySceneManager setSuspendedUnderLock:](self, "setSuspendedUnderLock:", 1);
}

- (void)_externalCoverSheetVisibilityDidDismiss:(id)a3
{
  -[SBNonInteractiveDisplaySceneManager setSuspendedUnderLock:](self, "setSuspendedUnderLock:", 0);
}

- (id)suspendedUnderLockManagerDisplayConfiguration:(id)a3
{
  void *v3;
  void *v4;

  -[SBSceneManager displayIdentity](self, "displayIdentity", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)suspendedUnderLockManager:(id)a3 sceneHandleForScene:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBNonInteractiveDisplaySceneManager;
  -[SBSceneManager existingSceneHandleForScene:](&v5, sel_existingSceneHandleForScene_, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)suspendedUnderLockManager:(id)a3 shouldPreventUnderLockForScene:(id)a4
{
  return 0;
}

- (BOOL)suspendedUnderLockManager:(id)a3 shouldPreventSuspendUnderLockForScene:(id)a4 settings:(id)a5
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lazy_suspendedUnderLockManager, 0);
}

@end
